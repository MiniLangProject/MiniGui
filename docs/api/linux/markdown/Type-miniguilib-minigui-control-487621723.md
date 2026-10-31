# `MiniGuiLib.minigui.Control`

[Home](README.md) · [Source file](File-miniguilib-minigui-ml-1319721044.md)

<a id="struct-struct-miniguilib-minigui-control-struct-control-miniguilib-minigui-ml-1814320675"></a>
## Control

```ml
struct Control
```

Native Control operations.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7186)

## Members

<a id="static_method-static-method-miniguilib-minigui-control-resizechildren-static-function-resizechildren-app-parent-miniguilib-minigui-ml-271315916"></a>
### _resizeChildren

```ml
static function _resizeChildren(app, parent)
```

_resizeChildren for the Control backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | app supplied by the caller. |
| `parent` | `dynamic` | — | parent supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7448)

<a id="static_method-static-method-miniguilib-minigui-control-additem-static-function-additem-control-text-miniguilib-minigui-ml-436639455"></a>
### addItem

```ml
static function addItem(control, text)
```

addItem for the Control backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `text` | `dynamic` | — | text supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7363)

<a id="static_method-static-method-miniguilib-minigui-control-clearitems-static-function-clearitems-control-miniguilib-minigui-ml-1975727740"></a>
### clearItems

```ml
static function clearItems(control)
```

clearItems for the Control backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7370)

<a id="static_method-static-method-miniguilib-minigui-control-focus-static-function-focus-control-miniguilib-minigui-ml-1853982098"></a>
### focus

```ml
static function focus(control)
```

Moves keyboard focus to a native control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7547)

<a id="static_method-static-method-miniguilib-minigui-control-getcelltext-static-function-getcelltext-control-row-column-miniguilib-minigui-ml-1566890508"></a>
### getCellText

```ml
static function getCellText(control, row, column)
```

getCellText for the Control backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `row` | `dynamic` | — | row supplied by the caller. |
| `column` | `dynamic` | — | column supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7402)

<a id="static_method-static-method-miniguilib-minigui-control-getchecked-static-function-getchecked-control-miniguilib-minigui-ml-1297341492"></a>
### getChecked

```ml
static function getChecked(control)
```

getChecked for the Control backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7295)

<a id="static_method-static-method-miniguilib-minigui-control-getselectedindex-static-function-getselectedindex-control-miniguilib-minigui-ml-1755985608"></a>
### getSelectedIndex

```ml
static function getSelectedIndex(control)
```

getSelectedIndex for the Control backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7387)

<a id="static_method-static-method-miniguilib-minigui-control-getselectedtext-static-function-getselectedtext-control-miniguilib-minigui-ml-240685330"></a>
### getSelectedText

```ml
static function getSelectedText(control)
```

getSelectedText for the Control backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7393)

<a id="static_method-static-method-miniguilib-minigui-control-gettext-static-function-gettext-control-miniguilib-minigui-ml-2101156482"></a>
### getText

```ml
static function getText(control)
```

getText for the Control backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7199)

<a id="static_method-static-method-miniguilib-minigui-control-getvalue-static-function-getvalue-control-miniguilib-minigui-ml-1058234584"></a>
### getValue

```ml
static function getValue(control)
```

getValue for the Control backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7311)

<a id="static_method-static-method-miniguilib-minigui-control-ischecked-static-function-ischecked-control-miniguilib-minigui-ml-1875340054"></a>
### isChecked

```ml
static function isChecked(control)
```

Reads the native checkbox state.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7554)

<a id="static_method-static-method-miniguilib-minigui-control-setbackground-static-function-setbackground-control-color-miniguilib-minigui-ml-1836358903"></a>
### setBackground

```ml
static function setBackground(control, color)
```

setBackground for the Control backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `color` | `dynamic` | — | color supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7497)

<a id="static_method-static-method-miniguilib-minigui-control-setborder-static-function-setborder-control-color-width-miniguilib-minigui-ml-887880001"></a>
### setBorder

```ml
static function setBorder(control, color, width)
```

setBorder for the Control backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `color` | `dynamic` | — | color supplied by the caller. |
| `width` | `dynamic` | — | width supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7515)

<a id="static_method-static-method-miniguilib-minigui-control-setbounds-static-function-setbounds-control-x-y-width-height-miniguilib-minigui-ml-1835310032"></a>
### setBounds

```ml
static function setBounds(control, x, y, width, height)
```

setBounds for the Control backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `x` | `dynamic` | — | x supplied by the caller. |
| `y` | `dynamic` | — | y supplied by the caller. |
| `width` | `dynamic` | — | width supplied by the caller. |
| `height` | `dynamic` | — | height supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7422)

