-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th12 07, 2023 lúc 09:25 AM
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
-- Cấu trúc bảng cho bảng `accounts`
--

CREATE TABLE `accounts` (
  `account_id` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `role` int(1) NOT NULL,
  `enabled` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `accounts`
--

INSERT INTO `accounts` (`account_id`, `password`, `user_name`, `role`, `enabled`) VALUES
(1, '$2a$10$ifLsngtFn4bz/L8N0tZRXuPEbGdaj5naeJWMJHW2gzD/yj1PwMGUW', 'ADMIN', 1, b'1'),
(2, '$2a$10$0M3cRk1i6cBwq8dpc4G3P.qKDz53zrszING.aqCKLRl418biSRAvG', 'EMPLOYEE', 2, b'1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `cat_id` varchar(10) NOT NULL,
  `cat_name` varchar(30) DEFAULT NULL,
  `parent_id` varchar(10) DEFAULT NULL,
  `is_cat_active` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_name`, `parent_id`, `is_cat_active`) VALUES
('AK', 'Áo khoác', 'AO', b'1'),
('AKG', 'Áo khoác gió', 'AK', b'1'),
('AO', 'Áo nam', NULL, b'1'),
('BN', 'Bộ nỉ', 'SET', b'1'),
('PLBK', 'Polo bo kẻ', 'POLO', b'1'),
('PLCP', 'Polo can phối', 'POLO', b'1'),
('PLHT', 'Polo họa tiết', 'POLO', b'1'),
('PLK', 'Polo kẻ', 'POLO', b'1'),
('PLT', 'Polo trơn', 'POLO', b'1'),
('POLO', 'Áo polo', 'AO', b'1'),
('QA', 'Quần âu', 'QUAN', b'1'),
('QAB', 'Quần âu basic', 'QA', b'1'),
('QACR', 'Quần âu carrot', 'QA', b'1'),
('QALV', 'Quần âu LV', 'QA', b'1'),
('QAPTC', 'Quần âu phối thun cạp', 'QA', b'1'),
('QDK', 'Quần dài kaki', 'QUAN', b'1'),
('QJ', 'Quần jeans', 'QUAN', b'1'),
('QJB', 'Quần jeans basic', 'QJ', b'1'),
('QJR', 'Quần jeans rách', 'QJ', b'1'),
('QJX', 'Quần jeans xước', 'QJ', b'1'),
('QKB', 'Quần kaki basic', 'QDK', b'1'),
('QKPTC', 'Quần kaki phối thun cạp', 'QDK', b'1'),
('QS', 'Quần short', 'QUAN', b'1'),
('QUAN', 'Quần nam', NULL, b'1'),
('SD', 'Short đũi', 'QS', b'1'),
('SET', 'Set', NULL, b'1'),
('SG', 'Short gió', 'QS', b'1'),
('SKK', 'Short kaki', 'QS', b'1'),
('SMD', 'Sơ mi dài tay', 'AO', b'1'),
('SMDTD', 'Sơ mi dài tay dạ', 'SMD', b'1'),
('SMDTDemin', 'Sơ mi dài tay denim', 'SMD', b'1'),
('SMDTDui', 'Sơ mi dài tay đũi', 'SMD', b'1'),
('SMDTHT', 'Sơ mi dài tay họa tiết', 'SMD', b'1'),
('SMDTK', 'Sơ mi dài tay kẻ', 'SMD', b'1'),
('SMDTT', 'Sơ mi dài tay trơn', 'SMD', b'1'),
('SMN', 'Sơ mi ngắn tay', 'AO', b'1'),
('SMNTD', 'Sơ mi ngắn tay đũi', 'SMN', b'1'),
('SMNTDenim', 'Sơ mi ngắn tay denim', 'SMN', b'1'),
('SMNTHT', 'Sơ mi ngắn tay họa tiết', 'SMN', b'1'),
('SMNTK', 'Sơ mi ngắn tay kẻ', 'SMN', b'1'),
('SMNTT', 'Sơ mi ngắn tay trơn', 'SMN', b'1'),
('THUN', 'Áo thun', 'AO', b'1'),
('TIH', 'Thun in hình', 'THUN', b'1'),
('TT', 'Tank top', 'THUN', b'1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `colors`
--

CREATE TABLE `colors` (
  `color_id` varchar(5) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `colors`
--

INSERT INTO `colors` (`color_id`, `name`) VALUES
('BBR', 'Phối đen-nâu'),
('BCR', 'Phối xanh đá đậm - kem đậm'),
('BE', 'Be'),
('BL', 'black'),
('BLE', 'Phối đen-be'),
('BR', 'Nâu'),
('CN', 'Xanh cổ vịt'),
('CR', 'Trắng kem'),
('DCB', 'Xanh đã đậm'),
('DCR', 'Trắng - kem đậm'),
('DGN', 'Xanh lá cây đậm'),
('DNV', 'Dark Navy'),
('DTU', 'Xanh ngọc đậm'),
('HBR', 'Phối nâu trắng'),
('HCR', 'Phối kem đậm - trắng'),
('LI', 'Tím phớt'),
('LYL', 'Vàng nhạt'),
('NV', 'Xanh navy'),
('NVC', 'Phối kem navi'),
('NWH', 'Phối Navy-trắng'),
('TU', 'Xanh ngọc'),
('VCB', 'Phối xanh đá - navy'),
('WBL', 'Phối trắng-đen'),
('WCB', 'Phối Trắng - Xanh đá'),
('WH', 'Trắng'),
('WNV', 'Phối trắng-xanh navy');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `invoice_id` varchar(8) NOT NULL,
  `old_invoice_status` int(1) DEFAULT NULL,
  `new_invoice_status` int(1) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `history`
--

INSERT INTO `history` (`id`, `invoice_id`, `old_invoice_status`, `new_invoice_status`, `updated_at`) VALUES
(12, 'QWEASVXZ', 1, 2, '2023-11-29 14:00:22'),
(13, 'QWEASVXZ', 2, 0, '2023-11-29 14:00:27'),
(14, 'QWEASVXZ', 0, 1, '2023-11-29 14:00:30'),
(15, 'QWEASVXZ', 1, 0, '2023-11-29 16:40:53'),
(16, 'QWEASVXZ', 0, 1, '2023-11-29 16:41:03'),
(17, 'QWEASVXZ', 1, 0, '2023-11-29 16:42:59'),
(18, 'YHJFSFAS', 1, 0, '2023-11-29 16:43:26'),
(19, 'QWEASVXZ', 0, 1, '2023-11-29 16:44:19'),
(20, 'YHJFSFAS', 0, 1, '2023-11-29 16:44:22'),
(21, 'SDDFGSEW', 1, 2, '2023-11-29 16:50:12'),
(22, 'SDDFGSEW', 2, 0, '2023-11-29 16:50:18'),
(23, 'SDDFGSEW', 0, 3, '2023-11-29 16:50:43'),
(24, 'SDDFGSEW', 3, 0, '2023-11-29 16:50:48'),
(25, 'SDDFGSEW', 0, 1, '2023-11-29 16:50:52'),
(26, 'SDDFGSEW', 1, 3, '2023-11-29 16:51:21'),
(27, 'QWEASVXZ', 1, 0, '2023-11-29 16:51:40'),
(28, 'QWEASVXZ', 0, 1, '2023-11-29 16:51:44'),
(29, 'QWEASVXZ', 1, 0, '2023-11-29 16:52:18'),
(30, 'VCXBDSGS', 1, 0, '2023-11-29 16:52:55'),
(31, 'QWEASVXZ', 0, 1, '2023-11-29 16:56:23'),
(32, 'QWEASVXZ', 1, 0, '2023-11-29 16:57:57'),
(33, 'VCXBDSGS', 0, 1, '2023-11-29 17:12:50'),
(34, 'VCXBDSGS', 1, 0, '2023-11-29 17:12:58'),
(35, 'YHJFSFAS', 1, 0, '2023-11-29 17:13:14'),
(36, 'SDDFGSEW', 3, 0, '2023-11-29 17:13:21'),
(37, 'QWEASVXZ', 0, 1, '2023-11-29 17:13:34'),
(38, 'QWEASVXZ', 1, 2, '2023-11-29 17:33:34'),
(39, 'SDDFGSEW', 0, 1, '2023-11-29 17:33:42'),
(40, 'VCXBDSGS', 0, 1, '2023-11-29 17:33:45'),
(41, 'YHJFSFAS', 0, 1, '2023-11-29 17:33:48'),
(42, 'VCXBDSGS', 1, 0, '2023-11-29 17:34:01'),
(43, 'VCXBDSGS', 0, 1, '2023-11-30 05:48:43'),
(44, 'SDDFGSEW', 1, 2, '2023-11-30 05:48:51'),
(45, 'VCXBDSGS', 1, 2, '2023-11-30 05:48:59'),
(46, 'QWEASVXZ', 2, 0, '2023-11-30 07:34:06'),
(47, 'SDDFGSEW', 2, 0, '2023-11-30 07:34:10'),
(48, 'VCXBDSGS', 2, 0, '2023-11-30 07:34:13'),
(49, 'VCXBDSGS', 0, 1, '2023-11-30 07:39:05'),
(50, 'QWEASVXZ', 0, 1, '2023-11-30 07:44:07'),
(51, 'QWEASVXZ', 1, 0, '2023-11-30 07:44:21'),
(52, 'VCXBDSGS', 1, 0, '2023-11-30 07:44:23'),
(53, 'YHJFSFAS', 1, 0, '2023-11-30 07:44:26'),
(54, 'QWEASVXZ', 0, 1, '2023-11-30 11:58:09'),
(55, 'SDDFGSEW', 0, 1, '2023-11-30 11:58:13'),
(56, 'VCXBDSGS', 0, 1, '2023-11-30 11:58:16'),
(57, 'YHJFSFAS', 0, 1, '2023-11-30 11:58:18'),
(58, 'QWEASVXZ', 1, 0, '2023-11-30 12:05:35'),
(59, 'QWEASVXZ', 0, 1, '2023-11-30 13:09:08'),
(60, 'QWEASVXZ', 1, 0, '2023-11-30 13:09:14'),
(61, 'QWEASVXZ', 0, 1, '2023-11-30 13:09:19'),
(62, 'QWEASVXZ', 1, 2, '2023-12-03 10:09:31'),
(63, 'QWEASVXZ', 2, 3, '2023-12-03 10:16:42'),
(64, 'SDDFGSEW', 1, 0, '2023-12-03 10:17:02'),
(65, 'SDDFGSEW', 0, 1, '2023-12-03 10:17:48'),
(66, 'SDDFGSEW', 1, 0, '2023-12-03 11:00:47'),
(67, 'SDDFGSEW', 0, 1, '2023-12-03 11:06:17'),
(68, 'SDDFGSEW', 1, 2, '2023-12-03 11:12:49'),
(69, 'SDDFGSEW', 2, 1, '2023-12-03 11:15:05'),
(70, 'QWEASVXZ', 3, 4, '2023-12-03 12:55:46'),
(71, 'QWEASVXZ', 4, 3, '2023-12-03 12:55:51'),
(72, 'QWEASVXZ', 3, 4, '2023-12-03 12:55:57'),
(73, 'SDDFGSEW', 1, 2, '2023-12-03 13:15:19'),
(74, 'SDDFGSEW', 2, 0, '2023-12-03 13:15:25'),
(75, 'SDDFGSEW', 0, 1, '2023-12-03 13:15:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `imgs_product`
--

CREATE TABLE `imgs_product` (
  `img_id` int(11) NOT NULL,
  `product_id` varchar(15) DEFAULT NULL,
  `file_img` varchar(100) DEFAULT NULL,
  `background_1` bit(1) NOT NULL DEFAULT b'0',
  `background_2` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `imgs_product`
--

INSERT INTO `imgs_product` (`img_id`, `product_id`, `file_img`, `background_1`, `background_2`) VALUES
(3, 'ESTP038', 'tp038-1.jpeg', b'1', b'0'),
(4, 'ESTP038', 'tp038.jpeg', b'0', b'1'),
(5, 'ESTP038', 'tp038-41.jpeg', b'0', b'0'),
(6, 'ESTP038', 'tp038-42.jpeg', b'0', b'0'),
(7, 'ESTP038', 'tp038-43.jpeg', b'0', b'0'),
(8, 'ESTP038', 'tp038-44.jpeg', b'0', b'0'),
(9, 'ESTP038', 'tp038-45.jpeg', b'0', b'0'),
(10, 'ESTP067', 'tp067---bk004-_16__bc6a55b32ddb4d94bc5c0fa5a7997db4_master.jpg', b'1', b'0'),
(11, 'ESTP067', 'tp067---bk004-_13__eb790ac8d5dd44618429783c9ed42844_master.jpg', b'0', b'1'),
(12, 'ESTP067', '52867073164_c93edc6a70_k_9447f869422f4aa793f65556da2f944c_master.jpg', b'0', b'0'),
(13, 'ESTP067', '52866332867_b3e9385404_k_e7aa9db13469468e86586673d414a1f3_master.jpg', b'0', b'0'),
(14, 'ESTP067', '52867351953_9e3e03f2b1_k_096de1bcfee34099969d0edd7b8e6f26_master.jpg', b'0', b'0'),
(15, 'ESTP067', '52866332727_2f58586473_k_7ac15a1978a04a37a6713af0bab43b09_master.jpg', b'0', b'0'),
(16, 'ESTP067', '52867351793_7fdd444ee2_k_4c9345e571394a009fa0e3e68e76a451_master.jpg', b'0', b'0'),
(17, 'ESTP067', '52867351808_e5a4600839_k_f877288ddfab4de6b74713bccd8dc336_master.jpg', b'0', b'0'),
(18, 'ESTP067', '52866332657_414108a7c6_k_b4b4ef2544e94d1c9e65de3dc7f57209_master.jpg', b'0', b'0'),
(19, 'ESTP067', '52867351903_e8df6368ea_k_93703527ed854f82a3c46db0c674704c_master.jpg', b'0', b'0'),
(20, 'ESTP067', '52867351913_203d16cda4_k_d6e60d7f209d4832b26a4e9044b8af9e_master.jpg', b'0', b'0'),
(21, 'ESTP067', '52867351923_7cae731772_k_c20306b870404071b12dad2f38d0d093_master.jpg', b'0', b'0'),
(22, 'ESTP028', 'tp028---bk004-_11__9246a1d8b0184518abd852704bd4fa02_master.jpg', b'1', b'1'),
(28, 'ESTP067', '4_8fb2c95d0ce84becbb58fd9ed237ba08_master.jpg', b'0', b'0'),
(29, 'ESTP067', '6_6839924c418d47e183d08e255b8c3c63_master.jpg', b'0', b'0'),
(30, 'ESTP067', '52789526191_861fe9d52b_o_21ebcee1355d4c3dad77e7d3c1ff0d4c_master.jpg', b'0', b'0'),
(31, 'DSTP611', 'tp611_59ea616328234a9b969ce2d1c48c482f_master.jpg', b'1', b'0'),
(32, 'DSTP611', 'tp611-1_e64e507a26034c7cab4000647d260ede_master.jpg', b'0', b'1'),
(33, 'DSTP611', '1_1e206b362a714f3d98754a060ce09454_master.jpg', b'0', b'0'),
(34, 'DSTP611', '3_4dd89c6d76d54a4d96db9ec8d1ab1e93_master.jpg', b'0', b'0'),
(41, 'ESTP010', 'tp010---bk603-_8__b6487398009b4c6eaa1950ee0f26e718_master.jpg', b'1', b'0'),
(42, 'ESTP010', 'tp010---bk603-_18__182eb99ee71a46a381827867ad2a96de_master.jpg', b'0', b'1'),
(43, 'ESTP010', '52769491109_e6fb49f9f0_o_32455b99bcaf4082aa9cd70b23af5f9e_master.jpg', b'0', b'0'),
(44, 'ESTP010', '52769491159_ba17744c21_o_9ef26ec3123b4c97aab4ab0e25cba4d5_master.jpg', b'0', b'0'),
(45, 'ESTP010', '52769491004_ecb5666549_o_219d2b308f9e43a6a1afbbb5fe2bd5b9_master.jpg', b'0', b'0'),
(46, 'ESTP010', '52769490734_e7c5ff8fef_o_e395740c9186424989fac889b1c7d4f7_master.jpg', b'0', b'0'),
(47, 'ESTP032', 'estp032-3_f94042405af64ca581ca72c753b53b51_master.jpg', b'1', b'0'),
(48, 'ESTP032', 'estp032-3_5833a48d93d041fab7b4a56668a78262_master.jpg', b'0', b'1'),
(49, 'ESTP032', 'estp032-1_86750080b9b3454bb7b35f79c996f898_master.jpg', b'0', b'0'),
(50, 'ESTP032', 'estp032-2_c5486330b45845dd9e4e9dd652d9fe51_master.jpg', b'0', b'0'),
(51, 'ESTP032', 'estp032-3_52866931581_o_696a4be7241646908451a50a1ab3ec7c_master.jpg', b'0', b'0'),
(52, 'ESTP032', 'estp032-4_52866931551_o_a66d94b2046f471d8bfb1bf8342400c9_master.jpg', b'0', b'0'),
(53, 'ESTP032', 'estp032-5_52867320575_o_3c67b3a8e6f74535aa323e0926391185_master.jpg', b'0', b'0'),
(54, 'ESTP032', 'estp032-11_52866355737_o_a52dd32e7b96416ab120276b6d4403e4_master.jpg', b'0', b'0'),
(55, 'ESTP032', '1_50f16dbd5df34aa3acc99865b4820084_master.jpg', b'0', b'0'),
(56, 'ESTP032', '2_5933a603e4074662bfe7cc6b5fe1e44b_master.jpg', b'0', b'0'),
(57, 'ESTP032', '3_e2f6d02236ac4e0397a15b372c85bfb2_master.jpg', b'0', b'0'),
(58, 'ESTP032', '4_aaa0fd53411a441e85605a458aab67f7_master.jpg', b'0', b'0'),
(59, 'ESTP032', '5_5bf4a94b5b19485199441c580dae0f6a_master.jpg.jpg', b'0', b'0'),
(60, 'ESTP032', '6_9622c2cf1ffe49dd9d06ac5ca4d10119_master.jpg.jpg', b'0', b'0'),
(61, 'ESTP032', '7_e37142ddf18d4daa898aac91aa82eb92_master.jpg.jpg', b'0', b'0'),
(62, 'ESTP005', 'tp005_52e371ed726e4f2d8401d86c5e0b38fb_master.jpg', b'1', b'0'),
(63, 'ESTP005', 'tp005-1_540fc6869412410498fde0786b1e4ae5_master.jpg', b'0', b'1'),
(64, 'ESTP005', '52826115451_f0f0e4aba3_o_1e2aaae876504b3781a5bf9eaa3e8649_master.jpg', b'0', b'0'),
(65, 'ESTP005', 'estp005_52832929942_o_1fa1849607d14981bf7a289fa35bca7e_master.jpg', b'0', b'0'),
(66, 'ESTP005', 'estp005_52832930232_o_c2dc6fe645224bbdace38aee17ba4ebc_master.jpg', b'0', b'0'),
(67, 'ESTP005', 'estp005_52833497146_o_19f6e6d8b44947d4bcd7461012e1e40d_master.jpg', b'0', b'0'),
(68, 'ESTP041', 'estp041-16_4cb9d42d84e7436884bd3f4e648621ed_master.jpg', b'1', b'0'),
(69, 'ESTP041', 'estp041-12_f4f5deac05fa47789c5897ba7a06818f_master.jpg', b'0', b'1'),
(70, 'ESTP041', 'estp041-11_5cc08ee5a7f94d739d935b090e8657ce_master.jpg', b'0', b'0'),
(71, 'ESTP041', 'estp041-15_0af52441e90e49aebae6f5874f100c2d_master.jpg', b'0', b'0'),
(72, 'ESTP041', 'estp041-13_052acb199d294321a1158807cea0d5b4_master.jpg', b'0', b'0'),
(73, 'ESTP041', 'estp041-14_c216ec36194c4f7da5d099aff22b8316_master.jpg', b'0', b'0'),
(74, 'ESTP041', 'estp041-6_3141cb9f439d4fb0b02a8d09f2d0e836_master.jpg', b'0', b'0'),
(75, 'ESTP041', 'estp041-3_83014782b53841358a80703e3de20b49_master.jpg', b'0', b'0'),
(76, 'ESTP041', 'estp041-7_38c774c7c3f74bfa852ec9fb4923a3de_master.jpg', b'0', b'0'),
(77, 'ESTP041', 'estp041-9_b544581a872a4d32bb9c8c4ed240c6dd_master.jpg', b'0', b'0'),
(78, 'ESTP041', 'estp041-8_316b7cd7e97744ac925f985863972761_master.jpg', b'0', b'0'),
(79, 'ESTP041', 'estp041-1_6a52d5fd1f594e2b9acee2d830b78b58_master.jpg', b'0', b'0'),
(80, 'ESTP041', 'estp041-2_0fe28f88db44491aa3f4e7ce0daf884e_master.jpg', b'0', b'0'),
(81, 'ESTP041', 'estp041-4_0f2a7f2b52d645dab95a9cdd5fdee0f3_master.jpg', b'0', b'0'),
(82, 'ESTP041', 'estp041-5_2d4ac01b779044a4ba9e1e3343e328f9_master.jpg', b'0', b'0'),
(83, 'ESTP042', 'tp042---bk004-_9__2efe604ac9324e06841cf8edc590e169_master.jpg', b'1', b'0'),
(84, 'ESTP042', 'tp042---bk004-_12__0fc56a3426f74ac79d1f10f9ab0b2fde_master.jpg', b'0', b'1'),
(85, 'ESTP042', 'estp042-br-4_52866363897_o_4cea7101361d4aeda23916a73776bc89_master.jpg', b'0', b'0'),
(86, 'ESTP042', 'estp042-br-5_52866363922_o_3b22baf5d6c540749f0eae1b143090b6_master.jpg', b'0', b'0'),
(87, 'ESTP042', 'estp042-br-1_52867103974_o_cfe354dcf6f54ba0b8a85cd45a0948a7_master.jpg', b'0', b'0'),
(88, 'ESTP042', 'estp042-br-2_52867382413_o_baf78a07a1e84447a3f01c49f2a55146_master.jpg', b'0', b'0'),
(89, 'ESTP042', 'estp042-br-3_52867103924_o_82a3a7e6860f480e91b11f3a5e7e18ed_master.jpg', b'0', b'0'),
(90, 'ESTP042', 'estp042-1_52867104114_o_aff74874616b45889ded6a949e0a1eb9_master.jpg', b'0', b'0'),
(91, 'ESTP042', 'estp042-bl-2_52867328655_o_55af013d6db2478fb8002da234a249d3_master.jpg', b'0', b'0'),
(92, 'ESTP042', 'estp042-cr-2_52867383288_o_cfa01925fc274a748e611e45bc874487_master.jpg', b'0', b'0'),
(93, 'ESTP042', 'estp042-dtu-2_52867383188_o_19e01fc82fca404e9629f3eff9993e76_master.jpg', b'0', b'0'),
(94, 'ESTP042', 'estp042-li-4_52866364592_o_4a615385ee834290ba6df68a2ed69311_master.jpg', b'0', b'0'),
(95, 'ESTP042', 'estp042-lyl-2_52867329090_o_51fd4f8cbbbf49f7890af4a9829581fb_master.jpg', b'0', b'0'),
(96, 'ESTP042', 'estp042-nv-3_52867104354_o_0580916685074dcdafdd251732674e2a_master.jpg', b'0', b'0'),
(97, 'ESTP042', 'estp042-tu-2_52866939911_o_96bd77d6c720444f86e520f606c880be_master.jpg', b'0', b'0'),
(98, 'ESTP042', 'estp042-wh-2_52867104164_o_0190b878eb0240c7bdc957655d380cbf_master.jpg', b'0', b'0'),
(99, 'ESTP033', 'm1t1_9a04e0331596472281861b7f44cc3ca2_master.jpg', b'1', b'0'),
(100, 'ESTP033', '2_9f21c1bc2bb4483aa055ffb7356ecf2b_master.jpg', b'0', b'1'),
(101, 'ESTP033', '3_13e212d45d7d4bf0969316de7ea60043_master.jpg', b'0', b'0'),
(102, 'ESTP033', '4_f4b074268aae494a83ba8ae43ff8ab3d_master.jpg', b'0', b'0'),
(103, 'ESTP033', '5_b213c588677e4d9bb736c832971db86b_master.jpg', b'0', b'0'),
(114, 'ESTP001', 'estp001-2_ca463de5f50243ff920007e6314ac0eb_master.jpg', b'1', b'0'),
(115, 'ESTP001', 'estp001-3_af8e67d349a34ea2857b8f923538bfba_master.jpg', b'0', b'1'),
(116, 'ESTP001', 'estp001-1_e79f5d2eed6b4d15be9136100b48c52e_master.jpg', b'0', b'0'),
(117, 'ESTP001', '2_03d7f4c5170c475ab303f4a1a35f7772_master.jpg', b'0', b'0'),
(118, 'ESTP001', '3_d899896ff01a4adeb430b83c94dc2483_master.jpg', b'0', b'0'),
(119, 'ESTP001', '4_fe228fc01afa43a082ef4bda0d636e20_master.jpg', b'0', b'0'),
(120, 'ESTP001', '7_9bc29d0a14064c70aca802cc201f2750_master.jpg', b'0', b'0'),
(121, 'ESTP060', '3_a6cdb2c46dd543fd9507418aef06c558_master.jpg', b'0', b'0'),
(122, 'ESTP060', '2_d527cf7f226e40c9bdf647d7cfcdb73d_master.jpg', b'0', b'0'),
(123, 'ESTP060', '52951329992_50ac43f695_o_0d0d415fa295462dbb496e1cda501bad_master.jpg', b'0', b'0'),
(124, 'ESTP060', 'estp060-1_eb469e85967d44e3a36e4dc8ca9ae0ea_master.jpg', b'1', b'0'),
(125, 'ESTP060', 'estp060-4_3fbb20aa4c1b4ff1b054225ad070a6f9_master.jpg', b'0', b'1'),
(126, 'ESTP060', 'estp060-2_322d5e5eab9a4de399752a3783025240_master.jpg', b'0', b'0'),
(127, 'ESTP060', 'estp060-3_326826ec287a49b58f66324c764a15fe_master.jpg', b'0', b'0'),
(142, 'ESTP007', 'estp007-1_9cd4cd6e34ac4041bb7e96da2d1eeb22_master.jpg', b'1', b'0'),
(143, 'ESTP007', 'tp007---bj901-_19__77bda55d7cb8490981e89a43f2accbb2_master.jpg', b'0', b'1'),
(144, 'ESTP007', '52898691552_37ea5079d3_o_ebb2277a32594cc7b1e9e4a218be9e8b_master.jpg', b'0', b'0'),
(145, 'ESTP007', '52898691577_03b1414605_o_b27a16af3124429d86bf5da8f0cf0a0c_master.jpg', b'0', b'0'),
(146, 'ESTP007', '52899265456_b212798cac_o_9aef58b065eb48c38e1c8ec115b234d9_master.jpg', b'0', b'0'),
(147, 'ESTP007', '52899713483_5b59788a82_o_46b4209167da44989fbc7a67d156289c_master.jpg', b'0', b'0'),
(148, 'ESTP007', '52899660480_41c01903c4_o_5bd3da357e264f1891e47d54d5d3b4ef_master.jpg', b'0', b'0'),
(149, 'ESTP007', '52898691562_67c82c3ca7_o_9da334afa0244604bf21a0d59cf2a7f2_master.jpg', b'0', b'0'),
(150, 'ESTP020', 'tp020---bk001-_10__b44a6900b6934440ad797f313b2cdd9a_master.jpg', b'0', b'1'),
(151, 'ESTP020', 'tp020---bk001-_19__39c7901d719942a790b6cf8a9584383a_master.jpg', b'1', b'0'),
(152, 'ESTP020', 'estp020-2_52826081331_o_54237fd9c1084a329c27f40c559396b5_master.jpg', b'0', b'0'),
(153, 'ESTP020', 'estp020-3_52826521153_o_065f5c020fe441299ef865b526ad311d_master.jpg', b'0', b'0'),
(154, 'ESTP020', 'estp020-1_52825506602_o_a115b5ddf53148a08d97e01ff7b86d24_master.jpg', b'0', b'0'),
(155, 'ESTP020', 'estp020-4_52825506387_o_91c212f08243413dbd963193d05a30e4_master.jpg', b'0', b'0'),
(168, 'ESTP023', '1_4554a899fc974e40bc58638b060b31ee_master.jpg', b'1', b'0'),
(169, 'ESTP023', '2_01804471604b4ce29bbd620d5ac8f08f_master.jpg', b'0', b'1'),
(170, 'ESTP023', 'estp023_f704d9ca4a9142c587f3d01d7bf20088_master.jpg', b'0', b'0'),
(171, 'ESTP023', 'estp023-2_e8cc41d54ae748558cbb1fefc99ffa80_master.jpg', b'0', b'0'),
(172, 'ESTP023', 'estp023-3_cbe5abc9a09543df8bcd296c5b941ccf_master.jpg', b'0', b'0'),
(173, 'ESTP015', 'estp015_a0e07e027c614085b06c261c289544ab_master.jpg', b'1', b'0'),
(174, 'ESTP015', 'estp015-1_4850d0b18f664531958be981c80b3849_master.jpg', b'0', b'1'),
(175, 'ESTP015', '52984839667_2b60bd0a5c_o_3c6abb663b134583890c1f84a05afa34_master.jpg', b'0', b'0'),
(176, 'ESTP015', '52985585104_6b4d0aa540_o_5bfd3df1d8074e8b988393d17058d82e_master.jpg', b'0', b'0'),
(177, 'ESTP015', '52985814890_0e0f66878b_o_cb9d7e43b07940179e8a0377ef9f4496_master.jpg', b'0', b'0'),
(178, 'DSTP903', 'dstp903_52866905251_o_735380510ed1481090a9d817d712432b_master.jpg', b'0', b'1'),
(179, 'DSTP903', 'dstp903-5_52899252161_o_fbbfca6789984d79a05a30395baebf8d_master.jpg', b'1', b'0'),
(180, 'DSTP903', 'dstp903_52866328857_o_dcb32e4dd65b4c0692aba155328ae3f1_master.jpg', b'0', b'0'),
(181, 'DSTP903', 'dstp903_52867348133_o_1a35eb97c32d48aba7cc60754f132f89_master.jpg', b'0', b'0'),
(182, 'DSTP903', 'dstp903_52867348138_o_89a8c909f5ec431c9f313c754ae9e042_master.jpg', b'0', b'0'),
(183, 'DSTP903', 'dstp903_52867348178_o_9eaaa6a1c432440b8bc3a8863c2d4699_master.jpg', b'0', b'0'),
(184, 'DSTP903', 'dstp903-1_52899647210_o_3e4bedccc26c4921bf2d0e26cbd987bd_master.jpg', b'0', b'0'),
(185, 'DSTP903', 'dstp903-2_52899647325_o_d2a330409f00496ea82d68f220729469_master.jpg', b'0', b'0'),
(186, 'DSTP903', 'dstp903-3_52899414579_o_48d0f7660d7648f18f998fa3f52cd042_master.jpg', b'0', b'0'),
(187, 'DSTP903', 'dstp903-4_52899252121_o_ae557b13c3e54659beab9355b85ac6e1_master.jpg', b'0', b'0'),
(189, 'ESTP017', '52984841597_c4f0a17882_o_537cdc00b2124e288af5d94002fba114_master.jpg', b'1', b'0'),
(190, 'ESTP017', '52984841637_be878f2e96_o_b2155ec1c2c6425a94b240f852a798d4_master.jpg', b'0', b'1'),
(191, 'ESTP017', '52985816615_83d5e68a16_o_a38ee4423e9a4d9e9a719237c6aa6f52_master.jpg', b'0', b'0'),
(192, 'ESTP017', '52985905053_bdeffa314e_o_aa67bed06deb439399cc2046790f8c59_master.jpg', b'0', b'0'),
(193, 'ESTP022', '52901478774_f103d7180e_o_6ec337721b6d4a8bae3c2626bca7d037_master.jpg', b'1', b'0'),
(194, 'ESTP022', '52900747392_3bd87b9424_o_ef4fd5e38ee643538ccbfa25af4daa72_master.jpg', b'0', b'1'),
(195, 'ESTP022', '52900747527_b5ba3ab3a3_o_c0e500d9ecf04e648a5b4eadafa8c56d_master.jpg', b'0', b'0'),
(196, 'ESTP022', '52901708515_30006cf211_o_f3e3d22e5e3e42078feb7d3d311ef24c_master.jpg', b'0', b'0'),
(197, 'ESTP022', '52901317611_a0acf4ef9f_o_615c31feb98a4e81a2ef903f914370b3_master.jpg', b'0', b'0'),
(198, 'ESTP022', '52901708410_5a8af79350_o_a64f83bc7f1140c4bcd2cb9dfdcb1882_master.jpg', b'0', b'0'),
(199, 'ESTP022', '52901708465_503bdb72bc_o_44f82d09c0c549f7b87f0a9fc128200d_master.jpg', b'0', b'0'),
(200, 'ESTP022', '52901317591_9d166f4fa0_o_15c83e519bbb4b08bc17abc027167bb1_master.jpg', b'0', b'0'),
(201, 'ESTP018', 'tp018_0691972d076d4071a4fee5291912df9e_master.jpg', b'1', b'0'),
(202, 'ESTP018', 'tp018---bk001-_14__c88cf49e00c3437cbed27b9e9b7e6bbb_master.jpg', b'0', b'1'),
(203, 'ESTP018', '52826112561_28a33161d2_o_863d94fe95454b768bab5808fcb136fe_master.jpg', b'0', b'0'),
(204, 'ESTP018', '20230418_utjkznvmqy_2bb5168802fa45a3aa7687b49275558c_master.jpg', b'0', b'0'),
(205, 'ESTP018', '20230418_zdan7vokau_193adb5ef92d4ff0a9628a7e8087719a_master.jpg', b'0', b'0'),
(206, 'ESTP021', 'estp021-2_7b1e8ac1a10c4163bf199b7b89332d81_master.jpg', b'1', b'0'),
(207, 'ESTP021', '52761369041_9f0e67d125_o_9032748cb48b41bc872cef7ab7b26fce_master.jpg', b'0', b'1'),
(208, 'ESTP021', '3_a205919edf4d4446a1522a2c10bc383f_master.jpg', b'0', b'0'),
(209, 'ESTP021', '4_c8d69e314ed348e4bd9c456f2721a78d_master.jpg', b'0', b'0'),
(210, 'ESTP021', '5_1137cf2bb12540fe8f3e15d4b6719363_master.jpg', b'0', b'0'),
(221, 'ESTP014', 'estp014_f4dabbabbe0346598163050a85b06f1a_master.jpg', b'1', b'0'),
(222, 'ESTP014', '52963145971_d831ed870e_o_0cb9f3d06fb2434f92c94c572d9f7820_master.jpg', b'0', b'1'),
(223, 'ESTP014', '52962545147_25055ccc29_o_af189f39f582417bb4e7d78258ba2afb_master.jpg', b'0', b'0'),
(224, 'ESTP014', '52963145991_ed718131ed_o_c94a43b3e7be4f2d955466fc9ad6cafa_master.jpg', b'0', b'0'),
(225, 'ESTP014', '52963286319_9f96c02b76_o_777e3a250afb437a834bb46e13a3b849_master.jpg', b'0', b'0'),
(226, 'ESTP012', 'tp012_0d295f194e3f4f0eab7eede288c3a7c5_master.jpg', b'1', b'0'),
(227, 'ESTP012', '52962546502_67cf66a988_o_50eedd51b47d489c851da09e2dd4787e_master.jpg', b'0', b'1'),
(228, 'ESTP012', '52963148566_1522e0b1d5_o_f23c0e6864fc465f8ba86fb4e02f6eca_master.jpg', b'0', b'0'),
(229, 'ESTP012', '52963148571_85db89bd29_o_6be3d4ece33747288a86005d9ace3990_master.jpg', b'0', b'0'),
(230, 'ESTP012', '52963526080_043a99d427_o_361c1c8965ed4a379649be937138d1a4_master.jpg', b'0', b'0'),
(237, 'DSTP650', 'tp650---bi801-_7__abbb944d2018481c829e959580b99514_master.jpg', b'1', b'0'),
(238, 'DSTP650', 'tp650---bi801-_17__b30c2c74b038490f890dfec689b60602_master.jpg', b'0', b'1'),
(239, 'DSTP650', '1_dafd00796d394cdbafeebc27a23aebbe_master.jpg', b'0', b'0'),
(240, 'DSTP650', '3_6e830c4790f546dd91780c15c5c3d2df_master.jpg', b'0', b'0'),
(241, 'DSTP650', '2_3cd9ac4ea4134a5cb2377036c8858bfd_master.jpg', b'0', b'0'),
(242, 'DSTP650', '4_485c2d0480d84e4b983817d401d0c65d_master.jpg', b'0', b'0'),
(243, 'ESTP047', '5_66590d1cba6041359e8a89a1c7e0feb5_master.jpg', b'0', b'0'),
(244, 'ESTP047', '1_eaabf57d435740af8ed20d6f40378045_master.jpg', b'0', b'0'),
(245, 'ESTP047', '2_25c38d6c27394c258025535e2bc9d5bd_master.jpg', b'0', b'0'),
(246, 'ESTP047', '6_e4d2cb26997d464985a485cc7f212599_master.jpg', b'0', b'0'),
(247, 'ESTP047', '4_a52dff1ab14f48e7b978ced85dfb6806_master.jpg', b'0', b'0'),
(248, 'ESTP047', 'estp047-1_1f39491e95314848a3036b88e0bdcc90_master.jpg', b'1', b'0'),
(249, 'ESTP047', 'estp047-2_7378910d66be4c0a8dcc152afcb330e0_master.jpg', b'0', b'1'),
(254, 'TP004', 'tp004_45415f65d7bc4f4c8d52f4893d682a43_master.jpg', b'1', b'0'),
(255, 'TP004', 'tp004-2_572851b755514fa7b302d5120a7d3b94_master.jpg', b'0', b'1'),
(256, 'TP004', '5_14e1329ad875426cbc7afb776056eeae_master.jpg', b'0', b'0'),
(257, 'TP004', '4_4d48bde78a5148fab5623251d0da8e08_master.jpg', b'0', b'0'),
(258, 'TP004', '3_0f0a15621d144f79b8228e7763b3b8e5_master.jpg.jpg', b'0', b'0'),
(297, 'ESTP074', '1701361255341_10_ab507de1e88747f99527ac4852b40535_master.jpg', b'0', b'0'),
(298, 'ESTP074', '1701361255426_9_ae65d9fd2f8f4cfcb114ee123fcffd63_master.jpg', b'0', b'0'),
(299, 'ESTP074', '1701361255431_8_62f9c35e209b490fa0012a46b2faada3_master.jpg', b'0', b'0'),
(300, 'ESTP074', '1701361255434_7_e37142ddf18d4daa898aac91aa82eb92_master.jpg', b'0', b'0'),
(301, 'ESTP074', '1701361255437_6_9622c2cf1ffe49dd9d06ac5ca4d10119_master.jpg', b'0', b'0'),
(302, 'ESTP074', '1701361255440_5_5bf4a94b5b19485199441c580dae0f6a_master.jpg', b'0', b'0'),
(303, 'ESTP074', '1701361255443_4_aaa0fd53411a441e85605a458aab67f7_master.jpg', b'0', b'0'),
(304, 'ESTP074', '1701361255445_3_e2f6d02236ac4e0397a15b372c85bfb2_master.jpg', b'0', b'0'),
(305, 'ESTP074', '1701361255449_2_5933a603e4074662bfe7cc6b5fe1e44b_master.jpg', b'1', b'0'),
(306, 'ESTP074', '1701361255452_1_50f16dbd5df34aa3acc99865b4820084_master.jpg', b'0', b'1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `imgs_size`
--

CREATE TABLE `imgs_size` (
  `img_size_id` int(11) NOT NULL,
  `img_name` varchar(30) DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `imgs_size`
--

INSERT INTO `imgs_size` (`img_size_id`, `img_name`, `link`) VALUES
(1, 'Size áo polo', 'size-polo.jpeg'),
(2, 'Size áo sơ mi', 'tagsize_2_img.jpeg'),
(3, 'Size quần âu', 'tagsize_3_img.jpeg'),
(4, 'Size quần jean', 'tagsize_4_img.jpg'),
(5, 'Size áo khoác', 'tagsize_5_img.jpeg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `incvoice_status`
--

CREATE TABLE `incvoice_status` (
  `invoice_status` int(1) NOT NULL,
  `status` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `incvoice_status`
--

INSERT INTO `incvoice_status` (`invoice_status`, `status`) VALUES
(0, 'Đã hủy'),
(1, 'Đơn mới'),
(2, 'Đã lên đơn');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoices`
--

CREATE TABLE `invoices` (
  `invoice_id` varchar(8) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `total_amount` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `note` varchar(255) NOT NULL,
  `invoice_status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `invoices`
--

INSERT INTO `invoices` (`invoice_id`, `name`, `phone`, `address`, `total_amount`, `created_at`, `note`, `invoice_status`) VALUES
('QWEASVXZ', 'zxca', '93232', 'vxdvs', 2383333, '2023-12-03 12:55:57', 'dfdfdfs3', 4),
('SDDFGSEW', 'quang anh', '932', '4dvsdsf', 2799999, '2023-12-07 03:23:57', 'hello\r\nx', 1),
('VCXBDSGS', 'SF', '93232', '4fdsdvs', 333333, '2023-11-26 09:39:38', 'dsf', 1),
('YHJFSFAS', 'Qvxa', '21932', '4cddvs', 2550000, '2023-11-26 09:39:38', '', 1);

--
-- Bẫy `invoices`
--
DELIMITER $$
CREATE TRIGGER `update_status_history` AFTER UPDATE ON `invoices` FOR EACH ROW BEGIN
    IF NEW.invoice_status <> OLD.invoice_status THEN
        INSERT INTO history (invoice_id, old_invoice_status, new_invoice_status, updated_at)
        VALUES (NEW.invoice_id, OLD.invoice_status, NEW.invoice_status, NOW());
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoices_detail`
--

CREATE TABLE `invoices_detail` (
  `detail_id` int(11) NOT NULL,
  `invoice_id` varchar(8) DEFAULT NULL,
  `product_detail_id` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `invoices_detail`
--

INSERT INTO `invoices_detail` (`detail_id`, `invoice_id`, `product_detail_id`, `price`, `quantity`, `total_price`) VALUES
(3, 'YHJFSFAS', 87, 490000, 1, 490000),
(4, 'YHJFSFAS', 195, 390000, 4, 1560000),
(7, 'QWEASVXZ', 190, 490000, 1, 490000),
(8, 'QWEASVXZ', 246, 390000, 4, 1560000),
(25, 'SDDFGSEW', 46, 333333, 3, 999999),
(26, 'SDDFGSEW', 246, 450000, 3, 1350000),
(28, 'SDDFGSEW', 247, 450000, 1, 450000),
(29, 'QWEASVXZ', 46, 333333, 1, 333333),
(30, 'VCXBDSGS', 47, 333333, 1, 333333),
(31, 'YHJFSFAS', 234, 500000, 1, 500000);

--
-- Bẫy `invoices_detail`
--
DELIMITER $$
CREATE TRIGGER `calculate_delete` AFTER DELETE ON `invoices_detail` FOR EACH ROW BEGIN
    DECLARE total int;

    -- Tính tổng tiền cho invoice có id tương ứng với dòng mới chèn vào invoice_detail
    SELECT SUM(total_price) INTO total
    FROM invoices_detail
    WHERE invoice_id = invoice_id;

    -- Cập nhật tổng tiền vào bảng invoice
    UPDATE invoices
    SET total_amount = 0
    WHERE invoice_id = invoice_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `calculate_invoice_total` AFTER INSERT ON `invoices_detail` FOR EACH ROW BEGIN
    DECLARE total int;

    -- Tính tổng tiền cho invoice có id tương ứng với dòng mới chèn vào invoice_detail
    SELECT SUM(total_price) INTO total
    FROM invoices_detail
    WHERE invoice_id = NEW.invoice_id;

    -- Cập nhật tổng tiền vào bảng invoice
    UPDATE invoices
    SET total_amount = total
    WHERE invoice_id = NEW.invoice_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `calculate_invoice_total_update` AFTER UPDATE ON `invoices_detail` FOR EACH ROW BEGIN
    DECLARE total int;

    -- Tính tổng tiền cho invoice có id tương ứng với dòng mới chèn vào invoice_detail
    SELECT SUM(total_price) INTO total
    FROM invoices_detail
    WHERE invoice_id = NEW.invoice_id;

    -- Cập nhật tổng tiền vào bảng invoice
    UPDATE invoices
    SET total_amount = total
    WHERE invoice_id = NEW.invoice_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert` BEFORE INSERT ON `invoices_detail` FOR EACH ROW BEGIN
  
    IF NEW.price IS NOT NULL THEN
    SET NEW.`total_price` = NEW.price * NEW.quantity;

    END IF;
    
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update` BEFORE UPDATE ON `invoices_detail` FOR EACH ROW BEGIN
  
    IF NEW.price IS NOT NULL THEN
    SET NEW.`total_price` = NEW.price * NEW.quantity;

    END IF;
    
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoices_status`
--

CREATE TABLE `invoices_status` (
  `status_id` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `invoices_status`
--

INSERT INTO `invoices_status` (`status_id`, `status`) VALUES
(0, 'Hủy'),
(1, 'Đơn mới'),
(2, 'Đang xử lý'),
(3, 'Đã lên đơn'),
(4, 'Đang giao hàng'),
(5, 'Thành công'),
(6, 'Hoàn');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` varchar(15) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `cat_id` varchar(10) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `discount_price` int(11) DEFAULT NULL,
  `discount_percent` int(11) DEFAULT NULL,
  `is_discount` bit(1) DEFAULT b'0',
  `brand` varchar(20) DEFAULT 'TORANO',
  `description` text DEFAULT NULL,
  `img_size_id` int(11) NOT NULL,
  `total_size` int(11) DEFAULT 0,
  `total_color` int(11) DEFAULT 0,
  `is_product_active` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `cat_id`, `price`, `discount_price`, `discount_percent`, `is_discount`, `brand`, `description`, `img_size_id`, `total_size`, `total_color`, `is_product_active`) VALUES
('DSTP611', 'Áo polo trơn bo kẻ DSTP611', 'PLHT', 333333, NULL, NULL, b'0', 'Torano', '', 1, 4, 1, b'1'),
('DSTP650', 'Áo Polo monogram TRN DSTP650', 'PLCP', 450000, NULL, NULL, b'0', 'TORANO', 'Áo Polo monogram TRN 1.DSTP650', 1, 4, 1, b'1'),
('DSTP903', 'Áo polo can phối Horizontal Color Scheme DSTP903', 'PLCP', 420000, 290000, 31, b'1', 'TORANO', '', 1, 4, 2, b'1'),
('ESTP001', 'Áo polo họa tiết in tràn ESTP001', 'PLHT', 420000, NULL, NULL, b'0', 'TORANO', '', 1, 4, 1, b'1'),
('ESTP005', 'Áo polo trơn bo kẻ, logo cánh tay ESTP005', 'PLT', 420000, NULL, NULL, b'0', 'TORANO', 'Áo polo trơn bo kẻ, logo cánh tay ESTP005', 1, 4, 1, b'1'),
('ESTP007', 'Áo Polo can phối 3 màu ESTP007', 'PLCP', 420000, NULL, NULL, b'0', 'TORANO', 'Áo polo nam cao cấp đẹp, tôn dáng. Chất vải dệt mềm, dày dặn không bai xù nhăn nhàu', 1, 4, 2, b'1'),
('ESTP010', 'Áo polo trơn bo kẻ ESTP010', 'PLT', 400000, NULL, NULL, b'0', 'TORANO', NULL, 1, 5, 3, b'1'),
('ESTP012', 'Áo Polo kẻ dệt ngang 1.ESTP012', 'PLK', 500000, NULL, NULL, b'0', 'TORANO', NULL, 1, 4, 1, b'1'),
('ESTP014', 'Áo Polo kẻ dệt ngang 1.ESTP014', 'PLK', 500000, NULL, NULL, b'0', 'TORANO', NULL, 1, 4, 1, b'1'),
('ESTP015', 'Áo polo can phối Horizontal Color Scheme 1.ESTP015', 'PLCP', 450000, NULL, NULL, b'0', 'TORANO', NULL, 1, 4, 1, b'1'),
('ESTP017', 'Áo polo can phối Horizontal Color Scheme ESTP017', 'PLCP', 420000, NULL, NULL, b'0', 'TORANO', NULL, 1, 4, 1, b'1'),
('ESTP018', 'Áo polo can phối, thêu logo ngực ESTP018', 'PLCP', 420000, NULL, NULL, b'0', 'TORANO', 'Áo polo can phối, thêu logo ngực ESTP018', 1, 4, 1, b'1'),
('ESTP020', 'Áo Polo can phối 3 màu ESTP020', 'PLCP', 450000, NULL, NULL, b'0', 'TORANO', NULL, 1, 4, 1, b'1'),
('ESTP021', 'Áo polo can phối, thêu logo ngực ESTP021', 'PLCP', 550000, 450000, 18, b'1', 'TORANO', '', 1, 4, 1, b'1'),
('ESTP022', 'Áo polo can phối vai ESTP022', 'PLCP', 450000, NULL, NULL, b'0', 'TORANO', 'Áo polo nam cao cấp đẹp, tôn dáng. Chất vải dệt mềm, dày dặn không bai xù nhăn nhàu', 1, 5, 2, b'1'),
('ESTP023', 'Áo Polo can phối họa tiết TRN ESTP023', 'PLCP', 420000, NULL, NULL, b'0', 'TORANO', 'Áo Polo can phối họa tiết nam phong cách trẻ trung và lịch lãm thích hợp với mọi dáng người.', 1, 4, 1, b'1'),
('ESTP028', 'Áo polo trơn bo kẻ cổ V, in logo ngực ESTP028', 'PLT', 420000, NULL, NULL, b'0', 'TORANO', NULL, 1, 5, 4, b'1'),
('ESTP032', 'Áo polo trơn bo kẻ ESTP032', 'PLT', 400000, NULL, NULL, b'0', 'TORANO', NULL, 1, 4, 3, b'1'),
('ESTP033', 'Áo polo trơn bo kẻ phối viền cổ ESTP033', 'PLT', 420000, NULL, NULL, b'0', 'TORANO', 'Áo polo trơn bo kẻ phối viền cổ cao cấp', 1, 4, 1, b'1'),
('ESTP038', 'Áo Polo trơn basic đen thêu logo ngực ESTP038', 'PLT', 330000, 200000, 39, b'1', 'TORANO', 'Áo Polo trơn TORANO cổ bẻ tay ngắn trơn, bo kẻ nhiều màu ESTP038 chính là item hoàn hảo dễ mặc dễ phối đồ cho cả nam và nữ. Khám phá ngay!!!\n</br>+ Chất vải có độ co giãn tốt, thoáng khí và không phai màu.\n</br>+60% Poly +35% cotton +5% Spandex+ Thấm hút mồ hôi tối đa và thoải mái khi vận động\n</br>+ Thiết kế Slimfit vừa vặn tôn dáng\n</br>+ Phù hợp với đi làm, đi học, đi chơi, hẹn hò, du lịch...\n</br>+ Áo có 4 size : S – M –L – XL\n</br>Hướng dẫn sử dụng và bảo quản:\n</br>+ Giặt ở nhiệt độ bình thường, với đồ có màu tương tự.\n</br>+ Không được dùng hóa chất tẩy.\n</br>+ Hạn chế sử dụng máy sấy và ủi ở nhiệt độ thích hợp.\n</br>+ Lộn mặt trái khi phơi tránh bị phai màu\n</br>Chính sách và điều kiện đổi trả của TORANO:\n</br>+ Cam kết chất lượng và mẫu mã sản phẩm giống với hình ảnh.\n</br>+ Cam kết được đổi trả hàng trong vòng 7 ngày.\n</br>+ Hàng phải còn nguyên tem mác và chưa qua sử dụng\n</br>+ Sản phẩm bị lỗi do vận chuyển và do nhà sản xuất', 1, 5, 1, b'1'),
('ESTP041', 'Áo Polo trơn hiệu ứng ESTP041', 'PLT', 450000, NULL, NULL, b'0', 'TORANO', 'Áo polo nam cao cấp chống nhăn nhàu đang hot tại Torano', 1, 4, 5, b'1'),
('ESTP042', 'Áo Polo trơn vải lục giác kèm logo ngực ESTP042', 'PLT', 380000, 349000, 8, b'1', 'TORANO', 'Mẫu áo polo chất liệu cải tiến thế hệ mới mang lại cho các anh sự thoải mái cũng như vẻ ngoài lịch sự và đầy nam tính.', 1, 5, 9, b'1'),
('ESTP047', 'Áo Polo len bo kẻ cổ 2.ESTP047', 'PLBK', 500000, NULL, NULL, b'0', 'TORANO', 'Áo polo len bo kẻ nam cao cấp chính hãng Torano. Chất vải len dệt chắc chắn, không xù và dão.', 1, 4, 2, b'1'),
('ESTP060', 'Áo Polo can phối 2 màu ESTP060', 'PLCP', 420000, NULL, NULL, b'0', 'TORANO', 'Áo polo nam cao cấp đẹp, tôn dáng. Chất vải dệt mềm, dày dặn không bai xù nhăn nhàu', 1, 4, 2, b'1'),
('ESTP067', 'Áo Polo trơn bo kẻ cổ ESTP067', 'PLT', 380000, NULL, NULL, b'0', 'TORANO', '', 1, 5, 3, b'1'),
('ESTP074', 'Áo Polo trơn bo kẻ ESTP074', 'PLT', 420000, NULL, NULL, b'0', 'TORANO', 'Áo Polo nam trơn bo kẻ cao cấp phong cách trẻ trung và lịch lãm thích hợp với mọi dáng người.', 1, 4, 2, b'1'),
('TP004', 'Áo polo phối màu color-block 1.TP004', 'PLBK', 450000, NULL, NULL, b'0', 'TORANO', 'Áo polo phối màu color-block TP004', 1, 4, 1, b'1');

--
-- Bẫy `products`
--
DELIMITER $$
CREATE TRIGGER `insertProduct` BEFORE INSERT ON `products` FOR EACH ROW BEGIN
  
    IF NEW.discount_price IS NOT NULL THEN
    SET NEW.`discount_percent` = ((NEW.`price` - 				NEW.`discount_price`) / NEW.`price`) * 100;
    SET NEW.`is_discount` = 1;
    ELSE
    SET NEW.`discount_percent`= NULL;
    SET NEW.`is_discount` = 0;
    END IF;
     
    IF NEW.total_color IS NULL THEN
    SET NEW.total_color = (
    SELECT COUNT(DISTINCT color_id)
    FROM products_detail
    WHERE product_id = NEW.product_id
    );
    END IF;
    
    IF NEW.total_size IS NULL THEN
    SET NEW.total_size = (
    SELECT COUNT(DISTINCT size_id)
    FROM products_detail
    WHERE product_id = NEW.product_id
    );
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateProducts` BEFORE UPDATE ON `products` FOR EACH ROW BEGIN
    IF NEW.discount_price IS NOT NULL THEN
    SET NEW.`discount_percent` = ((NEW.`price` - 				NEW.`discount_price`) / NEW.`price`) * 100;
    SET NEW.`is_discount` = 1;
    ELSE
    SET NEW.`discount_percent`= NULL;
    SET NEW.`is_discount` = 0;
    END IF;
     
    IF NEW.total_color IS NULL THEN
    SET NEW.total_color = (
    SELECT COUNT(DISTINCT color_id)
    FROM products_detail
    WHERE product_id = NEW.product_id
    );
    END IF;
    
    IF NEW.total_size IS NULL THEN
    SET NEW.total_size = (
    SELECT COUNT(DISTINCT size_id)
    FROM products_detail
    WHERE product_id = NEW.product_id
    );
    END IF;
END
$$
DELIMITER ;

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
(46, 'DSTP611', 'DSTP61172CX00SB_WH-S', 'WH', 'S', 999, b'1', b'1'),
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
(246, 'DSTP650', 'DSTP65072CT04SB_BL-L', 'BL', 'L', 999, b'1', b'1'),
(247, 'DSTP650', 'DSTP65072CT04SB_BL-XL', 'BL', 'XL', 999, b'1', b'1'),
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

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(1, 'ADMIN'),
(2, 'EMPLOYEE');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sizes`
--

CREATE TABLE `sizes` (
  `size_id` varchar(5) NOT NULL,
  `name` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sizes`
--

INSERT INTO `sizes` (`size_id`, `name`) VALUES
('L', 'size L'),
('M', 'size M'),
('S', 'size S'),
('XL', 'size XL'),
('XXL', 'size XXL');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `stores`
--

CREATE TABLE `stores` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `apiMap` varchar(255) DEFAULT NULL,
  `cityId` int(11) DEFAULT NULL,
  `storeActive` bit(1) NOT NULL DEFAULT b'1',
  `api_map` varchar(255) DEFAULT NULL,
  `city_id` varchar(255) DEFAULT NULL,
  `store_active` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `role` (`role`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`),
  ADD KEY `dsgsg` (`parent_id`);

--
-- Chỉ mục cho bảng `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`color_id`);

--
-- Chỉ mục cho bảng `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Chỉ mục cho bảng `imgs_product`
--
ALTER TABLE `imgs_product`
  ADD PRIMARY KEY (`img_id`),
  ADD KEY `bd` (`product_id`);

--
-- Chỉ mục cho bảng `imgs_size`
--
ALTER TABLE `imgs_size`
  ADD PRIMARY KEY (`img_size_id`);

--
-- Chỉ mục cho bảng `incvoice_status`
--
ALTER TABLE `incvoice_status`
  ADD PRIMARY KEY (`invoice_status`);

--
-- Chỉ mục cho bảng `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `invoice_status` (`invoice_status`);

--
-- Chỉ mục cho bảng `invoices_detail`
--
ALTER TABLE `invoices_detail`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `product_detail_id` (`product_detail_id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Chỉ mục cho bảng `invoices_status`
--
ALTER TABLE `invoices_status`
  ADD PRIMARY KEY (`status_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `dsgd` (`cat_id`),
  ADD KEY `vjj` (`img_size_id`);

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
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Chỉ mục cho bảng `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`size_id`);

--
-- Chỉ mục cho bảng `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_id` (`cityId`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `accounts`
--
ALTER TABLE `accounts`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT cho bảng `imgs_product`
--
ALTER TABLE `imgs_product`
  MODIFY `img_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=307;

--
-- AUTO_INCREMENT cho bảng `imgs_size`
--
ALTER TABLE `imgs_size`
  MODIFY `img_size_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `incvoice_status`
--
ALTER TABLE `incvoice_status`
  MODIFY `invoice_status` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `invoices_detail`
--
ALTER TABLE `invoices_detail`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `invoices_status`
--
ALTER TABLE `invoices_status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `products_detail`
--
ALTER TABLE `products_detail`
  MODIFY `product_detail_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`role`) REFERENCES `roles` (`role_id`);

--
-- Các ràng buộc cho bảng `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `dsgsg` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`cat_id`);

--
-- Các ràng buộc cho bảng `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`invoice_id`);

--
-- Các ràng buộc cho bảng `imgs_product`
--
ALTER TABLE `imgs_product`
  ADD CONSTRAINT `bd` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Các ràng buộc cho bảng `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`invoice_status`) REFERENCES `invoices_status` (`status_id`);

--
-- Các ràng buộc cho bảng `invoices_detail`
--
ALTER TABLE `invoices_detail`
  ADD CONSTRAINT `invoices_detail_ibfk_2` FOREIGN KEY (`product_detail_id`) REFERENCES `products_detail` (`product_detail_id`),
  ADD CONSTRAINT `invoices_detail_ibfk_3` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`invoice_id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `dsgd` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`cat_id`),
  ADD CONSTRAINT `vjj` FOREIGN KEY (`img_size_id`) REFERENCES `imgs_size` (`img_size_id`);

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
