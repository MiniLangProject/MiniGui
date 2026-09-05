# `MiniGuiLib/minigui.ml`

[Home](README.md) · [Files](Files.md)

Provides minigui facilities for this project.

Package: [`MiniGuiLib.minigui`](Package-miniguilib-minigui-960251708.md)

Reachable from entry: **no**

## Imports

- `std/string.ml` as `str` → `../MiniLangCompilerML/std/string.ml` — external dependency
- `std/string_builder.ml` as `sb` → `../MiniLangCompilerML/std/string_builder.ml` — external dependency

## Declarations

<a id="global-global-miniguilib-minigui-activeapp-activeapp-miniguilib-minigui-ml-2134242716"></a>
### _activeApp

```ml
_activeApp
```

Stores module-wide active app state for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L719)

<a id="function-function-miniguilib-minigui-advancedcreate-function-advancedcreate-app-parent-id-kind-text-x-y-width-height-miniguilib-minigui-ml-109142021"></a>
### _advancedCreate

```ml
function _advancedCreate(app, parent, id, kind, text, x, y, width, height)
```

_advancedCreate for the native backend.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | app supplied by the caller. |
| `parent` | `dynamic` | — | parent supplied by the caller. |
| `id` | `dynamic` | — | id supplied by the caller. |
| `kind` | `dynamic` | — | kind supplied by the caller. |
| `text` | `dynamic` | — | text supplied by the caller. |
| `x` | `dynamic` | — | x supplied by the caller. |
| `y` | `dynamic` | — | y supplied by the caller. |
| `width` | `dynamic` | — | width supplied by the caller. |
| `height` | `dynamic` | — | height supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L5825)

<a id="function-function-miniguilib-minigui-advanceddraw-function-advanceddraw-control-op-x-y-width-height-color-text-miniguilib-minigui-ml-638736160"></a>
### _advancedDraw

```ml
function _advancedDraw(control, op, x, y, width, height, color, text)
```

_advancedDraw for the native backend.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `op` | `dynamic` | — | op supplied by the caller. |
| `x` | `dynamic` | — | x supplied by the caller. |
| `y` | `dynamic` | — | y supplied by the caller. |
| `width` | `dynamic` | — | width supplied by the caller. |
| `height` | `dynamic` | — | height supplied by the caller. |
| `color` | `dynamic` | — | color supplied by the caller. |
| `text` | `dynamic` | — | text supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L5852)

<a id="function-function-miniguilib-minigui-advancedformat-function-advancedformat-control-start-endindex-color-bold-italic-miniguilib-minigui-ml-456966350"></a>
### _advancedFormat

```ml
function _advancedFormat(control, start, endIndex, color, bold, italic)
```

_advancedFormat for the native backend.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `start` | `dynamic` | — | start supplied by the caller. |
| `endIndex` | `dynamic` | — | end supplied by the caller. |
| `color` | `dynamic` | — | color supplied by the caller. |
| `bold` | `dynamic` | — | bold supplied by the caller. |
| `italic` | `dynamic` | — | italic supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L5864)

<a id="function-function-miniguilib-minigui-advancedproperty-function-advancedproperty-control-key-text-value-miniguilib-minigui-ml-360835394"></a>
### _advancedProperty

```ml
function _advancedProperty(control, key, text, value)
```

_advancedProperty for the native backend.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | control supplied by the caller. |
| `key` | `dynamic` | — | key supplied by the caller. |
| `text` | `dynamic` | — | text supplied by the caller. |
| `value` | `dynamic` | — | value supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L5839)

<a id="function-function-miniguilib-minigui-appforwindow-function-appforwindow-hwnd-miniguilib-minigui-ml-312916629"></a>
### _appForWindow

```ml
function _appForWindow(hwnd)
```

Performs the _appForWindow operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1118)

<a id="function-function-miniguilib-minigui-asint-function-asint-value-miniguilib-minigui-ml-914144197"></a>
### _asInt

```ml
function _asInt(value)
```

Performs the _asInt operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L961)

<a id="global-global-miniguilib-minigui-datagrideditcolumn-datagrideditcolumn-miniguilib-minigui-ml-1086881536"></a>
### _dataGridEditColumn

```ml
_dataGridEditColumn
```

Stores module-wide data grid edit column state for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L777)

<a id="global-global-miniguilib-minigui-datagrideditgrid-datagrideditgrid-miniguilib-minigui-ml-918497712"></a>
### _dataGridEditGrid

```ml
_dataGridEditGrid
```

Stores module-wide data grid edit grid state for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L773)

<a id="global-global-miniguilib-minigui-datagrideditor-datagrideditor-miniguilib-minigui-ml-137982840"></a>
### _dataGridEditor

```ml
_dataGridEditor
```

Stores module-wide data grid editor state for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L771)

<a id="global-global-miniguilib-minigui-datagrideditoriginal-datagrideditoriginal-miniguilib-minigui-ml-519427308"></a>
### _dataGridEditOriginal

```ml
_dataGridEditOriginal
```

Stores module-wide data grid edit original state for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L779)

<a id="global-global-miniguilib-minigui-datagrideditrow-datagrideditrow-miniguilib-minigui-ml-486920494"></a>
### _dataGridEditRow

```ml
_dataGridEditRow
```

Stores module-wide data grid edit row state for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L775)

<a id="function-function-miniguilib-minigui-defaultwndproc-function-defaultwndproc-hwnd-msg-wparam-lparam-miniguilib-minigui-ml-1389447181"></a>
### _defaultWndProc

```ml
function _defaultWndProc(hwnd, msg, wParam, lParam)
```

Performs the _defaultWndProc operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `msg` | `dynamic` | — | msg value consumed by this operation. |
| `wParam` | `dynamic` | — | wParam value consumed by this operation. |
| `lParam` | `dynamic` | — | lParam value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1098)

<a id="function-function-miniguilib-minigui-dialoginputcancel-function-dialoginputcancel-context-event-miniguilib-minigui-ml-1040675573"></a>
### _dialogInputCancel

```ml
function _dialogInputCancel(context, event)
```

Performs the _dialogInputCancel operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context that carries state for the operation. |
| `event` | `dynamic` | — | event value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1603)

<a id="function-function-miniguilib-minigui-dialoginputok-function-dialoginputok-context-event-miniguilib-minigui-ml-1619618437"></a>
### _dialogInputOk

```ml
function _dialogInputOk(context, event)
```

Performs the _dialogInputOk operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context that carries state for the operation. |
| `event` | `dynamic` | — | event value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1592)

<a id="global-global-miniguilib-minigui-dragsplitter-dragsplitter-miniguilib-minigui-ml-999485152"></a>
### _dragSplitter

```ml
_dragSplitter
```

Stores module-wide drag splitter state for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L761)

<a id="global-global-miniguilib-minigui-dragsplitteroriginx-dragsplitteroriginx-miniguilib-minigui-ml-1099050908"></a>
### _dragSplitterOriginX

```ml
_dragSplitterOriginX
```

Stores module-wide drag splitter origin x state for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L767)

<a id="global-global-miniguilib-minigui-dragsplitteroriginy-dragsplitteroriginy-miniguilib-minigui-ml-490795722"></a>
### _dragSplitterOriginY

```ml
_dragSplitterOriginY
```

Stores module-wide drag splitter origin y state for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L769)

<a id="global-global-miniguilib-minigui-dragsplitterstartx-dragsplitterstartx-miniguilib-minigui-ml-863271320"></a>
### _dragSplitterStartX

```ml
_dragSplitterStartX
```

Stores module-wide drag splitter start x state for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L763)

<a id="global-global-miniguilib-minigui-dragsplitterstarty-dragsplitterstarty-miniguilib-minigui-ml-342350800"></a>
### _dragSplitterStartY

```ml
_dragSplitterStartY
```

Stores module-wide drag splitter start y state for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L765)

<a id="function-function-miniguilib-minigui-ensureruntimestate-function-ensureruntimestate-miniguilib-minigui-ml-417862462"></a>
### _ensureRuntimeState

```ml
function _ensureRuntimeState()
```

Restores module runtime defaults when MiniGui is loaded through a compiler pipeline that does not materialize imported-module initializers eagerly. Keeping this idempotent also makes repeated in-process application runs safe.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L789)

<a id="function-function-miniguilib-minigui-ensuretimerproc-function-ensuretimerproc-miniguilib-minigui-ml-1995107690"></a>
### _ensureTimerProc

```ml
function _ensureTimerProc()
```

Ensures timer proc is available to the minigui workflow.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1411)

<a id="function-function-miniguilib-minigui-ensurewindowproc-function-ensurewindowproc-miniguilib-minigui-ml-383853280"></a>
### _ensureWindowProc

```ml
function _ensureWindowProc()
```

Ensures window proc is available to the minigui workflow.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1389)

<a id="function-function-miniguilib-minigui-getwindowtext-function-getwindowtext-hwnd-miniguilib-minigui-ml-93845995"></a>
### _getWindowText

```ml
function _getWindowText(hwnd)
```

Returns window text maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1082)

<a id="function-function-miniguilib-minigui-installspecificwindowproc-function-installspecificwindowproc-hwnd-cb-miniguilib-minigui-ml-541071260"></a>
### _installSpecificWindowProc

```ml
function _installSpecificWindowProc(hwnd, cb)
```

Performs the _installSpecificWindowProc operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `cb` | `dynamic` | — | cb value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1429)

<a id="function-function-miniguilib-minigui-installwindowproc-function-installwindowproc-hwnd-miniguilib-minigui-ml-485678411"></a>
### _installWindowProc

```ml
function _installWindowProc(hwnd)
```

Performs the _installWindowProc operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1421)

<a id="function-function-miniguilib-minigui-itemcount-function-itemcount-itemstext-miniguilib-minigui-ml-2060651443"></a>
### _itemCount

```ml
function _itemCount(itemsText)
```

Performs the _itemCount operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `itemsText` | `dynamic` | — | itemsText value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1035)

<a id="function-function-miniguilib-minigui-itemtextat-function-itemtextat-itemstext-index-miniguilib-minigui-ml-1618130501"></a>
### _itemTextAt

```ml
function _itemTextAt(itemsText, index)
```

Performs the _itemTextAt operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `itemsText` | `dynamic` | — | itemsText value consumed by this operation. |
| `index` | `dynamic` | — | Zero-based index of the affected item. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1014)

<a id="function-function-miniguilib-minigui-jointext-function-jointext-items-separator-miniguilib-minigui-ml-190570311"></a>
### _joinText

```ml
function _joinText(items, separator)
```

Joins text for the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `items` | `dynamic` | — | Items consumed or updated by the operation. |
| `separator` | `dynamic` | — | separator value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L981)

<a id="global-global-miniguilib-minigui-layoutanchors-layoutanchors-miniguilib-minigui-ml-620229066"></a>
### _layoutAnchors

```ml
_layoutAnchors
```

Stores module-wide layout anchors state for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L749)

<a id="global-global-miniguilib-minigui-layouthandles-layouthandles-miniguilib-minigui-ml-1343933152"></a>
### _layoutHandles

```ml
_layoutHandles
```

Optional runtime layout metadata. Controls without entries keep the legacy


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L745)

<a id="global-global-miniguilib-minigui-layoutmaxheights-layoutmaxheights-miniguilib-minigui-ml-709312584"></a>
### _layoutMaxHeights

```ml
_layoutMaxHeights
```

Stores module-wide layout max heights state for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L757)

<a id="global-global-miniguilib-minigui-layoutmaxwidths-layoutmaxwidths-miniguilib-minigui-ml-160290776"></a>
### _layoutMaxWidths

```ml
_layoutMaxWidths
```

Stores module-wide layout max widths state for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L755)

<a id="global-global-miniguilib-minigui-layoutminheights-layoutminheights-miniguilib-minigui-ml-527575352"></a>
### _layoutMinHeights

```ml
_layoutMinHeights
```

Stores module-wide layout min heights state for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L753)

<a id="global-global-miniguilib-minigui-layoutminwidths-layoutminwidths-miniguilib-minigui-ml-2134337476"></a>
### _layoutMinWidths

```ml
_layoutMinWidths
```

Stores module-wide layout min widths state for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L751)

<a id="global-global-miniguilib-minigui-layoutresizemodes-layoutresizemodes-miniguilib-minigui-ml-1726523010"></a>
### _layoutResizeModes

```ml
_layoutResizeModes
```

Stores module-wide layout resize modes state for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L747)

<a id="function-function-miniguilib-minigui-miniguitimerproc-function-miniguitimerproc-hwnd-msg-wparam-lparam-miniguilib-minigui-ml-1503461647"></a>
### _miniGuiTimerProc

```ml
function _miniGuiTimerProc(hwnd, msg, wParam, lParam)
```

Performs the _miniGuiTimerProc operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `msg` | `dynamic` | — | msg value consumed by this operation. |
| `wParam` | `dynamic` | — | wParam value consumed by this operation. |
| `lParam` | `dynamic` | — | lParam value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1402)

<a id="function-function-miniguilib-minigui-miniguiwndproc-function-miniguiwndproc-hwnd-msg-wparam-lparam-miniguilib-minigui-ml-1946609607"></a>
### _miniGuiWndProc

```ml
function _miniGuiWndProc(hwnd, msg, wParam, lParam)
```

Performs the _miniGuiWndProc operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `msg` | `dynamic` | — | msg value consumed by this operation. |
| `wParam` | `dynamic` | — | wParam value consumed by this operation. |
| `lParam` | `dynamic` | — | lParam value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1129)

<a id="function-function-miniguilib-minigui-normalizeedittext-function-normalizeedittext-text-miniguilib-minigui-ml-236366703"></a>
### _normalizeEditText

```ml
function _normalizeEditText(text)
```

Normalizes edit text for the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1063)

<a id="global-global-miniguilib-minigui-oldwindowprocptr-oldwindowprocptr-miniguilib-minigui-ml-888765660"></a>
### _oldWindowProcPtr

```ml
_oldWindowProcPtr
```

Stores module-wide old window proc ptr state for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L725)

<a id="function-function-miniguilib-minigui-ord-function-ord-text-miniguilib-minigui-ml-278787935"></a>
### _ord

```ml
function _ord(text)
```

Performs the _ord operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1005)

<a id="function-function-miniguilib-minigui-readi32le-inline-function-readi32le-buf-off-miniguilib-minigui-ml-1598694797"></a>
### _readI32LE

```ml
inline function _readI32LE(buf, off)
```

Reads i32 le for the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |
| `off` | `dynamic` | — | off value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L936)

<a id="function-function-miniguilib-minigui-readptrle-inline-function-readptrle-buf-off-miniguilib-minigui-ml-285621521"></a>
### _readPtrLE

