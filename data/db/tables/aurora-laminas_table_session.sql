
-- --------------------------------------------------------

--
-- Table structure for table `session`
--
-- Creation: Feb 15, 2022 at 04:12 PM
-- Last update: Feb 15, 2022 at 04:12 PM
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
-- Truncate table before insert `session`
--

TRUNCATE TABLE `session`;