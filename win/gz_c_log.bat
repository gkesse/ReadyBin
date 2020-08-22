@echo off
::===============================================
set "GPWD=%cd%"
::===============================================
if "%GPATH%" == "" ( echo ERREUR : GPATH ? & goto :eof ) & if not exist %GPATH% ( echo ERREUR : GPATH ? & goto :eof )
::===============================================
call %GPATH%/.config.bat
::===============================================
if "%GC_LOG_FILE%" == "" ( echo ERREUR : GC_LOG_FILE ? & goto :eof ) & if not exist "%GC_LOG_FILE%" ( echo ERREUR : GC_LOG_FILE ? & goto :eof )
::===============================================
:: Configurations
printf "\n"
printf "Configurations :\n"
printf "\t%%-20s : %%s\n" "GC_LOG_FILE" "%GC_LOG_FILE%"
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
::===============================================
echo.
tail -f %GC_LOG_FILE%
echo.
::===============================================
cd %GPWD%
::===============================================
