# `MiniGuiLib.minigui.Control`

[Home](README.md) · [Source file](File-miniguilib-minigui-ml-1319721044.md)

<a id="struct-struct-miniguilib-minigui-control-struct-control-miniguilib-minigui-ml-1814320675"></a>
## Control

```ml
struct Control
```

Represents the control data used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3453)

## Members

<a id="static_method-static-method-miniguilib-minigui-control-ensurestyle-static-function-ensurestyle-control-miniguilib-minigui-ml-1452081222"></a>
### _ensureStyle

```ml
static function _ensureStyle(control)
```

Ensures style is available to the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3590)

<a id="static_method-static-method-miniguilib-minigui-control-layoutindex-static-function-layoutindex-control-miniguilib-minigui-ml-431670752"></a>
### _layoutIndex

```ml
static function _layoutIndex(control)
```

Performs the _layoutIndex operation for the minigui control module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3708)

<a id="static_method-static-method-miniguilib-minigui-control-styleindex-static-function-styleindex-handle-miniguilib-minigui-ml-1376711337"></a>
### _styleIndex

```ml
static function _styleIndex(handle)
```

Performs the _styleIndex operation for the minigui control module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `dynamic` | — | Native or runtime handle used by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3578)

<a id="static_method-static-method-miniguilib-minigui-control-additem-static-function-additem-control-text-miniguilib-minigui-ml-436639455"></a>
### addItem

```ml
static function addItem(control, text)
```

Adds item to the state managed by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4049)

<a id="static_method-static-method-miniguilib-minigui-control-addlistviewitem-static-function-addlistviewitem-control-text-miniguilib-minigui-ml-850893091"></a>
### addListViewItem

```ml
static function addListViewItem(control, text)
```

Adds list view item to the state managed by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4354)

<a id="static_method-static-method-miniguilib-minigui-control-addtreeviewitem-static-function-addtreeviewitem-control-text-miniguilib-minigui-ml-1256155943"></a>
### addTreeViewItem

```ml
static function addTreeViewItem(control, text)
```

Adds tree view item to the state managed by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4385)

<a id="static_method-static-method-miniguilib-minigui-control-addtreeviewitemwithparent-static-function-addtreeviewitemwithparent-control-text-parentitem-miniguilib-minigui-ml-1530336686"></a>
### addTreeViewItemWithParent

```ml
static function addTreeViewItemWithParent(control, text, parentItem)
```

Adds tree view item with parent to the state managed by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `parentItem` | `dynamic` | — | parentItem value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4393)

<a id="static_method-static-method-miniguilib-minigui-control-applyctlcolor-static-function-applyctlcolor-app-hwndcontrol-hdc-miniguilib-minigui-ml-437784875"></a>
### applyCtlColor

```ml
static function applyCtlColor(app, hwndControl, hdc)
```

Performs the applyCtlColor operation for the minigui control module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | Application instance operated on by this call. |
| `hwndControl` | `dynamic` | — | hwndControl value consumed by this operation. |
| `hdc` | `dynamic` | — | hdc value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3660)

<a id="static_method-static-method-miniguilib-minigui-control-applyeffectivevisible-static-function-applyeffectivevisible-control-parentvisible-miniguilib-minigui-ml-1222593000"></a>
### applyEffectiveVisible

```ml
static function applyEffectiveVisible(control, parentVisible)
```

Performs the applyEffectiveVisible operation for the minigui control module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `parentVisible` | `dynamic` | — | parentVisible value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4635)

<a id="static_method-static-method-miniguilib-minigui-control-clamplayoutheight-static-function-clamplayoutheight-control-height-miniguilib-minigui-ml-1721389203"></a>
### clampLayoutHeight

```ml
static function clampLayoutHeight(control, height)
```

Performs the clampLayoutHeight operation for the minigui control module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `height` | `dynamic` | — | Height in the coordinate or storage units used by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3798)

<a id="static_method-static-method-miniguilib-minigui-control-clamplayoutwidth-static-function-clamplayoutwidth-control-width-miniguilib-minigui-ml-1140285708"></a>
### clampLayoutWidth

