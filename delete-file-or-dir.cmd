@echo off


:: globals
set "PATH=O:\Cloud\_Code\Python\documentation"
::delete a single file, or perform a directory delete.
set "DELETE_FILE=false"





if %DELETE_FILE%=="false" (
:: delete a single file.
	del "\\?\%PATH%"
) else (
:: delete a directory.
	rd /s "\\?\%PATH%"
)