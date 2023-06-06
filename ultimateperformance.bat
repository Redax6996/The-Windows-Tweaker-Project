@echo off

echo Enabling the Ultimate Performance power plan...

powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61

powercfg -setactive e9a42b02-d5df-448d-aa00-03f14749eb61

echo The Ultimate Performance power plan has been enabled. Moving on...
timeout 2 > nul
start "Final optimization 1" finalOpti1.bat
