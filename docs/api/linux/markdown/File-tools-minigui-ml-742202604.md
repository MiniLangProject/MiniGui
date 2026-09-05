# `tools/minigui.ml`

[Home](README.md) · [Files](Files.md)

Provides minigui facilities for this project.

Package: [`(global)`](Package-global-1952375359.md)

Reachable from entry: **yes**

## Imports

- `std/ds/list.ml` as `list` → `../MiniLangCompilerML/std/ds/list.ml` — external dependency
- `std/fs.ml` as `fs` → `../MiniLangCompilerML/std/fs.ml` — external dependency
- `std/process.ml` as `process` → `../MiniLangCompilerML/std/process.ml` — external dependency
- `std/string.ml` as `str` → `../MiniLangCompilerML/std/string.ml` — external dependency
- `std/string_builder.ml` as `sb` → `../MiniLangCompilerML/std/string_builder.ml` — external dependency

## Declarations

<a id="extern_function-extern-function-execvp-extern-function-execvp-file-as-cstr-argv-as-bytes-from-libc-so-6-symbol-execvp-returns-int-tools-minigui-ml-313808942"></a>
### _execvp

```ml
extern function _execvp(file as cstr, argv as bytes) from "libc.so.6" symbol "execvp" returns int
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `cstr` | — |  |
| `argv` | `bytes` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L37)

<a id="extern_function-extern-function-exit-extern-function-exit-code-as-int-from-libc-so-6-symbol-exit-returns-void-tools-minigui-ml-717165082"></a>
### _exit

```ml
extern function _exit(code as int) from "libc.so.6" symbol "_exit" returns void
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `code` | `int` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L41)

<a id="extern_function-extern-function-fork-extern-function-fork-from-libc-so-6-symbol-fork-returns-int-tools-minigui-ml-964086408"></a>
### _fork

```ml
extern function _fork() from "libc.so.6" symbol "fork" returns int
```


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L35)

<a id="extern_function-extern-function-mkdir-extern-function-mkdir-path-as-cstr-mode-as-int-from-libc-so-6-symbol-mkdir-returns-int-tools-minigui-ml-183261564"></a>
### _mkdir

```ml
extern function _mkdir(path as cstr, mode as int) from "libc.so.6" symbol "mkdir" returns int
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `cstr` | — |  |
| `mode` | `int` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L33)

<a id="extern_function-extern-function-waitpid-extern-function-waitpid-pid-as-int-status-as-bytes-options-as-int-from-libc-so-6-symbol-waitpid-returns-int-tools-minigui-ml-607712894"></a>
### _waitpid

```ml
extern function _waitpid(pid as int, status as bytes, options as int) from "libc.so.6" symbol "waitpid" returns int
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pid` | `int` | — |  |
| `status` | `bytes` | — |  |
| `options` | `int` | — |  |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L39)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L224)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L2069)

<a id="function-function-allowedcontrolevents-function-allowedcontrolevents-typ-tools-minigui-ml-649350264"></a>
### allowedControlEvents

```ml
function allowedControlEvents(typ)
```

Performs the allowedControlEvents operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `typ` | `dynamic` | — | typ value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1458)

<a id="function-function-allowedcontrolprops-function-allowedcontrolprops-typ-tools-minigui-ml-1407366198"></a>
### allowedControlProps

```ml
function allowedControlProps(typ)
```

Performs the allowedControlProps operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `typ` | `dynamic` | — | typ value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1479)

<a id="function-function-arritems-function-arritems-v-tools-minigui-ml-1899234739"></a>
### arrItems

```ml
function arrItems(v)
```

Performs the arrItems operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — | v value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L312)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L298)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L271)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L263)

<a id="function-function-basenamenoext-function-basenamenoext-path-tools-minigui-ml-1247929144"></a>
### basenameNoExt

```ml
function basenameNoExt(path)
```

Performs the basenameNoExt operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L750)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1876)

<a id="function-function-charat-inline-function-charat-text-i-tools-minigui-ml-1061914298"></a>
### charAt

```ml
inline function charAt(text, i)
```

Performs the charAt operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `i` | `dynamic` | — | i value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L321)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1837)

<a id="function-function-clonejson-function-clonejson-v-tools-minigui-ml-1085644649"></a>
### cloneJson

```ml
function cloneJson(v)
```

Performs the cloneJson operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — | v value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1347)

<a id="function-function-codepointutf8-function-codepointutf8-cp-tools-minigui-ml-1085701668"></a>
### codePointUtf8

```ml
function codePointUtf8(cp)
```

Encodes one Unicode scalar value as a UTF-8 string.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cp` | `dynamic` | — | Unicode scalar value to encode. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L394)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1943)

