@echo off
setlocal enabledelayedexpansion


set "source_dir=C:\path\to\files"
set "archive_dir=Z:\archive"
set "sorted_dir=%archive_dir%\sorted_by_size"

if not exist "%archive_dir%" mkdir "%archive_dir%"
if not exist "%sorted_dir%" mkdir "%sorted_dir%"

echo Archiving and sorting text files...


for %%f in (%source_dir%\*.txt) do (
    xcopy "%%f" "%archive_dir%" /D /Y
)


for %%f in (%archive_dir%\*.txt) do (
    copy "%%f" "%sorted_dir%" /Y
)

echo Files have been archived and sorted by size.
dir "%sorted_dir%" /O:S


set /p confirm="Do you want to delete the old, large files? (YES/NO): "
if /i %confirm%==YES (
    del "%sorted_dir%\*"
    echo Old, large files have been deleted.
) else (
    echo Deletion operation cancelled.
)

echo Script completed.
pause