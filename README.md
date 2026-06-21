# MiniGui

MiniGui ist eine GUI-Library fuer MiniLang, mit der sich einfache Desktop-GUIs
schnell bauen lassen. Die Oberflaeche wird deklarativ in `.mson` beschrieben,
die Logik bleibt in normalem MiniLang-Code. MiniGui erzeugt daraus MiniLang-Code,
bindet die Event-Handler aus deiner Code-behind-Datei ein und kompiliert daraus
eine native Windows-Anwendung.

Kurz gesagt:

- `.mson` beschreibt Fenster, Layouts, Controls, Attribute und Events.
- `.ml` enthaelt die Anwendungslogik.
- `tools/minigui.ml` ist das MiniGui-CLI.
- `MiniGuiLib/minigui.ml` ist die Runtime-Library fuer native Win32-Controls.

## Projektaufbau

MiniGui ist ein eigenes Projekt und liegt parallel zum MiniLang-Compiler:

```text
MiniGui/
  MiniGui/
    MiniGuiLib/
    tools/
    examples/
    schemas/
    tests/
  MiniLangCompilerPy/
    mlc_win64.py
  MiniLangCompilerML/
    build/mlc_win64.exe
```

Der Python-Compiler ist fuer MiniGui aktuell die schnellere Wahl.

## Schnellstart

MiniGui selbst ist in MiniLang geschrieben. Baue zuerst das CLI mit dem
Python-Compiler:

```powershell
cd C:\Users\nilsk\Desktop\MiniGui\MiniGui
py -3.14 ..\MiniLangCompilerPy\mlc_win64.py .\tools\minigui.ml .\tools\minigui.exe -I . -I ..\MiniLangCompilerPy
```

Danach kannst du eine GUI validieren, Code generieren oder direkt bauen:

```powershell
.\tools\minigui.exe validate .\examples\hello-gui\app.mson
.\tools\minigui.exe generate .\examples\hello-gui\app.mson --output .\examples\hello-gui\build\app.gui.ml
.\tools\minigui.exe build .\examples\hello-gui\app.mson --output .\examples\hello-gui\build\hello-gui.exe --compiler ..\MiniLangCompilerPy\mlc_win64.py
```

Die fertige Anwendung startest du wie jedes andere Windows-Programm:

```powershell
.\examples\hello-gui\build\hello-gui.exe
```

## CLI

```powershell
.\tools\minigui.exe validate <app.mson>
.\tools\minigui.exe generate <app.mson> --output <generated.gui.ml>
.\tools\minigui.exe build <app.mson> --output <app.exe>
```

Wichtige Optionen:

- `--compiler <path>` waehlt den MiniLang-Compiler.
- `--output <file>` setzt Ausgabe-Datei fuer generierten Code oder `.exe`.
- `--code-behind <file>` ueberschreibt `codeBehind` aus der `.mson`.
- `--generated-dir <dir>` setzt das Zielverzeichnis fuer generierte Dateien.
- `--include-dir <dir>` fuegt Suchpfade fuer MSON-Imports hinzu.
- `--no-compile` erzeugt nur `.gui.ml`, ohne daraus eine `.exe` zu bauen.
- `--keep-generated` behaelt generierte Dateien beim Build.

## Eine minimale Anwendung

`app.mson`:

```json
{
  "$schema": "../../schemas/minigui.schema.json",
  "version": 1,
  "namespace": "hello_gui",
  "codeBehind": "app.ml",
  "application": {
    "name": "HelloGui",
    "startupWindow": "mainWindow"
  },
  "windows": [
    {
      "id": "mainWindow",
      "type": "Window",
      "properties": {
        "title": "MiniGui Hello",
        "width": 480,
        "height": 220,
        "startPosition": "centerScreen"
      },
      "layout": {
        "type": "VerticalStack",
        "properties": { "padding": 14, "spacing": 8 },
        "children": [
          {
            "id": "headlineLabel",
            "type": "Label",
            "properties": { "text": "Willkommen bei MiniGui" }
          },
          {
            "id": "nameTextBox",
            "type": "TextBox",
            "properties": { "text": "" },
            "events": { "textChanged": "onNameChanged" }
          },
          {
            "id": "greetButton",
            "type": "Button",
            "properties": { "text": "Begruessen" },
            "events": { "click": "onGreetButtonClick" }
          },
          {
            "id": "resultLabel",
            "type": "Label",
            "properties": { "text": "" }
          }
        ]
      }
    }
  ]
}
```

