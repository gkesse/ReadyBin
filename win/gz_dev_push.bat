@echo off
::===============================================
set "GPWD=%cd%"
::===============================================
if "%GPATH%" == "" ( echo ERREUR : GPATH ? & goto :eof ) & if not exist %GPATH% ( echo ERREUR : GPATH ? & goto :eof )
::===============================================
call %GPATH%/.config.bat
::===============================================
if "%GDEV_PATH%" == "" ( echo ERREUR : GDEV_PATH ? & goto :eof ) & if not exist "%GDEV_PATH%" ( echo ERREUR : GDEV_PATH ? & goto :eof )
::===============================================
cd %GDEV_PATH%
git add --all
git commit -m "Initial Commit"
git push -u origin master
::===============================================
cd %GPWD%
::===============================================
