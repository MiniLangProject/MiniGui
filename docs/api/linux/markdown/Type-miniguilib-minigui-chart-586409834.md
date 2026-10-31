# `MiniGuiLib.minigui.Chart`

[Home](README.md) · [Source file](File-miniguilib-minigui-ml-1319721044.md)

<a id="struct-struct-miniguilib-minigui-chart-struct-chart-miniguilib-minigui-ml-563258325"></a>
## Chart

```ml
struct Chart
```

Native Chart operations.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L8273)

## Members

<a id="static_method-static-method-miniguilib-minigui-chart-clear-static-function-clear-control-miniguilib-minigui-ml-1139713945"></a>
### clear

```ml
static function clear(control)
```

Clears retained drawing commands.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L8289)

<a id="static_method-static-method-miniguilib-minigui-chart-create-static-function-create-app-parent-id-text-x-y-width-height-miniguilib-minigui-ml-509320881"></a>
### create

```ml
static function create(app, parent, id, text, x, y, width, height)
```

Creates a native Chart control.

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L8283)

<a id="static_method-static-method-miniguilib-minigui-chart-setvalues-static-function-setvalues-control-values-charttype-color-miniguilib-minigui-ml-773549670"></a>
### setValues

```ml
static function setValues(control, values, chartType, color)
```

Draws a bar or line chart from nonnegative numeric values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `values` | `dynamic` | — | values supplied by the caller. |
| `chartType` | `dynamic` | — | chartType supplied by the caller. |
| `color` | `dynamic` | — | color supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L8298)
