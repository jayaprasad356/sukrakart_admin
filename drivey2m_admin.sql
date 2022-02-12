-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 14, 2021 at 11:21 AM
-- Server version: 5.7.23-23
-- PHP Version: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `drivey2m_admin`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` varchar(28) NOT NULL,
  `permissions` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `forgot_password_code` varchar(255) DEFAULT NULL,
  `fcm_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `email`, `role`, `permissions`, `created_by`, `forgot_password_code`, `fcm_id`, `date_created`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', 'support@ekart.in', 'super admin', '{\"orders\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"categories\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"sellers\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"subcategories\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"products\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"products_order\":{\"read\":\"1\",\"update\":\"1\"},\"featured\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"customers\":{\"read\":\"1\"},\"payment\":{\"read\":\"1\",\"update\":\"1\"},\"notifications\":{\"create\":\"1\",\"read\":\"1\",\"delete\":\"1\"},\"transactions\":{\"read\":\"1\"},\"settings\":{\"read\":\"1\",\"update\":\"1\"},\"locations\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"reports\":{\"create\":\"1\",\"read\":\"1\"},\"faqs\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"home_sliders\":{\"create\":\"1\",\"read\":\"1\",\"delete\":\"1\"},\"new_offers\":{\"create\":\"1\",\"read\":\"1\",\"delete\":\"1\"},\"promo_codes\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"delivery_boys\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"return_requests\":{\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"}}', 0, '', 'cv7qKEjDS-uhwHzhFxCiwq:APA91bFzCRjuBWXM3lEM5rlxVrkXRMfAgPM4E6PTa7Q79bFgP9yMj5OI6eIG2O4koStpX97hHE8GyTN-453Fd4s9cDKtb6TiVj5103ORdAQlwPgyAIazDiUcYu-FS6COuRF0YIzJWQu0', '2020-06-22 16:48:25');

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `id` int(11) NOT NULL,
  `city_id` int(11) DEFAULT '0',
  `pincode_id` int(11) DEFAULT NULL,
  `name` text NOT NULL,
  `minimum_free_delivery_order_amount` int(20) NOT NULL DEFAULT '0',
  `delivery_charges` int(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`id`, `city_id`, `pincode_id`, `name`, `minimum_free_delivery_order_amount`, `delivery_charges`) VALUES
(1, 1, 1, 'ECIL', 500, 50),
(2, 2, 2, 'Bommanahlli', 500, 150);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `save_for_later` tinyint(4) NOT NULL DEFAULT '0',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `product_variant_id`, `qty`, `save_for_later`, `date_created`) VALUES
(6, 1, 3, 3, 1, 0, '2021-11-12 16:07:26'),
(8, 1, 1, 1, 1, 0, '2021-11-12 16:10:28'),
(9, 1, 2, 2, 1, 0, '2021-11-12 16:10:30');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `row_order` int(11) NOT NULL DEFAULT '0',
  `name` varchar(60) NOT NULL,
  `slug` varchar(256) DEFAULT NULL,
  `subtitle` text NOT NULL,
  `image` text NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `product_rating` tinyint(2) NOT NULL DEFAULT '0',
  `web_image` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `row_order`, `name`, `slug`, `subtitle`, `image`, `status`, `product_rating`, `web_image`) VALUES
