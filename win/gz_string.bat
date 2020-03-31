@echo off
::===============================================
set "GSCRIPT=%0"
set "GPROCESS=%1"
set "GPWD=%cd%"
set "GTAB=    "
::===============================================
set GREADY_DEV=C:\Users\Admin\Downloads\Programs\ReadyDev
set GREADY_BIN=C:\Users\Admin\Downloads\Programs\ReadyBin
::===============================================
call :GProcess_main %2 %3 %4 %5 %6 %7 %8 %9
cd %GPWD%
goto :eof
::===============================================
:GProcess_main
if "%GPROCESS%" == "" ( goto :GProcess_help %*
) else ( if "%GPROCESS%" == "test" ( goto :GProcess_test %*
) else ( if "%GPROCESS%" == "to_upper" ( goto :GString_to_upper %*
) else ( if "%GPROCESS%" == "to_lower" ( goto :GString_to_lower %*
) else ( if "%GPROCESS%" == "size" ( goto :GString_size %*
) else ( goto :GProcess_help %* )))))
goto :eof
::===============================================
:GProcess_help
echo.
echo Description:
echo %GTAB%Operations sur les chaines de caracteres 
echo.
echo Utilisation:
echo %GTAB%%GSCRIPT% : afficher l'aide
echo %GTAB%%GSCRIPT% to_upper ^<in^> ^<out^> : convertir en majuscule
echo %GTAB%%GSCRIPT% to_lower ^<in^> ^<out^> : convertir en minuscule
echo %GTAB%%GSCRIPT% size ^<in^> ^<out^> : lire la taille
echo.
goto :eof
::===============================================
:GProcess_test
echo.
echo ____PROGRAMME_DE_TEST____
echo.

goto :eof
::===============================================
:GString_to_upper
setlocal enabledelayedexpansion
set "lString=%~1"
for %%A in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
set "lString=!lString:%%A=%%A!"
)
endlocal & (
if "%2" == "" ( echo %lString%
) else ( set "%~2=%lString%" ))
)
goto :eof
::===============================================
:GString_to_lower
setlocal enabledelayedexpansion
set "lString=%~1"
for %%A in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do (
set "lString=!lString:%%A=%%A!"
) 
endlocal & (
if "%2" == "" ( echo %lString%
) else ( set "%~2=%lString%" ))
goto :eof
::===============================================
:GString_size
setlocal enabledelayedexpansion
set "lString=#%~1"
set "lLength=0"
for %%A in (4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (
if "!lString:~%%A,1!" neq "" (
set /a "lLength+=%%A"
set "lString=!lString:~%%A!"
)) 
endlocal & (
if "%2" == "" ( echo %lLength%
) else ( set "%~2=%lLength%" ))
goto :eof
::===============================================
