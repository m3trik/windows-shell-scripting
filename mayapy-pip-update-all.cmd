@ECHO OFF
:: pip installs a given module to mayapy.
:: pip needs to already have been installed to mayapy.

:: globals
ECHO Maya version? (ex. 2022)
set /p maya_version=
set mayapy="C:\Program Files\Autodesk\Maya%maya_version%\bin\mayapy.exe"

set "scripts_path=%APPDATA%/Python/Python37/Scripts"
rem SET PATH=%PATH%;%scripts_path%
rem ECHO.%scripts_path% added to system path.

ECHO/
echo Python location: %mayapy%
echo Pip location: %scripts_path%/pip.exe
ECHO/

set cmd=%mayapy% %scripts_path%/pip.exe

:: none of these commands are working:
rem %cmd% freeze --local |sed -rn 's/^([^=# \t\\][^ \t=]*)=.*/echo; echo Processing \1 ...; %cmd% install -U \1/p' |sh
rem %cmd% list --outdated --format=legacy | ForEach { %cmd% install -U $_.split(" ")[0] }
rem %cmd% --disable-pip-version-check list --outdated --format=json | python -c "import json, sys; print('\n'.join([x['name'] for x in json.load(sys.stdin)]))"
rem %_pip% freeze | %{$_.split('==')[0]} | %{%_pip% install --upgrade $_}


PAUSE