```ml
static function clampLayoutWidth(control, width)
```

Performs the clampLayoutWidth operation for the minigui control module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `width` | `dynamic` | — | Width in the coordinate or storage units used by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3786)

<a id="static_method-static-method-miniguilib-minigui-control-clearitems-static-function-clearitems-control-miniguilib-minigui-ml-1975727740"></a>
### clearItems

```ml
static function clearItems(control)
```

Clears items maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4020)

<a id="static_method-static-method-miniguilib-minigui-control-ensurelistviewcolumn-static-function-ensurelistviewcolumn-control-miniguilib-minigui-ml-1308262488"></a>
### ensureListViewColumn

```ml
static function ensureListViewColumn(control)
```

Ensures list view column is available to the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4061)

<a id="static_method-static-method-miniguilib-minigui-control-findbyid-static-function-findbyid-app-id-miniguilib-minigui-ml-895897225"></a>
### findById

```ml
static function findById(app, id)
```

Finds by id used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | Application instance operated on by this call. |
| `id` | `dynamic` | — | Stable identifier of the affected item. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3904)

<a id="static_method-static-method-miniguilib-minigui-control-getcelltext-static-function-getcelltext-control-row-column-miniguilib-minigui-ml-1566890508"></a>
### getCellText

```ml
static function getCellText(control, row, column)
```

Returns cell text maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `row` | `dynamic` | — | row value consumed by this operation. |
| `column` | `dynamic` | — | column value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4344)

<a id="static_method-static-method-miniguilib-minigui-control-getitemtextatclick-static-function-getitemtextatclick-control-x-miniguilib-minigui-ml-779022928"></a>
### getItemTextAtClick

```ml
static function getItemTextAtClick(control, x)
```

Returns item text at click maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4464)

<a id="static_method-static-method-miniguilib-minigui-control-getlistviewselectedtext-static-function-getlistviewselectedtext-control-miniguilib-minigui-ml-1817752062"></a>
### getListViewSelectedText

```ml
static function getListViewSelectedText(control)
```

Returns list view selected text maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4502)

<a id="static_method-static-method-miniguilib-minigui-control-getscrollvalue-static-function-getscrollvalue-control-miniguilib-minigui-ml-533761282"></a>
### getScrollValue

```ml
static function getScrollValue(control)
```

Returns scroll value maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4888)

<a id="static_method-static-method-miniguilib-minigui-control-getselectedindex-static-function-getselectedindex-control-miniguilib-minigui-ml-1755985608"></a>
### getSelectedIndex

```ml
static function getSelectedIndex(control)
```

Returns selected index maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4527)

<a id="static_method-static-method-miniguilib-minigui-control-getselectedtext-static-function-getselectedtext-control-miniguilib-minigui-ml-240685330"></a>
### getSelectedText

```ml
static function getSelectedText(control)
```

Returns selected text maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4738)

<a id="static_method-static-method-miniguilib-minigui-control-gettext-static-function-gettext-control-miniguilib-minigui-ml-2101156482"></a>
### getText

```ml
static function getText(control)
```

Returns text maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3472)

<a id="static_method-static-method-miniguilib-minigui-control-gettreeviewselectedtext-static-function-gettreeviewselectedtext-control-miniguilib-minigui-ml-749673418"></a>
### getTreeViewSelectedText

```ml
static function getTreeViewSelectedText(control)
```

Returns tree view selected text maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4482)

<a id="static_method-static-method-miniguilib-minigui-control-getvalue-static-function-getvalue-control-miniguilib-minigui-ml-1058234584"></a>
### getValue

```ml
static function getValue(control)
```

Returns value maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4814)

<a id="static_method-static-method-miniguilib-minigui-control-ischecked-static-function-ischecked-control-miniguilib-minigui-ml-1875340054"></a>
### isChecked

```ml
static function isChecked(control)
```

Returns whether checked satisfies the required condition.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4000)

<a id="static_method-static-method-miniguilib-minigui-control-isdescendantof-static-function-isdescendantof-app-control-ancestor-miniguilib-minigui-ml-245233164"></a>
### isDescendantOf

