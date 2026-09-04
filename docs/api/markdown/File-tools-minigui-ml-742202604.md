# `tools/minigui.ml`

[Home](README.md) · [Files](Files.md)

Provides minigui facilities for this project.

Package: [`(global)`](Package-global-1952375359.md)

Reachable from entry: **yes**

## Imports

- `std/fs.ml` as `fs` → `../MiniLangCompilerML/std/fs.ml` — external dependency
- `std/string.ml` as `str` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="extern_function-extern-function-wmkdir-extern-function-wmkdir-path-as-wstr-from-msvcrt-dll-returns-int-tools-minigui-ml-334335994"></a>
### _wmkdir

```ml
extern function _wmkdir(path as wstr) from "msvcrt.dll" returns int
```

Invokes the native _wmkdir entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `wstr` | — | Path of the file or directory used by the operation. |


**Returns:** Native int result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L15)

<a id="extern_function-extern-function-wsystem-extern-function-wsystem-cmd-as-wstr-from-msvcrt-dll-returns-int-tools-minigui-ml-1393008707"></a>
### _wsystem

```ml
extern function _wsystem(cmd as wstr) from "msvcrt.dll" returns int
```

Invokes the native _wsystem entry point used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cmd` | `wstr` | — | cmd value consumed by this operation. |


**Returns:** Native int result produced by the call.

[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L11)

<a id="function-function-adderror-function-adderror-result-path-message-tools-minigui-ml-2077416824"></a>
### addError

```ml
function addError(result, path, message)
```

Adds error to the state managed by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — | Result object populated or inspected by the operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |
| `message` | `dynamic` | — | Human-readable message associated with the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L176)

<a id="function-function-addgeneratednode-function-addgeneratednode-lines-fields-result-path-node-parentvar-parenttype-x-y-width-height-tools-minigui-ml-525139880"></a>
### addGeneratedNode

```ml
function addGeneratedNode(lines, fields, result, path, node, parentVar, parentType, x, y, width, height)
```

Adds generated node to the state managed by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `lines` | `dynamic` | — | lines value consumed by this operation. |
| `fields` | `dynamic` | — | fields value consumed by this operation. |
| `result` | `dynamic` | — | Result object populated or inspected by the operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |
| `node` | `dynamic` | — | node value consumed by this operation. |
| `parentVar` | `dynamic` | — | parentVar value consumed by this operation. |
| `parentType` | `dynamic` | — | parentType value consumed by this operation. |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |
| `y` | `dynamic` | — | Vertical coordinate used by the operation. |
| `width` | `dynamic` | — | Width in the coordinate or storage units used by the caller. |
| `height` | `dynamic` | — | Height in the coordinate or storage units used by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1625)

<a id="function-function-allowedcontrolevents-function-allowedcontrolevents-typ-tools-minigui-ml-649350264"></a>
### allowedControlEvents

```ml
function allowedControlEvents(typ)
```

Performs the allowedControlEvents operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `typ` | `dynamic` | — | typ value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1047)

<a id="function-function-allowedcontrolprops-function-allowedcontrolprops-typ-tools-minigui-ml-1407366198"></a>
### allowedControlProps

```ml
function allowedControlProps(typ)
```

Performs the allowedControlProps operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `typ` | `dynamic` | — | typ value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1065)

<a id="function-function-appendcodeunitutf8-function-appendcodeunitutf8-outbytes-cp-tools-minigui-ml-1513962659"></a>
### appendCodeUnitUtf8

```ml
function appendCodeUnitUtf8(outBytes, cp)
```

Appends code unit utf8 to the destination used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `outBytes` | `dynamic` | — | outBytes value consumed by this operation. |
| `cp` | `dynamic` | — | cp value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L344)

<a id="function-function-arritems-function-arritems-v-tools-minigui-ml-1899234739"></a>
### arrItems

```ml
function arrItems(v)
```

Performs the arrItems operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — | v value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L263)

<a id="function-function-asbool-function-asbool-v-fallback-tools-minigui-ml-1812786413"></a>
### asBool

```ml
function asBool(v, fallback)
```

Performs the asBool operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — | v value consumed by this operation. |
| `fallback` | `dynamic` | — | Value returned when no explicit result is available. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L249)

<a id="function-function-asint-function-asint-v-fallback-tools-minigui-ml-416818299"></a>
### asInt

```ml
function asInt(v, fallback)
```

Performs the asInt operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — | v value consumed by this operation. |
| `fallback` | `dynamic` | — | Value returned when no explicit result is available. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L223)

<a id="function-function-asstring-function-asstring-v-fallback-tools-minigui-ml-75689085"></a>
### asString

```ml
function asString(v, fallback)
```

Performs the asString operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — | v value consumed by this operation. |
| `fallback` | `dynamic` | — | Value returned when no explicit result is available. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L215)

<a id="function-function-basenamenoext-function-basenamenoext-path-tools-minigui-ml-1247929144"></a>
### basenameNoExt

```ml
function basenameNoExt(path)
```

Performs the basenameNoExt operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L593)

<a id="function-function-boolprop-function-boolprop-result-path-node-name-fallback-tools-minigui-ml-812731956"></a>
### boolProp

```ml
function boolProp(result, path, node, name, fallback)
```

Performs the boolProp operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — | Result object populated or inspected by the operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |
| `node` | `dynamic` | — | node value consumed by this operation. |
| `name` | `dynamic` | — | Name of the affected item. |
| `fallback` | `dynamic` | — | Value returned when no explicit result is available. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1433)

<a id="function-function-charat-function-charat-text-i-tools-minigui-ml-1819774295"></a>
### charAt

```ml
function charAt(text, i)
```

Performs the charAt operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `i` | `dynamic` | — | i value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L272)

<a id="function-function-clampdimension-function-clampdimension-result-path-node-axis-value-tools-minigui-ml-1785762353"></a>
### clampDimension

```ml
function clampDimension(result, path, node, axis, value)
```

Performs the clampDimension operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — | Result object populated or inspected by the operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |
| `node` | `dynamic` | — | node value consumed by this operation. |
| `axis` | `dynamic` | — | axis value consumed by this operation. |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1394)

<a id="function-function-clonejson-function-clonejson-v-tools-minigui-ml-1085644649"></a>
### cloneJson

```ml
function cloneJson(v)
```

Performs the cloneJson operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — | v value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L936)

<a id="function-function-collecttreeitemliterals-function-collecttreeitemliterals-result-path-parts-item-level-tools-minigui-ml-990768546"></a>
### collectTreeItemLiterals

```ml
function collectTreeItemLiterals(result, path, parts, item, level)
```

Collects tree item literals for the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — | Result object populated or inspected by the operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |
| `parts` | `dynamic` | — | parts value consumed by this operation. |
| `item` | `dynamic` | — | item value consumed by this operation. |
| `level` | `dynamic` | — | level value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1500)

<a id="function-function-commoncontrolprops-function-commoncontrolprops-tools-minigui-ml-437269975"></a>
### commonControlProps

```ml
function commonControlProps()
```

Performs the commonControlProps operation for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1059)

<a id="function-function-compilercommand-function-compilercommand-compiler-generated-outexe-librarydir-tools-minigui-ml-1143937361"></a>
### compilerCommand

```ml
function compilerCommand(compiler, generated, outExe, libraryDir)
```

Performs the compilerCommand operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `compiler` | `dynamic` | — | compiler value consumed by this operation. |
| `generated` | `dynamic` | — | generated value consumed by this operation. |
| `outExe` | `dynamic` | — | outExe value consumed by this operation. |
| `libraryDir` | `dynamic` | — | libraryDir value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L2083)

<a id="function-function-componentbyname-function-componentbyname-result-name-tools-minigui-ml-488755799"></a>
### componentByName

```ml
function componentByName(result, name)
```

Performs the componentByName operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — | Result object populated or inspected by the operation. |
| `name` | `dynamic` | — | Name of the affected item. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L876)

- [ComponentEntry](Type-componententry-375624820.md) — struct
<a id="function-function-contains-function-contains-arr-value-tools-minigui-ml-1677896927"></a>
### contains

```ml
function contains(arr, value)
```

Returns whether the supplied data contains contains.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `arr` | `dynamic` | — | arr value consumed by this operation. |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L701)

<a id="function-function-controldefaultheight-function-controldefaultheight-typ-tools-minigui-ml-948488736"></a>
### controlDefaultHeight

```ml
function controlDefaultHeight(typ)
```

Performs the controlDefaultHeight operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `typ` | `dynamic` | — | typ value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1325)

<a id="function-function-controltext-function-controltext-result-path-node-tools-minigui-ml-1407743509"></a>
### controlText

```ml
function controlText(result, path, node)
```

Performs the controlText operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — | Result object populated or inspected by the operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |
| `node` | `dynamic` | — | node value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1443)

<a id="function-function-copynodewithprefix-function-copynodewithprefix-node-prefix-tools-minigui-ml-1311712071"></a>
### copyNodeWithPrefix

```ml
function copyNodeWithPrefix(node, prefix)
```

Performs the copyNodeWithPrefix operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `node` | `dynamic` | — | node value consumed by this operation. |
| `prefix` | `dynamic` | — | prefix value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L980)

<a id="function-function-createcallfor-function-createcallfor-typ-tools-minigui-ml-270679294"></a>
### createCallFor

```ml
function createCallFor(typ)
```

Creates call for for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `typ` | `dynamic` | — | typ value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1571)

<a id="function-function-dimensionprop-function-dimensionprop-result-path-node-name-fallback-tools-minigui-ml-2039256594"></a>
### dimensionProp

```ml
function dimensionProp(result, path, node, name, fallback)
```

Performs the dimensionProp operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — | Result object populated or inspected by the operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |
| `node` | `dynamic` | — | node value consumed by this operation. |
| `name` | `dynamic` | — | Name of the affected item. |
| `fallback` | `dynamic` | — | Value returned when no explicit result is available. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1380)

<a id="function-function-dirname-function-dirname-path-tools-minigui-ml-438074904"></a>
### dirname

```ml
function dirname(path)
```

Performs the dirname operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L580)

- [DocEntry](Type-docentry-423808419.md) — struct
<a id="function-function-ensuredir-function-ensuredir-path-tools-minigui-ml-1685454382"></a>
### ensureDir

```ml
function ensureDir(path)
```

Ensures dir is available to the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L677)

- [EventEntry](Type-evententry-1878163913.md) — struct
<a id="function-function-expandcomponents-function-expandcomponents-result-path-node-tools-minigui-ml-1942712481"></a>
### expandComponents

```ml
function expandComponents(result, path, node)
```

Performs the expandComponents operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — | Result object populated or inspected by the operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |
| `node` | `dynamic` | — | node value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L999)

<a id="function-function-findfunctionarity-function-findfunctionarity-text-name-tools-minigui-ml-296480199"></a>
### findFunctionArity

```ml
function findFunctionArity(text, name)
```

Finds function arity used by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `name` | `dynamic` | — | Name of the affected item. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1233)

<a id="function-function-generatecode-function-generatecode-result-outputpath-tools-minigui-ml-1604091608"></a>
### generateCode

```ml
function generateCode(result, outputPath)
```

Generates code for the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — | Result object populated or inspected by the operation. |
| `outputPath` | `dynamic` | — | Path associated with output. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1960)

<a id="function-function-hasprop-function-hasprop-obj-name-tools-minigui-ml-1849741609"></a>
### hasProp

```ml
function hasProp(obj, name)
```

Returns whether prop is available.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `obj` | `dynamic` | — | obj value consumed by this operation. |
| `name` | `dynamic` | — | Name of the affected item. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L202)

<a id="function-function-hasvalue-function-hasvalue-v-tools-minigui-ml-496209791"></a>
### hasValue

```ml
function hasValue(v)
```

Returns whether value is available.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — | v value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L182)

<a id="function-function-hexval-function-hexval-ch-tools-minigui-ml-1410832352"></a>
### hexVal

```ml
function hexVal(ch)
```

Performs the hexVal operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ch` | `dynamic` | — | ch value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L333)