```ml
inline function _readPtrLE(buf, off)
```

Reads ptr le for the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |
| `off` | `dynamic` | — | off value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L953)

<a id="function-function-miniguilib-minigui-reads32le-inline-function-reads32le-buf-off-miniguilib-minigui-ml-473232749"></a>
### _readS32LE

```ml
inline function _readS32LE(buf, off)
```

Reads s32 le for the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |
| `off` | `dynamic` | — | off value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L944)

<a id="function-function-miniguilib-minigui-registerwindowclass-function-registerwindowclass-miniguilib-minigui-ml-1678610130"></a>
### _registerWindowClass

```ml
function _registerWindowClass()
```

Performs the _registerWindowClass operation for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1357)

<a id="function-function-miniguilib-minigui-releaseruntimeresources-function-releaseruntimeresources-miniguilib-minigui-ml-66777330"></a>
### _releaseRuntimeResources

```ml
function _releaseRuntimeResources()
```

Releases process-local GUI resources after an application message loop. Native windows own and destroy tooltip HWNDs; this function releases the GDI brushes owned directly by MiniGui and drops the corresponding roots.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L854)

<a id="global-global-miniguilib-minigui-resizeinitializedwindows-resizeinitializedwindows-miniguilib-minigui-ml-1916307140"></a>
### _resizeInitializedWindows

```ml
_resizeInitializedWindows
```

Stores module-wide resize initialized windows state for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L759)

<a id="global-global-miniguilib-minigui-stylebackgrounds-stylebackgrounds-miniguilib-minigui-ml-737270076"></a>
### _styleBackgrounds

```ml
_styleBackgrounds
```

Stores module-wide style backgrounds state for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L741)

<a id="global-global-miniguilib-minigui-stylebrushes-stylebrushes-miniguilib-minigui-ml-662182964"></a>
### _styleBrushes

```ml
_styleBrushes
```

Stores module-wide style brushes state for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L743)

<a id="global-global-miniguilib-minigui-styleforegrounds-styleforegrounds-miniguilib-minigui-ml-343486988"></a>
### _styleForegrounds

```ml
_styleForegrounds
```

Stores module-wide style foregrounds state for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L739)

<a id="global-global-miniguilib-minigui-stylehandles-stylehandles-miniguilib-minigui-ml-1785551544"></a>
### _styleHandles

```ml
_styleHandles
```

Stores module-wide style handles state for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L737)

<a id="global-global-miniguilib-minigui-subclasshandles-subclasshandles-miniguilib-minigui-ml-1463355544"></a>
### _subclassHandles

```ml
_subclassHandles
```

Stores module-wide subclass handles state for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L727)

<a id="global-global-miniguilib-minigui-subclassoldprocs-subclassoldprocs-miniguilib-minigui-ml-388083240"></a>
### _subclassOldProcs

```ml
_subclassOldProcs
```

Stores module-wide subclass old procs state for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L729)

<a id="function-function-miniguilib-minigui-textcontains-function-textcontains-text-needle-miniguilib-minigui-ml-1177242440"></a>
### _textContains

```ml
function _textContains(text, needle)
```

Performs the _textContains operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `needle` | `dynamic` | — | needle value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L1047)

<a id="global-global-miniguilib-minigui-timerprocptr-timerprocptr-miniguilib-minigui-ml-157288092"></a>
### _timerProcPtr

```ml
_timerProcPtr
```

Stores module-wide timer proc ptr state for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L723)

<a id="global-global-miniguilib-minigui-tooltipcontrolhandles-tooltipcontrolhandles-miniguilib-minigui-ml-234434780"></a>
### _tooltipControlHandles

```ml
_tooltipControlHandles
```

Maps tooltip entries to their target control handles.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L733)

<a id="global-global-miniguilib-minigui-tooltiphandles-tooltiphandles-miniguilib-minigui-ml-1380195476"></a>
### _tooltipHandles

```ml
_tooltipHandles
```

Stores module-wide tooltip handles state for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L731)

<a id="global-global-miniguilib-minigui-tooltiptextbytes-tooltiptextbytes-miniguilib-minigui-ml-1730944484"></a>
### _tooltipTextBytes

```ml
_tooltipTextBytes
```

Stores module-wide tooltip text bytes state for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L735)

<a id="function-function-miniguilib-minigui-utf16z-function-utf16z-text-miniguilib-minigui-ml-1972780713"></a>
### _utf16Z

```ml
function _utf16Z(text)
```

Converts a MiniLang UTF-8 string to a NUL-terminated UTF-16LE buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L994)

<a id="global-global-miniguilib-minigui-windowclassnamebytes-windowclassnamebytes-miniguilib-minigui-ml-1872684124"></a>
### _windowClassNameBytes

```ml
_windowClassNameBytes
```

Stores module-wide window class name bytes state for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L783)

<a id="global-global-miniguilib-minigui-windowclassregistered-windowclassregistered-miniguilib-minigui-ml-466194738"></a>
### _windowClassRegistered

```ml
_windowClassRegistered
```

Stores module-wide window class registered state for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L781)

<a id="global-global-miniguilib-minigui-windowprocptr-windowprocptr-miniguilib-minigui-ml-370891278"></a>
### _windowProcPtr

```ml
_windowProcPtr
```

Stores module-wide window proc ptr state for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L721)

<a id="function-function-miniguilib-minigui-writeptrle-inline-function-writeptrle-buf-off-value-miniguilib-minigui-ml-845464550"></a>
### _writePtrLE

```ml
inline function _writePtrLE(buf, off, value)
```

Writes ptr le for the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |
| `off` | `dynamic` | — | off value consumed by this operation. |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L921)

<a id="function-function-miniguilib-minigui-writeu32le-inline-function-writeu32le-buf-off-value-miniguilib-minigui-ml-793960518"></a>
### _writeU32LE

```ml
inline function _writeU32LE(buf, off, value)
```

Writes u32 le for the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |
| `off` | `dynamic` | — | off value consumed by this operation. |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L909)

<a id="extern_function-extern-function-miniguilib-minigui-appendmenuw-extern-function-appendmenuw-menu-as-ptr-flags-as-u32-itemid-as-ptr-text-as-wstr-from-user32-dll-returns-bool-miniguilib-minigui-ml-1838355593"></a>
### AppendMenuW

```ml
extern function AppendMenuW(menu as ptr, flags as u32, itemId as ptr, text as wstr) from "user32.dll" returns bool
```

Invokes the native AppendMenuW entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `ptr` | — | menu value consumed by this operation. |
| `flags` | `u32` | — | Bit flags controlling the operation. |
| `itemId` | `ptr` | — | Identifier of item. |
| `text` | `wstr` | — | Text consumed by the operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L218)

- [MiniGuiLib.minigui.Application](Type-miniguilib-minigui-application-1605122988.md) — struct
- [MiniGuiLib.minigui.ApplicationState](Type-miniguilib-minigui-applicationstate-2092619441.md) — struct
<a id="constant-constant-miniguilib-minigui-bif-newdialogstyle-const-bif-newdialogstyle-64-miniguilib-minigui-ml-915088315"></a>
### BIF_NEWDIALOGSTYLE

```ml
const BIF_NEWDIALOGSTYLE = 64
```

Defines the bif newdialogstyle constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L710)

<a id="constant-constant-miniguilib-minigui-bif-returnonlyfsdirs-const-bif-returnonlyfsdirs-1-miniguilib-minigui-ml-1142494770"></a>
### BIF_RETURNONLYFSDIRS

```ml
const BIF_RETURNONLYFSDIRS = 1
```

Defines the bif returnonlyfsdirs constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L708)

- [MiniGuiLib.minigui.Binding](Type-miniguilib-minigui-binding-1005909067.md) — struct
<a id="constant-constant-miniguilib-minigui-bm-getcheck-const-bm-getcheck-240-miniguilib-minigui-ml-1419837611"></a>
### BM_GETCHECK

```ml
const BM_GETCHECK = 240
```

Defines the bm getcheck constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L378)

<a id="constant-constant-miniguilib-minigui-bm-setcheck-const-bm-setcheck-241-miniguilib-minigui-ml-344104380"></a>
### BM_SETCHECK

```ml
const BM_SETCHECK = 241
```

Defines the bm setcheck constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L380)

<a id="constant-constant-miniguilib-minigui-bn-clicked-const-bn-clicked-0-miniguilib-minigui-ml-1359151883"></a>
### BN_CLICKED

```ml
const BN_CLICKED = 0
```

Defines the bn clicked constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L370)

<a id="constant-constant-miniguilib-minigui-bs-autocheckbox-const-bs-autocheckbox-3-miniguilib-minigui-ml-489449844"></a>
### BS_AUTOCHECKBOX

```ml
const BS_AUTOCHECKBOX = 3
```

Defines the bs autocheckbox constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L586)

<a id="constant-constant-miniguilib-minigui-bs-autoradiobutton-const-bs-autoradiobutton-9-miniguilib-minigui-ml-1158840692"></a>
### BS_AUTORADIOBUTTON

```ml
const BS_AUTORADIOBUTTON = 9
```

Defines the bs autoradiobutton constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L588)

<a id="constant-constant-miniguilib-minigui-bs-groupbox-const-bs-groupbox-7-miniguilib-minigui-ml-543761672"></a>
### BS_GROUPBOX

```ml
const BS_GROUPBOX = 7
```

Defines the bs groupbox constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L590)

<a id="constant-constant-miniguilib-minigui-bs-pushbutton-const-bs-pushbutton-0-miniguilib-minigui-ml-215369229"></a>
### BS_PUSHBUTTON

```ml
const BS_PUSHBUTTON = 0
```

Defines the bs pushbutton constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L584)

<a id="constant-constant-miniguilib-minigui-bst-checked-const-bst-checked-1-miniguilib-minigui-ml-1245754314"></a>
### BST_CHECKED

```ml
const BST_CHECKED = 1
```

Defines the bst checked constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L382)

- [MiniGuiLib.minigui.Button](Type-miniguilib-minigui-button-1520404438.md) — struct
- [MiniGuiLib.minigui.Calendar](Type-miniguilib-minigui-calendar-1740464088.md) — struct
<a id="extern_function-extern-function-miniguilib-minigui-callwindowprocw-extern-function-callwindowprocw-prev-as-ptr-hwnd-as-ptr-msg-as-u32-wparam-as-ptr-lparam-as-ptr-from-user32-dll-symbol-callwindowprocw-returns-ptr-miniguilib-minigui-ml-2012752285"></a>
### CallWindowProcW

```ml
extern function CallWindowProcW(prev as ptr, hwnd as ptr, msg as u32, wParam as ptr, lParam as ptr) from "user32.dll" symbol "CallWindowProcW" returns ptr
```

Invokes the native CallWindowProcW entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `prev` | `ptr` | — | prev value consumed by this operation. |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `msg` | `u32` | — | msg value consumed by this operation. |
| `wParam` | `ptr` | — | wParam value consumed by this operation. |
| `lParam` | `ptr` | — | lParam value consumed by this operation. |


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L283)

<a id="constant-constant-miniguilib-minigui-cb-addstring-const-cb-addstring-323-miniguilib-minigui-ml-241839769"></a>
### CB_ADDSTRING

```ml
const CB_ADDSTRING = 323
```

Defines the cb addstring constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L384)

<a id="constant-constant-miniguilib-minigui-cb-getcursel-const-cb-getcursel-327-miniguilib-minigui-ml-113316873"></a>
### CB_GETCURSEL

```ml
const CB_GETCURSEL = 327
```

Defines the cb getcursel constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L386)

<a id="constant-constant-miniguilib-minigui-cb-getlbtext-const-cb-getlbtext-328-miniguilib-minigui-ml-2054658386"></a>
### CB_GETLBTEXT

```ml
const CB_GETLBTEXT = 328
```

Defines the cb getlbtext constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L388)

<a id="constant-constant-miniguilib-minigui-cb-getlbtextlen-const-cb-getlbtextlen-329-miniguilib-minigui-ml-1967072757"></a>
### CB_GETLBTEXTLEN

```ml
const CB_GETLBTEXTLEN = 329
```

Defines the cb getlbtextlen constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L390)

<a id="constant-constant-miniguilib-minigui-cb-resetcontent-const-cb-resetcontent-331-miniguilib-minigui-ml-1178081028"></a>
### CB_RESETCONTENT

```ml
const CB_RESETCONTENT = 331
```

Defines the cb resetcontent constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L392)

<a id="constant-constant-miniguilib-minigui-cb-setcursel-const-cb-setcursel-334-miniguilib-minigui-ml-1808513273"></a>
### CB_SETCURSEL

```ml
const CB_SETCURSEL = 334
```

Defines the cb setcursel constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L394)

<a id="constant-constant-miniguilib-minigui-cbn-selchange-const-cbn-selchange-1-miniguilib-minigui-ml-996315170"></a>
### CBN_SELCHANGE

```ml
const CBN_SELCHANGE = 1
```

Defines the cbn selchange constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L396)

<a id="constant-constant-miniguilib-minigui-cbs-dropdown-const-cbs-dropdown-2-miniguilib-minigui-ml-862164249"></a>
### CBS_DROPDOWN

```ml
const CBS_DROPDOWN = 2
```

Defines the cbs dropdown constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L592)

<a id="constant-constant-miniguilib-minigui-cbs-dropdownlist-const-cbs-dropdownlist-3-miniguilib-minigui-ml-1859578606"></a>
### CBS_DROPDOWNLIST

```ml
const CBS_DROPDOWNLIST = 3
```

Defines the cbs dropdownlist constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L594)

<a id="constant-constant-miniguilib-minigui-cbs-hasstrings-const-cbs-hasstrings-512-miniguilib-minigui-ml-1509784849"></a>
### CBS_HASSTRINGS

```ml
const CBS_HASSTRINGS = 512
```

Defines the cbs hasstrings constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L596)

<a id="constant-constant-miniguilib-minigui-cc-fullopen-const-cc-fullopen-2-miniguilib-minigui-ml-418697707"></a>
### CC_FULLOPEN

```ml
const CC_FULLOPEN = 2
```

Defines the cc fullopen constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L706)

<a id="constant-constant-miniguilib-minigui-cc-rgbinit-const-cc-rgbinit-1-miniguilib-minigui-ml-598849088"></a>
### CC_RGBINIT

```ml
const CC_RGBINIT = 1
```

Defines the cc rgbinit constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L704)

