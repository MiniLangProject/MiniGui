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
  action = "" + event.newValue
  if action == "" or action == "true" then action = event.sender.id end if
  source = "Toolbar"
  if event.sender.kind == "MenuBar" then source = "Menu" end if
  message = source + ": " + action
  MiniGui.Control.setText(ui.actionLabel, message)
  MiniGui.Control.setText(ui.resultLabel, message)
  MiniGui.Control.setText(ui.statusLabel, "Action: " + action)
  return 0
end function

function onTabSelected(ui, event)
  MiniGui.Control.setText(ui.statusLabel, "Tab selected: " + event.newValue)
  return 0
end function

function onNameChanged(ui, event)
  MiniGui.Control.setText(ui.statusLabel, "Name: " + event.newValue)
  return 0
end function

function onNameFocus(ui, event)
  MiniGui.Control.setText(ui.resultLabel, "Name focused")
  return 0
end function

function onNameBlur(ui, event)
  MiniGui.Control.setText(ui.resultLabel, "Name blurred")
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
  MiniGui.Control.setText(ui.resultLabel, "Quantity: " + event.newValue)
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
  country = MiniGui.Control.getSelectedText(ui.countryComboBox)
  if country == "United States" then
    MiniGui.Control.setItems(ui.cityListBox, ["New York", "San Francisco", "Seattle"])
  else if country == "France" then
    MiniGui.Control.setItems(ui.cityListBox, ["Paris", "Lyon", "Marseille"])
  else
    MiniGui.Control.setItems(ui.cityListBox, ["Berlin", "Bonn", "Hamburg"])
  end if
  MiniGui.Control.setSelectedIndex(ui.cityListBox, 0)
  MiniGui.Control.setText(ui.resultLabel, "Country: " + country)
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
  section = "" + event.newValue
  if section == "Orders" then
    MiniGui.Control.setItems(ui.customerTable, ["Order #1001", "Order #1002", "Order #1003"])
    MiniGui.Control.setText(ui.dataStatusLabel, "Orders loaded")
  else if section == "Reports" then
    MiniGui.Control.setItems(ui.customerTable, ["Revenue report", "Inventory report", "Activity report"])
    MiniGui.Control.setText(ui.dataStatusLabel, "Reports loaded")
  else
    section = "Customers"
    MiniGui.Control.setItems(ui.customerTable, ["Ada Lovelace", "Grace Hopper", "Margaret Hamilton"])
    MiniGui.Control.setText(ui.dataStatusLabel, "Customers loaded")
  end if
  MiniGui.Control.setText(ui.resultLabel, "Tree selected: " + section)
  return 0
end function

function onTableSelected(ui, event)
  MiniGui.Control.setText(ui.dataStatusLabel, "Table row selected")
  MiniGui.Control.setText(ui.resultLabel, "Table selected: " + event.newValue)
  return 0
end function

function onSplitterChanged(ui, event)
  MiniGui.Control.setText(ui.resultLabel, "Splitter position: " + event.newValue)
  MiniGui.Control.setText(ui.statusLabel, "Splitter moved")
  return 0
end function

function onDataScrolled(ui, event)
  MiniGui.Control.setText(ui.dataStatusLabel, "Scroll position: " + event.newValue)
  MiniGui.Control.setText(ui.statusLabel, "Data scrolled")
  return 0
end function
