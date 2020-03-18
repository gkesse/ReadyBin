@echo off
::===============================================
set GPROCESS=%1
set GPWD=%cd%
::===============================================
set GREADY_DEV=C:\Users\Admin\Downloads\Programs\ReadyDev
set GREADY_BIN=C:\Users\Admin\Downloads\Programs\ReadyBin
::===============================================
call :GProcess_main %2 %3 %4 %5 %6 %7 %8 %9
cd %GPWD%
goto :eof
::===============================================
:GProcess_main
if "%GPROCESS%" == "" ( goto :GProcess_help
) else ( if "%GPROCESS%" == "test" ( goto :GProcess_test
) else ( if "%GPROCESS%" == "push_dev" ( goto :GGit_push_dev
) else ( if "%GPROCESS%" == "push_bin" ( goto :GGit_push_bin
) else ( goto :GProcess_help ))))
goto :eof
::===============================================
:GProcess_help
echo GProcess_help
goto :eof
::===============================================
:GProcess_test
echo GProcess_test
goto :eof
::===============================================
:GGit_push_dev
cd %GREADY_DEV%
git add --all
git commit -m "Initial Commit"
git push -u origin master
goto :eof
::===============================================
:GGit_push_bin
cd %GREADY_BIN%
git add --all
git commit -m "Initial Commit"
git push -u origin master
goto :eof
::===============================================
