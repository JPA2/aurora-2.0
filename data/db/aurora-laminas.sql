-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 01, 2022 at 08:34 PM
-- Server version: 5.7.31
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aurora-laminas`
--

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
CREATE TABLE IF NOT EXISTS `log` (
  `logId` int(11) NOT NULL AUTO_INCREMENT,
  `extra_userId` int(11) DEFAULT NULL,
  `extra_userName` varchar(255) DEFAULT NULL,
  `extra_role` tinytext,
  `extra_firstName` tinytext,
  `extra_lastName` tinytext,
  `priorityName` varchar(20) NOT NULL,
  `message` longtext NOT NULL,
  `timeStamp` varchar(255) NOT NULL,
  `priority` int(1) NOT NULL,
  `extra_referenceId` tinytext,
  `extra_errno` tinytext,
  `extra_file` text,
  `extra_line` text,
  `extra_trace` text,
  `fileId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`logId`),
  KEY `userId` (`extra_userId`)
) ENGINE=InnoDB AUTO_INCREMENT=530 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`logId`, `extra_userId`, `extra_userName`, `extra_role`, `extra_firstName`, `extra_lastName`, `priorityName`, `message`, `timeStamp`, `priority`, `extra_referenceId`, `extra_errno`, `extra_file`, `extra_line`, `extra_trace`, `fileId`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-22-2022 10:59:20', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '55', NULL, 0),
(2, NULL, NULL, NULL, NULL, NULL, 'INFO', 'submit-email', '01-22-2022 11:02:46', 6, NULL, NULL, NULL, NULL, NULL, 0),
(3, NULL, NULL, NULL, NULL, NULL, 'INFO', 'send-email', '01-22-2022 11:02:53', 6, NULL, NULL, NULL, NULL, NULL, 0),
(4, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-22-2022 11:04:47', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '55', NULL, 0),
(5, NULL, NULL, NULL, NULL, NULL, 'INFO', 'submit-email', '01-23-2022 7:35:36', 6, NULL, NULL, NULL, NULL, NULL, 0),
(6, NULL, NULL, NULL, NULL, NULL, 'INFO', 'send-email', '01-23-2022 7:35:50', 6, NULL, NULL, NULL, NULL, NULL, 0),
(7, NULL, NULL, NULL, NULL, NULL, 'INFO', 'submit-email', '01-23-2022 9:28:28', 6, NULL, NULL, NULL, NULL, NULL, 0),
(8, NULL, NULL, NULL, NULL, NULL, 'INFO', 'send-email', '01-23-2022 9:28:42', 6, NULL, NULL, NULL, NULL, NULL, 0),
(9, NULL, NULL, NULL, NULL, NULL, 'INFO', 'submit-email', '01-23-2022 9:32:23', 6, NULL, NULL, NULL, NULL, NULL, 0),
(10, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-23-2022 9:40:34', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '55', NULL, 0),
(11, NULL, NULL, NULL, NULL, NULL, 'INFO', 'submit-email', '01-23-2022 9:40:47', 6, NULL, NULL, NULL, NULL, NULL, 0),
(12, NULL, NULL, NULL, NULL, NULL, 'INFO', 'send-email', '01-23-2022 9:40:55', 6, NULL, NULL, NULL, NULL, NULL, 0),
(13, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-23-2022 9:52:33', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '55', NULL, 0),
(14, NULL, NULL, NULL, NULL, NULL, 'INFO', 'send-email', '01-23-2022 9:52:50', 6, NULL, NULL, NULL, NULL, NULL, 0),
(15, NULL, NULL, NULL, NULL, NULL, 'INFO', 'send-email', '01-23-2022 10:05:01', 6, NULL, NULL, NULL, NULL, NULL, 0),
(16, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-23-2022 10:05:38', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '55', NULL, 0),
(17, NULL, NULL, NULL, NULL, NULL, 'INFO', 'send-email', '01-23-2022 10:06:02', 6, NULL, NULL, NULL, NULL, NULL, 0),
(18, NULL, NULL, NULL, NULL, NULL, 'INFO', 'send-email', '01-23-2022 10:06:42', 6, NULL, NULL, NULL, NULL, NULL, 0),
(19, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-23-2022 11:33:25', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '55', NULL, 0),
(20, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-23-2022 11:33:48', 6, NULL, NULL, NULL, NULL, NULL, 0),
(21, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-23-2022 11:36:08', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '55', NULL, 0),
(22, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-23-2022 11:37:10', 6, NULL, NULL, NULL, NULL, NULL, 0),
(23, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-23-2022 11:42:44', 6, NULL, NULL, NULL, NULL, NULL, 0),
(24, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined property: User\\Controller\\PasswordController::$url', '01-23-2022 11:43:04', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\src\\Controller\\PasswordController.php', '108', NULL, 0),
(25, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-23-2022 11:45:09', 6, NULL, NULL, NULL, NULL, NULL, 0),
(26, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-24-2022 12:48:27', 6, NULL, NULL, NULL, NULL, NULL, 0),
(27, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-24-2022 12:54:17', 6, NULL, NULL, NULL, NULL, NULL, 0),
(28, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-24-2022 7:17:25', 6, NULL, NULL, NULL, NULL, NULL, 0),
(29, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-24-2022 7:20:57', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '55', NULL, 0),
(30, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-24-2022 7:21:10', 6, NULL, NULL, NULL, NULL, NULL, 0),
(31, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-24-2022 7:22:33', 6, NULL, NULL, NULL, NULL, NULL, 0),
(32, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-24-2022 7:36:52', 6, NULL, NULL, NULL, NULL, NULL, 0),
(33, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-24-2022 7:38:34', 6, NULL, NULL, NULL, NULL, NULL, 0),
(34, NULL, NULL, NULL, NULL, NULL, 'INFO', 'submit-email', '01-24-2022 7:39:22', 6, NULL, NULL, NULL, NULL, NULL, 0),
(35, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-24-2022 8:02:50', 6, NULL, NULL, NULL, NULL, NULL, 0),
(36, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-24-2022 8:03:07', 6, NULL, NULL, NULL, NULL, NULL, 0),
(37, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-24-2022 8:08:36', 6, NULL, NULL, NULL, NULL, NULL, 0),
(38, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-24-2022 8:08:49', 6, NULL, NULL, NULL, NULL, NULL, 0),
(39, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined property: User\\Form\\ResetPassword::$table', '01-24-2022 8:08:49', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\src\\Form\\ResetPassword.php', '102', NULL, 0),
(40, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-24-2022 8:11:56', 6, NULL, NULL, NULL, NULL, NULL, 0),
(41, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-24-2022 8:12:08', 6, NULL, NULL, NULL, NULL, NULL, 0),
(42, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-24-2022 8:14:56', 6, NULL, NULL, NULL, NULL, NULL, 0),
(43, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-24-2022 8:15:07', 6, NULL, NULL, NULL, NULL, NULL, 0),
(44, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-24-2022 8:15:54', 6, NULL, NULL, NULL, NULL, NULL, 0),
(45, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-24-2022 8:16:05', 6, NULL, NULL, NULL, NULL, NULL, 0),
(46, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: currentUser', '01-24-2022 8:17:26', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\src\\View\\Helper\\Service\\UserAwareControlFactory.php', '25', NULL, 0),
(47, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: form', '01-24-2022 8:17:56', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\view\\user\\user\\login.phtml', '7', NULL, 0),
(48, 50, 'test', NULL, 'NULL', 'NULL', 'INFO', 'User test logged in.', '01-24-2022 8:17:56', 6, NULL, NULL, NULL, NULL, NULL, 0),
(49, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-24-2022 8:18:48', 6, NULL, NULL, NULL, NULL, NULL, 0),
(50, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-24-2022 8:19:14', 6, NULL, NULL, NULL, NULL, NULL, 0),
(51, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-24-2022 8:50:15', 6, NULL, NULL, NULL, NULL, NULL, 0),
(52, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-24-2022 8:50:50', 6, NULL, NULL, NULL, NULL, NULL, 0),
(53, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: currentUser', '01-24-2022 8:51:28', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\src\\View\\Helper\\Service\\UserAwareControlFactory.php', '25', NULL, 0),
(54, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-24-2022 9:07:49', 6, NULL, NULL, NULL, NULL, NULL, 0),
(55, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-24-2022 9:08:03', 6, NULL, NULL, NULL, NULL, NULL, 0),
(56, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: currentUser', '01-24-2022 9:09:43', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\src\\View\\Helper\\Service\\UserAwareControlFactory.php', '25', NULL, 0),
(57, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-24-2022 9:52:02', 6, NULL, NULL, NULL, NULL, NULL, 0),
(58, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-24-2022 9:52:17', 6, NULL, NULL, NULL, NULL, NULL, 0),
(59, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: currentUser', '01-24-2022 9:52:48', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\src\\View\\Helper\\Service\\UserAwareControlFactory.php', '25', NULL, 0),
(60, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-24-2022 9:56:50', 6, NULL, NULL, NULL, NULL, NULL, 0),
(61, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-24-2022 10:34:29', 6, NULL, NULL, NULL, NULL, NULL, 0),
(62, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-24-2022 10:41:22', 6, NULL, NULL, NULL, NULL, NULL, 0),
(63, NULL, NULL, NULL, NULL, NULL, 'INFO', 'submit-email', '01-24-2022 10:42:12', 6, NULL, NULL, NULL, NULL, NULL, 0),
(64, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-24-2022 10:45:41', 6, NULL, NULL, NULL, NULL, NULL, 0),
(65, NULL, NULL, NULL, NULL, NULL, 'INFO', 'submit-email', '01-24-2022 10:45:47', 6, NULL, NULL, NULL, NULL, NULL, 0),
(66, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-24-2022 10:48:47', 6, NULL, NULL, NULL, NULL, NULL, 0),
(67, NULL, NULL, NULL, NULL, NULL, 'INFO', 'submit-email', '01-24-2022 10:48:56', 6, NULL, NULL, NULL, NULL, NULL, 0),
(68, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-24-2022 10:50:36', 6, NULL, NULL, NULL, NULL, NULL, 0),
(69, NULL, NULL, NULL, NULL, NULL, 'INFO', 'submit-email', '01-24-2022 10:50:37', 6, NULL, NULL, NULL, NULL, NULL, 0),
(70, NULL, NULL, NULL, NULL, NULL, 'INFO', 'submit-email', '01-24-2022 10:53:04', 6, NULL, NULL, NULL, NULL, NULL, 0),
(71, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-24-2022 10:55:11', 6, NULL, NULL, NULL, NULL, NULL, 0),
(72, NULL, NULL, NULL, NULL, NULL, 'INFO', 'submit-email', '01-24-2022 10:55:11', 6, NULL, NULL, NULL, NULL, NULL, 0),
(73, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-24-2022 10:56:08', 6, NULL, NULL, NULL, NULL, NULL, 0),
(74, NULL, NULL, NULL, NULL, NULL, 'INFO', 'submit-email', '01-24-2022 10:56:08', 6, NULL, NULL, NULL, NULL, NULL, 0),
(75, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-24-2022 11:02:08', 6, NULL, NULL, NULL, NULL, NULL, 0),
(76, NULL, NULL, NULL, NULL, NULL, 'INFO', 'submit-email', '01-24-2022 11:02:08', 6, NULL, NULL, NULL, NULL, NULL, 0),
(77, NULL, NULL, NULL, NULL, NULL, 'INFO', 'send-email', '01-24-2022 11:05:47', 6, NULL, NULL, NULL, NULL, NULL, 0),
(78, 50, 'test', NULL, NULL, NULL, 'INFO', 'Password change request', '01-24-2022 11:05:50', 6, NULL, NULL, NULL, NULL, NULL, 0),
(79, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: currentUser', '01-24-2022 11:05:50', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\src\\View\\Helper\\Service\\UserAwareControlFactory.php', '25', NULL, 0),
(80, NULL, NULL, NULL, NULL, NULL, 'INFO', 'send-email', '01-24-2022 11:06:15', 6, NULL, NULL, NULL, NULL, NULL, 0),
(81, NULL, NULL, NULL, NULL, NULL, 'INFO', 'send-email', '01-25-2022 4:51:29', 6, NULL, NULL, NULL, NULL, NULL, 0),
(82, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: currentUser', '01-25-2022 4:51:56', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\src\\View\\Helper\\Service\\UserAwareControlFactory.php', '25', NULL, 0),
(83, NULL, NULL, NULL, NULL, NULL, 'INFO', 'submit-email', '01-25-2022 4:51:58', 6, NULL, NULL, NULL, NULL, NULL, 0),
(84, NULL, NULL, NULL, NULL, NULL, 'INFO', 'send-email', '01-25-2022 4:52:08', 6, NULL, NULL, NULL, NULL, NULL, 0),
(85, 50, 'test', NULL, NULL, NULL, 'INFO', 'Password change request', '01-25-2022 4:52:11', 6, NULL, NULL, NULL, NULL, NULL, 0),
(86, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: currentUser', '01-25-2022 4:52:11', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\src\\View\\Helper\\Service\\UserAwareControlFactory.php', '25', NULL, 0),
(87, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: currentUser', '01-25-2022 6:39:16', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\src\\View\\Helper\\Service\\UserAwareControlFactory.php', '25', NULL, 0),
(88, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: currentUser', '01-25-2022 6:40:22', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\src\\View\\Helper\\Service\\UserAwareControlFactory.php', '25', NULL, 0),
(89, NULL, NULL, NULL, NULL, NULL, 'INFO', 'submit-email', '01-25-2022 6:40:40', 6, NULL, NULL, NULL, NULL, NULL, 0),
(90, NULL, NULL, NULL, NULL, NULL, 'INFO', 'send-email', '01-25-2022 6:40:50', 6, NULL, NULL, NULL, NULL, NULL, 0),
(91, 50, 'test', NULL, NULL, NULL, 'INFO', 'Password change request', '01-25-2022 6:40:53', 6, NULL, NULL, NULL, NULL, NULL, 0),
(92, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: currentUser', '01-25-2022 6:40:53', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\src\\View\\Helper\\Service\\UserAwareControlFactory.php', '25', NULL, 0),
(93, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: currentUser', '01-25-2022 6:42:01', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\src\\View\\Helper\\Service\\UserAwareControlFactory.php', '25', NULL, 0),
(94, NULL, NULL, NULL, NULL, NULL, 'INFO', 'submit-email', '01-25-2022 6:51:54', 6, NULL, NULL, NULL, NULL, NULL, 0),
(95, NULL, NULL, NULL, NULL, NULL, 'INFO', 'send-email', '01-25-2022 6:52:08', 6, NULL, NULL, NULL, NULL, NULL, 0),
(96, 50, 'test', NULL, NULL, NULL, 'INFO', 'Password change request', '01-25-2022 6:52:10', 6, NULL, NULL, NULL, NULL, NULL, 0),
(97, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-25-2022 6:57:23', 6, NULL, NULL, NULL, NULL, NULL, 0),
(98, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-25-2022 7:11:03', 6, NULL, NULL, NULL, NULL, NULL, 0),
(99, NULL, NULL, NULL, NULL, NULL, 'INFO', 'reset-password', '01-25-2022 7:18:07', 6, NULL, NULL, NULL, NULL, NULL, 0),
(100, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Unknown user from IP:::1 attempted to reset password with invalid or expired token', '01-25-2022 7:18:35', 5, NULL, NULL, NULL, NULL, NULL, 0),
(101, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: user', '01-25-2022 7:18:49', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\src\\Controller\\PasswordController.php', '119', NULL, 0),
(102, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'resetTimeStamp\' of non-object', '01-25-2022 7:18:49', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\src\\Controller\\PasswordController.php', '119', NULL, 0),
(103, NULL, NULL, NULL, NULL, NULL, 'INFO', 'submit-email', '01-25-2022 7:54:04', 6, NULL, NULL, NULL, NULL, NULL, 0),
(104, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: form', '01-26-2022 8:03:38', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\view\\user\\user\\login.phtml', '7', NULL, 0),
(105, 1, 'jsmith', NULL, 'Joey', 'Smith', 'INFO', 'User jsmith logged in.', '01-26-2022 8:03:39', 6, NULL, NULL, NULL, NULL, NULL, 0),
(106, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-26-2022 8:09:36', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '55', NULL, 0),
(107, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-26-2022 8:10:12', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '55', NULL, 0),
(108, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-26-2022 10:37:00', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '55', NULL, 0),
(109, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-26-2022 10:43:46', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '55', NULL, 0),
(110, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'enableContactUs\' of non-object', '01-27-2022 10:24:24', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\application\\index\\contact.phtml', '5', NULL, 0),
(111, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: form', '01-27-2022 10:24:39', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\view\\user\\user\\login.phtml', '7', NULL, 0),
(112, 1, 'jsmith', NULL, 'Joey', 'Smith', 'INFO', 'User jsmith logged in.', '01-27-2022 10:24:39', 6, NULL, NULL, NULL, NULL, NULL, 0),
(113, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: form', '01-27-2022 1:15:25', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\view\\user\\user\\login.phtml', '7', NULL, 0),
(114, 1, 'jsmith', NULL, 'Joey', 'Smith', 'INFO', 'User jsmith logged in.', '01-27-2022 1:15:26', 6, NULL, NULL, NULL, NULL, NULL, 0),
(115, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: form', '01-27-2022 1:41:24', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\view\\user\\user\\login.phtml', '7', NULL, 0),
(116, 1, 'jsmith', NULL, 'Joey', 'Smith', 'INFO', 'User jsmith logged in.', '01-27-2022 1:41:25', 6, NULL, NULL, NULL, NULL, NULL, 0),
(117, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module/skin/../view/default/layout/layout.phtml): failed to open stream: No such file or directory', '01-28-2022 12:49:51', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(118, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module/skin/../view/default/layout/layout.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-28-2022 12:49:51', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(119, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module/skin/../view/default/layout/layout.phtml): failed to open stream: No such file or directory', '01-28-2022 12:49:51', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(120, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module/skin/../view/default/layout/layout.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-28-2022 12:49:51', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(121, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module/skin/view/default/application/index/index.phtml): failed to open stream: No such file or directory', '01-28-2022 12:58:44', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(122, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module/skin/view/default/application/index/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-28-2022 12:58:44', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(123, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module/skin/view/default/module/application/index/index.phtml): failed to open stream: No such file or directory', '01-28-2022 12:59:35', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(124, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module/skin/view/default/module/application/index/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-28-2022 12:59:35', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(125, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-28-2022 2:28:24', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(126, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-28-2022 2:28:24', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(127, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-28-2022 2:28:24', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(128, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-28-2022 2:28:24', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(129, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-28-2022 2:36:12', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Skin\\view\\default\\layout\\layout.phtml', '54', NULL, 0),
(130, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: form', '01-28-2022 11:28:31', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\view\\user\\user\\login.phtml', '7', NULL, 0),
(131, 1, 'jsmith', NULL, 'Joey', 'Smith', 'INFO', 'User jsmith logged in.', '01-28-2022 11:28:31', 6, NULL, NULL, NULL, NULL, NULL, 0),
(132, 1, 'jsmith', NULL, 'Joey', 'Smith', 'INFO', 'User jsmith logged in.', '01-28-2022 11:29:42', 6, NULL, NULL, NULL, NULL, NULL, 0),
(133, 1, 'jsmith', NULL, 'Joey', 'Smith', 'INFO', 'User jsmith logged in.', '01-28-2022 11:29:53', 6, NULL, NULL, NULL, NULL, NULL, 0),
(134, 1, 'jsmith', NULL, 'Joey', 'Smith', 'INFO', 'User jsmith logged in.', '01-28-2022 11:36:27', 6, NULL, NULL, NULL, NULL, NULL, 0),
(135, 1, 'jsmith', NULL, 'Joey', 'Smith', 'INFO', 'User jsmith logged in.', '01-28-2022 11:37:07', 6, NULL, NULL, NULL, NULL, NULL, 0),
(136, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: form', '01-29-2022 1:02:10', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\view\\user\\user\\login.phtml', '7', NULL, 0),
(137, 1, 'jsmith', NULL, 'Joey', 'Smith', 'INFO', 'User jsmith logged in.', '01-29-2022 1:02:11', 6, NULL, NULL, NULL, NULL, NULL, 0),
(138, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined property: User\\Model\\Guest::$id', '01-29-2022 1:39:29', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\src\\Controller\\ProfileController.php', '41', NULL, 0),
(139, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined property: User\\Model\\Guest::$id', '01-29-2022 1:55:15', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\src\\Controller\\ProfileController.php', '41', NULL, 0),
(140, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: name', '01-29-2022 1:55:16', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\src\\Listener\\SkinListener.php', '85', NULL, 0),
(141, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined property: User\\Model\\Guest::$id', '01-29-2022 1:56:24', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\src\\Controller\\ProfileController.php', '41', NULL, 0),
(142, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined property: User\\Model\\Guest::$id', '01-29-2022 1:58:26', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\src\\Controller\\ProfileController.php', '41', NULL, 0),
(143, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: name', '01-29-2022 2:03:32', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\src\\Listener\\SkinListener.php', '85', NULL, 0),
(144, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined property: User\\Model\\Guest::$id', '01-29-2022 2:03:40', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\src\\Controller\\ProfileController.php', '41', NULL, 0),
(145, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: name', '01-29-2022 2:03:49', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\src\\Listener\\SkinListener.php', '85', NULL, 0),
(146, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined property: User\\Model\\Guest::$id', '01-29-2022 2:04:26', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\src\\Controller\\ProfileController.php', '41', NULL, 0),
(147, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: form', '01-29-2022 2:08:36', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\view\\user\\user\\login.phtml', '7', NULL, 0),
(148, 1, 'jsmith', NULL, 'Joey', 'Smith', 'INFO', 'User jsmith logged in.', '01-29-2022 2:08:36', 6, NULL, NULL, NULL, NULL, NULL, 0),
(149, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined property: User\\Model\\Guest::$id', '01-29-2022 7:56:38', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\src\\Controller\\ProfileController.php', '41', NULL, 0),
(150, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined property: User\\Model\\Guest::$id', '01-29-2022 8:01:22', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\src\\Controller\\ProfileController.php', '41', NULL, 0),
(151, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: form', '01-29-2022 8:14:45', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\view\\user\\user\\login.phtml', '7', NULL, 0),
(152, 1, 'jsmith', NULL, 'Joey', 'Smith', 'INFO', 'User jsmith logged in.', '01-29-2022 8:14:45', 6, NULL, NULL, NULL, NULL, NULL, 0),
(153, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: form', '01-30-2022 10:55:02', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\view\\user\\user\\login.phtml', '7', NULL, 0),
(154, 1, 'jsmith', NULL, 'Joey', 'Smith', 'INFO', 'User jsmith logged in.', '01-30-2022 10:55:02', 6, NULL, NULL, NULL, NULL, NULL, 0),
(155, NULL, NULL, NULL, NULL, NULL, 'INFO', 'submit-email', '01-30-2022 10:56:32', 6, NULL, NULL, NULL, NULL, NULL, 0),
(156, NULL, NULL, NULL, NULL, NULL, 'INFO', 'submit-email', '01-30-2022 11:03:11', 6, NULL, NULL, NULL, NULL, NULL, 0),
(157, NULL, NULL, NULL, NULL, NULL, 'INFO', 'submit-email', '01-30-2022 11:04:16', 6, NULL, NULL, NULL, NULL, NULL, 0),
(158, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Skin\\view\\test): failed to open stream: Permission denied', '01-30-2022 12:11:42', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(159, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module/skin/view/test\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 12:11:42', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(160, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Skin\\view\\test): failed to open stream: Permission denied', '01-30-2022 12:12:17', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(161, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module/skin/view/test/\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 12:12:17', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(162, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module/skin/view/test//index.phtml): failed to open stream: No such file or directory', '01-30-2022 12:13:15', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(163, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module/skin/view/test//index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 12:13:15', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(164, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: form', '01-30-2022 12:34:02', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\view\\user\\user\\login.phtml', '7', NULL, 0),
(165, 1, 'jsmith', NULL, 'Joey', 'Smith', 'INFO', 'User jsmith logged in.', '01-30-2022 12:34:03', 6, NULL, NULL, NULL, NULL, NULL, 0),
(166, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: form', '01-30-2022 12:35:40', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\view\\user\\user\\login.phtml', '7', NULL, 0),
(167, 1, 'jsmith', NULL, 'Joey', 'Smith', 'INFO', 'User jsmith logged in.', '01-30-2022 12:35:40', 6, NULL, NULL, NULL, NULL, NULL, 0),
(168, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: form', '01-30-2022 12:41:23', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\view\\user\\user\\login.phtml', '7', NULL, 0),
(169, 1, 'jsmith', NULL, 'Joey', 'Smith', 'INFO', 'User jsmith logged in.', '01-30-2022 12:41:23', 6, NULL, NULL, NULL, NULL, NULL, 0),
(170, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: form', '01-30-2022 12:46:35', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\view\\user\\user\\login.phtml', '7', NULL, 0),
(171, 1, 'jsmith', NULL, 'Joey', 'Smith', 'INFO', 'User jsmith logged in.', '01-30-2022 12:46:35', 6, NULL, NULL, NULL, NULL, NULL, 0),
(172, 1, 'jsmith', NULL, 'Joey', 'Smith', 'INFO', 'User jsmith logged in.', '01-30-2022 12:51:53', 6, NULL, NULL, NULL, NULL, NULL, 0),
(173, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: form', '01-30-2022 12:52:25', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\view\\user\\user\\login.phtml', '7', NULL, 0),
(174, 1, 'jsmith', NULL, 'Joey', 'Smith', 'INFO', 'User jsmith logged in.', '01-30-2022 12:52:25', 6, NULL, NULL, NULL, NULL, NULL, 0),
(175, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: form', '01-30-2022 12:59:01', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\view\\user\\user\\login.phtml', '7', NULL, 0),
(176, 1, 'jsmith', NULL, 'Joey', 'Smith', 'INFO', 'User jsmith logged in.', '01-30-2022 12:59:01', 6, NULL, NULL, NULL, NULL, NULL, 0),
(177, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined property: User\\Model\\Guest::$id', '01-30-2022 1:01:55', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\src\\Controller\\ProfileController.php', '41', NULL, 0),
(178, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: form', '01-30-2022 1:05:04', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\view\\user\\user\\login.phtml', '7', NULL, 0),
(179, 1, 'jsmith', NULL, 'Joey', 'Smith', 'INFO', 'User jsmith logged in.', '01-30-2022 1:05:05', 6, NULL, NULL, NULL, NULL, NULL, 0),
(180, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: form', '01-30-2022 1:10:26', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\view\\user\\user\\login.phtml', '7', NULL, 0),
(181, 1, 'jsmith', NULL, 'Joey', 'Smith', 'INFO', 'User jsmith logged in.', '01-30-2022 1:10:27', 6, NULL, NULL, NULL, NULL, NULL, 0),
(182, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: form', '01-30-2022 3:12:32', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\view\\user\\user\\login.phtml', '7', NULL, 0),
(183, 1, 'jsmith', NULL, 'Joey', 'Smith', 'INFO', 'User jsmith logged in.', '01-30-2022 3:12:33', 6, NULL, NULL, NULL, NULL, NULL, 0),
(184, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined property: User\\Model\\Guest::$id', '01-30-2022 3:36:57', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\src\\Controller\\ProfileController.php', '41', NULL, 0),
(185, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: form', '01-30-2022 3:38:47', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\view\\user\\user\\login.phtml', '7', NULL, 0),
(186, 1, 'jsmith', NULL, 'Joey', 'Smith', 'INFO', 'User jsmith logged in.', '01-30-2022 3:38:48', 6, NULL, NULL, NULL, NULL, NULL, 0),
(187, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: form', '01-30-2022 3:42:05', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\view\\user\\user\\login.phtml', '7', NULL, 0),
(188, 1, 'jsmith', NULL, 'Joey', 'Smith', 'INFO', 'User jsmith logged in.', '01-30-2022 3:42:06', 6, NULL, NULL, NULL, NULL, NULL, 0),
(189, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined variable: form', '01-30-2022 3:54:31', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\view\\user\\user\\login.phtml', '7', NULL, 0),
(190, 1, 'jsmith', NULL, 'Joey', 'Smith', 'INFO', 'User jsmith logged in.', '01-30-2022 3:54:32', 6, NULL, NULL, NULL, NULL, NULL, 0),
(191, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 5:16:48', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(192, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 5:16:53', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(193, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module/skin/view/test/layout/layout.phtml): failed to open stream: No such file or directory', '01-30-2022 5:19:11', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(194, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module/skin/view/test/layout/layout.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 5:19:11', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(195, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module/skin/view/test/layout/layout.phtml): failed to open stream: No such file or directory', '01-30-2022 5:19:11', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(196, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module/skin/view/test/layout/layout.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 5:19:11', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(197, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 5:19:11', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(198, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module/skin/view/test/layout/layout.phtml): failed to open stream: No such file or directory', '01-30-2022 5:20:35', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(199, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module/skin/view/test/layout/layout.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 5:20:35', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(200, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module/skin/view/test/layout/layout.phtml): failed to open stream: No such file or directory', '01-30-2022 5:20:35', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(201, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module/skin/view/test/layout/layout.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 5:20:35', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(202, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 5:20:35', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(203, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module/skin/view/test/layout/layout.phtml): failed to open stream: No such file or directory', '01-30-2022 5:21:41', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(204, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module/skin/view/test/layout/layout.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 5:21:41', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(205, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module/skin/view/test/layout/layout.phtml): failed to open stream: No such file or directory', '01-30-2022 5:21:41', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(206, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module/skin/view/test/layout/layout.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 5:21:41', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(207, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 5:21:42', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(208, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module/Skin/view/test/layout/layout.phtml): failed to open stream: No such file or directory', '01-30-2022 5:23:16', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(209, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module/Skin/view/test/layout/layout.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 5:23:16', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(210, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module/Skin/view/test/layout/layout.phtml): failed to open stream: No such file or directory', '01-30-2022 5:23:16', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(211, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module/Skin/view/test/layout/layout.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 5:23:16', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(212, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 5:23:17', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(213, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module/Skin/view/test/layout/layout.phtml): failed to open stream: No such file or directory', '01-30-2022 5:29:39', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(214, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module/Skin/view/test/layout/layout.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 5:29:39', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(215, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module/Skin/view/test/layout/layout.phtml): failed to open stream: No such file or directory', '01-30-2022 5:29:39', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(216, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module/Skin/view/test/layout/layout.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 5:29:39', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(217, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 5:29:40', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(218, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 5:36:26', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(219, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 5:36:31', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(220, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 5:37:13', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(221, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 6:07:54', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(222, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 6:07:54', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(223, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 6:07:54', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(224, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 6:07:54', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(225, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 6:07:58', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(226, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 6:07:58', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(227, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 6:07:58', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(228, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 6:07:58', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(229, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 6:17:12', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(230, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 6:17:12', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(231, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 6:17:12', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(232, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 6:17:12', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(233, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 6:17:39', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(234, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 6:17:39', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(235, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 6:17:39', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(236, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 6:17:39', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(237, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 6:17:46', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(238, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 6:17:46', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(239, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 6:17:46', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(240, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 6:17:46', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(241, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 6:18:55', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(242, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 6:18:55', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(243, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 6:18:55', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(244, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 6:18:55', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(245, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 6:19:00', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0);
INSERT INTO `log` (`logId`, `extra_userId`, `extra_userName`, `extra_role`, `extra_firstName`, `extra_lastName`, `priorityName`, `message`, `timeStamp`, `priority`, `extra_referenceId`, `extra_errno`, `extra_file`, `extra_line`, `extra_trace`, `fileId`) VALUES
(246, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 6:19:00', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(247, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 6:19:00', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(248, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 6:19:00', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(249, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 6:36:56', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(250, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 6:36:56', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(251, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 6:36:56', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(252, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 6:36:56', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(253, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 6:40:20', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(254, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 6:40:20', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(255, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 6:40:20', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(256, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 6:40:20', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(257, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 6:44:43', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(258, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 6:44:43', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(259, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 6:44:43', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(260, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 6:44:43', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(261, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 7:08:38', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(262, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 7:08:38', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(263, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 7:08:38', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(264, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 7:08:38', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(265, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 7:15:34', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(266, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 7:15:34', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(267, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 7:15:34', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(268, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 7:15:34', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(269, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 7:15:53', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(270, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 7:15:53', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(271, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 7:15:53', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(272, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 7:15:53', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(273, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 7:15:57', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(274, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 7:15:57', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(275, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 7:15:57', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(276, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 7:15:57', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(277, NULL, NULL, NULL, NULL, NULL, 'INFO', 'submit-email', '01-30-2022 7:15:59', 6, NULL, NULL, NULL, NULL, NULL, 0),
(278, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 7:16:00', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(279, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 7:16:00', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(280, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 7:16:00', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(281, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 7:16:00', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(282, NULL, NULL, NULL, NULL, NULL, 'INFO', 'submit-email', '01-30-2022 7:19:51', 6, NULL, NULL, NULL, NULL, NULL, 0),
(283, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 7:21:49', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(284, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 7:21:49', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(285, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 7:21:49', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(286, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 7:21:49', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(287, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 7:21:59', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(288, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 7:21:59', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(289, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 7:21:59', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(290, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 7:21:59', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(291, 1, 'jsmith', NULL, 'Joey', 'Smith', 'INFO', 'User jsmith logged in.', '01-30-2022 7:22:01', 6, NULL, NULL, NULL, NULL, NULL, 0),
(292, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 7:22:02', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(293, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 7:22:02', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(294, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 7:22:02', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(295, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 7:22:02', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(296, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 7:22:05', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(297, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 7:22:05', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(298, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 7:22:05', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(299, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 7:22:05', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(300, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 7:51:44', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(301, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 7:51:44', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(302, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 7:51:44', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(303, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 7:51:44', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(304, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 7:52:56', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(305, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 7:52:56', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(306, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 7:52:56', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(307, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 7:52:56', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(308, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 7:57:06', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(309, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 7:57:06', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(310, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 7:57:06', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(311, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 7:57:06', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(312, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 8:06:20', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(313, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 8:06:20', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(314, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 8:06:20', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(315, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 8:06:20', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(316, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 8:06:27', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(317, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 8:06:27', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(318, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 8:06:27', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(319, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 8:06:27', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(320, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 8:06:32', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(321, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 8:06:32', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(322, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 8:06:32', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(323, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 8:06:32', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(324, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 8:07:33', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(325, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 8:07:33', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(326, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 8:07:33', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(327, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 8:07:33', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(328, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 8:07:58', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(329, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 8:07:58', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(330, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 8:07:58', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(331, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 8:07:58', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(332, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 8:08:53', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(333, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 8:08:53', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(334, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 8:08:53', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(335, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 8:08:53', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(336, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 8:09:00', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(337, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 8:09:00', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(338, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 8:09:00', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(339, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 8:09:00', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(340, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 8:15:09', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(341, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 8:15:09', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(342, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 8:15:09', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(343, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 8:15:09', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(344, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 8:15:35', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(345, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 8:15:35', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(346, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 8:15:35', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(347, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 8:15:35', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(348, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 8:36:00', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(349, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 8:36:00', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(350, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 8:36:00', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(351, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 8:36:00', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(352, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 8:40:50', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(353, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 8:40:50', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(354, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 8:40:50', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(355, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 8:40:50', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(356, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 8:43:01', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(357, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 8:43:01', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(358, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 8:43:01', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(359, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 8:43:01', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(360, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 8:43:46', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(361, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 8:43:46', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(362, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 8:43:46', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(363, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 8:43:46', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(364, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 8:43:51', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(365, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 8:43:51', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(366, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 8:43:51', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(367, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 8:43:51', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(368, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 8:44:01', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(369, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 8:44:01', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(370, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 8:44:01', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(371, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 8:44:01', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(372, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 9:05:51', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(373, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 9:05:51', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(374, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 9:05:51', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(375, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 9:05:51', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(376, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\view\\skins\\test): failed to open stream: Permission denied', '01-30-2022 9:07:34', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(377, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application/view/skins/test\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 9:07:34', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(378, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 9:07:34', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(379, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 9:07:34', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(380, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 9:07:34', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(381, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 9:07:34', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(382, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 9:07:34', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(383, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 9:07:34', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(384, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 9:08:07', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(385, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 9:08:07', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(386, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 9:08:07', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(387, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 9:08:07', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(388, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 9:08:29', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(389, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 9:08:29', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(390, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 9:08:29', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(391, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 9:08:29', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(392, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 9:08:35', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(393, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 9:08:35', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(394, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 9:08:35', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(395, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 9:08:35', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(396, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml): failed to open stream: No such file or directory', '01-30-2022 9:09:12', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0);
INSERT INTO `log` (`logId`, `extra_userId`, `extra_userName`, `extra_role`, `extra_firstName`, `extra_lastName`, `priorityName`, `message`, `timeStamp`, `priority`, `extra_referenceId`, `extra_errno`, `extra_file`, `extra_line`, `extra_trace`, `fileId`) VALUES
(397, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/404.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 9:09:12', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(398, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml): failed to open stream: No such file or directory', '01-30-2022 9:09:12', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(399, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/error/index.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 9:09:12', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(400, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/skins/default/layout/layout.phtml): failed to open stream: No such file or directory', '01-30-2022 9:17:44', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(401, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/skins/default/layout/layout.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 9:17:44', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(402, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/skins/default/layout/layout.phtml): failed to open stream: No such file or directory', '01-30-2022 9:17:44', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(403, NULL, NULL, NULL, NULL, NULL, 'WARN', 'include(): Failed opening \'C:\\htdocs\\aurora-2.0\\module\\Application\\config/../view/skins/default/layout/layout.phtml\' for inclusion (include_path=\'.;C:\\php\\pear\')', '01-30-2022 9:17:44', 4, NULL, '2', 'C:\\htdocs\\aurora-2.0\\vendor\\laminas\\laminas-view\\src\\Renderer\\PhpRenderer.php', '519', NULL, 0),
(404, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 9:18:36', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(405, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 9:18:42', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(406, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 9:19:44', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(407, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 9:23:55', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(408, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 9:24:05', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(409, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 9:24:07', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(410, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 9:24:08', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(411, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 9:24:10', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(412, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 9:24:11', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(413, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 9:24:13', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(414, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 9:24:15', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(415, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 9:24:16', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(416, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 9:24:47', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(417, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 9:24:51', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(418, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 9:24:53', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(419, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 9:24:56', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(420, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 9:24:58', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(421, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 9:25:01', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(422, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 9:25:03', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(423, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 9:25:07', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(424, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 9:25:09', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(425, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 9:25:11', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(426, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 9:25:13', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(427, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 9:25:17', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(428, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 9:25:20', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(429, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 9:25:22', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(430, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 9:25:50', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(431, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 9:25:54', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(432, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 9:26:10', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(433, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 9:26:14', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(434, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 9:30:30', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(435, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 9:30:36', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(436, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 9:30:38', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(437, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 9:30:41', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(438, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 9:30:44', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(439, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 9:30:47', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(440, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 10:06:53', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(441, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-30-2022 10:18:23', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(442, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 1:52:12', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(443, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 3:28:30', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(444, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 3:28:32', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(445, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 3:28:35', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(446, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 3:28:37', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(447, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 3:28:39', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(448, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 3:28:42', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(449, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 3:28:47', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(450, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 3:28:49', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(451, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 3:28:51', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(452, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 5:04:53', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(453, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 5:04:54', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(454, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 5:06:33', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(455, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 5:06:34', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(456, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 5:26:10', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(457, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 5:26:11', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(458, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 5:32:48', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(459, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 5:32:49', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(460, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 5:37:22', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(461, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 5:37:24', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(462, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 5:38:09', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(463, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 5:38:10', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(464, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 5:48:37', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(465, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 5:48:38', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(466, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 5:51:54', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(467, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 5:51:55', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(468, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 5:59:58', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(469, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 5:59:59', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(470, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 6:00:48', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(471, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 6:00:50', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(472, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 6:01:44', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(473, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 6:01:45', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(474, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 6:05:12', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(475, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 6:05:13', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(476, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 6:05:44', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(477, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 6:05:45', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(478, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 6:08:19', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(479, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 6:08:20', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(480, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 6:11:44', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(481, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 6:13:47', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(482, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 6:14:34', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(483, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 6:17:12', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(484, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 6:19:13', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(485, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 6:19:33', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(486, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 6:23:13', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(487, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 6:23:57', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(488, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 6:27:29', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(489, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 6:28:06', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(490, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 6:28:29', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(491, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 9:05:02', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(492, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 9:09:51', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(493, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 9:09:52', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(494, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 9:11:56', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(495, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 9:11:57', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(496, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 9:13:23', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(497, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 9:13:24', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(498, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 9:14:46', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(499, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 9:20:59', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(500, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 9:21:16', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(501, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 9:32:29', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(502, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 9:35:17', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(503, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 9:37:04', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(504, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 9:37:24', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(505, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 9:44:38', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(506, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 9:44:42', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(507, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 10:10:53', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(508, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 10:11:10', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(509, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 10:11:11', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(510, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 10:12:35', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(511, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 10:12:50', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(512, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 10:13:25', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(513, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 10:13:45', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(514, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 10:55:59', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(515, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 10:56:01', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(516, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 10:56:06', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(517, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 10:56:27', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(518, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 10:56:37', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(519, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '01-31-2022 11:37:24', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(520, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '02-1-2022 8:10:33', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(521, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '02-1-2022 8:11:00', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(522, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '02-1-2022 8:11:20', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(523, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '02-1-2022 8:53:57', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(524, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '02-1-2022 1:54:14', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(525, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '02-1-2022 1:54:16', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(526, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '02-1-2022 1:54:19', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(527, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '02-1-2022 1:54:22', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(528, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '02-1-2022 1:54:36', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0),
(529, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Trying to get property \'role\' of non-object', '02-1-2022 1:54:40', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\view\\layout\\layout.phtml', '54', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `modulesettings`
--

DROP TABLE IF EXISTS `modulesettings`;
CREATE TABLE IF NOT EXISTS `modulesettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variable` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `settingType` tinytext NOT NULL,
  `label` tinytext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `variable` (`variable`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `id` char(32) NOT NULL,
  `name` char(32) NOT NULL,
  `modified` int(11) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`id`, `name`, `modified`, `lifetime`, `data`) VALUES
('j15hgd5s9fsgb14j1ilibabhfh', 'PHPSESSID', 1643745280, 86400, '__Laminas|a:5:{s:20:\"_REQUEST_ACCESS_TIME\";d:1643745280.312338;s:6:\"_VALID\";a:1:{s:28:\"Laminas\\Session\\Validator\\Id\";s:26:\"idquf0tmgn6pg1rf9eq61mdkfe\";}s:14:\"FlashMessenger\";a:0:{}s:53:\"Laminas_Form_Captcha_1996ea41c164db908151532edd5f20f2\";a:2:{s:11:\"EXPIRE_HOPS\";a:2:{s:4:\"hops\";i:1;s:2:\"ts\";d:1643591759.057923;}s:6:\"EXPIRE\";i:1643592059;}s:53:\"Laminas_Form_Captcha_54f68b3f99bf3b88b42b418c0b10760b\";a:2:{s:11:\"EXPIRE_HOPS\";a:2:{s:4:\"hops\";i:1;s:2:\"ts\";d:1643691386.84114;}s:6:\"EXPIRE\";i:1643691686;}}initialized|O:26:\"Laminas\\Stdlib\\ArrayObject\":4:{s:7:\"storage\";a:3:{s:4:\"init\";i:1;s:10:\"remoteAddr\";s:3:\"::1\";s:13:\"httpUserAgent\";s:90:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:97.0) Gecko/20100101 Firefox/97.0 FirePHP/0.5\";}s:4:\"flag\";i:2;s:13:\"iteratorClass\";s:13:\"ArrayIterator\";s:19:\"protectedProperties\";a:4:{i:0;s:7:\"storage\";i:1;s:4:\"flag\";i:2;s:13:\"iteratorClass\";i:3;s:19:\"protectedProperties\";}}Laminas_Auth|O:26:\"Laminas\\Stdlib\\ArrayObject\":4:{s:7:\"storage\";a:1:{s:7:\"storage\";s:6:\"jsmith\";}s:4:\"flag\";i:2;s:13:\"iteratorClass\";s:13:\"ArrayIterator\";s:19:\"protectedProperties\";a:4:{i:0;s:7:\"storage\";i:1;s:4:\"flag\";i:2;s:13:\"iteratorClass\";i:3;s:19:\"protectedProperties\";}}FlashMessenger|O:26:\"Laminas\\Stdlib\\ArrayObject\":4:{s:7:\"storage\";a:0:{}s:4:\"flag\";i:2;s:13:\"iteratorClass\";s:13:\"ArrayIterator\";s:19:\"protectedProperties\";a:4:{i:0;s:7:\"storage\";i:1;s:4:\"flag\";i:2;s:13:\"iteratorClass\";i:3;s:19:\"protectedProperties\";}}Laminas_Form_Captcha_1996ea41c164db908151532edd5f20f2|O:26:\"Laminas\\Stdlib\\ArrayObject\":4:{s:7:\"storage\";a:1:{s:4:\"word\";s:5:\"xo9up\";}s:4:\"flag\";i:2;s:13:\"iteratorClass\";s:13:\"ArrayIterator\";s:19:\"protectedProperties\";a:4:{i:0;s:7:\"storage\";i:1;s:4:\"flag\";i:2;s:13:\"iteratorClass\";i:3;s:19:\"protectedProperties\";}}Laminas_Form_Captcha_54f68b3f99bf3b88b42b418c0b10760b|O:26:\"Laminas\\Stdlib\\ArrayObject\":4:{s:7:\"storage\";a:1:{s:4:\"word\";s:5:\"j82a7\";}s:4:\"flag\";i:2;s:13:\"iteratorClass\";s:13:\"ArrayIterator\";s:19:\"protectedProperties\";a:4:{i:0;s:7:\"storage\";i:1;s:4:\"flag\";i:2;s:13:\"iteratorClass\";i:3;s:19:\"protectedProperties\";}}'),
('6ek6r7sm9mjia27l2q95dr9sn8', 'PHPSESSID', 1643693844, 86400, '__Laminas|a:2:{s:20:\"_REQUEST_ACCESS_TIME\";d:1643693844.364872;s:6:\"_VALID\";a:1:{s:28:\"Laminas\\Session\\Validator\\Id\";s:26:\"ouiicscgsklfas4r26c866633n\";}}initialized|O:26:\"Laminas\\Stdlib\\ArrayObject\":4:{s:7:\"storage\";a:3:{s:4:\"init\";i:1;s:10:\"remoteAddr\";s:3:\"::1\";s:13:\"httpUserAgent\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36\";}s:4:\"flag\";i:2;s:13:\"iteratorClass\";s:13:\"ArrayIterator\";s:19:\"protectedProperties\";a:4:{i:0;s:7:\"storage\";i:1;s:4:\"flag\";i:2;s:13:\"iteratorClass\";i:3;s:19:\"protectedProperties\";}}');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` tinytext,
  `variable` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `settingType` tinytext NOT NULL,
  `label` tinytext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `variable` (`variable`,`value`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `module`, `variable`, `value`, `settingType`, `label`) VALUES
(1, NULL, 'allowedTags', '<h1>,<h2>,<h3>,<h4>,<h5>,<h6>,<hr>', 'text', 'Allowed Tags'),
(2, NULL, 'enableCaptcha', '1', 'Checkbox', 'Enable Captcha Support'),
(3, NULL, 'recaptchaPrivateKey', '6Lewcs0SAAAAAGfBkJsG1mxf-yGFUjq9JgglSwRL', 'text', 'Recaptcha Private Key'),
(4, NULL, 'recaptchaPrivateKey', '6Lewcs0SAAAAAGfBkJsG1mxf-yGFUjq9JgglSwRL', 'text', 'Recaptcha Public Key'),
(5, NULL, 'seoKeyWords', 'Aurora CMS, Webinertia.net, Php, MySQL', 'text', 'SEO Key Words'),
(6, NULL, 'appName', 'ACMS', 'Text', 'Application Name'),
(7, NULL, 'smtpSenderAddress', 'devel@webinertia.net', 'Text', 'SMTP Sender Email'),
(8, NULL, 'smtpSenderPasswd', '', 'Text', 'SMTP Sender Password'),
(9, NULL, 'appContactEmail', 'jsmith@webinertia.net', 'Text', 'Website Contact Email'),
(10, NULL, 'enableMobileSupport', '1', 'CheckBox', 'Enable Mobile App support'),
(11, NULL, 'seoDescription', 'A Content Management System', 'text', 'SEO Description'),
(12, NULL, 'facebookAppId', '431812843521907', 'Text', 'Facebook App ID'),
(13, NULL, 'faceBookSecretKey', 'd86702c59bd48f3a76bc57d923cd237e', 'Text', 'Facebook App Secret Key'),
(14, NULL, 'enableFacebookPageLink', '1', 'CheckBox', 'Enable Facebook Page Link'),
(15, NULL, 'enableFacebookOg', '0', 'Checkbox', 'Enable Facebook Open Graph Support'),
(16, NULL, 'sessionLength', '86400', 'Text', 'Session Length (default is 1 day)'),
(17, NULL, 'enableOnlineList', '1', 'Checkbox', 'Enable Online List'),
(18, NULL, 'enableErrorLogging', '1', 'Checkbox', 'Enable Error Logging'),
(19, NULL, 'enableHomeTab', '1', 'Checkbox', 'Enable Home Menu Tab'),
(20, NULL, 'enableLinkedLogo', '1', 'Checkbox', 'Enable Linked Logo'),
(21, NULL, 'disableLogin', '0', 'checkbox', 'Disable User Login'),
(22, NULL, 'disableRegistration', '0', 'checkbox', 'Disable Registration'),
(23, NULL, 'timeFormat', 'm-j-Y g:i:s', 'text', 'Time Format (Month:Day:Year:Hr:Min:sec)'),
(24, NULL, 'timeZone', 'America/Chicago', 'text', 'Time Zone'),
(25, NULL, 'copyRightText', 'A Content Management Test', 'text', 'Site Copyright Text'),
(26, NULL, 'copyRightLink', 'http://webinertia.net/acms', 'text', 'Copyright Link (If any)'),
(27, NULL, 'footerText', 'Developed by @Tyrsson', 'text', 'Footer Text (Next to copyright)'),
(28, NULL, 'firebugDebug', '1', 'checkbox', 'Enable Firebug Debug Logger?'),
(29, NULL, 'enableTranslation', '0', 'checkbox', 'Enable Translation'),
(30, NULL, 'enableContactUs', '1', 'checkbox', 'Enable Contact Form');

-- --------------------------------------------------------

--
-- Table structure for table `skins`
--

DROP TABLE IF EXISTS `skins`;
CREATE TABLE IF NOT EXISTS `skins` (
  `skinId` int(11) NOT NULL AUTO_INCREMENT,
  `isCurrentSkin` int(1) NOT NULL DEFAULT '0',
  `skinName` varchar(50) DEFAULT NULL,
  `includeDefault` int(1) NOT NULL DEFAULT '1',
  `skinCssPath` varchar(255) DEFAULT NULL,
  `skinCssMobiPath` varchar(255) NOT NULL,
  `skinTemplatePath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`skinId`),
  UNIQUE KEY `skinName` (`skinName`),
  KEY `skinCssPath` (`skinCssPath`,`skinTemplatePath`),
  KEY `includeDefault` (`includeDefault`),
  KEY `isCurrentSkin` (`isCurrentSkin`),
  KEY `skinCssMobiPath` (`skinCssMobiPath`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `skins`
--

INSERT INTO `skins` (`skinId`, `isCurrentSkin`, `skinName`, `includeDefault`, `skinCssPath`, `skinCssMobiPath`, `skinTemplatePath`) VALUES
(1, 0, 'default', 0, 'skins/default/style.css', 'skins/default/style.mobi.css', NULL),
(9, 1, 'test', 1, 'skins/test/style.css', 'skins/red/style.mobi.css', NULL),
(11, 0, 'green', 1, 'skins/green/style.css', 'skins/green/style.mobi.css', NULL),
(12, 0, 'yellow', 1, 'skins/yellow/style.css', 'skins/yellow/style.mobi.css', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `store_categories`
--

DROP TABLE IF EXISTS `store_categories`;
CREATE TABLE IF NOT EXISTS `store_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `store_images`
--

DROP TABLE IF EXISTS `store_images`;
CREATE TABLE IF NOT EXISTS `store_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `fileName` tinytext,
  `uploadedTime` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `productId` (`productId`),
  KEY `categoryId` (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `store_orders`
--

DROP TABLE IF EXISTS `store_orders`;
CREATE TABLE IF NOT EXISTS `store_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `createdDate` varchar(255) DEFAULT NULL,
  `processedDate` varchar(255) DEFAULT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `data` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='will join user table userId > id';

-- --------------------------------------------------------

--
-- Table structure for table `store_products`
--

DROP TABLE IF EXISTS `store_products`;
CREATE TABLE IF NOT EXISTS `store_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `cost` decimal(10,2) NOT NULL,
  `weight` decimal(6,2) NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `createdDate` varchar(255) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='will join user table on userId > id';

-- --------------------------------------------------------

--
-- Table structure for table `store_products_by_category_lookup`
--

DROP TABLE IF EXISTS `store_products_by_category_lookup`;
CREATE TABLE IF NOT EXISTS `store_products_by_category_lookup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `productId` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(100) NOT NULL,
  `email` varchar(320) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'user',
  `sessionLength` int(11) NOT NULL DEFAULT '86400',
  `companyName` varchar(255) DEFAULT NULL,
  `regDate` tinytext,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `regHash` varchar(255) DEFAULT NULL,
  `resetTimeStamp` varchar(255) DEFAULT NULL,
  `resetHash` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='will join user_profile table on id';

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `userName`, `email`, `password`, `role`, `sessionLength`, `companyName`, `regDate`, `active`, `verified`, `regHash`, `resetTimeStamp`, `resetHash`) VALUES
(1, 'jsmith', 'jsmith1@webinertia.net', '$2y$10$buYOVRO7oURp1Ej3/mNBK.9c.Yo.LH49Iba2Q1l7F3Lmr6dRzAACq', 'admin', 86400, '', '2021-11-08 22:26:20', 1, 1, NULL, NULL, NULL),
(7, 'Chino', 'eduardomdzhernandez@gmail.com', '$2y$10$ied9xYircXBuCku0pSxzSezlLZdj1sXXT8faNSpvYgs5rjYR4rvF6', 'user', 86400, NULL, '2021-11-17 19:32:46', 0, 0, NULL, NULL, NULL),
(28, 'Evolvecms', 'firecms@fireevolve.com', '$2y$10$9AC5q2opUcocoIW.BlvoiOvcrIx.cv50Qh4wFE2EegsQ5cZaFRqvq', 'user', 86400, NULL, '12-23-2021 4:24:14', 0, 0, '$2y$10$VM8AEPL7X5zicTeptiEdaexAP81BE7Qlam04JjDYcNQoG9lXtY4ni', NULL, NULL),
(50, 'test', 'jsmith@webinertia.net', '$2y$10$xkVgS/LZQ4DEkmCyE2TqAOY1.XJa7v.pEqKIRz/ztnmS7wVT4OClK', 'user', 86400, NULL, '01-12-2022 1:54:43', 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
CREATE TABLE IF NOT EXISTS `user_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `profileImage` mediumtext,
  `age` int(11) DEFAULT NULL,
  `birthday` varchar(10) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `race` varchar(255) DEFAULT NULL,
  `bio` text,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='dependent upon users table relational key is userId';

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`id`, `userId`, `firstName`, `lastName`, `profileImage`, `age`, `birthday`, `gender`, `race`, `bio`) VALUES
(1, 1, 'Joey', 'Smith', 'profileImage_61db8e71221c28_50360800.jpg', 46, '2022-01-01', NULL, NULL, NULL),
(14, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` tinytext NOT NULL,
  `inheritsFrom` tinytext,
  `label` tinytext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `role`, `inheritsFrom`, `label`) VALUES
(1, 'user', 'guest', 'Standard User'),
(2, 'moderator', 'user', 'Moderator'),
(3, 'admin', 'moderator', 'Administrator');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `log_ibfk_1` FOREIGN KEY (`extra_userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `store_images`
--
ALTER TABLE `store_images`
  ADD CONSTRAINT `store_images_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `store_products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `store_images_ibfk_2` FOREIGN KEY (`categoryId`) REFERENCES `store_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `store_orders`
--
ALTER TABLE `store_orders`
  ADD CONSTRAINT `store_orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `store_products`
--
ALTER TABLE `store_products`
  ADD CONSTRAINT `store_products_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `store_products_by_category_lookup`
--
ALTER TABLE `store_products_by_category_lookup`
  ADD CONSTRAINT `store_products_by_category_lookup_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `store_products` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD CONSTRAINT `user_profile_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
