@echo off
::===============================================
set "GPWD=%cd%"
::===============================================
set "G_STATE=S_INIT"
::===============================================
call :GJava_Main
cd %GPWD%
goto :eof
::===============================================
:GJava_Main
if "%G_STATE%" == "S_ADMIN" ( goto :GJava_ADMIN 
) else ( if "%G_STATE%" == "S_INIT" ( goto :GJava_INIT
) else ( if "%G_STATE%" == "S_METHOD" ( goto :GJava_METHOD
) else ( if "%G_STATE%" == "S_CHOICE" ( goto :GJava_CHOICE
) else ( if "%G_STATE%" == "S_JAVA_COMPILE_JAVA_PATH" ( goto :GJava_JAVA_COMPILE_JAVA_PATH
) else ( if "%G_STATE%" == "S_JAVA_COMPILE_JAVA_NAME" ( goto :GJava_JAVA_COMPILE_JAVA_NAME
) else ( if "%G_STATE%" == "S_JAVA_COMPILE_JAVA_COMPILO" ( goto :GJava_JAVA_COMPILE_JAVA_COMPILO
) else ( if "%G_STATE%" == "S_JAVA_COMPILE_JAVA_TARGET" ( goto :GJava_JAVA_COMPILE_JAVA_TARGET
) else ( if "%G_STATE%" == "S_JAVA_COMPILE_JAVA_ARGS" ( goto :GJava_JAVA_COMPILE_JAVA_ARGS
) else ( if "%G_STATE%" == "S_JAVA_COMPILE" ( goto :GJava_JAVA_COMPILE
) else ( if "%G_STATE%" == "S_SAVE" ( goto :GJava_SAVE
) else ( if "%G_STATE%" == "S_LOAD" ( goto :GJava_LOAD
) else ( if "%G_STATE%" == "S_QUIT" ( goto :GJava_QUIT
) else ( goto :eof
)))))))))))))
goto :GJava_Main
::===============================================
:GJava_ADMIN
call gz_admin
set "G_STATE=S_END"
goto :GJava_Main
::===============================================
:GJava_INIT
printf "\n"
printf "JAVA !!!\n"
printf "\t%%-2s : %%s\n" "-q" "quitter l'application"
printf "\t%%-2s : %%s\n" "-i" "reinitialiser l'application"
printf "\t%%-2s : %%s\n" "-a" "redemarrer l'application"
printf "\t%%-2s : %%s\n" "-v" "valider les configurations"
printf "\n"
set "G_STATE=S_LOAD"
goto :GJava_Main
::===============================================
:GJava_METHOD
printf "JAVA :\n"
printf "\t%%-2s : %%s\n" "1" "compiler un projet python"
printf "\n"
set "G_STATE=S_CHOICE"
goto :GJava_Main
::===============================================
:GJava_CHOICE
set "lAnswer=" 
set /p lAnswer=JAVA (%G_JAVA_ID%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_JAVA_ID%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "1" ( set "G_STATE=S_JAVA_COMPILE_JAVA_PATH" & set "G_JAVA_ID=%lAnswer%" 
))))
goto :GJava_Main
::===============================================
:GJava_JAVA_COMPILE_JAVA_PATH
set "lAnswer=" 
set /p lAnswer=G_JAVA_PATH (%G_JAVA_PATH%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_JAVA_PATH%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_JAVA_COMPILE"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_JAVA_COMPILE_JAVA_NAME" & set "G_JAVA_PATH=%lAnswer%" 
)))))
goto :GJava_Main
::===============================================
:GJava_JAVA_COMPILE_JAVA_NAME
set "lAnswer=" 
set /p lAnswer=G_JAVA_NAME (%G_JAVA_NAME%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_JAVA_NAME%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_JAVA_COMPILE"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_JAVA_COMPILE_JAVA_COMPILO" & set "G_JAVA_NAME=%lAnswer%" 
)))))
goto :GJava_Main
::===============================================
:GJava_JAVA_COMPILE_JAVA_COMPILO
set "lAnswer=" 
set /p lAnswer=G_JAVA_COMPILO (%G_JAVA_COMPILO%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_JAVA_COMPILO%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_JAVA_COMPILE"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_JAVA_COMPILE_JAVA_TARGET" & set "G_JAVA_COMPILO=%lAnswer%" 
)))))
goto :GJava_Main
::===============================================
:GJava_JAVA_COMPILE_JAVA_TARGET
set "lAnswer=" 
set /p lAnswer=G_JAVA_TARGET (%G_JAVA_TARGET%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_JAVA_TARGET%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_JAVA_COMPILE_JAVA_ARGS"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_JAVA_COMPILE_JAVA_ARGS" & set "G_JAVA_TARGET=%lAnswer%" 
)))))
goto :GJava_Main
::===============================================
:GJava_JAVA_COMPILE_JAVA_ARGS
set "lAnswer=" 
set /p lAnswer=G_JAVA_ARGS (%G_JAVA_ARGS%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_JAVA_ARGS%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_JAVA_COMPILE"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_JAVA_COMPILE" & set "G_JAVA_ARGS=%lAnswer%" 
)))))
goto :GJava_Main
::===============================================
:GJava_JAVA_COMPILE
echo.
set "lBuldPath=%G_JAVA_PATH%\%G_JAVA_NAME%\win"
set "lMakefile=Makefile"
if not "%G_JAVA_COMPILO%" == "" ( set "lMakefile=Makefile.%G_JAVA_COMPILO%" )
cd %lBuldPath%
set CLASSPATH=build
mingw32-make -f %lMakefile% %G_JAVA_TARGET% GARGS="%G_JAVA_ARGS%"
echo.
set "G_STATE=S_SAVE"
goto :GJava_Main
::===============================================
:GJava_SAVE
call gz_process_in sqlite_config_save "G_JAVA_ID" "%G_JAVA_ID%"
call gz_process_in sqlite_config_save "G_JAVA_PATH" "%G_JAVA_PATH%"
call gz_process_in sqlite_config_save "G_JAVA_NAME" "%G_JAVA_NAME%"
call gz_process_in sqlite_config_save "G_JAVA_COMPILO" "%G_JAVA_COMPILO%"
call gz_process_in sqlite_config_save "G_JAVA_TARGET" "%G_JAVA_TARGET%"
call gz_process_in sqlite_config_save "G_JAVA_ARGS" "%G_JAVA_ARGS%"
set "G_STATE=S_QUIT" & cd %GPWD%
goto :GJava_Main
::===============================================
:GJava_LOAD
call gz_process_in sqlite_config_load "G_JAVA_ID" G_JAVA_ID
call gz_process_in sqlite_config_load "G_JAVA_PATH" G_JAVA_PATH
call gz_process_in sqlite_config_load "G_JAVA_NAME" G_JAVA_NAME
call gz_process_in sqlite_config_load "G_JAVA_COMPILO" G_JAVA_COMPILO
call gz_process_in sqlite_config_load "G_JAVA_TARGET" G_JAVA_TARGET
call gz_process_in sqlite_config_load "G_JAVA_ARGS" G_JAVA_ARGS
set "G_STATE=S_METHOD"
goto :GJava_Main
::===============================================
:GJava_QUIT
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
goto :GJava_Main
::===============================================
