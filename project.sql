-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2022 at 01:56 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(20) NOT NULL COMMENT 'imeto na kategoriqta',
  `category_description` text NOT NULL COMMENT 'opisanie'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_description`) VALUES
(1, 'coffee', 'All sorts of coffee beans for you to brew your favorite coffee.'),
(2, 'books', 'Books here are all about coffee of course. From recipes to fiction revolving around coffee.'),
(3, 'DECAF Coffee beans', 'In this category will be listed all coffee beans without caffeine');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(50) NOT NULL COMMENT 'imeto na produkta',
  `product_description` text DEFAULT NULL COMMENT 'opisanie',
  `image` varchar(40) NOT NULL DEFAULT 'default.png' COMMENT 'snimka',
  `price` double NOT NULL COMMENT 'cena na produkta',
  `category_id` int(11) NOT NULL COMMENT 'id na kategoriqta'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_description`, `image`, `price`, `category_id`) VALUES
(1, 'Costa coffee beans. Dark Blend Package', 'Coffee Beans by Costa Coffee. Enjoy the nice smell of your coffee!!!', '1643710594.png', 14.99, 1),
(2, 'Coffee Recipes', 'Check out the recipes for the best coffee blends in the world as well as some not so popular but still good choices.', '1643710816.png', 4.99, 1),
(8, 'Italian Recipes', 'The best italian coffee recipes', '1643719447.png', 4.99, 2),
(11, 'DECAF', 'no caffeine', '1643719742.png', 9.99, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
