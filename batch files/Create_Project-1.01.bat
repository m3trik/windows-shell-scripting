@echo OFF
cls

goto variables


:setProjectName
SET /P projectName=Enter project name:
set projectSuffix=
rem # set subfolder prefix
set "subFolderPrefix=%projectName%"
set "directory=%folderLocation%\%projectName%%projectSuffix%"
goto create

:setOldProjName
SET /P projectName=Enter old project name:
set projectSuffix=
rem # set subfolder prefix
set "subFolderPrefix=%projectName%"
set "directory=%folderLocation%\%projectName%%projectSuffix%"
goto modify

:setNewProjName
SET /P newProjName=Enter new project name:
set newProjSuffix=
rem # set new subfolder prefix
set "newSubFolderPrefix=%newProjName%"
set "newDirectory=%folderLocation%\%newProjName%%projectSuffix%"
goto modify

:setNewFolderLocation
set /P folderLocation=%CLOUD%\____Graphics\______project_files"
goto main


:variables
rem # set new or existing project name:
set "projectName=name"
set "projectSuffix=.proj"
rem # set subfolder prefix
set "subFolderPrefix=%projectName%"

rem # modify current project using this name:
set "newProjName=new_name"
set "newProjSuffix=.proj"
rem # set new subfolder prefix
set "newSubFolderPrefix=%newProjName%"

rem # set folder location
set "folderLocation=%CLOUD%\____Graphics\______project_files"

rem do not modify below this line.
set "directory=%folderLocation%\%projectName%%projectSuffix%"
set "newDirectory=%folderLocation%\%newProjName%%projectSuffix%"



goto main


:main
cls
echo %folderLocation%
echo:
echo:
echo:
echo	1- Create New Project
echo	2- Modify Existing
echo	3- Change Working Directory
echo	4- Exit

choice /C:1234

if errorlevel 4 goto exit
if errorlevel 3 goto setNewFolderLocation
if errorlevel 2 goto modify
if errorlevel 1 goto create


:create
cls
echo **create: 
echo %folderLocation%\%projectName%
echo ?
echo:
echo	1- Continue
echo	2- Set project name
echo	3- Back
echo	4- Exit

choice /C:1234

if errorlevel 4 goto exit
if errorlevel 3 goto main
if errorlevel 2 goto setProjectName
if errorlevel 1 goto create-newproject



:create-newproject
cls
echo %directory%
echo "checking to see if directory exists..."

if exist %directory% ^
echo "...directory already exists."

if not exist %directory% ^
mkdir %directory% &^
echo "...directory created."
echo:



echo "checking for the existence of subdirectories..."
echo:



set "folderName=.images"
set "dir=%directory%\%subFolderPrefix%%folderName%"
rem echo %subFolderPrefix%%folderName%
rem echo %dir%
echo "checking to see if folder exists..."

if exist %dir%	^
echo "...folder already exists."

if not exist %dir%	^
mkdir %dir% &^
mkdir %dir%\.reference_images &^
mkdir %dir%\.screenshots &^
mkdir %dir%\.render &^
mkdir %dir%\.render\.arnold &^
mkdir %dir%\.render\.keyshot &^
mkdir %dir%\.render\.vray &^
mkdir %dir%\.render\.iray &^
echo "...folder and all subdirectories;  created."
echo:



set "folderName=.cameras"
set "dir=%directory%\%subFolderPrefix%%folderName%"
echo %subFolderPrefix%%folderName%
rem echo %dir%
echo ""checking to see if folder exists...""

if exist %dir%	^
echo "...folder already exists."

if not exist %dir%	^
mkdir %dir% &^
mkdir %dir%\.zapplink &^
echo "...folder and all subdirectories;  created."
echo:



set "folderName=.textures"
set "dir=%directory%\%subFolderPrefix%%folderName%"
echo %subFolderPrefix%%folderName%
rem echo %dir%
echo "checking to see if folder exists..."

if exist %dir%	^
echo "...%folderName% already exists."

