D:
cd D:\nginx\
taskkill /F /IM nginx.exe > nul
echo %date% %time% 关闭Nginx >> 定时启动日志.log
ping 127.0.0.1 -n 5
start nginx
echo %date% %time% 启动Nginx >> 定时启动日志.log