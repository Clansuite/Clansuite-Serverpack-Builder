@ECHO OFF
SetLocal

if exist "%~dp0xampplite\php\php.exe" GOTO Normal
if not exist "%~dp0xampplite\php\php.exe" GOTO Abort

:Abort
echo Cannot find php.exe in %~dp0xampplite\php\php.exe
echo Must abort this process!
GOTO ERROR

:Normal
cd "%~dp0xampplite"
echo.
echo  # Starting Clansuite...
echo  ------------------------
echo  Loading...
xampp_stop.exe >nul 2>&1
xampp_start.exe >nul 2>&1

if "%ERRORLEVEL%"=="1" GOTO ERROR

START http://localhost/clansuite/

GOTO END

:ERROR
echo.
echo  -----------------------------------------------------------------
echo  # Error: Something went wrong - please contact our forums
echo  # http://forum.clansuite.com
echo  #
echo  # What to do now?
echo  # ------------------
echo  # [1] Run a port check (default)
echo  # [2] Goto forum
echo  # [3] Exit
echo  -----------------------------------------------------------------
set /P input=" Enter number: "

if not defined input %~dp0xampplite\xampp-portcheck.exe
if "%input%"=="1" %~dp0xampplite\xampp-portcheck.exe
if "%input%"=="2" START http://forum.clansuite.com
if "%input%"=="3" GOTO END

:END
cd "%~dp0"

EndLocal