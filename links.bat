@echo off

set ROOT=%~dp0
cd /d %USERPROFILE%

echo CD = %CD%
echo.

call :RELINKS %ROOT%all
call :RELINKS %ROOT%windows
call :RELINKS %ROOT%cache

pause

goto :eof


:RELINKS
    echo %1
    for /f "usebackq tokens=*" %%i in (`dir /b /ad %~1\*`) do call :MKLINK_DIR %~1\%%i %%i
    for /f "usebackq tokens=*" %%i in (`dir /b /a-d %~1\*`) do call :MKLINK_FILE %~1\%%i %%i
exit /b

:MKLINK_DIR
    set SRC=%1
    set DEST=%2
    echo   mklink %DEST% %SRC%
    mklink /j %DEST% %SRC%
exit /b

:MKLINK_FILE
    set SRC=%1
    set DEST=%2
    echo   mklink %DEST% %SRC%
    if exist %DEST% del %DEST%
    mklink %DEST% %SRC%
exit /b
