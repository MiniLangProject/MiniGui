# MiniGui 0.1.0

The first versioned MiniGui release builds native Windows x64 and Linux x64
applications from the same MSON UI and MiniLang application logic.

- Added RichTextBox, CodeEditor, PropertyGrid, TrayIcon, WebView, DrawingCanvas
  and Chart, with a runnable advanced-controls example.
- Added a GTK 3 backend, native event queue, dialogs, tree/table models,
  layout resizing and resource disposal.
- Added explicit --target windows-x64 / --target linux-x64 builds, native-library
  deployment and a CLI that runs on both Windows and Linux.
- Updated the guides and generated separate Windows/Linux MiniDoc references.

Use matching MiniLang Compiler 1.2.6 checkouts. The Python compiler includes the
C-string return fix required for reliable GTK text access.

The SDK ZIP contains the MiniLang library and generator source, Windows and
Linux generator executables, both native bridge libraries, examples and docs.
On Linux, run `chmod +x tools/minigui` after extraction. The compiler and system
GUI/browser dependencies are installed separately; see
[the platform guide](docs/platforms.md) for setup and deployment.

Verification includes the full Windows MiniGui regression suite, native GTK
signal/model tests, all new controls through MiniLang and build/startup of all
four examples on Linux. Both MiniDoc targets pass strict checks without warnings.
Cross-host output was exercised in both directions.

Linux tests run under WSL Ubuntu with X11/Xvfb. Wayland and desktop tray
integration need desktop-specific verification. The editors, property grid and
charts provide the documented initial feature set; see
[advanced controls](docs/advanced-controls.md) for their capabilities and limits.