- [MiniGuiLib.minigui.Chart](Type-miniguilib-minigui-chart-586409834.md) — struct
- [MiniGuiLib.minigui.CheckBox](Type-miniguilib-minigui-checkbox-903069219.md) — struct
<a id="extern_function-extern-function-miniguilib-minigui-choosecolorw-extern-function-choosecolorw-choosecolor-as-bytes-from-comdlg32-dll-returns-bool-miniguilib-minigui-ml-2033763462"></a>
### ChooseColorW

```ml
extern function ChooseColorW(chooseColor as bytes) from "comdlg32.dll" returns bool
```

Invokes the native ChooseColorW entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `chooseColor` | `bytes` | — | chooseColor value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L263)

<a id="extern_function-extern-function-miniguilib-minigui-clienttoscreen-extern-function-clienttoscreen-hwnd-as-ptr-point-as-bytes-from-user32-dll-returns-bool-miniguilib-minigui-ml-1136925390"></a>
### ClientToScreen

```ml
extern function ClientToScreen(hwnd as ptr, point as bytes) from "user32.dll" returns bool
```

Invokes the native ClientToScreen entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `point` | `bytes` | — | point value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L134)

- [MiniGuiLib.minigui.CodeEditor](Type-miniguilib-minigui-codeeditor-1337733838.md) — struct
<a id="constant-constant-miniguilib-minigui-color-btnface-const-color-btnface-15-miniguilib-minigui-ml-363537275"></a>
### COLOR_BTNFACE

```ml
const COLOR_BTNFACE = 15
```

Defines the color btnface constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L644)

- [MiniGuiLib.minigui.ColorPicker](Type-miniguilib-minigui-colorpicker-360522475.md) — struct
- [MiniGuiLib.minigui.ComboBox](Type-miniguilib-minigui-combobox-2072734281.md) — struct
- [MiniGuiLib.minigui.ContextMenu](Type-miniguilib-minigui-contextmenu-115441878.md) — struct
- [MiniGuiLib.minigui.Control](Type-miniguilib-minigui-control-487621723.md) — struct
<a id="extern_function-extern-function-miniguilib-minigui-cotaskmemfree-extern-function-cotaskmemfree-value-as-ptr-from-ole32-dll-returns-void-miniguilib-minigui-ml-1284619702"></a>
### CoTaskMemFree

```ml
extern function CoTaskMemFree(value as ptr) from "ole32.dll" returns void
```

Invokes the native CoTaskMemFree entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `ptr` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L275)

<a id="constant-constant-miniguilib-minigui-cp-utf8-const-cp-utf8-65001-miniguilib-minigui-ml-198378001"></a>
### CP_UTF8

```ml
const CP_UTF8 = 65001
```

UTF-8 code page used for explicit native string buffers.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L714)

<a id="extern_function-extern-function-miniguilib-minigui-createpopupmenu-extern-function-createpopupmenu-from-user32-dll-returns-ptr-miniguilib-minigui-ml-906507030"></a>
### CreatePopupMenu

```ml
extern function CreatePopupMenu() from "user32.dll" returns ptr
```

Invokes the native CreatePopupMenu entry point used by the minigui module.


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L211)

<a id="extern_function-extern-function-miniguilib-minigui-createsolidbrush-extern-function-createsolidbrush-color-as-u32-from-gdi32-dll-returns-ptr-miniguilib-minigui-ml-1434985628"></a>
### CreateSolidBrush

```ml
extern function CreateSolidBrush(color as u32) from "gdi32.dll" returns ptr
```

Invokes the native CreateSolidBrush entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `color` | `u32` | — | color value consumed by this operation. |


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L241)

<a id="extern_function-extern-function-miniguilib-minigui-createwindowexw-extern-function-createwindowexw-exstyle-as-int-classname-as-wstr-windowname-as-wstr-style-as-int-x-as-int-y-as-int-width-as-int-height-as-int-parent-as-ptr-menu-as-ptr-instance-as-ptr-param-as-ptr-from-user32-dll-symbol-createwindowexw-returns-ptr-miniguilib-minigui-ml-1954400396"></a>
### CreateWindowExW

```ml
extern function CreateWindowExW(exStyle as int, className as wstr, windowName as wstr, style as int, x as int, y as int, width as int, height as int, parent as ptr, menu as ptr, instance as ptr, param as ptr) from "user32.dll" symbol "CreateWindowExW" returns ptr
```

Invokes the native CreateWindowExW entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `exStyle` | `int` | — | exStyle value consumed by this operation. |
| `className` | `wstr` | — | className value consumed by this operation. |
| `windowName` | `wstr` | — | windowName value consumed by this operation. |
| `style` | `int` | — | style value consumed by this operation. |
| `x` | `int` | — | Horizontal coordinate used by the operation. |
| `y` | `int` | — | Vertical coordinate used by the operation. |
| `width` | `int` | — | Width in the coordinate or storage units used by the caller. |
| `height` | `int` | — | Height in the coordinate or storage units used by the caller. |
| `parent` | `ptr` | — | parent value consumed by this operation. |
| `menu` | `ptr` | — | menu value consumed by this operation. |
| `instance` | `ptr` | — | instance value consumed by this operation. |
| `param` | `ptr` | — | param value consumed by this operation. |


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L41)

- [MiniGuiLib.minigui.DataGrid](Type-miniguilib-minigui-datagrid-312471086.md) — struct
- [MiniGuiLib.minigui.DatePicker](Type-miniguilib-minigui-datepicker-2133079376.md) — struct
- [MiniGuiLib.minigui.DateTimePicker](Type-miniguilib-minigui-datetimepicker-50480545.md) — struct
<a id="extern_function-extern-function-miniguilib-minigui-defwindowprocw-extern-function-defwindowprocw-hwnd-as-ptr-msg-as-u32-wparam-as-ptr-lparam-as-ptr-from-user32-dll-returns-ptr-miniguilib-minigui-ml-1705910281"></a>
### DefWindowProcW

```ml
extern function DefWindowProcW(hwnd as ptr, msg as u32, wParam as ptr, lParam as ptr) from "user32.dll" returns ptr
```

Invokes the native DefWindowProcW entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `msg` | `u32` | — | msg value consumed by this operation. |
| `wParam` | `ptr` | — | wParam value consumed by this operation. |
| `lParam` | `ptr` | — | lParam value consumed by this operation. |


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L290)

<a id="extern_function-extern-function-miniguilib-minigui-deleteobject-extern-function-deleteobject-object-as-ptr-from-gdi32-dll-returns-bool-miniguilib-minigui-ml-1129546036"></a>
### DeleteObject

```ml
extern function DeleteObject(object as ptr) from "gdi32.dll" returns bool
```

Releases a GDI object created by this module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `object` | `ptr` | — | Native GDI object handle. |


**Returns:** Whether the object was released.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L245)

<a id="extern_function-extern-function-miniguilib-minigui-destroywindow-extern-function-destroywindow-hwnd-as-ptr-from-user32-dll-returns-bool-miniguilib-minigui-ml-937322167"></a>
### DestroyWindow

```ml
extern function DestroyWindow(hwnd as ptr) from "user32.dll" returns bool
```

Invokes the native DestroyWindow entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L84)

- [MiniGuiLib.minigui.Dialog](Type-miniguilib-minigui-dialog-758938230.md) — struct
- [MiniGuiLib.minigui.DialogWindow](Type-miniguilib-minigui-dialogwindow-1871481418.md) — struct
<a id="extern_function-extern-function-miniguilib-minigui-dispatchmessagew-extern-function-dispatchmessagew-msg-as-bytes-from-user32-dll-returns-ptr-miniguilib-minigui-ml-329595298"></a>
### DispatchMessageW

```ml
extern function DispatchMessageW(msg as bytes) from "user32.dll" returns ptr
```

Invokes the native DispatchMessageW entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `bytes` | — | msg value consumed by this operation. |


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L313)

- [MiniGuiLib.minigui.DrawingCanvas](Type-miniguilib-minigui-drawingcanvas-1632518052.md) — struct
<a id="constant-constant-miniguilib-minigui-dts-shortdateformat-const-dts-shortdateformat-0-miniguilib-minigui-ml-1508481105"></a>
### DTS_SHORTDATEFORMAT

```ml
const DTS_SHORTDATEFORMAT = 0
```

Defines the dts shortdateformat constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L626)

<a id="constant-constant-miniguilib-minigui-dts-timeformat-const-dts-timeformat-9-miniguilib-minigui-ml-329119832"></a>
### DTS_TIMEFORMAT

```ml
const DTS_TIMEFORMAT = 9
```

Defines the dts timeformat constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L630)

<a id="constant-constant-miniguilib-minigui-dts-updown-const-dts-updown-1-miniguilib-minigui-ml-130290522"></a>
### DTS_UPDOWN

```ml
const DTS_UPDOWN = 1
```

Defines the dts updown constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L628)

- [MiniGuiLib.minigui.EditableComboBox](Type-miniguilib-minigui-editablecombobox-1293251185.md) — struct
<a id="constant-constant-miniguilib-minigui-em-limittext-const-em-limittext-197-miniguilib-minigui-ml-1107753594"></a>
### EM_LIMITTEXT

```ml
const EM_LIMITTEXT = 197
```

Defines the em limittext constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L374)

<a id="constant-constant-miniguilib-minigui-em-setreadonly-const-em-setreadonly-207-miniguilib-minigui-ml-938429870"></a>
### EM_SETREADONLY

```ml
const EM_SETREADONLY = 207
```

Defines the em setreadonly constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L376)

<a id="constant-constant-miniguilib-minigui-en-change-const-en-change-768-miniguilib-minigui-ml-720831346"></a>
### EN_CHANGE

```ml
const EN_CHANGE = 768
```

Defines the en change constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L372)

<a id="extern_function-extern-function-miniguilib-minigui-enablewindow-extern-function-enablewindow-hwnd-as-ptr-enable-as-bool-from-user32-dll-returns-bool-miniguilib-minigui-ml-449808598"></a>
### EnableWindow

```ml
extern function EnableWindow(hwnd as ptr, enable as bool) from "user32.dll" returns bool
```

Invokes the native EnableWindow entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `enable` | `bool` | — | enable value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L93)

<a id="constant-constant-miniguilib-minigui-error-class-already-exists-const-error-class-already-exists-1410-miniguilib-minigui-ml-123504453"></a>
### ERROR_CLASS_ALREADY_EXISTS

```ml
const ERROR_CLASS_ALREADY_EXISTS = 1410
```

Defines the error class already exists constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L322)

<a id="constant-constant-miniguilib-minigui-es-autohscroll-const-es-autohscroll-128-miniguilib-minigui-ml-2144483728"></a>
### ES_AUTOHSCROLL

```ml
const ES_AUTOHSCROLL = 128
```

Defines the es autohscroll constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L556)

<a id="constant-constant-miniguilib-minigui-es-autovscroll-const-es-autovscroll-64-miniguilib-minigui-ml-1003018363"></a>
### ES_AUTOVSCROLL

```ml
const ES_AUTOVSCROLL = 64
```

Defines the es autovscroll constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L560)

<a id="constant-constant-miniguilib-minigui-es-multiline-const-es-multiline-4-miniguilib-minigui-ml-972930111"></a>
### ES_MULTILINE

```ml
const ES_MULTILINE = 4
```

Defines the es multiline constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L558)

<a id="constant-constant-miniguilib-minigui-es-number-const-es-number-8192-miniguilib-minigui-ml-1544150761"></a>
### ES_NUMBER

```ml
const ES_NUMBER = 8192
```

Defines the es number constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L566)

<a id="constant-constant-miniguilib-minigui-es-password-const-es-password-32-miniguilib-minigui-ml-226256300"></a>
### ES_PASSWORD

```ml
const ES_PASSWORD = 32
```

Defines the es password constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L564)

<a id="constant-constant-miniguilib-minigui-es-wantreturn-const-es-wantreturn-4096-miniguilib-minigui-ml-2134604850"></a>
### ES_WANTRETURN

```ml
const ES_WANTRETURN = 4096
```

Defines the es wantreturn constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L562)

- [MiniGuiLib.minigui.Event](Type-miniguilib-minigui-event-173082466.md) — struct
- [MiniGuiLib.minigui.Events](Type-miniguilib-minigui-events-1317937091.md) — struct
- [MiniGuiLib.minigui.FilePicker](Type-miniguilib-minigui-filepicker-1049747810.md) — struct
- [MiniGuiLib.minigui.FolderPicker](Type-miniguilib-minigui-folderpicker-1673436.md) — struct
<a id="extern_function-extern-function-miniguilib-minigui-getclientrect-extern-function-getclientrect-hwnd-as-ptr-rect-as-bytes-from-user32-dll-returns-bool-miniguilib-minigui-ml-759233238"></a>
### GetClientRect

```ml
extern function GetClientRect(hwnd as ptr, rect as bytes) from "user32.dll" returns bool
```

Invokes the native GetClientRect entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `rect` | `bytes` | — | rect value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L113)

<a id="extern_function-extern-function-miniguilib-minigui-getlasterror-extern-function-getlasterror-from-kernel32-dll-returns-u32-miniguilib-minigui-ml-2132849096"></a>
### GetLastError

```ml
extern function GetLastError() from "kernel32.dll" returns u32
```

Invokes the native GetLastError entry point used by the minigui module.


**Returns:** Native u32 result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L71)

<a id="extern_function-extern-function-miniguilib-minigui-getmessagew-extern-function-getmessagew-msg-as-bytes-hwnd-as-ptr-msgmin-as-u32-msgmax-as-u32-from-user32-dll-returns-int-miniguilib-minigui-ml-1031408714"></a>
### GetMessageW

```ml
extern function GetMessageW(msg as bytes, hwnd as ptr, msgMin as u32, msgMax as u32) from "user32.dll" returns int
```

Invokes the native GetMessageW entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `bytes` | — | msg value consumed by this operation. |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `msgMin` | `u32` | — | msgMin value consumed by this operation. |
| `msgMax` | `u32` | — | msgMax value consumed by this operation. |


**Returns:** Native int result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L305)

<a id="extern_function-extern-function-miniguilib-minigui-getmodulehandlew-extern-function-getmodulehandlew-modulename-as-ptr-from-kernel32-dll-returns-ptr-miniguilib-minigui-ml-221760297"></a>
### GetModuleHandleW

```ml
extern function GetModuleHandleW(moduleName as ptr) from "kernel32.dll" returns ptr
```

Invokes the native GetModuleHandleW entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `moduleName` | `ptr` | — | moduleName value consumed by this operation. |


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L63)

<a id="extern_function-extern-function-miniguilib-minigui-getopenfilenamew-extern-function-getopenfilenamew-openfilename-as-bytes-from-comdlg32-dll-returns-bool-miniguilib-minigui-ml-581761477"></a>
### GetOpenFileNameW