<a id="function-function-identok-function-identok-value-tools-minigui-ml-187081004"></a>
### identOk

```ml
function identOk(value)
```

Performs the identOk operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L711)

<a id="function-function-idseen-function-idseen-ids-id-tools-minigui-ml-1221354970"></a>
### idSeen

```ml
function idSeen(ids, id)
```

Performs the idSeen operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ids` | `dynamic` | — | ids value consumed by this operation. |
| `id` | `dynamic` | — | Stable identifier of the affected item. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1171)

<a id="function-function-intarrayliteral-function-intarrayliteral-result-path-node-name-tools-minigui-ml-44682596"></a>
### intArrayLiteral

```ml
function intArrayLiteral(result, path, node, name)
```

Performs the intArrayLiteral operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — | Result object populated or inspected by the operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |
| `node` | `dynamic` | — | node value consumed by this operation. |
| `name` | `dynamic` | — | Name of the affected item. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1482)

<a id="function-function-intpart-function-intpart-value-tools-minigui-ml-410095164"></a>
### intPart

```ml
function intPart(value)
```

Performs the intPart operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L230)

<a id="function-function-intprop-function-intprop-result-path-node-name-fallback-tools-minigui-ml-1005362488"></a>
### intProp

```ml
function intProp(result, path, node, name, fallback)
```

Performs the intProp operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — | Result object populated or inspected by the operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |
| `node` | `dynamic` | — | node value consumed by this operation. |
| `name` | `dynamic` | — | Name of the affected item. |
| `fallback` | `dynamic` | — | Value returned when no explicit result is available. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1368)

<a id="function-function-iscontainercontrol-function-iscontainercontrol-typ-tools-minigui-ml-303566540"></a>
### isContainerControl

```ml
function isContainerControl(typ)
```

Returns whether container control satisfies the required condition.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `typ` | `dynamic` | — | typ value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1094)

<a id="function-function-iscontrol-function-iscontrol-typ-tools-minigui-ml-1570622166"></a>
### isControl

```ml
function isControl(typ)
```

Returns whether control satisfies the required condition.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `typ` | `dynamic` | — | typ value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1088)

<a id="function-function-isdigit-function-isdigit-ch-tools-minigui-ml-1465029402"></a>
### isDigit

```ml
function isDigit(ch)
```

Returns whether digit satisfies the required condition.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ch` | `dynamic` | — | ch value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L286)

