@echo off
::===============================================
set "GPWD=%cd%"
::===============================================
set "G_STATE=S_INIT"
::===============================================
call :GC_Main
cd %GPWD%
goto :eof
::===============================================
:GC_Main
if "%G_STATE%" == "S_ADMIN" ( goto :GC_ADMIN 
) else ( if "%G_STATE%" == "S_INIT" ( goto :GC_INIT
) else ( if "%G_STATE%" == "S_METHOD" ( goto :GC_METHOD
) else ( if "%G_STATE%" == "S_CHOICE" ( goto :GC_CHOICE
) else ( if "%G_STATE%" == "S_C_COMPILE_C_PATH" ( goto :GC_C_COMPILE_C_PATH
) else ( if "%G_STATE%" == "S_C_COMPILE_C_NAME" ( goto :GC_C_COMPILE_C_NAME
) else ( if "%G_STATE%" == "S_C_COMPILE_C_COMPILO" ( goto :GC_C_COMPILE_C_COMPILO
) else ( if "%G_STATE%" == "S_C_COMPILE_C_TARGET" ( goto :GC_C_COMPILE_C_TARGET
) else ( if "%G_STATE%" == "S_C_COMPILE_C_ARGS" ( goto :GC_C_COMPILE_C_ARGS
) else ( if "%G_STATE%" == "S_C_COMPILE" ( goto :GC_C_COMPILE
) else ( if "%G_STATE%" == "S_SAVE" ( goto :GC_SAVE
) else ( if "%G_STATE%" == "S_LOAD" ( goto :GC_LOAD
) else ( if "%G_STATE%" == "S_QUIT" ( goto :GC_QUIT
) else ( goto :eof
)))))))))))))
goto :GC_Main
::===============================================
:GC_ADMIN
call gz_admin
set "G_STATE=S_END"
goto :GC_Main
::===============================================
:GC_INIT
printf "\n"
printf "C !!!\n"
printf "\t%%-2s : %%s\n" "-q" "quitter l'application"
printf "\t%%-2s : %%s\n" "-i" "reinitialiser l'application"
printf "\t%%-2s : %%s\n" "-a" "redemarrer l'application"
printf "\t%%-2s : %%s\n" "-v" "valider les configurations"
printf "\n"
set "G_STATE=S_LOAD"
goto :GC_Main
::===============================================
:GC_METHOD
printf "C :\n"
printf "\t%%-2s : %%s\n" "1" "compiler un projet python"
printf "\n"
set "G_STATE=S_CHOICE"
goto :GC_Main
::===============================================
:GC_CHOICE
set "lAnswer=" 
set /p lAnswer=C (%G_C_ID%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_C_ID%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "1" ( set "G_STATE=S_C_COMPILE_C_PATH" & set "G_C_ID=%lAnswer%" 
))))
goto :GC_Main
::===============================================
:GC_C_COMPILE_C_PATH
set "lAnswer=" 
set /p lAnswer=G_C_PATH (%G_C_PATH%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_C_PATH%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_C_COMPILE"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_C_COMPILE_C_NAME" & set "G_C_PATH=%lAnswer%" 
)))))
goto :GC_Main
::===============================================
:GC_C_COMPILE_C_NAME
set "lAnswer=" 
set /p lAnswer=G_C_NAME (%G_C_NAME%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_C_NAME%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_C_COMPILE"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_C_COMPILE_C_COMPILO" & set "G_C_NAME=%lAnswer%" 
)))))
goto :GC_Main
::===============================================
:GC_C_COMPILE_C_COMPILO
set "lAnswer=" 
set /p lAnswer=G_C_COMPILO (%G_C_COMPILO%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_C_COMPILO%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_C_COMPILE"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_C_COMPILE_C_TARGET" & set "G_C_COMPILO=%lAnswer%" 
)))))
goto :GC_Main
::===============================================
:GC_C_COMPILE_C_TARGET
set "lAnswer=" 
set /p lAnswer=G_C_TARGET (%G_C_TARGET%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_C_TARGET%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_C_COMPILE_C_ARGS"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_C_COMPILE_C_ARGS" & set "G_C_TARGET=%lAnswer%" 
)))))
goto :GC_Main
::===============================================
:GC_C_COMPILE_C_ARGS
set "lAnswer=" 
set /p lAnswer=G_C_ARGS (%G_C_ARGS%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_C_ARGS%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_C_COMPILE"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_C_COMPILE" & set "G_C_ARGS=%lAnswer%" 
)))))
goto :GC_Main
::===============================================
:GC_C_COMPILE
echo.
set "lBuldPath=%G_C_PATH%\%G_C_NAME%\win"
set "lMakefile=Makefile"
if not "%G_C_COMPILO%" == "" ( set "lMakefile=Makefile.%G_C_COMPILO%" )
cd %lBuldPath%
set CLASSPATH=build
mingw32-make -f %lMakefile% %G_C_TARGET% GARGS="%G_C_ARGS%"
echo.
set "G_STATE=S_SAVE"
goto :GC_Main
::===============================================
:GC_SAVE
call gz_process_in sqlite_config_save "G_C_ID" "%G_C_ID%"
call gz_process_in sqlite_config_save "G_C_PATH" "%G_C_PATH%"
call gz_process_in sqlite_config_save "G_C_NAME" "%G_C_NAME%"
call gz_process_in sqlite_config_save "G_C_COMPILO" "%G_C_COMPILO%"
call gz_process_in sqlite_config_save "G_C_TARGET" "%G_C_TARGET%"
call gz_process_in sqlite_config_save "G_C_ARGS" "%G_C_ARGS%"
set "G_STATE=S_QUIT" & cd %GPWD%
goto :GC_Main
::===============================================
:GC_LOAD
call gz_process_in sqlite_config_load "G_C_ID" G_C_ID
call gz_process_in sqlite_config_load "G_C_PATH" G_C_PATH
call gz_process_in sqlite_config_load "G_C_NAME" G_C_NAME
call gz_process_in sqlite_config_load "G_C_COMPILO" G_C_COMPILO
call gz_process_in sqlite_config_load "G_C_TARGET" G_C_TARGET
call gz_process_in sqlite_config_load "G_C_ARGS" G_C_ARGS
set "G_STATE=S_METHOD"
goto :GC_Main
::===============================================
:GC_QUIT
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
goto :GC_Main
::===============================================
