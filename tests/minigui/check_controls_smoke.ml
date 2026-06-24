import MiniGuiLib.minigui as MiniGui

function onToggle(ui, event)
  MiniGui.Control.setText(ui.resultLabel, event.sender.kind + ":" + event.eventType)
  return 0
end function

function onSelection(ui, event)
  MiniGui.Control.setText(ui.resultLabel, event.sender.kind + ":" + event.newValue)
  return 0
end function

function onScroll(ui, event)
  MiniGui.Control.setText(ui.resultLabel, event.sender.kind + ":" + event.newValue)
  return 0
end function

function onEventName(ui, event)
  MiniGui.Control.setText(ui.resultLabel, event.sender.kind + ":" + event.eventType + ":" + event.newValue)
  return 0
end function

struct CheckControlsUi
  app,
  mainWindow,
  optInCheckBox,
  choiceRadioButton,
  detailsPanel,
  notesTextArea,
  groupBox,
  countryComboBox,
  cityListBox,
  volumeScrollBar,
  volumeSlider,
  valueSlider,
  progressBar,
  tabs,
  menu,
  toolbar,
  tree,
  table,
  dataGrid,
  datePicker,
  statusBar,
  resultLabel,
end struct

function main(args)
  app = MiniGui.Application.create()
  win = MiniGui.Window.create(app, "mainWindow", "MiniGui Check Controls Smoke", 560, 420)
  optIn = MiniGui.CheckBox.create(app, win, "optInCheckBox", "Opt in", 16, 16, 180, 22, true)
  choice = MiniGui.RadioButton.create(app, win, "choiceRadioButton", "Choice A", 16, 46, 180, 22, false)
  panel = MiniGui.Panel.create(app, win, "detailsPanel", "", 16, 76, 240, 88)
  notes = MiniGui.TextArea.create(app, panel, "notesTextArea", "Line 1", 8, 8, 220, 70)
  group = MiniGui.GroupBox.create(app, win, "groupBox", "Group", 260, 16, 180, 80)
  combo = MiniGui.ComboBox.create(app, win, "countryComboBox", "", 16, 180, 180, 120, ["DE", "US", "FR"], 1)
  list = MiniGui.ListBox.create(app, win, "cityListBox", "", 220, 180, 180, 90, ["Berlin", "Bonn", "Hamburg"], 0)
  scroll = MiniGui.ScrollBar.create(app, win, "volumeScrollBar", "", 430, 180, 18, 100, "vertical", 0, 100, 20, 5, 25)
  slider = MiniGui.Slider.create(app, win, "volumeSlider", "", 16, 280, 220, 32, "horizontal", 0, 100, 30, 5, 25)
  valueSlider = MiniGui.Slider.create(app, win, "valueSlider", "", 16, 314, 220, 32, "horizontal", 0, 100, 10, 5, 25)
  progress = MiniGui.ProgressBar.create(app, win, "progressBar", "", 250, 280, 180, 24, 0, 100, 40)
  tabs = MiniGui.TabControl.create(app, win, "tabs", "", 16, 326, 220, 80, ["Inputs", "Data"], 0)
  menu = MiniGui.MenuBar.create(app, win, "menu", "", 250, 326, 180, 24, ["File", "Help"])
  toolbar = MiniGui.ToolBar.create(app, win, "toolbar", "", 250, 358, 180, 30, ["Save", "Refresh"])
  tree = MiniGui.TreeView.create(app, win, "tree", "", 16, 420, 160, 90, ["Root", "Child"])
  table = MiniGui.ListView.create(app, win, "table", "", 190, 420, 180, 90, ["Ada", "Grace"], 0)
  dataGrid = MiniGui.DataGrid.create(app, win, "dataGrid", "", 190, 420, 220, 90, ["Name", "Role"], ["Ada\tAnalyst", "Grace\tCompiler"], 0)
  datePicker = MiniGui.DatePicker.create(app, win, "datePicker", "", 385, 420, 140, 26)
  statusBar = MiniGui.StatusBar.create(app, win, "statusBar", "Ready", 16, 520, 420, 24)
  label = MiniGui.Label.create(app, win, "resultLabel", "", 16, 550, 420, 24)
  ui = CheckControlsUi(app, win, optIn, choice, panel, notes, group, combo, list, scroll, slider, valueSlider, progress, tabs, menu, toolbar, tree, table, dataGrid, datePicker, statusBar, label)

  if MiniGui.Control.isChecked(optIn) == false then return 1 end if
  if MiniGui.Control.isChecked(choice) then return 2 end if
  if MiniGui.Control.setChecked(optIn, false) == false then return 3 end if
  if MiniGui.Control.isChecked(optIn) then return 4 end if
  if MiniGui.Control.setChecked(choice, true) == false then return 5 end if
  if MiniGui.Control.isChecked(choice) == false then return 6 end if
  if panel.kind != "Panel" then return 30 end if
  if MiniGui.Control.getText(notes) != "Line 1" then return 11 end if
  if MiniGui.Control.setPosition(notes, 20, 80) == false then return 12 end if
  if notes.x != 20 or notes.y != 80 then return 13 end if
  if MiniGui.Control.setSize(notes, 240, 74) == false then return 14 end if
  if notes.width != 240 or notes.height != 74 then return 15 end if
  if MiniGui.Control.getText(group) != "Group" then return 16 end if
  if MiniGui.Control.getSelectedIndex(combo) != 1 then return 17 end if
  if MiniGui.Control.getSelectedText(combo) != "US" then return 18 end if
  if MiniGui.Control.setSelectedIndex(combo, 2) == false then return 19 end if
  if MiniGui.Control.getSelectedText(combo) != "FR" then return 20 end if
  if MiniGui.Control.getSelectedText(list) != "Berlin" then return 21 end if
  if MiniGui.Control.clearItems(list) == false then return 22 end if
  if MiniGui.Control.addItem(list, "Kiel") < 0 then return 23 end if
  if MiniGui.Control.setSelectedIndex(list, 0) == false then return 24 end if
  if MiniGui.Control.getSelectedText(list) != "Kiel" then return 25 end if
  if MiniGui.Control.getScrollValue(scroll) != 20 then return 31 end if
  if MiniGui.Control.setScrollRange(scroll, 10, 80) == false then return 32 end if
  if MiniGui.Control.setScrollValue(scroll, 90) == false then return 33 end if
  if MiniGui.Control.getScrollValue(scroll) != 80 then return 34 end if
  if MiniGui.Control.setScrollSteps(scroll, 5, 20) == false then return 35 end if
  if MiniGui.Control.setScrollValue(scroll, 20) == false then return 36 end if
  if MiniGui.Control.getScrollValue(slider) != 30 then return 39 end if
  if MiniGui.Control.setScrollRange(slider, 10, 90) == false then return 40 end if
  if MiniGui.Control.setScrollValue(slider, 95) == false then return 41 end if
  if MiniGui.Control.getScrollValue(slider) != 90 then return 42 end if
  if MiniGui.Control.setScrollSteps(slider, 5, 20) == false then return 43 end if
  if MiniGui.Control.setScrollValue(slider, 30) == false then return 44 end if
  if progress.kind != "ProgressBar" then return 47 end if
  if MiniGui.Control.getValue(progress) != 40 then return 48 end if
  if MiniGui.Control.setValue(progress, 120) == false then return 49 end if
  if MiniGui.Control.getValue(progress) != 100 then return 50 end if
  if MiniGui.Control.setValueRange(progress, 10, 80) == false then return 51 end if
  if MiniGui.Control.getValue(progress) != 80 then return 52 end if
  if tabs.kind != "TabControl" then return 53 end if
  if menu.kind != "MenuBar" then return 54 end if
  if toolbar.kind != "ToolBar" then return 55 end if
  if tree.kind != "TreeView" then return 56 end if
  if table.kind != "ListView" then return 57 end if
  if dataGrid.kind != "DataGrid" then return 68 end if
  if MiniGui.Control.isEditable(dataGrid) then return 72 end if
  if MiniGui.Control.setEditable(dataGrid, true) == false then return 73 end if
  if MiniGui.Control.isEditable(dataGrid) == false then return 74 end if
  if MiniGui.Control.getCellText(dataGrid, 0, 1) != "Analyst" then return 69 end if
  if MiniGui.Control.setCellText(dataGrid, 0, 1, "Runtime") == false then return 70 end if
  if MiniGui.Control.getCellText(dataGrid, 0, 1) != "Runtime" then return 71 end if
  if datePicker.kind != "DatePicker" then return 58 end if
  if MiniGui.Control.getText(statusBar) != "Ready" then return 59 end if
  if MiniGui.Control.setText(statusBar, "Updated") == false then return 60 end if
  if MiniGui.Control.getText(statusBar) != "Updated" then return 61 end if

  MiniGui.Events.bindClick(app, optIn, onToggle, ui)
  MiniGui.Events.bindClick(app, choice, onToggle, ui)
  MiniGui.Events.bindSelectionChanged(app, combo, onSelection, ui)
  MiniGui.Events.bindSelectionChanged(app, list, onSelection, ui)
  MiniGui.Events.bindScrollChanged(app, scroll, onScroll, ui)
  MiniGui.Events.bindScrollChanged(app, slider, onScroll, ui)
  MiniGui.Events.bindValueChanged(app, valueSlider, onEventName, ui)
  MiniGui.Events.bindFocus(app, optIn, onEventName, ui)
  MiniGui.Events.bindBlur(app, optIn, onEventName, ui)
  if MiniGui.Events.dispatchCommand(app, 0, optIn.nativeId, optIn.handle) == false then return 7 end if
  if MiniGui.Control.getText(label) != "CheckBox:click" then return 8 end if
  if MiniGui.Events.dispatchCommand(app, 0, choice.nativeId, choice.handle) == false then return 9 end if
  if MiniGui.Control.getText(label) != "RadioButton:click" then return 10 end if
  MiniGui.Control.setSelectedIndex(combo, 1)
  combo.lastSelection = 2
  if MiniGui.Events.dispatchCommand(app, 1, combo.nativeId, combo.handle) == false then return 26 end if
  if MiniGui.Control.getText(label) != "ComboBox:US" then return 27 end if
  MiniGui.Control.setSelectedIndex(list, 0)
  list.lastSelection = -1
  if MiniGui.Events.dispatchCommand(app, 1, list.nativeId, list.handle) == false then return 28 end if
  if MiniGui.Control.getText(label) != "ListBox:Kiel" then return 29 end if
  if MiniGui.Events.dispatchScroll(app, 1, 0, scroll.handle) == false then return 37 end if
  if MiniGui.Control.getText(label) != "ScrollBar:25" then return 38 end if
  if MiniGui.Events.dispatchScroll(app, 1, 0, slider.handle) == false then return 45 end if
  if MiniGui.Control.getText(label) != "Slider:35" then return 46 end if
  if MiniGui.Events.dispatchScroll(app, 1, 0, valueSlider.handle) == false then return 62 end if
  if MiniGui.Control.getText(label) != "Slider:valueChanged:15" then return 63 end if
  if MiniGui.Events.dispatchFocusByHandle(app, optIn.handle, true) == false then return 64 end if
  if MiniGui.Control.getText(label) != "CheckBox:focus:true" then return 65 end if
  if MiniGui.Events.dispatchFocusByHandle(app, optIn.handle, false) == false then return 66 end if
  if MiniGui.Control.getText(label) != "CheckBox:blur:true" then return 67 end if
  return 0
end function
