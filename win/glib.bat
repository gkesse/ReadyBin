@echo off
::===============================================
set PATH=C:\MinGW\bin
set PATH=C:\Users\Admin\Downloads\Programs\ReadyBin;%PATH%
set PATH=C:\Windows\System32;%PATH%
::===============================================
set GLIB_ROOT=C:\Users\Admin\Downloads\Programs\ReadyLib\mingw
set GPROGRAMS_ROOT=C:\Users\Admin\Downloads\Programs
set GPWD=%cd%
::===============================================
set GPROCESS=%1
set GOPTION_1=%2
set GOPTION_2=%3
::===============================================
set GGIT="C:\Program Files\Git\bin\git.exe"
::===============================================
if "%GPROCESS%" == "install_lib" ( 
    if "%GOPTION_1%" == "" ( goto :error
    ) else ( goto :install_lib )
) else ( 
if "%GPROCESS%" == "install_all" ( 
    goto :install_all
) else ( 
if "%GPROCESS%" == "git_push_all" ( 
    goto :git_push_all
) else ( 
if "%GPROCESS%" == "git_pull" ( 
    goto :git_pull
) else ( 
if "%GPROCESS%" == "git_clone" ( 
    if "%GOPTION_1%" == "" ( goto :error
    ) else ( goto :git_clone )
) else ( 
if "%GPROCESS%" == "git_log" ( 
    goto :git_log
) else ( 
if "%GPROCESS%" == "git_checkout" ( 
    if "%GOPTION_1%" == "" ( goto :error
    ) else ( 
    if "%GOPTION_2%" == "" ( goto :error
    ) else ( goto :git_checkout ))
) else ( 
    goto :error
)))))))
::===============================================
:install_lib
    cd %GLIB_ROOT%
    ::-----------------------------------------------
    cmd_install_lib %GOPTION_1%
    ::-----------------------------------------------
    cd %GPWD%
goto :eof
::===============================================
:install_all
    cd %GLIB_ROOT%
    ::-----------------------------------------------
    cmd_install_lib all
    ::-----------------------------------------------
    cd %GPWD%
goto :eof
::===============================================
:: GIT
::===============================================
:git_push_all
    cd %GLIB_ROOT%\..
    ::-----------------------------------------------
    %GGIT% add --all
    %GGIT% commit -m "Initial Commit"
    %GGIT% push -u origin master
    ::-----------------------------------------------
    cd %GPWD%
goto :eof
::===============================================
:git_pull
    cd %GLIB_ROOT%\..
    ::-----------------------------------------------
    %GGIT% pull
    ::-----------------------------------------------
    cd %GPWD%
goto :eof
::===============================================
:git_clone
    cd %GPROGRAMS_ROOT%
    ::-----------------------------------------------
    %GGIT% clone https://github.com/gkesse/ReadyLib %GOPTION_1%
    ::-----------------------------------------------
    cd %GPWD%
goto :eof
::===============================================
:git_log
    cd %GLIB_ROOT%\..
    ::-----------------------------------------------
    %GGIT% log
    ::-----------------------------------------------
    cd %GPWD%
goto :eof
::===============================================
:git_checkout
    cd %GPROGRAMS_ROOT%\%GOPTION_1%
    ::-----------------------------------------------
    %GGIT% checkout %GOPTION_2%
    ::-----------------------------------------------
    cd %GPWD%
goto :eof
::===============================================
:: ERROR
::===============================================
:error
    ::-----------------------------------------------
    echo ERREUR: Nom du processus ?
    ::-----------------------------------------------
    cd %GPWD%
goto :eof
::===============================================
