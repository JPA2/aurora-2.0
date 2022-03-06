
-- --------------------------------------------------------

--
-- Table structure for table `store_products_reviews`
--
-- Creation: Feb 02, 2022 at 12:04 AM
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

--
-- Truncate table before insert `store_products_reviews`
--

TRUNCATE TABLE `store_products_reviews`;