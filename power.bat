@echo off

echo Disabling power throttling...

:: Disable power throttling
powercfg /SETDCVALUEINDEX SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMAX 100
powercfg /SETACVALUEINDEX SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMAX 100

echo Power throttling has been disabled. Moving on...
timeout 2 > nul
start "Print and Fax service" print+fax.bat
exit