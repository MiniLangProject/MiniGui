# `MiniGuiLib.minigui.Window`

[Home](README.md) · [Source file](File-miniguilib-minigui-ml-1319721044.md)

<a id="struct-struct-miniguilib-minigui-window-struct-window-miniguilib-minigui-ml-1084394935"></a>
## Window

```ml
struct Window
```

Represents the window data used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1711)

## Members

<a id="static_method-static-method-miniguilib-minigui-window-close-static-function-close-window-miniguilib-minigui-ml-1463026958"></a>
### close

```ml
static function close(window)
```

Closes close owned by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `window` | `dynamic` | — | window value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1786)

<a id="static_method-static-method-miniguilib-minigui-window-create-static-function-create-app-id-title-width-height-miniguilib-minigui-ml-1508612899"></a>
### create

```ml
static function create(app, id, title, width, height)
```

Creates window for the minigui window module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | Application instance operated on by this call. |
| `id` | `dynamic` | — | Stable identifier of the affected item. |
| `title` | `dynamic` | — | Human-readable title presented to the user. |
| `width` | `dynamic` | — | Width in the coordinate or storage units used by the caller. |
| `height` | `dynamic` | — | Height in the coordinate or storage units used by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1718)

<a id="static_method-static-method-miniguilib-minigui-window-getclientheight-static-function-getclientheight-window-miniguilib-minigui-ml-852548574"></a>
### getClientHeight

```ml
static function getClientHeight(window)
```

Returns client height maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `window` | `dynamic` | — | window value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1811)

<a id="static_method-static-method-miniguilib-minigui-window-getclientwidth-static-function-getclientwidth-window-miniguilib-minigui-ml-1260740472"></a>
### getClientWidth

```ml
static function getClientWidth(window)
```

Returns client width maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `window` | `dynamic` | — | window value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1801)

<a id="static_method-static-method-miniguilib-minigui-window-installproc-static-function-installproc-window-callback-miniguilib-minigui-ml-720019567"></a>
### installProc

```ml
static function installProc(window, callback)
```

Performs the installProc operation for the minigui window module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `window` | `dynamic` | — | window value consumed by this operation. |
| `callback` | `dynamic` | — | Callback invoked when the operation completes or the event occurs. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1765)

<a id="static_method-static-method-miniguilib-minigui-window-settitle-static-function-settitle-window-title-miniguilib-minigui-ml-74257072"></a>
### setTitle

```ml
static function setTitle(window, title)
```

Updates title maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `window` | `dynamic` | — | window value consumed by this operation. |
| `title` | `dynamic` | — | Human-readable title presented to the user. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1795)

<a id="static_method-static-method-miniguilib-minigui-window-show-static-function-show-window-miniguilib-minigui-ml-1715024080"></a>
### show

```ml
static function show(window)
```

Performs the show operation for the minigui window module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `window` | `dynamic` | — | window value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1749)

<a id="static_method-static-method-miniguilib-minigui-window-startresizetimer-static-function-startresizetimer-window-callback-miniguilib-minigui-ml-434667065"></a>
### startResizeTimer

```ml
static function startResizeTimer(window, callback)
```

Starts resize timer for the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `window` | `dynamic` | — | window value consumed by this operation. |
| `callback` | `dynamic` | — | Callback invoked when the operation completes or the event occurs. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1778)