if not exist %dir%	^
mkdir %dir% &^
mkdir %dir%\.procedural &^
mkdir %dir%\.bitmap &^
mkdir %dir%\.maps &^
mkdir %dir%\.maps\.normal(tangent) &^
mkdir %dir%\.maps\.normal(world_space) &^
mkdir %dir%\.maps\.ambient_occlusion &^
mkdir %dir%\.maps\.height &^
mkdir %dir%\.maps\.bump &^
mkdir %dir%\.maps\.curvature &^
mkdir %dir%\.maps\.thickness &^
mkdir %dir%\.maps\.position &^
mkdir %dir%\.maps\.diffuse &^
mkdir %dir%\.maps\.ID &^
mkdir %dir%\.maps\.opacity &^
mkdir %dir%\.maps\.displacement &^
mkdir %dir%\.maps\.specular &^
mkdir %dir%\.maps\.roughness &^
echo "...folder and all subdirectories;  created."
echo:



set "folderName=.animation"
set "dir=%directory%\%subFolderPrefix%%folderName%"
echo %subFolderPrefix%%folderName%
rem echo %dir%
echo "checking to see if folder exists..."

if exist %dir%	^
echo "...folder already exists."

if not exist %dir%	^
mkdir %dir% &^
mkdir %dir%\.frames &^
echo "...folder and all subdirectories; created."
echo:



set "folderName=.autosave"
set "dir=%directory%\%subFolderPrefix%%folderName%"
echo %subFolderPrefix%%folderName%
rem echo %dir%
echo "checking to see if folder exists..."

if exist %dir%	^
echo "...folder already exists."

if not exist %dir%	^
mkdir %dir% &^
echo "...folder and all subdirectories; created."
echo:



set "folderName=.audio"
set "dir=%directory%\%subFolderPrefix%%folderName%"
echo %subFolderPrefix%%folderName%
rem echo %dir%
echo "checking to see if folder exists..."

if exist %dir%	^
echo "...folder already exists."

if not exist %dir%	^
mkdir %dir% &^
echo "...folder and all subdirectories; created."
echo:



set "folderName=.scenes"
set "dir=%directory%\%subFolderPrefix%%folderName%"
echo %subFolderPrefix%%folderName%
rem echo %dir%
echo "checking to see if folder exists..."

if exist %dir%	^
echo "...&folderName% already exists."

if not exist %dir%	^
mkdir %dir% &^
mkdir %dir%\.maya &^
mkdir %dir%\.maya\.maya_assets &^
mkdir %dir%\.zbrush &^
mkdir %dir%\.zbrush\.zbrush_assets &^
mkdir %dir%\.3dsMax &^
mkdir %dir%\.3dsMax\.3dsMax_assets &^
mkdir %dir%\.obj &^
mkdir %dir%\.obj\.obj_assets &^
mkdir %dir%\.fbx &^
mkdir %dir%\.fbx\.fbx_assets &^
echo "...folder and all subdirectories; created."
echo:



set "folderName=.scripts"
set "dir=%directory%\%subFolderPrefix%%folderName%"
echo %subFolderPrefix%%folderName%
rem echo %dir%
echo "checking to see if folder exists..."

if exist %dir%	^
echo "...folder already exists."

if not exist %dir%	^
mkdir %dir% &^
echo "...folder and all subdirectories; created."
echo:



set "folderName=.uv"
set "dir=%directory%\%subFolderPrefix%%folderName%"
echo %subFolderPrefix%%folderName%
rem echo %dir%
echo "checking to see if folder exists..."

if exist %dir%	^
echo "...folder already exists."

if not exist %dir%	^
mkdir %dir% &^
echo "...folder and all subdirectories; created."
echo:



pause
exit



:modify
cls
echo **rename
rem echo from: %folderLocation%\%projectName%%projectSuffix%
echo from: %projectName%%projectSuffix%
rem echo to:   %folderLocation%\%newProjName%%newProjSuffix%
echo to:   %newProjName%%newProjSuffix%
echo ?
echo	1- Continue
echo	2- Back
echo	3- Set old project name
echo	4- Set new project name
echo	5- Exit

choice /C:12345

if errorlevel 5 goto exit
if errorlevel 4 goto setNewProjName
if errorlevel 3 goto setOldProjName
if errorlevel 2 goto main
if errorlevel 1 goto modify-rename



