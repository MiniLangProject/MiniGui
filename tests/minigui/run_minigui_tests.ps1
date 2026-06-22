Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$Here = Split-Path -Parent $PSCommandPath
$Root = [System.IO.Path]::GetFullPath((Join-Path $Here "..\.."))
$CompilerRoot = [System.IO.Path]::GetFullPath((Join-Path $Root "..\MiniLangCompilerPy"))
$Compiler = Join-Path $CompilerRoot "mlc_win64.py"
$ToolSource = Join-Path $Root "tools\minigui.ml"
$Tool = Join-Path $Root "tools\minigui.exe"
$Tmp = Join-Path $Root "tests\tmp\minigui"

function Write-Utf8NoBom {
  param([string]$Path, [string]$Text)
  New-Item -ItemType Directory -Force -Path (Split-Path -Parent $Path) | Out-Null
  $enc = New-Object System.Text.UTF8Encoding($false)
  [System.IO.File]::WriteAllText($Path, $Text, $enc)
}

function Invoke-Capture {
  param([string]$File, [string[]]$Arguments)
  $out = & $File @Arguments 2>&1
  $code = 0
  if (-not $?) {
    $code = 1
  }
  if (Test-Path Variable:\LASTEXITCODE) {
    if ($LASTEXITCODE -ne $null -and $LASTEXITCODE -ne 0) {
      $code = $LASTEXITCODE
    }
  }
  return [pscustomobject]@{ ExitCode = $code; Output = ($out -join "`n") }
}

function Invoke-Compiler {
  param([string[]]$Arguments)
  if ($Compiler -like "*.py") {
    return Invoke-Capture "py" (@("-3.14", $Compiler) + $Arguments)
  }
  return Invoke-Capture $Compiler $Arguments
}

function Assert-Ok {
  param($Result, [string]$Name)
  if ($Result.ExitCode -ne 0) {
    throw "$Name failed with exit $($Result.ExitCode):`n$($Result.Output)"
  }
  Write-Host "OK: $Name"
}

function Assert-FailsLike {
  param($Result, [string]$Name, [string]$Pattern)
  if ($Result.ExitCode -eq 0) {
    throw "$Name unexpectedly succeeded."
  }
  if ($Result.Output -notmatch $Pattern) {
    throw "$Name failed, but output did not match '$Pattern':`n$($Result.Output)"
  }
  Write-Host "OK: $Name"
}

function Assert-FileContains {
  param([string]$Path, [string]$Name, [string]$Pattern)
  $text = Get-Content -LiteralPath $Path -Raw
  if ($text -notmatch $Pattern) {
    throw "$Name did not contain pattern '$Pattern'."
  }
  Write-Host "OK: $Name"
}

Add-Type @"
using System;
using System.Text;
using System.Runtime.InteropServices;

public class MiniGuiTestWin32 {
  public delegate bool EnumWindowsProc(IntPtr hWnd, IntPtr lParam);

  [DllImport("user32.dll")]
  public static extern bool EnumChildWindows(IntPtr hWnd, EnumWindowsProc proc, IntPtr lParam);

  [DllImport("user32.dll", CharSet=CharSet.Unicode)]
  public static extern int GetClassNameW(IntPtr hWnd, StringBuilder text, int count);

  [DllImport("user32.dll", CharSet=CharSet.Unicode)]
  public static extern int GetWindowTextW(IntPtr hWnd, StringBuilder text, int count);

  [DllImport("user32.dll")]
  public static extern bool GetWindowRect(IntPtr hWnd, out RECT rect);

  [DllImport("user32.dll")]
  public static extern bool MoveWindow(IntPtr hWnd, int x, int y, int width, int height, bool repaint);

  [DllImport("user32.dll")]
  public static extern int GetDlgCtrlID(IntPtr hWnd);

  [DllImport("user32.dll")]
  public static extern bool IsWindowVisible(IntPtr hWnd);

  [DllImport("user32.dll")]
  public static extern IntPtr GetParent(IntPtr hWnd);

  [DllImport("user32.dll")]
  public static extern IntPtr SendMessageW(IntPtr hWnd, uint msg, IntPtr wParam, IntPtr lParam);

  public struct RECT {
    public int Left;
    public int Top;
    public int Right;
    public int Bottom;
  }
}
"@

function Get-ChildWindowCount {
  param([IntPtr]$WindowHandle)

  $script:miniGuiChildWindowCount = 0
  [MiniGuiTestWin32]::EnumChildWindows($WindowHandle, [MiniGuiTestWin32+EnumWindowsProc]{
    param($ChildHandle, $LParam)
    $script:miniGuiChildWindowCount += 1
    return $true
  }, [IntPtr]::Zero) | Out-Null

  return $script:miniGuiChildWindowCount
}

