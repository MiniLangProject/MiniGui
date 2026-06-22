/*
Copyright 2026 Nils Kopal

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

package MiniGuiLib.minigui

extern function CreateWindowExW(
exStyle as int,
className as wstr,
windowName as wstr,
style as int,
x as int,
y as int,
width as int,
height as int,
parent as ptr,
menu as ptr,
instance as ptr,
param as ptr
) from "user32.dll" symbol "CreateWindowExW" returns ptr

extern function RegisterClassW(wndClass as bytes) from "user32.dll" returns u32
extern function GetModuleHandleW(moduleName as ptr) from "kernel32.dll" returns ptr
extern function LoadCursorW(instance as ptr, cursorName as ptr) from "user32.dll" returns ptr
extern function GetLastError() from "kernel32.dll" returns u32
extern function ShowWindow(hwnd as ptr, cmd as int) from "user32.dll" returns bool
extern function UpdateWindow(hwnd as ptr) from "user32.dll" returns bool
extern function DestroyWindow(hwnd as ptr) from "user32.dll" returns bool
extern function IsWindow(hwnd as ptr) from "user32.dll" returns bool
extern function EnableWindow(hwnd as ptr, enable as bool) from "user32.dll" returns bool
extern function SetWindowTextW(hwnd as ptr, text as wstr) from "user32.dll" returns bool
extern function GetWindowTextW(hwnd as ptr, text as bytes, maxCount as int) from "user32.dll" returns int
extern function GetWindowTextLengthW(hwnd as ptr) from "user32.dll" returns int
extern function GetClientRect(hwnd as ptr, rect as bytes) from "user32.dll" returns bool
extern function MoveWindow(hwnd as ptr, x as int, y as int, width as int, height as int, repaint as bool) from "user32.dll" returns bool
extern function RedrawWindow(hwnd as ptr, rect as ptr, region as ptr, flags as u32) from "user32.dll" returns bool
extern function SetScrollRange(hwnd as ptr, bar as int, minimum as int, maximum as int, redraw as bool) from "user32.dll" returns bool
extern function SetScrollPos(hwnd as ptr, bar as int, position as int, redraw as bool) from "user32.dll" returns int
extern function SetTimer(hwnd as ptr, timerId as u32, elapsedMs as u32, timerProc as ptr) from "user32.dll" returns ptr
extern function SetWindowLongPtrW(hwnd as ptr, index as int, newLong as ptr) from "user32.dll" returns ptr
extern function GetWindowLongPtrW(hwnd as ptr, index as int) from "user32.dll" returns ptr
extern function SendMessageW(hwnd as ptr, msg as u32, wParam as ptr, lParam as ptr) from "user32.dll" returns ptr
extern function SendMessageTextW(hwnd as ptr, msg as u32, wParam as ptr, lParam as wstr) from "user32.dll" symbol "SendMessageW" returns ptr
extern function LoadImageW(instance as ptr, name as wstr, imageType as u32, width as int, height as int, flags as u32) from "user32.dll" returns ptr
extern function MessageBoxW(hwnd as ptr, text as wstr, caption as wstr, flags as u32) from "user32.dll" returns int
extern function CallWindowProcW(prev as ptr, hwnd as ptr, msg as u32, wParam as ptr, lParam as ptr) from "user32.dll" symbol "CallWindowProcW" returns ptr
extern function DefWindowProcW(hwnd as ptr, msg as u32, wParam as ptr, lParam as ptr) from "user32.dll" returns ptr
extern function RtlMoveMemory(dest as bytes, src as ptr, size as int) from "kernel32.dll" returns void
extern function PostQuitMessage(exitCode as int) from "user32.dll" returns void
extern function GetMessageW(msg as bytes, hwnd as ptr, msgMin as u32, msgMax as u32) from "user32.dll" returns int
extern function TranslateMessage(msg as bytes) from "user32.dll" returns bool
extern function DispatchMessageW(msg as bytes) from "user32.dll" returns ptr
extern function InitCommonControls() from "comctl32.dll" returns void

const GWLP_WNDPROC = -4
const GWLP_USERDATA = -21
const ERROR_CLASS_ALREADY_EXISTS = 1410
const WM_SIZE = 5
const WM_TIMER = 275
const WM_DESTROY = 2
const WM_CLOSE = 16
const WM_COMMAND = 273
const WM_NOTIFY = 78
const WM_HSCROLL = 276
const WM_VSCROLL = 277
const WM_MOUSEWHEEL = 522
const WM_LBUTTONUP = 514
const BN_CLICKED = 0
const EN_CHANGE = 768
const EM_LIMITTEXT = 197
const EM_SETREADONLY = 207
const BM_GETCHECK = 240
const BM_SETCHECK = 241
const BST_CHECKED = 1
const CB_ADDSTRING = 323
const CB_GETCURSEL = 327
const CB_GETLBTEXT = 328
const CB_GETLBTEXTLEN = 329
const CB_RESETCONTENT = 331
const CB_SETCURSEL = 334
const CBN_SELCHANGE = 1
const LB_ADDSTRING = 384
const LB_SETCURSEL = 390
const LB_GETCURSEL = 392
const LB_GETTEXT = 393
const LB_GETTEXTLEN = 394
const LB_RESETCONTENT = 388
const LBN_SELCHANGE = 1
const LVM_GETITEMCOUNT = 4100
const LVM_DELETEALLITEMS = 4105
const LVM_GETNEXTITEM = 4108
const LVM_SETITEMSTATE = 4139
const LVM_INSERTITEMW = 4173
const LVM_INSERTCOLUMNW = 4193
const LVN_ITEMCHANGED = -101
const LVIF_TEXT = 1
const LVCF_TEXT = 4
const LVCF_WIDTH = 2
const LVCF_SUBITEM = 8
const LVIS_FOCUSED = 1
const LVIS_SELECTED = 2
const LVNI_SELECTED = 2
const PBM_SETPOS = 1026
const PBM_SETRANGE32 = 1030
const SBM_SETPOS = 224
const SBM_GETPOS = 225
const SBM_SETRANGE = 226
const TCM_INSERTITEMW = 4926
const TCM_GETITEMCOUNT = 4868
const TCM_GETCURSEL = 4875
const TCM_SETCURSEL = 4876
const TCM_HITTEST = 4877
const TCIF_TEXT = 1
const TCN_SELCHANGE = -551
const TBM_GETPOS = 1024
const TBM_SETPOS = 1029
const TBM_SETRANGEMIN = 1031
const TBM_SETRANGEMAX = 1032
const TBM_SETPAGESIZE = 1045
const TBM_SETLINESIZE = 1047
const TVM_DELETEITEM = 4353
const TVM_INSERTITEMW = 4402
const TVN_SELCHANGEDW = -451
const TVIF_TEXT = 1
const TVI_ROOT = 4294901760
const TVI_LAST = 4294901762
const SB_SETTEXTW = 1035
const SB_GETTEXTW = 1037
const SB_LINEUP = 0
const SB_LINEDOWN = 1
const SB_PAGEUP = 2
const SB_PAGEDOWN = 3
const SB_THUMBPOSITION = 4
const SB_THUMBTRACK = 5
const SB_TOP = 6
const SB_BOTTOM = 7
const SB_VERT = 1
const IDC_ARROW = 32512
const WS_OVERLAPPEDWINDOW = 13565952
const WS_VISIBLE = 268435456
const WS_CHILD = 1073741824
const WS_CLIPCHILDREN = 33554432
const WS_BORDER = 8388608
const WS_VSCROLL = 2097152
const WS_HSCROLL = 1048576
const ES_AUTOHSCROLL = 128
const ES_MULTILINE = 4
const ES_AUTOVSCROLL = 64
const ES_WANTRETURN = 4096
const ES_PASSWORD = 32
const ES_NUMBER = 8192
const SS_LEFT = 0
const SS_CENTERIMAGE = 512
const SS_NOTIFY = 256
const SS_ETCHEDHORZ = 16
const SS_ETCHEDVERT = 17
const STM_SETIMAGE = 370
const IMAGE_BITMAP = 0
const LR_LOADFROMFILE = 16
const BS_PUSHBUTTON = 0
const BS_AUTOCHECKBOX = 3
const BS_AUTORADIOBUTTON = 9
const BS_GROUPBOX = 7
const CBS_DROPDOWNLIST = 3
const CBS_HASSTRINGS = 512
const LBS_NOTIFY = 1
const LVS_REPORT = 1
const LVS_SINGLESEL = 4
const SBS_HORZ = 0
const SBS_VERT = 1
const TVS_HASLINES = 2
const TVS_LINESATROOT = 4
const TVS_HASBUTTONS = 1
const TBS_AUTOTICKS = 1
const TBS_VERT = 2
const DTS_SHORTDATEFORMAT = 0
const SW_SHOW = 5
const COLOR_BTNFACE = 15
const RDW_INVALIDATE = 1
const RDW_ERASE = 4
const RDW_ALLCHILDREN = 128
const RDW_UPDATENOW = 256
const MB_OK = 0
const MB_OKCANCEL = 1
const MB_ICONERROR = 16
const MB_ICONQUESTION = 32
const MB_ICONWARNING = 48
const MB_ICONINFORMATION = 64
const IDOK = 1

_activeApp = void
_windowProcPtr = 0
_timerProcPtr = 0
_oldWindowProcPtr = 0
_subclassHandles = []
_subclassOldProcs = []
_resizeInitializedWindows = []
_windowClassRegistered = false
_windowClassNameBytes = void

function _writeU32LE(buf, off, value)
  buf[off] = value & 255
  buf[off + 1] = (value >> 8) & 255
  buf[off + 2] = (value >> 16) & 255
  buf[off + 3] = (value >> 24) & 255
  return buf
end function

function _writePtrLE(buf, off, value)
  buf[off] = value & 255
  buf[off + 1] = (value >> 8) & 255
  buf[off + 2] = (value >> 16) & 255
  buf[off + 3] = (value >> 24) & 255
  buf[off + 4] = (value >> 32) & 255
  buf[off + 5] = (value >> 40) & 255
  buf[off + 6] = (value >> 48) & 255
  buf[off + 7] = (value >> 56) & 255
  return buf
end function

function _readI32LE(buf, off)
  value = buf[off] | (buf[off + 1] << 8) | (buf[off + 2] << 16) | (buf[off + 3] << 24)
  return value
end function

function _readS32LE(buf, off)
  value = _readI32LE(buf, off)
  if value >= 2147483648 then return value - 4294967296 end if
  return value
end function

function _readPtrLE(buf, off)
  value = buf[off] | (buf[off + 1] << 8) | (buf[off + 2] << 16) | (buf[off + 3] << 24)
  value = value | (buf[off + 4] << 32) | (buf[off + 5] << 40) | (buf[off + 6] << 48) | (buf[off + 7] << 56)
  return value
end function

function _asInt(value)
  text = "" + value
  intText = ""
  if len(text) > 0 then
    for i = 0 to len(text) - 1
      ch = text[i]
      if ch == "." then break end if
      intText = intText + ch
    end for
  end if
  if intText == "" or intText == "-" then intText = "0" end if
  n = toNumber(intText)
  if typeof(n) == "int" then return n end if
  return 0
end function

function _joinText(items, separator)
  outv = ""
  if len(items) > 0 then
    for i = 0 to len(items) - 1
      if i > 0 then outv = outv + separator end if
      outv = outv + items[i]
    end for
  end if
  return outv
end function

function _asciiUtf16Z(text)
  outv = bytes((len(text) + 1) * 2, 0)
  for i = 0 to len(text) - 1
    ch = bytes(text[i])
    if len(ch) > 0 then
      outv[i * 2] = ch[0]
    end if
  end for
  return outv
end function

function _defaultWndProc(hwnd, msg, wParam, lParam)
  global _subclassHandles
  global _subclassOldProcs
  if len(_subclassHandles) > 0 then
    for i = 0 to len(_subclassHandles) - 1
      if _subclassHandles[i] == hwnd then
        oldProc = _subclassOldProcs[i]
        if oldProc != 0 then return CallWindowProcW(oldProc, hwnd, msg, wParam, lParam) end if
      end if
    end for
  end if
  global _oldWindowProcPtr
  if _oldWindowProcPtr != 0 then
    return CallWindowProcW(_oldWindowProcPtr, hwnd, msg, wParam, lParam)
  end if
  return DefWindowProcW(hwnd, msg, wParam, lParam)
end function

function _appForWindow(hwnd)
  raw = GetWindowLongPtrW(hwnd, GWLP_USERDATA)
  if raw == 0 then return void end if
  return nativeValueFromRaw(raw)
end function

function _miniGuiWndProc(hwnd, msg, wParam, lParam)
  global _activeApp
  if msg == WM_LBUTTONUP then
    appClick = _activeApp
    if appClick is void then appClick = _appForWindow(hwnd) end if
    if appClick is void == false then
      if Events.isControlKind(appClick, hwnd, "TabControl") then
        tabClickX = lParam & 65535
        tabClickY = (lParam >> 16) & 65535
        if Events.dispatchTabClickedByHandle(appClick, hwnd, tabClickX, tabClickY) then
          return 0
        end if
        return _defaultWndProc(hwnd, msg, wParam, lParam)
      end if
      if Events.dispatchClickByHandle(appClick, hwnd) then
        return 0
      end if
    end if
    return _defaultWndProc(hwnd, msg, wParam, lParam)
  end if

  if msg == WM_COMMAND then
    app = _activeApp
    if app is void then app = _appForWindow(hwnd) end if
    if app is void then return _defaultWndProc(hwnd, msg, wParam, lParam) end if
    code = (wParam >> 16) & 65535
    nativeId = wParam & 65535
    if Events.dispatchCommand(app, code, nativeId, lParam) then
      return 0
    end if
    return _defaultWndProc(hwnd, msg, wParam, lParam)
  end if

  if msg == WM_NOTIFY then
    appNotify = _activeApp
    if appNotify is void then appNotify = _appForWindow(hwnd) end if
    if appNotify is void then return _defaultWndProc(hwnd, msg, wParam, lParam) end if
    if lParam != 0 then
      notifyHeader = bytes(24, 0)
      RtlMoveMemory(notifyHeader, lParam, 24)
      hwndFrom = _readPtrLE(notifyHeader, 0)
      notifyCode = _readS32LE(notifyHeader, 16)
      if Events.dispatchNotify(appNotify, hwndFrom, wParam, notifyCode) then
        return 0
      end if
    end if
    return _defaultWndProc(hwnd, msg, wParam, lParam)
  end if

  if msg == WM_HSCROLL or msg == WM_VSCROLL then
    appScroll = _activeApp
    if appScroll is void then appScroll = _appForWindow(hwnd) end if
    if appScroll is void then return _defaultWndProc(hwnd, msg, wParam, lParam) end if
    codeScroll = wParam & 65535
    posScroll = (wParam >> 16) & 65535
    if Events.dispatchScroll(appScroll, codeScroll, posScroll, lParam) then
      return 0
    end if
    if lParam == 0 then
      if Events.dispatchScrollViewer(appScroll, hwnd, codeScroll, posScroll) then
        return 0
      end if
    end if
    return _defaultWndProc(hwnd, msg, wParam, lParam)
  end if

  if msg == WM_MOUSEWHEEL then
    appWheel = _activeApp
    if appWheel is void then appWheel = _appForWindow(hwnd) end if
    if appWheel is void then return _defaultWndProc(hwnd, msg, wParam, lParam) end if
    wheelCode = SB_LINEDOWN
    wheelDelta = (wParam >> 16) & 65535
    if wheelDelta > 32767 then wheelDelta = wheelDelta - 65536 end if
    if wheelDelta > 0 then wheelCode = SB_LINEUP end if
    if Events.dispatchScrollViewer(appWheel, hwnd, wheelCode, 0) then
      return 0
    end if
    return _defaultWndProc(hwnd, msg, wParam, lParam)
  end if

  if msg == WM_SIZE then
    appSize = _activeApp
    if appSize is void then appSize = _appForWindow(hwnd) end if
    if appSize is void == false then
      widthSize = _asInt(lParam & 65535)
      heightSize = _asInt((lParam >> 16) & 65535)
      winSize = Events.findWindowByHandle(appSize, hwnd)
      if winSize is void == false then
        Application.resizeWindow(appSize, winSize, widthSize, heightSize)
      end if
    end if
    return 0
  end if

  if msg == WM_CLOSE then
    appClose = _activeApp
    if appClose is void then appClose = _appForWindow(hwnd) end if
    if appClose is void == false then
      win = Events.findWindowByHandle(appClose, hwnd)
      if Events.dispatchClose(appClose, win) then
        return 0
      end if
      appClose.running = false
    end if
    DestroyWindow(hwnd)
    return 0
  end if

  if msg == WM_DESTROY then
    appDestroy = _activeApp
    if appDestroy is void then appDestroy = _appForWindow(hwnd) end if
    if appDestroy is void == false then
      appDestroy.running = false
    end if
    PostQuitMessage(0)
    return 0
  end if

  return _defaultWndProc(hwnd, msg, wParam, lParam)
end function

function _registerWindowClass()
  global _windowClassRegistered
  global _windowClassNameBytes
  if _windowClassRegistered then return true end if

  cb = _ensureWindowProc()
  if cb == 0 then return false end if

  _windowClassNameBytes = _asciiUtf16Z("MiniGuiWindow")
  namePtr = nativeBytesPtr(_windowClassNameBytes)
  if namePtr == 0 then return false end if

  cls = bytes(72, 0)
  _writeU32LE(cls, 0, 0)
  _writePtrLE(cls, 8, cb)
  _writeU32LE(cls, 16, 0)
  _writeU32LE(cls, 20, 0)
  _writePtrLE(cls, 24, GetModuleHandleW(void))
  _writePtrLE(cls, 32, 0)
  _writePtrLE(cls, 40, LoadCursorW(void, IDC_ARROW))
  _writePtrLE(cls, 48, COLOR_BTNFACE + 1)
  _writePtrLE(cls, 56, 0)
  _writePtrLE(cls, 64, namePtr)

  atom = RegisterClassW(cls)
  if atom != 0 or GetLastError() == ERROR_CLASS_ALREADY_EXISTS then
    _windowClassRegistered = true
  end if
  return _windowClassRegistered
end function

function _ensureWindowProc()
  global _windowProcPtr
  if _windowProcPtr == 0 then
    _windowProcPtr = nativeCallback(_miniGuiWndProc, "wndproc")
  end if
  return _windowProcPtr
end function

function _miniGuiTimerProc(hwnd, msg, wParam, lParam)
  global _activeApp
  if _activeApp is void == false then
    Application.pollResize(_activeApp)
  end if
  return 0
end function

function _ensureTimerProc()
  global _timerProcPtr
  if _timerProcPtr == 0 then
    _timerProcPtr = nativeCallback(_miniGuiTimerProc, "wndproc")
  end if
  return _timerProcPtr
end function

function _installWindowProc(hwnd)
  cb = _ensureWindowProc()
  return _installSpecificWindowProc(hwnd, cb)
end function

function _installSpecificWindowProc(hwnd, cb)
  global _oldWindowProcPtr
  global _subclassHandles
  global _subclassOldProcs
  if cb == 0 then return false end if
  oldProc = SetWindowLongPtrW(hwnd, GWLP_WNDPROC, cb)
  if oldProc != 0 and oldProc != cb then
    found = false
    if len(_subclassHandles) > 0 then
      for i = 0 to len(_subclassHandles) - 1
        if _subclassHandles[i] == hwnd then
          _subclassOldProcs[i] = oldProc
          found = true
        end if
      end for
    end if
    if found == false then
      _subclassHandles = _subclassHandles + [hwnd]
      _subclassOldProcs = _subclassOldProcs + [oldProc]
    end if
  end if
  return true
end function

struct Event
  sender,
  eventType,
  oldValue,
  newValue,
  cancel,
end struct

struct Binding
  control,
  callback,
  context,
  eventType,
end struct

struct NativeControl
  id,
  kind,
  handle,
  nativeId,
  text,
  x,
  y,
  width,
  height,
  visible,
  enabled,
  lastText,
  lastSelection,
  scrollMin,
  scrollMax,
  scrollValue,
  smallStep,
  largeStep,
  baseX,
  baseY,
  baseWidth,
  baseHeight,
  baseClientWidth,
  baseClientHeight,
  parent,
  baseParentWidth,
  baseParentHeight,
end struct

struct ApplicationState
  windows,
  controls,
  clickBindings,
  textBindings,
  selectionBindings,
  scrollBindings,
  loadBindings,
  closeBindings,
  resizeBindings,
  startupWindow,
  nextNativeId,
  running,
end struct

struct Application
  static function create()
    return ApplicationState([], [], [], [], [], [], [], [], [], void, 1000, false)
  end function

  static function addWindow(app, window)
    global _activeApp
    _activeApp = app
    app.windows = app.windows + [window]
    if app.startupWindow is void then
      app.startupWindow = window
    end if
    return window
  end function

  static function addControl(app, control)
    app.controls = app.controls + [control]
    if control is void == false then
      if control.parent is void == false then
        if control.parent.kind == "TabControl" then
          Control.updateTabPages(app, control.parent)
        end if
        if control.parent.kind == "ScrollViewer" then
          Control.updateScrollViewer(app, control.parent)
        end if
      end if
    end if
    return control
  end function

  static function setStartupWindow(app, window)
    app.startupWindow = window
    return window
  end function

  static function windowProc(hwnd, msg, wParam, lParam)
    return _miniGuiWndProc(hwnd, msg, wParam, lParam)
  end function

  static function timerProc(hwnd, msg, wParam, lParam)
    return _miniGuiTimerProc(hwnd, msg, wParam, lParam)
  end function

  static function resizeWindow(app, window, clientWidth, clientHeight)
    if app is void then return false end if
    if window is void then return false end if
    if window.baseClientWidth <= 0 then return false end if
    if window.baseClientHeight <= 0 then return false end if
    global _resizeInitializedWindows
    initialized = false
    if len(_resizeInitializedWindows) > 0 then
      for initIdx = 0 to len(_resizeInitializedWindows) - 1
        if _resizeInitializedWindows[initIdx] == window.handle then initialized = true end if
      end for
    end if
    if initialized == false then
      _resizeInitializedWindows = _resizeInitializedWindows + [window.handle]
      window.width = clientWidth
      window.height = clientHeight
      window.baseClientWidth = clientWidth
      window.baseClientHeight = clientHeight
      window.baseParentWidth = clientWidth
      window.baseParentHeight = clientHeight
      if len(app.controls) > 0 then
        for baseIdx = 0 to len(app.controls) - 1
          baseControl = app.controls[baseIdx]
          if baseControl is void == false then
            baseControl.baseX = baseControl.x
            baseControl.baseY = baseControl.y
            baseControl.baseWidth = baseControl.width
            baseControl.baseHeight = baseControl.height
            if baseControl.parent is void == false then
              baseControl.baseParentWidth = baseControl.parent.width
              baseControl.baseParentHeight = baseControl.parent.height
            end if
          end if
        end for
      end if
      Application.syncDynamicControls(app)
      RedrawWindow(window.handle, void, void, RDW_INVALIDATE | RDW_ERASE | RDW_ALLCHILDREN | RDW_UPDATENOW)
      return true
    end if
    oldSize = [window.width, window.height]
    window.width = clientWidth
    window.height = clientHeight
    if len(app.controls) > 0 then
      for i = 0 to len(app.controls) - 1
        c = app.controls[i]
        if c is void == false then
          parentWidth = clientWidth
          parentHeight = clientHeight
          if c.parent is void == false then
            parentWidth = c.parent.width
            parentHeight = c.parent.height
          end if
          baseParentWidth = c.baseParentWidth
          baseParentHeight = c.baseParentHeight
          if baseParentWidth <= 0 then baseParentWidth = window.baseClientWidth end if
          if baseParentHeight <= 0 then baseParentHeight = window.baseClientHeight end if
          nx = c.baseX * parentWidth / baseParentWidth
          ny = c.baseY * parentHeight / baseParentHeight
          nw = c.baseWidth * parentWidth / baseParentWidth
          nh = c.baseHeight * parentHeight / baseParentHeight
          if nw < 1 then nw = 1 end if
          if nh < 1 then nh = 1 end if
          Control.moveCurrent(c, nx, ny, nw, nh)
        end if
      end for
      for j = 0 to len(app.controls) - 1
        rc = app.controls[j]
        if rc is void == false then
          if rc.kind == "TabControl" then Control.updateTabPages(app, rc) end if
          if rc.kind == "ScrollViewer" then Control.updateScrollViewer(app, rc) end if
        end if
      end for
    end if
    Events.dispatchResize(app, window, oldSize, [clientWidth, clientHeight])
    RedrawWindow(window.handle, void, void, RDW_INVALIDATE | RDW_ERASE | RDW_ALLCHILDREN | RDW_UPDATENOW)
    return true
  end function

  static function pollResize(app)
    if app is void then return false end if
    if len(app.windows) == 0 then return false end if
    for widx = 0 to len(app.windows) - 1
      win = app.windows[widx]
      if win is void == false and win.handle is void == false then
        rect = bytes(16, 0)
        if GetClientRect(win.handle, rect) then
          left = _readI32LE(rect, 0)
          top = _readI32LE(rect, 4)
          right = _readI32LE(rect, 8)
          bottom = _readI32LE(rect, 12)
          cw = right - left
          ch = bottom - top
          if cw > 0 and ch > 0 then
            if cw != win.width or ch != win.height then
              Application.resizeWindow(app, win, cw, ch)
            end if
          end if
        end if
      end if
    end for
    return true
  end function

  static function syncDynamicControls(app)
    if app is void then return false end if
    if len(app.controls) == 0 then return false end if
    for i = 0 to len(app.controls) - 1
      c = app.controls[i]
      if c is void == false then
        if c.kind == "TabControl" then Control.updateTabPages(app, c) end if
        if c.kind == "ScrollViewer" then Control.updateScrollViewer(app, c) end if
      end if
    end for
    return true
  end function

  static function redrawAll(app)
    if app is void then return false end if
    if len(app.controls) > 0 then
      for i = 0 to len(app.controls) - 1
        c = app.controls[i]
        if c is void == false then
          if c.handle is void == false then
            RedrawWindow(c.handle, void, void, RDW_INVALIDATE | RDW_ERASE | RDW_ALLCHILDREN | RDW_UPDATENOW)
          end if
        end if
      end for
    end if
    if len(app.windows) > 0 then
      for w = 0 to len(app.windows) - 1
        win = app.windows[w]
        if win is void == false then
          if win.handle is void == false then
            RedrawWindow(win.handle, void, void, RDW_INVALIDATE | RDW_ERASE | RDW_ALLCHILDREN | RDW_UPDATENOW)
          end if
        end if
      end for
    end if
    return true
  end function

  static function run(app)
    global _activeApp
    if app is void then return 1 end if
    if app.startupWindow is void then return 0 end if
    if app.startupWindow.handle is void then return 2 end if

    _activeApp = app
    Application.syncDynamicControls(app)
    app.running = true
    msg = bytes(48, 0)

    while app.running and IsWindow(app.startupWindow.handle)
      rc = GetMessageW(msg, void, 0, 0)
      if rc <= 0 then
        app.running = false
      else
        TranslateMessage(msg)
        DispatchMessageW(msg)
        Application.pollResize(app)
      end if
    end while

    app.running = false
    return 0
  end function
end struct

struct Window
  static function create(app, id, title, width, height)
    if width <= 0 then width = 640 end if
    if height <= 0 then height = 400 end if
    useRegistered = _registerWindowClass()
    className = "MiniGuiWindow"
    if useRegistered == false then className = "#32770" end if
    hwnd = CreateWindowExW(0, className, title, WS_OVERLAPPEDWINDOW, 100, 100, width, height, void, void, void, void)
    if hwnd == 0 and useRegistered then
      hwnd = CreateWindowExW(0, "#32770", title, WS_OVERLAPPEDWINDOW, 100, 100, width, height, void, void, void, void)
      useRegistered = false
    end if
    if hwnd != 0 then SetWindowLongPtrW(hwnd, GWLP_USERDATA, nativeRawValue(app)) end if
    if hwnd != 0 then _installWindowProc(hwnd) end if
    clientWidth = width
    clientHeight = height
    if hwnd != 0 then
      rect = bytes(16, 0)
      if GetClientRect(hwnd, rect) then
        clientWidth = _readI32LE(rect, 8) - _readI32LE(rect, 0)
        clientHeight = _readI32LE(rect, 12) - _readI32LE(rect, 4)
      end if
    end if
    if clientWidth <= 0 then clientWidth = width end if
    if clientHeight <= 0 then clientHeight = height end if
    win = NativeControl(id, "Window", hwnd, 0, title, 100, 100, clientWidth, clientHeight, true, true, title, -1, 0, 100, 0, 1, 10, 100, 100, clientWidth, clientHeight, clientWidth, clientHeight, void, clientWidth, clientHeight)
    Application.addWindow(app, win)
    return win
  end function

  static function show(window)
    if window is void then return false end if
    if window.handle is void then return false end if
    global _activeApp
    if _activeApp is void == false then Application.syncDynamicControls(_activeApp) end if
    SetTimer(window.handle, 1, 100, _ensureTimerProc())
    ShowWindow(window.handle, SW_SHOW)
    UpdateWindow(window.handle)
    Events.dispatchLoad(window)
    if _activeApp is void == false then Application.redrawAll(_activeApp) end if
    return true
  end function

  static function installProc(window, callback)
    global _oldWindowProcPtr
    if window is void then return false end if
    if window.handle is void then return false end if
    if callback == 0 then return false end if
    SetWindowLongPtrW(window.handle, GWLP_WNDPROC, callback)
    _oldWindowProcPtr = 0
    return true
  end function

  static function startResizeTimer(window, callback)
    if window is void then return false end if
    if window.handle is void then return false end if
    return SetTimer(window.handle, 1, 100, callback) != 0
  end function

  static function close(window)
    if window is void then return false end if
    if window.handle is void then return false end if
    return DestroyWindow(window.handle)
  end function

  static function setTitle(window, title)
    return Control.setText(window, title)
  end function

  static function getClientWidth(window)
    if window is void then return 0 end if
    if window.handle is void then return 0 end if
    rect = bytes(16, 0)
    if GetClientRect(window.handle, rect) == false then return window.width end if
    return _readI32LE(rect, 8) - _readI32LE(rect, 0)
  end function

  static function getClientHeight(window)
    if window is void then return 0 end if
    if window.handle is void then return 0 end if
    rect = bytes(16, 0)
    if GetClientRect(window.handle, rect) == false then return window.height end if
    return _readI32LE(rect, 12) - _readI32LE(rect, 4)
  end function
end struct

struct Dialog
  static function _owner(app)
    if app is void then return void end if
    if app.startupWindow is void then return void end if
    return app.startupWindow.handle
  end function

  static function showInfo(app, title, message)
    return MessageBoxW(Dialog._owner(app), message, title, MB_OK | MB_ICONINFORMATION)
  end function

  static function showWarning(app, title, message)
    return MessageBoxW(Dialog._owner(app), message, title, MB_OK | MB_ICONWARNING)
  end function

  static function showError(app, title, message)
    return MessageBoxW(Dialog._owner(app), message, title, MB_OK | MB_ICONERROR)
  end function

  static function confirm(app, title, message)
    return MessageBoxW(Dialog._owner(app), message, title, MB_OKCANCEL | MB_ICONQUESTION) == IDOK
  end function

  static function pickOpenFile(app, title, filter)
    return ""
  end function

  static function pickSaveFile(app, title, filter)
    return ""
  end function

  static function pickFolder(app, title)
    return ""
  end function

  static function pickColor(app, title, fallback)
    return fallback
  end function
end struct

struct Label
  static function create(app, parent, id, text, x, y, width, height)
    hwnd = CreateWindowExW(0, "STATIC", text, WS_CHILD | WS_VISIBLE | SS_LEFT, x, y, width, height, parent.handle, void, void, void)
    c = NativeControl(id, "Label", hwnd, 0, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

struct Button
  static function create(app, parent, id, text, x, y, width, height)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    hwnd = CreateWindowExW(0, "BUTTON", text, WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON, x, y, width, height, parent.handle, nid, void, void)
    c = NativeControl(id, "Button", hwnd, nid, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

struct TextBox
  static function create(app, parent, id, text, x, y, width, height)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    style = WS_CHILD | WS_VISIBLE | WS_BORDER | ES_AUTOHSCROLL
    hwnd = CreateWindowExW(0, "EDIT", text, style, x, y, width, height, parent.handle, nid, void, void)
    c = NativeControl(id, "TextBox", hwnd, nid, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

struct TextArea
  static function create(app, parent, id, text, x, y, width, height)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    style = WS_CHILD | WS_VISIBLE | WS_BORDER | WS_VSCROLL | ES_MULTILINE | ES_AUTOVSCROLL | ES_WANTRETURN
    hwnd = CreateWindowExW(0, "EDIT", text, style, x, y, width, height, parent.handle, nid, void, void)
    c = NativeControl(id, "TextArea", hwnd, nid, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

struct PasswordBox
  static function create(app, parent, id, text, x, y, width, height)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    style = WS_CHILD | WS_VISIBLE | WS_BORDER | ES_AUTOHSCROLL | ES_PASSWORD
    hwnd = CreateWindowExW(0, "EDIT", text, style, x, y, width, height, parent.handle, nid, void, void)
    c = NativeControl(id, "PasswordBox", hwnd, nid, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

struct NumberBox
  static function create(app, parent, id, text, x, y, width, height, minimum, maximum, value, step)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    style = WS_CHILD | WS_VISIBLE | WS_BORDER | ES_AUTOHSCROLL | ES_NUMBER
    startText = text
    if startText == "" then startText = "" + value end if
    hwnd = CreateWindowExW(0, "EDIT", startText, style, x, y, width, height, parent.handle, nid, void, void)
    c = NativeControl(id, "NumberBox", hwnd, nid, startText, x, y, width, height, true, true, startText, -1, minimum, maximum, value, step, step, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

struct CheckBox
  static function create(app, parent, id, text, x, y, width, height, checked)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    hwnd = CreateWindowExW(0, "BUTTON", text, WS_CHILD | WS_VISIBLE | BS_AUTOCHECKBOX, x, y, width, height, parent.handle, nid, void, void)
    if checked then SendMessageW(hwnd, BM_SETCHECK, BST_CHECKED, 0) end if
    c = NativeControl(id, "CheckBox", hwnd, nid, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

struct RadioButton
  static function create(app, parent, id, text, x, y, width, height, checked)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    hwnd = CreateWindowExW(0, "BUTTON", text, WS_CHILD | WS_VISIBLE | BS_AUTORADIOBUTTON, x, y, width, height, parent.handle, nid, void, void)
    if checked then SendMessageW(hwnd, BM_SETCHECK, BST_CHECKED, 0) end if
    c = NativeControl(id, "RadioButton", hwnd, nid, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

struct Image
  static function create(app, parent, id, text, x, y, width, height, source, stretch)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    label = text
    if label == "" then label = source end if
    hwnd = CreateWindowExW(0, "STATIC", label, WS_CHILD | WS_VISIBLE | SS_LEFT | SS_CENTERIMAGE | SS_NOTIFY, x, y, width, height, parent.handle, nid, void, void)
    if source != "" then
      bmp = LoadImageW(void, source, IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE)
      if bmp != 0 then SendMessageW(hwnd, STM_SETIMAGE, IMAGE_BITMAP, bmp) end if
    end if
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "Image", hwnd, nid, label, x, y, width, height, true, true, label, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

struct Separator
  static function create(app, parent, id, text, x, y, width, height, orientation)
    style = WS_CHILD | WS_VISIBLE | SS_ETCHEDHORZ
    if orientation == "vertical" then style = WS_CHILD | WS_VISIBLE | SS_ETCHEDVERT end if
    hwnd = CreateWindowExW(0, "STATIC", text, style, x, y, width, height, parent.handle, void, void, void)
    c = NativeControl(id, "Separator", hwnd, 0, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

struct LinkLabel
  static function create(app, parent, id, text, x, y, width, height, url)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    label = text
    if label == "" then label = url end if
    hwnd = CreateWindowExW(0, "STATIC", label, WS_CHILD | WS_VISIBLE | SS_LEFT | SS_NOTIFY, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "LinkLabel", hwnd, nid, label, x, y, width, height, true, true, label, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

struct Panel
  static function create(app, parent, id, text, x, y, width, height)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    hwnd = CreateWindowExW(0, "STATIC", text, WS_CHILD | WS_VISIBLE, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "Panel", hwnd, nid, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

struct ScrollViewer
  static function create(app, parent, id, text, x, y, width, height, horizontalScroll, verticalScroll)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    style = WS_CHILD | WS_VISIBLE | WS_BORDER
    if horizontalScroll then style = style | WS_HSCROLL end if
    if verticalScroll then style = style | WS_VSCROLL end if
    hwnd = CreateWindowExW(0, "STATIC", text, style, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    if hwnd != 0 then SetScrollRange(hwnd, SB_VERT, 0, 0, true) end if
    c = NativeControl(id, "ScrollViewer", hwnd, nid, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

struct GroupBox
  static function create(app, parent, id, text, x, y, width, height)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    hwnd = CreateWindowExW(0, "BUTTON", text, WS_CHILD | WS_VISIBLE | BS_GROUPBOX, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "GroupBox", hwnd, nid, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

struct ScrollBar
  static function create(app, parent, id, text, x, y, width, height, orientation, minimum, maximum, value, smallStep, largeStep)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    style = WS_CHILD | WS_VISIBLE | SBS_VERT
    if orientation == "horizontal" then style = WS_CHILD | WS_VISIBLE | SBS_HORZ end if
    hwnd = CreateWindowExW(0, "SCROLLBAR", text, style, x, y, width, height, parent.handle, nid, void, void)
    c = NativeControl(id, "ScrollBar", hwnd, nid, text, x, y, width, height, true, true, text, -1, minimum, maximum, value, smallStep, largeStep, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    Control.setScrollRange(c, minimum, maximum)
    Control.setScrollValue(c, value)
    return Application.addControl(app, c)
  end function
end struct

struct Slider
  static function create(app, parent, id, text, x, y, width, height, orientation, minimum, maximum, value, smallStep, largeStep)
    InitCommonControls()
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    style = WS_CHILD | WS_VISIBLE | TBS_AUTOTICKS
    if orientation == "vertical" then style = WS_CHILD | WS_VISIBLE | TBS_AUTOTICKS | TBS_VERT end if
    hwnd = CreateWindowExW(0, "msctls_trackbar32", text, style, x, y, width, height, parent.handle, nid, void, void)
    c = NativeControl(id, "Slider", hwnd, nid, text, x, y, width, height, true, true, text, -1, minimum, maximum, value, smallStep, largeStep, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    Control.setScrollRange(c, minimum, maximum)
    Control.setScrollSteps(c, smallStep, largeStep)
    Control.setScrollValue(c, value)
    return Application.addControl(app, c)
  end function
end struct

struct ProgressBar
  static function create(app, parent, id, text, x, y, width, height, minimum, maximum, value)
    InitCommonControls()
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    hwnd = CreateWindowExW(0, "msctls_progress32", text, WS_CHILD | WS_VISIBLE, x, y, width, height, parent.handle, nid, void, void)
    c = NativeControl(id, "ProgressBar", hwnd, nid, text, x, y, width, height, true, true, text, -1, minimum, maximum, value, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    Control.setValueRange(c, minimum, maximum)
    Control.setValue(c, value)
    return Application.addControl(app, c)
  end function
end struct

struct TabControl
  static function create(app, parent, id, text, x, y, width, height, items, selectedIndex)
    InitCommonControls()
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    hwnd = CreateWindowExW(0, "SysTabControl32", text, WS_CHILD | WS_VISIBLE, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "TabControl", hwnd, nid, text, x, y, width, height, true, true, text, selectedIndex, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    if len(items) > 0 then
      for i = 0 to len(items) - 1
        TabControl.addTab(c, i, items[i])
      end for
    end if
    return Application.addControl(app, c)
  end function

  static function addTab(control, index, text)
    if control is void then return false end if
    if control.handle is void then return false end if
    textBytes = _asciiUtf16Z(text)
    item = bytes(40, 0)
    _writeU32LE(item, 0, TCIF_TEXT)
    _writePtrLE(item, 16, nativeBytesPtr(textBytes))
    _writeU32LE(item, 24, len(text))
    SendMessageW(control.handle, TCM_INSERTITEMW, index, nativeBytesPtr(item))
    return true
  end function
end struct

struct MenuBar
  static function create(app, parent, id, text, x, y, width, height, items)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    label = text
    if label == "" and len(items) > 0 then label = "  " + _joinText(items, "    ") end if
    hwnd = CreateWindowExW(0, "STATIC", label, WS_CHILD | WS_VISIBLE | SS_LEFT | SS_NOTIFY, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "MenuBar", hwnd, nid, label, x, y, width, height, true, true, label, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

struct StatusBar
  static function create(app, parent, id, text, x, y, width, height)
    InitCommonControls()
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    hwnd = CreateWindowExW(0, "msctls_statusbar32", text, WS_CHILD | WS_VISIBLE, x, y, width, height, parent.handle, nid, void, void)
    c = NativeControl(id, "StatusBar", hwnd, nid, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

struct ToolBar
  static function create(app, parent, id, text, x, y, width, height, items)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    label = text
    if label == "" and len(items) > 0 then label = "  " + _joinText(items, "  |  ") end if
    hwnd = CreateWindowExW(0, "STATIC", label, WS_CHILD | WS_VISIBLE | SS_LEFT | SS_NOTIFY, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "ToolBar", hwnd, nid, label, x, y, width, height, true, true, label, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

struct TreeView
  static function create(app, parent, id, text, x, y, width, height, items)
    InitCommonControls()
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    hwnd = CreateWindowExW(0, "SysTreeView32", text, WS_CHILD | WS_VISIBLE | WS_BORDER | TVS_HASLINES | TVS_LINESATROOT | TVS_HASBUTTONS, x, y, width, height, parent.handle, nid, void, void)
    c = NativeControl(id, "TreeView", hwnd, nid, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    Control.setItems(c, items)
    return Application.addControl(app, c)
  end function
end struct

struct ListView
  static function create(app, parent, id, text, x, y, width, height, items, selectedIndex)
    InitCommonControls()
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    hwnd = CreateWindowExW(0, "SysListView32", text, WS_CHILD | WS_VISIBLE | WS_BORDER | LVS_REPORT | LVS_SINGLESEL, x, y, width, height, parent.handle, nid, void, void)
    c = NativeControl(id, "ListView", hwnd, nid, text, x, y, width, height, true, true, text, selectedIndex, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    Control.ensureListViewColumn(c)
    Control.setItems(c, items)
    if selectedIndex >= 0 then Control.setSelectedIndex(c, selectedIndex) end if
    c.lastSelection = Control.getSelectedIndex(c)
    return Application.addControl(app, c)
  end function
end struct

struct DatePicker
  static function create(app, parent, id, text, x, y, width, height)
    InitCommonControls()
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    hwnd = CreateWindowExW(0, "SysDateTimePick32", text, WS_CHILD | WS_VISIBLE | DTS_SHORTDATEFORMAT, x, y, width, height, parent.handle, nid, void, void)
    c = NativeControl(id, "DatePicker", hwnd, nid, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

struct ComboBox
  static function create(app, parent, id, text, x, y, width, height, items, selectedIndex)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    style = WS_CHILD | WS_VISIBLE | WS_VSCROLL | CBS_DROPDOWNLIST | CBS_HASSTRINGS
    hwnd = CreateWindowExW(0, "COMBOBOX", text, style, x, y, width, height, parent.handle, nid, void, void)
    c = NativeControl(id, "ComboBox", hwnd, nid, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    Control.setItems(c, items)
    if selectedIndex >= 0 then Control.setSelectedIndex(c, selectedIndex) end if
    c.lastSelection = Control.getSelectedIndex(c)
    return Application.addControl(app, c)
  end function
end struct

struct ListBox
  static function create(app, parent, id, text, x, y, width, height, items, selectedIndex)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    style = WS_CHILD | WS_VISIBLE | WS_BORDER | WS_VSCROLL | LBS_NOTIFY
    hwnd = CreateWindowExW(0, "LISTBOX", text, style, x, y, width, height, parent.handle, nid, void, void)
    c = NativeControl(id, "ListBox", hwnd, nid, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    Control.setItems(c, items)
    if selectedIndex >= 0 then Control.setSelectedIndex(c, selectedIndex) end if
    c.lastSelection = Control.getSelectedIndex(c)
    return Application.addControl(app, c)
  end function
end struct

struct Control
  static function setText(control, text)
    if control is void then return false end if
    control.text = text
    control.lastText = text
    if control.handle is void then return false end if
    if control.kind == "StatusBar" then
      SendMessageTextW(control.handle, SB_SETTEXTW, 0, text)
      return true
    end if
    return SetWindowTextW(control.handle, text)
  end function

  static function getText(control)
    if control is void then return "" end if
    if control.handle is void then return control.text end if
    if control.kind == "StatusBar" then
      sbuf = bytes(1024, 0)
      SendMessageW(control.handle, SB_GETTEXTW, 0, nativeBytesPtr(sbuf))
      stext = decode16Z(sbuf)
      if typeof(stext) == "string" then
        control.text = stext
        return stext
      end if
      return control.text
    end if
    n = GetWindowTextLengthW(control.handle)
    if n < 0 then return control.text end if
    buf = bytes((n + 2) * 2, 0)
    GetWindowTextW(control.handle, buf, n + 1)
    text = decode16Z(buf)
    if typeof(text) == "string" then
      control.text = text
      return text
    end if
    return control.text
  end function

  static function setEnabled(control, enabled)
    if control is void then return false end if
    control.enabled = enabled
    if control.handle is void then return false end if
    return EnableWindow(control.handle, enabled)
  end function

  static function setVisible(control, visible)
    if control is void then return false end if
    control.visible = visible
    if control.handle is void then return false end if
    if visible then
      return ShowWindow(control.handle, SW_SHOW)
    end if
    return ShowWindow(control.handle, 0)
  end function

  static function setReadOnly(control, readOnly)
    if control is void then return false end if
    if control.handle is void then return false end if
    if control.kind == "TextBox" or control.kind == "TextArea" or control.kind == "PasswordBox" or control.kind == "NumberBox" then
      flag = 0
      if readOnly then flag = 1 end if
      SendMessageW(control.handle, EM_SETREADONLY, flag, 0)
      return true
    end if
    return false
  end function

  static function setMaxLength(control, maxLength)
    if control is void then return false end if
    if control.handle is void then return false end if
    if maxLength < 0 then maxLength = 0 end if
    if control.kind == "TextBox" or control.kind == "TextArea" or control.kind == "PasswordBox" or control.kind == "NumberBox" then
      SendMessageW(control.handle, EM_LIMITTEXT, maxLength, 0)
      return true
    end if
    return false
  end function

  static function setBounds(control, x, y, width, height)
    if control is void then return false end if
    control.baseX = x
    control.baseY = y
    control.baseWidth = width
    control.baseHeight = height
    return Control.moveCurrent(control, x, y, width, height)
  end function

  static function moveCurrent(control, x, y, width, height)
    if control is void then return false end if
    x = _asInt(x)
    y = _asInt(y)
    width = _asInt(width)
    height = _asInt(height)
    control.x = x
    control.y = y
    control.width = width
    control.height = height
    if control.handle is void then return false end if
    return MoveWindow(control.handle, x, y, width, height, true)
  end function

  static function setPosition(control, x, y)
    if control is void then return false end if
    return Control.setBounds(control, x, y, control.width, control.height)
  end function

  static function setSize(control, width, height)
    if control is void then return false end if
    return Control.setBounds(control, control.x, control.y, width, height)
  end function

  static function isChecked(control)
    if control is void then return false end if
    if control.handle is void then return false end if
    return SendMessageW(control.handle, BM_GETCHECK, 0, 0) == BST_CHECKED
  end function

  static function setChecked(control, checked)
    if control is void then return false end if
    if control.handle is void then return false end if
    state = 0
    if checked then state = BST_CHECKED end if
    SendMessageW(control.handle, BM_SETCHECK, state, 0)
    return true
  end function

  static function clearItems(control)
    if control is void then return false end if
    if control.handle is void then return false end if
    if control.kind == "ComboBox" then
      SendMessageW(control.handle, CB_RESETCONTENT, 0, 0)
      control.lastSelection = -1
      return true
    end if
    if control.kind == "ListBox" then
      SendMessageW(control.handle, LB_RESETCONTENT, 0, 0)
      control.lastSelection = -1
      return true
    end if
    if control.kind == "ListView" then
      SendMessageW(control.handle, LVM_DELETEALLITEMS, 0, 0)
      control.lastSelection = -1
      return true
    end if
    if control.kind == "TreeView" then
      SendMessageW(control.handle, TVM_DELETEITEM, 0, TVI_ROOT)
      control.lastSelection = -1
      return true
    end if
    return false
  end function

  static function addItem(control, text)
    if control is void then return -1 end if
    if control.handle is void then return -1 end if
    if control.kind == "ComboBox" then return SendMessageTextW(control.handle, CB_ADDSTRING, 0, text) end if
    if control.kind == "ListBox" then return SendMessageTextW(control.handle, LB_ADDSTRING, 0, text) end if
    if control.kind == "ListView" then return Control.addListViewItem(control, text) end if
    if control.kind == "TreeView" then return Control.addTreeViewItem(control, text) end if
    return -1
  end function

  static function ensureListViewColumn(control)
    if control is void then return false end if
    if control.handle is void then return false end if
    if control.kind != "ListView" then return false end if
    titleBytes = _asciiUtf16Z("Value")
    column = bytes(40, 0)
    _writeU32LE(column, 0, LVCF_TEXT | LVCF_WIDTH | LVCF_SUBITEM)
    _writeU32LE(column, 8, control.width - 8)
    _writePtrLE(column, 16, nativeBytesPtr(titleBytes))
    _writeU32LE(column, 24, 5)
    _writeU32LE(column, 28, 0)
    SendMessageW(control.handle, LVM_INSERTCOLUMNW, 0, nativeBytesPtr(column))
    return true
  end function

  static function addListViewItem(control, text)
    textBytes = _asciiUtf16Z(text)
    item = bytes(56, 0)
    index = SendMessageW(control.handle, LVM_GETITEMCOUNT, 0, 0)
    _writeU32LE(item, 0, LVIF_TEXT)
    _writeU32LE(item, 4, index)
    _writeU32LE(item, 8, 0)
    _writePtrLE(item, 24, nativeBytesPtr(textBytes))
    _writeU32LE(item, 32, len(text))
    return SendMessageW(control.handle, LVM_INSERTITEMW, 0, nativeBytesPtr(item))
  end function

  static function addTreeViewItem(control, text)
    textBytes = _asciiUtf16Z(text)
    item = bytes(80, 0)
    _writePtrLE(item, 0, 0)
    _writePtrLE(item, 8, TVI_LAST)
    _writeU32LE(item, 16, TVIF_TEXT)
    _writePtrLE(item, 40, nativeBytesPtr(textBytes))
    _writeU32LE(item, 48, len(text))
    return SendMessageW(control.handle, TVM_INSERTITEMW, 0, nativeBytesPtr(item))
  end function

  static function setItems(control, items)
    if Control.clearItems(control) == false then return false end if
    if len(items) > 0 then
      for i = 0 to len(items) - 1
        Control.addItem(control, items[i])
      end for
    end if
    return true
  end function

  static function getSelectedIndex(control)
    if control is void then return -1 end if
    if control.handle is void then return -1 end if
    if control.kind == "ComboBox" then return SendMessageW(control.handle, CB_GETCURSEL, 0, 0) end if
    if control.kind == "ListBox" then return SendMessageW(control.handle, LB_GETCURSEL, 0, 0) end if
    if control.kind == "TabControl" then return SendMessageW(control.handle, TCM_GETCURSEL, 0, 0) end if
    if control.kind == "ListView" then return SendMessageW(control.handle, LVM_GETNEXTITEM, -1, LVNI_SELECTED) end if
    return -1
  end function

  static function setSelectedIndex(control, index)
    if control is void then return false end if
    if control.handle is void then return false end if
    if control.kind == "ComboBox" then
      SendMessageW(control.handle, CB_SETCURSEL, index, 0)
      control.lastSelection = Control.getSelectedIndex(control)
      return true
    end if
    if control.kind == "ListBox" then
      SendMessageW(control.handle, LB_SETCURSEL, index, 0)
      control.lastSelection = Control.getSelectedIndex(control)
      return true
    end if
    if control.kind == "TabControl" then
      SendMessageW(control.handle, TCM_SETCURSEL, index, 0)
      control.lastSelection = Control.getSelectedIndex(control)
      global _activeApp
      if _activeApp is void == false then
        Control.updateTabPages(_activeApp, control)
      end if
      return true
    end if
    if control.kind == "ListView" then
      item = bytes(56, 0)
      _writeU32LE(item, 12, LVIS_SELECTED | LVIS_FOCUSED)
      _writeU32LE(item, 16, LVIS_SELECTED | LVIS_FOCUSED)
      SendMessageW(control.handle, LVM_SETITEMSTATE, index, nativeBytesPtr(item))
      control.lastSelection = Control.getSelectedIndex(control)
      return true
    end if
    return false
  end function

  static function updateTabPages(app, tabControl)
    if app is void then return false end if
    if tabControl is void then return false end if
    if tabControl.kind != "TabControl" then return false end if
    selected = Control.getSelectedIndex(tabControl)
    if selected < 0 then selected = tabControl.lastSelection end if
    if selected < 0 then selected = 0 end if
    tabControl.lastSelection = selected
    pageIndex = 0
    if len(app.controls) > 0 then
      for i = 0 to len(app.controls) - 1
        c = app.controls[i]
        if c is void == false then
          if c.parent is void == false and c.parent.handle == tabControl.handle then
            pageVisible = pageIndex == selected
            Control.applyEffectiveVisible(c, pageVisible)
            for j = 0 to len(app.controls) - 1
              child = app.controls[j]
              if child is void == false then
                if Control.isDescendantOf(app, child, c) then
                  Control.applyEffectiveVisible(child, pageVisible)
                end if
              end if
            end for
            pageIndex = pageIndex + 1
          end if
        end if
      end for
    end if
    return true
  end function

  static function applyEffectiveVisible(control, parentVisible)
    if control is void then return false end if
    if control.handle is void then return false end if
    if parentVisible and control.visible then
      return ShowWindow(control.handle, SW_SHOW)
    end if
    return ShowWindow(control.handle, 0)
  end function

  static function isDescendantOf(app, control, ancestor)
    if app is void then return false end if
    if control is void then return false end if
    if ancestor is void then return false end if
    current = control
    safety = 0
    while current is void == false and safety < 64
      safety = safety + 1
      if current.parent is void then return false end if
      if current.parent.handle == ancestor.handle then return true end if
      parentHandle = current.parent.handle
      foundParent = void
      if len(app.controls) > 0 then
        for i = 0 to len(app.controls) - 1
          maybeParent = app.controls[i]
          if maybeParent is void == false then
            if maybeParent.handle == parentHandle then foundParent = maybeParent end if
          end if
        end for
      end if
      current = foundParent
    end while
    return false
  end function

  static function updateScrollViewer(app, scrollViewer)
    if app is void then return false end if
    if scrollViewer is void then return false end if
    if scrollViewer.kind != "ScrollViewer" then return false end if
    maxBottom = 0
    if len(app.controls) > 0 then
      for i = 0 to len(app.controls) - 1
        child = app.controls[i]
        if child is void == false then
          if child.parent is void == false and child.parent.handle == scrollViewer.handle then
            childBottom = child.baseY + child.baseHeight + 8
            if childBottom > maxBottom then maxBottom = childBottom end if
          end if
        end if
      end for
    end if
    maxScroll = maxBottom - scrollViewer.height
    if maxScroll < 0 then maxScroll = 0 end if
    scrollViewer.scrollMin = 0
    scrollViewer.scrollMax = maxScroll
    if scrollViewer.scrollValue > maxScroll then scrollViewer.scrollValue = maxScroll end if
    if scrollViewer.scrollValue < 0 then scrollViewer.scrollValue = 0 end if
    if scrollViewer.handle is void == false then
      SetScrollRange(scrollViewer.handle, SB_VERT, 0, maxScroll, true)
      SetScrollPos(scrollViewer.handle, SB_VERT, scrollViewer.scrollValue, true)
    end if
    return Control.scrollViewerTo(app, scrollViewer, scrollViewer.scrollValue)
  end function

  static function scrollViewerTo(app, scrollViewer, value)
    if app is void then return false end if
    if scrollViewer is void then return false end if
    if scrollViewer.kind != "ScrollViewer" then return false end if
    if value < scrollViewer.scrollMin then value = scrollViewer.scrollMin end if
    if value > scrollViewer.scrollMax then value = scrollViewer.scrollMax end if
    oldValue = scrollViewer.scrollValue
    scrollViewer.scrollValue = value
    if scrollViewer.handle is void == false then
      SetScrollPos(scrollViewer.handle, SB_VERT, value, true)
    end if
    if len(app.controls) > 0 then
      for i = 0 to len(app.controls) - 1
        child = app.controls[i]
        if child is void == false then
          if child.parent is void == false and child.parent.handle == scrollViewer.handle then
            Control.moveCurrent(child, child.baseX, child.baseY - value, child.width, child.height)
          end if
        end if
      end for
    end if
    if oldValue != value then
      RedrawWindow(scrollViewer.handle, void, void, RDW_INVALIDATE | RDW_ERASE | RDW_ALLCHILDREN | RDW_UPDATENOW)
    end if
    return true
  end function

  static function getSelectedText(control)
    if control is void then return "" end if
    if control.handle is void then return "" end if
    idx = Control.getSelectedIndex(control)
    if idx < 0 then return "" end if
    msgLen = LB_GETTEXTLEN
    msgText = LB_GETTEXT
    if control.kind == "ComboBox" then
      msgLen = CB_GETLBTEXTLEN
      msgText = CB_GETLBTEXT
    else if control.kind != "ListBox" then
      return ""
    end if
    n = SendMessageW(control.handle, msgLen, idx, 0)
    if n <= 0 then return "" end if
    buf = bytes((n + 2) * 2, 0)
    SendMessageW(control.handle, msgText, idx, nativeBytesPtr(buf))
    text = decode16Z(buf)
    if typeof(text) == "string" then return text end if
    return ""
  end function

  static function setValueRange(control, minimum, maximum)
    if control is void then return false end if
    if control.kind == "NumberBox" then
      control.scrollMin = minimum
      control.scrollMax = maximum
      return true
    end if
    if control.kind == "ProgressBar" then
      control.scrollMin = minimum
      control.scrollMax = maximum
      if control.scrollValue < minimum then control.scrollValue = minimum end if
      if control.scrollValue > maximum then control.scrollValue = maximum end if
      if control.handle is void then return false end if
      SendMessageW(control.handle, PBM_SETRANGE32, minimum, maximum)
      SendMessageW(control.handle, PBM_SETPOS, control.scrollValue, 0)
      return true
    end if
    return Control.setScrollRange(control, minimum, maximum)
  end function

  static function setValue(control, value)
    if control is void then return false end if
    if control.kind == "NumberBox" then
      if value < control.scrollMin then value = control.scrollMin end if
      if value > control.scrollMax then value = control.scrollMax end if
      control.scrollValue = value
      return Control.setText(control, "" + value)
    end if
    if control.kind == "ProgressBar" then
      if value < control.scrollMin then value = control.scrollMin end if
      if value > control.scrollMax then value = control.scrollMax end if
      control.scrollValue = value
      if control.handle is void then return false end if
      SendMessageW(control.handle, PBM_SETPOS, value, 0)
      return true
    end if
    return Control.setScrollValue(control, value)
  end function

  static function getValue(control)
    if control is void then return 0 end if
    if control.kind == "NumberBox" then
      return _asInt(Control.getText(control))
    end if
    if control.kind == "ProgressBar" then return control.scrollValue end if
    return Control.getScrollValue(control)
  end function

  static function setScrollRange(control, minimum, maximum)
    if control is void then return false end if
    control.scrollMin = minimum
    control.scrollMax = maximum
    if control.scrollValue < minimum then control.scrollValue = minimum end if
    if control.scrollValue > maximum then control.scrollValue = maximum end if
    if control.handle is void then return false end if
    if control.kind == "ScrollBar" then
      SendMessageW(control.handle, SBM_SETRANGE, minimum, maximum)
      SendMessageW(control.handle, SBM_SETPOS, control.scrollValue, 1)
      return true
    end if
    if control.kind == "Slider" then
      SendMessageW(control.handle, TBM_SETRANGEMIN, 1, minimum)
      SendMessageW(control.handle, TBM_SETRANGEMAX, 1, maximum)
      SendMessageW(control.handle, TBM_SETPOS, 1, control.scrollValue)
      return true
    end if
    return false
  end function

  static function setScrollSteps(control, smallStep, largeStep)
    if control is void then return false end if
    if smallStep <= 0 then smallStep = 1 end if
    if largeStep <= 0 then largeStep = 10 end if
    control.smallStep = smallStep
    control.largeStep = largeStep
    if control.handle is void then return true end if
    if control.kind == "Slider" then
      SendMessageW(control.handle, TBM_SETLINESIZE, 0, smallStep)
      SendMessageW(control.handle, TBM_SETPAGESIZE, 0, largeStep)
    end if
    return true
  end function

  static function setScrollValue(control, value)
    if control is void then return false end if
    if value < control.scrollMin then value = control.scrollMin end if
    if value > control.scrollMax then value = control.scrollMax end if
    control.scrollValue = value
    if control.handle is void then return false end if
    if control.kind == "ScrollBar" then
      SendMessageW(control.handle, SBM_SETPOS, value, 1)
      return true
    end if
    if control.kind == "Slider" then
      SendMessageW(control.handle, TBM_SETPOS, 1, value)
      return true
    end if
    return false
  end function

  static function getScrollValue(control)
    if control is void then return 0 end if
    if control.handle is void then return control.scrollValue end if
    if control.kind == "Slider" then
      valueSlider = SendMessageW(control.handle, TBM_GETPOS, 0, 0)
      control.scrollValue = valueSlider
      return valueSlider
    end if
    if control.kind != "ScrollBar" then return control.scrollValue end if
    value = SendMessageW(control.handle, SBM_GETPOS, 0, 0)
    control.scrollValue = value
    return value
  end function
end struct

struct Events
  static function bindLoad(app, window, callback, context)
    app.loadBindings = app.loadBindings + [Binding(window, callback, context, "load")]
    return window
  end function

  static function bindClose(app, window, callback, context)
    app.closeBindings = app.closeBindings + [Binding(window, callback, context, "close")]
    return window
  end function

  static function bindResized(app, window, callback, context)
    app.resizeBindings = app.resizeBindings + [Binding(window, callback, context, "resized")]
    return window
  end function

  static function bindClick(app, control, callback, context)
    app.clickBindings = app.clickBindings + [Binding(control, callback, context, "click")]
    return control
  end function

  static function bindClicked(app, control, callback, context)
    return Events.bindClick(app, control, callback, context)
  end function

  static function bindTextChanged(app, control, callback, context)
    app.textBindings = app.textBindings + [Binding(control, callback, context, "textChanged")]
    if control is void == false then
      control.lastText = Control.getText(control)
    end if
    return control
  end function

  static function bindSelectionChanged(app, control, callback, context)
    app.selectionBindings = app.selectionBindings + [Binding(control, callback, context, "selectionChanged")]
    if control is void == false then
      control.lastSelection = Control.getSelectedIndex(control)
    end if
    return control
  end function

  static function bindSelected(app, control, callback, context)
    return Events.bindSelectionChanged(app, control, callback, context)
  end function

  static function bindScrollChanged(app, control, callback, context)
    app.scrollBindings = app.scrollBindings + [Binding(control, callback, context, "scrollChanged")]
    if control is void == false then
      control.scrollValue = Control.getScrollValue(control)
    end if
    return control
  end function

  static function bindValueChanged(app, control, callback, context)
    return Events.bindScrollChanged(app, control, callback, context)
  end function

  static function bindChanged(app, control, callback, context)
    return Events.bindChange(app, control, callback, context)
  end function

  static function bindChange(app, control, callback, context)
    if control is void == false then
      if control.kind == "ComboBox" or control.kind == "ListBox" then
        return Events.bindSelectionChanged(app, control, callback, context)
      end if
      if control.kind == "ScrollBar" or control.kind == "Slider" then
        return Events.bindScrollChanged(app, control, callback, context)
      end if
    end if
    return Events.bindTextChanged(app, control, callback, context)
  end function

  static function dispatch(binding, eventType, oldValue, newValue)
    if binding is void then return void end if
    ev = Event(binding.control, eventType, oldValue, newValue, false)
    return binding.callback(binding.context, ev)
  end function

  static function findWindowByHandle(app, hwnd)
    if app is void then return void end if
    for i = 0 to len(app.windows) - 1
      w = app.windows[i]
      if w is void == false and w.handle == hwnd then return w end if
    end for
    return void
  end function

  static function dispatchLoad(window)
    global _activeApp
    if _activeApp is void then return false end if
    for i = 0 to len(_activeApp.loadBindings) - 1
      b = _activeApp.loadBindings[i]
      if b.control == window then
        Events.dispatch(b, "load", void, void)
        return true
      end if
    end for
    return false
  end function

  static function dispatchClose(app, window)
    if app is void then return false end if
    handled = false
    for i = 0 to len(app.closeBindings) - 1
      b = app.closeBindings[i]
      if b.control == window then
        ev = Event(window, "close", void, void, false)
        b.callback(b.context, ev)
        if ev.cancel then return true end if
        handled = true
      end if
    end for
    return false
  end function

  static function dispatchResize(app, window, oldValue, newValue)
    if app is void then return false end if
    for i = 0 to len(app.resizeBindings) - 1
      b = app.resizeBindings[i]
      if b.control == window then
        Events.dispatch(b, "resized", oldValue, newValue)
      end if
    end for
    return false
  end function

  static function dispatchNotify(app, hwndControl, nativeId, code)
    if app is void then return false end if
    for s = 0 to len(app.selectionBindings) - 1
      b = app.selectionBindings[s]
      c = b.control
      if c is void == false then
        if c.kind == "TabControl" and (c.handle == hwndControl or c.nativeId == nativeId) then
          oldValue = c.lastSelection
          newValue = Control.getSelectedIndex(c)
          if newValue < 0 then newValue = oldValue end if
          c.lastSelection = newValue
          Control.updateTabPages(app, c)
          if oldValue != newValue then
            Events.dispatch(b, b.eventType, oldValue, newValue)
          end if
          return true
        end if
        if c.kind == "ListView" and (c.handle == hwndControl or c.nativeId == nativeId) and code == LVN_ITEMCHANGED then
          oldListValue = c.lastSelection
          newListValue = Control.getSelectedIndex(c)
          if newListValue < 0 then newListValue = oldListValue end if
          c.lastSelection = newListValue
          if oldListValue != newListValue then
            Events.dispatch(b, b.eventType, oldListValue, newListValue)
          end if
          return true
        end if
        if c.kind == "TreeView" and (c.handle == hwndControl or c.nativeId == nativeId) and code == TVN_SELCHANGEDW then
          oldTreeValue = c.lastSelection
          newTreeValue = oldTreeValue + 1
          if newTreeValue < 0 then newTreeValue = 0 end if
          c.lastSelection = newTreeValue
          Events.dispatch(b, b.eventType, oldTreeValue, newTreeValue)
          return true
        end if
      end if
    end for
    return false
  end function

  static function dispatchClickByHandle(app, hwndControl)
    if app is void then return false end if
    for i = 0 to len(app.clickBindings) - 1
      b = app.clickBindings[i]
      c = b.control
      if c is void == false then
        if c.handle == hwndControl then
          Events.dispatch(b, "click", false, true)
          return true
        end if
      end if
    end for
    return false
  end function

  static function isControlKind(app, hwndControl, kind)
    if app is void then return false end if
    if len(app.controls) > 0 then
      for i = 0 to len(app.controls) - 1
        c = app.controls[i]
        if c is void == false then
          if c.handle == hwndControl and c.kind == kind then return true end if
        end if
      end for
    end if
    return false
  end function

  static function dispatchTabChangedByHandle(app, hwndControl)
    if app is void then return false end if
    for s = 0 to len(app.selectionBindings) - 1
      b = app.selectionBindings[s]
      c = b.control
      if c is void == false then
        if c.kind == "TabControl" and c.handle == hwndControl then
          oldValue = c.lastSelection
          newValue = Control.getSelectedIndex(c)
          if newValue < 0 then newValue = oldValue end if
          c.lastSelection = newValue
          Control.updateTabPages(app, c)
          if oldValue != newValue then
            Events.dispatch(b, b.eventType, oldValue, newValue)
          end if
          return true
        end if
      end if
    end for
    return false
  end function

  static function dispatchTabClickedByHandle(app, hwndControl, x, y)
    if app is void then return false end if
    if len(app.selectionBindings) == 0 then return false end if
    for s = 0 to len(app.selectionBindings) - 1
      b = app.selectionBindings[s]
      c = b.control
      if c is void == false then
        if c.kind == "TabControl" and c.handle == hwndControl then
          hit = bytes(12, 0)
          _writeU32LE(hit, 0, x)
          _writeU32LE(hit, 4, y)
          index = SendMessageW(c.handle, TCM_HITTEST, 0, nativeBytesPtr(hit))
          if index < 0 then return false end if
          oldValue = c.lastSelection
          SendMessageW(c.handle, TCM_SETCURSEL, index, 0)
          c.lastSelection = index
          Control.updateTabPages(app, c)
          if oldValue != index then
            Events.dispatch(b, b.eventType, oldValue, index)
          end if
          return true
        end if
      end if
    end for
    return false
  end function

  static function dispatchScrollViewer(app, hwndControl, code, pos)
    if app is void then return false end if
    if len(app.controls) > 0 then
      for i = 0 to len(app.controls) - 1
        c = app.controls[i]
        if c is void == false then
          if c.kind == "ScrollViewer" and c.handle == hwndControl then
            oldValue = c.scrollValue
            newValue = oldValue
            if code == SB_LINEUP then newValue = oldValue - c.smallStep end if
            if code == SB_LINEDOWN then newValue = oldValue + c.smallStep end if
            if code == SB_PAGEUP then newValue = oldValue - c.largeStep end if
            if code == SB_PAGEDOWN then newValue = oldValue + c.largeStep end if
            if code == SB_TOP then newValue = c.scrollMin end if
            if code == SB_BOTTOM then newValue = c.scrollMax end if
            if code == SB_THUMBPOSITION or code == SB_THUMBTRACK then newValue = pos end if
            Control.scrollViewerTo(app, c, newValue)
            if oldValue != c.scrollValue then
              for s = 0 to len(app.scrollBindings) - 1
                b = app.scrollBindings[s]
                if b.control == c then Events.dispatch(b, b.eventType, oldValue, c.scrollValue) end if
              end for
            end if
            return true
          end if
        end if
      end for
    end if
    return false
  end function

  static function dispatchScroll(app, code, pos, hwndControl)
    if app is void then return false end if
    for s = 0 to len(app.scrollBindings) - 1
      b = app.scrollBindings[s]
      c = b.control
      if c is void == false then
        if c.handle == hwndControl then
          oldValue = c.scrollValue
          newValue = Control.getScrollValue(c)
          if code == SB_LINEUP then newValue = oldValue - c.smallStep end if
          if code == SB_LINEDOWN then newValue = oldValue + c.smallStep end if
          if code == SB_PAGEUP then newValue = oldValue - c.largeStep end if
          if code == SB_PAGEDOWN then newValue = oldValue + c.largeStep end if
          if code == SB_TOP then newValue = c.scrollMin end if
          if code == SB_BOTTOM then newValue = c.scrollMax end if
          if code == SB_THUMBPOSITION or code == SB_THUMBTRACK then newValue = pos end if
          Control.setScrollValue(c, newValue)
          newValue = c.scrollValue
          if oldValue != newValue then
            Events.dispatch(b, b.eventType, oldValue, newValue)
          end if
          return true
        end if
      end if
    end for
    return false
  end function

  static function dispatchCommand(app, code, nativeId, hwndControl)
    if app is void then return false end if

    if code == BN_CLICKED then
      for i = 0 to len(app.clickBindings) - 1
        b = app.clickBindings[i]
        c = b.control
        if c is void == false then
          if c.nativeId == nativeId or c.handle == hwndControl then
            Events.dispatch(b, "click", false, true)
            return true
          end if
        end if
      end for
    end if

    if code == EN_CHANGE then
      for j = 0 to len(app.textBindings) - 1
        tb = app.textBindings[j]
        tc = tb.control
        if tc is void == false then
          if tc.nativeId == nativeId or tc.handle == hwndControl then
            oldText = tc.lastText
            newText = Control.getText(tc)
            if oldText != newText then
              tc.lastText = newText
              Events.dispatch(tb, tb.eventType, oldText, newText)
            end if
            return true
          end if
        end if
      end for
    end if

    if code == CBN_SELCHANGE or code == LBN_SELCHANGE then
      for k = 0 to len(app.selectionBindings) - 1
        sb = app.selectionBindings[k]
        sc = sb.control
        if sc is void == false then
          if sc.nativeId == nativeId or sc.handle == hwndControl then
            oldSelection = sc.lastSelection
            newSelection = Control.getSelectedIndex(sc)
            if oldSelection != newSelection then
              sc.lastSelection = newSelection
              Events.dispatch(sb, sb.eventType, oldSelection, Control.getSelectedText(sc))
            end if
            return true
          end if
        end if
      end for
    end if

    return false
  end function
end struct