`app.ml`:

```minilang
package hello_gui

import MiniGuiLib.minigui as MiniGui

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
```

Der Generator erzeugt fuer jedes Control mit `id` ein Feld im `ui`-Objekt. Im
Beispiel sind das `ui.nameTextBox`, `ui.greetButton` und `ui.resultLabel`.

## MSON-Grundstruktur

Eine MiniGui-Datei ist JSON mit der Endung `.mson`.

```json
{
  "version": 1,
  "namespace": "my_app",
  "codeBehind": "app.ml",
  "resources": {},
  "imports": [],
  "application": {
    "name": "MyApp",
    "startupWindow": "mainWindow"
  },
  "windows": [],
  "components": []
}
```

Pflichtfelder:

- `version`: aktuell immer `1`.
- `namespace`: MiniLang-Package der generierten Anwendung.
- `application.name`: Anzeigename der Anwendung.
- `application.startupWindow`: `id` des Startfensters.
- `windows`: Liste der Fenster.

Optionale Felder:

- `codeBehind`: MiniLang-Datei mit Event-Handlern.
- `resources`: wiederverwendbare Werte.
- `imports`: weitere `.mson`-Dateien.
- `components`: eigene wiederverwendbare UI-Bausteine.

## Layouts

Layouts gruppieren und positionieren Controls.

### VerticalStack

Ordnet Kinder von oben nach unten an.

```json
{
  "type": "VerticalStack",
  "properties": { "padding": 12, "spacing": 8 },
  "children": [
    { "id": "titleLabel", "type": "Label", "properties": { "text": "Titel" } },
    { "id": "saveButton", "type": "Button", "properties": { "text": "Speichern" } }
  ]
}
```

### HorizontalStack

Ordnet Kinder von links nach rechts an.

```json
{
  "type": "HorizontalStack",
  "properties": { "spacing": 8 },
  "children": [
    { "id": "firstName", "type": "TextBox", "properties": { "width": "fill", "minWidth": 160 } },
    { "id": "lastName", "type": "TextBox", "properties": { "width": "fill", "minWidth": 160 } }
  ]
}
```

### Grid

Verteilt Kinder in Spalten. `columns` gibt die Spaltenanzahl an.

```json
{
  "type": "Grid",
  "properties": { "columns": 2, "spacing": 8 },
  "children": [
    { "id": "countryComboBox", "type": "ComboBox", "properties": { "items": ["DE", "US"] } },
    { "id": "cityListBox", "type": "ListBox", "properties": { "items": ["Berlin", "Bonn"] } }
  ]
}
```

### Canvas

Erlaubt feste Positionierung mit `x` und `y`.

```json
{
  "type": "Canvas",
  "children": [
    { "id": "okButton", "type": "Button", "properties": { "text": "OK", "x": 20, "y": 20, "width": 100 } }
  ]
}
```

## Gemeinsame Attribute

Diese Properties koennen bei Controls genutzt werden:

- `text`: sichtbarer Text.
- `width`, `height`: Zahl, `"auto"` oder `"fill"`.
- `x`, `y`: Position im `Canvas`.
- `visible`: `true` oder `false`.
- `enabled`: `true` oder `false`.
- `margin`: reserviert fuer Layout-Abstaende.
- `horizontalAlignment`: `"left"`, `"center"`, `"right"`, `"fill"` oder `"stretch"`.
- `verticalAlignment`: `"top"`, `"center"`, `"bottom"`, `"fill"` oder `"stretch"`.
- `alignment`: Kurzform fuer horizontales Alignment.
- `dock`: aktuell besonders nuetzlich mit `"fill"`.
- `fill`: `true` setzt die Breite auf den verfuegbaren Platz.
- `minWidth`, `minHeight`, `maxWidth`, `maxHeight`: Groessenbegrenzungen.
- `tooltip`: Text fuer Tooltips.
- `tabIndex`: Reihenfolge fuer Tastatur-Navigation.

Beispiel:

```json
{
  "id": "nameTextBox",
  "type": "TextBox",
  "properties": {
    "text": "Ada",
    "width": "fill",
    "minWidth": 220,
    "enabled": true,
    "visible": true,
    "tooltip": "Name eingeben",
    "tabIndex": 1
  }
}
```

## Controls

MiniGui unterstuetzt aktuell diese Controls:

