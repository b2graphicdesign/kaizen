-- MySQL dump 10.13  Distrib 5.5.46, for Linux (x86_64)
--
-- Host: kaizen-staging.csltrie4omxw.us-west-2.rds.amazonaws.com    Database: kaizen
-- ------------------------------------------------------
-- Server version	5.6.27-log

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `encrypted_password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `last_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `full_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `company` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_sign_in_ip` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `call_log`
--

DROP TABLE IF EXISTS `call_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `call_log` (
  `call_id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone_from` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_to` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `msg` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `patient_id` int(11) NOT NULL DEFAULT '0',
  `provider_id` int(11) NOT NULL DEFAULT '0',
  `ride_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`call_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `call_queue`
--

DROP TABLE IF EXISTS `call_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `call_queue` (
  `call_queue_id` int(11) NOT NULL AUTO_INCREMENT,
  `send_at` datetime NOT NULL,
  `phone_to` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `msg` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `patient_id` int(11) NOT NULL DEFAULT '0',
  `provider_id` int(11) NOT NULL DEFAULT '0',
  `ride_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`call_queue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hospital_department`
--

DROP TABLE IF EXISTS `hospital_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospital_department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `hospital_id` int(11) NOT NULL DEFAULT '0',
  `system_id` int(11) NOT NULL DEFAULT '0',
  `department_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address_1` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address_2` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `state` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `zip` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hospital_sites`
--

DROP TABLE IF EXISTS `hospital_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospital_sites` (
  `site_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) NOT NULL DEFAULT '0',
  `hospital_id` int(11) NOT NULL DEFAULT '0',
  `system_id` int(11) NOT NULL DEFAULT '0',
  `facility_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address_1` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address_2` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `state` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `zip` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `latitude` float(10,6) DEFAULT NULL,
  `longitude` float(10,6) DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hospital_system`
--

DROP TABLE IF EXISTS `hospital_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospital_system` (
  `system_id` int(11) NOT NULL AUTO_INCREMENT,
  `system_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address_1` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address_2` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `state` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `zip` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`system_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hospitals`
--

DROP TABLE IF EXISTS `hospitals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospitals` (
  `hospital_id` int(11) NOT NULL AUTO_INCREMENT,
  `system_id` int(11) NOT NULL DEFAULT '0',
  `facility_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address_1` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address_2` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `state` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `zip` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`hospital_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL AUTO_INCREMENT,
  `system_id` int(11) NOT NULL DEFAULT '0',
  `department_id` int(11) NOT NULL DEFAULT '0',
  `username` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address_1` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address_2` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `state` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `zip` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `county` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address_notes` text COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payer` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payer_state` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payer_id` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `alternate_contact_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `alternate_contact_phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `alternate_contact_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `alert_call` tinyint(1) DEFAULT NULL,
  `alert_sms` tinyint(1) DEFAULT NULL,
  `alert_email` tinyint(1) DEFAULT NULL,
  `alert_alternate_call` tinyint(1) DEFAULT NULL,
  `alert_alternate_sms` tinyint(1) DEFAULT NULL,
  `alert_alternate_email` tinyint(1) DEFAULT NULL,
  `transportation_type` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `assistance_notes` text COLLATE utf8_unicode_ci NOT NULL,
  `comments` text COLLATE utf8_unicode_ci NOT NULL,
  `reset_password_token` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `send_password_email` tinyint(1) DEFAULT '0',
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_sign_in_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`patient_id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `providers`
--

DROP TABLE IF EXISTS `providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providers` (
  `provider_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) NOT NULL DEFAULT '0',
  `hospital_id` int(11) NOT NULL DEFAULT '0',
  `system_id` int(11) NOT NULL DEFAULT '0',
  `username` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `encrypted_password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `facility_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address_1` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address_2` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `state` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `zip` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `county` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address_notes` text COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fax` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_sign_in_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`provider_id`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `username_2` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ride_log`
--

DROP TABLE IF EXISTS `ride_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ride_log` (
  `ride_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL DEFAULT '0',
  `provider_id` int(11) NOT NULL DEFAULT '0',
  `appointment_at` datetime DEFAULT NULL,
  `status` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expected_start_at` datetime DEFAULT NULL,
  `actual_start_at` datetime DEFAULT NULL,
  `expected_end_at` datetime DEFAULT NULL,
  `actual_end_at` datetime DEFAULT NULL,
  `start_lat` float(10,6) DEFAULT NULL,
  `start_long` float(10,6) DEFAULT NULL,
  `end_lat` float(10,6) DEFAULT NULL,
  `end_long` float(10,6) DEFAULT NULL,
  `actual_mileage` float(10,6) DEFAULT NULL,
  `expected_mileage` float(10,6) DEFAULT NULL,
  `ride_service` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ride_type` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ride_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ride_queue`
--

DROP TABLE IF EXISTS `ride_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ride_queue` (
  `ride_queue_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `system_id` int(11) NOT NULL,
  `appointment_at` datetime NOT NULL,
  `status` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `expected_start_at` datetime NOT NULL,
  `actual_start_at` datetime NOT NULL,
  `expected_end_at` datetime NOT NULL,
  `actual_end_at` datetime NOT NULL,
  `start_lat` float NOT NULL,
  `start_long` float NOT NULL,
  `end_lat` float NOT NULL,
  `end_long` float NOT NULL,
  `actual_mileage` float NOT NULL,
  `expected_mileage` float NOT NULL,
  `ride_service` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `ride_type` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ride_queue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms_log`
--

DROP TABLE IF EXISTS `sms_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_log` (
  `sms_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `phone_from` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone_to` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `msg` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `sent` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `errorcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `patient_id` int(11) DEFAULT '0',
  `provider_id` int(11) NOT NULL DEFAULT '0',
  `ride_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sms_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms_queue`
--

DROP TABLE IF EXISTS `sms_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_queue` (
  `sms_queue_id` int(11) NOT NULL AUTO_INCREMENT,
  `send_at` datetime DEFAULT NULL,
  `phone_to` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `msg` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `patient_id` int(11) NOT NULL DEFAULT '0',
  `provider_id` int(11) NOT NULL DEFAULT '0',
  `ride_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sms_queue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-19 21:10:24
INSERT INTO schema_migrations (version) VALUES ('0');

