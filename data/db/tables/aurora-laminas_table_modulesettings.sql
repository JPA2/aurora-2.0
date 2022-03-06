
-- --------------------------------------------------------

--
-- Table structure for table `modulesettings`
--
-- Creation: Feb 12, 2022 at 08:11 PM
--

DROP TABLE IF EXISTS `modulesettings`;
CREATE TABLE IF NOT EXISTS `modulesettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(255) DEFAULT NULL,
  `variable` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `settingType` tinytext NOT NULL,
  `label` tinytext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `variable` (`variable`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `modulesettings`
--

TRUNCATE TABLE `modulesettings`;