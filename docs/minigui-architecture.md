# MiniGui architecture plan

MiniGui is implemented as a vertical prototype that fits the current MiniLang
compiler instead of extending the compiler syntax. MiniLang already provides:

- `package` and `import` for multi-file programs.
- Structs with static and instance methods.
- First-class MiniLang functions.
- `extern function` imports for Win32 DLL calls.
- `nativeCallback(fn, "wndproc")` for ABI-safe Win32 window procedures.
- `nativeBytesPtr(bytes)` for passing byte-buffer payload pointers to Win32
  structs.
- `nativeRawValue(value)` and `nativeValueFromRaw(int)` for storing opaque
  MiniLang values in Win32 userdata slots.
- A source stdlib with file I/O.
- Compiler option `--subsystem gui` for Windows GUI executables.

The native backend keeps the public API backend-neutral and uses a small Win32
bridge. The runtime registers a `MiniGuiWindow` class with a MiniLang `WNDPROC`
callback, falling back to subclassing a standard `#32770` window if class
registration is unavailable. Standard Win32 `WM_COMMAND` notifications and
window lifecycle messages are routed to MiniLang event bindings. The application
state is attached to each top-level window through `GWLP_USERDATA`, so the
WndProc can recover the right MiniLang app object from the HWND. The MSON parser,
validator and generator are independent from this backend.

## Build-time flow

```text
app.mson + app.ml
  -> tools/minigui.exe validate/generate/build
  -> generated readable MiniLang code
  -> build/mlc_win64.exe + MiniGuiLib/minigui.ml
  -> Windows PE executable
```

MSON is never parsed at runtime. The generated file imports the code-behind
file and `MiniGuiLib.minigui`. In the separated project layout, `tools/minigui.ml`
uses `..\MiniLangCompilerML\build\mlc_win64.exe` as the default compiler and
passes the MiniGui project root as an import path.

## Runtime flow

`MiniGuiLib/minigui.ml` contains the first MiniGui runtime:

- `Application.create()` stores windows, controls and event bindings.
- `Window.create(...)` creates a top-level Win32 window from the registered
  `MiniGuiWindow` class, with subclassing as fallback.
- `Label.create(...)`, `Button.create(...)`, `TextBox.create(...)`,
  `TextArea.create(...)`, `CheckBox.create(...)`, `RadioButton.create(...)`,
  `Panel.create(...)`, `GroupBox.create(...)`, `ComboBox.create(...)`,
  `ListBox.create(...)` and `ScrollBar.create(...)` create standard Win32
  controls.
- `Control.getText`, `Control.setText`, `Control.setEnabled` and
  `Control.setVisible` hide native handles from application code.
- `Control.isChecked` and `Control.setChecked` expose checked state for
  checkbox-style controls.
- `Control.addItem`, `Control.setItems`, `Control.getSelectedIndex` and related
  APIs expose list-style controls without leaking Win32 messages.
- `Control.getScrollValue`, `Control.setScrollValue`, `Control.setScrollRange`
  and `Control.setScrollSteps` expose scrollbar state.
- `Events.bindLoad`, `Events.bindClose`, `Events.bindClick`,
  `Events.bindTextChanged`, `Events.bindSelectionChanged` and
  `Events.bindScrollChanged` bind MiniLang callbacks.
- `Application.run(app)` processes the Windows message queue with `GetMessageW`.
- The runtime WndProc handles `WM_COMMAND`, `WM_HSCROLL`, `WM_VSCROLL`,
  `WM_CLOSE` and `WM_DESTROY`.
- Button clicks (`BN_CLICKED`), textbox changes (`EN_CHANGE`) and selection
  changes (`CBN_SELCHANGE`/`LBN_SELCHANGE`) are dispatched from `WM_COMMAND`.
- Scrollbar changes are dispatched from `WM_HSCROLL` and `WM_VSCROLL`.
- Window `load` is dispatched when a window is shown. Window `close` is
  dispatched from `WM_CLOSE`; setting `event.cancel = true` prevents closing.

The generated code passes a typed UI context struct to each handler:

```ml
function onGreetButtonClick(ui, event)
  name = MiniGui.Control.getText(ui.nameTextBox)
  MiniGui.Control.setText(ui.resultLabel, "Hallo, " + name + "!")
end function
```

## Generated code strategy

The generator emits deterministic MiniLang:

- Stable function and struct names derived from the MSON namespace.
- A generated UI context struct with one field per named window/control.
- Literal source comments referencing the input MSON file.
- Direct calls to public `MiniGuiLib.minigui` APIs only.
- Event binding calls to imported code-behind functions.

The code-behind file should declare a package. The generator imports it with
an alias so handlers are referenced as `CodeBehind.handlerName`.

## Scope of this prototype

Implemented end to end:

- JSON-based `.mson` parsing with validation.
- Relative imports for additional MSON files.
- Reusable components with stable ID prefixes.
- Local and imported resources.
- VerticalStack, HorizontalStack, Grid and Canvas code generation.
- Panel and GroupBox container controls with nested child generation.
- Window, Label, Button, TextBox, TextArea, CheckBox, RadioButton, Panel,
  GroupBox, ComboBox, ListBox and ScrollBar runtime controls.
- Native window-class registration plus `WNDPROC` bridge for Win32 command and
  window lifecycle events.
- Per-window app-state lookup through `GWLP_USERDATA`.
- CLI commands `validate`, `generate` and `build`.
- Hello-GUI, full control-gallery and modular customer-form examples.
- Test framework coverage for generated constructors, event bindings, runtime
  control APIs and code-behind behavior.

Documented extension points:

- Additional controls can be added through the MiniLang control registry and
  `MiniGuiLib/minigui.ml` runtime constructors.
- Additional Win32 notifications can be added in `Events.dispatchCommand`
  without changing MSON or generated handler signatures.
