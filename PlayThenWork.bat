@echo off

set VMX_PATH=E:\Virtual Machines\Win10\
set VMX_NAME=Win10.vmx
set PLAYER_DELAY=20
set VM_WORKSTATION_DIR=C:\Program Files (x86)\VMware\VMware Workstation\

echo This script uses VM player to start the VM, and then VM workstation to control it
echo Make sure to set VMware Player as the default program for .vmx files
echo VM full path = %VMX_PATH%%VMX_NAME%

echo Starting VM %VMX_NAME% in VMware Player
start helper.bat "%VMX_PATH%%VMX_NAME%"

echo Waiting %PLAYER_DELAY% seconds for Player to start
timeout /t %PLAYER_DELAY% /nobreak

echo Opening VM in Workstation
echo Single click on the name of the VM you're trying to open once on Workstation
echo Don't worry if you get an error, just click ok and try again
echo This will open the take ownership menu, don't click anything yet
echo Press enter on this command prompt when youve got there
cd /d "%VM_WORKSTATION_DIR%"
start vmware.exe
pause

echo Killing vmplayer.exe
taskkill /F /IM vmplayer.exe

echo Clearing lck files to allow workstation to take over
cd /d "%VMX_PATH%"
for /f "delims=?" %%i in ('dir /a:d /s /b *.lck') do rd /s /q "%%i"



echo Now press take ownership, the VM will move over to workstation. 
echo Press any key to exit
pause > NUL
Exit
