CREATE DATABASE IF NOT EXISTS iridium_historic;
USE iridium_historic;
CREATE TABLE IF NOT EXISTS `size_historic` (
  `id` int(11),
  `date` timestamp,
  `product` varchar(255),
  `revision` varchar(255),
  `size` int,
  `size_strip` int
);
ALTER TABLE `size_historic`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `size_historic`
 MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


CREATE USER IF NOT EXISTS 'metrics'@'%' IDENTIFIED BY '09asd_n9asd87abs9d88as7d';


GRANT SELECT ON iridium_historic.* TO 'metrics'@'%';
