# `MiniGuiLib/minigui.ml`

[Home](README.md) · [Files](Files.md)

Provides minigui facilities for this project.

Package: [`MiniGuiLib.minigui`](Package-miniguilib-minigui-960251708.md)

Reachable from entry: **no**

## Imports

- `std/string.ml` as `str` → `../MiniLangCompilerML/std/string.ml` — external dependency
- `std/string_builder.ml` as `sb` → `../MiniLangCompilerML/std/string_builder.ml` — external dependency

## Declarations

<a id="function-function-miniguilib-minigui-advancedcreate-function-advancedcreate-app-parent-id-kind-text-x-y-width-height-miniguilib-minigui-ml-109142021"></a>
### _advancedCreate

```ml
function _advancedCreate(app, parent, id, kind, text, x, y, width, height)
```

_advancedCreate for the native backend.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | app supplied by the caller. |
| `parent` | `dynamic` | — | parent supplied by the caller. |
| `id` | `dynamic` | — | id supplied by the caller. |
| `kind` | `dynamic` | — | kind supplied by the caller. |
| `text` | `dynamic` | — | text supplied by the caller. |
| `x` | `dynamic` | — | x supplied by the caller. |
| `y` | `dynamic` | — | y supplied by the caller. |
| `width` | `dynamic` | — | width supplied by the caller. |
| `height` | `dynamic` | — | height supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L8037)

<a id="function-function-miniguilib-minigui-advanceddraw-function-advanceddraw-control-op-x-y-width-height-color-text-miniguilib-minigui-ml-638736160"></a>
### _advancedDraw

```ml
function _advancedDraw(control, op, x, y, width, height, color, text)
```

_advancedDraw for the native backend.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `op` | `dynamic` | — | op supplied by the caller. |
| `x` | `dynamic` | — | x supplied by the caller. |
| `y` | `dynamic` | — | y supplied by the caller. |
| `width` | `dynamic` | — | width supplied by the caller. |
| `height` | `dynamic` | — | height supplied by the caller. |
| `color` | `dynamic` | — | color supplied by the caller. |
| `text` | `dynamic` | — | text supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L8059)

<a id="function-function-miniguilib-minigui-advancedformat-function-advancedformat-control-start-endindex-color-bold-italic-miniguilib-minigui-ml-456966350"></a>
### _advancedFormat

```ml
function _advancedFormat(control, start, endIndex, color, bold, italic)
```

_advancedFormat for the native backend.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `start` | `dynamic` | — | start supplied by the caller. |
| `endIndex` | `dynamic` | — | end supplied by the caller. |
| `color` | `dynamic` | — | color supplied by the caller. |
| `bold` | `dynamic` | — | bold supplied by the caller. |
| `italic` | `dynamic` | — | italic supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L8071)

<a id="function-function-miniguilib-minigui-advancedproperty-function-advancedproperty-control-key-text-value-miniguilib-minigui-ml-360835394"></a>
### _advancedProperty

```ml
function _advancedProperty(control, key, text, value)
```

_advancedProperty for the native backend.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `key` | `dynamic` | — | key supplied by the caller. |
| `text` | `dynamic` | — | text supplied by the caller. |
| `value` | `dynamic` | — | value supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L8046)

<a id="function-function-miniguilib-minigui-dialoginputcancel-function-dialoginputcancel-context-event-miniguilib-minigui-ml-1040675573"></a>
### _dialogInputCancel

```ml
function _dialogInputCancel(context, event)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L8089)

<a id="function-function-miniguilib-minigui-dialoginputok-function-dialoginputok-context-event-miniguilib-minigui-ml-1619618437"></a>
### _dialogInputOk

```ml
function _dialogInputOk(context, event)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L8080)

<a id="function-function-miniguilib-minigui-hasword-function-hasword-text-word-miniguilib-minigui-ml-1008086879"></a>
### _hasWord

```ml
function _hasWord(text, word)
```

_hasWord for the native backend.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | text supplied by the caller. |
| `word` | `dynamic` | — | word supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7573)

<a id="function-function-miniguilib-minigui-itemcount-function-itemcount-itemstext-miniguilib-minigui-ml-2060651443"></a>
### _itemCount

```ml
function _itemCount(itemsText)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `itemsText` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L6107)

<a id="function-function-miniguilib-minigui-itemtextat-function-itemtextat-itemstext-index-miniguilib-minigui-ml-1618130501"></a>
### _itemTextAt

```ml
function _itemTextAt(itemsText, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `itemsText` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L6087)

