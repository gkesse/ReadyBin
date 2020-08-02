@echo off
::===============================================
set "GPWD=%cd%"
::===============================================
if "%GPATH%" == "" ( echo ERREUR : GPATH ? & goto :eof ) & if not exist %GPATH% ( echo ERREUR : GPATH ? & goto :eof )
::===============================================
call %GPATH%/.config.bat
::===============================================
if "%GC_PATH%" == "" ( echo ERREUR : GC_PATH ? & goto :eof ) & if not exist "%GC_PATH%" ( echo ERREUR : GC_PATH ? & goto :eof )
::===============================================
cd %GC_PATH%
git pull
::===============================================
cd %GPWD%
::===============================================
