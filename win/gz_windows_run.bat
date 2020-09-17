@echo off
::===============================================
set "GPWD=%cd%"
::===============================================
set "G_STATE=S_INIT"
::===============================================
call :GWindows_Main
cd %GPWD%
goto :eof
::===============================================
:GWindows_Main
if "%G_STATE%" == "S_ADMIN" ( goto :GWindows_ADMIN 
) else ( if "%G_STATE%" == "S_INIT" ( goto :GWindows_INIT
) else ( if "%G_STATE%" == "S_METHOD" ( goto :GWindows_METHOD
) else ( if "%G_STATE%" == "S_CHOICE" ( goto :GWindows_CHOICE
) else ( if "%G_STATE%" == "S_RESOLUTION_SHOW" ( goto :GWindows_RESOLUTION_SHOW
) else ( if "%G_STATE%" == "S_SAVE" ( goto :GWindows_SAVE
) else ( if "%G_STATE%" == "S_LOAD" ( goto :GWindows_LOAD
) else ( if "%G_STATE%" == "S_QUIT" ( goto :GWindows_QUIT
) else ( goto :eof
))))))))
goto :GWindows_Main
::===============================================
:GWindows_ADMIN
call gz_admin
set "G_STATE=S_END"
goto :GWindows_Main
::===============================================
:GWindows_INIT
printf "\n"
printf "WINDOWS !!!\n"
printf "\t%%-2s : %%s\n" "-q" "quitter l'application"
printf "\t%%-2s : %%s\n" "-i" "reinitialiser l'application"
printf "\t%%-2s : %%s\n" "-a" "redemarrer l'application"
printf "\t%%-2s : %%s\n" "-v" "valider les configurations"
printf "\n"
set "G_STATE=S_LOAD"
goto :GWindows_Main
::===============================================
:GWindows_METHOD
printf "WINDOWS :\n"
printf "\t%%-2s : %%s\n" "1" "afficher la resolution"
printf "\n"
set "G_STATE=S_CHOICE"
goto :GWindows_Main
::===============================================
:GWindows_CHOICE
set "lAnswer=" 
set /p lAnswer=WINDOWS (%G_WINDOWS_ID%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_WINDOWS_ID%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "1" ( set "G_STATE=S_RESOLUTION_SHOW" & set "G_WINDOWS_ID=%lAnswer%" 
))))
goto :GWindows_Main
::===============================================
:GWindows_RESOLUTION_SHOW
echo.
for /f "delims=" %%# in  ('"wmic path Win32_VideoController  get CurrentHorizontalResolution,CurrentVerticalResolution /format:value"') do ( set "%%#">nul )
echo %CurrentHorizontalResolution%
echo %CurrentVerticalResolution%
set "G_STATE=S_SAVE"
goto :GWindows_Main
::===============================================
:GWindows_SAVE
call gz_process_in sqlite_config_save "G_WINDOWS_ID" "%G_WINDOWS_ID%"
set "G_STATE=S_QUIT" & cd %GPWD%
goto :GWindows_Main
::===============================================
:GWindows_LOAD
call gz_process_in sqlite_config_load "G_WINDOWS_ID" G_WINDOWS_ID
set "G_STATE=S_METHOD"
goto :GWindows_Main
::===============================================
:GWindows_QUIT
echo.
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
goto :GWindows_Main
::===============================================