<a id="function-function-miniguilib-minigui-jointext-function-jointext-items-separator-miniguilib-minigui-ml-190570311"></a>
### _joinText

```ml
function _joinText(items, separator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `items` | `dynamic` | — |  |
| `separator` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L6075)

<a id="global-global-miniguilib-minigui-linuxbindings-linuxbindings-miniguilib-minigui-ml-2056516418"></a>
### _linuxBindings

```ml
_linuxBindings
```


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L6117)

<a id="global-global-miniguilib-minigui-linuxlayouts-linuxlayouts-miniguilib-minigui-ml-1444837148"></a>
### _linuxLayouts

```ml
_linuxLayouts
```


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L6119)

<a id="function-function-miniguilib-minigui-new-function-new-app-parent-id-kind-text-x-y-width-height-miniguilib-minigui-ml-1447891607"></a>
### _new

```ml
function _new(app, parent, id, kind, text, x, y, width, height)
```

_new for the native backend.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | app supplied by the caller. |
| `parent` | `dynamic` | — | parent supplied by the caller. |
| `id` | `dynamic` | — | id supplied by the caller. |
| `kind` | `dynamic` | — | kind supplied by the caller. |
| `text` | `dynamic` | — | text supplied by the caller. |
| `x` | `dynamic` | — | x supplied by the caller. |
| `y` | `dynamic` | — | y supplied by the caller. |
| `width` | `dynamic` | — | width supplied by the caller. |
| `height` | `dynamic` | — | height supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L6130)

- [MiniGuiLib.minigui.Application](Type-miniguilib-minigui-application-1605122988.md) — struct
- [MiniGuiLib.minigui.ApplicationState](Type-miniguilib-minigui-applicationstate-2092619441.md) — struct
- [MiniGuiLib.minigui.Binding](Type-miniguilib-minigui-binding-1005909067.md) — struct
- [MiniGuiLib.minigui.Button](Type-miniguilib-minigui-button-1520404438.md) — struct
- [MiniGuiLib.minigui.Calendar](Type-miniguilib-minigui-calendar-1740464088.md) — struct
- [MiniGuiLib.minigui.Chart](Type-miniguilib-minigui-chart-586409834.md) — struct
- [MiniGuiLib.minigui.CheckBox](Type-miniguilib-minigui-checkbox-903069219.md) — struct
- [MiniGuiLib.minigui.CodeEditor](Type-miniguilib-minigui-codeeditor-1337733838.md) — struct
- [MiniGuiLib.minigui.ColorPicker](Type-miniguilib-minigui-colorpicker-360522475.md) — struct
- [MiniGuiLib.minigui.ComboBox](Type-miniguilib-minigui-combobox-2072734281.md) — struct
- [MiniGuiLib.minigui.ContextMenu](Type-miniguilib-minigui-contextmenu-115441878.md) — struct
- [MiniGuiLib.minigui.Control](Type-miniguilib-minigui-control-487621723.md) — struct
- [MiniGuiLib.minigui.DataGrid](Type-miniguilib-minigui-datagrid-312471086.md) — struct
- [MiniGuiLib.minigui.DatePicker](Type-miniguilib-minigui-datepicker-2133079376.md) — struct
- [MiniGuiLib.minigui.DateTimePicker](Type-miniguilib-minigui-datetimepicker-50480545.md) — struct
- [MiniGuiLib.minigui.Dialog](Type-miniguilib-minigui-dialog-758938230.md) — struct
- [MiniGuiLib.minigui.DialogWindow](Type-miniguilib-minigui-dialogwindow-1871481418.md) — struct
- [MiniGuiLib.minigui.DrawingCanvas](Type-miniguilib-minigui-drawingcanvas-1632518052.md) — struct
- [MiniGuiLib.minigui.EditableComboBox](Type-miniguilib-minigui-editablecombobox-1293251185.md) — struct
- [MiniGuiLib.minigui.Event](Type-miniguilib-minigui-event-173082466.md) — struct
- [MiniGuiLib.minigui.Events](Type-miniguilib-minigui-events-1317937091.md) — struct
- [MiniGuiLib.minigui.FilePicker](Type-miniguilib-minigui-filepicker-1049747810.md) — struct
- [MiniGuiLib.minigui.FolderPicker](Type-miniguilib-minigui-folderpicker-1673436.md) — struct
- [MiniGuiLib.minigui.GroupBox](Type-miniguilib-minigui-groupbox-375763974.md) — struct
- [MiniGuiLib.minigui.Image](Type-miniguilib-minigui-image-1271556347.md) — struct
- [MiniGuiLib.minigui.Label](Type-miniguilib-minigui-label-1189359004.md) — struct
- [MiniGuiLib.minigui.LinkLabel](Type-miniguilib-minigui-linklabel-829611492.md) — struct
- [MiniGuiLib.minigui.ListBox](Type-miniguilib-minigui-listbox-399936991.md) — struct
- [MiniGuiLib.minigui.ListView](Type-miniguilib-minigui-listview-417190859.md) — struct
- [MiniGuiLib.minigui.MenuBar](Type-miniguilib-minigui-menubar-1972806118.md) — struct
<a id="extern_function-extern-function-miniguilib-minigui-mg-add-extern-function-mg-add-node-as-ptr-row-as-cstr-from-origin-libminigui-gtk-so-returns-void-miniguilib-minigui-ml-65746403"></a>
### mg_add

```ml
extern function mg_add(node as ptr, row as cstr) from "$ORIGIN/libminigui_gtk.so" returns void
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `node` | `ptr` | — |  |
| `row` | `cstr` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L5913)

