@echo off
::===============================================
set PATH=C:\Program Files\Oracle\VirtualBox.%PATH%
::===============================================
set "GVBOX_MACHINE=iMacOsX"
::===============================================
set "GTAB=    "
::===============================================
:: Configurations
echo.
echo Configurations :
echo %GTAB%GVBOX_MACHINE    : %GVBOX_MACHINE%
echo %GTAB%UUUUUUU          : PPPPPPPPPP
echo.
::===============================================
set /p lAnswer= "Confirmation de continuer(Oui|[N]on) ? : " 
echo %lAnswer%
set "lAnswerKey=%lAnswer:~0,1%"
set "lAnswerIn=%lAnswer:~0,1%"
echo %lChar%
goto :eof
::===============================================
VBoxManage.exe modifyvm "%GVBOX_MACHINE%" --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff
VBoxManage setextradata "%GVBOX_MACHINE%" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac11,3"
VBoxManage setextradata "%GVBOX_MACHINE%" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
VBoxManage setextradata "%GVBOX_MACHINE%" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple"
VBoxManage setextradata "%GVBOX_MACHINE%" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
VBoxManage setextradata "%GVBOX_MACHINE%" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
::===============================================
