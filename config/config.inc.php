<?php
/*
 * This is needed for cookie based authentication to encrypt password in
 * cookie
 */
$cfg['blowfish_secret'] = 'xampp'; /* YOU SHOULD CHANGE THIS FOR A MORE SECURE COOKIE AUTH! */

/*
 * Servers configuration
 */
$i = 0;

/*
 * First server
 */
$i++;

/* Authentication type and info */
$cfg['Servers'][$i]['auth_type']            = 'config';
$cfg['Servers'][$i]['user']                 = 'root';
$cfg['Servers'][$i]['password']             = 'toop';
$cfg['Servers'][$i]['AllowNoPassword']      = true;

/* Server parameters */
$cfg['Servers'][$i]['host']             = 'localhost';
$cfg['Servers'][$i]['connect_type']     = 'tcp';
$cfg['Servers'][$i]['compress']         = false;

/* Select mysqli if your server has it */
$cfg['Servers'][$i]['extension'] = 'mysqli';

/* User for advanced features */
$cfg['Servers'][$i]['controluser'] = 'pma';
$cfg['Servers'][$i]['controlpass'] = '';

/* Advanced phpMyAdmin features */
$cfg['Servers'][$i]['pmadb']            = 'phpmyadmin';
$cfg['Servers'][$i]['bookmarktable']    = 'pma_bookmark';
$cfg['Servers'][$i]['relation']         = 'pma_relation';
$cfg['Servers'][$i]['table_info']       = 'pma_table_info';
$cfg['Servers'][$i]['table_coords']     = 'pma_table_coords';
$cfg['Servers'][$i]['pdf_pages']        = 'pma_pdf_pages';
$cfg['Servers'][$i]['column_info']      = 'pma_column_info';
$cfg['Servers'][$i]['history']          = 'pma_history';
$cfg['Servers'][$i]['designer_coords']  = 'pma_designer_coords';

/*
 * End of servers configuration
 */

/*
 * Directories for saving/loading files from server
 */
$cfg['UploadDir']   = '';
$cfg['SaveDir']     = '';

$cfg['AllowAnywhereRecoding']       = true;
$cfg['DefaultCharset']              = 'utf-8';
$cfg['DefaultLang']                 = 'en-utf-8';
$cfg['DefaultConnectionCollation']  = 'utf8_general_ci';

$cfg['MySQLManualBase'] = 'http://dev.mysql.com/doc/refman/5.1/en';
$cfg['MySQLManualType'] = 'searchable';

?>
