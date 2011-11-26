                            _________________________
                            C  L  A  N  S  U  I  T  E



  Clansuite Webserver Pack for Windows - BUILDER
  ----------------------------------------------


  What's this?
  ------------

    These directories contain everything you need to build the Clansuite Webserver Pack for Windows and Linux.


  Structure
  ---------

    The builder consists of the following elements:

    - "build.bat":  The batch script that, once configured, properly, does all the work generating the
                    final Clansuite4Windows setup-package for Windows.
                  
    - "build.sh":   The shell script that, once configured, properly, does all the work generating the
                    final Clansuite4Windows package for Linux.

    - "/config":    In this directory you find all the configuration files for the build scripts (webserver, setup, etc).
                    These configuration files will overwrite the original ones from the xampplite package.


  Requirements
  ------------

  Windows:
    In order to work properly, the build.sh script need all the source components to be present.
    This includes:

        1) The whole "clansuite4w_builder" directory.
           It can be renamed or moved safely, but all the components must be present.
        2) A URL linking to a clansuite tarball (default: SVN Snapshot from GNA)

  Linux:
    In order to work properly, the build.sh script need all the source components to be present.
    This includes:

        1) The whole "clansuite4w_builder" directory.
           It can be renamed or moved safely, but all the components must be present.
        2) The "clansuite source directory".
           It must be a complete clansuite tree (STABLE, HEAD...).
           Currently an "svn export" of the "head of trunk" is used.
        3) The xampplite package. It is automatically fetched as a zip archive from sourceforge.
        4) A temporary directory with write permissions where everything is done.

  Execution (Windows)
  -----------------

    Once all the components are present, all the requirements are satisfied
    and the configuration of the build.bat has been performed, simply execute:

    build.bat

    and, after some minutes, the final package will be ready to be used in bin\ folder.


  Execution (Linux)
  -----------------

    Once all the components are present, all the requirements are satisfied
    and the configuration of the build.sh has been performed, simply execute:

    ./build.sh

    and, after some minutes, the final package will be ready to be used.


  Detailed list of changes to the Webserver Configuration Files
  -------------------------------------------------------------

  -> PHP.INI in "php/php.ini"
     --------------------------------
     old value                      new value                       comment

     memory_limit 16M               memory_limit 128M               raised memory limit to 128M
     ;extension=php_apc.dll         extension=php_apc.dll           enable Alternative PHP Cache
     ;extension=php_curl.dll        extension=php_curl.dll          enable CURL
     ;extension=php_ldap.dll        extension=php_ldap.dll          enable LDAP
     ;extension=php_xdebug.dll      extension=php_xdebug.dll        enable Xdebug
     session.bug_compat_warn = on   session.bug_compat_42 = off     no compatibility warnings
     session.bug_compat_warn = on   session.bug_compat_warn = off   no compatibility warnings


  -> HTTPD.CONF in "apache/conf"
     ---------------------------

     Change every occurrence of "htdocs" to  "clansuite".

     Look for the block:  <Directory />   and add the directive:   AcceptPathInfo On

     Enable the line:
          LoadModule negotiation_module modules/mod_negotiation.so

     Disable DAV stuff, disablig (#) the following lines:
          LoadModule dav_module modules/mod_dav.so
          LoadModule dav_fs_module modules/mod_dav_fs.so
          Include conf/extra/httpd-dav.conf

     Disable (#) these lines:
          Include conf/extra/httpd-info.conf
          Include conf/extra/httpd-userdir.conf

     Change these lines:
          ThreadsPerChild 250     to  ThreadsPerChild 50
          MaxRequestsPerChild  0  to  MaxRequestsPerChild 100

     Disable (#) these lines:
          AddType text/html .shtml
          AddOutputFilter INCLUDES .shtml

     Disable (#) these lines:
          EnableMMAP off
          EnableSendfile off


  -> HTTPD-SSL.CONF in "apache/conf/extra"
     -------------------------------------

     Change every occurrence of "htdocs" to  "clansuite".

  -> HTTPD-XAMPP.CONF in "apache/conf/extra"
     --------------------------------------------------------

     Change every occurrence of "htdocs" to  "clansuite".

     The following configuration blocks were removed:
          - Directory "/xampplite/htdocs/xampplite"
          - Alias /security "/xampplite/security/htdocs/"
          - Directory "/xampplite/security/htdocs"
          - Alias /webalizer "/xampplite/webalizer/"
          - Directory "/xampplite/webalizer"
          - IfModule auth_remote_module
          - IfModule mysql_auth_module


  Thanks and Credits
  ------------------

  Big Thanks and credits to Eloy Lafuente (stronk7) from the Moodle Project for
  the initial creation of m4w_builder (GPL).


  Last Words
  ----------

    Thanks for using Clansuite!

      Best Regards,

        Jens-André Koch
        Clansuite Maintainer

  Version: $Id$