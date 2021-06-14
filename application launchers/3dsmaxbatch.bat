@echo off

rem 3dsmaxbatch.exe <script_file> [options]
rem <script_file> is the name of a MAXScript or Python script, and is a required parameter
rem 3ds Max Batch starts and loads the specified 3ds Max scene file (if one is provided - this is an optional parameter). It then executes the script_file and any additional inputs if any are provided. It then exits.

set VERSION=2022
set SCRIPT=""
set PLUGINCONFIG=""
"C:\Program Files\Autodesk\3ds Max %VERSION%\3dsmaxbatch.exe" %SCRIPT% -p %PLUGINCONFIG%


::3ds Max Batch Options
rem -help	Show all options.

rem -v arg	System log verbosity level. Valid: 0=fatal errors, 1=errors, 2=warnings(default), 3=process information messages, 4=all informational messages, 5=debug level messages.

rem -dateFormat	arg Date format string for the console log. For example, "yyyy-MM-dd" or "ddd, MM/dd/yyyy"

rem -timeFormat	arg Time format string for the console log. For example, "hh:mm:ss" or "ss : mm"

rem -i arg	The 3ds Max config file (.ini). Defaults to the per-user default config file (3dsmax.ini).

rem -p arg	The 3ds Max Plugin config file (.ini). Defaults to the per-user default plugin config file (Plugin.UserSettings.ini). See the "Plugin.ini" topic in the 3ds Max Developer's Guide for more information

rem -listenerlog arg	The 3ds Max Listener log file to capture output from the listener. No listener log is created by default. See the "Turning On the Listener Log" topic in the MAXScript Guide for more information.

rem -log arg	The 3ds Max system log file. Script errors and exceptions are logged to this file. Defaults to the per-user system log file (Max.log)

rem -dm arg	Dialog Monitor state. When on, the dialog monitor watches for dialogs from plug-ins, and closes them. Valid choices are: 'on|off', 'yes|no', '1|0' and 'true|false'. Defaults to off. For more information about the Dialog Monitor, see the "Interface: DialogMonitorOPS" topic in the MAXScript Guide.

rem -mxsString arg	MAXScript String Parameter option, where arg = <key>:<value> . <value> is accessible as a MAXScript string in <script_file> through the maxOps.mxsCmdLineArgs dictionary using <key> as the dictionary key. The string must be a MAXScript string, meaning it must be enclosed in quotation marks, and any quotation marks or other special characters inside the string must be escaped. The string may be prefixed with an '@' to indicate that it is a verbatim string. See the "String Literals" topic in the MAXScript Guide for more information. Can be specified multiple times.

rem -mxsValue arg	MAXScript Value Parameter option, where arg = <key>:<value>. <value> will be accessible as a MAXScript value in <script_file> through the maxOps.mxsCmdLineArgs dictionary using <key> as the dictionary key. The <value> parameter must be enclosed in quotation marks. Can be specified multiple times.

rem -sceneFile arg	The input 3ds Max scene file to be loaded before <script_file> is executed.

rem -python3Warning	Specifies whether to turn on Python 3 warning mode, where items in Python scripts that are not compatible with Python 3 generate warnings. Valid values for arg are 1/0, on/off, yes/no, and true/false, where the first value enables the mode and the second disables the mode. The mode is disabled by default. See the "Python 3 Warning Mode" topic in the 3ds Max Python API Help for more information about this mode.


PAUSE