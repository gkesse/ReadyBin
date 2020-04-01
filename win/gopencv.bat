@echo off
::===============================================
set PATH=C:\Windows\System32
set PATH=C:\Users\Admin\Downloads\Programs\ReadyBin\win;%PATH%
set PATH=C:\MinGW\bin;%PATH%
set PATH=C:\Qt\Qt5.8.0\Tools\mingw530_32\bin;%PATH%
set PATH=C:\Users\Admin\Downloads\Programs\ReadyLib\dev\opencv\c\2.4.13.6\mingw64\bin;%PATH%
set PATH=C:\Qt\Qt5.8.0\5.8\mingw53_32\bin;%PATH%
::===============================================
set GPROJECT_ROOT=C:\Users\Admin\Downloads\Programs\ReadyOpenCV
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
set GFUNCTION_MAP=%GFUNCTION_MAP%;GOpenCV_Qt_Compile
set GFUNCTION_MAP=%GFUNCTION_MAP%;GOpenCV_Qt_Clean
set GFUNCTION_MAP=%GFUNCTION_MAP%;GOpenCV_Qt_Run
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
:GOpenCV_Qt_Compile
    cd %GPROJECT_ROOT%/qt/win
    qmake
    mingw32-make
goto :eof
::===============================================
:GOpenCV_Qt_Clean
    cd %GPROJECT_ROOT%/qt/win
    mingw32-make clean
goto :eof
::===============================================
:GOpenCV_Qt_Run
    cd %GPROJECT_ROOT%/qt/win
    .\bin\GOpenCV.exe
goto :eof
::===============================================