<a id="static_method-static-method-miniguilib-minigui-control-setcelltext-static-function-setcelltext-control-row-column-value-miniguilib-minigui-ml-1778153831"></a>
### setCellText

```ml
static function setCellText(control, row, column, value)
```

setCellText for the Control backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `row` | `dynamic` | — | row supplied by the caller. |
| `column` | `dynamic` | — | column supplied by the caller. |
| `value` | `dynamic` | — | value supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7411)

<a id="static_method-static-method-miniguilib-minigui-control-setchecked-static-function-setchecked-control-checked-miniguilib-minigui-ml-1737039223"></a>
### setChecked

```ml
static function setChecked(control, checked)
```

setChecked for the Control backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `checked` | `dynamic` | — | checked supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7286)

<a id="static_method-static-method-miniguilib-minigui-control-setcolumns-static-function-setcolumns-control-columns-miniguilib-minigui-ml-1613073181"></a>
### setColumns

```ml
static function setColumns(control, columns)
```

setColumns for the Control backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `columns` | `dynamic` | — | columns supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7338)

<a id="static_method-static-method-miniguilib-minigui-control-setcolumnwidth-static-function-setcolumnwidth-control-column-width-miniguilib-minigui-ml-461085764"></a>
### setColumnWidth

```ml
static function setColumnWidth(control, column, width)
```

Sets a native table column width.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `column` | `dynamic` | — | column supplied by the caller. |
| `width` | `dynamic` | — | width supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7530)

<a id="static_method-static-method-miniguilib-minigui-control-setcolumnwidths-static-function-setcolumnwidths-control-widths-miniguilib-minigui-ml-128633677"></a>
### setColumnWidths

```ml
static function setColumnWidths(control, widths)
```

Applies widths to successive table columns.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `widths` | `dynamic` | — | widths supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7537)

<a id="static_method-static-method-miniguilib-minigui-control-seteditable-static-function-seteditable-control-editable-miniguilib-minigui-ml-1111949810"></a>
### setEditable

```ml
static function setEditable(control, editable)
```

setEditable for the Control backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `editable` | `dynamic` | — | editable supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7235)

<a id="static_method-static-method-miniguilib-minigui-control-setenabled-static-function-setenabled-control-enabled-miniguilib-minigui-ml-140519927"></a>
### setEnabled

```ml
static function setEnabled(control, enabled)
```

setEnabled for the Control backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `enabled` | `dynamic` | — | enabled supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7217)

<a id="static_method-static-method-miniguilib-minigui-control-setfont-static-function-setfont-control-family-size-weight-miniguilib-minigui-ml-1721283901"></a>
### setFont

```ml
static function setFont(control, family, size, weight)
```

setFont for the Control backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `family` | `dynamic` | — | family supplied by the caller. |
| `size` | `dynamic` | — | size supplied by the caller. |
| `weight` | `dynamic` | — | weight supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7506)

<a id="static_method-static-method-miniguilib-minigui-control-setforeground-static-function-setforeground-control-color-miniguilib-minigui-ml-1020013207"></a>
### setForeground

```ml
static function setForeground(control, color)
```

setForeground for the Control backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `color` | `dynamic` | — | color supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7490)

<a id="static_method-static-method-miniguilib-minigui-control-setimagesource-static-function-setimagesource-control-source-miniguilib-minigui-ml-2080240489"></a>
### setImageSource

```ml
static function setImageSource(control, source)
```

setImageSource for the Control backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `source` | `dynamic` | — | source supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7258)

<a id="static_method-static-method-miniguilib-minigui-control-setitems-static-function-setitems-control-items-miniguilib-minigui-ml-1155598642"></a>
### setItems

```ml
static function setItems(control, items)
```

setItems for the Control backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `items` | `dynamic` | — | items supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7347)

<a id="static_method-static-method-miniguilib-minigui-control-setlayout-static-function-setlayout-control-mode-anchor-minwidth-minheight-maxwidth-maxheight-miniguilib-minigui-ml-141219450"></a>
### setLayout

```ml
static function setLayout(control, mode, anchor, minWidth, minHeight, maxWidth, maxHeight)
```

setLayout for the Control backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `mode` | `dynamic` | — | mode supplied by the caller. |
| `anchor` | `dynamic` | — | anchor supplied by the caller. |
| `minWidth` | `dynamic` | — | minWidth supplied by the caller. |
| `minHeight` | `dynamic` | — | minHeight supplied by the caller. |
| `maxWidth` | `dynamic` | — | maxWidth supplied by the caller. |
| `maxHeight` | `dynamic` | — | maxHeight supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7439)

