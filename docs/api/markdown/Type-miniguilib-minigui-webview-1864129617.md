# `MiniGuiLib.minigui.WebView`

[Home](README.md) · [Source file](File-miniguilib-minigui-ml-1319721044.md)

<a id="struct-struct-miniguilib-minigui-webview-struct-webview-miniguilib-minigui-ml-1538764567"></a>
## WebView

```ml
struct WebView
```

Native WebView operations.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L8139)

## Members

<a id="static_method-static-method-miniguilib-minigui-webview-create-static-function-create-app-parent-id-text-x-y-width-height-miniguilib-minigui-ml-523381062"></a>
### create

```ml
static function create(app, parent, id, text, x, y, width, height)
```

Creates a native WebView control.

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L8149)

<a id="static_method-static-method-miniguilib-minigui-webview-getstatus-static-function-getstatus-control-miniguilib-minigui-ml-59063324"></a>
### getStatus

```ml
static function getStatus(control)
```

Returns 1 when ready, 0 while loading, or -1 after initialization failure.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L8169)

<a id="static_method-static-method-miniguilib-minigui-webview-loadhtml-static-function-loadhtml-control-html-miniguilib-minigui-ml-871340221"></a>
### loadHtml

```ml
static function loadHtml(control, html)
```

Displays HTML in the embedded browser.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `html` | `dynamic` | — | html supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L8163)

<a id="static_method-static-method-miniguilib-minigui-webview-navigate-static-function-navigate-control-url-miniguilib-minigui-ml-1077046805"></a>
### navigate

```ml
static function navigate(control, url)
```

Navigates the embedded browser to a URL.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `url` | `dynamic` | — | url supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L8156)
