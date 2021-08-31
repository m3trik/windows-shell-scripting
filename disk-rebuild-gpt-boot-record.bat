@echo OFF
cls

::print disk info
wmic logicaldisk get Name, VolumeName, VolumeSerialNumber, CreationClassName, Size, Description, DriveType, FileSystem, FreeSpace, MediaType
wmic diskdrive get Model, InterfaceType, Size, DeviceID, SerialNumber


::set the disk number. ie. 0
echo This script will create new GPT EFI and reserved boot partitions.
echo This script must be run with elevated privaleges.
echo.
set /p DNUM=Disk number [ie. 0]? 
rem echo.
rem set /p WPNUM=Windows partition number ? 

(echo rescan
echo select disk %DNUM%
echo list partition
)  | diskpart

echo.
set /p DPNUM=System boot partition number [typically 1]? 

(echo rescan
echo select disk %DNUM%
echo select partition %DPNUM%
echo delete partition
echo create partition EFI size=100 offset=1
echo format quick fs=fat32 label="System"
echo assign letter=S
echo create partition msr size=128
echo list partition
)  | diskpart

rem bcdboot c:\windows /s s: /f UEFI

pause