<a id="extern_function-extern-function-miniguilib-minigui-mg-alive-extern-function-mg-alive-node-as-ptr-from-origin-libminigui-gtk-so-returns-bool-miniguilib-minigui-ml-1178163255"></a>
### mg_alive

```ml
extern function mg_alive(node as ptr) from "$ORIGIN/libminigui_gtk.so" returns bool
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `node` | `ptr` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L5897)

<a id="extern_function-extern-function-miniguilib-minigui-mg-bounds-extern-function-mg-bounds-node-as-ptr-x-as-double-y-as-double-width-as-double-height-as-double-from-origin-libminigui-gtk-so-returns-void-miniguilib-minigui-ml-1378647115"></a>
### mg_bounds

```ml
extern function mg_bounds(node as ptr, x as double, y as double, width as double, height as double) from "$ORIGIN/libminigui_gtk.so" returns void
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `node` | `ptr` | — |  |
| `x` | `double` | — |  |
| `y` | `double` | — |  |
| `width` | `double` | — |  |
| `height` | `double` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L5903)

<a id="extern_function-extern-function-miniguilib-minigui-mg-cell-extern-function-mg-cell-node-as-ptr-row-as-int-column-as-int-text-as-cstr-set-as-int-from-origin-libminigui-gtk-so-returns-cstr-miniguilib-minigui-ml-184509355"></a>
### mg_cell

```ml
extern function mg_cell(node as ptr, row as int, column as int, text as cstr, set as int) from "$ORIGIN/libminigui_gtk.so" returns cstr
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `node` | `ptr` | — |  |
| `row` | `int` | — |  |
| `column` | `int` | — |  |
| `text` | `cstr` | — |  |
| `set` | `int` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L5937)

<a id="extern_function-extern-function-miniguilib-minigui-mg-clear-extern-function-mg-clear-node-as-ptr-from-origin-libminigui-gtk-so-returns-void-miniguilib-minigui-ml-1404499453"></a>
### mg_clear

```ml
extern function mg_clear(node as ptr) from "$ORIGIN/libminigui_gtk.so" returns void
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `node` | `ptr` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L5911)

<a id="extern_function-extern-function-miniguilib-minigui-mg-columns-extern-function-mg-columns-node-as-ptr-columns-as-cstr-from-origin-libminigui-gtk-so-returns-void-miniguilib-minigui-ml-1099803954"></a>
### mg_columns

```ml
extern function mg_columns(node as ptr, columns as cstr) from "$ORIGIN/libminigui_gtk.so" returns void
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `node` | `ptr` | — |  |
| `columns` | `cstr` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L5909)

<a id="extern_function-extern-function-miniguilib-minigui-mg-create-extern-function-mg-create-kind-as-cstr-parent-as-ptr-id-as-int-text-as-cstr-x-as-int-y-as-int-width-as-int-height-as-int-from-origin-libminigui-gtk-so-returns-ptr-miniguilib-minigui-ml-1905722100"></a>
### mg_create

```ml
extern function mg_create(kind as cstr, parent as ptr, id as int, text as cstr, x as int, y as int, width as int, height as int) from "$ORIGIN/libminigui_gtk.so" returns ptr
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `kind` | `cstr` | — |  |
| `parent` | `ptr` | — |  |
| `id` | `int` | — |  |
| `text` | `cstr` | — |  |
| `x` | `int` | — |  |
| `y` | `int` | — |  |
| `width` | `int` | — |  |
| `height` | `int` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L5895)

