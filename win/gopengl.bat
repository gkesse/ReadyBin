@echo off
::===============================================
set PATH=C:\Windows\System32
set PATH=C:\Users\Admin\Downloads\Programs\ReadyBin\win;%PATH%
set PATH=C:\MinGW\bin;%PATH%
::===============================================
set GGIT="C:\Program Files\Git\bin\git.exe"
set GPROJECT=C:\Users\Admin\Downloads\Programs\ReadyOpenGL
set GBUILD=C:\Users\Admin\Downloads\Programs\ReadyOpenGL\c\win
set GBIN=C:\Users\Admin\Downloads\Programs\ReadyOpenGL\c\win\bin
set GPWD=%cd%
::===============================================
set GPROCESS="%1"
::===============================================
if %GPROCESS% == "compile" ( goto :GOpenGL_Compile
) else ( if %GPROCESS% == "clean" ( goto :GOpenGL_Clean
) else ( if %GPROCESS% == "git_push_all" ( goto :GGit_PushAll
) else ( if %GPROCESS% == "git_pull" ( goto :GGit_Pull
) else ( goto :GOpenGL_Run ))))
::===============================================
:: OPENGL
::===============================================
:GOpenGL_Compile
    cd %GBUILD%
    ::-----------------------------------------------
    mingw32-make
    ::-----------------------------------------------
    cd %GPWD%
goto :eof
::===============================================
:GOpenGL_Clean
    cd %GBUILD%
    ::-----------------------------------------------
    mingw32-make clean
    ::-----------------------------------------------
    cd %GPWD%
goto :eof
::===============================================
:GOpenGL_Run
    cd %GBIN%
    ::-----------------------------------------------
    GProject.exe %*
    ::-----------------------------------------------
    cd %GPWD%
goto :eof
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
