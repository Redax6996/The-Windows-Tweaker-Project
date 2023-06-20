@echo off
setlocal enabledelayedexpansion

echo Listing currently installed apps (*DO NOT UNINSTALL ANY APP, IF YOU AREN'T SURE WHAT IT DOES.*)...
echo --------------------------------------------------------


for /f "tokens=2,*" %%A in ('reg query "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall" /s ^| findstr DisplayName') do (
    set "appKey=%%A"
    set "appDisplayName=%%B"

    
    reg query "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\!appKey!" /v SystemComponent >nul 2>&1
    if errorlevel 1 (
        echo [!appKey!] !appDisplayName!
    )
)

echo --------------------------------------------------------
echo.

set "uninstallApps="
set /p "uninstallApps=Enter the app(s) you want to uninstall (comma-separated, leave blank to move on): "


if not "%uninstallApps%"=="" (
    
    for %%A in ("%uninstallApps:,=" "%") do (
        :: Uninstall each app
        echo Uninstalling %%~A...
        start /wait "" powershell.exe -Command "Get-WmiObject -Query \"SELECT * FROM Win32_Product WHERE Name LIKE '%%~A%%'\" | ForEach-Object { $_.Uninstall() }"
        echo Uninstalled %%~A.
        timeout 2 > nul
        start "Disabling transparency effects, to improve performance." DisableTransparencyEffects.bat
    )
)

echo No problem, moving on...
timeout 2 > nul
 start "Disabling transparency effects, to improve performance." DisableTransparencyEffects.bat

