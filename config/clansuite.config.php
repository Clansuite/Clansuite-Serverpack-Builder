; <?php die( 'Access forbidden.' ); /* DO NOT MODIFY THIS LINE! ?>
;
; Clansuite Configuration File :
; \clansuite\configuration\clansuite.config.php
;


;----------------------------------------
; database
;----------------------------------------
[database]
host = "localhost"
type = "mysql"
username = "root"
password = toop
name = "clansuite"
prefix = "cs_"

;----------------------------------------
; paths
;----------------------------------------
[paths]
core_folder = "core"
libraries_folder = "libraries"
language_folder = "languages"
themes_folder = "themes"
mod_folder = "modules"
upload_folder = "uploads"
logfiles_folder = "logs"

;----------------------------------------
; email
;----------------------------------------
[email]
mailmethod = "mail"
mailerhost = ""
mailerport = ""
mailencryption = "SWIFT_OPEN"
smtp_username = ""
smtp_password = ""
from = "system@website.com"
from_name = ""

;----------------------------------------
; template
;----------------------------------------
[template]
pagetitle = "Team Clansuite"
favicon = ""
theme = "standard"
backend_theme = "admin"
layout = "index.tpl"
css = "standard.css"
javascript = "standard.js"

;----------------------------------------
; switches
;----------------------------------------
[switches]
themeswitch_via_url = 0
languageswitch_via_url = 0

;----------------------------------------
; defaults
;----------------------------------------
[defaults]
module = "index"
action = "show"

;----------------------------------------
; language
;----------------------------------------
[language]
language = "de"
outputcharset = "UTF-8"
timezone = "Europe/Paris"
gmtoffset = 3600

;----------------------------------------
; login
;----------------------------------------
[login]
login_method = "nick"
remember_me_time = 90
max_login_attempts = 5
login_ban_minutes = 30
min_pass_length = 6
encryption = "sha1"
salt = "1-3-5-8-4-1-7-2-4-1-4-1"
registration_term = ""

;----------------------------------------
; openid
;----------------------------------------
[openid]
trustroot = "http://www.clansuite.com/openid/"
showloginbox = 1

;----------------------------------------
; upload
;----------------------------------------
[upload]
max_upload_filesize = 1048576

;----------------------------------------
; session
;----------------------------------------
[session]
use_cookies = 1
use_cookies_only = 0
session_expire_time = 30
session_name = ""
check_browser = 1
check_host = 1
check_ip = 1

;----------------------------------------
; error
;----------------------------------------
[error]
development = 1
debug = 1
xdebug = 1
webdebug = 0
debug_popup = 0

;----------------------------------------
; maintenance
;----------------------------------------
[maintenance]
maintenance = 0
maintenance_reason = "SITE is currently undergoing scheduled maintenance.<br />Sorry for the inconvenience. Please try back in 60 minutes."

;----------------------------------------
; meta
;----------------------------------------
[meta]
description = "Clansuite - just an e-sport content management system."
language = "de"
author = "Jens-Andre Koch & Clansuite Development Team"
email = "system@clansuite.com"
keywords = "Clansuite, open-source, eSport, cms, clan,content management system, portal, online gaming"

;----------------------------------------
; webserver
;----------------------------------------
[webserver]
mod_rewrite = 0

;----------------------------------------
; locale
;----------------------------------------
[locale]
dateformat = ""
timezone = 0

;----------------------------------------
; statistics
;----------------------------------------
[statistics]
enabled = 1

;----------------------------------------
; updater
;----------------------------------------
[updater]
enabled = 1
interval = 604800

;----------------------------------------
; logs
;----------------------------------------
[logs]
rotation = 1

;----------------------------------------
; minifer
;----------------------------------------
[minifer]
enabled = 0

;----------------------------------------
; help
;----------------------------------------
[help]
tracking = 1
type = "mysql"
cache = ""

;----------------------------------------
; cache
;----------------------------------------
[cache]
adapter = 0
caching = 0
cache_lifetime = 600

; DO NOT REMOVE THIS LINE */ ?>