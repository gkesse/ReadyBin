@echo off
::===============================================
set "GPWD=%cd%"
::===============================================
if "%GPATH%" == "" ( echo ERREUR : GPATH ? & goto :eof ) & if not exist %GPATH% ( echo ERREUR : GPATH ? & goto :eof )
::===============================================
call %GPATH%/.config.bat
::===============================================
if "%GC_BUILD%" == "" ( echo ERREUR : GC_BUILD ? & goto :eof ) & if not exist %GC_BUILD% ( echo ERREUR : GC_BUILD ? & goto :eof )
if "%GMINGW_PATH%" == "" ( echo ERREUR : GMINGW_PATH ? & goto :eof ) & if not exist %GMINGW_PATH% ( echo ERREUR : GMINGW_PATH ? & goto :eof )
::===============================================
set "PATH=%GMINGW_PATH%;%PATH%"
::===============================================
:: Configurations
printf "\n"
printf "Configurations :\n"
printf "\t%%-20s : %%s\n" "GC_BUILD" "%GC_BUILD%"
printf "\t%%-20s : %%s\n" "GMINGW_PATH" "%GMINGW_PATH%"
printf "\n"
::===============================================
set "lTmpConfigFile=%GPATH%\tmp\tmp_config_file.txt"
::===============================================
set /p lAnswer=Confirmation de continuer (Oui|[N]on) ? :  || set "lAnswer=n"
set "lAnswerKey=%lAnswer:~0,1%"
echo %lAnswerKey%| tr '[:upper:]' '[:lower:]'>%lTmpConfigFile%
set /p "lAnswerIn=<%lTmpConfigFile%"
if not "%lAnswerIn%" == "o" ( echo NON : operation annulee & goto :eof ) 
echo OUI : operation effectuee
echo.
::===============================================
cd %GC_BUILD%
mingw32-make argv="%*"
::===============================================
cd %GPWD%
::===============================================
