D:
cd D:\nginx\
taskkill /F /IM nginx.exe > nul
echo %date% %time% �ر�Nginx >> ��ʱ������־.log
ping 127.0.0.1 -n 5
start nginx
echo %date% %time% ����Nginx >> ��ʱ������־.log