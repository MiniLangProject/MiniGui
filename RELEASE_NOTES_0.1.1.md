# MiniGui 0.1.1

MiniGui adds `--target minux-x64` using MiniLang Compiler 1.3.9 and a native
MinUX desktop bridge. The SDK includes Windows, Linux and MinUX generator
executables, bridge libraries, matching sources, examples and documentation.

The MinUX backend supports one independent window, native controls, events,
message overlays and validated path/color entry. WebView, tray, rich/code
editors, canvas and multiple independent windows require additional OS support;
unsupported constructors report errors. See [platforms](docs/platforms.md).

Deploy `libminigui_minux.so` and the compiler's `libminilang_minux.so` into the
MinUX library directory. The MinUX generator is packed for the native loader.
The compiler itself and the MinUX operating system are installed separately.

Native guest tests cover controls, events, dialogs and generated video frames;
visual desktop review was not performed. Windows regression coverage is retained.
