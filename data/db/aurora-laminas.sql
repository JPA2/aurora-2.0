-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 02, 2022 at 04:53 AM
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
('t54fig0bda8pjfdah0649ck0vn', 'PHPSESSID', 1643766206, 86400, '__Laminas|a:5:{s:20:\"_REQUEST_ACCESS_TIME\";d:1643766205.74339;s:6:\"_VALID\";a:1:{s:28:\"Laminas\\Session\\Validator\\Id\";s:26:\"idquf0tmgn6pg1rf9eq61mdkfe\";}s:14:\"FlashMessenger\";a:0:{}s:53:\"Laminas_Form_Captcha_1996ea41c164db908151532edd5f20f2\";a:2:{s:11:\"EXPIRE_HOPS\";a:2:{s:4:\"hops\";i:1;s:2:\"ts\";d:1643591759.057923;}s:6:\"EXPIRE\";i:1643592059;}s:53:\"Laminas_Form_Captcha_54f68b3f99bf3b88b42b418c0b10760b\";a:2:{s:11:\"EXPIRE_HOPS\";a:2:{s:4:\"hops\";i:1;s:2:\"ts\";d:1643691386.84114;}s:6:\"EXPIRE\";i:1643691686;}}initialized|O:26:\"Laminas\\Stdlib\\ArrayObject\":4:{s:7:\"storage\";a:3:{s:4:\"init\";i:1;s:10:\"remoteAddr\";s:3:\"::1\";s:13:\"httpUserAgent\";s:90:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:97.0) Gecko/20100101 Firefox/97.0 FirePHP/0.5\";}s:4:\"flag\";i:2;s:13:\"iteratorClass\";s:13:\"ArrayIterator\";s:19:\"protectedProperties\";a:4:{i:0;s:7:\"storage\";i:1;s:4:\"flag\";i:2;s:13:\"iteratorClass\";i:3;s:19:\"protectedProperties\";}}Laminas_Auth|O:26:\"Laminas\\Stdlib\\ArrayObject\":4:{s:7:\"storage\";a:1:{s:7:\"storage\";s:6:\"jsmith\";}s:4:\"flag\";i:2;s:13:\"iteratorClass\";s:13:\"ArrayIterator\";s:19:\"protectedProperties\";a:4:{i:0;s:7:\"storage\";i:1;s:4:\"flag\";i:2;s:13:\"iteratorClass\";i:3;s:19:\"protectedProperties\";}}FlashMessenger|O:26:\"Laminas\\Stdlib\\ArrayObject\":4:{s:7:\"storage\";a:0:{}s:4:\"flag\";i:2;s:13:\"iteratorClass\";s:13:\"ArrayIterator\";s:19:\"protectedProperties\";a:4:{i:0;s:7:\"storage\";i:1;s:4:\"flag\";i:2;s:13:\"iteratorClass\";i:3;s:19:\"protectedProperties\";}}Laminas_Form_Captcha_1996ea41c164db908151532edd5f20f2|O:26:\"Laminas\\Stdlib\\ArrayObject\":4:{s:7:\"storage\";a:1:{s:4:\"word\";s:5:\"xo9up\";}s:4:\"flag\";i:2;s:13:\"iteratorClass\";s:13:\"ArrayIterator\";s:19:\"protectedProperties\";a:4:{i:0;s:7:\"storage\";i:1;s:4:\"flag\";i:2;s:13:\"iteratorClass\";i:3;s:19:\"protectedProperties\";}}Laminas_Form_Captcha_54f68b3f99bf3b88b42b418c0b10760b|O:26:\"Laminas\\Stdlib\\ArrayObject\":4:{s:7:\"storage\";a:1:{s:4:\"word\";s:5:\"j82a7\";}s:4:\"flag\";i:2;s:13:\"iteratorClass\";s:13:\"ArrayIterator\";s:19:\"protectedProperties\";a:4:{i:0;s:7:\"storage\";i:1;s:4:\"flag\";i:2;s:13:\"iteratorClass\";i:3;s:19:\"protectedProperties\";}}'),
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
  `total` decimal(10,2) NOT NULL,
  `tax` decimal(10,2) NOT NULL DEFAULT '0.00',
  `extCost` decimal(10,2) NOT NULL,
  `shippingCost` decimal(10,2) NOT NULL,
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
  `manufacturer` tinytext,
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
  KEY `productId` (`productId`),
  KEY `categoryId` (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `store_products_reviews`
--

DROP TABLE IF EXISTS `store_products_reviews`;
CREATE TABLE IF NOT EXISTS `store_products_reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `createdDate` varchar(255) NOT NULL,
  `editDate` varchar(255) DEFAULT NULL,
  `rating` tinyint(1) NOT NULL DEFAULT '5',
  `content` longtext NOT NULL,
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
  ADD CONSTRAINT `store_products_by_category_lookup_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `store_products` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `store_products_by_category_lookup_ibfk_2` FOREIGN KEY (`categoryId`) REFERENCES `store_categories` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `store_products_reviews`
--
ALTER TABLE `store_products_reviews`
  ADD CONSTRAINT `store_products_reviews_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `store_products` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD CONSTRAINT `user_profile_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
