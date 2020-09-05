@echo off
::===============================================
set "GPWD=%cd%"
::===============================================
if "%GPATH%" == "" ( echo ERREUR : GPATH ? & goto :eof ) & if not exist %GPATH% ( echo ERREUR : GPATH ? & goto :eof )
::===============================================
call %GPATH%/.config.bat
::===============================================
if "%GVBOX_MACHINE%" == "" ( echo ERREUR : GVBOX_MACHINE ? & goto :eof )
::===============================================
set "lTmpFile_01=%GPATH%\tmp\tmp_file_01.txt"
::===============================================
:: Configurations
printf "\n"
printf "Configurations :\n"
printf "\t%%-20s : %%s\n" "GVBOX_MACHINE" "%GVBOX_MACHINE%"
printf "\n"
::===============================================
set /p "lAnswer=Confirmation de continuer (Oui|[N]on) ? : " || set "lAnswer=n"
set "lAnswerKey=%lAnswer:~0,1%"
echo %lAnswerKey%| tr '[:upper:]' '[:lower:]'>%lTmpFile_01%
set /p lAnswerIn=<%lTmpFile_01%
if not "%lAnswerIn%" == "o" ( echo NON : operation annulee & goto :eof ) 
echo OUI : operation effectuee
::===============================================
echo.
VBoxManage.exe modifyvm "%GVBOX_MACHINE%" --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff
VBoxManage setextradata "%GVBOX_MACHINE%" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac11,3"
VBoxManage setextradata "%GVBOX_MACHINE%" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
VBoxManage setextradata "%GVBOX_MACHINE%" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple"
VBoxManage setextradata "%GVBOX_MACHINE%" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
VBoxManage setextradata "%GVBOX_MACHINE%" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
::===============================================
