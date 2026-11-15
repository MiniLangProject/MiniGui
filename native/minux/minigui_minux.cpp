/* Copyright 2026 Nils Kopal. Apache-2.0.
 * MiniGui bridge to MinUX's native desktop snapshot/command protocol.
 * No toolkit callbacks enter managed code. Handles live until mg_shutdown.
 */
#include <errno.h>
#include <fcntl.h>
#include <poll.h>
#include <pthread.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <unistd.h>
#include <user/gui_protocol.h>

using namespace MinUX::user::gui;
static const int64_t INT32_MIN = -2147483647LL - 1;
static const int64_t INT32_MAX = 2147483647LL;
struct Node {
  Node *parent;
  int64_t id;
  int type, alive, visible, enabled, selected, value, minimum, maximum;
  int x, y, width, height, readonly;
  char kind[32], text[1024], columns[256];
  char **rows;
  int count, capacity;
};
static Node **nodes, *window, *modal_node;
static char *dialog_result;
static char cell_result[1024], text_result[1024];
static size_t count, capacity;
static GuiAppFrame frame;
static pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
static int dirty, failed;
static int64_t event_id, event_type, event_value, event_extra;
static char event_text[1024], input_line[4096];
static size_t input_length;
static int dropping_line;

static void text(char *out, size_t size, const char *value) {
  if (!size)
    return;
  size_t n = value ? strlen(value) : 0;
  if (n >= size)
    n = size - 1;
  if (n)
    memcpy(out, value, n);
  out[n] = 0;
  // Protocol records are line delimited. Never let text inject commands.
  for (size_t i = 0; i < n; i++)
    if (out[i] == '\r' || out[i] == '\n')
      out[i] = ' ';
}
static Node *valid(void *handle) {
  for (size_t i = 0; i < count; i++)
    if (nodes[i] == handle && nodes[i]->alive)
      return nodes[i];
  return 0;
}
static Node *find(uint32_t id) {
  for (size_t i = 0; i < count; i++)
    if (nodes[i]->alive && nodes[i]->id == id)
      return nodes[i];
  return 0;
}
static int kind(const char *name) {
  if (!strcmp(name, "Window"))
    return -1;
  if (!strcmp(name, "Label"))
    return GuiWidgetLabel;
  if (!strcmp(name, "Button"))
    return GuiWidgetButton;
  if (!strcmp(name, "TextBox"))
    return GuiWidgetTextBox;
  if (!strcmp(name, "CheckBox"))
    return GuiWidgetCheckbox;
  if (!strcmp(name, "ListBox") || !strcmp(name, "ListView"))
    return GuiWidgetListView;
  if (!strcmp(name, "TreeView"))
    return GuiWidgetTreeView;
  if (!strcmp(name, "ComboBox"))
    return GuiWidgetDropdown;
  if (!strcmp(name, "Panel") || !strcmp(name, "GroupBox"))
    return GuiWidgetPanel;
  if (!strcmp(name, "StatusBar"))
    return GuiWidgetStatusBar;
  if (!strcmp(name, "ProgressBar"))
    return GuiWidgetProgressBar;
  if (!strcmp(name, "Image") || !strcmp(name, "PictureBox") ||
      !strcmp(name, "VideoView"))
    return GuiWidgetImage;
  if (!strcmp(name, "ToolBar"))
    return GuiWidgetToolbar;
  if (!strcmp(name, "MenuBar"))
    return GuiWidgetMenuBar;
  if (!strcmp(name, "ContextMenu"))
    return GuiWidgetContextMenu;
  if (!strcmp(name, "Dialog"))
    return GuiWidgetDialog;
  return 0;
}
static int visible(Node *n) {
  for (; n; n = n->parent)
    if (!n->alive || !n->visible)
      return 0;
  return 1;
}
static int descendant(Node *n, Node *parent) {
  for (; n; n = n->parent)
    if (n == parent)
      return 1;
  return 0;
}
static int publish() {
  if (!dirty || !window || !window->alive || !window->visible)
    return !failed;
  // Allocations use libc; the SDK frame writer never grows these arrays.
  size_t items = 0;
  for (size_t i = 0; i < count; i++)
    if (nodes[i]->alive && visible(nodes[i]))
      items += nodes[i]->count;
  if (count > 4096 || items > 65536) {
    failed = 1;
    errno = EOVERFLOW;
    return 0;
  }
  if (frame.widgetCapacity < count) {
    void *p = realloc(frame.widgets, count * sizeof(GuiWidget));
    if (!p) {
      failed = 1;
      return 0;
    }
    frame.widgets = (GuiWidget *)p;
    frame.widgetCapacity = count;
  }
  if (frame.itemCapacity < items) {
    void *p = realloc(frame.items, items * sizeof(GuiWidgetItem));
    if (!p) {
      failed = 1;
      return 0;
    }
    frame.items = (GuiWidgetItem *)p;
    frame.itemCapacity = items;
  }
  guiInitializeFrame(&frame, window->text, 80, 25);
  frame.clientWidth = window->width;
  frame.clientHeight = window->height;
  for (size_t i = 0; i < count; i++) {
    Node *n = nodes[i];
    if (n == window || !visible(n))
      continue;
    int64_t x = n->x, y = n->y;
    for (Node *p = n->parent; p && p != window; p = p->parent) {
      x += p->x;
      y += p->y;
    }
    if (x < INT32_MIN || x > INT32_MAX || y < INT32_MIN || y > INT32_MAX) {
      failed = 1;
      return 0;
    }
    uint32_t flags =
        GuiWidgetVisible | (!n->enabled ? GuiWidgetDisabled : 0) |
        (n->readonly ? GuiWidgetReadOnly : 0) |
        (n->type == GuiWidgetCheckbox && n->value ? GuiWidgetChecked : 0);
    if (modal_node && !descendant(n, modal_node))
      flags |= GuiWidgetDisabled;
    GuiWidget *w =
        guiAddWidget(&frame, n->type, (uint32_t)n->id, x, y, n->width,
                     n->height, n->text, n->columns, flags);
    if (!w) {
      failed = 1;
      return 0;
    }
    w->value = n->type == GuiWidgetProgressBar && n->maximum > n->minimum
                   ? (int32_t)(((int64_t)n->value - n->minimum) * 100 /
                               ((int64_t)n->maximum - n->minimum))
                   : n->value;
    for (int j = 0; j < n->count; j++) {
      char row[1024];
      text(row, sizeof(row), n->rows[j]);
      char *detail = strchr(row, '\t'), *extra = 0;
      if (detail) {
        *detail++ = 0;
        extra = strchr(detail, '\t');
        if (extra)
          *extra++ = 0;
      }
      if (!guiAddItem(&frame, w, j, row, detail, extra,
                      n->selected == j ? GuiItemSelected : 0)) {
        failed = 1;
        return 0;
      }
    }
  }
  if (!guiSendSnapshotFd(1, &frame)) {
    failed = 1;
    return 0;
  }
  dirty = 0;
  return 1;
}