:modify-rename
cls
echo %directory%
echo "checking to see if directory exists..."
echo:

rem check if old directory exists
if not exist %directory% ^
echo "...directory not found." &^
echo: &^
goto error2

if exist %directory% ^
echo "...directory found:            %projectName%%projectSuffix%" &^
echo:
echo "...attempting to rename to:    %newProjName%%newProjSuffix%" &^
echo:
rem check. if new directory already exists, goto error1
if exist %folderLocation%\%newProjName%%newProjSuffix% ^
echo "...a folder with new filename: %newProjName%%newProjSuffix% already exists." &^
goto error1
rem else, attempt to rename the old directory
rename %directory% %newProjName%%newProjSuffix% &^
echo "...directory renamed successfully." &^
echo: &^
goto modify-rename-continue



:modify-rename-continue
echo "checking for the existence of subdirectories..."
echo:



set "folderName=.images"
set "dir=%newDirectory%\%subFolderPrefix%%folderName%"
echo %dir%
echo "checking to see if %subFolderPrefix%%folderName% exists..."
echo %newSubFolderPrefix%%folderName%
if exist %dir% ^
rename %dir% %newSubFolderPrefix%%folderName% &^
echo "...folder renamed."

set "folder=%newDirectory%\%newSubFolderPrefix%%folderName%"

if not exist %folder% ^
echo "...%folderName% not found." &^
mkdir %folder% &^
echo "...folder created."

set "subFolder=.reference_images"
if not exist %folder%\%subFolder% ^
mkdir %folder%\%subFolder% &^
echo "%subFolder% created"
set "subFolder=.screenshots"
if not exist %folder%\%subFolder% ^
mkdir %folder%\%subFolder% &^
echo "%subFolder% created"
set "subFolder=.render"
if not exist %folder%\%subFolder% ^
mkdir %folder%\%subFolder% &^
echo "%subFolder% created"
set "subFolder=.render\.arnold"
if not exist %folder%\%subFolder% ^
mkdir %folder%\%subFolder% &^
echo "%subFolder% created"
set "subFolder=.render\.keyshot"
if not exist %folder%\%subFolder% ^
mkdir %folder%\%subFolder% &^
echo "%subFolder% created"
set "subFolder=.render\.vray"
if not exist %folder%\%subFolder% ^
mkdir %folder%\%subFolder% &^
echo "%subFolder% created"
set "subFolder=.render\.iray"
if not exist %folder%\%subFolder% ^
mkdir %folder%\%subFolder% &^
echo "%subFolder% created"
echo:



set "folderName=.cameras"
set "dir=%newDirectory%\%subFolderPrefix%%folderName%"
echo "checking to see if %subFolderPrefix%%folderName% exists..."

if exist %dir% ^
rename %dir% %newSubFolderPrefix%%folderName% &^
echo "...folder renamed."

set "folder=%newDirectory%\%newSubFolderPrefix%%folderName%"

if not exist %folder%	^
echo "...%folderName% not found." &^
mkdir %folder% &^
echo "...folder created."

set "subFolder=.zapplink"
if not exist %folder%\%subFolder% ^
mkdir %folder%\%subFolder% &^
echo "%subFolder% created"
echo:



set "folderName=.textures"
set "dir=%newDirectory%\%subFolderPrefix%%folderName%"
echo "checking to see if %subFolderPrefix%%folderName% exists..."

if exist %dir% ^
rename %dir% %newSubFolderPrefix%%folderName% &^
echo "...folder renamed."

set "folder=%newDirectory%\%newSubFolderPrefix%%folderName%"

if not exist %folder%	^
echo "...%folderName% not found." &^
mkdir %folder% &^
echo "...folder created."

