@echo off
setlocal ENABLEEXTENSIONS

:: Get current date and time for the backup folder name
for /f %%a in ('wmic os get localdatetime ^| find "."') do set datetime=%%a
set datetime=%datetime:~0,4%-%datetime:~4,2%-%datetime:~6,2%_%datetime:~8,2%-%datetime:~10,2%

:: Define destination backup folder on the USB drive (same as script location)
set scriptpath=%~dp0
set backupfolder=%scriptpath%backups\%datetime%

:: Get user profile path
set userprofile=%USERPROFILE%

:: Create the backup folder
mkdir "%backupfolder%"

echo Backing up Desktop, Documents, Downloads, and Videos...

xcopy "%userprofile%\Desktop" "%backupfolder%\Desktop" /E /I /H /C /Y
xcopy "%userprofile%\Documents" "%backupfolder%\Documents" /E /I /H /C /Y
xcopy "%userprofile%\Downloads" "%backupfolder%\Downloads" /E /I /H /C /Y
xcopy "%userprofile%\Videos" "%backupfolder%\Videos" /E /I /H /C /Y

echo Backup complete!
pause
