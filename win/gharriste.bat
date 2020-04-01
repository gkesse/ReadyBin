@echo off
::===============================================
set PATH=C:\Windows\System32
set PATH=C:\Users\Admin\Downloads\Programs\ReadyBin\win;%PATH%
::===============================================
set GPROJECT_ROOT=C:\Users\Admin\Downloads\Programs\ReadyHarriste
set GPWD=%cd%
::===============================================
set GPROCESS=%1
set GOPTION_1=%2
set GOPTION_2=%3
set GOPTION_3=%4
set GOPTION_4=%5
::===============================================
set GGIT="C:\Program Files\Git\bin\git.exe"
::===============================================
set GFUNCTION_MAP=
set GFUNCTION_MAP=%GFUNCTION_MAP%;GGit_Push_All
set GFUNCTION_MAP=%GFUNCTION_MAP%;GGit_Pull
set GFUNCTION_MAP=%GFUNCTION_MAP%;GGit_Branch_Show_All
set GFUNCTION_MAP=%GFUNCTION_MAP%;GGit_Branch_Create
set GFUNCTION_MAP=%GFUNCTION_MAP%;GGit_Branch_Push_All
::===============================================
cd %GPROJECT_ROOT%
call :GProcess_Run %*
cd %GPWD%
goto :eof
::===============================================
:GProcess_Run
if "%GPROCESS%" == "" ( goto :GProcess_RunNumber
) else ( goto :GProcess_RunFunc )
goto :eof
::===============================================
:GProcess_RunNumber
setlocal enabledelayedexpansion
    set /a lCount=0
    for %%A in (%GFUNCTION_MAP%) do (
        set /a lCount+=1
        echo !lCount! : %%A
    )
endlocal
goto :eof
::===============================================
:GProcess_RunFunc
setlocal enabledelayedexpansion
    set lFuncNumber=%1
    set /a lCount=0
    for %%A in (%GFUNCTION_MAP%) do (
        set /a lCount+=1
        if "!lCount!" == "!lFuncNumber!" ( 
            goto :%%A
        )
    )
endlocal
goto :eof
::===============================================
:GProcess_Error
    echo --- Erreur de parametres ---
goto :eof
::===============================================
:GGit_Push_All
    cd %GPROJECT_ROOT%
    %GGIT% add --all
    %GGIT% commit -m "Initial Commit"
    %GGIT% push -u origin master
goto :eof
::===============================================
:GGit_Pull
    cd %GPROJECT_ROOT%
    %GGIT% pull
goto :eof
::===============================================
:GGit_Branch_Show_All
    cd %GPROJECT_ROOT%
    %GGIT% branch --all -v
goto :eof
::===============================================
:GGit_Branch_Create
    if "%GOPTION_1%" == "" ( goto :GProcess_Error )
    cd %GPROJECT_ROOT%
    %GGIT% checkout -b %GOPTION_1%
goto :eof
::===============================================
:GGit_Branch_Push_All
    if "%GOPTION_1%" == "" ( goto :GProcess_Error )
    cd %GPROJECT_ROOT%
    %GGIT% checkout %GOPTION_1%
    %GGIT% add --all
    %GGIT% commit -m "Initial Commit"
    %GGIT% push -u origin %GOPTION_1%
goto :eof
::===============================================
