
-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--
-- Creation: Dec 21, 2021 at 04:19 PM
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
-- Truncate table before insert `user_roles`
--

TRUNCATE TABLE `user_roles`;
--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `role`, `inheritsFrom`, `label`) VALUES
(1, 'user', 'guest', 'Member'),
(2, 'moderator', 'user', 'Moderator'),
(3, 'admin', 'moderator', 'Administrator');
