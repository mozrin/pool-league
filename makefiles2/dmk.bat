@echo off
echo Dynamic Makefile v1 (Batch wrapper)
echo.

REM Check if a Makefile exists in the current directory
if not exist Makefile (
    echo Error: Makefile not found in the current directory.
    exit /b 1
)

REM Check if at least one argument is provided
if "%1"=="" (
    echo Usage: dmk ^<target^> [arguments...]
    exit /b 1
)

REM Extract the target
set target=%1
shift

REM Join the remaining arguments
set args=
:loop
if "%1"=="" goto execute
set args=%args% %1
shift
goto loop

:execute
REM Pass the rest of the arguments as args to make
make -f Makefile %target% args="%args%"