set "subFolder=.maps"
if not exist %folder%\%subFolder% ^
mkdir %folder%\%subFolder% &^
echo "%subFolder% created"
set "subFolder=.maps\.normal(tangent)"
if not exist %folder%\%subFolder% ^
mkdir %folder%\%subFolder% &^
echo "%subFolder% created"
set "subFolder=.maps\.normal(world_space)"
if not exist %folder%\%subFolder% ^
mkdir %folder%\%subFolder% &^
echo "%subFolder% created"
set "subFolder=.maps\.ambient_occlusion"
if not exist %folder%\%subFolder% ^
mkdir %folder%\%subFolder% &^
echo "%subFolder% created"
set "subFolder=.maps\.height"
if not exist %folder%\%subFolder% ^
mkdir %folder%\%subFolder% &^
echo "%subFolder% created"
set "subFolder=.maps\.bump"
if not exist %folder%\%subFolder% ^
mkdir %folder%\%subFolder% &^
echo "%subFolder% created"
set "subFolder=.maps\.curvature"
if not exist %folder%\%subFolder% ^
mkdir %folder%\%subFolder% &^
echo "%subFolder% created"
set "subFolder=.maps\.thickness"
if not exist %folder%\%subFolder% ^
mkdir %folder%\%subFolder% &^
echo "%subFolder% created"
set "subFolder=.maps\.position"
if not exist %folder%\%subFolder% ^
mkdir %folder%\%subFolder% &^
echo "%subFolder% created"
set "subFolder=.maps\.diffuse"
if not exist %folder%\%subFolder% ^
mkdir %folder%\%subFolder% &^
echo "%subFolder% created"
set "subFolder=.maps\.ID"
if not exist %folder%\%subFolder% ^
mkdir %folder%\%subFolder% &^
echo "%subFolder% created"
set "subFolder=.maps\.opacity"
if not exist %folder%\%subFolder% ^
mkdir %folder%\%subFolder% &^
echo "%subFolder% created"
set "subFolder=.maps\.displacement"
if not exist %folder%\%subFolder% ^
mkdir %folder%\%subFolder% &^
echo "%subFolder% created"
set "subFolder=.maps\.specular"
if not exist %folder%\%subFolder% ^
mkdir %folder%\%subFolder% &^
echo "%subFolder% created"
set "subFolder=.maps\.roughness"
if not exist %folder%\%subFolder% ^
mkdir %folder%\%subFolder% &^
echo "%subFolder% created"
echo:



set "folderName=.animation"
set "dir=%newDirectory%\%subFolderPrefix%%folderName%"
echo "checking to see if %subFolderPrefix%%folderName% exists..."

if exist %dir% ^
rename %dir% %newSubFolderPrefix%%folderName% &^
echo "...folder renamed."

set "folder=%newDirectory%\%newSubFolderPrefix%%folderName%"

if not exist %folder%	^
echo "...%folderName% not found." &^
mkdir %folder% &^
echo "...folder created."

set "subFolder=.frames"
if not exist %folder%\%subFolder% ^
mkdir %folder%\%subFolder% &^
echo "%subFolder% created"
echo:



set "folderName=.autosave"
set "dir=%newDirectory%\%subFolderPrefix%%folderName%"
echo "checking to see if %subFolderPrefix%%folderName% exists..."

if exist %dir% ^
rename %dir% %newSubFolderPrefix%%folderName% &^
echo "...folder renamed."

set "folder=%newDirectory%\%newSubFolderPrefix%%folderName%"

if not exist %folder%	^
echo "...%folderName% not found." &^
mkdir %folder% &^
echo "...folder created."

rem set "subFolder=.subfolder"
rem if not exist %folder%\%subFolder% ^
rem mkdir %folder%\%subFolder% &^
rem echo "%subFolder% created"
echo:



set "folderName=.audio"
set "dir=%newDirectory%\%subFolderPrefix%%folderName%"
echo "checking to see if %subFolderPrefix%%folderName% exists..."

if exist %dir% ^
rename %dir% %newSubFolderPrefix%%folderName% &^
echo "...folder renamed."

set "folder=%newDirectory%\%newSubFolderPrefix%%folderName%"

if not exist %folder%	^
echo "...%folderName% not found." &^
mkdir %folder% &^
echo "...folder created."

rem set "subFolder=.subfolder"
rem if not exist %folder%\%subFolder% ^
rem mkdir %folder%\%subFolder% &^
rem echo "%subFolder% created"
echo:



set "folderName=.scenes"
set "dir=%newDirectory%\%subFolderPrefix%%folderName%"
echo "checking to see if %subFolderPrefix%%folderName% exists..."

