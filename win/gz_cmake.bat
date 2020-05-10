@echo off
::===============================================
call .config.bat
::===============================================
if "%GMINGW_BIN%" == "" ( echo GMINGW_BIN ? & goto :eof ) 
if not exist "%GMINGW_BIN%" ( echo GMINGW_BIN ? & goto :eof )
if "%GMINGW_BIN_64%" == "" ( echo GMINGW_BIN_64 ? & goto :eof ) 
if not exist "%GMINGW_BIN_64%" ( echo GMINGW_BIN_64 ? & goto :eof )
if "%GCMAKE_BIN%" == "" ( echo GCMAKE_BIN ? & goto :eof ) 
if not exist "%GCMAKE_BIN%" ( echo GCMAKE_BIN ? & goto :eof )
::===============================================
set "PATH=%GMINGW_BIN%;%PATH%"
set "PATH=%GCMAKE_BIN%;%PATH%"
::===============================================
set "GPWD=%cd%"
::===============================================
goto :GCMake_main
::===============================================
:GCMake_main
if "%1" == "" ( goto :GCMake_help
) else ( goto :GCMake_process )
goto :eof
::===============================================
:GCMake_help
set "GSCRPIT=%0"
set "GTAB=    "
echo.
echo Description:
echo %GTAB%Operations sur les commandes cmake.
echo.
echo Utilisation:
echo %GTAB%%GSCRPIT% : afficher aide
echo %GTAB%%GSCRPIT% tes : tester module
echo %GTAB%%GSCRPIT% sta : demarrer cmake
echo.
goto :eof
::===============================================
:GCMake_process
if "%1" == "tes" ( goto :GCMake_test 
) else ( if "%1" == "sta" ( goto :GCMake_start 
) else ( goto :GCMake_help
))
goto :eof
::===============================================
:GCMake_test

goto :eof
::===============================================
:GCMake_start
cmake-gui
goto :eof
::===============================================
