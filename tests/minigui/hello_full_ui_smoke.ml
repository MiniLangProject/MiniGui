import MiniGuiLib.minigui as MiniGui
import "../../examples/hello-gui/app.ml" as CodeBehind

struct HelloUi
  app,
  mainWindow,
  headlineLabel,
  nameTextBox,
  greetButton,
  resultLabel,
end struct

function miniguiEvent0(ui, event)
  return CodeBehind.onMainWindowLoad(ui, event)
end function

function main(args)
  app = MiniGui.Application.create()
  mainWindow = MiniGui.Window.create(app, "mainWindow", "MiniGui Hello", 480, 220)
  headlineLabel = MiniGui.Label.create(app, mainWindow, "headlineLabel", "Welcome to MiniGui", 14, 14, 412, 24)
  nameTextBox = MiniGui.TextBox.create(app, mainWindow, "nameTextBox", "", 14, 46, 412, 26)
  greetButton = MiniGui.Button.create(app, mainWindow, "greetButton", "Greet", 14, 80, 412, 30)
  resultLabel = MiniGui.Label.create(app, mainWindow, "resultLabel", "", 14, 118, 412, 24)
  ui = HelloUi(app, mainWindow, headlineLabel, nameTextBox, greetButton, resultLabel)
  MiniGui.Events.bindLoad(app, mainWindow, miniguiEvent0, ui)
  MiniGui.Window.show(mainWindow)
  if MiniGui.Control.getText(resultLabel) != "Ready." then return 1 end if
  return 0
end function
