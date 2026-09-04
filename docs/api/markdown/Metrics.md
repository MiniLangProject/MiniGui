# Metrics

[Home](README.md)

Static metrics are calculated from target-specific preprocessed MiniLang files inside the configured source roots. External imported modules, generated documentation, and excluded paths are not measured.

## Project summary

| Metric | Value |
| --- | ---: |
| Blank lines | 390 |
| Clone groups | 36 |
| Cognitive complexity | 2736 (maximum per function: 260) |
| Comment lines | 2057 |
| Cyclomatic complexity | 2017 (average: 5.91, maximum: 126) |
| Documentation coverage | 100% (1989 of 1989 documentation items) |
| Duplicated lines | 288 (5.44%) |
| Files | 2 |
| Functions | 341 |
| Maintainability index | 0 / 100 |
| Physical lines | 7739 |
| Source lines | 5292 |
| Statements | 4385 |

## Documentation coverage

Coverage is split by documentation contract so strong API summaries cannot hide undocumented parameters or data members.

| Category | Documented | Total | Coverage |
| --- | ---: | ---: | ---: |
| API declarations | 449 | 449 | 100% |
| Constants | 198 | 198 | 100% |
| Enum variants | 0 | 0 | 100% |
| Fields | 93 | 93 | 100% |
| Globals | 32 | 32 | 100% |
| Overall | 1989 | 1989 | 100% |
| Parameters | 1217 | 1217 | 100% |

## Halstead metrics

| Distinct operators | Distinct operands | Total operators | Total operands | Vocabulary | Length | Volume | Difficulty | Effort | Estimated defects |
| ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| 48 | 1945 | 27280 | 20505 | 1993 | 47785 | 523758.24 | 253.02 | 132520259.71 | 174.59 |

## Files

| File | SLOC | Functions | Cyclomatic total / avg / max | Cognitive total / max | Duplication | Halstead volume | MI |
| --- | ---: | ---: | --- | --- | --- | ---: | ---: |
| [`MiniGuiLib/minigui.ml`](File-miniguilib-minigui-ml-1319721044.md) | 3619 | 240 | 1254 / 5.23 / 84 | 1648 / 179 | 276 (7.63%) | 313140.41 | 0 |
| [`tools/minigui.ml`](File-tools-minigui-ml-742202604.md) | 1673 | 101 | 763 / 7.55 / 126 | 1088 / 260 | 12 (0.72%) | 172476.56 | 0 |

## Functions