<a id="function-function-commoncontrolprops-function-commoncontrolprops-tools-minigui-ml-437269975"></a>
### commonControlProps

```ml
function commonControlProps()
```

Performs the commonControlProps operation for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1473)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1272)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1062)

<a id="function-function-controldefaultheight-function-controldefaultheight-typ-tools-minigui-ml-948488736"></a>
### controlDefaultHeight

```ml
function controlDefaultHeight(typ)
```

Performs the controlDefaultHeight operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `typ` | `dynamic` | — | typ value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1766)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1886)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1391)

<a id="function-function-createcallfor-function-createcallfor-typ-tools-minigui-ml-270679294"></a>
### createCallFor

```ml
function createCallFor(typ)
```

Creates call for for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `typ` | `dynamic` | — | typ value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L2014)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1823)

<a id="function-function-dirname-function-dirname-path-tools-minigui-ml-438074904"></a>
### dirname

```ml
function dirname(path)
```

Performs the dirname operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L724)

- [DocEntry](Type-docentry-423808419.md) — struct
<a id="function-function-documentloaded-function-documentloaded-result-path-tools-minigui-ml-1222007481"></a>
### documentLoaded

```ml
function documentLoaded(result, path)
```

Returns whether a normalized MSON path has already been loaded.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — | Result object whose document graph is inspected. |
| `path` | `dynamic` | — | Normalized path to find. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1257)

<a id="function-function-ensuredir-function-ensuredir-path-tools-minigui-ml-1685454382"></a>
### ensureDir

```ml
function ensureDir(path)
```

Ensures dir is available to the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L885)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1410)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1668)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L2430)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L250)

<a id="function-function-hasvalue-function-hasvalue-v-tools-minigui-ml-496209791"></a>
### hasValue

```ml
function hasValue(v)
```

Returns whether value is available.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — | v value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L230)

<a id="function-function-hexval-function-hexval-ch-tools-minigui-ml-1410832352"></a>
### hexVal

```ml
function hexVal(ch)
```

Performs the hexVal operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ch` | `dynamic` | — | ch value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L384)

<a id="constant-constant-host-compiler-const-host-compiler-minilangcompilerpy-mlc-win64-py-tools-minigui-ml-329731861"></a>
### HOST_COMPILER

```ml
const HOST_COMPILER = "../MiniLangCompilerPy/mlc_win64.py"
```

Default compiler for a Linux host.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L53)

<a id="constant-constant-host-target-const-host-target-linux-x64-tools-minigui-ml-118300793"></a>
### HOST_TARGET

```ml
const HOST_TARGET = "linux-x64"
```

Maximum accepted MSON document size in UTF-8 bytes (16 MiB).


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L51)

<a id="function-function-identok-function-identok-value-tools-minigui-ml-187081004"></a>
### identOk

```ml
function identOk(value)
```

Performs the identOk operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1083)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1606)

<a id="constant-constant-infinite-const-infinite-4294967295-tools-minigui-ml-1216919397"></a>
### INFINITE

```ml
const INFINITE = 4294967295
```

Infinite timeout value used while waiting for the compiler process.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L61)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1925)

<a id="function-function-intpart-function-intpart-value-tools-minigui-ml-410095164"></a>
### intPart

```ml
function intPart(value)
```

Performs the intPart operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L278)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1811)

<a id="function-function-iscontainercontrol-function-iscontainercontrol-typ-tools-minigui-ml-303566540"></a>
### isContainerControl

```ml
function isContainerControl(typ)
```

Returns whether container control satisfies the required condition.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `typ` | `dynamic` | — | typ value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1515)

<a id="function-function-iscontrol-function-iscontrol-typ-tools-minigui-ml-1570622166"></a>
### isControl

```ml
function isControl(typ)
```

Returns whether control satisfies the required condition.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `typ` | `dynamic` | — | typ value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1508)

<a id="function-function-isdigit-inline-function-isdigit-ch-tools-minigui-ml-2042969611"></a>
### isDigit

```ml
inline function isDigit(ch)
```

Returns whether digit satisfies the required condition.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ch` | `dynamic` | — | ch value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L335)