function Get-ChildWindows {
  param([IntPtr]$WindowHandle)

  $script:miniGuiChildWindows = New-Object System.Collections.Generic.List[object]
  [MiniGuiTestWin32]::EnumChildWindows($WindowHandle, [MiniGuiTestWin32+EnumWindowsProc]{
    param($ChildHandle, $LParam)
    $className = New-Object System.Text.StringBuilder 128
    $text = New-Object System.Text.StringBuilder 256
    $rect = New-Object MiniGuiTestWin32+RECT
    [MiniGuiTestWin32]::GetClassNameW($ChildHandle, $className, $className.Capacity) | Out-Null
    [MiniGuiTestWin32]::GetWindowTextW($ChildHandle, $text, $text.Capacity) | Out-Null
    [MiniGuiTestWin32]::GetWindowRect($ChildHandle, [ref]$rect) | Out-Null
    $script:miniGuiChildWindows.Add([pscustomobject]@{
      Handle = $ChildHandle
      Class = $className.ToString()
      Text = $text.ToString()
      Rect = $rect
      Id = [MiniGuiTestWin32]::GetDlgCtrlID($ChildHandle)
      Visible = [MiniGuiTestWin32]::IsWindowVisible($ChildHandle)
      Parent = [MiniGuiTestWin32]::GetParent($ChildHandle)
    })
    return $true
  }, [IntPtr]::Zero) | Out-Null

  return $script:miniGuiChildWindows
}

function Get-StaticTextSnapshot {
  param([IntPtr]$WindowHandle)
  return ((Get-ChildWindows $WindowHandle | Where-Object { $_.Visible -and ($_.Class -eq "Static" -or $_.Class -eq "Button") } | ForEach-Object { $_.Text }) -join " | ")
}

function Assert-GuiStarts {
  param([string]$Exe, [string]$Name, [int]$MinChildren)

  $process = Start-Process -FilePath $Exe -PassThru
  try {
    $deadline = [DateTime]::UtcNow.AddSeconds(4)
    $lastChildCount = 0
    while ([DateTime]::UtcNow -lt $deadline) {
      Start-Sleep -Milliseconds 100
      $process.Refresh()
      if ($process.HasExited) {
        throw "$Name exited early with code $($process.ExitCode)."
      }

      if ($process.MainWindowHandle -ne [IntPtr]::Zero) {
        $lastChildCount = Get-ChildWindowCount $process.MainWindowHandle
        if ($lastChildCount -ge $MinChildren) {
          Write-Host "OK: $Name"
          return
        }
      }
    }

    throw "$Name did not create enough child controls. Expected at least $MinChildren, got $lastChildCount."
  } finally {
    if ($process -and -not $process.HasExited) {
      Stop-Process -Id $process.Id -Force
    }
  }
}

