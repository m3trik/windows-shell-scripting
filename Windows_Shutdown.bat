@echo OFF

cls
rem Shutdown MS-DOS options menu.
rem	dependancies: C:\Windows\System32\ nircmd.exe, PsShutdown.exe

rem set ERRORLEVEL=0
goto startCode

:startCode
echo	1- Screensaver
echo	2- Restart /Advance Boot
echo	3- Sleep
echo	4- Sleep Timer
echo	5- Hibernate
echo	6- Hibernate Timer
echo	7- Log Off
echo	8- Turn Off Display
echo	R- Restart
echo	S- Shutdown
echo	A- Abort

choice /C:12345678rsa

if errorlevel A goto abort
if errorlevel S goto shutdown_
if errorlevel R goto restart
if errorlevel 8 goto turnOffDisplay
if errorlevel 7 goto logoff_
if errorlevel 6 goto setHibernateTimer
if errorlevel 5 goto hibernate
if errorlevel 4 goto setSleepTimer
if errorlevel 3 goto sleep
if errorlevel 2 goto restartAdvancedBoot
if errorlevel 1 goto screensaver



:restart
shutdown /r /c "restarting" /t 5
timeout /t 5

echo	A- Abort
echo	E- Exit

choice /C:ae

if errorlevel 1 goto abort else exit
exit

:restartAdvancedBoot
shutdown /r /o /c "restarting to advanced boot option menu"
exit

:sleep
rem $ Powercfg -H OFF
rem Rundll32.exe Powrprof.dll,SetSuspendState Sleep
C:\Windows\System32\psshutdown.exe -d -t 0 -accepteula
exit

:setSleepTimer
echo	M- Minuites
echo	H- Hours 

choice /C:mh

if errorlevel 2 goto sleepHours
if errorlevel 1 goto sleepMinutes

:sleepMinutes
set /p sleepTimer=Set timer (minuites):
Set /a timer="%sleepTimer% *60"
rem $ Powercfg -H OFF
rem rundll32.exe powrprof.dll,SetSuspendState 0,1,0
echo Sleep set for %sleepTimer% minuites.
goto sleepExecute

:sleepHours
set /p sleepTimer=Set timer (minuites):
Set /a timer="%sleepTimer% *3600"
rem $ Powercfg -H OFF
rem rundll32.exe powrprof.dll,SetSuspendState 0,1,0
echo Sleep set for %sleepTimer% minuites.
goto sleepExecute

:sleepExecute
C:\Windows\System32\psshutdown.exe -d -t %timer% -accepteula
timeout /t %timer%
exit

:hibernate
shutdown /h
exit

:setHibernateTimer
echo	M- Minuites
echo	H- Hours 

choice /C:mh

if errorlevel 2 goto hibernateHours
if errorlevel 1 goto hibernateMinutes

:hibernateMinutes
set /p hibernateTimer=Set timer (minuites):
Set /a timer="%hibernateTimer% *60"
echo Hibernate set for %hibernateTimer% minuites.
goto hibernateExecute

:hibernateHours
set /p hibernateTimer=Set timer (hours):
Set /a timer="%hibernateTimer% *3600"
echo Hibernate set for %hibernateTimer% hours.
goto hibernateExecute

:hibernateExecute
shutdown /s /t %timer%
timeout /t %timer%
exit

:logoff_
shutdown /l /c "logging off current user" /t 2
exit

:turnOffDisplay
nircmd monitor off
exit

:screensaver
nircmd screensaver
exit

:shutdown_
shutdown /s /c "shutting down" /t 30
timeout /t 30

echo	A- Abort
echo	E- Exit

choice /C:ae

if errorlevel 1 goto abort else exit
exit

:abort
shutdown /a
exit

:exit
exit





rem Documentation-------------------------
rem PsShutdown.exe -----------------------

rem You can use PsShutdown to initiate a shutdown of the local or a remote computer, logoff a user, lock a system, or to abort an imminent shutdown.

