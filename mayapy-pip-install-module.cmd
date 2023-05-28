@ECHO OFF
:: pip install a given module to mayapy.
:: pip needs to already have been installed to mayapy.


:setVersion
ECHO Maya version? (ex. 2022)
set /p maya_version=
set mayapy="C:\Program Files\Autodesk\Maya%maya_version%\bin\mayapy.exe"
ECHO/
echo %mayapy%


:setModule
ECHO/
ECHO Give the name of a module to install:
set /p module=
ECHO/


:install
%mayapy% -m pip install %module%

goto setModule