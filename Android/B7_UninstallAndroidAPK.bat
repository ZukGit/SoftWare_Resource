@ECHO off

@REM 将adb.exe添加到PATH中
ECHO 初始化…
@SET PATH=%PATH%;%CD%\Adb
@REM SET PATH

@REM 无限循环的标签
:LOOP

ECHO 等待您插入手机…
adb wait-for-device

adb shell pm list packages -3 > ./B7_uninstallpacket.txt
@REM 循环安装本目录下的APK文件
if exist B7_uninstallpacket.txt ( 
setlocal enabledelayedexpansion
@rem 遍历文件多行 
  for /f %%l in (B7_uninstallpacket.txt) do ( 
       set /a num+=1 
	   set s=%%l
       set s=!s:~8!
@rem 	echo !s%! >> B7_test.txt
       ECHO 卸载包:  !s%!
       call adb uninstall !s%!
  )
ECHO 手机三方应用已完全卸载！   
) else ( 
ECHO B7_uninstallpacket.txt不存在！ 
)

ECHO 卸载三方APK好了；换一台手机卸载吧！！！
PAUSE
GOTO LOOP

@ECHO on