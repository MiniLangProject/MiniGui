// SPDX-License-Identifier: Apache-2.0

//! Provides minigui facilities for this project.

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
import std.string_builder as sb
import std.string as str

#if TARGET_OS == "windows"

/// Invokes the native CreateWindowExW entry point used by the minigui module.
/// @param exStyle exStyle value consumed by this operation.
/// @param className className value consumed by this operation.
/// @param windowName windowName value consumed by this operation.
/// @param style style value consumed by this operation.
/// @param x Horizontal coordinate used by the operation.
/// @param y Vertical coordinate used by the operation.
/// @param width Width in the coordinate or storage units used by the caller.
/// @param height Height in the coordinate or storage units used by the caller.
/// @param parent parent value consumed by this operation.
/// @param menu menu value consumed by this operation.
/// @param instance instance value consumed by this operation.
/// @param param param value consumed by this operation.
/// @returns Native ptr result produced by the call.
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

/// Invokes the native RegisterClassW entry point used by the minigui module.
/// @param wndClass wndClass value consumed by this operation.
/// @returns Native u32 result produced by the call.
extern function RegisterClassW(wndClass as bytes) from "user32.dll" returns u32
/// Invokes the native GetModuleHandleW entry point used by the minigui module.
/// @param moduleName moduleName value consumed by this operation.
/// @returns Native ptr result produced by the call.
extern function GetModuleHandleW(moduleName as ptr) from "kernel32.dll" returns ptr
/// Invokes the native LoadCursorW entry point used by the minigui module.
/// @param instance instance value consumed by this operation.
/// @param cursorName cursorName value consumed by this operation.
/// @returns Native ptr result produced by the call.
extern function LoadCursorW(instance as ptr, cursorName as ptr) from "user32.dll" returns ptr
/// Invokes the native GetLastError entry point used by the minigui module.
/// @returns Native u32 result produced by the call.
extern function GetLastError() from "kernel32.dll" returns u32
/// Invokes the native ShowWindow entry point used by the minigui module.
/// @param hwnd hwnd value consumed by this operation.
/// @param cmd cmd value consumed by this operation.
/// @returns Native bool result produced by the call.
extern function ShowWindow(hwnd as ptr, cmd as int) from "user32.dll" returns bool
/// Invokes the native UpdateWindow entry point used by the minigui module.
/// @param hwnd hwnd value consumed by this operation.
/// @returns Native bool result produced by the call.
extern function UpdateWindow(hwnd as ptr) from "user32.dll" returns bool
/// Invokes the native DestroyWindow entry point used by the minigui module.
/// @param hwnd hwnd value consumed by this operation.
/// @returns Native bool result produced by the call.
extern function DestroyWindow(hwnd as ptr) from "user32.dll" returns bool
/// Invokes the native IsWindow entry point used by the minigui module.
/// @param hwnd hwnd value consumed by this operation.
/// @returns Native bool result produced by the call.
extern function IsWindow(hwnd as ptr) from "user32.dll" returns bool
/// Invokes the native EnableWindow entry point used by the minigui module.
/// @param hwnd hwnd value consumed by this operation.
/// @param enable enable value consumed by this operation.
/// @returns Native bool result produced by the call.
extern function EnableWindow(hwnd as ptr, enable as bool) from "user32.dll" returns bool
/// Invokes the native SetWindowTextW entry point used by the minigui module.
/// @param hwnd hwnd value consumed by this operation.
/// @param text Text consumed by the operation.
/// @returns Native bool result produced by the call.
extern function SetWindowTextW(hwnd as ptr, text as wstr) from "user32.dll" returns bool
/// Invokes the native GetWindowTextW entry point used by the minigui module.
/// @param hwnd hwnd value consumed by this operation.
/// @param text Text consumed by the operation.
/// @param maxCount Number of max to process.
/// @returns Native int result produced by the call.
extern function GetWindowTextW(hwnd as ptr, text as bytes, maxCount as int) from "user32.dll" returns int
/// Invokes the native GetWindowTextLengthW entry point used by the minigui module.
/// @param hwnd hwnd value consumed by this operation.
/// @returns Native int result produced by the call.
extern function GetWindowTextLengthW(hwnd as ptr) from "user32.dll" returns int
/// Invokes the native GetClientRect entry point used by the minigui module.
/// @param hwnd hwnd value consumed by this operation.
/// @param rect rect value consumed by this operation.
/// @returns Native bool result produced by the call.
extern function GetClientRect(hwnd as ptr, rect as bytes) from "user32.dll" returns bool
/// Invokes the native MoveWindow entry point used by the minigui module.
/// @param hwnd hwnd value consumed by this operation.
/// @param x Horizontal coordinate used by the operation.
/// @param y Vertical coordinate used by the operation.
/// @param width Width in the coordinate or storage units used by the caller.
/// @param height Height in the coordinate or storage units used by the caller.
/// @param repaint repaint value consumed by this operation.
/// @returns Native bool result produced by the call.
extern function MoveWindow(hwnd as ptr, x as int, y as int, width as int, height as int, repaint as bool) from "user32.dll" returns bool
/// Invokes the native RedrawWindow entry point used by the minigui module.
/// @param hwnd hwnd value consumed by this operation.
/// @param rect rect value consumed by this operation.
/// @param region region value consumed by this operation.
/// @param flags Bit flags controlling the operation.
/// @returns Native bool result produced by the call.
extern function RedrawWindow(hwnd as ptr, rect as ptr, region as ptr, flags as u32) from "user32.dll" returns bool
/// Invokes the native ClientToScreen entry point used by the minigui module.
/// @param hwnd hwnd value consumed by this operation.
/// @param point point value consumed by this operation.
/// @returns Native bool result produced by the call.
extern function ClientToScreen(hwnd as ptr, point as bytes) from "user32.dll" returns bool
/// Invokes the native SetCapture entry point used by the minigui module.
/// @param hwnd hwnd value consumed by this operation.
/// @returns Native ptr result produced by the call.
extern function SetCapture(hwnd as ptr) from "user32.dll" returns ptr
/// Invokes the native ReleaseCapture entry point used by the minigui module.
/// @returns Native bool result produced by the call.
extern function ReleaseCapture() from "user32.dll" returns bool
/// Invokes the native SetFocus entry point used by the minigui module.
/// @param hwnd hwnd value consumed by this operation.
/// @returns Native ptr result produced by the call.
extern function SetFocus(hwnd as ptr) from "user32.dll" returns ptr
/// Invokes the native SetScrollRange entry point used by the minigui module.
/// @param hwnd hwnd value consumed by this operation.
/// @param bar bar value consumed by this operation.
/// @param minimum minimum value consumed by this operation.
/// @param maximum maximum value consumed by this operation.
/// @param redraw redraw value consumed by this operation.
/// @returns Native bool result produced by the call.
extern function SetScrollRange(hwnd as ptr, bar as int, minimum as int, maximum as int, redraw as bool) from "user32.dll" returns bool
/// Invokes the native SetScrollPos entry point used by the minigui module.
/// @param hwnd hwnd value consumed by this operation.
/// @param bar bar value consumed by this operation.
/// @param position position value consumed by this operation.
/// @param redraw redraw value consumed by this operation.
/// @returns Native int result produced by the call.
extern function SetScrollPos(hwnd as ptr, bar as int, position as int, redraw as bool) from "user32.dll" returns int
/// Invokes the native SetTimer entry point used by the minigui module.
/// @param hwnd hwnd value consumed by this operation.
/// @param timerId Identifier of timer.
/// @param elapsedMs elapsedMs value consumed by this operation.
/// @param timerProc timerProc value consumed by this operation.
/// @returns Native ptr result produced by the call.
extern function SetTimer(hwnd as ptr, timerId as u32, elapsedMs as u32, timerProc as ptr) from "user32.dll" returns ptr
/// Invokes the native SetWindowLongPtrW entry point used by the minigui module.
/// @param hwnd hwnd value consumed by this operation.
/// @param index Zero-based index of the affected item.
/// @param newLong newLong value consumed by this operation.
/// @returns Native ptr result produced by the call.
extern function SetWindowLongPtrW(hwnd as ptr, index as int, newLong as ptr) from "user32.dll" returns ptr
/// Invokes the native GetWindowLongPtrW entry point used by the minigui module.
/// @param hwnd hwnd value consumed by this operation.
/// @param index Zero-based index of the affected item.
/// @returns Native ptr result produced by the call.
extern function GetWindowLongPtrW(hwnd as ptr, index as int) from "user32.dll" returns ptr
/// Invokes the native SendMessageW entry point used by the minigui module.
/// @param hwnd hwnd value consumed by this operation.
/// @param msg msg value consumed by this operation.
/// @param wParam wParam value consumed by this operation.
/// @param lParam lParam value consumed by this operation.
/// @returns Native ptr result produced by the call.
extern function SendMessageW(hwnd as ptr, msg as u32, wParam as ptr, lParam as ptr) from "user32.dll" returns ptr
/// Invokes the native SendMessageTextW entry point used by the minigui module.
/// @param hwnd hwnd value consumed by this operation.
/// @param msg msg value consumed by this operation.
/// @param wParam wParam value consumed by this operation.
/// @param lParam lParam value consumed by this operation.
/// @returns Native ptr result produced by the call.
extern function SendMessageTextW(hwnd as ptr, msg as u32, wParam as ptr, lParam as wstr) from "user32.dll" symbol "SendMessageW" returns ptr
/// Invokes the native LoadImageW entry point used by the minigui module.
/// @param instance instance value consumed by this operation.
/// @param name Name of the affected item.
/// @param imageType imageType value consumed by this operation.
/// @param width Width in the coordinate or storage units used by the caller.
/// @param height Height in the coordinate or storage units used by the caller.
/// @param flags Bit flags controlling the operation.
/// @returns Native ptr result produced by the call.
extern function LoadImageW(instance as ptr, name as wstr, imageType as u32, width as int, height as int, flags as u32) from "user32.dll" returns ptr
/// Invokes the native MessageBoxW entry point used by the minigui module.
/// @param hwnd hwnd value consumed by this operation.
/// @param text Text consumed by the operation.
/// @param caption caption value consumed by this operation.
/// @param flags Bit flags controlling the operation.
/// @returns Native int result produced by the call.
extern function MessageBoxW(hwnd as ptr, text as wstr, caption as wstr, flags as u32) from "user32.dll" returns int
/// Invokes the native CreatePopupMenu entry point used by the minigui module.
/// @returns Native ptr result produced by the call.
extern function CreatePopupMenu() from "user32.dll" returns ptr
/// Invokes the native AppendMenuW entry point used by the minigui module.
/// @param menu menu value consumed by this operation.
/// @param flags Bit flags controlling the operation.
/// @param itemId Identifier of item.
/// @param text Text consumed by the operation.
/// @returns Native bool result produced by the call.
extern function AppendMenuW(menu as ptr, flags as u32, itemId as ptr, text as wstr) from "user32.dll" returns bool
/// Invokes the native TrackPopupMenuEx entry point used by the minigui module.
/// @param menu menu value consumed by this operation.
/// @param flags Bit flags controlling the operation.
/// @param x Horizontal coordinate used by the operation.
/// @param y Vertical coordinate used by the operation.
/// @param owner owner value consumed by this operation.
/// @param params params value consumed by this operation.
/// @returns Native int result produced by the call.
extern function TrackPopupMenuEx(menu as ptr, flags as u32, x as int, y as int, owner as ptr, params as ptr) from "user32.dll" returns int
/// Invokes the native SetTextColor entry point used by the minigui module.
/// @param hdc hdc value consumed by this operation.
/// @param color color value consumed by this operation.
/// @returns Native u32 result produced by the call.
extern function SetTextColor(hdc as ptr, color as u32) from "gdi32.dll" returns u32
/// Invokes the native SetBkColor entry point used by the minigui module.
/// @param hdc hdc value consumed by this operation.
/// @param color color value consumed by this operation.
/// @returns Native u32 result produced by the call.
extern function SetBkColor(hdc as ptr, color as u32) from "gdi32.dll" returns u32
/// Invokes the native CreateSolidBrush entry point used by the minigui module.
/// @param color color value consumed by this operation.
/// @returns Native ptr result produced by the call.
extern function CreateSolidBrush(color as u32) from "gdi32.dll" returns ptr
/// Releases a GDI object created by this module.
/// @param object Native GDI object handle.
/// @returns Whether the object was released.
extern function DeleteObject(object as ptr) from "gdi32.dll" returns bool
/// Computes the UTF-16 capacity required for a UTF-8 string.
/// @internal
extern function MultiByteToWideCharSize(codePage as u32, flags as u32, text as cstr, inputCount as int, output as ptr, outputCount as int) from "kernel32.dll" symbol "MultiByteToWideChar" returns int
/// Converts a UTF-8 string into a caller-owned UTF-16 buffer.
/// @internal
extern function MultiByteToWideCharBytes(codePage as u32, flags as u32, text as cstr, inputCount as int, output as bytes, outputCount as int) from "kernel32.dll" symbol "MultiByteToWideChar" returns int
/// Invokes the native GetOpenFileNameW entry point used by the minigui module.
/// @param openFileName openFileName value consumed by this operation.
/// @returns Native bool result produced by the call.
extern function GetOpenFileNameW(openFileName as bytes) from "comdlg32.dll" returns bool
/// Invokes the native GetSaveFileNameW entry point used by the minigui module.
/// @param openFileName openFileName value consumed by this operation.
/// @returns Native bool result produced by the call.
extern function GetSaveFileNameW(openFileName as bytes) from "comdlg32.dll" returns bool
/// Invokes the native ChooseColorW entry point used by the minigui module.
/// @param chooseColor chooseColor value consumed by this operation.
/// @returns Native bool result produced by the call.
extern function ChooseColorW(chooseColor as bytes) from "comdlg32.dll" returns bool
/// Invokes the native SHBrowseForFolderW entry point used by the minigui module.
/// @param browseInfo browseInfo value consumed by this operation.
/// @returns Native ptr result produced by the call.
extern function SHBrowseForFolderW(browseInfo as bytes) from "shell32.dll" returns ptr
/// Invokes the native SHGetPathFromIDListW entry point used by the minigui module.
/// @param itemList itemList value consumed by this operation.
/// @param path Path of the file or directory used by the operation.
/// @returns Native bool result produced by the call.
extern function SHGetPathFromIDListW(itemList as ptr, path as bytes) from "shell32.dll" returns bool
/// Invokes the native CoTaskMemFree entry point used by the minigui module.
/// @param value Value consumed or transformed by the operation.
extern function CoTaskMemFree(value as ptr) from "ole32.dll" returns void
/// Invokes the native CallWindowProcW entry point used by the minigui module.
/// @param prev prev value consumed by this operation.
/// @param hwnd hwnd value consumed by this operation.
/// @param msg msg value consumed by this operation.
/// @param wParam wParam value consumed by this operation.
/// @param lParam lParam value consumed by this operation.
/// @returns Native ptr result produced by the call.
extern function CallWindowProcW(prev as ptr, hwnd as ptr, msg as u32, wParam as ptr, lParam as ptr) from "user32.dll" symbol "CallWindowProcW" returns ptr
/// Invokes the native DefWindowProcW entry point used by the minigui module.
/// @param hwnd hwnd value consumed by this operation.
/// @param msg msg value consumed by this operation.
/// @param wParam wParam value consumed by this operation.
/// @param lParam lParam value consumed by this operation.
/// @returns Native ptr result produced by the call.
extern function DefWindowProcW(hwnd as ptr, msg as u32, wParam as ptr, lParam as ptr) from "user32.dll" returns ptr
/// Invokes the native RtlMoveMemory entry point used by the minigui module.
/// @param dest dest value consumed by this operation.
/// @param src src value consumed by this operation.
/// @param size Size in the units required by the operation.
extern function RtlMoveMemory(dest as bytes, src as ptr, size as int) from "kernel32.dll" returns void
/// Invokes the native PostQuitMessage entry point used by the minigui module.
/// @param exitCode exitCode value consumed by this operation.
extern function PostQuitMessage(exitCode as int) from "user32.dll" returns void
/// Invokes the native GetMessageW entry point used by the minigui module.
/// @param msg msg value consumed by this operation.
/// @param hwnd hwnd value consumed by this operation.
/// @param msgMin msgMin value consumed by this operation.
/// @param msgMax msgMax value consumed by this operation.
/// @returns Native int result produced by the call.
extern function GetMessageW(msg as bytes, hwnd as ptr, msgMin as u32, msgMax as u32) from "user32.dll" returns int
/// Invokes the native TranslateMessage entry point used by the minigui module.
/// @param msg msg value consumed by this operation.
/// @returns Native bool result produced by the call.
extern function TranslateMessage(msg as bytes) from "user32.dll" returns bool
/// Invokes the native DispatchMessageW entry point used by the minigui module.
/// @param msg msg value consumed by this operation.
/// @returns Native ptr result produced by the call.
extern function DispatchMessageW(msg as bytes) from "user32.dll" returns ptr
/// Invokes the native InitCommonControls entry point used by the minigui module.
extern function InitCommonControls() from "comctl32.dll" returns void

/// Defines the gwlp wndproc constant used by the minigui module.
const GWLP_WNDPROC = -4
/// Defines the gwlp userdata constant used by the minigui module.
const GWLP_USERDATA = -21
/// Defines the error class already exists constant used by the minigui module.
const ERROR_CLASS_ALREADY_EXISTS = 1410
/// Defines the wm setfocus constant used by the minigui module.
const WM_SETFOCUS = 7
/// Defines the wm killfocus constant used by the minigui module.
const WM_KILLFOCUS = 8
/// Defines the wm size constant used by the minigui module.
const WM_SIZE = 5
/// Defines the wm timer constant used by the minigui module.
const WM_TIMER = 275
/// Defines the wm destroy constant used by the minigui module.
const WM_DESTROY = 2
/// Defines the wm close constant used by the minigui module.
const WM_CLOSE = 16
/// Defines the wm command constant used by the minigui module.
const WM_COMMAND = 273
/// Defines the wm notify constant used by the minigui module.
const WM_NOTIFY = 78
/// Defines the wm ctlcoloredit constant used by the minigui module.
const WM_CTLCOLOREDIT = 307
/// Defines the wm ctlcolorlistbox constant used by the minigui module.
const WM_CTLCOLORLISTBOX = 308
/// Defines the wm ctlcolorbtn constant used by the minigui module.
const WM_CTLCOLORBTN = 309
/// Defines the wm ctlcolorstatic constant used by the minigui module.
const WM_CTLCOLORSTATIC = 312
/// Defines the wm hscroll constant used by the minigui module.
const WM_HSCROLL = 276
/// Defines the wm vscroll constant used by the minigui module.
const WM_VSCROLL = 277
/// Defines the wm mousemove constant used by the minigui module.
const WM_MOUSEMOVE = 512
/// Defines the wm lbuttondown constant used by the minigui module.
const WM_LBUTTONDOWN = 513
/// Defines the wm mousewheel constant used by the minigui module.
const WM_MOUSEWHEEL = 522
/// Defines the wm lbuttonup constant used by the minigui module.
const WM_LBUTTONUP = 514
/// Defines the wm lbuttondblclk constant used by the minigui module.
const WM_LBUTTONDBLCLK = 515
/// Defines the wm keydown constant used by the minigui module.
const WM_KEYDOWN = 256
/// Defines the vk return constant used by the minigui module.
const VK_RETURN = 13
/// Defines the vk escape constant used by the minigui module.
const VK_ESCAPE = 27
/// Defines the wm rbuttonup constant used by the minigui module.
const WM_RBUTTONUP = 517
/// Defines the bn clicked constant used by the minigui module.
const BN_CLICKED = 0
/// Defines the en change constant used by the minigui module.
const EN_CHANGE = 768
/// Defines the em limittext constant used by the minigui module.
const EM_LIMITTEXT = 197
/// Defines the em setreadonly constant used by the minigui module.
const EM_SETREADONLY = 207
/// Defines the bm getcheck constant used by the minigui module.
const BM_GETCHECK = 240
/// Defines the bm setcheck constant used by the minigui module.
const BM_SETCHECK = 241
/// Defines the bst checked constant used by the minigui module.
const BST_CHECKED = 1
/// Defines the cb addstring constant used by the minigui module.
const CB_ADDSTRING = 323
/// Defines the cb getcursel constant used by the minigui module.
const CB_GETCURSEL = 327
/// Defines the cb getlbtext constant used by the minigui module.
const CB_GETLBTEXT = 328
/// Defines the cb getlbtextlen constant used by the minigui module.
const CB_GETLBTEXTLEN = 329
/// Defines the cb resetcontent constant used by the minigui module.
const CB_RESETCONTENT = 331
/// Defines the cb setcursel constant used by the minigui module.
const CB_SETCURSEL = 334
/// Defines the cbn selchange constant used by the minigui module.
const CBN_SELCHANGE = 1
/// Defines the lb addstring constant used by the minigui module.
const LB_ADDSTRING = 384
/// Defines the lb setcursel constant used by the minigui module.
const LB_SETCURSEL = 390
/// Defines the lb getcursel constant used by the minigui module.
const LB_GETCURSEL = 392
/// Defines the lb gettext constant used by the minigui module.
const LB_GETTEXT = 393
/// Defines the lb gettextlen constant used by the minigui module.
const LB_GETTEXTLEN = 394
/// Defines the lb resetcontent constant used by the minigui module.
const LB_RESETCONTENT = 388
/// Defines the lbn selchange constant used by the minigui module.
const LBN_SELCHANGE = 1
/// Defines the lvm getitemcount constant used by the minigui module.
const LVM_GETITEMCOUNT = 4100
/// Defines the lvm deleteallitems constant used by the minigui module.
const LVM_DELETEALLITEMS = 4105
/// Defines the lvm getnextitem constant used by the minigui module.
const LVM_GETNEXTITEM = 4108
/// Defines the lvm setitemstate constant used by the minigui module.
const LVM_SETITEMSTATE = 4139
/// Defines the lvm getsubitemrect constant used by the minigui module.
const LVM_GETSUBITEMRECT = 4152
/// Defines the lvm subitemhittest constant used by the minigui module.
const LVM_SUBITEMHITTEST = 4153
/// Defines the lvm insertitemw constant used by the minigui module.
const LVM_INSERTITEMW = 4173
/// Defines the lvm insertcolumnw constant used by the minigui module.
const LVM_INSERTCOLUMNW = 4193
/// Defines the lvm setitemtextw constant used by the minigui module.
const LVM_SETITEMTEXTW = 4212
/// Defines the lvn itemchanged constant used by the minigui module.
const LVN_ITEMCHANGED = -101
/// Defines the lvif text constant used by the minigui module.
const LVIF_TEXT = 1
/// Defines the lvcf text constant used by the minigui module.
const LVCF_TEXT = 4
/// Defines the lvcf width constant used by the minigui module.
const LVCF_WIDTH = 2
/// Defines the lvcf subitem constant used by the minigui module.
const LVCF_SUBITEM = 8
/// Defines the lvm setcolumnwidth constant used by the minigui module.
const LVM_SETCOLUMNWIDTH = 4126
/// Defines the lvis focused constant used by the minigui module.
const LVIS_FOCUSED = 1
/// Defines the lvis selected constant used by the minigui module.
const LVIS_SELECTED = 2
/// Defines the lvir bounds constant used by the minigui module.
const LVIR_BOUNDS = 0
/// Defines the lvni selected constant used by the minigui module.
const LVNI_SELECTED = 2
/// Defines the pbm setpos constant used by the minigui module.
const PBM_SETPOS = 1026
/// Defines the pbm setrange32 constant used by the minigui module.
const PBM_SETRANGE32 = 1030
/// Defines the sbm setpos constant used by the minigui module.
const SBM_SETPOS = 224
/// Defines the sbm getpos constant used by the minigui module.
const SBM_GETPOS = 225
/// Defines the sbm setrange constant used by the minigui module.
const SBM_SETRANGE = 226
/// Defines the tcm insertitemw constant used by the minigui module.
const TCM_INSERTITEMW = 4926
/// Defines the tcm getitemcount constant used by the minigui module.
const TCM_GETITEMCOUNT = 4868
/// Defines the tcm getitemrect constant used by the minigui module.
const TCM_GETITEMRECT = 4874
/// Defines the tcm getcursel constant used by the minigui module.
const TCM_GETCURSEL = 4875
/// Defines the tcm setcursel constant used by the minigui module.
const TCM_SETCURSEL = 4876
/// Defines the tcm hittest constant used by the minigui module.
const TCM_HITTEST = 4877
/// Defines the tcif text constant used by the minigui module.
const TCIF_TEXT = 1
/// Defines the tcn selchange constant used by the minigui module.
const TCN_SELCHANGE = -551
/// Defines the tbm getpos constant used by the minigui module.
const TBM_GETPOS = 1024
/// Defines the tbm setpos constant used by the minigui module.
const TBM_SETPOS = 1029
/// Defines the tbm setrangemin constant used by the minigui module.
const TBM_SETRANGEMIN = 1031
/// Defines the tbm setrangemax constant used by the minigui module.
const TBM_SETRANGEMAX = 1032
/// Defines the tbm setpagesize constant used by the minigui module.
const TBM_SETPAGESIZE = 1045
/// Defines the tbm setlinesize constant used by the minigui module.
const TBM_SETLINESIZE = 1047
/// Defines the udm setbuddy constant used by the minigui module.
const UDM_SETBUDDY = 1129
/// Defines the udm setrange32 constant used by the minigui module.
const UDM_SETRANGE32 = 1135
/// Defines the udm setpos32 constant used by the minigui module.
const UDM_SETPOS32 = 1137
/// Defines the udm getpos32 constant used by the minigui module.
const UDM_GETPOS32 = 1138
/// Defines the udn deltapos constant used by the minigui module.
const UDN_DELTAPOS = -722
/// Defines the tvm deleteitem constant used by the minigui module.
const TVM_DELETEITEM = 4353
/// Defines the tvm getnextitem constant used by the minigui module.
const TVM_GETNEXTITEM = 4362
/// Defines the tvm getitemw constant used by the minigui module.
const TVM_GETITEMW = 4414
/// Defines the tvm insertitemw constant used by the minigui module.
const TVM_INSERTITEMW = 4402
/// Defines the tvn selchangedw constant used by the minigui module.
const TVN_SELCHANGEDW = -451
/// Defines the tvif text constant used by the minigui module.
const TVIF_TEXT = 1
/// Defines the tvgn caret constant used by the minigui module.
const TVGN_CARET = 9
/// Defines the tvi root constant used by the minigui module.
const TVI_ROOT = 4294901760
/// Defines the tvi last constant used by the minigui module.
const TVI_LAST = 4294901762
/// Defines the sb settextw constant used by the minigui module.
const SB_SETTEXTW = 1035
/// Defines the sb gettextw constant used by the minigui module.
const SB_GETTEXTW = 1037
/// Defines the sb lineup constant used by the minigui module.
const SB_LINEUP = 0
/// Defines the sb linedown constant used by the minigui module.
const SB_LINEDOWN = 1
/// Defines the sb pageup constant used by the minigui module.
const SB_PAGEUP = 2
/// Defines the sb pagedown constant used by the minigui module.
const SB_PAGEDOWN = 3
/// Defines the sb thumbposition constant used by the minigui module.
const SB_THUMBPOSITION = 4
/// Defines the sb thumbtrack constant used by the minigui module.
const SB_THUMBTRACK = 5
/// Defines the sb top constant used by the minigui module.
const SB_TOP = 6
/// Defines the sb bottom constant used by the minigui module.
const SB_BOTTOM = 7
/// Defines the sb vert constant used by the minigui module.
const SB_VERT = 1
/// Defines the idc arrow constant used by the minigui module.
const IDC_ARROW = 32512
/// Defines the ws overlappedwindow constant used by the minigui module.
const WS_OVERLAPPEDWINDOW = 13565952
/// Defines the ws visible constant used by the minigui module.
const WS_VISIBLE = 268435456
/// Defines the ws child constant used by the minigui module.
const WS_CHILD = 1073741824
/// Defines the ws clipchildren constant used by the minigui module.
const WS_CLIPCHILDREN = 33554432
/// Defines the ws border constant used by the minigui module.
const WS_BORDER = 8388608
/// Defines the ws vscroll constant used by the minigui module.
const WS_VSCROLL = 2097152
/// Defines the ws hscroll constant used by the minigui module.
const WS_HSCROLL = 1048576
/// Defines the ws tabstop constant used by the minigui module.
const WS_TABSTOP = 65536
/// Defines the es autohscroll constant used by the minigui module.
const ES_AUTOHSCROLL = 128
/// Defines the es multiline constant used by the minigui module.
const ES_MULTILINE = 4
/// Defines the es autovscroll constant used by the minigui module.
const ES_AUTOVSCROLL = 64
/// Defines the es wantreturn constant used by the minigui module.
const ES_WANTRETURN = 4096
/// Defines the es password constant used by the minigui module.
const ES_PASSWORD = 32
/// Defines the es number constant used by the minigui module.
const ES_NUMBER = 8192
/// Defines the ss left constant used by the minigui module.
const SS_LEFT = 0
/// Defines the ss centerimage constant used by the minigui module.
const SS_CENTERIMAGE = 512
/// Defines the ss notify constant used by the minigui module.
const SS_NOTIFY = 256
/// Defines the ss etchedhorz constant used by the minigui module.
const SS_ETCHEDHORZ = 16
/// Defines the ss etchedvert constant used by the minigui module.
const SS_ETCHEDVERT = 17
/// Defines the stm setimage constant used by the minigui module.
const STM_SETIMAGE = 370
/// Defines the image bitmap constant used by the minigui module.
const IMAGE_BITMAP = 0
/// Defines the lr loadfromfile constant used by the minigui module.
const LR_LOADFROMFILE = 16
/// Defines the bs pushbutton constant used by the minigui module.
const BS_PUSHBUTTON = 0
/// Defines the bs autocheckbox constant used by the minigui module.
const BS_AUTOCHECKBOX = 3
/// Defines the bs autoradiobutton constant used by the minigui module.
const BS_AUTORADIOBUTTON = 9
/// Defines the bs groupbox constant used by the minigui module.
const BS_GROUPBOX = 7
/// Defines the cbs dropdown constant used by the minigui module.
const CBS_DROPDOWN = 2
/// Defines the cbs dropdownlist constant used by the minigui module.
const CBS_DROPDOWNLIST = 3
/// Defines the cbs hasstrings constant used by the minigui module.
const CBS_HASSTRINGS = 512
/// Defines the lbs notify constant used by the minigui module.
const LBS_NOTIFY = 1
/// Defines the lvs report constant used by the minigui module.
const LVS_REPORT = 1
/// Defines the lvs singlesel constant used by the minigui module.
const LVS_SINGLESEL = 4
/// Defines the sbs horz constant used by the minigui module.
const SBS_HORZ = 0
/// Defines the sbs vert constant used by the minigui module.
const SBS_VERT = 1
/// Defines the tvs haslines constant used by the minigui module.
const TVS_HASLINES = 2
/// Defines the tvs linesatroot constant used by the minigui module.
const TVS_LINESATROOT = 4
/// Defines the tvs hasbuttons constant used by the minigui module.
const TVS_HASBUTTONS = 1
/// Defines the tbs autoticks constant used by the minigui module.
const TBS_AUTOTICKS = 1
/// Defines the tbs vert constant used by the minigui module.
const TBS_VERT = 2
/// Defines the uds setbuddyint constant used by the minigui module.
const UDS_SETBUDDYINT = 2
/// Defines the uds alignright constant used by the minigui module.
const UDS_ALIGNRIGHT = 4
/// Defines the uds arrowkeys constant used by the minigui module.
const UDS_ARROWKEYS = 32
/// Defines the uds nothousands constant used by the minigui module.
const UDS_NOTHOUSANDS = 128
/// Defines the dts shortdateformat constant used by the minigui module.
const DTS_SHORTDATEFORMAT = 0
/// Defines the dts updown constant used by the minigui module.
const DTS_UPDOWN = 1
/// Defines the dts timeformat constant used by the minigui module.
const DTS_TIMEFORMAT = 9
/// Defines the tts alwaystip constant used by the minigui module.
const TTS_ALWAYSTIP = 1
/// Defines the ttf idishwnd constant used by the minigui module.
const TTF_IDISHWND = 1
/// Defines the ttf subclass constant used by the minigui module.
const TTF_SUBCLASS = 16
/// Defines the ttm addtoolw constant used by the minigui module.
const TTM_ADDTOOLW = 1074
/// Defines the ttm setmaxtipwidth constant used by the minigui module.
const TTM_SETMAXTIPWIDTH = 1048
/// Defines the sw show constant used by the minigui module.
const SW_SHOW = 5
/// Defines the color btnface constant used by the minigui module.
const COLOR_BTNFACE = 15
/// Defines the rdw invalidate constant used by the minigui module.
const RDW_INVALIDATE = 1
/// Defines the rdw erase constant used by the minigui module.
const RDW_ERASE = 4
/// Defines the rdw allchildren constant used by the minigui module.
const RDW_ALLCHILDREN = 128
/// Defines the rdw updatenow constant used by the minigui module.
const RDW_UPDATENOW = 256
/// Defines the mb ok constant used by the minigui module.
const MB_OK = 0
/// Defines the mb okcancel constant used by the minigui module.
const MB_OKCANCEL = 1
/// Defines the mb abortretryignore constant used by the minigui module.
const MB_ABORTRETRYIGNORE = 2
/// Defines the mb yesnocancel constant used by the minigui module.
const MB_YESNOCANCEL = 3
/// Defines the mb yesno constant used by the minigui module.
const MB_YESNO = 4
/// Defines the mb retrycancel constant used by the minigui module.
const MB_RETRYCANCEL = 5
/// Defines the mb iconerror constant used by the minigui module.
const MB_ICONERROR = 16
/// Defines the mb iconquestion constant used by the minigui module.
const MB_ICONQUESTION = 32
/// Defines the mb iconwarning constant used by the minigui module.
const MB_ICONWARNING = 48
/// Defines the mb iconinformation constant used by the minigui module.
const MB_ICONINFORMATION = 64
/// Defines the idok constant used by the minigui module.
const IDOK = 1
/// Defines the idcancel constant used by the minigui module.
const IDCANCEL = 2
/// Defines the idabort constant used by the minigui module.
const IDABORT = 3
/// Defines the idretry constant used by the minigui module.
const IDRETRY = 4
/// Defines the idignore constant used by the minigui module.
const IDIGNORE = 5
/// Defines the idyes constant used by the minigui module.
const IDYES = 6
/// Defines the idno constant used by the minigui module.
const IDNO = 7
/// Defines the mf string constant used by the minigui module.
const MF_STRING = 0
/// Defines the tpm rightbutton constant used by the minigui module.
const TPM_RIGHTBUTTON = 2
/// Defines the tpm returncmd constant used by the minigui module.
const TPM_RETURNCMD = 256
/// Defines the ofn overwriteprompt constant used by the minigui module.
const OFN_OVERWRITEPROMPT = 2
/// Defines the ofn hidereadonly constant used by the minigui module.
const OFN_HIDEREADONLY = 4
/// Defines the ofn pathmustexist constant used by the minigui module.
const OFN_PATHMUSTEXIST = 2048
/// Defines the ofn filemustexist constant used by the minigui module.
const OFN_FILEMUSTEXIST = 4096
/// Defines the ofn explorer constant used by the minigui module.
const OFN_EXPLORER = 524288
/// Defines the cc rgbinit constant used by the minigui module.
const CC_RGBINIT = 1
/// Defines the cc fullopen constant used by the minigui module.
const CC_FULLOPEN = 2
/// Defines the bif returnonlyfsdirs constant used by the minigui module.
const BIF_RETURNONLYFSDIRS = 1
/// Defines the bif newdialogstyle constant used by the minigui module.
const BIF_NEWDIALOGSTYLE = 64
/// Defines the mk lbutton constant used by the minigui module.
const MK_LBUTTON = 1
/// UTF-8 code page used for explicit native string buffers.
const CP_UTF8 = 65001
/// Reject malformed UTF-8 instead of silently replacing invalid input.
const MB_ERR_INVALID_CHARS = 8

