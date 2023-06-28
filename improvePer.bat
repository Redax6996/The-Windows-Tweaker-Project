@echo off
regedit /s "ImprovePerformance.reg"
regedit /s "impPer2.reg"

setlocal enabledelayedexpansion


set "excluded_services=WinRM SecurityHealthService"


for /F "tokens=1-3" %%A in ('sc query state^=all ^| findstr "SERVICE_NAME STATE"') do (
    set "service_name=%%B"
    set "service_state=%%C"

    
    if "!excluded_services:%%B=!"=="!excluded_services!" if "!service_state!" neq "DISABLED" (
        
        sc config "!service_name!" start= demand
        echo Service "!service_name!" set to manual.
    )
)





echo Operation completed! Moving on...
timeout 2 > nul
start "Virtual Machines" novms.bat
