@echo off
Setlocal enabledelayedexpansion

cd !cd!

ECHO init-ing

:LOOP

ECHO waiting conenct with USB

adb wait-for-device

adb shell pm list packages -3 > ./B7_uninstallpacket.txt

if exist B7_uninstallpacket.txt (
  for /f %%l in (B7_uninstallpacket.txt) do ( 
       set /a num+=1 
	   set s=%%l
       set str1=!s:~8!
	   ECHO  s=!str1!
       ECHO install-packages :  !str1!
       call adb uninstall !str1!
  )
ECHO all third-part APP uninstall !
) else (
ECHO B7_uninstallpacket.txt file not exist !
)

ECHO change a device and continue uninstall;
PAUSE
GOTO LOOP

@pause