if exist %dir% ^
rename %dir% %newSubFolderPrefix%%folderName% &^
echo "...folder renamed."

set "folder=%newDirectory%\%newSubFolderPrefix%%folderName%"

if not exist %folder%	^
echo "...%folderName% not found." &^
mkdir %folder% &^
echo "...folder created."

set "subFolder=.maya"
if not exist %folder%\%subFolder% ^
mkdir %folder%\%subFolder% &^
echo "%subFolder% created"
set "subFolder=.maya\.maya_assets"
if not exist %folder%\%subFolder% ^
mkdir %folder%\%subFolder% &^
echo "%subFolder% created"
set "subFolder=%subFolder%"
if not exist %folder%\%subFolder% ^
mkdir %folder%\%subFolder% &^
echo "%subFolder% created"
set "subFolder=.zbrush"
if not exist %folder%\%subFolder% ^
mkdir %folder%\%subFolder% &^
echo "%subFolder% created"
set "subFolder=.zbrush\.zbrush_assets"
if not exist %folder%\%subFolder% ^
mkdir %folder%\%subFolder% &^
echo "%subFolder% created"
set "subFolder=.3dsMax"
if not exist %folder%\%subFolder% ^
mkdir %folder%\%subFolder% &^
echo "%subFolder% created"
set "subFolder=.3dsMax\.3dsMax_assets"
if not exist %folder%\%subFolder% ^
mkdir %folder%\%subFolder% &^
echo "%subFolder% created"
set "subFolder=.obj"
if not exist %folder%\%subFolder% ^
mkdir %folder%\%subFolder% &^
echo "%subFolder% created"
set "subFolder=.obj\.obj_assets"
if not exist %folder%\%subFolder% ^
mkdir %folder%\%subFolder% &^
echo "%subFolder% created"
set "subFolder=.fbx"
if not exist %folder%\%subFolder% ^
mkdir %folder%\%subFolder% &^
echo "%subFolder% created"
set "subFolder=.fbx\.fbx_assets"
if not exist %folder%\%subFolder% ^
mkdir %folder%\%subFolder% &^
echo "%subFolder% created"
echo:



set "folderName=.scripts"
set "dir=%newDirectory%\%subFolderPrefix%%folderName%"
echo "checking to see if %subFolderPrefix%%folderName% exists..."

if exist %dir% ^
rename %dir% %newSubFolderPrefix%%folderName% &^
echo "...folder renamed."

set "folder=%newDirectory%\%newSubFolderPrefix%%folderName%"

if not exist %folder%	^
echo "...%folderName% not found." &^
mkdir %folder% &^
echo "...folder created."

rem set "subFolder=.subfolder"
rem if not exist %folder%\%subFolder% ^
rem mkdir %folder%\%subFolder% &^
rem echo "%subFolder% created"
echo:



set "folderName=.uv"
set "dir=%newDirectory%\%subFolderPrefix%%folderName%"
echo "checking to see if %subFolderPrefix%%folderName% exists..."

if exist %dir% ^
rename %dir% %newSubFolderPrefix%%folderName% &^
echo "...folder renamed."

set "folder=%newDirectory%\%newSubFolderPrefix%%folderName%"

if not exist %folder%	^
echo "...%folderName% not found." &^
mkdir %folder% &^
echo "...folder created."

rem set "subFolder=.subfolder"
rem if not exist %folder%\%subFolder% ^
rem mkdir %folder%\%subFolder% &^
rem echo "%subFolder% created"
echo:



pause
exit



:error1
echo: "Attempt to rename subdirectories?"
echo:
echo	1- Continue
echo	2- Main
echo	3- Exit

choice /C:123

if errorlevel 3 goto exit
if errorlevel 2 goto main
if errorlevel 1 goto modify-rename-continue



:error2
echo:
echo:
echo	1- Main
echo	2- Exit

choice /C:12

if errorlevel 2 goto exit
if errorlevel 1 goto main



:exit
EXIT



rem templates:



rem create: a folder:
rem set folderName variable and subfolder names

rem set "folderName=.folder"
rem set "dir=%directory%\%subFolderPrefix%%folderName%"
rem echo %subFolderPrefix%%folderName%
rem rem echo %dir%
rem echo "checking to see if folder exists..."

