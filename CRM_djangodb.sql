-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Aug 27, 2026 at 02:52 AM
-- Server version: 5.7.39
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `CRM_djangodb`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint(20) NOT NULL,
  `module` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `record_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `module`, `action`, `record_id`, `ip_address`, `user_agent`, `created_at`, `user_id`) VALUES
(1, 'invoices', 'created', 8, '192.168.1.234', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4', '2026-08-08 10:30:23.350415', 31),
(2, 'invoices', 'sent', 5, '192.168.1.79', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0', '2026-08-08 10:30:23.350415', 3),
(3, 'deals', 'created', 49, '192.168.1.26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/126.0', '2026-08-08 10:30:23.350415', 1),
(4, 'settings', 'updated', 14, '192.168.1.152', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/126.0', '2026-08-08 10:30:23.350415', 39),
(5, 'leads', 'created', 43, '192.168.1.91', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/126.0', '2026-08-08 10:30:23.350415', 12),
(6, 'customers', 'created', 10, '192.168.1.218', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0', '2026-08-08 10:30:23.350415', 6),
(7, 'leads', 'created', 38, '192.168.1.91', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4', '2026-08-08 10:30:23.350415', 18),
(8, 'invoices', 'created', 33, '192.168.1.201', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0', '2026-08-08 10:30:23.350415', 11),
(9, 'deals', 'stage_moved', 16, '192.168.1.131', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0', '2026-08-08 10:30:23.350415', 40),
(10, 'deals', 'created', 7, '192.168.1.211', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0', '2026-08-08 10:30:23.350415', 5),
(11, 'users', 'updated', 1, '192.168.1.137', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/126.0', '2026-08-08 10:30:23.350415', 49),
(12, 'tasks', 'created', 13, '192.168.1.248', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4', '2026-08-08 10:30:23.350415', 46),
(13, 'tasks', 'completed', 49, '192.168.1.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/126.0', '2026-08-08 10:30:23.350415', 11),
(14, 'deals', 'created', 7, '192.168.1.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/126.0', '2026-08-08 10:30:23.350415', 47),
(15, 'quotes', 'accepted', 46, '192.168.1.123', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4', '2026-08-08 10:30:23.350415', 33),
(16, 'quotes', 'accepted', 38, '192.168.1.49', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4', '2026-08-08 10:30:23.350415', 45),
(17, 'leads', 'created', 7, '192.168.1.48', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4', '2026-08-08 10:30:23.350415', 44),
(18, 'customers', 'updated', 28, '192.168.1.56', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0', '2026-08-08 10:30:23.350415', 25),
(19, 'leads', 'status_changed', 27, '192.168.1.30', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4', '2026-08-08 10:30:23.350415', 15),
(20, 'leads', 'created', 30, '192.168.1.30', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0', '2026-08-08 10:30:23.350415', 8),
(21, 'invoices', 'created', 32, '192.168.1.197', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4', '2026-08-08 10:30:23.350415', 9),
(22, 'leads', 'status_changed', 19, '192.168.1.144', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0', '2026-08-08 10:30:23.350415', 46),
(23, 'settings', 'updated', 6, '192.168.1.85', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4', '2026-08-08 10:30:23.350415', 3),
(24, 'leads', 'status_changed', 25, '192.168.1.74', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4', '2026-08-08 10:30:23.350415', 8),
(25, 'users', 'updated', 48, '192.168.1.81', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0', '2026-08-08 10:30:23.350415', 39),
(26, 'quotes', 'accepted', 15, '192.168.1.143', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4', '2026-08-08 10:30:23.350415', 29),
(27, 'invoices', 'created', 28, '192.168.1.50', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/126.0', '2026-08-08 10:30:23.350415', 19),
(28, 'invoices', 'sent', 44, '192.168.1.96', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/126.0', '2026-08-08 10:30:23.350415', 31),
(29, 'tickets', 'replied', 44, '192.168.1.127', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0', '2026-08-08 10:30:23.350415', 1),
(30, 'settings', 'updated', 26, '192.168.1.114', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0', '2026-08-08 10:30:23.350415', 7),
(31, 'invoices', 'created', 44, '192.168.1.23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/126.0', '2026-08-08 10:30:23.350415', 43),
(32, 'settings', 'updated', 26, '192.168.1.104', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0', '2026-08-08 10:30:23.350415', 10),
(33, 'invoices', 'created', 7, '192.168.1.191', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/126.0', '2026-08-08 10:30:23.350415', 38),
(34, 'tickets', 'replied', 24, '192.168.1.251', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/126.0', '2026-08-08 10:30:23.350415', 5),
(35, 'invoices', 'created', 13, '192.168.1.154', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4', '2026-08-08 10:30:23.350415', 22),
(36, 'tickets', 'replied', 15, '192.168.1.216', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4', '2026-08-08 10:30:23.350415', 8),
(37, 'users', 'updated', 32, '192.168.1.73', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0', '2026-08-08 10:30:23.350415', 47),
(38, 'users', 'updated', 38, '192.168.1.153', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4', '2026-08-08 10:30:23.350415', 50),
(39, 'customers', 'updated', 42, '192.168.1.243', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4', '2026-08-08 10:30:23.350415', 49),
(40, 'tasks', 'completed', 31, '192.168.1.172', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0', '2026-08-08 10:30:23.350415', 23),
(41, 'tasks', 'created', 32, '192.168.1.132', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4', '2026-08-08 10:30:23.350415', 26),
(42, 'quotes', 'accepted', 50, '192.168.1.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/126.0', '2026-08-08 10:30:23.350415', 10),
(43, 'customers', 'updated', 17, '192.168.1.127', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4', '2026-08-08 10:30:23.350415', 8),
(44, 'customers', 'updated', 41, '192.168.1.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/126.0', '2026-08-08 10:30:23.350415', 15),
(45, 'settings', 'updated', 7, '192.168.1.190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/126.0', '2026-08-08 10:30:23.350415', 2),
(46, 'leads', 'created', 32, '192.168.1.175', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/126.0', '2026-08-08 10:30:23.350415', 5),
(47, 'quotes', 'accepted', 25, '192.168.1.156', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0', '2026-08-08 10:30:23.350415', 12),
(48, 'customers', 'created', 10, '192.168.1.79', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0', '2026-08-08 10:30:23.350415', 21),
(49, 'tasks', 'created', 7, '192.168.1.196', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/126.0', '2026-08-08 10:30:23.350415', 40),
(50, 'deals', 'created', 49, '192.168.1.135', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4', '2026-08-08 10:30:23.350415', 43),
(51, 'deals', 'stage_moved', 13, '192.168.1.77', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0', '2026-08-08 10:30:23.350415', 30),
(52, 'tickets', 'replied', 32, '192.168.1.131', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4', '2026-08-08 10:30:23.350415', 32),
(53, 'deals', 'created', 22, '192.168.1.209', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0', '2026-08-08 10:30:23.350415', 35),
(54, 'leads', 'created', 2, '192.168.1.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/126.0', '2026-08-08 10:30:23.350415', 35),
(55, 'settings', 'updated', 8, '192.168.1.100', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4', '2026-08-08 10:30:23.350415', 28),
(56, 'tasks', 'created', 25, '192.168.1.115', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4', '2026-08-08 10:30:23.350415', 21),
(57, 'quotes', 'accepted', 3, '192.168.1.47', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0', '2026-08-08 10:30:23.350415', 3),
(58, 'invoices', 'sent', 50, '192.168.1.79', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0', '2026-08-08 10:30:23.350415', 43),
(59, 'invoices', 'created', 32, '192.168.1.112', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/126.0', '2026-08-08 10:30:23.350415', 11),
(60, 'users', 'updated', 46, '192.168.1.101', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4', '2026-08-08 10:30:23.350415', 20),
(61, 'deals', 'created', 8, '192.168.1.147', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0', '2026-08-08 10:30:23.350415', 49),
(62, 'leads', 'created', 43, '192.168.1.143', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0', '2026-08-08 10:30:23.350415', 32),
(63, 'tickets', 'replied', 37, '192.168.1.122', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4', '2026-08-08 10:30:23.350415', 35),
(64, 'deals', 'stage_moved', 11, '192.168.1.131', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/126.0', '2026-08-08 10:30:23.350415', 36),
(65, 'customers', 'created', 17, '192.168.1.128', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0', '2026-08-08 10:30:23.350415', 26),
(66, 'tickets', 'replied', 40, '192.168.1.175', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4', '2026-08-08 10:30:23.350415', 25),
(67, 'settings', 'updated', 19, '192.168.1.84', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/126.0', '2026-08-08 10:30:23.350415', 50),
(68, 'customers', 'updated', 38, '192.168.1.13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/126.0', '2026-08-08 10:30:23.350415', 2),
(69, 'leads', 'status_changed', 23, '192.168.1.209', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0', '2026-08-08 10:30:23.350415', 24),
(70, 'leads', 'created', 2, '192.168.1.197', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0', '2026-08-08 10:30:23.350415', 38),
(71, 'settings', 'updated', 25, '192.168.1.26', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4', '2026-08-08 10:30:23.350415', 22),
(72, 'tickets', 'replied', 23, '192.168.1.107', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4', '2026-08-08 10:30:23.350415', 23),
(73, 'leads', 'created', 43, '192.168.1.64', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/126.0', '2026-08-08 10:30:23.350415', 4),
(74, 'tickets', 'replied', 42, '192.168.1.81', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0', '2026-08-08 10:30:23.350415', 16),
(75, 'leads', 'status_changed', 45, '192.168.1.18', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4', '2026-08-08 10:30:23.350415', 6),
(76, 'deals', 'stage_moved', 22, '192.168.1.45', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/126.0', '2026-08-08 10:30:23.350415', 8),
(77, 'leads', 'created', 21, '192.168.1.11', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4', '2026-08-08 10:30:23.350415', 35),
(78, 'leads', 'status_changed', 28, '192.168.1.147', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0', '2026-08-08 10:30:23.350415', 43),
(79, 'leads', 'created', 18, '192.168.1.7', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0', '2026-08-08 10:30:23.350415', 27),
(80, 'customers', 'updated', 38, '192.168.1.7', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4', '2026-08-08 10:30:23.350415', 31),
(81, 'tasks', 'completed', 37, '192.168.1.101', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4', '2026-08-08 10:30:23.350415', 25),
(82, 'tickets', 'replied', 7, '192.168.1.208', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4', '2026-08-08 10:30:23.350415', 37),
(83, 'users', 'updated', 45, '192.168.1.174', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/126.0', '2026-08-08 10:30:23.350415', 7),
(84, 'users', 'updated', 32, '192.168.1.130', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0', '2026-08-08 10:30:23.350415', 22),
(85, 'customers', 'updated', 11, '192.168.1.159', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4', '2026-08-08 10:30:23.350415', 22),
(86, 'customers', 'updated', 28, '192.168.1.53', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4', '2026-08-08 10:30:23.350415', 24),
(87, 'customers', 'created', 5, '192.168.1.217', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0', '2026-08-08 10:30:23.350415', 41),
(88, 'users', 'updated', 19, '192.168.1.69', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/126.0', '2026-08-08 10:30:23.350415', 14),
(89, 'tasks', 'created', 37, '192.168.1.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/126.0', '2026-08-08 10:30:23.350415', 20),
(90, 'users', 'updated', 48, '192.168.1.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/126.0', '2026-08-08 10:30:23.350415', 40),
(91, 'tasks', 'completed', 38, '192.168.1.26', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0', '2026-08-08 10:30:23.350415', 46),
(92, 'customers', 'created', 18, '192.168.1.19', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0', '2026-08-08 10:30:23.350415', 22),
(93, 'leads', 'status_changed', 31, '192.168.1.111', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/126.0', '2026-08-08 10:30:23.350415', 34),
(94, 'customers', 'updated', 5, '192.168.1.168', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4', '2026-08-08 10:30:23.350415', 23),
(95, 'customers', 'created', 20, '192.168.1.112', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0', '2026-08-08 10:30:23.350415', 33),
(96, 'users', 'updated', 21, '192.168.1.53', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4', '2026-08-08 10:30:23.350415', 35),
(97, 'payments', 'recorded', 17, '192.168.1.161', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0', '2026-08-08 10:30:23.350415', 26),
(98, 'invoices', 'created', 43, '192.168.1.197', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0', '2026-08-08 10:30:23.350415', 30),
(99, 'invoices', 'sent', 2, '192.168.1.162', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/127.0', '2026-08-08 10:30:23.350415', 12),
(100, 'customers', 'created', 12, '192.168.1.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/17.4', '2026-08-08 10:30:23.350415', 34),
(101, 'authentication', 'login', NULL, '127.0.0.1', 'curl/8.7.1', '2026-08-22 09:20:48.615532', 1),
(102, 'leads', 'created', 51, '127.0.0.1', 'curl/8.7.1', '2026-08-22 09:25:04.916455', 1),
(103, 'tasks', 'status_changed', 1, '127.0.0.1', 'curl/8.7.1', '2026-08-22 09:25:04.956131', 1),
(104, 'deals', 'stage_moved:New->Qualified', 1, '127.0.0.1', 'curl/8.7.1', '2026-08-22 09:25:04.993130', 1),
(105, 'leads', 'created', 52, '127.0.0.1', 'curl/8.7.1', '2026-08-22 09:26:12.637170', 1),
(106, 'tasks', 'status_changed', 1, '127.0.0.1', 'curl/8.7.1', '2026-08-22 09:26:12.691377', 1),
(107, 'deals', 'stage_moved:Qualified->Qualified', 1, '127.0.0.1', 'curl/8.7.1', '2026-08-22 09:26:12.739285', 1),
(108, 'quotes', 'created', 32, '127.0.0.1', 'curl/8.7.1', '2026-08-22 09:27:33.129251', 1),
(109, 'quotes', 'created', 33, '127.0.0.1', 'curl/8.7.1', '2026-08-22 09:27:57.106238', 1),
(110, 'invoices', 'created_from_quote', 41, '127.0.0.1', 'curl/8.7.1', '2026-08-22 09:27:57.303876', 1),
(111, 'payments', 'recorded', 23, '127.0.0.1', 'curl/8.7.1', '2026-08-22 09:28:17.510695', 1),
(112, 'tickets', 'replied', 1, '127.0.0.1', 'curl/8.7.1', '2026-08-22 09:30:44.057951', 1),
(113, 'tickets', 'replied', 1, '127.0.0.1', 'curl/8.7.1', '2026-08-22 09:31:00.719733', 1),
(114, 'authentication', 'login', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-22 10:17:39.924529', 1),
(115, 'authentication', 'logout', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-22 10:17:51.478994', 1),
(116, 'authentication', 'login', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-22 10:18:12.823115', 1),
(117, 'profile', 'updated', 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-22 10:20:09.285554', 1),
(118, 'authentication', 'login', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-23 19:52:12.052743', 1),
(119, 'authentication', 'login', NULL, '127.0.0.1', '', '2026-08-23 19:57:23.048942', 1),
(120, 'authentication', 'login', NULL, '127.0.0.1', '', '2026-08-23 19:57:51.124358', 1),
(121, 'authentication', 'login', NULL, '127.0.0.1', 'curl/8.7.1', '2026-08-23 19:58:42.823395', 1),
(122, 'authentication', 'login', NULL, '127.0.0.1', 'curl/8.7.1', '2026-08-23 19:58:58.839367', 1),
(123, 'customers', 'created', 52, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 09:58:52.516623', 1),
(124, 'notes', 'created', 51, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 09:59:24.665633', 1),
(125, 'documents', 'uploaded', 26, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 10:19:56.757540', 1),
(126, 'customers', 'updated', 52, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 10:20:47.683232', 1),
(127, 'contacts', 'updated', 50, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 10:26:12.907558', 1),
(128, 'leads', 'updated', 52, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 10:27:23.693134', 1),
(129, 'leads', 'created', 53, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 10:31:56.374506', 1),
(130, 'leads', 'converted', 53, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 10:32:29.171655', 1),
(131, 'customers', 'deleted', 53, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 10:33:03.755586', 1),
(132, 'deals', 'created', 51, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 10:40:37.121145', 1),
(133, 'deals', 'updated', 51, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 10:41:08.257759', 1),
(134, 'deals', 'deleted', 51, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 10:41:39.140178', 1),
(135, 'deals', 'stage_moved:New->Qualified', 5, '127.0.0.1', '', '2026-08-24 10:44:25.310216', 1),
(136, 'deals', 'stage_moved:New->New', 5, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 10:54:58.130262', 1),
(137, 'deals', 'stage_moved:New->Qualified', 10, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 10:55:07.239134', 1),
(138, 'deals', 'stage_moved:Qualified->Proposal', 46, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 10:55:47.323792', 1),
(139, 'deals', 'created', 52, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 10:57:07.877833', 1),
(140, 'deals', 'updated', 52, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 10:57:16.309407', 1),
(141, 'deals', 'deleted', 52, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 10:57:23.731607', 1),
(142, 'meetings', 'updated', 40, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 10:59:49.678259', 1),
(143, 'meetings', 'updated', 40, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 11:23:32.632730', 1),
(144, 'meetings', 'created', 41, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 11:25:18.873859', 1),
(145, 'meetings', 'updated', 41, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 11:25:29.424409', 1),
(146, 'meetings', 'deleted', 41, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 11:25:35.007831', 1),
(147, 'customer_tags', 'created', 9, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 11:29:22.973367', 1),
(148, 'customer_tags', 'updated', 9, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 11:29:30.286941', 1),
(149, 'customer_tags', 'deleted', 9, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 11:29:33.687106', 1),
(150, 'quotes', 'created', 34, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 11:41:09.042190', 1),
(151, 'quotes', 'updated', 34, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 11:42:08.482522', 1),
(152, 'quotes', 'deleted', 34, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 11:42:22.478792', 1),
(153, 'payments', 'recorded', 24, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 12:53:14.119633', 1),
(154, 'payments', 'deleted', 24, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 12:57:07.727275', 1),
(155, 'products', 'created', 51, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 13:01:16.135542', 1),
(156, 'products', 'updated', 51, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 13:02:10.884543', 1),
(157, 'products', 'deleted', 51, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 13:02:24.604565', 1),
(158, 'tickets', 'created', 36, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 13:54:42.150466', 1),
(159, 'tickets', 'updated', 36, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 13:55:17.906366', 1),
(160, 'tickets', 'updated', 36, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 13:57:22.094740', 1),
(161, 'tickets', 'deleted', 36, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 13:57:34.956900', 1),
(162, 'email_logs', 'bulk_sent(1)', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 14:08:09.407089', 1),
(163, 'email_templates', 'created', 7, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 14:08:41.760672', 1),
(164, 'email_templates', 'updated', 7, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 14:08:48.887769', 1),
(165, 'lead_sources', 'created', 9, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 14:44:18.833617', 1),
(166, 'lead_sources', 'updated', 9, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 14:44:29.534459', 1),
(167, 'tasks', 'created', 61, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-24 16:25:30.641479', 1),
(168, 'authentication', 'login', NULL, '127.0.0.1', 'curl/8.7.1', '2026-08-25 08:15:36.752375', 1),
(169, 'authentication', 'login', NULL, '127.0.0.1', 'curl/8.7.1', '2026-08-25 08:15:55.028293', 1),
(170, 'authentication', 'login', NULL, '127.0.0.1', 'curl/8.7.1', '2026-08-25 08:16:52.004392', 1),
(171, 'authentication', 'logout', NULL, '127.0.0.1', 'curl/8.7.1', '2026-08-25 08:17:38.913851', 1),
(172, 'authentication', 'login', NULL, '127.0.0.1', 'curl/8.7.1', '2026-08-25 08:21:27.126942', 1),
(173, 'tasks', 'updated', 61, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-25 08:43:07.114478', 1),
(174, 'tasks', 'status_changed', 61, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-25 08:43:18.222364', 1),
(175, 'tasks', 'deleted', 61, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-25 08:43:25.052842', 1),
(176, 'tasks', 'status_changed', 4, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-25 08:48:06.714255', 1),
(177, 'attachments', 'uploaded', 31, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-25 08:49:49.506682', 1),
(178, 'attachments', 'deleted', 10, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-25 08:50:01.007440', 1),
(179, 'products', 'created', 51, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-25 09:04:39.650262', 1),
(180, 'products', 'updated', 51, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-25 09:04:55.185149', 1),
(181, 'products', 'deleted', 51, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-25 09:05:05.776479', 1),
(182, 'tickets', 'created', 36, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-25 09:20:51.597966', 1),
(183, 'tickets', 'updated', 36, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-25 09:21:22.530967', 1),
(184, 'tickets', 'deleted', 36, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-25 09:21:32.884665', 1),
(185, 'email_templates', 'created', 7, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-25 09:22:50.280950', 1),
(186, 'email_templates', 'updated', 7, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-25 09:22:59.959247', 1),
(187, 'lead_sources', 'created', 9, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-25 09:42:02.077421', 1),
(188, 'lead_sources', 'updated', 9, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-25 09:42:10.473045', 1),
(189, 'users', 'created', 51, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-25 09:50:47.808078', 1),
(190, 'users', 'updated', 51, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-25 09:52:12.457465', 1),
(191, 'users', 'deleted', 51, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-25 09:52:19.345290', 1),
(192, 'roles', 'updated', 5, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-25 12:17:40.359418', 1),
(193, 'roles', 'updated', 4, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-25 12:18:10.015800', 1),
(194, 'roles', 'updated', 4, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-25 12:18:21.543547', 1),
(195, 'roles', 'created', 6, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-25 12:18:49.900676', 1),
(196, 'roles', 'updated', 6, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-25 12:19:02.440187', 1),
(197, 'login_logs', 'deleted', 1, '127.0.0.1', '', '2026-08-25 12:21:38.522642', 1),
(198, 'login_logs', 'deleted', 107, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-25 12:22:58.384568', 1),
(199, 'settings', 'updated', 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-25 12:58:02.816344', 1),
(200, 'authentication', 'logout', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-25 12:58:58.544037', 1),
(201, 'authentication', 'login', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-26 11:07:18.141802', 1),
(202, 'customers', 'created', 54, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-26 11:11:16.536159', 1),
(203, 'notes', 'created', 52, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-26 11:11:34.399089', 1),
(204, 'documents', 'uploaded', 27, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-26 11:12:01.811741', 1),
(205, 'documents', 'deleted', 27, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-26 11:12:13.227493', 1),
(206, 'documents', 'uploaded', 28, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-26 11:12:21.639730', 1),
(207, 'contacts', 'created', 51, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-26 11:14:01.366397', 1),
(208, 'contacts', 'updated', 51, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-26 11:14:10.677231', 1),
(209, 'customers', 'updated', 54, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-26 11:14:47.830930', 1),
(210, 'customers', 'deleted', 50, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-26 11:15:10.645441', 1),
(211, 'customers', 'restored', 53, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-26 11:15:22.647675', 1),
(212, 'contacts', 'updated', 51, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-26 11:16:16.470598', 1),
(213, 'authentication', 'login', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-26 11:18:21.087786', 1),
(214, 'leads', 'created', 51, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-26 11:20:43.772397', 1),
(215, 'notes', 'created', 53, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-26 11:21:11.199729', 1),
(216, 'leads', 'updated', 51, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-26 11:21:26.372143', 1),
(217, 'leads', 'converted', 51, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-26 11:21:40.602081', 1),
(218, 'deals', 'stage_moved:New->Qualified', 5, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-26 11:23:45.114006', 1),
(219, 'deals', 'stage_moved:Qualified->Proposal', 5, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-26 11:23:58.079393', 1),
(220, 'deals', 'stage_moved:Proposal->Negotiation', 5, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-26 11:24:08.971845', 1),
(221, 'deals', 'stage_moved:Negotiation->Won', 5, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-26 11:24:19.728270', 1),
(222, 'deals', 'created', 51, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-26 11:28:04.034997', 1),
(223, 'deals', 'updated', 51, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-26 11:28:32.100897', 1),
(224, 'deals', 'stage_moved:New->Qualified', 51, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-26 11:28:43.974978', 1),
(225, 'deals', 'deleted', 51, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-26 11:29:04.709773', 1),
(226, 'deals', 'created', 52, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-26 11:35:12.821019', 1),
(227, 'deals', 'updated', 52, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-26 11:35:25.047882', 1),
(228, 'deals', 'deleted', 52, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-26 11:35:47.287745', 1),
(229, 'authentication', 'login', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-26 21:18:33.259298', 1),
(230, 'authentication', 'login', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 07:40:39.755572', 1),
(231, 'customer_tags', 'created', 9, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 09:26:27.232971', 1),
(232, 'customer_tags', 'updated', 9, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 09:26:36.240623', 1),
(233, 'customer_tags', 'deleted', 9, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 09:26:42.333252', 1),
(234, 'quotes', 'created', 34, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 09:27:38.340550', 1),
(235, 'quotes', 'updated', 34, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 09:28:30.513421', 1),
(236, 'quotes', 'deleted', 33, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 09:28:53.772658', 1),
(237, 'invoices', 'created_from_quote', 42, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 09:29:03.246753', 1),
(238, 'invoices', 'deleted', 41, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 09:30:13.994315', 1),
(239, 'payments', 'recorded', 24, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 09:31:15.354134', 1),
(240, 'products', 'created', 51, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 09:34:39.480126', 1),
(241, 'products', 'updated', 51, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 09:34:51.513432', 1),
(242, 'products', 'deleted', 51, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 09:35:02.274825', 1),
(243, 'tickets', 'created', 36, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 09:40:09.778004', 1),
(244, 'tickets', 'updated', 36, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 09:40:27.751272', 1),
(245, 'tickets', 'deleted', 36, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 09:40:38.534343', 1),
(246, 'email_logs', 'bulk_sent(1)', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 09:42:24.797284', 1),
(247, 'email_templates', 'created', 7, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 09:43:55.229354', 1),
(248, 'email_templates', 'updated', 7, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 09:44:03.957814', 1),
(249, 'email_logs', 'bulk_sent(2)', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 09:44:27.391899', 1),
(250, 'lead_sources', 'created', 10, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 09:45:42.790879', 1),
(251, 'lead_sources', 'updated', 10, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 09:45:52.625475', 1),
(252, 'tasks', 'created', 61, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 09:50:07.928339', 1),
(253, 'tasks', 'updated', 61, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 09:50:15.655428', 1),
(254, 'tasks', 'status_changed', 61, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 09:50:23.076974', 1),
(255, 'tasks', 'status_changed', 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 09:50:44.810863', 1),
(256, 'tasks', 'status_changed', 25, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 09:50:50.380689', 1),
(257, 'tasks', 'status_changed', 61, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 09:52:08.929889', 1),
(258, 'tasks', 'status_changed', 58, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 09:52:15.230621', 1),
(259, 'meetings', 'updated', 30, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 09:52:43.635532', 1),
(260, 'meetings', 'created', 41, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 09:53:49.768113', 1),
(261, 'meetings', 'updated', 31, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 09:53:58.490507', 1),
(262, 'attachments', 'uploaded', 32, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 10:21:00.352925', 1),
(263, 'attachments', 'deleted', 32, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 10:21:04.708654', 1),
(264, 'attachments', 'uploaded', 33, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 10:21:45.821014', 1),
(265, 'attachments', 'deleted', 31, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 10:21:55.748473', 1),
(266, 'users', 'created', 51, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 10:24:31.451204', 1),
(267, 'profile', 'updated', 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 10:42:19.591156', 1),
(268, 'authentication', 'logout', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 10:42:52.763678', 1),
(269, 'authentication', 'login', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 10:43:25.457016', 51),
(270, 'authentication', 'logout', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 10:44:09.790768', 51),
(271, 'authentication', 'login', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 10:44:50.453654', 2),
(272, 'authentication', 'logout', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 10:45:11.254238', 2),
(273, 'authentication', 'login', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 10:45:24.332213', 1),
(274, 'authentication', 'login', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 10:46:15.792425', 1);

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` bigint(20) NOT NULL,
  `module` varchar(20) NOT NULL,
  `record_id` int(11) DEFAULT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(100) NOT NULL,
  `file_type` varchar(100) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attachments`
--

INSERT INTO `attachments` (`id`, `module`, `record_id`, `file_name`, `file_path`, `file_type`, `file_size`, `created_at`, `user_id`) VALUES
(1, 'ticket', 37, 'Logo_Assets.zip', 'attachments/Logo_Assets.zip', 'application/zip', 6205, '2026-05-13 20:09:23.419967', 39),
(2, 'task', 13, 'Signed_Contract.pdf', 'attachments/Signed_Contract.pdf', 'application/pdf', 1567, '2026-04-23 05:01:23.422317', 35),
(3, 'deal', 6, 'Logo_Assets.zip', 'attachments/Logo_Assets_W5u4wak.zip', 'application/zip', 4744, '2026-07-10 04:39:23.424185', 41),
(4, 'general', 39, 'Logo_Assets.zip', 'attachments/Logo_Assets_9qeeG69.zip', 'application/zip', 2501, '2026-04-19 08:11:23.425851', 3),
(5, 'deal', 14, 'Presentation_Deck.pptx', 'attachments/Presentation_Deck.pptx', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 1615, '2026-06-23 22:40:23.427551', 25),
(6, 'customer', 24, 'Logo_Assets.zip', 'attachments/Logo_Assets_5oyMlv8.zip', 'application/zip', 1619, '2026-04-12 08:12:23.429997', 30),
(7, 'task', 11, 'Budget_Sheet.xlsx', 'attachments/Budget_Sheet.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 8088, '2026-07-25 03:48:23.431515', 27),
(8, 'customer', 25, 'Signed_Contract.pdf', 'attachments/Signed_Contract_qiNa7S8.pdf', 'application/pdf', 4963, '2026-07-01 03:27:23.433435', 48),
(9, 'general', 43, 'Presentation_Deck.pptx', 'attachments/Presentation_Deck_X6PrlxJ.pptx', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 3583, '2026-04-23 02:44:23.434926', 28),
(11, 'customer', 26, 'Q3_Report.pdf', 'attachments/Q3_Report.pdf', 'application/pdf', 2214, '2026-06-19 16:01:23.439587', 29),
(12, 'task', 37, 'Logo_Assets.zip', 'attachments/Logo_Assets_vBRZQby.zip', 'application/zip', 5067, '2026-08-11 09:17:23.442494', 30),
(13, 'deal', 45, 'Budget_Sheet.xlsx', 'attachments/Budget_Sheet_dyT7Cgm.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 6340, '2026-06-06 19:43:23.444527', 30),
(14, 'lead', 40, 'Presentation_Deck.pptx', 'attachments/Presentation_Deck_EVJ6bCt.pptx', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 4446, '2026-05-03 17:58:23.446236', 16),
(15, 'customer', 26, 'Presentation_Deck.pptx', 'attachments/Presentation_Deck_al6JZob.pptx', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 6768, '2026-08-11 00:26:23.448000', 37),
(16, 'ticket', 19, 'Presentation_Deck.pptx', 'attachments/Presentation_Deck_7iUL65c.pptx', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 3288, '2026-08-04 09:36:23.449630', 41),
(17, 'ticket', 8, 'Presentation_Deck.pptx', 'attachments/Presentation_Deck_dmLBdQZ.pptx', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 5088, '2026-05-20 05:34:23.451086', 27),
(18, 'deal', 27, 'Q3_Report.pdf', 'attachments/Q3_Report_RNhmpkp.pdf', 'application/pdf', 5178, '2026-04-29 03:06:23.452856', 50),
(19, 'task', 2, 'Presentation_Deck.pptx', 'attachments/Presentation_Deck_HPbVO3M.pptx', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 5191, '2026-08-03 11:38:23.454718', 3),
(20, 'general', 26, 'Signed_Contract.pdf', 'attachments/Signed_Contract_DwiMhte.pdf', 'application/pdf', 4168, '2026-07-03 20:20:23.456803', 22),
(21, 'general', 9, 'Q3_Report.pdf', 'attachments/Q3_Report_iKg5zCx.pdf', 'application/pdf', 3098, '2026-05-30 10:35:23.460219', 8),
(22, 'customer', 6, 'Signed_Contract.pdf', 'attachments/Signed_Contract_0L5O2HE.pdf', 'application/pdf', 5017, '2026-04-03 11:07:23.462934', 30),
(23, 'deal', 11, 'Signed_Contract.pdf', 'attachments/Signed_Contract_geKXb0q.pdf', 'application/pdf', 2194, '2026-07-10 07:44:23.464935', 31),
(24, 'customer', 35, 'Q3_Report.pdf', 'attachments/Q3_Report_KiGz7Yc.pdf', 'application/pdf', 2497, '2026-05-14 03:18:23.466547', 19),
(25, 'lead', 29, 'Q3_Report.pdf', 'attachments/Q3_Report_6Guvjog.pdf', 'application/pdf', 6595, '2026-05-23 03:09:23.468307', 18),
(26, 'lead', 29, 'Q3_Report.pdf', 'attachments/Q3_Report_MUfAtoB.pdf', 'application/pdf', 6575, '2026-08-09 11:31:23.469990', 35),
(27, 'general', 43, 'Logo_Assets.zip', 'attachments/Logo_Assets_2wrZbjJ.zip', 'application/zip', 6297, '2026-07-26 19:38:23.471449', 43),
(28, 'ticket', 1, 'Budget_Sheet.xlsx', 'attachments/Budget_Sheet_T6ZrgBC.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 4683, '2026-08-09 19:33:23.473695', 4),
(29, 'lead', 13, 'Presentation_Deck.pptx', 'attachments/Presentation_Deck_CV7SEqP.pptx', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 3091, '2026-07-30 07:56:23.476010', 24),
(30, 'lead', 44, 'Q3_Report.pdf', 'attachments/Q3_Report_J6KEYB9.pdf', 'application/pdf', 1165, '2026-08-06 00:26:23.477513', 22),
(33, 'general', NULL, 'revenue_report.csv', 'attachments/revenue_report.csv', 'text/csv', 432, '2026-08-27 10:21:45.816725', 1);

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` bigint(20) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `record_id` int(11) DEFAULT NULL,
  `action` varchar(20) NOT NULL,
  `old_values` json DEFAULT NULL,
  `new_values` json DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `audit_logs`
--

INSERT INTO `audit_logs` (`id`, `table_name`, `record_id`, `action`, `old_values`, `new_values`, `ip_address`, `created_at`, `user_id`) VALUES
(1, 'deals', 49, 'DELETE', NULL, '{\"id\": 49, \"note\": \"seed audit entry\", \"status\": \"Approved\"}', '192.168.1.89', '2026-07-30 21:28:23.413030', 16),
(2, 'leads', 30, 'UPDATE', NULL, '{\"id\": 30, \"note\": \"seed audit entry\", \"status\": \"Approved\"}', '192.168.1.167', '2026-07-30 21:28:23.413030', 45),
(3, 'customers', 39, 'UPDATE', NULL, '{\"id\": 39, \"note\": \"seed audit entry\", \"status\": \"Updated\"}', '192.168.1.107', '2026-07-30 21:28:23.413030', 1),
(4, 'users', 45, 'LOGOUT', NULL, '{\"id\": 45, \"note\": \"seed audit entry\", \"status\": \"Approved\"}', '192.168.1.22', '2026-07-30 21:28:23.413030', 26),
(5, 'products', 42, 'LOGIN', NULL, '{\"id\": 42, \"note\": \"seed audit entry\", \"status\": \"Approved\"}', '192.168.1.174', '2026-07-30 21:28:23.413030', 2),
(6, 'customers', 23, 'LOGIN', '{\"id\": 23, \"status\": \"Previous\"}', '{\"id\": 23, \"note\": \"seed audit entry\", \"status\": \"Updated\"}', '192.168.1.47', '2026-07-30 21:28:23.413030', 23),
(7, 'products', 50, 'LOGIN', '{\"id\": 50, \"status\": \"Previous\"}', '{\"id\": 50, \"note\": \"seed audit entry\", \"status\": \"Approved\"}', '192.168.1.96', '2026-07-30 21:28:23.413030', 8),
(8, 'leads', 29, 'DELETE', NULL, '{\"id\": 29, \"note\": \"seed audit entry\", \"status\": \"Active\"}', '192.168.1.176', '2026-07-30 21:28:23.413030', 2),
(9, 'settings', 23, 'DELETE', NULL, '{\"id\": 23, \"note\": \"seed audit entry\", \"status\": \"Active\"}', '192.168.1.208', '2026-07-30 21:28:23.413030', 40),
(10, 'settings', 15, 'CREATE', '{\"id\": 15, \"status\": \"Previous\"}', '{\"id\": 15, \"note\": \"seed audit entry\", \"status\": \"Active\"}', '192.168.1.73', '2026-07-30 21:28:23.413030', 24),
(11, 'invoices', 46, 'UPDATE', '{\"id\": 46, \"status\": \"Previous\"}', '{\"id\": 46, \"note\": \"seed audit entry\", \"status\": \"Approved\"}', '192.168.1.253', '2026-07-30 21:28:23.413030', 1),
(12, 'products', 41, 'LOGOUT', NULL, '{\"id\": 41, \"note\": \"seed audit entry\", \"status\": \"Updated\"}', '192.168.1.130', '2026-07-30 21:28:23.413030', 18),
(13, 'invoices', 11, 'LOGOUT', NULL, '{\"id\": 11, \"note\": \"seed audit entry\", \"status\": \"Approved\"}', '192.168.1.174', '2026-07-30 21:28:23.413030', 48),
(14, 'settings', 39, 'UPDATE', NULL, '{\"id\": 39, \"note\": \"seed audit entry\", \"status\": \"Approved\"}', '192.168.1.192', '2026-07-30 21:28:23.413030', 38),
(15, 'customers', 9, 'LOGOUT', '{\"id\": 9, \"status\": \"Previous\"}', '{\"id\": 9, \"note\": \"seed audit entry\", \"status\": \"Updated\"}', '192.168.1.188', '2026-07-30 21:28:23.413030', 15),
(16, 'products', 18, 'LOGOUT', '{\"id\": 18, \"status\": \"Previous\"}', '{\"id\": 18, \"note\": \"seed audit entry\", \"status\": \"Active\"}', '192.168.1.159', '2026-07-30 21:28:23.413030', 2),
(17, 'deals', 44, 'LOGIN', '{\"id\": 44, \"status\": \"Previous\"}', '{\"id\": 44, \"note\": \"seed audit entry\", \"status\": \"Approved\"}', '192.168.1.166', '2026-07-30 21:28:23.413030', 1),
(18, 'settings', 42, 'LOGIN', '{\"id\": 42, \"status\": \"Previous\"}', '{\"id\": 42, \"note\": \"seed audit entry\", \"status\": \"Active\"}', '192.168.1.218', '2026-07-30 21:28:23.413030', 21),
(19, 'invoices', 18, 'LOGIN', '{\"id\": 18, \"status\": \"Previous\"}', '{\"id\": 18, \"note\": \"seed audit entry\", \"status\": \"Active\"}', '192.168.1.94', '2026-07-30 21:28:23.413030', 30),
(20, 'users', 49, 'CREATE', '{\"id\": 49, \"status\": \"Previous\"}', '{\"id\": 49, \"note\": \"seed audit entry\", \"status\": \"Active\"}', '192.168.1.73', '2026-07-30 21:28:23.413030', 15),
(21, 'invoices', 35, 'UPDATE', NULL, '{\"id\": 35, \"note\": \"seed audit entry\", \"status\": \"Updated\"}', '192.168.1.87', '2026-07-30 21:28:23.413030', 26),
(22, 'customers', 37, 'LOGIN', '{\"id\": 37, \"status\": \"Previous\"}', '{\"id\": 37, \"note\": \"seed audit entry\", \"status\": \"Active\"}', '192.168.1.247', '2026-07-30 21:28:23.413030', 15),
(23, 'customers', 16, 'CREATE', NULL, '{\"id\": 16, \"note\": \"seed audit entry\", \"status\": \"Active\"}', '192.168.1.162', '2026-07-30 21:28:23.413030', 20),
(24, 'settings', 7, 'LOGOUT', NULL, '{\"id\": 7, \"note\": \"seed audit entry\", \"status\": \"Active\"}', '192.168.1.206', '2026-07-30 21:28:23.413030', 2),
(25, 'settings', 22, 'UPDATE', NULL, '{\"id\": 22, \"note\": \"seed audit entry\", \"status\": \"Updated\"}', '192.168.1.247', '2026-07-30 21:28:23.413030', 31),
(26, 'deals', 4, 'CREATE', '{\"id\": 4, \"status\": \"Previous\"}', '{\"id\": 4, \"note\": \"seed audit entry\", \"status\": \"Updated\"}', '192.168.1.200', '2026-07-30 21:28:23.413030', 16),
(27, 'users', 40, 'LOGIN', '{\"id\": 40, \"status\": \"Previous\"}', '{\"id\": 40, \"note\": \"seed audit entry\", \"status\": \"Updated\"}', '192.168.1.150', '2026-07-30 21:28:23.413030', 41),
(28, 'customers', 6, 'DELETE', '{\"id\": 6, \"status\": \"Previous\"}', '{\"id\": 6, \"note\": \"seed audit entry\", \"status\": \"Active\"}', '192.168.1.229', '2026-07-30 21:28:23.413030', 25),
(29, 'products', 45, 'LOGIN', '{\"id\": 45, \"status\": \"Previous\"}', '{\"id\": 45, \"note\": \"seed audit entry\", \"status\": \"Active\"}', '192.168.1.16', '2026-07-30 21:28:23.413030', 4),
(30, 'deals', 40, 'CREATE', NULL, '{\"id\": 40, \"note\": \"seed audit entry\", \"status\": \"Approved\"}', '192.168.1.145', '2026-07-30 21:28:23.413030', 7),
(31, 'customers', 19, 'LOGIN', NULL, '{\"id\": 19, \"note\": \"seed audit entry\", \"status\": \"Updated\"}', '192.168.1.61', '2026-07-30 21:28:23.413030', 40),
(32, 'products', 39, 'LOGIN', '{\"id\": 39, \"status\": \"Previous\"}', '{\"id\": 39, \"note\": \"seed audit entry\", \"status\": \"Approved\"}', '192.168.1.120', '2026-07-30 21:28:23.413030', 30),
(33, 'products', 28, 'CREATE', '{\"id\": 28, \"status\": \"Previous\"}', '{\"id\": 28, \"note\": \"seed audit entry\", \"status\": \"Approved\"}', '192.168.1.118', '2026-07-30 21:28:23.413030', 22),
(34, 'users', 22, 'CREATE', NULL, '{\"id\": 22, \"note\": \"seed audit entry\", \"status\": \"Approved\"}', '192.168.1.154', '2026-07-30 21:28:23.413030', 7),
(35, 'settings', 5, 'LOGOUT', '{\"id\": 5, \"status\": \"Previous\"}', '{\"id\": 5, \"note\": \"seed audit entry\", \"status\": \"Approved\"}', '192.168.1.34', '2026-07-30 21:28:23.413030', 13),
(36, 'settings', 33, 'LOGOUT', NULL, '{\"id\": 33, \"note\": \"seed audit entry\", \"status\": \"Updated\"}', '192.168.1.115', '2026-07-30 21:28:23.413030', 31),
(37, 'leads', 16, 'UPDATE', '{\"id\": 16, \"status\": \"Previous\"}', '{\"id\": 16, \"note\": \"seed audit entry\", \"status\": \"Active\"}', '192.168.1.81', '2026-07-30 21:28:23.413030', 4),
(38, 'users', 28, 'DELETE', '{\"id\": 28, \"status\": \"Previous\"}', '{\"id\": 28, \"note\": \"seed audit entry\", \"status\": \"Approved\"}', '192.168.1.81', '2026-07-30 21:28:23.413030', 49),
(39, 'users', 35, 'LOGOUT', NULL, '{\"id\": 35, \"note\": \"seed audit entry\", \"status\": \"Active\"}', '192.168.1.89', '2026-07-30 21:28:23.413030', 20),
(40, 'deals', 24, 'UPDATE', '{\"id\": 24, \"status\": \"Previous\"}', '{\"id\": 24, \"note\": \"seed audit entry\", \"status\": \"Active\"}', '192.168.1.16', '2026-07-30 21:28:23.413030', 43),
(41, 'leads', 33, 'DELETE', '{\"id\": 33, \"status\": \"Previous\"}', '{\"id\": 33, \"note\": \"seed audit entry\", \"status\": \"Approved\"}', '192.168.1.52', '2026-07-30 21:28:23.413030', 28),
(42, 'leads', 41, 'UPDATE', '{\"id\": 41, \"status\": \"Previous\"}', '{\"id\": 41, \"note\": \"seed audit entry\", \"status\": \"Active\"}', '192.168.1.172', '2026-07-30 21:28:23.413030', 22),
(43, 'invoices', 45, 'DELETE', '{\"id\": 45, \"status\": \"Previous\"}', '{\"id\": 45, \"note\": \"seed audit entry\", \"status\": \"Approved\"}', '192.168.1.220', '2026-07-30 21:28:23.413030', 39),
(44, 'users', 37, 'DELETE', '{\"id\": 37, \"status\": \"Previous\"}', '{\"id\": 37, \"note\": \"seed audit entry\", \"status\": \"Updated\"}', '192.168.1.43', '2026-07-30 21:28:23.413030', 27),
(45, 'customers', 30, 'UPDATE', NULL, '{\"id\": 30, \"note\": \"seed audit entry\", \"status\": \"Active\"}', '192.168.1.179', '2026-07-30 21:28:23.413030', 1),
(46, 'leads', 30, 'DELETE', NULL, '{\"id\": 30, \"note\": \"seed audit entry\", \"status\": \"Approved\"}', '192.168.1.208', '2026-07-30 21:28:23.413030', 31),
(47, 'settings', 25, 'DELETE', NULL, '{\"id\": 25, \"note\": \"seed audit entry\", \"status\": \"Active\"}', '192.168.1.4', '2026-07-30 21:28:23.413030', 1),
(48, 'customers', 23, 'DELETE', '{\"id\": 23, \"status\": \"Previous\"}', '{\"id\": 23, \"note\": \"seed audit entry\", \"status\": \"Active\"}', '192.168.1.114', '2026-07-30 21:28:23.413030', 10),
(49, 'leads', 41, 'CREATE', '{\"id\": 41, \"status\": \"Previous\"}', '{\"id\": 41, \"note\": \"seed audit entry\", \"status\": \"Approved\"}', '192.168.1.251', '2026-07-30 21:28:23.413030', 24),
(50, 'customers', 13, 'DELETE', NULL, '{\"id\": 13, \"note\": \"seed audit entry\", \"status\": \"Active\"}', '192.168.1.186', '2026-07-30 21:28:23.413030', 15),
(51, 'customers', 52, 'CREATE', NULL, '{\"email\": \"clydey@test.com\", \"company_name\": \"clydey Ednalan\"}', '127.0.0.1', '2026-08-24 09:58:52.519986', 1),
(52, 'customers', 52, 'UPDATE', '{\"email\": \"clydey@test.com\", \"status\": \"Active\", \"company_name\": \"clydey Ednalan\"}', '{\"email\": \"clydey@test.com\", \"company_name\": \"clydey Ednalan\"}', '127.0.0.1', '2026-08-24 10:20:47.689150', 1),
(53, 'leads', 51, 'DELETE', '{\"name\": \"Test Lead\"}', NULL, '127.0.0.1', '2026-08-24 10:26:59.418060', 1),
(54, 'leads', 52, 'DELETE', '{\"name\": \"Test Lead\"}', NULL, '127.0.0.1', '2026-08-24 10:27:42.765024', 1),
(55, 'leads', 53, 'DELETE', '{\"name\": \"catlin ednalan\"}', NULL, '127.0.0.1', '2026-08-24 10:32:52.797770', 1),
(56, 'customers', 53, 'DELETE', '{\"company_name\": \"catlincompany\"}', NULL, '127.0.0.1', '2026-08-24 10:33:03.756557', 1),
(57, 'users', 51, 'DELETE', '{\"username\": \"test1\"}', NULL, '127.0.0.1', '2026-08-25 09:52:19.314215', 1),
(58, 'roles', 5, 'UPDATE', '{\"description\": \"Handles customer support tickets\"}', '{\"description\": \"Handles customer support tickets\", \"permissions\": 13}', '127.0.0.1', '2026-08-25 12:17:40.356788', 1),
(59, 'roles', 4, 'UPDATE', '{\"description\": \"Manages customers, leads and deals\"}', '{\"description\": \"Manages customers, leads and deals\", \"permissions\": 33}', '127.0.0.1', '2026-08-25 12:18:10.013622', 1),
(60, 'roles', 4, 'UPDATE', '{\"description\": \"Manages customers, leads and deals\"}', '{\"description\": \"Manages customers, leads and deals\", \"permissions\": 32}', '127.0.0.1', '2026-08-25 12:18:21.541387', 1),
(61, 'roles', 6, 'UPDATE', '{\"description\": \"test\"}', '{\"description\": \"test\", \"permissions\": 7}', '127.0.0.1', '2026-08-25 12:19:02.438552', 1),
(62, 'roles', 6, 'DELETE', '{\"name\": \"test\"}', NULL, '127.0.0.1', '2026-08-25 12:19:24.738214', 1),
(63, 'settings', 1, 'UPDATE', NULL, '{\"currency\": \"USD\", \"company_name\": \"TechNova Solutions Inc.\"}', '127.0.0.1', '2026-08-25 12:58:02.812359', 1),
(64, 'customers', 54, 'CREATE', NULL, '{\"email\": \"catlin@test.com\", \"company_name\": \"Cairocoders\"}', '127.0.0.1', '2026-08-26 11:11:16.538706', 1),
(65, 'customers', 54, 'UPDATE', '{\"email\": \"catlin@test.com\", \"status\": \"Active\", \"company_name\": \"Cairocoders\"}', '{\"email\": \"catlin@test.com\", \"company_name\": \"Cairocoders\"}', '127.0.0.1', '2026-08-26 11:14:47.834025', 1),
(66, 'customers', 50, 'DELETE', '{\"company_name\": \"Wise Owl Bookstores\"}', NULL, '127.0.0.1', '2026-08-26 11:15:10.646647', 1),
(67, 'customers', 50, 'DELETE', '{\"company\": \"Wise Owl Bookstores\"}', NULL, '127.0.0.1', '2026-08-26 11:15:35.437757', 1),
(68, 'leads', 49, 'DELETE', '{\"name\": \"Kevin Ramirez\"}', NULL, '127.0.0.1', '2026-08-26 11:22:08.520191', 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 3, 'add_permission'),
(6, 'Can change permission', 3, 'change_permission'),
(7, 'Can delete permission', 3, 'delete_permission'),
(8, 'Can view permission', 3, 'view_permission'),
(9, 'Can add group', 2, 'add_group'),
(10, 'Can change group', 2, 'change_group'),
(11, 'Can delete group', 2, 'delete_group'),
(12, 'Can view group', 2, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 43, 'add_user'),
(22, 'Can change user', 43, 'change_user'),
(23, 'Can delete user', 43, 'delete_user'),
(24, 'Can view user', 43, 'view_user'),
(25, 'Can add customer tag', 12, 'add_customertag'),
(26, 'Can change customer tag', 12, 'change_customertag'),
(27, 'Can delete customer tag', 12, 'delete_customertag'),
(28, 'Can view customer tag', 12, 'view_customertag'),
(29, 'Can add deal stage', 15, 'add_dealstage'),
(30, 'Can change deal stage', 15, 'change_dealstage'),
(31, 'Can delete deal stage', 15, 'delete_dealstage'),
(32, 'Can view deal stage', 15, 'view_dealstage'),
(33, 'Can add email template', 17, 'add_emailtemplate'),
(34, 'Can change email template', 17, 'change_emailtemplate'),
(35, 'Can delete email template', 17, 'delete_emailtemplate'),
(36, 'Can view email template', 17, 'view_emailtemplate'),
(37, 'Can add lead source', 22, 'add_leadsource'),
(38, 'Can change lead source', 22, 'change_leadsource'),
(39, 'Can delete lead source', 22, 'delete_leadsource'),
(40, 'Can view lead source', 22, 'view_leadsource'),
(41, 'Can add lead status', 23, 'add_leadstatus'),
(42, 'Can change lead status', 23, 'change_leadstatus'),
(43, 'Can delete lead status', 23, 'delete_leadstatus'),
(44, 'Can view lead status', 23, 'view_leadstatus'),
(45, 'Can add permission', 30, 'add_permission'),
(46, 'Can change permission', 30, 'change_permission'),
(47, 'Can delete permission', 30, 'delete_permission'),
(48, 'Can view permission', 30, 'view_permission'),
(49, 'Can add pipeline', 31, 'add_pipeline'),
(50, 'Can change pipeline', 31, 'change_pipeline'),
(51, 'Can delete pipeline', 31, 'delete_pipeline'),
(52, 'Can view pipeline', 31, 'view_pipeline'),
(53, 'Can add product', 32, 'add_product'),
(54, 'Can change product', 32, 'change_product'),
(55, 'Can delete product', 32, 'delete_product'),
(56, 'Can view product', 32, 'view_product'),
(57, 'Can add product category', 33, 'add_productcategory'),
(58, 'Can change product category', 33, 'change_productcategory'),
(59, 'Can delete product category', 33, 'delete_productcategory'),
(60, 'Can view product category', 33, 'view_productcategory'),
(61, 'Can add role', 36, 'add_role'),
(62, 'Can change role', 36, 'change_role'),
(63, 'Can delete role', 36, 'delete_role'),
(64, 'Can view role', 36, 'view_role'),
(65, 'Can add setting', 38, 'add_setting'),
(66, 'Can change setting', 38, 'change_setting'),
(67, 'Can delete setting', 38, 'delete_setting'),
(68, 'Can view setting', 38, 'view_setting'),
(69, 'Can add ticket category', 41, 'add_ticketcategory'),
(70, 'Can change ticket category', 41, 'change_ticketcategory'),
(71, 'Can delete ticket category', 41, 'delete_ticketcategory'),
(72, 'Can view ticket category', 41, 'view_ticketcategory'),
(73, 'Can add activity log', 6, 'add_activitylog'),
(74, 'Can change activity log', 6, 'change_activitylog'),
(75, 'Can delete activity log', 6, 'delete_activitylog'),
(76, 'Can view activity log', 6, 'view_activitylog'),
(77, 'Can add attachment', 7, 'add_attachment'),
(78, 'Can change attachment', 7, 'change_attachment'),
(79, 'Can delete attachment', 7, 'delete_attachment'),
(80, 'Can view attachment', 7, 'view_attachment'),
(81, 'Can add audit log', 8, 'add_auditlog'),
(82, 'Can change audit log', 8, 'change_auditlog'),
(83, 'Can delete audit log', 8, 'delete_auditlog'),
(84, 'Can view audit log', 8, 'view_auditlog'),
(85, 'Can add customer', 9, 'add_customer'),
(86, 'Can change customer', 9, 'change_customer'),
(87, 'Can delete customer', 9, 'delete_customer'),
(88, 'Can view customer', 9, 'view_customer'),
(89, 'Can add customer contact', 10, 'add_customercontact'),
(90, 'Can change customer contact', 10, 'change_customercontact'),
(91, 'Can delete customer contact', 10, 'delete_customercontact'),
(92, 'Can view customer contact', 10, 'view_customercontact'),
(93, 'Can add customer document', 11, 'add_customerdocument'),
(94, 'Can change customer document', 11, 'change_customerdocument'),
(95, 'Can delete customer document', 11, 'delete_customerdocument'),
(96, 'Can view customer document', 11, 'view_customerdocument'),
(97, 'Can add customer tag map', 13, 'add_customertagmap'),
(98, 'Can change customer tag map', 13, 'change_customertagmap'),
(99, 'Can delete customer tag map', 13, 'delete_customertagmap'),
(100, 'Can view customer tag map', 13, 'view_customertagmap'),
(101, 'Can add email log', 16, 'add_emaillog'),
(102, 'Can change email log', 16, 'change_emaillog'),
(103, 'Can delete email log', 16, 'delete_emaillog'),
(104, 'Can view email log', 16, 'view_emaillog'),
(105, 'Can add invoice', 18, 'add_invoice'),
(106, 'Can change invoice', 18, 'change_invoice'),
(107, 'Can delete invoice', 18, 'delete_invoice'),
(108, 'Can view invoice', 18, 'view_invoice'),
(109, 'Can add lead', 20, 'add_lead'),
(110, 'Can change lead', 20, 'change_lead'),
(111, 'Can delete lead', 20, 'delete_lead'),
(112, 'Can view lead', 20, 'view_lead'),
(113, 'Can add deal', 14, 'add_deal'),
(114, 'Can change deal', 14, 'change_deal'),
(115, 'Can delete deal', 14, 'delete_deal'),
(116, 'Can view deal', 14, 'view_deal'),
(117, 'Can add lead activity', 21, 'add_leadactivity'),
(118, 'Can change lead activity', 21, 'change_leadactivity'),
(119, 'Can delete lead activity', 21, 'delete_leadactivity'),
(120, 'Can view lead activity', 21, 'view_leadactivity'),
(121, 'Can add login log', 24, 'add_loginlog'),
(122, 'Can change login log', 24, 'change_loginlog'),
(123, 'Can delete login log', 24, 'delete_loginlog'),
(124, 'Can view login log', 24, 'view_loginlog'),
(125, 'Can add meeting', 25, 'add_meeting'),
(126, 'Can change meeting', 25, 'change_meeting'),
(127, 'Can delete meeting', 25, 'delete_meeting'),
(128, 'Can view meeting', 25, 'view_meeting'),
(129, 'Can add meeting attendee', 26, 'add_meetingattendee'),
(130, 'Can change meeting attendee', 26, 'change_meetingattendee'),
(131, 'Can delete meeting attendee', 26, 'delete_meetingattendee'),
(132, 'Can view meeting attendee', 26, 'view_meetingattendee'),
(133, 'Can add note', 27, 'add_note'),
(134, 'Can change note', 27, 'change_note'),
(135, 'Can delete note', 27, 'delete_note'),
(136, 'Can view note', 27, 'view_note'),
(137, 'Can add notification', 28, 'add_notification'),
(138, 'Can change notification', 28, 'change_notification'),
(139, 'Can delete notification', 28, 'delete_notification'),
(140, 'Can view notification', 28, 'view_notification'),
(141, 'Can add payment', 29, 'add_payment'),
(142, 'Can change payment', 29, 'change_payment'),
(143, 'Can delete payment', 29, 'delete_payment'),
(144, 'Can view payment', 29, 'view_payment'),
(145, 'Can add invoice item', 19, 'add_invoiceitem'),
(146, 'Can change invoice item', 19, 'change_invoiceitem'),
(147, 'Can delete invoice item', 19, 'delete_invoiceitem'),
(148, 'Can view invoice item', 19, 'view_invoiceitem'),
(149, 'Can add quote', 34, 'add_quote'),
(150, 'Can change quote', 34, 'change_quote'),
(151, 'Can delete quote', 34, 'delete_quote'),
(152, 'Can view quote', 34, 'view_quote'),
(153, 'Can add quote item', 35, 'add_quoteitem'),
(154, 'Can change quote item', 35, 'change_quoteitem'),
(155, 'Can delete quote item', 35, 'delete_quoteitem'),
(156, 'Can view quote item', 35, 'view_quoteitem'),
(157, 'Can add role permission', 37, 'add_rolepermission'),
(158, 'Can change role permission', 37, 'change_rolepermission'),
(159, 'Can delete role permission', 37, 'delete_rolepermission'),
(160, 'Can view role permission', 37, 'view_rolepermission'),
(161, 'Can add task', 39, 'add_task'),
(162, 'Can change task', 39, 'change_task'),
(163, 'Can delete task', 39, 'delete_task'),
(164, 'Can view task', 39, 'view_task'),
(165, 'Can add ticket', 40, 'add_ticket'),
(166, 'Can change ticket', 40, 'change_ticket'),
(167, 'Can delete ticket', 40, 'delete_ticket'),
(168, 'Can view ticket', 40, 'view_ticket'),
(169, 'Can add ticket reply', 42, 'add_ticketreply'),
(170, 'Can change ticket reply', 42, 'change_ticketreply'),
(171, 'Can delete ticket reply', 42, 'delete_ticketreply'),
(172, 'Can view ticket reply', 42, 'view_ticketreply');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) NOT NULL,
  `customer_code` varchar(30) NOT NULL,
  `company_name` varchar(150) NOT NULL,
  `customer_type` varchar(20) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `website` varchar(150) NOT NULL,
  `industry` varchar(80) NOT NULL,
  `tax_number` varchar(50) NOT NULL,
  `billing_address` varchar(255) NOT NULL,
  `shipping_address` varchar(255) NOT NULL,
  `city` varchar(80) NOT NULL,
  `state` varchar(80) NOT NULL,
  `country` varchar(80) NOT NULL,
  `postal_code` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `notes` longtext NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `assigned_to` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_code`, `company_name`, `customer_type`, `first_name`, `last_name`, `email`, `phone`, `mobile`, `website`, `industry`, `tax_number`, `billing_address`, `shipping_address`, `city`, `state`, `country`, `postal_code`, `status`, `notes`, `image`, `is_deleted`, `created_at`, `updated_at`, `assigned_to`) VALUES
(1, 'CUS-00001', 'Apex Global Solutions', 'Individual', 'Jason', 'Wright', 'contact@apex-global-soluti.com', '+1 676-646-5397', '+1 530-451-2419', 'https://www.apex-global-solutions.com', 'Manufacturing', 'TX-70505620', '259 River Rd', '593 Commerce Way', 'Munich', 'Bavaria', 'Germany', '97580', 'Active', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2026-03-03 07:51:22.174308', '2026-08-22 08:22:22.173073', 19),
(2, 'CUS-00002', 'BlueSky Technologies', 'Business', 'Christopher', 'Lopez', 'contact@bluesky-technologi.com', '+1 464-548-5581', '+1 810-918-5526', 'https://www.bluesky-technologies.com', 'Logistics', 'TX-11362459', '539 Cedar Ln', '97 Cedar Ln', 'Vancouver', 'BC', 'Canada', '63271', 'Prospect', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2025-11-11 00:38:22.175703', '2026-08-22 08:22:22.175062', 15),
(3, 'CUS-00003', 'Summit Peak Industries', 'Individual', 'Steven', 'Nelson', 'contact@summit-peak-indust.com', '+1 217-295-5820', '+1 426-614-4986', 'https://www.summit-peak-industries.com', 'Manufacturing', 'TX-99115205', '605 Lake View Blvd', '494 Hill Crest Ave', 'Manila', 'Metro Manila', 'Philippines', '79588', 'Active', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2026-01-16 08:47:22.176977', '2026-08-22 08:22:22.176362', 33),
(4, 'CUS-00004', 'NovaStar Enterprises', 'Business', 'Lisa', 'White', 'contact@novastar-enterpris.com', '+1 513-457-4777', '+1 323-938-4155', 'https://www.novastar-enterprises.com', 'Education', 'TX-26046365', '770 Hill Crest Ave', '983 Maple Dr', 'Manila', 'Metro Manila', 'Philippines', '35105', 'Active', 'Key account. Prefers communication via email. Follow up quarterly.', '', 1, '2025-12-17 23:36:22.178066', '2026-08-22 08:22:22.177600', 31),
(5, 'CUS-00005', 'Quantum Leap Systems', 'Business', 'Carol', 'Roberts', 'contact@quantum-leap-syste.com', '+1 302-398-5853', '+1 432-569-3939', 'https://www.quantum-leap-systems.com', 'Manufacturing', 'TX-11898961', '735 Hill Crest Ave', '139 Park Rd', 'Sydney', 'NSW', 'Australia', '15965', 'Active', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2025-11-11 22:38:22.181260', '2026-08-22 08:22:22.178638', 48),
(6, 'CUS-00006', 'Golden Gate Trading', 'Business', 'David', 'Adams', 'contact@golden-gate-tradin.com', '+1 212-787-5658', '+1 680-690-8216', 'https://www.golden-gate-trading.com', 'Education', 'TX-34744872', '998 Main St', '268 River Rd', 'Tokyo', 'Kanto', 'Japan', '24953', 'Active', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2026-01-28 17:18:22.182578', '2026-08-22 08:22:22.182048', 33),
(7, 'CUS-00007', 'Silverline Consulting', 'Business', 'Kevin', 'Adams', 'contact@silverline-consult.com', '+1 352-776-5978', '+1 287-454-2940', 'https://www.silverline-consulting.com', 'Logistics', 'TX-65857931', '630 Commerce Way', '819 Commerce Way', 'Dubai', 'Dubai', 'UAE', '39581', 'Prospect', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2026-02-08 17:24:22.183758', '2026-08-22 08:22:22.183187', 5),
(8, 'CUS-00008', 'Pacific Rim Logistics', 'Business', 'Mark', 'Lee', 'contact@pacific-rim-logist.com', '+1 782-835-1986', '+1 824-957-2625', 'https://www.pacific-rim-logistics.com', 'Retail', 'TX-93955206', '226 Park Rd', '686 Oak Ave', 'Singapore', '', 'Singapore', '30585', 'Active', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2026-05-25 15:18:22.185722', '2026-08-22 08:22:22.184823', 29),
(9, 'CUS-00009', 'Ironclad Security', 'Individual', 'William', 'Smith', 'contact@ironclad-security.com', '+1 498-233-4792', '+1 495-923-5632', 'https://www.ironclad-security.com', 'Marketing', 'TX-70939053', '82 Cedar Ln', '956 Park Rd', 'Manchester', 'England', 'UK', '91927', 'Inactive', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2025-09-18 01:55:22.187745', '2026-08-22 08:22:22.186675', 30),
(10, 'CUS-00010', 'Emerald City Software', 'Business', 'Linda', 'Scott', 'contact@emerald-city-softw.com', '+1 345-273-1977', '+1 369-514-5728', 'https://www.emerald-city-software.com', 'Hospitality', 'TX-26690465', '489 Park Rd', '726 Sunset Blvd', 'Dallas', 'TX', 'USA', '45683', 'Prospect', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2025-11-18 16:54:22.190203', '2026-08-22 08:22:22.188729', 11),
(11, 'CUS-00011', 'Redwood Analytics', 'Business', 'Jennifer', 'Flores', 'contact@redwood-analytics.com', '+1 818-456-1423', '+1 293-434-1339', 'https://www.redwood-analytics.com', 'Construction', 'TX-46173157', '600 Main St', '791 Maple Dr', 'Los Angeles', 'CA', 'USA', '71669', 'Prospect', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2025-09-22 17:24:22.192153', '2026-08-22 08:22:22.191246', 29),
(12, 'CUS-00012', 'Crescent Moon Media', 'Individual', 'Sarah', 'Lopez', 'contact@crescent-moon-medi.com', '+1 293-681-6700', '+1 618-541-6260', 'https://www.crescent-moon-media.com', 'Construction', 'TX-24039158', '888 Maple Dr', '347 Sunset Blvd', 'Singapore', '', 'Singapore', '74942', 'Active', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2025-09-16 19:30:22.197893', '2026-08-22 08:22:22.197145', 29),
(13, 'CUS-00013', 'Titan Industrial Group', 'Business', 'Ryan', 'Torres', 'contact@titan-industrial-g.com', '+1 522-458-6296', '+1 318-991-7622', 'https://www.titan-industrial-group.com', 'Logistics', 'TX-10154493', '683 Hill Crest Ave', '483 Sunset Blvd', 'Los Angeles', 'CA', 'USA', '17104', 'Active', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2025-11-29 20:43:22.199758', '2026-08-22 08:22:22.198676', 31),
(14, 'CUS-00014', 'Falcon Ridge Partners', 'Business', 'Ryan', 'Allen', 'contact@falcon-ridge-partn.com', '+1 408-473-9998', '+1 334-494-8178', 'https://www.falcon-ridge-partners.com', 'Marketing', 'TX-75056916', '134 Main St', '655 Commerce Way', 'Munich', 'Bavaria', 'Germany', '41365', 'Active', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2026-03-15 15:22:22.202742', '2026-08-22 08:22:22.201833', 30),
(15, 'CUS-00015', 'Crystal Clear Water Co', 'Business', 'Michelle', 'Ramirez', 'contact@crystal-clear-wate.com', '+1 672-320-3522', '+1 710-933-5781', 'https://www.crystal-clear-water-co.com', 'Logistics', 'TX-46698468', '435 River Rd', '493 Cedar Ln', 'Chicago', 'IL', 'USA', '69871', 'Prospect', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2026-06-08 20:10:22.205605', '2026-08-22 08:22:22.204451', 16),
(16, 'CUS-00016', 'Mountain High Outfitters', 'Business', 'Brian', 'King', 'contact@mountain-high-outf.com', '+1 482-991-7798', '+1 548-719-5377', 'https://www.mountain-high-outfitters.com', 'Technology', 'TX-47962005', '753 Park Rd', '867 Commerce Way', 'Cebu City', 'Cebu', 'Philippines', '86011', 'Prospect', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2026-06-06 17:48:22.208071', '2026-08-22 08:22:22.207324', 10),
(17, 'CUS-00017', 'Urban Jungle Landscaping', 'Individual', 'Steven', 'White', 'contact@urban-jungle-lands.com', '+1 666-529-4090', '+1 914-444-7274', 'https://www.urban-jungle-landscaping.com', 'Retail', 'TX-65133300', '54 Lake View Blvd', '772 River Rd', 'Denver', 'CO', 'USA', '59968', 'Active', 'Key account. Prefers communication via email. Follow up quarterly.', '', 1, '2025-09-16 12:13:22.209861', '2026-08-22 08:22:22.208884', 42),
(18, 'CUS-00018', 'Coastal Breeze Hotels', 'Business', 'Emily', 'Williams', 'contact@coastal-breeze-hot.com', '+1 302-650-2633', '+1 738-667-1251', 'https://www.coastal-breeze-hotels.com', 'Marketing', 'TX-29348212', '429 Maple Dr', '86 River Rd', 'Phoenix', 'AZ', 'USA', '44737', 'Active', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2025-10-06 09:57:22.211642', '2026-08-22 08:22:22.210828', 34),
(19, 'CUS-00019', 'Pioneer Medical Group', 'Individual', 'Melissa', 'Garcia', 'contact@pioneer-medical-gr.com', '+1 524-841-8994', '+1 754-236-2121', 'https://www.pioneer-medical-group.com', 'Retail', 'TX-94712997', '710 Park Rd', '242 Oak Ave', 'Denver', 'CO', 'USA', '66881', 'Active', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2025-10-01 09:27:22.214576', '2026-08-22 08:22:22.213501', 36),
(20, 'CUS-00020', 'Stellar Dynamics Corp', 'Business', 'Michael', 'Robinson', 'contact@stellar-dynamics-c.com', '+1 247-532-1919', '+1 500-567-7141', 'https://www.stellar-dynamics-corp.com', 'Real Estate', 'TX-29538047', '260 Hill Crest Ave', '431 Commerce Way', 'Philadelphia', 'PA', 'USA', '99364', 'Active', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2026-05-27 03:17:22.216482', '2026-08-22 08:22:22.215633', 21),
(21, 'CUS-00021', 'Vanguard Financial Services', 'Individual', 'Amanda', 'Sanchez', 'contact@vanguard-financial.com', '+1 797-346-4804', '+1 672-853-5161', 'https://www.vanguard-financial-servi.com', 'Hospitality', 'TX-44269370', '692 Main St', '930 River Rd', 'Berlin', 'Berlin', 'Germany', '47700', 'Prospect', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2026-06-03 05:54:22.218260', '2026-08-22 08:22:22.217494', 17),
(22, 'CUS-00022', 'Horizon Broadband Networks', 'Individual', 'Daniel', 'Hill', 'contact@horizon-broadband.com', '+1 906-456-8484', '+1 509-403-7302', 'https://www.horizon-broadband-networ.com', 'Hospitality', 'TX-24314759', '252 Sunset Blvd', '595 Lake View Blvd', 'Seattle', 'WA', 'USA', '85341', 'Active', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2025-08-28 23:21:22.221985', '2026-08-22 08:22:22.219741', 50),
(23, 'CUS-00023', 'Maple Leaf Foods Inc', 'Business', 'Timothy', 'Clark', 'contact@maple-leaf-foods-i.com', '+1 820-963-9138', '+1 493-994-4770', 'https://www.maple-leaf-foods-inc.com', 'Telecommunications', 'TX-57287718', '234 Cedar Ln', '645 Park Rd', 'Austin', 'TX', 'USA', '98835', 'Active', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2025-10-05 04:25:22.223646', '2026-08-22 08:22:22.222879', 2),
(24, 'CUS-00024', 'Sunrise Bakery Chain', 'Individual', 'George', 'Nelson', 'contact@sunrise-bakery-cha.com', '+1 234-793-6977', '+1 949-334-2476', 'https://www.sunrise-bakery-chain.com', 'Manufacturing', 'TX-53851498', '775 Sunset Blvd', '189 Cedar Ln', 'Los Angeles', 'CA', 'USA', '27322', 'Prospect', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2026-02-15 15:50:22.226737', '2026-08-22 08:22:22.224696', 21),
(25, 'CUS-00025', 'Thunderbolt Gaming Studios', 'Business', 'Sarah', 'Hernandez', 'contact@thunderbolt-gaming.com', '+1 964-546-2886', '+1 679-277-3306', 'https://www.thunderbolt-gaming-studi.com', 'Retail', 'TX-63339667', '876 Hill Crest Ave', '384 Oak Ave', 'Austin', 'TX', 'USA', '61717', 'Active', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2026-04-08 15:15:22.230013', '2026-08-22 08:22:22.228236', 32),
(26, 'CUS-00026', 'Whispering Pines Resorts', 'Individual', 'Ashley', 'Harris', 'contact@whispering-pines-r.com', '+1 853-580-2775', '+1 891-439-8724', 'https://www.whispering-pines-resorts.com', 'Technology', 'TX-93154172', '915 Hill Crest Ave', '345 Commerce Way', 'Dubai', 'Dubai', 'UAE', '39015', 'Active', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2025-09-30 17:24:22.232441', '2026-08-22 08:22:22.231048', 18),
(27, 'CUS-00027', 'Lightning Bolt Energy', 'Business', 'Ronald', 'Lee', 'contact@lightning-bolt-ene.com', '+1 343-246-1609', '+1 511-704-2902', 'https://www.lightning-bolt-energy.com', 'Healthcare', 'TX-41514326', '918 Hill Crest Ave', '148 Sunset Blvd', 'Munich', 'Bavaria', 'Germany', '69459', 'Active', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2025-09-12 08:38:22.236143', '2026-08-22 08:22:22.235305', 28),
(28, 'CUS-00028', 'Diamond Edge Jewelers', 'Individual', 'Joshua', 'Ramirez', 'contact@diamond-edge-jewel.com', '+1 870-301-9017', '+1 830-617-5583', 'https://www.diamond-edge-jewelers.com', 'Technology', 'TX-59731689', '232 River Rd', '465 Cedar Ln', 'Singapore', '', 'Singapore', '57537', 'Active', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2025-09-04 20:48:22.237832', '2026-08-22 08:22:22.237108', 11),
(29, 'CUS-00029', 'Phoenix Rising Fitness', 'Business', 'Melissa', 'White', 'contact@phoenix-rising-fit.com', '+1 394-325-8450', '+1 293-878-4475', 'https://www.phoenix-rising-fitness.com', 'Construction', 'TX-95831286', '621 Main St', '61 Lake View Blvd', 'Los Angeles', 'CA', 'USA', '41925', 'Active', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2025-11-06 02:18:22.239246', '2026-08-22 08:22:22.238618', 27),
(30, 'CUS-00030', 'Ocean Blue Seafood Market', 'Business', 'Ryan', 'Torres', 'contact@ocean-blue-seafood.com', '+1 438-536-3417', '+1 810-202-5542', 'https://www.ocean-blue-seafood-marke.com', 'Finance', 'TX-27447248', '563 Park Rd', '827 Maple Dr', 'San Antonio', 'TX', 'USA', '24408', 'Active', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2026-06-16 08:00:22.240501', '2026-08-22 08:22:22.239956', 47),
(31, 'CUS-00031', 'Grand Central Stationers', 'Business', 'Jessica', 'Hill', 'contact@grand-central-stat.com', '+1 471-253-3076', '+1 959-631-9619', 'https://www.grand-central-stationers.com', 'Healthcare', 'TX-18530615', '497 River Rd', '806 Lake View Blvd', 'Denver', 'CO', 'USA', '77271', 'Inactive', 'Key account. Prefers communication via email. Follow up quarterly.', '', 1, '2026-06-27 17:50:22.242104', '2026-08-22 08:22:22.241266', 3),
(32, 'CUS-00032', 'Happy Trails Travel Agency', 'Business', 'Joseph', 'Green', 'contact@happy-trails-trave.com', '+1 669-858-1510', '+1 262-690-7580', 'https://www.happy-trails-travel-agen.com', 'Real Estate', 'TX-24490391', '512 River Rd', '85 Oak Ave', 'Los Angeles', 'CA', 'USA', '52219', 'Inactive', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2026-06-08 06:14:22.243440', '2026-08-22 08:22:22.242811', 35),
(33, 'CUS-00033', 'Smart Home Innovations', 'Business', 'Sarah', 'Green', 'contact@smart-home-innovat.com', '+1 590-811-9692', '+1 501-664-9282', 'https://www.smart-home-innovations.com', 'Telecommunications', 'TX-67740376', '111 Oak Ave', '883 Hill Crest Ave', 'Munich', 'Bavaria', 'Germany', '38183', 'Active', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2026-01-03 00:56:22.245486', '2026-08-22 08:22:22.244154', 47),
(34, 'CUS-00034', 'Prime Time Entertainment', 'Business', 'Lisa', 'Walker', 'contact@prime-time-enterta.com', '+1 520-637-6120', '+1 881-461-7132', 'https://www.prime-time-entertainment.com', 'Finance', 'TX-73655158', '78 Oak Ave', '861 Oak Ave', 'London', 'England', 'UK', '22219', 'Active', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2026-07-03 08:35:22.247579', '2026-08-22 08:22:22.246820', 28),
(35, 'CUS-00035', 'Fresh Farm Organics', 'Business', 'Nancy', 'Rodriguez', 'contact@fresh-farm-organic.com', '+1 886-325-7730', '+1 562-881-7929', 'https://www.fresh-farm-organics.com', 'Marketing', 'TX-16904975', '304 Commerce Way', '329 Lake View Blvd', 'Melbourne', 'VIC', 'Australia', '23579', 'Inactive', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2025-12-06 02:13:22.248757', '2026-08-22 08:22:22.248270', 5),
(36, 'CUS-00036', 'Metro City Realty', 'Business', 'Timothy', 'Young', 'contact@metro-city-realty.com', '+1 769-576-2882', '+1 980-485-4705', 'https://www.metro-city-realty.com', 'Real Estate', 'TX-85291541', '795 Commerce Way', '638 Hill Crest Ave', 'Dallas', 'TX', 'USA', '13441', 'Inactive', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2025-09-19 10:05:22.249797', '2026-08-22 08:22:22.249342', 8),
(37, 'CUS-00037', 'Elite Auto Dealership', 'Business', 'Mary', 'Lopez', 'contact@elite-auto-dealers.com', '+1 559-206-3972', '+1 346-779-7566', 'https://www.elite-auto-dealership.com', 'Healthcare', 'TX-29042093', '768 Main St', '103 Hill Crest Ave', 'Austin', 'TX', 'USA', '38197', 'Active', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2026-01-19 18:01:22.250800', '2026-08-22 08:22:22.250343', 21),
(38, 'CUS-00038', 'Precision Engineering Works', 'Business', 'William', 'Harris', 'contact@precision-engineer.com', '+1 253-359-3579', '+1 972-832-1815', 'https://www.precision-engineering-wo.com', 'Construction', 'TX-20949687', '288 River Rd', '687 Sunset Blvd', 'Seattle', 'WA', 'USA', '73656', 'Inactive', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2026-01-07 19:05:22.251875', '2026-08-22 08:22:22.251364', 22),
(39, 'CUS-00039', 'Global Trade Consortium', 'Business', 'Susan', 'Roberts', 'contact@global-trade-conso.com', '+1 640-313-5640', '+1 894-894-8972', 'https://www.global-trade-consortium.com', 'Logistics', 'TX-99541016', '325 Main St', '235 Sunset Blvd', 'Sydney', 'NSW', 'Australia', '88554', 'Active', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2026-08-19 02:03:22.253926', '2026-08-22 08:22:22.252531', 9),
(40, 'CUS-00040', 'NextGen Robotics Labs', 'Business', 'Susan', 'Gomez', 'contact@nextgen-robotics-l.com', '+1 535-322-1126', '+1 709-964-8055', 'https://www.nextgen-robotics-labs.com', 'Finance', 'TX-27339011', '399 Hill Crest Ave', '730 Cedar Ln', 'Phoenix', 'AZ', 'USA', '75570', 'Prospect', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2025-09-13 21:18:22.255501', '2026-08-22 08:22:22.254669', 18),
(41, 'CUS-00041', 'Cloud Nine Air Services', 'Business', 'Betty', 'Carter', 'contact@cloud-nine-air-ser.com', '+1 670-279-6129', '+1 789-639-7626', 'https://www.cloud-nine-air-services.com', 'Marketing', 'TX-95918360', '437 Park Rd', '127 Sunset Blvd', 'Los Angeles', 'CA', 'USA', '12733', 'Active', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2026-05-26 12:53:22.257873', '2026-08-22 08:22:22.257126', 29),
(42, 'CUS-00042', 'Bright Future Academy', 'Business', 'Ronald', 'Harris', 'contact@bright-future-acad.com', '+1 449-646-7560', '+1 736-280-7484', 'https://www.bright-future-academy.com', 'Manufacturing', 'TX-55568701', '236 Lake View Blvd', '807 Maple Dr', 'Chicago', 'IL', 'USA', '20011', 'Prospect', 'Key account. Prefers communication via email. Follow up quarterly.', '', 1, '2025-10-02 04:49:22.262451', '2026-08-22 08:22:22.259634', 29),
(43, 'CUS-00043', 'Swift Courier Express', 'Business', 'Andrew', 'Gonzalez', 'contact@swift-courier-expr.com', '+1 944-860-3419', '+1 441-305-3399', 'https://www.swift-courier-express.com', 'Manufacturing', 'TX-36477373', '187 Commerce Way', '166 Oak Ave', 'Tokyo', 'Kanto', 'Japan', '33218', 'Prospect', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2025-12-27 13:34:22.264013', '2026-08-22 08:22:22.263345', 24),
(44, 'CUS-00044', 'Reliable Plumbing Pros', 'Business', 'Carol', 'Robinson', 'contact@reliable-plumbing.com', '+1 842-523-3473', '+1 650-269-8682', 'https://www.reliable-plumbing-pros.com', 'Hospitality', 'TX-94743076', '320 Park Rd', '615 Main St', 'Dubai', 'Dubai', 'UAE', '56129', 'Prospect', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2026-07-15 22:53:22.265589', '2026-08-22 08:22:22.264734', 45),
(45, 'CUS-00045', 'Elegant Interiors Studio', 'Business', 'Mark', 'Williams', 'contact@elegant-interiors.com', '+1 278-860-2479', '+1 829-808-9307', 'https://www.elegant-interiors-studio.com', 'Real Estate', 'TX-72104107', '604 Hill Crest Ave', '987 Main St', 'Los Angeles', 'CA', 'USA', '68947', 'Inactive', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2025-09-23 02:02:22.268027', '2026-08-22 08:22:22.266783', 25),
(46, 'CUS-00046', 'Mighty Movers Relocation', 'Business', 'Brian', 'Young', 'contact@mighty-movers-relo.com', '+1 661-305-6626', '+1 931-286-9266', 'https://www.mighty-movers-relocation.com', 'Construction', 'TX-33160465', '50 Cedar Ln', '734 River Rd', 'Sydney', 'NSW', 'Australia', '67595', 'Prospect', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2025-11-27 13:12:22.274822', '2026-08-22 08:22:22.269451', 11),
(47, 'CUS-00047', 'Pure Glow Beauty Spa', 'Individual', 'Nancy', 'Harris', 'contact@pure-glow-beauty-s.com', '+1 546-895-1857', '+1 846-862-6482', 'https://www.pure-glow-beauty-spa.com', 'Healthcare', 'TX-54250344', '106 Hill Crest Ave', '704 Sunset Blvd', 'Seattle', 'WA', 'USA', '47243', 'Active', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2025-09-19 12:27:22.276927', '2026-08-22 08:22:22.276008', 26),
(48, 'CUS-00048', 'Tasty Bite Restaurants', 'Business', 'Elizabeth', 'Thompson', 'contact@tasty-bite-restaur.com', '+1 558-517-7421', '+1 332-809-2388', 'https://www.tasty-bite-restaurants.com', 'Manufacturing', 'TX-85017250', '395 Lake View Blvd', '842 Maple Dr', 'Chicago', 'IL', 'USA', '97833', 'Prospect', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2026-07-05 11:40:22.278595', '2026-08-22 08:22:22.277766', 47),
(49, 'CUS-00049', 'Secure Vault Banking', 'Business', 'Sandra', 'King', 'contact@secure-vault-banki.com', '+1 516-384-4509', '+1 549-984-8967', 'https://www.secure-vault-banking.com', 'Retail', 'TX-40406092', '150 Maple Dr', '89 Park Rd', 'Boston', 'MA', 'USA', '23256', 'Prospect', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2025-11-18 08:26:22.280794', '2026-08-22 08:22:22.279437', 3),
(51, 'CUS-00051', 'Zenith Insurance Brokers', 'Business', 'Mark', 'Anderson', 'contact@zenith-insurance-b.com', '+1 680-398-7026', '+1 894-784-8218', 'https://www.zenith-insurance-brokers.com', 'Hospitality', 'TX-47818761', '806 Sunset Blvd', '524 Hill Crest Ave', 'Melbourne', 'VIC', 'Australia', '64874', 'Active', 'Key account. Prefers communication via email. Follow up quarterly.', '', 0, '2026-05-11 13:14:22.284258', '2026-08-22 08:22:22.283269', 17),
(52, 'CUS-00052', 'clydey Ednalan', 'Individual', 'Clydey', 'Ednalan', 'clydey@test.com', '234234234', 'werwerwer', '', '', '', 'new cabalan', 'new cabalan', 'olongapo city', 'zambales', 'PH', '2200', 'Active', 'sample notes  updates', 'customers/2.jpeg', 0, '2026-08-24 09:58:52.497391', '2026-08-24 10:20:47.669527', 1),
(53, 'CUS-00053', 'catlincompany', 'Business', 'catlin', 'ednalan', 'catlin@test.com', '234234', '', '', '', '', '', '', '', '', '', '', 'Active', 'Converted from lead #53.', '', 0, '2026-08-24 10:32:29.162373', '2026-08-24 10:32:29.162395', 1),
(54, 'CUS-00054', 'Cairocoders', 'Individual', 'Catlin', 'Ednalan', 'catlin@test.com', '345345345', '6456456456', 'https://tutorial101.blogspot.com/', '', '', 'New cabalan', 'new caban', 'Olongapo City', 'zambales', 'PH', '2200', 'Active', 'sample notes', 'customers/6.jpeg', 0, '2026-08-26 11:11:16.529221', '2026-08-26 11:14:47.823530', 1),
(55, 'CUS-00055', 'Apex Solutions', 'Business', 'Clydey', 'Ednalan', 'clydey@@apex-global-so.com', '@apex-global-so.com', '', 'https://www.apex-global-solution.com', '', '', '', '', '', '', '', '', 'Active', 'Converted from lead #51.', '', 0, '2026-08-26 11:21:40.595995', '2026-08-26 11:21:40.596054', 3);

-- --------------------------------------------------------

--
-- Table structure for table `customer_contacts`
--

CREATE TABLE `customer_contacts` (
  `id` bigint(20) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `designation` varchar(80) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `is_primary` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `customer_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_contacts`
--

INSERT INTO `customer_contacts` (`id`, `first_name`, `last_name`, `designation`, `email`, `phone`, `mobile`, `is_primary`, `created_at`, `updated_at`, `customer_id`) VALUES
(1, 'Nancy', 'Torres', 'CTO', 'nancy.torres@apex-global-solu.com', '+1 928-728-3042', '+1 491-285-3626', 1, '2026-04-04 17:25:22.292138', '2026-08-22 08:22:22.291023', 1),
(2, 'Andrew', 'Martinez', 'HR Manager', 'andrew.martinez@apex-global-solu.com', '+1 293-427-8391', '+1 557-227-7797', 0, '2026-07-25 19:50:22.293880', '2026-08-22 08:22:22.293217', 1),
(3, 'Nancy', 'Taylor', 'HR Manager', 'nancy.taylor@bluesky-technolo.com', '+1 283-583-4678', '+1 228-526-2623', 1, '2026-03-04 04:14:22.295075', '2026-08-22 08:22:22.294505', 2),
(4, 'Robert', 'Martin', 'Marketing Lead', 'robert.martin@bluesky-technolo.com', '+1 912-342-8685', '+1 659-830-1086', 0, '2026-07-13 08:06:22.297026', '2026-08-22 08:22:22.295822', 2),
(5, 'Susan', 'Martinez', 'HR Manager', 'susan.martinez@summit-peak-indu.com', '+1 313-994-5720', '+1 443-508-2996', 1, '2026-07-29 00:56:22.298274', '2026-08-22 08:22:22.297774', 3),
(6, 'George', 'Green', 'Marketing Lead', 'george.green@summit-peak-indu.com', '+1 264-313-9189', '+1 811-748-1269', 0, '2025-12-01 14:07:22.299664', '2026-08-22 08:22:22.298963', 3),
(7, 'Stephanie', 'Martinez', 'IT Director', 'stephanie.martinez@novastar-enterpr.com', '+1 639-201-6780', '+1 446-784-7825', 1, '2026-05-18 10:40:22.300979', '2026-08-22 08:22:22.300406', 4),
(8, 'Jennifer', 'Wright', 'Operations Head', 'jennifer.wright@novastar-enterpr.com', '+1 269-738-9914', '+1 719-719-1333', 0, '2026-02-03 17:20:22.302212', '2026-08-22 08:22:22.301671', 4),
(9, 'George', 'Sanchez', 'Operations Head', 'george.sanchez@quantum-leap-sys.com', '+1 459-965-1266', '+1 565-269-6649', 1, '2026-04-20 08:40:22.303952', '2026-08-22 08:22:22.303375', 5),
(10, 'George', 'Miller', 'Operations Head', 'george.miller@quantum-leap-sys.com', '+1 336-245-6772', '+1 759-546-3868', 0, '2025-12-27 09:52:22.305257', '2026-08-22 08:22:22.304636', 5),
(11, 'George', 'Lopez', 'CFO', 'george.lopez@golden-gate-trad.com', '+1 264-933-8498', '+1 237-500-4302', 1, '2026-07-31 01:26:22.308172', '2026-08-22 08:22:22.307408', 6),
(12, 'Robert', 'Perez', 'IT Director', 'robert.perez@golden-gate-trad.com', '+1 727-607-9897', '+1 684-459-1599', 0, '2026-05-16 23:00:22.309579', '2026-08-22 08:22:22.309026', 6),
(13, 'Laura', 'Brown', 'Operations Head', 'laura.brown@silverline-consu.com', '+1 479-327-7029', '+1 647-609-8204', 1, '2026-02-05 22:11:22.310776', '2026-08-22 08:22:22.310283', 7),
(14, 'Emily', 'Rivera', 'Marketing Lead', 'emily.rivera@silverline-consu.com', '+1 576-731-5369', '+1 284-944-7955', 0, '2026-07-12 18:44:22.311964', '2026-08-22 08:22:22.311428', 7),
(15, 'Barbara', 'Scott', 'IT Director', 'barbara.scott@pacific-rim-logi.com', '+1 528-305-2311', '+1 535-876-5843', 1, '2026-03-18 17:44:22.314622', '2026-08-22 08:22:22.313811', 8),
(16, 'Stephanie', 'Lewis', 'CFO', 'stephanie.lewis@pacific-rim-logi.com', '+1 906-654-6759', '+1 657-243-6776', 0, '2026-01-11 23:42:22.317467', '2026-08-22 08:22:22.316785', 8),
(17, 'Patricia', 'Jones', 'HR Manager', 'patricia.jones@ironclad-securit.com', '+1 572-725-3621', '+1 231-346-8179', 1, '2026-08-05 04:18:22.318697', '2026-08-22 08:22:22.318150', 9),
(18, 'Jessica', 'Gomez', 'Operations Head', 'jessica.gomez@ironclad-securit.com', '+1 570-592-1530', '+1 819-357-8371', 0, '2026-02-13 20:54:22.319927', '2026-08-22 08:22:22.319384', 9),
(19, 'Ryan', 'Jones', 'CFO', 'ryan.jones@emerald-city-sof.com', '+1 742-575-7521', '+1 521-865-5566', 1, '2026-04-17 05:21:22.321018', '2026-08-22 08:22:22.320583', 10),
(20, 'Rebecca', 'Lopez', 'Marketing Lead', 'rebecca.lopez@emerald-city-sof.com', '+1 730-596-2929', '+1 468-993-5264', 0, '2026-01-06 01:43:22.322897', '2026-08-22 08:22:22.322270', 10),
(21, 'Charles', 'Rivera', 'Marketing Lead', 'charles.rivera@redwood-analytic.com', '+1 404-325-3223', '+1 275-662-3828', 1, '2026-01-07 05:31:22.324374', '2026-08-22 08:22:22.323591', 11),
(22, 'Deborah', 'Perez', 'Operations Head', 'deborah.perez@redwood-analytic.com', '+1 926-266-9882', '+1 497-507-3580', 0, '2026-05-24 20:50:22.327437', '2026-08-22 08:22:22.325830', 11),
(23, 'Joseph', 'Davis', 'Procurement Manager', 'joseph.davis@crescent-moon-me.com', '+1 342-442-9094', '+1 226-569-7044', 1, '2025-12-25 15:14:22.330709', '2026-08-22 08:22:22.329066', 12),
(24, 'Amanda', 'Garcia', 'CTO', 'amanda.garcia@crescent-moon-me.com', '+1 516-607-8842', '+1 738-620-7708', 0, '2025-11-01 06:14:22.332886', '2026-08-22 08:22:22.332237', 12),
(25, 'Christopher', 'Nelson', 'CTO', 'christopher.nelson@titan-industrial.com', '+1 660-677-9476', '+1 552-331-3981', 1, '2026-06-16 18:50:22.334063', '2026-08-22 08:22:22.333559', 13),
(26, 'Patricia', 'Davis', 'CFO', 'patricia.davis@titan-industrial.com', '+1 511-368-3653', '+1 530-926-4694', 0, '2026-02-25 15:25:22.335491', '2026-08-22 08:22:22.334937', 13),
(27, 'Charles', 'Garcia', 'IT Director', 'charles.garcia@falcon-ridge-par.com', '+1 401-850-5496', '+1 328-840-5961', 1, '2025-11-22 05:50:22.336587', '2026-08-22 08:22:22.336072', 14),
(28, 'Melissa', 'Hernandez', 'CFO', 'melissa.hernandez@falcon-ridge-par.com', '+1 375-874-6531', '+1 777-242-1464', 0, '2026-07-12 06:41:22.337467', '2026-08-22 08:22:22.337087', 14),
(29, 'Laura', 'Nguyen', 'IT Director', 'laura.nguyen@crystal-clear-wa.com', '+1 866-415-7825', '+1 832-854-1496', 1, '2025-12-10 11:48:22.338700', '2026-08-22 08:22:22.337997', 15),
(30, 'Charles', 'Nelson', 'IT Director', 'charles.nelson@crystal-clear-wa.com', '+1 694-450-7653', '+1 504-664-2195', 0, '2026-07-23 02:54:22.339761', '2026-08-22 08:22:22.339313', 15),
(31, 'Anthony', 'Young', 'Marketing Lead', 'anthony.young@mountain-high-ou.com', '+1 408-548-3353', '+1 520-935-6231', 1, '2026-02-26 20:14:22.340880', '2026-08-22 08:22:22.340365', 16),
(32, 'Ryan', 'Harris', 'CTO', 'ryan.harris@mountain-high-ou.com', '+1 526-447-8642', '+1 325-473-8366', 0, '2026-04-18 04:16:22.341909', '2026-08-22 08:22:22.341448', 16),
(33, 'Patricia', 'Martin', 'HR Manager', 'patricia.martin@urban-jungle-lan.com', '+1 830-628-5067', '+1 363-535-6123', 1, '2026-05-17 02:51:22.342790', '2026-08-22 08:22:22.342396', 17),
(34, 'Andrew', 'Walker', 'Marketing Lead', 'andrew.walker@urban-jungle-lan.com', '+1 515-709-1379', '+1 292-602-9281', 0, '2025-12-31 01:09:22.343634', '2026-08-22 08:22:22.343257', 17),
(35, 'Carol', 'White', 'CEO', 'carol.white@coastal-breeze-h.com', '+1 251-488-9108', '+1 811-869-8710', 1, '2026-03-28 15:22:22.345153', '2026-08-22 08:22:22.344114', 18),
(36, 'Michael', 'Lewis', 'CFO', 'michael.lewis@coastal-breeze-h.com', '+1 470-944-6992', '+1 982-612-6995', 0, '2026-07-29 20:19:22.347489', '2026-08-22 08:22:22.346726', 18),
(37, 'Kevin', 'Torres', 'Procurement Manager', 'kevin.torres@pioneer-medical.com', '+1 571-766-5728', '+1 275-595-9261', 1, '2026-01-03 15:05:22.350887', '2026-08-22 08:22:22.348790', 19),
(38, 'Amanda', 'Hall', 'CTO', 'amanda.hall@pioneer-medical.com', '+1 331-299-7453', '+1 582-547-6990', 0, '2026-06-10 01:44:22.352124', '2026-08-22 08:22:22.351676', 19),
(39, 'Andrew', 'Clark', 'CEO', 'andrew.clark@stellar-dynamics.com', '+1 246-239-3245', '+1 930-541-8761', 1, '2025-11-29 18:13:22.354871', '2026-08-22 08:22:22.353742', 20),
(40, 'Brian', 'King', 'CFO', 'brian.king@stellar-dynamics.com', '+1 535-827-6218', '+1 366-602-5902', 0, '2026-03-02 15:29:22.356853', '2026-08-22 08:22:22.355774', 20),
(41, 'Andrew', 'Scott', 'Marketing Lead', 'andrew.scott@vanguard-financi.com', '+1 925-776-5911', '+1 686-217-7035', 1, '2026-03-05 11:15:22.358356', '2026-08-22 08:22:22.357735', 21),
(42, 'Anthony', 'Hill', 'IT Director', 'anthony.hill@vanguard-financi.com', '+1 942-904-1436', '+1 811-685-5350', 0, '2025-10-29 14:08:22.359598', '2026-08-22 08:22:22.359069', 21),
(43, 'Jason', 'Brown', 'Marketing Lead', 'jason.brown@horizon-broadban.com', '+1 374-736-7229', '+1 351-897-4968', 1, '2026-08-05 13:38:22.360746', '2026-08-22 08:22:22.360256', 22),
(44, 'Linda', 'Gonzalez', 'CEO', 'linda.gonzalez@horizon-broadban.com', '+1 651-521-7861', '+1 355-622-4340', 0, '2026-01-23 15:33:22.361976', '2026-08-22 08:22:22.361375', 22),
(45, 'Amanda', 'Young', 'CEO', 'amanda.young@maple-leaf-foods.com', '+1 922-341-9498', '+1 412-774-6325', 1, '2025-12-20 15:58:22.363404', '2026-08-22 08:22:22.362754', 23),
(46, 'Christopher', 'Lopez', 'Marketing Lead', 'christopher.lopez@maple-leaf-foods.com', '+1 745-550-9950', '+1 562-892-5331', 0, '2025-12-18 02:07:22.364665', '2026-08-22 08:22:22.364115', 23),
(47, 'Sarah', 'Torres', 'IT Director', 'sarah.torres@sunrise-bakery-c.com', '+1 430-504-5735', '+1 921-412-9011', 1, '2026-03-12 17:00:22.365660', '2026-08-22 08:22:22.365240', 24),
(48, 'Michelle', 'Mitchell', 'IT Director', 'michelle.mitchell@sunrise-bakery-c.com', '+1 494-324-9899', '+1 588-604-6654', 0, '2026-06-08 23:20:22.366681', '2026-08-22 08:22:22.366236', 24),
(49, 'Charles', 'Campbell', 'CTO', 'charles.campbell@thunderbolt-gami.com', '+1 554-652-5201', '+1 965-690-4505', 1, '2026-05-10 15:05:22.367565', '2026-08-22 08:22:22.367149', 25),
(50, 'Michelle', 'Rivera', 'IT Director', 'michelle.rivera@thunderbolt-gami.com', '+1 340-311-4920', '+1 448-251-9700', 0, '2026-04-28 12:08:22.376336', '2026-08-24 10:26:12.893387', 25),
(51, 'clydey', 'Ednalan', 'sample designation test', 'dlydey@test.com', '434234', '53345345', 0, '2026-08-26 11:14:01.349952', '2026-08-26 11:16:16.463306', 54);

-- --------------------------------------------------------

--
-- Table structure for table `customer_documents`
--

CREATE TABLE `customer_documents` (
  `id` bigint(20) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(100) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `file_type` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `uploaded_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_documents`
--

INSERT INTO `customer_documents` (`id`, `file_name`, `file_path`, `file_size`, `file_type`, `created_at`, `customer_id`, `uploaded_by`) VALUES
(1, 'Contract_PacificRimLogistics.pdf', 'customer_docs/Contract_PacificRimLogistics.pdf', 2606, 'application/pdf', '2026-05-06 12:33:22.470784', 8, 43),
(2, 'Contract_CrescentMoonMedia.pdf', 'customer_docs/Contract_CrescentMoonMedia.pdf', 6022, 'application/pdf', '2026-08-05 04:44:22.480061', 12, 14),
(3, 'Contract_FreshFarmOrganics.pdf', 'customer_docs/Contract_FreshFarmOrganics.pdf', 9393, 'application/pdf', '2026-03-02 09:27:22.502694', 35, 39),
(4, 'Contract_WhisperingPinesResorts.pdf', 'customer_docs/Contract_WhisperingPinesResorts.pdf', 6088, 'application/pdf', '2026-08-10 19:54:22.505937', 26, 48),
(5, 'Invoice_Archive_PrimeTimeEntertainment.pdf', 'customer_docs/Invoice_Archive_PrimeTimeEntertainment.pdf', 10922, 'application/pdf', '2026-02-10 07:14:22.507279', 34, 14),
(6, 'Meeting_Notes_IroncladSecurity.txt', 'customer_docs/Meeting_Notes_IroncladSecurity.txt', 6818, 'text/plain', '2026-02-15 14:02:22.508366', 9, 15),
(7, 'Meeting_Notes_CrystalClearWaterCo.txt', 'customer_docs/Meeting_Notes_CrystalClearWaterCo.txt', 11875, 'text/plain', '2026-03-02 22:07:22.509390', 15, 50),
(8, 'SLA_Agreement_ApexGlobalSolutions.pdf', 'customer_docs/SLA_Agreement_ApexGlobalSolutions.pdf', 4426, 'application/pdf', '2026-04-11 00:56:22.510400', 1, 43),
(9, 'SLA_Agreement_BlueskyTechnologies.pdf', 'customer_docs/SLA_Agreement_BlueskyTechnologies.pdf', 6587, 'application/pdf', '2026-04-01 13:26:22.511424', 2, 4),
(11, 'Requirements_OceanBlueSeafoodMarket.docx', 'customer_docs/Requirements_OceanBlueSeafoodMarket.docx', 2847, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', '2026-03-10 10:58:22.513934', 30, 23),
(12, 'Meeting_Notes_SecureVaultBanking.txt', 'customer_docs/Meeting_Notes_SecureVaultBanking.txt', 7301, 'text/plain', '2026-05-07 19:13:22.515936', 49, 45),
(13, 'SLA_Agreement_DiamondEdgeJewelers.pdf', 'customer_docs/SLA_Agreement_DiamondEdgeJewelers.pdf', 8246, 'application/pdf', '2026-02-09 14:52:22.518813', 28, 12),
(14, 'Invoice_Archive_NextgenRoboticsLabs.pdf', 'customer_docs/Invoice_Archive_NextgenRoboticsLabs.pdf', 15994, 'application/pdf', '2026-06-06 10:13:22.520437', 40, 15),
(15, 'Requirements_ThunderboltGamingStudios.docx', 'customer_docs/Requirements_ThunderboltGamingStudios.docx', 3023, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', '2026-05-08 18:47:22.521743', 25, 36),
(16, 'Meeting_Notes_ElegantInteriorsStudio.txt', 'customer_docs/Meeting_Notes_ElegantInteriorsStudio.txt', 4275, 'text/plain', '2026-06-21 00:09:22.522860', 45, 25),
(17, 'SLA_Agreement_MountainHighOutfitters.pdf', 'customer_docs/SLA_Agreement_MountainHighOutfitters.pdf', 12674, 'application/pdf', '2026-04-28 21:17:22.524234', 16, 6),
(18, 'Meeting_Notes_CloudNineAirServices.txt', 'customer_docs/Meeting_Notes_CloudNineAirServices.txt', 13950, 'text/plain', '2026-08-08 23:58:22.525687', 41, 13),
(19, 'Price_List_2026.xlsx', 'customer_docs/Price_List_2026_p5ZZ6Za.xlsx', 11990, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '2026-08-12 06:10:22.527916', 23, 39),
(20, 'Meeting_Notes_EmeraldCitySoftware.txt', 'customer_docs/Meeting_Notes_EmeraldCitySoftware.txt', 13946, 'text/plain', '2026-04-01 01:52:22.529222', 10, 43),
(21, 'Invoice_Archive_MightyMoversRelocation.pdf', 'customer_docs/Invoice_Archive_MightyMoversRelocation.pdf', 16324, 'application/pdf', '2026-06-06 08:09:22.530364', 46, 22),
(22, 'Invoice_Archive_SilverlineConsulting.pdf', 'customer_docs/Invoice_Archive_SilverlineConsulting.pdf', 14227, 'application/pdf', '2026-02-11 16:24:22.531510', 7, 8),
(23, 'Invoice_Archive_PhoenixRisingFitness.pdf', 'customer_docs/Invoice_Archive_PhoenixRisingFitness.pdf', 13476, 'application/pdf', '2026-02-23 01:57:22.533431', 29, 39),
(24, 'Invoice_Archive_SunriseBakeryChain.pdf', 'customer_docs/Invoice_Archive_SunriseBakeryChain.pdf', 11124, 'application/pdf', '2026-02-04 22:58:22.535433', 24, 21),
(25, 'Requirements_EliteAutoDealership.docx', 'customer_docs/Requirements_EliteAutoDealership.docx', 10822, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', '2026-05-22 23:06:22.536641', 37, 42),
(26, 'template-regular.pdf', 'customer_docs/template-regular.pdf', 87547, 'application/pdf', '2026-08-24 10:19:56.749276', 52, 1),
(28, 'revenue_report.excel', 'customer_docs/revenue_report.excel', 924, 'application/octet-stream', '2026-08-26 11:12:21.637654', 54, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_tags`
--

CREATE TABLE `customer_tags` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `color` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_tags`
--

INSERT INTO `customer_tags` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'VIP', '#dc3545', '2026-08-22 08:22:22.168005', '2026-08-22 08:22:22.168013'),
(2, 'Wholesale', '#0d6efd', '2026-08-22 08:22:22.169095', '2026-08-22 08:22:22.169103'),
(3, 'Retail', '#198754', '2026-08-22 08:22:22.169573', '2026-08-22 08:22:22.169581'),
(4, 'High Value', '#ffc107', '2026-08-22 08:22:22.170032', '2026-08-22 08:22:22.170039'),
(5, 'At Risk', '#fd7e14', '2026-08-22 08:22:22.170514', '2026-08-22 08:22:22.170522'),
(6, 'New', '#0dcaf0', '2026-08-22 08:22:22.170904', '2026-08-22 08:22:22.170912'),
(7, 'Enterprise', '#6f42c1', '2026-08-22 08:22:22.171278', '2026-08-22 08:22:22.171285'),
(8, 'SMB', '#20c997', '2026-08-22 08:22:22.171766', '2026-08-22 08:22:22.171773');

-- --------------------------------------------------------

--
-- Table structure for table `customer_tag_map`
--

CREATE TABLE `customer_tag_map` (
  `id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_tag_map`
--

INSERT INTO `customer_tag_map` (`id`, `customer_id`, `tag_id`) VALUES
(5, 1, 3),
(67, 1, 4),
(28, 1, 6),
(18, 3, 1),
(72, 3, 5),
(69, 3, 7),
(1, 4, 2),
(56, 4, 4),
(61, 4, 8),
(55, 5, 2),
(71, 5, 8),
(32, 6, 7),
(60, 6, 8),
(4, 7, 3),
(59, 8, 4),
(24, 8, 6),
(62, 9, 7),
(22, 9, 8),
(58, 11, 6),
(43, 11, 7),
(25, 11, 8),
(15, 12, 1),
(34, 12, 3),
(17, 12, 5),
(14, 12, 7),
(48, 15, 3),
(36, 16, 1),
(38, 16, 8),
(40, 17, 6),
(37, 17, 7),
(23, 18, 4),
(19, 20, 2),
(9, 21, 5),
(20, 22, 5),
(70, 23, 2),
(47, 24, 4),
(76, 24, 7),
(78, 25, 2),
(66, 26, 5),
(16, 26, 8),
(73, 27, 3),
(2, 27, 6),
(6, 27, 8),
(31, 28, 6),
(77, 29, 7),
(63, 30, 1),
(42, 30, 5),
(50, 30, 6),
(21, 30, 8),
(49, 31, 3),
(7, 31, 4),
(35, 31, 6),
(54, 34, 6),
(53, 34, 8),
(13, 35, 1),
(64, 36, 8),
(57, 37, 3),
(30, 37, 4),
(39, 38, 1),
(68, 38, 2),
(46, 41, 5),
(10, 42, 1),
(12, 42, 4),
(26, 42, 5),
(80, 42, 6),
(33, 43, 2),
(52, 44, 2),
(79, 44, 3),
(44, 44, 5),
(45, 45, 2),
(41, 45, 4),
(27, 46, 3),
(3, 46, 8),
(65, 47, 1),
(51, 49, 4),
(8, 49, 5),
(29, 51, 5),
(81, 52, 3),
(82, 54, 2);

-- --------------------------------------------------------

--
-- Table structure for table `deals`
--

CREATE TABLE `deals` (
  `id` bigint(20) NOT NULL,
  `deal_name` varchar(150) NOT NULL,
  `expected_value` decimal(14,2) NOT NULL,
  `probability` smallint(5) UNSIGNED NOT NULL,
  `expected_close_date` date DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  `notes` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `assigned_to` bigint(20) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `lead_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deals`
--

INSERT INTO `deals` (`id`, `deal_name`, `expected_value`, `probability`, `expected_close_date`, `status`, `notes`, `created_at`, `updated_at`, `assigned_to`, `customer_id`, `stage_id`, `lead_id`) VALUES
(1, 'NextGen Robotics Labs - Annual Contract', '188000.00', 40, '2026-06-08', 'Open', 'Standard terms apply.', '2026-06-01 07:21:22.716085', '2026-08-22 09:26:12.738014', 12, 40, 2, 13),
(2, 'Emerald City Software - Expansion', '225000.00', 100, '2026-07-26', 'Won', 'Standard terms apply.', '2026-08-03 20:37:22.718014', '2026-09-29 20:37:22.718014', 11, 10, 5, 50),
(3, 'Horizon Broadband Networks - Implementation', '45000.00', 75, '2026-10-28', 'Open', 'Standard terms apply.', '2026-05-02 11:51:22.731191', '2026-05-08 11:51:22.731191', 24, 22, 4, 20),
(4, 'Metro City Realty - Implementation', '175000.00', 100, '2026-09-21', 'Won', 'Standard terms apply.', '2026-07-08 20:03:22.732840', '2026-08-21 20:03:22.732840', 26, 36, 5, 45),
(5, 'Pure Glow Beauty Spa - Upgrade', '222000.00', 100, '2026-11-07', 'Won', 'Standard terms apply.', '2026-03-30 07:11:22.734428', '2026-08-26 11:24:19.726112', 48, 47, 5, 1),
(6, 'Elite Auto Dealership - Implementation', '89000.00', 40, '2026-10-31', 'Open', 'Standard terms apply.', '2026-08-03 01:00:22.736115', '2026-08-09 01:00:22.736115', 35, 37, 2, 7),
(7, 'Golden Gate Trading - Upgrade', '7000.00', 75, '2026-06-30', 'Open', 'Standard terms apply.', '2026-06-30 00:38:22.738412', '2026-07-12 00:38:22.738412', 25, 6, 4, 46),
(8, 'Silverline Consulting - Platform License', '103000.00', 40, '2026-08-14', 'Open', 'Standard terms apply.', '2026-05-07 02:26:22.740398', '2026-05-23 02:26:22.740398', 4, 7, 2, 47),
(9, 'Maple Leaf Foods Inc - Platform License', '217000.00', 100, '2026-08-24', 'Won', 'Standard terms apply.', '2026-03-27 11:34:22.742354', '2026-05-01 11:34:22.742354', 28, 23, 5, 35),
(10, 'Quantum Leap Systems - Platform License', '86000.00', 40, '2026-06-29', 'Open', 'Standard terms apply.', '2026-07-27 06:01:22.744350', '2026-08-24 10:55:07.235185', 22, 5, 2, 3),
(11, 'Quantum Leap Systems - Annual Contract', '157000.00', 20, '2026-09-28', 'Open', 'Standard terms apply.', '2026-04-20 10:21:22.745840', '2026-04-26 10:21:22.745840', 9, 5, 1, 36),
(12, 'Diamond Edge Jewelers - Platform License', '89000.00', 75, '2026-06-15', 'Open', 'Standard terms apply.', '2026-07-04 18:38:22.747189', '2026-07-14 18:38:22.747189', 7, 28, 4, 11),
(13, 'Silverline Consulting - Expansion', '145000.00', 40, '2026-08-27', 'Open', 'Standard terms apply.', '2026-07-14 06:59:22.748805', '2026-07-28 06:59:22.748805', 29, 7, 2, 4),
(14, 'Swift Courier Express - Upgrade', '56000.00', 20, '2026-05-18', 'Open', 'Standard terms apply.', '2026-08-16 02:12:22.750262', '2026-08-19 02:12:22.750262', 50, 43, 1, 41),
(15, 'Pacific Rim Logistics - Upgrade', '130000.00', 60, '2026-10-10', 'Open', 'Standard terms apply.', '2026-06-16 05:41:22.753470', '2026-06-22 05:41:22.753470', 29, 8, 3, 20),
(16, 'Thunderbolt Gaming Studios - Upgrade', '16000.00', 60, '2026-06-30', 'Open', 'Standard terms apply.', '2026-05-01 18:06:22.756125', '2026-05-10 18:06:22.756125', 15, 25, 3, 24),
(17, 'Emerald City Software - Platform License', '176000.00', 75, '2026-07-21', 'Open', 'Standard terms apply.', '2026-04-05 18:34:22.761189', '2026-04-23 18:34:22.761189', 10, 10, 4, NULL),
(18, 'Thunderbolt Gaming Studios - Expansion', '180000.00', 20, '2026-08-23', 'Open', 'Standard terms apply.', '2026-03-29 00:52:22.764517', '2026-04-01 00:52:22.764517', 30, 25, 1, 34),
(19, 'Mighty Movers Relocation - Expansion', '235000.00', 60, '2026-09-03', 'Open', 'Standard terms apply.', '2026-03-28 10:43:22.768381', '2026-04-01 10:43:22.768381', 36, 46, 3, 3),
(20, 'Phoenix Rising Fitness - Implementation', '211000.00', 0, '2026-06-12', 'Lost', 'Standard terms apply.', '2026-07-21 06:55:22.770662', '2026-08-07 06:55:22.770662', 14, 29, 6, 12),
(21, 'Diamond Edge Jewelers - Expansion', '71000.00', 0, '2026-07-14', 'Lost', 'Standard terms apply.', '2026-08-05 05:58:22.772302', '2026-10-01 05:58:22.772302', 13, 28, 6, 13),
(22, 'Coastal Breeze Hotels - Platform License', '206000.00', 75, '2026-10-20', 'Open', 'Standard terms apply.', '2026-03-24 15:32:22.774524', '2026-03-28 15:32:22.774524', 33, 18, 4, 34),
(23, 'Emerald City Software - Expansion', '199000.00', 60, '2026-05-19', 'Open', 'Standard terms apply.', '2026-07-25 13:33:22.776553', '2026-08-04 13:33:22.776553', 49, 10, 3, 37),
(24, 'Maple Leaf Foods Inc - Upgrade', '172000.00', 100, '2026-08-26', 'Won', 'Standard terms apply.', '2026-03-28 12:52:22.778134', '2026-04-08 12:52:22.778134', 20, 23, 5, 27),
(25, 'Whispering Pines Resorts - Pilot Project', '182000.00', 40, '2026-08-04', 'Open', 'Standard terms apply.', '2026-08-12 19:26:22.780065', '2026-08-20 19:26:22.780065', 50, 26, 2, 10),
(26, 'Grand Central Stationers - Platform License', '91000.00', 20, '2026-11-19', 'Open', 'Standard terms apply.', '2026-06-05 23:05:22.781735', '2026-06-09 23:05:22.781735', 27, 31, 1, 18),
(27, 'Crystal Clear Water Co - Pilot Project', '118000.00', 0, '2026-11-08', 'Lost', 'Standard terms apply.', '2026-05-31 23:36:22.783555', '2026-07-30 23:36:22.783555', 23, 15, 6, 9),
(28, 'Golden Gate Trading - Implementation', '238000.00', 75, '2026-11-20', 'Open', 'Standard terms apply.', '2026-05-09 08:51:22.784939', '2026-05-21 08:51:22.784939', 32, 6, 4, 13),
(29, 'Smart Home Innovations - Annual Contract', '186000.00', 100, '2026-08-31', 'Won', 'Standard terms apply.', '2026-05-11 03:33:22.786431', '2026-07-24 03:33:22.786431', 8, 33, 5, 11),
(30, 'BlueSky Technologies - Implementation', '219000.00', 100, '2026-05-08', 'Won', 'Standard terms apply.', '2026-06-20 06:53:22.788202', '2026-07-03 06:53:22.788202', 16, 2, 5, 12),
(31, 'Mighty Movers Relocation - Annual Contract', '215000.00', 0, '2026-08-20', 'Lost', 'Standard terms apply.', '2026-04-14 19:42:22.790767', '2026-05-06 19:42:22.790767', 21, 46, 6, 13),
(32, 'Mountain High Outfitters - Expansion', '119000.00', 100, '2026-06-08', 'Won', 'Standard terms apply.', '2026-04-22 13:47:22.793489', '2026-06-12 13:47:22.793489', 35, 16, 5, 24),
(33, 'Urban Jungle Landscaping - Annual Contract', '12000.00', 60, '2026-07-31', 'Open', 'Standard terms apply.', '2026-08-10 02:28:22.795718', '2026-08-18 02:28:22.795718', 9, 17, 3, 48),
(34, 'Reliable Plumbing Pros - Pilot Project', '109000.00', 75, '2026-09-02', 'Open', 'Standard terms apply.', '2026-08-16 11:22:22.797484', '2026-08-21 11:22:22.797484', 21, 44, 4, 14),
(35, 'Global Trade Consortium - Annual Contract', '160000.00', 75, '2026-11-16', 'Open', 'Standard terms apply.', '2026-06-04 09:37:22.807694', '2026-06-18 09:37:22.807694', 18, 39, 4, 1),
(36, 'Maple Leaf Foods Inc - Implementation', '124000.00', 0, '2026-07-10', 'Lost', 'Standard terms apply.', '2026-04-10 12:57:22.809061', '2026-04-30 12:57:22.809061', 20, 23, 6, 30),
(37, 'Swift Courier Express - Pilot Project', '157000.00', 20, '2026-09-26', 'Open', 'Standard terms apply.', '2026-06-10 22:39:22.810370', '2026-06-26 22:39:22.810370', 47, 43, 1, 24),
(38, 'Coastal Breeze Hotels - Annual Contract', '71000.00', 20, '2026-10-08', 'Open', 'Standard terms apply.', '2026-06-07 02:13:22.811685', '2026-06-15 02:13:22.811685', 24, 18, 1, 41),
(39, 'Global Trade Consortium - Pilot Project', '40000.00', 0, '2026-10-25', 'Lost', 'Standard terms apply.', '2026-08-15 11:51:22.814189', '2026-09-28 11:51:22.814189', 24, 39, 6, 26),
(40, 'Lightning Bolt Energy - Pilot Project', '14000.00', 40, '2026-09-20', 'Open', 'Standard terms apply.', '2026-03-29 02:01:22.815832', '2026-04-16 02:01:22.815832', 28, 27, 2, 26),
(41, 'Grand Central Stationers - Expansion', '81000.00', 75, '2026-06-06', 'Open', 'Standard terms apply.', '2026-04-02 03:04:22.817464', '2026-04-18 03:04:22.817464', 26, 31, 4, 43),
(42, 'Urban Jungle Landscaping - Implementation', '179000.00', 20, '2026-07-18', 'Open', 'Standard terms apply.', '2026-07-31 01:00:22.818870', '2026-08-10 01:00:22.818870', 47, 17, 1, 47),
(43, 'Horizon Broadband Networks - Expansion', '80000.00', 60, '2026-08-20', 'Open', 'Standard terms apply.', '2026-07-22 17:19:22.823917', '2026-08-07 17:19:22.823917', 20, 22, 3, 24),
(44, 'Smart Home Innovations - Expansion', '81000.00', 0, '2026-08-07', 'Lost', 'Standard terms apply.', '2026-08-09 04:14:22.825457', '2026-09-10 04:14:22.825457', 28, 33, 6, 8),
(45, 'Elite Auto Dealership - Annual Contract', '225000.00', 60, '2026-10-24', 'Open', 'Standard terms apply.', '2026-07-07 05:51:22.827680', '2026-07-13 05:51:22.827680', 13, 37, 3, 30),
(46, 'NovaStar Enterprises - Annual Contract', '58000.00', 60, '2026-11-04', 'Open', 'Standard terms apply.', '2026-07-09 13:34:22.829546', '2026-08-24 10:55:47.319554', 32, 4, 3, 1),
(47, 'Wise Owl Bookstores - Expansion', '116000.00', 100, '2026-10-03', 'Won', 'Standard terms apply.', '2026-05-04 19:55:22.831932', '2026-07-11 19:55:22.831932', 12, NULL, 5, 6),
(48, 'Summit Peak Industries - Pilot Project', '100000.00', 60, '2026-04-27', 'Open', 'Standard terms apply.', '2026-05-31 16:10:22.835163', '2026-06-01 16:10:22.835163', 16, 3, 3, 35),
(49, 'Mountain High Outfitters - Annual Contract', '38000.00', 75, '2026-05-20', 'Open', 'Standard terms apply.', '2026-05-15 15:45:22.837752', '2026-05-21 15:45:22.837752', 26, 16, 4, 15),
(50, 'Summit Peak Industries - Upgrade', '191000.00', 20, '2026-09-04', 'Open', 'Standard terms apply.', '2026-04-09 21:55:22.839274', '2026-04-20 21:55:22.839274', 22, 3, 1, 20);

-- --------------------------------------------------------

--
-- Table structure for table `deal_stages`
--

CREATE TABLE `deal_stages` (
  `id` bigint(20) NOT NULL,
  `name` varchar(80) NOT NULL,
  `color` varchar(20) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `pipeline_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deal_stages`
--

INSERT INTO `deal_stages` (`id`, `name`, `color`, `sort_order`, `created_at`, `updated_at`, `pipeline_id`) VALUES
(1, 'New', '#6c757d', 1, '2026-08-22 08:22:22.147113', '2026-08-22 08:22:22.147122', 1),
(2, 'Qualified', '#0dcaf0', 2, '2026-08-22 08:22:22.148108', '2026-08-22 08:22:22.148117', 1),
(3, 'Proposal', '#0d6efd', 3, '2026-08-22 08:22:22.148644', '2026-08-22 08:22:22.148652', 1),
(4, 'Negotiation', '#ffc107', 4, '2026-08-22 08:22:22.149137', '2026-08-22 08:22:22.149143', 1),
(5, 'Won', '#198754', 5, '2026-08-22 08:22:22.149535', '2026-08-22 08:22:22.149542', 1),
(6, 'Lost', '#dc3545', 6, '2026-08-22 08:22:22.149892', '2026-08-22 08:22:22.149899', 1),
(7, 'Renewal Due', '#ffc107', 1, '2026-08-22 08:22:22.150266', '2026-08-22 08:22:22.150273', 2),
(8, 'Renewal Negotiation', '#fd7e14', 2, '2026-08-22 08:22:22.150655', '2026-08-22 08:22:22.150662', 2),
(9, 'Renewed', '#198754', 3, '2026-08-22 08:22:22.150997', '2026-08-22 08:22:22.151004', 2),
(10, 'Churned', '#dc3545', 4, '2026-08-22 08:22:22.151335', '2026-08-22 08:22:22.151341', 2);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'group'),
(3, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(6, 'crm', 'activitylog'),
(7, 'crm', 'attachment'),
(8, 'crm', 'auditlog'),
(9, 'crm', 'customer'),
(10, 'crm', 'customercontact'),
(11, 'crm', 'customerdocument'),
(12, 'crm', 'customertag'),
(13, 'crm', 'customertagmap'),
(14, 'crm', 'deal'),
(15, 'crm', 'dealstage'),
(16, 'crm', 'emaillog'),
(17, 'crm', 'emailtemplate'),
(18, 'crm', 'invoice'),
(19, 'crm', 'invoiceitem'),
(20, 'crm', 'lead'),
(21, 'crm', 'leadactivity'),
(22, 'crm', 'leadsource'),
(23, 'crm', 'leadstatus'),
(24, 'crm', 'loginlog'),
(25, 'crm', 'meeting'),
(26, 'crm', 'meetingattendee'),
(27, 'crm', 'note'),
(28, 'crm', 'notification'),
(29, 'crm', 'payment'),
(30, 'crm', 'permission'),
(31, 'crm', 'pipeline'),
(32, 'crm', 'product'),
(33, 'crm', 'productcategory'),
(34, 'crm', 'quote'),
(35, 'crm', 'quoteitem'),
(36, 'crm', 'role'),
(37, 'crm', 'rolepermission'),
(38, 'crm', 'setting'),
(39, 'crm', 'task'),
(40, 'crm', 'ticket'),
(41, 'crm', 'ticketcategory'),
(42, 'crm', 'ticketreply'),
(43, 'crm', 'user'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'crm', '0001_initial', '2026-08-22 08:05:02.909818'),
(2, 'contenttypes', '0001_initial', '2026-08-22 08:05:02.933217'),
(3, 'admin', '0001_initial', '2026-08-22 08:05:03.012286'),
(4, 'admin', '0002_logentry_remove_auto_add', '2026-08-22 08:05:03.030539'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2026-08-22 08:05:03.045383'),
(6, 'contenttypes', '0002_remove_content_type_name', '2026-08-22 08:05:03.107149'),
(7, 'auth', '0001_initial', '2026-08-22 08:05:03.292709'),
(8, 'auth', '0002_alter_permission_name_max_length', '2026-08-22 08:05:03.334914'),
(9, 'auth', '0003_alter_user_email_max_length', '2026-08-22 08:05:03.339521'),
(10, 'auth', '0004_alter_user_username_opts', '2026-08-22 08:05:03.343736'),
(11, 'auth', '0005_alter_user_last_login_null', '2026-08-22 08:05:03.348084'),
(12, 'auth', '0006_require_contenttypes_0002', '2026-08-22 08:05:03.348885'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2026-08-22 08:05:03.352677'),
(14, 'auth', '0008_alter_user_username_max_length', '2026-08-22 08:05:03.357167'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2026-08-22 08:05:03.362416'),
(16, 'auth', '0010_alter_group_name_max_length', '2026-08-22 08:05:03.407667'),
(17, 'auth', '0011_update_proxy_permissions', '2026-08-22 08:05:03.432219'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2026-08-22 08:05:03.436045'),
(19, 'sessions', '0001_initial', '2026-08-22 08:05:03.459759');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('01z5vs8x5lcz3101ut066zimqx3v3437', '.eJxVjMsOgjAQRf-la9OUMpWpS_d8A-k8ENS0CYWV8d-VhIVu7znnvsyQtnUatqrLMIu5mMacfjdK_NC8A7mnfCuWS16Xmeyu2INW2xfR5_Vw_w6mVKdvreAIUdUHch0iiBPwOEqEAB0LhsSdVyfUMoHGhoDY4zmGNhIDjub9AeZUOBY:1wyOpx:IhRXd6aVz8d0Hk_o2tpydnbI0u6yd7fIi5WTqKDzmTo', '2026-09-07 15:11:17.747160'),
('0lya41dydtqepjpzond98gmrwethbuam', '.eJxVjMsOgjAQRf-la9OUMpWpS_d8A-k8ENS0CYWV8d-VhIVu7znnvsyQtnUatqrLMIu5mMacfjdK_NC8A7mnfCuWS16Xmeyu2INW2xfR5_Vw_w6mVKdvreAIUdUHch0iiBPwOEqEAB0LhsSdVyfUMoHGhoDY4zmGNhIDjub9AeZUOBY:1wyLP2:MG0y4o51zi6fe0JZiXJxQZrvVrL60JL4nJJyfjk3WO0', '2026-09-07 11:31:16.516661'),
('0zgstupvzb1za4xg39fvy0bk1fztz1kq', '.eJxVjMsOgjAQRf-la9OUMpWpS_d8A-k8ENS0CYWV8d-VhIVu7znnvsyQtnUatqrLMIu5mMacfjdK_NC8A7mnfCuWS16Xmeyu2INW2xfR5_Vw_w6mVKdvreAIUdUHch0iiBPwOEqEAB0LhsSdVyfUMoHGhoDY4zmGNhIDjub9AeZUOBY:1wyOoE:LpO5eAAWOgS6ezce2RecamGPN9bf0I4R-TGvsf6cCSI', '2026-09-07 15:09:30.586104'),
('1br35t89l8cilo5tl0d3rr52g347qxwh', '.eJxVjEEOgjAQRe_StWlKncqUpXvP0HQ6g1RNMRQSjfHuSsKG7X_v_Y8KVWrNYwnyeubprTpzUCEu8xCWKlPIrDrVqN1GMd2lrIBvsVxHncYyT5n0quiNVn0ZWR7nzd0dDLEO_1rAEKKIdWRaRGDDYLFnDw7axOhiaq0YpmMiEN8QULJ48u7oKQH26vsDDz8_Uw:1wyeut:u4glJPOjLy6s5mvLpH6EI0vTVStVQVKwoBqEb_qjKCw', '2026-09-08 08:21:27.129047'),
('3s4j72yu6pm79y7f4cog7tu1us70mah8', '.eJxVjEEOgjAQRe_StWlKncqUpXvP0HQ6g1RNMRQSjfHuSsKG7X_v_Y8KVWrNYwnyeubprTpzUCEu8xCWKlPIrDrVqN1GMd2lrIBvsVxHncYyT5n0quiNVn0ZWR7nzd0dDLEO_1rAEKKIdWRaRGDDYLFnDw7axOhiaq0YpmMiEN8QULJ48u7oKQH26vsDDz8_Uw:1wyepX:b0FU4dtf8jDZ5kGxSvY8YGwE60j8NxMoMBxXaOJHRtQ', '2026-09-08 08:15:55.029217'),
('3si35ra836yiiy6kpkb9fnvglh5zy2hh', '.eJxVjEEOgjAQRe_StWlKncqUpXvP0HQ6g1RNMRQSjfHuSsKG7X_v_Y8KVWrNYwnyeubprTpzUCEu8xCWKlPIrDrVqN1GMd2lrIBvsVxHncYyT5n0quiNVn0ZWR7nzd0dDLEO_1rAEKKIdWRaRGDDYLFnDw7axOhiaq0YpmMiEN8QULJ48u7oKQH26vsDDz8_Uw:1wz49d:mVA5hcnidCYZ4jMsgg8RywijeiaEHvrgaOWo724TGaY', '2026-09-09 11:18:21.089214'),
('3vcxufmm1nrixr5iydo37izlbuprro60', '.eJxVjMsOgjAQRf-la9OUMpWpS_d8A-k8ENS0CYWV8d-VhIVu7znnvsyQtnUatqrLMIu5mMacfjdK_NC8A7mnfCuWS16Xmeyu2INW2xfR5_Vw_w6mVKdvreAIUdUHch0iiBPwOEqEAB0LhsSdVyfUMoHGhoDY4zmGNhIDjub9AeZUOBY:1wyj3v:TGLE_PPapxnlqVj2Avrv-E4yY3yFGqa6N-oVmZbRKvs', '2026-09-08 12:47:03.134026'),
('5km8bxc9u38x02i01b6oinorvcgo1avy', '.eJxVjEEOgjAQRe_StWlKncqUpXvP0HQ6g1RNMRQSjfHuSsKG7X_v_Y8KVWrNYwnyeubprTpzUCEu8xCWKlPIrDrVqN1GMd2lrIBvsVxHncYyT5n0quiNVn0ZWR7nzd0dDLEO_1rAEKKIdWRaRGDDYLFnDw7axOhiaq0YpmMiEN8QULJ48u7oKQH26vsDDz8_Uw:1wy6pj:cN0JBNMqNuYGlhF2-d_Q6f_8cuFClAxu-aTodGqFzkc', '2026-09-06 19:57:51.125322'),
('5u6fxy4i47c17yi3a0k82htr0o61y0bs', '.eJxVjMsOgjAQRf-la9OUMpWpS_d8A-k8ENS0CYWV8d-VhIVu7znnvsyQtnUatqrLMIu5mMacfjdK_NC8A7mnfCuWS16Xmeyu2INW2xfR5_Vw_w6mVKdvreAIUdUHch0iiBPwOEqEAB0LhsSdVyfUMoHGhoDY4zmGNhIDjub9AeZUOBY:1wyKS1:6iqTmue4MZmrMK8mEvLjZrukt_axJEto0zksAqhl-YE', '2026-09-07 10:30:17.069604'),
('6j808n8oksqinpuhp1ncn3nm6b9ve11p', '.eJxVjMsOgjAQRf-la9OUMpWpS_d8A-k8ENS0CYWV8d-VhIVu7znnvsyQtnUatqrLMIu5mMacfjdK_NC8A7mnfCuWS16Xmeyu2INW2xfR5_Vw_w6mVKdvreAIUdUHch0iiBPwOEqEAB0LhsSdVyfUMoHGhoDY4zmGNhIDjub9AeZUOBY:1wyMsE:f3MSQbGPFMXmby8vbNx5pALQK-fjlOkJLNxtEjPEB8I', '2026-09-07 13:05:30.569643'),
('8krdbck4slp14pgt72ohemxmae2w273p', '.eJxVjMsOgjAQRf-la9OUMpWpS_d8A-k8ENS0CYWV8d-VhIVu7znnvsyQtnUatqrLMIu5mMacfjdK_NC8A7mnfCuWS16Xmeyu2INW2xfR5_Vw_w6mVKdvreAIUdUHch0iiBPwOEqEAB0LhsSdVyfUMoHGhoDY4zmGNhIDjub9AeZUOBY:1wyj3j:KzaxitahubI1x7dY8qL_RbhWSP6S_cdKpcb-s5uXnzs', '2026-09-08 12:46:51.884281'),
('8x8bkvi62qtmwkf29sa72thrqlf8wpt6', '.eJxVjEEOgjAQRe_StWlKncqUpXvP0HQ6g1RNMRQSjfHuSsKG7X_v_Y8KVWrNYwnyeubprTpzUCEu8xCWKlPIrDrVqN1GMd2lrIBvsVxHncYyT5n0quiNVn0ZWR7nzd0dDLEO_1rAEKKIdWRaRGDDYLFnDw7axOhiaq0YpmMiEN8QULJ48u7oKQH26vsDDz8_Uw:1wxaPg:Efcq1W66oeuhFho-K2Ubd-dkBxV1pYfMp5O3rHc1Ygk', '2026-09-05 09:20:48.620338'),
('9l3j0hk31wml8wvyve7ysdrxgj0phj5r', '.eJxVjMsOgjAQRf-la9OUMpWpS_d8A-k8ENS0CYWV8d-VhIVu7znnvsyQtnUatqrLMIu5mMacfjdK_NC8A7mnfCuWS16Xmeyu2INW2xfR5_Vw_w6mVKdvreAIUdUHch0iiBPwOEqEAB0LhsSdVyfUMoHGhoDY4zmGNhIDjub9AeZUOBY:1wyMsA:-5H9IT-pjzUqWBJvPcFhE86SNEiuUJx8s7a-8_gzhkY', '2026-09-07 13:05:26.209827'),
('a2bcy15fbhmszbb3muica50lr3z2u6yu', '.eJxVjEEOgjAQRe_StWlKncqUpXvP0HQ6g1RNMRQSjfHuSsKG7X_v_Y8KVWrNYwnyeubprTpzUCEu8xCWKlPIrDrVqN1GMd2lrIBvsVxHncYyT5n0quiNVn0ZWR7nzd0dDLEO_1rAEKKIdWRaRGDDYLFnDw7axOhiaq0YpmMiEN8QULJ48u7oKQH26vsDDz8_Uw:1wy6qY:Z_uic-9arMouMvHospJbuN8DjswvTrHXNyYqMbWUx6E', '2026-09-06 19:58:42.824746'),
('ajfpbkonzjpwxurkom9fvvaik9ox68z1', '.eJxVjMsOgjAQRf-la9OUMpWpS_d8A-k8ENS0CYWV8d-VhIVu7znnvsyQtnUatqrLMIu5mMacfjdK_NC8A7mnfCuWS16Xmeyu2INW2xfR5_Vw_w6mVKdvreAIUdUHch0iiBPwOEqEAB0LhsSdVyfUMoHGhoDY4zmGNhIDjub9AeZUOBY:1wyifK:LtSrZaCuVdiFzMmWyg5oFJhBH0YU6kjLOwDaIdLD44E', '2026-09-08 12:21:38.464777'),
('c7n9k9iyhnl3gfmb7naji73h3jap9g28', '.eJxVjMsOgjAQRf-la9OUMpWpS_d8A-k8ENS0CYWV8d-VhIVu7znnvsyQtnUatqrLMIu5mMacfjdK_NC8A7mnfCuWS16Xmeyu2INW2xfR5_Vw_w6mVKdvreAIUdUHch0iiBPwOEqEAB0LhsSdVyfUMoHGhoDY4zmGNhIDjub9AeZUOBY:1wyMr4:hXY1xQbX0moh6TzZD0BW5ddJpqAusWPpxUGMKF81PYw', '2026-09-07 13:04:18.668343'),
('ctn8v8kvu2okrcn5hqy20y0ounska93b', '.eJxVjMsOgjAQRf-la9OUMpWpS_d8A-k8ENS0CYWV8d-VhIVu7znnvsyQtnUatqrLMIu5mMacfjdK_NC8A7mnfCuWS16Xmeyu2INW2xfR5_Vw_w6mVKdvreAIUdUHch0iiBPwOEqEAB0LhsSdVyfUMoHGhoDY4zmGNhIDjub9AeZUOBY:1wyLVQ:bdMiQU1xUO3JFIsWUVvOERu5lfp-3gindDRZTUf-eWQ', '2026-09-07 11:37:52.279569'),
('fzbi8kwuofbc5sxol6756c9o5ks7f5jr', '.eJxVjMsOgjAQRf-la9OUMpWpS_d8A-k8ENS0CYWV8d-VhIVu7znnvsyQtnUatqrLMIu5mMacfjdK_NC8A7mnfCuWS16Xmeyu2INW2xfR5_Vw_w6mVKdvreAIUdUHch0iiBPwOEqEAB0LhsSdVyfUMoHGhoDY4zmGNhIDjub9AeZUOBY:1wyOpR:dHtIxVDFpdVLArFgZ7CEyhPHnoPLnprgGKO3J588A5s', '2026-09-07 15:10:45.556619'),
('gczk9erzkl33er9uhidf76pct09qli6k', '.eJxVjMsOgjAQRf-la9OUMpWpS_d8A-k8ENS0CYWV8d-VhIVu7znnvsyQtnUatqrLMIu5mMacfjdK_NC8A7mnfCuWS16Xmeyu2INW2xfR5_Vw_w6mVKdvreAIUdUHch0iiBPwOEqEAB0LhsSdVyfUMoHGhoDY4zmGNhIDjub9AeZUOBY:1wyenh:Ow0ULfmKAZoUTGga04Nupa7PLfFygHrNxT6AvmCCQ0w', '2026-09-08 08:14:01.270385'),
('gdaomf0x01152cbnkzf2ohvlarosl1a0', '.eJxVjEEOgjAQRe_StWlKncqUpXvP0HQ6g1RNMRQSjfHuSsKG7X_v_Y8KVWrNYwnyeubprTpzUCEu8xCWKlPIrDrVqN1GMd2lrIBvsVxHncYyT5n0quiNVn0ZWR7nzd0dDLEO_1rAEKKIdWRaRGDDYLFnDw7axOhiaq0YpmMiEN8QULJ48u7oKQH26vsDDz8_Uw:1wxbJE:Cp1_y1IW70t6Ko9bwYhXNNKY-o-vn-yKAIQo03tQ22U', '2026-09-05 10:18:12.829192'),
('ghkiservg3a61kvlp4b2hk73qc950bra', '.eJxVjMsOgjAQRf-la9OUMpWpS_d8A-k8ENS0CYWV8d-VhIVu7znnvsyQtnUatqrLMIu5mMacfjdK_NC8A7mnfCuWS16Xmeyu2INW2xfR5_Vw_w6mVKdvreAIUdUHch0iiBPwOEqEAB0LhsSdVyfUMoHGhoDY4zmGNhIDjub9AeZUOBY:1wyQ2q:2h-aNG2HG-WnLVO6raK4oRyTxIKikOG3sSoixvC8Xbo', '2026-09-07 16:28:40.657355'),
('glns0httzgq5wrifdopre1lcfdfu7xm6', '.eJxVjMsOgjAQRf-la9OUMpWpS_d8A-k8ENS0CYWV8d-VhIVu7znnvsyQtnUatqrLMIu5mMacfjdK_NC8A7mnfCuWS16Xmeyu2INW2xfR5_Vw_w6mVKdvreAIUdUHch0iiBPwOEqEAB0LhsSdVyfUMoHGhoDY4zmGNhIDjub9AeZUOBY:1wyKfh:xpb8n7s8ZroV9zEjRH6PmzqNWCkxG_51ARrLiE0CLG8', '2026-09-07 10:44:25.289163'),
('gxd8tkk51kkjt75irve6857y9mn4lyj8', '.eJxVjMsOgjAQRf-la9OUMpWpS_d8A-k8ENS0CYWV8d-VhIVu7znnvsyQtnUatqrLMIu5mMacfjdK_NC8A7mnfCuWS16Xmeyu2INW2xfR5_Vw_w6mVKdvreAIUdUHch0iiBPwOEqEAB0LhsSdVyfUMoHGhoDY4zmGNhIDjub9AeZUOBY:1wyMiK:VwCQha4WDaBzs8ibv09IVCa-kuLwoNktj_6-vcB7iII', '2026-09-07 12:55:16.743924'),
('hskfwwwsh9vk54vm1wrq2cwr2jyyd2uj', '.eJxVjEEOgjAQRe_StWlKncqUpXvP0HQ6g1RNMRQSjfHuSsKG7X_v_Y8KVWrNYwnyeubprTpzUCEu8xCWKlPIrDrVqN1GMd2lrIBvsVxHncYyT5n0quiNVn0ZWR7nzd0dDLEO_1rAEKKIdWRaRGDDYLFnDw7axOhiaq0YpmMiEN8QULJ48u7oKQH26vsDDz8_Uw:1wzQ87:bmgWAy8I8Wbh1F6RtayNn-c6iZ6SLxg6A71z3SCJOgA', '2026-09-10 10:46:15.793081'),
('i0dbgrliniwdkc5crj4w9jfqod667c16', '.eJxVjEEOgjAQRe_StWlKncqUpXvP0HQ6g1RNMRQSjfHuSsKG7X_v_Y8KVWrNYwnyeubprTpzUCEu8xCWKlPIrDrVqN1GMd2lrIBvsVxHncYyT5n0quiNVn0ZWR7nzd0dDLEO_1rAEKKIdWRaRGDDYLFnDw7axOhiaq0YpmMiEN8QULJ48u7oKQH26vsDDz8_Uw:1wzDWT:ZTHkYHlESVFcrMf-uvA2w1oYa--5EgasuiSnm4JCZms', '2026-09-09 21:18:33.259952'),
('i2cf33umu9mq0d2tx5axcx03kpdwiut4', '.eJxVjMsOgjAQRf-la9OUMpWpS_d8A-k8ENS0CYWV8d-VhIVu7znnvsyQtnUatqrLMIu5mMacfjdK_NC8A7mnfCuWS16Xmeyu2INW2xfR5_Vw_w6mVKdvreAIUdUHch0iiBPwOEqEAB0LhsSdVyfUMoHGhoDY4zmGNhIDjub9AeZUOBY:1wyMrl:wa-obpy_R_WHQjMylS3sRgH0-viwLmcMk83t6-Hox9U', '2026-09-07 13:05:01.235264'),
('jlt2j3gr0v3bc04tqzz5a88s63us9bdy', '.eJxVjMsOgjAQRf-la9OUMpWpS_d8A-k8ENS0CYWV8d-VhIVu7znnvsyQtnUatqrLMIu5mMacfjdK_NC8A7mnfCuWS16Xmeyu2INW2xfR5_Vw_w6mVKdvreAIUdUHch0iiBPwOEqEAB0LhsSdVyfUMoHGhoDY4zmGNhIDjub9AeZUOBY:1wyKLX:FxGxzXziWd2iNCklEHrR_TntaZCQmy8VenNLZOaft1k', '2026-09-07 10:23:35.877709'),
('kdgb30734w9q4iwfxnwxjertmc5ym4ck', '.eJxVjMsOgjAQRf-la9OUMpWpS_d8A-k8ENS0CYWV8d-VhIVu7znnvsyQtnUatqrLMIu5mMacfjdK_NC8A7mnfCuWS16Xmeyu2INW2xfR5_Vw_w6mVKdvreAIUdUHch0iiBPwOEqEAB0LhsSdVyfUMoHGhoDY4zmGNhIDjub9AeZUOBY:1wyOrf:ldC7v74-LYdBzEq7PPcABUtOvsQsmFRK9APMu1XsAu0', '2026-09-07 15:13:03.757724'),
('nc701582446uqx4hrrg4tswv4t1ur78i', '.eJxVjEEOgjAQRe_StWlKncqUpXvP0HQ6g1RNMRQSjfHuSsKG7X_v_Y8KVWrNYwnyeubprTpzUCEu8xCWKlPIrDrVqN1GMd2lrIBvsVxHncYyT5n0quiNVn0ZWR7nzd0dDLEO_1rAEKKIdWRaRGDDYLFnDw7axOhiaq0YpmMiEN8QULJ48u7oKQH26vsDDz8_Uw:1wy6qo:HfmLV_qyT0Qq-Fy_mJwN-ZKuBByxtXtCo_kxHMomeW0', '2026-09-06 19:58:58.840352'),
('nrkcm96it5m3keortok93fb2zzxr3zog', '.eJxVjMsOgjAQRf-la9OUMpWpS_d8A-k8ENS0CYWV8d-VhIVu7znnvsyQtnUatqrLMIu5mMacfjdK_NC8A7mnfCuWS16Xmeyu2INW2xfR5_Vw_w6mVKdvreAIUdUHch0iiBPwOEqEAB0LhsSdVyfUMoHGhoDY4zmGNhIDjub9AeZUOBY:1wyiYX:smbzjaXOwNps5h9reEL9lo85XWFqCknyiyN1gjIK3PY', '2026-09-08 12:14:37.588080'),
('oheqf1uj6bz3nq7hxer5pjsti3xv01i5', '.eJxVjMsOgjAQRf-la9OUMpWpS_d8A-k8ENS0CYWV8d-VhIVu7znnvsyQtnUatqrLMIu5mMacfjdK_NC8A7mnfCuWS16Xmeyu2INW2xfR5_Vw_w6mVKdvreAIUdUHch0iiBPwOEqEAB0LhsSdVyfUMoHGhoDY4zmGNhIDjub9AeZUOBY:1wyN1o:xgBI-b28mqrIe7ziI86jaT-bpZoqOZ4S5Reub6zTTm0', '2026-09-07 13:15:24.013295'),
('ojbl2jj04i4q5g4fx1pmilifidv0y3ap', '.eJxVjMsOgjAQRf-la9OUMpWpS_d8A-k8ENS0CYWV8d-VhIVu7znnvsyQtnUatqrLMIu5mMacfjdK_NC8A7mnfCuWS16Xmeyu2INW2xfR5_Vw_w6mVKdvreAIUdUHch0iiBPwOEqEAB0LhsSdVyfUMoHGhoDY4zmGNhIDjub9AeZUOBY:1wyfJ9:qdz8RfF8nRCZZVeupxZ9XVt_Nn4d4vub_tGWA-9W0fY', '2026-09-08 08:46:31.531396'),
('olmx3pk2ymaqe08q70kzs0k6o0gqpwnx', '.eJxVjMsOgjAQRf-la9OUMpWpS_d8A-k8ENS0CYWV8d-VhIVu7znnvsyQtnUatqrLMIu5mMacfjdK_NC8A7mnfCuWS16Xmeyu2INW2xfR5_Vw_w6mVKdvreAIUdUHch0iiBPwOEqEAB0LhsSdVyfUMoHGhoDY4zmGNhIDjub9AeZUOBY:1wyMqw:4Xcv0OQlXMVlC4polEVzpcNejBZXjbW0bEGWVz7X-6k', '2026-09-07 13:04:10.196321'),
('pjttnlyck3uejjiis2hh2cobldylu0nz', '.eJxVjEEOgjAQRe_StWlKncqUpXvP0HQ6g1RNMRQSjfHuSsKG7X_v_Y8KVWrNYwnyeubprTpzUCEu8xCWKlPIrDrVqN1GMd2lrIBvsVxHncYyT5n0quiNVn0ZWR7nzd0dDLEO_1rAEKKIdWRaRGDDYLFnDw7axOhiaq0YpmMiEN8QULJ48u7oKQH26vsDDz8_Uw:1wyepE:Y1vYoPTl0trJwvvcaqZpoEJyR8v2b7GT-6yVr_J_jG0', '2026-09-08 08:15:36.755934'),
('r6gjbxd27qrnrwp2cv03la6g5cne42dt', '.eJxVjMsOgjAQRf-la9OUMpWpS_d8A-k8ENS0CYWV8d-VhIVu7znnvsyQtnUatqrLMIu5mMacfjdK_NC8A7mnfCuWS16Xmeyu2INW2xfR5_Vw_w6mVKdvreAIUdUHch0iiBPwOEqEAB0LhsSdVyfUMoHGhoDY4zmGNhIDjub9AeZUOBY:1wyesd:MhlaqBo6f1P-msgudsTKyUEl3EUIfPcn7I3Z-BHLYQI', '2026-09-08 08:19:07.130084'),
('rrilpjlzitpsfvzb8v4ijn6fftlq4t3e', '.eJxVjMsOgjAQRf-la9OUMpWpS_d8A-k8ENS0CYWV8d-VhIVu7znnvsyQtnUatqrLMIu5mMacfjdK_NC8A7mnfCuWS16Xmeyu2INW2xfR5_Vw_w6mVKdvreAIUdUHch0iiBPwOEqEAB0LhsSdVyfUMoHGhoDY4zmGNhIDjub9AeZUOBY:1wyOeL:eF8-SuaVnaQ2oL71YU1PBUGdYsrqHSfF59BE6ff95Ds', '2026-09-07 14:59:17.536262'),
('s896vzf1po3r3gqzpmvzu2edqkheiaen', '.eJxVjEEOgjAQRe_StWlKncqUpXvP0HQ6g1RNMRQSjfHuSsKG7X_v_Y8KVWrNYwnyeubprTpzUCEu8xCWKlPIrDrVqN1GMd2lrIBvsVxHncYyT5n0quiNVn0ZWR7nzd0dDLEO_1rAEKKIdWRaRGDDYLFnDw7axOhiaq0YpmMiEN8QULJ48u7oKQH26vsDDz8_Uw:1wzQ7I:CoP2X0jvUKhKIx4_SJj8RV8n3Cm8ris0PUdtZLG0KVE', '2026-09-10 10:45:24.333890'),
('t8c7jyz06kun3id003h7r3w8aa2hiodt', '.eJxVjMsOgjAQRf-la9OUMpWpS_d8A-k8ENS0CYWV8d-VhIVu7znnvsyQtnUatqrLMIu5mMacfjdK_NC8A7mnfCuWS16Xmeyu2INW2xfR5_Vw_w6mVKdvreAIUdUHch0iiBPwOEqEAB0LhsSdVyfUMoHGhoDY4zmGNhIDjub9AeZUOBY:1wyiYL:hjLfWC3oHfXQsHyJktyW4MGsvwDdYLhL5Zgbnau-gcs', '2026-09-08 12:14:25.243241'),
('uynks9ybbi5mseevy9v8eczh3bzwava7', '.eJxVjEEOgjAQRe_StWlKncqUpXvP0HQ6g1RNMRQSjfHuSsKG7X_v_Y8KVWrNYwnyeubprTpzUCEu8xCWKlPIrDrVqN1GMd2lrIBvsVxHncYyT5n0quiNVn0ZWR7nzd0dDLEO_1rAEKKIdWRaRGDDYLFnDw7axOhiaq0YpmMiEN8QULJ48u7oKQH26vsDDz8_Uw:1wy6pH:saFwlvpu9UBuaQwUzLAsp8px5OTlwVwCj3n53BxsWNA', '2026-09-06 19:57:23.052192'),
('wzem514gulokc7nxtn1qq6qdc978uxdi', '.eJxVjEEOgjAQRe_StWlKncqUpXvP0HQ6g1RNMRQSjfHuSsKG7X_v_Y8KVWrNYwnyeubprTpzUCEu8xCWKlPIrDrVqN1GMd2lrIBvsVxHncYyT5n0quiNVn0ZWR7nzd0dDLEO_1rAEKKIdWRaRGDDYLFnDw7axOhiaq0YpmMiEN8QULJ48u7oKQH26vsDDz8_Uw:1wz3yw:6eLLg7JTr1ITpTh_L3Z1QLGhJmDY1wqmb9Yyxnm7D4Y', '2026-09-09 11:07:18.146280'),
('xstiwtjm7deukfqy6jouqcuc03z97puv', '.eJxVjMsOgjAQRf-la9OUMpWpS_d8A-k8ENS0CYWV8d-VhIVu7znnvsyQtnUatqrLMIu5mMacfjdK_NC8A7mnfCuWS16Xmeyu2INW2xfR5_Vw_w6mVKdvreAIUdUHch0iiBPwOEqEAB0LhsSdVyfUMoHGhoDY4zmGNhIDjub9AeZUOBY:1wyKKx:FIdWyD_S1LICwasVUA_Ysg25NOUkKl7GKUKG2e_9qZo', '2026-09-07 10:22:59.246938'),
('yb1tni1ta2hnlwz5yq697zxs1xvh4kob', '.eJxVjMsOgjAQRf-la9OUMpWpS_d8A-k8ENS0CYWV8d-VhIVu7znnvsyQtnUatqrLMIu5mMacfjdK_NC8A7mnfCuWS16Xmeyu2INW2xfR5_Vw_w6mVKdvreAIUdUHch0iiBPwOEqEAB0LhsSdVyfUMoHGhoDY4zmGNhIDjub9AeZUOBY:1wyQ4I:NaaWoYFbDMaWYkT2_ZSSdnGO5x_FNn_JeAr_RrCSTas', '2026-09-07 16:30:10.962075'),
('z4ts42lhwp5w97mtb8r5ro6cc819azjo', '.eJxVjMsOgjAQRf-la9OUMpWpS_d8A-k8ENS0CYWV8d-VhIVu7znnvsyQtnUatqrLMIu5mMacfjdK_NC8A7mnfCuWS16Xmeyu2INW2xfR5_Vw_w6mVKdvreAIUdUHch0iiBPwOEqEAB0LhsSdVyfUMoHGhoDY4zmGNhIDjub9AeZUOBY:1wyKgz:SGVbNJPCth_nPuGhxSs6TSv_WRtTypAnJqQTmBBqock', '2026-09-07 10:45:45.360064'),
('zbvqtjlrytq7dwphk9qmxc1bllwu9sfd', '.eJxVjMsOgjAQRf-la9OUMpWpS_d8A-k8ENS0CYWV8d-VhIVu7znnvsyQtnUatqrLMIu5mMacfjdK_NC8A7mnfCuWS16Xmeyu2INW2xfR5_Vw_w6mVKdvreAIUdUHch0iiBPwOEqEAB0LhsSdVyfUMoHGhoDY4zmGNhIDjub9AeZUOBY:1wyN58:V7G-HIsaPK8-DekTMvAeFucDBsth1x2z_YwNh_arWeI', '2026-09-07 13:18:50.827882'),
('zcfv9kwqsq1vgffucoq78l7iz9vtjoj9', '.eJxVjMsOgjAQRf-la9OUMpWpS_d8A-k8ENS0CYWV8d-VhIVu7znnvsyQtnUatqrLMIu5mMacfjdK_NC8A7mnfCuWS16Xmeyu2INW2xfR5_Vw_w6mVKdvreAIUdUHch0iiBPwOEqEAB0LhsSdVyfUMoHGhoDY4zmGNhIDjub9AeZUOBY:1wyj44:-DOKIcVnYwkURI8VeGoV_BT9eS5N-tRl57bUg61ZkxE', '2026-09-08 12:47:12.213189'),
('zcox67eel3loh3x83vzafuvq3n3dswk8', '.eJxVjMsOgjAQRf-la9OUMpWpS_d8A-k8ENS0CYWV8d-VhIVu7znnvsyQtnUatqrLMIu5mMacfjdK_NC8A7mnfCuWS16Xmeyu2INW2xfR5_Vw_w6mVKdvreAIUdUHch0iiBPwOEqEAB0LhsSdVyfUMoHGhoDY4zmGNhIDjub9AeZUOBY:1wyKal:UHR1_OsuoBYu4c9k9SqMWlb2cQ4kPCYhJqqY1-QYick', '2026-09-07 10:39:19.380732');

-- --------------------------------------------------------

--
-- Table structure for table `email_logs`
--

CREATE TABLE `email_logs` (
  `id` bigint(20) NOT NULL,
  `recipient` varchar(150) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `status` varchar(20) NOT NULL,
  `sent_at` datetime(6) NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `template_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_logs`
--

INSERT INTO `email_logs` (`id`, `recipient`, `subject`, `status`, `sent_at`, `customer_id`, `user_id`, `template_id`) VALUES
(1, 'contact@horizon-broadband.com', 'TechNova Monthly Newsletter', 'Sent', '2026-08-22 08:22:23.329489', 22, 4, 6),
(2, 'contact@reliable-plumbing.com', 'Invoice {{invoice_number}} - Payment Reminder', 'Sent', '2026-08-22 08:22:23.329502', 44, 4, 3),
(3, 'contact@sunrise-bakery-cha.com', 'Invitation: {{meeting_title}}', 'Sent', '2026-08-22 08:22:23.329506', 24, 40, 4),
(4, 'contact@sunrise-bakery-cha.com', 'Following up on your quotation {{quote_number}}', 'Sent', '2026-08-22 08:22:23.329511', 24, 42, 2),
(5, 'contact@quantum-leap-syste.com', 'Your ticket {{ticket_number}} has been resolved', 'Failed', '2026-08-22 08:22:23.329515', 5, 46, 5),
(6, 'contact@ironclad-security.com', 'Invoice {{invoice_number}} - Payment Reminder', 'Sent', '2026-08-22 08:22:23.329520', 9, 16, 3),
(7, 'contact@bright-future-acad.com', 'Invitation: {{meeting_title}}', 'Opened', '2026-08-22 08:22:23.329524', 42, 48, 4),
(8, 'contact@precision-engineer.com', 'TechNova Monthly Newsletter', 'Failed', '2026-08-22 08:22:23.329528', 38, 14, 6),
(9, 'contact@secure-vault-banki.com', 'Following up on your quotation {{quote_number}}', 'Sent', '2026-08-22 08:22:23.329532', 49, 21, 2),
(10, 'contact@coastal-breeze-hot.com', 'Your ticket {{ticket_number}} has been resolved', 'Sent', '2026-08-22 08:22:23.329537', 18, 44, 5),
(11, 'contact@novastar-enterpris.com', 'Welcome to TechNova, {{customer_name}}!', 'Sent', '2026-08-22 08:22:23.329541', 4, 24, 1),
(12, 'contact@happy-trails-trave.com', 'Your ticket {{ticket_number}} has been resolved', 'Opened', '2026-08-22 08:22:23.329545', 32, 34, 5),
(13, 'contact@grand-central-stat.com', 'TechNova Monthly Newsletter', 'Sent', '2026-08-22 08:22:23.329549', 31, 35, 6),
(14, 'contact@fresh-farm-organic.com', 'Invoice {{invoice_number}} - Payment Reminder', 'Sent', '2026-08-22 08:22:23.329553', 35, 29, 3),
(15, 'contact@reliable-plumbing.com', 'TechNova Monthly Newsletter', 'Sent', '2026-08-22 08:22:23.329557', 44, 5, 6),
(16, 'contact@ocean-blue-seafood.com', 'Welcome to TechNova, {{customer_name}}!', 'Sent', '2026-08-22 08:22:23.329561', 30, 6, 1),
(17, 'contact@crescent-moon-medi.com', 'Invoice {{invoice_number}} - Payment Reminder', 'Sent', '2026-08-22 08:22:23.329565', 12, 5, 3),
(18, 'contact@coastal-breeze-hot.com', 'Welcome to TechNova, {{customer_name}}!', 'Sent', '2026-08-22 08:22:23.329569', 18, 45, 1),
(19, 'contact@emerald-city-softw.com', 'Following up on your quotation {{quote_number}}', 'Opened', '2026-08-22 08:22:23.329574', 10, 34, 2),
(20, 'contact@bluesky-technologi.com', 'Invoice {{invoice_number}} - Payment Reminder', 'Opened', '2026-08-22 08:22:23.329578', 2, 27, 3),
(21, 'contact@fresh-farm-organic.com', 'Following up on your quotation {{quote_number}}', 'Sent', '2026-08-22 08:22:23.329582', 35, 31, 2),
(22, 'contact@phoenix-rising-fit.com', 'TechNova Monthly Newsletter', 'Sent', '2026-08-22 08:22:23.329586', 29, 42, 6),
(23, 'contact@titan-industrial-g.com', 'Welcome to TechNova, {{customer_name}}!', 'Opened', '2026-08-22 08:22:23.329590', 13, 2, 1),
(24, 'contact@crystal-clear-wate.com', 'Your ticket {{ticket_number}} has been resolved', 'Sent', '2026-08-22 08:22:23.329594', 15, 42, 5),
(25, 'contact@precision-engineer.com', 'Invoice {{invoice_number}} - Payment Reminder', 'Sent', '2026-08-22 08:22:23.329598', 38, 42, 3),
(26, 'contact@vanguard-financial.com', 'Invitation: {{meeting_title}}', 'Sent', '2026-08-22 08:22:23.329602', 21, 38, 4),
(27, 'contact@prime-time-enterta.com', 'Your ticket {{ticket_number}} has been resolved', 'Sent', '2026-08-22 08:22:23.329606', 34, 29, 5),
(28, 'contact@elite-auto-dealers.com', 'Following up on your quotation {{quote_number}}', 'Sent', '2026-08-22 08:22:23.329611', 37, 20, 2),
(29, 'contact@urban-jungle-lands.com', 'Following up on your quotation {{quote_number}}', 'Sent', '2026-08-22 08:22:23.329615', 17, 31, 2),
(30, 'contact@pioneer-medical-gr.com', 'Welcome to TechNova, {{customer_name}}!', 'Sent', '2026-08-22 08:22:23.329619', 19, 10, 1),
(31, 'contact@ocean-blue-seafood.com', 'Following up on your quotation {{quote_number}}', 'Opened', '2026-08-22 08:22:23.329623', 30, 40, 2),
(32, 'contact@mighty-movers-relo.com', 'Your ticket {{ticket_number}} has been resolved', 'Sent', '2026-08-22 08:22:23.329627', 46, 19, 5),
(33, 'contact@crescent-moon-medi.com', 'TechNova Monthly Newsletter', 'Opened', '2026-08-22 08:22:23.329631', 12, 45, 6),
(34, 'contact@zenith-insurance-b.com', 'Following up on your quotation {{quote_number}}', 'Sent', '2026-08-22 08:22:23.329635', 51, 11, 2),
(35, 'contact@summit-peak-indust.com', 'Invoice {{invoice_number}} - Payment Reminder', 'Sent', '2026-08-22 08:22:23.329639', 3, 37, 3),
(36, 'contact@urban-jungle-lands.com', 'Invoice {{invoice_number}} - Payment Reminder', 'Sent', '2026-08-22 08:22:23.329643', 17, 12, 3),
(37, 'contact@mighty-movers-relo.com', 'Welcome to TechNova, {{customer_name}}!', 'Sent', '2026-08-22 08:22:23.329648', 46, 43, 1),
(38, 'contact@maple-leaf-foods-i.com', 'Following up on your quotation {{quote_number}}', 'Sent', '2026-08-22 08:22:23.329652', 23, 24, 2),
(39, 'contact@redwood-analytics.com', 'Your ticket {{ticket_number}} has been resolved', 'Sent', '2026-08-22 08:22:23.329656', 11, 20, 5),
(40, 'contact@bluesky-technologi.com', 'Invitation: {{meeting_title}}', 'Failed', '2026-08-22 08:22:23.329660', 2, 32, 4),
(41, 'contact@ocean-blue-seafood.com', 'Invoice {{invoice_number}} - Payment Reminder', 'Sent', '2026-08-22 08:22:23.329664', 30, 10, 3),
(42, 'contact@tasty-bite-restaur.com', 'Your ticket {{ticket_number}} has been resolved', 'Sent', '2026-08-22 08:22:23.329668', 48, 33, 5),
(43, 'contact@mighty-movers-relo.com', 'Invoice {{invoice_number}} - Payment Reminder', 'Opened', '2026-08-22 08:22:23.329672', 46, 31, 3),
(44, 'contact@secure-vault-banki.com', 'Your ticket {{ticket_number}} has been resolved', 'Sent', '2026-08-22 08:22:23.329676', 49, 43, 5),
(45, 'contact@elite-auto-dealers.com', 'TechNova Monthly Newsletter', 'Sent', '2026-08-22 08:22:23.329680', 37, 29, 6),
(46, 'contact@pacific-rim-logist.com', 'TechNova Monthly Newsletter', 'Opened', '2026-08-22 08:22:23.329685', 8, 31, 6),
(47, 'contact@ironclad-security.com', 'TechNova Monthly Newsletter', 'Sent', '2026-08-22 08:22:23.329689', 9, 36, 6),
(48, 'contact@bluesky-technologi.com', 'Invitation: {{meeting_title}}', 'Opened', '2026-08-22 08:22:23.329693', 2, 40, 4),
(49, 'contact@phoenix-rising-fit.com', 'Invoice {{invoice_number}} - Payment Reminder', 'Sent', '2026-08-22 08:22:23.329697', 29, 6, 3),
(50, 'contact@global-trade-conso.com', 'TechNova Monthly Newsletter', 'Sent', '2026-08-22 08:22:23.329701', 39, 13, 6),
(51, 'contact@apex-global-soluti.com', 'TechNova Monthly Newsletter', 'Sent', '2026-08-24 14:08:09.401386', 1, 1, 6),
(52, 'contact@apex-global-soluti.com', 'TechNova Monthly Newsletter', 'Sent', '2026-08-27 09:42:24.795288', 1, 1, 3),
(53, 'contact@bluesky-technologi.com', 'Invoice {{invoice_number}} - Payment Reminder', 'Sent', '2026-08-27 09:44:27.379142', 2, 1, 3),
(54, 'contact@summit-peak-indust.com', 'Invoice {{invoice_number}} - Payment Reminder', 'Sent', '2026-08-27 09:44:27.387065', 3, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `body` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `subject`, `body`, `created_at`, `updated_at`) VALUES
(1, 'Welcome New Customer', 'Welcome to TechNova, {{customer_name}}!', 'Dear {{contact_name}},\n\nThank you for choosing TechNova Solutions. Your account is ready.\n\nBest regards,\nThe TechNova Team', '2025-05-21 10:01:23.315842', '2026-08-22 08:22:23.314925'),
(2, 'Quotation Follow Up', 'Following up on your quotation {{quote_number}}', 'Hello {{contact_name}},\n\nI wanted to follow up regarding the quotation we sent. Do you have any questions?\n\nRegards,\n{{sender_name}}', '2025-11-24 07:04:23.317285', '2026-08-22 08:22:23.316740'),
(3, 'Invoice Reminder', 'Invoice {{invoice_number}} - Payment Reminder', 'Dear Customer,\n\nThis is a friendly reminder that invoice {{invoice_number}} is due on {{due_date}}.\n\nThank you.', '2026-01-15 23:38:23.318481', '2026-08-22 08:22:23.318015'),
(4, 'Meeting Invitation', 'Invitation: {{meeting_title}}', 'Hi {{contact_name}},\n\nYou are invited to {{meeting_title}} on {{meeting_date}} at {{start_time}}.\n\nPlease confirm availability.', '2025-04-24 12:48:23.320105', '2026-08-22 08:22:23.319202'),
(5, 'Ticket Resolved', 'Your ticket {{ticket_number}} has been resolved', 'Hello,\n\nYour support ticket {{ticket_number}} has been marked as resolved. Reply within 7 days to reopen.\n\nSupport Team', '2025-11-01 01:32:23.322414', '2026-08-22 08:22:23.321502'),
(6, 'Newsletter - Monthly Updates', 'TechNova Monthly Newsletter', 'Here are this month highlights: new features, upcoming webinars and customer stories.', '2025-09-06 05:43:23.326843', '2026-08-22 08:22:23.323875');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) NOT NULL,
  `invoice_number` varchar(30) NOT NULL,
  `invoice_date` date NOT NULL,
  `due_date` date DEFAULT NULL,
  `subtotal` decimal(14,2) NOT NULL,
  `tax` decimal(14,2) NOT NULL,
  `discount` decimal(14,2) NOT NULL,
  `total` decimal(14,2) NOT NULL,
  `paid_amount` decimal(14,2) NOT NULL,
  `balance` decimal(14,2) NOT NULL,
  `status` varchar(15) NOT NULL,
  `notes` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `customer_id` bigint(20) NOT NULL,
  `quote_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_number`, `invoice_date`, `due_date`, `subtotal`, `tax`, `discount`, `total`, `paid_amount`, `balance`, `status`, `notes`, `created_at`, `updated_at`, `created_by`, `customer_id`, `quote_id`) VALUES
(1, 'INV-2026-0001', '2026-07-13', '2026-08-12', '1848.00', '5.70', '0.00', '1853.70', '1853.70', '0.00', 'Paid', 'Payment due within stated terms.', '2026-03-13 05:47:23.093915', '2026-08-22 08:22:23.090361', 35, 38, 2),
(2, 'INV-2026-0002', '2026-05-28', '2026-06-11', '2633.00', '214.88', '75.00', '2772.88', '2772.88', '0.00', 'Paid', 'Payment due within stated terms.', '2026-04-25 13:08:23.100133', '2026-08-22 08:22:23.096369', 47, 10, 3),
(3, 'INV-2026-0003', '2026-07-28', '2026-08-18', '4112.00', '311.35', '0.00', '4423.35', '100.00', '4323.35', 'Partial', 'Payment due within stated terms.', '2026-04-05 19:08:23.104834', '2026-08-27 09:31:15.351502', 50, 45, 6),
(4, 'INV-2026-0004', '2026-02-08', '2026-02-22', '3007.00', '37.50', '150.00', '2894.50', '0.00', '2894.50', 'Draft', 'Payment due within stated terms.', '2026-08-02 16:16:23.107167', '2026-08-22 08:22:23.105753', 13, 43, 8),
(5, 'INV-2026-0005', '2026-04-24', '2026-05-08', '4175.00', '367.60', '150.00', '4392.60', '4392.60', '0.00', 'Paid', 'Payment due within stated terms.', '2026-05-28 19:04:23.110261', '2026-08-22 08:22:23.108012', 3, 30, NULL),
(6, 'INV-2026-0006', '2026-04-07', '2026-05-07', '8990.00', '0.00', '0.00', '8990.00', '4495.00', '4495.00', 'Overdue', 'Payment due within stated terms.', '2026-01-22 21:54:23.113062', '2026-08-22 08:22:23.111655', 30, 10, 15),
(7, 'INV-2025-0007', '2025-12-31', '2026-01-21', '4529.00', '431.42', '150.00', '4810.42', '0.00', '4810.42', 'Overdue', 'Payment due within stated terms.', '2026-06-01 19:47:23.119253', '2026-08-22 08:22:23.117415', 13, 46, 16),
(8, 'INV-2026-0008', '2026-05-12', '2026-05-26', '946.00', '48.77', '75.00', '919.77', '0.00', '919.77', 'Overdue', 'Payment due within stated terms.', '2026-03-16 08:33:23.122789', '2026-08-22 08:22:23.121086', 50, 3, 17),
(9, 'INV-2026-0009', '2026-04-25', '2026-05-09', '1144.00', '72.17', '150.00', '1066.17', '0.00', '1066.17', 'Overdue', 'Payment due within stated terms.', '2025-12-10 16:48:23.126194', '2026-08-22 08:22:23.123871', 41, 19, 20),
(10, 'INV-2026-0010', '2026-01-23', '2026-02-13', '8381.00', '624.10', '0.00', '9005.10', '0.00', '9005.10', 'Overdue', 'Payment due within stated terms.', '2026-07-28 03:13:23.128473', '2026-08-22 08:22:23.127118', 39, 1, 22),
(11, 'INV-2026-0011', '2026-08-03', '2026-08-17', '1390.00', '0.00', '75.00', '1315.00', '0.00', '1315.00', 'Overdue', 'Payment due within stated terms.', '2026-03-06 06:19:23.130158', '2026-08-22 08:22:23.129204', 23, 42, 26),
(12, 'INV-2026-0012', '2026-07-21', '2026-08-04', '1048.00', '15.00', '75.00', '988.00', '988.00', '0.00', 'Paid', 'Payment due within stated terms.', '2026-02-14 19:30:23.131647', '2026-08-22 08:22:23.130753', 12, 27, 1),
(13, 'INV-2026-0013', '2026-03-30', '2026-04-20', '15390.00', '1344.00', '0.00', '16734.00', '0.00', '16734.00', 'Overdue', 'Payment due within stated terms.', '2025-12-17 08:38:23.136638', '2026-08-22 08:22:23.133344', 19, 5, 2),
(14, 'INV-2026-0014', '2026-03-16', '2026-04-06', '5795.00', '63.72', '150.00', '5708.72', '2854.36', '2854.36', 'Overdue', 'Payment due within stated terms.', '2026-05-21 13:08:23.141207', '2026-08-22 08:22:23.137503', 46, 51, 3),
(15, 'INV-2026-0015', '2026-01-26', '2026-02-09', '16644.00', '836.01', '75.00', '17405.01', '17405.01', '0.00', 'Paid', 'Payment due within stated terms.', '2025-12-05 15:02:23.145452', '2026-08-22 08:22:23.143954', 48, 8, 6),
(16, 'INV-2026-0016', '2026-02-23', '2026-03-16', '3596.00', '0.00', '75.00', '3521.00', '3521.00', '0.00', 'Paid', 'Payment due within stated terms.', '2025-12-19 16:31:23.148384', '2026-08-22 08:22:23.146821', 22, 22, NULL),
(17, 'INV-2026-0017', '2026-07-09', '2026-08-08', '21360.00', '1558.80', '75.00', '22843.80', '0.00', '22843.80', 'Overdue', 'Payment due within stated terms.', '2026-07-20 04:05:23.160796', '2026-08-22 08:22:23.151642', 30, 41, NULL),
(18, 'INV-2026-0018', '2026-01-14', '2026-02-04', '18980.00', '999.00', '75.00', '19904.00', '19904.00', '0.00', 'Paid', 'Payment due within stated terms.', '2026-03-13 10:20:23.166664', '2026-08-22 08:22:23.163533', 22, 2, NULL),
(19, 'INV-2026-0019', '2026-04-12', '2026-05-03', '15285.00', '1402.92', '150.00', '16537.92', '16537.92', '0.00', 'Paid', 'Payment due within stated terms.', '2025-12-06 07:31:23.171854', '2026-08-22 08:22:23.168145', 24, 16, NULL),
(20, 'INV-2026-0020', '2026-06-30', '2026-07-30', '2639.00', '143.71', '0.00', '2782.71', '0.00', '2782.71', 'Overdue', 'Payment due within stated terms.', '2025-12-29 19:37:23.175864', '2026-08-22 08:22:23.174294', 31, 22, NULL),
(21, 'INV-2026-0021', '2026-01-08', '2026-01-22', '7490.00', '374.50', '75.00', '7789.50', '0.00', '7789.50', 'Overdue', 'Payment due within stated terms.', '2025-12-26 07:16:23.178002', '2026-08-22 08:22:23.176874', 8, 34, NULL),
(23, 'INV-2026-0023', '2026-07-08', '2026-07-22', '11691.00', '1402.92', '75.00', '13018.92', '0.00', '13018.92', 'Overdue', 'Payment due within stated terms.', '2026-04-06 03:37:23.189054', '2026-08-22 08:22:23.184598', 8, 18, NULL),
(24, 'INV-2026-0024', '2026-01-24', '2026-02-07', '17190.00', '1216.56', '0.00', '18406.56', '0.00', '18406.56', 'Overdue', 'Payment due within stated terms.', '2026-02-07 07:17:23.204243', '2026-08-22 08:22:23.201092', 37, 19, NULL),
(25, 'INV-2026-0025', '2026-04-30', '2026-05-30', '5520.00', '183.00', '0.00', '5703.00', '5703.00', '0.00', 'Paid', 'Payment due within stated terms.', '2025-12-31 22:39:23.208169', '2026-08-22 08:22:23.205764', 12, 26, NULL),
(26, 'INV-2026-0026', '2026-06-19', '2026-07-19', '9116.00', '835.64', '0.00', '9951.64', '0.00', '9951.64', 'Overdue', 'Payment due within stated terms.', '2026-02-23 16:53:23.210769', '2026-08-22 08:22:23.209358', 10, 15, NULL),
(27, 'INV-2026-0027', '2026-01-13', '2026-02-03', '9318.00', '720.00', '0.00', '10038.00', '10038.00', '0.00', 'Paid', 'Payment due within stated terms.', '2026-03-20 14:53:23.213684', '2026-08-22 08:22:23.211871', 19, 11, NULL),
(28, 'INV-2026-0028', '2026-06-17', '2026-07-17', '26298.00', '1609.60', '0.00', '27907.60', '0.00', '27907.60', 'Overdue', 'Payment due within stated terms.', '2025-12-16 04:45:23.218954', '2026-08-22 08:22:23.216634', 16, 40, NULL),
(29, 'INV-2026-0029', '2026-03-18', '2026-04-17', '18467.00', '1022.70', '0.00', '19489.70', '0.00', '19489.70', 'Overdue', 'Payment due within stated terms.', '2026-05-03 03:26:23.224214', '2026-08-22 08:22:23.221699', 21, 30, NULL),
(30, 'INV-2026-0030', '2026-03-22', '2026-04-05', '1806.00', '169.80', '150.00', '1825.80', '1825.80', '0.00', 'Paid', 'Payment due within stated terms.', '2026-05-14 01:39:23.249623', '2026-08-22 08:22:23.239039', 41, 49, NULL),
(31, 'INV-2026-0031', '2026-01-26', '2026-02-16', '6746.00', '378.50', '75.00', '7049.50', '7049.50', '0.00', 'Paid', 'Payment due within stated terms.', '2026-07-26 07:37:23.258834', '2026-08-22 08:22:23.255447', 20, 44, NULL),
(32, 'INV-2026-0032', '2026-01-09', '2026-01-23', '14618.00', '115.32', '150.00', '14583.32', '7291.66', '7291.66', 'Overdue', 'Payment due within stated terms.', '2026-01-21 04:04:23.265014', '2026-08-22 08:22:23.263214', 2, 19, NULL),
(33, 'INV-2026-0033', '2026-03-05', '2026-04-04', '14218.00', '1323.10', '150.00', '15391.10', '0.00', '15391.10', 'Overdue', 'Payment due within stated terms.', '2026-01-03 20:00:23.268503', '2026-08-22 08:22:23.266666', 10, 2, NULL),
(34, 'INV-2026-0034', '2026-06-21', '2026-07-21', '12843.00', '829.56', '75.00', '13597.56', '0.00', '13597.56', 'Draft', 'Payment due within stated terms.', '2026-06-25 13:52:23.270894', '2026-08-22 08:22:23.269439', 28, 12, NULL),
(35, 'INV-2026-0035', '2026-02-22', '2026-03-24', '30927.00', '3708.54', '75.00', '34560.54', '34560.54', '0.00', 'Paid', 'Payment due within stated terms.', '2026-07-25 21:48:23.273496', '2026-08-22 08:22:23.271694', 10, 6, NULL),
(36, 'INV-2026-0036', '2026-04-23', '2026-05-23', '6798.00', '353.78', '0.00', '7151.78', '7151.78', '0.00', 'Paid', 'Payment due within stated terms.', '2026-07-26 11:04:23.277640', '2026-08-22 08:22:23.275447', 31, 33, NULL),
(37, 'INV-2026-0037', '2026-06-05', '2026-06-19', '3920.00', '288.54', '0.00', '4208.54', '4208.54', '0.00', 'Paid', 'Payment due within stated terms.', '2026-06-05 10:54:23.284126', '2026-08-22 08:22:23.282497', 6, 32, NULL),
(38, 'INV-2026-0038', '2026-01-29', '2026-02-19', '858.00', '0.00', '0.00', '858.00', '0.00', '858.00', 'Overdue', 'Payment due within stated terms.', '2025-12-11 18:33:23.287171', '2026-08-22 08:22:23.285715', 16, 45, NULL),
(39, 'INV-2026-0039', '2026-05-11', '2026-06-01', '13935.00', '1558.80', '0.00', '15493.80', '15493.80', '0.00', 'Paid', 'Payment due within stated terms.', '2026-05-28 17:57:23.289290', '2026-08-22 08:22:23.287986', 43, 16, NULL),
(40, 'INV-2026-0040', '2026-02-07', '2026-02-21', '26036.00', '2695.90', '0.00', '28731.90', '8619.57', '20112.33', 'Overdue', 'Payment due within stated terms.', '2026-02-21 18:43:23.293174', '2026-08-22 08:22:23.291374', 35, 49, NULL),
(42, 'INV-2026-0042', '2026-08-27', '2026-09-26', '3726.00', '224.77', '0.00', '3950.77', '0.00', '3950.77', 'Sent', 'From QT-2026-0034', '2026-08-27 09:29:03.232581', '2026-08-27 09:29:03.232601', 1, 1, 34);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` bigint(20) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `tax` decimal(5,2) NOT NULL,
  `discount` decimal(5,2) NOT NULL,
  `total` decimal(14,2) NOT NULL,
  `invoice_id` bigint(20) NOT NULL,
  `product_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice_items`
--

INSERT INTO `invoice_items` (`id`, `quantity`, `price`, `tax`, `discount`, `total`, `invoice_id`, `product_id`) VALUES
(1, '9.00', '199.00', '0.00', '0.00', '1791.00', 1, 20),
(2, '3.00', '19.00', '10.00', '10.00', '57.00', 1, 28),
(3, '5.00', '89.00', '0.00', '5.00', '422.75', 2, 27),
(4, '5.00', '39.00', '10.00', '0.00', '214.50', 2, 48),
(5, '4.00', '49.00', '8.00', '0.00', '211.68', 2, 50),
(6, '3.00', '599.00', '10.00', '0.00', '1976.70', 2, 9),
(7, '6.00', '159.00', '0.00', '0.00', '954.00', 3, 46),
(8, '8.00', '159.00', '10.00', '5.00', '1335.60', 3, 25),
(9, '3.00', '599.00', '10.00', '0.00', '1976.70', 3, 9),
(10, '1.00', '89.00', '5.00', '5.00', '89.00', 3, 15),
(11, '8.00', '329.00', '0.00', '0.00', '2632.00', 4, 40),
(12, '4.00', '15.00', '10.00', '5.00', '63.00', 4, 30),
(13, '1.00', '42.00', '10.00', '10.00', '42.00', 4, 26),
(14, '7.00', '39.00', '10.00', '0.00', '300.30', 4, 48),
(15, '1.00', '39.00', '10.00', '10.00', '39.00', 5, 48),
(16, '9.00', '159.00', '10.00', '0.00', '1574.10', 5, 25),
(17, '5.00', '499.00', '8.00', '5.00', '2569.85', 5, 13),
(18, '5.00', '42.00', '10.00', '0.00', '231.00', 5, 26),
(19, '10.00', '899.00', '0.00', '10.00', '8091.00', 6, 12),
(20, '3.00', '1099.00', '10.00', '0.00', '3626.70', 7, 45),
(21, '2.00', '79.00', '10.00', '5.00', '165.90', 7, 6),
(22, '6.00', '179.00', '8.00', '0.00', '1159.92', 7, 41),
(23, '3.00', '299.00', '5.00', '0.00', '941.85', 8, 11),
(24, '1.00', '49.00', '8.00', '5.00', '50.47', 8, 50),
(25, '1.00', '499.00', '8.00', '10.00', '489.02', 9, 13),
(26, '5.00', '129.00', '5.00', '0.00', '677.25', 9, 49),
(27, '7.00', '15.00', '10.00', '5.00', '110.25', 10, 30),
(28, '10.00', '79.00', '10.00', '10.00', '790.00', 10, 6),
(29, '4.00', '1299.00', '5.00', '10.00', '4936.20', 10, 1),
(30, '10.00', '229.00', '12.00', '10.00', '2335.80', 10, 18),
(31, '10.00', '139.00', '0.00', '10.00', '1251.00', 11, 43),
(32, '10.00', '15.00', '10.00', '0.00', '165.00', 12, 30),
(33, '2.00', '449.00', '0.00', '0.00', '898.00', 12, 3),
(34, '9.00', '429.00', '0.00', '5.00', '3667.95', 13, 22),
(35, '4.00', '2800.00', '12.00', '0.00', '12544.00', 13, 34),
(36, '1.00', '329.00', '0.00', '0.00', '329.00', 13, 40),
(37, '9.00', '59.00', '12.00', '10.00', '541.62', 14, 17),
(38, '6.00', '329.00', '0.00', '0.00', '1974.00', 14, 40),
(39, '10.00', '329.00', '0.00', '5.00', '3125.50', 14, 40),
(40, '1.00', '89.00', '0.00', '0.00', '89.00', 15, 27),
(41, '9.00', '1249.00', '5.00', '0.00', '11803.05', 15, 23),
(42, '4.00', '1299.00', '5.00', '0.00', '5455.80', 15, 1),
(43, '2.00', '59.00', '12.00', '0.00', '132.16', 15, 17),
(44, '4.00', '899.00', '0.00', '0.00', '3596.00', 16, 12),
(45, '1.00', '89.00', '0.00', '10.00', '80.10', 17, 27),
(46, '10.00', '199.00', '0.00', '0.00', '1990.00', 17, 20),
(47, '9.00', '699.00', '0.00', '0.00', '6291.00', 17, 36),
(48, '10.00', '1299.00', '12.00', '0.00', '14548.80', 17, 14),
(49, '10.00', '999.00', '10.00', '5.00', '10489.50', 18, 37),
(50, '10.00', '899.00', '0.00', '0.00', '8990.00', 18, 12),
(51, '9.00', '1299.00', '12.00', '0.00', '13093.92', 19, 14),
(52, '2.00', '899.00', '0.00', '0.00', '1798.00', 19, 12),
(53, '4.00', '449.00', '0.00', '0.00', '1796.00', 19, 3),
(54, '6.00', '49.00', '8.00', '0.00', '317.52', 20, 50),
(55, '2.00', '49.00', '8.00', '10.00', '96.04', 20, 50),
(56, '3.00', '749.00', '5.00', '0.00', '2359.35', 20, 44),
(57, '10.00', '749.00', '5.00', '0.00', '7864.50', 21, 44),
(61, '9.00', '1299.00', '12.00', '0.00', '13093.92', 23, 14),
(62, '6.00', '329.00', '0.00', '10.00', '1776.60', 24, 40),
(63, '1.00', '24.00', '5.00', '0.00', '25.20', 24, 29),
(64, '8.00', '1899.00', '8.00', '0.00', '16407.36', 24, 2),
(65, '6.00', '329.00', '0.00', '0.00', '1974.00', 25, 40),
(66, '4.00', '429.00', '0.00', '10.00', '1544.40', 25, 22),
(67, '8.00', '79.00', '10.00', '10.00', '632.00', 25, 6),
(68, '2.00', '599.00', '10.00', '5.00', '1257.90', 25, 9),
(69, '3.00', '42.00', '10.00', '0.00', '138.60', 26, 26),
(70, '8.00', '649.00', '10.00', '5.00', '5451.60', 26, 21),
(71, '2.00', '1899.00', '8.00', '5.00', '3911.94', 26, 2),
(72, '2.00', '4500.00', '8.00', '5.00', '9270.00', 27, 33),
(73, '2.00', '159.00', '0.00', '0.00', '318.00', 27, 46),
(74, '2.00', '159.00', '10.00', '0.00', '349.80', 28, 25),
(75, '10.00', '1299.00', '12.00', '5.00', '13899.30', 28, 14),
(76, '10.00', '19.00', '10.00', '0.00', '209.00', 28, 28),
(77, '4.00', '3200.00', '0.00', '0.00', '12800.00', 28, 35),
(78, '5.00', '899.00', '0.00', '5.00', '4270.25', 29, 12),
(79, '10.00', '129.00', '10.00', '0.00', '1419.00', 29, 5),
(80, '10.00', '749.00', '5.00', '5.00', '7490.00', 29, 44),
(81, '8.00', '649.00', '10.00', '0.00', '5711.20', 29, 21),
(82, '9.00', '24.00', '5.00', '0.00', '226.80', 30, 29),
(83, '10.00', '159.00', '10.00', '10.00', '1590.00', 30, 25),
(84, '10.00', '79.00', '10.00', '0.00', '869.00', 31, 6),
(85, '9.00', '329.00', '0.00', '5.00', '2812.95', 31, 40),
(86, '5.00', '599.00', '10.00', '0.00', '3294.50', 31, 9),
(87, '6.00', '179.00', '8.00', '5.00', '1106.22', 32, 41),
(88, '7.00', '42.00', '10.00', '5.00', '308.70', 32, 26),
(89, '4.00', '3200.00', '0.00', '0.00', '12800.00', 32, 35),
(90, '3.00', '150.00', '0.00', '0.00', '450.00', 32, 31),
(91, '2.00', '599.00', '10.00', '0.00', '1317.80', 33, 9),
(92, '7.00', '149.00', '10.00', '5.00', '1095.15', 33, 42),
(93, '10.00', '1099.00', '10.00', '5.00', '11539.50', 33, 45),
(94, '3.00', '329.00', '0.00', '5.00', '937.65', 33, 40),
(95, '4.00', '189.00', '5.00', '10.00', '718.20', 34, 47),
(96, '7.00', '229.00', '12.00', '10.00', '1635.06', 34, 18),
(97, '6.00', '999.00', '10.00', '0.00', '6593.40', 34, 37),
(98, '10.00', '449.00', '0.00', '5.00', '4265.50', 34, 3),
(99, '9.00', '15.00', '10.00', '0.00', '148.50', 35, 30),
(100, '10.00', '2800.00', '12.00', '0.00', '31360.00', 35, 34),
(101, '8.00', '349.00', '12.00', '0.00', '3127.04', 35, 16),
(102, '5.00', '1249.00', '5.00', '0.00', '6557.25', 36, 23),
(103, '1.00', '299.00', '5.00', '10.00', '284.05', 36, 11),
(104, '5.00', '39.00', '10.00', '10.00', '195.00', 36, 48),
(105, '1.00', '59.00', '12.00', '5.00', '63.13', 36, 17),
(106, '3.00', '59.00', '12.00', '10.00', '180.54', 37, 17),
(107, '5.00', '229.00', '12.00', '0.00', '1282.40', 37, 18),
(108, '2.00', '1299.00', '5.00', '10.00', '2468.10', 37, 1),
(109, '2.00', '429.00', '0.00', '0.00', '858.00', 38, 22),
(110, '10.00', '1299.00', '12.00', '0.00', '14548.80', 39, 14),
(111, '5.00', '189.00', '0.00', '0.00', '945.00', 39, 4),
(112, '5.00', '150.00', '0.00', '0.00', '750.00', 40, 31),
(113, '7.00', '2800.00', '12.00', '0.00', '21952.00', 40, 34),
(114, '8.00', '149.00', '10.00', '5.00', '1251.60', 40, 19),
(115, '6.00', '749.00', '5.00', '10.00', '4269.30', 40, 44),
(117, '1.00', '1299.00', '5.00', '0.00', '1363.95', 42, 1),
(118, '1.00', '1899.00', '8.00', '0.00', '2050.92', 42, 2),
(119, '1.00', '449.00', '0.00', '0.00', '449.00', 42, 3),
(120, '1.00', '79.00', '10.00', '0.00', '86.90', 42, 6);

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` bigint(20) NOT NULL,
  `company` varchar(150) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `website` varchar(150) NOT NULL,
  `expected_revenue` decimal(14,2) NOT NULL,
  `priority` varchar(10) NOT NULL,
  `notes` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `assigned_to` bigint(20) DEFAULT NULL,
  `converted_customer_id` bigint(20) DEFAULT NULL,
  `source_id` bigint(20) DEFAULT NULL,
  `status_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `company`, `first_name`, `last_name`, `email`, `phone`, `website`, `expected_revenue`, `priority`, `notes`, `created_at`, `updated_at`, `assigned_to`, `converted_customer_id`, `source_id`, `status_id`) VALUES
(1, 'Happy Trails Travel Agency', 'Nancy', 'King', 'nancy.king@happy-trails-t.com', '+1 408-579-6126', 'https://www.happy-trails-travel.com', '110000.00', 'Low', 'Interested in Managed Services.', '2026-06-26 09:13:22.541977', '2026-08-22 08:22:22.540376', 10, NULL, 8, 3),
(2, 'Metro City Realty', 'Mary', 'Moore', 'mary.moore@metro-city-rea.com', '+1 537-435-7223', 'https://www.metro-city-realty.com', '150000.00', 'Medium', 'Interested in Security Audit.', '2026-04-03 11:39:22.543815', '2026-08-22 08:22:22.542932', 22, NULL, 3, 2),
(3, 'Secure Vault Banking', 'Lisa', 'Moore', 'lisa.moore@secure-vault-b.com', '+1 950-560-3773', 'https://www.secure-vault-banking.com', '40000.00', 'Urgent', 'Interested in Security Audit.', '2026-07-05 14:41:22.557401', '2026-08-22 08:22:22.556490', 35, NULL, 8, 2),
(4, 'Summit Peak IndustriesLLC', 'Patricia', 'Wright', 'patricia.wright@summit-peak-in.com', '+1 340-845-4791', 'https://www.summit-peak-industri.com', '22000.00', 'Medium', 'Interested in CRM Platform.', '2026-06-27 15:53:22.560134', '2026-08-22 08:22:22.559156', 7, NULL, 1, 4),
(5, 'NextGen Robotics Labs', 'Nancy', 'Brown', 'nancy.brown@nextgen-roboti.com', '+1 744-764-7739', 'https://www.nextgen-robotics-lab.com', '8000.00', 'Low', 'Interested in Training Program.', '2026-06-12 15:04:22.561729', '2026-08-22 08:22:22.561023', 35, 8, 1, 1),
(6, 'Elegant Interiors Studio', 'Mary', 'King', 'mary.king@elegant-interi.com', '+1 736-352-4948', 'https://www.elegant-interiors-st.com', '54000.00', 'Urgent', 'Interested in Training Program.', '2026-06-18 21:05:22.563423', '2026-08-22 08:22:22.562522', 15, NULL, 2, 1),
(7, 'Sunrise Bakery Chain', 'Betty', 'Garcia', 'betty.garcia@sunrise-bakery.com', '+1 507-900-2320', 'https://www.sunrise-bakery-chain.com', '172000.00', 'Low', 'Interested in Network Setup.', '2026-05-10 19:58:22.567193', '2026-08-22 08:22:22.566076', 33, NULL, 4, 2),
(8, 'NovaStar EnterprisesLLC', 'Michelle', 'Young', 'michelle.young@novastar-enter.com', '+1 644-860-6427', 'https://www.novastar-enterprises.com', '149000.00', 'Low', 'Interested in Training Program.', '2026-08-12 01:09:22.568823', '2026-08-22 08:22:22.568272', 14, NULL, 2, 4),
(9, 'Grand Central StationersLtd', 'Ronald', 'Nguyen', 'ronald.nguyen@grand-central.com', '+1 756-777-1539', 'https://www.grand-central-statio.com', '50000.00', 'Medium', 'Interested in CRM Platform.', '2026-06-29 14:13:22.569976', '2026-08-22 08:22:22.569482', 6, NULL, 2, 3),
(10, 'Whispering Pines ResortsLLC', 'Ryan', 'Campbell', 'ryan.campbell@whispering-pin.com', '+1 446-780-7375', 'https://www.whispering-pines-res.com', '178000.00', 'Urgent', 'Interested in Annual Support Plan.', '2026-05-15 09:14:22.571230', '2026-08-22 08:22:22.570565', 23, 28, 3, 5),
(11, 'Golden Gate TradingLtd', 'Ronald', 'Mitchell', 'ronald.mitchell@golden-gate-tr.com', '+1 437-277-6580', 'https://www.golden-gate-tradingl.com', '159000.00', 'Urgent', 'Interested in Managed Services.', '2026-05-12 22:21:22.574162', '2026-08-22 08:22:22.572446', 7, NULL, 2, 4),
(12, 'Zenith Insurance Brokers', 'George', 'Jackson', 'george.jackson@zenith-insuran.com', '+1 766-584-8075', 'https://www.zenith-insurance-bro.com', '52000.00', 'Urgent', 'Interested in Cloud Migration.', '2026-07-31 13:04:22.577910', '2026-08-22 08:22:22.576363', 35, NULL, 4, 3),
(13, 'Quantum Leap SystemsLLC', 'Jessica', 'Campbell', 'jessica.campbell@quantum-leap-s.com', '+1 928-849-3527', 'https://www.quantum-leap-systems.com', '194000.00', 'High', 'Interested in Annual Support Plan.', '2026-05-22 05:17:22.580329', '2026-08-22 08:22:22.579158', 21, NULL, 3, 4),
(14, 'Phoenix Rising FitnessLtd', 'James', 'Lee', 'james.lee@phoenix-rising.com', '+1 289-391-8061', 'https://www.phoenix-rising-fitne.com', '119000.00', 'Urgent', 'Interested in Training Program.', '2026-04-12 19:16:22.581970', '2026-08-22 08:22:22.581154', 21, 45, 2, 2),
(15, 'Maple Leaf Foods IncLLC', 'Mary', 'Garcia', 'mary.garcia@maple-leaf-foo.com', '+1 212-498-7779', 'https://www.maple-leaf-foods-inc.com', '104000.00', 'Low', 'Interested in Training Program.', '2026-06-20 13:49:22.586436', '2026-08-22 08:22:22.582763', 50, NULL, 6, 4),
(16, 'Thunderbolt Gaming StudiosGroup', 'William', 'Hall', 'william.hall@thunderbolt-ga.com', '+1 474-704-3390', 'https://www.thunderbolt-gaming-s.com', '21000.00', 'Medium', 'Interested in Cloud Migration.', '2026-06-12 19:03:22.588794', '2026-08-22 08:22:22.587347', 12, NULL, 5, 3),
(17, 'Sunrise Bakery ChainLtd', 'Steven', 'Jones', 'steven.jones@sunrise-bakery.com', '+1 831-400-8501', 'https://www.sunrise-bakery-chain.com', '32000.00', 'Medium', 'Interested in Software License.', '2026-08-20 20:01:22.592948', '2026-08-22 08:22:22.590163', 19, NULL, 8, 5),
(18, 'Horizon Broadband Networks', 'Amanda', 'Sanchez', 'amanda.sanchez@horizon-broadb.com', '+1 339-507-6253', 'https://www.horizon-broadband-ne.com', '159000.00', 'Medium', 'Interested in Security Audit.', '2026-06-03 02:57:22.602520', '2026-08-22 08:22:22.599290', 25, NULL, 7, 5),
(19, 'Tasty Bite Restaurants', 'Christopher', 'Martin', 'christopher.martin@tasty-bite-res.com', '+1 585-487-7437', 'https://www.tasty-bite-restauran.com', '98000.00', 'Low', 'Interested in Managed Services.', '2026-07-01 13:48:22.605593', '2026-08-22 08:22:22.603679', 48, NULL, 4, 3),
(20, 'Wise Owl BookstoresLLC', 'Barbara', 'Hall', 'barbara.hall@wise-owl-books.com', '+1 498-909-2133', 'https://www.wise-owl-bookstoresl.com', '214000.00', 'High', 'Interested in Security Audit.', '2026-07-17 12:03:22.608894', '2026-08-22 08:22:22.607673', 33, NULL, 4, 4),
(21, 'Swift Courier ExpressGroup', 'Jessica', 'Moore', 'jessica.moore@swift-courier.com', '+1 659-812-8851', 'https://www.swift-courier-expres.com', '154000.00', 'High', 'Interested in Training Program.', '2026-04-14 09:56:22.610515', '2026-08-22 08:22:22.609717', 31, 16, 7, 1),
(22, 'Zenith Insurance BrokersLtd', 'Joshua', 'Williams', 'joshua.williams@zenith-insuran.com', '+1 987-454-6816', 'https://www.zenith-insurance-bro.com', '47000.00', 'Urgent', 'Interested in CRM Platform.', '2026-03-30 11:39:22.612527', '2026-08-22 08:22:22.611191', 45, NULL, 2, 1),
(23, 'Secure Vault BankingLtd', 'Melissa', 'Clark', 'melissa.clark@secure-vault-b.com', '+1 300-464-4637', 'https://www.secure-vault-banking.com', '135000.00', 'Urgent', 'Interested in Training Program.', '2026-03-26 09:46:22.614772', '2026-08-22 08:22:22.613797', 31, NULL, 2, 1),
(24, 'Sunrise Bakery Chain', 'Joseph', 'Robinson', 'joseph.robinson@sunrise-bakery.com', '+1 225-694-2712', 'https://www.sunrise-bakery-chain.com', '80000.00', 'High', 'Interested in Network Setup.', '2026-07-23 09:13:22.621670', '2026-08-22 08:22:22.620599', 33, NULL, 3, 3),
(25, 'Horizon Broadband Networks', 'Daniel', 'Lee', 'daniel.lee@horizon-broadb.com', '+1 687-299-8178', 'https://www.horizon-broadband-ne.com', '189000.00', 'High', 'Interested in Annual Support Plan.', '2026-08-04 23:20:22.623609', '2026-08-22 08:22:22.622782', 17, NULL, 8, 3),
(26, 'BlueSky TechnologiesLtd', 'Stephanie', 'Davis', 'stephanie.davis@bluesky-techno.com', '+1 728-378-3623', 'https://www.bluesky-technologies.com', '89000.00', 'Urgent', 'Interested in Cloud Migration.', '2026-04-26 00:31:22.625973', '2026-08-22 08:22:22.624394', 10, 4, 3, 2),
(27, 'Crescent Moon MediaGroup', 'Betty', 'Adams', 'betty.adams@crescent-moon.com', '+1 955-828-4232', 'https://www.crescent-moon-mediag.com', '120000.00', 'Urgent', 'Interested in Cloud Migration.', '2026-05-15 07:37:22.627629', '2026-08-22 08:22:22.626856', 31, NULL, 7, 1),
(28, 'Coastal Breeze HotelsLLC', 'Susan', 'Wilson', 'susan.wilson@coastal-breeze.com', '+1 391-574-6340', 'https://www.coastal-breeze-hotel.com', '55000.00', 'High', 'Interested in Network Setup.', '2026-06-15 10:27:22.629676', '2026-08-22 08:22:22.629069', 48, NULL, 2, 5),
(29, 'Cloud Nine Air ServicesLtd', 'Emily', 'Wright', 'emily.wright@cloud-nine-air.com', '+1 601-801-2871', 'https://www.cloud-nine-air-servi.com', '94000.00', 'Medium', 'Interested in Security Audit.', '2026-03-17 02:30:22.631231', '2026-08-22 08:22:22.630423', 50, NULL, 7, 5),
(30, 'Stellar Dynamics CorpLLC', 'Deborah', 'Campbell', 'deborah.campbell@stellar-dynami.com', '+1 444-512-2916', 'https://www.stellar-dynamics-cor.com', '51000.00', 'Medium', 'Interested in Consulting Package.', '2026-04-13 19:56:22.633823', '2026-08-22 08:22:22.632376', 12, NULL, 6, 1),
(31, 'Elite Auto Dealership', 'Brian', 'Rodriguez', 'brian.rodriguez@elite-auto-dea.com', '+1 850-750-3838', 'https://www.elite-auto-dealershi.com', '147000.00', 'Medium', 'Interested in Security Audit.', '2026-06-10 04:11:22.642463', '2026-08-22 08:22:22.641596', 31, NULL, 3, 4),
(32, 'NextGen Robotics LabsLLC', 'Christopher', 'Robinson', 'christopher.robinson@nextgen-roboti.com', '+1 339-399-7290', 'https://www.nextgen-robotics-lab.com', '148000.00', 'Urgent', 'Interested in Security Audit.', '2026-05-09 10:51:22.644931', '2026-08-22 08:22:22.643254', 26, NULL, 1, 4),
(33, 'Phoenix Rising Fitness', 'Anthony', 'Campbell', 'anthony.campbell@phoenix-rising.com', '+1 231-979-4613', 'https://www.phoenix-rising-fitne.com', '79000.00', 'Low', 'Interested in Software License.', '2026-06-25 15:04:22.647082', '2026-08-22 08:22:22.646055', 14, 20, 2, 5),
(34, 'Ocean Blue Seafood Market', 'William', 'Gomez', 'william.gomez@ocean-blue-sea.com', '+1 316-474-9898', 'https://www.ocean-blue-seafood-m.com', '215000.00', 'Medium', 'Interested in Training Program.', '2026-08-11 08:54:22.648986', '2026-08-22 08:22:22.648244', 47, NULL, 2, 5),
(35, 'Diamond Edge JewelersLLC', 'Joshua', 'Wilson', 'joshua.wilson@diamond-edge-j.com', '+1 660-469-6711', 'https://www.diamond-edge-jeweler.com', '225000.00', 'Low', 'Interested in Security Audit.', '2026-07-23 01:09:22.650875', '2026-08-22 08:22:22.650074', 19, 47, 5, 1),
(36, 'Elegant Interiors StudioLtd', 'Rebecca', 'Hill', 'rebecca.hill@elegant-interi.com', '+1 342-411-4390', 'https://www.elegant-interiors-st.com', '211000.00', 'Low', 'Interested in Managed Services.', '2026-05-24 15:05:22.654133', '2026-08-22 08:22:22.652826', 31, NULL, 3, 5),
(37, 'Redwood AnalyticsLtd', 'Brian', 'Scott', 'brian.scott@redwood-analyt.com', '+1 473-726-2560', 'https://www.redwood-analyticsltd.com', '39000.00', 'High', 'Interested in CRM Platform.', '2026-06-12 12:14:22.657094', '2026-08-22 08:22:22.655477', 22, NULL, 5, 5),
(38, 'Mountain High OutfittersGroup', 'Ronald', 'Rodriguez', 'ronald.rodriguez@mountain-high.com', '+1 701-345-5402', 'https://www.mountain-high-outfit.com', '165000.00', 'High', 'Interested in Cloud Migration.', '2026-04-29 05:42:22.659242', '2026-08-22 08:22:22.658297', 24, 16, 4, 4),
(39, 'Whispering Pines ResortsLtd', 'Laura', 'Garcia', 'laura.garcia@whispering-pin.com', '+1 535-795-1040', 'https://www.whispering-pines-res.com', '227000.00', 'Low', 'Interested in Security Audit.', '2026-03-12 10:38:22.660839', '2026-08-22 08:22:22.660149', 27, NULL, 8, 4),
(40, 'Zenith Insurance Brokers', 'Daniel', 'Jones', 'daniel.jones@zenith-insuran.com', '+1 706-474-6289', 'https://www.zenith-insurance-bro.com', '217000.00', 'Medium', 'Interested in Annual Support Plan.', '2026-04-03 14:14:22.662236', '2026-08-22 08:22:22.661569', 17, NULL, 7, 2),
(41, 'Zenith Insurance BrokersLtd', 'Kevin', 'Allen', 'kevin.allen@zenith-insuran.com', '+1 841-670-1266', 'https://www.zenith-insurance-bro.com', '36000.00', 'Medium', 'Interested in Security Audit.', '2026-04-28 07:55:22.663771', '2026-08-22 08:22:22.663159', 7, 6, 1, 1),
(42, 'Ironclad SecurityLtd', 'Richard', 'Rivera', 'richard.rivera@ironclad-secur.com', '+1 870-569-5102', 'https://www.ironclad-securityltd.com', '26000.00', 'Medium', 'Interested in Consulting Package.', '2026-08-08 19:42:22.664958', '2026-08-22 08:22:22.664463', 14, 28, 5, 1),
(43, 'Elegant Interiors StudioGroup', 'Karen', 'Mitchell', 'karen.mitchell@elegant-interi.com', '+1 201-418-8812', 'https://www.elegant-interiors-st.com', '24000.00', 'Medium', 'Interested in Managed Services.', '2026-06-25 15:39:22.665995', '2026-08-22 08:22:22.665570', 31, NULL, 2, 1),
(44, 'Apex Global SolutionsLtd', 'Mark', 'Smith', 'mark.smith@apex-global-so.com', '+1 689-272-4751', 'https://www.apex-global-solution.com', '103000.00', 'Low', 'Interested in Network Setup.', '2026-07-26 21:59:22.666959', '2026-08-22 08:22:22.666542', 11, NULL, 7, 2),
(45, 'Thunderbolt Gaming StudiosGroup', 'Karen', 'Rodriguez', 'karen.rodriguez@thunderbolt-ga.com', '+1 776-208-3688', 'https://www.thunderbolt-gaming-s.com', '117000.00', 'Medium', 'Interested in Hardware Bundle.', '2026-03-14 09:13:22.667859', '2026-08-22 08:22:22.667483', 13, NULL, 2, 5),
(46, 'Reliable Plumbing Pros', 'Anthony', 'Green', 'anthony.green@reliable-plumb.com', '+1 343-970-3017', 'https://www.reliable-plumbing-pr.com', '155000.00', 'High', 'Interested in Annual Support Plan.', '2026-05-04 21:32:22.671113', '2026-08-22 08:22:22.668633', 17, NULL, 2, 1),
(47, 'Coastal Breeze HotelsLLC', 'David', 'Taylor', 'david.taylor@coastal-breeze.com', '+1 874-508-4366', 'https://www.coastal-breeze-hotel.com', '137000.00', 'Urgent', 'Interested in Training Program.', '2026-07-04 08:57:22.672062', '2026-08-22 08:22:22.671659', 19, NULL, 5, 1),
(48, 'NovaStar EnterprisesGroup', 'Charles', 'Nelson', 'charles.nelson@novastar-enter.com', '+1 446-711-2163', 'https://www.novastar-enterprises.com', '140000.00', 'Low', 'Interested in Annual Support Plan.', '2026-06-02 03:58:22.673513', '2026-08-22 08:22:22.672733', 35, NULL, 7, 1),
(50, 'Mighty Movers Relocation', 'Charles', 'Adams', 'charles.adams@mighty-movers.com', '+1 855-749-9808', 'https://www.mighty-movers-reloca.com', '162000.00', 'Medium', 'Interested in Software License.', '2026-07-31 23:17:22.677152', '2026-08-22 08:22:22.676465', 31, NULL, 7, 1),
(51, 'Apex Solutions', 'Clydey', 'Ednalan', 'clydey@@apex-global-so.com', '@apex-global-so.com', 'https://www.apex-global-solution.com', '103000.00', 'Medium', 'Interested in Network Setup.', '2026-08-26 11:20:43.765093', '2026-08-26 11:21:26.367120', 3, 55, 7, 2);

-- --------------------------------------------------------

--
-- Table structure for table `lead_activities`
--

CREATE TABLE `lead_activities` (
  `id` bigint(20) NOT NULL,
  `activity` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `lead_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lead_activities`
--

INSERT INTO `lead_activities` (`id`, `activity`, `description`, `created_at`, `lead_id`, `user_id`) VALUES
(1, 'Created', 'Waiting for internal approval.', '2026-08-22 08:22:22.685340', 30, 40),
(2, 'Call Made', 'Initial outreach completed.', '2026-08-22 08:22:22.685355', 48, 12),
(3, 'Note Added', 'Requested demo next week.', '2026-08-22 08:22:22.685362', 1, 11),
(4, 'Email Sent', 'Requested demo next week.', '2026-08-22 08:22:22.685367', 47, 17),
(5, 'Call Made', 'Initial outreach completed.', '2026-08-22 08:22:22.685372', 18, 47),
(6, 'Quote Sent', 'Discussed pricing and timeline.', '2026-08-22 08:22:22.685376', 34, 5),
(7, 'Note Added', 'Sent product brochure and case study.', '2026-08-22 08:22:22.685381', 24, 4),
(8, 'Call Made', 'Decision maker identified.', '2026-08-22 08:22:22.685386', 50, 7),
(9, 'Meeting Scheduled', 'Initial outreach completed.', '2026-08-22 08:22:22.685391', 3, 1),
(10, 'Created', 'Budget confirmed for this quarter.', '2026-08-22 08:22:22.685395', 10, 12),
(11, 'Follow Up', 'Waiting for internal approval.', '2026-08-22 08:22:22.685400', 27, 47),
(12, 'Created', 'Sent product brochure and case study.', '2026-08-22 08:22:22.685404', 24, 8),
(13, 'Note Added', 'Waiting for internal approval.', '2026-08-22 08:22:22.685409', 26, 5),
(14, 'Note Added', 'Initial outreach completed.', '2026-08-22 08:22:22.685414', 6, 36),
(15, 'Meeting Scheduled', 'Competitor comparison requested.', '2026-08-22 08:22:22.685418', 37, 20),
(16, 'Meeting Scheduled', 'Decision maker identified.', '2026-08-22 08:22:22.685423', 50, 50),
(17, 'Meeting Scheduled', 'Requested demo next week.', '2026-08-22 08:22:22.685428', 27, 2),
(18, 'Created', 'Budget confirmed for this quarter.', '2026-08-22 08:22:22.685432', 1, 22),
(19, 'Meeting Scheduled', 'Decision maker identified.', '2026-08-22 08:22:22.685450', 20, 7),
(20, 'Quote Sent', 'Discussed pricing and timeline.', '2026-08-22 08:22:22.685461', 10, 46),
(21, 'Follow Up', 'Competitor comparison requested.', '2026-08-22 08:22:22.685466', 34, 27),
(22, 'Email Sent', 'Budget confirmed for this quarter.', '2026-08-22 08:22:22.685471', 7, 33),
(23, 'Email Sent', 'Decision maker identified.', '2026-08-22 08:22:22.685476', 4, 28),
(24, 'Follow Up', 'Requested demo next week.', '2026-08-22 08:22:22.685480', 21, 26),
(25, 'Email Sent', 'Discussed pricing and timeline.', '2026-08-22 08:22:22.685485', 5, 13),
(26, 'Follow Up', 'Budget confirmed for this quarter.', '2026-08-22 08:22:22.685489', 29, 30),
(27, 'Note Added', 'Waiting for internal approval.', '2026-08-22 08:22:22.685494', 50, 14),
(28, 'Email Sent', 'Waiting for internal approval.', '2026-08-22 08:22:22.685498', 8, 6),
(29, 'Meeting Scheduled', 'Requested demo next week.', '2026-08-22 08:22:22.685503', 39, 3),
(30, 'Status Changed', 'Initial outreach completed.', '2026-08-22 08:22:22.685507', 16, 23),
(31, 'Status Changed', 'Competitor comparison requested.', '2026-08-22 08:22:22.685512', 12, 2),
(32, 'Note Added', 'Discussed pricing and timeline.', '2026-08-22 08:22:22.685516', 16, 7),
(33, 'Meeting Scheduled', 'Sent product brochure and case study.', '2026-08-22 08:22:22.685520', 1, 4),
(34, 'Call Made', 'Waiting for internal approval.', '2026-08-22 08:22:22.685537', 44, 41),
(35, 'Note Added', 'Sent product brochure and case study.', '2026-08-22 08:22:22.685543', 5, 13),
(36, 'Created', 'Sent product brochure and case study.', '2026-08-22 08:22:22.685547', 3, 30),
(37, 'Note Added', 'Initial outreach completed.', '2026-08-22 08:22:22.685552', 47, 26),
(38, 'Meeting Scheduled', 'Sent product brochure and case study.', '2026-08-22 08:22:22.685556', 12, 23),
(39, 'Meeting Scheduled', 'Waiting for internal approval.', '2026-08-22 08:22:22.685561', 10, 3),
(40, 'Created', 'Discussed pricing and timeline.', '2026-08-22 08:22:22.685565', 36, 31),
(41, 'Meeting Scheduled', 'Initial outreach completed.', '2026-08-22 08:22:22.685570', 27, 13),
(42, 'Note Added', 'Requested demo next week.', '2026-08-22 08:22:22.685575', 31, 35),
(43, 'Quote Sent', 'Sent product brochure and case study.', '2026-08-22 08:22:22.685579', 21, 25),
(44, 'Quote Sent', 'Initial outreach completed.', '2026-08-22 08:22:22.685584', 15, 2),
(45, 'Meeting Scheduled', 'Sent product brochure and case study.', '2026-08-22 08:22:22.685588', 23, 50),
(46, 'Created', 'Decision maker identified.', '2026-08-22 08:22:22.685593', 16, 18),
(47, 'Meeting Scheduled', 'Requested demo next week.', '2026-08-22 08:22:22.685681', 12, 12),
(48, 'Created', 'Requested demo next week.', '2026-08-22 08:22:22.685747', 23, 38),
(49, 'Note Added', 'Waiting for internal approval.', '2026-08-22 08:22:22.685754', 37, 13),
(50, 'Meeting Scheduled', 'Decision maker identified.', '2026-08-22 08:22:22.685759', 6, 4),
(51, 'Created', 'Lead created by Alvin Duran', '2026-08-26 11:20:43.770404', 51, 1),
(52, 'Updated', 'Lead updated by Alvin Duran', '2026-08-26 11:21:26.370829', 51, 1),
(53, 'Converted', 'Lead converted to customer CUS-00055', '2026-08-26 11:21:40.599940', 51, 1);

-- --------------------------------------------------------

--
-- Table structure for table `lead_sources`
--

CREATE TABLE `lead_sources` (
  `id` bigint(20) NOT NULL,
  `name` varchar(80) NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lead_sources`
--

INSERT INTO `lead_sources` (`id`, `name`, `created_at`) VALUES
(1, 'Website', '2026-08-22 08:22:22.132463'),
(2, 'Referral', '2026-08-22 08:22:22.133839'),
(3, 'Cold Call', '2026-08-22 08:22:22.134327'),
(4, 'Social Media', '2026-08-22 08:22:22.134826'),
(5, 'Email Campaign', '2026-08-22 08:22:22.135261'),
(6, 'Trade Show', '2026-08-22 08:22:22.137188'),
(7, 'Partner', '2026-08-22 08:22:22.137823'),
(8, 'Advertisement', '2026-08-22 08:22:22.138449');

-- --------------------------------------------------------

--
-- Table structure for table `lead_statuses`
--

CREATE TABLE `lead_statuses` (
  `id` bigint(20) NOT NULL,
  `name` varchar(80) NOT NULL,
  `color` varchar(20) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lead_statuses`
--

INSERT INTO `lead_statuses` (`id`, `name`, `color`, `sort_order`) VALUES
(1, 'New', '#0dcaf0', 1),
(2, 'Contacted', '#6f42c1', 2),
(3, 'Qualified', '#198754', 3),
(4, 'Working', '#fd7e14', 4),
(5, 'Unqualified', '#d62e3f', 5);

-- --------------------------------------------------------

--
-- Table structure for table `login_logs`
--

CREATE TABLE `login_logs` (
  `id` bigint(20) NOT NULL,
  `login_time` datetime(6) NOT NULL,
  `logout_time` datetime(6) DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL,
  `browser` varchar(100) NOT NULL,
  `operating_system` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login_logs`
--

INSERT INTO `login_logs` (`id`, `login_time`, `logout_time`, `ip_address`, `browser`, `operating_system`, `user_id`) VALUES
(2, '2026-08-22 08:22:23.354063', '2026-07-06 20:21:23.351394', '112.198.77.193', 'Safari 17.4', 'iOS 17', 13),
(3, '2026-08-22 08:22:23.354068', '2026-07-13 07:31:23.351421', '112.198.211.70', 'Safari 17.4', 'macOS Sonoma', 27),
(4, '2026-08-22 08:22:23.354072', '2026-05-26 16:39:23.351442', '112.198.122.31', 'Firefox 127', 'macOS Sonoma', 17),
(5, '2026-08-22 08:22:23.354076', '2026-07-22 03:06:23.351464', '112.198.223.110', 'Chrome 126', 'macOS Sonoma', 2),
(6, '2026-08-22 08:22:23.354080', '2026-07-19 06:38:23.351484', '112.198.142.170', 'Firefox 127', 'Windows 11', 11),
(7, '2026-08-22 08:22:23.354085', '2026-06-21 15:44:23.351505', '112.198.42.82', 'Safari 17.4', 'Windows 11', 47),
(8, '2026-08-22 08:22:23.354089', '2026-07-06 18:18:23.351526', '112.198.46.103', 'Firefox 127', 'macOS Sonoma', 27),
(9, '2026-08-22 08:22:23.354093', '2026-06-09 09:56:23.351546', '112.198.128.129', 'Chrome 126', 'macOS Sonoma', 8),
(10, '2026-08-22 08:22:23.354097', '2026-08-07 05:12:23.351566', '112.198.199.208', 'Firefox 127', 'iOS 17', 39),
(11, '2026-08-22 08:22:23.354102', '2026-08-04 07:05:23.351587', '112.198.140.114', 'Edge 126', 'Ubuntu 24.04', 14),
(12, '2026-08-22 08:22:23.354106', '2026-08-14 20:04:23.351607', '112.198.57.83', 'Edge 126', 'iOS 17', 38),
(13, '2026-08-22 08:22:23.354110', '2026-07-22 06:12:23.351628', '112.198.74.94', 'Edge 126', 'Ubuntu 24.04', 44),
(14, '2026-08-22 08:22:23.354114', '2026-08-19 16:40:23.351648', '112.198.17.217', 'Chrome 126', 'macOS Sonoma', 20),
(15, '2026-08-22 08:22:23.354119', '2026-06-13 01:35:23.351668', '112.198.185.233', 'Chrome 126', 'Android 14', 17),
(16, '2026-08-22 08:22:23.354123', '2026-06-27 04:12:23.351688', '112.198.201.239', 'Safari 17.4', 'Ubuntu 24.04', 16),
(17, '2026-08-22 08:22:23.354127', '2026-07-23 06:34:23.351708', '112.198.82.236', 'Edge 126', 'Ubuntu 24.04', 6),
(18, '2026-08-22 08:22:23.354132', '2026-05-31 18:54:23.351728', '112.198.140.223', 'Chrome 126', 'iOS 17', 50),
(19, '2026-08-22 08:22:23.354136', '2026-07-01 01:18:23.351748', '112.198.51.213', 'Firefox 127', 'Ubuntu 24.04', 31),
(20, '2026-08-22 08:22:23.354140', '2026-08-14 02:09:23.351769', '112.198.167.118', 'Chrome 126', 'Windows 11', 33),
(21, '2026-08-22 08:22:23.354145', '2026-06-01 06:34:23.351788', '112.198.69.2', 'Edge 126', 'macOS Sonoma', 42),
(22, '2026-08-22 08:22:23.354149', '2026-07-13 22:33:23.351808', '112.198.56.42', 'Firefox 127', 'Android 14', 41),
(23, '2026-08-22 08:22:23.354153', '2026-05-31 08:37:23.351827', '112.198.210.204', 'Safari 17.4', 'iOS 17', 46),
(24, '2026-08-22 08:22:23.354157', '2026-08-05 06:07:23.351848', '112.198.167.206', 'Safari 17.4', 'macOS Sonoma', 31),
(25, '2026-08-22 08:22:23.354162', '2026-06-30 00:37:23.351867', '112.198.193.243', 'Firefox 127', 'Windows 11', 6),
(26, '2026-08-22 08:22:23.354166', '2026-06-11 17:08:23.351887', '112.198.117.234', 'Chrome 126', 'iOS 17', 2),
(27, '2026-08-22 08:22:23.354170', '2026-07-19 10:59:23.351907', '112.198.25.104', 'Edge 126', 'Android 14', 13),
(28, '2026-08-22 08:22:23.354175', '2026-08-03 07:31:23.351927', '112.198.60.5', 'Edge 126', 'iOS 17', 17),
(29, '2026-08-22 08:22:23.354179', '2026-06-20 11:18:23.351947', '112.198.104.50', 'Safari 17.4', 'Ubuntu 24.04', 44),
(30, '2026-08-22 08:22:23.354183', '2026-06-19 23:59:23.351966', '112.198.105.155', 'Firefox 127', 'Ubuntu 24.04', 48),
(31, '2026-08-22 08:22:23.354188', '2026-05-28 03:33:23.351986', '112.198.209.204', 'Firefox 127', 'Windows 11', 47),
(32, '2026-08-22 08:22:23.354192', '2026-07-20 04:38:23.352005', '112.198.127.96', 'Edge 126', 'Windows 11', 19),
(33, '2026-08-22 08:22:23.354196', '2026-06-23 06:17:23.352025', '112.198.203.177', 'Firefox 127', 'iOS 17', 1),
(34, '2026-08-22 08:22:23.354201', '2026-06-28 11:00:23.352045', '112.198.37.26', 'Chrome 126', 'Windows 11', 46),
(35, '2026-08-22 08:22:23.354205', '2026-07-22 19:30:23.352064', '112.198.23.3', 'Safari 17.4', 'Android 14', 22),
(36, '2026-08-22 08:22:23.354210', '2026-07-05 04:45:23.352084', '112.198.189.35', 'Chrome 126', 'Android 14', 40),
(37, '2026-08-22 08:22:23.354215', '2026-07-20 07:07:23.352105', '112.198.173.226', 'Edge 126', 'macOS Sonoma', 12),
(38, '2026-08-22 08:22:23.354219', '2026-07-12 13:35:23.352124', '112.198.72.68', 'Chrome 126', 'Ubuntu 24.04', 6),
(39, '2026-08-22 08:22:23.354223', '2026-08-05 23:39:23.352144', '112.198.143.193', 'Safari 17.4', 'iOS 17', 3),
(40, '2026-08-22 08:22:23.354228', '2026-07-19 19:03:23.352164', '112.198.135.134', 'Safari 17.4', 'iOS 17', 19),
(41, '2026-08-22 08:22:23.354232', '2026-07-12 15:27:23.352184', '112.198.77.144', 'Edge 126', 'Windows 11', 11),
(42, '2026-08-22 08:22:23.354237', '2026-08-03 08:46:23.352208', '112.198.18.122', 'Safari 17.4', 'macOS Sonoma', 13),
(43, '2026-08-22 08:22:23.354241', '2026-06-24 02:58:23.352229', '112.198.253.12', 'Edge 126', 'Ubuntu 24.04', 46),
(44, '2026-08-22 08:22:23.354246', '2026-06-11 21:10:23.352250', '112.198.57.218', 'Firefox 127', 'Windows 11', 46),
(45, '2026-08-22 08:22:23.354250', '2026-08-11 03:57:23.352271', '112.198.92.215', 'Firefox 127', 'Android 14', 23),
(46, '2026-08-22 08:22:23.354330', '2026-06-10 12:38:23.352292', '112.198.2.136', 'Firefox 127', 'iOS 17', 18),
(47, '2026-08-22 08:22:23.354340', '2026-07-21 17:32:23.352312', '112.198.168.8', 'Safari 17.4', 'Windows 11', 5),
(48, '2026-08-22 08:22:23.354345', '2026-07-05 14:22:23.352332', '112.198.165.41', 'Chrome 126', 'Windows 11', 26),
(49, '2026-08-22 08:22:23.354349', '2026-05-23 14:49:23.352352', '112.198.137.154', 'Chrome 126', 'Ubuntu 24.04', 30),
(50, '2026-08-22 08:22:23.354354', '2026-05-30 15:45:23.352372', '112.198.66.56', 'Chrome 126', 'Ubuntu 24.04', 3),
(51, '2026-08-22 08:22:23.354359', '2026-08-14 14:03:23.352392', '112.198.195.25', 'Edge 126', 'Ubuntu 24.04', 21),
(52, '2026-08-22 08:22:23.354363', '2026-07-22 20:32:23.352412', '112.198.106.43', 'Edge 126', 'iOS 17', 12),
(53, '2026-08-22 08:22:23.354368', '2026-05-31 13:19:23.352432', '112.198.152.127', 'Edge 126', 'Ubuntu 24.04', 19),
(54, '2026-08-22 08:22:23.354373', '2026-06-06 09:45:23.352453', '112.198.49.215', 'Safari 17.4', 'Android 14', 44),
(55, '2026-08-22 08:22:23.354377', '2026-06-20 20:49:23.352473', '112.198.243.70', 'Edge 126', 'Windows 11', 13),
(56, '2026-08-22 08:22:23.354382', '2026-06-28 22:23:23.352493', '112.198.222.163', 'Edge 126', 'Windows 11', 49),
(57, '2026-08-22 08:22:23.354387', '2026-06-18 03:44:23.352513', '112.198.114.167', 'Firefox 127', 'iOS 17', 3),
(58, '2026-08-22 08:22:23.354391', '2026-06-02 12:36:23.352533', '112.198.148.121', 'Edge 126', 'Windows 11', 34),
(59, '2026-08-22 08:22:23.354482', '2026-07-15 10:09:23.352554', '112.198.153.217', 'Firefox 127', 'Android 14', 31),
(60, '2026-08-22 08:22:23.354488', '2026-07-15 19:06:23.352573', '112.198.39.236', 'Chrome 126', 'Android 14', 28),
(61, '2026-08-22 08:22:23.354493', '2026-06-17 19:49:23.352592', '112.198.237.171', 'Safari 17.4', 'Ubuntu 24.04', 7),
(62, '2026-08-22 08:22:23.354498', '2026-06-09 09:55:23.352612', '112.198.8.31', 'Edge 126', 'macOS Sonoma', 17),
(63, '2026-08-22 08:22:23.354503', '2026-07-03 10:55:23.352634', '112.198.152.82', 'Edge 126', 'iOS 17', 12),
(64, '2026-08-22 08:22:23.354507', '2026-07-20 04:55:23.352654', '112.198.95.56', 'Firefox 127', 'Windows 11', 40),
(65, '2026-08-22 08:22:23.354512', '2026-06-06 05:16:23.352673', '112.198.54.113', 'Chrome 126', 'Windows 11', 48),
(66, '2026-08-22 08:22:23.354517', '2026-08-08 13:52:23.352693', '112.198.244.119', 'Edge 126', 'Android 14', 26),
(67, '2026-08-22 08:22:23.354522', '2026-06-21 05:44:23.352713', '112.198.184.178', 'Edge 126', 'Ubuntu 24.04', 47),
(68, '2026-08-22 08:22:23.354526', '2026-08-06 06:04:23.352733', '112.198.57.210', 'Chrome 126', 'macOS Sonoma', 6),
(69, '2026-08-22 08:22:23.354531', '2026-07-26 18:00:23.352752', '112.198.123.113', 'Firefox 127', 'Windows 11', 2),
(70, '2026-08-22 08:22:23.354536', '2026-06-24 07:33:23.352772', '112.198.11.31', 'Firefox 127', 'macOS Sonoma', 20),
(71, '2026-08-22 08:22:23.354540', '2026-05-24 21:57:23.352791', '112.198.10.222', 'Edge 126', 'Android 14', 48),
(72, '2026-08-22 08:22:23.354545', '2026-07-28 05:55:23.352809', '112.198.200.15', 'Safari 17.4', 'Windows 11', 16),
(73, '2026-08-22 08:22:23.354550', '2026-06-02 13:32:23.352829', '112.198.253.190', 'Safari 17.4', 'Windows 11', 7),
(74, '2026-08-22 08:22:23.354554', '2026-07-01 21:57:23.352848', '112.198.249.61', 'Chrome 126', 'Android 14', 32),
(75, '2026-08-22 08:22:23.354559', '2026-06-28 18:50:23.352868', '112.198.32.70', 'Edge 126', 'iOS 17', 2),
(76, '2026-08-22 08:22:23.354564', '2026-06-19 15:43:23.352889', '112.198.229.180', 'Edge 126', 'Windows 11', 8),
(77, '2026-08-22 08:22:23.354568', '2026-07-16 13:15:23.352908', '112.198.176.114', 'Firefox 127', 'Android 14', 11),
(78, '2026-08-22 08:22:23.354573', '2026-06-07 18:57:23.352928', '112.198.239.35', 'Safari 17.4', 'iOS 17', 15),
(79, '2026-08-22 08:22:23.354578', '2026-05-27 14:44:23.352948', '112.198.241.206', 'Firefox 127', 'Android 14', 27),
(80, '2026-08-22 08:22:23.354583', '2026-07-16 10:24:23.352968', '112.198.247.35', 'Firefox 127', 'macOS Sonoma', 14),
(81, '2026-08-22 08:22:23.354587', '2026-06-06 00:07:23.352988', '112.198.212.243', 'Edge 126', 'Ubuntu 24.04', 11),
(82, '2026-08-22 08:22:23.354592', '2026-07-26 15:33:23.353008', '112.198.183.227', 'Safari 17.4', 'Ubuntu 24.04', 16),
(83, '2026-08-22 08:22:23.354596', '2026-08-02 09:55:23.353027', '112.198.16.208', 'Chrome 126', 'Ubuntu 24.04', 44),
(84, '2026-08-22 08:22:23.354601', '2026-08-07 14:14:23.353047', '112.198.114.126', 'Safari 17.4', 'Ubuntu 24.04', 28),
(85, '2026-08-22 08:22:23.354605', '2026-08-16 22:48:23.353066', '112.198.77.220', 'Chrome 126', 'Windows 11', 23),
(86, '2026-08-22 08:22:23.354610', '2026-06-25 12:01:23.353087', '112.198.52.212', 'Chrome 126', 'Android 14', 29),
(87, '2026-08-22 08:22:23.354615', '2026-07-31 19:45:23.353107', '112.198.105.235', 'Safari 17.4', 'macOS Sonoma', 7),
(88, '2026-08-22 08:22:23.354619', '2026-07-15 16:29:23.353127', '112.198.255.189', 'Chrome 126', 'macOS Sonoma', 47),
(89, '2026-08-22 08:22:23.354624', '2026-07-06 22:45:23.353146', '112.198.62.219', 'Firefox 127', 'iOS 17', 42),
(90, '2026-08-22 08:22:23.354628', '2026-08-22 07:28:23.353165', '112.198.242.89', 'Safari 17.4', 'Android 14', 27),
(91, '2026-08-22 08:22:23.354633', '2026-08-12 06:10:23.353184', '112.198.212.94', 'Firefox 127', 'macOS Sonoma', 11),
(92, '2026-08-22 08:22:23.354637', '2026-06-15 20:33:23.353204', '112.198.70.207', 'Edge 126', 'iOS 17', 49),
(93, '2026-08-22 08:22:23.354641', '2026-06-24 21:26:23.353223', '112.198.185.243', 'Chrome 126', 'iOS 17', 27),
(94, '2026-08-22 08:22:23.354646', '2026-08-20 14:00:23.353243', '112.198.35.23', 'Safari 17.4', 'Ubuntu 24.04', 10),
(95, '2026-08-22 08:22:23.354650', '2026-07-31 22:45:23.353263', '112.198.18.171', 'Firefox 127', 'Android 14', 26),
(96, '2026-08-22 08:22:23.354655', '2026-06-02 15:14:23.353282', '112.198.151.109', 'Edge 126', 'Android 14', 4),
(97, '2026-08-22 08:22:23.354659', '2026-07-13 04:30:23.353303', '112.198.143.232', 'Firefox 127', 'iOS 17', 20),
(98, '2026-08-22 08:22:23.354664', '2026-06-01 06:09:23.353322', '112.198.226.180', 'Safari 17.4', 'iOS 17', 29),
(99, '2026-08-22 08:22:23.354668', '2026-07-27 23:40:23.353341', '112.198.171.101', 'Firefox 127', 'Android 14', 50),
(100, '2026-08-22 08:22:23.354672', '2026-07-17 06:43:23.353361', '112.198.159.135', 'Safari 17.4', 'macOS Sonoma', 35),
(101, '2026-08-22 09:20:48.612447', NULL, '127.0.0.1', 'Unknown', 'Unknown', 1),
(102, '2026-08-22 10:17:39.917091', '2026-08-22 10:17:51.475998', '127.0.0.1', 'Chrome', 'Mac OS', 1),
(103, '2026-08-22 10:18:12.820463', NULL, '127.0.0.1', 'Chrome', 'Mac OS', 1),
(104, '2026-08-23 19:52:12.048790', NULL, '127.0.0.1', 'Edge', 'Mac OS', 1),
(105, '2026-08-23 19:57:23.047750', NULL, '127.0.0.1', 'Unknown', 'Unknown', 1),
(106, '2026-08-23 19:57:51.123460', NULL, '127.0.0.1', 'Unknown', 'Unknown', 1),
(108, '2026-08-23 19:58:58.838421', NULL, '127.0.0.1', 'Unknown', 'Unknown', 1),
(109, '2026-08-25 08:15:36.749593', NULL, '127.0.0.1', 'Unknown', 'Unknown', 1),
(110, '2026-08-25 08:15:55.027484', NULL, '127.0.0.1', 'Unknown', 'Unknown', 1),
(111, '2026-08-25 08:16:52.003344', '2026-08-25 08:17:38.910856', '127.0.0.1', 'Unknown', 'Unknown', 1),
(112, '2026-08-25 08:21:27.125473', '2026-08-25 12:58:58.537631', '127.0.0.1', 'Unknown', 'Unknown', 1),
(113, '2026-08-26 11:07:18.139415', NULL, '127.0.0.1', 'Chrome', 'Mac OS', 1),
(114, '2026-08-26 11:18:21.085968', NULL, '127.0.0.1', 'Edge', 'Mac OS', 1),
(115, '2026-08-26 21:18:33.258522', NULL, '127.0.0.1', 'Chrome', 'Mac OS', 1),
(116, '2026-08-27 07:40:39.754841', '2026-08-27 10:42:52.760954', '127.0.0.1', 'Chrome', 'Mac OS', 1),
(117, '2026-08-27 10:43:25.453930', '2026-08-27 10:44:09.783788', '127.0.0.1', 'Chrome', 'Mac OS', 51),
(118, '2026-08-27 10:44:50.452106', '2026-08-27 10:45:11.252653', '127.0.0.1', 'Chrome', 'Mac OS', 2),
(119, '2026-08-27 10:45:24.331323', NULL, '127.0.0.1', 'Chrome', 'Mac OS', 1),
(120, '2026-08-27 10:46:15.791519', NULL, '127.0.0.1', 'Chrome', 'Mac OS', 1);

-- --------------------------------------------------------

--
-- Table structure for table `meetings`
--

CREATE TABLE `meetings` (
  `id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `location` varchar(150) NOT NULL,
  `meeting_date` date NOT NULL,
  `start_time` time(6) NOT NULL,
  `end_time` time(6) DEFAULT NULL,
  `description` longtext NOT NULL,
  `meeting_type` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `lead_id` bigint(20) DEFAULT NULL,
  `organizer_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `meetings`
--

INSERT INTO `meetings` (`id`, `title`, `location`, `meeting_date`, `start_time`, `end_time`, `description`, `meeting_type`, `status`, `created_at`, `updated_at`, `customer_id`, `lead_id`, `organizer_id`) VALUES
(1, 'Discovery Call', 'Phone', '2026-09-20', '10:00:00.000000', '11:00:00.000000', 'Discuss project scope and next steps.', 'Video', 'Completed', '2026-08-22 08:22:22.876251', '2026-08-22 08:22:22.876542', 2, NULL, 47),
(2, 'Training Session', 'Google Meet', '2026-08-23', '12:00:00.000000', '13:00:00.000000', 'Discuss project scope and next steps.', 'Video', 'Scheduled', '2026-08-22 08:22:22.876279', '2026-08-22 08:22:22.876548', 35, NULL, 3),
(3, 'Discovery Call', 'Google Meet', '2026-09-24', '13:00:00.000000', '14:00:00.000000', 'Discuss project scope and next steps.', 'In Person', 'Scheduled', '2026-08-22 08:22:22.876285', '2026-08-22 08:22:22.876553', 33, 24, 9),
(4, 'Quarterly Review', 'Head Office Boardroom', '2026-08-22', '11:00:00.000000', '12:00:00.000000', 'Discuss project scope and next steps.', 'Call', 'Scheduled', '2026-08-22 08:22:22.876291', '2026-08-22 08:22:22.876558', 37, NULL, 29),
(5, 'Contract Negotiation', 'Phone', '2026-08-23', '16:00:00.000000', '17:00:00.000000', 'Discuss project scope and next steps.', 'Video', 'Scheduled', '2026-08-22 08:22:22.876297', '2026-08-22 08:22:22.876563', 24, 43, 15),
(6, 'Kick-off Meeting', 'Client Office', '2026-09-20', '16:00:00.000000', '17:00:00.000000', 'Discuss project scope and next steps.', 'In Person', 'Completed', '2026-08-22 08:22:22.876303', '2026-08-22 08:22:22.876568', 42, NULL, 3),
(7, 'Product Demo', 'Phone', '2026-08-09', '15:00:00.000000', '16:00:00.000000', 'Discuss project scope and next steps.', 'Video', 'Cancelled', '2026-08-22 08:22:22.876311', '2026-08-22 08:22:22.876574', 38, NULL, 42),
(8, 'Training Session', 'Phone', '2026-07-08', '12:00:00.000000', '13:00:00.000000', 'Discuss project scope and next steps.', 'In Person', 'Completed', '2026-08-22 08:22:22.876317', '2026-08-22 08:22:22.876579', 23, NULL, 34),
(9, 'Contract Negotiation', 'Google Meet', '2026-07-31', '16:00:00.000000', '17:00:00.000000', 'Discuss project scope and next steps.', 'Call', 'Scheduled', '2026-08-22 08:22:22.876322', '2026-08-22 08:22:22.876584', 33, NULL, 11),
(10, 'Training Session', 'Head Office Boardroom', '2026-09-07', '10:00:00.000000', '11:00:00.000000', 'Discuss project scope and next steps.', 'Call', 'Completed', '2026-08-22 08:22:22.876328', '2026-08-22 08:22:22.876589', 22, NULL, 43),
(11, 'Quarterly Review', 'Google Meet', '2026-09-26', '15:00:00.000000', '16:00:00.000000', 'Discuss project scope and next steps.', 'In Person', 'Scheduled', '2026-08-22 08:22:22.876334', '2026-08-22 08:22:22.876594', 9, NULL, 2),
(12, 'Renewal Discussion', 'Phone', '2026-09-18', '11:00:00.000000', '12:00:00.000000', 'Discuss project scope and next steps.', 'In Person', 'Scheduled', '2026-08-22 08:22:22.876340', '2026-08-22 08:22:22.876599', 12, NULL, 4),
(13, 'Training Session', 'Google Meet', '2026-08-05', '13:00:00.000000', '14:00:00.000000', 'Discuss project scope and next steps.', 'Video', 'Completed', '2026-08-22 08:22:22.876346', '2026-08-22 08:22:22.876604', 39, NULL, 6),
(14, 'Support Review', 'Head Office Boardroom', '2026-09-22', '11:00:00.000000', '12:00:00.000000', 'Discuss project scope and next steps.', 'In Person', 'Scheduled', '2026-08-22 08:22:22.876352', '2026-08-22 08:22:22.876609', 17, 44, 40),
(15, 'Renewal Discussion', 'Google Meet', '2026-09-23', '15:00:00.000000', '16:00:00.000000', 'Discuss project scope and next steps.', 'Call', 'Scheduled', '2026-08-22 08:22:22.876358', '2026-08-22 08:22:22.876615', 2, 33, 25),
(16, 'Quarterly Review', 'Phone', '2026-09-15', '09:00:00.000000', '10:00:00.000000', 'Discuss project scope and next steps.', 'Call', 'Completed', '2026-08-22 08:22:22.876363', '2026-08-22 08:22:22.876620', 8, 43, 35),
(17, 'Renewal Discussion', 'Google Meet', '2026-09-07', '15:00:00.000000', '16:00:00.000000', 'Discuss project scope and next steps.', 'Video', 'Scheduled', '2026-08-22 08:22:22.876369', '2026-08-22 08:22:22.876625', 3, NULL, 34),
(18, 'Product Demo', 'Client Office', '2026-09-22', '10:00:00.000000', '11:00:00.000000', 'Discuss project scope and next steps.', 'In Person', 'Scheduled', '2026-08-22 08:22:22.876375', '2026-08-22 08:22:22.876630', 31, NULL, 28),
(19, 'Product Demo', 'Phone', '2026-07-08', '12:00:00.000000', '13:00:00.000000', 'Discuss project scope and next steps.', 'Video', 'Completed', '2026-08-22 08:22:22.876380', '2026-08-22 08:22:22.876635', 51, 34, 1),
(20, 'Kick-off Meeting', 'Client Office', '2026-09-14', '14:00:00.000000', '15:00:00.000000', 'Discuss project scope and next steps.', 'Video', 'Completed', '2026-08-22 08:22:22.876386', '2026-08-22 08:22:22.876641', 10, NULL, 27),
(21, 'Training Session', 'Google Meet', '2026-08-24', '13:00:00.000000', '14:00:00.000000', 'Discuss project scope and next steps.', 'In Person', 'Completed', '2026-08-22 08:22:22.876391', '2026-08-22 08:22:22.876646', 14, NULL, 44),
(22, 'Quarterly Review', 'Zoom', '2026-08-06', '13:00:00.000000', '14:00:00.000000', 'Discuss project scope and next steps.', 'Video', 'Completed', '2026-08-22 08:22:22.876397', '2026-08-22 08:22:22.876651', NULL, NULL, 20),
(23, 'Discovery Call', 'Google Meet', '2026-08-26', '11:00:00.000000', '12:00:00.000000', 'Discuss project scope and next steps.', 'In Person', 'Scheduled', '2026-08-22 08:22:22.876403', '2026-08-22 08:22:22.876656', 26, NULL, 7),
(24, 'Product Demo', 'Client Office', '2026-08-05', '10:00:00.000000', '11:00:00.000000', 'Discuss project scope and next steps.', 'Video', 'Scheduled', '2026-08-22 08:22:22.876408', '2026-08-22 08:22:22.876661', 39, NULL, 10),
(25, 'Kick-off Meeting', 'Phone', '2026-07-15', '09:00:00.000000', '10:00:00.000000', 'Discuss project scope and next steps.', 'Call', 'Completed', '2026-08-22 08:22:22.876414', '2026-08-22 08:22:22.876666', 26, NULL, 47),
(26, 'Kick-off Meeting', 'Google Meet', '2026-07-12', '16:00:00.000000', '17:00:00.000000', 'Discuss project scope and next steps.', 'In Person', 'Scheduled', '2026-08-22 08:22:22.876420', '2026-08-22 08:22:22.876672', 43, NULL, 1),
(27, 'Discovery Call', 'Google Meet', '2026-07-19', '12:00:00.000000', '13:00:00.000000', 'Discuss project scope and next steps.', 'Video', 'Completed', '2026-08-22 08:22:22.876425', '2026-08-22 08:22:22.876677', 3, NULL, 40),
(28, 'Product Demo', 'Zoom', '2026-09-16', '14:00:00.000000', '15:00:00.000000', 'Discuss project scope and next steps.', 'Video', 'Completed', '2026-08-22 08:22:22.876431', '2026-08-22 08:22:22.876682', 38, 1, 43),
(29, 'Contract Negotiation', 'Head Office Boardroom', '2026-08-28', '14:00:00.000000', '15:00:00.000000', 'Discuss project scope and next steps.', 'In Person', 'Scheduled', '2026-08-22 08:22:22.876436', '2026-08-22 08:22:22.876687', NULL, NULL, 23),
(30, 'Support Review', 'Zoom', '2026-09-11', '11:00:00.000000', '12:00:00.000000', 'Discuss project scope and next steps.', 'Call', 'Completed', '2026-08-22 08:22:22.876442', '2026-08-27 09:52:43.623507', 36, 19, 27),
(31, 'Contract Negotiation', 'Client Office', '2026-09-04', '13:00:00.000000', '14:00:00.000000', 'Discuss project scope and next steps.', 'In Person', 'Scheduled', '2026-08-22 08:22:22.876448', '2026-08-27 09:53:58.481746', 25, NULL, 45),
(32, 'Contract Negotiation', 'Google Meet', '2026-08-17', '09:00:00.000000', '10:00:00.000000', 'Discuss project scope and next steps.', 'Video', 'Cancelled', '2026-08-22 08:22:22.876453', '2026-08-22 08:22:22.876702', 5, NULL, 31),
(33, 'Renewal Discussion', 'Client Office', '2026-07-17', '09:00:00.000000', '10:00:00.000000', 'Discuss project scope and next steps.', 'In Person', 'Cancelled', '2026-08-22 08:22:22.876459', '2026-08-22 08:22:22.876707', 16, NULL, 45),
(34, 'Contract Negotiation', 'Head Office Boardroom', '2026-08-02', '16:00:00.000000', '17:00:00.000000', 'Discuss project scope and next steps.', 'Call', 'Completed', '2026-08-22 08:22:22.876465', '2026-08-22 08:22:22.876712', 37, NULL, 21),
(35, 'Support Review', 'Google Meet', '2026-07-21', '13:00:00.000000', '14:00:00.000000', 'Discuss project scope and next steps.', 'Call', 'Cancelled', '2026-08-22 08:22:22.876503', '2026-08-22 08:22:22.876717', 16, NULL, 14),
(36, 'Training Session', 'Client Office', '2026-09-25', '16:00:00.000000', '17:00:00.000000', 'Discuss project scope and next steps.', 'Video', 'Scheduled', '2026-08-22 08:22:22.876513', '2026-08-22 08:22:22.876722', 35, NULL, 40),
(37, 'Kick-off Meeting', 'Head Office Boardroom', '2026-08-05', '13:00:00.000000', '14:00:00.000000', 'Discuss project scope and next steps.', 'In Person', 'Scheduled', '2026-08-22 08:22:22.876518', '2026-08-22 08:22:22.876728', 49, NULL, 32),
(38, 'Renewal Discussion', 'Google Meet', '2026-09-04', '15:00:00.000000', '16:00:00.000000', 'Discuss project scope and next steps.', 'Call', 'Completed', '2026-08-22 08:22:22.876524', '2026-08-22 08:22:22.876733', NULL, 23, 31),
(39, 'Renewal Discussion', 'Phone', '2026-07-20', '16:00:00.000000', '17:00:00.000000', 'Discuss project scope and next steps.', 'Video', 'Scheduled', '2026-08-22 08:22:22.876529', '2026-08-22 08:22:22.876738', 1, NULL, 21),
(40, 'Support Review', 'Client Office', '2026-07-31', '13:00:00.000000', '14:00:00.000000', 'Discuss project scope and next steps.', 'Call', 'Scheduled', '2026-08-22 08:22:22.876534', '2026-08-24 11:23:32.622315', 16, 1, 12),
(41, 'Contract Negotiation', 'olongapo city', '2026-08-27', '09:53:00.000000', '21:53:00.000000', '', 'In Person', 'Scheduled', '2026-08-27 09:53:49.720932', '2026-08-27 09:53:49.720952', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `meeting_attendees`
--

CREATE TABLE `meeting_attendees` (
  `id` bigint(20) NOT NULL,
  `meeting_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `meeting_attendees`
--

INSERT INTO `meeting_attendees` (`id`, `meeting_id`, `user_id`) VALUES
(1, 1, 45),
(2, 1, 49),
(3, 2, 24),
(4, 2, 26),
(6, 3, 12),
(5, 3, 29),
(7, 4, 9),
(8, 4, 37),
(9, 4, 44),
(10, 5, 7),
(12, 6, 16),
(11, 6, 18),
(13, 6, 36),
(15, 7, 13),
(14, 7, 25),
(16, 8, 48),
(17, 9, 31),
(18, 10, 12),
(20, 11, 9),
(19, 11, 32),
(21, 12, 34),
(22, 12, 35),
(23, 12, 47),
(25, 13, 20),
(24, 13, 32),
(26, 14, 36),
(27, 14, 37),
(28, 15, 26),
(29, 16, 45),
(30, 17, 4),
(31, 18, 17),
(33, 19, 7),
(32, 19, 41),
(35, 20, 22),
(34, 20, 48),
(36, 21, 24),
(37, 21, 36),
(40, 22, 2),
(38, 22, 17),
(39, 22, 23),
(41, 23, 8),
(42, 23, 23),
(44, 24, 13),
(45, 24, 37),
(43, 24, 39),
(48, 25, 12),
(47, 25, 35),
(46, 25, 42),
(50, 26, 21),
(49, 26, 23),
(52, 27, 32),
(51, 27, 33),
(53, 27, 50),
(55, 28, 6),
(56, 28, 25),
(54, 28, 29),
(57, 29, 19),
(58, 29, 30),
(59, 29, 41),
(60, 30, 11),
(61, 31, 22),
(62, 31, 27),
(63, 31, 41),
(66, 32, 5),
(65, 32, 26),
(64, 32, 37),
(67, 33, 11),
(68, 34, 15),
(70, 35, 19),
(69, 35, 42),
(71, 36, 18),
(72, 36, 39),
(73, 36, 42),
(74, 37, 18),
(75, 37, 29),
(77, 38, 38),
(76, 38, 48),
(80, 39, 11),
(79, 39, 27),
(78, 39, 29),
(81, 40, 2),
(82, 41, 5),
(83, 41, 6),
(84, 41, 7);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` bigint(20) NOT NULL,
  `note` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `deal_id` bigint(20) DEFAULT NULL,
  `lead_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`id`, `note`, `created_at`, `customer_id`, `deal_id`, `lead_id`, `user_id`) VALUES
(1, 'Customer prefers afternoon calls.', '2026-07-18 04:01:23.418251', 12, NULL, NULL, 13),
(2, 'Customer prefers afternoon calls.', '2026-07-18 04:01:23.418251', 17, NULL, NULL, 7),
(3, 'Decision maker will be on leave next week.', '2026-07-18 04:01:23.418251', NULL, NULL, 9, 25),
(4, 'Very satisfied with onboarding experience so far.', '2026-07-18 04:01:23.418251', 14, NULL, NULL, 20),
(5, 'Asked for a revised proposal with volume discounts.', '2026-07-18 04:01:23.418251', 24, NULL, NULL, 43),
(6, 'Decision maker will be on leave next week.', '2026-07-18 04:01:23.418251', NULL, 40, NULL, 28),
(7, 'Budget approved for Q3 implementation.', '2026-07-18 04:01:23.418251', 9, NULL, NULL, 13),
(8, 'Renewal likely; consider multi-year offer.', '2026-07-18 04:01:23.418251', 45, NULL, NULL, 24),
(9, 'Customer prefers afternoon calls.', '2026-07-18 04:01:23.418251', 41, NULL, NULL, 16),
(10, 'Escalated billing concern resolved amicably.', '2026-07-18 04:01:23.418251', NULL, NULL, 38, 13),
(11, 'Budget approved for Q3 implementation.', '2026-07-18 04:01:23.418251', 10, NULL, NULL, 21),
(12, 'Asked for a revised proposal with volume discounts.', '2026-07-18 04:01:23.418251', 51, NULL, NULL, 18),
(13, 'Budget approved for Q3 implementation.', '2026-07-18 04:01:23.418251', NULL, NULL, 38, 32),
(14, 'Interested in add-on training packages.', '2026-07-18 04:01:23.418251', NULL, NULL, 31, 43),
(15, 'Escalated billing concern resolved amicably.', '2026-07-18 04:01:23.418251', 33, NULL, NULL, 25),
(16, 'Asked for a revised proposal with volume discounts.', '2026-07-18 04:01:23.418251', 34, NULL, NULL, 30),
(17, 'Very satisfied with onboarding experience so far.', '2026-07-18 04:01:23.418251', 24, NULL, NULL, 34),
(18, 'Competitor evaluation in progress - emphasize support SLAs.', '2026-07-18 04:01:23.418251', NULL, NULL, 32, 31),
(19, 'Customer prefers afternoon calls.', '2026-07-18 04:01:23.418251', 41, NULL, NULL, 38),
(20, 'Budget approved for Q3 implementation.', '2026-07-18 04:01:23.418251', 13, NULL, NULL, 29),
(21, 'Requires SOC2 documentation before signing.', '2026-07-18 04:01:23.418251', 20, NULL, NULL, 28),
(22, 'Escalated billing concern resolved amicably.', '2026-07-18 04:01:23.418251', 24, NULL, NULL, 17),
(23, 'Competitor evaluation in progress - emphasize support SLAs.', '2026-07-18 04:01:23.418251', 49, NULL, NULL, 6),
(24, 'Interested in add-on training packages.', '2026-07-18 04:01:23.418251', 23, NULL, NULL, 15),
(25, 'Renewal likely; consider multi-year offer.', '2026-07-18 04:01:23.418251', 33, NULL, NULL, 40),
(26, 'Requires SOC2 documentation before signing.', '2026-07-18 04:01:23.418251', 30, NULL, NULL, 28),
(27, 'Competitor evaluation in progress - emphasize support SLAs.', '2026-07-18 04:01:23.418251', 32, NULL, NULL, 21),
(28, 'Budget approved for Q3 implementation.', '2026-07-18 04:01:23.418251', 12, NULL, NULL, 29),
(29, 'Decision maker will be on leave next week.', '2026-07-18 04:01:23.418251', 5, NULL, NULL, 23),
(30, 'Escalated billing concern resolved amicably.', '2026-07-18 04:01:23.418251', 33, NULL, NULL, 33),
(31, 'Budget approved for Q3 implementation.', '2026-07-18 04:01:23.418251', 51, NULL, NULL, 18),
(32, 'Customer prefers afternoon calls.', '2026-07-18 04:01:23.418251', 5, NULL, NULL, 24),
(33, 'Renewal likely; consider multi-year offer.', '2026-07-18 04:01:23.418251', 22, NULL, NULL, 13),
(34, 'Competitor evaluation in progress - emphasize support SLAs.', '2026-07-18 04:01:23.418251', 48, NULL, NULL, 50),
(35, 'Escalated billing concern resolved amicably.', '2026-07-18 04:01:23.418251', 39, NULL, NULL, 9),
(36, 'Competitor evaluation in progress - emphasize support SLAs.', '2026-07-18 04:01:23.418251', NULL, 1, NULL, 50),
(37, 'Requires SOC2 documentation before signing.', '2026-07-18 04:01:23.418251', 23, NULL, NULL, 26),
(39, 'Asked for a revised proposal with volume discounts.', '2026-07-18 04:01:23.418251', 33, NULL, NULL, 49),
(40, 'Budget approved for Q3 implementation.', '2026-07-18 04:01:23.418251', NULL, NULL, 15, 15),
(41, 'Escalated billing concern resolved amicably.', '2026-07-18 04:01:23.418251', 34, NULL, NULL, 38),
(42, 'Renewal likely; consider multi-year offer.', '2026-07-18 04:01:23.418251', NULL, NULL, 47, 30),
(43, 'Requires SOC2 documentation before signing.', '2026-07-18 04:01:23.418251', NULL, NULL, 21, 13),
(44, 'Budget approved for Q3 implementation.', '2026-07-18 04:01:23.418251', NULL, NULL, 45, 27),
(45, 'Renewal likely; consider multi-year offer.', '2026-07-18 04:01:23.418251', 36, NULL, NULL, 2),
(46, 'Customer prefers afternoon calls.', '2026-07-18 04:01:23.418251', 9, NULL, NULL, 20),
(47, 'Renewal likely; consider multi-year offer.', '2026-07-18 04:01:23.418251', 43, NULL, NULL, 23),
(48, 'Requires SOC2 documentation before signing.', '2026-07-18 04:01:23.418251', 28, NULL, NULL, 44),
(49, 'Competitor evaluation in progress - emphasize support SLAs.', '2026-07-18 04:01:23.418251', NULL, NULL, 45, 35),
(50, 'Customer prefers afternoon calls.', '2026-07-18 04:01:23.418251', 2, NULL, NULL, 37),
(51, 'sample notes', '2026-08-24 09:59:24.660129', 52, NULL, NULL, 1),
(52, 'sample notes', '2026-08-26 11:11:34.394512', 54, NULL, NULL, 1),
(53, 'qualified', '2026-08-26 11:21:11.194115', NULL, NULL, 51, 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) NOT NULL,
  `title` varchar(150) NOT NULL,
  `message` longtext NOT NULL,
  `type` varchar(10) NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `title`, `message`, `type`, `is_read`, `created_at`, `user_id`) VALUES
(1, 'Task overdue', 'One of your tasks is past its due date.', 'warning', 1, '2026-08-22 08:22:23.337299', 1),
(2, 'New lead assigned', 'You have been assigned a new lead.', 'info', 1, '2026-08-22 08:22:23.337319', 1),
(3, 'Payment received', 'A payment was recorded against an invoice.', 'success', 0, '2026-08-22 08:22:23.337324', 2),
(4, 'New lead assigned', 'You have been assigned a new lead.', 'info', 0, '2026-08-22 08:22:23.337329', 2),
(5, 'Invoice overdue', 'An invoice is overdue for payment.', 'danger', 1, '2026-08-22 08:22:23.337333', 2),
(6, 'Task overdue', 'One of your tasks is past its due date.', 'warning', 0, '2026-08-22 08:22:23.337337', 2),
(7, 'Payment received', 'A payment was recorded against an invoice.', 'success', 1, '2026-08-22 08:22:23.337342', 3),
(8, 'Payment received', 'A payment was recorded against an invoice.', 'success', 0, '2026-08-22 08:22:23.337346', 4),
(9, 'Task overdue', 'One of your tasks is past its due date.', 'warning', 1, '2026-08-22 08:22:23.337350', 4),
(10, 'Task overdue', 'One of your tasks is past its due date.', 'warning', 1, '2026-08-22 08:22:23.337355', 5),
(11, 'Invoice overdue', 'An invoice is overdue for payment.', 'danger', 0, '2026-08-22 08:22:23.337359', 6),
(12, 'New lead assigned', 'You have been assigned a new lead.', 'info', 1, '2026-08-22 08:22:23.337363', 6),
(13, 'Invoice overdue', 'An invoice is overdue for payment.', 'danger', 0, '2026-08-22 08:22:23.337367', 6),
(14, 'Invoice overdue', 'An invoice is overdue for payment.', 'danger', 1, '2026-08-22 08:22:23.337372', 7),
(15, 'Payment received', 'A payment was recorded against an invoice.', 'success', 0, '2026-08-22 08:22:23.337376', 7),
(16, 'Invoice overdue', 'An invoice is overdue for payment.', 'danger', 0, '2026-08-22 08:22:23.337380', 7),
(17, 'Invoice overdue', 'An invoice is overdue for payment.', 'danger', 1, '2026-08-22 08:22:23.337384', 7),
(18, 'Deal won!', 'Congratulations! A deal was marked as Won.', 'success', 1, '2026-08-22 08:22:23.337389', 8),
(19, 'New support ticket', 'A new ticket requires attention.', 'info', 0, '2026-08-22 08:22:23.337393', 9),
(20, 'New lead assigned', 'You have been assigned a new lead.', 'info', 0, '2026-08-22 08:22:23.337397', 9),
(21, 'New support ticket', 'A new ticket requires attention.', 'info', 0, '2026-08-22 08:22:23.337402', 9),
(22, 'New lead assigned', 'You have been assigned a new lead.', 'info', 1, '2026-08-22 08:22:23.337406', 9),
(23, 'Invoice overdue', 'An invoice is overdue for payment.', 'danger', 1, '2026-08-22 08:22:23.337410', 10),
(24, 'Invoice overdue', 'An invoice is overdue for payment.', 'danger', 0, '2026-08-22 08:22:23.337414', 10),
(25, 'Deal won!', 'Congratulations! A deal was marked as Won.', 'success', 1, '2026-08-22 08:22:23.337419', 10),
(26, 'Task overdue', 'One of your tasks is past its due date.', 'warning', 0, '2026-08-22 08:22:23.337423', 11),
(27, 'New lead assigned', 'You have been assigned a new lead.', 'info', 0, '2026-08-22 08:22:23.337427', 11),
(28, 'Task overdue', 'One of your tasks is past its due date.', 'warning', 0, '2026-08-22 08:22:23.337432', 11),
(29, 'Task overdue', 'One of your tasks is past its due date.', 'warning', 0, '2026-08-22 08:22:23.337436', 11),
(30, 'Deal won!', 'Congratulations! A deal was marked as Won.', 'success', 1, '2026-08-22 08:22:23.337440', 12),
(31, 'New lead assigned', 'You have been assigned a new lead.', 'info', 1, '2026-08-22 08:22:23.337444', 12),
(32, 'Task overdue', 'One of your tasks is past its due date.', 'warning', 0, '2026-08-22 08:22:23.337449', 12),
(33, 'Payment received', 'A payment was recorded against an invoice.', 'success', 0, '2026-08-22 08:22:23.337453', 12),
(34, 'Invoice overdue', 'An invoice is overdue for payment.', 'danger', 1, '2026-08-22 08:22:23.337457', 13),
(35, 'Payment received', 'A payment was recorded against an invoice.', 'success', 0, '2026-08-22 08:22:23.337462', 13),
(36, 'New lead assigned', 'You have been assigned a new lead.', 'info', 1, '2026-08-22 08:22:23.337466', 13),
(37, 'Invoice overdue', 'An invoice is overdue for payment.', 'danger', 0, '2026-08-22 08:22:23.337470', 14),
(38, 'New lead assigned', 'You have been assigned a new lead.', 'info', 0, '2026-08-22 08:22:23.337474', 14),
(39, 'Task overdue', 'One of your tasks is past its due date.', 'warning', 0, '2026-08-22 08:22:23.337478', 14),
(40, 'Task overdue', 'One of your tasks is past its due date.', 'warning', 0, '2026-08-22 08:22:23.337483', 15),
(41, 'Invoice overdue', 'An invoice is overdue for payment.', 'danger', 0, '2026-08-22 08:22:23.337487', 15),
(42, 'New lead assigned', 'You have been assigned a new lead.', 'info', 1, '2026-08-22 08:22:23.337491', 15),
(43, 'Payment received', 'A payment was recorded against an invoice.', 'success', 0, '2026-08-22 08:22:23.337496', 15),
(44, 'Deal won!', 'Congratulations! A deal was marked as Won.', 'success', 0, '2026-08-22 08:22:23.337500', 16),
(45, 'Deal won!', 'Congratulations! A deal was marked as Won.', 'success', 1, '2026-08-22 08:22:23.337504', 16),
(46, 'Payment received', 'A payment was recorded against an invoice.', 'success', 1, '2026-08-22 08:22:23.337508', 16),
(47, 'New lead assigned', 'You have been assigned a new lead.', 'info', 1, '2026-08-22 08:22:23.337513', 17),
(48, 'Invoice overdue', 'An invoice is overdue for payment.', 'danger', 0, '2026-08-22 08:22:23.337517', 17),
(49, 'New lead assigned', 'You have been assigned a new lead.', 'info', 1, '2026-08-22 08:22:23.337521', 18),
(50, 'New support ticket', 'A new ticket requires attention.', 'info', 0, '2026-08-22 08:22:23.337526', 18),
(51, 'New lead assigned', 'You have been assigned a new lead.', 'info', 0, '2026-08-22 08:22:23.337530', 18),
(52, 'New lead assigned', 'You have been assigned a new lead.', 'info', 0, '2026-08-22 08:22:23.337534', 19),
(53, 'Deal won!', 'Congratulations! A deal was marked as Won.', 'success', 0, '2026-08-22 08:22:23.337538', 19),
(54, 'Payment received', 'A payment was recorded against an invoice.', 'success', 0, '2026-08-22 08:22:23.337543', 20),
(55, 'Task overdue', 'One of your tasks is past its due date.', 'warning', 0, '2026-08-22 08:22:23.337547', 20),
(56, 'Payment received', 'A payment was recorded against an invoice.', 'success', 1, '2026-08-22 08:22:23.337551', 20),
(57, 'Lead converted', 'catlin ednalan converted to customer CUS-00053.', 'success', 1, '2026-08-24 10:32:29.173014', 1),
(58, 'Meeting invitation', 'You were invited to \"test\" on 2026-08-24.', 'info', 0, '2026-08-24 11:25:18.865551', 2),
(59, 'Meeting invitation', 'You were invited to \"test\" on 2026-08-24.', 'info', 0, '2026-08-24 11:25:18.870657', 3),
(60, 'Lead converted', 'Clydey Ednalan converted to customer CUS-00055.', 'success', 1, '2026-08-26 11:21:40.603831', 1),
(61, 'Meeting invitation', 'You were invited to \"Contract Negotiation\" on 2026-08-27.', 'info', 0, '2026-08-27 09:53:49.749963', 5),
(62, 'Meeting invitation', 'You were invited to \"Contract Negotiation\" on 2026-08-27.', 'info', 0, '2026-08-27 09:53:49.759540', 6),
(63, 'Meeting invitation', 'You were invited to \"Contract Negotiation\" on 2026-08-27.', 'info', 0, '2026-08-27 09:53:49.766632', 7);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `transaction_reference` varchar(100) NOT NULL,
  `amount` decimal(14,2) NOT NULL,
  `payment_date` date NOT NULL,
  `notes` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `invoice_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `payment_method`, `transaction_reference`, `amount`, `payment_date`, `notes`, `created_at`, `customer_id`, `invoice_id`) VALUES
(1, 'Cash', 'TXN-293079', '1853.70', '2026-07-31', '', '2026-08-22 08:22:23.095338', 38, 1),
(2, 'Cash', 'TXN-476712', '2772.88', '2026-06-05', '', '2026-08-22 08:22:23.102109', 10, 2),
(3, 'Cash', 'TXN-823468', '4392.60', '2026-05-14', '', '2026-08-22 08:22:23.111101', 30, 5),
(4, 'PayPal', 'TXN-718990', '4495.00', '2026-04-13', '', '2026-08-22 08:22:23.113967', 10, 6),
(5, 'PayPal', 'TXN-984274', '988.00', '2026-07-24', '', '2026-08-22 08:22:23.132598', 27, 12),
(6, 'Cash', 'TXN-223949', '1427.18', '2026-03-23', '', '2026-08-22 08:22:23.142551', 51, 14),
(7, 'PayPal', 'TXN-755843', '1427.18', '2026-03-17', '', '2026-08-22 08:22:23.143285', 51, 14),
(8, 'Cash', 'TXN-219366', '17405.01', '2026-02-20', '', '2026-08-22 08:22:23.146243', 8, 15),
(9, 'Bank Transfer', 'TXN-604884', '3521.00', '2026-02-25', '', '2026-08-22 08:22:23.150898', 22, 16),
(10, 'PayPal', 'TXN-191014', '19904.00', '2026-01-23', '', '2026-08-22 08:22:23.167538', 2, 18),
(11, 'Check', 'TXN-261562', '16537.92', '2026-04-28', '', '2026-08-22 08:22:23.173507', 16, 19),
(12, 'PayPal', 'TXN-593403', '5703.00', '2026-05-21', '', '2026-08-22 08:22:23.208861', 26, 25),
(13, 'Check', 'TXN-533525', '10038.00', '2026-01-26', '', '2026-08-22 08:22:23.215046', 11, 27),
(14, 'Credit Card', 'TXN-697978', '1825.80', '2026-04-02', '', '2026-08-22 08:22:23.253298', 49, 30),
(15, 'Credit Card', 'TXN-215027', '7049.50', '2026-02-13', '', '2026-08-22 08:22:23.262171', 44, 31),
(16, 'Cash', 'TXN-175231', '7291.66', '2026-01-14', '', '2026-08-22 08:22:23.265952', 19, 32),
(17, 'Cash', 'TXN-591644', '34560.54', '2026-03-19', '', '2026-08-22 08:22:23.274666', 6, 35),
(18, 'Check', 'TXN-128624', '7151.78', '2026-05-17', '', '2026-08-22 08:22:23.281390', 33, 36),
(19, 'Bank Transfer', 'TXN-373943', '4208.54', '2026-06-17', '', '2026-08-22 08:22:23.285059', 32, 37),
(20, 'Credit Card', 'TXN-599401', '15493.80', '2026-05-27', '', '2026-08-22 08:22:23.290084', 16, 39),
(21, 'Credit Card', 'TXN-380061', '4309.78', '2026-02-18', '', '2026-08-22 08:22:23.294110', 49, 40),
(22, 'Credit Card', 'TXN-786128', '4309.79', '2026-02-11', '', '2026-08-22 08:22:23.294726', 49, 40),
(24, 'Bank Transfer', '', '100.00', '2026-08-27', 'interior studio', '2026-08-27 09:31:15.346434', 45, 3);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(120) NOT NULL,
  `module` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `slug`, `module`, `created_at`, `updated_at`) VALUES
(1, 'View Dashboard', 'dashboard.view', 'dashboard', '2026-08-22 08:21:23.098668', '2026-08-22 08:21:23.098675'),
(2, 'Create Dashboard', 'dashboard.create', 'dashboard', '2026-08-22 08:21:23.099241', '2026-08-22 08:21:23.099249'),
(3, 'Update Dashboard', 'dashboard.update', 'dashboard', '2026-08-22 08:21:23.099826', '2026-08-22 08:21:23.099837'),
(4, 'Delete Dashboard', 'dashboard.delete', 'dashboard', '2026-08-22 08:21:23.100338', '2026-08-22 08:21:23.100346'),
(5, 'View Customers', 'customers.view', 'customers', '2026-08-22 08:21:23.100717', '2026-08-22 08:21:23.100724'),
(6, 'Create Customers', 'customers.create', 'customers', '2026-08-22 08:21:23.101088', '2026-08-22 08:21:23.101096'),
(7, 'Update Customers', 'customers.update', 'customers', '2026-08-22 08:21:23.101420', '2026-08-22 08:21:23.101429'),
(8, 'Delete Customers', 'customers.delete', 'customers', '2026-08-22 08:21:23.101735', '2026-08-22 08:21:23.101743'),
(9, 'View Contacts', 'contacts.view', 'contacts', '2026-08-22 08:21:23.102049', '2026-08-22 08:21:23.102075'),
(10, 'Create Contacts', 'contacts.create', 'contacts', '2026-08-22 08:21:23.102549', '2026-08-22 08:21:23.102557'),
(11, 'Update Contacts', 'contacts.update', 'contacts', '2026-08-22 08:21:23.102990', '2026-08-22 08:21:23.102997'),
(12, 'Delete Contacts', 'contacts.delete', 'contacts', '2026-08-22 08:21:23.103505', '2026-08-22 08:21:23.103513'),
(13, 'View Leads', 'leads.view', 'leads', '2026-08-22 08:21:23.103908', '2026-08-22 08:21:23.103918'),
(14, 'Create Leads', 'leads.create', 'leads', '2026-08-22 08:21:23.106279', '2026-08-22 08:21:23.106370'),
(15, 'Update Leads', 'leads.update', 'leads', '2026-08-22 08:21:23.107289', '2026-08-22 08:21:23.107299'),
(16, 'Delete Leads', 'leads.delete', 'leads', '2026-08-22 08:21:23.107711', '2026-08-22 08:21:23.107732'),
(17, 'View Deals', 'deals.view', 'deals', '2026-08-22 08:21:23.108094', '2026-08-22 08:21:23.108103'),
(18, 'Create Deals', 'deals.create', 'deals', '2026-08-22 08:21:23.108485', '2026-08-22 08:21:23.108493'),
(19, 'Update Deals', 'deals.update', 'deals', '2026-08-22 08:21:23.108861', '2026-08-22 08:21:23.108869'),
(20, 'Delete Deals', 'deals.delete', 'deals', '2026-08-22 08:21:23.109207', '2026-08-22 08:21:23.109214'),
(21, 'View Pipelines', 'pipelines.view', 'pipelines', '2026-08-22 08:21:23.109551', '2026-08-22 08:21:23.109560'),
(22, 'Create Pipelines', 'pipelines.create', 'pipelines', '2026-08-22 08:21:23.109893', '2026-08-22 08:21:23.109901'),
(23, 'Update Pipelines', 'pipelines.update', 'pipelines', '2026-08-22 08:21:23.110245', '2026-08-22 08:21:23.110253'),
(24, 'Delete Pipelines', 'pipelines.delete', 'pipelines', '2026-08-22 08:21:23.110631', '2026-08-22 08:21:23.110686'),
(25, 'View Tasks', 'tasks.view', 'tasks', '2026-08-22 08:21:23.111130', '2026-08-22 08:21:23.111139'),
(26, 'Create Tasks', 'tasks.create', 'tasks', '2026-08-22 08:21:23.111477', '2026-08-22 08:21:23.111484'),
(27, 'Update Tasks', 'tasks.update', 'tasks', '2026-08-22 08:21:23.111800', '2026-08-22 08:21:23.111807'),
(28, 'Delete Tasks', 'tasks.delete', 'tasks', '2026-08-22 08:21:23.112122', '2026-08-22 08:21:23.112130'),
(29, 'View Meetings', 'meetings.view', 'meetings', '2026-08-22 08:21:23.112447', '2026-08-22 08:21:23.112454'),
(30, 'Create Meetings', 'meetings.create', 'meetings', '2026-08-22 08:21:23.112770', '2026-08-22 08:21:23.112778'),
(31, 'Update Meetings', 'meetings.update', 'meetings', '2026-08-22 08:21:23.113131', '2026-08-22 08:21:23.113142'),
(32, 'Delete Meetings', 'meetings.delete', 'meetings', '2026-08-22 08:21:23.113490', '2026-08-22 08:21:23.113498'),
(33, 'View Products', 'products.view', 'products', '2026-08-22 08:21:23.113843', '2026-08-22 08:21:23.113851'),
(34, 'Create Products', 'products.create', 'products', '2026-08-22 08:21:23.114199', '2026-08-22 08:21:23.114207'),
(35, 'Update Products', 'products.update', 'products', '2026-08-22 08:21:23.114529', '2026-08-22 08:21:23.114537'),
(36, 'Delete Products', 'products.delete', 'products', '2026-08-22 08:21:23.114855', '2026-08-22 08:21:23.114862'),
(37, 'View Categories', 'categories.view', 'categories', '2026-08-22 08:21:23.115260', '2026-08-22 08:21:23.115270'),
(38, 'Create Categories', 'categories.create', 'categories', '2026-08-22 08:21:23.115737', '2026-08-22 08:21:23.115746'),
(39, 'Update Categories', 'categories.update', 'categories', '2026-08-22 08:21:23.116144', '2026-08-22 08:21:23.116152'),
(40, 'Delete Categories', 'categories.delete', 'categories', '2026-08-22 08:21:23.116496', '2026-08-22 08:21:23.116503'),
(41, 'View Quotes', 'quotes.view', 'quotes', '2026-08-22 08:21:23.116843', '2026-08-22 08:21:23.116851'),
(42, 'Create Quotes', 'quotes.create', 'quotes', '2026-08-22 08:21:23.117168', '2026-08-22 08:21:23.117175'),
(43, 'Update Quotes', 'quotes.update', 'quotes', '2026-08-22 08:21:23.118600', '2026-08-22 08:21:23.118683'),
(44, 'Delete Quotes', 'quotes.delete', 'quotes', '2026-08-22 08:21:23.119900', '2026-08-22 08:21:23.119915'),
(45, 'View Invoices', 'invoices.view', 'invoices', '2026-08-22 08:21:23.120564', '2026-08-22 08:21:23.120571'),
(46, 'Create Invoices', 'invoices.create', 'invoices', '2026-08-22 08:21:23.120960', '2026-08-22 08:21:23.120972'),
(47, 'Update Invoices', 'invoices.update', 'invoices', '2026-08-22 08:21:23.121588', '2026-08-22 08:21:23.121597'),
(48, 'Delete Invoices', 'invoices.delete', 'invoices', '2026-08-22 08:21:23.122074', '2026-08-22 08:21:23.122084'),
(49, 'View Payments', 'payments.view', 'payments', '2026-08-22 08:21:23.122452', '2026-08-22 08:21:23.122459'),
(50, 'Create Payments', 'payments.create', 'payments', '2026-08-22 08:21:23.122859', '2026-08-22 08:21:23.122867'),
(51, 'Update Payments', 'payments.update', 'payments', '2026-08-22 08:21:23.123209', '2026-08-22 08:21:23.123216'),
(52, 'Delete Payments', 'payments.delete', 'payments', '2026-08-22 08:21:23.123575', '2026-08-22 08:21:23.123582'),
(53, 'View Tickets', 'tickets.view', 'tickets', '2026-08-22 08:21:23.124498', '2026-08-22 08:21:23.124537'),
(54, 'Create Tickets', 'tickets.create', 'tickets', '2026-08-22 08:21:23.125800', '2026-08-22 08:21:23.125818'),
(55, 'Update Tickets', 'tickets.update', 'tickets', '2026-08-22 08:21:23.127623', '2026-08-22 08:21:23.127644'),
(56, 'Delete Tickets', 'tickets.delete', 'tickets', '2026-08-22 08:21:23.128438', '2026-08-22 08:21:23.128449'),
(57, 'View Email Templates', 'email_templates.view', 'email_templates', '2026-08-22 08:21:23.129007', '2026-08-22 08:21:23.129015'),
(58, 'Create Email Templates', 'email_templates.create', 'email_templates', '2026-08-22 08:21:23.129442', '2026-08-22 08:21:23.129450'),
(59, 'Update Email Templates', 'email_templates.update', 'email_templates', '2026-08-22 08:21:23.129900', '2026-08-22 08:21:23.129908'),
(60, 'Delete Email Templates', 'email_templates.delete', 'email_templates', '2026-08-22 08:21:23.130282', '2026-08-22 08:21:23.130289'),
(61, 'View Email Logs', 'email_logs.view', 'email_logs', '2026-08-22 08:21:23.130696', '2026-08-22 08:21:23.130704'),
(62, 'Create Email Logs', 'email_logs.create', 'email_logs', '2026-08-22 08:21:23.131092', '2026-08-22 08:21:23.131102'),
(63, 'Update Email Logs', 'email_logs.update', 'email_logs', '2026-08-22 08:21:23.132405', '2026-08-22 08:21:23.132423'),
(64, 'Delete Email Logs', 'email_logs.delete', 'email_logs', '2026-08-22 08:21:23.133390', '2026-08-22 08:21:23.133403'),
(65, 'View Users', 'users.view', 'users', '2026-08-22 08:21:23.134017', '2026-08-22 08:21:23.134030'),
(66, 'Create Users', 'users.create', 'users', '2026-08-22 08:21:23.134510', '2026-08-22 08:21:23.134518'),
(67, 'Update Users', 'users.update', 'users', '2026-08-22 08:21:23.134930', '2026-08-22 08:21:23.134938'),
(68, 'Delete Users', 'users.delete', 'users', '2026-08-22 08:21:23.135298', '2026-08-22 08:21:23.135306'),
(69, 'View Roles', 'roles.view', 'roles', '2026-08-22 08:21:23.135660', '2026-08-22 08:21:23.135668'),
(70, 'Create Roles', 'roles.create', 'roles', '2026-08-22 08:21:23.136008', '2026-08-22 08:21:23.136016'),
(71, 'Update Roles', 'roles.update', 'roles', '2026-08-22 08:21:23.136343', '2026-08-22 08:21:23.136351'),
(72, 'Delete Roles', 'roles.delete', 'roles', '2026-08-22 08:21:23.136692', '2026-08-22 08:21:23.136700'),
(73, 'View Permissions', 'permissions.view', 'permissions', '2026-08-22 08:21:23.137064', '2026-08-22 08:21:23.137073'),
(74, 'Create Permissions', 'permissions.create', 'permissions', '2026-08-22 08:21:23.137508', '2026-08-22 08:21:23.137518'),
(75, 'Update Permissions', 'permissions.update', 'permissions', '2026-08-22 08:21:23.137873', '2026-08-22 08:21:23.137883'),
(76, 'Delete Permissions', 'permissions.delete', 'permissions', '2026-08-22 08:21:23.138210', '2026-08-22 08:21:23.138218'),
(77, 'View Reports', 'reports.view', 'reports', '2026-08-22 08:21:23.138511', '2026-08-22 08:21:23.138518'),
(78, 'Create Reports', 'reports.create', 'reports', '2026-08-22 08:21:23.138855', '2026-08-22 08:21:23.138862'),
(79, 'Update Reports', 'reports.update', 'reports', '2026-08-22 08:21:23.139189', '2026-08-22 08:21:23.139196'),
(80, 'Delete Reports', 'reports.delete', 'reports', '2026-08-22 08:21:23.139544', '2026-08-22 08:21:23.139551'),
(81, 'View Settings', 'settings.view', 'settings', '2026-08-22 08:21:23.139892', '2026-08-22 08:21:23.139899'),
(82, 'Create Settings', 'settings.create', 'settings', '2026-08-22 08:21:23.140239', '2026-08-22 08:21:23.140247'),
(83, 'Update Settings', 'settings.update', 'settings', '2026-08-22 08:21:23.140598', '2026-08-22 08:21:23.140605'),
(84, 'Delete Settings', 'settings.delete', 'settings', '2026-08-22 08:21:23.140908', '2026-08-22 08:21:23.140915'),
(85, 'View Notifications', 'notifications.view', 'notifications', '2026-08-22 08:21:23.141232', '2026-08-22 08:21:23.141240'),
(86, 'Create Notifications', 'notifications.create', 'notifications', '2026-08-22 08:21:23.141529', '2026-08-22 08:21:23.141536'),
(87, 'Update Notifications', 'notifications.update', 'notifications', '2026-08-22 08:21:23.141819', '2026-08-22 08:21:23.141825'),
(88, 'Delete Notifications', 'notifications.delete', 'notifications', '2026-08-22 08:21:23.142101', '2026-08-22 08:21:23.142108'),
(89, 'View Activity Logs', 'activity_logs.view', 'activity_logs', '2026-08-22 08:21:23.142385', '2026-08-22 08:21:23.142392'),
(90, 'Create Activity Logs', 'activity_logs.create', 'activity_logs', '2026-08-22 08:21:23.142690', '2026-08-22 08:21:23.142698'),
(91, 'Update Activity Logs', 'activity_logs.update', 'activity_logs', '2026-08-22 08:21:23.142994', '2026-08-22 08:21:23.143001'),
(92, 'Delete Activity Logs', 'activity_logs.delete', 'activity_logs', '2026-08-22 08:21:23.143313', '2026-08-22 08:21:23.143322'),
(93, 'View Login Logs', 'login_logs.view', 'login_logs', '2026-08-22 08:21:23.143632', '2026-08-22 08:21:23.143640'),
(94, 'Create Login Logs', 'login_logs.create', 'login_logs', '2026-08-22 08:21:23.143940', '2026-08-22 08:21:23.143948'),
(95, 'Update Login Logs', 'login_logs.update', 'login_logs', '2026-08-22 08:21:23.144240', '2026-08-22 08:21:23.144247'),
(96, 'Delete Login Logs', 'login_logs.delete', 'login_logs', '2026-08-22 08:21:23.144589', '2026-08-22 08:21:23.144596'),
(97, 'View Audit Logs', 'audit_logs.view', 'audit_logs', '2026-08-22 08:21:23.145376', '2026-08-22 08:21:23.145391'),
(98, 'Create Audit Logs', 'audit_logs.create', 'audit_logs', '2026-08-22 08:21:23.146455', '2026-08-22 08:21:23.146469'),
(99, 'Update Audit Logs', 'audit_logs.update', 'audit_logs', '2026-08-22 08:21:23.146895', '2026-08-22 08:21:23.146907'),
(100, 'Delete Audit Logs', 'audit_logs.delete', 'audit_logs', '2026-08-22 08:21:23.147273', '2026-08-22 08:21:23.147281');

-- --------------------------------------------------------

--
-- Table structure for table `pipelines`
--

CREATE TABLE `pipelines` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pipelines`
--

INSERT INTO `pipelines` (`id`, `name`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Sales Pipeline', 1, '2026-08-22 08:22:22.145581', '2026-08-22 08:22:22.145595'),
(2, 'Renewal Pipeline', 0, '2026-08-22 08:22:22.146390', '2026-08-22 08:22:22.146400');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) NOT NULL,
  `sku` varchar(50) NOT NULL,
  `product_name` varchar(150) NOT NULL,
  `description` longtext NOT NULL,
  `unit_price` decimal(12,2) NOT NULL,
  `tax_rate` decimal(5,2) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `status` varchar(10) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `sku`, `product_name`, `description`, `unit_price`, `tax_rate`, `stock_quantity`, `status`, `created_at`, `updated_at`, `category_id`) VALUES
(1, 'PRD-00001', 'Laptop Pro 14\"', 'High-quality laptop pro 14\" for business use.', '1299.00', '5.00', 300, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 1),
(2, 'PRD-00002', 'Laptop Ultra 16\"', 'High-quality laptop ultra 16\" for business use.', '1899.00', '8.00', 300, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 1),
(3, 'PRD-00003', '27\" 4K Monitor', 'High-quality 27\" 4k monitor for business use.', '449.00', '0.00', 5, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 1),
(4, 'PRD-00004', 'USB-C Docking Station', 'High-quality usb-c docking station for business use.', '189.00', '0.00', 0, 'Inactive', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 6),
(5, 'PRD-00005', 'Mechanical Keyboard', 'High-quality mechanical keyboard for business use.', '129.00', '10.00', 120, 'Inactive', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 6),
(6, 'PRD-00006', 'Wireless Mouse Elite', 'High-quality wireless mouse elite for business use.', '79.00', '10.00', 120, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 6),
(7, 'PRD-00007', 'Noise-Cancel Headset', 'High-quality noise-cancel headset for business use.', '249.00', '0.00', 0, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 6),
(8, 'PRD-00008', 'HD Webcam Pro', 'High-quality hd webcam pro for business use.', '119.00', '5.00', 0, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 8),
(9, 'PRD-00009', 'Laser Printer X500', 'High-quality laser printer x500 for business use.', '599.00', '10.00', 25, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 8),
(10, 'PRD-00010', 'Document Scanner S200', 'High-quality document scanner s200 for business use.', '379.00', '8.00', 50, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 8),
(11, 'PRD-00011', 'Wi-Fi 6 Router', 'High-quality wi-fi 6 router for business use.', '299.00', '5.00', 120, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 5),
(12, 'PRD-00012', '24-Port Switch', 'High-quality 24-port switch for business use.', '899.00', '0.00', 0, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 5),
(13, 'PRD-00013', 'Mesh Wi-Fi System', 'High-quality mesh wi-fi system for business use.', '499.00', '8.00', 50, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 5),
(14, 'PRD-00014', 'VPN Appliance', 'High-quality vpn appliance for business use.', '1299.00', '12.00', 25, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 5),
(15, 'PRD-00015', 'CRM Software License', 'High-quality crm software license for business use.', '89.00', '5.00', 300, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 2),
(16, 'PRD-00016', 'Accounting Software', 'High-quality accounting software for business use.', '349.00', '12.00', 120, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 2),
(17, 'PRD-00017', 'Antivirus Suite', 'High-quality antivirus suite for business use.', '59.00', '12.00', 50, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 2),
(18, 'PRD-00018', 'Design Suite Subscription', 'High-quality design suite subscription for business use.', '229.00', '12.00', 25, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 2),
(19, 'PRD-00019', 'Project Mgmt Tool', 'High-quality project mgmt tool for business use.', '149.00', '10.00', 120, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 2),
(20, 'PRD-00020', 'Backup Service Cloud', 'High-quality backup service cloud for business use.', '199.00', '0.00', 50, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 2),
(21, 'PRD-00021', 'Standing Desk', 'High-quality standing desk for business use.', '649.00', '10.00', 25, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 4),
(22, 'PRD-00022', 'Ergonomic Chair', 'High-quality ergonomic chair for business use.', '429.00', '0.00', 0, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 4),
(23, 'PRD-00023', 'Conference Table', 'High-quality conference table for business use.', '1249.00', '5.00', 25, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 4),
(24, 'PRD-00024', 'Filing Cabinet', 'High-quality filing cabinet for business use.', '219.00', '12.00', 0, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 4),
(25, 'PRD-00025', 'Whiteboard XL', 'High-quality whiteboard xl for business use.', '159.00', '10.00', 50, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 4),
(26, 'PRD-00026', 'A4 Paper Ream (Pack 10)', 'High-quality a4 paper ream (pack 10) for business use.', '42.00', '10.00', 25, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 3),
(27, 'PRD-00027', 'Toner Cartridge Black', 'High-quality toner cartridge black for business use.', '89.00', '0.00', 120, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 3),
(28, 'PRD-00028', 'Stapler Heavy Duty', 'High-quality stapler heavy duty for business use.', '19.00', '10.00', 120, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 3),
(29, 'PRD-00029', 'Notebook Pack (5)', 'High-quality notebook pack (5) for business use.', '24.00', '5.00', 5, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 3),
(30, 'PRD-00030', 'Pen Set Premium', 'High-quality pen set premium for business use.', '15.00', '10.00', 50, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 3),
(31, 'PRD-00031', 'IT Consulting Hour', 'High-quality it consulting hour for business use.', '150.00', '0.00', 50, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 7),
(32, 'PRD-00032', 'Staff Training Day', 'High-quality staff training day for business use.', '1200.00', '12.00', 120, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 7),
(33, 'PRD-00033', 'System Integration', 'High-quality system integration for business use.', '4500.00', '8.00', 25, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 7),
(34, 'PRD-00034', 'Data Migration Service', 'High-quality data migration service for business use.', '2800.00', '12.00', 25, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 7),
(35, 'PRD-00035', 'Security Audit', 'High-quality security audit for business use.', '3200.00', '0.00', 5, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 7),
(36, 'PRD-00036', 'Tablet 11\"', 'High-quality tablet 11\" for business use.', '699.00', '0.00', 300, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 1),
(37, 'PRD-00037', 'Smartphone X', 'High-quality smartphone x for business use.', '999.00', '10.00', 25, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 1),
(38, 'PRD-00038', 'Portable Projector', 'High-quality portable projector for business use.', '549.00', '10.00', 5, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 1),
(39, 'PRD-00039', 'External SSD 2TB', 'High-quality external ssd 2tb for business use.', '239.00', '5.00', 0, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 1),
(40, 'PRD-00040', 'Graphics Tablet', 'High-quality graphics tablet for business use.', '329.00', '0.00', 5, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 8),
(41, 'PRD-00041', 'Barcode Scanner', 'High-quality barcode scanner for business use.', '179.00', '8.00', 25, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 8),
(42, 'PRD-00042', 'Label Printer', 'High-quality label printer for business use.', '149.00', '10.00', 300, 'Inactive', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 8),
(43, 'PRD-00043', 'Cash Drawer', 'High-quality cash drawer for business use.', '139.00', '0.00', 5, 'Inactive', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 1),
(44, 'PRD-00044', 'POS Terminal', 'High-quality pos terminal for business use.', '749.00', '5.00', 25, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 1),
(45, 'PRD-00045', 'Server Rack 12U', 'High-quality server rack 12u for business use.', '1099.00', '10.00', 25, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 5),
(46, 'PRD-00046', 'Patch Panel 48', 'High-quality patch panel 48 for business use.', '159.00', '0.00', 25, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 5),
(47, 'PRD-00047', 'Ethernet Cable Cat6 (305m)', 'High-quality ethernet cable cat6 (305m) for business use.', '189.00', '5.00', 0, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 5),
(48, 'PRD-00048', 'Surge Protector', 'High-quality surge protector for business use.', '39.00', '10.00', 0, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 6),
(49, 'PRD-00049', 'Monitor Arm Dual', 'High-quality monitor arm dual for business use.', '129.00', '5.00', 5, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 6),
(50, 'PRD-00050', 'Desk Lamp LED', 'High-quality desk lamp led for business use.', '49.00', '8.00', 50, 'Active', '2026-06-20 10:07:22.968796', '2026-07-28 18:07:22.968844', 6);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `category_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Electronics', 'Laptops, monitors and gadgets', '2026-08-22 08:22:22.159695', '2026-08-22 08:22:22.159703'),
(2, 'Software', 'Licenses and SaaS subscriptions', '2026-08-22 08:22:22.162931', '2026-08-22 08:22:22.162948'),
(3, 'Office Supplies', 'Everyday office consumables', '2026-08-22 08:22:22.163932', '2026-08-22 08:22:22.163939'),
(4, 'Furniture', 'Desks, chairs and fittings', '2026-08-22 08:22:22.164560', '2026-08-22 08:22:22.164567'),
(5, 'Networking', 'Routers, switches, access points', '2026-08-22 08:22:22.165372', '2026-08-22 08:22:22.165384'),
(6, 'Accessories', 'Keyboards, mice, cables', '2026-08-22 08:22:22.166617', '2026-08-22 08:22:22.166628'),
(7, 'Services', 'Professional and consulting services', '2026-08-22 08:22:22.167139', '2026-08-22 08:22:22.167148'),
(8, 'Peripherals', 'Printers, scanners, webcams', '2026-08-22 08:22:22.167528', '2026-08-22 08:22:22.167536');

-- --------------------------------------------------------

--
-- Table structure for table `quotes`
--

CREATE TABLE `quotes` (
  `id` bigint(20) NOT NULL,
  `quote_number` varchar(30) NOT NULL,
  `quote_date` date NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `subtotal` decimal(14,2) NOT NULL,
  `tax` decimal(14,2) NOT NULL,
  `discount` decimal(14,2) NOT NULL,
  `total` decimal(14,2) NOT NULL,
  `status` varchar(15) NOT NULL,
  `notes` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `customer_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quotes`
--

INSERT INTO `quotes` (`id`, `quote_number`, `quote_date`, `expiry_date`, `subtotal`, `tax`, `discount`, `total`, `status`, `notes`, `created_at`, `updated_at`, `created_by`, `customer_id`) VALUES
(1, 'QT-2026-0001', '2026-06-23', '2026-09-19', '11200.00', '1344.00', '100.00', '12444.00', 'Accepted', 'Thank you for your business.', '2026-02-28 22:23:22.979212', '2026-08-22 08:22:22.975764', 3, 48),
(2, 'QT-2026-0002', '2026-03-04', '2026-07-28', '472.00', '56.64', '0.00', '528.64', 'Accepted', 'Thank you for your business.', '2026-05-22 06:27:22.983262', '2026-08-22 08:22:22.981847', 11, 21),
(3, 'QT-2026-0003', '2026-07-15', '2026-08-22', '5344.00', '346.53', '250.00', '5440.53', 'Accepted', 'Thank you for your business.', '2026-02-02 09:52:22.985263', '2026-08-22 08:22:22.983994', 14, 43),
(4, 'QT-2026-0004', '2026-07-04', '2026-09-08', '9882.00', '494.10', '0.00', '10376.10', 'Declined', 'Thank you for your business.', '2026-08-06 20:41:23.000013', '2026-08-22 08:22:22.986561', 39, 45),
(5, 'QT-2026-0005', '2026-03-28', '2026-08-05', '5937.00', '588.90', '100.00', '6425.90', 'Sent', 'Thank you for your business.', '2026-05-22 09:14:23.002565', '2026-08-22 08:22:23.001192', 45, 10),
(6, 'QT-2026-0006', '2026-04-10', '2026-10-21', '36091.00', '674.40', '50.00', '36715.40', 'Accepted', 'Thank you for your business.', '2026-01-21 12:24:23.004494', '2026-08-22 08:22:23.003321', 3, 17),
(7, 'QT-2026-0007', '2026-07-26', '2026-09-28', '1023.00', '112.92', '250.00', '885.92', 'Sent', 'Thank you for your business.', '2026-01-14 20:33:23.006210', '2026-08-22 08:22:23.005190', 11, 36),
(8, 'QT-2026-0008', '2026-05-22', '2026-07-31', '7111.00', '394.56', '0.00', '7505.56', 'Accepted', 'Thank you for your business.', '2026-04-10 11:18:23.008643', '2026-08-22 08:22:23.007034', 16, 40),
(9, 'QT-2026-0009', '2026-06-28', '2026-07-27', '36050.00', '4146.22', '0.00', '40196.22', 'Sent', 'Thank you for your business.', '2026-03-19 10:18:23.010926', '2026-08-22 08:22:23.009563', 9, 3),
(10, 'QT-2026-0010', '2026-02-26', '2026-09-23', '15.00', '1.50', '250.00', '-233.50', 'Expired', 'Thank you for your business.', '2026-02-12 18:30:23.012913', '2026-08-22 08:22:23.011535', 14, 1),
(11, 'QT-2026-0011', '2026-07-29', '2026-10-09', '378.00', '18.90', '0.00', '396.90', 'Sent', 'Thank you for your business.', '2026-06-27 16:16:23.016181', '2026-08-22 08:22:23.015133', 46, 24),
(12, 'QT-2026-0012', '2026-06-14', '2026-09-29', '11737.00', '1386.96', '250.00', '12873.96', 'Sent', 'Thank you for your business.', '2026-05-07 09:16:23.017645', '2026-08-22 08:22:23.016783', 47, 7),
(14, 'QT-2026-0014', '2026-03-03', '2026-09-16', '14197.00', '83.08', '50.00', '14230.08', 'Declined', 'Thank you for your business.', '2026-04-28 17:57:23.029861', '2026-08-22 08:22:23.027305', 27, 24),
(15, 'QT-2026-0015', '2026-08-04', '2026-08-28', '555.00', '17.80', '0.00', '572.80', 'Accepted', 'Thank you for your business.', '2026-02-05 09:30:23.033266', '2026-08-22 08:22:23.031168', 47, 1),
(16, 'QT-2026-0016', '2026-04-04', '2026-10-02', '3996.00', '187.35', '50.00', '4133.35', 'Accepted', 'Thank you for your business.', '2026-05-20 14:07:23.038618', '2026-08-22 08:22:23.036272', 36, 18),
(17, 'QT-2026-0017', '2026-05-28', '2026-08-03', '828.00', '18.90', '250.00', '596.90', 'Accepted', 'Thank you for your business.', '2026-01-25 04:44:23.043457', '2026-08-22 08:22:23.040245', 17, 15),
(18, 'QT-2026-0018', '2026-08-03', '2026-10-04', '294.00', '23.52', '100.00', '217.52', 'Sent', 'Thank you for your business.', '2026-05-08 04:27:23.048588', '2026-08-22 08:22:23.044962', 20, 42),
(20, 'QT-2026-0020', '2026-03-13', '2026-10-04', '1232.00', '100.46', '0.00', '1332.46', 'Accepted', 'Thank you for your business.', '2026-04-22 13:35:23.053020', '2026-08-22 08:22:23.051711', 49, 29),
(21, 'QT-2026-0021', '2026-05-02', '2026-08-25', '14388.00', '1379.04', '250.00', '15517.04', 'Draft', 'Thank you for your business.', '2026-06-20 01:18:23.055925', '2026-08-22 08:22:23.054015', 36, 4),
(22, 'QT-2026-0022', '2026-04-24', '2026-09-02', '833.00', '41.65', '50.00', '824.65', 'Accepted', 'Thank you for your business.', '2026-05-25 02:02:23.058228', '2026-08-22 08:22:23.056881', 50, 18),
(23, 'QT-2026-0023', '2026-02-26', '2026-07-26', '13477.00', '624.50', '0.00', '14101.50', 'Declined', 'Thank you for your business.', '2026-01-25 01:10:23.062094', '2026-08-22 08:22:23.059416', 39, 23),
(24, 'QT-2026-0024', '2026-07-04', '2026-08-02', '3490.00', '418.80', '50.00', '3858.80', 'Sent', 'Thank you for your business.', '2026-08-18 21:38:23.064574', '2026-08-22 08:22:23.063110', 24, 44),
(25, 'QT-2026-0025', '2026-04-19', '2026-09-21', '12042.00', '1438.02', '50.00', '13430.02', 'Draft', 'Thank you for your business.', '2026-04-03 16:43:23.067728', '2026-08-22 08:22:23.066324', 20, 8),
(26, 'QT-2026-0026', '2026-02-16', '2026-10-20', '5943.00', '602.42', '0.00', '6545.42', 'Accepted', 'Thank you for your business.', '2026-08-04 19:40:23.071039', '2026-08-22 08:22:23.069496', 10, 47),
(27, 'QT-2026-0027', '2026-02-25', '2026-09-07', '1043.00', '104.30', '100.00', '1047.30', 'Declined', 'Thank you for your business.', '2026-04-13 10:16:23.073580', '2026-08-22 08:22:23.071890', 43, 18),
(28, 'QT-2026-0028', '2026-03-13', '2026-09-29', '36159.00', '2880.00', '0.00', '39039.00', 'Draft', 'Thank you for your business.', '2026-04-08 23:01:23.077690', '2026-08-22 08:22:23.074701', 32, 21),
(29, 'QT-2026-0029', '2026-02-03', '2026-08-12', '29640.00', '2183.85', '0.00', '31823.85', 'Draft', 'Thank you for your business.', '2026-04-02 00:08:23.081559', '2026-08-22 08:22:23.078911', 26, 32),
(30, 'QT-2026-0030', '2026-05-04', '2026-10-15', '32443.00', '3643.94', '250.00', '35836.94', 'Sent', 'Thank you for your business.', '2026-07-20 01:41:23.087705', '2026-08-22 08:22:23.083351', 22, 10),
(32, 'QT-2026-0031', '2026-08-22', NULL, '0.00', '0.00', '10.50', '-10.50', 'Draft', '', '2026-08-22 09:27:33.122740', '2026-08-22 09:27:33.126445', 1, 1),
(34, 'QT-2026-0034', '2026-08-27', '2026-08-31', '3726.00', '224.77', '0.00', '3950.77', 'Draft', 'sample notes', '2026-08-27 09:27:38.312420', '2026-08-27 09:28:30.508787', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `quote_items`
--

CREATE TABLE `quote_items` (
  `id` bigint(20) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `tax` decimal(5,2) NOT NULL,
  `discount` decimal(5,2) NOT NULL,
  `total` decimal(14,2) NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `quote_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quote_items`
--

INSERT INTO `quote_items` (`id`, `quantity`, `price`, `tax`, `discount`, `total`, `product_id`, `quote_id`) VALUES
(1, '4.00', '2800.00', '12.00', '5.00', '11984.00', 34, 1),
(2, '8.00', '59.00', '12.00', '0.00', '528.64', 17, 2),
(3, '3.00', '1299.00', '5.00', '0.00', '4091.85', 1, 3),
(4, '2.00', '549.00', '10.00', '5.00', '1152.90', 38, 3),
(5, '1.00', '349.00', '12.00', '0.00', '390.88', 16, 3),
(6, '8.00', '299.00', '5.00', '0.00', '2511.60', 11, 4),
(7, '10.00', '749.00', '5.00', '0.00', '7864.50', 44, 4),
(8, '9.00', '649.00', '10.00', '0.00', '6425.10', 21, 5),
(9, '4.00', '24.00', '5.00', '0.00', '100.80', 29, 5),
(10, '8.00', '3200.00', '0.00', '0.00', '25600.00', 35, 6),
(11, '3.00', '999.00', '10.00', '10.00', '2997.00', 37, 6),
(12, '6.00', '1249.00', '5.00', '5.00', '7494.00', 23, 6),
(13, '9.00', '59.00', '12.00', '0.00', '594.72', 17, 7),
(14, '1.00', '15.00', '10.00', '10.00', '15.00', 30, 7),
(15, '3.00', '159.00', '10.00', '0.00', '524.70', 25, 7),
(16, '9.00', '499.00', '8.00', '5.00', '4625.73', 13, 8),
(17, '9.00', '49.00', '8.00', '0.00', '476.28', 50, 8),
(18, '5.00', '329.00', '0.00', '0.00', '1645.00', 40, 8),
(19, '6.00', '89.00', '0.00', '0.00', '534.00', 27, 8),
(20, '2.00', '499.00', '8.00', '0.00', '1077.84', 13, 9),
(21, '7.00', '999.00', '10.00', '5.00', '7342.65', 37, 9),
(22, '10.00', '2800.00', '12.00', '10.00', '28560.00', 34, 9),
(23, '1.00', '59.00', '12.00', '0.00', '66.08', 17, 9),
(24, '1.00', '15.00', '10.00', '0.00', '16.50', 30, 10),
(25, '2.00', '189.00', '5.00', '0.00', '396.90', 47, 11),
(26, '4.00', '2800.00', '12.00', '10.00', '11424.00', 34, 12),
(27, '3.00', '179.00', '8.00', '10.00', '526.26', 41, 12),
(32, '4.00', '239.00', '5.00', '10.00', '908.20', 39, 14),
(33, '4.00', '3200.00', '0.00', '5.00', '12160.00', 35, 14),
(34, '9.00', '49.00', '8.00', '0.00', '476.28', 50, 14),
(35, '1.00', '199.00', '0.00', '0.00', '199.00', 20, 15),
(36, '4.00', '89.00', '5.00', '0.00', '373.80', 15, 15),
(37, '1.00', '249.00', '0.00', '5.00', '236.55', 7, 16),
(38, '3.00', '1249.00', '5.00', '0.00', '3934.35', 23, 16),
(39, '2.00', '189.00', '5.00', '0.00', '396.90', 47, 17),
(40, '3.00', '150.00', '0.00', '5.00', '427.50', 31, 17),
(41, '6.00', '49.00', '8.00', '0.00', '317.52', 50, 18),
(46, '5.00', '19.00', '10.00', '5.00', '99.75', 28, 20),
(47, '3.00', '379.00', '8.00', '0.00', '1227.96', 10, 20),
(48, '3.00', '49.00', '8.00', '0.00', '158.76', 50, 21),
(49, '9.00', '150.00', '0.00', '0.00', '1350.00', 31, 21),
(50, '7.00', '1200.00', '12.00', '10.00', '8568.00', 32, 21),
(51, '9.00', '499.00', '8.00', '10.00', '4401.18', 13, 21),
(52, '7.00', '119.00', '5.00', '5.00', '833.00', 8, 22),
(53, '10.00', '1249.00', '5.00', '5.00', '12490.00', 23, 23),
(54, '3.00', '329.00', '0.00', '5.00', '937.65', 40, 23),
(55, '10.00', '349.00', '12.00', '0.00', '3908.80', 16, 24),
(56, '9.00', '39.00', '10.00', '0.00', '386.10', 48, 25),
(57, '9.00', '1299.00', '12.00', '10.00', '11924.82', 14, 25),
(58, '9.00', '549.00', '10.00', '0.00', '5435.10', 38, 26),
(59, '3.00', '59.00', '12.00', '0.00', '198.24', 17, 26),
(60, '4.00', '149.00', '10.00', '10.00', '596.00', 19, 26),
(61, '1.00', '229.00', '12.00', '5.00', '245.03', 18, 26),
(62, '7.00', '149.00', '10.00', '0.00', '1147.30', 19, 27),
(63, '8.00', '4500.00', '8.00', '10.00', '35280.00', 33, 28),
(64, '1.00', '159.00', '0.00', '0.00', '159.00', 46, 28),
(65, '5.00', '1249.00', '5.00', '0.00', '6557.25', 23, 29),
(66, '5.00', '4500.00', '8.00', '0.00', '24300.00', 33, 29),
(67, '5.00', '179.00', '8.00', '5.00', '921.85', 41, 29),
(68, '10.00', '2800.00', '12.00', '0.00', '31360.00', 34, 30),
(69, '4.00', '89.00', '0.00', '10.00', '320.40', 27, 30),
(70, '7.00', '379.00', '8.00', '0.00', '2865.24', 10, 30),
(71, '6.00', '239.00', '5.00', '5.00', '1434.00', 39, 30),
(76, '1.00', '1299.00', '5.00', '0.00', '1363.95', 1, 34),
(77, '1.00', '1899.00', '8.00', '0.00', '2050.92', 2, 34),
(78, '1.00', '449.00', '0.00', '0.00', '449.00', 3, 34),
(79, '1.00', '79.00', '10.00', '0.00', '86.90', 6, 34);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'Full unrestricted access to the system', '2026-08-22 08:21:23.096327', '2026-08-22 08:21:23.096344'),
(2, 'Admin', 'Administrative access to all modules', '2026-08-22 08:21:23.096937', '2026-08-22 08:21:23.096946'),
(3, 'Manager', 'Team management and reporting access', '2026-08-22 08:21:23.097448', '2026-08-22 08:21:23.097458'),
(4, 'Sales Representative', 'Manages customers, leads and deals', '2026-08-22 08:21:23.097853', '2026-08-25 12:18:21.528215'),
(5, 'Support Staff', 'Handles customer support tickets', '2026-08-22 08:21:23.098184', '2026-08-25 12:17:40.343179');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`id`, `created_at`, `permission_id`, `role_id`) VALUES
(1, '2026-08-22 08:21:23.147749', 1, 1),
(2, '2026-08-22 08:21:23.148172', 2, 1),
(3, '2026-08-22 08:21:23.148549', 3, 1),
(4, '2026-08-22 08:21:23.148945', 4, 1),
(5, '2026-08-22 08:21:23.149313', 5, 1),
(6, '2026-08-22 08:21:23.149662', 6, 1),
(7, '2026-08-22 08:21:23.150157', 7, 1),
(8, '2026-08-22 08:21:23.150614', 8, 1),
(9, '2026-08-22 08:21:23.151399', 9, 1),
(10, '2026-08-22 08:21:23.152105', 10, 1),
(11, '2026-08-22 08:21:23.152686', 11, 1),
(12, '2026-08-22 08:21:23.153158', 12, 1),
(13, '2026-08-22 08:21:23.153628', 13, 1),
(14, '2026-08-22 08:21:23.154064', 14, 1),
(15, '2026-08-22 08:21:23.154518', 15, 1),
(16, '2026-08-22 08:21:23.155009', 16, 1),
(17, '2026-08-22 08:21:23.156204', 17, 1),
(18, '2026-08-22 08:21:23.156850', 18, 1),
(19, '2026-08-22 08:21:23.157333', 19, 1),
(20, '2026-08-22 08:21:23.157974', 20, 1),
(21, '2026-08-22 08:21:23.159191', 21, 1),
(22, '2026-08-22 08:21:23.160209', 22, 1),
(23, '2026-08-22 08:21:23.161178', 23, 1),
(24, '2026-08-22 08:21:23.161760', 24, 1),
(25, '2026-08-22 08:21:23.162213', 25, 1),
(26, '2026-08-22 08:21:23.162598', 26, 1),
(27, '2026-08-22 08:21:23.162945', 27, 1),
(28, '2026-08-22 08:21:23.163266', 28, 1),
(29, '2026-08-22 08:21:23.163598', 29, 1),
(30, '2026-08-22 08:21:23.164073', 30, 1),
(31, '2026-08-22 08:21:23.164554', 31, 1),
(32, '2026-08-22 08:21:23.164904', 32, 1),
(33, '2026-08-22 08:21:23.165233', 33, 1),
(34, '2026-08-22 08:21:23.165546', 34, 1),
(35, '2026-08-22 08:21:23.165862', 35, 1),
(36, '2026-08-22 08:21:23.166232', 36, 1),
(37, '2026-08-22 08:21:23.166679', 37, 1),
(38, '2026-08-22 08:21:23.167549', 38, 1),
(39, '2026-08-22 08:21:23.168184', 39, 1),
(40, '2026-08-22 08:21:23.168608', 40, 1),
(41, '2026-08-22 08:21:23.168942', 41, 1),
(42, '2026-08-22 08:21:23.169306', 42, 1),
(43, '2026-08-22 08:21:23.169650', 43, 1),
(44, '2026-08-22 08:21:23.170009', 44, 1),
(45, '2026-08-22 08:21:23.170346', 45, 1),
(46, '2026-08-22 08:21:23.170725', 46, 1),
(47, '2026-08-22 08:21:23.171122', 47, 1),
(48, '2026-08-22 08:21:23.171726', 48, 1),
(49, '2026-08-22 08:21:23.173757', 49, 1),
(50, '2026-08-22 08:21:23.174494', 50, 1),
(51, '2026-08-22 08:21:23.174905', 51, 1),
(52, '2026-08-22 08:21:23.175319', 52, 1),
(53, '2026-08-22 08:21:23.175637', 53, 1),
(54, '2026-08-22 08:21:23.175941', 54, 1),
(55, '2026-08-22 08:21:23.176276', 55, 1),
(56, '2026-08-22 08:21:23.176633', 56, 1),
(57, '2026-08-22 08:21:23.177022', 57, 1),
(58, '2026-08-22 08:21:23.177360', 58, 1),
(59, '2026-08-22 08:21:23.178064', 59, 1),
(60, '2026-08-22 08:21:23.178477', 60, 1),
(61, '2026-08-22 08:21:23.178862', 61, 1),
(62, '2026-08-22 08:21:23.179224', 62, 1),
(63, '2026-08-22 08:21:23.179651', 63, 1),
(64, '2026-08-22 08:21:23.180046', 64, 1),
(65, '2026-08-22 08:21:23.180386', 65, 1),
(66, '2026-08-22 08:21:23.180875', 66, 1),
(67, '2026-08-22 08:21:23.181259', 67, 1),
(68, '2026-08-22 08:21:23.181587', 68, 1),
(69, '2026-08-22 08:21:23.181907', 69, 1),
(70, '2026-08-22 08:21:23.182230', 70, 1),
(71, '2026-08-22 08:21:23.182549', 71, 1),
(72, '2026-08-22 08:21:23.182862', 72, 1),
(73, '2026-08-22 08:21:23.183172', 73, 1),
(74, '2026-08-22 08:21:23.183462', 74, 1),
(75, '2026-08-22 08:21:23.183761', 75, 1),
(76, '2026-08-22 08:21:23.184062', 76, 1),
(77, '2026-08-22 08:21:23.184385', 77, 1),
(78, '2026-08-22 08:21:23.186324', 78, 1),
(79, '2026-08-22 08:21:23.187637', 79, 1),
(80, '2026-08-22 08:21:23.189038', 80, 1),
(81, '2026-08-22 08:21:23.189747', 81, 1),
(82, '2026-08-22 08:21:23.190233', 82, 1),
(83, '2026-08-22 08:21:23.190843', 83, 1),
(84, '2026-08-22 08:21:23.192211', 84, 1),
(85, '2026-08-22 08:21:23.203835', 85, 1),
(86, '2026-08-22 08:21:23.226401', 86, 1),
(87, '2026-08-22 08:21:23.238209', 87, 1),
(88, '2026-08-22 08:21:23.240431', 88, 1),
(89, '2026-08-22 08:21:23.241762', 89, 1),
(90, '2026-08-22 08:21:23.242752', 90, 1),
(91, '2026-08-22 08:21:23.243299', 91, 1),
(92, '2026-08-22 08:21:23.243809', 92, 1),
(93, '2026-08-22 08:21:23.244764', 93, 1),
(94, '2026-08-22 08:21:23.245856', 94, 1),
(95, '2026-08-22 08:21:23.246965', 95, 1),
(96, '2026-08-22 08:21:23.248055', 96, 1),
(97, '2026-08-22 08:21:23.249253', 97, 1),
(98, '2026-08-22 08:21:23.249992', 98, 1),
(99, '2026-08-22 08:21:23.251322', 99, 1),
(100, '2026-08-22 08:21:23.254853', 100, 1),
(101, '2026-08-22 08:21:23.256332', 1, 2),
(102, '2026-08-22 08:21:23.256948', 5, 2),
(103, '2026-08-22 08:21:23.257605', 9, 2),
(104, '2026-08-22 08:21:23.258522', 13, 2),
(105, '2026-08-22 08:21:23.259042', 17, 2),
(106, '2026-08-22 08:21:23.259522', 21, 2),
(107, '2026-08-22 08:21:23.260146', 25, 2),
(108, '2026-08-22 08:21:23.261192', 29, 2),
(109, '2026-08-22 08:21:23.262294', 33, 2),
(110, '2026-08-22 08:21:23.262704', 37, 2),
(111, '2026-08-22 08:21:23.263058', 41, 2),
(112, '2026-08-22 08:21:23.263413', 45, 2),
(113, '2026-08-22 08:21:23.263823', 49, 2),
(114, '2026-08-22 08:21:23.264233', 53, 2),
(115, '2026-08-22 08:21:23.265224', 57, 2),
(116, '2026-08-22 08:21:23.266734', 61, 2),
(117, '2026-08-22 08:21:23.268672', 65, 2),
(118, '2026-08-22 08:21:23.269474', 69, 2),
(119, '2026-08-22 08:21:23.269981', 73, 2),
(120, '2026-08-22 08:21:23.270369', 77, 2),
(121, '2026-08-22 08:21:23.270959', 81, 2),
(122, '2026-08-22 08:21:23.271533', 85, 2),
(123, '2026-08-22 08:21:23.271917', 89, 2),
(124, '2026-08-22 08:21:23.272526', 93, 2),
(125, '2026-08-22 08:21:23.273485', 97, 2),
(126, '2026-08-22 08:21:23.274912', 2, 2),
(127, '2026-08-22 08:21:23.275834', 6, 2),
(128, '2026-08-22 08:21:23.276453', 10, 2),
(129, '2026-08-22 08:21:23.276968', 14, 2),
(130, '2026-08-22 08:21:23.277364', 18, 2),
(131, '2026-08-22 08:21:23.277735', 22, 2),
(132, '2026-08-22 08:21:23.278518', 26, 2),
(133, '2026-08-22 08:21:23.279798', 30, 2),
(134, '2026-08-22 08:21:23.280254', 34, 2),
(135, '2026-08-22 08:21:23.280569', 38, 2),
(136, '2026-08-22 08:21:23.280870', 42, 2),
(137, '2026-08-22 08:21:23.281197', 46, 2),
(138, '2026-08-22 08:21:23.281558', 50, 2),
(139, '2026-08-22 08:21:23.281928', 54, 2),
(140, '2026-08-22 08:21:23.282266', 58, 2),
(141, '2026-08-22 08:21:23.282647', 62, 2),
(142, '2026-08-22 08:21:23.283022', 66, 2),
(143, '2026-08-22 08:21:23.283362', 70, 2),
(144, '2026-08-22 08:21:23.283788', 74, 2),
(145, '2026-08-22 08:21:23.284277', 78, 2),
(146, '2026-08-22 08:21:23.284817', 82, 2),
(147, '2026-08-22 08:21:23.285485', 86, 2),
(148, '2026-08-22 08:21:23.292770', 90, 2),
(149, '2026-08-22 08:21:23.297415', 94, 2),
(150, '2026-08-22 08:21:23.298661', 98, 2),
(151, '2026-08-22 08:21:23.299386', 3, 2),
(152, '2026-08-22 08:21:23.300039', 7, 2),
(153, '2026-08-22 08:21:23.300642', 11, 2),
(154, '2026-08-22 08:21:23.301319', 15, 2),
(155, '2026-08-22 08:21:23.302508', 19, 2),
(156, '2026-08-22 08:21:23.302926', 23, 2),
(157, '2026-08-22 08:21:23.303303', 27, 2),
(158, '2026-08-22 08:21:23.303670', 31, 2),
(159, '2026-08-22 08:21:23.303998', 35, 2),
(160, '2026-08-22 08:21:23.304337', 39, 2),
(161, '2026-08-22 08:21:23.304734', 43, 2),
(162, '2026-08-22 08:21:23.305691', 47, 2),
(163, '2026-08-22 08:21:23.306877', 51, 2),
(164, '2026-08-22 08:21:23.307460', 55, 2),
(165, '2026-08-22 08:21:23.308582', 59, 2),
(166, '2026-08-22 08:21:23.309414', 63, 2),
(167, '2026-08-22 08:21:23.309764', 67, 2),
(168, '2026-08-22 08:21:23.310119', 71, 2),
(169, '2026-08-22 08:21:23.310470', 75, 2),
(170, '2026-08-22 08:21:23.310890', 79, 2),
(171, '2026-08-22 08:21:23.311490', 83, 2),
(172, '2026-08-22 08:21:23.312170', 87, 2),
(173, '2026-08-22 08:21:23.312719', 91, 2),
(174, '2026-08-22 08:21:23.313247', 95, 2),
(175, '2026-08-22 08:21:23.314365', 99, 2),
(176, '2026-08-22 08:21:23.315451', 4, 2),
(177, '2026-08-22 08:21:23.316681', 8, 2),
(178, '2026-08-22 08:21:23.317593', 12, 2),
(179, '2026-08-22 08:21:23.319214', 16, 2),
(180, '2026-08-22 08:21:23.320875', 20, 2),
(181, '2026-08-22 08:21:23.321595', 24, 2),
(182, '2026-08-22 08:21:23.322002', 28, 2),
(183, '2026-08-22 08:21:23.322356', 32, 2),
(184, '2026-08-22 08:21:23.323314', 36, 2),
(185, '2026-08-22 08:21:23.324196', 40, 2),
(186, '2026-08-22 08:21:23.325744', 44, 2),
(187, '2026-08-22 08:21:23.327460', 48, 2),
(188, '2026-08-22 08:21:23.328597', 52, 2),
(189, '2026-08-22 08:21:23.330809', 56, 2),
(190, '2026-08-22 08:21:23.334081', 60, 2),
(191, '2026-08-22 08:21:23.336124', 64, 2),
(192, '2026-08-22 08:21:23.337092', 68, 2),
(193, '2026-08-22 08:21:23.338375', 72, 2),
(194, '2026-08-22 08:21:23.339560', 76, 2),
(195, '2026-08-22 08:21:23.340689', 80, 2),
(196, '2026-08-22 08:21:23.341534', 84, 2),
(197, '2026-08-22 08:21:23.342106', 88, 2),
(198, '2026-08-22 08:21:23.342522', 92, 2),
(199, '2026-08-22 08:21:23.342881', 96, 2),
(200, '2026-08-22 08:21:23.343195', 100, 2),
(201, '2026-08-22 08:21:23.343497', 1, 3),
(202, '2026-08-22 08:21:23.343860', 5, 3),
(203, '2026-08-22 08:21:23.344194', 9, 3),
(204, '2026-08-22 08:21:23.344538', 13, 3),
(205, '2026-08-22 08:21:23.345511', 17, 3),
(206, '2026-08-22 08:21:23.346924', 21, 3),
(207, '2026-08-22 08:21:23.347569', 25, 3),
(208, '2026-08-22 08:21:23.349411', 29, 3),
(209, '2026-08-22 08:21:23.349762', 33, 3),
(210, '2026-08-22 08:21:23.350091', 37, 3),
(211, '2026-08-22 08:21:23.350502', 41, 3),
(212, '2026-08-22 08:21:23.350941', 45, 3),
(213, '2026-08-22 08:21:23.351304', 49, 3),
(214, '2026-08-22 08:21:23.351714', 53, 3),
(215, '2026-08-22 08:21:23.352155', 57, 3),
(216, '2026-08-22 08:21:23.352557', 61, 3),
(217, '2026-08-22 08:21:23.353204', 65, 3),
(218, '2026-08-22 08:21:23.353927', 69, 3),
(219, '2026-08-22 08:21:23.354912', 73, 3),
(220, '2026-08-22 08:21:23.356150', 77, 3),
(221, '2026-08-22 08:21:23.357192', 81, 3),
(222, '2026-08-22 08:21:23.357978', 85, 3),
(223, '2026-08-22 08:21:23.359310', 89, 3),
(224, '2026-08-22 08:21:23.360607', 93, 3),
(225, '2026-08-22 08:21:23.361592', 97, 3),
(226, '2026-08-22 08:21:23.362200', 6, 3),
(227, '2026-08-22 08:21:23.362643', 10, 3),
(228, '2026-08-22 08:21:23.363061', 14, 3),
(229, '2026-08-22 08:21:23.363451', 18, 3),
(230, '2026-08-22 08:21:23.364121', 22, 3),
(231, '2026-08-22 08:21:23.364613', 26, 3),
(232, '2026-08-22 08:21:23.364980', 30, 3),
(233, '2026-08-22 08:21:23.365326', 42, 3),
(234, '2026-08-22 08:21:23.365714', 46, 3),
(235, '2026-08-22 08:21:23.366145', 50, 3),
(236, '2026-08-22 08:21:23.366525', 54, 3),
(237, '2026-08-22 08:21:23.366880', 7, 3),
(238, '2026-08-22 08:21:23.367596', 11, 3),
(239, '2026-08-22 08:21:23.368173', 15, 3),
(240, '2026-08-22 08:21:23.368589', 19, 3),
(241, '2026-08-22 08:21:23.368939', 23, 3),
(242, '2026-08-22 08:21:23.369351', 27, 3),
(243, '2026-08-22 08:21:23.369758', 31, 3),
(244, '2026-08-22 08:21:23.370116', 43, 3),
(245, '2026-08-22 08:21:23.370539', 47, 3),
(246, '2026-08-22 08:21:23.371092', 51, 3),
(247, '2026-08-22 08:21:23.375495', 55, 3),
(293, '2026-08-25 12:17:40.352522', 9, 5),
(294, '2026-08-25 12:17:40.352543', 7, 5),
(295, '2026-08-25 12:17:40.352550', 5, 5),
(296, '2026-08-25 12:17:40.352555', 1, 5),
(297, '2026-08-25 12:17:40.352561', 29, 5),
(298, '2026-08-25 12:17:40.352566', 85, 5),
(299, '2026-08-25 12:17:40.352571', 33, 5),
(300, '2026-08-25 12:17:40.352578', 77, 5),
(301, '2026-08-25 12:17:40.352583', 27, 5),
(302, '2026-08-25 12:17:40.352588', 25, 5),
(303, '2026-08-25 12:17:40.352593', 54, 5),
(304, '2026-08-25 12:17:40.352598', 55, 5),
(305, '2026-08-25 12:17:40.352604', 53, 5),
(339, '2026-08-25 12:18:21.536678', 37, 4),
(340, '2026-08-25 12:18:21.536703', 10, 4),
(341, '2026-08-25 12:18:21.536710', 11, 4),
(342, '2026-08-25 12:18:21.536716', 9, 4),
(343, '2026-08-25 12:18:21.536721', 6, 4),
(344, '2026-08-25 12:18:21.536727', 7, 4),
(345, '2026-08-25 12:18:21.536732', 5, 4),
(346, '2026-08-25 12:18:21.536737', 1, 4),
(347, '2026-08-25 12:18:21.536742', 18, 4),
(348, '2026-08-25 12:18:21.536747', 19, 4),
(349, '2026-08-25 12:18:21.536753', 17, 4),
(350, '2026-08-25 12:18:21.536758', 46, 4),
(351, '2026-08-25 12:18:21.536763', 45, 4),
(352, '2026-08-25 12:18:21.536768', 14, 4),
(353, '2026-08-25 12:18:21.536774', 15, 4),
(354, '2026-08-25 12:18:21.536779', 13, 4),
(355, '2026-08-25 12:18:21.536785', 30, 4),
(356, '2026-08-25 12:18:21.536790', 31, 4),
(357, '2026-08-25 12:18:21.536795', 29, 4),
(358, '2026-08-25 12:18:21.536800', 85, 4),
(359, '2026-08-25 12:18:21.536805', 50, 4),
(360, '2026-08-25 12:18:21.536810', 49, 4),
(361, '2026-08-25 12:18:21.536815', 21, 4),
(362, '2026-08-25 12:18:21.536820', 33, 4),
(363, '2026-08-25 12:18:21.536826', 42, 4),
(364, '2026-08-25 12:18:21.536831', 43, 4),
(365, '2026-08-25 12:18:21.536836', 41, 4),
(366, '2026-08-25 12:18:21.536841', 77, 4),
(367, '2026-08-25 12:18:21.536847', 26, 4),
(368, '2026-08-25 12:18:21.536852', 27, 4),
(369, '2026-08-25 12:18:21.536858', 25, 4),
(370, '2026-08-25 12:18:21.536863', 53, 4);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) NOT NULL,
  `company_name` varchar(150) NOT NULL,
  `company_email` varchar(100) NOT NULL,
  `company_phone` varchar(30) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(80) NOT NULL,
  `state` varchar(80) NOT NULL,
  `country` varchar(80) NOT NULL,
  `postal_code` varchar(20) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `timezone` varchar(50) NOT NULL,
  `language` varchar(10) NOT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `smtp_host` varchar(150) NOT NULL,
  `smtp_port` varchar(10) NOT NULL,
  `smtp_username` varchar(150) NOT NULL,
  `smtp_password` varchar(150) NOT NULL,
  `smtp_encryption` varchar(10) NOT NULL,
  `theme` varchar(10) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `company_name`, `company_email`, `company_phone`, `address`, `city`, `state`, `country`, `postal_code`, `currency`, `timezone`, `language`, `logo`, `smtp_host`, `smtp_port`, `smtp_username`, `smtp_password`, `smtp_encryption`, `theme`, `created_at`, `updated_at`) VALUES
(1, 'TechNova Solutions Inc.', 'info@technova.com', '+1 (555) 123-4567', '452 Commerce Way', 'Austin', 'TX', 'USA', '78701', 'USD', 'America/Chicago', 'English', '', 'smtp.technova.com', '587', 'crm@technova.com', 'secret123', 'TLS', 'light', '2026-08-22 08:21:23.090023', '2026-08-25 12:58:02.767328');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `priority` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL,
  `due_date` date DEFAULT NULL,
  `reminder_date` date DEFAULT NULL,
  `completed_at` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `assigned_to` bigint(20) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `deal_id` bigint(20) DEFAULT NULL,
  `lead_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `priority`, `status`, `due_date`, `reminder_date`, `completed_at`, `created_at`, `updated_at`, `assigned_to`, `customer_id`, `deal_id`, `lead_id`) VALUES
(1, 'Collect signed documents', 'Auto-generated task from CRM seeding.', 'Low', 'Completed', '2026-08-23', '2026-08-22', '2026-08-27 09:50:44.803994', '2026-08-22 08:22:22.848163', '2026-08-27 09:50:44.804312', 23, 11, NULL, NULL),
(2, 'Technical deep-dive session', 'Auto-generated task from CRM seeding.', 'Low', 'Pending', '2026-07-31', '2026-07-29', NULL, '2026-08-22 08:22:22.848170', '2026-08-15 23:36:22.866684', 14, 38, 46, NULL),
(3, 'Technical deep-dive session', 'Auto-generated task from CRM seeding.', 'Low', 'Completed', '2026-08-08', '2026-08-07', '2026-08-19 08:22:22.844276', '2026-08-22 08:22:22.848175', '2026-08-15 23:36:22.866684', 50, 4, 7, NULL),
(4, 'Technical deep-dive session', 'Auto-generated task from CRM seeding.', 'Low', 'Completed', '2026-08-16', '2026-08-14', '2026-08-25 08:48:06.708667', '2026-08-22 08:22:22.848181', '2026-08-25 08:48:06.708931', 8, 31, 44, NULL),
(5, 'Update account information', 'Auto-generated task from CRM seeding.', 'Urgent', 'In Progress', '2026-07-29', '2026-07-28', NULL, '2026-08-22 08:22:22.848186', '2026-08-15 23:36:22.866684', 43, 40, 7, NULL),
(6, 'Schedule product demo', 'Auto-generated task from CRM seeding.', 'Medium', 'Pending', '2026-09-11', '2026-09-08', NULL, '2026-08-22 08:22:22.848192', '2026-08-15 23:36:22.866684', 7, 39, NULL, 17),
(7, 'Schedule product demo', 'Auto-generated task from CRM seeding.', 'Low', 'In Progress', '2026-08-02', '2026-08-01', NULL, '2026-08-22 08:22:22.848197', '2026-08-15 23:36:22.866684', 3, 14, NULL, NULL),
(8, 'Update account information', 'Auto-generated task from CRM seeding.', 'Low', 'Completed', '2026-09-19', '2026-09-16', '2026-08-19 08:22:22.844461', '2026-08-22 08:22:22.848203', '2026-08-15 23:36:22.866684', 8, NULL, 6, NULL),
(9, 'Prepare quotation', 'Auto-generated task from CRM seeding.', 'Medium', 'Cancelled', '2026-09-02', '2026-08-31', NULL, '2026-08-22 08:22:22.848208', '2026-08-15 23:36:22.866684', 15, 19, 12, 4),
(10, 'Prepare quotation', 'Auto-generated task from CRM seeding.', 'Medium', 'Completed', '2026-08-12', '2026-08-09', '2026-08-02 08:22:22.844534', '2026-08-22 08:22:22.848214', '2026-08-15 23:36:22.866684', 28, 7, NULL, NULL),
(11, 'Send proposal document', 'Auto-generated task from CRM seeding.', 'Low', 'Pending', '2026-08-14', '2026-08-12', NULL, '2026-08-22 08:22:22.848220', '2026-08-15 23:36:22.866684', 29, NULL, 22, 47),
(12, 'Collect signed documents', 'Auto-generated task from CRM seeding.', 'Medium', 'In Progress', '2026-08-21', '2026-08-20', NULL, '2026-08-22 08:22:22.848225', '2026-08-15 23:36:22.866684', 18, NULL, NULL, NULL),
(13, 'Quarterly business review', 'Auto-generated task from CRM seeding.', 'Urgent', 'Pending', '2026-09-07', '2026-09-04', NULL, '2026-08-22 08:22:22.848231', '2026-08-15 23:36:22.866684', 4, NULL, 38, NULL),
(14, 'Renewal discussion', 'Auto-generated task from CRM seeding.', 'Medium', 'In Progress', '2026-08-31', '2026-08-29', NULL, '2026-08-22 08:22:22.848236', '2026-08-15 23:36:22.866684', 25, 40, NULL, 44),
(15, 'Update account information', 'Auto-generated task from CRM seeding.', 'Urgent', 'Cancelled', '2026-07-30', '2026-07-27', NULL, '2026-08-22 08:22:22.848242', '2026-08-15 23:36:22.866684', 27, 5, 44, 21),
(16, 'Renewal discussion', 'Auto-generated task from CRM seeding.', 'Medium', 'In Progress', '2026-09-03', '2026-09-01', NULL, '2026-08-22 08:22:22.848247', '2026-08-15 23:36:22.866684', 22, 45, 43, NULL),
(17, 'Prepare quotation', 'Auto-generated task from CRM seeding.', 'Medium', 'Pending', '2026-09-04', '2026-09-01', NULL, '2026-08-22 08:22:22.848253', '2026-08-15 23:36:22.866684', 42, 36, NULL, NULL),
(18, 'Onboarding kickoff', 'Auto-generated task from CRM seeding.', 'Medium', 'Completed', '2026-09-15', '2026-09-14', '2026-08-06 08:22:22.844799', '2026-08-22 08:22:22.848258', '2026-08-15 23:36:22.866684', 32, NULL, NULL, 32),
(19, 'Quarterly business review', 'Auto-generated task from CRM seeding.', 'Low', 'Pending', '2026-09-02', '2026-08-31', NULL, '2026-08-22 08:22:22.848264', '2026-08-15 23:36:22.866684', 25, 16, NULL, 29),
(20, 'Prepare quotation', 'Auto-generated task from CRM seeding.', 'Low', 'In Progress', '2026-07-30', '2026-07-27', NULL, '2026-08-22 08:22:22.848269', '2026-08-15 23:36:22.866684', 32, 2, 36, 27),
(21, 'Quarterly business review', 'Auto-generated task from CRM seeding.', 'Medium', 'Cancelled', '2026-09-01', '2026-08-30', NULL, '2026-08-22 08:22:22.848275', '2026-08-15 23:36:22.866684', 20, NULL, NULL, NULL),
(22, 'Resolve billing question', 'Auto-generated task from CRM seeding.', 'High', 'Completed', '2026-09-13', '2026-09-10', '2026-08-11 08:22:22.844931', '2026-08-22 08:22:22.848280', '2026-08-15 23:36:22.866684', 15, NULL, NULL, NULL),
(23, 'Contract review', 'Auto-generated task from CRM seeding.', 'Urgent', 'Completed', '2026-07-30', '2026-07-27', '2026-08-11 08:22:22.844967', '2026-08-22 08:22:22.848286', '2026-08-15 23:36:22.866684', 7, 15, NULL, 23),
(24, 'Contract review', 'Auto-generated task from CRM seeding.', 'Urgent', 'Completed', '2026-07-25', '2026-07-24', '2026-08-16 08:22:22.845005', '2026-08-22 08:22:22.848292', '2026-08-15 23:36:22.866684', 11, 46, NULL, NULL),
(25, 'Prepare quotation', 'Auto-generated task from CRM seeding.', 'Urgent', 'Completed', '2026-09-15', '2026-09-14', '2026-08-27 09:50:50.378663', '2026-08-22 08:22:22.848297', '2026-08-27 09:50:50.378797', 26, 51, 27, 22),
(26, 'Prepare quotation', 'Auto-generated task from CRM seeding.', 'Urgent', 'Completed', '2026-08-20', '2026-08-18', '2026-08-04 08:22:22.845075', '2026-08-22 08:22:22.848303', '2026-08-15 23:36:22.866684', 30, 33, 48, 32),
(27, 'Follow-up call', 'Auto-generated task from CRM seeding.', 'High', 'In Progress', '2026-08-24', '2026-08-21', NULL, '2026-08-22 08:22:22.848308', '2026-08-15 23:36:22.866684', 50, NULL, 9, 38),
(28, 'Renewal discussion', 'Auto-generated task from CRM seeding.', 'Medium', 'Completed', '2026-09-17', '2026-09-15', '2026-08-10 08:22:22.845143', '2026-08-22 08:22:22.848314', '2026-08-15 23:36:22.866684', 21, 25, NULL, NULL),
(29, 'Renewal discussion', 'Auto-generated task from CRM seeding.', 'Urgent', 'Cancelled', '2026-08-10', '2026-08-08', NULL, '2026-08-22 08:22:22.848319', '2026-08-15 23:36:22.866684', 29, NULL, NULL, 39),
(30, 'Renewal discussion', 'Auto-generated task from CRM seeding.', 'Medium', 'Completed', '2026-08-27', '2026-08-24', '2026-08-11 08:22:22.845210', '2026-08-22 08:22:22.848325', '2026-08-15 23:36:22.866684', 21, 36, 40, NULL),
(31, 'Onboarding kickoff', 'Auto-generated task from CRM seeding.', 'Low', 'Cancelled', '2026-07-31', '2026-07-29', NULL, '2026-08-22 08:22:22.848330', '2026-08-15 23:36:22.866684', 46, 12, NULL, NULL),
(32, 'Update account information', 'Auto-generated task from CRM seeding.', 'Medium', 'In Progress', '2026-08-29', '2026-08-27', NULL, '2026-08-22 08:22:22.848336', '2026-08-15 23:36:22.866684', 37, NULL, NULL, NULL),
(33, 'Send proposal document', 'Auto-generated task from CRM seeding.', 'Medium', 'Completed', '2026-08-25', '2026-08-22', '2026-08-14 08:22:22.845308', '2026-08-22 08:22:22.848341', '2026-08-15 23:36:22.866684', 7, 10, 49, 4),
(34, 'Follow-up call', 'Auto-generated task from CRM seeding.', 'Urgent', 'Pending', '2026-07-26', '2026-07-23', NULL, '2026-08-22 08:22:22.848347', '2026-08-15 23:36:22.866684', 45, 14, 29, NULL),
(35, 'Renewal discussion', 'Auto-generated task from CRM seeding.', 'Medium', 'Completed', '2026-09-16', '2026-09-13', '2026-08-21 08:22:22.845375', '2026-08-22 08:22:22.848352', '2026-08-15 23:36:22.866684', 15, 36, NULL, NULL),
(36, 'Update account information', 'Auto-generated task from CRM seeding.', 'Low', 'Cancelled', '2026-08-16', '2026-08-15', NULL, '2026-08-22 08:22:22.848358', '2026-08-15 23:36:22.866684', 27, NULL, NULL, NULL),
(37, 'Schedule product demo', 'Auto-generated task from CRM seeding.', 'Medium', 'Completed', '2026-08-04', '2026-08-01', '2026-08-05 08:22:22.845443', '2026-08-22 08:22:22.848363', '2026-08-15 23:36:22.866684', 40, NULL, NULL, NULL),
(38, 'Follow-up call', 'Auto-generated task from CRM seeding.', 'Medium', 'Completed', '2026-08-04', '2026-08-03', '2026-08-06 08:22:22.845479', '2026-08-22 08:22:22.848369', '2026-08-15 23:36:22.866684', 50, 13, NULL, 12),
(39, 'Prepare quotation', 'Auto-generated task from CRM seeding.', 'Medium', 'Pending', '2026-07-25', '2026-07-23', NULL, '2026-08-22 08:22:22.848375', '2026-08-15 23:36:22.866684', 28, 17, NULL, 38),
(40, 'Technical deep-dive session', 'Auto-generated task from CRM seeding.', 'Urgent', 'Completed', '2026-08-01', '2026-07-29', '2026-08-13 08:22:22.845548', '2026-08-22 08:22:22.848380', '2026-08-15 23:36:22.866684', 3, 21, NULL, NULL),
(41, 'Send proposal document', 'Auto-generated task from CRM seeding.', 'Urgent', 'In Progress', '2026-08-28', '2026-08-27', NULL, '2026-08-22 08:22:22.848386', '2026-08-15 23:36:22.866684', 36, 51, NULL, NULL),
(42, 'Technical deep-dive session', 'Auto-generated task from CRM seeding.', 'Medium', 'Completed', '2026-08-02', '2026-07-31', '2026-08-11 08:22:22.845618', '2026-08-22 08:22:22.848391', '2026-08-15 23:36:22.866684', 27, 26, NULL, 15),
(43, 'Technical deep-dive session', 'Auto-generated task from CRM seeding.', 'Low', 'Pending', '2026-09-21', '2026-09-20', NULL, '2026-08-22 08:22:22.848397', '2026-08-15 23:36:22.866684', 49, 31, NULL, NULL),
(44, 'Prepare quotation', 'Auto-generated task from CRM seeding.', 'Medium', 'Completed', '2026-08-20', '2026-08-18', '2026-08-19 08:22:22.845683', '2026-08-22 08:22:22.848402', '2026-08-15 23:36:22.866684', 16, NULL, NULL, NULL),
(45, 'Update account information', 'Auto-generated task from CRM seeding.', 'High', 'In Progress', '2026-08-26', '2026-08-24', NULL, '2026-08-22 08:22:22.848408', '2026-08-15 23:36:22.866684', 47, 34, NULL, NULL),
(46, 'Update account information', 'Auto-generated task from CRM seeding.', 'Urgent', 'Pending', '2026-09-18', '2026-09-17', NULL, '2026-08-22 08:22:22.848413', '2026-08-15 23:36:22.866684', 42, 33, 50, 7),
(47, 'Follow-up call', 'Auto-generated task from CRM seeding.', 'Medium', 'Completed', '2026-08-05', '2026-08-02', '2026-08-09 08:22:22.845782', '2026-08-22 08:22:22.848419', '2026-08-15 23:36:22.866684', 43, 14, NULL, NULL),
(48, 'Follow-up call', 'Auto-generated task from CRM seeding.', 'Low', 'Completed', '2026-09-21', '2026-09-20', '2026-08-17 08:22:22.845818', '2026-08-22 08:22:22.848424', '2026-08-15 23:36:22.866684', 5, 10, NULL, 46),
(49, 'Quarterly business review', 'Auto-generated task from CRM seeding.', 'High', 'Completed', '2026-08-27', '2026-08-25', '2026-08-12 08:22:22.845853', '2026-08-22 08:22:22.848430', '2026-08-15 23:36:22.866684', 5, 15, NULL, NULL),
(50, 'Resolve billing question', 'Auto-generated task from CRM seeding.', 'Low', 'Pending', '2026-09-04', '2026-09-01', NULL, '2026-08-22 08:22:22.848435', '2026-08-15 23:36:22.866684', 8, 42, 48, NULL),
(51, 'Contract review', 'Auto-generated task from CRM seeding.', 'High', 'Completed', '2026-08-14', '2026-08-12', '2026-08-10 08:22:22.845920', '2026-08-22 08:22:22.848441', '2026-08-15 23:36:22.866684', 33, 51, NULL, NULL),
(52, 'Update account information', 'Auto-generated task from CRM seeding.', 'Medium', 'Completed', '2026-07-24', '2026-07-21', '2026-08-18 08:22:22.845955', '2026-08-22 08:22:22.848446', '2026-08-15 23:36:22.866684', 31, 15, NULL, 26),
(53, 'Follow-up call', 'Auto-generated task from CRM seeding.', 'Low', 'Pending', '2026-09-17', '2026-09-16', NULL, '2026-08-22 08:22:22.848452', '2026-08-15 23:36:22.866684', 47, 1, NULL, NULL),
(54, 'Renewal discussion', 'Auto-generated task from CRM seeding.', 'Medium', 'In Progress', '2026-08-17', '2026-08-16', NULL, '2026-08-22 08:22:22.848457', '2026-08-15 23:36:22.866684', 35, 6, NULL, NULL),
(55, 'Technical deep-dive session', 'Auto-generated task from CRM seeding.', 'Urgent', 'In Progress', '2026-09-02', '2026-09-01', NULL, '2026-08-22 08:22:22.848463', '2026-08-15 23:36:22.866684', 33, 12, 12, 17),
(56, 'Schedule product demo', 'Auto-generated task from CRM seeding.', 'Urgent', 'Completed', '2026-09-20', '2026-09-18', '2026-08-12 08:22:22.846086', '2026-08-22 08:22:22.848468', '2026-08-15 23:36:22.866684', 36, 36, 7, 43),
(57, 'Onboarding kickoff', 'Auto-generated task from CRM seeding.', 'High', 'In Progress', '2026-09-03', '2026-09-01', NULL, '2026-08-22 08:22:22.848474', '2026-08-15 23:36:22.866684', 42, 19, NULL, NULL),
(58, 'Onboarding kickoff', 'Auto-generated task from CRM seeding.', 'High', 'Completed', '2026-09-03', '2026-09-02', '2026-08-27 09:52:15.225365', '2026-08-22 08:22:22.848479', '2026-08-27 09:52:15.225563', 20, 10, NULL, NULL),
(59, 'Send proposal document', 'Auto-generated task from CRM seeding.', 'Medium', 'Pending', '2026-08-07', '2026-08-05', NULL, '2026-08-22 08:22:22.848485', '2026-08-15 23:36:22.866684', 15, 42, NULL, NULL),
(60, 'Contract review', 'Auto-generated task from CRM seeding.', 'Medium', 'In Progress', '2026-08-14', '2026-08-11', NULL, '2026-08-22 08:22:22.848490', '2026-08-15 23:36:22.866684', 50, 36, NULL, 42),
(61, 'Send proposal document', 'sample Send proposal document', 'Medium', 'Pending', '2026-08-27', '2026-08-29', NULL, '2026-08-27 09:50:07.919177', '2026-08-27 09:52:08.928021', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) NOT NULL,
  `ticket_number` varchar(30) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `priority` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `assigned_to` bigint(20) DEFAULT NULL,
  `customer_id` bigint(20) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `ticket_number`, `subject`, `priority`, `status`, `description`, `created_at`, `updated_at`, `assigned_to`, `customer_id`, `category_id`) VALUES
(1, 'TKT-00001', 'Change primary contact person', 'Urgent', 'Closed', 'Customer reported this issue through the support portal.', '2026-08-22 08:22:23.297720', '2026-08-12 05:58:23.313267', 37, 48, 6),
(2, 'TKT-00002', 'Export data to Excel fails', 'Low', 'In Progress', 'Customer reported this issue through the support portal.', '2026-08-22 08:22:23.297728', '2026-08-12 05:58:23.313267', 7, 45, 3),
(3, 'TKT-00003', 'Invoice PDF not downloading', 'High', 'Open', 'Customer reported this issue through the support portal.', '2026-08-22 08:22:23.297733', '2026-08-12 05:58:23.313267', 5, 27, 5),
(4, 'TKT-00004', 'Mobile app crash on startup', 'Low', 'In Progress', 'Customer reported this issue through the support portal.', '2026-08-22 08:22:23.297737', '2026-08-12 05:58:23.313267', 3, 13, 1),
(5, 'TKT-00005', 'Invoice PDF not downloading', 'Low', 'Closed', 'Customer reported this issue through the support portal.', '2026-08-22 08:22:23.297741', '2026-08-12 05:58:23.313267', 5, 14, 6),
(6, 'TKT-00006', 'Payment method declined', 'Medium', 'In Progress', 'Customer reported this issue through the support portal.', '2026-08-22 08:22:23.297746', '2026-08-12 05:58:23.313267', 7, 49, 1),
(7, 'TKT-00007', 'Integration with email broken', 'High', 'Closed', 'Customer reported this issue through the support portal.', '2026-08-22 08:22:23.297750', '2026-08-12 05:58:23.313267', 44, 5, 3),
(8, 'TKT-00008', 'API returns 500 error', 'Low', 'Closed', 'Customer reported this issue through the support portal.', '2026-08-22 08:22:23.297754', '2026-08-12 05:58:23.313267', 7, 17, 1),
(9, 'TKT-00009', 'Add more team members', 'Low', 'Closed', 'Customer reported this issue through the support portal.', '2026-08-22 08:22:23.297758', '2026-08-12 05:58:23.313267', 38, 17, 2),
(10, 'TKT-00010', 'Request feature: dark mode', 'Urgent', 'In Progress', 'Customer reported this issue through the support portal.', '2026-08-22 08:22:23.297763', '2026-08-12 05:58:23.313267', 46, 42, 1),
(11, 'TKT-00011', 'API returns 500 error', 'Low', 'On Hold', 'Customer reported this issue through the support portal.', '2026-08-22 08:22:23.297767', '2026-08-12 05:58:23.313267', 44, 7, 6),
(12, 'TKT-00012', 'Report shows wrong totals', 'High', 'On Hold', 'Customer reported this issue through the support portal.', '2026-08-22 08:22:23.297771', '2026-08-12 05:58:23.313267', 44, 17, 1),
(13, 'TKT-00013', 'Request feature: dark mode', 'Medium', 'Open', 'Customer reported this issue through the support portal.', '2026-08-22 08:22:23.297775', '2026-08-12 05:58:23.313267', 42, 3, 3),
(14, 'TKT-00014', 'Password reset link expired', 'High', 'Open', 'Customer reported this issue through the support portal.', '2026-08-22 08:22:23.297780', '2026-08-12 05:58:23.313267', 46, 46, 4),
(15, 'TKT-00015', 'Password reset link expired', 'High', 'Closed', 'Customer reported this issue through the support portal.', '2026-08-22 08:22:23.297784', '2026-08-12 05:58:23.313267', 37, 5, 1),
(16, 'TKT-00016', 'API returns 500 error', 'High', 'Closed', 'Customer reported this issue through the support portal.', '2026-08-22 08:22:23.297788', '2026-08-12 05:58:23.313267', 40, 23, 6),
(17, 'TKT-00017', 'Need higher storage quota', 'High', 'Open', 'Customer reported this issue through the support portal.', '2026-08-22 08:22:23.297793', '2026-08-12 05:58:23.313267', 40, 35, 1),
(18, 'TKT-00018', 'Change primary contact person', 'Medium', 'Open', 'Customer reported this issue through the support portal.', '2026-08-22 08:22:23.297797', '2026-08-12 05:58:23.313267', 3, 36, 4),
(19, 'TKT-00019', 'Invoice PDF not downloading', 'High', 'Closed', 'Customer reported this issue through the support portal.', '2026-08-22 08:22:23.297801', '2026-08-12 05:58:23.313267', 41, 41, 4),
(20, 'TKT-00020', 'Password reset link expired', 'Low', 'Open', 'Customer reported this issue through the support portal.', '2026-08-22 08:22:23.297805', '2026-08-12 05:58:23.313267', 37, 2, 4),
(21, 'TKT-00021', 'Cannot log in to portal', 'Medium', 'In Progress', 'Customer reported this issue through the support portal.', '2026-08-22 08:22:23.297810', '2026-08-12 05:58:23.313267', 44, 35, 1),
(22, 'TKT-00022', 'Integration with email broken', 'Urgent', 'Closed', 'Customer reported this issue through the support portal.', '2026-08-22 08:22:23.297814', '2026-08-12 05:58:23.313267', 5, 26, 2),
(23, 'TKT-00023', 'Cannot log in to portal', 'Medium', 'Closed', 'Customer reported this issue through the support portal.', '2026-08-22 08:22:23.297818', '2026-08-12 05:58:23.313267', 37, 10, 1),
(24, 'TKT-00024', 'Payment method declined', 'Medium', 'In Progress', 'Customer reported this issue through the support portal.', '2026-08-22 08:22:23.297822', '2026-08-12 05:58:23.313267', 3, 40, 2),
(25, 'TKT-00025', 'Mobile app crash on startup', 'Medium', 'Open', 'Customer reported this issue through the support portal.', '2026-08-22 08:22:23.297827', '2026-08-12 05:58:23.313267', 5, 20, 4),
(26, 'TKT-00026', 'Mobile app crash on startup', 'Urgent', 'Closed', 'Customer reported this issue through the support portal.', '2026-08-22 08:22:23.297831', '2026-08-12 05:58:23.313267', 5, 7, 4),
(27, 'TKT-00027', 'Invoice PDF not downloading', 'Urgent', 'Open', 'Customer reported this issue through the support portal.', '2026-08-22 08:22:23.297835', '2026-08-12 05:58:23.313267', 42, 22, 3),
(28, 'TKT-00028', 'Mobile app crash on startup', 'Medium', 'Closed', 'Customer reported this issue through the support portal.', '2026-08-22 08:22:23.297839', '2026-08-12 05:58:23.313267', 8, 51, 1),
(29, 'TKT-00029', 'Payment method declined', 'Medium', 'In Progress', 'Customer reported this issue through the support portal.', '2026-08-22 08:22:23.297843', '2026-08-12 05:58:23.313267', 43, 49, 2),
(30, 'TKT-00030', 'Invoice PDF not downloading', 'Urgent', 'Open', 'Customer reported this issue through the support portal.', '2026-08-22 08:22:23.297848', '2026-08-12 05:58:23.313267', 3, 38, 2),
(31, 'TKT-00031', 'Request feature: dark mode', 'Low', 'Closed', 'Customer reported this issue through the support portal.', '2026-08-22 08:22:23.297852', '2026-08-12 05:58:23.313267', 2, 6, 1),
(32, 'TKT-00032', 'Request feature: dark mode', 'Medium', 'Closed', 'Customer reported this issue through the support portal.', '2026-08-22 08:22:23.297856', '2026-08-12 05:58:23.313267', 46, 27, 6),
(33, 'TKT-00033', 'Mobile app crash on startup', 'Low', 'On Hold', 'Customer reported this issue through the support portal.', '2026-08-22 08:22:23.297860', '2026-08-12 05:58:23.313267', 37, 27, 2),
(34, 'TKT-00034', 'Password reset link expired', 'Low', 'In Progress', 'Customer reported this issue through the support portal.', '2026-08-22 08:22:23.297865', '2026-08-12 05:58:23.313267', 39, 6, 3),
(35, 'TKT-00035', 'Slow dashboard loading', 'Urgent', 'Open', 'Customer reported this issue through the support portal.', '2026-08-22 08:22:23.297869', '2026-08-12 05:58:23.313267', 5, 34, 5);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_categories`
--

CREATE TABLE `ticket_categories` (
  `id` bigint(20) NOT NULL,
  `name` varchar(80) NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ticket_categories`
--

INSERT INTO `ticket_categories` (`id`, `name`, `created_at`) VALUES
(1, 'Technical Issue', '2026-08-22 08:22:22.151785'),
(2, 'Billing', '2026-08-22 08:22:22.154254'),
(3, 'Sales Inquiry', '2026-08-22 08:22:22.155061'),
(4, 'Account Access', '2026-08-22 08:22:22.157104'),
(5, 'Feature Request', '2026-08-22 08:22:22.157670'),
(6, 'General', '2026-08-22 08:22:22.158295');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_replies`
--

CREATE TABLE `ticket_replies` (
  `id` bigint(20) NOT NULL,
  `message` longtext NOT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `ticket_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ticket_replies`
--

INSERT INTO `ticket_replies` (`id`, `message`, `attachment`, `created_at`, `ticket_id`, `user_id`) VALUES
(1, 'This has been escalated to level 2 support.', '', '2026-08-22 08:22:23.309009', 1, 37),
(2, 'Our engineering team has deployed a fix. Please verify.', '', '2026-08-22 08:22:23.309031', 1, 8),
(3, 'Could you please share a screenshot of the error?', '', '2026-08-22 08:22:23.309036', 1, 3),
(4, 'Glad to hear the issue is resolved. Closing this ticket.', '', '2026-08-22 08:22:23.309041', 2, 6),
(5, 'Could you please share a screenshot of the error?', '', '2026-08-22 08:22:23.309045', 3, 46),
(6, 'Glad to hear the issue is resolved. Closing this ticket.', '', '2026-08-22 08:22:23.309050', 3, 7),
(7, 'Glad to hear the issue is resolved. Closing this ticket.', '', '2026-08-22 08:22:23.309054', 4, 3),
(8, 'Could you please share a screenshot of the error?', '', '2026-08-22 08:22:23.309058', 5, 39),
(9, 'Our engineering team has deployed a fix. Please verify.', '', '2026-08-22 08:22:23.309062', 5, 43),
(10, 'Thank you for reaching out. We are investigating this issue.', '', '2026-08-22 08:22:23.309067', 6, 44),
(11, 'Glad to hear the issue is resolved. Closing this ticket.', '', '2026-08-22 08:22:23.309071', 6, 5),
(12, 'Could you please share a screenshot of the error?', '', '2026-08-22 08:22:23.309075', 7, 7),
(13, 'We have applied a workaround on our side. Please retry.', '', '2026-08-22 08:22:23.309079', 8, 46),
(14, 'Could you please share a screenshot of the error?', '', '2026-08-22 08:22:23.309084', 9, 4),
(15, 'We have applied a workaround on our side. Please retry.', '', '2026-08-22 08:22:23.309088', 10, 44),
(16, 'This has been escalated to level 2 support.', '', '2026-08-22 08:22:23.309092', 10, 40),
(17, 'Glad to hear the issue is resolved. Closing this ticket.', '', '2026-08-22 08:22:23.309096', 10, 8),
(18, 'Could you please share a screenshot of the error?', '', '2026-08-22 08:22:23.309101', 11, 40),
(19, 'Our engineering team has deployed a fix. Please verify.', '', '2026-08-22 08:22:23.309105', 11, 5),
(20, 'Thank you for reaching out. We are investigating this issue.', '', '2026-08-22 08:22:23.309110', 11, 37),
(21, 'Your request has been queued for the next release.', '', '2026-08-22 08:22:23.309114', 12, 43),
(22, 'Could you please share a screenshot of the error?', '', '2026-08-22 08:22:23.309118', 13, 42),
(23, 'We have applied a workaround on our side. Please retry.', '', '2026-08-22 08:22:23.309123', 14, 46),
(24, 'This has been escalated to level 2 support.', '', '2026-08-22 08:22:23.309127', 15, 3),
(25, 'Could you please share a screenshot of the error?', '', '2026-08-22 08:22:23.309131', 15, 6),
(26, 'Could you please share a screenshot of the error?', '', '2026-08-22 08:22:23.309136', 16, 44),
(27, 'Our engineering team has deployed a fix. Please verify.', '', '2026-08-22 08:22:23.309140', 16, 42),
(28, 'This has been escalated to level 2 support.', '', '2026-08-22 08:22:23.309145', 16, 6),
(29, 'Glad to hear the issue is resolved. Closing this ticket.', '', '2026-08-22 08:22:23.309149', 17, 8),
(30, 'Our engineering team has deployed a fix. Please verify.', '', '2026-08-22 08:22:23.309153', 17, 41),
(31, 'Our engineering team has deployed a fix. Please verify.', '', '2026-08-22 08:22:23.309157', 17, 8),
(32, 'Glad to hear the issue is resolved. Closing this ticket.', '', '2026-08-22 08:22:23.309161', 18, 3),
(33, 'Our engineering team has deployed a fix. Please verify.', '', '2026-08-22 08:22:23.309166', 19, 3),
(34, 'Thank you for reaching out. We are investigating this issue.', '', '2026-08-22 08:22:23.309170', 19, 6),
(35, 'This has been escalated to level 2 support.', '', '2026-08-22 08:22:23.309174', 19, 44),
(36, 'Your request has been queued for the next release.', '', '2026-08-22 08:22:23.309178', 20, 7),
(37, 'Could you please share a screenshot of the error?', '', '2026-08-22 08:22:23.309182', 20, 40),
(38, 'Your request has been queued for the next release.', '', '2026-08-22 08:22:23.309186', 21, 7),
(39, 'We have applied a workaround on our side. Please retry.', '', '2026-08-22 08:22:23.309191', 21, 7),
(40, 'Thank you for reaching out. We are investigating this issue.', '', '2026-08-22 08:22:23.309195', 22, 37),
(41, 'Your request has been queued for the next release.', '', '2026-08-22 08:22:23.309200', 22, 43),
(42, 'Your request has been queued for the next release.', '', '2026-08-22 08:22:23.309204', 22, 46),
(43, 'Your request has been queued for the next release.', '', '2026-08-22 08:22:23.309208', 23, 46),
(44, 'Thank you for reaching out. We are investigating this issue.', '', '2026-08-22 08:22:23.309213', 24, 38),
(45, 'Glad to hear the issue is resolved. Closing this ticket.', '', '2026-08-22 08:22:23.309217', 24, 43),
(46, 'Our engineering team has deployed a fix. Please verify.', '', '2026-08-22 08:22:23.309221', 25, 37),
(47, 'We have applied a workaround on our side. Please retry.', '', '2026-08-22 08:22:23.309226', 26, 37),
(48, 'We have applied a workaround on our side. Please retry.', '', '2026-08-22 08:22:23.309230', 26, 6),
(49, 'Thank you for reaching out. We are investigating this issue.', '', '2026-08-22 08:22:23.309236', 27, 43),
(50, 'Glad to hear the issue is resolved. Closing this ticket.', '', '2026-08-22 08:22:23.309240', 28, 46),
(51, 'This has been escalated to level 2 support.', '', '2026-08-22 08:22:23.309245', 29, 3),
(52, 'This has been escalated to level 2 support.', '', '2026-08-22 08:22:23.309249', 29, 42),
(53, 'This has been escalated to level 2 support.', '', '2026-08-22 08:22:23.309253', 29, 5),
(54, 'Thank you for reaching out. We are investigating this issue.', '', '2026-08-22 08:22:23.309258', 30, 37),
(55, 'Glad to hear the issue is resolved. Closing this ticket.', '', '2026-08-22 08:22:23.309262', 30, 2),
(56, 'Could you please share a screenshot of the error?', '', '2026-08-22 08:22:23.309266', 31, 43),
(57, 'Our engineering team has deployed a fix. Please verify.', '', '2026-08-22 08:22:23.309271', 31, 6),
(58, 'Could you please share a screenshot of the error?', '', '2026-08-22 08:22:23.309275', 31, 39),
(59, 'Thank you for reaching out. We are investigating this issue.', '', '2026-08-22 08:22:23.309279', 32, 4),
(60, 'Glad to hear the issue is resolved. Closing this ticket.', '', '2026-08-22 08:22:23.309284', 32, 46),
(61, 'Could you please share a screenshot of the error?', '', '2026-08-22 08:22:23.309288', 32, 39),
(62, 'Your request has been queued for the next release.', '', '2026-08-22 08:22:23.309292', 33, 44),
(63, 'This has been escalated to level 2 support.', '', '2026-08-22 08:22:23.309297', 33, 2),
(64, 'Your request has been queued for the next release.', '', '2026-08-22 08:22:23.309302', 33, 44),
(65, 'Could you please share a screenshot of the error?', '', '2026-08-22 08:22:23.309306', 34, 42),
(66, 'Glad to hear the issue is resolved. Closing this ticket.', '', '2026-08-22 08:22:23.309311', 35, 44),
(67, 'Your request has been queued for the next release.', '', '2026-08-22 08:22:23.309315', 35, 2),
(68, 'test reply', '', '2026-08-22 09:30:44.054524', 1, 1),
(69, 'test reply', '', '2026-08-22 09:31:00.716765', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `status` varchar(20) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `remember_token` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `role_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `password`, `first_name`, `last_name`, `username`, `email`, `phone`, `avatar`, `address`, `status`, `last_login`, `remember_token`, `created_at`, `updated_at`, `role_id`) VALUES
(1, 'pbkdf2_sha256$1500000$AknAgN6OfR53JK9SKFtVaQ$2kTD12gGVTKUQ/2KiNDdSjN1KJyfeJEyF3lR784Emec=', 'Alvin', 'Duran', 'admin', 'admin@technova.com', '+1 555-214-1409', 'avatars/avatar-10.png', '769 Park Rd, Munich', 'Active', '2026-08-27 10:46:15.790535', '', '2026-04-01 09:15:24.623103', '2026-08-27 10:42:19.579697', 1),
(2, 'pbkdf2_sha256$1500000$j5sqPJ2nwcOr9EWTft7oyl$xbgulSUmEodLQJxaJv5uy5nf+1u9PAZMV9eelg25Tc8=', 'Robert', 'Smith', 'rsmith', 'rsmith@technova.com', '+1 555-132-1488', '', '105 Cedar Ln, Manchester', 'Active', '2026-08-27 10:44:50.451505', '', '2024-12-14 07:46:25.768940', '2026-08-15 09:40:25.768959', 2),
(3, 'pbkdf2_sha256$1500000$L8r1kg5rBMtKRgTNlqXjWV$NVw2iAX2sI1M4CsE/kyfqX2+cR0W4Jf3Mjdl7pImbtk=', 'Lisa', 'Johnson', 'ljohnson', 'ljohnson@technova.com', '+1 555-559-5557', '', '838 Main St, Dallas', 'Active', '2026-08-18 22:15:26.946016', '', '2026-03-11 09:54:26.945993', '2026-08-12 00:12:26.946011', 2),
(4, 'pbkdf2_sha256$1500000$sM0UH7Dn2svK1Th2BJ0MEI$sxJvnZjcks/+0/zh5dxJy2T5dg5FzffAIOKxSe53IJo=', 'Angela', 'Davis', 'mgr_davis', 'mgr_davis@technova.com', '+1 555-489-2584', '', '377 Lake View Blvd, Chicago', 'Active', '2026-08-16 05:46:28.060348', '', '2026-07-08 08:52:28.060322', '2026-08-05 04:22:28.060343', 3),
(5, 'pbkdf2_sha256$1500000$Ynazss0HAUBZQZEH1vgjXS$DK1eIqdo3gJ8Kuz+Q2CVyHOl6RcQEjda4jlOt0RD7gI=', 'Charles', 'Adams', 'mgr_charles.adams', 'mgr_charles.adams@technova.com', '+1 555-982-6925', '', '601 Cedar Ln, Berlin', 'Active', '2026-08-09 00:26:29.315367', '', '2026-07-06 11:07:29.315344', '2026-07-28 23:16:29.315362', 3),
(6, 'pbkdf2_sha256$1500000$wUCz9Iqpg1tdmjhDQkLeRT$w9XULtbsryhzq7XltcmO7L+gpWYdnn4Q/bHaybsMILg=', 'Michael', 'Sanchez', 'mgr_michael.sanchez', 'mgr_michael.sanchez@technova.com', '+1 555-564-6977', '', '176 Lake View Blvd, Austin', 'Active', '2026-08-20 12:41:30.498274', '', '2024-10-04 23:37:30.498144', '2026-07-23 10:40:30.498267', 3),
(7, 'pbkdf2_sha256$1500000$mFsCuYFOOtlOGWsz0uBm1P$g6rCQVoEvo01dEmTkxNwoFX5dJi0/sDXLUnJCww2a7Y=', 'William', 'Scott', 'mgr_william.scott', 'mgr_william.scott@technova.com', '+1 555-350-3677', '', '483 Sunset Blvd, Cebu City', 'Active', '2026-08-09 07:07:31.616352', '', '2024-11-04 09:46:31.616330', '2026-08-14 11:01:31.616347', 3),
(8, 'pbkdf2_sha256$1500000$zG1uH09iE58AFwK2Ci2kU1$9Mq0aAfFLmBFaZwPlPZohJ6J/j8nl6qvkk6GfqbVNoQ=', 'Robert', 'Perez', 'mgr_robert.perez', 'mgr_robert.perez@technova.com', '+1 555-374-2084', '', '226 Commerce Way, London', 'Active', '2026-08-07 11:52:32.729401', '', '2025-10-04 01:40:32.729378', '2026-08-06 19:25:32.729396', 3),
(9, 'pbkdf2_sha256$1500000$1t90JYfQh0WV8N3Oavdhlf$RFerK4tyrHlG7bumilA1TIiCOxudUrFh09r8OdxbN6E=', 'Michael', 'Smith', 'mjohnson', 'mjohnson@technova.com', '+1 555-371-3287', '', '262 Hill Crest Ave, Phoenix', 'Active', '2026-08-19 03:49:33.839720', '', '2024-12-31 18:24:33.839695', '2026-08-03 19:58:33.839715', 4),
(10, 'pbkdf2_sha256$1500000$PVlnZicDQ4MWxhIvzlDizH$X896K+JWcjMlg4WpJ4Tvzt6WF/UBjObbLl26MeYSNh4=', 'Sarah', 'Davis', 'sdavis', 'sdavis@technova.com', '+1 555-193-1771', '', '891 Oak Ave, Vancouver', 'Active', '2026-08-15 12:52:34.952058', '', '2026-03-11 10:54:34.952035', '2026-08-03 05:57:34.952053', 4),
(11, 'pbkdf2_sha256$1500000$1tQpo3ApE37SASRYnQWx0a$CLX5hAY8T19TJPOLVYhfkuHq7OrXeURa6JRg/2xKszQ=', 'James', 'Anderson', 'janderson', 'janderson@technova.com', '+1 555-357-1188', '', '706 Oak Ave, Sydney', 'Active', '2026-08-17 19:11:36.057811', '', '2025-02-18 23:32:36.057787', '2026-08-01 22:14:36.057806', 4),
(12, 'pbkdf2_sha256$1500000$QRa8Dl0knL4sn4dLveJ61d$AmG3ac4UYEsF7cCrGJHC7q8xweZ+cMQRDSBg4U7da8I=', 'Emily', 'Thompson', 'ethompson', 'ethompson@technova.com', '+1 555-103-5315', '', '522 Maple Dr, Toronto', 'Active', '2026-08-13 02:12:37.170983', '', '2026-05-05 12:02:37.170947', '2026-07-26 11:49:37.170978', 4),
(13, 'pbkdf2_sha256$1500000$Di3YpsPvlSSENeob7evXot$txJiOUi6zcxPuML3qqLy5CgvzdNVw+KtK4KOheEcTC4=', 'David', 'Robinson', 'drobinson', 'drobinson@technova.com', '+1 555-880-3646', '', '562 Hill Crest Ave, Boston', 'Active', '2026-08-16 23:06:38.297395', '', '2024-12-16 21:50:38.297372', '2026-08-22 04:22:38.297389', 4),
(14, 'pbkdf2_sha256$1500000$bcXrJTg74aH9tt0UvSKMje$agod3tc3Hy/rOHUdH+Bp+zgiqqFrbceW8L0iI9Pmizg=', 'Ashley', 'Torres', 'atorres', 'atorres@technova.com', '+1 555-346-2290', '', '97 River Rd, Los Angeles', 'Active', '2026-08-19 23:48:39.401983', '', '2025-02-23 04:13:39.401960', '2026-07-31 16:46:39.401977', 4),
(15, 'pbkdf2_sha256$1500000$4cmxWrn8HkDnMFgnkhfzDV$34B7+eHC814hArVCgpQz9BVuw8lSd4AHB4mO5J0ezHY=', 'Chris', 'Baker', 'cbaker', 'cbaker@technova.com', '+1 555-533-4470', '', '961 Hill Crest Ave, Berlin', 'Active', '2026-08-16 17:24:40.519155', '', '2026-01-28 10:02:40.519131', '2026-08-09 10:40:40.519149', 4),
(16, 'pbkdf2_sha256$1500000$RimlG4AoNMtSVXyS45cy5M$Qin8n1KSbXRp/b6sZIVjKT4dIBGJ8FF9eI4J6jcHHaY=', 'Amanda', 'Gomez', 'agomez', 'agomez@technova.com', '+1 555-562-2982', '', '263 Cedar Ln, Sydney', 'Active', '2026-08-22 05:36:41.680684', '', '2026-07-31 13:46:41.680660', '2026-08-14 14:07:41.680679', 4),
(17, 'pbkdf2_sha256$1500000$3svSIm3YHlKPb3pzujVcai$dEmfu7uTbjpOpUVOL3cyKT2yHcyTJxKJy6Km6fxDvME=', 'Daniel', 'Miller', 'dmiller', 'dmiller@technova.com', '+1 555-160-4750', '', '79 Main St, Munich', 'Active', '2026-08-18 15:13:42.789297', '', '2026-06-10 16:06:42.789275', '2026-08-13 10:50:42.789292', 4),
(18, 'pbkdf2_sha256$1500000$fWyjY6N9ncIq7A0mVotf4m$nmAjw33otTPVFp8ZN/aS+ac7vKBF08oq1EmTnZVq5ZU=', 'Jessica', 'Wilson', 'jwilson', 'jwilson@technova.com', '+1 555-684-8744', '', '258 River Rd, Cebu City', 'Active', '2026-08-15 18:52:43.896438', '', '2026-02-09 05:15:43.896415', '2026-07-31 18:59:43.896432', 4),
(19, 'pbkdf2_sha256$1500000$qHFjY58xRDQa3BPOYum7Zk$xSq8AboBLW6zHRoQRsrHctas5jl7pqGGQuScnocvwQo=', 'Matt', 'Perez', 'mperez', 'mperez@technova.com', '+1 555-155-2612', '', '72 Sunset Blvd, Cebu City', 'Active', '2026-08-19 19:10:45.006504', '', '2026-05-03 01:09:45.006481', '2026-08-15 14:53:45.006499', 4),
(20, 'pbkdf2_sha256$1500000$29BVVZq2urccn2gDUFFoOI$DIGe+hk7fHJJALO+C2HvaqTztFEB1RgjZI+3jPPUhkI=', 'Nicole', 'Lewis', 'nlewis', 'nlewis@technova.com', '+1 555-573-5092', '', '905 Oak Ave, Austin', 'Active', '2026-08-22 05:22:46.116586', '', '2025-02-05 05:18:46.116564', '2026-08-01 14:28:46.116580', 4),
(21, 'pbkdf2_sha256$1500000$oB7s1QbIrYPPYhyjdv6srO$64Xgij66D6ozEN6N6vBuIj8jvxcVC3Bu7wXrLU4KlVY=', 'Kevin', 'Scott', 'kscott', 'kscott@technova.com', '+1 555-969-4872', '', '180 Sunset Blvd, Tokyo', 'Active', '2026-08-21 20:05:47.224224', '', '2026-01-15 19:24:47.224202', '2026-08-21 02:57:47.224219', 4),
(22, 'pbkdf2_sha256$1500000$pdW9lWZXT5WJpv3W2HzxYy$xmLDHfysTD3M8BpPTbUuEDOsBbc236iKTJg8bmumxp4=', 'Rachel', 'Nelson', 'rnelson', 'rnelson@technova.com', '+1 555-392-7930', '', '723 Hill Crest Ave, Toronto', 'Active', '2026-08-12 08:47:48.407580', '', '2025-04-11 04:09:48.407537', '2026-08-13 02:18:48.407574', 4),
(23, 'pbkdf2_sha256$1500000$iC1EQFbSQkbKjCd7TNvzei$L3PahNw5PBQWOJoIgRaiG06Hjkfo27V5QxC9zfaGyYM=', 'Brian', 'Roberts', 'broberts', 'broberts@technova.com', '+1 555-865-6138', '', '68 Main St, Los Angeles', 'Active', '2026-08-09 03:17:49.518930', '', '2025-03-25 16:11:49.518907', '2026-08-20 16:16:49.518925', 4),
(24, 'pbkdf2_sha256$1500000$eUcDECxDEkT1BnSojSjyVf$Ah86aLz9VFs4lFHNsRPAN8GM4ogLJLgapRMt3fA7xvw=', 'Laura', 'Garcia', 'lgarcia', 'lgarcia@technova.com', '+1 555-169-4853', '', '423 Oak Ave, Berlin', 'Active', '2026-08-20 18:39:50.628950', '', '2025-01-16 00:44:50.628925', '2026-08-03 06:42:50.628944', 4),
(25, 'pbkdf2_sha256$1500000$VKsdOWq4dH0AyOz8v7uQ53$TqlWis0OjlAx1QPAnbLdDAvYfjfWCfNpcOj4x7FpFOo=', 'Justin', 'Gonzalez', 'jgonzalez', 'jgonzalez@technova.com', '+1 555-678-9565', '', '333 Park Rd, Singapore', 'Active', '2026-08-11 22:52:51.787939', '', '2025-10-05 01:05:51.787914', '2026-08-10 03:39:51.787934', 4),
(26, 'pbkdf2_sha256$1500000$ni6QOs6uxJT2zFmqGxZZhm$c0yBFhkPgJu2EHOQ5plXsCrbRYdK64hbhXVSpi2qcGs=', 'Megan', 'Lee', 'mlee', 'mlee@technova.com', '+1 555-869-2188', '', '19 River Rd, Denver', 'Active', '2026-08-18 03:22:52.903878', '', '2025-01-23 05:17:52.903855', '2026-08-05 01:49:52.903872', 4),
(27, 'pbkdf2_sha256$1500000$8uLF2O2xrsTrdnpogPcNDp$SN0QDa3Man9Ob4cJlP7HV8IrgA7O14tFZ6KRbXrJAOk=', 'Eric', 'Ramirez', 'eramirez', 'eramirez@technova.com', '+1 555-170-5002', '', '388 Park Rd, Boston', 'Active', '2026-08-21 10:29:54.020167', '', '2025-02-11 10:02:54.020144', '2026-08-02 11:48:54.020161', 4),
(28, 'pbkdf2_sha256$1500000$0cKsGLKvRQrHmrJYHLQ4yW$0dzY+LPdP7yjmHfB/8upJRlEu+EyTCWpNiX323qhOgA=', 'Stephanie', 'Wright', 'swright', 'swright@technova.com', '+1 555-406-2697', '', '971 Maple Dr, Melbourne', 'Active', '2026-08-13 01:36:55.180832', '', '2026-05-04 08:46:55.180787', '2026-08-18 00:03:55.180827', 4),
(29, 'pbkdf2_sha256$1500000$sSVeBQ4RFbsgz7pCmMzemx$c934uvuteSE0TZx+CW37Q201+zdcWEwlMpuZNzdSJPA=', 'Aaron', 'Adams', 'aadams', 'aadams@technova.com', '+1 555-308-5325', '', '527 River Rd, Denver', 'Active', '2026-08-21 21:32:56.529227', '', '2026-07-01 05:41:56.529197', '2026-08-09 00:19:56.529222', 4),
(30, 'pbkdf2_sha256$1500000$6DCq95kCGDqZFuuAStHfy8$YlFiZiXcZD6ca+eLNd5/2woLpH0AaDWU55d1MiRiQmg=', 'Olivia', 'Carter', 'ocarter', 'ocarter@technova.com', '+1 555-752-5291', '', '175 River Rd, Phoenix', 'Active', '2026-08-11 03:47:57.657579', '', '2025-06-10 15:21:57.657531', '2026-08-19 05:25:57.657574', 4),
(31, 'pbkdf2_sha256$1500000$uPlppa8h93M11QZxx0kPSU$GXAv+5erLkv5i7bd/PQdo7E8eY9q82t27Aq5ewTJPMI=', 'Nathan', 'Jones', 'njones', 'njones@technova.com', '+1 555-954-7049', '', '606 Hill Crest Ave, Los Angeles', 'Active', '2026-08-17 01:38:58.778127', '', '2026-04-14 07:02:58.778101', '2026-08-11 06:24:58.778122', 4),
(32, 'pbkdf2_sha256$1500000$v3xEVqrKu5Qgj2OD6S3Q8o$w1xYI9/J5LUUgUD/ZO2SxXeMzEKFJmaJEZX1nMPVKfk=', 'Grace', 'Lopez', 'glopez', 'glopez@technova.com', '+1 555-782-2684', '', '372 Hill Crest Ave, Dallas', 'Active', '2026-08-20 02:25:59.920773', '', '2025-07-01 12:34:59.920748', '2026-08-18 00:26:59.920767', 4),
(33, 'pbkdf2_sha256$1500000$acFDOBGNQ6VnL4vq5j7owB$In/zclmf8oGAevBotjDXS3svpgrVPTd/67ZLWjpfQPE=', 'Victor', 'Martin', 'vmartin', 'vmartin@technova.com', '+1 555-125-3938', '', '764 Lake View Blvd, Manchester', 'Active', '2026-08-19 10:16:01.173188', '', '2025-06-26 10:27:01.173164', '2026-07-30 01:05:01.173183', 4),
(34, 'pbkdf2_sha256$1500000$KlPNmkocx41GK9QiVxFkdj$Q0OehOuF3eNGLVcgZMVlHHhOE005ferG62ACskKf2eY=', 'Hannah', 'Clark', 'hclark', 'hclark@technova.com', '+1 555-993-1634', '', '889 River Rd, London', 'Active', '2026-08-21 11:10:02.603397', '', '2025-05-07 21:03:02.603359', '2026-07-27 01:08:02.603392', 4),
(35, 'pbkdf2_sha256$1500000$vgTbfxFgBhHOY0axDoZBIH$tctEriLBAwt0k31j6bPSbghYfWjOdUXtrwy1VEnkEsw=', 'Oscar', 'King', 'oking', 'oking@technova.com', '+1 555-436-5564', '', '895 Oak Ave, London', 'Active', '2026-08-08 15:01:03.912966', '', '2025-11-09 20:41:03.912899', '2026-08-05 19:39:03.912960', 4),
(36, 'pbkdf2_sha256$1500000$rhjEAEfm5euyqJVrN91UkU$KVO6rZsnzjPK53OYdwaQqxUDKDfPuPkSx346PFxhryY=', 'Julia', 'Green', 'jgreen', 'jgreen@technova.com', '+1 555-218-5279', '', '192 Commerce Way, New York', 'Active', '2026-08-10 21:55:05.277669', '', '2025-11-24 07:16:05.277644', '2026-08-02 19:00:05.277664', 4),
(37, 'pbkdf2_sha256$1500000$paOcelVeCW46GB16O5A4OX$vhudtcTJewtRQw6I/PD5w89UVy2eNkmOGYyeYSiX4Yk=', 'Samuel', 'Grace', 'sgrace', 'sgrace@technova.com', '+1 555-623-2894', '', '404 Commerce Way, Berlin', 'Active', '2026-08-09 14:39:06.431669', '', '2026-07-07 09:55:06.431634', '2026-08-21 15:23:06.431664', 5),
(38, 'pbkdf2_sha256$1500000$8EZGdenNqCGwC0Mo2xvYiQ$DW4WIBe03RvCtHpMZddDwSkwG8IHWxvRekH4Ook77Y8=', 'Priya', 'Patel', 'ppatel', 'ppatel@technova.com', '+1 555-859-4228', '', '382 Sunset Blvd, Cebu City', 'Active', '2026-08-20 08:25:07.557868', '', '2024-10-10 21:43:07.557840', '2026-08-11 10:28:07.557863', 5),
(39, 'pbkdf2_sha256$1500000$SDaHMchzo9OEaIopNC00fe$nSoVRrZXqhDA8FaVydZNnK2KlDK+D7xGoivi+tbUjU0=', 'Diego', 'Ramirez', 'dramirez', 'dramirez@technova.com', '+1 555-619-6067', '', '692 Sunset Blvd, Seattle', 'Active', '2026-08-15 10:35:08.801527', '', '2025-10-23 15:14:08.801484', '2026-08-15 18:40:08.801521', 5),
(40, 'pbkdf2_sha256$1500000$572OMsc0d2edLs6MoVOV7k$dFhiNvV+FFswXW949fG0xrEhs0SZnmVF+h3p8IorXqk=', 'Chloe', 'Kim', 'ckim', 'ckim@technova.com', '+1 555-730-5930', '', '425 Hill Crest Ave, Philadelphia', 'Active', '2026-08-11 21:53:10.445399', '', '2025-10-14 23:09:10.445307', '2026-08-08 13:44:10.445392', 5),
(41, 'pbkdf2_sha256$1500000$XM3eTACzxXdK0M79wy9LgL$ooyHKTisVwkEe8094pXqHc+KsgCXkTtyJpEnOPMyWjM=', 'Ibrahim', 'Hassan', 'ihassan', 'ihassan@technova.com', '+1 555-552-4501', '', '533 River Rd, Toronto', 'Active', '2026-08-11 13:01:11.650228', '', '2026-03-01 11:17:11.650205', '2026-08-12 15:40:11.650223', 5),
(42, 'pbkdf2_sha256$1500000$exOUyYwWjzAbryGeDv0PAf$cWNFivsZ9LjJolm4aC68Xf0ldzDZkKaBwjFKncOyrAo=', 'Jennifer', 'Roberts', 'jennifer.roberts41', 'jennifer.roberts41@technova.com', '+1 555-417-4680', '', '835 Cedar Ln, Dubai', 'Active', '2026-08-15 11:46:12.824765', '', '2026-07-06 00:52:12.824724', '2026-08-03 05:53:12.824760', 3),
(43, 'pbkdf2_sha256$1500000$iG9YwPZfSsgNKJz2oTL0eX$KbvnKtnPJcaIqU6GfhJnTpgAtYuo2iGtidPDwKZctmc=', 'Richard', 'Campbell', 'richard.campbell42', 'richard.campbell42@technova.com', '+1 555-606-7547', '', '259 Maple Dr, London', 'Active', '2026-08-09 09:49:14.000015', '', '2026-08-17 04:33:13.999991', '2026-08-09 01:11:14.000010', 5),
(44, 'pbkdf2_sha256$1500000$1j7wAENbATS76VTMHgzwq9$lw/peLQR9RE6f4FPgg7AOhJ5EKvzsfvcyRzBHH7iWnQ=', 'Ashley', 'Brown', 'ashley.brown43', 'ashley.brown43@technova.com', '+1 555-968-2988', '', '477 Maple Dr, Dallas', 'Active', '2026-08-07 17:43:15.224152', '', '2024-10-07 15:47:15.223881', '2026-08-02 21:34:15.224144', 5),
(45, 'pbkdf2_sha256$1500000$6JFXdwfWplcTDGvL5ABU0o$RgjZJrqTJsAPJQJ0NG9x7s8N6qfuPZgJjZOQLEdeDn4=', 'Jason', 'King', 'jason.king44', 'jason.king44@technova.com', '+1 555-556-3607', '', '771 River Rd, Melbourne', 'Active', '2026-08-12 01:05:16.439439', '', '2025-12-11 12:05:16.439413', '2026-07-28 15:51:16.439433', 4),
(46, 'pbkdf2_sha256$1500000$S49c2Xnz2C9n8kIXm856Ht$52nHaseO0JYQftW6cqoQ1aOEMKt4swYfTjI1pwUu82s=', 'Mark', 'Jones', 'mark.jones45', 'mark.jones45@technova.com', '+1 555-340-5451', '', '353 Lake View Blvd, Seattle', 'Active', '2026-08-19 10:09:17.620463', '', '2026-06-01 04:13:17.620430', '2026-08-14 19:38:17.620457', 5),
(47, 'pbkdf2_sha256$1500000$T8tOtJVT9fvQ2XQZBjDCHP$kVByK1StgIXAYjPEAV+OAlcm2VrXW9PGxjwg/TMCYkI=', 'John', 'Ramirez', 'john.ramirez46', 'john.ramirez46@technova.com', '+1 555-655-8633', '', '435 Main St, Denver', 'Active', '2026-08-21 13:58:18.759469', '', '2025-06-17 19:25:18.759446', '2026-07-28 13:38:18.759464', 4),
(48, 'pbkdf2_sha256$1500000$MVw7mJTYC6HN4wu2uxs5Np$ap8tU/8AjjHoKV+dAw7szq9e0wEFFHSpgPGGMrp3VVA=', 'Steven', 'Smith', 'steven.smith47', 'steven.smith47@technova.com', '+1 555-871-7389', '', '883 Sunset Blvd, Seattle', 'Active', '2026-08-17 18:51:19.880880', '', '2025-02-08 12:25:19.880856', '2026-08-14 17:08:19.880874', 4),
(49, 'pbkdf2_sha256$1500000$VfBlKXwcncLFpNXnWHaatR$rmFtAzWqlKz+Lx5K5cHzAaF6VY7qVXG8oEbvEVeGHnU=', 'Mary', 'Sanchez', 'mary.sanchez48', 'mary.sanchez48@technova.com', '+1 555-795-7624', '', '751 Maple Dr, Dubai', 'Active', '2026-08-12 11:21:21.000509', '', '2026-04-13 12:48:21.000477', '2026-08-21 19:45:21.000504', 4),
(50, 'pbkdf2_sha256$1500000$G4aLfAmZ2UIk5pIesxpcgn$vzExnRlPmMZDE8p5O/1gkooQd4ojb9g0qjl3aEMSIuc=', 'Jennifer', 'Nelson', 'jennifer.nelson49', 'jennifer.nelson49@technova.com', '+1 555-987-8564', '', '196 Main St, Phoenix', 'Active', '2026-08-07 20:05:22.128357', '', '2025-09-21 01:53:22.128321', '2026-08-11 21:34:22.128351', 4),
(51, 'pbkdf2_sha256$1500000$AjTiujvnbJlSA7imFmtW2g$kRx7YCRS+A+n+XquB4G7B1EOvApBE/89GexvelwPjn0=', 'Catlin', 'Ednaln', 'cat0130', 'catlin@test.com', '345345', 'avatars/avatar-9.png', 'olongapo', 'Active', '2026-08-27 10:43:25.453498', '', '2026-08-27 10:24:31.069928', '2026-08-27 10:24:31.069945', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_logs_user_id_60cbbbe3_fk_users_id` (`user_id`);

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attachments_user_id_4fd6a013_fk_users_id` (`user_id`);

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audit_logs_user_id_752b0e2b_fk_users_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_code` (`customer_code`),
  ADD KEY `customers_email_92e882_idx` (`email`),
  ADD KEY `customers_company_c25c85_idx` (`company_name`),
  ADD KEY `customers_assigned_to_d6c1f2fa_fk_users_id` (`assigned_to`),
  ADD KEY `customers_is_deleted_6d1952fd` (`is_deleted`);

--
-- Indexes for table `customer_contacts`
--
ALTER TABLE `customer_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_contacts_customer_id_0c08441d_fk_customers_id` (`customer_id`);

--
-- Indexes for table `customer_documents`
--
ALTER TABLE `customer_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_documents_customer_id_0c07c702_fk_customers_id` (`customer_id`),
  ADD KEY `customer_documents_uploaded_by_9c894233_fk_users_id` (`uploaded_by`);

--
-- Indexes for table `customer_tags`
--
ALTER TABLE `customer_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `customer_tag_map`
--
ALTER TABLE `customer_tag_map`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_tag_map_customer_id_tag_id_ff8aa7e9_uniq` (`customer_id`,`tag_id`),
  ADD KEY `customer_tag_map_tag_id_1e8ea973_fk_customer_tags_id` (`tag_id`);

--
-- Indexes for table `deals`
--
ALTER TABLE `deals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deals_assigned_to_c5e618b1_fk_users_id` (`assigned_to`),
  ADD KEY `deals_customer_id_3d7d7d95_fk_customers_id` (`customer_id`),
  ADD KEY `deals_stage_id_015e2a0e_fk_deal_stages_id` (`stage_id`),
  ADD KEY `deals_lead_id_452216cb_fk_leads_id` (`lead_id`);

--
-- Indexes for table `deal_stages`
--
ALTER TABLE `deal_stages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deal_stages_pipeline_id_52857634_fk_pipelines_id` (`pipeline_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_users_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `email_logs`
--
ALTER TABLE `email_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_logs_customer_id_e2022740_fk_customers_id` (`customer_id`),
  ADD KEY `email_logs_user_id_0a1916ef_fk_users_id` (`user_id`),
  ADD KEY `email_logs_template_id_95b198eb_fk_email_templates_id` (`template_id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoice_number` (`invoice_number`),
  ADD KEY `invoices_quote_id_633b9452_fk_quotes_id` (`quote_id`),
  ADD KEY `invoices_created_by_32861db2_fk_users_id` (`created_by`),
  ADD KEY `invoices_customer_id_de4a11fb_fk_customers_id` (`customer_id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_items_invoice_id_96f0ca2d_fk_invoices_id` (`invoice_id`),
  ADD KEY `invoice_items_product_id_53181905_fk_products_id` (`product_id`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leads_assigned_to_b99a3e90_fk_users_id` (`assigned_to`),
  ADD KEY `leads_converted_customer_id_eb27df4c_fk_customers_id` (`converted_customer_id`),
  ADD KEY `leads_source_id_aa4d2f7a_fk_lead_sources_id` (`source_id`),
  ADD KEY `leads_status_id_e09cbf42_fk_lead_statuses_id` (`status_id`);

--
-- Indexes for table `lead_activities`
--
ALTER TABLE `lead_activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_activities_lead_id_ce004797_fk_leads_id` (`lead_id`),
  ADD KEY `lead_activities_user_id_36922c35_fk_users_id` (`user_id`);

--
-- Indexes for table `lead_sources`
--
ALTER TABLE `lead_sources`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `lead_statuses`
--
ALTER TABLE `lead_statuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `login_logs`
--
ALTER TABLE `login_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `login_logs_user_id_d31d00a1_fk_users_id` (`user_id`);

--
-- Indexes for table `meetings`
--
ALTER TABLE `meetings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meetings_customer_id_d2d2c82a_fk_customers_id` (`customer_id`),
  ADD KEY `meetings_lead_id_35a8f192_fk_leads_id` (`lead_id`),
  ADD KEY `meetings_organizer_id_02f4ec0b_fk_users_id` (`organizer_id`);

--
-- Indexes for table `meeting_attendees`
--
ALTER TABLE `meeting_attendees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `meeting_attendees_meeting_id_user_id_6703542d_uniq` (`meeting_id`,`user_id`),
  ADD KEY `meeting_attendees_user_id_67bc8abf_fk_users_id` (`user_id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notes_customer_id_deb27eb2_fk_customers_id` (`customer_id`),
  ADD KEY `notes_deal_id_ba62fb8b_fk_deals_id` (`deal_id`),
  ADD KEY `notes_lead_id_5e9b5fe3_fk_leads_id` (`lead_id`),
  ADD KEY `notes_user_id_c857adc1_fk_users_id` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_468e288d_fk_users_id` (`user_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_customer_id_3472d067_fk_customers_id` (`customer_id`),
  ADD KEY `payments_invoice_id_09b5e2bf_fk_invoices_id` (`invoice_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `pipelines`
--
ALTER TABLE `pipelines`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sku` (`sku`),
  ADD KEY `products_category_id_a7a3a156_fk_product_categories_id` (`category_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `quotes`
--
ALTER TABLE `quotes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `quote_number` (`quote_number`),
  ADD KEY `quotes_created_by_96ba2ddc_fk_users_id` (`created_by`),
  ADD KEY `quotes_customer_id_61dcfeac_fk_customers_id` (`customer_id`);

--
-- Indexes for table `quote_items`
--
ALTER TABLE `quote_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quote_items_product_id_135aa204_fk_products_id` (`product_id`),
  ADD KEY `quote_items_quote_id_7f336f92_fk_quotes_id` (`quote_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_permissions_role_id_permission_id_04f77df0_uniq` (`role_id`,`permission_id`),
  ADD KEY `role_permissions_permission_id_ad343843_fk_permissions_id` (`permission_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_assigned_to_4cd0cdcb_fk_users_id` (`assigned_to`),
  ADD KEY `tasks_customer_id_f9480c94_fk_customers_id` (`customer_id`),
  ADD KEY `tasks_deal_id_e361ead7_fk_deals_id` (`deal_id`),
  ADD KEY `tasks_lead_id_d2264265_fk_leads_id` (`lead_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ticket_number` (`ticket_number`),
  ADD KEY `tickets_assigned_to_8f6ddd2e_fk_users_id` (`assigned_to`),
  ADD KEY `tickets_customer_id_1778b1f7_fk_customers_id` (`customer_id`),
  ADD KEY `tickets_category_id_e5907dd8_fk_ticket_categories_id` (`category_id`);

--
-- Indexes for table `ticket_categories`
--
ALTER TABLE `ticket_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_replies_ticket_id_8864574a_fk_tickets_id` (`ticket_id`),
  ADD KEY `ticket_replies_user_id_0170f8c7_fk_users_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `users_role_id_1900a745_fk_roles_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=275;

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `customer_contacts`
--
ALTER TABLE `customer_contacts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `customer_documents`
--
ALTER TABLE `customer_documents`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `customer_tags`
--
ALTER TABLE `customer_tags`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `customer_tag_map`
--
ALTER TABLE `customer_tag_map`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `deals`
--
ALTER TABLE `deals`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `deal_stages`
--
ALTER TABLE `deal_stages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `email_logs`
--
ALTER TABLE `email_logs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `lead_activities`
--
ALTER TABLE `lead_activities`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `lead_sources`
--
ALTER TABLE `lead_sources`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `lead_statuses`
--
ALTER TABLE `lead_statuses`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `login_logs`
--
ALTER TABLE `login_logs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `meetings`
--
ALTER TABLE `meetings`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `meeting_attendees`
--
ALTER TABLE `meeting_attendees`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `pipelines`
--
ALTER TABLE `pipelines`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `quotes`
--
ALTER TABLE `quotes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `quote_items`
--
ALTER TABLE `quote_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `role_permissions`
--
ALTER TABLE `role_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=371;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `ticket_categories`
--
ALTER TABLE `ticket_categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_user_id_60cbbbe3_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `attachments`
--
ALTER TABLE `attachments`
  ADD CONSTRAINT `attachments_user_id_4fd6a013_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD CONSTRAINT `audit_logs_user_id_752b0e2b_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_assigned_to_d6c1f2fa_fk_users_id` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`);

--
-- Constraints for table `customer_contacts`
--
ALTER TABLE `customer_contacts`
  ADD CONSTRAINT `customer_contacts_customer_id_0c08441d_fk_customers_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `customer_documents`
--
ALTER TABLE `customer_documents`
  ADD CONSTRAINT `customer_documents_customer_id_0c07c702_fk_customers_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `customer_documents_uploaded_by_9c894233_fk_users_id` FOREIGN KEY (`uploaded_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `customer_tag_map`
--
ALTER TABLE `customer_tag_map`
  ADD CONSTRAINT `customer_tag_map_customer_id_55ab55fd_fk_customers_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `customer_tag_map_tag_id_1e8ea973_fk_customer_tags_id` FOREIGN KEY (`tag_id`) REFERENCES `customer_tags` (`id`);

--
-- Constraints for table `deals`
--
ALTER TABLE `deals`
  ADD CONSTRAINT `deals_assigned_to_c5e618b1_fk_users_id` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `deals_customer_id_3d7d7d95_fk_customers_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `deals_lead_id_452216cb_fk_leads_id` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`),
  ADD CONSTRAINT `deals_stage_id_015e2a0e_fk_deal_stages_id` FOREIGN KEY (`stage_id`) REFERENCES `deal_stages` (`id`);

--
-- Constraints for table `deal_stages`
--
ALTER TABLE `deal_stages`
  ADD CONSTRAINT `deal_stages_pipeline_id_52857634_fk_pipelines_id` FOREIGN KEY (`pipeline_id`) REFERENCES `pipelines` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `email_logs`
--
ALTER TABLE `email_logs`
  ADD CONSTRAINT `email_logs_customer_id_e2022740_fk_customers_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `email_logs_template_id_95b198eb_fk_email_templates_id` FOREIGN KEY (`template_id`) REFERENCES `email_templates` (`id`),
  ADD CONSTRAINT `email_logs_user_id_0a1916ef_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_created_by_32861db2_fk_users_id` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `invoices_customer_id_de4a11fb_fk_customers_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `invoices_quote_id_633b9452_fk_quotes_id` FOREIGN KEY (`quote_id`) REFERENCES `quotes` (`id`);

--
-- Constraints for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `invoice_items_invoice_id_96f0ca2d_fk_invoices_id` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  ADD CONSTRAINT `invoice_items_product_id_53181905_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `leads`
--
ALTER TABLE `leads`
  ADD CONSTRAINT `leads_assigned_to_b99a3e90_fk_users_id` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `leads_converted_customer_id_eb27df4c_fk_customers_id` FOREIGN KEY (`converted_customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `leads_source_id_aa4d2f7a_fk_lead_sources_id` FOREIGN KEY (`source_id`) REFERENCES `lead_sources` (`id`),
  ADD CONSTRAINT `leads_status_id_e09cbf42_fk_lead_statuses_id` FOREIGN KEY (`status_id`) REFERENCES `lead_statuses` (`id`);

--
-- Constraints for table `lead_activities`
--
ALTER TABLE `lead_activities`
  ADD CONSTRAINT `lead_activities_lead_id_ce004797_fk_leads_id` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`),
  ADD CONSTRAINT `lead_activities_user_id_36922c35_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `login_logs`
--
ALTER TABLE `login_logs`
  ADD CONSTRAINT `login_logs_user_id_d31d00a1_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `meetings`
--
ALTER TABLE `meetings`
  ADD CONSTRAINT `meetings_customer_id_d2d2c82a_fk_customers_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `meetings_lead_id_35a8f192_fk_leads_id` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`),
  ADD CONSTRAINT `meetings_organizer_id_02f4ec0b_fk_users_id` FOREIGN KEY (`organizer_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `meeting_attendees`
--
ALTER TABLE `meeting_attendees`
  ADD CONSTRAINT `meeting_attendees_meeting_id_3592104e_fk_meetings_id` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`),
  ADD CONSTRAINT `meeting_attendees_user_id_67bc8abf_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_customer_id_deb27eb2_fk_customers_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `notes_deal_id_ba62fb8b_fk_deals_id` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`),
  ADD CONSTRAINT `notes_lead_id_5e9b5fe3_fk_leads_id` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`),
  ADD CONSTRAINT `notes_user_id_c857adc1_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_468e288d_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_customer_id_3472d067_fk_customers_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `payments_invoice_id_09b5e2bf_fk_invoices_id` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_a7a3a156_fk_product_categories_id` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`);

--
-- Constraints for table `quotes`
--
ALTER TABLE `quotes`
  ADD CONSTRAINT `quotes_created_by_96ba2ddc_fk_users_id` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `quotes_customer_id_61dcfeac_fk_customers_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `quote_items`
--
ALTER TABLE `quote_items`
  ADD CONSTRAINT `quote_items_product_id_135aa204_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `quote_items_quote_id_7f336f92_fk_quotes_id` FOREIGN KEY (`quote_id`) REFERENCES `quotes` (`id`);

--
-- Constraints for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD CONSTRAINT `role_permissions_permission_id_ad343843_fk_permissions_id` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  ADD CONSTRAINT `role_permissions_role_id_216516f2_fk_roles_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_assigned_to_4cd0cdcb_fk_users_id` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `tasks_customer_id_f9480c94_fk_customers_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `tasks_deal_id_e361ead7_fk_deals_id` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`),
  ADD CONSTRAINT `tasks_lead_id_d2264265_fk_leads_id` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`);

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_assigned_to_8f6ddd2e_fk_users_id` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `tickets_category_id_e5907dd8_fk_ticket_categories_id` FOREIGN KEY (`category_id`) REFERENCES `ticket_categories` (`id`),
  ADD CONSTRAINT `tickets_customer_id_1778b1f7_fk_customers_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD CONSTRAINT `ticket_replies_ticket_id_8864574a_fk_tickets_id` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`),
  ADD CONSTRAINT `ticket_replies_user_id_0170f8c7_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_1900a745_fk_roles_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
