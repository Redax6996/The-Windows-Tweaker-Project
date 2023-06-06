@echo off

echo Disabling SysMain (SuperFetch) service...
sc stop SysMain
sc config SysMain start=disabled

echo Disabling Windows Telemetry service...
sc stop DiagTrack
sc config DiagTrack start=disabled

echo Preventing windows from collecting and sending unnecessary data (1)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f

echo Preventing windows from collecting and sending unnecessary data (2)
reg add "HKCU\SOFTWARE\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v PrivacyConsent /t REG_DWORD /d 0 /f

echo Preventing windows from collecting and sending unnecessary data (3)
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v RestrictImplicitInkCollection /t REG_DWORD /d 1 /f

echo Disabling search indexing...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowSearchToUseLocation /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v DisableWebSearch /t REG_DWORD /d 1 /f

echo Enabling clear page file at shutdown...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "ClearPageFileAtShutdown" /t REG_DWORD /d 1 /f
echo All done! Your data on this device is now YOURS(oh, and the performance has also been increased). Moving on....
timeout 2 >  nul
start "Disabling telemetry tasks" telemetry.bat
exit
