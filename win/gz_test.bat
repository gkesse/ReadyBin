@echo off
::===============================================
call .config.bat
::===============================================
if "%GTEST_BUILD%" == "" ( echo GTEST_BUILD ? & goto :eof ) 
if not exist %GTEST_BUILD% ( echo GTEST_BUILD ? & goto :eof )
::===============================================
set "GPWD=%cd%"
::===============================================
goto :GTest_main
::===============================================
:GTest_main
if "%1" == "" ( goto :GTest_help
) else ( goto :GTest_process )
goto :eof
::===============================================
:GTest_help
set "GSCRPIT=%0"
set "GTAB=    "
echo.
echo Description:
echo %GTAB%Operations sur les commandes de test.
echo.
echo Utilisation:
echo %GTAB%%GSCRPIT% : afficher aide
echo %GTAB%%GSCRPIT% tes : tester module
echo %GTAB%%GSCRPIT% bin : utliser binaires
echo.
goto :eof
::===============================================
:GTest_process
if "%1" == "tes" ( goto :GTest_test
) else ( if "%1" == "bin" ( goto :GTest_bin
) else ( goto :GTest_help
))
goto :eof
::===============================================
:GTest_test

goto :eof
::===============================================
:GTest_bin
cd %GTEST_BUILD%
%2 %3 %4 %5 %6 %7 %8
cd %GPWD%
goto :eof
::===============================================