<a id="function-function-isidentchar-function-isidentchar-ch-tools-minigui-ml-561708104"></a>
### isIdentChar

```ml
function isIdentChar(ch)
```

Returns whether ident char satisfies the required condition.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ch` | `dynamic` | — | ch value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L306)

<a id="function-function-isidentstart-function-isidentstart-ch-tools-minigui-ml-351643384"></a>
### isIdentStart

```ml
function isIdentStart(ch)
```

Returns whether ident start satisfies the required condition.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ch` | `dynamic` | — | ch value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L300)

<a id="function-function-islayout-function-islayout-typ-tools-minigui-ml-1837265796"></a>
### isLayout

```ml
function isLayout(typ)
```

Returns whether layout satisfies the required condition.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `typ` | `dynamic` | — | typ value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1100)

<a id="function-function-isletter-function-isletter-ch-tools-minigui-ml-864298852"></a>
### isLetter

```ml
function isLetter(ch)
```

Returns whether letter satisfies the required condition.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ch` | `dynamic` | — | ch value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L293)

<a id="function-function-isnull-function-isnull-v-tools-minigui-ml-261926343"></a>
### isNull

```ml
function isNull(v)
```

Returns whether null satisfies the required condition.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — | v value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L256)

<a id="function-function-isrooted-function-isrooted-p-tools-minigui-ml-1820017"></a>
### isRooted

```ml
function isRooted(p)
```

Returns whether rooted satisfies the required condition.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L572)

<a id="function-function-isws-function-isws-ch-tools-minigui-ml-954018888"></a>
### isWs

```ml
function isWs(ch)
```

Returns whether ws satisfies the required condition.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ch` | `dynamic` | — | ch value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L312)

