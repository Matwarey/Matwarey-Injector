:: Startup Commands
@echo off
@Mode 77,13
title Matwarey Injector x64 Stable

:: Check if the PC is x64 bit
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT
if %OS%==32BIT set Unsupported=1
if %OS%==64BIT goto Loop

:X32Bitunsupported
if %Unsupported%==1 title Matwarey Injector can't run!
if %Unsupported%==1 if %OS%==32BIT echo This is a 32bit operating system
if %Unsupported%==1 echo %OS% Isn't allowed on a x64 batch file!
if %Unsupported%==1 echo You can't run this batch file, please run the x32 version.
if %Unsupported%==1 echo.
if %Unsupported%==1 pause
if %Unsupported%==1 if %OS%==32BIT exit

:: Load Main Menu
:Loop
Batbox /h 0

cd C:\Users\%username%\Downloads\Matwarey Injector\x64\
cls
Call Button  2 4 "Inject" 65 4 "Eject" 33 4 "Exit" # Press
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
:ProcessNamefileQNA
echo Do you want to copy file path or open file selecter?
echo.
echo 1) Copy File Path (Great for Low End Computers)
echo 2) Open File Selecter (Faster way to search for DLL)
echo.
set /p QNAA=#:
if %QNAA%==1 (goto PNFileCopyPath)
if %QNAA%==2 (goto FileSelecterPN)
goto ProcessNamefileQNA

:PNFileCopyPath
cls
echo.
echo Example: C:/Users/%username%/Downloads/ModMenu.dll
echo Copy File Directory Below:
echo.
set /p FileName=#:
cls
:ConfirmPNFile
echo %FileName% has been wrote here, is this correct? 
echo.
echo 1) Yes
echo 2) No
echo.
set /p QNAXB=#: 
if %QNAXB%==1 (goto inject)
if %QNAXB%==2 (goto PNFileCopyPath)
goto ConfirmPNFile

:FileSelecterPN
cls
echo Select a DLL File.
set pwshcmd=powershell -noprofile -command "&{[System.Reflection.Assembly]::LoadWithPartialName('System.windows.forms') | Out-Null;$OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog; $OpenFileDialog.ShowDialog()|out-null; $OpenFileDialog.FileName}"
for /f "delims=" %%I in ('%pwshcmd%') do set "FileName=%%I"
:ConfirmPNFileS
echo %FileName% has been selected, is this correct?
echo.
echo 1) Yes
echo 2) No
echo.
set /p QNA=#: 
if %QNA%==1 (goto inject)
if %QNA%==2 (goto FileSelecterPN)
cls
goto ConfirmPNFileS

:ProcessIDInjectQNA
cls
echo What's the ID of the process?
set /p ProcessID=ID of Process: 
cls
:ProcessIDQNA
echo Do you want to copy file path or open file selecter?
echo.
echo 1) Copy File Path (Great for Low End Computers)
echo 2) Open File Selecter (Faster way to search for DLL)
echo.
set /p QNAX=#:
if %QNAX%==1 (goto IDFileCopyPath)
if %QNAX%==2 (goto FileSelecterID)
goto ProcessIDQNA

:IDFileCopyPath
cls
echo.
echo Example: C:/Users/%username%/Downloads/ModMenu.dll
echo Copy File Directory Below:
echo.
set /p FileName=#: 
cls
:ConfirmIDFile
echo %FileName% has been wrote here, is this correct?
echo.
echo 1) Yes
echo 2) No
echo.
set /p QNAXX=#: 
if %QNAXX%==1 (goto injectID)
if %QNAXX%==2 (goto IDFileCopyPath)
goto ConfirmIDFile

:FileSelecterID
cls
echo Select a DLL File.
set pwshcmd=powershell -noprofile -command "&{[System.Reflection.Assembly]::LoadWithPartialName('System.windows.forms') | Out-Null;$OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog; $OpenFileDialog.ShowDialog()|out-null; $OpenFileDialog.FileName}"
for /f "delims=" %%I in ('%pwshcmd%') do set "FileName=%%I"
:ConfirmIDFileS
echo %FileName% has been selected, is this correct?
echo.
echo 1) Yes
echo 2) No
echo.
set /p QNAT=#: 
if %QNAT%==1 (goto injectID)
if %QNAT%==2 (goto FileSelecterID)
cls
goto ConfirmIDFileS

:inject
cls
:: Inject into Process Name
injector.exe -n %ProcessName% -i %FileName%
:: Notify Person
echo Injector.exe Task Completed!
echo.
pause
goto Loop

:injectID
cls
:: Injects into Process PID
injector.exe -p %ProcessID% -i %FileName%
:: Notify Person
echo Injector.exe Task Completed!
echo.
pause
goto Loop

:Eject
cls
injector.exe -n %ProcessName% -e %FileName% >nul
injector.exe -p %ProcessID% -e %FileName% >nul
echo DLL Ejected.
pause
goto Loop