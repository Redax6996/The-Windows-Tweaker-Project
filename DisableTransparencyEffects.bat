@echo off

echo Disabling transparency effects...obviously to speed up your computer

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f

echo Transparency effects have been disabled. Moving on....
timeout 2 > nul
start regbackup.bat
exit