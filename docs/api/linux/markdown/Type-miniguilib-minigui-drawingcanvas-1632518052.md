# `MiniGuiLib.minigui.DrawingCanvas`

[Home](README.md) · [Source file](File-miniguilib-minigui-ml-1319721044.md)

<a id="struct-struct-miniguilib-minigui-drawingcanvas-struct-drawingcanvas-miniguilib-minigui-ml-977103649"></a>
## DrawingCanvas

```ml
struct DrawingCanvas
```

Native DrawingCanvas operations.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L8218)

## Members

<a id="static_method-static-method-miniguilib-minigui-drawingcanvas-clear-static-function-clear-control-miniguilib-minigui-ml-1811991407"></a>
### clear

```ml
static function clear(control)
```

Clears retained drawing commands.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L8234)

<a id="static_method-static-method-miniguilib-minigui-drawingcanvas-create-static-function-create-app-parent-id-text-x-y-width-height-miniguilib-minigui-ml-900164703"></a>
### create

```ml
static function create(app, parent, id, text, x, y, width, height)
```

Creates a native DrawingCanvas control.

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L8228)

<a id="static_method-static-method-miniguilib-minigui-drawingcanvas-drawtext-static-function-drawtext-control-x-y-text-color-miniguilib-minigui-ml-156775394"></a>
### drawText

```ml
static function drawText(control, x, y, text, color)
```

Appends text at the supplied position.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `x` | `dynamic` | — | x supplied by the caller. |
| `y` | `dynamic` | — | y supplied by the caller. |
| `text` | `dynamic` | — | text supplied by the caller. |
| `color` | `dynamic` | — | color supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L8266)

<a id="static_method-static-method-miniguilib-minigui-drawingcanvas-fillrect-static-function-fillrect-control-x-y-width-height-color-miniguilib-minigui-ml-8518074"></a>
### fillRect

```ml
static function fillRect(control, x, y, width, height, color)
```

Appends a filled rectangle.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `x` | `dynamic` | — | x supplied by the caller. |
| `y` | `dynamic` | — | y supplied by the caller. |
| `width` | `dynamic` | — | width supplied by the caller. |
| `height` | `dynamic` | — | height supplied by the caller. |
| `color` | `dynamic` | — | color supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L8256)

<a id="static_method-static-method-miniguilib-minigui-drawingcanvas-line-static-function-line-control-x1-y1-x2-y2-color-miniguilib-minigui-ml-1333797116"></a>
### line

```ml
static function line(control, x1, y1, x2, y2, color)
```

Appends a line that is repainted after window exposure.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `x1` | `dynamic` | — | x1 supplied by the caller. |
| `y1` | `dynamic` | — | y1 supplied by the caller. |
| `x2` | `dynamic` | — | x2 supplied by the caller. |
| `y2` | `dynamic` | — | y2 supplied by the caller. |
| `color` | `dynamic` | — | color supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L8245)
