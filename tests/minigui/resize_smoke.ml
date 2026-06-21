import MiniGuiLib.minigui as MiniGui

function main(args)
  app = MiniGui.Application.create()
  win = MiniGui.Window.create(app, "mainWindow", "MiniGui Resize Smoke", 240, 180)
  button = MiniGui.Button.create(app, win, "resizeButton", "Resize", 10, 20, 100, 30)
  panel = MiniGui.Panel.create(app, win, "resizePanel", "", 20, 60, 160, 50)
  label = MiniGui.Label.create(app, panel, "resizeLabel", "Inside", 8, 10, 80, 20)

  if button.x != 10 or button.y != 20 then return 1 end if
  if button.width != 100 or button.height != 30 then return 2 end if

  if MiniGui.Application.resizeWindow(app, win, 400, 200) == false then return 3 end if
  if button.x != 20 or button.y != 40 then return 4 end if
  if button.width != 200 or button.height != 60 then return 5 end if
  if panel.x != 40 or panel.y != 120 then return 6 end if
  if panel.width != 320 or panel.height != 100 then return 7 end if
  if label.x != 16 or label.y != 20 then return 8 end if
  if label.width != 160 or label.height != 40 then return 9 end if

  if MiniGui.Control.setBounds(button, 30, 30, 50, 20) == false then return 10 end if
  if MiniGui.Application.resizeWindow(app, win, 200, 100) == false then return 11 end if
  if button.x != 30 or button.y != 30 then return 12 end if
  if button.width != 50 or button.height != 20 then return 13 end if

  return 0
end function