/// Stores module-wide active app state for the minigui module.
_activeApp = void
/// Stores module-wide window proc ptr state for the minigui module.
_windowProcPtr = 0
/// Stores module-wide timer proc ptr state for the minigui module.
_timerProcPtr = 0
/// Stores module-wide old window proc ptr state for the minigui module.
_oldWindowProcPtr = 0
/// Stores module-wide subclass handles state for the minigui module.
_subclassHandles = []
/// Stores module-wide subclass old procs state for the minigui module.
_subclassOldProcs = []
/// Stores module-wide tooltip handles state for the minigui module.
_tooltipHandles = []
/// Maps tooltip entries to their target control handles.
_tooltipControlHandles = []
/// Stores module-wide tooltip text bytes state for the minigui module.
_tooltipTextBytes = []
/// Stores module-wide style handles state for the minigui module.
_styleHandles = []
/// Stores module-wide style foregrounds state for the minigui module.
_styleForegrounds = []
/// Stores module-wide style backgrounds state for the minigui module.
_styleBackgrounds = []
/// Stores module-wide style brushes state for the minigui module.
_styleBrushes = []
/// Optional runtime layout metadata. Controls without entries keep the legacy
_layoutHandles = []
/// Stores module-wide layout resize modes state for the minigui module.
_layoutResizeModes = []
/// Stores module-wide layout anchors state for the minigui module.
_layoutAnchors = []
/// Stores module-wide layout min widths state for the minigui module.
_layoutMinWidths = []
/// Stores module-wide layout min heights state for the minigui module.
_layoutMinHeights = []
/// Stores module-wide layout max widths state for the minigui module.
_layoutMaxWidths = []
/// Stores module-wide layout max heights state for the minigui module.
_layoutMaxHeights = []
/// Stores module-wide resize initialized windows state for the minigui module.
_resizeInitializedWindows = []
/// Stores module-wide drag splitter state for the minigui module.
_dragSplitter = void
/// Stores module-wide drag splitter start x state for the minigui module.
_dragSplitterStartX = 0
/// Stores module-wide drag splitter start y state for the minigui module.
_dragSplitterStartY = 0
/// Stores module-wide drag splitter origin x state for the minigui module.
_dragSplitterOriginX = 0
/// Stores module-wide drag splitter origin y state for the minigui module.
_dragSplitterOriginY = 0
/// Stores module-wide data grid editor state for the minigui module.
_dataGridEditor = 0
/// Stores module-wide data grid edit grid state for the minigui module.
_dataGridEditGrid = void
/// Stores module-wide data grid edit row state for the minigui module.
_dataGridEditRow = -1
/// Stores module-wide data grid edit column state for the minigui module.
_dataGridEditColumn = -1
/// Stores module-wide data grid edit original state for the minigui module.
_dataGridEditOriginal = ""
/// Stores module-wide window class registered state for the minigui module.
_windowClassRegistered = false
/// Stores module-wide window class name bytes state for the minigui module.
_windowClassNameBytes = void

/// Restores module runtime defaults when MiniGui is loaded through a compiler
/// pipeline that does not materialize imported-module initializers eagerly.
/// Keeping this idempotent also makes repeated in-process application runs safe.
/// @internal
function _ensureRuntimeState()
  global _windowProcPtr
  global _timerProcPtr
  global _oldWindowProcPtr
  global _subclassHandles
  global _subclassOldProcs
  global _tooltipHandles
  global _tooltipControlHandles
  global _tooltipTextBytes
  global _styleHandles
  global _styleForegrounds
  global _styleBackgrounds
  global _styleBrushes
  global _layoutHandles
  global _layoutResizeModes
  global _layoutAnchors
  global _layoutMinWidths
  global _layoutMinHeights
  global _layoutMaxWidths
  global _layoutMaxHeights
  global _resizeInitializedWindows
  global _dragSplitterStartX
  global _dragSplitterStartY
  global _dragSplitterOriginX
  global _dragSplitterOriginY
  global _dataGridEditor
  global _dataGridEditRow
  global _dataGridEditColumn
  global _dataGridEditOriginal
  global _windowClassRegistered
  if _windowProcPtr is void then _windowProcPtr = 0 end if
  if _timerProcPtr is void then _timerProcPtr = 0 end if
  if _oldWindowProcPtr is void then _oldWindowProcPtr = 0 end if
  if _subclassHandles is void then _subclassHandles = [] end if
  if _subclassOldProcs is void then _subclassOldProcs = [] end if
  if _tooltipHandles is void then _tooltipHandles = [] end if
  if _tooltipControlHandles is void then _tooltipControlHandles = [] end if
  if _tooltipTextBytes is void then _tooltipTextBytes = [] end if
  if _styleHandles is void then _styleHandles = [] end if
  if _styleForegrounds is void then _styleForegrounds = [] end if
  if _styleBackgrounds is void then _styleBackgrounds = [] end if
  if _styleBrushes is void then _styleBrushes = [] end if
  if _layoutHandles is void then _layoutHandles = [] end if
  if _layoutResizeModes is void then _layoutResizeModes = [] end if
  if _layoutAnchors is void then _layoutAnchors = [] end if
  if _layoutMinWidths is void then _layoutMinWidths = [] end if
  if _layoutMinHeights is void then _layoutMinHeights = [] end if
  if _layoutMaxWidths is void then _layoutMaxWidths = [] end if
  if _layoutMaxHeights is void then _layoutMaxHeights = [] end if
  if _resizeInitializedWindows is void then _resizeInitializedWindows = [] end if
  if _dragSplitterStartX is void then _dragSplitterStartX = 0 end if
  if _dragSplitterStartY is void then _dragSplitterStartY = 0 end if
  if _dragSplitterOriginX is void then _dragSplitterOriginX = 0 end if
  if _dragSplitterOriginY is void then _dragSplitterOriginY = 0 end if
  if _dataGridEditor is void then _dataGridEditor = 0 end if
  if _dataGridEditRow is void then _dataGridEditRow = -1 end if
  if _dataGridEditColumn is void then _dataGridEditColumn = -1 end if
  if _dataGridEditOriginal is void then _dataGridEditOriginal = "" end if
  if _windowClassRegistered is void then _windowClassRegistered = false end if
end function

/// Releases process-local GUI resources after an application message loop.
/// Native windows own and destroy tooltip HWNDs; this function releases the
/// GDI brushes owned directly by MiniGui and drops the corresponding roots.
/// @internal
function _releaseRuntimeResources()
  global _activeApp
  global _subclassHandles
  global _subclassOldProcs
  global _tooltipHandles
  global _tooltipControlHandles
  global _tooltipTextBytes
  global _styleHandles
  global _styleForegrounds
  global _styleBackgrounds
  global _styleBrushes
  global _layoutHandles
  global _layoutResizeModes
  global _layoutAnchors
  global _layoutMinWidths
  global _layoutMinHeights
  global _layoutMaxWidths
  global _layoutMaxHeights
  global _resizeInitializedWindows
  if len(_styleBrushes) > 0 then
    for i = 0 to len(_styleBrushes) - 1
      brush = _styleBrushes[i]
      if brush != 0 then DeleteObject(brush) end if
    end for
  end if
  if len(_tooltipHandles) > 0 then
    for tooltipIndex = 0 to len(_tooltipHandles) - 1
      tooltip = _tooltipHandles[tooltipIndex]
      if tooltip != 0 and IsWindow(tooltip) then DestroyWindow(tooltip) end if
    end for
  end if
  _activeApp = void
  _subclassHandles = []
  _subclassOldProcs = []
  _tooltipHandles = []
  _tooltipControlHandles = []
  _tooltipTextBytes = []
  _styleHandles = []
  _styleForegrounds = []
  _styleBackgrounds = []
  _styleBrushes = []
  _layoutHandles = []
  _layoutResizeModes = []
  _layoutAnchors = []
  _layoutMinWidths = []
  _layoutMinHeights = []
  _layoutMaxWidths = []
  _layoutMaxHeights = []
  _resizeInitializedWindows = []
end function

/// Writes u32 le for the minigui workflow.
/// @param buf buf value consumed by this operation.
/// @param off off value consumed by this operation.
/// @param value Value consumed or transformed by the operation.
function inline _writeU32LE(buf, off, value)
  buf[off] = value & 255
  buf[off + 1] = (value >> 8) & 255
  buf[off + 2] = (value >> 16) & 255
  buf[off + 3] = (value >> 24) & 255
  return buf
end function

/// Writes ptr le for the minigui workflow.
/// @param buf buf value consumed by this operation.
/// @param off off value consumed by this operation.
/// @param value Value consumed or transformed by the operation.
function inline _writePtrLE(buf, off, value)
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

/// Reads i32 le for the minigui workflow.
/// @param buf buf value consumed by this operation.
/// @param off off value consumed by this operation.
function inline _readI32LE(buf, off)
  value = buf[off] | (buf[off + 1] << 8) | (buf[off + 2] << 16) | (buf[off + 3] << 24)
  return value
end function

/// Reads s32 le for the minigui workflow.
/// @param buf buf value consumed by this operation.
/// @param off off value consumed by this operation.
function inline _readS32LE(buf, off)
  value = _readI32LE(buf, off)
  if value >= 2147483648 then return value - 4294967296 end if
  return value
end function

/// Reads ptr le for the minigui workflow.
/// @param buf buf value consumed by this operation.
/// @param off off value consumed by this operation.
function inline _readPtrLE(buf, off)
  value = buf[off] | (buf[off + 1] << 8) | (buf[off + 2] << 16) | (buf[off + 3] << 24)
  value = value | (buf[off + 4] << 32) | (buf[off + 5] << 40) | (buf[off + 6] << 48) | (buf[off + 7] << 56)
  return value
end function

/// Performs the _asInt operation for the minigui module.
/// @param value Value consumed or transformed by the operation.
function _asInt(value)
  text = "" + value
  output = sb.StringBuilder.withCapacity(len(text))
  if len(text) > 0 then
    for i = 0 to len(text) - 1
      ch = text[i]
      if ch == "." then break end if
      output.appendString(ch)
    end for
  end if
  intText = output.toString()
  if intText == "" or intText == "-" then intText = "0" end if
  n = toNumber(intText)
  if typeof(n) == "int" then return n end if
  return 0
end function

/// Joins text for the minigui workflow.
/// @param items Items consumed or updated by the operation.
/// @param separator separator value consumed by this operation.
function _joinText(items, separator)
  output = sb.StringBuilder.new()
  if len(items) > 0 then
    for i = 0 to len(items) - 1
      if i > 0 then output.appendString(separator) end if
      output.appendString(items[i])
    end for
  end if
  return output.toString()
end function

/// Converts a MiniLang UTF-8 string to a NUL-terminated UTF-16LE buffer.
/// @param text Text consumed by the operation.
function _utf16Z(text)
  if typeof(text) != "string" then text = "" end if
  required = MultiByteToWideCharSize(CP_UTF8, MB_ERR_INVALID_CHARS, text, -1, 0, 0)
  if required <= 0 then return bytes(2, 0) end if
  output = bytes(required * 2, 0)
  if MultiByteToWideCharBytes(CP_UTF8, MB_ERR_INVALID_CHARS, text, -1, output, required) <= 0 then return bytes(2, 0) end if
  return output
end function

/// Performs the _ord operation for the minigui module.
/// @param text Text consumed by the operation.
function _ord(text)
  b = bytes(text)
  if len(b) > 0 then return b[0] end if
  return 0
end function

/// Performs the _itemTextAt operation for the minigui module.
/// @param itemsText itemsText value consumed by this operation.
/// @param index Zero-based index of the affected item.
function _itemTextAt(itemsText, index)
  current = sb.StringBuilder.new()
  currentIndex = 0
  if len(itemsText) > 0 then
    for i = 0 to len(itemsText) - 1
      ch = itemsText[i]
      if ch == "\n" then
        if currentIndex == index then return current.toString() end if
        current.clear()
        currentIndex = currentIndex + 1
      else
        current.appendString(ch)
      end if
    end for
  end if
  if currentIndex == index then return current.toString() end if
  return ""
end function

/// Performs the _itemCount operation for the minigui module.
/// @param itemsText itemsText value consumed by this operation.
function _itemCount(itemsText)
  if itemsText == "" then return 0 end if
  count = 1
  for i = 0 to len(itemsText) - 1
    if itemsText[i] == "\n" then count = count + 1 end if
  end for
  return count
end function

/// Performs the _textContains operation for the minigui module.
/// @param text Text consumed by the operation.
/// @param needle needle value consumed by this operation.
function _textContains(text, needle)
  if needle == "" then return true end if
  if len(text) < len(needle) then return false end if
  limit = len(text) - len(needle)
  for i = 0 to limit
    found = true
    for j = 0 to len(needle) - 1
      if text[i + j] != needle[j] then found = false end if
    end for
    if found then return true end if
  end for
  return false
end function

/// Normalizes edit text for the minigui workflow.
/// @param text Text consumed by the operation.
function _normalizeEditText(text)
  output = sb.StringBuilder.withCapacity(len(text) + 16)
  prev = ""
  if len(text) > 0 then
    for i = 0 to len(text) - 1
      ch = text[i]
      if ch == "\n" and prev != "\r" then
        output.appendString("\r\n")
      else
        output.appendString(ch)
      end if
      prev = ch
    end for
  end if
  return output.toString()
end function

/// Returns window text maintained by the minigui module.
/// @param hwnd hwnd value consumed by this operation.
function _getWindowText(hwnd)
  if hwnd == 0 then return "" end if
  n = GetWindowTextLengthW(hwnd)
  if n < 0 then return "" end if
  buf = bytes((n + 2) * 2, 0)
  GetWindowTextW(hwnd, buf, n + 1)
  text = decode16Z(buf)
  if typeof(text) == "string" then return text end if
  return ""
end function

/// Performs the _defaultWndProc operation for the minigui module.
/// @param hwnd hwnd value consumed by this operation.
/// @param msg msg value consumed by this operation.
/// @param wParam wParam value consumed by this operation.
/// @param lParam lParam value consumed by this operation.
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

/// Performs the _appForWindow operation for the minigui module.
/// @param hwnd hwnd value consumed by this operation.
function _appForWindow(hwnd)
  raw = GetWindowLongPtrW(hwnd, GWLP_USERDATA)
  if raw == 0 then return void end if
  return nativeValueFromRaw(raw)
end function

/// Performs the _miniGuiWndProc operation for the minigui module.
/// @param hwnd hwnd value consumed by this operation.
/// @param msg msg value consumed by this operation.
/// @param wParam wParam value consumed by this operation.
/// @param lParam lParam value consumed by this operation.
function _miniGuiWndProc(hwnd, msg, wParam, lParam)
  global _activeApp
  if msg == WM_CTLCOLOREDIT or msg == WM_CTLCOLORSTATIC or msg == WM_CTLCOLORBTN or msg == WM_CTLCOLORLISTBOX then
    appColor = _activeApp
    if appColor is void then appColor = _appForWindow(hwnd) end if
    if appColor is void == false then
      colorBrush = Control.applyCtlColor(appColor, lParam, wParam)
      if colorBrush != 0 then return colorBrush end if
    end if
    return _defaultWndProc(hwnd, msg, wParam, lParam)
  end if

  if msg == WM_KEYDOWN then
    appKey = _activeApp
    if appKey is void then appKey = _appForWindow(hwnd) end if
    if appKey is void == false then
      if wParam == VK_RETURN then
        if Events.commitDataGridEdit(appKey, hwnd, false) then return 0 end if
      end if
      if wParam == VK_ESCAPE then
        if Events.commitDataGridEdit(appKey, hwnd, true) then return 0 end if
      end if
    end if
    return _defaultWndProc(hwnd, msg, wParam, lParam)
  end if

  if msg == WM_SETFOCUS or msg == WM_KILLFOCUS then
    appFocus = _activeApp
    if appFocus is void then appFocus = _appForWindow(hwnd) end if
    if appFocus is void == false then
      if msg == WM_KILLFOCUS then
        if Events.commitDataGridEdit(appFocus, hwnd, false) then return 0 end if
      end if
      if Events.dispatchFocusByHandle(appFocus, hwnd, msg == WM_SETFOCUS) then
        return _defaultWndProc(hwnd, msg, wParam, lParam)
      end if
    end if
    return _defaultWndProc(hwnd, msg, wParam, lParam)
  end if

  if msg == WM_LBUTTONDOWN then
    appDown = _activeApp
    if appDown is void then appDown = _appForWindow(hwnd) end if
    if appDown is void == false then
      if Events.beginSplitterDrag(appDown, hwnd, lParam & 65535, (lParam >> 16) & 65535) then
        return 0
      end if
    end if
    return _defaultWndProc(hwnd, msg, wParam, lParam)
  end if

  if msg == WM_MOUSEMOVE then
    appMove = _activeApp
    if appMove is void then appMove = _appForWindow(hwnd) end if
    if appMove is void == false then
      if Events.dragSplitter(appMove, hwnd, wParam, lParam & 65535, (lParam >> 16) & 65535) then
        return 0
      end if
    end if
    return _defaultWndProc(hwnd, msg, wParam, lParam)
  end if

  if msg == WM_LBUTTONDBLCLK then
    appDbl = _activeApp
    if appDbl is void then appDbl = _appForWindow(hwnd) end if
    if appDbl is void == false then
      if Events.beginDataGridEdit(appDbl, hwnd, lParam & 65535, (lParam >> 16) & 65535) then return 0 end if
    end if
    return _defaultWndProc(hwnd, msg, wParam, lParam)
  end if

  if msg == WM_LBUTTONUP then
    appClick = _activeApp
    if appClick is void then appClick = _appForWindow(hwnd) end if
    if appClick is void == false then
      if Events.endSplitterDrag(appClick, hwnd) then return 0 end if
      // BUTTON's native procedure releases mouse capture and emits BN_CLICKED.
      // Dispatching the click here swallowed WM_LBUTTONUP, leaving capture stuck.
      buttonControl = Events.controlByHandle(appClick, hwnd)
      if buttonControl is void == false then
        if buttonControl.kind == "Button" or buttonControl.kind == "CheckBox" or buttonControl.kind == "RadioButton" or buttonControl.kind == "FilePicker" or buttonControl.kind == "FolderPicker" or buttonControl.kind == "ColorPicker" then
          return _defaultWndProc(hwnd, msg, wParam, lParam)
        end if
      end if
      if Events.isControlKind(appClick, hwnd, "TabControl") then
        tabClickX = lParam & 65535
        tabClickY = (lParam >> 16) & 65535
        if Events.dispatchTabClickedByHandle(appClick, hwnd, tabClickX, tabClickY) then
          return 0
        end if
        return _defaultWndProc(hwnd, msg, wParam, lParam)
      end if
      if Events.isControlKind(appClick, hwnd, "TreeView") then
        selectionClickX = lParam & 65535
        selectionClickY = (lParam >> 16) & 65535
        resultSelectionClick = _defaultWndProc(hwnd, msg, wParam, lParam)
        if Events.dispatchSelectionClickedByHandle(appClick, hwnd, selectionClickX, selectionClickY) then return 0 end if
        return resultSelectionClick
      end if
      if Events.isControlKind(appClick, hwnd, "ListView") then
        selectionClickX2 = lParam & 65535
        selectionClickY2 = (lParam >> 16) & 65535
        if Events.dispatchSelectionClickedByHandle(appClick, hwnd, selectionClickX2, selectionClickY2) then return 0 end if
        return 0
      end if
      if Events.isControlKind(appClick, hwnd, "DataGrid") then
        selectionClickX3 = lParam & 65535
        selectionClickY3 = (lParam >> 16) & 65535
        if Events.dispatchSelectionClickedByHandle(appClick, hwnd, selectionClickX3, selectionClickY3) then return 0 end if
        return 0
      end if
      clickX = lParam & 65535
      if Events.dispatchClickByHandle(appClick, hwnd, clickX) then
        return 0
      end if
    end if
    return _defaultWndProc(hwnd, msg, wParam, lParam)
  end if

  if msg == WM_RBUTTONUP then
    appContext = _activeApp
    if appContext is void then appContext = _appForWindow(hwnd) end if
    if appContext is void == false then
      contextX = lParam & 65535
      contextY = (lParam >> 16) & 65535
      if Events.dispatchContextMenu(appContext, hwnd, contextX, contextY) then return 0 end if
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
      if Events.dispatchNotify(appNotify, hwndFrom, wParam, notifyCode, lParam) then
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
        return 0
      end if
    end if
    // Native child controls must handle WM_SIZE themselves, otherwise combo
    // arrows and slider tracks keep their original dimensions after MoveWindow.
    return _defaultWndProc(hwnd, msg, wParam, lParam)
  end if

  if msg == WM_CLOSE then
    appClose = _activeApp
    if appClose is void then appClose = _appForWindow(hwnd) end if
    if appClose is void == false then
      win = Events.findWindowByHandle(appClose, hwnd)
      if Events.dispatchClose(appClose, win) then
        return 0
      end if
      if appClose.startupWindow == win then appClose.running = false end if
    end if
    DestroyWindow(hwnd)
    return 0
  end if

  if msg == WM_DESTROY then
    appDestroy = _activeApp
    if appDestroy is void then appDestroy = _appForWindow(hwnd) end if
    if appDestroy is void then return _defaultWndProc(hwnd, msg, wParam, lParam) end if
    destroyedWindow = Events.findWindowByHandle(appDestroy, hwnd)
    // Child controls use the same subclass procedure and also receive
    // WM_DESTROY. Only destruction of the startup window ends the app loop.
    if destroyedWindow is void then return _defaultWndProc(hwnd, msg, wParam, lParam) end if
    if appDestroy.startupWindow == destroyedWindow then
      appDestroy.running = false
      PostQuitMessage(0)
    end if
    return _defaultWndProc(hwnd, msg, wParam, lParam)
  end if

  return _defaultWndProc(hwnd, msg, wParam, lParam)
end function

/// Performs the _registerWindowClass operation for the minigui module.
function _registerWindowClass()
  global _windowClassRegistered
  global _windowClassNameBytes
  if _windowClassRegistered then return true end if

  cb = _ensureWindowProc()
  if cb == 0 then return false end if

  _windowClassNameBytes = _utf16Z("MiniGuiWindow")
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

/// Ensures window proc is available to the minigui workflow.
function _ensureWindowProc()
  global _windowProcPtr
  if _windowProcPtr == 0 then
    _windowProcPtr = nativeCallback(_miniGuiWndProc, "wndproc")
  end if
  return _windowProcPtr
end function

/// Performs the _miniGuiTimerProc operation for the minigui module.
/// @param hwnd hwnd value consumed by this operation.
/// @param msg msg value consumed by this operation.
/// @param wParam wParam value consumed by this operation.
/// @param lParam lParam value consumed by this operation.
function _miniGuiTimerProc(hwnd, msg, wParam, lParam)
  global _activeApp
  if _activeApp is void == false then
    Application.pollResize(_activeApp)
  end if
  return 0
end function

/// Ensures timer proc is available to the minigui workflow.
function _ensureTimerProc()
  global _timerProcPtr
  if _timerProcPtr == 0 then
    _timerProcPtr = nativeCallback(_miniGuiTimerProc, "wndproc")
  end if
  return _timerProcPtr
end function

/// Performs the _installWindowProc operation for the minigui module.
/// @param hwnd hwnd value consumed by this operation.
function _installWindowProc(hwnd)
  cb = _ensureWindowProc()
  return _installSpecificWindowProc(hwnd, cb)
end function

/// Performs the _installSpecificWindowProc operation for the minigui module.
/// @param hwnd hwnd value consumed by this operation.
/// @param cb cb value consumed by this operation.
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

/// Represents the event data used by the minigui module.
struct Event
  /// Stores the sender value associated with event.
  sender,
  /// Stores the event type value associated with event.
  eventType,
  /// Stores the old value value associated with event.
  oldValue,
  /// Stores the new value value associated with event.
  newValue,
  /// Stores the cancel value associated with event.
  cancel,
end struct

/// Represents the binding data used by the minigui module.
struct Binding
  /// Stores the control value associated with binding.
  control,
  /// Stores the callback value associated with binding.
  callback,
  /// Stores the context value associated with binding.
  context,
  /// Stores the event type value associated with binding.
  eventType,
end struct

/// Represents the native control data used by the minigui module.
struct NativeControl
  /// Stores the id value associated with native control.
  id,
  /// Stores the kind value associated with native control.
  kind,
  /// Stores the handle value associated with native control.
  handle,
  /// Stores the native id value associated with native control.
  nativeId,
  /// Stores the text value associated with native control.
  text,
  /// Stores the x value associated with native control.
  x,
  /// Stores the y value associated with native control.
  y,
  /// Stores the width value associated with native control.
  width,
  /// Stores the height value associated with native control.
  height,
  /// Stores the visible value associated with native control.
  visible,
  /// Stores the enabled value associated with native control.
  enabled,
  /// Stores the last text value associated with native control.
  lastText,
  /// Stores the last selection value associated with native control.
  lastSelection,
  /// Stores the scroll min value associated with native control.
  scrollMin,
  /// Stores the scroll max value associated with native control.
  scrollMax,
  /// Stores the scroll value value associated with native control.
  scrollValue,
  /// Stores the small step value associated with native control.
  smallStep,
  /// Stores the large step value associated with native control.
  largeStep,
  /// Stores the base x value associated with native control.
  baseX,
  /// Stores the base y value associated with native control.
  baseY,
  /// Stores the base width value associated with native control.
  baseWidth,
  /// Stores the base height value associated with native control.
  baseHeight,
  /// Stores the base client width value associated with native control.
  baseClientWidth,
  /// Stores the base client height value associated with native control.
  baseClientHeight,
  /// Stores the parent value associated with native control.
  parent,
  /// Stores the base parent width value associated with native control.
  baseParentWidth,
  /// Stores the base parent height value associated with native control.
  baseParentHeight,
end struct

/// Represents the application state data used by the minigui module.
struct ApplicationState
  /// Stores the windows value associated with application state.
  windows,
  /// Stores the controls value associated with application state.
  controls,
  /// Stores the click bindings value associated with application state.
  clickBindings,
  /// Stores the text bindings value associated with application state.
  textBindings,
  /// Stores the selection bindings value associated with application state.
  selectionBindings,
  /// Stores the scroll bindings value associated with application state.
  scrollBindings,
  /// Stores the load bindings value associated with application state.
  loadBindings,
  /// Stores the close bindings value associated with application state.
  closeBindings,
  /// Stores the resize bindings value associated with application state.
  resizeBindings,
  /// Stores the focus bindings value associated with application state.
  focusBindings,
  /// Stores the blur bindings value associated with application state.
  blurBindings,
  /// Stores the startup window value associated with application state.
  startupWindow,
  /// Stores the next native id value associated with application state.
  nextNativeId,
  /// Stores the running value associated with application state.
  running,
end struct

/// Represents the dialog window data used by the minigui module.
struct DialogWindow
  /// Stores the app value associated with dialog window.
  app,
  /// Stores the window value associated with dialog window.
  window,
  /// Stores the prompt label value associated with dialog window.
  promptLabel,
  /// Stores the input box value associated with dialog window.
  inputBox,
  /// Stores the ok button value associated with dialog window.
  okButton,
  /// Stores the cancel button value associated with dialog window.
  cancelButton,
  /// Stores the result value associated with dialog window.
  result,
  /// Stores the value value associated with dialog window.
  value,
end struct

/// Performs the _dialogInputOk operation for the minigui module.
/// @param context Context that carries state for the operation.
/// @param event event value consumed by this operation.
function _dialogInputOk(context, event)
  if context is void then return 0 end if
  context.result = "ok"
  if context.inputBox is void == false then context.value = Control.getText(context.inputBox) end if
  if context.window is void == false and context.window.handle is void == false then ShowWindow(context.window.handle, 0) end if
  return 0