```ml
extern function GetOpenFileNameW(openFileName as bytes) from "comdlg32.dll" returns bool
```

Invokes the native GetOpenFileNameW entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `openFileName` | `bytes` | — | openFileName value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L255)

<a id="extern_function-extern-function-miniguilib-minigui-getsavefilenamew-extern-function-getsavefilenamew-openfilename-as-bytes-from-comdlg32-dll-returns-bool-miniguilib-minigui-ml-649537239"></a>
### GetSaveFileNameW

```ml
extern function GetSaveFileNameW(openFileName as bytes) from "comdlg32.dll" returns bool
```

Invokes the native GetSaveFileNameW entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `openFileName` | `bytes` | — | openFileName value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L259)

<a id="extern_function-extern-function-miniguilib-minigui-getwindowlongptrw-extern-function-getwindowlongptrw-hwnd-as-ptr-index-as-int-from-user32-dll-returns-ptr-miniguilib-minigui-ml-1157909650"></a>
### GetWindowLongPtrW

```ml
extern function GetWindowLongPtrW(hwnd as ptr, index as int) from "user32.dll" returns ptr
```

Invokes the native GetWindowLongPtrW entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `index` | `int` | — | Zero-based index of the affected item. |


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L178)

<a id="extern_function-extern-function-miniguilib-minigui-getwindowtextlengthw-extern-function-getwindowtextlengthw-hwnd-as-ptr-from-user32-dll-returns-int-miniguilib-minigui-ml-820981002"></a>
### GetWindowTextLengthW

```ml
extern function GetWindowTextLengthW(hwnd as ptr) from "user32.dll" returns int
```

Invokes the native GetWindowTextLengthW entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |


**Returns:** Native int result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L108)

<a id="extern_function-extern-function-miniguilib-minigui-getwindowtextw-extern-function-getwindowtextw-hwnd-as-ptr-text-as-bytes-maxcount-as-int-from-user32-dll-returns-int-miniguilib-minigui-ml-1291956958"></a>
### GetWindowTextW

```ml
extern function GetWindowTextW(hwnd as ptr, text as bytes, maxCount as int) from "user32.dll" returns int
```

Invokes the native GetWindowTextW entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `text` | `bytes` | — | Text consumed by the operation. |
| `maxCount` | `int` | — | Number of max to process. |


**Returns:** Native int result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L104)

- [MiniGuiLib.minigui.GroupBox](Type-miniguilib-minigui-groupbox-375763974.md) — struct
<a id="constant-constant-miniguilib-minigui-gwlp-userdata-const-gwlp-userdata-21-miniguilib-minigui-ml-1421899179"></a>
### GWLP_USERDATA

```ml
const GWLP_USERDATA = -21
```

Defines the gwlp userdata constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L320)

<a id="constant-constant-miniguilib-minigui-gwlp-wndproc-const-gwlp-wndproc-4-miniguilib-minigui-ml-529398682"></a>
### GWLP_WNDPROC

```ml
const GWLP_WNDPROC = -4
```

Defines the gwlp wndproc constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L318)

<a id="constant-constant-miniguilib-minigui-idabort-const-idabort-3-miniguilib-minigui-ml-107008712"></a>
### IDABORT

```ml
const IDABORT = 3
```

Defines the idabort constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L678)

<a id="constant-constant-miniguilib-minigui-idc-arrow-const-idc-arrow-32512-miniguilib-minigui-ml-413514398"></a>
### IDC_ARROW

```ml
const IDC_ARROW = 32512
```

Defines the idc arrow constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L538)

<a id="constant-constant-miniguilib-minigui-idcancel-const-idcancel-2-miniguilib-minigui-ml-217631007"></a>
### IDCANCEL

```ml
const IDCANCEL = 2
```

Defines the idcancel constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L676)

<a id="constant-constant-miniguilib-minigui-idignore-const-idignore-5-miniguilib-minigui-ml-997506322"></a>
### IDIGNORE

```ml
const IDIGNORE = 5
```

Defines the idignore constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L682)

<a id="constant-constant-miniguilib-minigui-idno-const-idno-7-miniguilib-minigui-ml-250228258"></a>
### IDNO

```ml
const IDNO = 7
```

Defines the idno constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L686)

<a id="constant-constant-miniguilib-minigui-idok-const-idok-1-miniguilib-minigui-ml-2069307542"></a>
### IDOK

```ml
const IDOK = 1
```

Defines the idok constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L674)

<a id="constant-constant-miniguilib-minigui-idretry-const-idretry-4-miniguilib-minigui-ml-955195037"></a>
### IDRETRY

```ml
const IDRETRY = 4
```

Defines the idretry constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L680)

<a id="constant-constant-miniguilib-minigui-idyes-const-idyes-6-miniguilib-minigui-ml-1415901231"></a>
### IDYES

```ml
const IDYES = 6
```

Defines the idyes constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L684)

- [MiniGuiLib.minigui.Image](Type-miniguilib-minigui-image-1271556347.md) — struct
<a id="constant-constant-miniguilib-minigui-image-bitmap-const-image-bitmap-0-miniguilib-minigui-ml-570423825"></a>
### IMAGE_BITMAP

```ml
const IMAGE_BITMAP = 0
```

Defines the image bitmap constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L580)

<a id="extern_function-extern-function-miniguilib-minigui-initcommoncontrols-extern-function-initcommoncontrols-from-comctl32-dll-returns-void-miniguilib-minigui-ml-834462227"></a>
### InitCommonControls

```ml
extern function InitCommonControls() from "comctl32.dll" returns void
```

Invokes the native InitCommonControls entry point used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L315)

<a id="extern_function-extern-function-miniguilib-minigui-iswindow-extern-function-iswindow-hwnd-as-ptr-from-user32-dll-returns-bool-miniguilib-minigui-ml-1948810595"></a>
### IsWindow

```ml
extern function IsWindow(hwnd as ptr) from "user32.dll" returns bool
```

Invokes the native IsWindow entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L88)

- [MiniGuiLib.minigui.Label](Type-miniguilib-minigui-label-1189359004.md) — struct
<a id="constant-constant-miniguilib-minigui-lb-addstring-const-lb-addstring-384-miniguilib-minigui-ml-1893636904"></a>
### LB_ADDSTRING

```ml
const LB_ADDSTRING = 384
```

Defines the lb addstring constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L398)

<a id="constant-constant-miniguilib-minigui-lb-getcursel-const-lb-getcursel-392-miniguilib-minigui-ml-595212211"></a>
### LB_GETCURSEL

```ml
const LB_GETCURSEL = 392
```

Defines the lb getcursel constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L402)

<a id="constant-constant-miniguilib-minigui-lb-gettext-const-lb-gettext-393-miniguilib-minigui-ml-128226474"></a>
### LB_GETTEXT

```ml
const LB_GETTEXT = 393
```

Defines the lb gettext constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L404)

<a id="constant-constant-miniguilib-minigui-lb-gettextlen-const-lb-gettextlen-394-miniguilib-minigui-ml-1561845661"></a>
### LB_GETTEXTLEN

```ml
const LB_GETTEXTLEN = 394
```

Defines the lb gettextlen constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L406)

<a id="constant-constant-miniguilib-minigui-lb-resetcontent-const-lb-resetcontent-388-miniguilib-minigui-ml-1840440776"></a>
### LB_RESETCONTENT

```ml
const LB_RESETCONTENT = 388
```

Defines the lb resetcontent constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L408)

<a id="constant-constant-miniguilib-minigui-lb-setcursel-const-lb-setcursel-390-miniguilib-minigui-ml-282449581"></a>
### LB_SETCURSEL

```ml
const LB_SETCURSEL = 390
```

Defines the lb setcursel constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L400)

<a id="constant-constant-miniguilib-minigui-lbn-selchange-const-lbn-selchange-1-miniguilib-minigui-ml-1903787630"></a>
### LBN_SELCHANGE

```ml
const LBN_SELCHANGE = 1
```

Defines the lbn selchange constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L410)

<a id="constant-constant-miniguilib-minigui-lbs-notify-const-lbs-notify-1-miniguilib-minigui-ml-370033098"></a>
### LBS_NOTIFY

```ml
const LBS_NOTIFY = 1
```

Defines the lbs notify constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L598)

- [MiniGuiLib.minigui.LinkLabel](Type-miniguilib-minigui-linklabel-829611492.md) — struct
- [MiniGuiLib.minigui.ListBox](Type-miniguilib-minigui-listbox-399936991.md) — struct
- [MiniGuiLib.minigui.ListView](Type-miniguilib-minigui-listview-417190859.md) — struct
<a id="extern_function-extern-function-miniguilib-minigui-loadcursorw-extern-function-loadcursorw-instance-as-ptr-cursorname-as-ptr-from-user32-dll-returns-ptr-miniguilib-minigui-ml-24423210"></a>
### LoadCursorW

```ml
extern function LoadCursorW(instance as ptr, cursorName as ptr) from "user32.dll" returns ptr
```

Invokes the native LoadCursorW entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `instance` | `ptr` | — | instance value consumed by this operation. |
| `cursorName` | `ptr` | — | cursorName value consumed by this operation. |


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L68)

<a id="extern_function-extern-function-miniguilib-minigui-loadimagew-extern-function-loadimagew-instance-as-ptr-name-as-wstr-imagetype-as-u32-width-as-int-height-as-int-flags-as-u32-from-user32-dll-returns-ptr-miniguilib-minigui-ml-355203119"></a>
### LoadImageW

```ml
extern function LoadImageW(instance as ptr, name as wstr, imageType as u32, width as int, height as int, flags as u32) from "user32.dll" returns ptr
```

Invokes the native LoadImageW entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `instance` | `ptr` | — | instance value consumed by this operation. |
| `name` | `wstr` | — | Name of the affected item. |
| `imageType` | `u32` | — | imageType value consumed by this operation. |
| `width` | `int` | — | Width in the coordinate or storage units used by the caller. |
| `height` | `int` | — | Height in the coordinate or storage units used by the caller. |
| `flags` | `u32` | — | Bit flags controlling the operation. |


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L201)

<a id="constant-constant-miniguilib-minigui-lr-loadfromfile-const-lr-loadfromfile-16-miniguilib-minigui-ml-840940926"></a>
### LR_LOADFROMFILE

```ml
const LR_LOADFROMFILE = 16
```

Defines the lr loadfromfile constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L582)

<a id="constant-constant-miniguilib-minigui-lvcf-subitem-const-lvcf-subitem-8-miniguilib-minigui-ml-1724735057"></a>
### LVCF_SUBITEM

```ml
const LVCF_SUBITEM = 8
```

Defines the lvcf subitem constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L438)

<a id="constant-constant-miniguilib-minigui-lvcf-text-const-lvcf-text-4-miniguilib-minigui-ml-1479277509"></a>
### LVCF_TEXT

```ml
const LVCF_TEXT = 4
```

Defines the lvcf text constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L434)

<a id="constant-constant-miniguilib-minigui-lvcf-width-const-lvcf-width-2-miniguilib-minigui-ml-817932261"></a>
### LVCF_WIDTH

```ml
const LVCF_WIDTH = 2
```

Defines the lvcf width constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L436)

<a id="constant-constant-miniguilib-minigui-lvif-text-const-lvif-text-1-miniguilib-minigui-ml-2011243986"></a>
### LVIF_TEXT

```ml
const LVIF_TEXT = 1
```

Defines the lvif text constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L432)

<a id="constant-constant-miniguilib-minigui-lvir-bounds-const-lvir-bounds-0-miniguilib-minigui-ml-423960325"></a>
### LVIR_BOUNDS

```ml
const LVIR_BOUNDS = 0
```

Defines the lvir bounds constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L446)

<a id="constant-constant-miniguilib-minigui-lvis-focused-const-lvis-focused-1-miniguilib-minigui-ml-1257238804"></a>
### LVIS_FOCUSED

```ml
const LVIS_FOCUSED = 1
```

Defines the lvis focused constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L442)

<a id="constant-constant-miniguilib-minigui-lvis-selected-const-lvis-selected-2-miniguilib-minigui-ml-1215279995"></a>
### LVIS_SELECTED

```ml
const LVIS_SELECTED = 2
```

Defines the lvis selected constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L444)

<a id="constant-constant-miniguilib-minigui-lvm-deleteallitems-const-lvm-deleteallitems-4105-miniguilib-minigui-ml-767090351"></a>
### LVM_DELETEALLITEMS

```ml
const LVM_DELETEALLITEMS = 4105
```

Defines the lvm deleteallitems constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L414)

<a id="constant-constant-miniguilib-minigui-lvm-getitemcount-const-lvm-getitemcount-4100-miniguilib-minigui-ml-322025980"></a>
### LVM_GETITEMCOUNT

```ml
const LVM_GETITEMCOUNT = 4100
```

Defines the lvm getitemcount constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L412)

<a id="constant-constant-miniguilib-minigui-lvm-getnextitem-const-lvm-getnextitem-4108-miniguilib-minigui-ml-1372946998"></a>
### LVM_GETNEXTITEM

```ml
const LVM_GETNEXTITEM = 4108
```

Defines the lvm getnextitem constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L416)

<a id="constant-constant-miniguilib-minigui-lvm-getsubitemrect-const-lvm-getsubitemrect-4152-miniguilib-minigui-ml-1562182037"></a>
### LVM_GETSUBITEMRECT

```ml
const LVM_GETSUBITEMRECT = 4152
```

Defines the lvm getsubitemrect constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L420)

<a id="constant-constant-miniguilib-minigui-lvm-insertcolumnw-const-lvm-insertcolumnw-4193-miniguilib-minigui-ml-38016026"></a>
### LVM_INSERTCOLUMNW

```ml
const LVM_INSERTCOLUMNW = 4193
```

Defines the lvm insertcolumnw constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L426)

<a id="constant-constant-miniguilib-minigui-lvm-insertitemw-const-lvm-insertitemw-4173-miniguilib-minigui-ml-756337312"></a>
### LVM_INSERTITEMW

```ml
const LVM_INSERTITEMW = 4173
```

Defines the lvm insertitemw constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L424)

<a id="constant-constant-miniguilib-minigui-lvm-setcolumnwidth-const-lvm-setcolumnwidth-4126-miniguilib-minigui-ml-1922628028"></a>
### LVM_SETCOLUMNWIDTH

```ml
const LVM_SETCOLUMNWIDTH = 4126
```

Defines the lvm setcolumnwidth constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L440)

<a id="constant-constant-miniguilib-minigui-lvm-setitemstate-const-lvm-setitemstate-4139-miniguilib-minigui-ml-1078120992"></a>
### LVM_SETITEMSTATE

