@echo off

rem For Linux and Mac OS X:
rem maya -batch -file someMayaFile.mb -command "file -save"
rem For Windows:
rem mayabatch -file someMayaFile.mb -command "file -save"

rem Note:
rem The -batch command is not used for batch rendering. Instead, use the Render command. However, -batch does check out a render-only license instead of a full Maya license.
rem On Windows, type mayabatch when using the -batch flag. The mayabatch command runs within the command prompt window, whereas the maya command starts a separate window.
rem The -render flag is now obsolete. Use the Render -r command instead.


"C:\Program Files\Autodesk\Maya2022\bin\maya.exe" -noAutoloadPlugins -3 -script '';


exit

:: Additional Maya startup flags
rem -archive [file]	Displays a list of files required to archive the specified scene and then exits Maya.

rem -command [mel command]	Runs the specified command on startup. The command should be enclosed in double quotes to protect any special characters, including spaces.

rem -log [file]	Copies all standard output and error messages (those that normally appear in the Output Window) to the specified file (use complete file name). This flag is for Windows only.

rem -noAutoloadPlugins	Do not auto-load any plug-ins.

rem -optimizeRender [file] [outfile]	Processes the specified scene file to optimize it for rendering, puts the result in outfile and then exits. Use maya -optimizeRender -help for more options. See -optimizeRender flags.

rem -proj [dir]	Looks for scene files in the specified project directory.

rem -recover	Recovers the last journal file.

rem -script [file]	Sources the specified file (which is expected to be a MEL script) on startup.

rem -v 	Displays the product version and cut number, and then exits.

rem -3	Enable Python 3000 compatibility warnings.

rem -file [filename]	open a file at startup

rem -help	To see the available startup flags