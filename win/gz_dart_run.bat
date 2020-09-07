@echo off
::===============================================
set "GPWD=%cd%"
::===============================================
set "G_STATE=S_INIT"
::===============================================
call :GDart_Main
cd %GPWD%
goto :eof
::===============================================
:GDart_Main
if "%G_STATE%" == "S_ADMIN" ( goto :GDart_ADMIN 
) else ( if "%G_STATE%" == "S_INIT" ( goto :GDart_INIT
) else ( if "%G_STATE%" == "S_METHOD" ( goto :GDart_METHOD
) else ( if "%G_STATE%" == "S_CHOICE" ( goto :GDart_CHOICE
) else ( if "%G_STATE%" == "S_DART_COMPILE_DART_PATH" ( goto :GDart_DART_COMPILE_DART_PATH
) else ( if "%G_STATE%" == "S_DART_COMPILE_DART_NAME" ( goto :GDart_DART_COMPILE_DART_NAME
) else ( if "%G_STATE%" == "S_DART_COMPILE_DART_COMPILO" ( goto :GDart_DART_COMPILE_DART_COMPILO
) else ( if "%G_STATE%" == "S_DART_COMPILE_DART_TARGET" ( goto :GDart_DART_COMPILE_DART_TARGET
) else ( if "%G_STATE%" == "S_DART_COMPILE" ( goto :GDart_DART_COMPILE
) else ( if "%G_STATE%" == "S_DART_RUN_DART_PATH" ( goto :GDart_DART_RUN_DART_PATH
) else ( if "%G_STATE%" == "S_DART_RUN_DART_NAME" ( goto :GDart_DART_RUN_DART_NAME
) else ( if "%G_STATE%" == "S_DART_RUN" ( goto :GDart_DART_RUN
) else ( if "%G_STATE%" == "S_SAVE" ( goto :GDart_SAVE
) else ( if "%G_STATE%" == "S_LOAD" ( goto :GDart_LOAD
) else ( if "%G_STATE%" == "S_QUIT" ( goto :GDart_QUIT
) else ( goto :eof
)))))))))))))))
goto :GDart_Main
::===============================================
:GDart_ADMIN
call gz_admin
set "G_STATE=S_END"
goto :GDart_Main
::===============================================
:GDart_INIT
printf "\n"
printf "DART !!!\n"
printf "\t%%-2s : %%s\n" "-q" "quitter l'application"
printf "\t%%-2s : %%s\n" "-i" "reinitialiser l'application"
printf "\t%%-2s : %%s\n" "-a" "redemarrer l'application"
printf "\t%%-2s : %%s\n" "-v" "valider les configurations"
printf "\n"
set "G_STATE=S_LOAD"
goto :GDart_Main
::===============================================
:GDart_METHOD
printf "DART :\n"
printf "\t%%-2s : %%s\n" "1" "compiler un projet dart"
printf "\n"
set "G_STATE=S_CHOICE"
goto :GDart_Main
::===============================================
:GDart_CHOICE
set "lAnswer=" 
set /p lAnswer=DART (%G_DART_ID%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_DART_ID%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "1" ( set "G_STATE=S_DART_COMPILE_DART_PATH" & set "G_DART_ID=%lAnswer%" 
))))
goto :GDart_Main
::===============================================
:GDart_DART_COMPILE_DART_PATH
set "lAnswer=" 
set /p lAnswer=G_DART_PATH (%G_DART_PATH%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_DART_PATH%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_DART_COMPILE"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_DART_COMPILE_DART_NAME" & set "G_DART_PATH=%lAnswer%" 
)))))
goto :GDart_Main
::===============================================
:GDart_DART_COMPILE_DART_NAME
set "lAnswer=" 
set /p lAnswer=G_DART_NAME (%G_DART_NAME%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_DART_NAME%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_DART_COMPILE"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_DART_COMPILE_DART_COMPILO" & set "G_DART_NAME=%lAnswer%" 
)))))
goto :GDart_Main
::===============================================
:GDart_DART_COMPILE_DART_COMPILO
set "lAnswer=" 
set /p lAnswer=G_DART_COMPILO (%G_DART_COMPILO%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_DART_COMPILO%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_DART_COMPILE"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_DART_COMPILE_DART_TARGET" & set "G_DART_COMPILO=%lAnswer%" 
)))))
goto :GDart_Main
::===============================================
:GDart_DART_COMPILE_DART_TARGET
set "lAnswer=" 
set /p lAnswer=G_DART_TARGET (%G_DART_TARGET%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_DART_TARGET%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_DART_COMPILE"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_DART_COMPILE" & set "G_DART_TARGET=%lAnswer%" 
)))))
goto :GDart_Main
::===============================================
:GDart_DART_COMPILE
echo.
set "lBuldPath=%G_DART_PATH%\%G_DART_NAME%\win"
set "lMakefile=Makefile"
if not "%G_DART_COMPILO%" == "" ( set "lMakefile=Makefile.%G_DART_COMPILO%" )
cd %lBuldPath%
mingw32-make -f %lMakefile% %G_DART_TARGET%
echo.
set "G_STATE=S_SAVE"
goto :GDart_Main
::===============================================
:GDart_SAVE
call gz_process_in sqlite_config_save "G_DART_ID" "%G_DART_ID%"
call gz_process_in sqlite_config_save "G_DART_PATH" "%G_DART_PATH%"
call gz_process_in sqlite_config_save "G_DART_NAME" "%G_DART_NAME%"
call gz_process_in sqlite_config_save "G_DART_COMPILO" "%G_DART_COMPILO%"
call gz_process_in sqlite_config_save "G_DART_TARGET" "%G_DART_TARGET%"
set "G_STATE=S_QUIT" & cd %GPWD%
goto :GDart_Main
::===============================================
:GDart_LOAD
call gz_process_in sqlite_config_load "G_DART_ID" G_DART_ID
call gz_process_in sqlite_config_load "G_DART_PATH" G_DART_PATH
call gz_process_in sqlite_config_load "G_DART_NAME" G_DART_NAME
call gz_process_in sqlite_config_load "G_DART_COMPILO" G_DART_COMPILO
call gz_process_in sqlite_config_load "G_DART_TARGET" G_DART_TARGET
set "G_STATE=S_METHOD"
goto :GDart_Main
::===============================================
:GDart_QUIT
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
goto :GDart_Main
::===============================================
