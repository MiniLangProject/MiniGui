# Changelog

## 0.1.1 - 2026-11-15

- Add the native MinUX desktop bridge and `minux-x64` generator/deployment path.
- Package the MinUX runtime alongside Windows and Linux runtime libraries.
- Verify native GUI controls, events, dialogs and video frames in a MinUX guest.
- Retain explicit unsupported-control errors; document the one-window limit.

## 0.1.0 - 2026-09-05

- Added a GTK 3 Linux backend with native event queuing, controls, dialogs,
  tree/table models, tabs and resource disposal.
- Added RichTextBox, CodeEditor, PropertyGrid, TrayIcon, WebView, DrawingCanvas
  and Chart, plus a shared advanced-controls example.
- Added explicit Windows/Linux target selection, POSIX CLI process/path handling,
  and native-library deployment beside generated executables.
- Added pinned WebView2 SDK builds and GTK native build scripts.
- Added cross-platform MiniLang and native GTK tests; updated release packaging.
- Fixed explicit numeric widths being overridden by default fill alignment.
- Fixed missing notification on the first Windows resize.
- Updated user documentation and generated separate Windows/Linux MiniDoc APIs.
- Fixed the supporting Python compiler's native C-string return copy register
  handling; both compiler projects now cover C-string return regressions.
