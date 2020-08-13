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
) else ( goto :eof
)))))
goto :GProcess_Main
::===============================================
:GProcess_INIT
set "lAction=%1"
if "%lAction%" == "1" ( set "G_STATE=S_SQLITE_QUERY" 
) else ( if "%lAction%" == "2" ( set "G_STATE=S_SQLITE_QUERY_INIT"
) else ( if "%lAction%" == "3" ( set "G_STATE=S_SQLITE_QUERY_SET"
) else ( if "%lAction%" == "4" ( set "G_STATE=S_SQLITE_QUERY_SHOW"
) else ( set "G_STATE=S_END"
))))
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
printf "%%s\n" %2 >> %G_TMP_FILE_01%
set "G_STATE=S_END"
goto :GProcess_Main
::===============================================
:GProcess_SQLITE_QUERY_SHOW
cat %G_TMP_FILE_01%
set "G_STATE=S_END"
goto :GProcess_Main
::===============================================
