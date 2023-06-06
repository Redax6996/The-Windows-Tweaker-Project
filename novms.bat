@echo off
set /p response=Do you use virtual machines on this device? (yes/no): 

if /i "%response%"=="no" (
    echo Checking and disabling virtual machine features...
    
    %SystemRoot%\System32\dism.exe /Online /Get-FeatureInfo /FeatureName:Microsoft-Hyper-V >nul 2>&1
    if %errorlevel% equ 0 (
        echo Disabling Hyper-V...
        %SystemRoot%\System32\dism.exe /Online /Disable-Feature /FeatureName:Microsoft-Hyper-V /NoRestart
    )
    
    %SystemRoot%\System32\dism.exe /Online /Get-FeatureInfo /FeatureName:VirtualMachinePlatform >nul 2>&1
    if %errorlevel% equ 0 (
        echo Disabling Virtual Machine Platform...
        %SystemRoot%\System32\dism.exe /Online /Disable-Feature /FeatureName:VirtualMachinePlatform /NoRestart
    )
    
    %SystemRoot%\System32\dism.exe /Online /Get-FeatureInfo /FeatureName:HypervisorPlatform >nul 2>&1
    if %errorlevel% equ 0 (
        echo Disabling Windows Hypervisor Platform...
        %SystemRoot%\System32\dism.exe /Online /Disable-Feature /FeatureName:HypervisorPlatform /NoRestart
    )
    
    %SystemRoot%\System32\dism.exe /Online /Get-FeatureInfo /FeatureName:Microsoft-Windows-Subsystem-Linux >nul 2>&1
    if %errorlevel% equ 0 (
        echo Disabling Windows Subsystem for Linux...
        %SystemRoot%\System32\dism.exe /Online /Disable-Feature /FeatureName:Microsoft-Windows-Subsystem-Linux /NoRestart
    )
    
    echo All virtual machine features disabled. Moving on....
	timeout 2 > nul
	start "Disabling power throttling" power.bat
) else (
    echo No issues, moving on....
	timeout 2 > nul 
	start "Disabling power throttling" power.bat
	exit
)
