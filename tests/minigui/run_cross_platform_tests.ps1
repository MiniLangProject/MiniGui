# SPDX-License-Identifier: Apache-2.0
[CmdletBinding()]
param([string]$LinuxDistro = "")
$ErrorActionPreference = 'Stop'
$root = [IO.Path]::GetFullPath("$PSScriptRoot/../..")
$compilerRoot = [IO.Path]::GetFullPath("$root/../MiniLangCompilerPy")
$out = "$root/tests/tmp/cross-platform"
New-Item -ItemType Directory -Force $out | Out-Null
& "$root/native/windows/build.ps1"
Copy-Item "$root/build/native/windows-x64/minigui_extra.dll" $out -Force
& py -3.14 "$compilerRoot/mlc_win64.py" "$PSScriptRoot/cross_platform_smoke.ml" "$out/cross-smoke.exe" -I $root -I $compilerRoot
if ($LASTEXITCODE -ne 0) { throw 'Windows smoke compile failed.' }
$result = & "$out/cross-smoke.exe" 2>&1
if ($LASTEXITCODE -ne 0 -or ($result -join [Environment]::NewLine) -notmatch 'PASS:') { throw ($result -join [Environment]::NewLine) }
$result | Write-Host
& py -3.14 "$compilerRoot/mlc_win64.py" "$root/tools/minigui.ml" "$root/tools/minigui.exe" -I $root -I $compilerRoot
if ($LASTEXITCODE -ne 0) { throw 'CLI compile failed.' }
& "$root/tools/minigui.exe" build "$root/examples/advanced-controls/app.mson" --target windows-x64 --compiler "$compilerRoot/mlc_win64.py" --library-dir $root --output "$out/advanced.exe"
if ($LASTEXITCODE -ne 0) { throw 'Advanced Windows example build failed.' }
if ($LinuxDistro) {
    $scriptPath = "$root/tests/minigui/run_linux_tests.sh".Replace('\', '/')
    $linuxScript = (& wsl -d $LinuxDistro -- wslpath -u $scriptPath).Trim()
    & wsl -d $LinuxDistro -- bash $linuxScript
    if ($LASTEXITCODE -ne 0) { throw 'Linux tests failed.' }
}