```ml
const LVM_SETITEMSTATE = 4139
```

Defines the lvm setitemstate constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L418)

<a id="constant-constant-miniguilib-minigui-lvm-setitemtextw-const-lvm-setitemtextw-4212-miniguilib-minigui-ml-1508014004"></a>
### LVM_SETITEMTEXTW

```ml
const LVM_SETITEMTEXTW = 4212
```

Defines the lvm setitemtextw constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L428)

<a id="constant-constant-miniguilib-minigui-lvm-subitemhittest-const-lvm-subitemhittest-4153-miniguilib-minigui-ml-2086921924"></a>
### LVM_SUBITEMHITTEST

```ml
const LVM_SUBITEMHITTEST = 4153
```

Defines the lvm subitemhittest constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L422)

<a id="constant-constant-miniguilib-minigui-lvn-itemchanged-const-lvn-itemchanged-101-miniguilib-minigui-ml-463331056"></a>
### LVN_ITEMCHANGED

```ml
const LVN_ITEMCHANGED = -101
```

Defines the lvn itemchanged constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L430)

<a id="constant-constant-miniguilib-minigui-lvni-selected-const-lvni-selected-2-miniguilib-minigui-ml-1633419271"></a>
### LVNI_SELECTED

```ml
const LVNI_SELECTED = 2
```

Defines the lvni selected constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L448)

<a id="constant-constant-miniguilib-minigui-lvs-report-const-lvs-report-1-miniguilib-minigui-ml-1260394604"></a>
### LVS_REPORT

```ml
const LVS_REPORT = 1
```

Defines the lvs report constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L600)

<a id="constant-constant-miniguilib-minigui-lvs-singlesel-const-lvs-singlesel-4-miniguilib-minigui-ml-1156482373"></a>
### LVS_SINGLESEL

```ml
const LVS_SINGLESEL = 4
```

Defines the lvs singlesel constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L602)

<a id="constant-constant-miniguilib-minigui-mb-abortretryignore-const-mb-abortretryignore-2-miniguilib-minigui-ml-1322851975"></a>
### MB_ABORTRETRYIGNORE

```ml
const MB_ABORTRETRYIGNORE = 2
```

Defines the mb abortretryignore constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L658)

<a id="constant-constant-miniguilib-minigui-mb-err-invalid-chars-const-mb-err-invalid-chars-8-miniguilib-minigui-ml-2064335209"></a>
### MB_ERR_INVALID_CHARS

```ml
const MB_ERR_INVALID_CHARS = 8
```

Reject malformed UTF-8 instead of silently replacing invalid input.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L716)

<a id="constant-constant-miniguilib-minigui-mb-iconerror-const-mb-iconerror-16-miniguilib-minigui-ml-1257250278"></a>
### MB_ICONERROR

```ml
const MB_ICONERROR = 16
```

Defines the mb iconerror constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L666)

<a id="constant-constant-miniguilib-minigui-mb-iconinformation-const-mb-iconinformation-64-miniguilib-minigui-ml-223279131"></a>
### MB_ICONINFORMATION

```ml
const MB_ICONINFORMATION = 64
```

Defines the mb iconinformation constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L672)

<a id="constant-constant-miniguilib-minigui-mb-iconquestion-const-mb-iconquestion-32-miniguilib-minigui-ml-1611283896"></a>
### MB_ICONQUESTION

```ml
const MB_ICONQUESTION = 32
```

Defines the mb iconquestion constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L668)

<a id="constant-constant-miniguilib-minigui-mb-iconwarning-const-mb-iconwarning-48-miniguilib-minigui-ml-449890585"></a>
### MB_ICONWARNING

```ml
const MB_ICONWARNING = 48
```

Defines the mb iconwarning constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L670)

<a id="constant-constant-miniguilib-minigui-mb-ok-const-mb-ok-0-miniguilib-minigui-ml-256861433"></a>
### MB_OK

```ml
const MB_OK = 0
```

Defines the mb ok constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L654)

<a id="constant-constant-miniguilib-minigui-mb-okcancel-const-mb-okcancel-1-miniguilib-minigui-ml-1351400526"></a>
### MB_OKCANCEL

```ml
const MB_OKCANCEL = 1
```

Defines the mb okcancel constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L656)

<a id="constant-constant-miniguilib-minigui-mb-retrycancel-const-mb-retrycancel-5-miniguilib-minigui-ml-882346160"></a>
### MB_RETRYCANCEL

```ml
const MB_RETRYCANCEL = 5
```

Defines the mb retrycancel constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L664)

<a id="constant-constant-miniguilib-minigui-mb-yesno-const-mb-yesno-4-miniguilib-minigui-ml-775213631"></a>
### MB_YESNO

```ml
const MB_YESNO = 4
```

Defines the mb yesno constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L662)

<a id="constant-constant-miniguilib-minigui-mb-yesnocancel-const-mb-yesnocancel-3-miniguilib-minigui-ml-398456778"></a>
### MB_YESNOCANCEL

```ml
const MB_YESNOCANCEL = 3
```

Defines the mb yesnocancel constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L660)

- [MiniGuiLib.minigui.MenuBar](Type-miniguilib-minigui-menubar-1972806118.md) — struct
<a id="extern_function-extern-function-miniguilib-minigui-messageboxw-extern-function-messageboxw-hwnd-as-ptr-text-as-wstr-caption-as-wstr-flags-as-u32-from-user32-dll-returns-int-miniguilib-minigui-ml-1087072422"></a>
### MessageBoxW

```ml
extern function MessageBoxW(hwnd as ptr, text as wstr, caption as wstr, flags as u32) from "user32.dll" returns int
```

Invokes the native MessageBoxW entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `text` | `wstr` | — | Text consumed by the operation. |
| `caption` | `wstr` | — | caption value consumed by this operation. |
| `flags` | `u32` | — | Bit flags controlling the operation. |


**Returns:** Native int result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L208)

<a id="constant-constant-miniguilib-minigui-mf-string-const-mf-string-0-miniguilib-minigui-ml-481160593"></a>
### MF_STRING

```ml
const MF_STRING = 0
```

Defines the mf string constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L688)

<a id="constant-constant-miniguilib-minigui-mk-lbutton-const-mk-lbutton-1-miniguilib-minigui-ml-1520287082"></a>
### MK_LBUTTON

```ml
const MK_LBUTTON = 1
```

Defines the mk lbutton constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L712)

<a id="extern_function-extern-function-miniguilib-minigui-movewindow-extern-function-movewindow-hwnd-as-ptr-x-as-int-y-as-int-width-as-int-height-as-int-repaint-as-bool-from-user32-dll-returns-bool-miniguilib-minigui-ml-2080093942"></a>
### MoveWindow

```ml
extern function MoveWindow(hwnd as ptr, x as int, y as int, width as int, height as int, repaint as bool) from "user32.dll" returns bool
```

Invokes the native MoveWindow entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `x` | `int` | — | Horizontal coordinate used by the operation. |
| `y` | `int` | — | Vertical coordinate used by the operation. |
| `width` | `int` | — | Width in the coordinate or storage units used by the caller. |
| `height` | `int` | — | Height in the coordinate or storage units used by the caller. |
| `repaint` | `bool` | — | repaint value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L122)

<a id="extern_function-extern-function-miniguilib-minigui-multibytetowidecharbytes-extern-function-multibytetowidecharbytes-codepage-as-u32-flags-as-u32-text-as-cstr-inputcount-as-int-output-as-bytes-outputcount-as-int-from-kernel32-dll-symbol-multibytetowidechar-returns-int-miniguilib-minigui-ml-695937351"></a>
### MultiByteToWideCharBytes

```ml
extern function MultiByteToWideCharBytes(codePage as u32, flags as u32, text as cstr, inputCount as int, output as bytes, outputCount as int) from "kernel32.dll" symbol "MultiByteToWideChar" returns int
```

Converts a UTF-8 string into a caller-owned UTF-16 buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `codePage` | `u32` | — |  |
| `flags` | `u32` | — |  |
| `text` | `cstr` | — |  |
| `inputCount` | `int` | — |  |
| `output` | `bytes` | — |  |
| `outputCount` | `int` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L251)

<a id="extern_function-extern-function-miniguilib-minigui-multibytetowidecharsize-extern-function-multibytetowidecharsize-codepage-as-u32-flags-as-u32-text-as-cstr-inputcount-as-int-output-as-ptr-outputcount-as-int-from-kernel32-dll-symbol-multibytetowidechar-returns-int-miniguilib-minigui-ml-2059332106"></a>
### MultiByteToWideCharSize

```ml
extern function MultiByteToWideCharSize(codePage as u32, flags as u32, text as cstr, inputCount as int, output as ptr, outputCount as int) from "kernel32.dll" symbol "MultiByteToWideChar" returns int
```

Computes the UTF-16 capacity required for a UTF-8 string.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `codePage` | `u32` | — |  |
| `flags` | `u32` | — |  |
| `text` | `cstr` | — |  |
| `inputCount` | `int` | — |  |
| `output` | `ptr` | — |  |
| `outputCount` | `int` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L248)

<a id="extern_function-extern-function-miniguilib-minigui-mx-create-extern-function-mx-create-kind-as-cstr-parent-as-ptr-id-as-int-text-as-cstr-x-as-int-y-as-int-width-as-int-height-as-int-from-minigui-extra-dll-returns-ptr-miniguilib-minigui-ml-2057071472"></a>
### mx_create

```ml
extern function mx_create(kind as cstr, parent as ptr, id as int, text as cstr, x as int, y as int, width as int, height as int) from "minigui_extra.dll" returns ptr
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `kind` | `cstr` | — |  |
| `parent` | `ptr` | — |  |
| `id` | `int` | — |  |
| `text` | `cstr` | — |  |
| `x` | `int` | — |  |
| `y` | `int` | — |  |
| `width` | `int` | — |  |
| `height` | `int` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L5808)

<a id="extern_function-extern-function-miniguilib-minigui-mx-draw-extern-function-mx-draw-node-as-ptr-op-as-int-x-as-double-y-as-double-width-as-double-height-as-double-color-as-cstr-text-as-cstr-from-minigui-extra-dll-returns-void-miniguilib-minigui-ml-655478187"></a>
### mx_draw

```ml
extern function mx_draw(node as ptr, op as int, x as double, y as double, width as double, height as double, color as cstr, text as cstr) from "minigui_extra.dll" returns void
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `node` | `ptr` | — |  |
| `op` | `int` | — |  |
| `x` | `double` | — |  |
| `y` | `double` | — |  |
| `width` | `double` | — |  |
| `height` | `double` | — |  |
| `color` | `cstr` | — |  |
| `text` | `cstr` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L5812)

<a id="extern_function-extern-function-miniguilib-minigui-mx-format-extern-function-mx-format-node-as-ptr-start-as-int-endindex-as-int-color-as-cstr-bold-as-int-italic-as-int-from-minigui-extra-dll-returns-int-miniguilib-minigui-ml-1920620601"></a>
### mx_format

```ml
extern function mx_format(node as ptr, start as int, endIndex as int, color as cstr, bold as int, italic as int) from "minigui_extra.dll" returns int
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `node` | `ptr` | — |  |
| `start` | `int` | — |  |
| `endIndex` | `int` | — |  |
| `color` | `cstr` | — |  |
| `bold` | `int` | — |  |
| `italic` | `int` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L5814)

<a id="extern_function-extern-function-miniguilib-minigui-mx-property-extern-function-mx-property-node-as-ptr-key-as-cstr-text-as-cstr-value-as-int-from-minigui-extra-dll-returns-int-miniguilib-minigui-ml-1439540546"></a>
### mx_property

```ml
extern function mx_property(node as ptr, key as cstr, text as cstr, value as int) from "minigui_extra.dll" returns int
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `node` | `ptr` | — |  |
| `key` | `cstr` | — |  |
| `text` | `cstr` | — |  |
| `value` | `int` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L5810)

<a id="extern_function-extern-function-miniguilib-minigui-mx-pump-extern-function-mx-pump-wait-as-int-from-minigui-extra-dll-returns-int-miniguilib-minigui-ml-455583342"></a>
### mx_pump