<a id="function-function-jarray-function-jarray-items-tools-minigui-ml-1237117185"></a>
### jArray

```ml
function jArray(items)
```

Performs the jArray operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `items` | `dynamic` | — | Items consumed or updated by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L151)

<a id="function-function-jbool-function-jbool-v-tools-minigui-ml-1513999911"></a>
### jBool

```ml
function jBool(v)
```

Performs the jBool operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — | v value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L138)

<a id="function-function-jnull-function-jnull-tools-minigui-ml-2071308925"></a>
### jNull

```ml
function jNull()
```

Performs the jNull operation for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L120)

<a id="function-function-jnumber-function-jnumber-v-tools-minigui-ml-1998167665"></a>
### jNumber

```ml
function jNumber(v)
```

Performs the jNumber operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — | v value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L132)

<a id="function-function-jobject-function-jobject-keys-values-tools-minigui-ml-835191647"></a>
### jObject

```ml
function jObject(keys, values)
```

Performs the jObject operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `keys` | `dynamic` | — | keys value consumed by this operation. |
| `values` | `dynamic` | — | values value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L145)

<a id="function-function-joinpath-function-joinpath-a-b-tools-minigui-ml-1892060280"></a>
### joinPath

```ml
function joinPath(a, b)
```

Joins path for the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | a value consumed by this operation. |
| `b` | `dynamic` | — | b value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L612)

