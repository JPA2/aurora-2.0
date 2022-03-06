
-- --------------------------------------------------------

--
-- Table structure for table `log`
--
-- Creation: Dec 05, 2021 at 05:32 PM
-- Last update: Mar 05, 2022 at 08:13 AM
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

--
-- Truncate table before insert `log`
--

TRUNCATE TABLE `log`;