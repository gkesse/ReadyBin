@echo off
::===============================================
call .config.bat
::===============================================
::if "%GCYGWIN_BIN%" == "" ( echo GCYGWIN_BIN ? & goto :eof ) 
::if not exist %GCYGWIN_BIN% ( echo GCYGWIN_BIN ? & goto :eof )
::===============================================
set "GPWD=%cd%"
::===============================================
goto :GStrings_main
::===============================================
:GStrings_main
if "%1" == "" ( goto :GStrings_help
) else ( goto :GStrings_process )
goto :eof
::===============================================
:GStrings_help
set "GSCRPIT=%0"
set "GTAB=    "
echo.
echo Description:
echo %GTAB%Operations sur les commandes git.
echo.
echo Utilisation:
echo %GTAB%%GSCRPIT% : afficher aide
echo %GTAB%%GSCRPIT% tes : tester module
echo %GTAB%%GSCRPIT% git_pa : git ajouter commiter pousser modifications
echo %GTAB%%GSCRPIT% git_pu : git tirer modifications
echo.
goto :eof
::===============================================
:GStrings_process
if "%1" == "tes" ( goto :GStrings_test
) else ( if "%1" == "git_pa" ( goto :GStrings_git_push_all
) else ( if "%1" == "git_pu" ( goto :GStrings_git_pull
) else ( goto :GStrings_help
)))
goto :eof
::===============================================
:GStrings_test

goto :eof
::===============================================
:GStrings_git_push_all
gz_bin git_pa &^
gz_lib git_pa &^
gz_cpp git_pa &^
gz_c git_pa &^
goto :eof
::===============================================
:GStrings_git_pull
gz_bin git_pu &^
gz_lib git_pu &^
gz_cpp git_pu &^
gz_c git_pu &^
goto :eof
::===============================================
