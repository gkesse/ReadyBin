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
if "%G_STATE%" == "S_INIT" ( goto :GSQLite_INIT 
) else ( if "%G_STATE%" == "S_METHOD" ( goto :GSQLite_METHOD
) else ( if "%G_STATE%" == "S_CHOICE" ( goto :GSQLite_CHOICE
) else ( if "%G_STATE%" == "S_CONFIG_DATA_CREATE" ( goto :GSQLite_CONFIG_DATA_CREATE
) else ( if "%G_STATE%" == "S_SAVE" ( goto :GSQLite_SAVE
) else ( if "%G_STATE%" == "S_LOAD" ( goto :GSQLite_LOAD
) else ( goto :eof
))))))
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
printf "\n"
set "G_STATE=S_CHOICE"
goto :GSQLite_Main
::===============================================
:GSQLite_CHOICE
set "G_SQLITE_ID=" & set "lAnswer=" 
set /p lAnswer=SQLITE (%G_SQLITE_ID%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_SQLITE_ID%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "1" ( set "G_STATE=S_CONFIG_DATA_CREATE" & set "G_SQLITE_ID=%lAnswer%" 
))
goto :GSQLite_Main
::===============================================
:GSQLite_CONFIG_DATA_CREATE
call gz_process_in 2
call gz_process_in 3 "create table CONFIG_DATA("
call gz_process_in 3 "CONFIG_KEY text not null,"
call gz_process_in 3 "CONFIG_VALUE text,"
call gz_process_in 3 ")"
call gz_process_in 4
set "G_STATE=S_SAVE"
goto :GSQLite_Main
::===============================================
:GSQLite_SAVE
set "G_STATE=S_END"
goto :GSQLite_Main
::===============================================
:GSQLite_LOAD
set "G_STATE=S_METHOD"
goto :GSQLite_Main
::===============================================
