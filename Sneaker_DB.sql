-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql8-container
-- Generation Time: Dec 09, 2023 at 10:01 AM
-- Server version: 8.2.0
-- PHP Version: 8.2.8
DROP DATABASE IF EXISTS Sneakers;
-- Nếu cơ sở dữ liệu Sneakers chưa tồn tại, thực hiện câu lệnh CREATE DATABASE
CREATE DATABASE IF NOT EXISTS Sneakers;

-- Sử dụng cơ sở dữ liệu Sneakers
USE Sneakers;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Sneakers`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO categories (id, name)
VALUES 
(1, 'Sneakers'),
(2, 'Boots'),
(3, 'Sandals'),
(4, 'High Heels'),
(5, 'Flats'),
(6, 'Athletic Shoes'),
(7, 'Loafers'),
(8, 'Oxfords'),
(9, 'Espadrilles'),
(10, 'Slippers'),
(11, 'Flip Flops'),
(12, 'Wedges'),
(13, 'Mules'),
(14, 'Platforms'),
(15, 'Ankle Boots'),
(16, 'Chelsea Boots'),
(17, 'Lace-up Boots');

-- --------------------------------------------------------

--
-- Table structure for table `flyway_schema_history`
--

CREATE TABLE `flyway_schema_history` (
  `installed_rank` int NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flyway_schema_history`
--

INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES
(2, '1', 'alter some tables', 'SQL', 'V1__alter_some_tables.sql', 670188877, 'root', '2023-12-01 10:05:58', 605, 1),
(3, '2', 'change tokens', 'SQL', 'V2__change_tokens.sql', 1468721430, 'root', '2023-12-01 10:05:58', 27, 1),
(4, '3', 'refresh tokens', 'SQL', 'V3__refresh_tokens.sql', 1847335528, 'root', '2023-12-03 04:50:25', 36, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `fullname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `phone_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `note` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `order_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('pending','processing','shipped','delivered','cancelled') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Trạng thái đơn hàng',
  `total_money` float DEFAULT NULL,
  `shipping_method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `shipping_address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `shipping_date` date DEFAULT NULL,
  `tracking_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `payment_method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `fullname`, `email`, `phone_number`, `address`, `note`, `order_date`, `status`, `total_money`, `shipping_method`, `shipping_address`, `shipping_date`, `tracking_number`, `payment_method`, `active`) VALUES
(14, 2, 'John Smith', 'john@example.com', '1234567890', '123 Main St', 'Note 1', NULL, 'shipped', 500, NULL, NULL, NULL, NULL, NULL, 0),
(15, 5, 'Eric Thompson', 'eric@example.com', '9876543210', '456 Elm St', 'Note 2', '2023-10-08 00:43:21', 'pending', 400, NULL, NULL, NULL, NULL, NULL, 1),
(16, 2, 'Hans', 'hans@example.com', '5555555555', '789 Oak St', 'Note 3', '2023-10-08 00:43:21', 'pending', 300, NULL, NULL, NULL, NULL, NULL, 1),
(17, 5, 'Alice Johnson', 'alice@example.com', '5551234567', '789 Cherry Ave', 'Note 4', '2023-10-08 00:43:21', 'pending', 200, NULL, NULL, NULL, NULL, NULL, 1),
(18, 2, 'Robert Williams', 'robert@example.com', '5559876543', '321 Maple Rd', 'Note 5', '2023-10-08 00:43:21', 'pending', 100, NULL, NULL, NULL, NULL, NULL, 1),
(19, 2, 'Sarah Davis', 'sarah@example.com', '5554445555', '987 Elm St', 'Note 6', '2023-10-08 00:43:21', 'pending', 250, NULL, NULL, NULL, NULL, NULL, 1),
(20, 5, 'Michael Anderson', 'michael@example.com', '5556667777', '654 Oak Ave', 'Note 7', '2023-10-08 00:43:21', 'pending', 350, NULL, NULL, NULL, NULL, NULL, 1),
(21, 2, 'Emma Wilson', 'emma@example.com', '5558889999', '789 Maple Ln', 'Note 8', '2023-10-08 00:43:21', 'pending', 450, NULL, NULL, NULL, NULL, NULL, 1),
(22, 2, 'Olivia Brown', 'olivia@example.com', '5551112222', '987 Pine St', 'Note 47', '2023-10-08 00:43:21', 'pending', 350, NULL, NULL, NULL, NULL, NULL, 1),
(23, 5, 'William Davis', 'william@example.com', '5553334444', '654 Elm Ave', 'Note 48', '2023-10-08 00:43:21', 'pending', 250, NULL, NULL, NULL, NULL, NULL, 1),
(24, 2, 'Sophia Wilson', 'sophia@example.com', '5555556666', '789 Oak Ln', 'Note 49', '2023-10-08 00:43:21', 'pending', 150, NULL, NULL, NULL, NULL, NULL, 1),
(25, 5, 'Alexander Anderson', 'alexander@example.com', '5557778888', '456 Maple Lane', 'Note 50', '2023-10-08 00:43:21', 'pending', 450, NULL, NULL, NULL, NULL, NULL, 1),
(26, 2, 'Ava Thompson', 'ava@example.com', '5559990000', '987 Walnut Rd', 'Note 51', '2023-10-08 00:43:21', 'pending', 550, NULL, NULL, NULL, NULL, NULL, 1),
(27, 5, 'Daniel Johnson', 'daniel@example.com', '5552223333', '654 Pine Ave', 'Note 52', '2023-10-08 00:43:21', 'pending', 650, NULL, NULL, NULL, NULL, NULL, 1),
(28, 2, 'Mia Williams', 'mia@example.com', '5554445555', '789 Elm St', 'Note 53', '2023-10-08 00:43:21', 'pending', 750, NULL, NULL, NULL, NULL, NULL, 1),
(29, 5, 'James Davis', 'james@example.com', '5556667777', '456 Oak Ave', 'Note 54', '2023-10-08 00:43:21', 'pending', 850, NULL, NULL, NULL, NULL, NULL, 1),
(30, 5, 'Benjamin Thompson', 'benjamin@example.com', '5550001111', '654 Walnut Rd', 'Note 56', '2023-10-08 00:43:21', 'pending', 550, NULL, NULL, NULL, NULL, NULL, 1),
(31, 2, 'Sophia Anderson', 'sophia@example.com', '5551112222', '987 Pine St', 'Note 57', '2023-10-08 00:43:21', 'pending', 350, NULL, NULL, NULL, NULL, NULL, 1),
(32, 5, 'Elijah Davis', 'elijah@example.com', '5553334444', '654 Elm Ave', 'Note 58', '2023-10-08 00:43:21', 'pending', 250, NULL, NULL, NULL, NULL, NULL, 1),
(33, 2, 'Ava Wilson', 'ava@example.com', '5555556666', '789 Oak Ln', 'Note 59', '2023-10-08 00:43:21', 'pending', 150, NULL, NULL, NULL, NULL, NULL, 1),
(34, 5, 'Oliver Thompson', 'oliver@example.com', '5557778888', '456 Maple Lane', 'Note 60', '2023-10-08 00:43:21', 'pending', 450, NULL, NULL, NULL, NULL, NULL, 1),
(35, 2, 'Mia Johnson', 'mia@example.com', '5559990000', '987 Walnut Rd', 'Note 61', '2023-10-08 00:43:21', 'pending', 550, NULL, NULL, NULL, NULL, NULL, 1),
(36, 5, 'James Williams', 'james@example.com', '5552223333', '654 Pine Ave', 'Note 62', '2023-10-08 00:43:21', 'pending', 650, NULL, NULL, NULL, NULL, NULL, 1),
(37, 2, 'Charlotte Davis', 'charlotte@example.com', '5554445555', '789 Elm St', 'Note 63', '2023-10-08 00:43:21', 'pending', 750, NULL, NULL, NULL, NULL, NULL, 1),
(38, 5, 'Benjamin Wilson', 'benjamin@example.com', '5556667777', '456 Oak Ave', 'Note 64', '2023-10-08 00:43:21', 'pending', 850, NULL, NULL, NULL, NULL, NULL, 1),
(39, 2, 'Amelia Thompson', 'amelia@example.com', '5558889999', '321 Maple Ln', 'Note 65', '2023-10-08 00:43:21', 'pending', 950, NULL, NULL, NULL, NULL, NULL, 1),
(40, 5, 'Henry Johnson', 'henry@example.com', '5550001111', '654 Walnut Rd', 'Note 66', '2023-10-08 00:43:21', 'pending', 550, NULL, NULL, NULL, NULL, NULL, 1),
(41, 5, 'Emily Davis', 'emily@example.com', '5552223333', '456 Walnut Lane', 'Note 46', '2023-10-08 00:43:21', 'pending', 150, NULL, NULL, NULL, NULL, NULL, 1),
(42, 5, 'Nguyễn Văn X', 'nvxx@yahoo.com', '1234456', 'Nhà a ngõ B, ngách D', 'Hàng dễ vỡ xin nhẹ tay', '2023-11-16 00:00:00', 'pending', 123.45, 'express', NULL, '2023-11-16', NULL, 'cod', 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
    `id` int NOT NULL,
    `order_id` int DEFAULT NULL,
    `product_id` int DEFAULT NULL,
    `price` decimal(10,2) DEFAULT NULL,
    `number_of_products` int DEFAULT '1',
    `total_money` decimal(10,2) DEFAULT '0.00',
    `size_sneaker` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `price`, `number_of_products`, `total_money`, `size_sneaker`) VALUES
(15, 14, 2, 5.99, 3, 17.97, '30'),
(16, 14, 3, 8.49, 1, 8.49, '32'),
(17, 15, 1, 10.99, 2, 21.98, '31'),
(18, 15, 2, 5.99, 3, 17.97, '30'),
(19, 15, 3, 8.49, 1, 8.49, '32'),
(20, 16, 6, 12.99, 3, 38.97, '35'),
(21, 17, 7, 6.99, 1, 6.99, '36'),
(22, 18, 8, 14.99, 2, 29.98, '37'),
(23, 19, 9, 11.49, 1, 11.49, '38'),
(24, 20, 10, 8.99, 3, 26.97, '39'),
(25, 21, 11, 13.99, 2, 27.98, '40'),
(26, 22, 12, 10.49, 1, 10.49, '41'),
(27, 23, 13, 7.49, 2, 14.98, '42'),
(28, 38, 1, 10.99, 2, 21.98, '31'),
(29, 38, 2, 5.99, 3, 17.97, '30'),
(30, 38, 3, 8.49, 1, 8.49, '32'),
(31, 24, 14, 9.99, 2, 19.98, '31'),
(32, 24, 15, 5.99, 3, 17.97, '30'),
(33, 24, 16, 8.49, 1, 8.49, '32'),
(34, 25, 17, 10.99, 2, 21.98, '33'),
(35, 25, 18, 5.99, 3, 17.97, '34'),
(36, 25, 19, 8.49, 1, 8.49, '35'),
(37, 26, 20, 6.99, 2, 13.98, '36'),
(38, 26, 21, 14.99, 1, 14.99, '37'),
(39, 26, 22, 11.49, 3, 34.47, '38'),
(40, 27, 23, 8.99, 2, 17.98, '39'),
(41, 27, 24, 13.99, 1, 13.99, '40'),
(42, 27, 25, 10.49, 3, 31.47, '41'),
(43, 28, 26, 7.49, 2, 14.98, '42'),
(44, 28, 27, 9.99, 1, 9.99, '31'),
(45, 28, 28, 5.99, 3, 17.97, '30'),
(46, 29, 29, 8.49, 1, 8.49, '32'),
(47, 29, 30, 10.99, 2, 21.98, '33'),
(48, 29, 31, 5.99, 3, 17.97, '34'),
(49, 30, 32, 8.49, 1, 8.49, '35'),
(50, 30, 33, 6.99, 2, 13.98, '36'),
(51, 30, 34, 14.99, 1, 14.99, '37'),
(52, 31, 35, 11.49, 3, 34.47, '38'),
(53, 31, 36, 8.99, 2, 17.98, '39'),
(54, 31, 37, 13.99, 1, 13.99, '40'),
(55, 32, 38, 10.49, 3, 31.47, '41'),
(56, 32, 39, 7.49, 2, 14.98, '42'),
(57, 32, 40, 9.99, 1, 9.99, '31'),
(58, 33, 41, 5.99, 3, 17.97, '30'),
(59, 33, 42, 8.49, 1, 8.49, '32'),
(60, 33, 43, 10.99, 2, 21.98, '33'),
(61, 34, 44, 5.99, 3, 17.97, '34'),
(62, 34, 45, 8.49, 1, 8.49, '35'),
(63, 34, 46, 6.99, 2, 13.98, '36'),
(64, 35, 47, 14.99, 1, 14.99, '37'),
(65, 35, 48, 11.49, 3, 34.47, '38'),
(66, 35, 49, 8.99, 2, 17.98, '39'),
(67, 36, 50, 13.99, 1, 13.99, '40'),
(68, 36, 51, 10.49, 3, 31.47, '41'),
(69, 36, 52, 7.49, 2, 14.98, '42');



-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(350) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Tên sản phẩm',
  `price` decimal(10,2) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `category_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `thumbnail`, `description`, `created_at`, `updated_at`, `category_id`) VALUES
