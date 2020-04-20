@echo off
::===============================================
call .config.bat
::===============================================
set "GPWD=%cd%"
::===============================================
goto :GEclipse_main
::===============================================
:GEclipse_main
if "%1" == "" ( goto :GEclipse_help
) else ( goto :GEclipse_process )
goto :eof
::===============================================
:GEclipse_help
set "GSCRPIT=%0"
set "GTAB=    "
echo.
echo Description:
echo %GTAB%Operations sur les commandes eclipse.
echo.
echo Utilisation:
echo %GTAB%%GSCRPIT% : afficher aide
echo %GTAB%%GSCRPIT% tes : tester module
echo %GTAB%%GSCRPIT% sta : demarrer eclipse
echo.
goto :eof
::===============================================
:GEclipse_process
if "%1" == "tes" ( goto :GEclipse_test 
) else ( if "%1" == "sta" ( goto :GEclipse_start 
) else ( goto :GEclipse_help
))
goto :eof
::===============================================
:GEclipse_test

goto :eof
::===============================================
:GEclipse_start
eclipse
goto :eof
::===============================================
