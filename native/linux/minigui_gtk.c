// SPDX-License-Identifier: Apache-2.0
// GTK owns widgets. Nodes live until shutdown so queued event IDs never dangle.
#include <gtk/gtk.h>
#include <gtksourceview/gtksource.h>
#include <libayatana-appindicator/app-indicator.h>
#include <math.h>
#include <stdint.h>
#include <string.h>
#include <webkit2/webkit2.h>

// Fixed coordinates must not feed child resize requests back into window size.
// ScrollViewer deliberately uses ordinary GtkFixed for its scrollable extent.
typedef struct {
  GtkFixed parent;
} MiniGuiFixed;
typedef struct {
  GtkFixedClass parent;
} MiniGuiFixedClass;
G_DEFINE_TYPE(MiniGuiFixed, minigui_fixed, GTK_TYPE_FIXED)
static void fixed_preferred(GtkWidget *widget, gint *minimum, gint *natural) {
  *minimum = 1;
  *natural = 1;
}
static void minigui_fixed_class_init(MiniGuiFixedClass *klass) {
  GTK_WIDGET_CLASS(klass)->get_preferred_width = fixed_preferred;
  GTK_WIDGET_CLASS(klass)->get_preferred_height = fixed_preferred;
}
static void minigui_fixed_init(MiniGuiFixed *self) {}
static GtkWidget *fixed_new(void) {
  return g_object_new(minigui_fixed_get_type(), NULL);
}