<a id="static_method-static-method-miniguilib-minigui-control-setmaxlength-static-function-setmaxlength-control-maxlength-miniguilib-minigui-ml-2015921332"></a>
### setMaxLength

```ml
static function setMaxLength(control, maxLength)
```

setMaxLength for the Control backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `maxLength` | `dynamic` | — | maxLength supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7279)

<a id="static_method-static-method-miniguilib-minigui-control-setplaceholder-static-function-setplaceholder-control-text-miniguilib-minigui-ml-54201713"></a>
### setPlaceholder

```ml
static function setPlaceholder(control, text)
```

setPlaceholder for the Control backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `text` | `dynamic` | — | text supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7251)

<a id="static_method-static-method-miniguilib-minigui-control-setrange-static-function-setrange-control-minimum-maximum-miniguilib-minigui-ml-2123205638"></a>
### setRange

```ml
static function setRange(control, minimum, maximum)
```

setRange for the Control backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `minimum` | `dynamic` | — | minimum supplied by the caller. |
| `maximum` | `dynamic` | — | maximum supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7319)

<a id="static_method-static-method-miniguilib-minigui-control-setreadonly-static-function-setreadonly-control-readonly-miniguilib-minigui-ml-904919164"></a>
### setReadOnly

```ml
static function setReadOnly(control, readOnly)
```

setReadOnly for the Control backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `readOnly` | `dynamic` | — | readOnly supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7226)

<a id="static_method-static-method-miniguilib-minigui-control-setscrollsteps-static-function-setscrollsteps-control-smallstep-largestep-miniguilib-minigui-ml-655846264"></a>
### setScrollSteps

```ml
static function setScrollSteps(control, smallStep, largeStep)
```

Sets keyboard and page increments for a range control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `smallStep` | `dynamic` | — | smallStep supplied by the caller. |
| `largeStep` | `dynamic` | — | largeStep supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7561)

<a id="static_method-static-method-miniguilib-minigui-control-setselectedindex-static-function-setselectedindex-control-index-miniguilib-minigui-ml-1357404376"></a>
### setSelectedIndex

```ml
static function setSelectedIndex(control, index)
```

setSelectedIndex for the Control backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `index` | `dynamic` | — | index supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7379)

<a id="static_method-static-method-miniguilib-minigui-control-setsource-static-function-setsource-control-source-miniguilib-minigui-ml-1786247141"></a>
### setSource

```ml
static function setSource(control, source)
```

setSource for the Control backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `source` | `dynamic` | — | source supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7265)

<a id="static_method-static-method-miniguilib-minigui-control-setstep-static-function-setstep-control-step-miniguilib-minigui-ml-1255615328"></a>
### setStep

```ml
static function setStep(control, step)
```

setStep for the Control backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `step` | `dynamic` | — | step supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7329)

<a id="static_method-static-method-miniguilib-minigui-control-settabindex-static-function-settabindex-control-tabindex-miniguilib-minigui-ml-1519533725"></a>
### setTabIndex

```ml
static function setTabIndex(control, tabIndex)
```

Orders keyboard focus among sibling controls.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `tabIndex` | `dynamic` | — | tabIndex supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7522)

<a id="static_method-static-method-miniguilib-minigui-control-settext-static-function-settext-control-text-miniguilib-minigui-ml-113968263"></a>
### setText

```ml
static function setText(control, text)
```

setText for the Control backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `text` | `dynamic` | — | text supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7190)

<a id="static_method-static-method-miniguilib-minigui-control-settooltip-static-function-settooltip-control-text-miniguilib-minigui-ml-1453905537"></a>
### setTooltip

```ml
static function setTooltip(control, text)
```

setTooltip for the Control backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `text` | `dynamic` | — | text supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7244)

<a id="static_method-static-method-miniguilib-minigui-control-seturl-static-function-seturl-control-url-miniguilib-minigui-ml-715902199"></a>
### setUrl

```ml
static function setUrl(control, url)
```

setUrl for the Control backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `url` | `dynamic` | — | url supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7272)

<a id="static_method-static-method-miniguilib-minigui-control-setvalue-static-function-setvalue-control-value-miniguilib-minigui-ml-1798949747"></a>
### setValue

```ml
static function setValue(control, value)
```

setValue for the Control backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `value` | `dynamic` | — | value supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7302)

<a id="static_method-static-method-miniguilib-minigui-control-setvisible-static-function-setvisible-control-visible-miniguilib-minigui-ml-1846519804"></a>
### setVisible

```ml
static function setVisible(control, visible)
```

setVisible for the Control backend implementation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `visible` | `dynamic` | — | visible supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7206)