<a id="function-function-jsonparseerror-function-jsonparseerror-message-tools-minigui-ml-1780629814"></a>
### jsonParseError

```ml
function jsonParseError(message)
```

Performs the jsonParseError operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Human-readable message associated with the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L163)

<a id="function-function-jsonparseok-function-jsonparseok-value-tools-minigui-ml-947883754"></a>
### jsonParseOk

```ml
function jsonParseOk(value)
```

Performs the jsonParseOk operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L157)

- [JsonParseResult](Type-jsonparseresult-342564927.md) — struct
<a id="function-function-jsonscalartostring-function-jsonscalartostring-v-tools-minigui-ml-754868791"></a>
### jsonScalarToString

```ml
function jsonScalarToString(v)
```

Performs the jsonScalarToString operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — | v value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L792)

- [JsonValue](Type-jsonvalue-1775147072.md) — struct
<a id="function-function-jstring-function-jstring-v-tools-minigui-ml-633572521"></a>
### jString

```ml
function jString(v)
```

Performs the jString operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — | v value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L126)

<a id="function-function-layoutint-function-layoutint-node-name-fallback-tools-minigui-ml-1807816104"></a>
### layoutInt

```ml
function layoutInt(node, name, fallback)
```

Performs the layoutInt operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `node` | `dynamic` | — | node value consumed by this operation. |
| `name` | `dynamic` | — | Name of the affected item. |
| `fallback` | `dynamic` | — | Value returned when no explicit result is available. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1421)

<a id="function-function-loadgraph-function-loadgraph-result-path-includedirs-stack-tools-minigui-ml-1958220261"></a>
### loadGraph

```ml
function loadGraph(result, path, includeDirs, stack)
```

Loads graph for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — | Result object populated or inspected by the operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |
| `includeDirs` | `dynamic` | — | includeDirs value consumed by this operation. |
| `stack` | `dynamic` | — | stack value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L889)

<a id="function-function-main-function-main-args-tools-minigui-ml-1464915318"></a>
### main

```ml
function main(args)
```

Performs the main operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `args` | `dynamic` | — | Command-line or caller-supplied arguments. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L2105)

