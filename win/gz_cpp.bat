@echo off
::===============================================
call .config.bat
::===============================================
if "%GCPP_PATH%" == "" ( echo GCPP_PATH ? & goto :eof ) 
if not exist %GCPP_PATH% ( echo GCPP_PATH ? & goto :eof )
if "%GCPP_BUILD%" == "" ( echo GCPP_BUILD ? & goto :eof ) 
if not exist %GCPP_BUILD% ( echo GCPP_BUILD ? & goto :eof )
if "%GMINGW_BIN%" == "" ( echo GMINGW_BIN ? & goto :eof ) 
if not exist %GMINGW_BIN% ( echo GMINGW_BIN ? & goto :eof )
if "%GMINGW_W64%" == "" ( echo GMINGW_W64 ? & goto :eof ) 
if not exist %GMINGW_W64% ( echo GMINGW_W64 ? & goto :eof )
if "%GMINGW_QT%" == "" ( echo GMINGW_QT ? & goto :eof ) 
if not exist %GMINGW_QT% ( echo GMINGW_QT ? & goto :eof )
if "%GCYGWIN_BIN%" == "" ( echo GCYGWIN_BIN ? & goto :eof ) 
if not exist %GCYGWIN_BIN% ( echo GCYGWIN_BIN ? & goto :eof )
::===============================================
set "PATH=%GMINGW_BIN%;%PATH%"
set "PATH=%GMINGW_W64%;%PATH%"
set "PATH=%GMUPARSER_BIN%;%PATH%"
set "PATH=%GOPENCV_BIN%;%PATH%"
set "PATH=%GCPP_BUILD%\bin;%PATH%"
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
echo %GTAB%%GSCRPIT% tes : tester module
echo %GTAB%%GSCRPIT% cle : nettoyer module
echo %GTAB%%GSCRPIT% rmv : supprimer module
echo %GTAB%%GSCRPIT% com : compiler module
echo %GTAB%%GSCRPIT% run : executer module
echo %GTAB%%GSCRPIT% all : compiler executer module
echo %GTAB%%GSCRPIT% qma : qmake module
echo %GTAB%%GSCRPIT% qma_c : qmake compiler module
echo %GTAB%%GSCRPIT% qma_a : qmake compiler executer module
echo %GTAB%%GSCRPIT% log : afficher log module
echo %GTAB%%GSCRPIT% git_pa : git ajouter commiter pousser modifications
echo %GTAB%%GSCRPIT% git_pu : git tirer modifications
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
) else ( if "%1" == "git_pa" ( goto :GCpp_git_push_all
) else ( if "%1" == "git_pu" ( goto :GCpp_git_pull
) else ( goto :GCpp_help
)))))))))))))
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
del bin\gp_cpp.exe
mingw32-make compile -f Makefile.config
cd %GPWD%
goto :eof
::===============================================
:GCpp_run
echo.
gp_cpp %2 %3 %4 %5 %6 %7 %8 %9
echo.
cd %GPWD%
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
del bin\gp_cpp.exe
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
cd %GPWD%
goto :eof
::===============================================
:GCpp_log
cd %GCPP_BUILD%
set "lPath=%HOMEDRIVE%%HOMEPATH%\.readydev\readycpp\data\debug\debug.txt"
%GCYGWIN_BIN%\tail -f %lPath%
cd %GPWD%
goto :eof
::===============================================
:GCpp_git_push_all
cd %GCPP_PATH%
git add --all
git commit -m "Initial Commit"
git push -u origin master
cd %GPWD%
goto :eof
::===============================================
:GCpp_git_pull
cd %GCPP_PATH%
git pull
cd %GPWD%
goto :eof
::===============================================
