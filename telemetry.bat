@echo off

echo Disabling telemetry for Microsoft Office...
reg add "HKCU\Software\Microsoft\Office\Common\Feedback" /v FeedbackToolEnabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Office\Common\Feedback" /v FeedbackToolEnabledWithDialog /t REG_DWORD /d 0 /f >nul 2>&1
echo Telemetry disabled for Microsoft Office.

echo Disabling telemetry for NVIDIA...
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\NvTmMon" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\NvTmRep" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
echo Telemetry disabled for NVIDIA.

echo Disabling telemetry for AMD...
reg add "HKCU\Software\AMD\AMDLink\Services\Telemetry" /v "Consent" /t REG_DWORD /d 0 /f >nul 2>&1
echo Telemetry disabled for AMD.

echo Disabling telemetry for Intel...
reg add "HKCU\Software\Intel\DPTF\Participant\TPTF" /v "DisableOnlineTelemetry" /t REG_DWORD /d 1 /f >nul 2>&1
echo Telemetry disabled for Intel.

echo Disabling telemetry for Chrome...
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "MetricsReportingEnabled" /t REG_DWORD /d 0 /f >nul 2>&1
echo Telemetry disabled for Chrome.

echo Disabling telemetry for Firefox...
reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "DataReportingEnabled" /t REG_DWORD /d 0 /f >nul 2>&1
echo Telemetry disabled for Firefox.

echo Disabling telemetry for Edge...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "DisableTelemetry" /t REG_DWORD /d 1 /f >nul 2>&1
echo Telemetry disabled for Edge.

echo Almost all sorts of app telemetry have been disabled. Your privacy has been enhanced further. Moving on...
timeout 2 > nul
start "Enabling the Ultimate Performance power plan" ultimateperformance.bat