<a id="function-function-miniguitypename-function-miniguitypename-ns-tools-minigui-ml-542183962"></a>
### miniGuiTypeName

```ml
function miniGuiTypeName(ns)
```

Performs the miniGuiTypeName operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ns` | `dynamic` | — | ns value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L759)

<a id="function-function-miniident-function-miniident-value-tools-minigui-ml-1758439038"></a>
### miniIdent

```ml
function miniIdent(value)
```

Performs the miniIdent operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L724)

<a id="function-function-mlstring-function-mlstring-value-tools-minigui-ml-1647320920"></a>
### mlString

```ml
function mlString(value)
```

Performs the mlString operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L773)

<a id="function-function-newresult-function-newresult-tools-minigui-ml-831753929"></a>
### newResult

```ml
function newResult()
```

Creates result for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L168)

<a id="function-function-normalizepath-function-normalizepath-p-tools-minigui-ml-264733573"></a>
### normalizePath

```ml
function normalizePath(p)
```

Normalizes path for the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L623)

<a id="function-function-opt-function-opt-opts-name-tools-minigui-ml-1308232944"></a>
### opt

```ml
function opt(opts, name)
```

Performs the opt operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `opts` | `dynamic` | — | opts value consumed by this operation. |
| `name` | `dynamic` | — | Name of the affected item. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L2063)

<a id="function-function-ord-function-ord-ch-tools-minigui-ml-1102161998"></a>
### ord

```ml
function ord(ch)
```

Performs the ord operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ch` | `dynamic` | — | ch value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L279)

<a id="function-function-parsearray-function-parsearray-p-tools-minigui-ml-1331145953"></a>
### parseArray

```ml
function parseArray(p)
```

Parses array for the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L511)

<a id="function-function-parsejson-function-parsejson-text-tools-minigui-ml-1607346182"></a>
### parseJson

```ml
function parseJson(text)
```

Parses json for the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L539)

<a id="function-function-parsejsonstring-function-parsejsonstring-p-tools-minigui-ml-1528965317"></a>
### parseJsonString

```ml
function parseJsonString(p)
```

Parses json string for the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L353)

<a id="function-function-parsenumber-function-parsenumber-p-tools-minigui-ml-1693595001"></a>
### parseNumber

```ml
function parseNumber(p)
```

Parses number for the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L410)

<a id="function-function-parseobject-function-parseobject-p-tools-minigui-ml-1405547285"></a>
### parseObject

```ml
function parseObject(p)
```

Parses object for the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L472)

<a id="function-function-parseoptions-function-parseoptions-args-start-tools-minigui-ml-1906956410"></a>
### parseOptions

```ml
function parseOptions(args, start)
```

Parses options for the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `args` | `dynamic` | — | Command-line or caller-supplied arguments. |
| `start` | `dynamic` | — | start value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L2036)

- [Parser](Type-parser-895089114.md) — struct
<a id="function-function-parsererror-function-parsererror-p-message-tools-minigui-ml-2136624246"></a>
### parserError

```ml
function parserError(p, message)
```

Performs the parserError operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |
| `message` | `dynamic` | — | Human-readable message associated with the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L327)

<a id="function-function-parsevalue-function-parsevalue-p-tools-minigui-ml-1234950661"></a>
### parseValue

```ml
function parseValue(p)
```

Parses value for the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L447)

<a id="function-function-pathslash-function-pathslash-p-tools-minigui-ml-253320005"></a>
### pathSlash

```ml
function pathSlash(p)
```

Performs the pathSlash operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L550)

<a id="function-function-pathunslash-function-pathunslash-p-tools-minigui-ml-1813826991"></a>
### pathUnslash

```ml
function pathUnslash(p)
```

Performs the pathUnslash operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L556)

<a id="function-function-prop-function-prop-obj-name-tools-minigui-ml-1706235939"></a>
### prop

```ml
function prop(obj, name)
```

Performs the prop operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `obj` | `dynamic` | — | obj value consumed by this operation. |
| `name` | `dynamic` | — | Name of the affected item. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L189)

