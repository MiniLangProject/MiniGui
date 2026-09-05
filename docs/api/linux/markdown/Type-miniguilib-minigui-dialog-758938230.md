# `MiniGuiLib.minigui.Dialog`

[Home](README.md) · [Source file](File-miniguilib-minigui-ml-1319721044.md)

<a id="struct-struct-miniguilib-minigui-dialog-struct-dialog-miniguilib-minigui-ml-624450207"></a>
## Dialog

```ml
struct Dialog
```

Native Dialog operations.


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7783)

## Members

<a id="static_method-static-method-miniguilib-minigui-dialog-owner-static-function-owner-app-miniguilib-minigui-ml-186149539"></a>
### _owner

```ml
static function _owner(app)
```

Finds the native owner of a dialog.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | app supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7786)

<a id="static_method-static-method-miniguilib-minigui-dialog-abortretryignore-static-function-abortretryignore-app-title-message-miniguilib-minigui-ml-662816968"></a>
### abortRetryIgnore

```ml
static function abortRetryIgnore(app, title, message)
```

Implements abortRetryIgnore for Linux dialogs.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | app supplied by the caller. |
| `title` | `dynamic` | — | title supplied by the caller. |
| `message` | `dynamic` | — | message supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7892)

<a id="static_method-static-method-miniguilib-minigui-dialog-close-static-function-close-dialog-result-miniguilib-minigui-ml-1280988937"></a>
### close

```ml
static function close(dialog, result)
```

Ends a custom modal dialog without destroying its content.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dialog` | `dynamic` | — | dialog supplied by the caller. |
| `result` | `dynamic` | — | result supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7960)

<a id="static_method-static-method-miniguilib-minigui-dialog-confirm-static-function-confirm-app-title-message-miniguilib-minigui-ml-598608940"></a>
### confirm

```ml
static function confirm(app, title, message)
```

Returns true only when the user confirms.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | app supplied by the caller. |
| `title` | `dynamic` | — | title supplied by the caller. |
| `message` | `dynamic` | — | message supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7803)

<a id="static_method-static-method-miniguilib-minigui-dialog-createcustom-static-function-createcustom-app-id-title-width-height-miniguilib-minigui-ml-671246221"></a>
### createCustom

```ml
static function createCustom(app, id, title, width, height)
```

Implements createCustom for Linux dialogs.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | app supplied by the caller. |
| `id` | `dynamic` | — | id supplied by the caller. |
| `title` | `dynamic` | — | title supplied by the caller. |
| `width` | `dynamic` | — | width supplied by the caller. |
| `height` | `dynamic` | — | height supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7901)

<a id="static_method-static-method-miniguilib-minigui-dialog-createinput-static-function-createinput-app-id-title-prompt-defaultvalue-width-miniguilib-minigui-ml-1295018710"></a>
### createInput

```ml
static function createInput(app, id, title, prompt, defaultValue, width)
```

Implements createInput for Linux dialogs.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | app supplied by the caller. |
| `id` | `dynamic` | — | id supplied by the caller. |
| `title` | `dynamic` | — | title supplied by the caller. |
| `prompt` | `dynamic` | — | prompt supplied by the caller. |
| `defaultValue` | `dynamic` | — | defaultValue supplied by the caller. |
| `width` | `dynamic` | — | width supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7912)

<a id="static_method-static-method-miniguilib-minigui-dialog-errormessage-static-function-errormessage-app-title-message-miniguilib-minigui-ml-888258862"></a>
### errorMessage

```ml
static function errorMessage(app, title, message)
```

Implements errorMessage for Linux dialogs.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | app supplied by the caller. |
| `title` | `dynamic` | — | title supplied by the caller. |
| `message` | `dynamic` | — | message supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7857)

<a id="static_method-static-method-miniguilib-minigui-dialog-getresult-static-function-getresult-dialog-miniguilib-minigui-ml-1311561314"></a>
### getResult

```ml
static function getResult(dialog)
```

Implements getResult for Linux dialogs.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dialog` | `dynamic` | — | dialog supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7944)

