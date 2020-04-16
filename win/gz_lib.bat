@echo off
::===============================================
call .config.bat
::===============================================
if "%GCYGWIN_BIN%" == "" ( echo GCYGWIN_BIN ? & goto :eof ) 
if not exist %GCYGWIN_BIN% ( echo GCYGWIN_BIN ? & goto :eof )
if "%GLIB_PATH%" == "" ( echo GLIB_PATH ? & goto :eof ) 
if not exist %GLIB_PATH% ( echo GLIB_PATH ? & goto :eof )
::===============================================
set "GPWD=%cd%"
::===============================================
goto :GLib_main
::===============================================
:GLib_main
if "%1" == "" ( goto :GLib_help
) else ( goto :GLib_process )
goto :eof
::===============================================
:GLib_help
set "GSCRPIT=%0"
set "GTAB=    "
echo.
echo Description:
echo %GTAB%Operations sur les librairies.
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
:GLib_process
if "%1" == "tes" ( goto :GLib_test
) else ( if "%1" == "git_a" ( goto :GLib_git_add
) else ( if "%1" == "git_c" ( goto :GLib_git_commit
) else ( if "%1" == "git_p" ( goto :GLib_git_push
) else ( if "%1" == "git_pa" ( goto :GLib_git_push_all
) else ( if "%1" == "git_pu" ( goto :GLib_git_pull
) else ( goto :GLib_help
))))))
goto :eof
::===============================================
:GLib_test

goto :eof
::===============================================
:GLib_git_add
cd %GLIB_PATH%
git add --all
cd %GPWD%
goto :eof
::===============================================
:GLib_git_commit
cd %GLIB_PATH%
git commit -m "Initial Commit"
cd %GPWD%
goto :eof
::===============================================
:GLib_git_push
cd %GLIB_PATH%
git push -u origin master
cd %GPWD%
goto :eof
::===============================================
:GLib_git_push_all
cd %GLIB_PATH%
git add --all
git commit -m "Initial Commit"
git push -u origin master
cd %GPWD%
goto :eof
::===============================================
:GLib_git_pull
cd %GLIB_PATH%
git pull
cd %GPWD%
goto :eof
::===============================================
