@echo off
::===============================================
set "GPWD=%cd%"
::===============================================
set "G_STATE=S_INIT"
::===============================================
set "G_CONFIG_DB=%GPATH%\.config.dat"
::===============================================
set "G_TMP_PATH=%GPATH%\tmp"
set "G_TMP_FILE_01=%G_TMP_PATH%\tmp_file_01.txt"
set "G_TMP_FILE_02=%G_TMP_PATH%\tmp_file_02.txt"
::===============================================
set "G_NOTEPADPP_EXE=notepad++ -multiInst -notabbar -nosession -noPlugin"
set "G_NOTEPAD_EXE=notepad"
::===============================================
if not exist "%G_TMP_PATH%" ( mkdir %G_TMP_PATH% )
::===============================================
call :GProcess_Main %*
cd %GPWD%
goto :eof
::===============================================
:GProcess_Main
if "%G_STATE%" == "S_INIT" ( goto :GProcess_INIT %*
) else ( if "%G_STATE%" == "S_SQLITE_QUERY" ( goto :GProcess_SQLITE_QUERY %*
) else ( if "%G_STATE%" == "S_SQLITE_QUERY_INIT" ( goto :GProcess_SQLITE_QUERY_INIT %*
) else ( if "%G_STATE%" == "S_SQLITE_QUERY_SET" ( goto :GProcess_SQLITE_QUERY_SET %*
) else ( if "%G_STATE%" == "S_SQLITE_QUERY_SHOW" ( goto :GProcess_SQLITE_QUERY_SHOW %*
) else ( if "%G_STATE%" == "S_SQLITE_CONFIG_SAVE" ( goto :GProcess_SQLITE_CONFIG_SAVE %*
) else ( if "%G_STATE%" == "S_SQLITE_CONFIG_LOAD" ( goto :GProcess_SQLITE_CONFIG_LOAD %*
) else ( if "%G_STATE%" == "S_NOTEPADPP_OPEN" ( goto :GProcess_NOTEPADPP_OPEN %*
) else ( if "%G_STATE%" == "S_CONFIRM" ( goto :GProcess_CONFIRM %*
) else ( if "%G_STATE%" == "S_QUIT" ( goto :GProcess_QUIT %*
) else ( goto :eof
))))))))))
goto :GProcess_Main
::===============================================
:GProcess_INIT
set "lAction=%1"
if "%lAction%" == "sqlite_query" ( set "G_STATE=S_SQLITE_QUERY" 
) else ( if "%lAction%" == "sqlite_query_init" ( set "G_STATE=S_SQLITE_QUERY_INIT"
) else ( if "%lAction%" == "sqlite_query_set" ( set "G_STATE=S_SQLITE_QUERY_SET"
) else ( if "%lAction%" == "sqlite_query_show" ( set "G_STATE=S_SQLITE_QUERY_SHOW"
) else ( if "%lAction%" == "sqlite_config_save" ( set "G_STATE=S_SQLITE_CONFIG_SAVE"
) else ( if "%lAction%" == "sqlite_config_load" ( set "G_STATE=S_SQLITE_CONFIG_LOAD"
) else ( if "%lAction%" == "notepadpp_open" ( set "G_STATE=S_NOTEPADPP_OPEN"
) else ( if "%lAction%" == "confirm" ( set "G_STATE=S_CONFIRM"
) else ( if "%lAction%" == "quit" ( set "G_STATE=S_QUIT"
) else ( set "G_STATE=S_END"
)))))))))
goto :GProcess_Main
::===============================================
:GProcess_SQLITE_QUERY
sqlite3 %G_CONFIG_DB% < %G_TMP_FILE_01%
set "G_STATE=S_END"
goto :GProcess_Main
::===============================================
:GProcess_SQLITE_QUERY_INIT
printf "" > %G_TMP_FILE_01%
set "G_STATE=S_END"
goto :GProcess_Main
::===============================================
:GProcess_SQLITE_QUERY_SET
printf "%%s\n" "%~2" >> %G_TMP_FILE_01%
set "G_STATE=S_END"
goto :GProcess_Main
::===============================================
:GProcess_SQLITE_QUERY_SHOW
cat %G_TMP_FILE_01%
set "G_STATE=S_END"
goto :GProcess_Main
::===============================================
:GProcess_SQLITE_CONFIG_SAVE
call :GProcess_SQLITE_CONFIG_CHECK "%~2" lCheck
if "%lCheck%" == "0" ( call :GProcess_SQLITE_CONFIG_INSERT "%~2" "%~3"
) else ( call :GProcess_SQLITE_CONFIG_UPDATE "%~2" "%~3"
)
set "G_STATE=S_END"
goto :GProcess_Main
::===============================================
:GProcess_SQLITE_CONFIG_CHECK
call :GProcess_SQLITE_QUERY_INIT
call :GProcess_SQLITE_QUERY_SET 0 "select count(*) from CONFIG_DATA"
call :GProcess_SQLITE_QUERY_SET 0 "where CONFIG_KEY='%~1'"
call :GProcess_SQLITE_QUERY > %G_TMP_FILE_02%
set /p %2=<%G_TMP_FILE_02%
goto :eof
::===============================================
:GProcess_SQLITE_CONFIG_INSERT
call :GProcess_SQLITE_QUERY_INIT
call :GProcess_SQLITE_QUERY_SET 0 "insert into CONFIG_DATA(CONFIG_KEY, CONFIG_VALUE)"
call :GProcess_SQLITE_QUERY_SET 0 "values('%~1', '%~2')"
call :GProcess_SQLITE_QUERY
goto :eof
::===============================================
:GProcess_SQLITE_CONFIG_UPDATE
call :GProcess_SQLITE_QUERY_INIT
call :GProcess_SQLITE_QUERY_SET 0 "update CONFIG_DATA"
call :GProcess_SQLITE_QUERY_SET 0 "set CONFIG_VALUE='%~2'"
call :GProcess_SQLITE_QUERY_SET 0 "where CONFIG_KEY='%~1'"
call :GProcess_SQLITE_QUERY
goto :eof
::===============================================
:GProcess_SQLITE_CONFIG_LOAD
call :GProcess_SQLITE_CONFIG_SELECT "%~2" %~3
set "G_STATE=S_END"
goto :GProcess_Main
::===============================================
:GProcess_SQLITE_CONFIG_SELECT
call :GProcess_SQLITE_QUERY_INIT
call :GProcess_SQLITE_QUERY_SET 0 "select CONFIG_VALUE"
call :GProcess_SQLITE_QUERY_SET 0 "from CONFIG_DATA"
call :GProcess_SQLITE_QUERY_SET 0 "where CONFIG_KEY='%~1'"
call :GProcess_SQLITE_QUERY > %G_TMP_FILE_02%
set /p %2=<%G_TMP_FILE_02%
goto :eof
::===============================================
:GProcess_NOTEPADPP_OPEN
echo. > %G_TMP_FILE_01%
%G_NOTEPADPP_EXE% %G_TMP_FILE_01%
::start /wait %G_NOTEPAD_EXE% "%G_TMP_FILE_01%"
set /p %2=<%G_TMP_FILE_01%
set "G_STATE=S_END"
goto :GProcess_Main
::===============================================
:GProcess_CONFIRM
echo.
set "lAnswer=n"
set /p lAnswer=Confirmation (Oui/[N]on) ? : 
set "lAnswerIn=%lAnswer:~0,1%"
if "%lAnswerIn%" == "o" ( echo Operation effectuee & set "%2=1"
) else ( if "%lAnswerIn%" == "O" ( echo Operation effectuee & set "%2=1"
) else (  echo Operation annulee & set "%2=0"
))
echo.
set "G_STATE=S_END"
goto :GProcess_Main
::===============================================
:GProcess_QUIT
set "lAnswer="
set /p lAnswer=QUIT (Oui/[N]on) ? : 
set "%2=%lAnswer%"
set "G_STATE=S_END"
goto :GProcess_Main
::===============================================