<a id="function-function-isidentchar-inline-function-isidentchar-ch-tools-minigui-ml-191393507"></a>
### isIdentChar

```ml
inline function isIdentChar(ch)
```

Returns whether ident char satisfies the required condition.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ch` | `dynamic` | — | ch value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L355)

<a id="function-function-isidentstart-inline-function-isidentstart-ch-tools-minigui-ml-1729391301"></a>
### isIdentStart

```ml
inline function isIdentStart(ch)
```

Returns whether ident start satisfies the required condition.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ch` | `dynamic` | — | ch value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L349)

<a id="function-function-islayout-function-islayout-typ-tools-minigui-ml-1837265796"></a>
### isLayout

```ml
function isLayout(typ)
```

Returns whether layout satisfies the required condition.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `typ` | `dynamic` | — | typ value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1521)

<a id="function-function-isletter-inline-function-isletter-ch-tools-minigui-ml-1421752045"></a>
### isLetter

```ml
inline function isLetter(ch)
```

Returns whether letter satisfies the required condition.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ch` | `dynamic` | — | ch value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L342)

<a id="function-function-isnull-function-isnull-v-tools-minigui-ml-261926343"></a>
### isNull

```ml
function isNull(v)
```

Returns whether null satisfies the required condition.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — | v value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L305)

<a id="function-function-isrooted-function-isrooted-p-tools-minigui-ml-1820017"></a>
### isRooted

```ml
function isRooted(p)
```

Returns whether rooted satisfies the required condition.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L711)

<a id="function-function-isws-inline-function-isws-ch-tools-minigui-ml-1721750953"></a>
### isWs

```ml
inline function isWs(ch)
```

Returns whether ws satisfies the required condition.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ch` | `dynamic` | — | ch value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L361)

<a id="function-function-jarray-function-jarray-items-tools-minigui-ml-1237117185"></a>
### jArray

```ml
function jArray(items)
```

Performs the jArray operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `items` | `dynamic` | — | Items consumed or updated by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L199)

<a id="function-function-jbool-function-jbool-v-tools-minigui-ml-1513999911"></a>
### jBool

```ml
function jBool(v)
```

Performs the jBool operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — | v value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L186)

<a id="function-function-jnull-function-jnull-tools-minigui-ml-2071308925"></a>
### jNull

```ml
function jNull()
```

Performs the jNull operation for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L168)

<a id="function-function-jnumber-function-jnumber-v-tools-minigui-ml-1998167665"></a>
### jNumber

```ml
function jNumber(v)
```

Performs the jNumber operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — | v value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L180)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L193)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L781)

<a id="function-function-jsonparseerror-function-jsonparseerror-message-tools-minigui-ml-1780629814"></a>
### jsonParseError

```ml
function jsonParseError(message)
```

Performs the jsonParseError operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Human-readable message associated with the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L211)

<a id="function-function-jsonparseok-function-jsonparseok-value-tools-minigui-ml-947883754"></a>
### jsonParseOk

```ml
function jsonParseOk(value)
```

Performs the jsonParseOk operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L205)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1169)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L174)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1864)

<a id="function-function-listcontains-function-listcontains-values-value-tools-minigui-ml-1809151114"></a>
### listContains

```ml
function listContains(values, value)
```

Returns whether a growable list contains the supplied value.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Growable list to inspect. |
| `value` | `dynamic` | — | Value to find. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1073)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1285)

<a id="function-function-main-function-main-args-tools-minigui-ml-1464915318"></a>
### main

```ml
function main(args)
```

Performs the main operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `args` | `dynamic` | — | Command-line or caller-supplied arguments. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L2602)

<a id="constant-constant-max-mson-bytes-const-max-mson-bytes-16777216-tools-minigui-ml-1688875265"></a>
### MAX_MSON_BYTES

