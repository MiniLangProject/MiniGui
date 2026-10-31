import MiniGuiLib.minigui as Gui

#if TARGET_OS == "windows"
extern function GetComboBoxInfo(hwnd as ptr, info as bytes) from "user32.dll" returns i32

function integerAt(data, offset)
  return data[offset] + data[offset + 1] * 256 + data[offset + 2] * 65536 + data[offset + 3] * 16777216
end function

function arrowRight(combo)
  data = bytes(64, 0)
  data[0] = 64
  if GetComboBoxInfo(combo.handle, data) == 0 then return -1 end if
  return integerAt(data, 28)
end function

function windowProc(hwnd, msg, wp, lp)
  return Gui.Application.windowProc(hwnd, msg, wp, lp)
end function

function main(args)
  app = Gui.Application.create()
  win = Gui.Window.create(app, "main", "Native child resize regression", 500, 300)
  Gui.Window.installProc(win, nativeCallback(windowProc, "wndproc"))
  combo = Gui.ComboBox.create(app, win, "combo", "", 16, 16, 200, 30, ["First", "Second"], 0)
  original = arrowRight(combo)
  if original < 0 then return 1 end if
  Gui.Control.setBounds(combo, 16, 16, 320, 30)
  if arrowRight(combo) != original + 120 then return 2 end if
  Gui.Control.setBounds(combo, 16, 16, 120, 30)
  if arrowRight(combo) != original - 80 then return 3 end if
  Gui.Window.close(win)
  return 0
end function
#else
function main(args)
  return 0
end function
#endif