(1, 'Adidas Ultraboost 21', 70.07, 'adidas-ultraboost-22-magic-grey-turbo-1-300x300.jpg', 'Running shoes with a unique Boost midsole for maximum cushioning and responsiveness.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 3),
(2, 'Adidas Ultraboost 20', 89.99, 'adidas-ultraboost-22-triple-white-2-300x300.jpg', 'Running shoes with a unique Boost midsole for maximum cushioning and responsiveness.ss', '2023-07-31 08:28:28', '2023-11-10 09:27:31', 4),
(3, 'Jordan Retro 4 "Bred"', 12.87, 'alexander-mcqueen-trang-got-den-sieu-cap-1-300x300.jpg', 'Classic athletic shoes with a simple design and Air-Sole unit for comfort and support.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 4),
(5, 'New Balance 990v5', 32.85, 'giay-alexander-mcqueen-trang-got-nau-trong-like-auth-2-300x300.jpg', 'Retro version of the iconic Jordan shoes with a unique design.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 2),
(6, 'Vans Old Skool:', 91.24, 'giay-alexander-mcqueen-trang-got-van-ca-sau-like-auth-2-300x300.jpg', 'Retro version of the iconic Jordan shoes with a unique design.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 2),
(7, 'Reebok Classic Leather', 32.94, 'giay-mlb-chunky-liner-mid-boston-monogram-brown-like-auth-1-300x300', 'Skate shoes with a canvas upper and signature side stripe.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 2),
(8, 'Converse Chuck Taylor All Star High', 25.76, 'giay-mlb-chunky-liner-mid-denim-boston-red-sox-dblue-auth-5-300x300.jpg', 'Classic high-top sneakers with a rubber sole and toe cap.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 2),
(9, 'Fantastic Paper Clock', 45.88, 'giay-mlb-korea-bigball-chunky-window-new-york-yankees-navy-best-quality-13-300x300.jpg', 'Consequatur voluptas omnis veritatis.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 3),
(10, 'Lightweight Wool Shoes', 42.91, 'giay-nike-air-force-1-low-valentines-day-2024-like-auth-1-300x300.jpg', 'Magni nisi sunt.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 3),
(11, 'Puma Suede Classic', 76.33, 'Giay-Nike-Air-Force-Paranoise-2.0-300x300.jpg', 'Fuga assumenda omnis autem.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 3),
(12, 'Enormous Linen Wallet', 16.09, 'Giay-Nike-Air-Jordan-1-Low-Travis-Scott-Black-Olive.jpg', 'Ut cupiditate quia dolorem placeat unde cum quo.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 3),
(13, 'Heavy Duty Concrete Hat', 30.82, 'giay-nike-air-jordan-1-low-travis-scott-black-olive-best-quality-9-650x650.jpg', 'Ipsum beatae beatae.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 3),
(14, 'Enormous Aluminum Table', 32.83, 'giay-nike-air-jordan-1-low-travis-scott-golf-best-quality-10-300x300.jpg', 'Non reprehenderit omnis.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 3),
(15, 'Small Iron Shirt', 21.25, 'giay-nike-air-jordan-1-low-travis-scott-navy-like-auth-300x300.jpg', 'Reiciendis et nemo.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 4),
(16, 'Heavy Duty Steel Clock', 56.38, 'Giay-Nike-Air-Jordan-1-Retro-High-Black-White-Rep11-300x300.jpg', 'Voluptates et veritatis ut saepe dolorem.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 2),
(17, 'Rustic Steel Knife', 94.99, 'giay-nike-air-jordan-1-retro-low-og-sp-travis-scott-black-phantom-best-quality-2-300x300.jpg', 'Autem iure quia atque.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 4),
(18, 'Incredible Wooden Plate', 75.35, 'giay-nike-jordan-chicago-bred-replica-1-300x300.jpg', 'Aut beatae voluptatibus excepturi.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 3),
(19, 'Rustic Linen Watch', 70.74, 'jordan-1-low-fragment-like-auth-300x300.jpg', 'Et rerum aut accusamus numquam exercitationem minus voluptas.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 4),
(20, 'Durable Concrete Gloves', 71.88, 'Jordan-4-White-Cement-300x300.jpg', 'Aut hic officiis.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 3),
(21, 'Small Cotton Clock', 41.02, 'lv-air-force-1-virgil-abloh-white-1-300x300.jpg', 'Hic ea qui dicta.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 4),
(22, 'Ergonomic Concrete Shirt', 84.58, 'nike-air-force-1-g-dragon-peaceminusone-para-noise-20-ban-troc-son-trang-best-quality-12-300x300.jpg', 'Tempora amet sed omnis est aut est.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 3),
(23, 'Practical Plastic Clock', 11.74, 'nike-air-jordan-1-black-toe-replica-1-300x300.jpg', 'Quo minus ea impedit et aut.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 2),
(24, 'Sleek Steel Car', 37.95, 'nike-air-jordan-1-low-panda-2023-4-1-300x300.jpg', 'Dolorem enim et nihil enim unde voluptas aspernatur.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 4),
(25, 'Aerodynamic Marble Shoes', 31.30, 'Nike-Air-Jordan-1-Low-Shattered-Backboard-2-300x300.jpg', 'Labore quia sit praesentium assumenda cumque voluptatem accusantium.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 2),
(26, 'Awesome Marble Computer', 23.14, 'nike-air-jordan-1-low-travis-scott-x-fragment-12-300x300.jpg', 'Ea sed dolor est occaecati nihil.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 3),
(27, 'Synergistic Silk Pants', 18.06, 'Nike-Air-Jordan-1-Retro-Low-Dior-11-7-300x300.jpg', 'Sed cumque sit aut perferendis autem.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(28, 'Ergonomic Plastic Table', 80.87, 'Nike-Air-Jordan-1-Retro-Low-OG-SP-Travis-ScottT-8-300x300.jpg', 'A voluptas deserunt.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(29, 'Lightweight Wool Chair', 57.00, 'nike-jordan-1-nrg-off-white-replica-1-300x300.jpg', 'Sunt qui eos nemo reiciendis itaque facere.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 2),
(30, 'Sleek Iron Car', 35.10, NULL, 'Nulla porro qui non id temporibus labore qui.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(31, 'Sleek Marble Computer', 19.98, 'nike-jordan-1-off-white-blue-replica-1-300x300.jpg', 'Voluptatem mollitia quidem ad impedit non.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(32, 'Heavy Duty Iron Clock', 6.67, 'ub22-white-mint-rush-300x300.jpg', 'Et ducimus illum.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 2),
(33, 'Aerodynamic Bronze Bottle', 72.89, NULL, 'Ratione optio nobis esse veritatis.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 2),
(34, 'Rustic Iron Coat', 89.88, NULL, 'Accusamus sed distinctio.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 2),
(35, 'Mediocre Aluminum Bag', 10.63, NULL, 'Officia asperiores nihil omnis sed praesentium quod delectus.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 4),
(36, 'Heavy Duty Silk Bottle', 64.09, NULL, 'Et in amet impedit inventore.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(37, 'Mediocre Marble Wallet', 66.09, NULL, 'Rerum ab vel non.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(38, 'Intelligent Marble Keyboard', 85.81, NULL, 'Fuga nesciunt in culpa.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(39, 'Synergistic Granite Car', 73.61, NULL, 'Totam ut voluptate dolor est.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 2),
(40, 'Mediocre Cotton Shirt', 28.38, NULL, 'Mollitia modi quia distinctio molestiae facere adipisci.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 2),
(41, 'Enormous Marble Wallet', 16.78, NULL, 'Molestiae minima natus eligendi illum optio eos.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(42, 'Mediocre Silk Gloves', 18.40, NULL, 'Ullam autem iure in similique vitae.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 4),
(43, 'Awesome Copper Wallet', 56.61, NULL, 'Minus aut possimus aliquam est.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(44, 'Enormous Wool Table', 39.05, NULL, 'Aut quis consequatur ab ipsam illum corrupti nesciunt.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(45, 'Gorgeous Granite Keyboard', 83.44, NULL, 'Pariatur enim non error.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(46, 'Small Copper Pants', 8.83, NULL, 'Non rerum laboriosam quos eos est.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 2),
(47, 'Practical Copper Car', 7.76, NULL, 'Provident minus ut temporibus non mollitia deserunt.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 2),
(48, 'Incredible Marble Coat', 17.05, NULL, 'Odio aliquid sequi.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(49, 'Awesome Concrete Table', 25.02, NULL, 'Et laboriosam eum quos eveniet dolor quaerat provident.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(50, 'Ergonomic Wooden Pants', 96.05, NULL, 'Vel maiores enim officia.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(51, 'Lightweight Concrete Bag', 89.77, NULL, 'Laborum consequatur maiores omnis consequuntur.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 4),
(52, 'Mediocre Concrete Pants', 57.11, NULL, 'Omnis molestiae laudantium consequatur non doloribus dicta.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(53, 'Heavy Duty Plastic Wallet', 54.09, NULL, 'Et est enim nesciunt.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(54, 'Incredible Aluminum Bottle', 90.84, NULL, 'Neque neque debitis.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(55, 'Heavy Duty Concrete Table', 93.11, NULL, 'Voluptatem deleniti voluptas voluptatem accusantium quos reiciendis et.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(56, 'Awesome Silk Shirt', 78.62, NULL, 'Quidem sint et nihil vero.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 2),
(57, 'Practical Linen Wallet', 69.70, NULL, 'Voluptas aut autem quod aut ipsam.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(58, 'Rustic Cotton Car', 12.71, NULL, 'Ut eum ut aliquid.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 2),
(59, 'Practical Wooden Car', 16.29, NULL, 'Veniam sequi dignissimos aut ea quis.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 2),
(60, 'Mediocre Marble Pants', 49.15, NULL, 'Error veniam quam repudiandae.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 2),
(61, 'Mediocre Iron Wallet', 14.27, NULL, 'Et omnis sequi dolorem.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(62, 'Rustic Leather Lamp', 43.70, NULL, 'Et voluptate voluptas dignissimos veniam consequatur ab.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 2),
(63, 'Gorgeous Wool Bench', 22.97, NULL, 'Quia eligendi ratione inventore cum.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(64, 'Gorgeous Iron Watch', 90.13, NULL, 'Doloremque nisi aspernatur nihil quae veritatis.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 2),
(65, 'Intelligent Iron Computer', 90.67, NULL, 'Pariatur hic excepturi cumque quidem et ea.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(66, 'Incredible Wool Table', 39.56, NULL, 'Qui in maxime nihil quis.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(67, 'Enormous Cotton Lamp', 60.61, NULL, 'Voluptatibus voluptatem reiciendis ea nemo eveniet praesentium minus.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(68, 'Fantastic Concrete Lamp', 27.61, NULL, 'In rem temporibus corrupti molestiae maxime molestiae.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 2),
(69, 'Lightweight Plastic Watch', 17.10, NULL, 'Voluptatem porro in.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(70, 'Sleek Granite Bottle', 19.36, NULL, 'Repellat animi corrupti nulla eos voluptatem doloribus.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 2),
(71, 'Fantastic Copper Car', 84.91, NULL, 'Quae qui est sed nam.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(72, 'Fantastic Rubber Table', 27.04, NULL, 'In at et.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(73, 'Incredible Concrete Hat', 58.65, NULL, 'Aliquam harum explicabo animi ducimus.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(74, 'Rustic Iron Hat', 86.93, NULL, 'Consequuntur sed reprehenderit iste.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 2),
(75, 'Ergonomic Cotton Knife', 73.87, NULL, 'Rerum maiores voluptatum beatae animi voluptatem odio dolorem.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 2),
(76, 'Small Paper Keyboard', 24.11, NULL, 'Quaerat autem exercitationem et impedit.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 2),
(77, 'Practical Paper Bench', 10.22, NULL, 'Culpa temporibus voluptatibus.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 2),
(78, 'Incredible Copper Shoes', 23.28, NULL, 'Voluptatem qui reprehenderit pariatur provident voluptate.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(79, 'Rustic Linen Hat', 26.26, NULL, 'Ut quasi blanditiis blanditiis.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(80, 'Enormous Bronze Lamp', 59.38, NULL, 'Totam itaque laborum rem et reprehenderit.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 4),
(81, 'Small Steel Bag', 20.97, NULL, 'Nisi qui libero non maxime voluptatem non et.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 4),
(82, 'Ergonomic Granite Bench', 95.97, NULL, 'Recusandae amet vero voluptatem enim inventore nihil voluptate.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 2),
(83, 'Mediocre Rubber Car', 31.75, NULL, 'Quidem doloribus autem et inventore sit quia.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(84, 'Small Wool Shoes', 55.56, NULL, 'Magni accusamus et.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(85, 'Fantastic Leather Car', 86.85, NULL, 'Dolores culpa ratione voluptatum eum.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(86, 'Synergistic Aluminum Gloves', 6.10, NULL, 'Eligendi est quibusdam officiis sed voluptas.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 4),
(87, 'Ergonomic Wool Bottle', 14.17, NULL, 'Eaque adipisci blanditiis eos quia adipisci.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(88, 'Incredible Concrete Coat', 78.39, NULL, 'Ea voluptatem doloribus velit.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(89, 'Ergonomic Leather Watch', 38.91, NULL, 'Harum aut placeat quod.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(90, 'Intelligent Concrete Knife', 68.75, NULL, 'Qui et sed et cupiditate facilis aut pariatur.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(91, 'Awesome Marble Shirt', 95.05, NULL, 'Exercitationem ea molestiae similique exercitationem labore.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 4),
(92, 'Small Paper Chair', 47.25, NULL, 'Delectus illo consequatur quo aliquam.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 2),
(93, 'Ergonomic Iron Gloves', 83.33, NULL, 'Porro ut vitae et ea eum in.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 2),
(94, 'Rustic Aluminum Car', 7.94, NULL, 'Repellendus sint numquam sint officia esse harum pariatur.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 2),
(95, 'Intelligent Wooden Gloves', 84.88, NULL, 'Voluptates adipisci suscipit et est voluptates.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 2),
(96, 'Small Aluminum Keyboard', 40.20, NULL, 'Quod assumenda quo debitis et libero et et.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(97, 'Enormous Paper Lamp', 41.97, NULL, 'Rerum blanditiis at.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(98, 'Enormous Bronze Keyboard', 28.57, NULL, 'Quaerat aliquam fugit.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 3),
(99, 'Enormous Wool Pants', 12.17, NULL, 'Eaque consequatur sed perspiciatis sapiente voluptatem.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 4),
(100, 'Heavy Duty Leather Chair', 20.01, NULL, 'Sit libero aliquam aut quis.', '2023-07-31 08:28:29', '2023-07-31 08:28:29', 4);


-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `image_url` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_url`) VALUES
(8, 1, 'ub22-white-mint-rush-300x300.jpg'),
(9, 1, 'nike-jordan-1-off-white-blue-replica-1-300x300.jpg'),
(10, 1, 'nike-jordan-1-nrg-off-white-replica-1-300x300.jpg'),
(11, 1, 'giay-nike-jordan-chicago-bred-replica-1-300x300.jpg'),
(12, 1, 'Nike-Air-Jordan-1-Retro-Low-OG-SP-Travis-ScottT-8-300x300.jpg'),
(13, 1, 'giay-nike-air-jordan-1-low-travis-scott-navy-like-auth-300x300.jpg'),
(14, 2, 'Nike-Air-Jordan-1-Retro-Low-Dior-11-7-300x300.jpg'),
(15, 2, 'giay-nike-jordan-chicago-bred-replica-1-300x300.jpg'),
(16, 2, 'Nike-Air-Jordan-1-Low-Shattered-Backboard-2-300x300.jpg'),
(17, 2, 'nike-air-jordan-1-low-panda-2023-4-1-300x300.jpg'),
(18, 2, 'lv-air-force-1-virgil-abloh-white-1-300x300.jpg'),
(19, 3, 'nike-air-jordan-1-low-panda-2023-4-1-300x300.jpg'),
(20, 3, 'giay-nike-jordan-chicago-bred-replica-1-300x300.jpg'),
(21, 3, 'lv-air-force-1-virgil-abloh-white-1-300x300.jpg'),
(22, 3, 'giay-nike-air-jordan-1-low-travis-scott-golf-best-quality-10-300x300.jpg'),
(23, 3, 'Giay-Nike-Air-Force-Paranoise-2.0-300x300.jpg'),
(24, 5, 'giay-mlb-chunky-liner-mid-boston-monogram-brown-like-auth-1-300x300'),
(25, 5, 'Nike-Air-Jordan-1-Retro-Low-OG-SP-Travis-ScottT-8-300x300.jpg'),
(26, 5, 'lv-air-force-1-virgil-abloh-white-1-300x300.jpg'),
(27, 5, 'lv-air-force-1-virgil-abloh-white-1-300x300.jpg'),
(28, 7, 'nike-jordan-1-off-white-blue-replica-1-300x300.jpg'),
(29, 7, 'giay-nike-jordan-chicago-bred-replica-1-300x300.jpg'),
(30, 7, 'giay-mlb-chunky-liner-mid-denim-boston-red-sox-dblue-auth-5-300x300.jpg'),
(31, 7, 'Nike-Air-Jordan-1-Retro-Low-Dior-11-7-300x300.jpg'),
(32, 7, 'Nike-Air-Jordan-1-Retro-Low-Dior-11-7-300x300.jpg'),
(33, 8, 'nike-jordan-1-off-white-blue-replica-1-300x300.jpg'),
(34, 8, 'nike-jordan-1-nrg-off-white-replica-1-300x300.jpg'),
(35, 8, 'Giay-Nike-Air-Force-Paranoise-2.0-300x300.jpg'),
(36, 8, 'giay-nike-air-jordan-1-retro-low-og-sp-travis-scott-black-phantom-best-quality-2-300x300.jpg'),
(37, 8, 'Jordan-4-White-Cement-300x300.jpgg'),
(38, 9, 'lv-air-force-1-virgil-abloh-white-1-300x300.jpg'),
(39, 9, 'Nike-Air-Jordan-1-Retro-Low-Dior-11-7-300x300.jpg'),
(40, 9, 'giay-nike-air-jordan-1-low-travis-scott-navy-like-auth-300x300.jpg'),
(41, 9, 'giay-nike-air-jordan-1-retro-low-og-sp-travis-scott-black-phantom-best-quality-2-300x300.jpg'),
(42, 9, 'Nike-Air-Jordan-1-Low-Shattered-Backboard-2-300x300.jpg'),
(43, 10, 'Nike-Air-Jordan-1-Retro-Low-OG-SP-Travis-ScottT-8-300x300.jpg'),
(44, 10, 'lv-air-force-1-virgil-abloh-white-1-300x300.jpg'),
(45, 10, 'giay-nike-jordan-chicago-bred-replica-1-300x300.jpg'),
(46, 10, 'giay-nike-air-jordan-1-retro-low-og-sp-travis-scott-black-phantom-best-quality-2-300x300.jpg'),
(47, 11, 'giay-nike-air-jordan-1-low-travis-scott-golf-best-quality-10-300x300.jpg'),
(48, 11, 'Nike-Air-Jordan-1-Retro-Low-Dior-11-7-300x300.jpg'),
(49, 11, 'nike-air-force-1-g-dragon-peaceminusone-para-noise-20-ban-troc-son-trang-best-quality-12-300x300.jpg'),
(50, 11, 'ub22-white-mint-rush-300x300.jpg');


-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'user'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `social_accounts`
--

CREATE TABLE `social_accounts` (
  `id` int NOT NULL,
  `provider` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Tên nhà social network',
  `provider_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Email tài khoản',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Tên người dùng',
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `token_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `user_id` int DEFAULT NULL,
  `is_mobile` tinyint(1) DEFAULT '0',
  `refresh_token` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  `refresh_expiration_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `token`, `token_type`, `expiration_date`, `revoked`, `expired`, `user_id`, `is_mobile`, `refresh_token`, `refresh_expiration_date`) VALUES
(7, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjMzNDQ1NTY2IiwidXNlcklkIjo1LCJzdWIiOiIzMzQ0NTU2NiIsImV4cCI6MTcwNDAxODIzMX0.mA1bofNECAkMWbZqK0h_WJgVqlTOjfd5XoAiDAqAy7w', 'Bearer', '2023-12-31 10:23:51', 0, 0, 5, 1, '', NULL),
(15, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjExMjIzMzQ0IiwidXNlcklkIjozLCJzdWIiOiIxMTIyMzM0NCIsImV4cCI6MTcwNDI1NjMyNH0.w-IXoFFHIMasMwayM0DxZraW3YRgoC_h61C6-74cXqU', 'Bearer', '2024-01-03 04:32:04', 0, 0, 3, 0, '624651d3-a3f6-4f99-89c1-94104ec22a74', '2024-02-02 04:32:04'),
(16, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjExMjIzMzQ0IiwidXNlcklkIjozLCJzdWIiOiIxMTIyMzM0NCIsImV4cCI6MTcwNDI1NjM2MH0.U6A4ed5dxRAzMxwHluiR0-_Rxm0ngXfZ1RN-VaW_OpY', 'Bearer', '2024-01-03 04:32:40', 0, 0, 3, 0, '8caf32df-69e8-4489-9716-4e2a2944a1a8', '2024-02-02 04:32:40'),
(29, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjA5NjQ4OTYyMzkiLCJ1c2VySWQiOjgsInN1YiI6IjA5NjQ4OTYyMzkiLCJleHAiOjE3MDQ3MDc1MTR9.B3iHckT44zN8zG3clXsURaemqWvfz7HJkR-e9b9VCo0', 'Bearer', '2024-01-08 09:51:55', 0, 0, 8, 0, '9cd17548-6634-43c4-a0a6-376266413e68', '2024-02-07 09:51:55'),
(32, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjA5NjQ4OTYyMzkiLCJ1c2VySWQiOjgsInN1YiI6IjA5NjQ4OTYyMzkiLCJleHAiOjE3MDQ3MDc2MTV9.CkOUQe1k7XFjLfiMJgB7VLvVnZnEfkASP0cc7eVAJtQ', 'Bearer', '2024-01-08 09:53:35', 0, 0, 8, 0, '94ac5e7b-abaa-40d7-90df-0a044b7c705c', '2024-02-07 09:53:35'),
(33, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjMzNDQ1NTY2IiwidXNlcklkIjo1LCJzdWIiOiIzMzQ0NTU2NiIsImV4cCI6MTcwNDcwNzY1MX0.CbZR3D0WZQCZx1Gj53_GKv7mrGayK4ZGqjO_-YNO_NM', 'Bearer', '2024-01-08 09:54:12', 0, 0, 5, 0, '635b4f9c-c28f-418c-b907-8ccc514924c4', '2024-02-07 09:54:12'),
(34, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjA5NjQ4OTYyMzkiLCJ1c2VySWQiOjgsInN1YiI6IjA5NjQ4OTYyMzkiLCJleHAiOjE3MDQ3MDc4NzN9.NzGHRwdw9f1mK6OTe4a8Jsg6xdedeqoAQRb1FZO19Vo', 'Bearer', '2024-01-08 09:57:53', 0, 0, 8, 0, 'c9544702-4ea7-403a-9914-4159f952287a', '2024-02-07 09:57:53'),
(35, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjMzNDQ1NTY2IiwidXNlcklkIjo1LCJzdWIiOiIzMzQ0NTU2NiIsImV4cCI6MTcwNDcwNzg5MH0.M1VOtWhQ1mmt04r9AKhHCQUCfc1-mWH_haJ720OXm_E', 'Bearer', '2024-01-08 09:58:11', 0, 0, 5, 0, 'd976b190-9db0-425b-87d8-df95d8221a15', '2024-02-07 09:58:11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `fullname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `phone_number` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `password` char(60) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `date_of_birth` date DEFAULT NULL,
  `facebook_account_id` int DEFAULT '0',
  `google_account_id` int DEFAULT '0',
  `role_id` int DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `phone_number`, `address`, `password`, `created_at`, `updated_at`, `is_active`, `date_of_birth`, `facebook_account_id`, `google_account_id`, `role_id`) VALUES
(2, 'Nguyễn Văn A', '012456878', 'Nhà a ngõ b', '$2a$10$WdSf5UuyxQMAHcO502qXredzcc8OZQo4XQZNp3UxeT6/bKbuJx/6y', '2023-08-03 05:36:11', '2023-08-03 05:36:11', 1, '1999-10-25', 0, 0, 2),
(3, 'Tài khoản admin 1', '11223344', 'Đây là admin nhé', '$2a$10$JFQT3HeFUKDl7c/l.iNFAeybFr7Wi3krwgVVR7ieif.2De5p9LGAG', '2023-08-06 00:34:35', '2023-08-06 00:34:35', 1, '1993-10-25', 0, 0, 2),
(5, 'Nguyễn Văn B', '33445566', 'Nhà a ngõ b 11', '$2a$10$e95NOMrOFFpfhWibOpAw/uJrqfsBuJ9O3xNgZAP6vnHTh5QHvgliu', '2023-08-08 03:02:48', '2023-11-16 01:05:34', 1, '2000-10-25', 2, 3, 1),
(7, 'Nguyen Van Y', '123456789', 'Nhà x ngo y', '$2a$10$oZwu2RA2iiNVIaQZgdi7bueKc5YNWr39yu.gXdsavBzo5AOb1kP5e', '2023-11-16 00:52:29', '2023-11-16 00:52:29', 1, '2000-10-25', 0, 0, 1),
(8, 'Nguyen Duc C', '0964896239', 'Bach mai, hanoi, vietnam', '$2a$10$cGkVz4/65tDn2M33Gx3GYOC3DKrRni4SK/m1So0rpIXQFiG/ltM5G', '2023-12-09 08:27:38', '2023-12-09 08:27:38', 1, '1979-10-25', 0, 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `flyway_schema_history`
--
ALTER TABLE `flyway_schema_history`
  ADD PRIMARY KEY (`installed_rank`),
  ADD KEY `flyway_schema_history_s_idx` (`success`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_images_product_id` (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_accounts`
--
ALTER TABLE `social_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5781;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `social_accounts`
--
ALTER TABLE `social_accounts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `fk_product_images_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `social_accounts`
--
ALTER TABLE `social_accounts`
  ADD CONSTRAINT `social_accounts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
