@echo off
::===============================================
call .config.bat
::===============================================
if "%GCYGWIN_BIN%" == "" ( echo GCYGWIN_BIN ? & goto :eof ) 
if not exist %GCYGWIN_BIN% ( echo GCYGWIN_BIN ? & goto :eof )
if "%GBIN_PATH%" == "" ( echo GBIN_PATH ? & goto :eof ) 
if not exist %GBIN_PATH% ( echo GBIN_PATH ? & goto :eof )
::===============================================
set "GPWD=%cd%"
::===============================================
goto :GBin_main
::===============================================
:GBin_main
if "%1" == "" ( goto :GBin_help
) else ( goto :GBin_process )
goto :eof
::===============================================
:GBin_help
set "GSCRPIT=%0"
set "GTAB=    "
echo.
echo Description:
echo %GTAB%Operations sur les binaires.
echo.
echo Utilisation:
echo %GTAB%%GSCRPIT% : afficher aide
echo %GTAB%%GSCRPIT% tes : tester module
echo %GTAB%%GSCRPIT% git_a : git ajouter modifications
echo %GTAB%%GSCRPIT% git_c : git commiter modifications
echo %GTAB%%GSCRPIT% git_p : git pousser modifications
echo %GTAB%%GSCRPIT% git_pa : git ajouter commiter pousser modifications
echo %GTAB%%GSCRPIT% git_pu : git tirer modifications
echo.
goto :eof
::===============================================
:GBin_process
if "%1" == "tes" ( goto :GBin_test
) else ( if "%1" == "git_a" ( goto :GBin_git_add
) else ( if "%1" == "git_c" ( goto :GBin_git_commit
) else ( if "%1" == "git_p" ( goto :GBin_git_push
) else ( if "%1" == "git_pa" ( goto :GBin_git_push_all
) else ( if "%1" == "git_pu" ( goto :GBin_git_pull
) else ( goto :GBin_help
))))))
goto :eof
::===============================================
:GBin_test

goto :eof
::===============================================
:GBin_git_add
cd %GBIN_PATH%
git add --all
cd %GPWD%
goto :eof
::===============================================
:GBin_git_commit
cd %GBIN_PATH%
git commit -m "Initial Commit"
cd %GPWD%
goto :eof
::===============================================
:GBin_git_push
cd %GBIN_PATH%
git push -u origin master
cd %GPWD%
goto :eof
::===============================================
:GBin_git_push_all
cd %GBIN_PATH%
git add --all
git commit -m "Initial Commit"
git push -u origin master
cd %GPWD%
goto :eof
::===============================================
:GBin_git_pull
cd %GBIN_PATH%
git pull
cd %GPWD%
goto :eof
::===============================================
