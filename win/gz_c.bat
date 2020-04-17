@echo off
::===============================================
call .config.bat
::===============================================
if "%GC_PATH%" == "" ( echo GC_PATH ? & goto :eof ) 
if not exist %GC_PATH% ( echo GC_PATH ? & goto :eof )
if "%GC_BUILD%" == "" ( echo GC_BUILD ? & goto :eof ) 
if not exist %GC_BUILD% ( echo GC_BUILD ? & goto :eof )
if "%GMINGW_BIN%" == "" ( echo GMINGW_BIN ? & goto :eof ) 
if not exist %GMINGW_BIN% ( echo GMINGW_BIN ? & goto :eof )
if "%GMINGW_W64%" == "" ( echo GMINGW_W64 ? & goto :eof ) 
if not exist %GMINGW_W64% ( echo GMINGW_W64 ? & goto :eof )
if "%GCYGWIN_BIN%" == "" ( echo GCYGWIN_BIN ? & goto :eof ) 
if not exist %GCYGWIN_BIN% ( echo GCYGWIN_BIN ? & goto :eof )
::===============================================
set "PATH=%GMINGW_W64%;%PATH%"
set "PATH=%GMINGW_BIN%;%PATH%"
set "PATH=%GC_BUILD%\bin;%PATH%"
::===============================================
set "GPWD=%cd%"
::===============================================
goto :GC_main
::===============================================
:GC_main
if "%1" == "" ( goto :GC_help
) else ( goto :GC_process )
goto :eof
::===============================================
:GC_help
set "GSCRPIT=%0"
set "GTAB=    "
echo.
echo Description:
echo %GTAB%Operations sur les applications c.
echo.
echo Utilisation:
echo %GTAB%%GSCRPIT% : afficher aide
echo %GTAB%%GSCRPIT% tes : tester module
echo %GTAB%%GSCRPIT% cle : nettoyer module
echo %GTAB%%GSCRPIT% rmv : supprimer module
echo %GTAB%%GSCRPIT% com : compiler module
echo %GTAB%%GSCRPIT% run : executer module
echo %GTAB%%GSCRPIT% all : compiler executer module
echo %GTAB%%GSCRPIT% log : afficher log module
echo %GTAB%%GSCRPIT% git_pa : git ajouter commiter pousser modifications
echo %GTAB%%GSCRPIT% git_pu : git tirer modifications
echo.
goto :eof
::===============================================
:GC_process
if "%1" == "tes" ( goto :GC_test
) else ( if "%1" == "cle" ( goto :GC_clean
) else ( if "%1" == "rmv" ( goto :GC_remove
) else ( if "%1" == "com" ( goto :GC_compile
) else ( if "%1" == "run" ( goto :GC_run
) else ( if "%1" == "all" ( goto :GC_all
) else ( if "%1" == "log" ( goto :GC_log
) else ( if "%1" == "git_pa" ( goto :GC_git_push_all
) else ( if "%1" == "git_pu" ( goto :GC_git_pull
) else ( goto :GC_help
)))))))))
goto :eof
::===============================================
:GC_test

goto :eof
::===============================================
:GC_clean
cd %GC_BUILD%
mingw32-make clean -f Makefile.config
cd %GPWD%
goto :eof
::===============================================
:GC_remove
cd %GC_BUILD%
if "%2" == "" ( echo module ? & goto :eof )
del build\*%2*
cd %GPWD%
goto :eof
::===============================================
:GC_compile
cd %GC_BUILD%
del bin\gp_c.exe
mingw32-make compile -f Makefile.config
cd %GPWD%
goto :eof
::===============================================
:GC_run
echo.
gp_c %2 %3 %4 %5 %6 %7 %8 %9
echo.
cd %GPWD%
goto :eof
::===============================================
:GC_all
cd %GC_BUILD%
del bin\gp_c.exe
mingw32-make compile -f Makefile.config
echo.
gp_c %2 %3 %4 %5 %6 %7 %8 %9
echo.
cd %GPWD%
goto :eof
::===============================================
:GC_log
cd %GC_BUILD%
set "lPath=%HOMEDRIVE%%HOMEPATH%\.readydev\readyc\data\debug\debug.txt"
%GCYGWIN_BIN%\tail -f %lPath%
cd %GPWD%
goto :eof
::===============================================
:GC_git_push_all
cd %GC_PATH%
git add --all
git commit -m "Initial Commit"
git push -u origin master
cd %GPWD%
goto :eof
::===============================================
:GC_git_pull
cd %GC_PATH%
git pull
cd %GPWD%
goto :eof
::===============================================
