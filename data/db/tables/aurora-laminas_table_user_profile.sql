
-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--
-- Creation: Jan 03, 2022 at 02:34 AM
-- Last update: Feb 20, 2022 at 11:33 AM
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='dependent upon users table relational key is userId';

--
-- Truncate table before insert `user_profile`
--

TRUNCATE TABLE `user_profile`;
--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`id`, `userId`, `firstName`, `lastName`, `profileImage`, `age`, `birthday`, `gender`, `race`, `bio`) VALUES
(1, 1, 'Joey', 'Smith', 'profileImage_620bf5484bd8c4_97500161.jpg', 46, '2022-01-01', NULL, NULL, NULL),
(14, 50, 'Test', 'User', 'profileImage_620bf5484bd8c4_97500161.jpg', 35, NULL, NULL, NULL, NULL),
(15, 7, 'Eduardo', 'Hernandez', 'default-profile-picture.png', NULL, NULL, NULL, NULL, NULL),
(16, 28, 'Evan', 'Alexander', 'default-profile-picture.png', NULL, NULL, NULL, NULL, NULL);
