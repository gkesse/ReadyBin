@echo off
::===============================================
set "GPWD=%cd%"
::===============================================
if "%GPATH%" == "" ( echo ERREUR : GPATH ? & goto :eof ) & if not exist "%GPATH%" ( echo ERREUR : GPATH ? & goto :eof )
::===============================================
set "lArgIn=%~1" & set "lArgName=cle"
if "%lArgIn%" == "" ( echo ERREUR : %lArgName% ? & goto :eof ) 
set "lArgIn=%~2" & set "lArgName=valeur"
if "%lArgIn%" == "" ( echo ERREUR : %lArgName% ? & goto :eof ) 
::===============================================
set "G_KEY=%~1"
set "G_VALUE=%~2"
::===============================================
set "lTmpFile_01=%GPATH%\tmp\tmp_file_01.txt"
set "lTmpFile_02=%GPATH%\tmp\tmp_file_02.txt"
set "lTmpFile_03=%GPATH%\tmp\tmp_file_03.txt"
::===============================================
set "lConfigFile=%GPATH%/.config.bat"
::===============================================
printf "">%lTmpFile_03%
::===============================================
for /f "tokens=*" %%a in (%lConfigFile%) do call :GConfig_SetData %%a
echo set "%G_KEY%=%G_VALUE%">>%lTmpFile_03%
cat %lTmpFile_03%>%lConfigFile%
goto :eof
::===============================================
:GConfig_SetData
set "lLine=%*"
set "lFirstChar=%lLine:~0,2%"
if "%lFirstChar%" == "::" ( goto :eof ) 
set "lFirstChar=%lLine:~0,1%"
if "%lFirstChar%" == "@" ( goto :eof ) 
set "lLine=%lLine:~5,-1%"
echo %lLine%| cut -d= -f1>%lTmpFile_01%
echo %lLine%| cut -d= -f2>%lTmpFile_02%
set /p lKey=<%lTmpFile_01%
set /p lValue=<%lTmpFile_02%
echo set "%lKey%=%lValue%">>%lTmpFile_03%
goto :eof
::===============================================
cd %GPWD%
::===============================================
