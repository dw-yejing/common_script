@echo off
setlocal enabledelayedexpansion

rem set source folder and output file
set "source_folder=%~dp0gnu_core_utilities"
set "output_file=%~dp0powershell_profile.txt"

rem check source folder exist
if not exist "%source_folder%" (
    echo error: source folder not exist!
    pause
    exit /b 1
)

rem create or clear output file
echo. > "%output_file%"

rem traverse all files in folder and subfolders
echo processing files...

for %%f in ("%source_folder%\*.*") do (
    echo processing: %%~nxf
    
    echo ========================================== >> "%output_file%"
    type "%%f" >> "%output_file%"
    echo. >> "%output_file%"
    echo. >> "%output_file%"
)

echo completed!
pause
