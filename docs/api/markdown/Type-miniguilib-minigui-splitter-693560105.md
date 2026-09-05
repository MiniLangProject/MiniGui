# `MiniGuiLib.minigui.Splitter`

[Home](README.md) · [Source file](File-miniguilib-minigui-ml-1319721044.md)

<a id="struct-struct-miniguilib-minigui-splitter-struct-splitter-miniguilib-minigui-ml-1940375139"></a>
## Splitter

```ml
struct Splitter
```

Represents the splitter data used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L2781)

## Members

<a id="static_method-static-method-miniguilib-minigui-splitter-create-static-function-create-app-parent-id-text-x-y-width-height-orientation-miniguilib-minigui-ml-2038681312"></a>
### create

```ml
static function create(app, parent, id, text, x, y, width, height, orientation)
```

Creates splitter for the minigui splitter module.

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
| `orientation` | `dynamic` | — | orientation value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L2792)

<a id="static_method-static-method-miniguilib-minigui-splitter-createpane-static-function-createpane-app-parent-id-text-x-y-width-height-orientation-targetbefore-targetafter-miniguilib-minigui-ml-215865089"></a>
### createPane

```ml
static function createPane(app, parent, id, text, x, y, width, height, orientation, targetBefore, targetAfter)
```

Creates pane for the minigui splitter module.

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
| `orientation` | `dynamic` | — | orientation value consumed by this operation. |
| `targetBefore` | `dynamic` | — | targetBefore value consumed by this operation. |
| `targetAfter` | `dynamic` | — | targetAfter value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L2808)
