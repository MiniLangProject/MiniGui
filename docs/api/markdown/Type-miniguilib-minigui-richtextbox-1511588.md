# `MiniGuiLib.minigui.RichTextBox`

[Home](README.md) · [Source file](File-miniguilib-minigui-ml-1319721044.md)

<a id="struct-struct-miniguilib-minigui-richtextbox-struct-richtextbox-miniguilib-minigui-ml-2137079913"></a>
## RichTextBox

```ml
struct RichTextBox
```

Native RichTextBox operations.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L8087)

## Members

<a id="static_method-static-method-miniguilib-minigui-richtextbox-create-static-function-create-app-parent-id-text-x-y-width-height-miniguilib-minigui-ml-793467903"></a>
### create

```ml
static function create(app, parent, id, text, x, y, width, height)
```

Creates a native RichTextBox control.

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L8097)

<a id="static_method-static-method-miniguilib-minigui-richtextbox-formatrange-static-function-formatrange-control-start-endindex-color-bold-italic-miniguilib-minigui-ml-1339122560"></a>
### formatRange

```ml
static function formatRange(control, start, endIndex, color, bold, italic)
```

Formats a character range; end is exclusive.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `start` | `dynamic` | — | start supplied by the caller. |
| `endIndex` | `dynamic` | — | end supplied by the caller. |
| `color` | `dynamic` | — | color supplied by the caller. |
| `bold` | `dynamic` | — | bold supplied by the caller. |
| `italic` | `dynamic` | — | italic supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L8108)
