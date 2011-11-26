@echo off

SetLocal

SET ServerpackVersion=0.2
SET XAMPPLiteVersion=1.7.3
SET ClansuiteTarball=http://svn.gna.org/daily/clansuite-snapshot.tar.gz

REM Usage:
REM -------------------
REM Just call "build.bat"

cls
echo.
echo  ---------------------------------------------------------------------------
echo  #
echo  #  [ Clansuite Serverpack for Windows ]
echo  #
echo  #  This is the Windows Batch Script for the Clansuite Serverpack for Windows.
echo  #
echo  #   @author Florian Wolf
echo  #   @license GNU/GPL Version 2 and any later version
echo  #
echo  ---------------------------------------------------------------------------
echo.

IF "%1"=="-compile" GOTO compile

echo.
echo  ---------------------------------------------------------------------------
echo  #
echo  #   Get XAMPP Lite
echo  #
echo  ---------------------------------------------------------------------------
echo.

cd %~dp0
if exist "%~dp0tmp" rmdir /S /Q "%~dp0tmp"
if exist "%~dp0tmp\xampplite" rmdir /S /Q "%~dp0tmp\xampplite"
if exist "%~dp0tmp\xampplite" goto CantDeletexamppliteFolder
bin\software\UnxUtils\wget.exe http://www.apachefriends.org/download.php?xampplite-win32-%XAMPPLiteVersion%.zip -O xampplite.zip
if not exist "%~dp0tmp" mkdir "%~dp0tmp"
bin\software\UnxUtils\unzip.exe -o xampplite.zip -d tmp
move /Y "%~dp0tmp\xampplite" "%~dp0tmp\xampplite"

echo.
echo  ---------------------------------------------------------------------------
echo  #
echo  #   Get Clansuite Snapshot
echo  #
echo  ---------------------------------------------------------------------------
echo.

bin\software\UnxUtils\wget.exe %ClansuiteTarball% -O clansuite.tar.gz
bin\software\UnxUtils\gzip.exe -f -d clansuite.tar.gz
bin\software\UnxUtils\tar.exe -xf clansuite.tar -v -C tmp\xampplite\htdocs

echo.
echo  ---------------------------------------------------------------------------
echo  #
echo  #   Cleanup the mess
echo  #
echo  ---------------------------------------------------------------------------
echo.

cd "%~dp0"
echo Delete build-tools...
if exist "%~dp0tmp\xampplite\htdocs\clansuite\build-tools" rmdir /S /Q "%~dp0tmp\xampplite\htdocs\clansuite\build-tools"
echo Delete xampplite.zip...
if exist "xampplite.zip" del xampplite.zip
echo Delete clansuite.tar...
if exist "clansuite.tar" del clansuite.tar

echo.
echo  ---------------------------------------------------------------------------
echo  #
echo  #   Set up configurations
echo  #
echo  ---------------------------------------------------------------------------
echo.

echo Write xampplite index.php...
xcopy /Y /Q "%~dp0config\index.php" "%~dp0tmp\xampplite\htdocs\" > nul

echo Write clansuite configuration file clansuite.config.php...
xcopy /Y /Q "%~dp0config\clansuite.config.php" "%~dp0tmp\xampplite\htdocs\clansuite\configuration\" > nul

echo Write phpMyAdmin config.inc.php...
xcopy /Y /Q "%~dp0config\config.inc.php" "%~dp0tmp\xampplite\phpMyAdmin\" > nul

echo Write PHP config php.ini...
xcopy /Y /Q "%~dp0config\php.ini" "%~dp0tmp\xampplite\php\" > nul

echo Add PHP Extensions...
xcopy /Y /Q "%~dp0bin\software\phpext\*.dll" "%~dp0tmp\xampplite\php\ext\" > nul

echo Add Clansuite Icons...
if not exist "%~dp0tmp\icons" mkdir "%~dp0tmp\icons"
xcopy /Y /Q "%~dp0bin\images\*.ico" "%~dp0tmp\icons\" > nul

echo Write clansuite executables...
xcopy /Y /Q "%~dp0bin\batch\Setup-Clansuite.bat" "%~dp0tmp\" > nul
xcopy /Y /Q "%~dp0bin\batch\Start-Clansuite.bat" "%~dp0tmp\" > nul
xcopy /Y /Q "%~dp0bin\batch\Stop-Clansuite.bat" "%~dp0tmp\" > nul

echo Write documents...
xcopy /Y /Q "%~dp0bin\README.txt" "%~dp0tmp\" > nul
xcopy /Y /Q "%~dp0bin\LICENSE.txt" "%~dp0tmp\" > nul

:compile
echo.
echo  ---------------------------------------------------------------------------
echo  #
echo  #   Compile with Inno-Setup
echo  #
echo  ---------------------------------------------------------------------------
echo.

echo Compile...
bin\software\InnoSetup5\iscc.exe "%~dp0config\clansuite_serverpack.iss" "/dtmpPath=%~dp0tmp\" "/dCVersion=%ServerpackVersion%" "/dbinPath=%~dp0bin" "/dXVersion=%XAMPPLiteVersion%" "/o%~dp0bin"

goto END

:CantDeletexamppliteFolder
echo.
echo  ---------------------------------------------------------------------------
echo  # Error: Could not delete folder...
echo  # %~dp0tmp\xampplite
echo  # Please remove the folder manually and execute build.bat again
echo  ---------------------------------------------------------------------------
echo.
goto END

EndLocal
:END