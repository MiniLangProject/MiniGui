import MiniGuiLib.minigui as MiniGui

function main(args)
  app = MiniGui.Application.create()
  win = MiniGui.Window.create(app, "mainWindow", "MiniGui Client Rect Smoke", 320, 220)
  button = MiniGui.Button.create(app, win, "button", "Button", 10, 10, 100, 30)

  oldWidth = win.width
  oldHeight = win.height
  if MiniGui.Application.pollResize(app) == false then return 1 end if
  if win.width == oldWidth and win.height == oldHeight then return 2 end if
  if button.width == 100 and button.height == 30 then return 3 end if

  return 0
end function
