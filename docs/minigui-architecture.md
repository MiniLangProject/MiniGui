# MiniGui architecture

MiniGui keeps the declarative UI format separate from MiniLang compiler syntax.
Applications describe their windows in JSON-based `.mson` files, the generator
emits readable MiniLang source, and `MiniGuiLib/minigui.ml` supplies the native
Windows x64 or Linux x64 runtime.

The implementation uses current MiniLang Compiler 1.2.6 features and standard
library facilities:

- `package` and `import` for multi-file programs.
- Structs with static and instance methods and first-class functions.
- `const`, explicit `function inline`, and exact typed FFI declarations.
- `std.ds.list` and `std.string_builder` for geometrically growing collections
  and output buffers.
- `std.process` plus CreateProcessW on Windows or fork/execvp/waitpid on Linux
  for compiler discovery and shell-free execution.
- `nativeCallback`, `nativeBytesPtr`, `nativeRawValue`, and
  `nativeValueFromRaw` for Win32 callbacks and opaque handles.
- Compiler option `--subsystem gui` for native Windows applications.

The public runtime API selects its implementation through compile-time
`TARGET_OS` branches. Win32 controls remain implemented in MiniLang; advanced
Windows widgets use `native/windows/minigui_extra.cpp`. Linux uses
`native/linux/minigui_gtk.c`, a GTK bridge with an event queue. The GTK callbacks
never call MiniLang directly: `Application.pump` consumes events on the UI thread.

## Build-time flow

```text
app.mson + app.ml
  -> tools/minigui.exe validate/generate/build
  -> deterministic generated MiniLang source
  -> selected Python or self-hosted compiler + MiniGuiLib/minigui.ml
  -> Windows x64 PE or Linux x64 ELF executable + native bridge library
```

MSON is parsed only during generation. The generated file imports the
code-behind module and `MiniGuiLib.minigui`, creates the application object and
controls, binds handlers, and enters the runtime message loop.

The Windows CLI defaults to the neighboring self-hosted compiler; the Linux CLI
defaults to the neighboring Python compiler. Both accept either compiler through
`--compiler`. The CLI locates the selected compiler's standard
library root and invokes the process directly through `CreateProcessW` using
Windows CRT argument quoting. The Linux CLI uses an argv vector passed to execvp. No command shell
participates in the build path. Target-native libraries are copied beside the
application before compilation.

## Parser, imports, and validation

The hand-written JSON parser enforces strict integer syntax, rejects duplicate
keys and raw control characters, and decodes Unicode surrogate pairs. Before
code generation, semantic validation rejects duplicate or reserved IDs,
unknown controls and components, invalid resources, and handler names that
cannot be emitted as MiniLang references.

Resource and component imports are resolved relative to the importing document
and then through explicit include directories. Active import stacks detect
cycles, while a separate document set deduplicates shared diamond dependencies.
Windows path identity is case-insensitive; Linux path identity is case-sensitive.

Defensive limits bound untrusted input work: 16 MiB per document, 128 container
levels, and 4,096 documents per import graph. Import paths remain intentionally
capable of naming any readable file, so callers that accept untrusted MSON must
apply their own root policy.

## Generated code strategy

The generator emits stable, readable MiniLang:

- Stable function and struct names derived from the MSON namespace.
- A typed UI context struct with one field per named window and control.
- Literal source comments that identify the input MSON file.
- Direct calls to the public `MiniGuiLib.minigui` API.
- Event bindings to an explicitly imported code-behind module.
- Deterministic traversal and output independent of compiler choice.

Append-heavy parser and generator paths use growable lists and string builders,
then materialize normal MiniLang arrays only at API boundaries. This avoids
quadratic array and string copying for large UI descriptions.

## Windows runtime flow

`MiniGuiLib/minigui.ml` registers a `MiniGuiWindow` class with a MiniLang
`WNDPROC` callback and falls back to subclassing a standard `#32770` window if
registration is unavailable. Each top-level HWND stores its MiniLang
application object in `GWLP_USERDATA`, allowing callbacks to recover the correct
runtime state.

The runtime provides:

- Application and window creation plus a `GetMessageW` message loop.
- Standard controls, container controls, menus, pickers, list/table controls,
  date/time controls, and the public APIs documented in the user guide.
- Vertical/horizontal stacks, grids, canvases, dock panels, and wrap panels.
- Typed event objects for load, close, resize, click, text, selection, scroll,
  value, focus, blur, validation, submit, and control-specific notifications.
- Runtime resize modes (`scale`, `none`, `anchor`, and `fill`) with size limits.
- UTF-8 to UTF-16 conversion for native text, including non-BMP characters.

`WM_COMMAND`, scroll, notify, close, size, destroy, and related messages are
routed through binding tables. Closing a secondary window destroys only that
window; only destruction of the configured startup window posts the application
quit message. Normal resizing is driven by `WM_SIZE`, with a low-frequency timer
fallback for native edge cases.

Win32 controls have UI-thread affinity. Background work may use MiniLang
threads, but control mutations must be marshalled to the message-loop thread by
the application.

## Native resource ownership

MiniGui owns native brushes and tooltip windows created for its controls.
Replacing a background brush or tooltip first releases the previous handle.
When `Application.run` exits, the runtime clears bindings and releases all
remaining MiniGui-owned resources. This ownership rule prevents long-running
applications from accumulating GDI or USER handles during repeated updates.

## Verification

The test suite exercises validation, deterministic source generation, examples,
control construction and interaction, resize behavior, code-behind dispatch,
Unicode conversion, resource replacement, empty runtime state, import graphs,
and hostile command-line paths.

When both compiler repositories are present, it also verifies byte-identical
MiniGui CLI executables and generated source from the Python and self-hosted
compilers, followed by a self-hosted application build and runtime smoke test.
MiniDoc generation runs in strict mode so declaration comments and committed API
reference output cannot drift silently.

## Extension points

To add a control, extend the generator's control metadata and validation, add a
runtime constructor and behavior in `MiniGuiLib/minigui.ml`, update the schema,
and cover it in the gallery and tests. New native backends should preserve the
public runtime API and generated MSON shape, replacing only platform-specific
windowing, controls, events, and resource management.

## Linux runtime and advanced controls

GTK owns the native widgets. Bridge node records live until application disposal,
so queued IDs remain valid even after widget destruction. The event queue carries
IDs, event kinds, numeric payloads and copied UTF-8 text. MiniLang looks up the
matching control and dispatches ordinary code-behind handlers.

Fixed-coordinate hosts suppress preferred-size feedback into top-level windows.
ScrollViewer keeps GTK's normal content-size behavior so content can scroll.
Native notebook pages retain their actual mount parents. TreeView uses a
GtkTreeStore and tables use a GtkListStore with editable renderers.

WebView uses WebKitGTK on Linux and asynchronously initialized WebView2 on Windows.
RichTextBox uses GtkTextView or RichEdit; CodeEditor adds GtkSourceView or a small
native highlighter. DrawingCanvas and Chart retain commands for Cairo/GDI repaint.
TrayIcon uses AppIndicator or Shell_NotifyIcon.

`Application.dispose` destroys windows and releases owned resources.
`Application.pump` is also available for bounded event processing in tests.
The native browser engines and widgets keep UI-thread affinity.

See [platforms](platforms.md) for build/deployment details and tested coverage.