<a id="static_method-static-method-miniguilib-minigui-dialog-getvalue-static-function-getvalue-dialog-miniguilib-minigui-ml-2137203328"></a>
### getValue

```ml
static function getValue(dialog)
```

Implements getValue for Linux dialogs.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dialog` | `dynamic` | — | dialog supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7937)

<a id="static_method-static-method-miniguilib-minigui-dialog-info-static-function-info-app-title-message-miniguilib-minigui-ml-133940052"></a>
### info

```ml
static function info(app, title, message)
```

Implements info for Linux dialogs.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | app supplied by the caller. |
| `title` | `dynamic` | — | title supplied by the caller. |
| `message` | `dynamic` | — | message supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7843)

<a id="static_method-static-method-miniguilib-minigui-dialog-pickcolor-static-function-pickcolor-app-title-initialcolor-miniguilib-minigui-ml-1616571858"></a>
### pickColor

```ml
static function pickColor(app, title, initialColor)
```

Opens the native pickColor dialog.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | app supplied by the caller. |
| `title` | `dynamic` | — | title supplied by the caller. |
| `initialColor` | `dynamic` | — | initialColor supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L8008)

<a id="static_method-static-method-miniguilib-minigui-dialog-pickfolder-static-function-pickfolder-app-title-miniguilib-minigui-ml-497446665"></a>
### pickFolder

```ml
static function pickFolder(app, title)
```

Opens the native pickFolder dialog.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | app supplied by the caller. |
| `title` | `dynamic` | — | title supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7999)

<a id="static_method-static-method-miniguilib-minigui-dialog-pickopenfile-static-function-pickopenfile-app-title-filter-miniguilib-minigui-ml-697429695"></a>
### pickOpenFile

```ml
static function pickOpenFile(app, title, filter)
```

Opens the native pickOpenFile dialog.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | app supplied by the caller. |
| `title` | `dynamic` | — | title supplied by the caller. |
| `filter` | `dynamic` | — | filter supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7982)

<a id="static_method-static-method-miniguilib-minigui-dialog-picksavefile-static-function-picksavefile-app-title-filter-miniguilib-minigui-ml-344312933"></a>
### pickSaveFile

```ml
static function pickSaveFile(app, title, filter)
```

Opens the native pickSaveFile dialog.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | app supplied by the caller. |
| `title` | `dynamic` | — | title supplied by the caller. |
| `filter` | `dynamic` | — | filter supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7991)

<a id="static_method-static-method-miniguilib-minigui-dialog-question-static-function-question-app-title-message-miniguilib-minigui-ml-1509293812"></a>
### question

```ml
static function question(app, title, message)
```

Implements question for Linux dialogs.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | app supplied by the caller. |
| `title` | `dynamic` | — | title supplied by the caller. |
| `message` | `dynamic` | — | message supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7864)

<a id="static_method-static-method-miniguilib-minigui-dialog-resultname-static-function-resultname-code-miniguilib-minigui-ml-109138141"></a>
### resultName

```ml
static function resultName(code)
```

Implements resultName for Linux dialogs.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `code` | `dynamic` | — | code supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7829)

<a id="static_method-static-method-miniguilib-minigui-dialog-retrycancel-static-function-retrycancel-app-title-message-miniguilib-minigui-ml-466623524"></a>
### retryCancel

```ml
static function retryCancel(app, title, message)
```

Implements retryCancel for Linux dialogs.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | app supplied by the caller. |
| `title` | `dynamic` | — | title supplied by the caller. |
| `message` | `dynamic` | — | message supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7885)

<a id="static_method-static-method-miniguilib-minigui-dialog-setvalue-static-function-setvalue-dialog-value-miniguilib-minigui-ml-420652195"></a>
### setValue

```ml
static function setValue(dialog, value)
```

Implements setValue for Linux dialogs.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dialog` | `dynamic` | — | dialog supplied by the caller. |
| `value` | `dynamic` | — | value supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7951)

