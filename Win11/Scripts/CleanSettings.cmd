@echo off
setlocal EnableDelayedExpansion
cls
echo.
echo.
echo Before proceeding, make sure to create a backup of your system.
echo This script will modify various settings. Continue only if you understand the changes.
echo.
echo This script disables the online tips in Windows 11
echo.
set /p "continue=Press ENTER to start the process..."

echo Applying Clean Settings...

:: Disable online tips
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v AllowOnlineTips /t REG_DWORD /d 0 /f

echo Clean Settings applied.
pause