function Assert-ControlGalleryInteractions {
  param([string]$Exe)

  function Send-TabClick {
    param($TabControl, [int]$Index)
    $x = 24 + ($Index * 170)
    $y = 12
    $lParam = [IntPtr](($y -shl 16) -bor $x)
    [MiniGuiTestWin32]::SendMessageW($TabControl.Handle, 513, [IntPtr]1, $lParam) | Out-Null
    [MiniGuiTestWin32]::SendMessageW($TabControl.Handle, 514, [IntPtr]::Zero, $lParam) | Out-Null
  }

  $process = Start-Process -FilePath $Exe -PassThru
  try {
    Start-Sleep -Milliseconds 1200
    $process.Refresh()
    if ($process.HasExited) {
      throw "control-gallery interaction test exited early with code $($process.ExitCode)."
    }
    if ($process.MainWindowHandle -eq [IntPtr]::Zero) {
      throw "control-gallery interaction test did not create a main window."
    }

    $children = Get-ChildWindows $process.MainWindowHandle
    $menuBar = $children | Where-Object { $_.Class -eq "Static" -and $_.Text -eq "  File    Edit    View    Help" } | Select-Object -First 1
    if (-not $menuBar) { throw "control-gallery interaction test did not find MenuBar." }
    $toolBar = $children | Where-Object { $_.Class -eq "Static" -and $_.Text -eq "  New  |  Open  |  Save  |  Refresh" } | Select-Object -First 1
    if (-not $toolBar) { throw "control-gallery interaction test did not find ToolBar." }
    $tabs = $children | Where-Object { $_.Class -eq "SysTabControl32" } | Select-Object -First 1
    if (-not $tabs) { throw "control-gallery interaction test did not find TabControl." }
    foreach ($requiredClass in @("msctls_progress32", "SysTabControl32", "SysTreeView32", "SysListView32", "SysDateTimePick32", "msctls_statusbar32")) {
      if (-not ($children | Where-Object { $_.Class -eq $requiredClass } | Select-Object -First 1)) {
        throw "control-gallery interaction test did not find native class $requiredClass."
      }
    }

    [MiniGuiTestWin32]::SendMessageW($toolBar.Handle, 514, [IntPtr]::Zero, [IntPtr]::Zero) | Out-Null
    Start-Sleep -Milliseconds 300
    $afterToolBar = Get-StaticTextSnapshot $process.MainWindowHandle
    if ($afterToolBar -notmatch "Action from mainToolBar") {
      throw "control-gallery ToolBar click did not update result text: $afterToolBar"
    }

    [MiniGuiTestWin32]::SendMessageW($menuBar.Handle, 514, [IntPtr]::Zero, [IntPtr]::Zero) | Out-Null
    Start-Sleep -Milliseconds 300
    $afterMenuBar = Get-StaticTextSnapshot $process.MainWindowHandle
    if ($afterMenuBar -notmatch "Action from mainMenu") {
      throw "control-gallery MenuBar click did not update result text: $afterMenuBar"
    }

    Send-TabClick $tabs 1
    Start-Sleep -Milliseconds 300
    $afterSelectionTab = Get-StaticTextSnapshot $process.MainWindowHandle
    if ($afterSelectionTab -notmatch "Enable advanced actions" -or $afterSelectionTab -match "Name \| Password") {
      throw "control-gallery TabControl did not switch to Selection page: $afterSelectionTab"
    }

    Send-TabClick $tabs 2
    Start-Sleep -Milliseconds 300
    $apply = Get-ChildWindows $process.MainWindowHandle | Where-Object { $_.Visible -and $_.Class -eq "Button" -and $_.Text -eq "Apply" } | Select-Object -First 1
    if (-not $apply) { throw "control-gallery interaction test did not find visible Apply button on Layout tab." }
    [MiniGuiTestWin32]::SendMessageW($process.MainWindowHandle, 273, [IntPtr]$apply.Id, $apply.Handle) | Out-Null
    Start-Sleep -Milliseconds 300
    $afterClick = Get-StaticTextSnapshot $process.MainWindowHandle
    if ($afterClick -notmatch "Applied for Ada" -or $afterClick -notmatch "Apply was clicked") {
      throw "control-gallery Apply command did not update result text: $afterClick"
    }

    Send-TabClick $tabs 3
    Start-Sleep -Milliseconds 300
    $slider = Get-ChildWindows $process.MainWindowHandle | Where-Object { $_.Visible -and $_.Class -eq "msctls_trackbar32" } | Select-Object -First 1
    if (-not $slider) { throw "control-gallery interaction test did not find visible Slider on Feedback tab." }
    [MiniGuiTestWin32]::SendMessageW($slider.Handle, 1029, [IntPtr]1, [IntPtr]55) | Out-Null
    $scrollWParam = [IntPtr]((55 -shl 16) -bor 5)
    [MiniGuiTestWin32]::SendMessageW($process.MainWindowHandle, 276, $scrollWParam, $slider.Handle) | Out-Null
    Start-Sleep -Milliseconds 300
    $afterSlider = Get-StaticTextSnapshot $process.MainWindowHandle
    if ($afterSlider -notmatch "Volume: 55") {
      throw "control-gallery Slider command did not update volume text: $afterSlider"
    }

    Send-TabClick $tabs 4
    Start-Sleep -Milliseconds 300
    $scrollContent = Get-ChildWindows $process.MainWindowHandle | Where-Object { $_.Visible -and $_.Class -eq "Edit" -and $_.Text -match "Longer content" } | Select-Object -First 1
    if (-not $scrollContent) { throw "control-gallery interaction test did not find ScrollViewer content on Data tab." }
    $beforeScrollTop = $scrollContent.Rect.Top
    [MiniGuiTestWin32]::SendMessageW($scrollContent.Parent, 277, [IntPtr]1, [IntPtr]::Zero) | Out-Null
    Start-Sleep -Milliseconds 300
    $scrollContentAfter = Get-ChildWindows $process.MainWindowHandle | Where-Object { $_.Visible -and $_.Class -eq "Edit" -and $_.Text -match "Longer content" } | Select-Object -First 1
    if ($scrollContentAfter.Rect.Top -ge $beforeScrollTop) {
      throw "control-gallery ScrollViewer did not move content upward. Before $beforeScrollTop, after $($scrollContentAfter.Rect.Top)."
    }

    $beforeWidth = $slider.Rect.Right - $slider.Rect.Left
    [MiniGuiTestWin32]::MoveWindow($process.MainWindowHandle, 80, 80, 980, 860, $true) | Out-Null
    Start-Sleep -Milliseconds 800
    $resizedSlider = Get-ChildWindows $process.MainWindowHandle | Where-Object { $_.Class -eq "msctls_trackbar32" } | Select-Object -First 1
    $afterWidth = $resizedSlider.Rect.Right - $resizedSlider.Rect.Left
    if ($afterWidth -le $beforeWidth) {
      throw "control-gallery resize did not grow Slider width. Before $beforeWidth, after $afterWidth."
    }

    Write-Host "OK: control-gallery interactions"
  } finally {
    if ($process -and -not $process.HasExited) {
      Stop-Process -Id $process.Id -Force
    }
  }
}