end function

/// Performs the _dialogInputCancel operation for the minigui module.
/// @param context Context that carries state for the operation.
/// @param event event value consumed by this operation.
function _dialogInputCancel(context, event)
  if context is void then return 0 end if
  context.result = "cancel"
  if context.window is void == false and context.window.handle is void == false then ShowWindow(context.window.handle, 0) end if
  return 0
end function

/// Represents the application data used by the minigui module.
struct Application
  /// Creates application for the minigui application module.
  static function create()
    _ensureRuntimeState()
    return ApplicationState([], [], [], [], [], [], [], [], [], [], [], void, 1000, false)
  end function

  /// Adds window to the state managed by the minigui module.
  /// @param app Application instance operated on by this call.
  /// @param window window value consumed by this operation.
  static function addWindow(app, window)
    global _activeApp
    _activeApp = app
    app.windows = app.windows + [window]
    if app.startupWindow is void then
      app.startupWindow = window
    end if
    return window
  end function

  /// Adds control to the state managed by the minigui module.
  /// @param app Application instance operated on by this call.
  /// @param control control value consumed by this operation.
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

  /// Updates startup window maintained by the minigui module.
  /// @param app Application instance operated on by this call.
  /// @param window window value consumed by this operation.
  static function setStartupWindow(app, window)
    app.startupWindow = window
    return window
  end function

  /// Performs the windowProc operation for the minigui application module.
  /// @param hwnd hwnd value consumed by this operation.
  /// @param msg msg value consumed by this operation.
  /// @param wParam wParam value consumed by this operation.
  /// @param lParam lParam value consumed by this operation.
  static function windowProc(hwnd, msg, wParam, lParam)
    return _miniGuiWndProc(hwnd, msg, wParam, lParam)
  end function

  /// Performs the timerProc operation for the minigui application module.
  /// @param hwnd hwnd value consumed by this operation.
  /// @param msg msg value consumed by this operation.
  /// @param wParam wParam value consumed by this operation.
  /// @param lParam lParam value consumed by this operation.
  static function timerProc(hwnd, msg, wParam, lParam)
    return _miniGuiTimerProc(hwnd, msg, wParam, lParam)
  end function

  /// Performs the resizeWindow operation for the minigui application module.
  /// @param app Application instance operated on by this call.
  /// @param window window value consumed by this operation.
  /// @param clientWidth clientWidth value consumed by this operation.
  /// @param clientHeight clientHeight value consumed by this operation.
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
      initialSize = [window.width, window.height]
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
      Events.dispatchResize(app, window, initialSize, [clientWidth, clientHeight])
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
          resized = Control.layoutBounds(c, parentWidth, parentHeight, baseParentWidth, baseParentHeight)
          nx = resized[0]
          ny = resized[1]
          nw = resized[2]
          nh = resized[3]
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

  /// Performs the pollResize operation for the minigui application module.
  /// @param app Application instance operated on by this call.
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

  /// Performs the syncDynamicControls operation for the minigui application module.
  /// @param app Application instance operated on by this call.
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

  /// Performs the redrawAll operation for the minigui application module.
  /// @param app Application instance operated on by this call.
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

  /// Runs run for the minigui workflow.
  /// @param app Application instance operated on by this call.
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
      end if
    end while

    app.running = false
    _releaseRuntimeResources()
    return 0
  end function
  /// Processes native messages, optionally waiting for one.
  /// @param app app supplied by the caller.
  /// @param wait wait supplied by the caller.
  static function pump(app, wait)
    block = 0
    if wait then block = 1 end if
    return mx_pump(block) != 0
  end function

  /// Destroys application windows and releases runtime resources.
  /// @param app app supplied by the caller.
  static function dispose(app)
    for each window in app.windows
      if IsWindow(window.handle) then DestroyWindow(window.handle) end if
    end for
    app.running = false
    _releaseRuntimeResources()
    return true
  end function


end struct

/// Represents the window data used by the minigui module.
struct Window
  /// Creates window for the minigui window module.
  /// @param app Application instance operated on by this call.
  /// @param id Stable identifier of the affected item.
  /// @param title Human-readable title presented to the user.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
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

  /// Performs the show operation for the minigui window module.
  /// @param window window value consumed by this operation.
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

  /// Performs the installProc operation for the minigui window module.
  /// @param window window value consumed by this operation.
  /// @param callback Callback invoked when the operation completes or the event occurs.
  static function installProc(window, callback)
    global _oldWindowProcPtr
    if window is void then return false end if
    if window.handle is void then return false end if
    if callback == 0 then return false end if
    SetWindowLongPtrW(window.handle, GWLP_WNDPROC, callback)
    _oldWindowProcPtr = 0
    return true
  end function

  /// Starts resize timer for the minigui workflow.
  /// @param window window value consumed by this operation.
  /// @param callback Callback invoked when the operation completes or the event occurs.
  static function startResizeTimer(window, callback)
    if window is void then return false end if
    if window.handle is void then return false end if
    return SetTimer(window.handle, 1, 100, callback) != 0
  end function

  /// Closes close owned by the minigui module.
  /// @param window window value consumed by this operation.
  static function close(window)
    if window is void then return false end if
    if window.handle is void then return false end if
    return DestroyWindow(window.handle)
  end function

  /// Updates title maintained by the minigui module.
  /// @param window window value consumed by this operation.
  /// @param title Human-readable title presented to the user.
  static function setTitle(window, title)
    return Control.setText(window, title)
  end function

  /// Returns client width maintained by the minigui module.
  /// @param window window value consumed by this operation.
  static function getClientWidth(window)
    if window is void then return 0 end if
    if window.handle is void then return 0 end if
    rect = bytes(16, 0)
    if GetClientRect(window.handle, rect) == false then return window.width end if
    return _readI32LE(rect, 8) - _readI32LE(rect, 0)
  end function

  /// Returns client height maintained by the minigui module.
  /// @param window window value consumed by this operation.
  static function getClientHeight(window)
    if window is void then return 0 end if
    if window.handle is void then return 0 end if
    rect = bytes(16, 0)
    if GetClientRect(window.handle, rect) == false then return window.height end if
    return _readI32LE(rect, 12) - _readI32LE(rect, 4)
  end function
end struct

/// Represents the dialog data used by the minigui module.
struct Dialog
  /// Performs the _owner operation for the minigui dialog module.
  /// @param app Application instance operated on by this call.
  static function _owner(app)
    if app is void then return void end if
    if app.startupWindow is void then return void end if
    return app.startupWindow.handle
  end function

  /// Performs the _buttonFlags operation for the minigui dialog module.
  /// @param buttons buttons value consumed by this operation.
  static function _buttonFlags(buttons)
    if buttons == "okCancel" then return MB_OKCANCEL end if
    if buttons == "yesNo" then return MB_YESNO end if
    if buttons == "yesNoCancel" then return MB_YESNOCANCEL end if
    if buttons == "retryCancel" then return MB_RETRYCANCEL end if
    if buttons == "abortRetryIgnore" then return MB_ABORTRETRYIGNORE end if
    return MB_OK
  end function

  /// Performs the _iconFlags operation for the minigui dialog module.
  /// @param icon icon value consumed by this operation.
  static function _iconFlags(icon)
    if icon == "info" or icon == "information" then return MB_ICONINFORMATION end if
    if icon == "warning" then return MB_ICONWARNING end if
    if icon == "error" then return MB_ICONERROR end if
    if icon == "question" then return MB_ICONQUESTION end if
    return 0
  end function

  /// Performs the resultName operation for the minigui dialog module.
  /// @param code code value consumed by this operation.
  static function resultName(code)
    if code == IDOK then return "ok" end if
    if code == IDCANCEL then return "cancel" end if
    if code == IDABORT then return "abort" end if
    if code == IDRETRY then return "retry" end if
    if code == IDIGNORE then return "ignore" end if
    if code == IDYES then return "yes" end if
    if code == IDNO then return "no" end if
    return "unknown"
  end function

  /// Performs the showMessage operation for the minigui dialog module.
  /// @param app Application instance operated on by this call.
  /// @param title Human-readable title presented to the user.
  /// @param message Human-readable message associated with the operation.
  /// @param buttons buttons value consumed by this operation.
  /// @param icon icon value consumed by this operation.
  static function showMessage(app, title, message, buttons, icon)
    code = MessageBoxW(Dialog._owner(app), message, title, Dialog._buttonFlags(buttons) | Dialog._iconFlags(icon))
    return Dialog.resultName(code)
  end function

  /// Performs the _filterBytes operation for the minigui dialog module.
  /// @param filter filter value consumed by this operation.
  static function _filterBytes(filter)
    raw = filter
    if raw == "" then raw = "All files (*.*)|*.*" end if
    outv = bytes((len(raw) + 2) * 2, 0)
    pos = 0
    if len(raw) > 0 then
      for i = 0 to len(raw) - 1
        ch = raw[i]
        if ch == "|" then
          pos = pos + 2
        else
          b = bytes(ch)
          if len(b) > 0 then outv[pos] = b[0] end if
          pos = pos + 2
        end if
      end for
    end if
    return outv
  end function

  /// Performs the _fileDialog operation for the minigui dialog module.
  /// @param app Application instance operated on by this call.
  /// @param title Human-readable title presented to the user.
  /// @param filter filter value consumed by this operation.
  /// @param saveDialog saveDialog value consumed by this operation.
  static function _fileDialog(app, title, filter, saveDialog)
    fileBytes = bytes(4096, 0)
    filterBytes = Dialog._filterBytes(filter)
    titleBytes = _utf16Z(title)
    ofn = bytes(152, 0)
    _writeU32LE(ofn, 0, 152)
    _writePtrLE(ofn, 8, Dialog._owner(app))
    _writePtrLE(ofn, 24, nativeBytesPtr(filterBytes))
    _writeU32LE(ofn, 44, 1)
    _writePtrLE(ofn, 48, nativeBytesPtr(fileBytes))
    _writeU32LE(ofn, 56, 2048)
    _writePtrLE(ofn, 88, nativeBytesPtr(titleBytes))
    flags = OFN_EXPLORER | OFN_HIDEREADONLY | OFN_PATHMUSTEXIST
    if saveDialog then
      flags = flags | OFN_OVERWRITEPROMPT
      _writeU32LE(ofn, 96, flags)
      if GetSaveFileNameW(ofn) == false then return "" end if
    else
      flags = flags | OFN_FILEMUSTEXIST
      _writeU32LE(ofn, 96, flags)
      if GetOpenFileNameW(ofn) == false then return "" end if
    end if
    return decode16Z(fileBytes)
  end function

  /// Performs the _hexDigit operation for the minigui dialog module.
  /// @param value Value consumed or transformed by the operation.
  static function _hexDigit(value)
    digits = "0123456789ABCDEF"
    v = value & 15
    return digits[v]
  end function

  /// Performs the _hexByte operation for the minigui dialog module.
  /// @param value Value consumed or transformed by the operation.
  static function _hexByte(value)
    return Dialog._hexDigit(value >> 4) + Dialog._hexDigit(value)
  end function

  /// Performs the _hexValueAt operation for the minigui dialog module.
  /// @param text Text consumed by the operation.
  /// @param pos pos value consumed by this operation.
  static function _hexValueAt(text, pos)
    if pos >= len(text) then return 0 end if
    c = _ord(text[pos])
    if c >= 48 and c <= 57 then return c - 48 end if
    if c >= 65 and c <= 70 then return c - 55 end if
    if c >= 97 and c <= 102 then return c - 87 end if
    return 0
  end function

  /// Performs the _colorFromHex operation for the minigui dialog module.
  /// @param text Text consumed by the operation.
  static function _colorFromHex(text)
    if len(text) < 7 then return 0 end if
    r = (Dialog._hexValueAt(text, 1) << 4) | Dialog._hexValueAt(text, 2)
    g = (Dialog._hexValueAt(text, 3) << 4) | Dialog._hexValueAt(text, 4)
    b = (Dialog._hexValueAt(text, 5) << 4) | Dialog._hexValueAt(text, 6)
    return r | (g << 8) | (b << 16)
  end function

  /// Performs the _colorToHex operation for the minigui dialog module.
  /// @param color color value consumed by this operation.
  static function _colorToHex(color)
    r = color & 255
    g = (color >> 8) & 255
    b = (color >> 16) & 255
    return "#" + Dialog._hexByte(r) + Dialog._hexByte(g) + Dialog._hexByte(b)
  end function

  /// Performs the showInfo operation for the minigui dialog module.
  /// @param app Application instance operated on by this call.
  /// @param title Human-readable title presented to the user.
  /// @param message Human-readable message associated with the operation.
  static function showInfo(app, title, message)
    return MessageBoxW(Dialog._owner(app), message, title, MB_OK | MB_ICONINFORMATION)
  end function

  /// Performs the info operation for the minigui dialog module.
  /// @param app Application instance operated on by this call.
  /// @param title Human-readable title presented to the user.
  /// @param message Human-readable message associated with the operation.
  static function info(app, title, message)
    return Dialog.showMessage(app, title, message, "ok", "info")
  end function

  /// Performs the showWarning operation for the minigui dialog module.
  /// @param app Application instance operated on by this call.
  /// @param title Human-readable title presented to the user.
  /// @param message Human-readable message associated with the operation.
  static function showWarning(app, title, message)
    return MessageBoxW(Dialog._owner(app), message, title, MB_OK | MB_ICONWARNING)
  end function

  /// Performs the warning operation for the minigui dialog module.
  /// @param app Application instance operated on by this call.
  /// @param title Human-readable title presented to the user.
  /// @param message Human-readable message associated with the operation.
  static function warning(app, title, message)
    return Dialog.showMessage(app, title, message, "ok", "warning")
  end function

  /// Performs the showError operation for the minigui dialog module.
  /// @param app Application instance operated on by this call.
  /// @param title Human-readable title presented to the user.
  /// @param message Human-readable message associated with the operation.
  static function showError(app, title, message)
    return MessageBoxW(Dialog._owner(app), message, title, MB_OK | MB_ICONERROR)
  end function

  /// Performs the errorMessage operation for the minigui dialog module.
  /// @param app Application instance operated on by this call.
  /// @param title Human-readable title presented to the user.
  /// @param message Human-readable message associated with the operation.
  static function errorMessage(app, title, message)
    return Dialog.showMessage(app, title, message, "ok", "error")
  end function

  /// Performs the confirm operation for the minigui dialog module.
  /// @param app Application instance operated on by this call.
  /// @param title Human-readable title presented to the user.
  /// @param message Human-readable message associated with the operation.
  static function confirm(app, title, message)
    return MessageBoxW(Dialog._owner(app), message, title, MB_OKCANCEL | MB_ICONQUESTION) == IDOK
  end function

  /// Performs the question operation for the minigui dialog module.
  /// @param app Application instance operated on by this call.
  /// @param title Human-readable title presented to the user.
  /// @param message Human-readable message associated with the operation.
  static function question(app, title, message)
    return Dialog.showMessage(app, title, message, "yesNo", "question")
  end function

  /// Performs the yesNo operation for the minigui dialog module.
  /// @param app Application instance operated on by this call.
  /// @param title Human-readable title presented to the user.
  /// @param message Human-readable message associated with the operation.
  static function yesNo(app, title, message)
    return Dialog.showMessage(app, title, message, "yesNo", "question")
  end function

  /// Performs the yesNoCancel operation for the minigui dialog module.
  /// @param app Application instance operated on by this call.
  /// @param title Human-readable title presented to the user.
  /// @param message Human-readable message associated with the operation.
  static function yesNoCancel(app, title, message)
    return Dialog.showMessage(app, title, message, "yesNoCancel", "question")
  end function

  /// Performs the retryCancel operation for the minigui dialog module.
  /// @param app Application instance operated on by this call.
  /// @param title Human-readable title presented to the user.
  /// @param message Human-readable message associated with the operation.
  static function retryCancel(app, title, message)
    return Dialog.showMessage(app, title, message, "retryCancel", "warning")
  end function

  /// Performs the abortRetryIgnore operation for the minigui dialog module.
  /// @param app Application instance operated on by this call.
  /// @param title Human-readable title presented to the user.
  /// @param message Human-readable message associated with the operation.
  static function abortRetryIgnore(app, title, message)
    return Dialog.showMessage(app, title, message, "abortRetryIgnore", "warning")
  end function

  /// Creates custom for the minigui dialog module.
  /// @param app Application instance operated on by this call.
  /// @param id Stable identifier of the affected item.
  /// @param title Human-readable title presented to the user.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  static function createCustom(app, id, title, width, height)
    win = Window.create(app, id, title, width, height)
    return DialogWindow(app, win, void, void, void, void, "", "")
  end function

  /// Closes close owned by the minigui module.
  /// @param dialog dialog value consumed by this operation.
  /// @param result Result object populated or inspected by the operation.
  static function close(dialog, result)
    if dialog is void then return false end if
    dialog.result = result
    if dialog.window is void == false and dialog.window.handle is void == false then
      ShowWindow(dialog.window.handle, 0)
      return true
    end if
    return false
  end function

  /// Returns result maintained by the minigui module.
  /// @param dialog dialog value consumed by this operation.
  static function getResult(dialog)
    if dialog is void then return "" end if
    return dialog.result
  end function

  /// Returns value maintained by the minigui module.
  /// @param dialog dialog value consumed by this operation.
  static function getValue(dialog)
    if dialog is void then return "" end if
    if dialog.inputBox is void == false then dialog.value = Control.getText(dialog.inputBox) end if
    return dialog.value
  end function

  /// Updates value maintained by the minigui module.
  /// @param dialog dialog value consumed by this operation.
  /// @param value Value consumed or transformed by the operation.
  static function setValue(dialog, value)
    if dialog is void then return false end if
    dialog.value = value
    if dialog.inputBox is void == false then return Control.setText(dialog.inputBox, value) end if
    return true
  end function

  /// Performs the showModal operation for the minigui dialog module.
  /// @param dialog dialog value consumed by this operation.
  static function showModal(dialog)
    if dialog is void then return "cancel" end if
    if dialog.window is void then return "cancel" end if
    dialog.result = ""
    Window.show(dialog.window)
    msg = bytes(48, 0)
    while dialog.result == "" and IsWindow(dialog.window.handle)
      rc = GetMessageW(msg, void, 0, 0)
      if rc <= 0 then
        if dialog.result == "" then dialog.result = "cancel" end if
      else
        TranslateMessage(msg)
        DispatchMessageW(msg)
        Application.pollResize(dialog.app)
      end if
    end while
    if dialog.result == "" then dialog.result = "cancel" end if
    return dialog.result
  end function

  /// Creates input for the minigui dialog module.
  /// @param app Application instance operated on by this call.
  /// @param id Stable identifier of the affected item.
  /// @param title Human-readable title presented to the user.
  /// @param prompt prompt value consumed by this operation.
  /// @param defaultValue defaultValue value consumed by this operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  static function createInput(app, id, title, prompt, defaultValue, width)
    if width <= 0 then width = 420 end if
    win = Window.create(app, id, title, width, 160)
    label = Label.create(app, win, id + "_prompt", prompt, 14, 14, width - 42, 24)
    input = TextBox.create(app, win, id + "_input", defaultValue, 14, 44, width - 42, 26)
    ok = Button.create(app, win, id + "_ok", "OK", width - 194, 88, 80, 28)
    cancel = Button.create(app, win, id + "_cancel", "Cancel", width - 106, 88, 80, 28)
    dialog = DialogWindow(app, win, label, input, ok, cancel, "", defaultValue)
    Events.bindClick(app, ok, _dialogInputOk, dialog)
    Events.bindClick(app, cancel, _dialogInputCancel, dialog)
    return dialog
  end function

  /// Performs the showInput operation for the minigui dialog module.
  /// @param app Application instance operated on by this call.
  /// @param title Human-readable title presented to the user.
  /// @param prompt prompt value consumed by this operation.
  /// @param defaultValue defaultValue value consumed by this operation.
  static function showInput(app, title, prompt, defaultValue)
    dialog = Dialog.createInput(app, "__inputDialog", title, prompt, defaultValue, 420)
    result = Dialog.showModal(dialog)
    if result == "ok" then return Dialog.getValue(dialog) end if
    return ""
  end function

  /// Performs the pickOpenFile operation for the minigui dialog module.
  /// @param app Application instance operated on by this call.
  /// @param title Human-readable title presented to the user.
  /// @param filter filter value consumed by this operation.
  static function pickOpenFile(app, title, filter)
    return Dialog._fileDialog(app, title, filter, false)
  end function

  /// Performs the pickSaveFile operation for the minigui dialog module.
  /// @param app Application instance operated on by this call.
  /// @param title Human-readable title presented to the user.
  /// @param filter filter value consumed by this operation.
  static function pickSaveFile(app, title, filter)
    return Dialog._fileDialog(app, title, filter, true)
  end function

  /// Performs the pickFolder operation for the minigui dialog module.
  /// @param app Application instance operated on by this call.
  /// @param title Human-readable title presented to the user.
  static function pickFolder(app, title)
    pathBytes = bytes(4096, 0)
    titleBytes = _utf16Z(title)
    displayName = bytes(520, 0)
    bi = bytes(64, 0)
    _writePtrLE(bi, 0, Dialog._owner(app))
    _writePtrLE(bi, 16, nativeBytesPtr(displayName))
    _writePtrLE(bi, 24, nativeBytesPtr(titleBytes))
    _writeU32LE(bi, 32, BIF_RETURNONLYFSDIRS | BIF_NEWDIALOGSTYLE)
    itemList = SHBrowseForFolderW(bi)
    if itemList == 0 then return "" end if
    ok = SHGetPathFromIDListW(itemList, pathBytes)
    CoTaskMemFree(itemList)
    if ok == false then return "" end if
    return decode16Z(pathBytes)
  end function

  /// Performs the pickColor operation for the minigui dialog module.
  /// @param app Application instance operated on by this call.
  /// @param title Human-readable title presented to the user.
  /// @param fallback Value returned when no explicit result is available.
  static function pickColor(app, title, fallback)
    customColors = bytes(64, 0)
    cc = bytes(72, 0)
    _writeU32LE(cc, 0, 72)
    _writePtrLE(cc, 8, Dialog._owner(app))
    _writeU32LE(cc, 24, Dialog._colorFromHex(fallback))
    _writePtrLE(cc, 32, nativeBytesPtr(customColors))
    _writeU32LE(cc, 40, CC_RGBINIT | CC_FULLOPEN)
    if ChooseColorW(cc) == false then return fallback end if
    return Dialog._colorToHex(_readI32LE(cc, 24))
  end function
end struct

