@echo off
::===============================================
set "GPWD=%cd%"
::===============================================
set "G_STATE=S_INIT"
::===============================================
call :GSQLite_Main
cd %GPWD%
goto :eof
::===============================================
:GSQLite_Main
if "%G_STATE%" == "S_ADMIN" ( goto :GSQLite_ADMIN 
) else ( if "%G_STATE%" == "S_INIT" ( goto :GSQLite_INIT
) else ( if "%G_STATE%" == "S_METHOD" ( goto :GSQLite_METHOD
) else ( if "%G_STATE%" == "S_CHOICE" ( goto :GSQLite_CHOICE
) else ( if "%G_STATE%" == "S_CONFIG_DATA_CREATE" ( goto :GSQLite_CONFIG_DATA_CREATE
) else ( if "%G_STATE%" == "S_CONFIG_DATA_SHOW" ( goto :GSQLite_CONFIG_DATA_SHOW
) else ( if "%G_STATE%" == "S_CONFIG_DATA_DROP" ( goto :GSQLite_CONFIG_DATA_DROP
) else ( if "%G_STATE%" == "S_CONFIG_DATA_DELETE_CONFIG_KEY" ( goto :GSQLite_CONFIG_DATA_DELETE_CONFIG_KEY
) else ( if "%G_STATE%" == "S_CONFIG_DATA_DELETE" ( goto :GSQLite_CONFIG_DATA_DELETE
) else ( if "%G_STATE%" == "S_SAVE" ( goto :GSQLite_SAVE
) else ( if "%G_STATE%" == "S_LOAD" ( goto :GSQLite_LOAD
) else ( if "%G_STATE%" == "S_QUIT" ( goto :GSQLite_QUIT
) else ( goto :eof
))))))))))))
goto :GSQLite_Main
::===============================================
:GSQLite_ADMIN
call gz_admin
set "G_STATE=S_END"
goto :GSQLite_Main
::===============================================
:GSQLite_INIT
printf "\n"
printf "SQLITE !!!\n"
printf "\t%%-2s : %%s\n" "-q" "quitter l'application"
printf "\t%%-2s : %%s\n" "-i" "reinitialiser l'application"
printf "\t%%-2s : %%s\n" "-a" "redemarrer l'application"
printf "\n"
set "G_STATE=S_LOAD"
goto :GSQLite_Main
::===============================================
:GSQLite_METHOD
printf "SQLITE :\n"
printf "\t%%-2s : %%s\n" "1" "creer la table CONFIG_DATA"
printf "\t%%-2s : %%s\n" "2" "afficher la table CONFIG_DATA"
printf "\t%%-2s : %%s\n" "3" "supprimer la table CONFIG_DATA"
printf "\t%%-2s : %%s\n" "4" "supprimer une donnee CONFIG_DATA"
printf "\n"
set "G_STATE=S_CHOICE"
goto :GSQLite_Main
::===============================================
:GSQLite_CHOICE
set "lAnswer=" 
set /p lAnswer=SQLITE (%G_SQLITE_ID%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_SQLITE_ID%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "1" ( set "G_STATE=S_CONFIG_DATA_CREATE" & set "G_SQLITE_ID=%lAnswer%" 
) else ( if "%lAnswer%" == "2" ( set "G_STATE=S_CONFIG_DATA_SHOW" & set "G_SQLITE_ID=%lAnswer%" 
) else ( if "%lAnswer%" == "3" ( set "G_STATE=S_CONFIG_DATA_DROP" & set "G_SQLITE_ID=%lAnswer%" 
) else ( if "%lAnswer%" == "4" ( set "G_STATE=S_CONFIG_DATA_DELETE_CONFIG_KEY" & set "G_SQLITE_ID=%lAnswer%" 
)))))))
goto :GSQLite_Main
::===============================================
:GSQLite_CONFIG_DATA_DELETE_CONFIG_KEY
set "lAnswer=" 
set /p lAnswer=G_CONFIG_KEY (%G_CONFIG_KEY%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_CONFIG_KEY%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_CONFIG_DATA_DELETE" & set "G_CONFIG_KEY=%lAnswer%" 
))))
goto :GSQLite_Main
::===============================================
:GSQLite_CONFIG_DATA_DELETE
call gz_process_in sqlite_query_init
call gz_process_in sqlite_query_set "delete from CONFIG_DATA"
call gz_process_in sqlite_query_set "where CONFIG_KEY='%G_CONFIG_KEY%'"
call gz_process_in sqlite_query
set "G_STATE=S_SAVE"
echo.
goto :GSQLite_Main
::===============================================
:GSQLite_CONFIG_DATA_CREATE
call gz_process_in confirm G_CONFIRM_IN
if "%G_CONFIRM_IN%" == "0" ( goto :eof )
call gz_process_in sqlite_query_init
call gz_process_in sqlite_query_set "create table CONFIG_DATA("
call gz_process_in sqlite_query_set "CONFIG_KEY text unique not null,"
call gz_process_in sqlite_query_set "CONFIG_VALUE text"
call gz_process_in sqlite_query_set ")"
call gz_process_in sqlite_query
set "G_STATE=S_SAVE"
goto :GSQLite_Main
::===============================================
:GSQLite_CONFIG_DATA_SHOW
echo.
call gz_process_in sqlite_query_init
call gz_process_in sqlite_query_set ".headers on"
call gz_process_in sqlite_query_set ".mode column"
call gz_process_in sqlite_query_set ".width 20 50"
call gz_process_in sqlite_query_set "select * from CONFIG_DATA"
call gz_process_in sqlite_query
set "G_STATE=S_SAVE"
echo.
goto :GSQLite_Main
::===============================================
:GSQLite_CONFIG_DATA_DROP
call gz_process_in confirm G_CONFIRM_IN
if "%G_CONFIRM_IN%" == "0" ( goto :eof )
call gz_process_in sqlite_query_init
call gz_process_in sqlite_query_set "drop table CONFIG_DATA"
call gz_process_in sqlite_query
set "G_STATE=S_SAVE"
goto :GSQLite_Main
::===============================================
:GSQLite_SAVE
call gz_process_in sqlite_config_save "G_SQLITE_ID" "%G_SQLITE_ID%"
call gz_process_in sqlite_config_save "G_CONFIG_KEY" "%G_CONFIG_KEY%"
set "G_STATE=S_QUIT" & cd %GPWD%
goto :GSQLite_Main
::===============================================
:GSQLite_LOAD
call gz_process_in sqlite_config_load "G_SQLITE_ID" G_SQLITE_ID
call gz_process_in sqlite_config_load "G_CONFIG_KEY" G_CONFIG_KEY
set "G_STATE=S_METHOD"
goto :GSQLite_Main
::===============================================
:GSQLite_QUIT
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
goto :GSQLite_Main
::===============================================