| Control | Zweck | Wichtige Properties | Events |
| --- | --- | --- | --- |
| `Label` | Text anzeigen | `text` | - |
| `Button` | Aktion ausloesen | `text` | `click`, `clicked` |
| `TextBox` | einzeilige Eingabe | `text`, `placeholder` | `textChanged`, `changed`, `change` |
| `TextArea` | mehrzeilige Eingabe | `text`, `placeholder` | `textChanged`, `changed`, `change` |
| `CheckBox` | Ja/Nein-Auswahl | `text`, `checked` | `click`, `clicked` |
| `RadioButton` | Auswahl innerhalb einer Gruppe | `text`, `checked` | `click`, `clicked` |
| `Panel` | Container ohne Rahmen | `padding`, `spacing`, `children` | - |
| `GroupBox` | Container mit Beschriftung | `text`, `padding`, `spacing`, `children` | - |
| `ComboBox` | Dropdown-Auswahl | `items`, `selectedIndex` | `selectionChanged`, `selected`, `changed`, `change` |
| `ListBox` | Listen-Auswahl | `items`, `selectedIndex` | `selectionChanged`, `selected`, `changed`, `change` |
| `ScrollBar` | Scroll-/Wertsteuerung | `orientation`, `minimum`, `maximum`, `value`, `smallStep`, `largeStep` | `scrollChanged`, `valueChanged`, `changed`, `change` |
| `Slider` | Trackbar fuer Werte | `orientation`, `minimum`, `maximum`, `value`, `smallStep`, `largeStep` | `scrollChanged`, `valueChanged`, `changed`, `change` |
| `ProgressBar` | Fortschritt anzeigen | `minimum`, `maximum`, `value` | `scrollChanged`, `valueChanged`, `changed`, `change` |
| `TabControl` | Reiter-Oberflaeche | `items`, `selectedIndex`, `children` | `selectionChanged`, `selected`, `changed`, `change` |
| `MenuBar` | Menueleiste | `items` | `click`, `clicked` |
| `ToolBar` | Werkzeugleiste | `items` | `click`, `clicked` |
| `StatusBar` | Statuszeile | `text` | - |
| `TreeView` | Baumansicht | `items` | `selectionChanged`, `selected`, `changed`, `change` |
| `ListView` | Listen-/Reportansicht | `items`, `selectedIndex` | `selectionChanged`, `selected`, `changed`, `change` |
| `Table` | Tabellenartige Liste, aktuell ueber `ListView` | `items`, `selectedIndex` | `selectionChanged`, `selected`, `changed`, `change` |
| `DatePicker` | Datumsauswahl | `text` | `textChanged`, `changed`, `change` |

## Control-Beispiele

### Button

```json
{
  "id": "saveButton",
  "type": "Button",
  "properties": { "text": "Speichern", "width": 120, "height": 30 },
  "events": { "click": "onSaveClick" }
}
```

```minilang
function onSaveClick(ui, event)
  MiniGui.Control.setText(ui.statusBar, "Gespeichert")
  return 0
end function
```

### TextBox und TextArea

```json
{
  "id": "notesTextArea",
  "type": "TextArea",
  "properties": {
    "text": "Notizen",
    "height": 80,
    "width": "fill",
    "placeholder": "Notizen eingeben"
  },
  "events": { "change": "onNotesChanged" }
}
```

```minilang
function onNotesChanged(ui, event)
  MiniGui.Control.setText(ui.statusBar, "Text geaendert: " + event.newValue)
  return 0
end function
```

### CheckBox und RadioButton

```json
{
  "id": "advancedCheckBox",
  "type": "CheckBox",
  "properties": { "text": "Erweiterte Optionen", "checked": true },
  "events": { "click": "onAdvancedClicked" }
}
```

```minilang
function onAdvancedClicked(ui, event)
  enabled = MiniGui.Control.isChecked(ui.advancedCheckBox)
  MiniGui.Control.setEnabled(ui.detailsPanel, enabled)
  return 0
end function
```

### ComboBox und ListBox

```json
{
  "id": "countryComboBox",
  "type": "ComboBox",
  "properties": {
    "items": ["Germany", "United States", "France"],
    "selectedIndex": 0,
    "width": "fill"
  },
  "events": { "selected": "onCountrySelected" }
}
```

```minilang
function onCountrySelected(ui, event)
  selected = MiniGui.Control.getSelectedText(ui.countryComboBox)
  MiniGui.Control.setText(ui.resultLabel, "Land: " + selected)
  return 0
end function
```

