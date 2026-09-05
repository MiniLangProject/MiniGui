# SPDX-License-Identifier: Apache-2.0
[CmdletBinding()]
param([string]$OutputDir = "$PSScriptRoot/../../build/native/windows-x64")
$ErrorActionPreference = 'Stop'
$OutputDir = [IO.Path]::GetFullPath($OutputDir)
New-Item -ItemType Directory -Force $OutputDir | Out-Null
$sdkVersion = '1.0.3537.50'
$sdk = [IO.Path]::GetFullPath("$PSScriptRoot/../../build/deps/webview2-$sdkVersion")
if (-not (Test-Path "$sdk/build/native/include/WebView2.h")) {
    New-Item -ItemType Directory -Force $sdk | Out-Null
    $archive = "$sdk/package.zip"
    Invoke-WebRequest "https://api.nuget.org/v3-flatcontainer/microsoft.web.webview2/$sdkVersion/microsoft.web.webview2.$sdkVersion.nupkg" -OutFile $archive
    Expand-Archive -LiteralPath $archive -DestinationPath $sdk -Force
}
$vswhere = "${env:ProgramFiles(x86)}/Microsoft Visual Studio/Installer/vswhere.exe"
$vs = & $vswhere -latest -products '*' -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -property installationPath
if (-not $vs) { throw 'Visual Studio C++ x64 build tools are required.' }
$devcmd = Join-Path $vs 'Common7/Tools/VsDevCmd.bat'
$source = Join-Path $PSScriptRoot 'minigui_extra.cpp'
$buildCmd = Join-Path $OutputDir 'compile.cmd'
# Fixed compiler invocation; all paths are quoted and never used for deletion.
@"
@echo off
call "$devcmd" -arch=x64 -host_arch=x64 >nul
if errorlevel 1 exit /b 1
cl /nologo /std:c++17 /EHsc /MT /O2 /LD /DUNICODE /D_UNICODE /I"$sdk/build/native/include" "$source" /Fo"$OutputDir/minigui_extra.obj" /link /IMPLIB:"$OutputDir/minigui_extra.lib" /OUT:"$OutputDir/minigui_extra.dll" "$sdk/build/native/x64/WebView2LoaderStatic.lib" user32.lib gdi32.lib shell32.lib ole32.lib oleaut32.lib comctl32.lib shlwapi.lib version.lib advapi32.lib
"@ | Set-Content -LiteralPath $buildCmd -Encoding ascii
& $env:ComSpec /d /c $buildCmd
if ($LASTEXITCODE -ne 0) { throw 'MiniGui native Windows build failed.' }
