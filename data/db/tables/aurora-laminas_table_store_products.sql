
-- --------------------------------------------------------

--
-- Table structure for table `store_products`
--
-- Creation: Mar 01, 2022 at 02:49 AM
-- Last update: Mar 06, 2022 at 04:01 AM
--

DROP TABLE IF EXISTS `store_products`;
CREATE TABLE IF NOT EXISTS `store_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `cost` decimal(10,2) DEFAULT NULL,
  `weight` decimal(6,2) DEFAULT NULL,
  `manufacturer` tinytext,
  `sku` varchar(255) DEFAULT NULL,
  `createdDate` varchar(255) DEFAULT NULL,
  `active` int(1) NOT NULL DEFAULT '0',
  `onSale` int(1) NOT NULL DEFAULT '0',
  `discount` decimal(5,2) DEFAULT NULL,
  `saleStartDate` varchar(255) DEFAULT NULL,
  `saleEndDate` varchar(255) DEFAULT NULL,
  `data` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COMMENT='will join user table on userId > id';

--
-- Truncate table before insert `store_products`
--

TRUNCATE TABLE `store_products`;
--
-- Dumping data for table `store_products`
--

INSERT INTO `store_products` (`id`, `userId`, `name`, `description`, `cost`, `weight`, `manufacturer`, `sku`, `createdDate`, `active`, `onSale`, `discount`, `saleStartDate`, `saleEndDate`, `data`) VALUES
(2, 1, 'Leather Band Watch', 'Text description for michael kors watch', '150.99', '1.26', 'Michael Kors', '282200', '', 1, 1, '10.00', '2022-02-10', '2022-02-13', NULL),
(23, 1, 'Ajaxed Product', 'another description', '2.99', '0.98', 'Coach', '3425234', '', 1, 1, '5.00', '2022-02-27', '2022-03-02', NULL);
