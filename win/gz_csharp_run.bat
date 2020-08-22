@echo off
::===============================================
set "GPWD=%cd%"
::===============================================
set "G_STATE=S_INIT"
::===============================================
call :GCSharp_Main
cd %GPWD%
goto :eof
::===============================================
:GCSharp_Main
if "%G_STATE%" == "S_ADMIN" ( goto :GCSharp_ADMIN 
) else ( if "%G_STATE%" == "S_INIT" ( goto :GCSharp_INIT
) else ( if "%G_STATE%" == "S_METHOD" ( goto :GCSharp_METHOD
) else ( if "%G_STATE%" == "S_CHOICE" ( goto :GCSharp_CHOICE
) else ( if "%G_STATE%" == "S_CSHARP_COMPILE_CSHARP_PATH" ( goto :GCSharp_CSHARP_COMPILE_CSHARP_PATH
) else ( if "%G_STATE%" == "S_CSHARP_COMPILE_CSHARP_NAME" ( goto :GCSharp_CSHARP_COMPILE_CSHARP_NAME
) else ( if "%G_STATE%" == "S_CSHARP_COMPILE_CSHARP_COMPILO" ( goto :GCSharp_CSHARP_COMPILE_CSHARP_COMPILO
) else ( if "%G_STATE%" == "S_CSHARP_COMPILE_CSHARP_TARGET" ( goto :GCSharp_CSHARP_COMPILE_CSHARP_TARGET
) else ( if "%G_STATE%" == "S_CSHARP_COMPILE_CSHARP_ARGS" ( goto :GCSharp_CSHARP_COMPILE_CSHARP_ARGS
) else ( if "%G_STATE%" == "S_CSHARP_COMPILE" ( goto :GCSharp_CSHARP_COMPILE
) else ( if "%G_STATE%" == "S_SAVE" ( goto :GCSharp_SAVE
) else ( if "%G_STATE%" == "S_LOAD" ( goto :GCSharp_LOAD
) else ( if "%G_STATE%" == "S_QUIT" ( goto :GCSharp_QUIT
) else ( goto :eof
)))))))))))))
goto :GCSharp_Main
::===============================================
:GCSharp_ADMIN
call gz_admin
set "G_STATE=S_END"
goto :GCSharp_Main
::===============================================
:GCSharp_INIT
printf "\n"
printf "CSHARP !!!\n"
printf "\t%%-2s : %%s\n" "-q" "quitter l'application"
printf "\t%%-2s : %%s\n" "-i" "reinitialiser l'application"
printf "\t%%-2s : %%s\n" "-a" "redemarrer l'application"
printf "\t%%-2s : %%s\n" "-v" "valider les configurations"
printf "\n"
set "G_STATE=S_LOAD"
goto :GCSharp_Main
::===============================================
:GCSharp_METHOD
printf "CSHARP :\n"
printf "\t%%-2s : %%s\n" "1" "compiler un projet python"
printf "\n"
set "G_STATE=S_CHOICE"
goto :GCSharp_Main
::===============================================
:GCSharp_CHOICE
set "lAnswer=" 
set /p lAnswer=CSHARP (%G_CSHARP_ID%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_CSHARP_ID%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "1" ( set "G_STATE=S_CSHARP_COMPILE_CSHARP_PATH" & set "G_CSHARP_ID=%lAnswer%" 
))))
goto :GCSharp_Main
::===============================================
:GCSharp_CSHARP_COMPILE_CSHARP_PATH
set "lAnswer=" 
set /p lAnswer=G_CSHARP_PATH (%G_CSHARP_PATH%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_CSHARP_PATH%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_CSHARP_COMPILE"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_CSHARP_COMPILE_CSHARP_NAME" & set "G_CSHARP_PATH=%lAnswer%" 
)))))
goto :GCSharp_Main
::===============================================
:GCSharp_CSHARP_COMPILE_CSHARP_NAME
set "lAnswer=" 
set /p lAnswer=G_CSHARP_NAME (%G_CSHARP_NAME%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_CSHARP_NAME%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_CSHARP_COMPILE"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_CSHARP_COMPILE_CSHARP_COMPILO" & set "G_CSHARP_NAME=%lAnswer%" 
)))))
goto :GCSharp_Main
::===============================================
:GCSharp_CSHARP_COMPILE_CSHARP_COMPILO
set "lAnswer=" 
set /p lAnswer=G_CSHARP_COMPILO (%G_CSHARP_COMPILO%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_CSHARP_COMPILO%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_CSHARP_COMPILE"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_CSHARP_COMPILE_CSHARP_TARGET" & set "G_CSHARP_COMPILO=%lAnswer%" 
)))))
goto :GCSharp_Main
::===============================================
:GCSharp_CSHARP_COMPILE_CSHARP_TARGET
set "lAnswer=" 
set /p lAnswer=G_CSHARP_TARGET (%G_CSHARP_TARGET%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_CSHARP_TARGET%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_CSHARP_COMPILE_CSHARP_ARGS"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_CSHARP_COMPILE_CSHARP_ARGS" & set "G_CSHARP_TARGET=%lAnswer%" 
)))))
goto :GCSharp_Main
::===============================================
:GCSharp_CSHARP_COMPILE_CSHARP_ARGS
set "lAnswer=" 
set /p lAnswer=G_CSHARP_ARGS (%G_CSHARP_ARGS%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_CSHARP_ARGS%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_CSHARP_COMPILE"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_CSHARP_COMPILE" & set "G_CSHARP_ARGS=%lAnswer%" 
)))))
goto :GCSharp_Main
::===============================================
:GCSharp_CSHARP_COMPILE
echo.
set "lBuldPath=%G_CSHARP_PATH%\%G_CSHARP_NAME%\win"
set "lMakefile=Makefile"
if not "%G_CSHARP_COMPILO%" == "" ( set "lMakefile=Makefile.%G_CSHARP_COMPILO%" )
cd %lBuldPath%
mingw32-make -f %lMakefile% %G_CSHARP_TARGET% GARGS="%G_CSHARP_ARGS%"
echo.
set "G_STATE=S_SAVE"
goto :GCSharp_Main
::===============================================
:GCSharp_SAVE
call gz_process_in sqlite_config_save "G_CSHARP_ID" "%G_CSHARP_ID%"
call gz_process_in sqlite_config_save "G_CSHARP_PATH" "%G_CSHARP_PATH%"
call gz_process_in sqlite_config_save "G_CSHARP_NAME" "%G_CSHARP_NAME%"
call gz_process_in sqlite_config_save "G_CSHARP_COMPILO" "%G_CSHARP_COMPILO%"
call gz_process_in sqlite_config_save "G_CSHARP_TARGET" "%G_CSHARP_TARGET%"
call gz_process_in sqlite_config_save "G_CSHARP_ARGS" "%G_CSHARP_ARGS%"
set "G_STATE=S_QUIT" & cd %GPWD%
goto :GCSharp_Main
::===============================================
:GCSharp_LOAD
call gz_process_in sqlite_config_load "G_CSHARP_ID" G_CSHARP_ID
call gz_process_in sqlite_config_load "G_CSHARP_PATH" G_CSHARP_PATH
call gz_process_in sqlite_config_load "G_CSHARP_NAME" G_CSHARP_NAME
call gz_process_in sqlite_config_load "G_CSHARP_COMPILO" G_CSHARP_COMPILO
call gz_process_in sqlite_config_load "G_CSHARP_TARGET" G_CSHARP_TARGET
call gz_process_in sqlite_config_load "G_CSHARP_ARGS" G_CSHARP_ARGS
set "G_STATE=S_METHOD"
goto :GCSharp_Main
::===============================================
:GCSharp_QUIT
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
goto :GCSharp_Main
::===============================================
