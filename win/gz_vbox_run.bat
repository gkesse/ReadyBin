@echo off
::===============================================
set "GPWD=%cd%"
::===============================================
set "G_STATE=S_INIT"
::===============================================
call :GVbox_Main
cd %GPWD%
goto :eof
::===============================================
:GVbox_Main
if "%G_STATE%" == "S_ADMIN" ( goto :GVbox_ADMIN 
) else ( if "%G_STATE%" == "S_INIT" ( goto :GVbox_INIT
) else ( if "%G_STATE%" == "S_METHOD" ( goto :GVbox_METHOD
) else ( if "%G_STATE%" == "S_CHOICE" ( goto :GVbox_CHOICE
) else ( if "%G_STATE%" == "S_RESOLUTION_SET" ( goto :GVbox_RESOLUTION_SET 
) else ( if "%G_STATE%" == "S_CATALINA_CONFIG" ( goto :GVbox_CATALINA_CONFIG 
) else ( if "%G_STATE%" == "S_SAVE" ( goto :GVbox_SAVE
) else ( if "%G_STATE%" == "S_LOAD" ( goto :GVbox_LOAD
) else ( if "%G_STATE%" == "S_QUIT" ( goto :GVbox_QUIT
) else ( goto :eof
)))))))))
goto :GVbox_Main
::===============================================
:GVbox_ADMIN
call gz_admin
set "G_STATE=S_END"
goto :GVbox_Main
::===============================================
:GVbox_INIT
printf "\n"
printf "VBOX !!!\n"
printf "\t%%-2s : %%s\n" "-q" "quitter l'application"
printf "\t%%-2s : %%s\n" "-i" "reinitialiser l'application"
printf "\t%%-2s : %%s\n" "-a" "redemarrer l'application"
printf "\t%%-2s : %%s\n" "-v" "valider les configurations"
printf "\n"
set "G_STATE=S_LOAD"
goto :GVbox_Main
::===============================================
:GVbox_METHOD
printf "VBOX :\n"
printf "\t%%-2s : %%s\n" "1" "configurer la resolution"
printf "\t%%-2s : %%s\n" "2" "configurer catalina"
printf "\n"
set "G_STATE=S_CHOICE"
goto :GVbox_Main
::===============================================
:GVbox_CHOICE
set "lAnswer=" 
set /p lAnswer=VBOX (%G_VBOX_ID%) ? : 
if "%lAnswer%" == "" ( set "lAnswer=%G_VBOX_ID%" )
if "%lAnswer%" == "-q" ( set "G_STATE=S_END"
) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT" 
) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
) else ( if "%lAnswer%" == "1" ( set "G_STATE=S_RESOLUTION_SET" & set "G_VBOX_ID=%lAnswer%" 
) else ( if "%lAnswer%" == "2" ( set "G_STATE=S_CATALINA_CONFIG" & set "G_VBOX_ID=%lAnswer%" 
)))))
goto :GVbox_Main
::===============================================
:GVbox_RESOLUTION_SET
echo.
VBoxManage setextradata "ArchLinux" "CustomVideoMode1" "1360x768x24"
set "G_STATE=S_SAVE"
goto :GVbox_Main
::===============================================
:GVbox_CATALINA_CONFIG
echo.
VBoxManage.exe modifyvm "%GVBOX_MACHINE%" --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff
VBoxManage setextradata "%GVBOX_MACHINE%" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac11,3"
VBoxManage setextradata "%GVBOX_MACHINE%" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
VBoxManage setextradata "%GVBOX_MACHINE%" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple"
VBoxManage setextradata "%GVBOX_MACHINE%" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
VBoxManage setextradata "%GVBOX_MACHINE%" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
set "G_STATE=S_SAVE"
goto :GVbox_Main
::===============================================
:GVbox_SAVE
call gz_process_in sqlite_config_save "G_VBOX_ID" "%G_VBOX_ID%"
set "G_STATE=S_QUIT" & cd %GPWD%
goto :GVbox_Main
::===============================================
:GVbox_LOAD
call gz_process_in sqlite_config_load "G_VBOX_ID" G_VBOX_ID
set "G_STATE=S_METHOD"
goto :GVbox_Main
::===============================================
:GVbox_QUIT
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
goto :GVbox_Main
::===============================================
