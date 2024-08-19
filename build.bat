@echo off
setlocal enabledelayedexpansion

REM Set the mod name and paths
set MOD_NAME=FS22_ProductionLineManager
set MODS_DIR=..\..\mods
set MOD_DESC=modDesc.xml
set ZIP_FILE=%MODS_DIR%\%MOD_NAME%.zip

REM Ensure the mods directory exists
if not exist "%MODS_DIR%" (
    mkdir "%MODS_DIR%"
)

@REM REM Increment the build number in the modDesc.xml
@REM for /f "tokens=1,2,3 delims=." %%a in ('findstr /i "<version>" "%MOD_DESC%"') do (
@REM     set major=%%a
@REM     set minor=%%b
@REM     set build=%%c
@REM     set /a build+=1
@REM     set new_version=!major!.!minor!.!build!
@REM )

@REM REM Update the version number in modDesc.xml
@REM powershell -command "(gc %MOD_DESC%) -replace '<version>[0-9]+\.[0-9]+\.[0-9]+\.0</version>', '!new_version!.0</version>' | sc %MOD_DESC%"

REM Zip the files
if exist "%ZIP_FILE%" (
    del "%ZIP_FILE%"
)

"C:\Program Files\7-Zip\7z.exe" a -tzip "%ZIP_FILE%" *

REM Display the new version number
echo Build completed.
@REM  New version: !new_version!
endlocal