```ml
static function isDescendantOf(app, control, ancestor)
```

Returns whether descendant of satisfies the required condition.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | Application instance operated on by this call. |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `ancestor` | `dynamic` | — | ancestor value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4648)

<a id="static_method-static-method-miniguilib-minigui-control-iseditable-static-function-iseditable-control-miniguilib-minigui-ml-535417514"></a>
### isEditable

```ml
static function isEditable(control)
```

Returns whether editable satisfies the required condition.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4159)

<a id="static_method-static-method-miniguilib-minigui-control-layoutbounds-static-function-layoutbounds-control-parentwidth-parentheight-baseparentwidth-baseparentheight-miniguilib-minigui-ml-309432276"></a>
### layoutBounds

```ml
static function layoutBounds(control, parentWidth, parentHeight, baseParentWidth, baseParentHeight)
```

Performs the layoutBounds operation for the minigui control module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `parentWidth` | `dynamic` | — | parentWidth value consumed by this operation. |
| `parentHeight` | `dynamic` | — | parentHeight value consumed by this operation. |
| `baseParentWidth` | `dynamic` | — | baseParentWidth value consumed by this operation. |
| `baseParentHeight` | `dynamic` | — | baseParentHeight value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3813)

<a id="static_method-static-method-miniguilib-minigui-control-layoutvalue-static-function-layoutvalue-control-slot-fallback-miniguilib-minigui-ml-2126653304"></a>
### layoutValue

```ml
static function layoutValue(control, slot, fallback)
```

Performs the layoutValue operation for the minigui control module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `slot` | `dynamic` | — | slot value consumed by this operation. |
| `fallback` | `dynamic` | — | Value returned when no explicit result is available. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3765)

<a id="static_method-static-method-miniguilib-minigui-control-listviewcellrect-static-function-listviewcellrect-control-row-column-miniguilib-minigui-ml-152938186"></a>
### listViewCellRect

```ml
static function listViewCellRect(control, row, column)
```

Performs the listViewCellRect operation for the minigui control module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `row` | `dynamic` | — | row value consumed by this operation. |
| `column` | `dynamic` | — | column value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4212)

<a id="static_method-static-method-miniguilib-minigui-control-listviewcolumnatx-static-function-listviewcolumnatx-control-x-miniguilib-minigui-ml-1427391538"></a>
### listViewColumnAtX

```ml
static function listViewColumnAtX(control, x)
```

Performs the listViewColumnAtX operation for the minigui control module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4177)

<a id="static_method-static-method-miniguilib-minigui-control-listviewcolumncount-static-function-listviewcolumncount-control-miniguilib-minigui-ml-1955153002"></a>
### listViewColumnCount

```ml
static function listViewColumnCount(control)
```

Performs the listViewColumnCount operation for the minigui control module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4167)

<a id="static_method-static-method-miniguilib-minigui-control-listviewfieldat-static-function-listviewfieldat-text-index-miniguilib-minigui-ml-1921914030"></a>
### listViewFieldAt

```ml
static function listViewFieldAt(text, index)
```

Performs the listViewFieldAt operation for the minigui control module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `index` | `dynamic` | — | Zero-based index of the affected item. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4249)

<a id="static_method-static-method-miniguilib-minigui-control-listviewfieldcount-static-function-listviewfieldcount-text-miniguilib-minigui-ml-234010618"></a>
### listViewFieldCount

```ml
static function listViewFieldCount(text)
```

Performs the listViewFieldCount operation for the minigui control module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4236)

<a id="static_method-static-method-miniguilib-minigui-control-listviewhittest-static-function-listviewhittest-control-x-y-miniguilib-minigui-ml-2059228595"></a>
### listViewHitTest

```ml
static function listViewHitTest(control, x, y)
```

Performs the listViewHitTest operation for the minigui control module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |
| `y` | `dynamic` | — | Vertical coordinate used by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4192)

<a id="static_method-static-method-miniguilib-minigui-control-movecurrent-static-function-movecurrent-control-x-y-width-height-miniguilib-minigui-ml-169934756"></a>
### moveCurrent

```ml
static function moveCurrent(control, x, y, width, height)
```

