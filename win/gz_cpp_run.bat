@echo off
::===============================================
set "GPWD=%cd%"
::===============================================
set "G_STATE=S_INIT"
::===============================================
call :GCpp_Main
cd %GPWD%
goto :eof
::===============================================
:GCpp_Main
if "%G_STATE%" == "S_ADMIN" ( goto :GCpp_ADMIN 
) else ( if "%G_STATE%" == "S_INIT" ( goto :GCpp_INIT
) else ( if "%G_STATE%" == "S_METHOD" ( goto :GCpp_METHOD
) else ( if "%G_STATE%" == "S_CHOICE" ( goto :GCpp_CHOICE
) else ( if "%G_STATE%" == "S_CPP_COMPILE_CPP_PATH" ( goto :GCpp_CPP_COMPILE_CPP_PATH
) else ( if "%G_STATE%" == "S_CPP_COMPILE_CPP_NAME" ( goto :GCpp_CPP_COMPILE_CPP_NAME
) else ( if "%G_STATE%" == "S_CPP_COMPILE_CPP_COMPILO" ( goto :GCpp_CPP_COMPILE_CPP_COMPILO
) else ( if "%G_STATE%" == "S_CPP_COMPILE_CPP_TARGET" ( goto :GCpp_CPP_COMPILE_CPP_TARGET
) else ( if "%G_STATE%" == "S_CPP_COMPILE" ( goto :GCpp_CPP_COMPILE
) else ( if "%G_STATE%" == "S_CPP_RUN_CPP_PATH" ( goto :GCpp_CPP_RUN_CPP_PATH
) else ( if "%G_STATE%" == "S_CPP_RUN_CPP_NAME" ( goto :GCpp_CPP_RUN_CPP_NAME
) else ( if "%G_STATE%" == "S_CPP_RUN" ( goto :GCpp_CPP_RUN
) else ( if "%G_STATE%" == "S_SAVE" ( goto :GCpp_SAVE
) else ( if "%G_STATE%" == "S_LOAD" ( goto :GCpp_LOAD
) else ( if "%G_STATE%" == "S_QUIT" ( goto :GCpp_QUIT
) else ( goto :eof
)))))))))))))))
goto :GCpp_Main
::===============================================
:GCpp_ADMIN
call gz_admin
set "G_STATE=S_END"
goto :GCpp_Main
::===============================================
:GCpp_INIT
printf "\n"
printf "CPP !!!\n"
printf "\t%%-2s : %%s\n" "-q" "quitter l'application"
printf "\t%%-2s : %%s\n" "-i" "reinitialiser l'application"
printf "\t%%-2s : %%s\n" "-a" "redemarrer l'application"
printf "\t%%-2s : %%s\n" "-v" "valider les configurations"
printf "\n"
set "G_STATE=S_LOAD"
goto :GCpp_Main
::===============================================
:GCpp_METHOD
printf "CPP :\n"
printf "\t%%-2s : %%s\n" "1" "compiler un projet Cpp"
printf "\n"
set "G_STATE=S_CHOICE"
goto :GCpp_Main
::===============================================
:GCpp_CHOICE
set "lAnswer=" 
set /p lAnswer=CPP (%G_CPP_ID%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_CPP_ID%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "1" ( set "G_STATE=S_CPP_COMPILE_CPP_PATH" & set "G_CPP_ID=%lAnswer%" 
))))
goto :GCpp_Main
::===============================================
:GCpp_CPP_COMPILE_CPP_PATH
set "lAnswer=" 
set /p lAnswer=G_CPP_PATH (%G_CPP_PATH%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_CPP_PATH%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_CPP_COMPILE"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_CPP_COMPILE_CPP_NAME" & set "G_CPP_PATH=%lAnswer%" 
)))))
goto :GCpp_Main
::===============================================
:GCpp_CPP_COMPILE_CPP_NAME
set "lAnswer=" 
set /p lAnswer=G_CPP_NAME (%G_CPP_NAME%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_CPP_NAME%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_CPP_COMPILE"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_CPP_COMPILE_CPP_COMPILO" & set "G_CPP_NAME=%lAnswer%" 
)))))
goto :GCpp_Main
::===============================================
:GCpp_CPP_COMPILE_CPP_COMPILO
set "lAnswer=" 
set /p lAnswer=G_CPP_COMPILO (%G_CPP_COMPILO%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_CPP_COMPILO%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_CPP_COMPILE"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_CPP_COMPILE_CPP_TARGET" & set "G_CPP_COMPILO=%lAnswer%" 
)))))
goto :GCpp_Main
::===============================================
:GCpp_CPP_COMPILE_CPP_TARGET
set "lAnswer=" 
set /p lAnswer=G_CPP_TARGET (%G_CPP_TARGET%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_CPP_TARGET%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_CPP_COMPILE"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_CPP_COMPILE" & set "G_CPP_TARGET=%lAnswer%" 
)))))
goto :GCpp_Main
::===============================================
:GCpp_CPP_COMPILE
echo.
set "lBuldPath=%G_CPP_PATH%\%G_CPP_NAME%\win"
set "lMakefile=Makefile"
if not "%G_CPP_COMPILO%" == "" ( set "lMakefile=Makefile.%G_CPP_COMPILO%" )
cd %lBuldPath%
mingw32-make -f %lMakefile% %G_CPP_TARGET%
echo.
set "G_STATE=S_SAVE"
goto :GCpp_Main
::===============================================
:GCpp_SAVE
call gz_process_in sqlite_config_save "G_CPP_ID" "%G_CPP_ID%"
call gz_process_in sqlite_config_save "G_CPP_PATH" "%G_CPP_PATH%"
call gz_process_in sqlite_config_save "G_CPP_NAME" "%G_CPP_NAME%"
call gz_process_in sqlite_config_save "G_CPP_COMPILO" "%G_CPP_COMPILO%"
call gz_process_in sqlite_config_save "G_CPP_TARGET" "%G_CPP_TARGET%"
set "G_STATE=S_QUIT" & cd %GPWD%
goto :GCpp_Main
::===============================================
:GCpp_LOAD
call gz_process_in sqlite_config_load "G_CPP_ID" G_CPP_ID
call gz_process_in sqlite_config_load "G_CPP_PATH" G_CPP_PATH
call gz_process_in sqlite_config_load "G_CPP_NAME" G_CPP_NAME
call gz_process_in sqlite_config_load "G_CPP_COMPILO" G_CPP_COMPILO
call gz_process_in sqlite_config_load "G_CPP_TARGET" G_CPP_TARGET
set "G_STATE=S_METHOD"
goto :GCpp_Main
::===============================================
:GCpp_QUIT
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
goto :GCpp_Main
::===============================================