if (Test-Path -LiteralPath $Tmp) {
  Remove-Item -LiteralPath $Tmp -Recurse -Force
}
New-Item -ItemType Directory -Force -Path $Tmp | Out-Null

Assert-Ok (Invoke-Compiler @($ToolSource, $Tool, "-I", $Root, "-I", $CompilerRoot)) "compile MiniGui CLI"

$hello = Join-Path $Root "examples\hello-gui\app.mson"
$customer = Join-Path $Root "examples\customer-form\app.mson"
$gallery = Join-Path $Root "examples\control-gallery\app.mson"

Assert-Ok (Invoke-Capture $Tool @("validate", $hello)) "validate hello-gui"
Assert-Ok (Invoke-Capture $Tool @("validate", $customer)) "validate customer-form imports/components"
Assert-Ok (Invoke-Capture $Tool @("validate", $gallery)) "validate control-gallery"

$gen1 = Join-Path $Tmp "hello1.gui.ml"
$gen2 = Join-Path $Tmp "hello2.gui.ml"
Assert-Ok (Invoke-Capture $Tool @("generate", $hello, "--output", $gen1)) "generate hello-gui 1"
Assert-Ok (Invoke-Capture $Tool @("generate", $hello, "--output", $gen2)) "generate hello-gui 2"
$h1 = (Get-FileHash -LiteralPath $gen1 -Algorithm SHA256).Hash
$h2 = (Get-FileHash -LiteralPath $gen2 -Algorithm SHA256).Hash
if ($h1 -ne $h2) { throw "Generated output is not deterministic." }
Write-Host "OK: deterministic generation"

$helloExe = Join-Path $Tmp "hello-gui.exe"
Assert-Ok (Invoke-Capture $Tool @("build", $hello, "--output", $helloExe, "--compiler", $Compiler, "--library-dir", $Root)) "build hello-gui"

