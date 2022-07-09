:: Startup Commands
@echo off
@Mode 77,13
title Matwarey Injector x64 Stable

:: Check if the PC is x64 bit
cd /
IF EXIST "%PROGRAMFILES(X86)%" (set OS=x64) else (set OS=x86)
if %username%==Matth if %OS%==x64 goto Dev
if %OS%==x64 goto BeforeLoop

:: Setup Alert
if %OS%==x86 set Unsupported=1

:X32Bitunsupported
if %Unsupported%==1 if %OS%==x86 title Matwarey Injector Error x86
if %Unsupported%==1 if %OS%==x86 echo Matwarey Injector unsupported processer
if %Unsupported%==1 if %OS%==x86 echo You'll be transferred to Matwarey Injector x86
if %Unsupported%==1 if %OS%==x86 echo.
if %Unsupported%==1 if %OS%==x86 timeout /t 3 >nul

:: Switch them to the correct processer version
if %Unsupported%==1 if %OS%==x86 cls
if %Unsupported%==1 if %OS%==x86 cd C:\Users\%username%\Downloads\Matwarey-Injector\x86\
if %Unsupported%==1 if %OS%==x86 start injector.bat
if %Unsupported%==1 if %OS%==x86 exit

:UnsupportedWindowsCheck
ver | findstr /i "6\.0\." > nul && (echo Windows Vista isn't Supported! & goto UnsupportedWindowsEdition)
ver | findstr /i "5\.2\." > nul && (echo Windows XP (x64) isn't Supported! & goto UnsupportedWindowsEdition)
ver | findstr /i "5\.1\." > nul && (echo Windows XP (x86) isn't Supported! & goto UnsupportedWindowsEdition)
ver | findstr /i "5\.0\." > nul && (echo Windows 2000 isn't Supported! & goto UnsupportedWindowsEdition)

:UnsupportedWindowsEdition
echo You can't use Matwarey Injector.
pause
exit

:Dev
:: Check if in developer mode folder (no changes special happens really..)
if %username%==Matth cd C:\Users\Matth\Documents\GitHub\Matwarey-Injector\x64
if %username%==Matth title Matwarey Injector x64 Dev
if %username%==Matth goto Loop

:BeforeLoop
cd C:/Users/%username%/Downloads/Matwarey-Injector/x64/
goto Loop

:: Load Main Menu
:Loop
title Matwarey Injector x64 Stable
if %username%==Matth title Matwarey Injector x64 Dev
Batbox /h 0

cls
Call Button  2 4 "Inject" 65 4 "Eject" 32 4 "Dev Mode" # Press
Getinput /m %Press% /h 70

:: Check for the pressed buttons below
if %errorlevel%==1 (goto InjectorQNA)
if %errorlevel%==2 (goto Eject)
if %errorlevel%==3 (goto DevMode)
goto Loop

:DevMode
cls
title Matwarey Injector Developer Menu
echo Note: Please know what you are doing before messing around in developer menu!
echo.
echo.
echo 1) Dev Mode Command Prompt
echo.
echo 2) Custom Injection (WIP)
echo.
echo 3) Version Info
echo.
echo 4) Back to Main Menu
echo.
set /p nsw=#: 
if %nsw%==1 (goto DMCP)
if %nsw%==2 (goto CDLLI)
if %nsw%==3 (goto VI)
if %nsw%==4 (goto Loop)
goto DevMode

:VI
cls
echo -=System Infomation-=
echo.
echo Processer: %Processer_Architecture%
ver | findstr /i "6\.1\." > nul && (echo OS: Windows 7)
ver | findstr /i "6\.2\." > nul && (echo OS: Windows 8)
ver | findstr /i "6\.3\." > nul && (echo OS: Windows 8.1)
ver | findstr /i "10\.0\." > nul && (echo OS: Windows 10)
echo Batch Version: 3.0.0
pause
goto DevMode

:DMCP
cls
echo Starting Dev Mode Command Prompt
echo Matwarey Injector Dev Command Line v1.0.0
cmd.exe /k "title Matwarey Command Prompt && prompt #-: "
echo Dev Mode Command Prompt ended!
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
cls
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
cls
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
cls
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
cls
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
set PN=1
injector.exe -n %ProcessName% -i %FileName%
:: Notify Person
echo Injector.exe Task Completed!
echo.
pause
goto Loop

:injectID
cls
:: Injects into Process PID
set PIDU=1
injector.exe -p %ProcessID% -i %FileName%
:: Notify Person
echo Injector.exe Task Completed!
echo.
pause
goto Loop

:Eject
cls
:: Check if they have a DLL Injected
if %PIDU%==0 if %PN%==0 echo WOAH! You don't have a DLL injected yet!
if %PN%==0 if %PIDU%==0 pause
if %PIDU%==1 goto Eject2
if %PN%==1 goto Eject2
if %PN%==0 goto Loop
if %PIDU%==0 goto Loop

:Eject2
cls
if %PIDU%==1 injector.exe -n %ProcessName% -e %FileName%
if %PN%==1 injector.exe -p %ProcessID% -e %FileName%
if %PN%==1 echo DLL Ejected.
if %PIDU%==1 echo DLL Ejected.
pause
goto Loop