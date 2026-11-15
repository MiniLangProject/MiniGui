param(
  [string]$Version = "",
  [string]$Compiler = "",
  [string]$OutputDir = "",
  [switch]$IncludeLinux,
  [switch]$IncludeMinux
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$Root = [System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot ".."))
if ($Version -eq "") { $Version = (Get-Content -LiteralPath (Join-Path $Root "VERSION") -Raw).Trim() }
if ($IncludeLinux -and -not (Test-Path -LiteralPath (Join-Path $Root "build/native/linux-x64/libminigui_gtk.so"))) {
  throw 'Build native/linux/build.sh on Linux or WSL before packaging with -IncludeLinux.'
}
if ($IncludeMinux -and -not (Test-Path -LiteralPath (Join-Path $Root "build/native/minux-x64/libminigui_minux.so"))) {
  throw 'Build tools/build_minux_native.py with the MinUX SDK before packaging with -IncludeMinux.'
}
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
if ($PackageDir.StartsWith(($DistRoot.TrimEnd("\") + "\"), [System.StringComparison]::OrdinalIgnoreCase) -eq $false) {
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
while (-not (Test-Path -LiteralPath (Join-Path $CompilerRoot 'std'))) {
  $compilerParent = Split-Path -Parent $CompilerRoot
  if (-not $compilerParent -or $compilerParent -eq $CompilerRoot) {
    throw "Cannot locate matching standard-library sources for compiler: $Compiler"
  }
  $CompilerRoot = $compilerParent
}
if ($Compiler -like "*.py") {
  Invoke-Capture "py" @("-3.14", $Compiler, $ToolSource, $ToolExe, "-I", $Root, "-I", $CompilerRoot, "--subsystem", "console")
} else {
  Invoke-Capture $Compiler @($ToolSource, $ToolExe, "-I", $Root, "-I", $CompilerRoot, "--subsystem", "console")
}

Copy-Path (Join-Path $Root "README.md") (Join-Path $PackageDir "README.md")
Copy-Path (Join-Path $Root "CHANGELOG.md") (Join-Path $PackageDir "CHANGELOG.md")
Copy-Path (Join-Path $Root "VERSION") (Join-Path $PackageDir "VERSION")
Copy-Path (Join-Path $Root "RELEASE_NOTES_$Version.md") (Join-Path $PackageDir "RELEASE_NOTES_$Version.md")
Copy-Path (Join-Path $Root "minidoc.toml") (Join-Path $PackageDir "minidoc.toml")
Copy-Path (Join-Path $Root "LICENSE") (Join-Path $PackageDir "LICENSE")
Copy-Path (Join-Path $Root "MiniGuiLib") (Join-Path $PackageDir "MiniGuiLib")
Copy-Path (Join-Path $Root "schemas") (Join-Path $PackageDir "schemas")
Copy-Path (Join-Path $Root "docs") (Join-Path $PackageDir "docs")
Copy-Path (Join-Path $Root "examples\hello-gui") (Join-Path $PackageDir "examples\hello-gui")
Copy-Path (Join-Path $Root "examples\customer-form") (Join-Path $PackageDir "examples\customer-form")
Copy-Path (Join-Path $Root "examples\control-gallery") (Join-Path $PackageDir "examples\control-gallery")
Copy-Path (Join-Path $Root "examples/advanced-controls") (Join-Path $PackageDir "examples/advanced-controls")

New-Item -ItemType Directory -Force -Path (Join-Path $PackageDir "tools") | Out-Null
Copy-Path $ToolExe (Join-Path $PackageDir "tools\minigui.exe")
Copy-Path $ToolSource (Join-Path $PackageDir "tools\minigui.ml")
Copy-Path (Join-Path $Root "tools/generate_minidoc.ps1") (Join-Path $PackageDir "tools/generate_minidoc.ps1")
if ($IncludeLinux) {
  $LinuxTool = Join-Path $PackageDir "tools/minigui"
  if ($Compiler -like "*.py") {
    Invoke-Capture "py" @("-3.14", $Compiler, $ToolSource, $LinuxTool, "-I", $Root, "-I", $CompilerRoot, "--target", "linux-x64")
  } else {
    Invoke-Capture $Compiler @($ToolSource, $LinuxTool, "-I", $Root, "-I", $CompilerRoot, "--target", "linux-x64")
  }
}
if ($IncludeMinux) {
  $MinuxTool = Join-Path $PackageDir "tools/minigui-minux"
  if ($Compiler -like "*.py") {
    Invoke-Capture "python" @($Compiler, $ToolSource, $MinuxTool, "-I", $Root, "-I", $CompilerRoot, "--target", "minux-x64", "--pack")
  } else {
    Invoke-Capture $Compiler @($ToolSource, $MinuxTool, "-I", $Root, "-I", $CompilerRoot, "--target", "minux-x64", "--pack")
  }
  Copy-Path (Join-Path $Root "tools/build_minux_native.py") (Join-Path $PackageDir "tools/build_minux_native.py")
}

foreach ($temporary in @(Get-ChildItem -LiteralPath $PackageDir -Recurse -Directory | Where-Object Name -In @('build','tmp'))) {
  $resolvedTemporary = [IO.Path]::GetFullPath($temporary.FullName)
  if (-not $resolvedTemporary.StartsWith($PackageDir.TrimEnd('\')+'\', [StringComparison]::OrdinalIgnoreCase)) {
    throw "Refusing to remove temporary directory outside package: $resolvedTemporary"
  }
  if (Test-Path -LiteralPath $resolvedTemporary) { Remove-Item -LiteralPath $resolvedTemporary -Recurse -Force }
}

Copy-Path (Join-Path $Root "native") (Join-Path $PackageDir "native")
Copy-Path (Join-Path $Root "build/native/windows-x64/minigui_extra.dll") (Join-Path $PackageDir "build/native/windows-x64/minigui_extra.dll")
if (Test-Path (Join-Path $Root "build/native/linux-x64/libminigui_gtk.so")) {
  Copy-Path (Join-Path $Root "build/native/linux-x64/libminigui_gtk.so") (Join-Path $PackageDir "build/native/linux-x64/libminigui_gtk.so")
}
if ($IncludeMinux) {
  Copy-Path (Join-Path $Root "build/native/minux-x64/libminigui_minux.so") (Join-Path $PackageDir "build/native/minux-x64/libminigui_minux.so")
}
$packageRevision = (& git -C $Root rev-parse HEAD).Trim()
if ($LASTEXITCODE -ne 0) { throw 'Cannot identify MiniGui source revision' }
$runtimeHashes = @{}
Get-ChildItem -LiteralPath (Join-Path $PackageDir 'build/native') -File -Recurse | ForEach-Object {
  $relative = $_.FullName.Substring($PackageDir.TrimEnd('\').Length + 1).Replace('\','/')
  $runtimeHashes[$relative] = (Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash.ToLowerInvariant()
}
@{ version=$Version; sourceRevision=$packageRevision; minimumCompilerVersion='1.3.9'; runtimeSha256=$runtimeHashes } |
  ConvertTo-Json -Depth 5 | Set-Content -LiteralPath (Join-Path $PackageDir 'BUILD_INFO.json') -Encoding UTF8
Compress-Archive -Path (Join-Path $PackageDir "*") -DestinationPath $ZipPath -Force
$hash = (Get-FileHash -LiteralPath $ZipPath -Algorithm SHA256).Hash.ToLowerInvariant()
"$hash  $(Split-Path -Leaf $ZipPath)" | Set-Content -LiteralPath $ShaPath -Encoding ASCII

Write-Host "Package: $ZipPath"
Write-Host "SHA256:  $ShaPath"
