-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 29, 2019 at 11:43 AM
-- Server version: 10.1.37-MariaDB-cll-lve
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sheiooec_PointSale`
--

-- --------------------------------------------------------

--
-- Table structure for table `sma_addresses`
--

CREATE TABLE `sma_addresses` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `line1` varchar(50) NOT NULL,
  `line2` varchar(50) DEFAULT NULL,
  `city` varchar(25) NOT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `state` varchar(25) NOT NULL,
  `country` varchar(50) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustments`
--

CREATE TABLE `sma_adjustments` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` text,
  `attachment` varchar(55) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `count_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustment_items`
--

CREATE TABLE `sma_adjustment_items` (
  `id` int(11) NOT NULL,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_brands`
--

CREATE TABLE `sma_brands` (
  `id` int(11) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_brands`
--

INSERT INTO `sma_brands` (`id`, `code`, `name`, `image`, `slug`) VALUES
(0, '1', 'GREVOX', NULL, 'grevox');

-- --------------------------------------------------------

--
-- Table structure for table `sma_calendar`
--

CREATE TABLE `sma_calendar` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `color` varchar(7) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_captcha`
--

CREATE TABLE `sma_captcha` (
  `captcha_id` bigint(13) UNSIGNED NOT NULL,
  `captcha_time` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `word` varchar(20) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_categories`
--

CREATE TABLE `sma_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(55) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_categories`
--

INSERT INTO `sma_categories` (`id`, `code`, `name`, `image`, `parent_id`, `slug`) VALUES
(1, 'Washing machine 1', 'Washing Machine', NULL, 0, 'washing-machine'),
(1, 'Washing machine 1', 'Washing Machine', NULL, 0, 'washing-machine'),
(0, 'k.b', 'k.b', NULL, 0, 'kb');

-- --------------------------------------------------------

--
-- Table structure for table `sma_combo_items`
--

CREATE TABLE `sma_combo_items` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_companies`
--

CREATE TABLE `sma_companies` (
  `id` int(11) NOT NULL,
  `group_id` int(10) UNSIGNED DEFAULT NULL,
  `group_name` varchar(20) NOT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `customer_group_name` varchar(100) DEFAULT NULL,
  `name` varchar(55) NOT NULL,
  `company` varchar(255) NOT NULL,
  `vat_no` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `state` varchar(55) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `cf1` varchar(100) DEFAULT NULL,
  `cf2` varchar(100) DEFAULT NULL,
  `cf3` varchar(100) DEFAULT NULL,
  `cf4` varchar(100) DEFAULT NULL,
  `cf5` varchar(100) DEFAULT NULL,
  `cf6` varchar(100) DEFAULT NULL,
  `invoice_footer` text,
  `payment_term` int(11) DEFAULT '0',
  `logo` varchar(255) DEFAULT 'logo.png',
  `award_points` int(11) DEFAULT '0',
  `deposit_amount` decimal(25,4) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL,
  `price_group_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_companies`
--

INSERT INTO `sma_companies` (`id`, `group_id`, `group_name`, `customer_group_id`, `customer_group_name`, `name`, `company`, `vat_no`, `address`, `city`, `state`, `postal_code`, `country`, `phone`, `email`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `invoice_footer`, `payment_term`, `logo`, `award_points`, `deposit_amount`, `price_group_id`, `price_group_name`) VALUES
(3, NULL, 'biller', NULL, NULL, 'Mian Saleem', 'Test Biller', '5555', 'Biller adddress', 'City', '', '', 'Country', '012345678', 'saleem@tecdiary.com', '', '', '', '', '', '', ' Thank you for shopping with us. Please come again', 0, 'logo1.png', 0, NULL, NULL, NULL),
(3, NULL, 'biller', NULL, NULL, 'Mian Saleem', 'Test Biller', '5555', 'Biller adddress', 'City', '', '', 'Country', '012345678', 'saleem@tecdiary.com', '', '', '', '', '', '', ' Thank you for shopping with us. Please come again', 0, 'logo1.png', 0, NULL, NULL, NULL),
(0, 3, 'customer', 2, 'Reseller', 'Mr Naheem', 'Believer welfare  ', '0011', 'Lassan Nawab', 'Mansehra', 'KPK', '21390', 'Pakistan', '0997341055', 'lsnmega@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, '15000.0000', 1, 'Default'),
(0, 4, 'supplier', NULL, NULL, 'shah', 'Umer', '', 'Lassan Nawab', 'Mansehra', 'KPK', '21390', 'Pakistan', '997341055', '123ssss@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, '15000.0000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_costing`
--

CREATE TABLE `sma_costing` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sale_item_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `purchase_net_unit_cost` decimal(25,4) DEFAULT NULL,
  `purchase_unit_cost` decimal(25,4) DEFAULT NULL,
  `sale_net_unit_price` decimal(25,4) NOT NULL,
  `sale_unit_price` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT NULL,
  `inventory` tinyint(1) DEFAULT '0',
  `overselling` tinyint(1) DEFAULT '0',
  `option_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_currencies`
--

CREATE TABLE `sma_currencies` (
  `id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  `name` varchar(55) NOT NULL,
  `rate` decimal(12,4) NOT NULL,
  `auto_update` tinyint(1) NOT NULL DEFAULT '0',
  `symbol` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_currencies`
--

INSERT INTO `sma_currencies` (`id`, `code`, `name`, `rate`, `auto_update`, `symbol`) VALUES
(0, 'Rupee', 'Rupees', '0.0000', 0, 'Rs');

-- --------------------------------------------------------

--
-- Table structure for table `sma_customer_groups`
--

CREATE TABLE `sma_customer_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `percent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_customer_groups`
--

INSERT INTO `sma_customer_groups` (`id`, `name`, `percent`) VALUES
(1, 'General', 0),
(2, 'Reseller', -5),
(3, 'Distributor', -15),
(4, 'New Customer (+10)', 10),
(1, 'General', 0),
(2, 'Reseller', -5),
(3, 'Distributor', -15),
(4, 'New Customer (+10)', 10);

-- --------------------------------------------------------

--
-- Table structure for table `sma_date_format`
--

CREATE TABLE `sma_date_format` (
  `id` int(11) NOT NULL,
  `js` varchar(20) NOT NULL,
  `php` varchar(20) NOT NULL,
  `sql` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_date_format`
--

INSERT INTO `sma_date_format` (`id`, `js`, `php`, `sql`) VALUES
(1, 'mm-dd-yyyy', 'm-d-Y', '%m-%d-%Y'),
(2, 'mm/dd/yyyy', 'm/d/Y', '%m/%d/%Y'),
(3, 'mm.dd.yyyy', 'm.d.Y', '%m.%d.%Y'),
(4, 'dd-mm-yyyy', 'd-m-Y', '%d-%m-%Y'),
(5, 'dd/mm/yyyy', 'd/m/Y', '%d/%m/%Y'),
(6, 'dd.mm.yyyy', 'd.m.Y', '%d.%m.%Y'),
(1, 'mm-dd-yyyy', 'm-d-Y', '%m-%d-%Y'),
(2, 'mm/dd/yyyy', 'm/d/Y', '%m/%d/%Y'),
(3, 'mm.dd.yyyy', 'm.d.Y', '%m.%d.%Y'),
(4, 'dd-mm-yyyy', 'd-m-Y', '%d-%m-%Y'),
(5, 'dd/mm/yyyy', 'd/m/Y', '%d/%m/%Y'),
(6, 'dd.mm.yyyy', 'd.m.Y', '%d.%m.%Y');

-- --------------------------------------------------------

--
-- Table structure for table `sma_deliveries`
--

CREATE TABLE `sma_deliveries` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) NOT NULL,
  `do_reference_no` varchar(50) NOT NULL,
  `sale_reference_no` varchar(50) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `attachment` varchar(50) DEFAULT NULL,
  `delivered_by` varchar(50) DEFAULT NULL,
  `received_by` varchar(50) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_deposits`
--

CREATE TABLE `sma_deposits` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `company_id` int(11) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `paid_by` varchar(50) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_deposits`
--

INSERT INTO `sma_deposits` (`id`, `date`, `company_id`, `amount`, `paid_by`, `note`, `created_by`, `updated_by`, `updated_at`) VALUES
(0, '2019-01-28 02:40:00', 0, '5000.0000', 'umer', '', 1, 0, NULL),
(0, '2019-01-28 03:16:00', 0, '5000.0000', 'umer', '', 1, 0, NULL),
(0, '2019-01-28 03:26:00', 0, '5000.0000', 'umer', '', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_expenses`
--

CREATE TABLE `sma_expenses` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_expense_categories`
--

CREATE TABLE `sma_expense_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_cards`
--

CREATE TABLE `sma_gift_cards` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_card_topups`
--

CREATE TABLE `sma_gift_card_topups` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `card_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_groups`
--

CREATE TABLE `sma_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_groups`
--

INSERT INTO `sma_groups` (`id`, `name`, `description`) VALUES
(1, 'owner', 'Owner'),
(2, 'admin', 'Administrator'),
(3, 'customer', 'Customer'),
(4, 'supplier', 'Supplier'),
(5, 'sales', 'Sales Staff'),
(1, 'owner', 'Owner'),
(2, 'admin', 'Administrator'),
(3, 'customer', 'Customer'),
(4, 'supplier', 'Supplier'),
(5, 'sales', 'Sales Staff');

-- --------------------------------------------------------

--
-- Table structure for table `sma_login_attempts`
--

CREATE TABLE `sma_login_attempts` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_migrations`
--

CREATE TABLE `sma_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_migrations`
--

INSERT INTO `sma_migrations` (`version`) VALUES
(315),
(315);

-- --------------------------------------------------------

--
-- Table structure for table `sma_notifications`
--

CREATE TABLE `sma_notifications` (
  `id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_date` datetime DEFAULT NULL,
  `till_date` datetime DEFAULT NULL,
  `scope` tinyint(1) NOT NULL DEFAULT '3'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_notifications`
--

INSERT INTO `sma_notifications` (`id`, `comment`, `date`, `from_date`, `till_date`, `scope`) VALUES
(1, '<p>Thank you for purchasing Stock Manager Advance. Please don\'t forget to check the documentation in help folder. If you find any error/bug, please email to support@tecdiary.com with details. You can send us your valued suggestions/feedback too.</p><p>Please rate Stock Manager Advance on your download page of codecanyon.net</p>', '2014-08-15 10:00:57', '2015-01-01 00:00:00', '2017-01-01 00:00:00', 3),
(1, '<p>Thank you for purchasing Stock Manager Advance. Please don\'t forget to check the documentation in help folder. If you find any error/bug, please email to support@tecdiary.com with details. You can send us your valued suggestions/feedback too.</p><p>Please rate Stock Manager Advance on your download page of codecanyon.net</p>', '2014-08-15 10:00:57', '2015-01-01 00:00:00', '2017-01-01 00:00:00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `sma_order_ref`
--

CREATE TABLE `sma_order_ref` (
  `ref_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `so` int(11) NOT NULL DEFAULT '1',
  `qu` int(11) NOT NULL DEFAULT '1',
  `po` int(11) NOT NULL DEFAULT '1',
  `to` int(11) NOT NULL DEFAULT '1',
  `pos` int(11) NOT NULL DEFAULT '1',
  `do` int(11) NOT NULL DEFAULT '1',
  `pay` int(11) NOT NULL DEFAULT '1',
  `re` int(11) NOT NULL DEFAULT '1',
  `rep` int(11) NOT NULL DEFAULT '1',
  `ex` int(11) NOT NULL DEFAULT '1',
  `ppay` int(11) NOT NULL DEFAULT '1',
  `qa` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_order_ref`
--

INSERT INTO `sma_order_ref` (`ref_id`, `date`, `so`, `qu`, `po`, `to`, `pos`, `do`, `pay`, `re`, `rep`, `ex`, `ppay`, `qa`) VALUES
(1, '2015-03-01', 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 2, 1),
(1, '2015-03-01', 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_payments`
--

CREATE TABLE `sma_payments` (
  `id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `reference_no` varchar(50) NOT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT '0.0000',
  `pos_balance` decimal(25,4) DEFAULT '0.0000',
  `approval_code` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_payments`
--

INSERT INTO `sma_payments` (`id`, `date`, `sale_id`, `return_id`, `purchase_id`, `reference_no`, `transaction_id`, `paid_by`, `cheque_no`, `cc_no`, `cc_holder`, `cc_month`, `cc_year`, `cc_type`, `amount`, `currency`, `created_by`, `attachment`, `type`, `note`, `pos_paid`, `pos_balance`, `approval_code`) VALUES
(0, '2019-01-28 01:03:00', NULL, NULL, 0, 'POP2019/01/0001', NULL, 'cash', '', '', '', '', '', 'Visa', '26600.0000', NULL, 1, NULL, 'sent', '', '0.0000', '0.0000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_paypal`
--

CREATE TABLE `sma_paypal` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL,
  `paypal_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '2.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '3.9000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '4.4000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_paypal`
--

INSERT INTO `sma_paypal` (`id`, `active`, `account_email`, `paypal_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'mypaypal@paypal.com', 'USD', '0.0000', '0.0000', '0.0000'),
(1, 1, 'mypaypal@paypal.com', 'USD', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_permissions`
--

CREATE TABLE `sma_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `products-index` tinyint(1) DEFAULT '0',
  `products-add` tinyint(1) DEFAULT '0',
  `products-edit` tinyint(1) DEFAULT '0',
  `products-delete` tinyint(1) DEFAULT '0',
  `products-cost` tinyint(1) DEFAULT '0',
  `products-price` tinyint(1) DEFAULT '0',
  `quotes-index` tinyint(1) DEFAULT '0',
  `quotes-add` tinyint(1) DEFAULT '0',
  `quotes-edit` tinyint(1) DEFAULT '0',
  `quotes-pdf` tinyint(1) DEFAULT '0',
  `quotes-email` tinyint(1) DEFAULT '0',
  `quotes-delete` tinyint(1) DEFAULT '0',
  `sales-index` tinyint(1) DEFAULT '0',
  `sales-add` tinyint(1) DEFAULT '0',
  `sales-edit` tinyint(1) DEFAULT '0',
  `sales-pdf` tinyint(1) DEFAULT '0',
  `sales-email` tinyint(1) DEFAULT '0',
  `sales-delete` tinyint(1) DEFAULT '0',
  `purchases-index` tinyint(1) DEFAULT '0',
  `purchases-add` tinyint(1) DEFAULT '0',
  `purchases-edit` tinyint(1) DEFAULT '0',
  `purchases-pdf` tinyint(1) DEFAULT '0',
  `purchases-email` tinyint(1) DEFAULT '0',
  `purchases-delete` tinyint(1) DEFAULT '0',
  `transfers-index` tinyint(1) DEFAULT '0',
  `transfers-add` tinyint(1) DEFAULT '0',
  `transfers-edit` tinyint(1) DEFAULT '0',
  `transfers-pdf` tinyint(1) DEFAULT '0',
  `transfers-email` tinyint(1) DEFAULT '0',
  `transfers-delete` tinyint(1) DEFAULT '0',
  `customers-index` tinyint(1) DEFAULT '0',
  `customers-add` tinyint(1) DEFAULT '0',
  `customers-edit` tinyint(1) DEFAULT '0',
  `customers-delete` tinyint(1) DEFAULT '0',
  `suppliers-index` tinyint(1) DEFAULT '0',
  `suppliers-add` tinyint(1) DEFAULT '0',
  `suppliers-edit` tinyint(1) DEFAULT '0',
  `suppliers-delete` tinyint(1) DEFAULT '0',
  `sales-deliveries` tinyint(1) DEFAULT '0',
  `sales-add_delivery` tinyint(1) DEFAULT '0',
  `sales-edit_delivery` tinyint(1) DEFAULT '0',
  `sales-delete_delivery` tinyint(1) DEFAULT '0',
  `sales-email_delivery` tinyint(1) DEFAULT '0',
  `sales-pdf_delivery` tinyint(1) DEFAULT '0',
  `sales-gift_cards` tinyint(1) DEFAULT '0',
  `sales-add_gift_card` tinyint(1) DEFAULT '0',
  `sales-edit_gift_card` tinyint(1) DEFAULT '0',
  `sales-delete_gift_card` tinyint(1) DEFAULT '0',
  `pos-index` tinyint(1) DEFAULT '0',
  `sales-return_sales` tinyint(1) DEFAULT '0',
  `reports-index` tinyint(1) DEFAULT '0',
  `reports-warehouse_stock` tinyint(1) DEFAULT '0',
  `reports-quantity_alerts` tinyint(1) DEFAULT '0',
  `reports-expiry_alerts` tinyint(1) DEFAULT '0',
  `reports-products` tinyint(1) DEFAULT '0',
  `reports-daily_sales` tinyint(1) DEFAULT '0',
  `reports-monthly_sales` tinyint(1) DEFAULT '0',
  `reports-sales` tinyint(1) DEFAULT '0',
  `reports-payments` tinyint(1) DEFAULT '0',
  `reports-purchases` tinyint(1) DEFAULT '0',
  `reports-profit_loss` tinyint(1) DEFAULT '0',
  `reports-customers` tinyint(1) DEFAULT '0',
  `reports-suppliers` tinyint(1) DEFAULT '0',
  `reports-staff` tinyint(1) DEFAULT '0',
  `reports-register` tinyint(1) DEFAULT '0',
  `sales-payments` tinyint(1) DEFAULT '0',
  `purchases-payments` tinyint(1) DEFAULT '0',
  `purchases-expenses` tinyint(1) DEFAULT '0',
  `products-adjustments` tinyint(1) NOT NULL DEFAULT '0',
  `bulk_actions` tinyint(1) NOT NULL DEFAULT '0',
  `customers-deposits` tinyint(1) NOT NULL DEFAULT '0',
  `customers-delete_deposit` tinyint(1) NOT NULL DEFAULT '0',
  `products-barcode` tinyint(1) NOT NULL DEFAULT '0',
  `purchases-return_purchases` tinyint(1) NOT NULL DEFAULT '0',
  `reports-expenses` tinyint(1) NOT NULL DEFAULT '0',
  `reports-daily_purchases` tinyint(1) DEFAULT '0',
  `reports-monthly_purchases` tinyint(1) DEFAULT '0',
  `products-stock_count` tinyint(1) DEFAULT '0',
  `edit_price` tinyint(1) DEFAULT '0',
  `returns-index` tinyint(1) DEFAULT '0',
  `returns-add` tinyint(1) DEFAULT '0',
  `returns-edit` tinyint(1) DEFAULT '0',
  `returns-delete` tinyint(1) DEFAULT '0',
  `returns-email` tinyint(1) DEFAULT '0',
  `returns-pdf` tinyint(1) DEFAULT '0',
  `reports-tax` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_permissions`
--

INSERT INTO `sma_permissions` (`id`, `group_id`, `products-index`, `products-add`, `products-edit`, `products-delete`, `products-cost`, `products-price`, `quotes-index`, `quotes-add`, `quotes-edit`, `quotes-pdf`, `quotes-email`, `quotes-delete`, `sales-index`, `sales-add`, `sales-edit`, `sales-pdf`, `sales-email`, `sales-delete`, `purchases-index`, `purchases-add`, `purchases-edit`, `purchases-pdf`, `purchases-email`, `purchases-delete`, `transfers-index`, `transfers-add`, `transfers-edit`, `transfers-pdf`, `transfers-email`, `transfers-delete`, `customers-index`, `customers-add`, `customers-edit`, `customers-delete`, `suppliers-index`, `suppliers-add`, `suppliers-edit`, `suppliers-delete`, `sales-deliveries`, `sales-add_delivery`, `sales-edit_delivery`, `sales-delete_delivery`, `sales-email_delivery`, `sales-pdf_delivery`, `sales-gift_cards`, `sales-add_gift_card`, `sales-edit_gift_card`, `sales-delete_gift_card`, `pos-index`, `sales-return_sales`, `reports-index`, `reports-warehouse_stock`, `reports-quantity_alerts`, `reports-expiry_alerts`, `reports-products`, `reports-daily_sales`, `reports-monthly_sales`, `reports-sales`, `reports-payments`, `reports-purchases`, `reports-profit_loss`, `reports-customers`, `reports-suppliers`, `reports-staff`, `reports-register`, `sales-payments`, `purchases-payments`, `purchases-expenses`, `products-adjustments`, `bulk_actions`, `customers-deposits`, `customers-delete_deposit`, `products-barcode`, `purchases-return_purchases`, `reports-expenses`, `reports-daily_purchases`, `reports-monthly_purchases`, `products-stock_count`, `edit_price`, `returns-index`, `returns-add`, `returns-edit`, `returns-delete`, `returns-email`, `returns-pdf`, `reports-tax`) VALUES
(1, 5, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 5, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_register`
--

CREATE TABLE `sma_pos_register` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) DEFAULT NULL,
  `total_cheques_submitted` int(11) DEFAULT NULL,
  `total_cc_slips_submitted` int(11) DEFAULT NULL,
  `note` text,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_pos_register`
--

INSERT INTO `sma_pos_register` (`id`, `date`, `user_id`, `cash_in_hand`, `status`, `total_cash`, `total_cheques`, `total_cc_slips`, `total_cash_submitted`, `total_cheques_submitted`, `total_cc_slips_submitted`, `note`, `closed_at`, `transfer_opened_bills`, `closed_by`) VALUES
(0, '2019-01-28 03:24:12', 1, '0.0000', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_settings`
--

CREATE TABLE `sma_pos_settings` (
  `pos_id` int(1) NOT NULL,
  `cat_limit` int(11) NOT NULL,
  `pro_limit` int(11) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_biller` int(11) NOT NULL,
  `display_time` varchar(3) NOT NULL DEFAULT 'yes',
  `cf_title1` varchar(255) DEFAULT NULL,
  `cf_title2` varchar(255) DEFAULT NULL,
  `cf_value1` varchar(255) DEFAULT NULL,
  `cf_value2` varchar(255) DEFAULT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_manual_product` varchar(55) DEFAULT NULL,
  `customer_selection` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `toggle_subcategory_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_items_list` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `keyboard` tinyint(1) NOT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `product_button_color` varchar(20) NOT NULL DEFAULT 'default',
  `tooltips` tinyint(1) DEFAULT '1',
  `paypal_pro` tinyint(1) DEFAULT '0',
  `stripe` tinyint(1) DEFAULT '0',
  `rounding` tinyint(1) DEFAULT '0',
  `char_per_line` tinyint(4) DEFAULT '42',
  `pin_code` varchar(20) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT 'purchase_code',
  `envato_username` varchar(50) DEFAULT 'envato_username',
  `version` varchar(10) DEFAULT '3.3.1',
  `after_sale_page` tinyint(1) DEFAULT '0',
  `item_order` tinyint(1) DEFAULT '0',
  `authorize` tinyint(1) DEFAULT '0',
  `toggle_brands_slider` varchar(55) DEFAULT NULL,
  `remote_printing` tinyint(1) DEFAULT '1',
  `printer` int(11) DEFAULT NULL,
  `order_printers` varchar(55) DEFAULT NULL,
  `auto_print` tinyint(1) DEFAULT '0',
  `customer_details` tinyint(1) DEFAULT NULL,
  `local_printers` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_pos_settings`
--

INSERT INTO `sma_pos_settings` (`pos_id`, `cat_limit`, `pro_limit`, `default_category`, `default_customer`, `default_biller`, `display_time`, `cf_title1`, `cf_title2`, `cf_value1`, `cf_value2`, `receipt_printer`, `cash_drawer_codes`, `focus_add_item`, `add_manual_product`, `customer_selection`, `add_customer`, `toggle_category_slider`, `toggle_subcategory_slider`, `cancel_sale`, `suspend_sale`, `print_items_list`, `finalize_sale`, `today_sale`, `open_hold_bills`, `close_register`, `keyboard`, `pos_printers`, `java_applet`, `product_button_color`, `tooltips`, `paypal_pro`, `stripe`, `rounding`, `char_per_line`, `pin_code`, `purchase_code`, `envato_username`, `version`, `after_sale_page`, `item_order`, `authorize`, `toggle_brands_slider`, `remote_printing`, `printer`, `order_printers`, `auto_print`, `customer_details`, `local_printers`) VALUES
(1, 22, 20, 1, 1, 3, '1', 'GST Reg', 'VAT Reg', '123456789', '987654321', 'BIXOLON SRP-350II', 'x1C', 'Ctrl+F3', 'Ctrl+Shift+M', 'Ctrl+Shift+C', 'Ctrl+Shift+A', 'Ctrl+F11', 'Ctrl+F12', 'F4', 'F7', 'F9', 'F8', 'Ctrl+F1', 'Ctrl+F2', 'Ctrl+F10', 1, 'BIXOLON SRP-350II, BIXOLON SRP-350II', 0, 'default', 1, 0, 0, 0, 42, NULL, 'purchase_code', 'envato_username', '3.3.1', 0, 0, 0, NULL, 1, NULL, NULL, 0, NULL, NULL),
(1, 22, 20, 1, 1, 3, '1', 'GST Reg', 'VAT Reg', '123456789', '987654321', 'BIXOLON SRP-350II', 'x1C', 'Ctrl+F3', 'Ctrl+Shift+M', 'Ctrl+Shift+C', 'Ctrl+Shift+A', 'Ctrl+F11', 'Ctrl+F12', 'F4', 'F7', 'F9', 'F8', 'Ctrl+F1', 'Ctrl+F2', 'Ctrl+F10', 1, 'BIXOLON SRP-350II, BIXOLON SRP-350II', 0, 'default', 1, 0, 0, 0, 42, NULL, 'purchase_code', 'envato_username', '3.3.1', 0, 0, 0, NULL, 1, NULL, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_price_groups`
--

CREATE TABLE `sma_price_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_price_groups`
--

INSERT INTO `sma_price_groups` (`id`, `name`) VALUES
(1, 'General'),
(1, 'General'),
(0, 'Wholesale');

-- --------------------------------------------------------

--
-- Table structure for table `sma_printers`
--

CREATE TABLE `sma_printers` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `type` varchar(25) NOT NULL,
  `profile` varchar(25) NOT NULL,
  `char_per_line` tinyint(3) UNSIGNED DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_products`
--

CREATE TABLE `sma_products` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `unit` int(11) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) NOT NULL,
  `alert_quantity` decimal(15,4) DEFAULT '20.0000',
  `image` varchar(255) DEFAULT 'no_image.png',
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `cf1` varchar(255) DEFAULT NULL,
  `cf2` varchar(255) DEFAULT NULL,
  `cf3` varchar(255) DEFAULT NULL,
  `cf4` varchar(255) DEFAULT NULL,
  `cf5` varchar(255) DEFAULT NULL,
  `cf6` varchar(255) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `tax_rate` int(11) DEFAULT NULL,
  `track_quantity` tinyint(1) DEFAULT '1',
  `details` varchar(1000) DEFAULT NULL,
  `warehouse` int(11) DEFAULT NULL,
  `barcode_symbology` varchar(55) NOT NULL DEFAULT 'code128',
  `file` varchar(100) DEFAULT NULL,
  `product_details` text,
  `tax_method` tinyint(1) DEFAULT '0',
  `type` varchar(55) NOT NULL DEFAULT 'standard',
  `supplier1` int(11) DEFAULT NULL,
  `supplier1price` decimal(25,4) DEFAULT NULL,
  `supplier2` int(11) DEFAULT NULL,
  `supplier2price` decimal(25,4) DEFAULT NULL,
  `supplier3` int(11) DEFAULT NULL,
  `supplier3price` decimal(25,4) DEFAULT NULL,
  `supplier4` int(11) DEFAULT NULL,
  `supplier4price` decimal(25,4) DEFAULT NULL,
  `supplier5` int(11) DEFAULT NULL,
  `supplier5price` decimal(25,4) DEFAULT NULL,
  `promotion` tinyint(1) DEFAULT '0',
  `promo_price` decimal(25,4) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `supplier1_part_no` varchar(50) DEFAULT NULL,
  `supplier2_part_no` varchar(50) DEFAULT NULL,
  `supplier3_part_no` varchar(50) DEFAULT NULL,
  `supplier4_part_no` varchar(50) DEFAULT NULL,
  `supplier5_part_no` varchar(50) DEFAULT NULL,
  `sale_unit` int(11) DEFAULT NULL,
  `purchase_unit` int(11) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `weight` decimal(10,4) DEFAULT NULL,
  `hsn_code` int(11) DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `hide` tinyint(1) NOT NULL DEFAULT '0',
  `second_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_products`
--

INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`, `slug`, `featured`, `weight`, `hsn_code`, `views`, `hide`, `second_name`) VALUES
(0, '1000-S', 'Grevox  Single Washer 1000-S white', 0, '9100.0000', '11400.0000', '0.0000', 'no_image.png', 1, NULL, '', '', '', '', '', '', '0.0000', 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0, 0, 0, 'grevox-single-washer-1000-s-white', NULL, '12.0000', NULL, 0, 0, ''),
(0, '1000-S-BS', 'Grevox  Single Washer 1000-S (BS) Grey', 0, '8800.0000', '11100.0000', '0.0000', 'no_image.png', 1, NULL, '', '', '', '', '', '', '0.0000', 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0, 0, 0, 'grevox-single-washer-1000-s-bs-grey', NULL, '12.0000', NULL, 0, 0, ''),
(0, '1000-S-white', 'Grevox  Single Washer 1000-S white', 0, '9100.0000', '11400.0000', '0.0000', 'no_image.png', 1, NULL, '', '', '', '', '', '', '0.0000', 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0, 0, 0, 'grevox-single-washer-1000-s-white', NULL, '12.0000', NULL, 0, 0, ''),
(0, '15000-S', 'Grevox  Single Washer 1500-S ', 0, '8700.0000', '11000.0000', '0.0000', 'no_image.png', 1, NULL, '', '', '', '', '', '', '0.0000', 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0, 0, 0, 'grevox-single-washer-1500-s', NULL, '15.0000', NULL, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_photos`
--

CREATE TABLE `sma_product_photos` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_prices`
--

CREATE TABLE `sma_product_prices` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price_group_id` int(11) NOT NULL,
  `price` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_variants`
--

CREATE TABLE `sma_product_variants` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchases`
--

CREATE TABLE `sma_purchases` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int(11) NOT NULL,
  `supplier` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `paid` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `status` varchar(55) DEFAULT '',
  `payment_status` varchar(20) DEFAULT 'pending',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `return_purchase_ref` varchar(55) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `return_purchase_total` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_purchases`
--

INSERT INTO `sma_purchases` (`id`, `reference_no`, `date`, `supplier_id`, `supplier`, `warehouse_id`, `note`, `total`, `product_discount`, `order_discount_id`, `order_discount`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `paid`, `status`, `payment_status`, `created_by`, `updated_by`, `updated_at`, `attachment`, `payment_term`, `due_date`, `return_id`, `surcharge`, `return_purchase_ref`, `purchase_id`, `return_purchase_total`, `cgst`, `sgst`, `igst`) VALUES
(0, 'PO2019/01/0001', '2019-01-28 01:00:00', 0, 'Believer welfare  ', 1, '', '26600.0000', '0.0000', '', '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '26600.0000', '26600.0000', 'received', 'paid', 1, NULL, NULL, NULL, 0, NULL, NULL, '0.0000', NULL, NULL, '0.0000', NULL, NULL, NULL),
(0, 'PO2019/01/0002', '2019-01-28 03:22:00', 0, 'Believer welfare  ', 1, '', '91000.0000', '0.0000', '', '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '91000.0000', '0.0000', 'received', 'pending', 1, NULL, NULL, NULL, 0, NULL, NULL, '0.0000', NULL, NULL, '0.0000', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchase_items`
--

CREATE TABLE `sma_purchase_items` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(20) DEFAULT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT '0.0000',
  `date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `quantity_received` decimal(15,4) DEFAULT NULL,
  `supplier_part_no` varchar(50) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_purchase_items`
--

INSERT INTO `sma_purchase_items` (`id`, `purchase_id`, `transfer_id`, `product_id`, `product_code`, `product_name`, `option_id`, `net_unit_cost`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `expiry`, `subtotal`, `quantity_balance`, `date`, `status`, `unit_cost`, `real_unit_cost`, `quantity_received`, `supplier_part_no`, `purchase_item_id`, `product_unit_id`, `product_unit_code`, `unit_quantity`, `gst`, `cgst`, `sgst`, `igst`) VALUES
(0, 0, NULL, 0, '1000-S', 'Grevox  Single Washer 1000-S white', NULL, '9100.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', NULL, '9100.0000', '1.0000', '2019-01-27', 'received', '9100.0000', '9100.0000', '1.0000', NULL, NULL, 0, '1', '1.0000', NULL, NULL, NULL, NULL),
(0, 0, NULL, 0, '15000-S', 'Grevox  Single Washer 1500-S ', NULL, '8700.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', NULL, '8700.0000', '1.0000', '2019-01-27', 'received', '8700.0000', '8700.0000', '1.0000', NULL, NULL, 0, '1', '1.0000', NULL, NULL, NULL, NULL),
(0, 0, NULL, 0, '1000-S-BS', 'Grevox  Single Washer 1000-S (BS) Grey', NULL, '8800.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', NULL, '8800.0000', '1.0000', '2019-01-27', 'received', '8800.0000', '8800.0000', '1.0000', NULL, NULL, 0, '1', '1.0000', NULL, NULL, NULL, NULL),
(0, 0, NULL, 0, '1000-S', 'Grevox  Single Washer 1000-S white', NULL, '9100.0000', '10.0000', 1, '0.0000', 1, '0', '0', '0.0000', NULL, '91000.0000', '10.0000', '2019-01-27', 'received', '9100.0000', '9100.0000', '10.0000', NULL, NULL, 0, '1', '10.0000', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_quotes`
--

CREATE TABLE `sma_quotes` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `internal_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `supplier` varchar(55) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_quote_items`
--

CREATE TABLE `sma_quote_items` (
  `id` int(11) NOT NULL,
  `quote_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_returns`
--

CREATE TABLE `sma_returns` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `paid` decimal(25,4) DEFAULT '0.0000',
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_return_items`
--

CREATE TABLE `sma_return_items` (
  `id` int(11) NOT NULL,
  `return_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_sales`
--

CREATE TABLE `sma_sales` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `sale_status` varchar(20) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `pos` tinyint(1) NOT NULL DEFAULT '0',
  `paid` decimal(25,4) DEFAULT '0.0000',
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  `return_sale_ref` varchar(55) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `return_sale_total` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `rounding` decimal(10,4) DEFAULT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `api` tinyint(1) DEFAULT '0',
  `shop` tinyint(1) DEFAULT '0',
  `address_id` int(11) DEFAULT NULL,
  `reserve_id` int(11) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `manual_payment` varchar(55) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `payment_method` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_sale_items`
--

CREATE TABLE `sma_sale_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `sale_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_sessions`
--

CREATE TABLE `sma_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sessions`
--

INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('562s6648npiopoa57lq7egl4hgohssoi', '64.71.78.13', 1548602780, 0x4a6e33706e35794c796a2d6831444f44625776705550656148683859754c6f373076764e6978723266683276635461336d4b4446736f6c45735f727a747a42576b316e72544e745f5f4b7273614539474e547852616f48306b64656753464e77444e7a31306b79386d6574454575642d5237585562747938444f7757656a796b612d724272545964412d4f4f7077522d39723662646c6c2d4a5f387246304c75425a366e624770456e70397166764c4a4e586d65525a63544f4b4a6e323548386b336c59783245306771685863364233506376527574725a712d654e58696966772d44694e4e655a537277674353324c664e4a737441676f585137724c55784a2d446a58654964546a354e56536d636748742d324e6b7477306f5731667a68764d727467685a446c4a6c6f2e),
('umd2juqv36em80vb4v6q0bb8ko57699b', '64.71.78.13', 1548602780, 0x505062765172486f4c4b7134664c7231716f6744414d3233714b4837466a52613345526d4d6a36684f7469674b5a692d364574506b4e30704f48774366435933744b5050554f664434366b35736236743944646c37672e2e),
('2ii0bsuvoiopoea19e8vrlph9fm9f0h2', '64.71.78.13', 1548602781, 0x667561376456726d79386b44686e3872545f4e4774683456784349744d63466265704362323263317873625f6c377a5146586a32655a347257675572356165566b6b334875384f6d4751386c43735f415f434e4e7a5a5351494a4234692d715435584e616c5163333542412e),
('3mffailrmulcr1cg16fh784vn17oq62m', '64.71.78.13', 1548602781, 0x4f5f38364231447a7a7649576b7761534d452d49737a6f3836745457445a3462773762534f4c615a48593376652d55707045417549416442794a3458444161785579575f39724a67794e4a6f356c723556776a346c512e2e),
('es245dg7ogfh3b9gp2idrj4peos6k6ji', '37.111.128.15', 1548607385, 0x6b644f4e4f6e4d74783670356636505372675a4b6d49476d5f537055387a4574575f2d616e656c513659533537744376323664354b6572647a7973726d7a5a584a5234444a717064494451616f506f664b416e2d52626f49336d31793955666e312d354c696559536b4c4a4a73747659307a693443587363684b55776b6470417852593153557a335055475473344e6c4a39755264464953584251555977775052376759484b6b6d54785f67373069747177546d393635747a636e464172577731747574644f6776305a6f476d4a4b38524f41514d52566d6479336a4d72355832647165346c565742313176574c733064304a2d6d35434b36734d76414b6d7066476d364e6f6f7554384b4d6d6432505442426567545453732d394e6c49472d57427055715741775531326a48443759693068596c3337535f5f2d58535567524e35466c5f7a3667463652584953754c5741374c6e5f4367354b316763746c4756652d72754f4c6349666c464559473331475335375a344b71446142304c31617939765f50337441446747536a50657476776f446f5a555f79486f447a52494134764c6241687530386a776c762d4275365533494f6e624f457a6b665f74355134564f6f6c3855744c623776514f4d50675541584f69724e6164776c7446554f506b666a5266614e51434f597368384539396c5079455f4f324b576a5a5059327067335f4e6a496d6654376c58356e3843566a4939547a654e43384638463442556e66307076716d43525343644139357a5f47666c72655a367562565f30386e723767396831556e53486672704d656872644677666954684642717a654165666c2d6a4d51414e6d3164632e),
('ptdsmst8bn8jh5ti2b0qltc1450dq0iu', '37.111.128.15', 1548607913, 0x2d5f41736245306f57774d59775369506853493234367851547455775f304c6c67674c4e32537264354d4b4b6d366244374861664872783377445532506e47736674696b6251476a786c636b303251457a725a7869357749536f677a737749714f535f464d393462486a73595435772d65734f4a423673645a5f74514c797a415453544e5a586752437a50356f49345450444a6264794959302d734f486c37465a724a72476d73655f446a55645171377534513547674173753064486a474b513633534856486853756f6e4f46763342564445775f63375a6d584e554f4475556c73595530344273777966676e4e5434385f50764c75784a7a796666346d3833382d6371724d5f7a575862706f3234653241584f68507548367a774366565067396e52736667494576653171475f6536526d5848755f5379443850584f4e384677394152586b65482d4f4f58563644445f41683062344348476d693378456237576c6d5554534f2d574e5546335f3064632d63713350415971495f544a33326f366c4b4a495a34384b6853547a41636a4e62675f4e7849734b587a6170422d5a496b50704d6c7a74716867776e7a506834376c5a37364857575063657a513338683354666e4767574444456461385755775f4e77504739394e38374274514a7a4a6339706b5a613865596a59475666615679627a467978784b4754685750787279576177314d54733055715f596c564177575a4247537774314f54654c59687836746d535f527177664c426630384d467a422d30376772666e346f774643764c55614845592d5070666750557651785172676348722d75536e6442784b4a2d4457426e6e5f4a433658565450466e445f30512d667070683662667669702d7148714d384f6e7058796e53755044384d574b66472d54324e54763671454f4e724a6f4c2d2d75342d694a43543852415a4f5168385f634d677479517146564532744e706245625842553846355069656873414b2d64345855327854327365706b61316f6d586a664e5256714e576e584549475065524e304d566668387754434164566b3361464b567943476f41653051776e476165436462505f646a656e724533644c427a3663702d5178625f563844326b74643247614b7a4549694f72554133),
('9ftk7d702odrm2sa9jstckt4ulbob50n', '39.45.200.34', 1548607925, 0x455a726658652d4f45613038646b72735a73744f79414a555a62336b4270507759385a5a4171717258654a396155466b6559702d334c3230424456383476585f4c5548473446384e74647669635974387a72367350376246547a494264426136722d71647279367a6a5f632e),
('6f00jh0o1brnmsm10stn9004qjaasmdq', '39.45.200.34', 1548607984, 0x33596f644e5a623666754842634e726338622d57342d53674e6f6d4c376f68534e4451335778676865517a384f7243305273614d4f525f4f53345073777755614146766e47364752684a587255505247366169544e306f66646666474974526e792d32454f667a596a4e3842653273424753556430656e356168706f5f4870466d6c71512d342d5144645a324c2d76776d3851385467302d5555694d6a674572554d6756635f2d414b7a6f2d38332d3453745956455242393143743633517a716d7a706c574e564e596c74624543574b6455484f753959494c70663057352d536b4c664141635f337968656e47314e5951486c466a55624e4766636e6e444132576d32794a7035347743306c4435624275374842327658634447786934786e53307658654e51366d38327854795034344f41336d50426b4a316a766734695565585168587046314d6c616f4e674246477843515a4c4b34646c616d5759775648357254516c49474e6d3061477a7a53677477783064333364635541546f384a3071344c5a7557797351426d76654a7458366e772d59783032354c626d4c687a3467322d30322d5a384f314a344473364d726c41716a6c494b394234334c6e79655a4379704d4241335a6961775232657572644f78567a426f756545463373465475747262724a7a30314b4539457162506b5441743973557962644d627665786270696330662d366a566864734d6b383963587564764e7839716f3578683970456f51776f5a4b68417636643543684a7857456f444478707a696c7247576f6679),
('s2b8hvh19cg41ga82erslecr5tutsdgt', '192.227.118.67', 1548608233, 0x3772706756394464434363346b65636c61735a30676f5639703546512d3975385767566d733731375558316a793147793864766c4449626d6c537a6736393064443254483259306944506d43396f43774479646852584f7036496f744e706942553130416f5269536d4d336e6a44596d57335f635239475a6176683658435a684c57366936654d727579763931426c6a44374f46537468357846414c41647a6d473259616b387a3269574666383335565f5a4238655232774e5671346d5568327a713844727a484d346c61634a445251544832654d5a4e7a4e6f6a5a446837514b5036716f696b4f4c5063584e797a49393545786c684f66697a54724975374a5465507248566531746d766a735f514c5776784a54412e2e),
('6lblq4t9f0i5g4lcnetl70bo85rpqa1t', '192.227.118.67', 1548608233, 0x4f7a72534f586d67696e39767173547557746849456c336e536150554579506e46555257755f67717758666c463750636c457a775155313665346c47703733597032596a4d68347150396647733752313238445036772e2e),
('s0hj2jkeg8ekt84qe2qf4mqirh211tg3', '192.227.118.67', 1548608233, 0x72304f4e4b785852726366486d4c6b5a7578703670482d433538776e6c4c614a37594e5241385f44724a79616d54417245592d775a4361767435735774423358764a6b476e5f4a4e70726b7772376c536b5a54625a6a4573516753345f42782d5f476831342d7a615337772e),
('q91pbjr3aojnt28ud6aa2h79liibsdak', '192.227.118.67', 1548608233, 0x4f7a72534f586d67696e39767173547557746849456c336e536150554579506e46555257755f67717758666c463750636c457a775155313665346c47703733597032596a4d68347150396647733752313238445036772e2e),
('hg7bfdprk4qsc4du12c1tb7kv6c46gjp', '103.7.79.180', 1548608619, 0x4e7749645a53355a6e336d445332782d41723531646e50794a706c4455665a6d7331627668787177426b2d696b685a673368776a77744b6268572d64315275367171546b71526f6971357075676753557362306536685a47314a6954414f71386b6756434c78454b314e376b4f6f7a4f4631556371504759413543573946326845633170335137475043563438714e6b7437694c4b4e3946334d565063326a7a414c48317a363436494b704d44586f4447487875365079796a63416554676f7233634c4b64514668756f35784857354e6c34713354622d34365643394a4337585a6a53554878736e675a6646633938673748476f4c3552615751706159545a4f413367584e70345356654c59375534614a4b31385068774648505a352d5a4c6a486979366a594d456f547a394a46774942495561506953455478505273515a635168627a33374b59734f47676a517837784555494f7875665a7336505f344f4c675233767a454d4965326155564c6778415f7831536d633463564f4a65726b6141706b436d71313070674c69445f52687844786543634e54754d62517579717763675476324c4f6f414b6e6c64474c58793746316b61736e6448356139374f466f45344a7333447051476d5a6a6147415f786f7637646452456e67432d684e7255325354514971667a33674e6756515465503438596974705f7557456a397a416c4f784752444743384e7959443036534a6578514472397864786c4e55556b64534e70754e474368664d473167653039442d6b6446783072797131796449634b5f647956546272594f353056544f707a63514b7045794d7273504e694743396937706e4f33436e4239434f78796f667267306f6a556f413676556372625f4e39456a5a5a41586156434d41755f6c39507a784b6141412e2e),
('9ofgj90n85nldlv9fhuu9bsoo8gogj1v', '39.45.200.34', 1548609263, 0x6c413972334172397457416d6d476a5a6843316d4e2d7456536d7a44434239564e2d4e6b59724c316a6f5a766279344a485849535549505a4e312d48665a4832646d6c4972534b47797630515346596752645a64743270547a336c592d5a586632577a65364258624d48333150775a7974484c423046616855712d527a7364754a36676131566759715071464a56726a304130373162576365364276624676467079747244414449385f63572d30376e4b746e4c4a2d50737a664f70445f634e436b6f4839745165355a2d74645a4d5572386f45586554635053733954756a4b38756344553974494d5063326332445655467674785f746238674b41716959526a704575346a57415931676e444a75375954752d36735162634e594e6c5a696755614765623636674c79716c43526c653861754c32377038787a79315f4c393453463831537971757447643349436b3972324d427256344342777a30484f2d64436968767a6d3357623834706455683278654d57516e486366752d6446336f53534f5a6548654b65385132453369795571364c466b2d54437571626242503079464b6c796d6267753551784566633445736e666e7450436f596952323544362d3371503545356b75324a44476f736134544f736d6d57483969747371584371754956424e4f7247755a7265394757535f7563586c4b37796b3844424f376a434c627450324631786f746d32484d722d34424276764177474f6a55733461737879444949375a5132674a384d78496d454b556a4f61784267626f704e5a3871596b6d795a334264586d70596c3154597a2d7a4e336946327235364e364a726958454d7448427368697a536654475646344b684841574d42646d354c58366846453743505554392d757453694f4b375a502d4452507450644a6c2d4a6c6b55562d56314e51713332384951424165415a6533627a4b4c562d774b6d727330654c7755354c656b6561785259706d4c334b6470594c384972366e326f52633234376b534a5869725245694c6f68627a6e49446d38545a5a68515757473350487964474362534f344565765a664f2d3342757041313936634c772e2e),
('76u4l9n784u5nruejqv4akpfe2nqvgs8', '39.45.13.251', 1548609264, 0x4d6d326d385455514f6d437565535a5a375568645f6b34634351637470355a704879484d7856534837717a41786b614955473863756b4a616155766a5048486f506f733553664e57626158696c5032443465524b66305366356b684750645058677568555936744b695279724a3636525751706657744f5a784d2d42717a636c586a745732305779456c4f69422d637a647339754a344f746341415f7558325565316e6c45347a7543332d394e6f44745257673038784472556e304f4d78385049643657473459456c4c31766e737a7a7a795562484e646e346d635f6b56316935695152636d443154693732567559755f6d4265424243714271663271706f725f6c794d74707746507837656f476b674b4870395664775a4275635a35306f6c6358624c347a635a686c76384263482d67322d5878336872656c49693949306f4230744c5f725f365162496b5939672d4535766764644e34583163674269437859755a6437685462445a765834756438345770314c763664355962374a314d765853514a5046394e6252523450333574574c485565617333704d65614b694743415048374930524d39475548764e4e7433426875694a4774706545662d3656507a4c4a467562376f66446f5f616a59335345507436327174636f7648786471476231436b356c7450773641645f6f3044672d695f4936663873314e6a58656d477a494f517439475263376c395076434975783567484650524a32735767466765775646304661574f526363746d62436c61375a59565371727177746a5a54364b),
('8b0vbf4bieafs2v433ne1tgkqdmaetpa', '103.7.79.180', 1548609716, 0x49624d6e2d526955473359646a7a61304542786871516172574977324b4f44747359357873385346366f30724a396d505f30417a314436437942776d726f7465785338414241367676766b75634f34596738534a584f3069345644534e4261724d57386e766863677a75424b354a623556744178414a70564d574f43556f6f4a4e496950445a464b4e705039456b7a6f614663766337507a75435365676263673862716b4966776a33704d636b5a5768383332465f46337562544a79544131714859594a6646592d79425162783668424c426668536d306f644f44705238446c55416c49374938686e574d7a584b4f5a706b38396670336d5456755a42625768496d4763425a5f56424f56567752644c664e706252387063626f434d59513876307366527134776f56715a737a5736783435724a61537661594435304d71303246426d564f4578782d386e7a674e456236435639624e6c785f73426a79536d304669655f3352434d676e51504b5164746e52694b37742d38694a467374436776516a635a5236695245574264477a46526d673775307a584477366d6c6b4c642d6c53536549335f4768496979746447586a48394436634159717475325037367764445f61476642724177706962446631624478685750794a44706a4b4c475337494275716268335567413753785a355449414d69675342397939564f356f4837545655473842677879416438716e6f6c424363424c78623632554255774c324d7533744c336d6a334f4f4530763175573279743372702d34625559574b416c33764c3279704f42675467647966506f78742d6e617547664764594d444267544e6668366c76424f6f31796e6a6b7a6a663439636d6d7a6b364b4276384f784e7750394877756e69464f34476a5f705f444478494d4d772e2e),
('6ilv9ujpklc82bvflnekrjebpm6rl94u', '39.45.200.34', 1548609668, 0x7a587764794361475163626a34316c36594876344c4e2d6c4d714c4b7a6167552d6642364e336d6b413656704b4a3553333456505836315457476d426f6d52306665365757394c39623630354b6c50326349624737494b6443637343375a347839304e4a4a3775644d51706a71594456476b6d334d3058527545556f494d4851694a75776355773165516f725f30665f384e58332d3073774a617a4f71537949487249694f486143635048313653744957673767572d736e595974774d58446f65666954597661545865705243556c684d4f674b767832576c626738695a334f54594e333351477254317734776937504549494d6d6e746a7047444e6474693548566772796257324e4347473559454f4a645973572d316274386a78776a754e467a332d4d61636d68304445734832414b707a71615966446d694e57764a5f3273773553715f736436314a2d59537748664d6272784b746b72473076786a747479502d635955563632727538376b417a51497132443265366641377a4c7979476c386b4f6e555867725077677931747937655163767439696b6875537964397532465a427a796a5550646a456c694d305748646b3835356d58494f375a2d4f4a43316f7436686d6643304a5250335a364e6a516865784341616f414c596274655f536e77576b2d5274736d77347150694f325f38445244767964374870735f4e765f71693267554870423478356156304246315a466c5676583835465f705f746a5678535371525a636f7733664f7135654f764a48386c5467416e4463756a39),
('v0rv1fgj4sbnobpl6gpnee8gs64gb53o', '110.39.184.10', 1548610742, 0x54684878333555586b67756857786e4169696f6a3553625438445237343455364148447850524276797769304367507a6267416e3972776b496936616e734f7a305835504b4f6b776467774c784f4b694f64614f486b4f5449316b5f4f423832395243314f6c4c6a55356e797743764936685179395a4a6a65357a514b784f78766833666249783531716e4f7545724551464b456b414855796e3146494a33793756635253617848594b336334524a6e5031516f526a4d53373541594e56525874784e6a51597573535372757a44366a67446f614877556c6f6a796b5a50715a586b58704f5363514457584177523637674f786c4f2d4b717835755730766630565a6d4b69386c687a587771345157644c6663565130784355436371615471344473364b70784c5046734657735f4b516d4c63474b77755350474672676c62386e336c566c43765f784e523742467033765448546f52746f6b3744615333324743743738675872666d676151516a4a3163656f4b493959654a4573726c7058357a6d59686d4442626534305555454163487256436f4e467470475334654d522d506342426d3270713031663632566e494e66347974344c335a394b6e3372567954344462514359634766627675614752567a78455653544c6e66562d7451416d5a4c4c6f346e61365967794d2d313536316a4d396a656a356e416437666b4c376f4f6776746147357567444e395f526a30765566395433746b7a4255674b6535796859796d50474f4955445168306e6957682d305534516147613343726a4a48),
('hocg3gu01vh11n5honie52u6d5mdebt8', '103.7.79.180', 1548610017, 0x3364392d4561765f74724b6279554d555439336a63536f6377646a63376e686b6e5355345372706e4e624a577636634669446575544d42697a727938784854364354715f534b356b4f595636796a6d7543684d733774574f66765a58794a364a334b6536485f376e6a657a5347615258616754544a724c656d4f3274526336776341457031716f53434e31574676765568704b695f65694c59395f4a554965684e4670646b31436b436b7a37377932694344564142563442362d4c3955794d3578546930766638666d6c5453626e654858536f38686f675f30306648427569487069576c6b515968307851516c58796f6f4477775237365047484333446a4c5264547a4a38566b644a7a764654573972684c77626e4e4b4c326962612d4d49735a6938616556416261367a6558697078492d6932374165514f646b504d714d3148417954536679505462706e6c484c38512d504445704b41795a6f4e6d5046466d43594572504f45702d6d54494d485566385f6757335651675565744a504a6931546d7657655f7a514a6d5965494659434e57736d3551324e36326d764b7a416167356b50786337675863445251513658334c614d345564794d446d47304f4e6743524367574671544543775941635f306e6d5a46583366366a676e514d694e30767365556c3136585f34636155354f714b567a373955534c6a56736f65745a513946684d6348454a4656695768487a7a4b435a7735416679775a663964527a74443445327369396231466e443777674f75736a4f515745733471744e537a426e6f717548754b78786b6a64694a78494967764b4e674c784838685a5659565a37754765494746306d7a704e33396f3249556c4e7350796334497a55706952395433464d715a547744643739476e674c314c5043546c31533178524d3663716f465674455338324838377a5739554f483172337441437950512d76306c4a3978384b337a4b39526b72454f33542d514856515a556a6e743152525847365f4243316167725431425a7467574a59375971376d454a4c464e77696e5642735475686d47427878345a31362d734a45726b4b56614c3738512e2e),
('0ahuk8i65197mo5sovboepl297ds17g7', '103.7.79.180', 1548610182, 0x4942306d746b6c76675366356a6b594b4d63474177357453515865464e596d366a5937526e5a545661676543615439665269504a502d45444c5f43786472374938647066475a504e4a7a673252756a7076685769474b6a56674a6379346b436f65504d6348794a6c787156314c684d7a37673153635f51746d354b6c764c314c6d796e396b7a432d36726c37616d31656f684c75665157576656735a484a714e705f4e76304a777673692d70656c572d4775484c57705347463447476c664c6e733052626a4c63594c4c303276525670535943723059784850623150575336595a487674574d483373724a786d32717478635549754a36486569705f7a6e724b64322d43536563525656354f5f73355354554736576a77757730454e68544643726959516244424670486f5058725a796966362d4b39534b4e5a6550694265636e47374b47767469724a6a4d61627956656b596e326d48736a77456c70485f4957674a75304377537a614330443070614a566a745778415172516851647a5f61546e386c614e59694969526a38336e436736517173614b5f4f4b4b4b3036662d64445f67357853645466426875582d7a6d3874543436523278617a58424a71664f616e4b796c7037316a4e6644617741476e5a3139476f70685a6c456c596138444374557866502d636e4a41573177636f6f675944517045323871727761683573356b7a70596b34686e4952535750654d7876314c6d6f4e4d526a53766f476d646e4131463532574f6f523959774a756f34527a6a465473564e4b443768553449712d6b35544761626e37687a74656959755f7233386b4f7638445975587a64367658486b69576f6f6a67376d4368656753496e77675f4d3975615f3979577553324d6941324f337748766938454b31334e734f567a45356e6573307339444463615264356b696943534368386d6e4833483569767476325f576d5f6d415a36697a56734c5a513232582d4532534f5463716e465a4e46634d6677324777694f74364b496f707873356a4f5a56545645614442544d46585861652d4e485a6e386264506a6d755357785947557a7262557a54476f39772e2e),
('83psmjnv89tglg91613eqargc4fo05cm', '39.45.240.158', 1548611083, 0x6d374479385737443246314878676d4937696d686b376e74424756504173447179516455487079345a5273554162536256326f525450436d48685538385061424665516a6a746845627a6b49754942787a41527a70525a6967742d52567a64385f62764f56646372574d5f6a5f7933763956486a58462d4a34625877426d4252726c506746436b48566e557543414b4a52566f726e44456376775a6b622d6f57653946684c543049356c4d364a506b456c516f594b47434a595430654d375f6c5736627158594c35326f4b714b4c4d6f425a65635448654d324a2d665474763776365533616733496b5634685962383935476a5344783050424949733068464a6a5f6f68465231563849513847394e4c62506268355872337042784d787338376f64687a336849316e456666627954517265724665366a4847384d5a4d54445453693565424658716c61494b556474517837435350426848787734434a7a4d6e694e4e62474951366638775535335a6241526c59416678534469576f5756464f4756305464472d36595a7332496b354e4a7974553148657131595974575447556e726e56444c4742544e2d5a6a784b5a647a554758364367584b764a593535717a49656a2d7938325a327977436d64344345384a6a704e4b4e587854306444354c4c536879493453746139555a536b7637796e51426c2d5f753071644b724c5a4357426a55526e5f5663353467636c5576395757744e396f5f706c346651503763774d425a394d364641746c57505a6c58797a684f6e4b7051724d41324334756b323362574a465465463265333444467149477065337551656e47724452736b4f6b4a4f565839796c757a304b694c78562d594c7a483642377a3531492d5f495a6b5842426e394a583743346155732d614a773648412e2e),
('6s44kv2g9u4ps154ejlg0m66m97fr2mf', '89.20.177.147', 1548612665, 0x37575a4648486d676b414658372d64596a4b734c4a6f4d38466546384e6972596361434755723936614c4262444a764a775372516853623452384f566f65503656334a684548526641354f695a66614b4e616d6f7a7338546d54353273336a6c36764737314867505459454a736d5a7854377579777257416d55366634667a316973357a62477553436a5f45394b53795f686a62494d6c4f5152325454537857724d415f4c394e3148496d736b66777a4e4b3173656e5273554c594b616a6d5869366c687a626950725873376855796832646f6d31794d503735754162374330336b69467073513847676230307a2d774275596a5f58784c33696e306b6d41716a4346332d4e375962644132493964316530477973354b5a6235786e716d4e57576376644b6f5546635a6b7a6149494b36575a524b7177554a526f72644f67653359673764443239553445495f4937655448592d58316a45455764574c35526f74543670435167654730425048703759626668717255594567795f4a4d77372d724d3774336678516e74554547766d7779696c5877635076385f423872767265536d71794f4f4137487244487373717a6b644c62776b77587a46746b65777a4d4d7039686b7964306a4652516553724453597176765237336e5074477a4950455678625a32726359547670476659476c4e7878544270664b33536a55455431775a484d55766f6455513536506130564b3951524a55687a61646f7234617672755f6b4b43714b3056373473597162506f467170627372495a6f4d566f6e747a315166556172654f6a42332d4a72564c37694759507762505a6f63633668456b427837426a477a39785f472d5a4b5654656e724359576a5f5856674f526c38685955662d532d2d4564494577567a306947336b4e6d61512e2e),
('gr1alu7ue72n68gv5itlqf10o9aqrfdi', '192.160.102.168', 1548618282, 0x534f722d337878625a456d47376a4b674a343364745a58366144477a62763355556f374566443636394b6e51746c535f395a4655775474345f6442573259475732566a47393745384c5a50374b322d49556a73436f6a796935764f482d61366c512d717659745a3564495664707858534676425039772d4252736f50623732534930545579746d766d575742577a686a6362696b6c6a486d5f497638316d575a497567436151676e4c4a6a63496c4a6e35336d756741444558613630735959654a636e57314847736e4a7a5663574746374f67434172596f326a6c344c5346456a5f59617562337a5f665f6e77376c462d4c6862545f766c4c2d4e675638734e),
('4actj824mg91t1n029bbqt6hi49de04e', '192.227.65.55', 1548636892, 0x4233356a6b4b64447a63635133346a67636c7849764e4e33577546676f6c366e445050357071727532784b714b3236716179364448536373526d764d6e3065477a37596f7a4c4d736a4c556a574846684971774f635f526648415a6b4c654462494368664e426e7a6e4b395267774f4541767656496d7642685468315232727432475a7a385f5f52564c434e44726c364b3468534577735a75536376485547462d5f3870734b70684c546251726c6564365030354756784434795f56425039335a72476778444c47674f2d4f3273655639704e77686d524d6f6f7061705a46515562666f4332716572455a462d356c386b39325454483231696d4b68426d714b4462386b6a4a4c724f677132496b59556355634d347a4f354733514366416252744d5f385f536270654b342e),
('u127nh3crb5rackjr9mf4oqe8fe01g99', '192.227.65.55', 1548636893, 0x577855417850305142777669496853334343696d32705255564f4162557074366e6c567268785f675371485f7a3048557364444630713757726c4e67624e46486f4c3445516e314749776b436955592d3145656b6e772e2e),
('jlqeq185g39n7j3cgn66ps7ua1l02r8u', '192.227.65.55', 1548636893, 0x4563504e2d7742444242724f344466784164456e49794e356e2d476b6f646f6d5a594862764f7a6d373377727650594664696871655f7949704e786b796c4d474f62793548665945497642755749386f77712d41514b6659786f386531754c655137573042556b52754e382e),
('p09o3pefm870ni286a817dld2fgtm3t2', '192.227.65.55', 1548636893, 0x577855417850305142777669496853334343696d32705255564f4162557074366e6c567268785f675371485f7a3048557364444630713757726c4e67624e46486f4c3445516e314749776b436955592d3145656b6e772e2e),
('vkff0gg7jr8fpglcik349q7r6ugfucmp', '137.74.169.241', 1548639691, 0x3333724f795130713479526c48684a776b333456346132774c6957554f34354b4976645837462d773777426f684f6c7664613178337448745441707944615741724b626f2d77325468466a793970724842654e744f55426c494d492d6c52775672555458616b4275687a7475576875784569514d714c33662d6736486835567175694d5f73306e683779753679326d78676157383142597232363964427a323932566c77486f69564c2d7676783446785167536b66344666366d654a676b726265356d7567667a324e4f3930374e6d564b575245724a786a70677155626d5f655a75386d7755544a532d4c5a685a4d6e754441684937314c745152722d30306e),
('uopidevabmik1np62fnsvhr4mipf7r7j', '52.53.201.78', 1548641825, 0x6744442d4772744a6578494b543162714b514455355a7038726f772d39526d53656e53517451375a6c44315a67783658636c555a42445876664c50736b4443536d30485a384555304b52594532774a7a31426f756c512e2e),
('bgj7a71kk5db6to663c8e5jmc62pkioi', '52.53.201.78', 1548641825, 0x5672444e5455755a38656146736f7a647a4136484d44646a782d5f4d594b6d4f434179654362356c6e426a6f796d694a67653631634c587870596770473537466669635974302d69485572574674477a794968576278547755356f36795943364248567576662d6a4a4b4d2e),
('64n9h34fdj7ijji016mlctbljpkagsmi', '52.53.201.78', 1548641826, 0x4b306d383853364a707351374333415f34764c5673774f4b473946334239566c5158463341416a6966744b5a44786e7849587074516b6c6d4e396e74777a767a477647687476347475377676653953323262793078772e2e),
('o0lltoqb1sjjtc7lm0sldci83lgfjbmu', '5.45.64.76', 1548653175, 0x56452d7467716f35316a7759444674766e3768535f3370503538497370714f6e42687564676359546135324c614430356876524778634f6e725476724f4437414b4f37484b4d5046436c316449744853565a5a4c4464476e4562626d73534967747730594c3670374b39452e),
('rdmsbghpch6svboif2f85ri17v9hd7cd', '66.102.6.89', 1548658453, 0x586e715f654e446575674f49717749416e326c634f47785833364d785156753151435a677268533456394c64517054344549454c2d2d305339614d51646c4357474d6a536c4478755171706a70345342532d5855315f516d7630536c2d45333530475468536233365833367176585251334e47413969684d76315f7964456d6e77575036704a413678794476752d6a4a744451766649425f434e7a6a716d5a7756504a765a5a684475473353737337784d535965796e614e726458774441532d6f764a6b4a556e314467707763535263304547787779436a386c725172534d4b6c3932565f6932695936363030526444325a4d764454734d614d55595345314f624c41475f6d2d67363178796d3765756e6878357936374e36674275526e50385a6e34744650346b4a34554a436d4b2d684b695847693670554f6758344750744c516c6847313563424373676472756d444b36336f772e2e),
('b6udfrltl1um3pu1smn9umeiotu7drdk', '66.102.6.90', 1548658453, 0x4832384c5a4343336530777978723261694f5f5275426753374d5555754c7a477651555049745344613445516271505a682d427836446b5f666c68304c68446d47654835526c4635454244304676507153426c6874772e2e),
('h1qfinhf7blto1gam6eovc05lraum14l', '66.102.6.88', 1548658453, 0x474b55582d4c39724674347a78675f76334c5f4269436e72343475586b677a46654b497270594f6e4652463834474b675f38775473685f77534d6336355566664b30324e726a362d674a6f395a585a6b4d5852785a6937684e566c4b3530314670716479307364587a7879437462746d4746644466376674356578537636454559772d49424b396c49417976444a65674e356f5a4f346e48446d665f647a35546c64586a68697075475f68397031685478314f656859544d76724d75576b2d48716a4f4a6377554b4e74364a50557848387755415863723256774a5038494f6f724a6d316c724648397a4b41314a7a416553706b4854345779784a7737735357656236587534714d6f6635597a6f375449553259565a726263774a4745387a70573476486b3532476a59412e),
('7eb9v2hesro2nh1qqsrsv2f0p5jin837', '66.102.6.89', 1548658453, 0x48436172425530794242646863496a564449454b436e4d536b775761585046676f55444d434676774b44515f6e585838596d75774848775a536a496b62375953536f6d6b527642742d6b68573762394a65664931664d33566a38423069624559734163715f73396a6636452e),
('e8ah8b4j9sq3cj9kcvrgi40alshd4otr', '66.102.6.90', 1548658453, 0x39764454515170594172556137664c6436476476366964684e7a5848745655586b4c4264384947456c4d63306972686a6e6a645f364a3663665349364a664c58386c6152365962793741506a463339506b5043346779684143774e64357050366c6a757754565965616c412e),
('p36caf24j00ne4t21m90pg2tmmpcclvu', '66.102.6.88', 1548658453, 0x65486936504f4e583255616c3352626d7136515276664d6d43655a6230665368346d713742785966306f536b6a76536d4848567369306751456749324251334f6243746a72374e534c6f4d49595f656f2d566e7446412e2e),
('vc4o7e549funvjc5k27chg84f3ptt9tt', '66.102.6.89', 1548658453, 0x59514d714533744472465934727175546b696d7a44563066386e6b4b4d65463666774a5a636b5935726244384873547a4c325f577a2d6e54446b6c68684e72636c5174795967657641702d615a4542677571487055672e2e),
('28karf011msfkba0otgou0l5h652n8r5', '110.38.2.90', 1548672755, 0x494b514a3970764472516f6368584a6e70614f3844526658676a4a3450726163616a3349715578594f506869544e58534571646e6b6877552d664f505038756e44767074647951496a583777365452547331464c373965556f3959497a3158654532356d6f4834506363772e),
('6au05bsf4q5uk6dmn68rick6qqskdf90', '192.227.67.55', 1548674741, 0x4268655f49765268452d50334e455f6d4a7547356a4141785750354f52456878593070686e396d624a53482d43776930555763684531506b732d5432766a666c70365469756e4c6330474539794338636f39627a5045644141677535437454495a784377674a6939584c4d364954594b694b35446d6c4b6859796c562d63507447385a5776313057534d2d64304972773343676979374448723053366d746d4e786d66587534547733624b3543517852626f5f6a5f6f464c796737706a634f50466262554a7a714341326f57504c6b69676a7a427679366475455149493334424375596c477533326755662d3368444656785730744b632d6554366a6439586f57384c3478786d67384535304b4b4e4c5f57596b71464855644f7a515430617949506178583061673858492e),
('bv7fs4kgctabej8mvb4420bn2kdhsor1', '192.227.67.55', 1548674742, 0x5456464362575031354b477031304e67334c7875352d4736687a4e53666e6936614775524e7951714a34554e717068363831444f325247414b694c676769374a336f467a3133737245443642547959664732756248772e2e),
('kun16of1pv2flflkd0uc790aq1o8jklm', '192.227.67.55', 1548674742, 0x6c67616e654734446c66696f5f72684a6f5a52524c754151796543586834514a4f6a6f324e4a45764c325845446f6c4f593245516a755461486c345137753466486c6b5f33366836696952596c574564415166645f6b46433461654e454a3741597535596e78702d5533302e),
('9991dv2l0lep0m7spadn7i11ofu8acu2', '192.227.67.55', 1548674742, 0x5456464362575031354b477031304e67334c7875352d4736687a4e53666e6936614775524e7951714a34554e717068363831444f325247414b694c676769374a336f467a3133737245443642547959664732756248772e2e),
('04ce926bt385b8bb0l5u8pgttdh76b8v', '185.220.101.53', 1548677551, 0x523648485f705757376d6d356a4943366c5f4f6f4c6f65447078355564666e31555446536852624341447a5831514c784b7a6b42314155706c41786a687579665353544b582d37392d3344754c526e5731766264665a33655636696168446a4f334b61336975382d4d6443546e714b6572514c70724b715a66635569734b4a6b597444663036426f6a64425161744c476c7951724d35464f3455774d48567a473963333377416d5a47476d3077414e667862666634387a6d55585a737752683441424c6f70515874716e737a4463794d7266726571477945734b776e455668335a6d64745454304e537a574a576957546d6d4132476565534e46354d352d7058),
('kfkhprje6o4hhkesg423lk5f1okd7s3h', '13.57.233.99', 1548680456, 0x574d774f4a6c626e6447686d376661344a6a5663544d4d696336717349587641545374775f6e476566525837585f616d4e677a5946494f7073486332585664337079504d66583754693976614c4633745577394c71672e2e),
('a8l48h5f02av1fverjrfgd1vp3eesto2', '13.57.233.99', 1548680457, 0x6d4a51704f367745564a455858794542545f706b3776676a6d6d6e78613665654f6244735f4469446175506e507752554630354d3354786676544d7a744f78635a564b52484b3638476d557461595f73726d5f30465948692d6f4f5357717470675f354c574a6d354239512e),
('saimfdcp3ftjisasr78eol6unem2ponn', '13.57.233.99', 1548680457, 0x35566f5a645a68424139745034735a335631515237486739637a5f4e5849726943515732445258435544636a376c64527735646f4b71374b5f737973454d394648624d35646743764f3559457137505f4772453834772e2e),
('aj97c3pcjmfgfm5rbmmcibbu3a9h94ab', '137.226.113.27', 1548686130, 0x5148504c503754626f5453357a6c702d4868346f396f2d58436971643336537a62784f312d44453278736f6d7a4d75364e306a6278366270473846596a5a5366634d597a6848577a65627469514765345f58545672512e2e),
('t517n3roius368bjche9lddctk1hb32m', '137.226.113.27', 1548686131, 0x6e3857485f5855504372687473366a4e4c2d777359776f735947615249694131524e7839376e5239726c31304937784150625352644d633042564f74316f494b544339646a4d6369416e7631446c364c4e38615777484b4a686272565f4c304143304d74593834594553452e),
('574r8m98ruednethjhq8jp9lg1j604a1', '137.226.113.27', 1548686131, 0x4932704d7261597951327a4c674a4d73574d50463465664550504f5364337657704f686e42435663314a69675352517a59376c5875367a5478524f576e764741574b305031666b6d3074757a496f4d764d74577269772e2e),
('6ful2irb2tivd491e5puft2mubt7itu3', '178.17.174.196', 1548686788, 0x79344a41475837756c4f74595f6236536e4767744d515a7763516f457a684873435964425a514e7669484a59484d64316d6c7265354d5654625a374f30746673566e4e533866694d4f6c477855317556676463796a674a48514e387353764c466f6e34305957783443765439657a7a4759796f3033796953686636384a446e7a393764594b5343434a6c5044475863435a5533476b51635378526b764c664b4b704a4b58355f394948546d554f697367354c6b494f71674e48546656504633313658736e365258325257385a6757566e567568726a4f4f36477871334265716364684b504b33736633427465574c45396c76536e76444a65556e56465a434d45),
('32dks3ii31rl37009tn4vkqnlfeabj99', '103.255.5.113', 1548688322, 0x58457358545a31356448576d4b654c4e4f7a745443756a5861525f6d7a467845596f38717963747736735a39373331497a326161355851764b5472554b35656e725668775267634f356877715a53754a764576746f43472d664a5a303856744368706d735279365134303538385f414a74415f5a4d624e5757684f6e375a4a776d6553413863326663544235746c65617938552d5a6f5932566737537653656e4a744a36342d41305955657662646d736c683468715941744d6c476d447345735a5643696376676a46457570637a774f577276496d4f6a7875654533536270346868674d58754969455351565f63544f34556251424b3044583737642d3770365f4c37664f5934484b643974576b62447163305831512e2e),
('vppkb3bvpkvc9augjm9jfhd1l286e882', '103.255.5.113', 1548688605, 0x2d4964307056336b7237637955564672566461466d5a4e47464a633874774a756a7a6865484c3264786d587a72524458636f46585f4c306a67673551437663436c6b79556b4a5476346d65703939703867644e57516942416335525a4f704a6e34325659674f54726c4e444d673163666633764d6553794f374c5a64496b32506775315f75734c777a5a6b47336c56757177427a4c6e6e50344377394f6944764e706436655353367a586370676c73416552764d55774a5878764b52326e5f54696f52533756634476592d303942766c69505033736f4174682d30474a6159514c79654b454232464c4c376f62772d4b774253366e54587a3347476c796d4b6b6c4c5a6a6152614e4734425877505f5359346434624d6843454568544f50487950636d535153683949684d76615573416635555352496d54736e496e4344507270566937496e71505049715a344a71375643436f44336d4971524455325f4b576a7856716161575f6154415a316a6833737239504f37484265365f5832354434736f4e375441784232417252476655483130656b4275352d684263395168694a752d775f4f377a4469395370674d696c466d69692d31534d6a495a3768787a354a6f68796d505a77784b79693643584e5a7153325f576d5a7571574f30434f7855453442334f4f626d3349377a4d6b6336796b657143526c4b6c69744a6c624734676f4b687148344e63484a387139736d6b6a6b39307a765765467a515a56534e4a54695a4e796b745039786372553178774e6d31365363414a765a375857337a657434466d4867706d457534706f5438544f795838774f583975665952636c4f66594830425f64484b672e),
('q6hbl6csmnr0pfpde9tmuahr7qmigl5h', '103.7.78.181', 1548689625, 0x55757155326a43346e796d355f703449414152497175435f457a2d687a457462385544513833557a6c4b5177586e307675797046696f686d456379513076766d36634b5551506a695a7763576d5f487264366f38412d30513145507245786968664a497254535f6843497559474f545f726f4b7a445150507a4765524f624951414256676765434c454c544375305337615434765261757a654e535a36374f4b6e696f344e506c5f317548696e5a79774362664d7550456f3868314567434e7a484b4e434d5a33645167745741516237465a48574751313067677150653639334976644b74307a61756d63516661714a4b74774b4273334454575968616d58634943726a4671314b6a6f6356364977325134596f49595a445873764d545243446954687559485158677537596141704c713735694750752d72447376542d437061554b71664e6c596d324865714934417469735447535436786756594d385545655861635673786d50694c5a4e57624f564f2d34424a426b786544616c617354595751795461797958613242657137733555693463727162616b334d6d506b434377634b5146684d3076643938433578797874353349516d6f4c57486470503565635a4742365658626161774b514b3031384b423438594d56527845514342716c58673543775259457358447761764e54466a3832545457386a4268386b36725a71744b735168704e426e686d69666f536b364267372d717a546469507841776842352d4e53767369724263415a6c792d516a435f794b534850496d73787a4e),
('ur8524dam21uh4r0aras7apsh628vdga', '192.227.114.197', 1548690038, 0x51766c663775736c6a346c74654242346266587254414c794d764d62696770515f5032333659745565616c773453613746564e49544f4e52482d37334a495642516d3277376652746c432d6573524254637756705953505331656e367259725878346362664f4253734a68756e4c37722d32696944754f74414f44446d6d4955344845424f756d6348586c4c4f7444647142534b6d4f4a526f353775657749534735463434676f71634b41497a6c5f5636474c647039316e416b35676d31363363317346426e7731342d2d4331556f435946546b786e5852394c3338657032466c4b77336e6554656e56456f487753695433436757464c516b4e5f4975536768387a6e5266796943415f536d317a78506b4c6f4d396f5662636b444e726741772d55582d65514e566458452e),
('sghbcoh0abrfipm3kgh57hae57vfpq7d', '192.227.114.197', 1548690038, 0x4173454f5f61737375484c5654544b425877775a3731364148784d346b544132565a3758726667626b7438625751343062776c69733075536869316f574b4947396549754f5f4b644363423461783152714d55706f412e2e),
('r3dn0tacg4bavb266pslqbrlskif6p7g', '192.227.114.197', 1548690038, 0x4532447470735643506168594f516d5134746a6a417644534e46444a2d5f4b666c4e537836624730417a306a39326c4242784433545150516430653061435f3574486461324c2d7a553942355a59305465304e6d374d5f6667716a4247504e6d6c4e626d457a67395261492e),
('bqub1e2sds26671n5aa7tgljbe54iicb', '192.227.114.197', 1548690039, 0x41757156644e4f4b4b55585433624e4d4f5778515445784f4276474133437549675173487a6557786b5947574a6c76526147373545733762625237313532485571765541537135454c6964477539684654784e5650672e2e),
('uqh734t8ag2pq5e5bo7c5ttcjv7066g6', '94.195.109.14', 1548696194, 0x4b7642552d7546334a4e47355657716f6675763267727072632d6a47704875664278375a77686c4c45397a6649493070706853535a746b7a6c497a3345314e3658364e535f35656b4e327642573239344d356841753562474a7755304730365879687039703048644d6b672e),
('acbhf8ogjp7oe6iap9t127q5nlof06b8', '39.37.150.39', 1548697076, 0x636e66754f704a4674437868745a6a554b4d5f6550427a726b4b6468552d66704f483065653057346c5a597479354f7734515f7630646e6f6b4b6137346b5476686e777063634c5338732d594c594d54444b564434596f3139577830745a727679523067315552774953302e),
('sj18dk8em7hv8bc2gi8j8hr5aqshemfb', '185.220.101.22', 1548708289, 0x4a505964436d71566549454b7a3950707568724d644d506f7868537451616365543261756f41516a4c7865565f3254674e4c416737557338444c304333697a4466356f486b54796c6e5278376b37634c795351722d4e5565352d68484741566c66626a5952317531555650592d76324d6534482d4d666232625454313852314a3553414855756f364a536e626c45503934725664735f4d63467745726c396369537839344a77636230654e7278614753714b32494d4f6a4f5f494a3566726b46736d30386f703345346c6741504e384e6b67396d6f7043467934444d6c62737446686f39323978777346575142534f475041544764503065384d4343466e4979),
('f5tpg5oc8r4f8k6nqmj5pmuj66fmi95u', '158.69.192.200', 1548710854, 0x4b2d38564a7439357a483549436c7633637466597675525a504e3574506457543367626553524872663669506c696f6f37656c68677834516a7878397448787a3457717333634a6d6a56524f37535a56416b75684a6854677150514c6d737a56304e5478454c482d547a5939795f356a5f586c72373274564e663773595453597a756c535841594f457a394e7851556c5f48307350312d326b514a67426c486a436c614947696942476c3438326856346956674378775037756a337747366e7076475f53564e3156326b59686a454c4b57334e414931684a69716d696b443243736770573278725f6c414e38526e4e573544695657656c62416c345153443056),
('4slrt2bs7oqrebc15vjakspn6qmah15a', '158.69.37.14', 1548720110, 0x702d54356c643879396f67384d6450684545506557687557594c487131636538324e5a7752644d55674643575375565f6c6676784b795f797979457448584b5f34616278623076304970766d6e396c4b634f4f68597a5a31486a596737635658587659466c4d4930507761615870727a585f6f356a7063505f4377724574665936436348567a6f566d78685f494b42456954624b4e373033377365445a3248303445506d5053425f326955623649365448647677484d6a7a7042424c3456594178757052754249564358767a4241306e335241707655767776756758435a67714f6a68696d616c6a575a396a42792d6c5749346a465841767858484d614f5259),
('udo01b7ug1qh8pg4c44cbdmajdrgsghm', '188.132.176.2', 1548725221, 0x485477586a63665569744761314e543756616e394b436a4639365331615f344b6469624573564971334c54755757544f7050524c2d687931593245684461497236457a55514d6a796d6f54525f5a564b6f6c494534377274727a7862536c645f46364b65416e62785241674d7336433365777335546b4852355f3157736430344f4a4a514b4a6f4d7466324d5437754e5f6d786f5263436553645242665f5662715a586f46754852755f7959556369386f52626532386d754949696569662d7850627378463934487769656d585a494b77615463686654525841624d6a4c497a4b7250594948573966444d37385837536f537941704c72707470533848427572),
('163m2n7j1u3b20dttducuj0oes362915', '66.249.79.136', 1548744551, 0x346e5375634e536544394e616f497074375a68766b77616e496d4c3565386c675374364a5935315371434a61767a5768316f55764830374e79582d4f797933426c77324b794b4679317139725a566f597639695830724c6f7678423774614a5a4f593738364a4973754e695f6b323651516b785f385a546c454f316e6736356f6a4e477749564d7637464659786d683275494666595568554139314e726b4d467161426b6d58594f4b707341305475665949655a6f4d4257674f6b465951794b6b6a35655269645f7a51396a4464486f53694473616247444235304a584931393149754867544d683563433379472d336a47306b666d665a4e4135544c45447467344658704c6f456553554963667238684d5a572d672e2e),
('h68mgk7hggoik067spid6bvon9puc9bo', '66.249.79.136', 1548744551, 0x434639474a5f6f46684c73415f44394b6f36416b516c4a4e555745554954706d336b6a6b3579454647415a506a435456637033706e65573830617442316c6c7349696d39344554415749503259364d32766d5a6f65672e2e),
('hnl3dvrl06otj5fo6qjatgnc0mf3m090', '66.249.79.138', 1548744551, 0x384c48365137704a48574c5a677544466b496a426a534c6a356e61754177654e71497735774b4434757246306e4e4369706e6733325a636f583775477068686468796f46745946425135784e76314469783359444245576c30386c484f47336c68634f62374a39673851632e),
('qupqs009cphvrraeieemm89rg9k1kg96', '66.249.79.138', 1548744551, 0x544d6f6b54795f4d6d38397374496c686b4b6576777459374a4773754157466a7279477a5079354e5163557650384d3258456668564f4877526967385641766a33554d5534504e673377616b655a78444e6a6d616e672e2e),
('srn153qnks4e917e0v7vks8k4lp7jgfs', '66.249.79.136', 1548744554, 0x5a4232457377414a6c5776743078314334793863624838387171583467514e5842734d6b5f6635505f465a5342306767636e43792d686c72487946655a414f6f76366c38377751767a73494c433644615055534c525a7477305771516d3456364664374d43634f5f4f6a6f2e),
('lqa0hnai82fpsqd4hlt93u5tlsindjik', '66.249.79.138', 1548744565, 0x674a5567516e7633684179697863377356375f6a596c4b7057764a55766b5a4a4963664f414b314d5872384e3167556f516f6e4b6565384a4c54784c315267774257564f44393231553442706e4e6d3771336c6b744f6f73356a724135657162463147316679736353694d2e),
('v0fkctrre7huj7ccrua32bl5l98vee3r', '66.249.79.136', 1548744561, 0x315572697378426f3567745a417230706e68687556327161354f6930516966494d5856525359596a514b69544656506b35696273482d6a5f42797a6e444c586c51435350725f706369455472436148724f5a63556e744e48316d7363655a51662d313364655843374a63772e),
('jt4oc9nbdm0jigvl9k10i27difm8titl', '178.32.147.150', 1548745261, 0x7531594b775837496c427964736751584b69773465796a324a4a35777731326763426557416f56613574714e30597a30704e3865706e57594c327430735251636f774a6b5a6768376d686370466d4f4c67743865634b6b5947424f53776738685978634c5858456f554a7a685a624a622d354c305a734244333544767555703950796962476a434d384e6f335842554a564c696c664a55796e7463747035365531434d434c7a6d56417a6f65737064484f5672446e6867344775304c4c6664626752656e5a357335696a5545795f6231424b5f7355376e6d7853676e46523454533936716b58347132782d31546c39764970616f67527477426c5a6e4c5a3654),
('n2ik5rm4vgldmqglea4kkq4dv8kd9lbb', '66.249.79.136', 1548746399, 0x664b667464714b4942554c766e664b3442385f754a755064457654364866423964747a775549755563645637614461397a754b614a655254516245386378686b7635424833587948775f4966746758652d496e5a685653535f42726d6b6c3259414d4a386a54694e4b2d6b2e),
('70u2unrgd1qe731huj0etuhf90jf4t5b', '66.102.6.88', 1548747140, 0x745f6c72676157395866415a746771744d385a2d4f686d4168526a50667872775334487363665875636668755a367861686b6370684f615265365a4b434d7548596d56326b78674d6250794159554768715a6479397a6c7950473072717a714f4a475a30726637626f744857765336387a46524259476b57624d584b6766653974534e63717145796c6f31784c5a78564554305172517758446834624b43696a6e6f664f6b563330466975777176596d664e4571345a565272443836513857736c65327532367157437857546b42625678447132393135323742664a37436654364a49694f3368555466766773437842657266443376364d72314e43704346702d3546594355784b5038455f31396c68326d545a525f724454316f4d4659514d793338425a706c3137686670557379687262524a7264434b5655755a516d5537706443367179327650644f59627a4f73696446356d512e2e),
('u2jonuqqrbota5gk1eg5v3gu9aaokjp7', '66.102.6.88', 1548747140, 0x5a69786e6b66454f456f5f36445f506b6c7141737656316a726d6d6b4e38775135535673683241543159486b45754774586a4b2d79535563464e37666f5a3979334b454c5672577868616b384a6f644d31366b5574772e2e),
('m71153jd0qt3tv4sgddr64fgs0nmodp0', '66.102.6.88', 1548747140, 0x637955424f5f4176706a55616736746a424c7573426b483742554e314c7a5835533067744b6d507346375f52324d35424d656e634c4f4b506e6c334a48616677544c47624e52436b426f434b45713647703573573437673543303648775251696f747877584278334263592e),
('3c3qh723j8g6bcjnuj99cnb2ugouhlf2', '66.102.6.89', 1548747141, 0x6261466a58773144714847724e6f3839694b687264494b4a4f517350464377397459676f71643970354f6251726d577a3444306c6e51644469744548542d456436515a33664553504d775473507142667933316a46672e2e),
('5s5klnv61uss6ir60b2r1calgdm30aum', '66.102.6.88', 1548747141, 0x4f505f3032734c2d754c504268554349525245734f49454e6e546c58387858667a4d48335a326349674f593150696e654b68666a4732536f656a395350695333326168664d42545f45324f4d4c664b4230433971586858647765416f4975683047574a64584c74302d51617459514f385361462d49364c584d7359744b3170636f7357464e5356572d4a5a343263777a7a515f46556a5752596f742d6b536a416a316f64493472754d386a42657453682d7355484c5f317a505f4544656e4f6c647650706948346c6d5743796c345f346e535175576935465930317536515247336a76535a6a6e6c617636355368696e725973527a55365a386657546154574d7a7531547a7945666d59717a316b51614a58795150654344323639454d53314b473649306b5038334476552e),
('ih15sjq8ids36vf47mullrh7oj47ufs3', '66.249.93.14', 1548765568, 0x48395a77445735725a434b6c436c7a6842394b42666b526466416973736252334d6453564c51416a486365682d55354a4a4e6b69413035775865387730734864337478373233706c6b4852434b56373546334c4b4f647056575531634b4f465a645f6e44436f345a4569743670676a56567866346e44437837306f6b6e593753344161794f726d586555414b715962785441367632614f684255734a63696562367557784f72597574474f39466c396f34645846526a37597066766c4c6361796f59574f333663642d697561794a324d2d4d6571766f4132447445396f6f30697843494a52397a427436387a6f4a693842336c4137764d77386668345355594451337146527a317948512d755239576d48507648795f4757384e34794131526f7a69456f317731396541666166785a4334715f55454f6278634632364664534f62337337666c44414e4933634838694d4f71395444512e2e),
('43qb8bpk9u0a1o84joc1o5hnn7q56na0', '66.249.93.13', 1548765568, 0x5254796e4e4f70653643575156502d4975457364317364746f613042495a79577842714a39554c305566514a61534531466b753055665f4b7345724d7a5475484e38646e414f4e4874384b4e682d334157304f7947672e2e),
('mqa7oo9dvt7vmvcprto2tjbb2ma0nd4j', '66.249.93.15', 1548765569, 0x636b765654447734416c2d5f70545153344c2d796a757234353642325446706543326b6e49595058566e3746377a515474587975672d4c38385233424d4b716a3153666854556832315f4e6f4846474270326a4956702d4b7076533177766c597251546d4f4e4f517057672e),
('3sfghucgf84ur96rbrmt4k4ra6ell6b5', '66.249.93.14', 1548765569, 0x6865692d485031436c53333336594b5472396374784d6c346674625169725178683278504855656631566e58694f2d5a6d48386330734a71676f6f67384a4b694d54443877505238653458764a3759427250763772672e2e),
('jnn74qn0atu4b41i187pdoo357lshbkp', '66.249.93.14', 1548765569, 0x6d5978426a33794f35326b6443785371737851305938707a6b51574b7466517a7a6176706b7547595461676574663057686648414c304432665561384f317a354937746f5861376636526c464e3248576764546d685177774f6565375a6f626a585a6253734e7635426c427633762d4b414d716a64396b66315a4f6b466b386e3237643454456f307449655268477637353350476466532d33637162544278734642753438647655455f796d647a6f43504555333834732d5064715f2d394b612d6477495876733345597879744948414b6342655242386d4171594c7553514958374569414d506c3368706564386b5154364b704658464f6849367457354f6844764c50592d5a4f643773526d316e572d7266766d2d6275395376354a6a5f656241627854434e684659492e),
('bnsou5kcsk0elmfj10efs0pvjf3746m9', '198.23.202.53', 1548765925, 0x6859483855374c59424e61497131776e426d2d556e51396453416c586651705f48383851337564457770725a6b507a466a37387246357371756f6d454169776869394f734a77524f75626646614b762d4e723370774252347762546c4a4349333733504f6c46736e3168772e),
('r39erj65ittv7m5jlbpleh98al1f31qm', '198.23.202.53', 1548765925, 0x4d4c4b4a73456630544e446d6a724b5a386838367a32324771595075795a3064676a7a46586a42536d474e6566543479313162416a4432707872356b542d4c4e6a65447730726d376f724c577748376e51375567376a7a59774b6e395669727a767835574b472d78666c6f2e),
('vs99r4sm2pai1qiofll3en60r4qfo348', '198.23.202.53', 1548765926, 0x4d4c4b4a73456630544e446d6a724b5a386838367a32324771595075795a3064676a7a46586a42536d474e6566543479313162416a4432707872356b542d4c4e6a65447730726d376f724c577748376e51375567376a7a59774b6e395669727a767835574b472d78666c6f2e),
('ju62mt8i6jf57cag6scq5teeuvnltqp2', '198.23.202.53', 1548765926, 0x7445346157527071396b6b7a625164485a37515f576a6b4261322d3544514d73694236742d3259456949546f534a554f375a51686f72627534435258304f4876414956304d4869646641426f544a6e644a516f32504962426a4245584233554a3044494639554b344d35302e),
('rpgkulcl9ec5r7fm0tjfc0idrktecrg8', '198.23.202.53', 1548765927, 0x76684e355f3539767a344c6a6c345958365f746144414370426130645739572d66462d77425a614b4851724b32494c7770496f574c41467a707a4a663830457a62566a636e39356f49724548725248693375525a675159495239386e502d355444507474496b54483151552e),
('3lcura2b9a8m3njhl7dd6el537gl9o72', '198.23.202.53', 1548765928, 0x76684e355f3539767a344c6a6c345958365f746144414370426130645739572d66462d77425a614b4851724b32494c7770496f574c41467a707a4a663830457a62566a636e39356f49724548725248693375525a675159495239386e502d355444507474496b54483151552e),
('qsi8po3oqc9rpqvrbun9tik9rov1omq7', '198.23.202.53', 1548765928, 0x3362446247397178434142624f33724554717371775f5670546d4b586c4c2d45786d6e65586e534b4d4665714d45783171347a41674f356a744c525763446f555f526379794a4a467555326f454a333972666f3364415f487649544c53514171584f556e5f5779724863632e),
('v8s4bpvh4tld0mk5ptft18dnfsc4lte8', '198.23.202.53', 1548765929, 0x3362446247397178434142624f33724554717371775f5670546d4b586c4c2d45786d6e65586e534b4d4665714d45783171347a41674f356a744c525763446f555f526379794a4a467555326f454a333972666f3364415f487649544c53514171584f556e5f5779724863632e);
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('uug5tcf0rsu20h9hhqo12vol8v3eq49p', '198.23.202.53', 1548765929, 0x4e4f35666e454464456a73495369316237364543784b6a5836547946324e46415f6e654d7a3858663476734b6b5a64643558487a4951625f384959714858557351304d4c684c64635145594a50376d7245634e6766505834637973334964563872394d59563637686e66342e),
('n90pdsbkcol0jkgig1haect59lmg0dd5', '198.23.202.53', 1548765930, 0x7049414c6d447335654e636f4e57683361654566395072384e4e4f50524d62494d4553577474656938315351725f337a73714f36736e4147415176735169315f717a6e3056336f6b515f69492d64386b646b49524a4f5964526378493066346b515132577869726d5a34592e),
('v47v86ft0p8bpkqm01iugbissdgpsrfo', '198.23.202.53', 1548765931, 0x7049414c6d447335654e636f4e57683361654566395072384e4e4f50524d62494d4553577474656938315351725f337a73714f36736e4147415176735169315f717a6e3056336f6b515f69492d64386b646b49524a4f5964526378493066346b515132577869726d5a34592e),
('d4aphctfu4jdntnmc29sm97k1ibk92lr', '198.23.202.53', 1548765931, 0x68574e486b585a72486c654c4861735f6949735649787459323661554357494a46714e762d51705578624339676753566e4f764b493637724f54536f6a3658573333656f76786c32706c73465374394d3632645f4e702d694e7a78554c6176656e352d706d34316c514f512e),
('j9k97ffqamt8tt1qku4ni79g329qosu8', '198.23.202.53', 1548765932, 0x616b50394a2d645f4365364977796a74636649555f594b4d572d3244504b50483838536665474c7957713753566878414b664c32555766657272593961494a6c386a457a37654a59326a395545756e73683175476442514b423073765a704d464451473079384f657345452e),
('j69fseqep0i289n494vs3jnalfga6n3m', '198.23.202.53', 1548765932, 0x616b50394a2d645f4365364977796a74636649555f594b4d572d3244504b50483838536665474c7957713753566878414b664c32555766657272593961494a6c386a457a37654a59326a395545756e73683175476442514b423073765a704d464451473079384f657345452e),
('46sk52uvktl7vujb2br8itvarktl5t7v', '185.101.216.149', 1548773376, 0x36546f65466249706666664d654147564c57783430636a38435361574f6274615a4f64575a34483949726639446e4e4b786a7435723643727031395433385a36684f564a5636564c4f6748616c4970384b3958726e6858543046564630546c4e63454c42345533725873385a6a566468587246534763756f333757364837674d42757341794b565f61327877586e72353837612d3931564c7a6477354439335150766d654a716f4e624b426742436563564e354d5561577955766231457a72384b485f5231764c346b3669397a646974566e614a6a523946517771504f7a53626376526676374b32617441315a61675942786c3035717255642d627946754e75),
('c00jetn5nueukduiqu6doujqld51qate', '78.109.23.2', 1548774101, 0x6d4b754a547a4b6362396a5874313476414d684453704d59764a3466514454346b596d6267696150792d6d4c4870675f2d5f59433671596e5373344731527775344c51624a5861446b41414273436b5255344b6563705f443338474851482d76765877587254363031743536567736675447467a5f6330576d437448397179794f38746a49316961784156676152442d4d717941564d5f4b4a6444515a595934787a536d53304f78652d46344b4c627647644875655143793659566e57766a2d4947345a4a3965616a646e72757351496d797738646a59542d504474427a4a4a5a614a5f65426a59456a54486a654951555f354d4b4244636135536e55397530),
('jffsu7jtdu6l1305q644dp7559joekqs', '185.220.101.6', 1548778610, 0x356b49644d3141374f6e3873676a7477415472654b435a475352314865536758436b626b4a756d4a39565f4a6b7067475a585a435634726e6277446765386957796f67556e7279576a44736e5a6c543151415646716f4f334136424345346b34706944503275774a323963435a68307977694541673736506a62754f506171325f346d62754858366d776777524a5378356e784b415a6750626651325034734b4b4e464d7054496b3635332d676f336f4f326a3859784a57695949646246694c5877503158376a364a4b325338764c617048646b6a733851644d5a357a78776f484c55306e507063767142493736307a653436764f6a67534c4136635868726c),
('rhd9rreq82g9e1tscf23cvrkm3va62e6', '85.248.227.164', 1548779302, 0x536338312d484d4f4f55635575764e4a6c4c48566b37396e787a5f6a6b4449506531463749315066717a4a42416f3678324d366a3839464579777765724c694a716e64594779576762584b39315f344a6d775a6f655a476e3472725144323937444138414358334f6c5a68756b7a6662453671725862694d797851747879654e53664757336166366978794842595143494d677a6d74754e7164666e36694777514d62414a79643764684d54346c6c4a6437316a3678354f375565647756354f4c754749377a6656374e516c57314972327931676344372d2d735f74456f395965696636645070796f7a4f61796e69625f77715470494b30616563694e30314e),
('bs4ahr94gbbe51b42cgl79ml92fitler', '39.37.148.75', 1548780035, 0x4d45785069696f336334674c67563465742d3758327358704d5378646b4d715a324d70572d7659654a545474554665496e4367304961775f6e50696a68677739304c433751542d477a656157556c7645686133736568464a655a777579587938746a4b6a316b426f2d6530356b58667a4148396a6a725749335046776668436a48697a48585947554d6a563047565258667972577a79386d766b5a39576a704c5a4b6f66496b4238646268526e61367352394c6b3947466b6348377a343769705041637367734971326f735a394a6d794a5345584c3843617531566d596c395a795557524975395669694545554a4c36345a73616e596a61377347777a74367644514845736f6470677856374d6e45366b576c4c6d512e2e),
('7i7h5a530hugckbqql4mtjfci84bmavh', '39.37.148.75', 1548780055, 0x6a4a364b667958394b6534597577566e506550416363547150626f44514972546c564944644c4f506b494a385f50774b4d45334b4b42377a415a3032784671633451657931794e79483732336d64345744715967375a4575493576674958433579695838694e424764796b746c5576795936575f377577626b59696f496668703049335839324a74773330647a6b54554b526f53756f5f766e6b59426751724b43653348597678696a7977506a4c642d48335955774a5a784d7a77526568504e59474b6448494746717473465236734244704539307563497845364e42385847486a4f7073506e7032754a4531594b7648516130426d3762724b4361756138514d2d675349714b716161624e4377307969614f42547736665071324b673967696c313644784d4f4c55314374392d6b66724e344963693146344575745943547273624966695135775a666350384b375a36525362517662544d4d546b6f6a6b4e5064714c53614b336f5a50556f30494e32734a5f64747172467448354833784d7a444a7a4870496b6d776352354a55626b49506e66766a6148782d7052543268564247455863516a6d6d744b6d6872777a6a6878765547335f30337958664937592d454d4b766c37326b4d51784b37594a6f426d376f416e43564e5954753050644863382d63335a70746469717646623577674f6a654c34627871314c54326834745a307433715f515237626d6f4e767132676b447369394336775a53735f613475474e72617a537074386851775575454b5a353476337a546f5f6b58477357426d46422d476552757751666c68306a4e635471544d614679755f5048487a4a572d6a4b714b446a6b544c6d54353845614236663355376f44496c7434745672695347393255517062666243423930547a4f6e50433372463772485f757168753361584e7663327a6b516c715a484a2d443831324c316d305f4b564335416436);

-- --------------------------------------------------------

--
-- Table structure for table `sma_settings`
--

CREATE TABLE `sma_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `logo2` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `language` varchar(20) NOT NULL,
  `default_warehouse` int(2) NOT NULL,
  `accounting_method` tinyint(4) NOT NULL DEFAULT '0',
  `default_currency` varchar(3) NOT NULL,
  `default_tax_rate` int(2) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `default_tax_rate2` int(11) NOT NULL DEFAULT '0',
  `dateformat` int(11) NOT NULL,
  `sales_prefix` varchar(20) DEFAULT NULL,
  `quote_prefix` varchar(20) DEFAULT NULL,
  `purchase_prefix` varchar(20) DEFAULT NULL,
  `transfer_prefix` varchar(20) DEFAULT NULL,
  `delivery_prefix` varchar(20) DEFAULT NULL,
  `payment_prefix` varchar(20) DEFAULT NULL,
  `return_prefix` varchar(20) DEFAULT NULL,
  `returnp_prefix` varchar(20) DEFAULT NULL,
  `expense_prefix` varchar(20) DEFAULT NULL,
  `item_addition` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(20) NOT NULL,
  `product_serial` tinyint(4) NOT NULL,
  `default_discount` int(11) NOT NULL,
  `product_discount` tinyint(1) NOT NULL DEFAULT '0',
  `discount_method` tinyint(4) NOT NULL,
  `tax1` tinyint(4) NOT NULL,
  `tax2` tinyint(4) NOT NULL,
  `overselling` tinyint(1) NOT NULL DEFAULT '0',
  `restrict_user` tinyint(4) NOT NULL DEFAULT '0',
  `restrict_calendar` tinyint(4) NOT NULL DEFAULT '0',
  `timezone` varchar(100) DEFAULT NULL,
  `iwidth` int(11) NOT NULL DEFAULT '0',
  `iheight` int(11) NOT NULL,
  `twidth` int(11) NOT NULL,
  `theight` int(11) NOT NULL,
  `watermark` tinyint(1) DEFAULT NULL,
  `reg_ver` tinyint(1) DEFAULT NULL,
  `allow_reg` tinyint(1) DEFAULT NULL,
  `reg_notification` tinyint(1) DEFAULT NULL,
  `auto_reg` tinyint(1) DEFAULT NULL,
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `mailpath` varchar(55) DEFAULT '/usr/sbin/sendmail',
  `smtp_host` varchar(100) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(10) DEFAULT NULL,
  `corn` datetime DEFAULT NULL,
  `customer_group` int(11) NOT NULL,
  `default_email` varchar(100) NOT NULL,
  `mmode` tinyint(1) NOT NULL,
  `bc_fix` tinyint(4) NOT NULL DEFAULT '0',
  `auto_detect_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `captcha` tinyint(1) NOT NULL DEFAULT '1',
  `reference_format` tinyint(1) NOT NULL DEFAULT '1',
  `racks` tinyint(1) DEFAULT '0',
  `attributes` tinyint(1) NOT NULL DEFAULT '0',
  `product_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `decimals` tinyint(2) NOT NULL DEFAULT '2',
  `qty_decimals` tinyint(2) NOT NULL DEFAULT '2',
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `invoice_view` tinyint(1) DEFAULT '0',
  `default_biller` int(11) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT '0',
  `each_spent` decimal(15,4) DEFAULT NULL,
  `ca_point` tinyint(4) DEFAULT NULL,
  `each_sale` decimal(15,4) DEFAULT NULL,
  `sa_point` tinyint(4) DEFAULT NULL,
  `update` tinyint(1) DEFAULT '0',
  `sac` tinyint(1) DEFAULT '0',
  `display_all_products` tinyint(1) DEFAULT '0',
  `display_symbol` tinyint(1) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `remove_expired` tinyint(1) DEFAULT '0',
  `barcode_separator` varchar(2) NOT NULL DEFAULT '-',
  `set_focus` tinyint(1) NOT NULL DEFAULT '0',
  `price_group` int(11) DEFAULT NULL,
  `barcode_img` tinyint(1) NOT NULL DEFAULT '1',
  `ppayment_prefix` varchar(20) DEFAULT 'POP',
  `disable_editing` smallint(6) DEFAULT '90',
  `qa_prefix` varchar(55) DEFAULT NULL,
  `update_cost` tinyint(1) DEFAULT NULL,
  `apis` tinyint(1) NOT NULL DEFAULT '0',
  `state` varchar(100) DEFAULT NULL,
  `pdf_lib` varchar(20) DEFAULT 'dompdf'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_settings`
--

INSERT INTO `sma_settings` (`setting_id`, `logo`, `logo2`, `site_name`, `language`, `default_warehouse`, `accounting_method`, `default_currency`, `default_tax_rate`, `rows_per_page`, `version`, `default_tax_rate2`, `dateformat`, `sales_prefix`, `quote_prefix`, `purchase_prefix`, `transfer_prefix`, `delivery_prefix`, `payment_prefix`, `return_prefix`, `returnp_prefix`, `expense_prefix`, `item_addition`, `theme`, `product_serial`, `default_discount`, `product_discount`, `discount_method`, `tax1`, `tax2`, `overselling`, `restrict_user`, `restrict_calendar`, `timezone`, `iwidth`, `iheight`, `twidth`, `theight`, `watermark`, `reg_ver`, `allow_reg`, `reg_notification`, `auto_reg`, `protocol`, `mailpath`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `corn`, `customer_group`, `default_email`, `mmode`, `bc_fix`, `auto_detect_barcode`, `captcha`, `reference_format`, `racks`, `attributes`, `product_expiry`, `decimals`, `qty_decimals`, `decimals_sep`, `thousands_sep`, `invoice_view`, `default_biller`, `envato_username`, `purchase_code`, `rtl`, `each_spent`, `ca_point`, `each_sale`, `sa_point`, `update`, `sac`, `display_all_products`, `display_symbol`, `symbol`, `remove_expired`, `barcode_separator`, `set_focus`, `price_group`, `barcode_img`, `ppayment_prefix`, `disable_editing`, `qa_prefix`, `update_cost`, `apis`, `state`, `pdf_lib`) VALUES
(1, 'logo2.png', 'logo3.png', 'Stock Manager Advance', 'english', 1, 0, 'USD', 1, 10, '3.3.1', 1, 5, 'SALE', 'QUOTE', 'PO', 'TR', 'DO', 'IPAY', 'SR', 'PR', NULL, 0, 'default', 1, 1, 1, 1, 1, 1, 0, 1, 0, 'Asia/Kuala_Lumpur', 800, 800, 150, 150, 0, 0, 0, 0, NULL, 'mail', '/usr/sbin/sendmail', 'pop.gmail.com', 'contact@sma.tecdiary.org', 'jEFTM4T63AiQ9dsidxhPKt9CIg4HQjCN58n/RW9vmdC/UDXCzRLR469ziZ0jjpFlbOg43LyoSmpJLBkcAHh0Yw==', '25', NULL, NULL, 1, 'contact@tecdiary.com', 0, 4, 1, 0, 2, 1, 1, 0, 2, 2, '.', ',', 0, 3, 'toneyue', 'dadc7dd3-758b-421f-8b82-624dd6b7883c', 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, '-', 0, NULL, 1, 'POP', 90, NULL, NULL, 0, NULL, 'dompdf');

-- --------------------------------------------------------

--
-- Table structure for table `sma_skrill`
--

CREATE TABLE `sma_skrill` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL DEFAULT 'testaccount2@moneybookers.com',
  `secret_word` varchar(20) NOT NULL DEFAULT 'mbtest',
  `skrill_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_skrill`
--

INSERT INTO `sma_skrill` (`id`, `active`, `account_email`, `secret_word`, `skrill_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'testaccount2@moneybookers.com', 'mbtest', 'USD', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_stock_counts`
--

CREATE TABLE `sma_stock_counts` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `initial_file` varchar(50) NOT NULL,
  `final_file` varchar(50) DEFAULT NULL,
  `brands` varchar(50) DEFAULT NULL,
  `brand_names` varchar(100) DEFAULT NULL,
  `categories` varchar(50) DEFAULT NULL,
  `category_names` varchar(100) DEFAULT NULL,
  `note` text,
  `products` int(11) DEFAULT NULL,
  `rows` int(11) DEFAULT NULL,
  `differences` int(11) DEFAULT NULL,
  `matches` int(11) DEFAULT NULL,
  `missing` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `finalized` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_stock_count_items`
--

CREATE TABLE `sma_stock_count_items` (
  `id` int(11) NOT NULL,
  `stock_count_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_variant` varchar(55) DEFAULT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `expected` decimal(15,4) NOT NULL,
  `counted` decimal(15,4) NOT NULL,
  `cost` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_bills`
--

CREATE TABLE `sma_suspended_bills` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) DEFAULT NULL,
  `count` int(11) NOT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `shipping` decimal(15,4) DEFAULT '0.0000',
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_items`
--

CREATE TABLE `sma_suspended_items` (
  `id` int(11) NOT NULL,
  `suspend_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_tax_rates`
--

CREATE TABLE `sma_tax_rates` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `rate` decimal(12,4) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_tax_rates`
--

INSERT INTO `sma_tax_rates` (`id`, `name`, `code`, `rate`, `type`) VALUES
(1, 'No Tax', 'NT', '0.0000', '2'),
(2, 'VAT @10%', 'VAT10', '10.0000', '1'),
(3, 'GST @6%', 'GST', '6.0000', '1'),
(4, 'VAT @20%', 'VT20', '20.0000', '1');

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfers`
--

CREATE TABLE `sma_transfers` (
  `id` int(11) NOT NULL,
  `transfer_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_warehouse_id` int(11) NOT NULL,
  `from_warehouse_code` varchar(55) NOT NULL,
  `from_warehouse_name` varchar(55) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `to_warehouse_code` varchar(55) NOT NULL,
  `to_warehouse_name` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'pending',
  `shipping` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfer_items`
--

CREATE TABLE `sma_transfer_items` (
  `id` int(11) NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) DEFAULT NULL,
  `quantity_balance` decimal(15,4) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_units`
--

CREATE TABLE `sma_units` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(55) NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` varchar(1) DEFAULT NULL,
  `unit_value` varchar(55) DEFAULT NULL,
  `operation_value` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_units`
--

INSERT INTO `sma_units` (`id`, `code`, `name`, `base_unit`, `operator`, `unit_value`, `operation_value`) VALUES
(0, '1', 'Pecs', NULL, NULL, NULL, NULL),
(0, '1', 'Pecs', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_users`
--

CREATE TABLE `sma_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `warehouse_id` int(10) UNSIGNED DEFAULT NULL,
  `biller_id` int(10) UNSIGNED DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `show_cost` tinyint(1) DEFAULT '0',
  `show_price` tinyint(1) DEFAULT '0',
  `award_points` int(11) DEFAULT '0',
  `view_right` tinyint(1) NOT NULL DEFAULT '0',
  `edit_right` tinyint(1) NOT NULL DEFAULT '0',
  `allow_discount` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_users`
--

INSERT INTO `sma_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `warehouse_id`, `biller_id`, `company_id`, `show_cost`, `show_price`, `award_points`, `view_right`, `edit_right`, `allow_discount`) VALUES
(1, 0x33392e33372e3134382e3735, 0x0000, 'owner', '2c8ab736b2ccab4f50e72d5fd7d21020cbb77ae7', NULL, 'owner@tecdiary.com', NULL, NULL, NULL, '6e5e2f4c47ba10736e92891840965955f42f6f45', 1351661704, 1548780054, 1, 'Owner', 'Owner', 'Stock Manager', '012345678', NULL, 'male', 1, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_user_logins`
--

CREATE TABLE `sma_user_logins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_user_logins`
--

INSERT INTO `sma_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
(0, 1, NULL, 0x3130312e35302e39342e313438, 'owner@tecdiary.com', '2019-01-24 15:21:47'),
(0, 1, NULL, 0x3130332e3235352e372e3633, 'owner@tecdiary.com', '2019-01-24 16:44:46'),
(0, 1, NULL, 0x3130312e35302e3132372e3138, 'owner@tecdiary.com', '2019-01-25 16:32:45'),
(0, 1, NULL, 0x3130332e3235352e362e313032, 'owner@tecdiary.com', '2019-01-27 02:15:21'),
(0, 1, NULL, 0x33392e34352e3230302e3334, 'owner@tecdiary.com', '2019-01-27 16:52:36'),
(0, 1, NULL, 0x3130332e3235352e352e313133, 'owner@tecdiary.com', '2019-01-28 15:12:36'),
(0, 1, NULL, 0x33392e33372e3134382e3735, 'owner@tecdiary.com', '2019-01-29 16:40:54');

-- --------------------------------------------------------

--
-- Table structure for table `sma_variants`
--

CREATE TABLE `sma_variants` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses`
--

CREATE TABLE `sma_warehouses` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `map` varchar(255) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_warehouses`
--

INSERT INTO `sma_warehouses` (`id`, `code`, `name`, `address`, `map`, `phone`, `email`, `price_group_id`) VALUES
(1, 'WHI', 'Warehouse 1', '<p>Address, City</p>', NULL, '012345678', 'whi@tecdiary.com', NULL),
(2, 'WHII', 'Warehouse 2', '<p>Warehouse 2, Jalan Sultan Ismail, 54000, Kuala Lumpur</p>', NULL, '0105292122', 'whii@tecdiary.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products`
--

CREATE TABLE `sma_warehouses_products` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL,
  `avg_cost` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_warehouses_products`
--

INSERT INTO `sma_warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`, `rack`, `avg_cost`) VALUES
(0, 0, 1, '0.0000', NULL, '9100.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products_variants`
--

CREATE TABLE `sma_warehouses_products_variants` (
  `id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sma_addresses`
--
ALTER TABLE `sma_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_adjustment_items`
--
ALTER TABLE `sma_adjustment_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adjustment_id` (`adjustment_id`);

--
-- Indexes for table `sma_brands`
--
ALTER TABLE `sma_brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `sma_calendar`
--
ALTER TABLE `sma_calendar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_captcha`
--
ALTER TABLE `sma_captcha`
  ADD PRIMARY KEY (`captcha_id`),
  ADD KEY `word` (`word`);

--
-- Indexes for table `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
