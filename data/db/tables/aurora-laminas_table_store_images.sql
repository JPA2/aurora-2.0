
-- --------------------------------------------------------

--
-- Table structure for table `store_images`
--
-- Creation: Mar 02, 2022 at 07:39 AM
-- Last update: Mar 06, 2022 at 12:54 AM
--

DROP TABLE IF EXISTS `store_images`;
CREATE TABLE IF NOT EXISTS `store_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `type` enum('thumbnail','slideshow','category','primary','catalogue','gallery') NOT NULL DEFAULT 'primary',
  `fileName` tinytext,
  `uploadedTime` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `store_images_ibfk_1` (`productId`),
  KEY `store_images_ibfk_2` (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `store_images`
--

TRUNCATE TABLE `store_images`;
--
-- Dumping data for table `store_images`
--

INSERT INTO `store_images` (`id`, `userId`, `productId`, `categoryId`, `type`, `fileName`, `uploadedTime`, `active`) VALUES
(1, 1, NULL, 1, 'primary', 'image_62231ca1d29585_05419027.jpg', NULL, 0),
(2, 1, NULL, 1, 'primary', 'image_62236afe807de7_26183936.png', NULL, 0),
(3, 1, NULL, 1, 'primary', 'image_62239abf27b501_94836257.png', NULL, 0),
(4, 1, NULL, 1, 'primary', 'image_62240639133592_72874188.png', NULL, 0);
