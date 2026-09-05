// SPDX-License-Identifier: Apache-2.0
// Native signal/model tests complement MiniLang's public-API smoke test.
#include "../../native/linux/minigui_gtk.c"
#include <assert.h>
static void drain(void) {
  for (int i = 0; i < 200 && mg_poll(0); ++i) {
  }
}
int main(void) {
  assert(mg_init());
  Node *window = mg_create("Window", NULL, 1, "Backend test", 0, 0, 640, 480);
  Node *button = mg_create("Button", window, 2, "Click", 10, 10, 100, 30);
  Node *entry = mg_create("TextBox", window, 3, "before", 10, 50, 180, 30);
  Node *tree = mg_create("TreeView", window, 4, "", 10, 100, 200, 150);
  mg_add(tree, "Root");
  mg_add(tree, "  Child");
  GtkTreeIter root;
  assert(gtk_tree_model_get_iter_first(GTK_TREE_MODEL(tree->tree), &root));
  assert(gtk_tree_model_iter_n_children(GTK_TREE_MODEL(tree->tree), &root) ==
         1);
  Node *grid = mg_create("DataGrid", window, 5, "", 220, 100, 250, 150);
  mg_columns(grid, "Name\tValue");
  mg_add(grid, "Alpha\t1");
  mg_add(grid, "Beta\t2");
  assert(!strcmp(mg_cell(grid, 1, 1, "", 0), "2"));
  mg_cell(grid, 1, 1, "3", 1);
  assert(!strcmp(mg_cell(grid, 1, 1, "", 0), "3"));
  Node *tabs = mg_create("TabControl", window, 6, "", 10, 270, 400, 180);
  mg_add(tabs, "First");
  mg_add(tabs, "Second");
  Node *first = mg_create("Panel", tabs, 7, "", 0, 0, 380, 130);
  Node *second = mg_create("Panel", tabs, 8, "", 0, 0, 380, 130);
  assert(gtk_widget_get_parent(first->mount) !=
         gtk_widget_get_parent(second->mount));
  mg_bounds(first, 0, 0, 370, 120);
  assert(gtk_widget_get_parent(first->mount) ==
         gtk_notebook_get_nth_page(GTK_NOTEBOOK(tabs->widget), 0));
  mg_show(window, 1);
  drain();
  Node *progress = mg_create("ProgressBar", window, 11, "", 430, 10, 100, 20);
  mg_range(progress, 20, 220, 1);
  mg_value(progress, 120, 1);
  assert(gtk_progress_bar_get_fraction(GTK_PROGRESS_BAR(progress->widget)) ==
         0.5);
  assert(mg_value(progress, 0, 0) == 120);
  Node *split = mg_create("Splitter", window, 12, "", 420, 40, 5, 100);
  g_object_set_data(G_OBJECT(split->widget), "minigui-axis", "vertical");
  split_begin(NULL, 0, 0, split);
  split_drag(NULL, 20, 0, split);
  assert(mg_poll(0) == 4 && mg_event(1) == 20);
  split_begin(NULL, 0, 0, split);
  split_drag(NULL, 5, 0, split);
  assert(mg_poll(0) == 4 && mg_event(1) == 25);
  drain();
  gtk_button_clicked(GTK_BUTTON(button->widget));
  assert(mg_poll(0) == 1 && mg_event(0) == 2);
  drain();
  Node *check = mg_create("CheckBox", window, 13, "Check", 430, 150, 100, 25);
  gtk_toggle_button_set_active(GTK_TOGGLE_BUTTON(check->widget), TRUE);
  int saw_value = 0;
  for (int kind; (kind = mg_poll(0));)
    if (kind == 4 && mg_event(0) == 13 && mg_event(1) == 1)
      saw_value = 1;
  assert(saw_value && mg_value(check, 0, 0) == 1);
  Node *menu = mg_create("ContextMenu", window, 14, "", 0, 0, 1, 1);
  mg_add(menu, "Old");
  mg_clear(menu);
  mg_add(menu, "New");
  GList *items = gtk_container_get_children(GTK_CONTAINER(menu->widget));
  assert(g_list_length(items) == 1);
  assert(!strcmp(gtk_menu_item_get_label(GTK_MENU_ITEM(items->data)), "New"));
  g_list_free(items);
  gtk_entry_set_text(GTK_ENTRY(entry->widget), "after");
  assert(mg_poll(0) == 2 && mg_event(0) == 3);
  assert(!strcmp(mg_get_text(entry), "after"));
  drain();
  GtkTreePath *path = gtk_tree_path_new_from_string("0:0");
  gtk_tree_selection_select_path(
      gtk_tree_view_get_selection(GTK_TREE_VIEW(tree->widget)), path);
  gtk_tree_path_free(path);
  assert(mg_poll(0) == 3);
  assert(!strcmp(mg_get_text(tree), "Child"));
  mg_show(button, 0);
  mg_show(window, 1);
  assert(!gtk_widget_get_visible(button->widget));
  GtkAllocation allocation;
  gtk_widget_get_allocation(window->widget, &allocation);
  assert(allocation.width < 1000 && allocation.height < 1000);
  mg_shutdown();
  assert(mg_init());
  window = mg_create("Window", NULL, 10, "Second application", 0, 0, 200, 100);
  assert(mg_alive(window));
  mg_shutdown();
  puts("PASS: GTK signals, tree hierarchy, table edits, notebook parenting, "
       "visibility, disposal");
  return 0;
}
