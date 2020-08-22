@echo off
::===============================================
set "GPWD=%cd%"
::===============================================
set "G_STATE=S_INIT"
::===============================================
call :GPython_Main
cd %GPWD%
goto :eof
::===============================================
:GPython_Main
if "%G_STATE%" == "S_ADMIN" ( goto :GPython_ADMIN 
) else ( if "%G_STATE%" == "S_INIT" ( goto :GPython_INIT
) else ( if "%G_STATE%" == "S_METHOD" ( goto :GPython_METHOD
) else ( if "%G_STATE%" == "S_CHOICE" ( goto :GPython_CHOICE
) else ( if "%G_STATE%" == "S_PYTHON_COMPILE_PYTHON_PATH" ( goto :GPython_PYTHON_COMPILE_PYTHON_PATH
) else ( if "%G_STATE%" == "S_PYTHON_COMPILE_PYTHON_NAME" ( goto :GPython_PYTHON_COMPILE_PYTHON_NAME
) else ( if "%G_STATE%" == "S_PYTHON_COMPILE_PYTHON_COMPILO" ( goto :GPython_PYTHON_COMPILE_PYTHON_COMPILO
) else ( if "%G_STATE%" == "S_PYTHON_COMPILE_PYTHON_TARGET" ( goto :GPython_PYTHON_COMPILE_PYTHON_TARGET
) else ( if "%G_STATE%" == "S_PYTHON_COMPILE_PYTHON_ARGS" ( goto :GPython_PYTHON_COMPILE_PYTHON_ARGS
) else ( if "%G_STATE%" == "S_PYTHON_COMPILE" ( goto :GPython_PYTHON_COMPILE
) else ( if "%G_STATE%" == "S_SAVE" ( goto :GPython_SAVE
) else ( if "%G_STATE%" == "S_LOAD" ( goto :GPython_LOAD
) else ( if "%G_STATE%" == "S_QUIT" ( goto :GPython_QUIT
) else ( goto :eof
)))))))))))))
goto :GPython_Main
::===============================================
:GPython_ADMIN
call gz_admin
set "G_STATE=S_END"
goto :GPython_Main
::===============================================
:GPython_INIT
printf "\n"
printf "PYTHON !!!\n"
printf "\t%%-2s : %%s\n" "-q" "quitter l'application"
printf "\t%%-2s : %%s\n" "-i" "reinitialiser l'application"
printf "\t%%-2s : %%s\n" "-a" "redemarrer l'application"
printf "\t%%-2s : %%s\n" "-v" "valider les configurations"
printf "\n"
set "G_STATE=S_LOAD"
goto :GPython_Main
::===============================================
:GPython_METHOD
printf "PYTHON :\n"
printf "\t%%-2s : %%s\n" "1" "compiler un projet python"
printf "\n"
set "G_STATE=S_CHOICE"
goto :GPython_Main
::===============================================
:GPython_CHOICE
set "lAnswer=" 
set /p lAnswer=PYTHON (%G_PYTHON_ID%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_PYTHON_ID%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "1" ( set "G_STATE=S_PYTHON_COMPILE_PYTHON_PATH" & set "G_PYTHON_ID=%lAnswer%" 
))))
goto :GPython_Main
::===============================================
:GPython_PYTHON_COMPILE_PYTHON_PATH
set "lAnswer=" 
set /p lAnswer=G_PYTHON_PATH (%G_PYTHON_PATH%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_PYTHON_PATH%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_PYTHON_COMPILE"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_PYTHON_COMPILE_PYTHON_NAME" & set "G_PYTHON_PATH=%lAnswer%" 
)))))
goto :GPython_Main
::===============================================
:GPython_PYTHON_COMPILE_PYTHON_NAME
set "lAnswer=" 
set /p lAnswer=G_PYTHON_NAME (%G_PYTHON_NAME%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_PYTHON_NAME%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_PYTHON_COMPILE"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_PYTHON_COMPILE_PYTHON_COMPILO" & set "G_PYTHON_NAME=%lAnswer%" 
)))))
goto :GPython_Main
::===============================================
:GPython_PYTHON_COMPILE_PYTHON_COMPILO
set "lAnswer=" 
set /p lAnswer=G_PYTHON_COMPILO (%G_PYTHON_COMPILO%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_PYTHON_COMPILO%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_PYTHON_COMPILE"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_PYTHON_COMPILE_PYTHON_TARGET" & set "G_PYTHON_COMPILO=%lAnswer%" 
)))))
goto :GPython_Main
::===============================================
:GPython_PYTHON_COMPILE_PYTHON_TARGET
set "lAnswer=" 
set /p lAnswer=G_PYTHON_TARGET (%G_PYTHON_TARGET%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_PYTHON_TARGET%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_PYTHON_COMPILE_PYTHON_ARGS"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_PYTHON_COMPILE_PYTHON_ARGS" & set "G_PYTHON_TARGET=%lAnswer%" 
)))))
goto :GPython_Main
::===============================================
:GPython_PYTHON_COMPILE_PYTHON_ARGS
set "lAnswer=" 
set /p lAnswer=G_PYTHON_ARGS (%G_PYTHON_ARGS%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_PYTHON_ARGS%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_PYTHON_COMPILE"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_PYTHON_COMPILE" & set "G_PYTHON_ARGS=%lAnswer%" 
)))))
goto :GPython_Main
::===============================================
:GPython_PYTHON_COMPILE
echo.
set "lBuldPath=%G_PYTHON_PATH%\%G_PYTHON_NAME%\win"
set "lMakefile=Makefile"
if not "%G_PYTHON_COMPILO%" == "" ( set "lMakefile=Makefile.%G_PYTHON_COMPILO%" )
cd %lBuldPath%
mingw32-make -f %lMakefile% %G_PYTHON_TARGET% GARGS="%G_PYTHON_ARGS%"
echo.
set "G_STATE=S_SAVE"
goto :GPython_Main
::===============================================
:GPython_SAVE
call gz_process_in sqlite_config_save "G_PYTHON_ID" "%G_PYTHON_ID%"
call gz_process_in sqlite_config_save "G_PYTHON_PATH" "%G_PYTHON_PATH%"
call gz_process_in sqlite_config_save "G_PYTHON_NAME" "%G_PYTHON_NAME%"
call gz_process_in sqlite_config_save "G_PYTHON_COMPILO" "%G_PYTHON_COMPILO%"
call gz_process_in sqlite_config_save "G_PYTHON_TARGET" "%G_PYTHON_TARGET%"
call gz_process_in sqlite_config_save "G_PYTHON_ARGS" "%G_PYTHON_ARGS%"
set "G_STATE=S_QUIT" & cd %GPWD%
goto :GPython_Main
::===============================================
:GPython_LOAD
call gz_process_in sqlite_config_load "G_PYTHON_ID" G_PYTHON_ID
call gz_process_in sqlite_config_load "G_PYTHON_PATH" G_PYTHON_PATH
call gz_process_in sqlite_config_load "G_PYTHON_NAME" G_PYTHON_NAME
call gz_process_in sqlite_config_load "G_PYTHON_COMPILO" G_PYTHON_COMPILO
call gz_process_in sqlite_config_load "G_PYTHON_TARGET" G_PYTHON_TARGET
call gz_process_in sqlite_config_load "G_PYTHON_ARGS" G_PYTHON_ARGS
set "G_STATE=S_METHOD"
goto :GPython_Main
::===============================================
:GPython_QUIT
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
goto :GPython_Main
::===============================================
