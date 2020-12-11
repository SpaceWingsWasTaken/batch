echo off
setlocal enabledelayedexpansion
mode con cols=80 lines=25

:: CONSTANTS & COLOR OPTIMIZATION
set "version=v1.1 Prelease"
set "red=[38;2;205;49;49m"
set "aqua=[38;2;58;150;221m"
set "purple=[38;2;136;23;152m"
set "reset=[0m"
cls
echo        ======Boot options======
echo 1. Normal mode
echo 2. Developer mode (disables boot screen)
set /p "input=: "
if /I "%input%"=="1" goto normal
if /I "%input%"=="2" goto dev
:normal

:: BOOTUP SEQUENCE
cls
for /L %%A in (1,1,10) do echo(
echo(                   =========================================
echo(                                  %aqua%Bird%reset%-DOS
echo(                            by %aqua%Space%reset% and %purple%sintrode%reset%
echo                                 %version%
echo(                   =========================================
echo(                                
echo                                 Booting up
for /L %%A in (1,1,4) do (
	timeout /t 1 >nul
	set /a dot_x=43+%%A
	echo [17;!dot_x!H.
)
timeout /t 4 >nul

cls
for /L %%A in (232,1,255) do (
	echo [12;35H[38;5;%%AmLOADING...
	ping 1.1.1.1 -w 750 -n 1 >nul
)
:dev
cls
echo (c) BirdCORP 2019 - 2020 All Rights reserved
echo Bird-DOS %version%
echo.

:first_input
set /p "input=C:\>"
if "%input%"=="" goto :first_input
if /I "%input%"=="cls" cls
if /I "%input%"=="dir" goto dirscript
if /I "%input%"=="notepad" goto notepadscript
if /I "%input%"=="changelog" goto changelog
if /I "%input%"=="exit" exit /b
if /I "%input%"=="website" goto website
if "%input:~0,1%"==" " goto :first_input
if /I "%input:~0,2%"=="cd" %input%
if /I "%input:~0,4%"=="help" call :helpscript "%input:~5%"
if /I "%input:~0,3%"=="del" %input%
if /I "%input%"=="crash" goto bsod
if /I "%input%"=="credits" goto credits
set "input= "
goto :first_input

:dirscript
dir
goto :first_input

:notepadscript
start notepad
goto :first_input

:helpscript
if "%~1"=="" (
	echo The following commands are valid:
	echo     %red%cd%reset%             Changes the directory.
	echo     %red%cls%reset%            Clears the screen.
	echo     %red%dir%reset%            Displays the contents of the directory.
	echo     %red%del%reset%            Deletes a file
	echo     %red%exit%reset%           Exits Bird-DOS
	echo     %red%help%reset%           Displays this help screen.
	echo     %red%notepad%reset%        Opens %red%Notepad%reset%
	echo     %red%changelog%reset%      Shows a changelog of new features added.
    echo     %red%website%reset%        A link to the Bird-DOS Website.
    echo     %red%credits%reset%        Shows the credits.
	echo(
	echo The following commands are coming soon:
    echo     %red%edit%reset%           A text editor in %aqua%Bird%reset%DOS
    echo     %red%start%reset%          Opens any file you tell it to open.
	echo(
	echo For more information on a specific %red%command%reset%, type HELP %red%command_name%reset%
	exit /b


)

if /i "%~1"=="help" (
	echo NAME
	echo     %red%help%reset%
	echo(
	echo USAGE
	echo     %red%help%reset% [help_topic]
	echo(
	echo DESCRIPTION
	echo     Displays the purpose and usage for a specified command. Displays this
	echo     page if no command is specified.
	echo(
	echo OPTIONAL ARGUMENTS
	echo     help_topic    The command to display the help for.
	echo(
	pause
	exit /b
)
if /i "%~1"=="cd" (
	echo NAME
	echo     %red%cd%reset%
	echo(
	echo USAGE
	echo     %red%cd%reset% [path]
	echo(
	echo DESCRIPTION
	echo     Changes to another directory, or displays the current directory
	echo     if no argument is provided.
	echo(
	echo OPTIONAL ARGUMENTS
	echo     path    The directory to move to.
	echo(
	pause
	exit /b
)
if /i "%~1"=="changelog" (
	echo NAME
	echo     %red%changelog%reset%
	echo(
	echo USAGE
	echo     %red%changelog%reset%
	echo(
	echo DESCRIPTION
	echo     Displays the most recent changes to the %red%shell%reset%.
	echo(
	pause
	exit /b
)
if /i "%~1"=="cls" (
	echo NAME
	echo     %red%cls%reset%
	echo(
	echo USAGE
	echo     %red%cls%reset%
	echo(
	echo DESCRIPTION
	echo     %red%Clears%reset% the screen.
	echo(
	pause
	exit /b
)
if /i "%~1"=="del" (
	echo NAME
	echo     %red%del%reset%
	echo(
	echo USAGE
	echo     %red%del%reset% ^<file^>
	echo(
	echo DESCRIPTION
	echo     %red%del%reset% a specified file.
	echo(
	echo OPTIONAL ARGUMENTS
	echo     file    The file to %red%delete.%reset%
	echo(
	pause
	exit /b
)
if /i "%~1"=="dir" (
	echo NAME
	echo     %red%dir%reset%
	echo(
	echo USAGE
	echo     %red%dir%reset% [path]
	echo(
	echo DESCRIPTION
	echo     Displays the contents of a specified %red%directory%reset%, or the current
	echo     directory if no %red%directory%reset% is specified.
	echo(
	echo OPTIONAL ARGUMENTS
	echo     %red%path%reset%    The %red%directory%reset% to display the contents of
	echo(
	pause
	exit /b
)
if /i "%~1"=="exit" (
	echo NAME
	echo     %red%exit%reset%
	echo(
	echo USAGE
	echo     %red%exit%reset%
	echo(
	echo DESCRIPTION
	echo     Quits %aqua%Bird%reset%DOS
	echo(
	pause
	exit /b
)
if /i "%~1"=="notepad" (
	echo NAME
	echo     %red%notepad%reset%
	echo(
	echo USAGE
	echo     %red%notepad%reset%
	echo(
	echo DESCRIPTION
	echo     Opens %red%notepad%reset%.
	echo(
	pause
	exit /b
)
exit /b

:changelog
echo.              CHANGELOG
echo.
echo v1.1-prerelease ^| INSERT CHANGELOG DATA
echo                 ^| INSERT CHANGELOG DATA
echo v1.0-prerelease ^| Redesigned the terminal input and added some more easter eggs.
echo                 ^| Boot options for changing to normal to dev mode.
echo                 ^| insert some more ideas that we will make reality in this update
echo v0.1.5          ^| Optimization of loading sequence and colors
echo v0.1.4          ^| Stylized the menu by adding colors and stuff to make it look nice.
echo v0.1.3          ^| Added a "Booting up..." for Detail.
echo                 ^| Added a secret %red%command%reset% that crashes Bird-DOS
echo v0.1.2          ^| Added a "website" %red%command%reset%
echo v0.1.1          ^| Added %red%cls%reset% and %red%exit%reset%
echo                 ^| Rearranged menu for stability
echo                 ^| Simplified versioning
echo v0.1.0          ^| Added filesystem %red%commands.%reset%.
echo v0.0.10         ^| Added the %red%command%reset% "%red%changelog%reset%"
echo v0.0.9          ^| Remade the "%red%help%reset%" %red%Command%reset%
echo v0.0.8          ^| Added the bootup screen
echo.
echo.    This changelog does not date to the oldest versions that I orignally made.
goto :first_input

:website
echo Website Link: http://birdsoftware.epizy.com/
goto :first_input

:bsod
cls
color 17
echo Your Bird-DOS PC has ran into a issue and has crashed.
echo We are sorry for the inconvince and we will restart your computer in 10 seconds.
echo ERROR CODE: 0x000x0000
timeout /t 10 >nul
start Bird-DOS-1.1-prerelease.bat
exit
:credits
echo Credits.
echo ------------------------------------
echo (c) BirdCORP 2020 - 2019 owned by
echo Space & Sintrode, credits to
echo Sintrode for letting me use the help
echo source code by him & for him helping
echo with the project! You've been a 
echo great guy and I think we can make 
echo this little project successful. 
echo ------------------------------------
echo GNU lisence consequences apply
echo to the project. 
goto :first_input

