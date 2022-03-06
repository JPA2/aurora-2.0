
-- --------------------------------------------------------

--
-- Table structure for table `user`
--
-- Creation: Jan 30, 2022 at 09:58 PM
-- Last update: Feb 20, 2022 at 04:29 PM
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
-- Truncate table before insert `user`
--

TRUNCATE TABLE `user`;
--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `userName`, `email`, `password`, `role`, `sessionLength`, `companyName`, `regDate`, `active`, `verified`, `regHash`, `resetTimeStamp`, `resetHash`) VALUES
(1, 'jsmith', 'jsmith@webinertia.net', '$2y$10$buYOVRO7oURp1Ej3/mNBK.9c.Yo.LH49Iba2Q1l7F3Lmr6dRzAACq', 'admin', 86400, '', '08-11-2021 22:26:20', 1, 1, NULL, NULL, NULL),
(7, 'Chino', 'eduardomdzhernandez@gmail.com', '$2y$10$ied9xYircXBuCku0pSxzSezlLZdj1sXXT8faNSpvYgs5rjYR4rvF6', 'user', 86400, NULL, '11-17-2021 19:32:46', 0, 0, NULL, NULL, NULL),
(28, 'Evolvecms', 'firecms@fireevolve.com', '$2y$10$9AC5q2opUcocoIW.BlvoiOvcrIx.cv50Qh4wFE2EegsQ5cZaFRqvq', 'admin', 86400, NULL, '12-23-2021 4:24:14', 0, 0, '$2y$10$VM8AEPL7X5zicTeptiEdaexAP81BE7Qlam04JjDYcNQoG9lXtY4ni', NULL, NULL),
(50, 'test', 'jsmith@webinertia.net', '$2y$10$xkVgS/LZQ4DEkmCyE2TqAOY1.XJa7v.pEqKIRz/ztnmS7wVT4OClK', 'admin', 86400, NULL, '01-12-2022 1:54:43', 1, 1, NULL, NULL, NULL);
