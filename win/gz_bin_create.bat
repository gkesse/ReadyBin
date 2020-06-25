@echo off
::===============================================
set "GPWD=%cd%"
::===============================================
if "%GPATH%" == "" ( echo ERREUR : GPATH ? & goto :eof ) & if not exist %GPATH% ( echo ERREUR : GPATH ? & goto :eof )
::===============================================
call %GPATH%/.config.bat
::===============================================
set "lArgIn=%~1" & set "lArgName=nom_script"
if "%lArgIn%" == "" ( echo ERREUR : %lArgName% ? & goto :eof ) 
::===============================================
set "lScriptFile=%~1"
set "lDefaultFile=%GPATH%/.default"
::===============================================
cd %GPATH%
cat %lDefaultFile%>%lScriptFile%
::===============================================
cd %GPWD%
::===============================================