/// Represents the label data used by the minigui module.
struct Label
  /// Creates label for the minigui label module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  static function create(app, parent, id, text, x, y, width, height)
    hwnd = CreateWindowExW(0, "STATIC", text, WS_CHILD | WS_VISIBLE | SS_LEFT, x, y, width, height, parent.handle, void, void, void)
    c = NativeControl(id, "Label", hwnd, 0, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

/// Represents the button data used by the minigui module.
struct Button
  /// Creates button for the minigui button module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  static function create(app, parent, id, text, x, y, width, height)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    hwnd = CreateWindowExW(0, "BUTTON", text, WS_CHILD | WS_VISIBLE | WS_TABSTOP | BS_PUSHBUTTON, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "Button", hwnd, nid, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

/// Represents the text box data used by the minigui module.
struct TextBox
  /// Creates text box for the minigui text box module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  static function create(app, parent, id, text, x, y, width, height)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    style = WS_CHILD | WS_VISIBLE | WS_TABSTOP | WS_BORDER | ES_AUTOHSCROLL
    hwnd = CreateWindowExW(0, "EDIT", text, style, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "TextBox", hwnd, nid, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

/// Represents the file picker data used by the minigui module.
struct FilePicker
  /// Creates file picker for the minigui file picker module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  /// @param title Human-readable title presented to the user.
  /// @param filter filter value consumed by this operation.
  static function create(app, parent, id, text, x, y, width, height, title, filter)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    label = text
    if label == "" then label = "Browse..." end if
    hwnd = CreateWindowExW(0, "BUTTON", label, WS_CHILD | WS_VISIBLE | WS_TABSTOP | BS_PUSHBUTTON, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "FilePicker", hwnd, nid, label, x, y, width, height, true, true, title + "\n" + filter, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

/// Represents the folder picker data used by the minigui module.
struct FolderPicker
  /// Creates folder picker for the minigui folder picker module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  /// @param title Human-readable title presented to the user.
  static function create(app, parent, id, text, x, y, width, height, title)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    label = text
    if label == "" then label = "Browse..." end if
    hwnd = CreateWindowExW(0, "BUTTON", label, WS_CHILD | WS_VISIBLE | WS_TABSTOP | BS_PUSHBUTTON, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "FolderPicker", hwnd, nid, label, x, y, width, height, true, true, title, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

/// Represents the color picker data used by the minigui module.
struct ColorPicker
  /// Creates color picker for the minigui color picker module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  /// @param title Human-readable title presented to the user.
  /// @param value Value consumed or transformed by the operation.
  static function create(app, parent, id, text, x, y, width, height, title, value)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    label = text
    if label == "" then label = "Choose color" end if
    hwnd = CreateWindowExW(0, "BUTTON", label, WS_CHILD | WS_VISIBLE | WS_TABSTOP | BS_PUSHBUTTON, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "ColorPicker", hwnd, nid, label, x, y, width, height, true, true, title + "\n" + value, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

/// Represents the search box data used by the minigui module.
struct SearchBox
  /// Creates search box for the minigui search box module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  static function create(app, parent, id, text, x, y, width, height)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    style = WS_CHILD | WS_VISIBLE | WS_TABSTOP | WS_BORDER | ES_AUTOHSCROLL
    hwnd = CreateWindowExW(0, "EDIT", text, style, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "SearchBox", hwnd, nid, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

/// Represents the text area data used by the minigui module.
struct TextArea
  /// Creates text area for the minigui text area module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  static function create(app, parent, id, text, x, y, width, height)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    style = WS_CHILD | WS_VISIBLE | WS_TABSTOP | WS_BORDER | WS_VSCROLL | ES_MULTILINE | ES_AUTOVSCROLL | ES_WANTRETURN
    startText = _normalizeEditText(text)
    hwnd = CreateWindowExW(0, "EDIT", startText, style, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "TextArea", hwnd, nid, startText, x, y, width, height, true, true, startText, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

/// Represents the password box data used by the minigui module.
struct PasswordBox
  /// Creates password box for the minigui password box module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  static function create(app, parent, id, text, x, y, width, height)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    style = WS_CHILD | WS_VISIBLE | WS_TABSTOP | WS_BORDER | ES_AUTOHSCROLL | ES_PASSWORD
    hwnd = CreateWindowExW(0, "EDIT", text, style, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "PasswordBox", hwnd, nid, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

/// Represents the number box data used by the minigui module.
struct NumberBox
  /// Creates number box for the minigui number box module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  /// @param minimum minimum value consumed by this operation.
  /// @param maximum maximum value consumed by this operation.
  /// @param value Value consumed or transformed by the operation.
  /// @param step step value consumed by this operation.
  static function create(app, parent, id, text, x, y, width, height, minimum, maximum, value, step)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    style = WS_CHILD | WS_VISIBLE | WS_TABSTOP | WS_BORDER | ES_AUTOHSCROLL | ES_NUMBER
    startText = text
    if startText == "" then startText = "" + value end if
    hwnd = CreateWindowExW(0, "EDIT", startText, style, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "NumberBox", hwnd, nid, startText, x, y, width, height, true, true, startText, -1, minimum, maximum, value, step, step, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

/// Represents the spin box data used by the minigui module.
struct SpinBox
  /// Creates spin box for the minigui spin box module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  /// @param minimum minimum value consumed by this operation.
  /// @param maximum maximum value consumed by this operation.
  /// @param value Value consumed or transformed by the operation.
  /// @param step step value consumed by this operation.
  static function create(app, parent, id, text, x, y, width, height, minimum, maximum, value, step)
    InitCommonControls()
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    upDownId = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    style = WS_CHILD | WS_VISIBLE | WS_TABSTOP | WS_BORDER | ES_AUTOHSCROLL | ES_NUMBER
    startText = text
    if startText == "" then startText = "" + value end if
    hwnd = CreateWindowExW(0, "EDIT", startText, style, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    upDown = CreateWindowExW(0, "msctls_updown32", "", WS_CHILD | WS_VISIBLE | UDS_SETBUDDYINT | UDS_ALIGNRIGHT | UDS_ARROWKEYS | UDS_NOTHOUSANDS, x + width - 18, y, 18, height, parent.handle, upDownId, void, void)
    if upDown != 0 then
      SendMessageW(upDown, UDM_SETBUDDY, hwnd, 0)
      SendMessageW(upDown, UDM_SETRANGE32, minimum, maximum)
      SendMessageW(upDown, UDM_SETPOS32, 0, value)
    end if
    c = NativeControl(id, "SpinBox", hwnd, nid, startText, x, y, width, height, true, true, startText, -1, minimum, maximum, value, step, step, x, y, width, height, upDownId, upDown, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

/// Represents the check box data used by the minigui module.
struct CheckBox
  /// Creates check box for the minigui check box module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  /// @param checked checked value consumed by this operation.
  static function create(app, parent, id, text, x, y, width, height, checked)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    hwnd = CreateWindowExW(0, "BUTTON", text, WS_CHILD | WS_VISIBLE | WS_TABSTOP | BS_AUTOCHECKBOX, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    if checked then SendMessageW(hwnd, BM_SETCHECK, BST_CHECKED, 0) end if
    c = NativeControl(id, "CheckBox", hwnd, nid, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

/// Represents the toggle switch data used by the minigui module.
struct ToggleSwitch
  /// Creates toggle switch for the minigui toggle switch module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  /// @param checked checked value consumed by this operation.
  static function create(app, parent, id, text, x, y, width, height, checked)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    hwnd = CreateWindowExW(0, "BUTTON", text, WS_CHILD | WS_VISIBLE | WS_TABSTOP | BS_AUTOCHECKBOX, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    if checked then SendMessageW(hwnd, BM_SETCHECK, BST_CHECKED, 0) end if
    c = NativeControl(id, "ToggleSwitch", hwnd, nid, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

/// Represents the radio button data used by the minigui module.
struct RadioButton
  /// Creates radio button for the minigui radio button module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  /// @param checked checked value consumed by this operation.
  static function create(app, parent, id, text, x, y, width, height, checked)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    hwnd = CreateWindowExW(0, "BUTTON", text, WS_CHILD | WS_VISIBLE | WS_TABSTOP | BS_AUTORADIOBUTTON, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    if checked then SendMessageW(hwnd, BM_SETCHECK, BST_CHECKED, 0) end if
    c = NativeControl(id, "RadioButton", hwnd, nid, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

/// Represents the image data used by the minigui module.
struct Image
  /// Creates image for the minigui image module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  /// @param source source value consumed by this operation.
  /// @param stretch stretch value consumed by this operation.
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

/// Represents the separator data used by the minigui module.
struct Separator
  /// Creates separator for the minigui separator module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  /// @param orientation orientation value consumed by this operation.
  static function create(app, parent, id, text, x, y, width, height, orientation)
    style = WS_CHILD | WS_VISIBLE | SS_ETCHEDHORZ
    if orientation == "vertical" then style = WS_CHILD | WS_VISIBLE | SS_ETCHEDVERT end if
    hwnd = CreateWindowExW(0, "STATIC", text, style, x, y, width, height, parent.handle, void, void, void)
    c = NativeControl(id, "Separator", hwnd, 0, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

/// Represents the splitter data used by the minigui module.
struct Splitter
  /// Creates splitter for the minigui splitter module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  /// @param orientation orientation value consumed by this operation.
  static function create(app, parent, id, text, x, y, width, height, orientation)
    return Splitter.createPane(app, parent, id, text, x, y, width, height, orientation, "", "")
  end function

  /// Creates pane for the minigui splitter module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  /// @param orientation orientation value consumed by this operation.
  /// @param targetBefore targetBefore value consumed by this operation.
  /// @param targetAfter targetAfter value consumed by this operation.
  static function createPane(app, parent, id, text, x, y, width, height, orientation, targetBefore, targetAfter)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    style = WS_CHILD | WS_VISIBLE | SS_ETCHEDHORZ
    if orientation == "vertical" then style = WS_CHILD | WS_VISIBLE | SS_ETCHEDVERT end if
    hwnd = CreateWindowExW(0, "STATIC", text, style | SS_NOTIFY, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    meta = orientation + "\n" + targetBefore + "\n" + targetAfter
    c = NativeControl(id, "Splitter", hwnd, nid, text, x, y, width, height, true, true, meta, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

/// Represents the link label data used by the minigui module.
struct LinkLabel
  /// Creates link label for the minigui link label module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  /// @param url url value consumed by this operation.
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

/// Represents the panel data used by the minigui module.
struct Panel
  /// Creates panel for the minigui panel module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  static function create(app, parent, id, text, x, y, width, height)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    hwnd = CreateWindowExW(0, "STATIC", text, WS_CHILD | WS_VISIBLE, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "Panel", hwnd, nid, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function

  /// Creates tab page for the minigui panel module.
  /// @param app Application instance operated on by this call.
  /// @param tabControl tabControl value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  static function createTabPage(app, tabControl, id, text, x, y, width, height)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    nativeParent = tabControl
    nativeX = x
    nativeY = y
    if tabControl is void == false then
      if tabControl.parent is void == false then
        nativeParent = tabControl.parent
        nativeX = tabControl.x + x
        nativeY = tabControl.y + y
      end if
    end if
    hwnd = CreateWindowExW(0, "STATIC", text, WS_CHILD | WS_VISIBLE, nativeX, nativeY, width, height, nativeParent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "TabPage", hwnd, nid, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, tabControl, tabControl.width, tabControl.height)
    return Application.addControl(app, c)
  end function
end struct

/// Represents the scroll viewer data used by the minigui module.
struct ScrollViewer
  /// Creates scroll viewer for the minigui scroll viewer module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  /// @param horizontalScroll horizontalScroll value consumed by this operation.
  /// @param verticalScroll verticalScroll value consumed by this operation.
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

/// Represents the group box data used by the minigui module.
struct GroupBox
  /// Creates group box for the minigui group box module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  static function create(app, parent, id, text, x, y, width, height)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    hwnd = CreateWindowExW(0, "BUTTON", text, WS_CHILD | WS_VISIBLE | BS_GROUPBOX, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "GroupBox", hwnd, nid, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

/// Represents the scroll bar data used by the minigui module.
struct ScrollBar
  /// Creates scroll bar for the minigui scroll bar module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  /// @param orientation orientation value consumed by this operation.
  /// @param minimum minimum value consumed by this operation.
  /// @param maximum maximum value consumed by this operation.
  /// @param value Value consumed or transformed by the operation.
  /// @param smallStep smallStep value consumed by this operation.
  /// @param largeStep largeStep value consumed by this operation.
  static function create(app, parent, id, text, x, y, width, height, orientation, minimum, maximum, value, smallStep, largeStep)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    style = WS_CHILD | WS_VISIBLE | SBS_VERT
    if orientation == "horizontal" then style = WS_CHILD | WS_VISIBLE | SBS_HORZ end if
    hwnd = CreateWindowExW(0, "SCROLLBAR", text, style | WS_TABSTOP, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "ScrollBar", hwnd, nid, text, x, y, width, height, true, true, text, -1, minimum, maximum, value, smallStep, largeStep, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    Control.setScrollRange(c, minimum, maximum)
    Control.setScrollValue(c, value)
    return Application.addControl(app, c)
  end function
end struct

/// Represents the slider data used by the minigui module.
struct Slider
  /// Creates slider for the minigui slider module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  /// @param orientation orientation value consumed by this operation.
  /// @param minimum minimum value consumed by this operation.
  /// @param maximum maximum value consumed by this operation.
  /// @param value Value consumed or transformed by the operation.
  /// @param smallStep smallStep value consumed by this operation.
  /// @param largeStep largeStep value consumed by this operation.
  static function create(app, parent, id, text, x, y, width, height, orientation, minimum, maximum, value, smallStep, largeStep)
    InitCommonControls()
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    style = WS_CHILD | WS_VISIBLE | TBS_AUTOTICKS
    if orientation == "vertical" then style = WS_CHILD | WS_VISIBLE | TBS_AUTOTICKS | TBS_VERT end if
    hwnd = CreateWindowExW(0, "msctls_trackbar32", text, style | WS_TABSTOP, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "Slider", hwnd, nid, text, x, y, width, height, true, true, text, -1, minimum, maximum, value, smallStep, largeStep, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    Control.setScrollRange(c, minimum, maximum)
    Control.setScrollSteps(c, smallStep, largeStep)
    Control.setScrollValue(c, value)
    return Application.addControl(app, c)
  end function
end struct

/// Represents the progress bar data used by the minigui module.
struct ProgressBar
  /// Creates progress bar for the minigui progress bar module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  /// @param minimum minimum value consumed by this operation.
  /// @param maximum maximum value consumed by this operation.
  /// @param value Value consumed or transformed by the operation.
  static function create(app, parent, id, text, x, y, width, height, minimum, maximum, value)
    InitCommonControls()
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    hwnd = CreateWindowExW(0, "msctls_progress32", text, WS_CHILD | WS_VISIBLE, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "ProgressBar", hwnd, nid, text, x, y, width, height, true, true, text, -1, minimum, maximum, value, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    Control.setValueRange(c, minimum, maximum)
    Control.setValue(c, value)
    return Application.addControl(app, c)
  end function
end struct

/// Represents the tab control data used by the minigui module.
struct TabControl
  /// Creates tab control for the minigui tab control module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  /// @param items Items consumed or updated by the operation.
  /// @param selectedIndex Zero-based index of selected.
  static function create(app, parent, id, text, x, y, width, height, items, selectedIndex)
    InitCommonControls()
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    hwnd = CreateWindowExW(0, "SysTabControl32", text, WS_CHILD | WS_VISIBLE | WS_TABSTOP, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "TabControl", hwnd, nid, text, x, y, width, height, true, true, text, selectedIndex, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    if len(items) > 0 then
      for i = 0 to len(items) - 1
        TabControl.addTab(c, i, items[i])
      end for
    end if
    return Application.addControl(app, c)
  end function

  /// Adds tab to the state managed by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param index Zero-based index of the affected item.
  /// @param text Text consumed by the operation.
  static function addTab(control, index, text)
    if control is void then return false end if
    if control.handle is void then return false end if
    textBytes = _utf16Z(text)
    item = bytes(40, 0)
    _writeU32LE(item, 0, TCIF_TEXT)
    _writePtrLE(item, 16, nativeBytesPtr(textBytes))
    _writeU32LE(item, 24, len(text))
    SendMessageW(control.handle, TCM_INSERTITEMW, index, nativeBytesPtr(item))
    return true
  end function
end struct

/// Represents the menu bar data used by the minigui module.
struct MenuBar
  /// Creates menu bar for the minigui menu bar module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  /// @param items Items consumed or updated by the operation.
  static function create(app, parent, id, text, x, y, width, height, items)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    label = text
    if label == "" and len(items) > 0 then label = "  " + _joinText(items, "    ") end if
    hwnd = CreateWindowExW(0, "STATIC", label, WS_CHILD | WS_VISIBLE | SS_LEFT | SS_NOTIFY, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "MenuBar", hwnd, nid, label, x, y, width, height, true, true, label, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    c.lastText = _joinText(items, "\n")
    return Application.addControl(app, c)
  end function
end struct

/// Represents the context menu data used by the minigui module.
struct ContextMenu
  /// Creates context menu for the minigui context menu module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  /// @param items Items consumed or updated by the operation.
  static function create(app, parent, id, text, x, y, width, height, items)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    menu = CreatePopupMenu()
    if len(items) > 0 then
      for i = 0 to len(items) - 1
        AppendMenuW(menu, MF_STRING, i + 1, items[i])
      end for
    end if
    c = NativeControl(id, "ContextMenu", menu, nid, text, x, y, width, height, false, true, _joinText(items, "\n"), -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

/// Represents the status bar data used by the minigui module.
struct StatusBar
  /// Creates status bar for the minigui status bar module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  static function create(app, parent, id, text, x, y, width, height)
    InitCommonControls()
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    hwnd = CreateWindowExW(0, "msctls_statusbar32", text, WS_CHILD | WS_VISIBLE, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "StatusBar", hwnd, nid, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

/// Represents the tool bar data used by the minigui module.
struct ToolBar
  /// Creates tool bar for the minigui tool bar module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  /// @param items Items consumed or updated by the operation.
  static function create(app, parent, id, text, x, y, width, height, items)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    label = text
    if label == "" and len(items) > 0 then label = "  " + _joinText(items, "  |  ") end if
    hwnd = CreateWindowExW(0, "STATIC", label, WS_CHILD | WS_VISIBLE | SS_LEFT | SS_NOTIFY, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "ToolBar", hwnd, nid, label, x, y, width, height, true, true, label, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    c.lastText = _joinText(items, "\n")
    return Application.addControl(app, c)
  end function
end struct

/// Represents the tree view data used by the minigui module.
struct TreeView
  /// Creates tree view for the minigui tree view module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  /// @param items Items consumed or updated by the operation.
  static function create(app, parent, id, text, x, y, width, height, items)
    InitCommonControls()
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    hwnd = CreateWindowExW(0, "SysTreeView32", text, WS_CHILD | WS_VISIBLE | WS_TABSTOP | WS_BORDER | TVS_HASLINES | TVS_LINESATROOT | TVS_HASBUTTONS, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "TreeView", hwnd, nid, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    Control.setItems(c, items)
    return Application.addControl(app, c)
  end function
end struct

/// Represents the list view data used by the minigui module.
struct ListView
  /// Creates list view for the minigui list view module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  /// @param items Items consumed or updated by the operation.
  /// @param selectedIndex Zero-based index of selected.
  static function create(app, parent, id, text, x, y, width, height, items, selectedIndex)
    InitCommonControls()
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    hwnd = CreateWindowExW(0, "SysListView32", text, WS_CHILD | WS_VISIBLE | WS_TABSTOP | WS_BORDER | LVS_REPORT | LVS_SINGLESEL, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "ListView", hwnd, nid, text, x, y, width, height, true, true, text, selectedIndex, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    Control.ensureListViewColumn(c)
    Control.setItems(c, items)
    if selectedIndex >= 0 then Control.setSelectedIndex(c, selectedIndex) end if
    c.lastSelection = Control.getSelectedIndex(c)
    return Application.addControl(app, c)
  end function

  /// Creates columns for the minigui list view module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  /// @param columns columns value consumed by this operation.
  /// @param items Items consumed or updated by the operation.
  /// @param selectedIndex Zero-based index of selected.
  static function createColumns(app, parent, id, text, x, y, width, height, columns, items, selectedIndex)
    InitCommonControls()
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    hwnd = CreateWindowExW(0, "SysListView32", text, WS_CHILD | WS_VISIBLE | WS_TABSTOP | WS_BORDER | LVS_REPORT | LVS_SINGLESEL, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "ListView", hwnd, nid, text, x, y, width, height, true, true, text, selectedIndex, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    Control.setListViewColumns(c, columns)
    Control.setItems(c, items)
    if selectedIndex >= 0 then Control.setSelectedIndex(c, selectedIndex) end if
    c.lastSelection = Control.getSelectedIndex(c)
    return Application.addControl(app, c)
  end function
end struct

/// Represents the data grid data used by the minigui module.
struct DataGrid
  /// Creates data grid for the minigui data grid module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  /// @param columns columns value consumed by this operation.
  /// @param items Items consumed or updated by the operation.
  /// @param selectedIndex Zero-based index of selected.
  static function create(app, parent, id, text, x, y, width, height, columns, items, selectedIndex)
    InitCommonControls()
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    hwnd = CreateWindowExW(0, "SysListView32", text, WS_CHILD | WS_VISIBLE | WS_TABSTOP | WS_BORDER | LVS_REPORT | LVS_SINGLESEL, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "DataGrid", hwnd, nid, text, x, y, width, height, true, true, text, selectedIndex, 0, 100, 0, 1, 0, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    Control.setListViewColumns(c, columns)
    Control.setItems(c, items)
    if selectedIndex >= 0 then Control.setSelectedIndex(c, selectedIndex) end if
    c.lastSelection = Control.getSelectedIndex(c)
    return Application.addControl(app, c)
  end function
end struct

/// Represents the date picker data used by the minigui module.
struct DatePicker
  /// Creates date picker for the minigui date picker module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  static function create(app, parent, id, text, x, y, width, height)
    InitCommonControls()
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    hwnd = CreateWindowExW(0, "SysDateTimePick32", text, WS_CHILD | WS_VISIBLE | WS_TABSTOP | DTS_SHORTDATEFORMAT, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "DatePicker", hwnd, nid, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

/// Represents the date time picker data used by the minigui module.
struct DateTimePicker
  /// Creates date time picker for the minigui date time picker module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  static function create(app, parent, id, text, x, y, width, height)
    InitCommonControls()
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    hwnd = CreateWindowExW(0, "SysDateTimePick32", text, WS_CHILD | WS_VISIBLE | WS_TABSTOP | DTS_SHORTDATEFORMAT, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "DateTimePicker", hwnd, nid, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

/// Represents the time picker data used by the minigui module.
struct TimePicker
  /// Creates time picker for the minigui time picker module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  static function create(app, parent, id, text, x, y, width, height)
    InitCommonControls()
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    hwnd = CreateWindowExW(0, "SysDateTimePick32", text, WS_CHILD | WS_VISIBLE | WS_TABSTOP | DTS_TIMEFORMAT | DTS_UPDOWN, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "TimePicker", hwnd, nid, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

/// Represents the calendar data used by the minigui module.
struct Calendar
  /// Creates calendar for the minigui calendar module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  static function create(app, parent, id, text, x, y, width, height)
    InitCommonControls()
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    hwnd = CreateWindowExW(0, "SysMonthCal32", text, WS_CHILD | WS_VISIBLE | WS_TABSTOP | WS_BORDER, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "Calendar", hwnd, nid, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    return Application.addControl(app, c)
  end function
end struct

/// Represents the combo box data used by the minigui module.
struct ComboBox
  /// Creates combo box for the minigui combo box module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  /// @param items Items consumed or updated by the operation.
  /// @param selectedIndex Zero-based index of selected.
  static function create(app, parent, id, text, x, y, width, height, items, selectedIndex)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    style = WS_CHILD | WS_VISIBLE | WS_TABSTOP | WS_VSCROLL | CBS_DROPDOWNLIST | CBS_HASSTRINGS
    hwnd = CreateWindowExW(0, "COMBOBOX", text, style, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "ComboBox", hwnd, nid, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    Control.setItems(c, items)
    if selectedIndex >= 0 then Control.setSelectedIndex(c, selectedIndex) end if
    c.lastSelection = Control.getSelectedIndex(c)
    return Application.addControl(app, c)
  end function
end struct

/// Represents the editable combo box data used by the minigui module.
struct EditableComboBox
  /// Creates editable combo box for the minigui editable combo box module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  /// @param items Items consumed or updated by the operation.
  /// @param selectedIndex Zero-based index of selected.
  static function create(app, parent, id, text, x, y, width, height, items, selectedIndex)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    style = WS_CHILD | WS_VISIBLE | WS_TABSTOP | WS_VSCROLL | CBS_DROPDOWN | CBS_HASSTRINGS
    hwnd = CreateWindowExW(0, "COMBOBOX", text, style, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "EditableComboBox", hwnd, nid, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    Control.setItems(c, items)
    if selectedIndex >= 0 then Control.setSelectedIndex(c, selectedIndex) end if
    c.lastSelection = Control.getSelectedIndex(c)
    return Application.addControl(app, c)
  end function
end struct

/// Represents the list box data used by the minigui module.
struct ListBox
  /// Creates list box for the minigui list box module.
  /// @param app Application instance operated on by this call.
  /// @param parent parent value consumed by this operation.
  /// @param id Stable identifier of the affected item.
  /// @param text Text consumed by the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  /// @param items Items consumed or updated by the operation.
  /// @param selectedIndex Zero-based index of selected.
  static function create(app, parent, id, text, x, y, width, height, items, selectedIndex)
    nid = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    style = WS_CHILD | WS_VISIBLE | WS_TABSTOP | WS_BORDER | WS_VSCROLL | LBS_NOTIFY
    hwnd = CreateWindowExW(0, "LISTBOX", text, style, x, y, width, height, parent.handle, nid, void, void)
    if hwnd != 0 then _installWindowProc(hwnd) end if
    c = NativeControl(id, "ListBox", hwnd, nid, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
    Control.setItems(c, items)
    if selectedIndex >= 0 then Control.setSelectedIndex(c, selectedIndex) end if
    c.lastSelection = Control.getSelectedIndex(c)
    return Application.addControl(app, c)
  end function
end struct

/// Represents the control data used by the minigui module.
struct Control
  /// Updates text maintained by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param text Text consumed by the operation.
  static function setText(control, text)
    if control is void then return false end if
    if control.kind == "TextArea" then text = _normalizeEditText(text) end if
    control.text = text
    control.lastText = text
    if control.handle is void then return false end if
    if control.kind == "StatusBar" then
      SendMessageTextW(control.handle, SB_SETTEXTW, 0, text)
      return true
    end if
    return SetWindowTextW(control.handle, text)
  end function

  /// Returns text maintained by the minigui module.
  /// @param control control value consumed by this operation.
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

  /// Updates enabled maintained by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param enabled enabled value consumed by this operation.
  static function setEnabled(control, enabled)
    if control is void then return false end if
    control.enabled = enabled
    if control.handle is void then return false end if
    return EnableWindow(control.handle, enabled)
  end function

  /// Updates visible maintained by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param visible visible value consumed by this operation.
  static function setVisible(control, visible)
    if control is void then return false end if
    control.visible = visible
    if control.kind == "TrayIcon" then
      v = 0
      if visible then v = 1 end if
      return mx_property(control.handle, "visible", "", v) != 0
    end if
    if control.handle is void then return false end if
    if visible then
      return ShowWindow(control.handle, SW_SHOW)
    end if
    return ShowWindow(control.handle, 0)
  end function

  /// Updates tooltip maintained by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param text Text consumed by the operation.
  static function setTooltip(control, text)
    if control is void then return false end if
    if control.handle is void then return false end if
    if text == "" then return false end if
    InitCommonControls()
    owner = void
    if control.parent is void == false then owner = control.parent.handle end if
    tooltip = CreateWindowExW(0, "tooltips_class32", "", TTS_ALWAYSTIP, 0, 0, 0, 0, owner, void, void, void)
    if tooltip == 0 then return false end if
    textBytes = _utf16Z(text)
    tool = bytes(72, 0)
    _writeU32LE(tool, 0, 72)
    _writeU32LE(tool, 4, TTF_IDISHWND | TTF_SUBCLASS)
    _writePtrLE(tool, 8, owner)
    _writePtrLE(tool, 16, control.handle)
    _writePtrLE(tool, 48, nativeBytesPtr(textBytes))
    SendMessageW(tooltip, TTM_ADDTOOLW, 0, nativeBytesPtr(tool))
    SendMessageW(tooltip, TTM_SETMAXTIPWIDTH, 0, 360)
    global _tooltipHandles
    global _tooltipControlHandles
    global _tooltipTextBytes
    existing = -1
    if len(_tooltipControlHandles) > 0 then
      for i = 0 to len(_tooltipControlHandles) - 1
        if _tooltipControlHandles[i] == control.handle then existing = i end if
      end for
    end if
    if existing >= 0 then
      oldTooltip = _tooltipHandles[existing]
      _tooltipHandles[existing] = tooltip
      _tooltipTextBytes[existing] = textBytes
      if oldTooltip != 0 then DestroyWindow(oldTooltip) end if
    else
      _tooltipHandles = _tooltipHandles + [tooltip]
      _tooltipControlHandles = _tooltipControlHandles + [control.handle]
      _tooltipTextBytes = _tooltipTextBytes + [textBytes]
    end if
    return true
  end function

  /// Updates tab index maintained by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param tabIndex Zero-based index of tab.
  static function setTabIndex(control, tabIndex)
    if control is void then return false end if
    return tabIndex >= 0
  end function

  /// Performs the _styleIndex operation for the minigui control module.
  /// @param handle Native or runtime handle used by the operation.
  static function _styleIndex(handle)
    global _styleHandles
    if len(_styleHandles) > 0 then
      for i = 0 to len(_styleHandles) - 1
        if _styleHandles[i] == handle then return i end if
      end for
    end if
    return -1
  end function

  /// Ensures style is available to the minigui workflow.
  /// @param control control value consumed by this operation.
  static function _ensureStyle(control)
    if control is void then return -1 end if
    if control.handle is void then return -1 end if
    global _styleHandles
    global _styleForegrounds
    global _styleBackgrounds
    global _styleBrushes
    index = Control._styleIndex(control.handle)
    if index >= 0 then return index end if
    _styleHandles = _styleHandles + [control.handle]
    _styleForegrounds = _styleForegrounds + [-1]
    _styleBackgrounds = _styleBackgrounds + [-1]
    _styleBrushes = _styleBrushes + [0]
    return len(_styleHandles) - 1
  end function

  /// Updates foreground maintained by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param color color value consumed by this operation.
  static function setForeground(control, color)
    index = Control._ensureStyle(control)
    if index < 0 then return false end if
    global _styleForegrounds
    _styleForegrounds[index] = Dialog._colorFromHex(color)
    RedrawWindow(control.handle, void, void, RDW_INVALIDATE | RDW_ERASE | RDW_UPDATENOW)
    return true
  end function

  /// Updates background maintained by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param color color value consumed by this operation.
  static function setBackground(control, color)
    index = Control._ensureStyle(control)
    if index < 0 then return false end if
    global _styleBackgrounds
    global _styleBrushes
    nativeColor = Dialog._colorFromHex(color)
    _styleBackgrounds[index] = nativeColor
    oldBrush = _styleBrushes[index]
    newBrush = CreateSolidBrush(nativeColor)
    if newBrush == 0 then return false end if
    _styleBrushes[index] = newBrush
    if oldBrush != 0 then DeleteObject(oldBrush) end if
    RedrawWindow(control.handle, void, void, RDW_INVALIDATE | RDW_ERASE | RDW_UPDATENOW)
    return true
  end function

  /// Updates border maintained by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param color color value consumed by this operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  static function setBorder(control, color, width)
    if control is void then return false end if
    return width >= 0
  end function

  /// Updates font maintained by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param family family value consumed by this operation.
  /// @param size Size in the units required by the operation.
  /// @param weight weight value consumed by this operation.
  static function setFont(control, family, size, weight)
    if control is void then return false end if
    return mx_property(control.handle, "font", family, size) != 0
  end function

  /// Performs the applyCtlColor operation for the minigui control module.
  /// @param app Application instance operated on by this call.
  /// @param hwndControl hwndControl value consumed by this operation.
  /// @param hdc hdc value consumed by this operation.
  static function applyCtlColor(app, hwndControl, hdc)
    index = Control._styleIndex(hwndControl)
    if index < 0 then return 0 end if
    global _styleForegrounds
    global _styleBackgrounds
    global _styleBrushes
    fg = _styleForegrounds[index]
    bg = _styleBackgrounds[index]
    if fg >= 0 then SetTextColor(hdc, fg) end if
    if bg >= 0 then
      SetBkColor(hdc, bg)
      brush = _styleBrushes[index]
      if brush != 0 then return brush end if
    end if
    return 0
  end function

  /// Updates read only maintained by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param readOnly readOnly value consumed by this operation.
  static function setReadOnly(control, readOnly)
    if control is void then return false end if
    if control.handle is void then return false end if
    if control.kind == "TextBox" or control.kind == "SearchBox" or control.kind == "TextArea" or control.kind == "RichTextBox" or control.kind == "CodeEditor" or control.kind == "PasswordBox" or control.kind == "NumberBox" or control.kind == "SpinBox" then
      flag = 0
      if readOnly then flag = 1 end if
      SendMessageW(control.handle, EM_SETREADONLY, flag, 0)
      return true
    end if
    return false
  end function

  /// Updates max length maintained by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param maxLength maxLength value consumed by this operation.
  static function setMaxLength(control, maxLength)
    if control is void then return false end if
    if control.handle is void then return false end if
    if maxLength < 0 then maxLength = 0 end if
    if control.kind == "TextBox" or control.kind == "SearchBox" or control.kind == "TextArea" or control.kind == "RichTextBox" or control.kind == "CodeEditor" or control.kind == "PasswordBox" or control.kind == "NumberBox" or control.kind == "SpinBox" then
      SendMessageW(control.handle, EM_LIMITTEXT, maxLength, 0)
      return true
    end if
    return false
  end function

  /// Performs the _layoutIndex operation for the minigui control module.
  /// @param control control value consumed by this operation.
  static function _layoutIndex(control)
    if control is void then return -1 end if
    if control.handle is void then return -1 end if
    global _layoutHandles
    if len(_layoutHandles) > 0 then
      for i = 0 to len(_layoutHandles) - 1
        if _layoutHandles[i] == control.handle then return i end if
      end for
    end if
    return -1
  end function

  /// Updates layout maintained by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param resizeMode resizeMode value consumed by this operation.
  /// @param anchor anchor value consumed by this operation.
  /// @param minWidth minWidth value consumed by this operation.
  /// @param minHeight minHeight value consumed by this operation.
  /// @param maxWidth maxWidth value consumed by this operation.
  /// @param maxHeight maxHeight value consumed by this operation.
  static function setLayout(control, resizeMode, anchor, minWidth, minHeight, maxWidth, maxHeight)
    if control is void then return false end if
    if control.handle is void then return false end if
    if resizeMode == "" then resizeMode = "scale" end if
    if resizeMode != "scale" and resizeMode != "none" and resizeMode != "anchor" and resizeMode != "fill" then resizeMode = "scale" end if
    if anchor == "" then anchor = "left,top" end if
    global _layoutHandles
    global _layoutResizeModes
    global _layoutAnchors
    global _layoutMinWidths
    global _layoutMinHeights
    global _layoutMaxWidths
    global _layoutMaxHeights
    index = Control._layoutIndex(control)
    if index < 0 then
      _layoutHandles = _layoutHandles + [control.handle]
      _layoutResizeModes = _layoutResizeModes + [resizeMode]
      _layoutAnchors = _layoutAnchors + [anchor]
      _layoutMinWidths = _layoutMinWidths + [minWidth]
      _layoutMinHeights = _layoutMinHeights + [minHeight]
      _layoutMaxWidths = _layoutMaxWidths + [maxWidth]
      _layoutMaxHeights = _layoutMaxHeights + [maxHeight]
    else
      _layoutResizeModes[index] = resizeMode
      _layoutAnchors[index] = anchor
      _layoutMinWidths[index] = minWidth
      _layoutMinHeights[index] = minHeight
      _layoutMaxWidths[index] = maxWidth
      _layoutMaxHeights[index] = maxHeight
    end if
    return true
  end function

  /// Performs the layoutValue operation for the minigui control module.
  /// @param control control value consumed by this operation.
  /// @param slot slot value consumed by this operation.
  /// @param fallback Value returned when no explicit result is available.
  static function layoutValue(control, slot, fallback)
    index = Control._layoutIndex(control)
    if index < 0 then return fallback end if
    global _layoutResizeModes
    global _layoutAnchors
    global _layoutMinWidths
    global _layoutMinHeights
    global _layoutMaxWidths
    global _layoutMaxHeights
    if slot == "mode" then return _layoutResizeModes[index] end if
    if slot == "anchor" then return _layoutAnchors[index] end if
    if slot == "minWidth" then return _layoutMinWidths[index] end if
    if slot == "minHeight" then return _layoutMinHeights[index] end if
    if slot == "maxWidth" then return _layoutMaxWidths[index] end if
    if slot == "maxHeight" then return _layoutMaxHeights[index] end if
    return fallback
  end function

  /// Performs the clampLayoutWidth operation for the minigui control module.
  /// @param control control value consumed by this operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  static function clampLayoutWidth(control, width)
    minWidth = Control.layoutValue(control, "minWidth", -1)
    maxWidth = Control.layoutValue(control, "maxWidth", -1)
    if minWidth >= 0 and width < minWidth then width = minWidth end if
    if maxWidth >= 0 and width > maxWidth then width = maxWidth end if
    if width < 1 then width = 1 end if
    return width
  end function

  /// Performs the clampLayoutHeight operation for the minigui control module.
  /// @param control control value consumed by this operation.
  /// @param height Height in the coordinate or storage units used by the caller.
  static function clampLayoutHeight(control, height)
    minHeight = Control.layoutValue(control, "minHeight", -1)
    maxHeight = Control.layoutValue(control, "maxHeight", -1)
    if minHeight >= 0 and height < minHeight then height = minHeight end if
    if maxHeight >= 0 and height > maxHeight then height = maxHeight end if
    if height < 1 then height = 1 end if
    return height
  end function

  /// Performs the layoutBounds operation for the minigui control module.
  /// @param control control value consumed by this operation.
  /// @param parentWidth parentWidth value consumed by this operation.
  /// @param parentHeight parentHeight value consumed by this operation.
  /// @param baseParentWidth baseParentWidth value consumed by this operation.
  /// @param baseParentHeight baseParentHeight value consumed by this operation.
  static function layoutBounds(control, parentWidth, parentHeight, baseParentWidth, baseParentHeight)
    if control is void then return [0, 0, 1, 1] end if
    if baseParentWidth <= 0 then baseParentWidth = parentWidth end if
    if baseParentHeight <= 0 then baseParentHeight = parentHeight end if
    deltaW = parentWidth - baseParentWidth
    deltaH = parentHeight - baseParentHeight
    mode = Control.layoutValue(control, "mode", "scale")
    anchor = Control.layoutValue(control, "anchor", "left,top")
    nx = control.baseX
    ny = control.baseY
    nw = control.baseWidth
    nh = control.baseHeight
    if mode == "scale" then
      nx = control.baseX * parentWidth / baseParentWidth
      ny = control.baseY * parentHeight / baseParentHeight
      nw = control.baseWidth * parentWidth / baseParentWidth
      nh = control.baseHeight * parentHeight / baseParentHeight
    else if mode == "fill" then
      nw = control.baseWidth + deltaW
      nh = control.baseHeight + deltaH
    else if mode == "anchor" then
      left = _textContains(anchor, "left")
      top = _textContains(anchor, "top")
      right = _textContains(anchor, "right")
      bottom = _textContains(anchor, "bottom")
      if left and right then nw = control.baseWidth + deltaW
      else if right then nx = control.baseX + deltaW
      end if
      if top and bottom then nh = control.baseHeight + deltaH
      else if bottom then ny = control.baseY + deltaH
      end if
    end if
    nw = Control.clampLayoutWidth(control, nw)
    nh = Control.clampLayoutHeight(control, nh)
    return [_asInt(nx), _asInt(ny), _asInt(nw), _asInt(nh)]
  end function

  /// Updates bounds maintained by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  static function setBounds(control, x, y, width, height)
    if control is void then return false end if
    control.baseX = x
    control.baseY = y
    control.baseWidth = width
    control.baseHeight = height
    return Control.moveCurrent(control, x, y, width, height)
  end function

  /// Performs the moveCurrent operation for the minigui control module.
  /// @param control control value consumed by this operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
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
    if control.kind == "ContextMenu" then return true end if
    if control.handle is void then return false end if
    nativeX = x
    nativeY = y
    if control.kind == "TabPage" then
      if control.parent is void == false then
        nativeX = control.parent.x + x
        nativeY = control.parent.y + y
      end if
    end if
    moved = MoveWindow(control.handle, nativeX, nativeY, width, height, true)
    if control.kind == "SpinBox" and control.baseClientHeight != 0 then
      MoveWindow(control.baseClientHeight, nativeX + width - 18, nativeY, 18, height, true)
    end if
    if control.kind == "ListView" or control.kind == "DataGrid" then
      Control.updateListViewColumnWidths(control)
    end if
    return moved
  end function

  /// Finds by id used by the minigui module.
  /// @param app Application instance operated on by this call.
  /// @param id Stable identifier of the affected item.
  static function findById(app, id)
    if app is void then return void end if
    if len(app.controls) > 0 then
      for i = 0 to len(app.controls) - 1
        c = app.controls[i]
        if c is void == false then
          if c.id == id then return c end if
        end if
      end for
    end if
    return void
  end function

  /// Performs the splitterOrientation operation for the minigui control module.
  /// @param splitter splitter value consumed by this operation.
  static function splitterOrientation(splitter)
    if splitter is void then return "horizontal" end if
    value = _itemTextAt(splitter.lastText, 0)
    if value == "" then return "horizontal" end if
    return value
  end function

  /// Performs the splitterTargetBeforeId operation for the minigui control module.
  /// @param splitter splitter value consumed by this operation.
  static function splitterTargetBeforeId(splitter)
    if splitter is void then return "" end if
    return _itemTextAt(splitter.lastText, 1)
  end function

  /// Performs the splitterTargetAfterId operation for the minigui control module.
  /// @param splitter splitter value consumed by this operation.
  static function splitterTargetAfterId(splitter)
    if splitter is void then return "" end if
    return _itemTextAt(splitter.lastText, 2)
  end function

  /// Performs the resizeSplitterTargets operation for the minigui control module.
  /// @param app Application instance operated on by this call.
  /// @param splitter splitter value consumed by this operation.
  /// @param oldX oldX value consumed by this operation.
  /// @param oldY oldY value consumed by this operation.
  /// @param newX newX value consumed by this operation.
  /// @param newY newY value consumed by this operation.
  static function resizeSplitterTargets(app, splitter, oldX, oldY, newX, newY)
    if app is void then return false end if
    if splitter is void then return false end if
    if splitter.kind != "Splitter" then return false end if
    beforeId = Control.splitterTargetBeforeId(splitter)
    afterId = Control.splitterTargetAfterId(splitter)
    if beforeId == "" or afterId == "" then return false end if
    before = Control.findById(app, beforeId)
    after = Control.findById(app, afterId)
    if before is void or after is void then return false end if
    orientation = Control.splitterOrientation(splitter)
    if orientation == "vertical" then
      deltaX = newX - oldX
      beforeWidth = before.width + deltaX
      afterX = after.x + deltaX
      afterWidth = after.width - deltaX
      if beforeWidth < 20 then return false end if
      if afterWidth < 20 then return false end if
      Control.setBounds(before, before.x, before.y, beforeWidth, before.height)
      Control.setBounds(after, afterX, after.y, afterWidth, after.height)
      return true
    end if
    deltaY = newY - oldY
    beforeHeight = before.height + deltaY
    afterY = after.y + deltaY
    afterHeight = after.height - deltaY
    if beforeHeight < 20 then return false end if
    if afterHeight < 20 then return false end if
    Control.setBounds(before, before.x, before.y, before.width, beforeHeight)
    Control.setBounds(after, after.x, afterY, after.width, afterHeight)
    return true
  end function

  /// Updates position maintained by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  static function setPosition(control, x, y)
    if control is void then return false end if
    return Control.setBounds(control, x, y, control.width, control.height)
  end function

  /// Updates size maintained by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param width Width in the coordinate or storage units used by the caller.
  /// @param height Height in the coordinate or storage units used by the caller.
  static function setSize(control, width, height)
    if control is void then return false end if
    return Control.setBounds(control, control.x, control.y, width, height)
  end function

  /// Returns whether checked satisfies the required condition.
  /// @param control control value consumed by this operation.
  static function isChecked(control)
    if control is void then return false end if
    if control.handle is void then return false end if
    return SendMessageW(control.handle, BM_GETCHECK, 0, 0) == BST_CHECKED
  end function

  /// Updates checked maintained by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param checked checked value consumed by this operation.
  static function setChecked(control, checked)
    if control is void then return false end if
    if control.handle is void then return false end if
    state = 0
    if checked then state = BST_CHECKED end if
    SendMessageW(control.handle, BM_SETCHECK, state, 0)
    return true
  end function

  /// Clears items maintained by the minigui module.
  /// @param control control value consumed by this operation.
  static function clearItems(control)
    if control is void then return false end if
    if control.handle is void then return false end if
    if control.kind == "ComboBox" or control.kind == "EditableComboBox" then
      SendMessageW(control.handle, CB_RESETCONTENT, 0, 0)
      control.lastSelection = -1
      return true
    end if
    if control.kind == "ListBox" then
      SendMessageW(control.handle, LB_RESETCONTENT, 0, 0)
      control.lastSelection = -1
      return true
    end if
    if control.kind == "ListView" or control.kind == "DataGrid" then
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

  /// Adds item to the state managed by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param text Text consumed by the operation.
  static function addItem(control, text)
    if control is void then return -1 end if
    if control.handle is void then return -1 end if
    if control.kind == "ComboBox" or control.kind == "EditableComboBox" then return SendMessageTextW(control.handle, CB_ADDSTRING, 0, text) end if
    if control.kind == "ListBox" then return SendMessageTextW(control.handle, LB_ADDSTRING, 0, text) end if
    if control.kind == "ListView" or control.kind == "DataGrid" then return Control.addListViewItem(control, text) end if
    if control.kind == "TreeView" then return Control.addTreeViewItem(control, text) end if
    return -1
  end function

  /// Ensures list view column is available to the minigui workflow.
  /// @param control control value consumed by this operation.
  static function ensureListViewColumn(control)
    if control is void then return false end if
    if control.handle is void then return false end if
    if control.kind != "ListView" and control.kind != "DataGrid" then return false end if
    titleBytes = _utf16Z("Value")
    column = bytes(40, 0)
    _writeU32LE(column, 0, LVCF_TEXT | LVCF_WIDTH | LVCF_SUBITEM)
    _writeU32LE(column, 8, control.width - 8)
    _writePtrLE(column, 16, nativeBytesPtr(titleBytes))
    _writeU32LE(column, 24, 5)
    _writeU32LE(column, 28, 0)
    SendMessageW(control.handle, LVM_INSERTCOLUMNW, 0, nativeBytesPtr(column))
    control.lastText = "Value"
    return true
  end function

  /// Updates list view columns maintained by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param columns columns value consumed by this operation.
  static function setListViewColumns(control, columns)
    if control is void then return false end if
    if control.handle is void then return false end if
    if control.kind != "ListView" and control.kind != "DataGrid" then return false end if
    if len(columns) <= 0 then return Control.ensureListViewColumn(control) end if
    control.lastText = _joinText(columns, "\t")
    columnWidth = control.width - 8
    if len(columns) > 0 then columnWidth = _asInt(columnWidth / len(columns)) end if
    if columnWidth < 40 then columnWidth = 40 end if
    for i = 0 to len(columns) - 1
      title = columns[i]
      titleBytes = _utf16Z(title)
      column = bytes(40, 0)
      _writeU32LE(column, 0, LVCF_TEXT | LVCF_WIDTH | LVCF_SUBITEM)
      _writeU32LE(column, 8, columnWidth)
      _writePtrLE(column, 16, nativeBytesPtr(titleBytes))
      _writeU32LE(column, 24, len(title))
      _writeU32LE(column, 28, i)
      SendMessageW(control.handle, LVM_INSERTCOLUMNW, i, nativeBytesPtr(column))
    end for
    return true
  end function

  /// Updates list view column widths for the minigui workflow.
  /// @param control control value consumed by this operation.
  static function updateListViewColumnWidths(control)
    if control is void then return false end if
    if control.handle is void then return false end if
    if control.kind != "ListView" and control.kind != "DataGrid" then return false end if
    columnCount = Control.listViewFieldCount(control.lastText)
    if columnCount <= 0 then columnCount = 1 end if
    columnWidth = control.width - 8
    if columnCount > 1 then columnWidth = _asInt(columnWidth / columnCount) end if
    if columnWidth < 40 then columnWidth = 40 end if
    for i = 0 to columnCount - 1
      SendMessageW(control.handle, LVM_SETCOLUMNWIDTH, i, columnWidth)
    end for
    return true
  end function

  /// Updates column width maintained by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param index Zero-based index of the affected item.
  /// @param width Width in the coordinate or storage units used by the caller.
  static function setColumnWidth(control, index, width)
    if control is void then return false end if
    if control.handle is void then return false end if
    if control.kind != "ListView" and control.kind != "DataGrid" then return false end if
    if index < 0 then return false end if
    if width < 1 then width = 1 end if
    SendMessageW(control.handle, LVM_SETCOLUMNWIDTH, index, width)
    return true
  end function

  /// Updates column widths maintained by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param widths widths value consumed by this operation.
  static function setColumnWidths(control, widths)
    if control is void then return false end if
    if len(widths) <= 0 then return false end if
    for i = 0 to len(widths) - 1
      Control.setColumnWidth(control, i, widths[i])
    end for
    return true
  end function

  /// Updates editable maintained by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param editable editable value consumed by this operation.
  static function setEditable(control, editable)
    if control is void then return false end if
    if control.kind != "DataGrid" then return false end if
    control.largeStep = 0
    if editable then control.largeStep = 1 end if
    return true
  end function

  /// Returns whether editable satisfies the required condition.
  /// @param control control value consumed by this operation.
  static function isEditable(control)
    if control is void then return false end if
    if control.kind != "DataGrid" then return false end if
    return control.largeStep == 1
  end function

  /// Performs the listViewColumnCount operation for the minigui control module.
  /// @param control control value consumed by this operation.
  static function listViewColumnCount(control)
    if control is void then return 1 end if
    count = Control.listViewFieldCount(control.lastText)
    if count <= 0 then count = 1 end if
    return count
  end function

  /// Performs the listViewColumnAtX operation for the minigui control module.
  /// @param control control value consumed by this operation.
  /// @param x Horizontal coordinate used by the operation.
  static function listViewColumnAtX(control, x)
    count = Control.listViewColumnCount(control)
    columnWidth = control.width
    if count > 0 then columnWidth = _asInt(control.width / count) end if
    if columnWidth < 1 then columnWidth = 1 end if
    column = _asInt(x / columnWidth)
    if column < 0 then column = 0 end if
    if column >= count then column = count - 1 end if
    return column
  end function

  /// Performs the listViewHitTest operation for the minigui control module.
  /// @param control control value consumed by this operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  static function listViewHitTest(control, x, y)
    if control is void then return [-1, -1] end if
    if control.handle is void then return [-1, -1] end if
    if control.kind != "ListView" and control.kind != "DataGrid" then return [-1, -1] end if
    hit = bytes(32, 0)
    _writeU32LE(hit, 0, x)
    _writeU32LE(hit, 4, y)
    row = SendMessageW(control.handle, LVM_SUBITEMHITTEST, 0, nativeBytesPtr(hit))
    if row < 0 then return [-1, -1] end if
    item = _readS32LE(hit, 12)
    column = _readS32LE(hit, 16)
    if item >= 0 then row = item end if
    if column < 0 then column = Control.listViewColumnAtX(control, x) end if
    return [row, column]
  end function

  /// Performs the listViewCellRect operation for the minigui control module.
  /// @param control control value consumed by this operation.
  /// @param row row value consumed by this operation.
  /// @param column column value consumed by this operation.
  static function listViewCellRect(control, row, column)
    if control is void then return [0, 0, 0, 0] end if
    if control.handle is void then return [0, 0, 0, 0] end if
    rect = bytes(16, 0)
    _writeU32LE(rect, 0, LVIR_BOUNDS)
    _writeU32LE(rect, 4, column)
    if SendMessageW(control.handle, LVM_GETSUBITEMRECT, row, nativeBytesPtr(rect)) != 0 then
      left = _readI32LE(rect, 0)
      top = _readI32LE(rect, 4)
      right = _readI32LE(rect, 8)
      bottom = _readI32LE(rect, 12)
      width = right - left
      height = bottom - top
      if width > 0 and height > 0 then return [left, top, width, height] end if
    end if
    columnCount = Control.listViewColumnCount(control)
    columnWidth = control.width
    if columnCount > 0 then columnWidth = _asInt(control.width / columnCount) end if
    if columnWidth < 40 then columnWidth = 40 end if
    return [column * columnWidth, 20 + row * 16, columnWidth, 20]
  end function

  /// Performs the listViewFieldCount operation for the minigui control module.
  /// @param text Text consumed by the operation.
  static function listViewFieldCount(text)
    count = 1
    if len(text) > 0 then
      for i = 0 to len(text) - 1
        if text[i] == "\t" then count = count + 1 end if
      end for
    end if
    return count
  end function

  /// Performs the listViewFieldAt operation for the minigui control module.
  /// @param text Text consumed by the operation.
  /// @param index Zero-based index of the affected item.
  static function listViewFieldAt(text, index)
    current = sb.StringBuilder.new()
    currentIndex = 0
    if len(text) > 0 then
      for i = 0 to len(text) - 1
        ch = text[i]
        if ch == "\t" then
          if currentIndex == index then return current.toString() end if
          current.clear()
          currentIndex = currentIndex + 1
        else
          current.appendString(ch)
        end if
      end for
    end if
    if currentIndex == index then return current.toString() end if
    return ""
  end function

  /// Performs the replaceListViewField operation for the minigui control module.
  /// @param text Text consumed by the operation.
  /// @param index Zero-based index of the affected item.
  /// @param value Value consumed or transformed by the operation.
  static function replaceListViewField(text, index, value)
    fieldCount = Control.listViewFieldCount(text)
    if index >= fieldCount then fieldCount = index + 1 end if
    parts = array(fieldCount)
    for i = 0 to fieldCount - 1
      if i == index then
        parts[i] = value
      else
        parts[i] = Control.listViewFieldAt(text, i)
      end if
    end for
    return _joinText(parts, "\t")
  end function

  /// Performs the replaceListViewRowText operation for the minigui control module.
  /// @param text Text consumed by the operation.
  /// @param row row value consumed by this operation.
  /// @param rowText rowText value consumed by this operation.
  static function replaceListViewRowText(text, row, rowText)
    rowCount = _itemCount(text)
    if row >= rowCount then rowCount = row + 1 end if
    rows = array(rowCount)
    for i = 0 to rowCount - 1
      if i == row then
        rows[i] = rowText
      else
        rows[i] = _itemTextAt(text, i)
      end if
    end for
    return _joinText(rows, "\n")
  end function

  /// Updates list view cell native maintained by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param row row value consumed by this operation.
  /// @param column column value consumed by this operation.
  /// @param value Value consumed or transformed by the operation.
  static function setListViewCellNative(control, row, column, value)
    if control is void then return false end if
    if control.handle is void then return false end if
    if control.kind != "ListView" and control.kind != "DataGrid" then return false end if
    if row < 0 or column < 0 then return false end if
    valueBytes = _utf16Z(value)
    item = bytes(56, 0)
    _writeU32LE(item, 0, LVIF_TEXT)
    _writeU32LE(item, 4, row)
    _writeU32LE(item, 8, column)
    _writePtrLE(item, 24, nativeBytesPtr(valueBytes))
    _writeU32LE(item, 32, len(value))
    SendMessageW(control.handle, LVM_SETITEMTEXTW, row, nativeBytesPtr(item))
    return true
  end function

  /// Updates cell text maintained by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param row row value consumed by this operation.
  /// @param column column value consumed by this operation.
  /// @param value Value consumed or transformed by the operation.
  static function setCellText(control, row, column, value)
    if control is void then return false end if
    if control.kind != "ListView" and control.kind != "DataGrid" then return false end if
    if row < 0 or column < 0 then return false end if
    rowText = _itemTextAt(control.text, row)
    rowText = Control.replaceListViewField(rowText, column, value)
    control.text = Control.replaceListViewRowText(control.text, row, rowText)
    return Control.setListViewCellNative(control, row, column, value)
  end function

  /// Returns cell text maintained by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param row row value consumed by this operation.
  /// @param column column value consumed by this operation.
  static function getCellText(control, row, column)
    if control is void then return "" end if
    if control.kind != "ListView" and control.kind != "DataGrid" then return "" end if
    if row < 0 or column < 0 then return "" end if
    return Control.listViewFieldAt(_itemTextAt(control.text, row), column)
  end function

  /// Adds list view item to the state managed by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param text Text consumed by the operation.
  static function addListViewItem(control, text)
    firstText = Control.listViewFieldAt(text, 0)
    textBytes = _utf16Z(firstText)
    item = bytes(56, 0)
    index = SendMessageW(control.handle, LVM_GETITEMCOUNT, 0, 0)
    _writeU32LE(item, 0, LVIF_TEXT)
    _writeU32LE(item, 4, index)
    _writeU32LE(item, 8, 0)
    _writePtrLE(item, 24, nativeBytesPtr(textBytes))
    _writeU32LE(item, 32, len(firstText))
    inserted = SendMessageW(control.handle, LVM_INSERTITEMW, 0, nativeBytesPtr(item))
    fieldCount = Control.listViewFieldCount(text)
    if fieldCount > 1 then
      for s = 1 to fieldCount - 1
        subText = Control.listViewFieldAt(text, s)
        subBytes = _utf16Z(subText)
        subItem = bytes(56, 0)
        _writeU32LE(subItem, 0, LVIF_TEXT)
        _writeU32LE(subItem, 4, inserted)
        _writeU32LE(subItem, 8, s)
        _writePtrLE(subItem, 24, nativeBytesPtr(subBytes))
        _writeU32LE(subItem, 32, len(subText))
        SendMessageW(control.handle, LVM_SETITEMTEXTW, inserted, nativeBytesPtr(subItem))
      end for
    end if
    return inserted
  end function

  /// Adds tree view item to the state managed by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param text Text consumed by the operation.
  static function addTreeViewItem(control, text)
    return Control.addTreeViewItemWithParent(control, text, 0)
  end function

  /// Adds tree view item with parent to the state managed by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param text Text consumed by the operation.
  /// @param parentItem parentItem value consumed by this operation.
  static function addTreeViewItemWithParent(control, text, parentItem)
    textBytes = _utf16Z(text)
    item = bytes(80, 0)
    _writePtrLE(item, 0, parentItem)
    _writePtrLE(item, 8, TVI_LAST)
    _writeU32LE(item, 16, TVIF_TEXT)
    _writePtrLE(item, 40, nativeBytesPtr(textBytes))
    _writeU32LE(item, 48, len(text))
    return SendMessageW(control.handle, TVM_INSERTITEMW, 0, nativeBytesPtr(item))
  end function

  /// Performs the treeItemLevel operation for the minigui control module.
  /// @param text Text consumed by the operation.
  static function treeItemLevel(text)
    level = 0
    pos = 0
    while pos + 1 < len(text) and text[pos] == " " and text[pos + 1] == " "
      level = level + 1
      pos = pos + 2
    end while
    return level
  end function

  /// Performs the treeItemText operation for the minigui control module.
  /// @param text Text consumed by the operation.
  static function treeItemText(text)
    pos = 0
    while pos + 1 < len(text) and text[pos] == " " and text[pos + 1] == " "
      pos = pos + 2
    end while
    output = sb.StringBuilder.withCapacity(len(text) - pos)
    if pos < len(text) then
      for i = pos to len(text) - 1
        output.appendString(text[i])
      end for
    end if
    return output.toString()
  end function

  /// Updates tree items maintained by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param items Items consumed or updated by the operation.
  static function setTreeItems(control, items)
    if control is void then return false end if
    if control.handle is void then return false end if
    if control.kind != "TreeView" then return false end if
    SendMessageW(control.handle, TVM_DELETEITEM, 0, TVI_ROOT)
    control.lastSelection = -1
    control.text = _joinText(items, "\n")
    parents = []
    if len(items) > 0 then
      for i = 0 to len(items) - 1
        raw = items[i]
        level = Control.treeItemLevel(raw)
        label = Control.treeItemText(raw)
        parentItem = 0
        if level > 0 and len(parents) >= level then parentItem = parents[level - 1] end if
        inserted = Control.addTreeViewItemWithParent(control, label, parentItem)
        if len(parents) <= level then
          parents = parents + [inserted]
        else
          parents[level] = inserted
        end if
      end for
    end if
    return true
  end function

  /// Returns item text at click maintained by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param x Horizontal coordinate used by the operation.
  static function getItemTextAtClick(control, x)
    if control is void then return "" end if
    itemsText = control.lastText
    if itemsText == "" then return "" end if
    count = _itemCount(itemsText)
    if count <= 0 then return "" end if
    cursor = 8
    for i = 0 to count - 1
      item = _itemTextAt(itemsText, i)
      itemWidth = len(item) * 8 + 28
      if x <= cursor + itemWidth then return item end if
      cursor = cursor + itemWidth
    end for
    return ""
  end function

  /// Returns tree view selected text maintained by the minigui module.
  /// @param control control value consumed by this operation.
  static function getTreeViewSelectedText(control)
    if control is void then return "" end if
    if control.handle is void then return "" end if
    if control.kind != "TreeView" then return "" end if
    hItem = SendMessageW(control.handle, TVM_GETNEXTITEM, TVGN_CARET, 0)
    if hItem == 0 then return "" end if
    textBuf = bytes(512, 0)
    item = bytes(64, 0)
    _writeU32LE(item, 0, TVIF_TEXT)
    _writePtrLE(item, 8, hItem)
    _writePtrLE(item, 24, nativeBytesPtr(textBuf))
    _writeU32LE(item, 32, 255)
    SendMessageW(control.handle, TVM_GETITEMW, 0, nativeBytesPtr(item))
    text = decode16Z(textBuf)
    if typeof(text) == "string" then return text end if
    return ""
  end function

  /// Returns list view selected text maintained by the minigui module.
  /// @param control control value consumed by this operation.
  static function getListViewSelectedText(control)
    if control is void then return "" end if
    if control.kind != "ListView" and control.kind != "DataGrid" then return "" end if
    index = control.lastSelection
    if index < 0 then return "" end if
    return _itemTextAt(control.text, index)
  end function

  /// Updates items maintained by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param items Items consumed or updated by the operation.
  static function setItems(control, items)
    if Control.clearItems(control) == false then return false end if
    if control.kind == "TreeView" then return Control.setTreeItems(control, items) end if
    control.text = _joinText(items, "\n")
    if len(items) > 0 then
      for i = 0 to len(items) - 1
        Control.addItem(control, items[i])
      end for
    end if
    return true
  end function

  /// Returns selected index maintained by the minigui module.
  /// @param control control value consumed by this operation.
  static function getSelectedIndex(control)
    if control is void then return -1 end if
    if control.handle is void then return -1 end if
    if control.kind == "ComboBox" or control.kind == "EditableComboBox" then return SendMessageW(control.handle, CB_GETCURSEL, 0, 0) end if
    if control.kind == "ListBox" then return SendMessageW(control.handle, LB_GETCURSEL, 0, 0) end if
    if control.kind == "TabControl" then return SendMessageW(control.handle, TCM_GETCURSEL, 0, 0) end if
    if control.kind == "ListView" or control.kind == "DataGrid" then return control.lastSelection end if
    return -1
  end function

  /// Updates selected index maintained by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param index Zero-based index of the affected item.
  static function setSelectedIndex(control, index)
    if control is void then return false end if
    if control.handle is void then return false end if
    if control.kind == "ComboBox" or control.kind == "EditableComboBox" then
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
    if control.kind == "ListView" or control.kind == "DataGrid" then
      item = bytes(56, 0)
      _writeU32LE(item, 12, LVIS_SELECTED | LVIS_FOCUSED)
      _writeU32LE(item, 16, LVIS_SELECTED | LVIS_FOCUSED)
      SendMessageW(control.handle, LVM_SETITEMSTATE, index, nativeBytesPtr(item))
      control.lastSelection = index
      return true
    end if
    return false
  end function

  /// Updates tab pages for the minigui workflow.
  /// @param app Application instance operated on by this call.
  /// @param tabControl tabControl value consumed by this operation.
  static function updateTabPages(app, tabControl)
    if app is void then return false end if
    if tabControl is void then return false end if
    if tabControl.kind != "TabControl" then return false end if
    hasTabPages = false
    if len(app.controls) > 0 then
      for p = 0 to len(app.controls) - 1
        pc = app.controls[p]
        if pc is void == false then
          if pc.kind == "TabPage" and pc.parent is void == false and pc.parent.handle == tabControl.handle then
            hasTabPages = true
          end if
        end if
      end for
    end if
    if hasTabPages and tabControl.handle is void == false then
      tabHeaderWidth = tabControl.width
      tabCount = SendMessageW(tabControl.handle, TCM_GETITEMCOUNT, 0, 0)
      if tabCount > 0 then
        tabRect = bytes(16, 0)
        if SendMessageW(tabControl.handle, TCM_GETITEMRECT, tabCount - 1, nativeBytesPtr(tabRect)) != 0 then
          tabHeaderWidth = _readI32LE(tabRect, 8) + 2
          if tabHeaderWidth < 1 then tabHeaderWidth = tabControl.width end if
          if tabHeaderWidth > tabControl.width then tabHeaderWidth = tabControl.width end if
        end if
      end if
      MoveWindow(tabControl.handle, tabControl.x, tabControl.y, tabHeaderWidth, 30, true)
    end if
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

  /// Performs the applyEffectiveVisible operation for the minigui control module.
  /// @param control control value consumed by this operation.
  /// @param parentVisible parentVisible value consumed by this operation.
  static function applyEffectiveVisible(control, parentVisible)
    if control is void then return false end if
    if control.handle is void then return false end if
    if parentVisible and control.visible then
      return ShowWindow(control.handle, SW_SHOW)
    end if
    return ShowWindow(control.handle, 0)
  end function

  /// Returns whether descendant of satisfies the required condition.
  /// @param app Application instance operated on by this call.
  /// @param control control value consumed by this operation.
  /// @param ancestor ancestor value consumed by this operation.
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

  /// Updates scroll viewer for the minigui workflow.
  /// @param app Application instance operated on by this call.
  /// @param scrollViewer scrollViewer value consumed by this operation.
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

  /// Performs the scrollViewerTo operation for the minigui control module.
  /// @param app Application instance operated on by this call.
  /// @param scrollViewer scrollViewer value consumed by this operation.
  /// @param value Value consumed or transformed by the operation.
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

  /// Returns selected text maintained by the minigui module.
  /// @param control control value consumed by this operation.
  static function getSelectedText(control)
    if control is void then return "" end if
    if control.handle is void then return "" end if
    idx = Control.getSelectedIndex(control)
    if idx < 0 then return "" end if
    msgLen = LB_GETTEXTLEN
    msgText = LB_GETTEXT
    if control.kind == "ComboBox" or control.kind == "EditableComboBox" then
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

  /// Updates value range maintained by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param minimum minimum value consumed by this operation.
  /// @param maximum maximum value consumed by this operation.
  static function setValueRange(control, minimum, maximum)
    if control is void then return false end if
    if control.kind == "NumberBox" or control.kind == "SpinBox" then
      control.scrollMin = minimum
      control.scrollMax = maximum
      if control.kind == "SpinBox" and control.baseClientHeight != 0 then
        SendMessageW(control.baseClientHeight, UDM_SETRANGE32, minimum, maximum)
      end if
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

  /// Updates value maintained by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param value Value consumed or transformed by the operation.
  static function setValue(control, value)
    if control is void then return false end if
    if control.kind == "NumberBox" or control.kind == "SpinBox" then
      if value < control.scrollMin then value = control.scrollMin end if
      if value > control.scrollMax then value = control.scrollMax end if
      control.scrollValue = value
      if control.kind == "SpinBox" and control.baseClientHeight != 0 then
        SendMessageW(control.baseClientHeight, UDM_SETPOS32, 0, value)
      end if
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

  /// Returns value maintained by the minigui module.
  /// @param control control value consumed by this operation.
  static function getValue(control)
    if control is void then return 0 end if
    if control.kind == "NumberBox" or control.kind == "SpinBox" then
      return _asInt(Control.getText(control))
    end if
    if control.kind == "ProgressBar" then return control.scrollValue end if
    return Control.getScrollValue(control)
  end function

  /// Updates scroll range maintained by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param minimum minimum value consumed by this operation.
  /// @param maximum maximum value consumed by this operation.
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

  /// Updates scroll steps maintained by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param smallStep smallStep value consumed by this operation.
  /// @param largeStep largeStep value consumed by this operation.
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

  /// Updates scroll value maintained by the minigui module.
  /// @param control control value consumed by this operation.
  /// @param value Value consumed or transformed by the operation.
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

  /// Returns scroll value maintained by the minigui module.
  /// @param control control value consumed by this operation.
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

/// Represents the events data used by the minigui module.
struct Events
  /// Performs the bindLoad operation for the minigui events module.
  /// @param app Application instance operated on by this call.
  /// @param window window value consumed by this operation.
  /// @param callback Callback invoked when the operation completes or the event occurs.
  /// @param context Context that carries state for the operation.
  static function bindLoad(app, window, callback, context)
    app.loadBindings = app.loadBindings + [Binding(window, callback, context, "load")]
    return window
  end function

  /// Performs the bindClose operation for the minigui events module.
  /// @param app Application instance operated on by this call.
  /// @param window window value consumed by this operation.
  /// @param callback Callback invoked when the operation completes or the event occurs.
  /// @param context Context that carries state for the operation.
  static function bindClose(app, window, callback, context)
    app.closeBindings = app.closeBindings + [Binding(window, callback, context, "close")]
    return window
  end function

  /// Performs the bindResized operation for the minigui events module.
  /// @param app Application instance operated on by this call.
  /// @param window window value consumed by this operation.
  /// @param callback Callback invoked when the operation completes or the event occurs.
  /// @param context Context that carries state for the operation.
  static function bindResized(app, window, callback, context)
    app.resizeBindings = app.resizeBindings + [Binding(window, callback, context, "resized")]
    return window
  end function

  /// Performs the bindClick operation for the minigui events module.
  /// @param app Application instance operated on by this call.
  /// @param control control value consumed by this operation.
  /// @param callback Callback invoked when the operation completes or the event occurs.
  /// @param context Context that carries state for the operation.
  static function bindClick(app, control, callback, context)
    app.clickBindings = app.clickBindings + [Binding(control, callback, context, "click")]
    return control
  end function

  /// Performs the bindClicked operation for the minigui events module.
  /// @param app Application instance operated on by this call.
  /// @param control control value consumed by this operation.
  /// @param callback Callback invoked when the operation completes or the event occurs.
  /// @param context Context that carries state for the operation.
  static function bindClicked(app, control, callback, context)
    app.clickBindings = app.clickBindings + [Binding(control, callback, context, "clicked")]
    return control
  end function

  /// Performs the bindTextEvent operation for the minigui events module.
  /// @param app Application instance operated on by this call.
  /// @param control control value consumed by this operation.
  /// @param callback Callback invoked when the operation completes or the event occurs.
  /// @param context Context that carries state for the operation.
  /// @param eventType eventType value consumed by this operation.
  static function bindTextEvent(app, control, callback, context, eventType)
    app.textBindings = app.textBindings + [Binding(control, callback, context, eventType)]
    if control is void == false then
      control.lastText = Control.getText(control)
    end if
    return control
  end function

  /// Performs the bindTextChanged operation for the minigui events module.
  /// @param app Application instance operated on by this call.
  /// @param control control value consumed by this operation.
  /// @param callback Callback invoked when the operation completes or the event occurs.
  /// @param context Context that carries state for the operation.
  static function bindTextChanged(app, control, callback, context)
    return Events.bindTextEvent(app, control, callback, context, "textChanged")
  end function

  /// Performs the bindSelectionEvent operation for the minigui events module.
  /// @param app Application instance operated on by this call.
  /// @param control control value consumed by this operation.
  /// @param callback Callback invoked when the operation completes or the event occurs.
  /// @param context Context that carries state for the operation.
  /// @param eventType eventType value consumed by this operation.
  static function bindSelectionEvent(app, control, callback, context, eventType)
    app.selectionBindings = app.selectionBindings + [Binding(control, callback, context, eventType)]
    if control is void == false then
      control.lastSelection = Control.getSelectedIndex(control)
    end if
    return control
  end function

  /// Performs the bindSelectionChanged operation for the minigui events module.
  /// @param app Application instance operated on by this call.
  /// @param control control value consumed by this operation.
  /// @param callback Callback invoked when the operation completes or the event occurs.
  /// @param context Context that carries state for the operation.
  static function bindSelectionChanged(app, control, callback, context)
    return Events.bindSelectionEvent(app, control, callback, context, "selectionChanged")
  end function

  /// Performs the bindSelected operation for the minigui events module.
  /// @param app Application instance operated on by this call.
  /// @param control control value consumed by this operation.
  /// @param callback Callback invoked when the operation completes or the event occurs.
  /// @param context Context that carries state for the operation.
  static function bindSelected(app, control, callback, context)
    return Events.bindSelectionEvent(app, control, callback, context, "selected")
  end function

  /// Performs the bindScrollEvent operation for the minigui events module.
  /// @param app Application instance operated on by this call.
  /// @param control control value consumed by this operation.
  /// @param callback Callback invoked when the operation completes or the event occurs.
  /// @param context Context that carries state for the operation.
  /// @param eventType eventType value consumed by this operation.
  static function bindScrollEvent(app, control, callback, context, eventType)
    app.scrollBindings = app.scrollBindings + [Binding(control, callback, context, eventType)]
    if control is void == false then
      control.scrollValue = Control.getScrollValue(control)
    end if
    return control
  end function

  /// Performs the bindScrollChanged operation for the minigui events module.
  /// @param app Application instance operated on by this call.
  /// @param control control value consumed by this operation.
  /// @param callback Callback invoked when the operation completes or the event occurs.
  /// @param context Context that carries state for the operation.
  static function bindScrollChanged(app, control, callback, context)
    return Events.bindScrollEvent(app, control, callback, context, "scrollChanged")
  end function

  /// Performs the bindValueChanged operation for the minigui events module.
  /// @param app Application instance operated on by this call.
  /// @param control control value consumed by this operation.
  /// @param callback Callback invoked when the operation completes or the event occurs.
  /// @param context Context that carries state for the operation.
  static function bindValueChanged(app, control, callback, context)
    if control is void == false then
      if control.kind == "ComboBox" or control.kind == "EditableComboBox" or control.kind == "ListBox" or control.kind == "TabControl" or control.kind == "TreeView" or control.kind == "ListView" or control.kind == "DataGrid" then
        return Events.bindSelectionEvent(app, control, callback, context, "valueChanged")
      end if
      if control.kind == "ScrollBar" or control.kind == "Slider" or control.kind == "ProgressBar" or control.kind == "ScrollViewer" then
        return Events.bindScrollEvent(app, control, callback, context, "valueChanged")
      end if
    end if
    return Events.bindTextEvent(app, control, callback, context, "valueChanged")
  end function

  /// Performs the bindChanged operation for the minigui events module.
  /// @param app Application instance operated on by this call.
  /// @param control control value consumed by this operation.
  /// @param callback Callback invoked when the operation completes or the event occurs.
  /// @param context Context that carries state for the operation.
  static function bindChanged(app, control, callback, context)
    if control is void == false then
      if control.kind == "ComboBox" or control.kind == "EditableComboBox" or control.kind == "ListBox" or control.kind == "TabControl" or control.kind == "TreeView" or control.kind == "ListView" or control.kind == "DataGrid" then
        return Events.bindSelectionEvent(app, control, callback, context, "changed")
      end if
      if control.kind == "ScrollBar" or control.kind == "Slider" or control.kind == "ProgressBar" or control.kind == "ScrollViewer" then
        return Events.bindScrollEvent(app, control, callback, context, "changed")
      end if
    end if
    return Events.bindTextEvent(app, control, callback, context, "changed")
  end function

  /// Performs the bindChange operation for the minigui events module.
  /// @param app Application instance operated on by this call.
  /// @param control control value consumed by this operation.
  /// @param callback Callback invoked when the operation completes or the event occurs.
  /// @param context Context that carries state for the operation.
  static function bindChange(app, control, callback, context)
    if control is void == false then
      if control.kind == "ComboBox" or control.kind == "EditableComboBox" or control.kind == "ListBox" or control.kind == "TabControl" or control.kind == "TreeView" or control.kind == "ListView" or control.kind == "DataGrid" then
        return Events.bindSelectionEvent(app, control, callback, context, "change")
      end if
      if control.kind == "ScrollBar" or control.kind == "Slider" or control.kind == "ProgressBar" or control.kind == "ScrollViewer" then
        return Events.bindScrollEvent(app, control, callback, context, "change")
      end if
    end if
    return Events.bindTextEvent(app, control, callback, context, "change")
  end function

  /// Performs the bindFocus operation for the minigui events module.
  /// @param app Application instance operated on by this call.
  /// @param control control value consumed by this operation.
  /// @param callback Callback invoked when the operation completes or the event occurs.
  /// @param context Context that carries state for the operation.
  static function bindFocus(app, control, callback, context)
    app.focusBindings = app.focusBindings + [Binding(control, callback, context, "focus")]
    return control
  end function

  /// Performs the bindBlur operation for the minigui events module.
  /// @param app Application instance operated on by this call.
  /// @param control control value consumed by this operation.
  /// @param callback Callback invoked when the operation completes or the event occurs.
  /// @param context Context that carries state for the operation.
  static function bindBlur(app, control, callback, context)
    app.blurBindings = app.blurBindings + [Binding(control, callback, context, "blur")]
    return control
  end function

  /// Performs the dispatch operation for the minigui events module.
  /// @param binding binding value consumed by this operation.
  /// @param eventType eventType value consumed by this operation.
  /// @param oldValue oldValue value consumed by this operation.
  /// @param newValue newValue value consumed by this operation.
  static function dispatch(binding, eventType, oldValue, newValue)
    if binding is void then return void end if
    ev = Event(binding.control, eventType, oldValue, newValue, false)
    return binding.callback(binding.context, ev)
  end function

  /// Finds window by handle used by the minigui module.
  /// @param app Application instance operated on by this call.
  /// @param hwnd hwnd value consumed by this operation.
  static function findWindowByHandle(app, hwnd)
    if app is void then return void end if
    if len(app.windows) == 0 then return void end if
    for i = 0 to len(app.windows) - 1
      w = app.windows[i]
      if w is void == false and w.handle == hwnd then return w end if
    end for
    return void
  end function

  /// Performs the dispatchLoad operation for the minigui events module.
  /// @param window window value consumed by this operation.
  static function dispatchLoad(window)
    global _activeApp
    if _activeApp is void then return false end if
    if len(_activeApp.loadBindings) == 0 then return false end if
    for i = 0 to len(_activeApp.loadBindings) - 1
      b = _activeApp.loadBindings[i]
      if b.control == window then
        Events.dispatch(b, "load", void, void)
        return true
      end if
    end for
    return false
  end function

  /// Performs the dispatchClose operation for the minigui events module.
  /// @param app Application instance operated on by this call.
  /// @param window window value consumed by this operation.
  static function dispatchClose(app, window)
    if app is void then return false end if
    if len(app.closeBindings) == 0 then return false end if
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

  /// Performs the dispatchResize operation for the minigui events module.
  /// @param app Application instance operated on by this call.
  /// @param window window value consumed by this operation.
  /// @param oldValue oldValue value consumed by this operation.
  /// @param newValue newValue value consumed by this operation.
  static function dispatchResize(app, window, oldValue, newValue)
    if app is void then return false end if
    if len(app.resizeBindings) == 0 then return false end if
    for i = 0 to len(app.resizeBindings) - 1
      b = app.resizeBindings[i]
      if b.control == window then
        Events.dispatch(b, "resized", oldValue, newValue)
      end if
    end for
    return false
  end function

  /// Performs the controlByHandle operation for the minigui events module.
  /// @param app Application instance operated on by this call.
  /// @param hwndControl hwndControl value consumed by this operation.
  static function controlByHandle(app, hwndControl)
    if app is void then return void end if
    if len(app.controls) > 0 then
      for i = 0 to len(app.controls) - 1
        c = app.controls[i]
        if c is void == false then
          if c.handle == hwndControl then return c end if
        end if
      end for
    end if
    return void
  end function

  /// Performs the dispatchControlTextBindings operation for the minigui events module.
  /// @param app Application instance operated on by this call.
  /// @param control control value consumed by this operation.
  /// @param eventType eventType value consumed by this operation.
  /// @param oldValue oldValue value consumed by this operation.
  /// @param newValue newValue value consumed by this operation.
  static function dispatchControlTextBindings(app, control, eventType, oldValue, newValue)
    if app is void then return false end if
    if len(app.textBindings) == 0 then return false end if
    handled = false
    for i = 0 to len(app.textBindings) - 1
      b = app.textBindings[i]
      if b.control == control then
        Events.dispatch(b, b.eventType, oldValue, newValue)
        handled = true
      end if
    end for
    return handled
  end function

  /// Performs the beginSplitterDrag operation for the minigui events module.
  /// @param app Application instance operated on by this call.
  /// @param hwndControl hwndControl value consumed by this operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  static function beginSplitterDrag(app, hwndControl, x, y)
    c = Events.controlByHandle(app, hwndControl)
    if c is void then return false end if
    if c.kind != "Splitter" then return false end if
    global _dragSplitter
    global _dragSplitterStartX
    global _dragSplitterStartY
    global _dragSplitterOriginX
    global _dragSplitterOriginY
    _dragSplitter = c
    _dragSplitterStartX = x
    _dragSplitterStartY = y
    _dragSplitterOriginX = c.x
    _dragSplitterOriginY = c.y
    SetCapture(hwndControl)
    return true
  end function

  /// Performs the dragSplitter operation for the minigui events module.
  /// @param app Application instance operated on by this call.
  /// @param hwndControl hwndControl value consumed by this operation.
  /// @param flags Bit flags controlling the operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  static function dragSplitter(app, hwndControl, flags, x, y)
    global _dragSplitter
    if _dragSplitter is void then return false end if
    if (flags & MK_LBUTTON) == 0 then
      ReleaseCapture()
      _dragSplitter = void
      return false
    end if
    c = _dragSplitter
    if c.handle != hwndControl then return false end if
    global _dragSplitterStartX
    global _dragSplitterStartY
    global _dragSplitterOriginX
    global _dragSplitterOriginY
    oldValue = c.scrollValue
    newX = _dragSplitterOriginX
    newY = _dragSplitterOriginY
    orientation = Control.splitterOrientation(c)
    if orientation == "vertical" then
      newX = _dragSplitterOriginX + x - _dragSplitterStartX
      if newX < 0 then newX = 0 end if
      c.scrollValue = newX
    else
      newY = _dragSplitterOriginY + y - _dragSplitterStartY
      if newY < 0 then newY = 0 end if
      c.scrollValue = newY
    end if
    Control.resizeSplitterTargets(app, c, c.x, c.y, newX, newY)
    Control.setBounds(c, newX, newY, c.width, c.height)
    if oldValue != c.scrollValue then
      Events.dispatchControlTextBindings(app, c, "changed", oldValue, c.scrollValue)
    end if
    return true
  end function

  /// Performs the endSplitterDrag operation for the minigui events module.
  /// @param app Application instance operated on by this call.
  /// @param hwndControl hwndControl value consumed by this operation.
  static function endSplitterDrag(app, hwndControl)
    global _dragSplitter
    if _dragSplitter is void then return false end if
    if _dragSplitter.handle != hwndControl then return false end if
    ReleaseCapture()
    _dragSplitter = void
    return true
  end function

  /// Performs the beginDataGridEdit operation for the minigui events module.
  /// @param app Application instance operated on by this call.
  /// @param hwndControl hwndControl value consumed by this operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  static function beginDataGridEdit(app, hwndControl, x, y)
    grid = Events.controlByHandle(app, hwndControl)
    if grid is void then return false end if
    if grid.kind != "DataGrid" then return false end if
    if Control.isEditable(grid) == false then return false end if
    count = SendMessageW(grid.handle, LVM_GETITEMCOUNT, 0, 0)
    if count <= 0 then return false end if
    hit = Control.listViewHitTest(grid, x, y)
    row = hit[0]
    column = hit[1]
    if row < 0 then return false end if
    if row >= count then return false end if
    if column < 0 then column = 0 end if
    cellRect = Control.listViewCellRect(grid, row, column)
    editorX = cellRect[0]
    editorY = cellRect[1]
    columnWidth = cellRect[2]
    editorHeight = cellRect[3]
    if columnWidth < 20 then columnWidth = 20 end if
    if editorHeight < 18 then editorHeight = 20 end if
    text = Control.getCellText(grid, row, column)
    global _dataGridEditor
    global _dataGridEditGrid
    global _dataGridEditRow
    global _dataGridEditColumn
    global _dataGridEditOriginal
    if _dataGridEditor != 0 then Events.commitDataGridEdit(app, _dataGridEditor, false) end if
    editId = app.nextNativeId
    app.nextNativeId = app.nextNativeId + 1
    editor = CreateWindowExW(0, "EDIT", text, WS_CHILD | WS_VISIBLE | WS_TABSTOP | WS_BORDER | ES_AUTOHSCROLL, editorX, editorY, columnWidth, editorHeight, grid.handle, editId, void, void)
    if editor == 0 then return false end if
    _installWindowProc(editor)
    _dataGridEditor = editor
    _dataGridEditGrid = grid
    _dataGridEditRow = row
    _dataGridEditColumn = column
    _dataGridEditOriginal = text
    SetFocus(editor)
    return true
  end function

  /// Performs the commitDataGridEdit operation for the minigui events module.
  /// @param app Application instance operated on by this call.
  /// @param hwndControl hwndControl value consumed by this operation.
  /// @param cancel cancel value consumed by this operation.
  static function commitDataGridEdit(app, hwndControl, cancel)
    global _dataGridEditor
    if _dataGridEditor == 0 then return false end if
    if hwndControl != _dataGridEditor then return false end if
    global _dataGridEditGrid
    global _dataGridEditRow
    global _dataGridEditColumn
    global _dataGridEditOriginal
    editor = _dataGridEditor
    grid = _dataGridEditGrid
    row = _dataGridEditRow
    column = _dataGridEditColumn
    original = _dataGridEditOriginal
    _dataGridEditor = 0
    _dataGridEditGrid = void
    _dataGridEditRow = -1
    _dataGridEditColumn = -1
    _dataGridEditOriginal = ""
    if cancel == false then
      newText = _getWindowText(editor)
      if newText != original then
        Control.setCellText(grid, row, column, newText)
      end if
    end if
    DestroyWindow(editor)
    return true
  end function

  /// Performs the dispatchFocusByHandle operation for the minigui events module.
  /// @param app Application instance operated on by this call.
  /// @param hwndControl hwndControl value consumed by this operation.
  /// @param focused focused value consumed by this operation.
  static function dispatchFocusByHandle(app, hwndControl, focused)
    if app is void then return false end if
    bindings = app.blurBindings
    eventType = "blur"
    if focused then
      bindings = app.focusBindings
      eventType = "focus"
    end if
    handled = false
    if len(bindings) > 0 then
      for i = 0 to len(bindings) - 1
        b = bindings[i]
        c = b.control
        if c is void == false then
          if c.handle == hwndControl then
            Events.dispatch(b, eventType, false, true)
            handled = true
          end if
        end if
      end for
    end if
    return handled
  end function

  /// Performs the dispatchNotify operation for the minigui events module.
  /// @param app Application instance operated on by this call.
  /// @param hwndControl hwndControl value consumed by this operation.
  /// @param nativeId Identifier of native.
  /// @param code code value consumed by this operation.
  /// @param lParam lParam value consumed by this operation.
  static function dispatchNotify(app, hwndControl, nativeId, code, lParam)
    if app is void then return false end if
    if code == UDN_DELTAPOS and len(app.textBindings) > 0 then
      for u = 0 to len(app.textBindings) - 1
        ub = app.textBindings[u]
        uc = ub.control
        if uc is void == false then
          if uc.kind == "SpinBox" and (uc.baseClientHeight == hwndControl or uc.baseClientWidth == nativeId) then
            oldSpinValue = Control.getValue(uc)
            deltaSpin = 0
            if lParam != 0 then
              spinNotify = bytes(32, 0)
              RtlMoveMemory(spinNotify, lParam, 32)
              deltaSpin = _readS32LE(spinNotify, 28)
            end if
            newSpinValue = oldSpinValue
            if deltaSpin < 0 then newSpinValue = oldSpinValue + uc.smallStep end if
            if deltaSpin > 0 then newSpinValue = oldSpinValue - uc.smallStep end if
            if deltaSpin == 0 then newSpinValue = oldSpinValue + uc.smallStep end if
            Control.setValue(uc, newSpinValue)
            finalSpinValue = Control.getValue(uc)
            if oldSpinValue != finalSpinValue then
              uc.lastText = "" + finalSpinValue
              Events.dispatch(ub, ub.eventType, oldSpinValue, finalSpinValue)
            end if
            return true
          end if
        end if
      end for
    end if
    if len(app.selectionBindings) == 0 then return false end if
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
        if (c.kind == "ListView" or c.kind == "DataGrid") and (c.handle == hwndControl or c.nativeId == nativeId) and code == LVN_ITEMCHANGED then
          oldListValue = c.lastSelection
          newListValue = SendMessageW(c.handle, LVM_GETNEXTITEM, -1, LVNI_SELECTED)
          if newListValue < 0 then newListValue = oldListValue end if
          countNotifyList = SendMessageW(c.handle, LVM_GETITEMCOUNT, 0, 0)
          if countNotifyList > 0 and newListValue >= countNotifyList then newListValue = 0 end if
          c.lastSelection = newListValue
          listEventValue = Control.getListViewSelectedText(c)
          if listEventValue == "" then listEventValue = newListValue end if
          if oldListValue != newListValue then Events.dispatch(b, b.eventType, oldListValue, listEventValue) end if
          return true
        end if
        if c.kind == "TreeView" and (c.handle == hwndControl or c.nativeId == nativeId) and code == TVN_SELCHANGEDW then
          oldTreeValue = c.lastSelection
          newTreeValue = oldTreeValue + 1
          if newTreeValue < 0 then newTreeValue = 0 end if
          c.lastSelection = newTreeValue
          selectedTreeText = Control.getTreeViewSelectedText(c)
          if selectedTreeText == "" then selectedTreeText = newTreeValue end if
          Events.dispatch(b, b.eventType, oldTreeValue, selectedTreeText)
          return true
        end if
      end if
    end for
    return false
  end function

  /// Performs the dispatchClickByHandle operation for the minigui events module.
  /// @param app Application instance operated on by this call.
  /// @param hwndControl hwndControl value consumed by this operation.
  /// @param x Horizontal coordinate used by the operation.
  static function dispatchClickByHandle(app, hwndControl, x)
    if app is void then return false end if
    if len(app.clickBindings) == 0 then return false end if
    for i = 0 to len(app.clickBindings) - 1
      b = app.clickBindings[i]
      c = b.control
      if c is void == false then
        if c.handle == hwndControl then
          clickValue = true
          if c.kind == "MenuBar" or c.kind == "ToolBar" then
            itemText = Control.getItemTextAtClick(c, x)
            if itemText != "" then clickValue = itemText end if
          else if c.kind == "FilePicker" then
            clickValue = Dialog.pickOpenFile(app, _itemTextAt(c.lastText, 0), _itemTextAt(c.lastText, 1))
          else if c.kind == "FolderPicker" then
            clickValue = Dialog.pickFolder(app, c.lastText)
          else if c.kind == "ColorPicker" then
            clickValue = Dialog.pickColor(app, _itemTextAt(c.lastText, 0), _itemTextAt(c.lastText, 1))
          end if
          Events.dispatch(b, b.eventType, false, clickValue)
          return true
        end if
      end if
    end for
    return false
  end function

  /// Performs the dispatchContextMenu operation for the minigui events module.
  /// @param app Application instance operated on by this call.
  /// @param hwndControl hwndControl value consumed by this operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  static function dispatchContextMenu(app, hwndControl, x, y)
    if app is void then return false end if
    if len(app.controls) == 0 then return false end if
    for i = 0 to len(app.controls) - 1
      c = app.controls[i]
      if c is void == false then
        if c.kind == "ContextMenu" and c.parent is void == false and c.parent.handle == hwndControl then
          point = bytes(8, 0)
          _writeU32LE(point, 0, x)
          _writeU32LE(point, 4, y)
          ClientToScreen(hwndControl, point)
          screenX = _readI32LE(point, 0)
          screenY = _readI32LE(point, 4)
          command = TrackPopupMenuEx(c.handle, TPM_RETURNCMD | TPM_RIGHTBUTTON, screenX, screenY, hwndControl, void)
          if command <= 0 then return true end if
          itemText = _itemTextAt(c.lastText, command - 1)
          if itemText == "" then itemText = command end if
          if len(app.clickBindings) > 0 then
            for b = 0 to len(app.clickBindings) - 1
              binding = app.clickBindings[b]
              if binding.control == c then
                Events.dispatch(binding, binding.eventType, false, itemText)
                return true
              end if
            end for
          end if
          return true
        end if
      end if
    end for
    return false
  end function

  /// Returns whether control kind satisfies the required condition.
  /// @param app Application instance operated on by this call.
  /// @param hwndControl hwndControl value consumed by this operation.
  /// @param kind kind value consumed by this operation.
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

  /// Performs the dispatchTabChangedByHandle operation for the minigui events module.
  /// @param app Application instance operated on by this call.
  /// @param hwndControl hwndControl value consumed by this operation.
  static function dispatchTabChangedByHandle(app, hwndControl)
    if app is void then return false end if
    if len(app.selectionBindings) == 0 then return false end if
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

  /// Performs the dispatchTabClickedByHandle operation for the minigui events module.
  /// @param app Application instance operated on by this call.
  /// @param hwndControl hwndControl value consumed by this operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
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

  /// Performs the dispatchSelectionClickedByHandle operation for the minigui events module.
  /// @param app Application instance operated on by this call.
  /// @param hwndControl hwndControl value consumed by this operation.
  /// @param x Horizontal coordinate used by the operation.
  /// @param y Vertical coordinate used by the operation.
  static function dispatchSelectionClickedByHandle(app, hwndControl, x, y)
    if app is void then return false end if
    if len(app.selectionBindings) == 0 then return false end if
    for s = 0 to len(app.selectionBindings) - 1
      b = app.selectionBindings[s]
      c = b.control
      if c is void == false then
        if (c.kind == "TreeView" or c.kind == "ListView" or c.kind == "DataGrid") and c.handle == hwndControl then
          oldValue = c.lastSelection
          newValue = Control.getSelectedIndex(c)
          eventValue = newValue
          if c.kind == "TreeView" then
            clickedIndex = _asInt(y / 18)
            countTree = _itemCount(c.text)
            if clickedIndex < 0 then clickedIndex = 0 end if
            if countTree > 0 and clickedIndex >= countTree then clickedIndex = countTree - 1 end if
            newValue = clickedIndex
            if newValue < 0 then newValue = 0 end if
            selectedClickText = _itemTextAt(c.text, newValue)
            if selectedClickText == "" then selectedClickText = Control.getTreeViewSelectedText(c) end if
            eventValue = newValue
            if selectedClickText != "" then eventValue = selectedClickText end if
          else
            newValue = _asInt((y - 20) / 16)
            if newValue < 0 then newValue = 0 end if
            countList = SendMessageW(c.handle, LVM_GETITEMCOUNT, 0, 0)
            if countList > 0 and newValue >= countList then newValue = 0 end if
            eventValue = _itemTextAt(c.text, newValue)
            if eventValue == "" then eventValue = newValue end if
          end if
          c.lastSelection = newValue
          if oldValue != newValue or c.kind == "TreeView" or c.kind == "ListView" or c.kind == "DataGrid" then
            Events.dispatch(b, b.eventType, oldValue, eventValue)
            return true
          end if
        end if
      end if
    end for
    return false
  end function

  /// Performs the dispatchScrollViewer operation for the minigui events module.
  /// @param app Application instance operated on by this call.
  /// @param hwndControl hwndControl value consumed by this operation.
  /// @param code code value consumed by this operation.
  /// @param pos pos value consumed by this operation.
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
            if oldValue != c.scrollValue and len(app.scrollBindings) > 0 then
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

  /// Performs the dispatchScroll operation for the minigui events module.
  /// @param app Application instance operated on by this call.
  /// @param code code value consumed by this operation.
  /// @param pos pos value consumed by this operation.
  /// @param hwndControl hwndControl value consumed by this operation.
  static function dispatchScroll(app, code, pos, hwndControl)
    if app is void then return false end if
    if len(app.scrollBindings) == 0 then return false end if
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

  /// Performs the dispatchCommand operation for the minigui events module.
  /// @param app Application instance operated on by this call.
  /// @param code code value consumed by this operation.
  /// @param nativeId Identifier of native.
  /// @param hwndControl hwndControl value consumed by this operation.
  static function dispatchCommand(app, code, nativeId, hwndControl)
    if app is void then return false end if

    if code == BN_CLICKED and len(app.clickBindings) > 0 then
      for i = 0 to len(app.clickBindings) - 1
        b = app.clickBindings[i]
        c = b.control
        if c is void == false then
          if c.nativeId == nativeId or c.handle == hwndControl then
            clickValue = true
            if c.kind == "TrayIcon" then clickValue = mx_property(c.handle, "selectedIndex", "", 0) end if
            if c.kind == "FilePicker" then
              clickValue = Dialog.pickOpenFile(app, _itemTextAt(c.lastText, 0), _itemTextAt(c.lastText, 1))
            else if c.kind == "FolderPicker" then
              clickValue = Dialog.pickFolder(app, c.lastText)
            else if c.kind == "ColorPicker" then
              clickValue = Dialog.pickColor(app, _itemTextAt(c.lastText, 0), _itemTextAt(c.lastText, 1))
            end if
            Events.dispatch(b, b.eventType, false, clickValue)
            return true
          end if
        end if
      end for
    end if

    if code == EN_CHANGE and len(app.textBindings) > 0 then
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

    if (code == CBN_SELCHANGE or code == LBN_SELCHANGE) and len(app.selectionBindings) > 0 then
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

/// @internal
extern function mx_create(kind as cstr, parent as ptr, id as int, text as cstr, x as int, y as int, width as int, height as int) from "minigui_extra.dll" returns ptr
/// @internal
extern function mx_property(node as ptr, key as cstr, text as cstr, value as int) from "minigui_extra.dll" returns int
/// @internal
extern function mx_draw(node as ptr, op as int, x as double, y as double, width as double, height as double, color as cstr, text as cstr) from "minigui_extra.dll" returns void
/// @internal
extern function mx_format(node as ptr, start as int, endIndex as int, color as cstr, bold as int, italic as int) from "minigui_extra.dll" returns int
/// _advancedCreate for the native backend.
/// @param app app supplied by the caller.
/// @param parent parent supplied by the caller.
/// @param id id supplied by the caller.
/// @param kind kind supplied by the caller.
/// @param text text supplied by the caller.
/// @param x x supplied by the caller.
/// @param y y supplied by the caller.
/// @param width width supplied by the caller.
/// @param height height supplied by the caller.
function _advancedCreate(app, parent, id, kind, text, x, y, width, height)
  nid = app.nextNativeId
  app.nextNativeId = nid + 1
  handle = mx_create(kind, parent.handle, nid, text, x, y, width, height)
  if handle == 0 then return error(700, "Native control creation failed: " + kind) end if
  c = NativeControl(id, kind, handle, nid, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, 0, 0, parent, parent.width, parent.height)
  return Application.addControl(app, c)
end function

/// _advancedProperty for the native backend.
/// @param control control supplied by the caller.
/// @param key key supplied by the caller.
/// @param text text supplied by the caller.
/// @param value value supplied by the caller.
function _advancedProperty(control, key, text, value)
  return mx_property(control.handle, key, text, value)
end function

/// _advancedDraw for the native backend.
/// @param control control supplied by the caller.
/// @param op op supplied by the caller.
/// @param x x supplied by the caller.
/// @param y y supplied by the caller.
/// @param width width supplied by the caller.
/// @param height height supplied by the caller.
/// @param color color supplied by the caller.
/// @param text text supplied by the caller.
function _advancedDraw(control, op, x, y, width, height, color, text)
  mx_draw(control.handle, op, x, y, width, height, color, text)
  return true
end function

/// _advancedFormat for the native backend.
/// @param control control supplied by the caller.
/// @param start start supplied by the caller.
/// @param endIndex end supplied by the caller.
/// @param color color supplied by the caller.
/// @param bold bold supplied by the caller.
/// @param italic italic supplied by the caller.
function _advancedFormat(control, start, endIndex, color, bold, italic)
  b = 0; i = 0
  if bold then b = 1 end if
  if italic then i = 1 end if
  return mx_format(control.handle, start, endIndex, color, b, i)
end function

/// @internal
extern function mx_pump(wait as int) from "minigui_extra.dll" returns int

#else

/// @internal
extern function mg_message(owner as ptr, title as cstr, message as cstr, buttons as cstr, icon as cstr) from "$ORIGIN/libminigui_gtk.so" returns int
/// @internal
extern function mg_modal(window as ptr, owner as ptr, enabled as int) from "$ORIGIN/libminigui_gtk.so" returns void
// Native GTK callbacks enqueue events; MiniLang drains them on its UI thread.
/// @internal
extern function mg_init() from "$ORIGIN/libminigui_gtk.so" returns int
/// @internal
extern function mg_create(kind as cstr, parent as ptr, id as int, text as cstr, x as int, y as int, width as int, height as int) from "$ORIGIN/libminigui_gtk.so" returns ptr
/// @internal
extern function mg_alive(node as ptr) from "$ORIGIN/libminigui_gtk.so" returns bool
/// @internal
extern function mg_show(node as ptr, visible as int) from "$ORIGIN/libminigui_gtk.so" returns void
/// @internal
extern function mg_destroy(node as ptr) from "$ORIGIN/libminigui_gtk.so" returns void
/// @internal
extern function mg_bounds(node as ptr, x as double, y as double, width as double, height as double) from "$ORIGIN/libminigui_gtk.so" returns void
/// @internal
extern function mg_text(node as ptr, text as cstr) from "$ORIGIN/libminigui_gtk.so" returns void
/// @internal
extern function mg_get_text(node as ptr) from "$ORIGIN/libminigui_gtk.so" returns cstr
/// @internal
extern function mg_columns(node as ptr, columns as cstr) from "$ORIGIN/libminigui_gtk.so" returns void
/// @internal
extern function mg_clear(node as ptr) from "$ORIGIN/libminigui_gtk.so" returns void
/// @internal
extern function mg_add(node as ptr, row as cstr) from "$ORIGIN/libminigui_gtk.so" returns void
/// @internal
extern function mg_selection(node as ptr, value as int, set as int) from "$ORIGIN/libminigui_gtk.so" returns int
/// @internal
extern function mg_value(node as ptr, value as int, set as int) from "$ORIGIN/libminigui_gtk.so" returns int
/// @internal
extern function mg_range(node as ptr, minimum as int, maximum as int, step as int) from "$ORIGIN/libminigui_gtk.so" returns void
/// @internal
extern function mg_property(node as ptr, key as cstr, text as cstr, value as int) from "$ORIGIN/libminigui_gtk.so" returns int
/// @internal
extern function mg_draw(node as ptr, op as int, x as double, y as double, width as double, height as double, color as cstr, text as cstr) from "$ORIGIN/libminigui_gtk.so" returns void
/// @internal
extern function mg_poll(wait as int) from "$ORIGIN/libminigui_gtk.so" returns int
/// @internal
extern function mg_event(field as int) from "$ORIGIN/libminigui_gtk.so" returns int
/// @internal
extern function mg_event_text() from "$ORIGIN/libminigui_gtk.so" returns cstr
/// @internal
extern function mg_dialog(parent as ptr, kind as int, title as cstr, text as cstr) from "$ORIGIN/libminigui_gtk.so" returns cstr
/// @internal
extern function mg_shutdown() from "$ORIGIN/libminigui_gtk.so" returns void
/// @internal
extern function mg_format(node as ptr, start as int, endIndex as int, color as cstr, bold as int, italic as int) from "$ORIGIN/libminigui_gtk.so" returns int
/// @internal
extern function mg_cell(node as ptr, row as int, column as int, text as cstr, set as int) from "$ORIGIN/libminigui_gtk.so" returns cstr
/// Runtime Event data.
struct Event
  /// Stores the sender value associated with event.
  sender,
  /// Stores the event type value associated with event.
  eventType,
  /// Stores the old value value associated with event.
  oldValue,
  /// Stores the new value value associated with event.
  newValue,
  /// Stores the cancel value associated with event.
  cancel,
end struct

/// Runtime Binding data.
struct Binding
  /// Stores the control value associated with binding.
  control,
  /// Stores the callback value associated with binding.
  callback,
  /// Stores the context value associated with binding.
  context,
  /// Stores the event type value associated with binding.
  eventType,
end struct

/// Runtime NativeControl data.
struct NativeControl
  /// Stores the id value associated with native control.
  id,
  /// Stores the kind value associated with native control.
  kind,
  /// Stores the handle value associated with native control.
  handle,
  /// Stores the native id value associated with native control.
  nativeId,
  /// Stores the text value associated with native control.
  text,
  /// Stores the x value associated with native control.
  x,
  /// Stores the y value associated with native control.
  y,
  /// Stores the width value associated with native control.
  width,
  /// Stores the height value associated with native control.
  height,
  /// Stores the visible value associated with native control.
  visible,
  /// Stores the enabled value associated with native control.
  enabled,
  /// Stores the last text value associated with native control.
  lastText,
  /// Stores the last selection value associated with native control.
  lastSelection,
  /// Stores the scroll min value associated with native control.
  scrollMin,
  /// Stores the scroll max value associated with native control.
  scrollMax,
  /// Stores the scroll value value associated with native control.
  scrollValue,
  /// Stores the small step value associated with native control.
  smallStep,
  /// Stores the large step value associated with native control.
  largeStep,
  /// Stores the base x value associated with native control.
  baseX,
  /// Stores the base y value associated with native control.
  baseY,
  /// Stores the base width value associated with native control.
  baseWidth,
  /// Stores the base height value associated with native control.
  baseHeight,
  /// Stores the base client width value associated with native control.
  baseClientWidth,
  /// Stores the base client height value associated with native control.
  baseClientHeight,
  /// Stores the parent value associated with native control.
  parent,
  /// Stores the base parent width value associated with native control.
  baseParentWidth,
  /// Stores the base parent height value associated with native control.
  baseParentHeight,
end struct

/// Runtime ApplicationState data.
struct ApplicationState
  /// Stores the windows value associated with application state.
  windows,
  /// Stores the controls value associated with application state.
  controls,
  /// Stores the click bindings value associated with application state.
  clickBindings,
  /// Stores the text bindings value associated with application state.
  textBindings,
  /// Stores the selection bindings value associated with application state.
  selectionBindings,
  /// Stores the scroll bindings value associated with application state.
  scrollBindings,
  /// Stores the load bindings value associated with application state.
  loadBindings,
  /// Stores the close bindings value associated with application state.
  closeBindings,
  /// Stores the resize bindings value associated with application state.
  resizeBindings,
  /// Stores the focus bindings value associated with application state.
  focusBindings,
  /// Stores the blur bindings value associated with application state.
  blurBindings,
  /// Stores the startup window value associated with application state.
  startupWindow,
  /// Stores the next native id value associated with application state.
  nextNativeId,
  /// Stores the running value associated with application state.
  running,
end struct

/// Runtime DialogWindow data.
struct DialogWindow
  /// Stores the app value associated with dialog window.
  app,
  /// Stores the window value associated with dialog window.
  window,
  /// Stores the prompt label value associated with dialog window.
  promptLabel,
  /// Stores the input box value associated with dialog window.
  inputBox,
  /// Stores the ok button value associated with dialog window.
  okButton,
  /// Stores the cancel button value associated with dialog window.
  cancelButton,
  /// Stores the result value associated with dialog window.
  result,
  /// Stores the value value associated with dialog window.
  value,
end struct

/// @internal
function _joinText(items, separator)
  output = sb.StringBuilder.new()
  if len(items) > 0 then
    for i = 0 to len(items) - 1
      if i > 0 then output.appendString(separator) end if
      output.appendString(items[i])
    end for
  end if
  return output.toString()
end function

/// @internal
function _itemTextAt(itemsText, index)
  current = sb.StringBuilder.new()
  currentIndex = 0
  if len(itemsText) > 0 then
    for i = 0 to len(itemsText) - 1
      ch = itemsText[i]
      if ch == "\n" then
        if currentIndex == index then return current.toString() end if
        current.clear()
        currentIndex = currentIndex + 1
      else
        current.appendString(ch)
      end if
    end for
  end if
  if currentIndex == index then return current.toString() end if
  return ""
end function

/// @internal
function _itemCount(itemsText)
  if itemsText == "" then return 0 end if
  count = 1
  for i = 0 to len(itemsText) - 1
    if itemsText[i] == "\n" then count = count + 1 end if
  end for
  return count
end function

/// @internal
_linuxBindings = []
/// @internal
_linuxLayouts = []
/// _new for the native backend.
/// @param app app supplied by the caller.
/// @param parent parent supplied by the caller.
/// @param id id supplied by the caller.
/// @param kind kind supplied by the caller.
/// @param text text supplied by the caller.
/// @param x x supplied by the caller.
/// @param y y supplied by the caller.
/// @param width width supplied by the caller.
/// @param height height supplied by the caller.
function _new(app, parent, id, kind, text, x, y, width, height)
  handle = 0
  if parent is void == false then handle = parent.handle end if
  nid = app.nextNativeId
  app.nextNativeId = nid + 1
  handle = mg_create(kind, handle, nid, text, x, y, width, height)
  if handle == 0 then return error(700, "GTK could not create " + kind) end if
  pw = width
  ph = height
  if parent is void == false then pw = parent.width; ph = parent.height end if
  c = NativeControl(id, kind, handle, nid, text, x, y, width, height, true, true, text, -1, 0, 100, 0, 1, 10, x, y, width, height, width, height, parent, pw, ph)
  if kind == "Window" then
    app.windows = app.windows + [c]
    if app.startupWindow is void then app.startupWindow = c end if
  else
    app.controls = app.controls + [c]
  end if
  return c
end function

/// Native Application operations.
struct Application
  /// create for the Application backend implementation.
  static function create()
    global _linuxBindings
    global _linuxLayouts
    if _linuxBindings is void then _linuxBindings = [] end if
    if _linuxLayouts is void then _linuxLayouts = [] end if
    if mg_init() == 0 then return error(700, "GTK cannot connect to a display") end if
    return ApplicationState([], [], [], [], [], [], [], [], [], [], [], void, 1000, false)
  end function

  /// setStartupWindow for the Application backend implementation.
  /// @param app app supplied by the caller.
  /// @param window window supplied by the caller.
  static function setStartupWindow(app, window)
    app.startupWindow = window
    return window
  end function

  /// run for the Application backend implementation.
  /// @param app app supplied by the caller.
  static function run(app)
    if app.startupWindow is void then return 0 end if
    app.running = true
    for each window in app.windows
      Events._emit(window, "load", "", "")
    end for
    while app.running and mg_alive(app.startupWindow.handle)
      Application.pump(app, true)
    end while
    Application.dispose(app)
    return 0
  end function

  /// dispose for the Application backend implementation.
  /// @param app app supplied by the caller.
  static function dispose(app)
    global _linuxBindings
    global _linuxLayouts
    app.running = false
    mg_shutdown()
    _linuxBindings = []
    _linuxLayouts = []
    return true
  end function

  /// pump for the Application backend implementation.
  /// @param app app supplied by the caller.
  /// @param wait wait supplied by the caller.
  static function pump(app, wait)
    block = 0
    if wait then block = 1 end if
    kind = mg_poll(block)
    if kind == 0 then return false end if
    id = mg_event(0)
    allControls = app.windows + app.controls
    for each c in allControls
      if c.nativeId != id then continue end if
      if kind == 1 then
        value = true
        if c.kind == "FilePicker" then value = Dialog.pickOpenFile(app, _itemTextAt(c.lastText, 0), _itemTextAt(c.lastText, 1)) end if
        if c.kind == "FolderPicker" then value = Dialog.pickFolder(app, c.lastText) end if
        if c.kind == "ColorPicker" then value = Dialog.pickColor(app, c.lastText, "") end if
        if c.kind == "TrayIcon" then value = mg_event(1) end if
        if c.kind == "MenuBar" or c.kind == "ToolBar" or c.kind == "ContextMenu" then value = mg_event_text() end if
        Events._emit(c, "click", false, value)
      else if kind == 2 then
        previous = c.lastText
        value = Control.getText(c)
        c.lastText = value
        Events._emit(c, "textChanged", previous, value)
      else if kind == 3 then
        previous = c.lastSelection
        c.lastSelection = mg_event(1)
        Events._emit(c, "selectionChanged", previous, Control.getSelectedText(c))
      else if kind == 4 then
        previous = c.scrollValue
        c.scrollValue = mg_event(1)
        if c.kind == "Splitter" then
          delta = c.scrollValue - c.smallStep
          c.smallStep = c.scrollValue
          beforeId = _itemTextAt(c.lastText, 0)
          afterId = _itemTextAt(c.lastText, 1)
          for each pane in app.controls
            if pane.parent is void then continue end if
            if pane.parent.handle != c.parent.handle then continue end if
            vertical = c.height > c.width
            if pane.id == beforeId then
              if vertical then Control.setBounds(pane, pane.x, pane.y, pane.width + delta, pane.height)
              else Control.setBounds(pane, pane.x, pane.y, pane.width, pane.height + delta)
              end if
            end if
            if pane.id == afterId then
              if vertical then Control.setBounds(pane, pane.x + delta, pane.y, pane.width - delta, pane.height)
              else Control.setBounds(pane, pane.x, pane.y + delta, pane.width, pane.height - delta)
              end if
            end if
          end for
          if c.height > c.width then Control.setBounds(c, c.x + delta, c.y, c.width, c.height)
          else Control.setBounds(c, c.x, c.y + delta, c.width, c.height)
          end if
        end if
        Events._emit(c, "valueChanged", previous, c.scrollValue)
      else if kind == 5 then
        canceled = Events._emit(c, "close", "", "")
        if canceled == false then Window.close(c) end if
      else if kind == 6 then
        Application.resizeWindow(app, c, mg_event(1), mg_event(2))
      else if kind == 7 then Events._emit(c, "focus", false, true)
      else if kind == 8 then Events._emit(c, "blur", true, false)
      else if kind == 9 then Events._emit(c, "valueChanged", [mg_event(1), mg_event(2)], mg_event_text())
      end if
      return true
    end for
    return false
  end function

  /// resizeWindow for the Application backend implementation.
  /// @param app app supplied by the caller.
  /// @param window window supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  static function resizeWindow(app, window, width, height)
    if window.width == width and window.height == height then return false end if
    old = [window.width, window.height]
    window.width = width
    window.height = height
    Control._resizeChildren(app, window)
    Events._emit(window, "resized", old, [width, height])
    return true
  end function

end struct

/// Native Window operations.
struct Window
  /// create for the Window backend implementation.
  /// @param app app supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param title title supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  static function create(app, id, title, width, height)
    return _new(app, void, id, "Window", title, 0, 0, width, height)
  end function

  /// show for the Window backend implementation.
  /// @param window window supplied by the caller.
  static function show(window)
    mg_show(window.handle, 1)
    return true
  end function

  /// close for the Window backend implementation.
  /// @param window window supplied by the caller.
  static function close(window)
    mg_destroy(window.handle)
    return true
  end function

  /// setTitle for the Window backend implementation.
  /// @param window window supplied by the caller.
  /// @param title title supplied by the caller.
  static function setTitle(window, title)
    return Control.setText(window, title)
  end function

  /// getClientWidth for the Window backend implementation.
  /// @param window window supplied by the caller.
  static function getClientWidth(window)
    return window.width
  end function

  /// getClientHeight for the Window backend implementation.
  /// @param window window supplied by the caller.
  static function getClientHeight(window)
    return window.height
  end function

end struct

/// Native Label operations.
struct Label
  /// create for the Label backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height)
    c = _new(app, parent, id, "Label", text, x, y, width, height)
    return c
  end function

end struct

/// Native Button operations.
struct Button
  /// create for the Button backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height)
    c = _new(app, parent, id, "Button", text, x, y, width, height)
    return c
  end function

end struct

/// Native TextBox operations.
struct TextBox
  /// create for the TextBox backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height)
    c = _new(app, parent, id, "TextBox", text, x, y, width, height)
    return c
  end function

end struct

/// Native FilePicker operations.
struct FilePicker
  /// create for the FilePicker backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  /// @param title title supplied by the caller.
  /// @param filter filter supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height, title, filter)
    c = _new(app, parent, id, "FilePicker", text, x, y, width, height)
    c.lastText = title + "\n" + filter
    return c
  end function

end struct

/// Native FolderPicker operations.
struct FolderPicker
  /// create for the FolderPicker backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  /// @param title title supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height, title)
    c = _new(app, parent, id, "FolderPicker", text, x, y, width, height)
    c.lastText = title
    return c
  end function

end struct

/// Native ColorPicker operations.
struct ColorPicker
  /// create for the ColorPicker backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  /// @param title title supplied by the caller.
  /// @param value value supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height, title, value)
    c = _new(app, parent, id, "ColorPicker", text, x, y, width, height)
    Control.setValue(c, value)
    c.lastText = title
    return c
  end function

end struct

/// Native SearchBox operations.
struct SearchBox
  /// create for the SearchBox backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height)
    c = _new(app, parent, id, "SearchBox", text, x, y, width, height)
    return c
  end function

end struct

/// Native TextArea operations.
struct TextArea
  /// create for the TextArea backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height)
    c = _new(app, parent, id, "TextArea", text, x, y, width, height)
    return c
  end function

end struct

/// Native PasswordBox operations.
struct PasswordBox
  /// create for the PasswordBox backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height)
    c = _new(app, parent, id, "PasswordBox", text, x, y, width, height)
    return c
  end function

end struct

/// Native NumberBox operations.
struct NumberBox
  /// create for the NumberBox backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  /// @param minimum minimum supplied by the caller.
  /// @param maximum maximum supplied by the caller.
  /// @param value value supplied by the caller.
  /// @param step step supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height, minimum, maximum, value, step)
    c = _new(app, parent, id, "NumberBox", text, x, y, width, height)
    Control.setRange(c, minimum, maximum)
    Control.setValue(c, value)
    Control.setStep(c, step)
    return c
  end function

end struct

/// Native SpinBox operations.
struct SpinBox
  /// create for the SpinBox backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  /// @param minimum minimum supplied by the caller.
  /// @param maximum maximum supplied by the caller.
  /// @param value value supplied by the caller.
  /// @param step step supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height, minimum, maximum, value, step)
    c = _new(app, parent, id, "SpinBox", text, x, y, width, height)
    Control.setRange(c, minimum, maximum)
    Control.setValue(c, value)
    Control.setStep(c, step)
    return c
  end function

end struct

/// Native CheckBox operations.
struct CheckBox
  /// create for the CheckBox backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  /// @param checked checked supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height, checked)
    c = _new(app, parent, id, "CheckBox", text, x, y, width, height)
    Control.setChecked(c, checked)
    return c
  end function

end struct

/// Native ToggleSwitch operations.
struct ToggleSwitch
  /// create for the ToggleSwitch backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  /// @param checked checked supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height, checked)
    c = _new(app, parent, id, "ToggleSwitch", text, x, y, width, height)
    Control.setChecked(c, checked)
    return c
  end function

end struct

/// Native RadioButton operations.
struct RadioButton
  /// create for the RadioButton backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  /// @param checked checked supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height, checked)
    c = _new(app, parent, id, "RadioButton", text, x, y, width, height)
    Control.setChecked(c, checked)
    return c
  end function

end struct

/// Native Image operations.
struct Image
  /// create for the Image backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  /// @param source source supplied by the caller.
  /// @param stretch stretch supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height, source, stretch)
    c = _new(app, parent, id, "Image", text, x, y, width, height)
    mg_property(c.handle, "source", source, 0)
    return c
  end function

end struct

/// Native Separator operations.
struct Separator
  /// create for the Separator backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  /// @param orientation orientation supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height, orientation)
    c = _new(app, parent, id, "Separator", text, x, y, width, height)
    mg_property(c.handle, "orientation", orientation, 0)
    return c
  end function

end struct

/// Native Splitter operations.
struct Splitter
  /// create for the Splitter backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  /// @param orientation orientation supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height, orientation)
    c = _new(app, parent, id, "Splitter", text, x, y, width, height)
    mg_property(c.handle, "orientation", orientation, 0)
    return c
  end function

  /// createPane for the Splitter backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  /// @param orientation orientation supplied by the caller.
  /// @param targetBefore targetBefore supplied by the caller.
  /// @param targetAfter targetAfter supplied by the caller.
  static function createPane(app, parent, id, text, x, y, width, height, orientation, targetBefore, targetAfter)
    c = _new(app, parent, id, "Splitter", text, x, y, width, height)
    mg_property(c.handle, "orientation", orientation, 0)
    c.lastText = targetBefore + "\n" + targetAfter
    c.smallStep = 0
    return c
  end function

end struct

/// Native LinkLabel operations.
struct LinkLabel
  /// create for the LinkLabel backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  /// @param url url supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height, url)
    c = _new(app, parent, id, "LinkLabel", text, x, y, width, height)
    mg_property(c.handle, "url", url, 0)
    return c
  end function

end struct

/// Native Panel operations.
struct Panel
  /// create for the Panel backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height)
    c = _new(app, parent, id, "Panel", text, x, y, width, height)
    return c
  end function

  /// Creates the next native notebook page content panel.
  /// @param app app supplied by the caller.
  /// @param tabControl tabControl supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  static function createTabPage(app, tabControl, id, text, x, y, width, height)
    return _new(app, tabControl, id, "Panel", text, 0, 0, width, height)
  end function


end struct

/// Native ScrollViewer operations.
struct ScrollViewer
  /// create for the ScrollViewer backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  /// @param horizontalScroll horizontalScroll supplied by the caller.
  /// @param verticalScroll verticalScroll supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height, horizontalScroll, verticalScroll)
    c = _new(app, parent, id, "ScrollViewer", text, x, y, width, height)
    return c
  end function

end struct

/// Native GroupBox operations.
struct GroupBox
  /// create for the GroupBox backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height)
    c = _new(app, parent, id, "GroupBox", text, x, y, width, height)
    return c
  end function

end struct

/// Native ScrollBar operations.
struct ScrollBar
  /// create for the ScrollBar backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  /// @param orientation orientation supplied by the caller.
  /// @param minimum minimum supplied by the caller.
  /// @param maximum maximum supplied by the caller.
  /// @param value value supplied by the caller.
  /// @param smallStep smallStep supplied by the caller.
  /// @param largeStep largeStep supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height, orientation, minimum, maximum, value, smallStep, largeStep)
    c = _new(app, parent, id, "ScrollBar", text, x, y, width, height)
    Control.setRange(c, minimum, maximum)
    Control.setValue(c, value)
    mg_property(c.handle, "orientation", orientation, 0)
    return c
  end function

end struct

/// Native Slider operations.
struct Slider
  /// create for the Slider backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  /// @param orientation orientation supplied by the caller.
  /// @param minimum minimum supplied by the caller.
  /// @param maximum maximum supplied by the caller.
  /// @param value value supplied by the caller.
  /// @param smallStep smallStep supplied by the caller.
  /// @param largeStep largeStep supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height, orientation, minimum, maximum, value, smallStep, largeStep)
    c = _new(app, parent, id, "Slider", text, x, y, width, height)
    Control.setRange(c, minimum, maximum)
    Control.setValue(c, value)
    mg_property(c.handle, "orientation", orientation, 0)
    return c
  end function

end struct

/// Native ProgressBar operations.
struct ProgressBar
  /// create for the ProgressBar backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  /// @param minimum minimum supplied by the caller.
  /// @param maximum maximum supplied by the caller.
  /// @param value value supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height, minimum, maximum, value)
    c = _new(app, parent, id, "ProgressBar", text, x, y, width, height)
    Control.setRange(c, minimum, maximum)
    Control.setValue(c, value)
    return c
  end function

end struct

/// Native TabControl operations.
struct TabControl
  /// create for the TabControl backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  /// @param items items supplied by the caller.
  /// @param selectedIndex selectedIndex supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height, items, selectedIndex)
    c = _new(app, parent, id, "TabControl", text, x, y, width, height)
    Control.setItems(c, items)
    Control.setSelectedIndex(c, selectedIndex)
    return c
  end function

end struct

/// Native MenuBar operations.
struct MenuBar
  /// create for the MenuBar backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  /// @param items items supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height, items)
    c = _new(app, parent, id, "MenuBar", text, x, y, width, height)
    Control.setItems(c, items)
    return c
  end function

end struct

/// Native ContextMenu operations.
struct ContextMenu
  /// create for the ContextMenu backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  /// @param items items supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height, items)
    c = _new(app, parent, id, "ContextMenu", text, x, y, width, height)
    Control.setItems(c, items)
    return c
  end function

end struct

/// Native StatusBar operations.
struct StatusBar
  /// create for the StatusBar backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height)
    c = _new(app, parent, id, "StatusBar", text, x, y, width, height)
    return c
  end function

end struct

/// Native ToolBar operations.
struct ToolBar
  /// create for the ToolBar backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  /// @param items items supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height, items)
    c = _new(app, parent, id, "ToolBar", text, x, y, width, height)
    Control.setItems(c, items)
    return c
  end function

end struct

/// Native TreeView operations.
struct TreeView
  /// create for the TreeView backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  /// @param items items supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height, items)
    c = _new(app, parent, id, "TreeView", text, x, y, width, height)
    Control.setItems(c, items)
    return c
  end function

end struct

/// Native ListView operations.
struct ListView
  /// create for the ListView backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  /// @param items items supplied by the caller.
  /// @param selectedIndex selectedIndex supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height, items, selectedIndex)
    c = _new(app, parent, id, "ListView", text, x, y, width, height)
    Control.setItems(c, items)
    Control.setSelectedIndex(c, selectedIndex)
    return c
  end function

  /// createColumns for the ListView backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  /// @param columns columns supplied by the caller.
  /// @param items items supplied by the caller.
  /// @param selectedIndex selectedIndex supplied by the caller.
  static function createColumns(app, parent, id, text, x, y, width, height, columns, items, selectedIndex)
    c = _new(app, parent, id, "ListView", text, x, y, width, height)
    Control.setColumns(c, columns)
    Control.setItems(c, items)
    Control.setSelectedIndex(c, selectedIndex)
    return c
  end function

end struct

/// Native DataGrid operations.
struct DataGrid
  /// create for the DataGrid backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  /// @param columns columns supplied by the caller.
  /// @param items items supplied by the caller.
  /// @param selectedIndex selectedIndex supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height, columns, items, selectedIndex)
    c = _new(app, parent, id, "DataGrid", text, x, y, width, height)
    Control.setColumns(c, columns)
    Control.setItems(c, items)
    Control.setSelectedIndex(c, selectedIndex)
    return c
  end function

end struct

/// Native DatePicker operations.
struct DatePicker
  /// create for the DatePicker backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height)
    c = _new(app, parent, id, "DatePicker", text, x, y, width, height)
    return c
  end function

end struct

/// Native DateTimePicker operations.
struct DateTimePicker
  /// create for the DateTimePicker backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height)
    c = _new(app, parent, id, "DateTimePicker", text, x, y, width, height)
    return c
  end function

end struct

/// Native TimePicker operations.
struct TimePicker
  /// create for the TimePicker backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height)
    c = _new(app, parent, id, "TimePicker", text, x, y, width, height)
    return c
  end function

end struct

/// Native Calendar operations.
struct Calendar
  /// create for the Calendar backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height)
    c = _new(app, parent, id, "Calendar", text, x, y, width, height)
    return c
  end function

end struct

/// Native ComboBox operations.
struct ComboBox
  /// create for the ComboBox backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  /// @param items items supplied by the caller.
  /// @param selectedIndex selectedIndex supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height, items, selectedIndex)
    c = _new(app, parent, id, "ComboBox", text, x, y, width, height)
    Control.setItems(c, items)
    Control.setSelectedIndex(c, selectedIndex)
    return c
  end function

end struct

/// Native EditableComboBox operations.
struct EditableComboBox
  /// create for the EditableComboBox backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  /// @param items items supplied by the caller.
  /// @param selectedIndex selectedIndex supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height, items, selectedIndex)
    c = _new(app, parent, id, "EditableComboBox", text, x, y, width, height)
    Control.setItems(c, items)
    Control.setSelectedIndex(c, selectedIndex)
    return c
  end function

end struct

/// Native ListBox operations.
struct ListBox
  /// create for the ListBox backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  /// @param items items supplied by the caller.
  /// @param selectedIndex selectedIndex supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height, items, selectedIndex)
    c = _new(app, parent, id, "ListBox", text, x, y, width, height)
    Control.setItems(c, items)
    Control.setSelectedIndex(c, selectedIndex)
    return c
  end function

end struct

/// Native Control operations.
struct Control
  /// setText for the Control backend implementation.
  /// @param control control supplied by the caller.
  /// @param text text supplied by the caller.
  static function setText(control, text)
    control.text = text
    control.lastText = text
    mg_text(control.handle, text)
    return true
  end function

  /// getText for the Control backend implementation.
  /// @param control control supplied by the caller.
  static function getText(control)
    return mg_get_text(control.handle)
  end function

  /// setVisible for the Control backend implementation.
  /// @param control control supplied by the caller.
  /// @param visible visible supplied by the caller.
  static function setVisible(control, visible)
    control.visible = visible
    v = 0
    if visible then v = 1 end if
    mg_show(control.handle, v)
    return true
  end function

  /// setEnabled for the Control backend implementation.
  /// @param control control supplied by the caller.
  /// @param enabled enabled supplied by the caller.
  static function setEnabled(control, enabled)
    v = 0
    if enabled then v = 1 end if
    return mg_property(control.handle, "enabled", "", v) != 0
  end function

  /// setReadOnly for the Control backend implementation.
  /// @param control control supplied by the caller.
  /// @param readOnly readOnly supplied by the caller.
  static function setReadOnly(control, readOnly)
    v = 0
    if readOnly then v = 1 end if
    return mg_property(control.handle, "readOnly", "", v) != 0
  end function

  /// setEditable for the Control backend implementation.
  /// @param control control supplied by the caller.
  /// @param editable editable supplied by the caller.
  static function setEditable(control, editable)
    v = 0
    if editable then v = 1 end if
    return mg_property(control.handle, "editable", "", v) != 0
  end function

  /// setTooltip for the Control backend implementation.
  /// @param control control supplied by the caller.
  /// @param text text supplied by the caller.
  static function setTooltip(control, text)
    return mg_property(control.handle, "tooltip", text, 0) != 0
  end function

  /// setPlaceholder for the Control backend implementation.
  /// @param control control supplied by the caller.
  /// @param text text supplied by the caller.
  static function setPlaceholder(control, text)
    return mg_property(control.handle, "placeholder", text, 0) != 0
  end function

  /// setImageSource for the Control backend implementation.
  /// @param control control supplied by the caller.
  /// @param source source supplied by the caller.
  static function setImageSource(control, source)
    return mg_property(control.handle, "source", source, 0) != 0
  end function

  /// setSource for the Control backend implementation.
  /// @param control control supplied by the caller.
  /// @param source source supplied by the caller.
  static function setSource(control, source)
    return mg_property(control.handle, "source", source, 0) != 0
  end function

  /// setUrl for the Control backend implementation.
  /// @param control control supplied by the caller.
  /// @param url url supplied by the caller.
  static function setUrl(control, url)
    return mg_property(control.handle, "url", url, 0) != 0
  end function

  /// setMaxLength for the Control backend implementation.
  /// @param control control supplied by the caller.
  /// @param maxLength maxLength supplied by the caller.
  static function setMaxLength(control, maxLength)
    return mg_property(control.handle, "maxLength", "", maxLength) != 0
  end function

  /// setChecked for the Control backend implementation.
  /// @param control control supplied by the caller.
  /// @param checked checked supplied by the caller.
  static function setChecked(control, checked)
    v = 0
    if checked then v = 1 end if
    mg_value(control.handle, v, 1)
    return true
  end function

  /// getChecked for the Control backend implementation.
  /// @param control control supplied by the caller.
  static function getChecked(control)
    return mg_value(control.handle, 0, 0) != 0
  end function

  /// setValue for the Control backend implementation.
  /// @param control control supplied by the caller.
  /// @param value value supplied by the caller.
  static function setValue(control, value)
    if control.kind == "ColorPicker" then control.lastText = value; return true end if
    control.scrollValue = value
    mg_value(control.handle, value, 1)
    return true
  end function

  /// getValue for the Control backend implementation.
  /// @param control control supplied by the caller.
  static function getValue(control)
    return mg_value(control.handle, 0, 0)
  end function

  /// setRange for the Control backend implementation.
  /// @param control control supplied by the caller.
  /// @param minimum minimum supplied by the caller.
  /// @param maximum maximum supplied by the caller.
  static function setRange(control, minimum, maximum)
    control.scrollMin = minimum
    control.scrollMax = maximum
    mg_range(control.handle, minimum, maximum, control.smallStep)
    return true
  end function

  /// setStep for the Control backend implementation.
  /// @param control control supplied by the caller.
  /// @param step step supplied by the caller.
  static function setStep(control, step)
    control.smallStep = step
    mg_range(control.handle, control.scrollMin, control.scrollMax, step)
    return true
  end function

  /// setColumns for the Control backend implementation.
  /// @param control control supplied by the caller.
  /// @param columns columns supplied by the caller.
  static function setColumns(control, columns)
    control.lastText = _joinText(columns, "\t")
    mg_columns(control.handle, control.lastText)
    return true
  end function

  /// setItems for the Control backend implementation.
  /// @param control control supplied by the caller.
  /// @param items items supplied by the caller.
  static function setItems(control, items)
    mg_clear(control.handle)
    rows = []
    for each item in items
      row = item
      if typeof(item) == "array" then row = _joinText(item, "\t") end if
      rows = rows + [row]
      mg_add(control.handle, row)
    end for
    control.text = _joinText(rows, "\n")
    return true
  end function

  /// addItem for the Control backend implementation.
  /// @param control control supplied by the caller.
  /// @param text text supplied by the caller.
  static function addItem(control, text)
    mg_add(control.handle, text)
    return true
  end function

  /// clearItems for the Control backend implementation.
  /// @param control control supplied by the caller.
  static function clearItems(control)
    mg_clear(control.handle)
    control.text = ""
    return true
  end function

  /// setSelectedIndex for the Control backend implementation.
  /// @param control control supplied by the caller.
  /// @param index index supplied by the caller.
  static function setSelectedIndex(control, index)
    mg_selection(control.handle, index, 1)
    control.lastSelection = index
    return true
  end function

  /// getSelectedIndex for the Control backend implementation.
  /// @param control control supplied by the caller.
  static function getSelectedIndex(control)
    return mg_selection(control.handle, 0, 0)
  end function

  /// getSelectedText for the Control backend implementation.
  /// @param control control supplied by the caller.
  static function getSelectedText(control)
    if control.kind == "TreeView" then return mg_get_text(control.handle) end if
    return _itemTextAt(control.text, Control.getSelectedIndex(control))
  end function

  /// getCellText for the Control backend implementation.
  /// @param control control supplied by the caller.
  /// @param row row supplied by the caller.
  /// @param column column supplied by the caller.
  static function getCellText(control, row, column)
    return mg_cell(control.handle, row, column, "", 0)
  end function

  /// setCellText for the Control backend implementation.
  /// @param control control supplied by the caller.
  /// @param row row supplied by the caller.
  /// @param column column supplied by the caller.
  /// @param value value supplied by the caller.
  static function setCellText(control, row, column, value)
    mg_cell(control.handle, row, column, value, 1)
    return true
  end function

  /// setBounds for the Control backend implementation.
  /// @param control control supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  static function setBounds(control, x, y, width, height)
    control.x = x
    control.y = y
    control.width = width
    control.height = height
    mg_bounds(control.handle, x, y, width, height)
    return true
  end function

  /// setLayout for the Control backend implementation.
  /// @param control control supplied by the caller.
  /// @param mode mode supplied by the caller.
  /// @param anchor anchor supplied by the caller.
  /// @param minWidth minWidth supplied by the caller.
  /// @param minHeight minHeight supplied by the caller.
  /// @param maxWidth maxWidth supplied by the caller.
  /// @param maxHeight maxHeight supplied by the caller.
  static function setLayout(control, mode, anchor, minWidth, minHeight, maxWidth, maxHeight)
    global _linuxLayouts
    _linuxLayouts = _linuxLayouts + [[control, mode, anchor, minWidth, minHeight, maxWidth, maxHeight]]
    return true
  end function

  /// _resizeChildren for the Control backend implementation.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  static function _resizeChildren(app, parent)
    global _linuxLayouts
    for each c in app.controls
      if c.parent is void then continue end if
      if c.parent.handle != parent.handle then continue end if
      mode = "scale"; anchor = "left,top"
      minw = 1; minh = 1; maxw = -1; maxh = -1
      for each rule in _linuxLayouts
        if rule[0].handle == c.handle then
          mode = rule[1]; anchor = rule[2]
          minw = rule[3]; minh = rule[4]; maxw = rule[5]; maxh = rule[6]
        end if
      end for
      dx = parent.width - c.baseParentWidth
      dy = parent.height - c.baseParentHeight
      x = c.baseX; y = c.baseY; w = c.baseWidth; h = c.baseHeight
      if mode == "fill" then w = w + dx; h = h + dy end if
      if mode == "scale" and c.baseParentWidth > 0 and c.baseParentHeight > 0 then
        x = x * parent.width / c.baseParentWidth; w = w * parent.width / c.baseParentWidth
        y = y * parent.height / c.baseParentHeight; h = h * parent.height / c.baseParentHeight
      end if
      if mode == "anchor" then
        if _hasWord(anchor, "right") then
          if _hasWord(anchor, "left") then w = w + dx else x = x + dx end if
        end if
        if _hasWord(anchor, "bottom") then
          if _hasWord(anchor, "top") then h = h + dy else y = y + dy end if
        end if
      end if
      if w < minw then w = minw end if
      if h < minh then h = minh end if
      if maxw >= 0 and w > maxw then w = maxw end if
      if maxh >= 0 and h > maxh then h = maxh end if
      Control.setBounds(c, x, y, w, h)
      Control._resizeChildren(app, c)
    end for
    return true
  end function

  /// setForeground for the Control backend implementation.
  /// @param control control supplied by the caller.
  /// @param color color supplied by the caller.
  static function setForeground(control, color)
    return mg_property(control.handle, "css", "* { color: " + color + "; }", 0) != 0
  end function

  /// setBackground for the Control backend implementation.
  /// @param control control supplied by the caller.
  /// @param color color supplied by the caller.
  static function setBackground(control, color)
    return mg_property(control.handle, "css", "* { background-color: " + color + "; }", 0) != 0
  end function

  /// setFont for the Control backend implementation.
  /// @param control control supplied by the caller.
  /// @param family family supplied by the caller.
  /// @param size size supplied by the caller.
  /// @param weight weight supplied by the caller.
  static function setFont(control, family, size, weight)
    if size < 1 then size = 12 end if
    return mg_property(control.handle, "css", "* { font-family: " + family + "; font-size: " + size + "px; }", 0) != 0
  end function

  /// setBorder for the Control backend implementation.
  /// @param control control supplied by the caller.
  /// @param color color supplied by the caller.
  /// @param width width supplied by the caller.
  static function setBorder(control, color, width)
    return mg_property(control.handle, "css", "* { border: " + width + "px solid " + color + "; }", 0) != 0
  end function

  /// Orders keyboard focus among sibling controls.
  /// @param control control supplied by the caller.
  /// @param tabIndex tabIndex supplied by the caller.
  static function setTabIndex(control, tabIndex)
    return mg_property(control.handle, "tabIndex", "", tabIndex) != 0
  end function

  /// Sets a native table column width.
  /// @param control control supplied by the caller.
  /// @param column column supplied by the caller.
  /// @param width width supplied by the caller.
  static function setColumnWidth(control, column, width)
    return mg_property(control.handle, "columnWidth", "" + column, width) != 0
  end function

  /// Applies widths to successive table columns.
  /// @param control control supplied by the caller.
  /// @param widths widths supplied by the caller.
  static function setColumnWidths(control, widths)
    if len(widths) == 0 then return true end if
    for i = 0 to len(widths) - 1
      Control.setColumnWidth(control, i, widths[i])
    end for
    return true
  end function

  /// Moves keyboard focus to a native control.
  /// @param control control supplied by the caller.
  static function focus(control)
    return mg_property(control.handle, "focus", "", 0) != 0
  end function


  /// Reads the native checkbox state.
  /// @param control control supplied by the caller.
  static function isChecked(control)
    return Control.getChecked(control)
  end function
  /// Sets keyboard and page increments for a range control.
  /// @param control control supplied by the caller.
  /// @param smallStep smallStep supplied by the caller.
  /// @param largeStep largeStep supplied by the caller.
  static function setScrollSteps(control, smallStep, largeStep)
    control.smallStep = smallStep
    control.largeStep = largeStep
    mg_range(control.handle, control.scrollMin, control.scrollMax, smallStep)
    return mg_property(control.handle, "largeStep", "", largeStep) != 0
  end function

end struct

/// _hasWord for the native backend.
/// @param text text supplied by the caller.
/// @param word word supplied by the caller.
function _hasWord(text, word)
  for each part in str.split(text, ",")
    if part == word then return true end if
  end for
  return false
end function

/// Native Events operations.
struct Events
  /// bindLoad for the Events backend implementation.
  /// @param app app supplied by the caller.
  /// @param control control supplied by the caller.
  /// @param callback callback supplied by the caller.
  /// @param context context supplied by the caller.
  static function bindLoad(app, control, callback, context)
    global _linuxBindings
    _linuxBindings = _linuxBindings + [Binding(control, callback, context, "load")]
    return control
  end function

  /// bindClose for the Events backend implementation.
  /// @param app app supplied by the caller.
  /// @param control control supplied by the caller.
  /// @param callback callback supplied by the caller.
  /// @param context context supplied by the caller.
  static function bindClose(app, control, callback, context)
    global _linuxBindings
    _linuxBindings = _linuxBindings + [Binding(control, callback, context, "close")]
    return control
  end function

  /// bindResized for the Events backend implementation.
  /// @param app app supplied by the caller.
  /// @param control control supplied by the caller.
  /// @param callback callback supplied by the caller.
  /// @param context context supplied by the caller.
  static function bindResized(app, control, callback, context)
    global _linuxBindings
    _linuxBindings = _linuxBindings + [Binding(control, callback, context, "resized")]
    return control
  end function

  /// bindClick for the Events backend implementation.
  /// @param app app supplied by the caller.
  /// @param control control supplied by the caller.
  /// @param callback callback supplied by the caller.
  /// @param context context supplied by the caller.
  static function bindClick(app, control, callback, context)
    global _linuxBindings
    _linuxBindings = _linuxBindings + [Binding(control, callback, context, "click")]
    return control
  end function

  /// bindClicked for the Events backend implementation.
  /// @param app app supplied by the caller.
  /// @param control control supplied by the caller.
  /// @param callback callback supplied by the caller.
  /// @param context context supplied by the caller.
  static function bindClicked(app, control, callback, context)
    global _linuxBindings
    _linuxBindings = _linuxBindings + [Binding(control, callback, context, "click")]
    return control
  end function

  /// bindTextChanged for the Events backend implementation.
  /// @param app app supplied by the caller.
  /// @param control control supplied by the caller.
  /// @param callback callback supplied by the caller.
  /// @param context context supplied by the caller.
  static function bindTextChanged(app, control, callback, context)
    global _linuxBindings
    _linuxBindings = _linuxBindings + [Binding(control, callback, context, "textChanged")]
    return control
  end function

  /// bindChanged for the Events backend implementation.
  /// @param app app supplied by the caller.
  /// @param control control supplied by the caller.
  /// @param callback callback supplied by the caller.
  /// @param context context supplied by the caller.
  static function bindChanged(app, control, callback, context)
    global _linuxBindings
    _linuxBindings = _linuxBindings + [Binding(control, callback, context, "changed")]
    return control
  end function

  /// bindChange for the Events backend implementation.
  /// @param app app supplied by the caller.
  /// @param control control supplied by the caller.
  /// @param callback callback supplied by the caller.
  /// @param context context supplied by the caller.
  static function bindChange(app, control, callback, context)
    global _linuxBindings
    _linuxBindings = _linuxBindings + [Binding(control, callback, context, "changed")]
    return control
  end function

  /// bindSelectionChanged for the Events backend implementation.
  /// @param app app supplied by the caller.
  /// @param control control supplied by the caller.
  /// @param callback callback supplied by the caller.
  /// @param context context supplied by the caller.
  static function bindSelectionChanged(app, control, callback, context)
    global _linuxBindings
    _linuxBindings = _linuxBindings + [Binding(control, callback, context, "selectionChanged")]
    return control
  end function

  /// bindSelected for the Events backend implementation.
  /// @param app app supplied by the caller.
  /// @param control control supplied by the caller.
  /// @param callback callback supplied by the caller.
  /// @param context context supplied by the caller.
  static function bindSelected(app, control, callback, context)
    global _linuxBindings
    _linuxBindings = _linuxBindings + [Binding(control, callback, context, "selectionChanged")]
    return control
  end function

  /// bindValueChanged for the Events backend implementation.
  /// @param app app supplied by the caller.
  /// @param control control supplied by the caller.
  /// @param callback callback supplied by the caller.
  /// @param context context supplied by the caller.
  static function bindValueChanged(app, control, callback, context)
    global _linuxBindings
    _linuxBindings = _linuxBindings + [Binding(control, callback, context, "valueChanged")]
    return control
  end function

  /// bindScrollChanged for the Events backend implementation.
  /// @param app app supplied by the caller.
  /// @param control control supplied by the caller.
  /// @param callback callback supplied by the caller.
  /// @param context context supplied by the caller.
  static function bindScrollChanged(app, control, callback, context)
    global _linuxBindings
    _linuxBindings = _linuxBindings + [Binding(control, callback, context, "valueChanged")]
    return control
  end function

  /// bindFocus for the Events backend implementation.
  /// @param app app supplied by the caller.
  /// @param control control supplied by the caller.
  /// @param callback callback supplied by the caller.
  /// @param context context supplied by the caller.
  static function bindFocus(app, control, callback, context)
    global _linuxBindings
    _linuxBindings = _linuxBindings + [Binding(control, callback, context, "focus")]
    return control
  end function

  /// bindBlur for the Events backend implementation.
  /// @param app app supplied by the caller.
  /// @param control control supplied by the caller.
  /// @param callback callback supplied by the caller.
  /// @param context context supplied by the caller.
  static function bindBlur(app, control, callback, context)
    global _linuxBindings
    _linuxBindings = _linuxBindings + [Binding(control, callback, context, "blur")]
    return control
  end function

  /// bindSubmit for the Events backend implementation.
  /// @param app app supplied by the caller.
  /// @param control control supplied by the caller.
  /// @param callback callback supplied by the caller.
  /// @param context context supplied by the caller.
  static function bindSubmit(app, control, callback, context)
    global _linuxBindings
    _linuxBindings = _linuxBindings + [Binding(control, callback, context, "submit")]
    return control
  end function

  /// bindValidating for the Events backend implementation.
  /// @param app app supplied by the caller.
  /// @param control control supplied by the caller.
  /// @param callback callback supplied by the caller.
  /// @param context context supplied by the caller.
  static function bindValidating(app, control, callback, context)
    global _linuxBindings
    _linuxBindings = _linuxBindings + [Binding(control, callback, context, "validating")]
    return control
  end function

  /// bindValidated for the Events backend implementation.
  /// @param app app supplied by the caller.
  /// @param control control supplied by the caller.
  /// @param callback callback supplied by the caller.
  /// @param context context supplied by the caller.
  static function bindValidated(app, control, callback, context)
    global _linuxBindings
    _linuxBindings = _linuxBindings + [Binding(control, callback, context, "validated")]
    return control
  end function

  /// _emit for the Events backend implementation.
  /// @param control control supplied by the caller.
  /// @param kind kind supplied by the caller.
  /// @param oldValue oldValue supplied by the caller.
  /// @param newValue newValue supplied by the caller.
  static function _emit(control, kind, oldValue, newValue)
    global _linuxBindings
    cancel = false
    bindings = _linuxBindings
    for each b in bindings
      if b.control.handle != control.handle then continue end if
      matches = b.eventType == kind
      if b.eventType == "changed" and (kind == "textChanged" or kind == "selectionChanged" or kind == "valueChanged") then matches = true end if
      if matches then
        e = Event(control, b.eventType, oldValue, newValue, false)
        b.callback(b.context, e)
        if e.cancel then cancel = true end if
      end if
    end for
    return cancel
  end function

end struct

/// Native Dialog operations.
struct Dialog
  /// Finds the native owner of a dialog.
  /// @param app app supplied by the caller.
  static function _owner(app)
    if app.startupWindow is void then return 0 end if
    return app.startupWindow.handle
  end function
  /// Shows a native message dialog and returns a named result.
  /// @param app app supplied by the caller.
  /// @param title title supplied by the caller.
  /// @param message message supplied by the caller.
  /// @param buttons buttons supplied by the caller.
  /// @param icon icon supplied by the caller.
  static function showMessage(app, title, message, buttons, icon)
    return Dialog.resultName(mg_message(Dialog._owner(app), title, message, buttons, icon))
  end function
  /// Returns true only when the user confirms.
  /// @param app app supplied by the caller.
  /// @param title title supplied by the caller.
  /// @param message message supplied by the caller.
  static function confirm(app, title, message)
    return mg_message(Dialog._owner(app), title, message, "okCancel", "question") == 1
  end function
  /// Shows a native info message.
  /// @param app app supplied by the caller.
  /// @param title title supplied by the caller.
  /// @param message message supplied by the caller.
  static function showInfo(app, title, message)
    return mg_message(Dialog._owner(app), title, message, "ok", "info")
  end function
  /// Shows a native warning message.
  /// @param app app supplied by the caller.
  /// @param title title supplied by the caller.
  /// @param message message supplied by the caller.
  static function showWarning(app, title, message)
    return mg_message(Dialog._owner(app), title, message, "ok", "warning")
  end function
  /// Shows a native error message.
  /// @param app app supplied by the caller.
  /// @param title title supplied by the caller.
  /// @param message message supplied by the caller.
  static function showError(app, title, message)
    return mg_message(Dialog._owner(app), title, message, "ok", "error")
  end function
  /// Implements resultName for Linux dialogs.
  /// @param code code supplied by the caller.
  static function resultName(code)
    if code == 1 then return "ok" end if
    if code == 2 then return "cancel" end if
    if code == 3 then return "abort" end if
    if code == 4 then return "retry" end if
    if code == 5 then return "ignore" end if
    if code == 6 then return "yes" end if
    if code == 7 then return "no" end if
    return "unknown"
  end function
  /// Implements info for Linux dialogs.
  /// @param app app supplied by the caller.
  /// @param title title supplied by the caller.
  /// @param message message supplied by the caller.
  static function info(app, title, message)
    return Dialog.showMessage(app, title, message, "ok", "info")
  end function
  /// Implements warning for Linux dialogs.
  /// @param app app supplied by the caller.
  /// @param title title supplied by the caller.
  /// @param message message supplied by the caller.
  static function warning(app, title, message)
    return Dialog.showMessage(app, title, message, "ok", "warning")
  end function
  /// Implements errorMessage for Linux dialogs.
  /// @param app app supplied by the caller.
  /// @param title title supplied by the caller.
  /// @param message message supplied by the caller.
  static function errorMessage(app, title, message)
    return Dialog.showMessage(app, title, message, "ok", "error")
  end function
  /// Implements question for Linux dialogs.
  /// @param app app supplied by the caller.
  /// @param title title supplied by the caller.
  /// @param message message supplied by the caller.
  static function question(app, title, message)
    return Dialog.showMessage(app, title, message, "yesNo", "question")
  end function
  /// Implements yesNo for Linux dialogs.
  /// @param app app supplied by the caller.
  /// @param title title supplied by the caller.
  /// @param message message supplied by the caller.
  static function yesNo(app, title, message)
    return Dialog.showMessage(app, title, message, "yesNo", "question")
  end function
  /// Implements yesNoCancel for Linux dialogs.
  /// @param app app supplied by the caller.
  /// @param title title supplied by the caller.
  /// @param message message supplied by the caller.
  static function yesNoCancel(app, title, message)
    return Dialog.showMessage(app, title, message, "yesNoCancel", "question")
  end function
  /// Implements retryCancel for Linux dialogs.
  /// @param app app supplied by the caller.
  /// @param title title supplied by the caller.
  /// @param message message supplied by the caller.
  static function retryCancel(app, title, message)
    return Dialog.showMessage(app, title, message, "retryCancel", "warning")
  end function
  /// Implements abortRetryIgnore for Linux dialogs.
  /// @param app app supplied by the caller.
  /// @param title title supplied by the caller.
  /// @param message message supplied by the caller.
  static function abortRetryIgnore(app, title, message)
    return Dialog.showMessage(app, title, message, "abortRetryIgnore", "warning")
  end function
  /// Implements createCustom for Linux dialogs.
  /// @param app app supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param title title supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  static function createCustom(app, id, title, width, height)
    win = Window.create(app, id, title, width, height)
    return DialogWindow(app, win, void, void, void, void, "", "")
  end function
  /// Implements createInput for Linux dialogs.
  /// @param app app supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param title title supplied by the caller.
  /// @param prompt prompt supplied by the caller.
  /// @param defaultValue defaultValue supplied by the caller.
  /// @param width width supplied by the caller.
  static function createInput(app, id, title, prompt, defaultValue, width)
    if width <= 0 then width = 420 end if
    win = Window.create(app, id, title, width, 160)
    label = Label.create(app, win, id + "_prompt", prompt, 14, 14, width - 42, 24)
    input = TextBox.create(app, win, id + "_input", defaultValue, 14, 44, width - 42, 26)
    ok = Button.create(app, win, id + "_ok", "OK", width - 194, 88, 80, 28)
    cancel = Button.create(app, win, id + "_cancel", "Cancel", width - 106, 88, 80, 28)
    dialog = DialogWindow(app, win, label, input, ok, cancel, "", defaultValue)
    Events.bindClick(app, ok, _dialogInputOk, dialog)
    Events.bindClick(app, cancel, _dialogInputCancel, dialog)
    return dialog
  end function
  /// Implements showInput for Linux dialogs.
  /// @param app app supplied by the caller.
  /// @param title title supplied by the caller.
  /// @param prompt prompt supplied by the caller.
  /// @param defaultValue defaultValue supplied by the caller.
  static function showInput(app, title, prompt, defaultValue)
    dialog = Dialog.createInput(app, "__inputDialog", title, prompt, defaultValue, 420)
    result = Dialog.showModal(dialog)
    if result == "ok" then return Dialog.getValue(dialog) end if
    return ""
  end function
  /// Implements getValue for Linux dialogs.
  /// @param dialog dialog supplied by the caller.
  static function getValue(dialog)
    if dialog is void then return "" end if
    if dialog.inputBox is void == false then dialog.value = Control.getText(dialog.inputBox) end if
    return dialog.value
  end function
  /// Implements getResult for Linux dialogs.
  /// @param dialog dialog supplied by the caller.
  static function getResult(dialog)
    if dialog is void then return "" end if
    return dialog.result
  end function
  /// Implements setValue for Linux dialogs.
  /// @param dialog dialog supplied by the caller.
  /// @param value value supplied by the caller.
  static function setValue(dialog, value)
    if dialog is void then return false end if
    dialog.value = value
    if dialog.inputBox is void == false then return Control.setText(dialog.inputBox, value) end if
    return true
  end function
  /// Ends a custom modal dialog without destroying its content.
  /// @param dialog dialog supplied by the caller.
  /// @param result result supplied by the caller.
  static function close(dialog, result)
    dialog.result = result
    mg_show(dialog.window.handle, 0)
    return true
  end function
  /// Runs a custom dialog with native modal ownership.
  /// @param dialog dialog supplied by the caller.
  static function showModal(dialog)
    dialog.result = ""
    mg_modal(dialog.window.handle, Dialog._owner(dialog.app), 1)
    Window.show(dialog.window)
    while dialog.result == "" and mg_alive(dialog.window.handle)
      Application.pump(dialog.app, true)
    end while
    mg_modal(dialog.window.handle, Dialog._owner(dialog.app), 0)
    if dialog.result == "" then dialog.result = "cancel" end if
    return dialog.result
  end function
  /// Opens the native pickOpenFile dialog.
  /// @param app app supplied by the caller.
  /// @param title title supplied by the caller.
  /// @param filter filter supplied by the caller.
  static function pickOpenFile(app, title, filter)
    owner = 0
    if app.startupWindow is void == false then owner = app.startupWindow.handle end if
    return mg_dialog(owner, 0, title, filter)
  end function
  /// Opens the native pickSaveFile dialog.
  /// @param app app supplied by the caller.
  /// @param title title supplied by the caller.
  /// @param filter filter supplied by the caller.
  static function pickSaveFile(app, title, filter)
    owner = 0
    if app.startupWindow is void == false then owner = app.startupWindow.handle end if
    return mg_dialog(owner, 1, title, filter)
  end function
  /// Opens the native pickFolder dialog.
  /// @param app app supplied by the caller.
  /// @param title title supplied by the caller.
  static function pickFolder(app, title)
    owner = 0
    if app.startupWindow is void == false then owner = app.startupWindow.handle end if
    return mg_dialog(owner, 2, title, "")
  end function
  /// Opens the native pickColor dialog.
  /// @param app app supplied by the caller.
  /// @param title title supplied by the caller.
  /// @param initialColor initialColor supplied by the caller.
  static function pickColor(app, title, initialColor)
    owner = 0
    if app.startupWindow is void == false then owner = app.startupWindow.handle end if
    return mg_dialog(owner, 3, title, initialColor)
  end function

end struct

/// _advancedCreate for the native backend.
/// @param app app supplied by the caller.
/// @param parent parent supplied by the caller.
/// @param id id supplied by the caller.
/// @param kind kind supplied by the caller.
/// @param text text supplied by the caller.
/// @param x x supplied by the caller.
/// @param y y supplied by the caller.
/// @param width width supplied by the caller.
/// @param height height supplied by the caller.
function _advancedCreate(app, parent, id, kind, text, x, y, width, height)
  return _new(app, parent, id, kind, text, x, y, width, height)
end function

/// _advancedProperty for the native backend.
/// @param control control supplied by the caller.
/// @param key key supplied by the caller.
/// @param text text supplied by the caller.
/// @param value value supplied by the caller.
function _advancedProperty(control, key, text, value)
  return mg_property(control.handle, key, text, value)
end function

/// _advancedDraw for the native backend.
/// @param control control supplied by the caller.
/// @param op op supplied by the caller.
/// @param x x supplied by the caller.
/// @param y y supplied by the caller.
/// @param width width supplied by the caller.
/// @param height height supplied by the caller.
/// @param color color supplied by the caller.
/// @param text text supplied by the caller.
function _advancedDraw(control, op, x, y, width, height, color, text)
  mg_draw(control.handle, op, x, y, width, height, color, text)
  return true
end function

/// _advancedFormat for the native backend.
/// @param control control supplied by the caller.
/// @param start start supplied by the caller.
/// @param endIndex end supplied by the caller.
/// @param color color supplied by the caller.
/// @param bold bold supplied by the caller.
/// @param italic italic supplied by the caller.
function _advancedFormat(control, start, endIndex, color, bold, italic)
  b = 0; i = 0
  if bold then b = 1 end if
  if italic then i = 1 end if
  return mg_format(control.handle, start, endIndex, color, b, i)
end function


/// @internal
function _dialogInputOk(context, event)
  if context is void then return 0 end if
  context.result = "ok"
  if context.inputBox is void == false then context.value = Control.getText(context.inputBox) end if
  if context.window is void == false and context.window.handle is void == false then mg_show(context.window.handle, 0) end if
  return 0
end function

/// @internal
function _dialogInputCancel(context, event)
  if context is void then return 0 end if
  context.result = "cancel"
  if context.window is void == false and context.window.handle is void == false then mg_show(context.window.handle, 0) end if
  return 0
end function

#endif
/// Native RichTextBox operations.
struct RichTextBox
  /// Creates a native RichTextBox control.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height)
    return _advancedCreate(app, parent, id, "RichTextBox", text, x, y, width, height)
  end function

  /// Formats a character range; end is exclusive.
  /// @param control control supplied by the caller.
  /// @param start start supplied by the caller.
  /// @param endIndex end supplied by the caller.
  /// @param color color supplied by the caller.
  /// @param bold bold supplied by the caller.
  /// @param italic italic supplied by the caller.
  static function formatRange(control, start, endIndex, color, bold, italic)
    return _advancedFormat(control, start, endIndex, color, bold, italic)
  end function

end struct

/// Native CodeEditor operations.
struct CodeEditor
  /// Creates a native CodeEditor control.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height)
    return _advancedCreate(app, parent, id, "CodeEditor", text, x, y, width, height)
  end function

  /// Selects the syntax language for the editor.
  /// @param control control supplied by the caller.
  /// @param language language supplied by the caller.
  static function setLanguage(control, language)
    return _advancedProperty(control, "language", language, 0)
  end function

end struct

/// Native WebView operations.
struct WebView
  /// Creates a native WebView control.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height)
    return _advancedCreate(app, parent, id, "WebView", text, x, y, width, height)
  end function

  /// Navigates the embedded browser to a URL.
  /// @param control control supplied by the caller.
  /// @param url url supplied by the caller.
  static function navigate(control, url)
    return _advancedProperty(control, "url", url, 0)
  end function

  /// Displays HTML in the embedded browser.
  /// @param control control supplied by the caller.
  /// @param html html supplied by the caller.
  static function loadHtml(control, html)
    return _advancedProperty(control, "html", html, 0)
  end function

  /// Returns 1 when ready, 0 while loading, or -1 after initialization failure.
  /// @param control control supplied by the caller.
  static function getStatus(control)
    return _advancedProperty(control, "status", "", 0)
  end function

end struct

/// Native TrayIcon operations.
struct TrayIcon
  /// Creates a native TrayIcon control.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height)
    return _advancedCreate(app, parent, id, "TrayIcon", text, x, y, width, height)
  end function

  /// Sets the system tray context menu labels.
  /// @param control control supplied by the caller.
  /// @param items items supplied by the caller.
  static function setItems(control, items)
    return _advancedProperty(control, "items", _joinText(items, "\n"), 0)
  end function

  /// Sets an icon file on Windows or icon name/path on Linux.
  /// @param control control supplied by the caller.
  /// @param source source supplied by the caller.
  static function setIcon(control, source)
    return _advancedProperty(control, "icon", source, 0)
  end function

end struct

/// Native DrawingCanvas operations.
struct DrawingCanvas
  /// Creates a native DrawingCanvas control.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height)
    return _advancedCreate(app, parent, id, "DrawingCanvas", text, x, y, width, height)
  end function

  /// Clears retained drawing commands.
  /// @param control control supplied by the caller.
  static function clear(control)
    return _advancedDraw(control, 0, 0, 0, 0, 0, "#ffffff", "")
  end function

  /// Appends a line that is repainted after window exposure.
  /// @param control control supplied by the caller.
  /// @param x1 x1 supplied by the caller.
  /// @param y1 y1 supplied by the caller.
  /// @param x2 x2 supplied by the caller.
  /// @param y2 y2 supplied by the caller.
  /// @param color color supplied by the caller.
  static function line(control, x1, y1, x2, y2, color)
    return _advancedDraw(control, 1, x1, y1, x2, y2, color, "")
  end function

  /// Appends a filled rectangle.
  /// @param control control supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  /// @param color color supplied by the caller.
  static function fillRect(control, x, y, width, height, color)
    return _advancedDraw(control, 2, x, y, width, height, color, "")
  end function

  /// Appends text at the supplied position.
  /// @param control control supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param color color supplied by the caller.
  static function drawText(control, x, y, text, color)
    return _advancedDraw(control, 3, x, y, 0, 0, color, text)
  end function

end struct

/// Native Chart operations.
struct Chart
  /// Creates a native Chart control.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height)
    return _advancedCreate(app, parent, id, "Chart", text, x, y, width, height)
  end function

  /// Clears retained drawing commands.
  /// @param control control supplied by the caller.
  static function clear(control)
    return _advancedDraw(control, 0, 0, 0, 0, 0, "#ffffff", "")
  end function

  /// Draws a bar or line chart from nonnegative numeric values.
  /// @param control control supplied by the caller.
  /// @param values values supplied by the caller.
  /// @param chartType chartType supplied by the caller.
  /// @param color color supplied by the caller.
  static function setValues(control, values, chartType, color)
    Chart.clear(control)
    if len(values) == 0 then return true end if
    maximum = 1
    for each value in values
      if value > maximum then maximum = value end if
    end for
    width = control.width - 24
    height = control.height - 24
    step = width / len(values)
    px = 12; py = height + 12
    for i = 0 to len(values) - 1
      x = 12 + i * step
      y = 12 + height - values[i] * height / maximum
      if chartType == "line" then
        if i > 0 then _advancedDraw(control, 1, px, py, x, y, color, "") end if
      else
        _advancedDraw(control, 2, x, y, step - 3, height + 12 - y, color, "")
      end if
      px = x; py = y
    end for
    return true
  end function

end struct

/// Native PropertyGrid operations.
struct PropertyGrid
  /// Creates an editable two-column property table.
  /// @param app app supplied by the caller.
  /// @param parent parent supplied by the caller.
  /// @param id id supplied by the caller.
  /// @param text text supplied by the caller.
  /// @param x x supplied by the caller.
  /// @param y y supplied by the caller.
  /// @param width width supplied by the caller.
  /// @param height height supplied by the caller.
  /// @param items items supplied by the caller.
  static function create(app, parent, id, text, x, y, width, height, items)
    rows = []
    for each item in items
      row = item
      if typeof(item) == "array" then row = _joinText(item, "\t") end if
      rows = rows + [row]
    end for
    c = DataGrid.create(app, parent, id, text, x, y, width, height, ["Property", "Value"], rows, -1)
    Control.setEditable(c, true)
    return c
  end function

  /// Returns the property value at a row.
  /// @param control control supplied by the caller.
  /// @param row row supplied by the caller.
  static function getValue(control, row)
    return Control.getCellText(control, row, 1)
  end function

  /// Updates the property value at a row.
  /// @param control control supplied by the caller.
  /// @param row row supplied by the caller.
  /// @param value value supplied by the caller.
  static function setValue(control, row, value)
    return Control.setCellText(control, row, 1, value)
  end function

end struct
