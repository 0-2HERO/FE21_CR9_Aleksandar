-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2021 at 05:26 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database as cr9_famazon_aleksandar`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `account_id` int(11) UNSIGNED NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`account_id`, `first_name`, `last_name`) VALUES
(1, 'John', 'Lennon'),
(2, 'Paul', 'McCartney'),
(3, 'George', 'Harrison'),
(4, 'Ringo', 'Star');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(11) UNSIGNED NOT NULL,
  `brand_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`) VALUES
(1, 'Hermes'),
(2, 'Gucci'),
(3, 'Burberry'),
(4, 'Nike');

-- --------------------------------------------------------

--
-- Table structure for table `card_processor`
--

CREATE TABLE `card_processor` (
  `processor_id` int(11) UNSIGNED NOT NULL,
  `processor_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `card_processor`
--

INSERT INTO `card_processor` (`processor_id`, `processor_name`) VALUES
(1, 'VISA'),
(2, 'Mastercard'),
(3, 'Maestro'),
(4, 'American Express'),
(5, 'UnionPay');

-- --------------------------------------------------------

--
-- Table structure for table `distributors`
--

CREATE TABLE `distributors` (
  `distributor_id` int(11) UNSIGNED NOT NULL,
  `distributor_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `distributors`
--

INSERT INTO `distributors` (`distributor_id`, `distributor_name`) VALUES
(1, 'Post'),
(2, 'DHL'),
(3, 'UPS'),
(4, 'fedex');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) UNSIGNED NOT NULL,
  `account_id` int(11) UNSIGNED NOT NULL,
  `supplier_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `payment_id` int(11) UNSIGNED NOT NULL,
  `product_amount` int(5) UNSIGNED NOT NULL,
  `shipping_id` int(11) UNSIGNED NOT NULL,
  `oder_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `account_id`, `supplier_id`, `product_id`, `payment_id`, `product_amount`, `shipping_id`, `oder_date`) VALUES
(1, 1, 1, 1, 0, 1, 1, '2021-04-02'),
(2, 4, 3, 2, 0, 1, 2, '2020-04-09'),
(3, 3, 2, 3, 0, 1, 4, '2020-12-02'),
(4, 2, 3, 4, 0, 2, 5, '2020-06-04'),
(5, 1, 1, 4, 0, 2, 5, '2021-03-17');

-- --------------------------------------------------------

--
-- Table structure for table `payment_info`
--

CREATE TABLE `payment_info` (
  `payment_id` int(11) UNSIGNED NOT NULL,
  `account_id` int(11) UNSIGNED NOT NULL,
  `card_number` varchar(16) NOT NULL,
  `CVV` int(3) UNSIGNED NOT NULL,
  `card_first_name` varchar(40) NOT NULL,
  `card_last_name` varchar(40) NOT NULL,
  `processor_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_info`
--

INSERT INTO `payment_info` (`payment_id`, `account_id`, `card_number`, `CVV`, `card_first_name`, `card_last_name`, `processor_id`) VALUES
(1, 1, '8727173938941783', 679, 'Ringo', 'Star', 4),
(2, 4, '0909876545454675', 8, 'John', 'Lennon', 1),
(3, 3, '8690079867589004', 232, 'Paul', 'McCartney', 2),
(4, 2, '8475649373526453', 322, 'George', 'Harrison', 3);

-- --------------------------------------------------------

--
-- Table structure for table `payment_status`
--

CREATE TABLE `payment_status` (
  `paystatus_id` int(11) UNSIGNED NOT NULL,
  `payment_id` int(11) UNSIGNED NOT NULL,
  `payment_status` enum('Confirmed','Unconfirmed','Cancelled') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_status`
--

INSERT INTO `payment_status` (`paystatus_id`, `payment_id`, `payment_status`) VALUES
(1, 1, 'Confirmed'),
(2, 2, 'Unconfirmed'),
(3, 2, 'Cancelled'),
(4, 2, 'Confirmed'),
(5, 4, 'Confirmed'),
(6, 3, 'Confirmed');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) UNSIGNED NOT NULL,
  `brand_id` int(11) UNSIGNED NOT NULL,
  `supplier_id` int(11) UNSIGNED NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_category` varchar(50) NOT NULL,
  `product_price` decimal(10,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `brand_id`, `supplier_id`, `product_name`, `product_category`, `product_price`) VALUES
(1, 2, 1, ' Alex Coat', 'Coats', '4000.00'),
(2, 3, 3, 'Ace leather sneakers', 'Sneakers', '399.99'),
(3, 1, 2, 'Somerton shirt', 'Shoes', '500.00'),
(4, 4, 1, 'Nike Air Force 1', 'Sneakers', '120.00');

-- --------------------------------------------------------

--
-- Table structure for table `shipment_addresses`
--

CREATE TABLE `shipment_addresses` (
  `address_id` int(11) UNSIGNED NOT NULL,
  `account_id` int(11) UNSIGNED NOT NULL,
  `street_name` varchar(40) NOT NULL,
  `house_number` int(11) UNSIGNED NOT NULL,
  `door_number` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shipment_addresses`
