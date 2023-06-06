@echo off
set /p useFax=Do you use the Windows Fax service? (yes/no): 

if /i "%useFax%"=="yes" (
    set /p usePrint=Do you use a printer? (yes/no): 
    
    if /i "%usePrint%"=="yes" (
        echo No problem, moving on....
		timeout 2 > nul
		start "Improving your Internet speed" Network.bat
		
    ) else (
        echo Disabling the Print service...
        sc config spooler start=disabled
        echo The Print service has been disabled.
        timeout 2 > nul 
		start "Improving your privacy AND performance" Privacy+Performance.bat
		
    )
) else (
    echo Disabling the Windows Fax service...
    sc config fax start=disabled
    echo The Windows Fax service has been disabled.
     timeout 2 > nul 
		start "Improving your privacy AND performance" Privacy+Performance.bat
		
)
