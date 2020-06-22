@echo off
::===============================================
set "GPWD=%cd%"
::===============================================
if "%GPATH%" == "" ( echo ERREUR : GPATH ? & goto :eof ) & if not exist %GPATH% ( echo ERREUR : GPATH ? & goto :eof )
::===============================================
call %GPATH%/.config.bat
::===============================================
if "%GBIN_PATH%" == "" ( echo ERREUR : GBIN_PATH ? & goto :eof ) & if not exist "%GBIN_PATH%" ( echo ERREUR : GBIN_PATH ? & goto :eof )
::===============================================
cd %GBIN_PATH%
git add --all
git commit -m "Initial Commit"
git push -u origin master
::===============================================
cd %GPWD%
::===============================================