Performs the moveCurrent operation for the minigui control module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |
| `y` | `dynamic` | — | Vertical coordinate used by the operation. |
| `width` | `dynamic` | — | Width in the coordinate or storage units used by the caller. |
| `height` | `dynamic` | — | Height in the coordinate or storage units used by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3871)

<a id="static_method-static-method-miniguilib-minigui-control-replacelistviewfield-static-function-replacelistviewfield-text-index-value-miniguilib-minigui-ml-798417899"></a>
### replaceListViewField

```ml
static function replaceListViewField(text, index, value)
```

Performs the replaceListViewField operation for the minigui control module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `index` | `dynamic` | — | Zero-based index of the affected item. |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4272)

<a id="static_method-static-method-miniguilib-minigui-control-replacelistviewrowtext-static-function-replacelistviewrowtext-text-row-rowtext-miniguilib-minigui-ml-836175971"></a>
### replaceListViewRowText

```ml
static function replaceListViewRowText(text, row, rowText)
```

Performs the replaceListViewRowText operation for the minigui control module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `row` | `dynamic` | — | row value consumed by this operation. |
| `rowText` | `dynamic` | — | rowText value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4290)

<a id="static_method-static-method-miniguilib-minigui-control-resizesplittertargets-static-function-resizesplittertargets-app-splitter-oldx-oldy-newx-newy-miniguilib-minigui-ml-2100430649"></a>
### resizeSplitterTargets

```ml
static function resizeSplitterTargets(app, splitter, oldX, oldY, newX, newY)
```

Performs the resizeSplitterTargets operation for the minigui control module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | Application instance operated on by this call. |
| `splitter` | `dynamic` | — | splitter value consumed by this operation. |
| `oldX` | `dynamic` | — | oldX value consumed by this operation. |
| `oldY` | `dynamic` | — | oldY value consumed by this operation. |
| `newX` | `dynamic` | — | newX value consumed by this operation. |
| `newY` | `dynamic` | — | newY value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3947)

<a id="static_method-static-method-miniguilib-minigui-control-scrollviewerto-static-function-scrollviewerto-app-scrollviewer-value-miniguilib-minigui-ml-1667990916"></a>
### scrollViewerTo

```ml
static function scrollViewerTo(app, scrollViewer, value)
```

Performs the scrollViewerTo operation for the minigui control module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | Application instance operated on by this call. |
| `scrollViewer` | `dynamic` | — | scrollViewer value consumed by this operation. |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4709)

<a id="static_method-static-method-miniguilib-minigui-control-setbackground-static-function-setbackground-control-color-miniguilib-minigui-ml-1836358903"></a>
### setBackground

```ml
static function setBackground(control, color)
```

Updates background maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `color` | `dynamic` | — | color value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3621)

<a id="static_method-static-method-miniguilib-minigui-control-setborder-static-function-setborder-control-color-width-miniguilib-minigui-ml-887880001"></a>
### setBorder

```ml
static function setBorder(control, color, width)
```

Updates border maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `color` | `dynamic` | — | color value consumed by this operation. |
| `width` | `dynamic` | — | Width in the coordinate or storage units used by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3641)

<a id="static_method-static-method-miniguilib-minigui-control-setbounds-static-function-setbounds-control-x-y-width-height-miniguilib-minigui-ml-1835310032"></a>
### setBounds

```ml
static function setBounds(control, x, y, width, height)
```

Updates bounds maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |
| `y` | `dynamic` | — | Vertical coordinate used by the operation. |
| `width` | `dynamic` | — | Width in the coordinate or storage units used by the caller. |
| `height` | `dynamic` | — | Height in the coordinate or storage units used by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3856)

<a id="static_method-static-method-miniguilib-minigui-control-setcelltext-static-function-setcelltext-control-row-column-value-miniguilib-minigui-ml-1778153831"></a>
### setCellText

```ml
static function setCellText(control, row, column, value)
```

Updates cell text maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `row` | `dynamic` | — | row value consumed by this operation. |
| `column` | `dynamic` | — | column value consumed by this operation. |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4330)

