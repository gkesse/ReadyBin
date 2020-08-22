@echo off
::===============================================
set "GPWD=%cd%"
::===============================================
set "G_STATE=S_INIT"
::===============================================
call :GBin_Main
cd %GPWD%
goto :eof
::===============================================
:GBin_Main
if "%G_STATE%" == "S_ADMIN" ( goto :GBin_ADMIN 
) else ( if "%G_STATE%" == "S_INIT" ( goto :GBin_INIT
) else ( if "%G_STATE%" == "S_METHOD" ( goto :GBin_METHOD
) else ( if "%G_STATE%" == "S_CHOICE" ( goto :GBin_CHOICE
) else ( if "%G_STATE%" == "S_ENV_CONFIG" ( goto :GBin_ENV_CONFIG
) else ( if "%G_STATE%" == "S_SAVE" ( goto :GBin_SAVE
) else ( if "%G_STATE%" == "S_LOAD" ( goto :GBin_LOAD
) else ( if "%G_STATE%" == "S_QUIT" ( goto :GBin_QUIT
) else ( goto :eof
))))))))
goto :GBin_Main
::===============================================
:GBin_ADMIN
call gz_admin
set "G_STATE=S_END"
goto :GBin_Main
::===============================================
:GBin_INIT
printf "\n"
printf "BIN !!!\n"
printf "\t%%-2s : %%s\n" "-q" "quitter l'application"
printf "\t%%-2s : %%s\n" "-i" "reinitialiser l'application"
printf "\t%%-2s : %%s\n" "-a" "redemarrer l'application"
printf "\n"
set "G_STATE=S_LOAD"
goto :GBin_Main
::===============================================
:GBin_METHOD
printf "BIN :\n"
printf "\t%%-2s : %%s\n" "1" "configurer les variables d'environnement"
printf "\n"
set "G_STATE=S_CHOICE"
goto :GBin_Main
::===============================================
:GBin_CHOICE
set "lAnswer=" 
set /p lAnswer=BIN (%G_BIN_ID%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_BIN_ID%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "1" ( set "G_STATE=S_ENV_CONFIG" & set "G_BIN_ID=%lAnswer%" 
))))
goto :GBin_Main
::===============================================
:GBin_ENV_CONFIG
set "lEnvPath=%GPATH%\.env.bat"
if not exist "%lEnvPath%" ( echo. > %lEnvPath% )
call %lEnvPath%
echo.
set "G_STATE=S_SAVE"
goto :GBin_Main
::===============================================
:GBin_SAVE
call gz_process_in sqlite_config_save "G_BIN_ID" "%G_BIN_ID%"
set "G_STATE=S_QUIT" & cd %GPWD%
goto :GBin_Main
::===============================================
:GBin_LOAD
call gz_process_in sqlite_config_load "G_BIN_ID" G_BIN_ID
set "G_STATE=S_METHOD"
goto :GBin_Main
::===============================================
:GBin_QUIT
call gz_process_in quit G_QUIT_IN
set "lAnswerIn=%G_QUIT_IN:~0,1%"
if "%G_QUIT_IN%" == "-q" ( set "G_STATE=S_END" 
) else ( if "%G_QUIT_IN%" == "-i" ( set "G_STATE=S_INIT"
) else ( if "%G_QUIT_IN%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswerIn%" == "o" ( set "G_STATE=S_END"
) else ( if "%lAnswerIn%" == "O" ( set "G_STATE=S_END"
) else ( if "%lAnswerIn%" == "n" ( set "G_STATE=S_INIT"
) else ( if "%lAnswerIn%" == "N" ( set "G_STATE=S_INIT"
) else ( if "%G_QUIT_IN%" == "" ( set "G_STATE=S_INIT"
) else ( set "G_STATE=S_QUIT"
))))))))
goto :GBin_Main
::===============================================
