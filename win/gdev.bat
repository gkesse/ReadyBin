@echo off
::===============================================
set PATH=C:\Windows\System32
set PATH=C:\Users\Admin\Downloads\Programs\ReadyBin\win;%PATH%
::===============================================
set GGIT="C:\Program Files\Git\bin\git.exe"
set GPROJECT=C:\Users\Admin\Downloads\Programs\ReadyDev
set GPWD=%cd%
::===============================================
set GPROCESS="%1"
::===============================================
if %GPROCESS% == "git_push_all" ( goto :GGit_PushAll
) else ( if %GPROCESS% == "git_pull" ( goto :GGit_Pull
) else ( goto :GProcess_Error ))
::===============================================
:: GIT
::===============================================
:GGit_PushAll
    cd %GPROJECT%
    ::-----------------------------------------------
    %GGIT% add --all
    %GGIT% commit -m "Initial Commit"
    %GGIT% push -u origin master
    ::-----------------------------------------------
    cd %GPWD%
goto :eof
::===============================================
:GGit_Pull
    cd %GPROJECT%
    ::-----------------------------------------------
    %GGIT% pull
    ::-----------------------------------------------
    cd %GPWD%
goto :eof
::===============================================
:: ERROR
::===============================================
:GProcess_Error
    ::-----------------------------------------------
    echo ERREUR: Nom du processus ?
    ::-----------------------------------------------
    cd %GPWD%
goto :eof
::===============================================
