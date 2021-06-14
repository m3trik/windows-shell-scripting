@echo off
:: This script runs the Deployment Image Servicing and Management (DISM) and the System File Checker (SFC) tool. DISM is useful to recover the replacement files needed by SFC in order to fix corrupted or missing system files.
:: This script must be run with elevated privaliges.

REM Use the System File Checker tool to repair missing or corrupted system files:

REM After the process is finished, you may receive one of the following messages:
REM Windows Resource Protection did not find any integrity violations.
REM This means that you do not have any missing or corrupted system files.
REM Windows Resource Protection could not perform the requested operation.
REM To resolve this problem, perform the System File Checker scan in safe mode, and make sure that the PendingDeletes and PendingRenames folders exist under %WinDir%\WinSxS\Temp.
REM Windows Resource Protection found corrupt files and successfully repaired them. Details are included in the CBS.Log %WinDir%\Logs\CBS\CBS.log.
REM To view the detail information about the system file scan and restoration, go to How to view details of the System File Checker process.
REM Windows Resource Protection found corrupt files but was unable to fix some of them. Details are included in the CBS.Log %WinDir%\Logs\CBS\CBS.log.
REM To repair the corrupted files manually, view details of the System File Checker process to find the corrupted file, and then manually replace the corrupted file with a known good copy of the file.


ECHO/
ECHO Executing: Deployment Image Servicing and Management (DISM) tool ...
ECHO/

DISM.exe /Online /Cleanup-image /Restorehealth


ECHO/
ECHO Executing: System File Checker tool (SFC.exe) ...
ECHO/

rem exec SFC check
sfc /scannow


rem exec DISM checks
dism /online /cleanup-image /scanhealth
dism /online /cleanup-image /checkhealth
dism /online /cleanup-image /restorehealth




PAUSE