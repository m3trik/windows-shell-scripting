@ECHO OFF
CLS
REM create or remove photoshop junctions
;comment

ECHO	1- Create Photoshop Junctions
ECHO	2- Delete Photoshop Junctions
ECHO	3- Exit

CHOICE /C:123

IF ERRORLEVEL 3 goto exit
IF ERRORLEVEL 2 goto remove
IF ERRORLEVEL 1 goto create


:create
mklink /J "%USERPROFILE%\AppData\Roaming\Adobe\Adobe Photoshop CC 2015\Plug-ins" "%CLOUD%\____Graphics\_Texturing\Photoshop\preferences\___AppData [-J]\Plug-ins"
mklink /J "%USERPROFILE%\AppData\Roaming\Adobe\Adobe Photoshop CC 2015\Presets"  "%CLOUD%\____Graphics\_Texturing\Photoshop\preferences\___AppData [-J]\Presets"

mklink /J "%USERPROFILE%\AppData\Roaming\Adobe\Adobe Photoshop CC 2017\Plug-ins" "%CLOUD%\____Graphics\_Texturing\Photoshop\preferences\___AppData [-J]\Plug-ins"
mklink /J "%USERPROFILE%\AppData\Roaming\Adobe\Adobe Photoshop CC 2017\Presets"  "%CLOUD%\____Graphics\_Texturing\Photoshop\preferences\___AppData [-J]\Presets"
PAUSE
EXIT

:remove
RMDIR "%USERPROFILE%\AppData\Roaming\Adobe\Adobe Photoshop CC 2015\Plug-ins"
RMDIR "%USERPROFILE%\AppData\Roaming\Adobe\Adobe Photoshop CC 2015\Presets"

RMDIR "%USERPROFILE%\AppData\Roaming\Adobe\Adobe Photoshop CC 2017\Plug-ins"
RMDIR "%USERPROFILE%\AppData\Roaming\Adobe\Adobe Photoshop CC 2017\Presets"
PAUSE
EXIT

:exit
CLS
