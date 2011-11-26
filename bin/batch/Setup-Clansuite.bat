@ECHO OFF
SetLocal

if exist "%~dp0xampplite\php\php.exe" GOTO Normal
if not exist "%~dp0xampplite\php\php.exe" GOTO Abort

:Abort
echo Cannot find php.exe in %~dp0xampplite\php\php.exe
echo Must abort this process!
GOTO ERROR

:Normal

echo.
echo  -----------------------------------------------------------------
echo  #
echo  # Clansuite Serverpack Setup
echo  #
echo  -----------------------------------------------------------------
echo.
echo    Loading....

cd "%~dp0xampplite"
call setup_xampp.bat auto

cls

echo.
echo  # Starting webserver
echo  ----------------------
xampp_stop.exe >nul 2>&1
echo  Loading xampplite...
xampp_start.exe >nul 2>&1


if "%ERRORLEVEL%"=="0" echo  Success...
if "%ERRORLEVEL%"=="1" GOTO ERROR

echo.
echo  # Set Database Password:
echo  ------------------------

:MySQLRetry
if "%counter%"=="6" GOTO ERROR
if defined counter echo  Try %counter%...
ping localhost -n 1 >nul 2>&1
mysql\bin\mysqladmin.exe -u root password "toop" >nul 2>&1 
echo select 1; exit; | mysql\bin\mysqltest.exe -uroot -ptoop -s >nul 2>&1
if "%ERRORLEVEL%"=="0" echo  Success...
if "%ERRORLEVEL%"=="1" set /a counter=counter+1 & GOTO MySQLRetry

echo.
echo  # Insert SQL commands:
echo  ----------------------
SET CLANSUITE=%~dp0xampplite\htdocs\clansuite
SET XAMPP=%~dp0xampplite
cd "%CLANSUITE%\installation\sql\"
call insert.bat

cd "%~dp0"

echo.
echo  -----------------------------------------------------------------
echo  # Setup complete!
echo  -----------------------------------------------------------------
echo.
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
EndLocal