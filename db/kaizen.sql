-- phpMyAdmin SQL Dump
-- version 4.0.10.15
-- http://www.phpmyadmin.net
--
-- Host: kaizen-staging.csltrie4omxw.us-west-2.rds.amazonaws.com
-- Generation Time: Apr 21, 2016 at 10:16 PM
-- Server version: 5.6.27-log
-- PHP Version: 5.5.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `kaizen`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) NOT NULL,
  `encrypted_password` varchar(100) NOT NULL,
  `email` varchar(30) NOT NULL,
  `first_name` varchar(30) DEFAULT '',
  `last_name` varchar(30) DEFAULT '',
  `full_name` varchar(50) NOT NULL DEFAULT '',
  `company` varchar(50) NOT NULL DEFAULT '',
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(20) NOT NULL DEFAULT '',
  `last_sign_in_ip` varchar(20) NOT NULL DEFAULT '',
  `reset_password_token` varchar(100) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Admin Table from POSTGRE' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `username`, `encrypted_password`, `email`, `first_name`, `last_name`, `full_name`, `company`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `created_at`, `updated_at`) VALUES
(1, 'dolansc', '$2a$10$jNoNTnkQDU2.BOl60.tduuS4I9EALrg6pVUXDiZBgOlfeLVcYcKyG', 'scott@scottdolan.com', '""', '""', '""', '""', 7, '2016-04-19 21:21:07', '2016-04-19 21:20:34', '50.4.132.53', '50.4.132.53', NULL, NULL, NULL, '2016-04-19 19:52:27', '2016-04-19 21:21:07'),
(2, 'testtest', '$2a$10$4qdtzRlyX71zbrGjOmsn4e8WbPbzrCSMsppvucqfLgpLjSDG./.eq', 'testymctesterson@testy.com', '', '', '', '', 1, '2016-04-19 20:05:33', '2016-04-19 20:05:33', '50.4.132.53', '""', NULL, NULL, NULL, '2016-04-19 20:05:33', '2016-04-19 20:05:33');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE IF NOT EXISTS `patients` (
  `patient_id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_id` int(11) NOT NULL DEFAULT '0',
  -- `username` varchar(25) NOT NULL DEFAULT '',
  -- `encrypted_password` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `first_name` varchar(25) NOT NULL DEFAULT '',
  `last_name` varchar(25) NOT NULL DEFAULT '',
  `address_1` varchar(50) NOT NULL DEFAULT '',
  `address_2` varchar(50) NOT NULL DEFAULT '',
  `city` varchar(50) NOT NULL DEFAULT '',
  `state` varchar(50) NOT NULL DEFAULT '',
  `zip` varchar(15) NOT NULL DEFAULT '',
  `county` varchar(50) NOT NULL DEFAULT '',
  `address_notes` text NOT NULL DEFAULT '',
  `phone` varchar(15) NOT NULL DEFAULT '',
  `payer` varchar(50) NOT NULL DEFAULT '',
  `payer_state` varchar(25) NOT NULL DEFAULT '',
  `payer_id` varchar(25) NOT NULL DEFAULT '',
  `alternate_contact_name` varchar(50) NOT NULL DEFAULT '',
  `alternate_contact_phone` varchar(15) NOT NULL DEFAULT '',
  `alternate_contact_email` varchar(50) NOT NULL DEFAULT '',
  `alert_call` tinyint(1) DEFAULT NULL,
  `alert_sms` tinyint(1) DEFAULT NULL,
  `alert_email` tinyint(1) DEFAULT NULL,
  `alert_alternate_call` tinyint(1) DEFAULT NULL,
  `alert_alternate_sms` tinyint(1) DEFAULT NULL,
  `alert_alternate_email` tinyint(1) DEFAULT NULL,
  `transportation_type` varchar(25) NOT NULL DEFAULT '',
  `assistance_notes` text NOT NULL DEFAULT '',
  `comments` text NOT NULL DEFAULT '',
  -- `reset_password_token` varchar(50) DEFAULT NULL,
  -- `reset_password_sent_at` datetime DEFAULT NULL,
  -- `send_password_email` tinyint(1) DEFAULT '0',
  -- `remember_created_at` datetime DEFAULT NULL,
  -- `sign_in_count` int(11) NOT NULL DEFAULT '0',
  -- `current_sign_in_at` datetime DEFAULT NULL,
  -- `last_sign_in_at` datetime DEFAULT NULL,
  -- `current_sign_in_ip` varchar(15) NOT NULL DEFAULT '',
  -- `last_sign_in_ip` varchar(15) NOT NULL DEFAULT '',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`patient_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patient_id`, `provider_id`, `email`, `first_name`, `last_name`, `address_1`, `address_2`, `city`, `state`, `zip`, `county`, `address_notes`, `phone`, `payer`, `payer_state`, `payer_id`, `alternate_contact_name`, `alternate_contact_phone`, `alternate_contact_email`, `alert_call`, `alert_sms`, `alert_email`, `alert_alternate_call`, `alert_alternate_sms`, `alert_alternate_email`, `transportation_type`, `assistance_notes`, `comments`, `created_at`, `updated_at`) VALUES
