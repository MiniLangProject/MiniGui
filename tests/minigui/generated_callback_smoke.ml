import MiniGuiLib.minigui as MiniGui
import "codebehind_alias_impl.ml" as CodeBehind

struct Box
  value,
end struct

function miniguiEvent0(ui, event)
  return CodeBehind.setValue(ui, event)
end function

function main(args)
  app = MiniGui.Application.create()
  win = MiniGui.Window.create(app, "mainWindow", "Generated Callback Smoke", 320, 120)
  box = Box("")
  MiniGui.Events.bindLoad(app, win, miniguiEvent0, box)
  if MiniGui.Events.dispatchLoad(win) == false then return 1 end if
  if box.value != "ok" then return 2 end if
  return 0
end function
