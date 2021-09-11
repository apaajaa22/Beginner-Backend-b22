-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2021 at 06:51 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coffeeshop_dev`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Favorite Products', '2021-06-08 15:43:49', NULL),
(2, 'Coffee', '2021-06-08 15:44:10', NULL),
(3, 'Non Coffee', '2021-06-08 15:44:33', NULL),
(4, 'Foods', '2021-06-08 15:44:44', NULL),
(5, 'Addons', '2021-06-08 15:44:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` int(11) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `sender` varchar(255) DEFAULT NULL,
  `recipient` varchar(255) DEFAULT NULL,
  `isLatest` tinyint(1) DEFAULT 1,
  `attachment` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `message`, `sender`, `recipient`, `isLatest`, `attachment`, `createdAt`, `updatedAt`) VALUES
(564, 'ini dari postman ok', '0822123443212', '0832123456789', 0, NULL, '2021-08-19 10:34:57', '2021-08-19 10:35:09'),
(565, 'ini dari web', '0832123456789', '0822123443212', 1, NULL, '2021-08-19 10:35:09', '2021-08-19 10:35:09'),
(566, 'halo', '0832123456789', '0823276359111', 0, NULL, '2021-08-19 10:35:48', '2021-08-19 10:36:15'),
(567, 'halo', '0832123456789', '0823276359111', 0, NULL, '2021-08-19 10:36:15', '2021-08-19 10:37:11'),
(569, 'tes', '0832123456789', '0823276359111', 0, NULL, '2021-08-19 10:37:11', '2021-08-19 10:58:56'),
(571, 'halo ini dari web', '0832123456789', '082817038679', 0, NULL, '2021-08-19 10:38:16', '2021-08-19 10:38:29'),
(572, 'halo juga', '082817038679', '0832123456789', 0, NULL, '2021-08-19 10:38:29', '2021-08-19 10:39:01'),
(573, 'halo wan ini dari web incognito', '0823276359111', '082817038679', 0, NULL, '2021-08-19 10:38:54', '2021-08-19 10:39:54'),
(574, 'halo', '0832123456789', '082817038679', 0, NULL, '2021-08-19 10:39:01', '2021-08-19 10:59:38'),
(576, 'halo', '082817038679', '0823276359111', 0, NULL, '2021-08-19 10:39:54', '2021-08-19 10:40:07'),
(577, 'halo', '0823276359111', '082817038679', 1, NULL, '2021-08-19 10:40:07', '2021-08-19 10:40:07'),
(578, 'halo', '0823276359111', '0832123456789', 1, NULL, '2021-08-19 10:58:57', '2021-08-19 10:58:57'),
(579, 'reza', '082817038679', '0832123456789', 1, NULL, '2021-08-19 10:59:38', '2021-08-19 10:59:38'),
(580, 'halo kang', '082212345678', '0832123456789', 0, NULL, '2021-09-06 11:09:15', '2021-09-06 11:09:57'),
(581, 'iya halo ada apa?', '0832123456789', '082212345678', 0, NULL, '2021-09-06 11:09:57', '2021-09-06 11:10:24'),
(582, 'kamu sedang apa?', '082212345678', '0832123456789', 0, NULL, '2021-09-06 11:10:24', '2021-09-06 11:10:36'),
(583, 'sedang testing', '0832123456789', '082212345678', 0, NULL, '2021-09-06 11:10:36', '2021-09-06 11:10:43'),
(584, 'oke kalo begitu', '082212345678', '0832123456789', 0, NULL, '2021-09-06 11:10:43', '2021-09-06 11:10:47'),
(585, 'siplah', '0832123456789', '082212345678', 0, NULL, '2021-09-06 11:10:47', '2021-09-06 11:10:49'),
(586, 'hehe', '0832123456789', '082212345678', 0, NULL, '2021-09-06 11:10:49', '2021-09-06 11:11:31'),
(587, 'tes lagi', '0832123456789', '082212345678', 0, NULL, '2021-09-06 11:11:31', '2021-09-06 11:11:34'),
(588, 'halo', '082212345678', '0832123456789', 1, NULL, '2021-09-06 11:11:34', '2021-09-06 11:11:34');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `name` varchar(80) NOT NULL,
  `price` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `description` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `delivery_on` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `picture`, `name`, `price`, `id_category`, `description`, `quantity`, `delivery_on`, `created_at`, `updated_at`) VALUES
