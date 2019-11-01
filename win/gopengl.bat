@echo off
::===============================================
set PATH=C:\Windows\System32
set PATH=C:\Users\Admin\Downloads\Programs\ReadyBin\win;%PATH%
set PATH=C:\MinGW\bin;%PATH%
set PATH=C:\Program Files\Java\jdk-11.0.1\bin;%PATH%
set PATH=C:\Users\Admin\Downloads\eclipse-cpp-2019-03-R-win32-x86_64\eclipse;%PATH%
::===============================================
set GGIT="C:\Program Files\Git\bin\git.exe"
set GPROJECT=C:\Users\Admin\Downloads\Programs\ReadyOpenGL
set GBUILD=C:\Users\Admin\Downloads\Programs\ReadyOpenGL\c\win
set GBIN=C:\Users\Admin\Downloads\Programs\ReadyOpenGL\c\win\bin
set GPWD=%cd%
::===============================================
set GPROCESS="%1"
::===============================================
if %GPROCESS% == "compile" (
    cd %GBUILD%
    mingw32-make
) else ( 
if %GPROCESS% == "clean" (
    cd %GBUILD%
    mingw32-make clean
) else ( 
if %GPROCESS% == "eclipse" (
    cd %GBUILD%
    eclipse
) else ( 
if %GPROCESS% == "git_status" (
    cd %GPROJECT%
    %GGIT% add --all
) else ( 
if %GPROCESS% == "git_add" (
    cd %GPROJECT%
    %GGIT% add --all
) else ( 
if %GPROCESS% == "git_commit" (
    cd %GPROJECT%
    %GGIT% commit -m "Initial Commit"
) else ( 
if %GPROCESS% == "git_push" (
    cd %GPROJECT%
    %GGIT% push -u origin master
) else ( 
    cd %GBIN%
    GProject.exe %*
)))))))
::===============================================
cd %GPWD%
::===============================================