<a id="static_method-static-method-miniguilib-minigui-control-setchecked-static-function-setchecked-control-checked-miniguilib-minigui-ml-1737039223"></a>
### setChecked

```ml
static function setChecked(control, checked)
```

Updates checked maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `checked` | `dynamic` | — | checked value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4009)

<a id="static_method-static-method-miniguilib-minigui-control-setcolumnwidth-static-function-setcolumnwidth-control-index-width-miniguilib-minigui-ml-793988642"></a>
### setColumnWidth

```ml
static function setColumnWidth(control, index, width)
```

Updates column width maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `index` | `dynamic` | — | Zero-based index of the affected item. |
| `width` | `dynamic` | — | Width in the coordinate or storage units used by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4124)

<a id="static_method-static-method-miniguilib-minigui-control-setcolumnwidths-static-function-setcolumnwidths-control-widths-miniguilib-minigui-ml-128633677"></a>
### setColumnWidths

```ml
static function setColumnWidths(control, widths)
```

Updates column widths maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `widths` | `dynamic` | — | widths value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4137)

<a id="static_method-static-method-miniguilib-minigui-control-seteditable-static-function-seteditable-control-editable-miniguilib-minigui-ml-1111949810"></a>
### setEditable

```ml
static function setEditable(control, editable)
```

Updates editable maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `editable` | `dynamic` | — | editable value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4149)

<a id="static_method-static-method-miniguilib-minigui-control-setenabled-static-function-setenabled-control-enabled-miniguilib-minigui-ml-140519927"></a>
### setEnabled

```ml
static function setEnabled(control, enabled)
```

Updates enabled maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `enabled` | `dynamic` | — | enabled value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3500)

<a id="static_method-static-method-miniguilib-minigui-control-setfont-static-function-setfont-control-family-size-weight-miniguilib-minigui-ml-1721283901"></a>
### setFont

```ml
static function setFont(control, family, size, weight)
```

Updates font maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `family` | `dynamic` | — | family value consumed by this operation. |
| `size` | `dynamic` | — | Size in the units required by the operation. |
| `weight` | `dynamic` | — | weight value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3651)

<a id="static_method-static-method-miniguilib-minigui-control-setforeground-static-function-setforeground-control-color-miniguilib-minigui-ml-1020013207"></a>
### setForeground

```ml
static function setForeground(control, color)
```

Updates foreground maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `color` | `dynamic` | — | color value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3609)

<a id="static_method-static-method-miniguilib-minigui-control-setitems-static-function-setitems-control-items-miniguilib-minigui-ml-1155598642"></a>
### setItems

```ml
static function setItems(control, items)
```

Updates items maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `items` | `dynamic` | — | Items consumed or updated by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4513)

<a id="static_method-static-method-miniguilib-minigui-control-setlayout-static-function-setlayout-control-resizemode-anchor-minwidth-minheight-maxwidth-maxheight-miniguilib-minigui-ml-2029591074"></a>
### setLayout

```ml
static function setLayout(control, resizeMode, anchor, minWidth, minHeight, maxWidth, maxHeight)
```

Updates layout maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `resizeMode` | `dynamic` | — | resizeMode value consumed by this operation. |
| `anchor` | `dynamic` | — | anchor value consumed by this operation. |
| `minWidth` | `dynamic` | — | minWidth value consumed by this operation. |
| `minHeight` | `dynamic` | — | minHeight value consumed by this operation. |
| `maxWidth` | `dynamic` | — | maxWidth value consumed by this operation. |
| `maxHeight` | `dynamic` | — | maxHeight value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3728)

<a id="static_method-static-method-miniguilib-minigui-control-setlistviewcellnative-static-function-setlistviewcellnative-control-row-column-value-miniguilib-minigui-ml-989823695"></a>
### setListViewCellNative

```ml
static function setListViewCellNative(control, row, column, value)
```

Updates list view cell native maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `row` | `dynamic` | — | row value consumed by this operation. |
| `column` | `dynamic` | — | column value consumed by this operation. |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4309)

