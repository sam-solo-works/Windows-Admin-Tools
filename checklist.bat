@Echo Off

REM @Set Logfile=c:\
 
ECHO *******************************************************************************
ECHO ****                     Checklist for Workstation Build                   ****
ECHO *******************************************************************************
ECHO:
 
 
REM *******Computer Model***********************************************************
systeminfo | find "System Model"
 
ECHO:
 
REM *******Computer Name************************************************************
ECHO Computer Name:             %COMPUTERNAME%                      
ECHO:
ECHO TCP/IP Settings:                                      
ECHO:
 
REM *******TCP/IP Settings**********************************************************
netsh interface ip show config "Local Area Connection"
ECHO:
REM ************* Computer Service Tag *********************************************
 
wmic bios get serialnumber
 
ECHO ************* Desktop Shotcuts ************************************************
ECHO:
 
If EXIST "C:\Users\Public\Desktop\Pediatrix Apps Portal.url" (ECHO desktop shortcut to the Apps Portal exists) ELSE (ECHO desktop shortcut to the Apps Portal Does not Exist)
If EXIST "C:\Users\Public\Desktop\FirstClass.lnk" (ECHO desktop shortcut to FirstClass exists) ELSE (ECHO Desktop shortcut to FirstClass Does Not Exist)
If EXIST "C:\Users\Public\Desktop\Medsuite.exe.lnk" (ECHO desktop shortcut to Medsuite exists) ELSE (ECHO Desktop shortcut to Medsuite Does not Exist)
ECHO:
ECHO PLease run these shortcuts to make sure it works
 
ECHO:
ECHO *******************************************************************************
ECHO **** Checking if symantec is installed                                     ****
ECHO *******************************************************************************
ECHO:
 
If EXIST "C:\Program Files (x86)\Symantec\Symantec Endpoint Protection" (ECHO Symantec is installed on this machine) ELSE (Echo Symantec is NOT installed on this machine)
 
 
ECHO:
ECHO *******************************************************************************
ECHO **** Checking if Landesk is installed                                      ****
ECHO *******************************************************************************
ECHO:
 
IF ExIST "C:\Program Files (x86)\LANDesk\LDClient" (Echo Landesk is installed on this machine) ELSE (Echo LANDESK is NOT installed on this machine)
ECHO:
 
ECHO:
ECHO *******************************************************************************
ECHO **** Checking Citrix ICA Version                                           ****
ECHO *******************************************************************************
ECHO:
 
wmic datafile where name='C:\\Program Files (x86)\\Citrix\\ICA Client\\Receiver\\Receiver.exe' get version
 
 
 
ECHO *******************************************************************************
ECHO **** Domain Information                                                    ****
ECHO *******************************************************************************
ECHO:
 
set user
 
ECHO:
 
REM manage-bde -status c:
 
@Echo Date and Time the Machine was Built: %Date% %Time%
ECHO:
 
ECHO Has the Site Diagram chart been updated?
ECHO:
ECHO Has the asset system been updated ?
ECHO:
ECHO The copy of this checklist will go to a repository on the support server for future use
ECHO:
Pause