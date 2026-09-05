# `MiniGuiLib.minigui.TrayIcon`

[Home](README.md) · [Source file](File-miniguilib-minigui-ml-1319721044.md)

<a id="struct-struct-miniguilib-minigui-trayicon-struct-trayicon-miniguilib-minigui-ml-2117831519"></a>
## TrayIcon

```ml
struct TrayIcon
```

Native TrayIcon operations.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L8176)

## Members

<a id="static_method-static-method-miniguilib-minigui-trayicon-create-static-function-create-app-parent-id-text-x-y-width-height-miniguilib-minigui-ml-1302142384"></a>
### create

```ml
static function create(app, parent, id, text, x, y, width, height)
```

Creates a native TrayIcon control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | app supplied by the caller. |
| `parent` | `dynamic` | — | parent supplied by the caller. |
| `id` | `dynamic` | — | id supplied by the caller. |
| `text` | `dynamic` | — | text supplied by the caller. |
| `x` | `dynamic` | — | x supplied by the caller. |
| `y` | `dynamic` | — | y supplied by the caller. |
| `width` | `dynamic` | — | width supplied by the caller. |
| `height` | `dynamic` | — | height supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L8186)

<a id="static_method-static-method-miniguilib-minigui-trayicon-seticon-static-function-seticon-control-source-miniguilib-minigui-ml-901549157"></a>
### setIcon

```ml
static function setIcon(control, source)
```

Sets an icon file on Windows or icon name/path on Linux.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `source` | `dynamic` | — | source supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L8200)

<a id="static_method-static-method-miniguilib-minigui-trayicon-setitems-static-function-setitems-control-items-miniguilib-minigui-ml-1423584774"></a>
### setItems

```ml
static function setItems(control, items)
```

Sets the system tray context menu labels.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `items` | `dynamic` | — | items supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L8193)
