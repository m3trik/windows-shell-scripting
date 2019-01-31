@if (@X)==(@Y) @end /* JScript comment
@echo off


:: C:\Program Files\Autodesk\<version>\bin\mayapy.exe needs to be added to PATH environment variable.
:: The initialize routine takes only one parameter (name), and it is optional. The name parameter tells Maya what the name of the application is. The default value for name is python.


:: name of temp file that will perform the imports and the module to import.
set "TMP=__mayapy__.py"
set "TAB=	"

:: create a temp python file to import maya standalone and run specified the python module.
(
echo import maya.standalone
echo.
echo maya.standalone.initialize(name='python'^)
echo.
echo import userSetup
echo import keyboard
echo.
echo hotkey = 'f12' #define hot-key
echo.
echo def event(^):
echo %TAB%if 'tk' not in locals(^) or 'tk' not in globals(^): import tk_main; tk = tk_main.createInstance(^)
echo %TAB%if not tk.isVisible(^): tk.show(^)
echo.
echo keyboard.add_hotkey(hotkey, event^) #attach the function to hot-key
echo.
echo maya.standalone.uninitialize(^)
)> %tmp%

:: run the temp file
mayapy.exe %tmp%


PAUSE



:: delete the temp file
echo delete: %tmp%
del /f %tmp%



PAUSE