extern "C" int64_t mg_init() {
  pthread_mutex_lock(&mutex);
  int ok = !isatty(0) && !isatty(1);
  if (!ok)
    errno = ENOTTY;
  failed = 0;
  pthread_mutex_unlock(&mutex);
  return ok;
}
extern "C" void *mg_create(const char *name, void *parent, int64_t id,
                           const char *value, int64_t x, int64_t y,
                           int64_t width, int64_t height) {
  pthread_mutex_lock(&mutex);
  int type = name ? kind(name) : 0;
  Node *p = valid(parent), *n = 0;
  if (!type || (type == -1 && window && window->alive) || (type != -1 && !p) ||
      id <= 0 || id > INT32_MAX || find(id) || width < 0 || height < 0 ||
      width > 32767 || height > 32767 || x < INT32_MIN || x > INT32_MAX ||
      y < INT32_MIN || y > INT32_MAX || count >= 4096) {
    errno = ENOTSUP;
    goto done;
  }
  if (count == capacity) {
    size_t next = capacity ? capacity * 2 : 32;
    void *grown = realloc(nodes, next * sizeof(Node *));
    if (!grown)
      goto done;
    nodes = (Node **)grown;
    capacity = next;
  }
  n = (Node *)calloc(1, sizeof(Node));
  if (!n)
    goto done;
  n->parent = p;
  n->id = id;
  n->type = type;
  n->alive = n->visible = n->enabled = 1;
  n->x = x;
  n->y = y;
  n->width = width;
  n->height = height;
  n->selected = -1;
  n->maximum = 100;
  text(n->kind, sizeof(n->kind), name);
  text(n->text, sizeof(n->text), value);
  nodes[count++] = n;
  if (type == -1)
    window = n;
  dirty = 1;
done:
  pthread_mutex_unlock(&mutex);
  return n;
}
extern "C" int64_t mg_alive(void *handle) {
  pthread_mutex_lock(&mutex);
  int result = valid(handle) != 0;
  pthread_mutex_unlock(&mutex);
  return result;
}
extern "C" void mg_show(void *handle, int64_t show) {
  pthread_mutex_lock(&mutex);
  Node *n = valid(handle);
  if (n) {
    n->visible = show != 0;
    dirty = 1;
  }
  pthread_mutex_unlock(&mutex);
}
extern "C" void mg_destroy(void *handle) {
  pthread_mutex_lock(&mutex);
  Node *n = valid(handle);
  if (n)
    for (size_t i = 0; i < count; i++)
      for (Node *p = nodes[i]; p; p = p->parent)
        if (p == n) {
          nodes[i]->alive = 0;
          break;
        }
  dirty = 1;
  pthread_mutex_unlock(&mutex);
}
extern "C" void mg_bounds(void *handle, double x, double y, double width,
                          double height) {
  pthread_mutex_lock(&mutex);
  Node *n = valid(handle);
  if (n && x >= INT32_MIN && x <= INT32_MAX && y >= INT32_MIN &&
      y <= INT32_MAX && width >= 0 && width <= 32767 && height >= 0 &&
      height <= 32767) {
    n->x = x;
    n->y = y;
    n->width = width;
    n->height = height;
    dirty = 1;
  } else
    errno = EINVAL;
  pthread_mutex_unlock(&mutex);
}
extern "C" void mg_text(void *handle, const char *value) {
  pthread_mutex_lock(&mutex);
  Node *n = valid(handle);
  if (n) {
    text(n->text, sizeof(n->text), value);
    dirty = 1;
  }
  pthread_mutex_unlock(&mutex);
}
extern "C" const char *mg_get_text(void *handle) {
  pthread_mutex_lock(&mutex);
  Node *n = valid(handle);
  text(text_result, sizeof(text_result), n ? n->text : "");
  pthread_mutex_unlock(&mutex);
  return text_result;
}
extern "C" void mg_columns(void *handle, const char *value) {
  pthread_mutex_lock(&mutex);
  Node *n = valid(handle);
  if (n) {
    text(n->columns, sizeof(n->columns), value);
    dirty = 1;
  }
  pthread_mutex_unlock(&mutex);
}
static void clear(Node *n) {
  for (int i = 0; i < n->count; i++)
    free(n->rows[i]);
  n->count = 0;
  n->selected = -1;
  dirty = 1;
}
extern "C" void mg_clear(void *handle) {
  pthread_mutex_lock(&mutex);
  Node *n = valid(handle);
  if (n)
    clear(n);
  pthread_mutex_unlock(&mutex);
}
extern "C" void mg_add(void *handle, const char *row) {
  pthread_mutex_lock(&mutex);
  Node *n = valid(handle);
  if (n && row && n->count < 65536) {
    if (n->count == n->capacity) {
      int next = n->capacity ? n->capacity * 2 : 16;
      void *p = realloc(n->rows, next * sizeof(char *));
      if (!p)
        goto done;
      n->rows = (char **)p;
      n->capacity = next;
    }
    char *copy = strdup(row);
    if (!copy)
      goto done;
    n->rows[n->count++] = copy;
    dirty = 1;
  }
done:
  pthread_mutex_unlock(&mutex);
}
extern "C" int64_t mg_selection(void *handle, int64_t value, int64_t set) {
  pthread_mutex_lock(&mutex);
  Node *n = valid(handle);
  int result = -1;
  if (n) {
    if (set && value >= -1 && value < n->count) {
      n->selected = value;
      dirty = 1;
    }
    result = n->selected;
  }
  pthread_mutex_unlock(&mutex);
  return result;
}
extern "C" int64_t mg_value(void *handle, int64_t value, int64_t set) {
  pthread_mutex_lock(&mutex);
  Node *n = valid(handle);
  int result = 0;
  if (n) {
    if (set) {
      n->value = value < n->minimum   ? n->minimum
                 : value > n->maximum ? n->maximum
                                      : value;
      dirty = 1;
    }
    result = n->value;
  }
  pthread_mutex_unlock(&mutex);
  return result;
}
extern "C" void mg_range(void *handle, int64_t minimum, int64_t maximum,
                         int64_t step) {
  (void)step;
  pthread_mutex_lock(&mutex);
  Node *n = valid(handle);
  if (n && minimum >= INT32_MIN && maximum <= INT32_MAX && minimum < maximum) {
    n->minimum = minimum;
    n->maximum = maximum;
    dirty = 1;
  }
  pthread_mutex_unlock(&mutex);
}
extern "C" int64_t mg_property(void *handle, const char *key, const char *value,
                               int64_t number) {
  pthread_mutex_lock(&mutex);
  Node *n = valid(handle);
  int result = 0;
  if (n && key) {
    if (!strcmp(key, "enabled")) {
      n->enabled = number != 0;
      result = 1;
    } else if (!strcmp(key, "readOnly")) {
      n->readonly = number != 0;
      result = 1;
    } else if (!strcmp(key, "image") || !strcmp(key, "source")) {
      text(n->text, sizeof(n->text), value);
      result = 1;
    } else
      errno = ENOTSUP;
    if (result)
      dirty = 1;
  }
  pthread_mutex_unlock(&mutex);
  return result;
}
/* A video frame is a regular BMP decoded by the existing native desktop.
 * This entry is also the stable attachment boundary for std.video. */
