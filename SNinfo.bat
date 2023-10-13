@echo off
title SNinfo
wmic bios get serialnumber
echo.
echo 此结果为本机SN，截图或复制即可
pause > nul