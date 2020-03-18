@echo off
::===============================================
set PATH=C:\Windows\System32
set PATH=C:\Users\Admin\Downloads\Programs\ReadyBin\win;%PATH%
::===============================================
set GPROJECT_ROOT=C:\Users\Admin\Downloads\Programs\ReadyBin
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
set GFUNCTION_MAP=%GFUNCTION_MAP%;GGit_PushAll
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
:GGit_PushAll
    cd %GPROJECT_ROOT%
    %GGIT% add --all
    %GGIT% commit -m "Initial Commit"
    %GGIT% push -u origin master
goto :eof
::===============================================
