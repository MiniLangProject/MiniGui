package customer_form

import MiniGuiLib.minigui as MiniGui

function onSaveClick(ui, event)
  name = MiniGui.Control.getText(ui.nameTextBox)
  street = MiniGui.Control.getText(ui.customerAddress_streetTextBox)
  MiniGui.Control.setText(ui.statusLabel, "Gespeichert: " + name + ", " + street)
  return 0
end function
