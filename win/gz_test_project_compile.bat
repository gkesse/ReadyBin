@echo off
::===============================================
set PATH=C:\Users\Admin\Downloads\Compressed\ffmpeg-20200604-7f81785-win64-static\ffmpeg-20200604-7f81785-win64-static\bin;%PATH%
::===============================================
ffmpeg -list_devices true -f dshow -i dummy
::===============================================
