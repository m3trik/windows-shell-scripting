@ECHO off

rem This script must be run with elevated privaleges.


set /p key=enter a 24 digit windows product key.
echo.

slmgr.vbs /ipk key