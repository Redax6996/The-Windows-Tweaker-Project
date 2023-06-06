@echo off
regedit /s "ImprovePerformance.reg"
regedit /s "impPer2.reg"
echo Operation completed! Moving on...
timeout 2 > nul
start "Virtual Machines" novms.bat