$galleryGen1 = Join-Path $Tmp "control-gallery1.gui.ml"
$galleryGen2 = Join-Path $Tmp "control-gallery2.gui.ml"
Assert-Ok (Invoke-Capture $Tool @("generate", $gallery, "--output", $galleryGen1)) "generate control-gallery 1"
Assert-Ok (Invoke-Capture $Tool @("generate", $gallery, "--output", $galleryGen2)) "generate control-gallery 2"
$g1 = (Get-FileHash -LiteralPath $galleryGen1 -Algorithm SHA256).Hash
$g2 = (Get-FileHash -LiteralPath $galleryGen2 -Algorithm SHA256).Hash
if ($g1 -ne $g2) { throw "Control gallery generated output is not deterministic." }
Write-Host "OK: deterministic control-gallery generation"
Assert-FileContains $galleryGen1 "generated Label constructor" "MiniGui\.Label\.create"
Assert-FileContains $galleryGen1 "generated Button constructor" "MiniGui\.Button\.create"
Assert-FileContains $galleryGen1 "generated TextBox constructor" "MiniGui\.TextBox\.create"
Assert-FileContains $galleryGen1 "generated TextArea constructor" "MiniGui\.TextArea\.create"
Assert-FileContains $galleryGen1 "generated PasswordBox constructor" "MiniGui\.PasswordBox\.create"
Assert-FileContains $galleryGen1 "generated NumberBox constructor" "MiniGui\.NumberBox\.create"
Assert-FileContains $galleryGen1 "generated CheckBox constructor" "MiniGui\.CheckBox\.create"
Assert-FileContains $galleryGen1 "generated RadioButton constructor" "MiniGui\.RadioButton\.create"
Assert-FileContains $galleryGen1 "generated Image constructor" "MiniGui\.Image\.create"
Assert-FileContains $galleryGen1 "generated Separator constructor" "MiniGui\.Separator\.create"
Assert-FileContains $galleryGen1 "generated LinkLabel constructor" "MiniGui\.LinkLabel\.create"
Assert-FileContains $galleryGen1 "generated Panel constructor" "MiniGui\.Panel\.create"
Assert-FileContains $galleryGen1 "generated ScrollViewer constructor" "MiniGui\.ScrollViewer\.create"
Assert-FileContains $galleryGen1 "generated GroupBox constructor" "MiniGui\.GroupBox\.create"
Assert-FileContains $galleryGen1 "generated ComboBox constructor" "MiniGui\.ComboBox\.create"
Assert-FileContains $galleryGen1 "generated ListBox constructor" "MiniGui\.ListBox\.create"
Assert-FileContains $galleryGen1 "generated Slider constructor" "MiniGui\.Slider\.create"
Assert-FileContains $galleryGen1 "generated ProgressBar constructor" "MiniGui\.ProgressBar\.create"
Assert-FileContains $galleryGen1 "generated TabControl constructor" "MiniGui\.TabControl\.create"
Assert-FileContains $galleryGen1 "generated MenuBar constructor" "MiniGui\.MenuBar\.create"
Assert-FileContains $galleryGen1 "generated StatusBar constructor" "MiniGui\.StatusBar\.create"
Assert-FileContains $galleryGen1 "generated ToolBar constructor" "MiniGui\.ToolBar\.create"
Assert-FileContains $galleryGen1 "generated TreeView constructor" "MiniGui\.TreeView\.create"
Assert-FileContains $galleryGen1 "generated Table/ListView constructor" "MiniGui\.ListView\.create"
Assert-FileContains $galleryGen1 "generated DatePicker constructor" "MiniGui\.DatePicker\.create"
Assert-FileContains $galleryGen1 "generated click binding" "MiniGui\.Events\.bindClick"
Assert-FileContains $galleryGen1 "generated change binding" "MiniGui\.Events\.bindChange"
Assert-FileContains $galleryGen1 "generated selection binding" "MiniGui\.Events\.bindSelectionChanged"
Assert-FileContains $galleryGen1 "generated scroll binding" "MiniGui\.Events\.bindScrollChanged"
Assert-FileContains $galleryGen1 "generated resize binding" "MiniGui\.Events\.bindResized"
Assert-FileContains $galleryGen1 "generated enabled mutation" "MiniGui\.Control\.setEnabled"
Assert-FileContains $galleryGen1 "generated visible mutation" "MiniGui\.Control\.setVisible"

$galleryExe = Join-Path $Tmp "control-gallery.exe"
Assert-Ok (Invoke-Capture $Tool @("build", $gallery, "--output", $galleryExe, "--compiler", $Compiler, "--library-dir", $Root)) "build control-gallery"
Assert-GuiStarts $galleryExe "start control-gallery GUI" 25
Assert-ControlGalleryInteractions $galleryExe

$checkControlsMl = Join-Path $Tmp "check-controls.ml"
Write-Utf8NoBom $checkControlsMl @'
package check_controls
function onToggle(ui, event)
  return 0
end function
function onSelection(ui, event)
  return 0
end function
function onScroll(ui, event)
  return 0
