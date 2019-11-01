@echo off
::===============================================
set PATH=C:\Windows\System32
set PATH=C:\Users\Admin\Downloads\Programs\ReadyBin\win;%PATH%
::===============================================
set GGIT="C:\Program Files\Git\bin\git.exe"
set GROOT=C:\Users\Admin\Downloads\Programs\ReadyDev
set GPWD=%cd%
::===============================================
set GPROCESS="%1"
::===============================================
if %GPROCESS% == "add" (
    cd %GROOT%
    %GGIT% add --all
) else ( 
if %GPROCESS% == "commit" (
    cd %GROOT%
    %GGIT% commit -m "Initial Commit"
) else ( 
if %GPROCESS% == "push" (
    cd %GROOT%
    %GGIT% push -u origin master
) else ( 
if %GPROCESS% == "pull" (
    cd %GROOT%
    %GGIT% pull
) else ( 
    echo ERREUR: Nom du proces ?
))))
::===============================================
cd %GPWD%
::===============================================
