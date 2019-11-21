@echo off
::===============================================
set PATH=C:\Windows\System32
set PATH=C:\Users\Admin\Downloads\Programs\ReadyBin\win;%PATH%
set PATH=C:\MinGW\bin;%PATH%
set PATH=C:\Users\Admin\Downloads\Programs\ReadyLib\dev\opencv\c\3.4.7\mingw64\bin;%PATH%
set PATH=C:\Qt\Qt5.8.0\5.8\mingw53_32\bin;%PATH%
::===============================================
set GGIT="C:\Program Files\Git\bin\git.exe"
set GPROJECT=C:\Users\Admin\Downloads\Programs\ReadyGsl
set GBUILD=C:\Users\Admin\Downloads\Programs\ReadyGsl\c\win
set GBIN=C:\Users\Admin\Downloads\Programs\ReadyGsl\c\win\bin
set GPWD=%cd%
::===============================================
set GPROCESS="%1"
::===============================================
if %GPROCESS% == "compile" (
    goto :compile
) else ( 
if %GPROCESS% == "clean" (
    goto :clean
) else ( 
if %GPROCESS% == "git_push_all" (
    goto :git_push_all
) else ( 
if %GPROCESS% == "git_pull" (
    goto :git_pull
) else ( 
    goto :run
))))
::===============================================
:: GSL
::===============================================
:compile
    cd %GBUILD%
    ::-----------------------------------------------
    mingw32-make
    ::-----------------------------------------------
    cd %GPWD%
goto :eof
::===============================================
:clean
    cd %GBUILD%
    ::-----------------------------------------------
    mingw32-make clean
    ::-----------------------------------------------
    cd %GPWD%
goto :eof
::===============================================
:run
    cd %GBIN%
    ::-----------------------------------------------
    echo.
    GGsl.exe %*
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
