# MiniGui

MiniGui is a separate MiniLang GUI prototype project. It lives next to the
MiniLang compiler checkout and uses that compiler as an external dependency.
The compiler must support `nativeCallback(fn, "wndproc")`, `nativeBytesPtr(bytes)`,
`nativeRawValue(value)` and `nativeValueFromRaw(int)`, which are used by
`MiniGuiLib` for the Win32 window procedure bridge, native window-class
registration and per-window application state.

Expected local layout:

```text
MiniGui/
  MiniGui/
    tools/
    MiniGuiLib/
    examples/
  MiniLangCompilerML/
    build/mlc_win64.exe
```

Build the hello example:

```powershell
cd .\MiniGui
..\MiniLangCompilerML\build\mlc_win64.exe .\tools\minigui.ml .\tools\minigui.exe -I . -I ..\MiniLangCompilerML
.\tools\minigui.exe build .\examples\hello-gui\app.mson --output .\examples\hello-gui\build\hello-gui.exe
```

Build the full control gallery:

```powershell
.\examples\control-gallery\build.ps1
```

Run MiniGui tests:

```powershell
.\tests\minigui\run_minigui_tests.ps1
```

The MiniGui CLI can use another compiler with `--compiler <path>`.
