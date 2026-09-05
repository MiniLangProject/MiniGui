# `MiniGuiLib.minigui.TabControl`

[Home](README.md) · [Source file](File-miniguilib-minigui-ml-1319721044.md)

<a id="struct-struct-miniguilib-minigui-tabcontrol-struct-tabcontrol-miniguilib-minigui-ml-265480311"></a>
## TabControl

```ml
struct TabControl
```

Represents the tab control data used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3034)

## Members

<a id="static_method-static-method-miniguilib-minigui-tabcontrol-addtab-static-function-addtab-control-index-text-miniguilib-minigui-ml-1325815454"></a>
### addTab

```ml
static function addTab(control, index, text)
```

Adds tab to the state managed by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `index` | `dynamic` | — | Zero-based index of the affected item. |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3065)

<a id="static_method-static-method-miniguilib-minigui-tabcontrol-create-static-function-create-app-parent-id-text-x-y-width-height-items-selectedindex-miniguilib-minigui-ml-2106808952"></a>
### create

```ml
static function create(app, parent, id, text, x, y, width, height, items, selectedIndex)
```

Creates tab control for the minigui tab control module.

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3046)
