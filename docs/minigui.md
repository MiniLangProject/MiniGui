# MiniGui user guide

MiniGui describes MiniLang desktop UIs in JSON `.mson` files and keeps
application logic in normal `.ml` files. Windows x64 uses Win32; Linux x64 uses
GTK 3. Use the current MiniLang Compiler 1.2.5 checkout with the Linux C-string
return fix. Both the Python and self-hosted compilers are supported.

See [platform builds and deployment](platforms.md) and [advanced controls](advanced-controls.md).

## CLI

MiniGui is expected to live next to a MiniLang compiler checkout. The examples
use the faster Python compiler at `..\MiniLangCompilerPy\mlc_win64.py`; use
`--compiler <path>` to override that.

```powershell
py -3.14 ..\MiniLangCompilerPy\mlc_win64.py .\tools\minigui.ml .\tools\minigui.exe -I . -I ..\MiniLangCompilerPy
.\tools\minigui.exe validate .\examples\hello-gui\app.mson
.\tools\minigui.exe generate .\examples\hello-gui\app.mson --output .\examples\hello-gui\build\app.gui.ml
.\tools\minigui.exe build .\examples\hello-gui\app.mson --output .\examples\hello-gui\build\hello-gui.exe
.\examples\control-gallery\build.ps1
```

Useful options:

- `--code-behind <file>` overrides the `codeBehind` property.
- `--output <file>` writes generated `.ml` or final `.exe`.
- `--generated-dir <dir>` controls the generated source directory for `build`.
- `--include-dir <dir>` adds MSON import search paths.
- `--compiler <path>` selects the MiniLang compiler.
- `--no-compile` makes `build` stop after generation.
- `--keep-generated` preserves generated files.

`build` starts the selected compiler directly with `CreateProcessW`; arguments
are quoted according to the Windows CRT rules and are never interpreted by a
command shell. The CLI also discovers the selected compiler's standard-library
root, so a Python compiler script and a self-hosted compiler executable can be
used interchangeably.

## MSON basics

MSON is valid JSON with file extension `.mson`.

```json
{
  "$schema": "../../schemas/minigui.schema.json",
  "version": 1,
  "namespace": "hello_gui",
  "codeBehind": "app.ml",
  "application": {
    "name": "HelloGui",
    "startupWindow": "mainWindow"
  },
  "windows": [
    {
      "id": "mainWindow",
      "type": "Window",
      "properties": {
        "title": "MiniGui",
        "width": 480,
        "height": 220
      },
      "layout": {
        "type": "VerticalStack",
        "properties": { "padding": 14, "spacing": 8 },
        "children": []
      }
    }
  ]
}
```

Supported controls:

- `Window`
- `Label`
- `Button`
- `FilePicker`
- `FolderPicker`
- `ColorPicker`
- `TextBox`
- `SearchBox`
- `TextArea`
- `PasswordBox`
- `NumberBox`
- `SpinBox` with native up/down arrows
- `CheckBox`
- `ToggleSwitch`
- `RadioButton`
- `Image`
- `Separator`
- `Splitter` with drag, optional `targetBefore`/`targetAfter` pane resizing, and `changed`/`valueChanged` events
- `LinkLabel`
- `Panel`
- `ScrollViewer`
- `GroupBox`
- `ComboBox`
- `EditableComboBox`
- `ListBox`
- `ScrollBar`
- `Slider`
- `ProgressBar`
- `TabControl`
- `MenuBar`
- `ContextMenu`
- `StatusBar`
- `ToolBar`
- `TreeView`
- `ListView`
- `Table`
- `DataGrid` with columns, row selection, `columnWidths`, `editable`, inline cell editing, `setCellText`, and `getCellText`
- `DatePicker`
- `DateTimePicker`
- `TimePicker`
- `Calendar`
- Component names declared in `components`

Supported layouts:

- `VerticalStack`
- `HorizontalStack`
- `Grid`
- `Canvas`
- `DockPanel`
- `WrapPanel`

Supported window events:

- `load`
- `close`
- `resized`

Supported control events:

- `click`
- `clicked`
- `textChanged`
- `selectionChanged`
- `selected`
- `scrollChanged`
- `valueChanged`
- `changed`
- `change`
- `focus`
- `blur`

Handlers receive `(ui, event)`. `ui` is the generated context struct. `event`
contains `sender`, `eventType`, `oldValue`, `newValue` and `cancel`. A `close`
handler can set `event.cancel = true` to keep the window open.

Common control properties in MSON:

- `text`
- `width`, `height`
- `x`, `y` for `Canvas` placement
- `visible`
- `enabled`
- `resizeMode`: `scale`, `none`, `anchor`, or `fill`
- `anchor`: edge list such as `left,top`, `right,bottom`, or `left,top,right,bottom`
- `minWidth`, `minHeight`, `maxWidth`, `maxHeight`
- `tooltip`
- `tabIndex`

`resizeMode` controls runtime behavior when the parent window or container
changes size. The default is `scale` for backwards compatibility. Use `anchor`
for form-style layouts where controls should stay attached to one or more
edges, and use `fill` when a content area should grow with its parent.

Additional control properties:

