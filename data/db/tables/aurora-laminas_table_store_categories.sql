
-- --------------------------------------------------------

--
-- Table structure for table `store_categories`
--
-- Creation: Feb 01, 2022 at 06:16 AM
--

DROP TABLE IF EXISTS `store_categories`;
CREATE TABLE IF NOT EXISTS `store_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `store_categories`
--

TRUNCATE TABLE `store_categories`;
--
-- Dumping data for table `store_categories`
--

INSERT INTO `store_categories` (`id`, `parentId`, `name`) VALUES
(1, NULL, 'Michael Kors'),
(2, NULL, 'Kate Spade'),
(3, NULL, 'Coach'),
(4, NULL, 'Prada');
