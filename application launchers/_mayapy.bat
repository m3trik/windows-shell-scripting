@if (@X)==(@Y) @end /* JScript comment
@echo off


:: C:\Program Files\Autodesk\<version>\bin\mayapy.exe needs to be added to PATH environment variable.
:: The initialize routine takes only one parameter (name), and it is optional. The name parameter tells Maya what the name of the application is. The default value for name is python.


:: name of temp file that will perform the imports and the module to import.
set "TMP=__mayapy.py"
set "TAB=	"

:: create a temp python file to import maya standalone and run any additional modules.
(
echo import maya.standalone
echo maya.standalone.initialize(name='python'^)
echo import userSetup
:: echo.
:: echo maya.standalone.uninitialize(^)
)> %tmp%



:: run the temp file
mayapy.exe %tmp%


PAUSE



:: delete the temp file
echo delete: %tmp%
del /f %tmp%



PAUSE