(1, 1, 'test@test.com', 'testy', 'testy', 'test', 'test', 'test', 'IL', 'test', 'test', '', 'test', 'test', 'IL', 'test', 'test', 'test', 'test', 1, 1, 1, 1, 1, 1, 'Car', '', '', '2016-04-19 21:42:25', NULL),
(2, 1, 'jimmy@cracker.com', 'Jimm', 'Cracker', 'jdsfkjasdkfj', 'sdfjkasdjfl', 'sdfjaksldfja;', 'IL', 'sdsjfsd', 'sdfjasdklf', '', '', 'sdjkflajkln', 'IL', 'fjsdklfasdl;f', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Car', '', '', '2016-04-20 03:20:49', NULL);
-- --------------------------------------------------------

--
-- Table structure for table `providers`
--

CREATE TABLE IF NOT EXISTS `providers` (
  `provider_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) NOT NULL,
  `encrypted_password` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `facility_name` varchar(100) NOT NULL DEFAULT '',
  `address_1` varchar(50) NOT NULL DEFAULT '',
  `address_2` varchar(50) NOT NULL DEFAULT '',
  `city` varchar(50) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(15) NOT NULL DEFAULT '',
  `county` varchar(25) NOT NULL DEFAULT '',
  `address_notes` text NOT NULL,
  `phone` varchar(15) NOT NULL DEFAULT '',
  `fax` varchar(15) NOT NULL DEFAULT '',
  `reset_password_token` varchar(100) NOT NULL DEFAULT '',
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(15) NOT NULL DEFAULT '',
  `last_sign_in_ip` varchar(15) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`provider_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `username_2` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `providers`
--

INSERT INTO `providers` (`provider_id`, `username`, `encrypted_password`, `email`, `facility_name`, `address_1`, `address_2`, `city`, `state`, `zip`, `county`, `address_notes`, `phone`, `fax`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `created_at`, `updated_at`) VALUES
(1, 'testtest', '$2a$10$hzhgKBHbR8p1QEpIJlN7mOuat76dhZPCabRtf.r3z.ZpD4UrJa4EO', 'testtest@test.com', 'test', 'asdf', 'asdf', 'glenview sdfads', 'IL', 'test', 'test', 'test', 'teset', 'test', '', NULL, NULL, 14, '2016-04-21 20:46:49', '2016-04-21 20:46:26', '50.4.132.53', '50.249.193.102', '2016-04-19 21:36:26', '2016-04-21 20:46:49');

-- --------------------------------------------------------

--
-- Table structure for table `rides`
--

CREATE TABLE IF NOT EXISTS `rides` (
  `ride_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  PRIMARY KEY (`ride_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
