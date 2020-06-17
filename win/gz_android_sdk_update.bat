@echo off
::===============================================
call .config.bat
::===============================================
if "%GJAVA_PATH%" == "" ( echo GJAVA_PATH ? & goto :eof ) 
if not exist "%GJAVA_PATH%" ( echo GJAVA_PATH ? & goto :eof )
if "%GANDROID_STUDIO_PATH%" == "" ( echo GANDROID_STUDIO_PATH ? & goto :eof ) 
if not exist "%GANDROID_STUDIO_PATH%" ( echo GANDROID_STUDIO_PATH ? & goto :eof )
if "%GANDROID_SDK_PATH%" == "" ( echo GANDROID_SDK_PATH ? & goto :eof ) 
if not exist "%GANDROID_SDK_PATH%" ( echo GANDROID_SDK_PATH ? & goto :eof )
::===============================================
set "GPWD=%cd%"
::===============================================
set "PATH=%GJAVA_PATH%;%PATH%"
set "PATH=%GANDROID_STUDIO_PATH%\jre\bin;%PATH%"
set "PATH=%GANDROID_SDK_PATH%;%PATH%"
set "PATH=%GANDROID_SDK_PATH%\tools;%PATH%"
set "PATH=%GANDROID_SDK_PATH%\tools\bin;%PATH%"
::===============================================
sdkmanager --update
::===============================================
cd %GPWD%
::===============================================
