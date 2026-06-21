import MiniGuiLib.minigui as MiniGui
import "codebehind_minigui_impl.ml" as CodeBehind

struct SmokeUi
  resultLabel,
end struct

function miniguiEvent0(ui, event)
  return CodeBehind.setLabel(ui, event)
end function

function main(args)
  app = MiniGui.Application.create()
  win = MiniGui.Window.create(app, "mainWindow", "Generated MiniGui Callback Smoke", 320, 120)
  label = MiniGui.Label.create(app, win, "resultLabel", "", 16, 16, 220, 24)
  ui = SmokeUi(label)
  MiniGui.Events.bindLoad(app, win, miniguiEvent0, ui)
  MiniGui.Window.show(win)
  if MiniGui.Control.getText(label) != "ok" then return 2 end if
  return 0
end function
