:作业帮dns自动修改脚本
@echo off
title 自动修改DNS
:MENU
ECHO.
ECHO.               =-=-=-=-=菜单选择=-=-=-=-=
ECHO.                       1  修改为公司内网DNS
ECHO.                       2  恢复为DHCP下发DNS
ECHO.                       0  退出
ECHO.
ECHO.               =-=-=-=-=-=-=-=-=-=-=-=-=
ECHO.
set /p  ID=请输入选择项目的序号（例：1、2、0）：
if "%id%"=="1" goto cmd1
if "%id%"=="2" goto cmd2
if "%id%"=="0" exit

:cmd1
netsh interface ip set dnsservers "以太网" static 192.168.1.1 primary
netsh interface ip add dnsservers "以太网" 192.168.1.2 index=2
netsh interface ip set dnsservers "WLAN" static 192.168.1.1 primary
netsh interface ip add dnsservers "WLAN" 192.168.1.2 index=2
ipconfig /flushdns
goto MENU

:cmd2
netsh interface ip set dnsservers "以太网" source=dhcp
netsh interface ip set dnsservers "WLAN" source=dhcp
ipconfig /flushdns
goto MENU