typedef struct Node Node;
struct Node {
  GtkWidget *widget, *host, *mount;
  GtkListStore *store;
  GtkTreeStore *tree;
  GtkTreeIter ancestors[128];
  AppIndicator *tray;
  char *kind, *cache, *filter;
  GPtrArray *rows, *drawing;
  Node *parent;
  int64_t id;
  double minimum, maximum;
  double drag_base, drag_value;
  int columns, selected, muted, editable, alive, page, tab_index;
};
typedef struct {
  int64_t id, type, value, extra;
  char *text;
} Event;
static GPtrArray *nodes;
static GQueue queue = G_QUEUE_INIT;
static Event *current;
static char *dialog_result;
static gboolean is(Node *n, const char *kind) {
  return n && !strcmp(n->kind, kind);
}
static void push(Node *n, int type, int64_t value, int64_t extra,
                 const char *text) {
  if (!n || n->muted || !n->alive)
    return;
  Event *tail = g_queue_peek_tail(&queue);
  if (tail && tail->id == n->id && tail->type == type &&
      (type == 2 || type == 4 || type == 6)) {
    tail->value = value;
    tail->extra = extra;
    g_free(tail->text);
    tail->text = g_strdup(text ? text : "");
    return;
  }
  Event *e = g_new0(Event, 1);
  *e = (Event){n->id, type, value, extra, g_strdup(text ? text : "")};
  g_queue_push_tail(&queue, e);
}
static void event_free(Event *e) {
  if (e) {
    g_free(e->text);
    g_free(e);
  }
}
static void clicked(GtkWidget *w, Node *n) { push(n, 1, 0, 0, ""); }
static void changed(GtkWidget *w, Node *n) { push(n, 2, 0, 0, ""); }
static void highlight_minilang(Node *n) {
  if (!is(n, "CodeEditor") || !n->filter || strcmp(n->filter, "minilang"))
    return;
  GtkTextBuffer *b = gtk_text_view_get_buffer(GTK_TEXT_VIEW(n->widget));
  GtkTextIter a, z;
  gtk_text_buffer_get_bounds(b, &a, &z);
  GtkTextTagTable *table = gtk_text_buffer_get_tag_table(b);
  GtkTextTag *kw = gtk_text_tag_table_lookup(table, "mg-keyword");
  if (!kw)
    kw = gtk_text_buffer_create_tag(b, "mg-keyword", "foreground", "#3750b9",
                                    NULL);
  GtkTextTag *comment = gtk_text_tag_table_lookup(table, "mg-comment");
  if (!comment)
    comment = gtk_text_buffer_create_tag(b, "mg-comment", "foreground",
                                         "#288241", NULL);
  GtkTextTag *string = gtk_text_tag_table_lookup(table, "mg-string");
  if (!string)
    string = gtk_text_buffer_create_tag(b, "mg-string", "foreground", "#a03c28",
                                        NULL);
  gtk_text_buffer_remove_all_tags(b, &a, &z);
  char *text = gtk_text_buffer_get_text(b, &a, &z, TRUE);
  GRegex *rx = g_regex_new("\"(?:\\\\.|[^\"\\\\])*\"|//"
                           "[^\\n]*|\\b(?:function|end|if|then|else|for|each|"
                           "in|while|return|print|import|package|struct|static|"
                           "const|global|true|false|void|as|and|or|not)\\b",
                           0, 0, NULL);
  GMatchInfo *matches;
  g_regex_match(rx, text, 0, &matches);
  while (g_match_info_matches(matches)) {
    int start, end;
    g_match_info_fetch_pos(matches, 0, &start, &end);
    gtk_text_buffer_get_iter_at_offset(
        b, &a, g_utf8_pointer_to_offset(text, text + start));
    gtk_text_buffer_get_iter_at_offset(
        b, &z, g_utf8_pointer_to_offset(text, text + end));
    gtk_text_buffer_apply_tag(b,
                              text[start] == '"'   ? string
                              : text[start] == '/' ? comment
                                                   : kw,
                              &a, &z);
    g_match_info_next(matches, NULL);
  }
  g_match_info_free(matches);
  g_regex_unref(rx);
  g_free(text);
}
static void buffer_changed(GtkTextBuffer *b, Node *n) {
  highlight_minilang(n);
  changed(NULL, n);
}
static void selected(GtkComboBox *w, Node *n) {
  push(n, 3, gtk_combo_box_get_active(w), 0, "");
}
static void range_changed(GtkRange *w, Node *n) {
  push(n, 4, (int64_t)gtk_range_get_value(w), 0, "");
}
static void spin_changed(GtkSpinButton *w, Node *n) {
  push(n, 4, gtk_spin_button_get_value_as_int(w), 0, "");
}
static void toggle_changed(GtkToggleButton *w, Node *n) {
  push(n, 4, gtk_toggle_button_get_active(w), 0, "");
}
static gboolean close_request(GtkWidget *w, GdkEvent *e, Node *n) {
  push(n, 5, 0, 0, "");
  return TRUE;
}
static void destroyed(GtkWidget *w, Node *n) { n->alive = 0; }
static gboolean focus_event(GtkWidget *w, GdkEventFocus *e, Node *n) {
  push(n, e->in ? 7 : 8, 0, 0, "");
  return FALSE;
}
static void resized(GtkWidget *w, GtkAllocation *a, Node *n) {
  push(n, 6, a->width, a->height, "");
}
static gboolean context_popup(GtkWidget *w, GdkEventButton *event, Node *n) {
  if (event->button != 3)
    return FALSE;
  gtk_menu_popup_at_pointer(GTK_MENU(n->widget), (GdkEvent *)event);
  return TRUE;
}
static void date_selected(GtkCalendar *calendar, Node *n) {
  guint y, m, d;
  gtk_calendar_get_date(calendar, &y, &m, &d);
  char *text = g_strdup_printf("%04u-%02u-%02u", y, m + 1, d);
  if (is(n, "DateTimePicker")) {
    const char *old = gtk_entry_get_text(GTK_ENTRY(n->widget));
    char *combined =
        g_strconcat(text, strlen(old) > 10 ? old + 10 : " 00:00:00", NULL);
    gtk_entry_set_text(GTK_ENTRY(n->widget), combined);
    g_free(combined);
  } else
    gtk_entry_set_text(GTK_ENTRY(n->widget), text);
  g_free(text);
}
static void date_popup(GtkEntry *entry, GtkEntryIconPosition icon,
                       GdkEvent *event, Node *n) {
  GtkWidget *popover = g_object_get_data(G_OBJECT(entry), "minigui-calendar");
  if (!popover) {
    popover = gtk_popover_new(GTK_WIDGET(entry));
    GtkWidget *calendar = gtk_calendar_new();
    gtk_container_add(GTK_CONTAINER(popover), calendar);
    g_signal_connect(calendar, "day-selected", G_CALLBACK(date_selected), n);
    g_object_set_data(G_OBJECT(entry), "minigui-calendar", popover);
  }
  gtk_widget_show_all(popover);
  gtk_popover_popup(GTK_POPOVER(popover));
}
static void split_begin(GtkGestureDrag *gesture, double x, double y, Node *n) {
  n->drag_base = n->drag_value;
}
static void split_drag(GtkGestureDrag *gesture, double dx, double dy, Node *n) {
  const char *axis = g_object_get_data(G_OBJECT(n->widget), "minigui-axis");
  n->drag_value = n->drag_base + (axis && !strcmp(axis, "vertical") ? dx : dy);
  push(n, 4, (int64_t)n->drag_value, 0, "");
}
static void page_changed(GtkNotebook *w, GtkWidget *p, guint index, Node *n) {
  push(n, 3, index, 0, "");
}
static void menu_clicked(GtkWidget *w, Node *n) {
  push(n, 1, GPOINTER_TO_INT(g_object_get_data(G_OBJECT(w), "index")), 0,
       gtk_menu_item_get_label(GTK_MENU_ITEM(w)));
}
static void tree_selected(GtkTreeSelection *s, Node *n) {
  GtkTreeModel *m;
  GtkTreeIter it;
  if (!gtk_tree_selection_get_selected(s, &m, &it)) {
    push(n, 3, -1, 0, "");
    return;
  }
  GtkTreePath *p = gtk_tree_model_get_path(m, &it);
  char *t = NULL;
  gtk_tree_model_get(m, &it, 0, &t, -1);
  int *idx = gtk_tree_path_get_indices(p);
  push(n, 3, idx ? idx[0] : -1, 0, t);
  g_free(t);
  gtk_tree_path_free(p);
}
static void edited(GtkCellRendererText *r, char *path, char *text, Node *n) {
  int col = GPOINTER_TO_INT(g_object_get_data(G_OBJECT(r), "column"));
  GtkTreeIter it;
  if (gtk_tree_model_get_iter_from_string(GTK_TREE_MODEL(n->store), &it,
                                          path)) {
    gtk_list_store_set(n->store, &it, col, text, -1);
    push(n, 9, atoi(path), col, text);
  }
}
static void web_loaded(WebKitWebView *w, WebKitLoadEvent e, Node *n) {
  if (e == WEBKIT_LOAD_FINISHED)
    push(n, 10, 1, 0, webkit_web_view_get_uri(w));
}
static gboolean web_failed(WebKitWebView *w, WebKitLoadEvent e, const char *uri,
                           GError *error, Node *n) {
  push(n, 10, 0, error->code, error->message);
  return FALSE;
}
typedef struct {
  int op;
  double x, y, w, h;
  GdkRGBA color;
  char *text;
} Draw;
static void draw_free(gpointer p) {
  Draw *d = p;
  g_free(d->text);
  g_free(d);
}
static gboolean draw(GtkWidget *w, cairo_t *cr, Node *n) {
  if (!n->drawing)
    return FALSE;
  for (guint i = 0; i < n->drawing->len; ++i) {
    Draw *d = g_ptr_array_index(n->drawing, i);
    gdk_cairo_set_source_rgba(cr, &d->color);
    if (d->op == 1) {
      cairo_move_to(cr, d->x, d->y);
      cairo_line_to(cr, d->w, d->h);
      cairo_stroke(cr);
    }
    if (d->op == 2) {
      cairo_rectangle(cr, d->x, d->y, d->w, d->h);
      cairo_fill(cr);
    }
    if (d->op == 3) {
      cairo_move_to(cr, d->x, d->y);
      cairo_show_text(cr, d->text);
    }
  }
  return FALSE;
}
static GtkWidget *scrolled(GtkWidget *child) {
  GtkWidget *w = gtk_scrolled_window_new(NULL, NULL);
  gtk_scrolled_window_set_policy(GTK_SCROLLED_WINDOW(w), GTK_POLICY_AUTOMATIC,
                                 GTK_POLICY_AUTOMATIC);
  gtk_container_add(GTK_CONTAINER(w), child);
  return w;
}
int64_t mg_init(void) {
  if (nodes)
    return 1;
  if (!gtk_init_check(NULL, NULL))
    return 0;
  nodes = g_ptr_array_new();
  return 1;
}
Node *mg_create(const char *kind, Node *parent, int64_t id, const char *text,
                int64_t x, int64_t y, int64_t width, int64_t height) {
  if (!nodes && !mg_init())
    return NULL;
  Node *n = g_new0(Node, 1);
  n->kind = g_strdup(kind);
  n->id = id;
  n->parent = parent;
  n->alive = 1;
  n->selected = -1;
  n->maximum = 100;
  n->rows = g_ptr_array_new_with_free_func(g_free);
  n->drawing = g_ptr_array_new_with_free_func(draw_free);
  GtkWidget *w = NULL;
  if (is(n, "Window")) {
    w = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_title(GTK_WINDOW(w), text);
    gtk_window_set_default_size(GTK_WINDOW(w), width, height);
    n->host = is(n, "ScrollViewer") ? gtk_fixed_new() : fixed_new();
    gtk_container_add(GTK_CONTAINER(w), n->host);
    g_signal_connect(w, "delete-event", G_CALLBACK(close_request), n);
    g_signal_connect(n->host, "size-allocate", G_CALLBACK(resized), n);
  } else if (is(n, "Panel") || is(n, "ScrollViewer") || is(n, "GroupBox")) {
    n->host = is(n, "ScrollViewer") ? gtk_fixed_new() : fixed_new();
    w = n->host;
    if (is(n, "GroupBox")) {
      w = gtk_frame_new(text);
      gtk_container_add(GTK_CONTAINER(w), n->host);
    } else if (is(n, "ScrollViewer"))
      w = scrolled(n->host);
  } else if (is(n, "Label") || is(n, "StatusBar")) {
    w = gtk_label_new(text);
    gtk_label_set_xalign(GTK_LABEL(w), 0);
  } else if (is(n, "Button") || is(n, "FilePicker") || is(n, "FolderPicker") ||
             is(n, "ColorPicker")) {
    w = gtk_button_new_with_label(text);
    g_signal_connect(w, "clicked", G_CALLBACK(clicked), n);
  } else if (is(n, "CheckBox") || is(n, "ToggleSwitch") ||
             is(n, "RadioButton")) {
    w = is(n, "RadioButton") ? gtk_radio_button_new_with_label(NULL, text)
                             : gtk_check_button_new_with_label(text);
    if (is(n, "RadioButton") && parent) {
      for (guint i = 0; i < nodes->len; i++) {
        Node *other = g_ptr_array_index(nodes, i);
        if (other->parent == parent && is(other, "RadioButton") &&
            other->alive) {
          gtk_radio_button_join_group(GTK_RADIO_BUTTON(w),
                                      GTK_RADIO_BUTTON(other->widget));
          break;
        }
      }
    }
    g_signal_connect(w, "clicked", G_CALLBACK(clicked), n);
    g_signal_connect(w, "toggled", G_CALLBACK(toggle_changed), n);
  } else if (is(n, "TextArea") || is(n, "RichTextBox") || is(n, "CodeEditor")) {
    w = is(n, "CodeEditor") ? gtk_source_view_new() : gtk_text_view_new();
    if (is(n, "CodeEditor")) {
      gtk_source_view_set_show_line_numbers(GTK_SOURCE_VIEW(w), TRUE);
      gtk_source_view_set_auto_indent(GTK_SOURCE_VIEW(w), TRUE);
      gtk_text_view_set_monospace(GTK_TEXT_VIEW(w), TRUE);
    }
    gtk_text_buffer_set_text(gtk_text_view_get_buffer(GTK_TEXT_VIEW(w)), text,
                             -1);
    g_signal_connect(gtk_text_view_get_buffer(GTK_TEXT_VIEW(w)), "changed",
                     G_CALLBACK(buffer_changed), n);
    n->mount = scrolled(w);
  } else if (is(n, "NumberBox") || is(n, "SpinBox")) {
    w = gtk_spin_button_new_with_range(0, 100, 1);
    g_signal_connect(w, "value-changed", G_CALLBACK(spin_changed), n);
  } else if (is(n, "ComboBox") || is(n, "EditableComboBox")) {
    w = is(n, "EditableComboBox") ? gtk_combo_box_text_new_with_entry()
                                  : gtk_combo_box_text_new();
    g_signal_connect(w, "changed", G_CALLBACK(selected), n);
  } else if (is(n, "Slider") || is(n, "ScrollBar")) {
    w = is(n, "Slider")
            ? gtk_scale_new_with_range(GTK_ORIENTATION_HORIZONTAL, 0, 100, 1)
            : gtk_scrollbar_new(GTK_ORIENTATION_VERTICAL, NULL);
    g_signal_connect(w, "value-changed", G_CALLBACK(range_changed), n);
  } else if (is(n, "ProgressBar"))
    w = gtk_progress_bar_new();
  else if (is(n, "TabControl")) {
    w = gtk_notebook_new();
    g_signal_connect(w, "switch-page", G_CALLBACK(page_changed), n);
  } else if (is(n, "TreeView") || is(n, "ListView") || is(n, "DataGrid") ||
             is(n, "PropertyGrid") || is(n, "ListBox")) {
    w = gtk_tree_view_new();
    g_signal_connect(gtk_tree_view_get_selection(GTK_TREE_VIEW(w)), "changed",
                     G_CALLBACK(tree_selected), n);
    n->mount = scrolled(w);
  } else if (is(n, "MenuBar") || is(n, "ToolBar"))
    w = gtk_menu_bar_new();
  else if (is(n, "ContextMenu") || is(n, "TrayIcon")) {
    w = gtk_menu_new();
    if (is(n, "TrayIcon")) {
      char name[64];
      g_snprintf(name, sizeof name, "minigui-%lld", (long long)id);
      n->tray = app_indicator_new(name, "application-x-executable",
                                  APP_INDICATOR_CATEGORY_APPLICATION_STATUS);
      app_indicator_set_title(n->tray, text);
      app_indicator_set_menu(n->tray, GTK_MENU(w));
      app_indicator_set_status(n->tray, APP_INDICATOR_STATUS_ACTIVE);
    }
  } else if (is(n, "Calendar")) {
    w = gtk_calendar_new();
    g_signal_connect(w, "day-selected", G_CALLBACK(changed), n);
  } else if (is(n, "Image"))
    w = gtk_image_new();
  else if (is(n, "Splitter")) {
    w = gtk_event_box_new();
    gtk_container_add(GTK_CONTAINER(w),
                      gtk_separator_new(GTK_ORIENTATION_HORIZONTAL));
    GtkGesture *drag = gtk_gesture_drag_new(w);
    g_signal_connect(drag, "drag-begin", G_CALLBACK(split_begin), n);
    g_signal_connect(drag, "drag-update", G_CALLBACK(split_drag), n);
    g_signal_connect(drag, "drag-end", G_CALLBACK(split_drag), n);
  } else if (is(n, "Separator"))
    w = gtk_separator_new(GTK_ORIENTATION_HORIZONTAL);
  else if (is(n, "LinkLabel"))
    w = gtk_link_button_new_with_label("about:blank", text);
  else if (is(n, "WebView")) {
    w = webkit_web_view_new();
    g_signal_connect(w, "load-changed", G_CALLBACK(web_loaded), n);
    g_signal_connect(w, "load-failed", G_CALLBACK(web_failed), n);
  } else if (is(n, "DrawingCanvas") || is(n, "Chart")) {
    w = gtk_drawing_area_new();
    g_signal_connect(w, "draw", G_CALLBACK(draw), n);
  } else {
    w = gtk_entry_new();
    gtk_entry_set_text(GTK_ENTRY(w), text);
    if (is(n, "DatePicker") || is(n, "DateTimePicker")) {
      gtk_entry_set_icon_from_icon_name(GTK_ENTRY(w), GTK_ENTRY_ICON_SECONDARY,
                                        "x-office-calendar");
      gtk_entry_set_placeholder_text(GTK_ENTRY(w), is(n, "DatePicker")
                                                       ? "YYYY-MM-DD"
                                                       : "YYYY-MM-DD HH:MM:SS");
      g_signal_connect(w, "icon-press", G_CALLBACK(date_popup), n);
    }
    if (is(n, "TimePicker"))
      gtk_entry_set_placeholder_text(GTK_ENTRY(w), "HH:MM:SS");

    if (is(n, "PasswordBox"))
      gtk_entry_set_visibility(GTK_ENTRY(w), FALSE);
    g_signal_connect(w, "changed", G_CALLBACK(changed), n);
  }
  n->widget = w;
  if (!n->mount)
    n->mount = w;
  g_signal_connect(w, "destroy", G_CALLBACK(destroyed), n);
  g_signal_connect(w, "focus-in-event", G_CALLBACK(focus_event), n);
  g_signal_connect(w, "focus-out-event", G_CALLBACK(focus_event), n);
  if (parent && is(parent, "TabControl")) {
    GtkWidget *page =
        gtk_notebook_get_nth_page(GTK_NOTEBOOK(parent->widget), parent->page++);
    if (page)
      parent->host = page;
    x = 0;
    y = 0;
  }
  if (parent && parent->host && !is(n, "ContextMenu") && !is(n, "TrayIcon")) {
    gtk_fixed_put(GTK_FIXED(parent->host), n->mount, x, y);
    gtk_widget_set_size_request(n->mount, MAX(1, width), MAX(1, height));
    gtk_widget_show_all(n->mount);
  }
  if (is(n, "ContextMenu") && parent) {
    gtk_widget_add_events(parent->widget, GDK_BUTTON_PRESS_MASK);
    g_signal_connect(parent->widget, "button-press-event",
                     G_CALLBACK(context_popup), n);
  }
  g_ptr_array_add(nodes, n);
  return n;
}
int64_t mg_alive(Node *n) { return n && n->alive; }
void mg_show(Node *n, int64_t show) {
  if (!mg_alive(n))
    return;
  if (n->tray) {
    app_indicator_set_status(n->tray, show ? APP_INDICATOR_STATUS_ACTIVE
                                           : APP_INDICATOR_STATUS_PASSIVE);
    return;
  }
  gtk_widget_set_no_show_all(n->mount, !show);
  if (show)
    gtk_widget_show_all(n->mount);
  else
    gtk_widget_hide(n->mount);
}
void mg_destroy(Node *n) {
  if (mg_alive(n)) {
    if (n->tray)
      app_indicator_set_status(n->tray, APP_INDICATOR_STATUS_PASSIVE);
    gtk_widget_destroy(n->mount);
  }
}
void mg_bounds(Node *n, double x, double y, double w, double h) {
  if (g_getenv("MINIGUI_TRACE_LAYOUT"))
    g_printerr("%s %.1f %.1f %.1f %.1f\n", n->kind, x, y, w, h);
  if (!mg_alive(n))
    return;
  if (is(n, "Window"))
    gtk_window_resize(GTK_WINDOW(n->widget), MAX(w, 1), MAX(h, 1));
  else {
    if (GTK_IS_FIXED(gtk_widget_get_parent(n->mount)))
      gtk_fixed_move(GTK_FIXED(gtk_widget_get_parent(n->mount)), n->mount, x,
                     y);
    gtk_widget_set_size_request(n->mount, MAX(w, 1), MAX(h, 1));
  }
}
void mg_text(Node *n, const char *s) {
  if (!mg_alive(n))
    return;
  n->muted++;
  if (GTK_IS_ENTRY(n->widget))
    gtk_entry_set_text(GTK_ENTRY(n->widget), s);
  else if (GTK_IS_TEXT_VIEW(n->widget))
    gtk_text_buffer_set_text(gtk_text_view_get_buffer(GTK_TEXT_VIEW(n->widget)),
                             s, -1);
  else if (GTK_IS_LABEL(n->widget))
    gtk_label_set_text(GTK_LABEL(n->widget), s);
  else if (GTK_IS_BUTTON(n->widget))
    gtk_button_set_label(GTK_BUTTON(n->widget), s);
  else if (GTK_IS_WINDOW(n->widget))
    gtk_window_set_title(GTK_WINDOW(n->widget), s);
  n->muted--;
}
const char *mg_get_text(Node *n) {
  if (!mg_alive(n))
    return "";
  g_free(n->cache);
  n->cache = NULL;
  if (GTK_IS_ENTRY(n->widget))
    return gtk_entry_get_text(GTK_ENTRY(n->widget));
  if (GTK_IS_TEXT_VIEW(n->widget)) {
    GtkTextIter a, b;
    GtkTextBuffer *t = gtk_text_view_get_buffer(GTK_TEXT_VIEW(n->widget));
    gtk_text_buffer_get_bounds(t, &a, &b);
    n->cache = gtk_text_buffer_get_text(t, &a, &b, TRUE);
    return n->cache;
  }
  if (GTK_IS_TREE_VIEW(n->widget)) {
    GtkTreeModel *m;
    GtkTreeIter it;
    if (gtk_tree_selection_get_selected(
            gtk_tree_view_get_selection(GTK_TREE_VIEW(n->widget)), &m, &it)) {
      gtk_tree_model_get(m, &it, 0, &n->cache, -1);
      return n->cache;
    }
    return "";
  }
  if (GTK_IS_LABEL(n->widget))
    return gtk_label_get_text(GTK_LABEL(n->widget));
  if (GTK_IS_BUTTON(n->widget))
    return gtk_button_get_label(GTK_BUTTON(n->widget));
  if (GTK_IS_CALENDAR(n->widget)) {
    guint y, m, d;
    gtk_calendar_get_date(GTK_CALENDAR(n->widget), &y, &m, &d);
    n->cache = g_strdup_printf("%04u-%02u-%02u", y, m + 1, d);
    return n->cache;
  }
  if (WEBKIT_IS_WEB_VIEW(n->widget))
    return webkit_web_view_get_uri(WEBKIT_WEB_VIEW(n->widget));
  return "";
}
void mg_columns(Node *n, const char *columns) {
  if (!mg_alive(n) || !GTK_IS_TREE_VIEW(n->widget))
    return;
  char **names = g_strsplit(columns, "\t", -1);
  n->columns = MAX(1, (int)g_strv_length(names));
  GType *types = g_new(GType, n->columns);
  for (int i = 0; i < n->columns; i++)
    types[i] = G_TYPE_STRING;
  if (n->store)
    g_object_unref(n->store);
  n->store = gtk_list_store_newv(n->columns, types);
  g_free(types);
  gtk_tree_view_set_model(GTK_TREE_VIEW(n->widget), GTK_TREE_MODEL(n->store));
  GList *cols = gtk_tree_view_get_columns(GTK_TREE_VIEW(n->widget));
  for (GList *p = cols; p; p = p->next)
    gtk_tree_view_remove_column(GTK_TREE_VIEW(n->widget), p->data);
  g_list_free(cols);
  for (int i = 0; i < n->columns; i++) {
    GtkCellRenderer *r = gtk_cell_renderer_text_new();
    g_object_set(r, "editable",
                 n->editable && (!is(n, "PropertyGrid") || i > 0), NULL);
    g_object_set_data(G_OBJECT(r), "column", GINT_TO_POINTER(i));
    g_signal_connect(r, "edited", G_CALLBACK(edited), n);
    GtkTreeViewColumn *c = gtk_tree_view_column_new_with_attributes(
        names[i] ? names[i] : "", r, "text", i, NULL);
    gtk_tree_view_column_set_resizable(c, TRUE);
    gtk_tree_view_column_set_sort_column_id(c, i);
    gtk_tree_view_append_column(GTK_TREE_VIEW(n->widget), c);
  }
  gtk_tree_view_set_headers_visible(GTK_TREE_VIEW(n->widget),
                                    !is(n, "ListBox") && !is(n, "TreeView"));
  g_strfreev(names);
}
void mg_clear(Node *n) {
  if (!mg_alive(n))
    return;
  n->muted++;
  g_ptr_array_set_size(n->rows, 0);
  if (n->store)
    gtk_list_store_clear(n->store);
  if (n->tree)
    gtk_tree_store_clear(n->tree);
  if (GTK_IS_COMBO_BOX_TEXT(n->widget))
    gtk_combo_box_text_remove_all(GTK_COMBO_BOX_TEXT(n->widget));
  if (GTK_IS_MENU_SHELL(n->widget)) {
    GList *children = gtk_container_get_children(GTK_CONTAINER(n->widget));
    for (GList *item = children; item; item = item->next)
      gtk_widget_destroy(GTK_WIDGET(item->data));
    g_list_free(children);
  }
  n->muted--;
}
void mg_add(Node *n, const char *row) {
  if (!mg_alive(n))
    return;
  n->muted++;
  g_ptr_array_add(n->rows, g_strdup(row));
  if (GTK_IS_COMBO_BOX_TEXT(n->widget))
    gtk_combo_box_text_append_text(GTK_COMBO_BOX_TEXT(n->widget), row);
  else if (is(n, "TreeView")) {
    if (!n->tree) {
      n->tree = gtk_tree_store_new(1, G_TYPE_STRING);
      gtk_tree_view_set_model(GTK_TREE_VIEW(n->widget),
                              GTK_TREE_MODEL(n->tree));
      GtkCellRenderer *r = gtk_cell_renderer_text_new();
      gtk_tree_view_append_column(
          GTK_TREE_VIEW(n->widget),
          gtk_tree_view_column_new_with_attributes("", r, "text", 0, NULL));
      gtk_tree_view_set_headers_visible(GTK_TREE_VIEW(n->widget), FALSE);
    }
    int depth = 0;
    while (row[0] == ' ' && row[1] == ' ' && depth < 127) {
      depth++;
      row += 2;
    }
    if (n->rows->len == 1)
      depth = 0;
    GtkTreeIter it;
    gtk_tree_store_append(n->tree, &it,
                          depth ? &n->ancestors[depth - 1] : NULL);
    gtk_tree_store_set(n->tree, &it, 0, row, -1);
    n->ancestors[depth] = it;
    gtk_tree_view_expand_all(GTK_TREE_VIEW(n->widget));
  } else if (GTK_IS_TREE_VIEW(n->widget)) {
    if (!n->store)
      mg_columns(n, "");
    char **fields = g_strsplit(row, "\t", -1);
    int count = g_strv_length(fields);
    GtkTreeIter it;
    gtk_list_store_append(n->store, &it);
    for (int c = 0; c < n->columns; c++)
      gtk_list_store_set(n->store, &it, c, c < count ? fields[c] : "", -1);
    g_strfreev(fields);
  } else if (GTK_IS_NOTEBOOK(n->widget)) {
    GtkWidget *page = fixed_new();
    gtk_notebook_append_page(GTK_NOTEBOOK(n->widget), page, gtk_label_new(row));
    if (!n->host)
      n->host = page;
    gtk_widget_show_all(page);
  } else if (GTK_IS_MENU_SHELL(n->widget)) {
    GtkWidget *item = gtk_menu_item_new_with_label(row);
    g_object_set_data(G_OBJECT(item), "index",
                      GINT_TO_POINTER(n->rows->len - 1));
    g_signal_connect(item, "activate", G_CALLBACK(menu_clicked), n);
    gtk_menu_shell_append(GTK_MENU_SHELL(n->widget), item);
    gtk_widget_show(item);
  }
  n->muted--;
}
int64_t mg_selection(Node *n, int64_t value, int64_t set) {
  if (!mg_alive(n))
    return -1;
  if (set) {
    n->muted++;
    if (GTK_IS_COMBO_BOX(n->widget))
      gtk_combo_box_set_active(GTK_COMBO_BOX(n->widget), value);
    else if (GTK_IS_NOTEBOOK(n->widget))
      gtk_notebook_set_current_page(GTK_NOTEBOOK(n->widget), value);
    else if (GTK_IS_TREE_VIEW(n->widget)) {
      GtkTreeSelection *s =
          gtk_tree_view_get_selection(GTK_TREE_VIEW(n->widget));
      gtk_tree_selection_unselect_all(s);
      if (value >= 0) {
        GtkTreePath *p = gtk_tree_path_new_from_indices((int)value, -1);
        gtk_tree_selection_select_path(s, p);
        gtk_tree_path_free(p);
      }
    }
    n->muted--;
    return value;
  }
  if (GTK_IS_COMBO_BOX(n->widget))
    return gtk_combo_box_get_active(GTK_COMBO_BOX(n->widget));
  if (GTK_IS_NOTEBOOK(n->widget))
    return gtk_notebook_get_current_page(GTK_NOTEBOOK(n->widget));
  if (GTK_IS_TREE_VIEW(n->widget)) {
    GtkTreeIter it;
    GtkTreeModel *m;
    if (gtk_tree_selection_get_selected(
            gtk_tree_view_get_selection(GTK_TREE_VIEW(n->widget)), &m, &it)) {
      GtkTreePath *p = gtk_tree_model_get_path(m, &it);
      int result = gtk_tree_path_get_indices(p)[0];
      gtk_tree_path_free(p);
      return result;
    }
  }
  return -1;
}
int64_t mg_value(Node *n, int64_t value, int64_t set) {
  if (!mg_alive(n))
    return 0;
  if (set) {
    n->muted++;
    if (GTK_IS_TOGGLE_BUTTON(n->widget))
      gtk_toggle_button_set_active(GTK_TOGGLE_BUTTON(n->widget), value != 0);
    else if (GTK_IS_RANGE(n->widget))
      gtk_range_set_value(GTK_RANGE(n->widget), value);
    else if (GTK_IS_SPIN_BUTTON(n->widget))
      gtk_spin_button_set_value(GTK_SPIN_BUTTON(n->widget), value);
    else if (GTK_IS_PROGRESS_BAR(n->widget))
      gtk_progress_bar_set_fraction(
          GTK_PROGRESS_BAR(n->widget),
          CLAMP((value - n->minimum) / (n->maximum - n->minimum), 0, 1));
    n->muted--;
    return value;
  }
  if (GTK_IS_TOGGLE_BUTTON(n->widget))
    return gtk_toggle_button_get_active(GTK_TOGGLE_BUTTON(n->widget));
  if (GTK_IS_RANGE(n->widget))
    return gtk_range_get_value(GTK_RANGE(n->widget));
  if (GTK_IS_SPIN_BUTTON(n->widget))
    return gtk_spin_button_get_value_as_int(GTK_SPIN_BUTTON(n->widget));
  if (GTK_IS_PROGRESS_BAR(n->widget))
    return (int64_t)(n->minimum + gtk_progress_bar_get_fraction(
                                      GTK_PROGRESS_BAR(n->widget)) *
                                      (n->maximum - n->minimum));
  return 0;
}
void mg_range(Node *n, int64_t min, int64_t max, int64_t step) {
  if (!mg_alive(n))
    return;
  if (max <= min)
    max = min + 1;
  n->minimum = min;
  n->maximum = max;
  if (step < 1)
    step = 1;
  if (GTK_IS_RANGE(n->widget)) {
    gtk_range_set_range(GTK_RANGE(n->widget), min, max);
    gtk_range_set_increments(GTK_RANGE(n->widget), step, step * 10);
  }
  if (GTK_IS_SPIN_BUTTON(n->widget)) {
    gtk_spin_button_set_range(GTK_SPIN_BUTTON(n->widget), min, max);
    gtk_spin_button_set_increments(GTK_SPIN_BUTTON(n->widget), step, step * 10);
  }
}
int64_t mg_property(Node *n, const char *key, const char *text, int64_t value) {
  if (!mg_alive(n))
    return 0;
  if (!strcmp(key, "enabled"))
    gtk_widget_set_sensitive(n->widget, value);
  else if (!strcmp(key, "tooltip"))
    gtk_widget_set_tooltip_text(n->widget, text);
  else if (!strcmp(key, "focus"))
    gtk_widget_grab_focus(n->widget);
  else if (!strcmp(key, "readOnly")) {
    if (GTK_IS_TEXT_VIEW(n->widget))
      gtk_text_view_set_editable(GTK_TEXT_VIEW(n->widget), !value);
    else if (GTK_IS_EDITABLE(n->widget))
      gtk_editable_set_editable(GTK_EDITABLE(n->widget), !value);
  } else if (!strcmp(key, "placeholder") && GTK_IS_ENTRY(n->widget))
    gtk_entry_set_placeholder_text(GTK_ENTRY(n->widget), text);
  else if (!strcmp(key, "maxLength") && GTK_IS_ENTRY(n->widget))
    gtk_entry_set_max_length(GTK_ENTRY(n->widget), value);
  else if (!strcmp(key, "orientation") && is(n, "Splitter")) {
    g_object_set_data_full(G_OBJECT(n->widget), "minigui-axis", g_strdup(text),
                           g_free);
  } else if (!strcmp(key, "orientation") && GTK_IS_ORIENTABLE(n->widget))
    gtk_orientable_set_orientation(GTK_ORIENTABLE(n->widget),
                                   !strcmp(text, "vertical")
                                       ? GTK_ORIENTATION_VERTICAL
                                       : GTK_ORIENTATION_HORIZONTAL);
  else if (!strcmp(key, "source") && GTK_IS_IMAGE(n->widget))
    gtk_image_set_from_file(GTK_IMAGE(n->widget), text);
  else if (!strcmp(key, "icon") && n->tray)
    app_indicator_set_icon_full(n->tray, text, text);
  else if (!strcmp(key, "language") && GTK_SOURCE_IS_VIEW(n->widget)) {
    g_free(n->filter);
    n->filter = g_strdup(text);
    GtkSourceLanguage *lang = gtk_source_language_manager_get_language(
        gtk_source_language_manager_get_default(), text);
    gtk_source_buffer_set_language(
        GTK_SOURCE_BUFFER(gtk_text_view_get_buffer(GTK_TEXT_VIEW(n->widget))),
        lang);
    highlight_minilang(n);
  } else if (!strcmp(key, "url")) {
    if (WEBKIT_IS_WEB_VIEW(n->widget))
      webkit_web_view_load_uri(WEBKIT_WEB_VIEW(n->widget), text);
    else if (GTK_IS_LINK_BUTTON(n->widget))
      gtk_link_button_set_uri(GTK_LINK_BUTTON(n->widget), text);
  } else if (!strcmp(key, "html") && WEBKIT_IS_WEB_VIEW(n->widget))
    webkit_web_view_load_html(WEBKIT_WEB_VIEW(n->widget), text, "about:blank");
  else if (!strcmp(key, "editable") && GTK_IS_TREE_VIEW(n->widget)) {
    n->editable = value;
    GList *cols = gtk_tree_view_get_columns(GTK_TREE_VIEW(n->widget));
    int i = 0;
    for (GList *p = cols; p; p = p->next, i++) {
      GList *cells = gtk_cell_layout_get_cells(GTK_CELL_LAYOUT(p->data));
      for (GList *q = cells; q; q = q->next)
        g_object_set(q->data, "editable",
                     value && (!is(n, "PropertyGrid") || i > 0), NULL);
      g_list_free(cells);
    }
    g_list_free(cols);
  } else if (!strcmp(key, "items") && n->tray) {
    char **items = g_strsplit(text, "\n", -1);
    for (int i = 0; items[i]; i++)
      mg_add(n, items[i]);
    g_strfreev(items);
  } else if (!strcmp(key, "status") && WEBKIT_IS_WEB_VIEW(n->widget))
    return webkit_web_view_is_loading(WEBKIT_WEB_VIEW(n->widget)) ? 0 : 1;
  else if (!strcmp(key, "tabIndex")) {
    n->tab_index = value;
    if (n->parent && n->parent->host) {
      GList *chain = NULL;
      for (guint i = 0; i < nodes->len; i++) {
        Node *c = g_ptr_array_index(nodes, i);
        if (c->parent == n->parent && c->alive) {
          GList *at = chain;
          while (at && ((Node *)at->data)->tab_index <= c->tab_index)
            at = at->next;
          chain = g_list_insert_before(chain, at, c);
        }
      }
      GList *widgets = NULL;
      for (GList *p = chain; p; p = p->next)
        widgets = g_list_append(widgets, ((Node *)p->data)->mount);
      gtk_container_set_focus_chain(GTK_CONTAINER(n->parent->host), widgets);
      g_list_free(widgets);
      g_list_free(chain);
    }
  } else if (!strcmp(key, "columnWidth") && GTK_IS_TREE_VIEW(n->widget)) {
    GtkTreeViewColumn *col =
        gtk_tree_view_get_column(GTK_TREE_VIEW(n->widget), atoi(text));
    if (!col)
      return 0;
    gtk_tree_view_column_set_sizing(col, GTK_TREE_VIEW_COLUMN_FIXED);
    gtk_tree_view_column_set_fixed_width(col, MAX(value, 1));
  } else if (!strcmp(key, "largeStep") && GTK_IS_RANGE(n->widget))
    gtk_adjustment_set_page_increment(
        gtk_range_get_adjustment(GTK_RANGE(n->widget)), value);
  else if (!strcmp(key, "css")) {
    GtkCssProvider *css = gtk_css_provider_new();
    GError *err = NULL;
    gtk_css_provider_load_from_data(css, text, -1, &err);
    if (err) {
      g_error_free(err);
      g_object_unref(css);
      return 0;
    }
    gtk_style_context_add_provider(gtk_widget_get_style_context(n->widget),
                                   GTK_STYLE_PROVIDER(css),
                                   GTK_STYLE_PROVIDER_PRIORITY_APPLICATION);
    g_object_unref(css);
  } else
    return 0;
  return 1;
}
void mg_draw(Node *n, int64_t op, double x, double y, double w, double h,
             const char *color, const char *text) {
  if (!mg_alive(n))
    return;
  if (!op)
    g_ptr_array_set_size(n->drawing, 0);
  else {
    Draw *d = g_new0(Draw, 1);
    *d = (Draw){op, x, y, w, h, {0, 0, 0, 1}, g_strdup(text)};
    gdk_rgba_parse(&d->color, color);
    g_ptr_array_add(n->drawing, d);
  }
  gtk_widget_queue_draw(n->widget);
}
int64_t mg_poll(int64_t wait) {
  event_free(current);
  current = NULL;
  if (g_queue_is_empty(&queue))
    g_main_context_iteration(NULL, wait != 0);
  for (int i = 0; i < 64 && g_main_context_pending(NULL); i++)
    g_main_context_iteration(NULL, FALSE);
  current = g_queue_pop_head(&queue);
  return current ? current->type : 0;
}
int64_t mg_event(int64_t field) {
  if (!current)
    return 0;
  if (field == 0)
    return current->id;
  if (field == 1)
    return current->value;
  return current->extra;
}
const char *mg_event_text(void) { return current ? current->text : ""; }
const char *mg_dialog(Node *parent, int64_t kind, const char *title,
                      const char *text) {
  GtkWindow *owner = parent && GTK_IS_WINDOW(parent->widget)
                         ? GTK_WINDOW(parent->widget)
                         : NULL;
  GtkWidget *d;
  g_free(dialog_result);
  dialog_result = NULL;
  if (kind <= 2) {
    GtkFileChooserAction action = kind == 1 ? GTK_FILE_CHOOSER_ACTION_SAVE
                                  : kind == 2
                                      ? GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER
                                      : GTK_FILE_CHOOSER_ACTION_OPEN;
    d = gtk_file_chooser_dialog_new(title, owner, action, "Cancel",
                                    GTK_RESPONSE_CANCEL, "Select",
                                    GTK_RESPONSE_ACCEPT, NULL);
    if (kind == 1)
      gtk_file_chooser_set_do_overwrite_confirmation(GTK_FILE_CHOOSER(d), TRUE);
    if (kind != 2 && text && *text) {
      gchar **parts = g_strsplit(text, "|", -1);
      for (int i = 0; parts[i] && parts[i + 1]; i += 2) {
        GtkFileFilter *filter = gtk_file_filter_new();
        gtk_file_filter_set_name(filter, parts[i]);
        gchar **patterns = g_strsplit(parts[i + 1], ";", -1);
        for (int j = 0; patterns[j]; j++) {
          const char *pattern = g_strstrip(patterns[j]);
          gtk_file_filter_add_pattern(filter,
                                      !strcmp(pattern, "*.*") ? "*" : pattern);
        }
        g_strfreev(patterns);
        gtk_file_chooser_add_filter(GTK_FILE_CHOOSER(d), filter);
      }
      g_strfreev(parts);
    }
    if (gtk_dialog_run(GTK_DIALOG(d)) == GTK_RESPONSE_ACCEPT)
      dialog_result = gtk_file_chooser_get_filename(GTK_FILE_CHOOSER(d));
  } else if (kind == 3) {
    d = gtk_color_chooser_dialog_new(title, owner);
    GdkRGBA initial;
    if (text && gdk_rgba_parse(&initial, text))
      gtk_color_chooser_set_rgba(GTK_COLOR_CHOOSER(d), &initial);
    if (gtk_dialog_run(GTK_DIALOG(d)) == GTK_RESPONSE_OK) {
      GdkRGBA c;
      gtk_color_chooser_get_rgba(GTK_COLOR_CHOOSER(d), &c);
      dialog_result =
          g_strdup_printf("#%02x%02x%02x", (int)(c.red * 255),
                          (int)(c.green * 255), (int)(c.blue * 255));
    }
  } else {
    d = gtk_message_dialog_new(owner, GTK_DIALOG_MODAL, GTK_MESSAGE_INFO,
                               kind == 5 ? GTK_BUTTONS_YES_NO : GTK_BUTTONS_OK,
                               "%s", text);
    gtk_window_set_title(GTK_WINDOW(d), title);
    dialog_result = g_strdup(
        gtk_dialog_run(GTK_DIALOG(d)) == GTK_RESPONSE_YES ? "yes" : "ok");
  }
  gtk_widget_destroy(d);
  return dialog_result ? dialog_result : "";
}
void mg_shutdown(void) {
  if (!nodes)
    return;
  for (guint i = 0; i < nodes->len; i++) {
    Node *n = g_ptr_array_index(nodes, i);
    mg_destroy(n);
    if (n->tray)
      g_object_unref(n->tray);
    if (n->store)
      g_object_unref(n->store);
    if (n->tree)
      g_object_unref(n->tree);
    g_free(n->kind);
    g_free(n->cache);
    g_free(n->filter);
    g_ptr_array_free(n->rows, TRUE);
    g_ptr_array_free(n->drawing, TRUE);
    g_free(n);
  }
  g_ptr_array_free(nodes, TRUE);
  nodes = NULL;
  event_free(current);
  current = NULL;
  while (!g_queue_is_empty(&queue))
    event_free(g_queue_pop_head(&queue));
  g_clear_pointer(&dialog_result, g_free);
}

