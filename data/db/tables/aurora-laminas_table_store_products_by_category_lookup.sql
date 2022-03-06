
-- --------------------------------------------------------

--
-- Table structure for table `store_products_by_category_lookup`
--
-- Creation: Mar 01, 2022 at 03:48 AM
-- Last update: Mar 06, 2022 at 04:01 AM
--

DROP TABLE IF EXISTS `store_products_by_category_lookup`;
CREATE TABLE IF NOT EXISTS `store_products_by_category_lookup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productId` (`productId`),
  KEY `categoryId` (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `store_products_by_category_lookup`
--

TRUNCATE TABLE `store_products_by_category_lookup`;
--
-- Dumping data for table `store_products_by_category_lookup`
--

INSERT INTO `store_products_by_category_lookup` (`id`, `productId`, `categoryId`) VALUES
(8, 23, 3);
