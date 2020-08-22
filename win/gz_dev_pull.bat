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
:: Configurations
printf "\n"
printf "Configurations :\n"
printf "\t%%-20s : %%s\n" "GDEV_PATH" "%GDEV_PATH%"
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
cd %GDEV_PATH%
git pull
::===============================================
cd %GPWD%
::===============================================
