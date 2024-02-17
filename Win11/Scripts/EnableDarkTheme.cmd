@echo off
setlocal EnableDelayedExpansion
cls
echo.
echo.
echo Before proceeding, make sure to create a backup of your system.
echo This script will modify various settings. Continue only if you understand the changes.
echo.
echo This script sets the dark theme on Windows 11
echo.
set /p "continue=Press ENTER to start the process..."

echo Applying Enable Dark Theme...

:: Define Registry Key
set "RegKey=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"

:: Enable Dark Theme settings
reg add "%RegKey%" /v AppsUseLightTheme /t REG_DWORD /d 0 /f >nul
reg add "%RegKey%" /v SystemUsesLightTheme /t REG_DWORD /d 0 /f >nul
reg add "%RegKey%" /v EnableTransparency /t REG_DWORD /d 1 /f >nul

echo Enable Dark Theme applied.
pause