--

INSERT INTO `shipment_addresses` (`address_id`, `account_id`, `street_name`, `house_number`, `door_number`) VALUES
(1, 4, 'Molker Bastei', 4, 22),
(2, 3, 'Altgasse', 5, 2),
(3, 2, 'Karntner Strasse', 1, 25),
(4, 2, 'Operngasse', 8, 3),
(5, 1, 'Fleischmarkt', 11, 9);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_details`
--

CREATE TABLE `shipping_details` (
  `shipping_id` int(11) UNSIGNED NOT NULL,
  `address_id` int(11) UNSIGNED NOT NULL,
  `distributor_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shipping_details`
--

INSERT INTO `shipping_details` (`shipping_id`, `address_id`, `distributor_id`) VALUES
(1, 5, 1),
(2, 3, 2),
(3, 3, 4),
(4, 5, 3),
(5, 2, 3),
(6, 1, 1),
(7, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(11) UNSIGNED NOT NULL,
  `supplier_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `supplier_name`) VALUES
(1, 'HermesAndPartners'),
(2, 'FashionVienna'),
(3, 'ClothesWien');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`account_id`),
  ADD UNIQUE KEY `account_id` (`account_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `card_processor`
--
ALTER TABLE `card_processor`
  ADD PRIMARY KEY (`processor_id`);

--
-- Indexes for table `distributors`
--
ALTER TABLE `distributors`
  ADD PRIMARY KEY (`distributor_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD UNIQUE KEY `order_id` (`order_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `shipping_id` (`shipping_id`),
  ADD KEY `payment_id` (`payment_id`);

--
-- Indexes for table `payment_info`
--
ALTER TABLE `payment_info`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `processor_id` (`processor_id`);

--
-- Indexes for table `payment_status`
--
ALTER TABLE `payment_status`
  ADD PRIMARY KEY (`paystatus_id`),
  ADD KEY `payment_id` (`payment_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `product_id` (`product_id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `shipment_addresses`
--
ALTER TABLE `shipment_addresses`
  ADD PRIMARY KEY (`address_id`,`account_id`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `shipping_details`
--
ALTER TABLE `shipping_details`
  ADD PRIMARY KEY (`shipping_id`),
  ADD UNIQUE KEY `shipping_id` (`shipping_id`),
  ADD KEY `distributor_id` (`distributor_id`),
  ADD KEY `address_id` (`address_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`),
  ADD UNIQUE KEY `supplier_id` (`supplier_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `account_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `card_processor`
--
ALTER TABLE `card_processor`
  MODIFY `processor_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `distributors`
--
ALTER TABLE `distributors`
  MODIFY `distributor_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment_info`
--
ALTER TABLE `payment_info`
  MODIFY `payment_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment_status`
--
ALTER TABLE `payment_status`
  MODIFY `paystatus_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shipment_addresses`
--
ALTER TABLE `shipment_addresses`
  MODIFY `address_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `shipping_details`
--
ALTER TABLE `shipping_details`
  MODIFY `shipping_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`payment_id`) REFERENCES `payment_status` (`payment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_5` FOREIGN KEY (`shipping_id`) REFERENCES `shipping_details` (`shipping_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment_info`
--
ALTER TABLE `payment_info`
  ADD CONSTRAINT `payment_data_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payment_data_ibfk_2` FOREIGN KEY (`processor_id`) REFERENCES `card_processor` (`processor_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment_status`
--
ALTER TABLE `payment_status`
  ADD CONSTRAINT `payment_status_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payment_info` (`payment_id`) ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shipment_addresses`
--
ALTER TABLE `shipment_addresses`
  ADD CONSTRAINT `shipment_addresses_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shipping_details`
--
ALTER TABLE `shipping_details`
  ADD CONSTRAINT `shipment_details_ibfk_2` FOREIGN KEY (`distributor_id`) REFERENCES `distributors` (`distributor_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `shipment_details_ibfk_3` FOREIGN KEY (`address_id`) REFERENCES `shipment_addresses` (`address_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