- `CheckBox`, `RadioButton`, `ToggleSwitch`: `checked`
- `Panel`, `GroupBox`, `ScrollViewer`: `children`, `padding`, `spacing`
- `ComboBox`, `EditableComboBox`, `ListBox`, `TabControl`, `TreeView`: `items`, `selectedIndex`
- `ListView`, `Table`, `DataGrid`: `columns`, `columnWidths`, `items`, `selectedIndex`
- `DataGrid`: `editable`
- `ScrollBar`, `Slider`: `orientation`, `minimum`, `maximum`, `value`, `smallStep`, `largeStep`
- `ProgressBar`: `minimum`, `maximum`, `value`
- `FilePicker`, `FolderPicker`, `ColorPicker`: dialog `title`; `FilePicker` also has `filter`

`Panel` and `GroupBox` can contain child controls or layout nodes. Child
positions are relative to the container.

Runtime control APIs:

- `MiniGui.Control.setText(control, text)` / `getText(control)`
- `MiniGui.Control.setEnabled(control, value)`
- `MiniGui.Control.setVisible(control, value)`
- `MiniGui.Control.setBounds(control, x, y, width, height)`
- `MiniGui.Control.setPosition(control, x, y)`
- `MiniGui.Control.setSize(control, width, height)`
- `MiniGui.Control.setLayout(control, resizeMode, anchor, minWidth, minHeight, maxWidth, maxHeight)`
- `MiniGui.Control.isChecked(control)` / `setChecked(control, value)`
- `MiniGui.Control.addItem(control, text)`
- `MiniGui.Control.setItems(control, items)`
- `MiniGui.Control.clearItems(control)`
- `MiniGui.Control.getSelectedIndex(control)` / `setSelectedIndex(control, index)`
- `MiniGui.Control.getSelectedText(control)`
- `MiniGui.Control.getScrollValue(control)` / `setScrollValue(control, value)`
- `MiniGui.Control.setScrollRange(control, minimum, maximum)`
- `MiniGui.Control.setScrollSteps(control, smallStep, largeStep)`
- `MiniGui.Control.getValue(control)` / `setValue(control, value)`
- `MiniGui.Control.setValueRange(control, minimum, maximum)`
- `MiniGui.Control.setColumnWidths(control, widths)`
- `MiniGui.Control.setEditable(dataGrid, value)` / `isEditable(dataGrid)`
- `MiniGui.Control.setCellText(dataGrid, row, column, text)` / `getCellText(dataGrid, row, column)`

For unset size constraints in `setLayout`, pass `-1`.

## Test applications

`examples/control-gallery` is the full MiniGui test application. It covers every
supported control, the common attributes, container nesting, all layout nodes and
all event binding paths.

`tests/minigui/run_minigui_tests.ps1` builds the MiniGui CLI, validates and
builds the example applications, checks generated code for expected constructors
and event bindings, and runs runtime smoke tests for code-behind behavior. It
also covers malformed MSON, import graphs, shell metacharacters in paths,
Unicode conversion, repeated GDI/tooltip replacement, empty runtime state, and
deterministic generation. If both compilers are available, the suite verifies
byte-identical Python/self-hosted CLI builds and generated source, then performs
a self-hosted application build and runtime smoke test.

For a 3,000-label synthetic input (about 202 KiB), the optimized parser and
generator reduced median generation time from 1,844.81 ms to 222.80 ms and peak
working set from 157.48 MiB to 43.70 MiB over five paired Windows x64 runs.
Generated output remained byte-identical.

## Imports, components and resources

`imports` loads other `.mson` files relative to the importing file, then the
include directories. Imported resources and components are available to the
entry file.

Components are declared with `name` and `content`. When a component is used
multiple times, generated internal IDs are prefixed with the instance ID.

Resource references use:

```json
{ "$resource": "windowTitle" }
```

Resources are resolved at build time.

## Input validation and trust boundary

The parser rejects duplicate object keys, malformed JSON integers, unpaired
Unicode surrogates, raw control characters, reserved MiniLang identifiers, and
invalid event handler names. A single MSON document is limited to 16 MiB,
container nesting to 128 levels, and an import graph to 4,096 distinct files.
Import cycles are diagnosed; shared dependencies in a diamond graph are loaded
only once and Windows paths are deduplicated case-insensitively.

MSON imports may intentionally refer to any readable local path. If an
application accepts third-party MSON, it should enforce its own allowed import
roots before invoking MiniGui. Code-behind files and explicitly selected
compiler executables are trusted code because `build` compiles and links them.

## Unicode, resources, and threading

MiniGui converts MiniLang UTF-8 strings to native UTF-16, including non-BMP
characters represented by surrogate pairs. Style brushes and tooltip windows
are owned by the runtime: replacements release the previous native handle and
`Application.run` releases remaining MiniGui-owned resources when the message
loop exits.

Win32 controls have UI-thread affinity. Worker threads may prepare data, but
must marshal UI mutations back to the thread running `Application.run`.

## Extending MiniGui

To add a control:

1. Add metadata to the control registry in `tools/minigui.ml`.
2. Add a runtime constructor to `MiniGuiLib/minigui.ml`.
3. Add validator and generator tests.

To add another backend, keep the public `MiniGuiLib.minigui` API and replace the
native implementation behind it. The MSON schema and generated code should not
need to change.
