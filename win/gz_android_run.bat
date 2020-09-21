@echo off
::===============================================
set "GPWD=%cd%"
::===============================================
set "G_STATE=S_INIT"
::===============================================
call :GAndroid_Main
cd %GPWD%
goto :eof
::===============================================
:GAndroid_Main
if "%G_STATE%" == "S_ADMIN" ( goto :GAndroid_ADMIN 
) else ( if "%G_STATE%" == "S_INIT" ( goto :GAndroid_INIT
) else ( if "%G_STATE%" == "S_METHOD" ( goto :GAndroid_METHOD
) else ( if "%G_STATE%" == "S_CHOICE" ( goto :GAndroid_CHOICE
) else ( if "%G_STATE%" == "S_ANDROID_STUDIO_START" ( goto :GAndroid_ANDROID_STUDIO_START
) else ( if "%G_STATE%" == "S_GRADLEW_TASKS_ANDROID_PATH" ( goto :GAndroid_GRADLEW_TASKS_ANDROID_PATH
) else ( if "%G_STATE%" == "S_GRADLEW_TASKS_ANDROID_NAME" ( goto :GAndroid_GRADLEW_TASKS_ANDROID_NAME
) else ( if "%G_STATE%" == "S_GRADLEW_TASKS" ( goto :GAndroid_GRADLEW_TASKS
) else ( if "%G_STATE%" == "S_GRADLEW_COMPILE_ANDROID_PATH" ( goto :GAndroid_GRADLEW_COMPILE_ANDROID_PATH
) else ( if "%G_STATE%" == "S_GRADLEW_COMPILE_ANDROID_NAME" ( goto :GAndroid_GRADLEW_COMPILE_ANDROID_NAME
) else ( if "%G_STATE%" == "S_GRADLEW_COMPILE" ( goto :GAndroid_GRADLEW_COMPILE
) else ( if "%G_STATE%" == "S_EMULATOR_LIST" ( goto :GAndroid_EMULATOR_LIST
) else ( if "%G_STATE%" == "S_EMULATOR_START_AVD_NAME" ( goto :GAndroid_EMULATOR_START_AVD_NAME
) else ( if "%G_STATE%" == "S_EMULATOR_START" ( goto :GAndroid_EMULATOR_START
) else ( if "%G_STATE%" == "S_NOX_INSTALL_ANDROID_PATH" ( goto :GAndroid_NOX_INSTALL_ANDROID_PATH
) else ( if "%G_STATE%" == "S_NOX_INSTALL_ANDROID_NAME" ( goto :GAndroid_NOX_INSTALL_ANDROID_NAME
) else ( if "%G_STATE%" == "S_NOX_INSTALL" ( goto :GAndroid_NOX_INSTALL
) else ( if "%G_STATE%" == "S_NOX_CONNECT_SERVER_IP" ( goto :GAndroid_NOX_CONNECT_SERVER_IP
) else ( if "%G_STATE%" == "S_NOX_CONNECT_SERVER_PORT" ( goto :GAndroid_NOX_CONNECT_SERVER_PORT
) else ( if "%G_STATE%" == "S_NOX_CONNECT" ( goto :GAndroid_NOX_CONNECT
) else ( if "%G_STATE%" == "S_NOX_STOP" ( goto :GAndroid_NOX_STOP
) else ( if "%G_STATE%" == "S_NOX_START" ( goto :GAndroid_NOX_START
) else ( if "%G_STATE%" == "S_ADB_INSTALL_ANDROID_PATH" ( goto :GAndroid_ADB_INSTALL_ANDROID_PATH
) else ( if "%G_STATE%" == "S_ADB_INSTALL_ANDROID_NAME" ( goto :GAndroid_ADB_INSTALL_ANDROID_NAME
) else ( if "%G_STATE%" == "S_ADB_INSTALL" ( goto :GAndroid_ADB_INSTALL
) else ( if "%G_STATE%" == "S_SAVE" ( goto :GAndroid_SAVE
) else ( if "%G_STATE%" == "S_LOAD" ( goto :GAndroid_LOAD
) else ( if "%G_STATE%" == "S_QUIT" ( goto :GAndroid_QUIT
) else ( goto :eof
))))))))))))))))))))))))))))
goto :GAndroid_Main
::===============================================
:GAndroid_ADMIN
call gz_admin
set "G_STATE=S_END"
goto :GAndroid_Main
::===============================================
:GAndroid_INIT
printf "\n"
printf "ANDROID !!!\n"
printf "\t%%-2s : %%s\n" "-q" "quitter l'application"
printf "\t%%-2s : %%s\n" "-i" "reinitialiser l'application"
printf "\t%%-2s : %%s\n" "-a" "redemarrer l'application"
printf "\t%%-2s : %%s\n" "-v" "valider les configurations"
printf "\n"
set "G_STATE=S_LOAD"
goto :GAndroid_Main
::===============================================
:GAndroid_METHOD
printf "ANDROID :\n"
printf "\t%%-2s : %%s\n" "1" "lancer ANDROID_STUDIO"
printf "\n"
printf "\t%%-2s : %%s\n" "10" "lister les taches GRADLEW"
printf "\t%%-2s : %%s\n" "11" "compile le projet GRADLEW"
printf "\n"
printf "\t%%-2s : %%s\n" "20" "lister les avd EMULATOR"
printf "\t%%-2s : %%s\n" "21" "demarrer un avd EMULATOR"
printf "\n"
printf "\t%%-2s : %%s\n" "30" "installer le projet NOX"
printf "\t%%-2s : %%s\n" "31" "demarrer la connexion NOX"
printf "\t%%-2s : %%s\n" "32" "arreter la connexion NOX"
printf "\t%%-2s : %%s\n" "33" "demarrer NOX"
printf "\n"
printf "\t%%-2s : %%s\n" "40" "installer le projet ADB"
printf "\n"
set "G_STATE=S_CHOICE"
goto :GAndroid_Main
::===============================================
:GAndroid_CHOICE
set "lAnswer=" 
set /p lAnswer=ANDROID (%G_ANDROID_ID%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_ANDROID_ID%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "1" ( set "G_STATE=S_ANDROID_STUDIO_START" & set "G_ANDROID_ID=%lAnswer%" 
) else ( if "%lAnswer%" == "10" ( set "G_STATE=S_GRADLEW_TASKS_ANDROID_PATH" & set "G_ANDROID_ID=%lAnswer%" 
) else ( if "%lAnswer%" == "11" ( set "G_STATE=S_GRADLEW_COMPILE_ANDROID_PATH" & set "G_ANDROID_ID=%lAnswer%" 
) else ( if "%lAnswer%" == "20" ( set "G_STATE=S_EMULATOR_LIST" & set "G_ANDROID_ID=%lAnswer%" 
) else ( if "%lAnswer%" == "21" ( set "G_STATE=S_EMULATOR_START_AVD_NAME" & set "G_ANDROID_ID=%lAnswer%" 
) else ( if "%lAnswer%" == "30" ( set "G_STATE=S_NOX_INSTALL_ANDROID_PATH" & set "G_ANDROID_ID=%lAnswer%" 
) else ( if "%lAnswer%" == "31" ( set "G_STATE=S_NOX_CONNECT_SERVER_IP" & set "G_NOX_ID=%lAnswer%" 
) else ( if "%lAnswer%" == "32" ( set "G_STATE=S_NOX_STOP" & set "G_NOX_ID=%lAnswer%" 
) else ( if "%lAnswer%" == "33" ( set "G_STATE=S_NOX_START" & set "G_NOX_ID=%lAnswer%" 
) else ( if "%lAnswer%" == "40" ( set "G_STATE=S_ADB_INSTALL_ANDROID_PATH" & set "G_ANDROID_ID=%lAnswer%" 
)))))))))))))
goto :GAndroid_Main
::===============================================
:GAndroid_ANDROID_START
echo.
echo lancement du programme Android Studio...
call studio64
set "G_STATE=S_SAVE"
goto :GAndroid_Main
::===============================================
:GAndroid_GRADLEW_TASKS_ANDROID_PATH
set "lAnswer=" 
set /p lAnswer=G_ANDROID_PATH (%G_ANDROID_PATH%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_ANDROID_PATH%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_GRADLEW_TASKS"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_GRADLEW_TASKS_ANDROID_NAME" & set "G_ANDROID_PATH=%lAnswer%" 
)))))
goto :GAndroid_Main
::===============================================
:GAndroid_GRADLEW_TASKS_ANDROID_NAME
set "lAnswer=" 
set /p lAnswer=G_ANDROID_NAME (%G_ANDROID_NAME%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_ANDROID_NAME%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_GRADLEW_TASKS"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_GRADLEW_TASKS" & set "G_ANDROID_NAME=%lAnswer%" 
)))))
goto :GAndroid_Main
::===============================================
:GAndroid_GRADLEW_TASKS
echo.
set "lPath=%G_ANDROID_PATH%\%G_ANDROID_NAME%\code"
cd %lPath%
call gradlew tasks
set "G_STATE=S_SAVE"
goto :GAndroid_Main
::===============================================
:GAndroid_GRADLEW_COMPILE_ANDROID_PATH
set "lAnswer=" 
set /p lAnswer=G_ANDROID_PATH (%G_ANDROID_PATH%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_ANDROID_PATH%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_GRADLEW_COMPILE"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_GRADLEW_COMPILE_ANDROID_NAME" & set "G_ANDROID_PATH=%lAnswer%" 
)))))
goto :GAndroid_Main
::===============================================
:GAndroid_GRADLEW_COMPILE_ANDROID_NAME
set "lAnswer=" 
set /p lAnswer=G_ANDROID_NAME (%G_ANDROID_NAME%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_ANDROID_NAME%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_GRADLEW_COMPILE"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_GRADLEW_COMPILE" & set "G_ANDROID_NAME=%lAnswer%" 
)))))
goto :GAndroid_Main
::===============================================
:GAndroid_GRADLEW_COMPILE
echo.
set "lPath=%G_ANDROID_PATH%\%G_ANDROID_NAME%\code"
cd %lPath%
call gradlew installDebug
set "G_STATE=S_SAVE"
goto :GAndroid_Main
::===============================================
:GAndroid_EMULATOR_LIST
echo.
emulator -list-avds
set "G_STATE=S_SAVE"
goto :GAndroid_Main
::===============================================
:GAndroid_EMULATOR_START_AVD_NAME
set "lAnswer=" 
set /p lAnswer=G_AVD_NAME (%G_AVD_NAME%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_AVD_NAME%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_EMULATOR_START"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_EMULATOR_START" & set "G_AVD_NAME=%lAnswer%" 
)))))
goto :GAndroid_Main
::===============================================
:GAndroid_EMULATOR_START
echo.
emulator -avd %G_AVD_NAME%
set "G_STATE=S_SAVE"
goto :GAndroid_Main
::===============================================
:GAndroid_NOX_INSTALL_ANDROID_PATH
set "lAnswer=" 
set /p lAnswer=G_ANDROID_PATH (%G_ANDROID_PATH%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_ANDROID_PATH%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_NOX_INSTALL"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_NOX_INSTALL_ANDROID_NAME" & set "G_ANDROID_PATH=%lAnswer%" 
)))))
goto :GAndroid_Main
::===============================================
:GAndroid_NOX_INSTALL_ANDROID_NAME
set "lAnswer=" 
set /p lAnswer=G_ANDROID_NAME (%G_ANDROID_NAME%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_ANDROID_NAME%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_NOX_INSTALL"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_NOX_INSTALL" & set "G_ANDROID_NAME=%lAnswer%" 
)))))
goto :GAndroid_Main
::===============================================
:GAndroid_NOX_INSTALL
echo.
set "lPath=%G_ANDROID_PATH%\%G_ANDROID_NAME%\code"
set "lApk=%lPath%\app\build\outputs\apk\debug\app-debug.apk"
Nox "-apk:%lApk%"
set "G_STATE=S_SAVE"
goto :GAndroid_Main
::===============================================
:GAndroid_NOX_START
echo.
echo lancement du programme Nox...
Nox
goto :GAndroid_Main
::===============================================
:GAndroid_NOX_CONNECT_SERVER_IP
set "lAnswer=" 
set /p lAnswer=G_SERVER_IP (%G_SERVER_IP%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_SERVER_IP%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_NOX_CONNECT"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_NOX_CONNECT_SERVER_PORT" & set "G_SERVER_IP=%lAnswer%" 
)))))
goto :GAndroid_Main
::===============================================
:GAndroid_NOX_CONNECT_SERVER_PORT
set "lAnswer=" 
set /p lAnswer=G_SERVER_PORT (%G_SERVER_PORT%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_SERVER_PORT%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_NOX_CONNECT"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_NOX_CONNECT" & set "G_SERVER_PORT=%lAnswer%" 
)))))
goto :GAndroid_Main
::===============================================
:GAndroid_NOX_CONNECT
echo.
nox_adb connect %G_SERVER_IP%:%G_SERVER_PORT%
set "G_STATE=S_SAVE"
goto :GAndroid_Main
::===============================================
:GAndroid_NOX_STOP
echo.
nox_adb kill-server
set "G_STATE=S_SAVE"
goto :GAndroid_Main
::===============================================
:GAndroid_ADB_INSTALL_ANDROID_PATH
set "lAnswer=" 
set /p lAnswer=G_ANDROID_PATH (%G_ANDROID_PATH%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_ANDROID_PATH%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_ADB_INSTALL"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_ADB_INSTALL_ANDROID_NAME" & set "G_ANDROID_PATH=%lAnswer%" 
)))))
goto :GAndroid_Main
::===============================================
:GAndroid_ADB_INSTALL_ANDROID_NAME
set "lAnswer=" 
set /p lAnswer=G_ANDROID_NAME (%G_ANDROID_NAME%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_ANDROID_NAME%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "-v" ( set "G_STATE=S_ADB_INSTALL"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_ADB_INSTALL" & set "G_ANDROID_NAME=%lAnswer%" 
)))))
goto :GAndroid_Main
::===============================================
:GAndroid_ADB_INSTALL
echo.
set "lPath=%G_ANDROID_PATH%\%G_ANDROID_NAME%\code"
set "lApk=%lPath%\app\build\outputs\apk\debug\app-debug.apk"
adb install %lApk%
set "G_STATE=S_SAVE"
goto :GAndroid_Main
::===============================================
:GAndroid_SAVE
call gz_process_in sqlite_config_save "G_ANDROID_ID" "%G_ANDROID_ID%"
call gz_process_in sqlite_config_save "G_ANDROID_PATH" "%G_ANDROID_PATH%"
call gz_process_in sqlite_config_save "G_ANDROID_NAME" "%G_ANDROID_NAME%"
call gz_process_in sqlite_config_save "G_AVD_NAME" "%G_AVD_NAME%"
set "G_STATE=S_QUIT" & cd %GPWD%
goto :GAndroid_Main
::===============================================
:GAndroid_LOAD
call gz_process_in sqlite_config_load "G_ANDROID_ID" G_ANDROID_ID
call gz_process_in sqlite_config_load "G_ANDROID_PATH" G_ANDROID_PATH
call gz_process_in sqlite_config_load "G_ANDROID_NAME" G_ANDROID_NAME
call gz_process_in sqlite_config_load "G_AVD_NAME" G_AVD_NAME
set "G_STATE=S_METHOD"
goto :GAndroid_Main
::===============================================
:GAndroid_QUIT
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
goto :GAndroid_Main
::===============================================