```ml
extern function mx_pump(wait as int) from "minigui_extra.dll" returns int
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `wait` | `int` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L5872)

- [MiniGuiLib.minigui.NativeControl](Type-miniguilib-minigui-nativecontrol-249550938.md) — struct
- [MiniGuiLib.minigui.NumberBox](Type-miniguilib-minigui-numberbox-1673605572.md) — struct
<a id="constant-constant-miniguilib-minigui-ofn-explorer-const-ofn-explorer-524288-miniguilib-minigui-ml-475798656"></a>
### OFN_EXPLORER

```ml
const OFN_EXPLORER = 524288
```

Defines the ofn explorer constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L702)

<a id="constant-constant-miniguilib-minigui-ofn-filemustexist-const-ofn-filemustexist-4096-miniguilib-minigui-ml-296232770"></a>
### OFN_FILEMUSTEXIST

```ml
const OFN_FILEMUSTEXIST = 4096
```

Defines the ofn filemustexist constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L700)

<a id="constant-constant-miniguilib-minigui-ofn-hidereadonly-const-ofn-hidereadonly-4-miniguilib-minigui-ml-851808719"></a>
### OFN_HIDEREADONLY

```ml
const OFN_HIDEREADONLY = 4
```

Defines the ofn hidereadonly constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L696)

<a id="constant-constant-miniguilib-minigui-ofn-overwriteprompt-const-ofn-overwriteprompt-2-miniguilib-minigui-ml-475151655"></a>
### OFN_OVERWRITEPROMPT

```ml
const OFN_OVERWRITEPROMPT = 2
```

Defines the ofn overwriteprompt constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L694)

<a id="constant-constant-miniguilib-minigui-ofn-pathmustexist-const-ofn-pathmustexist-2048-miniguilib-minigui-ml-1988093327"></a>
### OFN_PATHMUSTEXIST

```ml
const OFN_PATHMUSTEXIST = 2048
```

Defines the ofn pathmustexist constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L698)

- [MiniGuiLib.minigui.Panel](Type-miniguilib-minigui-panel-1796001828.md) — struct
- [MiniGuiLib.minigui.PasswordBox](Type-miniguilib-minigui-passwordbox-1578552828.md) — struct
<a id="constant-constant-miniguilib-minigui-pbm-setpos-const-pbm-setpos-1026-miniguilib-minigui-ml-2042061738"></a>
### PBM_SETPOS

```ml
const PBM_SETPOS = 1026
```

Defines the pbm setpos constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L450)

<a id="constant-constant-miniguilib-minigui-pbm-setrange32-const-pbm-setrange32-1030-miniguilib-minigui-ml-45311789"></a>
### PBM_SETRANGE32

```ml
const PBM_SETRANGE32 = 1030
```

Defines the pbm setrange32 constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L452)

<a id="extern_function-extern-function-miniguilib-minigui-postquitmessage-extern-function-postquitmessage-exitcode-as-int-from-user32-dll-returns-void-miniguilib-minigui-ml-534874576"></a>
### PostQuitMessage

```ml
extern function PostQuitMessage(exitCode as int) from "user32.dll" returns void
```

Invokes the native PostQuitMessage entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `exitCode` | `int` | — | exitCode value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L298)

- [MiniGuiLib.minigui.ProgressBar](Type-miniguilib-minigui-progressbar-2050757430.md) — struct
- [MiniGuiLib.minigui.PropertyGrid](Type-miniguilib-minigui-propertygrid-137288887.md) — struct
- [MiniGuiLib.minigui.RadioButton](Type-miniguilib-minigui-radiobutton-2120866377.md) — struct
<a id="constant-constant-miniguilib-minigui-rdw-allchildren-const-rdw-allchildren-128-miniguilib-minigui-ml-350960148"></a>
### RDW_ALLCHILDREN

```ml
const RDW_ALLCHILDREN = 128
```

Defines the rdw allchildren constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L650)

<a id="constant-constant-miniguilib-minigui-rdw-erase-const-rdw-erase-4-miniguilib-minigui-ml-244860213"></a>
### RDW_ERASE

```ml
const RDW_ERASE = 4
```

Defines the rdw erase constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L648)

<a id="constant-constant-miniguilib-minigui-rdw-invalidate-const-rdw-invalidate-1-miniguilib-minigui-ml-1614997106"></a>
### RDW_INVALIDATE

```ml
const RDW_INVALIDATE = 1
```

Defines the rdw invalidate constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L646)

<a id="constant-constant-miniguilib-minigui-rdw-updatenow-const-rdw-updatenow-256-miniguilib-minigui-ml-727232892"></a>
### RDW_UPDATENOW

```ml
const RDW_UPDATENOW = 256
```

Defines the rdw updatenow constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L652)

<a id="extern_function-extern-function-miniguilib-minigui-redrawwindow-extern-function-redrawwindow-hwnd-as-ptr-rect-as-ptr-region-as-ptr-flags-as-u32-from-user32-dll-returns-bool-miniguilib-minigui-ml-1309591036"></a>
### RedrawWindow

```ml
extern function RedrawWindow(hwnd as ptr, rect as ptr, region as ptr, flags as u32) from "user32.dll" returns bool
```

Invokes the native RedrawWindow entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `rect` | `ptr` | — | rect value consumed by this operation. |
| `region` | `ptr` | — | region value consumed by this operation. |
| `flags` | `u32` | — | Bit flags controlling the operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L129)

<a id="extern_function-extern-function-miniguilib-minigui-registerclassw-extern-function-registerclassw-wndclass-as-bytes-from-user32-dll-returns-u32-miniguilib-minigui-ml-792481812"></a>
### RegisterClassW

```ml
extern function RegisterClassW(wndClass as bytes) from "user32.dll" returns u32
```

Invokes the native RegisterClassW entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `wndClass` | `bytes` | — | wndClass value consumed by this operation. |


**Returns:** Native u32 result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L59)

<a id="extern_function-extern-function-miniguilib-minigui-releasecapture-extern-function-releasecapture-from-user32-dll-returns-bool-miniguilib-minigui-ml-907852192"></a>
### ReleaseCapture

```ml
extern function ReleaseCapture() from "user32.dll" returns bool
```

Invokes the native ReleaseCapture entry point used by the minigui module.


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L141)

- [MiniGuiLib.minigui.RichTextBox](Type-miniguilib-minigui-richtextbox-1511588.md) — struct
<a id="extern_function-extern-function-miniguilib-minigui-rtlmovememory-extern-function-rtlmovememory-dest-as-bytes-src-as-ptr-size-as-int-from-kernel32-dll-returns-void-miniguilib-minigui-ml-326116737"></a>
### RtlMoveMemory

```ml
extern function RtlMoveMemory(dest as bytes, src as ptr, size as int) from "kernel32.dll" returns void
```

Invokes the native RtlMoveMemory entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dest` | `bytes` | — | dest value consumed by this operation. |
| `src` | `ptr` | — | src value consumed by this operation. |
| `size` | `int` | — | Size in the units required by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L295)

<a id="constant-constant-miniguilib-minigui-sb-bottom-const-sb-bottom-7-miniguilib-minigui-ml-12890236"></a>
### SB_BOTTOM

```ml
const SB_BOTTOM = 7
```

Defines the sb bottom constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L534)

<a id="constant-constant-miniguilib-minigui-sb-gettextw-const-sb-gettextw-1037-miniguilib-minigui-ml-1127769174"></a>
### SB_GETTEXTW

```ml
const SB_GETTEXTW = 1037
```

Defines the sb gettextw constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L518)

<a id="constant-constant-miniguilib-minigui-sb-linedown-const-sb-linedown-1-miniguilib-minigui-ml-1034005330"></a>
### SB_LINEDOWN

```ml
const SB_LINEDOWN = 1
```

Defines the sb linedown constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L522)

<a id="constant-constant-miniguilib-minigui-sb-lineup-const-sb-lineup-0-miniguilib-minigui-ml-1145225649"></a>
### SB_LINEUP

```ml
const SB_LINEUP = 0
```

Defines the sb lineup constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L520)

<a id="constant-constant-miniguilib-minigui-sb-pagedown-const-sb-pagedown-3-miniguilib-minigui-ml-960983768"></a>
### SB_PAGEDOWN

```ml
const SB_PAGEDOWN = 3
```

Defines the sb pagedown constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L526)

<a id="constant-constant-miniguilib-minigui-sb-pageup-const-sb-pageup-2-miniguilib-minigui-ml-865631619"></a>
### SB_PAGEUP

```ml
const SB_PAGEUP = 2
```

Defines the sb pageup constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L524)

<a id="constant-constant-miniguilib-minigui-sb-settextw-const-sb-settextw-1035-miniguilib-minigui-ml-70222420"></a>
### SB_SETTEXTW

```ml
const SB_SETTEXTW = 1035
```

Defines the sb settextw constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L516)

<a id="constant-constant-miniguilib-minigui-sb-thumbposition-const-sb-thumbposition-4-miniguilib-minigui-ml-961757005"></a>
### SB_THUMBPOSITION

```ml
const SB_THUMBPOSITION = 4
```

Defines the sb thumbposition constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L528)

<a id="constant-constant-miniguilib-minigui-sb-thumbtrack-const-sb-thumbtrack-5-miniguilib-minigui-ml-1974373974"></a>
### SB_THUMBTRACK

```ml
const SB_THUMBTRACK = 5
```

Defines the sb thumbtrack constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L530)

<a id="constant-constant-miniguilib-minigui-sb-top-const-sb-top-6-miniguilib-minigui-ml-788267499"></a>
### SB_TOP

```ml
const SB_TOP = 6
```

Defines the sb top constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L532)

<a id="constant-constant-miniguilib-minigui-sb-vert-const-sb-vert-1-miniguilib-minigui-ml-493940242"></a>
### SB_VERT

```ml
const SB_VERT = 1
```

Defines the sb vert constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L536)

<a id="constant-constant-miniguilib-minigui-sbm-getpos-const-sbm-getpos-225-miniguilib-minigui-ml-133216110"></a>
### SBM_GETPOS

```ml
const SBM_GETPOS = 225
```

Defines the sbm getpos constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L456)

<a id="constant-constant-miniguilib-minigui-sbm-setpos-const-sbm-setpos-224-miniguilib-minigui-ml-88427789"></a>
### SBM_SETPOS

```ml
const SBM_SETPOS = 224
```

Defines the sbm setpos constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L454)

<a id="constant-constant-miniguilib-minigui-sbm-setrange-const-sbm-setrange-226-miniguilib-minigui-ml-1326976377"></a>
### SBM_SETRANGE

```ml
const SBM_SETRANGE = 226
```

Defines the sbm setrange constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L458)

<a id="constant-constant-miniguilib-minigui-sbs-horz-const-sbs-horz-0-miniguilib-minigui-ml-996357867"></a>
### SBS_HORZ

```ml
const SBS_HORZ = 0
```

Defines the sbs horz constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L604)

<a id="constant-constant-miniguilib-minigui-sbs-vert-const-sbs-vert-1-miniguilib-minigui-ml-1586029632"></a>
### SBS_VERT

```ml
const SBS_VERT = 1
```

Defines the sbs vert constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L606)

- [MiniGuiLib.minigui.ScrollBar](Type-miniguilib-minigui-scrollbar-1767258424.md) — struct
- [MiniGuiLib.minigui.ScrollViewer](Type-miniguilib-minigui-scrollviewer-1330694613.md) — struct
- [MiniGuiLib.minigui.SearchBox](Type-miniguilib-minigui-searchbox-189843555.md) — struct
<a id="extern_function-extern-function-miniguilib-minigui-sendmessagetextw-extern-function-sendmessagetextw-hwnd-as-ptr-msg-as-u32-wparam-as-ptr-lparam-as-wstr-from-user32-dll-symbol-sendmessagew-returns-ptr-miniguilib-minigui-ml-1836654243"></a>
### SendMessageTextW

```ml
extern function SendMessageTextW(hwnd as ptr, msg as u32, wParam as ptr, lParam as wstr) from "user32.dll" symbol "SendMessageW" returns ptr
```

Invokes the native SendMessageTextW entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `msg` | `u32` | — | msg value consumed by this operation. |
| `wParam` | `ptr` | — | wParam value consumed by this operation. |
| `lParam` | `wstr` | — | lParam value consumed by this operation. |


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L192)

<a id="extern_function-extern-function-miniguilib-minigui-sendmessagew-extern-function-sendmessagew-hwnd-as-ptr-msg-as-u32-wparam-as-ptr-lparam-as-ptr-from-user32-dll-returns-ptr-miniguilib-minigui-ml-1311261245"></a>
### SendMessageW

```ml
extern function SendMessageW(hwnd as ptr, msg as u32, wParam as ptr, lParam as ptr) from "user32.dll" returns ptr
```

Invokes the native SendMessageW entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `msg` | `u32` | — | msg value consumed by this operation. |
| `wParam` | `ptr` | — | wParam value consumed by this operation. |
| `lParam` | `ptr` | — | lParam value consumed by this operation. |


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L185)

- [MiniGuiLib.minigui.Separator](Type-miniguilib-minigui-separator-1724365817.md) — struct
<a id="extern_function-extern-function-miniguilib-minigui-setbkcolor-extern-function-setbkcolor-hdc-as-ptr-color-as-u32-from-gdi32-dll-returns-u32-miniguilib-minigui-ml-88662883"></a>
### SetBkColor

```ml
extern function SetBkColor(hdc as ptr, color as u32) from "gdi32.dll" returns u32
```

Invokes the native SetBkColor entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hdc` | `ptr` | — | hdc value consumed by this operation. |
| `color` | `u32` | — | color value consumed by this operation. |


**Returns:** Native u32 result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L237)

<a id="extern_function-extern-function-miniguilib-minigui-setcapture-extern-function-setcapture-hwnd-as-ptr-from-user32-dll-returns-ptr-miniguilib-minigui-ml-630554789"></a>
### SetCapture

```ml
extern function SetCapture(hwnd as ptr) from "user32.dll" returns ptr
```

Invokes the native SetCapture entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L138)

<a id="extern_function-extern-function-miniguilib-minigui-setfocus-extern-function-setfocus-hwnd-as-ptr-from-user32-dll-returns-ptr-miniguilib-minigui-ml-127875201"></a>
### SetFocus

```ml
extern function SetFocus(hwnd as ptr) from "user32.dll" returns ptr
```

Invokes the native SetFocus entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L145)

<a id="extern_function-extern-function-miniguilib-minigui-setscrollpos-extern-function-setscrollpos-hwnd-as-ptr-bar-as-int-position-as-int-redraw-as-bool-from-user32-dll-returns-int-miniguilib-minigui-ml-1809142867"></a>
### SetScrollPos

```ml
extern function SetScrollPos(hwnd as ptr, bar as int, position as int, redraw as bool) from "user32.dll" returns int
```

Invokes the native SetScrollPos entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `bar` | `int` | — | bar value consumed by this operation. |
| `position` | `int` | — | position value consumed by this operation. |
| `redraw` | `bool` | — | redraw value consumed by this operation. |


**Returns:** Native int result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L160)

<a id="extern_function-extern-function-miniguilib-minigui-setscrollrange-extern-function-setscrollrange-hwnd-as-ptr-bar-as-int-minimum-as-int-maximum-as-int-redraw-as-bool-from-user32-dll-returns-bool-miniguilib-minigui-ml-1574856408"></a>
### SetScrollRange

```ml
extern function SetScrollRange(hwnd as ptr, bar as int, minimum as int, maximum as int, redraw as bool) from "user32.dll" returns bool
```

Invokes the native SetScrollRange entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `bar` | `int` | — | bar value consumed by this operation. |
| `minimum` | `int` | — | minimum value consumed by this operation. |
| `maximum` | `int` | — | maximum value consumed by this operation. |
| `redraw` | `bool` | — | redraw value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L153)

<a id="extern_function-extern-function-miniguilib-minigui-settextcolor-extern-function-settextcolor-hdc-as-ptr-color-as-u32-from-gdi32-dll-returns-u32-miniguilib-minigui-ml-786487179"></a>
### SetTextColor

```ml
extern function SetTextColor(hdc as ptr, color as u32) from "gdi32.dll" returns u32
```

Invokes the native SetTextColor entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hdc` | `ptr` | — | hdc value consumed by this operation. |
| `color` | `u32` | — | color value consumed by this operation. |


**Returns:** Native u32 result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L232)

<a id="extern_function-extern-function-miniguilib-minigui-settimer-extern-function-settimer-hwnd-as-ptr-timerid-as-u32-elapsedms-as-u32-timerproc-as-ptr-from-user32-dll-returns-ptr-miniguilib-minigui-ml-1082918524"></a>
### SetTimer

```ml
extern function SetTimer(hwnd as ptr, timerId as u32, elapsedMs as u32, timerProc as ptr) from "user32.dll" returns ptr
```

Invokes the native SetTimer entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `timerId` | `u32` | — | Identifier of timer. |
| `elapsedMs` | `u32` | — | elapsedMs value consumed by this operation. |
| `timerProc` | `ptr` | — | timerProc value consumed by this operation. |


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L167)

