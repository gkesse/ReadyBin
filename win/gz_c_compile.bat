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
set "lTmpFile_01=%GPATH%\tmp\tmp_file_01.txt"
::===============================================
:: Configurations
printf "\n"
printf "Configurations :\n"
printf "\t%%-20s : %%s\n" "GC_BUILD" "%GC_BUILD%"
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
cd %GC_BUILD%
set "lBinFile=bin\gp_c.exe"
if exist "%lBinFile%" ( del %lBinFile% )
mingw32-make argv="%*"
echo.
::===============================================
cd %GPWD%
::===============================================
