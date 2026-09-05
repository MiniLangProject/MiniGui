// SPDX-License-Identifier: Apache-2.0
import MiniGuiLib.minigui as Gui
import std.time as time

function main(args)
  app = Gui.Application.create()
  if typeof(app) == "error" then print app.message; return 1 end if
  window = Gui.Window.create(app, "main", "MiniGui cross-platform smoke", 800, 640)
  rich = Gui.RichTextBox.create(app, window, "rich", "Grüße 🚀", 10, 10, 300, 90)
  if Gui.Control.getText(rich) != "Grüße 🚀" then return 2 end if
  Gui.Control.setText(rich, "Hello MiniGui")
  if Gui.Control.getText(rich) != "Hello MiniGui" then return 3 end if
  if Gui.RichTextBox.formatRange(rich, 0, 5, "#cc0000", true, false) == 0 then return 4 end if
  editor = Gui.CodeEditor.create(app, window, "editor", "print 42", 10, 110, 300, 100)
  Gui.CodeEditor.setLanguage(editor, "python")
  Gui.Control.setReadOnly(editor, true)
  grid = Gui.PropertyGrid.create(app, window, "properties", "", 10, 220, 300, 100, [["Name", "Ada"], ["Age", "36"]])
  if Gui.PropertyGrid.getValue(grid, 0) != "Ada" then return 5 end if
  Gui.PropertyGrid.setValue(grid, 0, "Grace")
  if Gui.PropertyGrid.getValue(grid, 0) != "Grace" then return 6 end if
  dialog = Gui.Dialog.createInput(app, "input-dialog", "Input", "Name", "Ada", 420)
  Gui.Dialog.setValue(dialog, "Grace")
  if Gui.Dialog.getValue(dialog) != "Grace" then return 8 end if
  Gui.Dialog.close(dialog, "ok")
  if Gui.Dialog.getResult(dialog) != "ok" then return 9 end if
  canvas = Gui.DrawingCanvas.create(app, window, "canvas", "", 330, 10, 220, 120)
  Gui.DrawingCanvas.fillRect(canvas, 0, 0, 100, 80, "#336699")
  Gui.DrawingCanvas.line(canvas, 0, 0, 200, 100, "#ffffff")
  Gui.DrawingCanvas.drawText(canvas, 10, 100, "Canvas", "#000000")
  chart = Gui.Chart.create(app, window, "chart", "", 330, 140, 220, 150)
  Gui.Chart.setValues(chart, [10, 30, 20, 50], "bar", "#3867d6")
  browser = Gui.WebView.create(app, window, "browser", "", 10, 340, 740, 250)
  Gui.WebView.loadHtml(browser, "<!doctype html><html><body><h1>MiniGui</h1><p>Embedded browser test.</p></body></html>")
  tray = Gui.TrayIcon.create(app, window, "tray", "MiniGui test", 0, 0, 1, 1)
  Gui.TrayIcon.setItems(tray, ["Show", "Exit"])
  Gui.Window.show(window)
  ready = false
  for i = 0 to 499
    for j = 0 to 9
      Gui.Application.pump(app, false)
    end for
    if Gui.WebView.getStatus(browser) == 1 then ready = true; break end if
    time.sleep(20)
  end for
  Gui.Application.dispose(app)
  if ready == false then print "Embedded browser did not become ready"; return 7 end if
  print "PASS: rich text, editor, property grid, canvas, chart, tray, embedded browser"
  return 0
end function