rem if exist %dir%	^
rem echo "...folder already exists."

rem if not exist %dir%	^
rem mkdir %dir% &^
rem mkdir %dir%\.subfolder &^
rem echo "...folder and all subdirectories;  created."
rem echo:



rem rename: a folder:
rem set folderName and folder variables 

rem set "folderName=.folder"
rem set "dir=%newDirectory%\%subFolderPrefix%%folderName%"
rem echo "checking to see if %subFolderPrefix%%folderName% exists..."

rem if exist %dir% ^
rem rename %dir% %newSubFolderPrefix%%folderName% &^
rem echo "...folder renamed."

rem set "folder=%newDirectory%\%newSubFolderPrefix%%folderName%"

rem if not exist %folder%	^
rem echo "...%folderName% not found." &^
rem mkdir %folder% &^
rem echo "...folder created."

rem set "subFolder=.subfolder"
rem if not exist %folder%\%subFolder% ^
rem mkdir %folder%\%subFolder% &^
rem echo "%subFolder% created"
rem echo:











rem *** depricated ***

rem create: a folder:

rem set "folderName=.folderName"
rem set "dir=%directory%\%subFolderPrefix%%folderName%"
rem echo %subFolderPrefix%%folderName%
rem rem echo %dir%
rem echo ""checking to see if folder exists...""

rem if exist %dir%	^
rem echo "...folder already exists."

rem if not exist %dir%	^
rem mkdir %dir% &^
rem mkdir %dir%\.subdirectoryName &^
rem echo "...folder and all subdirectories;  created."
rem echo:



rem create: a subfolder with subdirectories:

rem set "folderName1=.subfolderName"
rem if exist %dir%\%folderName1% ^
rem echo "...%folderName1% already exists."

rem if not exist %dir%\%folderName1% ^
rem mkdir %dir%\%folderName1% &^
rem mkdir %dir%\%folderName1%\.subDirectory &^
rem echo "...%folderName1% and all subdirectories; created."
rem echo:



rem rename: a folder:

rem set "folderName=.folderName"
rem set "folder=%newDirectory%\%subFolderPrefix%%folderName%"
rem echo "checking to see if %subFolderPrefix%%folderName% exists..."
rem rem echo %subFolderPrefix%%folderName%
rem rem echo %dir%

rem if exist %dir%	^
rem rename %dir% %newSubFolderPrefix%%folderName% &^
rem echo "...folder renamed."

rem set "folder=%newDirectory%\%newSubFolderPrefix%%folderName%"
rem if not exist %folder%	^
rem echo "...%folderName% not found." &^
rem set "dir=%newDirectory%\%newProjName%%folderName%" &^
rem mkdir %subDir% &^
rem echo "...folder created."
rem echo:



rem rename: a subfolder with subdirectories:

rem set "folderName1=.subfolderName"
rem echo "checking to see if %subFolderPrefix%%folderName%\%folderName1% exists..."
rem rem echo %subFolderPrefix%%folderName%\%folderName1%
rem rem echo %dir%\%folderName1%

rem if exist %folder%\%folderName1% ^
rem echo "folder exists. no renaming necessary"

rem if not exist %folder%\%folderName1% ^
rem echo "...%folderName1% not found." &^
rem set "subFolder=%newDirectory%\%newProjName%%folderName%\%folderName1%" &^
rem mkdir %subFolder% &^
rem mkdir %subFolder%\.subDirectory &^
rem echo "...%folderName1% and all subdirectories; created."
rem echo:



rem alternative folder check
rem # if exist "a" if not exist "a\" (echo "it's a file") 
rem # else (echo "it's a dir")
rem # eg.
rem # if exist C:\Dropbox\Target\SplitBins9x55\NUL echo "Folder already exists, Skip 1" 
rem # if not exist C:\Dropbox\Target\SplitBins9x55\NUL mkdir C:\Dropbox\Target\SplitBins9x55
rem #
rem # If your location has spaces, you are out of luck with this one. if exist "C:\V T S\NUL" won't work correctly. 
rem # In this case, skip the NUL portion altogether and simply do if exist "C:\V T S\"