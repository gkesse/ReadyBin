@echo off
::===============================================
set "GPWD=%cd%"
::===============================================
set "G_STATE=S_INIT"
::===============================================
call :GGit_Main
cd %GPWD%
goto :eof
::===============================================
:GGit_Main
if "%G_STATE%" == "S_ADMIN" ( goto :GGit_ADMIN 
) else ( if "%G_STATE%" == "S_INIT" ( goto :GGit_INIT
) else ( if "%G_STATE%" == "S_METHOD" ( goto :GGit_METHOD
) else ( if "%G_STATE%" == "S_CHOICE" ( goto :GGit_CHOICE
) else ( if "%G_STATE%" == "S_CONFIG_LIST" ( goto :GGit_CONFIG_LIST
) else ( if "%G_STATE%" == "S_CONFIG_EDIT_USER_NAME" ( goto :GGit_CONFIG_EDIT_USER_NAME
) else ( if "%G_STATE%" == "S_CONFIG_EDIT_USER_EMAIL" ( goto :GGit_CONFIG_EDIT_USER_EMAIL
) else ( if "%G_STATE%" == "S_CONFIG_EDIT_CORE_EDITOR" ( goto :GGit_CONFIG_EDIT_CORE_EDITOR
) else ( if "%G_STATE%" == "S_CONFIG_EDIT" ( goto :GGit_CONFIG_EDIT
) else ( if "%G_STATE%" == "S_READY_CLONE_READY_PATH" ( goto :GGit_READY_CLONE_READY_PATH
) else ( if "%G_STATE%" == "S_READY_CLONE_READY_NAME" ( goto :GGit_READY_CLONE_READY_NAME
) else ( if "%G_STATE%" == "S_READY_CLONE_READY_CLONE" ( goto :GGit_READY_CLONE_READY_CLONE
) else ( if "%G_STATE%" == "S_READY_CLONE" ( goto :GGit_READY_CLONE
) else ( if "%G_STATE%" == "S_READY_PUSH_READY_PATH" ( goto :GGit_READY_PUSH_READY_PATH
) else ( if "%G_STATE%" == "S_READY_PUSH_READY_NAME" ( goto :GGit_READY_PUSH_READY_NAME
) else ( if "%G_STATE%" == "S_READY_PUSH_GIT_COMMENT" ( goto :GGit_READY_PUSH_GIT_COMMENT
) else ( if "%G_STATE%" == "S_READY_PUSH" ( goto :GGit_READY_PUSH
) else ( if "%G_STATE%" == "S_READY_PULL_READY_PATH" ( goto :GGit_READY_PULL_READY_PATH
) else ( if "%G_STATE%" == "S_READY_PULL_READY_NAME" ( goto :GGit_READY_PULL_READY_NAME
) else ( if "%G_STATE%" == "S_READY_PULL" ( goto :GGit_READY_PULL
) else ( if "%G_STATE%" == "S_READY_STATUS_READY_PATH" ( goto :GGit_READY_STATUS_READY_PATH
) else ( if "%G_STATE%" == "S_READY_STATUS_READY_NAME" ( goto :GGit_READY_STATUS_READY_NAME
) else ( if "%G_STATE%" == "S_READY_STATUS" ( goto :GGit_READY_STATUS
) else ( if "%G_STATE%" == "S_READY_REMOVE_READY_PATH" ( goto :GGit_READY_REMOVE_READY_PATH
) else ( if "%G_STATE%" == "S_READY_REMOVE_READY_NAME" ( goto :GGit_READY_REMOVE_READY_NAME
) else ( if "%G_STATE%" == "S_READY_REMOVE_READY_FILE" ( goto :GGit_READY_REMOVE_READY_FILE
) else ( if "%G_STATE%" == "S_READY_REMOVE" ( goto :GGit_READY_REMOVE
) else ( if "%G_STATE%" == "S_SAVE" ( goto :GGit_SAVE
) else ( if "%G_STATE%" == "S_LOAD" ( goto :GGit_LOAD
) else ( if "%G_STATE%" == "S_QUIT" ( goto :GGit_QUIT
) else ( goto :eof
))))))))))))))))))))))))))))))
goto :GGit_Main
::===============================================
:GGit_ADMIN
call gz_admin
set "G_STATE=S_END"
goto :GGit_Main
::===============================================
:GGit_INIT
printf "\n"
printf "GIT !!!\n"
printf "\t%%-2s : %%s\n" "-q" "quitter l'application"
printf "\t%%-2s : %%s\n" "-i" "reinitialiser l'application"
printf "\t%%-2s : %%s\n" "-a" "redemarrer l'application"
printf "\n"
set "G_STATE=S_LOAD"
goto :GGit_Main
::===============================================
:GGit_METHOD
printf "GIT :\n"
printf "\t%%-2s : %%s\n" "1" "lister les configurations"
printf "\t%%-2s : %%s\n" "2" "editer les configurations"
printf "\n"
printf "\t%%-2s : %%s\n" "10" "cloner un depot ReadyDev"
printf "\t%%-2s : %%s\n" "11" "pousser un depot ReadyDev"
printf "\t%%-2s : %%s\n" "12" "tirer un depot ReadyDev"
printf "\t%%-2s : %%s\n" "13" "afficher le status d'un depot ReadyDev"
printf "\t%%-2s : %%s\n" "14" "supprimer des fichiers ReadyDev"
printf "\n"
set "G_STATE=S_CHOICE"
goto :GGit_Main
::===============================================
:GGit_CHOICE
set "lAnswer=" 
set /p lAnswer=GIT (%G_GIT_ID%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_GIT_ID%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "1" ( set "G_STATE=S_CONFIG_LIST" & set "G_GIT_ID=%lAnswer%" 
) else ( if "%lAnswer%" == "2" ( set "G_STATE=S_CONFIG_EDIT_USER_NAME" & set "G_GIT_ID=%lAnswer%" 
) else ( if "%lAnswer%" == "10" ( set "G_STATE=S_READY_CLONE_READY_PATH" & set "G_GIT_ID=%lAnswer%" 
) else ( if "%lAnswer%" == "11" ( set "G_STATE=S_READY_PUSH_READY_PATH" & set "G_GIT_ID=%lAnswer%" 
) else ( if "%lAnswer%" == "12" ( set "G_STATE=S_READY_PULL_READY_PATH" & set "G_GIT_ID=%lAnswer%" 
) else ( if "%lAnswer%" == "13" ( set "G_STATE=S_READY_STATUS_READY_PATH" & set "G_GIT_ID=%lAnswer%" 
) else ( if "%lAnswer%" == "14" ( set "G_STATE=S_READY_REMOVE_READY_PATH" & set "G_GIT_ID=%lAnswer%" 
))))))))))
goto :GGit_Main
::===============================================
:GGit_CONFIG_LIST
echo.
git config --list --global
echo.
set "G_STATE=S_SAVE"
goto :GGit_Main
::===============================================
:GGit_CONFIG_EDIT_USER_NAME
set "lAnswer=" 
set /p lAnswer=G_USER_NAME (%G_USER_NAME%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_USER_NAME%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_CONFIG_EDIT_USER_EMAIL" & set "G_USER_NAME=%lAnswer%" 
))))
goto :GGit_Main
::===============================================
:GGit_CONFIG_EDIT_USER_EMAIL
set "lAnswer=" 
set /p lAnswer=G_USER_EMAIL (%G_USER_EMAIL%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_USER_EMAIL%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_CONFIG_EDIT_CORE_EDITOR" & set "G_USER_EMAIL=%lAnswer%" 
))))
goto :GGit_Main
::===============================================
:GGit_CONFIG_EDIT_CORE_EDITOR
set "lAnswer=" 
set /p lAnswer=G_CORE_EDITOR (%G_CORE_EDITOR%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_CORE_EDITOR%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_CONFIG_EDIT" & set "G_CORE_EDITOR=%lAnswer%" 
))))
goto :GGit_Main
::===============================================
:GGit_CONFIG_EDIT
if "%G_CORE_EDITOR%" == "notepad++" ( set "G_CORE_EDITOR=%G_NOTEPADPP_EXE%" )
git config --global user.name "%G_USER_NAME%"
git config --global user.email "%G_USER_EMAIL%"
git config --global core.editor "%G_CORE_EDITOR%"
echo.
set "G_STATE=S_SAVE"
goto :GGit_Main
::===============================================
:GGit_READY_CLONE_READY_PATH
set "lAnswer=" 
set /p lAnswer=G_READY_PATH (%G_READY_PATH%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_READY_PATH%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_READY_CLONE_READY_NAME" & set "G_READY_PATH=%lAnswer%" 
))))
goto :GGit_Main
::===============================================
:GGit_READY_CLONE_READY_NAME
set "lAnswer=" 
set /p lAnswer=G_READY_NAME (%G_READY_NAME%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_READY_NAME%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_READY_CLONE_READY_CLONE" & set "G_READY_NAME=%lAnswer%" 
))))
goto :GGit_Main
::===============================================
:GGit_READY_CLONE_READY_CLONE
set "G_READY_CLONE=%G_READY_NAME%" 
set "lAnswer=" 
set /p lAnswer=G_READY_CLONE (%G_READY_CLONE%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_READY_CLONE%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_READY_CLONE" & set "G_READY_CLONE=%lAnswer%" 
))))
goto :GGit_Main
::===============================================
:GGit_READY_CLONE
call gz_process_in confirm G_CONFIRM_IN
if "%G_CONFIRM_IN%" == "0" ( set "G_STATE=S_QUIT" && goto :GGit_Main )
echo.
set "lReadyUrl=https://github.com/gkesse/%G_READY_NAME%.git"
cd %G_READY_PATH%
git clone %lReadyUrl% %G_READY_CLONE%
echo.
set "G_STATE=S_SAVE"
goto :GGit_Main
::===============================================
:GGit_READY_PUSH_READY_PATH
set "lAnswer=" 
set /p lAnswer=G_READY_PATH (%G_READY_PATH%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_READY_PATH%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_READY_PUSH_READY_NAME" & set "G_READY_PATH=%lAnswer%" 
))))
goto :GGit_Main
::===============================================
:GGit_READY_PUSH_READY_NAME
set "lAnswer=" 
set /p lAnswer=G_READY_NAME (%G_READY_NAME%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_READY_NAME%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_READY_PUSH_GIT_COMMENT" & set "G_READY_NAME=%lAnswer%" 
))))
goto :GGit_Main
::===============================================
:GGit_READY_PUSH_GIT_COMMENT
set "lAnswer=" 
set /p lAnswer=G_GIT_COMMENT (%G_GIT_COMMENT%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_GIT_COMMENT%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_READY_PUSH" & set "G_GIT_COMMENT=%lAnswer%" 
))))
goto :GGit_Main
::===============================================
:GGit_READY_PUSH
echo.
set "lReadyPath=%G_READY_PATH%\%G_READY_NAME%"
cd %lReadyPath%
git add --all
git commit -m "%G_GIT_COMMENT%"
git push -u origin master
echo.
set "G_STATE=S_SAVE"
goto :GGit_Main
::===============================================
:GGit_READY_PULL_READY_PATH
set "lAnswer=" 
set /p lAnswer=G_READY_PATH (%G_READY_PATH%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_READY_PATH%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_READY_PULL_READY_NAME" & set "G_READY_PATH=%lAnswer%" 
))))
goto :GGit_Main
::===============================================
:GGit_READY_PULL_READY_NAME
set "lAnswer=" 
set /p lAnswer=G_READY_NAME (%G_READY_NAME%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_READY_NAME%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_READY_PULL" & set "G_READY_NAME=%lAnswer%" 
))))
goto :GGit_Main
::===============================================
:GGit_READY_PULL
echo.
set "lReadyPath=%G_READY_PATH%\%G_READY_NAME%"
cd %lReadyPath%
git pull
echo.
set "G_STATE=S_SAVE"
goto :GGit_Main
::===============================================
:GGit_READY_STATUS_READY_PATH
set "lAnswer=" 
set /p lAnswer=G_READY_PATH (%G_READY_PATH%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_READY_PATH%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_READY_STATUS_READY_NAME" & set "G_READY_PATH=%lAnswer%" 
))))
goto :GGit_Main
::===============================================
:GGit_READY_STATUS_READY_NAME
set "lAnswer=" 
set /p lAnswer=G_READY_NAME (%G_READY_NAME%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_READY_NAME%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_READY_STATUS" & set "G_READY_NAME=%lAnswer%" 
))))
goto :GGit_Main
::===============================================
:GGit_READY_STATUS
echo.
set "lReadyPath=%G_READY_PATH%\%G_READY_NAME%"
cd %lReadyPath%
git status
echo.
set "G_STATE=S_SAVE"
goto :GGit_Main
::===============================================
:GGit_READY_REMOVE_READY_PATH
set "lAnswer=" 
set /p lAnswer=G_READY_PATH (%G_READY_PATH%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_READY_PATH%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_READY_REMOVE_READY_NAME" & set "G_READY_PATH=%lAnswer%" 
))))
goto :GGit_Main
::===============================================
:GGit_READY_REMOVE_READY_NAME
set "lAnswer=" 
set /p lAnswer=G_READY_NAME (%G_READY_NAME%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_READY_NAME%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_READY_REMOVE_READY_FILE" & set "G_READY_NAME=%lAnswer%" 
))))
goto :GGit_Main
::===============================================
:GGit_READY_REMOVE_READY_FILE
set "lAnswer=" 
set /p lAnswer=G_READY_FILE (%G_READY_FILE%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_READY_FILE%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if not "%lAnswer%" == "" ( set "G_STATE=S_READY_REMOVE" & set "G_READY_FILE=%lAnswer%" 
))))
goto :GGit_Main
::===============================================
:GGit_READY_REMOVE
echo.
set "lReadyPath=%G_READY_PATH%\%G_READY_NAME%"
cd %lReadyPath%
git rm -r --cached %G_READY_FILE%
echo.
set "G_STATE=S_SAVE"
goto :GGit_Main
::===============================================
:GGit_SAVE
call gz_process_in sqlite_config_save "G_GIT_ID" "%G_GIT_ID%"
call gz_process_in sqlite_config_save "G_READY_PATH" "%G_READY_PATH%"
call gz_process_in sqlite_config_save "G_READY_NAME" "%G_READY_NAME%"
call gz_process_in sqlite_config_save "G_USER_NAME" "%G_USER_NAME%"
call gz_process_in sqlite_config_save "G_USER_EMAIL" "%G_USER_EMAIL%"
call gz_process_in sqlite_config_save "G_CORE_EDITOR" "%G_CORE_EDITOR%"
call gz_process_in sqlite_config_save "G_GIT_COMMENT" "%G_GIT_COMMENT%"
call gz_process_in sqlite_config_save "G_READY_FILE" "%G_READY_FILE%"
set "G_STATE=S_QUIT" & cd %GPWD%
goto :GGit_Main
::===============================================
:GGit_LOAD
call gz_process_in sqlite_config_load "G_GIT_ID" G_GIT_ID
call gz_process_in sqlite_config_load "G_READY_PATH" G_READY_PATH
call gz_process_in sqlite_config_load "G_READY_NAME" G_READY_NAME
call gz_process_in sqlite_config_load "G_USER_NAME" G_USER_NAME
call gz_process_in sqlite_config_load "G_USER_EMAIL" G_USER_EMAIL
call gz_process_in sqlite_config_load "G_CORE_EDITOR" G_CORE_EDITOR
call gz_process_in sqlite_config_load "G_GIT_COMMENT" G_GIT_COMMENT
call gz_process_in sqlite_config_load "G_READY_FILE" G_READY_FILE
set "G_STATE=S_METHOD"
goto :GGit_Main
::===============================================
:GGit_QUIT
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
goto :GGit_Main
::===============================================
