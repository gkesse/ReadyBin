@echo off
::===============================================
set PATH=C:\Windows\System32
set PATH=C:\Users\Admin\Downloads\Programs\ReadyBin\win;%PATH%
::===============================================
set GGIT="C:\Program Files\Git\bin\git.exe"
set GPROJECT=C:\Users\Admin\Downloads\Programs\ReadyBatch
set GCODE=C:\Users\Admin\Downloads\Programs\ReadyBatch\code
set GPWD=%cd%
::===============================================
set GPROCESS=%1
::===============================================
if "%GPROCESS%" == "git_push_all" ( goto :git_push_all
) else ( if "%GPROCESS%" == "git_pull" ( goto :git_pull
) else ( goto :run ))
::===============================================
:: BATCH
::===============================================
:run
    cd %GCODE%
    ::-----------------------------------------------
    echo.
    call GAdmin %*
    echo.
    ::-----------------------------------------------
    cd %GPWD%
goto :eof
::===============================================
:: GIT
::===============================================
:git_push_all
    cd %GPROJECT%
    ::-----------------------------------------------
    %GGIT% add --all
    %GGIT% commit -m "Initial Commit"
    %GGIT% push -u origin master
    ::-----------------------------------------------
    cd %GPWD%
goto :eof
::===============================================
:git_pull
    cd %GPROJECT%
    ::-----------------------------------------------
    %GGIT% pull
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