<a id="extern_function-extern-function-miniguilib-minigui-setwindowlongptrw-extern-function-setwindowlongptrw-hwnd-as-ptr-index-as-int-newlong-as-ptr-from-user32-dll-returns-ptr-miniguilib-minigui-ml-1628662856"></a>
### SetWindowLongPtrW

```ml
extern function SetWindowLongPtrW(hwnd as ptr, index as int, newLong as ptr) from "user32.dll" returns ptr
```

Invokes the native SetWindowLongPtrW entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `index` | `int` | — | Zero-based index of the affected item. |
| `newLong` | `ptr` | — | newLong value consumed by this operation. |


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L173)

<a id="extern_function-extern-function-miniguilib-minigui-setwindowtextw-extern-function-setwindowtextw-hwnd-as-ptr-text-as-wstr-from-user32-dll-returns-bool-miniguilib-minigui-ml-674173364"></a>
### SetWindowTextW

```ml
extern function SetWindowTextW(hwnd as ptr, text as wstr) from "user32.dll" returns bool
```

Invokes the native SetWindowTextW entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `text` | `wstr` | — | Text consumed by the operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L98)

<a id="extern_function-extern-function-miniguilib-minigui-shbrowseforfolderw-extern-function-shbrowseforfolderw-browseinfo-as-bytes-from-shell32-dll-returns-ptr-miniguilib-minigui-ml-1412385260"></a>
### SHBrowseForFolderW

```ml
extern function SHBrowseForFolderW(browseInfo as bytes) from "shell32.dll" returns ptr
```

Invokes the native SHBrowseForFolderW entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `browseInfo` | `bytes` | — | browseInfo value consumed by this operation. |


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L267)

<a id="extern_function-extern-function-miniguilib-minigui-shgetpathfromidlistw-extern-function-shgetpathfromidlistw-itemlist-as-ptr-path-as-bytes-from-shell32-dll-returns-bool-miniguilib-minigui-ml-148032026"></a>
### SHGetPathFromIDListW

```ml
extern function SHGetPathFromIDListW(itemList as ptr, path as bytes) from "shell32.dll" returns bool
```

Invokes the native SHGetPathFromIDListW entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `itemList` | `ptr` | — | itemList value consumed by this operation. |
| `path` | `bytes` | — | Path of the file or directory used by the operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L272)

<a id="extern_function-extern-function-miniguilib-minigui-showwindow-extern-function-showwindow-hwnd-as-ptr-cmd-as-int-from-user32-dll-returns-bool-miniguilib-minigui-ml-304200140"></a>
### ShowWindow

```ml
extern function ShowWindow(hwnd as ptr, cmd as int) from "user32.dll" returns bool
```

Invokes the native ShowWindow entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `cmd` | `int` | — | cmd value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L76)

- [MiniGuiLib.minigui.Slider](Type-miniguilib-minigui-slider-1448461179.md) — struct
- [MiniGuiLib.minigui.SpinBox](Type-miniguilib-minigui-spinbox-73951299.md) — struct
- [MiniGuiLib.minigui.Splitter](Type-miniguilib-minigui-splitter-693560105.md) — struct
<a id="constant-constant-miniguilib-minigui-ss-centerimage-const-ss-centerimage-512-miniguilib-minigui-ml-66459737"></a>
### SS_CENTERIMAGE

```ml
const SS_CENTERIMAGE = 512
```

Defines the ss centerimage constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L570)

<a id="constant-constant-miniguilib-minigui-ss-etchedhorz-const-ss-etchedhorz-16-miniguilib-minigui-ml-1816260134"></a>
### SS_ETCHEDHORZ

```ml
const SS_ETCHEDHORZ = 16
```

Defines the ss etchedhorz constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L574)

<a id="constant-constant-miniguilib-minigui-ss-etchedvert-const-ss-etchedvert-17-miniguilib-minigui-ml-1400201813"></a>
### SS_ETCHEDVERT

```ml
const SS_ETCHEDVERT = 17
```

Defines the ss etchedvert constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L576)

<a id="constant-constant-miniguilib-minigui-ss-left-const-ss-left-0-miniguilib-minigui-ml-401908001"></a>
### SS_LEFT

```ml
const SS_LEFT = 0
```

Defines the ss left constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L568)

<a id="constant-constant-miniguilib-minigui-ss-notify-const-ss-notify-256-miniguilib-minigui-ml-1941037104"></a>
### SS_NOTIFY

```ml
const SS_NOTIFY = 256
```

Defines the ss notify constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L572)

- [MiniGuiLib.minigui.StatusBar](Type-miniguilib-minigui-statusbar-969880253.md) — struct
<a id="constant-constant-miniguilib-minigui-stm-setimage-const-stm-setimage-370-miniguilib-minigui-ml-1495482505"></a>
### STM_SETIMAGE

```ml
const STM_SETIMAGE = 370
```

Defines the stm setimage constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L578)

<a id="constant-constant-miniguilib-minigui-sw-show-const-sw-show-5-miniguilib-minigui-ml-1623274306"></a>
### SW_SHOW

```ml
const SW_SHOW = 5
```

Defines the sw show constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L642)

- [MiniGuiLib.minigui.TabControl](Type-miniguilib-minigui-tabcontrol-1354852254.md) — struct
<a id="constant-constant-miniguilib-minigui-tbm-getpos-const-tbm-getpos-1024-miniguilib-minigui-ml-1825690064"></a>
### TBM_GETPOS

```ml
const TBM_GETPOS = 1024
```

Defines the tbm getpos constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L476)

<a id="constant-constant-miniguilib-minigui-tbm-setlinesize-const-tbm-setlinesize-1047-miniguilib-minigui-ml-2115316577"></a>
### TBM_SETLINESIZE

```ml
const TBM_SETLINESIZE = 1047
```

Defines the tbm setlinesize constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L486)

<a id="constant-constant-miniguilib-minigui-tbm-setpagesize-const-tbm-setpagesize-1045-miniguilib-minigui-ml-600110127"></a>
### TBM_SETPAGESIZE

```ml
const TBM_SETPAGESIZE = 1045
```

Defines the tbm setpagesize constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L484)

<a id="constant-constant-miniguilib-minigui-tbm-setpos-const-tbm-setpos-1029-miniguilib-minigui-ml-448422011"></a>
### TBM_SETPOS

```ml
const TBM_SETPOS = 1029
```

Defines the tbm setpos constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L478)

<a id="constant-constant-miniguilib-minigui-tbm-setrangemax-const-tbm-setrangemax-1032-miniguilib-minigui-ml-631794341"></a>
### TBM_SETRANGEMAX

```ml
const TBM_SETRANGEMAX = 1032
```

Defines the tbm setrangemax constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L482)

<a id="constant-constant-miniguilib-minigui-tbm-setrangemin-const-tbm-setrangemin-1031-miniguilib-minigui-ml-124384836"></a>
### TBM_SETRANGEMIN

```ml
const TBM_SETRANGEMIN = 1031
```

Defines the tbm setrangemin constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L480)

<a id="constant-constant-miniguilib-minigui-tbs-autoticks-const-tbs-autoticks-1-miniguilib-minigui-ml-1362977990"></a>
### TBS_AUTOTICKS

```ml
const TBS_AUTOTICKS = 1
```

Defines the tbs autoticks constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L614)

<a id="constant-constant-miniguilib-minigui-tbs-vert-const-tbs-vert-2-miniguilib-minigui-ml-1990848319"></a>
### TBS_VERT

```ml
const TBS_VERT = 2
```

Defines the tbs vert constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L616)

<a id="constant-constant-miniguilib-minigui-tcif-text-const-tcif-text-1-miniguilib-minigui-ml-1914745014"></a>
### TCIF_TEXT

```ml
const TCIF_TEXT = 1
```

Defines the tcif text constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L472)

<a id="constant-constant-miniguilib-minigui-tcm-getcursel-const-tcm-getcursel-4875-miniguilib-minigui-ml-152773965"></a>
### TCM_GETCURSEL

```ml
const TCM_GETCURSEL = 4875
```

Defines the tcm getcursel constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L466)

<a id="constant-constant-miniguilib-minigui-tcm-getitemcount-const-tcm-getitemcount-4868-miniguilib-minigui-ml-1227228191"></a>
### TCM_GETITEMCOUNT

```ml
const TCM_GETITEMCOUNT = 4868
```

Defines the tcm getitemcount constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L462)

<a id="constant-constant-miniguilib-minigui-tcm-getitemrect-const-tcm-getitemrect-4874-miniguilib-minigui-ml-1508436698"></a>
### TCM_GETITEMRECT

```ml
const TCM_GETITEMRECT = 4874
```

Defines the tcm getitemrect constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L464)

<a id="constant-constant-miniguilib-minigui-tcm-hittest-const-tcm-hittest-4877-miniguilib-minigui-ml-1209324139"></a>
### TCM_HITTEST

```ml
const TCM_HITTEST = 4877
```

Defines the tcm hittest constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L470)

<a id="constant-constant-miniguilib-minigui-tcm-insertitemw-const-tcm-insertitemw-4926-miniguilib-minigui-ml-13813210"></a>
### TCM_INSERTITEMW

```ml
const TCM_INSERTITEMW = 4926
```

Defines the tcm insertitemw constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L460)

<a id="constant-constant-miniguilib-minigui-tcm-setcursel-const-tcm-setcursel-4876-miniguilib-minigui-ml-826697484"></a>
### TCM_SETCURSEL

```ml
const TCM_SETCURSEL = 4876
```

Defines the tcm setcursel constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L468)

<a id="constant-constant-miniguilib-minigui-tcn-selchange-const-tcn-selchange-551-miniguilib-minigui-ml-10564189"></a>
### TCN_SELCHANGE

```ml
const TCN_SELCHANGE = -551
```

Defines the tcn selchange constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L474)

- [MiniGuiLib.minigui.TextArea](Type-miniguilib-minigui-textarea-1993982468.md) — struct
- [MiniGuiLib.minigui.TextBox](Type-miniguilib-minigui-textbox-245475314.md) — struct
- [MiniGuiLib.minigui.TimePicker](Type-miniguilib-minigui-timepicker-1929323797.md) — struct
- [MiniGuiLib.minigui.ToggleSwitch](Type-miniguilib-minigui-toggleswitch-1594220486.md) — struct
- [MiniGuiLib.minigui.ToolBar](Type-miniguilib-minigui-toolbar-853395957.md) — struct
<a id="constant-constant-miniguilib-minigui-tpm-returncmd-const-tpm-returncmd-256-miniguilib-minigui-ml-1677623592"></a>
### TPM_RETURNCMD

```ml
const TPM_RETURNCMD = 256
```

Defines the tpm returncmd constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L692)

<a id="constant-constant-miniguilib-minigui-tpm-rightbutton-const-tpm-rightbutton-2-miniguilib-minigui-ml-885801915"></a>
### TPM_RIGHTBUTTON

```ml
const TPM_RIGHTBUTTON = 2
```

Defines the tpm rightbutton constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L690)

<a id="extern_function-extern-function-miniguilib-minigui-trackpopupmenuex-extern-function-trackpopupmenuex-menu-as-ptr-flags-as-u32-x-as-int-y-as-int-owner-as-ptr-params-as-ptr-from-user32-dll-returns-int-miniguilib-minigui-ml-1158617525"></a>
### TrackPopupMenuEx

```ml
extern function TrackPopupMenuEx(menu as ptr, flags as u32, x as int, y as int, owner as ptr, params as ptr) from "user32.dll" returns int
```

Invokes the native TrackPopupMenuEx entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `ptr` | — | menu value consumed by this operation. |
| `flags` | `u32` | — | Bit flags controlling the operation. |
| `x` | `int` | — | Horizontal coordinate used by the operation. |
| `y` | `int` | — | Vertical coordinate used by the operation. |
| `owner` | `ptr` | — | owner value consumed by this operation. |
| `params` | `ptr` | — | params value consumed by this operation. |


**Returns:** Native int result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L227)

<a id="extern_function-extern-function-miniguilib-minigui-translatemessage-extern-function-translatemessage-msg-as-bytes-from-user32-dll-returns-bool-miniguilib-minigui-ml-625274780"></a>
### TranslateMessage

```ml
extern function TranslateMessage(msg as bytes) from "user32.dll" returns bool
```

Invokes the native TranslateMessage entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `bytes` | — | msg value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L309)

- [MiniGuiLib.minigui.TrayIcon](Type-miniguilib-minigui-trayicon-674147511.md) — struct
- [MiniGuiLib.minigui.TreeView](Type-miniguilib-minigui-treeview-42567539.md) — struct
<a id="constant-constant-miniguilib-minigui-ttf-idishwnd-const-ttf-idishwnd-1-miniguilib-minigui-ml-1971498738"></a>
### TTF_IDISHWND

```ml
const TTF_IDISHWND = 1
```

Defines the ttf idishwnd constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L634)

<a id="constant-constant-miniguilib-minigui-ttf-subclass-const-ttf-subclass-16-miniguilib-minigui-ml-216625398"></a>
### TTF_SUBCLASS

```ml
const TTF_SUBCLASS = 16
```

Defines the ttf subclass constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L636)

<a id="constant-constant-miniguilib-minigui-ttm-addtoolw-const-ttm-addtoolw-1074-miniguilib-minigui-ml-17557933"></a>
### TTM_ADDTOOLW

```ml
const TTM_ADDTOOLW = 1074
```

Defines the ttm addtoolw constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L638)

<a id="constant-constant-miniguilib-minigui-ttm-setmaxtipwidth-const-ttm-setmaxtipwidth-1048-miniguilib-minigui-ml-1803116148"></a>
### TTM_SETMAXTIPWIDTH

```ml
const TTM_SETMAXTIPWIDTH = 1048
```

Defines the ttm setmaxtipwidth constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L640)

<a id="constant-constant-miniguilib-minigui-tts-alwaystip-const-tts-alwaystip-1-miniguilib-minigui-ml-477290614"></a>
### TTS_ALWAYSTIP

```ml
const TTS_ALWAYSTIP = 1
```

Defines the tts alwaystip constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L632)

<a id="constant-constant-miniguilib-minigui-tvgn-caret-const-tvgn-caret-9-miniguilib-minigui-ml-1506121230"></a>
### TVGN_CARET

```ml
const TVGN_CARET = 9
```

Defines the tvgn caret constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L510)

<a id="constant-constant-miniguilib-minigui-tvi-last-const-tvi-last-4294901762-miniguilib-minigui-ml-1810823357"></a>
### TVI_LAST

```ml
const TVI_LAST = 4294901762
```

Defines the tvi last constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L514)

