param(
  [string]$Output = ""
)

$Here = Split-Path -Parent $PSCommandPath
$Root = [System.IO.Path]::GetFullPath((Join-Path $Here "..\.."))
$CompilerRoot = [System.IO.Path]::GetFullPath((Join-Path $Root "..\MiniLangCompilerML"))
$Compiler = Join-Path $CompilerRoot "build\mlc_win64.exe"
$ToolSource = Join-Path $Root "tools\minigui.ml"
$Tool = Join-Path $Root "tools\minigui.exe"

if ($Output -eq "") {
  $Output = Join-Path $Here "build\hello-gui.exe"
}

& $Compiler $ToolSource $Tool -I $Root -I $CompilerRoot
if ($LASTEXITCODE -ne 0) {
  exit $LASTEXITCODE
}

& $Tool build (Join-Path $Here "app.mson") --output $Output
exit $LASTEXITCODE