end function
'@
$checkControlsMson = Join-Path $Tmp "check-controls.mson"
Write-Utf8NoBom $checkControlsMson @'
{
  "version": 1,
  "namespace": "check_controls",
  "codeBehind": "check-controls.ml",
  "application": { "name": "CheckControls", "startupWindow": "mainWindow" },
  "windows": [
    {
      "id": "mainWindow",
      "type": "Window",
      "properties": { "title": "Check Controls", "width": 620, "height": 620 },
      "layout": {
        "type": "VerticalStack",
        "properties": { "padding": 16, "spacing": 8 },
        "children": [
          { "id": "optInCheckBox", "type": "CheckBox", "properties": { "text": "Opt in", "checked": true }, "events": { "click": "onToggle" } },
          { "id": "choiceRadioButton", "type": "RadioButton", "properties": { "text": "Choice A", "checked": false }, "events": { "click": "onToggle" } },
          { "id": "passwordBox", "type": "PasswordBox", "properties": { "maxLength": 20 }, "events": { "change": "onToggle" } },
          { "id": "numberBox", "type": "NumberBox", "properties": { "minimum": 0, "maximum": 10, "value": 2, "step": 1 }, "events": { "valueChanged": "onToggle" } },
          { "id": "image", "type": "Image", "properties": { "text": "Image", "source": "", "height": 40 }, "events": { "click": "onToggle" } },
          { "id": "separator", "type": "Separator", "properties": { "height": 8, "orientation": "horizontal" } },
          { "id": "link", "type": "LinkLabel", "properties": { "text": "Docs", "url": "https://github.com/MiniLangProject/MiniGui" }, "events": { "click": "onToggle" } },
          {
            "id": "detailsPanel",
            "type": "Panel",
            "properties": { "height": 96, "padding": 8, "spacing": 6 },
            "children": [
              { "id": "notesTextArea", "type": "TextArea", "properties": { "text": "Line 1", "height": 64, "enabled": true }, "events": { "change": "onToggle" } }
            ]
          },
          { "id": "groupBox", "type": "GroupBox", "properties": { "text": "Customer", "height": 48, "visible": true } },
          { "id": "countryComboBox", "type": "ComboBox", "properties": { "items": ["DE", "US", "FR"], "selectedIndex": 1 }, "events": { "selectionChanged": "onSelection" } },
          { "id": "cityListBox", "type": "ListBox", "properties": { "items": ["Berlin", "Bonn"], "selectedIndex": 0, "height": 72 }, "events": { "change": "onSelection" } },
          { "id": "volumeScrollBar", "type": "ScrollBar", "properties": { "orientation": "horizontal", "minimum": 0, "maximum": 100, "value": 25, "smallStep": 5, "largeStep": 20, "height": 18 }, "events": { "scrollChanged": "onScroll" } },
          { "id": "volumeSlider", "type": "Slider", "properties": { "orientation": "horizontal", "minimum": 0, "maximum": 100, "value": 30, "smallStep": 5, "largeStep": 20, "height": 32, "width": "fill", "minWidth": 220 }, "events": { "valueChanged": "onScroll" } },
          { "id": "progressBar", "type": "ProgressBar", "properties": { "minimum": 0, "maximum": 100, "value": 40, "height": 24 }, "events": { "valueChanged": "onScroll" } },
          { "id": "tabs", "type": "TabControl", "properties": { "items": ["Inputs", "Data"], "selectedIndex": 0, "height": 80 }, "events": { "selected": "onSelection" } },
          { "id": "scrollViewer", "type": "ScrollViewer", "properties": { "height": 80, "verticalScroll": true }, "children": [ { "id": "scrollLabel", "type": "Label", "properties": { "text": "Scroll content" } } ] },
          { "id": "menu", "type": "MenuBar", "properties": { "items": ["File", "Help"], "height": 24 }, "events": { "clicked": "onToggle" } },
          { "id": "toolbar", "type": "ToolBar", "properties": { "items": ["Save", "Refresh"], "height": 30 }, "events": { "click": "onToggle" } },
          { "id": "tree", "type": "TreeView", "properties": { "items": ["Root", "Child"], "height": 80 }, "events": { "selected": "onSelection" } },
          { "id": "table", "type": "Table", "properties": { "items": ["Ada", "Grace"], "selectedIndex": 0, "height": 80 }, "events": { "selected": "onSelection" } },
          { "id": "datePicker", "type": "DatePicker", "properties": { "height": 26 }, "events": { "changed": "onToggle" } },
          { "id": "statusBar", "type": "StatusBar", "properties": { "text": "Ready", "height": 24 } }
        ]
      }
    }
  ]
}
'@
$checkControlsGenerated = Join-Path $Tmp "check-controls.gui.ml"
$checkControlsBuiltExe = Join-Path $Tmp "check-controls-generated.exe"
Assert-Ok (Invoke-Capture $Tool @("validate", $checkControlsMson)) "validate check controls MSON"
Assert-Ok (Invoke-Capture $Tool @("generate", $checkControlsMson, "--output", $checkControlsGenerated)) "generate check controls MSON"
Assert-FileContains $checkControlsGenerated "generated ScrollBar constructor" "MiniGui\.ScrollBar\.create"
Assert-FileContains $checkControlsGenerated "generated ProgressBar constructor" "MiniGui\.ProgressBar\.create"
Assert-FileContains $checkControlsGenerated "generated TabControl constructor" "MiniGui\.TabControl\.create"
Assert-FileContains $checkControlsGenerated "generated PasswordBox constructor" "MiniGui\.PasswordBox\.create"
Assert-FileContains $checkControlsGenerated "generated NumberBox constructor" "MiniGui\.NumberBox\.create"
Assert-FileContains $checkControlsGenerated "generated Image constructor" "MiniGui\.Image\.create"
Assert-FileContains $checkControlsGenerated "generated Separator constructor" "MiniGui\.Separator\.create"
Assert-FileContains $checkControlsGenerated "generated LinkLabel constructor" "MiniGui\.LinkLabel\.create"
Assert-FileContains $checkControlsGenerated "generated ScrollViewer constructor" "MiniGui\.ScrollViewer\.create"
Assert-FileContains $checkControlsGenerated "generated MenuBar constructor" "MiniGui\.MenuBar\.create"
Assert-FileContains $checkControlsGenerated "generated ToolBar constructor" "MiniGui\.ToolBar\.create"
Assert-FileContains $checkControlsGenerated "generated TreeView constructor" "MiniGui\.TreeView\.create"
Assert-FileContains $checkControlsGenerated "generated Table constructor" "MiniGui\.ListView\.create"
Assert-FileContains $checkControlsGenerated "generated DatePicker constructor" "MiniGui\.DatePicker\.create"
Assert-FileContains $checkControlsGenerated "generated StatusBar constructor" "MiniGui\.StatusBar\.create"
Assert-Ok (Invoke-Capture $Tool @("build", $checkControlsMson, "--output", $checkControlsBuiltExe, "--compiler", $Compiler, "--library-dir", $Root)) "build check controls MSON"

