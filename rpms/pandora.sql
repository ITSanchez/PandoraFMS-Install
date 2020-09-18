-- MySQL dump 10.14  Distrib 5.5.65-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: pandora
-- ------------------------------------------------------
-- Server version	5.5.65-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `taddress`
--

DROP TABLE IF EXISTS `taddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taddress` (
  `id_a` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(60) NOT NULL DEFAULT '',
  `ip_pack` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_a`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taddress`
--

LOCK TABLES `taddress` WRITE;
/*!40000 ALTER TABLE `taddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `taddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taddress_agent`
--

DROP TABLE IF EXISTS `taddress_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taddress_agent` (
  `id_ag` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_a` bigint(20) unsigned NOT NULL DEFAULT '0',
  `id_agent` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_ag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taddress_agent`
--

LOCK TABLES `taddress_agent` WRITE;
/*!40000 ALTER TABLE `taddress_agent` DISABLE KEYS */;
/*!40000 ALTER TABLE `taddress_agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagent_access`
--

DROP TABLE IF EXISTS `tagent_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagent_access` (
  `id_agent` int(10) unsigned NOT NULL DEFAULT '0',
  `utimestamp` bigint(20) NOT NULL DEFAULT '0',
  KEY `agent_index` (`id_agent`),
  KEY `idx_utimestamp` (`utimestamp`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagent_access`
--

LOCK TABLES `tagent_access` WRITE;
/*!40000 ALTER TABLE `tagent_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagent_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagent_custom_data`
--

DROP TABLE IF EXISTS `tagent_custom_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagent_custom_data` (
  `id_field` int(10) unsigned NOT NULL,
  `id_agent` int(10) unsigned NOT NULL,
  `description` text,
  PRIMARY KEY (`id_field`,`id_agent`),
  KEY `id_agent` (`id_agent`),
  CONSTRAINT `tagent_custom_data_ibfk_1` FOREIGN KEY (`id_field`) REFERENCES `tagent_custom_fields` (`id_field`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tagent_custom_data_ibfk_2` FOREIGN KEY (`id_agent`) REFERENCES `tagente` (`id_agente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagent_custom_data`
--

LOCK TABLES `tagent_custom_data` WRITE;
/*!40000 ALTER TABLE `tagent_custom_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagent_custom_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagent_custom_fields`
--

DROP TABLE IF EXISTS `tagent_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagent_custom_fields` (
  `id_field` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL DEFAULT '',
  `display_on_front` tinyint(1) NOT NULL DEFAULT '0',
  `is_password_type` tinyint(1) NOT NULL DEFAULT '0',
  `combo_values` varchar(255) DEFAULT '',
  PRIMARY KEY (`id_field`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagent_custom_fields`
--

LOCK TABLES `tagent_custom_fields` WRITE;
/*!40000 ALTER TABLE `tagent_custom_fields` DISABLE KEYS */;
INSERT INTO `tagent_custom_fields` VALUES (1,'Serial&#x20;Number',0,0,''),(2,'Department',0,0,''),(3,'Additional&#x20;ID',0,0,''),(4,'eHorusID',0,0,'');
/*!40000 ALTER TABLE `tagent_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagent_custom_fields_filter`
--

DROP TABLE IF EXISTS `tagent_custom_fields_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagent_custom_fields_filter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(600) NOT NULL,
  `id_group` int(10) unsigned DEFAULT '0',
  `id_custom_field` varchar(600) DEFAULT '',
  `id_custom_fields_data` varchar(600) DEFAULT '',
  `id_status` varchar(600) DEFAULT '',
  `module_search` varchar(600) DEFAULT '',
  `module_status` varchar(600) DEFAULT '',
  `recursion` int(1) unsigned DEFAULT '0',
  `group_search` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagent_custom_fields_filter`
--

LOCK TABLES `tagent_custom_fields_filter` WRITE;
/*!40000 ALTER TABLE `tagent_custom_fields_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagent_custom_fields_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagent_module_inventory`
--

DROP TABLE IF EXISTS `tagent_module_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagent_module_inventory` (
  `id_agent_module_inventory` int(10) NOT NULL AUTO_INCREMENT,
  `id_agente` int(10) unsigned NOT NULL,
  `id_module_inventory` int(10) NOT NULL,
  `target` varchar(100) DEFAULT '',
  `interval` int(10) unsigned NOT NULL DEFAULT '3600',
  `username` varchar(100) DEFAULT '',
  `password` varchar(100) DEFAULT '',
  `data` mediumblob NOT NULL,
  `timestamp` datetime DEFAULT '1970-01-01 00:00:00',
  `utimestamp` bigint(20) DEFAULT '0',
  `flag` tinyint(1) unsigned DEFAULT '1',
  `id_policy_module_inventory` int(10) NOT NULL DEFAULT '0',
  `custom_fields` mediumblob NOT NULL,
  PRIMARY KEY (`id_agent_module_inventory`),
  KEY `id_agente` (`id_agente`),
  KEY `id_module_inventory` (`id_module_inventory`),
  CONSTRAINT `tagent_module_inventory_ibfk_1` FOREIGN KEY (`id_agente`) REFERENCES `tagente` (`id_agente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tagent_module_inventory_ibfk_2` FOREIGN KEY (`id_module_inventory`) REFERENCES `tmodule_inventory` (`id_module_inventory`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagent_module_inventory`
--

LOCK TABLES `tagent_module_inventory` WRITE;
/*!40000 ALTER TABLE `tagent_module_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagent_module_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagent_module_log`
--

DROP TABLE IF EXISTS `tagent_module_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagent_module_log` (
  `id_agent_module_log` int(10) NOT NULL AUTO_INCREMENT,
  `id_agent` int(10) unsigned NOT NULL,
  `source` text NOT NULL,
  `timestamp` datetime DEFAULT '1970-01-01 00:00:00',
  `utimestamp` bigint(20) DEFAULT '0',
  PRIMARY KEY (`id_agent_module_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagent_module_log`
--

LOCK TABLES `tagent_module_log` WRITE;
/*!40000 ALTER TABLE `tagent_module_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagent_module_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagent_repository`
--

DROP TABLE IF EXISTS `tagent_repository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagent_repository` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_os` int(10) unsigned DEFAULT '0',
  `arch` enum('x64','x86') DEFAULT 'x64',
  `version` varchar(10) DEFAULT '',
  `path` text,
  `uploaded_by` varchar(100) DEFAULT '',
  `uploaded` bigint(20) NOT NULL DEFAULT '0' COMMENT 'When it was uploaded',
  `last_err` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id_os` (`id_os`),
  CONSTRAINT `tagent_repository_ibfk_1` FOREIGN KEY (`id_os`) REFERENCES `tconfig_os` (`id_os`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagent_repository`
--

LOCK TABLES `tagent_repository` WRITE;
/*!40000 ALTER TABLE `tagent_repository` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagent_repository` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagent_secondary_group`
--

DROP TABLE IF EXISTS `tagent_secondary_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagent_secondary_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_agent` int(10) unsigned NOT NULL,
  `id_group` mediumint(4) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_agent` (`id_agent`),
  KEY `id_group` (`id_group`),
  CONSTRAINT `tagent_secondary_group_ibfk_1` FOREIGN KEY (`id_agent`) REFERENCES `tagente` (`id_agente`) ON DELETE CASCADE,
  CONSTRAINT `tagent_secondary_group_ibfk_2` FOREIGN KEY (`id_group`) REFERENCES `tgrupo` (`id_grupo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagent_secondary_group`
--

LOCK TABLES `tagent_secondary_group` WRITE;
/*!40000 ALTER TABLE `tagent_secondary_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagent_secondary_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagente`
--

DROP TABLE IF EXISTS `tagente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagente` (
  `id_agente` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(600) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `direccion` varchar(100) DEFAULT NULL,
  `comentarios` varchar(255) DEFAULT '',
  `id_grupo` int(10) unsigned NOT NULL DEFAULT '0',
  `ultimo_contacto` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `modo` tinyint(1) NOT NULL DEFAULT '0',
  `intervalo` int(11) unsigned NOT NULL DEFAULT '300',
  `id_os` int(10) unsigned DEFAULT '0',
  `os_version` varchar(100) DEFAULT '',
  `agent_version` varchar(100) DEFAULT '',
  `ultimo_contacto_remoto` datetime DEFAULT '1970-01-01 00:00:00',
  `disabled` tinyint(2) NOT NULL DEFAULT '0',
  `remote` tinyint(1) NOT NULL DEFAULT '0',
  `id_parent` int(10) unsigned DEFAULT '0',
  `custom_id` varchar(255) DEFAULT '',
  `server_name` varchar(100) DEFAULT '',
  `cascade_protection` tinyint(2) NOT NULL DEFAULT '0',
  `cascade_protection_module` int(10) unsigned NOT NULL DEFAULT '0',
  `timezone_offset` tinyint(2) DEFAULT '0' COMMENT 'nuber of hours of diference with the server timezone',
  `icon_path` varchar(127) DEFAULT NULL COMMENT 'path in the server to the image of the icon representing the agent',
  `update_gis_data` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'set it to one to update the position data (altitude, longitude, latitude) when getting information from the agent or to 0 to keep the last value and do not update it',
  `url_address` mediumtext,
  `quiet` tinyint(1) NOT NULL DEFAULT '0',
  `normal_count` bigint(20) NOT NULL DEFAULT '0',
  `warning_count` bigint(20) NOT NULL DEFAULT '0',
  `critical_count` bigint(20) NOT NULL DEFAULT '0',
  `unknown_count` bigint(20) NOT NULL DEFAULT '0',
  `notinit_count` bigint(20) NOT NULL DEFAULT '0',
  `total_count` bigint(20) NOT NULL DEFAULT '0',
  `fired_count` bigint(20) NOT NULL DEFAULT '0',
  `update_module_count` tinyint(1) NOT NULL DEFAULT '0',
  `update_alert_count` tinyint(1) NOT NULL DEFAULT '0',
  `update_secondary_groups` tinyint(1) NOT NULL DEFAULT '0',
  `alias` varchar(600) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `transactional_agent` tinyint(1) NOT NULL DEFAULT '0',
  `alias_as_name` tinyint(2) NOT NULL DEFAULT '0',
  `safe_mode_module` int(10) unsigned NOT NULL DEFAULT '0',
  `cps` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_agente`),
  KEY `nombre` (`nombre`(255)),
  KEY `direccion` (`direccion`),
  KEY `disabled` (`disabled`),
  KEY `id_grupo` (`id_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagente`
--

LOCK TABLES `tagente` WRITE;
/*!40000 ALTER TABLE `tagente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagente_datos`
--

DROP TABLE IF EXISTS `tagente_datos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagente_datos` (
  `id_agente_modulo` int(10) unsigned NOT NULL DEFAULT '0',
  `datos` double(22,5) DEFAULT NULL,
  `utimestamp` bigint(20) DEFAULT '0',
  KEY `data_index1` (`id_agente_modulo`,`utimestamp`),
  KEY `idx_utimestamp` (`utimestamp`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagente_datos`
--

LOCK TABLES `tagente_datos` WRITE;
/*!40000 ALTER TABLE `tagente_datos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagente_datos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagente_datos_inc`
--

DROP TABLE IF EXISTS `tagente_datos_inc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagente_datos_inc` (
  `id_agente_modulo` int(10) unsigned NOT NULL DEFAULT '0',
  `datos` double(22,5) DEFAULT NULL,
  `utimestamp` int(20) unsigned DEFAULT '0',
  KEY `data_inc_index_1` (`id_agente_modulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagente_datos_inc`
--

LOCK TABLES `tagente_datos_inc` WRITE;
/*!40000 ALTER TABLE `tagente_datos_inc` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagente_datos_inc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagente_datos_inventory`
--

DROP TABLE IF EXISTS `tagente_datos_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagente_datos_inventory` (
  `id_agent_module_inventory` int(10) NOT NULL,
  `data` mediumblob NOT NULL,
  `utimestamp` bigint(20) DEFAULT '0',
  `timestamp` datetime DEFAULT '1970-01-01 00:00:00',
  KEY `idx_id_agent_module` (`id_agent_module_inventory`),
  KEY `idx_utimestamp` (`utimestamp`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagente_datos_inventory`
--

LOCK TABLES `tagente_datos_inventory` WRITE;
/*!40000 ALTER TABLE `tagente_datos_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagente_datos_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagente_datos_log4x`
--

DROP TABLE IF EXISTS `tagente_datos_log4x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagente_datos_log4x` (
  `id_tagente_datos_log4x` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_agente_modulo` int(10) unsigned NOT NULL DEFAULT '0',
  `severity` text NOT NULL,
  `message` text NOT NULL,
  `stacktrace` text NOT NULL,
  `utimestamp` int(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_tagente_datos_log4x`),
  KEY `data_log4x_index_1` (`id_agente_modulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagente_datos_log4x`
--

LOCK TABLES `tagente_datos_log4x` WRITE;
/*!40000 ALTER TABLE `tagente_datos_log4x` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagente_datos_log4x` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagente_datos_string`
--

DROP TABLE IF EXISTS `tagente_datos_string`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagente_datos_string` (
  `id_agente_modulo` int(10) unsigned NOT NULL DEFAULT '0',
  `datos` mediumtext NOT NULL,
  `utimestamp` int(20) unsigned NOT NULL DEFAULT '0',
  KEY `data_string_index_1` (`id_agente_modulo`,`utimestamp`),
  KEY `idx_utimestamp` (`utimestamp`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagente_datos_string`
--

LOCK TABLES `tagente_datos_string` WRITE;
/*!40000 ALTER TABLE `tagente_datos_string` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagente_datos_string` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagente_estado`
--

DROP TABLE IF EXISTS `tagente_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagente_estado` (
  `id_agente_estado` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_agente_modulo` int(10) NOT NULL DEFAULT '0',
  `datos` mediumtext NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `estado` int(4) NOT NULL DEFAULT '0',
  `known_status` tinyint(4) DEFAULT '0',
  `id_agente` int(10) NOT NULL DEFAULT '0',
  `last_try` datetime DEFAULT NULL,
  `utimestamp` bigint(20) NOT NULL DEFAULT '0',
  `current_interval` int(8) unsigned NOT NULL DEFAULT '0',
  `running_by` smallint(4) unsigned DEFAULT '0',
  `last_execution_try` bigint(20) NOT NULL DEFAULT '0',
  `status_changes` tinyint(4) unsigned DEFAULT '0',
  `last_status` tinyint(4) DEFAULT '0',
  `last_known_status` tinyint(4) DEFAULT '0',
  `last_error` int(4) NOT NULL DEFAULT '0',
  `ff_start_utimestamp` bigint(20) DEFAULT '0',
  `ff_normal` int(4) unsigned DEFAULT '0',
  `ff_warning` int(4) unsigned DEFAULT '0',
  `ff_critical` int(4) unsigned DEFAULT '0',
  `last_dynamic_update` bigint(20) NOT NULL DEFAULT '0',
  `last_unknown_update` bigint(20) NOT NULL DEFAULT '0',
  `last_status_change` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_agente_estado`),
  KEY `status_index_1` (`id_agente_modulo`),
  KEY `idx_agente` (`id_agente`),
  KEY `running_by` (`running_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagente_estado`
--

LOCK TABLES `tagente_estado` WRITE;
/*!40000 ALTER TABLE `tagente_estado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagente_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagente_modulo`
--

DROP TABLE IF EXISTS `tagente_modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagente_modulo` (
  `id_agente_modulo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_agente` int(10) unsigned NOT NULL DEFAULT '0',
  `id_tipo_modulo` smallint(5) NOT NULL DEFAULT '0',
  `descripcion` text NOT NULL,
  `extended_info` text NOT NULL,
  `nombre` text NOT NULL,
  `unit` text,
  `id_policy_module` int(10) unsigned NOT NULL DEFAULT '0',
  `max` bigint(20) DEFAULT '0',
  `min` bigint(20) DEFAULT '0',
  `module_interval` int(4) unsigned DEFAULT '0',
  `cron_interval` varchar(100) DEFAULT '',
  `module_ff_interval` int(4) unsigned DEFAULT '0',
  `tcp_port` int(4) unsigned DEFAULT '0',
  `tcp_send` text,
  `tcp_rcv` text,
  `snmp_community` varchar(100) DEFAULT '',
  `snmp_oid` varchar(255) DEFAULT '0',
  `ip_target` varchar(100) DEFAULT '',
  `id_module_group` int(4) unsigned DEFAULT '0',
  `flag` tinyint(1) unsigned DEFAULT '1',
  `id_modulo` int(10) unsigned DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `id_export` smallint(4) unsigned DEFAULT '0',
  `plugin_user` text,
  `plugin_pass` text,
  `plugin_parameter` text,
  `id_plugin` int(10) DEFAULT '0',
  `post_process` double(24,15) DEFAULT '0.000000000000000',
  `prediction_module` bigint(14) DEFAULT '0',
  `max_timeout` int(4) unsigned DEFAULT '0',
  `max_retries` int(4) unsigned DEFAULT '0',
  `custom_id` varchar(255) DEFAULT '',
  `history_data` tinyint(1) unsigned DEFAULT '1',
  `min_warning` double(18,2) DEFAULT '0.00',
  `max_warning` double(18,2) DEFAULT '0.00',
  `str_warning` text,
  `min_critical` double(18,2) DEFAULT '0.00',
  `max_critical` double(18,2) DEFAULT '0.00',
  `str_critical` text,
  `min_ff_event` int(4) unsigned DEFAULT '0',
  `delete_pending` int(1) unsigned DEFAULT '0',
  `policy_linked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `policy_adopted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `custom_string_1` mediumtext,
  `custom_string_2` text,
  `custom_string_3` text,
  `custom_integer_1` int(10) DEFAULT '0',
  `custom_integer_2` int(10) DEFAULT '0',
  `wizard_level` enum('basic','advanced','nowizard') DEFAULT 'nowizard',
  `macros` text,
  `critical_instructions` text NOT NULL,
  `warning_instructions` text NOT NULL,
  `unknown_instructions` text NOT NULL,
  `quiet` tinyint(1) NOT NULL DEFAULT '0',
  `critical_inverse` tinyint(1) unsigned DEFAULT '0',
  `warning_inverse` tinyint(1) unsigned DEFAULT '0',
  `id_category` int(10) DEFAULT '0',
  `disabled_types_event` text NOT NULL,
  `module_macros` text NOT NULL,
  `min_ff_event_normal` int(4) unsigned DEFAULT '0',
  `min_ff_event_warning` int(4) unsigned DEFAULT '0',
  `min_ff_event_critical` int(4) unsigned DEFAULT '0',
  `ff_type` tinyint(1) unsigned DEFAULT '0',
  `each_ff` tinyint(1) unsigned DEFAULT '0',
  `ff_timeout` int(4) unsigned DEFAULT '0',
  `dynamic_interval` int(4) unsigned DEFAULT '0',
  `dynamic_max` int(4) DEFAULT '0',
  `dynamic_min` int(4) DEFAULT '0',
  `dynamic_next` bigint(20) NOT NULL DEFAULT '0',
  `dynamic_two_tailed` tinyint(1) unsigned DEFAULT '0',
  `prediction_sample_window` int(10) DEFAULT '0',
  `prediction_samples` int(4) DEFAULT '0',
  `prediction_threshold` int(4) DEFAULT '0',
  `parent_module_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cps` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_agente_modulo`),
  KEY `main_idx` (`id_agente_modulo`,`id_agente`),
  KEY `tam_agente` (`id_agente`),
  KEY `id_tipo_modulo` (`id_tipo_modulo`),
  KEY `disabled` (`disabled`),
  KEY `module` (`id_modulo`),
  KEY `nombre` (`nombre`(255)),
  KEY `module_group` (`id_module_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagente_modulo`
--

LOCK TABLES `tagente_modulo` WRITE;
/*!40000 ALTER TABLE `tagente_modulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagente_modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talert_actions`
--

DROP TABLE IF EXISTS `talert_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `talert_actions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text,
  `id_alert_command` int(10) unsigned DEFAULT '0',
  `field1` text NOT NULL,
  `field2` text NOT NULL,
  `field3` text NOT NULL,
  `field4` text NOT NULL,
  `field5` text NOT NULL,
  `field6` text NOT NULL,
  `field7` text NOT NULL,
  `field8` text NOT NULL,
  `field9` text NOT NULL,
  `field10` text NOT NULL,
  `field11` text NOT NULL,
  `field12` text NOT NULL,
  `field13` text NOT NULL,
  `field14` text NOT NULL,
  `field15` text NOT NULL,
  `id_group` mediumint(8) unsigned DEFAULT '0',
  `action_threshold` int(10) NOT NULL DEFAULT '0',
  `field1_recovery` text NOT NULL,
  `field2_recovery` text NOT NULL,
  `field3_recovery` text NOT NULL,
  `field4_recovery` text NOT NULL,
  `field5_recovery` text NOT NULL,
  `field6_recovery` text NOT NULL,
  `field7_recovery` text NOT NULL,
  `field8_recovery` text NOT NULL,
  `field9_recovery` text NOT NULL,
  `field10_recovery` text NOT NULL,
  `field11_recovery` text NOT NULL,
  `field12_recovery` text NOT NULL,
  `field13_recovery` text NOT NULL,
  `field14_recovery` text NOT NULL,
  `field15_recovery` text NOT NULL,
  `previous_name` text,
  PRIMARY KEY (`id`),
  KEY `id_alert_command` (`id_alert_command`),
  CONSTRAINT `talert_actions_ibfk_1` FOREIGN KEY (`id_alert_command`) REFERENCES `talert_commands` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talert_actions`
--

LOCK TABLES `talert_actions` WRITE;
/*!40000 ALTER TABLE `talert_actions` DISABLE KEYS */;
INSERT INTO `talert_actions` VALUES (1,'Mail&#x20;to&#x20;Admin',1,'yourmail@domain.es','[PANDORA] Alert from agent _agent_ on module _module_','&lt;style&#x20;type=&quot;text/css&quot;&gt;&#x0d;&#x0a;&#47;&#42;&#x20;Take&#x20;care&#x20;of&#x20;image&#x20;borders&#x20;and&#x20;formatting&#x20;&#42;&#47;&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;img&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;max-width:&#x20;600px;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;outline:&#x20;none;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;text-decoration:&#x20;none;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;-ms-interpolation-mode:&#x20;bicubic;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;a&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;border:&#x20;0;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;outline:&#x20;none;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;a&#x20;img&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;border:&#x20;none;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#47;&#42;&#x20;General&#x20;styling&#x20;&#42;&#47;&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;td,&#x20;h1,&#x20;h2,&#x20;h3&#x20;&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-family:&#x20;Helvetica,&#x20;Arial,&#x20;sans-serif;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-weight:&#x20;400;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;td&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;14px;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;line-height:&#x20;150%;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;text-align:&#x20;left;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;body&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;-webkit-font-smoothing:antialiased;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;-webkit-text-size-adjust:none;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;width:&#x20;100%;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;height:&#x20;100%;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;color:&#x20;#37302d;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;background:&#x20;#ffffff;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;table&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;border-collapse:&#x20;collapse&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;h1,&#x20;h2,&#x20;h3&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;padding:&#x20;0;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;margin:&#x20;0;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;color:&#x20;#444444;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-weight:&#x20;400;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;line-height:&#x20;110%;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;h1&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;35px;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;h2&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;30px;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;h3&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;24px;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;h4&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;18px;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-weight:&#x20;normal;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;.important-font&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;color:&#x20;#21BEB4;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-weight:&#x20;bold;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;.hide&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;display:&#x20;none&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;.force-full-width&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;width:&#x20;100%&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&lt;/style&gt;&#x0d;&#x0a;&lt;style&#x20;type=&quot;text/css&quot;&#x20;media=&quot;screen&quot;&gt;&#x0d;&#x0a;@media&#x20;screen&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;@import&#x20;url&#40;http://fonts.googleapis.com/css?family=Open+Sans:400&#41;;&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#47;&#42;&#x20;Thanks&#x20;Outlook&#x20;2013!&#x20;&#42;&#47;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td,&#x20;h1,&#x20;h2,&#x20;h3&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;font-family:&#x20;&#039;Open&#x20;Sans&#039;,&#x20;&#039;Helvetica&#x20;Neue&#039;,&#x20;Arial,&#x20;sans-serif&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&lt;/style&gt;&#x0d;&#x0a;&lt;style&#x20;type=&quot;text/css&quot;&#x20;media=&quot;only&#x20;screen&#x20;and&#x20;&#40;max-width:&#x20;600px&#41;&quot;&gt;&#x0d;&#x0a;&#47;&#42;&#x20;Mobile&#x20;styles&#x20;&#42;&#47;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;@media&#x20;only&#x20;screen&#x20;and&#x20;&#40;max-width:&#x20;600px&#41;&#x20;{&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;table[class=&quot;w320&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;320px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;table[class=&quot;w300&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;300px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;table[class=&quot;w290&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;290px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class=&quot;w320&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;320px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class~=&quot;mobile-padding&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-left:&#x20;14px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-right:&#x20;14px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class*=&quot;mobile-padding-left&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-left:&#x20;14px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class*=&quot;mobile-padding-right&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-right:&#x20;14px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class*=&quot;mobile-block&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;display:&#x20;block&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;100%&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;text-align:&#x20;left&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-left:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-right:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-bottom:&#x20;15px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class*=&quot;mobile-no-padding-bottom&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-bottom:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class~=&quot;mobile-center&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;text-align:&#x20;center&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;table[class*=&quot;mobile-center-block&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;float:&#x20;none&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;margin:&#x20;0&#x20;auto&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;*[class*=&quot;mobile-hide&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;display:&#x20;none&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;height:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;line-height:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class*=&quot;mobile-border&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;border:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&lt;/style&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&#x20;align=&quot;center&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;align=&quot;center&quot;&#x20;valign=&quot;top&quot;&#x20;bgcolor=&quot;#ffffff&quot;&#x20;width=&quot;100%&quot;&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;background:&#x20;#1f1f1f;&#x20;height:&#x20;70px;&quot;&#x20;width=&quot;100%&quot;&gt;&lt;center&gt;&#x0d;&#x0a;&lt;table&#x20;class=&quot;w320&quot;&#x20;style=&quot;width:&#x20;600px;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-block&#x20;mobile-no-padding-bottom&#x20;mobile-center&quot;&#x20;style=&quot;background:&#x20;#1f1f1f;&#x20;padding:&#x20;10px&#x20;10px&#x20;10px&#x20;20px;&quot;&#x20;valign=&quot;top&quot;&#x20;width=&quot;270&quot;&gt;&lt;a&#x20;style=&quot;text-decoration:&#x20;none;&quot;&#x20;href=&quot;#&quot;&gt;&#x20;&lt;img&#x20;src=&quot;https://pandorafms.com/images/logo_pandora_email.png&quot;&#x20;alt=&quot;Your&#x20;Logo&quot;&#x20;width=&quot;200&quot;&gt;&#x20;&lt;/a&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-block&#x20;mobile-center&quot;&#x20;style=&quot;background:&#x20;#1f1f1f;&#x20;padding:&#x20;17px&#x20;15px&#x20;10px&#x20;10px;&quot;&#x20;valign=&quot;top&quot;&#x20;width=&quot;270&quot;&gt;&amp;nbsp;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/center&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;border-bottom:&#x20;1px&#x20;solid&#x20;#e7e7e7;&quot;&gt;&lt;center&#x20;style=&quot;padding-bottom:&#x20;20px;&quot;&gt;&#x0d;&#x0a;&lt;table&#x20;class=&quot;w320&quot;&#x20;style=&quot;width:&#x20;600px;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-padding&quot;&#x20;style=&quot;padding:&#x20;20px;&quot;&#x20;align=&quot;left&quot;&gt;&lt;br&#x20;class=&quot;mobile-hide&quot;&gt;&#x0d;&#x0a;&lt;h2&gt;Pandora&#x20;FMS&#x20;alert&#x20;system&lt;/h2&gt;&#x0d;&#x0a;&lt;br&gt;&#x20;Dear&#x20;customer,&lt;br&gt;&lt;br&gt;&#x20;We&#x20;have&#x20;&lt;strong&gt;bad&#x20;news&lt;/strong&gt;&#x20;for&#x20;you.&#x20;Something&#x20;is&#x20;on&#x20;&lt;strong&gt;CRITICAL&lt;/strong&gt;&#x20;status!&lt;br&gt;&#x20;&lt;br&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&#x20;bgcolor=&quot;#ffffff&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;width:&#x20;100px;&#x20;background:&#x20;#D84A38;&quot;&gt;&#x0d;&#x0a;&lt;div&gt;&lt;!--[if&#x20;mso]&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;v:rect&#x20;xmlns:v=&quot;urn:schemas-microsoft-com:vml&quot;&#x20;xmlns:w=&quot;urn:schemas-microsoft-com:office:word&quot;&#x20;href=&quot;#&quot;&#x20;style=&quot;height:33px;v-text-anchor:middle;width:100px;&quot;&#x20;stroke=&quot;f&quot;&#x20;fillcolor=&quot;#D84A38&quot;&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;w:anchorlock/&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;center&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;![endif]--&gt;&#x20;&lt;a&#x20;style=&quot;background-color:&#x20;#1f1f1f;&#x20;color:&#x20;whitesmoke;&#x20;display:&#x20;inline-block;&#x20;font-family:&#x20;sans-serif;&#x20;font-size:&#x20;13px;&#x20;font-weight:&#x20;bold;&#x20;line-height:&#x20;33px;&#x20;text-align:&#x20;center;&#x20;text-decoration:&#x20;none;&#x20;width:&#x20;250px;&#x20;-webkit-text-size-adjust:&#x20;none;&quot;&#x20;href=&quot;_homeurl_&quot;&gt;Go&#x20;to&#x20;Pandora&#x20;FMS&#x20;Console&lt;/a&gt;&#x20;&lt;!--[if&#x20;mso]&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;/center&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;/v:rect&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;![endif]--&gt;&lt;/div&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;background-color:&#x20;#ffffff;&#x20;font-size:&#x20;0;&#x20;line-height:&#x20;0;&quot;&#x20;width=&quot;281&quot;&gt;&amp;nbsp;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-hide&quot;&#x20;style=&quot;padding-top:&#x20;20px;&#x20;padding-bottom:&#x20;0;&#x20;vertical-align:&#x20;bottom;&quot;&#x20;valign=&quot;bottom&quot;&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;padding-bottom:&#x20;0px;&#x20;vertical-align:&#x20;bottom;&quot;&#x20;align=&quot;right&quot;&#x20;valign=&quot;bottom&quot;&gt;&lt;img&#x20;style=&quot;vertical-align:&#x20;bottom;&#x20;padding-bottom:&#x20;10px;&quot;&#x20;src=&quot;https://pandorafms.com/images/alerta_roja.png&quot;&#x20;alt=&quot;&quot;&#x20;width=&quot;130&quot;&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/center&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;background-color:&#x20;#f8f8f8;&#x20;border-bottom:&#x20;1px&#x20;solid&#x20;#e7e7e7;&#x20;padding-top:&#x20;10px;&quot;&#x20;valign=&quot;top&quot;&gt;&lt;center&gt;&#x0d;&#x0a;&lt;table&#x20;class=&quot;w320&quot;&#x20;style=&quot;height:&#x20;100%;&#x20;width:&#x20;600px;&quot;&#x20;border=&quot;0&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-padding&quot;&#x20;style=&quot;padding:&#x20;20px;&quot;&#x20;valign=&quot;top&quot;&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;border=&quot;0&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;padding-right:&#x20;20px;&quot;&#x20;colspan=&quot;2&quot;&gt;&lt;strong&gt;Monitoring&#x20;details&lt;/strong&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;padding-top:&#x20;25px;&#x20;width:&#x20;150px;&#x20;border-top:&#x20;1px&#x20;solid&#x20;#E7E7E7;&#x20;vertical-align:&#x20;top;&quot;&gt;&lt;strong&gt;Data&lt;/strong&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;padding-top:&#x20;25px;&#x20;padding-right:&#x20;20px;&#x20;border-top:&#x20;1px&#x20;solid&#x20;#E7E7E7;&#x20;vertical-align:&#x20;top;&quot;&gt;_data_&#x20;&lt;em&gt;&#40;_modulestatus_&#41;&lt;/em&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&gt;&lt;strong&gt;Agent&lt;/strong&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;td&gt;_agent_&#x20;&lt;em&gt;_address_&lt;/em&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&gt;&lt;strong&gt;Module&lt;/strong&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;td&gt;_module_&#x20;&lt;em&gt;_moduledescription_&#x20;&lt;/em&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&gt;&lt;strong&gt;Timestamp&lt;/strong&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;td&gt;_timestamp_&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;padding-top:&#x20;20px;&quot;&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;vertical-align:&#x20;top;&quot;&#x20;width=&quot;350&quot;&gt;This&#x20;is&#x20;a&#x20;graph&#x20;of&#x20;latest&#x20;24hr&#x20;data&#x20;for&#x20;this&#x20;module:&#x20;&lt;br&gt;&lt;br&gt;&#x20;_modulegraph_24h_&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/center&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;background-color:&#x20;#1f1f1f;&quot;&gt;&lt;center&gt;&#x0d;&#x0a;&lt;table&#x20;class=&quot;w320&quot;&#x20;style=&quot;height:&#x20;100%;&#x20;color:&#x20;#ffffff;&#x20;width:&#x20;600px;&quot;&#x20;border=&quot;0&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&#x20;bgcolor=&quot;#1f1f1f&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-padding&quot;&#x20;style=&quot;font-size:&#x20;12px;&#x20;padding:&#x20;20px;&#x20;background-color:&#x20;#1f1f1f;&#x20;color:&#x20;#ffffff;&#x20;text-align:&#x20;center;&quot;&#x20;align=&quot;right&quot;&#x20;valign=&quot;middle&quot;&gt;&lt;a&#x20;style=&quot;color:&#x20;#ffffff;&quot;&#x20;href=&quot;https://pandorafms.com/company/contact/&quot;&gt;Contact&#x20;Us&lt;/a&gt;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&#x20;&lt;a&#x20;style=&quot;color:&#x20;#ffffff;&quot;&#x20;href=&quot;https://forums.pandorafms.com/&quot;&gt;Support&lt;/a&gt;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&#x20;&lt;a&#x20;style=&quot;color:&#x20;#ffffff;&quot;&#x20;href=&quot;https://wiki.pandorafms.com&quot;&gt;Docs&lt;/a&gt;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/center&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;','','','','','','','','','','','','',0,0,'','','&lt;style&#x20;type=&quot;text/css&quot;&gt;&lt;!--&#x0d;&#x0a;&#47;&#42;&#x20;Take&#x20;care&#x20;of&#x20;image&#x20;borders&#x20;and&#x20;formatting&#x20;&#42;&#47;&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;img&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;max-width:&#x20;600px;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;outline:&#x20;none;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;text-decoration:&#x20;none;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;-ms-interpolation-mode:&#x20;bicubic;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;a&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;border:&#x20;0;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;outline:&#x20;none;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;a&#x20;img&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;border:&#x20;none;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#47;&#42;&#x20;General&#x20;styling&#x20;&#42;&#47;&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;td,&#x20;h1,&#x20;h2,&#x20;h3&#x20;&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-family:&#x20;Helvetica,&#x20;Arial,&#x20;sans-serif;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-weight:&#x20;400;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;td&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;14px;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;line-height:&#x20;150%;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;text-align:&#x20;left;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;body&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;-webkit-font-smoothing:antialiased;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;-webkit-text-size-adjust:none;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;width:&#x20;100%;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;height:&#x20;100%;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;color:&#x20;#37302d;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;background:&#x20;#ffffff;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;table&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;border-collapse:&#x20;collapse&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;h1,&#x20;h2,&#x20;h3&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;padding:&#x20;0;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;margin:&#x20;0;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;color:&#x20;#444444;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-weight:&#x20;400;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;line-height:&#x20;110%;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;h1&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;35px;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;h2&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;30px;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;h3&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;24px;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;h4&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;18px;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-weight:&#x20;normal;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;.important-font&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;color:&#x20;#21BEB4;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-weight:&#x20;bold;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;.hide&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;display:&#x20;none&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;.force-full-width&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;width:&#x20;100%&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;--&gt;&lt;/style&gt;&#x0d;&#x0a;&lt;style&#x20;type=&quot;text/css&quot;&#x20;media=&quot;screen&quot;&gt;&lt;!--&#x0d;&#x0a;@media&#x20;screen&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;@import&#x20;url&#40;http://fonts.googleapis.com/css?family=Open+Sans:400&#41;;&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#47;&#42;&#x20;Thanks&#x20;Outlook&#x20;2013!&#x20;&#42;&#47;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td,&#x20;h1,&#x20;h2,&#x20;h3&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;font-family:&#x20;&#039;Open&#x20;Sans&#039;,&#x20;&#039;Helvetica&#x20;Neue&#039;,&#x20;Arial,&#x20;sans-serif&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;--&gt;&lt;/style&gt;&#x0d;&#x0a;&lt;style&#x20;type=&quot;text/css&quot;&#x20;media=&quot;only&#x20;screen&#x20;and&#x20;&#40;max-width:&#x20;600px&#41;&quot;&gt;&lt;!--&#x0d;&#x0a;&#47;&#42;&#x20;Mobile&#x20;styles&#x20;&#42;&#47;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;@media&#x20;only&#x20;screen&#x20;and&#x20;&#40;max-width:&#x20;600px&#41;&#x20;{&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;table[class=&quot;w320&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;320px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;table[class=&quot;w300&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;300px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;table[class=&quot;w290&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;290px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class=&quot;w320&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;320px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class~=&quot;mobile-padding&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-left:&#x20;14px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-right:&#x20;14px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class*=&quot;mobile-padding-left&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-left:&#x20;14px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class*=&quot;mobile-padding-right&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-right:&#x20;14px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class*=&quot;mobile-block&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;display:&#x20;block&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;100%&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;text-align:&#x20;left&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-left:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-right:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-bottom:&#x20;15px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class*=&quot;mobile-no-padding-bottom&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-bottom:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class~=&quot;mobile-center&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;text-align:&#x20;center&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;table[class*=&quot;mobile-center-block&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;float:&#x20;none&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;margin:&#x20;0&#x20;auto&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;*[class*=&quot;mobile-hide&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;display:&#x20;none&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;height:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;line-height:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class*=&quot;mobile-border&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;border:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;--&gt;&lt;/style&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&#x20;align=&quot;center&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;align=&quot;center&quot;&#x20;valign=&quot;top&quot;&#x20;bgcolor=&quot;#ffffff&quot;&#x20;width=&quot;100%&quot;&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;background:&#x20;#1f1f1f;&#x20;height:&#x20;70px;&quot;&#x20;width=&quot;100%&quot;&gt;&lt;center&gt;&#x0d;&#x0a;&lt;table&#x20;class=&quot;w320&quot;&#x20;style=&quot;width:&#x20;600px;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-block&#x20;mobile-no-padding-bottom&#x20;mobile-center&quot;&#x20;style=&quot;background:&#x20;#1f1f1f;&#x20;padding:&#x20;10px&#x20;10px&#x20;10px&#x20;20px;&quot;&#x20;valign=&quot;top&quot;&#x20;width=&quot;270&quot;&gt;&lt;a&#x20;style=&quot;text-decoration:&#x20;none;&quot;&#x20;href=&quot;#&quot;&gt;&#x20;&lt;img&#x20;src=&quot;https://pandorafms.com/images/logo_pandora_email.png&quot;&#x20;alt=&quot;Your&#x20;Logo&quot;&#x20;width=&quot;200&quot;&gt;&#x20;&lt;/a&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-block&#x20;mobile-center&quot;&#x20;style=&quot;background:&#x20;#1f1f1f;&#x20;padding:&#x20;17px&#x20;15px&#x20;10px&#x20;10px;&quot;&#x20;valign=&quot;top&quot;&#x20;width=&quot;270&quot;&gt;&amp;nbsp;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/center&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;border-bottom:&#x20;1px&#x20;solid&#x20;#e7e7e7;&quot;&gt;&lt;center&#x20;style=&quot;padding-bottom:&#x20;20px;&quot;&gt;&#x0d;&#x0a;&lt;table&#x20;class=&quot;w320&quot;&#x20;style=&quot;width:&#x20;600px;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-padding&quot;&#x20;style=&quot;padding:&#x20;20px;&quot;&#x20;align=&quot;left&quot;&gt;&lt;br&#x20;class=&quot;mobile-hide&quot;&gt;&#x0d;&#x0a;&lt;h2&gt;Pandora&#x20;FMS&#x20;alert&#x20;system&lt;/h2&gt;&#x0d;&#x0a;&lt;br&gt;&#x20;Dear&#x20;customer,&lt;br&gt;&lt;br&gt;&#x20;We&#x20;have&#x20;&lt;strong&gt;good&#x20;news&lt;/strong&gt;&#x20;for&#x20;you.&#x20;Alert&#x20;has&#x20;been&#x20;&lt;strong&gt;RECOVERED&lt;/strong&gt;&amp;nbsp;status!&lt;br&gt;&#x20;&lt;br&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&#x20;bgcolor=&quot;#ffffff&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;width:&#x20;100px;&#x20;background:&#x20;#D84A38;&quot;&gt;&#x0d;&#x0a;&lt;div&gt;&lt;!--[if&#x20;mso]&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;v:rect&#x20;xmlns:v=&quot;urn:schemas-microsoft-com:vml&quot;&#x20;xmlns:w=&quot;urn:schemas-microsoft-com:office:word&quot;&#x20;href=&quot;#&quot;&#x20;style=&quot;height:33px;v-text-anchor:middle;width:100px;&quot;&#x20;stroke=&quot;f&quot;&#x20;fillcolor=&quot;#D84A38&quot;&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;w:anchorlock/&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;center&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;![endif]--&gt;&#x20;&lt;a&#x20;style=&quot;background-color:&#x20;#1f1f1f;&#x20;color:&#x20;whitesmoke;&#x20;display:&#x20;inline-block;&#x20;font-family:&#x20;sans-serif;&#x20;font-size:&#x20;13px;&#x20;font-weight:&#x20;bold;&#x20;line-height:&#x20;33px;&#x20;text-align:&#x20;center;&#x20;text-decoration:&#x20;none;&#x20;width:&#x20;250px;&#x20;-webkit-text-size-adjust:&#x20;none;&quot;&#x20;href=&quot;_homeurl_&quot;&gt;Go&#x20;to&#x20;Pandora&#x20;FMS&#x20;Console&lt;/a&gt;&#x20;&lt;!--[if&#x20;mso]&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;/center&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;/v:rect&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;![endif]--&gt;&lt;/div&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;background-color:&#x20;#ffffff;&#x20;font-size:&#x20;0;&#x20;line-height:&#x20;0;&quot;&#x20;width=&quot;281&quot;&gt;&amp;nbsp;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-hide&quot;&#x20;style=&quot;padding-top:&#x20;20px;&#x20;padding-bottom:&#x20;0;&#x20;vertical-align:&#x20;bottom;&quot;&#x20;valign=&quot;bottom&quot;&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;padding-bottom:&#x20;0px;&#x20;vertical-align:&#x20;bottom;&quot;&#x20;align=&quot;right&quot;&#x20;valign=&quot;bottom&quot;&gt;&lt;img&#x20;style=&quot;vertical-align:&#x20;bottom;&#x20;padding-bottom:&#x20;10px;&quot;&#x20;src=&quot;https://pandorafms.com/images/alerta_verde.png&quot;&#x20;alt=&quot;&quot;&#x20;width=&quot;130&quot;&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/center&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;background-color:&#x20;#f8f8f8;&#x20;border-bottom:&#x20;1px&#x20;solid&#x20;#e7e7e7;&#x20;padding-top:&#x20;10px;&quot;&#x20;valign=&quot;top&quot;&gt;&lt;center&gt;&#x0d;&#x0a;&lt;table&#x20;class=&quot;w320&quot;&#x20;style=&quot;height:&#x20;100%;&#x20;width:&#x20;600px;&quot;&#x20;border=&quot;0&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-padding&quot;&#x20;style=&quot;padding:&#x20;20px;&quot;&#x20;valign=&quot;top&quot;&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;border=&quot;0&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;padding-right:&#x20;20px;&quot;&#x20;colspan=&quot;2&quot;&gt;&lt;strong&gt;Monitoring&#x20;details&lt;/strong&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;padding-top:&#x20;25px;&#x20;width:&#x20;150px;&#x20;border-top:&#x20;1px&#x20;solid&#x20;#E7E7E7;&#x20;vertical-align:&#x20;top;&quot;&gt;&lt;strong&gt;Data&lt;/strong&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;padding-top:&#x20;25px;&#x20;padding-right:&#x20;20px;&#x20;border-top:&#x20;1px&#x20;solid&#x20;#E7E7E7;&#x20;vertical-align:&#x20;top;&quot;&gt;_data_&#x20;&lt;em&gt;&#40;_modulestatus_&#41;&lt;/em&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&gt;&lt;strong&gt;Agent&lt;/strong&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;td&gt;_agent_&#x20;&lt;em&gt;_address_&lt;/em&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&gt;&lt;strong&gt;Module&lt;/strong&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;td&gt;_module_&#x20;&lt;em&gt;_moduledescription_&#x20;&lt;/em&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&gt;&lt;strong&gt;Timestamp&lt;/strong&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;td&gt;_timestamp_&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;padding-top:&#x20;20px;&quot;&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;vertical-align:&#x20;top;&quot;&#x20;width=&quot;350&quot;&gt;This&#x20;is&#x20;a&#x20;graph&#x20;of&#x20;latest&#x20;24hr&#x20;data&#x20;for&#x20;this&#x20;module:&#x20;&lt;br&gt;&lt;br&gt;&#x20;_modulegraph_24h_&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/center&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;background-color:&#x20;#1f1f1f;&quot;&gt;&lt;center&gt;&#x0d;&#x0a;&lt;table&#x20;class=&quot;w320&quot;&#x20;style=&quot;height:&#x20;100%;&#x20;color:&#x20;#ffffff;&#x20;width:&#x20;600px;&quot;&#x20;border=&quot;0&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&#x20;bgcolor=&quot;#1f1f1f&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-padding&quot;&#x20;style=&quot;font-size:&#x20;12px;&#x20;padding:&#x20;20px;&#x20;background-color:&#x20;#1f1f1f;&#x20;color:&#x20;#ffffff;&#x20;text-align:&#x20;center;&quot;&#x20;align=&quot;right&quot;&#x20;valign=&quot;middle&quot;&gt;&lt;a&#x20;style=&quot;color:&#x20;#ffffff;&quot;&#x20;href=&quot;https://pandorafms.com/company/contact/&quot;&gt;Contact&#x20;Us&lt;/a&gt;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&#x20;&lt;a&#x20;style=&quot;color:&#x20;#ffffff;&quot;&#x20;href=&quot;https://forums.pandorafms.com/&quot;&gt;Support&lt;/a&gt;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&#x20;&lt;a&#x20;style=&quot;color:&#x20;#ffffff;&quot;&#x20;href=&quot;https://wiki.pandorafms.com&quot;&gt;Docs&lt;/a&gt;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/center&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;','text/html','','','','','','','','','','','',NULL),(2,'Restart&#x20;agent',12,'REFRESH AGENT *','','','','','','','','','','','','','','',0,0,'','','','','','','','','','','','','','','',NULL),(3,'Monitoring&#x20;Event',3,'_agent_&#x20;_module_&#x20;generated&#x20;an&#x20;event&#x20;alert&#x20;&#40;_data_&#41;','alert_fired','pandora','','4','','','','','','','','','','',0,0,'RECOVERED:&#x20;_agent_&#x20;_module_&#x20;generated&#x20;event&#x20;alert&#x20;&#40;_data_&#41;','alert_ceased','pandora','','4','','','','','','','','','','',NULL);
/*!40000 ALTER TABLE `talert_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talert_commands`
--

DROP TABLE IF EXISTS `talert_commands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `talert_commands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `command` text,
  `id_group` mediumint(8) unsigned DEFAULT '0',
  `description` text,
  `internal` tinyint(1) DEFAULT '0',
  `fields_descriptions` text,
  `fields_values` text,
  `fields_hidden` text,
  `previous_name` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talert_commands`
--

LOCK TABLES `talert_commands` WRITE;
/*!40000 ALTER TABLE `talert_commands` DISABLE KEYS */;
INSERT INTO `talert_commands` VALUES (1,'eMail','Internal&#x20;type',0,'This&#x20;alert&#x20;send&#x20;an&#x20;email&#x20;using&#x20;internal&#x20;Server&#x20;SMTP&#x20;capabilities&#x20;&#40;defined&#x20;in&#x20;each&#x20;server,&#x20;using:&#x0d;&#x0a;_field1_&#x20;as&#x20;destination&#x20;email&#x20;address,&#x20;and&#x0d;&#x0a;_field2_&#x20;as&#x20;subject&#x20;for&#x20;message.&#x20;&#x0d;&#x0a;_field3_&#x20;as&#x20;text&#x20;of&#x20;message.&#x20;&#x0d;&#x0a;_field4_&#x20;as&#x20;content&#x20;type&#x20;&#40;plain/text&#x20;or&#x20;html/text&#41;.',1,'[\"Destination&#x20;address\",\"Subject\",\"Text\",\"Content&#x20;Type\",\"\",\"\",\"\",\"\",\"\",\"\"]','[\"\",\"\",\"_html_editor_\",\"_content_type_\",\"\",\"\",\"\",\"\",\"\",\"\"]',NULL,NULL),(2,'Internal&#x20;Audit','Internal&#x20;type',0,'This&#x20;alert&#x20;save&#x20;alert&#x20;in&#x20;internal&#x20;audit&#x20;system.&#x20;Fields&#x20;are&#x20;static&#x20;and&#x20;only&#x20;_field1_&#x20;is&#x20;used.',1,'[\"Description\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]','[\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]',NULL,NULL),(3,'Monitoring&#x20;Event','Internal&#x20;type',0,'This&#x20;alert&#x20;create&#x20;an&#x20;special&#x20;event&#x20;into&#x20;event&#x20;manager.',1,'[\"Event&#x20;text\",\"Event&#x20;type\",\"Source\",\"Agent&#x20;name&#x20;or&#x20;_agent_\",\"Event&#x20;criticity\",\"ID&#x20;extra\",\"Tags&#x20;separated&#x20;by&#x20;commas\",\"Comments\",\"\",\"\"]','[\"\",\"alert_ceased,Alert&#x20;ceased;alert_fired,Alert&#x20;fired;alert_manual_validation,Alert&#x20;manual&#x20;validation;alert_recovered,Alert&#x20;recovered;configuration_change,Configuration&#x20;change&#x20;;error,Error;critical,Monitor&#x20;Critical;normal,Monitor&#x20;Normal;going_unknown,Monitor\",\"\",\"\",\"4,Critical;1,Informational;0,Maintenance;6,Major;5,Minor;2,Normal;3,Warning\",\"\",\"\",\"\",\"\",\"\"]',NULL,NULL),(4,'Alertlog','echo&#x20;_timestamp_&#x20;pandora&#x20;_agent_&#x20;_data_&#x20;_field1_&#x20;_field2_&#x20;&gt;&gt;&#x20;/var/log/pandora/pandora_alert.log',0,'This&#x20;is&#x20;a&#x20;default&#x20;alert&#x20;to&#x20;write&#x20;alerts&#x20;in&#x20;a&#x20;standard&#x20;ASCII&#x20;&#x20;plaintext&#x20;log&#x20;file&#x20;in&#x20;/var/log/pandora/pandora_alert.log&#x0d;&#x0a;',0,'[\"Log&#x20;Info&#x20;1\",\"Log&#x20;Info&#x20;2\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]','[\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]',NULL,NULL),(5,'SNMP&#x20;Trap','/usr/bin/snmptrap&#x20;-v&#x20;1&#x20;-c&#x20;_field1_&#x20;_field2_&#x20;_field3_&#x20;_field4_',0,'Send&#x20;a&#x20;SNMPTRAP&#x20;to&#x20;192.168.0.4.&#x20;Please&#x20;review&#x20;config&#x20;and&#x20;adapt&#x20;to&#x20;your&#x20;needs,&#x20;this&#x20;is&#x20;only&#x20;a&#x20;sample,&#x20;not&#x20;functional&#x20;itself.',0,'[\"Community\",\"Destination&#x20;address\",\"OID\",\"Source&#x20;address\",\"\",\"\",\"\",\"\",\"\",\"\"]','[\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]',NULL,NULL),(6,'Syslog','logger&#x20;-p&#x20;daemon.alert&#x20;Pandora&#x20;Alert&#x20;_agent_&#x20;_data_&#x20;_field1_&#x20;_field2_',0,'Uses&#x20;field1&#x20;and&#x20;field2&#x20;to&#x20;generate&#x20;Syslog&#x20;alert&#x20;in&#x20;facility&#x20;daemon&#x20;with&#x20;&quot;alert&quot;&#x20;level.',0,'[\"Log&#x20;Info&#x20;1\",\"Log&#x20;Info&#x20;2\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]','[\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]',NULL,NULL),(7,'Sound Alert','/usr/bin/play /usr/share/sounds/alarm.wav',0,'',0,NULL,NULL,NULL,NULL),(8,'Jabber&#x20;Alert','echo&#x20;_field3_&#x20;|&#x20;sendxmpp&#x20;-r&#x20;_field1_&#x20;--chatroom&#x20;_field2_',0,'Send&#x20;jabber&#x20;alert&#x20;to&#x20;chat&#x20;room&#x20;in&#x20;a&#x20;predefined&#x20;server&#x20;&#40;configure&#x20;first&#x20;.sendxmpprc&#x20;file&#41;.&#x20;Uses&#x20;field3&#x20;as&#x20;text&#x20;message,&#x20;field1&#x20;as&#x20;useralias&#x20;for&#x20;source&#x20;message,&#x20;and&#x20;field2&#x20;for&#x20;chatroom&#x20;name',0,'[\"User&#x20;alias\",\"Chatroom&#x20;name\",\"Message\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]','[\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]',NULL,NULL),(9,'SMS','sendsms&#x20;_field1_&#x20;_field2_',0,'Send&#x20;SMS&#x20;using&#x20;the&#x20;standard&#x20;SMS&#x20;device,&#x20;using&#x20;smstools.&#x20;&#x20;Uses&#x20;field2&#x20;as&#x20;text&#x20;message,&#x20;field1&#x20;as&#x20;destination&#x20;phone&#x20;&#40;include&#x20;international&#x20;prefix!&#41;',0,'[\"Destination&#x20;number\",\"Message\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]','[\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]',NULL,NULL),(10,'Validate&#x20;Event','Internal&#x20;type',0,'This&#x20;alert&#x20;validate&#x20;the&#x20;events&#x20;matched&#x20;with&#x20;a&#x20;module&#x20;given&#x20;the&#x20;agent&#x20;name&#x20;&#40;_field1_&#41;&#x20;and&#x20;module&#x20;name&#x20;&#40;_field2_&#41;',1,'[\"Agent&#x20;name\",\"Module&#x20;name\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]','[\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]',NULL,NULL),(12,'Remote&#x20;agent&#x20;control','/usr/share/pandora_server/util/udp_client.pl&#x20;_address_&#x20;41122&#x20;&quot;_field1_&quot;',0,'This&#x20;command&#x20;is&#x20;used&#x20;to&#x20;send&#x20;commands&#x20;to&#x20;the&#x20;agents&#x20;with&#x20;the&#x20;UDP&#x20;server&#x20;enabled.&#x20;The&#x20;UDP&#x20;server&#x20;is&#x20;used&#x20;to&#x20;order&#x20;agents&#x20;&#40;Windows&#x20;and&#x20;UNIX&#41;&#x20;to&#x20;&quot;refresh&quot;&#x20;the&#x20;agent&#x20;execution:&#x20;that&#x20;means,&#x20;to&#x20;force&#x20;the&#x20;agent&#x20;to&#x20;execute&#x20;and&#x20;send&#x20;data',0,'[\"Command\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]','[\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]',NULL,NULL),(13,'Generate&#x20;Notification','Internal&#x20;type',0,'This&#x20;command&#x20;allows&#x20;you&#x20;to&#x20;send&#x20;an&#x20;internal&#x20;notification&#x20;to&#x20;any&#x20;user&#x20;or&#x20;group.',1,'[\"Destination&#x20;user\",\"Destination&#x20;group\",\"Title\",\"Message\",\"Link\",\"Criticity\",\"\",\"\",\"\",\"\",\"\"]','[\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]',NULL,NULL);
/*!40000 ALTER TABLE `talert_commands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talert_snmp`
--

DROP TABLE IF EXISTS `talert_snmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `talert_snmp` (
  `id_as` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_alert` int(10) unsigned NOT NULL DEFAULT '0',
  `al_field1` text NOT NULL,
  `al_field2` text NOT NULL,
  `al_field3` text NOT NULL,
  `al_field4` text NOT NULL,
  `al_field5` text NOT NULL,
  `al_field6` text NOT NULL,
  `al_field7` text NOT NULL,
  `al_field8` text NOT NULL,
  `al_field9` text NOT NULL,
  `al_field10` text NOT NULL,
  `al_field11` text NOT NULL,
  `al_field12` text NOT NULL,
  `al_field13` text NOT NULL,
  `al_field14` text NOT NULL,
  `al_field15` text NOT NULL,
  `description` varchar(255) DEFAULT '',
  `alert_type` int(2) unsigned NOT NULL DEFAULT '0',
  `agent` varchar(100) DEFAULT '',
  `custom_oid` text,
  `oid` varchar(255) NOT NULL DEFAULT '',
  `time_threshold` int(11) NOT NULL DEFAULT '0',
  `times_fired` int(2) unsigned NOT NULL DEFAULT '0',
  `last_fired` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `max_alerts` int(11) NOT NULL DEFAULT '1',
  `min_alerts` int(11) NOT NULL DEFAULT '1',
  `internal_counter` int(2) unsigned NOT NULL DEFAULT '0',
  `priority` tinyint(4) DEFAULT '0',
  `_snmp_f1_` text,
  `_snmp_f2_` text,
  `_snmp_f3_` text,
  `_snmp_f4_` text,
  `_snmp_f5_` text,
  `_snmp_f6_` text,
  `_snmp_f7_` text,
  `_snmp_f8_` text,
  `_snmp_f9_` text,
  `_snmp_f10_` text,
  `_snmp_f11_` text,
  `_snmp_f12_` text,
  `_snmp_f13_` text,
  `_snmp_f14_` text,
  `_snmp_f15_` text,
  `_snmp_f16_` text,
  `_snmp_f17_` text,
  `_snmp_f18_` text,
  `_snmp_f19_` text,
  `_snmp_f20_` text,
  `trap_type` int(11) NOT NULL DEFAULT '-1',
  `single_value` varchar(255) DEFAULT '',
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `disable_event` tinyint(1) DEFAULT '0',
  `id_group` int(10) unsigned NOT NULL DEFAULT '0',
  `order_1` int(10) unsigned NOT NULL DEFAULT '1',
  `order_2` int(10) unsigned NOT NULL DEFAULT '2',
  `order_3` int(10) unsigned NOT NULL DEFAULT '3',
  `order_4` int(10) unsigned NOT NULL DEFAULT '4',
  `order_5` int(10) unsigned NOT NULL DEFAULT '5',
  `order_6` int(10) unsigned NOT NULL DEFAULT '6',
  `order_7` int(10) unsigned NOT NULL DEFAULT '7',
  `order_8` int(10) unsigned NOT NULL DEFAULT '8',
  `order_9` int(10) unsigned NOT NULL DEFAULT '9',
  `order_10` int(10) unsigned NOT NULL DEFAULT '10',
  `order_11` int(10) unsigned NOT NULL DEFAULT '11',
  `order_12` int(10) unsigned NOT NULL DEFAULT '12',
  `order_13` int(10) unsigned NOT NULL DEFAULT '13',
  `order_14` int(10) unsigned NOT NULL DEFAULT '14',
  `order_15` int(10) unsigned NOT NULL DEFAULT '15',
  `order_16` int(10) unsigned NOT NULL DEFAULT '16',
  `order_17` int(10) unsigned NOT NULL DEFAULT '17',
  `order_18` int(10) unsigned NOT NULL DEFAULT '18',
  `order_19` int(10) unsigned NOT NULL DEFAULT '19',
  `order_20` int(10) unsigned NOT NULL DEFAULT '20',
  PRIMARY KEY (`id_as`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talert_snmp`
--

LOCK TABLES `talert_snmp` WRITE;
/*!40000 ALTER TABLE `talert_snmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `talert_snmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talert_snmp_action`
--

DROP TABLE IF EXISTS `talert_snmp_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `talert_snmp_action` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_alert_snmp` int(10) unsigned NOT NULL DEFAULT '0',
  `alert_type` int(2) unsigned NOT NULL DEFAULT '0',
  `al_field1` text NOT NULL,
  `al_field2` text NOT NULL,
  `al_field3` text NOT NULL,
  `al_field4` text NOT NULL,
  `al_field5` text NOT NULL,
  `al_field6` text NOT NULL,
  `al_field7` text NOT NULL,
  `al_field8` text NOT NULL,
  `al_field9` text NOT NULL,
  `al_field10` text NOT NULL,
  `al_field11` text NOT NULL,
  `al_field12` text NOT NULL,
  `al_field13` text NOT NULL,
  `al_field14` text NOT NULL,
  `al_field15` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talert_snmp_action`
--

LOCK TABLES `talert_snmp_action` WRITE;
/*!40000 ALTER TABLE `talert_snmp_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `talert_snmp_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talert_special_days`
--

DROP TABLE IF EXISTS `talert_special_days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `talert_special_days` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_group` int(10) NOT NULL DEFAULT '0',
  `date` date NOT NULL DEFAULT '1970-01-01',
  `same_day` enum('monday','tuesday','wednesday','thursday','friday','saturday','sunday') NOT NULL DEFAULT 'sunday',
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talert_special_days`
--

LOCK TABLES `talert_special_days` WRITE;
/*!40000 ALTER TABLE `talert_special_days` DISABLE KEYS */;
/*!40000 ALTER TABLE `talert_special_days` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talert_template_module_actions`
--

DROP TABLE IF EXISTS `talert_template_module_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `talert_template_module_actions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_alert_template_module` int(10) unsigned NOT NULL,
  `id_alert_action` int(10) unsigned NOT NULL,
  `fires_min` int(3) unsigned DEFAULT '0',
  `fires_max` int(3) unsigned DEFAULT '0',
  `module_action_threshold` int(10) NOT NULL DEFAULT '0',
  `last_execution` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_alert_template_module` (`id_alert_template_module`),
  KEY `id_alert_action` (`id_alert_action`),
  CONSTRAINT `talert_template_module_actions_ibfk_1` FOREIGN KEY (`id_alert_template_module`) REFERENCES `talert_template_modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `talert_template_module_actions_ibfk_2` FOREIGN KEY (`id_alert_action`) REFERENCES `talert_actions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talert_template_module_actions`
--

LOCK TABLES `talert_template_module_actions` WRITE;
/*!40000 ALTER TABLE `talert_template_module_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `talert_template_module_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talert_template_modules`
--

DROP TABLE IF EXISTS `talert_template_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `talert_template_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_agent_module` int(10) unsigned NOT NULL,
  `id_alert_template` int(10) unsigned NOT NULL,
  `id_policy_alerts` int(10) unsigned NOT NULL DEFAULT '0',
  `internal_counter` int(4) DEFAULT '0',
  `last_fired` bigint(20) NOT NULL DEFAULT '0',
  `last_reference` bigint(20) NOT NULL DEFAULT '0',
  `times_fired` int(3) NOT NULL DEFAULT '0',
  `disabled` tinyint(1) DEFAULT '0',
  `standby` tinyint(1) DEFAULT '0',
  `priority` tinyint(4) DEFAULT '0',
  `force_execution` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_agent_module` (`id_agent_module`,`id_alert_template`),
  KEY `idx_template_module` (`id_agent_module`),
  KEY `id_alert_template` (`id_alert_template`),
  KEY `force_execution` (`force_execution`),
  CONSTRAINT `talert_template_modules_ibfk_1` FOREIGN KEY (`id_agent_module`) REFERENCES `tagente_modulo` (`id_agente_modulo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `talert_template_modules_ibfk_2` FOREIGN KEY (`id_alert_template`) REFERENCES `talert_templates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talert_template_modules`
--

LOCK TABLES `talert_template_modules` WRITE;
/*!40000 ALTER TABLE `talert_template_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `talert_template_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talert_templates`
--

DROP TABLE IF EXISTS `talert_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `talert_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text,
  `description` mediumtext,
  `id_alert_action` int(10) unsigned DEFAULT NULL,
  `field1` text NOT NULL,
  `field2` text NOT NULL,
  `field3` text NOT NULL,
  `field4` text NOT NULL,
  `field5` text NOT NULL,
  `field6` text NOT NULL,
  `field7` text NOT NULL,
  `field8` text NOT NULL,
  `field9` text NOT NULL,
  `field10` text NOT NULL,
  `field11` text NOT NULL,
  `field12` text NOT NULL,
  `field13` text NOT NULL,
  `field14` text NOT NULL,
  `field15` text NOT NULL,
  `type` enum('regex','max_min','max','min','equal','not_equal','warning','critical','onchange','unknown','always','not_normal') DEFAULT NULL,
  `value` varchar(255) DEFAULT '',
  `matches_value` tinyint(1) DEFAULT '0',
  `max_value` double(18,2) DEFAULT NULL,
  `min_value` double(18,2) DEFAULT NULL,
  `time_threshold` int(10) NOT NULL DEFAULT '0',
  `max_alerts` int(4) unsigned NOT NULL DEFAULT '1',
  `min_alerts` int(4) unsigned NOT NULL DEFAULT '0',
  `time_from` time DEFAULT '00:00:00',
  `time_to` time DEFAULT '00:00:00',
  `monday` tinyint(1) DEFAULT '1',
  `tuesday` tinyint(1) DEFAULT '1',
  `wednesday` tinyint(1) DEFAULT '1',
  `thursday` tinyint(1) DEFAULT '1',
  `friday` tinyint(1) DEFAULT '1',
  `saturday` tinyint(1) DEFAULT '1',
  `sunday` tinyint(1) DEFAULT '1',
  `recovery_notify` tinyint(1) DEFAULT '0',
  `field1_recovery` text NOT NULL,
  `field2_recovery` text NOT NULL,
  `field3_recovery` text NOT NULL,
  `field4_recovery` text NOT NULL,
  `field5_recovery` text NOT NULL,
  `field6_recovery` text NOT NULL,
  `field7_recovery` text NOT NULL,
  `field8_recovery` text NOT NULL,
  `field9_recovery` text NOT NULL,
  `field10_recovery` text NOT NULL,
  `field11_recovery` text NOT NULL,
  `field12_recovery` text NOT NULL,
  `field13_recovery` text NOT NULL,
  `field14_recovery` text NOT NULL,
  `field15_recovery` text NOT NULL,
  `priority` tinyint(4) DEFAULT '0',
  `id_group` mediumint(8) unsigned DEFAULT '0',
  `special_day` tinyint(1) DEFAULT '0',
  `wizard_level` enum('basic','advanced','nowizard') DEFAULT 'nowizard',
  `min_alerts_reset_counter` tinyint(1) DEFAULT '0',
  `disable_event` tinyint(1) DEFAULT '0',
  `previous_name` text,
  PRIMARY KEY (`id`),
  KEY `idx_template_action` (`id_alert_action`),
  CONSTRAINT `talert_templates_ibfk_1` FOREIGN KEY (`id_alert_action`) REFERENCES `talert_actions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talert_templates`
--

LOCK TABLES `talert_templates` WRITE;
/*!40000 ALTER TABLE `talert_templates` DISABLE KEYS */;
INSERT INTO `talert_templates` VALUES (1,'Critical&#x20;condition','This is a generic alert template to fire on condition CRITICAL',1,'','','&lt;style&#x20;type=&quot;text/css&quot;&gt;&#x0d;&#x0a;&#47;&#42;&#x20;Take&#x20;care&#x20;of&#x20;image&#x20;borders&#x20;and&#x20;formatting&#x20;&#42;&#47;&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;img&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;max-width:&#x20;600px;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;outline:&#x20;none;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;text-decoration:&#x20;none;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;-ms-interpolation-mode:&#x20;bicubic;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;a&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;border:&#x20;0;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;outline:&#x20;none;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;a&#x20;img&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;border:&#x20;none;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#47;&#42;&#x20;General&#x20;styling&#x20;&#42;&#47;&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;td,&#x20;h1,&#x20;h2,&#x20;h3&#x20;&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-family:&#x20;Helvetica,&#x20;Arial,&#x20;sans-serif;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-weight:&#x20;400;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;td&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;14px;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;line-height:&#x20;150%;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;text-align:&#x20;left;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;body&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;-webkit-font-smoothing:antialiased;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;-webkit-text-size-adjust:none;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;width:&#x20;100%;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;height:&#x20;100%;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;color:&#x20;#37302d;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;background:&#x20;#ffffff;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;table&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;border-collapse:&#x20;collapse&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;h1,&#x20;h2,&#x20;h3&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;padding:&#x20;0;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;margin:&#x20;0;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;color:&#x20;#444444;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-weight:&#x20;400;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;line-height:&#x20;110%;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;h1&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;35px;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;h2&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;30px;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;h3&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;24px;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;h4&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;18px;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-weight:&#x20;normal;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;.important-font&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;color:&#x20;#21BEB4;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-weight:&#x20;bold;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;.hide&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;display:&#x20;none&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;.force-full-width&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;width:&#x20;100%&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&lt;/style&gt;&#x0d;&#x0a;&lt;style&#x20;type=&quot;text/css&quot;&#x20;media=&quot;screen&quot;&gt;&#x0d;&#x0a;@media&#x20;screen&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;@import&#x20;url&#40;http://fonts.googleapis.com/css?family=Open+Sans:400&#41;;&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#47;&#42;&#x20;Thanks&#x20;Outlook&#x20;2013!&#x20;&#42;&#47;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td,&#x20;h1,&#x20;h2,&#x20;h3&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;font-family:&#x20;&#039;Open&#x20;Sans&#039;,&#x20;&#039;Helvetica&#x20;Neue&#039;,&#x20;Arial,&#x20;sans-serif&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&lt;/style&gt;&#x0d;&#x0a;&lt;style&#x20;type=&quot;text/css&quot;&#x20;media=&quot;only&#x20;screen&#x20;and&#x20;&#40;max-width:&#x20;600px&#41;&quot;&gt;&#x0d;&#x0a;&#47;&#42;&#x20;Mobile&#x20;styles&#x20;&#42;&#47;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;@media&#x20;only&#x20;screen&#x20;and&#x20;&#40;max-width:&#x20;600px&#41;&#x20;{&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;table[class=&quot;w320&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;320px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;table[class=&quot;w300&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;300px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;table[class=&quot;w290&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;290px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class=&quot;w320&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;320px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class~=&quot;mobile-padding&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-left:&#x20;14px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-right:&#x20;14px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class*=&quot;mobile-padding-left&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-left:&#x20;14px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class*=&quot;mobile-padding-right&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-right:&#x20;14px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class*=&quot;mobile-block&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;display:&#x20;block&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;100%&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;text-align:&#x20;left&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-left:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-right:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-bottom:&#x20;15px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class*=&quot;mobile-no-padding-bottom&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-bottom:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class~=&quot;mobile-center&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;text-align:&#x20;center&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;table[class*=&quot;mobile-center-block&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;float:&#x20;none&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;margin:&#x20;0&#x20;auto&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;*[class*=&quot;mobile-hide&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;display:&#x20;none&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;height:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;line-height:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class*=&quot;mobile-border&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;border:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&lt;/style&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&#x20;align=&quot;center&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;align=&quot;center&quot;&#x20;valign=&quot;top&quot;&#x20;bgcolor=&quot;#ffffff&quot;&#x20;width=&quot;100%&quot;&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;background:&#x20;#1f1f1f;&#x20;height:&#x20;70px;&quot;&#x20;width=&quot;100%&quot;&gt;&lt;center&gt;&#x0d;&#x0a;&lt;table&#x20;class=&quot;w320&quot;&#x20;style=&quot;width:&#x20;600px;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-block&#x20;mobile-no-padding-bottom&#x20;mobile-center&quot;&#x20;style=&quot;background:&#x20;#1f1f1f;&#x20;padding:&#x20;10px&#x20;10px&#x20;10px&#x20;20px;&quot;&#x20;valign=&quot;top&quot;&#x20;width=&quot;270&quot;&gt;&lt;a&#x20;style=&quot;text-decoration:&#x20;none;&quot;&#x20;href=&quot;#&quot;&gt;&#x20;&lt;img&#x20;src=&quot;https://pandorafms.com/images/logo_pandora_email.png&quot;&#x20;alt=&quot;Your&#x20;Logo&quot;&#x20;width=&quot;200&quot;&gt;&#x20;&lt;/a&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-block&#x20;mobile-center&quot;&#x20;style=&quot;background:&#x20;#1f1f1f;&#x20;padding:&#x20;17px&#x20;15px&#x20;10px&#x20;10px;&quot;&#x20;valign=&quot;top&quot;&#x20;width=&quot;270&quot;&gt;&amp;nbsp;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/center&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;border-bottom:&#x20;1px&#x20;solid&#x20;#e7e7e7;&quot;&gt;&lt;center&#x20;style=&quot;padding-bottom:&#x20;20px;&quot;&gt;&#x0d;&#x0a;&lt;table&#x20;class=&quot;w320&quot;&#x20;style=&quot;width:&#x20;600px;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-padding&quot;&#x20;style=&quot;padding:&#x20;20px;&quot;&#x20;align=&quot;left&quot;&gt;&lt;br&#x20;class=&quot;mobile-hide&quot;&gt;&#x0d;&#x0a;&lt;h2&gt;Pandora&#x20;FMS&#x20;alert&#x20;system&lt;/h2&gt;&#x0d;&#x0a;&lt;br&gt;&#x20;Dear&#x20;customer,&lt;br&gt;&lt;br&gt;&#x20;We&#x20;have&#x20;&lt;strong&gt;bad&#x20;news&lt;/strong&gt;&#x20;for&#x20;you.&#x20;Something&#x20;is&#x20;on&#x20;&lt;strong&gt;CRITICAL&lt;/strong&gt;&#x20;status!&lt;br&gt;&#x20;&lt;br&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&#x20;bgcolor=&quot;#ffffff&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;width:&#x20;100px;&#x20;background:&#x20;#D84A38;&quot;&gt;&#x0d;&#x0a;&lt;div&gt;&lt;!--[if&#x20;mso]&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;v:rect&#x20;xmlns:v=&quot;urn:schemas-microsoft-com:vml&quot;&#x20;xmlns:w=&quot;urn:schemas-microsoft-com:office:word&quot;&#x20;href=&quot;#&quot;&#x20;style=&quot;height:33px;v-text-anchor:middle;width:100px;&quot;&#x20;stroke=&quot;f&quot;&#x20;fillcolor=&quot;#D84A38&quot;&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;w:anchorlock/&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;center&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;![endif]--&gt;&#x20;&lt;a&#x20;style=&quot;background-color:&#x20;#1f1f1f;&#x20;color:&#x20;whitesmoke;&#x20;display:&#x20;inline-block;&#x20;font-family:&#x20;sans-serif;&#x20;font-size:&#x20;13px;&#x20;font-weight:&#x20;bold;&#x20;line-height:&#x20;33px;&#x20;text-align:&#x20;center;&#x20;text-decoration:&#x20;none;&#x20;width:&#x20;250px;&#x20;-webkit-text-size-adjust:&#x20;none;&quot;&#x20;href=&quot;_homeurl_&quot;&gt;Go&#x20;to&#x20;Pandora&#x20;FMS&#x20;Console&lt;/a&gt;&#x20;&lt;!--[if&#x20;mso]&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;/center&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;/v:rect&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;![endif]--&gt;&lt;/div&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;background-color:&#x20;#ffffff;&#x20;font-size:&#x20;0;&#x20;line-height:&#x20;0;&quot;&#x20;width=&quot;281&quot;&gt;&amp;nbsp;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-hide&quot;&#x20;style=&quot;padding-top:&#x20;20px;&#x20;padding-bottom:&#x20;0;&#x20;vertical-align:&#x20;bottom;&quot;&#x20;valign=&quot;bottom&quot;&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;padding-bottom:&#x20;0px;&#x20;vertical-align:&#x20;bottom;&quot;&#x20;align=&quot;right&quot;&#x20;valign=&quot;bottom&quot;&gt;&lt;img&#x20;style=&quot;vertical-align:&#x20;bottom;&#x20;padding-bottom:&#x20;10px;&quot;&#x20;src=&quot;https://pandorafms.com/images/alerta_roja.png&quot;&#x20;alt=&quot;&quot;&#x20;width=&quot;130&quot;&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/center&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;background-color:&#x20;#f8f8f8;&#x20;border-bottom:&#x20;1px&#x20;solid&#x20;#e7e7e7;&#x20;padding-top:&#x20;10px;&quot;&#x20;valign=&quot;top&quot;&gt;&lt;center&gt;&#x0d;&#x0a;&lt;table&#x20;class=&quot;w320&quot;&#x20;style=&quot;height:&#x20;100%;&#x20;width:&#x20;600px;&quot;&#x20;border=&quot;0&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-padding&quot;&#x20;style=&quot;padding:&#x20;20px;&quot;&#x20;valign=&quot;top&quot;&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;border=&quot;0&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;padding-right:&#x20;20px;&quot;&#x20;colspan=&quot;2&quot;&gt;&lt;strong&gt;Monitoring&#x20;details&lt;/strong&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;padding-top:&#x20;25px;&#x20;width:&#x20;150px;&#x20;border-top:&#x20;1px&#x20;solid&#x20;#E7E7E7;&#x20;vertical-align:&#x20;top;&quot;&gt;&lt;strong&gt;Data&lt;/strong&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;padding-top:&#x20;25px;&#x20;padding-right:&#x20;20px;&#x20;border-top:&#x20;1px&#x20;solid&#x20;#E7E7E7;&#x20;vertical-align:&#x20;top;&quot;&gt;_data_&#x20;&lt;em&gt;&#40;_modulestatus_&#41;&lt;/em&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&gt;&lt;strong&gt;Agent&lt;/strong&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;td&gt;_agent_&#x20;&lt;em&gt;_address_&lt;/em&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&gt;&lt;strong&gt;Module&lt;/strong&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;td&gt;_module_&#x20;&lt;em&gt;_moduledescription_&#x20;&lt;/em&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&gt;&lt;strong&gt;Timestamp&lt;/strong&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;td&gt;_timestamp_&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;padding-top:&#x20;20px;&quot;&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;vertical-align:&#x20;top;&quot;&#x20;width=&quot;350&quot;&gt;This&#x20;is&#x20;a&#x20;graph&#x20;of&#x20;latest&#x20;24hr&#x20;data&#x20;for&#x20;this&#x20;module:&#x20;&lt;br&gt;&lt;br&gt;&#x20;_modulegraph_24h_&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/center&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;background-color:&#x20;#1f1f1f;&quot;&gt;&lt;center&gt;&#x0d;&#x0a;&lt;table&#x20;class=&quot;w320&quot;&#x20;style=&quot;height:&#x20;100%;&#x20;color:&#x20;#ffffff;&#x20;width:&#x20;600px;&quot;&#x20;border=&quot;0&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&#x20;bgcolor=&quot;#1f1f1f&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-padding&quot;&#x20;style=&quot;font-size:&#x20;12px;&#x20;padding:&#x20;20px;&#x20;background-color:&#x20;#1f1f1f;&#x20;color:&#x20;#ffffff;&#x20;text-align:&#x20;center;&quot;&#x20;align=&quot;right&quot;&#x20;valign=&quot;middle&quot;&gt;&lt;a&#x20;style=&quot;color:&#x20;#ffffff;&quot;&#x20;href=&quot;https://pandorafms.com/company/contact/&quot;&gt;Contact&#x20;Us&lt;/a&gt;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&#x20;&lt;a&#x20;style=&quot;color:&#x20;#ffffff;&quot;&#x20;href=&quot;https://forums.pandorafms.com/&quot;&gt;Support&lt;/a&gt;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&#x20;&lt;a&#x20;style=&quot;color:&#x20;#ffffff;&quot;&#x20;href=&quot;https://wiki.pandorafms.com&quot;&gt;Docs&lt;/a&gt;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/center&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;','','','','','','','','','','','','','critical','',1,0.00,0.00,86400,1,0,'12:00:00','12:00:00',1,1,1,1,1,1,1,1,'','[PANDORA] Alert RECOVERED for CRITICAL status on _agent_ / _module_','&lt;style&#x20;type=&quot;text/css&quot;&gt;&lt;!--&#x0d;&#x0a;&#47;&#42;&#x20;Take&#x20;care&#x20;of&#x20;image&#x20;borders&#x20;and&#x20;formatting&#x20;&#42;&#47;&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;img&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;max-width:&#x20;600px;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;outline:&#x20;none;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;text-decoration:&#x20;none;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;-ms-interpolation-mode:&#x20;bicubic;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;a&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;border:&#x20;0;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;outline:&#x20;none;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;a&#x20;img&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;border:&#x20;none;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#47;&#42;&#x20;General&#x20;styling&#x20;&#42;&#47;&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;td,&#x20;h1,&#x20;h2,&#x20;h3&#x20;&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-family:&#x20;Helvetica,&#x20;Arial,&#x20;sans-serif;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-weight:&#x20;400;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;td&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;14px;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;line-height:&#x20;150%;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;text-align:&#x20;left;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;body&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;-webkit-font-smoothing:antialiased;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;-webkit-text-size-adjust:none;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;width:&#x20;100%;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;height:&#x20;100%;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;color:&#x20;#37302d;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;background:&#x20;#ffffff;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;table&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;border-collapse:&#x20;collapse&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;h1,&#x20;h2,&#x20;h3&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;padding:&#x20;0;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;margin:&#x20;0;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;color:&#x20;#444444;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-weight:&#x20;400;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;line-height:&#x20;110%;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;h1&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;35px;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;h2&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;30px;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;h3&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;24px;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;h4&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;18px;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-weight:&#x20;normal;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;.important-font&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;color:&#x20;#21BEB4;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-weight:&#x20;bold;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;.hide&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;display:&#x20;none&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;.force-full-width&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;width:&#x20;100%&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;--&gt;&lt;/style&gt;&#x0d;&#x0a;&lt;style&#x20;type=&quot;text/css&quot;&#x20;media=&quot;screen&quot;&gt;&lt;!--&#x0d;&#x0a;@media&#x20;screen&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;@import&#x20;url&#40;http://fonts.googleapis.com/css?family=Open+Sans:400&#41;;&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#47;&#42;&#x20;Thanks&#x20;Outlook&#x20;2013!&#x20;&#42;&#47;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td,&#x20;h1,&#x20;h2,&#x20;h3&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;font-family:&#x20;&#039;Open&#x20;Sans&#039;,&#x20;&#039;Helvetica&#x20;Neue&#039;,&#x20;Arial,&#x20;sans-serif&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;--&gt;&lt;/style&gt;&#x0d;&#x0a;&lt;style&#x20;type=&quot;text/css&quot;&#x20;media=&quot;only&#x20;screen&#x20;and&#x20;&#40;max-width:&#x20;600px&#41;&quot;&gt;&lt;!--&#x0d;&#x0a;&#47;&#42;&#x20;Mobile&#x20;styles&#x20;&#42;&#47;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;@media&#x20;only&#x20;screen&#x20;and&#x20;&#40;max-width:&#x20;600px&#41;&#x20;{&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;table[class=&quot;w320&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;320px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;table[class=&quot;w300&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;300px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;table[class=&quot;w290&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;290px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class=&quot;w320&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;320px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class~=&quot;mobile-padding&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-left:&#x20;14px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-right:&#x20;14px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class*=&quot;mobile-padding-left&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-left:&#x20;14px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class*=&quot;mobile-padding-right&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-right:&#x20;14px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class*=&quot;mobile-block&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;display:&#x20;block&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;100%&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;text-align:&#x20;left&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-left:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-right:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-bottom:&#x20;15px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class*=&quot;mobile-no-padding-bottom&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-bottom:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class~=&quot;mobile-center&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;text-align:&#x20;center&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;table[class*=&quot;mobile-center-block&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;float:&#x20;none&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;margin:&#x20;0&#x20;auto&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;*[class*=&quot;mobile-hide&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;display:&#x20;none&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;height:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;line-height:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class*=&quot;mobile-border&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;border:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;--&gt;&lt;/style&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&#x20;align=&quot;center&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;align=&quot;center&quot;&#x20;valign=&quot;top&quot;&#x20;bgcolor=&quot;#ffffff&quot;&#x20;width=&quot;100%&quot;&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;background:&#x20;#1f1f1f;&#x20;height:&#x20;70px;&quot;&#x20;width=&quot;100%&quot;&gt;&lt;center&gt;&#x0d;&#x0a;&lt;table&#x20;class=&quot;w320&quot;&#x20;style=&quot;width:&#x20;600px;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-block&#x20;mobile-no-padding-bottom&#x20;mobile-center&quot;&#x20;style=&quot;background:&#x20;#1f1f1f;&#x20;padding:&#x20;10px&#x20;10px&#x20;10px&#x20;20px;&quot;&#x20;valign=&quot;top&quot;&#x20;width=&quot;270&quot;&gt;&lt;a&#x20;style=&quot;text-decoration:&#x20;none;&quot;&#x20;href=&quot;#&quot;&gt;&#x20;&lt;img&#x20;src=&quot;https://pandorafms.com/images/logo_pandora_email.png&quot;&#x20;alt=&quot;Your&#x20;Logo&quot;&#x20;width=&quot;200&quot;&gt;&#x20;&lt;/a&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-block&#x20;mobile-center&quot;&#x20;style=&quot;background:&#x20;#1f1f1f;&#x20;padding:&#x20;17px&#x20;15px&#x20;10px&#x20;10px;&quot;&#x20;valign=&quot;top&quot;&#x20;width=&quot;270&quot;&gt;&amp;nbsp;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/center&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;border-bottom:&#x20;1px&#x20;solid&#x20;#e7e7e7;&quot;&gt;&lt;center&#x20;style=&quot;padding-bottom:&#x20;20px;&quot;&gt;&#x0d;&#x0a;&lt;table&#x20;class=&quot;w320&quot;&#x20;style=&quot;width:&#x20;600px;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-padding&quot;&#x20;style=&quot;padding:&#x20;20px;&quot;&#x20;align=&quot;left&quot;&gt;&lt;br&#x20;class=&quot;mobile-hide&quot;&gt;&#x0d;&#x0a;&lt;h2&gt;Pandora&#x20;FMS&#x20;alert&#x20;system&lt;/h2&gt;&#x0d;&#x0a;&lt;br&gt;&#x20;Dear&#x20;customer,&lt;br&gt;&lt;br&gt;&#x20;We&#x20;have&#x20;&lt;strong&gt;good&#x20;news&lt;/strong&gt;&#x20;for&#x20;you.&#x20;Alert&#x20;has&#x20;been&#x20;&lt;strong&gt;RECOVERED&lt;/strong&gt;&amp;nbsp;status!&lt;br&gt;&#x20;&lt;br&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&#x20;bgcolor=&quot;#ffffff&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;width:&#x20;100px;&#x20;background:&#x20;#D84A38;&quot;&gt;&#x0d;&#x0a;&lt;div&gt;&lt;!--[if&#x20;mso]&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;v:rect&#x20;xmlns:v=&quot;urn:schemas-microsoft-com:vml&quot;&#x20;xmlns:w=&quot;urn:schemas-microsoft-com:office:word&quot;&#x20;href=&quot;#&quot;&#x20;style=&quot;height:33px;v-text-anchor:middle;width:100px;&quot;&#x20;stroke=&quot;f&quot;&#x20;fillcolor=&quot;#D84A38&quot;&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;w:anchorlock/&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;center&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;![endif]--&gt;&#x20;&lt;a&#x20;style=&quot;background-color:&#x20;#1f1f1f;&#x20;color:&#x20;whitesmoke;&#x20;display:&#x20;inline-block;&#x20;font-family:&#x20;sans-serif;&#x20;font-size:&#x20;13px;&#x20;font-weight:&#x20;bold;&#x20;line-height:&#x20;33px;&#x20;text-align:&#x20;center;&#x20;text-decoration:&#x20;none;&#x20;width:&#x20;250px;&#x20;-webkit-text-size-adjust:&#x20;none;&quot;&#x20;href=&quot;_homeurl_&quot;&gt;Go&#x20;to&#x20;Pandora&#x20;FMS&#x20;Console&lt;/a&gt;&#x20;&lt;!--[if&#x20;mso]&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;/center&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;/v:rect&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;![endif]--&gt;&lt;/div&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;background-color:&#x20;#ffffff;&#x20;font-size:&#x20;0;&#x20;line-height:&#x20;0;&quot;&#x20;width=&quot;281&quot;&gt;&amp;nbsp;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-hide&quot;&#x20;style=&quot;padding-top:&#x20;20px;&#x20;padding-bottom:&#x20;0;&#x20;vertical-align:&#x20;bottom;&quot;&#x20;valign=&quot;bottom&quot;&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;padding-bottom:&#x20;0px;&#x20;vertical-align:&#x20;bottom;&quot;&#x20;align=&quot;right&quot;&#x20;valign=&quot;bottom&quot;&gt;&lt;img&#x20;style=&quot;vertical-align:&#x20;bottom;&#x20;padding-bottom:&#x20;10px;&quot;&#x20;src=&quot;https://pandorafms.com/images/alerta_verde.png&quot;&#x20;alt=&quot;&quot;&#x20;width=&quot;130&quot;&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/center&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;background-color:&#x20;#f8f8f8;&#x20;border-bottom:&#x20;1px&#x20;solid&#x20;#e7e7e7;&#x20;padding-top:&#x20;10px;&quot;&#x20;valign=&quot;top&quot;&gt;&lt;center&gt;&#x0d;&#x0a;&lt;table&#x20;class=&quot;w320&quot;&#x20;style=&quot;height:&#x20;100%;&#x20;width:&#x20;600px;&quot;&#x20;border=&quot;0&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-padding&quot;&#x20;style=&quot;padding:&#x20;20px;&quot;&#x20;valign=&quot;top&quot;&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;border=&quot;0&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;padding-right:&#x20;20px;&quot;&#x20;colspan=&quot;2&quot;&gt;&lt;strong&gt;Monitoring&#x20;details&lt;/strong&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;padding-top:&#x20;25px;&#x20;width:&#x20;150px;&#x20;border-top:&#x20;1px&#x20;solid&#x20;#E7E7E7;&#x20;vertical-align:&#x20;top;&quot;&gt;&lt;strong&gt;Data&lt;/strong&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;padding-top:&#x20;25px;&#x20;padding-right:&#x20;20px;&#x20;border-top:&#x20;1px&#x20;solid&#x20;#E7E7E7;&#x20;vertical-align:&#x20;top;&quot;&gt;_data_&#x20;&lt;em&gt;&#40;_modulestatus_&#41;&lt;/em&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&gt;&lt;strong&gt;Agent&lt;/strong&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;td&gt;_agent_&#x20;&lt;em&gt;_address_&lt;/em&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&gt;&lt;strong&gt;Module&lt;/strong&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;td&gt;_module_&#x20;&lt;em&gt;_moduledescription_&#x20;&lt;/em&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&gt;&lt;strong&gt;Timestamp&lt;/strong&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;td&gt;_timestamp_&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;padding-top:&#x20;20px;&quot;&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;vertical-align:&#x20;top;&quot;&#x20;width=&quot;350&quot;&gt;This&#x20;is&#x20;a&#x20;graph&#x20;of&#x20;latest&#x20;24hr&#x20;data&#x20;for&#x20;this&#x20;module:&#x20;&lt;br&gt;&lt;br&gt;&#x20;_modulegraph_24h_&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/center&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;background-color:&#x20;#1f1f1f;&quot;&gt;&lt;center&gt;&#x0d;&#x0a;&lt;table&#x20;class=&quot;w320&quot;&#x20;style=&quot;height:&#x20;100%;&#x20;color:&#x20;#ffffff;&#x20;width:&#x20;600px;&quot;&#x20;border=&quot;0&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&#x20;bgcolor=&quot;#1f1f1f&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-padding&quot;&#x20;style=&quot;font-size:&#x20;12px;&#x20;padding:&#x20;20px;&#x20;background-color:&#x20;#1f1f1f;&#x20;color:&#x20;#ffffff;&#x20;text-align:&#x20;center;&quot;&#x20;align=&quot;right&quot;&#x20;valign=&quot;middle&quot;&gt;&lt;a&#x20;style=&quot;color:&#x20;#ffffff;&quot;&#x20;href=&quot;https://pandorafms.com/company/contact/&quot;&gt;Contact&#x20;Us&lt;/a&gt;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&#x20;&lt;a&#x20;style=&quot;color:&#x20;#ffffff;&quot;&#x20;href=&quot;https://forums.pandorafms.com/&quot;&gt;Support&lt;/a&gt;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&#x20;&lt;a&#x20;style=&quot;color:&#x20;#ffffff;&quot;&#x20;href=&quot;https://wiki.pandorafms.com&quot;&gt;Docs&lt;/a&gt;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/center&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;','','','','','','','','','','','','',4,0,0,'basic',0,0,NULL),(2,'Manual&#x20;alert','This is a template used to fire manual alerts, condition defined here never will be executed. Use this template to assign to your actions/commands used to do remote management (Agent restart, execute commands on server, etc).',NULL,'','','&lt;style&#x20;type=&quot;text/css&quot;&gt;&lt;!--&#x0d;&#x0a;&#47;&#42;&#x20;Take&#x20;care&#x20;of&#x20;image&#x20;borders&#x20;and&#x20;formatting&#x20;&#42;&#47;&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;img&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;max-width:&#x20;600px;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;outline:&#x20;none;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;text-decoration:&#x20;none;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;-ms-interpolation-mode:&#x20;bicubic;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;a&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;border:&#x20;0;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;outline:&#x20;none;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;a&#x20;img&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;border:&#x20;none;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#47;&#42;&#x20;General&#x20;styling&#x20;&#42;&#47;&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;td,&#x20;h1,&#x20;h2,&#x20;h3&#x20;&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-family:&#x20;Helvetica,&#x20;Arial,&#x20;sans-serif;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-weight:&#x20;400;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;td&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;14px;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;line-height:&#x20;150%;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;text-align:&#x20;left;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;body&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;-webkit-font-smoothing:antialiased;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;-webkit-text-size-adjust:none;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;width:&#x20;100%;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;height:&#x20;100%;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;color:&#x20;#37302d;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;background:&#x20;#ffffff;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;table&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;border-collapse:&#x20;collapse&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;h1,&#x20;h2,&#x20;h3&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;padding:&#x20;0;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;margin:&#x20;0;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;color:&#x20;#444444;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-weight:&#x20;400;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;line-height:&#x20;110%;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;h1&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;35px;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;h2&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;30px;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;h3&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;24px;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;h4&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;18px;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-weight:&#x20;normal;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;.important-font&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;color:&#x20;#21BEB4;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-weight:&#x20;bold;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;.hide&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;display:&#x20;none&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;.force-full-width&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;width:&#x20;100%&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;--&gt;&lt;/style&gt;&#x0d;&#x0a;&lt;style&#x20;type=&quot;text/css&quot;&#x20;media=&quot;screen&quot;&gt;&lt;!--&#x0d;&#x0a;@media&#x20;screen&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;@import&#x20;url&#40;http://fonts.googleapis.com/css?family=Open+Sans:400&#41;;&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#47;&#42;&#x20;Thanks&#x20;Outlook&#x20;2013!&#x20;&#42;&#47;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td,&#x20;h1,&#x20;h2,&#x20;h3&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;font-family:&#x20;&#039;Open&#x20;Sans&#039;,&#x20;&#039;Helvetica&#x20;Neue&#039;,&#x20;Arial,&#x20;sans-serif&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;--&gt;&lt;/style&gt;&#x0d;&#x0a;&lt;style&#x20;type=&quot;text/css&quot;&#x20;media=&quot;only&#x20;screen&#x20;and&#x20;&#40;max-width:&#x20;600px&#41;&quot;&gt;&lt;!--&#x0d;&#x0a;&#47;&#42;&#x20;Mobile&#x20;styles&#x20;&#42;&#47;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;@media&#x20;only&#x20;screen&#x20;and&#x20;&#40;max-width:&#x20;600px&#41;&#x20;{&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;table[class=&quot;w320&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;320px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;table[class=&quot;w300&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;300px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;table[class=&quot;w290&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;290px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class=&quot;w320&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;320px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class~=&quot;mobile-padding&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-left:&#x20;14px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-right:&#x20;14px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class*=&quot;mobile-padding-left&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-left:&#x20;14px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class*=&quot;mobile-padding-right&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-right:&#x20;14px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class*=&quot;mobile-block&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;display:&#x20;block&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;100%&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;text-align:&#x20;left&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-left:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-right:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-bottom:&#x20;15px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class*=&quot;mobile-no-padding-bottom&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-bottom:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class~=&quot;mobile-center&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;text-align:&#x20;center&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;table[class*=&quot;mobile-center-block&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;float:&#x20;none&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;margin:&#x20;0&#x20;auto&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;*[class*=&quot;mobile-hide&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;display:&#x20;none&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;height:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;line-height:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class*=&quot;mobile-border&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;border:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;--&gt;&lt;/style&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&#x20;align=&quot;center&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;align=&quot;center&quot;&#x20;valign=&quot;top&quot;&#x20;bgcolor=&quot;#ffffff&quot;&#x20;width=&quot;100%&quot;&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;background:&#x20;#1f1f1f;&#x20;height:&#x20;70px;&quot;&#x20;width=&quot;100%&quot;&gt;&lt;center&gt;&#x0d;&#x0a;&lt;table&#x20;class=&quot;w320&quot;&#x20;style=&quot;width:&#x20;600px;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-block&#x20;mobile-no-padding-bottom&#x20;mobile-center&quot;&#x20;style=&quot;background:&#x20;#1f1f1f;&#x20;padding:&#x20;10px&#x20;10px&#x20;10px&#x20;20px;&quot;&#x20;valign=&quot;top&quot;&#x20;width=&quot;270&quot;&gt;&lt;a&#x20;style=&quot;text-decoration:&#x20;none;&quot;&#x20;href=&quot;#&quot;&gt;&#x20;&lt;img&#x20;src=&quot;https://pandorafms.com/images/logo_pandora_email.png&quot;&#x20;alt=&quot;Your&#x20;Logo&quot;&#x20;width=&quot;200&quot;&gt;&#x20;&lt;/a&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-block&#x20;mobile-center&quot;&#x20;style=&quot;background:&#x20;#1f1f1f;&#x20;padding:&#x20;17px&#x20;15px&#x20;10px&#x20;10px;&quot;&#x20;valign=&quot;top&quot;&#x20;width=&quot;270&quot;&gt;&amp;nbsp;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/center&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;border-bottom:&#x20;1px&#x20;solid&#x20;#e7e7e7;&quot;&gt;&lt;center&#x20;style=&quot;padding-bottom:&#x20;20px;&quot;&gt;&#x0d;&#x0a;&lt;table&#x20;class=&quot;w320&quot;&#x20;style=&quot;width:&#x20;600px;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-padding&quot;&#x20;style=&quot;padding:&#x20;20px;&quot;&#x20;align=&quot;left&quot;&gt;&lt;br&#x20;class=&quot;mobile-hide&quot;&gt;&#x0d;&#x0a;&lt;h2&gt;Pandora&#x20;FMS&#x20;alert&#x20;system&lt;/h2&gt;&#x0d;&#x0a;&lt;br&gt;&#x20;Dear&#x20;customer,&lt;br&gt;&lt;br&gt;&#x20;We&#x20;have&#x20;&lt;strong&gt;good&#x20;news&lt;/strong&gt;&#x20;for&#x20;you.&#x20;Alert&#x20;has&#x20;been&#x20;&lt;strong&gt;RECOVERED&lt;/strong&gt;&amp;nbsp;status!&lt;br&gt;&#x20;&lt;br&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&#x20;bgcolor=&quot;#ffffff&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;width:&#x20;100px;&#x20;background:&#x20;#D84A38;&quot;&gt;&#x0d;&#x0a;&lt;div&gt;&lt;!--[if&#x20;mso]&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;v:rect&#x20;xmlns:v=&quot;urn:schemas-microsoft-com:vml&quot;&#x20;xmlns:w=&quot;urn:schemas-microsoft-com:office:word&quot;&#x20;href=&quot;#&quot;&#x20;style=&quot;height:33px;v-text-anchor:middle;width:100px;&quot;&#x20;stroke=&quot;f&quot;&#x20;fillcolor=&quot;#D84A38&quot;&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;w:anchorlock/&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;center&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;![endif]--&gt;&#x20;&lt;a&#x20;style=&quot;background-color:&#x20;#1f1f1f;&#x20;color:&#x20;whitesmoke;&#x20;display:&#x20;inline-block;&#x20;font-family:&#x20;sans-serif;&#x20;font-size:&#x20;13px;&#x20;font-weight:&#x20;bold;&#x20;line-height:&#x20;33px;&#x20;text-align:&#x20;center;&#x20;text-decoration:&#x20;none;&#x20;width:&#x20;250px;&#x20;-webkit-text-size-adjust:&#x20;none;&quot;&#x20;href=&quot;_homeurl_&quot;&gt;Go&#x20;to&#x20;Pandora&#x20;FMS&#x20;Console&lt;/a&gt;&#x20;&lt;!--[if&#x20;mso]&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;/center&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;/v:rect&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;![endif]--&gt;&lt;/div&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;background-color:&#x20;#ffffff;&#x20;font-size:&#x20;0;&#x20;line-height:&#x20;0;&quot;&#x20;width=&quot;281&quot;&gt;&amp;nbsp;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-hide&quot;&#x20;style=&quot;padding-top:&#x20;20px;&#x20;padding-bottom:&#x20;0;&#x20;vertical-align:&#x20;bottom;&quot;&#x20;valign=&quot;bottom&quot;&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;padding-bottom:&#x20;0px;&#x20;vertical-align:&#x20;bottom;&quot;&#x20;align=&quot;right&quot;&#x20;valign=&quot;bottom&quot;&gt;&lt;img&#x20;style=&quot;vertical-align:&#x20;bottom;&#x20;padding-bottom:&#x20;10px;&quot;&#x20;src=&quot;https://pandorafms.com/images/alerta_verde.png&quot;&#x20;alt=&quot;&quot;&#x20;width=&quot;130&quot;&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/center&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;background-color:&#x20;#f8f8f8;&#x20;border-bottom:&#x20;1px&#x20;solid&#x20;#e7e7e7;&#x20;padding-top:&#x20;10px;&quot;&#x20;valign=&quot;top&quot;&gt;&lt;center&gt;&#x0d;&#x0a;&lt;table&#x20;class=&quot;w320&quot;&#x20;style=&quot;height:&#x20;100%;&#x20;width:&#x20;600px;&quot;&#x20;border=&quot;0&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-padding&quot;&#x20;style=&quot;padding:&#x20;20px;&quot;&#x20;valign=&quot;top&quot;&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;border=&quot;0&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;padding-right:&#x20;20px;&quot;&#x20;colspan=&quot;2&quot;&gt;&lt;strong&gt;Monitoring&#x20;details&lt;/strong&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;padding-top:&#x20;25px;&#x20;width:&#x20;150px;&#x20;border-top:&#x20;1px&#x20;solid&#x20;#E7E7E7;&#x20;vertical-align:&#x20;top;&quot;&gt;&lt;strong&gt;Data&lt;/strong&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;padding-top:&#x20;25px;&#x20;padding-right:&#x20;20px;&#x20;border-top:&#x20;1px&#x20;solid&#x20;#E7E7E7;&#x20;vertical-align:&#x20;top;&quot;&gt;_data_&#x20;&lt;em&gt;&#40;_modulestatus_&#41;&lt;/em&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&gt;&lt;strong&gt;Agent&lt;/strong&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;td&gt;_agent_&#x20;&lt;em&gt;_address_&lt;/em&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&gt;&lt;strong&gt;Module&lt;/strong&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;td&gt;_module_&#x20;&lt;em&gt;_moduledescription_&#x20;&lt;/em&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&gt;&lt;strong&gt;Timestamp&lt;/strong&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;td&gt;_timestamp_&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;padding-top:&#x20;20px;&quot;&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;vertical-align:&#x20;top;&quot;&#x20;width=&quot;350&quot;&gt;This&#x20;is&#x20;a&#x20;graph&#x20;of&#x20;latest&#x20;24hr&#x20;data&#x20;for&#x20;this&#x20;module:&#x20;&lt;br&gt;&lt;br&gt;&#x20;_modulegraph_24h_&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/center&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;background-color:&#x20;#1f1f1f;&quot;&gt;&lt;center&gt;&#x0d;&#x0a;&lt;table&#x20;class=&quot;w320&quot;&#x20;style=&quot;height:&#x20;100%;&#x20;color:&#x20;#ffffff;&#x20;width:&#x20;600px;&quot;&#x20;border=&quot;0&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&#x20;bgcolor=&quot;#1f1f1f&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-padding&quot;&#x20;style=&quot;font-size:&#x20;12px;&#x20;padding:&#x20;20px;&#x20;background-color:&#x20;#1f1f1f;&#x20;color:&#x20;#ffffff;&#x20;text-align:&#x20;center;&quot;&#x20;align=&quot;right&quot;&#x20;valign=&quot;middle&quot;&gt;&lt;a&#x20;style=&quot;color:&#x20;#ffffff;&quot;&#x20;href=&quot;https://pandorafms.com/company/contact/&quot;&gt;Contact&#x20;Us&lt;/a&gt;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&#x20;&lt;a&#x20;style=&quot;color:&#x20;#ffffff;&quot;&#x20;href=&quot;https://forums.pandorafms.com/&quot;&gt;Support&lt;/a&gt;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&#x20;&lt;a&#x20;style=&quot;color:&#x20;#ffffff;&quot;&#x20;href=&quot;https://wiki.pandorafms.com&quot;&gt;Docs&lt;/a&gt;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/center&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;','','','','','','','','','','','','','max_min','',1,0.00,1.00,86400,1,0,'12:00:00','12:00:00',1,1,1,1,1,1,1,0,'','','','','','','','','','','','','','','',1,0,0,'basic',0,0,NULL),(3,'Warning&#x20;condition','This&#x20;is&#x20;a&#x20;generic&#x20;alert&#x20;template&#x20;to&#x20;fire&#x20;on&#x20;WARNING&#x20;condition.',1,'','','&lt;style&#x20;type=&quot;text/css&quot;&gt;&#x0d;&#x0a;&#47;&#42;&#x20;Take&#x20;care&#x20;of&#x20;image&#x20;borders&#x20;and&#x20;formatting&#x20;&#42;&#47;&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;img&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;max-width:&#x20;600px;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;outline:&#x20;none;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;text-decoration:&#x20;none;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;-ms-interpolation-mode:&#x20;bicubic;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;a&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;border:&#x20;0;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;outline:&#x20;none;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;a&#x20;img&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;border:&#x20;none;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#47;&#42;&#x20;General&#x20;styling&#x20;&#42;&#47;&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;td,&#x20;h1,&#x20;h2,&#x20;h3&#x20;&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-family:&#x20;Helvetica,&#x20;Arial,&#x20;sans-serif;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-weight:&#x20;400;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;td&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;14px;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;line-height:&#x20;150%;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;text-align:&#x20;left;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;body&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;-webkit-font-smoothing:antialiased;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;-webkit-text-size-adjust:none;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;width:&#x20;100%;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;height:&#x20;100%;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;color:&#x20;#37302d;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;background:&#x20;#ffffff;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;table&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;border-collapse:&#x20;collapse&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;h1,&#x20;h2,&#x20;h3&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;padding:&#x20;0;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;margin:&#x20;0;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;color:&#x20;#444444;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-weight:&#x20;400;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;line-height:&#x20;110%;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;h1&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;35px;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;h2&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;30px;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;h3&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;24px;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;h4&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;18px;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-weight:&#x20;normal;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;.important-font&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;color:&#x20;#21BEB4;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-weight:&#x20;bold;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;.hide&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;display:&#x20;none&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;.force-full-width&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;width:&#x20;100%&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&lt;/style&gt;&#x0d;&#x0a;&lt;style&#x20;type=&quot;text/css&quot;&#x20;media=&quot;screen&quot;&gt;&#x0d;&#x0a;@media&#x20;screen&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;@import&#x20;url&#40;http://fonts.googleapis.com/css?family=Open+Sans:400&#41;;&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#47;&#42;&#x20;Thanks&#x20;Outlook&#x20;2013!&#x20;&#42;&#47;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td,&#x20;h1,&#x20;h2,&#x20;h3&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;font-family:&#x20;&#039;Open&#x20;Sans&#039;,&#x20;&#039;Helvetica&#x20;Neue&#039;,&#x20;Arial,&#x20;sans-serif&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&lt;/style&gt;&#x0d;&#x0a;&lt;style&#x20;type=&quot;text/css&quot;&#x20;media=&quot;only&#x20;screen&#x20;and&#x20;&#40;max-width:&#x20;600px&#41;&quot;&gt;&#x0d;&#x0a;&#47;&#42;&#x20;Mobile&#x20;styles&#x20;&#42;&#47;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;@media&#x20;only&#x20;screen&#x20;and&#x20;&#40;max-width:&#x20;600px&#41;&#x20;{&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;table[class=&quot;w320&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;320px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;table[class=&quot;w300&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;300px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;table[class=&quot;w290&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;290px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class=&quot;w320&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;320px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class~=&quot;mobile-padding&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-left:&#x20;14px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-right:&#x20;14px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class*=&quot;mobile-padding-left&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-left:&#x20;14px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class*=&quot;mobile-padding-right&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-right:&#x20;14px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class*=&quot;mobile-block&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;display:&#x20;block&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;100%&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;text-align:&#x20;left&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-left:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-right:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-bottom:&#x20;15px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class*=&quot;mobile-no-padding-bottom&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-bottom:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class~=&quot;mobile-center&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;text-align:&#x20;center&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;table[class*=&quot;mobile-center-block&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;float:&#x20;none&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;margin:&#x20;0&#x20;auto&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;*[class*=&quot;mobile-hide&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;display:&#x20;none&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;height:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;line-height:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class*=&quot;mobile-border&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;border:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&lt;/style&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&#x20;align=&quot;center&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;align=&quot;center&quot;&#x20;valign=&quot;top&quot;&#x20;bgcolor=&quot;#ffffff&quot;&#x20;width=&quot;100%&quot;&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;background:&#x20;#1f1f1f;&#x20;height:&#x20;70px;&quot;&#x20;width=&quot;100%&quot;&gt;&lt;center&gt;&#x0d;&#x0a;&lt;table&#x20;class=&quot;w320&quot;&#x20;style=&quot;width:&#x20;600px;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-block&#x20;mobile-no-padding-bottom&#x20;mobile-center&quot;&#x20;style=&quot;background:&#x20;#1f1f1f;&#x20;padding:&#x20;10px&#x20;10px&#x20;10px&#x20;20px;&quot;&#x20;valign=&quot;top&quot;&#x20;width=&quot;270&quot;&gt;&lt;a&#x20;style=&quot;text-decoration:&#x20;none;&quot;&#x20;href=&quot;#&quot;&gt;&#x20;&lt;img&#x20;src=&quot;https://pandorafms.com/images/logo_pandora_email.png&quot;&#x20;alt=&quot;Your&#x20;Logo&quot;&#x20;width=&quot;200&quot;&gt;&#x20;&lt;/a&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-block&#x20;mobile-center&quot;&#x20;style=&quot;background:&#x20;#1f1f1f;&#x20;padding:&#x20;17px&#x20;15px&#x20;10px&#x20;10px;&quot;&#x20;valign=&quot;top&quot;&#x20;width=&quot;270&quot;&gt;&amp;nbsp;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/center&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;border-bottom:&#x20;1px&#x20;solid&#x20;#e7e7e7;&quot;&gt;&lt;center&#x20;style=&quot;padding-bottom:&#x20;20px;&quot;&gt;&#x0d;&#x0a;&lt;table&#x20;class=&quot;w320&quot;&#x20;style=&quot;width:&#x20;600px;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-padding&quot;&#x20;style=&quot;padding:&#x20;20px;&quot;&#x20;align=&quot;left&quot;&gt;&lt;br&#x20;class=&quot;mobile-hide&quot;&gt;&#x0d;&#x0a;&lt;h2&gt;Pandora&#x20;FMS&#x20;alert&#x20;system&lt;/h2&gt;&#x0d;&#x0a;&lt;br&gt;&#x20;Dear&#x20;customer,&lt;br&gt;&lt;br&gt;&#x20;We&#x20;have&#x20;&lt;strong&gt;bad&#x20;news&lt;/strong&gt;&#x20;for&#x20;you.&#x20;Something&#x20;is&#x20;on&#x20;&lt;strong&gt;CRITICAL&lt;/strong&gt;&#x20;status!&lt;br&gt;&#x20;&lt;br&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&#x20;bgcolor=&quot;#ffffff&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;width:&#x20;100px;&#x20;background:&#x20;#D84A38;&quot;&gt;&#x0d;&#x0a;&lt;div&gt;&lt;!--[if&#x20;mso]&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;v:rect&#x20;xmlns:v=&quot;urn:schemas-microsoft-com:vml&quot;&#x20;xmlns:w=&quot;urn:schemas-microsoft-com:office:word&quot;&#x20;href=&quot;#&quot;&#x20;style=&quot;height:33px;v-text-anchor:middle;width:100px;&quot;&#x20;stroke=&quot;f&quot;&#x20;fillcolor=&quot;#D84A38&quot;&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;w:anchorlock/&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;center&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;![endif]--&gt;&#x20;&lt;a&#x20;style=&quot;background-color:&#x20;#1f1f1f;&#x20;color:&#x20;whitesmoke;&#x20;display:&#x20;inline-block;&#x20;font-family:&#x20;sans-serif;&#x20;font-size:&#x20;13px;&#x20;font-weight:&#x20;bold;&#x20;line-height:&#x20;33px;&#x20;text-align:&#x20;center;&#x20;text-decoration:&#x20;none;&#x20;width:&#x20;250px;&#x20;-webkit-text-size-adjust:&#x20;none;&quot;&#x20;href=&quot;_homeurl_&quot;&gt;Go&#x20;to&#x20;Pandora&#x20;FMS&#x20;Console&lt;/a&gt;&#x20;&lt;!--[if&#x20;mso]&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;/center&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;/v:rect&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;![endif]--&gt;&lt;/div&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;background-color:&#x20;#ffffff;&#x20;font-size:&#x20;0;&#x20;line-height:&#x20;0;&quot;&#x20;width=&quot;281&quot;&gt;&amp;nbsp;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-hide&quot;&#x20;style=&quot;padding-top:&#x20;20px;&#x20;padding-bottom:&#x20;0;&#x20;vertical-align:&#x20;bottom;&quot;&#x20;valign=&quot;bottom&quot;&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;padding-bottom:&#x20;0px;&#x20;vertical-align:&#x20;bottom;&quot;&#x20;align=&quot;right&quot;&#x20;valign=&quot;bottom&quot;&gt;&lt;img&#x20;style=&quot;vertical-align:&#x20;bottom;&#x20;padding-bottom:&#x20;10px;&quot;&#x20;src=&quot;https://pandorafms.com/images/alerta_roja.png&quot;&#x20;alt=&quot;&quot;&#x20;width=&quot;130&quot;&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/center&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;background-color:&#x20;#f8f8f8;&#x20;border-bottom:&#x20;1px&#x20;solid&#x20;#e7e7e7;&#x20;padding-top:&#x20;10px;&quot;&#x20;valign=&quot;top&quot;&gt;&lt;center&gt;&#x0d;&#x0a;&lt;table&#x20;class=&quot;w320&quot;&#x20;style=&quot;height:&#x20;100%;&#x20;width:&#x20;600px;&quot;&#x20;border=&quot;0&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-padding&quot;&#x20;style=&quot;padding:&#x20;20px;&quot;&#x20;valign=&quot;top&quot;&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;border=&quot;0&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;padding-right:&#x20;20px;&quot;&#x20;colspan=&quot;2&quot;&gt;&lt;strong&gt;Monitoring&#x20;details&lt;/strong&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;padding-top:&#x20;25px;&#x20;width:&#x20;150px;&#x20;border-top:&#x20;1px&#x20;solid&#x20;#E7E7E7;&#x20;vertical-align:&#x20;top;&quot;&gt;&lt;strong&gt;Data&lt;/strong&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;padding-top:&#x20;25px;&#x20;padding-right:&#x20;20px;&#x20;border-top:&#x20;1px&#x20;solid&#x20;#E7E7E7;&#x20;vertical-align:&#x20;top;&quot;&gt;_data_&#x20;&lt;em&gt;&#40;_modulestatus_&#41;&lt;/em&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&gt;&lt;strong&gt;Agent&lt;/strong&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;td&gt;_agent_&#x20;&lt;em&gt;_address_&lt;/em&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&gt;&lt;strong&gt;Module&lt;/strong&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;td&gt;_module_&#x20;&lt;em&gt;_moduledescription_&#x20;&lt;/em&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&gt;&lt;strong&gt;Timestamp&lt;/strong&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;td&gt;_timestamp_&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;padding-top:&#x20;20px;&quot;&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;vertical-align:&#x20;top;&quot;&#x20;width=&quot;350&quot;&gt;This&#x20;is&#x20;a&#x20;graph&#x20;of&#x20;latest&#x20;24hr&#x20;data&#x20;for&#x20;this&#x20;module:&#x20;&lt;br&gt;&lt;br&gt;&#x20;_modulegraph_24h_&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/center&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;background-color:&#x20;#1f1f1f;&quot;&gt;&lt;center&gt;&#x0d;&#x0a;&lt;table&#x20;class=&quot;w320&quot;&#x20;style=&quot;height:&#x20;100%;&#x20;color:&#x20;#ffffff;&#x20;width:&#x20;600px;&quot;&#x20;border=&quot;0&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&#x20;bgcolor=&quot;#1f1f1f&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-padding&quot;&#x20;style=&quot;font-size:&#x20;12px;&#x20;padding:&#x20;20px;&#x20;background-color:&#x20;#1f1f1f;&#x20;color:&#x20;#ffffff;&#x20;text-align:&#x20;center;&quot;&#x20;align=&quot;right&quot;&#x20;valign=&quot;middle&quot;&gt;&lt;a&#x20;style=&quot;color:&#x20;#ffffff;&quot;&#x20;href=&quot;https://pandorafms.com/company/contact/&quot;&gt;Contact&#x20;Us&lt;/a&gt;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&#x20;&lt;a&#x20;style=&quot;color:&#x20;#ffffff;&quot;&#x20;href=&quot;https://forums.pandorafms.com/&quot;&gt;Support&lt;/a&gt;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&#x20;&lt;a&#x20;style=&quot;color:&#x20;#ffffff;&quot;&#x20;href=&quot;https://wiki.pandorafms.com&quot;&gt;Docs&lt;/a&gt;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/center&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;','','','','','','','','','','','','','warning','',1,0.00,0.00,86400,1,0,'12:00:00','12:00:00',1,1,1,1,1,1,1,1,'','[PANDORA]&#x20;Alert&#x20;RECOVERED&#x20;for&#x20;WARNING&#x20;status&#x20;on&#x20;_agent_&#x20;/&#x20;_module_','&lt;style&#x20;type=&quot;text/css&quot;&gt;&lt;!--&#x0d;&#x0a;&#47;&#42;&#x20;Take&#x20;care&#x20;of&#x20;image&#x20;borders&#x20;and&#x20;formatting&#x20;&#42;&#47;&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;img&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;max-width:&#x20;600px;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;outline:&#x20;none;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;text-decoration:&#x20;none;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;-ms-interpolation-mode:&#x20;bicubic;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;a&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;border:&#x20;0;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;outline:&#x20;none;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;a&#x20;img&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;border:&#x20;none;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#47;&#42;&#x20;General&#x20;styling&#x20;&#42;&#47;&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;td,&#x20;h1,&#x20;h2,&#x20;h3&#x20;&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-family:&#x20;Helvetica,&#x20;Arial,&#x20;sans-serif;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-weight:&#x20;400;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;td&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;14px;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;line-height:&#x20;150%;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;text-align:&#x20;left;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;body&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;-webkit-font-smoothing:antialiased;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;-webkit-text-size-adjust:none;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;width:&#x20;100%;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;height:&#x20;100%;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;color:&#x20;#37302d;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;background:&#x20;#ffffff;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;table&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;border-collapse:&#x20;collapse&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;h1,&#x20;h2,&#x20;h3&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;padding:&#x20;0;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;margin:&#x20;0;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;color:&#x20;#444444;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-weight:&#x20;400;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;line-height:&#x20;110%;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;h1&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;35px;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;h2&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;30px;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;h3&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;24px;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;h4&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;18px;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-weight:&#x20;normal;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;.important-font&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;color:&#x20;#21BEB4;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;font-weight:&#x20;bold;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;.hide&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;display:&#x20;none&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;.force-full-width&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;width:&#x20;100%&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;}&#x0d;&#x0a;--&gt;&lt;/style&gt;&#x0d;&#x0a;&lt;style&#x20;type=&quot;text/css&quot;&#x20;media=&quot;screen&quot;&gt;&lt;!--&#x0d;&#x0a;@media&#x20;screen&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;@import&#x20;url&#40;http://fonts.googleapis.com/css?family=Open+Sans:400&#41;;&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#47;&#42;&#x20;Thanks&#x20;Outlook&#x20;2013!&#x20;&#42;&#47;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td,&#x20;h1,&#x20;h2,&#x20;h3&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;font-family:&#x20;&#039;Open&#x20;Sans&#039;,&#x20;&#039;Helvetica&#x20;Neue&#039;,&#x20;Arial,&#x20;sans-serif&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;--&gt;&lt;/style&gt;&#x0d;&#x0a;&lt;style&#x20;type=&quot;text/css&quot;&#x20;media=&quot;only&#x20;screen&#x20;and&#x20;&#40;max-width:&#x20;600px&#41;&quot;&gt;&lt;!--&#x0d;&#x0a;&#47;&#42;&#x20;Mobile&#x20;styles&#x20;&#42;&#47;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;@media&#x20;only&#x20;screen&#x20;and&#x20;&#40;max-width:&#x20;600px&#41;&#x20;{&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;table[class=&quot;w320&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;320px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;table[class=&quot;w300&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;300px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;table[class=&quot;w290&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;290px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class=&quot;w320&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;320px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class~=&quot;mobile-padding&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-left:&#x20;14px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-right:&#x20;14px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class*=&quot;mobile-padding-left&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-left:&#x20;14px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class*=&quot;mobile-padding-right&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-right:&#x20;14px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class*=&quot;mobile-block&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;display:&#x20;block&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;100%&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;text-align:&#x20;left&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-left:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-right:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-bottom:&#x20;15px&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class*=&quot;mobile-no-padding-bottom&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;padding-bottom:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class~=&quot;mobile-center&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;text-align:&#x20;center&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;table[class*=&quot;mobile-center-block&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;float:&#x20;none&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;margin:&#x20;0&#x20;auto&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;*[class*=&quot;mobile-hide&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;display:&#x20;none&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;width:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;height:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;line-height:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;font-size:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;td[class*=&quot;mobile-border&quot;]&#x20;{&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;border:&#x20;0&#x20;!important;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;}&#x0d;&#x0a;--&gt;&lt;/style&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&#x20;align=&quot;center&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;align=&quot;center&quot;&#x20;valign=&quot;top&quot;&#x20;bgcolor=&quot;#ffffff&quot;&#x20;width=&quot;100%&quot;&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;background:&#x20;#1f1f1f;&#x20;height:&#x20;70px;&quot;&#x20;width=&quot;100%&quot;&gt;&lt;center&gt;&#x0d;&#x0a;&lt;table&#x20;class=&quot;w320&quot;&#x20;style=&quot;width:&#x20;600px;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-block&#x20;mobile-no-padding-bottom&#x20;mobile-center&quot;&#x20;style=&quot;background:&#x20;#1f1f1f;&#x20;padding:&#x20;10px&#x20;10px&#x20;10px&#x20;20px;&quot;&#x20;valign=&quot;top&quot;&#x20;width=&quot;270&quot;&gt;&lt;a&#x20;style=&quot;text-decoration:&#x20;none;&quot;&#x20;href=&quot;#&quot;&gt;&#x20;&lt;img&#x20;src=&quot;https://pandorafms.com/images/logo_pandora_email.png&quot;&#x20;alt=&quot;Your&#x20;Logo&quot;&#x20;width=&quot;200&quot;&gt;&#x20;&lt;/a&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-block&#x20;mobile-center&quot;&#x20;style=&quot;background:&#x20;#1f1f1f;&#x20;padding:&#x20;17px&#x20;15px&#x20;10px&#x20;10px;&quot;&#x20;valign=&quot;top&quot;&#x20;width=&quot;270&quot;&gt;&amp;nbsp;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/center&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;border-bottom:&#x20;1px&#x20;solid&#x20;#e7e7e7;&quot;&gt;&lt;center&#x20;style=&quot;padding-bottom:&#x20;20px;&quot;&gt;&#x0d;&#x0a;&lt;table&#x20;class=&quot;w320&quot;&#x20;style=&quot;width:&#x20;600px;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-padding&quot;&#x20;style=&quot;padding:&#x20;20px;&quot;&#x20;align=&quot;left&quot;&gt;&lt;br&#x20;class=&quot;mobile-hide&quot;&gt;&#x0d;&#x0a;&lt;h2&gt;Pandora&#x20;FMS&#x20;alert&#x20;system&lt;/h2&gt;&#x0d;&#x0a;&lt;br&gt;&#x20;Dear&#x20;customer,&lt;br&gt;&lt;br&gt;&#x20;We&#x20;have&#x20;&lt;strong&gt;good&#x20;news&lt;/strong&gt;&#x20;for&#x20;you.&#x20;Alert&#x20;has&#x20;been&#x20;&lt;strong&gt;RECOVERED&lt;/strong&gt;&amp;nbsp;status!&lt;br&gt;&#x20;&lt;br&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&#x20;bgcolor=&quot;#ffffff&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;width:&#x20;100px;&#x20;background:&#x20;#D84A38;&quot;&gt;&#x0d;&#x0a;&lt;div&gt;&lt;!--[if&#x20;mso]&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;v:rect&#x20;xmlns:v=&quot;urn:schemas-microsoft-com:vml&quot;&#x20;xmlns:w=&quot;urn:schemas-microsoft-com:office:word&quot;&#x20;href=&quot;#&quot;&#x20;style=&quot;height:33px;v-text-anchor:middle;width:100px;&quot;&#x20;stroke=&quot;f&quot;&#x20;fillcolor=&quot;#D84A38&quot;&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;w:anchorlock/&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;center&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;![endif]--&gt;&#x20;&lt;a&#x20;style=&quot;background-color:&#x20;#1f1f1f;&#x20;color:&#x20;whitesmoke;&#x20;display:&#x20;inline-block;&#x20;font-family:&#x20;sans-serif;&#x20;font-size:&#x20;13px;&#x20;font-weight:&#x20;bold;&#x20;line-height:&#x20;33px;&#x20;text-align:&#x20;center;&#x20;text-decoration:&#x20;none;&#x20;width:&#x20;250px;&#x20;-webkit-text-size-adjust:&#x20;none;&quot;&#x20;href=&quot;_homeurl_&quot;&gt;Go&#x20;to&#x20;Pandora&#x20;FMS&#x20;Console&lt;/a&gt;&#x20;&lt;!--[if&#x20;mso]&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;/center&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;/v:rect&gt;&#x0d;&#x0a;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&lt;![endif]--&gt;&lt;/div&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;background-color:&#x20;#ffffff;&#x20;font-size:&#x20;0;&#x20;line-height:&#x20;0;&quot;&#x20;width=&quot;281&quot;&gt;&amp;nbsp;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-hide&quot;&#x20;style=&quot;padding-top:&#x20;20px;&#x20;padding-bottom:&#x20;0;&#x20;vertical-align:&#x20;bottom;&quot;&#x20;valign=&quot;bottom&quot;&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;padding-bottom:&#x20;0px;&#x20;vertical-align:&#x20;bottom;&quot;&#x20;align=&quot;right&quot;&#x20;valign=&quot;bottom&quot;&gt;&lt;img&#x20;style=&quot;vertical-align:&#x20;bottom;&#x20;padding-bottom:&#x20;10px;&quot;&#x20;src=&quot;https://pandorafms.com/images/alerta_verde.png&quot;&#x20;alt=&quot;&quot;&#x20;width=&quot;130&quot;&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/center&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;background-color:&#x20;#f8f8f8;&#x20;border-bottom:&#x20;1px&#x20;solid&#x20;#e7e7e7;&#x20;padding-top:&#x20;10px;&quot;&#x20;valign=&quot;top&quot;&gt;&lt;center&gt;&#x0d;&#x0a;&lt;table&#x20;class=&quot;w320&quot;&#x20;style=&quot;height:&#x20;100%;&#x20;width:&#x20;600px;&quot;&#x20;border=&quot;0&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-padding&quot;&#x20;style=&quot;padding:&#x20;20px;&quot;&#x20;valign=&quot;top&quot;&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;border=&quot;0&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;padding-right:&#x20;20px;&quot;&#x20;colspan=&quot;2&quot;&gt;&lt;strong&gt;Monitoring&#x20;details&lt;/strong&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;padding-top:&#x20;25px;&#x20;width:&#x20;150px;&#x20;border-top:&#x20;1px&#x20;solid&#x20;#E7E7E7;&#x20;vertical-align:&#x20;top;&quot;&gt;&lt;strong&gt;Data&lt;/strong&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;padding-top:&#x20;25px;&#x20;padding-right:&#x20;20px;&#x20;border-top:&#x20;1px&#x20;solid&#x20;#E7E7E7;&#x20;vertical-align:&#x20;top;&quot;&gt;_data_&#x20;&lt;em&gt;&#40;_modulestatus_&#41;&lt;/em&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&gt;&lt;strong&gt;Agent&lt;/strong&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;td&gt;_agent_&#x20;&lt;em&gt;_address_&lt;/em&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&gt;&lt;strong&gt;Module&lt;/strong&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;td&gt;_module_&#x20;&lt;em&gt;_moduledescription_&#x20;&lt;/em&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&gt;&lt;strong&gt;Timestamp&lt;/strong&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;td&gt;_timestamp_&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;padding-top:&#x20;20px;&quot;&gt;&#x0d;&#x0a;&lt;table&#x20;style=&quot;width:&#x20;100%;&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;vertical-align:&#x20;top;&quot;&#x20;width=&quot;350&quot;&gt;This&#x20;is&#x20;a&#x20;graph&#x20;of&#x20;latest&#x20;24hr&#x20;data&#x20;for&#x20;this&#x20;module:&#x20;&lt;br&gt;&lt;br&gt;&#x20;_modulegraph_24h_&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/center&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;style=&quot;background-color:&#x20;#1f1f1f;&quot;&gt;&lt;center&gt;&#x0d;&#x0a;&lt;table&#x20;class=&quot;w320&quot;&#x20;style=&quot;height:&#x20;100%;&#x20;color:&#x20;#ffffff;&#x20;width:&#x20;600px;&quot;&#x20;border=&quot;0&quot;&#x20;cellspacing=&quot;0&quot;&#x20;cellpadding=&quot;0&quot;&#x20;bgcolor=&quot;#1f1f1f&quot;&gt;&#x0d;&#x0a;&lt;tbody&gt;&#x0d;&#x0a;&lt;tr&gt;&#x0d;&#x0a;&lt;td&#x20;class=&quot;mobile-padding&quot;&#x20;style=&quot;font-size:&#x20;12px;&#x20;padding:&#x20;20px;&#x20;background-color:&#x20;#1f1f1f;&#x20;color:&#x20;#ffffff;&#x20;text-align:&#x20;center;&quot;&#x20;align=&quot;right&quot;&#x20;valign=&quot;middle&quot;&gt;&lt;a&#x20;style=&quot;color:&#x20;#ffffff;&quot;&#x20;href=&quot;https://pandorafms.com/company/contact/&quot;&gt;Contact&#x20;Us&lt;/a&gt;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&#x20;&lt;a&#x20;style=&quot;color:&#x20;#ffffff;&quot;&#x20;href=&quot;https://forums.pandorafms.com/&quot;&gt;Support&lt;/a&gt;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&#x20;&lt;a&#x20;style=&quot;color:&#x20;#ffffff;&quot;&#x20;href=&quot;https://wiki.pandorafms.com&quot;&gt;Docs&lt;/a&gt;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/center&gt;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;&#x0d;&#x0a;&lt;/td&gt;&#x0d;&#x0a;&lt;/tr&gt;&#x0d;&#x0a;&lt;/tbody&gt;&#x0d;&#x0a;&lt;/table&gt;','','','','','','','','','','','','',3,0,0,'basic',0,0,NULL);
/*!40000 ALTER TABLE `talert_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tattachment`
--

DROP TABLE IF EXISTS `tattachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tattachment` (
  `id_attachment` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_incidencia` int(10) unsigned NOT NULL DEFAULT '0',
  `id_usuario` varchar(60) NOT NULL DEFAULT '',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(150) DEFAULT '',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_attachment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tattachment`
--

LOCK TABLES `tattachment` WRITE;
/*!40000 ALTER TABLE `tattachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tattachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tautoconfig`
--

DROP TABLE IF EXISTS `tautoconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tautoconfig` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tautoconfig`
--

LOCK TABLES `tautoconfig` WRITE;
/*!40000 ALTER TABLE `tautoconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `tautoconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tautoconfig_actions`
--

DROP TABLE IF EXISTS `tautoconfig_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tautoconfig_actions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_autoconfig` int(10) unsigned NOT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `action_type` enum('set-group','set-secondary-group','apply-policy','launch-script','launch-event','launch-alert-action','raw-config') DEFAULT 'launch-event',
  `value` text,
  `custom` text,
  PRIMARY KEY (`id`),
  KEY `id_autoconfig` (`id_autoconfig`),
  CONSTRAINT `tautoconfig_action_ibfk_1` FOREIGN KEY (`id_autoconfig`) REFERENCES `tautoconfig` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tautoconfig_actions`
--

LOCK TABLES `tautoconfig_actions` WRITE;
/*!40000 ALTER TABLE `tautoconfig_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tautoconfig_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tautoconfig_rules`
--

DROP TABLE IF EXISTS `tautoconfig_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tautoconfig_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_autoconfig` int(10) unsigned NOT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `operator` enum('AND','OR') DEFAULT 'OR',
  `type` enum('alias','ip-range','group','os','custom-field','script','server-name') DEFAULT 'alias',
  `value` text,
  `custom` text,
  PRIMARY KEY (`id`),
  KEY `id_autoconfig` (`id_autoconfig`),
  CONSTRAINT `tautoconfig_rules_ibfk_1` FOREIGN KEY (`id_autoconfig`) REFERENCES `tautoconfig` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tautoconfig_rules`
--

LOCK TABLES `tautoconfig_rules` WRITE;
/*!40000 ALTER TABLE `tautoconfig_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `tautoconfig_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcategory`
--

DROP TABLE IF EXISTS `tcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcategory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(600) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcategory`
--

LOCK TABLES `tcategory` WRITE;
/*!40000 ALTER TABLE `tcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcluster`
--

DROP TABLE IF EXISTS `tcluster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcluster` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` tinytext NOT NULL,
  `cluster_type` enum('AA','AP') NOT NULL DEFAULT 'AA',
  `description` text NOT NULL,
  `group` int(10) unsigned NOT NULL DEFAULT '0',
  `id_agent` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcluster`
--

LOCK TABLES `tcluster` WRITE;
/*!40000 ALTER TABLE `tcluster` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcluster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcluster_agent`
--

DROP TABLE IF EXISTS `tcluster_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcluster_agent` (
  `id_cluster` int(10) unsigned NOT NULL,
  `id_agent` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_cluster`,`id_agent`),
  CONSTRAINT `tcluster_agent_ibfk_1` FOREIGN KEY (`id_cluster`) REFERENCES `tcluster` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcluster_agent`
--

LOCK TABLES `tcluster_agent` WRITE;
/*!40000 ALTER TABLE `tcluster_agent` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcluster_agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcluster_item`
--

DROP TABLE IF EXISTS `tcluster_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcluster_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` tinytext NOT NULL,
  `item_type` enum('AA','AP') NOT NULL DEFAULT 'AA',
  `critical_limit` int(10) unsigned NOT NULL DEFAULT '0',
  `warning_limit` int(10) unsigned NOT NULL DEFAULT '0',
  `is_critical` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `id_cluster` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cluster` (`id_cluster`),
  CONSTRAINT `tcluster_item_ibfk_1` FOREIGN KEY (`id_cluster`) REFERENCES `tcluster` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcluster_item`
--

LOCK TABLES `tcluster_item` WRITE;
/*!40000 ALTER TABLE `tcluster_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcluster_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcollection`
--

DROP TABLE IF EXISTS `tcollection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcollection` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `short_name` varchar(100) NOT NULL DEFAULT '',
  `id_group` int(10) unsigned NOT NULL DEFAULT '0',
  `description` mediumtext,
  `status` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcollection`
--

LOCK TABLES `tcollection` WRITE;
/*!40000 ALTER TABLE `tcollection` DISABLE KEYS */;
INSERT INTO `tcollection` VALUES (1,'Apache&#x20;Enterprise&#x20;Plugin','apache_plugin',0,'Apache&#x20;Enterprise&#x20;Plugin&#x20;to&#x20;monitor&#x20;Apache&#x20;web&#x20;server&#x20;using&#x20;a&#x20;Perl&#x20;script.',0);
/*!40000 ALTER TABLE `tcollection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tconfig`
--

DROP TABLE IF EXISTS `tconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tconfig` (
  `id_config` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(100) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id_config`)
) ENGINE=InnoDB AUTO_INCREMENT=336 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tconfig`
--

LOCK TABLES `tconfig` WRITE;
/*!40000 ALTER TABLE `tconfig` DISABLE KEYS */;
INSERT INTO `tconfig` VALUES (1,'cron_extension_installed','1'),(2,'cron_extension_sql_version','1'),(3,'cron_last_run','0'),(4,'language','en_GB'),(5,'block_size','20'),(6,'days_purge','45'),(7,'days_delete_unknown','0'),(8,'days_compact','0'),(9,'days_autodisable_deletion','30'),(10,'graph_res','5'),(11,'step_compact','1'),(12,'db_scheme_first_version','6.0dev'),(13,'db_scheme_version','6.0RC1'),(14,'db_scheme_build','PD150908'),(15,'show_unknown','0'),(16,'show_lastalerts','1'),(17,'style','pandora'),(18,'graph_color1','#99dd00'),(19,'graph_color2','#336600'),(20,'graph_color3','#3399cc'),(21,'graph_color4','#ff66cc'),(22,'graph_color5','#CC0000'),(23,'graph_color6','#0033FF'),(24,'graph_color7','#ff6600'),(25,'graph_color8','#330066'),(26,'graph_color9','#ffff00'),(27,'graph_color10','#99ffff'),(28,'trap2agent','0'),(29,'date_format','F j, Y, g:i a'),(30,'event_view_hr','8'),(31,'loginhash_pwd',''),(32,'trap2agent','0'),(33,'prominent_time','comparation'),(34,'timesource','system'),(35,'realtimestats','1'),(36,'stats_interval','60'),(37,'activate_gis','0'),(38,'activate_netflow','0'),(39,'timezone','Europe/Berlin'),(40,'string_purge','7'),(41,'audit_purge','15'),(42,'trap_purge','7'),(43,'event_purge','7'),(44,'gis_purge','7'),(45,'big_operation_step_datos_purge','100'),(46,'small_operation_step_datos_purge','1000'),(47,'sound_alert','include/sounds/air_shock_alarm.wav'),(48,'sound_critical','include/sounds/Star_Trek_emergency_simulation.wav'),(49,'sound_warning','include/sounds/negativebeep.wav'),(50,'netflow_interval','3600'),(51,'netflow_daemon','/usr/bin/nfcapd'),(52,'netflow_nfdump','/usr/bin/nfdump'),(53,'netflow_max_resolution','50'),(54,'event_fields','mini_severity,evento,id_agente,estado,timestamp'),(55,'status_monitor_fields','policy,agent,data_type,module_name,server_type,interval,status,last_status_change,graph,warn,data,timestamp'),(56,'list_ACL_IPs_for_API','127.0.0.1'),(57,'enable_pass_policy','0'),(58,'pass_size','4'),(59,'pass_needs_numbers','0'),(60,'pass_needs_symbols','0'),(61,'pass_expire','0'),(62,'first_login','0'),(63,'mins_fail_pass','5'),(64,'number_attempts','5'),(65,'enable_pass_policy_admin','0'),(66,'enable_pass_history','0'),(67,'compare_pass','3'),(68,'meta_style','meta_pandora'),(69,'enable_refr','0'),(70,'meta_num_elements','100'),(71,'update_manager_installed','1'),(72,'num_files_attachment','250'),(73,'show_vc','1'),(74,'inventory_changes_blacklist','1,2,20,21'),(75,'custom_report_front','0'),(76,'custom_report_front_font','FreeSans.ttf'),(77,'custom_report_front_logo','images/pandora_logo_white.jpg'),(78,'custom_report_front_header',''),(79,'custom_report_front_footer',''),(80,'MR','41'),(81,'identification_reminder','1'),(82,'identification_reminder_timestamp','0'),(83,'current_package_enterprise','749'),(84,'post_process_custom_values','{\"0.00000038580247\":\"Seconds&#x20;to&#x20;months\",\"0.00000165343915\":\"Seconds&#x20;to&#x20;weeks\",\"0.00001157407407\":\"Seconds&#x20;to&#x20;days\",\"0.01666666666667\":\"Seconds&#x20;to&#x20;minutes\",\"0.00000000093132\":\"Bytes&#x20;to&#x20;Gigabytes\",\"0.00000095367432\":\"Bytes&#x20;to&#x20;Megabytes\",\"0.0009765625\":\"Bytes&#x20;to&#x20;Kilobytes\",\"0.00000001653439\":\"Timeticks&#x20;to&#x20;weeks\",\"0.00000011574074\":\"Timeticks&#x20;to&#x20;days\"}'),(85,'custom_docs_logo','default_docs.png'),(86,'custom_support_logo','default_support.png'),(87,'custom_logo_white_bg_preview','pandora_logo_head_white_bg.png'),(88,'integria_enabled','0'),(89,'integria_user',''),(90,'integria_pass',''),(91,'integria_hostname',''),(92,'integria_api_pass',''),(93,'integria_req_timeout','5'),(94,'default_group',''),(95,'default_criticity',''),(96,'default_creator',''),(97,'default_owner',''),(98,'incident_type',''),(99,'incident_status',''),(100,'incident_title',''),(101,'incident_content',''),(102,'cr_default_group',''),(103,'cr_default_criticity',''),(104,'cr_default_creator',''),(105,'cr_default_owner',''),(106,'cr_incident_type',''),(107,'cr_incident_status',''),(108,'cr_incident_title',''),(109,'cr_incident_content',''),(110,'sample_agent','0'),(111,'gotty','/usr/bin/gotty'),(112,'custom_module_units','{\"bytes\":\"bytes\",\"entries\":\"entries\",\"files\":\"files\",\"hits\":\"hits\",\"sessions\":\"sessions\",\"users\":\"users\",\"ÂºC\":\"ÂºC\",\"ÂºF\":\"ÂºF\"}'),(113,'server_unique_identifier','d0aae341f9b411ea8de53a560a986d44'),(114,'remote_config','/var/spool/pandora/data_in'),(115,'phantomjs_bin','/usr/bin'),(116,'report_limit','100'),(117,'https',''),(118,'use_cert',''),(119,'cert_path','/etc/ssl/certs/pandorafms.pem'),(120,'status_images_set','default'),(121,'round_corner',''),(122,'show_qr_code_header',''),(123,'agentaccess','1'),(124,'delete_notinit','0'),(125,'num_past_special_days','0'),(126,'delete_old_messages','21'),(127,'delete_old_network_matrix','10'),(128,'max_graph_container','10'),(129,'max_execution_event_response','10'),(130,'max_macro_fields','10'),(131,'metaconsole_events_history','0'),(132,'acl_enterprise','0'),(133,'metaconsole','0'),(134,'collection_max_size','1000000'),(135,'event_replication','0'),(136,'replication_interval','10'),(137,'replication_limit','50'),(138,'replication_dbengine','mysql'),(139,'replication_dbhost',''),(140,'replication_dbname',''),(141,'replication_dbuser',''),(142,'replication_dbpass',''),(143,'replication_dbport',''),(144,'replication_mode','only_validated'),(145,'metaconsole_agent_cache','0'),(146,'show_events_in_local','0'),(147,'log_collector','0'),(148,'enable_update_manager','1'),(149,'disabled_newsletter','0'),(150,'ipam_ocuppied_critical_treshold','90'),(151,'ipam_ocuppied_warning_treshold','80'),(152,'reset_pass_option','0'),(153,'include_agents','0'),(154,'alias_as_name','0'),(155,'console_log_enabled','0'),(156,'audit_log_enabled','0'),(157,'elasticsearch_ip',''),(158,'elasticsearch_port','9200'),(159,'number_logs_viewed','50'),(160,'Days_purge_old_information','90'),(161,'font_size','6'),(162,'limit_parameters_massive','500'),(163,'unique_ip','0'),(164,'welcome_state','1'),(165,'attachment_store','/var/www/html/pandora_console/attachment'),(166,'fontpath','/var/www/html/pandora_console/include/fonts/smallfont.ttf'),(167,'login_background',''),(168,'login_background_meta','background_metaconsole.png'),(169,'paginate_module',''),(170,'graphviz_bin_dir',''),(171,'disable_help',''),(172,'fixed_header',''),(173,'fixed_graph',''),(174,'custom_favicon',''),(175,'custom_logo','pandora_logo_head_4.png'),(176,'custom_logo_collapsed','pandora_logo_green_collapsed.png'),(177,'custom_logo_white_bg','pandora_logo_head_white_bg.png'),(178,'custom_logo_login','login_logo_v7.png'),(179,'custom_splash_login','splash_image_default.png'),(180,'custom_network_center_logo',''),(181,'custom_mobile_console_logo',''),(182,'custom_title_header','Pandora&#x20;FMS'),(183,'custom_subtitle_header','the&#x20;Flexible&#x20;Monitoring&#x20;System'),(184,'custom_title1_login','PANDORA&#x20;FMS'),(185,'custom_title2_login','ONE&#x20;TOOL&#x20;TO&#x20;MONITOR&#x20;THEM&#x20;ALL'),(186,'custom_docs_url','http://wiki.pandorafms.com/'),(187,'custom_support_url','https://support.artica.es'),(188,'rb_product_name','Pandora&#x20;FMS'),(189,'rb_copyright_notice','PandoraFMS.com'),(190,'meta_custom_docs_url','http://wiki.pandorafms.com/index.php?title=Main_Page'),(191,'meta_custom_support_url','https://support.artica.es'),(192,'meta_custom_logo','logo_pandora_metaconsola.png'),(193,'pandora_logo_head_white_bg','pandora_logo_head_white_bg.png'),(194,'meta_custom_logo_login','pandora_logo.png'),(195,'meta_custom_splash_login','splash_image_metaconsola.png'),(196,'meta_custom_title1_login','PANDORA&#x20;FMS&#x20;NEXT&#x20;GENERATION'),(197,'meta_custom_title2_login','METACONSOLE'),(198,'vc_favourite_view','0'),(199,'vc_menu_items','10'),(200,'ser_menu_items','10'),(201,'history_db_enabled',''),(202,'history_event_enabled',''),(203,'history_db_host',''),(204,'history_db_port','3306'),(205,'history_db_name','pandora'),(206,'history_db_user','pandora'),(207,'history_db_pass',''),(208,'history_db_days','0'),(209,'history_event_days','90'),(210,'history_db_step','0'),(211,'history_db_delay','0'),(212,'email_from_dir','pandora@pandorafms.org'),(213,'email_from_name','Pandora&#x20;FMS'),(214,'email_smtpServer','127.0.0.1'),(215,'email_smtpPort','25'),(216,'email_encryption','0'),(217,'email_username',''),(218,'email_password',''),(219,'activate_nta','0'),(220,'netflow_path','/var/spool/pandora/data_in/netflow'),(221,'netflow_nfexpire','/usr/bin/nfexpire'),(222,'netflow_disable_custom_lvfilters','0'),(223,'netflow_max_lifetime','5'),(224,'auth','mysql'),(225,'autocreate_remote_users','0'),(226,'autocreate_blacklist',''),(227,'default_remote_profile','0'),(228,'default_remote_group','0'),(229,'default_assign_tags',''),(230,'default_no_hierarchy','0'),(231,'ldap_server','localhost'),(232,'ldap_port','389'),(233,'ldap_version','3'),(234,'ldap_start_tls','0'),(235,'ldap_base_dn','ou=People,dc=edu,dc=example,dc=org'),(236,'ldap_login_attr','uid'),(237,'ldap_admin_login',''),(238,'ldap_admin_pass',''),(239,'ldap_function','local'),(240,'fallback_local_auth','0'),(241,'ad_server','localhost'),(242,'ad_port','389'),(243,'ad_start_tls','0'),(244,'ad_advanced_config','0'),(245,'ldap_advanced_config','0'),(246,'ad_adv_user_node','1'),(247,'ldap_adv_user_node','1'),(248,'ad_domain',''),(249,'ad_adv_perms',''),(250,'ldap_adv_perms',''),(251,'rpandora_server','localhost'),(252,'rpandora_port','3306'),(253,'rpandora_dbname','pandora'),(254,'rpandora_user','pandora'),(255,'rpandora_pass',''),(256,'rintegria_server','localhost'),(257,'rintegria_port','3306'),(258,'rintegria_dbname','integria'),(259,'rintegria_user','integria'),(260,'rintegria_pass',''),(261,'saml_path','/opt/'),(262,'saml_source',''),(263,'saml_user_id',''),(264,'saml_mail',''),(265,'saml_group_name',''),(266,'saml_attr_type',''),(267,'saml_profiles_and_tags',''),(268,'saml_profile',''),(269,'saml_tag',''),(270,'saml_profile_tag_separator',''),(271,'autoupdate','1'),(272,'api_password',''),(273,'legacy_vc','1'),(274,'vc_default_cache_expiration','60'),(275,'vc_refr','300'),(276,'vc_line_thickness','2'),(277,'agent_size_text_small','18'),(278,'agent_size_text_medium','50'),(279,'module_size_text_small','25'),(280,'module_size_text_medium','50'),(281,'description_size_text','60'),(282,'item_title_size_text','45'),(283,'simple_module_value','1'),(284,'gis_label','0'),(285,'interface_unit','Bytes'),(286,'graph_precision','1'),(287,'gis_default_icon','marker'),(288,'interval_values',''),(289,'public_url',''),(290,'referer_security','0'),(291,'event_storm_protection','0'),(292,'use_custom_encoding','0'),(293,'server_log_dir',''),(294,'max_log_size','512'),(295,'show_group_name','0'),(296,'custom_graph_width','1'),(297,'type_module_charts','area'),(298,'type_interface_charts','line'),(299,'render_proc','0'),(300,'graph_image_height','280'),(301,'zoom_graph','1'),(302,'percentil','95'),(303,'render_proc_ok','Ok'),(304,'render_proc_fail','Fail'),(305,'click_display','1'),(306,'csv_divider',';'),(307,'csv_decimal_separator','.'),(308,'use_data_multiplier','1'),(309,'command_snapshot','1'),(310,'custom_report_info','1'),(311,'font_size_item_report','2'),(312,'custom_report_front_firstpage','&amp;lt;p&amp;#x20;style=&amp;quot;text-align:&amp;#x20;center;&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;&amp;#x0d;&amp;#x0a;&amp;lt;p&amp;#x20;style=&amp;quot;text-align:&amp;#x20;center;&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;&amp;#x0d;&amp;#x0a;&amp;lt;p&amp;#x20;style=&amp;quot;text-align:&amp;#x20;center;&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;&amp;#x0d;&amp;#x0a;&amp;lt;p&amp;#x20;style=&amp;quot;text-align:&amp;#x20;center;&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;&amp;#x0d;&amp;#x0a;&amp;lt;p&amp;#x20;style=&amp;quot;text-align:&amp;#x20;center;&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;&amp;#x0d;&amp;#x0a;&amp;lt;p&amp;#x20;style=&amp;quot;text-align:&amp;#x20;center;&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;&amp;#x0d;&amp;#x0a;&amp;lt;p&amp;#x20;style=&amp;quot;text-align:&amp;#x20;center;&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;&amp;#x0d;&amp;#x0a;&amp;lt;p&amp;#x20;style=&amp;quot;text-align:&amp;#x20;center;&amp;quot;&amp;gt;&amp;lt;img&amp;#x20;src=&amp;quot;&amp;#40;_URLIMAGE_&amp;#41;/images/pandora_report_logo.png&amp;quot;&amp;#x20;alt=&amp;quot;&amp;quot;&amp;#x20;width=&amp;quot;800&amp;quot;&amp;#x20;/&amp;gt;&amp;lt;/p&amp;gt;&amp;#x0d;&amp;#x0a;&amp;lt;p&amp;#x20;style=&amp;quot;text-align:&amp;#x20;center;&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;&amp;#x0d;&amp;#x0a;&amp;lt;p&amp;#x20;style=&amp;quot;text-align:&amp;#x20;center;&amp;quot;&amp;gt;&amp;lt;span&amp;#x20;style=&amp;quot;font-size:&amp;#x20;xx-large;&amp;quot;&amp;gt;&amp;#40;_REPORT_NAME_&amp;#41;&amp;lt;/span&amp;gt;&amp;lt;/p&amp;gt;&amp;#x0d;&amp;#x0a;&amp;lt;p&amp;#x20;style=&amp;quot;text-align:&amp;#x20;center;&amp;quot;&amp;gt;&amp;lt;span&amp;#x20;style=&amp;quot;font-size:&amp;#x20;large;&amp;quot;&amp;gt;&amp;#40;_DATETIME_&amp;#41;&amp;lt;/span&amp;gt;&amp;lt;/p&amp;gt;'),(313,'autohidden_menu','0'),(314,'visual_animation','1'),(315,'networkmap_max_width','900'),(316,'short_module_graph_data',''),(317,'tutorial_mode','full'),(318,'update_manager_proxy_server',''),(319,'update_manager_proxy_port',''),(320,'update_manager_proxy_user',''),(321,'update_manager_proxy_password',''),(322,'session_timeout','90'),(323,'max_file_size','2M'),(324,'initial_wizard','1'),(325,'instance_registered','0'),(326,'ehorus_enabled','0'),(327,'ehorus_custom_field','eHorusID'),(328,'ehorus_hostname','portal.ehorus.com'),(329,'ehorus_port','18080'),(330,'ehorus_req_timeout','5'),(331,'module_library_user',''),(332,'module_library_password',''),(333,'url_update_manager','https://licensing.artica.es/pandoraupdate7/server.php'),(334,'files_repo_installed','1'),(335,'db_maintance','1600436751');
/*!40000 ALTER TABLE `tconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tconfig_os`
--

DROP TABLE IF EXISTS `tconfig_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tconfig_os` (
  `id_os` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(250) DEFAULT '',
  `icon_name` varchar(100) DEFAULT '',
  `previous_name` text,
  PRIMARY KEY (`id_os`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tconfig_os`
--

LOCK TABLES `tconfig_os` WRITE;
/*!40000 ALTER TABLE `tconfig_os` DISABLE KEYS */;
INSERT INTO `tconfig_os` VALUES (1,'Linux','Linux: All versions','so_linux.png',''),(2,'Solaris','Sun Solaris','so_solaris.png',''),(3,'AIX','IBM AIX','so_aix.png',''),(4,'BSD','OpenBSD, FreeBSD and Others','so_bsd.png',''),(5,'HP-UX','HP-UX Unix OS','so_hpux.png',''),(7,'Cisco','CISCO IOS','so_cisco.png',''),(8,'MacOS','MAC OS','so_mac.png',''),(9,'Windows','Microsoft Windows OS','so_win.png',''),(10,'Other','Other SO','so_other.png',''),(11,'Network','Network Agent','network.png',''),(12,'Web Server','Web Server/Application','network.png',''),(13,'Sensor','Hardware Agent (Sensor)','network.png',''),(14,'Embedded','Embedded device running an agent','embedded.png',''),(15,'Android','Android agent','android.png',''),(16,'VMware','VMware Architecture','so_vmware.png',''),(17,'Router','Generic router','so_router.png',''),(18,'Switch','Generic switch','so_switch.png',''),(19,'Satellite','Satellite agent','satellite.png',''),(20,'Mainframe','Mainframe agent','so_mainframe.png',''),(100,'Cluster','Cluster agent','so_cluster.png','');
/*!40000 ALTER TABLE `tconfig_os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcontainer`
--

DROP TABLE IF EXISTS `tcontainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcontainer` (
  `id_container` mediumint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `parent` mediumint(4) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `id_group` mediumint(8) unsigned DEFAULT '0',
  `description` text NOT NULL,
  PRIMARY KEY (`id_container`),
  KEY `parent_index` (`parent`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcontainer`
--

LOCK TABLES `tcontainer` WRITE;
/*!40000 ALTER TABLE `tcontainer` DISABLE KEYS */;
INSERT INTO `tcontainer` VALUES (1,'Default graph container',0,0,0,'');
/*!40000 ALTER TABLE `tcontainer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcontainer_item`
--

DROP TABLE IF EXISTS `tcontainer_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcontainer_item` (
  `id_ci` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_container` mediumint(4) unsigned NOT NULL DEFAULT '0',
  `type` varchar(30) DEFAULT 'simple_graph',
  `id_agent` int(10) unsigned NOT NULL DEFAULT '0',
  `id_agent_module` bigint(14) unsigned DEFAULT NULL,
  `time_lapse` int(11) NOT NULL DEFAULT '0',
  `id_graph` int(10) unsigned DEFAULT '0',
  `only_average` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `id_group` int(10) unsigned NOT NULL DEFAULT '0',
  `id_module_group` int(10) unsigned NOT NULL DEFAULT '0',
  `agent` varchar(100) NOT NULL DEFAULT '',
  `module` varchar(100) NOT NULL DEFAULT '',
  `id_tag` int(10) unsigned NOT NULL DEFAULT '0',
  `type_graph` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fullscale` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_ci`),
  KEY `id_container` (`id_container`),
  CONSTRAINT `tcontainer_item_ibfk_1` FOREIGN KEY (`id_container`) REFERENCES `tcontainer` (`id_container`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcontainer_item`
--

LOCK TABLES `tcontainer_item` WRITE;
/*!40000 ALTER TABLE `tcontainer_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcontainer_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcredential_store`
--

DROP TABLE IF EXISTS `tcredential_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcredential_store` (
  `identifier` varchar(100) NOT NULL,
  `id_group` mediumint(4) unsigned NOT NULL DEFAULT '0',
  `product` enum('CUSTOM','AWS','AZURE','GOOGLE','SAP') DEFAULT 'CUSTOM',
  `username` text,
  `password` text,
  `extra_1` text,
  `extra_2` text,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcredential_store`
--

LOCK TABLES `tcredential_store` WRITE;
/*!40000 ALTER TABLE `tcredential_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcredential_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tdashboard`
--

DROP TABLE IF EXISTS `tdashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tdashboard` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '',
  `id_user` varchar(60) NOT NULL DEFAULT '',
  `id_group` int(10) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `cells` int(10) unsigned DEFAULT '0',
  `cells_slideshow` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tdashboard`
--

LOCK TABLES `tdashboard` WRITE;
/*!40000 ALTER TABLE `tdashboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `tdashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tdatabase`
--

DROP TABLE IF EXISTS `tdatabase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tdatabase` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `host` varchar(255) DEFAULT '',
  `label` varchar(255) DEFAULT '',
  `os_port` int(10) unsigned NOT NULL DEFAULT '22',
  `os_user` varchar(255) DEFAULT '',
  `db_port` int(10) unsigned NOT NULL DEFAULT '3306',
  `status` tinyint(1) unsigned DEFAULT '0',
  `action` tinyint(1) unsigned DEFAULT '0',
  `ssh_key` text,
  `ssh_pubkey` text,
  `last_error` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tdatabase`
--

LOCK TABLES `tdatabase` WRITE;
/*!40000 ALTER TABLE `tdatabase` DISABLE KEYS */;
/*!40000 ALTER TABLE `tdatabase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tdeployment_hosts`
--

DROP TABLE IF EXISTS `tdeployment_hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tdeployment_hosts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_cs` varchar(100) DEFAULT NULL,
  `ip` varchar(100) NOT NULL,
  `id_os` int(10) unsigned DEFAULT '0',
  `os_version` varchar(100) DEFAULT '' COMMENT 'OS version in STR format',
  `arch` enum('x64','x86') DEFAULT 'x64',
  `current_agent_version` varchar(100) DEFAULT '' COMMENT 'String latest installed agent',
  `target_agent_version_id` bigint(20) unsigned DEFAULT NULL,
  `deployed` bigint(20) NOT NULL DEFAULT '0' COMMENT 'When it was deployed',
  `server_ip` varchar(100) DEFAULT NULL COMMENT 'Where to point target agent',
  `last_err` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `ip` (`ip`),
  KEY `id_cs` (`id_cs`),
  KEY `id_os` (`id_os`),
  KEY `target_agent_version_id` (`target_agent_version_id`),
  CONSTRAINT `tdeployment_hosts_ibfk_1` FOREIGN KEY (`id_cs`) REFERENCES `tcredential_store` (`identifier`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `tdeployment_hosts_ibfk_2` FOREIGN KEY (`id_os`) REFERENCES `tconfig_os` (`id_os`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tdeployment_hosts_ibfk_3` FOREIGN KEY (`target_agent_version_id`) REFERENCES `tagent_repository` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tdeployment_hosts`
--

LOCK TABLES `tdeployment_hosts` WRITE;
/*!40000 ALTER TABLE `tdeployment_hosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `tdeployment_hosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tdiscovery_tmp_agents`
--

DROP TABLE IF EXISTS `tdiscovery_tmp_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tdiscovery_tmp_agents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_rt` int(10) unsigned NOT NULL,
  `label` varchar(600) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `data` mediumtext,
  `review_date` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_rt` (`id_rt`),
  KEY `label` (`label`(255)),
  CONSTRAINT `tdta_trt` FOREIGN KEY (`id_rt`) REFERENCES `trecon_task` (`id_rt`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tdiscovery_tmp_agents`
--

LOCK TABLES `tdiscovery_tmp_agents` WRITE;
/*!40000 ALTER TABLE `tdiscovery_tmp_agents` DISABLE KEYS */;
/*!40000 ALTER TABLE `tdiscovery_tmp_agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tdiscovery_tmp_connections`
--

DROP TABLE IF EXISTS `tdiscovery_tmp_connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tdiscovery_tmp_connections` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_rt` int(10) unsigned NOT NULL,
  `dev_1` text,
  `dev_2` text,
  `if_1` text,
  `if_2` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tdiscovery_tmp_connections`
--

LOCK TABLES `tdiscovery_tmp_connections` WRITE;
/*!40000 ALTER TABLE `tdiscovery_tmp_connections` DISABLE KEYS */;
/*!40000 ALTER TABLE `tdiscovery_tmp_connections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tevent_alert`
--

DROP TABLE IF EXISTS `tevent_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tevent_alert` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text,
  `description` mediumtext,
  `order` int(10) unsigned DEFAULT '0',
  `mode` enum('PASS','DROP') DEFAULT NULL,
  `field1` text NOT NULL,
  `field2` text NOT NULL,
  `field3` text NOT NULL,
  `field4` text NOT NULL,
  `field5` text NOT NULL,
  `field6` text NOT NULL,
  `field7` text NOT NULL,
  `field8` text NOT NULL,
  `field9` text NOT NULL,
  `field10` text NOT NULL,
  `time_threshold` int(10) NOT NULL DEFAULT '86400',
  `max_alerts` int(4) unsigned NOT NULL DEFAULT '1',
  `min_alerts` int(4) unsigned NOT NULL DEFAULT '0',
  `time_from` time DEFAULT '00:00:00',
  `time_to` time DEFAULT '00:00:00',
  `monday` tinyint(1) DEFAULT '1',
  `tuesday` tinyint(1) DEFAULT '1',
  `wednesday` tinyint(1) DEFAULT '1',
  `thursday` tinyint(1) DEFAULT '1',
  `friday` tinyint(1) DEFAULT '1',
  `saturday` tinyint(1) DEFAULT '1',
  `sunday` tinyint(1) DEFAULT '1',
  `recovery_notify` tinyint(1) DEFAULT '0',
  `field2_recovery` text NOT NULL,
  `field3_recovery` text NOT NULL,
  `id_group` mediumint(8) unsigned DEFAULT '0',
  `internal_counter` int(4) DEFAULT '0',
  `last_fired` bigint(20) NOT NULL DEFAULT '0',
  `last_reference` bigint(20) NOT NULL DEFAULT '0',
  `times_fired` int(3) NOT NULL DEFAULT '0',
  `disabled` tinyint(1) DEFAULT '0',
  `standby` tinyint(1) DEFAULT '0',
  `priority` tinyint(4) DEFAULT '0',
  `force_execution` tinyint(1) DEFAULT '0',
  `group_by` enum('','id_agente','id_agentmodule','id_alert_am','id_grupo') DEFAULT '',
  `special_days` tinyint(1) DEFAULT '0',
  `disable_event` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tevent_alert`
--

LOCK TABLES `tevent_alert` WRITE;
/*!40000 ALTER TABLE `tevent_alert` DISABLE KEYS */;
/*!40000 ALTER TABLE `tevent_alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tevent_alert_action`
--

DROP TABLE IF EXISTS `tevent_alert_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tevent_alert_action` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_event_alert` int(10) unsigned NOT NULL,
  `id_alert_action` int(10) unsigned NOT NULL,
  `fires_min` int(3) unsigned DEFAULT '0',
  `fires_max` int(3) unsigned DEFAULT '0',
  `module_action_threshold` int(10) NOT NULL DEFAULT '0',
  `last_execution` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_event_alert` (`id_event_alert`),
  KEY `id_alert_action` (`id_alert_action`),
  CONSTRAINT `tevent_alert_action_ibfk_1` FOREIGN KEY (`id_event_alert`) REFERENCES `tevent_alert` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tevent_alert_action_ibfk_2` FOREIGN KEY (`id_alert_action`) REFERENCES `talert_actions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tevent_alert_action`
--

LOCK TABLES `tevent_alert_action` WRITE;
/*!40000 ALTER TABLE `tevent_alert_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `tevent_alert_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tevent_custom_field`
--

DROP TABLE IF EXISTS `tevent_custom_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tevent_custom_field` (
  `id_group` mediumint(4) unsigned NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tevent_custom_field`
--

LOCK TABLES `tevent_custom_field` WRITE;
/*!40000 ALTER TABLE `tevent_custom_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `tevent_custom_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tevent_extended`
--

DROP TABLE IF EXISTS `tevent_extended`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tevent_extended` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_evento` bigint(20) unsigned NOT NULL,
  `external_id` bigint(20) unsigned DEFAULT NULL,
  `utimestamp` bigint(20) NOT NULL DEFAULT '0',
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `tevent_ext_fk` (`id_evento`),
  CONSTRAINT `tevent_extended_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `tevento` (`id_evento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tevent_extended`
--

LOCK TABLES `tevent_extended` WRITE;
/*!40000 ALTER TABLE `tevent_extended` DISABLE KEYS */;
/*!40000 ALTER TABLE `tevent_extended` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tevent_filter`
--

DROP TABLE IF EXISTS `tevent_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tevent_filter` (
  `id_filter` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_group_filter` int(10) NOT NULL DEFAULT '0',
  `id_name` varchar(600) NOT NULL,
  `id_group` int(10) NOT NULL DEFAULT '0',
  `event_type` text NOT NULL,
  `severity` text NOT NULL,
  `status` int(10) NOT NULL DEFAULT '-1',
  `search` text,
  `text_agent` text,
  `id_agent` int(10) DEFAULT '0',
  `id_agent_module` int(10) DEFAULT '0',
  `pagination` int(10) NOT NULL DEFAULT '25',
  `event_view_hr` int(10) NOT NULL DEFAULT '8',
  `id_user_ack` text,
  `group_rep` int(10) NOT NULL DEFAULT '0',
  `tag_with` text NOT NULL,
  `tag_without` text NOT NULL,
  `filter_only_alert` int(10) NOT NULL DEFAULT '-1',
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `source` tinytext NOT NULL,
  `id_extra` tinytext NOT NULL,
  `user_comment` text NOT NULL,
  `id_source_event` int(10) DEFAULT '0',
  PRIMARY KEY (`id_filter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tevent_filter`
--

LOCK TABLES `tevent_filter` WRITE;
/*!40000 ALTER TABLE `tevent_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `tevent_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tevent_response`
--

DROP TABLE IF EXISTS `tevent_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tevent_response` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(600) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `target` text NOT NULL,
  `type` varchar(60) NOT NULL,
  `id_group` mediumint(4) NOT NULL DEFAULT '0',
  `modal_width` int(11) NOT NULL DEFAULT '0',
  `modal_height` int(11) NOT NULL DEFAULT '0',
  `new_window` tinyint(4) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `server_to_exec` int(10) unsigned NOT NULL DEFAULT '0',
  `command_timeout` int(5) unsigned NOT NULL DEFAULT '90',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tevent_response`
--

LOCK TABLES `tevent_response` WRITE;
/*!40000 ALTER TABLE `tevent_response` DISABLE KEYS */;
INSERT INTO `tevent_response` VALUES (1,'Ping&#x20;to&#x20;host','Ping&#x20;to&#x20;the&#x20;agent&#x20;host','ping&#x20;-c&#x20;5&#x20;_agent_address_','command',0,620,500,0,'',0,90),(3,'Create&#x20;incident&#x20;from&#x20;event','Create&#x20;a&#x20;incident&#x20;from&#x20;the&#x20;event&#x20;with&#x20;the&#x20;standard&#x20;incidents&#x20;system&#x20;of&#x20;Pandora&#x20;FMS','index.php?sec=workspace&amp;sec2=operation/incidents/incident_detail&amp;insert_form&amp;from_event=_event_id_','url',0,0,0,1,'',0,90),(5,'Restart&#x20;agent','Restart&#x20;the&#x20;agent&#x20;with&#x20;using&#x20;UDP&#x20;protocol.&#x0d;&#x0a;&#x0d;&#x0a;To&#x20;use&#x20;this&#x20;response&#x20;is&#x20;necessary&#x20;to&#x20;have&#x20;installed&#x20;Pandora&#x20;FMS&#x20;server&#x20;and&#x20;console&#x20;in&#x20;the&#x20;same&#x20;machine.','/usr/share/pandora_server/util/udp_client.pl&#x20;_agent_address_&#x20;41122&#x20;&quot;REFRESH&#x20;AGENT&quot;','command',0,620,500,0,'',0,90),(6,'Ping&#x20;to&#x20;module&#x20;agent&#x20;host','Ping&#x20;to&#x20;the&#x20;module&#x20;agent&#x20;host','ping&#x20;-c&#x20;5&#x20;_module_address_','command',0,620,500,0,'',0,90);
/*!40000 ALTER TABLE `tevent_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tevent_rule`
--

DROP TABLE IF EXISTS `tevent_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tevent_rule` (
  `id_event_rule` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_event_alert` int(10) unsigned NOT NULL,
  `operation` enum('NOP','AND','OR','XOR','NAND','NOR','NXOR') DEFAULT NULL,
  `order` int(10) unsigned DEFAULT '0',
  `window` int(10) NOT NULL DEFAULT '0',
  `count` int(4) NOT NULL DEFAULT '1',
  `agent` text,
  `id_usuario` varchar(100) NOT NULL DEFAULT '',
  `id_grupo` mediumint(4) DEFAULT NULL,
  `evento` text NOT NULL,
  `event_type` enum('','unknown','alert_fired','alert_recovered','alert_ceased','alert_manual_validation','recon_host_detected','system','error','new_agent','going_up_warning','going_up_critical','going_down_warning','going_down_normal','going_down_critical','going_up_normal') DEFAULT '',
  `module` text,
  `alert` text,
  `criticity` int(4) unsigned DEFAULT NULL,
  `user_comment` text NOT NULL,
  `id_tag` int(10) unsigned NOT NULL DEFAULT '0',
  `name` text,
  `group_recursion` int(1) unsigned DEFAULT '0',
  `log_content` text,
  `log_source` text,
  `log_agent` text,
  `operator_agent` text COMMENT 'Operator for agent',
  `operator_id_usuario` text COMMENT 'Operator for id_usuario',
  `operator_id_grupo` text COMMENT 'Operator for id_grupo',
  `operator_evento` text COMMENT 'Operator for evento',
  `operator_event_type` text COMMENT 'Operator for event_type',
  `operator_module` text COMMENT 'Operator for module',
  `operator_alert` text COMMENT 'Operator for alert',
  `operator_criticity` text COMMENT 'Operator for criticity',
  `operator_user_comment` text COMMENT 'Operator for user_comment',
  `operator_id_tag` text COMMENT 'Operator for id_tag',
  `operator_log_content` text COMMENT 'Operator for log_content',
  `operator_log_source` text COMMENT 'Operator for log_source',
  `operator_log_agent` text COMMENT 'Operator for log_agent',
  PRIMARY KEY (`id_event_rule`),
  KEY `idx_id_event_alert` (`id_event_alert`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tevent_rule`
--

LOCK TABLES `tevent_rule` WRITE;
/*!40000 ALTER TABLE `tevent_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `tevent_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tevento`
--

DROP TABLE IF EXISTS `tevento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tevento` (
  `id_evento` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_agente` int(10) NOT NULL DEFAULT '0',
  `id_usuario` varchar(100) NOT NULL DEFAULT '0',
  `id_grupo` mediumint(4) NOT NULL DEFAULT '0',
  `estado` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `timestamp` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `evento` text NOT NULL,
  `utimestamp` bigint(20) NOT NULL DEFAULT '0',
  `event_type` enum('going_unknown','unknown','alert_fired','alert_recovered','alert_ceased','alert_manual_validation','recon_host_detected','system','error','new_agent','going_up_warning','going_up_critical','going_down_warning','going_down_normal','going_down_critical','going_up_normal','configuration_change') DEFAULT 'unknown',
  `id_agentmodule` int(10) NOT NULL DEFAULT '0',
  `id_alert_am` int(10) NOT NULL DEFAULT '0',
  `criticity` int(4) unsigned NOT NULL DEFAULT '0',
  `user_comment` text NOT NULL,
  `tags` text NOT NULL,
  `source` tinytext NOT NULL,
  `id_extra` tinytext NOT NULL,
  `critical_instructions` text NOT NULL,
  `warning_instructions` text NOT NULL,
  `unknown_instructions` text NOT NULL,
  `owner_user` varchar(100) NOT NULL DEFAULT '',
  `ack_utimestamp` bigint(20) NOT NULL DEFAULT '0',
  `custom_data` text NOT NULL,
  `data` double(22,5) DEFAULT NULL,
  `module_status` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_evento`),
  KEY `idx_agente` (`id_agente`),
  KEY `idx_agentmodule` (`id_agentmodule`),
  KEY `idx_utimestamp` (`utimestamp`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tevento`
--

LOCK TABLES `tevento` WRITE;
/*!40000 ALTER TABLE `tevento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tevento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `textension_translate_string`
--

DROP TABLE IF EXISTS `textension_translate_string`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `textension_translate_string` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(10) NOT NULL,
  `string` text NOT NULL,
  `translation` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lang_index` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `textension_translate_string`
--

LOCK TABLES `textension_translate_string` WRITE;
/*!40000 ALTER TABLE `textension_translate_string` DISABLE KEYS */;
/*!40000 ALTER TABLE `textension_translate_string` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tfiles_repo`
--

DROP TABLE IF EXISTS `tfiles_repo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tfiles_repo` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(500) DEFAULT '',
  `hash` varchar(8) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tfiles_repo`
--

LOCK TABLES `tfiles_repo` WRITE;
/*!40000 ALTER TABLE `tfiles_repo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tfiles_repo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tfiles_repo_group`
--

DROP TABLE IF EXISTS `tfiles_repo_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tfiles_repo_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_file` int(5) unsigned NOT NULL,
  `id_group` int(4) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_file` (`id_file`),
  CONSTRAINT `tfiles_repo_group_ibfk_1` FOREIGN KEY (`id_file`) REFERENCES `tfiles_repo` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tfiles_repo_group`
--

LOCK TABLES `tfiles_repo_group` WRITE;
/*!40000 ALTER TABLE `tfiles_repo_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `tfiles_repo_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tgis_data_history`
--

DROP TABLE IF EXISTS `tgis_data_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tgis_data_history` (
  `id_tgis_data` int(11) NOT NULL AUTO_INCREMENT COMMENT 'key of the table',
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  `altitude` double DEFAULT NULL,
  `start_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'timestamp on wich the agente started to be in this position',
  `end_timestamp` timestamp NULL DEFAULT NULL COMMENT 'timestamp on wich the agent was placed for last time on this position',
  `description` text COMMENT 'description of the region correoponding to this placemnt',
  `manual_placement` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 to show that the position cames from the agent, 1 to show that the position was established manualy',
  `number_of_packages` int(11) NOT NULL DEFAULT '1' COMMENT 'Number of data packages received with this position from the start_timestampa to the_end_timestamp',
  `tagente_id_agente` int(10) unsigned NOT NULL COMMENT 'reference to the agent',
  PRIMARY KEY (`id_tgis_data`),
  KEY `start_timestamp_index` (`start_timestamp`) USING BTREE,
  KEY `end_timestamp_index` (`end_timestamp`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table to store historical GIS information of the agents';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tgis_data_history`
--

LOCK TABLES `tgis_data_history` WRITE;
/*!40000 ALTER TABLE `tgis_data_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `tgis_data_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tgis_data_status`
--

DROP TABLE IF EXISTS `tgis_data_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tgis_data_status` (
  `tagente_id_agente` int(10) unsigned NOT NULL COMMENT 'Reference to the agent',
  `current_longitude` double NOT NULL COMMENT 'Last received longitude',
  `current_latitude` double NOT NULL COMMENT 'Last received latitude',
  `current_altitude` double DEFAULT NULL COMMENT 'Last received altitude',
  `stored_longitude` double NOT NULL COMMENT 'Reference longitude to see if the agent has moved',
  `stored_latitude` double NOT NULL COMMENT 'Reference latitude to see if the agent has moved',
  `stored_altitude` double DEFAULT NULL COMMENT 'Reference altitude to see if the agent has moved',
  `number_of_packages` int(11) NOT NULL DEFAULT '1' COMMENT 'Number of data packages received with this position since start_timestampa',
  `start_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp on wich the agente started to be in this position',
  `manual_placement` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 to show that the position cames from the agent, 1 to show that the position was established manualy',
  `description` text COMMENT 'description of the region correoponding to this placemnt',
  PRIMARY KEY (`tagente_id_agente`),
  KEY `start_timestamp_index` (`start_timestamp`) USING BTREE,
  KEY `fk_tgisdata_tagente1` (`tagente_id_agente`),
  CONSTRAINT `fk_tgisdata_tagente1` FOREIGN KEY (`tagente_id_agente`) REFERENCES `tagente` (`id_agente`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table to store last GIS information of the agents';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tgis_data_status`
--

LOCK TABLES `tgis_data_status` WRITE;
/*!40000 ALTER TABLE `tgis_data_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `tgis_data_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tgis_map`
--

DROP TABLE IF EXISTS `tgis_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tgis_map` (
  `id_tgis_map` int(11) NOT NULL AUTO_INCREMENT COMMENT 'table identifier',
  `map_name` varchar(63) NOT NULL COMMENT 'Name of the map',
  `initial_longitude` double DEFAULT NULL COMMENT 'longitude of the center of the map when it''s loaded',
  `initial_latitude` double DEFAULT NULL COMMENT 'latitude of the center of the map when it''s loaded',
  `initial_altitude` double DEFAULT NULL COMMENT 'altitude of the center of the map when it''s loaded',
  `zoom_level` tinyint(2) DEFAULT '1' COMMENT 'Zoom level to show when the map is loaded.',
  `map_background` varchar(127) DEFAULT NULL COMMENT 'path on the server to the background image of the map',
  `default_longitude` double DEFAULT NULL COMMENT 'default longitude for the agents placed on the map',
  `default_latitude` double DEFAULT NULL COMMENT 'default latitude for the agents placed on the map',
  `default_altitude` double DEFAULT NULL COMMENT 'default altitude for the agents placed on the map',
  `group_id` int(10) NOT NULL DEFAULT '0' COMMENT 'Group that owns the map',
  `default_map` tinyint(1) DEFAULT '0' COMMENT '1 if this is the default map, 0 in other case',
  PRIMARY KEY (`id_tgis_map`),
  KEY `map_name_index` (`map_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Table containing information about a gis map';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tgis_map`
--

LOCK TABLES `tgis_map` WRITE;
/*!40000 ALTER TABLE `tgis_map` DISABLE KEYS */;
INSERT INTO `tgis_map` VALUES (1,'Sample',-3.708187,40.42056,0,16,'',-3.708187,40.42056,0,0,1);
/*!40000 ALTER TABLE `tgis_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tgis_map_connection`
--

DROP TABLE IF EXISTS `tgis_map_connection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tgis_map_connection` (
  `id_tmap_connection` int(11) NOT NULL AUTO_INCREMENT COMMENT 'table id',
  `conection_name` varchar(45) DEFAULT NULL COMMENT 'Name of the connection (name of the base layer)',
  `connection_type` varchar(45) DEFAULT NULL COMMENT 'Type of map server to connect',
  `conection_data` text COMMENT 'connection information (this can probably change to fit better the possible connection parameters)',
  `num_zoom_levels` tinyint(2) DEFAULT NULL COMMENT 'Number of zoom levels available',
  `default_zoom_level` tinyint(2) NOT NULL DEFAULT '16' COMMENT 'Default Zoom Level for the connection',
  `default_longitude` double DEFAULT NULL COMMENT 'default longitude for the agents placed on the map',
  `default_latitude` double DEFAULT NULL COMMENT 'default latitude for the agents placed on the map',
  `default_altitude` double DEFAULT NULL COMMENT 'default altitude for the agents placed on the map',
  `initial_longitude` double DEFAULT NULL COMMENT 'longitude of the center of the map when it''s loaded',
  `initial_latitude` double DEFAULT NULL COMMENT 'latitude of the center of the map when it''s loaded',
  `initial_altitude` double DEFAULT NULL COMMENT 'altitude of the center of the map when it''s loaded',
  `group_id` int(10) NOT NULL DEFAULT '0' COMMENT 'Group that owns the map',
  PRIMARY KEY (`id_tmap_connection`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Table to store the map connection information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tgis_map_connection`
--

LOCK TABLES `tgis_map_connection` WRITE;
/*!40000 ALTER TABLE `tgis_map_connection` DISABLE KEYS */;
INSERT INTO `tgis_map_connection` VALUES (1,'OpenStreetMap (MapQuest Open)','OSM','{\"type\":\"OSM\",\"url\":\"http://tile.openstreetmap.org/${z}/${x}/${y}.png\"}',19,16,-3.708187,40.42056,0,-3.708187,40.42056,0,0),(2,'OpenStreetMap (Standard)','OSM','{\"type\":\"OSM\",\"url\":\"http://tile.openstreetmap.org/${z}/${x}/${y}.png\"}',19,16,-3.708187,40.42056,0,-3.708187,40.42056,0,0);
/*!40000 ALTER TABLE `tgis_map_connection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tgis_map_has_tgis_map_con`
--

DROP TABLE IF EXISTS `tgis_map_has_tgis_map_con`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tgis_map_has_tgis_map_con` (
  `tgis_map_id_tgis_map` int(11) NOT NULL COMMENT 'reference to tgis_map',
  `tgis_map_con_id_tmap_con` int(11) NOT NULL COMMENT 'reference to tgis_map_connection',
  `modification_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Modification Time of the Connection',
  `default_map_connection` tinyint(1) DEFAULT '0' COMMENT 'Flag to mark the default map connection of a map',
  PRIMARY KEY (`tgis_map_id_tgis_map`,`tgis_map_con_id_tmap_con`),
  KEY `fk_tgis_map_has_tgis_map_connection_tgis_map1` (`tgis_map_id_tgis_map`),
  KEY `fk_tgis_map_has_tgis_map_connection_tgis_map_connection1` (`tgis_map_con_id_tmap_con`),
  CONSTRAINT `fk_tgis_map_has_tgis_map_connection_tgis_map1` FOREIGN KEY (`tgis_map_id_tgis_map`) REFERENCES `tgis_map` (`id_tgis_map`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_tgis_map_has_tgis_map_connection_tgis_map_connection1` FOREIGN KEY (`tgis_map_con_id_tmap_con`) REFERENCES `tgis_map_connection` (`id_tmap_connection`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table to asociate a connection to a gis map';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tgis_map_has_tgis_map_con`
--

LOCK TABLES `tgis_map_has_tgis_map_con` WRITE;
/*!40000 ALTER TABLE `tgis_map_has_tgis_map_con` DISABLE KEYS */;
INSERT INTO `tgis_map_has_tgis_map_con` VALUES (1,1,'2010-03-01 09:46:48',1);
/*!40000 ALTER TABLE `tgis_map_has_tgis_map_con` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tgis_map_layer`
--

DROP TABLE IF EXISTS `tgis_map_layer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tgis_map_layer` (
  `id_tmap_layer` int(11) NOT NULL AUTO_INCREMENT COMMENT 'table id',
  `layer_name` varchar(45) NOT NULL COMMENT 'Name of the layer ',
  `view_layer` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'True if the layer must be shown',
  `layer_stack_order` tinyint(3) DEFAULT '0' COMMENT 'Number of order of the layer in the layer stack, bigger means upper on the stack.\n',
  `tgis_map_id_tgis_map` int(11) NOT NULL COMMENT 'reference to the map containing the layer',
  `tgrupo_id_grupo` mediumint(4) NOT NULL COMMENT 'reference to the group shown in the layer',
  PRIMARY KEY (`id_tmap_layer`),
  KEY `fk_tmap_layer_tgis_map1` (`tgis_map_id_tgis_map`),
  CONSTRAINT `fk_tmap_layer_tgis_map1` FOREIGN KEY (`tgis_map_id_tgis_map`) REFERENCES `tgis_map` (`id_tgis_map`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Table containing information about the map layers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tgis_map_layer`
--

LOCK TABLES `tgis_map_layer` WRITE;
/*!40000 ALTER TABLE `tgis_map_layer` DISABLE KEYS */;
INSERT INTO `tgis_map_layer` VALUES (1,'Group All',1,0,1,0);
/*!40000 ALTER TABLE `tgis_map_layer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tgis_map_layer_groups`
--

DROP TABLE IF EXISTS `tgis_map_layer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tgis_map_layer_groups` (
  `layer_id` int(11) NOT NULL,
  `group_id` mediumint(4) unsigned NOT NULL,
  `agent_id` int(10) unsigned NOT NULL COMMENT 'Used to link the position to the group',
  PRIMARY KEY (`layer_id`,`group_id`),
  KEY `group_id` (`group_id`),
  KEY `agent_id` (`agent_id`),
  CONSTRAINT `tgis_map_layer_groups_ibfk_1` FOREIGN KEY (`layer_id`) REFERENCES `tgis_map_layer` (`id_tmap_layer`) ON DELETE CASCADE,
  CONSTRAINT `tgis_map_layer_groups_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `tgrupo` (`id_grupo`) ON DELETE CASCADE,
  CONSTRAINT `tgis_map_layer_groups_ibfk_3` FOREIGN KEY (`agent_id`) REFERENCES `tagente` (`id_agente`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tgis_map_layer_groups`
--

LOCK TABLES `tgis_map_layer_groups` WRITE;
/*!40000 ALTER TABLE `tgis_map_layer_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `tgis_map_layer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tgis_map_layer_has_tagente`
--

DROP TABLE IF EXISTS `tgis_map_layer_has_tagente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tgis_map_layer_has_tagente` (
  `tgis_map_layer_id_tmap_layer` int(11) NOT NULL,
  `tagente_id_agente` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tgis_map_layer_id_tmap_layer`,`tagente_id_agente`),
  KEY `fk_tgis_map_layer_has_tagente_tgis_map_layer1` (`tgis_map_layer_id_tmap_layer`),
  KEY `fk_tgis_map_layer_has_tagente_tagente1` (`tagente_id_agente`),
  CONSTRAINT `fk_tgis_map_layer_has_tagente_tgis_map_layer1` FOREIGN KEY (`tgis_map_layer_id_tmap_layer`) REFERENCES `tgis_map_layer` (`id_tmap_layer`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_tgis_map_layer_has_tagente_tagente1` FOREIGN KEY (`tagente_id_agente`) REFERENCES `tagente` (`id_agente`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table to define wich agents are shown in a layer';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tgis_map_layer_has_tagente`
--

LOCK TABLES `tgis_map_layer_has_tagente` WRITE;
/*!40000 ALTER TABLE `tgis_map_layer_has_tagente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tgis_map_layer_has_tagente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tgraph`
--

DROP TABLE IF EXISTS `tgraph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tgraph` (
  `id_graph` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(150) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `period` int(11) NOT NULL DEFAULT '0',
  `width` smallint(5) unsigned NOT NULL DEFAULT '0',
  `height` smallint(5) unsigned NOT NULL DEFAULT '0',
  `private` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `events` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `stacked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `id_group` mediumint(8) unsigned DEFAULT '0',
  `id_graph_template` int(11) NOT NULL DEFAULT '0',
  `percentil` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `summatory_series` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `average_series` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `modules_series` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fullscale` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_graph`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tgraph`
--

LOCK TABLES `tgraph` WRITE;
/*!40000 ALTER TABLE `tgraph` DISABLE KEYS */;
/*!40000 ALTER TABLE `tgraph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tgraph_source`
--

DROP TABLE IF EXISTS `tgraph_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tgraph_source` (
  `id_gs` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_graph` int(11) NOT NULL DEFAULT '0',
  `id_server` int(11) NOT NULL DEFAULT '0',
  `id_agent_module` int(11) NOT NULL DEFAULT '0',
  `weight` float(8,3) NOT NULL DEFAULT '0.000',
  `label` varchar(150) DEFAULT '',
  `field_order` int(10) DEFAULT '0',
  PRIMARY KEY (`id_gs`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tgraph_source`
--

LOCK TABLES `tgraph_source` WRITE;
/*!40000 ALTER TABLE `tgraph_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `tgraph_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tgraph_source_template`
--

DROP TABLE IF EXISTS `tgraph_source_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tgraph_source_template` (
  `id_gs_template` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_template` int(11) NOT NULL DEFAULT '0',
  `agent` text,
  `module` text,
  `weight` float(5,3) NOT NULL DEFAULT '2.000',
  `exact_match` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_gs_template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tgraph_source_template`
--

LOCK TABLES `tgraph_source_template` WRITE;
/*!40000 ALTER TABLE `tgraph_source_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `tgraph_source_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tgraph_template`
--

DROP TABLE IF EXISTS `tgraph_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tgraph_template` (
  `id_graph_template` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` text NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `period` int(11) NOT NULL DEFAULT '0',
  `width` smallint(5) unsigned NOT NULL DEFAULT '0',
  `height` smallint(5) unsigned NOT NULL DEFAULT '0',
  `private` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `events` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `stacked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `id_group` mediumint(8) unsigned DEFAULT '0',
  PRIMARY KEY (`id_graph_template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tgraph_template`
--

LOCK TABLES `tgraph_template` WRITE;
/*!40000 ALTER TABLE `tgraph_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `tgraph_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tgroup_stat`
--

DROP TABLE IF EXISTS `tgroup_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tgroup_stat` (
  `id_group` int(10) unsigned NOT NULL DEFAULT '0',
  `modules` int(10) unsigned NOT NULL DEFAULT '0',
  `normal` int(10) unsigned NOT NULL DEFAULT '0',
  `critical` int(10) unsigned NOT NULL DEFAULT '0',
  `warning` int(10) unsigned NOT NULL DEFAULT '0',
  `unknown` int(10) unsigned NOT NULL DEFAULT '0',
  `non-init` int(10) unsigned NOT NULL DEFAULT '0',
  `alerts` int(10) unsigned NOT NULL DEFAULT '0',
  `alerts_fired` int(10) unsigned NOT NULL DEFAULT '0',
  `agents` int(10) unsigned NOT NULL DEFAULT '0',
  `agents_unknown` int(10) unsigned NOT NULL DEFAULT '0',
  `utimestamp` int(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table to store global system stats per group';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tgroup_stat`
--

LOCK TABLES `tgroup_stat` WRITE;
/*!40000 ALTER TABLE `tgroup_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `tgroup_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tgrupo`
--

DROP TABLE IF EXISTS `tgrupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tgrupo` (
  `id_grupo` mediumint(4) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `icon` varchar(50) DEFAULT 'world',
  `parent` mediumint(4) unsigned NOT NULL DEFAULT '0',
  `propagate` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `custom_id` varchar(255) DEFAULT '',
  `id_skin` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text,
  `contact` text,
  `other` text,
  `password` varchar(45) DEFAULT '',
  PRIMARY KEY (`id_grupo`),
  KEY `parent_index` (`parent`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tgrupo`
--

LOCK TABLES `tgrupo` WRITE;
/*!40000 ALTER TABLE `tgrupo` DISABLE KEYS */;
INSERT INTO `tgrupo` VALUES (2,'Servers','server_database',0,0,0,'',1,NULL,NULL,'',''),(4,'Firewalls','firewall',0,0,0,'',1,NULL,NULL,'',''),(8,'Databases','database_gear',0,0,0,'',1,NULL,NULL,'',''),(9,'Network','transmit',0,0,0,'',1,NULL,NULL,'',''),(10,'Unknown','world',0,0,0,'',1,NULL,NULL,'',''),(11,'Workstations','computer',0,0,0,'',1,NULL,NULL,'',''),(12,'Applications','applications',0,0,0,'',1,NULL,NULL,'',''),(13,'Web','world',0,0,0,'',1,NULL,NULL,'','');
/*!40000 ALTER TABLE `tgrupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tincidencia`
--

DROP TABLE IF EXISTS `tincidencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tincidencia` (
  `id_incidencia` bigint(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `inicio` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `cierre` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `titulo` text NOT NULL,
  `descripcion` text NOT NULL,
  `id_usuario` varchar(60) NOT NULL DEFAULT '',
  `origen` varchar(100) NOT NULL DEFAULT '',
  `estado` int(10) NOT NULL DEFAULT '0',
  `prioridad` int(10) NOT NULL DEFAULT '0',
  `id_grupo` mediumint(4) unsigned NOT NULL DEFAULT '0',
  `actualizacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_creator` varchar(60) DEFAULT NULL,
  `id_lastupdate` varchar(60) DEFAULT NULL,
  `id_agente_modulo` bigint(100) NOT NULL,
  `notify_email` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `id_agent` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id_incidencia`),
  KEY `incident_index_1` (`id_usuario`,`id_incidencia`),
  KEY `id_agente_modulo` (`id_agente_modulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tincidencia`
--

LOCK TABLES `tincidencia` WRITE;
/*!40000 ALTER TABLE `tincidencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tincidencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titem`
--

DROP TABLE IF EXISTS `titem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titem` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_map` int(10) unsigned NOT NULL DEFAULT '0',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `z` int(11) NOT NULL DEFAULT '0',
  `deleted` int(1) unsigned NOT NULL DEFAULT '0',
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `refresh` int(10) unsigned NOT NULL DEFAULT '0',
  `source` int(10) unsigned NOT NULL DEFAULT '0',
  `source_data` varchar(250) DEFAULT '',
  `options` text,
  `style` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titem`
--

LOCK TABLES `titem` WRITE;
/*!40000 ALTER TABLE `titem` DISABLE KEYS */;
/*!40000 ALTER TABLE `titem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlanguage`
--

DROP TABLE IF EXISTS `tlanguage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlanguage` (
  `id_language` varchar(6) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlanguage`
--

LOCK TABLES `tlanguage` WRITE;
/*!40000 ALTER TABLE `tlanguage` DISABLE KEYS */;
INSERT INTO `tlanguage` VALUES ('ar','Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©'),('ca','Catalan'),('cs','ÄŒesky'),('de','Deutch'),('el','Î•Î»Î»Î·Î½Î¹ÎºÎ¬'),('en_GB','English (UK)'),('es','EspaÃ±ol'),('fr','FranÃ§ais'),('it','Italiano'),('ja','æ—¥æœ¬èªž'),('nl','Nederlands'),('pl','Polski'),('pt','PortuguÃªs'),('pt_BR','PortuguÃªs-Brasil'),('ru','Ð ÑƒÑÑÐºÐ¸Ð¹'),('sk','SlovenÄina'),('tr','TÃ¼rkÃ§e'),('zh_CN','ç®€åŒ–å­—');
/*!40000 ALTER TABLE `tlanguage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlayout`
--

DROP TABLE IF EXISTS `tlayout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlayout` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(600) NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  `background` varchar(200) NOT NULL,
  `height` int(10) unsigned NOT NULL DEFAULT '0',
  `width` int(10) unsigned NOT NULL DEFAULT '0',
  `background_color` varchar(50) NOT NULL DEFAULT '#FFF',
  `is_favourite` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlayout`
--

LOCK TABLES `tlayout` WRITE;
/*!40000 ALTER TABLE `tlayout` DISABLE KEYS */;
INSERT INTO `tlayout` VALUES (1,'Demo&#x20;visual console',0,'fondo.jpg',1080,1920,'white',0),(2,'Demo&#x20;visual console 2',0,'fondo-keep-alive.jpg',1080,1920,'#FFF',0),(3,'Worldmap',0,'map_world.jpg',1080,1920,'white',0),(4,'Europe',0,'map_europe_1.jpg',1080,1920,'white',0),(5,'USA',0,'map_USA.jpg',1080,1920,'white',0),(6,'Spain',0,'map_spain.jpg',1080,1920,'white',0),(7,'Madrid',0,'map_madrid.jpg',1080,1920,'white',0),(8,'Germany',0,'map_germany_1.jpg',1080,1920,'white',0),(9,'France',0,'map_france.jpg',1080,1920,'white',0),(10,'Catalonia',0,'map_catalonia.jpg',1080,1920,'white',0),(11,'Basque&#x20;Country',0,'map_basque-country.jpg',1080,1920,'white',0),(12,'Andalusia',0,'map_andalusia.jpg',1080,1920,'white',0);
/*!40000 ALTER TABLE `tlayout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlayout_data`
--

DROP TABLE IF EXISTS `tlayout_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlayout_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_layout` int(10) unsigned NOT NULL DEFAULT '0',
  `pos_x` int(10) unsigned NOT NULL DEFAULT '0',
  `pos_y` int(10) unsigned NOT NULL DEFAULT '0',
  `height` int(10) unsigned NOT NULL DEFAULT '0',
  `width` int(10) unsigned NOT NULL DEFAULT '0',
  `label` text,
  `image` varchar(200) DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `period` int(10) unsigned NOT NULL DEFAULT '3600',
  `id_agente_modulo` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_agent` int(10) unsigned NOT NULL DEFAULT '0',
  `id_layout_linked` int(10) unsigned NOT NULL DEFAULT '0',
  `parent_item` int(10) unsigned NOT NULL DEFAULT '0',
  `enable_link` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `id_metaconsole` int(10) NOT NULL DEFAULT '0',
  `id_group` int(10) unsigned NOT NULL DEFAULT '0',
  `id_custom_graph` int(10) unsigned NOT NULL DEFAULT '0',
  `border_width` int(10) unsigned NOT NULL DEFAULT '0',
  `type_graph` varchar(50) NOT NULL DEFAULT 'area',
  `label_position` varchar(50) NOT NULL DEFAULT 'down',
  `border_color` varchar(200) DEFAULT '',
  `fill_color` varchar(200) DEFAULT '',
  `show_statistics` tinyint(2) NOT NULL DEFAULT '0',
  `linked_layout_node_id` int(10) NOT NULL DEFAULT '0',
  `linked_layout_status_type` enum('default','weight','service') DEFAULT 'default',
  `id_layout_linked_weight` int(10) NOT NULL DEFAULT '0',
  `linked_layout_status_as_service_warning` float(20,3) NOT NULL DEFAULT '0.000',
  `linked_layout_status_as_service_critical` float(20,3) NOT NULL DEFAULT '0.000',
  `element_group` int(10) NOT NULL DEFAULT '0',
  `show_on_top` tinyint(1) NOT NULL DEFAULT '0',
  `clock_animation` varchar(60) NOT NULL DEFAULT 'analogic_1',
  `time_format` varchar(60) NOT NULL DEFAULT 'time',
  `timezone` varchar(60) NOT NULL DEFAULT 'Europe/Madrid',
  `show_last_value` tinyint(1) unsigned DEFAULT '0',
  `cache_expiration` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlayout_data`
--

LOCK TABLES `tlayout_data` WRITE;
/*!40000 ALTER TABLE `tlayout_data` DISABLE KEYS */;
INSERT INTO `tlayout_data` VALUES (1,1,998,699,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(2,1,998,783,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(3,1,1016,783,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(4,1,1016,699,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(5,1,1034,783,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(6,1,1034,699,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(7,1,1052,783,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(8,1,1052,699,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(9,1,1070,783,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(10,1,1070,699,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(11,1,1088,783,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(12,1,1088,699,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(13,1,1106,699,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(14,1,1106,783,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(15,1,1124,699,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(16,1,1124,783,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(17,1,1142,699,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(18,1,1142,783,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(19,1,1160,699,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(20,1,1160,783,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(21,1,1178,699,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(22,1,1178,783,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(23,1,1196,699,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(24,1,1196,783,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(25,1,1214,699,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(26,1,1214,783,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(27,1,1232,699,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(28,1,1232,783,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(29,1,1250,699,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(30,1,1250,783,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(31,1,1268,699,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(32,1,1268,783,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(33,1,1286,699,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(34,1,1286,783,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(35,1,1286,699,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(36,1,1304,783,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(37,1,1304,699,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(38,1,1322,783,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(39,1,1322,699,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(40,1,1340,783,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(41,1,1507,260,174,29,'','rack_server_rack',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(42,1,1536,260,174,29,'','rack_server_rack',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(43,1,1568,260,174,29,'','rack_server_rack',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(44,1,1599,260,174,29,'','rack_server_rack',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(45,1,1627,260,174,29,'','rack_server_rack',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(46,1,1656,260,174,29,'','rack_server_rack',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(47,1,1685,260,174,29,'','rack_server_rack',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(48,1,1714,260,174,29,'','rack_server_rack',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(49,1,1743,260,174,29,'','rack_server_rack',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(50,1,1772,260,174,29,'','rack_server_rack',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(51,1,1449,260,174,29,'','rack_server_rack',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(52,1,1800,260,174,29,'','rack_server_rack',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(53,1,1413,243,205,426,'','rack_frame',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(54,1,962,381,73,408,'','rack_firewall',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(55,1,962,454,73,408,'','rack_pdu',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(56,1,530,732,74,413,'','rack_server',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(57,1,962,233,74,413,'','rack_server',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(58,1,962,307,74,413,'','rack_server',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(59,1,530,658,74,413,'','rack_server',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(60,1,530,350,74,413,'','rack_server',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(61,1,530,204,73,408,'','rack_psa',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(62,1,530,277,73,408,'','rack_pdu',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(63,1,530,585,73,408,'','rack_firewall',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(64,1,530,424,161,411,'','rack_double_server',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(65,1,1426,448,74,413,'','rack_server',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(66,1,1495,540,174,29,'','rack_server_rack',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(67,1,1423,260,174,29,'','rack_server_rack',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(68,1,1463,540,174,29,'','rack_server_rack',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(69,1,1433,540,174,29,'','rack_server_rack',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(70,1,74,733,73,408,'','rack_pdu',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(71,1,1098,701,80,18,'','rack_hard_disk',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(72,1,1148,701,80,18,'','rack_hard_disk',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(73,1,1340,699,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(74,1,1358,783,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(75,1,1358,699,80,18,'','rack_hard_disk_2',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(76,1,1143,783,80,18,'','rack_hard_disk',0,3600,9,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(77,1,962,682,205,426,'','rack_frame',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(78,1,1522,540,174,29,'','rack_server_rack',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(79,1,1419,521,205,426,'','rack_frame',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(80,1,74,278,74,413,'','rack_server',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(81,1,74,572,161,411,'','rack_double_server',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(82,1,1418,729,74,413,'','rack_server',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(83,1,962,527,73,408,'','rack_switch',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(84,1,74,352,73,408,'','rack_router',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(85,1,962,600,74,413,'','rack_server',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(86,1,530,806,73,408,'','rack_firewall',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(87,1,74,425,74,413,'','rack_server',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(88,1,74,499,73,408,'','rack_switch',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(89,1,74,806,73,408,'','rack_psa',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(90,1,74,204,74,413,'','rack_server',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(91,1,1424,806,73,408,'','rack_firewall',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(92,1,1486,907,0,0,'&lt;p&#x20;style=&quot;text-align:&#x20;center;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;class=&quot;visual_font_size_28pt&quot;&#x20;style=&quot;color:&#x20;#ffffff;&#x20;font-family:&#x20;opensans;&quot;&gt;&lt;strong&gt;&lt;span&#x20;class=&quot;visual_font_size_28pt&quot;&#x20;style=&quot;color:&#x20;#ffffff;&#x20;font-family:&#x20;opensans;&quot;&gt;Office&#x20;8&#x20;-&amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;span&#x20;class=&quot;visual_font_size_28pt&quot;&#x20;style=&quot;color:&#x20;#ffffff;&#x20;font-family:&#x20;opensans;&quot;&gt;Rack&#x20;2&lt;/span&gt;&lt;/p&gt;','white',4,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(93,1,1048,889,58,281,'&lt;p&#x20;style=&quot;text-align:&#x20;center;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;class=&quot;visual_font_size_28pt&quot;&#x20;style=&quot;color:&#x20;#ffffff;&#x20;font-family:&#x20;opensans;&quot;&gt;&lt;strong&gt;&lt;span&#x20;class=&quot;visual_font_size_28pt&quot;&#x20;style=&quot;color:&#x20;#ffffff;&#x20;font-family:&#x20;opensans;&quot;&gt;Office&#x20;8&#x20;-&amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;span&#x20;class=&quot;visual_font_size_28pt&quot;&#x20;style=&quot;color:&#x20;#ffffff;&#x20;font-family:&#x20;opensans;&quot;&gt;Rack&#x20;1&lt;/span&gt;&lt;/p&gt;','white',4,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(94,1,580,904,0,0,'&lt;p&#x20;style=&quot;text-align:&#x20;center;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;class=&quot;visual_font_size_28pt&quot;&#x20;style=&quot;color:&#x20;#ffffff;&#x20;font-family:&#x20;opensans;&quot;&gt;&lt;strong&gt;&lt;span&#x20;class=&quot;visual_font_size_28pt&quot;&#x20;style=&quot;color:&#x20;#ffffff;&#x20;font-family:&#x20;opensans;&quot;&gt;Office&#x20;7&#x20;-&amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;span&#x20;class=&quot;visual_font_size_28pt&quot;&#x20;style=&quot;color:&#x20;#ffffff;&#x20;font-family:&#x20;opensans;&quot;&gt;Rack&#x20;2&lt;/span&gt;&lt;/p&gt;','white',4,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(95,1,132,907,0,0,'&lt;p&#x20;style=&quot;text-align:&#x20;center;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;class=&quot;visual_font_size_28pt&quot;&#x20;style=&quot;color:&#x20;#ffffff;&#x20;font-family:&#x20;opensans;&quot;&gt;&lt;strong&gt;&lt;span&#x20;class=&quot;visual_font_size_28pt&quot;&#x20;style=&quot;color:&#x20;#ffffff;&#x20;font-family:&#x20;opensans;&quot;&gt;Office&#x20;7&#x20;-&amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;span&#x20;class=&quot;visual_font_size_28pt&quot;&#x20;style=&quot;color:&#x20;#ffffff;&#x20;font-family:&#x20;opensans;&quot;&gt;Rack&#x20;1&lt;/span&gt;&lt;/p&gt;','white',4,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(96,1,733,20,0,0,'&lt;p&#x20;style=&quot;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;class=&quot;visual_font_size_48pt&quot;&gt;&lt;strong&gt;&lt;span&#x20;style=&quot;color:&#x20;#ffffff;&#x20;font-family:&#x20;opensans;&quot;&gt;OFFICE&#x20;RACKS&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;','white',4,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(97,1,1479,260,174,29,'','rack_server_rack',0,3600,1,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,60),(98,2,709,103,0,400,'','white',19,3600,0,0,0,0,1,0,0,0,0,'line','down','','#FFFFFF',0,0,'default',0,0.000,0.000,0,0,'digital_1','timedate','Europe/Madrid',0,0),(99,2,178,481,111,111,'','status',0,3600,11556,430,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(100,2,542,481,111,111,'','status',0,3600,13,2,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(101,2,905,481,111,111,'','status',0,3600,114,11,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(102,2,1276,481,111,111,'','status',0,3600,7,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(103,2,1631,482,111,111,'','status',0,3600,11547,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(104,2,157,393,0,0,'<p style=\"line-height: 18px;\"><span class=\"visual_font_size_28pt\" style=\"line-height: 18px; color: #ffffff;\">Backups</span></p>\n<p style=\"line-height: 18px;\">Â </p>','white',4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(105,2,512,382,96,172,'&lt;p&#x20;style=&quot;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;class=&quot;visual_font_size_28pt&quot;&#x20;style=&quot;font-family:&#x20;opensans;&#x20;color:&#x20;#ffffff;&quot;&gt;DB&#x20;Status&lt;/span&gt;&lt;/p&gt;&#x0a;&lt;p&#x20;style=&quot;overflow:&#x20;hidden;&quot;&gt;&amp;nbsp;&lt;/p&gt;','white',4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(106,2,886,382,0,0,'<p style=\"line-height: 18px; overflow: hidden;\"><span class=\"visual_font_size_28pt\" style=\"color: #ffffff; font-family: opensans;\">Disk slave</span></p>\n<p style=\"line-height: 18px; overflow: hidden;\">Â </p>','white',4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(107,2,1251,382,0,0,'<p style=\"line-height: 18px; overflow: hidden;\"><span class=\"visual_font_size_28pt\" style=\"color: #ffffff; font-family: opensans;\">Disk /var</span></p>\n<p style=\"line-height: 18px; overflow: hidden;\">Â </p>','white',4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(108,2,1547,382,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;class=&quot;visual_font_size_28pt&quot;&#x20;style=&quot;color:&#x20;#ffffff;&#x20;font-family:&#x20;opensans;&quot;&gt;Authentification&lt;/span&gt;&lt;/p&gt;','white',4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(109,2,126,820,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;strong&gt;&lt;span&#x20;class=&quot;visual_font_size_36pt&quot;&#x20;style=&quot;font-family:&#x20;opensans;&#x20;color:&#x20;#ffffff;&quot;&gt;Processing&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;','white',4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(110,2,755,820,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;strong&gt;&lt;span&#x20;class=&quot;visual_font_size_36pt&quot;&#x20;style=&quot;font-family:&#x20;opensans;&#x20;color:&#x20;#ffffff;&quot;&gt;Network&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;','white',4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(111,2,1281,820,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;strong&gt;&lt;span&#x20;class=&quot;visual_font_size_36pt&quot;&#x20;style=&quot;color:&#x20;#ffffff;&#x20;font-family:&#x20;opensans;&quot;&gt;Storage&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;','white',4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(113,3,851,932,0,0,'','white',19,3600,0,0,0,0,1,0,0,0,0,'line','down','','#FFFFFF',0,0,'default',0,0.000,0.000,0,0,'digital_1','time','Europe/Madrid',0,0),(114,3,946,314,60,60,'','status',0,3600,0,0,4,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(115,3,604,351,60,60,'','status',0,3600,0,0,5,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(116,3,840,314,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&gt;&lt;strong&gt;&lt;span&#x20;style=&quot;color:&#x20;#ffffff;&quot;&gt;EUROPE&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;',NULL,4,3600,0,0,4,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(117,3,664,374,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&gt;&lt;strong&gt;&lt;span&#x20;style=&quot;color:&#x20;#ffffff;&quot;&gt;USA&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;',NULL,4,3600,0,0,5,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(118,3,57,182,60,60,'','status',0,3600,0,0,5,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(119,3,56,258,60,60,'','status',0,3600,0,0,4,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(121,3,138,183,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&gt;&lt;strong&gt;&lt;span&#x20;style=&quot;color:&#x20;#ffffff;&quot;&gt;USA&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;',NULL,4,3600,0,0,5,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(122,3,138,259,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&gt;&lt;strong&gt;&lt;span&#x20;style=&quot;color:&#x20;#ffffff;&quot;&gt;EUROPE&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;',NULL,4,3600,0,0,4,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(123,4,839,525,60,60,'','status',0,3600,0,0,8,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(124,4,699,583,60,60,'','status',0,3600,0,0,9,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(125,4,585,705,60,60,'','status',0,3600,0,0,6,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(126,4,563,754,0,0,'&lt;p&#x20;style=&quot;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;style=&quot;color:&#x20;#000000;&quot;&gt;&lt;strong&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&gt;SPAIN&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;',NULL,4,3600,0,0,6,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(127,4,681,629,0,0,'&lt;p&#x20;style=&quot;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;style=&quot;color:&#x20;#000000;&quot;&gt;&lt;strong&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&gt;FRANCE&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;',NULL,4,3600,0,0,9,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(128,4,832,576,0,0,'&lt;p&#x20;style=&quot;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&#x20;style=&quot;color:&#x20;#000000;&quot;&gt;&lt;strong&gt;&lt;span&#x20;style=&quot;color:&#x20;#000000;&quot;&gt;GERMANY&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;',NULL,4,3600,0,0,8,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(129,4,51,177,60,60,'','status',0,3600,0,0,8,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(130,4,124,176,0,0,'&lt;p&#x20;style=&quot;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&#x20;style=&quot;color:&#x20;#ffffff;&quot;&gt;&lt;strong&gt;GERMANY&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;',NULL,4,3600,0,0,8,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(131,4,51,255,60,60,'','status',0,3600,0,0,9,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(132,4,127,256,0,0,'&lt;p&#x20;style=&quot;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;style=&quot;color:&#x20;#ffffff;&quot;&gt;&lt;strong&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&gt;FRANCE&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;',NULL,4,3600,0,0,9,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(133,4,51,333,60,60,'','status',0,3600,0,0,7,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(134,4,129,333,0,0,'&lt;p&#x20;style=&quot;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;style=&quot;color:&#x20;#ffffff;&quot;&gt;&lt;strong&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&gt;SPAIN&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;',NULL,4,3600,0,0,6,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(136,4,816,928,0,0,'','white',19,3600,0,0,0,0,1,0,0,0,0,'line','down','','#FFFFFF',0,0,'default',0,0.000,0.000,0,0,'digital_1','time','Europe/Madrid',0,0),(137,4,1674,184,132,200,'','worldmap',5,3600,0,0,3,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(143,6,972,452,60,60,'','status',0,3600,0,0,7,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(144,6,1039,223,60,60,'','status',0,3600,0,0,11,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(145,6,1339,366,60,60,'','status',0,3600,0,0,10,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(146,6,841,699,60,60,'','status',0,3600,0,0,12,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(147,6,1677,183,132,200,'','worldmap',5,3600,0,0,3,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(148,6,1674,341,132,200,'','europemap',5,3600,0,0,4,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(149,6,1023,288,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;strong&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&#x20;style=&quot;color:&#x20;#000000;&quot;&gt;BASQUE&#x20;COUNTRY&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;',NULL,4,3600,0,0,11,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(150,6,1324,425,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;style=&quot;color:&#x20;#ffffff;&quot;&gt;&lt;strong&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&gt;CATALONIA&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;',NULL,4,3600,0,0,10,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(151,6,963,511,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;strong&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&#x20;style=&quot;color:&#x20;#000000;&quot;&gt;MADRID&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;',NULL,4,3600,0,0,7,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(152,6,843,749,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;strong&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&#x20;style=&quot;color:&#x20;#000000;&quot;&gt;ANDALUSIA&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;',NULL,4,3600,0,0,12,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(153,6,52,179,60,60,'','status',0,3600,0,0,11,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(154,6,125,184,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;class=&quot;visual_font_size_14pt&quot;&#x20;style=&quot;color:&#x20;#ffffff;&quot;&gt;&lt;strong&gt;BASQUE&#x20;COUNTRY&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;',NULL,4,3600,0,0,11,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(155,6,53,260,60,60,'','status',0,3600,0,0,7,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(156,6,132,264,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;class=&quot;visual_font_size_14pt&quot;&#x20;style=&quot;color:&#x20;#ffffff;&quot;&gt;&lt;strong&gt;MADRID&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;',NULL,4,3600,0,0,7,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(157,6,52,339,60,60,'','status',0,3600,0,0,10,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(158,6,132,343,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;class=&quot;visual_font_size_14pt&quot;&#x20;style=&quot;color:&#x20;#ffffff;&quot;&gt;&lt;strong&gt;CATALONIA&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;',NULL,4,3600,0,0,10,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(159,6,52,413,60,60,'','status',0,3600,0,0,12,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(160,6,132,423,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;class=&quot;visual_font_size_14pt&quot;&#x20;style=&quot;color:&#x20;#ffffff;&quot;&gt;&lt;strong&gt;ANDALUSIA&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;',NULL,4,3600,0,0,12,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(161,11,761,345,60,60,'','status',0,3600,0,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(162,11,791,401,0,0,'&lt;p&#x20;style=&quot;margin-top:&quot;&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&gt;&lt;strong&gt;BILBAO&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;','white',4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(163,11,53,183,60,60,'','status',0,3600,0,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(164,11,131,191,0,0,'&lt;p&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&#x20;style=&quot;color:&#x20;#ffffff;&quot;&gt;&lt;strong&gt;BILBAO&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;','white',4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(165,11,1675,184,132,200,'','worldmap',5,3600,0,0,3,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(167,11,1675,340,132,200,'','europemap',5,3600,0,0,4,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(168,11,1673,507,132,200,'','spainmap',5,3600,0,0,6,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(169,10,1075,607,60,60,'','status',0,3600,0,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(170,10,1012,539,60,60,'','status',0,3600,0,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(171,10,57,266,60,60,'','status',0,3600,0,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(172,10,55,183,60,60,'','status',0,3600,0,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(173,10,131,189,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;style=&quot;color:&#x20;#ffffff;&quot;&gt;&lt;strong&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&gt;BARCELONA&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;',NULL,4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(174,10,1044,670,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;style=&quot;color:&#x20;#ffffff;&quot;&gt;&lt;strong&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&gt;BARCELONA&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;',NULL,4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(175,10,1000,488,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&gt;&lt;strong&gt;&lt;span&#x20;style=&quot;color:&#x20;#ffffff;&quot;&gt;MANRESA&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;',NULL,4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(176,10,134,265,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;style=&quot;color:&#x20;#ffffff;&quot;&gt;&lt;strong&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&gt;MANRESA&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;',NULL,4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(177,10,1675,184,132,200,'','worldmap',5,3600,0,0,3,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(178,10,1675,342,132,200,'','europemap',5,3600,0,0,4,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(179,10,1673,508,132,200,'','spainmap',5,3600,0,0,6,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(180,7,1675,184,132,200,'','worldmap',5,3600,0,0,3,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(181,7,1673,340,132,200,'','europemap',5,3600,0,0,4,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(182,7,1675,505,132,200,'','spainmap',5,3600,0,0,6,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(183,7,960,571,60,60,'','status',0,3600,0,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(184,7,1089,529,60,60,'','status',0,3600,0,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(185,7,865,541,60,60,'','status',0,3600,0,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(186,7,958,475,60,60,'','status',0,3600,0,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(187,7,54,182,60,60,'','status',0,3600,0,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(188,7,58,417,60,60,'','status',0,3600,0,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(189,7,55,258,60,60,'','status',0,3600,0,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(191,7,56,338,60,60,'','status',0,3600,0,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(192,7,947,631,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;strong&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&gt;MADRID&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;',NULL,4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(193,7,790,598,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;strong&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&gt;LAS&#x20;ROZAS&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;',NULL,4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(194,7,914,429,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;strong&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&gt;ALCOBENDAS&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;',NULL,4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(195,7,1065,583,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&#x20;text-align:&#x20;center;&quot;&gt;&lt;strong&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&gt;ALCAL&amp;Aacute;&#x20;DE&#x20;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&#x0a;&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&#x20;text-align:&#x20;center;&quot;&gt;&lt;strong&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&gt;HENARES&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;',NULL,4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(196,7,134,267,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;class=&quot;visual_font_size_14pt&quot;&#x20;style=&quot;color:&#x20;#ffffff;&quot;&gt;&lt;strong&gt;ALCOBENDAS&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;',NULL,4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(197,7,133,193,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;class=&quot;visual_font_size_14pt&quot;&#x20;style=&quot;color:&#x20;#ffffff;&quot;&gt;&lt;strong&gt;MADRID&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;',NULL,4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(198,7,134,347,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;class=&quot;visual_font_size_14pt&quot;&#x20;style=&quot;color:&#x20;#ffffff;&quot;&gt;&lt;strong&gt;LAS&#x20;ROZAS&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;',NULL,4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(199,7,135,425,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;class=&quot;visual_font_size_14pt&quot;&#x20;style=&quot;color:&#x20;#ffffff;&quot;&gt;&lt;strong&gt;ALCAL&amp;Aacute;&#x20;DE&#x20;HENARES&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;',NULL,4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(200,12,757,537,60,60,'','status',0,3600,0,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(201,12,1022,656,60,60,'','status',0,3600,0,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(202,12,54,182,60,60,'','status',0,3600,0,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(203,12,54,260,60,60,'','status',0,3600,0,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(204,12,751,593,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&gt;&lt;strong&gt;SEVILLA&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;',NULL,4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(205,12,1047,716,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&#x20;style=&quot;color:&#x20;#ffffff;&quot;&gt;&lt;strong&gt;MALAGA&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;',NULL,4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(206,12,133,266,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&#x20;style=&quot;color:&#x20;#ffffff;&quot;&gt;&lt;strong&gt;MALAGA&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;',NULL,4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(207,12,132,190,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&#x20;style=&quot;color:&#x20;#ffffff;&quot;&gt;&lt;strong&gt;SEVILLA&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;',NULL,4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(208,12,1675,184,132,200,'','worldmap',5,3600,0,0,3,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(209,12,1675,341,132,200,'','europemap',5,3600,0,0,4,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(210,12,1674,505,132,200,'','spainmap',5,3600,0,0,6,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(211,12,842,935,0,0,'',NULL,19,3600,0,0,0,0,1,0,0,0,0,'line','down','','#FFFFFF',0,0,'default',0,0.000,0.000,0,0,'digital_1','time','Europe/Madrid',0,0),(212,7,848,941,0,0,'','white',19,3600,0,0,0,0,1,0,0,0,0,'line','down','','#FFFFFF',0,0,'default',0,0.000,0.000,0,0,'digital_1','time','Europe/Madrid',0,0),(213,10,844,940,0,0,'','white',19,3600,0,0,0,0,1,0,0,0,0,'line','down','','#FFFFFF',0,0,'default',0,0.000,0.000,0,0,'digital_1','time','Europe/Madrid',0,0),(214,11,847,948,0,0,'','white',19,3600,0,0,0,0,1,0,0,0,0,'line','down','','#FFFFFF',0,0,'default',0,0.000,0.000,0,0,'digital_1','time','Europe/Madrid',0,0),(215,5,525,608,60,60,'','status',0,3600,0,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(216,5,1412,351,60,60,'','status',0,3600,0,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(217,5,966,697,60,60,'','status',0,3600,0,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(218,5,458,672,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;strong&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&#x20;style=&quot;color:&#x20;#ffffff;&quot;&gt;CALIFORNIA&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;','white',4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(219,5,954,759,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;style=&quot;color:&#x20;#000000;&quot;&gt;&lt;strong&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&gt;TEXAS&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;','white',4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(220,5,1468,389,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;style=&quot;color:&#x20;#ffffff;&quot;&gt;&lt;strong&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&gt;NEW&#x20;YORK&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;','white',4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(221,5,56,182,60,60,'','status',0,3600,0,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(222,5,57,258,60,60,'','status',0,3600,0,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(223,5,57,338,60,60,'','status',0,3600,0,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(224,5,137,189,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;strong&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&#x20;style=&quot;color:&#x20;#ffffff;&quot;&gt;CALIFORNIA&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;','white',4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(225,5,139,264,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;strong&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&#x20;style=&quot;color:&#x20;#ffffff;&quot;&gt;TEXAS&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;','white',4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(226,5,138,342,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;strong&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&#x20;style=&quot;color:&#x20;#ffffff;&quot;&gt;NUEVA&#x20;YORK&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;','white',4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(227,5,1677,189,132,200,'','worldmap',5,3600,0,0,3,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(228,9,907,353,60,60,'','status',0,3600,0,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(229,9,1068,599,60,60,'','status',0,3600,0,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(230,9,60,182,60,60,'','status',0,3600,0,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(231,9,61,258,60,60,'','status',0,3600,0,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(232,9,138,187,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&#x20;style=&quot;color:&#x20;#ffffff;&quot;&gt;&lt;strong&gt;PARIS&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;',NULL,4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(233,9,139,257,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&#x20;style=&quot;color:&#x20;#ffffff;&quot;&gt;&lt;strong&gt;LYON&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;',NULL,4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(234,9,1063,660,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&#x20;style=&quot;color:&#x20;#333333;&quot;&gt;&lt;strong&gt;LYON&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;',NULL,4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(235,9,905,416,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&#x20;style=&quot;color:&#x20;#333333;&quot;&gt;&lt;strong&gt;PARIS&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;',NULL,4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(236,9,1676,184,132,200,'','worldmap',5,3600,0,0,3,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(237,9,1673,340,132,200,'','europemap',5,3600,0,0,4,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(238,8,1098,397,60,60,'','status',0,3600,0,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(239,8,989,775,60,60,'','status',0,3600,0,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(240,8,824,595,60,60,'','status',0,3600,0,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(241,8,59,183,60,60,'','status',0,3600,0,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(242,8,62,335,60,60,'','status',0,3600,0,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(243,8,60,260,60,60,'','status',0,3600,0,1,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(244,8,1077,456,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;style=&quot;color:&#x20;#000000;&quot;&gt;&lt;strong&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&gt;BERLIN&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;',NULL,4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(245,8,143,262,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;strong&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&#x20;style=&quot;color:&#x20;#ffffff;&quot;&gt;FRANCFORT&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;',NULL,4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(246,8,144,341,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;strong&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&#x20;style=&quot;color:&#x20;#ffffff;&quot;&gt;MUNICH&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;',NULL,4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(247,8,957,827,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;style=&quot;color:&#x20;#000000;&quot;&gt;&lt;strong&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&gt;MUNICH&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;',NULL,4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(248,8,795,655,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;span&#x20;style=&quot;color:&#x20;#000000;&quot;&gt;&lt;strong&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&gt;FRANCFORT&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;',NULL,4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(249,8,143,183,0,0,'&lt;p&#x20;style=&quot;line-height:&#x20;18px;&#x20;overflow:&#x20;hidden;&quot;&gt;&lt;strong&gt;&lt;span&#x20;class=&quot;visual_font_size_18pt&quot;&#x20;style=&quot;color:&#x20;#ffffff;&quot;&gt;BERLIN&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;',NULL,4,3600,0,0,0,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(250,8,1676,185,132,200,'','worldmap',5,3600,0,0,3,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(251,8,1677,343,132,200,'','europemap',5,3600,0,0,4,0,1,0,0,0,0,'line','down','','',0,0,'default',0,0.000,0.000,0,0,'analogic_1','time','Europe/Madrid',0,0),(252,8,846,940,0,0,'','white',19,3600,0,0,0,0,1,0,0,0,0,'line','down','','#FFFFFF',0,0,'default',0,0.000,0.000,0,0,'digital_1','time','Europe/Madrid',0,0),(253,9,848,944,0,0,'','white',19,3600,0,0,0,0,1,0,0,0,0,'line','down','','#FFFFFF',0,0,'default',0,0.000,0.000,0,0,'digital_1','time','Europe/Madrid',0,0),(254,6,848,943,0,0,'','white',19,3600,0,0,0,0,1,0,0,0,0,'line','down','','#FFFFFF',0,0,'default',0,0.000,0.000,0,0,'digital_1','time','Europe/Madrid',0,0),(255,5,846,941,0,0,'','white',19,3600,0,0,0,0,1,0,0,0,0,'line','down','','#FFFFFF',0,0,'default',0,0.000,0.000,0,0,'digital_1','time','Europe/Madrid',0,0);
/*!40000 ALTER TABLE `tlayout_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlayout_template`
--

DROP TABLE IF EXISTS `tlayout_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlayout_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(600) NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  `background` varchar(200) NOT NULL,
  `height` int(10) unsigned NOT NULL DEFAULT '0',
  `width` int(10) unsigned NOT NULL DEFAULT '0',
  `background_color` varchar(50) NOT NULL DEFAULT '#FFF',
  `is_favourite` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlayout_template`
--

LOCK TABLES `tlayout_template` WRITE;
/*!40000 ALTER TABLE `tlayout_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlayout_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlayout_template_data`
--

DROP TABLE IF EXISTS `tlayout_template_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlayout_template_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_layout_template` int(10) unsigned NOT NULL,
  `pos_x` int(10) unsigned NOT NULL DEFAULT '0',
  `pos_y` int(10) unsigned NOT NULL DEFAULT '0',
  `height` int(10) unsigned NOT NULL DEFAULT '0',
  `width` int(10) unsigned NOT NULL DEFAULT '0',
  `label` text,
  `image` varchar(200) DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `period` int(10) unsigned NOT NULL DEFAULT '3600',
  `module_name` text NOT NULL,
  `agent_name` varchar(600) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `id_layout_linked` int(10) unsigned NOT NULL DEFAULT '0',
  `parent_item` int(10) unsigned NOT NULL DEFAULT '0',
  `enable_link` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `id_metaconsole` int(10) NOT NULL DEFAULT '0',
  `id_group` int(10) unsigned NOT NULL DEFAULT '0',
  `id_custom_graph` int(10) unsigned NOT NULL DEFAULT '0',
  `border_width` int(10) unsigned NOT NULL DEFAULT '0',
  `type_graph` varchar(50) NOT NULL DEFAULT 'area',
  `label_position` varchar(50) NOT NULL DEFAULT 'down',
  `border_color` varchar(200) DEFAULT '',
  `fill_color` varchar(200) DEFAULT '',
  `show_statistics` tinyint(2) NOT NULL DEFAULT '0',
  `linked_layout_node_id` int(10) NOT NULL DEFAULT '0',
  `linked_layout_status_type` enum('default','weight','service') DEFAULT 'default',
  `id_layout_linked_weight` int(10) NOT NULL DEFAULT '0',
  `linked_layout_status_as_service_warning` float(20,3) NOT NULL DEFAULT '0.000',
  `linked_layout_status_as_service_critical` float(20,3) NOT NULL DEFAULT '0.000',
  `element_group` int(10) NOT NULL DEFAULT '0',
  `show_on_top` tinyint(1) NOT NULL DEFAULT '0',
  `clock_animation` varchar(60) NOT NULL DEFAULT 'analogic_1',
  `time_format` varchar(60) NOT NULL DEFAULT 'time',
  `timezone` varchar(60) NOT NULL DEFAULT 'Europe/Madrid',
  `show_last_value` tinyint(1) unsigned DEFAULT '0',
  `cache_expiration` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_layout_template` (`id_layout_template`),
  CONSTRAINT `tlayout_template_data_ibfk_1` FOREIGN KEY (`id_layout_template`) REFERENCES `tlayout_template` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlayout_template_data`
--

LOCK TABLES `tlayout_template_data` WRITE;
/*!40000 ALTER TABLE `tlayout_template_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlayout_template_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlink`
--

DROP TABLE IF EXISTS `tlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlink` (
  `id_link` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_link`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlink`
--

LOCK TABLES `tlink` WRITE;
/*!40000 ALTER TABLE `tlink` DISABLE KEYS */;
INSERT INTO `tlink` VALUES (0000000001,'Documentation','http://wiki.pandorafms.com/'),(0000000002,'Enterprise Edition','http://pandorafms.com'),(0000000003,'Report a bug','https://github.com/pandorafms/pandorafms/issues'),(0000000004,'Suggest new feature','http://forums.pandorafms.com/index.php?board=22.0'),(0000000005,'Module library','http://library.pandorafms.com/');
/*!40000 ALTER TABLE `tlink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlocal_component`
--

DROP TABLE IF EXISTS `tlocal_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlocal_component` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `data` mediumtext NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `id_os` int(10) unsigned DEFAULT '0',
  `os_version` varchar(100) DEFAULT '',
  `id_network_component_group` int(10) unsigned NOT NULL DEFAULT '0',
  `type` smallint(6) NOT NULL DEFAULT '6',
  `max` bigint(20) NOT NULL DEFAULT '0',
  `min` bigint(20) NOT NULL DEFAULT '0',
  `module_interval` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_module_group` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `history_data` tinyint(1) unsigned DEFAULT '1',
  `min_warning` double(18,2) DEFAULT '0.00',
  `max_warning` double(18,2) DEFAULT '0.00',
  `str_warning` text,
  `min_critical` double(18,2) DEFAULT '0.00',
  `max_critical` double(18,2) DEFAULT '0.00',
  `str_critical` text,
  `min_ff_event` int(4) unsigned DEFAULT '0',
  `post_process` double(24,15) DEFAULT '0.000000000000000',
  `unit` text,
  `wizard_level` enum('basic','advanced','nowizard') DEFAULT 'nowizard',
  `macros` text,
  `critical_instructions` text NOT NULL,
  `warning_instructions` text NOT NULL,
  `unknown_instructions` text NOT NULL,
  `critical_inverse` tinyint(1) unsigned DEFAULT '0',
  `warning_inverse` tinyint(1) unsigned DEFAULT '0',
  `id_category` int(10) DEFAULT '0',
  `tags` text NOT NULL,
  `disabled_types_event` text NOT NULL,
  `min_ff_event_normal` int(4) unsigned DEFAULT '0',
  `min_ff_event_warning` int(4) unsigned DEFAULT '0',
  `min_ff_event_critical` int(4) unsigned DEFAULT '0',
  `ff_type` tinyint(1) unsigned DEFAULT '0',
  `each_ff` tinyint(1) unsigned DEFAULT '0',
  `ff_timeout` int(4) unsigned DEFAULT '0',
  `dynamic_interval` int(4) unsigned DEFAULT '0',
  `dynamic_max` int(4) DEFAULT '0',
  `dynamic_min` int(4) DEFAULT '0',
  `dynamic_next` bigint(20) NOT NULL DEFAULT '0',
  `dynamic_two_tailed` tinyint(1) unsigned DEFAULT '0',
  `prediction_sample_window` int(10) DEFAULT '0',
  `prediction_samples` int(4) DEFAULT '0',
  `prediction_threshold` int(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_network_component_group` (`id_network_component_group`),
  CONSTRAINT `tlocal_component_ibfk_1` FOREIGN KEY (`id_network_component_group`) REFERENCES `tnetwork_component_group` (`id_sg`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlocal_component`
--

LOCK TABLES `tlocal_component` WRITE;
/*!40000 ALTER TABLE `tlocal_component` DISABLE KEYS */;
INSERT INTO `tlocal_component` VALUES (1,'Event&#x20;1000','module_begin\r\nmodule_name Event_1000-Citrix\r\nmodule_description\r\nmodule_type async_string\r\nmodule_logevent\r\nmodule_source application\r\nmodule_eventtype\r\nmodule_eventcode 1000\r\nmodule_application\r\nmodule_end ','',9,'',25,23,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(2,'Event&#x20;1004','module_begin\r\nmodule_name Event_1004-Citrix\r\nmodule_description\r\nmodule_type async_string\r\nmodule_logevent\r\nmodule_source application\r\nmodule_eventtype\r\nmodule_eventcode 1004\r\nmodule_application\r\nmodule_end ','',9,'',25,23,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(3,'Event&#x20;1202','module_begin\r\nmodule_name Event_1202-Citrix\r\nmodule_description\r\nmodule_type async_string\r\nmodule_logevent\r\nmodule_source application\r\nmodule_eventtype\r\nmodule_eventcode 1202\r\nmodule_application\r\nmodule_end\r\nn ','',9,'',25,23,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(4,'Event&#x20;3621','module_begin\r\nmodule_name Event_3621\nr\nmodule_description Citrix cannot connect SQL server\r\nmodule_type async_string\r\nmodule_logevent\r\nmodule_source application\r\nmodule_eventtype Error\r\nmodule_eventcode 3621\r\nmodule_application\r\nmodule_end ','Citrix cannot connect SQL server',9,'',25,23,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(5,'Event&#x20;9014','module_begin\r\nmodule_name Event_9014\nr\nmodule_description Invalid licence\r\nmodule_type async_string\r\nmodule_logevent\r\nmodule_source system\r\nmodule_eventtype Error\r\nmodule_eventcode 9014\r\nmodule_application MetaFrame\r\nmodule_end ','Invalid licence',9,'',25,23,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(6,'Event&#x20;5774','module_begin\r\nmodule_name Event_5774\nr\nmodule_description Server goes to grace period (Not enough licences)\r\ndurante 96hr).\r\nmodule_type async_string\r\nmodule_logevent\r\nmodule_source system\r\nmodule_eventtype Error\r\n\nmodule_eventcode 5774\r\nmodule_application MetaFrame\r\nmodule_end ','Server goes to grace period (Not enough licences)',9,'',25,23,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(7,'Event&#x20;1388','module_begin\r\nmodule_name Event_1388\nr\nmodule_description Citrix internal monitoring\r\nmodule_type async_string\r\nmodule_logevent\r\nmodule_source application\r\nmodule_eventtype\r\nmodule_eventcode 1388\r\nmodule_application HCAService\r\nmodule_end ','Citrix internal monitoring',9,'',25,23,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(8,'Event&#x20;3961','module_begin\r\nmodule_name Event_3961\nr\nmodule_description The Data Collector is out of memory, and the Dynamic Store data might be out of sync. Please elect a new Data Collector and make sure you have enough memory on the new Data Collector\r\nmodule_type async_string\r\nmodule_logevent\r\nmodule_source System\r\nmodule_eventtype\r\nmodule_eventcode 3961\r\nmodule_application\r\nmodule_end ','The Data Collector is out of memory, and the Dynamic Store data might be out of sync. Please elect a new Data Collector and make sure you have enough memory on the new Data Collector',9,'',25,23,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(9,'Serv_HCA','module_begin\r\nmodule_name Serv_HCA\r\nmodule_description\r\nmodule_type generic_proc\r\nmodule_service HCAService\r\nmodule_end ','',9,'',25,2,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(10,'Serv_CTXcpusvnc','module_begin\r\nmodule_name Serv_CTXcpusvnc\r\nmodule_description\r\nmodule_type generic_proc\r\nmodule_service CTXCpuusync\r\n\nmodule_end ','',9,'',25,2,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(11,'Serv_IMA','module_begin\r\nmodule_name Serv_IMA\r\n\nmodule_description\r\nmodule_type generic_proc\r\nmodule_service IMAService\r\nmodule_end ','',9,'',25,2,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(13,'Serv_CTXSMA','module_begin\r\nmodule_name Serv_CTXSMA\r\nmodule_description\r\nmodule_type generic_proc\r\nmodule_service Citrix SMA Service\r\nmodule_end','',9,'',25,2,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(14,'Citrix_Sessions','module_begin\r\nmodule_name Citrix_Sessions\r\nmodule_description Opened active sessions on server\r\nmodule_type generic_data\r\nmodule_exec query session | grep Active | wc -l\r\nmodule_end ','Opened active sessions on server',9,'',25,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(15,'Users_Connected','module_begin\r\nmodule_name Users_Connected\r\nmodule_description Users connected to this server\r\nmodule_type generic_data\r\nmodule_exec quser | grep Active | wc -l\r\nmodule_interval 2\r\nmodule_end\r\n ','Users connected to this server',9,'',25,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(16,'Busy&#x20;XML&#x20;Threads','module_begin\r\nmodule_name Busy XML Threads\r\nmodule_description Total threads in the manager who manage the sessions. If there are more than XX, service fails. NOTE: Run this module only in managers\r\nmodule_type generic_data\r\nmodule_exec Typeperf &#039;&#92;&#92;MAQUINA&#92;Citrix Metaframe Presentation Server&#92;Number of busy XML threads&#039; -sc 1\r\nmodule_end\r\n','Total threads in the manager who manage the sessions. If there are more than XX, service fails. NOTE: Run this module only in managers',9,'',25,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(17,'CPU&#x20;Load','module_begin&#x0d;&#x0a;module_name&#x20;CPU&#x20;Load&#x0d;&#x0a;module_type&#x20;generic_data&#x0d;&#x0a;module_wmiquery&#x20;SELECT&#x20;LoadPercentage&#x20;FROM&#x20;Win32_Processor&#x0d;&#x0a;module_wmicolumn&#x20;LoadPercentage&#x0d;&#x0a;module_description&#x20;CPU&#x20;Load&#x20;&#40;%&#41;&#x0d;&#x0a;module_min_warning&#x20;80&#x0d;&#x0a;module_max_warning&#x20;90&#x0d;&#x0a;module_min_critical&#x20;91&#x0d;&#x0a;module_max_critical&#x20;100&#x0d;&#x0a;module_end','CPU&#x20;Load&#x20;&#40;using&#x20;WMI&#41;',9,'',11,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(18,'FreeMemory','#&#x20;Free&#x20;Memory&#x0d;&#x0a;module_begin&#x0d;&#x0a;module_name&#x20;FreeMemory&#x0d;&#x0a;module_type&#x20;generic_data&#x0d;&#x0a;module_freepercentmemory&#x0d;&#x0a;module_description&#x20;Free&#x20;memory&#x20;&#40;%&#41;.&#x0d;&#x0a;module_min_warning&#x20;21&#x0d;&#x0a;module_max_warning&#x20;30&#x0d;&#x0a;module_min_critical&#x20;0&#x0d;&#x0a;module_max_critical&#x20;20&#x0d;&#x0a;module_end','Free&#x20;memory&#x20;&#40;%&#41;.',9,'',11,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(19,'Microsoft&#x20;Antivirus','module_begin&#x0d;&#x0a;module_name&#x20;Microsoft&#x20;Antivirus&#x0d;&#x0a;module_type&#x20;generic_proc&#x0d;&#x0a;module_service&#x20;MsMpSvc&#x0d;&#x0a;module_description&#x20;Check&#x20;if&#x20;microsoft&#x20;antivirus/malware&#x20;service&#x20;is&#x20;running&#x0d;&#x0a;module_end','Check&#x20;if&#x20;microsoft&#x20;antivirus/malware&#x20;service&#x20;is&#x20;running',9,'',11,2,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(21,'Microsoft&#x20;Firewall','module_begin&#x0d;&#x0a;module_name&#x20;Microsoft&#x20;Firewall&#x0d;&#x0a;module_type&#x20;generic_proc&#x0d;&#x0a;module_service&#x20;MpsSvc&#x0d;&#x0a;module_description&#x20;Microsoft&#x20;windows&#x20;firewall&#x20;status.&#x0d;&#x0a;module_end','Microsoft&#x20;windows&#x20;firewall&#x20;status.',9,'',11,2,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(22,'Kaspersky&#x20;Antivirus','module_begin&#x0d;&#x0a;module_name&#x20;Kaspersky&#x20;Antivirus&#x0d;&#x0a;module_type&#x20;generic_proc&#x0d;&#x0a;module_service&#x20;AVP&#x0d;&#x0a;module_description&#x20;Kaspersky&#x20;Antivirus&#x0d;&#x0a;module_end','Checks&#x20;Karspersky&#x20;Antivirus&#x20;service&#x20;status',9,'',11,2,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(23,'CPU&#x20;Free','module_begin&#x20;&#x0d;&#x0a;module_name&#x20;&#x20;CPU&#x20;Free&#x0d;&#x0a;module_type&#x20;generic_data&#x0d;&#x0a;module_exec&#x20;echo&#x20;$&#40;&#40;&#x20;100-`vmstat&#x20;1&#x20;2&#x20;|&#x20;tail&#x20;-1&#x20;|&#x20;awk&#x20;&#039;{&#x20;print&#x20;$15&#x20;}&#039;`&#41;&#41;&#x0d;&#x0a;module_max&#x20;100&#x0d;&#x0a;module_min&#x20;0&#x0d;&#x0a;module_description&#x20;Percentage&#x20;CPU&#x20;Free&#x0d;&#x0a;module_end','Percentage&#x20;of&#x20;free&#x20;CPU',1,'',43,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(24,'Load&#x20;Average','module_begin&#x0d;&#x0a;module_name&#x20;Load&#x20;Average&#x0d;&#x0a;module_type&#x20;generic_data&#x0d;&#x0a;module_exec&#x20;uptime&#x20;|&#x20;awk&#x20;-F&#x20;&quot;,&quot;&#x20;&#039;{print&#x20;$3}&#039;&#x20;|&#x20;awk&#x20;&#039;{print&#x20;$3}&#039;&#x20;|&#x20;tr&#x20;&shy;d&#x20;&quot;&#92;n&quot;&#x0d;&#x0a;module_description&#x20;Average&#x20;load&#x20;last&#x20;minute&#x0d;&#x0a;module_end&#x0d;&#x0a;','Load&#x20;average&#x20;for&#x20;last&#x20;minute',1,'',43,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(25,'Memory&#x20;Free','module_begin&#x0d;&#x0a;module_name&#x20;Memory&#x20;Free&#x0d;&#x0a;module_type&#x20;generic_data&#x0d;&#x0a;module_freepercentmemory&#x0d;&#x0a;module_description&#x20;Percentage&#x20;Mem&#x20;Free&#x0d;&#x0a;module_end&#x0d;&#x0a;','Percentage&#x20;of&#x20;free&#x20;memory',1,'',43,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(26,'Disk&#x20;Free','module_begin&#x0d;&#x0a;module_name&#x20;Disk&#x20;Free&#x0d;&#x0a;module_type&#x20;generic_data&#x0d;&#x0a;module_freepercentdisk&#x20;/&#x0d;&#x0a;module_description&#x20;&#x20;Percentage&#x20;Free&#x20;Disk&#x0d;&#x0a;module_end&#x0d;&#x0a;','Percentage&#x20;of&#x20;free&#x20;disk',1,'',43,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(27,'SSH&#x20;Status','module_begin&#x0d;&#x0a;module_name&#x20;SSH&#x20;Status&#x0d;&#x0a;module_type&#x20;generic_proc&#x0d;&#x0a;module_exec&#x20;ps&#x20;-Af&#x20;|&#x20;grep&#x20;sshd&#x20;|&#x20;grep&#x20;-v&#x20;&quot;grep&quot;&#x20;|&#x20;wc&#x20;-l&#x0d;&#x0a;module_description&#x20;Check&#x20;ssh&#x20;service&#x0d;&#x0a;module_end','Monitors&#x20;SSH&#x20;server&#x20;status',1,'',43,2,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(28,'Free&#x20;i-nodes','module_begin&#x0d;&#x0a;module_name&#x20;Free&#x20;i-nodes&#x0d;&#x0a;module_type&#x20;generic_data&#x0d;&#x0a;module_exec&#x20;df&#x20;-i&#x20;|&#x20;grep&#x20;-E&#x20;&quot;/$&quot;&#x20;|&#x20;tail&#x20;-1&#x20;|&#x20;awk&#x20;&#039;{print&#x20;100-&#40;&#40;$3/$2&#41;*100&#41;}&#039;&#x0d;&#x0a;module_max&#x20;100&#x0d;&#x0a;module_min&#x20;0&#x0d;&#x0a;module_description&#x20;Percentage&#x20;Free&#x20;i-nodes&#x0d;&#x0a;module_end&#x0d;&#x0a;','Percentage&#x20;of&#x20;free&#x20;i-nodes',1,'',43,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(29,'FreeDiskC','module_begin&#x0d;&#x0a;module_name&#x20;FreeDiskC&#x0d;&#x0a;module_type&#x20;generic_data&#x0d;&#x0a;module_freepercentdisk&#x20;C:&#x0d;&#x0a;module_description&#x20;Free&#x20;space&#x20;on&#x20;drive&#x20;C:&#x20;&#40;%&#41;&#x0d;&#x0a;module_min_warning&#x20;31&#x0d;&#x0a;module_max_warning&#x20;40&#x0d;&#x0a;module_min_critical&#x20;0&#x0d;&#x0a;module_max_critical&#x20;30&#x0d;&#x0a;module_end&#x0d;&#x0a;','Free&#x20;space&#x20;on&#x20;disk&#x20;C:&#x20;&#40;%&#41;',9,'',11,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(30,'Windows_Update_LastRun','module_begin&#x0d;&#x0a;module_name&#x20;Windows_Update_LastRun&#x0d;&#x0a;module_type&#x20;generic_data_string&#x0d;&#x0a;module_exec&#x20;getreg&#x20;LM&#x20;&quot;SOFTWARE&#92;Microsoft&#92;Windows&#92;CurrentVersion&#92;WindowsUpdate&#92;Auto&#x20;Update&quot;&#x20;SetupWizardLaunchTime&#x0d;&#x0a;module_description&#x20;Last&#x20;date&#x20;and&#x20;time&#x20;user&#x20;launch&#x20;microsoft&#x20;Windows&#x20;update&#x0d;&#x0a;module_end','Last&#x20;date&#x20;and&#x20;time&#x20;user&#x20;launch&#x20;microsoft&#x20;Windows&#x20;update',9,'',11,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(31,'cpu_user','module_begin&#x0d;&#x0a;module_name&#x20;cpu_user&#x0d;&#x0a;module_type&#x20;generic_data&#x0d;&#x0a;module_interval&#x20;1&#x0d;&#x0a;module_exec&#x20;vmstat&#x20;-n0&#x20;1&#x20;2&#x20;|&#x20;tail&#x20;-1&#x20;|&#x20;awk&#x20;&#039;{&#x20;print&#x20;$15&#x20;}&#039;&#x0d;&#x0a;module_max&#x20;100&#x0d;&#x0a;module_min&#x20;0&#x0d;&#x0a;module_description&#x20;User&#x20;CPU&#x20;Usage&#x20;&#40;%&#41;&#x0d;&#x0a;module_end','User&#x20;CPU&#x20;Usage&#x20;&#40;%&#41;',4,'',47,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(32,'cpu_system','module_begin&#x0d;&#x0a;module_name&#x20;cpu_system&#x0d;&#x0a;module_type&#x20;generic_data&#x0d;&#x0a;module_interval&#x20;1&#x0d;&#x0a;module_exec&#x20;vmstat&#x20;-n0&#x20;1&#x20;2&#x20;|&#x20;tail&#x20;-1&#x20;|&#x20;awk&#x20;&#039;{&#x20;print&#x20;$16&#x20;}&#039;&#x0d;&#x0a;module_max&#x20;100&#x0d;&#x0a;module_min&#x20;0&#x0d;&#x0a;module_description&#x20;System&#x20;CPU&#x20;Usage&#x20;&#40;%&#41;&#x0d;&#x0a;module_end','System&#x20;CPU&#x20;Usage&#x20;&#40;%&#41;',4,'',47,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(33,'Load&#x20;Average','module_begin&#x0d;&#x0a;module_name&#x20;Load&#x20;Average&#x0d;&#x0a;module_type&#x20;generic_data&#x0d;&#x0a;module_exec&#x20;uptime&#x20;|&#x20;cut&#x20;-d&#x20;&quot;,&quot;&#x20;-f&#x20;4&#x20;|&#x20;cut&#x20;-d&#x20;&quot;:&quot;&#x20;-f&#x20;2&#x20;|&#x20;sed&#x20;&quot;s/&#x20;//g&quot;&#x0d;&#x0a;module_description&#x20;Average&#x20;process&#x20;in&#x20;CPU&#x20;&#40;Last&#x20;minute&#41;&#x0d;&#x0a;module_end&#x0d;&#x0a;','Average&#x20;process&#x20;in&#x20;CPU&#x20;&#40;Last&#x20;minute&#41;',4,'',47,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(34,'disk_root_free','module_begin&#x0d;&#x0a;module_name&#x20;disk_root_free&#x0d;&#x0a;module_type&#x20;generic_data&#x0d;&#x0a;module_exec&#x20;df&#x20;-kh&#x20;/&#x20;|&#x20;tail&#x20;-1&#x20;|&#x20;awk&#x20;&#039;{&#x20;print&#x20;100-$5&#x20;}&#039;&#x0d;&#x0a;module_max&#x20;100&#x0d;&#x0a;module_min&#x20;0&#x0d;&#x0a;module_description&#x20;Free&#x20;disk&#x20;Percentage&#x20;of&#x20;root&#x20;partition&#x0d;&#x0a;module_end','Free&#x20;disk&#x20;Percentage&#x20;of&#x20;root&#x20;partition',4,'',47,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(35,'memfree','module_begin&#x0d;&#x0a;module_name&#x20;memfree&#x0d;&#x0a;module_type&#x20;generic_data&#x0d;&#x0a;module_exec&#x20;vmstat&#x20;-H&#x20;1&#x20;2&#x20;|&#x20;tail&#x20;-1&#x20;|&#x20;awk&#x20;&#039;{print&#x20;$5}&#039;&#x0d;&#x0a;module_description&#x20;Unused&#x20;RAM&#x20;memory&#x0d;&#x0a;module_end&#x0d;&#x0a;','Free&#x20;memory&#x20;on&#x20;system',4,'',47,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(36,'sshDaemon','module_begin&#x0d;&#x0a;module_name&#x20;sshDaemon&#x0d;&#x0a;module_type&#x20;generic_proc&#x0d;&#x0a;module_exec&#x20;ps&#x20;-Af&#x20;|&#x20;grep&#x20;sshd&#x20;|&#x20;grep&#x20;-v&#x20;&quot;grep&quot;&#x20;|&#x20;wc&#x20;-l&#x20;|&#x20;sed&#x20;&quot;s/&#x20;//g&quot;&#x0d;&#x0a;module_end&#x0d;&#x0a;','Check&#x20;if&#x20;SSH&#x20;daemon&#x20;is&#x20;running',4,'',47,2,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(37,'cpu_user','module_begin&#x0d;&#x0a;module_name&#x20;cpu_user&#x0d;&#x0a;module_type&#x20;generic_data&#x0d;&#x0a;module_interval&#x20;1&#x0d;&#x0a;module_exec&#x20;sar&#x20;1&#x20;2&#x20;|&#x20;tail&#x20;-1&#x20;|&#x20;awk&#x20;&#039;{&#x20;print&#x20;$2&#x20;}&#039;&#x0d;&#x0a;module_max&#x20;100&#x0d;&#x0a;module_min&#x20;0&#x0d;&#x0a;module_description&#x20;User&#x20;CPU&#x20;Usage&#x20;&#40;%&#41;&#x0d;&#x0a;module_min_warning&#x20;70&#x0d;&#x0a;module_max_warning&#x20;90&#x0d;&#x0a;module_min_critical&#x20;91&#x0d;&#x0a;module_max_critical&#x20;100&#x0d;&#x0a;module_end','User&#x20;CPU&#x20;Usage&#x20;&#40;%&#41;',8,'',48,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(38,'Load&#x20;Average','module_begin&#x0d;&#x0a;module_name&#x20;Load&#x20;Average&#x0d;&#x0a;module_type&#x20;generic_data&#x0d;&#x0a;module_exec&#x20;uptime&#x20;|&#x20;sed&#x20;&#039;s/.*load&#x20;averages:&#x20;//&#039;|awk&#x20;&#039;{print&#x20;$1}&#039;&#x0d;&#x0a;module_description&#x20;Average&#x20;process&#x20;in&#x20;CPU&#x20;&#40;Last&#x20;minute&#41;&#x0d;&#x0a;module_end&#x0d;&#x0a;','Average&#x20;process&#x20;in&#x20;CPU&#x20;&#40;Last&#x20;minute&#41;',8,'',48,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(39,'Cache&#x20;mem&#x20;free','module_begin&#x0d;&#x0a;module_name&#x20;Cache&#x20;mem&#x20;free&#x0d;&#x0a;module_type&#x20;generic_data&#x0d;&#x0a;module_exec&#x20;vm_stat&#x20;|&#x20;grep&#x20;&#039;Pages&#x20;free&#039;|&#x20;awk&#x20;&#039;{print&#x20;$3/256}&#039;&#x0d;&#x0a;module_description&#x20;Free&#x20;cache&#x20;memory&#x20;in&#x20;MB&#x0d;&#x0a;module_min_warning&#x20;500&#x0d;&#x0a;module_max_warning&#x20;600&#x0d;&#x0a;module_min_critical&#x20;100&#x0d;&#x0a;module_max_critical&#x20;499&#x0d;&#x0a;module_end&#x0d;&#x0a;','Free&#x20;cache&#x20;memory&#x20;in&#x20;MB',8,'',48,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(40,'Free&#x20;disk&#x20;Percentage&#x20;of&#x20;root&#x20;partition','module_begin&#x0d;&#x0a;module_name&#x20;disk_root_free&#x0d;&#x0a;module_type&#x20;generic_data&#x0d;&#x0a;module_exec&#x20;df&#x20;-kh&#x20;/&#x20;|&#x20;tail&#x20;-1&#x20;|&#x20;awk&#x20;&#039;{&#x20;print&#x20;100-$5&#x20;}&#039;&#x0d;&#x0a;module_max&#x20;100&#x0d;&#x0a;module_min&#x20;0&#x0d;&#x0a;module_description&#x20;Free&#x20;disk&#x20;Percentage&#x20;of&#x20;root&#x20;partition&#x0d;&#x0a;module_min_warning&#x20;70&#x0d;&#x0a;module_max_warning&#x20;90&#x0d;&#x0a;module_min_critical&#x20;91&#x0d;&#x0a;module_max_critical&#x20;100&#x0d;&#x0a;module_end','Free&#x20;disk&#x20;Percentage&#x20;of&#x20;root&#x20;partition',8,'',48,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(41,'disk_usage_/','module_begin&#x0d;&#x0a;module_name&#x20;disk_usage_/&#x0d;&#x0a;module_type&#x20;generic_data&#x0d;&#x0a;module_exec&#x20;df&#x20;-P&#x20;|&#x20;grep&#x20;-e&#x20;&quot;/$&quot;&#x20;|&#x20;awk&#x20;&#039;{print&#x20;$5}&#039;&#x20;|&#x20;tr&#x20;-d&#x20;%&#x0d;&#x0a;module_description&#x20;&#x20;Disk&#x20;usage&#x20;on&#x20;/&#x20;&#40;%&#41;&#x0d;&#x0a;module_end','Disk&#x20;usage&#x20;on&#x20;/&#x20;&#40;%&#41;',5,'',44,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(42,'Swap_Free','module_begin&#x0d;&#x0a;module_name&#x20;Swap_Free&#x0d;&#x0a;module_type&#x20;generic_data&#x0d;&#x0a;module_exec&#x20;/usr/sbin/swapinfo&#x20;-t&#x20;|&#x20;grep&#x20;memory&#x20;|&#x20;tr&#x20;-d&#x20;&quot;%&quot;&#x20;|&#x20;awk&#x20;&#039;{&#x20;print&#x20;100-$5&#x20;}&#039;&#x0d;&#x0a;module_description&#x20;Unused&#x20;swap&#x20;memory&#x0d;&#x0a;module_end&#x0d;&#x0a;','Unused&#x20;swap&#x20;memory',5,'',44,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(43,'RAM_Free','module_begin&#x0d;&#x0a;module_name&#x20;RAM_Free&#x0d;&#x0a;module_type&#x20;generic_data&#x0d;&#x0a;module_exec&#x20;/usr/sbin/swapinfo&#x20;-t&#x20;|&#x20;grep&#x20;memory&#x20;|&#x20;awk&#x20;&#039;{print&#x20;$4}&#039;&#x0d;&#x0a;module_description&#x20;Unused&#x20;RAM&#x20;memory&#x0d;&#x0a;module_end&#x0d;&#x0a;','Unused&#x20;RAM&#x20;memory',5,'',44,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(44,'CPU_User','module_begin&#x0d;&#x0a;module_name&#x20;CPU_User&#x0d;&#x0a;module_type&#x20;generic_data&#x0d;&#x0a;module_exec&#x20;vmstat&#x20;1&#x20;2&#x20;|&#x20;tail&#x20;-1&#x20;|&#x20;awk&#x20;&#039;{&#x20;print&#x20;$16&#x20;}&#039;&#x0d;&#x0a;module_description&#x20;%&#x20;of&#x20;USER&#x20;CPU&#x0d;&#x0a;module_end','%&#x20;of&#x20;USER&#x20;CPU',5,'',44,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(45,'CPU_System','module_begin&#x0d;&#x0a;module_name&#x20;CPU_System&#x0d;&#x0a;module_type&#x20;generic_data&#x0d;&#x0a;module_exec&#x20;vmstat&#x20;1&#x20;2&#x20;|&#x20;tail&#x20;-1&#x20;|&#x20;awk&#x20;&#039;{&#x20;print&#x20;$17&#x20;}&#039;&#x0d;&#x0a;module_description&#x20;%&#x20;of&#x20;system&#x20;CPU&#x0d;&#x0a;module_end&#x0d;&#x0a;','%&#x20;of&#x20;system&#x20;CPU',5,'',44,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(46,'disk_root_free','module_begin&#x0d;&#x0a;module_name&#x20;disk_root_free&#x0d;&#x0a;module_type&#x20;generic_data&#x0d;&#x0a;module_exec&#x20;df&#x20;-k&#x20;/&#x20;|&#x20;tail&#x20;-1&#x20;|&#x20;tr&#x20;-d&#x20;&quot;%&quot;&#x20;|&#x20;awk&#x20;&#039;{&#x20;print&#x20;100-$5&#x20;}&#039;&#x0d;&#x0a;module_max&#x20;100&#x0d;&#x0a;module_min&#x20;0&#x0d;&#x0a;module_description&#x20;Free&#x20;disk&#x20;Percentage&#x20;of&#x20;root&#x20;partition&#x0d;&#x0a;module_end','Free&#x20;disk&#x20;Percentage&#x20;of&#x20;root&#x20;partition',2,'',45,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(47,'Swap_Free','module_begin&#x0d;&#x0a;module_name&#x20;Swap_Free&#x0d;&#x0a;module_type&#x20;generic_data&#x0d;&#x0a;module_exec&#x20;vmstat&#x20;1&#x20;2&#x20;|&#x20;tail&#x20;-1&#x20;|&#x20;awk&#x20;&#039;{&#x20;print&#x20;$4&#x20;}&#039;&#x0d;&#x0a;module_description&#x20;Unused&#x20;swap&#x20;memory&#x0d;&#x0a;module_end','Unused&#x20;swap&#x20;memory',2,'',45,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(48,'RAM_Free','module_begin&#x0d;&#x0a;module_name&#x20;RAM_Free&#x0d;&#x0a;module_type&#x20;generic_data&#x0d;&#x0a;module_exec&#x20;vmstat&#x20;1&#x20;2&#x20;|&#x20;tail&#x20;-1&#x20;|&#x20;awk&#x20;&#039;{&#x20;print&#x20;$5&#x20;}&#039;&#x0d;&#x0a;module_description&#x20;Unused&#x20;RAM&#x20;memory&#x0d;&#x0a;module_end','Unused&#x20;RAM&#x20;memory',2,'',45,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(49,'CPU_System','module_begin&#x0d;&#x0a;module_name&#x20;CPU_System&#x0d;&#x0a;module_type&#x20;generic_data&#x0d;&#x0a;module_exec&#x20;vmstat&#x20;1&#x20;2&#x20;|&#x20;tail&#x20;-1&#x20;|&#x20;awk&#x20;&#039;{&#x20;print&#x20;$21&#x20;}&#039;&#x0d;&#x0a;module_description&#x20;%&#x20;of&#x20;system&#x20;CPU&#x0d;&#x0a;module_end','%&#x20;of&#x20;system&#x20;CPU',2,'',45,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(50,'Disk_Seek_Operations','module_begin&#x0d;&#x0a;module_name&#x20;Disk_Seek_Operations&#x0d;&#x0a;module_type&#x20;generic_data&#x0d;&#x0a;module_exec&#x20;vmstat&#x20;1&#x20;2&#x20;|&#x20;tail&#x20;-1&#x20;|&#x20;awk&#x20;&#039;{&#x20;print&#x20;$14&#x20;}&#039;&#x0d;&#x0a;module_description&#x20;Disk&#x20;Seek&#x20;operations&#x0d;&#x0a;module_end','Disk&#x20;Seek&#x20;operations',2,'',45,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(51,'Pandora_Agent_RAM','module_begin&#x0d;&#x0a;module_name&#x20;Pandora_Agent_RAM&#x0d;&#x0a;module_type&#x20;generic_data&#x0d;&#x0a;module_exec&#x20;ps&#x20;-Afly&#x20;|&#x20;grep&#x20;perl&#x20;|&#x20;grep&#x20;-v&#x20;grep&#x20;|&#x20;awk&#x20;&#039;{&#x20;print&#x20;$9&#x20;}&#039;&#x0d;&#x0a;module_description&#x20;Return&#x20;size&#x20;in&#x20;KB&#x20;of&#x20;memory&#x20;used&#x20;by&#x20;process&#x20;Pandora&#x0d;&#x0a;module_end&#x0d;&#x0a;','Return&#x20;size&#x20;in&#x20;KB&#x20;of&#x20;memory&#x20;used&#x20;by&#x20;process&#x20;Pandora',2,'',45,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(52,'InetdDaemon','module_begin&#x0d;&#x0a;module_name&#x20;InetdDaemon&#x0d;&#x0a;module_type&#x20;generic_proc&#x0d;&#x0a;module_exec&#x20;ps&#x20;-Af&#x20;|&#x20;grep&#x20;inetd&#x20;|&#x20;grep&#x20;-v&#x20;&quot;grep&quot;&#x20;|&#x20;wc&#x20;-l&#x20;|&#x20;&#x20;awk&#x20;&#039;{&#x20;print&#x20;$1&#x20;}&#039;&#x0d;&#x0a;module_end','Check&#x20;inetd&#x20;daemon&#x20;running',2,'',45,2,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(53,'Pandora_Agent_RAM','module_begin&#x0d;&#x0a;module_name&#x20;Pandora_Agent_RAM&#x0d;&#x0a;module_type&#x20;generic_data&#x0d;&#x0a;module_exec&#x20;ps&#x20;axu&#x20;|&#x20;grep&#x20;perl&#x20;|&#x20;grep&#x20;-v&#x20;grep&#x20;|&#x20;awk&#x20;&#039;{&#x20;print&#x20;$4&#x20;}&#039;&#x20;|&#x20;tr&#x20;&quot;,&quot;&#x20;&quot;.&quot;&#x0d;&#x0a;module_end&#x0d;&#x0a;','Return&#x20;RAM&#x20;used&#x20;by&#x20;pandora&#x20;fms&#x20;agent.',3,'',46,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(54,'InetdDaemon','module_begin&#x0d;&#x0a;module_name&#x20;InetdDaemon&#x0d;&#x0a;module_type&#x20;generic_proc&#x0d;&#x0a;module_exec&#x20;ps&#x20;-Af&#x20;|&#x20;grep&#x20;inetd&#x20;|&#x20;grep&#x20;-v&#x20;&quot;grep&quot;&#x20;|&#x20;wc&#x20;-l&#x20;|&#x20;&#x20;awk&#x20;&#039;{&#x20;print&#x20;$1&#x20;}&#039;&#x0d;&#x0a;module_end&#x0d;&#x0a;','Check&#x20;inetddaemon&#x20;running&#x20;in&#x20;system',3,'',46,2,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(55,'disk_root_free','module_begin&#x0d;&#x0a;module_name&#x20;disk_root_free&#x0d;&#x0a;module_type&#x20;generic_data&#x0d;&#x0a;module_exec&#x20;df&#x20;-k&#x20;/&#x20;|&#x20;tail&#x20;-1&#x20;|&#x20;awk&#x20;&#039;{&#x20;print&#x20;100-$4&#x20;}&#039;&#x0d;&#x0a;module_max&#x20;100&#x0d;&#x0a;module_min&#x20;0&#x0d;&#x0a;module_description&#x20;Free&#x20;disk&#x20;Percentage&#x20;of&#x20;root&#x20;partition&#x0d;&#x0a;module_end','Free&#x20;disk&#x20;Percentage&#x20;of&#x20;root&#x20;partition',3,'',46,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(56,'OpenedFiles&#x20;','module_begin&#x20;&#x0d;&#x0a;module_name&#x20;OpenedFiles&#x20;&#x0d;&#x0a;module_type&#x20;generic_data&#x20;&#x0d;&#x0a;module_exec&#x20;lsof&#x20;|&#x20;wc&#x20;-l&#x20;&#x0d;&#x0a;module_description&#x20;Total&#x20;files&#x20;opened&#x20;in&#x20;system&#x20;&#x0d;&#x0a;module_end&#x20;','Total&#x20;files&#x20;opened&#x20;in&#x20;system&#x20;',1,'',43,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(57,'Zombie&#x20;processes','module_begin&#x20;&#x0d;&#x0a;module_name&#x20;Zombie&#x20;processes&#x0d;&#x0a;module_type&#x20;generic_data&#x20;&#x0d;&#x0a;module_exec&#x20;ps&#x20;&#x2D;eos&#x20;|&#x20;grep&#x20;&#x27;Z&#x27;&#x20;|&#x20;wc&#x20;&#x2D;l&#x20;|&#x20;tr&#x20;&#x2D;d&#x20;&#x22;&#92;n&#x22;&#x20;&#x0d;&#x0a;module_description&#x20;Number&#x20;of&#x20;zombie&#x20;processes&#x20;&#x0d;&#x0a;module_end&#x20;','Number&#x20;of&#x20;zombie&#x20;processes&#x20;',1,'',43,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0),(58,'Disk_IO_Wait','module_begin&#x20;&#x0d;&#x0a;module_name&#x20;Disk_IO_Wait&#x20;&#x0d;&#x0a;module_type&#x20;generic_data&#x20;&#x0d;&#x0a;module_exec&#x20;top&#x20;-n&#x20;3&#x20;-c&#x20;|&#x20;grep&#x20;&quot;Cpu&quot;&#x20;|&#x20;awk&#x20;&#039;{&#x20;print&#x20;$6&#x20;}&#039;&#x20;|&#x20;grep&#x20;-o&#x20;&quot;[0-9]*&quot;&#x20;|&#x20;tail&#x20;-1&#x20;&#x0d;&#x0a;module_description&#x20;Simple&#x20;approach&#x20;to&#x20;IO/Wait&#x20;monitoring.&#x20;&#x0d;&#x0a;module_end&#x20;','Simple&#x20;approach&#x20;to&#x20;IO/Wait&#x20;monitoring.&#x20;',1,'',43,1,0,0,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `tlocal_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlog_graph_models`
--

DROP TABLE IF EXISTS `tlog_graph_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlog_graph_models` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `regexp` text NOT NULL,
  `fields` text NOT NULL,
  `average` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlog_graph_models`
--

LOCK TABLES `tlog_graph_models` WRITE;
/*!40000 ALTER TABLE `tlog_graph_models` DISABLE KEYS */;
INSERT INTO `tlog_graph_models` VALUES (1,'Apache&#x20;log&#x20;model','^.*?&#92;s+.*&quot;.*?&#92;s&#40;&#92;/.*?&#41;&#92;?.*1.1&quot;&#92;s+&#40;.*?&#41;&#92;s+&#40;.*?&#41;&#92;s+','pagina,&#x20;html_err_code,&#x20;_tiempo_',1),(2,'Apache&#x20;accesses&#x20;per&#x20;client&#x20;and&#x20;status','&#40;.*?&#41;&#92;&#x20;-.*1.1&quot;&#92;&#x20;&#40;&#92;d+&#41;&#92;&#x20;&#92;d+','host,status',1),(3,'Apache&#x20;time&#x20;per&#x20;requester&#x20;and&#x20;html&#x20;code','&#40;.*?&#41;&#92;&#x20;-.*1.1&quot;&#92;&#x20;&#40;&#92;d+&#41;&#92;&#x20;&#40;&#92;d+&#41;','origin,respose,_time_',1),(4,'Count&#x20;output','.*','Coincidences',0),(5,'Events&#x20;replicated&#x20;to&#x20;metaconsole','.*&#x20;&#40;.*?&#41;&#x20;.*&#x20;&#40;&#92;d+&#41;&#x20;events&#x20;replicated&#x20;to&#x20;metaconsole','server,_events_',0),(6,'Pages&#x20;with&#x20;warnings','PHP&#x20;Warning:.*in&#x20;&#40;.*?&#41;&#x20;on','page',0),(7,'Users&#x20;login','Starting&#x20;Session&#x20;&#92;d+&#92;&#x20;of&#x20;user&#x20;&#40;.*&#41;','user',0);
/*!40000 ALTER TABLE `tlog_graph_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmap`
--

DROP TABLE IF EXISTS `tmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmap` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_group` int(10) unsigned NOT NULL DEFAULT '0',
  `id_user` varchar(250) NOT NULL DEFAULT '',
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `subtype` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(250) DEFAULT '',
  `description` text,
  `height` int(10) unsigned NOT NULL DEFAULT '0',
  `width` int(10) unsigned NOT NULL DEFAULT '0',
  `center_x` int(11) NOT NULL DEFAULT '0',
  `center_y` int(11) NOT NULL DEFAULT '0',
  `background` varchar(250) DEFAULT '',
  `background_options` int(10) unsigned NOT NULL DEFAULT '0',
  `source_period` int(10) unsigned NOT NULL DEFAULT '0',
  `source` int(10) unsigned NOT NULL DEFAULT '0',
  `source_data` varchar(250) DEFAULT '',
  `generation_method` int(10) unsigned NOT NULL DEFAULT '0',
  `generated` int(10) unsigned NOT NULL DEFAULT '0',
  `filter` text,
  `id_group_map` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmap`
--

LOCK TABLES `tmap` WRITE;
/*!40000 ALTER TABLE `tmap` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmensajes`
--

DROP TABLE IF EXISTS `tmensajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmensajes` (
  `id_mensaje` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_usuario_origen` varchar(60) NOT NULL DEFAULT '',
  `mensaje` text NOT NULL,
  `timestamp` bigint(20) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `estado` int(4) unsigned NOT NULL DEFAULT '0',
  `url` text,
  `response_mode` varchar(200) DEFAULT NULL,
  `citicity` int(10) unsigned DEFAULT '0',
  `id_source` bigint(20) unsigned NOT NULL,
  `subtype` varchar(255) DEFAULT '',
  `hidden_sent` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`id_mensaje`),
  UNIQUE KEY `id_mensaje` (`id_mensaje`),
  KEY `tsource_fk` (`id_source`),
  CONSTRAINT `tsource_fk` FOREIGN KEY (`id_source`) REFERENCES `tnotification_source` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmensajes`
--

LOCK TABLES `tmensajes` WRITE;
/*!40000 ALTER TABLE `tmensajes` DISABLE KEYS */;
INSERT INTO `tmensajes` VALUES (12,'','At&#x20;least&#x20;one&#x20;server&#x20;must&#x20;be&#x20;defined&#x20;to&#x20;run&#x20;as&#x20;master.&#x20;Please,&#x20;check&#x20;documentation.',1600436750,'No&#x20;master&#x20;servers&#x20;found.',0,'https://wiki.pandorafms.com/index.php?title=Pandora:Documentation_en:Configuration#master',NULL,0,1,'NOTIF.SERVER.MASTER',0),(13,'','The&#x20;recommended&#x20;value&#x20;is&#x20;-1&#x20;&#40;Unlimited&#41;&lt;br&gt;&lt;br&gt;Please,&#x20;change&#x20;it&#x20;on&#x20;your&#x20;PHP&#x20;configuration&#x20;file&#x20;&#40;php.ini&#41;&#x20;or&#x20;contact&#x20;with&#x20;administrator&#x20;&#40;Do&#x20;not&#x20;forget&#x20;to&#x20;restart&#x20;Apache&#x20;process&#x20;after&#41;',1600436750,'`max_input_time`&#x20;value&#x20;in&#x20;PHP&#x20;configuration&#x20;is&#x20;not&#x20;recommended',0,'http://php.net/manual/en/info.configuration.php#ini.max-input-time',NULL,0,1,'NOTIF.PHP.INPUT_TIME',0),(14,'','The&#x20;recommended&#x20;value&#x20;is:&#x20;0&#x20;&#40;Unlimited&#41;&lt;br&gt;&lt;br&gt;Please,&#x20;change&#x20;this&#x20;in&#x20;your&#x20;PHP&#x20;configuration&#x20;file&#x20;&#40;php.ini&#41;&#x20;or&#x20;contact&#x20;your&#x20;administrator&#x20;&#40;remember&#x20;to&#x20;restart&#x20;the&#x20;Apache&#x20;process&#x20;after&#x20;performing&#x20;changes&#41;.',1600436750,'Not&#x20;recommended&#x20;`max_execution_time`&#x20;value&#x20;in&#x20;PHP&#x20;configuration',0,'http://php.net/manual/en/info.configuration.php#ini.max-execution-time',NULL,0,1,'NOTIF.PHP.EXECUTION_TIME',0),(15,'','The&#x20;recommended&#x20;value&#x20;is:&#x20;800M&#x20;or&#x20;greater&lt;br&gt;&lt;br&gt;Please,&#x20;change&#x20;this&#x20;in&#x20;your&#x20;PHP&#x20;configuration&#x20;file&#x20;&#40;php.ini&#41;&#x20;or&#x20;contact&#x20;your&#x20;administrator&#x20;&#40;remember&#x20;to&#x20;restart&#x20;the&#x20;Apache&#x20;process&#x20;after&#x20;performing&#x20;changes&#41;.',1600436751,'Not&#x20;recommended&#x20;`upload_max_filesize`&#x20;value&#x20;in&#x20;PHP&#x20;configuration',0,'http://php.net/manual/en/ini.core.php#ini.upload-max-filesize',NULL,0,1,'NOTIF.PHP.UPLOAD_MAX_FILESIZE',0),(16,'','The&#x20;recommended&#x20;value&#x20;is:&#x20;500M&#x20;or&#x20;greater&lt;br&gt;&lt;br&gt;Please,&#x20;change&#x20;it&#x20;in&#x20;your&#x20;PHP&#x20;configuration&#x20;file&#x20;&#40;php.ini&#41;&#x20;or&#x20;contact&#x20;the&#x20;administrator.',1600436751,'Not&#x20;recommended&#x20;`memory_limit`&#x20;value&#x20;in&#x20;PHP&#x20;configuration',0,'http://php.net/manual/en/ini.core.php#ini.memory-limit',NULL,0,1,'NOTIF.PHP.MEMORY_LIMIT',0),(17,'','To&#x20;be&#x20;able&#x20;to&#x20;create&#x20;images&#x20;of&#x20;the&#x20;graphs&#x20;for&#x20;PDFs,&#x20;please&#x20;install&#x20;the&#x20;PhantomJS&#x20;extension.&#x20;For&#x20;that,&#x20;it&#x20;is&#x20;necessary&#x20;to&#x20;follow&#x20;these&#x20;steps:',1600436751,'PhantomJS&#x20;is&#x20;not&#x20;installed',0,'https://wiki.pandorafms.com/index.php?title=Pandora:Documentation_en:Configuration#Phantomjs',NULL,0,1,'NOTIF.PHP.PHANTOMJS',0),(19,'','Click&#x20;&lt;a&#x20;style=&quot;font-weight:bold;&#x20;text-decoration:underline&quot;&#x20;href=&quot;javascript:&#x20;force_run_register&#40;&#41;;&quot;&gt;&#x20;here&lt;/a&gt;&#x20;to&#x20;start&#x20;the&#x20;registration&#x20;process',1600436751,'This&#x20;instance&#x20;is&#x20;not&#x20;registered&#x20;in&#x20;the&#x20;Update&#x20;manager&#x20;section',0,'javascript:&#x20;force_run_register&#40;&#41;;',NULL,0,1,'NOTIF.UPDATEMANAGER.REGISTRATION',0),(20,'','Please,&#x20;change&#x20;the&#x20;default&#x20;password&#x20;since&#x20;it&#x20;is&#x20;a&#x20;commonly&#x20;reported&#x20;vulnerability.',1600436752,'Default&#x20;password&#x20;for&#x20;&quot;Admin&quot;&#x20;user&#x20;has&#x20;not&#x20;been&#x20;changed',0,'https://192.168.110.22/pandora_console/index.php?sec=gusuarios&amp;sec2=godmode/users/user_list',NULL,0,1,'NOTIF.SECURITY.DEFAULT_PASSWORD',0);
/*!40000 ALTER TABLE `tmensajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmetaconsole_agent`
--

DROP TABLE IF EXISTS `tmetaconsole_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmetaconsole_agent` (
  `id_agente` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_tagente` int(10) unsigned NOT NULL,
  `id_tmetaconsole_setup` int(10) NOT NULL,
  `nombre` varchar(600) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `direccion` varchar(100) DEFAULT NULL,
  `comentarios` varchar(255) DEFAULT '',
  `id_grupo` int(10) unsigned NOT NULL DEFAULT '0',
  `ultimo_contacto` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `modo` tinyint(1) NOT NULL DEFAULT '0',
  `intervalo` int(11) unsigned NOT NULL DEFAULT '300',
  `id_os` int(10) unsigned DEFAULT '0',
  `os_version` varchar(100) DEFAULT '',
  `agent_version` varchar(100) DEFAULT '',
  `ultimo_contacto_remoto` datetime DEFAULT '1970-01-01 00:00:00',
  `disabled` tinyint(2) NOT NULL DEFAULT '0',
  `remote` tinyint(1) NOT NULL DEFAULT '0',
  `id_parent` int(10) unsigned DEFAULT '0',
  `custom_id` varchar(255) DEFAULT '',
  `server_name` varchar(100) DEFAULT '',
  `cascade_protection` tinyint(2) NOT NULL DEFAULT '0',
  `cascade_protection_module` int(10) unsigned DEFAULT '0',
  `timezone_offset` tinyint(2) DEFAULT '0' COMMENT 'number of hours of diference with the server timezone',
  `icon_path` varchar(127) DEFAULT NULL COMMENT 'path in the server to the image of the icon representing the agent',
  `update_gis_data` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'set it to one to update the position data (altitude, longitude, latitude) when getting information from the agent or to 0 to keep the last value and do not update it',
  `url_address` mediumtext,
  `quiet` tinyint(1) NOT NULL DEFAULT '0',
  `normal_count` bigint(20) NOT NULL DEFAULT '0',
  `warning_count` bigint(20) NOT NULL DEFAULT '0',
  `critical_count` bigint(20) NOT NULL DEFAULT '0',
  `unknown_count` bigint(20) NOT NULL DEFAULT '0',
  `notinit_count` bigint(20) NOT NULL DEFAULT '0',
  `total_count` bigint(20) NOT NULL DEFAULT '0',
  `fired_count` bigint(20) NOT NULL DEFAULT '0',
  `update_module_count` tinyint(1) NOT NULL DEFAULT '0',
  `update_alert_count` tinyint(1) NOT NULL DEFAULT '0',
  `update_secondary_groups` tinyint(1) NOT NULL DEFAULT '0',
  `transactional_agent` tinyint(1) NOT NULL DEFAULT '0',
  `alias` varchar(600) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `alias_as_name` tinyint(2) NOT NULL DEFAULT '0',
  `safe_mode_module` int(10) unsigned NOT NULL DEFAULT '0',
  `cps` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_agente`),
  KEY `nombre` (`nombre`(255)),
  KEY `direccion` (`direccion`),
  KEY `id_tagente_idx` (`id_tagente`),
  KEY `disabled` (`disabled`),
  KEY `id_grupo` (`id_grupo`),
  KEY `id_tmetaconsole_setup` (`id_tmetaconsole_setup`),
  CONSTRAINT `tmetaconsole_agent_ibfk_1` FOREIGN KEY (`id_tmetaconsole_setup`) REFERENCES `tmetaconsole_setup` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmetaconsole_agent`
--

LOCK TABLES `tmetaconsole_agent` WRITE;
/*!40000 ALTER TABLE `tmetaconsole_agent` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmetaconsole_agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmetaconsole_agent_secondary_group`
--

DROP TABLE IF EXISTS `tmetaconsole_agent_secondary_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmetaconsole_agent_secondary_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_agent` int(10) unsigned NOT NULL,
  `id_tagente` int(10) unsigned NOT NULL,
  `id_tmetaconsole_setup` int(10) NOT NULL,
  `id_group` mediumint(4) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_tagente` (`id_tagente`),
  KEY `id_agent` (`id_agent`),
  KEY `id_group` (`id_group`),
  KEY `id_tmetaconsole_setup` (`id_tmetaconsole_setup`),
  CONSTRAINT `tmetaconsole_agent_secondary_group_ibfk_1` FOREIGN KEY (`id_agent`) REFERENCES `tmetaconsole_agent` (`id_agente`) ON DELETE CASCADE,
  CONSTRAINT `tmetaconsole_agent_secondary_group_ibfk_2` FOREIGN KEY (`id_group`) REFERENCES `tgrupo` (`id_grupo`) ON DELETE CASCADE,
  CONSTRAINT `tmetaconsole_agent_secondary_group_ibfk_3` FOREIGN KEY (`id_tmetaconsole_setup`) REFERENCES `tmetaconsole_setup` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmetaconsole_agent_secondary_group`
--

LOCK TABLES `tmetaconsole_agent_secondary_group` WRITE;
/*!40000 ALTER TABLE `tmetaconsole_agent_secondary_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmetaconsole_agent_secondary_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmetaconsole_event`
--

DROP TABLE IF EXISTS `tmetaconsole_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmetaconsole_event` (
  `id_evento` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_source_event` bigint(20) unsigned NOT NULL,
  `id_agente` int(10) NOT NULL DEFAULT '0',
  `agent_name` varchar(600) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `id_usuario` varchar(100) NOT NULL DEFAULT '0',
  `id_grupo` mediumint(4) NOT NULL DEFAULT '0',
  `group_name` varchar(100) NOT NULL DEFAULT '',
  `estado` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `timestamp` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `evento` text NOT NULL,
  `utimestamp` bigint(20) NOT NULL DEFAULT '0',
  `event_type` enum('going_unknown','unknown','alert_fired','alert_recovered','alert_ceased','alert_manual_validation','recon_host_detected','system','error','new_agent','going_up_warning','going_up_critical','going_down_warning','going_down_normal','going_down_critical','going_up_normal','configuration_change') DEFAULT 'unknown',
  `id_agentmodule` int(10) NOT NULL DEFAULT '0',
  `module_name` varchar(600) NOT NULL,
  `id_alert_am` int(10) NOT NULL DEFAULT '0',
  `alert_template_name` text,
  `criticity` int(4) unsigned NOT NULL DEFAULT '0',
  `user_comment` text NOT NULL,
  `tags` text NOT NULL,
  `source` tinytext NOT NULL,
  `id_extra` tinytext NOT NULL,
  `critical_instructions` text NOT NULL,
  `warning_instructions` text NOT NULL,
  `unknown_instructions` text NOT NULL,
  `owner_user` varchar(100) NOT NULL DEFAULT '',
  `ack_utimestamp` bigint(20) NOT NULL DEFAULT '0',
  `server_id` int(10) NOT NULL,
  `custom_data` text NOT NULL,
  `data` double(22,5) DEFAULT NULL,
  `module_status` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_evento`),
  KEY `idx_agente` (`id_agente`),
  KEY `idx_agentmodule` (`id_agentmodule`),
  KEY `server_id` (`server_id`),
  KEY `idx_utimestamp` (`utimestamp`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmetaconsole_event`
--

LOCK TABLES `tmetaconsole_event` WRITE;
/*!40000 ALTER TABLE `tmetaconsole_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmetaconsole_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmetaconsole_event_history`
--

DROP TABLE IF EXISTS `tmetaconsole_event_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmetaconsole_event_history` (
  `id_evento` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_source_event` bigint(20) unsigned NOT NULL,
  `id_agente` int(10) NOT NULL DEFAULT '0',
  `agent_name` varchar(600) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `id_usuario` varchar(100) NOT NULL DEFAULT '0',
  `id_grupo` mediumint(4) NOT NULL DEFAULT '0',
  `group_name` varchar(100) NOT NULL DEFAULT '',
  `estado` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `timestamp` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `evento` text NOT NULL,
  `utimestamp` bigint(20) NOT NULL DEFAULT '0',
  `event_type` enum('going_unknown','unknown','alert_fired','alert_recovered','alert_ceased','alert_manual_validation','recon_host_detected','system','error','new_agent','going_up_warning','going_up_critical','going_down_warning','going_down_normal','going_down_critical','going_up_normal','configuration_change') DEFAULT 'unknown',
  `id_agentmodule` int(10) NOT NULL DEFAULT '0',
  `module_name` varchar(600) NOT NULL,
  `id_alert_am` int(10) NOT NULL DEFAULT '0',
  `alert_template_name` text,
  `criticity` int(4) unsigned NOT NULL DEFAULT '0',
  `user_comment` text NOT NULL,
  `tags` text NOT NULL,
  `source` tinytext NOT NULL,
  `id_extra` tinytext NOT NULL,
  `critical_instructions` text NOT NULL,
  `warning_instructions` text NOT NULL,
  `unknown_instructions` text NOT NULL,
  `owner_user` varchar(100) NOT NULL DEFAULT '',
  `ack_utimestamp` bigint(20) NOT NULL DEFAULT '0',
  `server_id` int(10) NOT NULL,
  `custom_data` text NOT NULL,
  `data` double(22,5) DEFAULT NULL,
  `module_status` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_evento`),
  KEY `idx_agente` (`id_agente`),
  KEY `idx_agentmodule` (`id_agentmodule`),
  KEY `idx_utimestamp` (`utimestamp`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmetaconsole_event_history`
--

LOCK TABLES `tmetaconsole_event_history` WRITE;
/*!40000 ALTER TABLE `tmetaconsole_event_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmetaconsole_event_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmetaconsole_setup`
--

DROP TABLE IF EXISTS `tmetaconsole_setup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmetaconsole_setup` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `server_name` text,
  `server_url` text,
  `dbuser` text,
  `dbpass` text,
  `dbhost` text,
  `dbport` text,
  `dbname` text,
  `meta_dbuser` text,
  `meta_dbpass` text,
  `meta_dbhost` text,
  `meta_dbport` text,
  `meta_dbname` text,
  `auth_token` text,
  `id_group` int(10) unsigned NOT NULL DEFAULT '0',
  `api_password` text NOT NULL,
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `last_event_replication` bigint(20) DEFAULT '0',
  `server_uid` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table to store metaconsole sources';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmetaconsole_setup`
--

LOCK TABLES `tmetaconsole_setup` WRITE;
/*!40000 ALTER TABLE `tmetaconsole_setup` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmetaconsole_setup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmigration_module_queue`
--

DROP TABLE IF EXISTS `tmigration_module_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmigration_module_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_migration` int(10) unsigned NOT NULL,
  `id_source_agentmodule` int(10) unsigned NOT NULL,
  `id_target_agentmodule` int(10) unsigned NOT NULL,
  `last_replication_timestamp` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_migration` (`id_migration`),
  CONSTRAINT `tmigration_module_queue_ibfk_1` FOREIGN KEY (`id_migration`) REFERENCES `tmigration_queue` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmigration_module_queue`
--

LOCK TABLES `tmigration_module_queue` WRITE;
/*!40000 ALTER TABLE `tmigration_module_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmigration_module_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmigration_queue`
--

DROP TABLE IF EXISTS `tmigration_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmigration_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_source_agent` int(10) unsigned NOT NULL,
  `id_target_agent` int(10) unsigned NOT NULL,
  `id_source_node` int(10) unsigned NOT NULL,
  `id_target_node` int(10) unsigned NOT NULL,
  `priority` int(10) unsigned DEFAULT '0',
  `step` int(11) DEFAULT '0',
  `running` tinyint(2) DEFAULT '0',
  `active_db_only` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmigration_queue`
--

LOCK TABLES `tmigration_queue` WRITE;
/*!40000 ALTER TABLE `tmigration_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmigration_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmodule`
--

DROP TABLE IF EXISTS `tmodule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmodule` (
  `id_module` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_module`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmodule`
--

LOCK TABLES `tmodule` WRITE;
/*!40000 ALTER TABLE `tmodule` DISABLE KEYS */;
INSERT INTO `tmodule` VALUES (1,'Agent&#x20;module'),(2,'Network&#x20;module'),(4,'Plugin&#x20;module'),(5,'Prediction&#x20;module'),(6,'WMI&#x20;module'),(7,'Web&#x20;module'),(8,'Wux&#x20;module'),(9,'Wizard&#x20;module');
/*!40000 ALTER TABLE `tmodule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmodule_group`
--

DROP TABLE IF EXISTS `tmodule_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmodule_group` (
  `id_mg` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_mg`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmodule_group`
--

LOCK TABLES `tmodule_group` WRITE;
/*!40000 ALTER TABLE `tmodule_group` DISABLE KEYS */;
INSERT INTO `tmodule_group` VALUES (1,'General'),(2,'Networking'),(3,'Application'),(4,'System'),(5,'Miscellaneous'),(6,'Performance'),(7,'Database'),(8,'Enviromental'),(9,'Users');
/*!40000 ALTER TABLE `tmodule_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmodule_inventory`
--

DROP TABLE IF EXISTS `tmodule_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmodule_inventory` (
  `id_module_inventory` int(10) NOT NULL AUTO_INCREMENT,
  `id_os` int(10) unsigned DEFAULT NULL,
  `name` text,
  `description` text,
  `interpreter` varchar(100) DEFAULT '',
  `data_format` text,
  `code` blob NOT NULL,
  `block_mode` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_module_inventory`),
  KEY `id_os` (`id_os`),
  CONSTRAINT `tmodule_inventory_ibfk_1` FOREIGN KEY (`id_os`) REFERENCES `tconfig_os` (`id_os`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmodule_inventory`
--

LOCK TABLES `tmodule_inventory` WRITE;
/*!40000 ALTER TABLE `tmodule_inventory` DISABLE KEYS */;
INSERT INTO `tmodule_inventory` VALUES (1,1,'CPU','CPU','/usr/bin/perl','Model;Company;Speed','IyEvdXNyL2Jpbi9wZXJsDQojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KIyBwYW5kb3JhX2NwdS5wbA0KIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCiMgQ29weXJpZ2h0IChjKSAyMDA4IFJhbW9uIE5vdm9hLCBybm92b2FAYXJ0aWNhLmVzDQojICAgICAgICAgICAoYykgMjAwOCBBcnRpY2EgU29sdWNpb25lcyBUZWNub2xvZ2ljYXMgUy5MDQojDQojIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3INCiMgbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UNCiMgYXMgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IHZlcnNpb24gMi4NCiMNCiMgVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsDQojIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mDQojIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUNCiMgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4NCiMgWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UNCiMgYWxvbmcgd2l0aCB0aGlzIHByb2dyYW07IGlmIG5vdCwgd3JpdGUgdG8gdGhlIEZyZWUgU29mdHdhcmUNCiMgRm91bmRhdGlvbiwgSW5jLiwgNTEgRnJhbmtsaW4gU3RyZWV0LCBGaWZ0aCBGbG9vciwgQm9zdG9uLCBNQSAgMDIxMTAtMTMwMSwgVVNBLg0KIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCg0KdXNlIHN0cmljdDsNCnVzZSB3YXJuaW5nczsNCg0KIyBDaGVjayBmb3Igc3NoDQpteSAkc3NoX2NsaWVudCA9ICJzc2giOw0KaWYgKHN5c3RlbSgiJHNzaF9jbGllbnQgLXYgPiAvZGV2L251bGwgMj4mMSIpID4+IDggIT0gMjU1KSB7DQoJcHJpbnQgIltlcnJvcl0gJHNzaF9jbGllbnQgbm90IGZvdW5kLlxuIjsNCglleGl0IDE7DQp9DQoNCmlmICgkI0FSR1YgPCAxKSB7DQoJcHJpbnQgIlVzYWdlOiAkMCA8dGFyZ2V0IGlwPiA8dXNlcm5hbWU+XG4iOw0KCWV4aXQgMTsNCn0NCg0KbXkgJHRhcmdldF9pcCA9ICRBUkdWWzBdOw0KbXkgJHVzZXJuYW1lID0gJEFSR1ZbMV07DQoNCiMgUmV0cmlldmUgQ1BVIGRhdGENCm15ICgkbW9kZWwsICR2ZW5kb3IsICRzcGVlZCk7DQpteSBAY3B1X2luZm8gPSBgJHNzaF9jbGllbnQgJHVzZXJuYW1lXEAkdGFyZ2V0X2lwICJjYXQgL3Byb2MvY3B1aW5mbyJgOw0KZm9yZWFjaCBteSAkbGluZSAoQGNwdV9pbmZvKSB7DQoJaWYgKCRsaW5lID1+IC9tb2RlbCBuYW1lXHMrOlxzKyguKikvKSB7DQoJCSRtb2RlbCA9ICQxOw0KCX0gZWxzaWYgKCRsaW5lID1+IC92ZW5kb3JfaWRccys6XHMrKC4qKS8pIHsNCgkJJHZlbmRvciA9ICQxOw0KCX0gZWxzaWYgKCRsaW5lID1+IC9jcHUgTUh6XHMrOlxzKyguKikvKSB7DQoJCSRzcGVlZCA9ICQxOw0KCX0NCn0NCiANCnJldHVybiAxIGlmICgkbW9kZWwgZXEgJycgfHwgJHZlbmRvciBlcSAnJyB8fCAkc3BlZWQgZXEgJycpOw0KcHJpbnQgIiRtb2RlbDskdmVuZG9yOyIgLiBzcHJpbnRmICgiJS4wZiIsICRzcGVlZCkgLiAiIE1IelxuIjsNCg0KZXhpdCAwOw0K',0),(2,9,'CPU','CPU','/usr/bin/perl','Name;Speed;Description','IyEvdXNyL2Jpbi9wZXJsDQojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KIyBwYW5kb3JhX2NwdS5wbA0KIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCiMgQ29weXJpZ2h0IChjKSAyMDA4IFJhbW9uIE5vdm9hLCBybm92b2FAYXJ0aWNhLmVzDQojICAgICAgICAgICAoYykgMjAwOCBBcnRpY2EgU29sdWNpb25lcyBUZWNub2xvZ2ljYXMgUy5MDQojDQojIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3INCiMgbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UNCiMgYXMgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IHZlcnNpb24gMi4NCiMNCiMgVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsDQojIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mDQojIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUNCiMgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4NCiMgWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UNCiMgYWxvbmcgd2l0aCB0aGlzIHByb2dyYW07IGlmIG5vdCwgd3JpdGUgdG8gdGhlIEZyZWUgU29mdHdhcmUNCiMgRm91bmRhdGlvbiwgSW5jLiwgNTEgRnJhbmtsaW4gU3RyZWV0LCBGaWZ0aCBGbG9vciwgQm9zdG9uLCBNQSAgMDIxMTAtMTMwMSwgVVNBLg0KIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCg0KdXNlIHN0cmljdDsNCnVzZSB3YXJuaW5nczsNCg0KdXNlIEZpbGU6OkJhc2VuYW1lOw0KdXNlIEhUTUw6OkVudGl0aWVzICgpOw0KDQojIENoZWNrIGZvciB3bWljDQpteSAkd21pX2NsaWVudCA9ICJ3bWljIjsNCmlmIChzeXN0ZW0oIiR3bWlfY2xpZW50ID4gL2Rldi9udWxsIDI+JjEiKSAhPSAyNTYpIHsNCglwcmludCAiW2Vycm9yXSAkd21pX2NsaWVudCBub3QgZm91bmQuXG4iOw0KCWV4aXQgMTsNCn0NCg0KaWYgKCQjQVJHViAhPSAyKSB7DQoJcHJpbnQgIlVzYWdlOiAkMCA8dGFyZ2V0IGlwPiA8dXNlcm5hbWU+IDxwYXNzd29yZD5cbiI7DQoJZXhpdCAxOw0KfQ0KDQpteSAkdGFyZ2V0X2lwID0gJEFSR1ZbMF07DQpteSAkdXNlcm5hbWUgPSAkQVJHVlsxXTsNCm15ICRwYXNzd29yZCA9ICRBUkdWWzJdOw0KDQojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KIyBTVUIgcnVuX3F1ZXJ5ICgkd3FsX3F1ZXJ5KQ0KIyBSdW5zIHRoZSBnaXZlbiBXUUwgcXVlcnkgYW5kIHJldHVybnMgdGhlIHJlc3VsdCBhcyBhbiBhcnJheSBvZiBoYXNoZXMuDQojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0Kc3ViIHJ1bl9xdWVyeSB7DQoJbXkgJHdxbF9xdWVyeSA9ICRfWzBdOw0KCW15IEByZXN1bHQgPSB7fTsNCg0KCSR3cWxfcXVlcnkgPX4gJ3MvIi9cJy9nJzsNCg0KCSMgUnVuIHRoZSBEQ09NL1dNSSBjbGllbnQNCglteSAkb3V0cHV0ID0gYCR3bWlfY2xpZW50IC1VICckdXNlcm5hbWUnJSckcGFzc3dvcmQnIC8vJHRhcmdldF9pcCBcIiR3cWxfcXVlcnlcIiAyPi9kZXYvbnVsbGA7DQoNCglteSBAbGluZXMgPSBzcGxpdCgvXG4vLCAkb3V0cHV0KTsNCgkjIEhlYWRlciwgZGVzY3JpcHRpb24sIHJlc3VsdHMNCglpZiAoJCNsaW5lcyA8IDIpIHsNCgkJZXhpdCAxOw0KCX0NCg0KCSMgRHJvcCB0aGUgaGVhZGVyDQoJc2hpZnQgKEBsaW5lcyk7DQoJDQoJIyBHZXQgY29sdW1uIG5hbWVzDQoJbXkgQGNvbHVtbl9uYW1lcyA9IHNwbGl0KC9cfC8sIHNoaWZ0IChAbGluZXMpKTsNCg0KCSMgR2V0IHJvdyBkYXRhDQoJbXkgJGlkeCA9IDA7DQoJZm9yIChteSAkaSA9IDA7ICRpIDw9ICQjbGluZXM7ICRpKyspIHsNCg0KCQkjIENoZWNrIGZvciBlcnJvcnMNCgkJaWYgKCRsaW5lc1skaV0gPX4gbS9eRVJST1IvKSB7DQoJCQlleGl0IDE7DQoJCX0NCg0KCQkjIEJsYWNrIGxpc3QNCgkJaWYgKCRsaW5lc1skaV0gPX4gbS9GaWxlIDEvKSB7DQoJCQluZXh0Ow0KCQl9DQoNCgkJbXkgQGNvbHVtbiA9IHNwbGl0KC9cfC8sICRsaW5lc1skaV0pOw0KCQlmb3IgKG15ICRqID0gMDsgJGogPD0gJCNjb2x1bW5fbmFtZXM7ICRqKyspIHsNCgkJCWlmICghIGRlZmluZWQoJGNvbHVtblskal0pKSB7DQoJCQkJJHJlc3VsdFskaWR4XS0+eyRjb2x1bW5fbmFtZXNbJGpdfSA9ICIiOw0KCQkJfQ0KCQkJZWxzZSB7DQoJCQkJJHJlc3VsdFskaWR4XS0+eyRjb2x1bW5fbmFtZXNbJGpdfSA9ICRjb2x1bW5bJGpdOw0KCQkJfQ0KCQl9DQoJCQ0KCQkkaWR4Kys7DQoJfQ0KCQ0KCXJldHVybiBAcmVzdWx0Ow0KfQ0KDQojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KIyBTVUIgcHJpbnRfbW9kdWxlZGF0YSAoJG1vZHVsZV9pdGVtLCAkbW9kdWxlX2RhdGEsIA0KIyAkbW9kdWxlX2Rlc2NyaXB0aW9uLCBAZGF0YSkNCiMgUHJpbnRzIGEgbW9kdWxlZGF0YSBYTUwgdGFnLiAkbW9kdWxlX2l0ZW0sICRtb2R1bGVfZGF0YSBhbmQNCiMgJG1vZHVsZV9kZXNjcmlwdGlvbiBhcmUgdXNlZCB0byBpbmRleCB0aGUgaXRlbSwgZGF0YSBhbmQgZGVzY3JpcHRpb24NCiMgWE1MIHRhZ3MgcmVzcGVjdGl2ZWx5Lg0KIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCnN1YiBwcmludF9tb2R1bGVkYXRhIHsNCglteSAkbW9kdWxlX2l0ZW0gPSAkX1swXTsNCglteSAkbW9kdWxlX2RhdGEgPSAkX1sxXTsNCglteSAkbW9kdWxlX2Rlc2NyaXB0aW9uID0gJF9bMl07DQoJbXkgQGRhdGEgPSBAeyRfWzNdfTsNCglteSAkcmVzdWx0Ow0KDQoJZm9yZWFjaCBteSAkZWxlbWVudCAoQGRhdGEpIHsNCgkJDQoJCSRyZXN1bHQgPSAnJzsNCg0KCQkjIEl0ZW0NCgkJaWYgKGRlZmluZWQoJGVsZW1lbnQtPnskbW9kdWxlX2l0ZW19KSkgew0KCQkJJHJlc3VsdCAuPSAkZWxlbWVudC0+eyRtb2R1bGVfaXRlbX0gLiAiOyI7DQoJCX0NCg0KCQkjIERhdGENCgkJaWYgKGRlZmluZWQoJGVsZW1lbnQtPnskbW9kdWxlX2RhdGF9KSkgew0KCQkJJHJlc3VsdCAuPSAkZWxlbWVudC0+eyRtb2R1bGVfZGF0YX0gLiAiIE1oejsiOw0KCQl9DQoNCgkJIyBEZXNjcmlwdGlvbg0KCQlpZiAoZGVmaW5lZCgkZWxlbWVudC0+eyRtb2R1bGVfZGVzY3JpcHRpb259KSkgew0KCQkJJHJlc3VsdCAuPSAkZWxlbWVudC0+eyRtb2R1bGVfZGVzY3JpcHRpb259IC4gIjsiOw0KCQl9DQoNCgkJcHJpbnQgJHJlc3VsdCAuICJcbiI7CQ0KCX0NCn0NCg0KIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCiMgTWFpbg0KIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCg0KbXkgQHJlc3VsdCA9IHJ1bl9xdWVyeSgiU0VMRUNUIE5hbWUsIE1heENsb2NrU3BlZWQsIERlc2NyaXB0aW9uIEZST00gV2luMzJfUHJvY2Vzc29yIik7DQpwcmludF9tb2R1bGVkYXRhICgiTmFtZSIsICJNYXhDbG9ja1NwZWVkIiwgIkRlc2NyaXB0aW9uIiwgXEByZXN1bHQpOw0KZXhpdCAwOw0K',0),(3,1,'RAM','Memory modules','','Model;Size','',0),(4,9,'RAM','Memory modules','/usr/bin/perl','Slot;Size;Speed','IyEvdXNyL2Jpbi9wZXJsCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMgcGFuZG9yYV9yYW0ucGwKIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIyBDb3B5cmlnaHQgKGMpIDIwMDggUmFtb24gTm92b2EsIHJub3ZvYUBhcnRpY2EuZXMKIyAgICAgICAgICAgKGMpIDIwMDggQXJ0aWNhIFNvbHVjaW9uZXMgVGVjbm9sb2dpY2FzIFMuTAojCiMgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgojIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCiMgYXMgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IHZlcnNpb24gMi4KIwojIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAojIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCiMgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQojIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCiMgWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UKIyBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90LCB3cml0ZSB0byB0aGUgRnJlZSBTb2Z0d2FyZQojIEZvdW5kYXRpb24sIEluYy4sIDUxIEZyYW5rbGluIFN0cmVldCwgRmlmdGggRmxvb3IsIEJvc3RvbiwgTUEgIDAyMTEwLTEzMDEsIFVTQS4KIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKCnVzZSBzdHJpY3Q7CnVzZSB3YXJuaW5nczsKCnVzZSBGaWxlOjpCYXNlbmFtZTsKdXNlIEhUTUw6OkVudGl0aWVzICgpOwoKIyBDaGVjayBmb3Igd21pYwpteSAkd21pX2NsaWVudCA9ICJ3bWljIjsKaWYgKHN5c3RlbSgiJHdtaV9jbGllbnQgPiAvZGV2L251bGwgMj4mMSIpICE9IDI1NikgewoJcHJpbnQgIltlcnJvcl0gJHdtaV9jbGllbnQgbm90IGZvdW5kLlxuIjsKCWV4aXQgMTsKfQoKaWYgKCQjQVJHViAhPSAyKSB7CglwcmludCAiVXNhZ2U6ICQwIDx0YXJnZXQgaXA+IDx1c2VybmFtZT4gPHBhc3N3b3JkPlxuIjsKCWV4aXQgMTsKfQoKbXkgJHRhcmdldF9pcCA9ICRBUkdWWzBdOwpteSAkdXNlcm5hbWUgPSAkQVJHVlsxXTsKbXkgJHBhc3N3b3JkID0gJEFSR1ZbMl07CgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwojIFNVQiBydW5fcXVlcnkgKCR3cWxfcXVlcnkpCiMgUnVucyB0aGUgZ2l2ZW4gV1FMIHF1ZXJ5IGFuZCByZXR1cm5zIHRoZSByZXN1bHQgYXMgYW4gYXJyYXkgb2YgaGFzaGVzLgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwpzdWIgcnVuX3F1ZXJ5IHsKCW15ICR3cWxfcXVlcnkgPSAkX1swXTsKCW15IEByZXN1bHQgPSB7fTsKCgkkd3FsX3F1ZXJ5ID1+ICdzLyIvXCcvZyc7CgoJIyBSdW4gdGhlIERDT00vV01JIGNsaWVudAoJbXkgJG91dHB1dCA9IGAkd21pX2NsaWVudCAtVSAnJHVzZXJuYW1lJyUnJHBhc3N3b3JkJyAvLyR0YXJnZXRfaXAgXCIkd3FsX3F1ZXJ5XCIgMj4vZGV2L251bGxgOwoKCW15IEBsaW5lcyA9IHNwbGl0KC9cbi8sICRvdXRwdXQpOwoJIyBIZWFkZXIsIGRlc2NyaXB0aW9uLCByZXN1bHRzCglpZiAoJCNsaW5lcyA8IDIpIHsKCQlleGl0IDE7Cgl9CgoJIyBEcm9wIHRoZSBoZWFkZXIKCXNoaWZ0IChAbGluZXMpOwoJCgkjIEdldCBjb2x1bW4gbmFtZXMKCW15IEBjb2x1bW5fbmFtZXMgPSBzcGxpdCgvXHwvLCBzaGlmdCAoQGxpbmVzKSk7CgoJIyBHZXQgcm93IGRhdGEKCW15ICRpZHggPSAwOwoJZm9yIChteSAkaSA9IDA7ICRpIDw9ICQjbGluZXM7ICRpKyspIHsKCgkJIyBDaGVjayBmb3IgZXJyb3JzCgkJaWYgKCRsaW5lc1skaV0gPX4gbS9eRVJST1IvKSB7CgkJCWV4aXQgMTsKCQl9CgoJCSMgQmxhY2sgbGlzdAoJCWlmICgkbGluZXNbJGldID1+IG0vRmlsZSAxLykgewoJCQluZXh0OwoJCX0KCgkJbXkgQGNvbHVtbiA9IHNwbGl0KC9cfC8sICRsaW5lc1skaV0pOwoJCWZvciAobXkgJGogPSAwOyAkaiA8PSAkI2NvbHVtbl9uYW1lczsgJGorKykgewoJCQlpZiAoISBkZWZpbmVkKCRjb2x1bW5bJGpdKSkgewoJCQkJJHJlc3VsdFskaWR4XS0+eyRjb2x1bW5fbmFtZXNbJGpdfSA9ICIiOwoJCQl9CgkJCWVsc2UgewoJCQkJJHJlc3VsdFskaWR4XS0+eyRjb2x1bW5fbmFtZXNbJGpdfSA9ICRjb2x1bW5bJGpdOwoJCQl9CgkJfQoJCQoJCSRpZHgrKzsKCX0KCQoJcmV0dXJuIEByZXN1bHQ7Cn0KCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMgU1VCIHByaW50X21vZHVsZWRhdGEgKCRtb2R1bGVfaXRlbSwgJG1vZHVsZV9kYXRhLCAKIyAkbW9kdWxlX2Rlc2NyaXB0aW9uLCBAZGF0YSkKIyBQcmludHMgYSBtb2R1bGVkYXRhIFhNTCB0YWcuICRtb2R1bGVfaXRlbSwgJG1vZHVsZV9kYXRhIGFuZAojICRtb2R1bGVfZGVzY3JpcHRpb24gYXJlIHVzZWQgdG8gaW5kZXggdGhlIGl0ZW0sIGRhdGEgYW5kIGRlc2NyaXB0aW9uCiMgWE1MIHRhZ3MgcmVzcGVjdGl2ZWx5LgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwpzdWIgcHJpbnRfbW9kdWxlZGF0YSB7CglteSAkbW9kdWxlX2l0ZW0gPSAkX1swXTsKCW15ICRtb2R1bGVfZGF0YSA9ICRfWzFdOwoJbXkgJG1vZHVsZV9kZXNjcmlwdGlvbiA9ICRfWzJdOwoJbXkgQGRhdGEgPSBAeyRfWzNdfTsKCW15ICRyZXN1bHQ7CgoJZm9yZWFjaCBteSAkZWxlbWVudCAoQGRhdGEpIHsKCQkKCQkkcmVzdWx0ID0gJyc7CgoJCSMgSXRlbQoJCWlmIChkZWZpbmVkKCRlbGVtZW50LT57JG1vZHVsZV9pdGVtfSkpIHsKCQkJJHJlc3VsdCAuPSAkZWxlbWVudC0+eyRtb2R1bGVfaXRlbX0gLiAnOyc7CgkJfQoKCQkjIERhdGEKCQlpZiAoZGVmaW5lZCgkZWxlbWVudC0+eyRtb2R1bGVfZGF0YX0pKSB7CgkJCSRyZXN1bHQgLj0gJyAnIC4gc3ByaW50ZigiJS4xZiIsICRlbGVtZW50LT57JG1vZHVsZV9kYXRhfSAvIDEwNDg1NzYpIC4gIiBNQnl0ZXM7IjsKCQl9CgoJCSMgRGVzY3JpcHRpb24KCQlpZiAoZGVmaW5lZCgkZWxlbWVudC0+eyRtb2R1bGVfZGVzY3JpcHRpb259KSkgewoJCQkkcmVzdWx0IC49ICRlbGVtZW50LT57JG1vZHVsZV9kZXNjcmlwdGlvbn07CgkJfQoKCQlwcmludCAkcmVzdWx0IC4gIlxuIjsJCgl9Cn0KCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMgTWFpbgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwoKbXkgQHJlc3VsdCA9IHJ1bl9xdWVyeSgiU0VMRUNUIERldmljZUxvY2F0b3IsIENhcGFjaXR5LCBTcGVlZCBGUk9NIFdpbjMyX1BoeXNpY2FsTWVtb3J5Iik7CnByaW50X21vZHVsZWRhdGEgKCJEZXZpY2VMb2NhdG9yIiwgIkNhcGFjaXR5IiwgIlNwZWVkIiwgXEByZXN1bHQpOwpleGl0IDA7Cg==',0),(5,1,'Video','Video cards','','Controller;Model;Company','',0),(6,9,'Video','Video cards','/usr/bin/perl','Name;vRAM;ID','IyEvdXNyL2Jpbi9wZXJsCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMgcGFuZG9yYV92aWRlby5wbAojIyMj IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj IyMjIyMjIyMjIyMjIwojIENvcHlyaWdodCAoYykgMjAwOCBSYW1vbiBOb3ZvYSwgcm5vdm9hQGFy dGljYS5lcwojICAgICAgICAgICAoYykgMjAwOCBBcnRpY2EgU29sdWNpb25lcyBUZWNub2xvZ2lj YXMgUy5MCiMKIyBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3Ry aWJ1dGUgaXQgYW5kL29yCiMgbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdl bmVyYWwgUHVibGljIExpY2Vuc2UKIyBhcyBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUg Rm91bmRhdGlvbjsgdmVyc2lvbiAyLgojCiMgVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGlu IHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCiMgYnV0IFdJVEhPVVQgQU5ZIFdBUlJB TlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKIyBNRVJDSEFOVEFCSUxJ VFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlCiMgR05VIEdl bmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KIyBZb3Ugc2hvdWxkIGhhdmUg cmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQojIGFsb25n IHdpdGggdGhpcyBwcm9ncmFtOyBpZiBub3QsIHdyaXRlIHRvIHRoZSBGcmVlIFNvZnR3YXJlCiMg Rm91bmRhdGlvbiwgSW5jLiwgNTEgRnJhbmtsaW4gU3RyZWV0LCBGaWZ0aCBGbG9vciwgQm9zdG9u LCBNQSAgMDIxMTAtMTMwMSwgVVNBLgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwoKdXNlIHN0cmljdDsKdXNl IHdhcm5pbmdzOwoKdXNlIEZpbGU6OkJhc2VuYW1lOwp1c2UgSFRNTDo6RW50aXRpZXMgKCk7Cgoj IENoZWNrIGZvciB3bWljCm15ICR3bWlfY2xpZW50ID0gIndtaWMiOwppZiAoc3lzdGVtKCIkd21p X2NsaWVudCA+IC9kZXYvbnVsbCAyPiYxIikgIT0gMjU2KSB7CglwcmludCAiW2Vycm9yXSAkd21p X2NsaWVudCBub3QgZm91bmQuXG4iOwoJZXhpdCAxOwp9CgppZiAoJCNBUkdWICE9IDIpIHsKCXBy aW50ICJVc2FnZTogJDAgPHRhcmdldCBpcD4gPHVzZXJuYW1lPiA8cGFzc3dvcmQ+XG4iOwoJZXhp dCAxOwp9CgpteSAkdGFyZ2V0X2lwID0gJEFSR1ZbMF07Cm15ICR1c2VybmFtZSA9ICRBUkdWWzFd OwpteSAkcGFzc3dvcmQgPSAkQVJHVlsyXTsKCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMgU1VCIHJ1bl9x dWVyeSAoJHdxbF9xdWVyeSkKIyBSdW5zIHRoZSBnaXZlbiBXUUwgcXVlcnkgYW5kIHJldHVybnMg dGhlIHJlc3VsdCBhcyBhbiBhcnJheSBvZiBoYXNoZXMuCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCnN1YiBy dW5fcXVlcnkgewoJbXkgJHdxbF9xdWVyeSA9ICRfWzBdOwoJbXkgQHJlc3VsdCA9IHt9OwoKCSR3 cWxfcXVlcnkgPX4gJ3MvIi9cJy9nJzsKCgkjIFJ1biB0aGUgRENPTS9XTUkgY2xpZW50CglteSAk b3V0cHV0ID0gYCR3bWlfY2xpZW50IC1VICckdXNlcm5hbWUnJSckcGFzc3dvcmQnIC8vJHRhcmdl dF9pcCBcIiR3cWxfcXVlcnlcIiAyPi9kZXYvbnVsbGA7CgoJbXkgQGxpbmVzID0gc3BsaXQoL1xu LywgJG91dHB1dCk7CgkjIEhlYWRlciwgZGVzY3JpcHRpb24sIHJlc3VsdHMKCWlmICgkI2xpbmVz IDwgMikgewoJCWV4aXQgMTsKCX0KCgkjIERyb3AgdGhlIGhlYWRlcgoJc2hpZnQgKEBsaW5lcyk7 CgkKCSMgR2V0IGNvbHVtbiBuYW1lcwoJbXkgQGNvbHVtbl9uYW1lcyA9IHNwbGl0KC9cfC8sIHNo aWZ0IChAbGluZXMpKTsKCgkjIEdldCByb3cgZGF0YQoJbXkgJGlkeCA9IDA7Cglmb3IgKG15ICRp ID0gMDsgJGkgPD0gJCNsaW5lczsgJGkrKykgewoKCQkjIENoZWNrIGZvciBlcnJvcnMKCQlpZiAo JGxpbmVzWyRpXSA9fiBtL15FUlJPUi8pIHsKCQkJZXhpdCAxOwoJCX0KCgkJIyBCbGFjayBsaXN0 CgkJaWYgKCRsaW5lc1skaV0gPX4gbS9GaWxlIDEvKSB7CgkJCW5leHQ7CgkJfQoKCQlteSBAY29s dW1uID0gc3BsaXQoL1x8LywgJGxpbmVzWyRpXSk7CgkJZm9yIChteSAkaiA9IDA7ICRqIDw9ICQj Y29sdW1uX25hbWVzOyAkaisrKSB7CgkJCWlmICghIGRlZmluZWQoJGNvbHVtblskal0pKSB7CgkJ CQkkcmVzdWx0WyRpZHhdLT57JGNvbHVtbl9uYW1lc1skal19ID0gIiI7CgkJCX0KCQkJZWxzZSB7 CgkJCQkkcmVzdWx0WyRpZHhdLT57JGNvbHVtbl9uYW1lc1skal19ID0gJGNvbHVtblskal07CgkJ CX0KCQl9CgkJCgkJJGlkeCsrOwoJfQoJCglyZXR1cm4gQHJlc3VsdDsKfQoKIyMjIyMjIyMjIyMj IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj IyMjIyMKIyBTVUIgcHJpbnRfbW9kdWxlZGF0YSAoJG1vZHVsZV9pdGVtLCAkbW9kdWxlX2RhdGEs IAojICRtb2R1bGVfZGVzY3JpcHRpb24sIEBkYXRhKQojIFByaW50cyBhIG1vZHVsZWRhdGEgWE1M IHRhZy4gJG1vZHVsZV9pdGVtLCAkbW9kdWxlX2RhdGEgYW5kCiMgJG1vZHVsZV9kZXNjcmlwdGlv biBhcmUgdXNlZCB0byBpbmRleCB0aGUgaXRlbSwgZGF0YSBhbmQgZGVzY3JpcHRpb24KIyBYTUwg dGFncyByZXNwZWN0aXZlbHkuCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCnN1YiBwcmludF9tb2R1bGVkYXRh IHsKCW15ICRtb2R1bGVfaXRlbSA9ICRfWzBdOwoJbXkgJG1vZHVsZV9kYXRhID0gJF9bMV07Cglt eSAkbW9kdWxlX2Rlc2NyaXB0aW9uID0gJF9bMl07CglteSBAZGF0YSA9IEB7JF9bM119OwoJbXkg JHJlc3VsdDsKCglmb3JlYWNoIG15ICRlbGVtZW50IChAZGF0YSkgewoJCQoJCSRyZXN1bHQgPSAn JzsKCgkJIyBJdGVtCgkJaWYgKGRlZmluZWQoJGVsZW1lbnQtPnskbW9kdWxlX2l0ZW19KSkgewoJ CQkkcmVzdWx0IC49ICRlbGVtZW50LT57JG1vZHVsZV9pdGVtfSAuICc7JzsKCQl9CgoJCSMgRGF0 YQoJCWlmIChkZWZpbmVkKCRlbGVtZW50LT57JG1vZHVsZV9kYXRhfSkpIHsKCQkJJHJlc3VsdCAu PSAnICcgLiBzcHJpbnRmKCIlLjFmIiwgJGVsZW1lbnQtPnskbW9kdWxlX2RhdGF9IC8gMTA0ODU3 NikgLiAiIE1CeXRlczsiOwoJCX0KCgkJIyBEZXNjcmlwdGlvbgoJCWlmIChkZWZpbmVkKCRlbGVt ZW50LT57JG1vZHVsZV9kZXNjcmlwdGlvbn0pKSB7CgkJCSRyZXN1bHQgLj0gJyAnIC4gJGVsZW1l bnQtPnskbW9kdWxlX2Rlc2NyaXB0aW9ufTsKCQl9CgoJCXByaW50ICRyZXN1bHQgLiAiXG4iOwkK CX0KfQoKIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIyBNYWluCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCgpteSBAcmVz dWx0ID0gcnVuX3F1ZXJ5KCJTRUxFQ1QgQ2FwdGlvbiwgQWRhcHRlclJBTSwgVmlkZW9Qcm9jZXNz b3IgRlJPTSBXaW4zMl9WaWRlb0NvbnRyb2xsZXIiKTsKcHJpbnRfbW9kdWxlZGF0YSAoIkNhcHRp b24iLCAiQWRhcHRlclJBTSIsICJWaWRlb1Byb2Nlc3NvciIsIFxAcmVzdWx0KTsKZXhpdCAwOwo=',0),(7,1,'NIC','Network Interface Cards','','Device;Model;Company;MACAddress','',0),(8,9,'NIC','Network Interface Cards','/usr/bin/perl','Caption;MACAddress;IPAddress','IyEvdXNyL2Jpbi9wZXJsCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMgcGFuZG9yYV9uaWMucGwKIyMjIyMj IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj IyMjIyMjIyMjIyMKIyBDb3B5cmlnaHQgKGMpIDIwMDggUmFtb24gTm92b2EsIHJub3ZvYUBhcnRp Y2EuZXMKIyAgICAgICAgICAgKGMpIDIwMDggQXJ0aWNhIFNvbHVjaW9uZXMgVGVjbm9sb2dpY2Fz IFMuTAojCiMgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmli dXRlIGl0IGFuZC9vcgojIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5l cmFsIFB1YmxpYyBMaWNlbnNlCiMgYXMgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZv dW5kYXRpb247IHZlcnNpb24gMi4KIwojIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0 aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAojIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5U WTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCiMgTUVSQ0hBTlRBQklMSVRZ IG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQojIEdOVSBHZW5l cmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCiMgWW91IHNob3VsZCBoYXZlIHJl Y2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UKIyBhbG9uZyB3 aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90LCB3cml0ZSB0byB0aGUgRnJlZSBTb2Z0d2FyZQojIEZv dW5kYXRpb24sIEluYy4sIDUxIEZyYW5rbGluIFN0cmVldCwgRmlmdGggRmxvb3IsIEJvc3Rvbiwg TUEgIDAyMTEwLTEzMDEsIFVTQS4KIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKCnVzZSBzdHJpY3Q7CnVzZSB3 YXJuaW5nczsKCnVzZSBGaWxlOjpCYXNlbmFtZTsKdXNlIEhUTUw6OkVudGl0aWVzICgpOwoKIyBD aGVjayBmb3Igd21pYwpteSAkd21pX2NsaWVudCA9ICJ3bWljIjsKaWYgKHN5c3RlbSgiJHdtaV9j bGllbnQgPiAvZGV2L251bGwgMj4mMSIpICE9IDI1NikgewoJcHJpbnQgIltlcnJvcl0gJHdtaV9j bGllbnQgbm90IGZvdW5kLlxuIjsKCWV4aXQgMTsKfQoKaWYgKCQjQVJHViAhPSAyKSB7Cglwcmlu dCAiVXNhZ2U6ICQwIDx0YXJnZXQgaXA+IDx1c2VybmFtZT4gPHBhc3N3b3JkPlxuIjsKCWV4aXQg MTsKfQoKbXkgJHRhcmdldF9pcCA9ICRBUkdWWzBdOwpteSAkdXNlcm5hbWUgPSAkQVJHVlsxXTsK bXkgJHBhc3N3b3JkID0gJEFSR1ZbMl07CgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwojIFNVQiBydW5fcXVl cnkgKCR3cWxfcXVlcnkpCiMgUnVucyB0aGUgZ2l2ZW4gV1FMIHF1ZXJ5IGFuZCByZXR1cm5zIHRo ZSByZXN1bHQgYXMgYW4gYXJyYXkgb2YgaGFzaGVzLgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwpzdWIgcnVu X3F1ZXJ5IHsKCW15ICR3cWxfcXVlcnkgPSAkX1swXTsKCW15IEByZXN1bHQgPSB7fTsKCgkkd3Fs X3F1ZXJ5ID1+ICdzLyIvXCcvZyc7CgoJIyBSdW4gdGhlIERDT00vV01JIGNsaWVudAoJbXkgJG91 dHB1dCA9IGAkd21pX2NsaWVudCAtVSAnJHVzZXJuYW1lJyUnJHBhc3N3b3JkJyAvLyR0YXJnZXRf aXAgXCIkd3FsX3F1ZXJ5XCIgMj4vZGV2L251bGxgOwoKCW15IEBsaW5lcyA9IHNwbGl0KC9cbi8s ICRvdXRwdXQpOwoJIyBIZWFkZXIsIGRlc2NyaXB0aW9uLCByZXN1bHRzCglpZiAoJCNsaW5lcyA8 IDIpIHsKCQlleGl0IDE7Cgl9CgoJIyBEcm9wIHRoZSBoZWFkZXIKCXNoaWZ0IChAbGluZXMpOwoJ CgkjIEdldCBjb2x1bW4gbmFtZXMKCW15IEBjb2x1bW5fbmFtZXMgPSBzcGxpdCgvXHwvLCBzaGlm dCAoQGxpbmVzKSk7CgoJIyBHZXQgcm93IGRhdGEKCW15ICRpZHggPSAwOwoJZm9yIChteSAkaSA9 IDA7ICRpIDw9ICQjbGluZXM7ICRpKyspIHsKCgkJIyBDaGVjayBmb3IgZXJyb3JzCgkJaWYgKCRs aW5lc1skaV0gPX4gbS9eRVJST1IvKSB7CgkJCWV4aXQgMTsKCQl9CgoJCSMgQmxhY2sgbGlzdAoJ CWlmICgkbGluZXNbJGldID1+IG0vRmlsZSAxLykgewoJCQluZXh0OwoJCX0KCgkJbXkgQGNvbHVt biA9IHNwbGl0KC9cfC8sICRsaW5lc1skaV0pOwoJCWZvciAobXkgJGogPSAwOyAkaiA8PSAkI2Nv bHVtbl9uYW1lczsgJGorKykgewoJCQlpZiAoISBkZWZpbmVkKCRjb2x1bW5bJGpdKSkgewoJCQkJ JHJlc3VsdFskaWR4XS0+eyRjb2x1bW5fbmFtZXNbJGpdfSA9ICIiOwoJCQl9CgkJCWVsc2UgewoJ CQkJJHJlc3VsdFskaWR4XS0+eyRjb2x1bW5fbmFtZXNbJGpdfSA9ICRjb2x1bW5bJGpdOwoJCQl9 CgkJfQoJCQoJCSRpZHgrKzsKCX0KCQoJcmV0dXJuIEByZXN1bHQ7Cn0KCiMjIyMjIyMjIyMjIyMj IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj IyMjCiMgU1VCIHByaW50X21vZHVsZWRhdGEgKCRtb2R1bGVfaXRlbSwgJG1vZHVsZV9kYXRhLCAK IyAkbW9kdWxlX2Rlc2NyaXB0aW9uLCBAZGF0YSkKIyBQcmludHMgYSBtb2R1bGVkYXRhIFhNTCB0 YWcuICRtb2R1bGVfaXRlbSwgJG1vZHVsZV9kYXRhIGFuZAojICRtb2R1bGVfZGVzY3JpcHRpb24g YXJlIHVzZWQgdG8gaW5kZXggdGhlIGl0ZW0sIGRhdGEgYW5kIGRlc2NyaXB0aW9uCiMgWE1MIHRh Z3MgcmVzcGVjdGl2ZWx5LgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwpzdWIgcHJpbnRfbW9kdWxlZGF0YSB7 CglteSAkbW9kdWxlX2l0ZW0gPSAkX1swXTsKCW15ICRtb2R1bGVfZGF0YSA9ICRfWzFdOwoJbXkg JG1vZHVsZV9kZXNjcmlwdGlvbiA9ICRfWzJdOwoJbXkgQGRhdGEgPSBAeyRfWzNdfTsKCW15ICRy ZXN1bHQ7CgoJZm9yZWFjaCBteSAkZWxlbWVudCAoQGRhdGEpIHsKCQkKCQkkcmVzdWx0ID0gJyc7 CgoJCSMgSXRlbQoJCWlmIChkZWZpbmVkKCRlbGVtZW50LT57JG1vZHVsZV9pdGVtfSkpIHsKCQkJ JHJlc3VsdCAuPSAkZWxlbWVudC0+eyRtb2R1bGVfaXRlbX0gLiAnOyc7CgkJfQoKCQkjIERhdGEK CQlpZiAoZGVmaW5lZCgkZWxlbWVudC0+eyRtb2R1bGVfZGF0YX0pKSB7CgkJCSRyZXN1bHQgLj0g JGVsZW1lbnQtPnskbW9kdWxlX2RhdGF9IC4gJzsnOwoJCX0KCgkJIyBEZXNjcmlwdGlvbgoJCWlm IChkZWZpbmVkKCRlbGVtZW50LT57JG1vZHVsZV9kZXNjcmlwdGlvbn0pKSB7CgkJCSRyZXN1bHQg Lj0gJGVsZW1lbnQtPnskbW9kdWxlX2Rlc2NyaXB0aW9ufTsKCQl9CgoJCXByaW50ICRyZXN1bHQg LiAiXG4iOwkKCX0KfQoKIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIyBNYWluCiMjIyMjIyMjIyMjIyMjIyMj IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj CgpteSBAcmVzdWx0ID0gcnVuX3F1ZXJ5KCJTRUxFQ1QgQ2FwdGlvbiwgTUFDQWRkcmVzcywgSVBB ZGRyZXNzIEZST00gV2luMzJfTmV0d29ya0FkYXB0ZXJDb25maWd1cmF0aW9uIik7CnByaW50X21v ZHVsZWRhdGEgKCJDYXB0aW9uIiwgIk1BQ0FkZHJlc3MiLCAiSVBBZGRyZXNzIiwgXEByZXN1bHQp OwpleGl0IDA7Cg==',0),(9,1,'HD','Hard drives','','Type;Model;Size','',0),(10,9,'HD','Hard drives','/usr/bin/perl','Model;Size;ID','IyEvdXNyL2Jpbi9wZXJsCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMgcGFuZG9yYV9oZC5wbAojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwojIENvcHlyaWdodCAoYykgMjAwOCBSYW1vbiBOb3ZvYSwgcm5vdm9hQGFydGljYS5lcwojICAgICAgICAgICAoYykgMjAwOCBBcnRpY2EgU29sdWNpb25lcyBUZWNub2xvZ2ljYXMgUy5MCiMKIyBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yCiMgbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UKIyBhcyBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgdmVyc2lvbiAyLgojCiMgVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCiMgYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKIyBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlCiMgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KIyBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQojIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtOyBpZiBub3QsIHdyaXRlIHRvIHRoZSBGcmVlIFNvZnR3YXJlCiMgRm91bmRhdGlvbiwgSW5jLiwgNTEgRnJhbmtsaW4gU3RyZWV0LCBGaWZ0aCBGbG9vciwgQm9zdG9uLCBNQSAgMDIxMTAtMTMwMSwgVVNBLgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwoKdXNlIHN0cmljdDsKdXNlIHdhcm5pbmdzOwoKdXNlIEZpbGU6OkJhc2VuYW1lOwp1c2UgSFRNTDo6RW50aXRpZXMgKCk7CgojIENoZWNrIGZvciB3bWljCm15ICR3bWlfY2xpZW50ID0gIndtaWMiOwppZiAoc3lzdGVtKCIkd21pX2NsaWVudCA+IC9kZXYvbnVsbCAyPiYxIikgIT0gMjU2KSB7CiAgICAgICAgcHJpbnQgIltlcnJvcl0gJHdtaV9jbGllbnQgbm90IGZvdW5kLlxuIjsKICAgICAgICBleGl0IDE7Cn0KCmlmICgkI0FSR1YgIT0gMikgewogICAgICAgIHByaW50ICJVc2FnZTogJDAgPHRhcmdldCBpcD4gPHVzZXJuYW1lPiA8cGFzc3dvcmQ+XG4iOwogICAgICAgIGV4aXQgMTsKfQoKbXkgJHRhcmdldF9pcCA9ICRBUkdWWzBdOwpteSAkdXNlcm5hbWUgPSAkQVJHVlsxXTsKbXkgJHBhc3N3b3JkID0gJEFSR1ZbMl07CgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwojIFNVQiBydW5fcXVlcnkgKCR3cWxfcXVlcnkpCiMgUnVucyB0aGUgZ2l2ZW4gV1FMIHF1ZXJ5IGFuZCByZXR1cm5zIHRoZSByZXN1bHQgYXMgYW4gYXJyYXkgb2YgaGFzaGVzLgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwpzdWIgcnVuX3F1ZXJ5IHsKICAgICAgICBteSAkd3FsX3F1ZXJ5ID0gJF9bMF07CiAgICAgICAgbXkgQHJlc3VsdCA9IHt9OwogICAgICAgICR3cWxfcXVlcnkgPX4gJ3MvIi9cJy9nJzsKCiAgICAgICAgIyBSdW4gdGhlIERDT00vV01JIGNsaWVudAogICAgICAgIG15ICRvdXRwdXQgPSBgJHdtaV9jbGllbnQgLVUgJyR1c2VybmFtZSclJyRwYXNzd29yZCcgLy8kdGFyZ2V0X2lwIFwiJHdxbF9xdWVyeVwiIDI+L2Rldi9udWxsYDsKCiAgICAgICAgbXkgQGxpbmVzID0gc3BsaXQoL1xuLywgJG91dHB1dCk7CiAgICAgICAgIyBIZWFkZXIsIGRlc2NyaXB0aW9uLCByZXN1bHRzCiAgICAgICAgaWYgKCQjbGluZXMgPCAyKSB7CiAgICAgICAgICAgICAgICBleGl0IDE7CiAgICAgICAgfQoKICAgICAgICAjIERyb3AgdGhlIGhlYWRlcgogICAgICAgIHNoaWZ0IChAbGluZXMpOwoKICAgICAgICAjIEdldCBjb2x1bW4gbmFtZXMKICAgICAgICBteSBAY29sdW1uX25hbWVzID0gc3BsaXQoL1x8Lywgc2hpZnQgKEBsaW5lcykpOwoKICAgICAgICAjIEdldCByb3cgZGF0YQogICAgICAgIG15ICRpZHggPSAwOwogICAgICAgIGZvciAobXkgJGkgPSAwOyAkaSA8PSAkI2xpbmVzOyAkaSsrKSB7CgogICAgICAgICAgICAgICAgIyBDaGVjayBmb3IgZXJyb3JzCiAgICAgICAgICAgICAgICBpZiAoJGxpbmVzWyRpXSA9fiBtL15FUlJPUi8pIHsKICAgICAgICAgICAgICAgICAgICAgICAgZXhpdCAxOwogICAgICAgICAgICAgICAgfQoKICAgICAgICAgICAgICAgICMgQmxhY2sgbGlzdAogICAgICAgICAgICAgICAgaWYgKCRsaW5lc1skaV0gPX4gbS9GaWxlIDEvKSB7CiAgICAgICAgICAgICAgICAgICAgICAgIG5leHQ7CiAgICAgICAgICAgICAgICB9CgogICAgICAgICAgICAgICAgbXkgQGNvbHVtbiA9IHNwbGl0KC9cfC8sICRsaW5lc1skaV0pOwogICAgICAgICAgICAgICAgZm9yIChteSAkaiA9IDA7ICRqIDw9ICQjY29sdW1uX25hbWVzOyAkaisrKSB7CiAgICAgICAgICAgICAgICAgICAgICAgIGlmICghIGRlZmluZWQoJGNvbHVtblskal0pKSB7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJHJlc3VsdFskaWR4XS0+eyRjb2x1bW5fbmFtZXNbJGpdfSA9ICIiOwogICAgICAgICAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgICAgICAgICAgICAgIGVsc2UgewogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICRyZXN1bHRbJGlkeF0tPnskY29sdW1uX25hbWVzWyRqXX0gPSAkY29sdW1uWyRqXTsKICAgICAgICAgICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgICAgfQoKICAgICAgICAgICAgICAgICRpZHgrKzsKICAgICAgICB9CgogICAgICAgIHJldHVybiBAcmVzdWx0Owp9CgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwojIFNVQiBwcmludF9tb2R1bGVkYXRhICgkbW9kdWxlX2l0ZW0sICRtb2R1bGVfZGF0YSwKIyAkbW9kdWxlX2Rlc2NyaXB0aW9uLCBAZGF0YSkKIyBQcmludHMgYSBtb2R1bGVkYXRhIFhNTCB0YWcuICRtb2R1bGVfaXRlbSwgJG1vZHVsZV9kYXRhIGFuZAojICRtb2R1bGVfZGVzY3JpcHRpb24gYXJlIHVzZWQgdG8gaW5kZXggdGhlIGl0ZW0sIGRhdGEgYW5kIGRlc2NyaXB0aW9uCiMgWE1MIHRhZ3MgcmVzcGVjdGl2ZWx5LgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwpzdWIgcHJpbnRfbW9kdWxlZGF0YSB7CiAgICAgICAgbXkgJG1vZHVsZV9pdGVtID0gJF9bMF07CiAgICAgICAgbXkgJG1vZHVsZV9kYXRhID0gJF9bMV07CiAgICAgICAgbXkgJG1vZHVsZV9kZXNjcmlwdGlvbiA9ICRfWzJdOwogICAgICAgIG15ICRtb2R1bGVfZXh0cmFfZGVzY3JpcHRpb24gPSAkX1szXTsKICAgICAgICBteSBAZGF0YSA9IEB7JF9bNF19OwogICAgICAgIG15ICRyZXN1bHQ7CgogICAgICAgIGZvcmVhY2ggbXkgJGVsZW1lbnQgKEBkYXRhKSB7CiAgICAgICAgICAgICAgICAkcmVzdWx0ID0gJyc7CgogICAgICAgICAgICAgICAgIyBJdGVtCiAgICAgICAgICAgICAgICBpZiAoZGVmaW5lZCgkZWxlbWVudC0+eyRtb2R1bGVfaXRlbX0pKSB7CiAgICAgICAgICAgICAgICAgICAgICAgICRyZXN1bHQgLj0gJGVsZW1lbnQtPnskbW9kdWxlX2l0ZW19IC4gJzsnOwogICAgICAgICAgICAgICAgfQoKICAgICAgICAgICAgICAgICMgRGF0YQogICAgICAgICAgICAgICAgaWYgKGRlZmluZWQoJGVsZW1lbnQtPnskbW9kdWxlX2RhdGF9KSkgewogICAgICAgICAgICAgICAgICAgICAgICAkcmVzdWx0IC49ICcgJyAuIHNwcmludGYoIiUuMWYiLCAkZWxlbWVudC0+eyRtb2R1bGVfZGF0YX0gLyAxMDczNzQxODI0KSAuICIgR0J5dGVzOyI7CiAgICAgICAgICAgICAgICB9CgogICAgICAgICAgICAgICAgIyBEZXNjcmlwdGlvbgogICAgICAgICAgICAgICAgaWYgKGRlZmluZWQoJGVsZW1lbnQtPnskbW9kdWxlX2Rlc2NyaXB0aW9ufSkpIHsKICAgICAgICAgICAgICAgICAgICAgICAgJHJlc3VsdCAuPSAgJGVsZW1lbnQtPnskbW9kdWxlX2Rlc2NyaXB0aW9ufTsKICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgICAgIGVsc2lmIChkZWZpbmVkKCRlbGVtZW50LT57JG1vZHVsZV9leHRyYV9kZXNjcmlwdGlvbn0pKXsKICAgICAgICAgICAgICAgICAgICAgICAgJHJlc3VsdCAuPSAgJGVsZW1lbnQtPnskbW9kdWxlX2V4dHJhX2Rlc2NyaXB0aW9ufTsKICAgICAgICAgICAgICAgIH0KCiAgICAgICAgICAgICAgICBwcmludCAkcmVzdWx0IC4gIlxuIjsKICAgICAgICB9Cn0KCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMgTWFpbgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwoKbXkgQHJlc3VsdCA9IHJ1bl9xdWVyeSgiU0VMRUNUICogRlJPTSBXaW4zMl9EaXNrRHJpdmUiKTsKcHJpbnRfbW9kdWxlZGF0YSAoIkNhcHRpb24iLCAiU2l6ZSIsICJTZXJpYWxOdW1iZXIiLCAiU2lnbmF0dXJlIiwgXEByZXN1bHQpOwpleGl0IDA7Cg==',0),(11,1,'CDROM','CD-ROM drives','','Type;Model;Features','',0),(12,9,'CDROM','CD-ROM drives','/usr/bin/perl','Name;Description;Drive;ID','IyEvdXNyL2Jpbi9wZXJsCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMgcGFuZG9yYV9jZHJvbS5wbAojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwojIENvcHlyaWdodCAoYykgMjAwOCBSYW1vbiBOb3ZvYSwgcm5vdm9hQGFydGljYS5lcwojICAgICAgICAgICAoYykgMjAwOCBBcnRpY2EgU29sdWNpb25lcyBUZWNub2xvZ2ljYXMgUy5MCiMKIyBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yCiMgbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UKIyBhcyBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgdmVyc2lvbiAyLgojCiMgVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCiMgYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKIyBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlCiMgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KIyBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQojIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtOyBpZiBub3QsIHdyaXRlIHRvIHRoZSBGcmVlIFNvZnR3YXJlCiMgRm91bmRhdGlvbiwgSW5jLiwgNTEgRnJhbmtsaW4gU3RyZWV0LCBGaWZ0aCBGbG9vciwgQm9zdG9uLCBNQSAgMDIxMTAtMTMwMSwgVVNBLgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwoKI3VzZSBzdHJpY3Q7CnVzZSB3YXJuaW5nczsKCnVzZSBGaWxlOjpCYXNlbmFtZTsKdXNlIEhUTUw6OkVudGl0aWVzICgpOwoKIyBDaGVjayBmb3Igd21pYwpteSAkd21pX2NsaWVudCA9ICJ3bWljIjsKaWYgKHN5c3RlbSgiJHdtaV9jbGllbnQgPiAvZGV2L251bGwgMj4mMSIpICE9IDI1NikgewogICAgICAgIHByaW50ICJbZXJyb3JdICR3bWlfY2xpZW50IG5vdCBmb3VuZC5cbiI7CiAgICAgICAgZXhpdCAxOwp9CgppZiAoJCNBUkdWICE9IDIpIHsKICAgICAgICBwcmludCAiVXNhZ2U6ICQwIDx0YXJnZXQgaXA+IDx1c2VybmFtZT4gPHBhc3N3b3JkPlxuIjsKICAgICAgICBleGl0IDE7Cn0KCm15ICR0YXJnZXRfaXAgPSAkQVJHVlswXTsKbXkgJHVzZXJuYW1lID0gJEFSR1ZbMV07Cm15ICRwYXNzd29yZCA9ICRBUkdWWzJdOwoKIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIyBTVUIgcnVuX3F1ZXJ5ICgkd3FsX3F1ZXJ5KQojIFJ1bnMgdGhlIGdpdmVuIFdRTCBxdWVyeSBhbmQgcmV0dXJucyB0aGUgcmVzdWx0IGFzIGFuIGFycmF5IG9mIGhhc2hlcy4KIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKc3ViIHJ1bl9xdWVyeSB7CiAgICAgICAgbXkgJHdxbF9xdWVyeSA9ICRfWzBdOwogICAgICAgIG15IEByZXN1bHQgPSB7fTsKCiAgICAgICAgJHdxbF9xdWVyeSA9fiAncy8iL1wnL2cnOwoKICAgICAgICAjIFJ1biB0aGUgRENPTS9XTUkgY2xpZW50CiAgICAgICAgbXkgJG91dHB1dCA9IGAkd21pX2NsaWVudCAtVSAnJHVzZXJuYW1lJyUnJHBhc3N3b3JkJyAvLyR0YXJnZXRfaXAgXCIkd3FsX3F1ZXJ5XCIgMj4vZGV2L251bGxgOwoKICAgICAgICBteSBAbGluZXMgPSBzcGxpdCgvXG4vLCAkb3V0cHV0KTsKICAgICAgICAjIEhlYWRlciwgZGVzY3JpcHRpb24sIHJlc3VsdHMKICAgICAgICBpZiAoJCNsaW5lcyA8IDIpIHsKICAgICAgICAgICAgICAgIGV4aXQgMTsKICAgICAgICB9CgogICAgICAgICMgRHJvcCB0aGUgaGVhZGVyCiAgICAgICAgc2hpZnQgKEBsaW5lcyk7CgogICAgICAgICMgR2V0IGNvbHVtbiBuYW1lcwogICAgICAgIG15IEBjb2x1bW5fbmFtZXMgPSBzcGxpdCgvXHwvLCBzaGlmdCAoQGxpbmVzKSk7CgogICAgICAgICMgR2V0IHJvdyBkYXRhCiAgICAgICAgbXkgJGlkeCA9IDA7CiAgICAgICAgZm9yIChteSAkaSA9IDA7ICRpIDw9ICQjbGluZXM7ICRpKyspIHsKCiAgICAgICAgICAgICAgICAjIENoZWNrIGZvciBlcnJvcnMKICAgICAgICAgICAgICAgIGlmICgkbGluZXNbJGldID1+IG0vXkVSUk9SLykgewogICAgICAgICAgICAgICAgICAgICAgICBleGl0IDE7CiAgICAgICAgICAgICAgICB9CgogICAgICAgICAgICAgICAgIyBCbGFjayBsaXN0CiAgICAgICAgICAgICAgICBpZiAoJGxpbmVzWyRpXSA9fiBtL0ZpbGUgMS8pIHsKICAgICAgICAgICAgICAgICAgICAgICAgbmV4dDsKICAgICAgICAgICAgICAgIH0KCiAgICAgICAgICAgICAgICBteSBAY29sdW1uID0gc3BsaXQoL1x8LywgJGxpbmVzWyRpXSk7CiAgICAgICAgICAgICAgICBmb3IgKG15ICRqID0gMDsgJGogPD0gJCNjb2x1bW5fbmFtZXM7ICRqKyspIHsKICAgICAgICAgICAgICAgICAgICAgICAgaWYgKCEgZGVmaW5lZCgkY29sdW1uWyRqXSkpIHsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAkcmVzdWx0WyRpZHhdLT57JGNvbHVtbl9uYW1lc1skal19ID0gIiI7CiAgICAgICAgICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgICAgICAgICAgICAgZWxzZSB7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJHJlc3VsdFskaWR4XS0+eyRjb2x1bW5fbmFtZXNbJGpdfSA9ICRjb2x1bW5bJGpdOwogICAgICAgICAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgICAgICB9CgogICAgICAgICAgICAgICAgJGlkeCsrOwogICAgICAgIH0KCiAgICAgICAgcmV0dXJuIEByZXN1bHQ7Cn0KCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMgU1VCIHByaW50X21vZHVsZWRhdGEgKCRtb2R1bGVfaXRlbSwgJG1vZHVsZV9kYXRhLAojICRtb2R1bGVfZGVzY3JpcHRpb24sIEBkYXRhKQojIFByaW50cyBhIG1vZHVsZWRhdGEgWE1MIHRhZy4gJG1vZHVsZV9pdGVtLCAkbW9kdWxlX2RhdGEgYW5kCiMgJG1vZHVsZV9kZXNjcmlwdGlvbiBhcmUgdXNlZCB0byBpbmRleCB0aGUgaXRlbSwgZGF0YSBhbmQgZGVzY3JpcHRpb24KIyBYTUwgdGFncyByZXNwZWN0aXZlbHkuCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCnN1YiBwcmludF9tb2R1bGVkYXRhIHsKICAgICAgICBteSBAbW9kdWxlX2hlYWRlcnMgPSBAeyRfWzBdfTsKICAgICAgICBteSBAZGF0YSA9IEB7JF9bMV19OwogICAgICAgIG15ICRyZXN1bHQ7CgogICAgICAgICRyZXN1bHQgPSAnJzsKfQoKIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIyBTVUIgcHJpbnRfbW9kdWxlZGF0YSAoJG1vZHVsZV9pdGVtLCAkbW9kdWxlX2RhdGEsCiMgJG1vZHVsZV9kZXNjcmlwdGlvbiwgQGRhdGEpCiMgUHJpbnRzIGEgbW9kdWxlZGF0YSBYTUwgdGFnLiAkbW9kdWxlX2l0ZW0sICRtb2R1bGVfZGF0YSBhbmQKIyAkbW9kdWxlX2Rlc2NyaXB0aW9uIGFyZSB1c2VkIHRvIGluZGV4IHRoZSBpdGVtLCBkYXRhIGFuZCBkZXNjcmlwdGlvbgojIFhNTCB0YWdzIHJlc3BlY3RpdmVseS4KIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKc3ViIHByaW50X21vZHVsZWRhdGEgewogICAgICAgIG15IEBtb2R1bGVfaGVhZGVycyA9IEB7JF9bMF19OwogICAgICAgIG15IEBkYXRhID0gQHskX1sxXX07CiAgICAgICAgbXkgJHJlc3VsdDsKCiAgICAgICAgZm9yZWFjaCBteSAkZWxlbWVudCAoQGRhdGEpIHsKICAgICAgICAgICAgICAgICRyZXN1bHQgPSAnJzsKICAgICAgICAgICAgICAgIGZvcmVhY2ggbXkgJG1oZWFkZXIgKEBtb2R1bGVfaGVhZGVycykgewogICAgICAgICAgICAgICAgICAgICAgICBpZiAoZGVmaW5lZCAoJGVsZW1lbnQtPnskbWhlYWRlcn0pKSB7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJHJlc3VsdCAuPSAkZWxlbWVudC0+eyRtaGVhZGVyfSAuICc7JzsKICAgICAgICAgICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgICAgICAgICAgICBlbHNlIHsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAkcmVzdWx0IC49ICc7JzsKICAgICAgICAgICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgICAgY2hvcCgkcmVzdWx0KTsKICAgICAgICAgICAgICAgIHByaW50ICRyZXN1bHQgLiAiXG4iOwogICAgICAgIH0KfQoKIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIyBNYWluCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCgpteSBAcmVzdWx0ICA9IHJ1bl9xdWVyeSgiU0VMRUNUICogRlJPTSBXaW4zMl9DRFJPTURyaXZlIik7Cm15IEBoZWFkZXJzID0gKCJOYW1lIiwgIkRlc2NyaXB0aW9uIiwgIkRyaXZlIiwgIkRldmljZUlkIik7CnByaW50X21vZHVsZWRhdGEgKFxAaGVhZGVycywgXEByZXN1bHQpOwpleGl0IDA7Cgo=',0),(13,1,'Software','Installed software packages','','Name;Version;Description','',0),(14,9,'Software','Installed software packages','/usr/bin/perl','Name;Version','IyEvdXNyL2Jpbi9wZXJsCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMgcGFuZG9yYV9zb2Z0d2FyZS5wbAojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwojIENvcHlyaWdodCAoYykgMjAwOCBSYW1vbiBOb3ZvYSwgcm5vdm9hQGFydGljYS5lcwojICAgICAgICAgICAoYykgMjAwOCBBcnRpY2EgU29sdWNpb25lcyBUZWNub2xvZ2ljYXMgUy5MCiMKIyBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yCiMgbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UKIyBhcyBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgdmVyc2lvbiAyLgojCiMgVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCiMgYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKIyBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlCiMgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KIyBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQojIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtOyBpZiBub3QsIHdyaXRlIHRvIHRoZSBGcmVlIFNvZnR3YXJlCiMgRm91bmRhdGlvbiwgSW5jLiwgNTEgRnJhbmtsaW4gU3RyZWV0LCBGaWZ0aCBGbG9vciwgQm9zdG9uLCBNQSAgMDIxMTAtMTMwMSwgVVNBLgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwoKdXNlIHN0cmljdDsKdXNlIHdhcm5pbmdzOwoKdXNlIEZpbGU6OkJhc2VuYW1lOwp1c2UgSFRNTDo6RW50aXRpZXMgKCk7CgojIENoZWNrIGZvciB3bWljCm15ICR3bWlfY2xpZW50ID0gIndtaWMiOwppZiAoc3lzdGVtKCIkd21pX2NsaWVudCA+IC9kZXYvbnVsbCAyPiYxIikgIT0gMjU2KSB7CglwcmludCAiW2Vycm9yXSAkd21pX2NsaWVudCBub3QgZm91bmQuXG4iOwoJZXhpdCAxOwp9CgppZiAoJCNBUkdWICE9IDIpIHsKCXByaW50ICJVc2FnZTogJDAgPHRhcmdldCBpcD4gPHVzZXJuYW1lPiA8cGFzc3dvcmQ+XG4iOwoJZXhpdCAxOwp9CgpteSAkdGFyZ2V0X2lwID0gJEFSR1ZbMF07Cm15ICR1c2VybmFtZSA9ICRBUkdWWzFdOwpteSAkcGFzc3dvcmQgPSAkQVJHVlsyXTsKCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMgU1VCIHJ1bl9xdWVyeSAoJHdxbF9xdWVyeSkKIyBSdW5zIHRoZSBnaXZlbiBXUUwgcXVlcnkgYW5kIHJldHVybnMgdGhlIHJlc3VsdCBhcyBhbiBhcnJheSBvZiBoYXNoZXMuCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCnN1YiBydW5fcXVlcnkgewoJbXkgJHdxbF9xdWVyeSA9ICRfWzBdOwoJbXkgQHJlc3VsdCA9IHt9OwoKCSR3cWxfcXVlcnkgPX4gJ3MvIi9cJy9nJzsKCgkjIFJ1biB0aGUgRENPTS9XTUkgY2xpZW50CglteSAkb3V0cHV0ID0gYCR3bWlfY2xpZW50IC1VICckdXNlcm5hbWUnJSckcGFzc3dvcmQnIC8vJHRhcmdldF9pcCBcIiR3cWxfcXVlcnlcIiAyPi9kZXYvbnVsbGA7CgoJbXkgQGxpbmVzID0gc3BsaXQoL1xuLywgJG91dHB1dCk7CgkjIEhlYWRlciwgZGVzY3JpcHRpb24sIHJlc3VsdHMKCWlmICgkI2xpbmVzIDwgMikgewoJCWV4aXQgMTsKCX0KCgkjIERyb3AgdGhlIGhlYWRlcgoJc2hpZnQgKEBsaW5lcyk7CgkKCSMgR2V0IGNvbHVtbiBuYW1lcwoJbXkgQGNvbHVtbl9uYW1lcyA9IHNwbGl0KC9cfC8sIHNoaWZ0IChAbGluZXMpKTsKCgkjIEdldCByb3cgZGF0YQoJbXkgJGlkeCA9IDA7Cglmb3IgKG15ICRpID0gMDsgJGkgPD0gJCNsaW5lczsgJGkrKykgewoKCQkjIENoZWNrIGZvciBlcnJvcnMKCQlpZiAoJGxpbmVzWyRpXSA9fiBtL15FUlJPUi8pIHsKCQkJZXhpdCAxOwoJCX0KCgkJIyBCbGFjayBsaXN0CgkJaWYgKCRsaW5lc1skaV0gPX4gbS9GaWxlIDEvKSB7CgkJCW5leHQ7CgkJfQoKCQlteSBAY29sdW1uID0gc3BsaXQoL1x8LywgJGxpbmVzWyRpXSk7CgkJZm9yIChteSAkaiA9IDA7ICRqIDw9ICQjY29sdW1uX25hbWVzOyAkaisrKSB7CgkJCWlmICghIGRlZmluZWQoJGNvbHVtblskal0pKSB7CgkJCQkkcmVzdWx0WyRpZHhdLT57JGNvbHVtbl9uYW1lc1skal19ID0gIiI7CgkJCX0KCQkJZWxzZSB7CgkJCQkkcmVzdWx0WyRpZHhdLT57JGNvbHVtbl9uYW1lc1skal19ID0gJGNvbHVtblskal07CgkJCX0KCQl9CgkJCgkJJGlkeCsrOwoJfQoJCglyZXR1cm4gQHJlc3VsdDsKfQoKCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMgU1VCIHByaW50X21vZHVsZWRhdGEgKCRtb2R1bGVfaXRlbSwgJG1vZHVsZV9kYXRhLAojICRtb2R1bGVfZGVzY3JpcHRpb24sIEBkYXRhKQojIFByaW50cyBhIG1vZHVsZWRhdGEgWE1MIHRhZy4gJG1vZHVsZV9pdGVtLCAkbW9kdWxlX2RhdGEgYW5kCiMgJG1vZHVsZV9kZXNjcmlwdGlvbiBhcmUgdXNlZCB0byBpbmRleCB0aGUgaXRlbSwgZGF0YSBhbmQgZGVzY3JpcHRpb24KIyBYTUwgdGFncyByZXNwZWN0aXZlbHkuCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCnN1YiBwcmludF9tb2R1bGVkYXRhIHsKICAgICAgICBteSAkbW9kdWxlX2l0ZW0gPSAkX1swXTsKICAgICAgICBteSAkbW9kdWxlX2RhdGEgPSAkX1sxXTsKICAgICAgICBteSBAZGF0YSA9IEB7JF9bMl19OwogICAgICAgIG15ICRyZXN1bHQ7CgogICAgICAgIGZvcmVhY2ggbXkgJGVsZW1lbnQgKEBkYXRhKSB7CiAgICAgICAgICAgICAgICAkcmVzdWx0ID0gJyc7CiAgICAgICAgICAgICAgICAjIEl0ZW0KICAgICAgICAgICAgICAgIGlmIChkZWZpbmVkKCRlbGVtZW50LT57JG1vZHVsZV9pdGVtfSkpIHsKICAgICAgICAgICAgICAgICAgICAgICAgJHJlc3VsdCAuPSAkZWxlbWVudC0+eyRtb2R1bGVfaXRlbX0gLiAnOyc7CiAgICAgICAgICAgICAgICB9CgogICAgICAgICAgICAgICAgIyBEYXRhCiAgICAgICAgICAgICAgICBpZiAoZGVmaW5lZCgkZWxlbWVudC0+eyRtb2R1bGVfZGF0YX0pKSB7CiAgICAgICAgICAgICAgICAgICAgICAgICRyZXN1bHQgLj0gJGVsZW1lbnQtPnskbW9kdWxlX2RhdGF9OwogICAgICAgICAgICAgICAgfQoKICAgICAgICAgICAgICAgIHByaW50ICRyZXN1bHQgLiAiXG4iOwogICAgICAgIH0KfQoKIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIyBNYWluCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCgpteSBAcmVzdWx0ID0gcnVuX3F1ZXJ5KCJTRUxFQ1QgTmFtZSwgVmVyc2lvbiBGUk9NIFdpbjMyX1Byb2R1Y3QiKTsKcHJpbnRfbW9kdWxlZGF0YSAoIk5hbWUiLCAiVmVyc2lvbiIsIFxAcmVzdWx0KTsKZXhpdCAwOwoK',0),(15,9,'Patches','Installed patches','/usr/bin/perl','HotFixID;Description;FixComments;ServicePackInEffect','IyEvdXNyL2Jpbi9wZXJsDQojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KIyBwYW5kb3JhX3BhdGNoLnBsDQojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KIyBDb3B5cmlnaHQgKGMpIDIwMDggUmFtb24gTm92b2EsIHJub3ZvYUBhcnRpY2EuZXMNCiMgICAgICAgICAgIChjKSAyMDA4IEFydGljYSBTb2x1Y2lvbmVzIFRlY25vbG9naWNhcyBTLkwNCiMNCiMgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcg0KIyBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQ0KIyBhcyBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgdmVyc2lvbiAyLg0KIw0KIyBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwNCiMgYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YNCiMgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQ0KIyBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLg0KIyBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQ0KIyBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90LCB3cml0ZSB0byB0aGUgRnJlZSBTb2Z0d2FyZQ0KIyBGb3VuZGF0aW9uLCBJbmMuLCA1MSBGcmFua2xpbiBTdHJlZXQsIEZpZnRoIEZsb29yLCBCb3N0b24sIE1BICAwMjExMC0xMzAxLCBVU0EuDQojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KDQp1c2Ugc3RyaWN0Ow0KdXNlIHdhcm5pbmdzOw0KDQp1c2UgRmlsZTo6QmFzZW5hbWU7DQp1c2UgSFRNTDo6RW50aXRpZXMgKCk7DQoNCiMgQ2hlY2sgZm9yIHdtaWMNCm15ICR3bWlfY2xpZW50ID0gIndtaWMiOw0KaWYgKHN5c3RlbSgiJHdtaV9jbGllbnQgPiAvZGV2L251bGwgMj4mMSIpICE9IDI1Nikgew0KCXByaW50ICJbZXJyb3JdICR3bWlfY2xpZW50IG5vdCBmb3VuZC5cbiI7DQoJZXhpdCAxOw0KfQ0KDQppZiAoJCNBUkdWICE9IDIpIHsNCglwcmludCAiVXNhZ2U6ICQwIDx0YXJnZXQgaXA+IDx1c2VybmFtZT4gPHBhc3N3b3JkPlxuIjsNCglleGl0IDE7DQp9DQoNCm15ICR0YXJnZXRfaXAgPSAkQVJHVlswXTsNCm15ICR1c2VybmFtZSA9ICRBUkdWWzFdOw0KbXkgJHBhc3N3b3JkID0gJEFSR1ZbMl07DQoNCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQojIFNVQiBydW5fcXVlcnkgKCR3cWxfcXVlcnkpDQojIFJ1bnMgdGhlIGdpdmVuIFdRTCBxdWVyeSBhbmQgcmV0dXJucyB0aGUgcmVzdWx0IGFzIGFuIGFycmF5IG9mIGhhc2hlcy4NCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQpzdWIgcnVuX3F1ZXJ5IHsNCglteSAkd3FsX3F1ZXJ5ID0gJF9bMF07DQoJbXkgQHJlc3VsdCA9IHt9Ow0KDQoJJHdxbF9xdWVyeSA9fiAncy8iL1wnL2cnOw0KDQoJIyBSdW4gdGhlIERDT00vV01JIGNsaWVudA0KCW15ICRvdXRwdXQgPSBgJHdtaV9jbGllbnQgLVUgJyR1c2VybmFtZSclJyRwYXNzd29yZCcgLy8kdGFyZ2V0X2lwIFwiJHdxbF9xdWVyeVwiIDI+L2Rldi9udWxsYDsNCg0KCW15IEBsaW5lcyA9IHNwbGl0KC9cbi8sICRvdXRwdXQpOw0KCSMgSGVhZGVyLCBkZXNjcmlwdGlvbiwgcmVzdWx0cw0KCWlmICgkI2xpbmVzIDwgMikgew0KCQlleGl0IDE7DQoJfQ0KDQoJIyBEcm9wIHRoZSBoZWFkZXINCglzaGlmdCAoQGxpbmVzKTsNCgkNCgkjIEdldCBjb2x1bW4gbmFtZXMNCglteSBAY29sdW1uX25hbWVzID0gc3BsaXQoL1x8Lywgc2hpZnQgKEBsaW5lcykpOw0KDQoJIyBHZXQgcm93IGRhdGENCglteSAkaWR4ID0gMDsNCglmb3IgKG15ICRpID0gMDsgJGkgPD0gJCNsaW5lczsgJGkrKykgew0KDQoJCSMgQ2hlY2sgZm9yIGVycm9ycw0KCQlpZiAoJGxpbmVzWyRpXSA9fiBtL15FUlJPUi8pIHsNCgkJCWV4aXQgMTsNCgkJfQ0KDQoJCSMgQmxhY2sgbGlzdA0KCQlpZiAoJGxpbmVzWyRpXSA9fiBtL0ZpbGUgMS8pIHsNCgkJCW5leHQ7DQoJCX0NCg0KCQlteSBAY29sdW1uID0gc3BsaXQoL1x8LywgJGxpbmVzWyRpXSk7DQoJCWZvciAobXkgJGogPSAwOyAkaiA8PSAkI2NvbHVtbl9uYW1lczsgJGorKykgew0KCQkJaWYgKCEgZGVmaW5lZCgkY29sdW1uWyRqXSkpIHsNCgkJCQkkcmVzdWx0WyRpZHhdLT57JGNvbHVtbl9uYW1lc1skal19ID0gIiI7DQoJCQl9DQoJCQllbHNlIHsNCgkJCQkkcmVzdWx0WyRpZHhdLT57JGNvbHVtbl9uYW1lc1skal19ID0gJGNvbHVtblskal07DQoJCQl9DQoJCX0NCgkJDQoJCSRpZHgrKzsNCgl9DQoJDQoJcmV0dXJuIEByZXN1bHQ7DQp9DQoNCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQojIFNVQiBwcmludF9tb2R1bGVkYXRhICgkbW9kdWxlX2l0ZW0sICRtb2R1bGVfZGF0YSwgDQojICRtb2R1bGVfZGVzY3JpcHRpb24sIEBkYXRhKQ0KIyBQcmludHMgYSBtb2R1bGVkYXRhIFhNTCB0YWcuICRtb2R1bGVfaXRlbSwgJG1vZHVsZV9kYXRhLCANCiMgJG1vZHVsZV9kZXNjcmlwdGlvbiBhbmQgJG1vZHVsZV9zZXJ2aWNlcGFjayBhcmUgdXNlZCB0byBpbmRleCB0aGUgaXRlbSwgZGF0YSwgZGVzY3JpcHRpb24gYW5kIHNlcnZpY2VwYWNrDQojIFhNTCB0YWdzIHJlc3BlY3RpdmVseS4NCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQpzdWIgcHJpbnRfbW9kdWxlZGF0YSB7DQoJbXkgJG1vZHVsZV9pdGVtID0gJF9bMF07DQoJbXkgJG1vZHVsZV9kYXRhID0gJF9bMV07DQoJbXkgJG1vZHVsZV9kZXNjcmlwdGlvbiA9ICRfWzJdOw0KCW15ICRtb2R1bGVfc2VydmljZXBhY2sgPSAkX1szXTsNCglteSBAZGF0YSA9IEB7JF9bNF19Ow0KCW15ICRyZXN1bHQ7DQoNCglmb3JlYWNoIG15ICRlbGVtZW50IChAZGF0YSkgew0KCQkNCgkJJHJlc3VsdCA9ICcnOw0KDQoJCSMgSXRlbQ0KCQlpZiAoZGVmaW5lZCgkZWxlbWVudC0+eyRtb2R1bGVfaXRlbX0pKSB7DQoJCQkkcmVzdWx0IC49ICRlbGVtZW50LT57JG1vZHVsZV9pdGVtfSAuICc7JzsNCgkJfQ0KDQoJCSMgRGF0YQ0KCQlpZiAoZGVmaW5lZCgkZWxlbWVudC0+eyRtb2R1bGVfZGF0YX0pKSB7DQoJCQkkcmVzdWx0IC49ICRlbGVtZW50LT57JG1vZHVsZV9kYXRhfSAuICc7JzsNCgkJfQ0KDQoJCSMgRGVzY3JpcHRpb24NCgkJaWYgKGRlZmluZWQoJGVsZW1lbnQtPnskbW9kdWxlX2Rlc2NyaXB0aW9ufSkpIHsNCgkJCSRyZXN1bHQgLj0gJGVsZW1lbnQtPnskbW9kdWxlX2Rlc2NyaXB0aW9ufSAuICc7JzsNCgkJfQ0KDQoJCSMgU2VydmljZSBwYWNrDQoJCWlmIChkZWZpbmVkKCRlbGVtZW50LT57JG1vZHVsZV9zZXJ2aWNlcGFja30pKSB7DQoJCQkkcmVzdWx0IC49ICRlbGVtZW50LT57JG1vZHVsZV9zZXJ2aWNlcGFja307DQoJCX0NCg0KCQlwcmludCAkcmVzdWx0IC4gIlxuIjsJDQoJfQ0KfQ0KDQojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KIyBNYWluDQojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KDQpteSBAcmVzdWx0ID0gcnVuX3F1ZXJ5KCJTRUxFQ1QgSG90Rml4SUQsIERlc2NyaXB0aW9uLCBGaXhDb21tZW50cywgU2VydmljZVBhY2tJbkVmZmVjdCBGUk9NIFdpbjMyX1F1aWNrRml4RW5naW5lZXJpbmciKTsNCnByaW50X21vZHVsZWRhdGEgKCJIb3RGaXhJRCIsICJEZXNjcmlwdGlvbiIsICJGaXhDb21tZW50cyIsICJTZXJ2aWNlUGFja0luRWZmZWN0IiwgXEByZXN1bHQpOw0KZXhpdCAwOw0K',0),(16,1,'Init&#x20;services','Services programmed to lauch in Unix','','Service','',0),(17,9,'Init&#x20;services','Windows services','/usr/bin/perl','Name;PathName;State','IyEvdXNyL2Jpbi9wZXJsCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMgcGFuZG9yYV9zZXJ2aWNlcy5wbAoj IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj IyMjIyMjIyMjIyMjIyMjIwojIENvcHlyaWdodCAoYykgMjAwOCBSYW1vbiBOb3ZvYSwgcm5vdm9h QGFydGljYS5lcwojICAgICAgICAgICAoYykgMjAwOCBBcnRpY2EgU29sdWNpb25lcyBUZWNub2xv Z2ljYXMgUy5MCiMKIyBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRp c3RyaWJ1dGUgaXQgYW5kL29yCiMgbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05V IEdlbmVyYWwgUHVibGljIExpY2Vuc2UKIyBhcyBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdh cmUgRm91bmRhdGlvbjsgdmVyc2lvbiAyLgojCiMgVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVk IGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCiMgYnV0IFdJVEhPVVQgQU5ZIFdB UlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKIyBNRVJDSEFOVEFC SUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlCiMgR05V IEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KIyBZb3Ugc2hvdWxkIGhh dmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQojIGFs b25nIHdpdGggdGhpcyBwcm9ncmFtOyBpZiBub3QsIHdyaXRlIHRvIHRoZSBGcmVlIFNvZnR3YXJl CiMgRm91bmRhdGlvbiwgSW5jLiwgNTEgRnJhbmtsaW4gU3RyZWV0LCBGaWZ0aCBGbG9vciwgQm9z dG9uLCBNQSAgMDIxMTAtMTMwMSwgVVNBLgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwoKdXNlIHN0cmljdDsK dXNlIHdhcm5pbmdzOwoKdXNlIEZpbGU6OkJhc2VuYW1lOwp1c2UgSFRNTDo6RW50aXRpZXMgKCk7 CgojIENoZWNrIGZvciB3bWljCm15ICR3bWlfY2xpZW50ID0gIndtaWMiOwppZiAoc3lzdGVtKCIk d21pX2NsaWVudCA+IC9kZXYvbnVsbCAyPiYxIikgIT0gMjU2KSB7CglwcmludCAiW2Vycm9yXSAk d21pX2NsaWVudCBub3QgZm91bmQuXG4iOwoJZXhpdCAxOwp9CgppZiAoJCNBUkdWICE9IDIpIHsK CXByaW50ICJVc2FnZTogJDAgPHRhcmdldCBpcD4gPHVzZXJuYW1lPiA8cGFzc3dvcmQ+XG4iOwoJ ZXhpdCAxOwp9CgpteSAkdGFyZ2V0X2lwID0gJEFSR1ZbMF07Cm15ICR1c2VybmFtZSA9ICRBUkdW WzFdOwpteSAkcGFzc3dvcmQgPSAkQVJHVlsyXTsKCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMgU1VCIHJ1 bl9xdWVyeSAoJHdxbF9xdWVyeSkKIyBSdW5zIHRoZSBnaXZlbiBXUUwgcXVlcnkgYW5kIHJldHVy bnMgdGhlIHJlc3VsdCBhcyBhbiBhcnJheSBvZiBoYXNoZXMuCiMjIyMjIyMjIyMjIyMjIyMjIyMj IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCnN1 YiBydW5fcXVlcnkgewoJbXkgJHdxbF9xdWVyeSA9ICRfWzBdOwoJbXkgQHJlc3VsdCA9IHt9OwoK CSR3cWxfcXVlcnkgPX4gJ3MvIi9cJy9nJzsKCgkjIFJ1biB0aGUgRENPTS9XTUkgY2xpZW50Cglt eSAkb3V0cHV0ID0gYCR3bWlfY2xpZW50IC1VICckdXNlcm5hbWUnJSckcGFzc3dvcmQnIC8vJHRh cmdldF9pcCBcIiR3cWxfcXVlcnlcIiAyPi9kZXYvbnVsbGA7CgoJbXkgQGxpbmVzID0gc3BsaXQo L1xuLywgJG91dHB1dCk7CgkjIEhlYWRlciwgZGVzY3JpcHRpb24sIHJlc3VsdHMKCWlmICgkI2xp bmVzIDwgMikgewoJCWV4aXQgMTsKCX0KCgkjIERyb3AgdGhlIGhlYWRlcgoJc2hpZnQgKEBsaW5l cyk7CgkKCSMgR2V0IGNvbHVtbiBuYW1lcwoJbXkgQGNvbHVtbl9uYW1lcyA9IHNwbGl0KC9cfC8s IHNoaWZ0IChAbGluZXMpKTsKCgkjIEdldCByb3cgZGF0YQoJbXkgJGlkeCA9IDA7Cglmb3IgKG15 ICRpID0gMDsgJGkgPD0gJCNsaW5lczsgJGkrKykgewoKCQkjIENoZWNrIGZvciBlcnJvcnMKCQlp ZiAoJGxpbmVzWyRpXSA9fiBtL15FUlJPUi8pIHsKCQkJZXhpdCAxOwoJCX0KCgkJIyBCbGFjayBs aXN0CgkJaWYgKCRsaW5lc1skaV0gPX4gbS9GaWxlIDEvKSB7CgkJCW5leHQ7CgkJfQoKCQlteSBA Y29sdW1uID0gc3BsaXQoL1x8LywgJGxpbmVzWyRpXSk7CgkJZm9yIChteSAkaiA9IDA7ICRqIDw9 ICQjY29sdW1uX25hbWVzOyAkaisrKSB7CgkJCWlmICghIGRlZmluZWQoJGNvbHVtblskal0pKSB7 CgkJCQkkcmVzdWx0WyRpZHhdLT57JGNvbHVtbl9uYW1lc1skal19ID0gIiI7CgkJCX0KCQkJZWxz ZSB7CgkJCQkkcmVzdWx0WyRpZHhdLT57JGNvbHVtbl9uYW1lc1skal19ID0gJGNvbHVtblskal07 CgkJCX0KCQl9CgkJCgkJJGlkeCsrOwoJfQoJCglyZXR1cm4gQHJlc3VsdDsKfQoKIyMjIyMjIyMj IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj IyMjIyMjIyMKIyBTVUIgcHJpbnRfbW9kdWxlZGF0YSAoJG1vZHVsZV9pdGVtLCAkbW9kdWxlX2Rh dGEsIAojICRtb2R1bGVfZGVzY3JpcHRpb24sIEBkYXRhKQojIFByaW50cyBhIG1vZHVsZWRhdGEg WE1MIHRhZy4gJG1vZHVsZV9pdGVtLCAkbW9kdWxlX2RhdGEgYW5kCiMgJG1vZHVsZV9kZXNjcmlw dGlvbiBhcmUgdXNlZCB0byBpbmRleCB0aGUgaXRlbSwgZGF0YSBhbmQgZGVzY3JpcHRpb24KIyBY TUwgdGFncyByZXNwZWN0aXZlbHkuCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCnN1YiBwcmludF9tb2R1bGVk YXRhIHsKCW15ICRtb2R1bGVfaXRlbSA9ICRfWzBdOwoJbXkgJG1vZHVsZV9kYXRhID0gJF9bMV07 CglteSAkbW9kdWxlX2Rlc2NyaXB0aW9uID0gJF9bMl07CglteSBAZGF0YSA9IEB7JF9bM119OwoJ bXkgJHJlc3VsdDsKCglmb3JlYWNoIG15ICRlbGVtZW50IChAZGF0YSkgewoJCQoJCSRyZXN1bHQg PSAnJzsKCgkJIyBJdGVtCgkJaWYgKGRlZmluZWQoJGVsZW1lbnQtPnskbW9kdWxlX2l0ZW19KSkg ewoJCQkkcmVzdWx0IC49ICRlbGVtZW50LT57JG1vZHVsZV9pdGVtfSAuICc7JzsKCQl9CgoJCSMg RGF0YQoJCWlmIChkZWZpbmVkKCRlbGVtZW50LT57JG1vZHVsZV9kYXRhfSkpIHsKCQkJJHJlc3Vs dCAuPSAkZWxlbWVudC0+eyRtb2R1bGVfZGF0YX0gLiAnOyc7CgkJfQoKCQkjIERlc2NyaXB0aW9u CgkJaWYgKGRlZmluZWQoJGVsZW1lbnQtPnskbW9kdWxlX2Rlc2NyaXB0aW9ufSkpIHsKCQkJJHJl c3VsdCAuPSAkZWxlbWVudC0+eyRtb2R1bGVfZGVzY3JpcHRpb259OwoJCX0KCgkJcHJpbnQgJHJl c3VsdCAuICJcbiI7CQoJfQp9CgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwojIE1haW4KIyMjIyMjIyMjIyMj IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj IyMjIyMKCm15IEByZXN1bHQgPSBydW5fcXVlcnkoIlNFTEVDVCBOYW1lLCBQYXRoTmFtZSwgU3Rh dGUgRlJPTSBXaW4zMl9TZXJ2aWNlIik7CnByaW50X21vZHVsZWRhdGEgKCJOYW1lIiwgIlBhdGhO YW1lIiwgIlN0YXRlIiwgXEByZXN1bHQpOwpleGl0IDA7Cg==',0),(18,1,'File&#x20;system','UNIX filesystem mounted on system','','Device;Free size;Total size;Mount point','',0),(19,9,'File&#x20;system','Disk drives','','Device;Total size;Free size;Mount point','',0),(20,1,'Process','Process running on system','','Process output from ps','',0),(21,9,'Process','Process running on system','/usr/bin/perl','Name;PathName;State','IyEvdXNyL2Jpbi9wZXJsCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMgcGFuZG9yYV9wcm9jZXNzZXMucGwK IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj IyMjIyMjIyMjIyMjIyMjIyMKIyBDb3B5cmlnaHQgKGMpIDIwMDggUmFtb24gTm92b2EsIHJub3Zv YUBhcnRpY2EuZXMKIyAgICAgICAgICAgKGMpIDIwMDggQXJ0aWNhIFNvbHVjaW9uZXMgVGVjbm9s b2dpY2FzIFMuTAojCiMgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVk aXN0cmlidXRlIGl0IGFuZC9vcgojIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdO VSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCiMgYXMgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3 YXJlIEZvdW5kYXRpb247IHZlcnNpb24gMi4KIwojIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRl ZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAojIGJ1dCBXSVRIT1VUIEFOWSBX QVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCiMgTUVSQ0hBTlRB QklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQojIEdO VSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCiMgWW91IHNob3VsZCBo YXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UKIyBh bG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90LCB3cml0ZSB0byB0aGUgRnJlZSBTb2Z0d2Fy ZQojIEZvdW5kYXRpb24sIEluYy4sIDUxIEZyYW5rbGluIFN0cmVldCwgRmlmdGggRmxvb3IsIEJv c3RvbiwgTUEgIDAyMTEwLTEzMDEsIFVTQS4KIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKCnVzZSBzdHJpY3Q7 CnVzZSB3YXJuaW5nczsKCnVzZSBGaWxlOjpCYXNlbmFtZTsKdXNlIEhUTUw6OkVudGl0aWVzICgp OwoKIyBDaGVjayBmb3Igd21pYwpteSAkd21pX2NsaWVudCA9ICJ3bWljIjsKaWYgKHN5c3RlbSgi JHdtaV9jbGllbnQgPiAvZGV2L251bGwgMj4mMSIpICE9IDI1NikgewoJcHJpbnQgIltlcnJvcl0g JHdtaV9jbGllbnQgbm90IGZvdW5kLlxuIjsKCWV4aXQgMTsKfQoKaWYgKCQjQVJHViAhPSAyKSB7 CglwcmludCAiVXNhZ2U6ICQwIDx0YXJnZXQgaXA+IDx1c2VybmFtZT4gPHBhc3N3b3JkPlxuIjsK CWV4aXQgMTsKfQoKbXkgJHRhcmdldF9pcCA9ICRBUkdWWzBdOwpteSAkdXNlcm5hbWUgPSAkQVJH VlsxXTsKbXkgJHBhc3N3b3JkID0gJEFSR1ZbMl07CgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwojIFNVQiBy dW5fcXVlcnkgKCR3cWxfcXVlcnkpCiMgUnVucyB0aGUgZ2l2ZW4gV1FMIHF1ZXJ5IGFuZCByZXR1 cm5zIHRoZSByZXN1bHQgYXMgYW4gYXJyYXkgb2YgaGFzaGVzLgojIyMjIyMjIyMjIyMjIyMjIyMj IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwpz dWIgcnVuX3F1ZXJ5IHsKCW15ICR3cWxfcXVlcnkgPSAkX1swXTsKCW15IEByZXN1bHQgPSB7fTsK Cgkkd3FsX3F1ZXJ5ID1+ICdzLyIvXCcvZyc7CgoJIyBSdW4gdGhlIERDT00vV01JIGNsaWVudAoJ bXkgJG91dHB1dCA9IGAkd21pX2NsaWVudCAtVSAnJHVzZXJuYW1lJyUnJHBhc3N3b3JkJyAvLyR0 YXJnZXRfaXAgXCIkd3FsX3F1ZXJ5XCIgMj4vZGV2L251bGxgOwoKCW15IEBsaW5lcyA9IHNwbGl0 KC9cbi8sICRvdXRwdXQpOwoJIyBIZWFkZXIsIGRlc2NyaXB0aW9uLCByZXN1bHRzCglpZiAoJCNs aW5lcyA8IDIpIHsKCQlleGl0IDE7Cgl9CgoJIyBEcm9wIHRoZSBoZWFkZXIKCXNoaWZ0IChAbGlu ZXMpOwoJCgkjIEdldCBjb2x1bW4gbmFtZXMKCW15IEBjb2x1bW5fbmFtZXMgPSBzcGxpdCgvXHwv LCBzaGlmdCAoQGxpbmVzKSk7CgoJIyBHZXQgcm93IGRhdGEKCW15ICRpZHggPSAwOwoJZm9yICht eSAkaSA9IDA7ICRpIDw9ICQjbGluZXM7ICRpKyspIHsKCgkJIyBDaGVjayBmb3IgZXJyb3JzCgkJ aWYgKCRsaW5lc1skaV0gPX4gbS9eRVJST1IvKSB7CgkJCWV4aXQgMTsKCQl9CgoJCSMgQmxhY2sg bGlzdAoJCWlmICgkbGluZXNbJGldID1+IG0vRmlsZSAxLykgewoJCQluZXh0OwoJCX0KCgkJbXkg QGNvbHVtbiA9IHNwbGl0KC9cfC8sICRsaW5lc1skaV0pOwoJCWZvciAobXkgJGogPSAwOyAkaiA8 PSAkI2NvbHVtbl9uYW1lczsgJGorKykgewoJCQlpZiAoISBkZWZpbmVkKCRjb2x1bW5bJGpdKSkg ewoJCQkJJHJlc3VsdFskaWR4XS0+eyRjb2x1bW5fbmFtZXNbJGpdfSA9ICIiOwoJCQl9CgkJCWVs c2UgewoJCQkJJHJlc3VsdFskaWR4XS0+eyRjb2x1bW5fbmFtZXNbJGpdfSA9ICRjb2x1bW5bJGpd OwoJCQl9CgkJfQoJCQoJCSRpZHgrKzsKCX0KCQoJcmV0dXJuIEByZXN1bHQ7Cn0KCiMjIyMjIyMj IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj IyMjIyMjIyMjCiMgU1VCIHByaW50X21vZHVsZWRhdGEgKCRtb2R1bGVfaXRlbSwgJG1vZHVsZV9k YXRhLCAKIyAkbW9kdWxlX2Rlc2NyaXB0aW9uLCBAZGF0YSkKIyBQcmludHMgYSBtb2R1bGVkYXRh IFhNTCB0YWcuICRtb2R1bGVfaXRlbSwgJG1vZHVsZV9kYXRhIGFuZAojICRtb2R1bGVfZGVzY3Jp cHRpb24gYXJlIHVzZWQgdG8gaW5kZXggdGhlIGl0ZW0sIGRhdGEgYW5kIGRlc2NyaXB0aW9uCiMg WE1MIHRhZ3MgcmVzcGVjdGl2ZWx5LgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwpzdWIgcHJpbnRfbW9kdWxl ZGF0YSB7CglteSAkbW9kdWxlX2l0ZW0gPSAkX1swXTsKCW15ICRtb2R1bGVfZGF0YSA9ICRfWzFd OwoJbXkgJG1vZHVsZV9kZXNjcmlwdGlvbiA9ICRfWzJdOwoJbXkgQGRhdGEgPSBAeyRfWzNdfTsK CW15ICRyZXN1bHQ7CgoJZm9yZWFjaCBteSAkZWxlbWVudCAoQGRhdGEpIHsKCQkKCQkkcmVzdWx0 ID0gJyc7CgoJCSMgSXRlbQoJCWlmIChkZWZpbmVkKCRlbGVtZW50LT57JG1vZHVsZV9pdGVtfSkp IHsKCQkJJHJlc3VsdCAuPSAkZWxlbWVudC0+eyRtb2R1bGVfaXRlbX0gLiAnOyc7CgkJfQoKCQkj IERhdGEKCQlpZiAoZGVmaW5lZCgkZWxlbWVudC0+eyRtb2R1bGVfZGF0YX0pKSB7CgkJCSRyZXN1 bHQgLj0gJGVsZW1lbnQtPnskbW9kdWxlX2RhdGF9IC4gJzsnOwoJCX0KCgkJIyBEZXNjcmlwdGlv bgoJCWlmIChkZWZpbmVkKCRlbGVtZW50LT57JG1vZHVsZV9kZXNjcmlwdGlvbn0pKSB7CgkJCSRy ZXN1bHQgLj0gJGVsZW1lbnQtPnskbW9kdWxlX2Rlc2NyaXB0aW9ufTsKCQl9CgoJCXByaW50ICRy ZXN1bHQgLiAiXG4iOwkKCX0KfQoKIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIyBNYWluCiMjIyMjIyMjIyMj IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj IyMjIyMjCgpteSBAcmVzdWx0ID0gcnVuX3F1ZXJ5KCJTRUxFQ1QgTmFtZSwgUGF0aE5hbWUsIFN0 YXRlIEZST00gV2luMzJfU2VydmljZSIpOwpwcmludF9tb2R1bGVkYXRhICgiTmFtZSIsICJQYXRo TmFtZSIsICJTdGF0ZSIsIFxAcmVzdWx0KTsJCmV4aXQgMDsK',0),(22,1,'Users','User list','','Username','',0),(23,9,'Users','User list','/usr/bin/perl','Domain;User','IyEvdXNyL2Jpbi9wZXJsCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMgcGFuZG9yYV91c2Vycy5wbAojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwojIENvcHlyaWdodCAoYykgMjAwOCBSYW1vbiBOb3ZvYSwgcm5vdm9hQGFydGljYS5lcwojICAgICAgICAgICAoYykgMjAwOCBBcnRpY2EgU29sdWNpb25lcyBUZWNub2xvZ2ljYXMgUy5MCiMgICAgICAgICAgIChjKSAyMDE1IEJvcmphIFNhbmNoZXogPGZib3JqYS5zYW5jaGV6QGFydGljYS5lcz4KIyBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yCiMgbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UKIyBhcyBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgdmVyc2lvbiAyLgojCiMgVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCiMgYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKIyBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlCiMgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KIyBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQojIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtOyBpZiBub3QsIHdyaXRlIHRvIHRoZSBGcmVlIFNvZnR3YXJlCiMgRm91bmRhdGlvbiwgSW5jLiwgNTEgRnJhbmtsaW4gU3RyZWV0LCBGaWZ0aCBGbG9vciwgQm9zdG9uLCBNQSAgMDIxMTAtMTMwMSwgVVNBLgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwoKdXNlIHN0cmljdDsKdXNlIHdhcm5pbmdzOwoKdXNlIEZpbGU6OkJhc2VuYW1lOwp1c2UgSFRNTDo6RW50aXRpZXMgKCk7CgojIENoZWNrIGZvciB3bWljCm15ICR3bWlfY2xpZW50ID0gIndtaWMiOwppZiAoc3lzdGVtKCIkd21pX2NsaWVudCA+IC9kZXYvbnVsbCAyPiYxIikgIT0gMjU2KSB7CglwcmludCAiW2Vycm9yXSAkd21pX2NsaWVudCBub3QgZm91bmQuXG4iOwoJZXhpdCAxOwp9CgppZiAoJCNBUkdWICE9IDIpIHsKCXByaW50ICJVc2FnZTogJDAgPHRhcmdldCBpcD4gPHVzZXJuYW1lPiA8cGFzc3dvcmQ+XG4iOwoJZXhpdCAxOwp9CgpteSAkdGFyZ2V0X2lwID0gJEFSR1ZbMF07Cm15ICR1c2VybmFtZSA9ICRBUkdWWzFdOwpteSAkcGFzc3dvcmQgPSAkQVJHVlsyXTsKCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMgU1VCIHJ1bl9xdWVyeSAoJHdxbF9xdWVyeSkKIyBSdW5zIHRoZSBnaXZlbiBXUUwgcXVlcnkgYW5kIHJldHVybnMgdGhlIHJlc3VsdCBhcyBhbiBhcnJheSBvZiBoYXNoZXMuCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCnN1YiBydW5fcXVlcnkgewoJbXkgJHdxbF9xdWVyeSA9ICRfWzBdOwoJbXkgQHJlc3VsdCA9IHt9OwoKCSR3cWxfcXVlcnkgPX4gJ3MvIi9cJy9nJzsKCgkjIFJ1biB0aGUgRENPTS9XTUkgY2xpZW50CglteSAkb3V0cHV0ID0gYCR3bWlfY2xpZW50IC1VICckdXNlcm5hbWUnJSckcGFzc3dvcmQnIC8vJHRhcmdldF9pcCBcIiR3cWxfcXVlcnlcIiAyPi9kZXYvbnVsbGA7CgoJbXkgQGxpbmVzID0gc3BsaXQoL1xuLywgJG91dHB1dCk7CgkjIEhlYWRlciwgZGVzY3JpcHRpb24sIHJlc3VsdHMKCWlmICgkI2xpbmVzIDwgMikgewoJCWV4aXQgMTsKCX0KCgkjIERyb3AgdGhlIGhlYWRlcgoJc2hpZnQgKEBsaW5lcyk7CgkKCSMgR2V0IGNvbHVtbiBuYW1lcwoJbXkgQGNvbHVtbl9uYW1lcyA9IHNwbGl0KC9cfC8sIHNoaWZ0IChAbGluZXMpKTsKCgkjIEdldCByb3cgZGF0YQoJbXkgJGlkeCA9IDA7Cglmb3IgKG15ICRpID0gMDsgJGkgPD0gJCNsaW5lczsgJGkrKykgewoKCQkjIENoZWNrIGZvciBlcnJvcnMKCQlpZiAoJGxpbmVzWyRpXSA9fiBtL15FUlJPUi8pIHsKCQkJZXhpdCAxOwoJCX0KCgkJIyBCbGFjayBsaXN0CgkJaWYgKCRsaW5lc1skaV0gPX4gbS9GaWxlIDEvKSB7CgkJCW5leHQ7CgkJfQoKCQlteSBAY29sdW1uID0gc3BsaXQoL1x8LywgJGxpbmVzWyRpXSk7CgkJZm9yIChteSAkaiA9IDA7ICRqIDw9ICQjY29sdW1uX25hbWVzOyAkaisrKSB7CgkJCWlmICghIGRlZmluZWQoJGNvbHVtblskal0pKSB7CgkJCQkkcmVzdWx0WyRpZHhdLT57JGNvbHVtbl9uYW1lc1skal19ID0gIiI7CgkJCX0KCQkJZWxzZSB7CgkJCQkkcmVzdWx0WyRpZHhdLT57JGNvbHVtbl9uYW1lc1skal19ID0gJGNvbHVtblskal07CgkJCX0KCQl9CgkJCgkJJGlkeCsrOwoJfQoJCglyZXR1cm4gQHJlc3VsdDsKfQoKIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIyBTVUIgcHJpbnRfbW9kdWxlZGF0YSAoJG1vZHVsZV9pdGVtLCAkbW9kdWxlX2RhdGEsIAojICRtb2R1bGVfZGVzY3JpcHRpb24sIEBkYXRhKQojIFByaW50cyBhIG1vZHVsZWRhdGEgWE1MIHRhZy4gJG1vZHVsZV9pdGVtLCAkbW9kdWxlX2RhdGEgYW5kCiMgJG1vZHVsZV9kZXNjcmlwdGlvbiBhcmUgdXNlZCB0byBpbmRleCB0aGUgaXRlbSwgZGF0YSBhbmQgZGVzY3JpcHRpb24KIyBYTUwgdGFncyByZXNwZWN0aXZlbHkuCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCnN1YiBwcmludF9tb2R1bGVkYXRhIHsKCW15ICRtb2R1bGVfaXRlbSA9ICRfWzBdOwoJbXkgJG1vZHVsZV9kYXRhID0gJF9bMV07CglteSAkbW9kdWxlX2Rlc2NyaXB0aW9uID0gJF9bMl07CglteSBAZGF0YSA9IEB7JF9bM119OwoJbXkgJHJlc3VsdDsKCglmb3JlYWNoIG15ICRlbGVtZW50IChAZGF0YSkgewoJCQoJCSRyZXN1bHQgPSAnJzsKCgkJIyBJdGVtCgkJaWYgKGRlZmluZWQoJGVsZW1lbnQtPnskbW9kdWxlX2l0ZW19KSkgewoJCQkkcmVzdWx0IC49ICRlbGVtZW50LT57JG1vZHVsZV9pdGVtfSAuICc7JzsKCQl9CgoJCSMgRGF0YQoJCWlmIChkZWZpbmVkKCRlbGVtZW50LT57JG1vZHVsZV9kYXRhfSkpIHsKCQkJJHJlc3VsdCAuPSAkZWxlbWVudC0+eyRtb2R1bGVfZGF0YX0gLiAnOyc7CgkJfQoKCQkjIERlc2NyaXB0aW9uCgkJaWYgKGRlZmluZWQoJGVsZW1lbnQtPnskbW9kdWxlX2Rlc2NyaXB0aW9ufSkpIHsKCQkJJHJlc3VsdCAuPSAkZWxlbWVudC0+eyRtb2R1bGVfZGVzY3JpcHRpb259OwoJCX0KCgkJcHJpbnQgJHJlc3VsdCAuICJcbiI7CQoJfQp9CgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwojIE1haW4KIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKCm15IEByZXN1bHQgPSBydW5fcXVlcnkoIlNFTEVDVCBOYW1lLCBGdWxsTmFtZSwgU3RhdHVzIEZST00gV2luMzJfVXNlckFjY291bnQiKTsKcHJpbnRfbW9kdWxlZGF0YSAoIk5hbWUiLCAiRnVsbE5hbWUiLCAiU3RhdHVzIiwgXEByZXN1bHQpOwpleGl0IDA7Cg==',0),(24,9,'Services','Services&#x20;installed','','Name;Command;Status','',0),(25,15,'Software','Installed&#x20;software&#x20;applications','','Name;Version;Description','',0),(26,7,'Cisco&#x20;Interface&#x20;Remote&#x20;Inventory','Remote&#x20;inventory&#x20;module&#x20;to&#x20;get&#x20;all&#x20;cards&#x20;in&#x20;a&#x20;Cisco','/usr/bin/perl','Name;Card&#x20;Name;ID/Serial','IyEvdXNyL2Jpbi9wZXJsDQojSW52ZW50YXJpbyBkZSBUYXJqZXRhcw0KI1Nsb3Q7UGFydE51bWJlcjtTZXJpYWxOdW1iZXINCg0KIyEvdXNyL2Jpbi9wZXJsIC13DQoNCm15ICR0YXJnZXRfaXAgPSAkQVJHVlswXTsNCm15ICRjb21tdW5pdHkgPSAkQVJHVlsxXTsNCg0KI34gRXhlY3V0ZSBjb21tYW5kDQokY29tbWFuZCA9IGBzbm1wd2FsayAtdjJjIC1jICRjb21tdW5pdHkgJHRhcmdldF9pcCBtaWItMi40Ny4xLjEuMS4xLjJgOw0KDQojfiBTcGxpdCB0aGUgb3V0cHV0IGluIGxpbmVzDQpAdGVtcCA9IHNwbGl0ICgiXG4iLCAkY29tbWFuZCk7DQpteSBAdmFsdWVzOw0KDQojfiBFYWNoIGxpbmUNCmZvcmVhY2ggKEB0ZW1wKSB7DQoJI34gc3dhcCBkb3RzIGJ5IHNwYWNlcw0KCSRfID1+IHMvXC4vIC9nOw0KCSN+IHNwbGl0IHRoZSBsaW5lIGJ5IHNwYWNlcw0KCUBsaW5lID0gc3BsaXQgKC8gLywgJF8pOw0KCSN+IHNhdmUgdGhlIDd0aCB2YWx1ZQ0KCXB1c2ggKEB2YWx1ZXMsICRsaW5lWzddKTsNCn0NCg0KZm9yZWFjaCAoQHZhbHVlcykgew0KCSN+IHByaW50ICIkXyI7DQoJJFBJRCA9ICcnOw0KCSRQSUQgLj0gYHNubXBnZXQgLXYyYyAtYyAkY29tbXVuaXR5IC1PdnEgJHRhcmdldF9pcCBtaWItMi40Ny4xLjEuMS4xLjEzLiRfYDsNCgkkUElEIC49IGBzbm1wZ2V0IC12MmMgLWMgJGNvbW11bml0eSAtT3ZxICR0YXJnZXRfaXAgbWliLTIuNDcuMS4xLjEuMS4xMS4kX2A7DQoJJFBJRCA9fiBzL1wifFxufFw8fFw+fFwmfFxbfFxdLy9nOw0KDQoJaWYgKCRQSUQgbmUgIiIgKSB7DQoJCSRyZXN1bHQgPSAnJzsNCgkJIyRyZXN1bHQgLj0gYHNubXBnZXQgLXYyYyAtYyAkY29tbXVuaXR5IC1PdnEgJHRhcmdldF9pcCBzeXNOYW1lLjBgIC4gJzsnOw0KCQkkcmVzdWx0IC49IGBzbm1wZ2V0IC12MmMgLWMgJGNvbW11bml0eSAtT3ZxICR0YXJnZXRfaXAgbWliLTIuNDcuMS4xLjEuMS43LiRfYCAuICc7JzsNCgkJIyRyZXN1bHQgLj0gYHNubXBnZXQgLXYyYyAtYyAkY29tbXVuaXR5IC1PdnEgJHRhcmdldF9pcCBtaWItMi40Ny4xLjEuMS4xLjIuJF9gIC4gJzsnOw0KCQkkcmVzdWx0IC49IGBzbm1wZ2V0IC12MmMgLWMgJGNvbW11bml0eSAtT3ZxICR0YXJnZXRfaXAgbWliLTIuNDcuMS4xLjEuMS4xMy4kX2AgLiAnOyc7DQoJCSRyZXN1bHQgLj0gYHNubXBnZXQgLXYyYyAtYyAkY29tbXVuaXR5IC1PdnEgJHRhcmdldF9pcCBtaWItMi40Ny4xLjEuMS4xLjExLiRfYDsNCgkJDQoJCSRyZXN1bHQgPX4gcy9cInxcbnxcPHxcPnxcJnxcW3xcXS8vZzsNCgkJcHJpbnQgJHJlc3VsdCAuICJcbiI7DQoJfQ0KfQ0KZXhpdCAwOw0K',0),(27,7,'Cisco&#x20;Interface&#x20;Remote&#x20;Inventory&#x20;SSH','Remote&#x20;inventory&#x20;module&#x20;to&#x20;get&#x20;all&#x20;cards&#x20;in&#x20;a&#x20;Cisco','/usr/bin/perl','Name;Card&#x20;Name;ID/Serial','IyEvdXNyL2Jpbi9wZXJsIAojCiMgKGMpIEFydGljYSAyMDE4CiMgVGhpcyBpcyBhbiBFbnRlcnByaXNlIGludmVudG9yeSBzY3JpcHQgZm9yIFBhbmRvcmEgRk1TIDdORwojIFRoaXMgc2NyaXB0IHdpbGwgY29sbGVjdCBhIHJlbW90ZSBDSVNDTyBjb25maWd1cmF0aW9uCiMgUkVNRU1CRVIgVE8gQUNUSVZBVEUgSVQgQVMgQkxPQ0sgTU9ERSAhISEKCnVzZSB3YXJuaW5nczsKdXNlIHN0cmljdDsKdXNlIE5ldDo6U1NIOjpFeHBlY3Q7CgojIExvYWQgY29uZmlnIGZyb20gY29tbWFuZCBsaW5lCmlmICgkI0FSR1YgIT0gMikgewogICAgcHJpbnQgIlVzYWdlOiAkMCA8VGFyZ2V0IElQPiA8VXNlcm5hbWU+IDxQYXNzd29yZD4gPEVuYWJsZSBwYXNzd29yZD5cbiI7CiAgICBleGl0IDE7Cn0KCm15ICR0aW1lb3V0ID0gNTsKbXkgJHRhcmdldCA9ICRBUkdWWzBdOwpteSAkdXNlcm5hbWUgPSAkQVJHVlsxXTsKbXkgJHBhc3N3b3JkID0gJEFSR1ZbMl07Cm15ICRlbmFibGVfcGFzcyA9ICRBUkdWWzNdOwoKbXkgJHNzaCA9IE5ldDo6U1NIOjpFeHBlY3QtPm5ldygKICAgIGhvc3QgPT4gJHRhcmdldCwKICAgIHVzZXIgPT4gJHVzZXJuYW1lLAogICAgcGFzc3dvcmQgPT4gJHBhc3N3b3JkLAogICAgcmF3X3B0eSA9PiAxLAogICAgdGltZW91dCA9PiAkdGltZW91dAopOwokc3NoLT5sb2dpbigxKSBvciBkaWUgIlVuYWJsZSB0byBzdGFydDogJCEiOwokc3NoLT5zZW5kKCJlbiIpOwokc3NoLT53YWl0Zm9yKCcvUGFzc3dvcmQ6L2knKTsKJHNzaC0+c2VuZCgkZW5hYmxlX3Bhc3MpOwokc3NoLT53YWl0Zm9yKCcvXCMvJyk7CiRzc2gtPnNlbmQoInRlcm1pbmFsIGxlbmd0aCAwIik7CiRzc2gtPndhaXRmb3IoJy9cIy8nKTsKJHNzaC0+ZWF0KCRzc2gtPnBlZWsoKSk7ICMgdG8gcmVtb3ZlIGN1cnJlbnQgb3V0cHV0CiRzc2gtPnNlbmQoInNob3cgcnVubmluZy1jb25maWciKTsKCiMgcmV0dXJucyB0aGUgbmV4dCBsaW5lLCByZW1vdmluZyBpdCBmcm9tIHRoZSBpbnB1dCBzdHJlYW06Cm15ICRsaW5lOwokc3NoLT5yZWFkX2xpbmUoKTsgIyB0byByZW1vdmUgc2hvdyBydW5uaW5nLWNvbmZpZwp3aGlsZSAoZGVmaW5lZCgkbGluZSA9ICRzc2gtPnJlYWRfbGluZSgpKSkgewogICAgcHJpbnQgJGxpbmUgLiAiXG4iOwp9Cg==',0),(28,7,'Cisco&#x20;Inventory','Get&#x20;remote&#x20;device&#x20;information&#x20;about&#x20;the&#x20;cisco&#x20;device','/usr/bin/perl','IP;Hardware;SerialNumber;IOS','IyEvdXNyL2Jpbi9wZXJsDQoNCiNJbmZvcm1hY2lvbiBkZWwgRXF1aXBvDQojSVA7SGFyZHdhcmU7U2VyaWFsTnVtYmVyO0lPUw0KDQpteSAkdGFyZ2V0X2lwID0gJEFSR1ZbMF07DQpteSAkY29tbXVuaXR5ID0gJEFSR1ZbMV07DQoNCiRyZXN1bHQgPSAnJzsNCiMkcmVzdWx0IC49IGBzbm1wZ2V0IC12MmMgLWMgJGNvbW11bml0eSAtT3ZxICR0YXJnZXRfaXAgc3lzTmFtZS4wYCAuICc7JzsNCiRyZXN1bHQgLj0gJHRhcmdldF9pcCAuICc7JzsNCiRlcnJvciA9ICcnOw0KJGVycm9yIC49IGBzbm1wZ2V0IC12MmMgLWMgJGNvbW11bml0eSAtT3ZxICR0YXJnZXRfaXAgbWliLTIuNDcuMS4xLjEuMS4yLjEgfCBncmVwIGV4aXN0c2A7DQokc2VyaWFsID0gJyc7DQokc2VyaWFsIC49IGBzbm1wZ2V0IC12MmMgLWMgJGNvbW11bml0eSAtT3ZxICR0YXJnZXRfaXAgbWliLTIuNDcuMS4xLjEuMS4xMS4xYDsNCiRzZXJpYWwgPX4gcy9cInxcbnxcPHxcPnxcJnxcW3xcXS8vZzsNCg0KaWYgKCRlcnJvciBlcSAiIiAmJiAkc2VyaWFsIG5lICIiKXsNCiAgICAkcmVzdWx0IC49IGBzbm1wZ2V0IC12MmMgLWMgJGNvbW11bml0eSAtT3ZxICR0YXJnZXRfaXAgbWliLTIuNDcuMS4xLjEuMS4yLjFgIC4gJzsnOw0KICAgICRyZXN1bHQgLj0gYHNubXBnZXQgLXYyYyAtYyAkY29tbXVuaXR5IC1PdnEgJHRhcmdldF9pcCBtaWItMi40Ny4xLjEuMS4xLjExLjFgIC4gJzsnOw0KDQp9IGVsc2Ugew0KICAgICRWU1MgPSAnJzsNCiAgICAkVlNTIC49IGBzbm1wZ2V0IC12MmMgLWMgJGNvbW11bml0eSAtT3ZxICR0YXJnZXRfaXAgbWliLTIuNDcuMS4xLjEuMS4yLjEgfCBncmVwIFZpcnR1YWxgOw0KICAgIGlmICgkVlNTIGVxICIiKSB7DQogICAgICAgICRyZXN1bHQgLj0gYHNubXBnZXQgLXYyYyAtYyAkY29tbXVuaXR5IC1PdnEgJHRhcmdldF9pcCBtaWItMi40Ny4xLjEuMS4xLjIuMTAwMWAgLiAnOyc7DQogICAgICAgICRyZXN1bHQgLj0gYHNubXBnZXQgLXYyYyAtYyAkY29tbXVuaXR5IC1PdnEgJHRhcmdldF9pcCBtaWItMi40Ny4xLjEuMS4xLjExLjEwMDFgIC4gJzsnOw0KICAgIH0gZWxzZSB7DQogICAgICAgICRyZXN1bHQgLj0gYHNubXBnZXQgLXYyYyAtYyAkY29tbXVuaXR5IC1PdnEgJHRhcmdldF9pcCBtaWItMi40Ny4xLjEuMS4xLjIuMWAgLiAnOyc7DQogICAgICAgICRyZXN1bHQgLj0gYHNubXBnZXQgLXYyYyAtYyAkY29tbXVuaXR5IC1PdnEgJHRhcmdldF9pcCBtaWItMi40Ny4xLjEuMS4xLjExLjJgIC4gJzsnOw0KICAgIH0NCn0NCg0KJHJlc3VsdCAuPSBgc25tcGdldCAtdjJjIC1jICRjb21tdW5pdHkgLU92cSAkdGFyZ2V0X2lwIHN5c0Rlc2NyLjAgfCBncmVwIElPU2A7DQokcmVzdWx0ID1+IHMvXCJ8XG58XDx8XD58XCZ8XFt8XF0vL2c7DQpwcmludCAkcmVzdWx0IC4gIlxuIjsNCmV4aXQgMDsNCg==',0),(29,1,'IP','IP&#x20;address','','Interface;Address','',0),(30,1,'Routes','Routes&#x20;table','','Destination;Gateway;Mask;Flags;Metric;Use;Interface','',0),(31,7,'Cisco&#x20;Configuration','This&#x20;script&#x20;will&#x20;collect&#x20;a&#x20;remote&#x20;CISCO&#x20;configuration','/usr/bin/perl','Configuration&#x20;dump','IyEvdXNyL2Jpbi9wZXJsIAojCiMgKGMpIEFydGljYSAyMDE0CiMgVGhpcyBpcyBhbiBFbnRlcnByaXNlIGludmVudG9yeSBzY3JpcHQgZm9yIFBhbmRvcmEgRk1TIDUKIyBUaGlzIHNjcmlwdCB3aWxsIGNvbGxlY3QgYSByZW1vdGUgQ0lTQ08gY29uZmlndXJhdGlvbgojIFJFTUVNQkVSIFRPIEFDVElWQVRFIElUIEFTIEJMT0NLIE1PREUgISEhCgp1c2Ugd2FybmluZ3M7CnVzZSBzdHJpY3Q7CnVzZSBOZXQ6OlRlbG5ldDsKCm15ICR0YXJnZXQgPSAiIjsKbXkgJGxvZ2luX3Bhc3MgPSAiIjsKbXkgJGVuYWJsZV9wYXNzID0gIiI7Cm15ICRvdXRwdXRfZmlsZSA9ICIvdG1wL2Npc2NvIi4kJDsKbXkgJFRJTUVPVVQ9NTsKCiMgTG9hZCBjb25maWcgZmlsZSBmcm9tIGNvbW1hbmQgbGluZQppZiAoJCNBUkdWIDwgMiAgKXsKICAgICAgICBwcmludCAiSSBuZWVkIHNldmVyYWwgcGFyYW1ldGVycyBpbiB0aGlzIGZvcm1hdDogXG5cbiI7CglwcmludCAiICAgICAgZ2V0X2NvbmZpZy5wbCA8aXBfYWRkcmVzcz4gPGxvZ2luX3Bhc3M+IDxlbmFibGVfcGFzcz4gXG5cbiI7CiAgICAgICAgZXhpdDsKfQoKJHRhcmdldCA9ICRBUkdWWzBdOwokbG9naW5fcGFzcyA9ICRBUkdWWzFdOwokZW5hYmxlX3Bhc3MgPSAkQVJHVlsyXTsKCm15ICR0ZWxuZXQgPSBuZXcgTmV0OjpUZWxuZXQgKCBUaW1lb3V0PT4kVElNRU9VVCwgRXJybW9kZT0+J3JldHVybicpOyAKJHRlbG5ldC0+b3BlbigkdGFyZ2V0KTsgCiR0ZWxuZXQtPndhaXRmb3IoJy9QYXNzd29yZDovaScpOyAKJHRlbG5ldC0+cHJpbnQoJGxvZ2luX3Bhc3MpOyAKCiR0ZWxuZXQtPndhaXRmb3IoJy9cPiQvaScpOyAKJHRlbG5ldC0+cHJpbnQoJ2VuJyk7CiR0ZWxuZXQtPndhaXRmb3IoJy9QYXNzd29yZDovaScpOwokdGVsbmV0LT5wcmludCgkZW5hYmxlX3Bhc3MpOwokdGVsbmV0LT53YWl0Zm9yKCcvXCMvJyk7CiR0ZWxuZXQtPmNtZF9yZW1vdmVfbW9kZSgxKTsKCiR0ZWxuZXQtPnByaW50KCdzaG93IHJ1bm5pbmctY29uZmlnJyk7CgpteSAkZmggPSAkdGVsbmV0LT5pbnB1dF9sb2coJG91dHB1dF9maWxlKTsKbXkgJG91dHB1dCA9IDE7Cgp3aGlsZSAoZGVmaW5lZCgkb3V0cHV0KSl7Cgkkb3V0cHV0ID0gJHRlbG5ldC0+d2FpdGZvcignL01vcmUvaScpOyAKCSR0ZWxuZXQtPnByaW50KCIiKTsgCn0KCm15ICRidWZmZXIgPSAiIjsKCm9wZW4gT1VURiwgJG91dHB1dF9maWxlOwp3aGlsZSAoPE9VVEY+KSB7CgkkXyA9fiBzL1x4MDgvL2c7CgkkXyA9fiBzL1wtXC1Nb3JlXC1cLVtcdFxzXSovL2c7CgkkXyA9fiBzL1w7Ly9nOwoJJGJ1ZmZlciA9ICRidWZmZXIgLiAkXzsKfQpjbG9zZSAoT1VURik7Cgp1bmxpbmsgKCRvdXRwdXRfZmlsZSk7CnByaW50ICRidWZmZXI7Cg==',1),(32,9,'Motherboard','This&#x20;script&#x20;retrieves&#x20;the&#x20;manufacturer,model&#x20;and&#x20;ID&#x20;from&#x20;the&#x20;motherboard&#x20;of&#x20;a&#x20;Windows&#x20;system','/usr/bin/perl','Manufacturer;Model;ID','IyEvdXNyL2Jpbi9wZXJsCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMgcGFuZG9yYV9tb3RoZXJib2FyZC5wbAojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwojIENvcHlyaWdodCAoYykgMjAxNSBCb3JqYSBTYW5jaGV6IDxmYm9yamEuc2FuY2hlekBhcnRpY2EuZXM+CiMgICAgICAgICAgIChjKSAyMDE1IEFydGljYSBTb2x1Y2lvbmVzIFRlY25vbG9naWNhcyBTLkwKIwojIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKIyBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQojIGFzIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyB2ZXJzaW9uIDIuCiMKIyBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKIyBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgojIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUKIyBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgojIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCiMgYWxvbmcgd2l0aCB0aGlzIHByb2dyYW07IGlmIG5vdCwgd3JpdGUgdG8gdGhlIEZyZWUgU29mdHdhcmUKIyBGb3VuZGF0aW9uLCBJbmMuLCA1MSBGcmFua2xpbiBTdHJlZXQsIEZpZnRoIEZsb29yLCBCb3N0b24sIE1BICAwMjExMC0xMzAxLCBVU0EuCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCgojdXNlIHN0cmljdDsKdXNlIHdhcm5pbmdzOwoKdXNlIEZpbGU6OkJhc2VuYW1lOwp1c2UgSFRNTDo6RW50aXRpZXMgKCk7CgojIENoZWNrIGZvciB3bWljCm15ICR3bWlfY2xpZW50ID0gIndtaWMiOwppZiAoc3lzdGVtKCIkd21pX2NsaWVudCA+IC9kZXYvbnVsbCAyPiYxIikgIT0gMjU2KSB7CglwcmludCAiW2Vycm9yXSAkd21pX2NsaWVudCBub3QgZm91bmQuXG4iOwoJZXhpdCAxOwp9CgppZiAoJCNBUkdWICE9IDIpIHsKCXByaW50ICJVc2FnZTogJDAgPHRhcmdldCBpcD4gPHVzZXJuYW1lPiA8cGFzc3dvcmQ+XG4iOwoJZXhpdCAxOwp9CgpteSAkdGFyZ2V0X2lwID0gJEFSR1ZbMF07Cm15ICR1c2VybmFtZSA9ICRBUkdWWzFdOwpteSAkcGFzc3dvcmQgPSAkQVJHVlsyXTsKCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMgU1VCIHJ1bl9xdWVyeSAoJHdxbF9xdWVyeSkKIyBSdW5zIHRoZSBnaXZlbiBXUUwgcXVlcnkgYW5kIHJldHVybnMgdGhlIHJlc3VsdCBhcyBhbiBhcnJheSBvZiBoYXNoZXMuCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCnN1YiBydW5fcXVlcnkgewoJbXkgJHdxbF9xdWVyeSA9ICRfWzBdOwoJbXkgQHJlc3VsdCA9IHt9OwoKCSR3cWxfcXVlcnkgPX4gJ3MvIi9cJy9nJzsKCgkjIFJ1biB0aGUgRENPTS9XTUkgY2xpZW50CglteSAkb3V0cHV0ID0gYCR3bWlfY2xpZW50IC1VICckdXNlcm5hbWUnJSckcGFzc3dvcmQnIC8vJHRhcmdldF9pcCBcIiR3cWxfcXVlcnlcIiAyPi9kZXYvbnVsbGA7CgoJbXkgQGxpbmVzID0gc3BsaXQoL1xuLywgJG91dHB1dCk7CgkjIEhlYWRlciwgZGVzY3JpcHRpb24sIHJlc3VsdHMKCWlmICgkI2xpbmVzIDwgMikgewoJCWV4aXQgMTsKCX0KCSMgRHJvcCB0aGUgaGVhZGVyCglzaGlmdCAoQGxpbmVzKTsKCQkKCSMgR2V0IGNvbHVtbiBuYW1lcwoJbXkgQGNvbHVtbl9uYW1lcyA9IHNwbGl0KC9cfC8sIHNoaWZ0IChAbGluZXMpKTsKCgkjIEdldCByb3cgZGF0YQoJbXkgJGlkeCA9IDA7Cglmb3IgKG15ICRpID0gMDsgJGkgPD0gJCNsaW5lczsgJGkrKykgewoJCSMgQ2hlY2sgZm9yIGVycm9ycwoJCWlmICgkbGluZXNbJGldID1+IG0vXkVSUk9SLykgewoJCQlleGl0IDE7CgkJfQoKCQkjIEJsYWNrIGxpc3QKCQlpZiAoJGxpbmVzWyRpXSA9fiBtL0ZpbGUgMS8pIHsKCQkJbmV4dDsKCQl9CgkJbXkgQGNvbHVtbiA9IHNwbGl0KC9cfC8sICRsaW5lc1skaV0pOwoJCWZvciAobXkgJGogPSAwOyAkaiA8PSAkI2NvbHVtbl9uYW1lczsgJGorKykgewoJCQlpZiAoISBkZWZpbmVkKCRjb2x1bW5bJGpdKSkgewoJCQkJJHJlc3VsdFskaWR4XS0+eyRjb2x1bW5fbmFtZXNbJGpdfSA9ICIiOwoJCQl9CgkJCWVsc2UgewoJCQkJJHJlc3VsdFskaWR4XS0+eyRjb2x1bW5fbmFtZXNbJGpdfSA9ICRjb2x1bW5bJGpdOwoJCQl9CgkJfQoJCQoJCSRpZHgrKzsKCX0KCQoJcmV0dXJuIEByZXN1bHQ7Cn0KCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMgU1VCIHByaW50X21vZHVsZWRhdGEgKCRtb2R1bGVfaXRlbSwgJG1vZHVsZV9kYXRhLCAKIyAkbW9kdWxlX2Rlc2NyaXB0aW9uLCBAZGF0YSkKIyBQcmludHMgYSBtb2R1bGVkYXRhIFhNTCB0YWcuICRtb2R1bGVfaXRlbSwgJG1vZHVsZV9kYXRhIGFuZAojICRtb2R1bGVfZGVzY3JpcHRpb24gYXJlIHVzZWQgdG8gaW5kZXggdGhlIGl0ZW0sIGRhdGEgYW5kIGRlc2NyaXB0aW9uCiMgWE1MIHRhZ3MgcmVzcGVjdGl2ZWx5LgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwpzdWIgcHJpbnRfbW9kdWxlZGF0YSB7CglteSBAbW9kdWxlX2hlYWRlcnMgPSBAeyRfWzBdfTsKCW15IEBtb2R1bGVfdW5pdHMgICA9IEB7JF9bMV19OwoJbXkgQGRhdGEgICAgICAgICAgID0gQHskX1syXX07CglteSAkcmVzdWx0OwoJZm9yZWFjaCBteSAkZWxlbWVudCAoQGRhdGEpIHsKCQkkcmVzdWx0ID0gJyc7CgkJZm9yICgkaT0wOyAkaTxAbW9kdWxlX2hlYWRlcnM7JGkrKykgewoJCQlpZiAoZGVmaW5lZCAoJGVsZW1lbnQtPnskbW9kdWxlX2hlYWRlcnNbJGldfSkpIHsKCQkJCSRyZXN1bHQgLj0gJGVsZW1lbnQtPnskbW9kdWxlX2hlYWRlcnNbJGldfSAuICRtb2R1bGVfdW5pdHNbJGldIC4gJzsnOwoJCQl9CgkJCWVsc2UgewoJCQkJJHJlc3VsdCAuPSAnOyc7CgkJCX0KCQl9CgkJY2hvcCgkcmVzdWx0KTsKCQlwcmludCAkcmVzdWx0IC4gIlxuIjsJCgl9Cn0KCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMgTWFpbgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwoKbXkgQHJlc3VsdCAgPSBydW5fcXVlcnkoIlNFTEVDVCAqIEZST00gV2luMzJfY29tcHV0ZXJzeXN0ZW0iKTsKIyBSZW1lbWJlciB0byBtYXRjaCBsZW5naHQgb2YgYm90aCBhcnJheXMgaGVhZGVycyAmIHVuaXRzCm15IEBoZWFkZXJzID0gKCJNYW51ZmFjdHVyZXIiLCJNb2RlbCIsIk9FTVN0cmluZ0FycmF5Iik7Cm15IEB1bml0cyAgID0gKCIiLCIiLCIiKTsKcHJpbnRfbW9kdWxlZGF0YSAoXEBoZWFkZXJzLFxAdW5pdHMsIFxAcmVzdWx0KTsKZXhpdCAwOwo=',0),(33,9,'Monitors','Retrieve&#x20;all&#x20;monitor&#x20;info&#x20;from&#x20;a&#x20;Windows&#x20;system.','/usr/bin/perl','Model;ID','IyEvdXNyL2Jpbi9wZXJsCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMgcGFuZG9yYV9tb25pdG9ycy5wbAojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwojIENvcHlyaWdodCAoYykgMjAxNSBCb3JqYSBTYW5jaGV6IDxmYm9yamEuc2FuY2hlekBhcnRpY2EuZXM+CiMgICAgICAgICAgIChjKSAyMDE1IEFydGljYSBTb2x1Y2lvbmVzIFRlY25vbG9naWNhcyBTLkwKIwojIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKIyBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQojIGFzIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyB2ZXJzaW9uIDIuCiMKIyBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKIyBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgojIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUKIyBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgojIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCiMgYWxvbmcgd2l0aCB0aGlzIHByb2dyYW07IGlmIG5vdCwgd3JpdGUgdG8gdGhlIEZyZWUgU29mdHdhcmUKIyBGb3VuZGF0aW9uLCBJbmMuLCA1MSBGcmFua2xpbiBTdHJlZXQsIEZpZnRoIEZsb29yLCBCb3N0b24sIE1BICAwMjExMC0xMzAxLCBVU0EuCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCgojdXNlIHN0cmljdDsKdXNlIHdhcm5pbmdzOwoKdXNlIEZpbGU6OkJhc2VuYW1lOwp1c2UgSFRNTDo6RW50aXRpZXMgKCk7CgojIENoZWNrIGZvciB3bWljCm15ICR3bWlfY2xpZW50ID0gIndtaWMiOwppZiAoc3lzdGVtKCIkd21pX2NsaWVudCA+IC9kZXYvbnVsbCAyPiYxIikgIT0gMjU2KSB7CglwcmludCAiW2Vycm9yXSAkd21pX2NsaWVudCBub3QgZm91bmQuXG4iOwoJZXhpdCAxOwp9CgppZiAoJCNBUkdWICE9IDIpIHsKCXByaW50ICJVc2FnZTogJDAgPHRhcmdldCBpcD4gPHVzZXJuYW1lPiA8cGFzc3dvcmQ+XG4iOwoJZXhpdCAxOwp9CgpteSAkdGFyZ2V0X2lwID0gJEFSR1ZbMF07Cm15ICR1c2VybmFtZSA9ICRBUkdWWzFdOwpteSAkcGFzc3dvcmQgPSAkQVJHVlsyXTsKCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMgU1VCIHJ1bl9xdWVyeSAoJHdxbF9xdWVyeSkKIyBSdW5zIHRoZSBnaXZlbiBXUUwgcXVlcnkgYW5kIHJldHVybnMgdGhlIHJlc3VsdCBhcyBhbiBhcnJheSBvZiBoYXNoZXMuCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCnN1YiBydW5fcXVlcnkgewoJbXkgJHdxbF9xdWVyeSA9ICRfWzBdOwoJbXkgQHJlc3VsdCA9IHt9OwoKCSR3cWxfcXVlcnkgPX4gJ3MvIi9cJy9nJzsKCgkjIFJ1biB0aGUgRENPTS9XTUkgY2xpZW50CglteSAkb3V0cHV0ID0gYCR3bWlfY2xpZW50IC1VICckdXNlcm5hbWUnJSckcGFzc3dvcmQnIC8vJHRhcmdldF9pcCBcIiR3cWxfcXVlcnlcIiAyPi9kZXYvbnVsbGA7CgoJbXkgQGxpbmVzID0gc3BsaXQoL1xuLywgJG91dHB1dCk7CgkjIEhlYWRlciwgZGVzY3JpcHRpb24sIHJlc3VsdHMKCWlmICgkI2xpbmVzIDwgMikgewoJCWV4aXQgMTsKCX0KCSMgRHJvcCB0aGUgaGVhZGVyCglzaGlmdCAoQGxpbmVzKTsKCQkKCSMgR2V0IGNvbHVtbiBuYW1lcwoJbXkgQGNvbHVtbl9uYW1lcyA9IHNwbGl0KC9cfC8sIHNoaWZ0IChAbGluZXMpKTsKCgkjIEdldCByb3cgZGF0YQoJbXkgJGlkeCA9IDA7Cglmb3IgKG15ICRpID0gMDsgJGkgPD0gJCNsaW5lczsgJGkrKykgewoJCSMgQ2hlY2sgZm9yIGVycm9ycwoJCWlmICgkbGluZXNbJGldID1+IG0vXkVSUk9SLykgewoJCQlleGl0IDE7CgkJfQoKCQkjIEJsYWNrIGxpc3QKCQlpZiAoJGxpbmVzWyRpXSA9fiBtL0ZpbGUgMS8pIHsKCQkJbmV4dDsKCQl9CgkJbXkgQGNvbHVtbiA9IHNwbGl0KC9cfC8sICRsaW5lc1skaV0pOwoJCWZvciAobXkgJGogPSAwOyAkaiA8PSAkI2NvbHVtbl9uYW1lczsgJGorKykgewoJCQlpZiAoISBkZWZpbmVkKCRjb2x1bW5bJGpdKSkgewoJCQkJJHJlc3VsdFskaWR4XS0+eyRjb2x1bW5fbmFtZXNbJGpdfSA9ICIiOwoJCQl9CgkJCWVsc2UgewoJCQkJJHJlc3VsdFskaWR4XS0+eyRjb2x1bW5fbmFtZXNbJGpdfSA9ICRjb2x1bW5bJGpdOwoJCQl9CgkJfQoJCQoJCSRpZHgrKzsKCX0KCQoJcmV0dXJuIEByZXN1bHQ7Cn0KCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMgU1VCIHByaW50X21vZHVsZWRhdGEgKCRtb2R1bGVfaXRlbSwgJG1vZHVsZV9kYXRhLCAKIyAkbW9kdWxlX2Rlc2NyaXB0aW9uLCBAZGF0YSkKIyBQcmludHMgYSBtb2R1bGVkYXRhIFhNTCB0YWcuICRtb2R1bGVfaXRlbSwgJG1vZHVsZV9kYXRhIGFuZAojICRtb2R1bGVfZGVzY3JpcHRpb24gYXJlIHVzZWQgdG8gaW5kZXggdGhlIGl0ZW0sIGRhdGEgYW5kIGRlc2NyaXB0aW9uCiMgWE1MIHRhZ3MgcmVzcGVjdGl2ZWx5LgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwpzdWIgcHJpbnRfbW9kdWxlZGF0YSB7CglteSBAbW9kdWxlX2hlYWRlcnMgPSBAeyRfWzBdfTsKCW15IEBtb2R1bGVfdW5pdHMgICA9IEB7JF9bMV19OwoJbXkgQGRhdGEgICAgICAgICAgID0gQHskX1syXX07CglteSAkcmVzdWx0OwoJZm9yZWFjaCBteSAkZWxlbWVudCAoQGRhdGEpIHsKCQkkcmVzdWx0ID0gJyc7CgkJZm9yICgkaT0wOyAkaTxAbW9kdWxlX2hlYWRlcnM7JGkrKykgewoJCQlpZiAoZGVmaW5lZCAoJGVsZW1lbnQtPnskbW9kdWxlX2hlYWRlcnNbJGldfSkpIHsKCQkJCSRyZXN1bHQgLj0gJGVsZW1lbnQtPnskbW9kdWxlX2hlYWRlcnNbJGldfSAuICRtb2R1bGVfdW5pdHNbJGldIC4gJzsnOwoJCQl9CgkJCWVsc2UgewoJCQkJJHJlc3VsdCAuPSAnOyc7CgkJCX0KCQl9CgkJY2hvcCgkcmVzdWx0KTsKCQlwcmludCAkcmVzdWx0IC4gIlxuIjsJCgl9Cn0KCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMgTWFpbgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwoKbXkgQHJlc3VsdCAgPSBydW5fcXVlcnkoIlNFTEVDVCBOYW1lLFBOUERldmljZUlEIEZST00gV2luMzJfRGVza3RvcE1vbml0b3IiKTsKIyBSZW1lbWJlciB0byBtYXRjaCBsZW5naHQgb2YgYm90aCBhcnJheXMgaGVhZGVycyAmIHVuaXRzCm15IEBoZWFkZXJzID0gKCJOYW1lIiwiUE5QRGV2aWNlSUQiKTsKbXkgQHVuaXRzICAgPSAoIiIsIiIpOwpwcmludF9tb2R1bGVkYXRhIChcQGhlYWRlcnMsXEB1bml0cywgXEByZXN1bHQpOwpleGl0IDA7Cgo=',0),(34,9,'Printers','Retrieve&#x20;all&#x20;printers&#x20;of&#x20;a&#x20;Windows&#x20;system','/usr/bin/perl','Name;Driver;Port','IyEvdXNyL2Jpbi9wZXJsCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMgcGFuZG9yYV9wcmludGVycy5wbAojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwojIENvcHlyaWdodCAoYykgMjAxNSBCb3JqYSBTYW5jaGV6IDxmYm9yamEuc2FuY2hlekBhcnRpY2EuZXM+CiMgICAgICAgICAgIChjKSAyMDA4IEFydGljYSBTb2x1Y2lvbmVzIFRlY25vbG9naWNhcyBTLkwKIwojIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKIyBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQojIGFzIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyB2ZXJzaW9uIDIuCiMKIyBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKIyBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgojIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUKIyBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgojIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCiMgYWxvbmcgd2l0aCB0aGlzIHByb2dyYW07IGlmIG5vdCwgd3JpdGUgdG8gdGhlIEZyZWUgU29mdHdhcmUKIyBGb3VuZGF0aW9uLCBJbmMuLCA1MSBGcmFua2xpbiBTdHJlZXQsIEZpZnRoIEZsb29yLCBCb3N0b24sIE1BICAwMjExMC0xMzAxLCBVU0EuCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCgojdXNlIHN0cmljdDsKdXNlIHdhcm5pbmdzOwoKdXNlIEZpbGU6OkJhc2VuYW1lOwp1c2UgSFRNTDo6RW50aXRpZXMgKCk7CgojIENoZWNrIGZvciB3bWljCm15ICR3bWlfY2xpZW50ID0gIndtaWMiOwppZiAoc3lzdGVtKCIkd21pX2NsaWVudCA+IC9kZXYvbnVsbCAyPiYxIikgIT0gMjU2KSB7CglwcmludCAiW2Vycm9yXSAkd21pX2NsaWVudCBub3QgZm91bmQuXG4iOwoJZXhpdCAxOwp9CgppZiAoJCNBUkdWICE9IDIpIHsKCXByaW50ICJVc2FnZTogJDAgPHRhcmdldCBpcD4gPHVzZXJuYW1lPiA8cGFzc3dvcmQ+XG4iOwoJZXhpdCAxOwp9CgpteSAkdGFyZ2V0X2lwID0gJEFSR1ZbMF07Cm15ICR1c2VybmFtZSA9ICRBUkdWWzFdOwpteSAkcGFzc3dvcmQgPSAkQVJHVlsyXTsKCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMgU1VCIHJ1bl9xdWVyeSAoJHdxbF9xdWVyeSkKIyBSdW5zIHRoZSBnaXZlbiBXUUwgcXVlcnkgYW5kIHJldHVybnMgdGhlIHJlc3VsdCBhcyBhbiBhcnJheSBvZiBoYXNoZXMuCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCnN1YiBydW5fcXVlcnkgewoJbXkgJHdxbF9xdWVyeSA9ICRfWzBdOwoJbXkgQHJlc3VsdCA9IHt9OwoKCSR3cWxfcXVlcnkgPX4gJ3MvIi9cJy9nJzsKCgkjIFJ1biB0aGUgRENPTS9XTUkgY2xpZW50CglteSAkb3V0cHV0ID0gYCR3bWlfY2xpZW50IC1VICckdXNlcm5hbWUnJSckcGFzc3dvcmQnIC8vJHRhcmdldF9pcCBcIiR3cWxfcXVlcnlcIiAyPi9kZXYvbnVsbGA7CgoJbXkgQGxpbmVzID0gc3BsaXQoL1xuLywgJG91dHB1dCk7CgkjIEhlYWRlciwgZGVzY3JpcHRpb24sIHJlc3VsdHMKCWlmICgkI2xpbmVzIDwgMikgewoJCWV4aXQgMTsKCX0KCSMgRHJvcCB0aGUgaGVhZGVyCglzaGlmdCAoQGxpbmVzKTsKCQkKCSMgR2V0IGNvbHVtbiBuYW1lcwoJbXkgQGNvbHVtbl9uYW1lcyA9IHNwbGl0KC9cfC8sIHNoaWZ0IChAbGluZXMpKTsKCgkjIEdldCByb3cgZGF0YQoJbXkgJGlkeCA9IDA7Cglmb3IgKG15ICRpID0gMDsgJGkgPD0gJCNsaW5lczsgJGkrKykgewoJCSMgQ2hlY2sgZm9yIGVycm9ycwoJCWlmICgkbGluZXNbJGldID1+IG0vXkVSUk9SLykgewoJCQlleGl0IDE7CgkJfQoKCQkjIEJsYWNrIGxpc3QKCQlpZiAoJGxpbmVzWyRpXSA9fiBtL0ZpbGUgMS8pIHsKCQkJbmV4dDsKCQl9CgkJbXkgQGNvbHVtbiA9IHNwbGl0KC9cfC8sICRsaW5lc1skaV0pOwoJCWZvciAobXkgJGogPSAwOyAkaiA8PSAkI2NvbHVtbl9uYW1lczsgJGorKykgewoJCQlpZiAoISBkZWZpbmVkKCRjb2x1bW5bJGpdKSkgewoJCQkJJHJlc3VsdFskaWR4XS0+eyRjb2x1bW5fbmFtZXNbJGpdfSA9ICIiOwoJCQl9CgkJCWVsc2UgewoJCQkJJHJlc3VsdFskaWR4XS0+eyRjb2x1bW5fbmFtZXNbJGpdfSA9ICRjb2x1bW5bJGpdOwoJCQl9CgkJfQoJCQoJCSRpZHgrKzsKCX0KCQoJcmV0dXJuIEByZXN1bHQ7Cn0KCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMgU1VCIHByaW50X21vZHVsZWRhdGEgKCRtb2R1bGVfaXRlbSwgJG1vZHVsZV9kYXRhLCAKIyAkbW9kdWxlX2Rlc2NyaXB0aW9uLCBAZGF0YSkKIyBQcmludHMgYSBtb2R1bGVkYXRhIFhNTCB0YWcuICRtb2R1bGVfaXRlbSwgJG1vZHVsZV9kYXRhIGFuZAojICRtb2R1bGVfZGVzY3JpcHRpb24gYXJlIHVzZWQgdG8gaW5kZXggdGhlIGl0ZW0sIGRhdGEgYW5kIGRlc2NyaXB0aW9uCiMgWE1MIHRhZ3MgcmVzcGVjdGl2ZWx5LgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwpzdWIgcHJpbnRfbW9kdWxlZGF0YSB7CglteSBAbW9kdWxlX2hlYWRlcnMgPSBAeyRfWzBdfTsKCW15IEBtb2R1bGVfdW5pdHMgICA9IEB7JF9bMV19OwoJbXkgQGRhdGEgICAgICAgICAgID0gQHskX1syXX07CglteSAkcmVzdWx0OwoJZm9yZWFjaCBteSAkZWxlbWVudCAoQGRhdGEpIHsKCQkkcmVzdWx0ID0gJyc7CgkJZm9yICgkaT0wOyAkaTxAbW9kdWxlX2hlYWRlcnM7JGkrKykgewoJCQlpZiAoZGVmaW5lZCAoJGVsZW1lbnQtPnskbW9kdWxlX2hlYWRlcnNbJGldfSkpIHsKCQkJCSRyZXN1bHQgLj0gJGVsZW1lbnQtPnskbW9kdWxlX2hlYWRlcnNbJGldfSAuICRtb2R1bGVfdW5pdHNbJGldIC4gJzsnOwoJCQl9CgkJCWVsc2UgewoJCQkJJHJlc3VsdCAuPSAnOyc7CgkJCX0KCQl9CgkJY2hvcCgkcmVzdWx0KTsKCQlwcmludCAkcmVzdWx0IC4gIlxuIjsJCgl9Cn0KCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMgTWFpbgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwoKbXkgQHJlc3VsdCAgPSBydW5fcXVlcnkoIlNFTEVDVCBDYXB0aW9uLERyaXZlck5hbWUsUG9ydE5hbWUgRlJPTSBXaW4zMl9wcmludGVyIik7CiMgUmVtZW1iZXIgdG8gbWF0Y2ggbGVuZ2h0IG9mIGJvdGggYXJyYXlzIGhlYWRlcnMgJiB1bml0cwpteSBAaGVhZGVycyA9ICgiQ2FwdGlvbiIsIkRyaXZlck5hbWUiLCJQb3J0TmFtZSIpOwpteSBAdW5pdHMgICA9ICgiIiwiIiwiIik7CnByaW50X21vZHVsZWRhdGEgKFxAaGVhZGVycyxcQHVuaXRzLCBcQHJlc3VsdCk7CmV4aXQgMDsK',0),(35,9,'product_key','Retrieve&#x20;the&#x20;Windows&#x20;product&#x20;key','/usr/bin/perl','Key','IyEvdXNyL2Jpbi9wZXJsCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMgcGFuZG9yYV9wcm9kdWN0a2V5LnBsCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMgQ29weXJpZ2h0IChjKSAyMDE1IEJvcmphIFNhbmNoZXosIDxmYm9yamEuc2FuY2hlekBhcnRpY2EuZXM+CiMgICAgICAgICAgIChjKSAyMDE1IEFydGljYSBTb2x1Y2lvbmVzIFRlY25vbG9naWNhcyBTLkwKIwojIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKIyBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQojIGFzIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyB2ZXJzaW9uIDIuCiMKIyBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKIyBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgojIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUKIyBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgojIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCiMgYWxvbmcgd2l0aCB0aGlzIHByb2dyYW07IGlmIG5vdCwgd3JpdGUgdG8gdGhlIEZyZWUgU29mdHdhcmUKIyBGb3VuZGF0aW9uLCBJbmMuLCA1MSBGcmFua2xpbiBTdHJlZXQsIEZpZnRoIEZsb29yLCBCb3N0b24sIE1BICAwMjExMC0xMzAxLCBVU0EuCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCgojdXNlIHN0cmljdDsKdXNlIHdhcm5pbmdzOwoKdXNlIEZpbGU6OkJhc2VuYW1lOwp1c2UgSFRNTDo6RW50aXRpZXMgKCk7CgojIENoZWNrIGZvciB3bWljCm15ICR3bWlfY2xpZW50ID0gIndtaWMiOwppZiAoc3lzdGVtKCIkd21pX2NsaWVudCA+IC9kZXYvbnVsbCAyPiYxIikgIT0gMjU2KSB7CglwcmludCAiW2Vycm9yXSAkd21pX2NsaWVudCBub3QgZm91bmQuXG4iOwoJZXhpdCAxOwp9CgppZiAoJCNBUkdWICE9IDIpIHsKCXByaW50ICJVc2FnZTogJDAgPHRhcmdldCBpcD4gPHVzZXJuYW1lPiA8cGFzc3dvcmQ+XG4iOwoJZXhpdCAxOwp9CgpteSAkdGFyZ2V0X2lwID0gJEFSR1ZbMF07Cm15ICR1c2VybmFtZSA9ICRBUkdWWzFdOwpteSAkcGFzc3dvcmQgPSAkQVJHVlsyXTsKCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMgU1VCIHJ1bl9xdWVyeSAoJHdxbF9xdWVyeSkKIyBSdW5zIHRoZSBnaXZlbiBXUUwgcXVlcnkgYW5kIHJldHVybnMgdGhlIHJlc3VsdCBhcyBhbiBhcnJheSBvZiBoYXNoZXMuCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCnN1YiBydW5fcXVlcnkgewoJbXkgJHdxbF9xdWVyeSA9ICRfWzBdOwoJbXkgQHJlc3VsdCA9IHt9OwoKCSR3cWxfcXVlcnkgPX4gJ3MvIi9cJy9nJzsKCgkjIFJ1biB0aGUgRENPTS9XTUkgY2xpZW50CglteSAkb3V0cHV0ID0gYCR3bWlfY2xpZW50IC1VICckdXNlcm5hbWUnJSckcGFzc3dvcmQnIC8vJHRhcmdldF9pcCBcIiR3cWxfcXVlcnlcIiAyPi9kZXYvbnVsbGA7CgoJbXkgQGxpbmVzID0gc3BsaXQoL1xuLywgJG91dHB1dCk7CgkjIEhlYWRlciwgZGVzY3JpcHRpb24sIHJlc3VsdHMKCWlmICgkI2xpbmVzIDwgMikgewoJCWV4aXQgMTsKCX0KCSMgRHJvcCB0aGUgaGVhZGVyCglzaGlmdCAoQGxpbmVzKTsKCQkKCSMgR2V0IGNvbHVtbiBuYW1lcwoJbXkgQGNvbHVtbl9uYW1lcyA9IHNwbGl0KC9cfC8sIHNoaWZ0IChAbGluZXMpKTsKCgkjIEdldCByb3cgZGF0YQoJbXkgJGlkeCA9IDA7Cglmb3IgKG15ICRpID0gMDsgJGkgPD0gJCNsaW5lczsgJGkrKykgewoJCSMgQ2hlY2sgZm9yIGVycm9ycwoJCWlmICgkbGluZXNbJGldID1+IG0vXkVSUk9SLykgewoJCQlleGl0IDE7CgkJfQoKCQkjIEJsYWNrIGxpc3QKCQlpZiAoJGxpbmVzWyRpXSA9fiBtL0ZpbGUgMS8pIHsKCQkJbmV4dDsKCQl9CgkJbXkgQGNvbHVtbiA9IHNwbGl0KC9cfC8sICRsaW5lc1skaV0pOwoJCWZvciAobXkgJGogPSAwOyAkaiA8PSAkI2NvbHVtbl9uYW1lczsgJGorKykgewoJCQlpZiAoISBkZWZpbmVkKCRjb2x1bW5bJGpdKSkgewoJCQkJJHJlc3VsdFskaWR4XS0+eyRjb2x1bW5fbmFtZXNbJGpdfSA9ICIiOwoJCQl9CgkJCWVsc2UgewoJCQkJJHJlc3VsdFskaWR4XS0+eyRjb2x1bW5fbmFtZXNbJGpdfSA9ICRjb2x1bW5bJGpdOwoJCQl9CgkJfQoJCQoJCSRpZHgrKzsKCX0KCQoJcmV0dXJuIEByZXN1bHQ7Cn0KCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMgU1VCIHByaW50X21vZHVsZWRhdGEgKCRtb2R1bGVfaXRlbSwgJG1vZHVsZV9kYXRhLCAKIyAkbW9kdWxlX2Rlc2NyaXB0aW9uLCBAZGF0YSkKIyBQcmludHMgYSBtb2R1bGVkYXRhIFhNTCB0YWcuICRtb2R1bGVfaXRlbSwgJG1vZHVsZV9kYXRhIGFuZAojICRtb2R1bGVfZGVzY3JpcHRpb24gYXJlIHVzZWQgdG8gaW5kZXggdGhlIGl0ZW0sIGRhdGEgYW5kIGRlc2NyaXB0aW9uCiMgWE1MIHRhZ3MgcmVzcGVjdGl2ZWx5LgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwpzdWIgcHJpbnRfbW9kdWxlZGF0YSB7CglteSBAbW9kdWxlX2hlYWRlcnMgPSBAeyRfWzBdfTsKCW15IEBtb2R1bGVfdW5pdHMgICA9IEB7JF9bMV19OwoJbXkgQGRhdGEgICAgICAgICAgID0gQHskX1syXX07CglteSAkcmVzdWx0OwoJZm9yZWFjaCBteSAkZWxlbWVudCAoQGRhdGEpIHsKCQkkcmVzdWx0ID0gJyc7CgkJZm9yICgkaT0wOyAkaTxAbW9kdWxlX2hlYWRlcnM7JGkrKykgewoJCQlpZiAoZGVmaW5lZCAoJGVsZW1lbnQtPnskbW9kdWxlX2hlYWRlcnNbJGldfSkpIHsKCQkJCSRyZXN1bHQgLj0gJGVsZW1lbnQtPnskbW9kdWxlX2hlYWRlcnNbJGldfSAuICRtb2R1bGVfdW5pdHNbJGldIC4gJzsnOwoJCQl9CgkJCWVsc2UgewoJCQkJJHJlc3VsdCAuPSAnOyc7CgkJCX0KCQl9CgkJY2hvcCgkcmVzdWx0KTsKCQlwcmludCAkcmVzdWx0IC4gIlxuIjsJCgl9Cn0KCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMgTWFpbgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwoKbXkgQHJlc3VsdCAgPSBydW5fcXVlcnkoIlNlbGVjdCBPQTN4T3JpZ2luYWxQcm9kdWN0S2V5IGZyb20gU29mdHdhcmVMaWNlbnNpbmdTZXJ2aWNlIik7CiMgUmVtZW1iZXIgdG8gbWF0Y2ggbGVuZ2h0IG9mIGJvdGggYXJyYXlzIGhlYWRlcnMgJiB1bml0cwpteSBAaGVhZGVycyA9ICgiT0EzeE9yaWdpbmFsUHJvZHVjdEtleSIpOwpteSBAdW5pdHMgICA9ICgiIik7CnByaW50X21vZHVsZWRhdGEgKFxAaGVhZGVycyxcQHVuaXRzLCBcQHJlc3VsdCk7CmV4aXQgMDsK',0),(36,9,'product_ID','Retrieve&#x20;the&#x20;Windows&#x20;product&#x20;ID','/usr/bin/perl','Key','IyEvdXNyL2Jpbi9wZXJsCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMgcGFuZG9yYV9wcm9kdWN0SUQucGwKIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIyBDb3B5cmlnaHQgKGMpIDIwMTUgQm9yamEgU2FuY2hleiwgPGZib3JqYS5zYW5jaGV6QGFydGljYS5lcz4KIyAgICAgICAgICAgKGMpIDIwMTUgQXJ0aWNhIFNvbHVjaW9uZXMgVGVjbm9sb2dpY2FzIFMuTAojCiMgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgojIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCiMgYXMgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IHZlcnNpb24gMi4KIwojIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAojIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCiMgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQojIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCiMgWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UKIyBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90LCB3cml0ZSB0byB0aGUgRnJlZSBTb2Z0d2FyZQojIEZvdW5kYXRpb24sIEluYy4sIDUxIEZyYW5rbGluIFN0cmVldCwgRmlmdGggRmxvb3IsIEJvc3RvbiwgTUEgIDAyMTEwLTEzMDEsIFVTQS4KIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKCiN1c2Ugc3RyaWN0Owp1c2Ugd2FybmluZ3M7Cgp1c2UgRmlsZTo6QmFzZW5hbWU7CnVzZSBIVE1MOjpFbnRpdGllcyAoKTsKCiMgQ2hlY2sgZm9yIHdtaWMKbXkgJHdtaV9jbGllbnQgPSAid21pYyI7CmlmIChzeXN0ZW0oIiR3bWlfY2xpZW50ID4gL2Rldi9udWxsIDI+JjEiKSAhPSAyNTYpIHsKCXByaW50ICJbZXJyb3JdICR3bWlfY2xpZW50IG5vdCBmb3VuZC5cbiI7CglleGl0IDE7Cn0KCmlmICgkI0FSR1YgIT0gMikgewoJcHJpbnQgIlVzYWdlOiAkMCA8dGFyZ2V0IGlwPiA8dXNlcm5hbWU+IDxwYXNzd29yZD5cbiI7CglleGl0IDE7Cn0KCm15ICR0YXJnZXRfaXAgPSAkQVJHVlswXTsKbXkgJHVzZXJuYW1lID0gJEFSR1ZbMV07Cm15ICRwYXNzd29yZCA9ICRBUkdWWzJdOwoKIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIyBTVUIgcnVuX3F1ZXJ5ICgkd3FsX3F1ZXJ5KQojIFJ1bnMgdGhlIGdpdmVuIFdRTCBxdWVyeSBhbmQgcmV0dXJucyB0aGUgcmVzdWx0IGFzIGFuIGFycmF5IG9mIGhhc2hlcy4KIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKc3ViIHJ1bl9xdWVyeSB7CglteSAkd3FsX3F1ZXJ5ID0gJF9bMF07CglteSBAcmVzdWx0ID0ge307CgoJJHdxbF9xdWVyeSA9fiAncy8iL1wnL2cnOwoKCSMgUnVuIHRoZSBEQ09NL1dNSSBjbGllbnQKCW15ICRvdXRwdXQgPSBgJHdtaV9jbGllbnQgLVUgJyR1c2VybmFtZSclJyRwYXNzd29yZCcgLy8kdGFyZ2V0X2lwIFwiJHdxbF9xdWVyeVwiIDI+L2Rldi9udWxsYDsKCglteSBAbGluZXMgPSBzcGxpdCgvXG4vLCAkb3V0cHV0KTsKCSMgSGVhZGVyLCBkZXNjcmlwdGlvbiwgcmVzdWx0cwoJaWYgKCQjbGluZXMgPCAyKSB7CgkJZXhpdCAxOwoJfQoJIyBEcm9wIHRoZSBoZWFkZXIKCXNoaWZ0IChAbGluZXMpOwoJCQoJIyBHZXQgY29sdW1uIG5hbWVzCglteSBAY29sdW1uX25hbWVzID0gc3BsaXQoL1x8Lywgc2hpZnQgKEBsaW5lcykpOwoKCSMgR2V0IHJvdyBkYXRhCglteSAkaWR4ID0gMDsKCWZvciAobXkgJGkgPSAwOyAkaSA8PSAkI2xpbmVzOyAkaSsrKSB7CgkJIyBDaGVjayBmb3IgZXJyb3JzCgkJaWYgKCRsaW5lc1skaV0gPX4gbS9eRVJST1IvKSB7CgkJCWV4aXQgMTsKCQl9CgoJCSMgQmxhY2sgbGlzdAoJCWlmICgkbGluZXNbJGldID1+IG0vRmlsZSAxLykgewoJCQluZXh0OwoJCX0KCQlteSBAY29sdW1uID0gc3BsaXQoL1x8LywgJGxpbmVzWyRpXSk7CgkJZm9yIChteSAkaiA9IDA7ICRqIDw9ICQjY29sdW1uX25hbWVzOyAkaisrKSB7CgkJCWlmICghIGRlZmluZWQoJGNvbHVtblskal0pKSB7CgkJCQkkcmVzdWx0WyRpZHhdLT57JGNvbHVtbl9uYW1lc1skal19ID0gIiI7CgkJCX0KCQkJZWxzZSB7CgkJCQkkcmVzdWx0WyRpZHhdLT57JGNvbHVtbl9uYW1lc1skal19ID0gJGNvbHVtblskal07CgkJCX0KCQl9CgkJCgkJJGlkeCsrOwoJfQoJCglyZXR1cm4gQHJlc3VsdDsKfQoKIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIyBTVUIgcHJpbnRfbW9kdWxlZGF0YSAoJG1vZHVsZV9pdGVtLCAkbW9kdWxlX2RhdGEsIAojICRtb2R1bGVfZGVzY3JpcHRpb24sIEBkYXRhKQojIFByaW50cyBhIG1vZHVsZWRhdGEgWE1MIHRhZy4gJG1vZHVsZV9pdGVtLCAkbW9kdWxlX2RhdGEgYW5kCiMgJG1vZHVsZV9kZXNjcmlwdGlvbiBhcmUgdXNlZCB0byBpbmRleCB0aGUgaXRlbSwgZGF0YSBhbmQgZGVzY3JpcHRpb24KIyBYTUwgdGFncyByZXNwZWN0aXZlbHkuCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCnN1YiBwcmludF9tb2R1bGVkYXRhIHsKCW15IEBtb2R1bGVfaGVhZGVycyA9IEB7JF9bMF19OwoJbXkgQG1vZHVsZV91bml0cyAgID0gQHskX1sxXX07CglteSBAZGF0YSAgICAgICAgICAgPSBAeyRfWzJdfTsKCW15ICRyZXN1bHQ7Cglmb3JlYWNoIG15ICRlbGVtZW50IChAZGF0YSkgewoJCSRyZXN1bHQgPSAnJzsKCQlmb3IgKCRpPTA7ICRpPEBtb2R1bGVfaGVhZGVyczskaSsrKSB7CgkJCWlmIChkZWZpbmVkICgkZWxlbWVudC0+eyRtb2R1bGVfaGVhZGVyc1skaV19KSkgewoJCQkJJHJlc3VsdCAuPSAkZWxlbWVudC0+eyRtb2R1bGVfaGVhZGVyc1skaV19IC4gJG1vZHVsZV91bml0c1skaV0gLiAnOyc7CgkJCX0KCQkJZWxzZSB7CgkJCQkkcmVzdWx0IC49ICc7JzsKCQkJfQoJCX0KCQljaG9wKCRyZXN1bHQpOwoJCXByaW50ICRyZXN1bHQgLiAiXG4iOwkKCX0KfQoKIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIyBNYWluCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCgpteSBAcmVzdWx0ICA9IHJ1bl9xdWVyeSgiU2VsZWN0IFNlcmlhbE51bWJlciBmcm9tIFdpbjMyX09wZXJhdGluZ1N5c3RlbSIpOwojIFJlbWVtYmVyIHRvIG1hdGNoIGxlbmdodCBvZiBib3RoIGFycmF5cyBoZWFkZXJzICYgdW5pdHMKbXkgQGhlYWRlcnMgPSAoIlNlcmlhbE51bWJlciIpOwpteSBAdW5pdHMgICA9ICgiIik7CnByaW50X21vZHVsZWRhdGEgKFxAaGVhZGVycyxcQHVuaXRzLCBcQHJlc3VsdCk7CmV4aXQgMDsKCg==',0);
/*!40000 ALTER TABLE `tmodule_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmodule_relationship`
--

DROP TABLE IF EXISTS `tmodule_relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmodule_relationship` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_rt` int(10) unsigned DEFAULT NULL,
  `id_server` varchar(100) NOT NULL DEFAULT '',
  `module_a` int(10) unsigned NOT NULL,
  `module_b` int(10) unsigned NOT NULL,
  `disable_update` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type` enum('direct','failover') DEFAULT 'direct',
  PRIMARY KEY (`id`),
  KEY `module_a` (`module_a`),
  KEY `module_b` (`module_b`),
  KEY `id_rt` (`id_rt`),
  CONSTRAINT `tmodule_relationship_ibfk_1` FOREIGN KEY (`module_a`) REFERENCES `tagente_modulo` (`id_agente_modulo`) ON DELETE CASCADE,
  CONSTRAINT `tmodule_relationship_ibfk_2` FOREIGN KEY (`module_b`) REFERENCES `tagente_modulo` (`id_agente_modulo`) ON DELETE CASCADE,
  CONSTRAINT `tmodule_relationship_ibfk_3` FOREIGN KEY (`id_rt`) REFERENCES `trecon_task` (`id_rt`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmodule_relationship`
--

LOCK TABLES `tmodule_relationship` WRITE;
/*!40000 ALTER TABLE `tmodule_relationship` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmodule_relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmodule_synth`
--

DROP TABLE IF EXISTS `tmodule_synth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmodule_synth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_agent_module_source` int(10) unsigned NOT NULL DEFAULT '0',
  `id_agent_module_target` int(10) unsigned NOT NULL DEFAULT '0',
  `fixed_value` float NOT NULL DEFAULT '0',
  `operation` enum('ADD','SUB','DIV','MUL','AVG','NOP') NOT NULL DEFAULT 'NOP',
  `order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_agent_module_target` (`id_agent_module_target`),
  CONSTRAINT `tmodule_synth_ibfk_1` FOREIGN KEY (`id_agent_module_target`) REFERENCES `tagente_modulo` (`id_agente_modulo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmodule_synth`
--

LOCK TABLES `tmodule_synth` WRITE;
/*!40000 ALTER TABLE `tmodule_synth` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmodule_synth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tnetflow_filter`
--

DROP TABLE IF EXISTS `tnetflow_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tnetflow_filter` (
  `id_sg` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_name` varchar(600) NOT NULL DEFAULT '0',
  `id_group` int(10) DEFAULT NULL,
  `ip_dst` text NOT NULL,
  `ip_src` text NOT NULL,
  `dst_port` text NOT NULL,
  `src_port` text NOT NULL,
  `router_ip` text NOT NULL,
  `advanced_filter` text NOT NULL,
  `filter_args` text NOT NULL,
  `aggregate` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_sg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tnetflow_filter`
--

LOCK TABLES `tnetflow_filter` WRITE;
/*!40000 ALTER TABLE `tnetflow_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `tnetflow_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tnetflow_report`
--

DROP TABLE IF EXISTS `tnetflow_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tnetflow_report` (
  `id_report` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_name` varchar(150) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `id_group` int(10) DEFAULT NULL,
  `server_name` text NOT NULL,
  PRIMARY KEY (`id_report`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tnetflow_report`
--

LOCK TABLES `tnetflow_report` WRITE;
/*!40000 ALTER TABLE `tnetflow_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `tnetflow_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tnetflow_report_content`
--

DROP TABLE IF EXISTS `tnetflow_report_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tnetflow_report_content` (
  `id_rc` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_report` int(10) unsigned NOT NULL DEFAULT '0',
  `id_filter` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `date` bigint(20) NOT NULL DEFAULT '0',
  `period` int(11) NOT NULL DEFAULT '0',
  `max` int(11) NOT NULL DEFAULT '0',
  `show_graph` varchar(60) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_rc`),
  KEY `id_report` (`id_report`),
  KEY `id_filter` (`id_filter`),
  CONSTRAINT `tnetflow_report_content_ibfk_1` FOREIGN KEY (`id_report`) REFERENCES `tnetflow_report` (`id_report`) ON DELETE CASCADE,
  CONSTRAINT `tnetflow_report_content_ibfk_2` FOREIGN KEY (`id_filter`) REFERENCES `tnetflow_filter` (`id_sg`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tnetflow_report_content`
--

LOCK TABLES `tnetflow_report_content` WRITE;
/*!40000 ALTER TABLE `tnetflow_report_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `tnetflow_report_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tnetwork_component`
--

DROP TABLE IF EXISTS `tnetwork_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tnetwork_component` (
  `id_nc` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `id_group` int(6) NOT NULL DEFAULT '1',
  `type` smallint(6) NOT NULL DEFAULT '6',
  `max` bigint(20) NOT NULL DEFAULT '0',
  `min` bigint(20) NOT NULL DEFAULT '0',
  `module_interval` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tcp_port` int(10) unsigned NOT NULL DEFAULT '0',
  `tcp_send` text NOT NULL,
  `tcp_rcv` text NOT NULL,
  `snmp_community` varchar(255) NOT NULL DEFAULT 'NULL',
  `snmp_oid` varchar(400) NOT NULL,
  `id_module_group` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `id_modulo` int(10) unsigned DEFAULT '0',
  `id_plugin` int(10) unsigned DEFAULT '0',
  `plugin_user` text,
  `plugin_pass` text,
  `plugin_parameter` text,
  `max_timeout` int(4) unsigned DEFAULT '0',
  `max_retries` int(4) unsigned DEFAULT '0',
  `history_data` tinyint(1) unsigned DEFAULT '1',
  `min_warning` double(18,2) DEFAULT '0.00',
  `max_warning` double(18,2) DEFAULT '0.00',
  `str_warning` text,
  `min_critical` double(18,2) DEFAULT '0.00',
  `max_critical` double(18,2) DEFAULT '0.00',
  `str_critical` text,
  `min_ff_event` int(4) unsigned DEFAULT '0',
  `custom_string_1` text,
  `custom_string_2` text,
  `custom_string_3` text,
  `custom_integer_1` int(10) DEFAULT '0',
  `custom_integer_2` int(10) DEFAULT '0',
  `post_process` double(24,15) DEFAULT '0.000000000000000',
  `unit` text,
  `wizard_level` enum('basic','advanced','nowizard') DEFAULT 'nowizard',
  `macros` text,
  `critical_instructions` text NOT NULL,
  `warning_instructions` text NOT NULL,
  `unknown_instructions` text NOT NULL,
  `critical_inverse` tinyint(1) unsigned DEFAULT '0',
  `warning_inverse` tinyint(1) unsigned DEFAULT '0',
  `id_category` int(10) DEFAULT '0',
  `tags` text NOT NULL,
  `disabled_types_event` text NOT NULL,
  `module_macros` text NOT NULL,
  `min_ff_event_normal` int(4) unsigned DEFAULT '0',
  `min_ff_event_warning` int(4) unsigned DEFAULT '0',
  `min_ff_event_critical` int(4) unsigned DEFAULT '0',
  `ff_type` tinyint(1) unsigned DEFAULT '0',
  `each_ff` tinyint(1) unsigned DEFAULT '0',
  `dynamic_interval` int(4) unsigned DEFAULT '0',
  `dynamic_max` int(4) DEFAULT '0',
  `dynamic_min` int(4) DEFAULT '0',
  `dynamic_next` bigint(20) NOT NULL DEFAULT '0',
  `dynamic_two_tailed` tinyint(1) unsigned DEFAULT '0',
  `module_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `protocol` tinytext NOT NULL,
  `manufacturer_id` varchar(200) NOT NULL,
  `execution_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `scan_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `value` text NOT NULL,
  `value_operations` text NOT NULL,
  `module_enabled` tinyint(1) unsigned DEFAULT '0',
  `name_oid` varchar(255) NOT NULL,
  `query_class` varchar(200) NOT NULL,
  `query_key_field` varchar(200) NOT NULL,
  `scan_filters` text NOT NULL,
  `query_filters` text NOT NULL,
  `enabled` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id_nc`)
) ENGINE=InnoDB AUTO_INCREMENT=870 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tnetwork_component`
--

LOCK TABLES `tnetwork_component` WRITE;
/*!40000 ALTER TABLE `tnetwork_component` DISABLE KEYS */;
INSERT INTO `tnetwork_component` VALUES (1,'OS&#x20;Total&#x20;process','Total&#x20;process&#x20;in&#x20;Operating&#x20;System&#x20;&#40;UNIX&#x20;MIB&#41;',13,15,0,0,300,0,'','','public','HOST-RESOURCES-MIB::hrSystemProcesses.0 ',4,2,0,NULL,NULL,NULL,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(2,'OS&#x20;CPU&#x20;Load&#x20;&#40;1&#x20;min&#41;','CPU&#x20;Load&#x20;in&#x20;Operating&#x20;System&#x20;&#40;UNIX&#x20;MIB&#41;',13,15,0,0,300,0,'','','public','UCD-SNMP-MIB::laLoad.1',4,2,0,NULL,NULL,NULL,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(3,'Sysname','Get&#x20;name&#x20;of&#x20;system&#x20;using&#x20;SNMP&#x20;standard&#x20;MIB',1,17,0,0,900,0,'','','public','.1.3.6.1.2.1.1.1.0',1,2,0,NULL,NULL,NULL,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(4,'OS&#x20;Users','Active&#x20;users&#x20;in&#x20;Operating&#x20;System&#x20;&#40;UNIX&#x20;MIB&#41;',13,15,0,0,300,0,'','','public','HOST-RESOURCES-MIB::hrSystemNumUsers.0',4,2,0,NULL,NULL,NULL,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(11,'Catalyst&#x20;CPU&#x20;Usage&#x20;&#40;5min&#41;','Cisco&#x20;Catayst&#x20;Switches&#x20;CPU&#x20;Usage.&#x20;Taken&#x20;from&#x20;ftp://ftp.cisco.com/pub/mibs/oid/OLD-CISCO-CPU-MIB.oid',2,15,0,0,300,0,'','','public','1.3.6.1.4.1.9.2.1.58',4,2,0,NULL,NULL,NULL,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(22,'HSRP&#x20;Status','Get&#x20;status&#x20;of&#x20;HSRP',2,18,0,0,300,0,'','','public','1.3.6.1.4.1.9.9.106.1.2.1.1.15.12.106',2,2,0,NULL,NULL,NULL,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(24,'ifOperStatus_if1','Status&#x20;of&#x20;NIC#1',10,18,0,0,300,0,'1','','public','.1.3.6.1.2.1.2.2.1.8.1',2,2,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','basic','','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(25,'ifOperStatus_if2','Status&#x20;of&#x20;NIC&#x20;#2',10,18,0,0,300,0,'1','','public','.1.3.6.1.2.1.2.2.1.8.2',2,2,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','basic','','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(26,'ifOperStatus_if3','Status&#x20;of&#x20;NIC&#x20;#3',10,18,0,0,300,0,'1','','public','.1.3.6.1.2.1.2.2.1.8.3',2,2,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','basic','','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(27,'ifOutOctets_if1','Output&#x20;throughtput&#x20;on&#x20;Interface&#x20;#1',10,16,0,0,300,0,'1','','public','.1.3.6.1.2.1.2.2.1.16.1',2,2,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'bytes/sec','basic','','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(28,'ifOutOctets_if2','Output&#x20;troughtput&#x20;on&#x20;interface&#x20;#2',10,16,0,0,300,0,'1','','public','.1.3.6.1.2.1.2.2.1.16.2',1,2,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'bytes/sec','basic','','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(29,'ifOutOctets_if3','Output&#x20;troughtput&#x20;on&#x20;Interface&#x20;#3',10,16,0,0,300,0,'1','','public','.1.3.6.1.2.1.2.2.1.16.3',2,2,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'bytes/sec','basic','','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(30,'ifInOctets_if1','Input&#x20;troughtput&#x20;on&#x20;Interface&#x20;#1',10,16,0,0,300,0,'1','','public','.1.3.6.1.2.1.2.2.1.10.1',2,2,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'bytes/sec','basic','','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(31,'ifInOctets_if2','Input&#x20;throughtput&#x20;for&#x20;interface&#x20;#2',10,16,0,0,300,0,'1','','public','.1.3.6.1.2.1.2.2.1.10.2',2,2,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'bytes/sec','basic','','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(32,'ifInOctets_if3','Input&#x20;throught&#x20;on&#x20;interface&#x20;#3',10,16,0,0,300,0,'1','','public','.1.3.6.1.2.1.2.2.1.10.3',2,2,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'bytes/sec','basic','','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(34,'Host&#x20;Alive','Check&#x20;if&#x20;host&#x20;is&#x20;alive&#x20;using&#x20;ICMP&#x20;ping&#x20;check.',10,6,0,0,300,0,'','','','',2,2,0,NULL,NULL,NULL,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(36,'Host&#x20;Latency','Get&#x20;host&#x20;network&#x20;latency&#x20;in&#x20;miliseconds,&#x20;using&#x20;ICMP.',10,7,0,0,300,0,'','','','',2,2,0,NULL,NULL,NULL,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(37,'Check&#x20;HTTP&#x20;Server','Test&#x20;APACHE2&#x20;HTTP&#x20;service&#x20;remotely&#x20;&#40;Protocol&#x20;response,&#x20;not&#x20;only&#x20;openport&#41;',10,9,0,0,300,80,'GET / HTTP/1.0^M^M','HTTP/1.1 200 OK','','',3,2,0,NULL,NULL,NULL,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(38,'Check&#x20;FTP&#x20;Server','Check&#x20;FTP&#x20;protocol,&#x20;not&#x20;only&#x20;check&#x20;port.',10,9,0,0,300,21,'QUIT','220','','',3,2,0,NULL,NULL,NULL,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(39,'Check&#x20;SSH&#x20;Server','Checks&#x20;port&#x20;22&#x20;is&#x20;opened',10,9,0,0,300,22,'','','','',2,2,0,NULL,NULL,NULL,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(40,'Check&#x20;Telnet&#x20;server','Check&#x20;telnet&#x20;port',10,9,0,0,300,23,'','','','',2,2,0,NULL,NULL,NULL,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(41,'Check&#x20;SMTP&#x20;server','Check&#x20;if&#x20;SMTP&#x20;port&#x20;it&#039;s&#x20;open',10,9,0,0,300,25,'','','','',2,2,0,NULL,NULL,NULL,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(42,'Check&#x20;POP3&#x20;server','Check&#x20;POP3&#x20;port.',10,9,0,0,300,110,'','','','',2,2,0,NULL,NULL,NULL,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(49,'OS&#x20;CPU&#x20;Load&#x20;&#40;5&#x20;min&#41;','CPU&#x20;load&#x20;on&#x20;a&#x20;5&#x20;min&#x20;average&#x20;interval.&#x20;UCD-SNMP&#x20;Mib&#x20;&#40;Usually&#x20;for&#x20;all&#x20;Linux&#x20;and&#x20;some&#x20;UNIX&#41;',13,15,0,0,300,0,'','','public','UCD-SNMP-MIB::laLoad.2',4,2,0,NULL,NULL,NULL,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(50,'System&#x20;Description','Get&#x20;system&#x20;description&#x20;&#40;all&#x20;mibs&#41;.',1,17,0,0,9000,0,'','','public','SNMPv2-MIB::sysDescr.0',4,2,0,NULL,NULL,NULL,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(51,'OS&#x20;Raw&#x20;Interrupts','Get&#x20;system&#x20;raw&#x20;interrupts&#x20;from&#x20;SO',13,16,0,0,300,0,'','','public','UCD-SNMP-MIB::ssRawInterrupts.0',4,2,0,NULL,NULL,NULL,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(52,'OS&#x20;IO&#x20;Signals&#x20;sent','IO&#x20;Signals&#x20;sent&#x20;by&#x20;Kernel',13,16,0,0,300,0,'','','public','UCD-SNMP-MIB::ssIOSent.0',4,2,0,NULL,NULL,NULL,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(53,'System&#x20;Uptime','Sistem&#x20;uptime&#x20;in&#x20;timeticks',1,15,0,0,3600,0,'','','public','.1.3.6.1.2.1.1.3.0',4,2,0,NULL,NULL,NULL,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000115740741,'days','basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(176,'Catalyst&#x20;Free&#x20;Mem','Taken&#x20;from&#x20;ftp://ftp.cisco.com/pub/mibs/oid/OLD-CISCO-MEMORY-MIB.oid',2,15,0,0,300,0,'','','public','1.3.6.1.4.1.9.2.1.8',4,2,0,NULL,NULL,NULL,0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(200,'CPU&#x20;load','CPU0&#x20;load&#x20;average',16,1,100,0,300,1,'','','','SELECT&#x20;LoadPercentage&#x20;from&#x20;Win32_Processor&#x20;WHERE&#x20;DeviceID&#x20;=&#x20;&quot;CPU0&quot;',1,6,0,'Administrator','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(201,'Free&#x20;RAM','Available&#x20;RAM&#x20;memory&#x20;in&#x20;bytes',16,1,0,0,300,0,'','','','SELECT&#x20;AvailableBytes&#x20;from&#x20;Win32_PerfRawData_PerfOS_Memory',1,6,0,'Administrator',NULL,NULL,10,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(202,'Windows&#x20;version','Operating&#x20;system&#x20;version',16,3,0,0,300,1,'','','','SELECT&#x20;Caption&#x20;FROM&#x20;Win32_OperatingSystem',1,6,0,'Administrator',NULL,NULL,10,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(203,'Free&#x20;RAM','Available&#x20;RAM&#x20;memory&#x20;in&#x20;bytes',16,1,0,0,300,0,'','','','SELECT&#x20;AvailableBytes&#x20;from&#x20;Win32_PerfRawData_PerfOS_Memory',4,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(204,'Hostname','The&#x20;hostname&#x20;of&#x20;the&#x20;machine.',16,3,0,0,300,0,'','','','SELECT&#x20;DNSHostName&#x20;FROM&#x20;Win32_ComputerSystem',1,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(205,'Computer&#x20;number&#x20;of&#x20;CPUs','Displays&#x20;the&#x20;number&#x20;of&#x20;CPUs&#x20;present&#x20;in&#x20;the&#x20;system',17,1,0,0,300,1,'','','','SELECT&#x20;NumberOfProcessors&#x20;FROM&#x20;Win32_ComputerSystem',1,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(206,'Server&#x20;Domain','Display&#x20;the&#x20;Domain&#x20;the&#x20;machine&#x20;belongs&#x20;to.',16,3,0,0,300,0,'','','','SELECT&#x20;Domain&#x20;FROM&#x20;Win32_ComputerSystem',2,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(207,'Number&#x20;of&#x20;Processes','Displays&#x20;the&#x20;number&#x20;of&#x20;processes&#x20;running&#x20;in&#x20;the&#x20;system',16,1,0,0,300,0,'','','','SELECT&#x20;NumberOfProcesses&#x20;FROM&#x20;Win32_OperatingSystem',4,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(208,'Serial&#x20;Number','Serial&#x20;Number&#x20;of&#x20;the&#x20;machine',16,3,0,0,300,3,'','','','SELECT&#x20;SerialNumber&#x20;FROM&#x20;Win32_OperatingSystem',1,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(209,'CPU&#x20;Model','Displays&#x20;the&#x20;CPU&#x20;model',17,3,0,0,300,1,'','','','SELECT&#x20;Name&#x20;FROM&#x20;Win32_Processor',1,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(210,'Service&#x20;Pack','Service&#x20;Pack&#x20;Version&#x20;Installed',16,1,0,0,300,3,'','','','SELECT&#x20;ServicePackMajorVersion&#x20;FROM&#x20;Win32_OperatingSystem',1,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(211,'Free&#x20;Physical&#x20;Memory','Displays&#x20;the&#x20;amount&#x20;of&#x20;free&#x20;physical&#x20;memory&#x20;in&#x20;the&#x20;system',16,1,0,0,300,0,'','','','SELECT&#x20;FreePhysicalMemory&#x20;FROM&#x20;Win32_OperatingSystem',1,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(212,'Free&#x20;Virtual&#x20;Memory','Displays&#x20;the&#x20;amount&#x20;of&#x20;free&#x20;virtual&#x20;memory&#x20;in&#x20;the&#x20;system',16,1,0,0,300,0,'','','','SELECT&#x20;FreeVirtualMemory&#x20;FROM&#x20;Win32_OperatingSystem',1,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(213,'License&#x20;Activation','This&#x20;module&#x20;lets&#x20;you&#x20;know&#x20;whether&#x20;you&#x20;have&#x20;to&#x20;activate&#x20;your&#x20;Windows&#x20;license&#x20;or&#x20;not.\r\n\r\n0&#x20;=&#x20;No\r\n1=&#x20;Yes',16,2,0,0,300,0,'','','','SELECT&#x20;ActivationRequired&#x20;FROM&#x20;Win32_WindowsProductActivation',4,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(214,'Total&#x20;Swap&#x20;Space&#x20;Size','Total&#x20;Swap&#x20;Space&#x20;Size',16,1,0,0,300,3,'','','','SELECT&#x20;TotalSwapSpaceSize&#x20;from&#x20;win32_operatingsystem',4,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(215,'Total&#x20;Virtual&#x20;Memory&#x20;Size','Total&#x20;Virtual&#x20;Memory&#x20;Size',16,1,0,0,300,3,'','','','select&#x20;TotalVirtualMemorySize&#x20;from&#x20;win32_operatingsystem',4,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(216,'Total&#x20;Visible&#x20;Memory&#x20;Size','Total&#x20;Visible&#x20;Memory&#x20;Size',16,1,0,0,300,3,'','','','SELECT&#x20;TotalVisibleMemorySize&#x20;from&#x20;win32_operatingsystem',4,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(217,'Free&#x20;Space&#x20;In&#x20;Paging&#x20;Files','Gets&#x20;the&#x20;free&#x20;space&#x20;in&#x20;paging&#x20;files',16,1,0,0,300,0,'','','','Select&#x20;FreeSpaceInPagingFiles&#x20;from&#x20;Win32_operatingsystem',4,6,0,'none','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(218,'Free&#x20;Space&#x20;In&#x20;Paging&#x20;Files','Gets&#x20;the&#x20;free&#x20;space&#x20;in&#x20;paging&#x20;files',16,1,0,0,300,0,'','','','Select&#x20;FreeSpaceInPagingFiles&#x20;from&#x20;Win32_operatingsystem',4,6,0,'none','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(219,'Number&#x20;of&#x20;Users','Displays&#x20;the&#x20;number&#x20;of&#x20;users',16,1,0,0,300,0,'','','','SELECT&#x20;NumberOfUsers&#x20;FROM&#x20;Win32_operatingsystem',4,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(220,'Last&#x20;BootUp&#x20;Time','Displays&#x20;the&#x20;Last&#x20;BootUp&#x20;Time',16,3,0,0,300,0,'','','','SELECT&#x20;LastBootUpTime&#x20;FROM&#x20;Win32_operatingsystem',4,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(221,'BIOS&#x20;Name','Displays&#x20;the&#x20;BIOS&#x20;Name',17,3,0,0,300,1,'','','','SELECT&#x20;BiosCharacteristics&#x20;FROM&#x20;Win32_BIOS',4,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(222,'BIOS&#x20;Version','Displays&#x20;the&#x20;BIOS&#x20;version',17,3,0,0,300,5,'','','','SELECT&#x20;BIOSVersion&#x20;FROM&#x20;Win32_BIOS',1,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(223,'BIOS&#x20;Manufacturer','Displays&#x20;the&#x20;BIOS&#x20;Manufacturer',17,3,0,0,300,0,'','','','SELECT&#x20;Manufacturer&#x20;FROM&#x20;Win32_BIOS',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(224,'BIOS&#x20;Status','Displays&#x20;the&#x20;BIOS&#x20;Status',17,3,0,0,300,3,'','','','SELECT&#x20;Status&#x20;FROM&#x20;Win32_BIOS',1,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(225,'BIOS&#x20;Serial&#x20;Number','Displays&#x20;the&#x20;BIOS&#x20;Serial&#x20;Number',17,3,0,0,300,1,'','','','SELECT&#x20;SerialNumber&#x20;FROM&#x20;Win32_BIOS',1,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(226,'Windows&#x20;Temp&#x20;Directory','Path&#x20;of&#x20;the&#x20;Windows&#x20;Temp&#x20;Directory',16,3,0,0,300,1,'','','','SELECT&#x20;TempDirectory&#x20;FROM&#x20;Win32_BootConfiguration',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(227,'Windows&#x20;Admin&#x20;Password&#x20;Status','Status&#x20;of&#x20;the&#x20;Windows&#x20;Admin&#x20;password:&#x20;1&#x20;is&#x20;set.',16,2,0,0,300,0,'','','','SELECT&#x20;AdminPasswordStatus&#x20;FROM&#x20;Win32_ComputerSystem',4,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(228,'Computer&#x20;System&#x20;Description','Displays&#x20;the&#x20;computer&#x20;System&#x20;description',17,3,0,0,300,0,'','','','SELECT&#x20;Description&#x20;FROM&#x20;Win32_ComputerSystem',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(230,'Computer&#x20;Automatic&#x20;Reset&#x20;Boot&#x20;Option','Displays&#x20;the&#x20;computer&#x20;Automatic&#x20;reset&#x20;boot&#x20;option',17,3,0,0,300,0,'','','','SELECT&#x20;AutomaticResetBootOption&#x20;FROM&#x20;Win32_ComputerSystem',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(231,'Computer&#x20;Automatic&#x20;Reset&#x20;Capability','Displays&#x20;the&#x20;computer&#x20;automatic&#x20;reset&#x20;capability',17,3,0,0,300,0,'','','','SELECT&#x20;AutomaticResetCapability&#x20;FROM&#x20;Win32_ComputerSystem',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(232,'Computer&#x20;Boot&#x20;Option&#x20;On&#x20;Limit','Displays&#x20;the&#x20;computer&#x20;Boot&#x20;Option&#x20;on&#x20;Limit',17,1,0,0,300,0,'','','','SELECT&#x20;BootOptionOnLimit&#x20;FROM&#x20;Win32_ComputerSystem',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(233,'Computer&#x20;Boot&#x20;Option&#x20;On&#x20;Watch&#x20;Dog','Displays&#x20;the&#x20;Computer&#x20;Boot&#x20;Option&#x20;On&#x20;Watch&#x20;Dog',17,1,0,0,300,0,'','','','SELECT&#x20;BootOptionOnWatchDog&#x20;FROM&#x20;Win32_ComputerSystem',4,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(234,'Computer&#x20;Boot&#x20;ROM&#x20;Supported','Displays&#x20;if&#x20;the&#x20;computer&#x20;Boot&#x20;ROM&#x20;is&#x20;supported',17,3,0,0,300,0,'','','','SELECT&#x20;BootROMSupported&#x20;FROM&#x20;Win32_ComputerSystem',4,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(235,'Computer&#x20;Bootup&#x20;State','Displays&#x20;the&#x20;computer&#x20;Bootup&#x20;State',17,3,0,0,300,0,'','','','SELECT&#x20;BootupState&#x20;FROM&#x20;Win32_ComputerSystem',4,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(236,'Computer&#x20;Chassis&#x20;Bootup&#x20;State','Displays&#x20;the&#x20;computer&#x20;Chassis&#x20;Bootup&#x20;State',16,1,0,0,300,0,'','','','SELECT&#x20;ChassisBootupState&#x20;FROM&#x20;Win32_ComputerSystem',4,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(237,'Computer&#x20;Daylight&#x20;In&#x20;Effect','Displays&#x20;whether&#x20;the&#x20;computer&#x20;Daylight&#x20;In&#x20;Effect&#x20;is&#x20;enabler&#x20;or&#x20;not',16,3,0,0,300,0,'','','','SELECT&#x20;DaylightInEffect&#x20;FROM&#x20;Win32_ComputerSystem',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(238,'Computer&#x20;DNS&#x20;Host&#x20;Name','Displays&#x20;the&#x20;DNS&#x20;Host&#x20;Name',16,3,0,0,300,0,'','','','SELECT&#x20;DNSHostName&#x20;FROM&#x20;Win32_ComputerSystem',2,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(239,'Computer&#x20;Domain','Displays&#x20;the&#x20;computer&#x20;Domain',16,3,0,0,300,0,'','','','SELECT&#x20;Domain&#x20;FROM&#x20;Win32_ComputerSystem',2,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(240,'Computer&#x20;Domain&#x20;Role','Displays&#x20;the&#x20;computer&#x20;Domain&#x20;Role',16,1,0,0,300,0,'','','','SELECT&#x20;DomainRole&#x20;FROM&#x20;Win32_ComputerSystem',2,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(241,'Computer&#x20;Enable&#x20;Daylight&#x20;Savings&#x20;Time','Displays&#x20;whether&#x20;the&#x20;computer&#x20;Daylight&#x20;Savings&#x20;Time&#x20;is&#x20;enabled',16,3,0,0,300,0,'','','','SELECT&#x20;EnableDaylightSavingsTime&#x20;FROM&#x20;Win32_ComputerSystem',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(242,'Computer&#x20;Front&#x20;Panel&#x20;Reset&#x20;Status','Displays&#x20;the&#x20;computer&#x20;Front&#x20;Panel&#x20;Reset&#x20;Status',16,1,0,0,300,0,'','','','SELECT&#x20;FrontPanelResetStatus&#x20;FROM&#x20;Win32_ComputerSystem',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(243,'Computer&#x20;Infrared&#x20;Support','Displays&#x20;the&#x20;computer&#x20;Infrared&#x20;Support',16,3,0,0,300,0,'','','','SELECT&#x20;InfraredSupported&#x20;FROM&#x20;Win32_ComputerSystem',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(244,'Computer&#x20;Initial&#x20;Load&#x20;Info','Displays&#x20;the&#x20;computer&#x20;Initial&#x20;Load&#x20;Info',16,3,0,0,300,0,'','','','SELECT&#x20;InitialLoadInfo&#x20;FROM&#x20;Win32_ComputerSystem',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(245,'Computer&#x20;Install&#x20;Date','Displays&#x20;the&#x20;computer&#x20;install&#x20;date',16,3,0,0,300,0,'','','','SELECT&#x20;InstallDate&#x20;FROM&#x20;Win32_ComputerSystem',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(246,'Computer&#x20;Keyboard&#x20;Password&#x20;Status','Displays&#x20;the&#x20;computer&#x20;keyboard&#x20;password&#x20;status',16,1,0,0,300,0,'','','','SELECT&#x20;KeyboardPasswordStatus&#x20;FROM&#x20;Win32_ComputerSystem',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(247,'Computer&#x20;Last&#x20;Load&#x20;Info','Displays&#x20;the&#x20;computer&#x20;last&#x20;load&#x20;info',16,3,0,0,300,0,'','','','SELECT&#x20;LastLoadInfo&#x20;FROM&#x20;Win32_ComputerSystem',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(248,'Computer&#x20;Manufacturer','Displays&#x20;the&#x20;computer&#x20;manufacturer',16,3,0,0,300,0,'','','','SELECT&#x20;Manufacturer&#x20;FROM&#x20;Win32_ComputerSystem',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(249,'Computer&#x20;Model','Displays&#x20;the&#x20;computer&#x20;model',17,3,0,0,300,0,'','','','SELECT&#x20;Model&#x20;FROM&#x20;Win32_ComputerSystem',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(250,'Computer&#x20;Name','Displays&#x20;the&#x20;computer&#x20;name',16,3,0,0,300,0,'','','','SELECT&#x20;Name&#x20;FROM&#x20;Win32_ComputerSystem',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(251,'Computer&#x20;Network&#x20;Server&#x20;Mode&#x20;Enabled','Displays&#x20;the&#x20;computer&#x20;Network&#x20;Server&#x20;Mode&#x20;Enabled',16,3,0,0,300,1,'','','','SELECT&#x20;NetworkServerModeEnabled&#x20;FROM&#x20;Win32_ComputerSystem',2,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(252,'Computer&#x20;Part&#x20;of&#x20;Domain','Displays&#x20;the&#x20;computer&#x20;Part&#x20;of&#x20;Domain',16,3,0,0,300,1,'','','','SELECT&#x20;PartOfDomain&#x20;FROM&#x20;Win32_ComputerSystem',2,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(253,'Computer&#x20;Pause&#x20;After&#x20;Reset','Displays&#x20;the&#x20;computer&#x20;Pause&#x20;After&#x20;Reset',17,1,0,0,300,1,'','','','SELECT&#x20;PauseAfterReset&#x20;FROM&#x20;Win32_ComputerSystem',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(254,'Computer&#x20;Power&#x20;Management&#x20;Capabilities','Displays&#x20;the&#x20;computer&#x20;Power&#x20;Management&#x20;Capabilities',17,3,0,0,300,1,'','','','SELECT&#x20;PowerManagementCapabilities&#x20;FROM&#x20;Win32_ComputerSystem',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(255,'Computer&#x20;Power&#x20;Management&#x20;Support','Displays&#x20;the&#x20;computer&#x20;Power&#x20;Management&#x20;Support',17,3,0,0,300,1,'','','','SELECT&#x20;PowerManagementSupported&#x20;FROM&#x20;Win32_ComputerSystem',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(256,'Computer&#x20;Power&#x20;on&#x20;Password&#x20;Status','Displays&#x20;the&#x20;computer&#x20;Power&#x20;on&#x20;Password&#x20;Status',17,2,0,0,300,1,'','','','SELECT&#x20;PowerOnPasswordStatus&#x20;FROM&#x20;Win32_ComputerSystem',4,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(257,'Computer&#x20;Power&#x20;State','Displays&#x20;the&#x20;computer&#x20;Power&#x20;State',17,2,0,0,300,1,'','','','SELECT&#x20;PowerState&#x20;FROM&#x20;Win32_ComputerSystem',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(258,'Computer&#x20;Power&#x20;Supply&#x20;State','Displays&#x20;the&#x20;computer&#x20;Power&#x20;Supply&#x20;State',17,1,0,0,300,1,'','','','SELECT&#x20;PowerSupplyState&#x20;FROM&#x20;Win32_ComputerSystem',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(259,'Computer&#x20;Reset&#x20;Capability','Displays&#x20;the&#x20;computer&#x20;Reset&#x20;Capability',16,1,0,0,300,1,'','','','SELECT&#x20;ResetCapability&#x20;FROM&#x20;Win32_ComputerSystem',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(260,'Computer&#x20;Reset&#x20;Count','Displays&#x20;the&#x20;computer&#x20;Reset&#x20;Count',16,1,0,0,300,1,'','','','SELECT&#x20;ResetCount&#x20;FROM&#x20;Win32_ComputerSystem',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(261,'Computer&#x20;Reset&#x20;Limit','Displays&#x20;the&#x20;computer&#x20;Reset&#x20;Limit',16,1,0,0,300,1,'','','','SELECT&#x20;ResetLimit&#x20;FROM&#x20;Win32_ComputerSystem',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(262,'Computer&#x20;Roles','Displays&#x20;the&#x20;computer&#x20;Roles',16,3,0,0,300,1,'','','','SELECT&#x20;Roles&#x20;FROM&#x20;Win32_ComputerSystem',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(263,'Computer&#x20;Status','Displays&#x20;the&#x20;computer&#x20;Status',16,3,0,0,300,1,'','','','SELECT&#x20;Status&#x20;FROM&#x20;Win32_ComputerSystem',4,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(264,'Computer&#x20;System&#x20;Startup&#x20;Delay','Displays&#x20;the&#x20;computer&#x20;System&#x20;Startup&#x20;Delay',16,1,0,0,300,1,'','','','SELECT&#x20;SystemStartupDelay&#x20;FROM&#x20;Win32_ComputerSystem',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(265,'Computer&#x20;System&#x20;Startup&#x20;Options','Displays&#x20;the&#x20;computer&#x20;System&#x20;Startup&#x20;Options',16,3,0,0,300,1,'','','','SELECT&#x20;SystemStartupOptions&#x20;FROM&#x20;Win32_ComputerSystem',4,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(266,'Exchange&#x20;VMLargestBlockSize&#x20;key','The&#x20;VMLargestBlockSize&#x20;key&#x20;represents&#x20;the&#x20;size&#x20;&#40;in&#x20;bytes&#41;&#x20;of&#x20;the&#x20;largest&#x20;available&#x20;block&#x20;of&#x20;virtual&#x20;memory',20,1,0,0,300,0,'','','','SELECT&#x20;VMLargestBlockSize&#x20;FROM&#x20;Win32_PerfRawData_MSExchangeIS_MSExchangeIS',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(267,'Exchange&#x20;VMTotalLargeFreeBlockBytes','The&#x20;VMTotalFreeBlocks&#x20;key&#x20;represents&#x20;the&#x20;size&#x20;&#40;in&#x20;bytes&#41;&#x20;of&#x20;the&#x20;total&#x20;largest&#x20;free&#x20;available&#x20;block&#x20;of&#x20;virtual&#x20;memory',20,1,0,0,300,0,'','','','SELECT&#x20;VMTotalLargeFreeBlockBytes&#x20;FROM&#x20;Win32_PerfRawData_MSExchangeIS_MSExchangeIS',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(268,'Exchange&#x20;VMTotalFreeBlocks','The&#x20;VMTotalFreeBlocks&#x20;key&#x20;represents&#x20;the&#x20;size&#x20;&#40;in&#x20;bytes&#41;&#x20;of&#x20;the&#x20;Total&#x20;Free&#x20;Available&#x20;blocks&#x20;of&#x20;virtual&#x20;memory',20,1,0,0,300,0,'','','','SELECT&#x20;VMTotalFreeBlocks&#x20;FROM&#x20;Win32_PerfRawData_MSExchangeIS_MSExchangeIS',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(269,'Exchange&#x20;TotalMessagesScannedforUCE','The&#x20;total&#x20;number&#x20;of&#x20;messages&#x20;scanned&#x20;by&#x20;Intelligent&#x20;Message&#x20;Filter.&#x20;If&#x20;this&#x20;number&#x20;is&#x20;0&#x20;or&#x20;very&#x20;low,&#x20;Intelligent&#x20;Message&#x20;Filter&#x20;might&#x20;not&#x',20,1,0,0,300,1,'','','','SELECT&#x20;TotalMessagesScannedforUCE&#x20;FROM&#x20;Win32_PerfRawData_MSExchangeUCF_MSExchangeIntelligentMessageFilter&#x20;Where&#x20;Name=&#039;_Total&#039;',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(270,'Exchange&#x20;TotalUCEMessagesActedUpon','The&#x20;total&#x20;number&#x20;of&#x20;messages&#x20;that&#x20;Intelligent&#x20;Message&#x20;Filter&#x20;has&#x20;identified&#x20;as&#x20;UCE&#x20;and&#x20;acted&#x20;on&#x20;based&#x20;on&#x20;the&#x20;action&#x20;specified&#x20;by&#x20;an&#x20;adm',20,1,0,0,300,1,'','','','SELECT&#x20;TotalUCEMessagesActedUpon&#x20;FROM&#x20;Win32_PerfRawData_MSExchangeUCF_MSExchangeIntelligentMessageFilter&#x20;Where&#x20;Name=&#039;_Total&#039;',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(271,'Exchange&#x20;TotalMessagesAssignedanSCLRatingof1','The&#x20;total&#x20;number&#x20;of&#x20;messages&#x20;scanned&#x20;by&#x20;Intelligent&#x20;Message&#x20;Filter&#x20;that&#x20;were&#x20;assigned&#x20;a&#x20;spam&#x20;confidence&#x20;level&#x20;&#40;SCL&#41;&#x20;rating&#x20;of&#x20;x,&#x20;where&#x20;x&#x2',20,1,0,0,300,1,'','','','SELECT&#x20;TotalMessagesAssignedanSCLRatingof1&#x20;FROM&#x20;Win32_PerfRawData_MSExchangeUCF_MSExchangeIntelligentMessageFilter&#x20;Where&#x20;Name=&#039;_Total&#039;',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(272,'Exchange&#x20;TotalMessagesAssignedanSCLRatingof3','The&#x20;total&#x20;number&#x20;of&#x20;messages&#x20;scanned&#x20;by&#x20;Intelligent&#x20;Message&#x20;Filter&#x20;that&#x20;were&#x20;assigned&#x20;a&#x20;spam&#x20;confidence&#x20;level&#x20;&#40;SCL&#41;&#x20;rating&#x20;of&#x20;x,&#x20;where&#x20;x&#x2',20,1,0,0,300,1,'','','','SELECT&#x20;TotalMessagesAssignedanSCLRatingof3&#x20;FROM&#x20;Win32_PerfRawData_MSExchangeUCF_MSExchangeIntelligentMessageFilter&#x20;Where&#x20;Name=&#039;_Total&#039;',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(273,'Exchange&#x20;TotalMessagesAssignedanSCLRatingof5','The&#x20;total&#x20;number&#x20;of&#x20;messages&#x20;scanned&#x20;by&#x20;Intelligent&#x20;Message&#x20;Filter&#x20;that&#x20;were&#x20;assigned&#x20;a&#x20;spam&#x20;confidence&#x20;level&#x20;&#40;SCL&#41;&#x20;rating&#x20;of&#x20;x,&#x20;where&#x20;x&#x2',20,1,0,0,300,1,'','','','SELECT&#x20;TotalMessagesAssignedanSCLRatingof5&#x20;FROM&#x20;Win32_PerfRawData_MSExchangeUCF_MSExchangeIntelligentMessageFilter&#x20;Where&#x20;Name=&#039;_Total&#039;',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(274,'Exchange&#x20;TotalMessagesAssignedanSCLRatingof6','The&#x20;total&#x20;number&#x20;of&#x20;messages&#x20;scanned&#x20;by&#x20;Intelligent&#x20;Message&#x20;Filter&#x20;that&#x20;were&#x20;assigned&#x20;a&#x20;spam&#x20;confidence&#x20;level&#x20;&#40;SCL&#41;&#x20;rating&#x20;of&#x20;x,&#x20;where&#x20;x&#x2',20,1,0,0,300,1,'','','','SELECT&#x20;TotalMessagesAssignedanSCLRatingof6&#x20;FROM&#x20;Win32_PerfRawData_MSExchangeUCF_MSExchangeIntelligentMessageFilter&#x20;Where&#x20;Name=&#039;_Total&#039;',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(275,'Exchange&#x20;TotalMessagesAssignedanSCLRatingof7','The&#x20;total&#x20;number&#x20;of&#x20;messages&#x20;scanned&#x20;by&#x20;Intelligent&#x20;Message&#x20;Filter&#x20;that&#x20;were&#x20;assigned&#x20;a&#x20;spam&#x20;confidence&#x20;level&#x20;&#40;SCL&#41;&#x20;rating&#x20;of&#x20;x,&#x20;where&#x20;x&#x2',20,1,0,0,300,1,'','','','SELECT&#x20;TotalMessagesAssignedanSCLRatingof7&#x20;FROM&#x20;Win32_PerfRawData_MSExchangeUCF_MSExchangeIntelligentMessageFilter&#x20;Where&#x20;Name=&#039;_Total&#039;',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(276,'Exchange&#x20;TotalMessagesAssignedanSCLRatingof8','The&#x20;total&#x20;number&#x20;of&#x20;messages&#x20;scanned&#x20;by&#x20;Intelligent&#x20;Message&#x20;Filter&#x20;that&#x20;were&#x20;assigned&#x20;a&#x20;spam&#x20;confidence&#x20;level&#x20;&#40;SCL&#41;&#x20;rating&#x20;of&#x20;x,&#x20;where&#x20;x&#x2',20,1,0,0,300,1,'','','','SELECT&#x20;TotalMessagesAssignedanSCLRatingof8&#x20;FROM&#x20;Win32_PerfRawData_MSExchangeUCF_MSExchangeIntelligentMessageFilter&#x20;Where&#x20;Name=&#039;_Total&#039;',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(277,'Exchange&#x20;TotalMessagesAssignedanSCLRatingof9','The&#x20;total&#x20;number&#x20;of&#x20;messages&#x20;scanned&#x20;by&#x20;Intelligent&#x20;Message&#x20;Filter&#x20;that&#x20;were&#x20;assigned&#x20;a&#x20;spam&#x20;confidence&#x20;level&#x20;&#40;SCL&#41;&#x20;rating&#x20;of&#x20;x,&#x20;where&#x20;x&#x2',20,1,0,0,300,1,'','','','SELECT&#x20;TotalMessagesAssignedanSCLRatingof9&#x20;FROM&#x20;Win32_PerfRawData_MSExchangeUCF_MSExchangeIntelligentMessageFilter&#x20;Where&#x20;Name=&#039;_Total&#039;',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(278,'Exchange&#x20;ClientBackgroundRPCsFailed','Shows&#x20;the&#x20;client-reported&#x20;rate&#x20;of&#x20;failed&#x20;RPCs&#x20;&#40;since&#x20;the&#x20;store&#x20;was&#x20;started&#41;&#x20;due&#x20;to&#x20;the&#x20;Server&#x20;Too&#x20;Busy&#x20;ROC&#x20;error.',20,1,0,0,300,0,'','','','SELECT&#x20;ClientBackgroundRPCsFailed&#x20;FROM&#x20;Win32_PerfRawData_MSExchangeIS_MSExchangeIS',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(279,'Exchange&#x20;ClientBackgroundRPCssucceeded','The&#x20;count&#x20;of&#x20;succeeded&#x20;RPC&#x20;calls.',20,1,0,0,300,0,'','','','SELECT&#x20;ClientBackgroundRPCssucceeded&#x20;FROM&#x20;Win32_PerfRawData_MSExchangeIS_MSExchangeIS',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(280,'Exchange&#x20;ClientForegroundRPCssucceeded','The&#x20;number&#x20;of&#x20;RPCs&#x20;that&#x20;Outlook&#x20;successfully&#x20;sent&#x20;to&#x20;the&#x20;server.',20,1,0,0,300,0,'','','','SELECT&#x20;ClientForegroundRPCssucceeded&#x20;FROM&#x20;Win32_PerfRawData_MSExchangeIS_MSExchangeIS',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(281,'Exchange&#x20;ClientRPCsattempted','The&#x20;number&#x20;of&#x20;remote&#x20;procedure&#x20;calls&#x20;&#40;RPCs&#41;&#x20;that&#x20;Outlook&#x20;tried&#x20;to&#x20;send&#x20;to&#x20;the&#x20;server.',20,1,0,0,300,0,'','','','SELECT&#x20;ClientRPCsattempted&#x20;FROM&#x20;Win32_PerfRawData_MSExchangeIS_MSExchangeIS',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(282,'Exchange&#x20;ClientRPCsFailed','The&#x20;number&#x20;of&#x20;RPCs&#x20;that&#x20;were&#x20;tried&#x20;and&#x20;that&#x20;failed',20,1,0,0,300,0,'','','','SELECT&#x20;ClientRPCsFailed&#x20;FROM&#x20;Win32_PerfRawData_MSExchangeIS_MSExchangeIS',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(283,'Exchange&#x20;ClientRPCsFailedAccessDenied','Failed&#x20;RPC&#x20;connections&#x20;with&#x20;a&#x20;Access&#x20;Denied&#x20;error.',20,1,0,0,300,0,'','','','SELECT&#x20;ClientRPCsFailedAccessDenied&#x20;FROM&#x20;Win32_PerfRawData_MSExchangeIS_MSExchangeIS',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(284,'Exchange&#x20;ClientRPCsFailedAllothererrors','The&#x20;rate&#x20;of&#x20;failed&#x20;RPC&#x20;requests&#x20;&#40;since&#x20;the&#x20;Exchange&#x20;store&#x20;was&#x20;started&#41;&#x20;due&#x20;to&#x20;all&#x20;other&#x20;RPC&#x20;errors.',20,1,0,0,300,0,'','','','SELECT&#x20;ClientRPCsFailedAllothererrors&#x20;FROM&#x20;Win32_PerfRawData_MSExchangeIS_MSExchangeIS',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(285,'Exchange&#x20;ClientRPCsFailedCallCancelled','RPC&#x20;connections&#x20;that&#x20;got&#x20;cancelled.',20,1,0,0,300,0,'','','','SELECT&#x20;ClientRPCsFailedCallCancelled&#x20;FROM&#x20;Win32_PerfRawData_MSExchangeIS_MSExchangeIS',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(286,'Exchange&#x20;ClientRPCsFailedCallFailed','RPC&#x20;Failed&#x20;connections&#x20;with&#x20;exit&#x20;code:&#x20;Failed&#x20;Call',20,1,0,0,300,0,'','','','SELECT&#x20;ClientRPCsFailedCallFailed&#x20;FROM&#x20;Win32_PerfRawData_MSExchangeIS_MSExchangeIS',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(287,'Exchange&#x20;ClientRPCsFailedServerTooBusy','The&#x20;number&#x20;of&#x20;failed&#x20;RPC&#x20;requests&#x20;&#40;since&#x20;the&#x20;Exchange&#x20;store&#x20;was&#x20;started&#41;&#x20;due&#x20;to&#x20;the&#x20;&quot;Server&#x20;Too&#x20;Busy&quot;&#x20;RPC&#x20;error.',20,1,0,0,300,0,'','','','SELECT&#x20;ClientRPCsFailedServerTooBusy&#x20;FROM&#x20;Win32_PerfRawData_MSExchangeIS_MSExchangeIS',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(288,'Exchange&#x20;ClientRPCsFailedServerUnavailable','The&#x20;rate&#x20;of&#x20;failed&#x20;RPC&#x20;requests&#x20;&#40;since&#x20;the&#x20;Exchange&#x20;store&#x20;was&#x20;started&#41;&#x20;due&#x20;to&#x20;the&#x20;&quot;Server&#x20;Unavailable&quot;&#x20;RPC&#x20;error.&#x20;',20,1,0,0,300,0,'','','','SELECT&#x20;ClientRPCsFailedServerUnavailable&#x20;FROM&#x20;Win32_PerfRawData_MSExchangeIS_MSExchangeIS',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(289,'Exchange&#x20;ClientRPCssucceeded','The&#x20;rate&#x20;of&#x20;successful&#x20;RPC&#x20;requests.',20,1,0,0,300,0,'','','','SELECT&#x20;ClientRPCssucceeded&#x20;FROM&#x20;Win32_PerfRawData_MSExchangeIS_MSExchangeIS',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(290,'Exchange&#x20;RPCRequests','Rate&#x20;of&#x20;RPC&#x20;requests.',20,1,0,0,300,0,'','','','SELECT&#x20;RPCRequests&#x20;FROM&#x20;Win32_PerfRawData_MSExchangeIS_MSExchangeIS',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(291,'Exchange&#x20;RPCAveragedLatency','Average&#x20;reported&#x20;latency',20,1,0,0,300,0,'','','','SELECT&#x20;RPCAveragedLatency&#x20;FROM&#x20;Win32_PerfRawData_MSExchangeIS_MSExchangeIS',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(292,'Exchange&#x20;RPCOperationsPersec','RPC&#x20;operations&#x20;per&#x20;Second',20,1,0,0,300,0,'','','','SELECT&#x20;RPCOperationsPersec&#x20;FROM&#x20;Win32_PerfRawData_MSExchangeIS_MSExchangeIS',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(293,'Exchange&#x20;RPCRequestsPeak','Peak&#x20;of&#x20;RPC&#x20;requests',20,1,0,0,300,0,'','','','SELECT&#x20;RPCRequestsPeak&#x20;FROM&#x20;Win32_PerfRawData_MSExchangeIS_MSExchangeIS',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(294,'Exchange&#x20;UserCount','The&#x20;number&#x20;of&#x20;users&#x20;connected&#x20;to&#x20;the&#x20;information&#x20;store',20,1,0,0,300,0,'','','','SELECT&#x20;UserCount&#x20;FROM&#x20;Win32_PerfRawData_MSExchangeIS_MSExchangeIS',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(295,'Exchange&#x20;ActiveConnectionCount','Number&#x20;of&#x20;connections&#x20;that&#x20;have&#x20;shown&#x20;some&#x20;activity&#x20;in&#x20;the&#x20;last&#x20;10&#x20;minutes.',20,1,0,0,300,0,'','','','SELECT&#x20;ActiveConnectionCount&#x20;FROM&#x20;Win32_PerfRawData_MSExchangeIS_MSExchangeIS',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(296,'Exchange&#x20;ActiveUserCount','This&#x20;counter&#x20;gives&#x20;the&#x20;number&#x20;of&#x20;unique&#x20;users&#x20;that&#x20;have&#x20;logged&#x20;on&#x20;to&#x20;the&#x20;server&#x20;and&#x20;been&#x20;active&#x20;in&#x20;the&#x20;last&#x20;10&#x20;minutes',20,1,0,0,300,0,'','','','SELECT&#x20;ActiveUserCount&#x20;FROM&#x20;Win32_PerfRawData_MSExchangeIS_MSExchangeIS',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(297,'Exchange&#x20;MaximumConnections','Maximum&#x20;Connections',20,1,0,0,300,0,'','','','SELECT&#x20;MaximumConnections&#x20;FROM&#x20;Win32_PerfRawData_MSExchangeIS_MSExchangeIS',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(298,'Exchange&#x20;MaximumUsers','Maximum&#x20;number&#x20;of&#x20;Users.',20,1,0,0,300,0,'','','','SELECT&#x20;MaximumUsers&#x20;FROM&#x20;Win32_PerfRawData_MSExchangeIS_MSExchangeIS',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(299,'AD&#x20;AppMgmt','Status&#x20;of&#x20;the&#x20;AppMgmt&#x20;service.',18,3,0,0,300,1,'','','','SELECT&#x20;name,status,state&#x20;from&#x20;Win32_Service&#x20;WHERE&#x20;name=&#039;AppMgmt&#039;',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(300,'AD&#x20;Dnscache','Status&#x20;of&#x20;the&#x20;Dnscache&#x20;service&#x20;used&#x20;by&#x20;the&#x20;AD.',18,3,0,0,300,1,'','','','SELECT&#x20;name,status,state&#x20;from&#x20;Win32_Service&#x20;WHERE&#x20;name=&#039;Dnscache&#039;',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(301,'IIS&#x20;CurrentFileCacheMemoryUsage','The&#x20;number&#x20;of&#x20;bytes&#x20;currently&#x20;used&#x20;for&#x20;the&#x20;user-mode&#x20;file&#x20;cache.&#x20;',19,1,0,0,300,0,'','','','select&#x20;CurrentFileCacheMemoryUsage&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebServiceCache',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(302,'IIS&#x20;ActiveFlushedEntries','The&#x20;number&#x20;of&#x20;user-mode&#x20;cache&#x20;entries&#x20;that&#x20;have&#x20;been&#x20;flushed,&#x20;though&#x20;memory&#x20;is&#x20;still&#x20;allocated&#x20;for&#x20;these&#x20;entries.&#x20;The&#x20;allocated&#x20;memory&#x20;will&#x20;',19,1,0,0,300,0,'','','','select&#x20;ActiveFlushedEntries&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebServiceCache',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(303,'IIS&#x20;CurrentFilesCached','The&#x20;number&#x20;of&#x20;files&#x20;whose&#x20;content&#x20;is&#x20;currently&#x20;in&#x20;the&#x20;user-mode&#x20;cache.&#x20;',19,1,0,0,300,0,'','','','select&#x20;CurrentFilesCached&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebServiceCache',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(304,'IIS&#x20;CurrentMetadataCached','The&#x20;current&#x20;number&#x20;of&#x20;metadata&#x20;information&#x20;blocks&#x20;in&#x20;the&#x20;user-mode&#x20;cache.&#x20;',19,1,0,0,300,0,'','','','select&#x20;CurrentMetadataCached&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebServiceCache',1,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(305,'IIS&#x20;CurrentURIsCached','The&#x20;number&#x20;of&#x20;URI&#x20;information&#x20;blocks&#x20;that&#x20;are&#x20;currently&#x20;stored&#x20;in&#x20;the&#x20;user-mode&#x20;cache.&#x20;',19,1,0,0,300,0,'','','','select&#x20;CurrentURIsCached&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebServiceCache',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(306,'IIS&#x20;DescriptionFileCacheFlushes','Description&#x20;of&#x20;the&#x20;number&#x20;of&#x20;files&#x20;that&#x20;have&#x20;been&#x20;removed&#x20;from&#x20;the&#x20;user-mode&#x20;cache&#x20;since&#x20;the&#x20;WWW&#x20;service&#x20;started.&#x20;',19,1,0,0,300,0,'','','','select&#x20;DescriptionFileCacheFlushes&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebServiceCache',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(307,'IIS&#x20;FileCacheHits','The&#x20;number&#x20;of&#x20;successful&#x20;lookups&#x20;in&#x20;the&#x20;user-mode&#x20;file&#x20;cache&#x20;that&#x20;have&#x20;occurred&#x20;since&#x20;the&#x20;WWW&#x20;service&#x20;started.&#x20;',19,1,0,0,300,0,'','','','select&#x20;FileCacheHits&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebServiceCache',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(308,'IIS&#x20;FileCacheHitsPercent','The&#x20;ratio&#x20;of&#x20;user-mode&#x20;file&#x20;cache&#x20;hits&#x20;to&#x20;total&#x20;cache&#x20;requests&#x20;that&#x20;have&#x20;been&#x20;made&#x20;since&#x20;the&#x20;WWW&#x20;service&#x20;started&#x20;up',19,1,0,0,300,0,'','','','select&#x20;FileCacheHitsPercent&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebServiceCache',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(309,'IIS&#x20;FileCacheHitsPercent_Base','Base&#x20;value&#x20;for&#x20;FileCacheHitsPercent&#x20;used&#x20;to&#x20;calculate&#x20;percentage.',19,1,0,0,300,0,'','','','select&#x20;FileCacheHitsPercent_Base&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebServiceCache',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(310,'IIS&#x20;FileCacheMisses','The&#x20;number&#x20;of&#x20;unsuccessful&#x20;lookups&#x20;in&#x20;the&#x20;user-mode&#x20;file&#x20;cache&#x20;that&#x20;have&#x20;been&#x20;made&#x20;since&#x20;the&#x20;WWW&#x20;service&#x20;started.&#x20;',19,1,0,0,300,0,'','','','select&#x20;FileCacheMisses&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebServiceCache',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(311,'IIS&#x20;Frequency_Object','Frequency,&#x20;in&#x20;ticks&#x20;per&#x20;second,&#x20;of&#x20;Timestamp_Object.&#x20;This&#x20;property&#x20;is&#x20;defined&#x20;by&#x20;the&#x20;provider',19,1,0,0,300,0,'','','','select&#x20;Frequency_Object&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebServiceCache',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(312,'IIS&#x20;Frequency_PerfTime','Frequency,&#x20;in&#x20;ticks&#x20;per&#x20;second,&#x20;of&#x20;Timestamp_Perftime',19,1,0,0,300,0,'','','','select&#x20;Frequency_PerfTime&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebServiceCache',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(313,'IIS&#x20;KernelCurrentURIsCached','The&#x20;number&#x20;of&#x20;URI&#x20;information&#x20;blocks&#x20;currently&#x20;cached&#x20;by&#x20;the&#x20;kernel.&#x20;',19,1,0,0,300,0,'','','','select&#x20;KernelCurrentURIsCached&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebServiceCache',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(314,'IIS&#x20;KernelTotalFlushedURIs','The&#x20;number&#x20;of&#x20;URI&#x20;information&#x20;blocks&#x20;that&#x20;have&#x20;been&#x20;removed&#x20;from&#x20;the&#x20;kernel&#x20;cache&#x20;since&#x20;the&#x20;WWW&#x20;service&#x20;started.&#x20;',19,1,0,0,300,0,'','','','select&#x20;KernelTotalFlushedURIs&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebServiceCache',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(315,'IIS&#x20;KernelTotalURIsCached','The&#x20;number&#x20;of&#x20;URI&#x20;information&#x20;blocks&#x20;that&#x20;have&#x20;been&#x20;added&#x20;to&#x20;the&#x20;kernel&#x20;URI&#x20;cache&#x20;since&#x20;the&#x20;WWW&#x20;service&#x20;started.&#x20;',19,1,0,0,300,0,'','','','select&#x20;KernelTotalURIsCached&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebServiceCache',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(316,'IIS&#x20;KernelURICacheFlushes','The&#x20;number&#x20;of&#x20;kernel&#x20;URI&#x20;cache&#x20;flushes&#x20;that&#x20;have&#x20;occurred&#x20;since&#x20;the&#x20;WWW&#x20;service&#x20;started.&#x20;',19,1,0,0,300,0,'','','','select&#x20;KernelURICacheFlushes&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebServiceCache',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(317,'IIS&#x20;KernelURICacheHits','The&#x20;number&#x20;of&#x20;successful&#x20;lookups&#x20;in&#x20;the&#x20;kernel&#x20;URI&#x20;cache&#x20;that&#x20;have&#x20;occurred&#x20;since&#x20;the&#x20;WWW&#x20;service&#x20;started.&#x20;',19,1,0,0,300,0,'','','','select&#x20;KernelURICacheHits&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebServiceCache',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(318,'IIS&#x20;KernelURICacheHitsPercent','The&#x20;ratio&#x20;of&#x20;Kernel:&#x20;URI&#x20;Cache&#x20;Hits&#x20;to&#x20;total&#x20;cache&#x20;requests&#x20;since&#x20;the&#x20;WWW&#x20;service&#x20;started',19,1,0,0,300,0,'','','','select&#x20;KernelURICacheHitsPercent&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebServiceCache',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(319,'IIS&#x20;KernelUriCacheHitsPersec','The&#x20;average&#x20;number&#x20;of&#x20;kernel&#x20;URI&#x20;cache&#x20;hits&#x20;that&#x20;are&#x20;being&#x20;made&#x20;per&#x20;second.&#x20;',19,1,0,0,300,0,'','','','select&#x20;KernelUriCacheHitsPersec&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebServiceCache',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(320,'Free&#x20;disk','_VOLUME_ID&#x20;is&#x20;your&#x20;volume&#x20;ID,&#x20;for&#x20;example&#x20;&quot;c:&quot;',16,1,0,0,600,1,'','','','SELECT&#x20;FreeSpace&#x20;FROM&#x20;Win32_LogicalDisk&#x20;WHERE&#x20;DeviceID&#x20;=&#x20;_VOLUME_ID_',4,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(321,'Process&#x20;Status','Return&#x20;status&#x20;of&#x20;Process&#x20;Status&#x20;given&#x20;it&#039;s&#x20;name&#x20;&#40;case&#x20;sensitive!&#41;&#x20;including&#x20;extension.&#x20;Use&#x20;process&#x20;manager&#x20;to&#x20;get&#x20;process&#x20;name.&#x20;Returns&#x20;1&#x20;if',16,2,0,0,300,1,'','','Running','ELECT&#x20;State&#x20;FROM&#x20;Win32_Service&#x20;WHERE&#x20;Name&#x20;=&#x20;&quot;_Name&#x20;of&#x20;process_&quot;',4,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(322,'IIS&#x20;KernelURICacheMisses','The&#x20;number&#x20;of&#x20;unsuccessful&#x20;lookups&#x20;in&#x20;the&#x20;kernel&#x20;URI&#x20;cache&#x20;that&#x20;have&#x20;occurred&#x20;since&#x20;the&#x20;WWW&#x20;service&#x20;started.&#x20;',19,1,0,0,300,0,'','','','select&#x20;KernelURICacheMisses&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebServiceCache',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(323,'IIS&#x20;MaximumFileCacheMemoryUsage','The&#x20;maximum&#x20;number&#x20;of&#x20;bytes&#x20;that&#x20;have&#x20;been&#x20;used&#x20;for&#x20;the&#x20;user-mode&#x20;file&#x20;cache&#x20;since&#x20;the&#x20;WWW&#x20;service&#x20;started.&#x20;',19,1,0,0,300,0,'','','','select&#x20;MaximumFileCacheMemoryUsage&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebServiceCache',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(324,'IIS&#x20;MetadataCacheFlushes','The&#x20;number&#x20;of&#x20;user-mode&#x20;metadata&#x20;cache&#x20;flushes&#x20;that&#x20;have&#x20;occurred&#x20;since&#x20;the&#x20;WWW&#x20;service&#x20;started.',19,1,0,0,300,0,'','','','select&#x20;MetadataCacheFlushes&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebServiceCache',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(325,'IIS&#x20;MetadataCacheHits','The&#x20;number&#x20;of&#x20;successful&#x20;lookups&#x20;in&#x20;the&#x20;user-mode&#x20;metadata&#x20;cache&#x20;that&#x20;have&#x20;occurred&#x20;since&#x20;the&#x20;WWW&#x20;service&#x20;started.&#x20;',19,1,0,0,300,0,'','','','select&#x20;MetadataCacheHits&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebServiceCache',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(326,'IIS&#x20;MetadataCacheHitsPercent','The&#x20;ratio&#x20;of&#x20;successful&#x20;lookups&#x20;to&#x20;total&#x20;metadata&#x20;cache&#x20;requests.&#x20;',19,1,0,0,300,0,'','','','select&#x20;MetadataCacheHitsPercent&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebServiceCache',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(327,'IIS&#x20;MetadataCacheMisses','The&#x20;number&#x20;of&#x20;unsuccessful&#x20;lookups&#x20;in&#x20;the&#x20;user-mode&#x20;metadata&#x20;cache&#x20;that&#x20;have&#x20;occurred&#x20;since&#x20;the&#x20;WWW&#x20;service&#x20;started.&#x20;',19,1,0,0,300,0,'','','','select&#x20;MetadataCacheMisses&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebServiceCache',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(328,'IIS&#x20;TotalFilesCached','The&#x20;number&#x20;of&#x20;files&#x20;whose&#x20;content&#x20;has&#x20;been&#x20;added&#x20;to&#x20;the&#x20;user-mode&#x20;cache&#x20;since&#x20;the&#x20;WWW&#x20;service&#x20;started.&#x20;',19,1,0,0,300,0,'','','','select&#x20;TotalFilesCached&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebServiceCache',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(329,'IIS&#x20;TotalFlushedFiles','The&#x20;number&#x20;of&#x20;file&#x20;handles&#x20;that&#x20;have&#x20;been&#x20;removed&#x20;from&#x20;the&#x20;user-mode&#x20;cache&#x20;since&#x20;the&#x20;WWW&#x20;service&#x20;started.&#x20;',19,1,0,0,300,0,'','','','select&#x20;TotalFlushedFiles&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebServiceCache',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(330,'IIS&#x20;TotalFlushedMetadata','The&#x20;number&#x20;of&#x20;metadata&#x20;information&#x20;blocks&#x20;that&#x20;have&#x20;been&#x20;removed&#x20;from&#x20;the&#x20;user-mode&#x20;cache&#x20;since&#x20;the&#x20;WWW&#x20;service&#x20;started.&#x20;',19,1,0,0,300,0,'','','','select&#x20;TotalFlushedMetadata&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebServiceCache',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(331,'IIS&#x20;TotalFlushedURIs','The&#x20;number&#x20;of&#x20;URI&#x20;information&#x20;blocks&#x20;that&#x20;have&#x20;been&#x20;removed&#x20;from&#x20;the&#x20;user-mode&#x20;cache&#x20;since&#x20;the&#x20;WWW&#x20;service&#x20;started.&#x20;',19,1,0,0,300,0,'','','','select&#x20;TotalFlushedURIs&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebServiceCache',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(332,'IIS&#x20;TotalMetadataCached','The&#x20;number&#x20;of&#x20;metadata&#x20;information&#x20;blocks&#x20;that&#x20;have&#x20;been&#x20;added&#x20;to&#x20;the&#x20;user-mode&#x20;cache&#x20;since&#x20;the&#x20;WWW&#x20;service&#x20;started.&#x20;',19,1,0,0,300,0,'','','','select&#x20;TotalMetadataCached&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebServiceCache',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(333,'IIS&#x20;TotalURIsCached','The&#x20;number&#x20;of&#x20;URI&#x20;information&#x20;blocks&#x20;that&#x20;have&#x20;been&#x20;added&#x20;to&#x20;the&#x20;kernel&#x20;URI&#x20;cache&#x20;since&#x20;the&#x20;WWW&#x20;service&#x20;started.&#x20;',19,1,0,0,300,0,'','','','select&#x20;TotalURIsCached&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebServiceCache',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(334,'IIS&#x20;URICacheFlushes','The&#x20;number&#x20;of&#x20;kernel&#x20;URI&#x20;cache&#x20;flushes&#x20;that&#x20;have&#x20;occurred&#x20;since&#x20;the&#x20;WWW&#x20;service&#x20;started.&#x20;',19,1,0,0,300,0,'','','','select&#x20;URICacheFlushes&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebServiceCache',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(335,'IIS&#x20;URICacheHits','The&#x20;number&#x20;of&#x20;successful&#x20;lookups&#x20;in&#x20;the&#x20;kernel&#x20;URI&#x20;cache&#x20;that&#x20;have&#x20;occurred&#x20;since&#x20;the&#x20;WWW&#x20;service&#x20;started.&#x20;',19,1,0,0,300,0,'','','','select&#x20;URICacheHits&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebServiceCache',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(336,'IIS&#x20;URICacheHitsPercent','The&#x20;ratio&#x20;of&#x20;Kernel:&#x20;URI&#x20;Cache&#x20;Hits&#x20;to&#x20;total&#x20;cache&#x20;requests&#x20;since&#x20;the&#x20;WWW&#x20;service&#x20;started.&#x20;',19,1,0,0,300,0,'','','','select&#x20;URICacheHitsPercent&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebServiceCache',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(337,'IIS&#x20;URICacheMisses','The&#x20;number&#x20;of&#x20;unsuccessful&#x20;lookups&#x20;in&#x20;the&#x20;kernel&#x20;URI&#x20;cache&#x20;that&#x20;have&#x20;occurred&#x20;since&#x20;the&#x20;WWW&#x20;service&#x20;started.&#x20;',19,1,0,0,300,0,'','','','select&#x20;URICacheMisses&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebServiceCache',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(338,'IIS&#x20;AnonymousUsersPersec','Rate&#x20;at&#x20;which&#x20;users&#x20;are&#x20;making&#x20;anonymous&#x20;connections&#x20;using&#x20;the&#x20;Web&#x20;service.&#x20;&#40;the&#x20;value&#x20;given&#x20;is&#x20;the&#x20;total&#x20;users&#41;',19,1,0,0,300,0,'','','','select&#x20;AnonymousUsersPersec&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(339,'IIS&#x20;BytesReceivedPersec','Total&#x20;bytes&#x20;received&#x20;by&#x20;the&#x20;Web&#x20;service.',19,1,0,0,300,0,'','','','select&#x20;BytesReceivedPersec&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(340,'IIS&#x20;BytesSentPersec','Total&#x20;bytes&#x20;sent&#x20;by&#x20;the&#x20;Web&#x20;service.',19,1,0,0,300,0,'','','','select&#x20;BytesSentPersec&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(341,'IIS&#x20;BytesTotalPersec','This&#x20;is&#x20;the&#x20;total&#x20;rate&#x20;of&#x20;bytes&#x20;transferred&#x20;by&#x20;the&#x20;Web&#x20;service',19,1,0,0,300,0,'','','','select&#x20;BytesTotalPersec&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(342,'IIS&#x20;CGIRequestsPersec','Rate&#x20;of&#x20;CGI&#x20;requests&#x20;that&#x20;are&#x20;simultaneously&#x20;being&#x20;processed&#x20;by&#x20;the&#x20;Web&#x20;service.',19,1,0,0,300,0,'','','','select&#x20;CGIRequestsPersec&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(343,'IIS&#x20;ConnectionAttemptsPersec','Rate&#x20;at&#x20;which&#x20;connections&#x20;using&#x20;the&#x20;Web&#x20;service&#x20;are&#x20;being&#x20;attempted.',19,1,0,0,300,0,'','','','select&#x20;ConnectionAttemptsPersec&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(344,'IIS&#x20;CopyRequestsPersec','Rate&#x20;at&#x20;which&#x20;HTTP&#x20;requests&#x20;using&#x20;the&#x20;COPY&#x20;method&#x20;are&#x20;made.&#x20;COPY&#x20;requests&#x20;are&#x20;used&#x20;for&#x20;copying&#x20;files&#x20;and&#x20;directories.',19,1,0,0,300,0,'','','','select&#x20;CopyRequestsPersec&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(345,'IIS&#x20;CurrentAnonymousUsers','Number&#x20;of&#x20;users&#x20;who&#x20;currently&#x20;have&#x20;an&#x20;anonymous&#x20;connection&#x20;using&#x20;the&#x20;Web&#x20;service.\r\n',19,1,0,0,300,0,'','','','select&#x20;CurrentAnonymousUsers&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(346,'IIS&#x20;CurrentBlockedAsyncIORequests','Current&#x20;requests&#x20;temporarily&#x20;blocked&#x20;due&#x20;to&#x20;bandwidth&#x20;throttling&#x20;settings.',19,1,0,0,300,0,'','','','select&#x20;CurrentBlockedAsyncIORequests&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',1,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(347,'IIS&#x20;CurrentCGIRequests','Current&#x20;number&#x20;of&#x20;CGI&#x20;requests&#x20;that&#x20;are&#x20;simultaneously&#x20;being&#x20;processed&#x20;by&#x20;the&#x20;Web&#x20;service.',19,1,0,0,300,0,'','','Currentblockedbandwidthbytes','select&#x20;CurrentCGIRequests&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',1,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(348,'IIS&#x20;CurrentConnections','Current&#x20;number&#x20;of&#x20;connections&#x20;established&#x20;with&#x20;the&#x20;Web&#x20;service.',19,1,0,0,300,0,'','','','select&#x20;CurrentConnections&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(349,'IIS&#x20;CurrentISAPIExtensionRequests','select&#x20;CurrentISAPIExtensionRequests&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',19,1,0,0,300,0,'','','','select&#x20;CurrentISAPIExtensionRequests&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(350,'IIS&#x20;CurrentNonAnonymousUsers','Number&#x20;of&#x20;users&#x20;who&#x20;currently&#x20;have&#x20;a&#x20;non-anonymous&#x20;connection&#x20;using&#x20;the&#x20;Web&#x20;service.',19,1,0,0,300,0,'','','','select&#x20;CurrentNonAnonymousUsers&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(351,'IIS&#x20;DeleteRequestsPersec','Total&#x20;HTTP&#x20;requests&#x20;using&#x20;the&#x20;DELETE&#x20;method&#x20;are&#x20;made.&#x20;DELETE&#x20;requests&#x20;are&#x20;generally&#x20;used&#x20;for&#x20;file&#x20;removal.',19,1,0,0,300,0,'','','','select&#x20;DeleteRequestsPersec&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(352,'IIS&#x20;FilesPersec','Total&#x20;files&#x20;transferred;&#x20;that&#x20;is,&#x20;sent&#x20;and&#x20;received&#x20;by&#x20;the&#x20;Web&#x20;service.',19,1,0,0,300,0,'','','','select&#x20;FilesPersec&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(353,'IIS&#x20;FilesReceivedPersec','Total&#x20;received&#x20;files&#x20;by&#x20;the&#x20;Web&#x20;service.',19,1,0,0,300,0,'','','','select&#x20;FilesReceivedPersec&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(354,'IIS&#x20;FilesSentPersec','Rate&#x20;at&#x20;which&#x20;files&#x20;are&#x20;sent&#x20;by&#x20;the&#x20;Web&#x20;service.\r\n',19,1,0,0,300,0,'','','','select&#x20;FilesSentPersec&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(355,'IIS&#x20;GetRequestsPersec&#x20;','Rate&#x20;at&#x20;which&#x20;HTTP&#x20;requests&#x20;using&#x20;the&#x20;GET&#x20;method&#x20;are&#x20;made.&#x20;GET&#x20;requests&#x20;are&#x20;generally&#x20;used&#x20;for&#x20;basic&#x20;file&#x20;retrievals&#x20;or&#x20;image&#x20;maps,&#x20;tho',19,1,0,0,300,0,'','','','select&#x20;GetRequestsPersec&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(356,'IIS&#x20;HeadRequestsPersec','Rate&#x20;at&#x20;which&#x20;HTTP&#x20;requests&#x20;using&#x20;the&#x20;HEAD&#x20;method&#x20;are&#x20;made.&#x20;HEAD&#x20;requests&#x20;generally&#x20;indicate&#x20;that&#x20;clients&#x20;are&#x20;querying&#x20;the&#x20;state&#x20;of&#x20;document',19,1,0,0,300,0,'','','','select&#x20;HeadRequestsPersec&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',1,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(357,'IIS&#x20;ISAPIExtensionRequestsPersec','Rate&#x20;of&#x20;ISAPI&#x20;extension&#x20;requests&#x20;that&#x20;are&#x20;simultaneously&#x20;being&#x20;processed&#x20;by&#x20;the&#x20;Web&#x20;service.',19,1,0,0,300,0,'','','','select&#x20;ISAPIExtensionRequestsPersec&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(358,'IIS&#x20;LockedErrorsPersec','Rate&#x20;of&#x20;errors&#x20;due&#x20;to&#x20;requests&#x20;that&#x20;cannot&#x20;be&#x20;satisfied&#x20;by&#x20;the&#x20;server&#x20;because&#x20;the&#x20;requested&#x20;document&#x20;was&#x20;locked.&#x20;These&#x20;are&#x20;generally&#x20;reporte',19,1,0,0,300,0,'','','','select&#x20;LockedErrorsPersec&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(359,'IIS&#x20;LockRequestsPersec','Rate&#x20;at&#x20;which&#x20;HTTP&#x20;requests&#x20;using&#x20;the&#x20;LOCK&#x20;method&#x20;are&#x20;made.&#x20;LOCK&#x20;requests&#x20;are&#x20;used&#x20;to&#x20;lock&#x20;a&#x20;file&#x20;for&#x20;one&#x20;user&#x20;so&#x20;that&#x20;only&#x20;t',19,1,0,0,300,0,'','','','select&#x20;LockRequestsPersec&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(360,'IIS&#x20;LogonAttemptsPersec','Rate&#x20;at&#x20;which&#x20;logons&#x20;using&#x20;the&#x20;Web&#x20;service&#x20;are&#x20;being&#x20;attempted.',19,1,0,0,300,0,'','','','select&#x20;LogonAttemptsPersec&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(361,'IIS&#x20;MaximumAnonymousUsers','Maximum&#x20;number&#x20;of&#x20;users&#x20;who&#x20;established&#x20;concurrent&#x20;anonymous&#x20;connections&#x20;using&#x20;the&#x20;Web&#x20;service&#x20;&#40;counted&#x20;after&#x20;service&#x20;start&#x20;up&#41;.',19,1,0,0,300,0,'','','','select&#x20;MaximumAnonymousUsers&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(362,'IIS&#x20;MaximumCGIRequests','Maximum&#x20;number&#x20;of&#x20;CGI&#x20;requests&#x20;simultaneously&#x20;processed&#x20;by&#x20;the&#x20;Web&#x20;service.',19,1,0,0,300,0,'','','','select&#x20;MaximumCGIRequests&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(363,'IIS&#x20;MaximumConnections','Maximum&#x20;number&#x20;of&#x20;simultaneous&#x20;connections&#x20;established&#x20;with&#x20;the&#x20;Web&#x20;service.',19,1,0,0,300,0,'','','','select&#x20;MaximumConnections&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(364,'IIS&#x20;MaximumISAPIExtensionRequests','Maximum&#x20;number&#x20;of&#x20;ISAPI&#x20;extension&#x20;requests&#x20;simultaneously&#x20;processed&#x20;by&#x20;the&#x20;Web&#x20;service.\r\n',19,1,0,0,300,0,'','','','select&#x20;MaximumISAPIExtensionRequests&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(365,'IIS&#x20;MaximumNonAnonymousUsers','Maximum&#x20;number&#x20;of&#x20;users&#x20;who&#x20;established&#x20;concurrent&#x20;non-anonymous&#x20;connections&#x20;using&#x20;the&#x20;Web&#x20;service&#x20;&#40;counted&#x20;after&#x20;service&#x20;start&#x20;up&#41;.',19,1,0,0,300,0,'','','','select&#x20;MaximumNonAnonymousUsers&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(366,'IIS&#x20;MeasuredAsyncIOBandwidthUsage','Measured&#x20;bandwidth&#x20;of&#x20;asynchronous&#x20;I/O&#x20;averaged&#x20;over&#x20;a&#x20;minute.',19,1,0,0,300,0,'','','','select&#x20;MeasuredAsyncIOBandwidthUsage&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(367,'IIS&#x20;MkcolRequestsPersec','Rate&#x20;at&#x20;which&#x20;HTTP&#x20;requests&#x20;using&#x20;the&#x20;MKCOL&#x20;method&#x20;are&#x20;made.&#x20;MKCOL&#x20;requests&#x20;are&#x20;used&#x20;to&#x20;create&#x20;directories&#x20;on&#x20;the&#x20;server.',19,1,0,0,300,0,'','','','select&#x20;MkcolRequestsPersec&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(368,'IIS&#x20;MoveRequestsPersec','Rate&#x20;HTTP&#x20;requests&#x20;using&#x20;the&#x20;MOVE&#x20;method&#x20;are&#x20;made.&#x20;MOVE&#x20;requests&#x20;are&#x20;used&#x20;for&#x20;moving&#x20;files&#x20;and&#x20;directories.',19,1,0,0,300,0,'','','','select&#x20;MoveRequestsPersec&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(369,'IIS&#x20;NonAnonymousUsersPersec','Rate&#x20;at&#x20;which&#x20;users&#x20;are&#x20;making&#x20;non-anonymous&#x20;connections&#x20;using&#x20;the&#x20;Web&#x20;service.',19,1,0,0,300,0,'','','','select&#x20;NonAnonymousUsersPersec&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(370,'IIS&#x20;NotFoundErrorsPersec','Rate&#x20;of&#x20;errors&#x20;due&#x20;to&#x20;requests&#x20;that&#x20;could&#x20;not&#x20;be&#x20;satisfied&#x20;by&#x20;the&#x20;server&#x20;because&#x20;the&#x20;requested&#x20;document&#x20;could&#x20;not&#x20;be&#x20;found.&#x20;These&#x20;error',19,1,0,0,300,0,'','','','select&#x20;NotFoundErrorsPersec&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(371,'IIS&#x20;OptionsRequestsPersec','Rate&#x20;at&#x20;which&#x20;HTTP&#x20;requests&#x20;using&#x20;the&#x20;OPTIONS&#x20;method&#x20;are&#x20;made.',19,1,0,0,300,0,'','','','select&#x20;OptionsRequestsPersec&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(372,'IIS&#x20;OtherRequestMethosPersec','Rate&#x20;at&#x20;which&#x20;HTTP&#x20;requests&#x20;are&#x20;made&#x20;that&#x20;do&#x20;not&#x20;use&#x20;the&#x20;OPTIONS,&#x20;GET,&#x20;HEAD,&#x20;POST,&#x20;PUT,&#x20;DELETE,&#x20;TRACE,&#x20;MOVE,&#x20;COPY,&#x20;MKCOL,&#x20;PROPFIND,&#x20;PRO',19,1,0,0,300,0,'','','','select&#x20;OtherRequestMethosPersec&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(373,'IIS&#x20;PostRequestsPersec','Rate&#x20;at&#x20;which&#x20;HTTP&#x20;requests&#x20;using&#x20;the&#x20;POST&#x20;method&#x20;are&#x20;made.&#x20;POST&#x20;requests&#x20;are&#x20;generally&#x20;used&#x20;for&#x20;forms&#x20;or&#x20;gateway&#x20;requests.',19,1,0,0,300,0,'','','','select&#x20;PostRequestsPersec&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(374,'IIS&#x20;PropfindRequestsPersec','Rate&#x20;at&#x20;which&#x20;HTTP&#x20;requests&#x20;using&#x20;the&#x20;PROPFIND&#x20;method&#x20;are&#x20;made.&#x20;PROPFIND&#x20;requests&#x20;retrieve&#x20;property&#x20;values&#x20;on&#x20;files&#x20;and&#x20;directories.',19,1,0,0,300,0,'','','','select&#x20;PropfindRequestsPersec&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(375,'IIS&#x20;ProppatchRequestsPersec','Rate&#x20;at&#x20;which&#x20;HTTP&#x20;requests&#x20;using&#x20;the&#x20;PROPPATCH&#x20;method&#x20;are&#x20;made.&#x20;PROPPATCH&#x20;requests&#x20;set&#x20;property&#x20;values&#x20;on&#x20;files&#x20;and&#x20;directories.',19,1,0,0,300,0,'','','','select&#x20;ProppatchRequestsPersec&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(376,'IIS&#x20;PutRequestsPersec','Rate&#x20;at&#x20;which&#x20;HTTP&#x20;requests&#x20;using&#x20;the&#x20;PUT&#x20;method&#x20;are&#x20;made.',19,1,0,0,300,0,'','','','select&#x20;PutRequestsPersec&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(377,'IIS&#x20;SearchRequestsPersec','Rate&#x20;at&#x20;which&#x20;HTTP&#x20;requests&#x20;using&#x20;the&#x20;MS-SEARCH&#x20;method&#x20;are&#x20;made.&#x20;MS-SEARCH&#x20;requests&#x20;query&#x20;the&#x20;server&#x20;to&#x20;find&#x20;resources&#x20;that&#x20;match&#x20;a&#x20;set&#x20',19,1,0,0,300,0,'','','','select&#x20;SearchRequestsPersec&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(378,'IIS&#x20;ServiceUptime','Time&#x20;that&#x20;the&#x20;Web&#x20;service&#x20;is&#x20;available&#x20;to&#x20;users.&#x20;',19,1,0,0,300,0,'','','','select&#x20;ServiceUptime&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(379,'IIS&#x20;TotalAllowedAsyncIORequests','Total&#x20;requests&#x20;that&#x20;are&#x20;allowed&#x20;by&#x20;bandwidth&#x20;throttling&#x20;settings&#x20;&#40;counted&#x20;after&#x20;service&#x20;start&#x20;up&#41;.',19,1,0,0,300,0,'','','','select&#x20;TotalAllowedAsyncIORequests&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(380,'IIS&#x20;TotalAnonymousUsers','Total&#x20;number&#x20;of&#x20;users&#x20;who&#x20;established&#x20;an&#x20;anonymous&#x20;connection&#x20;with&#x20;the&#x20;Web&#x20;service&#x20;&#40;counted&#x20;after&#x20;service&#x20;start&#x20;up&#41;.',19,1,0,0,300,0,'','','','select&#x20;TotalAnonymousUsers&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(382,'IIS&#x20;TotalBlockedAsyncIORequests','Total&#x20;requests&#x20;that&#x20;are&#x20;temporarily&#x20;blocked&#x20;due&#x20;to&#x20;bandwidth&#x20;throttling&#x20;settings&#x20;&#40;counted&#x20;after&#x20;service&#x20;startup&#41;.',19,1,0,0,300,0,'','','','select&#x20;TotalBlockedAsyncIORequests&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(384,'IIS&#x20;UnlockRequestsPersec','Rate&#x20;at&#x20;which&#x20;HTTP&#x20;requests&#x20;using&#x20;the&#x20;UNLOCK&#x20;method&#x20;are&#x20;made.&#x20;UNLOCK&#x20;requests&#x20;are&#x20;used&#x20;to&#x20;remove&#x20;locks&#x20;from&#x20;files.',19,1,0,0,300,0,'','','','select&#x20;UnlockRequestsPersec&#x20;from&#x20;Win32_PerfRawData_W3SVC_WebService',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(385,'Exchange&#x20;AvgRecipientsPermsgReceived','Average&#x20;number&#x20;of&#x20;recipients&#x20;per&#x20;inbound&#x20;message&#x20;received.',20,1,0,0,300,0,'','','','select&#x20;AvgRecipientsPermsgReceived&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(386,'Exchange&#x20;AvgRecipientsPermsgSent','Average&#x20;number&#x20;of&#x20;recipients&#x20;per&#x20;outbound&#x20;messages&#x20;sent.',20,1,0,0,300,0,'','','','select&#x20;AvgRecipientsPermsgSent&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(387,'Exchange&#x20;AvgRetriesPermsgDelivered','Average&#x20;number&#x20;of&#x20;retries&#x20;per&#x20;local&#x20;delivery.',20,1,0,0,300,0,'','','','select&#x20;AvgRetriesPermsgDelivered&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(388,'Exchange&#x20;AvgRetriesPermsgSent','Average&#x20;number&#x20;of&#x20;retries&#x20;per&#x20;outbound&#x20;message&#x20;sent.',20,1,0,0,300,0,'','','','select&#x20;AvgRetriesPermsgSent&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(389,'Exchange&#x20;BadmailedMessagesBadPickupFile','Number&#x20;of&#x20;malformed&#x20;pickup&#x20;messages&#x20;sent&#x20;to&#x20;the&#x20;SMTP&#x20;bad&#x20;mail&#x20;directory.',20,1,0,0,300,0,'','','','select&#x20;BadmailedMessagesBadPickupFile&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(390,'Exchange&#x20;BadmailedMessagesGeneralFailure','Number&#x20;of&#x20;messages&#x20;sent&#x20;to&#x20;badmail&#x20;for&#x20;reasons&#x20;not&#x20;associated&#x20;with&#x20;a&#x20;specific&#x20;counter.',20,1,0,0,300,0,'','','','select&#x20;BadmailedMessagesGeneralFailure&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(391,'Exchange&#x20;BadmailedMessagesHopCountExceeded','Number&#x20;of&#x20;messages&#x20;sent&#x20;to&#x20;badmail&#x20;because&#x20;they&#x20;had&#x20;exceeded&#x20;the&#x20;maximum&#x20;hop&#x20;count.',20,1,0,0,300,0,'','','','select&#x20;BadmailedMessagesHopCountExceeded&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(392,'Exchange&#x20;BadmailedMessagesNDRofDSN','Number&#x20;of&#x20;delivery&#x20;status&#x20;notifications&#x20;sent&#x20;to&#x20;badmail&#x20;because&#x20;they&#x20;could&#x20;not&#x20;be&#x20;delivered.',20,1,0,0,300,0,'','','','select&#x20;BadmailedMessagesNDRofDSN&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(393,'Exchange&#x20;BadmailedMessagesNoRecipients','Number&#x20;of&#x20;messages&#x20;sent&#x20;to&#x20;badmail&#x20;because&#x20;they&#x20;had&#x20;no&#x20;recipients.',20,1,0,0,300,0,'','','','select&#x20;BadmailedMessagesNoRecipients&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(394,'Exchange&#x20;BadmailedMessagesTriggeredviaEvent','Number&#x20;of&#x20;messages&#x20;sent&#x20;to&#x20;badmail&#x20;at&#x20;the&#x20;request&#x20;of&#x20;a&#x20;server&#x20;event&#x20;sink.',20,1,0,0,300,0,'','','','select&#x20;BadmailedMessagesTriggeredviaEvent&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(395,'Exchange&#x20;BytesReceivedPersec','Rate&#x20;at&#x20;which&#x20;bytes&#x20;are&#x20;received&#x20;in&#x20;messages.',20,1,0,0,300,0,'','','','select&#x20;BytesReceivedPersec&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(396,'Exchange&#x20;BytesReceivedTotal','Total&#x20;number&#x20;of&#x20;bytes&#x20;received&#x20;in&#x20;messages.',20,1,0,0,300,0,'','','','select&#x20;BytesReceivedTotal&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(397,'Exchange&#x20;BytesSentPersec','Rate&#x20;at&#x20;which&#x20;bytes&#x20;are&#x20;sent&#x20;in&#x20;messages.',20,1,0,0,300,0,'','','','select&#x20;BytesSentPersec&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(398,'Exchange&#x20;BytesSentTotal','Total&#x20;number&#x20;of&#x20;bytes&#x20;sent&#x20;in&#x20;messages.',20,1,0,0,300,0,'','','','select&#x20;BytesSentTotal&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(399,'Exchange&#x20;BytesTotal','Rate&#x20;at&#x20;which&#x20;bytes&#x20;are&#x20;sent&#x20;and&#x20;received.',20,1,0,0,300,0,'','','','select&#x20;BytesTotal&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(400,'Exchange&#x20;BytesTotalPersec','Rate&#x20;at&#x20;which&#x20;bytes&#x20;are&#x20;sent&#x20;and&#x20;received.',20,1,0,0,300,0,'','','','select&#x20;BytesTotalPersec&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(401,'Exchange&#x20;CatAddresslookupcompletions','Number&#x20;of&#x20;address&#x20;lookup&#x20;completions&#x20;processed.',20,1,0,0,300,0,'','','','select&#x20;CatAddresslookupcompletions&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(402,'Exchange&#x20;CatAddresslookupcompletionsPersec','Number&#x20;of&#x20;address&#x20;lookup&#x20;completions&#x20;processed&#x20;per&#x20;second.',20,1,0,0,300,0,'','','','select&#x20;CatAddresslookupcompletionsPersec&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(403,'Exchange&#x20;CatAddresslookups','Number&#x20;of&#x20;Directory&#x20;Services&#x20;&#40;DS&#41;&#x20;lookups&#x20;for&#x20;individual&#x20;addresses.',20,1,0,0,300,0,'','','','select&#x20;CatAddresslookups&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(404,'Exchange&#x20;CatAddressLookupsNotFound','Number&#x20;of&#x20;address&#x20;lookups&#x20;that&#x20;did&#x20;not&#x20;find&#x20;any&#x20;DS&#x20;object.',20,1,0,0,300,0,'','','','select&#x20;CatAddresslookupsnotfound&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(405,'Exchange&#x20;CatAddresslookupsPersec','Number&#x20;of&#x20;address&#x20;lookups&#x20;dispatched&#x20;to&#x20;the&#x20;DS&#x20;per&#x20;second.',20,1,0,0,300,0,'','','','select&#x20;CatAddresslookupsPersec&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(406,'Exchange&#x20;CatCategorizationscompleted','Total&#x20;number&#x20;of&#x20;messages&#x20;submitted&#x20;to&#x20;the&#x20;categorizer&#x20;that&#x20;have&#x20;finished&#x20;categorization.',20,1,0,0,300,0,'','','','select&#x20;CatCategorizationscompleted&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(407,'Exchange&#x20;CatCategorizationscompletedPersec','Rate&#x20;of&#x20;categorizations&#x20;completed.',20,1,0,0,300,0,'','','','select&#x20;CatCategorizationscompletedPersec&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(408,'Exchange&#x20;CatCategorizationscompletedsuccessfully','Number&#x20;of&#x20;categorizations&#x20;that&#x20;completed&#x20;without&#x20;any&#x20;errors.\r\n',20,1,0,0,300,0,'','','','select&#x20;CatCategorizationscompletedsuccessfully&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(409,'Exchange&#x20;CatCategorizationsfailedDSconnectionfailure','Number&#x20;of&#x20;categorizations&#x20;that&#x20;failed.',20,1,0,0,300,0,'','','','select&#x20;CatCategorizationsfailedDSconnectionfailure&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(410,'Exchange&#x20;CatCategorizationsfailedDSlogonfailure','Number&#x20;of&#x20;categorizations&#x20;that&#x20;failed&#x20;due&#x20;to&#x20;a&#x20;DS&#x20;logon&#x20;failure',20,1,0,0,300,0,'','','','select&#x20;CatCategorizationsfailedDSlogonfailure&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(411,'Exchange&#x20;CatCategorizationsfailednonretryableerror','Number&#x20;of&#x20;categorizations&#x20;that&#x20;failed&#x20;with&#x20;a&#x20;hard&#x20;error&#x20;&#40;cannot&#x20;be&#x20;retried&#41;.',20,1,0,0,300,0,'','','','select&#x20;CatCategorizationsfailednonretryableerror&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(412,'Exchange&#x20;CatCategorizationsfailedOutOfMemory','Number&#x20;of&#x20;categorizations&#x20;that&#x20;failed&#x20;due&#x20;to&#x20;lack&#x20;of&#x20;available&#x20;memory.',20,1,0,0,300,0,'','','','select&#x20;CatCategorizationsfailedOutOfMemory&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(413,'Exchange&#x20;CatCategorizationsfailedretryableerror&#x20;','Number&#x20;of&#x20;categorizations&#x20;that&#x20;failed&#x20;with&#x20;an&#x20;error&#x20;that&#x20;could&#x20;be&#x20;retried.',20,1,0,0,300,0,'','','','SELECT&#x20;CatCategorizationsfailedretryableerror&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(414,'Exchange&#x20;CatCategorizationsfailedsinkretryableerror','Number&#x20;of&#x20;categorizations&#x20;that&#x20;failed&#x20;with&#x20;a&#x20;generic&#x20;error&#x20;that&#x20;could&#x20;be&#x20;retried.',20,1,0,0,300,0,'','','','select&#x20;CatCategorizationsfailedsinkretryableerror&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(415,'Exchange&#x20;CatCategorizationsinprogress','Number&#x20;of&#x20;categorizations&#x20;in&#x20;progress.',20,1,0,0,300,0,'','','','select&#x20;CatCategorizationsinprogress&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(416,'Exchange&#x20;CategorizerQueueLength','Number&#x20;of&#x20;messages&#x20;in&#x20;the&#x20;categorizer&#x20;queue.',20,1,0,0,300,0,'','','','select&#x20;CategorizerQueueLength&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(417,'LDAP&#x20;CatLDAPbindfailures','Total&#x20;number&#x20;of&#x20;LDAP&#x20;bind&#x20;failures.',21,1,0,0,300,0,'','','','select&#x20;CatLDAPbindfailures&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',1,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(418,'LDAP&#x20;CatLDAPbinds','Total&#x20;number&#x20;of&#x20;successful&#x20;LDAP&#x20;bind&#x20;operations&#x20;performed',21,1,0,0,300,0,'','','','select&#x20;CatLDAPbinds&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(419,'LDAP&#x20;CatLDAPconnectionfailures','Total&#x20;number&#x20;of&#x20;failed&#x20;LDAP&#x20;connections.\r\n',21,1,0,0,300,0,'','','','select&#x20;CatLDAPconnectionfailures&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',1,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(420,'LDAP&#x20;CatLDAPconnections','Total&#x20;number&#x20;of&#x20;LDAP&#x20;connections&#x20;opened.',21,1,0,0,300,0,'','','','select&#x20;CatLDAPconnections&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(421,'LDAP&#x20;CatLDAPconnectionscurrentlyopen','Number&#x20;of&#x20;LDAP&#x20;connections&#x20;currently&#x20;open.',21,1,0,0,300,0,'','','','select&#x20;CatLDAPconnectionscurrentlyopen&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',1,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(422,'LDAP&#x20;CatLDAPGeneralCompletionFailures','Number&#x20;of&#x20;LDAP&#x20;completions&#x20;with&#x20;a&#x20;generic&#x20;failure.',21,1,0,0,300,0,'','','','select&#x20;CatLDAPgeneralcompletionfailures&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(423,'LDAP&#x20;CatLDAPpagedsearchcompletionfailures','Number&#x20;of&#x20;LDAP&#x20;completions&#x20;with&#x20;a&#x20;generic&#x20;failure.',21,1,0,0,300,0,'','','','select&#x20;CatLDAPpagedsearchcompletionfailures&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(424,'LDAP&#x20;CatLDAPpagedsearches','LDAP&#x20;paged&#x20;searches&#x20;successfully&#x20;dispatched.',21,1,0,0,300,0,'','','','select&#x20;CatLDAPpagedsearches&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(425,'LDAP&#x20;CatLDAPpagedsearchescompleted&#x20;','LDAP&#x20;paged&#x20;searches&#x20;successfully&#x20;dispatched.',21,1,0,0,300,0,'','','','select&#x20;CatLDAPpagedsearchescompleted&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(426,'LDAP&#x20;CatLDAPpagedsearchfailures','Number&#x20;of&#x20;failures&#x20;to&#x20;dispatch&#x20;an&#x20;asynchronous&#x20;LDAP&#x20;page&#x20;search.',21,1,0,0,300,0,'','','','select&#x20;CatLDAPpagedsearchfailures&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(427,'LDAP&#x20;CatLDAPsearchcompletionfailures','Number&#x20;of&#x20;LDAP&#x20;searches&#x20;that&#x20;completed&#x20;with&#x20;a&#x20;failure.',21,1,0,0,300,0,'','','','select&#x20;CatLDAPsearchcompletionfailures&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(428,'LDAP&#x20;CatLDAPsearches','LDAP&#x20;searches&#x20;successfully&#x20;dispatched.',21,1,0,0,300,0,'','','','select&#x20;CatLDAPsearches&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(429,'LDAP&#x20;CatLDAPsearchesabandoned','Number&#x20;of&#x20;LDAP&#x20;searches&#x20;abandoned.',21,1,0,0,300,0,'','','','select&#x20;CatLDAPsearchesabandoned&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(430,'LDAP&#x20;CatLDAPsearchescompleted','Number&#x20;of&#x20;LDAP&#x20;search&#x20;completions&#x20;processed.\r\n',21,1,0,0,300,0,'','','','select&#x20;CatLDAPsearchescompleted&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(431,'LDAP&#x20;CatLDAPsearchescompletedPersec','LDAP&#x20;search&#x20;completions&#x20;processed&#x20;per&#x20;second.',21,1,0,0,300,0,'','','','select&#x20;CatLDAPsearchescompletedPersec&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(432,'LDAP&#x20;CatLDAP&#x20;archespendingcompletion','Number&#x20;of&#x20;LDAP&#x20;searches&#x20;pending&#x20;async&#x20;completion.',21,1,0,0,300,0,'','','','select&#x20;CatLDAPsearchespendingcompletion&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(433,'LDAP&#x20;CatLDAPsearchesPersec','LDAP&#x20;searches&#x20;successfully&#x20;dispatched&#x20;per&#x20;second.',21,1,0,0,300,0,'','','','select&#x20;CatLDAPsearchesPersec&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(434,'LDAP&#x20;CatLDAPsearchfailures','Number&#x20;of&#x20;failures&#x20;to&#x20;dispatch&#x20;an&#x20;async&#x20;LDAP&#x20;search.',21,1,0,0,300,0,'','','','select&#x20;CatLDAPsearchfailures&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(435,'Exchange&#x20;Catmailmsgduplicatecollisions','Number&#x20;of&#x20;times&#x20;a&#x20;duplicate&#x20;recipient&#x20;address&#x20;was&#x20;detected&#x20;by&#x20;mailmsg&#x20;or&#x20;categorizer.',20,1,0,0,300,0,'','','','select&#x20;Catmailmsgduplicatecollisions&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(436,'Exchange&#x20;CatMessagesaborted','Number&#x20;of&#x20;messages&#x20;marked&#x20;to&#x20;be&#x20;canceled&#x20;by&#x20;the&#x20;categorizer.',20,1,0,0,300,0,'','','','select&#x20;CatMessagesaborted&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(437,'Exchange&#x20;CatMessagesbifurcated','Number&#x20;of&#x20;new&#x20;messages&#x20;created&#x20;by&#x20;the&#x20;categorizer&#x20;&#40;bifurcation&#41;.',20,1,0,0,300,0,'','','','select&#x20;CatMessagesbifurcated&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(438,'Exchange&#x20;CatMessagesCategorized','Number&#x20;of&#x20;messages&#x20;categorizer&#x20;has&#x20;submitted&#x20;to&#x20;queuing.',20,1,0,0,300,0,'','','','select&#x20;CatMessagesCategorized&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(439,'Exchange&#x20;CatMessagessubmitted','Rate&#x20;at&#x20;which&#x20;messages&#x20;are&#x20;being&#x20;submitted&#x20;to&#x20;the&#x20;categorizer.',20,1,0,0,300,0,'','','','select&#x20;CatMessagessubmitted&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(440,'Exchange&#x20;CatMessagessubmittedPersec','Rate&#x20;at&#x20;which&#x20;messages&#x20;are&#x20;being&#x20;submitted&#x20;to&#x20;the&#x20;categorizer.',20,1,0,0,300,0,'','','','select&#x20;CatMessagessubmittedPersec&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',1,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(441,'Exchange&#x20;CatRecipientsaftercategorization','Number&#x20;of&#x20;mailmsg&#x20;recipients&#x20;submitted&#x20;from&#x20;categorizer&#x20;to&#x20;queuing.',20,1,0,0,300,0,'','','','select&#x20;CatRecipientsaftercategorization&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(442,'Exchange&#x20;CatRecipientsbeforecategorization','Number&#x20;of&#x20;mailmsg&#x20;recipients&#x20;submitted&#x20;to&#x20;categorizer.',20,1,0,0,300,0,'','','','select&#x20;CatRecipientsbeforecategorization&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',1,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(443,'Exchange&#x20;CatRecipientsincategorization','Number&#x20;of&#x20;recipients&#x20;that&#x20;the&#x20;categorizer&#x20;is&#x20;currently&#x20;processing.',20,1,0,0,300,0,'','','','select&#x20;CatRecipientsincategorization&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(444,'Exchange&#x20;CatRecipientsNDRdambiguousaddress','Number&#x20;of&#x20;recipients&#x20;with&#x20;addresses&#x20;that&#x20;match&#x20;multiple&#x20;DS&#x20;objects.',20,1,0,0,300,0,'','','','select&#x20;CatRecipientsNDRdambiguousaddress&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(445,'Exchange&#x20;CatRecipientsNDRdbycategorizer','Number&#x20;of&#x20;recipients&#x20;set&#x20;to&#x20;receive&#x20;a&#x20;non-delivery&#x20;report&#x20;from&#x20;the&#x20;categorizer.',20,1,0,0,300,0,'','','','select&#x20;CatRecipientsNDRdbycategorizer&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(446,'Exchange&#x20;CatRecipientsNDRdforwardingloop','Number&#x20;of&#x20;recipients&#x20;that&#x20;received&#x20;a&#x20;non-delivery&#x20;report&#x20;from&#x20;the&#x20;categorizer&#x20;due&#x20;to&#x20;a&#x20;forwarding&#x20;loop&#x20;detection.',20,1,0,0,300,0,'','','','select&#x20;CatRecipientsNDRdforwardingloop&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',1,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(447,'Exchange&#x20;CatRecipientsNDRdillegaladdress','Number&#x20;of&#x20;recipients&#x20;with&#x20;illegal&#x20;addresses&#x20;detected&#x20;by&#x20;the&#x20;categorizer.',20,1,0,0,300,0,'','','','select&#x20;CatRecipientsNDRdillegaladdress&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(448,'Exchange&#x20;CatRecipientsNDRdsinkreciperrors','Number&#x20;of&#x20;recipients&#x20;that&#x20;received&#x20;a&#x20;non-delivery&#x20;report&#x20;from&#x20;the&#x20;categorizer&#x20;due&#x20;to&#x20;a&#x20;generic&#x20;recipient&#x20;failure.',20,1,0,0,300,0,'','','','select&#x20;CatRecipientsNDRdsinkreciperrors&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(449,'Exchange&#x20;CatRecipientsNDRdunresolved','Number&#x20;of&#x20;senders&#x20;not&#x20;found&#x20;in&#x20;the&#x20;DS.',20,1,0,0,300,0,'','','','select&#x20;CatRecipientsNDRdunresolved&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(450,'Exchange&#x20;CatSendersunresolved','Number&#x20;of&#x20;senders&#x20;not&#x20;found&#x20;in&#x20;the&#x20;DS.',20,1,0,0,300,0,'','','','select&#x20;CatSendersunresolved&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(451,'Exchange&#x20;CatSenderswithambiguousaddresses','Number&#x20;of&#x20;senders&#x20;with&#x20;addresses&#x20;that&#x20;match&#x20;multiple&#x20;DS&#x20;objects.',20,1,0,0,300,0,'','','','select&#x20;CatSenderswithambiguousaddresses&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(452,'Exchange&#x20;ConnectionErrorsPersec','Number&#x20;of&#x20;connection&#x20;errors&#x20;per&#x20;second.',20,1,0,0,300,0,'','','','select&#x20;ConnectionErrorsPersec&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(453,'Exchange&#x20;CurrentMessagesinLocalDelivery','Number&#x20;of&#x20;messages&#x20;that&#x20;are&#x20;currently&#x20;being&#x20;processed&#x20;by&#x20;a&#x20;server&#x20;event&#x20;sink&#x20;for&#x20;local&#x20;delivery.',20,1,0,0,300,0,'','','','select&#x20;CurrentMessagesinLocalDelivery&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(454,'Exchange&#x20;DirectoryDropsPersec','Number&#x20;of&#x20;messages&#x20;placed&#x20;in&#x20;a&#x20;drop&#x20;directory&#x20;per&#x20;second.',20,1,0,0,300,0,'','','','select&#x20;DirectoryDropsPersec&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(455,'Exchange&#x20;DirectoryDropsTotal','Total&#x20;number&#x20;of&#x20;messages&#x20;placed&#x20;in&#x20;a&#x20;drop&#x20;directory.',20,1,0,0,300,0,'','','','select&#x20;DirectoryDropsTotal&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(456,'Exchange&#x20;DNSQueriesPersec','Rate&#x20;of&#x20;DNS&#x20;lookups.',20,1,0,0,300,0,'','','','select&#x20;DNSQueriesPersec&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(457,'Exchange&#x20;DNSQueriesTotal','Total&#x20;number&#x20;of&#x20;DNS&#x20;lookups.',20,1,0,0,300,0,'','','','select&#x20;DNSQueriesTotal&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(458,'Exchange&#x20;ETRNMessagesPersec','Number&#x20;of&#x20;Extended&#x20;Simple&#x20;Mail&#x20;Transport&#x20;Protocol&#x20;&#40;ETRN&#41;&#x20;messages&#x20;per&#x20;second.',20,1,0,0,300,0,'','','','select&#x20;ETRNMessagesPersec&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(459,'Exchange&#x20;ETRNMessagesTotal','Total&#x20;number&#x20;of&#x20;ETRN&#x20;messages&#x20;received&#x20;by&#x20;the&#x20;server.',20,1,0,0,300,0,'','','','select&#x20;ETRNMessagesTotal&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(460,'Exchange&#x20;InboundConnectionsCurrent','Total&#x20;current&#x20;inbound&#x20;connections',20,1,0,0,300,0,'','','','select&#x20;InboundConnectionsCurrent&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(461,'Exchange&#x20;InboundConnectionsTotal','Total&#x20;number&#x20;of&#x20;inbound&#x20;connections&#x20;received.',20,1,0,0,300,0,'','','','select&#x20;InboundConnectionsTotal&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(462,'Exchange&#x20;LocalQueueLength','Number&#x20;of&#x20;messages&#x20;in&#x20;the&#x20;local&#x20;queue.',20,1,0,0,300,0,'','','','select&#x20;LocalQueueLength&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(463,'Exchange&#x20;LocalRetryQueueLength','Number&#x20;of&#x20;messages&#x20;in&#x20;the&#x20;local&#x20;retry&#x20;queue.',20,1,0,0,300,0,'','','','select&#x20;LocalRetryQueueLength&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(464,'Exchange&#x20;MessageBytesReceivedPersec','Rate&#x20;that&#x20;bytes&#x20;are&#x20;received&#x20;in&#x20;messages.',20,1,0,0,300,0,'','','','select&#x20;MessageBytesReceivedPersec&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(465,'Exchange&#x20;MessageBytesReceivedTotal','Total&#x20;number&#x20;of&#x20;bytes&#x20;received&#x20;in&#x20;messages.',20,1,0,0,300,0,'','','','select&#x20;MessageBytesReceivedTotal&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(466,'Exchange&#x20;MessageBytesSentPersec','Rate&#x20;that&#x20;bytes&#x20;are&#x20;sent&#x20;in&#x20;messages.',20,1,0,0,300,0,'','','','select&#x20;MessageBytesSentPersec&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(467,'Exchange&#x20;MessageBytesSentTotal','Total&#x20;number&#x20;of&#x20;bytes&#x20;sent&#x20;in&#x20;messages.',20,1,0,0,300,0,'','','','select&#x20;MessageBytesSentTotal&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(468,'Exchange&#x20;MessageBytesTotal','Total&#x20;number&#x20;of&#x20;bytes&#x20;sent&#x20;and&#x20;received&#x20;in&#x20;messages.',20,1,0,0,300,0,'','','','select&#x20;MessageBytesTotal&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(469,'Exchange&#x20;MessageBytesTotalPersec','Rate&#x20;at&#x20;which&#x20;bytes&#x20;are&#x20;sent&#x20;and&#x20;received&#x20;in&#x20;messages.',20,1,0,0,300,0,'','','','select&#x20;MessageBytesTotalPersec&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(470,'Exchange&#x20;&#x20;MessageDeliveryRetries','Total&#x20;number&#x20;of&#x20;local&#x20;deliveries&#x20;that&#x20;were&#x20;retried.',20,1,0,0,300,0,'','','','select&#x20;MessageDeliveryRetries&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(471,'Exchange&#x20;MessagesCurrentlyUndeliverable','Number&#x20;of&#x20;messages&#x20;that&#x20;have&#x20;been&#x20;reported&#x20;as&#x20;currently&#x20;undeliverable&#x20;by&#x20;routing.',20,1,0,0,300,0,'','','','select&#x20;MessagesCurrentlyUndeliverable&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(472,'Exchange&#x20;MessagesDeliveredPersec','Rate&#x20;at&#x20;which&#x20;messages&#x20;are&#x20;delivered&#x20;to&#x20;local&#x20;mailboxes.\r\n',20,1,0,0,300,0,'','','','select&#x20;MessagesDeliveredPersec&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(473,'Exchange&#x20;MessagesDeliveredTotal','Total&#x20;number&#x20;of&#x20;messages&#x20;delivered&#x20;to&#x20;local&#x20;mailboxes.',20,1,0,0,300,0,'','','','select&#x20;MessagesDeliveredTotal&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(474,'Exchange&#x20;MessageSendRetries','Total&#x20;number&#x20;of&#x20;outbound&#x20;message&#x20;send&#x20;operations&#x20;that&#x20;were&#x20;retried.',20,1,0,0,300,0,'','','','select&#x20;MessageSendRetries&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(475,'Exchange&#x20;MessagesPendingRouting','Number&#x20;of&#x20;messages&#x20;that&#x20;have&#x20;been&#x20;categorized&#x20;but&#x20;not&#x20;routed.',20,1,0,0,300,0,'','','','select&#x20;MessagesPendingRouting&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(476,'Exchange&#x20;MessagesReceivedPersec','Rate&#x20;that&#x20;inbound&#x20;messages&#x20;are&#x20;being&#x20;received.\r\n',20,1,0,0,300,0,'','','','select&#x20;MessagesReceivedPersec&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(477,'Exchange&#x20;MessagesReceivedTotal','Total&#x20;number&#x20;of&#x20;inbound&#x20;messages&#x20;accepted.',20,1,0,0,300,0,'','','','select&#x20;MessagesReceivedTotal&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(478,'Exchange&#x20;MessagesRefusedforAddressObjects','Total&#x20;number&#x20;of&#x20;messages&#x20;refused&#x20;due&#x20;to&#x20;lack&#x20;of&#x20;address&#x20;objects.',20,1,0,0,300,0,'','','','select&#x20;MessagesRefusedforAddressObjects&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(479,'Exchange&#x20;MessagesRefusedforMailObjects','Total&#x20;number&#x20;of&#x20;messages&#x20;refused&#x20;due&#x20;to&#x20;lack&#x20;of&#x20;mail&#x20;objects.',20,1,0,0,300,0,'','','','select&#x20;MessagesRefusedforMailObjects&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(480,'Exchange&#x20;MessagesRefusedforSize','Total&#x20;number&#x20;of&#x20;messages&#x20;rejected&#x20;because&#x20;they&#x20;were&#x20;too&#x20;big.',20,1,0,0,300,0,'','','','select&#x20;MessagesRefusedforSize&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(481,'Exchange&#x20;MessagesSentPersec','Rate&#x20;at&#x20;which&#x20;outbound&#x20;messages&#x20;are&#x20;being&#x20;sent.',20,1,0,0,300,0,'','','','select&#x20;MessagesSentPersec&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(482,'Exchange&#x20;MessagesSentTotal','Total&#x20;number&#x20;of&#x20;outbound&#x20;messages&#x20;sent.',20,1,0,0,300,0,'','','','select&#x20;MessagesSentTotal&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(483,'Exchange&#x20;NDRsGenerated','Number&#x20;of&#x20;non-delivery&#x20;reports&#x20;that&#x20;have&#x20;been&#x20;generated.',20,1,0,0,300,0,'','','','select&#x20;NDRsGenerated&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(484,'Exchange&#x20;NumberofMailFilesOpen','Number&#x20;of&#x20;handles&#x20;to&#x20;open&#x20;mail&#x20;files.',20,1,0,0,300,0,'','','','select&#x20;NumberofMailFilesOpen&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(485,'Exchange&#x20;NumberofQueueFilesOpen','Number&#x20;of&#x20;handles&#x20;to&#x20;open&#x20;queue&#x20;files.',20,1,0,0,300,0,'','','','select&#x20;NumberofQueueFilesOpen&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(486,'Exchange&#x20;OutboundConnectionsCurrent','Number&#x20;of&#x20;connections&#x20;currently&#x20;outbound.',20,1,0,0,300,0,'','','','select&#x20;OutboundConnectionsCurrent&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(487,'Exchange&#x20;OutboundConnectionsRefused','Number&#x20;of&#x20;outbound&#x20;connection&#x20;attempts&#x20;refused&#x20;by&#x20;remote&#x20;sites.',20,1,0,0,300,0,'','','','select&#x20;OutboundConnectionsRefused&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(488,'Exchange&#x20;OutboundConnectionsTotal','Total&#x20;number&#x20;of&#x20;outbound&#x20;connections&#x20;attempted.',20,1,0,0,300,0,'','','','select&#x20;OutboundConnectionsTotal&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(489,'Exchange&#x20;PercentRecipientsLocal','Percentage&#x20;of&#x20;recipients&#x20;that&#x20;will&#x20;be&#x20;delivered&#x20;locally.',20,1,0,0,300,0,'','','','select&#x20;PercentRecipientsLocal&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(490,'Exchange&#x20;PercentRecipientsRemote','Percentage&#x20;of&#x20;recipients&#x20;that&#x20;will&#x20;be&#x20;delivered&#x20;remotely.',20,1,0,0,300,0,'','','','select&#x20;PercentRecipientsRemote&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(491,'Exchange&#x20;PickupDirectoryMessagesRetrievedPersec','Rate&#x20;at&#x20;which&#x20;messages&#x20;are&#x20;being&#x20;retrieved&#x20;from&#x20;the&#x20;mail&#x20;pick-up&#x20;directory.',20,1,0,0,300,0,'','','','select&#x20;PickupDirectoryMessagesRetrievedPersec&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(492,'Exchange&#x20;PickupDirectoryMessagesRetrievedTotal&#x20;','Total&#x20;number&#x20;of&#x20;messages&#x20;retrieved&#x20;from&#x20;the&#x20;mail&#x20;pick-up&#x20;directory.',20,1,0,0,300,0,'','','','select&#x20;PickupDirectoryMessagesRetrievedTotal&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(493,'Exchange&#x20;RemoteQueueLength','Number&#x20;of&#x20;messages&#x20;in&#x20;the&#x20;remote&#x20;queue.',20,1,0,0,300,0,'','','','select&#x20;RemoteQueueLength&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(494,'Exchange&#x20;RemoteRetryQueueLength','Number&#x20;of&#x20;messages&#x20;in&#x20;the&#x20;retry&#x20;queue&#x20;for&#x20;remote&#x20;delivery.',20,1,0,0,300,0,'','','','select&#x20;RemoteRetryQueueLength&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(495,'Exchange&#x20;RoutingTableLookupsPersec','Number&#x20;of&#x20;routing&#x20;table&#x20;lookups&#x20;per&#x20;second.',20,1,0,0,300,0,'','','','select&#x20;RoutingTableLookupsPersec&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(496,'Exchange&#x20;RoutingTableLookups','Total&#x20;number&#x20;of&#x20;routing&#x20;table&#x20;lookups.',20,1,0,0,300,0,'','','','select&#x20;RoutingTableLookupsTotal&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(497,'Exchange&#x20;TotalConnectionErrors','Total&#x20;number&#x20;of&#x20;connection&#x20;errors.',20,1,0,0,300,0,'','','','select&#x20;TotalConnectionErrors&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(498,'Exchange&#x20;TotalDSNFailures','Total&#x20;number&#x20;of&#x20;failed&#x20;DSN&#x20;generation&#x20;attempts.',20,1,0,0,300,0,'','','','select&#x20;TotalDSNFailures&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(499,'Exchange&#x20;Totalmessagessubmitted','Total&#x20;messages&#x20;submitted&#x20;to&#x20;queuing&#x20;for&#x20;delivery.',20,1,0,0,300,0,'','','','select&#x20;Totalmessagessubmitted&#x20;from&#x20;Win32_PerfFormattedData_SMTPSVC_SMTPServer',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(501,'MSDTC&#x20;AbortedTransactions','Number&#x20;of&#x20;canceled&#x20;transactions.',22,1,0,0,300,0,'','','','select&#x20;AbortedTransactions&#x20;from&#x20;Win32_PerfRawData_MSDTC_DistributedTransactionCoordinator',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(502,'MSDTC&#x20;AbortedTransactionsPersec','Transactions&#x20;canceled&#x20;per&#x20;second.',22,1,0,0,300,0,'','','','select&#x20;AbortedTransactionsPersec&#x20;from&#x20;Win32_PerfRawData_MSDTC_DistributedTransactionCoordinator',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(503,'MSDTC&#x20;ActiveTransactions','Number&#x20;of&#x20;currently&#x20;active&#x20;transactions.',22,1,0,0,300,0,'','','','select&#x20;ActiveTransactions&#x20;from&#x20;Win32_PerfRawData_MSDTC_DistributedTransactionCoordinator',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(504,'MSDTC&#x20;ActiveTransactionsMaximum','Maximum&#x20;number&#x20;of&#x20;transactions&#x20;ever&#x20;concurrently&#x20;active.',22,1,0,0,300,0,'','','','select&#x20;ActiveTransactionsMaximum&#x20;from&#x20;Win32_PerfRawData_MSDTC_DistributedTransactionCoordinator',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(505,'MSDTC&#x20;CommittedTransactions','Number&#x20;of&#x20;committed&#x20;transactions.\r\n',22,1,0,0,300,0,'','','','select&#x20;CommittedTransactions&#x20;from&#x20;Win32_PerfRawData_MSDTC_DistributedTransactionCoordinator',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(506,'MSDTC&#x20;CommittedTransactionsPersec','Transactions&#x20;committed&#x20;per&#x20;second.',22,1,0,0,300,0,'','','','select&#x20;CommittedTransactionsPersec&#x20;from&#x20;Win32_PerfRawData_MSDTC_DistributedTransactionCoordinator',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(507,'MSDTC&#x20;ForceAbortedTransactions','Number&#x20;of&#x20;transactions&#x20;canceled&#x20;by&#x20;the&#x20;system&#x20;administrator.',22,1,0,0,300,0,'','','','select&#x20;ForceAbortedTransactions&#x20;from&#x20;Win32_PerfRawData_MSDTC_DistributedTransactionCoordinator',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(508,'MSDTC&#x20;ForceCommittedTransactions','Number&#x20;of&#x20;transactions&#x20;committed&#x20;by&#x20;the&#x20;system&#x20;administrator.',22,1,0,0,300,0,'','','','select&#x20;ForceCommittedTransactions&#x20;from&#x20;Win32_PerfRawData_MSDTC_DistributedTransactionCoordinator',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(509,'MSDTC&#x20;InDoubtTransactions','Number&#x20;of&#x20;transactions&#x20;whose&#x20;outcomes&#x20;are&#x20;in&#x20;doubt.',22,1,0,0,300,0,'','','','select&#x20;InDoubtTransactions&#x20;from&#x20;Win32_PerfRawData_MSDTC_DistributedTransactionCoordinator',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(510,'MSDTC&#x20;ResponseTimeAverage','Average&#x20;time&#x20;delta&#x20;between&#x20;transaction&#x20;beginning&#x20;and&#x20;commitment.',22,1,0,0,300,0,'','','','select&#x20;ResponseTimeAverage&#x20;from&#x20;Win32_PerfRawData_MSDTC_DistributedTransactionCoordinator',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(511,'MSDTC&#x20;ResponseTimeMaximum','Maximum&#x20;time&#x20;delta&#x20;between&#x20;transaction&#x20;beginning&#x20;and&#x20;commitment.',22,1,0,0,300,0,'','','','select&#x20;ResponseTimeMaximum&#x20;from&#x20;Win32_PerfRawData_MSDTC_DistributedTransactionCoordinator',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(512,'MSDTC&#x20;ResponseTimeMinimum','Minimum&#x20;time&#x20;delta&#x20;between&#x20;transaction&#x20;beginning&#x20;and&#x20;commitment.',22,1,0,0,300,0,'','','','select&#x20;ResponseTimeMinimum&#x20;from&#x20;Win32_PerfRawData_MSDTC_DistributedTransactionCoordinator',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(513,'MSDTC&#x20;TransactionsPersec','Transactions&#x20;performed&#x20;per&#x20;second.',22,1,0,0,300,0,'','','','select&#x20;TransactionsPersec&#x20;from&#x20;Win32_PerfRawData_MSDTC_DistributedTransactionCoordinator',3,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(514,'c2900InfoPeakBuffersUsed','ftp://ftp.cisco.com/pub/mibs/oid/CISCO-C2900-MIB.oid',23,15,0,0,300,0,'','','public','1.3.6.1.4.1.9.9.87.1.1.2.0',2,2,0,'','','0',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(515,'c2900InfoTotalBufferDepth','ftp://ftp.cisco.com/pub/mibs/oid/CISCO-C2900-MIB.oid',23,15,0,0,300,0,'','','public','1.3.6.1.4.1.9.9.87.1.1.3.0',2,2,0,'','','0',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(516,'c2900BandwidthUsageCurrent	','ftp://ftp.cisco.com/pub/mibs/oid/CISCO-C2900-MIB.oid',23,15,0,0,300,0,'','','public','1.3.6.1.4.1.9.9.87.1.5.1.0',2,2,0,'','','0',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(517,'Latest&#x20;Message&#x20;&#x20;','Get&#x20;the&#x20;last&#x20;message&#x20;sent&#x20;in&#x20;Syslog',2,17,0,0,300,0,'','','public','1.3.6.1.4.1.9.9.41.1.2.3.1.5.12',1,2,0,'','','0',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(518,'Latest&#x20;Message&#x20;date','',2,15,0,0,300,0,'','','public','1.3.6.1.4.1.9.9.41.1.2.3.1.6.12',2,2,0,'','','0',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(519,'CPU&#x20;avgBusy1min	','',2,15,0,0,300,0,'','','public','1.3.6.1.4.1.9.2.1.57.0',2,2,0,'','','0',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(520,'CPU&#x20;avgBusy5min	','',2,15,0,0,300,0,'','','public','1.3.6.1.4.1.9.2.1.58.0',2,2,0,'','','0',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(521,'Software&#x20;Image&#x20;running&#x20;','',2,17,0,0,1800,0,'','','public','1.3.6.1.4.1.9.2.1.73.0',2,2,0,'','','0',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(522,'nvRAMUsed','',2,15,0,0,300,0,'','','public','1.3.6.1.4.1.9.3.6.8.0',2,2,0,'','','0',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(523,'Printers&#x20;BytesPrintedPersec','Number&#x20;of&#x20;bytes&#x20;per&#x20;second&#x20;printed&#x20;on&#x20;a&#x20;print&#x20;queue.',24,1,0,0,300,1,'','','','select&#x20;BytesPrintedPersec&#x20;from&#x20;Win32_PerfRawData_Spooler_PrintQueue&#x20;where&#x20;NAME&#x20;=&#x20;&#039;_total&#039;',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(524,'Printers&#x20;JobErrors','Total&#x20;number&#x20;of&#x20;job&#x20;errors&#x20;in&#x20;a&#x20;print&#x20;queue&#x20;after&#x20;the&#x20;last&#x20;restart.',24,1,0,0,300,1,'','','','select&#x20;JobErrors&#x20;from&#x20;Win32_PerfRawData_Spooler_PrintQueue&#x20;where&#x20;NAME&#x20;=&#x20;&#039;_total&#039;&#x20;',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(525,'Printers&#x20;Jobs','Current&#x20;number&#x20;of&#x20;jobs&#x20;in&#x20;a&#x20;print&#x20;queue.',24,1,0,0,300,1,'','','','select&#x20;Jobs&#x20;from&#x20;Win32_PerfRawData_Spooler_PrintQueue&#x20;where&#x20;NAME&#x20;=&#x20;&#039;_total&#039;&#x20;',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(526,'Printers&#x20;JobsSpooling','Current&#x20;number&#x20;of&#x20;spooling&#x20;jobs&#x20;in&#x20;a&#x20;print&#x20;queue.',24,1,0,0,300,1,'','','','select&#x20;JobsSpooling&#x20;from&#x20;Win32_PerfRawData_Spooler_PrintQueue&#x20;where&#x20;NAME&#x20;=&#x20;&#039;_total&#039;',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(527,'Printers&#x20;MaxJobsSpooling','Maximum&#x20;number&#x20;of&#x20;spooling&#x20;jobs&#x20;in&#x20;a&#x20;print&#x20;queue&#x20;after&#x20;the&#x20;last&#x20;restart.\r\n',24,1,0,0,300,1,'','','','select&#x20;MaxJobsSpooling&#x20;from&#x20;Win32_PerfRawData_Spooler_PrintQueue&#x20;where&#x20;NAME&#x20;=&#x20;&#039;_total&#039;',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(528,'Printers&#x20;NotReadyErrors','Total&#x20;number&#x20;of&#x20;printer-not-ready&#x20;errors&#x20;in&#x20;a&#x20;print&#x20;queue&#x20;after&#x20;the&#x20;last&#x20;restart.',24,1,0,0,300,1,'','','','select&#x20;NotReadyErrors&#x20;from&#x20;Win32_PerfRawData_Spooler_PrintQueue&#x20;where&#x20;NAME&#x20;=&#x20;&#039;_total&#039;',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(529,'Printers&#x20;OutofPaperErrors','Total&#x20;number&#x20;of&#x20;out-of-paper&#x20;errors&#x20;in&#x20;a&#x20;print&#x20;queue&#x20;after&#x20;the&#x20;last&#x20;restart.',24,1,0,0,300,1,'','','','select&#x20;OutofPaperErrors&#x20;from&#x20;Win32_PerfRawData_Spooler_PrintQueue&#x20;where&#x20;NAME&#x20;=&#x20;&#039;_total&#039;',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(530,'Printers&#x20;TotalJobsPrinted','Total&#x20;number&#x20;of&#x20;jobs&#x20;printed&#x20;on&#x20;a&#x20;print&#x20;queue&#x20;after&#x20;the&#x20;last&#x20;restart.',24,1,0,0,300,1,'','','','select&#x20;TotalJobsPrinted&#x20;from&#x20;Win32_PerfRawData_Spooler_PrintQueue&#x20;where&#x20;NAME&#x20;=&#x20;&#039;_total&#039;',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(531,'Printers&#x20;TotalPagesPrinted','Total&#x20;number&#x20;of&#x20;pages&#x20;printed&#x20;through&#x20;GDI&#x20;on&#x20;a&#x20;print&#x20;queue&#x20;after&#x20;the&#x20;last&#x20;restart.',24,1,0,0,300,1,'','','','select&#x20;TotalPagesPrinted&#x20;from&#x20;Win32_PerfRawData_Spooler_PrintQueue&#x20;where&#x20;NAME&#x20;=&#x20;&#039;_total&#039;',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(532,'Printers&#x20;Availability','Availability&#x20;and&#x20;status&#x20;of&#x20;the&#x20;device\r\n\r\nValue	Meaning\r\n\r\n10x1&#x20;Other\r\n\r\n20x2&#x20;Unknown\r\n\r\n30x3&#x20;Running&#x20;or&#x20;Full&#x20;Power\r\n\r\n40x4&#x20;Warning\r\n\r\n50x5&#x20;In&#x20;Test\r\n\r\n60x6&#x20;Not&#x20;Applicable\r',24,3,0,0,300,0,'','','','select&#x20;Availability&#x20;from&#x20;Win32_Printer',5,6,0,'','','10',0,0,1,0.00,0.00,NULL,0.00,0.00,NULL,0,NULL,NULL,NULL,0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(533,'Serv_IISAdmin','IIS&#x20;Administration&#x20;Server&#x20;service&#x20;status.',26,2,0,0,300,1,'','','Running','Select&#x20;State&#x20;from&#x20;Win32_Service&#x20;WHERE&#x20;name&#x20;=&#x20;&#039;IISAdmin&#039;',3,6,0,'Administrador','6683','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(534,'Serv_MSSQL_server','Displays&#x20;if&#x20;&#x20;MS&#x20;SQL&#x20;SERVER&#x20;is&#x20;running',27,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name&#x20;=&#x20;&quot;MSSQLSERVER&quot;',7,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(535,'SQLServer_DataFilesSizeKB','Sql&#x20;database&#x20;size&#x20;in&#x20;kb&#x0d;&#x0a;',27,1,0,0,0,0,'','','','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name&#x20;=&#x20;&quot;MSSQLSERVER&quot;',7,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(536,'SQLServer_SQLErrors&#x20;&#x20;','Errors&#x20;/&#x20;sec&#x20;in&#x20;the&#x20;database&#x0d;&#x0a;',27,1,0,0,0,0,'','','','select&#x20;Errors/sec&#x20;&#x20;from&#x20;Win32_PerfRawData_MSSQLSERVER_SQLServerSQLErrors&#x20;&#x20;',7,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(537,'SQLServer_TotalServerMemoryKB','Specifies&#x20;the&#x20;amount&#x20;of&#x20;memory&#x20;not&#x20;used&#x20;currently&#x20;by&#x20;the&#x20;server.&#x0d;&#x0a;',27,1,0,0,0,0,'','','','select&#x20;TotalServerMemoryKB&#x20;from&#x20;Win32_PerfRawData_MSSQLSERVER_SQLServerMemoryManager&#x20;&#x20;',7,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(538,'SQLServer_ConnectionMemoryKB','Specifies&#x20;the&#x20;total&#x20;amount&#x20;of&#x20;dynamic&#x20;memory&#x20;the&#x20;server&#x20;is&#x20;using&#x20;for&#x20;maintaining&#x20;connections.',27,1,0,0,0,0,'','','','select&#x20;ConnectionMemoryKB&#x20;from&#x20;Win32_PerfRawData_MSSQLSERVER_SQLServerMemoryManager&#x20;',7,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(539,'SQLServer_MaxWorkspaceMemoryKB','Indicates&#x20;the&#x20;maximum&#x20;amount&#x20;of&#x20;memory&#x20;available&#x20;for&#x20;executing&#x20;processes&#x20;such&#x20;as&#x20;hash&#x20;operations,&#x20;sort,&#x20;bulk&#x20;copy,&#x20;and&#x20;index&#x20;creation.',27,1,0,0,0,0,'','','','select&#x20;MaximumWorkspaceMemoryKB&#x20;from&#x20;Win32_PerfRawData_MSSQLSERVER_SQLServerMemoryManager&#x20;',7,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(540,'SQLServer_UserConnections','Count&#x20;the&#x20;number&#x20;of&#x20;users&#x20;currently&#x20;connected&#x20;to&#x20;SQL&#x20;Server.',27,1,0,0,0,0,'','','','select&#x20;UserConnections&#x20;from&#x20;Win32_PerfRawData_MSSQLSERVER_SQLServerGeneralStatistics',7,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(541,'SQLServer_&#x20;Processesblocked','Number&#x20;of&#x20;processes&#x20;currently&#x20;blocked.',27,1,0,0,0,0,'','','','select&#x20;Processesblocked&#x20;from&#x20;Win32_PerfRawData_MSSQLSERVER_SQLServerGeneralStatistics',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(542,'SQLServer_ActiveTempTables','Number&#x20;of&#x20;tables&#x20;or&#x20;table&#x20;variables&#x20;temporary&#x20;used.',27,1,0,0,0,0,'','','','select&#x20;ActiveTempTables&#x20;&#x20;from&#x20;Win32_PerfRawData_MSSQLSERVER_SQLServerGeneralStatistics&#x20;&#x20;',7,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(543,'SQLServer_TempTablesForDestruction','Number&#x20;of&#x20;tables&#x20;and&#x20;variables&#x20;temporary&#x20;waiting&#x20;tables&#x20;to&#x20;destroy&#x20;the&#x20;thread&#x20;cleaning&#x20;system.',27,1,0,0,0,0,'','','','select&#x20;TempTablesForDestruction&#x20;&#x20;from&#x20;Win32_PerfRawData_MSSQLSERVER_SQLServerGeneralStatistics&#x20;&#x20;',7,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(544,'SQLServer_BytesReceivedPersec','Number&#x20;of&#x20;bytes&#x20;received&#x20;per&#x20;second.&#x0d;&#x0a;',27,1,0,0,0,0,'','','','select&#x20;BytesReceivedPersec&#x20;&#x20;from&#x20;Win32_PerfFormattedData_MSSQLSERVER_SQLServerDatabaseMirroring',7,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(545,'SQLServer_BytesSentPersec','Number&#x20;of&#x20;bytes&#x20;sent&#x20;per&#x20;second.&#x0d;&#x0a;',27,1,0,0,0,0,'','','','select&#x20;BytesSentPersec&#x20;&#x20;from&#x20;Win32_PerfFormattedData_MSSQLSERVER_SQLServerDatabaseMirroring&#x20;',7,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(546,'SQLServer_LogSendQueueKB','Total&#x20;number&#x20;of&#x20;kilobytes&#x20;of&#x20;log&#x20;that&#x20;have&#x20;not&#x20;yet&#x20;been&#x20;sent&#x20;to&#x20;the&#x20;mirror&#x20;server.&#x0d;&#x0a;',27,1,0,0,0,0,'','','','select&#x20;LogSendQueueKB&#x20;&#x20;from&#x20;Win32_PerfFormattedData_MSSQLSERVER_SQLServerDatabaseMirroring',7,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(547,'SQLServer_FreeSpaceintempdbKB','The&#x20;amount&#x20;of&#x20;space&#x20;&#40;in&#x20;kilobytes&#41;&#x20;available&#x20;in&#x20;tempdb.',27,1,0,0,0,0,'','','','select&#x20;FreeSpaceintempdbKB&#x20;from&#x20;Win32_PerfRawData_MSSQLSERVER_SQLServerTransactions&#x20;',7,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(548,'SQLServer_Transactions','Number&#x20;of&#x20;currently&#x20;active&#x20;transactions&#x20;of&#x20;all&#x20;types.',27,1,0,0,0,0,'','','','select&#x20;Transactions&#x20;from&#x20;Win32_PerfRawData_MSSQLSERVER_SQLServerTransactions&#x20;&#x20;&#x20;',7,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(549,'Perf_OracleHandleCount','Returns&#x20;handle&#x20;count&#x20;per&#x20;second&#x20;for&#x20;Oracle&#x20;process.',28,4,0,0,0,0,'','','','select&#x20;HandleCount&#x20;from&#x20;Win32_Process&#x20;WHERE&#x20;Caption&#x20;=&#x20;&quot;oracle.exe&quot;',7,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(550,'Serv_Oracle_1TNSListener','Show&#x20;if&#x20;oracle&#x20;listener&#x20;is&#x20;running&#x0d;&#x0a;',28,2,0,0,0,1,'','','','SELECT&#x20;state&#x20;FROM&#x20;Win32_Service&#x20;WHERE&#x20;Name&#x20;=&#x20;&quot;Oracle_1TNSListener&quot;',7,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(551,'Serv_Oracle&#x20;&lt;SID&gt;&#x20;VSS&#x20;Writer&#x20;Service','Show&#x20;if&#x20;Serv_Oracle&#x20;VSS&#x20;Writer&#x20;Service&#x20;is&#x20;running&#x0d;&#x0a;&#x0d;&#x0a;',28,2,0,0,0,1,'','','','SELECT&#x20;state&#x20;FROM&#x20;Win32_Service&#x20;WHERE&#x20;Name&#x20;=&#x20;&quot;Oracle&#x20;ORACLETA&#x20;VSS&#x20;Writer&#x20;Service&quot;',7,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(552,'Serv_OracleDBConsoleORACLE_SID','Show&#x20;if&#x20;OracleDBConsoleORACLE_SID&#x20;is&#x20;running&#x0d;&#x0a;&#x0d;&#x0a;',28,2,0,0,0,1,'','','','SELECT&#x20;state&#x20;FROM&#x20;Win32_Service&#x20;WHERE&#x20;Name&#x20;=&#x20;&quot;OracleDBConsoleORACLE_SID&quot;',7,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(553,'Serv_Oracle&#x20;OraDb11g_home1&#x20;Clr&#x20;Agent','Show&#x20;if&#x20;Oracle&#x20;OraDb11g_home1&#x20;Clr&#x20;Agent&#x20;is&#x20;up&#x0d;&#x0a;&#x0d;&#x0a;',28,2,0,0,0,1,'','','','SELECT&#x20;state&#x20;FROM&#x20;Win32_Service&#x20;WHERE&#x20;Name&#x20;=&#x20;&quot;Oracle&#x20;OraDb11g_home1&#x20;Clr&#x20;Agent&quot;',7,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(554,'Serv_OracleJobScheduler&lt;SID&gt;','Show&#x20;if&#x20;OracleJobScheduler&#x20;service&#x20;is&#x20;up&#x0d;&#x0a;&#x0d;&#x0a;',28,2,0,0,0,1,'','','','SELECT&#x20;state&#x20;FROM&#x20;Win32_Service&#x20;WHERE&#x20;Name&#x20;=&#x20;&quot;OracleJobScheduler&lt;SID&gt;&quot;',7,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(555,'Serv_OracleMTSRecoveryService','Show&#x20;if&#x20;OracleMTSRecoveryService&#x20;is&#x20;running&#x0d;&#x0a;&#x0d;&#x0a;',28,2,0,0,0,1,'','','','SELECT&#x20;state&#x20;FROM&#x20;Win32_Service&#x20;WHERE&#x20;Name&#x20;=&#x20;&quot;OracleMTSRecoveryService&quot;',7,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(556,'ORACLE_HOME_Paths','Displays&#x20;the&#x20;path&#x20;of&#x20;the&#x20;ORACLE_HOME&#x20;environment&#x20;variable&#x0d;&#x0a;&#x0d;&#x0a;&#x0d;&#x0a;',28,3,0,0,0,0,'','','','SELECT&#x20;VariableValue&#x20;FROM&#x20;Win32_Environment&#x20;WHERE&#x20;Name=&#x20;&quot;ORACLE_HOME&quot;',7,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(557,'Check&#x20;port&#x20;1433/TCP','',27,10,0,0,0,1433,'','','public','',3,2,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(558,'Check&#x20;port&#x20;1158/TCP','Comprueba&#x20;el&#x20;estado&#x20;del&#x20;puerto&#x20;HTTP&#x20;de&#x20;la&#x20;Consola&#x20;de&#x20;Enterprise&#x20;Manager&#x20;&#40;Oracle&#41;1158',28,9,0,0,0,1158,'','','public','',3,2,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(559,'Check&#x20;port&#x20;3938/TCP','Comprueba&#x20;el&#x20;estado&#x20;del&#x20;puerto&#x20;Puerto&#x20;del&#x20;Agente&#x20;de&#x20;Enterprise&#x20;Manager&#x20;&#40;oracle&#41;&#x0d;&#x0a;',28,9,0,0,0,3938,'','','public','',7,2,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(560,'Check&#x20;port&#x20;5620/TCP','Comprueba&#x20;el&#x20;estado&#x20;del&#x20;puerto&#x20;HTTP&#x20;para&#x20;Ultra&#x20;Search&#x20;&#40;oracle&#41;&#x0d;&#x0a;',28,9,0,0,0,5620,'','','public','',3,2,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(561,'Check&#x20;port&#x20;5560/TCP','Comprueba&#x20;el&#x20;estado&#x20;del&#x20;puerto&#x20;&#x20;HTTP&#x20;para&#x20;iSQL*Plus&#x20;&#40;Oracle&#41;&#x0d;&#x0a;',28,9,0,0,0,5560,'','','public','',3,2,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(562,'N360_status&#x20;','Muestra&#x20;si&#x20;el&#x20;antivirus&#x20;Norton&#x20;360&#x20;esta&#x20;corriendo&#x20;o&#x20;no&#x0d;&#x0a;',30,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name&#x20;=&#x20;&quot;N360&quot;&#x20;',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(563,'NortonInternetSecurity_status&#x20;','Muestra&#x20;si&#x20;el&#x20;antivirus&#x20;Norton&#x20;Internet&#x20;Security&#x20;esta&#x20;corriendo&#x20;o&#x20;no&#x0d;&#x0a;&#x0d;&#x0a;',30,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name&#x20;=&#x20;&quot;NIS&quot;&#x20;',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(564,'NortonAntivirus_status&#x20;','Muestra&#x20;si&#x20;el&#x20;antivirus&#x20;Norton&#x20;esta&#x20;corriendo&#x20;o&#x20;no&#x0d;&#x0a;&#x0d;&#x0a;',30,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name&#x20;=&#x20;&quot;NAV&quot;&#x20;',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(565,'NortonIdentifySafe_status&#x20;','Muestra&#x20;si&#x20;el&#x20;Norton&#x20;Identity&#x20;Safe&#x20;esta&#x20;corriendo&#x0d;&#x0a;',30,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name&#x20;=&#x20;&quot;NCO&quot;&#x20;',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(566,'WindowsFirewall_status&#x20;','Show&#x20;if&#x20;&#x20;Firewall&#x20;Windows&#x20;is&#x20;running&#x0d;&#x0a;',29,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name&#x20;=&#x20;&quot;MpsSvc&quot;&#x20;&#x20;',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(567,'WindowsDefender_status','Show&#x20;if&#x20;&#x20;WindowsDefender&#x20;is&#x20;running',29,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name&#x20;=&#x20;&quot;WinDefend&quot;&#x20;&#x20;',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(568,'PandaGlobalProtection_status&#x20;','Show&#x20;if&#x20;PandaGlobalProtection&#x20;is&#x20;running',31,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name&#x20;=&#x20;&quot;Panda&#x20;Software&#x20;Controller&quot;&#x20;',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(569,'PandaFunctionService_status&#x20;','Show&#x20;if&#x20;PandaFunctionService&#x20;is&#x20;running',31,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name&#x20;=&#x20;&quot;PAVFNSVR&quot;&#x20;',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(570,'Panda_Process_Protection_Service_&#x20;status&#x20;','Show&#x20;if&#x20;Panda&#x20;ProcessProtection&#x20;Service&#x20;is&#x20;running',31,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name&#x20;=&#x20;&quot;PavPrSrv&quot;&#x20;',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(571,'Panda_Anti-Malware_Service_status','Show&#x20;if&#x20;&#x20;Panda&#x20;Anti-Malware&#x20;Service&#x20;is&#x20;running',31,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name&#x20;=&#x20;&quot;PAVSRV&quot;&#x20;',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(572,'McAfee_Network_Agent_status&#x20;','Show&#x20;if&#x20;McAfee_Network_Agent&#x20;is&#x20;running',32,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name&#x20;=&#x20;&quot;McNASvc&quot;&#x20;',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(573,'McAfee_Protection_Manager_status&#x20;','Show&#x20;if&#x20;McAfee_Protection_Manager&#x20;is&#x20;running',32,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name&#x20;=&#x20;&quot;mcmscsvc&quot;&#x20;',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(574,'McAfee_Scanner_status&#x20;','Show&#x20;if&#x20;McAfee_Scanner&#x20;is&#x20;running',32,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name&#x20;=&#x20;&quot;McODS&quot;&#x20;',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(575,'McAfee_Proxy_Service_status&#x20;','Show&#x20;if&#x20;McAfee_Proxy_Service&#x20;is&#x20;running',32,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name&#x20;=&#x20;&quot;McProxy&quot;&#x20;',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(576,'McAfee_Real-time_Scanner_status&#x20;','Show&#x20;if&#x20;McAfee_Real-time_Scanner&#x20;is&#x20;running',32,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name&#x20;=&#x20;&quot;McShield&quot;&#x20;',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(577,'McAfee_SystemGuards_status&#x20;','Show&#x20;if&#x20;McAfee_SystemGuards&#x20;is&#x20;running',32,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name&#x20;=&#x20;&quot;McSysmon&quot;&#x20;',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(578,'McAfee_Personal_Firewall_Service_status&#x20;','Show&#x20;if&#x20;McAfee_Personal_Firewall_Service&#x20;is&#x20;running',32,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name&#x20;=&#x20;&quot;MpfService&quot;&#x20;',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(579,'McAfee_Anti-Spam_Service_status&#x20;','Show&#x20;if&#x20;McAfee_Anti-Spam_Service&#x20;is&#x20;running',32,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name&#x20;=&#x20;&quot;MSK80Service&quot;&#x20;',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(580,'Bitdefender_Virus_Shield_status','Show&#x20;if&#x20;Bitdefender&#x20;Virus&#x20;Shield&#x20;is&#x20;running',33,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name&#x20;=&#x20;&quot;VSSERV&quot;&#x20;',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(581,'BitDefender_Parental_service_status','Show&#x20;if&#x20;BitDefender&#x20;Parental&#x20;Control&#x20;service&#x20;is&#x20;running',33,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name&#x20;=&#x20;&quot;BdDesktopParental&quot;&#x20;',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(582,'Bitdefender-Desktop_Update_Service_status','Show&#x20;if&#x20;Bitdefender&#x20;Desktop&#x20;Update&#x20;Service&#x20;is&#x20;running',33,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name&#x20;=&#x20;&quot;UPDATESRV&quot;&#x20;',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(583,'Perf_DNSCachingMemory','Total&#x20;caching&#x20;memory&#x20;used&#x20;by&#x20;DNS&#x20;server.',35,1,0,0,0,0,'','','','select&#x20;CachingMemory&#x20;from&#x20;Win32_PerfFormattedData_DNS_DNS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(584,'Perf_DNSDatabaseNodeMemory','Total&#x20;database&#x20;node&#x20;memory&#x20;used&#x20;by&#x20;DNS&#x20;server.',35,1,0,0,0,0,'','','','select&#x20;DatabaseNodeMemory&#x20;from&#x20;Win32_PerfFormattedData_DNS_DNS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(585,'Perf_DNSDynamicUpdateNoOperation','No-operation/Empty&#x20;dynamic&#x20;update&#x20;requests&#x20;per&#x20;second&#x20;received&#x20;by&#x20;the&#x20;DNS&#x20;server.',35,4,0,0,0,0,'','','','select&#x20;DynamicUpdateNoOperation&#x20;from&#x20;Win32_PerfFormattedData_DNS_DNS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(586,'Perf_DNSDynamicUpdateQueued','Dynamic&#x20;updates&#x20;queued&#x20;per&#x20;second&#x20;by&#x20;the&#x20;DNS&#x20;server.',35,4,0,0,0,0,'','','','select&#x20;DynamicUpdateQueued&#x20;from&#x20;Win32_PerfFormattedData_DNS_DNS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(587,'Perf_DNSDynamicUpdateReceived','Dynamic&#x20;update&#x20;requests&#x20;received&#x20;per&#x20;second&#x20;by&#x20;the&#x20;DNS&#x20;server.',35,4,0,0,0,0,'','','','select&#x20;DynamicUpdateReceived&#x20;from&#x20;Win32_PerfFormattedData_DNS_DNS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(588,'Perf_DNSDynamicUpdateRejected','Dynamic&#x20;updates&#x20;rejected&#x20;per&#x20;second&#x20;by&#x20;the&#x20;DNS&#x20;server.',35,4,0,0,0,0,'','','','select&#x20;DynamicUpdateRejected&#x20;from&#x20;Win32_PerfFormattedData_DNS_DNS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(589,'Perf_DNSDynamicUpdateTimeOuts','Dynamic&#x20;update&#x20;timeouts&#x20;per&#x20;second&#x20;of&#x20;the&#x20;DNS&#x20;server.',35,4,0,0,0,0,'','','','select&#x20;DynamicUpdateTimeOuts&#x20;from&#x20;Win32_PerfFormattedData_DNS_DNS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(590,'Perf_DNSDynamicUpdateWrittentoDatabase','Dynamic&#x20;updates&#x20;written&#x20;to&#x20;the&#x20;database&#x20;per&#x20;second&#x20;by&#x20;the&#x20;DNS&#x20;server.',35,4,0,0,0,0,'','','','select&#x20;DynamicUpdateWrittentoDatabase&#x20;from&#x20;Win32_PerfFormattedData_DNS_DNS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(591,'Perf_DNSNbstatMemory','Total&#x20;Nbstat&#x20;memory&#x20;used&#x20;by&#x20;DNS&#x20;server.',35,1,0,0,0,0,'','','','select&#x20;NbstatMemory&#x20;from&#x20;Win32_PerfFormattedData_DNS_DNS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(592,'Perf_DNSNotifyReceived','Notifies&#x20;received&#x20;per&#x20;second&#x20;by&#x20;the&#x20;secondary&#x20;DNS&#x20;server.',35,4,0,0,0,0,'','','','select&#x20;NotifyReceived&#x20;from&#x20;Win32_PerfFormattedData_DNS_DNS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(593,'Perf_DNSNotifySent','Notifies&#x20;sent&#x20;per&#x20;second&#x20;by&#x20;the&#x20;master&#x20;DNS&#x20;server.',35,4,0,0,0,0,'','','','select&#x20;NotifySent&#x20;from&#x20;Win32_PerfFormattedData_DNS_DNS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(594,'Perf_DNSRecordFlowMemory','Total&#x20;record&#x20;flow&#x20;memory&#x20;used&#x20;by&#x20;DNS&#x20;server.',35,1,0,0,0,0,'','','','select&#x20;NbstatMemory&#x20;from&#x20;Win32_PerfFormattedData_DNS_DNS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(595,'Perf_DNSRecursiveQueries','Recursive&#x20;queries&#x20;per&#x20;second&#x20;received&#x20;by&#x20;DNS&#x20;server.',35,4,0,0,0,0,'','','','select&#x20;RecursiveQueries&#x20;from&#x20;Win32_PerfFormattedData_DNS_DNS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(596,'Perf_DNSRecursiveQueryFailure','Recursive&#x20;query&#x20;failures&#x20;per&#x20;second&#x20;on&#x20;the&#x20;DNS&#x20;server.',35,4,0,0,0,0,'','','','select&#x20;RecursiveQueryFailure&#x20;from&#x20;Win32_PerfFormattedData_DNS_DNS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(597,'Perf_DNSRecursiveSendTimeOuts','Recursive&#x20;queries&#x20;sending&#x20;timeouts&#x20;per&#x20;second&#x20;on&#x20;the&#x20;DNS&#x20;server.',35,4,0,0,0,0,'','','','select&#x20;RecursiveSendTimeOuts&#x20;from&#x20;Win32_PerfFormattedData_DNS_DNS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(598,'Perf_DNSSecureUpdateFailure','Secure&#x20;updates&#x20;failed&#x20;per&#x20;second&#x20;of&#x20;the&#x20;DNS&#x20;server.',35,4,0,0,0,0,'','','','select&#x20;SecureUpdateFailure&#x20;from&#x20;Win32_PerfFormattedData_DNS_DNS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(599,'Perf_DNSSecureUpdateReceived','Secure&#x20;update&#x20;requests&#x20;per&#x20;second&#x20;received&#x20;by&#x20;the&#x20;DNS&#x20;server.',35,4,0,0,0,0,'','','','select&#x20;SecureUpdateReceived&#x20;from&#x20;Win32_PerfFormattedData_DNS_DNS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(600,'Perf_DNSTCPMessageMemory','Total&#x20;TCP&#x20;message&#x20;memory&#x20;used&#x20;by&#x20;DNS&#x20;server.',35,1,0,0,0,0,'','','','select&#x20;TCPMessageMemory&#x20;from&#x20;Win32_PerfFormattedData_DNS_DNS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(601,'Perf_DNSTCPResponseSent','TCP&#x20;reponses&#x20;per&#x20;second&#x20;sent&#x20;by&#x20;DNS&#x20;server.',35,4,0,0,0,0,'','','','select&#x20;TCPResponseSent&#x20;from&#x20;Win32_PerfFormattedData_DNS_DNS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(602,'Perf_DNSTotalQueryReceived','Queries&#x20;per&#x20;second&#x20;received&#x20;by&#x20;DNS&#x20;server.',35,4,0,0,0,0,'','','','select&#x20;TotalQueryReceived&#x20;from&#x20;Win32_PerfFormattedData_DNS_DNS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(603,'Perf_DNSTotalResponseSent','Reponses&#x20;per&#x20;second&#x20;sent&#x20;by&#x20;DNS&#x20;server.',35,4,0,0,0,0,'','','','select&#x20;TotalResponseSent&#x20;from&#x20;Win32_PerfFormattedData_DNS_DNS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(604,'Perf_DNSUDPMessageMemory','Total&#x20;UDP&#x20;message&#x20;memory&#x20;used&#x20;by&#x20;DNS&#x20;server.',35,1,0,0,0,0,'','','','select&#x20;UDPMessageMemory&#x20;from&#x20;Win32_PerfFormattedData_DNS_DNS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(605,'Perf_DNSTCPQueryReceived','TCP&#x20;queries&#x20;per&#x20;second&#x20;received&#x20;by&#x20;DNS&#x20;server.',35,4,0,0,0,0,'','','','select&#x20;TCPQueryReceived&#x20;from&#x20;Win32_PerfFormattedData_DNS_DNS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(606,'Perf_DNSUDPQueryReceived','UDP&#x20;queries&#x20;per&#x20;second&#x20;received&#x20;by&#x20;DNS&#x20;server.',35,4,0,0,0,0,'','','','select&#x20;UDPQueryReceived&#x20;from&#x20;Win32_PerfFormattedData_DNS_DNS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(607,'Perf_DNSUDPResponseSent','UDP&#x20;reponses&#x20;per&#x20;second&#x20;sent&#x20;by&#x20;DNS&#x20;server.',35,4,0,0,0,0,'','','','select&#x20;UDPResponseSent&#x20;from&#x20;Win32_PerfFormattedData_DNS_DNS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(608,'Perf_DNSUnmatchedResponsesReceived','Response&#x20;packets&#x20;per&#x20;second&#x20;received&#x20;by&#x20;the&#x20;DNS&#x20;server&#x20;that&#x20;do&#x20;not&#x20;match&#x20;any&#x20;outstanding&#x20;remote&#x20;query.',35,4,0,0,0,0,'','','','select&#x20;UnmatchedResponsesReceived&#x20;from&#x20;Win32_PerfFormattedData_DNS_DNS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(609,'Perf_DNSWINSLookupReceived','WINS&#x20;lookup&#x20;requests&#x20;per&#x20;second&#x20;received&#x20;by&#x20;the&#x20;server.',35,4,0,0,0,0,'','','','select&#x20;WINSLookupReceived&#x20;from&#x20;Win32_PerfFormattedData_DNS_DNS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(610,'Perf_DNSWINSResponseSent','WINS&#x20;lookup&#x20;responses&#x20;per&#x20;second&#x20;sent&#x20;by&#x20;the&#x20;server.',35,4,0,0,0,0,'','','','select&#x20;WINSResponseSent&#x20;from&#x20;Win32_PerfFormattedData_DNS_DNS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(611,'Perf_DNSWINSReverseLookupReceived','WINS&#x20;reverse&#x20;lookup&#x20;requests&#x20;per&#x20;second&#x20;received&#x20;by&#x20;the&#x20;server.',35,4,0,0,0,0,'','','','select&#x20;WINSReverseLookupReceived&#x20;from&#x20;Win32_PerfFormattedData_DNS_DNS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(612,'Perf_DNSWINSReverseResponseSent','WINS&#x20;Reverse&#x20;lookup&#x20;responses&#x20;per&#x20;second&#x20;sent&#x20;by&#x20;the&#x20;server.',35,4,0,0,0,0,'','','','select&#x20;WINSReverseResponseSent&#x20;from&#x20;Win32_PerfFormattedData_DNS_DNS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(613,'Perf_NTDSABANRPersec','The&#x20;rate&#x20;at&#x20;which&#x20;Address&#x20;Book&#x20;clients&#x20;perform&#x20;Ambiguous&#x20;Name&#x20;Resolutions&#x20;operations.',36,1,0,0,0,0,'','','','select&#x20;ABANRPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(614,'Perf_NTDSABBrowsesPersec','AB&#x20;Browses/sec&#x20;is&#x20;the&#x20;rate&#x20;at&#x20;which&#x20;Address&#x20;Book&#x20;clients&#x20;perform&#x20;browse&#x20;operations.',36,1,0,0,0,0,'','','','select&#x20;ABBrowsesPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(615,'Perf_NTDSABClientSessions','Number&#x20;of&#x20;connected&#x20;Address&#x20;Book&#x20;client&#x20;sessions.',36,1,0,0,0,0,'','','','select&#x20;ABClientSessions&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(616,'Perf_NTDSABMatchesPersec','The&#x20;rate&#x20;at&#x20;which&#x20;Address&#x20;Book&#x20;clients&#x20;perform&#x20;find&#x20;operations.',36,1,0,0,0,0,'','','','select&#x20;ABMatchesPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(617,'Perf_NTDSABPropertyReadsPersec','The&#x20;rate&#x20;at&#x20;which&#x20;Address&#x20;Book&#x20;clients&#x20;perform&#x20;property&#x20;read&#x20;operations.',36,1,0,0,0,0,'','','','select&#x20;ABPropertyReadsPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(618,'Perf_NTDSABProxyLookupsPersec','The&#x20;rate&#x20;at&#x20;which&#x20;proxy&#x20;clients&#x20;perform&#x20;search&#x20;operations.',36,1,0,0,0,0,'','','','select&#x20;ABProxyLookupsPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(619,'Perf_NTDSATQRequestLatency','Average&#x20;length&#x20;of&#x20;time&#x20;&#40;in&#x20;milliseconds&#41;&#x20;to&#x20;process&#x20;a&#x20;request,&#x20;not&#x20;including&#x20;time&#x20;spent&#x20;on&#x20;the&#x20;queue.',36,1,0,0,0,0,'','','','select&#x20;ATQRequestLatency&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(620,'Perf_NTDSATQThreadsLDAP','The&#x20;number&#x20;of&#x20;threads&#x20;that&#x20;ATQ&#x20;has&#x20;currently&#x20;allocated&#x20;to&#x20;servicing&#x20;LDAP&#x20;requests.',36,1,0,0,0,0,'','','','select&#x20;ATQThreadsLDAP&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(621,'Perf_NTDSATQThreadsOther','The&#x20;number&#x20;of&#x20;threads&#x20;that&#x20;the&#x20;ATQ&#x20;has&#x20;currently&#x20;allocated&#x20;to&#x20;DS&#x20;services&#x20;other&#x20;than&#x20;LDAP.',36,1,0,0,0,0,'','','','select&#x20;ATQThreadsOther&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(622,'Perf_NTDSATQThreadsTotal','The&#x20;total&#x20;number&#x20;of&#x20;ATQ&#x20;threads&#x20;that&#x20;are&#x20;either&#x20;waiting&#x20;to&#x20;service&#x20;an&#x20;incoming&#x20;request,&#x20;or&#x20;are&#x20;already&#x20;servicing&#x20;a&#x20;request.',36,1,0,0,0,0,'','','','select&#x20;ATQThreadsTotal&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(623,'Perf_NTDSBasesearchesPersec','The&#x20;number&#x20;of&#x20;base&#x20;searches/sec',36,1,0,0,0,0,'','','','select&#x20;BasesearchesPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(624,'Perf_NTDSDatabaseaddsPersec','The&#x20;number&#x20;of&#x20;database&#x20;adds/sec',36,1,0,0,0,0,'','','','select&#x20;DatabaseaddsPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(625,'Perf_NTDSDatabasedeletesPersec','The&#x20;number&#x20;of&#x20;database&#x20;deletes/sec',36,1,0,0,0,0,'','','','select&#x20;DatabasedeletesPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(626,'Perf_NTDSDatabaserecyclesPersec','The&#x20;number&#x20;of&#x20;database&#x20;recycles/sec',36,1,0,0,0,0,'','','','select&#x20;DatabaserecyclesPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(627,'Perf_NTDSDigestBindsPersec','The&#x20;number&#x20;of&#x20;digest&#x20;binds/sec',36,1,0,0,0,0,'','','','select&#x20;DigestBindsPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(628,'Perf_NTDSDRAInboundBytesCompressedBetweenSitesAfterCompressionPersec','Compressed&#x20;size&#x20;in&#x20;bytes&#x20;of&#x20;inbound&#x20;compressed&#x20;replication&#x20;data&#x20;&#40;size&#x20;after&#x20;compression,&#x20;from&#x20;DSAs&#x20;in&#x20;other&#x20;sites&#41;.',36,1,0,0,0,0,'','','','select&#x20;DRAInboundBytesCompressedBetweenSitesAfterCompressionPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(629,'Perf_NTDSDRAInboundBytesCompressedBetweenSitesAfterCompressionSinceBoot','Compressed&#x20;size&#x20;in&#x20;bytes&#x20;of&#x20;inbound&#x20;compressed&#x20;replication&#x20;data&#x20;&#40;size&#x20;after&#x20;compression,&#x20;from&#x20;DSAs&#x20;in&#x20;other&#x20;sites&#41;.',36,1,0,0,0,0,'','','','select&#x20;DRAInboundBytesCompressedBetweenSitesAfterCompressionSinceBoot&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(630,'Perf_NTDSDRAInboundBytesCompressedBetweenSitesBeforeCompressionSinceBoot','Original&#x20;size&#x20;in&#x20;bytes&#x20;of&#x20;inbound&#x20;compressed&#x20;replication&#x20;data&#x20;&#40;size&#x20;before&#x20;compression,&#x20;from&#x20;DSAs&#x20;in&#x20;other&#x20;sites&#41;.',36,1,0,0,0,0,'','','','select&#x20;DRAInboundBytesCompressedBetweenSitesBeforeCompressionSinceBoot&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(631,'Perf_NTDSDRAInboundBytesCompressedBetweenSitesBeforeCompressionPersec','Original&#x20;size&#x20;in&#x20;bytes&#x20;of&#x20;inbound&#x20;compressed&#x20;replication&#x20;data&#x20;&#40;size&#x20;before&#x20;compression,&#x20;from&#x20;DSAs&#x20;in&#x20;other&#x20;sites&#41;.',36,1,0,0,0,0,'','','','select&#x20;DRAInboundBytesCompressedBetweenSitesBeforeCompressionPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(632,'Perf_NTDSDRAInboundBytesNotCompressedWithinSitePersec','Number&#x20;of&#x20;bytes&#x20;replicated&#x20;in&#x20;that&#x20;were&#x20;not&#x20;compressed&#x20;at&#x20;the&#x20;source&#x20;&#40;i.e.,&#x20;from&#x20;DSAs&#x20;in&#x20;the&#x20;same&#x20;site&#41;.',36,1,0,0,0,0,'','','','select&#x20;DRAInboundBytesNotCompressedWithinSitePersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(633,'Perf_NTDSDRAInboundBytesNotCompressedWithinSiteSinceBoot','Number&#x20;of&#x20;bytes&#x20;replicated&#x20;in&#x20;that&#x20;were&#x20;not&#x20;compressed&#x20;at&#x20;the&#x20;source&#x20;&#40;i.e.,&#x20;from&#x20;DSAs&#x20;in&#x20;the&#x20;same&#x20;site&#41;.',36,1,0,0,0,0,'','','','select&#x20;DRAInboundBytesNotCompressedWithinSiteSinceBoot&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(634,'Perf_NTDSDRAInboundBytesTotalPersec','Total&#x20;number&#x20;of&#x20;bytes&#x20;replicated&#x20;in.&#x20;Sum&#x20;of&#x20;the&#x20;number&#x20;of&#x20;uncompressed&#x20;bytes&#x20;&#40;never&#x20;compressed&#41;&#x20;and&#x20;the&#x20;number&#x20;of&#x20;compressed&#x20;bytes&#x20;&#40;a',36,1,0,0,0,0,'','','','select&#x20;DRAInboundBytesTotalPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(635,'Perf_NTDSDRAInboundBytesTotalSinceBoot','Total&#x20;number&#x20;of&#x20;bytes&#x20;replicated&#x20;in.&#x20;Sum&#x20;of&#x20;the&#x20;number&#x20;of&#x20;uncompressed&#x20;bytes&#x20;&#40;never&#x20;compressed&#41;&#x20;and&#x20;the&#x20;number&#x20;of&#x20;compressed&#x20;bytes&#x20;&#40;a',36,1,0,0,0,0,'','','','select&#x20;DRAInboundBytesTotalSinceBoot&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(636,'Perf_NTDSDRAInboundFullSyncObjectsRemaining','Number&#x20;of&#x20;objects&#x20;remaining&#x20;until&#x20;the&#x20;full&#x20;sync&#x20;completes&#x20;&#40;when&#x20;set&#41;.',36,1,0,0,0,0,'','','','select&#x20;DRAInboundFullSyncObjectsRemaining&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(637,'Perf_NTDSDRAInboundLinkValueUpdatesRemaininginPacket','The&#x20;number&#x20;of&#x20;link&#x20;value&#x20;updates&#x20;received&#x20;in&#x20;the&#x20;current&#x20;directory&#x20;replication&#x20;update&#x20;packet&#x20;that&#x20;have&#x20;not&#x20;yet&#x20;been&#x20;applied&#x20;to&#x20;the&#x20;local&#x2',36,1,0,0,0,0,'','','','select&#x20;DRAInboundLinkValueUpdatesRemaininginPacket&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(638,'Perf_NTDSDRAInboundObjectsAppliedPersec','The&#x20;rate&#x20;at&#x20;which&#x20;replication&#x20;updates&#x20;received&#x20;from&#x20;replication&#x20;partners&#x20;are&#x20;applied&#x20;by&#x20;the&#x20;local&#x20;directory&#x20;service.&#x20;This&#x20;count&#x20;excludes&#x20;changes&#x20;',36,1,0,0,0,0,'','','','select&#x20;DRAInboundObjectsAppliedPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(639,'Perf_NTDSDRAInboundObjectsFilteredPersec','Number&#x20;of&#x20;objects&#x20;received&#x20;from&#x20;inbound&#x20;replication&#x20;partners&#x20;that&#x20;contained&#x20;no&#x20;updates&#x20;that&#x20;needed&#x20;to&#x20;be&#x20;applied.',36,1,0,0,0,0,'','','','select&#x20;DRAInboundObjectsFilteredPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(640,'Perf_NTDSDRAInboundObjectsPersec','No&#x20;of&#x20;objects&#x20;received&#x20;from&#x20;neighbors&#x20;through&#x20;inbound&#x20;replication.',36,1,0,0,0,0,'','','','select&#x20;DRAInboundObjectsPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(641,'Perf_NTDSDRAInboundObjectUpdatesRemaininginPacket','The&#x20;number&#x20;of&#x20;object&#x20;updates&#x20;received&#x20;in&#x20;the&#x20;current&#x20;directory&#x20;replication&#x20;update&#x20;packet&#x20;that&#x20;have&#x20;not&#x20;yet&#x20;been&#x20;applied&#x20;to&#x20;the&#x20;local&#x20;server.',36,1,0,0,0,0,'','','','select&#x20;DRAInboundObjectUpdatesRemaininginPacket&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(642,'Perf_NTDSDRAInboundPropertiesTotalPersec','Total&#x20;number&#x20;of&#x20;object&#x20;properties&#x20;received&#x20;from&#x20;inbound&#x20;replication&#x20;partners.',36,1,0,0,0,0,'','','','select&#x20;DRAInboundPropertiesTotalPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(643,'Perf_NTDSDRAInboundTotalUpdatesRemaininginPacket','The&#x20;number&#x20;of&#x20;total&#x20;&#40;link&#x20;values&#x20;+&#x20;object&#41;&#x20;updates&#x20;received&#x20;in&#x20;the&#x20;current&#x20;directory&#x20;replication&#x20;update&#x20;packet&#x20;that&#x20;have&#x20;not&#x20;yet&#x20;been&#x2',36,1,0,0,0,0,'','','','select&#x20;DRAInboundTotalUpdatesRemaininginPacket&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(644,'Perf_NTDSDRAInboundValuesDNsonlyPersec','Number&#x20;of&#x20;object&#x20;property&#x20;values&#x20;received&#x20;from&#x20;inbound&#x20;replication&#x20;partners&#x20;that&#x20;are&#x20;Distinguished&#x20;Names;&#x20;i.e.,&#x20;that&#x20;reference&#x20;other&#x20;objects.&#x20;DN-values,&#x',36,1,0,0,0,0,'','','','select&#x20;DRAInboundValuesDNsonlyPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(645,'Perf_NTDSDRAInboundValuesTotalPersec','Total&#x20;number&#x20;of&#x20;object&#x20;property&#x20;values&#x20;received&#x20;from&#x20;inbound&#x20;replication&#x20;partners.&#x20;Each&#x20;inbound&#x20;object&#x20;has&#x20;one&#x20;or&#x20;more&#x20;properties,&#x20;and&#x20;each&#x20;prope',36,1,0,0,0,0,'','','','select&#x20;DRAInboundValuesTotalPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(646,'Perf_NTDSDRAOutboundBytesCompressedBetweenSitesAfterCompressionPersec','Compressed&#x20;size&#x20;in&#x20;bytes&#x20;of&#x20;outbound&#x20;compressed&#x20;replication&#x20;data&#x20;&#40;size&#x20;after&#x20;compression,&#x20;from&#x20;DSAs&#x20;in&#x20;other&#x20;sites&#41;.',36,1,0,0,0,0,'','','','select&#x20;DRAOutboundBytesCompressedBetweenSitesAfterCompressionPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(647,'Perf_NTDSDRAOutboundBytesCompressedBetweenSitesAfterCompressionSinceBoot','Compressed&#x20;size&#x20;in&#x20;bytes&#x20;of&#x20;outbound&#x20;compressed&#x20;replication&#x20;data&#x20;&#40;size&#x20;after&#x20;compression,&#x20;from&#x20;DSAs&#x20;in&#x20;other&#x20;sites&#41;.',36,1,0,0,0,0,'','','','select&#x20;DRAOutboundBytesCompressedBetweenSitesAfterCompressionSinceBoot&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(648,'Perf_NTDSDRAOutboundBytesCompressedBetweenSitesBeforeCompressionPersec','Original&#x20;size&#x20;in&#x20;bytes&#x20;of&#x20;outbound&#x20;compressed&#x20;replication&#x20;data&#x20;&#40;size&#x20;before&#x20;compression,&#x20;from&#x20;DSAs&#x20;in&#x20;other&#x20;sites&#41;.',36,1,0,0,0,0,'','','','select&#x20;DRAOutboundBytesCompressedBetweenSitesBeforeCompressionPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(649,'Perf_NTDSDRAOutboundBytesCompressedBetweenSitesBeforeCompressionSinceBoot','Original&#x20;size&#x20;in&#x20;bytes&#x20;of&#x20;outbound&#x20;compressed&#x20;replication&#x20;data&#x20;&#40;size&#x20;before&#x20;compression,&#x20;from&#x20;DSAs&#x20;in&#x20;other&#x20;sites&#41;.',36,1,0,0,0,0,'','','','select&#x20;DRAOutboundBytesCompressedBetweenSitesBeforeCompressionSinceBoot&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(650,'Perf_NTDSDRAOutboundBytesNotCompressedWithinSitePersec','Number&#x20;of&#x20;bytes&#x20;replicated&#x20;out&#x20;that&#x20;were&#x20;not&#x20;compressed&#x20;&#40;i.e.,&#x20;from&#x20;DSAs&#x20;in&#x20;the&#x20;same&#x20;site&#41;.',36,1,0,0,0,0,'','','','select&#x20;DRAOutboundBytesNotCompressedWithinSitePersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(651,'Perf_NTDSDRAOutboundBytesNotCompressedWithinSiteSinceBoot','Number&#x20;of&#x20;bytes&#x20;replicated&#x20;out&#x20;that&#x20;were&#x20;not&#x20;compressed&#x20;&#40;i.e.,&#x20;from&#x20;DSAs&#x20;in&#x20;the&#x20;same&#x20;site&#41;.',36,1,0,0,0,0,'','','','select&#x20;DRAOutboundBytesNotCompressedWithinSiteSinceBoot&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(652,'Perf_NTDSDRAOutboundBytesTotalPersec','Total&#x20;number&#x20;of&#x20;bytes&#x20;replicated&#x20;out.&#x20;Sum&#x20;of&#x20;the&#x20;number&#x20;of&#x20;uncompressed&#x20;bytes&#x20;&#40;never&#x20;compressed&#41;&#x20;and&#x20;the&#x20;number&#x20;of&#x20;compressed&#x20;bytes&#x20;&#40;',36,1,0,0,0,0,'','','','select&#x20;DRAOutboundBytesTotalPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(653,'Perf_NTDSDRAOutboundBytesTotalSinceBoot','Total&#x20;number&#x20;of&#x20;bytes&#x20;replicated&#x20;out.&#x20;Sum&#x20;of&#x20;the&#x20;number&#x20;of&#x20;uncompressed&#x20;bytes&#x20;&#40;never&#x20;compressed&#41;&#x20;and&#x20;the&#x20;number&#x20;of&#x20;compressed&#x20;bytes&#x20;&#40;',36,1,0,0,0,0,'','','','select&#x20;DRAOutboundBytesTotalSinceBoot&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(654,'Perf_NTDSDRAOutboundObjectsFilteredPersec','Number&#x20;of&#x20;objects&#x20;looked&#x20;at&#x20;by&#x20;outbound&#x20;replication&#x20;that&#x20;were&#x20;determined&#x20;to&#x20;have&#x20;no&#x20;updates&#x20;that&#x20;the&#x20;outbound&#x20;partner&#x20;did&#x20;not&#x20;already&#x20;have.',36,1,0,0,0,0,'','','','select&#x20;DRAOutboundObjectsFilteredPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(655,'Perf_NTDSDRAOutboundObjectsPersec','No&#x20;of&#x20;objects&#x20;replicated&#x20;out.',36,1,0,0,0,0,'','','','select&#x20;DRAOutboundObjectsPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(656,'Perf_NTDSDRAOutboundPropertiesPersec','No&#x20;of&#x20;properties&#x20;replicated&#x20;out.',36,1,0,0,0,0,'','','','select&#x20;DRAOutboundPropertiesPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(657,'Perf_NTDSDRAOutboundValuesDNsonlyPersec','Number&#x20;of&#x20;object&#x20;property&#x20;values&#x20;containing&#x20;Distinguished&#x20;Names&#x20;sent&#x20;to&#x20;outbound&#x20;replication&#x20;partners.&#x20;DN-values,&#x20;such&#x20;as&#x20;group&#x20;or&#x20;distribution&#x20;list&#x20;m',36,1,0,0,0,0,'','','','select&#x20;DRAOutboundValuesDNsonlyPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(658,'Perf_NTDSDRAOutboundValuesTotalPersec','Number&#x20;of&#x20;object&#x20;property&#x20;values&#x20;sent&#x20;to&#x20;outbound&#x20;replication&#x20;partners.',36,1,0,0,0,0,'','','','select&#x20;DRAOutboundValuesTotalPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(659,'Perf_NTDSDRAPendingReplicationOperations','The&#x20;total&#x20;number&#x20;of&#x20;replication&#x20;operations&#x20;on&#x20;the&#x20;directory&#x20;that&#x20;are&#x20;queued&#x20;for&#x20;this&#x20;server&#x20;but&#x20;not&#x20;yet&#x20;performed.',36,1,0,0,0,0,'','','','select&#x20;DRAPendingReplicationOperations&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(660,'Perf_NTDSDRAPendingReplicationSynchronizations','DRA&#x20;Pending&#x20;Replication&#x20;Synchronizations&#x20;is&#x20;the&#x20;number&#x20;of&#x20;directory&#x20;synchronizations&#x20;that&#x20;are&#x20;queued&#x20;for&#x20;this&#x20;server&#x20;but&#x20;not&#x20;yet&#x20;processed.',36,1,0,0,0,0,'','','','select&#x20;DRAPendingReplicationSynchronizations&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(661,'Perf_NTDSDRASyncFailuresonSchemaMismatch','No&#x20;of&#x20;sync&#x20;requests&#x20;made&#x20;to&#x20;the&#x20;neighbors&#x20;that&#x20;failed&#x20;because&#x20;their&#x20;schema&#x20;are&#x20;out&#x20;of&#x20;sync.',36,1,0,0,0,0,'','','','select&#x20;DRASyncFailuresonSchemaMismatch&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(662,'Perf_NTDSDRASyncRequestsMade','No&#x20;of&#x20;sync&#x20;requests&#x20;made&#x20;to&#x20;the&#x20;neighbors.',36,1,0,0,0,0,'','','','select&#x20;DRASyncRequestsMade&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(663,'Perf_NTDSDRASyncRequestsSuccessful','No&#x20;of&#x20;sync&#x20;requests&#x20;made&#x20;to&#x20;the&#x20;neighbors&#x20;that&#x20;successfully&#x20;returned.',36,1,0,0,0,0,'','','','select&#x20;DRASyncRequestsSuccessful&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(664,'Perf_NTDSDRAThreadsGettingNCChanges','The&#x20;number&#x20;of&#x20;threads&#x20;on&#x20;the&#x20;server&#x20;which&#x20;are&#x20;currently&#x20;attempting&#x20;to&#x20;acquire&#x20;changes&#x20;from&#x20;another&#x20;server.',36,1,0,0,0,0,'','','','select&#x20;DRAThreadsGettingNCChanges&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(665,'Perf_NTDSDRAThreadsGettingNCChangesHoldingSemaphore','The&#x20;number&#x20;of&#x20;threads&#x20;on&#x20;the&#x20;server&#x20;which&#x20;are&#x20;currently&#x20;attempting&#x20;to&#x20;acquire&#x20;changes&#x20;from&#x20;another&#x20;server&#x20;and&#x20;hold&#x20;a&#x20;semaphore&#x20;required&#x20;to&#',36,1,0,0,0,0,'','','','select&#x20;DRAThreadsGettingNCChangesHoldingSemaphore&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(666,'Perf_NTDSDSClientBindsPersec','Number&#x20;of&#x20;ntdsapi.dll&#x20;binds&#x20;per&#x20;second&#x20;serviced&#x20;by&#x20;this&#x20;DC.',36,1,0,0,0,0,'','','','select&#x20;DSClientBindsPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(667,'Perf_NTDSDSClientNameTranslationsPersec','Number&#x20;of&#x20;ntdsapi.dll&#x20;name&#x20;translations&#x20;per&#x20;second&#x20;serviced&#x20;by&#x20;this&#x20;DC.',36,1,0,0,0,0,'','','','select&#x20;DSClientNameTranslationsPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(668,'Perf_NTDSDSDirectoryReadsPersec','Number&#x20;of&#x20;directory&#x20;reads&#x20;per&#x20;second.',36,1,0,0,0,0,'','','','select&#x20;DSDirectoryReadsPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(669,'Perf_NTDSDSDirectorySearchesPersec','Number&#x20;of&#x20;directory&#x20;searches&#x20;per&#x20;second.',36,1,0,0,0,0,'','','','select&#x20;DSDirectorySearchesPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(670,'Perf_NTDSDSDirectoryWritesPersec','Number&#x20;of&#x20;directory&#x20;writes&#x20;per&#x20;second.',36,1,0,0,0,0,'','','','select&#x20;DSDirectoryWritesPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(671,'Perf_NTDSDSMonitorListSize','The&#x20;number&#x20;of&#x20;requests&#x20;to&#x20;be&#x20;notified&#x20;when&#x20;objects&#x20;are&#x20;updated&#x20;that&#x20;are&#x20;currently&#x20;registered&#x20;with&#x20;this&#x20;DSA.',36,1,0,0,0,0,'','','','select&#x20;DSMonitorListSize&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(672,'Perf_NTDSDSNameCachehitrate','The&#x20;percentage&#x20;of&#x20;directory&#x20;object&#x20;name&#x20;component&#x20;look&#x20;ups&#x20;that&#x20;are&#x20;satisfied&#x20;out&#x20;of&#x20;the&#x20;DSA&#039;s&#x20;name&#x20;cache.',36,1,0,0,0,0,'','','','select&#x20;DSNameCachehitrate&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(673,'Perf_NTDSDSNotifyQueueSize','The&#x20;number&#x20;of&#x20;pending&#x20;update&#x20;notifications&#x20;that&#x20;have&#x20;been&#x20;queued,&#x20;but&#x20;not&#x20;yet&#x20;transmitted&#x20;to&#x20;clients.',36,1,0,0,0,0,'','','','select&#x20;DSNotifyQueueSize&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(674,'Perf_NTDSDSSearchsuboperationsPersec','Number&#x20;of&#x20;search&#x20;suboperations&#x20;per&#x20;second.&#x20;One&#x20;search&#x20;operation&#x20;is&#x20;made&#x20;up&#x20;of&#x20;many&#x20;sub&#x20;operations.&#x20;A&#x20;sub&#x20;operation&#x20;roughly&#x20;corresponds&#x20;to&#x20;an',36,1,0,0,0,0,'','','','select&#x20;DSSearchsuboperationsPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(675,'Perf_NTDSDSSecurityDescriptorsuboperationsPersec','Number&#x20;of&#x20;Security&#x20;Descriptor&#x20;Propagation&#x20;suboperations&#x20;per&#x20;second.&#x20;One&#x20;Security&#x20;Descriptor&#x20;Propagation&#x20;operation&#x20;is&#x20;made&#x20;up&#x20;of&#x20;many&#x20;sub&#x20;operations.&#x20;A',36,1,0,0,0,0,'','','','select&#x20;DSSecurityDescriptorsuboperationsPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(676,'Perf_NTDSDSServerBindsPersec','Number&#x20;of&#x20;DC-to-DC&#x20;binds&#x20;per&#x20;second&#x20;serviced&#x20;by&#x20;this&#x20;DC.',36,1,0,0,0,0,'','','','select&#x20;DSServerBindsPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(677,'Perf_NTDSDSServerNameTranslationsPersec','Number&#x20;of&#x20;DC-to-DC&#x20;name&#x20;translations&#x20;per&#x20;second&#x20;serviced&#x20;by&#x20;this&#x20;DC.',36,1,0,0,0,0,'','','','select&#x20;DSServerNameTranslationsPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(678,'Perf_NTDSDSThreadsinUse','DS&#x20;Threads&#x20;in&#x20;Use&#x20;is&#x20;the&#x20;current&#x20;number&#x20;of&#x20;threads&#x20;in&#x20;use&#x20;by&#x20;the&#x20;directory&#x20;service&#x20;&#40;different&#x20;than&#x20;the&#x20;number&#x20;of&#x20;threads&#x20;in&#x20;the&#x2',36,1,0,0,0,0,'','','','select&#x20;DSThreadsinUse&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(679,'Perf_NTDSExternalBindsPersec','The&#x20;number&#x20;of&#x20;external&#x20;binds/sec',36,1,0,0,0,0,'','','','select&#x20;ExternalBindsPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(680,'Perf_NTDSFastBindsPersec','The&#x20;number&#x20;of&#x20;fast&#x20;binds/sec',36,1,0,0,0,0,'','','','select&#x20;FastBindsPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(681,'Perf_NTDSLDAPActiveThreads','LDAP&#x20;Active&#x20;Threads&#x20;is&#x20;the&#x20;current&#x20;number&#x20;of&#x20;threads&#x20;in&#x20;use&#x20;by&#x20;the&#x20;LDAP&#x20;subsystem&#x20;of&#x20;the&#x20;local&#x20;directory&#x20;service.',36,1,0,0,0,0,'','','','select&#x20;LDAPActiveThreads&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(682,'Perf_NTDSLDAPBindTime','Time&#x20;&#40;in&#x20;milliseconds&#41;&#x20;taken&#x20;for&#x20;last&#x20;successful&#x20;LDAP&#x20;bind.',36,1,0,0,0,0,'','','','select&#x20;LDAPBindTime&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(683,'Perf_NTDSLDAPClientSessions','Number&#x20;of&#x20;connected&#x20;LDAP&#x20;client&#x20;sessions.',36,1,0,0,0,0,'','','','select&#x20;LDAPClientSessions&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(684,'Perf_NTDSLDAPClosedConnectionsPersec','The&#x20;number&#x20;of&#x20;LDAP&#x20;connections&#x20;that&#x20;have&#x20;been&#x20;closed&#x20;in&#x20;the&#x20;last&#x20;second.',36,1,0,0,0,0,'','','','select&#x20;LDAPClosedConnectionsPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(685,'Perf_NTDSLDAPNewConnectionsPersec','The&#x20;number&#x20;of&#x20;new&#x20;LDAP&#x20;connections&#x20;that&#x20;have&#x20;arrived&#x20;in&#x20;the&#x20;last&#x20;second.',36,1,0,0,0,0,'','','','select&#x20;LDAPNewConnectionsPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(686,'Perf_NTDSLDAPNewSSLConnectionsPersec','The&#x20;number&#x20;of&#x20;new&#x20;SSL&#x20;or&#x20;TLS&#x20;connections&#x20;that&#x20;arrived&#x20;in&#x20;the&#x20;last&#x20;second.',36,1,0,0,0,0,'','','','select&#x20;LDAPNewSSLConnectionsPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(687,'Perf_NTDSLDAPSearchesPersec','LDAP&#x20;Searches/sec&#x20;is&#x20;the&#x20;rate&#x20;at&#x20;which&#x20;LDAP&#x20;clients&#x20;perform&#x20;search&#x20;operations.',36,1,0,0,0,0,'','','','select&#x20;LDAPSearchesPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(688,'Perf_NTDSLDAPSuccessfulBindsPersec','Number&#x20;of&#x20;LDAP&#x20;Binds&#x20;per&#x20;second.',36,1,0,0,0,0,'','','','select&#x20;LDAPSuccessfulBindsPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(689,'Perf_NTDSLDAPUDPoperationsPersec','The&#x20;number&#x20;of&#x20;UDP&#x20;operations&#x20;the&#x20;LDAP&#x20;server&#x20;is&#x20;processing&#x20;per&#x20;second.',36,1,0,0,0,0,'','','','select&#x20;LDAPUDPoperationsPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(690,'Perf_NTDSLDAPWritesPersec','LDAP&#x20;Writes/sec&#x20;is&#x20;the&#x20;rate&#x20;at&#x20;which&#x20;LDAP&#x20;clients&#x20;perform&#x20;write&#x20;operations.',36,1,0,0,0,0,'','','','select&#x20;LDAPWritesPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(691,'Perf_NTDSLinkValuesCleanedPersec','The&#x20;rate&#x20;at&#x20;which&#x20;link&#x20;values&#x20;that&#x20;need&#x20;to&#x20;be&#x20;cleaned&#x20;are&#x20;cleaned.',36,1,0,0,0,0,'','','','select&#x20;LinkValuesCleanedPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(692,'Perf_NTDSNegotiatedBindsPersec','The&#x20;number&#x20;of&#x20;negotiated&#x20;binds/sec',36,1,0,0,0,0,'','','','select&#x20;NegotiatedBindsPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(693,'Perf_NTDSNTLMBindsPersec','The&#x20;number&#x20;of&#x20;NTLM&#x20;binds/sec',36,1,0,0,0,0,'','','','select&#x20;NTLMBindsPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(694,'Perf_NTDSOnelevelsearchesPersec','The&#x20;number&#x20;of&#x20;onelevel&#x20;searches/sec',36,1,0,0,0,0,'','','','select&#x20;OnelevelsearchesPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(695,'Perf_NTDSPhantomsCleanedPersec','The&#x20;rate&#x20;at&#x20;which&#x20;stale&#x20;phantoms&#x20;are&#x20;cleaned.',36,1,0,0,0,0,'','','','select&#x20;PhantomsCleanedPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(696,'Perf_NTDSPhantomsVisitedPersec','The&#x20;rate&#x20;at&#x20;which&#x20;phantoms&#x20;are&#x20;visited&#x20;to&#x20;determine&#x20;if&#x20;they&#x20;are&#x20;stale&#x20;and&#x20;need&#x20;to&#x20;be&#x20;cleaned.',36,1,0,0,0,0,'','','','select&#x20;PhantomsVisitedPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(697,'Perf_NTDSSimpleBindsPersec','The&#x20;number&#x20;of&#x20;simple&#x20;binds/sec',36,1,0,0,0,0,'','','','select&#x20;SimpleBindsPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(698,'Perf_NTDSSubtreesearchesPersec','The&#x20;number&#x20;of&#x20;subtree&#x20;searches/sec',36,1,0,0,0,0,'','','','select&#x20;SubtreesearchesPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(699,'Perf_NTDSTombstonesGarbageCollectedPersec','The&#x20;rate&#x20;at&#x20;which&#x20;expired&#x20;tombstoned&#x20;objects&#x20;are&#x20;garbage&#x20;collected.',36,1,0,0,0,0,'','','','select&#x20;TombstonesGarbageCollectedPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(700,'Perf_NTDSTombstonesVisitedPersec','The&#x20;rate&#x20;at&#x20;which&#x20;tombstoned&#x20;objects&#x20;are&#x20;visited&#x20;to&#x20;be&#x20;considered&#x20;for&#x20;garbage&#x20;collected.',36,1,0,0,0,0,'','','','select&#x20;TombstonesVisitedPersec&#x20;from&#x20;Win32_PerfRawData_NTDS_NTDS',3,6,0,'Administrator','none','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(701,'BullGuard_BsBackup_service','The&#x20;BullGuard&#x20;Backup&#x20;service&#x20;enables&#x20;you&#x20;to&#x20;backup&#x20;files&#x20;that&#x20;are&#x20;in&#x20;use&#x0d;&#x0a;',37,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name&#x20;=&#x20;&quot;BsBackup&quot;',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(703,'BullGuard_BsBhvScan_service','BullGuard&#x20;behavioural&#x20;detection&#x20;service&#x0d;&#x0a;&#x0d;&#x0a;',37,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name&#x20;=&#x20;&quot;BsBhvScan&quot;',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(704,'BullGuard_BsFileScan_service','The&#x20;BullGuard&#x20;File&#x20;Scan&#x20;service&#x20;performs&#x20;on-access&#x20;scan&#x20;for&#x20;detecting&#x20;malware&#x20;in&#x20;real&#x20;time&#x0d;&#x0a;',37,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name&#x20;=&#x20;&quot;BsFileScan&quot;',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(705,'BullGuard_firewall_service','BullGuard&#x20;firewall&#x20;service&#x0d;&#x0a;&#x0d;&#x0a;',37,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name&#x20;=&#x20;&quot;BsFire&quot;',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(706,'BullGuard_BsMailProxy_service','The&#x20;BullGuard&#x20;Behavioural&#x20;Detection&#x20;Service&#x20;is&#x20;an&#x20;anti-virus&#x20;component&#x20;of&#x20;BullGuard&#x20;Internet&#x20;Security&#x0d;&#x0a;&#x0d;&#x0a;',37,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name&#x20;=&#x20;&quot;BsMailProxy&quot;',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(707,'BullGuard_main_service','BullGuard&#x20;main&#x20;service&#x0d;&#x0a;&#x0d;&#x0a;',37,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name&#x20;=&#x20;&quot;BsMain&quot;',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(708,'BullGuard_BsScanner_service','The&#x20;BullGuard&#x20;Scan&#x20;Service&#x20;is&#x20;the&#x20;central&#x20;anti-virus&#x20;component&#x20;of&#x20;BullGuard&#x20;Internet&#x20;Security&#x0d;&#x0a;&#x0d;&#x0a;&#x0d;&#x0a;',37,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name&#x20;=&#x20;&quot;BsScanner&quot;',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(709,'BullGuard_update_service','BullGuard&#x20;update&#x20;service&#x0d;&#x0a;&#x0d;&#x0a;',37,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name&#x20;=&#x20;&quot;BsUpdate&quot;',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(710,'Serv_OracleService&lt;SID&gt;','Returns&#x20;OracleService&lt;SID&gt;&#x20;status',28,2,0,0,0,1,'','','','SELECT&#x20;state&#x20;FROM&#x20;Win32_Service&#x20;WHERE&#x20;Name&#x20;=&#x20;&quot;OracleService&lt;SID&gt;&quot;',7,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(711,'Perf_OracleOtherOperationCount','Returns&#x20;other&#x20;operation&#x20;count&#x20;per&#x20;second&#x20;for&#x20;Oracle&#x20;process.',28,4,0,0,0,0,'','','','select&#x20;OtherOperationCount&#x20;from&#x20;Win32_Process&#x20;WHERE&#x20;Caption&#x20;=&#x20;&quot;oracle.exe&quot;',7,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(712,'Perf_OracleOtherTransferCount','Returns&#x20;other&#x20;transfer&#x20;count&#x20;per&#x20;second&#x20;for&#x20;Oracle&#x20;process.',28,4,0,0,0,0,'','','','select&#x20;OtherTransferCount&#x20;from&#x20;Win32_Process&#x20;WHERE&#x20;Caption&#x20;=&#x20;&quot;oracle.exe&quot;',7,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(713,'Perf_OraclePageFaults','Returns&#x20;page&#x20;faults&#x20;count&#x20;per&#x20;second&#x20;for&#x20;Oracle&#x20;process.',28,4,0,0,0,0,'','','','select&#x20;PageFaults&#x20;from&#x20;Win32_Process&#x20;WHERE&#x20;Caption&#x20;=&#x20;&quot;oracle.exe&quot;',7,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(714,'Perf_OraclePageFileUsage','Returns&#x20;page&#x20;file&#x20;usage&#x20;count&#x20;per&#x20;second&#x20;for&#x20;Oracle&#x20;process.',28,4,0,0,0,0,'','','','select&#x20;PageFileUsage&#x20;from&#x20;Win32_Process&#x20;WHERE&#x20;Caption&#x20;=&#x20;&quot;oracle.exe&quot;',7,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(715,'Perf_OraclePrivatePageCount','Returns&#x20;private&#x20;page&#x20;access&#x20;count&#x20;per&#x20;second&#x20;for&#x20;Oracle&#x20;process.',28,4,0,0,0,0,'','','','select&#x20;PrivatePageCount&#x20;from&#x20;Win32_Process&#x20;WHERE&#x20;Caption&#x20;=&#x20;&quot;oracle.exe&quot;',7,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(716,'Perf_OracleQuotaNonPagedPoolUsage','Returns&#x20;the&#x20;current&#x20;quota&#x20;for&#x20;non&#x20;paged&#x20;pool&#x20;usage&#x20;in&#x20;Oracle&#x20;process.',28,1,0,0,0,0,'','','','select&#x20;QuotaNonPagedPoolUsage&#x20;from&#x20;Win32_Process&#x20;WHERE&#x20;Caption&#x20;=&#x20;&quot;oracle.exe&quot;',7,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(717,'Perf_OracleQuotaPagedPoolUsage','Returns&#x20;the&#x20;current&#x20;quota&#x20;for&#x20;paged&#x20;pool&#x20;usage&#x20;in&#x20;Oracle&#x20;process.',28,1,0,0,0,0,'','','','select&#x20;QuotaPagedPoolUsage&#x20;from&#x20;Win32_Process&#x20;WHERE&#x20;Caption&#x20;=&#x20;&quot;oracle.exe&quot;',7,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(718,'Perf_OracleReadOperationCount','Returns&#x20;read&#x20;operation&#x20;count&#x20;per&#x20;second&#x20;for&#x20;Oracle&#x20;process.',28,4,0,0,0,0,'','','','select&#x20;ReadOperationCount&#x20;from&#x20;Win32_Process&#x20;WHERE&#x20;Caption&#x20;=&#x20;&quot;oracle.exe&quot;',7,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(719,'Perf_OracleReadTransferCount','Returns&#x20;read&#x20;transfer&#x20;count&#x20;per&#x20;second&#x20;for&#x20;Oracle&#x20;process.',28,4,0,0,0,0,'','','','select&#x20;ReadTransferCount&#x20;from&#x20;Win32_Process&#x20;WHERE&#x20;Caption&#x20;=&#x20;&quot;oracle.exe&quot;',7,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(720,'Perf_OracleThreadCount','Returns&#x20;current&#x20;thread&#x20;count&#x20;for&#x20;Oracle&#x20;process.',28,1,0,0,0,0,'','','','select&#x20;ThreadCount&#x20;from&#x20;Win32_Process&#x20;WHERE&#x20;Caption&#x20;=&#x20;&quot;oracle.exe&quot;',7,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(721,'Perf_OracleWriteOperationCount','Returns&#x20;write&#x20;operation&#x20;count&#x20;per&#x20;second&#x20;for&#x20;Oracle&#x20;process.',28,4,0,0,0,0,'','','','select&#x20;WriteOperationCount&#x20;from&#x20;Win32_Process&#x20;WHERE&#x20;Caption&#x20;=&#x20;&quot;oracle.exe&quot;',7,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(722,'Perf_OracleWriteTransferCount','Returns&#x20;write&#x20;transfer&#x20;count&#x20;per&#x20;second&#x20;for&#x20;Oracle&#x20;process.',28,4,0,0,0,0,'','','','select&#x20;WriteTransferCount&#x20;from&#x20;Win32_Process&#x20;WHERE&#x20;Caption&#x20;=&#x20;&quot;oracle.exe&quot;',7,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(723,'Serv_MSExchangeAB','Microsoft&#x20;Exchange&#x20;MSExchangeAB&#x20;service&#x20;status.',26,2,0,0,300,1,'','','Running','Select&#x20;State&#x20;from&#x20;Win32_Service&#x20;WHERE&#x20;name&#x20;=&#x20;&#039;MSExchangeAB&#039;',3,6,0,'Administrador','6683','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(724,'Serv_MSExchangeADTopology','Microsoft&#x20;Exchange&#x20;MSExchangeADTopology&#x20;service&#x20;status.',26,2,0,0,300,1,'','','Running','Select&#x20;State&#x20;from&#x20;Win32_Service&#x20;WHERE&#x20;name&#x20;=&#x20;&#039;MSExchangeADTopology&#039;',3,6,0,'Administrador','6683','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(725,'Serv_MSExchangeAntispamUpdate','Microsoft&#x20;Exchange&#x20;MSExchangeAntispamUpdate&#x20;service&#x20;status.',26,2,0,0,300,1,'','','Running','Select&#x20;State&#x20;from&#x20;Win32_Service&#x20;WHERE&#x20;name&#x20;=&#x20;&#039;MSExchangeAntispamUpdate&#039;',3,6,0,'Administrador','6683','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(726,'Serv_MSExchangeEdgeSync','Microsoft&#x20;Exchange&#x20;MSExchangeEdgeSync&#x20;service&#x20;status.',26,2,0,0,300,1,'','','Running','Select&#x20;State&#x20;from&#x20;Win32_Service&#x20;WHERE&#x20;name&#x20;=&#x20;&#039;MSExchangeEdgeSync&#039;',3,6,0,'Administrador','6683','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(727,'Serv_MSExchangeFBA','Microsoft&#x20;Exchange&#x20;MSExchangeFBA&#x20;service&#x20;status.',26,2,0,0,300,1,'','','Running','Select&#x20;State&#x20;from&#x20;Win32_Service&#x20;WHERE&#x20;name&#x20;=&#x20;&#039;MSExchangeFBA&#039;',3,6,0,'Administrador','6683','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(728,'Serv_MSExchangeFDS','Microsoft&#x20;Exchange&#x20;MSExchangeFDS&#x20;service&#x20;status.',26,2,0,0,300,1,'','','Running','Select&#x20;State&#x20;from&#x20;Win32_Service&#x20;WHERE&#x20;name&#x20;=&#x20;&#039;MSExchangeFDS&#039;',3,6,0,'Administrador','6683','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(729,'Serv_MSExchangeImap4','Microsoft&#x20;Exchange&#x20;MSExchangeImap4&#x20;service&#x20;status.',26,2,0,0,300,1,'','','Running','Select&#x20;State&#x20;from&#x20;Win32_Service&#x20;WHERE&#x20;name&#x20;=&#x20;&#039;MSExchangeImap4&#039;',3,6,0,'Administrador','6683','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(730,'Serv_MSExchangeIS','Microsoft&#x20;Exchange&#x20;MSExchangeIS&#x20;service&#x20;status.',26,2,0,0,300,1,'','','Running','Select&#x20;State&#x20;from&#x20;Win32_Service&#x20;WHERE&#x20;name&#x20;=&#x20;&#039;MSExchangeIS&#039;',3,6,0,'Administrador','6683','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(731,'Serv_MSExchangeMailboxAssistants','Microsoft&#x20;Exchange&#x20;MSExchangeMailboxAssistants&#x20;service&#x20;status.',26,2,0,0,300,1,'','','Running','Select&#x20;State&#x20;from&#x20;Win32_Service&#x20;WHERE&#x20;name&#x20;=&#x20;&#039;MSExchangeMailboxAssistants&#039;',3,6,0,'Administrador','6683','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(732,'Serv_MSExchangeMailboxReplication','Microsoft&#x20;Exchange&#x20;MSExchangeMailboxReplication&#x20;service&#x20;status.',26,2,0,0,300,1,'','','Running','Select&#x20;State&#x20;from&#x20;Win32_Service&#x20;WHERE&#x20;name&#x20;=&#x20;&#039;MSExchangeMailboxReplication&#039;',3,6,0,'Administrador','6683','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(733,'Serv_MSExchangeMailSubmission','Microsoft&#x20;Exchange&#x20;MSExchangeMailSubmission&#x20;service&#x20;status.',26,2,0,0,300,1,'','','Running','Select&#x20;State&#x20;from&#x20;Win32_Service&#x20;WHERE&#x20;name&#x20;=&#x20;&#039;MSExchangeMailSubmission&#039;',3,6,0,'Administrador','6683','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(734,'Serv_MSExchangePop3','Microsoft&#x20;Exchange&#x20;MSExchangePop3&#x20;service&#x20;status.',26,2,0,0,300,1,'','','Running','Select&#x20;State&#x20;from&#x20;Win32_Service&#x20;WHERE&#x20;name&#x20;=&#x20;&#039;MSExchangePop3&#039;',3,6,0,'Administrador','6683','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(735,'Serv_MSExchangeProtectedServiceHost','Microsoft&#x20;Exchange&#x20;MSExchangeProtectedServiceHost&#x20;service&#x20;status.',26,2,0,0,300,1,'','','Running','Select&#x20;State&#x20;from&#x20;Win32_Service&#x20;WHERE&#x20;name&#x20;=&#x20;&#039;MSExchangeProtectedServiceHost&#039;',3,6,0,'Administrador','6683','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(736,'Serv_MSExchangeRepl','Microsoft&#x20;Exchange&#x20;MSExchangeRepl&#x20;service&#x20;status.',26,2,0,0,300,1,'','','Running','Select&#x20;State&#x20;from&#x20;Win32_Service&#x20;WHERE&#x20;name&#x20;=&#x20;&#039;MSExchangeRepl&#039;',3,6,0,'Administrador','6683','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(737,'Serv_MSExchangeRPC','Microsoft&#x20;Exchange&#x20;MSExchangeRPC&#x20;service&#x20;status.',26,2,0,0,300,1,'','','Running','Select&#x20;State&#x20;from&#x20;Win32_Service&#x20;WHERE&#x20;name&#x20;=&#x20;&#039;MSExchangeRPC&#039;',3,6,0,'Administrador','6683','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(738,'Serv_MSExchangeSA','Microsoft&#x20;Exchange&#x20;MSExchangeSA&#x20;service&#x20;status.',26,2,0,0,300,1,'','','Running','Select&#x20;State&#x20;from&#x20;Win32_Service&#x20;WHERE&#x20;name&#x20;=&#x20;&#039;MSExchangeSA&#039;',3,6,0,'Administrador','6683','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(739,'Serv_MSExchangeSearch','Microsoft&#x20;Exchange&#x20;MSExchangeSearch&#x20;service&#x20;status.',26,2,0,0,300,1,'','','Running','Select&#x20;State&#x20;from&#x20;Win32_Service&#x20;WHERE&#x20;name&#x20;=&#x20;&#039;MSExchangeSearch&#039;',3,6,0,'Administrador','6683','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(740,'Serv_MSExchangeSearchB','Microsoft&#x20;Exchange&#x20;msftesql-Exchange&#x20;service&#x20;status.',26,2,0,0,300,1,'','','Running','Select&#x20;State&#x20;from&#x20;Win32_Service&#x20;WHERE&#x20;name&#x20;=&#x20;&#039;msftesql-Exchange&#039;',3,6,0,'Administrador','6683','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(741,'Serv_MSExchangeServiceHost','Microsoft&#x20;Exchange&#x20;MSExchangeServiceHost&#x20;service&#x20;status.',26,2,0,0,300,1,'','','Running','Select&#x20;State&#x20;from&#x20;Win32_Service&#x20;WHERE&#x20;name&#x20;=&#x20;&#039;MSExchangeServiceHost&#039;',3,6,0,'Administrador','6683','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(742,'Serv_MSExchangeThrottling','Microsoft&#x20;Exchange&#x20;MSExchangeThrottling&#x20;service&#x20;status.',26,2,0,0,300,1,'','','Running','Select&#x20;State&#x20;from&#x20;Win32_Service&#x20;WHERE&#x20;name&#x20;=&#x20;&#039;MSExchangeThrottling&#039;',3,6,0,'Administrador','6683','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(743,'Serv_MSExchangeTransport','Microsoft&#x20;Exchange&#x20;MSExchangeTransport&#x20;service&#x20;status.',26,2,0,0,300,1,'','','Running','Select&#x20;State&#x20;from&#x20;Win32_Service&#x20;WHERE&#x20;name&#x20;=&#x20;&#039;MSExchangeTransport&#039;',3,6,0,'Administrador','6683','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(744,'Serv_MSExchangeTransportLogSearch','Microsoft&#x20;Exchange&#x20;MSExchangeTransportLogSearch&#x20;service&#x20;status.',26,2,0,0,300,1,'','','Running','Select&#x20;State&#x20;from&#x20;Win32_Service&#x20;WHERE&#x20;name&#x20;=&#x20;&#039;MSExchangeTransportLogSearch&#039;',3,6,0,'Administrador','6683','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(745,'Serv_W3SVC','Microsoft&#x20;IIS&#x20;W3SVC&#x20;service&#x20;status.',38,2,0,0,300,1,'','','Running','Select&#x20;State&#x20;from&#x20;Win32_Service&#x20;WHERE&#x20;name&#x20;=&#x20;&#039;W3SVC&#039;',3,6,0,'Administrador','6683','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(746,'Serv_SMTPSVC','Microsoft&#x20;IIS&#x20;SMTPSVC&#x20;service&#x20;status.',38,2,0,0,300,1,'','','Running','Select&#x20;State&#x20;from&#x20;Win32_Service&#x20;WHERE&#x20;name&#x20;=&#x20;&#039;SMTPSVC&#039;',3,6,0,'Administrador','6683','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(747,'Serv_NNTPSVC','Microsoft&#x20;IIS&#x20;NNTPSVC&#x20;service&#x20;status.',38,2,0,0,300,1,'','','Running','Select&#x20;State&#x20;from&#x20;Win32_Service&#x20;WHERE&#x20;name&#x20;=&#x20;&#039;NNTPSVC&#039;',3,6,0,'Administrador','6683','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(749,'Serv_MSFTPSVC','Microsoft&#x20;IIS&#x20;MSFTPSVC&#x20;service&#x20;status.',38,2,0,0,300,1,'','','Running','Select&#x20;State&#x20;from&#x20;Win32_Service&#x20;WHERE&#x20;name&#x20;=&#x20;&#039;MSFTPSVC&#039;',3,6,0,'Administrador','6683','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(750,'Serv_WinRM','Microsoft&#x20;Windows&#x20;WinRM&#x20;service&#x20;status.',16,2,0,0,300,1,'','','Running','Select&#x20;State&#x20;from&#x20;Win32_Service&#x20;WHERE&#x20;name&#x20;=&#x20;&#039;WinRM&#039;',3,6,0,'Administrador','6683','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(751,'Check&#x20;port&#x20;59535/TCP','Checks&#x20;59535/TCP&#x20;Port&#x20;status.',39,9,0,0,0,59535,'','','public','',3,2,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(752,'Check&#x20;port&#x20;59536/TCP','Checks&#x20;59536/TCP&#x20;Port&#x20;status.',39,9,0,0,0,59536,'','','public','',3,2,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(753,'Check&#x20;RPC&#x20;Server','Checks&#x20;RPC&#x20;Port&#x20;status.',39,9,0,0,0,135,'','','public','',3,2,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(754,'Check&#x20;POP3&#x20;Server','Checks&#x20;POP3&#x20;Port&#x20;status.',39,9,0,0,0,110,'','','public','',3,2,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(755,'Check&#x20;IMAP4&#x20;Server','Checks&#x20;IMAP4&#x20;Port&#x20;status.',39,9,0,0,0,143,'','','public','',3,2,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(756,'Check&#x20;SMTP&#x20;Server','Checks&#x20;SMTP&#x20;Port&#x20;status.',39,9,0,0,0,25,'','','public','',3,2,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(757,'AVGIDSAgent_status','Show&#x20;if&#x20;AVGIDSAgent&#x20;is&#x20;running&#x0d;&#x0a;',40,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name&#x20;=&#x20;&quot;AVGIDSAgent&quot;&#x20;',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(758,'AVG_watchdog_status','Show&#x20;if&#x20;AVG&#x20;watchdog&#x20;is&#x20;running&#x0d;&#x0a;',40,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name&#x20;=&#x20;&quot;avgwd&quot;&#x20;',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(759,'AVG_firewall_status','Show&#x20;if&#x20;AVG&#x20;firewall&#x20;is&#x20;running&#x0d;&#x0a;',40,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name&#x20;=&#x20;&quot;avgfws&quot;&#x20;',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(760,'KIS_service_status','Show&#x20;if&#x20;KIS&#x20;antivirus&#x20;is&#x20;running&#x0d;&#x0a;',41,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name&#x20;=&#x20;&quot;ksvsvc&quot;',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(761,'Serv_NTDS','Checks&#x20;if&#x20;NTDS&#x20;service&#x20;is&#x20;running',18,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name=&quot;NTDS&quot;',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(762,'Serv_DNS','Checks&#x20;if&#x20;DNS&#x20;service&#x20;is&#x20;running',34,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name=&quot;DNS&quot;',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(763,'KIS_KLBLMain_status','Show&#x20;if&#x20;KIS&#x20;antivirus&#x20;is&#x20;running&#x0d;&#x0a;',41,2,0,0,0,1,'','','Running','select&#x20;state&#x20;from&#x20;Win32_Service&#x20;where&#x20;name&#x20;=&#x20;&quot;KLBLMain&quot;',3,6,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(764,'MongoDB&#x20;Port&#x20;Check','Remote&#x20;check&#x20;of&#x20;standard&#x20;TCP&#x20;port&#x20;of&#x20;MongoDB&#x20;Server.',15,9,0,0,0,27017,'','','public','',7,2,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(765,'PostgreSQL&#x20;Remote&#x20;Port&#x20;check','Check&#x20;remote&#x20;port&#x20;on&#x20;PostgreSQL&#x20;Server.',15,9,0,0,0,5432,'','','public','',7,2,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(766,'DBSelects','Number&#x20;of&#x20;selects&#x20;on&#x20;database',42,4,0,0,300,0,'','','','',6,4,6,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','basic','{\"1\":{\"macro\":\"_field1_\",\"desc\":\"IP&#x20;address\",\"help\":\"IP&#x20;address\",\"value\":\"\"},\"2\":{\"macro\":\"_field2_\",\"desc\":\"Username\",\"help\":\"Username&#x20;to&#x20;access&#x20;to&#x20;database\",\"value\":\"\"},\"3\":{\"macro\":\"_field3_\",\"desc\":\"Password\",\"help\":\"Password&#x20;to&#x20;access&#x20;to&#x20;database\",\"value\":\"\"},\"4\":{\"macro\":\"_field4_\",\"desc\":\"Query&#x20;string\",\"help\":\"Query&#x20;string&#x20;of&#x20;global&#x20;status.&#x20;For&#x20;example&#x20;&#039;Aborted_connects&#039;&#x20;or&#x20;&#039;Innodb_rows_read&#039;\",\"value\":\"Com_select\"}}','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(767,'DBUpdates','Number&#x20;of&#x20;updates&#x20;on&#x20;database',42,4,0,0,300,0,'','','','',6,4,6,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','basic','{\"1\":{\"macro\":\"_field1_\",\"desc\":\"IP&#x20;address\",\"help\":\"IP&#x20;address\",\"value\":\"\"},\"2\":{\"macro\":\"_field2_\",\"desc\":\"Username\",\"help\":\"Username&#x20;to&#x20;access&#x20;to&#x20;database\",\"value\":\"\"},\"3\":{\"macro\":\"_field3_\",\"desc\":\"Password\",\"help\":\"Password&#x20;to&#x20;access&#x20;to&#x20;database\",\"value\":\"\"},\"4\":{\"macro\":\"_field4_\",\"desc\":\"Query&#x20;string\",\"help\":\"Query&#x20;string&#x20;of&#x20;global&#x20;status.&#x20;For&#x20;example&#x20;&#039;Aborted_connects&#039;&#x20;or&#x20;&#039;Innodb_rows_read&#039;\",\"value\":\"Com_update\"}}','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(768,'InnoDB_Rows_Read','Rows&#x20;read&#x20;on&#x20;InnoDB&#x20;engine',42,4,0,0,300,0,'','','','',6,4,6,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','basic','{\"1\":{\"macro\":\"_field1_\",\"desc\":\"IP&#x20;address\",\"help\":\"IP&#x20;address\",\"value\":\"\"},\"2\":{\"macro\":\"_field2_\",\"desc\":\"Username\",\"help\":\"Username&#x20;to&#x20;access&#x20;to&#x20;database\",\"value\":\"\"},\"3\":{\"macro\":\"_field3_\",\"desc\":\"Password\",\"help\":\"Password&#x20;to&#x20;access&#x20;to&#x20;database\",\"value\":\"\"},\"4\":{\"macro\":\"_field4_\",\"desc\":\"Query&#x20;string\",\"help\":\"Query&#x20;string&#x20;of&#x20;global&#x20;status.&#x20;For&#x20;example&#x20;&#039;Aborted_connects&#039;&#x20;or&#x20;&#039;Innodb_rows_read&#039;\",\"value\":\"Innodb_rows_read\"}}','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(769,'DB_Connections','Current&#x20;connections&#x20;on&#x20;database',42,4,0,0,300,0,'','','','',6,4,6,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','basic','{\"1\":{\"macro\":\"_field1_\",\"desc\":\"IP&#x20;address\",\"help\":\"IP&#x20;address\",\"value\":\"\"},\"2\":{\"macro\":\"_field2_\",\"desc\":\"Username\",\"help\":\"Username&#x20;to&#x20;access&#x20;to&#x20;database\",\"value\":\"\"},\"3\":{\"macro\":\"_field3_\",\"desc\":\"Password\",\"help\":\"Password&#x20;to&#x20;access&#x20;to&#x20;database\",\"value\":\"\"},\"4\":{\"macro\":\"_field4_\",\"desc\":\"Query&#x20;string\",\"help\":\"Query&#x20;string&#x20;of&#x20;global&#x20;status.&#x20;For&#x20;example&#x20;&#039;Aborted_connects&#039;&#x20;or&#x20;&#039;Innodb_rows_read&#039;\",\"value\":\"Connections\"}}','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(770,'Qcache_not_cached','Cache&#x20;hit&#x20;missing&#x20;&#40;queries&#x20;not&#x20;cached&#41;',42,4,0,0,300,0,'','','','',6,4,6,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','basic','{\"1\":{\"macro\":\"_field1_\",\"desc\":\"IP&#x20;address\",\"help\":\"IP&#x20;address\",\"value\":\"\"},\"2\":{\"macro\":\"_field2_\",\"desc\":\"Username\",\"help\":\"Username&#x20;to&#x20;access&#x20;to&#x20;database\",\"value\":\"\"},\"3\":{\"macro\":\"_field3_\",\"desc\":\"Password\",\"help\":\"Password&#x20;to&#x20;access&#x20;to&#x20;database\",\"value\":\"\"},\"4\":{\"macro\":\"_field4_\",\"desc\":\"Query&#x20;string\",\"help\":\"Query&#x20;string&#x20;of&#x20;global&#x20;status.&#x20;For&#x20;example&#x20;&#039;Aborted_connects&#039;&#x20;or&#x20;&#039;Innodb_rows_read&#039;\",\"value\":\"Qcache_not_cached\"}}','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(771,'Table_locks_waited','Table&#x20;locks&#x20;waited',42,4,0,0,300,0,'','','','',6,4,6,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','basic','{\"1\":{\"macro\":\"_field1_\",\"desc\":\"IP&#x20;address\",\"help\":\"IP&#x20;address\",\"value\":\"\"},\"2\":{\"macro\":\"_field2_\",\"desc\":\"Username\",\"help\":\"Username&#x20;to&#x20;access&#x20;to&#x20;database\",\"value\":\"\"},\"3\":{\"macro\":\"_field3_\",\"desc\":\"Password\",\"help\":\"Password&#x20;to&#x20;access&#x20;to&#x20;database\",\"value\":\"\"},\"4\":{\"macro\":\"_field4_\",\"desc\":\"Query&#x20;string\",\"help\":\"Query&#x20;string&#x20;of&#x20;global&#x20;status.&#x20;For&#x20;example&#x20;&#039;Aborted_connects&#039;&#x20;or&#x20;&#039;Innodb_rows_read&#039;\",\"value\":\"Table_locks_waited\"}}','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(772,'Slow_launch_threads','Slow&#x20;launch&#x20;threads',42,4,0,0,300,0,'','','','',6,4,6,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','basic','{\"1\":{\"macro\":\"_field1_\",\"desc\":\"IP&#x20;address\",\"help\":\"IP&#x20;address\",\"value\":\"\"},\"2\":{\"macro\":\"_field2_\",\"desc\":\"Username\",\"help\":\"Username&#x20;to&#x20;access&#x20;to&#x20;database\",\"value\":\"\"},\"3\":{\"macro\":\"_field3_\",\"desc\":\"Password\",\"help\":\"Password&#x20;to&#x20;access&#x20;to&#x20;database\",\"value\":\"\"},\"4\":{\"macro\":\"_field4_\",\"desc\":\"Query&#x20;string\",\"help\":\"Query&#x20;string&#x20;of&#x20;global&#x20;status.&#x20;For&#x20;example&#x20;&#039;Aborted_connects&#039;&#x20;or&#x20;&#039;Innodb_rows_read&#039;\",\"value\":\"Slow_launch_threads\"}}','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(773,'Qcache_hits','Queries&#x20;cached&#x20;successfully',42,4,0,0,300,0,'','','','',6,4,6,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','basic','{\"1\":{\"macro\":\"_field1_\",\"desc\":\"IP&#x20;address\",\"help\":\"IP&#x20;address\",\"value\":\"\"},\"2\":{\"macro\":\"_field2_\",\"desc\":\"Username\",\"help\":\"Username&#x20;to&#x20;access&#x20;to&#x20;database\",\"value\":\"\"},\"3\":{\"macro\":\"_field3_\",\"desc\":\"Password\",\"help\":\"Password&#x20;to&#x20;access&#x20;to&#x20;database\",\"value\":\"\"},\"4\":{\"macro\":\"_field4_\",\"desc\":\"Query&#x20;string\",\"help\":\"Query&#x20;string&#x20;of&#x20;global&#x20;status.&#x20;For&#x20;example&#x20;&#039;Aborted_connects&#039;&#x20;or&#x20;&#039;Innodb_rows_read&#039;\",\"value\":\"Qcache_hits\"}}','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(774,'Innodb_data_pending_reads','InnoDB&#x20;engine&#x20;pending&#x20;reads',42,4,0,0,300,0,'','','','',6,4,6,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','basic','{\"1\":{\"macro\":\"_field1_\",\"desc\":\"IP&#x20;address\",\"help\":\"IP&#x20;address\",\"value\":\"\"},\"2\":{\"macro\":\"_field2_\",\"desc\":\"Username\",\"help\":\"Username&#x20;to&#x20;access&#x20;to&#x20;database\",\"value\":\"\"},\"3\":{\"macro\":\"_field3_\",\"desc\":\"Password\",\"help\":\"Password&#x20;to&#x20;access&#x20;to&#x20;database\",\"value\":\"\"},\"4\":{\"macro\":\"_field4_\",\"desc\":\"Query&#x20;string\",\"help\":\"Query&#x20;string&#x20;of&#x20;global&#x20;status.&#x20;For&#x20;example&#x20;&#039;Aborted_connects&#039;&#x20;or&#x20;&#039;Innodb_rows_read&#039;\",\"value\":\"Innodb_data_pending_reads\"}}','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(775,'Aborted_connects','Aborted&#x20;connection&#x20;attempts',42,4,0,0,300,0,'','','','',6,4,6,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','basic','{\"1\":{\"macro\":\"_field1_\",\"desc\":\"IP&#x20;address\",\"help\":\"IP&#x20;address\",\"value\":\"\"},\"2\":{\"macro\":\"_field2_\",\"desc\":\"Username\",\"help\":\"Username&#x20;to&#x20;access&#x20;to&#x20;database\",\"value\":\"\"},\"3\":{\"macro\":\"_field3_\",\"desc\":\"Password\",\"help\":\"Password&#x20;to&#x20;access&#x20;to&#x20;database\",\"value\":\"\"},\"4\":{\"macro\":\"_field4_\",\"desc\":\"Query&#x20;string\",\"help\":\"Query&#x20;string&#x20;of&#x20;global&#x20;status.&#x20;For&#x20;example&#x20;&#039;Aborted_connects&#039;&#x20;or&#x20;&#039;Innodb_rows_read&#039;\",\"value\":\"Aborted_connects\"}}','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(776,'Bytes_received','Bytes&#x20;received&#x20;by&#x20;database&#x20;&#40;global&#41;',42,4,0,0,300,0,'','','','',6,4,6,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','basic','{\"1\":{\"macro\":\"_field1_\",\"desc\":\"IP&#x20;address\",\"help\":\"IP&#x20;address\",\"value\":\"\"},\"2\":{\"macro\":\"_field2_\",\"desc\":\"Username\",\"help\":\"Username&#x20;to&#x20;access&#x20;to&#x20;database\",\"value\":\"\"},\"3\":{\"macro\":\"_field3_\",\"desc\":\"Password\",\"help\":\"Password&#x20;to&#x20;access&#x20;to&#x20;database\",\"value\":\"\"},\"4\":{\"macro\":\"_field4_\",\"desc\":\"Query&#x20;string\",\"help\":\"Query&#x20;string&#x20;of&#x20;global&#x20;status.&#x20;For&#x20;example&#x20;&#039;Aborted_connects&#039;&#x20;or&#x20;&#039;Innodb_rows_read&#039;\",\"value\":\"Bytes_received\"}}','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(777,'Bytes_sent','Bytes_sent&#x20;by&#x20;database&#x20;&#40;global&#41;',42,4,0,0,300,0,'','','','',6,4,6,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','basic','{\"1\":{\"macro\":\"_field1_\",\"desc\":\"IP&#x20;address\",\"help\":\"IP&#x20;address\",\"value\":\"\"},\"2\":{\"macro\":\"_field2_\",\"desc\":\"Username\",\"help\":\"Username&#x20;to&#x20;access&#x20;to&#x20;database\",\"value\":\"\"},\"3\":{\"macro\":\"_field3_\",\"desc\":\"Password\",\"help\":\"Password&#x20;to&#x20;access&#x20;to&#x20;database\",\"value\":\"\"},\"4\":{\"macro\":\"_field4_\",\"desc\":\"Query&#x20;string\",\"help\":\"Query&#x20;string&#x20;of&#x20;global&#x20;status.&#x20;For&#x20;example&#x20;&#039;Aborted_connects&#039;&#x20;or&#x20;&#039;Innodb_rows_read&#039;\",\"value\":\"Bytes_sent\"}}','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(778,'MySQL_Updates','Updates&#x20;per&#x20;second',42,4,0,0,300,0,'','','','',6,4,6,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','basic','{\"1\":{\"macro\":\"_field1_\",\"desc\":\"IP&#x20;address\",\"help\":\"IP&#x20;address\",\"value\":\"\"},\"2\":{\"macro\":\"_field2_\",\"desc\":\"Username\",\"help\":\"Username&#x20;to&#x20;access&#x20;to&#x20;database\",\"value\":\"\"},\"3\":{\"macro\":\"_field3_\",\"desc\":\"Password\",\"help\":\"Password&#x20;to&#x20;access&#x20;to&#x20;database\",\"value\":\"\"},\"4\":{\"macro\":\"_field4_\",\"desc\":\"Query&#x20;string\",\"help\":\"Query&#x20;string&#x20;of&#x20;global&#x20;status.&#x20;For&#x20;example&#x20;&#039;Aborted_connects&#039;&#x20;or&#x20;&#039;Innodb_rows_read&#039;\",\"value\":\"Com_update\"}}','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(779,'MySQL_Deletes','Deletes&#x20;per&#x20;second',42,4,0,0,300,0,'','','','',6,4,6,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','basic','{\"1\":{\"macro\":\"_field1_\",\"desc\":\"IP&#x20;address\",\"help\":\"IP&#x20;address\",\"value\":\"\"},\"2\":{\"macro\":\"_field2_\",\"desc\":\"Username\",\"help\":\"Username&#x20;to&#x20;access&#x20;to&#x20;database\",\"value\":\"\"},\"3\":{\"macro\":\"_field3_\",\"desc\":\"Password\",\"help\":\"Password&#x20;to&#x20;access&#x20;to&#x20;database\",\"value\":\"\"},\"4\":{\"macro\":\"_field4_\",\"desc\":\"Query&#x20;string\",\"help\":\"Query&#x20;string&#x20;of&#x20;global&#x20;status.&#x20;For&#x20;example&#x20;&#039;Aborted_connects&#039;&#x20;or&#x20;&#039;Innodb_rows_read&#039;\",\"value\":\"Com_delete\"}}','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(780,'MySQL&#x20;Port','Check&#x20;MySql&#x20;Port',42,9,0,0,300,3306,'','','public','',2,2,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(781,'Check&#x20;Oracle&#x20;Listener&#x20;Port','Check&#x20;Oracle&#x20;Listener&#x20;Port',28,9,0,0,300,1521,'','','public','',2,2,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(782,'Check_MSSQLServer_Port','Check&#x20;port&#x20;MSSQL&#x20;Server',27,9,0,0,300,1433,'','','public','',2,2,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(783,'Check&#x20;Informix&#x20;Port','',19,9,0,0,300,1526,'','','public','',2,2,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(784,'Check&#x20;port&#x20;DB2','',49,9,0,0,300,50000,'','','public','',2,2,0,'','','',0,0,1,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,NULL,'basic',NULL,'','','',0,0,0,'','','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(785,'Packet&#x20;Loss','Measure&#x20;packet&#x20;loss&#x20;in&#x20;the&#x20;network,&#x20;using&#x20;a&#x20;flood&#x20;ping&#x20;&#40;50&#x20;ping&#x20;in&#x20;8&#x20;secons&#41;&#x20;and&#x20;counting&#x20;back&#x20;missing&#x20;packets.&#x20;It&#x20;should&#x20;be&#x20;zero&#x20;on&#x20;most&#x20;cases.&#x20;',10,1,0,0,300,0,'','','','',2,4,9,'','','',0,0,1,10.00,0.00,'',30.00,0.00,'',0,'','','',0,0,0.000000000000000,'%','nowizard','{\"1\":{\"macro\":\"_field1_\",\"desc\":\"Test&#x20;time\",\"help\":\"\",\"value\":\"8\",\"hide\":\"\"},\"2\":{\"macro\":\"_field2_\",\"desc\":\"Target&#x20;IP\",\"help\":\"\",\"value\":\"\",\"hide\":\"\"}}','You&#x20;should&#x20;check&#x20;manually&#x20;the&#x20;packet&#x20;loss&#x20;of&#x20;the&#x20;network&#x20;with&#x20;a&#x20;flood&#x20;ping&#x20;on&#x20;targeted&#x20;host&#x20;&#40;ping&#x20;-c&#x20;100&#x20;-f&#x20;xxxx&#41;.&#x20;Aditionally,&#x20;and&#x20;due&#x20;the&#x20;major&#x20;packet&#x20;loss,&#x20;probably&#x20;you&#x20;can&#x20;see&#x20;a&#x20;simple&#x20;ping&#x20;failing&#x20;here.&#x20;Check&#x20;your&#x20;network&#x20;equipment.','You&#x20;should&#x20;check&#x20;manually&#x20;the&#x20;packet&#x20;loss&#x20;of&#x20;the&#x20;network&#x20;with&#x20;a&#x20;flood&#x20;ping&#x20;on&#x20;targeted&#x20;host&#x20;&#40;ping&#x20;-c&#x20;100&#x20;-f&#x20;xxxx&#41;','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(786,'N.&#x20;total&#x20;processes','Number&#x20;of&#x20;running&#x20;processes&#x20;in&#x20;a&#x20;Windows&#x20;system.',11,34,0,0,300,0,'tasklist&#x20;/NH&#x20;|&#x20;find&#x20;/c&#x20;/v&#x20;&quot;&quot;','','','',6,2,0,'','','',0,0,1,0.00,0.00,'0.00',0.00,0.00,'',0,'','0','0',0,0,0.000000000000000,'','','','nowizard','0','',0,0,0,'0','0','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(787,'Free&#x20;space&#x20;in&#x20;C:','Free&#x20;space&#x20;available&#x20;in&#x20;C:',11,34,0,0,300,0,'powershell&#x20;$obj=&#40;Get-WmiObject&#x20;-class&#x20;&quot;Win32_LogicalDisk&quot;&#x20;-namespace&#x20;&quot;root&#92;CIMV2&quot;&#41;&#x20;;&#x20;$obj.FreeSpace[0]&#x20;*&#x20;100&#x20;/$obj.Size[0]','','','',4,2,0,'','','',0,0,1,0.00,0.00,'0.00',0.00,0.00,'',0,'','0','0',0,0,0.000000000000000,'','','','nowizard','0','',0,0,0,'0','0','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(788,'Linux&#x20;uptime','System&#x20;uptime',43,36,0,0,300,0,'uptime&#x20;|sed&#x20;s/us&#92;.*$//g&#x20;|&#x20;sed&#x20;s/,&#92;.*$//g','','','',4,2,0,'','','',0,0,1,0.00,0.00,'0.00',0.00,0.00,'',0,'','0','0',0,0,0.000000000000000,'','','','nowizard','0','',0,0,0,'0','0','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(789,'Linux&#x20;processes','Running&#x20;processes',43,34,0,0,300,0,'ps&#x20;elf&#x20;|&#x20;wc&#x20;-l','','','',6,2,0,'','','',0,0,1,0.00,0.00,'0.00',0.00,0.00,'',0,'','0','0',0,0,0.000000000000000,'','','','nowizard','0','',0,0,0,'0','0','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(790,'Linux&#x20;system&#x20;load','Current&#x20;load&#x20;&#40;5&#x20;min&#41;',43,34,0,0,300,0,'uptime&#x20;|&#x20;awk&#x20;&#039;{print&#x20;$&#40;NF-1&#41;}&#039;&#x20;|&#x20;tr&#x20;-d&#x20;&#039;,&#039;','','','',6,2,0,'','','',0,0,1,0.00,0.00,'0.00',0.00,0.00,'',0,'','0','0',0,0,0.000000000000000,'','','','nowizard','0','',0,0,0,'0','0','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(791,'Linux&#x20;available&#x20;memory&#x20;percent','Available&#x20;memory&#x20;%',43,34,0,0,300,0,'free&#x20;|&#x20;grep&#x20;Mem&#x20;|&#x20;awk&#x20;&#039;{print&#x20;$NF/$2&#x20;*&#x20;100}&#039;','','','',4,2,0,'','','',0,0,1,0.00,0.00,'0.00',0.00,0.00,'',0,'','0','0',0,0,0.000000000000000,'','','','nowizard','0','',0,0,0,'0','0','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(792,'Linux&#x20;available&#x20;disk&#x20;/','Available&#x20;free&#x20;space&#x20;in&#x20;mountpoint&#x20;/',43,34,0,0,300,0,'df&#x20;/&#x20;|&#x20;tail&#x20;-n&#x20;+2&#x20;|&#x20;awk&#x20;&#039;{print&#x20;$&#40;NF-1&#41;}&#039;&#x20;|&#x20;tr&#x20;-d&#x20;&#039;%&#039;','','','',4,2,0,'','','',0,0,1,0.00,0.00,'0.00',0.00,0.00,'',0,'','0','0',0,0,0.000000000000000,'','','0','nowizard','0','nowizard',0,0,0,'0','0','',0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'','',0,'','','','','',1),(793,'CPU&#x20;User&#x20;&#40;%&#41;','The&#x20;percentage&#x20;of&#x20;CPU&#x20;time&#x20;spent&#x20;processing&#x20;user-level&#x20;code,&#x20;calculated&#x20;over&#x20;the&#x20;last&#x20;minute',51,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,80.00,90.00,'',90.00,0.00,'',0,'','','',0,0,0.000000000000000,'%','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','general_snmp',1,1,'1.3.6.1.4.1.2021.11.9.0','',1,'','','','','',1),(794,'CPU&#x20;System&#x20;&#40;%&#41;','The&#x20;percentage&#x20;of&#x20;CPU&#x20;time&#x20;spent&#x20;processing&#x20;system-level&#x20;code,&#x20;calculated&#x20;over&#x20;the&#x20;last&#x20;minute',51,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,80.00,90.00,'',90.00,0.00,'',0,'','','',0,0,0.000000000000000,'%','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','general_snmp',1,1,'1.3.6.1.4.1.2021.11.10.0','',1,'','','','','',1),(795,'CPU&#x20;Idle&#x20;&#40;%&#41;','The&#x20;percentage&#x20;of&#x20;CPU&#x20;time&#x20;spent&#x20;idle,&#x20;calculated&#x20;over&#x20;the&#x20;last&#x20;minute',51,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'%','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','general_snmp',1,1,'1.3.6.1.4.1.2021.11.11.0','',0,'','','','','',1),(796,'Load&#x20;average&#x20;-&#x20;_nameOID_','The&#x20;1,&#x20;5&#x20;or&#x20;15&#x20;minutes&#x20;load&#x20;average',51,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','general_snmp',1,2,'1.3.6.1.4.1.2021.10.1.3','',0,'1.3.6.1.4.1.2021.10.1.2','','','','',1),(797,'Cisco&#x20;CPU&#x20;_nameOID_&#x20;usage&#x20;&#40;%&#41;','The&#x20;overall&#x20;CPU&#x20;busy&#x20;percentage&#x20;in&#x20;the&#x20;last&#x20;5&#x20;minute&#x20;period',51,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,80.00,90.00,'',90.00,0.00,'',0,'','','',0,0,0.000000000000000,'%','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','cisco',1,2,'1.3.6.1.4.1.9.9.109.1.1.1.1.8','',1,'1.3.6.1.4.1.9.9.109.1.1.1.1.2','','','','',1),(798,'F5&#x20;CPU&#x20;_nameOID_&#x20;usage&#x20;&#40;%&#41;','This&#x20;is&#x20;average&#x20;usage&#x20;ratio&#x20;of&#x20;CPU&#x20;for&#x20;the&#x20;associated&#x20;host&#x20;in&#x20;the&#x20;last&#x20;five&#x20;minutes',51,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,80.00,90.00,'',90.00,0.00,'',0,'','','',0,0,0.000000000000000,'%','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','f5',1,2,'1.3.6.1.4.1.3375.2.1.7.5.2.1.35','',1,'1.3.6.1.4.1.3375.2.1.7.5.2.1.3','','','','',1),(799,'Juniper&#x20;_nameOID_&#x20;CPU&#x20;usage&#x20;&#40;%&#41;','The&#x20;average&#x20;usage&#x20;ratio&#x20;of&#x20;CPU&#x20;in&#x20;the&#x20;last&#x20;five&#x20;minutes',51,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,80.00,90.00,'',90.00,0.00,'',0,'','','',0,0,0.000000000000000,'%','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','juniper',1,2,'1.3.6.1.4.1.2636.3.1.13.1.21','',1,'1.3.6.1.4.1.2636.3.1.13.1.5','','','','',1),(800,'HP&#x20;CPU&#x20;usage&#x20;&#40;%&#41;','The&#x20;CPU&#x20;utilization&#x20;in&#x20;percent&#40;%&#41;',51,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,80.00,90.00,'',90.00,0.00,'',0,'','','',0,0,0.000000000000000,'%','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','hp',1,1,'1.3.6.1.4.1.11.2.14.11.5.1.9.6.1.0','',1,'','','','','',1),(801,'Fortinet&#x20;system&#x20;CPU&#x20;usage&#x20;&#40;%&#41;','CPU&#x20;usage&#x20;of&#x20;the&#x20;system',51,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'%','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','fortinet',1,1,'1.3.6.1.4.1.12356.101.4.1.3.0','',1,'','','','','',1),(802,'Fortinet&#x20;virtual&#x20;domain&#x20;_nameOID_&#x20;CPU&#x20;usage&#x20;&#40;%&#41;','CPU&#x20;usage&#x20;of&#x20;the&#x20;virtual&#x20;domain',51,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'%','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','fortinet',1,2,'1.3.6.1.4.1.12356.101.3.2.1.1.5','',1,'1.3.6.1.4.1.12356.101.3.2.1.1.2','','','','',1),(803,'WMI&#x20;_DeviceID_&#x20;usage&#x20;&#40;%&#41;','Load&#x20;capacity&#x20;of&#x20;each&#x20;processor,&#x20;averaged&#x20;to&#x20;the&#x20;last&#x20;second',51,1,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,80.00,90.00,'',90.00,0.00,'',0,'','','',0,0,0.000000000000000,'%','nowizard','{\"extra_field_1\":\"LoadPercentage\",\"satellite_execution\":\"\",\"value_operation\":\"\",\"server_plugin\":\"\",\"_field11__wmi_field\":\"_field11_\",\"_field12__wmi_field\":\"_field12_\",\"_field9__wmi_field\":\"_field9_\",\"_field10__wmi_field\":\"_field10_\",\"_field7__wmi_field\":\"_field7_\",\"_field8__wmi_field\":\"_field8_\",\"_field5__wmi_field\":\"_field5_\",\"_field6__wmi_field\":\"_field6_\",\"_field3__wmi_field\":\"_field3_\",\"_field4__wmi_field\":\"_field4_\",\"_field1__wmi_field\":\"_field1_\",\"_field2__wmi_field\":\"_field2_\",\"field0_wmi_field\":\"\"}','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'wmi','',1,2,'','',1,'','Win32_Processor','DeviceID','','{\"scan\":\"\",\"execution\":\"DeviceID&#x20;=&#x20;&#039;_DeviceID_&#039;\",\"field\":\"1\",\"key_string\":\"\"}',1),(804,'Total&#x20;RAM&#x20;used&#x20;&#40;%&#41;','Total&#x20;real/physical&#x20;memory&#x20;used&#x20;on&#x20;the&#x20;host',52,1,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,80.00,90.00,'',90.00,0.00,'',0,'','','',0,0,0.000000000000000,'%','nowizard','{\"extra_field_1\":\"1.3.6.1.4.1.2021.4.6.0\",\"extra_field_2\":\"1.3.6.1.4.1.2021.4.5.0\",\"satellite_execution\":\"/etc/pandora/satellite_plugins/wizard_snmp_module&#x20;-host&#x20;&quot;_address_&quot;&#x20;-port&#x20;&quot;_port_&quot;&#x20;-version&#x20;&quot;_version_&quot;&#x20;-community&#x20;&quot;_community_&quot;&#x20;-secLevel&#x20;&quot;_sec_level_&quot;&#x20;-user&#x20;&quot;_auth_user_&quot;&#x20;-authMethod&#x20;&quot;_auth_method_&quot;&#x20;-authPass&#x20;&quot;_auth_pass_&quot;&#x20;-privMethod&#x20;&quot;_priv_method_&quot;&#x20;-privPass&#x20;&quot;_priv_pass_&quot;&#x20;-oidList&#x20;&quot;_oid_1_,_oid_2_&quot;&#x20;-operation&#x20;&quot;&#40;_o1_&#x20;*&#x20;100&#41;&#x20;/&#x20;_o2_&quot;\",\"value_operation\":\"&#40;_oid_1_&#x20;*&#x20;100&#41;&#x20;/&#x20;_oid_2_\",\"server_plugin\":\"10\",\"_field2__snmp_field\":\"_port_\",\"_field1__snmp_field\":\"_address_\",\"_field4__snmp_field\":\"_community_\",\"_field3__snmp_field\":\"_version_\",\"_field6__snmp_field\":\"_auth_user_\",\"_field5__snmp_field\":\"_sec_level_\",\"_field8__snmp_field\":\"_auth_pass_\",\"_field7__snmp_field\":\"_auth_method_\",\"_field10__snmp_field\":\"_priv_pass_\",\"_field9__snmp_field\":\"_priv_method_\",\"_field12__snmp_field\":\"&#40;_o1_&#x20;*&#x20;100&#41;&#x20;/&#x20;_o2_\",\"_field11__snmp_field\":\"_oid_1_,_oid_2_\",\"field0_snmp_field\":\"\"}','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','general_snmp',2,1,'','',1,'','','','','',1),(805,'F5&#x20;host&#x20;RAM&#x20;used&#x20;&#40;%&#41;','The&#x20;host&#x20;memory&#x20;percentage&#x20;currently&#x20;in&#x20;use',52,1,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,80.00,90.00,'',90.00,0.00,'',0,'','','',0,0,0.000000000000000,'%','nowizard','{\"extra_field_1\":\"1.3.6.1.4.1.3375.2.1.7.1.2.0\",\"extra_field_2\":\"1.3.6.1.4.1.3375.2.1.7.1.1.0\",\"satellite_execution\":\"/etc/pandora/satellite_plugins/wizard_snmp_module&#x20;-host&#x20;&quot;_address_&quot;&#x20;-port&#x20;&quot;_port_&quot;&#x20;-version&#x20;&quot;_version_&quot;&#x20;-community&#x20;&quot;_community_&quot;&#x20;-secLevel&#x20;&quot;_sec_level_&quot;&#x20;-user&#x20;&quot;_auth_user_&quot;&#x20;-authMethod&#x20;&quot;_auth_method_&quot;&#x20;-authPass&#x20;&quot;_auth_pass_&quot;&#x20;-privMethod&#x20;&quot;_priv_method_&quot;&#x20;-privPass&#x20;&quot;_priv_pass_&quot;&#x20;-oidList&#x20;&quot;_oid_1_,_oid_2_&quot;&#x20;-operation&#x20;&quot;&#40;_o1_&#x20;*&#x20;100&#41;&#x20;/&#x20;_o2_&quot;\",\"value_operation\":\"&#40;_oid_1_&#x20;*&#x20;100&#41;&#x20;/&#x20;_oid_2_\",\"server_plugin\":\"10\",\"_field11__snmp_field\":\"_oid_1_,_oid_2_\",\"_field12__snmp_field\":\"(_o1_ * 100) / _o2_\",\"_field9__snmp_field\":\"_priv_method_\",\"_field10__snmp_field\":\"_priv_pass_\",\"_field7__snmp_field\":\"_auth_method_\",\"_field8__snmp_field\":\"_auth_pass_\",\"_field5__snmp_field\":\"_sec_level_\",\"_field6__snmp_field\":\"_auth_user_\",\"_field3__snmp_field\":\"_version_\",\"_field4__snmp_field\":\"_community_\",\"_field1__snmp_field\":\"_address_\",\"_field2__snmp_field\":\"_port_\",\"field0_snmp_field\":\"\"}','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','f5',2,1,'','',1,'','','','','',1),(806,'F5&#x20;Host&#x20;_nameOID_&#x20;RAM&#x20;used&#x20;&#40;%&#41;','The&#x20;host&#x20;memory&#x20;percentage&#x20;currently&#x20;in&#x20;use&#x20;for&#x20;the&#x20;specified&#x20;host',52,1,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,80.00,90.00,'',90.00,0.00,'',0,'','','',0,0,0.000000000000000,'%','nowizard','{\"extra_field_1\":\"1.3.6.1.4.1.3375.2.1.7.4.2.1.3\",\"extra_field_2\":\"1.3.6.1.4.1.3375.2.1.7.4.2.1.2\",\"satellite_execution\":\"/etc/pandora/satellite_plugins/wizard_snmp_module&#x20;-host&#x20;&quot;_address_&quot;&#x20;-port&#x20;&quot;_port_&quot;&#x20;-version&#x20;&quot;_version_&quot;&#x20;-community&#x20;&quot;_community_&quot;&#x20;-secLevel&#x20;&quot;_sec_level_&quot;&#x20;-user&#x20;&quot;_auth_user_&quot;&#x20;-authMethod&#x20;&quot;_auth_method_&quot;&#x20;-authPass&#x20;&quot;_auth_pass_&quot;&#x20;-privMethod&#x20;&quot;_priv_method_&quot;&#x20;-privPass&#x20;&quot;_priv_pass_&quot;&#x20;-oidList&#x20;&quot;_oid_1_,_oid_2_&quot;&#x20;-operation&#x20;&quot;&#40;_o1_&#x20;*&#x20;100&#41;&#x20;/&#x20;_o2_&quot;\",\"value_operation\":\"&#40;_oid_1_&#x20;*&#x20;100&#41;&#x20;/&#x20;_oid_2_\",\"server_plugin\":\"10\",\"_field11__snmp_field\":\"_oid_1_,_oid_2_\",\"_field12__snmp_field\":\"(_o1_ * 100) / _o2_\",\"_field9__snmp_field\":\"_priv_method_\",\"_field10__snmp_field\":\"_priv_pass_\",\"_field7__snmp_field\":\"_auth_method_\",\"_field8__snmp_field\":\"_auth_pass_\",\"_field5__snmp_field\":\"_sec_level_\",\"_field6__snmp_field\":\"_auth_user_\",\"_field3__snmp_field\":\"_version_\",\"_field4__snmp_field\":\"_community_\",\"_field1__snmp_field\":\"_address_\",\"_field2__snmp_field\":\"_port_\",\"field0_snmp_field\":\"\"}','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','f5',2,2,'','',1,'1.3.6.1.4.1.3375.2.1.7.4.2.1.1','','','','',1),(807,'Fortinet&#x20;system&#x20;RAM&#x20;usage&#x20;&#40;%&#41;','Memory&#x20;usage&#x20;of&#x20;the&#x20;system',52,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,80.00,90.00,'',90.00,0.00,'',0,'','','',0,0,0.000000000000000,'%','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','fortinet',1,1,'1.3.6.1.4.1.12356.101.4.1.4.0','',1,'','','','','',1),(808,'Fortinet&#x20;virtual&#x20;domain&#x20;_nameOID_&#x20;RAM&#x20;usage&#x20;&#40;%&#41;','Memory&#x20;usage&#x20;of&#x20;the&#x20;virtual&#x20;domain',52,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,80.00,90.00,'',90.00,0.00,'',0,'','','',0,0,0.000000000000000,'%','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','fortinet',1,2,'1.3.6.1.4.1.12356.101.3.2.1.1.6','',1,'1.3.6.1.4.1.12356.101.3.2.1.1.2','','','','',1),(809,'WMI&#x20;total&#x20;RAM&#x20;used&#x20;&#40;%&#41;','Percentage&#x20;of&#x20;physical&#x20;memory&#x20;currently&#x20;used',52,1,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,80.00,90.00,'',90.00,0.00,'',0,'','','',0,0,0.000000000000000,'%','nowizard','{\"extra_field_1\":\"TotalVisibleMemorySize\",\"satellite_execution\":\"/etc/pandora/satellite_plugins/wizard_wmi_module&#x20;-host&#x20;&quot;_address_&quot;&#x20;-namespace&#x20;&quot;_namespace_wmi_&quot;&#x20;-user&#x20;&quot;_user_wmi_&quot;&#x20;-pass&#x20;&quot;_pass_wmi_&quot;&#x20;-wmiClass&#x20;&quot;_class_wmi_&quot;&#x20;-fieldsList&#x20;&quot;_field_wmi_0_,_field_wmi_1_&quot;&#x20;-queryFilter&#x20;&quot;&quot;&#x20;-operation&#x20;&quot;&#40;&#40;_f2_&#x20;-&#x20;_f1_&#41;&#x20;*&#x20;100&#41;&#x20;/&#x20;_f2_&quot;&#x20;-wmicPath&#x20;/usr/bin/wmic\",\"value_operation\":\"&#40;&#40;_TotalVisibleMemorySize_&#x20;-&#x20;_FreePhysicalMemory_&#41;&#x20;*&#x20;100&#41;&#x20;/&#x20;_TotalVisibleMemorySize_\",\"server_plugin\":\"12\",\"_field2__wmi_field\":\"_namespace_wmi_\",\"_field1__wmi_field\":\"_address_\",\"_field4__wmi_field\":\"_pass_wmi_\",\"_field3__wmi_field\":\"_user_wmi_\",\"_field6__wmi_field\":\"_field_wmi_0_,_field_wmi_1_\",\"_field5__wmi_field\":\"_class_wmi_\",\"_field8__wmi_field\":\"&#40;&#40;_f2_&#x20;-&#x20;_f1_&#41;&#x20;*&#x20;100&#41;&#x20;/&#x20;_f2_\",\"_field7__wmi_field\":\"\",\"field0_wmi_field\":\"\"}','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'wmi','',2,1,'','',1,'','Win32_OperatingSystem','FreePhysicalMemory','','{\"scan\":\"\",\"execution\":\"\",\"field\":\"\",\"key_string\":\"\"}',1),(810,'Total&#x20;Swap&#x20;used&#x20;&#40;%&#41;','Total&#x20;swap&#x20;memory&#x20;used&#x20;on&#x20;the&#x20;host',52,1,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,80.00,90.00,'',90.00,0.00,'',0,'','','',0,0,0.000000000000000,'%','nowizard','{\"extra_field_1\":\"1.3.6.1.4.1.2021.4.4.0\",\"extra_field_2\":\"1.3.6.1.4.1.2021.4.3.0\",\"satellite_execution\":\"/etc/pandora/satellite_plugins/wizard_snmp_module&#x20;-host&#x20;&quot;_address_&quot;&#x20;-port&#x20;&quot;_port_&quot;&#x20;-version&#x20;&quot;_version_&quot;&#x20;-community&#x20;&quot;_community_&quot;&#x20;-secLevel&#x20;&quot;_sec_level_&quot;&#x20;-user&#x20;&quot;_auth_user_&quot;&#x20;-authMethod&#x20;&quot;_auth_method_&quot;&#x20;-authPass&#x20;&quot;_auth_pass_&quot;&#x20;-privMethod&#x20;&quot;_priv_method_&quot;&#x20;-privPass&#x20;&quot;_priv_pass_&quot;&#x20;-oidList&#x20;&quot;_oid_1_,_oid_2_&quot;&#x20;-operation&#x20;&quot;&#40;_o1_&#x20;*&#x20;100&#41;&#x20;/&#x20;_o2_&quot;\",\"value_operation\":\"&#40;_oid_1_&#x20;*&#x20;100&#41;&#x20;/&#x20;_oid_2_\",\"server_plugin\":\"10\",\"_field11__snmp_field\":\"_oid_1_,_oid_2_\",\"_field12__snmp_field\":\"(_o1_ * 100) / _o2_\",\"_field9__snmp_field\":\"_priv_method_\",\"_field10__snmp_field\":\"_priv_pass_\",\"_field7__snmp_field\":\"_auth_method_\",\"_field8__snmp_field\":\"_auth_pass_\",\"_field5__snmp_field\":\"_sec_level_\",\"_field6__snmp_field\":\"_auth_user_\",\"_field3__snmp_field\":\"_version_\",\"_field4__snmp_field\":\"_community_\",\"_field1__snmp_field\":\"_address_\",\"_field2__snmp_field\":\"_port_\",\"field0_snmp_field\":\"\"}','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','general_snmp',2,1,'','',1,'','','','','',1),(811,'Cisco&#x20;memory&#x20;pool&#x20;_nameOID_&#x20;usage&#x20;&#40;%&#41;','Indicates&#x20;the&#x20;percentage&#x20;of&#x20;bytes&#x20;from&#x20;the&#x20;memory&#x20;pool&#x20;that&#x20;are&#x20;currently&#x20;in&#x20;use&#x20;by&#x20;applications&#x20;on&#x20;the&#x20;managed&#x20;device',52,1,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'%','nowizard','{\"extra_field_1\":\"1.3.6.1.4.1.9.9.48.1.1.1.5\",\"extra_field_2\":\"1.3.6.1.4.1.9.9.48.1.1.1.6\",\"satellite_execution\":\"/etc/pandora/satellite_plugins/wizard_snmp_module&#x20;-host&#x20;&quot;_address_&quot;&#x20;-port&#x20;&quot;_port_&quot;&#x20;-version&#x20;&quot;_version_&quot;&#x20;-community&#x20;&quot;_community_&quot;&#x20;-secLevel&#x20;&quot;_sec_level_&quot;&#x20;-user&#x20;&quot;_auth_user_&quot;&#x20;-authMethod&#x20;&quot;_auth_method_&quot;&#x20;-authPass&#x20;&quot;_auth_pass_&quot;&#x20;-privMethod&#x20;&quot;_priv_method_&quot;&#x20;-privPass&#x20;&quot;_priv_pass_&quot;&#x20;-oidList&#x20;&quot;_oid_1_,_oid_2_&quot;&#x20;-operation&#x20;&quot;&#40;_o1_&#x20;*&#x20;100&#41;&#x20;/&#x20;&#40;_o1_&#x20;+&#x20;_o2_&#41;&quot;\",\"value_operation\":\"&#40;_oid_1_&#x20;*&#x20;100&#41;&#x20;/&#x20;&#40;_oid_1_&#x20;+&#x20;_oid_2_&#41;\",\"server_plugin\":\"10\",\"_field11__snmp_field\":\"_oid_1_,_oid_2_\",\"_field12__snmp_field\":\"(_o1_ * 100) / (_o1_ + _o2_)\",\"_field9__snmp_field\":\"_priv_method_\",\"_field10__snmp_field\":\"_priv_pass_\",\"_field7__snmp_field\":\"_auth_method_\",\"_field8__snmp_field\":\"_auth_pass_\",\"_field5__snmp_field\":\"_sec_level_\",\"_field6__snmp_field\":\"_auth_user_\",\"_field3__snmp_field\":\"_version_\",\"_field4__snmp_field\":\"_community_\",\"_field1__snmp_field\":\"_address_\",\"_field2__snmp_field\":\"_port_\",\"field0_snmp_field\":\"\"}','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','cisco',2,2,'','',1,'1.3.6.1.4.1.9.9.48.1.1.1.2','','','','',1),(812,'Juniper&#x20;_nameOID_&#x20;memory&#x20;usage&#x20;&#40;%&#41;','The&#x20;buffer&#x20;pool&#x20;utilization&#x20;in&#x20;percentage&#x20;of&#x20;this&#x20;subject',52,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,80.00,90.00,'',90.00,0.00,'',0,'','','',0,0,0.000000000000000,'%','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','juniper',1,2,'1.3.6.1.4.1.2636.3.1.13.1.11','',1,'1.3.6.1.4.1.2636.3.1.13.1.5','','','','',1),(813,'HP&#x20;memory&#x20;slot&#x20;_nameOID_&#x20;usage&#x20;&#40;%&#41;','The&#x20;percentage&#x20;of&#x20;currently&#x20;allocated&#x20;bytes',52,1,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,80.00,90.00,'',90.00,0.00,'',0,'','','',0,0,0.000000000000000,'%','nowizard','{\"extra_field_1\":\"1.3.6.1.4.1.11.2.14.11.5.1.1.2.1.1.1.7\",\"extra_field_2\":\"1.3.6.1.4.1.11.2.14.11.5.1.1.2.1.1.1.5\",\"satellite_execution\":\"/etc/pandora/satellite_plugins/wizard_snmp_module&#x20;-host&#x20;&quot;_address_&quot;&#x20;-port&#x20;&quot;_port_&quot;&#x20;-version&#x20;&quot;_version_&quot;&#x20;-community&#x20;&quot;_community_&quot;&#x20;-secLevel&#x20;&quot;_sec_level_&quot;&#x20;-user&#x20;&quot;_auth_user_&quot;&#x20;-authMethod&#x20;&quot;_auth_method_&quot;&#x20;-authPass&#x20;&quot;_auth_pass_&quot;&#x20;-privMethod&#x20;&quot;_priv_method_&quot;&#x20;-privPass&#x20;&quot;_priv_pass_&quot;&#x20;-oidList&#x20;&quot;_oid_1_,_oid_2_&quot;&#x20;-operation&#x20;&quot;&#40;_o1_&#x20;*&#x20;100&#41;&#x20;/&#x20;_o2_&quot;\",\"value_operation\":\"&#40;_oid_1_&#x20;*&#x20;100&#41;&#x20;/&#x20;_oid_2_\",\"server_plugin\":\"10\",\"_field11__snmp_field\":\"_oid_1_,_oid_2_\",\"_field12__snmp_field\":\"(_o1_ * 100) / _o2_\",\"_field9__snmp_field\":\"_priv_method_\",\"_field10__snmp_field\":\"_priv_pass_\",\"_field7__snmp_field\":\"_auth_method_\",\"_field8__snmp_field\":\"_auth_pass_\",\"_field5__snmp_field\":\"_sec_level_\",\"_field6__snmp_field\":\"_auth_user_\",\"_field3__snmp_field\":\"_version_\",\"_field4__snmp_field\":\"_community_\",\"_field1__snmp_field\":\"_address_\",\"_field2__snmp_field\":\"_port_\",\"field0_snmp_field\":\"\"}','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','hp',2,2,'','',1,'1.3.6.1.4.1.11.2.14.11.5.1.1.2.1.1.1.1','','','','',1),(814,'Disk&#x20;_nameOID_&#x20;bytes&#x20;read','The&#x20;number&#x20;of&#x20;bytes&#x20;read&#x20;from&#x20;this&#x20;device&#x20;since&#x20;boot',53,16,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'bytes/sec','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','general_snmp',1,2,'1.3.6.1.4.1.2021.13.15.1.1.3','',0,'1.3.6.1.4.1.2021.13.15.1.1.2','','','','',1),(815,'Disk&#x20;_nameOID_&#x20;bytes&#x20;written','The&#x20;number&#x20;of&#x20;bytes&#x20;written&#x20;to&#x20;this&#x20;device&#x20;since&#x20;boot',53,16,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'bytes/sec','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','general_snmp',1,2,'1.3.6.1.4.1.2021.13.15.1.1.4','',0,'1.3.6.1.4.1.2021.13.15.1.1.2','','','','',1),(816,'Disk&#x20;_nameOID_&#x20;read&#x20;accesses','The&#x20;number&#x20;of&#x20;read&#x20;accesses&#x20;from&#x20;this&#x20;device&#x20;since&#x20;boot',53,16,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'accesses/sec','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','general_snmp',1,2,'1.3.6.1.4.1.2021.13.15.1.1.5','',0,'1.3.6.1.4.1.2021.13.15.1.1.2','','','','',1),(817,'Disk&#x20;_nameOID_&#x20;write&#x20;accesses','The&#x20;number&#x20;of&#x20;write&#x20;accesses&#x20;to&#x20;this&#x20;device&#x20;since&#x20;boot',53,16,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'accesses/sec','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','general_snmp',1,2,'1.3.6.1.4.1.2021.13.15.1.1.6','',0,'1.3.6.1.4.1.2021.13.15.1.1.2','','','','',1),(818,'Storage&#x20;_nameOID_&#x20;&#40;%&#41;','The&#x20;amount&#x20;of&#x20;the&#x20;storage&#x20;represented&#x20;by&#x20;this&#x20;entry&#x20;that&#x20;is&#x20;allocated',54,1,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,80.00,90.00,'',90.00,0.00,'',0,'','','',0,0,0.000000000000000,'%','nowizard','{\"extra_field_1\":\"1.3.6.1.2.1.25.2.3.1.6\",\"extra_field_2\":\"1.3.6.1.2.1.25.2.3.1.5\",\"satellite_execution\":\"/etc/pandora/satellite_plugins/wizard_snmp_module&#x20;-host&#x20;&quot;_address_&quot;&#x20;-port&#x20;&quot;_port_&quot;&#x20;-version&#x20;&quot;_version_&quot;&#x20;-community&#x20;&quot;_community_&quot;&#x20;-secLevel&#x20;&quot;_sec_level_&quot;&#x20;-user&#x20;&quot;_auth_user_&quot;&#x20;-authMethod&#x20;&quot;_auth_method_&quot;&#x20;-authPass&#x20;&quot;_auth_pass_&quot;&#x20;-privMethod&#x20;&quot;_priv_method_&quot;&#x20;-privPass&#x20;&quot;_priv_pass_&quot;&#x20;-oidList&#x20;&quot;_oid_1_,_oid_2_&quot;&#x20;-operation&#x20;&quot;&#40;_o1_&#x20;*&#x20;100&#41;&#x20;/&#x20;_o2_&quot;\",\"value_operation\":\"&#40;_oid_1_&#x20;*&#x20;100&#41;&#x20;/&#x20;_oid_2_\",\"server_plugin\":\"10\",\"_field11__snmp_field\":\"_oid_1_,_oid_2_\",\"_field12__snmp_field\":\"(_o1_ * 100) / _o2_\",\"_field9__snmp_field\":\"_priv_method_\",\"_field10__snmp_field\":\"_priv_pass_\",\"_field7__snmp_field\":\"_auth_method_\",\"_field8__snmp_field\":\"_auth_pass_\",\"_field5__snmp_field\":\"_sec_level_\",\"_field6__snmp_field\":\"_auth_user_\",\"_field3__snmp_field\":\"_version_\",\"_field4__snmp_field\":\"_community_\",\"_field1__snmp_field\":\"_address_\",\"_field2__snmp_field\":\"_port_\",\"field0_snmp_field\":\"\"}','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','general_snmp',2,2,'','',1,'1.3.6.1.2.1.25.2.3.1.3','','','','',1),(819,'Temperature&#x20;_nameOID_','The&#x20;temperature&#x20;of&#x20;this&#x20;sensor',55,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'&#xba;C','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','general_snmp',1,2,'1.3.6.1.4.1.2021.13.16.2.1.3','',0,'1.3.6.1.4.1.2021.13.16.2.1.2','','','','',1),(820,'Process&#x20;_nameOID_','Check&#x20;if&#x20;the&#x20;process&#x20;is&#x20;running',56,2,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','{\"extra_field_1\":\"1.3.6.1.2.1.25.4.2.1.7\",\"satellite_execution\":\"/etc/pandora/satellite_plugins/wizard_snmp_process&#x20;-host&#x20;&quot;_address_&quot;&#x20;-port&#x20;&quot;_port_&quot;&#x20;-version&#x20;&quot;_version_&quot;&#x20;-community&#x20;&quot;_community_&quot;&#x20;-secLevel&#x20;&quot;_sec_level_&quot;&#x20;-user&#x20;&quot;_auth_user_&quot;&#x20;-authMethod&#x20;&quot;_auth_method_&quot;&#x20;-authPass&#x20;&quot;_auth_pass_&quot;&#x20;-privMethod&#x20;&quot;_priv_method_&quot;&#x20;-privPass&#x20;&quot;_priv_pass_&quot;&#x20;-process&#x20;&quot;_nameOID_&quot;\",\"value_operation\":\"1\",\"server_plugin\":\"11\",\"_field11__snmp_field\":\"_nameOID_\",\"_field9__snmp_field\":\"_priv_method_\",\"_field10__snmp_field\":\"_priv_pass_\",\"_field7__snmp_field\":\"_auth_method_\",\"_field8__snmp_field\":\"_auth_pass_\",\"_field5__snmp_field\":\"_sec_level_\",\"_field6__snmp_field\":\"_auth_user_\",\"_field3__snmp_field\":\"_version_\",\"_field4__snmp_field\":\"_community_\",\"_field1__snmp_field\":\"_address_\",\"_field2__snmp_field\":\"_port_\",\"field0_snmp_field\":\"\"}','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','general_snmp',2,2,'','',0,'1.3.6.1.2.1.25.4.2.1.2','','','','',1),(821,'WMI&#x20;Number&#x20;of&#x20;processes','Number&#x20;of&#x20;process&#x20;contexts&#x20;currently&#x20;loaded&#x20;or&#x20;running&#x20;on&#x20;the&#x20;operating&#x20;system',56,1,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','{\"extra_field_1\":\"\",\"satellite_execution\":\"\",\"value_operation\":\"\",\"server_plugin\":\"0\",\"field0_wmi_field\":\"\"}','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'wmi','',1,1,'','',1,'','Win32_OperatingSystem','NumberOfProcesses','','{\"scan\":\"\",\"execution\":\"\",\"field\":\"0\",\"key_string\":\"\"}',1),(822,'WMI&#x20;&#x20;process&#x20;_Name_&#x20;running','Check&#x20;if&#x20;process&#x20;is&#x20;running',56,2,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','{\"extra_field_1\":\"Name\",\"satellite_execution\":\"\",\"value_operation\":\"\",\"server_plugin\":\"0\",\"field0_wmi_field\":\"\"}','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'wmi','',1,2,'','',0,'','Win32_Process','Handle','','{\"scan\":\"\",\"execution\":\"Name&#x20;=&#x20;&#039;_Name_&#039;\",\"field\":\"1\",\"key_string\":\"_Name_\"}',1),(823,'Wizard&#x20;system&#x20;uptime','The&#x20;time&#x20;&#40;in&#x20;hundredths&#x20;of&#x20;a&#x20;second&#41;&#x20;since&#x20;the&#x20;network&#x20;management&#x20;portion&#x20;of&#x20;the&#x20;system&#x20;was&#x20;last&#x20;re-initialized',57,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'_timeticks_','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','all',1,1,'1.3.6.1.2.1.25.1.1.0','',1,'','','','','',1),(824,'Wizard&#x20;network&#x20;uptime','The&#x20;time&#x20;&#40;in&#x20;hundredths&#x20;of&#x20;a&#x20;second&#41;&#x20;since&#x20;the&#x20;network&#x20;management&#x20;portion&#x20;of&#x20;the&#x20;system&#x20;was&#x20;last&#x20;re-initialized',57,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'_timeticks_','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','all',1,1,'1.3.6.1.2.1.1.3.0','',1,'','','','','',1),(825,'Blocks&#x20;sent','Number&#x20;of&#x20;blocks&#x20;sent&#x20;to&#x20;a&#x20;block&#x20;device',57,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','general_snmp',1,1,'1.3.6.1.4.1.2021.11.57.0','',0,'','','','','',1),(826,'Blocks&#x20;received','Number&#x20;of&#x20;blocks&#x20;received&#x20;from&#x20;a&#x20;block&#x20;device',57,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','general_snmp',1,1,'1.3.6.1.4.1.2021.11.58.0','',0,'','','','','',1),(827,'Interrupts&#x20;processed','Number&#x20;of&#x20;interrupts&#x20;processed',57,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','general_snmp',1,1,'1.3.6.1.4.1.2021.11.59.0','',0,'','','','','',1),(828,'Cisco&#x20;_nameOID_&#x20;power&#x20;state','The&#x20;current&#x20;state&#x20;of&#x20;the&#x20;power&#x20;supply:&#x20;normal&#40;1&#41;,&#x20;warning&#40;2&#41;,&#x20;critical&#40;3&#41;,&#x20;shutdown&#40;4&#41;,&#x20;notPresent&#40;5&#41;,&#x20;notFunctioning&#40;6&#41;',58,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','cisco',1,2,'1.3.6.1.4.1.9.9.13.1.5.1.3','',0,'1.3.6.1.4.1.9.9.13.1.5.1.2','','','','',1),(829,'F5&#x20;Power&#x20;supply&#x20;_nameOID_&#x20;status','The&#x20;status&#x20;of&#x20;the&#x20;indexed&#x20;power&#x20;supply&#x20;on&#x20;the&#x20;system:&#x20;bad&#40;0&#41;,&#x20;good&#40;1&#41;,&#x20;notpresent&#40;2&#41;',58,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','f5',1,2,'1.3.6.1.4.1.3375.2.1.3.2.2.2.1.2','',1,'1.3.6.1.4.1.3375.2.1.3.2.2.2.1','','','','',1),(830,'WMI&#x20;_Name_&#x20;power&#x20;supply&#x20;state','State&#x20;of&#x20;the&#x20;power&#x20;supply&#x20;or&#x20;supplies&#x20;when&#x20;last&#x20;booted:&#x20;Other&#x20;&#40;1&#41;,&#x20;Unknown&#x20;&#40;2&#41;,&#x20;Safe&#x20;&#40;3&#41;,&#x20;Warning&#x20;&#40;4&#41;,&#x20;Critical&#x20;&#40;5&#41;,&#x20;Non-recoverable&#x20;&#40;6&#41;',58,1,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','{\"extra_field_1\":\"PowerSupplyState\",\"satellite_execution\":\"\",\"value_operation\":\"\",\"server_plugin\":\"0\",\"field0_wmi_field\":\"\"}','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'wmi','',1,2,'','',0,'','Win32_ComputerSystem','Name','','{\"scan\":\"\",\"execution\":\"Name&#x20;=&#x20;&#039;_Name_&#039;\",\"field\":\"1\",\"key_string\":\"\"}',1),(831,'WMI&#x20;_Name_&#x20;Power&#x20;state','Current&#x20;power&#x20;state&#x20;of&#x20;a&#x20;computer&#x20;and&#x20;its&#x20;associated&#x20;operating&#x20;system:&#x20;Unknown&#x20;&#40;0&#41;,&#x20;Full&#x20;Power&#x20;&#40;1&#41;,&#x20;Low&#x20;Power&#x20;Mode&#x20;&#40;2&#41;,&#x20;Standby&#x20;&#40;3&#41;,&#x20;Unknown&#x20;&#40;4&#41;,&#x20;Power&#x20;Cycle&#x20;&#40;5&#41;,&#x20;Power&#x20;Off&#x20;&#40;6&#41;,&#x20;Warning&#x20;&#40;7&#41;,&#x20;Hibernate&#x20;&#40;8&#41;,&#x20;Soft&#x20;Off&#x20;&#40;9&#41;',58,1,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','{\"extra_field_1\":\"PowerState\",\"satellite_execution\":\"\",\"value_operation\":\"\",\"server_plugin\":\"0\",\"field0_wmi_field\":\"\"}','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'wmi','',1,1,'','',0,'','Win32_ComputerSystem','Name','','{\"scan\":\"\",\"execution\":\"Name&#x20;=&#x20;&#039;_Name_&#039;\",\"field\":\"1\",\"key_string\":\"\"}',1),(832,'Cisco&#x20;_nameOID_&#x20;fan&#x20;state','The&#x20;current&#x20;state&#x20;of&#x20;the&#x20;fan:&#x20;normal&#40;1&#41;,&#x20;warning&#40;2&#41;,&#x20;critical&#40;3&#41;,&#x20;shutdown&#40;4&#41;,&#x20;notPresent&#40;5&#41;,&#x20;notFunctioning&#40;6&#41;',59,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','cisco',1,2,'1.3.6.1.4.1.9.9.13.1.4.1.3','',1,'1.3.6.1.4.1.9.9.13.1.4.1.2','','','','',1),(833,'F5&#x20;Fan&#x20;_nameOID_&#x20;status','The&#x20;status&#x20;of&#x20;the&#x20;indexed&#x20;chassis&#x20;fan&#x20;on&#x20;the&#x20;system:&#x20;bad&#40;0&#41;,&#x20;good&#40;1&#41;,&#x20;notpresent&#40;2&#41;',59,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','f5',1,2,'1.3.6.1.4.1.3375.2.1.3.2.1.2.1.2','',1,'1.3.6.1.4.1.3375.2.1.3.2.1.2.1.1','','','','',1),(834,'HP&#x20;fan&#x20;tray&#x20;_nameOID_&#x20;state','Current&#x20;state&#x20;of&#x20;the&#x20;fan:&#x20;failed&#40;0&#41;,&#x20;removed&#40;1&#41;,&#x20;off&#40;2&#41;,&#x20;underspeed&#40;3&#41;,&#x20;overspeed&#40;4&#41;,&#x20;ok&#40;5&#41;,&#x20;maxstate&#40;6&#41;',59,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','juniper',1,2,'1.3.6.1.4.1.11.2.14.11.5.1.54.2.1.1.4','',1,'1.3.6.1.4.1.11.2.14.11.5.1.54.2.1.1.2','','','','',1),(835,'Cisco&#x20;_nameOID_&#x20;temperature','The&#x20;current&#x20;measurement&#x20;of&#x20;the&#x20;testpoint&#x20;being&#x20;instrumented',60,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'&#xba;C','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','cisco',1,2,'1.3.6.1.4.1.9.9.13.1.3.1.3','',1,'1.3.6.1.4.1.9.9.13.1.3.1.2','','','','',1),(836,'F5&#x20;Temperature&#x20;sensor&#x20;_nameOID_','The&#x20;chassis&#x20;temperature&#x20;of&#x20;the&#x20;indexed&#x20;sensor&#x20;on&#x20;the&#x20;system',60,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'&#xba;C','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','f5',1,2,'1.3.6.1.4.1.3375.2.1.3.2.3.2.1.2','',1,'1.3.6.1.4.1.3375.2.1.3.2.3.2.1.1','','','','',1),(837,'Juniper&#x20;_nameOID_&#x20;temperature','The&#x20;temperature&#x20;of&#x20;this&#x20;subject',60,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'&#xba;C','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','juniper',1,2,'1.3.6.1.4.1.2636.3.1.13.1.7','',1,'1.3.6.1.4.1.2636.3.1.13.1.5','','','','',1),(838,'HP&#x20;_nameOID_&#x20;temperature','The&#x20;current&#x20;temperature&#x20;given&#x20;by&#x20;the&#x20;indexed&#x20;chassis',60,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'&#xba;C','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','hp',1,2,'1.3.6.1.4.1.11.2.14.11.1.2.8.1.1.3','',0,'1.3.6.1.4.1.11.2.14.11.1.2.8.1.1.2','','','','',1),(839,'F5&#x20;Current&#x20;auth&#x20;sessions','The&#x20;current&#x20;number&#x20;of&#x20;concurrent&#x20;auth&#x20;sessions',61,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','f5',1,1,'1.3.6.1.4.1.3375.2.1.1.2.2.3.0','',1,'','','','','',1),(840,'F5&#x20;Total&#x20;auth&#x20;success&#x20;results','The&#x20;total&#x20;number&#x20;of&#x20;auth&#x20;success&#x20;results',61,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','f5',1,1,'1.3.6.1.4.1.3375.2.1.1.2.2.5.0','',1,'','','','','',1),(841,'F5&#x20;Total&#x20;auth&#x20;failure&#x20;results','The&#x20;total&#x20;number&#x20;of&#x20;auth&#x20;failure&#x20;results',61,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','f5',1,1,'1.3.6.1.4.1.3375.2.1.1.2.2.6.0','',1,'','','','','',1),(842,'F5&#x20;Total&#x20;auth&#x20;error&#x20;results','The&#x20;total&#x20;number&#x20;of&#x20;auth&#x20;error&#x20;results',61,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','f5',1,1,'1.3.6.1.4.1.3375.2.1.1.2.2.8.0','',1,'','','','','',1),(843,'Fortinet&#x20;ephemeral&#x20;sessions&#x20;count','The&#x20;current&#x20;number&#x20;of&#x20;ephemeral&#x20;sessions&#x20;on&#x20;the&#x20;device',61,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','fortinet',1,1,'1.3.6.1.4.1.12356.101.4.6.2.1.0','',1,'','','','','',1),(844,'Fortinet&#x20;direct&#x20;requests&#x20;count','The&#x20;number&#x20;of&#x20;direct&#x20;requests&#x20;to&#x20;Fortigate&#x20;local&#x20;stack&#x20;from&#x20;external,&#x20;reflecting&#x20;DOS&#x20;attack&#x20;towards&#x20;the&#x20;Fortigate',61,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','fortinet',1,1,'1.3.6.1.4.1.12356.101.4.6.2.7.0','',1,'','','','','',1),(845,'Fortinet&#x20;clash&#x20;sessions&#x20;count','The&#x20;number&#x20;of&#x20;new&#x20;sessions&#x20;which&#x20;have&#x20;collision&#x20;with&#x20;existing&#x20;sessions.&#x20;This&#x20;generally&#x20;highlights&#x20;a&#x20;shortage&#x20;of&#x20;ports&#x20;or&#x20;IP&#x20;in&#x20;ip-pool&#x20;during&#x20;source&#x20;natting&#x20;&#40;PNAT&#41;',61,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','fortinet',1,1,'1.3.6.1.4.1.12356.101.4.6.2.3.0','',1,'','','','','',1),(846,'Fortinet&#x20;expectation&#x20;sessions&#x20;count','The&#x20;number&#x20;of&#x20;current&#x20;expectation&#x20;sessions',61,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','fortinet',1,1,'1.3.6.1.4.1.12356.101.4.6.2.4.0','',1,'','','','','',1),(847,'Fortinet&#x20;sync&#x20;queue&#x20;sessions&#x20;count','The&#x20;sync&#x20;queue&#x20;full&#x20;counter,&#x20;reflecting&#x20;bursts&#x20;on&#x20;the&#x20;sync&#x20;queue',61,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','fortinet',1,1,'1.3.6.1.4.1.12356.101.4.6.2.5.0','',1,'','','','','',1),(848,'Fortinet&#x20;accept&#x20;queue&#x20;sessions&#x20;count','The&#x20;accept&#x20;queue&#x20;full&#x20;counter,&#x20;reflecting&#x20;bursts&#x20;on&#x20;the&#x20;accept&#x20;queue',61,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','fortinet',1,1,'1.3.6.1.4.1.12356.101.4.6.2.6.0','',1,'','','','','',1),(849,'F5&#x20;Current&#x20;SSL/VPN&#x20;connections','The&#x20;total&#x20;current&#x20;SSL/VPN&#x20;connections&#x20;in&#x20;the&#x20;system',62,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','f5',1,1,'1.3.6.1.4.1.3375.2.6.1.5.3.0','',1,'','','','','',1),(850,'F5&#x20;Total&#x20;SSL/VPN&#x20;bytes&#x20;received','The&#x20;total&#x20;raw&#x20;bytes&#x20;received&#x20;by&#x20;SSL/VPN&#x20;connections&#x20;in&#x20;the&#x20;system',62,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'bytes','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','f5',1,1,'1.3.6.1.4.1.3375.2.6.1.5.5.0','',1,'','','','','',1),(851,'F5&#x20;Total&#x20;SSL/VPN&#x20;bytes&#x20;transmitted','The&#x20;total&#x20;raw&#x20;bytes&#x20;transmitted&#x20;by&#x20;SSL/VPN&#x20;connections&#x20;in&#x20;the&#x20;system',62,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'bytes','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','f5',1,1,'1.3.6.1.4.1.3375.2.6.1.5.6.0','',1,'','','','','',1),(852,'Juniper&#x20;_nameOID_&#x20;active&#x20;sites','The&#x20;number&#x20;of&#x20;active&#x20;sites&#x20;in&#x20;the&#x20;VPN',62,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','juniper',1,2,'1.3.6.1.4.1.2636.3.26.1.2.1.9','',1,'1.3.6.1.4.1.2636.3.26.1.2.1.2','','','','',1),(853,'Juniper&#x20;_nameOID_&#x20;age','The&#x20;age&#x20;&#40;i.e.,&#x20;time&#x20;from&#x20;creation&#x20;till&#x20;now&#41;&#x20;of&#x20;this&#x20;VPN&#x20;in&#x20;hundredths&#x20;of&#x20;a&#x20;second',62,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'_timeticks_','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','juniper',1,2,'1.3.6.1.4.1.2636.3.26.1.2.1.12','',1,'1.3.6.1.4.1.2636.3.26.1.2.1.2','','','','',1),(854,'Juniper&#x20;_nameOID_&#x20;interface&#x20;status','Status&#x20;of&#x20;this&#x20;interface:&#x20;unknown&#40;0&#41;,&#x20;noLocalInterface&#40;1&#41;,&#x20;disabled&#40;2&#41;,&#x20;encapsulationMismatch&#40;3&#41;,&#x20;down&#40;4&#41;,&#x20;up&#40;5&#41;',62,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','juniper',1,2,'1.3.6.1.4.1.2636.3.26.1.3.1.10','',1,'1.3.6.1.4.1.2636.3.26.1.3.1.2','','','','',1),(855,'Fortinet&#x20;virtual&#x20;domain&#x20;_nameOID_&#x20;intrussions&#x20;detected','Number&#x20;of&#x20;intrusions&#x20;detected&#x20;since&#x20;start-up&#x20;in&#x20;this&#x20;virtual&#x20;domain',63,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','fortinet',1,2,'1.3.6.1.4.1.12356.101.9.2.1.1.1','',1,'1.3.6.1.4.1.12356.101.3.2.1.1.2','','','','',1),(856,'Fortinet&#x20;virtual&#x20;domain&#x20;_nameOID_&#x20;intrussions&#x20;blocked','Number&#x20;of&#x20;intrusions&#x20;detected&#x20;since&#x20;start-up&#x20;in&#x20;this&#x20;virtual&#x20;domain',63,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','fortinet',1,2,'1.3.6.1.4.1.12356.101.9.2.1.1.1','',1,'1.3.6.1.4.1.12356.101.3.2.1.1.2','','','','',1),(857,'Fortinet&#x20;virtual&#x20;domain&#x20;_nameOID_&#x20;critical&#x20;severity&#x20;intrussions','Number&#x20;of&#x20;critical&#x20;severity&#x20;intrusions&#x20;detected&#x20;since&#x20;start-up&#x20;in&#x20;this&#x20;virtual&#x20;domain',63,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','fortinet',1,2,'1.3.6.1.4.1.12356.101.9.2.1.1.3','',1,'1.3.6.1.4.1.12356.101.3.2.1.1.2','','','','',1),(858,'Fortinet&#x20;virtual&#x20;domain&#x20;_nameOID_&#x20;high&#x20;severity&#x20;intrussions','Number&#x20;of&#x20;high&#x20;severity&#x20;intrusions&#x20;detected&#x20;since&#x20;start-up&#x20;in&#x20;this&#x20;virtual&#x20;domain',63,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','fortinet',1,2,'1.3.6.1.4.1.12356.101.9.2.1.1.4','',1,'1.3.6.1.4.1.12356.101.3.2.1.1.2','','','','',1),(859,'Fortinet&#x20;virtual&#x20;domain&#x20;_nameOID_&#x20;medium&#x20;severity&#x20;intrussions','Number&#x20;of&#x20;medium&#x20;severity&#x20;intrusions&#x20;detected&#x20;since&#x20;start-up&#x20;in&#x20;this&#x20;virtual&#x20;domain',63,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','fortinet',1,2,'1.3.6.1.4.1.12356.101.9.2.1.1.5','',1,'1.3.6.1.4.1.12356.101.3.2.1.1.2','','','','',1),(860,'Fortinet&#x20;virtual&#x20;domain&#x20;_nameOID_&#x20;low&#x20;severity&#x20;intrussions','Number&#x20;of&#x20;low&#x20;severity&#x20;intrusions&#x20;detected&#x20;since&#x20;start-up&#x20;in&#x20;this&#x20;virtual&#x20;domain',63,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','fortinet',1,2,'1.3.6.1.4.1.12356.101.9.2.1.1.6','',1,'1.3.6.1.4.1.12356.101.3.2.1.1.2','','','','',1),(861,'Fortinet&#x20;virtual&#x20;domain&#x20;_nameOID_&#x20;informational&#x20;severity&#x20;intrussions','Number&#x20;of&#x20;informational&#x20;severity&#x20;intrusions&#x20;detected&#x20;since&#x20;start-up&#x20;in&#x20;this&#x20;virtual&#x20;domain',63,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','fortinet',1,2,'1.3.6.1.4.1.12356.101.9.2.1.1.7','',1,'1.3.6.1.4.1.12356.101.3.2.1.1.2','','','','',1),(862,'Fortinet&#x20;virtual&#x20;domain&#x20;_nameOID_&#x20;signature&#x20;detections','Number&#x20;of&#x20;intrusions&#x20;detected&#x20;by&#x20;signature&#x20;since&#x20;start-up&#x20;in&#x20;this&#x20;virtual&#x20;domain',63,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','fortinet',1,2,'1.3.6.1.4.1.12356.101.9.2.1.1.8','',1,'1.3.6.1.4.1.12356.101.3.2.1.1.2','','','','',1),(863,'Fortinet&#x20;virtual&#x20;domain&#x20;_nameOID_&#x20;anomaly&#x20;detections','Number&#x20;of&#x20;intrusions&#x20;DECed&#x20;as&#x20;anomalies&#x20;since&#x20;start-up&#x20;in&#x20;this&#x20;virtual&#x20;domain',63,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','fortinet',1,2,'1.3.6.1.4.1.12356.101.9.2.1.1.9','',1,'1.3.6.1.4.1.12356.101.3.2.1.1.2','','','','',1),(864,'Fortinet&#x20;virtual&#x20;domain&#x20;_nameOID_&#x20;virus&#x20;detected','Number&#x20;of&#x20;virus&#x20;transmissions&#x20;detected&#x20;in&#x20;the&#x20;virtual&#x20;domain&#x20;since&#x20;start-up',29,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','fortinet',1,2,'1.3.6.1.4.1.12356.101.8.2.1.1.1','',1,'1.3.6.1.4.1.12356.101.3.2.1.1.2','','','','',1),(865,'Fortinet&#x20;virtual&#x20;domain&#x20;_nameOID_&#x20;virus&#x20;blocked','Number&#x20;of&#x20;virus&#x20;transmissions&#x20;blocked&#x20;in&#x20;the&#x20;virtual&#x20;domain&#x20;since&#x20;start-up',29,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','fortinet',1,2,'1.3.6.1.4.1.12356.101.8.2.1.1.2','',1,'1.3.6.1.4.1.12356.101.3.2.1.1.2','','','','',1),(866,'Fortinet&#x20;virtual&#x20;domain&#x20;_nameOID_&#x20;oversized&#x20;detected','Number&#x20;of&#x20;over-sized&#x20;file&#x20;transmissions&#x20;detected&#x20;in&#x20;the&#x20;virtual&#x20;domain&#x20;since&#x20;start-up',29,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','fortinet',1,2,'1.3.6.1.4.1.12356.101.8.2.1.1.17','',1,'1.3.6.1.4.1.12356.101.3.2.1.1.2','','','','',1),(867,'Fortinet&#x20;virtual&#x20;domain&#x20;_nameOID_&#x20;oversized&#x20;blocked','Number&#x20;of&#x20;over-sized&#x20;file&#x20;transmissions&#x20;blocked&#x20;in&#x20;the&#x20;virtual&#x20;domain&#x20;since&#x20;start-up',29,15,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','Array','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'snmp','fortinet',1,2,'1.3.6.1.4.1.12356.101.8.2.1.1.18','',1,'1.3.6.1.4.1.12356.101.3.2.1.1.2','','','','',1),(868,'WMI&#x20;Service&#x20;_Name_&#x20;running','_Caption_',64,2,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,0.00,0.00,'',0.00,0.00,'',0,'','','',0,0,0.000000000000000,'','nowizard','{\"extra_field_1\":\"State\",\"extra_field_2\":\"Caption\",\"satellite_execution\":\"\",\"value_operation\":\"\",\"server_plugin\":\"0\",\"field0_wmi_field\":\"\"}','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'wmi','',1,2,'','',0,'','Win32_Service','Name','','{\"scan\":\"\",\"execution\":\"Name&#x20;=&#x20;&#039;_Name_&#039;\",\"field\":\"1\",\"key_string\":\"Running\"}',1),(869,'WMI&#x20;disk&#x20;_DeviceID_&#x20;used&#x20;&#40;%&#41;','Space&#x20;percentage&#x20;used&#x20;on&#x20;the&#x20;logical&#x20;disk',65,1,0,0,0,0,'','','','',0,9,0,'','','',0,0,0,80.00,90.00,'',90.00,0.00,'',0,'','','',0,0,0.000000000000000,'%','nowizard','{\"extra_field_1\":\"Size\",\"extra_field_2\":\"FreeSpace\",\"satellite_execution\":\"/etc/pandora/satellite_plugins/wizard_wmi_module&#x20;-host&#x20;&quot;_address_&quot;&#x20;-namespace&#x20;&quot;_namespace_wmi_&quot;&#x20;-user&#x20;&quot;_user_wmi_&quot;&#x20;-pass&#x20;&quot;_pass_wmi_&quot;&#x20;-wmiClass&#x20;&quot;_class_wmi_&quot;&#x20;-fieldsList&#x20;&quot;_field_wmi_1_,_field_wmi_2_&quot;&#x20;-queryFilter&#x20;&quot;DeviceID&#x20;=&#x20;&#039;_DeviceID_&#039;&quot;&#x20;-operation&#x20;&quot;&#40;&#40;_f1_&#x20;-&#x20;_f2_&#41;&#x20;*&#x20;100&#41;&#x20;/&#x20;_f1_&quot;&#x20;-wmicPath&#x20;/usr/bin/wmic\",\"value_operation\":\"&#40;&#40;_Size_&#x20;-&#x20;_FreeSpace_&#41;&#x20;*&#x20;100&#41;&#x20;/&#x20;_Size_\",\"server_plugin\":\"12\",\"_field2__wmi_field\":\"_namespace_wmi_\",\"_field1__wmi_field\":\"_address_\",\"_field4__wmi_field\":\"_pass_wmi_\",\"_field3__wmi_field\":\"_user_wmi_\",\"_field6__wmi_field\":\"_field_wmi_1_,_field_wmi_2_\",\"_field5__wmi_field\":\"_class_wmi_\",\"_field8__wmi_field\":\"&#40;&#40;_f1_&#x20;-&#x20;_f2_&#41;&#x20;*&#x20;100&#41;&#x20;/&#x20;_f1_\",\"_field7__wmi_field\":\"DeviceID&#x20;=&#x20;&#039;_DeviceID_&#039;\",\"field0_wmi_field\":\"\"}','','','',0,0,0,'','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,1,'wmi','',2,2,'','',1,'','Win32_LogicalDisk','DeviceID','','{\"scan\":\"DriveType&#x20;=&#x20;3\",\"execution\":\"\",\"field\":\"\",\"key_string\":\"\"}',1);
/*!40000 ALTER TABLE `tnetwork_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tnetwork_component_group`
--

DROP TABLE IF EXISTS `tnetwork_component_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tnetwork_component_group` (
  `id_sg` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `parent` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_sg`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tnetwork_component_group`
--

LOCK TABLES `tnetwork_component_group` WRITE;
/*!40000 ALTER TABLE `tnetwork_component_group` DISABLE KEYS */;
INSERT INTO `tnetwork_component_group` VALUES (1,'General group',0),(2,'Cisco MIBs',10),(5,'UNIX&#x20;Systems',12),(10,'Network Management',0),(11,'Microsoft&#x20;Windows',12),(12,'Operating Systems',0),(13,'UCD Mibs (Linux, UCD-SNMP)',12),(14,'WMI',12),(15,'Databases',0),(16,'Windows System',14),(17,'Windows Hardware Layer',14),(18,'Windows AD ',14),(19,'Windows IIS ',14),(20,'Windows Exchange',14),(21,'Windows LDAP ',14),(22,'Windows MSDTC  ',14),(23,'Catalyst 2900  ',2),(24,'Windows Printers',14),(25,'Citrix',0),(26,'Exchange&#x20;Services',20),(27,'MS&#x20;SQL&#x20;Server',15),(28,'Oracle',15),(29,'Antivirus',0),(30,'Norton',29),(31,'Panda',29),(32,'McAfee',29),(33,'Bitdefender',29),(34,'Windows&#x20;DNS',14),(35,'DNS&#x20;Counters',34),(36,'AD&#x20;Counters',18),(37,'BullGuard',29),(38,'IIS&#x20;services',19),(39,'Exchange&#x20;TCP&#x20;Ports',20),(40,'AVG',29),(41,'Kaspersky',29),(42,'MySQL',15),(43,'Linux',5),(44,'HP-UX',5),(45,'Solaris',5),(46,'AIX',5),(47,'BSD',5),(48,'MacOS',0),(49,'DB2',15),(50,'Wizard',0),(51,'CPU',50),(52,'Memory',50),(53,'Disk&#x20;devices',50),(54,'Storage',50),(55,'Temperature&#x20;sensors',50),(56,'Processes',50),(57,'Other',50),(58,'Power&#x20;supply',50),(59,'Fans',50),(60,'Temperature',50),(61,'Sessions',50),(62,'VPN',50),(63,'Intrussions',50),(64,'Services',50),(65,'Disks',50);
/*!40000 ALTER TABLE `tnetwork_component_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tnetwork_map`
--

DROP TABLE IF EXISTS `tnetwork_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tnetwork_map` (
  `id_networkmap` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` varchar(60) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `layout` varchar(20) NOT NULL,
  `nooverlap` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `simple` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `regenerate` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `font_size` int(10) unsigned NOT NULL DEFAULT '12',
  `id_group` int(11) NOT NULL DEFAULT '0',
  `id_module_group` int(11) NOT NULL DEFAULT '0',
  `id_policy` int(11) NOT NULL DEFAULT '0',
  `depth` varchar(20) NOT NULL,
  `only_modules_with_alerts` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hide_policy_modules` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `zoom` float unsigned NOT NULL DEFAULT '1',
  `distance_nodes` float unsigned NOT NULL DEFAULT '2.5',
  `center` int(10) unsigned NOT NULL DEFAULT '0',
  `contracted_nodes` text,
  `show_snmp_modules` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `text_filter` varchar(100) NOT NULL DEFAULT '',
  `dont_show_subgroups` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pandoras_children` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `show_groups` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `show_modules` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `id_agent` int(11) NOT NULL DEFAULT '0',
  `server_name` varchar(100) NOT NULL,
  `show_modulegroup` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `l2_network` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `id_tag` int(11) DEFAULT '0',
  `store_group` int(11) DEFAULT '0',
  PRIMARY KEY (`id_networkmap`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tnetwork_map`
--

LOCK TABLES `tnetwork_map` WRITE;
/*!40000 ALTER TABLE `tnetwork_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `tnetwork_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tnetwork_matrix`
--

DROP TABLE IF EXISTS `tnetwork_matrix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tnetwork_matrix` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(60) DEFAULT '',
  `destination` varchar(60) DEFAULT '',
  `utimestamp` bigint(20) DEFAULT '0',
  `bytes` int(18) unsigned DEFAULT '0',
  `pkts` int(18) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `source` (`source`,`destination`,`utimestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tnetwork_matrix`
--

LOCK TABLES `tnetwork_matrix` WRITE;
/*!40000 ALTER TABLE `tnetwork_matrix` DISABLE KEYS */;
/*!40000 ALTER TABLE `tnetwork_matrix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tnetwork_profile`
--

DROP TABLE IF EXISTS `tnetwork_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tnetwork_profile` (
  `id_np` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(250) DEFAULT '',
  PRIMARY KEY (`id_np`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tnetwork_profile`
--

LOCK TABLES `tnetwork_profile` WRITE;
/*!40000 ALTER TABLE `tnetwork_profile` DISABLE KEYS */;
INSERT INTO `tnetwork_profile` VALUES (2,'Basic&#x20;Monitoring','Only&#x20;checks&#x20;for&#x20;availability&#x20;and&#x20;latency&#x20;of&#x20;targeted&#x20;hosts.'),(3,'Basic DMZ Server monitoring','This group of network checks, checks for default services located on DMZ servers...'),(7,'Linux&#x20;Server&#x20;with&#x20;SNMP','Group&#x20;of&#x20;&quot;basic&quot;&#x20;modules&#x20;for&#x20;SNMP&#x20;monitoring&#x20;of&#x20;Linux&#x20;remote&#x20;devices.&#x20;This&#x20;includes&#x20;basic&#x20;conectivity&#x20;checks&#x20;and&#x20;a&#x20;full&#x20;range&#x20;of&#x20;System'),(8,'Network&#x20;Management','Basic network monitoring template'),(9,'Cisco&#x20;MIBS','Cisco devices monitoring template (SNMP)'),(10,'Linux&#x20;System','Linux system monitoring template (SNMP)'),(11,'Windows&#x20;System','Windows system monitoring template (WMI)'),(12,'Windows&#x20;Hardware','Windows hardware monitoring templae (WMI)'),(13,'Windows&#x20;Active&#x20;Directory','Active directory monitoring template (WMI)'),(14,'Windows&#x20;IIS','IIS monitoring template (WMI)'),(15,'Windows&#x20;Exchange','Exchange monitoring template (WMI)'),(16,'Windows&#x20;LDAP','LDAP monitoring template (WMI)'),(17,'Windows&#x20;MDSTC','MDSTC monitoring template (WMI)'),(18,'Windows&#x20;Printers','Windows printers monitoring template (WMI)'),(19,'Windows&#x20;DNS','Windows DNS monitoring template (WMI)'),(20,'Windows&#x20;MS&#x20;SQL&#x20;Server','MS SQL Server monitoring template (WMI)'),(21,'Oracle','Oracle monitoring template'),(22,'MySQL','MySQL monitoring template'),(23,'Windows&#x20;Antivirus','Windows antivirus monitoring template (WMI)');
/*!40000 ALTER TABLE `tnetwork_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tnetwork_profile_component`
--

DROP TABLE IF EXISTS `tnetwork_profile_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tnetwork_profile_component` (
  `id_nc` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_np` mediumint(8) unsigned NOT NULL DEFAULT '0',
  KEY `id_np` (`id_np`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tnetwork_profile_component`
--

LOCK TABLES `tnetwork_profile_component` WRITE;
/*!40000 ALTER TABLE `tnetwork_profile_component` DISABLE KEYS */;
INSERT INTO `tnetwork_profile_component` VALUES (34,2),(34,3),(37,3),(39,3),(38,3),(4,7),(34,7),(30,7),(27,7),(24,7),(49,7),(51,7),(36,2),(36,3),(24,8),(25,8),(26,8),(27,8),(28,8),(29,8),(30,8),(31,8),(32,8),(34,8),(36,8),(37,8),(38,8),(39,8),(40,8),(41,8),(42,8),(785,8),(11,9),(22,9),(176,9),(514,9),(515,9),(516,9),(517,9),(518,9),(519,9),(520,9),(521,9),(522,9),(1,10),(2,10),(4,10),(49,10),(51,10),(52,10),(788,10),(789,10),(790,10),(791,10),(792,10),(200,11),(201,11),(202,11),(203,11),(204,11),(206,11),(207,11),(208,11),(210,11),(211,11),(212,11),(213,11),(214,11),(215,11),(216,11),(217,11),(218,11),(219,11),(220,11),(226,11),(227,11),(236,11),(237,11),(238,11),(239,11),(240,11),(241,11),(242,11),(243,11),(244,11),(245,11),(246,11),(247,11),(248,11),(250,11),(251,11),(252,11),(259,11),(260,11),(261,11),(262,11),(263,11),(264,11),(265,11),(320,11),(321,11),(750,11),(786,11),(787,11),(205,12),(209,12),(221,12),(222,12),(223,12),(224,12),(225,12),(228,12),(230,12),(231,12),(232,12),(233,12),(234,12),(235,12),(249,12),(253,12),(254,12),(255,12),(256,12),(257,12),(258,12),(299,13),(300,13),(613,13),(614,13),(615,13),(616,13),(617,13),(618,13),(619,13),(620,13),(621,13),(622,13),(623,13),(624,13),(625,13),(626,13),(627,13),(628,13),(629,13),(630,13),(631,13),(632,13),(633,13),(634,13),(635,13),(636,13),(637,13),(638,13),(639,13),(640,13),(641,13),(642,13),(643,13),(644,13),(645,13),(646,13),(647,13),(648,13),(649,13),(650,13),(651,13),(652,13),(653,13),(654,13),(655,13),(656,13),(657,13),(658,13),(659,13),(660,13),(661,13),(662,13),(663,13),(664,13),(665,13),(666,13),(667,13),(668,13),(669,13),(670,13),(671,13),(672,13),(673,13),(674,13),(675,13),(676,13),(677,13),(678,13),(679,13),(680,13),(681,13),(682,13),(683,13),(684,13),(685,13),(686,13),(687,13),(688,13),(689,13),(690,13),(691,13),(692,13),(693,13),(694,13),(695,13),(696,13),(697,13),(698,13),(699,13),(700,13),(761,13),(301,14),(302,14),(303,14),(304,14),(305,14),(306,14),(307,14),(308,14),(309,14),(310,14),(311,14),(312,14),(313,14),(314,14),(315,14),(316,14),(317,14),(318,14),(319,14),(322,14),(323,14),(324,14),(325,14),(326,14),(327,14),(328,14),(329,14),(330,14),(331,14),(332,14),(333,14),(334,14),(335,14),(336,14),(337,14),(338,14),(339,14),(340,14),(341,14),(342,14),(343,14),(344,14),(345,14),(346,14),(347,14),(348,14),(349,14),(350,14),(351,14),(352,14),(353,14),(354,14),(355,14),(356,14),(357,14),(358,14),(359,14),(360,14),(361,14),(362,14),(363,14),(364,14),(365,14),(366,14),(367,14),(368,14),(369,14),(370,14),(371,14),(372,14),(373,14),(374,14),(375,14),(376,14),(377,14),(378,14),(379,14),(380,14),(382,14),(384,14),(745,14),(746,14),(747,14),(749,14),(783,14),(266,15),(267,15),(268,15),(269,15),(270,15),(271,15),(272,15),(273,15),(274,15),(275,15),(276,15),(277,15),(278,15),(279,15),(280,15),(281,15),(282,15),(283,15),(284,15),(285,15),(286,15),(287,15),(288,15),(289,15),(290,15),(291,15),(292,15),(293,15),(294,15),(295,15),(296,15),(297,15),(298,15),(385,15),(386,15),(387,15),(388,15),(389,15),(390,15),(391,15),(392,15),(393,15),(394,15),(395,15),(396,15),(397,15),(398,15),(399,15),(400,15),(401,15),(402,15),(403,15),(404,15),(405,15),(406,15),(407,15),(408,15),(409,15),(410,15),(411,15),(412,15),(413,15),(414,15),(415,15),(416,15),(435,15),(436,15),(437,15),(438,15),(439,15),(440,15),(441,15),(442,15),(443,15),(444,15),(445,15),(446,15),(447,15),(448,15),(449,15),(450,15),(451,15),(452,15),(453,15),(454,15),(455,15),(456,15),(457,15),(458,15),(459,15),(460,15),(461,15),(462,15),(463,15),(464,15),(465,15),(466,15),(467,15),(468,15),(469,15),(470,15),(471,15),(472,15),(473,15),(474,15),(475,15),(476,15),(477,15),(478,15),(479,15),(480,15),(481,15),(482,15),(483,15),(484,15),(485,15),(486,15),(487,15),(488,15),(489,15),(490,15),(491,15),(492,15),(493,15),(494,15),(495,15),(496,15),(497,15),(498,15),(499,15),(533,15),(723,15),(724,15),(725,15),(726,15),(727,15),(728,15),(729,15),(730,15),(731,15),(732,15),(733,15),(734,15),(735,15),(736,15),(737,15),(738,15),(739,15),(740,15),(741,15),(742,15),(743,15),(744,15),(751,15),(752,15),(753,15),(754,15),(755,15),(756,15),(417,16),(418,16),(419,16),(420,16),(421,16),(422,16),(423,16),(424,16),(425,16),(426,16),(427,16),(428,16),(429,16),(430,16),(431,16),(432,16),(433,16),(434,16),(501,17),(502,17),(503,17),(504,17),(505,17),(506,17),(507,17),(508,17),(509,17),(510,17),(511,17),(512,17),(513,17),(523,18),(524,18),(525,18),(526,18),(527,18),(528,18),(529,18),(530,18),(531,18),(532,18),(583,19),(584,19),(585,19),(586,19),(587,19),(588,19),(589,19),(590,19),(591,19),(592,19),(593,19),(594,19),(595,19),(596,19),(597,19),(598,19),(599,19),(600,19),(601,19),(602,19),(603,19),(604,19),(605,19),(606,19),(607,19),(608,19),(609,19),(610,19),(611,19),(612,19),(762,19),(534,20),(535,20),(536,20),(537,20),(538,20),(539,20),(540,20),(541,20),(542,20),(543,20),(544,20),(545,20),(546,20),(547,20),(548,20),(557,20),(782,20),(549,21),(550,21),(551,21),(552,21),(553,21),(554,21),(555,21),(556,21),(558,21),(559,21),(560,21),(561,21),(710,21),(711,21),(712,21),(713,21),(714,21),(715,21),(716,21),(717,21),(718,21),(719,21),(720,21),(721,21),(722,21),(781,21),(766,22),(767,22),(768,22),(769,22),(770,22),(771,22),(772,22),(773,22),(774,22),(775,22),(776,22),(777,22),(778,22),(779,22),(780,22),(562,23),(563,23),(564,23),(565,23),(568,23),(569,23),(570,23),(571,23),(572,23),(573,23),(574,23),(575,23),(576,23),(577,23),(578,23),(579,23),(580,23),(581,23),(582,23),(701,23),(703,23),(704,23),(705,23),(706,23),(707,23),(708,23),(709,23),(757,23),(758,23),(759,23),(760,23),(763,23);
/*!40000 ALTER TABLE `tnetwork_profile_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tnetwork_profile_pen`
--

DROP TABLE IF EXISTS `tnetwork_profile_pen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tnetwork_profile_pen` (
  `pen` int(10) unsigned NOT NULL,
  `id_np` int(10) unsigned NOT NULL,
  KEY `fk_network_profile_pen_pen` (`pen`),
  KEY `fk_network_profile_pen_id_np` (`id_np`),
  CONSTRAINT `fk_network_profile_pen_pen` FOREIGN KEY (`pen`) REFERENCES `tpen` (`pen`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_network_profile_pen_id_np` FOREIGN KEY (`id_np`) REFERENCES `tnetwork_profile` (`id_np`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tnetwork_profile_pen`
--

LOCK TABLES `tnetwork_profile_pen` WRITE;
/*!40000 ALTER TABLE `tnetwork_profile_pen` DISABLE KEYS */;
INSERT INTO `tnetwork_profile_pen` VALUES (9,9),(2021,10),(2636,10);
/*!40000 ALTER TABLE `tnetwork_profile_pen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tnetworkmap_ent_rel_nodes`
--

DROP TABLE IF EXISTS `tnetworkmap_ent_rel_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tnetworkmap_ent_rel_nodes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_networkmap_enterprise` int(10) unsigned NOT NULL,
  `parent` int(10) DEFAULT '0',
  `parent_type` varchar(30) DEFAULT 'node',
  `child` int(10) DEFAULT '0',
  `child_type` varchar(30) DEFAULT 'node',
  `deleted` int(10) DEFAULT '0',
  PRIMARY KEY (`id`,`id_networkmap_enterprise`),
  KEY `id_networkmap_enterprise` (`id_networkmap_enterprise`),
  CONSTRAINT `tnetworkmap_ent_rel_nodes_ibfk_1` FOREIGN KEY (`id_networkmap_enterprise`) REFERENCES `tnetworkmap_enterprise` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tnetworkmap_ent_rel_nodes`
--

LOCK TABLES `tnetworkmap_ent_rel_nodes` WRITE;
/*!40000 ALTER TABLE `tnetworkmap_ent_rel_nodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tnetworkmap_ent_rel_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tnetworkmap_enterprise`
--

DROP TABLE IF EXISTS `tnetworkmap_enterprise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tnetworkmap_enterprise` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT '',
  `id_group` int(10) unsigned NOT NULL DEFAULT '0',
  `options` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tnetworkmap_enterprise`
--

LOCK TABLES `tnetworkmap_enterprise` WRITE;
/*!40000 ALTER TABLE `tnetworkmap_enterprise` DISABLE KEYS */;
/*!40000 ALTER TABLE `tnetworkmap_enterprise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tnetworkmap_enterprise_nodes`
--

DROP TABLE IF EXISTS `tnetworkmap_enterprise_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tnetworkmap_enterprise_nodes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_networkmap_enterprise` int(10) unsigned NOT NULL,
  `x` int(10) DEFAULT '0',
  `y` int(10) DEFAULT '0',
  `z` int(10) DEFAULT '0',
  `id_agent` int(10) DEFAULT '0',
  `id_module` int(10) DEFAULT '0',
  `id_agent_module` int(10) DEFAULT '0',
  `parent` int(10) DEFAULT '0',
  `options` text,
  `deleted` int(10) DEFAULT '0',
  `state` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `id_networkmap_enterprise` (`id_networkmap_enterprise`),
  CONSTRAINT `tnetworkmap_enterprise_nodes_ibfk_1` FOREIGN KEY (`id_networkmap_enterprise`) REFERENCES `tnetworkmap_enterprise` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tnetworkmap_enterprise_nodes`
--

LOCK TABLES `tnetworkmap_enterprise_nodes` WRITE;
/*!40000 ALTER TABLE `tnetworkmap_enterprise_nodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tnetworkmap_enterprise_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tnews`
--

DROP TABLE IF EXISTS `tnews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tnews` (
  `id_news` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author` varchar(255) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `text` text NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_group` int(10) NOT NULL DEFAULT '0',
  `modal` tinyint(1) DEFAULT '0',
  `expire` tinyint(1) DEFAULT '0',
  `expire_timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_news`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tnews`
--

LOCK TABLES `tnews` WRITE;
/*!40000 ALTER TABLE `tnews` DISABLE KEYS */;
INSERT INTO `tnews` VALUES (1,'admin','Welcome&#x20;to&#x20;Pandora&#x20;FMS&#x20;Console','&amp;lt;p&#x20;style=&quot;text-align:&#x20;center;&#x20;font-size:&#x20;13px;&quot;&amp;gt;Hello,&#x20;congratulations,&#x20;if&#x20;you&apos;ve&#x20;arrived&#x20;here&#x20;you&#x20;already&#x20;have&#x20;an&#x20;operational&#x20;monitoring&#x20;console.&#x20;Remember&#x20;that&#x20;our&#x20;forums&#x20;and&#x20;online&#x20;documentation&#x20;are&#x20;available&#x20;24x7&#x20;to&#x20;get&#x20;you&#x20;out&#x20;of&#x20;any&#x20;trouble.&#x20;You&#x20;can&#x20;replace&#x20;this&#x20;message&#x20;with&#x20;a&#x20;personalized&#x20;one&#x20;at&#x20;Admin&#x20;tools&#x20;-&amp;amp;gt;&#x20;Site&#x20;news.&amp;lt;/p&amp;gt;&#x20;','2020-09-18 13:42:39',0,0,0,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `tnews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tnode_relations`
--

DROP TABLE IF EXISTS `tnode_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tnode_relations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gateway` varchar(100) NOT NULL,
  `imei` varchar(100) NOT NULL,
  `node_address` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tnode_relations`
--

LOCK TABLES `tnode_relations` WRITE;
/*!40000 ALTER TABLE `tnode_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tnode_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tnota`
--

DROP TABLE IF EXISTS `tnota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tnota` (
  `id_nota` bigint(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `id_incident` bigint(6) unsigned zerofill NOT NULL,
  `id_usuario` varchar(100) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nota` mediumtext NOT NULL,
  PRIMARY KEY (`id_nota`),
  KEY `id_incident` (`id_incident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tnota`
--

LOCK TABLES `tnota` WRITE;
/*!40000 ALTER TABLE `tnota` DISABLE KEYS */;
/*!40000 ALTER TABLE `tnota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tnotification_group`
--

DROP TABLE IF EXISTS `tnotification_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tnotification_group` (
  `id_mensaje` int(10) unsigned NOT NULL,
  `id_group` mediumint(4) unsigned NOT NULL,
  PRIMARY KEY (`id_mensaje`,`id_group`),
  CONSTRAINT `tnotification_group_ibfk_1` FOREIGN KEY (`id_mensaje`) REFERENCES `tmensajes` (`id_mensaje`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tnotification_group`
--

LOCK TABLES `tnotification_group` WRITE;
/*!40000 ALTER TABLE `tnotification_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `tnotification_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tnotification_source`
--

DROP TABLE IF EXISTS `tnotification_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tnotification_source` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `icon` text,
  `max_postpone_time` int(11) DEFAULT NULL,
  `enabled` int(1) DEFAULT NULL,
  `user_editable` int(1) DEFAULT NULL,
  `also_mail` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tnotification_source`
--

LOCK TABLES `tnotification_source` WRITE;
/*!40000 ALTER TABLE `tnotification_source` DISABLE KEYS */;
INSERT INTO `tnotification_source` VALUES (1,'System&#x20;status','icono_info_mr.png',86400,1,1,0),(2,'Message','icono_info_mr.png',86400,1,1,0),(3,'Pending&#x20;task','icono_info_mr.png',86400,1,1,0),(4,'Advertisement','icono_info_mr.png',86400,1,1,0),(5,'Official&#x20;communication','icono_logo_pandora.png',86400,1,1,0),(6,'Sugerence','icono_info_mr.png',86400,1,1,0);
/*!40000 ALTER TABLE `tnotification_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tnotification_source_group`
--

DROP TABLE IF EXISTS `tnotification_source_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tnotification_source_group` (
  `id_source` bigint(20) unsigned NOT NULL,
  `id_group` mediumint(4) unsigned NOT NULL,
  PRIMARY KEY (`id_source`,`id_group`),
  KEY `id_group` (`id_group`),
  CONSTRAINT `tnotification_source_group_ibfk_1` FOREIGN KEY (`id_source`) REFERENCES `tnotification_source` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tnotification_source_group`
--

LOCK TABLES `tnotification_source_group` WRITE;
/*!40000 ALTER TABLE `tnotification_source_group` DISABLE KEYS */;
INSERT INTO `tnotification_source_group` VALUES (2,0);
/*!40000 ALTER TABLE `tnotification_source_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tnotification_source_group_user`
--

DROP TABLE IF EXISTS `tnotification_source_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tnotification_source_group_user` (
  `id_source` bigint(20) unsigned NOT NULL,
  `id_group` mediumint(4) unsigned NOT NULL,
  `id_user` varchar(60) NOT NULL DEFAULT '',
  `enabled` int(1) DEFAULT NULL,
  `also_mail` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_source`,`id_user`),
  KEY `id_user` (`id_user`),
  KEY `id_group` (`id_group`),
  CONSTRAINT `tnotification_source_group_user_ibfk_1` FOREIGN KEY (`id_source`) REFERENCES `tnotification_source` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tnotification_source_group_user_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tusuario` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tnotification_source_group_user_ibfk_3` FOREIGN KEY (`id_group`) REFERENCES `tnotification_source_group` (`id_group`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tnotification_source_group_user`
--

LOCK TABLES `tnotification_source_group_user` WRITE;
/*!40000 ALTER TABLE `tnotification_source_group_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `tnotification_source_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tnotification_source_user`
--

DROP TABLE IF EXISTS `tnotification_source_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tnotification_source_user` (
  `id_source` bigint(20) unsigned NOT NULL,
  `id_user` varchar(60) NOT NULL DEFAULT '',
  `enabled` int(1) DEFAULT NULL,
  `also_mail` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_source`,`id_user`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `tnotification_source_user_ibfk_1` FOREIGN KEY (`id_source`) REFERENCES `tnotification_source` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tnotification_source_user_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tusuario` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tnotification_source_user`
--

LOCK TABLES `tnotification_source_user` WRITE;
/*!40000 ALTER TABLE `tnotification_source_user` DISABLE KEYS */;
INSERT INTO `tnotification_source_user` VALUES (1,'admin',1,0),(5,'admin',1,0);
/*!40000 ALTER TABLE `tnotification_source_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tnotification_user`
--

DROP TABLE IF EXISTS `tnotification_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tnotification_user` (
  `id_mensaje` int(10) unsigned NOT NULL,
  `id_user` varchar(60) NOT NULL,
  `utimestamp_read` bigint(20) DEFAULT NULL,
  `utimestamp_erased` bigint(20) DEFAULT NULL,
  `postpone` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_mensaje`,`id_user`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `tnotification_user_ibfk_1` FOREIGN KEY (`id_mensaje`) REFERENCES `tmensajes` (`id_mensaje`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tnotification_user_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tusuario` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tnotification_user`
--

LOCK TABLES `tnotification_user` WRITE;
/*!40000 ALTER TABLE `tnotification_user` DISABLE KEYS */;
INSERT INTO `tnotification_user` VALUES (12,'admin',NULL,NULL,NULL),(13,'admin',NULL,NULL,NULL),(14,'admin',NULL,NULL,NULL),(15,'admin',NULL,NULL,NULL),(16,'admin',NULL,NULL,NULL),(17,'admin',NULL,NULL,NULL),(19,'admin',NULL,NULL,NULL),(20,'admin',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tnotification_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torigen`
--

DROP TABLE IF EXISTS `torigen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `torigen` (
  `origen` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torigen`
--

LOCK TABLES `torigen` WRITE;
/*!40000 ALTER TABLE `torigen` DISABLE KEYS */;
INSERT INTO `torigen` VALUES ('Operating System event'),('Firewall records'),('Database event'),('Application data'),('Logfiles'),('Other data source'),('Monitoring Event'),('User report'),('Unknown source');
/*!40000 ALTER TABLE `torigen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tpassword_history`
--

DROP TABLE IF EXISTS `tpassword_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tpassword_history` (
  `id_pass` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` varchar(60) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `date_begin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_end` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_pass`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tpassword_history`
--

LOCK TABLES `tpassword_history` WRITE;
/*!40000 ALTER TABLE `tpassword_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `tpassword_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tpen`
--

DROP TABLE IF EXISTS `tpen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tpen` (
  `pen` int(10) unsigned NOT NULL,
  `manufacturer` text,
  `description` text,
  PRIMARY KEY (`pen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tpen`
--

LOCK TABLES `tpen` WRITE;
/*!40000 ALTER TABLE `tpen` DISABLE KEYS */;
INSERT INTO `tpen` VALUES (2,'ibm','IBM'),(4,'unix','Unix'),(9,'cisco','Cisco&#x20;System'),(11,'hp','Hewlett&#x20;Packard'),(63,'apple','Apple Computer, Inc.'),(111,'oracle','Oracle'),(116,'hitachi','Hitachi, Ltd.'),(171,'dlink','D-Link Systems, Inc.'),(173,'netlink','Netlink'),(188,'ascom','Ascom'),(207,'telesis','Allied Telesis, Inc.'),(674,'dell','Dell Inc.'),(2021,'general_snmp','U.C.&#x20;Davis,&#x20;ECE&#x20;Dept.&#x20;Tom'),(2636,'juniper','Juniper&#x20;Networks'),(3375,'f5','F5&#x20;Labs'),(3861,'fujitsu','Fujitsu Network Communications, Inc.'),(6486,'alcatel','Alcatel-Lucent Enterprise'),(6574,'synology','Synology Inc.'),(8072,'general_snmp','Net&#x20;SNMP'),(10002,'frogfoot','Frogfoot Networks'),(12356,'fortinet','Fortinet'),(13062,'ascom','Ascom'),(14988,'mikrotik','MikroTik'),(19464,'hitachi','Hitachi Communication Technologies, Ltd.'),(41112,'ubiquiti','Ubiquiti Networks, Inc.'),(52627,'apple','Apple Inc'),(53526,'dell','Dell ATC');
/*!40000 ALTER TABLE `tpen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tperfil`
--

DROP TABLE IF EXISTS `tperfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tperfil` (
  `id_perfil` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `incident_edit` tinyint(1) NOT NULL DEFAULT '0',
  `incident_view` tinyint(1) NOT NULL DEFAULT '0',
  `incident_management` tinyint(1) NOT NULL DEFAULT '0',
  `agent_view` tinyint(1) NOT NULL DEFAULT '0',
  `agent_edit` tinyint(1) NOT NULL DEFAULT '0',
  `alert_edit` tinyint(1) NOT NULL DEFAULT '0',
  `user_management` tinyint(1) NOT NULL DEFAULT '0',
  `db_management` tinyint(1) NOT NULL DEFAULT '0',
  `alert_management` tinyint(1) NOT NULL DEFAULT '0',
  `pandora_management` tinyint(1) NOT NULL DEFAULT '0',
  `report_view` tinyint(1) NOT NULL DEFAULT '0',
  `report_edit` tinyint(1) NOT NULL DEFAULT '0',
  `report_management` tinyint(1) NOT NULL DEFAULT '0',
  `event_view` tinyint(1) NOT NULL DEFAULT '0',
  `event_edit` tinyint(1) NOT NULL DEFAULT '0',
  `event_management` tinyint(1) NOT NULL DEFAULT '0',
  `agent_disable` tinyint(1) NOT NULL DEFAULT '0',
  `map_view` tinyint(1) NOT NULL DEFAULT '0',
  `map_edit` tinyint(1) NOT NULL DEFAULT '0',
  `map_management` tinyint(1) NOT NULL DEFAULT '0',
  `vconsole_view` tinyint(1) NOT NULL DEFAULT '0',
  `vconsole_edit` tinyint(1) NOT NULL DEFAULT '0',
  `vconsole_management` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tperfil`
--

LOCK TABLES `tperfil` WRITE;
/*!40000 ALTER TABLE `tperfil` DISABLE KEYS */;
INSERT INTO `tperfil` VALUES (1,'Operator&#x20;&#40;Read&#41;',0,1,0,1,0,0,0,0,0,0,1,0,0,1,0,0,0,1,0,0,1,0,0),(2,'Operator&#x20;&#40;Write&#41;',1,1,0,1,0,0,0,0,0,0,1,1,0,1,1,0,0,1,1,0,1,1,0),(3,'Chief&#x20;Operator',1,1,1,1,0,0,0,0,0,0,1,1,1,1,1,0,1,1,1,1,1,1,1),(4,'Group&#x20;coordinator',1,1,1,1,1,1,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1),(5,'Pandora&#x20;Administrator',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1);
/*!40000 ALTER TABLE `tperfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tphase`
--

DROP TABLE IF EXISTS `tphase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tphase` (
  `phase_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) unsigned NOT NULL,
  `agent_id` int(10) unsigned NOT NULL,
  `name` varchar(250) NOT NULL,
  `idx` int(10) unsigned NOT NULL,
  `dependencies` text,
  `enables` text,
  `launch` text,
  `retries` int(10) unsigned DEFAULT NULL,
  `timeout` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`phase_id`,`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tphase`
--

LOCK TABLES `tphase` WRITE;
/*!40000 ALTER TABLE `tphase` DISABLE KEYS */;
/*!40000 ALTER TABLE `tphase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tplanned_downtime`
--

DROP TABLE IF EXISTS `tplanned_downtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tplanned_downtime` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `date_from` bigint(20) NOT NULL DEFAULT '0',
  `date_to` bigint(20) NOT NULL DEFAULT '0',
  `executed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `id_group` mediumint(8) unsigned DEFAULT '0',
  `only_alerts` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `monday` tinyint(1) DEFAULT '0',
  `tuesday` tinyint(1) DEFAULT '0',
  `wednesday` tinyint(1) DEFAULT '0',
  `thursday` tinyint(1) DEFAULT '0',
  `friday` tinyint(1) DEFAULT '0',
  `saturday` tinyint(1) DEFAULT '0',
  `sunday` tinyint(1) DEFAULT '0',
  `periodically_time_from` time DEFAULT NULL,
  `periodically_time_to` time DEFAULT NULL,
  `periodically_day_from` int(100) unsigned DEFAULT NULL,
  `periodically_day_to` int(100) unsigned DEFAULT NULL,
  `type_downtime` varchar(100) NOT NULL DEFAULT 'disabled_agents_alerts',
  `type_execution` varchar(100) NOT NULL DEFAULT 'once',
  `type_periodicity` varchar(100) NOT NULL DEFAULT 'weekly',
  `id_user` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tplanned_downtime`
--

LOCK TABLES `tplanned_downtime` WRITE;
/*!40000 ALTER TABLE `tplanned_downtime` DISABLE KEYS */;
/*!40000 ALTER TABLE `tplanned_downtime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tplanned_downtime_agents`
--

DROP TABLE IF EXISTS `tplanned_downtime_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tplanned_downtime_agents` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_agent` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_downtime` mediumint(8) NOT NULL DEFAULT '0',
  `all_modules` tinyint(1) DEFAULT '1',
  `manually_disabled` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_downtime` (`id_downtime`),
  CONSTRAINT `tplanned_downtime_agents_ibfk_1` FOREIGN KEY (`id_downtime`) REFERENCES `tplanned_downtime` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tplanned_downtime_agents`
--

LOCK TABLES `tplanned_downtime_agents` WRITE;
/*!40000 ALTER TABLE `tplanned_downtime_agents` DISABLE KEYS */;
/*!40000 ALTER TABLE `tplanned_downtime_agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tplanned_downtime_modules`
--

DROP TABLE IF EXISTS `tplanned_downtime_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tplanned_downtime_modules` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_agent` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_agent_module` int(10) NOT NULL,
  `id_downtime` mediumint(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_downtime` (`id_downtime`),
  CONSTRAINT `tplanned_downtime_modules_ibfk_1` FOREIGN KEY (`id_downtime`) REFERENCES `tplanned_downtime` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tplanned_downtime_modules`
--

LOCK TABLES `tplanned_downtime_modules` WRITE;
/*!40000 ALTER TABLE `tplanned_downtime_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `tplanned_downtime_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tplugin`
--

DROP TABLE IF EXISTS `tplugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tplugin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` mediumtext,
  `max_timeout` int(4) unsigned NOT NULL DEFAULT '0',
  `max_retries` int(4) unsigned NOT NULL DEFAULT '0',
  `execute` varchar(250) NOT NULL,
  `net_dst_opt` varchar(50) DEFAULT '',
  `net_port_opt` varchar(50) DEFAULT '',
  `user_opt` varchar(50) DEFAULT '',
  `pass_opt` varchar(50) DEFAULT '',
  `plugin_type` int(2) unsigned NOT NULL DEFAULT '0',
  `macros` text,
  `parameters` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tplugin`
--

LOCK TABLES `tplugin` WRITE;
/*!40000 ALTER TABLE `tplugin` DISABLE KEYS */;
INSERT INTO `tplugin` VALUES (1,'IPMI&#x20;Plugin','Plugin&#x20;to&#x20;get&#x20;IPMI&#x20;monitors&#x20;from&#x20;a&#x20;IPMI&#x20;Device.',0,0,'/usr/share/pandora_server/util/plugin/ipmi-plugin.pl','','','','',0,'{\"1\":{\"macro\":\"_field1_\",\"desc\":\"Target&#x20;IP\",\"help\":\"\",\"value\":\"\",\"hide\":\"\"},\"2\":{\"macro\":\"_field2_\",\"desc\":\"Username\",\"help\":\"\",\"value\":\"\",\"hide\":\"\"},\"3\":{\"macro\":\"_field3_\",\"desc\":\"Password\",\"help\":\"\",\"value\":\"\",\"hide\":\"true\"},\"4\":{\"macro\":\"_field4_\",\"desc\":\"Sensor\",\"help\":\"\",\"value\":\"\",\"hide\":\"\"},\"5\":{\"macro\":\"_field5_\",\"desc\":\"Additional&#x20;Options\",\"help\":\"\",\"value\":\"\",\"hide\":\"\"}}','-h&#x20;_field1_&#x20;-u&#x20;_field2_&#x20;-p&#x20;_field3_&#x20;-s&#x20;_field4_&#x20;--&#x20;_field5_'),(2,'DNS&#x20;Plugin','This&#x20;plugin&#x20;is&#x20;used&#x20;to&#x20;check&#x20;if&#x20;a&#x20;specific&#x20;domain&#x20;return&#x20;a&#x20;specific&#x20;IP&#x20;address,&#x20;and&#x20;to&#x20;check&#x20;how&#x20;time&#x20;&#40;milisecs&#41;&#x20;takes&#x20;the&#x20;DNS&#x20;to&#x20;answer.&#x20;Use&#x20;IP&#x20;address&#x20;parameter&#x20;to&#x20;specify&#x20;the&#x20;IP&#x20;of&#x20;your&#x20;domain.&#x20;Use&#x20;these&#x20;custom&#x20;parameters&#x20;for&#x20;the&#x20;other&#x20;parameters:&#x0d;&#x0a;&#x0d;&#x0a;-d&#x20;domain&#x20;to&#x20;check&#x20;&#40;for&#x20;example&#x20;pandorafms.com&#41;&#x0d;&#x0a;-s&#x20;DNS&#x20;Server&#x20;to&#x20;check&#x20;&#x20;&#40;for&#x20;example&#x20;8.8.8.8&#41;&#x0d;&#x0a;&#x0d;&#x0a;Optional&#x20;parameters:&#x0d;&#x0a;&#x0d;&#x0a;-t&#x20;Do&#x20;a&#x20;DNS&#x20;time&#x20;response&#x20;check&#x20;instead&#x20;DNS&#x20;resolve&#x20;test&#x0d;&#x0a;&#x0d;&#x0a;',15,0,'/usr/share/pandora_server/util/plugin/dns_plugin.sh','','','','',0,'{\"1\":{\"macro\":\"_field1_\",\"desc\":\"Target&#x20;IP\",\"help\":\"\",\"value\":\"\"},\"2\":{\"macro\":\"_field2_\",\"desc\":\"Domain&#x20;to&#x20;check\",\"help\":\"For&#x20;example&#x20;pandorafms.com\",\"value\":\"\"},\"3\":{\"macro\":\"_field3_\",\"desc\":\"DNS&#x20;Server&#x20;to&#x20;check\",\"help\":\"For&#x20;example&#x20;8.8.8.8\",\"value\":\"\"},\"4\":{\"macro\":\"_field4_\",\"desc\":\"Optional&#x20;parameters\",\"help\":\"\",\"value\":\"\"}}','-i&#x20;_field1_&#x20;-d&#x20;_field2_&#x20;-s&#x20;_field3_&#x20;_field4_'),(3,'UDP&#x20;port&#x20;check','Check&#x20;a&#x20;remote&#x20;UDP&#x20;port&#x20;&#40;by&#x20;using&#x20;NMAP&#41;.&#x20;Use&#x20;IP&#x20;address&#x20;and&#x20;Port&#x20;options.',5,0,'/usr/share/pandora_server/util/plugin/udp_nmap_plugin.sh','','','','',0,'{\"1\":{\"macro\":\"_field1_\",\"desc\":\"Target&#x20;IP\",\"help\":\"\",\"value\":\"\"},\"2\":{\"macro\":\"_field2_\",\"desc\":\"Port\",\"help\":\"\",\"value\":\"\"}}','-t&#x20;_field1_&#x20;-p&#x20;_field2_'),(4,'SMTP&#x20;Check','This&#x20;plugin&#x20;is&#x20;used&#x20;to&#x20;send&#x20;a&#x20;mail&#x20;to&#x20;a&#x20;SMTP&#x20;server&#x20;and&#x20;check&#x20;if&#x20;works.&#x20;&#x0d;&#x0a;&#x0d;&#x0a;Parameters&#x20;in&#x20;the&#x20;plugin:&#x0d;&#x0a;&#x0d;&#x0a;IP&#x20;Address&#x20;-&#x20;SMTP&#x20;Server&#x20;IP&#x20;address&#x0d;&#x0a;User&#x20;-&#x20;AUTH&#x20;login&#x20;&#x20;&#x0d;&#x0a;Pass&#x20;-&#x20;AUTH&#x20;password&#x0d;&#x0a;Port&#x20;-&#x20;SMTP&#x20;port&#x20;&#40;optional&#41;&#x0d;&#x0a;&#x0d;&#x0a;Optional&#x20;parameters:&#x0d;&#x0a;&#x0d;&#x0a;-d&#x20;Destination&#x20;email&#x0d;&#x0a;-f&#x20;Email&#x20;of&#x20;the&#x20;sender&#x0d;&#x0a;-a&#x20;Authentication&#x20;system.&#x20;Could&#x20;be&#x20;LOGIN,&#x20;PLAIN,&#x20;CRAM-MD5&#x20;or&#x20;DIGEST-MD',10,0,'/usr/share/pandora_server/util/plugin/SMTP_check.pl','','','','',0,'{\"1\":{\"macro\":\"_field1_\",\"desc\":\"Target&#x20;IP\",\"help\":\"\",\"value\":\"\"},\"2\":{\"macro\":\"_field2_\",\"desc\":\"Port\",\"help\":\"\",\"value\":\"\"},\"3\":{\"macro\":\"_field3_\",\"desc\":\"Username\",\"help\":\"\",\"value\":\"\"},\"4\":{\"macro\":\"_field4_\",\"desc\":\"Password\",\"help\":\"\",\"value\":\"\"},\"5\":{\"macro\":\"_field5_\",\"desc\":\"Optional&#x20;parameters\",\"help\":\"\",\"value\":\"\"}}','-h&#x20;_field1_&#x20;-o&#x20;_field2_&#x20;-u&#x20;_field3_&#x20;-p&#x20;_field4_&#x20;_field5_'),(6,'MySQL&#x20;Plugin','Samples:&#x0d;&#x0a;&#x20;&#x20;&#x20;./mysql_plugin.sh&#x20;-u&#x20;root&#x20;-p&#x20;none&#x20;-s&#x20;localhost&#x20;-q&#x20;Com_select&#x0d;&#x0a;&#x20;&#x20;&#x20;./mysql_plugin.sh&#x20;-u&#x20;root&#x20;-p&#x20;none&#x20;-s&#x20;localhost&#x20;-q&#x20;Com_update&#x0d;&#x0a;&#x20;&#x20;&#x20;./mysql_plugin.sh&#x20;-u&#x20;root&#x20;-p&#x20;none&#x20;-s&#x20;localhost&#x20;-q&#x20;Connections&#x0d;&#x0a;&#x20;&#x20;&#x20;./mysql_plugin.sh&#x20;-u&#x20;root&#x20;-p&#x20;anypass&#x20;-s&#x20;192.168.50.24&#x20;-q&#x20;Innodb_rows_read&#x0d;&#x0a;',15,0,'/usr/share/pandora_server/util/plugin/mysql_plugin.sh','','','','',0,'{\"1\":{\"macro\":\"_field1_\",\"desc\":\"IP&#x20;address\",\"help\":\"IP&#x20;address\",\"value\":\"\"},\"2\":{\"macro\":\"_field2_\",\"desc\":\"Username\",\"help\":\"Username&#x20;to&#x20;access&#x20;to&#x20;database\",\"value\":\"\"},\"3\":{\"macro\":\"_field3_\",\"desc\":\"Password\",\"help\":\"Password&#x20;to&#x20;access&#x20;to&#x20;database\",\"value\":\"\"},\"4\":{\"macro\":\"_field4_\",\"desc\":\"Query&#x20;string\",\"help\":\"Query&#x20;string&#x20;of&#x20;global&#x20;status.&#x20;For&#x20;example&#x20;&#039;Aborted_connects&#039;&#x20;or&#x20;&#039;Innodb_rows_read&#039;\",\"value\":\"\"}}','-s&#x20;_field1_&#x20;-u&#x20;_field2_&#x20;-p&#x20;_field3_&#x20;-q&#x20;_field4_'),(8,'SNMP&#x20;remote','Plugin&#x20;that&#x20;gets&#x20;remotely,&#x20;using&#x20;SNMP,&#x20;values&#x20;such&#x20;as&#x20;the&#x20;percentage&#x20;of&#x20;disk&#x20;or&#x20;memory&#x20;used,&#x20;the&#x20;status&#x20;of&#x20;a&#x20;process&#x20;or&#x20;the&#x20;CPU&#x20;load',0,0,'perl&#x20;/usr/share/pandora_server/util/plugin/snmp_remote.pl','','','','',0,'{\"1\":{\"macro\":\"_field1_\",\"desc\":\"Target&#x20;IP\",\"help\":\"\",\"value\":\"_address_\"},\"2\":{\"macro\":\"_field2_\",\"desc\":\"Community\",\"help\":\"\",\"value\":\"public\"},\"3\":{\"macro\":\"_field3_\",\"desc\":\"Plug-in&#x20;Parameters\",\"help\":\"Memory&#x20;use&#x20;&#40;%&#41;&#x0d;&#x0a;-m&#x20;memuse&#x0d;&#x0a;&#x0d;&#x0a;Disk&#x20;use&#x20;&#40;%&#41;&#x0d;&#x0a;-m&#x20;diskuse&#x20;-d&#x20;[disk&#x20;name]&#x0d;&#x0a;&#x0d;&#x0a;Status&#x20;of&#x20;a&#x20;process&#x20;&#40;0/1&#41;&#x0d;&#x0a;-m&#x20;process&#x20;-p&#x20;[process_name]&#x20;&#x0d;&#x0a;&#x0d;&#x0a;Average&#x20;of&#x20;CPUs&#x20;Load&#x20;&#40;%&#41;&#x0d;&#x0a;-m&#x20;cpuload\",\"value\":\"\"}}','-H&#x20;_field1_&#x20;-c&#x20;_field2_&#x20;_field3_'),(9,'Packet&#x20;Loss','Checks&#x20;for&#x20;dropped&#x20;packages&#x20;after&#x20;X&#x20;seconds&#x20;of&#x20;testing.&#x20;It&#x20;returns&#x20;%&#x20;of&#x20;dropped&#x20;packets.&#x20;It&#x20;uses&#x20;ping&#x20;flood&#x20;mode&#x20;to&#x20;launch&#x20;50&#x20;consecutive&#x20;pings&#x20;to&#x20;a&#x20;remote&#x20;destination.&#x20;On&#x20;local,&#x20;stable&#x20;networks,&#x20;value&#x20;should&#x20;be&#x20;0.&#x0d;&#x0a;',30,0,'/usr/share/pandora_server/util/plugin/packet_loss.sh','','','','',0,'{\"1\":{\"macro\":\"_field1_\",\"desc\":\"Test&#x20;time\",\"help\":\"\",\"value\":\"8\",\"hide\":\"\"},\"2\":{\"macro\":\"_field2_\",\"desc\":\"Target&#x20;IP\",\"help\":\"\",\"value\":\"\",\"hide\":\"\"}}','_field1_&#x20;_field2_'),(10,'Wizard&#x20;SNMP&#x20;module','Get&#x20;the&#x20;result&#x20;of&#x20;an&#x20;arithmetic&#x20;operation&#x20;using&#x20;several&#x20;OIDs&#x20;values.',20,0,'/usr/share/pandora_server/util/plugin/wizard_snmp_module',NULL,NULL,NULL,NULL,0,'{\"1\":{\"macro\":\"_field1_\",\"desc\":\"Host\",\"help\":\"\",\"value\":\"_address_\",\"hide\":\"\"},\"2\":{\"macro\":\"_field2_\",\"desc\":\"Port\",\"help\":\"\",\"value\":\"161\",\"hide\":\"\"},\"3\":{\"macro\":\"_field3_\",\"desc\":\"Version\",\"help\":\"1,&#x20;2c,&#x20;3\",\"value\":\"1\",\"hide\":\"\"},\"4\":{\"macro\":\"_field4_\",\"desc\":\"Community\",\"help\":\"\",\"value\":\"public\",\"hide\":\"\"},\"5\":{\"macro\":\"_field5_\",\"desc\":\"Security&#x20;level&#x20;&#40;v3&#41;\",\"help\":\"noAuthNoPriv,&#x20;authNoPriv,&#x20;authPriv\",\"value\":\"\",\"hide\":\"\"},\"6\":{\"macro\":\"_field6_\",\"desc\":\"Username&#x20;&#40;v3&#41;\",\"help\":\"\",\"value\":\"\",\"hide\":\"\"},\"7\":{\"macro\":\"_field7_\",\"desc\":\"Authentication&#x20;method&#x20;&#40;v3&#41;\",\"help\":\"MD5,&#x20;SHA\",\"value\":\"\",\"hide\":\"\"},\"8\":{\"macro\":\"_field8_\",\"desc\":\"Authentication&#x20;password&#x20;&#40;v3&#41;\",\"help\":\"\",\"value\":\"\",\"hide\":\"1\"},\"9\":{\"macro\":\"_field9_\",\"desc\":\"Privacy&#x20;method&#x20;&#40;v3&#41;\",\"help\":\"DES,&#x20;AES\",\"value\":\"\",\"hide\":\"\"},\"10\":{\"macro\":\"_field10_\",\"desc\":\"Privacy&#x20;password&#x20;&#40;v3&#41;\",\"help\":\"\",\"value\":\"\",\"hide\":\"1\"},\"11\":{\"macro\":\"_field11_\",\"desc\":\"OID&#x20;list\",\"help\":\"Comma&#x20;separated&#x20;OIDs&#x20;used\",\"value\":\"\",\"hide\":\"\"},\"12\":{\"macro\":\"_field12_\",\"desc\":\"Operation\",\"help\":\"Aritmetic&#x20;operation&#x20;to&#x20;get&#x20;data.&#x20;Macros&#x20;_oN_&#x20;will&#x20;be&#x20;changed&#x20;by&#x20;OIDs&#x20;in&#x20;list.&#x20;Example:&#x20;&#40;_o1_&#x20;*&#x20;100&#41;&#x20;/&#x20;_o2_\",\"value\":\"\",\"hide\":\"\"}}','-host&#x20;&#039;_field1_&#039;&#x20;-port&#x20;&#039;_field2_&#039;&#x20;-version&#x20;&#039;_field3_&#039;&#x20;-community&#x20;&#039;_field4_&#039;&#x20;-secLevel&#x20;&#039;_field5_&#039;&#x20;-user&#x20;&#039;_field6_&#039;&#x20;-authMethod&#x20;&#039;_field7_&#039;&#x20;-authPass&#x20;&#039;_field8_&#039;&#x20;-privMethod&#x20;&#039;_field9_&#039;&#x20;-privPass&#x20;&#039;_field10_&#039;&#x20;-oidList&#x20;&#039;_field11_&#039;&#x20;-operation&#x20;&#039;_field12_&#039;'),(11,'Wizard&#x20;SNMP&#x20;process','Check&#x20;if&#x20;a&#x20;process&#x20;is&#x20;running&#x20;&#40;1&#41;&#x20;or&#x20;not&#x20;&#40;0&#41;&#x20;in&#x20;OID&#x20;.1.3.6.1.2.1.25.4.2.1.2&#x20;SNMP&#x20;tree.',20,0,'/usr/share/pandora_server/util/plugin/wizard_snmp_process',NULL,NULL,NULL,NULL,0,'{\"1\":{\"macro\":\"_field1_\",\"desc\":\"Host\",\"help\":\"\",\"value\":\"_address_\",\"hide\":\"\"},\"2\":{\"macro\":\"_field2_\",\"desc\":\"Port\",\"help\":\"\",\"value\":\"161\",\"hide\":\"\"},\"3\":{\"macro\":\"_field3_\",\"desc\":\"Version\",\"help\":\"1,&#x20;2c,&#x20;3\",\"value\":\"1\",\"hide\":\"\"},\"4\":{\"macro\":\"_field4_\",\"desc\":\"Community\",\"help\":\"\",\"value\":\"public\",\"hide\":\"\"},\"5\":{\"macro\":\"_field5_\",\"desc\":\"Security&#x20;level&#x20;&#40;v3&#41;\",\"help\":\"noAuthNoPriv,&#x20;authNoPriv,&#x20;authPriv\",\"value\":\"\",\"hide\":\"\"},\"6\":{\"macro\":\"_field6_\",\"desc\":\"Username&#x20;&#40;v3&#41;\",\"help\":\"\",\"value\":\"\",\"hide\":\"\"},\"7\":{\"macro\":\"_field7_\",\"desc\":\"Authentication&#x20;method&#x20;&#40;v3&#41;\",\"help\":\"MD5,&#x20;SHA\",\"value\":\"\",\"hide\":\"\"},\"8\":{\"macro\":\"_field8_\",\"desc\":\"Authentication&#x20;password&#x20;&#40;v3&#41;\",\"help\":\"\",\"value\":\"\",\"hide\":\"1\"},\"9\":{\"macro\":\"_field9_\",\"desc\":\"Privacy&#x20;method&#x20;&#40;v3&#41;\",\"help\":\"DES,&#x20;AES\",\"value\":\"\",\"hide\":\"\"},\"10\":{\"macro\":\"_field10_\",\"desc\":\"Privacy&#x20;password&#x20;&#40;v3&#41;\",\"help\":\"\",\"value\":\"\",\"hide\":\"1\"},\"11\":{\"macro\":\"_field11_\",\"desc\":\"Process\",\"help\":\"Process&#x20;name&#x20;to&#x20;check&#x20;if&#x20;is&#x20;running&#x20;&#40;case&#x20;sensitive&#41;\",\"value\":\"\",\"hide\":\"\"}}','-host&#x20;&#039;_field1_&#039;&#x20;-port&#x20;&#039;_field2_&#039;&#x20;-version&#x20;&#039;_field3_&#039;&#x20;-community&#x20;&#039;_field4_&#039;&#x20;-secLevel&#x20;&#039;_field5_&#039;&#x20;-user&#x20;&#039;_field6_&#039;&#x20;-authMethod&#x20;&#039;_field7_&#039;&#x20;-authPass&#x20;&#039;_field8_&#039;&#x20;-privMethod&#x20;&#039;_field9_&#039;&#x20;-privPass&#x20;&#039;_field10_&#039;&#x20;-process&#x20;&#039;_field11_&#039;'),(12,'Wizard&#x20;WMI&#x20;module','Get&#x20;the&#x20;result&#x20;of&#x20;an&#x20;arithmetic&#x20;operation&#x20;using&#x20;distinct&#x20;fields&#x20;in&#x20;a&#x20;WMI&#x20;query&#x20;&#40;Query&#x20;must&#x20;return&#x20;only&#x20;1&#x20;row&#41;.',20,0,'/usr/share/pandora_server/util/plugin/wizard_wmi_module',NULL,NULL,NULL,NULL,0,'{\"1\":{\"macro\":\"_field1_\",\"desc\":\"Host\",\"help\":\"\",\"value\":\"_address_\",\"hide\":\"\"},\"2\":{\"macro\":\"_field2_\",\"desc\":\"Namespace&#x20;&#40;Optional&#41;\",\"help\":\"\",\"value\":\"\",\"hide\":\"\"},\"3\":{\"macro\":\"_field3_\",\"desc\":\"User\",\"help\":\"\",\"value\":\"\",\"hide\":\"\"},\"4\":{\"macro\":\"_field4_\",\"desc\":\"Password\",\"help\":\"\",\"value\":\"\",\"hide\":\"1\"},\"5\":{\"macro\":\"_field5_\",\"desc\":\"WMI&#x20;Class\",\"help\":\"\",\"value\":\"\",\"hide\":\"\"},\"6\":{\"macro\":\"_field6_\",\"desc\":\"Fields&#x20;list\",\"help\":\"\",\"value\":\"\",\"hide\":\"\"},\"7\":{\"macro\":\"_field7_\",\"desc\":\"Query&#x20;filter&#x20;&#40;Optional&#41;\",\"help\":\"Use&#x20;single&#x20;quotes&#x20;for&#x20;query&#x20;conditions\",\"value\":\"\",\"hide\":\"\"},\"8\":{\"macro\":\"_field8_\",\"desc\":\"Operation\",\"help\":\"Aritmetic&#x20;operation&#x20;to&#x20;get&#x20;data.&#x20;Macros&#x20;_fN_&#x20;will&#x20;be&#x20;changed&#x20;by&#x20;fields&#x20;in&#x20;list.&#x20;Example:&#x20;&#40;&#40;_f1_&#x20;-&#x20;_f2_&#41;&#x20;*&#x20;100&#41;&#x20;/&#x20;_f1_\",\"value\":\"\",\"hide\":\"\"}}','-host&#x20;&#039;_field1_&#039;&#x20;-namespace&#x20;&#039;_field2_&#039;&#x20;-user&#x20;&#039;_field3_&#039;&#x20;-pass&#x20;&#039;_field4_&#039;&#x20;-wmiClass&#x20;&#039;_field5_&#039;&#x20;-fieldsList&#x20;&#039;_field6_&#039;&#x20;-queryFilter&#x20;&quot;_field7_&quot;&#x20;-operation&#x20;&#039;_field8_&#039;&#x20;-wmicPath&#x20;/usr/bin/wmic');
/*!40000 ALTER TABLE `tplugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tpolicies`
--

DROP TABLE IF EXISTS `tpolicies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tpolicies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `id_group` int(10) unsigned DEFAULT '0',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `force_apply` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tpolicies`
--

LOCK TABLES `tpolicies` WRITE;
/*!40000 ALTER TABLE `tpolicies` DISABLE KEYS */;
INSERT INTO `tpolicies` VALUES (1,'Basic&#x20;Windows&#x20;Monitoring','Basic&#x20;local&#x20;checks&#x20;to&#x20;monitor&#x20;Windows&#x20;Systems.&#x0d;&#x0a;Requires&#x20;Powershell&#x20;3+.',2,0,0),(2,'Basic&#x20;Linux&#x20;Monitoring','Basic&#x20;local&#x20;checks&#x20;to&#x20;monitor:&#x20;&#x0d;&#x0a;-&#x20;CentOS&#x0d;&#x0a;-&#x20;RedHat&#x0d;&#x0a;-&#x20;Debian&#x0d;&#x0a;-&#x20;SUSE',2,0,0),(3,'Basic&#x20;Solaris&#x20;Local&#x20;Monitoring','Basic&#x20;local&#x20;checks&#x20;to&#x20;monitor&#x20;Solaris&#x20;systems.',2,0,0),(4,'Basic&#x20;AIX&#x20;Local&#x20;Monitoring','Basic&#x20;local&#x20;checks&#x20;to&#x20;monitoring&#x20;AIX&#x20;systems.',2,0,0),(5,'Basic&#x20;HP-UX&#x20;Local&#x20;Monitoring','Basic&#x20;local&#x20;checks&#x20;to&#x20;monitoring&#x20;HP/UX&#x20;systems.',2,0,0),(6,'Basic&#x20;Remote&#x20;Checks','Basic&#x20;Remote&#x20;Checks&#x20;&#40;ping,&#x20;latency,&#x20;ports&#41;.',9,0,0);
/*!40000 ALTER TABLE `tpolicies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tpolicy_agents`
--

DROP TABLE IF EXISTS `tpolicy_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tpolicy_agents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_policy` int(10) unsigned DEFAULT '0',
  `id_agent` int(10) unsigned DEFAULT '0',
  `policy_applied` tinyint(1) unsigned DEFAULT '0',
  `pending_delete` tinyint(1) unsigned DEFAULT '0',
  `last_apply_utimestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `id_node` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_policy` (`id_policy`,`id_agent`,`id_node`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tpolicy_agents`
--

LOCK TABLES `tpolicy_agents` WRITE;
/*!40000 ALTER TABLE `tpolicy_agents` DISABLE KEYS */;
/*!40000 ALTER TABLE `tpolicy_agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tpolicy_alerts`
--

DROP TABLE IF EXISTS `tpolicy_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tpolicy_alerts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_policy` int(10) unsigned NOT NULL DEFAULT '0',
  `id_policy_module` int(10) unsigned DEFAULT '0',
  `id_alert_template` int(10) unsigned DEFAULT '0',
  `name_extern_module` text NOT NULL,
  `disabled` tinyint(1) DEFAULT '0',
  `standby` tinyint(1) DEFAULT '0',
  `pending_delete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_alert_template` (`id_alert_template`),
  KEY `id_policy` (`id_policy`),
  CONSTRAINT `tpolicy_alerts_ibfk_1` FOREIGN KEY (`id_alert_template`) REFERENCES `talert_templates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tpolicy_alerts_ibfk_2` FOREIGN KEY (`id_policy`) REFERENCES `tpolicies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tpolicy_alerts`
--

LOCK TABLES `tpolicy_alerts` WRITE;
/*!40000 ALTER TABLE `tpolicy_alerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `tpolicy_alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tpolicy_alerts_actions`
--

DROP TABLE IF EXISTS `tpolicy_alerts_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tpolicy_alerts_actions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_policy_alert` int(10) unsigned NOT NULL,
  `id_alert_action` int(10) unsigned NOT NULL,
  `fires_min` int(3) unsigned DEFAULT '0',
  `fires_max` int(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_policy_alert` (`id_policy_alert`),
  KEY `id_alert_action` (`id_alert_action`),
  CONSTRAINT `tpolicy_alerts_actions_ibfk_1` FOREIGN KEY (`id_policy_alert`) REFERENCES `tpolicy_alerts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tpolicy_alerts_actions_ibfk_2` FOREIGN KEY (`id_alert_action`) REFERENCES `talert_actions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tpolicy_alerts_actions`
--

LOCK TABLES `tpolicy_alerts_actions` WRITE;
/*!40000 ALTER TABLE `tpolicy_alerts_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tpolicy_alerts_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tpolicy_collections`
--

DROP TABLE IF EXISTS `tpolicy_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tpolicy_collections` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_policy` int(10) unsigned NOT NULL DEFAULT '0',
  `id_collection` int(10) unsigned DEFAULT '0',
  `pending_delete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_policy` (`id_policy`),
  KEY `id_collection` (`id_collection`),
  CONSTRAINT `tpolicy_collections_ibfk_1` FOREIGN KEY (`id_policy`) REFERENCES `tpolicies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tpolicy_collections_ibfk_2` FOREIGN KEY (`id_collection`) REFERENCES `tcollection` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tpolicy_collections`
--

LOCK TABLES `tpolicy_collections` WRITE;
/*!40000 ALTER TABLE `tpolicy_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `tpolicy_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tpolicy_groups`
--

DROP TABLE IF EXISTS `tpolicy_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tpolicy_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_policy` int(10) unsigned DEFAULT '0',
  `id_group` int(10) unsigned DEFAULT '0',
  `policy_applied` tinyint(1) unsigned DEFAULT '0',
  `pending_delete` tinyint(1) unsigned DEFAULT '0',
  `last_apply_utimestamp` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_policy` (`id_policy`,`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tpolicy_groups`
--

LOCK TABLES `tpolicy_groups` WRITE;
/*!40000 ALTER TABLE `tpolicy_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `tpolicy_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tpolicy_modules`
--

DROP TABLE IF EXISTS `tpolicy_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tpolicy_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_policy` int(10) unsigned NOT NULL DEFAULT '0',
  `configuration_data` mediumtext NOT NULL,
  `id_tipo_modulo` smallint(5) NOT NULL DEFAULT '0',
  `description` varchar(1024) NOT NULL DEFAULT '',
  `name` varchar(200) NOT NULL DEFAULT '',
  `unit` text,
  `max` bigint(20) DEFAULT '0',
  `min` bigint(20) DEFAULT '0',
  `module_interval` int(4) unsigned DEFAULT '0',
  `ip_target` varchar(100) DEFAULT '',
  `tcp_port` int(4) unsigned DEFAULT '0',
  `tcp_send` text,
  `tcp_rcv` text,
  `snmp_community` varchar(100) DEFAULT '',
  `snmp_oid` varchar(255) DEFAULT '0',
  `id_module_group` int(4) unsigned DEFAULT '0',
  `flag` tinyint(1) unsigned DEFAULT '1',
  `id_module` int(10) DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `id_export` smallint(4) unsigned DEFAULT '0',
  `plugin_user` text,
  `plugin_pass` text,
  `plugin_parameter` text,
  `id_plugin` int(10) DEFAULT '0',
  `post_process` double(24,15) DEFAULT '0.000000000000000',
  `prediction_module` bigint(14) DEFAULT '0',
  `max_timeout` int(4) unsigned DEFAULT '0',
  `max_retries` int(4) unsigned DEFAULT '0',
  `custom_id` varchar(255) DEFAULT '',
  `history_data` tinyint(1) unsigned DEFAULT '1',
  `min_warning` double(18,2) DEFAULT '0.00',
  `max_warning` double(18,2) DEFAULT '0.00',
  `str_warning` text,
  `min_critical` double(18,2) DEFAULT '0.00',
  `max_critical` double(18,2) DEFAULT '0.00',
  `str_critical` text,
  `min_ff_event` int(4) unsigned DEFAULT '0',
  `custom_string_1` text,
  `custom_string_2` text,
  `custom_string_3` text,
  `custom_integer_1` int(10) DEFAULT '0',
  `custom_integer_2` int(10) DEFAULT '0',
  `pending_delete` tinyint(1) DEFAULT '0',
  `critical_instructions` text NOT NULL,
  `warning_instructions` text NOT NULL,
  `unknown_instructions` text NOT NULL,
  `critical_inverse` tinyint(1) unsigned DEFAULT '0',
  `warning_inverse` tinyint(1) unsigned DEFAULT '0',
  `id_category` int(10) DEFAULT '0',
  `module_ff_interval` int(4) unsigned DEFAULT '0',
  `quiet` tinyint(1) NOT NULL DEFAULT '0',
  `cron_interval` varchar(100) DEFAULT '',
  `macros` text,
  `disabled_types_event` text NOT NULL,
  `module_macros` text NOT NULL,
  `min_ff_event_normal` int(4) unsigned DEFAULT '0',
  `min_ff_event_warning` int(4) unsigned DEFAULT '0',
  `min_ff_event_critical` int(4) unsigned DEFAULT '0',
  `ff_type` tinyint(1) unsigned DEFAULT '0',
  `each_ff` tinyint(1) unsigned DEFAULT '0',
  `ff_timeout` int(4) unsigned DEFAULT '0',
  `dynamic_interval` int(4) unsigned DEFAULT '0',
  `dynamic_max` int(4) DEFAULT '0',
  `dynamic_min` int(4) DEFAULT '0',
  `dynamic_next` bigint(20) NOT NULL DEFAULT '0',
  `dynamic_two_tailed` tinyint(1) unsigned DEFAULT '0',
  `prediction_sample_window` int(10) DEFAULT '0',
  `prediction_samples` int(4) DEFAULT '0',
  `prediction_threshold` int(4) DEFAULT '0',
  `cps` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_policy` (`id_policy`,`name`),
  KEY `main_idx` (`id_policy`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tpolicy_modules`
--

LOCK TABLES `tpolicy_modules` WRITE;
/*!40000 ALTER TABLE `tpolicy_modules` DISABLE KEYS */;
INSERT INTO `tpolicy_modules` VALUES (1,1,'module_begin&#x0a;module_name&#x20;Bytes&#x20;per&#x20;second&#x20;&#40;Received&#41;&#x0a;module_type&#x20;generic_data_inc&#x0a;module_exec&#x20;powershell&#x20;-c&#x20;&quot;Get-NetAdapterStatistics&#x20;|Measure-Object&#x20;-Sum&#x20;ReceivedBytes&#x20;|Select&#x20;-ExpandProperty&#x20;Sum&quot;&#x0a;module_end&#x0a;&#x0a;&#x0a;&#x0a;',4,'','Bytes&#x20;per&#x20;second&#x20;&#40;Received&#41;','',0,0,1,'',0,'','','','',1,1,1,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(2,1,'module_begin&#x0a;module_name&#x20;Bytes&#x20;per&#x20;second&#x20;&#40;Sent&#41;&#x0a;module_type&#x20;generic_data_inc&#x0a;module_exec&#x20;powershell&#x20;-c&#x20;&quot;Get-NetAdapterStatistics&#x20;|Measure-Object&#x20;-Sum&#x20;SentBytes&#x20;|Select&#x20;-ExpandProperty&#x20;Sum&quot;&#x0a;module_end&#x0a;&#x0a;&#x0a;&#x0a;&#x0a;',4,'','Bytes&#x20;per&#x20;second&#x20;&#40;Sent&#41;','',0,0,1,'',0,'','','','',1,1,1,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(3,1,'module_begin&#x0a;module_name&#x20;CPU&#x20;%&#x0a;module_type&#x20;generic_data&#x0a;module_cpuusage&#x20;all&#x0a;module_unit&#x20;%&#x0a;module_min_warning&#x20;79.00&#x0a;module_end&#x0a;&#x0a;&#x0a;&#x0a;&#x0a;&#x0a;',1,'CPU&#x20;usage&#x20;&#40;%&#41;','CPU&#x20;%','%',0,0,1,'',0,'','','','',4,1,1,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,79.00,90.00,'',91.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(4,1,'module_begin&#x0a;module_name&#x20;Total&#x20;processes&#x0a;module_type&#x20;generic_data&#x0a;module_exec&#x20;tasklist&#x20;|&#x20;wc&#x20;-l&#x20;|&#x20;gawk&#x20;&quot;{print&#x20;$1}&quot;&#x0a;module_end&#x0a;&#x0a;&#x0a;',1,'','Total&#x20;processes','',0,0,1,'',0,'','','','',4,1,1,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(5,1,'module_begin&#x0a;module_name&#x20;Uptime&#x0a;module_type&#x20;generic_data&#x0a;module_exec&#x20;powershell&#x20;-c&#x20;&quot;&#40;get-date&#41;&#x20;-&#x20;&#40;gcim&#x20;Win32_OperatingSystem&#41;.LastBootUpTime&#x20;|Select&#x20;-ExpandProperty&#x20;Ticks&quot;&#x0a;module_end&#x0a;&#x0a;&#x0a;&#x0a;&#x0a;',1,'','Uptime','_timeticks_',0,0,1,'',0,'','','','',4,1,1,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(6,1,'module_begin&#x0a;module_name&#x20;WMI&#x20;Service&#x0a;module_type&#x20;generic_proc&#x0a;module_service&#x20;winmgmt&#x0a;module_end&#x0a;&#x0a;',2,'WMI&#x20;Service&#x20;enabled','WMI&#x20;Service','',0,0,1,'',0,'','','','',3,1,1,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(7,2,'module_begin&#x0a;module_name&#x20;Bytes&#x20;per&#x20;second&#x20;&#40;Received&#41;&#x0a;module_type&#x20;generic_data_inc&#x0a;module_exec&#x20;awk&#x20;&#039;!/lo:/&#x20;{s+=$2}END{print&#x20;s}&#039;&#x20;/proc/net/dev&#x0a;module_min_warning&#x20;0&#x0a;module_max_warning&#x20;0&#x0a;module_min_critical&#x20;0&#x0a;module_max_critical&#x20;0&#x0a;module_end&#x0a;&#x0a;',4,'','Bytes&#x20;per&#x20;second&#x20;&#40;Received&#41;','bytes/sec',0,0,1,'',0,'','','','',1,1,1,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(8,2,'module_begin&#x0a;module_name&#x20;Bytes&#x20;per&#x20;second&#x20;&#40;Sent&#41;&#x0a;module_type&#x20;generic_data_inc&#x0a;module_exec&#x20;awk&#x20;&#039;!/lo:/&#x20;{s+=$10}END{print&#x20;s}&#039;&#x20;/proc/net/dev&#x0a;module_min_warning&#x20;0&#x0a;module_max_warning&#x20;0&#x0a;module_min_critical&#x20;0&#x0a;module_max_critical&#x20;0&#x0a;module_end&#x0a;',4,'','Bytes&#x20;per&#x20;second&#x20;&#40;Sent&#41;','bytes/sec',0,0,1,'',0,'','','','',1,1,1,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(9,2,'module_begin&#x0a;module_name&#x20;CPU&#x20;%&#x0a;module_type&#x20;generic_data&#x0a;module_exec&#x20;vmstat&#x20;1&#x20;1&#x20;|&#x20;tail&#x20;-1&#x20;|&#x20;awk&#x20;&#039;{&#x20;print&#x20;$13&#x20;+&#x20;$14&#x20;}&#039;&#x0a;module_unit&#x20;%&#x0a;module_end&#x0a;&#x0a;',1,'Current&#x20;use&#x20;of&#x20;CPU&#x20;&#40;System&#x20;+&#x20;User&#41;.','CPU&#x20;%','%',0,0,1,'',0,'','','','',4,1,1,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(10,2,'module_begin&#x0a;module_name&#x20;I/O&#x20;Lock&#x0a;module_type&#x20;generic_data&#x0a;module_exec&#x20;vmstat&#x20;1&#x20;1&#x20;|&#x20;tail&#x20;-1&#x20;|&#x20;awk&#x20;&#039;{print&#x20;$16}&#039;&#x0a;module_description&#x20;I/O&#x20;Wait&#x20;Disk&#x0a;module_end&#x0a;&#x0a;&#x0a;',1,'','I/O&#x20;Lock','',0,0,1,'',0,'','','','',4,1,1,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(11,2,'module_begin&#x20;&#x0a;module_name&#x20;Load&#x20;Average&#x0a;module_type&#x20;generic_data&#x0a;module_exec&#x20;cat&#x20;/proc/loadavg&#x20;|awk&#x20;&#039;{print&#x20;$2}&#039;&#x0a;module_end&#x0a;&#x0a;',1,'Average&#x20;process&#x20;in&#x20;CPU&#x20;&#40;Last&#x20;5&#x20;minutes&#41;.','Load&#x20;Average','',0,0,1,'',0,'','','','',4,1,1,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(12,2,'module_begin&#x0a;module_name&#x20;Port&#x20;22&#x20;Open&#x20;&#40;SSH&#41;&#x0a;module_type&#x20;generic_proc&#x0a;module_exec&#x20;echo&#x20;&gt;&#x20;/dev/tcp/127.0.0.1/22&#x20;&gt;/dev/null&#x20;2&gt;&amp;1&#x20;&amp;&amp;&#x20;echo&#x20;1&#x20;||&#x20;echo&#x20;0&#x0a;module_end&#x0a;&#x0a;&#x0a;&#x0a;&#x0a;&#x0a;',2,'Checks&#x20;if&#x20;port&#x20;22&#x20;&#40;SSH&#41;&#x20;is&#x20;listening.','Port&#x20;22&#x20;Open&#x20;&#40;SSH&#41;','',0,0,1,'',0,'','','','',3,1,1,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(13,2,'module_begin&#x0a;module_name&#x20;Total&#x20;processes&#x0a;module_type&#x20;generic_data&#x0a;module_exec&#x20;ps&#x20;ax&#x20;|&#x20;tail&#x20;-n&#x20;+2&#x20;|&#x20;wc&#x20;-l&#x0a;module_description&#x20;Total&#x20;processes&#x0a;module_end',1,'','Total&#x20;processes','',0,0,1,'',0,'','','','',4,1,1,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(14,2,'module_begin&#x0a;module_name&#x20;Uptime&#x0a;module_type&#x20;generic_data&#x0a;module_exec&#x20;awk&#x20;&#039;{print&#x20;$1*100}&#039;&#x20;/proc/uptime&#x0a;module_end&#x0a;',1,'Host&#x20;Up&#x20;time&#x20;&#40;Timeticks&#41;','Uptime','_timeticks_',0,0,1,'',0,'','','','',1,1,1,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(15,3,'module_begin&#x0a;module_name&#x20;CPU&#x20;%&#x0a;module_type&#x20;generic_data&#x0a;module_exec&#x20;vmstat&#x20;1&#x20;1&#x20;|&#x20;tail&#x20;-1|&#x20;awk&#x20;&#039;{print&#x20;&#40;100-$NF&#41;}&#039;&#x0a;module_unit&#x20;%&#x0a;module_end&#x0a;',1,'CPU&#x20;usage&#x20;%','CPU&#x20;%','%',0,0,1,'',0,'','','','',4,1,1,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(16,3,'module_begin&#x0d;&#x0a;module_name&#x20;Disk&#x20;/&#x20;usage&#x20;&#40;%&#41;&#x0d;&#x0a;module_type&#x20;generic_data&#x0d;&#x0a;module_exec&#x20;df&#x20;-k&#x20;/&#x20;|&#x20;tail&#x20;-1&#x20;|&#x20;tr&#x20;-d&#x20;&quot;%&quot;&#x20;|&#x20;awk&#x20;&#039;{print&#x20;$5}&#039;&#x0d;&#x0a;module_end&#x0d;&#x0a;&#x0d;&#x0a;&#x0d;&#x0a;&#x0d;&#x0a;',1,'Disk&#x20;use&#x20;percentage&#x20;for&#x20;root&#x20;partition&#x20;&#40;/&#41;','Disk&#x20;/&#x20;usage&#x20;&#40;%&#41;','',0,0,1,'',0,'','','','',1,1,1,0,0,'','','',0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *','','{\"going_unknown\":0}','W10=',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(17,3,'module_begin&#x0d;&#x0a;module_name&#x20;Disk&#x20;/var&#x20;usage&#x20;&#40;%&#41;&#x0d;&#x0a;module_type&#x20;generic_data&#x0d;&#x0a;module_exec&#x20;df&#x20;-k&#x20;/var&#x20;|&#x20;tail&#x20;-1&#x20;|&#x20;tr&#x20;-d&#x20;&quot;%&quot;&#x20;|&#x20;awk&#x20;&#039;{print&#x20;$5}&#039;&#x0d;&#x0a;module_end&#x0d;&#x0a;&#x0d;&#x0a;&#x0d;&#x0a;&#x0d;&#x0a;',1,'Disk&#x20;use&#x20;percentage&#x20;for&#x20;var&#x20;partition&#x20;&#40;/var&#41;','Disk&#x20;/var&#x20;usage&#x20;&#40;%&#41;','',0,0,1,'',0,'','','','',1,1,1,0,0,'','','',0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *','','{\"going_unknown\":0}','W10=',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(18,3,'module_begin&#x0a;module_name&#x20;Load&#x20;Average&#x0a;module_type&#x20;generic_data&#x0a;module_exec&#x20;uptime&#x20;|&#x20;awk&#x20;&#039;{print&#x20;$&#40;NF-2&#41;}&#039;&#x20;|&#x20;tr&#x20;-d&#x20;&#039;,&#039;&#x0a;module_end&#x0a;',1,'Load&#x20;average','Load&#x20;Average','',0,0,1,'',0,'','','','',4,1,1,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(19,3,'module_begin&#x0a;module_name&#x20;Memory&#x20;Free&#x20;%&#x0a;module_type&#x20;generic_data&#x0a;module_freepercentmemory&#x0a;module_end&#x0a;&#x0a;&#x0a;&#x0a;&#x0a;',1,'Percentage&#x20;Mem&#x20;Free','Memory&#x20;Free&#x20;%','',0,0,1,'',0,'','','','',4,1,1,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,8.00,15.00,'',0.00,7.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(20,3,'module_begin&#x0a;module_name&#x20;Port&#x20;22&#x20;Open&#x20;&#40;SSH&#41;&#x0a;module_type&#x20;generic_proc&#x0a;module_exec&#x20;timeout&#x20;1&#x20;bash&#x20;-c&#x20;&quot;echo&#x20;&gt;&#x20;/dev/tcp/127.0.0.1/22&quot;&#x20;&gt;/dev/null&#x20;2&gt;&amp;1&#x20;&amp;&amp;&#x20;echo&#x20;1&#x20;||&#x20;echo&#x20;0&#x0a;module_end&#x0a;&#x0a;&#x0a;&#x0a;',2,'Checks&#x20;if&#x20;port&#x20;22&#x20;&#40;SSH&#41;&#x20;is&#x20;listening.','Port&#x20;22&#x20;Open&#x20;&#40;SSH&#41;','',0,0,1,'',0,'','','','',3,1,1,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(21,3,'module_begin&#x0a;module_name&#x20;Swap&#x20;Used&#x20;%&#x0a;module_type&#x20;generic_data&#x0a;module_exec&#x20;swap&#x20;-l&#x20;|tail&#x20;-1&#x20;|&#x20;awk&#x20;&#039;{print&#x20;100&#x20;-&#x20;&#40;$NF&#x20;/&#x20;$&#40;NF-1&#41;&#x20;*&#x20;100&#41;}&#039;&#x0a;module_unit&#x20;%&#x0a;module_end&#x0a;&#x0a;&#x0a;',1,'Swap&#x20;memory&#x20;available&#x20;in&#x20;%','Swap&#x20;Used&#x20;%','%',0,0,1,'',0,'','','','',4,1,1,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(22,3,'module_begin&#x0a;module_name&#x20;Total&#x20;processes&#x0a;module_type&#x20;generic_data&#x0a;module_exec&#x20;ps&#x20;-A&#x20;|&#x20;wc&#x20;-l&#x20;|&#x20;awk&#x20;&#039;{print&#x20;$1}&#039;&#x0a;module_end',1,'Total&#x20;processes','Total&#x20;processes','',0,0,1,'',0,'','','','',4,1,1,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(23,3,'module_beg&#x0a;module_name&#x20;Uptime&#x0a;module_type&#x20;generic_data&#x0a;module_exec&#x20;perl&#x20;-e&#x20;&quot;print&#x20;100*&#40;time&#x20;-&#x20;$&#40;kstat&#x20;-p&#x20;unix:0:system_misc:boot_time&#x20;|awk&#x20;&#039;{print&#x20;$2}&#039;&#41;&#41;&quot;&#x0a;module_end&#x0a;&#x0a;&#x0a;&#x0a;&#x0a;&#x0a;&#x0a;',1,'Host&#x20;Up&#x20;time&#x20;&#40;Timeticks&#41;','Uptime','_timeticks_',0,0,1,'',0,'','','','',4,1,1,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(24,4,'module_begin&#x0a;module_name&#x20;CPU&#x20;%&#x0a;module_type&#x20;generic_data&#x0a;module_exec&#x20;sar&#x20;1&#x20;|&#x20;tail&#x20;-1&#x20;|&#x20;awk&#x20;&#039;{print&#x20;100&#x20;-&#x20;$5}&#039;&#x0a;module_description&#x20;CPU&#x20;usage&#x20;in&#x20;%&#x0a;module_unit&#x20;%&#x0a;module_end',1,'','CPU&#x20;%','%',0,0,1,'',0,'','','','',4,1,1,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(25,4,'module_begin&#x0a;module_name&#x20;CPU&#x20;User&#x0a;module_type&#x20;generic_data&#x0a;module_exec&#x20;sar&#x20;1&#x20;|&#x20;tail&#x20;-1&#x20;|&#x20;awk&#x20;&#039;{print&#x20;$2}&#039;&#x0a;module_description&#x20;CPU&#x20;usage&#x20;in&#x20;%&#x0a;module_unit&#x20;%&#x0a;module_end',1,'','CPU&#x20;User','%',0,0,1,'',0,'','','','',4,1,1,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(26,4,'module_begin&#x20;&#x0a;module_name&#x20;Load&#x20;Average&#x0a;module_type&#x20;generic_data&#x0a;module_exec&#x20;uptime&#x20;|&#x20;awk&#x20;&#039;{print&#x20;$&#40;NF-2&#41;*1}&#039;&#x20;&#x0a;module_description&#x20;Average&#x20;process&#x20;in&#x20;CPU&#x20;&#40;Last&#x20;minute&#41;&#x20;&#x0a;module_end',1,'','Load&#x20;Average','',0,0,1,'',0,'','','','',4,1,1,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(27,4,'module_begin&#x0a;module_name&#x20;Memory&#x20;Free&#x20;%&#x0a;module_type&#x20;generic_data&#x0a;module_exec&#x20;svmon&#x20;-G|grep&#x20;memory&#x20;|&#x20;awk&#x20;&#039;{print&#x20;&#40;1-&#x20;$3/$2&#x20;&#41;*100}&#039;&#x0a;module_description&#x20;Percentage&#x20;Mem&#x20;Free&#x0a;module_end&#x0a;',1,'','Memory&#x20;Free&#x20;%','',0,0,1,'',0,'','','','',4,1,1,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(28,4,'module_begin&#x0a;module_name&#x20;Pagination&#x20;use&#x0a;module_type&#x20;generic_data&#x0a;module_exec&#x20;&#x20;lsps&#x20;-s&#x20;|&#x20;tail&#x20;-1&#x20;|&#x20;awk&#x20;&#039;{print&#x20;$2+0}&#039;&#x0a;module_end',1,'','Pagination&#x20;use','',0,0,1,'',0,'','','','',1,1,1,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(29,4,'module_begin&#x0a;module_name&#x20;Service&#x20;sshd&#x20;status&#x0a;module_type&#x20;generic_proc&#x0a;module_exec&#x20;lssrc&#x20;-a&#x20;|&#x20;grep&#x20;ssh&#x20;|&#x20;grep&#x20;active&#x0a;module_end',2,'','Service&#x20;sshd&#x20;status','',0,0,1,'',0,'','','','',3,1,1,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(30,4,'module_begin&#x0a;module_name&#x20;Uptime&#x0a;module_type&#x20;generic_data_string&#x0a;module_exec&#x20;uptime&#x20;|sed&#x20;&quot;s/us&#92;.*$//g&quot;&#x20;|&#x20;sed&#x20;&quot;s/,&#92;.*$//g&quot;&#x0a;module_description&#x20;Host&#x20;Up&#x20;time&#x0a;module_end&#x0a;',1,'','Uptime','',0,0,1,'',0,'','','','',4,1,1,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(31,5,'module_begin&#x0a;module_name&#x20;CPU&#x20;%&#x0a;module_type&#x20;generic_data&#x0a;module_cpuusage&#x20;all&#x0a;module_unit&#x20;%&#x0a;module_end&#x0a;',1,'','CPU&#x20;%','',0,0,1,'',0,'','','','',4,1,1,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(32,5,'module_begin&#x0a;module_name&#x20;CPU&#x20;User&#x0a;module_type&#x20;generic_data&#x0a;module_exec&#x20;vmstat&#x20;1&#x20;2&#x20;|&#x20;tail&#x20;-1&#x20;|&#x20;awk&#x20;&#039;{&#x20;print&#x20;$&#40;16&#41;&#x20;}&#039;&#x0a;module_description&#x20;%&#x20;of&#x20;User&#x20;CPU&#x0a;module_unit&#x20;%&#x0a;module_end&#x0a;&#x0a;',1,'','CPU&#x20;User','%',0,0,1,'',0,'','','','',4,1,1,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(33,5,'module_begin&#x0a;module_name&#x20;Load&#x20;Average&#x0a;module_type&#x20;generic_data&#x0a;module_exec&#x20;uptime&#x20;|&#x20;awk&#x20;&#039;{print&#x20;$&#40;NF-2&#41;}&#039;&#x20;|&#x20;tr&#x20;-d&#x20;&#039;,&#039;&#x0a;module_description&#x20;System&#x20;load&#x20;average&#x0a;module_end&#x0a;',1,'','Load&#x20;Average','',0,0,1,'',0,'','','','',4,1,1,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(34,5,'module_begin&#x0a;module_name&#x20;Memory&#x20;Free&#x20;%&#x0a;module_type&#x20;generic_data&#x0a;module_exec&#x20;echo&#x20;&quot;&quot;&#x20;&gt;&#x20;/tmp/hpvm_toptest;&#x20;top&#x20;-d&#x20;1&#x20;-f&#x20;/tmp/hpvm_toptest&#x20;2&gt;/dev/null&#x20;1&gt;/dev/null;&#x20;cat&#x20;/tmp/hpvm_toptest&#x20;|&#x20;grep&#x20;-i&#x20;Memory&#x20;|&#x20;head&#x20;-1&#x20;|&#x20;awk&#x20;&#039;{print&#x20;$8/&#40;$2+$5&#41;&#x20;*&#x20;100}&#039;&#x0a;module_end&#x0a;&#x0a;&#x0a;',1,'','Memory&#x20;Free&#x20;%','',0,0,1,'',0,'','','','',4,1,1,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(35,5,'module_begin&#x0a;module_name&#x20;&#x20;Service&#x20;sshd&#x20;status&#x0a;module_type&#x20;generic_proc&#x0a;module_exec&#x20;ps&#x20;-ef&#x20;|&#x20;grep&#x20;&#x20;-v&#x20;grep&#x20;|&#x20;grep&#x20;&quot;/opt/ssh/sbin/sshd&quot;&#x20;|&#x20;wc&#x20;-l&#x0a;module_description&#x20;SSH&#x20;running&#x0a;module_end&#x0a;&#x0a;',2,'','Service&#x20;sshd&#x20;status','',0,0,1,'',0,'','','','',3,1,1,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(36,5,'module_begin&#x0a;module_name&#x20;Total&#x20;processes&#x0a;module_type&#x20;generic_data&#x0a;module_exec&#x20;echo&#x20;$&#40;&#40;&#40;`ps&#x20;-e&#x20;|&#x20;wc&#x20;-l`&#41;-1&#41;&#41;&#x20;|&#x20;tr&#x20;-d&#x20;&ldquo;&#92;n&rdquo;&#x0a;module_description&#x20;Total&#x20;processes&#x0a;module_end&#x0a;&#x0a;',1,'','Total&#x20;processes','',0,0,1,'',0,'','','','',4,1,1,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(37,5,'module_begin&#x0a;module_name&#x20;Uptime&#x0a;module_type&#x20;generic_data_string&#x0a;module_exec&#x20;uptime&#x20;|sed&#x20;s/us&#92;.*$//g&#x20;|&#x20;sed&#x20;s/,&#92;.*$//g&#x0a;module_description&#x20;Host&#x20;Up&#x20;time&#x0a;module_end&#x0a;',3,'','Uptime','',0,0,1,'',0,'','','','',4,1,1,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(38,5,'module_begin&#x0a;module_name&#x20;Zombie&#x20;processes&#x0a;module_type&#x20;generic_data&#x0a;module_exec&#x20;ps&#x20;-&shy;elf&#x20;|&#x20;awk&#x20;&#039;$2~/&#039;Z&#039;/{print&#x20;$2}&#039;&#x20;|&#x20;wc&#x20;-l&#x20;|&#x20;tr&#x20;-d&#x20;&quot;&#92;n&quot;&#x0a;module_description&#x20;Zombie&#x20;processes&#x0a;module_end&#x0a;',1,'','Zombie&#x20;processes','',0,0,1,'',0,'','','','',4,1,1,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(39,6,'',6,'','Host&#x20;Alive','',0,0,300,'',0,'','','','',2,1,2,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(40,6,'',7,'','Host&#x20;Latency','',0,0,300,'',0,'','','','',2,1,2,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,80.00,149.00,'',150.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(41,6,'',2,'Checks&#x20;if&#x20;port&#x20;161&#x20;is&#x20;open&#x20;and&#x20;reachable&#x20;for&#x20;Pandora&#x20;FMS&#x20;server.','SNMP&#x20;Available','',0,0,300,'',0,'','','','',1,1,4,0,0,'','','_field1_;Target&#x20;IP;;_address_--_field2_;Port;;161',3,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *','{\"1\":{\"macro\":\"_field1_\",\"desc\":\"Target IP\",\"help\":\"\",\"value\":\"_address_\"},\"2\":{\"macro\":\"_field2_\",\"desc\":\"Port\",\"help\":\"\",\"value\":\"161\"}}','{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(42,6,'',9,'Checks&#x20;if&#x20;port&#x20;22&#x20;is&#x20;open&#x20;and&#x20;reachable&#x20;for&#x20;Pandora&#x20;FMS&#x20;server.','SSH&#x20;Reachable','',0,0,300,'',22,'','','','',2,1,2,0,0,NULL,NULL,NULL,0,0.000000000000000,0,0,0,'',1,0.00,0.00,'',0.00,0.00,'',0,NULL,NULL,NULL,0,0,0,'','','',0,0,0,0,0,'* * * * *',NULL,'{\"going_unknown\":0}','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `tpolicy_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tpolicy_modules_inventory`
--

DROP TABLE IF EXISTS `tpolicy_modules_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tpolicy_modules_inventory` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_policy` int(10) unsigned NOT NULL,
  `id_module_inventory` int(10) NOT NULL,
  `interval` int(10) unsigned NOT NULL DEFAULT '3600',
  `username` varchar(100) DEFAULT '',
  `password` varchar(100) DEFAULT '',
  `pending_delete` tinyint(1) DEFAULT '0',
  `custom_fields` mediumblob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_policy` (`id_policy`),
  KEY `id_module_inventory` (`id_module_inventory`),
  CONSTRAINT `tpolicy_modules_inventory_ibfk_1` FOREIGN KEY (`id_policy`) REFERENCES `tpolicies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tpolicy_modules_inventory_ibfk_2` FOREIGN KEY (`id_module_inventory`) REFERENCES `tmodule_inventory` (`id_module_inventory`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tpolicy_modules_inventory`
--

LOCK TABLES `tpolicy_modules_inventory` WRITE;
/*!40000 ALTER TABLE `tpolicy_modules_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `tpolicy_modules_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tpolicy_plugins`
--

DROP TABLE IF EXISTS `tpolicy_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tpolicy_plugins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_policy` int(10) unsigned DEFAULT '0',
  `plugin_exec` text,
  `pending_delete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tpolicy_plugins`
--

LOCK TABLES `tpolicy_plugins` WRITE;
/*!40000 ALTER TABLE `tpolicy_plugins` DISABLE KEYS */;
INSERT INTO `tpolicy_plugins` VALUES (1,1,'cscript.exe&#x20;//B&#x20;&quot;%ProgramFiles%&#92;Pandora_Agent&#92;util&#92;df_percent_used.vbs&quot;',0),(2,1,'cscript.exe&#x20;//B&#x20;&quot;%ProgramFiles%&#92;Pandora_Agent&#92;util&#92;mem_percent_used.vbs&quot;',0),(3,2,'/etc/pandora/plugins/pandora_df_used',0),(4,2,'/etc/pandora/plugins/pandora_mem_used',0);
/*!40000 ALTER TABLE `tpolicy_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tpolicy_queue`
--

DROP TABLE IF EXISTS `tpolicy_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tpolicy_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_policy` int(10) unsigned NOT NULL DEFAULT '0',
  `id_agent` int(10) unsigned NOT NULL DEFAULT '0',
  `operation` varchar(15) DEFAULT '',
  `progress` int(10) unsigned NOT NULL DEFAULT '0',
  `end_utimestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `priority` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tpolicy_queue`
--

LOCK TABLES `tpolicy_queue` WRITE;
/*!40000 ALTER TABLE `tpolicy_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `tpolicy_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tprofile_view`
--

DROP TABLE IF EXISTS `tprofile_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tprofile_view` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_profile` int(10) unsigned NOT NULL DEFAULT '0',
  `sec` text,
  `sec2` text,
  `sec3` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Table to define by each profile defined in Pandora, to which sec/page has access independently of its ACL (for showing in the console or not). By default have access to all pages allowed by ACL, if forbidden here, then pages are not shown.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tprofile_view`
--

LOCK TABLES `tprofile_view` WRITE;
/*!40000 ALTER TABLE `tprofile_view` DISABLE KEYS */;
INSERT INTO `tprofile_view` VALUES (1,5,'*','*','*');
/*!40000 ALTER TABLE `tprofile_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tprovisioning`
--

DROP TABLE IF EXISTS `tprovisioning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tprovisioning` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `order` int(11) NOT NULL DEFAULT '0',
  `config` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tprovisioning`
--

LOCK TABLES `tprovisioning` WRITE;
/*!40000 ALTER TABLE `tprovisioning` DISABLE KEYS */;
/*!40000 ALTER TABLE `tprovisioning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tprovisioning_rules`
--

DROP TABLE IF EXISTS `tprovisioning_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tprovisioning_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_provisioning` int(10) unsigned NOT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `operator` enum('AND','OR') DEFAULT 'OR',
  `type` enum('alias','ip-range') DEFAULT 'alias',
  `value` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `id_provisioning` (`id_provisioning`),
  CONSTRAINT `tprovisioning_rules_ibfk_1` FOREIGN KEY (`id_provisioning`) REFERENCES `tprovisioning` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tprovisioning_rules`
--

LOCK TABLES `tprovisioning_rules` WRITE;
/*!40000 ALTER TABLE `tprovisioning_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `tprovisioning_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trecon_script`
--

DROP TABLE IF EXISTS `trecon_script`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trecon_script` (
  `id_recon_script` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `description` text,
  `script` varchar(250) DEFAULT '',
  `macros` text,
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_recon_script`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trecon_script`
--

LOCK TABLES `trecon_script` WRITE;
/*!40000 ALTER TABLE `trecon_script` DISABLE KEYS */;
INSERT INTO `trecon_script` VALUES (1,'Discovery.Application.VMware','Discovery&#x20;Application&#x20;script&#x20;to&#x20;monitor&#x20;VMware&#x20;technologies&#x20;&#40;ESXi,&#x20;VCenter,&#x20;VSphere&#41;','/usr/share/pandora_server/util/recon_scripts/vmware-plugin.pl','{\"1\":{\"macro\":\"_field1_\",\"desc\":\"Configuration&#x20;file\",\"help\":\"\",\"value\":\"\",\"hide\":\"\"}}',1),(2,'Discovery.Cloud','Discovery&#x20;Cloud&#x20;script&#x20;to&#x20;monitor&#x20;Cloud&#x20;technologies&#x20;&#40;AWS.EC2,&#x20;AWS.S3,&#x20;AWS.RDS,&#x20RDS,&#x20AWS.EKS&#41;','/usr/share/pandora_server/util/recon_scripts/pcm_client.pl','{\"1\":{\"macro\":\"_field1_\",\"desc\":\"Configuration&#x20;file\",\"help\":\"\",\"value\":\"\",\"hide\":\"\"}}',2),(3,'IPMI&#x20;Recon','Specific&#x20;Pandora&#x20;FMS&#x20;Intel&#x20;DCM&#x20;Discovery&#x20;&#40;c&#41;&#x20;Artica&#x20;ST&#x20;2011&#x20;&lt;info@artica.es&gt;&#x0d;&#x0a;&#x0d;&#x0a;Usage:&#x20;./ipmi-recon.pl&#x20;&lt;task_id&gt;&#x20;&lt;group_id&gt;&#x20;&lt;create_incident_flag&gt;&#x20;&lt;custom_field1&gt;&#x20;&lt;custom_field2&gt;&#x20;&lt;custom_field3&gt;&#x20;&lt;custom_field4&gt;&#x0d;&#x0a;&#x0d;&#x0a;*&#x20;custom_field1&#x20;=&#x20;Network&#x20;i.e.:&#x20;192.168.100.0/24&#x0d;&#x0a;*&#x20;custom_field2&#x20;=&#x20;Username&#x0d;&#x0a;*&#x20;custom_field3&#x20;=&#x20;Password&#x0d;&#x0a;*&#x20;custom_field4&#x20;=&#x20;Additional&#x20;parameters&#x20;i.e.:&#x20;-D&#x20;LAN_2_0','/usr/share/pandora_server/util/recon_scripts/ipmi-recon.pl','{\"1\":{\"macro\":\"_field1_\",\"desc\":\"Network\",\"help\":\"i.e.:&#x20;192.168.100.0/24\",\"value\":\"\",\"hide\":\"\"},\"2\":{\"macro\":\"_field2_\",\"desc\":\"Username\",\"help\":\"\",\"value\":\"\",\"hide\":\"\"},\"3\":{\"macro\":\"_field3_\",\"desc\":\"Password\",\"help\":\"\",\"value\":\"\",\"hide\":\"1\"},\"4\":{\"macro\":\"_field4_\",\"desc\":\"Additional&#x20;parameters\",\"help\":\"Optional&#x20;additional&#x20;parameters&#x20;such&#x20;as&#x20;-D&#x20;LAN_2_0&#x20;to&#x20;use&#x20;IPMI&#x20;ver&#x20;2.0&#x20;instead&#x20;of&#x20;1.5.&#x20;&#x20;These&#x20;options&#x20;will&#x20;also&#x20;be&#x20;passed&#x20;to&#x20;the&#x20;IPMI&#x20;plugin&#x20;when&#x20;the&#x20;current&#x20;values&#x20;are&#x20;read.\",\"value\":\"\",\"hide\":\"\"}}',4);
/*!40000 ALTER TABLE `trecon_script` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trecon_task`
--

DROP TABLE IF EXISTS `trecon_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trecon_task` (
  `id_rt` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(250) NOT NULL DEFAULT '',
  `subnet` text NOT NULL,
  `id_network_profile` text,
  `review_mode` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `id_group` int(10) unsigned NOT NULL DEFAULT '1',
  `utimestamp` bigint(20) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `interval_sweep` int(10) unsigned NOT NULL DEFAULT '0',
  `id_recon_server` int(10) unsigned NOT NULL DEFAULT '0',
  `id_os` tinyint(4) NOT NULL DEFAULT '0',
  `recon_ports` varchar(250) NOT NULL DEFAULT '',
  `snmp_community` varchar(64) NOT NULL DEFAULT 'public',
  `id_recon_script` int(10) DEFAULT NULL,
  `field1` text NOT NULL,
  `field2` varchar(250) NOT NULL DEFAULT '',
  `field3` varchar(250) NOT NULL DEFAULT '',
  `field4` varchar(250) NOT NULL DEFAULT '',
  `os_detect` tinyint(1) unsigned DEFAULT '0',
  `resolve_names` tinyint(1) unsigned DEFAULT '0',
  `parent_detection` tinyint(1) unsigned DEFAULT '0',
  `parent_recursion` tinyint(1) unsigned DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `macros` text,
  `alias_as_name` tinyint(2) NOT NULL DEFAULT '0',
  `snmp_enabled` tinyint(1) unsigned DEFAULT '0',
  `vlan_enabled` tinyint(1) unsigned DEFAULT '0',
  `snmp_version` varchar(5) NOT NULL DEFAULT '1',
  `snmp_auth_user` varchar(255) NOT NULL DEFAULT '',
  `snmp_auth_pass` varchar(255) NOT NULL DEFAULT '',
  `snmp_auth_method` varchar(25) NOT NULL DEFAULT '',
  `snmp_privacy_method` varchar(25) NOT NULL DEFAULT '',
  `snmp_privacy_pass` varchar(255) NOT NULL DEFAULT '',
  `snmp_security_level` varchar(25) NOT NULL DEFAULT '',
  `wmi_enabled` tinyint(1) unsigned DEFAULT '0',
  `rcmd_enabled` tinyint(1) unsigned DEFAULT '0',
  `auth_strings` text,
  `auto_monitor` tinyint(1) unsigned DEFAULT '1',
  `autoconfiguration_enabled` tinyint(1) unsigned DEFAULT '0',
  `summary` text,
  `type` int(11) NOT NULL DEFAULT '0',
  `subnet_csv` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`id_rt`),
  KEY `recon_task_daemon` (`id_recon_server`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trecon_task`
--

LOCK TABLES `trecon_task` WRITE;
/*!40000 ALTER TABLE `trecon_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `trecon_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trel_item`
--

DROP TABLE IF EXISTS `trel_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trel_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_parent` int(10) unsigned NOT NULL DEFAULT '0',
  `id_child` int(10) unsigned NOT NULL DEFAULT '0',
  `id_map` int(10) unsigned NOT NULL DEFAULT '0',
  `id_parent_source_data` int(10) unsigned NOT NULL DEFAULT '0',
  `id_child_source_data` int(10) unsigned NOT NULL DEFAULT '0',
  `parent_type` int(10) unsigned NOT NULL DEFAULT '0',
  `child_type` int(10) unsigned NOT NULL DEFAULT '0',
  `id_item` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trel_item`
--

LOCK TABLES `trel_item` WRITE;
/*!40000 ALTER TABLE `trel_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `trel_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tremote_command`
--

DROP TABLE IF EXISTS `tremote_command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tremote_command` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `timeout` int(10) unsigned NOT NULL DEFAULT '30',
  `retries` int(10) unsigned NOT NULL DEFAULT '3',
  `preconditions` text,
  `script` text,
  `postconditions` text,
  `utimestamp` int(20) unsigned NOT NULL DEFAULT '0',
  `id_group` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tremote_command`
--

LOCK TABLES `tremote_command` WRITE;
/*!40000 ALTER TABLE `tremote_command` DISABLE KEYS */;
/*!40000 ALTER TABLE `tremote_command` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tremote_command_target`
--

DROP TABLE IF EXISTS `tremote_command_target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tremote_command_target` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rcmd_id` bigint(20) unsigned NOT NULL,
  `id_agent` int(10) unsigned NOT NULL,
  `utimestamp` int(20) unsigned NOT NULL DEFAULT '0',
  `stdout` mediumtext,
  `stderr` mediumtext,
  `errorlevel` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `rcmd_id` (`rcmd_id`),
  CONSTRAINT `tremote_command_target_ibfk_1` FOREIGN KEY (`rcmd_id`) REFERENCES `tremote_command` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tremote_command_target`
--

LOCK TABLES `tremote_command_target` WRITE;
/*!40000 ALTER TABLE `tremote_command_target` DISABLE KEYS */;
/*!40000 ALTER TABLE `tremote_command_target` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treport`
--

DROP TABLE IF EXISTS `treport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treport` (
  `id_report` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(150) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `private` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `id_group` mediumint(8) unsigned DEFAULT NULL,
  `custom_logo` varchar(200) DEFAULT NULL,
  `header` mediumtext,
  `first_page` mediumtext,
  `footer` mediumtext,
  `custom_font` varchar(200) DEFAULT NULL,
  `id_template` int(10) unsigned DEFAULT '0',
  `id_group_edit` mediumint(8) unsigned DEFAULT '0',
  `metaconsole` tinyint(1) DEFAULT '0',
  `non_interactive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(1) DEFAULT '0',
  `orientation` varchar(25) NOT NULL DEFAULT 'vertical',
  PRIMARY KEY (`id_report`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treport`
--

LOCK TABLES `treport` WRITE;
/*!40000 ALTER TABLE `treport` DISABLE KEYS */;
/*!40000 ALTER TABLE `treport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treport_content`
--

DROP TABLE IF EXISTS `treport_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treport_content` (
  `id_rc` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_report` int(10) unsigned NOT NULL DEFAULT '0',
  `id_gs` int(10) unsigned DEFAULT NULL,
  `id_agent_module` bigint(14) unsigned DEFAULT NULL,
  `type` varchar(30) DEFAULT 'simple_graph',
  `period` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `name` varchar(300) DEFAULT NULL,
  `description` mediumtext,
  `id_agent` int(10) unsigned NOT NULL DEFAULT '0',
  `text` text,
  `external_source` text,
  `treport_custom_sql_id` int(10) unsigned DEFAULT '0',
  `header_definition` tinytext,
  `column_separator` tinytext,
  `line_separator` tinytext,
  `time_from` time DEFAULT '00:00:00',
  `time_to` time DEFAULT '00:00:00',
  `monday` tinyint(1) DEFAULT '1',
  `tuesday` tinyint(1) DEFAULT '1',
  `wednesday` tinyint(1) DEFAULT '1',
  `thursday` tinyint(1) DEFAULT '1',
  `friday` tinyint(1) DEFAULT '1',
  `saturday` tinyint(1) DEFAULT '1',
  `sunday` tinyint(1) DEFAULT '1',
  `only_display_wrong` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `top_n` int(11) NOT NULL DEFAULT '0',
  `top_n_value` int(11) NOT NULL DEFAULT '10',
  `exception_condition` int(11) NOT NULL DEFAULT '0',
  `exception_condition_value` double(18,6) NOT NULL DEFAULT '0.000000',
  `show_resume` int(11) NOT NULL DEFAULT '0',
  `order_uptodown` int(11) NOT NULL DEFAULT '0',
  `show_graph` int(11) NOT NULL DEFAULT '0',
  `group_by_agent` int(11) NOT NULL DEFAULT '0',
  `style` text NOT NULL,
  `id_group` int(10) unsigned NOT NULL DEFAULT '0',
  `id_module_group` int(10) unsigned NOT NULL DEFAULT '0',
  `server_name` text,
  `historical_db` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lapse_calc` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lapse` int(11) unsigned NOT NULL DEFAULT '300',
  `visual_format` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hide_no_data` tinyint(1) DEFAULT '0',
  `recursion` tinyint(1) DEFAULT NULL,
  `show_extended_events` tinyint(1) DEFAULT '0',
  `total_time` tinyint(1) DEFAULT '1',
  `time_failed` tinyint(1) DEFAULT '1',
  `time_in_ok_status` tinyint(1) DEFAULT '1',
  `time_in_unknown_status` tinyint(1) DEFAULT '1',
  `time_of_not_initialized_module` tinyint(1) DEFAULT '1',
  `time_of_downtime` tinyint(1) DEFAULT '1',
  `total_checks` tinyint(1) DEFAULT '1',
  `checks_failed` tinyint(1) DEFAULT '1',
  `checks_in_ok_status` tinyint(1) DEFAULT '1',
  `unknown_checks` tinyint(1) DEFAULT '1',
  `agent_max_value` tinyint(1) DEFAULT '1',
  `agent_min_value` tinyint(1) DEFAULT '1',
  `current_month` tinyint(1) DEFAULT '1',
  `failover_mode` tinyint(1) DEFAULT '1',
  `failover_type` tinyint(1) DEFAULT '1',
  `uncompressed_module` tinyint(4) DEFAULT '0',
  `landscape` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pagebreak` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `compare_work_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_rc`),
  KEY `id_report` (`id_report`),
  CONSTRAINT `treport_content_ibfk_1` FOREIGN KEY (`id_report`) REFERENCES `treport` (`id_report`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treport_content`
--

LOCK TABLES `treport_content` WRITE;
/*!40000 ALTER TABLE `treport_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `treport_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treport_content_item`
--

DROP TABLE IF EXISTS `treport_content_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treport_content_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_report_content` int(10) unsigned NOT NULL,
  `id_agent_module` int(10) unsigned NOT NULL,
  `id_agent_module_failover` int(10) unsigned NOT NULL DEFAULT '0',
  `server_name` text,
  `operation` text,
  PRIMARY KEY (`id`),
  KEY `id_report_content` (`id_report_content`),
  CONSTRAINT `treport_content_item_ibfk_1` FOREIGN KEY (`id_report_content`) REFERENCES `treport_content` (`id_rc`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treport_content_item`
--

LOCK TABLES `treport_content_item` WRITE;
/*!40000 ALTER TABLE `treport_content_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `treport_content_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treport_content_item_temp`
--

DROP TABLE IF EXISTS `treport_content_item_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treport_content_item_temp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_report_content` int(10) unsigned NOT NULL,
  `text_agent` text,
  `text_agent_module` text,
  `server_name` text,
  `exact_match` tinyint(1) DEFAULT '0',
  `operation` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treport_content_item_temp`
--

LOCK TABLES `treport_content_item_temp` WRITE;
/*!40000 ALTER TABLE `treport_content_item_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `treport_content_item_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treport_content_sla_com_temp`
--

DROP TABLE IF EXISTS `treport_content_sla_com_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treport_content_sla_com_temp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_report_content` int(10) unsigned NOT NULL,
  `text_agent` text,
  `text_agent_module` text,
  `sla_max` double(18,2) NOT NULL DEFAULT '0.00',
  `sla_min` double(18,2) NOT NULL DEFAULT '0.00',
  `sla_limit` double(18,2) NOT NULL DEFAULT '0.00',
  `server_name` text,
  `exact_match` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_report_content` (`id_report_content`),
  CONSTRAINT `treport_content_sla_com_temp_ibfk_1` FOREIGN KEY (`id_report_content`) REFERENCES `treport_content_template` (`id_rc`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treport_content_sla_com_temp`
--

LOCK TABLES `treport_content_sla_com_temp` WRITE;
/*!40000 ALTER TABLE `treport_content_sla_com_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `treport_content_sla_com_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treport_content_sla_combined`
--

DROP TABLE IF EXISTS `treport_content_sla_combined`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treport_content_sla_combined` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_report_content` int(10) unsigned NOT NULL,
  `id_agent_module` int(10) unsigned NOT NULL,
  `id_agent_module_failover` int(10) unsigned NOT NULL,
  `sla_max` double(18,2) NOT NULL DEFAULT '0.00',
  `sla_min` double(18,2) NOT NULL DEFAULT '0.00',
  `sla_limit` double(18,2) NOT NULL DEFAULT '0.00',
  `server_name` text,
  PRIMARY KEY (`id`),
  KEY `id_report_content` (`id_report_content`),
  CONSTRAINT `treport_content_sla_combined_ibfk_1` FOREIGN KEY (`id_report_content`) REFERENCES `treport_content` (`id_rc`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treport_content_sla_combined`
--

LOCK TABLES `treport_content_sla_combined` WRITE;
/*!40000 ALTER TABLE `treport_content_sla_combined` DISABLE KEYS */;
/*!40000 ALTER TABLE `treport_content_sla_combined` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treport_content_template`
--

DROP TABLE IF EXISTS `treport_content_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treport_content_template` (
  `id_rc` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_report` int(10) unsigned NOT NULL DEFAULT '0',
  `id_gs` int(10) unsigned DEFAULT NULL,
  `text_agent_module` text,
  `type` varchar(30) DEFAULT 'simple_graph',
  `period` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `description` mediumtext,
  `text_agent` text,
  `text` text,
  `external_source` text,
  `treport_custom_sql_id` int(10) unsigned DEFAULT '0',
  `header_definition` tinytext,
  `column_separator` tinytext,
  `line_separator` tinytext,
  `time_from` time DEFAULT '00:00:00',
  `time_to` time DEFAULT '00:00:00',
  `monday` tinyint(1) DEFAULT '1',
  `tuesday` tinyint(1) DEFAULT '1',
  `wednesday` tinyint(1) DEFAULT '1',
  `thursday` tinyint(1) DEFAULT '1',
  `friday` tinyint(1) DEFAULT '1',
  `saturday` tinyint(1) DEFAULT '1',
  `sunday` tinyint(1) DEFAULT '1',
  `only_display_wrong` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `top_n` int(11) NOT NULL DEFAULT '0',
  `top_n_value` int(11) NOT NULL DEFAULT '10',
  `exception_condition` int(11) NOT NULL DEFAULT '0',
  `exception_condition_value` double(18,6) NOT NULL DEFAULT '0.000000',
  `show_resume` int(11) NOT NULL DEFAULT '0',
  `order_uptodown` int(11) NOT NULL DEFAULT '0',
  `show_graph` int(11) NOT NULL DEFAULT '0',
  `group_by_agent` int(11) NOT NULL DEFAULT '0',
  `style` text NOT NULL,
  `id_group` int(10) unsigned NOT NULL DEFAULT '0',
  `id_module_group` int(10) unsigned NOT NULL DEFAULT '0',
  `server_name` text,
  `exact_match` tinyint(1) DEFAULT '0',
  `module_names` text,
  `module_free_text` text,
  `each_agent` tinyint(1) DEFAULT '1',
  `historical_db` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lapse_calc` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lapse` int(11) unsigned NOT NULL DEFAULT '300',
  `visual_format` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hide_no_data` tinyint(1) DEFAULT '0',
  `total_time` tinyint(1) DEFAULT '1',
  `time_failed` tinyint(1) DEFAULT '1',
  `time_in_ok_status` tinyint(1) DEFAULT '1',
  `time_in_unknown_status` tinyint(1) DEFAULT '1',
  `time_of_not_initialized_module` tinyint(1) DEFAULT '1',
  `time_of_downtime` tinyint(1) DEFAULT '1',
  `total_checks` tinyint(1) DEFAULT '1',
  `checks_failed` tinyint(1) DEFAULT '1',
  `checks_in_ok_status` tinyint(1) DEFAULT '1',
  `unknown_checks` tinyint(1) DEFAULT '1',
  `agent_max_value` tinyint(1) DEFAULT '1',
  `agent_min_value` tinyint(1) DEFAULT '1',
  `current_month` tinyint(1) DEFAULT '1',
  `failover_mode` tinyint(1) DEFAULT '1',
  `failover_type` tinyint(1) DEFAULT '1',
  `uncompressed_module` tinyint(4) DEFAULT '0',
  `landscape` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pagebreak` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `compare_work_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_rc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treport_content_template`
--

LOCK TABLES `treport_content_template` WRITE;
/*!40000 ALTER TABLE `treport_content_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `treport_content_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treport_custom_sql`
--

DROP TABLE IF EXISTS `treport_custom_sql`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treport_custom_sql` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL DEFAULT '',
  `sql` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treport_custom_sql`
--

LOCK TABLES `treport_custom_sql` WRITE;
/*!40000 ALTER TABLE `treport_custom_sql` DISABLE KEYS */;
INSERT INTO `treport_custom_sql` VALUES (1,'Monitoring&#x20;Report&#x20;Agent','select&#x20;direccion,&#x20;alias,&#x20;comentarios,&#x20;&#40;select&#x20;nombre&#x20;from&#x20;tgrupo&#x20;where&#x20;tgrupo.id_grupo&#x20;=&#x20;tagente.id_grupo&#41;&#x20;as&#x20;`group`&#x20;from&#x20;tagente;'),(2,'Monitoring&#x20;Report&#x20;Modules','select&#x20;&#40;select&#x20;tagente.alias&#x20;from&#x20;tagente&#x20;where&#x20;tagente.id_agente&#x20;=&#x20;tagente_modulo.id_agente&#41;&#x20;as&#x20;agent_nombre,&#x20;nombre&#x20;,&#x20;&#40;select&#x20;tmodule_group.name&#x20;from&#x20;tmodule_group&#x20;where&#x20;tmodule_group.id_mg&#x20;=&#x20;tagente_modulo.id_module_group&#41;&#x20;as&#x20;module_group,&#x20;module_interval&#x20;from&#x20;tagente_modulo&#x20;where&#x20;delete_pending&#x20;=&#x20;0&#x20;order&#x20;by&#x20;nombre;'),(3,'Monitoring&#x20;Report&#x20;Alerts','select&#x20;t1.alias&#x20;as&#x20;agent_name,&#x20;t2.nombre&#x20;as&#x20;module_name,&#x20;&#40;select&#x20;talert_templates.name&#x20;from&#x20;talert_templates&#x20;where&#x20;talert_templates.id&#x20;=&#x20;t3.id_alert_template&#41;&#x20;as&#x20;template,&#x20;&#40;select&#x20;group_concat&#40;t02.name&#41;&#x20;from&#x20;talert_template_module_actions&#x20;as&#x20;t01&#x20;inner&#x20;join&#x20;talert_actions&#x20;as&#x20;t02&#x20;on&#x20;t01.id_alert_action&#x20;=&#x20;t02.id&#x20;where&#x20;t01.id_alert_template_module&#x20;=&#x20;t3.id&#x20;group&#x20;by&#x20;t01.id_alert_template_module&#41;&#x20;as&#x20;actions&#x20;from&#x20;tagente&#x20;as&#x20;t1&#x20;inner&#x20;join&#x20;tagente_modulo&#x20;as&#x20;t2&#x20;on&#x20;t1.id_agente&#x20;=&#x20;t2.id_agente&#x20;inner&#x20;join&#x20;talert_template_modules&#x20;as&#x20;t3&#x20;on&#x20;t2.id_agente_modulo&#x20;=&#x20;t3.id_agent_module&#x20;order&#x20;by&#x20;agent_name,&#x20;module_name;'),(4,'Group&#x20;view','select&#x20;t1.nombre,&#x20;&#40;select&#x20;count&#40;t3.id_agente&#41;&#x20;from&#x20;tagente&#x20;as&#x20;t3&#x20;where&#x20;t1.id_grupo&#x20;=&#x20;t3.id_grupo&#41;&#x20;as&#x20;agents,&#x20;&#40;SELECT&#x20;COUNT&#40;t4.id_agente&#41;&#x20;FROM&#x20;tagente&#x20;as&#x20;t4&#x20;WHERE&#x20;t4.id_grupo&#x20;=&#x20;t1.id_grupo&#x20;AND&#x20;t4.disabled&#x20;=&#x20;0&#x20;AND&#x20;t4.ultimo_contacto&#x20;&lt;&#x20;NOW&#40;&#41;&#x20;-&#x20;&#40;intervalo&#x20;/&#x20;&#40;1/2&#41;&#41;&#41;&#x20;as&#x20;agent_unknown,&#x20;&#40;SELECT&#x20;COUNT&#40;tagente_estado.id_agente_estado&#41;&#x20;FROM&#x20;tagente_estado,&#x20;tagente,&#x20;tagente_modulo&#x20;WHERE&#x20;tagente.id_grupo&#x20;=&#x20;t1.id_grupo&#x20;AND&#x20;tagente.disabled&#x20;=&#x20;0&#x20;AND&#x20;tagente.id_agente&#x20;=&#x20;tagente_estado.id_agente&#x20;AND&#x20;tagente_estado.id_agente_modulo&#x20;=&#x20;tagente_modulo.id_agente_modulo&#x20;AND&#x20;tagente_modulo.disabled&#x20;=&#x20;0&#x20;AND&#x20;utimestamp&#x20;&gt;&#x20;0&#x20;AND&#x20;tagente_modulo.id_tipo_modulo&#x20;NOT&#x20;IN&#40;21,22,23,24,100&#41;&#x20;AND&#x20;&#40;UNIX_TIMESTAMP&#40;NOW&#40;&#41;&#41;&#x20;-&#x20;tagente_estado.utimestamp&#41;&#x20;&gt;=&#x20;&#40;tagente_estado.current_interval&#x20;/&#x20;&#40;1/2&#41;&#41;&#41;&#x20;as&#x20;monitor_unknow,&#x20;&#40;SELECT&#x20;COUNT&#40;tagente_estado.id_agente_estado&#41;&#x20;FROM&#x20;tagente_estado,&#x20;tagente,&#x20;tagente_modulo&#x20;WHERE&#x20;tagente.id_grupo&#x20;=&#x20;t1.id_grupo&#x20;AND&#x20;tagente.disabled&#x20;=&#x20;0&#x20;AND&#x20;tagente.id_agente&#x20;=&#x20;tagente_estado.id_agente&#x20;AND&#x20;tagente_estado.id_agente_modulo&#x20;=&#x20;tagente_modulo.id_agente_modulo&#x20;AND&#x20;tagente_modulo.disabled&#x20;=&#x20;0&#x20;AND&#x20;tagente_modulo.id_tipo_modulo&#x20;NOT&#x20;IN&#x20;&#40;21,22,23,24&#41;&#x20;AND&#x20;utimestamp&#x20;=&#x20;0&#41;&#x20;as&#x20;monitor_no_init,&#x20;&#40;SELECT&#x20;COUNT&#40;tagente_estado.id_agente_estado&#41;&#x20;FROM&#x20;tagente_estado,&#x20;tagente,&#x20;tagente_modulo&#x20;WHERE&#x20;tagente.id_grupo&#x20;=&#x20;t1.id_grupo&#x20;AND&#x20;tagente.disabled&#x20;=&#x20;0&#x20;AND&#x20;tagente_estado.id_agente&#x20;=&#x20;tagente.id_agente&#x20;AND&#x20;tagente_estado.id_agente_modulo&#x20;=&#x20;tagente_modulo.id_agente_modulo&#x20;AND&#x20;tagente_modulo.disabled&#x20;=&#x20;0&#x20;AND&#x20;estado&#x20;=&#x20;0&#x20;AND&#x20;&#40;&#40;UNIX_TIMESTAMP&#40;NOW&#40;&#41;&#41;&#x20;-&#x20;tagente_estado.utimestamp&#41;&#x20;&lt;&#x20;&#40;tagente_estado.current_interval&#x20;/&#x20;&#40;1/2&#41;&#41;&#x20;OR&#x20;&#40;tagente_modulo.id_tipo_modulo&#x20;IN&#40;21,22,23,24,100&#41;&#41;&#41;&#x20;AND&#x20;&#40;utimestamp&#x20;&gt;&#x20;0&#x20;OR&#x20;&#40;tagente_modulo.id_tipo_modulo&#x20;IN&#40;21,22,23,24&#41;&#41;&#41;&#41;&#x20;as&#x20;monitor_ok,&#x20;&#40;SELECT&#x20;COUNT&#40;tagente_estado.id_agente_estado&#41;&#x20;FROM&#x20;tagente_estado,&#x20;tagente,&#x20;tagente_modulo&#x20;WHERE&#x20;tagente.id_grupo&#x20;=&#x20;t1.id_grupo&#x20;AND&#x20;tagente.disabled&#x20;=&#x20;0&#x20;AND&#x20;tagente_estado.id_agente&#x20;=&#x20;tagente.id_agente&#x20;AND&#x20;tagente_estado.id_agente_modulo&#x20;=&#x20;tagente_modulo.id_agente_modulo&#x20;AND&#x20;tagente_modulo.disabled&#x20;=&#x20;0&#x20;AND&#x20;estado&#x20;=&#x20;1&#x20;AND&#x20;&#40;&#40;UNIX_TIMESTAMP&#40;NOW&#40;&#41;&#41;&#x20;-&#x20;tagente_estado.utimestamp&#41;&#x20;&lt;&#x20;&#40;tagente_estado.current_interval&#x20;/&#x20;&#40;1/2&#41;&#41;&#x20;OR&#x20;&#40;tagente_modulo.id_tipo_modulo&#x20;IN&#40;21,22,23,24,100&#41;&#41;&#41;&#x20;AND&#x20;utimestamp&#x20;&gt;&#x20;0&#41;&#x20;as&#x20;monitor_critical,&#x20;&#40;SELECT&#x20;COUNT&#40;talert_template_modules.id&#41;&#x20;FROM&#x20;talert_template_modules,&#x20;tagente_modulo,&#x20;tagente_estado,&#x20;tagente&#x20;WHERE&#x20;tagente.id_grupo&#x20;=&#x20;t1.id_grupo&#x20;AND&#x20;tagente_modulo.id_agente&#x20;=&#x20;tagente.id_agente&#x20;AND&#x20;tagente_estado.id_agente_modulo&#x20;=&#x20;tagente_modulo.id_agente_modulo&#x20;AND&#x20;tagente_modulo.disabled&#x20;=&#x20;0&#x20;AND&#x20;tagente.disabled&#x20;=&#x20;0&#x20;AND&#x20;talert_template_modules.id_agent_module&#x20;=&#x20;tagente_modulo.id_agente_modulo&#x20;AND&#x20;times_fired&#x20;&gt;&#x20;0&#41;&#x20;as&#x20;monitor_alert_fired&#x20;from&#x20;tgrupo&#x20;as&#x20;t1&#x20;where&#x20;0&#x20;&lt;&#x20;&#40;select&#x20;count&#40;t2.id_agente&#41;&#x20;from&#x20;tagente&#x20;as&#x20;t2&#x20;where&#x20;t1.id_grupo&#x20;=&#x20;t2.id_grupo&#41;');
/*!40000 ALTER TABLE `treport_custom_sql` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treport_template`
--

DROP TABLE IF EXISTS `treport_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treport_template` (
  `id_report` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(150) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `private` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `id_group` mediumint(8) unsigned DEFAULT NULL,
  `custom_logo` varchar(200) DEFAULT NULL,
  `header` mediumtext,
  `first_page` mediumtext,
  `footer` mediumtext,
  `custom_font` varchar(200) DEFAULT NULL,
  `metaconsole` tinyint(1) DEFAULT '0',
  `agent_regex` varchar(600) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id_report`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treport_template`
--

LOCK TABLES `treport_template` WRITE;
/*!40000 ALTER TABLE `treport_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `treport_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treset_pass`
--

DROP TABLE IF EXISTS `treset_pass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treset_pass` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` varchar(100) NOT NULL DEFAULT '',
  `cod_hash` varchar(100) NOT NULL DEFAULT '',
  `reset_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treset_pass`
--

LOCK TABLES `treset_pass` WRITE;
/*!40000 ALTER TABLE `treset_pass` DISABLE KEYS */;
/*!40000 ALTER TABLE `treset_pass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treset_pass_history`
--

DROP TABLE IF EXISTS `treset_pass_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treset_pass_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` varchar(60) NOT NULL,
  `reset_moment` datetime NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treset_pass_history`
--

LOCK TABLES `treset_pass_history` WRITE;
/*!40000 ALTER TABLE `treset_pass_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `treset_pass_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tserver`
--

DROP TABLE IF EXISTS `tserver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tserver` (
  `id_server` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `ip_address` varchar(100) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `laststart` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `keepalive` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `snmp_server` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `network_server` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `data_server` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `master` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `checksum` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `recon_server` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `version` varchar(25) NOT NULL DEFAULT '',
  `plugin_server` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prediction_server` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `wmi_server` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `export_server` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `server_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `queued_modules` int(5) unsigned NOT NULL DEFAULT '0',
  `threads` int(5) unsigned NOT NULL DEFAULT '0',
  `lag_time` int(11) NOT NULL DEFAULT '0',
  `lag_modules` int(11) NOT NULL DEFAULT '0',
  `total_modules_running` int(11) NOT NULL DEFAULT '0',
  `my_modules` int(11) NOT NULL DEFAULT '0',
  `server_keepalive` int(11) NOT NULL DEFAULT '0',
  `stat_utimestamp` bigint(20) NOT NULL DEFAULT '0',
  `exec_proxy` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `port` int(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_server`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tserver`
--

LOCK TABLES `tserver` WRITE;
/*!40000 ALTER TABLE `tserver` DISABLE KEYS */;
/*!40000 ALTER TABLE `tserver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tserver_export`
--

DROP TABLE IF EXISTS `tserver_export`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tserver_export` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(600) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `preffix` varchar(100) NOT NULL DEFAULT '',
  `interval` int(5) unsigned NOT NULL DEFAULT '300',
  `ip_server` varchar(100) NOT NULL DEFAULT '',
  `connect_mode` enum('tentacle','ssh','local') DEFAULT 'local',
  `id_export_server` int(10) unsigned DEFAULT NULL,
  `user` varchar(100) NOT NULL DEFAULT '',
  `pass` varchar(100) NOT NULL DEFAULT '',
  `port` int(4) unsigned DEFAULT '0',
  `directory` varchar(100) NOT NULL DEFAULT '',
  `options` varchar(100) NOT NULL DEFAULT '',
  `timezone_offset` tinyint(2) DEFAULT '0' COMMENT 'Number of hours of diference with the server timezone',
  PRIMARY KEY (`id`),
  KEY `id_export_server` (`id_export_server`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tserver_export`
--

LOCK TABLES `tserver_export` WRITE;
/*!40000 ALTER TABLE `tserver_export` DISABLE KEYS */;
/*!40000 ALTER TABLE `tserver_export` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tserver_export_data`
--

DROP TABLE IF EXISTS `tserver_export_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tserver_export_data` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_export_server` int(10) unsigned DEFAULT NULL,
  `agent_name` varchar(100) NOT NULL DEFAULT '',
  `module_name` varchar(600) NOT NULL DEFAULT '',
  `module_type` varchar(100) NOT NULL DEFAULT '',
  `data` varchar(255) DEFAULT NULL,
  `timestamp` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tserver_export_data`
--

LOCK TABLES `tserver_export_data` WRITE;
/*!40000 ALTER TABLE `tserver_export_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `tserver_export_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tservice`
--

DROP TABLE IF EXISTS `tservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tservice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `id_group` int(10) unsigned NOT NULL DEFAULT '0',
  `critical` float(20,3) NOT NULL DEFAULT '0.000',
  `warning` float(20,3) NOT NULL DEFAULT '0.000',
  `unknown_as_critical` tinyint(1) NOT NULL DEFAULT '0',
  `service_interval` float(20,3) NOT NULL DEFAULT '0.000',
  `service_value` float(20,3) NOT NULL DEFAULT '0.000',
  `status` tinyint(3) NOT NULL DEFAULT '-1',
  `utimestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `auto_calculate` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `id_agent_module` int(10) unsigned NOT NULL DEFAULT '0',
  `sla_interval` float(20,3) NOT NULL DEFAULT '0.000',
  `sla_id_module` int(10) unsigned NOT NULL DEFAULT '0',
  `sla_value_id_module` int(10) unsigned NOT NULL DEFAULT '0',
  `sla_limit` float(20,3) NOT NULL DEFAULT '100.000',
  `id_template_alert_warning` int(10) unsigned NOT NULL DEFAULT '0',
  `id_template_alert_critical` int(10) unsigned NOT NULL DEFAULT '0',
  `id_template_alert_unknown` int(10) unsigned NOT NULL DEFAULT '0',
  `id_template_alert_critical_sla` int(10) unsigned NOT NULL DEFAULT '0',
  `quiet` tinyint(1) NOT NULL DEFAULT '0',
  `cps` int(11) NOT NULL DEFAULT '0',
  `cascade_protection` tinyint(1) NOT NULL DEFAULT '0',
  `evaluate_sla` int(1) NOT NULL DEFAULT '0',
  `is_favourite` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table to define services to monitor';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tservice`
--

LOCK TABLES `tservice` WRITE;
/*!40000 ALTER TABLE `tservice` DISABLE KEYS */;
/*!40000 ALTER TABLE `tservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tservice_element`
--

DROP TABLE IF EXISTS `tservice_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tservice_element` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_service` int(10) unsigned NOT NULL,
  `weight_ok` float(20,3) NOT NULL DEFAULT '0.000',
  `weight_warning` float(20,3) NOT NULL DEFAULT '0.000',
  `weight_critical` float(20,3) NOT NULL DEFAULT '0.000',
  `weight_unknown` float(20,3) NOT NULL DEFAULT '0.000',
  `description` text NOT NULL,
  `id_agente_modulo` int(10) unsigned NOT NULL DEFAULT '0',
  `id_agent` int(10) unsigned NOT NULL DEFAULT '0',
  `id_service_child` int(10) unsigned NOT NULL DEFAULT '0',
  `id_server_meta` int(10) unsigned NOT NULL DEFAULT '0',
  `rules` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table to define the modules and the weights of the modules that define a service';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tservice_element`
--

LOCK TABLES `tservice_element` WRITE;
/*!40000 ALTER TABLE `tservice_element` DISABLE KEYS */;
/*!40000 ALTER TABLE `tservice_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tsesion`
--

DROP TABLE IF EXISTS `tsesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tsesion` (
  `id_sesion` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_usuario` varchar(60) NOT NULL DEFAULT '0',
  `ip_origen` varchar(100) NOT NULL DEFAULT '',
  `accion` varchar(100) NOT NULL DEFAULT '',
  `descripcion` text NOT NULL,
  `fecha` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `utimestamp` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_sesion`),
  KEY `idx_user` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tsesion`
--

LOCK TABLES `tsesion` WRITE;
/*!40000 ALTER TABLE `tsesion` DISABLE KEYS */;
INSERT INTO `tsesion` VALUES (1,'admin','192.168.188.6','Logon','Logged&#x20;in','2020-09-18 15:45:49',1600436749);
/*!40000 ALTER TABLE `tsesion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tsesion_extended`
--

DROP TABLE IF EXISTS `tsesion_extended`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tsesion_extended` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_sesion` int(10) unsigned NOT NULL,
  `extended_info` text,
  `hash` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_session` (`id_sesion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tsesion_extended`
--

LOCK TABLES `tsesion_extended` WRITE;
/*!40000 ALTER TABLE `tsesion_extended` DISABLE KEYS */;
/*!40000 ALTER TABLE `tsesion_extended` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tsessions_php`
--

DROP TABLE IF EXISTS `tsessions_php`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tsessions_php` (
  `id_session` char(52) NOT NULL,
  `last_active` int(11) NOT NULL,
  `data` text,
  PRIMARY KEY (`id_session`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tsessions_php`
--

LOCK TABLES `tsessions_php` WRITE;
/*!40000 ALTER TABLE `tsessions_php` DISABLE KEYS */;
INSERT INTO `tsessions_php` VALUES ('j1ijjh28959go6tv3tmt7j63sp',1600436887,'id_usuario|s:5:\"admin\";alert_msg|a:0:{}');
/*!40000 ALTER TABLE `tsessions_php` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tskin`
--

DROP TABLE IF EXISTS `tskin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tskin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `relative_path` text NOT NULL,
  `description` text NOT NULL,
  `disabled` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tskin`
--

LOCK TABLES `tskin` WRITE;
/*!40000 ALTER TABLE `tskin` DISABLE KEYS */;
INSERT INTO `tskin` VALUES (1,'skin&#x20;default','skin_default','Default&#x20;skin&#x20;for&#x20;Pandora&#x20;FMS&#x20;web&#x20;console',1),(2,'Legacy','legacy','Skin&#x20;of&#x20;the&#x20;visual&#x20;style&#x20;of&#x20;Pandora&#x20;FMS&#x20;4.x&#x20;and&#x20;previous&#x20;versions',1);
/*!40000 ALTER TABLE `tskin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tsnmp_filter`
--

DROP TABLE IF EXISTS `tsnmp_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tsnmp_filter` (
  `id_snmp_filter` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT '',
  `filter` varchar(255) DEFAULT '',
  `unified_filters_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_snmp_filter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tsnmp_filter`
--

LOCK TABLES `tsnmp_filter` WRITE;
/*!40000 ALTER TABLE `tsnmp_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `tsnmp_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ttag`
--

DROP TABLE IF EXISTS `ttag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ttag` (
  `id_tag` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `url` mediumtext NOT NULL,
  `email` text,
  `phone` text,
  `previous_name` text,
  PRIMARY KEY (`id_tag`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ttag`
--

LOCK TABLES `ttag` WRITE;
/*!40000 ALTER TABLE `ttag` DISABLE KEYS */;
INSERT INTO `ttag` VALUES (1,'network','Network&#x20;equipment','http://artica.es','','',''),(2,'critical','Critical&#x20;modules','','','',''),(3,'dmz','DMZ&#x20;Network&#x20;Zone','','','',''),(4,'performance','Performance&#x20;anda&#x20;capacity&#x20;modules','','','',''),(5,'configuration','','','','','');
/*!40000 ALTER TABLE `ttag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ttag_module`
--

DROP TABLE IF EXISTS `ttag_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ttag_module` (
  `id_tag` int(10) NOT NULL,
  `id_agente_modulo` int(10) NOT NULL DEFAULT '0',
  `id_policy_module` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_tag`,`id_agente_modulo`),
  KEY `idx_id_agente_modulo` (`id_agente_modulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ttag_module`
--

LOCK TABLES `ttag_module` WRITE;
/*!40000 ALTER TABLE `ttag_module` DISABLE KEYS */;
/*!40000 ALTER TABLE `ttag_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ttag_policy_module`
--

DROP TABLE IF EXISTS `ttag_policy_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ttag_policy_module` (
  `id_tag` int(10) NOT NULL,
  `id_policy_module` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_tag`,`id_policy_module`),
  KEY `idx_id_policy_module` (`id_policy_module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ttag_policy_module`
--

LOCK TABLES `ttag_policy_module` WRITE;
/*!40000 ALTER TABLE `ttag_policy_module` DISABLE KEYS */;
/*!40000 ALTER TABLE `ttag_policy_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ttipo_modulo`
--

DROP TABLE IF EXISTS `ttipo_modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ttipo_modulo` (
  `id_tipo` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `categoria` int(11) NOT NULL DEFAULT '0',
  `descripcion` varchar(100) NOT NULL DEFAULT '',
  `icon` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ttipo_modulo`
--

LOCK TABLES `ttipo_modulo` WRITE;
/*!40000 ALTER TABLE `ttipo_modulo` DISABLE KEYS */;
INSERT INTO `ttipo_modulo` VALUES (1,'generic_data',0,'Generic numeric','mod_data.png'),(2,'generic_proc',1,'Generic boolean','mod_proc.png'),(3,'generic_data_string',2,'Generic string','mod_string.png'),(4,'generic_data_inc',0,'Generic numeric incremental','mod_data_inc.png'),(5,'generic_data_inc_abs',0,'Generic numeric incremental (absolute)','mod_data_inc_abs.png'),(6,'remote_icmp_proc',4,'Remote ICMP network agent, boolean data','mod_icmp_proc.png'),(7,'remote_icmp',3,'Remote ICMP network agent (latency)','mod_icmp_data.png'),(8,'remote_tcp',3,'Remote TCP network agent, numeric data','mod_tcp_data.png'),(9,'remote_tcp_proc',4,'Remote TCP network agent, boolean data','mod_tcp_proc.png'),(10,'remote_tcp_string',5,'Remote TCP network agent, alphanumeric data','mod_tcp_string.png'),(11,'remote_tcp_inc',3,'Remote TCP network agent, incremental data','mod_tcp_inc.png'),(15,'remote_snmp',3,'Remote SNMP network agent, numeric data','mod_snmp_data.png'),(16,'remote_snmp_inc',3,'Remote SNMP network agent, incremental data','mod_snmp_inc.png'),(17,'remote_snmp_string',5,'Remote SNMP network agent, alphanumeric data','mod_snmp_string.png'),(18,'remote_snmp_proc',4,'Remote SNMP network agent, boolean data','mod_snmp_proc.png'),(21,'async_proc',7,'Asyncronous proc data','mod_async_proc.png'),(22,'async_data',6,'Asyncronous numeric data','mod_async_data.png'),(23,'async_string',8,'Asyncronous string data','mod_async_string.png'),(25,'web_analysis',8,'Web analysis data','module-wux.png'),(30,'web_data',9,'Remote HTTP module to check latency','mod_web_data.png'),(31,'web_proc',9,'Remote HTTP module to check server response','mod_web_proc.png'),(32,'web_content_data',9,'Remote HTTP module to retrieve numeric data','mod_web_data.png'),(33,'web_content_string',9,'Remote HTTP module to retrieve string data','mod_web_data.png'),(34,'remote_cmd',10,'Remote execution, numeric data','mod_remote_cmd.png'),(35,'remote_cmd_proc',10,'Remote execution, boolean data','mod_remote_cmd_proc.png'),(36,'remote_cmd_string',10,'Remote execution, alphanumeric data','mod_remote_cmd_string.png'),(37,'remote_cmd_inc',10,'Remote execution, incremental data','mod_remote_cmd_inc.png'),(38,'web_server_status_code_string',9,'Remote HTTP module to check server status code','mod_web_data.png'),(100,'keep_alive',-1,'KeepAlive','mod_keepalive.png');
/*!40000 ALTER TABLE `ttipo_modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ttransaction`
--

DROP TABLE IF EXISTS `ttransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ttransaction` (
  `transaction_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text,
  `name` varchar(250) NOT NULL,
  `loop_interval` int(10) unsigned NOT NULL DEFAULT '40',
  `ready` int(10) unsigned NOT NULL DEFAULT '0',
  `running` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ttransaction`
--

LOCK TABLES `ttransaction` WRITE;
/*!40000 ALTER TABLE `ttransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `ttransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ttrap`
--

DROP TABLE IF EXISTS `ttrap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ttrap` (
  `id_trap` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(50) NOT NULL DEFAULT '',
  `oid` text NOT NULL,
  `oid_custom` text,
  `type` int(11) NOT NULL DEFAULT '0',
  `type_custom` varchar(100) DEFAULT '',
  `value` text,
  `value_custom` text,
  `alerted` smallint(6) NOT NULL DEFAULT '0',
  `status` smallint(6) NOT NULL DEFAULT '0',
  `id_usuario` varchar(150) DEFAULT '',
  `timestamp` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `priority` tinyint(4) unsigned NOT NULL DEFAULT '2',
  `text` varchar(255) DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `severity` tinyint(4) unsigned NOT NULL DEFAULT '2',
  PRIMARY KEY (`id_trap`),
  KEY `timestamp` (`timestamp`),
  KEY `status` (`status`),
  KEY `source` (`source`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ttrap`
--

LOCK TABLES `ttrap` WRITE;
/*!40000 ALTER TABLE `ttrap` DISABLE KEYS */;
/*!40000 ALTER TABLE `ttrap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ttrap_custom_values`
--

DROP TABLE IF EXISTS `ttrap_custom_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ttrap_custom_values` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `oid` varchar(255) NOT NULL DEFAULT '',
  `custom_oid` varchar(255) NOT NULL DEFAULT '',
  `text` varchar(255) DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `severity` tinyint(4) unsigned NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oid_custom_oid` (`oid`,`custom_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ttrap_custom_values`
--

LOCK TABLES `ttrap_custom_values` WRITE;
/*!40000 ALTER TABLE `ttrap_custom_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `ttrap_custom_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tupdate`
--

DROP TABLE IF EXISTS `tupdate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tupdate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('code','db_data','db_schema','binary') DEFAULT NULL,
  `id_update_package` int(11) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(250) DEFAULT '',
  `checksum` varchar(250) DEFAULT '',
  `previous_checksum` varchar(250) DEFAULT '',
  `svn_version` int(4) unsigned NOT NULL DEFAULT '0',
  `data` longtext,
  `data_rollback` longtext,
  `description` text,
  `db_table_name` varchar(140) DEFAULT '',
  `db_field_name` varchar(140) DEFAULT '',
  `db_field_value` varchar(1024) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `id_update_package` (`id_update_package`),
  CONSTRAINT `tupdate_ibfk_1` FOREIGN KEY (`id_update_package`) REFERENCES `tupdate_package` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tupdate`
--

LOCK TABLES `tupdate` WRITE;
/*!40000 ALTER TABLE `tupdate` DISABLE KEYS */;
/*!40000 ALTER TABLE `tupdate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tupdate_journal`
--

DROP TABLE IF EXISTS `tupdate_journal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tupdate_journal` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_update` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_update` (`id_update`),
  CONSTRAINT `tupdate_journal_ibfk_1` FOREIGN KEY (`id_update`) REFERENCES `tupdate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tupdate_journal`
--

LOCK TABLES `tupdate_journal` WRITE;
/*!40000 ALTER TABLE `tupdate_journal` DISABLE KEYS */;
/*!40000 ALTER TABLE `tupdate_journal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tupdate_package`
--

DROP TABLE IF EXISTS `tupdate_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tupdate_package` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `description` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tupdate_package`
--

LOCK TABLES `tupdate_package` WRITE;
/*!40000 ALTER TABLE `tupdate_package` DISABLE KEYS */;
/*!40000 ALTER TABLE `tupdate_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tupdate_settings`
--

DROP TABLE IF EXISTS `tupdate_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tupdate_settings` (
  `key` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) DEFAULT '',
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tupdate_settings`
--

LOCK TABLES `tupdate_settings` WRITE;
/*!40000 ALTER TABLE `tupdate_settings` DISABLE KEYS */;
INSERT INTO `tupdate_settings` VALUES ('current_update','412'),('customer_key','PANDORA-FREE'),('dbhost',''),('dbname',''),('dbpass',''),('dbport',''),('dbuser',''),('proxy',''),('proxy_pass',''),('proxy_port',''),('proxy_user',''),('updating_binary_path','Path where the updated binary files will be stored'),('updating_code_path','Path where the updated code is stored');
/*!40000 ALTER TABLE `tupdate_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tuser_double_auth`
--

DROP TABLE IF EXISTS `tuser_double_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tuser_double_auth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` varchar(60) NOT NULL,
  `secret` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_user` (`id_user`),
  CONSTRAINT `tuser_double_auth_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tusuario` (`id_user`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tuser_double_auth`
--

LOCK TABLES `tuser_double_auth` WRITE;
/*!40000 ALTER TABLE `tuser_double_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `tuser_double_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tuser_task`
--

DROP TABLE IF EXISTS `tuser_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tuser_task` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `function_name` varchar(80) NOT NULL DEFAULT '',
  `parameters` text NOT NULL,
  `name` varchar(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tuser_task`
--

LOCK TABLES `tuser_task` WRITE;
/*!40000 ALTER TABLE `tuser_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `tuser_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tuser_task_scheduled`
--

DROP TABLE IF EXISTS `tuser_task_scheduled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tuser_task_scheduled` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_usuario` varchar(60) NOT NULL DEFAULT '0',
  `id_user_task` int(20) unsigned NOT NULL DEFAULT '0',
  `args` text NOT NULL,
  `scheduled` enum('no','hourly','daily','weekly','monthly','yearly','custom') DEFAULT 'no',
  `last_run` int(20) unsigned DEFAULT '0',
  `custom_data` int(10) DEFAULT '0',
  `flag_delete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `id_grupo` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tuser_task_scheduled`
--

LOCK TABLES `tuser_task_scheduled` WRITE;
/*!40000 ALTER TABLE `tuser_task_scheduled` DISABLE KEYS */;
/*!40000 ALTER TABLE `tuser_task_scheduled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tusuario`
--

DROP TABLE IF EXISTS `tusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tusuario` (
  `id_user` varchar(60) NOT NULL DEFAULT '0',
  `fullname` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `middlename` varchar(255) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `comments` varchar(200) DEFAULT NULL,
  `last_connect` bigint(20) NOT NULL DEFAULT '0',
  `registered` bigint(20) NOT NULL DEFAULT '0',
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) DEFAULT NULL,
  `timezone` varchar(50) DEFAULT '',
  `block_size` int(4) NOT NULL DEFAULT '20',
  `id_skin` int(10) unsigned NOT NULL DEFAULT '0',
  `disabled` int(4) NOT NULL DEFAULT '0',
  `shortcut` tinyint(1) DEFAULT '0',
  `shortcut_data` text,
  `section` text NOT NULL,
  `data_section` text NOT NULL,
  `force_change_pass` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `last_pass_change` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_failed_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `failed_attempt` int(4) NOT NULL DEFAULT '0',
  `login_blocked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `metaconsole_access` enum('basic','advanced') DEFAULT 'basic',
  `not_login` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `metaconsole_agents_manager` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `metaconsole_assigned_server` int(10) unsigned NOT NULL DEFAULT '0',
  `metaconsole_access_node` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `strict_acl` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `id_filter` int(10) unsigned DEFAULT NULL,
  `session_time` int(10) NOT NULL DEFAULT '0',
  `default_event_filter` int(10) unsigned NOT NULL DEFAULT '0',
  `autorefresh_white_list` text NOT NULL,
  `time_autorefresh` int(5) unsigned NOT NULL DEFAULT '30',
  `default_custom_view` int(10) unsigned DEFAULT '0',
  `ehorus_user_level_user` varchar(60) DEFAULT NULL,
  `ehorus_user_level_pass` varchar(45) DEFAULT NULL,
  `ehorus_user_level_enabled` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `id_user` (`id_user`),
  KEY `fk_filter_id` (`id_filter`),
  CONSTRAINT `fk_filter_id` FOREIGN KEY (`id_filter`) REFERENCES `tevent_filter` (`id_filter`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tusuario`
--

LOCK TABLES `tusuario` WRITE;
/*!40000 ALTER TABLE `tusuario` DISABLE KEYS */;
INSERT INTO `tusuario` VALUES ('admin','Pandora','Pandora','Admin','','1da7ee7d45b96d0e1f45ee4ee23da560','Admin Pandora',1600436886,0,'admin@example.com','555-555-5555',1,'default','',0,0,0,0,NULL,'Default','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,'advanced',0,0,0,0,0,NULL,0,0,'',30,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tusuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tusuario_perfil`
--

DROP TABLE IF EXISTS `tusuario_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tusuario_perfil` (
  `id_up` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_usuario` varchar(100) NOT NULL DEFAULT '',
  `id_perfil` int(10) unsigned NOT NULL DEFAULT '0',
  `id_grupo` int(10) NOT NULL DEFAULT '0',
  `no_hierarchy` tinyint(1) NOT NULL DEFAULT '0',
  `assigned_by` varchar(100) NOT NULL DEFAULT '',
  `id_policy` int(10) unsigned NOT NULL DEFAULT '0',
  `tags` text NOT NULL,
  PRIMARY KEY (`id_up`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tusuario_perfil`
--

LOCK TABLES `tusuario_perfil` WRITE;
/*!40000 ALTER TABLE `tusuario_perfil` DISABLE KEYS */;
INSERT INTO `tusuario_perfil` VALUES (1,'admin',5,0,0,'admin',0,'');
/*!40000 ALTER TABLE `tusuario_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tvisual_console_elements_cache`
--

DROP TABLE IF EXISTS `tvisual_console_elements_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tvisual_console_elements_cache` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vc_id` int(10) unsigned NOT NULL,
  `vc_item_id` int(10) unsigned NOT NULL,
  `user_id` varchar(60) DEFAULT NULL,
  `data` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expiration` int(10) unsigned NOT NULL COMMENT 'Seconds to expire',
  PRIMARY KEY (`id`),
  KEY `vc_id` (`vc_id`),
  KEY `vc_item_id` (`vc_item_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tvisual_console_elements_cache_ibfk_1` FOREIGN KEY (`vc_id`) REFERENCES `tlayout` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tvisual_console_elements_cache_ibfk_2` FOREIGN KEY (`vc_item_id`) REFERENCES `tlayout_data` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tvisual_console_elements_cache_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `tusuario` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tvisual_console_elements_cache`
--

LOCK TABLES `tvisual_console_elements_cache` WRITE;
/*!40000 ALTER TABLE `tvisual_console_elements_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `tvisual_console_elements_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `twidget`
--

DROP TABLE IF EXISTS `twidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `twidget` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `class_name` varchar(60) NOT NULL DEFAULT '',
  `unique_name` varchar(60) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `options` text NOT NULL,
  `page` varchar(120) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twidget`
--

LOCK TABLES `twidget` WRITE;
/*!40000 ALTER TABLE `twidget` DISABLE KEYS */;
/*!40000 ALTER TABLE `twidget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `twidget_dashboard`
--

DROP TABLE IF EXISTS `twidget_dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `twidget_dashboard` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `position` text NOT NULL,
  `options` longtext NOT NULL,
  `order` int(3) NOT NULL DEFAULT '0',
  `id_dashboard` int(20) unsigned NOT NULL DEFAULT '0',
  `id_widget` int(20) unsigned NOT NULL DEFAULT '0',
  `prop_width` float(5,3) NOT NULL DEFAULT '0.320',
  `prop_height` float(5,3) NOT NULL DEFAULT '0.320',
  PRIMARY KEY (`id`),
  KEY `id_dashboard` (`id_dashboard`),
  CONSTRAINT `twidget_dashboard_ibfk_1` FOREIGN KEY (`id_dashboard`) REFERENCES `tdashboard` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twidget_dashboard`
--

LOCK TABLES `twidget_dashboard` WRITE;
/*!40000 ALTER TABLE `twidget_dashboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `twidget_dashboard` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-18 13:48:11
