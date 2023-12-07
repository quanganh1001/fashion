-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th12 07, 2023 lúc 01:03 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `fashion_project`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products_detail`
--

CREATE TABLE `products_detail` (
  `product_detail_id` int(10) NOT NULL,
  `product_id` varchar(15) DEFAULT NULL,
  `code` varchar(30) DEFAULT NULL,
  `color_id` varchar(5) DEFAULT NULL,
  `size_id` varchar(5) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `out_of_stock` bit(1) DEFAULT NULL,
  `product_detail_active` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products_detail`
--

INSERT INTO `products_detail` (`product_detail_id`, `product_id`, `code`, `color_id`, `size_id`, `quantity`, `out_of_stock`, `product_detail_active`) VALUES
(1, 'ESTP038', 'ESTP03872PE00SB_BL-S', 'BL', 'S', 0, b'0', b'1'),
(2, 'ESTP038', 'ESTP03872PE00SB_BL-M', 'BL', 'M', 0, b'0', b'1'),
(3, 'ESTP038', 'ESTP03872PE00SB_BL-L', 'BL', 'L', 0, b'0', b'1'),
(4, 'ESTP038', 'ESTP03872PE00SB_BL-XL', 'BL', 'XL', 999, b'1', b'1'),
(5, 'ESTP038', 'ESTP03872PE00SB_BL-XXL', 'BL', 'XXL', 999, b'1', b'1'),
(6, 'ESTP067', 'ESTP06772TC00SB_NV-S', 'NV', 'S', 999, b'1', b'1'),
(7, 'ESTP067', 'ESTP06772TC00SB_NV-M', 'NV', 'M', 999, b'1', b'1'),
(8, 'ESTP067', 'ESTP06772TC00SB_NV-L', 'NV', 'L', 999, b'1', b'1'),
(9, 'ESTP067', 'ESTP06772TC00SB_NV-XL', 'NV', 'XL', 999, b'1', b'1'),
(10, 'ESTP067', 'ESTP06772TC00SB_NV-XXL', 'NV', 'XXL', 999, b'1', b'1'),
(11, 'ESTP067', 'ESTP06772TC00SB_WH-S', 'WH', 'S', 999, b'1', b'1'),
(12, 'ESTP067', 'ESTP06772TC00SB_WH-M', 'WH', 'M', 999, b'1', b'1'),
(13, 'ESTP067', 'ESTP06772TC00SB_WH-L', 'WH', 'L', 999, b'1', b'1'),
(14, 'ESTP067', 'ESTP06772TC00SB_WH-XL', 'WH', 'XL', 999, b'1', b'1'),
(15, 'ESTP067', 'ESTP06772TC00SB_WH-XXL', 'WH', 'XXL', 999, b'1', b'1'),
(16, 'ESTP067', 'ESTP06772TC00SB_BL-S', 'BL', 'S', 999, b'1', b'1'),
(17, 'ESTP067', 'ESTP06772TC00SB_BL-M', 'BL', 'M', 999, b'1', b'1'),
(18, 'ESTP067', 'ESTP06772TC00SB_BL-L', 'BL', 'L', 999, b'1', b'1'),
(19, 'ESTP067', 'ESTP06772TC00SB_BL-XL', 'BL', 'XL', 999, b'1', b'1'),
(20, 'ESTP067', 'ESTP06772TC00SB_BL-XXL', 'BL', 'XXL', 999, b'1', b'1'),
(26, 'ESTP028', 'ESTP02872CV00SB_DCB-S', 'DCB', 'S', 999, b'1', b'1'),
(27, 'ESTP028', 'ESTP02872CV00SB_DCB-M', 'DCB', 'M', 999, b'1', b'1'),
(28, 'ESTP028', 'ESTP02872CV00SB_DCB-L', 'DCB', 'L', 999, b'1', b'1'),
(29, 'ESTP028', 'ESTP02872CV00SB_DCB-XL', 'DCB', 'XL', 999, b'1', b'1'),
(30, 'ESTP028', 'ESTP02872CV00SB_DCB-XXL', 'DCB', 'XXL', 999, b'1', b'1'),
(31, 'ESTP028', 'ESTP02872CV00SB_WH-S', 'WH', 'S', 0, b'0', b'1'),
(32, 'ESTP028', 'ESTP02872CV00SB_WH-M', 'WH', 'M', 0, b'0', b'1'),
(33, 'ESTP028', 'ESTP02872CV00SB_WH-L', 'WH', 'L', 999, b'1', b'1'),
(34, 'ESTP028', 'ESTP02872CV00SB_WH-XL', 'WH', 'XL', 999, b'1', b'1'),
(35, 'ESTP028', 'ESTP02872CV00SB_WH-XXL', 'WH', 'XXL', 999, b'1', b'1'),
(36, 'ESTP028', 'ESTP02872CV00SB_BL-S', 'BL', 'S', 0, b'0', b'1'),
(37, 'ESTP028', 'ESTP02872CV00SB_BL-M', 'BL', 'M', 0, b'0', b'1'),
(38, 'ESTP028', 'ESTP02872CV00SB_BL-L', 'BL', 'L', 999, b'1', b'1'),
(39, 'ESTP028', 'ESTP02872CV00SB_BL-XL', 'BL', 'XL', 0, b'0', b'1'),
(40, 'ESTP028', 'ESTP02872CV00SB_BL-XXL', 'BL', 'XXL', 0, b'0', b'1'),
(41, 'ESTP028', 'ESTP02872CV00SB_NV-S', 'NV', 'S', 999, b'1', b'1'),
(42, 'ESTP028', 'ESTP02872CV00SB_NV-M', 'NV', 'M', 0, b'0', b'1'),
(43, 'ESTP028', 'ESTP02872CV00SB_NV-L', 'NV', 'L', 0, b'0', b'1'),
(44, 'ESTP028', 'ESTP02872CV00SB_NV-XL', 'NV', 'XL', 0, b'0', b'1'),
(45, 'ESTP028', 'ESTP02872CV00SB_NV-XXL', 'NV', 'XXL', 0, b'0', b'1'),
(46, 'DSTP611', 'DSTP61172CX00SB_WH-S', 'WH', 'S', 777, b'1', b'1'),
(47, 'DSTP611', 'DSTP61172CX00SB_WH-M', 'WH', 'M', 999, b'1', b'1'),
(48, 'DSTP611', 'DSTP61172CX00SB_WH-L', 'WH', 'L', 999, b'1', b'1'),
(49, 'DSTP611', 'DSTP61172CX00SB_WH-XL', 'WH', 'XL', 999, b'1', b'1'),
(50, 'ESTP010', 'ESTP01072TC00SB_DGN-S', 'DGN', 'S', 999, b'1', b'1'),
(51, 'ESTP010', 'ESTP01072TC00SB_DGN-M', 'DGN', 'M', 999, b'1', b'1'),
(52, 'ESTP010', 'ESTP01072TC00SB_DGN-L', 'DGN', 'L', 999, b'1', b'1'),
(53, 'ESTP010', 'ESTP01072TC00SB_DGN-XL', 'DGN', 'XL', 999, b'1', b'1'),
(54, 'ESTP010', 'ESTP01072TC00SB_DGN-XXL', 'DGN', 'XXL', 999, b'1', b'1'),
(55, 'ESTP010', 'ESTP01072TC00SB_CR-S', 'CR', 'S', 999, b'1', b'1'),
(56, 'ESTP010', 'ESTP01072TC00SB_CR-M', 'CR', 'M', 999, b'1', b'1'),
(57, 'ESTP010', 'ESTP01072TC00SB_CR-L', 'CR', 'L', 999, b'1', b'1'),
(58, 'ESTP010', 'ESTP01072TC00SB_CR-XL', 'CR', 'XL', 999, b'1', b'1'),
(59, 'ESTP010', 'ESTP01072TC00SB_CR-XXL', 'CR', 'XXL', 999, b'1', b'1'),
(60, 'ESTP010', 'ESTP01072TC00SB_WH-S', 'WH', 'S', 999, b'1', b'1'),
(61, 'ESTP010', 'ESTP01072TC00SB_WH-M', 'WH', 'M', 999, b'1', b'1'),
(62, 'ESTP010', 'ESTP01072TC00SB_WH-L', 'WH', 'L', 999, b'1', b'1'),
(63, 'ESTP010', 'ESTP01072TC00SB_WH-XL', 'WH', 'XL', 999, b'1', b'1'),
(64, 'ESTP010', 'ESTP01072TC00SB_WH-XXL', 'WH', 'XXL', 999, b'1', b'1'),
(65, 'ESTP032', 'ESTP03272TC00SB_BE-S', 'BE', 'S', 999, b'1', b'1'),
(66, 'ESTP032', 'ESTP03272TC00SB_BE-M', 'BE', 'M', 999, b'1', b'1'),
(67, 'ESTP032', 'ESTP03272TC00SB_BE-L', 'BE', 'L', 999, b'1', b'1'),
(68, 'ESTP032', 'ESTP03272TC00SB_BE-XL', 'BE', 'XL', 999, b'1', b'1'),
(69, 'ESTP032', 'ESTP03272TC00SB_BR-S', 'BR', 'S', 999, b'1', b'1'),
(70, 'ESTP032', 'ESTP03272TC00SB_BR-M', 'BR', 'M', 999, b'1', b'1'),
(71, 'ESTP032', 'ESTP03272TC00SB_BR-L', 'BR', 'L', 999, b'1', b'1'),
(72, 'ESTP032', 'ESTP03272TC00SB_BR-XL', 'BR', 'XL', 999, b'1', b'1'),
(73, 'ESTP032', 'ESTP03272TC00SB_WH-S', 'WH', 'S', 999, b'1', b'1'),
(74, 'ESTP032', 'ESTP03272TC00SB_WH-M', 'WH', 'M', 999, b'1', b'1'),
(75, 'ESTP032', 'ESTP03272TC00SB_WH-L', 'WH', 'L', 999, b'1', b'1'),
(76, 'ESTP032', 'ESTP03272TC00SB_WH-XL', 'WH', 'XL', 999, b'1', b'1'),
(77, 'ESTP074', 'ESTP07472CT00SB_NV-S', 'NV', 'S', 999, b'1', b'1'),
(78, 'ESTP074', 'ESTP07472CT00SB_NV-M', 'NV', 'M', 999, b'1', b'1'),
(79, 'ESTP074', 'ESTP07472CT00SB_NV-L', 'NV', 'L', 999, b'1', b'1'),
(80, 'ESTP074', 'ESTP07472CT00SB_NV-XL', 'NV', 'XL', 999, b'1', b'1'),
(81, 'ESTP074', 'ESTP07472CT00SB_WH-S', 'WH', 'S', 999, b'1', b'1'),
(82, 'ESTP074', 'ESTP07472CT00SB_WH-M', 'WH', 'M', 999, b'1', b'1'),
(83, 'ESTP074', 'ESTP07472CT00SB_WH-L', 'WH', 'L', 999, b'1', b'1'),
(84, 'ESTP074', 'ESTP07472CT00SB_WH-XL', 'WH', 'XL', 999, b'1', b'1'),
(85, 'ESTP005', 'ESTP00572CT00SB_DNV-S', 'DNV', 'S', 999, b'1', b'1'),
(86, 'ESTP005', 'ESTP00572CT00SB_DNV-M', 'DNV', 'M', 999, b'1', b'1'),
(87, 'ESTP005', 'ESTP00572CT00SB_DNV-L', 'DNV', 'L', 999, b'1', b'1'),
(88, 'ESTP005', 'ESTP00572CT00SB_DNV-XL', 'DNV', 'XL', 999, b'1', b'1'),
(89, 'ESTP041', 'ESTP04172CV01SB_DCR-S', 'DCR', 'S', 0, b'0', b'1'),
(90, 'ESTP041', 'ESTP04172CV01SB_DCR-M', 'DCR', 'M', 999, b'1', b'1'),
(91, 'ESTP041', 'ESTP04172CV01SB_DCR-L', 'DCR', 'L', 999, b'1', b'1'),
(92, 'ESTP041', 'ESTP04172CV01SB_DCR-XL', 'DCR', 'XL', 999, b'1', b'1'),
(93, 'ESTP041', 'ESTP04172CV01SB_BL-S', 'BL', 'S', 999, b'1', b'1'),
(94, 'ESTP041', 'ESTP04172CV01SB_BL-M', 'BL', 'M', 999, b'1', b'1'),
(95, 'ESTP041', 'ESTP04172CV01SB_BL-L', 'BL', 'L', 999, b'1', b'1'),
(96, 'ESTP041', 'ESTP04172CV01SB_BL-XL', 'BL', 'XL', 999, b'1', b'1'),
(97, 'ESTP041', 'ESTP04172CV01SB_CN-S', 'CN', 'S', 999, b'1', b'1'),
(98, 'ESTP041', 'ESTP04172CV01SB_CN-M', 'CN', 'M', 999, b'1', b'1'),
(99, 'ESTP041', 'ESTP04172CV01SB_CN-L', 'CN', 'L', 999, b'1', b'1'),
(100, 'ESTP041', 'ESTP04172CV01SB_CN-XL', 'CN', 'XL', 999, b'1', b'1'),
(101, 'ESTP041', 'ESTP04172CV01SB_DNV-S', 'DNV', 'S', 999, b'1', b'1'),
(102, 'ESTP041', 'ESTP04172CV01SB_DNV-M', 'DNV', 'M', 999, b'1', b'1'),
(103, 'ESTP041', 'ESTP04172CV01SB_DNV-L', 'DNV', 'L', 999, b'1', b'1'),
(104, 'ESTP041', 'ESTP04172CV01SB_DNV-XL', 'DNV', 'XL', 999, b'1', b'1'),
(105, 'ESTP041', 'ESTP04172CV01SB_WH-S', 'WH', 'S', 999, b'1', b'1'),
(106, 'ESTP041', 'ESTP04172CV01SB_WH-M', 'WH', 'M', 999, b'1', b'1'),
(107, 'ESTP041', 'ESTP04172CV01SB_WH-L', 'WH', 'L', 999, b'1', b'1'),
(108, 'ESTP041', 'ESTP04172CV01SB_WH-XL', 'WH', 'XL', 999, b'1', b'1'),
(109, 'ESTP042', 'ESTP04272CV00SB_BR-S', 'BR', 'S', 999, b'1', b'1'),
(110, 'ESTP042', 'ESTP04272CV00SB_BR-M', 'BR', 'M', 999, b'1', b'1'),
(111, 'ESTP042', 'ESTP04272CV00SB_BR-L', 'BR', 'L', 999, b'1', b'1'),
(112, 'ESTP042', 'ESTP04272CV00SB_BR-XL', 'BR', 'XL', 999, b'1', b'1'),
(113, 'ESTP042', 'ESTP04272CV00SB_BR-XXL', 'BR', 'XXL', 999, b'1', b'1'),
(114, 'ESTP042', 'ESTP04272CV00SB_LI-S', 'LI', 'S', 999, b'1', b'1'),
(115, 'ESTP042', 'ESTP04272CV00SB_LI-M', 'LI', 'M', 999, b'1', b'1'),
(116, 'ESTP042', 'ESTP04272CV00SB_LI-L', 'LI', 'L', 999, b'1', b'1'),
(117, 'ESTP042', 'ESTP04272CV00SB_LI-XL', 'LI', 'XL', 999, b'1', b'1'),
(118, 'ESTP042', 'ESTP04272CV00SB_LI-XXL', 'LI', 'XXL', 999, b'1', b'1'),
(119, 'ESTP042', 'ESTP04272CV00SB_BL-S', 'BL', 'S', 999, b'1', b'1'),
(120, 'ESTP042', 'ESTP04272CV00SB_BL-M', 'BL', 'M', 999, b'1', b'1'),
(121, 'ESTP042', 'ESTP04272CV00SB_BL-L', 'BL', 'L', 999, b'1', b'1'),
(122, 'ESTP042', 'ESTP04272CV00SB_BL-XL', 'BL', 'XL', 999, b'1', b'1'),
(123, 'ESTP042', 'ESTP04272CV00SB_BL-XXL', 'BL', 'XXL', 999, b'1', b'1'),
(124, 'ESTP042', 'ESTP04272CV00SB_NV-S', 'NV', 'S', 999, b'1', b'1'),
(125, 'ESTP042', 'ESTP04272CV00SB_NV-M', 'NV', 'M', 999, b'1', b'1'),
(126, 'ESTP042', 'ESTP04272CV00SB_NV-L', 'NV', 'L', 999, b'1', b'1'),
(127, 'ESTP042', 'ESTP04272CV00SB_NV-XL', 'NV', 'XL', 999, b'1', b'1'),
(128, 'ESTP042', 'ESTP04272CV00SB_NV-XXL', 'NV', 'XXL', 999, b'1', b'1'),
(129, 'ESTP042', 'ESTP04272CV00SB_DTU-S', 'DTU', 'S', 999, b'1', b'1'),
(130, 'ESTP042', 'ESTP04272CV00SB_DTU-M', 'DTU', 'M', 999, b'1', b'1'),
(131, 'ESTP042', 'ESTP04272CV00SB_DTU-L', 'DTU', 'L', 999, b'1', b'1'),
(132, 'ESTP042', 'ESTP04272CV00SB_DTU-XL', 'DTU', 'XL', 999, b'1', b'1'),
(133, 'ESTP042', 'ESTP04272CV00SB_DTU-XXL', 'DTU', 'XXL', 999, b'1', b'1'),
(134, 'ESTP042', 'ESTP04272CV00SB_TU-S', 'TU', 'S', 999, b'1', b'1'),
(135, 'ESTP042', 'ESTP04272CV00SB_TU-M', 'TU', 'M', 999, b'1', b'1'),
(136, 'ESTP042', 'ESTP04272CV00SB_TU-L', 'TU', 'L', 999, b'1', b'1'),
(137, 'ESTP042', 'ESTP04272CV00SB_TU-XL', 'TU', 'XL', 999, b'1', b'1'),
(138, 'ESTP042', 'ESTP04272CV00SB_TU-XXL', 'TU', 'XXL', 999, b'1', b'1'),
(139, 'ESTP042', 'ESTP04272CV00SB_LYL-S', 'LYL', 'S', 999, b'1', b'1'),
(140, 'ESTP042', 'ESTP04272CV00SB_LYL-M', 'LYL', 'M', 999, b'1', b'1'),
(141, 'ESTP042', 'ESTP04272CV00SB_LYL-L', 'LYL', 'L', 999, b'1', b'1'),
(142, 'ESTP042', 'ESTP04272CV00SB_LYL-XL', 'LYL', 'XL', 999, b'1', b'1'),
(143, 'ESTP042', 'ESTP04272CV00SB_LYL-XXL', 'LYL', 'XXL', 999, b'1', b'1'),
(144, 'ESTP042', 'ESTP04272CV00SB_CR-S', 'CR', 'S', 999, b'1', b'1'),
(145, 'ESTP042', 'ESTP04272CV00SB_CR-M', 'CR', 'M', 999, b'1', b'1'),
(146, 'ESTP042', 'ESTP04272CV00SB_CR-L', 'CR', 'L', 999, b'1', b'1'),
(147, 'ESTP042', 'ESTP04272CV00SB_CR-XL', 'CR', 'XL', 999, b'1', b'1'),
(148, 'ESTP042', 'ESTP04272CV00SB_CR-XXL', 'CR', 'XXL', 999, b'1', b'1'),
(149, 'ESTP042', 'ESTP04272CV00SB_WH-S', 'WH', 'S', 999, b'1', b'1'),
(150, 'ESTP042', 'ESTP04272CV00SB_WH-M', 'WH', 'M', 999, b'1', b'1'),
(151, 'ESTP042', 'ESTP04272CV00SB_WH-L', 'WH', 'L', 999, b'1', b'1'),
(152, 'ESTP042', 'ESTP04272CV00SB_WH-XL', 'WH', 'XL', 999, b'1', b'1'),
(153, 'ESTP042', 'ESTP04272CV00SB_WH-XXL', 'WH', 'XXL', 999, b'1', b'1'),
(154, 'ESTP033', 'ESTP03372CT00SB_BL-S', 'BL', 'S', 999, b'1', b'1'),
(155, 'ESTP033', 'ESTP03372CT00SB_BL-M', 'BL', 'M', 999, b'1', b'1'),
(156, 'ESTP033', 'ESTP03372CT00SB_BL-L', 'BL', 'L', 999, b'1', b'1'),
(157, 'ESTP033', 'ESTP03372CT00SB_BL-XL', 'BL', 'XL', 999, b'1', b'1'),
(158, 'ESTP001', 'ESTP00172TC04SB_WH-S', 'WH', 'S', 999, b'1', b'1'),
(159, 'ESTP001', 'ESTP00172TC04SB_WH-M', 'WH', 'M', 999, b'1', b'1'),
(160, 'ESTP001', 'ESTP00172TC04SB_WH-L', 'WH', 'L', 999, b'1', b'1'),
(161, 'ESTP001', 'ESTP00172TC04SB_WH-XL', 'WH', 'XL', 999, b'1', b'1'),
(162, 'ESTP060', 'ESTP06072CV32SB_NVC-S', 'NVC', 'S', 999, b'1', b'1'),
(163, 'ESTP060', 'ESTP06072CV32SB_NVC-M', 'NVC', 'M', 999, b'1', b'1'),
(164, 'ESTP060', 'ESTP06072CV32SB_NVC-L', 'NVC', 'L', 999, b'1', b'1'),
(165, 'ESTP060', 'ESTP06072CV32SB_NVC-XL', 'NVC', 'XL', 999, b'1', b'1'),
(166, 'ESTP060', 'ESTP06072CV32SB_HBR-S', 'HBR', 'S', 999, b'1', b'1'),
(167, 'ESTP060', 'ESTP06072CV32SB_HBR-M', 'HBR', 'M', 999, b'1', b'1'),
(168, 'ESTP060', 'ESTP06072CV32SB_HBR-L', 'HBR', 'L', 999, b'1', b'1'),
(169, 'ESTP060', 'ESTP06072CV32SB_HBR-XL', 'HBR', 'XL', 999, b'1', b'1'),
(170, 'ESTP007', 'ESTP00772CX32SB_WBL-S', 'WBL', 'S', 999, b'1', b'1'),
(171, 'ESTP007', 'ESTP00772CX32SB_WBL-M', 'WBL', 'M', 999, b'1', b'1'),
(172, 'ESTP007', 'ESTP00772CX32SB_WBL-L', 'WBL', 'L', 999, b'1', b'1'),
(173, 'ESTP007', 'ESTP00772CX32SB_WBL-XL', 'WBL', 'XL', 999, b'1', b'1'),
(174, 'ESTP007', 'ESTP00772CX32SB_WNV-S', 'WNV', 'S', 999, b'1', b'1'),
(175, 'ESTP007', 'ESTP00772CX32SB_WNV-M', 'WNV', 'M', 999, b'1', b'1'),
(176, 'ESTP007', 'ESTP00772CX32SB_WNV-L', 'WNV', 'L', 999, b'1', b'1'),
(177, 'ESTP007', 'ESTP00772CX32SB_WNV-XL', 'WNV', 'XL', 999, b'1', b'1'),
(178, 'ESTP020', 'ESTP02072TC32SB_BBR-S', 'BBR', 'S', 999, b'1', b'1'),
(179, 'ESTP020', 'ESTP02072TC32SB_BBR-M', 'BBR', 'M', 999, b'1', b'1'),
(180, 'ESTP020', 'ESTP02072TC32SB_BBR-L', 'BBR', 'L', 999, b'1', b'1'),
(181, 'ESTP020', 'ESTP02072TC32SB_BBR-XL', 'BBR', 'XL', 999, b'1', b'1'),
(182, 'ESTP023', 'ESTP02372CT32SB_NWH-S', 'NWH', 'S', 999, b'1', b'1'),
(183, 'ESTP023', 'ESTP02372CT32SB_NWH-M', 'NWH', 'M', 999, b'1', b'1'),
(184, 'ESTP023', 'ESTP02372CT32SB_NWH-L', 'NWH', 'L', 999, b'1', b'1'),
(185, 'ESTP023', 'ESTP02372CT32SB_NWH-XL', 'NWH', 'XL', 0, b'0', b'1'),
(186, 'ESTP015', 'ESTP01572CV32SB_WNV-S', 'WNV', 'S', 999, b'1', b'1'),
(187, 'ESTP015', 'ESTP01572CV32SB_WNV-M', 'WNV', 'M', 999, b'1', b'1'),
(188, 'ESTP015', 'ESTP01572CV32SB_WNV-L', 'WNV', 'L', 999, b'1', b'1'),
(189, 'ESTP015', 'ESTP01572CV32SB_WNV-XL', 'WNV', 'XL', 999, b'1', b'1'),
(190, 'DSTP903', 'DSTP90372CT32RB_WCB-S', 'WCB', 'S', 999, b'1', b'1'),
(191, 'DSTP903', 'DSTP90372CT32RB_WCB-M', 'WCB', 'M', 999, b'1', b'1'),
(192, 'DSTP903', 'DSTP90372CT32RB_WCB-L', 'WCB', 'L', 999, b'1', b'1'),
(193, 'DSTP903', 'DSTP90372CT32RB_WCB-XL', 'WCB', 'XL', 999, b'1', b'1'),
(194, 'DSTP903', 'DSTP90372CT32RB_HCR-S', 'HCR', 'S', 999, b'1', b'1'),
(195, 'DSTP903', 'DSTP90372CT32RB_HCR-M', 'HCR', 'M', 999, b'1', b'1'),
(196, 'DSTP903', 'DSTP90372CT32RB_HCR-L', 'HCR', 'L', 999, b'1', b'1'),
(197, 'DSTP903', 'DSTP90372CT32RB_HCR-XL', 'HCR', 'XL', 999, b'1', b'1'),
(198, 'ESTP017', 'ESTP01772CV32SB_BLE-S', 'BLE', 'S', 999, b'1', b'1'),
(199, 'ESTP017', 'ESTP01772CV32SB_BLE-M', 'BLE', 'M', 999, b'1', b'1'),
(200, 'ESTP017', 'ESTP01772CV32SB_BLE-L', 'BLE', 'L', 999, b'1', b'1'),
(201, 'ESTP017', 'ESTP01772CV32SB_BLE-XL', 'BLE', 'XL', 999, b'1', b'1'),
(202, 'ESTP022', 'ESTP02272CV32SB_WH-S', 'WH', 'S', 999, b'1', b'1'),
(203, 'ESTP022', 'ESTP02272CV32SB_WH-M', 'WH', 'M', 999, b'1', b'1'),
(204, 'ESTP022', 'ESTP02272CV32SB_WH-L', 'WH', 'L', 999, b'1', b'1'),
(205, 'ESTP022', 'ESTP02272CV32SB_WH-XL', 'WH', 'XL', 999, b'1', b'1'),
(206, 'ESTP022', 'ESTP02272CV32SB_WH-XXL', 'WH', 'XXL', 0, b'0', b'1'),
(207, 'ESTP022', 'ESTP02272CV32SB_NV-S', 'NV', 'S', 0, b'0', b'1'),
(208, 'ESTP022', 'ESTP02272CV32SB_NV-M', 'NV', 'M', 999, b'1', b'1'),
(209, 'ESTP022', 'ESTP02272CV32SB_NV-L', 'NV', 'L', 999, b'1', b'1'),
(210, 'ESTP022', 'ESTP02272CV32SB_NV-XL', 'NV', 'XL', 0, b'0', b'1'),
(211, 'ESTP022', 'ESTP02272CV32SB_NV-XXL', 'NV', 'XXL', 999, b'1', b'1'),
(212, 'ESTP018', 'ESTP01872CV32SB_NWH-S', 'WH', 'S', 999, b'1', b'1'),
(213, 'ESTP018', 'ESTP01872CV32SB_NWH-M', 'WH', 'M', 999, b'1', b'1'),
(214, 'ESTP018', 'ESTP01872CV32SB_NWH-L', 'WH', 'L', 999, b'1', b'1'),
(215, 'ESTP018', 'ESTP01872CV32SB_NWH-XL', 'WH', 'XL', 999, b'1', b'1'),
(224, 'ESTP021', 'ESTP02172CT32SB_NWH-S', 'WH', 'S', 999, b'1', b'1'),
(225, 'ESTP021', 'ESTP02172CT32SB_NWH-M', 'WH', 'M', 999, b'1', b'1'),
(226, 'ESTP021', 'ESTP02172CT32SB_NWH-L', 'WH', 'L', 999, b'1', b'1'),
(227, 'ESTP021', 'ESTP02172CT32SB_NWH-XL', 'WH', 'XL', 999, b'1', b'1'),
(232, 'ESTP014', 'ESTP01472CV08SB_BCR-S', 'BCR', 'S', 999, b'1', b'1'),
(233, 'ESTP014', 'ESTP01472CV08SB_BCR-M', 'BCR', 'M', 999, b'1', b'1'),
(234, 'ESTP014', 'ESTP01472CV08SB_BCR-L', 'BCR', 'L', 999, b'1', b'1'),
(235, 'ESTP014', 'ESTP01472CV08SB_BCR-XL', 'BCR', 'XL', 999, b'1', b'1'),
(240, 'ESTP012', 'ESTP01272CT08SB_VCB-S', 'VCB', 'S', 999, b'1', b'1'),
(241, 'ESTP012', 'ESTP01272CT08SB_VCB-M', 'VCB', 'M', 999, b'1', b'1'),
(242, 'ESTP012', 'ESTP01272CT08SB_VCB-L', 'VCB', 'L', 999, b'1', b'1'),
(243, 'ESTP012', 'ESTP01272CT08SB_VCB-XL', 'VCB', 'XL', 999, b'1', b'1'),
(244, 'DSTP650', 'DSTP65072CT04SB_BL-S', 'BL', 'S', 998, b'1', b'1'),
(245, 'DSTP650', 'DSTP65072CT04SB_BL-M', 'BL', 'M', 999, b'1', b'1'),
(246, 'DSTP650', 'DSTP65072CT04SB_BL-L', 'BL', 'L', 997, b'1', b'1'),
(247, 'DSTP650', 'DSTP65072CT04SB_BL-XL', 'BL', 'XL', 998, b'1', b'1'),
(248, 'ESTP047', 'ESTP04772CA00SB_DCR-S', 'DCR', 'S', 999, b'1', b'1'),
(249, 'ESTP047', 'ESTP04772CA00SB_DCR-M', 'DCR', 'M', 999, b'1', b'1'),
(250, 'ESTP047', 'ESTP04772CA00SB_DCR-L', 'DCR', 'L', 999, b'1', b'1'),
(251, 'ESTP047', 'ESTP04772CA00SB_DCR-XL', 'DCR', 'XL', 999, b'1', b'1'),
(252, 'ESTP047', 'ESTP04772CA00SB_BL-S', 'BL', 'S', 999, b'1', b'1'),
(253, 'ESTP047', 'ESTP04772CA00SB_BL-M', 'BL', 'M', 999, b'1', b'1'),
(254, 'ESTP047', 'ESTP04772CA00SB_BL-L', 'BL', 'L', 999, b'1', b'1'),
(255, 'ESTP047', 'ESTP04772CA00SB_BL-XL', 'BL', 'XL', 999, b'1', b'1'),
(256, 'TP004', 'DSTP00472CV32SB_BL-S', 'BL', 'S', 999, b'1', b'1'),
(257, 'TP004', 'DSTP00472CV32SB_BL-M', 'BL', 'M', 999, b'1', b'1'),
(258, 'TP004', 'DSTP00472CV32SB_BL-L', 'BL', 'L', 999, b'1', b'1'),
(259, 'TP004', 'DSTP00472CV32SB_BL-XL', 'BL', 'XL', 999, b'1', b'1');