<a id="static_method-static-method-miniguilib-minigui-control-setlistviewcolumns-static-function-setlistviewcolumns-control-columns-miniguilib-minigui-ml-223612547"></a>
### setListViewColumns

```ml
static function setListViewColumns(control, columns)
```

Updates list view columns maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `columns` | `dynamic` | — | columns value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4080)

<a id="static_method-static-method-miniguilib-minigui-control-setmaxlength-static-function-setmaxlength-control-maxlength-miniguilib-minigui-ml-2015921332"></a>
### setMaxLength

```ml
static function setMaxLength(control, maxLength)
```

Updates max length maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `maxLength` | `dynamic` | — | maxLength value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3695)

<a id="static_method-static-method-miniguilib-minigui-control-setposition-static-function-setposition-control-x-y-miniguilib-minigui-ml-885587583"></a>
### setPosition

```ml
static function setPosition(control, x, y)
```

Updates position maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |
| `y` | `dynamic` | — | Vertical coordinate used by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3984)

<a id="static_method-static-method-miniguilib-minigui-control-setreadonly-static-function-setreadonly-control-readonly-miniguilib-minigui-ml-904919164"></a>
### setReadOnly

```ml
static function setReadOnly(control, readOnly)
```

Updates read only maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `readOnly` | `dynamic` | — | readOnly value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3680)

<a id="static_method-static-method-miniguilib-minigui-control-setscrollrange-static-function-setscrollrange-control-minimum-maximum-miniguilib-minigui-ml-388111760"></a>
### setScrollRange

```ml
static function setScrollRange(control, minimum, maximum)
```

Updates scroll range maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `minimum` | `dynamic` | — | minimum value consumed by this operation. |
| `maximum` | `dynamic` | — | maximum value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4827)

<a id="static_method-static-method-miniguilib-minigui-control-setscrollsteps-static-function-setscrollsteps-control-smallstep-largestep-miniguilib-minigui-ml-655846264"></a>
### setScrollSteps

```ml
static function setScrollSteps(control, smallStep, largeStep)
```

Updates scroll steps maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `smallStep` | `dynamic` | — | smallStep value consumed by this operation. |
| `largeStep` | `dynamic` | — | largeStep value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4852)

<a id="static_method-static-method-miniguilib-minigui-control-setscrollvalue-static-function-setscrollvalue-control-value-miniguilib-minigui-ml-829160053"></a>
### setScrollValue

```ml
static function setScrollValue(control, value)
```

Updates scroll value maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4869)

<a id="static_method-static-method-miniguilib-minigui-control-setselectedindex-static-function-setselectedindex-control-index-miniguilib-minigui-ml-1357404376"></a>
### setSelectedIndex

```ml
static function setSelectedIndex(control, index)
```

Updates selected index maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `index` | `dynamic` | — | Zero-based index of the affected item. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4540)

<a id="static_method-static-method-miniguilib-minigui-control-setsize-static-function-setsize-control-width-height-miniguilib-minigui-ml-1259784487"></a>
### setSize

```ml
static function setSize(control, width, height)
```

Updates size maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `width` | `dynamic` | — | Width in the coordinate or storage units used by the caller. |
| `height` | `dynamic` | — | Height in the coordinate or storage units used by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3993)

<a id="static_method-static-method-miniguilib-minigui-control-settabindex-static-function-settabindex-control-tabindex-miniguilib-minigui-ml-1519533725"></a>
### setTabIndex

```ml
static function setTabIndex(control, tabIndex)
```

Updates tab index maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `tabIndex` | `dynamic` | — | Zero-based index of tab. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3571)

<a id="static_method-static-method-miniguilib-minigui-control-settext-static-function-settext-control-text-miniguilib-minigui-ml-113968263"></a>
### setText

```ml
static function setText(control, text)
```

Updates text maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3457)

<a id="static_method-static-method-miniguilib-minigui-control-settooltip-static-function-settooltip-control-text-miniguilib-minigui-ml-1453905537"></a>
### setTooltip

```ml
static function setTooltip(control, text)
```

Updates tooltip maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3528)

