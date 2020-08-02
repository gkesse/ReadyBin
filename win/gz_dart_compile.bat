@echo off
::===============================================
set "GPWD=%cd%"
::===============================================
if "%GPATH%" == "" ( echo ERREUR : GPATH ? & goto :eof ) & if not exist %GPATH% ( echo ERREUR : GPATH ? & goto :eof )
::===============================================
call %GPATH%/.config.bat
::===============================================
if "%GDART_BUILD%" == "" ( echo ERREUR : GDART_BUILD ? & goto :eof ) & if not exist %GDART_BUILD% ( echo ERREUR : GDART_BUILD ? & goto :eof )
if "%GDART_PATH%" == "" ( echo ERREUR : GDART_PATH ? & goto :eof ) & if not exist %GDART_PATH% ( echo ERREUR : GDART_PATH ? & goto :eof )
if "%GDART_MAIN%" == "" ( echo ERREUR : GDART_PATH ? & goto :eof ) 
::===============================================
set "PATH=%GDART_PATH%;%PATH%"
::===============================================
set "lTmpFile_01=%GPATH%\tmp\tmp_file_01.txt"
::===============================================
:: Configurations
printf "\n"
printf "Configurations :\n"
printf "\t%%-20s : %%s\n" "GDART_BUILD" "%GDART_BUILD%"
printf "\t%%-20s : %%s\n" "GDART_PATH" "%GDART_PATH%"
printf "\t%%-20s : %%s\n" "GDART_MAIN" "%GDART_MAIN%"
printf "\n"
::===============================================
set /p "lAnswer=Confirmation de continuer (Oui|[N]on) ? : " || set "lAnswer=n"
set "lAnswerKey=%lAnswer:~0,1%"
echo %lAnswerKey%| tr '[:upper:]' '[:lower:]'>%lTmpFile_01%
set /p lAnswerIn=<%lTmpFile_01%
if not "%lAnswerIn%" == "o" ( echo NON : operation annulee & goto :eof ) 
echo OUI : operation effectuee
::===============================================
echo.
cd %GDART_BUILD%
set "lMainFile=%GDART_MAIN%"
dart %lMainFile% %*
echo.
::===============================================
cd %GPWD%
::===============================================