| Function | Location | LOC | Statements | Cyclomatic | Cognitive | Max nesting | Halstead volume | MI |
| --- | --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| [`addError`](File-tools-minigui-ml-742202604.md#function-function-adderror-function-adderror-result-path-message-tools-minigui-ml-2077416824) | `tools/minigui.ml:176` | 3 | 1 | 1 | 0 | 0 | 104 | 75.33 |
| [`addGeneratedNode`](File-tools-minigui-ml-742202604.md#function-function-addgeneratednode-function-addgeneratednode-lines-fields-result-path-node-parentvar-parenttype-x-y-width-height-tools-minigui-ml-525139880) | `tools/minigui.ml:1625` | 331 | 324 | 126 | 260 | 6 | 40058.9 | 0 |
| [`allowedControlEvents`](File-tools-minigui-ml-742202604.md#function-function-allowedcontrolevents-function-allowedcontrolevents-typ-tools-minigui-ml-649350264) | `tools/minigui.ml:1047` | 10 | 14 | 8 | 7 | 1 | 1310.28 | 55.28 |
| [`allowedControlProps`](File-tools-minigui-ml-742202604.md#function-function-allowedcontrolprops-function-allowedcontrolprops-typ-tools-minigui-ml-1407366198) | `tools/minigui.ml:1065` | 20 | 35 | 19 | 18 | 1 | 2746.29 | 44.99 |
| [`appendCodeUnitUtf8`](File-tools-minigui-ml-742202604.md#function-function-appendcodeunitutf8-function-appendcodeunitutf8-outbytes-cp-tools-minigui-ml-1513962659) | `tools/minigui.ml:344` | 6 | 7 | 4 | 3 | 1 | 470.73 | 63.77 |
| [`arrItems`](File-tools-minigui-ml-742202604.md#function-function-arritems-function-arritems-v-tools-minigui-ml-1899234739) | `tools/minigui.ml:263` | 5 | 5 | 4 | 3 | 1 | 169.92 | 68.6 |
| [`asBool`](File-tools-minigui-ml-742202604.md#function-function-asbool-function-asbool-v-fallback-tools-minigui-ml-1812786413) | `tools/minigui.ml:249` | 4 | 3 | 3 | 2 | 1 | 120.93 | 71.88 |
| [`asInt`](File-tools-minigui-ml-742202604.md#function-function-asint-function-asint-v-fallback-tools-minigui-ml-416818299) | `tools/minigui.ml:223` | 4 | 3 | 3 | 2 | 1 | 120.93 | 71.88 |
| [`asString`](File-tools-minigui-ml-742202604.md#function-function-asstring-function-asstring-v-fallback-tools-minigui-ml-75689085) | `tools/minigui.ml:215` | 4 | 3 | 3 | 2 | 1 | 120.93 | 71.88 |
| [`basenameNoExt`](File-tools-minigui-ml-742202604.md#function-function-basenamenoext-function-basenamenoext-path-tools-minigui-ml-1247929144) | `tools/minigui.ml:593` | 15 | 15 | 7 | 8 | 2 | 625.76 | 53.82 |
| [`boolProp`](File-tools-minigui-ml-742202604.md#function-function-boolprop-function-boolprop-result-path-node-name-fallback-tools-minigui-ml-812731956) | `tools/minigui.ml:1433` | 5 | 4 | 2 | 1 | 1 | 229.25 | 67.96 |
| [`charAt`](File-tools-minigui-ml-742202604.md#function-function-charat-function-charat-text-i-tools-minigui-ml-1819774295) | `tools/minigui.ml:272` | 4 | 3 | 3 | 2 | 1 | 127.44 | 71.72 |
| [`clampDimension`](File-tools-minigui-ml-742202604.md#function-function-clampdimension-function-clampdimension-result-path-node-axis-value-tools-minigui-ml-1785762353) | `tools/minigui.ml:1394` | 13 | 12 | 6 | 5 | 1 | 474.17 | 56.16 |
| [`cloneJson`](File-tools-minigui-ml-742202604.md#function-function-clonejson-function-clonejson-v-tools-minigui-ml-1085644649) | `tools/minigui.ml:936` | 21 | 13 | 7 | 12 | 3 | 850.16 | 49.7 |
| [`collectTreeItemLiterals`](File-tools-minigui-ml-742202604.md#function-function-collecttreeitemliterals-function-collecttreeitemliterals-result-path-parts-item-level-tools-minigui-ml-990768546) | `tools/minigui.ml:1500` | 24 | 20 | 9 | 10 | 2 | 1144.25 | 47.27 |
| [`commonControlProps`](File-tools-minigui-ml-742202604.md#function-function-commoncontrolprops-function-commoncontrolprops-tools-minigui-ml-437269975) | `tools/minigui.ml:1059` | 3 | 1 | 1 | 0 | 0 | 385.74 | 71.35 |
| [`compilerCommand`](File-tools-minigui-ml-742202604.md#function-function-compilercommand-function-compilercommand-compiler-generated-outexe-librarydir-tools-minigui-ml-1143937361) | `tools/minigui.ml:2083` | 7 | 4 | 3 | 2 | 1 | 347.11 | 63.37 |
| [`componentByName`](File-tools-minigui-ml-742202604.md#function-function-componentbyname-function-componentbyname-result-name-tools-minigui-ml-488755799) | `tools/minigui.ml:876` | 7 | 6 | 4 | 4 | 2 | 283.28 | 63.86 |
| [`contains`](File-tools-minigui-ml-742202604.md#function-function-contains-function-contains-arr-value-tools-minigui-ml-1677896927) | `tools/minigui.ml:701` | 7 | 6 | 4 | 4 | 2 | 220.08 | 64.62 |
| [`controlDefaultHeight`](File-tools-minigui-ml-742202604.md#function-function-controldefaultheight-function-controldefaultheight-typ-tools-minigui-ml-948488736) | `tools/minigui.ml:1325` | 36 | 67 | 40 | 39 | 1 | 1964.88 | 37.61 |
| [`controlText`](File-tools-minigui-ml-742202604.md#function-function-controltext-function-controltext-result-path-node-tools-minigui-ml-1407743509) | `tools/minigui.ml:1443` | 5 | 4 | 2 | 1 | 1 | 210.91 | 68.21 |
| [`copyNodeWithPrefix`](File-tools-minigui-ml-742202604.md#function-function-copynodewithprefix-function-copynodewithprefix-node-prefix-tools-minigui-ml-1311712071) | `tools/minigui.ml:980` | 14 | 11 | 4 | 4 | 2 | 634.25 | 54.84 |
| [`createCallFor`](File-tools-minigui-ml-742202604.md#function-function-createcallfor-function-createcallfor-typ-tools-minigui-ml-270679294) | `tools/minigui.ml:1571` | 41 | 77 | 40 | 39 | 1 | 2298.89 | 35.9 |
| [`dimensionProp`](File-tools-minigui-ml-742202604.md#function-function-dimensionprop-function-dimensionprop-result-path-node-name-fallback-tools-minigui-ml-2039256594) | `tools/minigui.ml:1380` | 7 | 8 | 6 | 5 | 1 | 408.07 | 62.48 |
| [`dirname`](File-tools-minigui-ml-742202604.md#function-function-dirname-function-dirname-path-tools-minigui-ml-438074904) | `tools/minigui.ml:580` | 10 | 10 | 5 | 5 | 2 | 353.3 | 59.67 |
| [`ensureDir`](File-tools-minigui-ml-742202604.md#function-function-ensuredir-function-ensuredir-path-tools-minigui-ml-1685454382) | `tools/minigui.ml:677` | 14 | 14 | 6 | 10 | 3 | 484.48 | 55.39 |
| [`expandComponents`](File-tools-minigui-ml-742202604.md#function-function-expandcomponents-function-expandcomponents-result-path-node-tools-minigui-ml-1942712481) | `tools/minigui.ml:999` | 28 | 21 | 6 | 8 | 2 | 1178.89 | 46.12 |
| [`findFunctionArity`](File-tools-minigui-ml-742202604.md#function-function-findfunctionarity-function-findfunctionarity-text-name-tools-minigui-ml-296480199) | `tools/minigui.ml:1233` | 11 | 12 | 4 | 3 | 1 | 553.96 | 57.54 |
| [`generateCode`](File-tools-minigui-ml-742202604.md#function-function-generatecode-function-generatecode-result-outputpath-tools-minigui-ml-1604091608) | `tools/minigui.ml:1960` | 72 | 70 | 28 | 43 | 2 | 7779.06 | 28.47 |
| [`hasProp`](File-tools-minigui-ml-742202604.md#function-function-hasprop-function-hasprop-obj-name-tools-minigui-ml-1849741609) | `tools/minigui.ml:202` | 9 | 10 | 6 | 6 | 2 | 377.83 | 60.33 |
| [`hasValue`](File-tools-minigui-ml-742202604.md#function-function-hasvalue-function-hasvalue-v-tools-minigui-ml-496209791) | `tools/minigui.ml:182` | 3 | 1 | 1 | 0 | 0 | 66.61 | 76.69 |
| [`hexVal`](File-tools-minigui-ml-742202604.md#function-function-hexval-function-hexval-ch-tools-minigui-ml-1410832352) | `tools/minigui.ml:333` | 7 | 8 | 7 | 6 | 1 | 301.85 | 63.26 |
| [`identOk`](File-tools-minigui-ml-742202604.md#function-function-identok-function-identok-value-tools-minigui-ml-187081004) | `tools/minigui.ml:711` | 10 | 11 | 7 | 7 | 2 | 417.79 | 58.89 |
| [`idSeen`](File-tools-minigui-ml-742202604.md#function-function-idseen-function-idseen-ids-id-tools-minigui-ml-1221354970) | `tools/minigui.ml:1171` | 3 | 1 | 1 | 0 | 0 | 53.15 | 77.38 |
| [`intArrayLiteral`](File-tools-minigui-ml-742202604.md#function-function-intarrayliteral-function-intarrayliteral-result-path-node-name-tools-minigui-ml-44682596) | `tools/minigui.ml:1482` | 11 | 11 | 5 | 5 | 2 | 686.48 | 56.75 |
| [`intPart`](File-tools-minigui-ml-742202604.md#function-function-intpart-function-intpart-value-tools-minigui-ml-410095164) | `tools/minigui.ml:230` | 15 | 14 | 7 | 9 | 3 | 466.76 | 54.71 |
| [`intProp`](File-tools-minigui-ml-742202604.md#function-function-intprop-function-intprop-result-path-node-name-fallback-tools-minigui-ml-1005362488) | `tools/minigui.ml:1368` | 5 | 4 | 2 | 1 | 1 | 229.25 | 67.96 |
| [`isContainerControl`](File-tools-minigui-ml-742202604.md#function-function-iscontainercontrol-function-iscontainercontrol-typ-tools-minigui-ml-303566540) | `tools/minigui.ml:1094` | 3 | 1 | 1 | 0 | 0 | 85.95 | 75.91 |
| [`isControl`](File-tools-minigui-ml-742202604.md#function-function-iscontrol-function-iscontrol-typ-tools-minigui-ml-1570622166) | `tools/minigui.ml:1088` | 3 | 1 | 1 | 0 | 0 | 533.21 | 70.36 |
| [`isDigit`](File-tools-minigui-ml-742202604.md#function-function-isdigit-function-isdigit-ch-tools-minigui-ml-1465029402) | `tools/minigui.ml:286` | 4 | 2 | 1 | 0 | 0 | 82.04 | 73.33 |
| [`isIdentChar`](File-tools-minigui-ml-742202604.md#function-function-isidentchar-function-isidentchar-ch-tools-minigui-ml-561708104) | `tools/minigui.ml:306` | 3 | 1 | 1 | 0 | 0 | 75.28 | 76.32 |
| [`isIdentStart`](File-tools-minigui-ml-742202604.md#function-function-isidentstart-function-isidentstart-ch-tools-minigui-ml-351643384) | `tools/minigui.ml:300` | 3 | 1 | 1 | 0 | 0 | 55.35 | 77.25 |
| [`isLayout`](File-tools-minigui-ml-742202604.md#function-function-islayout-function-islayout-typ-tools-minigui-ml-1837265796) | `tools/minigui.ml:1100` | 3 | 1 | 1 | 0 | 0 | 106.27 | 75.27 |
| [`isLetter`](File-tools-minigui-ml-742202604.md#function-function-isletter-function-isletter-ch-tools-minigui-ml-864298852) | `tools/minigui.ml:293` | 4 | 2 | 1 | 0 | 0 | 137.61 | 71.76 |
| [`isNull`](File-tools-minigui-ml-742202604.md#function-function-isnull-function-isnull-v-tools-minigui-ml-261926343) | `tools/minigui.ml:256` | 4 | 3 | 2 | 1 | 1 | 100 | 72.59 |
| [`isRooted`](File-tools-minigui-ml-742202604.md#function-function-isrooted-function-isrooted-p-tools-minigui-ml-1820017) | `tools/minigui.ml:572` | 5 | 5 | 4 | 3 | 1 | 195.04 | 68.18 |
| [`isWs`](File-tools-minigui-ml-742202604.md#function-function-isws-function-isws-ch-tools-minigui-ml-954018888) | `tools/minigui.ml:312` | 3 | 1 | 1 | 0 | 0 | 85.11 | 75.94 |
| [`jArray`](File-tools-minigui-ml-742202604.md#function-function-jarray-function-jarray-items-tools-minigui-ml-1237117185) | `tools/minigui.ml:151` | 3 | 1 | 1 | 0 | 0 | 101.58 | 75.41 |
| [`jBool`](File-tools-minigui-ml-742202604.md#function-function-jbool-function-jbool-v-tools-minigui-ml-1513999911) | `tools/minigui.ml:138` | 3 | 1 | 1 | 0 | 0 | 102.8 | 75.37 |
| [`jNull`](File-tools-minigui-ml-742202604.md#function-function-jnull-function-jnull-tools-minigui-ml-2071308925) | `tools/minigui.ml:120` | 3 | 1 | 1 | 0 | 0 | 98.99 | 75.48 |
| [`jNumber`](File-tools-minigui-ml-742202604.md#function-function-jnumber-function-jnumber-v-tools-minigui-ml-1998167665) | `tools/minigui.ml:132` | 3 | 1 | 1 | 0 | 0 | 102.8 | 75.37 |
| [`jObject`](File-tools-minigui-ml-742202604.md#function-function-jobject-function-jobject-keys-values-tools-minigui-ml-835191647) | `tools/minigui.ml:145` | 3 | 1 | 1 | 0 | 0 | 108 | 75.22 |
| [`joinPath`](File-tools-minigui-ml-742202604.md#function-function-joinpath-function-joinpath-a-b-tools-minigui-ml-1892060280) | `tools/minigui.ml:612` | 8 | 10 | 6 | 5 | 1 | 385.14 | 61.39 |
| [`jsonParseError`](File-tools-minigui-ml-742202604.md#function-function-jsonparseerror-function-jsonparseerror-message-tools-minigui-ml-1780629814) | `tools/minigui.ml:163` | 3 | 1 | 1 | 0 | 0 | 62.27 | 76.89 |
| [`jsonParseOk`](File-tools-minigui-ml-742202604.md#function-function-jsonparseok-function-jsonparseok-value-tools-minigui-ml-947883754) | `tools/minigui.ml:157` | 3 | 1 | 1 | 0 | 0 | 55.35 | 77.25 |
| [`jsonScalarToString`](File-tools-minigui-ml-742202604.md#function-function-jsonscalartostring-function-jsonscalartostring-v-tools-minigui-ml-754868791) | `tools/minigui.ml:792` | 9 | 9 | 5 | 5 | 2 | 254.19 | 61.67 |
| [`jString`](File-tools-minigui-ml-742202604.md#function-function-jstring-function-jstring-v-tools-minigui-ml-633572521) | `tools/minigui.ml:126` | 3 | 1 | 1 | 0 | 0 | 102.8 | 75.37 |
| [`layoutInt`](File-tools-minigui-ml-742202604.md#function-function-layoutint-function-layoutint-node-name-fallback-tools-minigui-ml-1807816104) | `tools/minigui.ml:1421` | 5 | 4 | 2 | 1 | 1 | 171.3 | 68.84 |
| [`loadGraph`](File-tools-minigui-ml-742202604.md#function-function-loadgraph-function-loadgraph-result-path-includedirs-stack-tools-minigui-ml-1958220261) | `tools/minigui.ml:889` | 44 | 34 | 15 | 24 | 3 | 2605.68 | 38.21 |
| [`main`](File-tools-minigui-ml-742202604.md#function-function-main-function-main-args-tools-minigui-ml-1464915318) | `tools/minigui.ml:2105` | 36 | 44 | 16 | 16 | 2 | 2024.28 | 40.75 |
| [`MiniGuiLib.minigui._appForWindow`](File-miniguilib-minigui-ml-1319721044.md#function-function-miniguilib-minigui-appforwindow-function-appforwindow-hwnd-miniguilib-minigui-ml-312916629) | `MiniGuiLib/minigui.ml:977` | 5 | 4 | 2 | 1 | 1 | 120.93 | 69.9 |
| [`MiniGuiLib.minigui._asciiUtf16Z`](File-miniguilib-minigui-ml-1319721044.md#function-function-miniguilib-minigui-asciiutf16z-function-asciiutf16z-text-miniguilib-minigui-ml-2035685259) | `MiniGuiLib/minigui.ml:853` | 10 | 6 | 3 | 3 | 2 | 328.09 | 60.17 |
| [`MiniGuiLib.minigui._asInt`](File-miniguilib-minigui-ml-1319721044.md#function-function-miniguilib-minigui-asint-function-asint-value-miniguilib-minigui-ml-914144197) | `MiniGuiLib/minigui.ml:821` | 15 | 14 | 7 | 9 | 3 | 466.76 | 54.71 |
| [`MiniGuiLib.minigui._defaultWndProc`](File-miniguilib-minigui-ml-1319721044.md#function-function-miniguilib-minigui-defaultwndproc-function-defaultwndproc-hwnd-msg-wparam-lparam-miniguilib-minigui-ml-1389447181) | `MiniGuiLib/minigui.ml:957` | 17 | 12 | 6 | 11 | 4 | 549.84 | 53.16 |
| [`MiniGuiLib.minigui._dialogInputCancel`](File-miniguilib-minigui-ml-1319721044.md#function-function-miniguilib-minigui-dialoginputcancel-function-dialoginputcancel-context-event-miniguilib-minigui-ml-1040675573) | `MiniGuiLib/minigui.ml:1457` | 6 | 6 | 4 | 3 | 1 | 256.76 | 65.62 |
| [`MiniGuiLib.minigui._dialogInputOk`](File-miniguilib-minigui-ml-1319721044.md#function-function-miniguilib-minigui-dialoginputok-function-dialoginputok-context-event-miniguilib-minigui-ml-1619618437) | `MiniGuiLib/minigui.ml:1446` | 7 | 8 | 5 | 4 | 1 | 379.78 | 62.83 |
| [`MiniGuiLib.minigui._ensureTimerProc`](File-miniguilib-minigui-ml-1319721044.md#function-function-miniguilib-minigui-ensuretimerproc-function-ensuretimerproc-miniguilib-minigui-ml-1995107690) | `MiniGuiLib/minigui.ml:1265` | 7 | 4 | 2 | 1 | 1 | 102.19 | 67.23 |
| [`MiniGuiLib.minigui._ensureWindowProc`](File-miniguilib-minigui-ml-1319721044.md#function-function-miniguilib-minigui-ensurewindowproc-function-ensurewindowproc-miniguilib-minigui-ml-383853280) | `MiniGuiLib/minigui.ml:1243` | 7 | 4 | 2 | 1 | 1 | 102.19 | 67.23 |
| [`MiniGuiLib.minigui._getWindowText`](File-miniguilib-minigui-ml-1319721044.md#function-function-miniguilib-minigui-getwindowtext-function-getwindowtext-hwnd-miniguilib-minigui-ml-93845995) | `MiniGuiLib/minigui.ml:941` | 10 | 11 | 4 | 3 | 1 | 360.55 | 59.74 |
| [`MiniGuiLib.minigui._installSpecificWindowProc`](File-miniguilib-minigui-ml-1319721044.md#function-function-miniguilib-minigui-installspecificwindowproc-function-installspecificwindowproc-hwnd-cb-miniguilib-minigui-ml-541071260) | `MiniGuiLib/minigui.ml:1283` | 23 | 17 | 8 | 14 | 4 | 584.2 | 49.85 |
| [`MiniGuiLib.minigui._installWindowProc`](File-miniguilib-minigui-ml-1319721044.md#function-function-miniguilib-minigui-installwindowproc-function-installwindowproc-hwnd-miniguilib-minigui-ml-485678411) | `MiniGuiLib/minigui.ml:1275` | 4 | 2 | 1 | 0 | 0 | 68.11 | 73.9 |
| [`MiniGuiLib.minigui._itemCount`](File-miniguilib-minigui-ml-1319721044.md#function-function-miniguilib-minigui-itemcount-function-itemcount-itemstext-miniguilib-minigui-ml-2060651443) | `MiniGuiLib/minigui.ml:896` | 8 | 7 | 4 | 4 | 2 | 224.66 | 63.3 |
| [`MiniGuiLib.minigui._itemTextAt`](File-miniguilib-minigui-ml-1319721044.md#function-function-miniguilib-minigui-itemtextat-function-itemtextat-itemstext-index-miniguilib-minigui-ml-1618130501) | `MiniGuiLib/minigui.ml:875` | 18 | 14 | 6 | 11 | 4 | 417.09 | 53.46 |
| [`MiniGuiLib.minigui._joinText`](File-miniguilib-minigui-ml-1319721044.md#function-function-miniguilib-minigui-jointext-function-jointext-items-separator-miniguilib-minigui-ml-190570311) | `MiniGuiLib/minigui.ml:840` | 10 | 7 | 4 | 6 | 3 | 264.7 | 60.68 |
| [`MiniGuiLib.minigui._miniGuiTimerProc`](File-miniguilib-minigui-ml-1319721044.md#function-function-miniguilib-minigui-miniguitimerproc-function-miniguitimerproc-hwnd-msg-wparam-lparam-miniguilib-minigui-ml-1503461647) | `MiniGuiLib/minigui.ml:1256` | 7 | 4 | 2 | 1 | 1 | 144.75 | 66.17 |
| [`MiniGuiLib.minigui._miniGuiWndProc`](File-miniguilib-minigui-ml-1319721044.md#function-function-miniguilib-minigui-miniguiwndproc-function-miniguiwndproc-hwnd-msg-wparam-lparam-miniguilib-minigui-ml-1946609607) | `MiniGuiLib/minigui.ml:988` | 206 | 188 | 84 | 179 | 4 | 10402.92 | 10.1 |
| [`MiniGuiLib.minigui._normalizeEditText`](File-miniguilib-minigui-ml-1319721044.md#function-function-miniguilib-minigui-normalizeedittext-function-normalizeedittext-text-miniguilib-minigui-ml-236366703) | `MiniGuiLib/minigui.ml:924` | 14 | 9 | 4 | 4 | 2 | 292.3 | 57.19 |
| [`MiniGuiLib.minigui._ord`](File-miniguilib-minigui-ml-1319721044.md#function-function-miniguilib-minigui-ord-function-ord-text-miniguilib-minigui-ml-278787935) | `MiniGuiLib/minigui.ml:866` | 5 | 4 | 2 | 1 | 1 | 122.62 | 69.86 |
| [`MiniGuiLib.minigui._readI32LE`](File-miniguilib-minigui-ml-1319721044.md#function-function-miniguilib-minigui-readi32le-function-readi32le-buf-off-miniguilib-minigui-ml-2045462736) | `MiniGuiLib/minigui.ml:796` | 4 | 2 | 1 | 0 | 0 | 222.97 | 70.29 |
| [`MiniGuiLib.minigui._readPtrLE`](File-miniguilib-minigui-ml-1319721044.md#function-function-miniguilib-minigui-readptrle-function-readptrle-buf-off-miniguilib-minigui-ml-427115280) | `MiniGuiLib/minigui.ml:813` | 5 | 3 | 1 | 0 | 0 | 475.97 | 65.87 |
| [`MiniGuiLib.minigui._readS32LE`](File-miniguilib-minigui-ml-1319721044.md#function-function-miniguilib-minigui-reads32le-function-reads32le-buf-off-miniguilib-minigui-ml-726353032) | `MiniGuiLib/minigui.ml:804` | 5 | 4 | 2 | 1 | 1 | 125.1 | 69.8 |
| [`MiniGuiLib.minigui._registerWindowClass`](File-miniguilib-minigui-ml-1319721044.md#function-function-miniguilib-minigui-registerwindowclass-function-registerwindowclass-miniguilib-minigui-ml-1678610130) | `MiniGuiLib/minigui.ml:1211` | 26 | 26 | 6 | 5 | 1 | 982.03 | 47.38 |
| [`MiniGuiLib.minigui._textContains`](File-miniguilib-minigui-ml-1319721044.md#function-function-miniguilib-minigui-textcontains-function-textcontains-text-needle-miniguilib-minigui-ml-1177242440) | `MiniGuiLib/minigui.ml:908` | 13 | 13 | 7 | 10 | 3 | 470.65 | 56.04 |
| [`MiniGuiLib.minigui._writePtrLE`](File-miniguilib-minigui-ml-1319721044.md#function-function-miniguilib-minigui-writeptrle-function-writeptrle-buf-off-value-miniguilib-minigui-ml-1693362189) | `MiniGuiLib/minigui.ml:781` | 11 | 9 | 1 | 0 | 0 | 589.55 | 57.75 |
| [`MiniGuiLib.minigui._writeU32LE`](File-miniguilib-minigui-ml-1319721044.md#function-function-miniguilib-minigui-writeu32le-function-writeu32le-buf-off-value-miniguilib-minigui-ml-454316369) | `MiniGuiLib/minigui.ml:769` | 7 | 5 | 1 | 0 | 0 | 284.98 | 64.24 |
| [`MiniGuiLib.minigui.Application.addControl`](Type-miniguilib-minigui-application-1605122988.md#static_method-static-method-miniguilib-minigui-application-addcontrol-static-function-addcontrol-app-control-miniguilib-minigui-ml-676200652) | `MiniGuiLib/minigui.ml:1487` | 14 | 8 | 5 | 9 | 3 | 412.93 | 56.01 |
| [`MiniGuiLib.minigui.Application.addWindow`](Type-miniguilib-minigui-application-1605122988.md#static_method-static-method-miniguilib-minigui-application-addwindow-static-function-addwindow-app-window-miniguilib-minigui-ml-351853637) | `MiniGuiLib/minigui.ml:1474` | 9 | 6 | 2 | 1 | 1 | 189.99 | 62.96 |
| [`MiniGuiLib.minigui.Application.create`](Type-miniguilib-minigui-application-1605122988.md#static_method-static-method-miniguilib-minigui-application-create-static-function-create-miniguilib-minigui-ml-1950541448) | `MiniGuiLib/minigui.ml:1467` | 3 | 1 | 1 | 0 | 0 | 186.56 | 73.56 |
| [`MiniGuiLib.minigui.Application.pollResize`](Type-miniguilib-minigui-application-1605122988.md#static_method-static-method-miniguilib-minigui-application-pollresize-static-function-pollresize-app-miniguilib-minigui-ml-1063046351) | `MiniGuiLib/minigui.ml:1614` | 24 | 19 | 11 | 20 | 5 | 986.18 | 47.45 |
| [`MiniGuiLib.minigui.Application.redrawAll`](Type-miniguilib-minigui-application-1605122988.md#static_method-static-method-miniguilib-minigui-application-redrawall-static-function-redrawall-app-miniguilib-minigui-ml-2027861673) | `MiniGuiLib/minigui.ml:1656` | 24 | 15 | 10 | 21 | 4 | 878.12 | 47.94 |
| [`MiniGuiLib.minigui.Application.resizeWindow`](Type-miniguilib-minigui-application-1605122988.md#static_method-static-method-miniguilib-minigui-application-resizewindow-static-function-resizewindow-app-window-clientwidth-clientheight-miniguilib-minigui-ml-857300068) | `MiniGuiLib/minigui.ml:1533` | 78 | 74 | 25 | 64 | 5 | 3701.53 | 30.38 |
| [`MiniGuiLib.minigui.Application.run`](Type-miniguilib-minigui-application-1605122988.md#static_method-static-method-miniguilib-minigui-application-run-static-function-run-app-miniguilib-minigui-ml-1153699829) | `MiniGuiLib/minigui.ml:1683` | 22 | 20 | 7 | 7 | 2 | 670.56 | 49.98 |
| [`MiniGuiLib.minigui.Application.setStartupWindow`](Type-miniguilib-minigui-application-1605122988.md#static_method-static-method-miniguilib-minigui-application-setstartupwindow-static-function-setstartupwindow-app-window-miniguilib-minigui-ml-848416671) | `MiniGuiLib/minigui.ml:1505` | 4 | 2 | 1 | 0 | 0 | 62.91 | 74.14 |
| [`MiniGuiLib.minigui.Application.syncDynamicControls`](Type-miniguilib-minigui-application-1605122988.md#static_method-static-method-miniguilib-minigui-application-syncdynamiccontrols-static-function-syncdynamiccontrols-app-miniguilib-minigui-ml-2002184905) | `MiniGuiLib/minigui.ml:1641` | 12 | 12 | 7 | 11 | 3 | 507.8 | 56.57 |
| [`MiniGuiLib.minigui.Application.timerProc`](Type-miniguilib-minigui-application-1605122988.md#static_method-static-method-miniguilib-minigui-application-timerproc-static-function-timerproc-hwnd-msg-wparam-lparam-miniguilib-minigui-ml-710608009) | `MiniGuiLib/minigui.ml:1524` | 3 | 1 | 1 | 0 | 0 | 92.51 | 75.69 |
| [`MiniGuiLib.minigui.Application.windowProc`](Type-miniguilib-minigui-application-1605122988.md#static_method-static-method-miniguilib-minigui-application-windowproc-static-function-windowproc-hwnd-msg-wparam-lparam-miniguilib-minigui-ml-1793497217) | `MiniGuiLib/minigui.ml:1515` | 3 | 1 | 1 | 0 | 0 | 92.51 | 75.69 |
| [`MiniGuiLib.minigui.Button.create`](Type-miniguilib-minigui-button-1520404438.md#static_method-static-method-miniguilib-minigui-button-create-static-function-create-app-parent-id-text-x-y-width-height-miniguilib-minigui-ml-424913389) | `MiniGuiLib/minigui.ml:2253` | 8 | 7 | 2 | 1 | 1 | 856.15 | 59.5 |
| [`MiniGuiLib.minigui.Calendar.create`](Type-miniguilib-minigui-calendar-1740464088.md#static_method-static-method-miniguilib-minigui-calendar-create-static-function-create-app-parent-id-text-x-y-width-height-miniguilib-minigui-ml-210128403) | `MiniGuiLib/minigui.ml:3190` | 9 | 8 | 2 | 1 | 1 | 877.63 | 58.31 |
| [`MiniGuiLib.minigui.CheckBox.create`](Type-miniguilib-minigui-checkbox-903069219.md#static_method-static-method-miniguilib-minigui-checkbox-create-static-function-create-app-parent-id-text-x-y-width-height-checked-miniguilib-minigui-ml-1111622991) | `MiniGuiLib/minigui.ml:2503` | 9 | 9 | 3 | 2 | 1 | 970.74 | 57.86 |
| [`MiniGuiLib.minigui.ColorPicker.create`](Type-miniguilib-minigui-colorpicker-360522475.md#static_method-static-method-miniguilib-minigui-colorpicker-create-static-function-create-app-parent-id-text-x-y-width-height-title-value-miniguilib-minigui-ml-1393313529) | `MiniGuiLib/minigui.ml:2347` | 10 | 10 | 3 | 2 | 1 | 1008.11 | 56.75 |
| [`MiniGuiLib.minigui.ComboBox.create`](Type-miniguilib-minigui-combobox-2072734281.md#static_method-static-method-miniguilib-minigui-combobox-create-static-function-create-app-parent-id-text-x-y-width-height-items-selectedindex-miniguilib-minigui-ml-632201435) | `MiniGuiLib/minigui.ml:3214` | 12 | 12 | 3 | 2 | 1 | 1160.75 | 54.6 |
| [`MiniGuiLib.minigui.ContextMenu.create`](Type-miniguilib-minigui-contextmenu-115441878.md#static_method-static-method-miniguilib-minigui-contextmenu-create-static-function-create-app-parent-id-text-x-y-width-height-items-miniguilib-minigui-ml-1557013991) | `MiniGuiLib/minigui.ml:2945` | 12 | 8 | 3 | 3 | 2 | 887.12 | 55.41 |
| [`MiniGuiLib.minigui.Control._ensureStyle`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-ensurestyle-static-function-ensurestyle-control-miniguilib-minigui-ml-1452081222) | `MiniGuiLib/minigui.ml:3400` | 15 | 16 | 4 | 3 | 1 | 475.6 | 55.06 |
| [`MiniGuiLib.minigui.Control._layoutIndex`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-layoutindex-static-function-layoutindex-control-miniguilib-minigui-ml-431670752) | `MiniGuiLib/minigui.ml:3514` | 11 | 10 | 6 | 8 | 3 | 346.13 | 58.7 |
| [`MiniGuiLib.minigui.Control._styleIndex`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-styleindex-static-function-styleindex-handle-miniguilib-minigui-ml-1376711337) | `MiniGuiLib/minigui.ml:3388` | 9 | 6 | 4 | 6 | 3 | 220.08 | 62.24 |
| [`MiniGuiLib.minigui.Control.addItem`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-additem-static-function-additem-control-text-miniguilib-minigui-ml-436639455) | `MiniGuiLib/minigui.ml:3855` | 9 | 13 | 9 | 8 | 1 | 646.11 | 58.3 |
| [`MiniGuiLib.minigui.Control.addListViewItem`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-addlistviewitem-static-function-addlistviewitem-control-text-miniguilib-minigui-ml-850893091) | `MiniGuiLib/minigui.ml:4160` | 27 | 23 | 3 | 3 | 2 | 1258.58 | 46.67 |
| [`MiniGuiLib.minigui.Control.addTreeViewItem`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-addtreeviewitem-static-function-addtreeviewitem-control-text-miniguilib-minigui-ml-1256155943) | `MiniGuiLib/minigui.ml:4191` | 3 | 1 | 1 | 0 | 0 | 79.95 | 76.13 |
| [`MiniGuiLib.minigui.Control.addTreeViewItemWithParent`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-addtreeviewitemwithparent-static-function-addtreeviewitemwithparent-control-text-parentitem-miniguilib-minigui-ml-1530336686) | `MiniGuiLib/minigui.ml:4199` | 10 | 8 | 1 | 0 | 0 | 440 | 59.54 |
| [`MiniGuiLib.minigui.Control.applyCtlColor`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-applyctlcolor-static-function-applyctlcolor-app-hwndcontrol-hdc-miniguilib-minigui-ml-437784875) | `MiniGuiLib/minigui.ml:3466` | 16 | 16 | 5 | 5 | 2 | 454 | 54.46 |
| [`MiniGuiLib.minigui.Control.applyEffectiveVisible`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-applyeffectivevisible-static-function-applyeffectivevisible-control-parentvisible-miniguilib-minigui-ml-1222593000) | `MiniGuiLib/minigui.ml:4441` | 8 | 7 | 5 | 4 | 1 | 254.19 | 62.79 |
| [`MiniGuiLib.minigui.Control.clampLayoutHeight`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-clamplayoutheight-static-function-clamplayoutheight-control-height-miniguilib-minigui-ml-1721389203) | `MiniGuiLib/minigui.ml:3604` | 8 | 9 | 6 | 5 | 1 | 361.37 | 61.58 |
| [`MiniGuiLib.minigui.Control.clampLayoutWidth`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-clamplayoutwidth-static-function-clamplayoutwidth-control-width-miniguilib-minigui-ml-1140285708) | `MiniGuiLib/minigui.ml:3592` | 8 | 9 | 6 | 5 | 1 | 361.37 | 61.58 |
| [`MiniGuiLib.minigui.Control.clearItems`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-clearitems-static-function-clearitems-control-miniguilib-minigui-ml-1975727740) | `MiniGuiLib/minigui.ml:3826` | 25 | 21 | 9 | 8 | 1 | 823.09 | 47.88 |
| [`MiniGuiLib.minigui.Control.ensureListViewColumn`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-ensurelistviewcolumn-static-function-ensurelistviewcolumn-control-miniguilib-minigui-ml-1308262488) | `MiniGuiLib/minigui.ml:3867` | 15 | 16 | 5 | 4 | 1 | 733.21 | 53.61 |
| [`MiniGuiLib.minigui.Control.findById`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-findbyid-static-function-findbyid-app-id-miniguilib-minigui-ml-895897225) | `MiniGuiLib/minigui.ml:3710` | 12 | 9 | 6 | 11 | 4 | 372.92 | 57.65 |
| [`MiniGuiLib.minigui.Control.getCellText`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-getcelltext-static-function-getcelltext-control-row-column-miniguilib-minigui-ml-1566890508) | `MiniGuiLib/minigui.ml:4150` | 6 | 7 | 6 | 5 | 1 | 325.48 | 64.63 |
| [`MiniGuiLib.minigui.Control.getItemTextAtClick`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-getitemtextatclick-static-function-getitemtextatclick-control-x-miniguilib-minigui-ml-779022928) | `MiniGuiLib/minigui.ml:4270` | 15 | 16 | 6 | 6 | 2 | 509.05 | 54.59 |
| [`MiniGuiLib.minigui.Control.getListViewSelectedText`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-getlistviewselectedtext-static-function-getlistviewselectedtext-control-miniguilib-minigui-ml-1817752062) | `MiniGuiLib/minigui.ml:4308` | 7 | 8 | 5 | 4 | 1 | 271.03 | 63.86 |
| [`MiniGuiLib.minigui.Control.getScrollValue`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-getscrollvalue-static-function-getscrollvalue-control-miniguilib-minigui-ml-533761282) | `MiniGuiLib/minigui.ml:4694` | 13 | 13 | 5 | 4 | 1 | 451.89 | 56.44 |
| [`MiniGuiLib.minigui.Control.getSelectedIndex`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-getselectedindex-static-function-getselectedindex-control-miniguilib-minigui-ml-1755985608) | `MiniGuiLib/minigui.ml:4333` | 9 | 13 | 9 | 8 | 1 | 620 | 58.42 |
| [`MiniGuiLib.minigui.Control.getSelectedText`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-getselectedtext-static-function-getselectedtext-control-miniguilib-minigui-ml-240685330) | `MiniGuiLib/minigui.ml:4544` | 21 | 22 | 9 | 8 | 1 | 864.67 | 49.38 |
| [`MiniGuiLib.minigui.Control.getText`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-gettext-static-function-gettext-control-miniguilib-minigui-ml-2101156482) | `MiniGuiLib/minigui.ml:3302` | 24 | 22 | 7 | 7 | 2 | 862.57 | 48.39 |
| [`MiniGuiLib.minigui.Control.getTreeViewSelectedText`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-gettreeviewselectedtext-static-function-gettreeviewselectedtext-control-miniguilib-minigui-ml-749673418) | `MiniGuiLib/minigui.ml:4288` | 17 | 20 | 6 | 5 | 1 | 808 | 51.99 |
| [`MiniGuiLib.minigui.Control.getValue`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-getvalue-static-function-getvalue-control-miniguilib-minigui-ml-1058234584) | `MiniGuiLib/minigui.ml:4620` | 8 | 7 | 5 | 4 | 1 | 287.92 | 62.41 |
| [`MiniGuiLib.minigui.Control.isChecked`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-ischecked-static-function-ischecked-control-miniguilib-minigui-ml-1875340054) | `MiniGuiLib/minigui.ml:3806` | 5 | 5 | 3 | 2 | 1 | 188.87 | 68.41 |
| [`MiniGuiLib.minigui.Control.isDescendantOf`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-isdescendantof-static-function-isdescendantof-app-control-ancestor-miniguilib-minigui-ml-245233164) | `MiniGuiLib/minigui.ml:4454` | 24 | 24 | 12 | 23 | 5 | 862.78 | 47.72 |
| [`MiniGuiLib.minigui.Control.isEditable`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-iseditable-static-function-iseditable-control-miniguilib-minigui-ml-535417514) | `MiniGuiLib/minigui.ml:3965` | 5 | 5 | 3 | 2 | 1 | 146.95 | 69.17 |
| [`MiniGuiLib.minigui.Control.layoutBounds`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-layoutbounds-static-function-layoutbounds-control-parentwidth-parentheight-baseparentwidth-baseparentheight-miniguilib-minigui-ml-309432276) | `MiniGuiLib/minigui.ml:3619` | 36 | 34 | 13 | 16 | 2 | 1786.26 | 41.53 |
| [`MiniGuiLib.minigui.Control.layoutValue`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-layoutvalue-static-function-layoutvalue-control-slot-fallback-miniguilib-minigui-ml-2126653304) | `MiniGuiLib/minigui.ml:3571` | 17 | 22 | 8 | 7 | 1 | 594.54 | 52.66 |
| [`MiniGuiLib.minigui.Control.listViewCellRect`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-listviewcellrect-static-function-listviewcellrect-control-row-column-miniguilib-minigui-ml-152938186) | `MiniGuiLib/minigui.ml:4018` | 21 | 23 | 8 | 8 | 2 | 1220.04 | 48.47 |
| [`MiniGuiLib.minigui.Control.listViewColumnAtX`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-listviewcolumnatx-static-function-listviewcolumnatx-control-x-miniguilib-minigui-ml-1427391538) | `MiniGuiLib/minigui.ml:3983` | 10 | 12 | 5 | 4 | 1 | 394.2 | 59.34 |
| [`MiniGuiLib.minigui.Control.listViewColumnCount`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-listviewcolumncount-static-function-listviewcolumncount-control-miniguilib-minigui-ml-1955153002) | `MiniGuiLib/minigui.ml:3973` | 6 | 6 | 3 | 2 | 1 | 171.3 | 66.98 |
| [`MiniGuiLib.minigui.Control.listViewFieldAt`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-listviewfieldat-static-function-listviewfieldat-text-index-miniguilib-minigui-ml-1921914030) | `MiniGuiLib/minigui.ml:4055` | 18 | 14 | 6 | 11 | 4 | 426.06 | 53.4 |
| [`MiniGuiLib.minigui.Control.listViewFieldCount`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-listviewfieldcount-static-function-listviewfieldcount-text-miniguilib-minigui-ml-234010618) | `MiniGuiLib/minigui.ml:4042` | 9 | 6 | 4 | 6 | 3 | 236.84 | 62.02 |
| [`MiniGuiLib.minigui.Control.listViewHitTest`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-listviewhittest-static-function-listviewhittest-control-x-y-miniguilib-minigui-ml-2059228595) | `MiniGuiLib/minigui.ml:3998` | 15 | 19 | 8 | 7 | 1 | 950.05 | 52.42 |
| [`MiniGuiLib.minigui.Control.moveCurrent`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-movecurrent-static-function-movecurrent-control-x-y-width-height-miniguilib-minigui-ml-169934756) | `MiniGuiLib/minigui.ml:3677` | 29 | 26 | 10 | 10 | 2 | 1158.78 | 45.3 |
| [`MiniGuiLib.minigui.Control.replaceListViewField`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-replacelistviewfield-static-function-replacelistviewfield-text-index-value-miniguilib-minigui-ml-798417899) | `MiniGuiLib/minigui.ml:4078` | 13 | 9 | 4 | 4 | 2 | 417.17 | 56.82 |
| [`MiniGuiLib.minigui.Control.replaceListViewRowText`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-replacelistviewrowtext-static-function-replacelistviewrowtext-text-row-rowtext-miniguilib-minigui-ml-836175971) | `MiniGuiLib/minigui.ml:4096` | 13 | 9 | 4 | 4 | 2 | 390 | 57.02 |
| [`MiniGuiLib.minigui.Control.resizeSplitterTargets`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-resizesplittertargets-static-function-resizesplittertargets-app-splitter-oldx-oldy-newx-newy-miniguilib-minigui-ml-2100430649) | `MiniGuiLib/minigui.ml:3753` | 32 | 38 | 13 | 14 | 2 | 1695.75 | 42.81 |
| [`MiniGuiLib.minigui.Control.scrollViewerTo`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-scrollviewerto-static-function-scrollviewerto-app-scrollviewer-value-miniguilib-minigui-ml-1667990916) | `MiniGuiLib/minigui.ml:4515` | 26 | 23 | 13 | 18 | 4 | 1271.57 | 45.65 |
| [`MiniGuiLib.minigui.Control.setBackground`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-setbackground-static-function-setbackground-control-color-miniguilib-minigui-ml-1836358903) | `MiniGuiLib/minigui.ml:3431` | 11 | 10 | 2 | 1 | 1 | 375.08 | 58.99 |
| [`MiniGuiLib.minigui.Control.setBorder`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-setborder-static-function-setborder-control-color-width-miniguilib-minigui-ml-887880001) | `MiniGuiLib/minigui.ml:3447` | 4 | 3 | 2 | 1 | 1 | 104.25 | 72.47 |
| [`MiniGuiLib.minigui.Control.setBounds`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-setbounds-static-function-setbounds-control-x-y-width-height-miniguilib-minigui-ml-1835310032) | `MiniGuiLib/minigui.ml:3662` | 8 | 7 | 2 | 1 | 1 | 282.03 | 62.87 |
| [`MiniGuiLib.minigui.Control.setCellText`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-setcelltext-static-function-setcelltext-control-row-column-value-miniguilib-minigui-ml-1778153831) | `MiniGuiLib/minigui.ml:4136` | 9 | 10 | 6 | 5 | 1 | 529.1 | 59.31 |
| [`MiniGuiLib.minigui.Control.setChecked`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-setchecked-static-function-setchecked-control-checked-miniguilib-minigui-ml-1737039223) | `MiniGuiLib/minigui.ml:3815` | 8 | 9 | 4 | 3 | 1 | 252.17 | 62.95 |
| [`MiniGuiLib.minigui.Control.setColumnWidth`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-setcolumnwidth-static-function-setcolumnwidth-control-index-width-miniguilib-minigui-ml-793988642) | `MiniGuiLib/minigui.ml:3930` | 9 | 12 | 7 | 6 | 1 | 402.36 | 60.01 |
| [`MiniGuiLib.minigui.Control.setColumnWidths`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-setcolumnwidths-static-function-setcolumnwidths-control-widths-miniguilib-minigui-ml-128633677) | `MiniGuiLib/minigui.ml:3943` | 8 | 7 | 4 | 3 | 1 | 289.51 | 62.53 |
| [`MiniGuiLib.minigui.Control.setEditable`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-seteditable-static-function-seteditable-control-editable-miniguilib-minigui-ml-1111949810) | `MiniGuiLib/minigui.ml:3955` | 7 | 8 | 4 | 3 | 1 | 215.49 | 64.69 |
| [`MiniGuiLib.minigui.Control.setEnabled`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-setenabled-static-function-setenabled-control-enabled-miniguilib-minigui-ml-140519927) | `MiniGuiLib/minigui.ml:3330` | 6 | 6 | 3 | 2 | 1 | 186.91 | 66.72 |
| [`MiniGuiLib.minigui.Control.setFont`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-setfont-static-function-setfont-control-family-size-weight-miniguilib-minigui-ml-1721283901) | `MiniGuiLib/minigui.ml:3457` | 4 | 3 | 2 | 1 | 1 | 104.25 | 72.47 |
| [`MiniGuiLib.minigui.Control.setForeground`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-setforeground-static-function-setforeground-control-color-miniguilib-minigui-ml-1020013207) | `MiniGuiLib/minigui.ml:3419` | 8 | 7 | 2 | 1 | 1 | 295.07 | 62.74 |
| [`MiniGuiLib.minigui.Control.setItems`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-setitems-static-function-setitems-control-items-miniguilib-minigui-ml-1155598642) | `MiniGuiLib/minigui.ml:4319` | 11 | 9 | 5 | 5 | 2 | 454.95 | 58 |
| [`MiniGuiLib.minigui.Control.setLayout`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-setlayout-static-function-setlayout-control-resizemode-anchor-minwidth-minheight-maxwidth-maxheight-miniguilib-minigui-ml-2029591074) | `MiniGuiLib/minigui.ml:3534` | 32 | 33 | 10 | 9 | 1 | 1134.42 | 44.43 |
| [`MiniGuiLib.minigui.Control.setListViewCellNative`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-setlistviewcellnative-static-function-setlistviewcellnative-control-row-column-value-miniguilib-minigui-ml-989823695) | `MiniGuiLib/minigui.ml:4115` | 15 | 17 | 7 | 6 | 1 | 774.35 | 53.17 |
| [`MiniGuiLib.minigui.Control.setListViewColumns`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-setlistviewcolumns-static-function-setlistviewcolumns-control-columns-miniguilib-minigui-ml-223612547) | `MiniGuiLib/minigui.ml:3886` | 22 | 25 | 9 | 8 | 1 | 1272 | 47.77 |
| [`MiniGuiLib.minigui.Control.setMaxLength`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-setmaxlength-static-function-setmaxlength-control-maxlength-miniguilib-minigui-ml-2015921332) | `MiniGuiLib/minigui.ml:3501` | 10 | 10 | 10 | 9 | 1 | 475 | 58.1 |
| [`MiniGuiLib.minigui.Control.setPosition`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-setposition-static-function-setposition-control-x-y-miniguilib-minigui-ml-885587583) | `MiniGuiLib/minigui.ml:3790` | 4 | 3 | 2 | 1 | 1 | 175.69 | 70.88 |
| [`MiniGuiLib.minigui.Control.setReadOnly`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-setreadonly-static-function-setreadonly-control-readonly-miniguilib-minigui-ml-904919164) | `MiniGuiLib/minigui.ml:3486` | 11 | 11 | 10 | 10 | 2 | 484.26 | 57.14 |
| [`MiniGuiLib.minigui.Control.setScrollRange`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-setscrollrange-static-function-setscrollrange-control-minimum-maximum-miniguilib-minigui-ml-388111760) | `MiniGuiLib/minigui.ml:4633` | 20 | 20 | 7 | 6 | 1 | 816.85 | 50.29 |
| [`MiniGuiLib.minigui.Control.setScrollSteps`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-setscrollsteps-static-function-setscrollsteps-control-smallstep-largestep-miniguilib-minigui-ml-655846264) | `MiniGuiLib/minigui.ml:4658` | 13 | 14 | 6 | 5 | 1 | 475.97 | 56.15 |
| [`MiniGuiLib.minigui.Control.setScrollValue`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-setscrollvalue-static-function-setscrollvalue-control-value-miniguilib-minigui-ml-829160053) | `MiniGuiLib/minigui.ml:4675` | 16 | 16 | 7 | 6 | 1 | 555 | 53.58 |
| [`MiniGuiLib.minigui.Control.setSelectedIndex`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-setselectedindex-static-function-setselectedindex-control-index-miniguilib-minigui-ml-1357404376) | `MiniGuiLib/minigui.ml:4346` | 32 | 27 | 10 | 10 | 2 | 1247.29 | 44.14 |
| [`MiniGuiLib.minigui.Control.setSize`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-setsize-static-function-setsize-control-width-height-miniguilib-minigui-ml-1259784487) | `MiniGuiLib/minigui.ml:3799` | 4 | 3 | 2 | 1 | 1 | 175.69 | 70.88 |
| [`MiniGuiLib.minigui.Control.setTabIndex`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-settabindex-static-function-settabindex-control-tabindex-miniguilib-minigui-ml-1519533725) | `MiniGuiLib/minigui.ml:3381` | 4 | 3 | 2 | 1 | 1 | 94.01 | 72.78 |
| [`MiniGuiLib.minigui.Control.setText`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-settext-static-function-settext-control-text-miniguilib-minigui-ml-113968263) | `MiniGuiLib/minigui.ml:3287` | 12 | 12 | 5 | 4 | 1 | 422.64 | 57.4 |
| [`MiniGuiLib.minigui.Control.setTooltip`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-settooltip-static-function-settooltip-control-text-miniguilib-minigui-ml-1453905537) | `MiniGuiLib/minigui.ml:3353` | 24 | 27 | 6 | 5 | 1 | 1174 | 47.59 |
| [`MiniGuiLib.minigui.Control.setTreeItems`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-settreeitems-static-function-settreeitems-control-items-miniguilib-minigui-ml-676872302) | `MiniGuiLib/minigui.ml:4241` | 25 | 23 | 9 | 13 | 3 | 1041.63 | 47.16 |
| [`MiniGuiLib.minigui.Control.setValue`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-setvalue-static-function-setvalue-control-value-miniguilib-minigui-ml-1798949747) | `MiniGuiLib/minigui.ml:4596` | 21 | 22 | 12 | 17 | 2 | 976.01 | 48.61 |
| [`MiniGuiLib.minigui.Control.setValueRange`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-setvaluerange-static-function-setvaluerange-control-minimum-maximum-miniguilib-minigui-ml-1233204440) | `MiniGuiLib/minigui.ml:4570` | 22 | 21 | 10 | 13 | 2 | 921.5 | 48.61 |
| [`MiniGuiLib.minigui.Control.setVisible`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-setvisible-static-function-setvisible-control-visible-miniguilib-minigui-ml-1846519804) | `MiniGuiLib/minigui.ml:3340` | 9 | 8 | 4 | 3 | 1 | 254.75 | 61.8 |
| [`MiniGuiLib.minigui.Control.splitterOrientation`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-splitterorientation-static-function-splitterorientation-splitter-miniguilib-minigui-ml-558039582) | `MiniGuiLib/minigui.ml:3725` | 6 | 6 | 3 | 2 | 1 | 169.46 | 67.01 |
| [`MiniGuiLib.minigui.Control.splitterTargetAfterId`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-splittertargetafterid-static-function-splittertargetafterid-splitter-miniguilib-minigui-ml-1440695426) | `MiniGuiLib/minigui.ml:3741` | 4 | 3 | 2 | 1 | 1 | 108.42 | 72.35 |
| [`MiniGuiLib.minigui.Control.splitterTargetBeforeId`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-splittertargetbeforeid-static-function-splittertargetbeforeid-splitter-miniguilib-minigui-ml-765144554) | `MiniGuiLib/minigui.ml:3734` | 4 | 3 | 2 | 1 | 1 | 108.42 | 72.35 |
| [`MiniGuiLib.minigui.Control.treeItemLevel`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-treeitemlevel-static-function-treeitemlevel-text-miniguilib-minigui-ml-1210564994) | `MiniGuiLib/minigui.ml:4212` | 9 | 6 | 4 | 3 | 1 | 239.75 | 61.98 |
| [`MiniGuiLib.minigui.Control.treeItemText`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-treeitemtext-static-function-treeitemtext-text-miniguilib-minigui-ml-197920766) | `MiniGuiLib/minigui.ml:4224` | 13 | 8 | 6 | 6 | 2 | 387.64 | 56.77 |
| [`MiniGuiLib.minigui.Control.updateListViewColumnWidths`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-updatelistviewcolumnwidths-static-function-updatelistviewcolumnwidths-control-miniguilib-minigui-ml-228041928) | `MiniGuiLib/minigui.ml:3911` | 14 | 17 | 9 | 8 | 1 | 660.59 | 54.04 |
| [`MiniGuiLib.minigui.Control.updateScrollViewer`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-updatescrollviewer-static-function-updatescrollviewer-app-scrollviewer-miniguilib-minigui-ml-1037233397) | `MiniGuiLib/minigui.ml:4482` | 28 | 28 | 14 | 23 | 5 | 1352.4 | 44.62 |
| [`MiniGuiLib.minigui.Control.updateTabPages`](Type-miniguilib-minigui-control-487621723.md#static_method-static-method-miniguilib-minigui-control-updatetabpages-static-function-updatetabpages-app-tabcontrol-miniguilib-minigui-ml-1615899968) | `MiniGuiLib/minigui.ml:4382` | 55 | 46 | 26 | 61 | 7 | 2568.17 | 34.66 |
| [`MiniGuiLib.minigui.DataGrid.create`](Type-miniguilib-minigui-datagrid-312471086.md#static_method-static-method-miniguilib-minigui-datagrid-create-static-function-create-app-parent-id-text-x-y-width-height-columns-items-selectedindex-miniguilib-minigui-ml-2004862695) | `MiniGuiLib/minigui.ml:3098` | 13 | 13 | 3 | 2 | 1 | 1213.24 | 53.7 |
| [`MiniGuiLib.minigui.DatePicker.create`](Type-miniguilib-minigui-datepicker-2133079376.md#static_method-static-method-miniguilib-minigui-datepicker-create-static-function-create-app-parent-id-text-x-y-width-height-miniguilib-minigui-ml-6337403) | `MiniGuiLib/minigui.ml:3124` | 9 | 8 | 2 | 1 | 1 | 877.63 | 58.31 |
| [`MiniGuiLib.minigui.DateTimePicker.create`](Type-miniguilib-minigui-datetimepicker-50480545.md#static_method-static-method-miniguilib-minigui-datetimepicker-create-static-function-create-app-parent-id-text-x-y-width-height-miniguilib-minigui-ml-1404895222) | `MiniGuiLib/minigui.ml:3146` | 9 | 8 | 2 | 1 | 1 | 877.63 | 58.31 |
| [`MiniGuiLib.minigui.Dialog._buttonFlags`](Type-miniguilib-minigui-dialog-758938230.md#static_method-static-method-miniguilib-minigui-dialog-buttonflags-static-function-buttonflags-buttons-miniguilib-minigui-ml-1185885913) | `MiniGuiLib/minigui.ml:1832` | 8 | 11 | 6 | 5 | 1 | 245.27 | 62.76 |
| [`MiniGuiLib.minigui.Dialog._colorFromHex`](Type-miniguilib-minigui-dialog-758938230.md#static_method-static-method-miniguilib-minigui-dialog-colorfromhex-static-function-colorfromhex-text-miniguilib-minigui-ml-845117327) | `MiniGuiLib/minigui.ml:1955` | 7 | 6 | 2 | 1 | 1 | 515 | 62.31 |
| [`MiniGuiLib.minigui.Dialog._colorToHex`](Type-miniguilib-minigui-dialog-758938230.md#static_method-static-method-miniguilib-minigui-dialog-colortohex-static-function-colortohex-color-miniguilib-minigui-ml-78817243) | `MiniGuiLib/minigui.ml:1965` | 6 | 4 | 1 | 0 | 0 | 240.81 | 66.21 |
| [`MiniGuiLib.minigui.Dialog._fileDialog`](Type-miniguilib-minigui-dialog-758938230.md#static_method-static-method-miniguilib-minigui-dialog-filedialog-static-function-filedialog-app-title-filter-savedialog-miniguilib-minigui-ml-1045818614) | `MiniGuiLib/minigui.ml:1902` | 24 | 22 | 4 | 5 | 2 | 1047.39 | 48.21 |
| [`MiniGuiLib.minigui.Dialog._filterBytes`](Type-miniguilib-minigui-dialog-758938230.md#static_method-static-method-miniguilib-minigui-dialog-filterbytes-static-function-filterbytes-filter-miniguilib-minigui-ml-88419072) | `MiniGuiLib/minigui.ml:1877` | 19 | 15 | 6 | 11 | 4 | 594.54 | 51.87 |
| [`MiniGuiLib.minigui.Dialog._hexByte`](Type-miniguilib-minigui-dialog-758938230.md#static_method-static-method-miniguilib-minigui-dialog-hexbyte-static-function-hexbyte-value-miniguilib-minigui-ml-1659154677) | `MiniGuiLib/minigui.ml:1937` | 3 | 1 | 1 | 0 | 0 | 91.38 | 75.73 |
| [`MiniGuiLib.minigui.Dialog._hexDigit`](Type-miniguilib-minigui-dialog-758938230.md#static_method-static-method-miniguilib-minigui-dialog-hexdigit-static-function-hexdigit-value-miniguilib-minigui-ml-547276841) | `MiniGuiLib/minigui.ml:1929` | 5 | 3 | 1 | 0 | 0 | 84 | 71.14 |
| [`MiniGuiLib.minigui.Dialog._hexValueAt`](Type-miniguilib-minigui-dialog-758938230.md#static_method-static-method-miniguilib-minigui-dialog-hexvalueat-static-function-hexvalueat-text-pos-miniguilib-minigui-ml-1448169679) | `MiniGuiLib/minigui.ml:1944` | 8 | 10 | 8 | 7 | 1 | 386.43 | 61.11 |
| [`MiniGuiLib.minigui.Dialog._iconFlags`](Type-miniguilib-minigui-dialog-758938230.md#static_method-static-method-miniguilib-minigui-dialog-iconflags-static-function-iconflags-icon-miniguilib-minigui-ml-343763499) | `MiniGuiLib/minigui.ml:1843` | 7 | 9 | 6 | 5 | 1 | 222.97 | 64.32 |
| [`MiniGuiLib.minigui.Dialog._owner`](Type-miniguilib-minigui-dialog-758938230.md#static_method-static-method-miniguilib-minigui-dialog-owner-static-function-owner-app-miniguilib-minigui-ml-186149539) | `MiniGuiLib/minigui.ml:1824` | 5 | 5 | 3 | 2 | 1 | 132.83 | 69.48 |
| [`MiniGuiLib.minigui.Dialog.abortRetryIgnore`](Type-miniguilib-minigui-dialog-758938230.md#static_method-static-method-miniguilib-minigui-dialog-abortretryignore-static-function-abortretryignore-app-title-message-miniguilib-minigui-ml-662816968) | `MiniGuiLib/minigui.ml:2064` | 3 | 1 | 1 | 0 | 0 | 108 | 75.22 |
| [`MiniGuiLib.minigui.Dialog.close`](Type-miniguilib-minigui-dialog-758938230.md#static_method-static-method-miniguilib-minigui-dialog-close-static-function-close-dialog-result-miniguilib-minigui-ml-1280988937) | `MiniGuiLib/minigui.ml:2082` | 9 | 7 | 4 | 3 | 1 | 270.51 | 61.62 |
| [`MiniGuiLib.minigui.Dialog.confirm`](Type-miniguilib-minigui-dialog-758938230.md#static_method-static-method-miniguilib-minigui-dialog-confirm-static-function-confirm-app-title-message-miniguilib-minigui-ml-598608940) | `MiniGuiLib/minigui.ml:2024` | 3 | 1 | 1 | 0 | 0 | 138.3 | 74.47 |
| [`MiniGuiLib.minigui.Dialog.createCustom`](Type-miniguilib-minigui-dialog-758938230.md#static_method-static-method-miniguilib-minigui-dialog-createcustom-static-function-createcustom-app-id-title-width-height-miniguilib-minigui-ml-671246221) | `MiniGuiLib/minigui.ml:2074` | 4 | 2 | 1 | 0 | 0 | 224.01 | 70.28 |
| [`MiniGuiLib.minigui.Dialog.createInput`](Type-miniguilib-minigui-dialog-758938230.md#static_method-static-method-miniguilib-minigui-dialog-createinput-static-function-createinput-app-id-title-prompt-defaultvalue-width-miniguilib-minigui-ml-1295018710) | `MiniGuiLib/minigui.ml:2146` | 12 | 11 | 2 | 1 | 1 | 1131.58 | 54.81 |
| [`MiniGuiLib.minigui.Dialog.errorMessage`](Type-miniguilib-minigui-dialog-758938230.md#static_method-static-method-miniguilib-minigui-dialog-errormessage-static-function-errormessage-app-title-message-miniguilib-minigui-ml-888258862) | `MiniGuiLib/minigui.ml:2016` | 3 | 1 | 1 | 0 | 0 | 108 | 75.22 |
| [`MiniGuiLib.minigui.Dialog.getResult`](Type-miniguilib-minigui-dialog-758938230.md#static_method-static-method-miniguilib-minigui-dialog-getresult-static-function-getresult-dialog-miniguilib-minigui-ml-1311561314) | `MiniGuiLib/minigui.ml:2094` | 4 | 3 | 2 | 1 | 1 | 82.04 | 73.2 |
| [`MiniGuiLib.minigui.Dialog.getValue`](Type-miniguilib-minigui-dialog-758938230.md#static_method-static-method-miniguilib-minigui-dialog-getvalue-static-function-getvalue-dialog-miniguilib-minigui-ml-2137203328) | `MiniGuiLib/minigui.ml:2101` | 5 | 5 | 3 | 2 | 1 | 193.26 | 68.34 |
| [`MiniGuiLib.minigui.Dialog.info`](Type-miniguilib-minigui-dialog-758938230.md#static_method-static-method-miniguilib-minigui-dialog-info-static-function-info-app-title-message-miniguilib-minigui-ml-133940052) | `MiniGuiLib/minigui.ml:1984` | 3 | 1 | 1 | 0 | 0 | 108 | 75.22 |
| [`MiniGuiLib.minigui.Dialog.pickColor`](Type-miniguilib-minigui-dialog-758938230.md#static_method-static-method-miniguilib-minigui-dialog-pickcolor-static-function-pickcolor-app-title-fallback-miniguilib-minigui-ml-901897117) | `MiniGuiLib/minigui.ml:2211` | 11 | 10 | 2 | 1 | 1 | 565.54 | 57.74 |
| [`MiniGuiLib.minigui.Dialog.pickFolder`](Type-miniguilib-minigui-dialog-758938230.md#static_method-static-method-miniguilib-minigui-dialog-pickfolder-static-function-pickfolder-app-title-miniguilib-minigui-ml-497446665) | `MiniGuiLib/minigui.ml:2190` | 16 | 16 | 3 | 2 | 1 | 687.89 | 53.46 |
| [`MiniGuiLib.minigui.Dialog.pickOpenFile`](Type-miniguilib-minigui-dialog-758938230.md#static_method-static-method-miniguilib-minigui-dialog-pickopenfile-static-function-pickopenfile-app-title-filter-miniguilib-minigui-ml-697429695) | `MiniGuiLib/minigui.ml:2175` | 3 | 1 | 1 | 0 | 0 | 97.67 | 75.53 |
| [`MiniGuiLib.minigui.Dialog.pickSaveFile`](Type-miniguilib-minigui-dialog-758938230.md#static_method-static-method-miniguilib-minigui-dialog-picksavefile-static-function-picksavefile-app-title-filter-miniguilib-minigui-ml-344312933) | `MiniGuiLib/minigui.ml:2183` | 3 | 1 | 1 | 0 | 0 | 97.67 | 75.53 |
| [`MiniGuiLib.minigui.Dialog.question`](Type-miniguilib-minigui-dialog-758938230.md#static_method-static-method-miniguilib-minigui-dialog-question-static-function-question-app-title-message-miniguilib-minigui-ml-1509293812) | `MiniGuiLib/minigui.ml:2032` | 3 | 1 | 1 | 0 | 0 | 108 | 75.22 |
| [`MiniGuiLib.minigui.Dialog.resultName`](Type-miniguilib-minigui-dialog-758938230.md#static_method-static-method-miniguilib-minigui-dialog-resultname-static-function-resultname-code-miniguilib-minigui-ml-109138141) | `MiniGuiLib/minigui.ml:1853` | 10 | 15 | 8 | 7 | 1 | 343.13 | 59.36 |
| [`MiniGuiLib.minigui.Dialog.retryCancel`](Type-miniguilib-minigui-dialog-758938230.md#static_method-static-method-miniguilib-minigui-dialog-retrycancel-static-function-retrycancel-app-title-message-miniguilib-minigui-ml-466623524) | `MiniGuiLib/minigui.ml:2056` | 3 | 1 | 1 | 0 | 0 | 108 | 75.22 |
| [`MiniGuiLib.minigui.Dialog.setValue`](Type-miniguilib-minigui-dialog-758938230.md#static_method-static-method-miniguilib-minigui-dialog-setvalue-static-function-setvalue-dialog-value-miniguilib-minigui-ml-420652195) | `MiniGuiLib/minigui.ml:2110` | 6 | 6 | 3 | 2 | 1 | 214.05 | 66.3 |
| [`MiniGuiLib.minigui.Dialog.showError`](Type-miniguilib-minigui-dialog-758938230.md#static_method-static-method-miniguilib-minigui-dialog-showerror-static-function-showerror-app-title-message-miniguilib-minigui-ml-1379798868) | `MiniGuiLib/minigui.ml:2008` | 3 | 1 | 1 | 0 | 0 | 125.1 | 74.77 |
| [`MiniGuiLib.minigui.Dialog.showInfo`](Type-miniguilib-minigui-dialog-758938230.md#static_method-static-method-miniguilib-minigui-dialog-showinfo-static-function-showinfo-app-title-message-miniguilib-minigui-ml-1643086678) | `MiniGuiLib/minigui.ml:1976` | 3 | 1 | 1 | 0 | 0 | 125.1 | 74.77 |
| [`MiniGuiLib.minigui.Dialog.showInput`](Type-miniguilib-minigui-dialog-758938230.md#static_method-static-method-miniguilib-minigui-dialog-showinput-static-function-showinput-app-title-prompt-defaultvalue-miniguilib-minigui-ml-1039424635) | `MiniGuiLib/minigui.ml:2164` | 6 | 5 | 2 | 1 | 1 | 266.27 | 65.77 |
| [`MiniGuiLib.minigui.Dialog.showMessage`](Type-miniguilib-minigui-dialog-758938230.md#static_method-static-method-miniguilib-minigui-dialog-showmessage-static-function-showmessage-app-title-message-buttons-icon-miniguilib-minigui-ml-1675846092) | `MiniGuiLib/minigui.ml:1870` | 4 | 2 | 1 | 0 | 0 | 235.23 | 70.13 |
| [`MiniGuiLib.minigui.Dialog.showModal`](Type-miniguilib-minigui-dialog-758938230.md#static_method-static-method-miniguilib-minigui-dialog-showmodal-static-function-showmodal-dialog-miniguilib-minigui-ml-917583810) | `MiniGuiLib/minigui.ml:2119` | 19 | 18 | 8 | 10 | 3 | 708.24 | 51.07 |
| [`MiniGuiLib.minigui.Dialog.showWarning`](Type-miniguilib-minigui-dialog-758938230.md#static_method-static-method-miniguilib-minigui-dialog-showwarning-static-function-showwarning-app-title-message-miniguilib-minigui-ml-869786756) | `MiniGuiLib/minigui.ml:1992` | 3 | 1 | 1 | 0 | 0 | 125.1 | 74.77 |
| [`MiniGuiLib.minigui.Dialog.warning`](Type-miniguilib-minigui-dialog-758938230.md#static_method-static-method-miniguilib-minigui-dialog-warning-static-function-warning-app-title-message-miniguilib-minigui-ml-406805796) | `MiniGuiLib/minigui.ml:2000` | 3 | 1 | 1 | 0 | 0 | 108 | 75.22 |
| [`MiniGuiLib.minigui.Dialog.yesNo`](Type-miniguilib-minigui-dialog-758938230.md#static_method-static-method-miniguilib-minigui-dialog-yesno-static-function-yesno-app-title-message-miniguilib-minigui-ml-94362612) | `MiniGuiLib/minigui.ml:2040` | 3 | 1 | 1 | 0 | 0 | 108 | 75.22 |
| [`MiniGuiLib.minigui.Dialog.yesNoCancel`](Type-miniguilib-minigui-dialog-758938230.md#static_method-static-method-miniguilib-minigui-dialog-yesnocancel-static-function-yesnocancel-app-title-message-miniguilib-minigui-ml-1637556960) | `MiniGuiLib/minigui.ml:2048` | 3 | 1 | 1 | 0 | 0 | 108 | 75.22 |
| [`MiniGuiLib.minigui.EditableComboBox.create`](Type-miniguilib-minigui-editablecombobox-1293251185.md#static_method-static-method-miniguilib-minigui-editablecombobox-create-static-function-create-app-parent-id-text-x-y-width-height-items-selectedindex-miniguilib-minigui-ml-732586611) | `MiniGuiLib/minigui.ml:3241` | 12 | 12 | 3 | 2 | 1 | 1160.75 | 54.6 |
| [`MiniGuiLib.minigui.Events.beginDataGridEdit`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-begindatagridedit-static-function-begindatagridedit-app-hwndcontrol-x-y-miniguilib-minigui-ml-1172095201) | `MiniGuiLib/minigui.ml:5098` | 40 | 49 | 12 | 11 | 1 | 1967.77 | 40.37 |
| [`MiniGuiLib.minigui.Events.beginSplitterDrag`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-beginsplitterdrag-static-function-beginsplitterdrag-app-hwndcontrol-x-y-miniguilib-minigui-ml-300141281) | `MiniGuiLib/minigui.ml:5022` | 17 | 17 | 3 | 2 | 1 | 398.51 | 54.55 |
| [`MiniGuiLib.minigui.Events.bindBlur`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-bindblur-static-function-bindblur-app-control-callback-context-miniguilib-minigui-ml-1137879427) | `MiniGuiLib/minigui.ml:4905` | 4 | 2 | 1 | 0 | 0 | 155.59 | 71.38 |
| [`MiniGuiLib.minigui.Events.bindChange`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-bindchange-static-function-bindchange-app-control-callback-context-miniguilib-minigui-ml-1220486673) | `MiniGuiLib/minigui.ml:4878` | 11 | 6 | 13 | 14 | 2 | 729.32 | 55.49 |
| [`MiniGuiLib.minigui.Events.bindChanged`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-bindchanged-static-function-bindchanged-app-control-callback-context-miniguilib-minigui-ml-785666435) | `MiniGuiLib/minigui.ml:4861` | 11 | 6 | 13 | 14 | 2 | 729.32 | 55.49 |
| [`MiniGuiLib.minigui.Events.bindClick`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-bindclick-static-function-bindclick-app-control-callback-context-miniguilib-minigui-ml-1176465155) | `MiniGuiLib/minigui.ml:4746` | 4 | 2 | 1 | 0 | 0 | 155.59 | 71.38 |
| [`MiniGuiLib.minigui.Events.bindClicked`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-bindclicked-static-function-bindclicked-app-control-callback-context-miniguilib-minigui-ml-1715132163) | `MiniGuiLib/minigui.ml:4756` | 4 | 2 | 1 | 0 | 0 | 155.59 | 71.38 |
| [`MiniGuiLib.minigui.Events.bindClose`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-bindclose-static-function-bindclose-app-window-callback-context-miniguilib-minigui-ml-428660054) | `MiniGuiLib/minigui.ml:4726` | 4 | 2 | 1 | 0 | 0 | 155.59 | 71.38 |
| [`MiniGuiLib.minigui.Events.bindFocus`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-bindfocus-static-function-bindfocus-app-control-callback-context-miniguilib-minigui-ml-1848656115) | `MiniGuiLib/minigui.ml:4895` | 4 | 2 | 1 | 0 | 0 | 155.59 | 71.38 |
| [`MiniGuiLib.minigui.Events.bindLoad`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-bindload-static-function-bindload-app-window-callback-context-miniguilib-minigui-ml-950824772) | `MiniGuiLib/minigui.ml:4716` | 4 | 2 | 1 | 0 | 0 | 155.59 | 71.38 |
| [`MiniGuiLib.minigui.Events.bindResized`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-bindresized-static-function-bindresized-app-window-callback-context-miniguilib-minigui-ml-36859082) | `MiniGuiLib/minigui.ml:4736` | 4 | 2 | 1 | 0 | 0 | 155.59 | 71.38 |
| [`MiniGuiLib.minigui.Events.bindScrollChanged`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-bindscrollchanged-static-function-bindscrollchanged-app-control-callback-context-miniguilib-minigui-ml-744122627) | `MiniGuiLib/minigui.ml:4835` | 3 | 1 | 1 | 0 | 0 | 116 | 75 |
| [`MiniGuiLib.minigui.Events.bindScrollEvent`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-bindscrollevent-static-function-bindscrollevent-app-control-callback-context-eventtype-miniguilib-minigui-ml-75689709) | `MiniGuiLib/minigui.ml:4822` | 7 | 4 | 2 | 1 | 1 | 276.9 | 64.19 |
| [`MiniGuiLib.minigui.Events.bindSelected`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-bindselected-static-function-bindselected-app-control-callback-context-miniguilib-minigui-ml-552328163) | `MiniGuiLib/minigui.ml:4812` | 3 | 1 | 1 | 0 | 0 | 116 | 75 |
| [`MiniGuiLib.minigui.Events.bindSelectionChanged`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-bindselectionchanged-static-function-bindselectionchanged-app-control-callback-context-miniguilib-minigui-ml-971855473) | `MiniGuiLib/minigui.ml:4803` | 3 | 1 | 1 | 0 | 0 | 116 | 75 |
| [`MiniGuiLib.minigui.Events.bindSelectionEvent`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-bindselectionevent-static-function-bindselectionevent-app-control-callback-context-eventtype-miniguilib-minigui-ml-1360804167) | `MiniGuiLib/minigui.ml:4790` | 7 | 4 | 2 | 1 | 1 | 276.9 | 64.19 |
| [`MiniGuiLib.minigui.Events.bindTextChanged`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-bindtextchanged-static-function-bindtextchanged-app-control-callback-context-miniguilib-minigui-ml-799711667) | `MiniGuiLib/minigui.ml:4780` | 3 | 1 | 1 | 0 | 0 | 116 | 75 |
| [`MiniGuiLib.minigui.Events.bindTextEvent`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-bindtextevent-static-function-bindtextevent-app-control-callback-context-eventtype-miniguilib-minigui-ml-1332051617) | `MiniGuiLib/minigui.ml:4767` | 7 | 4 | 2 | 1 | 1 | 276.9 | 64.19 |
| [`MiniGuiLib.minigui.Events.bindValueChanged`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-bindvaluechanged-static-function-bindvaluechanged-app-control-callback-context-miniguilib-minigui-ml-1918292755) | `MiniGuiLib/minigui.ml:4844` | 11 | 6 | 13 | 14 | 2 | 729.32 | 55.49 |
| [`MiniGuiLib.minigui.Events.commitDataGridEdit`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-commitdatagridedit-static-function-commitdatagridedit-app-hwndcontrol-cancel-miniguilib-minigui-ml-1191380676) | `MiniGuiLib/minigui.ml:5143` | 27 | 25 | 5 | 5 | 2 | 585.41 | 48.73 |
| [`MiniGuiLib.minigui.Events.controlByHandle`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-controlbyhandle-static-function-controlbyhandle-app-hwndcontrol-miniguilib-minigui-ml-301358636) | `MiniGuiLib/minigui.ml:4985` | 12 | 9 | 6 | 11 | 4 | 376.52 | 57.62 |
| [`MiniGuiLib.minigui.Events.dispatch`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-dispatch-static-function-dispatch-binding-eventtype-oldvalue-newvalue-miniguilib-minigui-ml-398190857) | `MiniGuiLib/minigui.ml:4915` | 5 | 4 | 2 | 1 | 1 | 229.25 | 67.96 |
| [`MiniGuiLib.minigui.Events.dispatchClickByHandle`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-dispatchclickbyhandle-static-function-dispatchclickbyhandle-app-hwndcontrol-x-miniguilib-minigui-ml-958683588) | `MiniGuiLib/minigui.ml:5281` | 25 | 18 | 11 | 29 | 5 | 1230.74 | 46.39 |
| [`MiniGuiLib.minigui.Events.dispatchClose`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-dispatchclose-static-function-dispatchclose-app-window-miniguilib-minigui-ml-1194664832) | `MiniGuiLib/minigui.ml:4951` | 14 | 12 | 5 | 7 | 3 | 482.81 | 55.53 |
| [`MiniGuiLib.minigui.Events.dispatchCommand`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-dispatchcommand-static-function-dispatchcommand-app-code-nativeid-hwndcontrol-miniguilib-minigui-ml-639258507) | `MiniGuiLib/minigui.ml:5537` | 58 | 40 | 23 | 60 | 5 | 2482.12 | 34.67 |
| [`MiniGuiLib.minigui.Events.dispatchContextMenu`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-dispatchcontextmenu-static-function-dispatchcontextmenu-app-hwndcontrol-x-y-miniguilib-minigui-ml-4930173) | `MiniGuiLib/minigui.ml:5312` | 30 | 27 | 12 | 27 | 5 | 1452.48 | 44.02 |
| [`MiniGuiLib.minigui.Events.dispatchControlTextBindings`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-dispatchcontroltextbindings-static-function-dispatchcontroltextbindings-app-control-eventtype-oldvalue-newvalue-miniguilib-minigui-ml-1520297434) | `MiniGuiLib/minigui.ml:5004` | 12 | 9 | 4 | 4 | 2 | 408.42 | 57.64 |
| [`MiniGuiLib.minigui.Events.dispatchFocusByHandle`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-dispatchfocusbyhandle-static-function-dispatchfocusbyhandle-app-hwndcontrol-focused-miniguilib-minigui-ml-1633792875) | `MiniGuiLib/minigui.ml:5175` | 23 | 17 | 7 | 12 | 4 | 618.59 | 49.81 |
| [`MiniGuiLib.minigui.Events.dispatchLoad`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-dispatchload-static-function-dispatchload-window-miniguilib-minigui-ml-1055185811) | `MiniGuiLib/minigui.ml:4935` | 12 | 9 | 4 | 4 | 2 | 343.66 | 58.16 |
| [`MiniGuiLib.minigui.Events.dispatchNotify`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-dispatchnotify-static-function-dispatchnotify-app-hwndcontrol-nativeid-code-lparam-miniguilib-minigui-ml-1423294964) | `MiniGuiLib/minigui.ml:5205` | 71 | 68 | 36 | 92 | 5 | 3751.39 | 29.75 |
| [`MiniGuiLib.minigui.Events.dispatchResize`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-dispatchresize-static-function-dispatchresize-app-window-oldvalue-newvalue-miniguilib-minigui-ml-1190526719) | `MiniGuiLib/minigui.ml:4971` | 10 | 7 | 4 | 4 | 2 | 353.92 | 59.8 |
| [`MiniGuiLib.minigui.Events.dispatchScroll`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-dispatchscroll-static-function-dispatchscroll-app-code-pos-hwndcontrol-miniguilib-minigui-ml-1107130731) | `MiniGuiLib/minigui.ml:5504` | 27 | 29 | 14 | 40 | 4 | 1258.89 | 45.19 |
| [`MiniGuiLib.minigui.Events.dispatchScrollViewer`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-dispatchscrollviewer-static-function-dispatchscrollviewer-app-hwndcontrol-code-pos-miniguilib-minigui-ml-1380931573) | `MiniGuiLib/minigui.ml:5468` | 30 | 31 | 18 | 66 | 7 | 1530 | 43.06 |
| [`MiniGuiLib.minigui.Events.dispatchSelectionClickedByHandle`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-dispatchselectionclickedbyhandle-static-function-dispatchselectionclickedbyhandle-app-hwndcontrol-x-y-miniguilib-minigui-ml-1269257945) | `MiniGuiLib/minigui.ml:5422` | 40 | 42 | 24 | 64 | 5 | 2090.91 | 38.58 |
| [`MiniGuiLib.minigui.Events.dispatchTabChangedByHandle`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-dispatchtabchangedbyhandle-static-function-dispatchtabchangedbyhandle-app-hwndcontrol-miniguilib-minigui-ml-1305564996) | `MiniGuiLib/minigui.ml:5363` | 21 | 17 | 8 | 16 | 4 | 733.21 | 50.02 |
| [`MiniGuiLib.minigui.Events.dispatchTabClickedByHandle`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-dispatchtabclickedbyhandle-static-function-dispatchtabclickedbyhandle-app-hwndcontrol-x-y-miniguilib-minigui-ml-1874923951) | `MiniGuiLib/minigui.ml:5390` | 26 | 23 | 9 | 17 | 4 | 1131.58 | 46.54 |
| [`MiniGuiLib.minigui.Events.dragSplitter`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-dragsplitter-static-function-dragsplitter-app-hwndcontrol-flags-x-y-miniguilib-minigui-ml-1556879450) | `MiniGuiLib/minigui.ml:5046` | 34 | 32 | 8 | 9 | 2 | 1174 | 44.02 |
| [`MiniGuiLib.minigui.Events.endSplitterDrag`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-endsplitterdrag-static-function-endsplitterdrag-app-hwndcontrol-miniguilib-minigui-ml-424822452) | `MiniGuiLib/minigui.ml:5084` | 8 | 8 | 3 | 2 | 1 | 180.94 | 64.09 |
| [`MiniGuiLib.minigui.Events.findWindowByHandle`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-findwindowbyhandle-static-function-findwindowbyhandle-app-hwnd-miniguilib-minigui-ml-411884925) | `MiniGuiLib/minigui.ml:4924` | 8 | 7 | 5 | 5 | 2 | 302.21 | 62.26 |
| [`MiniGuiLib.minigui.Events.isControlKind`](Type-miniguilib-minigui-events-1317937091.md#static_method-static-method-miniguilib-minigui-events-iscontrolkind-static-function-iscontrolkind-app-hwndcontrol-kind-miniguilib-minigui-ml-910295918) | `MiniGuiLib/minigui.ml:5347` | 12 | 9 | 7 | 12 | 4 | 427.35 | 57.1 |
| [`MiniGuiLib.minigui.FilePicker.create`](Type-miniguilib-minigui-filepicker-1049747810.md#static_method-static-method-miniguilib-minigui-filepicker-create-static-function-create-app-parent-id-text-x-y-width-height-title-filter-miniguilib-minigui-ml-2003398603) | `MiniGuiLib/minigui.ml:2298` | 10 | 10 | 3 | 2 | 1 | 1008.11 | 56.75 |
| [`MiniGuiLib.minigui.FolderPicker.create`](Type-miniguilib-minigui-folderpicker-1673436.md#static_method-static-method-miniguilib-minigui-folderpicker-create-static-function-create-app-parent-id-text-x-y-width-height-title-miniguilib-minigui-ml-139156995) | `MiniGuiLib/minigui.ml:2322` | 10 | 10 | 3 | 2 | 1 | 964.31 | 56.89 |
| [`MiniGuiLib.minigui.GroupBox.create`](Type-miniguilib-minigui-groupbox-375763974.md#static_method-static-method-miniguilib-minigui-groupbox-create-static-function-create-app-parent-id-text-x-y-width-height-miniguilib-minigui-ml-339451373) | `MiniGuiLib/minigui.ml:2762` | 8 | 7 | 2 | 1 | 1 | 840.25 | 59.55 |
| [`MiniGuiLib.minigui.Image.create`](Type-miniguilib-minigui-image-1271556347.md#static_method-static-method-miniguilib-minigui-image-create-static-function-create-app-parent-id-text-x-y-width-height-source-stretch-miniguilib-minigui-ml-567924938) | `MiniGuiLib/minigui.ml:2573` | 14 | 14 | 5 | 5 | 2 | 1253.61 | 52.63 |
| [`MiniGuiLib.minigui.Label.create`](Type-miniguilib-minigui-label-1189359004.md#static_method-static-method-miniguilib-minigui-label-create-static-function-create-app-parent-id-text-x-y-width-height-miniguilib-minigui-ml-969965975) | `MiniGuiLib/minigui.ml:2235` | 5 | 3 | 1 | 0 | 0 | 671.73 | 64.82 |
| [`MiniGuiLib.minigui.LinkLabel.create`](Type-miniguilib-minigui-linklabel-829611492.md#static_method-static-method-miniguilib-minigui-linklabel-create-static-function-create-app-parent-id-text-x-y-width-height-url-miniguilib-minigui-ml-1568135770) | `MiniGuiLib/minigui.ml:2663` | 10 | 10 | 3 | 2 | 1 | 959.46 | 56.9 |
| [`MiniGuiLib.minigui.ListBox.create`](Type-miniguilib-minigui-listbox-399936991.md#static_method-static-method-miniguilib-minigui-listbox-create-static-function-create-app-parent-id-text-x-y-width-height-items-selectedindex-miniguilib-minigui-ml-109812085) | `MiniGuiLib/minigui.ml:3268` | 12 | 12 | 3 | 2 | 1 | 1160.75 | 54.6 |
| [`MiniGuiLib.minigui.ListView.create`](Type-miniguilib-minigui-listview-417190859.md#static_method-static-method-miniguilib-minigui-listview-create-static-function-create-app-parent-id-text-x-y-width-height-items-selectedindex-miniguilib-minigui-ml-1093664433) | `MiniGuiLib/minigui.ml:3043` | 13 | 13 | 3 | 2 | 1 | 1189.91 | 53.76 |
| [`MiniGuiLib.minigui.ListView.createColumns`](Type-miniguilib-minigui-listview-417190859.md#static_method-static-method-miniguilib-minigui-listview-createcolumns-static-function-createcolumns-app-parent-id-text-x-y-width-height-columns-items-selectedindex-miniguilib-minigui-ml-1026378948) | `MiniGuiLib/minigui.ml:3069` | 13 | 13 | 3 | 2 | 1 | 1218.46 | 53.69 |
| [`MiniGuiLib.minigui.MenuBar.create`](Type-miniguilib-minigui-menubar-1972806118.md#static_method-static-method-miniguilib-minigui-menubar-create-static-function-create-app-parent-id-text-x-y-width-height-items-miniguilib-minigui-ml-355578087) | `MiniGuiLib/minigui.ml:2920` | 11 | 11 | 4 | 3 | 1 | 1136.45 | 55.35 |
| [`MiniGuiLib.minigui.NumberBox.create`](Type-miniguilib-minigui-numberbox-1673605572.md#static_method-static-method-miniguilib-minigui-numberbox-create-static-function-create-app-parent-id-text-x-y-width-height-minimum-maximum-value-step-miniguilib-minigui-ml-1973897398) | `MiniGuiLib/minigui.ml:2441` | 11 | 11 | 3 | 2 | 1 | 1064.65 | 55.68 |
| [`MiniGuiLib.minigui.Panel.create`](Type-miniguilib-minigui-panel-1796001828.md#static_method-static-method-miniguilib-minigui-panel-create-static-function-create-app-parent-id-text-x-y-width-height-miniguilib-minigui-ml-1727125295) | `MiniGuiLib/minigui.ml:2686` | 8 | 7 | 2 | 1 | 1 | 824.37 | 59.61 |
| [`MiniGuiLib.minigui.Panel.createTabPage`](Type-miniguilib-minigui-panel-1796001828.md#static_method-static-method-miniguilib-minigui-panel-createtabpage-static-function-createtabpage-app-tabcontrol-id-text-x-y-width-height-miniguilib-minigui-ml-1972181435) | `MiniGuiLib/minigui.ml:2704` | 18 | 15 | 4 | 4 | 2 | 1128.81 | 50.71 |
| [`MiniGuiLib.minigui.PasswordBox.create`](Type-miniguilib-minigui-passwordbox-1578552828.md#static_method-static-method-miniguilib-minigui-passwordbox-create-static-function-create-app-parent-id-text-x-y-width-height-miniguilib-minigui-ml-263519015) | `MiniGuiLib/minigui.ml:2415` | 9 | 8 | 2 | 1 | 1 | 909.58 | 58.2 |
| [`MiniGuiLib.minigui.ProgressBar.create`](Type-miniguilib-minigui-progressbar-2050757430.md#static_method-static-method-miniguilib-minigui-progressbar-create-static-function-create-app-parent-id-text-x-y-width-height-minimum-maximum-value-miniguilib-minigui-ml-228452946) | `MiniGuiLib/minigui.ml:2850` | 11 | 10 | 2 | 1 | 1 | 1004.61 | 55.99 |
| [`MiniGuiLib.minigui.RadioButton.create`](Type-miniguilib-minigui-radiobutton-2120866377.md#static_method-static-method-miniguilib-minigui-radiobutton-create-static-function-create-app-parent-id-text-x-y-width-height-checked-miniguilib-minigui-ml-1241716169) | `MiniGuiLib/minigui.ml:2549` | 9 | 9 | 3 | 2 | 1 | 970.74 | 57.86 |
| [`MiniGuiLib.minigui.ScrollBar.create`](Type-miniguilib-minigui-scrollbar-1767258424.md#static_method-static-method-miniguilib-minigui-scrollbar-create-static-function-create-app-parent-id-text-x-y-width-height-orientation-minimum-maximum-value-smallstep-largestep-miniguilib-minigui-ml-575438338) | `MiniGuiLib/minigui.ml:2789` | 12 | 12 | 3 | 2 | 1 | 1178.24 | 54.55 |
| [`MiniGuiLib.minigui.ScrollViewer.create`](Type-miniguilib-minigui-scrollviewer-1330694613.md#static_method-static-method-miniguilib-minigui-scrollviewer-create-static-function-create-app-parent-id-text-x-y-width-height-horizontalscroll-verticalscroll-miniguilib-minigui-ml-1457975260) | `MiniGuiLib/minigui.ml:2737` | 12 | 14 | 5 | 4 | 1 | 1134.39 | 54.4 |
| [`MiniGuiLib.minigui.SearchBox.create`](Type-miniguilib-minigui-searchbox-189843555.md#static_method-static-method-miniguilib-minigui-searchbox-create-static-function-create-app-parent-id-text-x-y-width-height-miniguilib-minigui-ml-1343004012) | `MiniGuiLib/minigui.ml:2370` | 9 | 8 | 2 | 1 | 1 | 893.59 | 58.25 |
| [`MiniGuiLib.minigui.Separator.create`](Type-miniguilib-minigui-separator-1724365817.md#static_method-static-method-miniguilib-minigui-separator-create-static-function-create-app-parent-id-text-x-y-width-height-orientation-miniguilib-minigui-ml-2036402192) | `MiniGuiLib/minigui.ml:2601` | 7 | 6 | 2 | 1 | 1 | 807.3 | 60.94 |
| [`MiniGuiLib.minigui.Slider.create`](Type-miniguilib-minigui-slider-1448461179.md#static_method-static-method-miniguilib-minigui-slider-create-static-function-create-app-parent-id-text-x-y-width-height-orientation-minimum-maximum-value-smallstep-largestep-miniguilib-minigui-ml-410216997) | `MiniGuiLib/minigui.ml:2820` | 14 | 14 | 3 | 2 | 1 | 1276.53 | 52.85 |
| [`MiniGuiLib.minigui.SpinBox.create`](Type-miniguilib-minigui-spinbox-73951299.md#static_method-static-method-miniguilib-minigui-spinbox-create-static-function-create-app-parent-id-text-x-y-width-height-minimum-maximum-value-step-miniguilib-minigui-ml-1325776507) | `MiniGuiLib/minigui.ml:2469` | 20 | 19 | 4 | 3 | 1 | 1716.7 | 48.43 |
| [`MiniGuiLib.minigui.Splitter.create`](Type-miniguilib-minigui-splitter-693560105.md#static_method-static-method-miniguilib-minigui-splitter-create-static-function-create-app-parent-id-text-x-y-width-height-orientation-miniguilib-minigui-ml-2038681312) | `MiniGuiLib/minigui.ml:2622` | 3 | 1 | 1 | 0 | 0 | 224.01 | 73 |
| [`MiniGuiLib.minigui.Splitter.createPane`](Type-miniguilib-minigui-splitter-693560105.md#static_method-static-method-miniguilib-minigui-splitter-createpane-static-function-createpane-app-parent-id-text-x-y-width-height-orientation-targetbefore-targetafter-miniguilib-minigui-ml-215865089) | `MiniGuiLib/minigui.ml:2638` | 11 | 11 | 3 | 2 | 1 | 1092.68 | 55.6 |
| [`MiniGuiLib.minigui.StatusBar.create`](Type-miniguilib-minigui-statusbar-969880253.md#static_method-static-method-miniguilib-minigui-statusbar-create-static-function-create-app-parent-id-text-x-y-width-height-miniguilib-minigui-ml-531359762) | `MiniGuiLib/minigui.ml:2970` | 9 | 8 | 2 | 1 | 1 | 845.75 | 58.42 |
| [`MiniGuiLib.minigui.TabControl.addTab`](Type-miniguilib-minigui-tabcontrol-1354852254.md#static_method-static-method-miniguilib-minigui-tabcontrol-addtab-static-function-addtab-control-index-text-miniguilib-minigui-ml-1325815454) | `MiniGuiLib/minigui.ml:2895` | 11 | 11 | 3 | 2 | 1 | 477.02 | 58.12 |
| [`MiniGuiLib.minigui.TabControl.create`](Type-miniguilib-minigui-tabcontrol-1354852254.md#static_method-static-method-miniguilib-minigui-tabcontrol-create-static-function-create-app-parent-id-text-x-y-width-height-items-selectedindex-miniguilib-minigui-ml-2106808952) | `MiniGuiLib/minigui.ml:2876` | 14 | 11 | 4 | 4 | 2 | 1137.41 | 53.06 |
| [`MiniGuiLib.minigui.TextArea.create`](Type-miniguilib-minigui-textarea-1993982468.md#static_method-static-method-miniguilib-minigui-textarea-create-static-function-create-app-parent-id-text-x-y-width-height-miniguilib-minigui-ml-874621519) | `MiniGuiLib/minigui.ml:2392` | 10 | 9 | 2 | 1 | 1 | 985.2 | 56.96 |
| [`MiniGuiLib.minigui.TextBox.create`](Type-miniguilib-minigui-textbox-245475314.md#static_method-static-method-miniguilib-minigui-textbox-create-static-function-create-app-parent-id-text-x-y-width-height-miniguilib-minigui-ml-911610377) | `MiniGuiLib/minigui.ml:2274` | 9 | 8 | 2 | 1 | 1 | 893.59 | 58.25 |
| [`MiniGuiLib.minigui.TimePicker.create`](Type-miniguilib-minigui-timepicker-1929323797.md#static_method-static-method-miniguilib-minigui-timepicker-create-static-function-create-app-parent-id-text-x-y-width-height-miniguilib-minigui-ml-1225815818) | `MiniGuiLib/minigui.ml:3168` | 9 | 8 | 2 | 1 | 1 | 893.59 | 58.25 |
| [`MiniGuiLib.minigui.ToggleSwitch.create`](Type-miniguilib-minigui-toggleswitch-1594220486.md#static_method-static-method-miniguilib-minigui-toggleswitch-create-static-function-create-app-parent-id-text-x-y-width-height-checked-miniguilib-minigui-ml-1643910112) | `MiniGuiLib/minigui.ml:2526` | 9 | 9 | 3 | 2 | 1 | 970.74 | 57.86 |
| [`MiniGuiLib.minigui.ToolBar.create`](Type-miniguilib-minigui-toolbar-853395957.md#static_method-static-method-miniguilib-minigui-toolbar-create-static-function-create-app-parent-id-text-x-y-width-height-items-miniguilib-minigui-ml-1882497338) | `MiniGuiLib/minigui.ml:2993` | 11 | 11 | 4 | 3 | 1 | 1136.45 | 55.35 |
| [`MiniGuiLib.minigui.TreeView.create`](Type-miniguilib-minigui-treeview-42567539.md#static_method-static-method-miniguilib-minigui-treeview-create-static-function-create-app-parent-id-text-x-y-width-height-items-miniguilib-minigui-ml-427212) | `MiniGuiLib/minigui.ml:3018` | 10 | 9 | 2 | 1 | 1 | 996.66 | 56.92 |
| [`MiniGuiLib.minigui.Window.close`](Type-miniguilib-minigui-window-1943367786.md#static_method-static-method-miniguilib-minigui-window-close-static-function-close-window-miniguilib-minigui-ml-1463026958) | `MiniGuiLib/minigui.ml:1786` | 5 | 5 | 3 | 2 | 1 | 140 | 69.32 |
| [`MiniGuiLib.minigui.Window.create`](Type-miniguilib-minigui-window-1943367786.md#static_method-static-method-miniguilib-minigui-window-create-static-function-create-app-id-title-width-height-miniguilib-minigui-ml-1508612899) | `MiniGuiLib/minigui.ml:1718` | 28 | 30 | 12 | 12 | 2 | 1763.25 | 44.09 |
| [`MiniGuiLib.minigui.Window.getClientHeight`](Type-miniguilib-minigui-window-1943367786.md#static_method-static-method-miniguilib-minigui-window-getclientheight-static-function-getclientheight-window-miniguilib-minigui-ml-852548574) | `MiniGuiLib/minigui.ml:1811` | 7 | 8 | 4 | 3 | 1 | 326.9 | 63.42 |
| [`MiniGuiLib.minigui.Window.getClientWidth`](Type-miniguilib-minigui-window-1943367786.md#static_method-static-method-miniguilib-minigui-window-getclientwidth-static-function-getclientwidth-window-miniguilib-minigui-ml-1260740472) | `MiniGuiLib/minigui.ml:1801` | 7 | 8 | 4 | 3 | 1 | 323.33 | 63.45 |
| [`MiniGuiLib.minigui.Window.installProc`](Type-miniguilib-minigui-window-1943367786.md#static_method-static-method-miniguilib-minigui-window-installproc-static-function-installproc-window-callback-miniguilib-minigui-ml-720019567) | `MiniGuiLib/minigui.ml:1765` | 9 | 10 | 4 | 3 | 1 | 260.06 | 61.74 |
| [`MiniGuiLib.minigui.Window.setTitle`](Type-miniguilib-minigui-window-1943367786.md#static_method-static-method-miniguilib-minigui-window-settitle-static-function-settitle-window-title-miniguilib-minigui-ml-74257072) | `MiniGuiLib/minigui.ml:1795` | 3 | 1 | 1 | 0 | 0 | 70.31 | 76.52 |
| [`MiniGuiLib.minigui.Window.show`](Type-miniguilib-minigui-window-1943367786.md#static_method-static-method-miniguilib-minigui-window-show-static-function-show-window-miniguilib-minigui-ml-1715024080) | `MiniGuiLib/minigui.ml:1749` | 12 | 14 | 5 | 4 | 1 | 480 | 57.01 |
| [`MiniGuiLib.minigui.Window.startResizeTimer`](Type-miniguilib-minigui-window-1943367786.md#static_method-static-method-miniguilib-minigui-window-startresizetimer-static-function-startresizetimer-window-callback-miniguilib-minigui-ml-434667065) | `MiniGuiLib/minigui.ml:1778` | 5 | 5 | 3 | 2 | 1 | 200.67 | 68.23 |
| [`miniGuiTypeName`](File-tools-minigui-ml-742202604.md#function-function-miniguitypename-function-miniguitypename-ns-tools-minigui-ml-542183962) | `tools/minigui.ml:759` | 11 | 10 | 4 | 4 | 2 | 374.44 | 58.73 |
| [`miniIdent`](File-tools-minigui-ml-742202604.md#function-function-miniident-function-miniident-value-tools-minigui-ml-1758439038) | `tools/minigui.ml:724` | 17 | 16 | 7 | 7 | 2 | 510 | 53.26 |
| [`mlString`](File-tools-minigui-ml-742202604.md#function-function-mlstring-function-mlstring-value-tools-minigui-ml-1647320920) | `tools/minigui.ml:773` | 16 | 15 | 9 | 13 | 2 | 634.25 | 52.9 |
| [`newResult`](File-tools-minigui-ml-742202604.md#function-function-newresult-function-newresult-tools-minigui-ml-831753929) | `tools/minigui.ml:168` | 3 | 1 | 1 | 0 | 0 | 136.23 | 74.51 |
| [`normalizePath`](File-tools-minigui-ml-742202604.md#function-function-normalizepath-function-normalizepath-p-tools-minigui-ml-264733573) | `tools/minigui.ml:623` | 18 | 14 | 9 | 13 | 3 | 744.14 | 51.3 |
| [`opt`](File-tools-minigui-ml-742202604.md#function-function-opt-function-opt-opts-name-tools-minigui-ml-1308232944) | `tools/minigui.ml:2063` | 6 | 4 | 3 | 3 | 2 | 203.56 | 66.46 |
| [`ord`](File-tools-minigui-ml-742202604.md#function-function-ord-function-ord-ch-tools-minigui-ml-1102161998) | `tools/minigui.ml:279` | 4 | 3 | 3 | 2 | 1 | 153.73 | 71.15 |
| [`parseArray`](File-tools-minigui-ml-742202604.md#function-function-parsearray-function-parsearray-p-tools-minigui-ml-1331145953) | `tools/minigui.ml:511` | 25 | 19 | 5 | 6 | 2 | 773.29 | 48.61 |
| [`parseJson`](File-tools-minigui-ml-742202604.md#function-function-parsejson-function-parsejson-text-tools-minigui-ml-1607346182) | `tools/minigui.ml:539` | 8 | 8 | 4 | 3 | 1 | 406.24 | 61.5 |
| [`parseJsonString`](File-tools-minigui-ml-742202604.md#function-function-parsejsonstring-function-parsejsonstring-p-tools-minigui-ml-1528965317) | `tools/minigui.ml:353` | 54 | 44 | 20 | 47 | 4 | 2739.36 | 35.45 |
| [`parseNumber`](File-tools-minigui-ml-742202604.md#function-function-parsenumber-function-parsenumber-p-tools-minigui-ml-1693595001) | `tools/minigui.ml:410` | 24 | 20 | 16 | 18 | 2 | 1639.15 | 45.23 |
| [`parseObject`](File-tools-minigui-ml-742202604.md#function-function-parseobject-function-parseobject-p-tools-minigui-ml-1405547285) | `tools/minigui.ml:472` | 36 | 29 | 6 | 8 | 2 | 1202.76 | 43.68 |
| [`parseOptions`](File-tools-minigui-ml-742202604.md#function-function-parseoptions-function-parseoptions-args-start-tools-minigui-ml-1906956410) | `tools/minigui.ml:2036` | 22 | 23 | 13 | 21 | 2 | 1688.32 | 46.37 |
| [`parserError`](File-tools-minigui-ml-742202604.md#function-function-parsererror-function-parsererror-p-message-tools-minigui-ml-2136624246) | `tools/minigui.ml:327` | 3 | 1 | 1 | 0 | 0 | 104 | 75.33 |
| [`parseValue`](File-tools-minigui-ml-742202604.md#function-function-parsevalue-function-parsevalue-p-tools-minigui-ml-1234950661) | `tools/minigui.ml:447` | 22 | 21 | 12 | 11 | 1 | 1072.04 | 47.88 |
| [`pathSlash`](File-tools-minigui-ml-742202604.md#function-function-pathslash-function-pathslash-p-tools-minigui-ml-253320005) | `tools/minigui.ml:550` | 3 | 1 | 1 | 0 | 0 | 66.61 | 76.69 |
| [`pathUnslash`](File-tools-minigui-ml-742202604.md#function-function-pathunslash-function-pathunslash-p-tools-minigui-ml-1813826991) | `tools/minigui.ml:556` | 3 | 1 | 1 | 0 | 0 | 66.61 | 76.69 |
| [`prop`](File-tools-minigui-ml-742202604.md#function-function-prop-function-prop-obj-name-tools-minigui-ml-1706235939) | `tools/minigui.ml:189` | 9 | 10 | 6 | 6 | 2 | 445.88 | 59.83 |
| [`q`](File-tools-minigui-ml-742202604.md#function-function-q-function-q-s0-tools-minigui-ml-1988593882) | `tools/minigui.ml:694` | 3 | 1 | 1 | 0 | 0 | 83.76 | 75.99 |
| [`readMson`](File-tools-minigui-ml-742202604.md#function-function-readmson-function-readmson-result-path-tools-minigui-ml-1878109801) | `tools/minigui.ml:826` | 13 | 9 | 3 | 2 | 1 | 378.92 | 57.24 |
| [`relativePath`](File-tools-minigui-ml-742202604.md#function-function-relativepath-function-relativepath-fromdir-topath-tools-minigui-ml-163985424) | `tools/minigui.ml:653` | 21 | 15 | 9 | 10 | 2 | 750.45 | 49.81 |
| [`resolveMsonPath`](File-tools-minigui-ml-742202604.md#function-function-resolvemsonpath-function-resolvemsonpath-importpath-basedir-includedirs-tools-minigui-ml-1322876553) | `tools/minigui.ml:844` | 17 | 14 | 7 | 14 | 4 | 575 | 52.89 |
| [`resourceValue`](File-tools-minigui-ml-742202604.md#function-function-resourcevalue-function-resourcevalue-result-path-value-tools-minigui-ml-1226194412) | `tools/minigui.ml:806` | 16 | 12 | 7 | 10 | 3 | 691.12 | 52.91 |
| [`setProp`](File-tools-minigui-ml-742202604.md#function-function-setprop-function-setprop-obj-name-value-tools-minigui-ml-1048961806) | `tools/minigui.ml:962` | 14 | 10 | 5 | 7 | 3 | 470.65 | 55.61 |
| [`skipWs`](File-tools-minigui-ml-742202604.md#function-function-skipws-function-skipws-p-tools-minigui-ml-988267521) | `tools/minigui.ml:318` | 5 | 2 | 3 | 2 | 1 | 182.66 | 68.51 |
| [`splitPathParts`](File-tools-minigui-ml-742202604.md#function-function-splitpathparts-function-splitpathparts-p-tools-minigui-ml-1541148269) | `tools/minigui.ml:644` | 5 | 4 | 2 | 1 | 1 | 156.08 | 69.13 |
| [`stackHas`](File-tools-minigui-ml-742202604.md#function-function-stackhas-function-stackhas-stack-path-tools-minigui-ml-22166058) | `tools/minigui.ml:865` | 7 | 6 | 4 | 4 | 2 | 220.08 | 64.62 |
| [`stackSlotWidth`](File-tools-minigui-ml-742202604.md#function-function-stackslotwidth-function-stackslotwidth-result-path-node-fallback-tools-minigui-ml-597787999) | `tools/minigui.ml:1413` | 3 | 1 | 1 | 0 | 0 | 140.87 | 74.41 |
| [`startsAt`](File-tools-minigui-ml-742202604.md#function-function-startsat-function-startsat-text-pos-needle-tools-minigui-ml-253439729) | `tools/minigui.ml:440` | 4 | 3 | 2 | 1 | 1 | 190.16 | 70.64 |
| [`stringArrayLiteral`](File-tools-minigui-ml-742202604.md#function-function-stringarrayliteral-function-stringarrayliteral-result-path-node-name-tools-minigui-ml-306204374) | `tools/minigui.ml:1466` | 10 | 9 | 4 | 3 | 1 | 600.54 | 58.19 |
| [`stringProp`](File-tools-minigui-ml-742202604.md#function-function-stringprop-function-stringprop-result-path-node-name-fallback-tools-minigui-ml-160719356) | `tools/minigui.ml:1455` | 5 | 4 | 2 | 1 | 1 | 229.25 | 67.96 |
| [`tableArrayLiteral`](File-tools-minigui-ml-742202604.md#function-function-tablearrayliteral-function-tablearrayliteral-result-path-node-name-tools-minigui-ml-936250814) | `tools/minigui.ml:1547` | 21 | 16 | 7 | 12 | 4 | 1140.06 | 48.81 |
| [`testControlProperties`](File-tools-minigui-ml-742202604.md#function-function-testcontrolproperties-function-testcontrolproperties-result-path-typ-properties-tools-minigui-ml-101126771) | `tools/minigui.ml:1109` | 58 | 57 | 61 | 154 | 9 | 7232.37 | 26.31 |
| [`testLayoutNode`](File-tools-minigui-ml-742202604.md#function-function-testlayoutnode-function-testlayoutnode-result-path-node-ids-tools-minigui-ml-783250001) | `tools/minigui.ml:1180` | 49 | 35 | 15 | 32 | 6 | 2970 | 36.8 |
| [`testPropertyNames`](File-tools-minigui-ml-742202604.md#function-function-testpropertynames-function-testpropertynames-result-path-obj-allowed-context-tools-minigui-ml-1413846259) | `tools/minigui.ml:1034` | 10 | 9 | 6 | 6 | 2 | 524.79 | 58.33 |
| [`treeArrayLiteral`](File-tools-minigui-ml-742202604.md#function-function-treearrayliteral-function-treearrayliteral-result-path-node-name-tools-minigui-ml-113288346) | `tools/minigui.ml:1530` | 11 | 8 | 4 | 4 | 2 | 576.98 | 57.41 |
| [`trimDotSlash`](File-tools-minigui-ml-742202604.md#function-function-trimdotslash-function-trimdotslash-p-tools-minigui-ml-1643536593) | `tools/minigui.ml:562` | 7 | 4 | 2 | 1 | 1 | 185.84 | 65.41 |
| [`upperFirst`](File-tools-minigui-ml-742202604.md#function-function-upperfirst-function-upperfirst-s0-tools-minigui-ml-509576888) | `tools/minigui.ml:744` | 12 | 11 | 5 | 4 | 1 | 471.89 | 57.06 |
| [`usage`](File-tools-minigui-ml-742202604.md#function-function-usage-function-usage-tools-minigui-ml-654463161) | `tools/minigui.ml:2071` | 6 | 4 | 1 | 0 | 0 | 46.51 | 71.21 |
| [`validateMson`](File-tools-minigui-ml-742202604.md#function-function-validatemson-function-validatemson-path-includedirs-codebehindoverride-tools-minigui-ml-115174509) | `tools/minigui.ml:1249` | 73 | 69 | 28 | 64 | 6 | 6361.4 | 28.95 |
| [`writeValidation`](File-tools-minigui-ml-742202604.md#function-function-writevalidation-function-writevalidation-result-tools-minigui-ml-1716886486) | `tools/minigui.ml:2093` | 9 | 5 | 3 | 3 | 2 | 208.97 | 62.54 |

## Code duplication

A clone group is an exact sequence of 6 normalized, contiguous code lines found more than once. Comments and formatting whitespace are ignored. Duplicated-line totals count overlapping windows only once.

Found 36 clone group(s). At most 36 groups are shown.

<details>
<summary>Clone 1 — 2 occurrences</summary>

    end if
    end if
    end for
    end if
    return true
    end function

- [`MiniGuiLib/minigui.ml:1674`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:4431`](File-miniguilib-minigui-ml-1319721044.md)

</details>

<details>
<summary>Clone 2 — 2 occurrences</summary>

    static function create ( app , parent , id , text , x , y , width , height )
    nid = app . nextNativeId
    app . nextNativeId = app . nextNativeId + 1
    style = WS_CHILD | WS_VISIBLE | WS_TABSTOP | WS_BORDER | ES_AUTOHSCROLL
    hwnd = CreateWindowExW ( 0 , "EDIT" , text , style , x , y , width , height , parent . handle , nid , void , void )
    if hwnd != 0 then _installWindowProc ( hwnd ) end if

- [`MiniGuiLib/minigui.ml:2274`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:2370`](File-miniguilib-minigui-ml-1319721044.md)

</details>

<details>
<summary>Clone 3 — 2 occurrences</summary>

    nid = app . nextNativeId
    app . nextNativeId = app . nextNativeId + 1
    label = text
    if label == "" then label = "Browse..." end if
    hwnd = CreateWindowExW ( 0 , "BUTTON" , label , WS_CHILD | WS_VISIBLE | WS_TABSTOP | BS_PUSHBUTTON , x , y , width , height , parent . handle , nid , void , void )
    if hwnd != 0 then _installWindowProc ( hwnd ) end if

- [`MiniGuiLib/minigui.ml:2299`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:2323`](File-miniguilib-minigui-ml-1319721044.md)

</details>

<details>
<summary>Clone 4 — 2 occurrences</summary>

    app . nextNativeId = app . nextNativeId + 1
    style = WS_CHILD | WS_VISIBLE | WS_TABSTOP | WS_BORDER | ES_AUTOHSCROLL | ES_NUMBER
    startText = text
    if startText == "" then startText = "" + value end if
    hwnd = CreateWindowExW ( 0 , "EDIT" , startText , style , x , y , width , height , parent . handle , nid , void , void )
    if hwnd != 0 then _installWindowProc ( hwnd ) end if

- [`MiniGuiLib/minigui.ml:2443`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:2474`](File-miniguilib-minigui-ml-1319721044.md)

</details>

<details>
<summary>Clone 5 — 2 occurrences</summary>

    static function create ( app , parent , id , text , x , y , width , height , checked )
    nid = app . nextNativeId
    app . nextNativeId = app . nextNativeId + 1
    hwnd = CreateWindowExW ( 0 , "BUTTON" , text , WS_CHILD | WS_VISIBLE | WS_TABSTOP | BS_AUTOCHECKBOX , x , y , width , height , parent . handle , nid , void , void )
    if hwnd != 0 then _installWindowProc ( hwnd ) end if
    if checked then SendMessageW ( hwnd , BM_SETCHECK , BST_CHECKED , 0 ) end if

- [`MiniGuiLib/minigui.ml:2503`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:2526`](File-miniguilib-minigui-ml-1319721044.md)

</details>

<details>
<summary>Clone 6 — 2 occurrences</summary>

    InitCommonControls ( )
    nid = app . nextNativeId
    app . nextNativeId = app . nextNativeId + 1
    hwnd = CreateWindowExW ( 0 , "SysListView32" , text , WS_CHILD | WS_VISIBLE | WS_TABSTOP | WS_BORDER | LVS_REPORT | LVS_SINGLESEL , x , y , width , height , parent . handle , nid , void , void )
    if hwnd != 0 then _installWindowProc ( hwnd ) end if
    c = NativeControl ( id , "ListView" , hwnd , nid , text , x , y , width , height , true , true , text , selectedIndex , 0 , 100 , 0 , 1 , 10 , x , y , width , height , 0 , 0 , parent , parent . width , parent . height )

- [`MiniGuiLib/minigui.ml:3044`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:3070`](File-miniguilib-minigui-ml-1319721044.md)

</details>

<details>
<summary>Clone 7 — 2 occurrences</summary>

    Control . setListViewColumns ( c , columns )
    Control . setItems ( c , items )
    if selectedIndex >= 0 then Control . setSelectedIndex ( c , selectedIndex ) end if
    c . lastSelection = Control . getSelectedIndex ( c )
    return Application . addControl ( app , c )
    end function

- [`MiniGuiLib/minigui.ml:3076`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:3105`](File-miniguilib-minigui-ml-1319721044.md)

</details>

<details>
<summary>Clone 8 — 5 occurrences</summary>

    Control . setItems ( c , items )
    if selectedIndex >= 0 then Control . setSelectedIndex ( c , selectedIndex ) end if
    c . lastSelection = Control . getSelectedIndex ( c )
    return Application . addControl ( app , c )
    end function
    end struct

- [`MiniGuiLib/minigui.ml:3077`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:3106`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:3221`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:3248`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:3275`](File-miniguilib-minigui-ml-1319721044.md)

</details>

<details>
<summary>Clone 9 — 2 occurrences</summary>

    static function create ( app , parent , id , text , x , y , width , height )
    InitCommonControls ( )
    nid = app . nextNativeId
    app . nextNativeId = app . nextNativeId + 1
    hwnd = CreateWindowExW ( 0 , "SysDateTimePick32" , text , WS_CHILD | WS_VISIBLE | WS_TABSTOP | DTS_SHORTDATEFORMAT , x , y , width , height , parent . handle , nid , void , void )
    if hwnd != 0 then _installWindowProc ( hwnd ) end if

- [`MiniGuiLib/minigui.ml:3124`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:3146`](File-miniguilib-minigui-ml-1319721044.md)

</details>

<details>
<summary>Clone 10 — 2 occurrences</summary>

    global _layoutResizeModes
    global _layoutAnchors
    global _layoutMinWidths
    global _layoutMinHeights
    global _layoutMaxWidths
    global _layoutMaxHeights

- [`MiniGuiLib/minigui.ml:3541`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:3574`](File-miniguilib-minigui-ml-1319721044.md)

</details>

<details>
<summary>Clone 11 — 2 occurrences</summary>

    if currentIndex == index then return current end if
    current = ""
    currentIndex = currentIndex + 1
    else
    current = current + ch
    end if

- [`MiniGuiLib/minigui.ml:4062`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:882`](File-miniguilib-minigui-ml-1319721044.md)

</details>

<details>
<summary>Clone 12 — 2 occurrences</summary>

    current = ""
    currentIndex = currentIndex + 1
    else
    current = current + ch
    end if
    end for

- [`MiniGuiLib/minigui.ml:4063`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:883`](File-miniguilib-minigui-ml-1319721044.md)

</details>

<details>
<summary>Clone 13 — 2 occurrences</summary>

    currentIndex = currentIndex + 1
    else
    current = current + ch
    end if
    end for
    end if

- [`MiniGuiLib/minigui.ml:4064`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:884`](File-miniguilib-minigui-ml-1319721044.md)

</details>

<details>
<summary>Clone 14 — 2 occurrences</summary>

    else
    current = current + ch
    end if
    end for
    end if
    if currentIndex == index then return current end if

- [`MiniGuiLib/minigui.ml:4065`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:885`](File-miniguilib-minigui-ml-1319721044.md)

</details>

<details>
<summary>Clone 15 — 2 occurrences</summary>

    current = current + ch
    end if
    end for
    end if
    if currentIndex == index then return current end if
    return ""

- [`MiniGuiLib/minigui.ml:4066`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:886`](File-miniguilib-minigui-ml-1319721044.md)

</details>

<details>
<summary>Clone 16 — 2 occurrences</summary>

    end if
    end for
    end if
    if currentIndex == index then return current end if
    return ""
    end function

- [`MiniGuiLib/minigui.ml:4067`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:887`](File-miniguilib-minigui-ml-1319721044.md)

</details>

<details>
<summary>Clone 17 — 4 occurrences</summary>

    end if
    return true
    end if
    end if
    end for
    end if

- [`MiniGuiLib/minigui.ml:5229`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:5490`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:5572`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:5590`](File-miniguilib-minigui-ml-1319721044.md)

</details>

<details>
<summary>Clone 18 — 2 occurrences</summary>

    oldValue = c . lastSelection
    newValue = Control . getSelectedIndex ( c )
    if newValue < 0 then newValue = oldValue end if
    c . lastSelection = newValue
    Control . updateTabPages ( app , c )
    if oldValue != newValue then

- [`MiniGuiLib/minigui.ml:5240`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:5370`](File-miniguilib-minigui-ml-1319721044.md)

</details>

<details>
<summary>Clone 19 — 2 occurrences</summary>

    newValue = Control . getSelectedIndex ( c )
    if newValue < 0 then newValue = oldValue end if
    c . lastSelection = newValue
    Control . updateTabPages ( app , c )
    if oldValue != newValue then
    Events . dispatch ( b , b . eventType , oldValue , newValue )

- [`MiniGuiLib/minigui.ml:5241`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:5371`](File-miniguilib-minigui-ml-1319721044.md)

</details>

<details>
<summary>Clone 20 — 2 occurrences</summary>

    if newValue < 0 then newValue = oldValue end if
    c . lastSelection = newValue
    Control . updateTabPages ( app , c )
    if oldValue != newValue then
    Events . dispatch ( b , b . eventType , oldValue , newValue )
    end if

- [`MiniGuiLib/minigui.ml:5242`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:5372`](File-miniguilib-minigui-ml-1319721044.md)

</details>

<details>
<summary>Clone 21 — 2 occurrences</summary>

    c . lastSelection = newValue
    Control . updateTabPages ( app , c )
    if oldValue != newValue then
    Events . dispatch ( b , b . eventType , oldValue , newValue )
    end if
    return true

- [`MiniGuiLib/minigui.ml:5243`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:5373`](File-miniguilib-minigui-ml-1319721044.md)

</details>

<details>
<summary>Clone 22 — 2 occurrences</summary>

    Control . updateTabPages ( app , c )
    if oldValue != newValue then
    Events . dispatch ( b , b . eventType , oldValue , newValue )
    end if
    return true
    end if

- [`MiniGuiLib/minigui.ml:5244`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:5374`](File-miniguilib-minigui-ml-1319721044.md)

</details>

<details>
<summary>Clone 23 — 6 occurrences</summary>

    return true
    end if
    end if
    end for
    return false
    end function

- [`MiniGuiLib/minigui.ml:5270`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:5300`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:5336`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:5378`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:5410`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:5525`](File-miniguilib-minigui-ml-1319721044.md)

</details>

<details>
<summary>Clone 24 — 2 occurrences</summary>

    clickValue = Dialog . pickOpenFile ( app , _itemTextAt ( c . lastText , 0 ) , _itemTextAt ( c . lastText , 1 ) )
    else if c . kind == "FolderPicker" then
    clickValue = Dialog . pickFolder ( app , c . lastText )
    else if c . kind == "ColorPicker" then
    clickValue = Dialog . pickColor ( app , _itemTextAt ( c . lastText , 0 ) , _itemTextAt ( c . lastText , 1 ) )
    end if

- [`MiniGuiLib/minigui.ml:5293`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:5548`](File-miniguilib-minigui-ml-1319721044.md)

</details>

<details>
<summary>Clone 25 — 2 occurrences</summary>

    else if c . kind == "FolderPicker" then
    clickValue = Dialog . pickFolder ( app , c . lastText )
    else if c . kind == "ColorPicker" then
    clickValue = Dialog . pickColor ( app , _itemTextAt ( c . lastText , 0 ) , _itemTextAt ( c . lastText , 1 ) )
    end if
    Events . dispatch ( b , b . eventType , false , clickValue )

- [`MiniGuiLib/minigui.ml:5294`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:5549`](File-miniguilib-minigui-ml-1319721044.md)

</details>

<details>
<summary>Clone 26 — 2 occurrences</summary>

    clickValue = Dialog . pickFolder ( app , c . lastText )
    else if c . kind == "ColorPicker" then
    clickValue = Dialog . pickColor ( app , _itemTextAt ( c . lastText , 0 ) , _itemTextAt ( c . lastText , 1 ) )
    end if
    Events . dispatch ( b , b . eventType , false , clickValue )
    return true

- [`MiniGuiLib/minigui.ml:5295`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:5550`](File-miniguilib-minigui-ml-1319721044.md)

</details>

<details>
<summary>Clone 27 — 2 occurrences</summary>

    else if c . kind == "ColorPicker" then
    clickValue = Dialog . pickColor ( app , _itemTextAt ( c . lastText , 0 ) , _itemTextAt ( c . lastText , 1 ) )
    end if
    Events . dispatch ( b , b . eventType , false , clickValue )
    return true
    end if

- [`MiniGuiLib/minigui.ml:5296`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:5551`](File-miniguilib-minigui-ml-1319721044.md)

</details>

<details>
<summary>Clone 28 — 2 occurrences</summary>

    clickValue = Dialog . pickColor ( app , _itemTextAt ( c . lastText , 0 ) , _itemTextAt ( c . lastText , 1 ) )
    end if
    Events . dispatch ( b , b . eventType , false , clickValue )
    return true
    end if
    end if

- [`MiniGuiLib/minigui.ml:5297`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:5552`](File-miniguilib-minigui-ml-1319721044.md)

</details>

<details>
<summary>Clone 29 — 2 occurrences</summary>

    end if
    Events . dispatch ( b , b . eventType , false , clickValue )
    return true
    end if
    end if
    end for

- [`MiniGuiLib/minigui.ml:5298`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:5553`](File-miniguilib-minigui-ml-1319721044.md)

</details>

<details>
<summary>Clone 30 — 2 occurrences</summary>

    if oldValue != newValue then
    Events . dispatch ( b , b . eventType , oldValue , newValue )
    end if
    return true
    end if
    end if

- [`MiniGuiLib/minigui.ml:5375`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:5522`](File-miniguilib-minigui-ml-1319721044.md)

</details>

<details>
<summary>Clone 31 — 2 occurrences</summary>

    Events . dispatch ( b , b . eventType , oldValue , newValue )
    end if
    return true
    end if
    end if
    end for

- [`MiniGuiLib/minigui.ml:5376`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:5523`](File-miniguilib-minigui-ml-1319721044.md)

</details>

<details>
<summary>Clone 32 — 3 occurrences</summary>

    end if
    return true
    end if
    end if
    end for
    return false

- [`MiniGuiLib/minigui.ml:5377`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:5409`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:5524`](File-miniguilib-minigui-ml-1319721044.md)

</details>

<details>
<summary>Clone 33 — 2 occurrences</summary>

    if app is void then return false end if
    if len ( app . selectionBindings ) == 0 then return false end if
    for s = 0 to len ( app . selectionBindings ) - 1
    b = app . selectionBindings [ s ]
    c = b . control
    if c is void == false then

- [`MiniGuiLib/minigui.ml:5391`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:5423`](File-miniguilib-minigui-ml-1319721044.md)

</details>

<details>
<summary>Clone 34 — 2 occurrences</summary>

    if code == SB_LINEUP then newValue = oldValue - c . smallStep end if
    if code == SB_LINEDOWN then newValue = oldValue + c . smallStep end if
    if code == SB_PAGEUP then newValue = oldValue - c . largeStep end if
    if code == SB_PAGEDOWN then newValue = oldValue + c . largeStep end if
    if code == SB_TOP then newValue = c . scrollMin end if
    if code == SB_BOTTOM then newValue = c . scrollMax end if

- [`MiniGuiLib/minigui.ml:5477`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:5513`](File-miniguilib-minigui-ml-1319721044.md)

</details>

<details>
<summary>Clone 35 — 2 occurrences</summary>

    if code == SB_LINEDOWN then newValue = oldValue + c . smallStep end if
    if code == SB_PAGEUP then newValue = oldValue - c . largeStep end if
    if code == SB_PAGEDOWN then newValue = oldValue + c . largeStep end if
    if code == SB_TOP then newValue = c . scrollMin end if
    if code == SB_BOTTOM then newValue = c . scrollMax end if
    if code == SB_THUMBPOSITION or code == SB_THUMBTRACK then newValue = pos end if

- [`MiniGuiLib/minigui.ml:5478`](File-miniguilib-minigui-ml-1319721044.md)
- [`MiniGuiLib/minigui.ml:5514`](File-miniguilib-minigui-ml-1319721044.md)

</details>

<details>
<summary>Clone 36 — 2 occurrences</summary>

    v = resourceValue ( result , path , prop ( prop ( node , "properties" ) , name ) )
    if v . kind != "array" then return "[]" end if
    if len ( v . items ) == 0 then return "[]" end if
    parts = [ ]
    for i = 0 to len ( v . items ) - 1
    item = resourceValue ( result , path , v . items [ i ] )

- [`tools/minigui.ml:1483`](File-tools-minigui-ml-742202604.md)
- [`tools/minigui.ml:1548`](File-tools-minigui-ml-742202604.md)

</details>


## Definitions

- **Cognitive complexity:** decision complexity weighted by nesting; logical `and`/`or` operators add one.
- **Cyclomatic complexity:** one plus decisions from conditions, loops, switch cases, and logical `and`/`or` operators.
- **Documentation coverage:** percentage of documented API summaries, parameter contracts, fields, constants, globals, and enum variants. Empty categories report 100% and do not affect the overall ratio.
- **Halstead metrics:** operators and operands are counted from MiniLang lexical tokens. Estimated defects are volume divided by 3,000.
- **Maintainability index:** normalized 0–100 index based on Halstead volume, cyclomatic complexity, and source lines. Project MI is source-line weighted across files.
- **SLOC:** non-empty lines containing MiniLang tokens after conditional preprocessing; comment-only lines are excluded.
