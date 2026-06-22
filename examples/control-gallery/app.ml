package control_gallery

import MiniGuiLib.minigui as MiniGui

function status(ui, message)
  MiniGui.Control.setText(ui.statusLabel, message)
  return 0
end function

function onMainWindowLoad(ui, event)
  MiniGui.Control.setText(ui.statusLabel, "Gallery ready")
  MiniGui.Control.setText(ui.resultLabel, "All controls loaded")
  MiniGui.Control.setScrollSteps(ui.volumeScrollBar, 5, 20)
  MiniGui.Control.setValue(ui.progressBar, 35)
  return 0
end function

function onMainWindowClose(ui, event)
  return 0
end function

function onMainWindowResized(ui, event)
  MiniGui.Control.setText(ui.statusLabel, "Window resized")
  return 0
end function

function onActionClicked(ui, event)
  MiniGui.Control.setText(ui.resultLabel, "Action from " + event.sender.id)
  return 0
end function

function onTabSelected(ui, event)
  MiniGui.Control.setText(ui.statusLabel, "Tab event")
  return 0
end function

function onNameChanged(ui, event)
  MiniGui.Control.setText(ui.statusLabel, "Name: " + event.newValue)
  return 0
end function

function onDateChanged(ui, event)
  MiniGui.Control.setText(ui.statusLabel, "Date changed")
  return 0
end function

function onSecretChanged(ui, event)
  MiniGui.Control.setText(ui.statusLabel, "Password changed")
  return 0
end function

function onQuantityChanged(ui, event)
  MiniGui.Control.setText(ui.resultLabel, "Quantity: " + MiniGui.Control.getValue(ui.quantityNumberBox))
  return 0
end function

function onNotesChanged(ui, event)
  MiniGui.Control.setText(ui.statusLabel, "Notes changed")
  return 0
end function

function onConsentClicked(ui, event)
  if MiniGui.Control.isChecked(ui.consentCheckBox) then
    MiniGui.Control.setText(ui.resultLabel, "Advanced actions enabled")
  else
    MiniGui.Control.setText(ui.resultLabel, "Advanced actions disabled")
  end if
  return 0
end function

function onModeClicked(ui, event)
  MiniGui.Control.setText(ui.resultLabel, "Mode: " + event.sender.id)
  return 0
end function

function onCountrySelected(ui, event)
  MiniGui.Control.setText(ui.resultLabel, "Country: " + MiniGui.Control.getSelectedText(ui.countryComboBox))
  return 0
end function

function onCitySelected(ui, event)
  MiniGui.Control.setText(ui.resultLabel, "City: " + MiniGui.Control.getSelectedText(ui.cityListBox))
  return 0
end function

function onPrimaryButtonClick(ui, event)
  name = MiniGui.Control.getText(ui.nameTextBox)
  MiniGui.Control.setText(ui.resultLabel, "Applied for " + name)
  MiniGui.Control.setEnabled(ui.disabledButton, true)
  MiniGui.Control.setVisible(ui.hiddenLabel, true)
  MiniGui.Control.setText(ui.hiddenLabel, "Apply was clicked")
  return 0
end function

function onDisabledButtonClick(ui, event)
  MiniGui.Control.setText(ui.resultLabel, "Secondary action")
  return 0
end function

function onLinkClicked(ui, event)
  MiniGui.Control.setText(ui.resultLabel, "Documentation link clicked")
  return 0
end function

function onImageClicked(ui, event)
  MiniGui.Control.setText(ui.resultLabel, "Image clicked")
  return 0
end function

function onVolumeScrolled(ui, event)
  MiniGui.Control.setText(ui.volumeLabel, "Volume: " + event.newValue)
  MiniGui.Control.setText(ui.statusLabel, "Scroll value changed")
  MiniGui.Control.setValue(ui.progressBar, event.newValue)
  return 0
end function

function onProgressChanged(ui, event)
  MiniGui.Control.setText(ui.statusLabel, "Progress value changed")
  return 0
end function

function onTreeSelected(ui, event)
  MiniGui.Control.setText(ui.resultLabel, "Tree selected")
  return 0
end function

function onTableSelected(ui, event)
  MiniGui.Control.setText(ui.resultLabel, "Table selected")
  return 0
end function
