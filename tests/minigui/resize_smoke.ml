import MiniGuiLib.minigui as MiniGui

function main(args)
  app = MiniGui.Application.create()
  win = MiniGui.Window.create(app, "mainWindow", "MiniGui Resize Smoke", 240, 180)
  button = MiniGui.Button.create(app, win, "resizeButton", "Resize", 10, 20, 100, 30)
  panel = MiniGui.Panel.create(app, win, "resizePanel", "", 20, 60, 160, 50)
  label = MiniGui.Label.create(app, panel, "resizeLabel", "Inside", 8, 10, 80, 20)
  fixed = MiniGui.Button.create(app, win, "fixedButton", "Fixed", 24, 14, 60, 24)
  rightAnchored = MiniGui.Button.create(app, win, "rightButton", "Right", 140, 14, 40, 24)
  fillBox = MiniGui.TextBox.create(app, win, "fillBox", "Fill", 12, 112, 120, 24)
  anchoredBox = MiniGui.TextBox.create(app, win, "anchoredBox", "Anchor", 12, 142, 120, 24)

  if MiniGui.Control.setLayout(fixed, "none", "left,top", -1, -1, -1, -1) == false then return 20 end if
  if MiniGui.Control.setLayout(rightAnchored, "anchor", "right,top", -1, -1, -1, -1) == false then return 21 end if
  if MiniGui.Control.setLayout(fillBox, "fill", "left,top", 80, -1, 220, -1) == false then return 22 end if
  if MiniGui.Control.setLayout(anchoredBox, "anchor", "left,top,right", 80, -1, 170, -1) == false then return 23 end if

  if button.x != 10 or button.y != 20 then return 1 end if
  if button.width != 100 or button.height != 30 then return 2 end if

  if MiniGui.Application.resizeWindow(app, win, 400, 200) == false then return 3 end if
  if button.x != 20 or button.y != 40 then return 4 end if
  if button.width != 200 or button.height != 60 then return 5 end if
  if panel.x != 40 or panel.y != 120 then return 6 end if
  if panel.width != 320 or panel.height != 100 then return 7 end if
  if label.x != 16 or label.y != 20 then return 8 end if
  if label.width != 160 or label.height != 40 then return 9 end if
  if fixed.x != 24 or fixed.y != 14 or fixed.width != 60 or fixed.height != 24 then return 24 end if
  if rightAnchored.x <= 140 or rightAnchored.y != 14 or rightAnchored.width != 40 then return 25 end if
  if fillBox.width != 220 then return 26 end if
  if anchoredBox.width != 170 then return 27 end if

  if MiniGui.Control.setBounds(button, 30, 30, 50, 20) == false then return 10 end if
  if MiniGui.Application.resizeWindow(app, win, 200, 100) == false then return 11 end if
  if button.x != 30 or button.y != 30 then return 12 end if
  if button.width != 50 or button.height != 20 then return 13 end if

  return 0
end function
