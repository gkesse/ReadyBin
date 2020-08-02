@echo off
::===============================================
set "GPWD=%cd%"
::===============================================
if "%GPATH%" == "" ( echo ERREUR : GPATH ? & goto :eof ) & if not exist %GPATH% ( echo ERREUR : GPATH ? & goto :eof )
::===============================================
call %GPATH%/.config.bat
::===============================================
if "%GCPP_BUILD%" == "" ( echo ERREUR : GCPP_BUILD ? & goto :eof ) & if not exist %GCPP_BUILD% ( echo ERREUR : GCPP_BUILD ? & goto :eof )
if "%GMINGW_PATH%" == "" ( echo ERREUR : GMINGW_PATH ? & goto :eof ) & if not exist %GMINGW_PATH% ( echo ERREUR : GMINGW_PATH ? & goto :eof )
if "%GQT_PATH%" == "" ( echo ERREUR : GQT_PATH ? & goto :eof ) & if not exist %GQT_PATH% ( echo ERREUR : GQT_PATH ? & goto :eof )
::===============================================
set "PATH=%GMINGW_PATH%;%PATH%"
set "PATH=%GQT_PATH%;%PATH%"
::===============================================
set "lTmpFile_01=%GPATH%\tmp\tmp_file_01.txt"
::===============================================
:: Configurations
printf "\n"
printf "Configurations :\n"
printf "\t%%-20s : %%s\n" "GCPP_BUILD" "%GCPP_BUILD%"
printf "\t%%-20s : %%s\n" "GMINGW_PATH" "%GMINGW_PATH%"
printf "\t%%-20s : %%s\n" "GMINGW_PATH" "%GQT_PATH%"
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
cd %GCPP_BUILD%
mingw32-make clean -f Makefile.config
echo.
::===============================================
cd %GPWD%
::===============================================
