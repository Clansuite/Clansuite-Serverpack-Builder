                            _________________________
                            C  L  A  N  S  U  I  T  E



  Clansuite Webserver Pack for Windows
  ------------------------------------

  What's this?
  ------------

    This package contains everything you need to run Clansuite on a windows machine.

    Clansuite has been packaged with Apache, MySQL and PHP5.

    It is installed and ready to run out of the box.


  HOW TO USE IT
  -------------

    First of all:
    In general you don't have to do anything. If something fails, those steps could
    lead you the way:
    
    1. Run 'Setup-Clansuite.bat' to install the webserver and clansuite (automatically).
       
       !!! When you run the setup, your old database gets overwritten (but backuped) !!!
    
    2. Run 'Start-Clansuite.bat' to start up database and webserver.
       ( It will autoredirect you to http://localhost/clansuite/ )
    
    3. To shut down the database and webserver use 'Stop-Clansuite.bat'


  TECHNICAL INFORMATION
  ---------------------

    1. Starting and Stopping Clansuite

        'Start-Clansuite.bat' checks for php.exe runs apache and mysql services and
        calls the website "http://localhost/clansuite"

        'Stop-Clansuite.bat' stops the apache and mysql processes.


    2. XAMPPLite (http://www.apachefriends.org/en/xampp-windows.html)

        You can use xampp executable files directly if you like.
        They are located in the "webserver/" directory.


    3. Clansuite Directory (vHost: http://clansuite-dev.com/)

        All clansuite files are located in "webserver/htdocs/clansuite/".
        This is the SVN HEAD / "trunk" of Clansuite.
        Daily Snapshot: http://svn.gna.org/daily/clansuite-snapshot.tar.gz


  TROUBLESHOOTING
  ---------------

    If 'Start-Clansuite.bat' fails to work and the services won't come up,
    you may have something blocking port 80 on your machine.  Make sure there
    are no other webservers or applications such as Skype running on this port and
    your firewall is open at this port. You can check the ports by running
    the script "webserver/xampp-portcheck.exe"

    Do not rename the 'webserver/' folder. Otherwise 'Start-Clansuite.bar',
    'Stop-Clansuite.bat' and 'Setup-Clansuite.bat will stop working and 
    you'll have to use xampp executable files. (xammp_control.exe)

  Last Words
  ----------

    Thanks for using Clansuite!

      Best Regards,

        Jens-André Koch
        Clansuite Maintainer
        
        Florian Wolf
        Developer

  Version: $Id$