@echo off
setlocal

set "BASEDIR=%~dp0"
set "TARGET=%appdata%\Godot\app_userdata\Atomcraft"

echo BASEDIR: %BASEDIR%
echo TARGET: %TARGET%

if exist "%BASEDIR%Materials\" (
    xcopy /s "%BASEDIR%Materials" "%TARGET%\Materials" /Y >nul
) else (
    echo Materials folder not found in "%BASEDIR%"
)

if exist "%BASEDIR%Reactions\" (
    xcopy /s "%BASEDIR%Reactions" "%TARGET%\Reactions" /Y >nul
) else (
    echo Reactions folder not found in "%BASEDIR%"
)

endlocal