#!/bin/bash

###
#   Clansuite Serverpack for Windows
#
#   This is the Build Script for the Clansuite Server for Windows.
#   It's inspired by moodle4w_builder (GPL) by Eloy Lafuente (stronk7).
#   http://cvs.moodle.org/contrib/tools/m4w_builder/
#
#   @author Eloy Lafuente
#   @author Jens-Andre Koch
#   @license GNU/GPL Version 2 and any later version
###

# UPDATE CLANSUITE 4W BUILDER
#svn co svn://vain@svn.gna.org/svn/clansuite/serverpacks/trunk/clansuite4w_builder/ --force /home/clansuite/serverpacks/build
#exit;

###
#
# CONFIGURATION & PATHS
#
###

# Calcute the path to the parent folder of this script
SCRIPTDIR=`dirname "$0"`

# Path to the Windows Executables #/clansuite4w_builder/bin
WINDOWSINSTALLFILES=$SCRIPTDIR/bin

# wget logfiles dir + file
BUILDLOG=/home/clansuite/logs/xampp4win-build.log
WGETLOG=/home/clansuite/logs/xampp4win-wget.log

# targetdir
XAMPPTARGETDIR=/home/clansuite/serverpacks/windows/

###
#
# 1) FETCH LATEST XAMPP for WINDOWS
#
###

# It's too difficult to regexp a link to the latest version out of the ever changing sourceforge rss styles.
# There is no longer a need to fetch the version number. Now we can fetch the link directly from our own Yahoo Pipes! feed.
XAMPPLINK=$(wget -q -O- "http://pipes.yahoo.com/pipes/pipe.run?_id=0e4aeb2556447aee65e6db9a230a5143&_render=rss" | grep -m2 -o '<link>http://source[^"]*' | sed -n  -e 's/.*<link>\(.*\)<\/link>.*/\1/p')
echo "# Fetching latest XAMPP for W32 via ${XAMPPLINK}";

XAMPPVERSION=$(echo grep -o $XAMPPLINK | grep -Eo '([[:digit:]]+\.)+[[:digit:]]+.zip')
echo "# Latest Version ${XAMPPVERSION}";

XAMPPFILE=$XAMPPTARGETDIR/$(echo grep -o $XAMPPLINK | grep -Eo 'xampplite-win32-([[:digit:]]+\.)+[[:digit:]]+.zip')

# FETCH XAMPP
if [ ! -r $XAMPPFILE ]
then
  wget -o $WGETLOG $XAMPPLINK --directory-prefix=$XAMPPTARGETDIR
  echo "# Successfully fetched!";
  echo "Fetched file: ${XAMPPFILE}";
else
  echo "# File exists already. Not fetched!";
  echo "# Proceeding...";
fi

TEMPDIR=/home/clansuite/tmp
FINALDIRNAME=xampplite
FINALFILENAME=clansuite-serverpack-w32-xampp${XAMPPVERSION}

# Delete any previous temp directory
rm -fr $TEMPDIR/$FINALDIRNAME

###
#
# 3) UNZIP XAMPP to TEMPORARY FOLDER
#
###


# Expand XAMPPLITE to temp directory
# at this position we have /home/clansuite/tmp/xampplite/*.*
# overwrite files without prompting

/usr/bin/unzip -o $XAMPPFILE -d $TEMPDIR

###
#
# XAMPPLite -> xampplite
#
###

mv $TEMPDIR/xampplite $TEMPDIR/$FINALDIRNAME

###
#
# COPY Clansuite
#
###

CLANSUITEDIR=/home/clansuite/svn-export

# Copy CLANSUITE under XAMPPLITE

cp -R $CLANSUITEDIR $TEMPDIR/$FINALDIRNAME/htdocs/clansuite

# Delete some useless files on CLANSUITE

rm $TEMPDIR/$FINALDIRNAME/clansuite/configuration/clansuite.config.php

###
#
# XAMPP Cleanup
#
###

# Delete some directories from XAMPPLITE

#rm -fr $TEMPDIR/$FINALDIRNAME/htdocs
#rm -fr $TEMPDIR/$FINALDIRNAME/cgi-bin
#rm -fr $TEMPDIR/$FINALDIRNAME/perl
#rm -fr $TEMPDIR/$FINALDIRNAME/security
#rm -fr $TEMPDIR/$FINALDIRNAME/webalizer
#rm -fr $TEMPDIR/$FINALDIRNAME/webdav


# Delete some directories from Clansuite
rm -fr $TEMPDIR/$FINALDIRNAME/clansuite/build-tools

###
#
# FETCH XDEBUG
#
###

#if [ ! -r /home/clansuite/serverpacks/windows/php_xdebug.dll ]
#then
#    echo "# Starting wget php_xdebug" >> $BUILDLOG
#    wget -o $WGETLOG -O /home/clansuite/serverpacks/windows/php_xdebug.dll http://xdebug.org/link.php?url=xdebug203-52-win
#else
#    echo "# Copying php_xdebug from Download-Directory to Serverpack/php/ext" >> $BUILDLOG
#    cp /home/clansuite/serverpacks/windows/php_xdebug.dll $TEMPDIR/$FINALDIRNAME/php/ext/php_xdebug.dll
#fi

###
#
# XAMPP CONFIG FILES
#
###

echo "# Copying Custom Apache Config Files to Serverpack/apache/conf" >> $BUILDLOG
# Copy our custom config files to their correct location
#cp $SCRIPTDIR/config/php.ini $TEMPDIR/$FINALDIRNAME/php/php.ini
#cp $SCRIPTDIR/config/my.cnf $TEMPDIR/$FINALDIRNAME/mysql/bin/my.cnf
cp $SCRIPTDIR/config/index.php $TEMPDIR/$FINALDIRNAME/htdocs/index.php

###
#
# XAMPP STARTUP FILES
#
###

echo "# Copying Start-Clansuite.exe and Stop-Clansuite.exe" >> $BUILDLOG
# Copy "Start-Clansuite.exe" and "Stop-Clansuite.exe"
cp $WINDOWSINSTALLFILES/Setup-Clansuite.exe $TEMPDIR
cp $WINDOWSINSTALLFILES/Start-Clansuite.exe $TEMPDIR
cp $WINDOWSINSTALLFILES/Stop-Clansuite.exe $TEMPDIR
cp $WINDOWSINSTALLFILES/README.txt $TEMPDIR

###
#
# ZIP SERVERPACKAGE
#
###

cd $TEMPDIR
echo "# Zipping and moving Serverpack" >> $BUILDLOG
zip -r -9 /home/clansuite/tmp/$FINALFILENAME.temp $FINALDIRNAME Setup-Clansuite.exe Start-Clansuite.exe Stop-Clansuite.exe README.txt
mv /home/clansuite/tmp/$FINALFILENAME.temp $XAMPPTARGETDIR/$FINALFILENAME

###
#
# EXPORT TO xampplite
#
###

mv $XAMPPTARGETDIR/$FINALFILENAME /srv/www/clansuite.com/public_html/serverpacks/$FINALFILENAME
chown clansuitecom:www-users /srv/www/clansuite.com/public_html/serverpacks/$FINALFILENAME
chmod 644 /srv/www/clansuite.com/public_html/serverpacks/$FINALFILENAME