<a id="extern_function-extern-function-miniguilib-minigui-mg-destroy-extern-function-mg-destroy-node-as-ptr-from-origin-libminigui-gtk-so-returns-void-miniguilib-minigui-ml-1738797119"></a>
### mg_destroy

```ml
extern function mg_destroy(node as ptr) from "$ORIGIN/libminigui_gtk.so" returns void
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `node` | `ptr` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L5901)

<a id="extern_function-extern-function-miniguilib-minigui-mg-dialog-extern-function-mg-dialog-parent-as-ptr-kind-as-int-title-as-cstr-text-as-cstr-from-origin-libminigui-gtk-so-returns-cstr-miniguilib-minigui-ml-2120652727"></a>
### mg_dialog

```ml
extern function mg_dialog(parent as ptr, kind as int, title as cstr, text as cstr) from "$ORIGIN/libminigui_gtk.so" returns cstr
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `parent` | `ptr` | — |  |
| `kind` | `int` | — |  |
| `title` | `cstr` | — |  |
| `text` | `cstr` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L5931)

<a id="extern_function-extern-function-miniguilib-minigui-mg-draw-extern-function-mg-draw-node-as-ptr-op-as-int-x-as-double-y-as-double-width-as-double-height-as-double-color-as-cstr-text-as-cstr-from-origin-libminigui-gtk-so-returns-void-miniguilib-minigui-ml-297364427"></a>
### mg_draw

```ml
extern function mg_draw(node as ptr, op as int, x as double, y as double, width as double, height as double, color as cstr, text as cstr) from "$ORIGIN/libminigui_gtk.so" returns void
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `node` | `ptr` | — |  |
| `op` | `int` | — |  |
| `x` | `double` | — |  |
| `y` | `double` | — |  |
| `width` | `double` | — |  |
| `height` | `double` | — |  |
| `color` | `cstr` | — |  |
| `text` | `cstr` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L5923)

<a id="extern_function-extern-function-miniguilib-minigui-mg-event-extern-function-mg-event-field-as-int-from-origin-libminigui-gtk-so-returns-int-miniguilib-minigui-ml-1791562701"></a>
### mg_event

```ml
extern function mg_event(field as int) from "$ORIGIN/libminigui_gtk.so" returns int
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `field` | `int` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L5927)

<a id="extern_function-extern-function-miniguilib-minigui-mg-event-text-extern-function-mg-event-text-from-origin-libminigui-gtk-so-returns-cstr-miniguilib-minigui-ml-1023125147"></a>
### mg_event_text

```ml
extern function mg_event_text() from "$ORIGIN/libminigui_gtk.so" returns cstr
```


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L5929)

<a id="extern_function-extern-function-miniguilib-minigui-mg-format-extern-function-mg-format-node-as-ptr-start-as-int-endindex-as-int-color-as-cstr-bold-as-int-italic-as-int-from-origin-libminigui-gtk-so-returns-int-miniguilib-minigui-ml-305076145"></a>
### mg_format

```ml
extern function mg_format(node as ptr, start as int, endIndex as int, color as cstr, bold as int, italic as int) from "$ORIGIN/libminigui_gtk.so" returns int
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `node` | `ptr` | — |  |
| `start` | `int` | — |  |
| `endIndex` | `int` | — |  |
| `color` | `cstr` | — |  |
| `bold` | `int` | — |  |
| `italic` | `int` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L5935)

<a id="extern_function-extern-function-miniguilib-minigui-mg-get-text-extern-function-mg-get-text-node-as-ptr-from-origin-libminigui-gtk-so-returns-cstr-miniguilib-minigui-ml-1409373967"></a>
### mg_get_text

```ml
extern function mg_get_text(node as ptr) from "$ORIGIN/libminigui_gtk.so" returns cstr
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `node` | `ptr` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L5907)