(1, '/uploads/1624825500421.png', 'Cold Brew', 25000, 2, 'Cold brewing is a method of brewing that combines ground coffee and cool water and uses time instead of heat to extract the flavor. It is brewed in small batches and steeped for as long as 48 hours.', 5, 'Delivery only on Monday to friday at  1 - 7 pm', '2021-06-08 14:45:57', NULL),
(2, '/uploads/1624547318267.jpg', 'Teh manis dingin', 10000, 3, 'Sweet tea is a drink made from a tea solution that is sweetened, usually cane sugar, before the drink is ready to be served. For the Indonesian context, sweet tea with ice is usually called es teh.', 5, 'Delivery only on Monday to friday at  1 - 7 pm', '2021-06-08 14:58:54', NULL),
(3, '/uploads/1624809857508.jpg', 'Mathca Latte', 15000, 3, 'Sweet tea is a drink made from a tea solution that is sweetened, usually cane sugar, before the drink is ready to be served. For the Indonesian context, sweet tea with ice is usually called es teh.', 2, 'Delivery only on Monday to friday at  1 - 7 pm', '2021-06-08 15:20:16', NULL),
(4, '/uploads/1624809606039.jpg', 'Kopi Joni', 15000, 2, 'Sweet tea is a drink made from a tea solution that is sweetened, usually cane sugar, before the drink is ready to be served. For the Indonesian context, sweet tea with ice is usually called es teh.', 2, 'Delivery only on Monday to friday at  1 - 7 pm', '2021-06-08 16:01:03', NULL),
(5, '/uploads/1624810022257.jpg', 'Infusion tea', 20000, 3, 'Tea is a drink that contains caffeine, an infusion made by brewing the dried leaves, shoots, or petioles of the Camellia sinensis plant in hot water. Teas derived from the tea plant are divided into four groups: black teas, oolong teas, green teas, and white teas.', 5, 'Delivery only on Monday to friday at  1 - 7 pm', '2021-06-08 19:08:24', NULL),
(6, '/uploads/1624810048738.jpg', 'Cookies and Cream', 25000, 3, 'Cookies and creams are a variety of ice creams and milkshakes made based on the flavors of chocolate sandwiches, with the most popular versions containing handcakes or pastries from the Oreo Nabisco brand under a license agreement.', 8, 'Delivery only on Monday to friday at  1 - 7 pm', '2021-06-08 19:08:24', '2021-07-27 20:18:46'),
(7, '/uploads/1624809634199.jpg', 'Nasi Ayam Goreng', 22000, 4, 'Rice and fried chicken is a food in the form of rice and chicken fried in cooking oil. Usually added with garlic, pepper and other spices; like turmeric salt.', 3, 'Delivery only on Monday to friday at  1 - 7 pm', '2021-06-08 19:16:04', NULL),
(8, '/uploads/1624810199200.jpeg', 'Pecel Lele', 12000, 4, 'Pecel lele or pecek lele in Indonesia is the name of a typical Javanese food consisting of catfish and tomato sauce. Usually what is meant is catfish that is fried dry in oil then served with tomato sauce and fresh vegetables. Lalapan usually consists of basil, cabbage, cucumber, and long beans', 2, 'Delivery only on Monday to friday at  1 - 7 pm', '2021-06-08 19:16:04', NULL),
(9, '/uploads/1624810217887.jpg', 'Sop Buntut', 30000, 4, 'Oxtail soup made with cow\'s tail. There are at least five versions of oxtail soup that are popular around the world: traditional Korean food, Chinese food that is more like stews, fried / roasted beef tail.', 6, 'Delivery only on Monday to friday at  1 - 7 pm', '2021-06-08 19:19:22', NULL),
(10, '/uploads/1624809664059.jpg', 'Nasi Goreng', 20000, 4, 'Fried rice is a food in the form of rice that is fried and stirred in cooking oil, margarine, or butter. Usually added with sweet soy sauce, shallots, garlic, tamarind, pepper and other spices; such as eggs, chicken, and crackers.', 2, 'Delivery only on Monday to friday at  1 - 7 pm', '2021-06-08 19:19:22', NULL),
(11, '/uploads/1624809874380.png', 'Affogatto', 30000, 2, 'Affogato or better known as \"affogato al caffe\" is a dessert made from Italian coffee. Usually it\'s a scoop fior in a latte or vanilla gelato or ice cream on top or \"dipped\" with a glass of hot espresso', 4, 'Delivery only on Monday to friday at  1 - 7 pm', '2021-06-08 19:22:24', NULL),
(12, '/uploads/1624547095220.jpg', 'Gorengan', 10000, 5, 'Gorengan is a term that includes various types of food that are dipped in flour batter and then soaked in a lot of hot cooking oil.', 3, 'Delivery only on Monday to friday at  1 - 7 pm', '2021-06-08 19:22:24', NULL),
(63, '/uploads/1624809683572.jpg', 'Kopi Kopo Baru', 15000, 2, 'Sweet tea is a drink made from a tea solution that is sweetened, usually cane sugar, before the drink is ready to be served. For the Indonesian context, sweet tea with ice is usually called es teh.', 20, 'Delivery only on Monday to friday at  1 - 7 pm', '2021-06-14 05:38:12', '2021-07-22 19:13:03'),
(64, '/uploads/1624809702768.jpg', 'Batagor', 25000, 4, 'Batagor merupakan jajanan khas Bandung yang mengadaptasi gaya Tionghoa-Indonesia dan kini sudah dikenal hampir di seluruh wilayah Indonesia.', 20, 'Delivery only on Monday to friday at  1 - 7 pm', '2021-06-14 05:48:47', '2021-07-22 19:13:11'),
(65, '/uploads/1624809743170.png', 'Milk Shake', 20000, 3, 'Susu kocok adalah minuman dingin dari campuran susu, es krim, dan sirop berperasa yang dikocok hingga berbusa. Selain dikocok dengan blender, susu kocok bisa dibuat dengan memakai gelas pengocok bertutup. Di Britania Raya, susu kocok hanya dibuat dari susu yang dicampur buah atau cokelat.', 10, 'Delivery only on Monday to friday at  1 - 7 pm', '2021-06-14 15:57:38', '2021-07-22 19:13:15'),
(66, '\\uploads\\1.jpg', 'Milk Shake', 20000, 3, 'Susu kocok adalah minuman dingin dari campuran susu, es krim, dan sirop berperasa yang dikocok hingga berbusa. Selain dikocok dengan blender, susu kocok bisa dibuat dengan memakai gelas pengocok bertutup. Di Britania Raya, susu kocok hanya dibuat dari susu yang dicampur buah atau cokelat.', 10, 'Delivery only on Monday to friday at  1 - 7 pm', '2021-06-14 16:13:56', '2021-07-22 19:13:16'),
(67, '\\uploads\\1623688793376.png', 'Milk Shake', 20000, 3, 'Susu kocok adalah minuman dingin dari campuran susu, es krim, dan sirop berperasa yang dikocok hingga berbusa. Selain dikocok dengan blender, susu kocok bisa dibuat dengan memakai gelas pengocok bertutup. Di Britania Raya, susu kocok hanya dibuat dari susu yang dicampur buah atau cokelat.', 10, 'Delivery only on Monday to friday at  1 - 7 pm', '2021-06-14 16:39:53', '2021-07-22 19:13:18'),
(68, '/uploads/1624810090625.png', 'Milk Shake', 20000, 3, 'Susu kocok adalah minuman dingin dari campuran susu, es krim, dan sirop berperasa yang dikocok hingga berbusa. Selain dikocok dengan blender, susu kocok bisa dibuat dengan memakai gelas pengocok bertutup. Di Britania Raya, susu kocok hanya dibuat dari susu yang dicampur buah atau cokelat.', 10, 'Delivery only on Monday to friday at  1 - 7 pm', '2021-06-14 16:46:45', '2021-07-22 19:13:19'),
(69, '\\uploads\\1623689283318.png', 'Milk Shake', 20000, 3, 'Susu kocok adalah minuman dingin dari campuran susu, es krim, dan sirop berperasa yang dikocok hingga berbusa. Selain dikocok dengan blender, susu kocok bisa dibuat dengan memakai gelas pengocok bertutup. Di Britania Raya, susu kocok hanya dibuat dari susu yang dicampur buah atau cokelat.', 10, 'Delivery only on Monday to friday at  1 - 7 pm', '2021-06-14 16:48:03', '2021-07-22 19:13:20'),
(70, '\\uploads\\1623727812753.png', 'Milk Shake', 20000, 3, 'Susu kocok adalah minuman dingin dari campuran susu, es krim, dan sirop berperasa yang dikocok hingga berbusa. Selain dikocok dengan blender, susu kocok bisa dibuat dengan memakai gelas pengocok bertutup. Di Britania Raya, susu kocok hanya dibuat dari susu yang dicampur buah atau cokelat.', 10, 'Delivery only on Monday to friday at  1 - 7 pm', '2021-06-15 03:30:12', '2021-07-22 19:13:22'),
(71, '\\uploads\\1623728029086.png', 'Milk Shake', 20000, 3, 'Susu kocok adalah minuman dingin dari campuran susu, es krim, dan sirop berperasa yang dikocok hingga berbusa. Selain dikocok dengan blender, susu kocok bisa dibuat dengan memakai gelas pengocok bertutup. Di Britania Raya, susu kocok hanya dibuat dari susu yang dicampur buah atau cokelat.', 10, 'Delivery only on Monday to friday at  1 - 7 pm', '2021-06-15 03:33:49', '2021-07-22 19:13:23'),
(72, '\\uploads\\1623728092970.png', 'Milk Shake', 20000, 3, 'Susu kocok adalah minuman dingin dari campuran susu, es krim, dan sirop berperasa yang dikocok hingga berbusa. Selain dikocok dengan blender, susu kocok bisa dibuat dengan memakai gelas pengocok bertutup. Di Britania Raya, susu kocok hanya dibuat dari susu yang dicampur buah atau cokelat.', 10, 'Delivery only on Monday to friday at  1 - 7 pm', '2021-06-15 03:34:52', '2021-07-22 19:13:25'),
(73, '\\uploads\\1623728263150.png', 'Milk Shake', 20000, 3, 'Susu kocok adalah minuman dingin dari campuran susu, es krim, dan sirop berperasa yang dikocok hingga berbusa. Selain dikocok dengan blender, susu kocok bisa dibuat dengan memakai gelas pengocok bertutup. Di Britania Raya, susu kocok hanya dibuat dari susu yang dicampur buah atau cokelat.', 10, 'Delivery only on Monday to friday at  1 - 7 pm', '2021-06-15 03:37:43', '2021-07-22 19:13:27'),
(74, '\\uploads\\1623728419974.png', 'Milk Shake', 20000, 3, 'Susu kocok adalah minuman dingin dari campuran susu, es krim, dan sirop berperasa yang dikocok hingga berbusa. Selain dikocok dengan blender, susu kocok bisa dibuat dengan memakai gelas pengocok bertutup. Di Britania Raya, susu kocok hanya dibuat dari susu yang dicampur buah atau cokelat.', 10, 'Delivery only on Monday to friday at  1 - 7 pm', '2021-06-15 03:40:19', '2021-07-22 19:13:28'),
(75, '\\uploads\\1623736311834.png', 'Milk Shake', 20000, 3, 'Susu kocok adalah minuman dingin dari campuran susu, es krim, dan sirop berperasa yang dikocok hingga berbusa. Selain dikocok dengan blender, susu kocok bisa dibuat dengan memakai gelas pengocok bertutup. Di Britania Raya, susu kocok hanya dibuat dari susu yang dicampur buah atau cokelat.', 10, 'Delivery only on Monday to friday at  1 - 7 pm', '2021-06-15 05:51:51', '2021-07-22 19:13:31'),
(76, '/uploads/1624810309087.png', 'Milk Shake', 20000, 3, 'Susu kocok adalah minuman dingin dari campuran susu, es krim, dan sirop berperasa yang dikocok hingga berbusa. Selain dikocok dengan blender, susu kocok bisa dibuat dengan memakai gelas pengocok bertutup. Di Britania Raya, susu kocok hanya dibuat dari susu yang dicampur buah atau cokelat.', 10, 'Delivery only on Monday to friday at  1 - 7 pm', '2021-06-15 09:34:20', '2021-07-22 19:13:33'),
(77, '/uploads/1623749708898.png', 'Milk Shake', 20000, 3, 'Susu kocok adalah minuman dingin dari campuran susu, es krim, dan sirop berperasa yang dikocok hingga berbusa. Selain dikocok dengan blender, susu kocok bisa dibuat dengan memakai gelas pengocok bertutup. Di Britania Raya, susu kocok hanya dibuat dari susu yang dicampur buah atau cokelat.', 10, 'Delivery only on Monday to friday at  1 - 7 pm', '2021-06-15 09:35:08', '2021-07-22 19:13:35'),
(78, '/uploads/1624810328173.png', 'Milk Shake', 20000, 3, 'Susu kocok adalah minuman dingin dari campuran susu, es krim, dan sirop berperasa yang dikocok hingga berbusa. Selain dikocok dengan blender, susu kocok bisa dibuat dengan memakai gelas pengocok bertutup. Di Britania Raya, susu kocok hanya dibuat dari susu yang dicampur buah atau cokelat.', 10, 'Delivery only on Monday to friday at  1 - 7 pm', '2021-06-15 09:53:39', '2021-07-22 19:13:36'),
(79, '/uploads/1623812838560.png', 'Milk Shake', 20000, 3, 'Susu kocok adalah minuman dingin dari campuran susu, es krim, dan sirop berperasa yang dikocok hingga berbusa. Selain dikocok dengan blender, susu kocok bisa dibuat dengan memakai gelas pengocok bertutup. Di Britania Raya, susu kocok hanya dibuat dari susu yang dicampur buah atau cokelat.', 10, 'Delivery only on Monday to friday at  1 - 7 pm', '2021-06-16 03:07:18', '2021-07-22 19:13:38'),
(80, '/uploads/1624810331324.png', 'Milk Shake', 20000, 3, 'Susu kocok adalah minuman dingin dari campuran susu, es krim, dan sirop berperasa yang dikocok hingga berbusa. Selain dikocok dengan blender, susu kocok bisa dibuat dengan memakai gelas pengocok bertutup. Di Britania Raya, susu kocok hanya dibuat dari susu yang dicampur buah atau cokelat.', 10, 'Delivery only on Monday to friday at  1 - 7 pm', '2021-06-16 03:37:52', '2021-07-22 19:13:40'),
(81, '/uploads/1624810243977.jpg', 'fish and chips', 20000, 4, 'ikan dan chips', 10, 'Delivery only on Monday to friday at  1 - 7 pm', '2021-06-17 17:04:18', '2021-07-22 19:13:42'),
(82, '/uploads/1624198648806.png', 'Cappucino', 20000, 2, 'Susu kocok adalah minuman dingin dari campuran susu, es krim, dan sirop berperasa yang dikocok hingga berbusa. Selain dikocok dengan blender, susu kocok bisa dibuat dengan memakai gelas pengocok bertutup. Di Britania Raya, susu kocok hanya dibuat dari susu yang dicampur buah atau cokelat.', 10, 'Delivery only on Monday to friday at  1 - 7 pm', '2021-06-20 14:17:28', '2021-07-22 19:13:44'),
(83, '/uploads/1624198741359.png', 'Extra Coffee', 20000, 5, 'Susu kocok adalah minuman dingin dari campuran susu, es krim, dan sirop berperasa yang dikocok hingga berbusa. Selain dikocok dengan blender, susu kocok bisa dibuat dengan memakai gelas pengocok bertutup. Di Britania Raya, susu kocok hanya dibuat dari susu yang dicampur buah atau cokelat.', 10, 'Delivery only on Monday to friday at  1 - 7 pm', '2021-06-20 14:19:01', '2021-07-22 19:13:48'),
(84, '/uploads/1629305351198.png', 'Ikan salmon', 20000, 4, 'Susu kocok adalah minuman dingin dari campuran susu, es krim, dan sirop berperasa yang dikocok hingga berbusa. Selain dikocok dengan blender, susu kocok bisa dibuat dengan memakai gelas pengocok bertutup. Di Britania Raya, susu kocok hanya dibuat dari susu yang dicampur buah atau cokelat.', 0, 'Delivery only on Monday to friday at  1 - 7 pm', '2021-06-20 16:47:30', NULL),
(85, '/uploads/1624208822864.png', 'Macroni', 20000, 5, 'Susu kocok adalah minuman dingin dari campuran susu, es krim, dan sirop berperasa yang dikocok hingga berbusa. Selain dikocok dengan blender, susu kocok bisa dibuat dengan memakai gelas pengocok bertutup. Di Britania Raya, susu kocok hanya dibuat dari susu yang dicampur buah atau cokelat.', 10, 'Delivery only on Monday to friday at  1 - 7 pm', '2021-06-20 17:07:02', '2021-07-22 19:13:53');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `id_product`, `id_category`, `created_at`, `updated_at`) VALUES
(1, 4, 1, '2021-06-08 16:01:03', NULL),
(2, 4, 2, '2021-06-08 16:01:03', NULL),
(3, 1, 1, '2021-06-12 05:16:00', NULL),
(4, 1, 2, '2021-06-12 05:16:00', NULL),
(5, 2, 1, '2021-06-12 05:26:05', NULL),
(6, 2, 3, '2021-06-12 05:26:05', NULL),
(7, 3, 2, '2021-06-12 05:26:30', NULL),
(8, 3, 3, '2021-06-12 05:26:30', NULL),
(9, 5, 3, '2021-06-12 05:27:07', NULL),
(10, 6, 3, '2021-06-12 05:27:07', NULL),
(11, 7, 1, '2021-06-12 05:28:38', NULL),
(12, 7, 4, '2021-06-12 05:28:38', NULL),
(13, 8, 4, '2021-06-13 13:19:03', '2021-06-13 14:15:11'),
(14, 9, 4, '2021-06-13 13:19:03', '2021-06-13 14:15:15'),
(17, 10, 1, '2021-06-13 13:19:33', '2021-06-13 14:15:18'),
(18, 10, 4, '2021-06-13 13:19:33', '2021-06-13 14:15:22'),
(19, 11, 2, '2021-06-13 13:20:28', '2021-06-13 14:15:26'),
(20, 12, 5, '2021-06-13 13:20:28', '2021-06-13 14:15:29'),
(115, 63, 1, '2021-06-14 05:38:12', NULL),
(116, 63, 2, '2021-06-14 05:38:12', NULL),
(117, 64, 1, '2021-06-14 05:48:47', NULL),
(118, 64, 4, '2021-06-14 05:48:47', NULL),
(119, 65, 1, '2021-06-14 15:57:38', NULL),
(120, 65, 3, '2021-06-14 15:57:38', NULL),
(121, 66, 1, '2021-06-14 16:13:56', NULL),
(122, 66, 3, '2021-06-14 16:13:56', NULL),
(123, 67, 1, '2021-06-14 16:39:53', NULL),
(124, 67, 3, '2021-06-14 16:39:53', NULL),
(125, 68, 1, '2021-06-14 16:46:45', NULL),
(126, 68, 3, '2021-06-14 16:46:45', NULL),
(127, 69, 1, '2021-06-14 16:48:03', NULL),
(128, 69, 3, '2021-06-14 16:48:03', NULL),
(129, 70, 1, '2021-06-15 03:30:12', NULL),
(130, 70, 3, '2021-06-15 03:30:12', NULL),
(131, 71, 1, '2021-06-15 03:33:49', NULL),
(132, 71, 3, '2021-06-15 03:33:49', NULL),
(133, 72, 1, '2021-06-15 03:34:52', NULL),
(134, 72, 3, '2021-06-15 03:34:52', NULL),
(135, 73, 1, '2021-06-15 03:37:43', NULL),
(136, 73, 3, '2021-06-15 03:37:43', NULL),
(137, 74, 1, '2021-06-15 03:40:19', NULL),
(138, 74, 3, '2021-06-15 03:40:20', NULL),
(139, 75, 1, '2021-06-15 05:51:51', NULL),
(140, 75, 3, '2021-06-15 05:51:51', NULL),
(141, 76, 1, '2021-06-15 09:34:20', NULL),
(142, 76, 3, '2021-06-15 09:34:20', NULL),
(143, 77, 1, '2021-06-15 09:35:08', NULL),
(144, 77, 3, '2021-06-15 09:35:08', NULL),
(145, 78, 1, '2021-06-15 09:53:39', NULL),
(146, 78, 3, '2021-06-15 09:53:39', NULL),
(147, 79, 1, '2021-06-16 03:07:18', NULL),
(148, 79, 3, '2021-06-16 03:07:18', NULL),
(149, 80, 1, '2021-06-16 03:37:52', NULL),
(150, 80, 3, '2021-06-16 03:37:52', NULL),
(151, 81, 1, '2021-06-17 17:04:18', NULL),
(152, 81, 4, '2021-06-17 17:04:18', NULL),
(153, 82, 1, '2021-06-20 14:17:28', NULL),
(154, 82, 3, '2021-06-20 14:17:28', NULL),
(155, 83, 5, '2021-06-20 14:19:01', NULL),
(156, 84, 5, '2021-06-20 16:47:30', NULL),
(157, 85, 1, '2021-06-20 17:07:02', NULL),
(158, 85, 3, '2021-06-20 17:07:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_transactions`
--

CREATE TABLE `product_transactions` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `price` int(11) NOT NULL,
  `variants` varchar(100) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_transaction` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_transactions`
--

INSERT INTO `product_transactions` (`id`, `name`, `price`, `variants`, `amount`, `id_product`, `id_transaction`, `created_at`, `updated_at`) VALUES
(33, 'Cold Brew', 20000, NULL, 10, 1, 31, '2021-06-15 16:19:56', NULL),
(34, 'Teh manis dingin', 10000, NULL, 1, 2, 31, '2021-06-15 16:19:56', NULL),
(35, 'Cold Brew', 20000, NULL, 10, 1, 32, '2021-06-15 16:25:14', NULL),
(36, 'Teh manis dingin', 10000, NULL, 1, 2, 32, '2021-06-15 16:25:14', NULL),
(37, 'Cold Brew', 20000, NULL, 10, 1, 33, '2021-06-15 16:41:09', NULL),
(38, 'Teh manis dingin', 10000, NULL, 1, 2, 33, '2021-06-15 16:41:09', NULL),
(39, 'Mathca Latte', 15000, NULL, 10, 3, 34, '2021-06-16 00:22:56', NULL),
(40, 'Infusion tea', 20000, NULL, 1, 5, 34, '2021-06-16 00:22:56', NULL),
(41, 'Gorengan', 10000, NULL, 3, 12, 34, '2021-06-16 00:22:56', NULL),
(42, 'Mathca Latte', 15000, NULL, 10, 3, 35, '2021-06-16 03:42:07', NULL),
(43, 'Infusion tea', 20000, NULL, 1, 5, 35, '2021-06-16 03:42:07', NULL),
(44, 'Gorengan', 10000, NULL, 3, 12, 35, '2021-06-16 03:42:07', NULL),
(45, 'Mathca Latte', 15000, NULL, 10, 3, 36, '2021-06-23 10:19:39', NULL),
(46, 'Infusion tea', 20000, NULL, 1, 5, 36, '2021-06-23 10:19:39', NULL),
(47, 'Gorengan', 10000, NULL, 3, 12, 36, '2021-06-23 10:19:39', NULL),
(48, 'Kopi Joni', 15000, NULL, 10, 4, 41, '2021-06-24 07:40:51', NULL),
(49, 'Infusion tea', 20000, NULL, 1, 5, 41, '2021-06-24 07:40:51', NULL),
(50, 'Nasi Ayam Goreng', 22000, NULL, 3, 7, 41, '2021-06-24 07:40:51', NULL),
(51, 'Kopi Joni', 15000, NULL, 10, 4, 42, '2021-06-24 08:10:46', NULL),
(52, 'Infusion tea', 20000, NULL, 1, 5, 42, '2021-06-24 08:10:46', NULL),
(53, 'Nasi Ayam Goreng', 22000, NULL, 3, 7, 42, '2021-06-24 08:10:46', NULL),
(169, 'Ikan salmon', 45000, '2', 0, 84, 97, '2021-06-24 14:33:21', NULL),
(170, 'Extra Coffee', 20000, '1', 1, 83, 98, '2021-06-24 14:44:03', NULL),
(171, 'Ikan salmon', 45000, '2', 0, 84, 98, '2021-06-24 14:44:03', NULL),
(172, 'Ikan salmon', 45000, '1', 2, 84, 99, '2021-06-24 14:48:45', NULL),
(173, 'Extra Coffee', 20000, '1', 2, 83, 100, '2021-06-24 15:32:47', NULL),
(174, 'Ikan salmon', 45000, '2', 2, 84, 100, '2021-06-24 15:32:47', NULL),
(175, 'Ikan salmon', 45000, '1', 1, 84, 101, '2021-06-24 15:36:18', NULL),
(176, 'Gorengan', 10000, '2', 1, 12, 102, '2021-06-24 15:40:46', NULL),
(177, 'Ikan salmon', 45000, '1', 1, 84, 102, '2021-06-24 15:40:46', NULL),
(178, 'Teh manis dingin', 10000, '2', 1, 2, 103, '2021-06-24 15:50:13', NULL),
(179, 'Ikan salmon', 45000, '2', 1, 84, 103, '2021-06-24 15:50:13', NULL),
(180, 'Cold Brew', 25000, '3', 5, 1, 104, '2021-06-24 15:51:53', NULL),
(181, 'Cold Brew', 25000, '1', 10, 1, 105, '2021-06-24 17:30:03', NULL),
(182, 'Infusion tea', 20000, '2', 1, 5, 105, '2021-06-24 17:30:03', NULL),
(183, 'Cold Brew', 25000, '1', 10, 1, 106, '2021-06-24 17:37:48', NULL),
(184, 'Infusion tea', 20000, '2', 1, 5, 106, '2021-06-24 17:37:48', NULL),
(185, 'Gorengan', 10000, '1', 2, 12, 107, '2021-06-25 02:28:46', NULL),
(186, 'Ikan salmon', 45000, '2', 2, 84, 107, '2021-06-25 02:28:46', NULL),
(187, 'Ikan salmon', 45000, '2', 1, 84, 108, '2021-06-27 10:00:31', NULL),
(188, 'Cold Brew', 25000, '1', 10, 1, 109, '2021-06-27 10:02:44', NULL),
(189, 'Infusion tea', 20000, '2', 1, 5, 109, '2021-06-27 10:02:44', NULL),
(190, 'Ikan salmon', 45000, '2', 1, 84, 110, '2021-06-27 10:03:09', NULL),
(191, 'Cold Brew', 25000, '1', 1, 1, 111, '2021-06-27 10:05:31', NULL),
(192, 'Cold Brew', 25000, '1', 1, 1, 112, '2021-06-27 10:05:50', NULL),
(193, 'Cold Brew', 25000, '1', 1, 1, 113, '2021-06-27 10:06:14', NULL),
(194, 'Cold Brew', 25000, '3', 1, 1, 114, '2021-06-27 10:06:33', NULL),
(195, 'Cold Brew', 25000, '1', 1, 1, 115, '2021-06-27 16:26:23', NULL),
(196, 'Mathca Latte', 15000, '1', 2, 3, 115, '2021-06-27 16:26:23', NULL),
(197, 'Mathca Latte', 15000, '1', 2, 3, 116, '2021-06-27 20:07:18', NULL),
(198, 'Kopi Joni', 15000, '1', 2, 4, 116, '2021-06-27 20:07:18', NULL),
(199, 'Teh manis dingin', 10000, '2', 1, 2, 117, '2021-06-27 20:12:40', NULL),
(200, 'Kopi Joni', 15000, '1', 2, 4, 118, '2021-06-27 20:15:17', NULL),
(201, 'Kopi Joni', 15000, '1', 2, 4, 119, '2021-06-27 20:17:40', NULL),
(202, 'Nasi Ayam Goreng', 22000, '2', 1, 7, 120, '2021-06-27 20:18:32', NULL),
(203, 'Teh manis dingin', 10000, '1', 1, 2, 121, '2021-06-27 20:22:25', NULL),
(204, 'Kopi Joni', 15000, '2', 2, 4, 122, '2021-06-27 20:29:15', NULL),
(205, 'Nasi Ayam Goreng', 22000, '1', 2, 7, 122, '2021-06-27 20:29:15', NULL),
(206, 'Cold Brew', 25000, '1', 1, 1, 123, '2021-06-27 20:36:11', NULL),
(207, 'Mathca Latte', 15000, '1', 2, 3, 124, '2021-06-27 20:40:04', NULL),
(208, 'Cold Brew', 25000, '1', 1, 1, 125, '2021-06-27 20:40:45', NULL),
(209, 'Kopi Joni', 15000, '1', 1, 4, 126, '2021-06-27 20:44:47', NULL),
(210, 'Mathca Latte', 15000, '1', 1, 3, 127, '2021-06-27 20:46:03', NULL),
(211, 'Kopi Joni', 15000, '1', 1, 4, 127, '2021-06-27 20:46:03', NULL),
(212, 'Cold Brew', 25000, '1', 1, 1, 128, '2021-06-27 20:46:39', NULL),
(213, 'Mathca Latte', 15000, '1', 2, 3, 129, '2021-06-28 03:51:53', NULL),
(214, 'Kopi Joni', 15000, '1', 2, 4, 129, '2021-06-28 03:51:53', NULL),
(215, 'Mathca Latte', 15000, '1', 10, 3, 131, '2021-07-11 13:27:49', NULL),
(216, 'Infusion tea', 20000, '1', 1, 5, 131, '2021-07-11 13:27:49', NULL),
(217, 'Gorengan', 10000, '1', 3, 12, 131, '2021-07-11 13:27:49', NULL),
(218, 'Cold Brew', 25000, '1', 1, 1, 132, '2021-07-12 20:42:05', NULL),
(219, 'Kopi Joni', 15000, '3', 1, 4, 132, '2021-07-12 20:42:05', NULL),
(220, 'Cold Brew', 25000, '1', 1, 1, 133, '2021-07-12 20:45:27', NULL),
(221, 'Kopi Joni', 15000, '3', 1, 4, 133, '2021-07-12 20:45:27', NULL),
(222, 'Cold Brew', 25000, '1', 1, 1, 134, '2021-07-12 20:45:43', NULL),
(223, 'Kopi Joni', 15000, '3', 1, 4, 134, '2021-07-12 20:45:43', NULL),
(224, 'Teh manis dingin', 10000, '1', 1, 2, 135, '2021-07-12 20:48:25', NULL),
(225, 'Nasi Ayam Goreng', 22000, '2', 1, 7, 135, '2021-07-12 20:48:25', NULL),
(226, 'Kopi Joni', 15000, '1', 1, 4, 136, '2021-07-12 20:51:10', NULL),
(227, 'Batagor', 25000, '1', 1, 64, 137, '2021-07-12 20:52:37', NULL),
(228, 'Cold Brew', 25000, '1', 1, 1, 138, '2021-07-12 21:33:28', NULL),
(229, 'Kopi Joni', 15000, '1', 1, 4, 138, '2021-07-12 21:33:28', NULL),
(230, 'Cold Brew', 25000, '1', 2, 1, 139, '2021-07-13 06:57:29', NULL),
(231, 'Kopi Joni', 15000, '2', 4, 4, 139, '2021-07-13 06:57:29', NULL),
(232, 'Teh manis dingin', 10000, '1', 0, 2, 140, '2021-07-13 07:56:55', NULL),
(233, 'Kopi Joni', 15000, '2', 2, 4, 140, '2021-07-13 07:56:55', NULL),
(234, 'Mathca Latte', 15000, '1', 3, 3, 141, '2021-07-13 07:57:32', NULL),
(235, 'Cold Brew', 25000, '1', 2, 1, 142, '2021-07-13 08:04:58', NULL),
(236, 'Kopi Joni', 15000, '2', 3, 4, 142, '2021-07-13 08:04:58', NULL),
(237, 'Teh manis dingin', 10000, '1', 2, 2, 143, '2021-07-13 08:43:39', NULL),
(238, 'Kopi Joni', 15000, '2', 3, 4, 143, '2021-07-13 08:43:39', NULL),
(239, 'Cold Brew', 25000, '1', 3, 1, 144, '2021-07-13 10:29:56', NULL),
(240, 'Kopi Joni', 15000, '3', 3, 4, 144, '2021-07-13 10:29:56', NULL),
(241, 'Kopi Joni', 15000, '1', 2, 4, 145, '2021-07-13 10:31:35', NULL),
(242, 'Kopi Joni', 15000, '1', 1, 4, 146, '2021-07-13 10:32:40', NULL),
(243, 'Kopi Joni', 15000, '1', 0, 4, 147, '2021-07-13 10:34:08', NULL),
(244, 'Kopi Joni', 15000, '1', 0, 4, 148, '2021-07-13 10:35:53', NULL),
(245, 'Kopi Joni', 15000, '1', 0, 4, 149, '2021-07-13 10:48:34', NULL),
(246, 'Kopi Joni', 15000, '1', 0, 4, 150, '2021-07-13 10:50:31', NULL),
(247, 'Cold Brew', 25000, '1', 2, 1, 151, '2021-07-13 11:06:05', NULL),
(248, 'Kopi Joni', 15000, '3', 1, 4, 151, '2021-07-13 11:06:05', NULL),
(249, 'Kopi Joni', 15000, '1', 1, 4, 152, '2021-07-13 11:06:45', NULL),
(250, 'Kopi Joni', 15000, '1', 0, 4, 153, '2021-07-13 11:07:58', NULL),
(251, 'Kopi Joni', 15000, '1', 1, 4, 154, '2021-07-13 11:10:57', NULL),
(252, 'Kopi Joni', 15000, '1', 1, 4, 155, '2021-07-13 11:12:12', NULL),
(253, 'Kopi Joni', 15000, '1', 1, 4, 156, '2021-07-13 11:18:18', NULL),
(254, 'Kopi Joni', 15000, '1', 1, 4, 157, '2021-07-13 11:20:17', NULL),
(255, 'Kopi Joni', 15000, '1', 1, 4, 158, '2021-07-13 11:32:52', NULL),
(256, 'Kopi Joni', 15000, '1', 1, 4, 159, '2021-07-13 11:33:36', NULL),
(257, 'Cold Brew', 25000, '1', 1, 1, 160, '2021-07-13 11:36:26', NULL),
(258, 'Kopi Joni', 15000, '1', 1, 4, 161, '2021-07-13 11:40:56', NULL),
(259, 'Kopi Kopo Baru', 15000, '1', 1, 63, 162, '2021-07-13 12:57:26', NULL),
(260, 'Cold Brew', 25000, '1', 2, 1, 163, '2021-07-13 13:36:43', NULL),
(261, 'Kopi Joni', 15000, '2', 3, 4, 163, '2021-07-13 13:36:43', NULL),
(262, 'Kopi Joni', 15000, '1', 1, 4, 164, '2021-07-13 14:38:36', NULL),
(263, 'Kopi Joni', 15000, '1', 1, 4, 165, '2021-07-13 15:16:10', NULL),
(264, 'Nasi Ayam Goreng', 22000, '2', 1, 7, 166, '2021-07-13 15:18:05', NULL),
(265, 'Nasi Ayam Goreng', 22000, '2', 1, 7, 167, '2021-07-13 15:21:15', NULL),
(266, 'Cold Brew', 25000, '3', 3, 1, 168, '2021-07-13 15:22:07', NULL),
(267, 'Teh manis dingin', 10000, '2', 1, 2, 169, '2021-07-13 15:22:54', NULL),
(268, 'Kopi Joni', 15000, '1', 1, 4, 170, '2021-07-13 15:24:06', NULL),
(269, 'Nasi Goreng', 20000, '3', 1, 10, 171, '2021-07-13 15:24:56', NULL),
(270, 'Cold Brew', 25000, '1', 2, 1, 172, '2021-07-13 15:30:20', NULL),
(271, 'Kopi Joni', 15000, '2', 2, 4, 172, '2021-07-13 15:30:20', NULL),
(272, 'Kopi Joni', 15000, '1', 3, 4, 173, '2021-07-13 15:35:30', NULL),
(273, 'Cold Brew', 25000, '1', 1, 1, 174, '2021-07-14 04:10:41', NULL),
(274, 'Kopi Joni', 15000, '1', 2, 4, 174, '2021-07-14 04:10:41', NULL),
(275, 'Cold Brew', 25000, '1', 2, 1, 175, '2021-07-14 04:35:12', NULL),
(276, 'Kopi Joni', 15000, '1', 3, 4, 175, '2021-07-14 04:35:12', NULL),
(277, 'Nasi Ayam Goreng', 22000, '2', 1, 7, 176, '2021-07-14 17:01:36', NULL),
(278, 'Cold Brew', 25000, '1', 1, 1, 177, '2021-07-22 06:15:57', NULL),
(279, 'Kopi Joni', 15000, '1', 1, 4, 178, '2021-07-22 06:17:04', NULL),
(280, 'Cold Brew', 25000, '2', 2, 1, 179, '2021-07-25 19:43:24', NULL),
(281, 'Nasi Goreng', 20000, '2', 3, 10, 180, '2021-07-26 06:12:08', NULL),
(282, 'Gorengan', 10000, '3', 1, 12, 180, '2021-07-26 06:12:08', NULL),
(283, 'Kopi Joni', 15000, '1', 2, 4, 181, '2021-07-26 21:10:58', NULL),
(284, 'Cold Brew', 25000, '2', 1, 1, 182, '2021-07-26 21:46:07', NULL),
(285, 'Mathca Latte', 15000, '1', 1, 3, 182, '2021-07-26 21:46:07', NULL),
(286, 'Mathca Latte', 15000, '1', 1, 3, 183, '2021-07-26 21:47:37', NULL),
(287, 'Teh manis dingin', 10000, '1', 1, 2, 184, '2021-07-26 21:48:09', NULL),
(288, 'Cold Brew', 25000, '2', 1, 1, 185, '2021-07-26 21:49:52', NULL),
(289, 'Teh manis dingin', 10000, '1', 1, 2, 186, '2021-07-26 21:50:53', NULL),
(290, 'Teh manis dingin', 10000, '1', 1, 2, 187, '2021-07-26 21:52:21', NULL),
(291, 'Cold Brew', 25000, '2', 1, 1, 188, '2021-07-26 21:53:08', NULL),
(292, 'Cold Brew', 25000, '2', 1, 1, 189, '2021-07-26 21:55:16', NULL),
(293, 'Cold Brew', 25000, '3', 1, 1, 190, '2021-07-26 21:56:06', NULL),
(294, 'Cold Brew', 25000, '2', 1, 1, 191, '2021-07-26 21:57:42', NULL),
(295, 'Cold Brew', 25000, '2', 1, 1, 192, '2021-07-26 21:59:22', NULL),
(296, 'Cold Brew', 25000, '2', 1, 1, 193, '2021-07-26 22:00:38', NULL),
(297, 'Infusion tea', 20000, '2', 1, 5, 194, '2021-07-26 22:02:13', NULL),
(298, 'Teh manis dingin', 10000, '1', 1, 2, 195, '2021-07-26 22:05:30', NULL),
(299, 'Cold Brew', 25000, '2', 1, 1, 196, '2021-07-26 22:08:21', NULL),
(300, 'Cold Brew', 25000, '2', 1, 1, 197, '2021-07-26 22:08:37', NULL),
(301, 'Mathca Latte', 15000, '1', 1, 3, 198, '2021-07-26 22:08:47', NULL),
(302, 'Cold Brew', 25000, '2', 1, 1, 199, '2021-07-26 22:45:30', NULL),
(303, 'Teh manis dingin', 10000, '2', 1, 2, 199, '2021-07-26 22:45:30', NULL),
(304, 'Teh manis dingin', 10000, '1', 1, 2, 200, '2021-07-26 22:47:49', NULL),
(305, 'Cold Brew', 25000, '3', 1, 1, 201, '2021-07-26 22:50:30', NULL),
(306, 'Cold Brew', 25000, '2', 1, 1, 202, '2021-07-26 22:51:21', NULL),
(307, 'Cold Brew', 25000, '3', 1, 1, 203, '2021-07-26 22:53:33', NULL),
(308, 'Teh manis dingin', 10000, '1', 1, 2, 204, '2021-07-27 02:43:49', NULL),
(309, 'Kopi Joni', 15000, '2', 1, 4, 204, '2021-07-27 02:43:49', NULL),
(310, 'Teh manis dingin', 10000, '1', 2, 2, 205, '2021-07-27 04:18:45', NULL),
(311, 'Kopi Joni', 15000, '2', 2, 4, 205, '2021-07-27 04:18:45', NULL),
(312, 'Nasi Ayam Goreng', 22000, '2', 2, 7, 206, '2021-07-27 04:19:41', NULL),
(313, 'Batagor', 25000, '1', 2, 64, 206, '2021-07-27 04:19:41', NULL),
(314, 'Cold Brew', 25000, '1', 2, 1, 207, '2021-07-27 19:22:52', NULL),
(315, 'Cold Brew', 25000, '1', 2, 1, 208, '2021-07-27 19:26:39', NULL),
(316, 'Cold Brew', 25000, '1', 2, 1, 209, '2021-07-27 19:55:02', NULL),
(317, 'Gorengan', 10000, '2', 2, 12, 210, '2021-07-27 19:59:26', NULL),
(318, 'Kopi Joni', 15000, '1', 2, 4, 211, '2021-07-28 03:38:42', NULL),
(319, 'Nasi Ayam Goreng', 22000, '2', 2, 7, 212, '2021-07-28 03:40:00', NULL),
(320, 'Kopi Joni', 15000, '1', 1, 4, 213, '2021-07-29 06:42:06', NULL),
(321, 'Kopi Joni', 15000, '1', 2, 4, 214, '2021-07-29 20:34:01', NULL),
(322, 'Kopi Joni', 15000, '1', 3, 4, 215, '2021-07-29 20:34:46', NULL),
(323, 'Kopi Joni', 15000, '1', 1, 4, 216, '2021-07-30 11:35:24', NULL),
(324, 'Kopi Joni', 15000, '1', 3, 4, 217, '2021-07-30 11:40:31', NULL),
(325, 'Cold Brew', 25000, '1', 1, 1, 218, '2021-07-30 12:11:20', NULL),
(326, 'Kopi Joni', 15000, '2', 1, 4, 218, '2021-07-30 12:11:20', NULL),
(327, 'Cold Brew', 25000, '1', 1, 1, 219, '2021-07-30 12:51:42', NULL),
(328, 'Kopi Joni', 15000, '1', 1, 4, 219, '2021-07-30 12:51:42', NULL),
(329, 'Cold Brew', 25000, '1', 1, 1, 220, '2021-07-30 13:20:59', NULL),
(330, 'Kopi Joni', 15000, '2', 1, 4, 220, '2021-07-30 13:20:59', NULL),
(331, 'Cold Brew', 25000, '1', 1, 1, 221, '2021-07-30 13:21:31', NULL),
(332, 'Kopi Joni', 15000, '1', 1, 4, 221, '2021-07-30 13:21:31', NULL),
(333, 'Teh manis dingin', 10000, '1', 1, 2, 222, '2021-07-30 13:22:03', NULL),
(334, 'Nasi Ayam Goreng', 22000, '2', 1, 7, 222, '2021-07-30 13:22:03', NULL),
(335, 'Teh manis dingin', 10000, '1', 1, 2, 223, '2021-07-30 13:24:35', NULL),
(336, 'Kopi Joni', 15000, '1', 1, 4, 223, '2021-07-30 13:24:35', NULL),
(337, 'Kopi Joni', 15000, '1', 1, 4, 224, '2021-08-01 12:40:39', NULL),
(338, 'Kopi Joni', 15000, '1', 1, 4, 225, '2021-08-01 12:47:34', NULL),
(339, 'Kopi Joni', 15000, '1', 1, 4, 226, '2021-08-02 10:55:24', NULL),
(340, 'Kopi Joni', 15000, '1', 1, 4, 227, '2021-08-02 10:57:27', NULL),
(341, 'Kopi Joni', 15000, '1', 1, 4, 228, '2021-08-02 11:00:17', NULL),
(342, 'Kopi Joni', 15000, '1', 1, 4, 229, '2021-08-02 11:03:16', NULL),
(343, 'Kopi Joni', 15000, '1', 1, 4, 230, '2021-08-02 11:04:40', NULL),
(344, 'Kopi Joni', 15000, '1', 1, 4, 231, '2021-08-02 11:10:05', NULL),
(345, 'Kopi Joni', 15000, '1', 1, 4, 232, '2021-08-02 11:16:04', NULL),
(346, 'Kopi Joni', 15000, '1', 1, 4, 233, '2021-08-02 11:19:32', NULL),
(347, 'Kopi Joni', 15000, '1', 1, 4, 234, '2021-08-02 11:25:21', NULL),
(348, 'Kopi Joni', 15000, '1', 1, 4, 235, '2021-08-02 11:26:33', NULL),
(349, 'Kopi Joni', 15000, '1', 1, 4, 236, '2021-08-02 11:26:54', NULL),
(350, 'Cold Brew', 25000, '1', 1, 1, 237, '2021-08-02 11:27:07', NULL),
(351, 'Cold Brew', 25000, '2', 1, 1, 238, '2021-08-02 11:38:30', NULL),
(352, 'Cold Brew', 25000, '1', 1, 1, 239, '2021-08-02 15:22:50', NULL),
(353, 'Kopi Joni', 15000, '1', 1, 4, 239, '2021-08-02 15:22:50', NULL),
(354, 'Kopi Joni', 15000, '1', 1, 4, 240, '2021-08-02 15:35:06', NULL),
(355, 'Kopi Joni', 15000, '1', 3, 4, 241, '2021-08-03 14:15:38', NULL),
(356, 'Cold Brew', 25000, '1', 2, 1, 242, '2021-08-03 14:23:09', NULL),
(357, 'Kopi Joni', 15000, '1', 1, 4, 242, '2021-08-03 14:23:09', NULL),
(358, 'Cold Brew', 25000, '1', 2, 1, 243, '2021-08-04 02:56:35', NULL),
(359, 'Kopi Joni', 15000, '1', 3, 4, 243, '2021-08-04 02:56:35', NULL),
(360, 'Mathca Latte', 15000, '1', 10, 3, 245, '2021-09-02 17:33:05', NULL),
(361, 'Mathca Latte', 15000, '1', 10, 3, 246, '2021-09-02 17:33:33', NULL),
(362, 'Mathca Latte', 15000, '1', 10, 3, 247, '2021-09-02 17:34:34', NULL),
(363, 'Mathca Latte', 15000, '1', 10, 3, 248, '2021-09-02 17:38:14', NULL),
(364, 'Mathca Latte', 15000, '1', 10, 3, 249, '2021-09-02 17:40:46', NULL),
(365, 'Infusion tea', 20000, '2', 1, 5, 249, '2021-09-02 17:40:46', NULL),
(366, 'Gorengan', 10000, '1', 3, 12, 249, '2021-09-02 17:40:46', NULL),
(367, 'Mathca Latte', 15000, '1', 10, 3, 256, '2021-09-02 17:59:10', NULL),
(368, 'Infusion tea', 20000, '2', 1, 5, 256, '2021-09-02 17:59:10', NULL),
(369, 'Gorengan', 10000, '1', 3, 12, 256, '2021-09-02 17:59:10', NULL),
(370, 'Mathca Latte', 15000, '1', 10, 3, 257, '2021-09-02 17:59:36', NULL),
(371, 'Infusion tea', 20000, '2', 1, 5, 257, '2021-09-02 17:59:36', NULL),
(372, 'Gorengan', 10000, '1', 3, 12, 257, '2021-09-02 17:59:36', NULL),
(373, 'Mathca Latte', 15000, '1', 10, 3, 258, '2021-09-02 18:00:01', NULL),
(374, 'Infusion tea', 20000, '2', 1, 5, 258, '2021-09-02 18:00:01', NULL),
(375, 'Gorengan', 10000, '1', 3, 12, 258, '2021-09-02 18:00:01', NULL),
(376, 'Mathca Latte', 15000, '1', 10, 3, 259, '2021-09-02 18:11:16', NULL),
(377, 'Infusion tea', 20000, '2', 1, 5, 259, '2021-09-02 18:11:16', NULL),
(378, 'Gorengan', 10000, '1', 3, 12, 259, '2021-09-02 18:11:16', NULL),
(379, 'Mathca Latte', 15000, '1', 5, 3, 260, '2021-09-02 18:21:31', NULL),
(380, 'Gorengan', 10000, '1', 2, 12, 260, '2021-09-02 18:21:31', NULL),
(381, 'Mathca Latte', 15000, '1', 5, 3, 261, '2021-09-02 18:22:13', NULL),
(382, 'Gorengan', 10000, '1', 2, 12, 261, '2021-09-02 18:22:13', NULL),
(383, 'Mathca Latte', 15000, '1', 5, 3, 262, '2021-09-02 18:22:48', NULL),
(384, 'Gorengan', 10000, '1', 2, 12, 262, '2021-09-02 18:22:48', NULL),
(385, 'Mathca Latte', 15000, '1', 5, 3, 263, '2021-09-02 18:25:29', NULL),
(386, 'Gorengan', 10000, '1', 2, 12, 263, '2021-09-02 18:25:29', NULL),
(387, 'Mathca Latte', 15000, '1', 5, 3, 264, '2021-09-02 18:26:58', NULL),
(388, 'Gorengan', 10000, '1', 2, 12, 264, '2021-09-02 18:26:58', NULL),
(389, 'Mathca Latte', 15000, '1', 5, 3, 265, '2021-09-03 03:15:18', NULL),
(390, 'Gorengan', 10000, '1', 2, 12, 265, '2021-09-03 03:15:18', NULL),
(391, 'Mathca Latte', 15000, '1', 5, 3, 266, '2021-09-03 03:15:42', NULL),
(392, 'Gorengan', 10000, '1', 2, 12, 266, '2021-09-03 03:15:42', NULL),
(393, 'Mathca Latte', 15000, '1', 5, 3, 267, '2021-09-03 03:15:59', NULL),
(394, 'Gorengan', 10000, '1', 2, 12, 267, '2021-09-03 03:15:59', NULL),
(395, 'Mathca Latte', 15000, '1', 5, 3, 268, '2021-09-03 03:16:13', NULL),
(396, 'Gorengan', 10000, '1', 2, 12, 268, '2021-09-03 03:16:13', NULL),
(397, 'Mathca Latte', 15000, '1', 5, 3, 269, '2021-09-03 03:16:45', NULL),
(398, 'Gorengan', 10000, '1', 2, 12, 269, '2021-09-03 03:16:45', NULL),
(399, 'Mathca Latte', 15000, '1', 5, 3, 270, '2021-09-03 03:17:03', NULL),
(400, 'Gorengan', 10000, '1', 2, 12, 270, '2021-09-03 03:17:03', NULL),
(401, 'Mathca Latte', 15000, '1', 5, 3, 271, '2021-09-03 03:24:58', NULL),
(402, 'Gorengan', 10000, '1', 2, 12, 271, '2021-09-03 03:24:58', NULL),
(403, 'Mathca Latte', 15000, '1', 5, 3, 272, '2021-09-03 03:30:27', NULL),
(404, 'Gorengan', 10000, '1', 2, 12, 272, '2021-09-03 03:30:27', NULL),
(405, 'Mathca Latte', 15000, '1', 5, 3, 273, '2021-09-03 03:31:51', NULL),
(406, 'Gorengan', 10000, '1', 2, 12, 273, '2021-09-03 03:31:51', NULL),
(407, 'Mathca Latte', 15000, '1', 5, 3, 274, '2021-09-03 03:33:23', NULL),
(408, 'Gorengan', 10000, '1', 2, 12, 274, '2021-09-03 03:33:23', NULL),
(409, 'Mathca Latte', 15000, '1', 5, 3, 275, '2021-09-03 03:38:24', NULL),
(410, 'Gorengan', 10000, '1', 2, 12, 275, '2021-09-03 03:38:24', NULL),
(411, 'Mathca Latte', 15000, '1', 5, 3, 276, '2021-09-03 03:39:03', NULL),
(412, 'Gorengan', 10000, '1', 2, 12, 276, '2021-09-03 03:39:03', NULL),
(413, 'Mathca Latte', 15000, '1', 5, 3, 277, '2021-09-03 03:46:21', NULL),
(414, 'Gorengan', 10000, '1', 2, 12, 277, '2021-09-03 03:46:21', NULL),
(415, 'Mathca Latte', 15000, '1', 5, 3, 278, '2021-09-03 03:46:42', NULL),
(416, 'Gorengan', 10000, '1', 2, 12, 278, '2021-09-03 03:46:42', NULL),
(417, 'Mathca Latte', 15000, '1', 5, 3, 279, '2021-09-03 03:48:24', NULL),
(418, 'Gorengan', 10000, '1', 2, 12, 279, '2021-09-03 03:48:24', NULL),
(419, 'Mathca Latte', 15000, '1', 5, 3, 280, '2021-09-03 03:48:50', NULL),
(420, 'Gorengan', 10000, '1', 2, 12, 280, '2021-09-03 03:48:50', NULL),
(421, 'Mathca Latte', 15000, '1', 5, 3, 281, '2021-09-03 03:49:12', NULL),
(422, 'Gorengan', 10000, '1', 2, 12, 281, '2021-09-03 03:49:12', NULL),
(423, 'Mathca Latte', 15000, '1', 5, 3, 282, '2021-09-03 03:56:57', NULL),
(424, 'Gorengan', 10000, '1', 2, 12, 282, '2021-09-03 03:56:57', NULL),
(425, 'Mathca Latte', 15000, '1', 5, 3, 283, '2021-09-03 03:57:26', NULL),
(426, 'Gorengan', 10000, '1', 2, 12, 283, '2021-09-03 03:57:26', NULL),
(427, 'Mathca Latte', 15000, '1', 5, 3, 284, '2021-09-03 03:59:53', NULL),
(428, 'Gorengan', 10000, '1', 2, 12, 284, '2021-09-03 03:59:53', NULL),
(429, 'Mathca Latte', 15000, '1', 5, 3, 285, '2021-09-03 04:00:39', NULL),
(430, 'Gorengan', 10000, '1', 2, 12, 285, '2021-09-03 04:00:39', NULL),
(431, 'Mathca Latte', 15000, '1', 5, 3, 286, '2021-09-03 04:00:53', NULL),
(432, 'Gorengan', 10000, '1', 2, 12, 286, '2021-09-03 04:00:53', NULL),
(433, 'Mathca Latte', 15000, '1', 5, 3, 287, '2021-09-03 04:02:33', NULL),
(434, 'Gorengan', 10000, '1', 2, 12, 287, '2021-09-03 04:02:33', NULL),
(435, 'Mathca Latte', 15000, '1', 5, 3, 288, '2021-09-06 02:38:08', NULL),
(436, 'Gorengan', 10000, '1', 2, 12, 288, '2021-09-06 02:38:08', NULL),
(437, 'Cold Brew', 25000, '1', 2, 1, 289, '2021-09-06 04:20:05', NULL),
(438, 'Mathca Latte', 15000, '1', 5, 3, 290, '2021-09-06 04:21:55', NULL),
(439, 'Gorengan', 10000, '1', 2, 12, 290, '2021-09-06 04:21:55', NULL),
(440, 'Mathca Latte', 15000, '1', 5, 3, 291, '2021-09-06 04:27:19', NULL),
(441, 'Gorengan', 10000, '1', 2, 12, 291, '2021-09-06 04:27:19', NULL),
(442, 'Mathca Latte', 15000, '1', 5, 3, 292, '2021-09-06 04:28:24', NULL),
(443, 'Gorengan', 10000, '1', 2, 12, 292, '2021-09-06 04:28:24', NULL),
(444, 'Mathca Latte', 15000, '1', 5, 3, 293, '2021-09-06 04:46:50', NULL),
(445, 'Gorengan', 10000, '1', 2, 12, 293, '2021-09-06 04:46:50', NULL),
(446, 'Mathca Latte', 15000, '1', 5, 3, 294, '2021-09-06 04:47:12', NULL),
(447, 'Gorengan', 10000, '1', 2, 12, 294, '2021-09-06 04:47:12', NULL),
(448, 'Mathca Latte', 15000, '1', 5, 3, 295, '2021-09-06 04:48:30', NULL),
(449, 'Gorengan', 10000, '1', 2, 12, 295, '2021-09-06 04:48:30', NULL),
(450, 'Mathca Latte', 15000, '1', 5, 3, 296, '2021-09-06 04:48:43', NULL),
(451, 'Gorengan', 10000, '1', 2, 12, 296, '2021-09-06 04:48:43', NULL),
(452, 'Mathca Latte', 15000, '1', 5, 3, 297, '2021-09-06 04:49:07', NULL),
(453, 'Gorengan', 10000, '1', 2, 12, 297, '2021-09-06 04:49:07', NULL),
(454, 'Mathca Latte', 15000, '1', 5, 3, 298, '2021-09-06 04:58:05', NULL),
(455, 'Gorengan', 10000, '1', 2, 12, 298, '2021-09-06 04:58:05', NULL),
(456, 'Mathca Latte', 15000, '1', 5, 3, 299, '2021-09-06 04:58:41', NULL),
(457, 'Gorengan', 10000, '1', 2, 12, 299, '2021-09-06 04:58:41', NULL),
(458, 'Mathca Latte', 15000, '1', 5, 3, 300, '2021-09-06 04:59:43', NULL),
(459, 'Gorengan', 10000, '1', 2, 12, 300, '2021-09-06 04:59:43', NULL),
(460, 'Mathca Latte', 15000, '1', 5, 3, 301, '2021-09-06 05:00:17', NULL),
(461, 'Gorengan', 10000, '1', 2, 12, 301, '2021-09-06 05:00:17', NULL),
(462, 'Mathca Latte', 15000, '1', 5, 3, 302, '2021-09-06 05:00:31', NULL),
(463, 'Gorengan', 10000, '1', 2, 12, 302, '2021-09-06 05:00:31', NULL),
(464, 'Mathca Latte', 15000, '1', 5, 3, 303, '2021-09-06 05:00:49', NULL),
(465, 'Gorengan', 10000, '1', 2, 12, 303, '2021-09-06 05:00:49', NULL),
(466, 'Mathca Latte', 15000, '1', 5, 3, 304, '2021-09-06 05:01:17', NULL),
(467, 'Gorengan', 10000, '1', 2, 12, 304, '2021-09-06 05:01:17', NULL),
(468, 'Mathca Latte', 15000, '1', 5, 3, 305, '2021-09-06 05:01:23', NULL),
(469, 'Gorengan', 10000, '1', 2, 12, 305, '2021-09-06 05:01:23', NULL),
(470, 'Mathca Latte', 15000, '1', 5, 3, 306, '2021-09-06 05:26:18', NULL),
(471, 'Gorengan', 10000, '1', 2, 12, 306, '2021-09-06 05:26:18', NULL),
(472, 'Mathca Latte', 15000, '1', 5, 3, 307, '2021-09-06 05:26:55', NULL),
(473, 'Gorengan', 10000, '1', 2, 12, 307, '2021-09-06 05:26:55', NULL),
(474, 'Mathca Latte', 15000, '1', 5, 3, 308, '2021-09-06 05:27:07', NULL),
(475, 'Gorengan', 10000, '1', 2, 12, 308, '2021-09-06 05:27:07', NULL),
(476, 'Mathca Latte', 15000, '1', 5, 3, 309, '2021-09-06 05:27:44', NULL),
(477, 'Gorengan', 10000, '1', 2, 12, 309, '2021-09-06 05:27:44', NULL),
(478, 'Mathca Latte', 15000, '1', 5, 3, 310, '2021-09-06 05:27:51', NULL),
(479, 'Gorengan', 10000, '1', 2, 12, 310, '2021-09-06 05:27:51', NULL),
(480, 'Mathca Latte', 15000, '1', 5, 3, 311, '2021-09-06 05:27:59', NULL),
(481, 'Gorengan', 10000, '1', 2, 12, 311, '2021-09-06 05:27:59', NULL),
(482, 'Mathca Latte', 15000, '1', 5, 3, 312, '2021-09-06 05:30:54', NULL),
(483, 'Gorengan', 10000, '1', 2, 12, 312, '2021-09-06 05:30:54', NULL),
(484, 'Mathca Latte', 15000, '1', 5, 3, 313, '2021-09-06 05:31:05', NULL),
(485, 'Gorengan', 10000, '1', 2, 12, 313, '2021-09-06 05:31:05', NULL),
(486, 'Mathca Latte', 15000, '1', 5, 3, 314, '2021-09-06 05:31:13', NULL),
(487, 'Gorengan', 10000, '1', 2, 12, 314, '2021-09-06 05:31:13', NULL),
(488, 'Mathca Latte', 15000, '1', 5, 3, 315, '2021-09-06 05:32:54', NULL),
(489, 'Gorengan', 10000, '1', 2, 12, 315, '2021-09-06 05:32:54', NULL),
(490, 'Mathca Latte', 15000, '1', 5, 3, 316, '2021-09-06 05:34:42', NULL),
(491, 'Gorengan', 10000, '1', 2, 12, 316, '2021-09-06 05:34:42', NULL),
(492, 'Mathca Latte', 15000, '1', 5, 3, 317, '2021-09-06 05:34:58', NULL),
(493, 'Gorengan', 10000, '1', 2, 12, 317, '2021-09-06 05:34:58', NULL),
(494, 'Mathca Latte', 15000, '1', 5, 3, 318, '2021-09-06 05:35:32', NULL),
(495, 'Gorengan', 10000, '1', 2, 12, 318, '2021-09-06 05:35:32', NULL),
(496, 'Mathca Latte', 15000, '1', 5, 3, 319, '2021-09-06 05:36:57', NULL),
(497, 'Gorengan', 10000, '1', 2, 12, 319, '2021-09-06 05:36:57', NULL),
(498, 'Mathca Latte', 15000, '1', 5, 3, 320, '2021-09-06 05:37:54', NULL),
(499, 'Gorengan', 10000, '1', 2, 12, 320, '2021-09-06 05:37:54', NULL),
(500, 'Mathca Latte', 15000, '1', 5, 3, 321, '2021-09-06 06:04:22', NULL),
(501, 'Gorengan', 10000, '1', 2, 12, 321, '2021-09-06 06:04:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` int(11) NOT NULL,
  `additional_price` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_variant` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`id`, `additional_price`, `id_product`, `id_variant`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 1, '2021-06-08 16:36:21', NULL),
(2, 3000, 1, 2, '2021-06-08 16:36:48', NULL),
(3, 5000, 1, 3, '2021-06-08 16:37:01', NULL),
(4, 0, 2, 1, '2021-06-08 18:28:47', NULL),
(5, 2000, 2, 2, '2021-06-08 18:28:47', NULL),
(6, 0, 3, 1, '2021-06-08 18:58:10', '2021-07-13 13:25:41'),
(7, 0, 4, 1, '2021-06-08 18:58:10', '2021-07-13 11:40:30'),
(8, 3000, 5, 2, '2021-06-08 19:10:10', NULL),
(9, 2000, 6, 2, '2021-06-08 19:10:10', NULL),
(10, 0, 7, 2, '2021-06-08 19:17:19', '2021-07-13 15:21:45'),
(11, 5000, 8, 2, '2021-06-08 19:17:19', NULL),
(12, 6000, 9, 3, '2021-06-08 19:19:59', NULL),
(13, 8000, 10, 3, '2021-06-08 19:19:59', NULL),
(14, 0, 11, 1, '2021-06-08 19:23:31', NULL),
(15, 5000, 12, 2, '2021-06-08 19:23:31', NULL),
(96, 0, 63, 1, '2021-06-14 05:38:12', '2021-07-13 13:25:55'),
(97, 1000, 63, 3, '2021-06-14 05:38:12', NULL),
(98, 0, 64, 1, '2021-06-14 05:48:47', '2021-07-13 13:26:02'),
(99, 2000, 64, 2, '2021-06-14 05:48:47', NULL),
(100, 0, 65, 1, '2021-06-14 15:57:38', NULL),
(101, 3000, 65, 2, '2021-06-14 15:57:38', NULL),
(102, 0, 66, 1, '2021-06-14 16:13:56', NULL),
(103, 3000, 66, 2, '2021-06-14 16:13:56', NULL),
(104, 0, 67, 1, '2021-06-14 16:39:53', NULL),
(105, 3000, 67, 2, '2021-06-14 16:39:53', NULL),
(106, 0, 68, 1, '2021-06-14 16:46:45', NULL),
(107, 3000, 68, 2, '2021-06-14 16:46:45', NULL),
(108, 0, 69, 1, '2021-06-14 16:48:03', NULL),
(109, 3000, 69, 2, '2021-06-14 16:48:03', NULL),
(110, 0, 70, 1, '2021-06-15 03:30:12', NULL),
(111, 3000, 70, 2, '2021-06-15 03:30:12', NULL),
(112, 0, 71, 1, '2021-06-15 03:33:49', NULL),
(113, 3000, 71, 2, '2021-06-15 03:33:49', NULL),
(114, 0, 72, 1, '2021-06-15 03:34:52', NULL),
(115, 3000, 72, 2, '2021-06-15 03:34:52', NULL),
(116, 0, 73, 1, '2021-06-15 03:37:43', NULL),
(117, 3000, 73, 2, '2021-06-15 03:37:43', NULL),
(118, 0, 74, 1, '2021-06-15 03:40:20', NULL),
(119, 3000, 74, 2, '2021-06-15 03:40:20', NULL),
(120, 0, 75, 1, '2021-06-15 05:51:51', NULL),
(121, 3000, 75, 2, '2021-06-15 05:51:51', NULL),
(122, 0, 76, 1, '2021-06-15 09:34:20', NULL),
(123, 3000, 76, 2, '2021-06-15 09:34:20', NULL),
(124, 0, 77, 1, '2021-06-15 09:35:08', NULL),
(125, 3000, 77, 2, '2021-06-15 09:35:08', NULL),
(126, 0, 78, 1, '2021-06-15 09:53:39', NULL),
(127, 3000, 78, 2, '2021-06-15 09:53:39', NULL),
(128, 0, 79, 1, '2021-06-16 03:07:18', NULL),
(129, 3000, 79, 2, '2021-06-16 03:07:18', NULL),
(130, 0, 80, 1, '2021-06-16 03:37:52', NULL),
(131, 3000, 80, 2, '2021-06-16 03:37:52', NULL),
(132, 0, 81, 1, '2021-06-17 17:04:18', NULL),
(133, 5000, 81, 2, '2021-06-17 17:04:18', NULL),
(134, 0, 82, 1, '2021-06-20 14:17:28', NULL),
(135, 3000, 82, 2, '2021-06-20 14:17:28', NULL),
(136, 0, 83, 1, '2021-06-20 14:19:01', NULL),
(137, 3000, 83, 2, '2021-06-20 14:19:01', NULL),
(138, 0, 84, 1, '2021-06-20 16:47:30', NULL),
(139, 3000, 84, 2, '2021-06-20 16:47:30', NULL),
(140, 0, 85, 1, '2021-06-20 17:07:02', NULL),
(141, 3000, 85, 2, '2021-06-20 17:07:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `code` varchar(80) NOT NULL,
  `total` int(10) NOT NULL,
  `tax` int(10) NOT NULL,
  `shipping_cost` int(11) DEFAULT NULL,
  `shipping_address` text DEFAULT NULL,
  `payment_method` varchar(100) NOT NULL,
  `id_user` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `code`, `total`, `tax`, `shipping_cost`, `shipping_address`, `payment_method`, `id_user`, `created_at`, `updated_at`) VALUES
(31, 'CS/1562021/1', 210000, 21000, 10000, 'Bandung Kopo', 'Bank', 3, '2021-06-15 16:19:56', NULL),
(32, 'CS/1562021/1', 210000, 21000, 10000, 'Bandung Kopo', 'Bank', 3, '2021-06-15 16:25:14', NULL),
(33, 'CS/1562021/1', 210000, 21000, 10000, 'Bandung Kopo', 'Bank', 3, '2021-06-15 16:41:09', NULL),
(34, 'CS/1662021/1', 200000, 20000, 10000, 'jakarta', 'Bank', 13, '2021-06-16 00:22:56', NULL),
(35, 'CS/1662021/1', 200000, 20000, 10000, 'Bandung Kopo', 'Bank', 20, '2021-06-16 03:42:07', NULL),
(36, 'CS/2362021/1', 200000, 20000, 10000, 'Bandung Kopo', 'Bank', 3, '2021-06-23 10:19:39', NULL),
(41, 'CS/2462021/1', 236000, 23600, 10000, 'Bandung Kopo', 'Bank', 3, '2021-06-24 07:40:51', NULL),
(42, 'CS/2462021/1', 236000, 23600, 10000, 'Bandung Kopo', 'Bank', 3, '2021-06-24 08:10:46', NULL),
(99, 'CS/2462021/1', 90000, 9000, 10000, 'Bandung Kopo', 'Bank', 3, '2021-06-24 14:48:45', NULL),
(100, 'CS/2462021/1', 130000, 13000, 10000, 'Bandung Kopo', 'Bank', 3, '2021-06-24 15:32:47', NULL),
(101, 'CS/2462021/1', 45000, 4500, 10000, 'Bandung Kopo', 'Bank', 3, '2021-06-24 15:36:18', NULL),
(102, 'CS/2462021/1', 55000, 5500, 10000, 'Bandung Kopo', 'Bank', 3, '2021-06-24 15:40:46', NULL),
(103, 'CS/2462021/1', 55000, 5500, 10000, 'Bandung Kopo', 'Bank', 3, '2021-06-24 15:50:13', NULL),
(104, 'CS/2462021/1', 125000, 12500, 10000, 'Bandung Kopo', 'Bank', 3, '2021-06-24 15:51:53', NULL),
(105, 'CS/2562021/1', 270000, 27000, 10000, 'Bandung Kopo', 'Bank', 3, '2021-06-24 17:30:03', NULL),
(106, 'CS/2562021/1', 270000, 27000, 10000, 'Bandung Kopo', 'Bank', 3, '2021-06-24 17:37:48', NULL),
(107, 'CS/2562021/1', 110000, 11000, 10000, 'Bandung Kopo', 'Bank', 40, '2021-06-25 02:28:46', NULL),
(108, 'CS/2762021/1', 45000, 4500, 10000, 'Bandung Kopo', 'Bank', 48, '2021-06-27 10:00:31', NULL),
(109, 'CS/2762021/1', 270000, 27000, 10000, 'Bandung Kopo', 'Bank', 48, '2021-06-27 10:02:44', NULL),
(110, 'CS/2762021/1', 45000, 4500, 10000, 'Bandung Kopo', 'Bank', 48, '2021-06-27 10:03:09', NULL),
(111, 'CS/2762021/1', 25000, 2500, 10000, 'Bandung Kopo', 'Bank', 48, '2021-06-27 10:05:31', NULL),
(112, 'CS/2762021/1', 25000, 2500, 10000, 'Bandung Kopo', 'Bank', 48, '2021-06-27 10:05:50', NULL),
(113, 'CS/2762021/1', 25000, 2500, 10000, 'Bandung Kopo', 'Bank', 48, '2021-06-27 10:06:14', NULL),
(114, 'CS/2762021/1', 25000, 2500, 10000, 'Bandung Kopo', 'Bank', 48, '2021-06-27 10:06:33', NULL),
(115, 'CS/2762021/1', 55000, 5500, 10000, 'Bandung jawa barat', 'Bank', 49, '2021-06-27 16:26:23', NULL),
(116, 'CS/2862021/1', 60000, 6000, 10000, 'Bandung Kopo', 'Bank', 3, '2021-06-27 20:07:18', NULL),
(117, 'CS/2862021/1', 10000, 1000, 10000, 'Bandung Kopo', 'Bank', 3, '2021-06-27 20:12:40', NULL),
(118, 'CS/2862021/1', 30000, 3000, 10000, 'Bandung Kopo', 'Bank', 3, '2021-06-27 20:15:17', NULL),
(119, 'CS/2862021/1', 30000, 3000, 10000, 'Bandung Kopo', 'Bank', 3, '2021-06-27 20:17:40', NULL),
(120, 'CS/2862021/1', 22000, 2200, 10000, 'Bandung Kopo', 'Bank', 3, '2021-06-27 20:18:32', NULL),
(121, 'CS/2862021/1', 10000, 1000, 10000, 'Bandung Kopo', 'Bank', 3, '2021-06-27 20:22:25', NULL),
(122, 'CS/2862021/1', 74000, 7400, 10000, 'bandung jawa barat', 'Bank', 51, '2021-06-27 20:29:15', NULL),
(123, 'CS/2862021/1', 25000, 2500, 10000, 'Bandung Kopo', 'Bank', 3, '2021-06-27 20:36:11', NULL),
(124, 'CS/2862021/1', 30000, 3000, 10000, 'bandung', 'Bank', 52, '2021-06-27 20:40:04', NULL),
(125, 'CS/2862021/1', 25000, 2500, 10000, 'bandung', 'Bank', 52, '2021-06-27 20:40:45', NULL),
(126, 'CS/2862021/1', 15000, 1500, 10000, 'Bandung Kopo', 'Bank', 3, '2021-06-27 20:44:47', NULL),
(127, 'CS/2862021/1', 30000, 3000, 10000, 'Bandung Kopo', 'Bank', 3, '2021-06-27 20:46:03', NULL),
(128, 'CS/2862021/1', 25000, 2500, 10000, 'bandung', 'Bank', 52, '2021-06-27 20:46:39', NULL),
(129, 'CS/2862021/1', 60000, 6000, 10000, 'Bandung jawa barat', 'Bank', 53, '2021-06-28 03:51:53', NULL),
(130, 'CS/1172021/1', 200000, 20000, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-07-11 13:24:36', NULL),
(131, 'CS/1172021/1', 200000, 20000, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-07-11 13:27:49', NULL),
(132, 'CS/1372021/1', 40000, 4000, 10000, 'Bandung Jawa Barat', 'Door delivery', 3, '2021-07-12 20:42:05', NULL),
(133, 'CS/1372021/1', 40000, 4000, 10000, 'Bandung Jawa Barat', 'Door delivery', 3, '2021-07-12 20:45:27', NULL),
(134, 'CS/1372021/1', 40000, 4000, 10000, 'Bandung Jawa Barat', 'Door delivery', 3, '2021-07-12 20:45:43', NULL),
(135, 'CS/1372021/1', 32000, 3200, 10000, 'Bandung Jawa Barat', 'Door delivery', 3, '2021-07-12 20:48:25', NULL),
(136, 'CS/1372021/1', 15000, 1500, 10000, 'Bandung Jawa Barat', 'Door delivery', 3, '2021-07-12 20:51:10', NULL),
(137, 'CS/1372021/1', 25000, 2500, 10000, 'Bandung Jawa Barat', 'Door delivery', 3, '2021-07-12 20:52:37', NULL),
(138, 'CS/1372021/1', 40000, 4000, 10000, 'Bandung Jawa Barat', 'Door delivery', 3, '2021-07-12 21:33:28', NULL),
(139, 'CS/1372021/1', 110000, 11000, 10000, 'Bandung timur', 'Door delivery', 3, '2021-07-13 06:57:29', NULL),
(140, 'CS/1372021/1', 30000, 3000, 10000, 'andung', 'Door delivery', 69, '2021-07-13 07:56:55', NULL),
(141, 'CS/1372021/1', 45000, 4500, 10000, 'andung', 'Door delivery', 69, '2021-07-13 07:57:32', NULL),
(142, 'CS/1372021/1', 95000, 9500, 10000, 'andung', 'Door delivery', 69, '2021-07-13 08:04:58', NULL),
(143, 'CS/1372021/1', 65000, 6500, 10000, 'jln raya bandung juara', 'Door delivery', 70, '2021-07-13 08:43:39', NULL),
(144, 'CS/1372021/1', 120000, 12000, 10000, 'jln raya bandung juara', 'Door delivery', 70, '2021-07-13 10:29:56', NULL),
(145, 'CS/1372021/1', 30000, 3000, 10000, 'jln raya bandung juara', 'Door delivery', 70, '2021-07-13 10:31:35', NULL),
(146, 'CS/1372021/1', 15000, 1500, 10000, 'jln raya bandung juara', 'Door delivery', 70, '2021-07-13 10:32:40', NULL),
(147, 'CS/1372021/1', 0, 0, 10000, 'jln raya bandung juara', 'Door delivery', 70, '2021-07-13 10:34:08', NULL),
(148, 'CS/1372021/1', 0, 0, 10000, 'jln raya bandung juara', 'Door delivery', 70, '2021-07-13 10:35:53', NULL),
(149, 'CS/1372021/1', 0, 0, 10000, 'jln raya bandung juara', 'Door delivery', 70, '2021-07-13 10:48:34', NULL),
(150, 'CS/1372021/1', 0, 0, 10000, 'jln raya bandung juara', 'Door delivery', 70, '2021-07-13 10:50:31', NULL),
(151, 'CS/1372021/1', 65000, 6500, 10000, 'jln raya bandung juara', 'Door delivery', 70, '2021-07-13 11:06:05', NULL),
(152, 'CS/1372021/1', 15000, 1500, 10000, 'jln raya bandung juara', 'Door delivery', 70, '2021-07-13 11:06:45', NULL),
(153, 'CS/1372021/1', 0, 0, 10000, 'jln raya bandung juara', 'Door delivery', 70, '2021-07-13 11:07:58', NULL),
(154, 'CS/1372021/1', 15000, 1500, 10000, 'jln raya bandung juara', 'Door delivery', 70, '2021-07-13 11:10:57', NULL),
(155, 'CS/1372021/1', 15000, 1500, 10000, 'jln raya bandung juara', 'Door delivery', 70, '2021-07-13 11:12:12', NULL),
(156, 'CS/1372021/1', 15000, 1500, 10000, 'jln raya bandung juara', 'Door delivery', 70, '2021-07-13 11:18:18', NULL),
(157, 'CS/1372021/1', 15000, 1500, 10000, 'jln raya bandung juara', 'Pick up at store', 70, '2021-07-13 11:20:17', NULL),
(158, 'CS/1372021/1', 15000, 1500, 10000, 'jln raya bandung juara', 'Door delivery', 70, '2021-07-13 11:32:52', NULL),
(159, 'CS/1372021/1', 15000, 1500, 10000, 'jln raya bandung juara', 'Door delivery', 70, '2021-07-13 11:33:36', NULL),
(160, 'CS/1372021/1', 25000, 2500, 10000, 'jln raya bandung juara', 'Door delivery', 70, '2021-07-13 11:36:26', NULL),
(161, 'CS/1372021/1', 15000, 1500, 10000, 'jln raya bandung juara', 'Door delivery', 70, '2021-07-13 11:40:56', NULL),
(162, 'CS/1372021/1', 15000, 1500, 10000, 'jln raya bandung juara', 'Pick up at store', 70, '2021-07-13 12:57:26', NULL),
(163, 'CS/1372021/1', 95000, 9500, 10000, 'jalan raya utama', 'Pick up at store', 71, '2021-07-13 13:36:43', NULL),
(164, 'CS/1372021/1', 15000, 1500, 10000, 'Bandung timur', 'Pick up at store', 3, '2021-07-13 14:38:36', NULL),
(165, 'CS/1372021/1', 15000, 1500, 10000, 'Bandung timur', 'Door delivery', 3, '2021-07-13 15:16:10', NULL),
(166, 'CS/1372021/1', 22000, 2200, 10000, 'Bandung timur', 'Door delivery', 3, '2021-07-13 15:18:05', NULL),
(167, 'CS/1372021/1', 22000, 2200, 10000, 'Bandung timur', 'Door delivery', 3, '2021-07-13 15:21:15', NULL),
(168, 'CS/1372021/1', 75000, 7500, 10000, 'Bandung timur', 'Pick up at store', 3, '2021-07-13 15:22:07', NULL),
(169, 'CS/1372021/1', 10000, 1000, 10000, 'Bandung timur', 'Door delivery', 3, '2021-07-13 15:22:54', NULL),
(170, 'CS/1372021/1', 15000, 1500, 10000, 'Bandung timur', 'Door delivery', 3, '2021-07-13 15:24:06', NULL),
(171, 'CS/1372021/1', 20000, 2000, 10000, 'Bandung timur', 'Door delivery', 3, '2021-07-13 15:24:56', NULL),
(172, 'CS/1372021/1', 80000, 8000, 10000, 'jalan raya utama', 'Pick up at store', 71, '2021-07-13 15:30:20', NULL),
(173, 'CS/1372021/1', 45000, 4500, 10000, 'jalan raya utama', 'Pick up at store', 71, '2021-07-13 15:35:30', NULL),
(174, 'CS/1472021/1', 55000, 5500, 10000, 'jln bandung raya no 123', 'Pick up at store', 72, '2021-07-14 04:10:41', NULL),
(175, 'CS/1472021/1', 95000, 9500, 10000, 'jln raya bandung no 1234', 'Pick up at store', 73, '2021-07-14 04:35:12', NULL),
(176, 'CS/1572021/1', 22000, 2200, 10000, 'Jalan raya kopo', 'Pick up at store', 3, '2021-07-14 17:01:36', NULL),
(207, 'CS/2872021/1', 50000, 5000, 10000, 'bandung jawa barat', 'Bank', 74, '2021-07-27 19:22:52', NULL),
(208, 'CS/2872021/1', 50000, 5000, 10000, 'bandung jawa barat', 'Bank', 74, '2021-07-27 19:26:39', NULL),
(212, 'CS/2872021/1', 44000, 4400, 10000, 'bandung jawa barat', 'Bank', 78, '2021-07-28 03:40:00', NULL),
(213, 'CS/2972021/1', 15000, 1500, 10000, 'bandung jawa barat indonesia', 'Door delivery', 75, '2021-07-29 06:42:06', NULL),
(214, 'CS/3072021/1', 30000, 3000, 10000, 'bandung jawa barat', 'Door delivery', 75, '2021-07-29 20:34:01', NULL),
(215, 'CS/3072021/1', 45000, 4500, 10000, 'bandung', 'Door delivery', 75, '2021-07-29 20:34:46', NULL),
(216, 'CS/3072021/1', 15000, 1500, 10000, 'bandung', 'Door delivery', 75, '2021-07-30 11:35:24', NULL),
(217, 'CS/3072021/1', 45000, 4500, 10000, 'bandung', 'Door delivery', 75, '2021-07-30 11:40:31', NULL),
(218, 'CS/3072021/1', 40000, 4000, 10000, 'bandung', 'Door delivery', 75, '2021-07-30 12:11:20', NULL),
(219, 'CS/3072021/1', 40000, 4000, 10000, 'bandung', 'Door delivery', 75, '2021-07-30 12:51:42', NULL),
(220, 'CS/3072021/1', 40000, 4000, 10000, 'bandung', 'Door delivery', 75, '2021-07-30 13:20:59', NULL),
(221, 'CS/3072021/1', 40000, 4000, 10000, 'bandung', 'Door delivery', 75, '2021-07-30 13:21:31', NULL),
(222, 'CS/3072021/1', 32000, 3200, 10000, 'bandung', 'Door delivery', 75, '2021-07-30 13:22:03', NULL),
(223, 'CS/3072021/1', 25000, 2500, 10000, 'bandung', 'Door delivery', 75, '2021-07-30 13:24:35', NULL),
(244, 'CS/392021/1', 200000, 20000, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-02 17:31:28', NULL),
(245, 'CS/392021/1', 200000, 20000, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-02 17:33:05', NULL),
(246, 'CS/392021/1', 200000, 20000, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-02 17:33:33', NULL),
(247, 'CS/392021/1', 200000, 20000, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-02 17:34:34', NULL),
(248, 'CS/392021/1', 200000, 20000, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-02 17:38:14', NULL),
(249, 'CS/392021/1', 200000, 20000, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-02 17:40:46', NULL),
(250, 'CS/392021/1', 200000, 20000, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-02 17:54:25', NULL),
(251, 'CS/392021/1', 200000, 20000, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-02 17:55:02', NULL),
(252, 'CS/392021/1', 200000, 20000, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-02 17:55:26', NULL),
(253, 'CS/392021/1', 200000, 20000, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-02 17:56:06', NULL),
(254, 'CS/392021/1', 200000, 20000, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-02 17:57:16', NULL),
(255, 'CS/392021/1', 200000, 20000, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-02 17:57:59', NULL),
(256, 'CS/392021/1', 200000, 20000, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-02 17:59:10', NULL),
(257, 'CS/392021/1', 200000, 20000, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-02 17:59:36', NULL),
(258, 'CS/392021/1', 200000, 20000, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-02 18:00:01', NULL),
(259, 'CS/392021/1', 200000, 20000, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-02 18:11:16', NULL),
(260, 'CS/392021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-02 18:21:31', NULL),
(261, 'CS/392021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-02 18:22:13', NULL),
(262, 'CS/392021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-02 18:22:48', NULL),
(263, 'CS/392021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-02 18:25:29', NULL),
(264, 'CS/392021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-02 18:26:58', NULL),
(265, 'CS/392021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-03 03:15:18', NULL),
(266, 'CS/392021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-03 03:15:42', NULL),
(267, 'CS/392021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-03 03:15:59', NULL),
(268, 'CS/392021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-03 03:16:13', NULL),
(269, 'CS/392021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-03 03:16:45', NULL),
(270, 'CS/392021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-03 03:17:03', NULL),
(271, 'CS/392021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-03 03:24:58', NULL),
(272, 'CS/392021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-03 03:30:27', NULL),
(273, 'CS/392021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-03 03:31:51', NULL),
(274, 'CS/392021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-03 03:33:23', NULL),
(275, 'CS/392021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-03 03:38:24', NULL),
(276, 'CS/392021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-03 03:39:03', NULL),
(277, 'CS/392021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-03 03:46:21', NULL),
(278, 'CS/392021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-03 03:46:42', NULL),
(279, 'CS/392021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-03 03:48:24', NULL),
(280, 'CS/392021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-03 03:48:50', NULL),
(281, 'CS/392021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-03 03:49:12', NULL),
(282, 'CS/392021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-03 03:56:57', NULL),
(283, 'CS/392021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-03 03:57:26', NULL),
(284, 'CS/392021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-03 03:59:53', NULL),
(285, 'CS/392021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-03 04:00:39', NULL),
(286, 'CS/392021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-03 04:00:53', NULL),
(287, 'CS/392021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-03 04:02:33', NULL),
(288, 'CS/692021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-06 02:38:08', NULL),
(290, 'CS/692021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-06 04:21:54', NULL),
(291, 'CS/692021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-06 04:27:19', NULL),
(292, 'CS/692021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-06 04:28:24', NULL),
(293, 'CS/692021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-06 04:46:50', NULL),
(294, 'CS/692021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-06 04:47:12', NULL),
(295, 'CS/692021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-06 04:48:30', NULL),
(296, 'CS/692021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-06 04:48:43', NULL),
(297, 'CS/692021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-06 04:49:07', NULL),
(298, 'CS/692021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-06 04:58:05', NULL),
(299, 'CS/692021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-06 04:58:41', NULL),
(300, 'CS/692021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-06 04:59:43', NULL),
(301, 'CS/692021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-06 05:00:17', NULL),
(302, 'CS/692021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-06 05:00:31', NULL),
(303, 'CS/692021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-06 05:00:49', NULL),
(304, 'CS/692021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-06 05:01:17', NULL),
(305, 'CS/692021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-06 05:01:23', NULL),
(306, 'CS/692021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-06 05:26:18', NULL),
(307, 'CS/692021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-06 05:26:55', NULL),
(308, 'CS/692021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-06 05:27:07', NULL),
(309, 'CS/692021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-06 05:27:44', NULL),
(310, 'CS/692021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-06 05:27:51', NULL),
(311, 'CS/692021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-06 05:27:59', NULL),
(312, 'CS/692021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-06 05:30:54', NULL),
(313, 'CS/692021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-06 05:31:05', NULL),
(314, 'CS/692021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-06 05:31:13', NULL),
(315, 'CS/692021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-06 05:32:54', NULL),
(316, 'CS/692021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-06 05:34:42', NULL),
(317, 'CS/692021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-06 05:34:58', NULL),
(318, 'CS/692021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-06 05:35:32', NULL),
(319, 'CS/692021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-06 05:36:57', NULL),
(320, 'CS/692021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-06 05:37:54', NULL),
(321, 'CS/692021/1', 95000, 9500, 10000, 'Bandung Jawa Barat', 'Bank', 3, '2021-09-06 06:04:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `role` varchar(80) NOT NULL DEFAULT 'General',
  `name` varchar(80) NOT NULL,
  `picture` varchar(80) DEFAULT NULL,
  `email` varchar(80) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `birth` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone_number` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `name`, `picture`, `email`, `password`, `gender`, `birth`, `address`, `phone_number`, `created_at`, `updated_at`) VALUES
(2, 'Admin', 'admin', NULL, 'admin@email.com', '$2b$10$dWHlhlt.2aYapa8rRkY2ROVpzHWjKDVqTwIwBRhho7mKAQu0oL/PW', NULL, NULL, NULL, NULL, '2021-06-14 17:20:26', '2021-06-14 17:20:26'),
(3, 'Admin', 'rahadian rizaldy  r', '/uploads/1630902030685.png', 'reza@email.com', '$2b$10$G7aomt.TKvmFkO26ofwPNeiFXxThlBMFtB5yrHGuTyf35yKlktaFS', NULL, '2021-08-15', 'Bandung Jawa Barat', '0832123456789', '2021-09-06 04:20:30', '2021-09-06 04:20:30'),
(13, 'Admin', 'reza', NULL, 'newadmin@email.com', '$2b$10$QQafJaxw1aTZhRBDbDHWE.qaGwg..8tWGmYA4Yzpg/4EczlcxKvTC', NULL, NULL, 'Bandung Kopo', '08112132446546', '2021-06-21 08:59:05', NULL),
(18, 'General', 'rahadian re', NULL, 'rahadian@email.com', '$2b$10$Ul/l1nbGhCg4YDZJEXuzEOkjSNgfJ45zY73EernzwDNfNTbbUa5gG', NULL, NULL, NULL, '082211663524389', '2021-08-17 09:58:11', '2021-08-17 09:58:11'),
(19, 'General', 'kikik', NULL, 'kikik@email.com', '$2b$10$n/AutNexyenoQURBj0.tzOgvbXA/BPNDc5jRxAn6BEbf41N1m03qa', NULL, NULL, NULL, NULL, '2021-06-16 02:38:49', NULL),
(20, 'General', 'kakak', NULL, 'kakak@email.com', '$2b$10$zoTpIowh1E3bj5hpx0w0KOIIXbscGTSTX8nXWuVMGdipdhBtkZ95K', NULL, NULL, 'Bandung Kopo', NULL, '2021-06-16 03:41:57', '2021-06-16 03:41:57'),
(21, 'General', 'user1', NULL, 'user@email.com', '$2b$10$GRQoEmSB3anrQq0Tk5CHs.eKuiU5Dk2UtitWU9ioXVnEmx5c7R0uS', NULL, NULL, NULL, '082216273635', '2021-06-21 08:56:43', NULL),
(38, 'General', 'Tika Tiku', NULL, 'user10@email.com', '$2b$10$y6.pt51Ee19ywUhbeCSjFOlnt8U/PPA6zaY7tUD95BpJ5LtEwo9/W', NULL, NULL, 'Bandung Jawa Barat', '0811232123299', '2021-08-15 12:12:38', '2021-08-15 12:12:38'),
(40, 'General', 'reza', NULL, 'user11@email.com', '$2b$10$M.CVFv0y.qZZIObUG3YXKOOCB.lwdDOfJIUQyMrnfcB/OHJj21JeS', NULL, NULL, 'Bandung Kopo', '081123212388', '2021-08-15 12:12:45', '2021-08-15 12:12:45'),
(43, 'General', 'kulili', NULL, 'user11@email.com', '$2b$10$zv1t0gw0yK/c5uoKYCOlJeoQf8W9gdI9RjoV4NxHuWWM91EfzJKei', NULL, NULL, NULL, '082212343234', '2021-08-15 14:08:52', '2021-08-15 14:08:52'),
(48, 'General', 'reza', NULL, 'reza11@email.com', '$2b$10$tItVqwrsMHkEjmv.iycj/enl1BCo10lLO.4gsSuoGLGvd2NAmHxuu', NULL, NULL, 'Bandung Kopo', '081123212321', '2021-06-27 10:00:09', '2021-06-27 10:00:09'),
(49, 'General', 'Rahadian Reza', '/uploads/1624811691772.jpg', 'usersenin@email.com', '$2b$10$0UFZ3zOjUaEzAKjgOehvzuYcVCZzV6Su0V0Xn4unEAL577Be.wSRi', NULL, NULL, 'Bandung', '0822123456789', '2021-08-15 13:32:58', '2021-08-15 13:32:58'),
(50, 'General', '', NULL, 'baba2@email.com', '$2b$10$XcGxChFTXR22HQ0rO0xS7Ot82jPKEU48B.AT3bH6G89v/EiCXtA12', NULL, NULL, NULL, '0822123745678', '2021-08-15 13:33:02', '2021-08-15 13:33:02'),
(51, 'General', 'Rahadian Reza', '/uploads/1624825706469.jpg', 'cobacoba@email.com', '$2b$10$S27cehwrqnDSvqB6bg6BoejZgQAeVgCYXq1X7akq9N97UN/K2L1LC', NULL, NULL, 'bandung jawa barat', '081134567890', '2021-06-27 20:28:26', '2021-06-27 20:28:26'),
(52, 'General', 'rahadian reza', '/uploads/1624826392189.jpg', 'cobacoba2@email.com', '$2b$10$qOpjuuxjDr0761VsMeL8DezDC5QKgtGJVHCnyDUXmT5ouhyGv6NeS', NULL, NULL, 'bandung', '082234567890', '2021-06-27 20:39:52', '2021-06-27 20:39:52'),
(53, 'General', 'Rahadian Reza', '/uploads/1624852292986.jpg', 'userbaru12@email.com', '$2b$10$GAVvlbI/O8lAEhe.e2A1S.QBaxhoAzIIcyaHYfo6Mia4mceQGxGu2', NULL, NULL, 'Bandung jawa barat', '0862212345678', '2021-08-15 13:33:05', '2021-08-15 13:33:05'),
(61, 'General', 'reza r', '/uploads/1626022768237.jpg', 'reza21@email.com', '$2b$10$lM9ilVsg0Jw8IZX2NGISHuywLNvAdz5DXD0/hldVX36pgiuNEOUD2', 'male', '11 march 1997', 'bandung', '0822123456783', '2021-08-15 13:33:13', '2021-08-15 13:33:13'),
(62, 'General', 'rahadian reza', '/uploads/1626024658046.jpg', 'tekwan@email.com', '$2b$10$h2M4gk7YClk3uHXJ98Mb1e0k./f73ttSeyvRoWG9A4.0xXJvpwlvu', 'male', '11 maret 1997', 'bandung', '0822123456782', '2021-08-15 13:33:16', '2021-08-15 13:33:16'),
(63, 'General', 'rahadian reza', '/uploads/1626025367882.jpg', 'tekwan2@email.com', '$2b$10$BdwOYvix4YYOT6Gyb7OP6.CEILjCPwI2nGMbVasTytAhdjx5HS4me', 'male', '11 maret 1997', 'bandung jawa barat', '08221234567870', '2021-08-15 13:33:24', '2021-08-15 13:33:24'),
(64, 'General', 'tekwan3', '/uploads/1626029579419.jpg', 'tekwan3@email.com', '$2b$10$GjD6hbBIOl3auaahNulKTuLXkLsAyM1MFUUBgHNPZCpMYnp81hIi6', 'male', '11 maret 1997', 'bandung', '0822123456789', '2021-07-11 18:52:59', '2021-07-11 18:52:59'),
(65, 'General', 'mamang racing', '/uploads/1626032812663.jpg', 'reta@email.com', '$2b$10$9eVeZTWPBS0ZqfdsowxwNuIjDgR1JQlyIciLifMvodUzT1.Idaraq', 'male', '12 juli 2020', 'jakarta', '089989878987', '2021-07-11 19:46:52', '2021-07-11 19:46:52'),
(68, 'General', 'babang', '/uploads/1626037783845.jpg', 'bangbang@email.com', '$2b$10$6zVZhKfEQaCXXziPDYzLA.7gTJ2wNKUf52v10vqaqCj7Xnd4uKqdu', 'male', '5 maret 1993', 'bandung', '0822122245678', '2021-08-15 13:33:32', '2021-08-15 13:33:32'),
(69, 'General', 'tatang man', '/uploads/1626162994921.jpg', 'tatang@email.com', '$2b$10$ihJrRG.NnchRt2wSkCZTt.6MlIkJtwlqI7sVF5iNAXZP.dm0u2MyS', 'male', '11 maret 1997', 'andung', '08211212345678', '2021-08-15 13:33:37', '2021-08-15 13:33:37'),
(70, 'General', 'tatang', '/uploads/1626165778242.jpg', 'ganteng@email.com', '$2b$10$Ys03x.T/AtvV6fSUQUa.AOBtbtgwU2.xsca7f/Bf1znEfU.gnVG4O', 'male', '11 maret 1233', 'jln raya bandung juara', '0826212345678', '2021-08-15 13:33:42', '2021-08-15 13:33:42'),
(71, 'General', 'mamang', '/uploads/1626183372846.jpg', 'mamang@email.com', '$2b$10$d3FPK3wLfZRP0ppeIM8IPeuN/h1s9LspfII9djtYsDmlqsZftYX3q', 'male', '12 03 2003', 'jalan raya utama', '0822245678', '2021-08-15 13:33:46', '2021-08-15 13:33:46'),
(72, 'General', 'babang tampan', '/uploads/1626235811921.jpg', 'bibibi@email.com', '$2b$10$sT2byWiAmMhY2egBKlJ0q.C9jstN0UWsHrjtE4M/Hm4ugVwaQX5gS', 'male', '11 march 1292', 'jln bandung raya no 123', '082213345678', '2021-08-15 13:33:49', '2021-08-15 13:33:49'),
(73, 'General', 'reza r', '/uploads/1626237287930.jpg', 'userdummy007@email.com', '$2b$10$wfjzGN5HLYQm3o8iP4ARMuQ9oP3Kjf7EwqMxS0BfXnj4olfGhKqjm', 'male', '11 april 1992', 'jln raya bandung no 1234', '080012345678', '2021-08-15 13:33:54', '2021-08-15 13:33:54'),
(74, 'General', 'rahadian riza', '/uploads/1626982554851.jpeg', 'udan@email.com', '$2b$10$x9qAqyA0Iz3M.ZD1VoLLWOAZ3Gfav1GnDYNS9TGaFlEI9Co4ZwkDy', NULL, '2021-07-21', 'bandung jawa barat', '082218329375', '2021-07-22 19:35:54', '2021-07-22 19:35:54'),
(75, 'General', 'rahadian reza r', '/uploads/1627821530172.jpg', 'dana@email.com', '$2b$10$wbJgCOkkBcdR5oyWA//LROxr/cZK98gBfpSrAigxHglqlUcPxjC6m', 'male', '2021-8-15', 'bandung', '082218329375', '2021-08-01 12:38:50', '2021-08-01 12:38:50'),
(76, 'General', 'rahadian reza', '/uploads/1627339300735.jpg', 'nunu@email.com', '$2b$10$EcMvBYxGxEXcvyY8NR3xVOAZTXN2DO7aMoz5BM3DMw0xzylXsox1y', NULL, '2021-07-27', 'bandung jawa barat', '0822123443219', '2021-08-17 12:16:26', '2021-08-17 12:16:26'),
(77, 'General', 'rahadian reza', '/uploads/1627415690027.jpg', 'lolo@email.com', '$2b$10$9CCnHHPpyVHKFyxT.8cNS.3or83o0xmUBM2v4wovNn1CreD2Odczu', NULL, '2021-07-28', 'bandung', '098876876567', '2021-07-27 19:54:50', '2021-07-27 19:54:50'),
(78, 'General', 'rahadian reza', '/uploads/1627468293380.jpg', 'userdummy7777@email.co.id', '$2b$10$ouYa.F9Ch46tM3VRIdhZMO3PZPGszQLOqexXa5RPDI.ULiDYjEfye', NULL, '2021-07-28', 'bandung jawa barat', '0822123432123', '2021-07-28 10:31:33', '2021-07-28 10:31:33'),
(79, 'General', 'rahadian reza', '/uploads/1627468808356.jpg', 'nanan@email.com', '$2b$10$gjKgxBxweM5gyzTwm145h.dXJrQ.rfZPGtBg8id1n6b2bcAJ.ab8O', NULL, '2021-07-28', 'bandung', '0822182344321', '2021-08-17 12:16:30', '2021-08-17 12:16:30'),
(80, 'General', 'rahadian reza', '/uploads/1627469704945.jpg', 'kanti@email.com', '$2b$10$GzOqIBrxV1yrp9fXCRgM5Oan4DNXv.KSyBVyQWhDJJ2kV0zimucUW', NULL, '2021-07-28', 'jabar indo indo', '082227345678', '2021-08-15 13:33:59', '2021-08-15 13:33:59'),
(81, 'General', 'rahadian reza', '/uploads/1627469843487.jpg', 'naki@email.com', '$2b$10$qm9JFAEF/whe0QZJOJyHcuJkqlvTHQWhvwtm7GNjjJ9ZWxMOw9ASC', NULL, '2021-07-28', 'bandung jabar', '082212345654', '2021-07-29 06:21:26', '2021-07-29 06:21:26'),
(82, 'General', 'rahadian reza', '/uploads/1628000244303.jpg', 'dani@email.com', '$2b$10$yAAo0qu9w4RPLOfeUrr87eHnOs2Ec2OD0rPXNUT9Fo0OfyPymMjey', 'male', '2021-8-1', 'bandung', '0825212344321', '2021-08-17 12:16:33', '2021-08-17 12:16:33'),
(83, 'General', 'rahadian rizaldy', '/uploads/1630901121290.png', 'rafi@email.com', '$2b$10$UamAQH.YCA1bSplkNyV2ke/7lbUCOCIj1qFLjEAT5QDjK0OKew1XS', NULL, '11 maret 1997', 'Bandung Jawa Barat', '082212345678', '2021-09-06 04:05:21', '2021-09-06 04:05:21'),
(84, 'General', 'dino baja', NULL, 'dino@email.com', '$2b$10$3lTEL9ykh..mstxUbViZluwWgc7QPi786XgH6VBegMkM5rabskVB2', NULL, 'null', 'null', '082212344342', '2021-08-17 12:35:13', '2021-08-17 12:35:13'),
(85, 'General', 'mamak', '/uploads/1628045642190.jpg', 'user0811@email.com', '$2b$10$6BhvbsQpp8/S/MYPWVg.Ye.sqG5LQLgqY7swcr0fHt8kItW9i.H/q', 'male', '2021-8-4', 'bandung', '0822127344321', '2021-08-17 12:16:37', '2021-08-17 12:16:37'),
(86, 'General', 'hujan satu', '/uploads/1629293288841.png', 'hujan1@email.com', '$2b$10$B1yJbAaeH66TWVXE1kxxa./raOpF5yikRqfPDyKItgoelY6qkT4zO', 'male', '2021-8-17', 'bandung', '0823276359111', '2021-08-18 13:28:08', '2021-08-18 13:28:08'),
(87, 'General', 'awan', '/uploads/1629303267316.png', 'hujan2@email.com', '$2b$10$YGxSEB.UmP9URIWUz2rnDuUR/guR5KGSH8g9G2qSBRH2hj/sc31xO', 'male', '2021-8-18', 'bandung', '082817038679', '2021-08-18 16:14:27', '2021-08-18 16:14:27');

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `code` varchar(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `variants`
--

INSERT INTO `variants` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'Regular', 'R', '2021-06-08 16:30:59', NULL),
(2, 'Large', 'L', '2021-06-08 16:30:59', NULL),
(3, 'Extra Large', 'XL', '2021-06-08 16:31:12', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_transactions`
--
ALTER TABLE `product_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=589;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT for table `product_transactions`
--
ALTER TABLE `product_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=502;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=322;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
