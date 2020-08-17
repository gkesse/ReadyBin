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
) else ( if "%G_STATE%" == "S_GIT" ( goto :GAdmin_GIT
) else ( if "%G_STATE%" == "S_BIN" ( goto :GAdmin_BIN
) else ( if "%G_STATE%" == "S_C" ( goto :GAdmin_C
) else ( if "%G_STATE%" == "S_CPP" ( goto :GAdmin_CPP
) else ( if "%G_STATE%" == "S_CSHARP" ( goto :GAdmin_CSHARP
) else ( if "%G_STATE%" == "S_JAVA" ( goto :GAdmin_JAVA
) else ( if "%G_STATE%" == "S_PYTHON" ( goto :GAdmin_PYTHON
) else ( if "%G_STATE%" == "S_PHP" ( goto :GAdmin_PHP
) else ( if "%G_STATE%" == "S_DART" ( goto :GAdmin_DART
) else ( if "%G_STATE%" == "S_SAVE" ( goto :GAdmin_SAVE
) else ( if "%G_STATE%" == "S_LOAD" ( goto :GAdmin_LOAD
) else ( goto :eof
)))))))))))))))
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
printf "\t%%-2s : %%s\n" "2" "S_GIT"
printf "\n"
printf "\t%%-2s : %%s\n" "10" "S_BIN"
printf "\n"
printf "\t%%-2s : %%s\n" "20" "S_C"
printf "\t%%-2s : %%s\n" "21" "S_CPP"
printf "\t%%-2s : %%s\n" "22" "S_CSHARP"
printf "\t%%-2s : %%s\n" "23" "S_JAVA"
printf "\t%%-2s : %%s\n" "24" "S_PYTHON"
printf "\t%%-2s : %%s\n" "25" "S_PHP"
printf "\t%%-2s : %%s\n" "26" "S_DART"
printf "\n"
set "G_STATE=S_CHOICE"
goto :GAdmin_Main
::===============================================
:GAdmin_CHOICE
set "lAnswer=" 
set /p lAnswer=ADMIN (%G_ADMIN_ID%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_ADMIN_ID%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "1" ( set "G_STATE=S_SQLITE" & set "G_ADMIN_ID=%lAnswer%" 
) else ( if "%lAnswer%" == "2" ( set "G_STATE=S_GIT" & set "G_ADMIN_ID=%lAnswer%" 
) else ( if "%lAnswer%" == "10" ( set "G_STATE=S_BIN" & set "G_ADMIN_ID=%lAnswer%" 
) else ( if "%lAnswer%" == "20" ( set "G_STATE=S_C" & set "G_ADMIN_ID=%lAnswer%" 
) else ( if "%lAnswer%" == "21" ( set "G_STATE=S_CPP" & set "G_ADMIN_ID=%lAnswer%" 
) else ( if "%lAnswer%" == "22" ( set "G_STATE=S_CSHARP" & set "G_ADMIN_ID=%lAnswer%" 
) else ( if "%lAnswer%" == "23" ( set "G_STATE=S_JAVA" & set "G_ADMIN_ID=%lAnswer%" 
) else ( if "%lAnswer%" == "24" ( set "G_STATE=S_PYTHON" & set "G_ADMIN_ID=%lAnswer%" 
) else ( if "%lAnswer%" == "25" ( set "G_STATE=S_PHP" & set "G_ADMIN_ID=%lAnswer%" 
) else ( if "%lAnswer%" == "26" ( set "G_STATE=S_DART" & set "G_ADMIN_ID=%lAnswer%" 
)))))))))))
goto :GAdmin_Main
::===============================================
:GAdmin_SQLITE
call gz_sqlite_run
set "G_STATE=S_SAVE"
goto :GAdmin_Main
::===============================================
:GAdmin_GIT
call gz_git_run
set "G_STATE=S_SAVE"
goto :GAdmin_Main
::===============================================
:GAdmin_BIN
call gz_bin_run
set "G_STATE=S_SAVE"
goto :GAdmin_Main
::===============================================
:GAdmin_C
call gz_c_run
set "G_STATE=S_SAVE"
goto :GAdmin_Main
::===============================================
:GAdmin_CPP
call gz_cpp_run
set "G_STATE=S_SAVE"
goto :GAdmin_Main
::===============================================
:GAdmin_CSHARP
call gz_csharp_run
set "G_STATE=S_SAVE"
goto :GAdmin_Main
::===============================================
:GAdmin_JAVA
call gz_java_run
set "G_STATE=S_SAVE"
goto :GAdmin_Main
::===============================================
:GAdmin_PYTHON
call gz_python_run
set "G_STATE=S_SAVE"
goto :GAdmin_Main
::===============================================
:GAdmin_PHP
call gz_php_run
set "G_STATE=S_SAVE"
goto :GAdmin_Main
::===============================================
:GAdmin_DART
call gz_dart_run
set "G_STATE=S_SAVE"
goto :GAdmin_Main
::===============================================
:GAdmin_SAVE
call gz_process_in sqlite_config_save "G_ADMIN_ID" "%G_ADMIN_ID%"
set "G_STATE=S_END"
goto :GAdmin_Main
::===============================================
:GAdmin_LOAD
call gz_process_in sqlite_config_load "G_ADMIN_ID" G_ADMIN_ID
set "G_STATE=S_METHOD"
goto :GAdmin_Main
::===============================================