$smokeExe = Join-Path $Tmp "runtime-smoke.exe"
Assert-Ok (Invoke-Compiler @((Join-Path $Root "tests\minigui\runtime_smoke.ml"), $smokeExe, "-I", $Root, "--subsystem", "gui")) "compile runtime smoke"
Assert-Ok (Invoke-Capture $smokeExe @()) "run runtime smoke"

$wmCommandExe = Join-Path $Tmp "wm-command-smoke.exe"
Assert-Ok (Invoke-Compiler @((Join-Path $Root "tests\minigui\wm_command_smoke.ml"), $wmCommandExe, "-I", $Root, "--subsystem", "gui")) "compile WM_COMMAND smoke"
Assert-Ok (Invoke-Capture $wmCommandExe @()) "run WM_COMMAND smoke"

$checkControlsExe = Join-Path $Tmp "check-controls-smoke.exe"
Assert-Ok (Invoke-Compiler @((Join-Path $Root "tests\minigui\check_controls_smoke.ml"), $checkControlsExe, "-I", $Root, "--subsystem", "gui")) "compile check controls smoke"
Assert-Ok (Invoke-Capture $checkControlsExe @()) "run check controls smoke"

$resizeExe = Join-Path $Tmp "resize-smoke.exe"
Assert-Ok (Invoke-Compiler @((Join-Path $Root "tests\minigui\resize_smoke.ml"), $resizeExe, "-I", $Root, "--subsystem", "gui")) "compile resize smoke"
Assert-Ok (Invoke-Capture $resizeExe @()) "run resize smoke"

$clientRectExe = Join-Path $Tmp "client-rect-smoke.exe"
Assert-Ok (Invoke-Compiler @((Join-Path $Root "tests\minigui\client_rect_smoke.ml"), $clientRectExe, "-I", $Root, "--subsystem", "gui")) "compile client rect smoke"
Assert-Ok (Invoke-Capture $clientRectExe @()) "run client rect smoke"

$galleryCodeBehindExe = Join-Path $Tmp "control-gallery-codebehind-smoke.exe"
Assert-Ok (Invoke-Compiler @((Join-Path $Root "tests\minigui\control_gallery_codebehind_smoke.ml"), $galleryCodeBehindExe, "-I", $Root, "--subsystem", "gui")) "compile control-gallery code-behind smoke"
Assert-Ok (Invoke-Capture $galleryCodeBehindExe @()) "run control-gallery code-behind smoke"

$aliasExe = Join-Path $Tmp "codebehind-alias-smoke.exe"
Assert-Ok (Invoke-Compiler @((Join-Path $Root "tests\minigui\codebehind_alias_smoke.ml"), $aliasExe, "-I", (Join-Path $Root "tests\minigui"))) "compile code-behind alias smoke"
Assert-Ok (Invoke-Capture $aliasExe @()) "run code-behind alias smoke"

$generatedCallbackExe = Join-Path $Tmp "generated-callback-smoke.exe"
Assert-Ok (Invoke-Compiler @((Join-Path $Root "tests\minigui\generated_callback_smoke.ml"), $generatedCallbackExe, "-I", $Root, "-I", (Join-Path $Root "tests\minigui"), "--subsystem", "gui")) "compile generated callback smoke"
Assert-Ok (Invoke-Capture $generatedCallbackExe @()) "run generated callback smoke"

$generatedMiniGuiCallbackExe = Join-Path $Tmp "generated-minigui-callback-smoke.exe"
Assert-Ok (Invoke-Compiler @((Join-Path $Root "tests\minigui\generated_minigui_callback_smoke.ml"), $generatedMiniGuiCallbackExe, "-I", $Root, "-I", (Join-Path $Root "tests\minigui"), "--subsystem", "gui")) "compile generated MiniGui callback smoke"
Assert-Ok (Invoke-Capture $generatedMiniGuiCallbackExe @()) "run generated MiniGui callback smoke"

