# `MiniGuiLib.minigui.Application`

[Home](README.md) · [Source file](File-miniguilib-minigui-ml-1319721044.md)

<a id="struct-struct-miniguilib-minigui-application-struct-application-miniguilib-minigui-ml-1406119329"></a>
## Application

```ml
struct Application
```

Represents the application data used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1622)

## Members

<a id="static_method-static-method-miniguilib-minigui-application-addcontrol-static-function-addcontrol-app-control-miniguilib-minigui-ml-676200652"></a>
### addControl

```ml
static function addControl(app, control)
```

Adds control to the state managed by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | Application instance operated on by this call. |
| `control` | `dynamic` | — | control value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1645)

<a id="static_method-static-method-miniguilib-minigui-application-addwindow-static-function-addwindow-app-window-miniguilib-minigui-ml-351853637"></a>
### addWindow

```ml
static function addWindow(app, window)
```

Adds window to the state managed by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | Application instance operated on by this call. |
| `window` | `dynamic` | — | window value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1632)

<a id="static_method-static-method-miniguilib-minigui-application-create-static-function-create-miniguilib-minigui-ml-1950541448"></a>
### create

```ml
static function create()
```

Creates application for the minigui application module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1624)

<a id="static_method-static-method-miniguilib-minigui-application-dispose-static-function-dispose-app-miniguilib-minigui-ml-1526319089"></a>
### dispose

```ml
static function dispose(app)
```

Destroys application windows and releases runtime resources.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | app supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1879)

<a id="static_method-static-method-miniguilib-minigui-application-pollresize-static-function-pollresize-app-miniguilib-minigui-ml-1063046351"></a>
### pollResize

```ml
static function pollResize(app)
```

Performs the pollResize operation for the minigui application module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | Application instance operated on by this call. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1774)

<a id="static_method-static-method-miniguilib-minigui-application-pump-static-function-pump-app-wait-miniguilib-minigui-ml-558180210"></a>
### pump

```ml
static function pump(app, wait)
```

Processes native messages, optionally waiting for one.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | app supplied by the caller. |
| `wait` | `dynamic` | — | wait supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1871)

<a id="static_method-static-method-miniguilib-minigui-application-redrawall-static-function-redrawall-app-miniguilib-minigui-ml-2027861673"></a>
### redrawAll

```ml
static function redrawAll(app)
```

Performs the redrawAll operation for the minigui application module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | Application instance operated on by this call. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1816)

<a id="static_method-static-method-miniguilib-minigui-application-resizewindow-static-function-resizewindow-app-window-clientwidth-clientheight-miniguilib-minigui-ml-857300068"></a>
### resizeWindow

```ml
static function resizeWindow(app, window, clientWidth, clientHeight)
```

Performs the resizeWindow operation for the minigui application module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | Application instance operated on by this call. |
| `window` | `dynamic` | — | window value consumed by this operation. |
| `clientWidth` | `dynamic` | — | clientWidth value consumed by this operation. |
| `clientHeight` | `dynamic` | — | clientHeight value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1691)

<a id="static_method-static-method-miniguilib-minigui-application-run-static-function-run-app-miniguilib-minigui-ml-1153699829"></a>
### run

```ml
static function run(app)
```

Runs run for the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | Application instance operated on by this call. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1843)

<a id="static_method-static-method-miniguilib-minigui-application-setstartupwindow-static-function-setstartupwindow-app-window-miniguilib-minigui-ml-848416671"></a>
### setStartupWindow

```ml
static function setStartupWindow(app, window)
```

Updates startup window maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | Application instance operated on by this call. |
| `window` | `dynamic` | — | window value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1663)

<a id="static_method-static-method-miniguilib-minigui-application-syncdynamiccontrols-static-function-syncdynamiccontrols-app-miniguilib-minigui-ml-2002184905"></a>
### syncDynamicControls

```ml
static function syncDynamicControls(app)
```

Performs the syncDynamicControls operation for the minigui application module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | Application instance operated on by this call. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1801)

<a id="static_method-static-method-miniguilib-minigui-application-timerproc-static-function-timerproc-hwnd-msg-wparam-lparam-miniguilib-minigui-ml-710608009"></a>
### timerProc

```ml
static function timerProc(hwnd, msg, wParam, lParam)
```

Performs the timerProc operation for the minigui application module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `msg` | `dynamic` | — | msg value consumed by this operation. |
| `wParam` | `dynamic` | — | wParam value consumed by this operation. |
| `lParam` | `dynamic` | — | lParam value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1682)

<a id="static_method-static-method-miniguilib-minigui-application-windowproc-static-function-windowproc-hwnd-msg-wparam-lparam-miniguilib-minigui-ml-1793497217"></a>
### windowProc

```ml
static function windowProc(hwnd, msg, wParam, lParam)
```

Performs the windowProc operation for the minigui application module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `msg` | `dynamic` | — | msg value consumed by this operation. |
| `wParam` | `dynamic` | — | wParam value consumed by this operation. |
| `lParam` | `dynamic` | — | lParam value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1673)
