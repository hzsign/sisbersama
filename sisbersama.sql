-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 04, 2025 at 02:46 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sisbersama`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', '123456789');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'Mobile Legends'),
(2, 'Free Fire'),
(3, 'Valorant'),
(4, 'PUBG Mobile'),
(5, 'Genshin Impact'),
(6, 'Point Blank'),
(7, 'Arena of Valor');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(162, 1, '::1', -1, 1),
(164, 88, '::1', 34, 1),
(165, 4, '::1', -1, 1),
(167, 25, '::1', 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Game Mobile'),
(2, 'Game PC');

-- --------------------------------------------------------

--
-- Table structure for table `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com'),
(4, 'puneethreddy951@gmail.com'),
(5, 'puneethreddy@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(2, 14, 2, 1, '07M47684BS5725041', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(1, 12, 'Puneeth', 'puneethreddy951@gmail.com', 'Bangalore, Kumbalagodu, Karnataka', 'Bangalore', 'Karnataka', 560074, 'pokjhgfcxc', '4321 2345 6788 7654', '12/90', 3, 77000, 1234),
(2, 26, 'Asep Surasep', 'asep@gmail.com', 'Jalan Pluto No.2', '', '', 0, '', '', '', 1, 200000, 0),
(3, 26, 'Asep Surasep', 'asep@gmail.com', '1223567345', '', '', 0, '', '', '', 1, 8500, 0),
(4, 12, 'Rangga Nurta', 'rangga@gmail.com', '6334621356', '', '', 0, '', '', '', 5, 886500, 0),
(5, 26, 'Asep Surasep', 'asep@gmail.com', '3456346', '', '', 0, '', '', '', 2, 1340000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(73, 1, 1, 1, 5000),
(74, 1, 4, 2, 64000),
(75, 1, 8, 1, 40000),
(91, 2, 50, 1, 200000),
(92, 3, 2, 1, 8500),
(93, 4, 26, 1, 400000),
(94, 4, 2, 1, 8500),
(95, 4, 3, 1, 25000),
(96, 4, 6, 1, 153000),
(97, 4, 51, 1, 300000),
(98, 5, 9, 1, 1320000),
(99, 5, 12, 1, 20000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 1, 1, '11 Diamonds', 5000, 'Diamonds Mobile Legends', 'ml.jpg', 'ml mobile legend '),
(2, 1, 1, '25 Diamonds', 8500, 'Diamonds Mobile Legends', 'ml.jpg', 'ml mobile legend'),
(3, 1, 1, '75 Diamonds', 25000, 'Diamonds Mobile Legends', 'ml.jpg', 'ml mobile legend'),
(4, 1, 1, '170 Diamonds', 50000, 'Diamonds Mobile Legends', 'ml.jpg', 'ml mobile legend'),
(5, 1, 1, '265 Diamonds', 100000, 'Diamonds Mobile Legends', 'ml.jpg', 'ml mobile legend'),
(6, 1, 1, '550 Diamonds', 153000, 'Diamonds Mobile Legends', 'ml.jpg', 'ml mobile legend'),
(7, 1, 1, '750 Diamonds', 254000, 'Diamonds Mobile Legends', 'ml.jpg', 'ml mobile legend'),
(8, 1, 1, '1078 Diamonds', 545000, 'Diamonds Mobile Legends', 'ml.jpg', 'ml mobile legend'),
(9, 1, 1, '4012 Diamonds', 1320000, 'Diamonds Mobile Legends', 'ml.jpg', 'ml mobile legend'),
(10, 1, 2, '5 Diamonds', 1000, 'Diamonds Free Fire', 'ff.jpg', 'ff free fire'),
(11, 1, 2, '50 Diamonds', 8000, 'Diamonds Free Fire', 'ff.jpg', 'ff free fire'),
(12, 1, 2, '150 Diamonds', 20000, 'Diamonds Free Fire', 'ff.jpg', 'ff free fire'),
(13, 1, 2, '350 Diamonds', 50000, 'Diamonds Free Fire', 'ff.jpg', 'ff free fire'),
(14, 1, 2, '720 Diamonds', 100000, 'Diamonds Free Fire', 'ff.jpg', 'ff free fire'),
(15, 1, 2, '1500 Diamonds', 200000, 'Diamonds Free Fire', 'ff.jpg', 'ff free fire'),
(16, 1, 2, '3520 Diamonds', 500000, 'Diamonds Free Fire', 'ff.jpg', 'ff free fire'),
(17, 1, 2, '7290 Diamonds', 2000000, 'Diamonds Free Fire', 'ff.jpg', 'ff free fire'),
(19, 1, 2, '36500 Diamonds', 5000000, 'Diamonds Free Fire', 'ff.jpg', 'ff free fire'),
(20, 1, 2, '73100 Diamonds', 10000000, 'Diamonds Free Fire', 'ff.jpg', 'ff free fire'),
(23, 2, 3, '700 Point', 80000, 'Valorant Point', 'valorant.jpg', 'valorant valoran'),
(24, 2, 3, '1375 Point', 150000, 'Valorant Point', 'valorant.jpg', 'valorant valoran'),
(25, 2, 3, '2400 Point', 250000, 'Valorant Point', 'valorant.jpg', 'valorant valoran'),
(26, 2, 3, '4000 Point', 400000, 'Valorant Point', 'valorant.jpg', 'valorant valoran'),
(27, 2, 3, '8150 Point', 800000, 'Valorant Point', 'valorant.jpg', 'valorant valoran'),
(28, 1, 4, '50 UC', 10000, 'UC PUGB Mobile', 'pubgm.jpg', 'pubgm pubg mobile'),
(29, 1, 4, '150 UC', 30000, 'UC PUBG Mobile', 'pubgm.jpg', 'pubgm pubg mobile'),
(30, 1, 4, '250 UC', 50000, 'UC PUBG Mobile', 'pubgm.jpg', 'pubgm pubg mobile'),
(31, 1, 4, '500 UC', 100000, 'UC PUBG Mobile', 'pubgm.jpg', 'pubgm pubg mobile'),
(32, 1, 4, '1250 UC', 250000, 'UC PUBG Mobile', 'pubgm.jpg', 'pubgm pubg mobile'),
(33, 1, 4, '2500 UC', 500000, 'UC PUBG Mobile', 'pubgm.jpg', 'pubgm pubg mobile'),
(34, 1, 5, '60 Genesis Crystal', 15000, 'Genesis Crystal Genshin Impact', 'genshin.jpeg', 'genshin impact'),
(35, 1, 5, '300 Genesis Crystal', 75000, 'Genesis Crystal Genshin Impact', 'genshin.jpeg', 'genshin impact'),
(36, 1, 5, '1000 Genesis Crystal genshin Impact', 250000, 'Genesis Xrystal Genshin Impact', 'genshin.jpeg', 'genshin impact'),
(37, 1, 5, '2000 Genesis Crystal', 480000, 'Genesis Crystal Genshin Impact', 'genshin.jpeg', 'genshin impact'),
(38, 1, 5, '3500 Genesis Crystal', 820000, 'Genesis Crystal Genshin Impact', 'genshin.jpeg', 'genshin impact'),
(39, 1, 5, '6500 Genesis Crystal', 1500000, 'Genesis Crystal Genshin Impact', 'genshin.jpeg', 'genshin impact'),
(40, 2, 6, '1200 CASH', 10000, 'CASH Point Blank', 'pb.jpg', 'pb point blank'),
(41, 2, 6, '2400 CASH', 20000, 'CASH Point Blank', 'pb.jpg', 'pb point blank'),
(42, 2, 6, '6000 CASH', 55000, 'CASH Point Blank', 'pb.jpg', 'pb point blank'),
(44, 2, 6, '24000 CASH', 220000, 'CASH Point Blank', 'pb.jpg', 'pb point blank'),
(45, 2, 6, '36000 CASH', 330000, 'CASH Point Blank', 'pb.jpg', 'pb point blank'),
(46, 2, 6, '6000 CASH', 550000, 'CASH Point Blank', 'pb.jpg', 'pb point blank'),
(47, 1, 7, '90 Voucher', 20000, 'Voucher Arena of Valor', 'aov.jpg', 'aov arena of valor'),
(48, 1, 7, '230 Voucher', 50000, 'Voucher Arena of Valor', 'aov.jpg', 'aov arena of valor'),
(49, 1, 7, '470 Voucher', 100000, 'Voucher Arena of Valor', 'aov.jpg', 'aov arena of valor'),
(50, 1, 7, '950 Vouvher', 200000, 'Voucher Arena of Valor', 'aov.jpg', 'aov arena of valor'),
(51, 1, 7, '1430 Voucher', 300000, 'Voucher Arena of Valor', 'aov.jpg', 'aov arena of valor'),
(52, 1, 7, '2390 Voucher', 500000, 'Voucher Arena of Valor', 'aov.jpg', 'aov arena of valor'),
(53, 1, 7, '4800 Voucher', 1000000, 'Voucher Arena of Valor', 'aov.jpg', 'aov arena of valor'),
(54, 1, 7, '24050 Voucher', 5000000, 'Voucher Arena of Valor', 'aov.jpg', 'aov arena of valor'),
(55, 1, 7, '48200 Voucher', 10000000, 'Voucher Arena of Valor', 'aov.jpg', 'aov arena of valor'),
(82, 1, 2, 'VMS', 20000, 'fefwef', '1734770849_freepik__modern-style-detailled-illustration-an-elegant-and__82639.jpeg', 'Ml'),
(83, 1, 1, 'VMS', 1233123, 'wqfq', '1734770923_freepik__modern-style-detailled-illustration-an-elegant-and__82639.jpeg', 'ml'),
(85, 90, 1, '', 20000, 'koko', 'valorant.jpg', 'Valoran'),
(86, 1, 2, '', 2000, 'koko', 'genshin.jpeg', 'Valoran'),
(87, 1, 1, '', 10000, 'koko', 'valorant.jpg', 'mobile legend'),
(88, 2, 2, 'efwef', 60000, 'koko', 'valorant.jpg', 'Valoran');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'Rangga', 'Nurta', 'rangga@gmail.com', 'rangganurta', '081322575253', 'Pangandaran', '46094'),
(26, 'Asep', 'Surasep', 'asep@gmail.com', 'asepkasep', '081366758762', 'Jalan Pluto No.2', 'Bandung'),
(27, 'Riz', 'Far', 'admin@gmail.com', '12345678', '+6281391955800', 'KOTA JAKARTA SELATAN', 'Jaksel'),
(28, 'Uhuy', 'Sign', 'irfannurkholik89@gmail.com', '123456789', '081391955800', 'KOTA JAKARTA SELATAN', 'Jaksel'),
(29, 'Uhuy', 'Sign', 'irfannurkholik89@gmail.com', '123456789', '081391955800', 'KOTA JAKARTA SELATAN', 'Jaksel'),
(32, 'Cuhua', 'hua', 'irfannurkholik89@gmail.com', '819898989', '081391955800', 'KOTA JAKARTA SELATAN', 'Jaksel'),
(33, 'Kiw', 'kiw', 'kiw@gmail.com', '1220', '081391955800', 'Purwokerto', 'Purwokerto'),
(34, 'cuki', 'kiw', 'cukiw@gmail.com', '12', '081391955800', 'Jakarta', 'Purwokerto');

--
-- Triggers `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'puneeth', 'Reddy', 'puneethreddy951@gmail.com', '123456789', '9448121558', '123456789', 'sdcjns,djc'),
(14, 'hemanthu', 'reddy', 'hemanthreddy951@gmail.com', '123456788', '6526436723', 's,dc wfjvnvn', 'b efhfhvvbr'),
(15, 'hemu', 'ajhgdg', 'keeru@gmail.com', '346778', '536487276', ',mdnbca', 'asdmhmhvbv'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(19, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'bangalore', 'hassan'),
(20, 'pramod', 'vh', 'pramod@gmail.com', '124335353', '9767645653', 'ksbdfcdf', 'sjrgrevgsib'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(22, 'puneeth', 'v', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'Puneeth@123', '9876543234', 'Bangalore', 'Kumbalagodu'),
(24, 'newuser', 'user', 'newuser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(26, 'Asep', 'Surasep', 'asep@gmail.com', 'asepkasep', '0813667587', 'Jalan Pluto No.2', 'Bandung'),
(27, 'Riz', 'Far', 'admin@gmail.com', '12345678', '+628139195', 'KOTA JAKARTA SELATAN', 'Jaksel'),
(28, 'Uhuy', 'Sign', 'irfannurkholik89@gmail.com', '123456789', '0813919558', 'KOTA JAKARTA SELATAN', 'Jaksel'),
(29, 'Uhuy', 'Sign', 'irfannurkholik89@gmail.com', '123456789', '0813919558', 'KOTA JAKARTA SELATAN', 'Jaksel'),
(30, 'Uhuy', 'Sign', 'irfannurkholik89@gmail.com', '$2y$10$jBd0xGRMdxO53JlF58jdoONpMDh7D8Zslbq9AuMtAKA6gjPv6qANi', '0813919558', 'KOTA JAKARTA SELATAN', 'Jaksel'),
(31, 'Hz', 'Sign', 'irfannurkholik89@gmail.com', '1289899', '0813919558', 'KOTA JAKARTA SELATAN', 'Jaksel'),
(32, 'Cuhua', 'hua', 'irfannurkholik89@gmail.com', '819898989', '0813919558', 'KOTA JAKARTA SELATAN', 'Jaksel'),
(33, 'Kiw', 'kiw', 'kiw@gmail.com', '1220', '0813919558', 'Purwokerto', 'Purwokerto'),
(34, 'cuki', 'kiw', 'cukiw@gmail.com', '12', '0813919558', 'Jakarta', 'Purwokerto');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `orders_info` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
