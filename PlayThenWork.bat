@echo off

:: All variables should have no space between variable name, the =  and the value
:: For example VMX_PATH = C:\VMs\ WOULD NOT WORK but VMX_PATH=C:\VMs\ will
:: Use backslashes in file paths

:: VMX_PATH is the folder containing the .vmx
set VMX_PATH=E:\Virtual Machines\Win10\

:: VMX_NAME is the VMX file, including extension
set VMX_NAME=Win10.vmx

:: Path to folder which contains VMware workstation
set VM_WORKSTATION_DIR=C:\Program Files (x86)\VMware\VMware Workstation\

:: This is the delay between opening player and starting workstation
:: If you're having problem or have a slow PC, try increasing this
set PLAYER_DELAY=20

::Variable sanitation

if NOT "%VMX_PATH:~1,1%"==":" (
	echo Problem with VMX_PATH
	echo Ensure there are no spaces in variable assignment
	echo Ensure you are using full file paths
	pause
	exit
)

if NOT "%VMX_NAME:~-4%"==".vmx" (
	echo Problem with VMX_NAME
	echo Missing variable or missing extension
	pause
	exit
)

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
