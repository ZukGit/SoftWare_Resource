@ECHO off

@REM 将adb.exe添加到PATH中
ECHO 初始化…
@SET PATH=%PATH%;%CD%\Adb
@REM SET PATH

@REM 无限循环的标签
:LOOP

ECHO 等待您插入手机…
adb wait-for-device

@REM 循环安装本目录下的APK文件
FOR %%i IN (*.apk) DO ( 
 	ECHO 正在安装：%%i
 	adb install "%%i"
 	)

ECHO 安装好了；换一台手机吧！！！
PAUSE
GOTO LOOP

@ECHO on