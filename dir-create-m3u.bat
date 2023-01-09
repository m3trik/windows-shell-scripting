@ECHO OFF
ECHO This script will create an m3u playlist from any mp3 or flac files in the given directory.
ECHO/

:: prompt the user for the drive location.
ECHO Specify the directory containing the music files:
set /p "dir="
ECHO/

:: change the current working dir (account for networked drive).
pushd %dir%

:: get name of the dir in order to name the playlist.
for %%I in (.) do set dir_name=%%~nxI

:: create the playlist.
for /f "tokens=2*" %%i in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Nls\CodePage" /v "ACP"') do set /a acp=%%j 2>nul
>nul chcp %ACP%
dir /o:n /b *.mp3 *.flac > %dir_name%.m3u

ECHO %dir_name%.m3u created successfully.
PAUSE