SET NGINX_DIR=D:\nginx\


taskkill /F /IM nginx.exe

set d1cm_prodcut=move %NGINX_DIR%logs\d1cm_product.log %NGINX_DIR%logs2\d1cm_product_%date:~0,4%-%date:~5,2%-%date:~8,2%.log
set d1cm_www=move %NGINX_DIR%logs\d1cm_www.log %NGINX_DIR%logs2\d1cm_www_%date:~0,4%-%date:~5,2%-%date:~8,2%.log
set d1cm_photo=move %NGINX_DIR%logs\d1cm_photo.log %NGINX_DIR%logs2\d1cm_photo_%date:~0,4%-%date:~5,2%-%date:~8,2%.log
set d1cm_news=move %NGINX_DIR%logs\d1cm_news.log %NGINX_DIR%logs2\d1cm_news_%date:~0,4%-%date:~5,2%-%date:~8,2%.log
set d1cm_dealer=move %NGINX_DIR%logs\d1cm_dealer.log %NGINX_DIR%logs2\d1cm_dealer_%date:~0,4%-%date:~5,2%-%date:~8,2%.log
set d1cm_video=move %NGINX_DIR%logs\d1cm_video.log %NGINX_DIR%logs2\d1cm_video_%date:~0,4%-%date:~5,2%-%date:~8,2%.log

call %d1cm_prodcut%
call %d1cm_www%
call %d1cm_photo%
call %d1cm_news%
call %d1cm_dealer%
call %d1cm_video%


cd /d "%NGINX_DIR%"

start %NGINX_DIR%nginx.exe

PAUSE