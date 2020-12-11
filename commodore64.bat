@echo off
title LOADING...
mode con cols=80 lines=25
color 07
cls

set "light_purp_fg=[38;2;124;113;218m"
set "light_purp_bg=[48;2;124;113;218m"
set "dark_purp_fg=[38;2;62;50;162m"
set "dark_purp_bg=[48;2;62;50;162m"

set "printn=<nul set /p ="

:: Make the main background dark putple
echo %dark_purp_bg%
cls
:: Manually add a light purple border
%printn%%light_purp_bg%%light_purp_fg%[1;1H
for /L %%A in (1,1,80) do %printn%.
for /L %%A in (2,1,24) do %printn%[%%A;1H..[%%A;79H..
for /L %%A in (1,1,80) do %printn%.

title BOOTING...
:: Move the cursor back to the dark purple bit
echo %dark_purp_bg%[2;25H==== COMMODORE 64 BATCH V1====
timeout /t 2 >nul
echo %dark_purp_bg%[3;21H64K RAM SYSTEM  99999 BASIC BYTES FREE
timeout /t 5 >nul
echo %dark_purp_bg%[4;3HREADY 
title READY
timeout /t 1 >nul
title COMMODORE 64 BATCH REMAKE V1
:first_input
set /p "input=%light_purp_bg%aa%dark_purp_bg%"
if "%input%"=="" goto :first_input
if /I "%input%"=="cls" cls
if /I "%input%"=="print" echo )
if /I "%input%"=="list" dir
if /I "%input%"=="exit" exit /b
if "%input:~0,1%"==" " goto :first_input
if /I "%input:~0,2%"=="cd" %input%
if /I "%input:~0,4%"=="help" call :helpscript "%input:~5%"
if /I "%input:~0,3%"=="del" %input%
set "input= "
goto :first_input
:helpscript
echo %light_purp_bg%aa%dark_purp_bg%THE FOLLOWING COMMANDS ARE:
echo %light_purp_bg%aa%dark_purp_bg%	HELP
echo %light_purp_bg%aa%dark_purp_bg%	CLS
echo %light_purp_bg%aa%dark_purp_bg%	LIST
echo %light_purp_bg%aa%dark_purp_bg%	EXIT
echo %light_purp_bg%aa%dark_purp_bg%	CD
echo %light_purp_bg%aa%dark_purp_bg%	DEL

:: At this point, you can clearly see that the cursor moved back to
:: the first column after the echo. We're going to have to create a
:: subroutine to display all text. We're also going to have to hope
:: that the user doesn't type past the border, because we have no
:: way of stopping that.

:: There might be a way.
:: Maybe make it draw when the border isnt on screen.
:: Or not fully on some how?