<a id="function-function-q-function-q-s0-tools-minigui-ml-1988593882"></a>
### q

```ml
function q(s0)
```

Performs the q operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `s0` | `dynamic` | — | s0 value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L694)

<a id="function-function-readmson-function-readmson-result-path-tools-minigui-ml-1878109801"></a>
### readMson

```ml
function readMson(result, path)
```

Reads mson for the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — | Result object populated or inspected by the operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L826)

<a id="function-function-relativepath-function-relativepath-fromdir-topath-tools-minigui-ml-163985424"></a>
### relativePath

```ml
function relativePath(fromDir, toPath)
```

Performs the relativePath operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fromDir` | `dynamic` | — | fromDir value consumed by this operation. |
| `toPath` | `dynamic` | — | Path associated with to. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L653)

<a id="function-function-resolvemsonpath-function-resolvemsonpath-importpath-basedir-includedirs-tools-minigui-ml-1322876553"></a>
### resolveMsonPath

```ml
function resolveMsonPath(importPath, baseDir, includeDirs)
```

Resolves mson path for the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `importPath` | `dynamic` | — | Path associated with import. |
| `baseDir` | `dynamic` | — | baseDir value consumed by this operation. |
| `includeDirs` | `dynamic` | — | includeDirs value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L844)

<a id="function-function-resourcevalue-function-resourcevalue-result-path-value-tools-minigui-ml-1226194412"></a>
### resourceValue

```ml
function resourceValue(result, path, value)
```

Performs the resourceValue operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — | Result object populated or inspected by the operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L806)

- [Result](Type-result-1347088452.md) — struct
<a id="function-function-setprop-function-setprop-obj-name-value-tools-minigui-ml-1048961806"></a>
### setProp

```ml
function setProp(obj, name, value)
```

Updates prop maintained by the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `obj` | `dynamic` | — | obj value consumed by this operation. |
| `name` | `dynamic` | — | Name of the affected item. |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L962)

<a id="function-function-skipws-function-skipws-p-tools-minigui-ml-988267521"></a>
### skipWs

```ml
function skipWs(p)
```

Performs the skipWs operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L318)

<a id="function-function-splitpathparts-function-splitpathparts-p-tools-minigui-ml-1541148269"></a>
### splitPathParts

```ml
function splitPathParts(p)
```

Splits path parts for the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L644)

<a id="function-function-stackhas-function-stackhas-stack-path-tools-minigui-ml-22166058"></a>
### stackHas

```ml
function stackHas(stack, path)
```

Performs the stackHas operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stack` | `dynamic` | — | stack value consumed by this operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L865)

<a id="function-function-stackslotwidth-function-stackslotwidth-result-path-node-fallback-tools-minigui-ml-597787999"></a>
### stackSlotWidth

```ml
function stackSlotWidth(result, path, node, fallback)
```

Performs the stackSlotWidth operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — | Result object populated or inspected by the operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |
| `node` | `dynamic` | — | node value consumed by this operation. |
| `fallback` | `dynamic` | — | Value returned when no explicit result is available. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1413)

<a id="function-function-startsat-function-startsat-text-pos-needle-tools-minigui-ml-253439729"></a>
### startsAt

```ml
function startsAt(text, pos, needle)
```

Performs the startsAt operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `pos` | `dynamic` | — | pos value consumed by this operation. |
| `needle` | `dynamic` | — | needle value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L440)

<a id="function-function-stringarrayliteral-function-stringarrayliteral-result-path-node-name-tools-minigui-ml-306204374"></a>
### stringArrayLiteral

```ml
function stringArrayLiteral(result, path, node, name)
```

Performs the stringArrayLiteral operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — | Result object populated or inspected by the operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |
| `node` | `dynamic` | — | node value consumed by this operation. |
| `name` | `dynamic` | — | Name of the affected item. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1466)

<a id="function-function-stringprop-function-stringprop-result-path-node-name-fallback-tools-minigui-ml-160719356"></a>
### stringProp

