# Advanced controls

The `examples/advanced-controls` application demonstrates the new controls.
All use the usual `app, parent, id, text, x, y, width, height` constructor
parameters unless stated otherwise. They also accept common MSON sizing,
visibility and layout properties.

## RichTextBox and CodeEditor

`RichTextBox` is a multiline rich-text editor. Use `Control.getText`,
`Control.setText`, `Control.setReadOnly` and `RichTextBox.formatRange`:

```ml
Gui.RichTextBox.formatRange(ui.richText, 0, 7, "#3867d6", true, false)
```

The last two arguments select bold and italic. The range end is exclusive.
Windows RichEdit ranges currently use UTF-16 positions; GTK uses Unicode
character positions. Plain-text get/set remains UTF-8 on both targets.
Rich-text document import/export (RTF, DOCX or HTML) is not part of this API.

`CodeEditor` adds a monospace editing surface and syntax coloring. Its `language`
property accepts `minilang`, `python`, `json`, `c`, `cpp` or an empty string.
Windows uses a lightweight keyword/string/comment highlighter over RichEdit;
Linux uses GtkSourceView with a MiniLang highlighter. GtkSourceView also provides
line numbers and auto-indentation. Completion, diagnostics and debugging are
not implemented.

## PropertyGrid

`PropertyGrid.create(..., items)` accepts property/value rows:

```json
{
  "id": "properties",
  "type": "PropertyGrid",
  "properties": {
    "items": [["Name", "Ada"], ["Language", "MiniLang"]],
    "width": 320,
    "height": 160
  }
}
```

Use `PropertyGrid.getValue(control, row)` and
`PropertyGrid.setValue(control, row, value)`. It is an editable two-column
DataGrid; values are strings. This first version does not infer custom editors
or validation rules from an object model.

## WebView

`WebView` embeds WebView2 on Windows and WebKitGTK on Linux. Use either `url`
or `html` in MSON. If both are specified, HTML is applied last.

```ml
Gui.WebView.navigate(ui.browser, "https://example.org")
Gui.WebView.loadHtml(ui.browser, "<h1>Hello MiniGui</h1>")
status = Gui.WebView.getStatus(ui.browser)
```

Status is `0` during initialization/loading, `1` when usable, and `-1` for a
reported initialization failure. Initialization is asynchronous: the application
must process native messages. A successful navigation request is not proof that
a remote server loaded successfully. The API currently provides no JavaScript
bridge or navigation-completed event. Web content runs with the browser engine's
normal behavior; only load content appropriate for the application.

## TrayIcon

`TrayIcon` is a non-layout desktop entry. Set its `items` to context-menu labels.
A click handler receives the selected zero-based menu index in `event.newValue`.
Windows also supports a primary click without menu selection.

```json
{
  "id": "tray",
  "type": "TrayIcon",
  "properties": {"text": "My application", "items": ["Show", "Exit"]},
  "events": {"click": "onTray"}
}
```

`TrayIcon.setIcon` accepts an ICO file on Windows and an icon name/path on Linux.
The default uses a generic application icon. Linux visibility depends on desktop
AppIndicator support. Closing/disposal removes the application's tray resources.

## DrawingCanvas and Chart

`DrawingCanvas` retains drawing commands and repaints them after exposure:

```ml
Gui.DrawingCanvas.clear(ui.drawing)
Gui.DrawingCanvas.fillRect(ui.drawing, 10, 10, 120, 55, "#3867d6")
Gui.DrawingCanvas.line(ui.drawing, 10, 80, 230, 30, "#cc5544")
Gui.DrawingCanvas.drawText(ui.drawing, 10, 105, "MiniGui", "#202020")
```

`Chart` accepts a `values` array, `chartType` (`bar` or `line`) and `color`.
MSON validates nonnegative integer values. In code use
`Chart.setValues(control, values, chartType, color)`. Charts use the control size
at the time values are assigned; call it again after resizing to recompute the
plot. Axes, legends, negative values and interactive chart navigation are not
implemented.