### Slider, ScrollBar und ProgressBar

```json
{
  "id": "volumeSlider",
  "type": "Slider",
  "properties": {
    "orientation": "horizontal",
    "minimum": 0,
    "maximum": 100,
    "value": 25,
    "smallStep": 5,
    "largeStep": 20,
    "width": "fill",
    "height": 32
  },
  "events": { "valueChanged": "onVolumeChanged" }
}
```

```minilang
function onVolumeChanged(ui, event)
  MiniGui.Control.setText(ui.volumeLabel, "Volume: " + event.newValue)
  MiniGui.Control.setValue(ui.progressBar, event.newValue)
  return 0
end function
```

### Panel und GroupBox

```json
{
  "id": "customerGroup",
  "type": "GroupBox",
  "properties": {
    "text": "Kunde",
    "height": 120,
    "width": "fill",
    "padding": 10,
    "spacing": 8
  },
  "children": [
    { "id": "nameTextBox", "type": "TextBox", "properties": { "width": "fill" } },
    { "id": "emailTextBox", "type": "TextBox", "properties": { "width": "fill" } }
  ]
}
```

### TabControl

```json
{
  "id": "tabs",
  "type": "TabControl",
  "properties": {
    "items": ["Eingabe", "Daten"],
    "selectedIndex": 0,
    "height": 220,
    "width": "fill"
  },
  "events": { "selected": "onTabSelected" },
  "children": [
    { "id": "inputPanel", "type": "Panel", "properties": { "height": 80 } },
    { "id": "dataPanel", "type": "Panel", "properties": { "height": 80 } }
  ]
}
```

### ToolBar, MenuBar und StatusBar

```json
{
  "id": "mainToolBar",
  "type": "ToolBar",
  "properties": {
    "items": ["New", "Open", "Save", "Refresh"],
    "height": 30,
    "width": "fill"
  },
  "events": { "click": "onToolbarClick" }
}
```

```json
{
  "id": "statusBar",
  "type": "StatusBar",
  "properties": { "text": "Ready", "height": 24, "width": "fill" }
}
```

### TreeView, ListView, Table und DatePicker

```json
{
  "type": "Grid",
  "properties": { "columns": 2, "spacing": 8 },
  "children": [
    {
      "id": "navigationTree",
      "type": "TreeView",
      "properties": { "items": ["Customers", "Orders", "Reports"], "height": 120 },
      "events": { "selected": "onTreeSelected" }
    },
    {
      "id": "customerTable",
      "type": "Table",
      "properties": {
        "items": ["Ada Lovelace", "Grace Hopper", "Margaret Hamilton"],
        "selectedIndex": 0,
        "height": 120
      },
      "events": { "selected": "onTableSelected" }
    }
  ]
}
```

```json
{
  "id": "birthDatePicker",
  "type": "DatePicker",
  "properties": { "width": 150 },
  "events": { "changed": "onDateChanged" }
}
```

## Events und Code-behind

Event-Handler stehen in der Code-behind-Datei und muessen genau zwei Parameter
haben:

```minilang
function onSomething(ui, event)
  return 0
end function
```

`ui` ist der generierte Zugriff auf Fenster und Controls. `event` enthaelt:

- `sender`: Control, das das Event ausgeloest hat.
- `eventType`: Name des Events.
- `oldValue`: vorheriger Wert, falls vorhanden.
- `newValue`: neuer Wert, falls vorhanden.
- `cancel`: kann bei `close` auf `true` gesetzt werden.

Fenster-Events:

- `load`
- `close`
- `resized`

Beispiel fuer `close`:

```json
{
  "id": "mainWindow",
  "type": "Window",
  "events": { "close": "onMainWindowClose" },
  "layout": { "type": "VerticalStack", "children": [] }
}
```

```minilang
function onMainWindowClose(ui, event)
  if MiniGui.Control.getText(ui.nameTextBox) == "" then
    event.cancel = true
    MiniGui.Control.setText(ui.statusBar, "Bitte zuerst einen Namen eingeben.")
  end if
  return 0
end function
```

## Runtime-API

Die wichtigsten Funktionen aus `MiniGui.Control`:

