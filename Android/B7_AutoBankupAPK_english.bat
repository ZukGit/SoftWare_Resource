@ECHO off
Setlocal ENABLEDELAYEDEXPANSION

ECHO initialize-ing


:LOOP
ECHO waiting device in USB
adb wait-for-device
adb shell pm list packages -3 -f > ./B7_autoBankupAPP.txt
:forbegin
if exist B7_autoBankupAPP.txt (
  for /f %%l in (B7_autoBankupAPP.txt) do (
set /a num+=1 
ECHO num=!num!
set mystr=%%l
set str=!mystr!
ECHO str=!str!
set "str=!str:"= !"
:lengthnext
if not "!str!"=="" (
 set /a numsize+=1
 set "str=!str:~1!"
 goto lengthnext
)



set ch1=apk=
set str2=!mystr!
:indexofnext
set prestr=!str2:~0,4! 
if not "!str2!"=="" (
set /a index+=1
if "!prestr!"=="%ch1% " goto last
set "str2=!str2:~1!"
goto indexofnext
)
set /a index=0

:last
set /a pos = %index% -6
set apkpath=!mystr!
set apkpath=!mystr:~8,%pos%!
set packagename=!mystr!
set /a pos = %index% + 3
set packagename=!mystr:~%pos%,%numsize%!

call adb pull !apkpath!  ./"!packagename!".apk

set /a index = 0
set /a pos = 0
set /a numsize = 0

more +1 B7_autoBankupAPP.txt > a.tmp
del B7_autoBankupAPP.txt
ren a.tmp B7_autoBankupAPP.txt

goto forbegin
)
ECHO all-third-apk already store on local dir 
) else (
ECHO B7_autoBankupAPP.txt file not exist! please check this file!
)

ECHO install-all-apk-success change other device to USB
PAUSE
GOTO LOOP