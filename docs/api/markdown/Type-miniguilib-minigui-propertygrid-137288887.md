# `MiniGuiLib.minigui.PropertyGrid`

[Home](README.md) · [Source file](File-miniguilib-minigui-ml-1319721044.md)

<a id="struct-struct-miniguilib-minigui-propertygrid-struct-propertygrid-miniguilib-minigui-ml-139841287"></a>
## PropertyGrid

```ml
struct PropertyGrid
```

Native PropertyGrid operations.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L8325)

## Members

<a id="static_method-static-method-miniguilib-minigui-propertygrid-create-static-function-create-app-parent-id-text-x-y-width-height-items-miniguilib-minigui-ml-129547256"></a>
### create

```ml
static function create(app, parent, id, text, x, y, width, height, items)
```

Creates an editable two-column property table.

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
| `items` | `dynamic` | — | items supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L8336)

<a id="static_method-static-method-miniguilib-minigui-propertygrid-getvalue-static-function-getvalue-control-row-miniguilib-minigui-ml-1586573124"></a>
### getValue

```ml
static function getValue(control, row)
```

Returns the property value at a row.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `row` | `dynamic` | — | row supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L8351)

<a id="static_method-static-method-miniguilib-minigui-propertygrid-setvalue-static-function-setvalue-control-row-value-miniguilib-minigui-ml-1953252095"></a>
### setValue

```ml
static function setValue(control, row, value)
```

Updates the property value at a row.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `row` | `dynamic` | — | row supplied by the caller. |
| `value` | `dynamic` | — | value supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L8359)
