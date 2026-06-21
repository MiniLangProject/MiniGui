import MiniGuiLib.minigui as MiniGui

extern function SendMessageW(hwnd as ptr, msg as u32, wParam as ptr, lParam as ptr) from "user32.dll" returns ptr

const WM_COMMAND = 273
const BN_CLICKED = 0
const BM_CLICK = 245

function onClick(ui, event)
  MiniGui.Control.setText(ui.resultLabel, "Clicked")
  return 0
end function

struct SmokeUi
  app,
  mainWindow,
  greetButton,
  resultLabel,
end struct

function main(args)
  app = MiniGui.Application.create()
  win = MiniGui.Window.create(app, "mainWindow", "MiniGui WM_COMMAND Smoke", 360, 140)
  button = MiniGui.Button.create(app, win, "greetButton", "Begruessen", 16, 16, 120, 28)
  label = MiniGui.Label.create(app, win, "resultLabel", "", 16, 56, 260, 24)
  ui = SmokeUi(app, win, button, label)
  MiniGui.Events.bindClick(app, button, onClick, ui)
  MiniGui.Application.setStartupWindow(app, win)

  SendMessageW(win.handle, WM_COMMAND, (BN_CLICKED << 16) | button.nativeId, button.handle)
  if MiniGui.Control.getText(label) != "Clicked" then return 1 end if
  MiniGui.Control.setText(label, "")
  SendMessageW(button.handle, BM_CLICK, 0, 0)
  if MiniGui.Control.getText(label) != "Clicked" then return 2 end if
  return 0
end function