$helloCodeBehindExe = Join-Path $Tmp "hello-codebehind-smoke.exe"
Assert-Ok (Invoke-Compiler @((Join-Path $Root "tests\minigui\hello_codebehind_smoke.ml"), $helloCodeBehindExe, "-I", $Root, "--subsystem", "gui")) "compile hello code-behind smoke"
Assert-Ok (Invoke-Capture $helloCodeBehindExe @()) "run hello code-behind smoke"

$helloFullUiExe = Join-Path $Tmp "hello-full-ui-smoke.exe"
Assert-Ok (Invoke-Compiler @((Join-Path $Root "tests\minigui\hello_full_ui_smoke.ml"), $helloFullUiExe, "-I", $Root, "--subsystem", "gui")) "compile hello full UI smoke"
Assert-Ok (Invoke-Capture $helloFullUiExe @()) "run hello full UI smoke"

$badJson = Join-Path $Tmp "bad-json.mson"
Write-Utf8NoBom $badJson '{ "version": 1, '
Assert-FailsLike (Invoke-Capture $Tool @("validate", $badJson)) "invalid JSON diagnostic" "JSON syntax error"

$badPropMl = Join-Path $Tmp "bad-prop.ml"
Write-Utf8NoBom $badPropMl @'
package bad_prop
function onClick(ui, event)
  return 0
end function
'@
$badProp = Join-Path $Tmp "bad-prop.mson"
Write-Utf8NoBom $badProp @'
{
  "version": 1,
  "namespace": "bad_prop",
  "codeBehind": "bad-prop.ml",
  "application": { "name": "BadProp", "startupWindow": "mainWindow" },
  "windows": [
    {
      "id": "mainWindow",
      "type": "Window",
      "layout": {
        "type": "VerticalStack",
        "children": [
          { "id": "saveButton", "type": "Button", "properties": { "bogus": true }, "events": { "click": "onClick" } }
        ]
      }
    }
  ]
}
'@
Assert-FailsLike (Invoke-Capture $Tool @("validate", $badProp)) "unknown property diagnostic" "Unknown property 'bogus'"

$badEvent = Join-Path $Tmp "bad-event.mson"
Write-Utf8NoBom $badEvent ((Get-Content -LiteralPath $badProp -Raw) -replace '"click"', '"clik"')
Assert-FailsLike (Invoke-Capture $Tool @("validate", $badEvent)) "event typo diagnostic" "Did you mean 'click'"

$badWindowEvent = Join-Path $Tmp "bad-window-event.mson"
Write-Utf8NoBom $badWindowEvent @'
{
  "version": 1,
  "namespace": "bad_window_event",
  "codeBehind": "bad-prop.ml",
  "application": { "name": "BadWindowEvent", "startupWindow": "mainWindow" },
  "windows": [
    {
      "id": "mainWindow",
      "type": "Window",
      "events": { "closing": "onClick" },
      "layout": { "type": "VerticalStack", "children": [] }
    }
  ]
}
'@
Assert-FailsLike (Invoke-Capture $Tool @("validate", $badWindowEvent)) "window event diagnostic" "Unknown event 'closing' for window 'mainWindow'"

$missingHandler = Join-Path $Tmp "missing-handler.mson"
Write-Utf8NoBom $missingHandler ((Get-Content -LiteralPath $badProp -Raw) -replace '"bogus": true, ', '' -replace '"onClick"', '"onMissing"')
Assert-FailsLike (Invoke-Capture $Tool @("validate", $missingHandler)) "missing handler diagnostic" "no function was found"

$cycleA = Join-Path $Tmp "cycle-a.mson"
$cycleB = Join-Path $Tmp "cycle-b.mson"
Write-Utf8NoBom $cycleA @'
{
  "version": 1,
  "namespace": "cycle_a",
  "imports": ["cycle-b.mson"],
  "codeBehind": "bad-prop.ml",
  "application": { "name": "CycleA", "startupWindow": "mainWindow" },
  "windows": []
}
'@
Write-Utf8NoBom $cycleB @'
{
  "version": 1,
  "namespace": "cycle_b",
  "imports": ["cycle-a.mson"],
  "application": { "name": "CycleB", "startupWindow": "mainWindow" },
  "windows": []
}
'@
Assert-FailsLike (Invoke-Capture $Tool @("validate", $cycleA)) "cyclic import diagnostic" "Cyclic MSON import"

Write-Host "MiniGui tests OK"
