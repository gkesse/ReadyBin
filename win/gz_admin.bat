@echo off
::===============================================
set "GPWD=%cd%"
::===============================================
set "G_STATE=S_INIT"
::===============================================
call :GAdmin_Main
cd %GPWD%
goto :eof
::===============================================
:GAdmin_Main
if "%G_STATE%" == "S_INIT" ( goto :GAdmin_INIT 
) else ( if "%G_STATE%" == "S_METHOD" ( goto :GAdmin_METHOD
) else ( if "%G_STATE%" == "S_CHOICE" ( goto :GAdmin_CHOICE
) else ( if "%G_STATE%" == "S_SQLITE" ( goto :GAdmin_SQLITE
) else ( if "%G_STATE%" == "S_SAVE" ( goto :GAdmin_SAVE
) else ( if "%G_STATE%" == "S_LOAD" ( goto :GAdmin_LOAD
) else ( goto :eof
))))))
goto :GAdmin_Main
::===============================================
:GAdmin_INIT
printf "\n"
printf "ADMIN !!!\n"
printf "\t%%-2s : %%s\n" "-q" "quitter l'application"
printf "\n"
set "G_STATE=S_LOAD"
goto :GAdmin_Main
::===============================================
:GAdmin_METHOD
printf "ADMIN :\n"
printf "\t%%-2s : %%s\n" "1" "S_SQLITE"
printf "\n"
set "G_STATE=S_CHOICE"
goto :GAdmin_Main
::===============================================
:GAdmin_CHOICE
set "G_ADMIN_ID=" & set "lAnswer=" 
set /p lAnswer=ADMIN (%G_ADMIN_ID%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_ADMIN_ID%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "1" ( set "G_STATE=S_SQLITE" & set "G_ADMIN_ID=%lAnswer%" 
))
goto :GAdmin_Main
::===============================================
:GAdmin_SQLITE
call gz_sqlite_run
set "G_STATE=S_SAVE"
goto :GAdmin_Main
::===============================================
:GAdmin_SAVE
call gz_process_in 5 "G_ADMIN_ID" "%G_ADMIN_ID%"
set "G_STATE=S_END"
goto :GAdmin_Main
::===============================================
:GAdmin_LOAD
set "G_STATE=S_METHOD"
goto :GAdmin_Main
::===============================================
