# `MiniGuiLib.minigui.ListView`

[Home](README.md) · [Source file](File-miniguilib-minigui-ml-1319721044.md)

<a id="struct-struct-miniguilib-minigui-listview-struct-listview-miniguilib-minigui-ml-73518431"></a>
## ListView

```ml
struct ListView
```

Represents the list view data used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3031)

## Members

<a id="static_method-static-method-miniguilib-minigui-listview-create-static-function-create-app-parent-id-text-x-y-width-height-items-selectedindex-miniguilib-minigui-ml-1093664433"></a>
### create

```ml
static function create(app, parent, id, text, x, y, width, height, items, selectedIndex)
```

Creates list view for the minigui list view module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | Application instance operated on by this call. |
| `parent` | `dynamic` | — | parent value consumed by this operation. |
| `id` | `dynamic` | — | Stable identifier of the affected item. |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |
| `y` | `dynamic` | — | Vertical coordinate used by the operation. |
| `width` | `dynamic` | — | Width in the coordinate or storage units used by the caller. |
| `height` | `dynamic` | — | Height in the coordinate or storage units used by the caller. |
| `items` | `dynamic` | — | Items consumed or updated by the operation. |
| `selectedIndex` | `dynamic` | — | Zero-based index of selected. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3043)

<a id="static_method-static-method-miniguilib-minigui-listview-createcolumns-static-function-createcolumns-app-parent-id-text-x-y-width-height-columns-items-selectedindex-miniguilib-minigui-ml-1026378948"></a>
### createColumns

```ml
static function createColumns(app, parent, id, text, x, y, width, height, columns, items, selectedIndex)
```

Creates columns for the minigui list view module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | Application instance operated on by this call. |
| `parent` | `dynamic` | — | parent value consumed by this operation. |
| `id` | `dynamic` | — | Stable identifier of the affected item. |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |
| `y` | `dynamic` | — | Vertical coordinate used by the operation. |
| `width` | `dynamic` | — | Width in the coordinate or storage units used by the caller. |
| `height` | `dynamic` | — | Height in the coordinate or storage units used by the caller. |
| `columns` | `dynamic` | — | columns value consumed by this operation. |
| `items` | `dynamic` | — | Items consumed or updated by the operation. |
| `selectedIndex` | `dynamic` | — | Zero-based index of selected. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3069)
