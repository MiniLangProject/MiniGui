param(
  [string]$Output = ""
)

$Here = Split-Path -Parent $PSCommandPath
$Root = [System.IO.Path]::GetFullPath((Join-Path $Here "..\.."))
$CompilerRoot = [System.IO.Path]::GetFullPath((Join-Path $Root "..\MiniLangCompilerPy"))
$Compiler = Join-Path $CompilerRoot "mlc_win64.py"
$ToolSource = Join-Path $Root "tools\minigui.ml"
$Tool = Join-Path $Root "tools\minigui.exe"

if ($Output -eq "") {
  $Output = Join-Path $Here "build\hello-gui.exe"
}

py -3.14 $Compiler $ToolSource $Tool -I $Root -I $CompilerRoot
if ($LASTEXITCODE -ne 0) {
  exit $LASTEXITCODE
}

& $Tool build (Join-Path $Here "app.mson") --output $Output --compiler $Compiler --library-dir $Root
exit $LASTEXITCODE
