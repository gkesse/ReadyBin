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
:: Configurations
printf "\n"
printf "Configurations :\n"
printf "\t%%-20s : %%s\n" "GBIN_PATH" "%GBIN_PATH%"
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
cd %GBIN_PATH%
git add --all
git commit -m "Initial Commit"
git push -u origin master
::===============================================
cd %GPWD%
::===============================================
