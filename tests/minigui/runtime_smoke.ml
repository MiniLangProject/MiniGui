import MiniGuiLib.minigui as MiniGui

function onClick(ui, event)
  name = MiniGui.Control.getText(ui.nameTextBox)
  MiniGui.Control.setText(ui.resultLabel, "Hallo, " + name)
  return 0
end function

function onTextChanged(ui, event)
  MiniGui.Control.setText(ui.resultLabel, "Changed: " + event.oldValue + " -> " + event.newValue)
  return 0
end function

function onLoad(ui, event)
  MiniGui.Control.setText(ui.resultLabel, "Loaded")
  return 0
end function

function onClose(ui, event)
  event.cancel = true
  MiniGui.Control.setText(ui.resultLabel, "Close canceled")
  return 0
end function

function onResized(ui, event)
  MiniGui.Control.setText(ui.resultLabel, "Resized")
  return 0
end function

struct SmokeUi
  app,
  mainWindow,
  nameTextBox,
  greetButton,
  resultLabel,
end struct

function main(args)
  app = MiniGui.Application.create()
  win = MiniGui.Window.create(app, "mainWindow", "MiniGui Smoke", 420, 180)
  input = MiniGui.TextBox.create(app, win, "nameTextBox", "Ada", 16, 16, 260, 24)
  button = MiniGui.Button.create(app, win, "greetButton", "Begruessen", 16, 50, 120, 28)
  label = MiniGui.Label.create(app, win, "resultLabel", "", 16, 88, 320, 24)
  ui = SmokeUi(app, win, input, button, label)
  MiniGui.Events.bindLoad(app, win, onLoad, ui)
  MiniGui.Events.bindClose(app, win, onClose, ui)
  MiniGui.Events.bindResized(app, win, onResized, ui)
  MiniGui.Events.bindClick(app, button, onClick, ui)
  MiniGui.Events.bindTextChanged(app, input, onTextChanged, ui)
  if MiniGui.Events.dispatchLoad(win) == false then return 1 end if
  if MiniGui.Control.getText(label) != "Loaded" then return 2 end if
  if MiniGui.Events.dispatchCommand(app, 0, button.nativeId, button.handle) == false then return 3 end if
  if MiniGui.Control.getText(label) != "Hallo, Ada" then return 4 end if
  MiniGui.SetWindowTextW(input.handle, "Grace")
  if MiniGui.Events.dispatchCommand(app, 768, input.nativeId, input.handle) == false then return 5 end if
  if MiniGui.Control.getText(label) != "Changed: Ada -> Grace" then return 6 end if
  if MiniGui.Events.dispatchClose(app, win) == false then return 7 end if
  if MiniGui.Control.getText(label) != "Close canceled" then return 8 end if
  if MiniGui.Application.resizeWindow(app, win, 520, 240) == false then return 9 end if
  if MiniGui.Control.getText(label) != "Resized" then return 10 end if
  return 0
end function
