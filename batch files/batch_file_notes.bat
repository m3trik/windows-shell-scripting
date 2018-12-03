@ECHO OFF

REM	command reference A-Z: https://technet.microsoft.com/en-us/library/bb490890.aspx
rem get help on a command: ex. command /?

EXIT

rem print statement --------------------------
ECHO.	print blank line
ECHO	print


rem commenting -------------------------------
;comment
rem comment



GOTO	rem go to :exit (spaces allowed but not other separators (semicolons,equal signs). Uses only the first eight characters)

:exit
CLS	#clears the screen

BREAK=ON	rem stop if the user presses < Ctrl >-< Break >
BREAK=OFF	rem continue until done


rem time -------------------------------------

PAUSE				rem stop execution of the batch file until someone presses a key, then continue.

SLEEP				rem ex. SLEEP 10 (In seconds)

TIMEOUT			rem ex. TIMEOUT 10 or TIMEOUT /t 10 (in seconds). If the user does press a key at any point, execution will resume immediately.




rem operands ---------------------------------

*multiply		rem ex. set /a sum1="num1 * num2"





rem strings ----------------------------------

rem concatenate:
set variable= str1 str2 str3






rem variables --------------------------------

rem **the space before and after = is interpreted as part of the value.
rem variable=value   not varible = value unless a whitespace before the value is intended

rem assign variable:
set "variable=.proj"

rem assign empty variable:
set variable=

rem prompt user assigned
set /p variable= Printed text prompt string

rem expression result as variable
set /a variable=expression 

rem call variable:
%variable%



rem Windows environment variables:

%userprofile%	=C:\Users\<username>
%systemroot%	=C:WINDOWS
%temp% or %tmp%	=%USERPROFILE%\AppData\Local\Temp
%username%	=<username>
%homedrive%	=C:
%homepath%	=\Users\<username>
%systemdrive%	=C:
%public%	=C:Users\Public
%appdata%	=C:Users\<username>\AppData\Roaming
%localappdata%	=C:Users\<username>\AppData\Local
%programdata%	=C:ProgramData
%programfiles%	=C:Program Files
%programfiles(x86)%
%computername%




rem conditionals -----------------------------

rem if statement:
if %choice%==[%1]==[] goto start
if /i %choice%==one goto one
if /i %choice%==two goto two
if /i %choice%==end goto end





rem reg keys ---------------------------------

rem delete key
reg delete "HKCU\Some\Registry\Path" /f
rem alt:
[-HKEY_LOCAL_MACHINE\SOFTWARE\YourSoft\MyKey]
rem to remove an entry, place a minus "-" after the = char
[HKEY_LOCAL_MACHINE\SOFTWARE\YourSoft\MyKey]
"MyEntry"=-

