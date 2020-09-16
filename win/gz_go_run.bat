@echo off
::===============================================
set "GPWD=%cd%"
::===============================================
set "G_STATE=S_INIT"
::===============================================
call :GGo_Main
cd %GPWD%
goto :eof
::===============================================
:GGo_Main
if "%G_STATE%" == "S_ADMIN" ( goto :GGo_ADMIN 
) else ( if "%G_STATE%" == "S_INIT" ( goto :GGo_INIT
) else ( if "%G_STATE%" == "S_METHOD" ( goto :GGo_METHOD
) else ( if "%G_STATE%" == "S_CHOICE" ( goto :GGo_CHOICE
) else ( if "%G_STATE%" == "S_GO_COMPILE_GO_PATH" ( goto :GGo_GO_COMPILE_GO_PATH
) else ( if "%G_STATE%" == "S_GO_COMPILE_GO_NAME" ( goto :GGo_GO_COMPILE_GO_NAME
) else ( if "%G_STATE%" == "S_GO_COMPILE_GO_COMPILO" ( goto :GGo_GO_COMPILE_GO_COMPILO
) else ( if "%G_STATE%" == "S_GO_COMPILE_GO_TARGET" ( goto :GGo_GO_COMPILE_GO_TARGET
) else ( if "%G_STATE%" == "S_GO_COMPILE" ( goto :GGo_GO_COMPILE
) else ( if "%G_STATE%" == "S_GO_RUN_GO_PATH" ( goto :GGo_GO_RUN_GO_PATH
) else ( if "%G_STATE%" == "S_GO_RUN_GO_NAME" ( goto :GGo_GO_RUN_GO_NAME
) else ( if "%G_STATE%" == "S_GO_RUN" ( goto :GGo_GO_RUN
) else ( if "%G_STATE%" == "S_SAVE" ( goto :GGo_SAVE
) else ( if "%G_STATE%" == "S_LOAD" ( goto :GGo_LOAD
) else ( if "%G_STATE%" == "S_QUIT" ( goto :GGo_QUIT
) else ( goto :eof
)))))))))))))))
goto :GGo_Main
::===============================================
:GGo_ADMIN
call gz_admin
set "G_STATE=S_END"
goto :GGo_Main
::===============================================
:GGo_INIT
printf "\n"
printf "GO !!!\n"
printf "\t%%-2s : %%s\n" "-q" "quitter l'application"
printf "\t%%-2s : %%s\n" "-i" "reinitialiser l'application"
printf "\t%%-2s : %%s\n" "-a" "redemarrer l'application"
printf "\t%%-2s : %%s\n" "-v" "valider les configurations"
printf "\n"
set "G_STATE=S_LOAD"
goto :GGo_Main
::===============================================
:GGo_METHOD
printf "GO :\n"
printf "\t%%-2s : %%s\n" "1" "compiler un projet GO"
printf "\n"
set "G_STATE=S_CHOICE"
goto :GGo_Main
::===============================================
:GGo_CHOICE
set "lAnswer=" 
set /p lAnswer=GO (%G_GO_ID%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_GO_ID%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "1" ( set "G_STATE=S_GO_COMPILE_GO_PATH" & set "G_GO_ID=%lAnswer%" 
))))
goto :GGo_Main
::===============================================
:GGo_GO_COMPILE_GO_PATH
set "lAnswer=" 
set /p lAnswer=G_GO_PATH (%G_GO_PATH%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_GO_PATH%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_GO_COMPILE"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_GO_COMPILE_GO_NAME" & set "G_GO_PATH=%lAnswer%" 
)))))
goto :GGo_Main
::===============================================
:GGo_GO_COMPILE_GO_NAME
set "lAnswer=" 
set /p lAnswer=G_GO_NAME (%G_GO_NAME%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_GO_NAME%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_GO_COMPILE"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_GO_COMPILE_GO_COMPILO" & set "G_GO_NAME=%lAnswer%" 
)))))
goto :GGo_Main
::===============================================
:GGo_GO_COMPILE_GO_COMPILO
set "lAnswer=" 
set /p lAnswer=G_GO_COMPILO (%G_GO_COMPILO%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_GO_COMPILO%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_GO_COMPILE"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_GO_COMPILE_GO_TARGET" & set "G_GO_COMPILO=%lAnswer%" 
)))))
goto :GGo_Main
::===============================================
:GGo_GO_COMPILE_GO_TARGET
set "lAnswer=" 
set /p lAnswer=G_GO_TARGET (%G_GO_TARGET%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_GO_TARGET%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_GO_COMPILE"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_GO_COMPILE" & set "G_GO_TARGET=%lAnswer%" 
)))))
goto :GGo_Main
::===============================================
:GGo_GO_COMPILE
echo.
set "lBuldPath=%G_GO_PATH%\%G_GO_NAME%\win"
set "lSrcPath=%G_GO_PATH%\%G_GO_NAME%\code\GProject"
set "lMakefile=Makefile"
set "GOPATH=%lSrcPath%;%GOPATH%"
if not "%G_GO_COMPILO%" == "" ( set "lMakefile=%lMakefile%.%G_GO_COMPILO%" )
cd %lBuldPath%
mingw32-make -f %lMakefile% %G_GO_TARGET%
echo.
set "G_STATE=S_SAVE"
goto :GGo_Main
::===============================================
:GGo_SAVE
call gz_process_in sqlite_config_save "G_GO_ID" "%G_GO_ID%"
call gz_process_in sqlite_config_save "G_GO_PATH" "%G_GO_PATH%"
call gz_process_in sqlite_config_save "G_GO_NAME" "%G_GO_NAME%"
call gz_process_in sqlite_config_save "G_GO_COMPILO" "%G_GO_COMPILO%"
call gz_process_in sqlite_config_save "G_GO_TARGET" "%G_GO_TARGET%"
set "G_STATE=S_QUIT" & cd %GPWD%
goto :GGo_Main
::===============================================
:GGo_LOAD
call gz_process_in sqlite_config_load "G_GO_ID" G_GO_ID
call gz_process_in sqlite_config_load "G_GO_PATH" G_GO_PATH
call gz_process_in sqlite_config_load "G_GO_NAME" G_GO_NAME
call gz_process_in sqlite_config_load "G_GO_COMPILO" G_GO_COMPILO
call gz_process_in sqlite_config_load "G_GO_TARGET" G_GO_TARGET
set "G_STATE=S_METHOD"
goto :GGo_Main
::===============================================
:GGo_QUIT
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
goto :GGo_Main
::===============================================
