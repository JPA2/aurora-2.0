
-- --------------------------------------------------------

--
-- Table structure for table `store_orders`
--
-- Creation: Feb 02, 2022 at 04:24 AM
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

--
-- Truncate table before insert `store_orders`
--

TRUNCATE TABLE `store_orders`;