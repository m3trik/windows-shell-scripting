@echo OFF
cls


::print disk info
wmic logicaldisk get Name, VolumeName, VolumeSerialNumber, CreationClassName, Size, Description, DriveType, FileSystem, FreeSpace, MediaType
wmic diskdrive get Model, Size, InterfaceType, DeviceID, SerialNumber



::set the serial of the drive to be modified.
echo This script will convert an existing MBR partition to GPT using MBR2GPT.
echo This script must be run with elevated privaleges.
echo.
set /p DN=Disk number ?

mbr2gpt /convert /disk:%DN% /allowfullos



pause