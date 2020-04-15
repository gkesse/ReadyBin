@echo off
::===============================================
call .config.bat
::===============================================
if "%GCPP_BUILD%" == "" ( echo GCPP_BUILD ? & goto :eof ) 
if not exist %GCPP_BUILD% ( echo GCPP_BUILD ? & goto :eof )
if "%GMUPARSER_BIN%" == "" ( echo GMUPARSER_BIN ? & goto :eof ) 
if not exist %GMUPARSER_BIN% ( echo GMUPARSER_BIN ? & goto :eof )
if "%GMINGW_BIN%" == "" ( echo GMINGW_BIN ? & goto :eof ) 
if not exist %GMINGW_BIN% ( echo GMINGW_BIN ? & goto :eof )
if "%GMINGW_BIN_64%" == "" ( echo GMINGW_BIN_64 ? & goto :eof ) 
if not exist %GMINGW_BIN_64% ( echo GMINGW_BIN_64 ? & goto :eof )
if "%GCYGWIN_BIN%" == "" ( echo GCYGWIN_BIN ? & goto :eof ) 
if not exist %GCYGWIN_BIN% ( echo GCYGWIN_BIN ? & goto :eof )
::===============================================
::set PATH=%GMINGW_BIN%;%PATH%
set PATH=%GMUPARSER_BIN%;%PATH%
set PATH=%GCPP_BUILD%\bin;%PATH%
::===============================================
set "GPWD=%cd%"
::===============================================
goto :GCpp_main
::===============================================
:GCpp_main
if "%1" == "" ( goto :GCpp_help
) else ( goto :GCpp_process )
goto :eof
::===============================================
:GCpp_help
set "GSCRPIT=%0"
set "GTAB=    "
echo.
echo Description:
echo %GTAB%Operations sur les applications c++.
echo.
echo Utilisation:
echo %GTAB%%GSCRPIT% : afficher aide
echo %GTAB%%GSCRPIT% cle : nettoyer module
echo %GTAB%%GSCRPIT% rmv : supprimer module
echo %GTAB%%GSCRPIT% com : compiler module
echo %GTAB%%GSCRPIT% run : executer module
echo %GTAB%%GSCRPIT% all : compiler executer module
echo %GTAB%%GSCRPIT% qma : qmake module
echo %GTAB%%GSCRPIT% qma_c : qmake compiler module
echo %GTAB%%GSCRPIT% qma_a : qmake compiler executer module
echo %GTAB%%GSCRPIT% log : afficher log module
echo.
goto :eof
::===============================================
:GCpp_process
if "%1" == "tes" ( goto :GCpp_test
) else ( if "%1" == "cle" ( goto :GCpp_clean
) else ( if "%1" == "rmv" ( goto :GCpp_remove
) else ( if "%1" == "com" ( goto :GCpp_compile
) else ( if "%1" == "run" ( goto :GCpp_run
) else ( if "%1" == "all" ( goto :GCpp_all
) else ( if "%1" == "qma" ( goto :GCpp_qmake
) else ( if "%1" == "qma_c" ( goto :GCpp_qmake_compile
) else ( if "%1" == "qma_cl" ( goto :GCpp_qmake_clean
) else ( if "%1" == "qma_a" ( goto :GCpp_qmake_all
) else ( if "%1" == "log" ( goto :GCpp_log
) else ( goto :GCpp_help
)))))))))))
goto :eof
::===============================================
:GCpp_test

goto :eof
::===============================================
:GCpp_clean
cd %GCPP_BUILD%
mingw32-make clean -f Makefile.config
cd %GPWD%
goto :eof
::===============================================
:GCpp_remove
cd %GCPP_BUILD%
if "%2" == "" ( echo module ? & goto :eof )
del build\*%2*
cd %GPWD%
goto :eof
::===============================================
:GCpp_compile
cd %GCPP_BUILD%
del bin\*.exe
mingw32-make compile -f Makefile.config
cd %GPWD%
goto :eof
::===============================================
:GCpp_run
echo.
gp_cpp %2 %3 %4 %5 %6 %7 %8 %9
echo.
goto :eof
::===============================================
:GCpp_all
cd %GCPP_BUILD%
call :GCpp_compile
call :GCpp_run %*
cd %GPWD%
goto :eof
::===============================================
:GCpp_qmake
cd %GCPP_BUILD%
qmake
cd %GPWD%
goto :eof
::===============================================
:GCpp_qmake_compile
cd %GCPP_BUILD%
del bin\*.exe
mingw32-make
cd %GPWD%
goto :eof
::===============================================
:GCpp_qmake_clean
cd %GCPP_BUILD%
mingw32-make clean
cd %GPWD%
goto :eof
::===============================================
:GCpp_qmake_all
call :GCpp_qmake
call :GCpp_qmake_compile
call :GCpp_run %*
goto :eof
::===============================================
:GCpp_log
cd %GCPP_BUILD%
%GCYGWIN_BIN%/tail -f data\debug\debug\debug.txt
cd %GPWD%
goto :eof
::===============================================
