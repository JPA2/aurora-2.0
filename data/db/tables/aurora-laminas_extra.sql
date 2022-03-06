
--
-- Constraints for dumped tables
--

--
-- Constraints for table `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `log_ibfk_1` FOREIGN KEY (`extra_userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `store_images`
--
ALTER TABLE `store_images`
  ADD CONSTRAINT `store_images_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `store_products` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `store_images_ibfk_2` FOREIGN KEY (`categoryId`) REFERENCES `store_categories` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `store_orders`
--
ALTER TABLE `store_orders`
  ADD CONSTRAINT `store_orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `store_products`
--
ALTER TABLE `store_products`
  ADD CONSTRAINT `store_products_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `store_products_by_category_lookup`
--
ALTER TABLE `store_products_by_category_lookup`
  ADD CONSTRAINT `store_products_by_category_lookup_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `store_products` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `store_products_by_category_lookup_ibfk_2` FOREIGN KEY (`categoryId`) REFERENCES `store_categories` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `store_products_reviews`
--
ALTER TABLE `store_products_reviews`
  ADD CONSTRAINT `store_products_reviews_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `store_products` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD CONSTRAINT `user_profile_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