int64_t mg_format(Node *n, int64_t start, int64_t end, const char *color,
                  int64_t bold, int64_t italic) {
  if (!mg_alive(n) || !GTK_IS_TEXT_VIEW(n->widget) || start < 0 || end < start)
    return 0;
  GtkTextBuffer *b = gtk_text_view_get_buffer(GTK_TEXT_VIEW(n->widget));
  GtkTextIter a, z;
  gtk_text_buffer_get_iter_at_offset(b, &a, start);
  gtk_text_buffer_get_iter_at_offset(b, &z, end);
  GtkTextTag *tag = gtk_text_buffer_create_tag(
      b, NULL, "foreground", color, "weight",
      bold ? PANGO_WEIGHT_BOLD : PANGO_WEIGHT_NORMAL, "style",
      italic ? PANGO_STYLE_ITALIC : PANGO_STYLE_NORMAL, NULL);
  gtk_text_buffer_apply_tag(b, tag, &a, &z);
  return 1;
}
const char *mg_cell(Node *n, int64_t row, int64_t column, const char *text,
                    int64_t set) {
  if (!mg_alive(n) || !n->store || row < 0 || column < 0 ||
      column >= n->columns)
    return "";
  GtkTreeIter it;
  if (!gtk_tree_model_iter_nth_child(GTK_TREE_MODEL(n->store), &it, NULL, row))
    return "";
  if (set)
    gtk_list_store_set(n->store, &it, (int)column, text, -1);
  g_free(n->cache);
  gtk_tree_model_get(GTK_TREE_MODEL(n->store), &it, (int)column, &n->cache, -1);
  return n->cache ? n->cache : "";
}

