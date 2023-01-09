@ECHO OFF
:: pip installs a given module to mayapy.
:: pip needs to already have been installed to mayapy.

:: globals
ECHO Give the name of the module to install:
set /p module=
ECHO/
ECHO Maya version? (ex. 2022)
set /p maya_version=
set mayapy="C:\Program Files\Autodesk\Maya%maya_version%\bin\mayapy.exe"
ECHO/
echo %mayapy%

%mayapy% -m pip install %module%



PAUSE