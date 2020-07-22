<?php
							// Begin of automatic config file
							$config["dbtype"] = "mysql"; //DB type (mysql, postgresql...in future others)
							$config["mysqli"] = true;
							$config["dbname"]="pandora";			// MySQL DataBase name
							$config["dbuser"]="pandora";			// DB User
							$config["dbpass"]="pandora";	// DB Password
							$config["dbhost"]="localhost";			// DB Host
                            $config["homedir"]="/var/www/html/pandora_console";		// Config homedir
                            // ----------Rebranding--------------------
                            // Uncomment this lines and add your customs text and paths.
                            // $config["custom_logo_login_alt"] ="login_logo.png";
                            // $config["custom_splash_login_alt"] = "splash_image_default.png";
                            // $config["custom_title1_login_alt"] = "WELCOME TO Pandora FMS";
                            // $config["custom_title2_login_alt"] = "NEXT GENERATION";
                            // $config["rb_product_name_alt"] = "Pandora FMS";
                            // $config["custom_docs_url_alt"] = "http://wiki.pandorafms.com/";
                            // $config["custom_support_url_alt"] = "https://support.artica.es";

							/*
							----------Attention--------------------
							Please note that in certain installations:
								- reverse proxy.
								- web server in other ports.
								- https
							
							This variable might be dynamically altered.
							
							But it is save as backup in the
							$config["homeurl_static"]
							for expecial needs.
							----------Attention--------------------
							*/
							$config["homeurl"]="/pandora_console";			// Base URL
							$config["homeurl_static"]="/pandora_console";			// Don't  delete
							// End of automatic config file
							?><?php
// Pandora FMS - http://pandorafms.com
// ==================================================
// Copyright (c) 2005-2010 Artica Soluciones Tecnologicas
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the  GNU Lesser General Public License
// as published by the Free Software Foundation; version 2
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

/**
 * @package    Include
 * @subpackage Config
 */

// Default values
// $config["dbname"]="pandora";
// $config["dbuser"]="pandora";
// $config["dbpass"]="pandora";
// $config["dbhost"]="localhost";
// This is used for reporting, please add "/" character at the end
// $config["homedir"]="/var/www/pandora_console/";
// $config["homeurl"]="/pandora_console/";
// $config["auth"]["scheme"] = "mysql";

/**
 * Do not display any ERROR
 */
error_reporting(E_ALL);

// Display ALL errors
// error_reporting(E_ERROR);
$ownDir = dirname(__FILE__).DIRECTORY_SEPARATOR;
require $ownDir.'config_process.php';