extern "C" int mg_present_bmp(void *handle, const char *path) {
  pthread_mutex_lock(&mutex);
  Node *n = valid(handle);
  int result = 0;
  if (n && n->type == GuiWidgetImage) {
    text(n->text, sizeof(n->text), path);
    dirty = 1;
    result = publish();
  }
  pthread_mutex_unlock(&mutex);
  return result;
}
extern "C" int mg_video_target(void *handle) {
  pthread_mutex_lock(&mutex);
  Node *n = valid(handle);
  int ok = n && n->type == GuiWidgetImage;
  pthread_mutex_unlock(&mutex);
  return ok;
}
extern "C" void mg_draw(void *, int64_t, double, double, double, double,
                        const char *, const char *) {
  errno = ENOTSUP;
}
extern "C" int64_t mg_format(void *, int64_t, int64_t, const char *, int64_t,
                             int64_t) {
  errno = ENOTSUP;
  return 0;
}
extern "C" const char *mg_cell(void *handle, int64_t row, int64_t column,
                               const char *value, int64_t set) {
  pthread_mutex_lock(&mutex);
  Node *n = valid(handle);
  cell_result[0] = 0;
  if (n && row >= 0 && row < n->count && column >= 0 && column < 128) {
    const char *start = n->rows[row];
    int64_t index = 0;
    while (*start && index < column) {
      if (*start++ == '\t')
        index++;
    }
    if (index == column) {
      const char *end = strchr(start, '\t');
      if (!end)
        end = start + strlen(start);
      if (set && value && strlen(value) < 65536) {
        size_t prefix = start - n->rows[row], suffix = strlen(end),
               size = prefix + strlen(value) + suffix + 1;
        char *next = (char *)malloc(size);
        if (next) {
          memcpy(next, n->rows[row], prefix);
          strcpy(next + prefix, value);
          strcpy(next + prefix + strlen(value), end);
          free(n->rows[row]);
          n->rows[row] = next;
          dirty = 1;
          text(cell_result, sizeof(cell_result), value);
        }
      } else {
        size_t size = end - start;
        if (size >= sizeof(cell_result))
          size = sizeof(cell_result) - 1;
        memcpy(cell_result, start, size);
        cell_result[size] = 0;
      }
    }
  }
  pthread_mutex_unlock(&mutex);
  return cell_result;
}
extern "C" int64_t mg_poll(int64_t);
extern "C" void mg_modal(void *handle, void *, int64_t enabled) {
  pthread_mutex_lock(&mutex);
  Node *n = valid(handle);
  modal_node = enabled ? n : 0;
  dirty = 1;
  pthread_mutex_unlock(&mutex);
}
static int64_t dialog(void *parent, const char *title, const char *message,
                      const char *buttons, int input, const char *initial) {
  Node *owner = valid(parent);
  if (!owner)
    owner = window;
  if (!owner)
    return 0;
  Node *previous = modal_node;
  const int64_t base = 0x7fff0000;
  Node *panel = (Node *)mg_create("Dialog", owner, base, title, 20, 20, 440,
                                  input ? 160 : 130);
  if (!panel)
    return 0;
  Node *label =
      (Node *)mg_create("Label", panel, base + 1, message, 12, 24, 410, 32);
  Node *entry = input ? (Node *)mg_create("TextBox", panel, base + 2, initial,
                                          12, 62, 410, 26)
                      : 0;
  const char *names[3] = {"OK", "Cancel", 0};
  int codes[3] = {1, 2, 0}, number = 1;
  if (!strcmp(buttons, "okCancel"))
    number = 2;
  else if (!strcmp(buttons, "yesNo") || !strcmp(buttons, "yesNoCancel")) {
    names[0] = "Yes";
    names[1] = "No";
    names[2] = "Cancel";
    codes[0] = 6;
    codes[1] = 7;
    codes[2] = 2;
    number = !strcmp(buttons, "yesNo") ? 2 : 3;
  } else if (!strcmp(buttons, "retryCancel")) {
    names[0] = "Retry";
    codes[0] = 4;
    number = 2;
  } else if (!strcmp(buttons, "abortRetryIgnore")) {
    names[0] = "Abort";
    names[1] = "Retry";
    names[2] = "Ignore";
    codes[0] = 3;
    codes[1] = 4;
    codes[2] = 5;
    number = 3;
  }
  int ok = label && (!input || entry);
  for (int i = 0; i < number; i++)
    if (!mg_create("Button", panel, base + 10 + i, names[i], 12 + i * 110,
                   input ? 112 : 82, 100, 28))
      ok = 0;
  int result = 2;
  mg_modal(panel, owner, 1);
  while (ok) {
    int kind = mg_poll(1);
    if (!kind)
      break;
    if (kind == 5)
      break;
    if (kind == 1 && event_id >= base + 10 && event_id < base + 10 + number) {
      result = codes[event_id - base - 10];
      break;
    }
  }
  free(dialog_result);
  dialog_result = 0;
  if (input && result == 1 && entry)
    dialog_result = strdup(entry->text);
  mg_destroy(panel);
  mg_modal(previous, owner, previous != 0);
  return result;
}
extern "C" int64_t mg_message(void *parent, const char *title,
                              const char *message, const char *buttons,
                              const char *) {
  return dialog(parent, title ? title : "Message", message ? message : "",
                buttons ? buttons : "ok", 0, "");
}
extern "C" const char *mg_dialog(void *parent, int64_t kind, const char *title,
                                 const char *initial) {
  if (kind < 0 || kind > 3) {
    errno = ENOTSUP;
    return "";
  }
  const char *prompt = kind == 3 ? "Enter a color as #RRGGBB"
                                 : "Enter the full file or directory path";
  if (dialog(parent, title ? title : "Select", prompt, "okCancel", 1,
             kind == 3 && initial ? initial : "") != 1 ||
      !dialog_result)
    return "";
  int valid = 1;
  if (kind == 0 || kind == 2) {
    struct stat info = {};
    valid = stat(dialog_result, &info) == 0 &&
            (kind == 2 ? S_ISDIR(info.st_mode) : S_ISREG(info.st_mode));
  }
  if (kind == 3) {
    valid = strlen(dialog_result) == 7 && dialog_result[0] == '#';
    for (int i = 1; i < 7 && valid; i++) {
      char c = dialog_result[i];
      valid = (c >= '0' && c <= '9') || (c >= 'a' && c <= 'f') ||
              (c >= 'A' && c <= 'F');
    }
  }
  if (!valid) {
    errno = EINVAL;
    return "";
  }
  return dialog_result;
}

