@echo off
title IPinfo
echo.
ipconfig | find /i "IPv4"
echo.
echo 此结果为本机IP地址，截图或复制即可
pause > nul