```minilang
MiniGui.Control.setText(control, "Text")
text = MiniGui.Control.getText(control)

MiniGui.Control.setEnabled(control, true)
MiniGui.Control.setVisible(control, false)

MiniGui.Control.setBounds(control, 20, 20, 200, 30)
MiniGui.Control.setPosition(control, 20, 20)
MiniGui.Control.setSize(control, 200, 30)

checked = MiniGui.Control.isChecked(control)
MiniGui.Control.setChecked(control, true)

MiniGui.Control.addItem(control, "Eintrag")
MiniGui.Control.setItems(control, ["A", "B", "C"])
MiniGui.Control.clearItems(control)
index = MiniGui.Control.getSelectedIndex(control)
MiniGui.Control.setSelectedIndex(control, 1)
text = MiniGui.Control.getSelectedText(control)

MiniGui.Control.setScrollRange(control, 0, 100)
MiniGui.Control.setScrollSteps(control, 5, 20)
MiniGui.Control.setScrollValue(control, 50)
value = MiniGui.Control.getScrollValue(control)

MiniGui.Control.setValueRange(control, 0, 100)
MiniGui.Control.setValue(control, 35)
value = MiniGui.Control.getValue(control)
```

`setValue` und `getValue` sind praktisch fuer `Slider`, `ScrollBar` und
`ProgressBar`. Fuer `ComboBox` und `ListBox` nutzt du die Selection-Funktionen.

## Ressourcen

Ressourcen sind einfache Werte, die beim Generieren ersetzt werden.

```json
{
  "resources": {
    "windowTitle": "MiniGui Control Gallery",
    "heading": "MiniGui controls and attributes"
  },
  "windows": [
    {
      "id": "mainWindow",
      "type": "Window",
      "properties": {
        "title": { "$resource": "windowTitle" }
      },
      "layout": {
        "type": "VerticalStack",
        "children": [
          {
            "id": "titleLabel",
            "type": "Label",
            "properties": { "text": { "$resource": "heading" } }
          }
        ]
      }
    }
  ]
}
```

## Imports und Komponenten

`imports` laedt weitere `.mson`-Dateien relativ zur importierenden Datei oder
aus den `--include-dir`-Suchpfaden.

```json
{
  "imports": ["resources/common.mson", "components/address-form.mson"]
}
```

Komponenten sind wiederverwendbare UI-Bausteine:

```json
{
  "components": [
    {
      "name": "AddressForm",
      "content": {
        "type": "VerticalStack",
        "properties": { "spacing": 8 },
        "children": [
          { "id": "streetTextBox", "type": "TextBox", "properties": { "width": "fill" } },
          { "id": "cityTextBox", "type": "TextBox", "properties": { "width": "fill" } }
        ]
      }
    }
  ]
}
```

Verwendung:

```json
{
  "id": "shippingAddress",
  "type": "AddressForm"
}
```

Wenn eine Komponente mehrfach verwendet wird, praefixt MiniGui interne IDs mit
der Instanz-ID.

## Beispiele im Repository

- `examples/hello-gui`: kleine Anwendung mit TextBox, Button, Label und Events.
- `examples/control-gallery`: Test- und Demo-Anwendung fuer alle Controls,
  Attribute, Layouts und Event-Pfade.
- `examples/customer-form`: Beispiel fuer Imports, Ressourcen und Komponenten.

Control Gallery bauen:

```powershell
.\examples\control-gallery\build.ps1
```

## Tests

Die MiniGui-Tests bauen das CLI, validieren die Beispielanwendungen, pruefen
generierten Code, starten GUI-Smoke-Tests und testen Interaktionen wie Button,
Slider und Resize-Verhalten.

```powershell
.\tests\minigui\run_minigui_tests.ps1
```

## Compiler-Anforderungen

MiniGui nutzt native Interop-Funktionen des MiniLang-Compilers:

- `nativeCallback(fn, "wndproc")`
- `nativeBytesPtr(bytes)`
- `nativeRawValue(value)`
- `nativeValueFromRaw(int)`

Diese Funktionen werden von `MiniGuiLib` fuer Win32-Fenster, Window-Procedures,
native Handles und Callback-Bruecken verwendet.

## MiniGui erweitern

Um ein neues Control hinzuzufuegen:

1. Control-Metadaten und Validierung in `tools/minigui.ml` erweitern.
2. Runtime-Konstruktor in `MiniGuiLib/minigui.ml` implementieren.
3. Schema in `schemas/minigui.schema.json` ergaenzen.
4. Control Gallery und Tests erweitern.

Die oeffentliche MSON-Struktur sollte stabil bleiben: Anwendungen beschreiben
weiterhin deklarativ die UI, waehrend die Runtime die nativen Details kapselt.
