// SPDX-License-Identifier: Apache-2.0
package advanced_controls
import MiniGuiLib.minigui as Gui

function onLoad(ui, event)
  Gui.RichTextBox.formatRange(ui.richText, 0, 7, "#3867d6", true, false)
  Gui.DrawingCanvas.fillRect(ui.drawing, 10, 10, 120, 55, "#3867d6")
  Gui.DrawingCanvas.line(ui.drawing, 10, 80, 230, 30, "#cc5544")
  Gui.DrawingCanvas.drawText(ui.drawing, 10, 105, "Retained drawing", "#202020")
  return 0
end function

function onTray(ui, event)
  if event.newValue == 1 then
    Gui.Window.close(ui.mainWindow)
  else
    Gui.Window.show(ui.mainWindow)
  end if
  return 0
end function

function onEditorChanged(ui, event)
  Gui.Control.setText(ui.status, "Editor: " + len(event.newValue) + " bytes")
  return 0
end function
