@ECHO OFF & SetLocal

cd "%~dp0xampplite"
echo.
echo  # Stopping Clansuite...
echo  ------------------------
xampp_stop.exe >nul 2>&1

if "%ERRORLEVEL%"=="0" echo  Success...
if "%ERRORLEVEL%"=="1" echo  Seams to be already down...

echo.
echo  ----------------------------------------------------------
echo  #   Thanks for using "Clansuite - just an eSports CMS"   #
echo  #                                                        #
echo  #   Website: http://www.clansuite.com                    #
echo  #   Forum:   http://forum.clansuite.com                  #
echo  #   Bugs:    http://trac.clansutie.com                   #
echo  ----------------------------------------------------------
echo.
set /P=" Press any key to continue..."

EndLocal