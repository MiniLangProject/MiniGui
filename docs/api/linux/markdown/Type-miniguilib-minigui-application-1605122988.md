# `MiniGuiLib.minigui.Application`

[Home](README.md) · [Source file](File-miniguilib-minigui-ml-1319721044.md)

<a id="struct-struct-miniguilib-minigui-application-struct-application-miniguilib-minigui-ml-1406119329"></a>
## Application

```ml
struct Application
```

Native Application operations.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L6140)

## Members

<a id="static_method-static-method-miniguilib-minigui-application-create-static-function-create-miniguilib-minigui-ml-1950541448"></a>
### create

```ml
static function create()
```

create for the Application backend implementation.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L6142)

<a id="static_method-static-method-miniguilib-minigui-application-dispose-static-function-dispose-app-miniguilib-minigui-ml-1526319089"></a>
### dispose

```ml
static function dispose(app)
```

dispose for the Application backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | app supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L6176)

<a id="static_method-static-method-miniguilib-minigui-application-pump-static-function-pump-app-wait-miniguilib-minigui-ml-558180210"></a>
### pump

```ml
static function pump(app, wait)
```

pump for the Application backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | app supplied by the caller. |
| `wait` | `dynamic` | — | wait supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L6189)

<a id="static_method-static-method-miniguilib-minigui-application-resizewindow-static-function-resizewindow-app-window-width-height-miniguilib-minigui-ml-538788546"></a>
### resizeWindow

```ml
static function resizeWindow(app, window, width, height)
```

resizeWindow for the Application backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | app supplied by the caller. |
| `window` | `dynamic` | — | window supplied by the caller. |
| `width` | `dynamic` | — | width supplied by the caller. |
| `height` | `dynamic` | — | height supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L6262)

<a id="static_method-static-method-miniguilib-minigui-application-run-static-function-run-app-miniguilib-minigui-ml-1153699829"></a>
### run

```ml
static function run(app)
```

run for the Application backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | app supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L6161)

<a id="static_method-static-method-miniguilib-minigui-application-setstartupwindow-static-function-setstartupwindow-app-window-miniguilib-minigui-ml-848416671"></a>
### setStartupWindow

```ml
static function setStartupWindow(app, window)
```

setStartupWindow for the Application backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | app supplied by the caller. |
| `window` | `dynamic` | — | window supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L6154)