```ml
function stringProp(result, path, node, name, fallback)
```

Performs the stringProp operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — | Result object populated or inspected by the operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |
| `node` | `dynamic` | — | node value consumed by this operation. |
| `name` | `dynamic` | — | Name of the affected item. |
| `fallback` | `dynamic` | — | Value returned when no explicit result is available. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1455)

<a id="function-function-tablearrayliteral-function-tablearrayliteral-result-path-node-name-tools-minigui-ml-936250814"></a>
### tableArrayLiteral

```ml
function tableArrayLiteral(result, path, node, name)
```

Performs the tableArrayLiteral operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — | Result object populated or inspected by the operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |
| `node` | `dynamic` | — | node value consumed by this operation. |
| `name` | `dynamic` | — | Name of the affected item. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1547)

<a id="function-function-testcontrolproperties-function-testcontrolproperties-result-path-typ-properties-tools-minigui-ml-101126771"></a>
### testControlProperties

```ml
function testControlProperties(result, path, typ, properties)
```

Performs the testControlProperties operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — | Result object populated or inspected by the operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |
| `typ` | `dynamic` | — | typ value consumed by this operation. |
| `properties` | `dynamic` | — | properties value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1109)

<a id="function-function-testlayoutnode-function-testlayoutnode-result-path-node-ids-tools-minigui-ml-783250001"></a>
### testLayoutNode

```ml
function testLayoutNode(result, path, node, ids)
```

Performs the testLayoutNode operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — | Result object populated or inspected by the operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |
| `node` | `dynamic` | — | node value consumed by this operation. |
| `ids` | `dynamic` | — | ids value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1180)

<a id="function-function-testpropertynames-function-testpropertynames-result-path-obj-allowed-context-tools-minigui-ml-1413846259"></a>
### testPropertyNames

```ml
function testPropertyNames(result, path, obj, allowed, context)
```

Performs the testPropertyNames operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — | Result object populated or inspected by the operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |
| `obj` | `dynamic` | — | obj value consumed by this operation. |
| `allowed` | `dynamic` | — | allowed value consumed by this operation. |
| `context` | `dynamic` | — | Context that carries state for the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1034)

<a id="function-function-treearrayliteral-function-treearrayliteral-result-path-node-name-tools-minigui-ml-113288346"></a>
### treeArrayLiteral

```ml
function treeArrayLiteral(result, path, node, name)
```

Performs the treeArrayLiteral operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — | Result object populated or inspected by the operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |
| `node` | `dynamic` | — | node value consumed by this operation. |
| `name` | `dynamic` | — | Name of the affected item. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1530)

<a id="function-function-trimdotslash-function-trimdotslash-p-tools-minigui-ml-1643536593"></a>
### trimDotSlash

```ml
function trimDotSlash(p)
```

Performs the trimDotSlash operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L562)

<a id="function-function-upperfirst-function-upperfirst-s0-tools-minigui-ml-509576888"></a>
### upperFirst

```ml
function upperFirst(s0)
```

Performs the upperFirst operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `s0` | `dynamic` | — | s0 value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L744)

<a id="function-function-usage-function-usage-tools-minigui-ml-654463161"></a>
### usage

```ml
function usage()
```

Performs the usage operation for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L2071)

<a id="function-function-validatemson-function-validatemson-path-includedirs-codebehindoverride-tools-minigui-ml-115174509"></a>
### validateMson

```ml
function validateMson(path, includeDirs, codeBehindOverride)
```

Validates mson for the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |
| `includeDirs` | `dynamic` | — | includeDirs value consumed by this operation. |
| `codeBehindOverride` | `dynamic` | — | codeBehindOverride value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1249)

- [WindowEntry](Type-windowentry-778171323.md) — struct
<a id="function-function-writevalidation-function-writevalidation-result-tools-minigui-ml-1716886486"></a>
### writeValidation

```ml
function writeValidation(result)
```

Writes validation for the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — | Result object populated or inspected by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L2093)