<a id="extern_function-extern-function-miniguilib-minigui-mg-init-extern-function-mg-init-from-origin-libminigui-gtk-so-returns-int-miniguilib-minigui-ml-1360152570"></a>
### mg_init

```ml
extern function mg_init() from "$ORIGIN/libminigui_gtk.so" returns int
```

Native GTK callbacks enqueue events; MiniLang drains them on its UI thread.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L5893)

<a id="extern_function-extern-function-miniguilib-minigui-mg-message-extern-function-mg-message-owner-as-ptr-title-as-cstr-message-as-cstr-buttons-as-cstr-icon-as-cstr-from-origin-libminigui-gtk-so-returns-int-miniguilib-minigui-ml-999053670"></a>
### mg_message

```ml
extern function mg_message(owner as ptr, title as cstr, message as cstr, buttons as cstr, icon as cstr) from "$ORIGIN/libminigui_gtk.so" returns int
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `owner` | `ptr` | — |  |
| `title` | `cstr` | — |  |
| `message` | `cstr` | — |  |
| `buttons` | `cstr` | — |  |
| `icon` | `cstr` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L5888)

<a id="extern_function-extern-function-miniguilib-minigui-mg-modal-extern-function-mg-modal-window-as-ptr-owner-as-ptr-enabled-as-int-from-origin-libminigui-gtk-so-returns-void-miniguilib-minigui-ml-1877574950"></a>
### mg_modal

```ml
extern function mg_modal(window as ptr, owner as ptr, enabled as int) from "$ORIGIN/libminigui_gtk.so" returns void
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `window` | `ptr` | — |  |
| `owner` | `ptr` | — |  |
| `enabled` | `int` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L5890)

<a id="extern_function-extern-function-miniguilib-minigui-mg-poll-extern-function-mg-poll-wait-as-int-from-origin-libminigui-gtk-so-returns-int-miniguilib-minigui-ml-1162386722"></a>
### mg_poll

```ml
extern function mg_poll(wait as int) from "$ORIGIN/libminigui_gtk.so" returns int
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `wait` | `int` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L5925)

<a id="extern_function-extern-function-miniguilib-minigui-mg-property-extern-function-mg-property-node-as-ptr-key-as-cstr-text-as-cstr-value-as-int-from-origin-libminigui-gtk-so-returns-int-miniguilib-minigui-ml-359923430"></a>
### mg_property

```ml
extern function mg_property(node as ptr, key as cstr, text as cstr, value as int) from "$ORIGIN/libminigui_gtk.so" returns int
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `node` | `ptr` | — |  |
| `key` | `cstr` | — |  |
| `text` | `cstr` | — |  |
| `value` | `int` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L5921)

<a id="extern_function-extern-function-miniguilib-minigui-mg-range-extern-function-mg-range-node-as-ptr-minimum-as-int-maximum-as-int-step-as-int-from-origin-libminigui-gtk-so-returns-void-miniguilib-minigui-ml-1140176400"></a>
### mg_range

```ml
extern function mg_range(node as ptr, minimum as int, maximum as int, step as int) from "$ORIGIN/libminigui_gtk.so" returns void
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `node` | `ptr` | — |  |
| `minimum` | `int` | — |  |
| `maximum` | `int` | — |  |
| `step` | `int` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L5919)

<a id="extern_function-extern-function-miniguilib-minigui-mg-selection-extern-function-mg-selection-node-as-ptr-value-as-int-set-as-int-from-origin-libminigui-gtk-so-returns-int-miniguilib-minigui-ml-384891407"></a>
### mg_selection

```ml
extern function mg_selection(node as ptr, value as int, set as int) from "$ORIGIN/libminigui_gtk.so" returns int
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `node` | `ptr` | — |  |
| `value` | `int` | — |  |
| `set` | `int` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L5915)

<a id="extern_function-extern-function-miniguilib-minigui-mg-show-extern-function-mg-show-node-as-ptr-visible-as-int-from-origin-libminigui-gtk-so-returns-void-miniguilib-minigui-ml-1609383376"></a>
### mg_show

