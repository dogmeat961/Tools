@echo off
setlocal EnableDelayedExpansion
cls
echo Before proceeding, make sure to create a backup of your system.
echo This script will modify various settings. Continue only if you understand the changes.
echo.
set /p "continue=Press ENTER to start the process..."

setlocal enabledelayedexpansion

:: Check for administrative privileges
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Running with administrative privileges
    goto :admin
) else (
    echo Requesting administrative privileges...
    goto :elevate
)

:elevate
    :: Re-launch the script with administrative privileges
    powershell -Command "Start-Process 'cmd.exe' -ArgumentList '/c ""%~f0""' -Verb runAs"
    exit /b

:admin
    :: List of folders to clean
    set "folders_to_clean=%WinDir%\Temp %WinDir%\Prefetch %Temp% %AppData%\Temp %HomePath%\AppData\LocalLow\Temp"

    :: Additional folders to clean
    set "additional_folders_to_clean=%SystemRoot%\SoftwareDistribution\Download %SystemRoot%\Logs"

    echo Cleaning temporary files and folders...

    :: Clean temporary files and folders
    for %%F in (%folders_to_clean% %additional_folders_to_clean%) do (
        echo Deleting files in %%F
        del /s /f /q "%%F\*.*"
        rd /s /q "%%F" 2>nul
        md "%%F"
    )

    echo.
    echo Windows Clean Up Done! You can exit by pressing any key.
    echo.

    pause >nul
