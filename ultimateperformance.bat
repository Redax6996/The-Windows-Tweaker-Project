@echo off

echo Enabling the Ultimate Performance power plan...

powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61

powercfg -setactive e9a42b02-d5df-448d-aa00-03f14749eb61

echo The Ultimate Performance power plan has been enabled.
echo Note: Your PC will now consume more electricity than before, in order to improve performance. If you do not want that, you can undo this tweak later.
echo Moving on...please do not exit this window.

timeout 14 > nul
start "Final optimization 1" finalOpti1.bat