<a id="static_method-static-method-miniguilib-minigui-dialog-showerror-static-function-showerror-app-title-message-miniguilib-minigui-ml-1379798868"></a>
### showError

```ml
static function showError(app, title, message)
```

Shows a native error message.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | app supplied by the caller. |
| `title` | `dynamic` | — | title supplied by the caller. |
| `message` | `dynamic` | — | message supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7824)

<a id="static_method-static-method-miniguilib-minigui-dialog-showinfo-static-function-showinfo-app-title-message-miniguilib-minigui-ml-1643086678"></a>
### showInfo

```ml
static function showInfo(app, title, message)
```

Shows a native info message.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | app supplied by the caller. |
| `title` | `dynamic` | — | title supplied by the caller. |
| `message` | `dynamic` | — | message supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7810)

<a id="static_method-static-method-miniguilib-minigui-dialog-showinput-static-function-showinput-app-title-prompt-defaultvalue-miniguilib-minigui-ml-1039424635"></a>
### showInput

```ml
static function showInput(app, title, prompt, defaultValue)
```

Implements showInput for Linux dialogs.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | app supplied by the caller. |
| `title` | `dynamic` | — | title supplied by the caller. |
| `prompt` | `dynamic` | — | prompt supplied by the caller. |
| `defaultValue` | `dynamic` | — | defaultValue supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7929)

<a id="static_method-static-method-miniguilib-minigui-dialog-showmessage-static-function-showmessage-app-title-message-buttons-icon-miniguilib-minigui-ml-1675846092"></a>
### showMessage

```ml
static function showMessage(app, title, message, buttons, icon)
```

Shows a native message dialog and returns a named result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | app supplied by the caller. |
| `title` | `dynamic` | — | title supplied by the caller. |
| `message` | `dynamic` | — | message supplied by the caller. |
| `buttons` | `dynamic` | — | buttons supplied by the caller. |
| `icon` | `dynamic` | — | icon supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7796)

<a id="static_method-static-method-miniguilib-minigui-dialog-showmodal-static-function-showmodal-dialog-miniguilib-minigui-ml-917583810"></a>
### showModal

```ml
static function showModal(dialog)
```

Runs a custom dialog with native modal ownership.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dialog` | `dynamic` | — | dialog supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7967)

<a id="static_method-static-method-miniguilib-minigui-dialog-showwarning-static-function-showwarning-app-title-message-miniguilib-minigui-ml-869786756"></a>
### showWarning

```ml
static function showWarning(app, title, message)
```

Shows a native warning message.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | app supplied by the caller. |
| `title` | `dynamic` | — | title supplied by the caller. |
| `message` | `dynamic` | — | message supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7817)

<a id="static_method-static-method-miniguilib-minigui-dialog-warning-static-function-warning-app-title-message-miniguilib-minigui-ml-406805796"></a>
### warning

```ml
static function warning(app, title, message)
```

Implements warning for Linux dialogs.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | app supplied by the caller. |
| `title` | `dynamic` | — | title supplied by the caller. |
| `message` | `dynamic` | — | message supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7850)

<a id="static_method-static-method-miniguilib-minigui-dialog-yesno-static-function-yesno-app-title-message-miniguilib-minigui-ml-94362612"></a>
### yesNo

```ml
static function yesNo(app, title, message)
```

Implements yesNo for Linux dialogs.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | app supplied by the caller. |
| `title` | `dynamic` | — | title supplied by the caller. |
| `message` | `dynamic` | — | message supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7871)

<a id="static_method-static-method-miniguilib-minigui-dialog-yesnocancel-static-function-yesnocancel-app-title-message-miniguilib-minigui-ml-1637556960"></a>
### yesNoCancel

```ml
static function yesNoCancel(app, title, message)
```

Implements yesNoCancel for Linux dialogs.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `app` | `dynamic` | — | app supplied by the caller. |
| `title` | `dynamic` | — | title supplied by the caller. |
| `message` | `dynamic` | — | message supplied by the caller. |


[View source](https://github.com/MiniLangProject/MiniGui/blob/main/MiniGuiLib/minigui.ml#L7878)
