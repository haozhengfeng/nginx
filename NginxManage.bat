@echo off
rem �ṩWindows��nginx���������������رչ���

cls

color 0a
TITLE Nginx �������


::*************************************************************************************************************
:MENU
echo.
echo. * * * * * * *     Nginx �������    * * * * * * * * * * * * * * * * * *
echo. 
echo.  [1] ����Nginx
echo.  [2] ���¼���Nginx�����ļ�
echo.  [3] �ر�Nginx
echo.  [4] �鿴Nginx�汾
echo.  [5] ������nginx�����ļ�
echo.  [0] �� �� 
echo. 

set /p ID=������ѡ����Ŀ����ţ�
IF "%id%"=="1" GOTO start
IF "%id%"=="2" GOTO reloadConf
IF "%id%"=="3" GOTO stop
IF "%id%"=="4" GOTO showVersion
IF "%id%"=="5" GOTO checkConf
IF "%id%"=="9" EXIT
PAUSE

::*************************************************************************************************************
::����
:start 
	call :startNginx
	GOTO MENU
	
::���¼���Nginx�����ļ�
:reloadConf 
    rem call :checkConfNginx
	call :reloadConfNginx
	GOTO MENU
	
::ֹͣ
:stop 
	call :shutdownNginx
	GOTO MENU
	
::�����������ļ�
:checkConf 
	call :checkConfNginx
	GOTO MENU
	
::��ʾnginx�汾
:showVersion 
    call :showVersionNginx
	GOTO MENU
	
::*************************************************************************************
::�ײ�
::*************************************************************************************
:startNginx
	echo. 
	echo.����Nginx...... 
	IF NOT EXIST "nginx.exe" (
        echo "nginx.exe"������
        goto :eof
     )

	IF EXIST "nginx.exe" (
		echo "start '' nginx.exe"
		start "" nginx.exe
	)
	echo.OK
	goto :eof
	
::���¼��� nginx �����ļ�
:reloadConfNginx
	echo. 
	echo.���¼��� nginx �����ļ�...... 
	IF NOT EXIST "nginx.exe" (
        echo "nginx.exe"������
        goto :eof
    )

	nginx -s reload
	echo. 
	
	goto :eof	
	
:shutdownNginx
	echo. 
	echo.�ر�Nginx...... 
	taskkill /F /IM nginx.exe > nul
	echo.OK,�ر�����nginx ����
	echo. 
	
	goto :eof	
	
:checkConfNginx
	echo. 
	echo.������ nginx �����ļ�...... 
	IF NOT EXIST "nginx.exe" (
        echo "nginx.exe"������
        goto :eof
    )


	nginx -t -c conf/nginx.conf
	echo. 
	
	goto :eof

::��ʾnginx�汾
:showVersionNginx
	echo. 
	
	nginx -V
	echo. 
	
 	goto :eof