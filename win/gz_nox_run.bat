@echo off
::===============================================
set "GPWD=%cd%"
::===============================================
set "G_STATE=S_INIT"
::===============================================
call :GNox_Main
cd %GPWD%
goto :eof
::===============================================
:GNox_Main
if "%G_STATE%" == "S_ADMIN" ( goto :GNox_ADMIN 
) else ( if "%G_STATE%" == "S_INIT" ( goto :GNox_INIT
) else ( if "%G_STATE%" == "S_METHOD" ( goto :GNox_METHOD
) else ( if "%G_STATE%" == "S_CHOICE" ( goto :GNox_CHOICE
) else ( if "%G_STATE%" == "S_ADB_CONNECT_SERVER_IP" ( goto :GNox_ADB_CONNECT_SERVER_IP
) else ( if "%G_STATE%" == "S_ADB_CONNECT_SERVER_PORT" ( goto :GNox_ADB_CONNECT_SERVER_PORT
) else ( if "%G_STATE%" == "S_ADB_CONNECT" ( goto :GNox_ADB_CONNECT
) else ( if "%G_STATE%" == "S_ADB_STOP" ( goto :GNox_ADB_STOP
) else ( if "%G_STATE%" == "S_SAVE" ( goto :GNox_SAVE
) else ( if "%G_STATE%" == "S_LOAD" ( goto :GNox_LOAD
) else ( if "%G_STATE%" == "S_QUIT" ( goto :GNox_QUIT
) else ( goto :eof
)))))))))))
goto :GNox_Main
::===============================================
:GNox_ADMIN
call gz_admin
set "G_STATE=S_END"
goto :GNox_Main
::===============================================
:GNox_INIT
printf "\n"
printf "NOX !!!\n"
printf "\t%%-2s : %%s\n" "-q" "quitter l'application"
printf "\t%%-2s : %%s\n" "-i" "reinitialiser l'application"
printf "\t%%-2s : %%s\n" "-a" "redemarrer l'application"
printf "\t%%-2s : %%s\n" "-v" "valider les configurations"
printf "\n"
set "G_STATE=S_LOAD"
goto :GNox_Main
::===============================================
:GNox_METHOD
printf "NOX :\n"
printf "\t%%-2s : %%s\n" "1" "demarrer la connexion"
printf "\t%%-2s : %%s\n" "2" "arreter la connexion"
printf "\n"
set "G_STATE=S_CHOICE"
goto :GNox_Main
::===============================================
:GNox_CHOICE
set "lAnswer=" 
set /p lAnswer=NOX (%G_NOX_ID%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_NOX_ID%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "1" ( set "G_STATE=S_ADB_CONNECT_SERVER_PORT" & set "G_NOX_ID=%lAnswer%" 
) else ( if "%lAnswer%" == "2" ( set "G_STATE=S_ADB_STOP" & set "G_NOX_ID=%lAnswer%" 
)))))
goto :GNox_Main
::===============================================
:GNox_ADB_CONNECT_SERVER_IP
set "lAnswer=" 
set /p lAnswer=G_SERVER_IP (%G_SERVER_IP%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_SERVER_IP%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_ADB_CONNECT"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_ADB_CONNECT_SERVER_PORT" & set "G_SERVER_IP=%lAnswer%" 
)))))
goto :GNox_Main
::===============================================
:GNox_ADB_CONNECT_SERVER_PORT
set "lAnswer=" 
set /p lAnswer=G_SERVER_PORT (%G_SERVER_PORT%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_SERVER_PORT%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_ADB_CONNECT"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_ADB_CONNECT" & set "G_SERVER_PORT=%lAnswer%" 
)))))
goto :GNox_Main
::===============================================
:GNox_ADB_CONNECT
echo.
nox_adb connect %G_SERVER_IP%:%G_SERVER_PORT%
set "G_STATE=S_SAVE"
goto :GNox_Main
::===============================================
:GNox_ADB_STOP
echo.
nox_adb kill-server
set "G_STATE=S_SAVE"
goto :GNox_Main
::===============================================
:GNox_SAVE
call gz_process_in sqlite_config_save "G_NOX_ID" "%G_NOX_ID%"
call gz_process_in sqlite_config_save "G_SERVER_IP" "%G_SERVER_IP%"
call gz_process_in sqlite_config_save "G_SERVER_PORT" "%G_SERVER_PORT%"
set "G_STATE=S_QUIT" & cd %GPWD%
goto :GNox_Main
::===============================================
:GNox_LOAD
call gz_process_in sqlite_config_load "G_NOX_ID" G_NOX_ID
call gz_process_in sqlite_config_load "G_SERVER_IP" G_SERVER_IP
call gz_process_in sqlite_config_load "G_SERVER_PORT" G_SERVER_PORT
set "G_STATE=S_METHOD"
goto :GNox_Main
::===============================================
:GNox_QUIT
echo.
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
goto :GNox_Main
::===============================================
