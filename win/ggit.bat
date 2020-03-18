@echo off
::===============================================
set PATH=C:\Windows\System32
set PATH=C:\Users\Admin\Downloads\Programs\ReadyBin\win;%PATH%
::===============================================
set GPROJECT_ROOT=C:\Users\Admin\Downloads\Programs\ReadyGit
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
set GFUNCTION_MAP=GGit_Run;%GFUNCTION_MAP%
set GFUNCTION_MAP=GGit_Book;%GFUNCTION_MAP%
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
:GGit_Run
    echo #================================================
    echo # GGit_Run
    echo #================================================
    echo %~0
goto :eof
::===============================================
:GGit_Book
    echo #================================================
    echo # GGit_Book
    echo #================================================
    echo %~0
goto :eof
::===============================================
