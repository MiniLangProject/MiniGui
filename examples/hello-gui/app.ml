package hello_gui

import MiniGuiLib.minigui as MiniGui

function onMainWindowLoad(ui, event)
  MiniGui.Control.setText(ui.resultLabel, "Bereit.")
  return 0
end function

function onMainWindowClose(ui, event)
  return 0
end function

function onNameChanged(ui, event)
  if event.newValue == "" then
    MiniGui.Control.setText(ui.resultLabel, "")
  end if
  return 0
end function

function onGreetButtonClick(ui, event)
  name = MiniGui.Control.getText(ui.nameTextBox)
  if name == "" then
    MiniGui.Control.setText(ui.resultLabel, "Bitte einen Namen eingeben.")
  else
    MiniGui.Control.setText(ui.resultLabel, "Hallo, " + name + "!")
  end if
  return 0
end function
