@echo off
::===============================================
set GPROCESS=%1
::===============================================
call :GProcess_main %2 %3 %4 %5 %6 %7 %8 %9
goto :eof
::===============================================
:GProcess_main
if "%GPROCESS%" == "" ( goto :GProcess_help
) else ( if "%GPROCESS%" == "test" ( goto :GProcess_test
) else ( goto :GProcess_help ))
goto :eof
::===============================================
:GProcess_help
echo GProcess_help
goto :eof
::===============================================
:GProcess_test
call :GProcess_sabine_wifi_id
goto :eof
::===============================================
:GProcess_sabine_wifi_id
set lId=admin
set lPass=Salut2015box2
set lUrl=https://79.83.171.178:4430/
echo Id : %lId%
echo Pass : %lPass%
echo Url : %lUrl%
goto :eof
::===============================================