(1, 0, 'Electronics', 'electronics', 'Mobiles', 'upload/images/6413-2021-11-12.jpg', 1, 0, ''),
(2, 0, 'Fashion', 'fashion', 'Fashion', 'upload/images/5724-2021-11-12.jpeg', 1, 0, ''),
(3, 0, 'Home Decorator', 'home-decorator', 'Home Decorator', 'upload/images/8933-2021-11-12.jpeg', 1, 0, ''),
(4, 0, 'Electronics', 'electronics-1', 'Electronics', 'upload/images/0013-2021-11-12.jpeg', 1, 0, ''),
(5, 0, 'Mobiles', 'mobiles', 'All Mobiles', 'upload/images/6990-2021-11-12.jpg', 1, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` text CHARACTER SET utf8,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `status`, `date_created`) VALUES
(1, 'Hyderabad', 1, '2021-11-12 15:13:54'),
(2, 'Bangalore', 1, '2021-11-12 15:13:59');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boys`
--

CREATE TABLE `delivery_boys` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `order_note` text,
  `password` text NOT NULL,
  `address` text NOT NULL,
  `bonus` int(11) NOT NULL,
  `balance` double DEFAULT '0',
  `driving_license` text,
  `national_identity_card` text,
  `dob` date DEFAULT NULL,
  `bank_account_number` text,
  `bank_name` text,
  `account_name` text,
  `ifsc_code` text,
  `other_payment_information` text,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_available` tinyint(4) NOT NULL DEFAULT '1',
  `fcm_id` varchar(256) DEFAULT NULL,
  `pincode_id` text,
  `cash_received` double NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `delivery_boys`
--

INSERT INTO `delivery_boys` (`id`, `name`, `mobile`, `order_note`, `password`, `address`, `bonus`, `balance`, `driving_license`, `national_identity_card`, `dob`, `bank_account_number`, `bank_name`, `account_name`, `ifsc_code`, `other_payment_information`, `status`, `date_created`, `is_available`, `fcm_id`, `pincode_id`, `cash_received`) VALUES
(1, 'Sachin', '9916616492', NULL, '81dc9bdb52d04dc20036dbd8313ed055', 'adsfsadfasdfsad', 10, 0, '1636732678.8219.jpg', '1636732678.8231.jpg', '1982-08-05', '123245++42kb', 'Indusind', 'sadfasdfasd', 'INDB0001686', 'adsfsdaf', 1, '2021-11-12 15:57:58', 1, NULL, '2,1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boy_notifications`
--

CREATE TABLE `delivery_boy_notifications` (
  `id` int(11) NOT NULL,
  `delivery_boy_id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(56) COLLATE utf8_unicode_ci NOT NULL,
  `order_item_id` int(11) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `fcm_id` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `seller_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`id`, `user_id`, `fcm_id`, `seller_id`) VALUES
(6, NULL, 'cGhB5kdUS3eBE4yE4Fu-wm:APA91bFX-JDITebWJfas-kQH4Oe7r8WHxput8yNIDcHNTsmTlEUpSo89hx9CT5ZZiiEix2CnvTXc5Dg-FgoXSr5Q-FJ_GwbnNKLGQzqzksfqN2JWZsCMrQShRRt-lGxdLFAGKJuJPWp_', NULL),
(7, NULL, 'cGhB5kdUS3eBE4yE4Fu-wm:APA91bFX-JDITebWJfas-kQH4Oe7r8WHxput8yNIDcHNTsmTlEUpSo89hx9CT5ZZiiEix2CnvTXc5Dg-FgoXSr5Q-FJ_GwbnNKLGQzqzksfqN2JWZsCMrQShRRt-lGxdLFAGKJuJPWp_', NULL),
(8, NULL, 'cGhB5kdUS3eBE4yE4Fu-wm:APA91bFX-JDITebWJfas-kQH4Oe7r8WHxput8yNIDcHNTsmTlEUpSo89hx9CT5ZZiiEix2CnvTXc5Dg-FgoXSr5Q-FJ_GwbnNKLGQzqzksfqN2JWZsCMrQShRRt-lGxdLFAGKJuJPWp_', NULL),
(9, NULL, 'cGhB5kdUS3eBE4yE4Fu-wm:APA91bFX-JDITebWJfas-kQH4Oe7r8WHxput8yNIDcHNTsmTlEUpSo89hx9CT5ZZiiEix2CnvTXc5Dg-FgoXSr5Q-FJ_GwbnNKLGQzqzksfqN2JWZsCMrQShRRt-lGxdLFAGKJuJPWp_', NULL),
(10, NULL, 'cGhB5kdUS3eBE4yE4Fu-wm:APA91bFX-JDITebWJfas-kQH4Oe7r8WHxput8yNIDcHNTsmTlEUpSo89hx9CT5ZZiiEix2CnvTXc5Dg-FgoXSr5Q-FJ_GwbnNKLGQzqzksfqN2JWZsCMrQShRRt-lGxdLFAGKJuJPWp_', NULL),
(11, NULL, 'cGhB5kdUS3eBE4yE4Fu-wm:APA91bFX-JDITebWJfas-kQH4Oe7r8WHxput8yNIDcHNTsmTlEUpSo89hx9CT5ZZiiEix2CnvTXc5Dg-FgoXSr5Q-FJ_GwbnNKLGQzqzksfqN2JWZsCMrQShRRt-lGxdLFAGKJuJPWp_', NULL),
(12, NULL, 'cGhB5kdUS3eBE4yE4Fu-wm:APA91bFX-JDITebWJfas-kQH4Oe7r8WHxput8yNIDcHNTsmTlEUpSo89hx9CT5ZZiiEix2CnvTXc5Dg-FgoXSr5Q-FJ_GwbnNKLGQzqzksfqN2JWZsCMrQShRRt-lGxdLFAGKJuJPWp_', NULL),
(13, NULL, 'cGhB5kdUS3eBE4yE4Fu-wm:APA91bFX-JDITebWJfas-kQH4Oe7r8WHxput8yNIDcHNTsmTlEUpSo89hx9CT5ZZiiEix2CnvTXc5Dg-FgoXSr5Q-FJ_GwbnNKLGQzqzksfqN2JWZsCMrQShRRt-lGxdLFAGKJuJPWp_', NULL),
(14, NULL, 'cGhB5kdUS3eBE4yE4Fu-wm:APA91bFX-JDITebWJfas-kQH4Oe7r8WHxput8yNIDcHNTsmTlEUpSo89hx9CT5ZZiiEix2CnvTXc5Dg-FgoXSr5Q-FJ_GwbnNKLGQzqzksfqN2JWZsCMrQShRRt-lGxdLFAGKJuJPWp_', NULL),
(15, NULL, 'cGhB5kdUS3eBE4yE4Fu-wm:APA91bFX-JDITebWJfas-kQH4Oe7r8WHxput8yNIDcHNTsmTlEUpSo89hx9CT5ZZiiEix2CnvTXc5Dg-FgoXSr5Q-FJ_GwbnNKLGQzqzksfqN2JWZsCMrQShRRt-lGxdLFAGKJuJPWp_', NULL),
(16, NULL, 'cGhB5kdUS3eBE4yE4Fu-wm:APA91bFX-JDITebWJfas-kQH4Oe7r8WHxput8yNIDcHNTsmTlEUpSo89hx9CT5ZZiiEix2CnvTXc5Dg-FgoXSr5Q-FJ_GwbnNKLGQzqzksfqN2JWZsCMrQShRRt-lGxdLFAGKJuJPWp_', NULL),
(17, NULL, 'cGhB5kdUS3eBE4yE4Fu-wm:APA91bFX-JDITebWJfas-kQH4Oe7r8WHxput8yNIDcHNTsmTlEUpSo89hx9CT5ZZiiEix2CnvTXc5Dg-FgoXSr5Q-FJ_GwbnNKLGQzqzksfqN2JWZsCMrQShRRt-lGxdLFAGKJuJPWp_', NULL),
(18, NULL, 'cGhB5kdUS3eBE4yE4Fu-wm:APA91bFX-JDITebWJfas-kQH4Oe7r8WHxput8yNIDcHNTsmTlEUpSo89hx9CT5ZZiiEix2CnvTXc5Dg-FgoXSr5Q-FJ_GwbnNKLGQzqzksfqN2JWZsCMrQShRRt-lGxdLFAGKJuJPWp_', NULL),
(19, NULL, 'cGhB5kdUS3eBE4yE4Fu-wm:APA91bFX-JDITebWJfas-kQH4Oe7r8WHxput8yNIDcHNTsmTlEUpSo89hx9CT5ZZiiEix2CnvTXc5Dg-FgoXSr5Q-FJ_GwbnNKLGQzqzksfqN2JWZsCMrQShRRt-lGxdLFAGKJuJPWp_', NULL),
(20, NULL, 'cGhB5kdUS3eBE4yE4Fu-wm:APA91bFX-JDITebWJfas-kQH4Oe7r8WHxput8yNIDcHNTsmTlEUpSo89hx9CT5ZZiiEix2CnvTXc5Dg-FgoXSr5Q-FJ_GwbnNKLGQzqzksfqN2JWZsCMrQShRRt-lGxdLFAGKJuJPWp_', NULL),
(21, NULL, 'cGhB5kdUS3eBE4yE4Fu-wm:APA91bFX-JDITebWJfas-kQH4Oe7r8WHxput8yNIDcHNTsmTlEUpSo89hx9CT5ZZiiEix2CnvTXc5Dg-FgoXSr5Q-FJ_GwbnNKLGQzqzksfqN2JWZsCMrQShRRt-lGxdLFAGKJuJPWp_', NULL),
(22, NULL, 'cGhB5kdUS3eBE4yE4Fu-wm:APA91bFX-JDITebWJfas-kQH4Oe7r8WHxput8yNIDcHNTsmTlEUpSo89hx9CT5ZZiiEix2CnvTXc5Dg-FgoXSr5Q-FJ_GwbnNKLGQzqzksfqN2JWZsCMrQShRRt-lGxdLFAGKJuJPWp_', NULL),
(23, NULL, 'cGhB5kdUS3eBE4yE4Fu-wm:APA91bFX-JDITebWJfas-kQH4Oe7r8WHxput8yNIDcHNTsmTlEUpSo89hx9CT5ZZiiEix2CnvTXc5Dg-FgoXSr5Q-FJ_GwbnNKLGQzqzksfqN2JWZsCMrQShRRt-lGxdLFAGKJuJPWp_', NULL),
(24, NULL, 'cGhB5kdUS3eBE4yE4Fu-wm:APA91bFX-JDITebWJfas-kQH4Oe7r8WHxput8yNIDcHNTsmTlEUpSo89hx9CT5ZZiiEix2CnvTXc5Dg-FgoXSr5Q-FJ_GwbnNKLGQzqzksfqN2JWZsCMrQShRRt-lGxdLFAGKJuJPWp_', NULL),
(25, NULL, 'cGhB5kdUS3eBE4yE4Fu-wm:APA91bFX-JDITebWJfas-kQH4Oe7r8WHxput8yNIDcHNTsmTlEUpSo89hx9CT5ZZiiEix2CnvTXc5Dg-FgoXSr5Q-FJ_GwbnNKLGQzqzksfqN2JWZsCMrQShRRt-lGxdLFAGKJuJPWp_', NULL),
(26, NULL, 'cGhB5kdUS3eBE4yE4Fu-wm:APA91bFX-JDITebWJfas-kQH4Oe7r8WHxput8yNIDcHNTsmTlEUpSo89hx9CT5ZZiiEix2CnvTXc5Dg-FgoXSr5Q-FJ_GwbnNKLGQzqzksfqN2JWZsCMrQShRRt-lGxdLFAGKJuJPWp_', NULL),
(27, NULL, 'd9fgE9eJQNeB5DlemKB1-h:APA91bE5MuKG_C1fRbFWMQKZEPuXP5sw7IJ55yEjR2gCWRdQsN7JN6Jft9BEzCCiHG8rjNUZ116WuvZf5EhOwP1mg09B7SpagVc9BFNdKKk0TDPG9DTWSiJ0o5MeHoZFR3_7Yo8q8T0G', NULL),
(28, NULL, 'd9fgE9eJQNeB5DlemKB1-h:APA91bE5MuKG_C1fRbFWMQKZEPuXP5sw7IJ55yEjR2gCWRdQsN7JN6Jft9BEzCCiHG8rjNUZ116WuvZf5EhOwP1mg09B7SpagVc9BFNdKKk0TDPG9DTWSiJ0o5MeHoZFR3_7Yo8q8T0G', NULL),
(29, NULL, 'd9fgE9eJQNeB5DlemKB1-h:APA91bE5MuKG_C1fRbFWMQKZEPuXP5sw7IJ55yEjR2gCWRdQsN7JN6Jft9BEzCCiHG8rjNUZ116WuvZf5EhOwP1mg09B7SpagVc9BFNdKKk0TDPG9DTWSiJ0o5MeHoZFR3_7Yo8q8T0G', NULL),
(30, NULL, 'd9fgE9eJQNeB5DlemKB1-h:APA91bE5MuKG_C1fRbFWMQKZEPuXP5sw7IJ55yEjR2gCWRdQsN7JN6Jft9BEzCCiHG8rjNUZ116WuvZf5EhOwP1mg09B7SpagVc9BFNdKKk0TDPG9DTWSiJ0o5MeHoZFR3_7Yo8q8T0G', NULL),
(31, NULL, 'd9fgE9eJQNeB5DlemKB1-h:APA91bE5MuKG_C1fRbFWMQKZEPuXP5sw7IJ55yEjR2gCWRdQsN7JN6Jft9BEzCCiHG8rjNUZ116WuvZf5EhOwP1mg09B7SpagVc9BFNdKKk0TDPG9DTWSiJ0o5MeHoZFR3_7Yo8q8T0G', NULL),
(32, NULL, 'd9fgE9eJQNeB5DlemKB1-h:APA91bE5MuKG_C1fRbFWMQKZEPuXP5sw7IJ55yEjR2gCWRdQsN7JN6Jft9BEzCCiHG8rjNUZ116WuvZf5EhOwP1mg09B7SpagVc9BFNdKKk0TDPG9DTWSiJ0o5MeHoZFR3_7Yo8q8T0G', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `status` char(1) DEFAULT '1',
  `seller_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` varchar(264) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fund_transfers`
--

CREATE TABLE `fund_transfers` (
  `id` int(11) NOT NULL,
  `delivery_boy_id` int(11) NOT NULL,
  `type` varchar(8) NOT NULL COMMENT 'credit | debit',
  `opening_balance` double NOT NULL,
  `closing_balance` double NOT NULL,
  `amount` double NOT NULL,
  `status` varchar(28) NOT NULL,
  `message` varchar(512) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `invoice_date` date NOT NULL,
  `order_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `order_date` datetime NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `order_list` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `discount` varchar(6) NOT NULL,
  `total_sale` varchar(10) NOT NULL,
  `shipping_charge` varchar(100) NOT NULL,
  `payment` text NOT NULL,
  `order_item_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `name` text CHARACTER SET utf8 NOT NULL,
  `extension` varchar(100) CHARACTER SET utf8 NOT NULL,
  `type` varchar(100) CHARACTER SET utf8 NOT NULL,
  `sub_directory` text CHARACTER SET utf8 NOT NULL,
  `size` text CHARACTER SET utf8 NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

CREATE TABLE `newsletter` (
  `id` int(11) NOT NULL,
  `email` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `message` varchar(512) NOT NULL,
  `type` varchar(12) NOT NULL,
  `type_id` int(11) NOT NULL,
  `image` varchar(128) DEFAULT NULL,
  `date_sent` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `title`, `message`, `type`, `type_id`, `image`, `date_sent`) VALUES
(1, 'TEST NOTIFICATION', 'WELCOME TO DRIVE2MART', 'default', 0, NULL, '2021-11-12 15:43:35');

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` int(11) NOT NULL,
  `image` varchar(256) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `image`, `date_added`) VALUES
(1, 'upload/offers/1636730960635.png', '2021-11-12 15:29:20');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `otp` int(10) DEFAULT NULL,
  `mobile` varchar(15) NOT NULL,
  `order_note` text,
  `total` float NOT NULL,
  `delivery_charge` float NOT NULL,
  `tax_amount` float NOT NULL DEFAULT '0',
  `tax_percentage` float NOT NULL DEFAULT '0',
  `wallet_balance` float NOT NULL,
  `discount` float NOT NULL DEFAULT '0',
  `promo_code` varchar(28) DEFAULT NULL,
  `promo_discount` float NOT NULL DEFAULT '0',
  `final_total` float DEFAULT NULL,
  `payment_method` varchar(16) NOT NULL,
  `address` text NOT NULL,
  `latitude` varchar(256) NOT NULL,
  `longitude` varchar(256) NOT NULL,
  `delivery_time` varchar(128) NOT NULL,
  `status` varchar(1024) NOT NULL,
  `active_status` varchar(16) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_from` int(11) DEFAULT '0',
  `pincode_id` int(11) DEFAULT '0',
  `area_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `otp`, `mobile`, `order_note`, `total`, `delivery_charge`, `tax_amount`, `tax_percentage`, `wallet_balance`, `discount`, `promo_code`, `promo_discount`, `final_total`, `payment_method`, `address`, `latitude`, `longitude`, `delivery_time`, `status`, `active_status`, `date_added`, `order_from`, `pincode_id`, `area_id`) VALUES
