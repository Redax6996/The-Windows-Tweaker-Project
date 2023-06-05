@echo off

echo Disabling animations in Windows 11...

:: Disable window animations
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 90,12,01,80,10,00,00,00,04,00,00,00,00,00,00,00 /f

:: Disable menu animations
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v MenuShowDelay /t REG_SZ /d 0 /f

echo Animations have been disabled. Moving on......
timeout 2 > nul
start "Uninstall Bloatware" bloatware.bat
