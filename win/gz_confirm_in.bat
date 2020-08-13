@echo off
::===============================================
set "GPWD=%cd%"
::===============================================
set /p lAnswer=Confirmation (Oui/[N]on) ? : 
set "lAnswerIn=%lAnswer:~0,1%"
if "%lAnswerIn%" == "o" ( echo oooooooooooooook 
) else ( if "%lAnswerIn%" == "O" ( echo oooooooooooooook
) else (  echo nnnnnnnnnnnnnn
))
::===============================================
cd %GPWD%
::===============================================