--
-- Bẫy `products_detail`
--
DELIMITER $$
CREATE TRIGGER `delete_total_color` AFTER DELETE ON `products_detail` FOR EACH ROW BEGIN
    UPDATE products
    SET total_color = (
        SELECT COUNT(DISTINCT color_id)
        FROM products_detail
        WHERE product_id = OLD.product_id
    )
    WHERE product_id = OLD.product_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `delete_total_size` AFTER DELETE ON `products_detail` FOR EACH ROW BEGIN
    UPDATE products
    SET total_size = (
        SELECT COUNT(DISTINCT size_id)
        FROM products_detail
        WHERE product_id = OLD.product_id
    )
    WHERE product_id = OLD.product_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_status` BEFORE INSERT ON `products_detail` FOR EACH ROW BEGIN
    IF NEW.quantity <= 0 THEN
        SET NEW.out_of_stock = 0;
    ELSE
        SET NEW.out_of_stock = 1;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_total_color` AFTER INSERT ON `products_detail` FOR EACH ROW BEGIN
    UPDATE products
    SET total_color = (
        SELECT COUNT(DISTINCT color_id)
        FROM products_detail
        WHERE product_id = NEW.product_id
    )
    WHERE product_id = NEW.product_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_total_size` AFTER INSERT ON `products_detail` FOR EACH ROW BEGIN
    UPDATE products
    SET total_size = (
        SELECT COUNT(DISTINCT size_id)
        FROM products_detail
        WHERE product_id = NEW.product_id
    )
    WHERE product_id = NEW.product_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_status` BEFORE UPDATE ON `products_detail` FOR EACH ROW BEGIN
    IF NEW.quantity <= 0 THEN
        SET NEW.out_of_stock = 0;
    ELSE
        SET NEW.out_of_stock = 1;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_total_color` AFTER UPDATE ON `products_detail` FOR EACH ROW BEGIN
    UPDATE products
    SET total_color = (
        SELECT COUNT(DISTINCT color_id)
        FROM products_detail
        WHERE product_id = NEW.product_id
    )
    WHERE product_id = NEW.product_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_total_size` AFTER UPDATE ON `products_detail` FOR EACH ROW BEGIN
    UPDATE products
    SET total_size = (
        SELECT COUNT(DISTINCT size_id)
        FROM products_detail
        WHERE product_id = NEW.product_id
    )
    WHERE product_id = NEW.product_id;
END
$$
DELIMITER ;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `products_detail`
--
ALTER TABLE `products_detail`
  ADD PRIMARY KEY (`product_detail_id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `gfd` (`color_id`),
  ADD KEY `vds` (`size_id`),
  ADD KEY `grwr` (`product_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `products_detail`
--
ALTER TABLE `products_detail`
  MODIFY `product_detail_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `products_detail`
--
ALTER TABLE `products_detail`
  ADD CONSTRAINT `gfd` FOREIGN KEY (`color_id`) REFERENCES `colors` (`color_id`),
  ADD CONSTRAINT `grwr` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `vds` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`size_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
