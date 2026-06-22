import MiniGuiLib.minigui as MiniGui
import "../../examples/control-gallery/app.ml" as Gallery

struct GalleryUi
  app,
  mainWindow,
  mainMenu,
  mainToolBar,
  titleLabel,
  galleryTabs,
  inputPanel,
  nameLabel,
  nameTextBox,
  birthDatePicker,
  notesTextArea,
  optionsGroupBox,
  consentCheckBox,
  radioEmail,
  radioPhone,
  selectionPanel,
  countryComboBox,
  cityListBox,
  layoutPanel,
  primaryButton,
  disabledButton,
  hiddenLabel,
  feedbackPanel,
  volumeLabel,
  volumeScrollBar,
  progressBar,
  dataPanel,
  navigationTree,
  customerTable,
  dataStatusLabel,
  statusLabel,
  resultLabel,
end struct

function main(args)
  app = MiniGui.Application.create()
  win = MiniGui.Window.create(app, "mainWindow", "Gallery Smoke", 880, 760)
  menu = MiniGui.MenuBar.create(app, win, "mainMenu", "", 0, 0, 400, 24, ["File", "Help"])
  toolbar = MiniGui.ToolBar.create(app, win, "mainToolBar", "", 0, 28, 400, 30, ["Save", "Refresh"])
  title = MiniGui.Label.create(app, win, "titleLabel", "Gallery", 0, 64, 300, 24)
  tabs = MiniGui.TabControl.create(app, win, "galleryTabs", "", 0, 96, 760, 500, ["Inputs", "Selection", "Layout", "Feedback", "Data"], 0)
  inputPanel = MiniGui.Panel.create(app, tabs, "inputPanel", "", 8, 36, 420, 120)
  nameLabel = MiniGui.Label.create(app, inputPanel, "nameLabel", "Name", 8, 8, 80, 24)
  nameBox = MiniGui.TextBox.create(app, inputPanel, "nameTextBox", "Ada", 96, 8, 180, 26)
  datePicker = MiniGui.DatePicker.create(app, inputPanel, "birthDatePicker", "", 286, 8, 130, 26)
  notes = MiniGui.TextArea.create(app, inputPanel, "notesTextArea", "Notes", 8, 42, 260, 60)
  group = MiniGui.GroupBox.create(app, tabs, "optionsGroupBox", "Options", 8, 164, 260, 100)
  consent = MiniGui.CheckBox.create(app, group, "consentCheckBox", "Enable", 12, 24, 200, 22, true)
  radioEmail = MiniGui.RadioButton.create(app, group, "radioEmail", "Email", 12, 54, 100, 22, true)
  radioPhone = MiniGui.RadioButton.create(app, group, "radioPhone", "Phone", 116, 54, 100, 22, false)
  selectionPanel = MiniGui.Panel.create(app, tabs, "selectionPanel", "", 280, 164, 420, 110)
  country = MiniGui.ComboBox.create(app, selectionPanel, "countryComboBox", "", 8, 8, 180, 120, ["Germany", "United States", "France"], 1)
  city = MiniGui.ListBox.create(app, selectionPanel, "cityListBox", "", 200, 8, 180, 80, ["Berlin", "Bonn", "Hamburg"], 2)
  layoutPanel = MiniGui.Panel.create(app, tabs, "layoutPanel", "", 8, 284, 420, 70)
  primary = MiniGui.Button.create(app, layoutPanel, "primaryButton", "Apply", 8, 8, 100, 30)
  disabled = MiniGui.Button.create(app, layoutPanel, "disabledButton", "Disabled", 116, 8, 120, 30)
  MiniGui.Control.setEnabled(disabled, false)
  hidden = MiniGui.Label.create(app, layoutPanel, "hiddenLabel", "", 244, 8, 160, 24)
  MiniGui.Control.setVisible(hidden, false)
  feedbackPanel = MiniGui.Panel.create(app, tabs, "feedbackPanel", "", 8, 364, 420, 90)
  volumeLabel = MiniGui.Label.create(app, feedbackPanel, "volumeLabel", "Volume: 25", 8, 8, 120, 24)
  slider = MiniGui.Slider.create(app, feedbackPanel, "volumeScrollBar", "", 140, 8, 180, 32, "horizontal", 0, 100, 25, 5, 20)
  progress = MiniGui.ProgressBar.create(app, feedbackPanel, "progressBar", "", 8, 48, 300, 24, 0, 100, 35)
  dataPanel = MiniGui.Panel.create(app, tabs, "dataPanel", "", 440, 284, 280, 170)
  tree = MiniGui.TreeView.create(app, dataPanel, "navigationTree", "", 8, 8, 120, 120, ["Customers"])
  table = MiniGui.ListView.create(app, dataPanel, "customerTable", "", 140, 8, 120, 120, ["Ada"], 0)
  dataStatus = MiniGui.Label.create(app, dataPanel, "dataStatusLabel", "", 8, 136, 260, 24)
  statusLabel = MiniGui.StatusBar.create(app, win, "statusLabel", "", 0, 610, 500, 24)
  resultLabel = MiniGui.Label.create(app, win, "resultLabel", "", 0, 640, 500, 24)
  ui = GalleryUi(app, win, menu, toolbar, title, tabs, inputPanel, nameLabel, nameBox, datePicker, notes, group, consent, radioEmail, radioPhone, selectionPanel, country, city, layoutPanel, primary, disabled, hidden, feedbackPanel, volumeLabel, slider, progress, dataPanel, tree, table, dataStatus, statusLabel, resultLabel)

  Gallery.onMainWindowLoad(ui, MiniGui.Event(win, "load", void, void, false))
  if MiniGui.Control.getText(statusLabel) != "Gallery ready" then return 1 end if
  if MiniGui.Control.getText(resultLabel) != "All controls loaded" then return 2 end if

  Gallery.onMainWindowResized(ui, MiniGui.Event(win, "resized", [880, 760], [900, 780], false))
  if MiniGui.Control.getText(statusLabel) != "Window resized" then return 3 end if

  Gallery.onActionClicked(ui, MiniGui.Event(toolbar, "click", false, true, false))
  if MiniGui.Control.getText(resultLabel) != "Action from mainToolBar" then return 4 end if

  Gallery.onTabSelected(ui, MiniGui.Event(tabs, "selected", 0, 1, false))
  if MiniGui.Control.getText(statusLabel) != "Tab selected: 1" then return 5 end if

  Gallery.onNameChanged(ui, MiniGui.Event(nameBox, "textChanged", "Ada", "Grace", false))
  if MiniGui.Control.getText(statusLabel) != "Name: Grace" then return 6 end if

  Gallery.onDateChanged(ui, MiniGui.Event(datePicker, "changed", "", "", false))
  if MiniGui.Control.getText(statusLabel) != "Date changed" then return 7 end if

  Gallery.onNotesChanged(ui, MiniGui.Event(notes, "change", "old", "new", false))
  if MiniGui.Control.getText(statusLabel) != "Notes changed" then return 8 end if

  Gallery.onConsentClicked(ui, MiniGui.Event(consent, "click", false, true, false))
  if MiniGui.Control.getText(resultLabel) != "Advanced actions enabled" then return 9 end if
  MiniGui.Control.setChecked(consent, false)
  Gallery.onConsentClicked(ui, MiniGui.Event(consent, "click", true, false, false))
  if MiniGui.Control.getText(resultLabel) != "Advanced actions disabled" then return 10 end if

  Gallery.onModeClicked(ui, MiniGui.Event(radioPhone, "click", false, true, false))
  if MiniGui.Control.getText(resultLabel) != "Mode: radioPhone" then return 11 end if

  Gallery.onCountrySelected(ui, MiniGui.Event(country, "selectionChanged", 0, "United States", false))
  if MiniGui.Control.getText(resultLabel) != "Country: United States" then return 12 end if
  if MiniGui.Control.getSelectedText(city) != "New York" then return 31 end if

  Gallery.onCitySelected(ui, MiniGui.Event(city, "change", 1, "New York", false))
  if MiniGui.Control.getText(resultLabel) != "City: New York" then return 13 end if

  Gallery.onPrimaryButtonClick(ui, MiniGui.Event(primary, "click", false, true, false))
  if MiniGui.Control.getText(resultLabel) != "Applied for Ada" then return 14 end if
  if disabled.enabled == false then return 15 end if
  if hidden.visible == false then return 16 end if

  Gallery.onDisabledButtonClick(ui, MiniGui.Event(disabled, "click", false, true, false))
  if MiniGui.Control.getText(resultLabel) != "Secondary action" then return 17 end if

  Gallery.onVolumeScrolled(ui, MiniGui.Event(slider, "valueChanged", 25, 45, false))
  if MiniGui.Control.getText(volumeLabel) != "Volume: 45" then return 18 end if
  if MiniGui.Control.getText(statusLabel) != "Scroll value changed" then return 19 end if
  if MiniGui.Control.getValue(progress) != 45 then return 20 end if

  Gallery.onProgressChanged(ui, MiniGui.Event(progress, "valueChanged", 35, 45, false))
  if MiniGui.Control.getText(statusLabel) != "Progress value changed" then return 21 end if

  Gallery.onTreeSelected(ui, MiniGui.Event(tree, "selected", 0, 1, false))
  if MiniGui.Control.getText(resultLabel) != "Tree selected" then return 22 end if
  if MiniGui.Control.getText(dataStatus) != "Tree selected" then return 32 end if

  Gallery.onTableSelected(ui, MiniGui.Event(table, "selected", 0, 1, false))
  if MiniGui.Control.getText(resultLabel) != "Table selected" then return 23 end if
  if MiniGui.Control.getText(dataStatus) != "Table selected" then return 33 end if

  Gallery.onDataScrolled(ui, MiniGui.Event(dataPanel, "scrollChanged", 0, 15, false))
  if MiniGui.Control.getText(dataStatus) != "Scroll position: 15" then return 34 end if
  if MiniGui.Control.getText(statusLabel) != "Data scrolled" then return 35 end if

  return 0
end function
