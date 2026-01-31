@echo off
rem delete-mod.bat
rem Only deletes files in %appdata%\Godot\app_userdata\Atomcraft that match names in local Materials and Reactions

setlocal
set "ROOT=%~dp0"
set "APPDIR=%appdata%\Godot\app_userdata\Atomcraft"

echo Scanning "%ROOT%Materials" and "%ROOT%Reactions"...
echo Target app userdata: "%APPDIR%"
echo.

rem Check files in Materials and delete only in APPDIR
for /f "delims=" %%F in ('dir /b /a-d "%ROOT%Materials" 2^>nul') do (
    if exist "%APPDIR%\Materials\%%F" (
        echo Deleting "%APPDIR%\Materials\%%F"
        del /f /q "%APPDIR%\Materials\%%F" >nul 2>&1
    ) else (
        echo Not found in app userdata: "%APPDIR%\Materials\%%F"
    )
)

rem Check files in Reactions and delete only in APPDIR
for /f "delims=" %%F in ('dir /b /a-d "%ROOT%Reactions" 2^>nul') do (
    if exist "%APPDIR%\Reactions\%%F" (
        echo Deleting "%APPDIR%\Reactions\%%F"
        del /f /q "%APPDIR%\Reactions\%%F" >nul 2>&1
    ) else (
        echo Not found in app userdata: "%APPDIR%\Reactions\%%F"
    )
)

echo.
echo Done.
endlocal
