:: Startup Commands
@echo off
@Mode 47,13
title Matwarey Injector Stable

:: Load Main Menu
Batbox /h 0

:Loop
cd C:\Users\Matth\Downloads\Matwarey Injector\x64\
cls
Call Button  6 4 "Inject" 29 4 "Eject" 18 8 "Exit" # Press
Getinput /m %Press% /h 70

:: Check for the pressed buttons below 
if %errorlevel%==1 (goto InjectorQNA)
if %errorlevel%==2 (goto Eject)
if %errorlevel%==3 (exit)
goto Loop

:InjectorQNA
:: Say what method they want
cls
echo What Options is how you want to Inject,
echo.
echo 1) Process Name
echo 2) Process ID
echo.
:: Setup Set Commands
set /p QNAI=#: 
if %QNAI%==1 goto ProcessNameInjectQNA
if %QNAI%==2 goto ProcessIDInjectQNA
goto InjectorQNA

:ProcessNameInjectQNA
cls
echo What's the name of the process?
set /p ProcessName=Name of Process: 
cls
echo What's the Path of the DLL?
set /p DLLName=Path: 
cls
goto inject

:ProcessIDInjectQNA
cls
echo What's the ID of the process?
set /p ProcessID=ID of Process: 
cls
echo What's the Path of the DLL?
set /p DLLName=Path: 
cls
goto injectID

:inject
cls
:: Inject into Process Name
injector.exe -n %ProcessName% -i %DLLName%
:: Notify Person
echo Injector.exe Task Completed!
echo.
pause
goto Loop

:injectID
cls
:: Injects into Process PID
injector.exe -p %ProcessID% -i %DLLName%
:: Notify Person
echo Injector.exe Task Completed!
echo.
pause
goto Loop

:Eject
cls
injector.exe -n %ProcessName% -e %DLLName% >nul
injector.exe -p %ProcessID% -e %DLLName% >nul
echo DLL Ejected.
pause
goto Loop