rem Usage: psshutdown [[\\computer[,computer[,..] | @file [-u user [-p psswd]]] -s|-r|-h|-d|-k|-a|-l|-o [-f] [-c] [-t nn|h:m] [-n s] [-v nn] [-e [u|p]:xx:yy] [-m "message"]

rem Parameter	Description
rem -	Displays the supported options.
rem computer	Perform the command on the remote computer or computers specified. If you omit the computer name the command runs on the local system, and if you specify a wildcard (\\*), the command runs on all computers in the current domain.
rem @file	Run the command on each computer listed in the text file specified.
rem -u	Specifies optional user name for login to remote computer.
rem -p	Specifies optional password for user name. If you omit this you will be prompted to enter a hidden password.
rem -a	Aborts a shutdown (only possible while a countdown is in progress).
rem -c	Allows the shutdown to be aborted by the interactive user.
rem -d	Suspend the computer.
rem -e	Shutdown reason code. 
rem Specify 'u' for user reason codes and 'p' for planned shutdown reason codes. 
rem xx is the major reason code (must be less than 256). 
rem yy is the minor reason code (must be less than 65536).
rem -f	Forces all running applications to exit during the shutdown instead of giving them a chance to gracefully save their data.
rem -h	Hibernate the computer.
rem -k	Poweroff the computer (reboot if poweroff is not supported).
rem -l	Lock the computer.
rem -m	This option lets you specify a message to display to logged-on users when a shutdown countdown commences.
rem -n	Specifies timeout in seconds connecting to remote computers.
rem -o	Logoff the console user.
rem -r	Reboot after shutdown.
rem -s	Shutdown without power off.
rem -t	Specifies the countdown in seconds until the shutdown (default: 20 seconds) or the time of shutdown (in 24 hour notation).
rem -v	Display message for the specified number of seconds before the shutdown. If you omit this parameter the shutdown notification dialog displays and specifying a value of 0 results in no dialog.


rem Shutdown.exe ---------------------------

rem Usage: shutdown [/i | /l | /s | /r | /g | /a | /p | /h | /e] [/f]
rem     [/m \\computer][/t xxx][/d [p|u:]xx:yy [/c "comment"]]

rem     No args    Display help. This is the same as typing /?.
rem     /?         Display help. This is the same as not typing any options.

rem     /i         Display the graphical user interface (GUI).(This must be the first option.)

rem     /l         Log off. This cannot be used with /m or /d options.

rem     /s         Shutdown the computer.
rem     /r         Shutdown and restart the computer.
rem     /g         Shutdown and restart the computer. After the system is rebooted, restart any registered applications.
rem     /a         Abort a system shutdown. (This can only be used during the time-out period.)
rem     /p         Turn off the local computer with no time-out or warning.(Can be used with /d and /f options.)

rem     /h         Hibernate the local computer. Can be used with the /f option.

rem     /e         Document the reason for an unexpected shutdown of a computer.

rem     /m  \\computer Specify the target computer.
rem     /t  xxx     Set the time-out period before shutdown to xxx seconds.(The valid range is 0-315360000 (10 years), with a default of 30. If the timeout period is greater than 0, the /f parameter is implied.)
rem     /c  "comment" Comment on the reason for the restart or shutdown.(Maximum of 512 characters allowed.)
rem     /f  Force running applications to close without forewarning users.(The /f parameter is implied when a value greater than 0 is specified for the /t parameter.)


rem NirCmd.exe -----------------------------

rem Turn off the monitor	nircmd.exe monitor off

rem Turn off your computer	nircmd.exe exitwin poweroff
rem Turn off all computers specified in computers.txt !	multiremote copy "c:\temp\computers.txt" exitwin poweroff force

rem Computer in 'standby' mode	nircmd.exe standby

rem log off the current user	nircmd.exe exitwin logoff

rem Ask if you want to reboot, and if you answer 'Yes', reboot the computer.	nircmd.exe qboxcom "Do you want to reboot ?" "question" exitwin reboot

rem screen saver	nircmd.exe screensaver
rem Disable the screen saver	nircmd.exe regsetval sz "HKCU\control panel\desktop" "ScreenSaveActive" 0
rem Enable the screen saver	nircmd.exe regsetval sz "HKCU\control panel\desktop" "ScreenSaveActive" 1

rem Empty the recycle bin in all drives.	nircmd.exe emptybin
rem Answer 'Yes' to a standard Windows message-box.	nircmd.exe dlg "" "" click yes