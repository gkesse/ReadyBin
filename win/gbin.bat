@echo off
::===============================================
set PATH=C:\Windows\System32
set PATH=C:\Users\Admin\Downloads\Programs\ReadyBin\win;%PATH%
::===============================================
set GBIN_ROOT=C:\Users\Admin\Downloads\Programs\ReadyBin
set GPROGRAMS_ROOT=C:\Users\Admin\Downloads\Programs
set GPWD=%cd%
::===============================================
set GPROCESS=%1
set GOPTION_1=%2
set GOPTION_2=%3
::===============================================
set GGIT="C:\Program Files\Git\bin\git.exe"
::===============================================
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
)))))
::===============================================
:: GIT
::===============================================
:git_push_all
    cd %GBIN_ROOT%
    ::-----------------------------------------------
    %GGIT% add --all
    %GGIT% commit -m "Initial Commit"
    %GGIT% push -u origin master
    ::-----------------------------------------------
    cd %GPWD%
goto :eof
::===============================================
:git_pull
    cd %GBIN_ROOT%
    ::-----------------------------------------------
    %GGIT% pull
    ::-----------------------------------------------
    cd %GPWD%
goto :eof
::===============================================
:git_clone
    cd %GPROGRAMS_ROOT%
    ::-----------------------------------------------
    %GGIT% clone https://github.com/gkesse/ReadyBin %GOPTION_1%
    ::-----------------------------------------------
    cd %GPWD%
goto :eof
::===============================================
:git_log
    cd %GBIN_ROOT%
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
