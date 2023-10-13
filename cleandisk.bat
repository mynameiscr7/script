@echo off
echo 【快捷格机脚本】
echo list disk >>disk.txt
for /f %%i in ('diskpart /s disk.txt^|find /c "联机"') do Set HardDrivers=%%i
del disk.txt /q
set /a num=HardDrivers-1

for /l %%i in (0,1,%num%) do (
echo sel disk %%i >> diskpart.txt
echo clean >> diskpart.txt)

::diskpart /s diskpart.txt

::del diskpart.txt /q

::shutdown -s -t 3