```ml
extern function mg_show(node as ptr, visible as int) from "$ORIGIN/libminigui_gtk.so" returns void
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `node` | `ptr` | — |  |
| `visible` | `int` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L5899)

<a id="extern_function-extern-function-miniguilib-minigui-mg-shutdown-extern-function-mg-shutdown-from-origin-libminigui-gtk-so-returns-void-miniguilib-minigui-ml-744777385"></a>
### mg_shutdown

```ml
extern function mg_shutdown() from "$ORIGIN/libminigui_gtk.so" returns void
```


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L5933)

<a id="extern_function-extern-function-miniguilib-minigui-mg-text-extern-function-mg-text-node-as-ptr-text-as-cstr-from-origin-libminigui-gtk-so-returns-void-miniguilib-minigui-ml-1409826188"></a>
### mg_text

```ml
extern function mg_text(node as ptr, text as cstr) from "$ORIGIN/libminigui_gtk.so" returns void
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `node` | `ptr` | — |  |
| `text` | `cstr` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L5905)

<a id="extern_function-extern-function-miniguilib-minigui-mg-value-extern-function-mg-value-node-as-ptr-value-as-int-set-as-int-from-origin-libminigui-gtk-so-returns-int-miniguilib-minigui-ml-1953196053"></a>
### mg_value

```ml
extern function mg_value(node as ptr, value as int, set as int) from "$ORIGIN/libminigui_gtk.so" returns int
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `node` | `ptr` | — |  |
| `value` | `int` | — |  |
| `set` | `int` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L5917)

- [MiniGuiLib.minigui.NativeControl](Type-miniguilib-minigui-nativecontrol-249550938.md) — struct
- [MiniGuiLib.minigui.NumberBox](Type-miniguilib-minigui-numberbox-1673605572.md) — struct
- [MiniGuiLib.minigui.Panel](Type-miniguilib-minigui-panel-1796001828.md) — struct
- [MiniGuiLib.minigui.PasswordBox](Type-miniguilib-minigui-passwordbox-1578552828.md) — struct
- [MiniGuiLib.minigui.ProgressBar](Type-miniguilib-minigui-progressbar-2050757430.md) — struct
- [MiniGuiLib.minigui.PropertyGrid](Type-miniguilib-minigui-propertygrid-137288887.md) — struct
- [MiniGuiLib.minigui.RadioButton](Type-miniguilib-minigui-radiobutton-2120866377.md) — struct
- [MiniGuiLib.minigui.RichTextBox](Type-miniguilib-minigui-richtextbox-1511588.md) — struct
- [MiniGuiLib.minigui.ScrollBar](Type-miniguilib-minigui-scrollbar-1767258424.md) — struct
- [MiniGuiLib.minigui.ScrollViewer](Type-miniguilib-minigui-scrollviewer-1330694613.md) — struct
- [MiniGuiLib.minigui.SearchBox](Type-miniguilib-minigui-searchbox-189843555.md) — struct
- [MiniGuiLib.minigui.Separator](Type-miniguilib-minigui-separator-1724365817.md) — struct
- [MiniGuiLib.minigui.Slider](Type-miniguilib-minigui-slider-1448461179.md) — struct
- [MiniGuiLib.minigui.SpinBox](Type-miniguilib-minigui-spinbox-73951299.md) — struct
- [MiniGuiLib.minigui.Splitter](Type-miniguilib-minigui-splitter-693560105.md) — struct
- [MiniGuiLib.minigui.StatusBar](Type-miniguilib-minigui-statusbar-969880253.md) — struct
- [MiniGuiLib.minigui.TabControl](Type-miniguilib-minigui-tabcontrol-1354852254.md) — struct
- [MiniGuiLib.minigui.TextArea](Type-miniguilib-minigui-textarea-1993982468.md) — struct
- [MiniGuiLib.minigui.TextBox](Type-miniguilib-minigui-textbox-245475314.md) — struct
- [MiniGuiLib.minigui.TimePicker](Type-miniguilib-minigui-timepicker-1929323797.md) — struct
- [MiniGuiLib.minigui.ToggleSwitch](Type-miniguilib-minigui-toggleswitch-1594220486.md) — struct
- [MiniGuiLib.minigui.ToolBar](Type-miniguilib-minigui-toolbar-853395957.md) — struct
- [MiniGuiLib.minigui.TrayIcon](Type-miniguilib-minigui-trayicon-674147511.md) — struct
- [MiniGuiLib.minigui.TreeView](Type-miniguilib-minigui-treeview-42567539.md) — struct
- [MiniGuiLib.minigui.WebView](Type-miniguilib-minigui-webview-1864129617.md) — struct
- [MiniGuiLib.minigui.Window](Type-miniguilib-minigui-window-1943367786.md) — struct
