# Windows and Linux builds

MiniGui uses one MSON format and one public MiniLang API. The compiler selects
the runtime with `--target windows-x64` or `--target linux-x64`. Generated source
contains conditional Windows callback wiring and can be reused for either target.

Use the current MiniLang Compiler 1.2.6 checkout. The Python compiler must include
the native C-string return fix delivered with this change; an older binary may
crash when a Linux widget returns text. Rebuild an old self-hosted compiler before
comparing compiler output.

## Native dependencies

Windows uses Win32 common controls plus `minigui_extra.dll` for RichEdit,
retained drawing, the tray and WebView2. Building this DLL needs Visual Studio C++
x64 tools. The build script downloads the pinned Microsoft.Web.WebView2 NuGet SDK
1.0.3537.50 on first use. Browser controls need the installed WebView2 Runtime.
The SDK is a build dependency; it is not copied into application packages.
The statically linked WebView2 loader's license and notices are included under
`native/windows/third-party` in the SDK and must accompany redistributions.

Linux uses GTK 3, GtkSourceView 4, WebKitGTK 4.1 and Ayatana AppIndicator. This
backend uses GTK 3 because the current tree, table, menu, editor and tray APIs
map directly to that toolkit. GTK 4 is not required.

On Ubuntu 24.04, install the build/test prerequisites:

```sh
sudo apt-get install build-essential pkg-config libgtk-3-dev \
  libgtksourceview-4-dev libwebkit2gtk-4.1-dev \
  libayatana-appindicator3-dev xvfb
```

Build each native backend once, from the MiniGui directory:

```powershell
pwsh ./native/windows/build.ps1
# Optional: build the Linux library in an installed WSL Ubuntu distribution.
wsl -d Ubuntu --cd (Get-Location).Path -- bash native/linux/build.sh
```

Or on Linux:

```sh
bash native/linux/build.sh
```

Outputs are `build/native/windows-x64/minigui_extra.dll` and
`build/native/linux-x64/libminigui_gtk.so`.

## Build from Windows

```powershell
py -3.14 ../MiniLangCompilerPy/mlc_win64.py tools/minigui.ml tools/minigui.exe -I . -I ../MiniLangCompilerPy

./tools/minigui.exe build examples/advanced-controls/app.mson --target windows-x64 --compiler ../MiniLangCompilerPy/mlc_win64.py --library-dir . --output build/advanced.exe
./tools/minigui.exe build examples/advanced-controls/app.mson --target linux-x64 --compiler ../MiniLangCompilerPy/mlc_win64.py --library-dir . --output build/advanced-linux
```

The Linux application can be cross-compiled on Windows. Building the GTK shared
library itself happens on Linux/WSL or on a Linux build agent.

## Build from Linux

```sh
python3 ../MiniLangCompilerPy/mlc_win64.py tools/minigui.ml build/minigui --target linux-x64 -I . -I ../MiniLangCompilerPy
build/minigui build examples/advanced-controls/app.mson --target linux-x64 --compiler ../MiniLangCompilerPy/mlc_win64.py --library-dir . --output build/advanced
./build/advanced
```

The CLI now handles POSIX paths case-sensitively and starts compilers with an
argument vector, without a shell. A Python compiler on Linux can also emit a
Windows application when the Windows native DLL has already been built and
placed under `build/native/windows-x64`. Building that DLL requires Windows C++
tools or a separately prepared Windows artifact.

## Deployment

The 0.1.0 SDK release contains generator executables for both hosts, native
bridges, sources, examples and documentation. After extracting the ZIP on Linux,
run `chmod +x tools/minigui`. The SDK does not bundle the compiler or the system
GTK/WebView runtime dependencies.

To reproduce the SDK after building both native bridges, run from Windows:

```powershell
pwsh ./tools/package-release.ps1 -Version 0.1.0 -IncludeLinux
```

The script writes `dist/MiniGui-0.1.0.zip` and its SHA-256 checksum.

`minigui build` copies the selected native library next to the output executable.
It fails with an actionable path if that library has not been built.

Ship `app.exe` with `minigui_extra.dll` on Windows. WebView2 applications also
require Microsoft's WebView2 Runtime on the destination machine.

Ship the ELF executable with `libminigui_gtk.so` on Linux, and install the GTK,
GtkSourceView, WebKitGTK and AppIndicator runtime packages on the destination.
The ELF imports the bridge using `$ORIGIN/libminigui_gtk.so`, so launching from a
different working directory does not require `LD_LIBRARY_PATH`. Preserve the
executable permission when copying the application.

Linux applications require a graphical desktop session. GTK supports X11 and
Wayland; the automated tests here exercise X11 through Xvfb. Wayland and desktop
tray integration still need testing on the intended desktop environments.
A tray entry only appears when the desktop provides a StatusNotifier/AppIndicator
host. This is a desktop capability, not an application build failure.

## Verification and documentation

```powershell
pwsh ./tests/minigui/run_minigui_tests.ps1
pwsh ./tests/minigui/run_cross_platform_tests.ps1 -LinuxDistro Ubuntu
pwsh ./tools/generate_minidoc.ps1
pwsh ./tools/generate_minidoc.ps1 -Target linux-x64
```

```sh
bash tests/minigui/run_linux_tests.sh
```

The Windows suite covers generator parity, actual control interaction, callbacks,
Unicode, resizing, resources, validation and release packaging. The Linux suite
covers native signals and models, all new controls through MiniLang, and native
build/startup of all four examples. Browser checks verify initialization and
HTML loading; they are not a full browser conformance suite.

The [Windows reference](api/markdown/README.md) and
[Linux reference](api/linux/markdown/README.md) are generated separately because
MiniDoc preprocesses source for the selected target.

## Scope and remaining limitations

Targets are x86-64 Windows and glibc-based Linux. ARM, macOS and static Linux
bundles are not supplied. Raw Win32 functions exposed by the original runtime
remain Windows-only; portable code should use the control classes.

GTK renders controls using the desktop theme, so pixel-identical appearance is
not promised. Date/time text formatting, native fonts and keyboard behavior can
differ. Full DPI-policy parity, complete accessibility testing and virtualized
large-data tables remain future work. The new editors provide text editing and
syntax coloring, not language-server features.