static int command(const char *line) {
  GuiCommand c;
  if (!guiParseCommandLine(line, &c))
    return 0;
  Node *n = find(c.targetId);
  if (n && (!n->enabled || (n->readonly && c.type == GuiCommandTextInput)))
    return 0;
  event_type = 0;
  event_value = event_extra = 0;
  event_text[0] = 0;
  if (c.type == GuiCommandClose) {
    n = modal_node ? modal_node : window;
    event_type = 5;
  } else if (c.type == GuiCommandFocus) {
    n = window;
    event_type = 7;
  } else if (c.type == GuiCommandBlur) {
    n = window;
    event_type = 8;
  } else if (c.type == GuiCommandResize) {
    n = window;
    event_type = 6;
    event_value = c.value;
    event_extra = c.value1;
    if (n && c.value > 0 && c.value1 > 0) {
      n->width = c.value;
      n->height = c.value1;
      dirty = 1;
    }
  } else if (c.type == GuiCommandActivate || c.type == GuiCommandDoubleClick) {
    event_type = 1;
    event_value = c.value;
  } else if (c.type == GuiCommandSelect && n && c.value >= -1 &&
             c.value < n->count) {
    n->selected = c.value;
    event_type = 3;
    event_value = c.value;
    dirty = 1;
  } else if ((c.type == GuiCommandToggle || c.type == GuiCommandScroll) && n) {
    n->value = c.value;
    event_type = 4;
    event_value = c.value;
    dirty = 1;
  } else if (c.type == GuiCommandTextInput && n) {
    text(n->text, sizeof(n->text), c.text);
    event_type = 2;
    dirty = 1;
  } else if (c.type == GuiCommandRefresh) {
    dirty = 1;
  }
  if (!n)
    event_type = 0;
  if (modal_node && n && !descendant(n, modal_node))
    event_type = 0;
  if (event_type) {
    event_id = n->id;
    text(event_text, sizeof(event_text), c.text);
  }
  return event_type;
}
extern "C" int64_t mg_poll(int64_t wait) {
  for (;;) {
    pthread_mutex_lock(&mutex);
    int ok = publish();
    pthread_mutex_unlock(&mutex);
    if (!ok)
      return 0;
    struct pollfd p = {0, POLLIN, 0};
    int result = poll(&p, 1, wait ? -1 : 0);
    if (result < 0 && errno == EINTR)
      continue;
    if (result <= 0)
      return 0;
    if (p.revents & (POLLHUP | POLLERR | POLLNVAL)) {
      pthread_mutex_lock(&mutex);
      event_id = window ? window->id : 0;
      event_type = 5;
      pthread_mutex_unlock(&mutex);
      return 5;
    }
    char ch;
    ssize_t n = read(0, &ch, 1);
    if (n <= 0)
      return 0;
    if (ch == '\r')
      continue;
    if (ch == '\n') {
      input_line[input_length] = 0;
      pthread_mutex_lock(&mutex);
      int result = dropping_line ? 0 : command(input_line);
      pthread_mutex_unlock(&mutex);
      input_length = 0;
      dropping_line = 0;
      if (result)
        return result;
    } else if (input_length + 1 < sizeof(input_line) && !dropping_line)
      input_line[input_length++] = ch;
    else {
      dropping_line = 1;
      input_length = 0;
    }
  }
}
extern "C" int64_t mg_event(int64_t field) {
  return field == 0   ? event_id
         : field == 1 ? event_value
         : field == 2 ? event_extra
                      : 0;
}
extern "C" const char *mg_event_text() { return event_text; }
extern "C" void mg_shutdown() {
  pthread_mutex_lock(&mutex);
  for (size_t i = 0; i < count; i++) {
    clear(nodes[i]);
    free(nodes[i]->rows);
    free(nodes[i]);
  }
  free(nodes);
  free(frame.widgets);
  free(frame.items);
  free(dialog_result);
  dialog_result = 0;
  modal_node = 0;
  nodes = 0;
  window = 0;
  count = capacity = 0;
  memset(&frame, 0, sizeof(frame));
  input_length = 0;
  dropping_line = 0;
  dirty = failed = 0;
  pthread_mutex_unlock(&mutex);
}
