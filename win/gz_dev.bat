@echo off
::===============================================
call .config.bat
::===============================================
if "%GCYGWIN_BIN%" == "" ( echo GCYGWIN_BIN ? & goto :eof ) 
if not exist %GCYGWIN_BIN% ( echo GCYGWIN_BIN ? & goto :eof )
if "%GDEV_PATH%" == "" ( echo GDEV_PATH ? & goto :eof ) 
if not exist %GDEV_PATH% ( echo GDEV_PATH ? & goto :eof )
::===============================================
set "GPWD=%cd%"
::===============================================
goto :GDev_main
::===============================================
:GDev_main
if "%1" == "" ( goto :GDev_help
) else ( goto :GDev_process )
goto :eof
::===============================================
:GDev_help
set "GSCRPIT=%0"
set "GTAB=    "
echo.
echo Description:
echo %GTAB%Operations sur le dossier ReadyDev.
echo.
echo Utilisation:
echo %GTAB%%GSCRPIT% : afficher aide
echo %GTAB%%GSCRPIT% tes : tester module
echo %GTAB%%GSCRPIT% git_pa : git ajouter commiter pousser modifications
echo %GTAB%%GSCRPIT% git_pu : git tirer modifications
echo.
goto :eof
::===============================================
:GDev_process
if "%1" == "tes" ( goto :GDev_test
) else ( if "%1" == "git_pa" ( goto :GDev_git_push_all
) else ( if "%1" == "git_pu" ( goto :GDev_git_pull
) else ( goto :GDev_help
)))
goto :eof
::===============================================
:GDev_test

goto :eof
::===============================================
:GDev_git_push_all
cd %GDEV_PATH%
git add --all
git commit -m "Initial Commit"
git push -u origin master
cd %GPWD%
goto :eof
::===============================================
:GDev_git_pull
cd %GDEV_PATH%
git pull
cd %GPWD%
goto :eof
::===============================================