```ml
const MAX_MSON_BYTES = 16777216
```


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L55)

<a id="constant-constant-max-mson-depth-const-max-mson-depth-128-tools-minigui-ml-728260393"></a>
### MAX_MSON_DEPTH

```ml
const MAX_MSON_DEPTH = 128
```

Maximum JSON container nesting accepted by the MSON parser.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L57)

<a id="constant-constant-max-mson-documents-const-max-mson-documents-4096-tools-minigui-ml-1697145171"></a>
### MAX_MSON_DOCUMENTS

```ml
const MAX_MSON_DOCUMENTS = 4096
```

Maximum number of distinct files in one MSON import graph.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L59)

<a id="constant-constant-max-windows-path-chars-const-max-windows-path-chars-32768-tools-minigui-ml-113210618"></a>
### MAX_WINDOWS_PATH_CHARS

```ml
const MAX_WINDOWS_PATH_CHARS = 32768
```

Maximum UTF-16 path capacity used for executable resolution.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L63)

<a id="function-function-miniguitypename-function-miniguitypename-ns-tools-minigui-ml-542183962"></a>
### miniGuiTypeName

```ml
function miniGuiTypeName(ns)
```

Performs the miniGuiTypeName operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ns` | `dynamic` | — | ns value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1133)

<a id="function-function-miniident-function-miniident-value-tools-minigui-ml-1758439038"></a>
### miniIdent

```ml
function miniIdent(value)
```

Performs the miniIdent operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1097)

<a id="function-function-mlstring-function-mlstring-value-tools-minigui-ml-1647320920"></a>
### mlString

```ml
function mlString(value)
```

Performs the mlString operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1148)

<a id="function-function-newresult-function-newresult-tools-minigui-ml-831753929"></a>
### newResult

```ml
function newResult()
```

Creates result for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L216)

<a id="function-function-normalizepath-function-normalizepath-p-tools-minigui-ml-264733573"></a>
### normalizePath

```ml
function normalizePath(p)
```

Normalizes path for the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L799)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L2547)

<a id="function-function-ord-inline-function-ord-ch-tools-minigui-ml-2135024287"></a>
### ord

```ml
inline function ord(ch)
```

Performs the ord operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ch` | `dynamic` | — | ch value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L328)

<a id="function-function-parsearray-function-parsearray-p-depth-tools-minigui-ml-1285011962"></a>
### parseArray

```ml
function parseArray(p, depth)
```

Parses array for the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Parser state consumed by this operation. |
| `depth` | `dynamic` | — | Current JSON container nesting depth. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L636)

<a id="function-function-parsejson-function-parsejson-text-tools-minigui-ml-1607346182"></a>
### parseJson

```ml
function parseJson(text)
```

Parses json for the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L664)

<a id="function-function-parsejsonstring-function-parsejsonstring-p-tools-minigui-ml-1528965317"></a>
### parseJsonString

```ml
function parseJsonString(p)
```

Parses json string for the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L405)

<a id="function-function-parsenumber-function-parsenumber-p-tools-minigui-ml-1693595001"></a>
### parseNumber

```ml
function parseNumber(p)
```

Parses number for the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L494)

<a id="function-function-parseobject-function-parseobject-p-depth-tools-minigui-ml-900807734"></a>
### parseObject

```ml
function parseObject(p, depth)
```

Parses object for the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Parser state consumed by this operation. |
| `depth` | `dynamic` | — | Current JSON container nesting depth. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L592)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L2514)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L376)

<a id="function-function-parsevalue-function-parsevalue-p-depth-tools-minigui-ml-1072134"></a>
### parseValue

```ml
function parseValue(p, depth)
```

Parses value for the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Parser state consumed by this operation. |
| `depth` | `dynamic` | — | Current JSON container nesting depth. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L560)

<a id="function-function-pathslash-function-pathslash-p-tools-minigui-ml-253320005"></a>
### pathSlash

```ml
function pathSlash(p)
```

Performs the pathSlash operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L677)

<a id="function-function-pathunslash-function-pathunslash-p-tools-minigui-ml-1813826991"></a>
### pathUnslash

