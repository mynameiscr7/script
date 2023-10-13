@echo off
title 系统与office激活

%1 %2
ver|find "5.">nul&&goto :start
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :start","","runas",1)(window.close)&goto :eof

set kms="10.254.6.33"
set x6416="C:\Program Files\Microsoft Office\Office16\OSPP.VBS"
set x6413="C:\Program Files\Microsoft Office\Office15\OSPP.VBS"
set x6410="C:\Program Files\Microsoft Office\Office14\OSPP.VBS"
set x8616="C:\Program Files (x86)\Microsoft Office\Office16\OSPP.VBS"
set x8613="C:\Program Files (x86)\Microsoft Office\Office15\OSPP.VBS"
set x8610="C:\Program Files (x86)\Microsoft Office\Office14\OSPP.VBS"

::系统激活
slmgr /skms %kms%
slmgr /ato
slmgr /xpr

::office激活
if "%PROCESSOR_ARCHITECTURE%"=="x86" goto x86
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" goto x64

:x86
cscript %x8610% /sethst:%kms% || cscript %x8613% /sethst:%kms% || cscript %x8616% /sethst:%kms%
cscript %x8610% /act || cscript %x8613% /act || cscript %x8616% /act
exit

:x64
cscript %x6410% /sethst:%kms% || cscript %x6413% /sethst:%kms% || cscript %x6416% /sethst:%kms%
cscript %x6410% /act || cscript %x6413% /act || cscript %x6416% /act
exit