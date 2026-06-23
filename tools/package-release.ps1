param(
  [string]$Version = "dev",
  [string]$Compiler = "",
  [string]$OutputDir = ""
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$Root = [System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot ".."))
if ($OutputDir -eq "") {
  $OutputDir = Join-Path $Root "dist"
}
$OutputDir = [System.IO.Path]::GetFullPath($OutputDir)
$PackageName = "MiniGui-$Version"
$PackageDir = [System.IO.Path]::GetFullPath((Join-Path $OutputDir $PackageName))
$ZipPath = Join-Path $OutputDir "$PackageName.zip"
$ShaPath = "$ZipPath.sha256"

function Invoke-Capture {
  param([string]$File, [string[]]$Arguments)
  $out = & $File @Arguments 2>&1
  $code = 0
  if (-not $?) { $code = 1 }
  if (Test-Path Variable:\LASTEXITCODE) {
    if ($LASTEXITCODE -ne $null -and $LASTEXITCODE -ne 0) { $code = $LASTEXITCODE }
  }
  if ($code -ne 0) {
    throw "$File failed with exit $code`n$($out -join "`n")"
  }
}

function Copy-Path {
  param([string]$From, [string]$To)
  New-Item -ItemType Directory -Force -Path (Split-Path -Parent $To) | Out-Null
  Copy-Item -LiteralPath $From -Destination $To -Recurse -Force
}

if ($Compiler -eq "") {
  $DefaultCompiler = [System.IO.Path]::GetFullPath((Join-Path $Root "..\MiniLangCompilerPy\mlc_win64.py"))
  if (Test-Path -LiteralPath $DefaultCompiler) {
    $Compiler = $DefaultCompiler
  } else {
    throw "No compiler provided. Pass -Compiler <path-to-mlc_win64.py-or-mlc.exe>."
  }
}

New-Item -ItemType Directory -Force -Path $OutputDir | Out-Null
$DistRoot = [System.IO.Path]::GetFullPath($OutputDir)
if ($PackageDir.StartsWith($DistRoot, [System.StringComparison]::OrdinalIgnoreCase) -eq $false) {
  throw "Refusing to clean package directory outside output root: $PackageDir"
}
if (Test-Path -LiteralPath $PackageDir) {
  Remove-Item -LiteralPath $PackageDir -Recurse -Force
}
if (Test-Path -LiteralPath $ZipPath) {
  Remove-Item -LiteralPath $ZipPath -Force
}
if (Test-Path -LiteralPath $ShaPath) {
  Remove-Item -LiteralPath $ShaPath -Force
}

New-Item -ItemType Directory -Force -Path $PackageDir | Out-Null

$ToolExe = Join-Path $Root "tools\minigui.exe"
$ToolSource = Join-Path $Root "tools\minigui.ml"
$CompilerRoot = [System.IO.Path]::GetFullPath((Split-Path -Parent $Compiler))
if ($Compiler -like "*.py") {
  Invoke-Capture "py" @("-3.14", $Compiler, $ToolSource, $ToolExe, "-I", $Root, "-I", $CompilerRoot, "--subsystem", "console")
} else {
  Invoke-Capture $Compiler @($ToolSource, $ToolExe, "-I", $Root, "-I", $CompilerRoot, "--subsystem", "console")
}

Copy-Path (Join-Path $Root "README.md") (Join-Path $PackageDir "README.md")
Copy-Path (Join-Path $Root "LICENSE") (Join-Path $PackageDir "LICENSE")
Copy-Path (Join-Path $Root "MiniGuiLib") (Join-Path $PackageDir "MiniGuiLib")
Copy-Path (Join-Path $Root "schemas") (Join-Path $PackageDir "schemas")
Copy-Path (Join-Path $Root "docs") (Join-Path $PackageDir "docs")
Copy-Path (Join-Path $Root "examples\hello-gui") (Join-Path $PackageDir "examples\hello-gui")
Copy-Path (Join-Path $Root "examples\customer-form") (Join-Path $PackageDir "examples\customer-form")
Copy-Path (Join-Path $Root "examples\control-gallery") (Join-Path $PackageDir "examples\control-gallery")

New-Item -ItemType Directory -Force -Path (Join-Path $PackageDir "tools") | Out-Null
Copy-Path $ToolExe (Join-Path $PackageDir "tools\minigui.exe")
Copy-Path $ToolSource (Join-Path $PackageDir "tools\minigui.ml")

Get-ChildItem -LiteralPath $PackageDir -Recurse -Directory -Filter build | Remove-Item -Recurse -Force
Get-ChildItem -LiteralPath $PackageDir -Recurse -Directory -Filter tmp | Remove-Item -Recurse -Force

Compress-Archive -Path (Join-Path $PackageDir "*") -DestinationPath $ZipPath -Force
$hash = (Get-FileHash -LiteralPath $ZipPath -Algorithm SHA256).Hash.ToLowerInvariant()
"$hash  $(Split-Path -Leaf $ZipPath)" | Set-Content -LiteralPath $ShaPath -Encoding ASCII

Write-Host "Package: $ZipPath"
Write-Host "SHA256:  $ShaPath"
