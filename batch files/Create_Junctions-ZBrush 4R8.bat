@ECHO OFF
CLS
ECHO	**If you have not already, you must first delete or zip original folders in default program directory so that the script is able to populate a new junction link in its place.**
ECHO.
ECHO	1- create zbrush junctions
ECHO	2- remove zbrush junctions
ECHO	3- exit
;comment

CHOICE /C:123

IF ERRORLEVEL 3 goto exit
IF ERRORLEVEL 2 goto remove
IF ERRORLEVEL 1 goto create



:create
mklink /J "C:\Program Files (x86)\Pixologic\ZBrush 4R7\ZProjects" "%CLOUD%\____Graphics\______project_files"

mklink /J "C:\Program Files (x86)\Pixologic\ZBrush 4R7\ZScripts" "%CLOUD%\____Graphics\Zbrush\__Zscripts\___Zscripts [-J]"

mklink /J "C:\Program Files (x86)\Pixologic\ZBrush 4R7\ZStartup\ZPlugs" "%CLOUD%\____Graphics\Zbrush\__Plug-ins\___ZPlugs [-J]"

mklink /J "C:\Program Files (x86)\Pixologic\ZBrush 4R7\ZStartup\ZPlugs64" "%CLOUD%\____Graphics\Zbrush\__Plug-ins\___ZPlugs64 [-J]"

mklink /J "C:\Program Files (x86)\Pixologic\ZBrush 4R7\ZStartup\BrushPresets" "%CLOUD%\____Graphics\Zbrush\brushes\___Brush Presets [-J]"

PAUSE
EXIT


:remove
RMDIR	"C:\Program Files (x86)\Pixologic\ZBrush 4R7\ZProjects"

RMDIR	"C:\Program Files (x86)\Pixologic\ZBrush 4R7\ZScripts"

RMDIR	"C:\Program Files (x86)\Pixologic\ZBrush 4R7\ZStartup\ZPlugs"

RMDIR	"C:\Program Files (x86)\Pixologic\ZBrush 4R7\ZStartup\ZPlugs64"

RMDIR	"C:\Program Files (x86)\Pixologic\ZBrush 4R7\ZStartup\BrushPresets"

PAUSE
EXIT


:exit
CLS