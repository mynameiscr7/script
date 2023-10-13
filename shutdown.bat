@echo off
msg * "600秒后自动关机"
::shutdown -s -t 600
timeout /nobreak /t 600