int64_t mg_message(Node *owner, const char *title, const char *message,
                   const char *buttons, const char *icon) {
  GtkMessageType type = !strcmp(icon, "error")      ? GTK_MESSAGE_ERROR
                        : !strcmp(icon, "warning")  ? GTK_MESSAGE_WARNING
                        : !strcmp(icon, "question") ? GTK_MESSAGE_QUESTION
                                                    : GTK_MESSAGE_INFO;
  GtkWidget *dialog = gtk_message_dialog_new(
      owner ? GTK_WINDOW(owner->widget) : NULL, GTK_DIALOG_MODAL, type,
      GTK_BUTTONS_NONE, "%s", message);
  gtk_window_set_title(GTK_WINDOW(dialog), title);
  if (!strcmp(buttons, "yesNo") || !strcmp(buttons, "yesNoCancel")) {
    gtk_dialog_add_button(GTK_DIALOG(dialog), "Yes", 6);
    gtk_dialog_add_button(GTK_DIALOG(dialog), "No", 7);
    if (!strcmp(buttons, "yesNoCancel"))
      gtk_dialog_add_button(GTK_DIALOG(dialog), "Cancel", 2);
  } else if (!strcmp(buttons, "retryCancel") ||
             !strcmp(buttons, "abortRetryIgnore")) {
    if (!strcmp(buttons, "abortRetryIgnore"))
      gtk_dialog_add_button(GTK_DIALOG(dialog), "Abort", 3);
    gtk_dialog_add_button(GTK_DIALOG(dialog), "Retry", 4);
    gtk_dialog_add_button(GTK_DIALOG(dialog),
                          !strcmp(buttons, "retryCancel") ? "Cancel" : "Ignore",
                          !strcmp(buttons, "retryCancel") ? 2 : 5);
  } else {
    gtk_dialog_add_button(GTK_DIALOG(dialog), "OK", 1);
    if (!strcmp(buttons, "okCancel"))
      gtk_dialog_add_button(GTK_DIALOG(dialog), "Cancel", 2);
  }
  int result = gtk_dialog_run(GTK_DIALOG(dialog));
  gtk_widget_destroy(dialog);
  return result > 0 ? result : 2;
}
void mg_modal(Node *window, Node *owner, int64_t enabled) {
  if (!mg_alive(window))
    return;
  if (owner && owner != window && mg_alive(owner))
    gtk_window_set_transient_for(GTK_WINDOW(window->widget),
                                 GTK_WINDOW(owner->widget));
  gtk_window_set_modal(GTK_WINDOW(window->widget), enabled != 0);
}
