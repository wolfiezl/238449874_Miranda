@echo off
setlocal enabledelayedexpansion

:MENU
echo Select a utility to execute:
echo 1. ipconfig
echo 2. tasklist
echo 3. taskkill
echo 4. chkdsk
echo 5. format
echo 6. defrag
echo 7. find
echo 8. attrib
set /p choice="Enter the number corresponding to your choice: "

if %choice%==1 goto IPCONFIG
if %choice%==2 goto TASKLIST
if %choice%==3 goto TASKKILL
if %choice%==4 goto CHKDSK
if %choice%==5 goto FORMAT
if %choice%==6 goto DEFRAG
if %choice%==7 goto FIND
if %choice%==8 goto ATTRIB
echo Invalid selection. Please try again.
goto MENU

:IPCONFIG
ipconfig
goto END

:TASKLIST
tasklist
goto END

:TASKKILL
set /p pid="Enter the PID of the process to kill: "
taskkill /PID %pid%
goto END

:CHKDSK
set /p drive="Enter the drive letter to check (e.g., C:): "
chkdsk %drive%
goto END

:FORMAT
set /p drive="Enter the drive letter to format (e.g., D:): "
echo WARNING: Formatting will erase all data on %drive%
set /p confirm="Type 'YES' to confirm: "
if /i %confirm%==YES (
    format %drive%
) else (
    echo Format operation cancelled.
)
goto END

:DEFRAG
set /p drive="Enter the drive letter to defrag (e.g., C:): "
defrag %drive%
goto END

:FIND
set /p search="Enter the string to search for: "
set /p filename="Enter the filename to search in: "
find "%search%" %filename%
goto END

:ATTRIB
set /p filename="Enter the filename to change attributes: "
set /p attributes="Enter the attributes to set (e.g., +r -h): "
attrib %attributes% %filename%
goto END

:END
echo Script completed.
pause