<a id="static_method-static-method-miniguilib-minigui-control-settreeitems-static-function-settreeitems-control-items-miniguilib-minigui-ml-676872302"></a>
### setTreeItems

```ml
static function setTreeItems(control, items)
```

Updates tree items maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `items` | `dynamic` | — | Items consumed or updated by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4435)

<a id="static_method-static-method-miniguilib-minigui-control-setvalue-static-function-setvalue-control-value-miniguilib-minigui-ml-1798949747"></a>
### setValue

```ml
static function setValue(control, value)
```

Updates value maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4790)

<a id="static_method-static-method-miniguilib-minigui-control-setvaluerange-static-function-setvaluerange-control-minimum-maximum-miniguilib-minigui-ml-1233204440"></a>
### setValueRange

```ml
static function setValueRange(control, minimum, maximum)
```

Updates value range maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `minimum` | `dynamic` | — | minimum value consumed by this operation. |
| `maximum` | `dynamic` | — | maximum value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4764)

<a id="static_method-static-method-miniguilib-minigui-control-setvisible-static-function-setvisible-control-visible-miniguilib-minigui-ml-1846519804"></a>
### setVisible

```ml
static function setVisible(control, visible)
```

Updates visible maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |
| `visible` | `dynamic` | — | visible value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3510)

<a id="static_method-static-method-miniguilib-minigui-control-splitterorientation-static-function-splitterorientation-splitter-miniguilib-minigui-ml-558039582"></a>
### splitterOrientation

```ml
static function splitterOrientation(splitter)
```

Performs the splitterOrientation operation for the minigui control module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `splitter` | `dynamic` | — | splitter value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3919)

<a id="static_method-static-method-miniguilib-minigui-control-splittertargetafterid-static-function-splittertargetafterid-splitter-miniguilib-minigui-ml-1440695426"></a>
### splitterTargetAfterId

```ml
static function splitterTargetAfterId(splitter)
```

Performs the splitterTargetAfterId operation for the minigui control module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `splitter` | `dynamic` | — | splitter value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3935)

<a id="static_method-static-method-miniguilib-minigui-control-splittertargetbeforeid-static-function-splittertargetbeforeid-splitter-miniguilib-minigui-ml-765144554"></a>
### splitterTargetBeforeId

```ml
static function splitterTargetBeforeId(splitter)
```

Performs the splitterTargetBeforeId operation for the minigui control module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `splitter` | `dynamic` | — | splitter value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L3928)

<a id="static_method-static-method-miniguilib-minigui-control-treeitemlevel-static-function-treeitemlevel-text-miniguilib-minigui-ml-1210564994"></a>
### treeItemLevel

```ml
static function treeItemLevel(text)
```

Performs the treeItemLevel operation for the minigui control module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4406)

<a id="static_method-static-method-miniguilib-minigui-control-treeitemtext-static-function-treeitemtext-text-miniguilib-minigui-ml-197920766"></a>
### treeItemText

```ml
static function treeItemText(text)
```

Performs the treeItemText operation for the minigui control module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4418)

<a id="static_method-static-method-miniguilib-minigui-control-updatelistviewcolumnwidths-static-function-updatelistviewcolumnwidths-control-miniguilib-minigui-ml-228041928"></a>
### updateListViewColumnWidths

```ml
static function updateListViewColumnWidths(control)
```

Updates list view column widths for the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4105)

<a id="static_method-static-method-miniguilib-minigui-control-updatescrollviewer-static-function-updatescrollviewer-app-scrollviewer-miniguilib-minigui-ml-1037233397"></a>
### updateScrollViewer

```ml
static function updateScrollViewer(app, scrollViewer)
```

Updates scroll viewer for the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | Application instance operated on by this call. |
| `scrollViewer` | `dynamic` | — | scrollViewer value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4676)

<a id="static_method-static-method-miniguilib-minigui-control-updatetabpages-static-function-updatetabpages-app-tabcontrol-miniguilib-minigui-ml-1615899968"></a>
### updateTabPages

```ml
static function updateTabPages(app, tabControl)
```

Updates tab pages for the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | Application instance operated on by this call. |
| `tabControl` | `dynamic` | — | tabControl value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L4576)