```ml
function pathUnslash(p)
```

Performs the pathUnslash operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L687)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L237)

<a id="function-function-quoteprocessargument-function-quoteprocessargument-value-tools-minigui-ml-1320489556"></a>
### quoteProcessArgument

```ml
function quoteProcessArgument(value)
```

Quotes one argument according to the Windows CRT command-line rules. CreateProcessW receives a command-line string, so quotes and the backslashes preceding them must be encoded exactly.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument value to quote. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L912)

<a id="function-function-readhandle-inline-function-readhandle-data-offset-tools-minigui-ml-1826800037"></a>
### readHandle

```ml
inline function readHandle(data, offset)
```

Reads a native 64-bit handle from a PROCESS_INFORMATION buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Byte buffer to inspect. |
| `offset` | `dynamic` | — | Zero-based byte offset. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L954)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1203)

<a id="function-function-readu32-inline-function-readu32-data-offset-tools-minigui-ml-1298041247"></a>
### readU32

```ml
inline function readU32(data, offset)
```

Reads an unsigned little-endian 32-bit value.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Byte buffer to inspect. |
| `offset` | `dynamic` | — | Zero-based byte offset. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L947)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L861)

<a id="function-function-resolveexecutable-function-resolveexecutable-name-tools-minigui-ml-1443494832"></a>
### resolveExecutable

```ml
function resolveExecutable(name)
```

Resolves a named executable without invoking a command shell.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Executable name, including its extension. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1017)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1221)

<a id="function-function-resolvepythoninterpreter-function-resolvepythoninterpreter-tools-minigui-ml-1673945279"></a>
### resolvePythonInterpreter

```ml
function resolvePythonInterpreter()
```

Resolves the preferred Python interpreter for the Python MiniLang compiler.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1041)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1183)

- [Result](Type-result-1347088452.md) — struct
<a id="function-function-runcompiler-function-runcompiler-compiler-generated-outexe-librarydir-target-tools-minigui-ml-929809828"></a>
### runCompiler

```ml
function runCompiler(compiler, generated, outExe, libraryDir, target)
```

Runs the selected MiniLang compiler without involving a command shell.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `compiler` | `dynamic` | — | compiler value consumed by this operation. |
| `generated` | `dynamic` | — | generated value consumed by this operation. |
| `outExe` | `dynamic` | — | outExe value consumed by this operation. |
| `libraryDir` | `dynamic` | — | libraryDir value consumed by this operation. |
| `target` | `dynamic` | — | Target executable platform, windows-x64 or linux-x64. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L2568)

<a id="function-function-runprocess-function-runprocess-executable-args-tools-minigui-ml-483406938"></a>
### runProcess

```ml
function runProcess(executable, args)
```

Runs a child process directly and returns its exit code.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `executable` | `dynamic` | — | Executable passed to CreateProcessW. |
| `args` | `dynamic` | — | Exact argv values supplied to the child process. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L965)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1373)

<a id="function-function-skipws-function-skipws-p-tools-minigui-ml-988267521"></a>
### skipWs

```ml
function skipWs(p)
```

Performs the skipWs operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L367)

<a id="function-function-splitpathparts-function-splitpathparts-p-tools-minigui-ml-1541148269"></a>
### splitPathParts

```ml
function splitPathParts(p)
```

Splits path parts for the minigui workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L848)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1242)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1856)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L552)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1909)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1898)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1990)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1530)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1615)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1445)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1973)

<a id="function-function-trimdotslash-function-trimdotslash-p-tools-minigui-ml-1643536593"></a>
### trimDotSlash

```ml
function trimDotSlash(p)
```

Performs the trimDotSlash operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L693)

<a id="function-function-upperfirst-function-upperfirst-s0-tools-minigui-ml-509576888"></a>
### upperFirst

```ml
function upperFirst(s0)
```

Performs the upperFirst operation for the minigui module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `s0` | `dynamic` | — | s0 value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1118)

<a id="function-function-usage-function-usage-tools-minigui-ml-654463161"></a>
### usage

```ml
function usage()
```

Performs the usage operation for the minigui module.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L2555)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L1684)

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


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/tools/minigui.ml#L2590)
