@echo off
rem 提供Windows下nginx的启动，重启，关闭功能

cls

color 0a
TITLE Nginx 管理程序


::*************************************************************************************************************
:MENU
echo.
echo. * * * * * * *     Nginx 管理程序    * * * * * * * * * * * * * * * * * *
echo. 
echo.  [1] 启动Nginx
echo.  [2] 重新加载Nginx配置文件
echo.  [3] 关闭Nginx
echo.  [4] 查看Nginx版本
echo.  [5] 检查测试nginx配置文件
echo.  [0] 退 出 
echo. 

set /p ID=请输入选择项目的序号：
IF "%id%"=="1" GOTO start
IF "%id%"=="2" GOTO reloadConf
IF "%id%"=="3" GOTO stop
IF "%id%"=="4" GOTO showVersion
IF "%id%"=="5" GOTO checkConf
IF "%id%"=="9" EXIT
PAUSE

::*************************************************************************************************************
::启动
:start 
	call :startNginx
	GOTO MENU
	
::重新加载Nginx配置文件
:reloadConf 
    rem call :checkConfNginx
	call :reloadConfNginx
	GOTO MENU
	
::停止
:stop 
	call :shutdownNginx
	GOTO MENU
	
::检查测试配置文件
:checkConf 
	call :checkConfNginx
	GOTO MENU
	
::显示nginx版本
:showVersion 
    call :showVersionNginx
	GOTO MENU
	
::*************************************************************************************
::底层
::*************************************************************************************
:startNginx
	echo. 
	echo.启动Nginx...... 
	IF NOT EXIST "nginx.exe" (
        echo "nginx.exe"不存在
        goto :eof
     )

	IF EXIST "nginx.exe" (
		echo "start '' nginx.exe"
		start "" nginx.exe
	)
	echo.OK
	goto :eof
	
::重新加载 nginx 配置文件
:reloadConfNginx
	echo. 
	echo.重新加载 nginx 配置文件...... 
	IF NOT EXIST "nginx.exe" (
        echo "nginx.exe"不存在
        goto :eof
    )

	nginx -s reload
	echo. 
	
	goto :eof	
	
:shutdownNginx
	echo. 
	echo.关闭Nginx...... 
	taskkill /F /IM nginx.exe > nul
	echo.OK,关闭所有nginx 进程
	echo. 
	
	goto :eof	
	
:checkConfNginx
	echo. 
	echo.检查测试 nginx 配置文件...... 
	IF NOT EXIST "nginx.exe" (
        echo "nginx.exe"不存在
        goto :eof
    )


	nginx -t -c conf/nginx.conf
	echo. 
	
	goto :eof

::显示nginx版本
:showVersionNginx
	echo. 
	
	nginx -V
	echo. 
	
 	goto :eof