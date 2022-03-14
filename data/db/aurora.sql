-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 14, 2022 at 02:10 PM
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
-- Database: `aurora`
--
CREATE DATABASE IF NOT EXISTS `aurora` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `aurora`;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
CREATE TABLE IF NOT EXISTS `log` (
  `logId` int(11) NOT NULL AUTO_INCREMENT,
  `extra_userId` int(11) DEFAULT NULL,
  `extra_userName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_role` tinytext COLLATE utf8mb4_unicode_ci,
  `extra_firstName` tinytext COLLATE utf8mb4_unicode_ci,
  `extra_lastName` tinytext COLLATE utf8mb4_unicode_ci,
  `priorityName` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `timeStamp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(1) NOT NULL,
  `extra_referenceId` tinytext COLLATE utf8mb4_unicode_ci,
  `extra_errno` tinytext COLLATE utf8mb4_unicode_ci,
  `extra_file` text COLLATE utf8mb4_unicode_ci,
  `extra_line` text COLLATE utf8mb4_unicode_ci,
  `extra_trace` text COLLATE utf8mb4_unicode_ci,
  `fileId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`logId`),
  KEY `userId` (`extra_userId`)
<<<<<<< HEAD
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
=======
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
>>>>>>> 1.0.0-Alpha

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`logId`, `extra_userId`, `extra_userName`, `extra_role`, `extra_firstName`, `extra_lastName`, `priorityName`, `message`, `timeStamp`, `priority`, `extra_referenceId`, `extra_errno`, `extra_file`, `extra_line`, `extra_trace`, `fileId`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined property: Laminas\\Authentication\\AuthenticationService::$getIdentity', '03-12-2022 4:19:23', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\src\\Controller\\IndexController.php', '19', NULL, 0),
(2, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined property: Laminas\\Authentication\\AuthenticationService::$getIdentity', '03-12-2022 4:20:02', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\src\\Controller\\IndexController.php', '19', NULL, 0),
(3, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined property: Laminas\\Authentication\\Storage\\Session::$jsmith', '03-12-2022 4:25:25', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\src\\Controller\\IndexController.php', '21', NULL, 0),
(4, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined property: Laminas\\Authentication\\Storage\\Session::$jsmith', '03-12-2022 4:29:49', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\Application\\src\\Controller\\IndexController.php', '22', NULL, 0),
(5, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined property: User\\Controller\\ProfileController::$profileTable', '03-13-2022 10:34:42', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\src\\Controller\\ProfileController.php', '33', NULL, 0),
<<<<<<< HEAD
(6, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined property: User\\Controller\\ProfileController::$profileTable', '03-13-2022 10:35:10', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\src\\Controller\\ProfileController.php', '33', NULL, 0);
=======
(6, NULL, NULL, NULL, NULL, NULL, 'NOTICE', 'Undefined property: User\\Controller\\ProfileController::$profileTable', '03-13-2022 10:35:10', 5, NULL, '8', 'C:\\htdocs\\aurora-2.0\\module\\User\\src\\Controller\\ProfileController.php', '33', NULL, 0),
(7, NULL, NULL, NULL, NULL, NULL, 'INFO', 'submit-email', '03-13-2022 11:36:59', 6, NULL, NULL, NULL, NULL, NULL, 0),
(8, NULL, NULL, NULL, NULL, NULL, 'INFO', 'submit-email', '03-13-2022 11:38:58', 6, NULL, NULL, NULL, NULL, NULL, 0);
>>>>>>> 1.0.0-Alpha

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified` int(11) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `data` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `name`, `modified`, `lifetime`, `data`) VALUES
<<<<<<< HEAD
('t9pt03p2l62cunnpv6n4e3ntl5', 'PHPSESSID', 1647185750, 1209600, '__Laminas|a:3:{s:20:\"_REQUEST_ACCESS_TIME\";d:1647185750.470541;s:6:\"_VALID\";a:1:{s:28:\"Laminas\\Session\\Validator\\Id\";s:26:\"t9pt03p2l62cunnpv6n4e3ntl5\";}s:14:\"FlashMessenger\";a:1:{s:11:\"EXPIRE_HOPS\";a:2:{s:4:\"hops\";i:0;s:2:\"ts\";d:1647185710.504811;}}}Laminas_Auth|O:26:\"Laminas\\Stdlib\\ArrayObject\":4:{s:7:\"storage\";a:1:{s:7:\"storage\";s:6:\"jsmith\";}s:4:\"flag\";i:2;s:13:\"iteratorClass\";s:13:\"ArrayIterator\";s:19:\"protectedProperties\";a:4:{i:0;s:7:\"storage\";i:1;s:4:\"flag\";i:2;s:13:\"iteratorClass\";i:3;s:19:\"protectedProperties\";}}FlashMessenger|O:26:\"Laminas\\Stdlib\\ArrayObject\":4:{s:7:\"storage\";a:0:{}s:4:\"flag\";i:2;s:13:\"iteratorClass\";s:13:\"ArrayIterator\";s:19:\"protectedProperties\";a:4:{i:0;s:7:\"storage\";i:1;s:4:\"flag\";i:2;s:13:\"iteratorClass\";i:3;s:19:\"protectedProperties\";}}');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variable` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settingType` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `variable` (`variable`,`value`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `variable`, `value`, `settingType`, `label`) VALUES
(1, 'allowedTags', '<h1>,<h2>,<h3>,<h4>,<h5>,<h6>,<hr>', 'text', 'Allowed Tags'),
(2, 'enableCaptcha', '0', 'Checkbox', 'Enable Captcha Support'),
(3, 'recaptchaPrivateKey', '6Lewcs0SAAAAAGfBkJsG1mxf-yGFUjq9JgglSwRL', 'text', 'Recaptcha Private Key'),
(4, 'recaptchaPrivateKey', '6Lewcs0SAAAAAGfBkJsG1mxf-yGFUjq9JgglSwRL', 'text', 'Recaptcha Public Key'),
(5, 'seoKeyWords', 'Aurora CMS, Webinertia.net, Php, MySQL', 'text', 'SEO Key Words'),
(6, 'appName', 'ACMS', 'Text', 'Application Name'),
(7, 'smtpSenderAddress', '', 'Text', 'SMTP Sender Email'),
(8, 'smtpSenderPasswd', '', 'Text', 'SMTP Sender Password'),
(9, 'appContactEmail', 'jsmith@webinertia.net', 'Text', 'Website Contact Email'),
(10, 'enableMobileSupport', '1', 'CheckBox', 'Enable Mobile App support'),
(11, 'seoDescription', 'A Content Management System', 'text', 'SEO Description'),
(12, 'facebookAppId', '431812843521907', 'Text', 'Facebook App ID'),
(13, 'faceBookSecretKey', 'd86702c59bd48f3a76bc57d923cd237e', 'Text', 'Facebook App Secret Key'),
(14, 'enableFacebookPageLink', '1', 'CheckBox', 'Enable Facebook Page Link'),
(15, 'enableFacebookOg', '0', 'Checkbox', 'Enable Facebook Open Graph Support'),
(16, 'sessionLength', '86400', 'Text', 'Session Length (default is 1 day)'),
(17, 'enableOnlineList', '1', 'Checkbox', 'Enable Online List'),
(18, 'enableErrorLogging', '1', 'Checkbox', 'Enable Error Logging'),
(19, 'enableHomeTab', '1', 'Checkbox', 'Enable Home Menu Tab'),
(20, 'enableLinkedLogo', '1', 'Checkbox', 'Enable Linked Logo'),
(21, 'disableLogin', '0', 'checkbox', 'Disable User Login'),
(22, 'disableRegistration', '0', 'checkbox', 'Disable Registration'),
(23, 'timeFormat', 'm-j-Y g:i:s', 'text', 'Time Format (Month:Day:Year:Hr:Min:sec)'),
(24, 'timeZone', 'America/Chicago', 'text', 'Time Zone'),
(25, 'copyRightText', 'A Content Management Test', 'text', 'Site Copyright Text'),
(26, 'copyRightLink', 'http://webinertia.net/acms', 'text', 'Copyright Link (If any)'),
(27, 'footerText', 'Developed by @Tyrsson', 'text', 'Footer Text (Next to copyright)'),
(28, 'firebugDebug', '1', 'checkbox', 'Enable Firebug Debug Logger?'),
(29, 'enableTranslation', '0', 'checkbox', 'Enable Translation'),
(30, 'enableContactUs', '1', 'checkbox', 'Enable Contact Form');
=======
('hclkrhfbn8q23l5eaojcvb3hbu', 'PHPSESSID', 1647232825, 1209600, '__Laminas|a:2:{s:20:\"_REQUEST_ACCESS_TIME\";d:1647232825.442909;s:6:\"_VALID\";a:1:{s:28:\"Laminas\\Session\\Validator\\Id\";s:26:\"hclkrhfbn8q23l5eaojcvb3hbu\";}}'),
('t9pt03p2l62cunnpv6n4e3ntl5', 'PHPSESSID', 1647235407, 1209600, '__Laminas|a:3:{s:20:\"_REQUEST_ACCESS_TIME\";d:1647235407.529436;s:6:\"_VALID\";a:1:{s:28:\"Laminas\\Session\\Validator\\Id\";s:26:\"t9pt03p2l62cunnpv6n4e3ntl5\";}s:14:\"FlashMessenger\";a:1:{s:11:\"EXPIRE_HOPS\";a:2:{s:4:\"hops\";i:0;s:2:\"ts\";d:1647185710.504811;}}}Laminas_Auth|O:26:\"Laminas\\Stdlib\\ArrayObject\":4:{s:7:\"storage\";a:1:{s:7:\"storage\";s:6:\"jsmith\";}s:4:\"flag\";i:2;s:13:\"iteratorClass\";s:13:\"ArrayIterator\";s:19:\"protectedProperties\";a:4:{i:0;s:7:\"storage\";i:1;s:4:\"flag\";i:2;s:13:\"iteratorClass\";i:3;s:19:\"protectedProperties\";}}FlashMessenger|O:26:\"Laminas\\Stdlib\\ArrayObject\":4:{s:7:\"storage\";a:0:{}s:4:\"flag\";i:2;s:13:\"iteratorClass\";s:13:\"ArrayIterator\";s:19:\"protectedProperties\";a:4:{i:0;s:7:\"storage\";i:1;s:4:\"flag\";i:2;s:13:\"iteratorClass\";i:3;s:19:\"protectedProperties\";}}');
>>>>>>> 1.0.0-Alpha

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(320) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `firstName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profileImage` mediumtext COLLATE utf8mb4_unicode_ci,
  `age` int(11) DEFAULT NULL,
  `birthday` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `race` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `companyName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sessionLength` int(11) NOT NULL DEFAULT '86400',
  `regDate` tinytext COLLATE utf8mb4_unicode_ci,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `regHash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resetTimeStamp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resetHash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `userName`, `email`, `password`, `role`, `firstName`, `lastName`, `profileImage`, `age`, `birthday`, `gender`, `race`, `bio`, `companyName`, `sessionLength`, `regDate`, `active`, `verified`, `regHash`, `resetTimeStamp`, `resetHash`) VALUES
(1, 'jsmith', 'jsmith@webinertia.net', '$2y$10$buYOVRO7oURp1Ej3/mNBK.9c.Yo.LH49Iba2Q1l7F3Lmr6dRzAACq', 'admin', 'Joey', 'Smith', 'profileImage_620bf5484bd8c4_97500161.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 86400, NULL, 1, 1, NULL, NULL, NULL),
(2, 'test', 'test@webinertia.net', '$2y$10$fi1Ibl3JqEB.P/530rb4NOLbieZ6vRS0U0JaWewujWRvbSGxvUEia', 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 86400, '03-12-2022 4:41:32', 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `inheritsFrom` tinytext COLLATE utf8mb4_unicode_ci,
  `label` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `role`, `inheritsFrom`, `label`) VALUES
(1, 'user', 'guest', 'Member'),
(2, 'moderator', 'user', 'Moderator'),
(3, 'admin', 'moderator', 'Administrator');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `log_ibfk_1` FOREIGN KEY (`extra_userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
