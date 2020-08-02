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
:: Configurations
printf "\n"
printf "Configurations :\n"
printf "\t%%-20s : %%s\n" "G_KEY" "%G_KEY%"
printf "\t%%-20s : %%s\n" "G_VALUE" "%G_VALUE%"
printf "\n"
::===============================================
set "lTmpConfigFile=%GPATH%\tmp\tmp_config_file.txt"
::===============================================
set /p "lAnswer=Confirmation de continuer (Oui|[N]on) ? : " || set "lAnswer=n"
set "lAnswerKey=%lAnswer:~0,1%"
echo %lAnswerKey%| tr '[:upper:]' '[:lower:]'>%lTmpConfigFile%
set /p lAnswerIn=<%lTmpConfigFile%
if not "%lAnswerIn%" == "o" ( echo NON : operation annulee & goto :eof ) 
echo OUI : operation effectuee
echo.
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
