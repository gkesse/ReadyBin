@echo off
::===============================================
call .config.bat
::===============================================
if "%GBIN_UTILS%" == "" ( echo GBIN_UTILS ? & goto :eof ) 
if not exist %GBIN_UTILS% ( echo GBIN_UTILS ? & goto :eof )
if "%GNU_WIN32%" == "" ( echo GNU_WIN32 ? & goto :eof ) 
if not exist %GNU_WIN32% ( echo GNU_WIN32 ? & goto :eof )
::===============================================
set "GPWD=%cd%"
::===============================================
set "PATH=%GNU_WIN32%;%PATH%"
set "PATH=%GBIN_UTILS%;%PATH%"
::===============================================
goto :GBinUtils_main
::===============================================
:GBinUtils_main
if "%1" == "" ( goto :GBinUtils_help
) else ( goto :GBinUtils_process )
goto :eof
::===============================================
:GBinUtils_help
set "GSCRPIT=%0"
set "GTAB=    "
echo.
echo Description:
echo %GTAB%Operations sur les commandes git.
echo.
echo Utilisation:
echo %GTAB%%GSCRPIT% : afficher aide
echo %GTAB%%GSCRPIT% tes : tester module
echo %GTAB%%GSCRPIT% bin : binutils utiliser binaire
echo %GTAB%%GSCRPIT% obd : objdump lister functions dll
echo.
goto :eof
::===============================================
:GBinUtils_process
if "%1" == "tes" ( goto :GBinUtils_test
) else ( if "%1" == "bin" ( goto :GBinUtils_bin
) else ( if "%1" == "obd" ( goto :GBinUtils_objdump
) else ( goto :GBinUtils_help
)))
goto :eof
::===============================================
:GBinUtils_test

goto :eof
::===============================================
:GBinUtils_bin
%2 %3 %4 %5 %6 %7 %8 %9
goto :eof
::===============================================
:GBinUtils_objdump
objdump %2 %3 %4 %5 %6 %7 %8 %9
goto :eof
::===============================================
