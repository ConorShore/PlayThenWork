# PlayThenWork
Info:
A script to semi-automate the process of starting a VM in VMware Player, then transfering ownership to  VMware Workstation
There are two scripts, PlayThenWork.bat and helper.bat. PlayThenWork.bat is the bulk of the script, helper is just used to open one of the VMware instances so it doesn't block the main script

Pre-Requists:
VMware Workstatation and VMware Player installed
The default program to open .vmx files should be VMware Player, NOT workstation
The VM should have been "opened" on Workstation so it appears in the library tab

How To:
There are two scripts, PlayThenWork.bat and helper.bat

Place both .bat files in the directory of the VM you want to start.
Open the PlayThenWork.bat and edit the VMX_PATH and VMX_NAME so that it matches the VM you want to start
If you have a custom install location for the VMware Workstation EXE files, you should also change VM_WORKSTATION_DIR

Double click the PlayThenWork.bat to get start
Follow the instructions on the CMD window that opens. You will need to interact with this window at certain points
