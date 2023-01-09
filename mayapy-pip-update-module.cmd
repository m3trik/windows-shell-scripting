@ECHO OFF
:: This script will pip install a given module to mayapy.
:: Requires pip to have already been installed to mayapy.
ECHO/

:: 
ECHO Give the name of the module to update:
set /p module=
ECHO/
ECHO Maya version? (ex. 2022)
set /p maya_version=
set mayapy="C:\Program Files\Autodesk\Maya%maya_version%\bin\mayapy.exe"
ECHO/
echo %mayapy%

set scripts_path="%APPDATA%/Python/Python37/Scripts"
rem SET PATH=%PATH%;%scripts_path%
rem ECHO.%scripts_path% added to system path.

%mayapy% %scripts_path%/pip.exe install --upgrade %module%



PAUSE