<a id="constant-constant-miniguilib-minigui-tvi-root-const-tvi-root-4294901760-miniguilib-minigui-ml-1032997431"></a>
### TVI_ROOT

```ml
const TVI_ROOT = 4294901760
```

Defines the tvi root constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L512)

<a id="constant-constant-miniguilib-minigui-tvif-text-const-tvif-text-1-miniguilib-minigui-ml-2108519266"></a>
### TVIF_TEXT

```ml
const TVIF_TEXT = 1
```

Defines the tvif text constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L508)

<a id="constant-constant-miniguilib-minigui-tvm-deleteitem-const-tvm-deleteitem-4353-miniguilib-minigui-ml-795258770"></a>
### TVM_DELETEITEM

```ml
const TVM_DELETEITEM = 4353
```

Defines the tvm deleteitem constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L498)

<a id="constant-constant-miniguilib-minigui-tvm-getitemw-const-tvm-getitemw-4414-miniguilib-minigui-ml-952194306"></a>
### TVM_GETITEMW

```ml
const TVM_GETITEMW = 4414
```

Defines the tvm getitemw constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L502)

<a id="constant-constant-miniguilib-minigui-tvm-getnextitem-const-tvm-getnextitem-4362-miniguilib-minigui-ml-1846211616"></a>
### TVM_GETNEXTITEM

```ml
const TVM_GETNEXTITEM = 4362
```

Defines the tvm getnextitem constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L500)

<a id="constant-constant-miniguilib-minigui-tvm-insertitemw-const-tvm-insertitemw-4402-miniguilib-minigui-ml-2125557783"></a>
### TVM_INSERTITEMW

```ml
const TVM_INSERTITEMW = 4402
```

Defines the tvm insertitemw constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L504)

<a id="constant-constant-miniguilib-minigui-tvn-selchangedw-const-tvn-selchangedw-451-miniguilib-minigui-ml-18587534"></a>
### TVN_SELCHANGEDW

```ml
const TVN_SELCHANGEDW = -451
```

Defines the tvn selchangedw constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L506)

<a id="constant-constant-miniguilib-minigui-tvs-hasbuttons-const-tvs-hasbuttons-1-miniguilib-minigui-ml-1909634602"></a>
### TVS_HASBUTTONS

```ml
const TVS_HASBUTTONS = 1
```

Defines the tvs hasbuttons constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L612)

<a id="constant-constant-miniguilib-minigui-tvs-haslines-const-tvs-haslines-2-miniguilib-minigui-ml-1616109787"></a>
### TVS_HASLINES

```ml
const TVS_HASLINES = 2
```

Defines the tvs haslines constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L608)

<a id="constant-constant-miniguilib-minigui-tvs-linesatroot-const-tvs-linesatroot-4-miniguilib-minigui-ml-785763189"></a>
### TVS_LINESATROOT

```ml
const TVS_LINESATROOT = 4
```

Defines the tvs linesatroot constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L610)

<a id="constant-constant-miniguilib-minigui-udm-getpos32-const-udm-getpos32-1138-miniguilib-minigui-ml-16171446"></a>
### UDM_GETPOS32

```ml
const UDM_GETPOS32 = 1138
```

Defines the udm getpos32 constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L494)

<a id="constant-constant-miniguilib-minigui-udm-setbuddy-const-udm-setbuddy-1129-miniguilib-minigui-ml-238846742"></a>
### UDM_SETBUDDY

```ml
const UDM_SETBUDDY = 1129
```

Defines the udm setbuddy constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L488)

<a id="constant-constant-miniguilib-minigui-udm-setpos32-const-udm-setpos32-1137-miniguilib-minigui-ml-70736839"></a>
### UDM_SETPOS32

```ml
const UDM_SETPOS32 = 1137
```

Defines the udm setpos32 constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L492)

<a id="constant-constant-miniguilib-minigui-udm-setrange32-const-udm-setrange32-1135-miniguilib-minigui-ml-1645810687"></a>
### UDM_SETRANGE32

```ml
const UDM_SETRANGE32 = 1135
```

Defines the udm setrange32 constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L490)

<a id="constant-constant-miniguilib-minigui-udn-deltapos-const-udn-deltapos-722-miniguilib-minigui-ml-2018086811"></a>
### UDN_DELTAPOS

```ml
const UDN_DELTAPOS = -722
```

Defines the udn deltapos constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L496)

<a id="constant-constant-miniguilib-minigui-uds-alignright-const-uds-alignright-4-miniguilib-minigui-ml-1372510755"></a>
### UDS_ALIGNRIGHT

```ml
const UDS_ALIGNRIGHT = 4
```

Defines the uds alignright constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L620)

<a id="constant-constant-miniguilib-minigui-uds-arrowkeys-const-uds-arrowkeys-32-miniguilib-minigui-ml-1392885836"></a>
### UDS_ARROWKEYS

```ml
const UDS_ARROWKEYS = 32
```

Defines the uds arrowkeys constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L622)

<a id="constant-constant-miniguilib-minigui-uds-nothousands-const-uds-nothousands-128-miniguilib-minigui-ml-158494232"></a>
### UDS_NOTHOUSANDS

```ml
const UDS_NOTHOUSANDS = 128
```

Defines the uds nothousands constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L624)

<a id="constant-constant-miniguilib-minigui-uds-setbuddyint-const-uds-setbuddyint-2-miniguilib-minigui-ml-1941148367"></a>
### UDS_SETBUDDYINT

```ml
const UDS_SETBUDDYINT = 2
```

Defines the uds setbuddyint constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L618)

<a id="extern_function-extern-function-miniguilib-minigui-updatewindow-extern-function-updatewindow-hwnd-as-ptr-from-user32-dll-returns-bool-miniguilib-minigui-ml-74524657"></a>
### UpdateWindow

```ml
extern function UpdateWindow(hwnd as ptr) from "user32.dll" returns bool
```

Invokes the native UpdateWindow entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L80)

<a id="constant-constant-miniguilib-minigui-vk-escape-const-vk-escape-27-miniguilib-minigui-ml-1449562622"></a>
### VK_ESCAPE

```ml
const VK_ESCAPE = 27
```

Defines the vk escape constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L366)

<a id="constant-constant-miniguilib-minigui-vk-return-const-vk-return-13-miniguilib-minigui-ml-1964449029"></a>
### VK_RETURN

```ml
const VK_RETURN = 13
```

Defines the vk return constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L364)

- [MiniGuiLib.minigui.WebView](Type-miniguilib-minigui-webview-1864129617.md) — struct
- [MiniGuiLib.minigui.Window](Type-miniguilib-minigui-window-1943367786.md) — struct
<a id="constant-constant-miniguilib-minigui-wm-close-const-wm-close-16-miniguilib-minigui-ml-1333506710"></a>
### WM_CLOSE

```ml
const WM_CLOSE = 16
```

Defines the wm close constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L334)

<a id="constant-constant-miniguilib-minigui-wm-command-const-wm-command-273-miniguilib-minigui-ml-1810557011"></a>
### WM_COMMAND

```ml
const WM_COMMAND = 273
```

Defines the wm command constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L336)

<a id="constant-constant-miniguilib-minigui-wm-ctlcolorbtn-const-wm-ctlcolorbtn-309-miniguilib-minigui-ml-714605079"></a>
### WM_CTLCOLORBTN

```ml
const WM_CTLCOLORBTN = 309
```

Defines the wm ctlcolorbtn constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L344)

<a id="constant-constant-miniguilib-minigui-wm-ctlcoloredit-const-wm-ctlcoloredit-307-miniguilib-minigui-ml-1529718957"></a>
### WM_CTLCOLOREDIT

```ml
const WM_CTLCOLOREDIT = 307
```

Defines the wm ctlcoloredit constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L340)

<a id="constant-constant-miniguilib-minigui-wm-ctlcolorlistbox-const-wm-ctlcolorlistbox-308-miniguilib-minigui-ml-1229776550"></a>
### WM_CTLCOLORLISTBOX

```ml
const WM_CTLCOLORLISTBOX = 308
```

Defines the wm ctlcolorlistbox constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L342)

<a id="constant-constant-miniguilib-minigui-wm-ctlcolorstatic-const-wm-ctlcolorstatic-312-miniguilib-minigui-ml-762399787"></a>
### WM_CTLCOLORSTATIC

```ml
const WM_CTLCOLORSTATIC = 312
```

Defines the wm ctlcolorstatic constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L346)

<a id="constant-constant-miniguilib-minigui-wm-destroy-const-wm-destroy-2-miniguilib-minigui-ml-1078245303"></a>
### WM_DESTROY

```ml
const WM_DESTROY = 2
```

Defines the wm destroy constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L332)

<a id="constant-constant-miniguilib-minigui-wm-hscroll-const-wm-hscroll-276-miniguilib-minigui-ml-1374501136"></a>
### WM_HSCROLL

```ml
const WM_HSCROLL = 276
```

Defines the wm hscroll constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L348)

<a id="constant-constant-miniguilib-minigui-wm-keydown-const-wm-keydown-256-miniguilib-minigui-ml-1545292422"></a>
### WM_KEYDOWN

```ml
const WM_KEYDOWN = 256
```

Defines the wm keydown constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L362)

<a id="constant-constant-miniguilib-minigui-wm-killfocus-const-wm-killfocus-8-miniguilib-minigui-ml-1638768057"></a>
### WM_KILLFOCUS

```ml
const WM_KILLFOCUS = 8
```

Defines the wm killfocus constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L326)

<a id="constant-constant-miniguilib-minigui-wm-lbuttondblclk-const-wm-lbuttondblclk-515-miniguilib-minigui-ml-224026188"></a>
### WM_LBUTTONDBLCLK

```ml
const WM_LBUTTONDBLCLK = 515
```

Defines the wm lbuttondblclk constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L360)

<a id="constant-constant-miniguilib-minigui-wm-lbuttondown-const-wm-lbuttondown-513-miniguilib-minigui-ml-684805310"></a>
### WM_LBUTTONDOWN

```ml
const WM_LBUTTONDOWN = 513
```

Defines the wm lbuttondown constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L354)

<a id="constant-constant-miniguilib-minigui-wm-lbuttonup-const-wm-lbuttonup-514-miniguilib-minigui-ml-2062976529"></a>
### WM_LBUTTONUP

```ml
const WM_LBUTTONUP = 514
```

Defines the wm lbuttonup constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L358)

<a id="constant-constant-miniguilib-minigui-wm-mousemove-const-wm-mousemove-512-miniguilib-minigui-ml-389820105"></a>
### WM_MOUSEMOVE

```ml
const WM_MOUSEMOVE = 512
```

Defines the wm mousemove constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L352)

<a id="constant-constant-miniguilib-minigui-wm-mousewheel-const-wm-mousewheel-522-miniguilib-minigui-ml-55326770"></a>
### WM_MOUSEWHEEL

```ml
const WM_MOUSEWHEEL = 522
```

Defines the wm mousewheel constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L356)

<a id="constant-constant-miniguilib-minigui-wm-notify-const-wm-notify-78-miniguilib-minigui-ml-1018255650"></a>
### WM_NOTIFY

```ml
const WM_NOTIFY = 78
```

Defines the wm notify constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L338)

<a id="constant-constant-miniguilib-minigui-wm-rbuttonup-const-wm-rbuttonup-517-miniguilib-minigui-ml-517447304"></a>
### WM_RBUTTONUP

```ml
const WM_RBUTTONUP = 517
```

Defines the wm rbuttonup constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L368)

<a id="constant-constant-miniguilib-minigui-wm-setfocus-const-wm-setfocus-7-miniguilib-minigui-ml-1746277692"></a>
### WM_SETFOCUS

```ml
const WM_SETFOCUS = 7
```

Defines the wm setfocus constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L324)

<a id="constant-constant-miniguilib-minigui-wm-size-const-wm-size-5-miniguilib-minigui-ml-213818346"></a>
### WM_SIZE

```ml
const WM_SIZE = 5
```

Defines the wm size constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L328)

<a id="constant-constant-miniguilib-minigui-wm-timer-const-wm-timer-275-miniguilib-minigui-ml-2087036313"></a>
### WM_TIMER

```ml
const WM_TIMER = 275
```

Defines the wm timer constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L330)

<a id="constant-constant-miniguilib-minigui-wm-vscroll-const-wm-vscroll-277-miniguilib-minigui-ml-1643285467"></a>
### WM_VSCROLL

```ml
const WM_VSCROLL = 277
```

Defines the wm vscroll constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L350)

<a id="constant-constant-miniguilib-minigui-ws-border-const-ws-border-8388608-miniguilib-minigui-ml-1343408324"></a>
### WS_BORDER

```ml
const WS_BORDER = 8388608
```

Defines the ws border constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L548)

<a id="constant-constant-miniguilib-minigui-ws-child-const-ws-child-1073741824-miniguilib-minigui-ml-752955866"></a>
### WS_CHILD

```ml
const WS_CHILD = 1073741824
```

Defines the ws child constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L544)

<a id="constant-constant-miniguilib-minigui-ws-clipchildren-const-ws-clipchildren-33554432-miniguilib-minigui-ml-1222665964"></a>
### WS_CLIPCHILDREN

```ml
const WS_CLIPCHILDREN = 33554432
```

Defines the ws clipchildren constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L546)

<a id="constant-constant-miniguilib-minigui-ws-hscroll-const-ws-hscroll-1048576-miniguilib-minigui-ml-1870468578"></a>
### WS_HSCROLL

```ml
const WS_HSCROLL = 1048576
```

Defines the ws hscroll constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L552)

<a id="constant-constant-miniguilib-minigui-ws-overlappedwindow-const-ws-overlappedwindow-13565952-miniguilib-minigui-ml-1201837691"></a>
### WS_OVERLAPPEDWINDOW

```ml
const WS_OVERLAPPEDWINDOW = 13565952
```

Defines the ws overlappedwindow constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L540)

<a id="constant-constant-miniguilib-minigui-ws-tabstop-const-ws-tabstop-65536-miniguilib-minigui-ml-549771534"></a>
### WS_TABSTOP

```ml
const WS_TABSTOP = 65536
```

Defines the ws tabstop constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L554)

<a id="constant-constant-miniguilib-minigui-ws-visible-const-ws-visible-268435456-miniguilib-minigui-ml-2146855434"></a>
### WS_VISIBLE

```ml
const WS_VISIBLE = 268435456
```

Defines the ws visible constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L542)

<a id="constant-constant-miniguilib-minigui-ws-vscroll-const-ws-vscroll-2097152-miniguilib-minigui-ml-1312604733"></a>
### WS_VSCROLL

```ml
const WS_VSCROLL = 2097152
```

Defines the ws vscroll constant used by the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L550)
