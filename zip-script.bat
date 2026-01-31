@echo off
rem zip-script.bat - create More-Burnables-v<version>.zip containing Materials, Reactions, and README.txt
setlocal
pushd "%~dp0" || (echo Failed to change directory to script location & exit /b 1)

set "VERSION_FILE=More-Burnables.version"

rem Ensure version file exists (initialize with 0 so first run becomes 1)
if not exist "%VERSION_FILE%" (
    echo 0>"%VERSION_FILE%"
)

rem Read current version (non-numeric or empty becomes 0)
set "VER=0"
for /f "usebackq delims=" %%V in ("%VERSION_FILE%") do set "VER=%%V"
set /a "VER_NUM=%VER%" >nul 2>&1
if errorlevel 1 set "VER_NUM=0"
set "VER=%VER_NUM%"

rem Increment and save new version
set /a VER+=1
> "%VERSION_FILE%" echo %VER%

set "ZIPNAME=More-Burnables-v%VER%.zip"

rem Use PowerShell Compress-Archive to create the zip containing only existing items
powershell -NoProfile -Command ^
"$items = @(); if (Test-Path -LiteralPath 'Materials') { $items += 'Materials' }; if (Test-Path -LiteralPath 'Reactions') { $items += 'Reactions' }; if (Test-Path -LiteralPath 'README.txt') { $items += 'README.txt' }; if ($items.Count -eq 0) { Write-Host 'No items found to archive.'; exit 1 }; Compress-Archive -Path $items -DestinationPath '%ZIPNAME%' -Force; Write-Host 'Created %ZIPNAME%'"

popd
endlocal
exit /b 0