(1, 1, 872510, '9916616492', 'Gift Wrap Needed', 87998, 0, 0, 0, 0, 0, '', 0, 87998, 'cod', 'bhusnhzhbsh,Bangalore South,Basavanagudi,nothing,Hyderabad,ECIL,Karnataka,India,Pincode:500062', '17.5302389', '78.4289901', '13-Nov-2021 - Morning 9AM to 5AM', '[[\"received\",\"12-11-2021 09:17:16pm\"]]', 'received', '2021-11-12 15:47:16', 0, 560004, 1),
(2, 2, 822408, '8778624681', 'test', 0, 0, 0, 0, 0, 0, '', 0, 0, 'cod', 'test address,Kumbakonam,Atthiyur,shop,Hyderabad,ECIL,Tamil Nadu,India,Pincode:500062', '0', '0', '12-Nov-2021 - Morning 9AM to 5AM', '[[\"received\",\"12-11-2021 09:24:18pm\"]]', 'received', '2021-11-12 15:54:18', 0, 612503, 1),
(3, 2, 858629, '8778624681', '', 30, 50, 0, 0, 0, 0, '', 0, 80, 'cod', 'test address,Kumbakonam,Atthiyur,Kumbakonam,Atthiyur,shop,Hyderabad,ECIL,Tamil Nadu,India,Pincode:500062', '0', '0', '14-Nov-2021 - Morning 9AM to 5AM', '[[\"received\",\"14-11-2021 04:27:50pm\"]]', 'received', '2021-11-14 10:57:50', 0, 612503, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_name` text CHARACTER SET utf8,
  `variant_name` text CHARACTER SET utf8,
  `product_variant_id` int(11) NOT NULL,
  `delivery_boy_id` int(11) DEFAULT '0',
  `quantity` int(11) NOT NULL,
  `price` float NOT NULL,
  `discounted_price` double NOT NULL,
  `tax_amount` float DEFAULT '0',
  `tax_percentage` float DEFAULT '0',
  `discount` float NOT NULL DEFAULT '0',
  `sub_total` float NOT NULL,
  `status` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `active_status` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `seller_id` int(11) DEFAULT NULL,
  `is_credited` tinyint(2) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `user_id`, `order_id`, `product_name`, `variant_name`, `product_variant_id`, `delivery_boy_id`, `quantity`, `price`, `discounted_price`, `tax_amount`, `tax_percentage`, `discount`, `sub_total`, `status`, `active_status`, `date_added`, `seller_id`, `is_credited`) VALUES
(1, 1, 1, 'Redmi 9', '200kg', 1, 0, 1, 25000, 14999, 0, 0, 0, 14999, '[[\"received\",\"12-11-2021 09:17:16pm\"],[\"processed\",\"12-11-2021 09:31:00pm\"],[\"shipped\",\"12-11-2021 09:31:00pm\"]]', 'shipped', '2021-11-12 15:47:16', 1, 0),
(2, 1, 1, 'Realme Narzo', '250kg', 2, 0, 1, 45000, 30999, 0, 0, 0, 30999, '[[\"received\",\"12-11-2021 09:17:16pm\"],[\"processed\",\"12-11-2021 09:31:02pm\"],[\"shipped\",\"12-11-2021 09:31:02pm\"]]', 'shipped', '2021-11-12 15:47:16', 1, 0),
(3, 1, 1, 'POCO X3', '150kg', 3, 0, 1, 50000, 42000, 0, 0, 0, 42000, '[[\"received\",\"12-11-2021 09:17:16pm\"],[\"processed\",\"12-11-2021 09:31:08pm\"],[\"shipped\",\"12-11-2021 09:31:08pm\"]]', 'shipped', '2021-11-12 15:47:16', 1, 0),
(4, 2, 2, 'Redmi 9', '200kg', 1, 0, 1, 25000, 14999, 0, 0, 0, 14999, '[[\"received\",\"12-11-2021 09:24:18pm\"],[\"cancelled\",\"14-11-2021 04:28:29pm\"]]', 'cancelled', '2021-11-12 15:54:18', 1, 0),
(5, 2, 3, 'Music Set 21', '1pc', 9, 0, 10, 400, 3, 0, 0, 0, 30, '[[\"received\",\"14-11-2021 04:27:50pm\"]]', 'received', '2021-11-14 10:57:50', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(6) NOT NULL,
  `txnid` varchar(20) NOT NULL,
  `payment_amount` decimal(7,2) NOT NULL,
  `payment_status` varchar(25) NOT NULL,
  `itemid` varchar(25) NOT NULL,
  `createdtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment_requests`
--

CREATE TABLE `payment_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_type` varchar(56) NOT NULL,
  `payment_address` varchar(1024) NOT NULL,
  `amount_requested` int(11) NOT NULL,
  `remarks` varchar(512) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pincodes`
--

CREATE TABLE `pincodes` (
  `id` int(11) NOT NULL,
  `pincode` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pincodes`
--

INSERT INTO `pincodes` (`id`, `pincode`, `status`, `date_created`) VALUES
(1, '500062', 1, '2021-11-12 15:13:33'),
(2, '560004', 1, '2021-11-12 15:13:41');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `row_order` int(11) NOT NULL DEFAULT '0',
  `name` varchar(500) NOT NULL,
  `tax_id` tinyint(4) DEFAULT '0',
  `slug` varchar(120) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `indicator` tinyint(4) DEFAULT '0' COMMENT '0 - none | 1 - veg | 2 - non-veg',
  `manufacturer` varchar(512) DEFAULT NULL,
  `made_in` varchar(512) DEFAULT NULL,
  `return_status` tinyint(4) DEFAULT NULL,
  `cancelable_status` tinyint(4) DEFAULT NULL,
  `till_status` varchar(28) DEFAULT NULL,
  `image` text NOT NULL,
  `other_images` varchar(512) DEFAULT NULL,
  `description` text NOT NULL,
  `status` int(2) DEFAULT '1',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_approved` int(11) DEFAULT NULL,
  `return_days` int(11) DEFAULT '0',
  `type` text,
  `pincodes` text,
  `cod_allowed` tinyint(4) NOT NULL DEFAULT '1',
  `total_allowed_quantity` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `seller_id`, `row_order`, `name`, `tax_id`, `slug`, `category_id`, `subcategory_id`, `indicator`, `manufacturer`, `made_in`, `return_status`, `cancelable_status`, `till_status`, `image`, `other_images`, `description`, `status`, `date_added`, `is_approved`, `return_days`, `type`, `pincodes`, `cod_allowed`, `total_allowed_quantity`) VALUES
(1, 1, 0, 'Redmi 9', 0, 'redmi-9-1', 5, 3, 0, 'MIGHTY DIGITALS', 'India', 1, 1, 'shipped', 'upload/images/1703-2021-11-12.jpg', '', '<ul>\r\n	<li>Country Of Origin - India</li>\r\n	<li>13MP rear camera with AI portrait, AI scene recognition, HDR, pro mode | 5MP front camera</li>\r\n	<li>16.58 centimeters (6.53 inch) HD+ multi-touch capacitive touchscreen with 1600 x 720 pixels resolution, 268 ppi pixel density and 20:9 aspect ratio</li>\r\n	<li>Memory, Storage & SIM: 2GB RAM, 32GB internal memory expandable up to 512GB | Dual SIM (nano+nano) + Dedicated SD card slot</li>\r\n	<li>Android v10 operating system with upto 2.0GHz clock speed Mediatek Helio G25 octa core processor</li>\r\n	<li>5000mAH lithium-polymer large battery with 10W wired charger in-box</li>\r\n	<li>1 year manufacturer warranty for device and 6 months manufacturer warranty for in-box accessories including batteries from the date of purchase</li>\r\n	<li>Box also includes: Power adapter, USB cable, sim eject tool, warranty card and user guide</li>\r\n</ul>', 1, '2021-11-12 15:24:27', 1, 5, 'all', '', 1, 1),
(2, 1, 0, 'Realme Narzo', 0, 'realme-narzo', 5, 3, 0, 'MIGHTY DIGITALS', 'India', 1, 1, 'processed', 'upload/images/0505-2021-11-12.jpg', '', '<ul>\r\n	<li>6 GB RAM 128 GB ROM Expandable Upto 256 GB</li>\r\n	<li>16.51 cm 6.5 inch Full HD+ Display</li>\r\n	<li>48MP + 2MP + 2MP 16MP Front Camera</li>\r\n	<li>5000 mAh Battery</li>\r\n	<li>MediaTek Helio G95 Processor</li>\r\n	<li>Connector type: USB Type C</li>\r\n</ul>', 1, '2021-11-12 15:26:49', 1, 5, 'all', '', 1, 1),
(3, 1, 0, 'POCO X3', 0, 'poco-x3', 5, 3, 0, 'MIGHTY DIGITALS', 'India', 0, 0, '', 'upload/images/1068-2021-11-12.jpg', '', '<ul>\r\n	<li>6 GB RAM | 128 GB ROM | Expandable Upto 1 TB</li>\r\n	<li>16.94 cm (6.67 inch) Full HD+ Display</li>\r\n	<li>48MP + 8MP + 2MP + 2MP | 20MP Front Camera</li>\r\n	<li>5160 mAh Lithium-ion Polymer Battery</li>\r\n	<li>Qualcomm Snapdragon 860 Processor</li>\r\n</ul>', 1, '2021-11-12 15:28:26', 1, 0, 'all', '', 1, 1),
(4, 2, 0, 'Decorative', 0, 'decorative', 3, 6, 1, 'Nag Manufacturer', 'India', 0, 0, '', 'upload/images/4132-2021-11-12.jpeg', '[\"upload/other_images/1636730980.2393-989.jpeg\"]', '<p>This is test product</p>', 1, '2021-11-12 15:29:40', 1, 0, 'included', '2,1', 1, 0),
(5, 2, 0, 'Decorative1', 0, 'decorative1', 3, 7, 1, 'Nag Manufacturer', 'India', 0, 0, '', 'upload/images/8779-2021-11-12.jpeg', '[\"upload/other_images/1636731054.8038-407.jpeg\"]', '<p>This is second product</p>', 1, '2021-11-12 15:30:54', 1, 0, 'included', '2,1', 1, 0),
(6, 2, 0, 'Jewellery', 0, 'jewellery', 2, 4, 1, 'Nag Manufacturer', 'India', 0, 0, '', 'upload/images/2276-2021-11-12.jpeg', '[\"upload/other_images/1636731170.5795-168.jpeg\"]', '<p>This is jewellery product.</p>', 1, '2021-11-12 15:32:50', 1, 0, 'included', '2,1', 1, 0),
(7, 2, 0, 'Jewellery1', 0, 'jewellery1', 2, 5, 1, 'Nag Manufacturer', 'India', 0, 0, '', 'upload/images/7670-2021-11-12.jpeg', '[\"upload/other_images/1636731240.6412-892.jpeg\"]', '<p>This is second jewellery product</p>', 1, '2021-11-12 15:34:00', 1, 0, 'included', '2,1', 1, 0),
(8, 2, 0, 'Music Set1', 0, 'music-set1', 1, 1, 1, 'Nag Manufacturer', 'India', 0, 0, '', 'upload/images/4885-2021-11-12.jpeg', '[\"upload/other_images/1636731331.7993-404.jpeg\"]', '<p>This is Music set1</p>', 1, '2021-11-12 15:35:31', 1, 0, 'included', '2,1', 1, 0),
(9, 2, 0, 'Music Set 21', 0, 'music-set-21', 1, 2, 1, 'Nag Manufacturer', 'India', 0, 0, '', 'upload/images/6924-2021-11-12.jpeg', '[\"upload/other_images/1636731380.018-807.jpeg\"]', '<p>This is music set2</p>', 1, '2021-11-12 15:36:20', 1, 0, 'all', '', 1, 0),
(10, 2, 0, 'Shoes', 0, 'shoes', 2, 4, 1, 'Nag Manufacturer', 'India', 0, 0, '', 'upload/images/2368-2021-11-12.jpeg', '[\"upload/other_images/1636731570.6002-861.jpeg\"]', '<p>This is shoes category </p>', 1, '2021-11-12 15:39:30', 1, 0, 'included', '2,1', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_variant`
--

CREATE TABLE `product_variant` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `type` varchar(16) NOT NULL,
  `measurement` float NOT NULL,
  `measurement_unit_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `discounted_price` float NOT NULL,
  `serve_for` varchar(16) NOT NULL,
  `stock` float NOT NULL,
  `stock_unit_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_variant`
--

INSERT INTO `product_variant` (`id`, `product_id`, `type`, `measurement`, `measurement_unit_id`, `price`, `discounted_price`, `serve_for`, `stock`, `stock_unit_id`) VALUES
(1, 1, 'packet', 200, 1, 25000, 14999, 'Available', 4, 1),
(2, 2, 'packet', 250, 1, 45000, 30999, 'Available', 4, 1),
(3, 3, 'packet', 150, 1, 50000, 42000, 'Available', 4, 1),
(4, 4, 'packet', 1, 6, 1000, 10, 'Available', 10, 6),
(5, 5, 'packet', 1, 6, 2000, 10, 'Available', 10, 6),
(6, 6, 'packet', 10, 6, 200, 1, 'Available', 10, 6),
(7, 7, 'packet', 10, 6, 500, 3, 'Available', 10, 6),
(8, 8, 'packet', 1, 6, 600, 1, 'Available', 20, 6),
(9, 9, 'packet', 1, 6, 400, 3, 'Available', 20, 6),
(10, 10, 'packet', 1, 6, 550, 4, 'Available', 20, 6);

-- --------------------------------------------------------

--
-- Table structure for table `promo_codes`
--

CREATE TABLE `promo_codes` (
  `id` int(11) NOT NULL,
  `promo_code` varchar(28) NOT NULL,
  `message` varchar(512) NOT NULL,
  `start_date` varchar(28) NOT NULL,
  `end_date` varchar(28) NOT NULL,
  `no_of_users` int(11) NOT NULL,
  `minimum_order_amount` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `discount_type` varchar(28) NOT NULL,
  `max_discount_amount` int(11) NOT NULL,
  `repeat_usage` tinyint(4) NOT NULL,
  `no_of_repeat_usage` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `return_requests`
--

CREATE TABLE `return_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_item_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `remarks` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `title` varchar(64) CHARACTER SET utf8 NOT NULL,
  `short_description` varchar(64) CHARACTER SET utf8 NOT NULL,
  `style` varchar(16) NOT NULL,
  `product_ids` varchar(1024) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `title`, `short_description`, `style`, `product_ids`, `date_added`) VALUES
(1, 'Last Sale for Mobiles', 'Deal Goes Early', 'style_1', '2', '2021-11-12 16:19:26');

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `id` int(11) NOT NULL,
  `name` text CHARACTER SET utf8,
  `store_name` text CHARACTER SET utf8,
  `slug` varchar(256) DEFAULT NULL,
  `email` text CHARACTER SET utf8,
  `mobile` text,
  `password` text CHARACTER SET utf8 NOT NULL,
  `balance` int(50) NOT NULL DEFAULT '0',
  `store_url` text CHARACTER SET utf8,
  `logo` text CHARACTER SET utf8,
  `store_description` text CHARACTER SET utf8,
  `street` text CHARACTER SET utf8,
  `pincode_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `state` text CHARACTER SET utf8,
  `categories` text CHARACTER SET utf8,
  `account_number` text CHARACTER SET utf8,
  `bank_ifsc_code` text CHARACTER SET utf8,
  `account_name` text CHARACTER SET utf8,
  `bank_name` text CHARACTER SET utf8,
  `commission` int(11) DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `last_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `require_products_approval` tinyint(2) NOT NULL DEFAULT '0',
  `fcm_id` text CHARACTER SET utf8,
  `national_identity_card` text CHARACTER SET utf8,
  `address_proof` text CHARACTER SET utf8,
  `pan_number` text CHARACTER SET utf8,
  `tax_name` text CHARACTER SET utf8,
  `tax_number` text CHARACTER SET utf8,
  `customer_privacy` tinyint(4) DEFAULT '0',
  `latitude` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `longitude` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `forgot_password_code` varchar(256) DEFAULT NULL,
  `view_order_otp` tinyint(2) DEFAULT '0',
  `assign_delivery_boy` tinyint(2) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`id`, `name`, `store_name`, `slug`, `email`, `mobile`, `password`, `balance`, `store_url`, `logo`, `store_description`, `street`, `pincode_id`, `city_id`, `state`, `categories`, `account_number`, `bank_ifsc_code`, `account_name`, `bank_name`, `commission`, `status`, `last_updated`, `date_created`, `require_products_approval`, `fcm_id`, `national_identity_card`, `address_proof`, `pan_number`, `tax_name`, `tax_number`, `customer_privacy`, `latitude`, `longitude`, `forgot_password_code`, `view_order_otp`, `assign_delivery_boy`) VALUES
(1, 'Joel', 'MIGHTY DIGITALS', 'mighty-digitals-1', 'joel@gmail.com', '8247534465', '81dc9bdb52d04dc20036dbd8313ed055', 0, '', '1636730283.3689.png', '', '', 1, 1, 'Telangana', '5', '1654654654', 'INDB0001686', 'INDUSIND', 'Indusind', 15, 1, '2021-11-12 15:21:30', '2021-11-12 15:18:03', 0, NULL, '1636730283.3756.jpg', '1636730283.3819.jpg', '234324', 'fdsfsdf', '213123', 0, '0', '0', NULL, 1, 1),
(2, 'Nagarjuna', 'Nag Store', 'nag-store', 'mnagarjunamca@gmail.com', '9972611846', '8f3a99cb41dd9fa8eaffb065ee7f5fc5', 0, 'www.test.com', '1636730844.7826.jpeg', '', 'Padmavathi Nagar', 1, 1, 'Telangana', '5,4,3,2,1', '12345678', 'HDFC1234', 'HDFC', 'HDFC', 1, 1, NULL, '2021-11-12 15:27:24', 0, NULL, '1636730844.7832.jpeg', '1636730844.7835.jpeg', 'NA', 'NA', 'NA', 1, '123', 'NA', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `seller_commission`
--

CREATE TABLE `seller_commission` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `commission` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller_transactions`
--

CREATE TABLE `seller_transactions` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_item_id` int(11) DEFAULT NULL,
  `type` text CHARACTER SET utf8,
  `txn_id` text CHARACTER SET utf8,
  `amount` double(10,2) NOT NULL DEFAULT '0.00',
  `status` text CHARACTER SET utf8,
  `message` text CHARACTER SET utf8,
  `transaction_date` datetime DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallet_transactions`
--

CREATE TABLE `seller_wallet_transactions` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_item_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `type` varchar(256) DEFAULT NULL,
  `amount` double(8,2) NOT NULL DEFAULT '0.00',
  `message` text CHARACTER SET utf8,
  `status` tinyint(2) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `variable` text NOT NULL,
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `variable`, `value`) VALUES
(6, 'logo', 'logo.png'),
(9, 'privacy_policy', '<p><strong>Privacy Policy</strong></p>\r\n\r\n<p> \r\n<p>built the eCart app as a Free app. This SERVICE is provided by at no cost and is intended for use as is.</p>\r\n</p>\r\n\r\n<p>This page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service.</p>\r\n\r\n<p>If you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this Privacy Policy.</p>\r\n\r\n<p>The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at eCart unless otherwise defined in this Privacy Policy.</p>\r\n\r\n<p><strong>Information Collection and Use</strong></p>\r\n\r\n<p>For a better experience, while using our Service, I may require you to provide us with certain personally identifiable information. The information that I request will be retained on your device and is not collected by me in any way.</p>\r\n\r\n<p>The app does use third party services that may collect information used to identify you.</p>\r\n\r\n<p>Link to privacy policy of third party service providers used by the app</p>\r\n\r\n<ul>\r\n	<li><a href=\"https://www.google.com/policies/privacy/\" target=\"_blank\">Google Play Services</a></li>\r\n	<li><a href=\"https://firebase.google.com/policies/analytics\" target=\"_blank\">Google Analytics for Firebase</a></li>\r\n	<li><a href=\"https://firebase.google.com/support/privacy/\" target=\"_blank\">Firebase Crashlytics</a></li>\r\n</ul>\r\n\r\n<p><strong>Log Data</strong></p>\r\n\r\n<p>I want to inform you that whenever you use my Service, in a case of an error in the app I collect data and information (through third party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing my Service, the time and date of your use of the Service, and other statistics.</p>\r\n\r\n<p><strong>Cookies</strong></p>\r\n\r\n<p>Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device&#39;s internal memory.</p>\r\n\r\n<p>This Service does not use these “cookies” explicitly. However, the app may use third party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.</p>\r\n\r\n<p><strong>Service Providers</strong></p>\r\n\r\n<p>I may employ third-party companies and individuals due to the following reasons:</p>\r\n\r\n<ul>\r\n	<li>To facilitate our Service;</li>\r\n	<li>To provide the Service on our behalf;</li>\r\n	<li>To perform Service-related services; or</li>\r\n	<li>To assist us in analyzing how our Service is used.</li>\r\n</ul>\r\n\r\n<p>I want to inform users of this Service that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.</p>\r\n\r\n<p><strong>Security</strong></p>\r\n\r\n<p>I value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and I cannot guarantee its absolute security.</p>\r\n\r\n<p><strong>Links to Other Sites</strong></p>\r\n\r\n<p>This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by me. Therefore, I strongly advise you to review the Privacy Policy of these websites. I have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.</p>\r\n\r\n<p><strong>Children’s Privacy</strong></p>\r\n\r\n<p>These Services do not address anyone under the age of 13. I do not knowingly collect personally identifiable information from children under 13. In the case I discover that a child under 13 has provided me with personal information, I immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact me so that I will be able to do necessary actions.</p>\r\n\r\n<p><strong>Changes to This Privacy Policy</strong></p>\r\n\r\n<p>I may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Privacy Policy on this page.</p>\r\n\r\n<p>This policy is effective as of 2021-01-04</p>\r\n\r\n<p><strong>Contact Us</strong></p>\r\n\r\n<p>If you have any questions or suggestions about my Privacy Policy, do not hesitate to contact me at info@wrteam.in.</p>\r\n\r\n<p>This privacy policy page was created at <a href=\"https://privacypolicytemplate.net\" target=\"_blank\">privacypolicytemplate.net </a>and modified/generated by <a href=\"https://app-privacy-policy-generator.nisrulz.com/\" target=\"_blank\">App Privacy Policy Generator</a></p>'),
(10, 'terms_conditions', '<p><strong>Terms &amp; Conditions</strong></p>\r\n\r\n<p> \r\n<p>By downloading or using the app, these terms will automatically apply to you – you should make sure therefore that you read them carefully before using the app. You’re not allowed to copy, or modify the app, any part of the app, or our trademarks in any way. You’re not allowed to attempt to extract the source code of the app, and you also shouldn’t try to translate the app into other languages, or make derivative versions. The app itself, and all the trade marks, copyright, database rights and other intellectual property rights related to it, still belong to .</p>\r\n</p>\r\n\r\n<p>is committed to ensuring that the app is as useful and efficient as possible. For that reason, we reserve the right to make changes to the app or to charge for its services, at any time and for any reason. We will never charge you for the app or its services without making it very clear to you exactly what you’re paying for.</p>\r\n\r\n<p>The eCart app stores and processes personal data that you have provided to us, in order to provide my Service. It’s your responsibility to keep your phone and access to the app secure. We therefore recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions and limitations imposed by the official operating system of your device. It could make your phone vulnerable to malware/viruses/malicious programs, compromise your phone’s security features and it could mean that the eCart app won’t work properly or at all.</p>\r\n\r\n<p>The app does use third party services that declare their own Terms and Conditions.</p>\r\n\r\n<p>Link to Terms and Conditions of third party service providers used by the app</p>\r\n\r\n<ul>\r\n	<li><a href=\"https://policies.google.com/terms\" target=\"_blank\">Google Play Services</a></li>\r\n	<li><a href=\"https://firebase.google.com/terms/analytics\" target=\"_blank\">Google Analytics for Firebase</a></li>\r\n	<li><a href=\"https://firebase.google.com/terms/crashlytics\" target=\"_blank\">Firebase Crashlytics</a></li>\r\n</ul>\r\n\r\n<p>You should be aware that there are certain things that will not take responsibility for. Certain functions of the app will require the app to have an active internet connection. The connection can be Wi-Fi, or provided by your mobile network provider, but cannot take responsibility for the app not working at full functionality if you don’t have access to Wi-Fi, and you don’t have any of your data allowance left.</p>\r\n\r\n<p> </p>\r\n\r\n<p>If you’re using the app outside of an area with Wi-Fi, you should remember that your terms of the agreement with your mobile network provider will still apply. As a result, you may be charged by your mobile provider for the cost of data for the duration of the connection while accessing the app, or other third party charges. In using the app, you’re accepting responsibility for any such charges, including roaming data charges if you use the app outside of your home territory (i.e. region or country) without turning off data roaming. If you are not the bill payer for the device on which you’re using the app, please be aware that we assume that you have received permission from the bill payer for using the app.</p>\r\n\r\n<p>Along the same lines, cannot always take responsibility for the way you use the app i.e. You need to make sure that your device stays charged – if it runs out of battery and you can’t turn it on to avail the Service, cannot accept responsibility.</p>\r\n\r\n<p>With respect to ’s responsibility for your use of the app, when you’re using the app, it’s important to bear in mind that although we endeavour to ensure that it is updated and correct at all times, we do rely on third parties to provide information to us so that we can make it available to you. accepts no liability for any loss, direct or indirect, you experience as a result of relying wholly on this functionality of the app.</p>\r\n\r\n<p>At some point, we may wish to update the app. The app is currently available on Android – the requirements for system(and for any additional systems we decide to extend the availability of the app to) may change, and you’ll need to download the updates if you want to keep using the app. does not promise that it will always update the app so that it is relevant to you and/or works with the Android version that you have installed on your device. However, you promise to always accept updates to the application when offered to you, We may also wish to stop providing the app, and may terminate use of it at any time without giving notice of termination to you. Unless we tell you otherwise, upon any termination, (a) the rights and licenses granted to you in these terms will end; (b) you must stop using the app, and (if needed) delete it from your device.</p>\r\n\r\n<p><strong>Changes to This Terms and Conditions</strong></p>\r\n\r\n<p>I may update our Terms and Conditions from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Terms and Conditions on this page.</p>\r\n\r\n<p>These terms and conditions are effective as of 2021-01-04</p>\r\n\r\n<p><strong>Contact Us</strong></p>\r\n\r\n<p>If you have any questions or suggestions about my Terms and Conditions, do not hesitate to contact me at info@wrteam.in.</p>\r\n\r\n<p>This Terms and Conditions page was generated by <a href=\"https://app-privacy-policy-generator.nisrulz.com/\" target=\"_blank\">App Privacy Policy Generator</a></p>'),
(11, 'fcm_server_key', 'AAAARbHXtGM:APA91bEGQmzmbgy_-raxmNiNWkHvDHSCt8maqKhrsE2IGfQIMqWqAI36i4Pu8kkb9dpB87sQwe4PBd_8FDjS2qX5wq603GXgm_Xo0FLnfHaHOZ76aTbGhBWYcZH7JBc6BRGjjqeMCwzT'),
(12, 'contact_us', '<h2>E-commerce </h2>\r\n\r\n<p>For any kind of queries related to products, orders or services feel free to contact us on our official email address or phone number as given below :</p>\r\n\r\n<p><strong>Areas we deliver : </strong></p>\r\n\r\n<p><strong>Delivery Timings :</strong></p>\r\n\r\n<ol>\r\n	<li><strong>  8:00 AM To 10:30 AM</strong></li>\r\n	<li><strong> 10:30 AM To 12:30 PM</strong></li>\r\n	<li><strong>  4:00 PM To  7:00 PM</strong></li>\r\n</ol>\r\n\r\n<p><strong>Note : </strong>You can order for maximum 2days in advance. i.e., Today &amp; Tomorrow only.</p>\r\n\r\n<h3> </h3>\r\n'),
(13, 'system_timezone', '{\"system_configurations\":\"1\",\"system_timezone_gmt\":\"+05:30\",\"system_configurations_id\":\"13\",\"app_name\":\"Drive2mart\",\"support_number\":\"+91 9876543210\",\"support_email\":\"support@ekart.com\",\"current_version\":\"1.0.0\",\"minimum_version_required\":\"1.0.0\",\"is-version-system-on\":\"0\",\"store_address\":\"#262-263, Time Square Empire SH 42, highway, Goa, 643987\",\"map_latitude\":\"23.23305215147397\",\"map_longitude\":\"69.64400665873588\",\"currency\":\"u20b9\",\"system_timezone\":\"Asia/Kolkata\",\"max_cart_items_count\":\"10\",\"min_order_amount\":\"10\",\"area-wise-delivery-charge\":\"1\",\"min_amount\":\"0\",\"delivery_charge\":\"100\",\"is-refer-earn-on\":\"1\",\"min-refer-earn-order-amount\":\"100\",\"refer-earn-bonus\":\"2\",\"refer-earn-method\":\"percentage\",\"max-refer-earn-amount\":\"5000\",\"minimum-withdrawal-amount\":\"100\",\"max-product-return-days\":\"10\",\"delivery-boy-bonus-percentage\":\"10\",\"low-stock-limit\":\"10\",\"user-wallet-refill-limit\":\"10000\",\"from_mail\":\"info@ecart.com\",\"reply_to\":\"info@ecart.com\",\"generate-otp\":\"1\",\"smtp-from-mail\":\"noreply@wrteam.in\",\"smtp-reply-to\":\"noreply@wrteam.in\",\"smtp-email-password\":\"wrteam@0124\",\"smtp-host\":\"mail.wrteam.in\",\"smtp-port\":\"465\",\"smtp-content-type\":\"html\",\"smtp-encryption-type\":\"ssl\"}'),
(15, 'about_us', '<h2>About Us</h2>\r\n\r\n<p>eCart is one of the most selling and trending  Grocery, Food Delivery, Fruits &amp; Vegetable store, Full Android eCommerce &amp; Website. which is helps to create your own app and web with your brand name.</p>\r\n\r\n<p>eCart has creative and dedicated group of developers who are mastered in Apps Developments and Web Development with a nice in delivering quality solutions to customers across the globe.</p>\r\n\r\n<p>Everything there including code, doc, amazing support, and most important developed by WRTeam.</p>'),
(80, 'currency', '₹'),
(81, 'delivery_boy_privacy_policy', '<p><strong>Privacy Policy</strong></p>\r\n\r\n<p> \r\n<p>built the Delivery Boy - eCart app as a Free app. This SERVICE is provided by at no cost and is intended for use as is.</p>\r\n</p>\r\n\r\n<p>This page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service.</p>\r\n\r\n<p>If you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this Privacy Policy.</p>\r\n\r\n<p>The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at Delivery Boy - eCart unless otherwise defined in this Privacy Policy.</p>\r\n\r\n<p><strong>Information Collection and Use</strong></p>\r\n\r\n<p>For a better experience, while using our Service, I may require you to provide us with certain personally identifiable information. The information that I request will be retained on your device and is not collected by me in any way.</p>\r\n\r\n<p>The app does use third party services that may collect information used to identify you.</p>\r\n\r\n<p>Link to privacy policy of third party service providers used by the app</p>\r\n\r\n<ul>\r\n	<li><a href=\"https://www.google.com/policies/privacy/\" target=\"_blank\">Google Play Services</a></li>\r\n	<li><a href=\"https://firebase.google.com/policies/analytics\" target=\"_blank\">Google Analytics for Firebase</a></li>\r\n	<li><a href=\"https://firebase.google.com/support/privacy/\" target=\"_blank\">Firebase Crashlytics</a></li>\r\n</ul>\r\n\r\n<p><strong>Log Data</strong></p>\r\n\r\n<p>I want to inform you that whenever you use my Service, in a case of an error in the app I collect data and information (through third party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing my Service, the time and date of your use of the Service, and other statistics.</p>\r\n\r\n<p><strong>Cookies</strong></p>\r\n\r\n<p>Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device&#39;s internal memory.</p>\r\n\r\n<p>This Service does not use these “cookies” explicitly. However, the app may use third party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.</p>\r\n\r\n<p><strong>Service Providers</strong></p>\r\n\r\n<p>I may employ third-party companies and individuals due to the following reasons:</p>\r\n\r\n<ul>\r\n	<li>To facilitate our Service;</li>\r\n	<li>To provide the Service on our behalf;</li>\r\n	<li>To perform Service-related services; or</li>\r\n	<li>To assist us in analyzing how our Service is used.</li>\r\n</ul>\r\n\r\n<p>I want to inform users of this Service that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.</p>\r\n\r\n<p><strong>Security</strong></p>\r\n\r\n<p>I value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and I cannot guarantee its absolute security.</p>\r\n\r\n<p><strong>Links to Other Sites</strong></p>\r\n\r\n<p>This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by me. Therefore, I strongly advise you to review the Privacy Policy of these websites. I have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.</p>\r\n\r\n<p><strong>Children’s Privacy</strong></p>\r\n\r\n<p>These Services do not address anyone under the age of 13. I do not knowingly collect personally identifiable information from children under 13. In the case I discover that a child under 13 has provided me with personal information, I immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact me so that I will be able to do necessary actions.</p>\r\n\r\n<p><strong>Changes to This Privacy Policy</strong></p>\r\n\r\n<p>I may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Privacy Policy on this page.</p>\r\n\r\n<p>This policy is effective as of 2021-01-04</p>\r\n\r\n<p><strong>Contact Us</strong></p>\r\n\r\n<p>If you have any questions or suggestions about my Privacy Policy, do not hesitate to contact me at info@wrteam.in.</p>\r\n\r\n<p>This privacy policy page was created at <a href=\"https://privacypolicytemplate.net\" target=\"_blank\">privacypolicytemplate.net </a>and modified/generated by <a href=\"https://app-privacy-policy-generator.nisrulz.com/\" target=\"_blank\">App Privacy Policy Generator</a></p>'),
(82, 'delivery_boy_terms_conditions', '<p><strong>Terms &amp; Conditions</strong></p>\r\n\r\n<p> \r\n<p>By downloading or using the app, these terms will automatically apply to you – you should make sure therefore that you read them carefully before using the app. You’re not allowed to copy, or modify the app, any part of the app, or our trademarks in any way. You’re not allowed to attempt to extract the source code of the app, and you also shouldn’t try to translate the app into other languages, or make derivative versions. The app itself, and all the trade marks, copyright, database rights and other intellectual property rights related to it, still belong to .</p>\r\n</p>\r\n\r\n<p>is committed to ensuring that the app is as useful and efficient as possible. For that reason, we reserve the right to make changes to the app or to charge for its services, at any time and for any reason. We will never charge you for the app or its services without making it very clear to you exactly what you’re paying for.</p>\r\n\r\n<p>The Delivery Boy - eCart app stores and processes personal data that you have provided to us, in order to provide my Service. It’s your responsibility to keep your phone and access to the app secure. We therefore recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions and limitations imposed by the official operating system of your device. It could make your phone vulnerable to malware/viruses/malicious programs, compromise your phone’s security features and it could mean that the Delivery Boy - eCart app won’t work properly or at all.</p>\r\n\r\n<p>The app does use third party services that declare their own Terms and Conditions.</p>\r\n\r\n<p>Link to Terms and Conditions of third party service providers used by the app</p>\r\n\r\n<ul>\r\n	<li><a href=\"https://policies.google.com/terms\" target=\"_blank\">Google Play Services</a></li>\r\n	<li><a href=\"https://firebase.google.com/terms/analytics\" target=\"_blank\">Google Analytics for Firebase</a></li>\r\n	<li><a href=\"https://firebase.google.com/terms/crashlytics\" target=\"_blank\">Firebase Crashlytics</a></li>\r\n</ul>\r\n\r\n<p>You should be aware that there are certain things that will not take responsibility for. Certain functions of the app will require the app to have an active internet connection. The connection can be Wi-Fi, or provided by your mobile network provider, but cannot take responsibility for the app not working at full functionality if you don’t have access to Wi-Fi, and you don’t have any of your data allowance left.</p>\r\n\r\n<p> </p>\r\n\r\n<p>If you’re using the app outside of an area with Wi-Fi, you should remember that your terms of the agreement with your mobile network provider will still apply. As a result, you may be charged by your mobile provider for the cost of data for the duration of the connection while accessing the app, or other third party charges. In using the app, you’re accepting responsibility for any such charges, including roaming data charges if you use the app outside of your home territory (i.e. region or country) without turning off data roaming. If you are not the bill payer for the device on which you’re using the app, please be aware that we assume that you have received permission from the bill payer for using the app.</p>\r\n\r\n<p>Along the same lines, cannot always take responsibility for the way you use the app i.e. You need to make sure that your device stays charged – if it runs out of battery and you can’t turn it on to avail the Service, cannot accept responsibility.</p>\r\n\r\n<p>With respect to ’s responsibility for your use of the app, when you’re using the app, it’s important to bear in mind that although we endeavour to ensure that it is updated and correct at all times, we do rely on third parties to provide information to us so that we can make it available to you. accepts no liability for any loss, direct or indirect, you experience as a result of relying wholly on this functionality of the app.</p>\r\n\r\n<p>At some point, we may wish to update the app. The app is currently available on Android – the requirements for system(and for any additional systems we decide to extend the availability of the app to) may change, and you’ll need to download the updates if you want to keep using the app. does not promise that it will always update the app so that it is relevant to you and/or works with the Android version that you have installed on your device. However, you promise to always accept updates to the application when offered to you, We may also wish to stop providing the app, and may terminate use of it at any time without giving notice of termination to you. Unless we tell you otherwise, upon any termination, (a) the rights and licenses granted to you in these terms will end; (b) you must stop using the app, and (if needed) delete it from your device.</p>\r\n\r\n<p><strong>Changes to This Terms and Conditions</strong></p>\r\n\r\n<p>I may update our Terms and Conditions from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Terms and Conditions on this page.</p>\r\n\r\n<p>These terms and conditions are effective as of 2021-01-04</p>\r\n\r\n<p><strong>Contact Us</strong></p>\r\n\r\n<p>If you have any questions or suggestions about my Terms and Conditions, do not hesitate to contact me at info@wrteam.in.</p>\r\n\r\n<p>This Terms and Conditions page was generated by <a href=\"https://app-privacy-policy-generator.nisrulz.com/\" target=\"_blank\">App Privacy Policy Generator</a></p>'),
(92, 'payment_methods', '{\"payment_method_settings\":\"1\",\"cod_payment_method\":\"1\",\"cod_mode\":\"global\",\"paypal_payment_method\":\"1\",\"paypal_mode\":\"sandbox\",\"paypal_currency_code\":\"USD\",\"paypal_business_email\":\"seller@somedomain.com\",\"payumoney_payment_method\":\"1\",\"payumoney_mode\":\"sandbox\",\"payumoney_merchant_key\":\"FGCWtd8L\",\"payumoney_merchant_id\":\"6934786\",\"payumoney_salt\":\"40QIgAPghj\",\"razorpay_payment_method\":\"1\",\"razorpay_key\":\"rzp_test_PeH2Z44Chsfg5h\",\"razorpay_secret_key\":\"JlFiUHYoRKZc5LwR6GGc5t6y\",\"paystack_payment_method\":\"1\",\"paystack_public_key\":\"pk_test_fd8f8d9c548cbd143c78a4bdf6cee5c11f8e6c12\",\"paystack_secret_key\":\"sk_test_dcc02e93456783bb933b6d4c0dec928f1f7e0118\",\"flutterwave_payment_method\":\"1\",\"flutterwave_public_key\":\"FLWPUBK_TEST-1ffbaed6ee3788cd2bcbb234d3b90c59-X\",\"flutterwave_secret_key\":\"FLWSECK_TEST-c659ffd76304hhh67fc4b67ae735b126-X\",\"flutterwave_encryption_key\":\"FLWSECK_TEST25c36edcfvbb\",\"flutterwave_currency_code\":\"KES\",\"midtrans_payment_method\":\"1\",\"is_production\":\"0\",\"midtrans_merchant_id\":\"G213016789\",\"midtrans_client_key\":\"SB-Mid-client-gv4vPZ5utTTClO7u\",\"midtrans_server_key\":\"SB-Mid-server-PHtT70awwC_GsfIR_8TzIVyh\",\"stripe_payment_method\":\"1\",\"stripe_publishable_key\":\"pk_test_51Hh90WLYfObhNTTwooBHwynrlfiPo2uwxyCVqGNNCWGmpdOHuaW4rYS9cDldKJ1hxV5ik52UXUDSYgEM66OX45534565US7tRX\",\"stripe_secret_key\":\"sk_test_51Hh90WLYfObhNTTwO8kCsbdnMdmLxiGHEpiQPGBkYlafghjQ3RnXPIKGn3YsGIEMoIQ5bNfxye4kzE6wfLiINzNk00xOYprnZt\",\"stripe_webhook_secret_key\":\"whsec_mPs10vgbh0QDZPiH3drKBe7fOpMSRppX\",\"stripe_currency_code\":\"INR\",\"paytm_payment_method\":\"1\",\"paytm_mode\":\"sandbox\",\"paytm_merchant_key\":\"eIcrB!DTfgth5DN8\",\"paytm_merchant_id\":\"PpGeMd36789525540215\",\"ssl_commerce_payment_method\":\"0\",\"ssl_commerece_mode\":\"sandbox\",\"ssl_commerece_store_id\":\"\",\"ssl_commerece_secret_key\":\"\"}'),
(83, 'time_slot_config', '{\"time_slot_config\":\"1\",\"is_time_slots_enabled\":\"1\",\"delivery_starts_from\":\"1\",\"allowed_days\":\"1\"}'),
(95, 'manager_app_privacy_policy', '<p><strong>Privacy Policy</strong></p>\r\n\r\n<p> \r\n<p>built the eCart Manager App app as a Free app. This SERVICE is provided by at no cost and is intended for use as is.</p>\r\n</p>\r\n\r\n<p>This page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service.</p>\r\n\r\n<p>If you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this Privacy Policy.</p>\r\n\r\n<p>The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at eCart Manager App unless otherwise defined in this Privacy Policy.</p>\r\n\r\n<p><strong>Information Collection and Use</strong></p>\r\n\r\n<p>For a better experience, while using our Service, I may require you to provide us with certain personally identifiable information. The information that I request will be retained on your device and is not collected by me in any way.</p>\r\n\r\n<p>The app does use third party services that may collect information used to identify you.</p>\r\n\r\n<p>Link to privacy policy of third party service providers used by the app</p>\r\n\r\n<ul>\r\n	<li><a href=\"https://www.google.com/policies/privacy/\" target=\"_blank\">Google Play Services</a></li>\r\n</ul>\r\n\r\n<p><strong>Log Data</strong></p>\r\n\r\n<p>I want to inform you that whenever you use my Service, in a case of an error in the app I collect data and information (through third party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing my Service, the time and date of your use of the Service, and other statistics.</p>\r\n\r\n<p><strong>Cookies</strong></p>\r\n\r\n<p>Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device&#39;s internal memory.</p>\r\n\r\n<p>This Service does not use these “cookies” explicitly. However, the app may use third party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.</p>\r\n\r\n<p><strong>Service Providers</strong></p>\r\n\r\n<p>I may employ third-party companies and individuals due to the following reasons:</p>\r\n\r\n<ul>\r\n	<li>To facilitate our Service;</li>\r\n	<li>To provide the Service on our behalf;</li>\r\n	<li>To perform Service-related services; or</li>\r\n	<li>To assist us in analyzing how our Service is used.</li>\r\n</ul>\r\n\r\n<p>I want to inform users of this Service that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.</p>\r\n\r\n<p><strong>Security</strong></p>\r\n\r\n<p>I value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and I cannot guarantee its absolute security.</p>\r\n\r\n<p><strong>Links to Other Sites</strong></p>\r\n\r\n<p>This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by me. Therefore, I strongly advise you to review the Privacy Policy of these websites. I have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.</p>\r\n\r\n<p><strong>Children’s Privacy</strong></p>\r\n\r\n<p>These Services do not address anyone under the age of 13. I do not knowingly collect personally identifiable information from children under 13. In the case I discover that a child under 13 has provided me with personal information, I immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact me so that I will be able to do necessary actions.</p>\r\n\r\n<p><strong>Changes to This Privacy Policy</strong></p>\r\n\r\n<p>I may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Privacy Policy on this page.</p>\r\n\r\n<p>This policy is effective as of 2021-01-04</p>\r\n\r\n<p><strong>Contact Us</strong></p>\r\n\r\n<p>If you have any questions or suggestions about my Privacy Policy, do not hesitate to contact me at info@wrteam.in.</p>\r\n\r\n<p>This privacy policy page was created at <a href=\"https://privacypolicytemplate.net\" target=\"_blank\">privacypolicytemplate.net </a>and modified/generated by <a href=\"https://app-privacy-policy-generator.nisrulz.com/\" target=\"_blank\">App Privacy Policy Generator</a></p>'),
(96, 'manager_app_terms_conditions', '<p><strong>Terms &amp; Conditions</strong></p>\r\n\r\n<p> \r\n<p>By downloading or using the app, these terms will automatically apply to you – you should make sure therefore that you read them carefully before using the app. You’re not allowed to copy, or modify the app, any part of the app, or our trademarks in any way. You’re not allowed to attempt to extract the source code of the app, and you also shouldn’t try to translate the app into other languages, or make derivative versions. The app itself, and all the trade marks, copyright, database rights and other intellectual property rights related to it, still belong to .</p>\r\n</p>\r\n\r\n<p>is committed to ensuring that the app is as useful and efficient as possible. For that reason, we reserve the right to make changes to the app or to charge for its services, at any time and for any reason. We will never charge you for the app or its services without making it very clear to you exactly what you’re paying for.</p>\r\n\r\n<p>The eCart Manager App app stores and processes personal data that you have provided to us, in order to provide my Service. It’s your responsibility to keep your phone and access to the app secure. We therefore recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions and limitations imposed by the official operating system of your device. It could make your phone vulnerable to malware/viruses/malicious programs, compromise your phone’s security features and it could mean that the eCart Manager App app won’t work properly or at all.</p>\r\n\r\n<p>The app does use third party services that declare their own Terms and Conditions.</p>\r\n\r\n<p>Link to Terms and Conditions of third party service providers used by the app</p>\r\n\r\n<ul>\r\n	<li><a href=\"https://policies.google.com/terms\" target=\"_blank\">Google Play Services</a></li>\r\n</ul>\r\n\r\n<p>You should be aware that there are certain things that will not take responsibility for. Certain functions of the app will require the app to have an active internet connection. The connection can be Wi-Fi, or provided by your mobile network provider, but cannot take responsibility for the app not working at full functionality if you don’t have access to Wi-Fi, and you don’t have any of your data allowance left.</p>\r\n\r\n<p> </p>\r\n\r\n<p>If you’re using the app outside of an area with Wi-Fi, you should remember that your terms of the agreement with your mobile network provider will still apply. As a result, you may be charged by your mobile provider for the cost of data for the duration of the connection while accessing the app, or other third party charges. In using the app, you’re accepting responsibility for any such charges, including roaming data charges if you use the app outside of your home territory (i.e. region or country) without turning off data roaming. If you are not the bill payer for the device on which you’re using the app, please be aware that we assume that you have received permission from the bill payer for using the app.</p>\r\n\r\n<p>Along the same lines, cannot always take responsibility for the way you use the app i.e. You need to make sure that your device stays charged – if it runs out of battery and you can’t turn it on to avail the Service, cannot accept responsibility.</p>\r\n\r\n<p>With respect to ’s responsibility for your use of the app, when you’re using the app, it’s important to bear in mind that although we endeavour to ensure that it is updated and correct at all times, we do rely on third parties to provide information to us so that we can make it available to you. accepts no liability for any loss, direct or indirect, you experience as a result of relying wholly on this functionality of the app.</p>\r\n\r\n<p>At some point, we may wish to update the app. The app is currently available on Android – the requirements for system(and for any additional systems we decide to extend the availability of the app to) may change, and you’ll need to download the updates if you want to keep using the app. does not promise that it will always update the app so that it is relevant to you and/or works with the Android version that you have installed on your device. However, you promise to always accept updates to the application when offered to you, We may also wish to stop providing the app, and may terminate use of it at any time without giving notice of termination to you. Unless we tell you otherwise, upon any termination, (a) the rights and licenses granted to you in these terms will end; (b) you must stop using the app, and (if needed) delete it from your device.</p>\r\n\r\n<p><strong>Changes to This Terms and Conditions</strong></p>\r\n\r\n<p>I may update our Terms and Conditions from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Terms and Conditions on this page.</p>\r\n\r\n<p>These terms and conditions are effective as of 2021-01-04</p>\r\n\r\n<p><strong>Contact Us</strong></p>\r\n\r\n<p>If you have any questions or suggestions about my Terms and Conditions, do not hesitate to contact me at info@wrteam.in.</p>\r\n\r\n<p>This Terms and Conditions page was generated by <a href=\"https://app-privacy-policy-generator.nisrulz.com/\" target=\"_blank\">App Privacy Policy Generator</a></p>'),
(99, 'categories_settings', '{\"add_category_settings\":\"1\",\"cat_style\":\"style_1\",\"max_visible_categories\":\"7\",\"max_col_in_single_row\":\"3\"}'),
(97, 'front_end_settings', '{\"front_end_settings\":\"1\",\"android_app_url\":\"https://play.google.com\",\"call_back_url\":\"http://ekart.local:8000/\",\"common_meta_keywords\":\"eCart,WebeCart,eCart Front,eCart Web,eCart Front End\",\"common_meta_description\":\"eCart Front End is Web Version of eCart - Grocery, Food Delivery, Fruits & Vegetable store, Web Version.\",\"favicon\":\"1609822161.5542.png\",\"web_logo\":\"1610961661.239.png\",\"screenshots\":\"1608552564.1753.png\",\"google_play\":\"1608552564.1758.png\"}'),
(100, 'seller_privacy_policy', '<p>seller privacy &amp; policy</p>'),
(101, 'seller_terms_conditions', '<p>seller terms &amp; condition</p>');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `type` varchar(16) NOT NULL,
  `type_id` varchar(16) NOT NULL,
  `image` varchar(256) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id`, `type`, `type_id`, `image`, `date_added`) VALUES
(1, 'default', '0', 'upload/slider/1636730937551.jpg', '2021-11-12 15:28:57'),
(2, 'default', '0', 'upload/slider/1636730950711.jpg', '2021-11-12 15:29:10');

-- --------------------------------------------------------

--
-- Table structure for table `social_media`
--

CREATE TABLE `social_media` (
  `id` int(11) NOT NULL,
  `icon` text COLLATE utf8_unicode_ci NOT NULL,
  `link` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `slug` varchar(120) NOT NULL,
  `subtitle` text NOT NULL,
  `image` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `category_id`, `name`, `slug`, `subtitle`, `image`) VALUES
(1, 1, 'Music Set1', 'music-set1', 'Music Set1', 'upload/images/2186-2021-11-12.jpeg'),
(2, 1, 'Music Set2', 'music-set2', 'Music Set2', 'upload/images/3313-2021-11-12.jpeg'),
(3, 5, 'Smart Mobile Phones', 'smart-mobile-phones', 'All Mobiles', 'upload/images/1537-2021-11-12.jpg'),
(4, 2, 'Jewel Set1', 'jewel-set1', 'Jewel Set1', 'upload/images/0423-2021-11-12.jpeg'),
(5, 2, 'Jewel Set2', 'jewel-set2', 'Jewel Set2', 'upload/images/5473-2021-11-12.jpeg'),
(6, 3, 'Decorator1', 'decorator1', 'Decorator1', 'upload/images/4200-2021-11-12.jpeg'),
(7, 3, 'Decorator2', 'decorator2', 'Decorator2', 'upload/images/6146-2021-11-12.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8,
  `percentage` double(10,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `time_slots`
--

CREATE TABLE `time_slots` (
  `id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `from_time` time NOT NULL,
  `to_time` time NOT NULL,
  `last_order_time` time NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `time_slots`
--

INSERT INTO `time_slots` (`id`, `title`, `from_time`, `to_time`, `last_order_time`, `status`) VALUES
(1, 'Morning 9AM to 5AM', '09:00:00', '23:00:00', '22:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` varchar(128) NOT NULL,
  `type` varchar(56) NOT NULL,
  `txn_id` varchar(256) NOT NULL,
  `payu_txn_id` varchar(512) DEFAULT NULL,
  `amount` double NOT NULL,
  `status` varchar(8) NOT NULL,
  `message` varchar(128) NOT NULL,
  `transaction_date` datetime NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `short_code` varchar(8) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `conversion` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`id`, `name`, `short_code`, `parent_id`, `conversion`) VALUES
(1, 'Kilo Gram', 'kg', NULL, NULL),
(2, 'Gram', 'gm', 1, 1000),
(3, 'Liter', 'ltr', NULL, NULL),
(4, 'Milliliter', 'ml', 3, 1000),
(5, 'Pack', 'pack', NULL, NULL),
(6, 'Piece', 'pc', NULL, NULL),
(7, 'Meter', 'm', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `id` int(11) NOT NULL,
  `version` varchar(50) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `updates`
--

INSERT INTO `updates` (`id`, `version`) VALUES
(1, 'v1.0.0'),
(2, 'v1.0.1'),
(3, 'v1.0.2'),
(4, 'v1.0.2.1'),
(5, 'v1.0.2.2'),
(6, 'v1.0.2.3'),
(7, 'v1.0.2.4'),
(8, 'v1.0.3'),
(9, 'v1.0.4'),
(10, 'v1.0.5');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `email` varchar(250) CHARACTER SET utf8 NOT NULL,
  `profile` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_code` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '91',
  `mobile` varchar(14) CHARACTER SET utf8 NOT NULL,
  `balance` double NOT NULL DEFAULT '0',
  `referral_code` varchar(28) COLLATE utf8_unicode_ci NOT NULL,
  `friends_code` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fcm_id` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(256) CHARACTER SET utf8 NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `profile`, `country_code`, `mobile`, `balance`, `referral_code`, `friends_code`, `fcm_id`, `password`, `status`, `created_at`) VALUES
(1, 'Joelb', 'h@hotmail.com', 'default_user_profile.png', '91', '9916616492', 0, 'H2DFASC63A', '', 'dJliWv1uR9eCS6yy61oc80:APA91bGGRPSDq16hE6WuGGMVnDLf__vH73RjKohiB-G1hmtY87UnSVwXV1y0o3IovHpea2JV6Ip_PNYTu807IGuM_HIZb7CaJpYugvB26_ohtMa4synBcbX9A_ijCecevO34KkZZzHPJ', '81dc9bdb52d04dc20036dbd8313ed055', 1, '2021-11-12 15:42:20'),
(2, 'Prasad', 'jayaprasad356@gmail.com', 'default_user_profile.png', '91', '8778624681', 0, 'NOJ1T1WPUV', '', 'd9fgE9eJQNeB5DlemKB1-h:APA91bE5MuKG_C1fRbFWMQKZEPuXP5sw7IJ55yEjR2gCWRdQsN7JN6Jft9BEzCCiHG8rjNUZ116WuvZf5EhOwP1mg09B7SpagVc9BFNdKKk0TDPG9DTWSiJ0o5MeHoZFR3_7Yo8q8T0G', '91aaf94107ffdf9686dcc32e71ee46e3', 1, '2021-11-12 15:52:26');

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(28) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  `alternate_mobile` varchar(28) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `landmark` text COLLATE utf8_unicode_ci NOT NULL,
  `area_id` int(11) NOT NULL,
  `pincode_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `state` varchar(56) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(56) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitude` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_addresses`
--

INSERT INTO `user_addresses` (`id`, `user_id`, `type`, `name`, `mobile`, `alternate_mobile`, `address`, `landmark`, `area_id`, `pincode_id`, `city_id`, `state`, `country`, `latitude`, `longitude`, `is_default`, `date_created`) VALUES
(3, 2, 'Home', 'Prasad', '8778624681', '', 'test address,Kumbakonam,Atthiyur,Kumbakonam,Atthiyur', 'shop', 1, 612503, 1, 'Tamil Nadu', 'India', '0', '0', 1, '2021-11-12 15:53:48');

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` int(11) NOT NULL,
  `order_id` varchar(32) NOT NULL DEFAULT '0',
  `order_item_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(8) NOT NULL COMMENT 'credit | debit',
  `amount` double NOT NULL,
  `message` varchar(512) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawal_requests`
--

CREATE TABLE `withdrawal_requests` (
  `id` int(11) NOT NULL,
  `type` varchar(28) COLLATE utf8_unicode_ci NOT NULL,
  `type_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `message` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `last_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_boys`
--
ALTER TABLE `delivery_boys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_boy_notifications`
--
ALTER TABLE `delivery_boy_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fund_transfers`
--
ALTER TABLE `fund_transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_requests`
--
ALTER TABLE `payment_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pincodes`
--
ALTER TABLE `pincodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variant`
--
ALTER TABLE `product_variant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promo_codes`
--
ALTER TABLE `promo_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `return_requests`
--
ALTER TABLE `return_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_commission`
--
ALTER TABLE `seller_commission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_transactions`
--
ALTER TABLE `seller_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_wallet_transactions`
--
ALTER TABLE `seller_wallet_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_media`
--
ALTER TABLE `social_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_slots`
--
ALTER TABLE `time_slots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawal_requests`
--
ALTER TABLE `withdrawal_requests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `area`
--
ALTER TABLE `area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `delivery_boys`
--
ALTER TABLE `delivery_boys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `delivery_boy_notifications`
--
ALTER TABLE `delivery_boy_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fund_transfers`
--
ALTER TABLE `fund_transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_requests`
--
ALTER TABLE `payment_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pincodes`
--
ALTER TABLE `pincodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_variant`
--
ALTER TABLE `product_variant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `promo_codes`
--
ALTER TABLE `promo_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `return_requests`
--
ALTER TABLE `return_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seller_commission`
--
ALTER TABLE `seller_commission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller_transactions`
--
ALTER TABLE `seller_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller_wallet_transactions`
--
ALTER TABLE `seller_wallet_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `social_media`
--
ALTER TABLE `social_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `time_slots`
--
ALTER TABLE `time_slots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawal_requests`
--
ALTER TABLE `withdrawal_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
