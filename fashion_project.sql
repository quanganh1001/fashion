-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th2 28, 2024 lúc 01:27 PM
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
  `user_name` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(55) NOT NULL,
  `phone` varchar(55) NOT NULL,
  `address` varchar(255) NOT NULL,
  `role` varchar(15) NOT NULL,
  `enabled` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `accounts`
--

INSERT INTO `accounts` (`account_id`, `user_name`, `password`, `name`, `email`, `phone`, `address`, `role`, `enabled`) VALUES
(1, 'quanly', '$2a$10$WzsM01uig9/kwbSzenxYXuh9Vcs3VJrB4.CRgsinAsvq7PVRUIZ/e', 'quang anh', 'quanganhnguyen100196@gmail.com', '0364100196', 'h', 'ROLE_MANAGER', b'1'),
(2, 'nhanvien1', '$2a$10$cIsfc/R8PIsJWzbgolJRheAfJ7hK9hxwxxpqplMP4CSlTBJhcoMk.', 'nhanvien1', 'nhanvien1@gmail.com', '0365151822', 'hanoi', 'ROLE_EMPLOYEE', b'1'),
(4, 'nhanvien2', '$2a$10$5D2B5O4CmS5RN4VxaTwJXOi9B83aa0lGwWy.sICls9O3LKRgNXyDm', 'quanganh', 'nhanvien2@gmail.com', '0364421123', 'hanoi', 'ROLE_EMPLOYEE', b'1'),
(8, 'nhanvien3', '$2a$10$Eh581hpIm67HRwTrHJDpi.iNlHtcbYIBOy313HikKSFJQ4BUPycNu', 'nhanvien3', 'nhanvien3@gmail.com', '0312646431', 'hanoi', 'ROLE_EMPLOYEE', b'1'),
(14, 'khachhang', '$2a$10$txuPDKVLcA7VGk5x9L8NfuLd2GcUeNAxRzZGl/pWgQl.LpFdcA8QK', 'khách hàng', 'khachhang@gmail.com', '0364431132', 'hanoi', 'ROLE_CUSTOMER', b'1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banner_imgs`
--

CREATE TABLE `banner_imgs` (
  `id` int(11) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `banner_imgs`
--

INSERT INTO `banner_imgs` (`id`, `file_name`) VALUES
(24, '1707589631031_slide_1_img.jpg'),
(25, '1707589659083_slide_4_img.jpg'),
(26, '1707589659361_slide_3_img.jpg'),
(27, '1707589659861_slide_2_img.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `cat_id` varchar(10) NOT NULL,
  `cat_name` varchar(30) DEFAULT NULL,
  `parent_id` varchar(10) DEFAULT NULL,
  `cat_background` varchar(255) DEFAULT NULL,
  `is_cat_active` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_name`, `parent_id`, `cat_background`, `is_cat_active`) VALUES
('AK', 'Áo khoác', 'AO', '1707657052035_home_category_1_img.jpg', b'1'),
('ANL', 'Áo nỉ - len', 'AO', '1708857857237_tw003-bs001-6_53291471625_o_1f620c3d758e41d696fb128d159744a2_master.jpg', b'1'),
('AO', 'Áo nam', NULL, '1707659268353_309472437_1159489334948483_878248476891481358_n.mp4', b'1'),
('BN', 'Bộ nỉ', 'SET', '1707659802887_home_category_2_img.jpg', b'1'),
('PLBK', 'Polo Bo Kẻ', 'POLO', 'no_image.jpg', b'1'),
('PLCP', 'Polo can phối', 'POLO', 'no_image.jpg', b'1'),
('PLHT', 'Polo họa tiết', 'POLO', '1707659794400_home_category_7_img.jpg', b'1'),
('PLK', 'Polo kẻ', 'POLO', 'no_image.jpg', b'1'),
('PLT', 'Polo trơn', 'POLO', 'no_image.jpg', b'1'),
('POLO', 'Áo polo', 'AO', '1707658054393_home_category_7_img.jpg', b'1'),
('QA', 'Quần âu', 'QUAN', '1707658508920_home_category_4_img.jpg', b'1'),
('QAPTC', 'Quần âu phối thun cạp', 'QA', 'no_image.jpg', b'1'),
('QDK', 'Quần dài kaki', 'QUAN', '1707658730194_20220616_imo73m42sdzgttoxblnoitdk_731b47cd880d4329ae353df413fa9712_master.jpg', b'1'),
('QJ', 'Quần jeans', 'QUAN', '1707658789144_home_category_3_img.jpg', b'1'),
('QJB', 'Quần jeans basic', 'QJ', 'no_image.jpg', b'1'),
('QJR', 'Quần jeans rách', 'QJ', 'no_image.jpg', b'1'),
('QKB', 'Quần kaki basic', 'QDK', 'no_image.jpg', b'1'),
('QN', 'Quần nỉ', 'QUAN', '1707729872190_bs002_19fa4cd191704c63ace6c7cfd5f2bc67_master.jpg', b'1'),
('QS', 'Quần short', 'QUAN', '1707729768103_list.jpg', b'1'),
('QUAN', 'Quần nam', NULL, 'no_image.jpg', b'1'),
('SD', 'Short đũi', 'QS', 'no_image.jpg', b'1'),
('SET', 'Set', NULL, '1707658980103_home_category_2_img.jpg', b'1'),
('SG', 'Short gió', 'QS', 'no_image.jpg', b'1'),
('SKK', 'Short kaki', 'QS', 'no_image.jpg', b'1'),
('SM', 'Sơ mi', 'AO', '1707658088128_home_category_5_img.jpg', b'1'),
('SMD', 'Sơ mi đũi', 'SM', NULL, b'1'),
('SMDM', 'Sơ mi Demin', 'SM', NULL, b'1'),
('SMHT', 'Sơ mi họa tiết', 'SMD', NULL, b'1'),
('SMK', 'Sơ mi kẻ', 'SM', NULL, b'1'),
('SMT', 'Sơ mi trơn', 'SM', NULL, b'1'),
('THUN', 'Áo thun', 'AO', '1707658099690_home_category_8_img.jpg', b'1'),
('TIH', 'Thun in hình', 'THUN', NULL, b'1'),
('TT', 'Tank top', 'THUN', NULL, b'1');

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
('BE', 'Màu be'),
('BL', 'Màu đen'),
('BLE', 'Phối đen-be'),
('BR', 'Nâu'),
('BU', 'Xanh da trời'),
('CN', 'Xanh cổ vịt'),
('CR', 'Trắng kem'),
('DBU', 'Xanh da trời đậm'),
('DCB', 'Xanh đã đậm'),
('DCR', 'Trắng - kem đậm'),
('DGN', 'Xanh lá cây đậm'),
('DGR', 'Xám đậm'),
('DNV', 'Dark Navy'),
('DTU', 'Xanh ngọc đậm'),
('ENV', 'Phối Be - Navy'),
('GN', 'Xanh lá cây'),
('GR', 'Xám'),
('HBR', 'Phối nâu trắng'),
('HCR', 'Phối kem đậm - trắng'),
('LB', 'Xanh da trời nhạt'),
('LBE', 'Be nhạt'),
('LBL', 'Đen nhạt'),
('LCB', 'Xanh đá nhạt'),
('LCR', 'Trắng kem nhạt'),
('LG', 'Xám Nhạt'),
('LI', 'Tím phớt'),
('LLB', 'Xanh da trời phai'),
('LLG', 'Phối đen - xám nhạt'),
('LYL', 'Vàng nhạt'),
('NBX', 'Phối navy - Đỏ đô'),
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
-- Cấu trúc bảng cho bảng `customer_mail`
--

CREATE TABLE `customer_mail` (
  `id` int(11) NOT NULL,
  `email` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `customer_mail`
--

INSERT INTO `customer_mail` (`id`, `email`) VALUES
(3, 'anhnqth2211019@fpt.edu.vn'),
(8, 'quanganhnguyen100196@gmail.com'),
(9, 'anhnguyen43@ihoding.org');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feedback_customer`
--

CREATE TABLE `feedback_customer` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(55) NOT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `feedback` varchar(255) NOT NULL,
  `status` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `feedback_customer`
--

INSERT INTO `feedback_customer` (`id`, `name`, `email`, `phone`, `feedback`, `status`) VALUES
(18, 'nguyễn quang anh', 'vd@gmail.com', '0365151822', 'dsfds', b'0'),
(19, 'nguyễn quang anh', 'anhnqth2211019@fpt.edu.vn', '0365151822', 'tốt', b'0');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `invoice_id` varchar(25) NOT NULL,
  `content` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `time_ago` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `history`
--

INSERT INTO `history` (`id`, `invoice_id`, `content`, `time`, `time_ago`) VALUES
(140, 'PB8NR0T5', 'quanly đã tạo đơn hàng: <br>Mã đơn: PB8NR0T5,<br>Tên khách hàng: nguyễn quang anh,<br>Số điện thoại: 365151822,<br>Địa chỉ: số 18 ngõ 222 tựu liệt,thanh trì, hà nội,<br>Ghi chú:                         ', '2023-12-22 17:29:07', NULL),
(141, 'PB8NR0T5', 'quanly đã thay đổi Trạng thái đơn hàng: Đơn mới -> Đang xử lý', '2023-12-22 17:29:23', NULL),
(142, 'PB8NR0T5', 'quanly đã thêm sản phẩm: DSTP90372CT32RB_WCB-M (giá = 290000)', '2023-12-22 17:29:37', NULL),
(143, 'PB8NR0T5', 'quanly đã thay đổi Số lượng (DSTP90372CT32RB_WCB-M) :1 -> 2', '2023-12-22 17:30:02', NULL),
(144, '5N7P9LFG', 'quanly đã thay đổi Số điện thoại: 3 -> 3453', '2023-12-23 13:40:32', NULL),
(145, '5N7P9LFG', 'quanly đã thay đổi Ghi chú:                          ->           dsfsd              ', '2023-12-23 13:40:32', NULL),
(146, '5N7P9LFG', 'quanly đã thêm sản phẩm: DABJ00401CT00SB_NV-30 (giá = 550000)', '2023-12-23 13:47:32', NULL),
(147, '5N7P9LFG', 'quanly đã thay đổi Số lượng (DABJ00401CT00SB_NV-30) :1 -> 2', '2023-12-23 13:47:37', NULL),
(148, '5N7P9LFG', 'quanly đã thêm sản phẩm:  ESBK00202CT00RB_NV-30 (giá = 380000)', '2023-12-23 13:47:46', NULL),
(149, '5N7P9LFG', 'quanly đã xóa sản phẩm:  ESBK00202CT00RB_NV-30 (giá = 380000)', '2023-12-23 13:47:51', NULL),
(150, '5N7P9LFG', 'quanly đã xóa sản phẩm: DABJ00401CT00SB_NV-30 (giá = 550000)', '2023-12-23 13:47:54', NULL),
(151, 'LJ15RWML', 'quanly đã thay đổi Số lượng (DABJ00401CT00SB_NV-29) :1 -> 2', '2023-12-23 14:40:36', NULL),
(152, 'LJ15RWML', 'quanly đã thay đổi Số lượng (DABJ00401CT00SB_NV-29) :2 -> 1', '2023-12-23 14:40:39', NULL),
(153, 'LJ15RWML', 'quanly đã xóa sản phẩm: DABJ00401CT00SB_NV-29 (giá = 550000)', '2023-12-23 14:40:42', NULL),
(154, 'LJ15RWML', 'quanly đã thêm sản phẩm: DSTP65072CT04SB_BL-M (giá = 450000)', '2023-12-23 14:40:47', NULL),
(155, 'LJ15RWML', 'quanly đã xóa sản phẩm: DSTP65072CT04SB_BL-M (giá = 450000)', '2023-12-23 14:40:50', NULL),
(156, 'LJ15RWML', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:40:55', NULL),
(158, 'LJ15RWML', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:40:55', NULL),
(160, 'LJ15RWML', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:40:55', NULL),
(162, 'LJ15RWML', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:41:00', NULL),
(163, 'LJ15RWML', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:41:03', NULL),
(164, 'LJ15RWML', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:41:05', NULL),
(165, 'LJ15RWML', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:41:09', NULL),
(168, 'LJ15RWML', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:41:09', NULL),
(170, 'LJ15RWML', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:41:09', NULL),
(171, 'LJ15RWML', 'quanly đã thay đổi Số lượng (DSBI01302LI00SB_BE-29) :1 -> 2', '2023-12-23 14:41:09', NULL),
(172, 'LJ15RWML', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:41:16', NULL),
(173, 'LJ15RWML', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:41:18', NULL),
(174, 'LJ15RWML', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:41:20', NULL),
(175, 'LJ15RWML', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:41:29', NULL),
(176, 'LJ15RWML', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:41:29', NULL),
(178, 'LJ15RWML', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:41:29', NULL),
(179, 'LJ15RWML', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-38 (giá = 450000)', '2023-12-23 14:41:41', NULL),
(181, 'LJ15RWML', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-38 (giá = 450000)', '2023-12-23 14:41:41', NULL),
(182, 'LJ15RWML', 'quanly đã thêm sản phẩm: DSTP61172CX00SB_WH-S (giá = 333333)', '2023-12-23 14:41:58', NULL),
(183, 'LJ15RWML', 'quanly đã thêm sản phẩm: DSTP61172CX00SB_WH-S (giá = 333333)', '2023-12-23 14:41:58', NULL),
(184, '5N7P9LFG', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-38 (giá = 450000)', '2023-12-23 14:42:14', NULL),
(187, '5N7P9LFG', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-38 (giá = 450000)', '2023-12-23 14:42:14', NULL),
(188, '5N7P9LFG', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-38 (giá = 450000)', '2023-12-23 14:42:15', NULL),
(189, '5N7P9LFG', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-38 (giá = 450000)', '2023-12-23 14:42:17', NULL),
(190, '5N7P9LFG', 'quanly đã thêm sản phẩm: DSTP61172CX00SB_WH-L (giá = 333333)', '2023-12-23 14:42:23', NULL),
(191, '5N7P9LFG', 'quanly đã xóa sản phẩm: DSTP61172CX00SB_WH-L (giá = 333333)', '2023-12-23 14:42:25', NULL),
(192, '5N7P9LFG', 'quanly đã thêm sản phẩm: DSTP61172CX00SB_WH-S (giá = 333333)', '2023-12-23 14:42:30', NULL),
(193, '5N7P9LFG', 'quanly đã thêm sản phẩm: DSTP61172CX00SB_WH-S (giá = 333333)', '2023-12-23 14:42:30', NULL),
(194, '5N7P9LFG', 'quanly đã xóa sản phẩm: DSTP61172CX00SB_WH-S (giá = 333333)', '2023-12-23 14:42:34', NULL),
(195, '5N7P9LFG', 'quanly đã xóa sản phẩm: DSTP61172CX00SB_WH-S (giá = 333333)', '2023-12-23 14:42:36', NULL),
(196, '5N7P9LFG', 'quanly đã thêm sản phẩm: DSTP61172CX00SB_WH-XL (giá = 333333)', '2023-12-23 14:42:39', NULL),
(197, '5N7P9LFG', 'quanly đã thêm sản phẩm: DSTP61172CX00SB_WH-XL (giá = 333333)', '2023-12-23 14:42:39', NULL),
(198, '5N7P9LFG', 'quanly đã xóa sản phẩm: DSTP61172CX00SB_WH-XL (giá = 333333)', '2023-12-23 14:42:42', NULL),
(199, '5N7P9LFG', 'quanly đã xóa sản phẩm: DSTP61172CX00SB_WH-XL (giá = 333333)', '2023-12-23 14:42:44', NULL),
(200, '5N7P9LFG', 'quanly đã thêm sản phẩm: DSTP90372CT32RB_WCB-M (giá = 290000)', '2023-12-23 14:42:49', NULL),
(202, '5N7P9LFG', 'quanly đã thêm sản phẩm: DSTP90372CT32RB_WCB-S (giá = 290000)', '2023-12-23 14:42:55', NULL),
(203, '5N7P9LFG', 'quanly đã thêm sản phẩm: DSTP90372CT32RB_WCB-L (giá = 290000)', '2023-12-23 14:43:17', NULL),
(204, '5N7P9LFG', 'quanly đã thay đổi Số lượng (DSTP90372CT32RB_WCB-S) :1 -> 2', '2023-12-23 14:43:22', NULL),
(205, '5N7P9LFG', 'quanly đã xóa sản phẩm: DSTP90372CT32RB_WCB-M (giá = 290000)', '2023-12-23 14:43:25', NULL),
(206, '5N7P9LFG', 'quanly đã xóa sản phẩm: DSTP90372CT32RB_WCB-S (giá = 290000)', '2023-12-23 14:43:26', NULL),
(207, '5N7P9LFG', 'quanly đã xóa sản phẩm: DSTP90372CT32RB_WCB-L (giá = 290000)', '2023-12-23 14:43:28', NULL),
(208, '5N7P9LFG', 'quanly đã thêm sản phẩm: DSTP90372CT32RB_WCB-S (giá = 290000)', '2023-12-23 14:43:33', NULL),
(209, '5N7P9LFG', 'quanly đã xóa sản phẩm: DSTP90372CT32RB_WCB-S (giá = 290000)', '2023-12-23 14:43:35', NULL),
(210, '5N7P9LFG', 'quanly đã thêm sản phẩm: DSTP90372CT32RB_WCB-M (giá = 290000)', '2023-12-23 14:43:41', NULL),
(211, 'QHSU5DIX', 'quanly đã tạo đơn hàng: <br>Mã đơn: QHSU5DIX,<br>Tên khách hàng: nguyễn quang anh,<br>Số điện thoại: 365151822,<br>Địa chỉ: số 18 ngõ 222 tựu liệt,thanh trì, hà nội,<br>Ghi chú:                         dsv', '2023-12-23 14:43:49', NULL),
(212, 'QHSU5DIX', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-31 (giá = 380000)', '2023-12-23 14:43:56', NULL),
(214, 'QHSU5DIX', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-31 (giá = 380000)', '2023-12-23 14:43:56', NULL),
(216, 'QHSU5DIX', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-31 (giá = 380000)', '2023-12-23 14:43:56', NULL),
(217, 'QHSU5DIX', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-31 (giá = 380000)', '2023-12-23 14:43:56', NULL),
(218, 'QHSU5DIX', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:45:41', NULL),
(219, 'QHSU5DIX', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-31 (giá = 380000)', '2023-12-23 14:45:44', NULL),
(220, 'QHSU5DIX', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-31 (giá = 380000)', '2023-12-23 14:45:45', NULL),
(221, 'QHSU5DIX', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-31 (giá = 380000)', '2023-12-23 14:45:47', NULL),
(222, 'QHSU5DIX', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-31 (giá = 380000)', '2023-12-23 14:45:48', NULL),
(223, 'QHSU5DIX', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:45:51', NULL),
(224, 'QHSU5DIX', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-31 (giá = 380000)', '2023-12-23 14:45:58', NULL),
(225, 'QHSU5DIX', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-31 (giá = 380000)', '2023-12-23 14:46:03', NULL),
(226, 'QHSU5DIX', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:46:09', NULL),
(227, 'QHSU5DIX', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:46:09', NULL),
(229, 'QHSU5DIX', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:46:27', NULL),
(230, 'QHSU5DIX', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:46:29', NULL),
(231, 'QHSU5DIX', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:46:34', NULL),
(234, 'QHSU5DIX', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:46:34', NULL),
(235, 'QHSU5DIX', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:46:34', NULL),
(236, 'QHSU5DIX', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:46:37', NULL),
(237, 'QHSU5DIX', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:46:38', NULL),
(238, 'QHSU5DIX', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:46:39', NULL),
(239, 'QHSU5DIX', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:46:43', NULL),
(241, 'QHSU5DIX', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:46:43', NULL),
(242, 'QHSU5DIX', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:46:43', NULL),
(243, 'QHSU5DIX', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:46:43', NULL),
(244, 'QHSU5DIX', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:46:43', NULL),
(245, 'QHSU5DIX', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:48:28', NULL),
(246, 'QHSU5DIX', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:48:29', NULL),
(247, 'QHSU5DIX', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:48:31', NULL),
(248, 'QHSU5DIX', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:48:32', NULL),
(249, 'QHSU5DIX', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:48:34', NULL),
(250, 'QHSU5DIX', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:48:37', NULL),
(255, 'QHSU5DIX', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:48:37', NULL),
(256, 'QHSU5DIX', 'quanly đã thay đổi Số lượng (DSBI01302LI00SB_BE-29) :1 -> 2', '2023-12-23 14:48:37', NULL),
(257, 'QHSU5DIX', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:48:40', NULL),
(258, 'QHSU5DIX', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:48:47', NULL),
(259, 'QHSU5DIX', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:49:07', NULL),
(262, 'QHSU5DIX', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:49:07', NULL),
(263, 'QHSU5DIX', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:49:40', NULL),
(264, 'QHSU5DIX', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:49:42', NULL),
(265, 'QHSU5DIX', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:49:47', NULL),
(268, 'QHSU5DIX', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:49:47', NULL),
(269, 'QHSU5DIX', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:49:47', NULL),
(271, 'QHSU5DIX', 'quanly đã thay đổi Số lượng (DSBI01302LI00SB_BE-29) :1 -> 2', '2023-12-23 14:49:47', NULL),
(272, 'QHSU5DIX', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:52:16', NULL),
(273, 'QHSU5DIX', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:52:18', NULL),
(274, 'QHSU5DIX', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:52:19', NULL),
(275, 'QHSU5DIX', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:52:23', NULL),
(277, 'QHSU5DIX', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:52:23', NULL),
(278, 'QHSU5DIX', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:52:39', NULL),
(279, 'QHSU5DIX', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:52:40', NULL),
(280, 'QHSU5DIX', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:52:53', NULL),
(281, 'QHSU5DIX', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:52:53', NULL),
(284, 'QHSU5DIX', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:52:53', NULL),
(285, 'QHSU5DIX', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:54:11', NULL),
(286, 'QHSU5DIX', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:54:12', NULL),
(287, 'QHSU5DIX', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:54:14', NULL),
(288, 'QHSU5DIX', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:54:18', NULL),
(289, 'QHSU5DIX', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:54:48', NULL),
(290, 'QHSU5DIX', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:54:56', NULL),
(292, 'QHSU5DIX', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:54:56', NULL),
(293, 'QHSU5DIX', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:54:56', NULL),
(295, 'QHSU5DIX', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:55:53', NULL),
(296, 'QHSU5DIX', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:55:55', NULL),
(297, 'QHSU5DIX', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:55:56', NULL),
(299, 'QHSU5DIX', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:56:01', NULL),
(300, 'QHSU5DIX', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:56:01', NULL),
(301, '5N7P9LFG', 'quanly đã xóa sản phẩm: DSTP90372CT32RB_WCB-M (giá = 290000)', '2023-12-23 14:57:22', NULL),
(302, '5N7P9LFG', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:59:17', NULL),
(303, '5N7P9LFG', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-30 (giá = 380000)', '2023-12-23 14:59:21', NULL),
(304, '5N7P9LFG', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:59:23', NULL),
(305, '5N7P9LFG', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-30 (giá = 380000)', '2023-12-23 14:59:25', NULL),
(306, 'LJ15RWML', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:59:38', NULL),
(307, 'LJ15RWML', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:59:40', NULL),
(308, 'LJ15RWML', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:59:41', NULL),
(309, 'LJ15RWML', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-38 (giá = 450000)', '2023-12-23 14:59:43', NULL),
(310, 'LJ15RWML', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-38 (giá = 450000)', '2023-12-23 14:59:44', NULL),
(311, 'LJ15RWML', 'quanly đã xóa sản phẩm: DSTP61172CX00SB_WH-S (giá = 333333)', '2023-12-23 14:59:45', NULL),
(312, 'LJ15RWML', 'quanly đã xóa sản phẩm: DSTP61172CX00SB_WH-S (giá = 333333)', '2023-12-23 14:59:48', NULL),
(313, 'LJ15RWML', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 14:59:55', NULL),
(314, 'LJ15RWML', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2023-12-23 15:00:01', NULL),
(315, 'LJ15RWML', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2023-12-23 15:00:01', NULL),
(316, 'LJ15RWML', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_WH-29 (giá = 380000)', '2023-12-23 15:00:08', NULL),
(317, 'LJ15RWML', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2023-12-23 15:00:11', NULL),
(318, 'LJ15RWML', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2023-12-23 15:00:13', NULL),
(319, 'LJ15RWML', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 15:00:15', NULL),
(320, 'LJ15RWML', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_WH-29 (giá = 380000)', '2023-12-23 15:00:16', NULL),
(321, 'LJ15RWML', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 15:00:23', NULL),
(322, 'LJ15RWML', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-23 15:00:27', NULL),
(323, 'LJ15RWML', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-31 (giá = 380000)', '2023-12-23 15:01:40', NULL),
(324, 'LJ15RWML', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-31 (giá = 380000)', '2023-12-23 15:01:42', NULL),
(325, 'LJ15RWML', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2023-12-23 15:01:48', NULL),
(326, 'LJ15RWML', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2023-12-23 15:01:50', NULL),
(327, 'LJ15RWML', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2023-12-23 15:01:55', NULL),
(329, 'LJ15RWML', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2023-12-23 15:01:57', NULL),
(330, 'LJ15RWML', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-32 (giá = 380000)', '2023-12-23 15:02:10', NULL),
(331, 'LJ15RWML', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-32 (giá = 380000)', '2023-12-23 15:02:13', NULL),
(333, 'LJ15RWML', 'quanly đã thêm sản phẩm: ESTP00572CT00SB_DNV-S (giá = 420000)', '2023-12-23 15:02:18', NULL),
(334, 'LJ15RWML', 'quanly đã xóa sản phẩm: ESTP00572CT00SB_DNV-S (giá = 420000)', '2023-12-23 15:02:20', NULL),
(335, 'LJ15RWML', 'quanly đã thêm sản phẩm: ESBW00502PE00RB_NV-XL (giá = 320000)', '2023-12-23 15:03:08', NULL),
(336, 'LJ15RWML', 'quanly đã thêm sản phẩm: ESBW00502PE00RB_NV-XL (giá = 320000)', '2023-12-23 15:03:08', NULL),
(337, 'LJ15RWML', 'quanly đã thêm sản phẩm: ESBW00502PE00RB_NV-XL (giá = 320000)', '2023-12-23 15:03:08', NULL),
(338, 'LJ15RWML', 'quanly đã xóa sản phẩm: ESBW00502PE00RB_NV-XL (giá = 320000)', '2023-12-23 15:03:18', NULL),
(339, 'LJ15RWML', 'quanly đã xóa sản phẩm: ESBW00502PE00RB_NV-XL (giá = 320000)', '2023-12-23 15:03:19', NULL),
(340, 'LJ15RWML', 'quanly đã xóa sản phẩm: ESBW00502PE00RB_NV-XL (giá = 320000)', '2023-12-23 15:03:22', NULL),
(341, 'LJ15RWML', 'quanly đã thêm sản phẩm: DSTP65072CT04SB_BL-XL (giá = 450000)', '2023-12-23 15:03:27', NULL),
(342, 'LJ15RWML', 'quanly đã thêm sản phẩm: DSTP65072CT04SB_BL-XL (giá = 450000)', '2023-12-23 15:03:27', NULL),
(343, 'LJ15RWML', 'quanly đã xóa sản phẩm: DSTP65072CT04SB_BL-XL (giá = 450000)', '2023-12-23 15:03:53', NULL),
(344, 'LJ15RWML', 'quanly đã xóa sản phẩm: DSTP65072CT04SB_BL-XL (giá = 450000)', '2023-12-23 15:03:55', NULL),
(345, 'LJ15RWML', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-38 (giá = 450000)', '2023-12-23 15:04:00', NULL),
(347, 'LJ15RWML', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-38 (giá = 450000)', '2023-12-23 15:04:03', NULL),
(348, 'LJ15RWML', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2023-12-23 15:04:07', NULL),
(349, 'LJ15RWML', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2023-12-23 15:04:07', NULL),
(350, 'LJ15RWML', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2023-12-23 15:04:34', NULL),
(351, 'LJ15RWML', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2023-12-23 15:04:35', NULL),
(352, 'LJ15RWML', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2023-12-23 15:04:50', NULL),
(353, 'LJ15RWML', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2023-12-23 15:04:53', NULL),
(354, 'LJ15RWML', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2023-12-23 15:04:59', NULL),
(355, 'LJ15RWML', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2023-12-23 15:05:01', NULL),
(356, 'LJ15RWML', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2023-12-23 15:05:22', NULL),
(357, 'LJ15RWML', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2023-12-23 15:05:26', NULL),
(358, 'LJ15RWML', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-40 (giá = 480000)', '2023-12-23 15:05:41', NULL),
(359, 'LJ15RWML', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-40 (giá = 480000)', '2023-12-23 15:05:41', NULL),
(360, 'LJ15RWML', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-40 (giá = 480000)', '2023-12-23 15:09:27', NULL),
(361, 'LJ15RWML', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-40 (giá = 480000)', '2023-12-23 15:09:29', NULL),
(362, 'LJ15RWML', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-40 (giá = 480000)', '2023-12-23 15:09:37', NULL),
(363, 'LJ15RWML', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2023-12-23 15:09:38', NULL),
(364, 'LJ15RWML', 'quanly đã thay đổi Số lượng (DATB41671CA11RB_NBX-39) :1 -> 2', '2023-12-23 15:09:39', NULL),
(365, 'LJ15RWML', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2023-12-23 15:09:40', NULL),
(366, 'LJ15RWML', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-41 (giá = 480000)', '2023-12-23 15:09:41', NULL),
(367, 'LJ15RWML', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-39 (giá = 450000)', '2023-12-23 15:09:42', NULL),
(368, 'LJ15RWML', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-40 (giá = 450000)', '2023-12-23 15:09:45', NULL),
(369, 'LJ15RWML', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-41 (giá = 450000)', '2023-12-23 15:09:57', NULL),
(370, 'LJ15RWML', 'quanly đã thay đổi Số lượng (DATB61471BA00SB_LLB-41) :1 -> 2', '2023-12-23 15:09:59', NULL),
(371, 'LJ15RWML', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-42 (giá = 450000)', '2023-12-23 15:10:00', NULL),
(372, 'LJ15RWML', 'quanly đã thay đổi Số lượng (DATB41671CA11RB_NBX-39) :2 -> 3', '2023-12-23 15:10:02', NULL),
(373, 'LJ15RWML', 'quanly đã thay đổi Số lượng (DATB41671CA11RB_NBX-39) :3 -> 4', '2023-12-23 15:10:03', NULL),
(374, 'LJ15RWML', 'quanly đã thay đổi Số lượng (DATB41671CA11RB_NBX-38) :1 -> 2', '2023-12-23 15:10:04', NULL),
(375, 'LJ15RWML', 'quanly đã thay đổi Số lượng (DATB41671CA11RB_NBX-40) :1 -> 2', '2023-12-23 15:10:06', NULL),
(376, 'LJ15RWML', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-40 (giá = 480000)', '2023-12-23 15:10:11', NULL),
(377, 'LJ15RWML', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2023-12-23 15:10:12', NULL),
(378, 'LJ15RWML', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2023-12-23 15:10:13', NULL),
(379, 'LJ15RWML', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-41 (giá = 480000)', '2023-12-23 15:10:14', NULL),
(380, 'LJ15RWML', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-39 (giá = 450000)', '2023-12-23 15:10:15', NULL),
(381, 'LJ15RWML', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-40 (giá = 450000)', '2023-12-23 15:10:17', NULL),
(382, 'LJ15RWML', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-41 (giá = 450000)', '2023-12-23 15:10:18', NULL),
(383, 'LJ15RWML', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-42 (giá = 450000)', '2023-12-23 15:10:19', NULL),
(384, 'LJ15RWML', 'quanly đã thêm sản phẩm: DATB92071BA00SB_WH-40 (giá = 42000)', '2023-12-23 15:10:29', NULL),
(385, 'LJ15RWML', 'quanly đã xóa sản phẩm: DATB92071BA00SB_WH-40 (giá = 42000)', '2023-12-23 15:10:32', NULL),
(386, 'LJ15RWML', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2023-12-23 15:10:37', NULL),
(388, 'LJ15RWML', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2023-12-23 15:10:37', NULL),
(389, 'LJ15RWML', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2023-12-23 15:10:43', NULL),
(390, 'LJ15RWML', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2023-12-23 15:10:44', NULL),
(391, 'LJ15RWML', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2023-12-23 15:10:48', NULL),
(393, 'LJ15RWML', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2023-12-23 15:10:48', NULL),
(394, 'LJ15RWML', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2023-12-23 15:10:54', NULL),
(395, 'LJ15RWML', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2023-12-23 15:10:56', NULL),
(397, 'LJ15RWML', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2023-12-23 15:11:06', NULL),
(399, 'LJ15RWML', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2023-12-23 15:11:29', NULL),
(400, 'LJ15RWML', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2023-12-23 15:11:37', NULL),
(401, 'LJ15RWML', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-40 (giá = 480000)', '2023-12-23 15:11:40', NULL),
(402, 'LJ15RWML', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2023-12-23 15:11:42', NULL),
(403, 'LJ15RWML', 'quanly đã thay đổi Số lượng (DATB41671CA11RB_NBX-39) :1 -> 2', '2023-12-23 15:11:42', NULL),
(404, 'LJ15RWML', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2023-12-23 15:11:44', NULL),
(405, 'LJ15RWML', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-40 (giá = 480000)', '2023-12-23 15:11:46', NULL),
(406, 'LJ15RWML', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2023-12-23 15:11:49', NULL),
(407, 'LJ15RWML', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2023-12-23 15:11:57', NULL),
(408, 'LJ15RWML', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-40 (giá = 480000)', '2023-12-23 15:11:58', NULL),
(409, 'LJ15RWML', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2023-12-23 15:12:01', NULL),
(410, 'LJ15RWML', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-40 (giá = 480000)', '2023-12-23 15:12:03', NULL),
(411, 'LJ15RWML', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2023-12-23 15:12:09', NULL),
(412, 'LJ15RWML', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2023-12-23 15:12:09', NULL),
(413, '5N7P9LFG', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2023-12-23 15:47:20', NULL),
(414, '5N7P9LFG', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2023-12-23 15:47:24', NULL),
(415, '5N7P9LFG', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2023-12-23 15:47:28', NULL),
(416, '5N7P9LFG', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-40 (giá = 480000)', '2023-12-23 15:47:33', NULL),
(417, '5N7P9LFG', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-40 (giá = 480000)', '2023-12-23 15:47:35', NULL),
(418, '5N7P9LFG', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-30 (giá = 380000)', '2023-12-23 15:49:04', NULL),
(419, '5N7P9LFG', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-30 (giá = 380000)', '2023-12-23 15:49:06', NULL),
(420, '5N7P9LFG', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-30 (giá = 380000)', '2023-12-23 15:50:46', NULL),
(421, '5N7P9LFG', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-30 (giá = 380000)', '2023-12-23 15:50:49', NULL),
(422, '5N7P9LFG', 'quanly đã thay đổi Số lượng (DATB41671CA11RB_NBX-39) :1 -> 2', '2023-12-23 15:50:54', NULL),
(423, '5N7P9LFG', 'quanly đã thêm sản phẩm: DABJ00401CT00SB_NV-29 (giá = 550000)', '2023-12-23 15:50:59', NULL),
(424, '5N7P9LFG', 'quanly đã thay đổi Số lượng (DATB41671CA11RB_NBX-39) :2 -> 1', '2023-12-23 15:51:03', NULL),
(425, '5N7P9LFG', 'quanly đã xóa sản phẩm: DABJ00401CT00SB_NV-29 (giá = 550000)', '2023-12-23 15:51:11', NULL),
(426, 'YHJFSFAS', 'quanly đã xóa sản phẩm: ESTP00572CT00SB_DNV-L (giá = 490000)', '2023-12-24 08:02:49', NULL),
(427, '5N7P9LFG', 'quanly đã thay đổi Số lượng (DATB41671CA11RB_NBX-39) :1 -> 2', '2023-12-24 08:02:59', NULL),
(428, 'YHVJLZWX', 'quanly đã thêm sản phẩm: DABJ00401CT00SB_NV-29 (giá = 550000)', '2023-12-24 08:03:06', NULL),
(429, 'YHVJLZWX', 'quanly đã thay đổi Số lượng (DABJ00401CT00SB_NV-29) :1 -> 2', '2023-12-24 08:16:47', NULL),
(430, 'YHVJLZWX', 'quanly đã xóa sản phẩm: DABJ00401CT00SB_NV-29 (giá = 550000)', '2023-12-24 08:17:49', NULL),
(431, 'YHVJLZWX', 'quanly đã thêm sản phẩm: DABJ00401CT00SB_NV-29 (giá = 550000)', '2023-12-24 08:17:54', NULL),
(432, 'YHVJLZWX', 'quanly đã xóa sản phẩm: DABJ00401CT00SB_NV-29 (giá = 550000)', '2023-12-24 08:17:57', NULL),
(433, 'LJ15RWML', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2023-12-24 08:20:45', NULL),
(434, 'LJ15RWML', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2023-12-24 08:21:04', NULL),
(435, 'QHSU5DIX', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-24 08:21:49', NULL),
(436, 'QHSU5DIX', 'quanly đã thay đổi Số lượng (DSBI01302LI00SB_BE-29) :1 -> 2', '2023-12-24 08:21:55', NULL),
(437, 'LJ15RWML', 'quanly đã thay đổi Số lượng (DATB41671CA11RB_NBX-38) :1 -> 2', '2023-12-24 08:24:22', NULL),
(438, 'LJ15RWML', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2023-12-24 08:25:01', NULL),
(439, '5N7P9LFG', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2023-12-24 08:29:46', NULL),
(440, '5N7P9LFG', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2023-12-24 08:29:49', NULL),
(441, '5N7P9LFG', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-38) :2 -> 3', '2023-12-24 08:43:36', NULL),
(442, '5N7P9LFG', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-38) :3 -> 4', '2023-12-24 08:43:43', NULL),
(443, '5N7P9LFG', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-38) :4 -> 5', '2023-12-24 08:45:11', NULL),
(444, '5N7P9LFG', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2023-12-24 08:45:24', NULL),
(445, '5N7P9LFG', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-39) :1 -> 2', '2023-12-24 08:45:30', NULL),
(446, 'ASJNSHOV', 'quanly đã tạo đơn hàng: <br>Mã đơn: ASJNSHOV,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: fsd', '2023-12-24 12:07:10', NULL),
(447, 'ASJNSHOV', 'quanly đã thay đổi Số điện thoại: 0365151822 -> 0365151822333', '2023-12-24 12:07:17', NULL),
(448, 'ASJNSHOV', 'quanly đã thay đổi Ghi chú: fsd -> dsdgd', '2023-12-24 12:07:17', NULL),
(449, 'ASJNSHOV', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2023-12-24 12:08:39', NULL),
(450, 'ASJNSHOV', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-39) :1 -> 2', '2023-12-24 12:08:44', NULL),
(451, 'ASJNSHOV', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-39) :2 -> 1', '2023-12-24 12:08:47', NULL),
(452, 'ASJNSHOV', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2023-12-24 12:08:54', NULL),
(453, 'ASJNSHOV', 'quanly đã thay đổi Trạng thái đơn hàng: Đơn mới -> Hủy', '2023-12-24 12:08:59', NULL),
(454, '5N7P9LFG', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2023-12-25 12:33:54', NULL),
(455, 'ASJNSHOV', 'quanly đã thay đổi Trạng thái đơn hàng: Hủy -> Đơn mới', '2023-12-29 16:47:54', NULL),
(456, 'H7SMY3IX', 'quanly đã tạo đơn hàng: <br>Mã đơn: H7SMY3IX,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 45645645,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú:                         gh', '2023-12-30 13:56:36', NULL),
(457, 'YS28NEXU', 'quanly đã tạo đơn hàng: <br>Mã đơn: YS28NEXU,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: dfgdf,<br>Ghi chú:                         ds', '2023-12-30 14:26:44', NULL),
(458, '58TMCIA2', 'quanly đã tạo đơn hàng: <br>Mã đơn: 58TMCIA2,<br>Tên khách hàng: quanly,<br>Số điện thoại: 453245,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú:             fd            ', '2023-12-30 14:54:26', NULL),
(459, 'QD57D21V', 'nhanvien1 đã tạo đơn hàng: <br>Mã đơn: QD57D21V,<br>Tên khách hàng: nhanvien1,<br>Số điện thoại: 0365151822,<br>Địa chỉ: sdfsd,<br>Ghi chú:                         vsd', '2023-12-30 14:57:48', NULL),
(460, '58TMCIA2', 'quanly đã thay đổi Trạng thái đơn hàng: Đơn mới -> Đã lên đơn', '2023-12-31 08:55:36', NULL),
(461, '58TMCIA2', 'quanly đã thay đổi Trạng thái đơn hàng: Đã lên đơn -> Đơn mới', '2023-12-31 08:55:41', NULL),
(462, '58TMCIA2', 'quanly đã thay đổi Trạng thái đơn hàng: Đơn mới -> Đã lên đơn', '2023-12-31 08:55:49', NULL),
(463, '58TMCIA2', 'quanly đã thay đổi Trạng thái đơn hàng: Đã lên đơn -> Hủy', '2023-12-31 08:56:15', NULL),
(464, 'LJ15RWML', 'quanly đã thay đổi Trạng thái đơn hàng: Đơn mới -> Đã lên đơn', '2023-12-31 09:00:09', NULL),
(465, 'QD57D21V', 'quanly đã thay đổi Trạng thái đơn hàng: Đơn mới -> Đã lên đơn', '2023-12-31 09:00:45', NULL),
(466, 'QD57D21V', 'quanly đã thay đổi Trạng thái đơn hàng: Đã lên đơn -> Thành công', '2023-12-31 09:00:49', NULL),
(467, 'RNQT0948', 'quanly đã thay đổi Trạng thái đơn hàng: Đơn mới -> Đã lên đơn', '2023-12-31 09:01:00', NULL),
(468, 'RNQT0948', 'quanly đã thay đổi Trạng thái đơn hàng: Đã lên đơn -> Thành công', '2023-12-31 09:01:04', NULL),
(469, 'YHJFSFAS', 'quanly đã thay đổi Trạng thái đơn hàng: Đơn mới -> Đã lên đơn', '2023-12-31 09:03:32', NULL),
(470, 'YHJFSFAS', 'quanly đã thay đổi Trạng thái đơn hàng: Đã lên đơn -> Hoàn', '2023-12-31 09:03:35', NULL),
(471, 'QHSU5DIX', 'quanly đã thay đổi Trạng thái đơn hàng: Đơn mới -> Đã lên đơn', '2023-12-31 09:09:24', NULL),
(472, 'QHSU5DIX', 'quanly đã thay đổi Trạng thái đơn hàng: Đã lên đơn -> Đang giao hàng', '2023-12-31 09:09:27', NULL),
(473, 'H7SMY3IX', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2023-12-31 09:09:51', NULL),
(474, 'H7SMY3IX', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-39) :1 -> 2', '2023-12-31 09:09:57', NULL),
(475, 'LJ15RWML', 'quanly đã thay đổi Nguồn tạo đơn hàng: 1 -> 2', '2023-12-31 13:04:34', NULL),
(476, 'LJ15RWML', 'quanly đã thay đổi Nguồn tạo đơn hàng: nhanvien1 -> nhanvien1', '2023-12-31 13:11:46', NULL),
(477, 'LJ15RWML', 'quanly đã thay đổi Nguồn tạo đơn hàng: quanly -> nhanvien1', '2023-12-31 13:12:06', NULL),
(478, 'H7SMY3IX', 'quanly đã thay đổi Trạng thái đơn hàng: Đơn mới -> Đã lên đơn', '2023-12-31 15:05:14', NULL),
(479, 'H7SMY3IX', 'quanly đã thay đổi Trạng thái đơn hàng: Đã lên đơn -> Đơn mới', '2023-12-31 15:07:06', NULL),
(480, 'H7SMY3IX', 'quanly đã thay đổi Tên khách hàng: quang anh -> ', '2023-12-31 15:11:07', NULL),
(481, 'H7SMY3IX', 'quanly đã thay đổi Tên khách hàng:  -> quang anh', '2023-12-31 15:21:43', NULL),
(482, 'H7SMY3IX', 'quanly đã thay đổi Số điện thoại: 45645645 -> 4234', '2023-12-31 15:21:50', NULL),
(483, 'H7SMY3IX', 'quanly đã thay đổi Nguồn tạo đơn hàng: quanly -> nhanvien1', '2023-12-31 15:24:24', NULL),
(484, 'H7SMY3IX', 'quanly đã thay đổi Trạng thái đơn hàng: Đơn mới -> Đã lên đơn', '2023-12-31 15:27:52', NULL),
(485, '5N7P9LFG', 'quanly đã thay đổi Nguồn tạo đơn hàng: nhanvien1 -> quanly', '2023-12-31 17:22:45', NULL),
(486, '5N7P9LFG', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2024-01-08 14:38:05', NULL),
(487, 'RMMVUD46', 'quanly đã tạo đơn hàng: <br>Mã đơn: RMMVUD46,<br>Tên khách hàng: gsdvc,<br>Số điện thoại: 4532,<br>Địa chỉ: bvc,<br>Ghi chú:                     fdg    ', '2024-01-14 12:37:18', NULL),
(488, 'HQ6FBRM7', 'quanly đã tạo đơn hàng: <br>Mã đơn: HQ6FBRM7,<br>Tên khách hàng: fsd,<br>Số điện thoại: 342344,<br>Địa chỉ: đ,<br>Ghi chú:                         fs', '2024-01-14 12:38:51', NULL),
(489, 'GZ7NLAVD', 'nhanvien2 đã tạo đơn hàng: <br>Mã đơn: GZ7NLAVD,<br>Tên khách hàng: gfdgfd,<br>Số điện thoại: 45345343,<br>Địa chỉ: vd,<br>Ghi chú:                         bvd', '2024-01-14 12:41:57', NULL),
(490, 'CUGSFZ6W', 'quanly đã tạo đơn hàng: <br>Mã đơn: CUGSFZ6W,<br>Tên khách hàng: xcvcx,<br>Số điện thoại: 324232,<br>Địa chỉ: cs,<br>Ghi chú:                   vsd      ', '2024-01-14 12:42:15', NULL),
(491, '60ALPBZ7', 'quanly đã tạo đơn hàng: <br>Mã đơn: 60ALPBZ7,<br>Tên khách hàng: eee,<br>Số điện thoại: 3242,<br>Địa chỉ: gfdg,<br>Ghi chú:               4523          ', '2024-01-14 13:07:04', NULL),
(492, '60ALPBZ7', 'quanly đã thay đổi Nguồn tạo đơn hàng: nhanvien1 -> nhanvien2', '2024-01-14 13:07:27', NULL),
(493, 'SM1LHYCD', 'quanly đã tạo đơn hàng: <br>Mã đơn: SM1LHYCD,<br>Tên khách hàng: vsd,<br>Số điện thoại: 534,<br>Địa chỉ: fgdf,<br>Ghi chú:                         43,<br>Nguồn:  quanly', '2024-01-14 13:16:30', NULL),
(494, '5N7P9LFG', 'quanly đã thay đổi Tên khách hàng: nguyễn quang anh -> fg anh', '2024-01-14 13:35:54', NULL),
(495, '5N7P9LFG', 'quanly đã thay đổi Số điện thoại: 3453 -> 9999', '2024-01-14 13:35:54', NULL),
(496, '5N7P9LFG', 'quanly đã thay đổi Nguồn tạo đơn hàng: quanly -> nhanvien1', '2024-01-14 13:35:54', NULL),
(497, 'VEGIVWS6', 'quanly đã tạo đơn hàng: <br>Mã đơn: VEGIVWS6,<br>Tên khách hàng: vsd,<br>Số điện thoại: 988888,<br>Địa chỉ: gf,<br>Ghi chú:          vbcx               ,<br>Nguồn:  nhanvien3', '2024-01-14 13:36:53', NULL),
(498, '60ALPBZ7', 'quanly đã thay đổi Nguồn tạo đơn hàng: nhanvien2 -> quanly', '2024-01-14 13:40:27', NULL),
(499, '60ALPBZ7', 'quanly đã thay đổi Nguồn tạo đơn hàng: quanly -> nhanvien1', '2024-01-14 13:40:31', NULL),
(500, '60ALPBZ7', 'quanly đã thay đổi Nguồn tạo đơn hàng: nhanvien1 -> nhanvien2', '2024-01-14 13:40:33', NULL),
(501, '58TMCIA2', 'quanly đã thay đổi Nguồn tạo đơn hàng: nhanvien2 -> quanly', '2024-01-14 13:55:25', NULL),
(502, '0FMHHMNY', 'quanly đã tạo đơn hàng: <br>Mã đơn: 0FMHHMNY,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 3432432,<br>Địa chỉ: gdfg,<br>Ghi chú:                         dfgfd,<br>Nguồn:  quanly', '2024-01-17 14:00:26', NULL),
(503, 'DVO5DOGS', 'HeThong đã tạo đơn hàng: <br>Mã đơn: DVO5DOGS,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 312312,<br>Địa chỉ: cád,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-17 14:50:21', NULL),
(504, 'ZY421FII', 'HeThong đã tạo đơn hàng: <br>Mã đơn: ZY421FII,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 312312,<br>Địa chỉ: cád,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-17 14:50:21', NULL),
(505, 'JRZKCJ43', 'HeThong đã tạo đơn hàng: <br>Mã đơn: JRZKCJ43,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 543543,<br>Địa chỉ: gdf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-17 15:27:42', NULL),
(506, 'HDHAMPHU', 'HeThong đã tạo đơn hàng: <br>Mã đơn: HDHAMPHU,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 543543,<br>Địa chỉ: gdf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-17 15:27:42', NULL),
(507, 'QXQDF5LW', 'HeThong đã tạo đơn hàng: <br>Mã đơn: QXQDF5LW,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 3432,<br>Địa chỉ: fds,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-17 15:30:30', NULL),
(508, 'TBLAZ6MC', 'HeThong đã tạo đơn hàng: <br>Mã đơn: TBLAZ6MC,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 3432,<br>Địa chỉ: fds,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-17 15:30:30', NULL),
(509, 'DIBOV5DS', 'HeThong đã tạo đơn hàng: <br>Mã đơn: DIBOV5DS,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 432,<br>Địa chỉ: 43,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-17 15:32:17', NULL),
(510, 'XQZVRRIM', 'HeThong đã tạo đơn hàng: <br>Mã đơn: XQZVRRIM,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 432,<br>Địa chỉ: 43,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-17 15:32:17', NULL),
(511, 'V4OZODG3', 'HeThong đã tạo đơn hàng: <br>Mã đơn: V4OZODG3,<br>Tên khách hàng: test,<br>Số điện thoại: 099999,<br>Địa chỉ: bcv,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-17 16:11:33', NULL),
(512, '7WHBAEPR', 'HeThong đã tạo đơn hàng: <br>Mã đơn: 7WHBAEPR,<br>Tên khách hàng: test,<br>Số điện thoại: 099999,<br>Địa chỉ: bcv,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-17 16:11:33', NULL),
(513, 'OBKEJQTG', 'HeThong đã tạo đơn hàng: <br>Mã đơn: OBKEJQTG,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 432432,<br>Địa chỉ: fsd,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-17 16:38:09', NULL),
(514, 'PH6KVSMJ', 'HeThong đã tạo đơn hàng: <br>Mã đơn: PH6KVSMJ,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 432432,<br>Địa chỉ: fsd,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-17 16:38:09', NULL),
(515, '5SG9VQRK', 'HeThong đã tạo đơn hàng: <br>Mã đơn: 5SG9VQRK,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 432432,<br>Địa chỉ: fsd,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-17 16:41:02', NULL),
(516, 'C95MU7HJ', 'HeThong đã tạo đơn hàng: <br>Mã đơn: C95MU7HJ,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 432432,<br>Địa chỉ: fsd,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-17 16:41:02', NULL),
(517, 'AV7TPKDI', 'HeThong đã tạo đơn hàng: <br>Mã đơn: AV7TPKDI,<br>Tên khách hàng: test,<br>Số điện thoại: 432432,<br>Địa chỉ: fds,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-17 16:42:32', NULL),
(518, 'DH3KQNXN', 'HeThong đã tạo đơn hàng: <br>Mã đơn: DH3KQNXN,<br>Tên khách hàng: test,<br>Số điện thoại: 432432,<br>Địa chỉ: fds,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-17 16:42:32', NULL),
(519, 'NOVGGQZI', 'HeThong đã tạo đơn hàng: <br>Mã đơn: NOVGGQZI,<br>Tên khách hàng: test,<br>Số điện thoại: 432432,<br>Địa chỉ: fds,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-17 16:43:57', NULL),
(520, 'PTAL1WMZ', 'HeThong đã tạo đơn hàng: <br>Mã đơn: PTAL1WMZ,<br>Tên khách hàng: test,<br>Số điện thoại: 432432,<br>Địa chỉ: fds,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-17 16:43:57', NULL),
(521, 'DQJMGDPB', 'HeThong đã tạo đơn hàng: <br>Mã đơn: DQJMGDPB,<br>Tên khách hàng: es,<br>Số điện thoại: 33333,<br>Địa chỉ: fd,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-17 16:45:08', NULL),
(522, 'UX3Z2QRB', 'HeThong đã tạo đơn hàng: <br>Mã đơn: UX3Z2QRB,<br>Tên khách hàng: es,<br>Số điện thoại: 33333,<br>Địa chỉ: fd,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-17 16:45:08', NULL),
(523, 'UX3Z2QRB', 'HeThong đã thêm sản phẩm: DWCT00161PE00RB_NV-S (giá = 2)', '2024-01-17 16:45:08', NULL),
(524, 'UX3Z2QRB', 'HeThong đã thêm sản phẩm: DWCT00431PE32SB_BL-S (giá = 1)', '2024-01-17 16:45:08', NULL),
(525, '0D8KVSS6', 'HeThong đã tạo đơn hàng: <br>Mã đơn: 0D8KVSS6,<br>Tên khách hàng: sđ,<br>Số điện thoại: 34243,<br>Địa chỉ: 32,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-17 16:47:00', NULL),
(526, 'YXS2DUXM', 'HeThong đã tạo đơn hàng: <br>Mã đơn: YXS2DUXM,<br>Tên khách hàng: sđ,<br>Số điện thoại: 34243,<br>Địa chỉ: 32,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-17 16:47:00', NULL),
(527, 'YXS2DUXM', 'HeThong đã thêm sản phẩm: DWCT00161PE00RB_NV-S (giá = 2)', '2024-01-17 16:47:00', NULL),
(528, 'YXS2DUXM', 'HeThong đã thêm sản phẩm: DWCT00431PE32SB_BL-S (giá = 1)', '2024-01-17 16:47:00', NULL),
(529, '0YZW7SGS', 'HeThong đã tạo đơn hàng: <br>Mã đơn: 0YZW7SGS,<br>Tên khách hàng: sđ,<br>Số điện thoại: 34243,<br>Địa chỉ: 32,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-17 16:47:50', NULL),
(530, 'EO83LVLW', 'HeThong đã tạo đơn hàng: <br>Mã đơn: EO83LVLW,<br>Tên khách hàng: sđ,<br>Số điện thoại: 34243,<br>Địa chỉ: 32,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-17 16:47:50', NULL),
(531, 'EO83LVLW', 'HeThong đã thêm sản phẩm: DWCT00161PE00RB_NV-S (giá = 2)', '2024-01-17 16:47:50', NULL),
(532, 'EO83LVLW', 'HeThong đã thêm sản phẩm: DWCT00431PE32SB_BL-S (giá = 1)', '2024-01-17 16:47:50', NULL),
(533, 'AVD5Y4EM', 'HeThong đã tạo đơn hàng: <br>Mã đơn: AVD5Y4EM,<br>Tên khách hàng: vsd,<br>Số điện thoại: 53253,<br>Địa chỉ: fds,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-17 16:48:54', NULL),
(534, 'LSNIHPTR', 'HeThong đã tạo đơn hàng: <br>Mã đơn: LSNIHPTR,<br>Tên khách hàng: vsd,<br>Số điện thoại: 53253,<br>Địa chỉ: fds,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-17 16:48:54', NULL),
(535, 'LSNIHPTR', 'HeThong đã thêm sản phẩm: DWCT00161PE00RB_NV-S (giá = 1)', '2024-01-17 16:48:54', NULL),
(536, 'LSNIHPTR', 'HeThong đã thêm sản phẩm: DWCT00431PE32SB_BL-S (giá = 1)', '2024-01-17 16:48:54', NULL),
(537, 'TKPGF00K', 'HeThong đã tạo đơn hàng: <br>Mã đơn: TKPGF00K,<br>Tên khách hàng: gdf,<br>Số điện thoại: 655654,<br>Địa chỉ: g,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-17 16:51:00', NULL),
(538, 'MU7BVUH5', 'HeThong đã tạo đơn hàng: <br>Mã đơn: MU7BVUH5,<br>Tên khách hàng: gdf,<br>Số điện thoại: 655654,<br>Địa chỉ: g,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-17 16:51:00', NULL),
(539, 'MU7BVUH5', 'HeThong đã thêm sản phẩm: EABT02101PE00SB_BL-29 (giá = 480000)', '2024-01-17 16:51:00', NULL),
(540, 'MU7BVUH5', 'HeThong đã thêm sản phẩm: DWCT00161PE00RB_NV-S (giá = 990000)', '2024-01-17 16:51:01', NULL),
(541, 'XEPE4XKN', 'HeThong đã tạo đơn hàng: <br>Mã đơn: XEPE4XKN,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 8888888,<br>Địa chỉ: gsd,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-17 17:11:40', NULL),
(542, 'MMZKNG6S', 'HeThong đã tạo đơn hàng: <br>Mã đơn: MMZKNG6S,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 8888888,<br>Địa chỉ: gsd,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-17 17:11:40', NULL),
(543, 'MMZKNG6S', 'HeThong đã thêm sản phẩm: DWCT00161PE00RB_NV-S (giá = 990000)', '2024-01-17 17:11:40', NULL),
(544, 'MMZKNG6S', 'HeThong đã thêm sản phẩm: DWCT00431PE32SB_BL-S (giá = 750000)', '2024-01-17 17:11:40', NULL),
(545, 'CZ0MAUUS', 'HeThong đã tạo đơn hàng: <br>Mã đơn: CZ0MAUUS,<br>Tên khách hàng: tesrt,<br>Số điện thoại: 32432432,<br>Địa chỉ: s,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-20 03:35:01', NULL),
(546, 'N2DYFCZI', 'HeThong đã tạo đơn hàng: <br>Mã đơn: N2DYFCZI,<br>Tên khách hàng: tesrt,<br>Số điện thoại: 32432432,<br>Địa chỉ: s,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-20 03:35:01', NULL),
(547, 'N2DYFCZI', 'HeThong đã thêm sản phẩm: EABT01901PE00SB_BL-29 (giá = 500000)', '2024-01-20 03:35:01', NULL),
(548, '0PBVHTEP', 'HeThong đã tạo đơn hàng: <br>Mã đơn: 0PBVHTEP,<br>Tên khách hàng: tesrt,<br>Số điện thoại: 32432432,<br>Địa chỉ: s,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-20 03:36:33', NULL),
(549, 'AU7X3AQS', 'HeThong đã tạo đơn hàng: <br>Mã đơn: AU7X3AQS,<br>Tên khách hàng: tesrt,<br>Số điện thoại: 32432432,<br>Địa chỉ: s,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-20 03:36:33', NULL),
(550, '0D8KVSS6', 'quanly đã thêm sản phẩm: ESTP04272CV00SB_BR-XL (giá = 349000)', '2024-01-20 04:58:54', NULL),
(551, '0D8KVSS6', ' đã thay đổi Số lượng (ESTP04272CV00SB_BR-XL) :1 -> 2', '2024-01-20 05:00:07', NULL),
(552, '0PBVHTEP', 'quanly đã thêm sản phẩm: DABJ00401CT00SB_NV-29 (giá = 550000)', '2024-01-20 05:01:35', NULL),
(553, '0D8KVSS6', ' đã thay đổi Số lượng (ESTP04272CV00SB_BR-XL) :2 -> 1', '2024-01-20 06:52:06', NULL),
(554, '0D8KVSS6', ' đã thay đổi Số lượng (ESTP04272CV00SB_BR-XL) :1 -> 2', '2024-01-20 07:00:17', NULL),
(555, '0D8KVSS6', 'quanly đã xóa sản phẩm: ESTP04272CV00SB_BR-XL (giá = 349000)', '2024-01-20 07:03:23', NULL),
(556, 'EYCDR8PC', 'quanly đã tạo đơn hàng: <br>Mã đơn: EYCDR8PC,<br>Tên khách hàng: nguyễn quang anh,<br>Số điện thoại: 365151822,<br>Địa chỉ: số 18 ngõ 222 tựu liệt,thanh trì, hà nội,<br>Ghi chú:                         fsd,<br>Nguồn:  quanly', '2024-01-20 07:09:22', NULL),
(557, 'EYCDR8PC', 'quanly đã thêm sản phẩm: DSTP90372CT32RB_WCB-S (giá = 290000)', '2024-01-20 07:09:28', NULL),
(558, 'EYCDR8PC', ' đã thay đổi Số lượng (DSTP90372CT32RB_WCB-S) :1 -> 2', '2024-01-20 07:11:51', NULL),
(559, 'ZUI23NIT', 'quanly đã tạo đơn hàng: <br>Mã đơn: ZUI23NIT,<br>Tên khách hàng: nguyễn quang anh,<br>Số điện thoại: 36515182222,<br>Địa chỉ: số 18 ngõ 222 tựu liệt,thanh trì, hà nội,<br>Ghi chú:                         dsf,<br>Nguồn:  quanly', '2024-01-20 07:17:28', NULL),
(560, 'ZUI23NIT', 'quanly đã thêm sản phẩm: DSTP90372CT32RB_WCB-S (giá = 290000)', '2024-01-20 07:27:36', NULL),
(561, 'ZUI23NIT', ' đã thay đổi Số lượng (DSTP90372CT32RB_WCB-S) :1 -> 2', '2024-01-20 07:27:40', NULL),
(562, 'ZUI23NIT', ' đã thay đổi Số lượng (DSTP90372CT32RB_WCB-S) :2 -> 3', '2024-01-20 07:28:05', NULL),
(563, 'ZUI23NIT', ' đã thay đổi Số lượng (DSTP90372CT32RB_WCB-S) :3 -> 1', '2024-01-20 07:42:26', NULL),
(564, 'JTSZI7MU', 'quanly đã tạo đơn hàng: <br>Mã đơn: JTSZI7MU,<br>Tên khách hàng: nguyễn quang anh,<br>Số điện thoại: 365151822,<br>Địa chỉ: số 18 ngõ 222 tựu liệt,thanh trì, hà nội,<br>Ghi chú: ,<br>Nguồn:  quanly', '2024-01-20 08:05:09', NULL),
(565, 'MSFDUEXY', 'quanly đã tạo đơn hàng: <br>Mã đơn: MSFDUEXY,<br>Tên khách hàng: nguyễn quang anh,<br>Số điện thoại: 365151822,<br>Địa chỉ: số 18 ngõ 222 tựu liệt,thanh trì, hà nội,<br>Ghi chú: ,<br>Nguồn:  quanly', '2024-01-20 08:05:09', NULL),
(566, 'MSFDUEXY', 'quanly đã thêm sản phẩm: ESTP01772CV32SB_BLE-S (giá = 420000)', '2024-01-20 08:05:09', NULL),
(567, 'UADFJMKH', 'HeThong đã tạo đơn hàng: <br>Mã đơn: UADFJMKH,<br>Tên khách hàng: nguyễn quang anh,<br>Số điện thoại: 365151822,<br>Địa chỉ: số 18 ngõ 222 tựu liệt,thanh trì, hà nội,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-20 08:06:26', NULL),
(568, 'I8XDEQJH', 'HeThong đã tạo đơn hàng: <br>Mã đơn: I8XDEQJH,<br>Tên khách hàng: nguyễn quang anh,<br>Số điện thoại: 365151822,<br>Địa chỉ: số 18 ngõ 222 tựu liệt,thanh trì, hà nội,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-20 08:06:26', NULL),
(569, 'I8XDEQJH', 'HeThong đã thêm sản phẩm: DWBS01203CV00SB_DGR-S-S (giá = 299000)', '2024-01-20 08:06:26', NULL),
(570, 'UAEZV8YX', 'quanly đã tạo đơn hàng: <br>Mã đơn: UAEZV8YX,<br>Tên khách hàng: gdfgfdg,<br>Số điện thoại: 3423,<br>Địa chỉ: số 18 ngõ 222 tựu liệt,thanh trì, hà nội,<br>Ghi chú: ,<br>Nguồn:  quanly', '2024-01-20 08:18:15', NULL),
(571, 'A5K1TOQE', 'quanly đã tạo đơn hàng: <br>Mã đơn: A5K1TOQE,<br>Tên khách hàng: gdfgfdg,<br>Số điện thoại: 3423,<br>Địa chỉ: số 18 ngõ 222 tựu liệt,thanh trì, hà nội,<br>Ghi chú: ,<br>Nguồn:  quanly', '2024-01-20 08:18:15', NULL),
(572, 'A5K1TOQE', 'quanly đã thêm sản phẩm: ESTP06772TC00SB_BL-S (giá = 380000)', '2024-01-20 08:18:15', NULL),
(573, 'EYCDR8PC', 'quanly đã thêm sản phẩm: DSTP90372CT32RB_WCB-M (giá = 290000)', '2024-01-20 08:24:33', NULL),
(574, 'UAEZV8YX', 'quanly đã thêm sản phẩm: DABJ00401CT00SB_NV-29 (giá = 550000)', '2024-01-20 08:24:41', NULL),
(575, 'A5K1TOQE', ' đã thay đổi Số lượng (ESTP06772TC00SB_BL-S) :1 -> 2', '2024-01-20 08:25:06', NULL),
(576, 'OCFAOWMB', 'quanly đã tạo đơn hàng: <br>Mã đơn: OCFAOWMB,<br>Tên khách hàng: fsdfsd,<br>Số điện thoại: 333333,<br>Địa chỉ: vd,<br>Ghi chú: ,<br>Nguồn:  quanly', '2024-01-20 08:25:31', NULL),
(577, 'OCFAOWMB', 'quanly đã thêm sản phẩm: ESTP02872CV00SB_WH-L (giá = 420000)', '2024-01-20 08:25:31', NULL);
INSERT INTO `history` (`id`, `invoice_id`, `content`, `time`, `time_ago`) VALUES
(578, 'UZZHM3TR', 'HeThong đã tạo đơn hàng: <br>Mã đơn: UZZHM3TR,<br>Tên khách hàng: nguyễn quang anh,<br>Số điện thoại: 333322323,<br>Địa chỉ: số 18 ngõ 222 tựu liệt,thanh trì, hà nội,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-20 08:28:41', NULL),
(579, 'UZZHM3TR', 'HeThong đã thêm sản phẩm: EABT02101PE00SB_BL-30 (giá = 480000)', '2024-01-20 08:28:41', NULL),
(580, 'TLSY7TFT', 'HeThong đã tạo đơn hàng: <br>Mã đơn: TLSY7TFT,<br>Tên khách hàng: dfgdf,<br>Số điện thoại: 323233232,<br>Địa chỉ: fds,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-20 08:38:59', NULL),
(581, 'TLSY7TFT', 'HeThong đã thêm sản phẩm: DWCT00431PE32SB_BL-S (giá = 750000)', '2024-01-20 08:38:59', NULL),
(582, 'SMMKHRU1', 'HeThong đã tạo đơn hàng: <br>Mã đơn: SMMKHRU1,<br>Tên khách hàng: dfsd,<br>Số điện thoại: 222222,<br>Địa chỉ: sdf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-20 08:42:50', NULL),
(583, 'SMMKHRU1', 'HeThong đã thêm sản phẩm: ESTP01072TC00SB_WH-S (giá = 400000)', '2024-01-20 08:42:50', NULL),
(584, 'YHNB0POU', 'HeThong đã tạo đơn hàng: <br>Mã đơn: YHNB0POU,<br>Tên khách hàng: dsfds,<br>Số điện thoại: 2312312,<br>Địa chỉ: f,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-20 08:48:58', NULL),
(585, 'YHNB0POU', 'HeThong đã thêm sản phẩm: ESTP00572CT00SB_DNV-M (giá = 420000)', '2024-01-20 08:48:59', NULL),
(586, 'GB4ENHC1', 'HeThong đã tạo đơn hàng: <br>Mã đơn: GB4ENHC1,<br>Tên khách hàng: nguyễn quang anh,<br>Số điện thoại: 365151822,<br>Địa chỉ: số 18 ngõ 222 tựu liệt,thanh trì, hà nội,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-20 09:01:53', NULL),
(587, 'GB4ENHC1', 'HeThong đã thêm sản phẩm: DWCT00161PE00RB_NV-S (giá = 990000)', '2024-01-20 09:01:53', NULL),
(588, '7MOJYIGO', 'HeThong đã tạo đơn hàng: <br>Mã đơn: 7MOJYIGO,<br>Tên khách hàng: vcxvx,<br>Số điện thoại: 33333,<br>Địa chỉ: fsd,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-20 09:03:07', NULL),
(589, '7MOJYIGO', 'HeThong đã thêm sản phẩm: DWCU00761PE32SB_LLG-S (giá = 750000)', '2024-01-20 09:03:07', NULL),
(590, 'KT9P9ZMY', 'HeThong đã tạo đơn hàng: <br>Mã đơn: KT9P9ZMY,<br>Tên khách hàng: nguyễn quang anh,<br>Số điện thoại: 365151822,<br>Địa chỉ: số 18 ngõ 222 tựu liệt,thanh trì, hà nội,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-20 09:28:32', NULL),
(591, 'KT9P9ZMY', 'HeThong đã thêm sản phẩm: DWCT00431PE32SB_BL-S (giá = 750000)', '2024-01-20 09:28:32', NULL),
(592, '5FTZ8G2K', 'HeThong đã tạo đơn hàng: <br>Mã đơn: 5FTZ8G2K,<br>Tên khách hàng: nguyễn quang anh,<br>Số điện thoại: 365151822,<br>Địa chỉ: số 18 ngõ 222 tựu liệt,thanh trì, hà nội,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-20 09:30:31', NULL),
(593, '5FTZ8G2K', 'HeThong đã thêm sản phẩm: ESTP00572CT00SB_DNV-S (giá = 420000)', '2024-01-20 09:30:31', NULL),
(594, '7MOJYIGO', ' đã thay đổi Số lượng (DWCU00761PE32SB_LLG-S) :1 -> 2', '2024-01-20 09:39:09', NULL),
(595, '7MOJYIGO', ' đã thay đổi Số lượng (DWCU00761PE32SB_LLG-S) :2 -> 1', '2024-01-20 09:39:14', NULL),
(596, '7MOJYIGO', 'quanly đã thêm sản phẩm: DSTP90372CT32RB_WCB-M (giá = 290000)', '2024-01-20 09:39:22', NULL),
(597, '7MOJYIGO', ' đã thay đổi Số lượng (DSTP90372CT32RB_WCB-M) :1 -> 2', '2024-01-20 09:42:31', NULL),
(598, '7MOJYIGO', 'quanly đã thêm sản phẩm: DSTP90372CT32RB_WCB-L (giá = 290000)', '2024-01-20 09:42:41', NULL),
(599, '7MOJYIGO', 'quanly đã xóa sản phẩm: DWCU00761PE32SB_LLG-S (giá = 750000)', '2024-01-20 09:42:53', NULL),
(600, '7MOJYIGO', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-31 (giá = 380000)', '2024-01-20 09:43:19', NULL),
(601, '7MOJYIGO', 'quanly đã thêm sản phẩm: DABJ01001CT00SB_BU-30 (giá = 550000)', '2024-01-20 09:46:06', NULL),
(602, 'EYCDR8PC', ' đã thay đổi Số lượng (DSTP90372CT32RB_WCB-M) :1 -> 2', '2024-01-20 10:00:54', NULL),
(603, 'EYCDR8PC', ' đã thay đổi Số lượng (DSTP90372CT32RB_WCB-M) :2 -> 1', '2024-01-20 10:03:44', NULL),
(604, 'EYCDR8PC', ' đã thay đổi Số lượng (DSTP90372CT32RB_WCB-S) :2 -> 1', '2024-01-20 10:05:32', NULL),
(605, 'EYCDR8PC', ' đã thay đổi Số lượng (DSTP90372CT32RB_WCB-M) :1 -> 2', '2024-01-20 10:08:12', NULL),
(606, 'EYCDR8PC', ' đã thay đổi Số lượng (DSTP90372CT32RB_WCB-M) :2 -> 1', '2024-01-20 10:08:58', NULL),
(607, 'EYCDR8PC', ' đã thay đổi Số lượng (DSTP90372CT32RB_WCB-M) :1 -> 2', '2024-01-20 10:09:07', NULL),
(608, 'EYCDR8PC', ' đã thay đổi Số lượng (DSTP90372CT32RB_WCB-M) :2 -> 3', '2024-01-20 10:09:17', NULL),
(609, '5FTZ8G2K', ' đã thay đổi Số lượng (ESTP00572CT00SB_DNV-S) :1 -> 2', '2024-01-20 10:09:56', NULL),
(612, '5FTZ8G2K', ' đã thay đổi Số lượng (ESTP00572CT00SB_DNV-S) :2 -> 1', '2024-01-20 10:12:10', NULL),
(613, '5FTZ8G2K', ' đã thay đổi Số lượng (ESTP00572CT00SB_DNV-S) :1 -> 2', '2024-01-20 10:12:20', NULL),
(614, '5FTZ8G2K', ' đã thay đổi Số lượng (ESTP00572CT00SB_DNV-S) :2 -> 1', '2024-01-20 10:12:24', NULL),
(615, '5FTZ8G2K', ' đã thay đổi Số lượng (ESTP00572CT00SB_DNV-S) :1 -> 3', '2024-01-20 10:12:56', NULL),
(616, '5FTZ8G2K', ' đã thay đổi Số lượng (ESTP00572CT00SB_DNV-S) :3 -> 1', '2024-01-20 10:12:59', NULL),
(617, '5FTZ8G2K', ' đã thay đổi Số lượng (ESTP00572CT00SB_DNV-S) :1 -> 2', '2024-01-20 10:14:00', NULL),
(618, '7MOJYIGO', ' đã thay đổi Số lượng (DABJ01001CT00SB_BU-30) :1 -> 2', '2024-01-20 10:16:25', NULL),
(619, '7MOJYIGO', ' đã thay đổi Số lượng (DABJ01001CT00SB_BU-30) :2 -> 1', '2024-01-20 10:16:30', NULL),
(620, '7MOJYIGO', ' đã thay đổi Số lượng (DABJ01001CT00SB_BU-30) :1 -> 2', '2024-01-20 10:18:39', NULL),
(621, '7MOJYIGO', ' đã thay đổi Số lượng (DABJ01001CT00SB_BU-30) :2 -> 1', '2024-01-20 10:18:42', NULL),
(624, 'GB4ENHC1', ' đã thay đổi Số lượng (DWCT00161PE00RB_NV-S) :2 -> 1', '2024-01-20 10:27:16', NULL),
(625, 'GB4ENHC1', ' đã thay đổi Số lượng (DWCT00161PE00RB_NV-S) :1 -> 2', '2024-01-20 10:28:54', NULL),
(626, 'GB4ENHC1', ' đã thay đổi Số lượng (DWCT00161PE00RB_NV-S) :2 -> 1', '2024-01-20 10:28:57', NULL),
(627, 'GB4ENHC1', ' đã thay đổi Số lượng (DWCT00161PE00RB_NV-S) :1 -> 2', '2024-01-20 10:29:00', NULL),
(628, 'I8XDEQJH', ' đã thay đổi Số lượng (DWBS01203CV00SB_DGR-S-S) :1 -> 2', '2024-01-20 10:31:14', NULL),
(629, 'KT9P9ZMY', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2024-01-21 08:53:55', NULL),
(630, 'KT9P9ZMY', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2024-01-21 08:54:20', NULL),
(631, 'KT9P9ZMY', ' đã thay đổi Số lượng (DWCT00431PE32SB_BL-S) :2 -> 1', '2024-01-21 08:54:23', NULL),
(632, 'KT9P9ZMY', 'quanly đã thêm sản phẩm: DABJ00401CT00SB_NV-29 (giá = 550000)', '2024-01-21 08:54:27', NULL),
(633, 'KT9P9ZMY', ' đã thay đổi Số lượng (DWCT00431PE32SB_BL-S) :1 -> 2', '2024-01-21 08:55:07', NULL),
(634, 'KT9P9ZMY', ' đã thay đổi Số lượng (DABJ00401CT00SB_NV-29) :1 -> 2', '2024-01-21 08:55:28', NULL),
(635, 'SMMKHRU1', ' đã thay đổi Số lượng (ESTP01072TC00SB_WH-S) :1 -> 2', '2024-01-21 08:58:14', NULL),
(636, 'SMMKHRU1', ' đã thay đổi Số lượng (ESTP01072TC00SB_WH-S) :2 -> 1', '2024-01-21 08:58:20', NULL),
(637, 'SMMKHRU1', ' đã thay đổi Số lượng (ESTP01072TC00SB_WH-S) :1 -> 3', '2024-01-21 09:04:01', NULL),
(638, 'SMMKHRU1', ' đã thay đổi Số lượng (ESTP01072TC00SB_WH-S) :3 -> 1', '2024-01-21 09:04:07', NULL),
(639, 'SMMKHRU1', ' đã thay đổi Số lượng (ESTP01072TC00SB_WH-S) :1 -> 2', '2024-01-21 09:04:12', NULL),
(640, 'SMMKHRU1', ' đã thay đổi Số lượng (ESTP01072TC00SB_WH-S) :2 -> 1', '2024-01-21 09:07:05', NULL),
(641, 'SMMKHRU1', ' đã thay đổi Số lượng (ESTP01072TC00SB_WH-S) :1 -> 3', '2024-01-21 09:07:08', NULL),
(642, 'SMMKHRU1', ' đã thay đổi Số lượng (ESTP01072TC00SB_WH-S) :3 -> 1', '2024-01-21 09:07:11', NULL),
(643, 'SMMKHRU1', ' đã thay đổi Số lượng (ESTP01072TC00SB_WH-S) :1 -> 2', '2024-01-21 09:08:16', NULL),
(644, 'SMMKHRU1', ' đã thay đổi Số lượng (ESTP01072TC00SB_WH-S) :2 -> 1', '2024-01-21 09:08:18', NULL),
(652, 'SMMKHRU1', ' đã thay đổi Số lượng (ESTP01072TC00SB_WH-S) :1 -> 3', '2024-01-21 09:15:36', NULL),
(653, 'SMMKHRU1', ' đã thay đổi Số lượng (ESTP01072TC00SB_WH-S) :3 -> 2', '2024-01-21 09:16:26', NULL),
(654, 'SMMKHRU1', ' đã thay đổi Số lượng (ESTP01072TC00SB_WH-S) :2 -> 1', '2024-01-21 09:16:28', NULL),
(655, 'SMMKHRU1', ' đã thay đổi Số lượng (ESTP01072TC00SB_WH-S) :1 -> 2', '2024-01-21 09:17:21', NULL),
(656, 'SMMKHRU1', ' đã thay đổi Số lượng (ESTP01072TC00SB_WH-S) :2 -> 3', '2024-01-21 09:17:23', NULL),
(657, 'SMMKHRU1', ' đã thay đổi Số lượng (ESTP01072TC00SB_WH-S) :3 -> 1', '2024-01-21 09:17:25', NULL),
(658, 'I1TWS5QJ', 'quanly đã tạo đơn hàng: <br>Mã đơn: I1TWS5QJ,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 423432,<br>Địa chỉ: sdf,<br>Ghi chú: ,<br>Nguồn:  quanly', '2024-01-21 09:17:56', NULL),
(659, 'I1TWS5QJ', 'quanly đã thêm sản phẩm: DWCT00161PE00RB_NV-S (giá = 990000)', '2024-01-21 09:17:56', NULL),
(660, 'I1TWS5QJ', 'quanly đã thêm sản phẩm: DABJ00401CT00SB_NV-29 (giá = 550000)', '2024-01-21 09:18:55', NULL),
(661, 'OCFAOWMB', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2024-01-21 09:19:08', NULL),
(662, 'OCFAOWMB', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-38) :1 -> 2', '2024-01-21 09:20:19', NULL),
(663, 'OCFAOWMB', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-38) :2 -> 1', '2024-01-21 09:20:23', NULL),
(664, 'OCFAOWMB', ' đã thay đổi Số lượng (ESTP02872CV00SB_WH-L) :1 -> 2', '2024-01-21 09:20:46', NULL),
(665, 'OCFAOWMB', ' đã thay đổi Số lượng (ESTP02872CV00SB_WH-L) :2 -> 3', '2024-01-21 09:24:33', NULL),
(666, 'OCFAOWMB', ' đã thay đổi Số lượng (ESTP02872CV00SB_WH-L) :3 -> 1', '2024-01-21 09:24:40', NULL),
(668, 'OCFAOWMB', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-38) :1 -> 2', '2024-01-21 09:45:11', NULL),
(669, 'OCFAOWMB', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-38) :2 -> 1', '2024-01-21 09:45:14', NULL),
(670, 'KT9P9ZMY', ' đã thay đổi Số lượng (DABJ00401CT00SB_NV-29) :2 -> 1', '2024-01-21 09:52:48', NULL),
(671, 'KT9P9ZMY', ' đã thay đổi Số lượng (DWCT00431PE32SB_BL-S) :2 -> 1', '2024-01-21 09:52:53', NULL),
(672, 'KT9P9ZMY', ' đã thay đổi Số lượng (DWCT00431PE32SB_BL-S) :1 -> 2', '2024-01-21 09:53:05', NULL),
(673, 'KT9P9ZMY', ' đã thay đổi Số lượng (DABJ00401CT00SB_NV-29) :1 -> 2', '2024-01-21 09:53:13', NULL),
(674, 'KT9P9ZMY', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2024-01-21 09:57:41', NULL),
(675, 'XRAPWYJI', 'quanly đã tạo đơn hàng: <br>Mã đơn: XRAPWYJI,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 4534543,<br>Địa chỉ: fđ,<br>Ghi chú: ,<br>Nguồn:  quanly', '2024-01-21 10:02:57', NULL),
(676, 'XRAPWYJI', 'quanly đã thêm sản phẩm: DWCT00161PE00RB_NV-S (giá = 990000)', '2024-01-21 10:02:57', NULL),
(677, 'KT9P9ZMY', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2024-01-21 10:04:32', NULL),
(678, 'KT9P9ZMY', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2024-01-21 10:04:36', NULL),
(679, 'KT9P9ZMY', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-30 (giá = 380000)', '2024-01-21 10:05:05', NULL),
(680, 'KT9P9ZMY', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2024-01-21 10:05:10', NULL),
(681, 'KT9P9ZMY', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-39) :1 -> 2', '2024-01-21 10:09:17', NULL),
(682, 'KT9P9ZMY', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-30 (giá = 380000)', '2024-01-21 10:09:25', NULL),
(683, 'KT9P9ZMY', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2024-01-21 10:09:28', NULL),
(684, 'KT9P9ZMY', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2024-01-21 10:09:31', NULL),
(685, 'KT9P9ZMY', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2024-01-21 10:09:35', NULL),
(686, 'KT9P9ZMY', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-38) :1 -> 2', '2024-01-21 10:09:48', NULL),
(687, 'KT9P9ZMY', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-38) :2 -> 1', '2024-01-21 10:10:17', NULL),
(688, 'KT9P9ZMY', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-38) :1 -> 2', '2024-01-21 10:10:21', NULL),
(689, 'KT9P9ZMY', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2024-01-21 10:10:58', NULL),
(690, 'AEAXIQS0', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: AEAXIQS0,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 34232,<br>Địa chỉ: ssd,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-21 10:16:12', NULL),
(691, 'AEAXIQS0', 'Khách hàng đã thêm sản phẩm: DWCT00161PE00RB_NV-S (giá = 990000)', '2024-01-21 10:16:12', NULL),
(692, 'X6JPOCJH', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: X6JPOCJH,<br>Tên khách hàng: sdgsd,<br>Số điện thoại: 345234532,<br>Địa chỉ: cxgdf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-21 10:22:04', NULL),
(693, 'X6JPOCJH', 'Khách hàng đã thêm sản phẩm: DWCT00161PE00RB_NV-S (giá = 990000)', '2024-01-21 10:22:04', NULL),
(694, '5FTZ8G2K', ' đã thay đổi Số lượng (ESTP00572CT00SB_DNV-S) :2 -> 1', '2024-01-21 10:22:20', NULL),
(695, '5FTZ8G2K', ' đã thay đổi Số lượng (ESTP00572CT00SB_DNV-S) :1 -> 2', '2024-01-21 10:22:22', NULL),
(696, '5FTZ8G2K', ' đã thay đổi Số lượng (ESTP00572CT00SB_DNV-S) :2 -> 1', '2024-01-21 10:22:26', NULL),
(697, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2024-01-21 10:22:29', NULL),
(698, '5FTZ8G2K', ' đã thay đổi Số lượng (DSBI01302LI00SB_BE-29) :1 -> 2', '2024-01-21 10:22:37', NULL),
(699, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2024-01-21 10:23:10', NULL),
(700, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DABJ00401CT00SB_NV-29 (giá = 550000)', '2024-01-21 10:25:08', NULL),
(702, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DABJ00401CT00SB_NV-29 (giá = 550000)', '2024-01-21 10:26:43', NULL),
(703, '5FTZ8G2K', 'quanly đã xóa sản phẩm: ESTP00572CT00SB_DNV-S (giá = 420000)', '2024-01-21 10:26:54', NULL),
(704, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DABJ00401CT00SB_NV-29 (giá = 550000)', '2024-01-21 10:27:06', NULL),
(705, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DSTP61172CX00SB_WH-S (giá = 333333)', '2024-01-21 10:27:09', NULL),
(706, '5FTZ8G2K', ' đã thay đổi Số lượng (DSTP61172CX00SB_WH-S) :1 -> 2', '2024-01-21 10:27:12', NULL),
(707, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DABJ00401CT00SB_NV-29 (giá = 550000)', '2024-01-21 10:27:19', NULL),
(708, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2024-01-21 10:27:26', NULL),
(709, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_WH-30 (giá = 380000)', '2024-01-21 10:27:29', NULL),
(710, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DABJ90401CT19SB_NV-30 (giá = 550000)', '2024-01-21 10:27:33', NULL),
(711, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DABJ90401CT19SB_NV-30 (giá = 550000)', '2024-01-21 10:27:37', NULL),
(712, '5FTZ8G2K', ' đã thay đổi Số lượng (DSBI01302LI00SB_WH-30) :1 -> 2', '2024-01-21 10:27:44', NULL),
(713, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DSTP61172CX00SB_WH-S (giá = 333333)', '2024-01-21 10:27:50', NULL),
(714, 'EYCDR8PC', ' đã thay đổi Số lượng (DSTP90372CT32RB_WCB-M) :3 -> 2', '2024-01-21 10:29:19', NULL),
(715, 'EYCDR8PC', ' đã thay đổi Số lượng (DSTP90372CT32RB_WCB-M) :2 -> 1', '2024-01-21 10:29:22', NULL),
(716, '5FTZ8G2K', ' đã thay đổi Số lượng (DSBI01302LI00SB_WH-30) :2 -> 1', '2024-01-21 10:29:34', NULL),
(717, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_WH-30 (giá = 380000)', '2024-01-21 10:29:38', NULL),
(718, 'A5K1TOQE', ' đã thay đổi Số lượng (ESTP06772TC00SB_BL-S) :2 -> 3', '2024-01-21 10:40:16', NULL),
(719, 'A5K1TOQE', ' đã thay đổi Số lượng (ESTP06772TC00SB_BL-S) :3 -> 1', '2024-01-21 10:43:36', NULL),
(720, 'A5K1TOQE', ' đã thay đổi Số lượng (ESTP06772TC00SB_BL-S) :1 -> 2', '2024-01-21 10:44:12', NULL),
(721, 'A5K1TOQE', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-39 (giá = 450000)', '2024-01-21 10:44:17', NULL),
(722, 'A5K1TOQE', ' đã thay đổi Số lượng (DATB61471BA00SB_LLB-39) :1 -> 21', '2024-01-21 10:44:22', NULL),
(723, 'A5K1TOQE', ' đã thay đổi Số lượng (DATB61471BA00SB_LLB-39) :21 -> 1', '2024-01-21 10:44:24', NULL),
(724, 'A5K1TOQE', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-39 (giá = 450000)', '2024-01-21 10:44:28', NULL),
(725, 'A5K1TOQE', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2024-01-21 10:45:11', NULL),
(726, 'A5K1TOQE', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2024-01-21 10:49:57', NULL),
(727, 'A5K1TOQE', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-38) :1 -> 2', '2024-01-21 10:50:28', NULL),
(728, 'A5K1TOQE', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-39) :1 -> 2', '2024-01-21 10:50:46', NULL),
(729, 'A5K1TOQE', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2024-01-21 10:51:06', NULL),
(730, 'A5K1TOQE', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-31 (giá = 380000)', '2024-01-21 10:51:12', NULL),
(731, 'A5K1TOQE', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-38) :2 -> 3', '2024-01-21 10:51:39', NULL),
(732, 'A5K1TOQE', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-38) :3 -> 4', '2024-01-21 10:52:03', NULL),
(733, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-39) :1 -> 2', '2024-01-21 10:56:01', NULL),
(734, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2024-01-21 10:56:53', NULL),
(735, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2024-01-21 12:13:56', NULL),
(736, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2024-01-21 12:14:00', NULL),
(737, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-30 (giá = 380000)', '2024-01-21 12:15:57', NULL),
(738, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2024-01-21 12:16:17', NULL),
(739, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-30 (giá = 380000)', '2024-01-21 12:16:19', NULL),
(740, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2024-01-21 12:16:20', NULL),
(741, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2024-01-21 12:16:24', NULL),
(742, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-30 (giá = 380000)', '2024-01-21 12:19:57', NULL),
(743, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2024-01-21 12:20:01', NULL),
(744, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_WH-29 (giá = 380000)', '2024-01-21 12:20:03', NULL),
(745, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DABJ01001CT00SB_BU-29 (giá = 550000)', '2024-01-21 12:20:11', NULL),
(746, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DABJ01001CT00SB_BU-29 (giá = 550000)', '2024-01-21 12:20:18', NULL),
(747, '5FTZ8G2K', ' đã thay đổi Số lượng (DSBI01302LI00SB_BE-29) :1 -> 2', '2024-01-21 12:20:25', NULL),
(748, '5FTZ8G2K', ' đã thay đổi Số lượng (DSBI01302LI00SB_BE-30) :1 -> 2', '2024-01-21 12:20:33', NULL),
(749, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-31 (giá = 380000)', '2024-01-21 12:20:39', NULL),
(750, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2024-01-21 12:21:27', NULL),
(751, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_WH-29 (giá = 380000)', '2024-01-21 12:21:29', NULL),
(752, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-31 (giá = 380000)', '2024-01-21 12:21:30', NULL),
(753, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-38) :1 -> 2', '2024-01-21 12:21:34', NULL),
(754, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2024-01-21 12:21:38', NULL),
(755, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-38) :2 -> 3', '2024-01-21 12:22:27', NULL),
(756, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-38) :3 -> 4', '2024-01-21 12:22:27', NULL),
(757, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-38) :4 -> 5', '2024-01-21 12:22:28', NULL),
(758, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-38) :5 -> 6', '2024-01-21 12:22:29', NULL),
(759, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-38) :6 -> 7', '2024-01-21 12:22:29', NULL),
(760, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-38) :7 -> 8', '2024-01-21 12:22:30', NULL),
(761, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-38) :8 -> 9', '2024-01-21 12:22:30', NULL),
(762, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-38) :9 -> 10', '2024-01-21 12:22:30', NULL),
(763, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-39) :1 -> 2', '2024-01-21 12:22:31', NULL),
(764, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-39) :2 -> 3', '2024-01-21 12:22:31', NULL),
(765, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-39) :3 -> 4', '2024-01-21 12:22:31', NULL),
(766, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-39) :4 -> 5', '2024-01-21 12:22:31', NULL),
(767, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-40 (giá = 480000)', '2024-01-21 12:22:31', NULL),
(768, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-40) :1 -> 2', '2024-01-21 12:22:32', NULL),
(769, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-40) :2 -> 3', '2024-01-21 12:22:32', NULL),
(770, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-40) :3 -> 4', '2024-01-21 12:22:32', NULL),
(771, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-38) :10 -> 11', '2024-01-21 12:22:32', NULL),
(772, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-38) :11 -> 12', '2024-01-21 12:22:32', NULL),
(773, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-38) :12 -> 13', '2024-01-21 12:22:33', NULL),
(774, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-39) :5 -> 6', '2024-01-21 12:22:39', NULL),
(775, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-39) :6 -> 7', '2024-01-21 12:22:44', NULL),
(776, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-40) :4 -> 5', '2024-01-21 12:22:47', NULL),
(777, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2024-01-21 12:22:52', NULL),
(778, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-40 (giá = 480000)', '2024-01-21 12:22:54', NULL),
(779, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-30 (giá = 380000)', '2024-01-21 12:22:55', NULL),
(780, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-38) :13 -> 14', '2024-01-21 12:23:04', NULL),
(781, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2024-01-21 12:23:06', NULL),
(782, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-39) :1 -> 2', '2024-01-21 12:23:08', NULL),
(783, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-39) :2 -> 3', '2024-01-21 12:23:09', NULL),
(784, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-41 (giá = 480000)', '2024-01-21 12:23:11', NULL),
(785, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-41) :1 -> 2', '2024-01-21 12:23:15', NULL),
(786, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-41) :2 -> 3', '2024-01-21 12:23:17', NULL),
(787, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-41) :3 -> 4', '2024-01-21 12:23:21', NULL),
(788, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-40 (giá = 480000)', '2024-01-21 12:23:23', NULL),
(789, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-40) :1 -> 2', '2024-01-21 12:23:27', NULL),
(790, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-40) :2 -> 3', '2024-01-21 12:23:31', NULL),
(791, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-40) :3 -> 4', '2024-01-21 12:23:36', NULL),
(792, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-40) :4 -> 5', '2024-01-21 12:23:37', NULL),
(793, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-40) :5 -> 6', '2024-01-21 12:23:38', NULL),
(794, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-40 (giá = 480000)', '2024-01-21 12:23:42', NULL),
(795, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-41 (giá = 480000)', '2024-01-21 12:23:44', NULL),
(796, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2024-01-21 12:23:45', NULL),
(797, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2024-01-21 12:23:46', NULL),
(798, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DSTP61172CX00SB_WH-S (giá = 333333)', '2024-01-21 12:23:50', NULL),
(799, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DSTP61172CX00SB_WH-M (giá = 333333)', '2024-01-21 12:23:51', NULL),
(800, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DSTP61172CX00SB_WH-XL (giá = 333333)', '2024-01-21 12:23:53', NULL),
(801, '5FTZ8G2K', ' đã thay đổi Số lượng (DSTP61172CX00SB_WH-S) :1 -> 2', '2024-01-21 12:23:58', NULL),
(802, '5FTZ8G2K', ' đã thay đổi Số lượng (DSTP61172CX00SB_WH-M) :1 -> 2', '2024-01-21 12:24:01', NULL),
(803, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DSTP61172CX00SB_WH-L (giá = 333333)', '2024-01-21 12:24:02', NULL),
(804, '5FTZ8G2K', ' đã thay đổi Số lượng (DSTP61172CX00SB_WH-L) :1 -> 2', '2024-01-21 12:24:04', NULL),
(805, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DSTP61172CX00SB_WH-L (giá = 333333)', '2024-01-21 12:25:11', NULL),
(806, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DSTP61172CX00SB_WH-XL (giá = 333333)', '2024-01-21 12:25:12', NULL),
(807, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-38 (giá = 450000)', '2024-01-21 12:25:24', NULL),
(808, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-38 (giá = 450000)', '2024-01-21 12:25:24', NULL),
(809, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-38 (giá = 450000)', '2024-01-21 12:25:24', NULL),
(810, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-38 (giá = 450000)', '2024-01-21 12:25:24', NULL),
(811, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB61471BA00SB_LLB-38) :1 -> 2', '2024-01-21 12:25:27', NULL),
(812, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-40 (giá = 450000)', '2024-01-21 12:25:30', NULL),
(813, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-40 (giá = 450000)', '2024-01-21 12:25:30', NULL),
(814, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-40 (giá = 450000)', '2024-01-21 12:25:30', NULL),
(815, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-40 (giá = 450000)', '2024-01-21 12:25:30', NULL),
(816, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-40 (giá = 480000)', '2024-01-21 12:25:50', NULL),
(817, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2024-01-21 12:25:51', NULL),
(818, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2024-01-21 12:25:52', NULL),
(819, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-39 (giá = 450000)', '2024-01-21 12:25:54', NULL),
(820, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-42 (giá = 450000)', '2024-01-21 12:25:56', NULL),
(821, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_WH-38 (giá = 450000)', '2024-01-21 12:25:57', NULL),
(822, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_WH-40 (giá = 450000)', '2024-01-21 12:25:58', NULL),
(823, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB61471BA00SB_WH-40) :1 -> 2', '2024-01-21 12:25:59', NULL),
(824, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_NV-38 (giá = 450000)', '2024-01-21 12:26:00', NULL),
(825, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-38 (giá = 450000)', '2024-01-21 12:26:16', NULL),
(826, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-38 (giá = 450000)', '2024-01-21 12:26:18', NULL),
(827, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-38 (giá = 450000)', '2024-01-21 12:26:20', NULL),
(828, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-38 (giá = 450000)', '2024-01-21 12:26:21', NULL),
(829, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-40 (giá = 450000)', '2024-01-21 12:26:22', NULL),
(830, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-40 (giá = 450000)', '2024-01-21 12:26:23', NULL),
(831, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-40 (giá = 450000)', '2024-01-21 12:26:25', NULL),
(832, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-40 (giá = 450000)', '2024-01-21 12:26:25', NULL),
(833, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2024-01-21 12:26:27', NULL),
(834, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-39 (giá = 450000)', '2024-01-21 12:26:28', NULL),
(835, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-42 (giá = 450000)', '2024-01-21 12:26:29', NULL),
(836, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_WH-38 (giá = 450000)', '2024-01-21 12:26:30', NULL),
(837, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-40 (giá = 480000)', '2024-01-21 12:26:31', NULL),
(838, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2024-01-21 12:26:33', NULL),
(839, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_WH-40 (giá = 450000)', '2024-01-21 12:26:34', NULL),
(840, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_NV-38 (giá = 450000)', '2024-01-21 12:26:35', NULL),
(841, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DSTP61172CX00SB_WH-M (giá = 333333)', '2024-01-21 12:26:36', NULL),
(842, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-39 (giá = 450000)', '2024-01-21 12:28:07', NULL),
(843, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-38 (giá = 450000)', '2024-01-21 12:28:13', NULL),
(844, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-40 (giá = 450000)', '2024-01-21 12:28:14', NULL),
(845, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-41 (giá = 450000)', '2024-01-21 12:28:15', NULL),
(846, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_WH-39 (giá = 450000)', '2024-01-21 12:28:17', NULL),
(847, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_NV-40 (giá = 450000)', '2024-01-21 12:28:22', NULL),
(848, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-39 (giá = 450000)', '2024-01-21 12:28:36', NULL),
(849, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-38 (giá = 450000)', '2024-01-21 12:28:38', NULL),
(850, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-40 (giá = 450000)', '2024-01-21 12:28:38', NULL),
(851, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-41 (giá = 450000)', '2024-01-21 12:28:40', NULL),
(852, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_WH-39 (giá = 450000)', '2024-01-21 12:28:41', NULL),
(853, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_NV-40 (giá = 450000)', '2024-01-21 12:28:43', NULL),
(854, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-38 (giá = 450000)', '2024-01-21 12:28:48', NULL),
(855, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-38 (giá = 450000)', '2024-01-21 12:28:48', NULL),
(857, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-38 (giá = 450000)', '2024-01-21 12:28:48', NULL),
(858, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-38 (giá = 450000)', '2024-01-21 12:28:48', NULL),
(860, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB61471BA00SB_LLB-38) :1 -> 2', '2024-01-21 12:28:57', NULL),
(861, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-38 (giá = 450000)', '2024-01-21 12:36:23', NULL),
(862, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-38 (giá = 450000)', '2024-01-21 12:36:24', NULL),
(863, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-38 (giá = 450000)', '2024-01-21 12:36:25', NULL),
(864, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-38 (giá = 450000)', '2024-01-21 12:36:26', NULL),
(866, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2024-01-21 12:36:30', NULL),
(867, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2024-01-21 12:36:38', NULL),
(868, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2024-01-21 12:36:38', NULL),
(869, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2024-01-21 12:36:42', NULL),
(871, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-38) :1 -> 2', '2024-01-21 12:36:45', NULL),
(872, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-38) :2 -> 3', '2024-01-21 12:36:46', NULL),
(873, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-38) :3 -> 4', '2024-01-21 12:36:47', NULL),
(874, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-39) :1 -> 2', '2024-01-21 12:36:48', NULL),
(875, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB41671CA11RB_NBX-39) :2 -> 3', '2024-01-21 12:36:49', NULL),
(876, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-40 (giá = 480000)', '2024-01-21 12:36:51', NULL),
(877, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-40 (giá = 480000)', '2024-01-21 12:36:51', NULL),
(878, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2024-01-21 12:37:12', NULL),
(879, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2024-01-21 12:37:14', NULL),
(880, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2024-01-21 12:37:15', NULL),
(881, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-40 (giá = 480000)', '2024-01-21 12:37:16', NULL),
(882, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2024-01-21 12:37:17', NULL),
(883, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DSTP61172CX00SB_WH-S (giá = 333333)', '2024-01-21 12:37:18', NULL),
(884, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-40 (giá = 480000)', '2024-01-21 12:37:19', NULL),
(885, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-38 (giá = 450000)', '2024-01-21 12:37:25', NULL),
(886, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-38 (giá = 450000)', '2024-01-21 12:37:25', NULL),
(887, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-39 (giá = 450000)', '2024-01-21 12:37:29', NULL),
(888, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-39 (giá = 450000)', '2024-01-21 12:37:29', NULL),
(889, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-42 (giá = 450000)', '2024-01-21 12:37:35', NULL),
(890, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-42 (giá = 450000)', '2024-01-21 12:37:35', NULL),
(891, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-38 (giá = 450000)', '2024-01-21 12:43:28', NULL),
(892, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-38 (giá = 450000)', '2024-01-21 12:43:30', NULL),
(893, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-39 (giá = 450000)', '2024-01-21 12:43:32', NULL),
(894, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-39 (giá = 450000)', '2024-01-21 12:43:33', NULL),
(895, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-42 (giá = 450000)', '2024-01-21 12:43:34', NULL),
(896, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-42 (giá = 450000)', '2024-01-21 12:43:35', NULL),
(897, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-40 (giá = 450000)', '2024-01-21 12:43:40', NULL),
(898, '5FTZ8G2K', ' đã thay đổi Số lượng (DATB61471BA00SB_LLB-40) :1 -> 2', '2024-01-21 12:43:54', NULL),
(899, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2024-01-21 12:56:30', NULL),
(900, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-30 (giá = 380000)', '2024-01-21 13:06:23', NULL),
(901, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DSTP61172CX00SB_WH-S (giá = 333333)', '2024-01-21 13:07:20', NULL),
(902, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-30 (giá = 380000)', '2024-01-21 13:07:25', NULL),
(903, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DSTP61172CX00SB_WH-S (giá = 333333)', '2024-01-21 13:07:27', NULL),
(904, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DSTP65072CT04SB_BL-L (giá = 450000)', '2024-01-21 13:08:12', NULL),
(905, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DSTP61172CX00SB_WH-M (giá = 333333)', '2024-01-21 13:09:34', NULL),
(906, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DSTP65072CT04SB_BL-L (giá = 450000)', '2024-01-21 13:09:38', NULL),
(907, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DSTP61172CX00SB_WH-M (giá = 333333)', '2024-01-21 13:09:42', NULL),
(908, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2024-01-21 13:09:43', NULL),
(909, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2024-01-21 13:09:47', NULL),
(910, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-33 (giá = 380000)', '2024-01-21 13:14:31', NULL),
(911, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-39 (giá = 480000)', '2024-01-21 13:14:33', NULL),
(912, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DSTP61172CX00SB_WH-S (giá = 333333)', '2024-01-21 13:14:39', NULL),
(913, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DSTP61172CX00SB_WH-S (giá = 333333)', '2024-01-21 13:32:42', NULL),
(914, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-33 (giá = 380000)', '2024-01-21 13:40:31', NULL),
(915, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-40 (giá = 450000)', '2024-01-21 14:02:03', NULL),
(916, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2024-01-21 14:02:09', NULL),
(917, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2024-01-21 14:02:16', NULL),
(918, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DSTP61172CX00SB_WH-S (giá = 333333)', '2024-01-21 14:02:49', NULL),
(919, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2024-01-21 14:02:55', NULL),
(920, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-29 (giá = 380000)', '2024-01-21 14:02:59', NULL),
(921, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DSTP61172CX00SB_WH-S (giá = 333333)', '2024-01-21 14:03:47', NULL),
(922, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-31 (giá = 380000)', '2024-01-21 14:04:20', NULL),
(923, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-32 (giá = 380000)', '2024-01-21 14:04:25', NULL),
(924, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-32 (giá = 380000)', '2024-01-21 14:04:34', NULL),
(925, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-31 (giá = 380000)', '2024-01-21 14:05:01', NULL),
(926, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-41 (giá = 450000)', '2024-01-21 14:05:12', NULL),
(927, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-41 (giá = 480000)', '2024-01-21 14:05:19', NULL),
(928, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-41 (giá = 480000)', '2024-01-21 14:05:23', NULL),
(929, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-40 (giá = 480000)', '2024-01-21 14:06:34', NULL),
(930, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-40 (giá = 480000)', '2024-01-21 14:06:56', NULL),
(931, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-41 (giá = 450000)', '2024-01-21 14:07:55', NULL),
(932, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-42 (giá = 480000)', '2024-01-21 14:08:16', NULL),
(933, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-42 (giá = 480000)', '2024-01-21 14:08:24', NULL),
(934, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2024-01-21 14:12:38', NULL),
(935, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_NV-38 (giá = 450000)', '2024-01-21 14:12:43', NULL),
(936, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_NV-38 (giá = 450000)', '2024-01-21 14:13:59', NULL),
(937, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-40 (giá = 450000)', '2024-01-21 14:14:04', NULL),
(938, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-40 (giá = 450000)', '2024-01-21 14:14:08', NULL),
(939, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-41 (giá = 450000)', '2024-01-21 14:14:51', NULL),
(940, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-41 (giá = 450000)', '2024-01-21 14:15:15', NULL),
(941, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-41 (giá = 450000)', '2024-01-21 14:15:20', NULL),
(942, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-41 (giá = 450000)', '2024-01-21 14:16:12', NULL),
(943, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_NV-38 (giá = 450000)', '2024-01-21 14:16:19', NULL),
(944, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_NV-38 (giá = 450000)', '2024-01-21 14:16:30', NULL),
(945, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_WH-40 (giá = 450000)', '2024-01-21 14:16:36', NULL),
(946, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_WH-40 (giá = 450000)', '2024-01-21 14:19:25', NULL),
(947, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DABJ90301CT16SB_NV-33 (giá = 550000)', '2024-01-21 14:23:52', NULL),
(948, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DABJ90301CT16SB_NV-33 (giá = 550000)', '2024-01-21 14:25:48', NULL),
(949, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DABJ01001CT00SB_BU-31 (giá = 550000)', '2024-01-21 14:30:09', NULL),
(950, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-30 (giá = 380000)', '2024-01-21 14:33:41', NULL),
(951, '5FTZ8G2K', 'quanly đã thêm sản phẩm: CABJ00301CT19SB_BU-33 (giá = 550000)', '2024-01-21 14:34:56', NULL),
(952, '5FTZ8G2K', 'quanly đã xóa sản phẩm: CABJ00301CT19SB_BU-33 (giá = 550000)', '2024-01-21 14:47:51', NULL),
(953, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-30 (giá = 380000)', '2024-01-21 14:47:55', NULL),
(954, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_NV-31 (giá = 380000)', '2024-01-21 14:47:58', NULL),
(955, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_NV-31 (giá = 380000)', '2024-01-21 14:47:59', NULL),
(956, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DABJ01001CT00SB_BU-31 (giá = 550000)', '2024-01-21 14:48:01', NULL),
(957, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB41671CA11RB_NBX-38 (giá = 480000)', '2024-01-21 14:48:02', NULL),
(958, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-31 (giá = 380000)', '2024-01-21 14:57:38', NULL),
(959, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-41 (giá = 450000)', '2024-01-21 14:57:59', NULL),
(960, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DABJ00401CT00SB_NV-31 (giá = 550000)', '2024-01-21 14:58:39', NULL),
(961, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DABJ00401CT00SB_NV-31 (giá = 550000)', '2024-01-21 14:58:42', NULL),
(962, '5FTZ8G2K', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-41 (giá = 450000)', '2024-01-21 14:59:39', NULL),
(963, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DABJ90301CT16SB_NV-29 (giá = 550000)', '2024-01-21 14:59:45', NULL),
(964, '5FTZ8G2K', 'quanly đã thêm sản phẩm: DABJ90801CT19SB_DBU-29 (giá = 550000)', '2024-01-21 15:00:44', NULL),
(965, '5FTZ8G2K', ' đã thay đổi Số lượng (DABJ90801CT19SB_DBU-29) :1 -> 2', '2024-01-21 15:06:02', NULL),
(966, '5FTZ8G2K', ' đã thay đổi Số lượng (DABJ90801CT19SB_DBU-29) :2 -> 1', '2024-01-21 15:06:11', NULL),
(967, '5FTZ8G2K', ' đã thay đổi Số lượng (DABJ90801CT19SB_DBU-29) :1 -> 2', '2024-01-21 15:08:48', NULL),
(968, '5FTZ8G2K', ' đã thay đổi Số lượng (DABJ90801CT19SB_DBU-29) :2 -> 1', '2024-01-21 15:10:38', NULL),
(969, '5FTZ8G2K', ' đã thay đổi Số lượng (DABJ90801CT19SB_DBU-29) :1 -> 2', '2024-01-21 15:11:45', NULL),
(970, '5FTZ8G2K', ' đã thay đổi Số lượng (DABJ90801CT19SB_DBU-29) :2 -> 1', '2024-01-21 15:13:00', NULL),
(971, '5FTZ8G2K', ' đã thay đổi Số lượng (DABJ90801CT19SB_DBU-29) :1 -> 2', '2024-01-21 15:18:38', NULL),
(972, '5FTZ8G2K', ' đã thay đổi Số lượng (DABJ90801CT19SB_DBU-29) :2 -> 1', '2024-01-21 15:18:46', NULL),
(973, '5FTZ8G2K', ' đã thay đổi Số lượng (DABJ90801CT19SB_DBU-29) :1 -> 2', '2024-01-21 15:18:51', NULL),
(974, '5FTZ8G2K', ' đã thay đổi Số lượng (DABJ90801CT19SB_DBU-29) :2 -> 1', '2024-01-21 15:18:53', NULL),
(975, '5FTZ8G2K', 'quanly đã thay đổi Trạng thái đơn hàng: Đơn mới -> Đã lên đơn', '2024-01-21 15:23:37', NULL),
(976, '7MOJYIGO', 'quanly đã thay đổi Trạng thái đơn hàng: Đơn mới -> Đang xử lý', '2024-01-21 15:30:24', NULL),
(977, '7MOJYIGO', 'quanly đã thay đổi Trạng thái đơn hàng: Đang xử lý -> Đã lên đơn', '2024-01-21 15:30:27', NULL),
(978, '7MOJYIGO', 'quanly đã thay đổi Trạng thái đơn hàng: Đã lên đơn -> Đang xử lý', '2024-01-21 15:35:22', NULL),
(979, '7MOJYIGO', 'quanly đã thay đổi Trạng thái đơn hàng: Đang xử lý -> Đã lên đơn', '2024-01-21 15:35:25', NULL),
(980, '7MOJYIGO', 'quanly đã thay đổi Trạng thái đơn hàng: Đã lên đơn -> Đơn mới', '2024-01-21 15:48:49', NULL),
(981, '7MOJYIGO', 'quanly đã thay đổi Trạng thái đơn hàng: Đơn mới -> Đã lên đơn', '2024-01-21 15:48:52', NULL),
(982, '7MOJYIGO', 'quanly đã thay đổi Trạng thái đơn hàng: Đã lên đơn -> Đang xử lý', '2024-01-21 15:49:30', NULL),
(983, '7MOJYIGO', 'quanly đã thay đổi Trạng thái đơn hàng: Đang xử lý -> Đã lên đơn', '2024-01-21 15:49:44', NULL),
(984, '7MOJYIGO', 'nhanvien1 đã thay đổi Trạng thái đơn hàng: Đã lên đơn -> Đang xử lý', '2024-01-21 15:51:46', NULL),
(985, '7MOJYIGO', 'nhanvien1 đã thay đổi Trạng thái đơn hàng: Đang xử lý -> Đã lên đơn', '2024-01-21 15:51:50', NULL),
(986, '7MOJYIGO', 'nhanvien1 đã thay đổi Trạng thái đơn hàng: Đã lên đơn -> Đang giao hàng', '2024-01-21 15:51:54', NULL),
(987, '7MOJYIGO', 'nhanvien1 đã thay đổi Trạng thái đơn hàng: Đang giao hàng -> Đã lên đơn', '2024-01-21 15:51:57', NULL),
(988, '7MOJYIGO', 'nhanvien1 đã thay đổi Trạng thái đơn hàng: Đã lên đơn -> Đang giao hàng', '2024-01-21 15:52:01', NULL),
(989, '7MOJYIGO', 'nhanvien1 đã thay đổi Trạng thái đơn hàng: Đang giao hàng -> Đã lên đơn', '2024-01-21 15:52:17', NULL),
(990, '7MOJYIGO', 'nhanvien1 đã thay đổi Trạng thái đơn hàng: Đã lên đơn -> Đang xử lý', '2024-01-21 15:52:21', NULL),
(991, '7MOJYIGO', 'nhanvien1 đã thay đổi Trạng thái đơn hàng: Đang xử lý -> Đã lên đơn', '2024-01-21 15:52:28', NULL),
(992, '7MOJYIGO', 'nhanvien1 đã thay đổi Trạng thái đơn hàng: Đã lên đơn -> Đang xử lý', '2024-01-21 15:52:32', NULL),
(993, '7MOJYIGO', 'nhanvien1 đã thay đổi Trạng thái đơn hàng: Đang xử lý -> Đã lên đơn', '2024-01-21 15:52:36', NULL),
(994, '7MOJYIGO', 'nhanvien1 đã thay đổi Trạng thái đơn hàng: Đã lên đơn -> Đang giao hàng', '2024-01-21 15:52:38', NULL),
(995, '7MOJYIGO', 'nhanvien1 đã thay đổi Trạng thái đơn hàng: Đang giao hàng -> Đã lên đơn', '2024-01-21 15:55:46', NULL),
(996, '7MOJYIGO', 'nhanvien1 đã thay đổi Trạng thái đơn hàng: Đã lên đơn -> Đang giao hàng', '2024-01-21 15:55:50', NULL),
(997, '7MOJYIGO', 'nhanvien1 đã thay đổi Trạng thái đơn hàng: Đang giao hàng -> Đã lên đơn', '2024-01-21 15:55:54', NULL),
(998, 'A5K1TOQE', 'quanly đã thay đổi Trạng thái đơn hàng: Đơn mới -> Đã lên đơn', '2024-01-21 16:02:24', NULL),
(999, 'A5K1TOQE', 'quanly đã thay đổi Trạng thái đơn hàng: Đã lên đơn -> Đang xử lý', '2024-01-21 16:02:32', NULL),
(1000, 'A5K1TOQE', 'quanly đã thay đổi Trạng thái đơn hàng: Đang xử lý -> Đã lên đơn', '2024-01-21 16:02:39', NULL),
(1001, 'A5K1TOQE', 'quanly đã thay đổi Trạng thái đơn hàng: Đã lên đơn -> Đang xử lý', '2024-01-21 16:02:42', NULL),
(1002, '7MOJYIGO', 'quanly đã thay đổi Trạng thái đơn hàng: Đã lên đơn -> Đơn mới', '2024-01-21 16:16:16', NULL),
(1003, '7MOJYIGO', 'quanly đã thay đổi Trạng thái đơn hàng: Đơn mới -> Hủy', '2024-01-21 16:16:22', NULL),
(1004, '7MOJYIGO', 'quanly đã thay đổi Trạng thái đơn hàng: Hủy -> Đang xử lý', '2024-01-21 16:16:37', NULL),
(1005, '7MOJYIGO', 'quanly đã thay đổi Trạng thái đơn hàng: Đang xử lý -> Đơn mới', '2024-01-21 16:16:42', NULL),
(1006, '7MOJYIGO', 'quanly đã thay đổi Trạng thái đơn hàng: Đơn mới -> Đã lên đơn', '2024-01-21 16:16:46', NULL),
(1007, 'AEAXIQS0', 'quanly đã thay đổi Trạng thái đơn hàng: Đơn mới -> Đã lên đơn', '2024-01-21 16:19:25', NULL),
(1008, 'GB4ENHC1', 'quanly đã thay đổi Trạng thái đơn hàng: Đơn mới -> Đã lên đơn', '2024-01-21 16:19:45', NULL),
(1009, 'I8XDEQJH', 'quanly đã thay đổi Trạng thái đơn hàng: Đơn mới -> Hủy', '2024-01-21 16:36:23', NULL),
(1010, 'I8XDEQJH', 'quanly đã thay đổi Trạng thái đơn hàng: Hủy -> Đơn mới', '2024-01-21 16:36:28', NULL),
(1011, 'I8XDEQJH', 'quanly đã thay đổi Trạng thái đơn hàng: Đơn mới -> Đang xử lý', '2024-01-21 16:36:57', NULL),
(1012, '5FTZ8G2K', 'quanly đã thay đổi Trạng thái đơn hàng: Hủy -> Đơn mới', '2024-01-22 03:54:48', NULL),
(1013, '5FTZ8G2K', 'quanly đã thay đổi Trạng thái đơn hàng: Đơn mới -> Đã lên đơn', '2024-01-22 04:07:18', NULL),
(1014, '5FTZ8G2K', 'quanly đã thay đổi Trạng thái đơn hàng: Đã lên đơn -> Đang xử lý', '2024-01-22 04:33:31', NULL),
(1015, 'MSFDUEXY', ' đã thay đổi Số lượng (ESTP01772CV32SB_BLE-S) :1 -> 2', '2024-01-22 05:29:08', NULL),
(1016, '5FTZ8G2K', ' đã thay đổi Số lượng (DSBI01302LI00SB_BE-31) :1 -> 2', '2024-01-22 06:38:38', NULL),
(1017, '5FTZ8G2K', 'quanly đã thay đổi Nguồn tạo đơn hàng: quanly -> nhanvien2', '2024-01-25 09:19:22', NULL),
(1018, 'MVNWRADX', 'quanly đã tạo đơn hàng: <br>Mã đơn: MVNWRADX,<br>Tên khách hàng: nhanvien1,<br>Số điện thoại: 365151822,<br>Địa chỉ: số 18 ngõ 222 tựu liệt,thanh trì, hà nội,<br>Ghi chú:                         ,<br>Nguồn:  nhanvien1', '2024-01-26 03:14:24', NULL),
(1019, 'MVNWRADX', 'quanly đã thay đổi Trạng thái đơn hàng: Đơn mới -> Đã lên đơn', '2024-01-26 03:14:37', NULL),
(1020, 'MVNWRADX', 'quanly đã thay đổi Trạng thái đơn hàng: Đã lên đơn -> Thành công', '2024-01-26 03:14:41', NULL),
(1021, 'T1VCKYYG', 'quanly đã tạo đơn hàng: <br>Mã đơn: T1VCKYYG,<br>Tên khách hàng: sser,<br>Số điện thoại: 44343,<br>Địa chỉ: f,<br>Ghi chú:                         dfs,<br>Nguồn:  nhanvien1', '2024-01-26 03:15:18', NULL),
(1022, 'T1VCKYYG', 'quanly đã thay đổi Ghi chú:                         dfs -> dfs', '2024-01-26 03:15:28', NULL),
(1023, 'T1VCKYYG', 'quanly đã thay đổi Trạng thái đơn hàng: Đơn mới -> Đã lên đơn', '2024-01-26 03:21:23', NULL),
(1024, 'T1VCKYYG', 'quanly đã thay đổi Trạng thái đơn hàng: Đã lên đơn -> Đang xử lý', '2024-01-26 03:23:08', NULL),
(1025, 'T1VCKYYG', 'quanly đã thay đổi Trạng thái đơn hàng: Đang xử lý -> Đã lên đơn', '2024-01-26 03:23:12', NULL),
(1026, 'DMJHRKWM', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: DMJHRKWM,<br>Tên khách hàng: nguyễn quang anh,<br>Số điện thoại: 3222232,<br>Địa chỉ: số 18 ngõ 222 tựu liệt,thanh trì, hà nội,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-29 07:06:41', NULL),
(1027, 'DMJHRKWM', 'Khách hàng đã thêm sản phẩm: DSTP90372CT32RB_WCB-S (giá = 290000)', '2024-01-29 07:06:42', NULL),
(1028, 'DMJHRKWM', 'Khách hàng đã thêm sản phẩm: DSTP90372CT32RB_WCB-M (giá = 290000)', '2024-01-29 07:06:42', NULL),
(1029, 'YK68ZX7R', 'quanly đã tạo đơn hàng: <br>Mã đơn: YK68ZX7R,<br>Tên khách hàng: nguyễn quang anh,<br>Số điện thoại: 3432224222,<br>Địa chỉ: số 18 ngõ 222 tựu liệt,thanh trì, hà nội,<br>Ghi chú: ,<br>Nguồn:  quanly', '2024-01-29 12:53:51', NULL),
(1030, 'YK68ZX7R', 'quanly đã thêm sản phẩm: DWCT00161PE00RB_NV-S (giá = 990000)', '2024-01-29 12:53:51', NULL),
(1031, 'TFWOAP9I', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: TFWOAP9I,<br>Tên khách hàng: nguyễn quang anh,<br>Số điện thoại: 4343222342,<br>Địa chỉ: số 18 ngõ 222 tựu liệt,thanh trì, hà nội,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-29 13:12:12', NULL),
(1032, 'TFWOAP9I', 'Khách hàng đã thêm sản phẩm: EABT01901PE00SB_BL-29 (giá = 500000)', '2024-01-29 13:12:12', NULL);
INSERT INTO `history` (`id`, `invoice_id`, `content`, `time`, `time_ago`) VALUES
(1033, 'QIPTDMTO', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: QIPTDMTO,<br>Tên khách hàng: nguyễn quang anh,<br>Số điện thoại: 5342423432,<br>Địa chỉ: số 18 ngõ 222 tựu liệt,thanh trì, hà nội,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-29 13:15:40', NULL),
(1034, 'QIPTDMTO', 'Khách hàng đã thêm sản phẩm: DWCT00161PE00RB_NV-S (giá = 990000)', '2024-01-29 13:15:40', NULL),
(1035, '6LU8CYHS', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: 6LU8CYHS,<br>Tên khách hàng: nguyễn quang anh,<br>Số điện thoại: 3651518221,<br>Địa chỉ: số 18 ngõ 222 tựu liệt,thanh trì, hà nội,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-29 13:18:05', NULL),
(1036, '6LU8CYHS', 'Khách hàng đã thêm sản phẩm: DWCT00161PE00RB_NV-S (giá = 990000)', '2024-01-29 13:18:05', NULL),
(1037, 'VAZZJUMT', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: VAZZJUMT,<br>Tên khách hàng: nguyễn quang anh,<br>Số điện thoại: 3651518222,<br>Địa chỉ: số 18 ngõ 222 tựu liệt,thanh trì, hà nội,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-29 13:22:28', NULL),
(1038, 'VAZZJUMT', 'Khách hàng đã thêm sản phẩm: DWCT00161PE00RB_NV-S (giá = 990000)', '2024-01-29 13:22:28', NULL),
(1039, '8XVO3RJ8', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: 8XVO3RJ8,<br>Tên khách hàng: nguyễn quang anh,<br>Số điện thoại: 4553333542,<br>Địa chỉ: số 18 ngõ 222 tựu liệt,thanh trì, hà nội,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-01-29 13:31:30', NULL),
(1040, '8XVO3RJ8', 'Khách hàng đã thêm sản phẩm: DWCT00161PE00RB_NV-S (giá = 990000)', '2024-01-29 13:31:30', NULL),
(1041, '6RNPNRVM', 'quanly đã tạo đơn hàng: <br>Mã đơn: 6RNPNRVM,<br>Tên khách hàng: nguyễn quang anh,<br>Số điện thoại: 5423324222,<br>Địa chỉ: số 18 ngõ 222 tựu liệt,thanh trì, hà nội,<br>Ghi chú: ,<br>Nguồn:  quanly', '2024-02-01 13:35:59', NULL),
(1042, '5FTZ8G2K', 'quanly đã thay đổi Số điện thoại: 365151822 -> 0365151822', '2024-02-02 02:26:04', NULL),
(1043, '5FTZ8G2K', 'quanly đã thay đổi Số điện thoại: 0365151822 -> 0365151823', '2024-02-02 03:15:12', NULL),
(1044, '5FTZ8G2K', 'quanly đã thay đổi Trạng thái đơn hàng: Đang xử lý -> Đã lên đơn', '2024-02-02 03:27:13', NULL),
(1045, '5FTZ8G2K', 'quanly đã thay đổi Trạng thái đơn hàng: Đã lên đơn -> Đang giao hàng', '2024-02-02 03:27:21', NULL),
(1046, '6LU8CYHS', 'quanly đã thêm sản phẩm: DSTP90372CT32RB_WCB-M (giá = 290000)', '2024-02-02 03:30:36', NULL),
(1047, '6LU8CYHS', 'quanly đã xóa sản phẩm: DSTP90372CT32RB_WCB-M (giá = 290000)', '2024-02-02 03:30:38', NULL),
(1048, 'BOXLJSBK', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: BOXLJSBK,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 12:24:54', NULL),
(1049, 'BOXLJSBK', 'Khách hàng đã thêm sản phẩm: EABT02101PE00SB_BL-29 (giá = 480000)', '2024-02-06 12:24:54', NULL),
(1050, 'WVHNNQAC', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: WVHNNQAC,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 13:28:02', NULL),
(1051, 'WVHNNQAC', 'Khách hàng đã thêm sản phẩm: EABT01901PE00SB_BL-29 (giá = 500000)', '2024-02-06 13:28:02', NULL),
(1052, 'OUFWELJT', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: OUFWELJT,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 13:38:23', NULL),
(1053, 'OUFWELJT', 'Khách hàng đã thêm sản phẩm: DWCT00161PE00RB_NV-S (giá = 990000)', '2024-02-06 13:38:23', NULL),
(1054, 'GQ9U9AXK', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: GQ9U9AXK,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 13:38:56', NULL),
(1055, 'GQ9U9AXK', 'Khách hàng đã thêm sản phẩm: ESTP06772TC00SB_BL-S (giá = 380000)', '2024-02-06 13:38:56', NULL),
(1056, 'GCRM2OC5', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: GCRM2OC5,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 13:46:00', NULL),
(1057, 'GCRM2OC5', 'Khách hàng đã thêm sản phẩm: ESBW00402PE01MB_BL-S (giá = 350000)', '2024-02-06 13:46:00', NULL),
(1058, 'ROSWZNSR', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: ROSWZNSR,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 13:47:21', NULL),
(1059, 'ROSWZNSR', 'Khách hàng đã thêm sản phẩm: ESTP06772TC00SB_BL-S (giá = 380000)', '2024-02-06 13:47:21', NULL),
(1060, 'JFFE99ZQ', 'quanly đã tạo đơn hàng: <br>Mã đơn: JFFE99ZQ,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  quanly', '2024-02-06 14:31:15', NULL),
(1061, 'JFFE99ZQ', 'quanly đã thêm sản phẩm: DWCT00431PE32SB_BL-S (giá = 750000)', '2024-02-06 14:31:16', NULL),
(1062, 'JFFE99ZQ', 'quanly đã thêm sản phẩm: EABT01901PE00SB_BL-29 (giá = 500000)', '2024-02-06 14:31:16', NULL),
(1063, '5RH2CLWH', 'quanly đã tạo đơn hàng: <br>Mã đơn: 5RH2CLWH,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  quanly', '2024-02-06 14:35:08', NULL),
(1064, '5RH2CLWH', 'quanly đã thêm sản phẩm: DWCT00161PE00RB_NV-S (giá = 990000)', '2024-02-06 14:35:08', NULL),
(1065, 'YZSGNG1E', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: YZSGNG1E,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 14:54:16', NULL),
(1066, 'YZSGNG1E', 'Khách hàng đã thêm sản phẩm: DWCU00761PE32SB_LLG-S (giá = 750000)', '2024-02-06 14:54:16', NULL),
(1067, '41ZSPBHA', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: 41ZSPBHA,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 15:18:36', NULL),
(1068, '41ZSPBHA', 'Khách hàng đã thêm sản phẩm: DWCT00161PE00RB_NV-M (giá = 990000)', '2024-02-06 15:18:37', NULL),
(1069, 'SGVWGKLQ', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: SGVWGKLQ,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 15:22:22', NULL),
(1070, 'SGVWGKLQ', 'Khách hàng đã thêm sản phẩm: DWCT00161PE00RB_NV-S (giá = 990000)', '2024-02-06 15:22:22', NULL),
(1071, 'CK2RNNXU', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: CK2RNNXU,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 15:22:36', NULL),
(1072, 'CK2RNNXU', 'Khách hàng đã thêm sản phẩm: DWCT00161PE00RB_NV-S (giá = 990000)', '2024-02-06 15:22:36', NULL),
(1073, 'EAEUPXUE', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: EAEUPXUE,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 15:23:40', NULL),
(1074, 'EAEUPXUE', 'Khách hàng đã thêm sản phẩm: DWCT00161PE00RB_NV-S (giá = 990000)', '2024-02-06 15:23:40', NULL),
(1075, 'EXAWZYY2', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: EXAWZYY2,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 15:41:14', NULL),
(1076, 'EXAWZYY2', 'Khách hàng đã thêm sản phẩm: DWCT00161PE00RB_NV-S (giá = 990000)', '2024-02-06 15:41:14', NULL),
(1077, 'JDIVW1PL', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: JDIVW1PL,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 16:09:55', NULL),
(1078, 'JDIVW1PL', 'Khách hàng đã thêm sản phẩm: ESTP04772CA00SB_BL-S (giá = 500000)', '2024-02-06 16:09:55', NULL),
(1079, 'CYFRIM6O', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: CYFRIM6O,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 16:14:22', NULL),
(1080, 'CYFRIM6O', 'Khách hàng đã thêm sản phẩm: ESTP00572CT00SB_DNV-S (giá = 420000)', '2024-02-06 16:14:22', NULL),
(1081, 'IS8THSPA', 'quanly đã tạo đơn hàng: <br>Mã đơn: IS8THSPA,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  quanly', '2024-02-06 16:21:26', NULL),
(1082, 'IS8THSPA', 'quanly đã thêm sản phẩm: EWCW00751PE00SB_BL-S (giá = 50000)', '2024-02-06 16:21:26', NULL),
(1083, '5RH2CLWH', ' đã thay đổi Số lượng (DWCT00161PE00RB_NV-S) :1 -> 2', '2024-02-06 17:03:25', NULL),
(1084, '5RH2CLWH', ' đã thay đổi Số lượng (DWCT00161PE00RB_NV-S) :2 -> 1', '2024-02-06 17:03:28', NULL),
(1085, '5RH2CLWH', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_BE-32 (giá = 380000)', '2024-02-06 17:03:33', NULL),
(1086, '5RH2CLWH', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_BE-32 (giá = 380000)', '2024-02-06 17:03:36', NULL),
(1088, 'NV7CM7AY', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: NV7CM7AY,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 17:11:23', NULL),
(1089, 'NV7CM7AY', 'Khách hàng đã thêm sản phẩm: DWCT00431PE32SB_BL-S (giá = 750000)', '2024-02-06 17:11:23', NULL),
(1090, '5J8RUFRZ', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: 5J8RUFRZ,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 17:11:44', NULL),
(1091, '5J8RUFRZ', 'Khách hàng đã thêm sản phẩm: EWCL00361PE00RB_CR-S (giá = 890000)', '2024-02-06 17:11:44', NULL),
(1092, 'U0F7TYG1', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: U0F7TYG1,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 17:12:03', NULL),
(1093, 'U0F7TYG1', 'Khách hàng đã thêm sản phẩm: EWCL00361PE00RB_CR-S (giá = 890000)', '2024-02-06 17:12:03', NULL),
(1094, 'TGPIGVXB', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: TGPIGVXB,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 17:16:29', NULL),
(1095, 'TGPIGVXB', 'Khách hàng đã thêm sản phẩm: DWCT00161PE00RB_NV-S (giá = 990000)', '2024-02-06 17:16:29', NULL),
(1096, 'S9BQOPOP', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: S9BQOPOP,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 17:26:23', NULL),
(1097, 'S9BQOPOP', 'Khách hàng đã thêm sản phẩm: DWCU00761PE32SB_LLG-S (giá = 750000)', '2024-02-06 17:26:23', NULL),
(1098, 'XNLM5KBW', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: XNLM5KBW,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 17:26:42', NULL),
(1099, 'XNLM5KBW', 'Khách hàng đã thêm sản phẩm: DWCU00761PE32SB_LLG-S (giá = 750000)', '2024-02-06 17:26:43', NULL),
(1100, '4LFFMS9V', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: 4LFFMS9V,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 17:31:56', NULL),
(1101, '4LFFMS9V', 'Khách hàng đã thêm sản phẩm: EWCW00751PE00SB_BL-S (giá = 50000)', '2024-02-06 17:31:56', NULL),
(1102, 'YIFBIIM3', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: YIFBIIM3,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 17:32:38', NULL),
(1103, 'YIFBIIM3', 'Khách hàng đã thêm sản phẩm: DWCT00161PE00RB_NV-S (giá = 990000)', '2024-02-06 17:32:38', NULL),
(1104, 'SRXO1SSG', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: SRXO1SSG,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 17:33:37', NULL),
(1105, 'SRXO1SSG', 'Khách hàng đã thêm sản phẩm: EWBS00103TC00RB_BL-S (giá = 400000)', '2024-02-06 17:33:37', NULL),
(1106, 'B90AZKP8', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: B90AZKP8,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 17:35:18', NULL),
(1107, 'B90AZKP8', 'Khách hàng đã thêm sản phẩm: DWCU00761PE32SB_LLG-S (giá = 750000)', '2024-02-06 17:35:18', NULL),
(1108, '56BKIMXY', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: 56BKIMXY,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 17:36:03', NULL),
(1109, '56BKIMXY', 'Khách hàng đã thêm sản phẩm: DWCT00161PE00RB_NV-S (giá = 990000)', '2024-02-06 17:36:03', NULL),
(1110, 'LUW8V8TY', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: LUW8V8TY,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 17:36:40', NULL),
(1111, 'LUW8V8TY', 'Khách hàng đã thêm sản phẩm: DWCU00761PE32SB_LLG-S (giá = 750000)', '2024-02-06 17:36:40', NULL),
(1112, 'UAGHYL6A', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: UAGHYL6A,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 17:44:28', NULL),
(1113, 'UAGHYL6A', 'Khách hàng đã thêm sản phẩm: DWCU00761PE32SB_LLG-S (giá = 750000)', '2024-02-06 17:44:28', NULL),
(1114, 'KYGSBUBG', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: KYGSBUBG,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 17:49:38', NULL),
(1115, 'KYGSBUBG', 'Khách hàng đã thêm sản phẩm: EABT01901PE00SB_BL-29 (giá = 500000)', '2024-02-06 17:49:38', NULL),
(1116, 'EIIMQTNF', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: EIIMQTNF,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 17:53:16', NULL),
(1117, 'EIIMQTNF', 'Khách hàng đã thêm sản phẩm: EWBS00103TC00RB_BL-S (giá = 400000)', '2024-02-06 17:53:16', NULL),
(1118, 'N6VKCD4X', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: N6VKCD4X,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 17:54:59', NULL),
(1119, 'N6VKCD4X', 'Khách hàng đã thêm sản phẩm: DWCT00431PE32SB_BL-S (giá = 750000)', '2024-02-06 17:54:59', NULL),
(1120, 'QUZEPN5K', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: QUZEPN5K,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 17:57:08', NULL),
(1121, 'QUZEPN5K', 'Khách hàng đã thêm sản phẩm: DWCU00761PE32SB_LLG-S (giá = 750000)', '2024-02-06 17:57:08', NULL),
(1122, 'VWQKIORR', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: VWQKIORR,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 18:01:00', NULL),
(1123, 'VWQKIORR', 'Khách hàng đã thêm sản phẩm: DWCU00761PE32SB_LLG-S (giá = 750000)', '2024-02-06 18:01:00', NULL),
(1124, 'YTNKBIKE', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: YTNKBIKE,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 18:02:44', NULL),
(1125, 'CQK0DVXD', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: CQK0DVXD,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 18:02:44', NULL),
(1126, 'CQK0DVXD', 'Khách hàng đã thêm sản phẩm: DWCT00161PE00RB_NV-S (giá = 990000)', '2024-02-06 18:02:44', NULL),
(1127, 'YTNKBIKE', 'Khách hàng đã thêm sản phẩm: DWCT00161PE00RB_NV-S (giá = 990000)', '2024-02-06 18:02:44', NULL),
(1128, 'CK0I8M9L', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: CK0I8M9L,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 18:04:16', NULL),
(1129, 'CK0I8M9L', 'Khách hàng đã thêm sản phẩm: DWCU00761PE32SB_LLG-S (giá = 750000)', '2024-02-06 18:04:16', NULL),
(1130, 'CDJBJ419', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: CDJBJ419,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 18:08:30', NULL),
(1131, 'CDJBJ419', 'Khách hàng đã thêm sản phẩm: DWCT00431PE32SB_BL-S (giá = 750000)', '2024-02-06 18:08:30', NULL),
(1132, '98ZCL96V', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: 98ZCL96V,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 18:10:24', NULL),
(1133, '98ZCL96V', 'Khách hàng đã thêm sản phẩm: DWCT00431PE32SB_BL-S (giá = 750000)', '2024-02-06 18:10:24', NULL),
(1134, 'PPKY3TZA', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: PPKY3TZA,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 18:11:02', NULL),
(1135, 'PPKY3TZA', 'Khách hàng đã thêm sản phẩm: DWCT00161PE00RB_NV-S (giá = 990000)', '2024-02-06 18:11:02', NULL),
(1136, '7MOJYIGO', 'quanly đã thay đổi Trạng thái đơn hàng: Hủy -> Đơn mới', '2024-02-06 18:25:48', NULL),
(1137, 'YFJBR6YE', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: YFJBR6YE,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 18:52:13', NULL),
(1138, 'YFJBR6YE', 'Khách hàng đã thêm sản phẩm: DSTP61172CX00SB_WH-S (giá = 333333)', '2024-02-06 18:52:13', NULL),
(1139, 'GWW0LOZ8', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: GWW0LOZ8,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-06 18:52:29', NULL),
(1140, 'GWW0LOZ8', 'Khách hàng đã thêm sản phẩm: DWCT00431PE32SB_BL-S (giá = 750000)', '2024-02-06 18:52:29', NULL),
(1141, '5RH2CLWH', 'quanly đã thêm sản phẩm: DABJ00401CT00SB_NV-29 (giá = 550000)', '2024-02-07 09:07:28', NULL),
(1142, '41ZSPBHA', 'quanly đã thêm sản phẩm: ESTP07472CT00SB_WH-M (giá = 420000)', '2024-02-07 12:13:48', NULL),
(1143, 'WDVTINII', 'quanly đã tạo đơn hàng: <br>Mã đơn: WDVTINII,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  quanly', '2024-02-08 15:37:52', NULL),
(1144, 'WDVTINII', 'quanly đã thêm sản phẩm: DWCT00431PE32SB_BL-S (giá = 750000)', '2024-02-08 15:37:52', NULL),
(1145, 'WDVTINII', 'quanly đã thêm sản phẩm: EABT01901PE00SB_BL-29 (giá = 500000)', '2024-02-08 15:37:52', NULL),
(1146, 'SNGWGR4V', 'quanly đã tạo đơn hàng: <br>Mã đơn: SNGWGR4V,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  quanly', '2024-02-08 15:38:43', NULL),
(1147, 'SNGWGR4V', 'quanly đã thêm sản phẩm: DWCT00431PE32SB_BL-S (giá = 750000)', '2024-02-08 15:38:43', NULL),
(1148, 'U7DZUREO', 'quanly đã tạo đơn hàng: <br>Mã đơn: U7DZUREO,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  quanly', '2024-02-08 15:39:21', NULL),
(1149, 'U7DZUREO', 'quanly đã thêm sản phẩm: EABT01901PE00SB_BL-29 (giá = 500000)', '2024-02-08 15:39:21', NULL),
(1150, 'GGTWEEBJ', 'Khách hàng đã tạo đơn hàng: <br>Mã đơn: GGTWEEBJ,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  Hệ thống', '2024-02-12 18:45:34', NULL),
(1151, 'GGTWEEBJ', 'Khách hàng đã thêm sản phẩm: ESTP03872PE00SB_BL-XL (giá = 200000)', '2024-02-12 18:45:34', NULL),
(1152, '41ZSPBHA', 'quanly đã thêm sản phẩm: DATB61471BA00SB_LLB-41 (giá = 450000)', '2024-02-13 13:06:22', NULL),
(1154, 'MDXPM23G', 'quanly đã tạo đơn hàng: <br>Mã đơn: MDXPM23G,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: cvs,<br>Nguồn:  quanly', '2024-02-18 09:30:25', NULL),
(1155, 'MDXPM23G', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_WH-32 (giá = 380000)', '2024-02-18 09:30:37', NULL),
(1156, 'MDXPM23G', ' đã thay đổi Số lượng (DSBI01302LI00SB_WH-32) :1 -> 2', '2024-02-18 09:32:37', NULL),
(1157, '5CKTNJXP', 'khachhang đã tạo đơn hàng: <br>Mã đơn: 5CKTNJXP,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 0365151822,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  khachhang', '2024-02-18 09:34:21', NULL),
(1158, '5CKTNJXP', 'khachhang đã thêm sản phẩm: DWCT00161PE00RB_DGR-M (giá = 990000)', '2024-02-18 09:34:21', NULL),
(1159, 'V2PBUUIU', 'quanly đã tạo đơn hàng: <br>Mã đơn: V2PBUUIU,<br>Tên khách hàng: quang anh,<br>Số điện thoại: 2313121312,<br>Địa chỉ: 4dvsdsf,<br>Ghi chú: ,<br>Nguồn:  quanly', '2024-02-18 09:37:15', NULL),
(1160, 'V2PBUUIU', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_WH-33 (giá = 380000)', '2024-02-18 09:37:20', NULL),
(1161, 'V2PBUUIU', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_WH-33 (giá = 380000)', '2024-02-18 09:37:22', NULL),
(1162, '5CKTNJXP', 'quanly đã thay đổi Nguồn tạo đơn hàng: khachhang -> quanly', '2024-02-18 11:01:34', NULL),
(1163, '41ZSPBHA', ' đã thay đổi Số lượng (DATB61471BA00SB_LLB-41) :1 -> 2', '2024-02-25 11:35:18', NULL),
(1164, '41ZSPBHA', 'quanly đã xóa sản phẩm: DATB61471BA00SB_LLB-41 (giá = 450000)', '2024-02-25 11:35:27', NULL),
(1165, '41ZSPBHA', 'quanly đã thêm sản phẩm: DSBI01302LI00SB_WH-33 (giá = 380000)', '2024-02-25 11:41:32', NULL),
(1166, '41ZSPBHA', 'quanly đã thay đổi Phí ship: 0 -> 10000', '2024-02-25 11:48:18', NULL),
(1167, '41ZSPBHA', 'quanly đã xóa sản phẩm: DSBI01302LI00SB_WH-33 (giá = 380000)', '2024-02-25 11:48:42', NULL),
(1168, '41ZSPBHA', 'quanly đã thay đổi Phí ship: 10000 -> 0', '2024-02-25 11:51:05', NULL),
(1169, '41ZSPBHA', 'quanly đã thay đổi Phí ship: 0 -> 10000', '2024-02-25 11:54:49', NULL),
(1170, '41ZSPBHA', 'quanly đã thay đổi Phí ship: 10000 -> 0', '2024-02-25 11:54:54', NULL),
(1171, '41ZSPBHA', ' đã thay đổi Số lượng (DWCT00161PE00RB_NV-M) :1 -> 2', '2024-02-25 11:56:51', NULL),
(1172, '41ZSPBHA', ' đã thay đổi Số lượng (ESTP07472CT00SB_WH-M) :1 -> 2', '2024-02-25 11:57:55', NULL),
(1173, '41ZSPBHA', 'quanly đã thay đổi Phí ship: 0 -> 10000', '2024-02-25 12:08:03', NULL),
(1174, '41ZSPBHA', 'quanly đã thay đổi Phí ship: 10000 -> 0', '2024-02-25 12:08:24', NULL),
(1175, '41ZSPBHA', 'quanly đã thay đổi Phí ship: 0 -> 10000', '2024-02-25 12:08:35', NULL),
(1176, '41ZSPBHA', ' đã thay đổi Số lượng (ESTP07472CT00SB_WH-M) :2 -> 1', '2024-02-25 12:08:58', NULL),
(1177, '41ZSPBHA', ' đã thay đổi Số lượng (ESTP07472CT00SB_WH-M) :1 -> 2', '2024-02-25 12:09:46', NULL),
(1178, '41ZSPBHA', 'quanly đã thay đổi Phí ship: 10000 -> 0', '2024-02-25 12:10:12', NULL),
(1179, '41ZSPBHA', ' đã thay đổi Số lượng (ESTP07472CT00SB_WH-M) :2 -> 1', '2024-02-25 12:10:14', NULL),
(1180, '41ZSPBHA', 'quanly đã thay đổi Phí ship: 0 -> 10000', '2024-02-25 12:10:23', NULL),
(1181, '41ZSPBHA', ' đã thay đổi Số lượng (ESTP07472CT00SB_WH-M) :1 -> 2', '2024-02-25 12:10:27', NULL),
(1182, '41ZSPBHA', ' đã thay đổi Số lượng (ESTP07472CT00SB_WH-M) :2 -> 1', '2024-02-25 12:11:24', NULL),
(1183, '41ZSPBHA', ' đã thay đổi Số lượng (ESTP07472CT00SB_WH-M) :1 -> 2', '2024-02-25 12:11:31', NULL),
(1184, '41ZSPBHA', 'quanly đã thay đổi Phí ship: 10000 -> 0', '2024-02-25 12:11:38', NULL),
(1185, '41ZSPBHA', 'quanly đã thay đổi Phí ship: 0 -> 10000', '2024-02-25 12:13:04', NULL),
(1186, '41ZSPBHA', 'quanly đã thay đổi Phí ship: 10000 -> 11', '2024-02-25 12:15:52', NULL),
(1187, '41ZSPBHA', ' đã thay đổi Số lượng (ESTP07472CT00SB_WH-M) :2 -> 1', '2024-02-25 12:16:01', NULL),
(1188, '41ZSPBHA', ' đã thay đổi Số lượng (ESTP07472CT00SB_WH-M) :1 -> 2', '2024-02-25 12:16:08', NULL),
(1189, '41ZSPBHA', ' đã thay đổi Số lượng (ESTP07472CT00SB_WH-M) :2 -> 1', '2024-02-25 12:17:09', NULL),
(1190, '41ZSPBHA', ' đã thay đổi Số lượng (ESTP07472CT00SB_WH-M) :1 -> 2', '2024-02-25 12:17:12', NULL),
(1191, '41ZSPBHA', ' đã thay đổi Số lượng (ESTP07472CT00SB_WH-M) :2 -> 3', '2024-02-25 12:17:24', NULL),
(1192, '41ZSPBHA', ' đã thay đổi Số lượng (ESTP07472CT00SB_WH-M) :3 -> 1', '2024-02-25 12:18:25', NULL),
(1193, '41ZSPBHA', ' đã thay đổi Số lượng (ESTP07472CT00SB_WH-M) :1 -> 2', '2024-02-25 12:18:28', NULL),
(1194, '41ZSPBHA', ' đã thay đổi Số lượng (DWCT00161PE00RB_NV-M) :2 -> 1', '2024-02-25 12:18:30', NULL),
(1195, '41ZSPBHA', 'quanly đã thay đổi Phí ship: 11 -> 10000', '2024-02-25 12:18:34', NULL),
(1196, '41ZSPBHA', ' đã thay đổi Số lượng (ESTP07472CT00SB_WH-M) :2 -> 5', '2024-02-25 12:19:29', NULL),
(1197, '41ZSPBHA', 'quanly đã thay đổi Phí ship: 10000 -> 0', '2024-02-25 12:20:45', NULL),
(1198, '41ZSPBHA', 'quanly đã thay đổi Phí ship: 0 -> 10000', '2024-02-25 12:21:37', NULL),
(1199, '41ZSPBHA', 'quanly đã thay đổi Phí ship: 10000 -> 0', '2024-02-25 12:22:03', NULL),
(1200, '41ZSPBHA', 'quanly đã thay đổi Phí ship: 0 -> 10000', '2024-02-25 12:22:44', NULL),
(1201, '41ZSPBHA', 'quanly đã thay đổi Phí ship: 10000 -> 12000', '2024-02-25 12:23:42', NULL),
(1202, '41ZSPBHA', 'quanly đã thay đổi Phí ship: 12000 -> 0', '2024-02-25 12:27:59', NULL),
(1203, '41ZSPBHA', ' đã thay đổi Số lượng (ESTP07472CT00SB_WH-M) :5 -> 1', '2024-02-25 12:28:21', NULL),
(1204, '41ZSPBHA', 'quanly đã thay đổi Phí ship: 0 -> 10000', '2024-02-25 12:29:11', NULL),
(1205, '41ZSPBHA', 'quanly đã thay đổi Phí ship: 10000 -> 0', '2024-02-25 12:30:37', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `imgs_product`
--

CREATE TABLE `imgs_product` (
  `img_id` int(11) NOT NULL,
  `product_id` varchar(15) DEFAULT NULL,
  `file_img` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `imgs_product`
--

INSERT INTO `imgs_product` (`img_id`, `product_id`, `file_img`) VALUES
(3, 'ESTP038', 'tp038-1.jpeg'),
(4, 'ESTP038', 'tp038.jpeg'),
(5, 'ESTP038', 'tp038-41.jpeg'),
(6, 'ESTP038', 'tp038-42.jpeg'),
(7, 'ESTP038', 'tp038-43.jpeg'),
(8, 'ESTP038', 'tp038-44.jpeg'),
(9, 'ESTP038', 'tp038-45.jpeg'),
(10, 'ESTP067', 'tp067---bk004-_16__bc6a55b32ddb4d94bc5c0fa5a7997db4_master.jpg'),
(11, 'ESTP067', 'tp067---bk004-_13__eb790ac8d5dd44618429783c9ed42844_master.jpg'),
(12, 'ESTP067', '52867073164_c93edc6a70_k_9447f869422f4aa793f65556da2f944c_master.jpg'),
(13, 'ESTP067', '52866332867_b3e9385404_k_e7aa9db13469468e86586673d414a1f3_master.jpg'),
(14, 'ESTP067', '52867351953_9e3e03f2b1_k_096de1bcfee34099969d0edd7b8e6f26_master.jpg'),
(15, 'ESTP067', '52866332727_2f58586473_k_7ac15a1978a04a37a6713af0bab43b09_master.jpg'),
(16, 'ESTP067', '52867351793_7fdd444ee2_k_4c9345e571394a009fa0e3e68e76a451_master.jpg'),
(17, 'ESTP067', '52867351808_e5a4600839_k_f877288ddfab4de6b74713bccd8dc336_master.jpg'),
(18, 'ESTP067', '52866332657_414108a7c6_k_b4b4ef2544e94d1c9e65de3dc7f57209_master.jpg'),
(19, 'ESTP067', '52867351903_e8df6368ea_k_93703527ed854f82a3c46db0c674704c_master.jpg'),
(20, 'ESTP067', '52867351913_203d16cda4_k_d6e60d7f209d4832b26a4e9044b8af9e_master.jpg'),
(21, 'ESTP067', '52867351923_7cae731772_k_c20306b870404071b12dad2f38d0d093_master.jpg'),
(22, 'ESTP028', 'tp028---bk004-_11__9246a1d8b0184518abd852704bd4fa02_master.jpg'),
(28, 'ESTP067', '4_8fb2c95d0ce84becbb58fd9ed237ba08_master.jpg'),
(29, 'ESTP067', '6_6839924c418d47e183d08e255b8c3c63_master.jpg'),
(30, 'ESTP067', '52789526191_861fe9d52b_o_21ebcee1355d4c3dad77e7d3c1ff0d4c_master.jpg'),
(31, 'DSTP611', 'tp611_59ea616328234a9b969ce2d1c48c482f_master.jpg'),
(32, 'DSTP611', 'tp611-1_e64e507a26034c7cab4000647d260ede_master.jpg'),
(33, 'DSTP611', '1_1e206b362a714f3d98754a060ce09454_master.jpg'),
(34, 'DSTP611', '3_4dd89c6d76d54a4d96db9ec8d1ab1e93_master.jpg'),
(41, 'ESTP010', 'tp010---bk603-_8__b6487398009b4c6eaa1950ee0f26e718_master.jpg'),
(42, 'ESTP010', 'tp010---bk603-_18__182eb99ee71a46a381827867ad2a96de_master.jpg'),
(43, 'ESTP010', '52769491109_e6fb49f9f0_o_32455b99bcaf4082aa9cd70b23af5f9e_master.jpg'),
(44, 'ESTP010', '52769491159_ba17744c21_o_9ef26ec3123b4c97aab4ab0e25cba4d5_master.jpg'),
(45, 'ESTP010', '52769491004_ecb5666549_o_219d2b308f9e43a6a1afbbb5fe2bd5b9_master.jpg'),
(46, 'ESTP010', '52769490734_e7c5ff8fef_o_e395740c9186424989fac889b1c7d4f7_master.jpg'),
(47, 'ESTP032', 'estp032-3_f94042405af64ca581ca72c753b53b51_master.jpg'),
(48, 'ESTP032', 'estp032-3_5833a48d93d041fab7b4a56668a78262_master.jpg'),
(49, 'ESTP032', 'estp032-1_86750080b9b3454bb7b35f79c996f898_master.jpg'),
(50, 'ESTP032', 'estp032-2_c5486330b45845dd9e4e9dd652d9fe51_master.jpg'),
(51, 'ESTP032', 'estp032-3_52866931581_o_696a4be7241646908451a50a1ab3ec7c_master.jpg'),
(52, 'ESTP032', 'estp032-4_52866931551_o_a66d94b2046f471d8bfb1bf8342400c9_master.jpg'),
(53, 'ESTP032', 'estp032-5_52867320575_o_3c67b3a8e6f74535aa323e0926391185_master.jpg'),
(54, 'ESTP032', 'estp032-11_52866355737_o_a52dd32e7b96416ab120276b6d4403e4_master.jpg'),
(55, 'ESTP032', '1_50f16dbd5df34aa3acc99865b4820084_master.jpg'),
(56, 'ESTP032', '2_5933a603e4074662bfe7cc6b5fe1e44b_master.jpg'),
(57, 'ESTP032', '3_e2f6d02236ac4e0397a15b372c85bfb2_master.jpg'),
(58, 'ESTP032', '4_aaa0fd53411a441e85605a458aab67f7_master.jpg'),
(59, 'ESTP032', '5_5bf4a94b5b19485199441c580dae0f6a_master.jpg.jpg'),
(60, 'ESTP032', '6_9622c2cf1ffe49dd9d06ac5ca4d10119_master.jpg.jpg'),
(61, 'ESTP032', '7_e37142ddf18d4daa898aac91aa82eb92_master.jpg.jpg'),
(62, 'ESTP005', 'tp005_52e371ed726e4f2d8401d86c5e0b38fb_master.jpg'),
(63, 'ESTP005', 'tp005-1_540fc6869412410498fde0786b1e4ae5_master.jpg'),
(64, 'ESTP005', '52826115451_f0f0e4aba3_o_1e2aaae876504b3781a5bf9eaa3e8649_master.jpg'),
(65, 'ESTP005', 'estp005_52832929942_o_1fa1849607d14981bf7a289fa35bca7e_master.jpg'),
(66, 'ESTP005', 'estp005_52832930232_o_c2dc6fe645224bbdace38aee17ba4ebc_master.jpg'),
(67, 'ESTP005', 'estp005_52833497146_o_19f6e6d8b44947d4bcd7461012e1e40d_master.jpg'),
(68, 'ESTP041', 'estp041-16_4cb9d42d84e7436884bd3f4e648621ed_master.jpg'),
(69, 'ESTP041', 'estp041-12_f4f5deac05fa47789c5897ba7a06818f_master.jpg'),
(70, 'ESTP041', 'estp041-11_5cc08ee5a7f94d739d935b090e8657ce_master.jpg'),
(71, 'ESTP041', 'estp041-15_0af52441e90e49aebae6f5874f100c2d_master.jpg'),
(72, 'ESTP041', 'estp041-13_052acb199d294321a1158807cea0d5b4_master.jpg'),
(73, 'ESTP041', 'estp041-14_c216ec36194c4f7da5d099aff22b8316_master.jpg'),
(74, 'ESTP041', 'estp041-6_3141cb9f439d4fb0b02a8d09f2d0e836_master.jpg'),
(75, 'ESTP041', 'estp041-3_83014782b53841358a80703e3de20b49_master.jpg'),
(76, 'ESTP041', 'estp041-7_38c774c7c3f74bfa852ec9fb4923a3de_master.jpg'),
(77, 'ESTP041', 'estp041-9_b544581a872a4d32bb9c8c4ed240c6dd_master.jpg'),
(78, 'ESTP041', 'estp041-8_316b7cd7e97744ac925f985863972761_master.jpg'),
(79, 'ESTP041', 'estp041-1_6a52d5fd1f594e2b9acee2d830b78b58_master.jpg'),
(80, 'ESTP041', 'estp041-2_0fe28f88db44491aa3f4e7ce0daf884e_master.jpg'),
(81, 'ESTP041', 'estp041-4_0f2a7f2b52d645dab95a9cdd5fdee0f3_master.jpg'),
(82, 'ESTP041', 'estp041-5_2d4ac01b779044a4ba9e1e3343e328f9_master.jpg'),
(83, 'ESTP042', 'tp042---bk004-_9__2efe604ac9324e06841cf8edc590e169_master.jpg'),
(84, 'ESTP042', 'tp042---bk004-_12__0fc56a3426f74ac79d1f10f9ab0b2fde_master.jpg'),
(85, 'ESTP042', 'estp042-br-4_52866363897_o_4cea7101361d4aeda23916a73776bc89_master.jpg'),
(86, 'ESTP042', 'estp042-br-5_52866363922_o_3b22baf5d6c540749f0eae1b143090b6_master.jpg'),
(87, 'ESTP042', 'estp042-br-1_52867103974_o_cfe354dcf6f54ba0b8a85cd45a0948a7_master.jpg'),
(88, 'ESTP042', 'estp042-br-2_52867382413_o_baf78a07a1e84447a3f01c49f2a55146_master.jpg'),
(89, 'ESTP042', 'estp042-br-3_52867103924_o_82a3a7e6860f480e91b11f3a5e7e18ed_master.jpg'),
(90, 'ESTP042', 'estp042-1_52867104114_o_aff74874616b45889ded6a949e0a1eb9_master.jpg'),
(91, 'ESTP042', 'estp042-bl-2_52867328655_o_55af013d6db2478fb8002da234a249d3_master.jpg'),
(92, 'ESTP042', 'estp042-cr-2_52867383288_o_cfa01925fc274a748e611e45bc874487_master.jpg'),
(93, 'ESTP042', 'estp042-dtu-2_52867383188_o_19e01fc82fca404e9629f3eff9993e76_master.jpg'),
(94, 'ESTP042', 'estp042-li-4_52866364592_o_4a615385ee834290ba6df68a2ed69311_master.jpg'),
(95, 'ESTP042', 'estp042-lyl-2_52867329090_o_51fd4f8cbbbf49f7890af4a9829581fb_master.jpg'),
(96, 'ESTP042', 'estp042-nv-3_52867104354_o_0580916685074dcdafdd251732674e2a_master.jpg'),
(97, 'ESTP042', 'estp042-tu-2_52866939911_o_96bd77d6c720444f86e520f606c880be_master.jpg'),
(98, 'ESTP042', 'estp042-wh-2_52867104164_o_0190b878eb0240c7bdc957655d380cbf_master.jpg'),
(99, 'ESTP033', 'm1t1_9a04e0331596472281861b7f44cc3ca2_master.jpg'),
(100, 'ESTP033', '2_9f21c1bc2bb4483aa055ffb7356ecf2b_master.jpg'),
(101, 'ESTP033', '3_13e212d45d7d4bf0969316de7ea60043_master.jpg'),
(102, 'ESTP033', '4_f4b074268aae494a83ba8ae43ff8ab3d_master.jpg'),
(103, 'ESTP033', '5_b213c588677e4d9bb736c832971db86b_master.jpg'),
(114, 'ESTP001', 'estp001-2_ca463de5f50243ff920007e6314ac0eb_master.jpg'),
(115, 'ESTP001', 'estp001-3_af8e67d349a34ea2857b8f923538bfba_master.jpg'),
(116, 'ESTP001', 'estp001-1_e79f5d2eed6b4d15be9136100b48c52e_master.jpg'),
(117, 'ESTP001', '2_03d7f4c5170c475ab303f4a1a35f7772_master.jpg'),
(118, 'ESTP001', '3_d899896ff01a4adeb430b83c94dc2483_master.jpg'),
(119, 'ESTP001', '4_fe228fc01afa43a082ef4bda0d636e20_master.jpg'),
(120, 'ESTP001', '7_9bc29d0a14064c70aca802cc201f2750_master.jpg'),
(121, 'ESTP060', '3_a6cdb2c46dd543fd9507418aef06c558_master.jpg'),
(122, 'ESTP060', '2_d527cf7f226e40c9bdf647d7cfcdb73d_master.jpg'),
(123, 'ESTP060', '52951329992_50ac43f695_o_0d0d415fa295462dbb496e1cda501bad_master.jpg'),
(124, 'ESTP060', 'estp060-1_eb469e85967d44e3a36e4dc8ca9ae0ea_master.jpg'),
(125, 'ESTP060', 'estp060-4_3fbb20aa4c1b4ff1b054225ad070a6f9_master.jpg'),
(126, 'ESTP060', 'estp060-2_322d5e5eab9a4de399752a3783025240_master.jpg'),
(127, 'ESTP060', 'estp060-3_326826ec287a49b58f66324c764a15fe_master.jpg'),
(142, 'ESTP007', 'estp007-1_9cd4cd6e34ac4041bb7e96da2d1eeb22_master.jpg'),
(143, 'ESTP007', 'tp007---bj901-_19__77bda55d7cb8490981e89a43f2accbb2_master.jpg'),
(144, 'ESTP007', '52898691552_37ea5079d3_o_ebb2277a32594cc7b1e9e4a218be9e8b_master.jpg'),
(145, 'ESTP007', '52898691577_03b1414605_o_b27a16af3124429d86bf5da8f0cf0a0c_master.jpg'),
(146, 'ESTP007', '52899265456_b212798cac_o_9aef58b065eb48c38e1c8ec115b234d9_master.jpg'),
(147, 'ESTP007', '52899713483_5b59788a82_o_46b4209167da44989fbc7a67d156289c_master.jpg'),
(148, 'ESTP007', '52899660480_41c01903c4_o_5bd3da357e264f1891e47d54d5d3b4ef_master.jpg'),
(149, 'ESTP007', '52898691562_67c82c3ca7_o_9da334afa0244604bf21a0d59cf2a7f2_master.jpg'),
(150, 'ESTP020', 'tp020---bk001-_10__b44a6900b6934440ad797f313b2cdd9a_master.jpg'),
(151, 'ESTP020', 'tp020---bk001-_19__39c7901d719942a790b6cf8a9584383a_master.jpg'),
(152, 'ESTP020', 'estp020-2_52826081331_o_54237fd9c1084a329c27f40c559396b5_master.jpg'),
(153, 'ESTP020', 'estp020-3_52826521153_o_065f5c020fe441299ef865b526ad311d_master.jpg'),
(154, 'ESTP020', 'estp020-1_52825506602_o_a115b5ddf53148a08d97e01ff7b86d24_master.jpg'),
(155, 'ESTP020', 'estp020-4_52825506387_o_91c212f08243413dbd963193d05a30e4_master.jpg'),
(168, 'ESTP023', '1_4554a899fc974e40bc58638b060b31ee_master.jpg'),
(169, 'ESTP023', '2_01804471604b4ce29bbd620d5ac8f08f_master.jpg'),
(170, 'ESTP023', 'estp023_f704d9ca4a9142c587f3d01d7bf20088_master.jpg'),
(171, 'ESTP023', 'estp023-2_e8cc41d54ae748558cbb1fefc99ffa80_master.jpg'),
(172, 'ESTP023', 'estp023-3_cbe5abc9a09543df8bcd296c5b941ccf_master.jpg'),
(173, 'ESTP015', 'estp015_a0e07e027c614085b06c261c289544ab_master.jpg'),
(174, 'ESTP015', 'estp015-1_4850d0b18f664531958be981c80b3849_master.jpg'),
(175, 'ESTP015', '52984839667_2b60bd0a5c_o_3c6abb663b134583890c1f84a05afa34_master.jpg'),
(176, 'ESTP015', '52985585104_6b4d0aa540_o_5bfd3df1d8074e8b988393d17058d82e_master.jpg'),
(177, 'ESTP015', '52985814890_0e0f66878b_o_cb9d7e43b07940179e8a0377ef9f4496_master.jpg'),
(178, 'DSTP903', 'dstp903_52866905251_o_735380510ed1481090a9d817d712432b_master.jpg'),
(179, 'DSTP903', 'dstp903-5_52899252161_o_fbbfca6789984d79a05a30395baebf8d_master.jpg'),
(180, 'DSTP903', 'dstp903_52866328857_o_dcb32e4dd65b4c0692aba155328ae3f1_master.jpg'),
(181, 'DSTP903', 'dstp903_52867348133_o_1a35eb97c32d48aba7cc60754f132f89_master.jpg'),
(182, 'DSTP903', 'dstp903_52867348138_o_89a8c909f5ec431c9f313c754ae9e042_master.jpg'),
(183, 'DSTP903', 'dstp903_52867348178_o_9eaaa6a1c432440b8bc3a8863c2d4699_master.jpg'),
(184, 'DSTP903', 'dstp903-1_52899647210_o_3e4bedccc26c4921bf2d0e26cbd987bd_master.jpg'),
(185, 'DSTP903', 'dstp903-2_52899647325_o_d2a330409f00496ea82d68f220729469_master.jpg'),
(186, 'DSTP903', 'dstp903-3_52899414579_o_48d0f7660d7648f18f998fa3f52cd042_master.jpg'),
(187, 'DSTP903', 'dstp903-4_52899252121_o_ae557b13c3e54659beab9355b85ac6e1_master.jpg'),
(189, 'ESTP017', '52984841597_c4f0a17882_o_537cdc00b2124e288af5d94002fba114_master.jpg'),
(190, 'ESTP017', '52984841637_be878f2e96_o_b2155ec1c2c6425a94b240f852a798d4_master.jpg'),
(191, 'ESTP017', '52985816615_83d5e68a16_o_a38ee4423e9a4d9e9a719237c6aa6f52_master.jpg'),
(192, 'ESTP017', '52985905053_bdeffa314e_o_aa67bed06deb439399cc2046790f8c59_master.jpg'),
(193, 'ESTP022', '52901478774_f103d7180e_o_6ec337721b6d4a8bae3c2626bca7d037_master.jpg'),
(194, 'ESTP022', '52900747392_3bd87b9424_o_ef4fd5e38ee643538ccbfa25af4daa72_master.jpg'),
(195, 'ESTP022', '52900747527_b5ba3ab3a3_o_c0e500d9ecf04e648a5b4eadafa8c56d_master.jpg'),
(196, 'ESTP022', '52901708515_30006cf211_o_f3e3d22e5e3e42078feb7d3d311ef24c_master.jpg'),
(197, 'ESTP022', '52901317611_a0acf4ef9f_o_615c31feb98a4e81a2ef903f914370b3_master.jpg'),
(198, 'ESTP022', '52901708410_5a8af79350_o_a64f83bc7f1140c4bcd2cb9dfdcb1882_master.jpg'),
(199, 'ESTP022', '52901708465_503bdb72bc_o_44f82d09c0c549f7b87f0a9fc128200d_master.jpg'),
(200, 'ESTP022', '52901317591_9d166f4fa0_o_15c83e519bbb4b08bc17abc027167bb1_master.jpg'),
(201, 'ESTP018', 'tp018_0691972d076d4071a4fee5291912df9e_master.jpg'),
(202, 'ESTP018', 'tp018---bk001-_14__c88cf49e00c3437cbed27b9e9b7e6bbb_master.jpg'),
(203, 'ESTP018', '52826112561_28a33161d2_o_863d94fe95454b768bab5808fcb136fe_master.jpg'),
(204, 'ESTP018', '20230418_utjkznvmqy_2bb5168802fa45a3aa7687b49275558c_master.jpg'),
(205, 'ESTP018', '20230418_zdan7vokau_193adb5ef92d4ff0a9628a7e8087719a_master.jpg'),
(206, 'ESTP021', 'estp021-2_7b1e8ac1a10c4163bf199b7b89332d81_master.jpg'),
(207, 'ESTP021', '52761369041_9f0e67d125_o_9032748cb48b41bc872cef7ab7b26fce_master.jpg'),
(208, 'ESTP021', '3_a205919edf4d4446a1522a2c10bc383f_master.jpg'),
(209, 'ESTP021', '4_c8d69e314ed348e4bd9c456f2721a78d_master.jpg'),
(210, 'ESTP021', '5_1137cf2bb12540fe8f3e15d4b6719363_master.jpg'),
(221, 'ESTP014', 'estp014_f4dabbabbe0346598163050a85b06f1a_master.jpg'),
(222, 'ESTP014', '52963145971_d831ed870e_o_0cb9f3d06fb2434f92c94c572d9f7820_master.jpg'),
(223, 'ESTP014', '52962545147_25055ccc29_o_af189f39f582417bb4e7d78258ba2afb_master.jpg'),
(224, 'ESTP014', '52963145991_ed718131ed_o_c94a43b3e7be4f2d955466fc9ad6cafa_master.jpg'),
(225, 'ESTP014', '52963286319_9f96c02b76_o_777e3a250afb437a834bb46e13a3b849_master.jpg'),
(226, 'ESTP012', 'tp012_0d295f194e3f4f0eab7eede288c3a7c5_master.jpg'),
(227, 'ESTP012', '52962546502_67cf66a988_o_50eedd51b47d489c851da09e2dd4787e_master.jpg'),
(228, 'ESTP012', '52963148566_1522e0b1d5_o_f23c0e6864fc465f8ba86fb4e02f6eca_master.jpg'),
(229, 'ESTP012', '52963148571_85db89bd29_o_6be3d4ece33747288a86005d9ace3990_master.jpg'),
(230, 'ESTP012', '52963526080_043a99d427_o_361c1c8965ed4a379649be937138d1a4_master.jpg'),
(237, 'DSTP650', 'tp650---bi801-_7__abbb944d2018481c829e959580b99514_master.jpg'),
(238, 'DSTP650', 'tp650---bi801-_17__b30c2c74b038490f890dfec689b60602_master.jpg'),
(239, 'DSTP650', '1_dafd00796d394cdbafeebc27a23aebbe_master.jpg'),
(240, 'DSTP650', '3_6e830c4790f546dd91780c15c5c3d2df_master.jpg'),
(241, 'DSTP650', '2_3cd9ac4ea4134a5cb2377036c8858bfd_master.jpg'),
(242, 'DSTP650', '4_485c2d0480d84e4b983817d401d0c65d_master.jpg'),
(243, 'ESTP047', '5_66590d1cba6041359e8a89a1c7e0feb5_master.jpg'),
(244, 'ESTP047', '1_eaabf57d435740af8ed20d6f40378045_master.jpg'),
(245, 'ESTP047', '2_25c38d6c27394c258025535e2bc9d5bd_master.jpg'),
(246, 'ESTP047', '6_e4d2cb26997d464985a485cc7f212599_master.jpg'),
(247, 'ESTP047', '4_a52dff1ab14f48e7b978ced85dfb6806_master.jpg'),
(248, 'ESTP047', 'estp047-1_1f39491e95314848a3036b88e0bdcc90_master.jpg'),
(249, 'ESTP047', 'estp047-2_7378910d66be4c0a8dcc152afcb330e0_master.jpg'),
(254, 'TP004', 'tp004_45415f65d7bc4f4c8d52f4893d682a43_master.jpg'),
(255, 'TP004', 'tp004-2_572851b755514fa7b302d5120a7d3b94_master.jpg'),
(256, 'TP004', '5_14e1329ad875426cbc7afb776056eeae_master.jpg'),
(257, 'TP004', '4_4d48bde78a5148fab5623251d0da8e08_master.jpg'),
(258, 'TP004', '3_0f0a15621d144f79b8228e7763b3b8e5_master.jpg.jpg'),
(297, 'ESTP074', '1701361255341_10_ab507de1e88747f99527ac4852b40535_master.jpg'),
(298, 'ESTP074', '1701361255426_9_ae65d9fd2f8f4cfcb114ee123fcffd63_master.jpg'),
(299, 'ESTP074', '1701361255431_8_62f9c35e209b490fa0012a46b2faada3_master.jpg'),
(300, 'ESTP074', '1701361255434_7_e37142ddf18d4daa898aac91aa82eb92_master.jpg'),
(301, 'ESTP074', '1701361255437_6_9622c2cf1ffe49dd9d06ac5ca4d10119_master.jpg'),
(302, 'ESTP074', '1701361255440_5_5bf4a94b5b19485199441c580dae0f6a_master.jpg'),
(303, 'ESTP074', '1701361255443_4_aaa0fd53411a441e85605a458aab67f7_master.jpg'),
(304, 'ESTP074', '1701361255445_3_e2f6d02236ac4e0397a15b372c85bfb2_master.jpg'),
(305, 'ESTP074', '1701361255449_2_5933a603e4074662bfe7cc6b5fe1e44b_master.jpg'),
(306, 'ESTP074', '1701361255452_1_50f16dbd5df34aa3acc99865b4820084_master.jpg'),
(308, 'ESTA010', '1702537484257_esta010-5_2ba1b356efe4495cab57f32d9d25091c_master.jpg'),
(309, 'ESTA010', '1702537484260_esta010-4_270b822eb48441a1a53f5546346ddd40_master.jpg'),
(310, 'ESTA010', '1702537484263_esta010-3_0ba6357a968c46e0affaf07666b9c01b_master.jpg'),
(311, 'ESTA010', '1702537484266_esta010-2_8a537af4aa4444c0aa99eeaca96547da_master.jpg'),
(312, 'ESTA010', '1702537484269_esta010-1_ad9f734ad81a4f339a557960d10dd7f5_master.jpg'),
(313, 'ESTA006', '1702700896436_esta006-4_c514e01db8474d70b33092f7cd99164c_master.jpg'),
(314, 'ESTA006', '1702700896469_esta006-3_4df5bd70d3eb4967ad32074a57d6ba39_master.jpg'),
(315, 'ESTA006', '1702700896473_esta006-2_1c9f30407e6b4054a8e1d8851dcecdab_master.jpg'),
(316, 'ESTA006', '1702700896477_esta006-1_2a8dce82b88d4fd798c0434cf9bed833_master.jpg'),
(317, 'ESTA003', '1702701667209_eata005-2_d7ce58698163437ba1db1dedb9eb6b11_master.jpg'),
(318, 'ESTA003', '1702701667249_eata003-4_3278e31069de4a949432bdb95d84b15a_master.jpg'),
(319, 'ESTA003', '1702701667255_eata003-3_fcd31b6aead047a49d37bd2f4f15e7aa_master.jpg'),
(320, 'ESTA003', '1702701667264_eata003-2_06740cf99ddb4d81a574ea48aa9a34b9_master.jpg'),
(321, 'ESTA003', '1702701667271_eata003-1_c8e90efa55944401946efba4f0ae02bf_master.jpg'),
(322, 'ESTA005', '1702702646779_eata005-6_6c157a33937a44b497592693b64d7feb_master.jpg'),
(323, 'ESTA005', '1702702646814_eata005-5_3cc9485ee40445818e4c67208dcdf9b2_master.jpg'),
(324, 'ESTA005', '1702702646819_eata005-4_4024f1e717604680ace040117d1f362f_master.jpg'),
(325, 'ESTA005', '1702702646824_eata005-3_a2bc7b29fc1b47b6a97348d13ea83f41_master.jpg'),
(326, 'ESTA005', '1702702646831_eata005-2_ef46f711d4734ba6a8be08d07f8f3567_master.jpg'),
(327, 'ESTS040', '1702703208763_ests040-5_52987217372_o_72ea4d648501425a806b5111c47b91b6_master.jpg'),
(328, 'ESTS040', '1702703208771_ests040-4_52987961469_o_c152e6e7afcd4facbd707fb5586bc689_master.jpg'),
(329, 'ESTS040', '1702703208775_ests040-1_52988193050_o_0e50794abc7045348461b2a44f2f7756_master.jpg'),
(330, 'ESTS040', '1702703208778_ests040-3_52988281533_o_ef60746768644df19e5c12428fb5ed6b_master.jpg'),
(331, 'ESTS040', '1702703208781_ests040-4_52985587859_o_bc41df09b2474dc483a02fd152f7d372_master.jpg'),
(332, 'ESTS040', '1702703208783_ests040-3_52985817640_o_8ae0d260d3e2495991ce73334cbc2adc_master.jpg'),
(333, 'ESTS040', '1702703208788_ests040-2_52985443091_o_82ed730d0f54440a839469648c303994_master.jpg'),
(334, 'ESTS040', '1702703208791_ests040-1_52985817645_o_da637e28e79a4c9a8f467bc9801869fc_compact.jpg'),
(335, 'ESTS040', '1702703208795_ests040-2_52988193045_o_8fd6a00033484ba78cd9122314ac7912_master.jpg'),
(336, 'ESTS044', '1702717326826_ests044-7_52952326015_o_0bac266322e846e0a8fdfbef6ad564ac_master.jpg'),
(337, 'ESTS044', '1702717326846_ests044-5_52952083504_o_5fae14cac84f41df80684c063252f356_master.jpg'),
(338, 'ESTS044', '1702717326849_ests044-4_52952325920_o_db452e2aca604cc99f713286eecff353_master.jpg'),
(339, 'ESTS044', '1702717326853_ests044-2_52951946131_o_7ae2b619a4d64636be4010f88b76f599_master.jpg'),
(340, 'ESTS044', '1702717326858_ests044-1_52951946161_o_5b02f5c9e0ad4e30ad598e66309be6f9_master.jpg'),
(341, 'ESTS044', '1702717326862_ests044-3_52952396788_o_5673812b89994da69cfc7ad22ca9677e_master.jpg'),
(342, 'ESTS021', '1702717756299_52952382618_a5bfb52264_o_1dd1d8bfd5964b5ba39fa794245413c2_master.jpg'),
(343, 'ESTS021', '1702717756307_52951331472_2666f11939_o_4df65f417d014c27a790ea7f10643760_master.jpg'),
(344, 'ESTS021', '1702717756310_52951331432_de924a7667_o_ee8f89781bd546bbb3a8491609d8508b_master.jpg'),
(345, 'ESTS021', '1702717756312_ests021-2_e1e40d9fbd9949b3a121eb0118255897_master.jpg'),
(346, 'ESTS021', '1702717756315_ests021-1_c15a97c09eef4e6eb14482be0b841e8a_master.jpg'),
(347, 'ESTS021', '1702717756318_ests021_64a34ff68d6d4857bae234b1364576fc_master.jpg'),
(357, 'ESTS038', '1702802210671_52932807699_675718ff74_o_c51332dcd11d4ceb82ee7fd5d74a508d_master.jpg.webp'),
(358, 'ESTS038', '1702802210675_52933043930_8da87d7a6c_o_1af3f2feba9545f8be8a0a196b8b2567_master.jpg.jpg'),
(359, 'ESTS046', '1702802457847_ests046-4_52823383866_o_03a8719562174bfea3d3c34e9f6ce77c_master.jpg'),
(360, 'ESTS046', '1702802457852_ests046-3_52823787455_o_e32a02c616c541dea1916e0846fd4542_master.jpg'),
(361, 'ESTS046', '1702802457857_ests046-2_52823821213_o_c93187331d7744c5a2f29f0e0c12667a_master.jpg'),
(362, 'ESTS046', '1702802457861_ests046-1_52823383756_o_d4754aac7afc4e239bf0051796f9a08c_master.jpg'),
(363, 'ESTS046', '1702802457864_52822810917_399b0c9e61_o_f8b7ca92c7494149998a032945fdab3a_master.jpg'),
(364, 'ESTS046', '1702802457870_52933042335_6073fd6fbf_o_26515b1de83944d38a9c619c21cc769a_master.jpg'),
(365, 'ESTS046', '1702802457873_52932806289_bc52c62c78_o_f52bd9c5a85245f994c7648225599922_master.jpg'),
(366, 'ESTS036', '1702802725811_img_8589_52910931139_o_11a1939717b94032aee2aac1048f8f2f_master.jpg'),
(367, 'ESTS036', '1702802725819_img_8588_52910203567_o_79d74ee4870542d5bb9c0c7d423fac31_master.jpg'),
(368, 'ESTS036', '1702802725823_img_8585_52911231748_o_2e3cb6c9417b4c4a863f3a1a66658fca_master.jpg'),
(369, 'ESTS036', '1702802725828_img_8583_52910203677_o_fb46608541cd4d43bcbf847e80ba49be_master.jpg'),
(370, 'ESTS036', '1702802725832_img_8582_52911164715_o_5a36f5119e5f450a859036561f4460f4_master.jpg'),
(371, 'ESTS036', '1702802725835_img_8578_52910203457_o_1a52bd3eab9049858c9e04b24c2df325_master.jpg'),
(372, 'ESTS036', '1702802725838_52932808504_eb04cf31e5_o_524c41c783ae49759badacbe15c3d9d7_master.jpg'),
(373, 'ESTS036', '1702802725844_52932058522_9aba18e17a_o_e54f4d9597d9417c80ecba97a29c218c_master.jpg'),
(374, 'ESTB026', '1702803852463_estb026-6_52823399121_o_7260dac727ce4fee98c47e9e1cface96_master.jpg'),
(375, 'ESTB026', '1702803852471_estb026-5_52823802475_o_3ac07df0a46749f8962e2c55cfcd89ce_master.jpg'),
(376, 'ESTB026', '1702803852475_estb026-4_52823836403_o_311a77c2f8a44b8f880af86b30450200_master.jpg'),
(377, 'ESTB026', '1702803852478_estb026-3_52823836533_o_d186ef013d2f4c84bc2ca03d360d935e_master.jpg'),
(378, 'ESTB026', '1702803852482_estb026-2_52822826977_o_0a051c27711c4eda8825e1a294e527d7_master.jpg'),
(379, 'ESTB026', '1702803852487_estb026-16_52822828202_o_3756dfb1091b4d09895dce49845d4e0e_master.jpg'),
(380, 'ESTB026', '1702803852491_estp026-2_8be997547b86427abb4dfb61fc15a5bf_master.jpg'),
(381, 'ESTB026', '1702803942376_estb026-22_52823803520_o_718ac96b8e95469db8a8ef74a023c2dc_master.jpg'),
(382, 'ESTB026', '1702803942380_estb026-17_52823400941_o_28946e8fe13e4123ae9010a5d2004bcd_master.jpg'),
(383, 'ESTB026', '1702803942386_estb026-11_52822828632_o_fb5c8442ec4146618cca5021c9f98643_master.jpg'),
(384, 'DATB614', '1702806015784_52659779297_47f3c457bc_o_a51ef16f093348b6b4f3cf870e85e08d_master.jpg'),
(385, 'DATB614', '1702806015791_52660278521_2f6709e709_o_5d182bb3af21461d92187ab883f3e1db_master.jpg'),
(386, 'DATB614', '1702806015796_52660277426_dc504ee577_o_21bd4f09db1d40e68e692253e8796e4b_master.jpg'),
(387, 'DATB614', '1702806015800_52660278786_9ba122257e_o_929bf419522b4ae0ae7e2c6a6fb1b46d_master.jpg'),
(388, 'DATB614', '1702806015803_52659780022_276e6ffe8f_o_538cb00491c24f7c8b6f1a02b952220c_master.jpg'),
(389, 'DATB614', '1702806015806_52660723970_bfd1c8d37d_o_1661ae6b3e4b44c281d809ceffd1fe58_master.jpg'),
(390, 'DATB614', '1702806015812_52660558534_e1239eeb1b_o_786802e53d3843e19392b3f4e5199c71_master.jpg'),
(391, 'DATB920', '1702806426600_52676411040_14a9edf7fb_k_274a9ee91f644bb497574ddf187a898a_master.jpg'),
(392, 'DATB920', '1702806426607_52675982306_1de686897f_k_b3f1e82afd564d57939092ede2e8712d_master.jpg'),
(393, 'DATB920', '1702806426610_52676267734_29ce1b8952_w_b5e73e512a94405184fa5e20ecf65fcc_master.jpg'),
(394, 'DATB920', '1702806426613_52675471287_ce95e63b8d_c_27120fb7463643f8bfb96af8f03a4f1b_master.jpg'),
(395, 'DATB920', '1702806426616_52676267774_9c7d4176e8_k_559ce960bc8b48a68d7aa9f1710f6cf7_master.jpg'),
(396, 'DATB920', '1702806426620_52675981811_16343f35a9_o_47f611111bbb46b3a3499a88b25c1126_master.jpg'),
(397, 'DATB920', '1702806426624_52676410670_9925195387_o_f81c51d94f4c452e8a98502af8e27a65_master.jpg'),
(398, 'DATB920', '1702806426628_52675470897_244d30d8d3_o_153eb48e037a42f4b422012eeb8edfcd_master.jpg'),
(399, 'DATB920', '1702806426631_52675470952_bac5dde46f_o_6e072690900e4c5bb133f84a697b0f1e_master.jpg'),
(400, 'DATB920', '1702806426637_52695476781_bac6e21f9c_k_fec22b5dee744ea0b0d2b622f99451fc_master.jpg'),
(401, 'DATB920', '1702806426640_untitled_design__5__5744f2809b2c4d3499ef8f70899e3c18_master.jpg'),
(402, 'EATB006', '1702806927283_eatb006-7_c9e79db0114c4200a63cd60475d6a122_master.jpg'),
(403, 'EATB006', '1702806927289_eatb006-4_a248aa8e293a4fddbbdde47a4756d047_master.jpg'),
(404, 'EATB006', '1702806927292_eatb006-3_ce2f16403e4b49bd990f26b44947fce5_master.jpg'),
(405, 'EATB006', '1702806927296_eatb006-2_0511ad8acf754ee995e7c81347160cc6_master.jpg'),
(406, 'EATB006', '1702806927300_eatb006-5_697cbbe50fd24f45b3b62366f5bf48e8_compact.jpg'),
(407, 'EATB006', '1702806927304_eatb006-5_697cbbe50fd24f45b3b62366f5bf48e8_master.jpg'),
(408, 'EATB006', '1702806927308_eatb006-9_b1e0eef7be8c449dbab0b49c24dd2e48_master.jpg'),
(409, 'EATB006', '1702806927311_eatb006-8_dc7583950c78485f9c62a509cccab61f_master.jpg'),
(410, 'EATB006', '1702806927317_eatb006-6_ed5bf9508fe94a6da12e90ebd637f5bb_master.jpg'),
(411, 'EATB006', '1702806927321_eatb006-1_802efda9723841d59eb56fabb46d7b22_master.jpg'),
(416, 'EATB003', '1702807767083_eatb003-8_084c26b6c7684eb8b046a72e61083bb7_master.jpg'),
(417, 'EATB003', '1702807767088_eatb003-7_46d35176d4ad45afb53f50cb2bde044c_master.jpg'),
(418, 'EATB003', '1702807767092_eatb003-6_8eced11e6d14459cbb181b09b51ae20a_master.jpg'),
(419, 'EATB003', '1702807767097_eatb003-5_a9d10239ad594405819d73174c16f106_master.jpg'),
(420, 'EATB003', '1702807767101_eatb003-4_438ed372ba5047269b3eabc8cee7d87f_master.jpg'),
(421, 'EATB003', '1702807767105_eatb003-3_a934a4382e84499b9a267b113bd841e5_master.jpg'),
(422, 'EATB003', '1702807767111_eatb003-2_67d23b0fe4d24d15af3c78bb21a49bf7_master.jpg'),
(423, 'EATB003', '1702807767115_eatb003-1_4b6bae1705b84deabfa237c94373b36e_master.jpg'),
(424, 'DABK906', '1702808414165_dabk906-6_927e60d4ebbb4678b0d68f10ab3a54a2_master.jpg'),
(425, 'DABK906', '1702808414171_dabk906-5_98aa9c0da5cd4fb2a5cef7a73cefe36c_master.jpg'),
(426, 'DABK906', '1702808414176_dabk906-4_94214472d2504fea9977e199bfbdbd60_master.jpg'),
(427, 'DABK906', '1702808414180_dabk906-3_2e0eebbdc700441aa2c8455d175db942_master.jpg'),
(428, 'DABK906', '1702808414184_dabk906-2_bac3936bf9d84867b4992915c17c55e4_master.jpg'),
(429, 'DABK906', '1702808414188_dabk906-11_a2d5c942c2ff436c9f872d7393b79bff_master.jpg'),
(430, 'DABK906', '1702808414194_dabk906-1_6be1255f7e6b427094e410388cb5f6a1_master.jpg'),
(431, 'DABK908', '1702808850326_52709644909_ec78a5b681_o_2b532365a459475087eb1a60f1d7bf18_master.jpg'),
(432, 'DABK908', '1702808850332_20230112_kkdpzqbmudplbn4v_2ad921ea8c3446c8b03eac34c60ea840_master.jpg'),
(433, 'DABK908', '1702808850335_20230112_yemiyu2ietsvb00e_0133472491ac484380875734194b366e_master.jpg'),
(434, 'DABK908', '1702808850338_20230112_aegxlx220r0cyabo_79e1cfa1e7994745ae2a63f075017a50_master.jpg'),
(435, 'DABK908', '1702808850340_20230112_aswzjkmbtcswuecm_759b78b711fe4fccb346aafbb72afe3b_master.jpg'),
(436, 'DABK908', '1702808850344_52572958209_7a8958f472_o_6a35eb314f4e4386ba252c4c13aa46b9_master.jpg'),
(437, 'DABK908', '1702808850347_52572958079_bf18582296_o_b7b494c15e3d4e6eab215767950ac091_master.jpg'),
(438, 'DABK908', '1702808850350_52573214058_ae17e2ec7d_o_ae0d8762ed534d7da5f489fea388fb4a_master.jpg'),
(439, 'DABK908', '1702808850353_52573133940_b5a8447253_o_cf8db422a9e04d11af61493907e9ebc8_master.jpg'),
(440, 'DABK908', '1702808850356_tp038---bk908-_23__34e8865287bc432c881c61e4c3b1614b_master.jpg'),
(441, 'DABK908', '1702808850360_tp038---bk908-_20__de063447c1d34cf0a62c34b18ed2ffe6_master.jpg'),
(442, 'EABT021', '1702809314674_eabt021-7_52952129974_o_36dd5e232c944505837e328306ca06d5_master.jpg'),
(443, 'EABT021', '1702809314794_eabt021-6_52951392377_o_06751b36a0b049c8a230d80e9b86d2e7_master.jpg'),
(444, 'EABT021', '1702809314990_eabt021-3_52952129939_o_165a74ba54fe4f90afd689129e088fdb_master.jpg'),
(445, 'EABT021', '1702809315238_eabt021-2_52952443573_o_0c155321a61a4f33a482c51d6c0a1352_master.jpg'),
(446, 'EABT021', '1702809315614_eabt021-1_52951392367_o_e8f1b01918b54bc1a2631568f5dd458b_master.jpg'),
(447, 'EABT021', '1702809333060_eabt021-4_52951993446_o_0d23aa6812b3462cb69bdc6b19240434_master.jpg'),
(448, 'EABT019', '1702809798197_52776871749_e2c0b1e895_o_b3a1b7a40a0d426e878457df4294018c_master.jpg'),
(449, 'EABT019', '1702809798471_20230412_uq4kjvcmhj_70b56b5513de4d3ca66eac59642bef97_master.jpg'),
(450, 'EABT019', '1702809798810_20230412_fmolgheqgq_ff309b08c2d4476e895a27df755bef47_master.jpg'),
(451, 'EABT019', '1702809798874_20230412_i6l1zc67ts_d280fbc65e18401ba4be9fbf7a47c917_master.jpg'),
(452, 'EABT019', '1702809799004_52777027695_4802662c62_o_9cf976a814c74d1299a1a4e437d368c9_master.jpg'),
(453, 'EABT019', '1702809799788_52776082972_d2e0349123_o_3b566765f10941fa8472b88063934868_master.jpg'),
(454, 'EABT019', '1702809799967_52776615421_ec4b245843_o_449061a74c534691b47fa009d785f46d_master.jpg'),
(455, 'EABT019', '1702809800088_52776615181_dcef200531_o_4e1c687fb840415a91c6320fe561c127_master.jpg'),
(456, 'EABT019', '1702809800238_tb041---bt019-_17__d4d6e2ec2dbf4dd897653f55781b4dcb_master.jpg'),
(457, 'EABT019', '1702809800334_tb041---bt019-_14__13addb6f4b634d3bb1df83649ff1fdde_master.jpg'),
(458, 'DABJ004', '1702810004147_52706148983_5e4cb0e46b_o_71a63d69ea764111817caab180516083_master.jpg'),
(459, 'DABJ004', '1702810004151_52706072330_c3ea1c6f70_o_218112c649264444827f130a5899eabd_master.jpg'),
(460, 'DABJ004', '1702810004154_52706072235_9bf8c4e344_o_3275d856899841e194d0a50d5351fb2a_master.jpg'),
(461, 'DABJ004', '1702810004156_52705134232_5dabe57723_o_284ab3859ae841c599e3e216c35d43f3_master.jpg'),
(462, 'DABJ004', '1702810004160_52705134532_9641266ba5_o_b0cd484e75c9447580fa232f4eef872c_master.jpg'),
(463, 'DABJ004', '1702810004163_52706071935_8966d1e12f_o_a66489be76c949d791609a08ca73993f_master.jpg'),
(464, 'DABJ010', '1702810256788_52167839967_2127960c61_o_d192322094cd4d1dab1790f5a4995e51_master.jpg'),
(465, 'DABJ010', '1702810256792_52169109624_4b0fdfea3e_o_d9919592f8e043f782d44ce65902c365_master.jpg'),
(466, 'DABJ010', '1702810256794_52168871298_5574f48047_o_34c442454a2d44fab30dd83481d5db41_master.jpg'),
(467, 'DABJ010', '1702810256797_52167839292_d0471b70ce_o_7501f2fc994447218a00785c60f6bba7_master.jpg'),
(468, 'DABJ010', '1702810256802_52168871363_a4f22ded3c_o_027ce5b100a048bab3770456a090fe81_master.jpg'),
(469, 'DABJ010', '1702810256805_52169342265_2c7137e4bf_o_fa2fa32197bc4613973a8ddd59e488c0_master.jpg'),
(470, 'DABJ010', '1702810256808_52169110354_87bd6ccaa0_o_abf9f4cabd204376b1d1cba50d2deec9_master.jpg'),
(471, 'DABJ903', '1702810455332_52417006300_6f7ea894a2_o_155f8f02ec1b4c1fb2614e54faa89714_master.jpg'),
(472, 'DABJ903', '1702810455336_52417006270_e73e119ab9_o_3be117debb524beb882cb2d799498554_master.jpg'),
(473, 'DABJ903', '1702810455340_52416563431_3f20b3e7c6_o_c89fbf176f5a4ecf93ee976ac7f76ffe_master.jpg'),
(474, 'DABJ903', '1702810455343_52416845114_1fcba8292b_o_4a1de055394249548a5c8916b47fb821_master.jpg'),
(475, 'DABJ903', '1702810455346_dabj903-1_c6addc33aefe4f808d540f501dce25d0_master.jpg'),
(476, 'DABJ903', '1702810455348_dabj903_bf925f25f2c244aeb43a9c4430f64ef8_master.jpg'),
(477, 'DABJ908', '1702810648495_bj908-9_53198470183_o_2e9f86b18a2f4a8aaf1618dd68a5f2ef_master.jpg'),
(478, 'DABJ908', '1702810648499_bj908-8_53198052049_o_6c073d7ec7154209ba1631016af4beb9_master.jpg'),
(479, 'DABJ908', '1702810648502_bj908-7_53198579615_o_e8f28cfb917c43ed8426007765cac1de_master.jpg'),
(480, 'DABJ908', '1702810648505_bj908-1_53197785252_o_5ce6fb79a2c5406e9653f8d522cc482b_master.jpg'),
(481, 'DABJ908', '1702810648509_bj908-6_53198579650_o_262e43d6cbbc44308abb23db80c9eb69_master.jpg'),
(482, 'DABJ908', '1702810648513_bj908-2_53198051989_o_d8c0aeb3be18470c95b4e19e4481b38d_master.jpg'),
(483, 'CABJ003', '1702810774286_cabj003-1_4c7c6104568d47139ab4f9b9df4e6a87_masterkpg.jpg'),
(484, 'CABJ003', '1702810774291_cabj003_75aa0eb2e3ef4d7cb175dcef6ceae9cf_master.jpg'),
(485, 'DABJ904', '1702810960842_52419688925_095875bbed_o_cdd18641318f48cda52c00a2c30264b8_master.jpg'),
(486, 'DABJ904', '1702810960848_52419688890_5e23d5cff3_o_d70f528721b945d4a34ccd1b51fb1362_master.jpg'),
(487, 'DABJ904', '1702810960851_52419529844_90ed9dba78_o_9eef75f8b7b84523936675cd9fb42063_master.jpg'),
(488, 'DABJ904', '1702810960854_52419250611_0f82236c1f_o_83cb1b62f83d4f698f691b321e12cac5_master.jpg'),
(489, 'DABJ904', '1702810960857_52418739412_cc775bbaa6_o_01791bf8f88049af935fc784aeea69f1_master.jpg'),
(490, 'DABJ904', '1702810960863_20230209_2nqi04eclesynryo_614790fe9b5a479095c6726ef90f2df7_master.jpg'),
(507, 'ESBW005', '1702812011588_esbw005--9_52899674460_o_296b1f20ae9941f6b17a610ac00d49b7_master.jpg'),
(508, 'ESBW005', '1702812011592_esbw005--7_52898705557_o_20994a6240134dc18c19850099a85f72_master.jpg'),
(509, 'ESBW005', '1702812011596_esbw005--6_52899279301_o_a9b92cb1a220466fb40a137f6b1032fc_master.jpg'),
(510, 'ESBW005', '1702812011599_esbw005--5_52899727433_o_f2e8e5c559fd4fad91e417a4fef1bc23_master.jpg'),
(511, 'ESBW005', '1702812011601_esbw005--3_52899440664_o_07f1e33f83c044bab736e9a55753d6b1_master.jpg'),
(512, 'ESBW005', '1702812011637_esbw005--2_52899440654_o_9d430ebd4f3c4efca91917e765c00d48_master.jpg'),
(513, 'ESBW005', '1702812011640_esbw005--1_52899279126_o_d3ed642f59914badb1c93ea5d031d2e8_master.jpg'),
(514, 'ESBW005', '1702812011644_ff_15927ceaf8c342d68b92a6f8f4488382_master.jpg'),
(516, 'ESBW005', '1702812110775_4268bd5eeb3e637ed3b_master.jpg'),
(517, 'ESBW004', '1702812478065_esbw004-9_52898739082_o_c82e5ce820cf41528e0d7a18081780ab_master.jpg'),
(518, 'ESBW004', '1702812478069_esbw004-8_52899706940_o_c1d188c2dba54add95671fe3d6937d7a_master.jpg'),
(519, 'ESBW004', '1702812478072_esbw004-7_52899707115_o_32f0c7e0c35445a095a9ca8c75344f20_master.jpg'),
(520, 'ESBW004', '1702812478074_esbw004-6_52899707285_o_f85f1a38257140879eb69b09e6d63608_master.jpg'),
(521, 'ESBW004', '1702812478078_esbw004-5_52898738362_o_d0ac614afbf24774b6edfb647a42ed0f_master.jpg'),
(522, 'ESBW004', '1702812478081_esbw004-4_52899760808_o_d8a6e9f0f34844feaf0a265800eef988_master.jpg'),
(523, 'ESBW004', '1702812478084_gg2_76e1acff4af64c92824f810fd840d106_master.jpg'),
(524, 'ESBW004', '1702812478087_gg_9291a873c71b40fe81bd4a65e6e9e1cf_master.jpg'),
(525, 'ESBW004', '1702812478091_esbw004-12_52899473574_o_36fe3a92153a417b89b69bf2ce2d1490_master.jpg'),
(526, 'ESBK007', '1702812911809_esbk007-19_52988201020_o_3df16f49342548df98e932f189c1484a_master.jpg'),
(527, 'ESBK007', '1702812911813_esbk007-6_52988289443_o_d2d6cd03c5d84efab4ae4506ebb269ed_master.jpg'),
(528, 'ESBK007', '1702812911816_esbk007-5_52988289468_o_5d54497d13494a938810a0d461885986_master.jpg'),
(529, 'ESBK007', '1702812911820_esbk007-4_52988289103_o_05529d8d255e47ab9f049e81f195f63a_master.jpg'),
(530, 'ESBK007', '1702812911824_esbk007-3_52988289118_o_26a2149e64da47fb812bce27361703a6_master.jpg'),
(531, 'ESBK007', '1702812911827_esbk007-2_52988200955_o_cb741fb89c754e52a289bac1b7dc4359_master.jpg'),
(532, 'ESBK007', '1702812911829_c_266c13d20919488f8a43881fd3d86ca3_master.jpg'),
(533, 'ESBK007', '1702812911835_a_01ad865f36cf4eb9bd17ae50ff4d7a76_master.jpg'),
(534, 'ESBK007', '1702812911838_b_d29e6bdf78d04be1aa1575b44e69b2fb_master.jpg'),
(535, 'ESBK002', '1702813549110_esbk002-17_52813989875_o_d400362148e04736bda41b2b86844201_master.jpg'),
(536, 'ESBK002', '1702813549116_esbk002-18_52814032098_o_8804bbb1b3d74439abaee51731a82b2b_master.jpg'),
(537, 'ESBK002', '1702813549119_esbk002-14_52813577276_o_2caabc86a631431c94c8ad7d198b438d_master.jpg'),
(538, 'ESBK002', '1702813549122_esbk002-11_52813020512_o_6c397ca1a0484b66af09d98258cae11c_master.jpg'),
(539, 'ESBK002', '1702813549126_esbk002-25_52813772009_o_7cbce75ae5e645bcaec61489c3f6d783_master.jpg'),
(540, 'ESBK002', '1702813549130_esbk002-2_52813988905_o_bd8d3514db464a4e840a78635c9a192b_master.jpg'),
(541, 'ESBK002', '1702813549133_esbk002-22_52813989440_o_072320897e0244c2946de08e00e68df5_master.jpg'),
(542, 'ESBK002', '1702813549136_esbk002-19_52813772554_o_f63f7a794f0a4f3f96b3b22d212f378a_master.jpg'),
(543, 'ESBK002', '1702813549140_esbk002-8_52813990600_o_bbba896fe3744d0584fdce524ff888b1_master.jpg'),
(544, 'ESBK002', '1702813549143_esbk002-5_52813988720_o_52117d456e3d48d89d4c0b1e9cb62f93_master.jpg'),
(545, 'ESBK002', '1702813549146_52933853146_59370d1582_o_4bf573d486474c43b806540d25a49b65_master.jpg'),
(546, 'ESBK002', '1702813549148_52933853176_7967f42e52_o_208bdabebdb14986a84a5ed6be961474_master.jpg'),
(547, 'BI013', '1702814188800_20220214_rqmdfbzelhqp14kvbyjdov8e_4adea06d26014521b26f886e16175c5d_master.jpg'),
(548, 'BI013', '1702814188803_20220214_aa2dxth7npokvdt73rxflrsg_e686cb6ec1be4f309c5a8b1305f8769c_master.jpg'),
(549, 'BI013', '1702814188807_20220214_cmjadhbvnqgvj2dl8qxlmkst_18dfb5a80b834f6d826e7b7918365b27_master.jpg'),
(550, 'BI013', '1702814188816_20220214_yzxa3v6zuawe6zcbvw47ty0t_a101bd2336ef4b7091c1a97ed5734b09_master.jpg'),
(551, 'BI013', '1702814188820_20220214_9sqxfrp87yzcgtfw5gnv103y_ec5fec57d7f44d14819f71329d391d4d_master.jpg'),
(552, 'BI013', '1702814188823_20220214_zquxm0k25vusrzskw8qojnex_d0321582dc3342f4bb38d89f5c134a84_master.jpg'),
(553, 'BI013', '1702814188826_51988114534_238cde3543_o_7883ded929414df59b56b76e9a22e117_master.jpg'),
(554, 'BI013', '1702814188828_51988381170_eacbdaf22c_o_0e57a352daa34f50b70e03e77ec62792_master.jpg'),
(555, 'BI013', '1702814188831_51988114499_06741b197e_o_0ee210085cda4f85bc007c830526c361_master.jpg'),
(556, 'BI013', '1702814188835_51987823711_a1e404ba0d_o_075443e0b38240cd9b55ff269537bc67_master.jpg'),
(557, 'BI013', '1702814188838_tp038---bi013-_19__8e5d8348310741e48649ae329ee3e014_master.jpg'),
(558, 'BI013', '1702814188840_tp038---bi013-_20__790f72cbd3d34a918920b73579e72ea5_master.jpg'),
(559, 'ESBI006', '1702815216156_esbi006-9_95f00d733aba478891e327cea219dafb_master.jpg'),
(560, 'ESBI006', '1702815216161_esbi006-8_efa8504febac44bc85dd73720a522e65_master.jpg'),
(561, 'ESBI006', '1702815216164_esbi006-7_e98b77784d774dc686f70e02e792fa68_master.jpg'),
(562, 'ESBI006', '1702815216168_esbi006-5_cdcf55a55aed4974a2116be589cb2504_master.jpg'),
(563, 'ESBI006', '1702815216171_esbi006-4_a3a684a716104aed8998d0f3dfd393f5_master.jpg'),
(564, 'ESBI006', '1702815216174_esbi006-2_0080bf175388476fa2cb9a7e9f3d728c_master.jpg'),
(565, 'ESBI006', '1702815216177_esbi006-1_405724795b8f4f22867f345eaab26319_master.jpg'),
(601, 'DATB416', '1703435106872_52695476436_cfce895223_o_32bf8a7c12f04f34963103b2b30b3dd0_master.jpg'),
(602, 'DATB416', '1703435106878_untitled_design__1__8e8dab846c1c444385812026eb549eb8_master.jpg'),
(603, 'DATB416', '1703435106881_datb416_e53618f106c54b85a436bd3e7f3025db_master.jpg'),
(604, 'DATB416', '1703435106886_52695741049_ab53170a62_o_d4d8d423351a4330b41d0fc19ade0513_master.jpg'),
(609, 'DWBS012', '1703928526192_bs012-7_52616063791_o_b73fd2ba1d004e6e9b6e00056a74a633_master.jpg'),
(610, 'DWBS012', '1703928526208_bs012-4_52616554758_o_2d13878e693346e18cfb465e5e5d92aa_master.jpg'),
(611, 'DWBS012', '1703928526215_bs012-3_52615554827_o_cdf36ab14e2948ab984bbfe0c18c72ed_master.jpg'),
(612, 'DWBS012', '1703928526222_bs012-2_52616064151_o_3574494468a940998f25c86d6f815504_master.jpg'),
(613, 'DWBS012', '1703928526228_bs012-1_52615553322_o_0d15a75065ed4bf59b9e03ecded5d334_master.jpg'),
(615, 'EWCW007', '1704189991759_ewcw007-5_53a856c3e86b422d975b1323eb87e578_master.jpg'),
(616, 'EWCW007', '1704189991824_ewcw007-4_73d717aacbbb49539e8941f53860fb81_master.jpg'),
(617, 'EWCW007', '1704189991831_ewcw007-3_309fb3d06ea84910af0060f7178ba85c_master.jpg'),
(618, 'EWCW007', '1704189991836_ewcw007-2_91d0cfce3d134bb4b72cc3086067df2f_master.jpg'),
(619, 'EWCW007', '1704189991841_ewcw007-1_c8b1f230ddb2408daa72728d0ecee531_master.jpg'),
(620, 'DWCT001', '1704190979892_ct001_51763349788_o_786e5178773a4a1fb56f1bfee2157e9b_master.jpg'),
(621, 'DWCT001', '1704190979915_ct001_51763349443_o_c46a7b646c5741ca865598fe0249b69b_master.jpg'),
(622, 'DWCT001', '1704190979920_ct001_51762271912_o_1e27b353ce35445b98aa64a0c024c655_master.jpg'),
(623, 'DWCT001', '1704190979924_ct001_51762269147_o_09bc5494840e48feb5ad0b9b16c3d37b_master.jpg'),
(624, 'DWCT001', '1704190979928_ct001_51762266972_o_9bee17ad6de44acca391c7ad9847bf08_master.jpg'),
(625, 'DWCT004', '1704191300141_ct004-5_52410247588_o_e018274348ee4e508c3bcd3e45191163_master.jpg'),
(626, 'DWCT004', '1704191300155_ct004-4_52409234072_o_c1cc144681a64b2da46f4a881600383c_master.jpg'),
(627, 'DWCT004', '1704191300165_ct004-3_52409738056_o_03e4212ea4ec4b85a89193a2233e3f29_master.jpg'),
(628, 'DWCT004', '1704191300171_ct004-13_52409234777_o_e7c882ac09994daaa3ef8a4b92a5614b_master.jpg'),
(629, 'DWCT004', '1704191300176_ct004-2_52410023919_o_fe0e3f9c03f642cf9309596415dc2278_master.jpg'),
(630, 'DWCU007', '1704191606458_20220929_3dshbpb0pecj63dcrkmah5yc_85f0fa938a844dc2a433bc82c3147ad4_master.jpg'),
(631, 'DWCU007', '1704191606465_20220929_eflqusorg4g4ku3umeps5z9r_389f739d70b645d8a1d6a49d9b745c7b_compact.jpg'),
(632, 'EWCL003', '1704250844847_ewcl003-3_53375595102_o_0f63b002aa3c4f57bc06d9ac92da343d_master.jpg'),
(633, 'EWCL003', '1704250844861_ewcl003-2_53376963630_o_d253bb8cf4404fd18f7fb241c31b57eb_master.jpg'),
(634, 'EWCL003', '1704250844866_ewcl003-1_53375595057_o_fbf3267675b14c9780e1db57c53ea93c_master.jpg'),
(635, 'EWCL003', '1704250844871_ewcl003-4_53376696493_o_f4e0d55389724e0cbab7cc411b7e7c0c_master.jpg'),
(636, 'EWCL003', '1704250844877_ewcl003-7_53376839244_o_be698d6fa9ab4f78bf2132679fc67647_master.jpg'),
(637, 'EWCP002', '1704251255788_ewcp002-23_53376842769_o_b7a0db0f11ca48088531456f72fdf5d1_master.jpg'),
(638, 'EWCP002', '1704251255810_ewcp002-21_53376967225_o_c150908e08e04b278de0f946bbe0e0ef_master.jpg'),
(639, 'EWCP002', '1704251255816_ewcp002-20_53376521336_o_8acdf223364e4793aaf2a88c807b1838_master.jpg'),
(640, 'EWCP002', '1704251255819_ewcp002-19_53376967265_o_01a8b7e951684afe9a01377cf739adba_master.jpg'),
(641, 'EWCP002', '1704251255823_ewcp002-22_53376699893_o_cd07acb23daf4c36a173731d6b33d8d3_master.jpg'),
(642, 'EWCP002', '1704251255826_ewcp002-11_53376521661_o_7b2fbf44c1f142a3ba2bc974def12378_master.jpg'),
(643, 'EWCP002', '1704251255829_ewcp002-3_53376520886_o_84a65b23bbfb4c54952d7d289b6e1ea8_master.jpg'),
(644, 'EWCP002', '1704251255834_ewcp002_53375619402_o_d0011756fdc646f79c7a39698e026fb8_master.jpg'),
(645, 'EWCP002', '1704251255837_ewcp002-30_53376967025_o_d452a9fe67ca4f9b9803a72fa15b64fd_master.jpg'),
(646, 'EWBS001', '1704251897974_fds.jpg'),
(647, 'EWBS001', '1704251897979_tw003-bs001-16_53290120977_o_cb4dfe2b55f74902ac3f0f64b38f6938_master.jpg'),
(648, 'EWBS001', '1704251897983_tw003-bs001-15_53291378099_o_66f09820de5a4e4f831b38eea4352fd5_master.jpg'),
(649, 'EWBS001', '1704251897988_tw003-bs001-11_53290121042_o_3786274e4f1c4ab88f1f015c551df7db_master.jpg'),
(650, 'EWBS001', '1704251897992_tw003-bs001-1_53291249648_o_e56244e6c0dc497e81cf8ca94a772493_master.jpg'),
(651, 'EWBS001', '1704251897996_tw003-bs001-2_53291377864_o_a93a2eb880cc4107a3a360378ed056fb_master.jpg'),
(652, 'EWBS001', '1704251898000_tw003-bs001-3_53291377849_o_110158d740fc40de9fceb818bda1132b_master.jpg'),
(653, 'ESTB030', '1704715289463_eatb030-7_782d228809784ac3865f80fc627aca89_master.jpg'),
(654, 'ESTB030', '1704715289509_eatb030-6_aafbbad5453d4849876c636b5e4eaafa_master.jpg'),
(655, 'ESTB030', '1704715289513_eatb030-5_1cfb4bdeccc14e5e8a4bb2d2eb22b2ee_master.jpg'),
(656, 'ESTB030', '1704715289516_eatb030-4_736d2c9b503b4c02abae3f66998470f2_master.jpg'),
(657, 'ESTB030', '1704715289522_eatb030-2_035426c852274f5881fe4cdbe7b7b137_master.jpg'),
(658, 'ESTB030', '1704715289525_eatb030-1_994ff9e272a742e5af8ec9612e29cc73_master.jpg'),
(659, 'ESTB030', '1704715289529_eatb030-8_a93e54fb6b5a467dbeaa6d051fedcab2_master.jpg'),
(660, 'ESTB030', '1704715289535_eatb030-3_f4f3649109194318999a3e984bbd30f3_master.jpg'),
(667, 'BI013', '1707648349107_309472437_1159489334948483_878248476891481358_n.mp4'),
(668, 'EWTW003', '1707657567733_tw003-bs001-7_53291006361_o_23d925c5d5fa4a95a81b830c4d783545_master.jpg'),
(669, 'EWTW003', '1707657567754_tw003-bs001-4_53291249503_o_ef651bccfb984910b8e975fc3ad7beb3_master.jpg'),
(670, 'EWTW003', '1707657567757_tw003-bs001-2_53291377864_o_46e46bd906e8427199e10879f20aeec4_master.jpg'),
(671, 'EWTW003', '1707657567761_tw003-bs001-8_53291006896_o_3d92c51738cc4ce3a9aa8a2200de966c_master.jpg'),
(672, 'EWTW003', '1707657567765_tw003-bs001-5_53291006421_o_4c146c1d885147f3a8b19ce1a8bffbc1_master.jpg'),
(673, 'EWTW003', '1707657567769_tw003-bs001-3_53291377849_o_b80f1bc8d383439fb26263361ce7d0b9_master.jpg'),
(674, 'EWTW003', '1707657567773_tw003-bs001-6_53291471625_o_1f620c3d758e41d696fb128d159744a2_master.jpg'),
(677, 'EWTE003', '1708267758741_ewte003-11_53296667811_o_7264b0c3f1ef468b88b3ce5f020da6c1_master.jpg'),
(678, 'EWTE003', '1708267758748_ewte003-3_53295791637_o_480ba53e2ac94b97a948a4eacabd56ac_master.jpg'),
(679, 'EWTE003', '1708267758753_ewte003-2_53295791657_o_78ef8b9c0744454ebaa261ef2461d146_master.jpg'),
(680, 'EWTE003', '1708267758758_ewte003-4_53297045664_o_0700cdbe5f3342d5a10b2719f03c7ab1_master.jpg'),
(681, 'EWTE003', '1708267758762_ewte003-10_53297045794_o_af9bd1f2fa8246dab498a75b2a976f04_master.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoices`
--

CREATE TABLE `invoices` (
  `invoice_id` varchar(8) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `note` varchar(255) DEFAULT NULL,
  `customer_note` varchar(255) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `invoice_status` int(1) NOT NULL DEFAULT 1,
  `total_price` int(20) DEFAULT 0,
  `shipping_fee` int(11) DEFAULT 0,
  `total_bill` int(20) DEFAULT 0,
  `is_paid` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `invoices`
--

INSERT INTO `invoices` (`invoice_id`, `name`, `phone`, `address`, `created_at`, `note`, `customer_note`, `account_id`, `invoice_status`, `total_price`, `shipping_fee`, `total_bill`, `is_paid`) VALUES
('41ZSPBHA', 'quang anh', '0365151822', '4dvsdsf', '2024-02-25 12:30:37', '', 'd', NULL, 1, 1410000, 0, 1410000, b'0'),
('4LFFMS9V', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 17:31:56', '', 'd', NULL, 1, 50000, 30000, 80000, b'0'),
('56BKIMXY', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 17:36:03', '', 'f', NULL, 1, 990000, 0, 990000, b'0'),
('5CKTNJXP', 'quang anh', '0365151822', '4dvsdsf', '2024-02-18 11:01:34', '', 'd', 1, 1, 990000, 0, 990000, b'1'),
('5FTZ8G2K', 'nguyễn quang anh', '0365151823', 'số 18 ngõ 222 tựu liệt,thanh trì, hà nội', '2024-02-06 16:58:41', '', 'fsd', 4, 4, 1860000, 10000, 1870000, b'1'),
('5J8RUFRZ', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 17:11:44', '', 'fs', NULL, 1, 890000, 0, 890000, b'0'),
('5RH2CLWH', 'quang anh', '0365151822', '4dvsdsf', '2024-02-07 09:07:28', '', 'sa', 1, 1, 1540000, 0, 1540000, b'0'),
('6LU8CYHS', 'nguyễn quang anh', '3651518221', 'số 18 ngõ 222 tựu liệt,thanh trì, hà nội', '2024-02-02 03:30:38', '', 'ss', NULL, 1, 990000, 0, 990000, b'0'),
('6RNPNRVM', 'nguyễn quang anh', '5423324222', 'số 18 ngõ 222 tựu liệt,thanh trì, hà nội', '2024-02-01 13:35:58', '', NULL, 1, 1, NULL, NULL, NULL, b'0'),
('7MOJYIGO', 'vcxvx', '33333', 'fsd', '2024-02-06 18:25:48', '', 'sd', NULL, 1, 2350000, 20000, 2370000, b'0'),
('8XVO3RJ8', 'nguyễn quang anh', '4553333542', 'số 18 ngõ 222 tựu liệt,thanh trì, hà nội', '2024-02-06 16:59:16', '', '', NULL, 1, 990000, 0, 990000, b'1'),
('98ZCL96V', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 18:10:23', '', 'd', NULL, 1, 750000, 0, 750000, b'0'),
('A5K1TOQE', 'gdfgfdg', '3423', 'số 18 ngõ 222 tựu liệt,thanh trì, hà nội', '2024-01-21 16:02:42', '', 'vsd', 1, 2, 3060000, 30000, 3090000, b'0'),
('AEAXIQS0', 'quang anh', '34232', 'ssd', '2024-01-21 16:42:11', '', 'x', NULL, 0, 990000, 0, NULL, b'0'),
('B90AZKP8', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 17:35:18', '', 'f', NULL, 1, 750000, 0, 750000, b'0'),
('BOXLJSBK', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 12:24:54', '', 'sd', NULL, 1, 480000, 30000, 510000, b'0'),
('CDJBJ419', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 18:08:30', '', 'd', NULL, 1, 750000, 0, 750000, b'0'),
('CK0I8M9L', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 18:04:16', '', 'a', NULL, 1, 750000, 0, 750000, b'0'),
('CK2RNNXU', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 15:22:36', '', 'd', NULL, 1, 990000, 0, 990000, b'0'),
('CQK0DVXD', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 18:02:44', '', 's', NULL, 1, 990000, 0, 990000, b'0'),
('CYFRIM6O', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 16:14:22', '', 's', NULL, 1, 420000, 30000, 450000, b'0'),
('DMJHRKWM', 'nguyễn quang anh', '3222232', 'số 18 ngõ 222 tựu liệt,thanh trì, hà nội', '2024-01-29 07:06:42', '', 'cs', NULL, 1, 580000, 0, 580000, b'0'),
('EAEUPXUE', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 15:23:40', '', 's', NULL, 1, 990000, 0, 990000, b'0'),
('EIIMQTNF', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 17:53:16', '', 'd', NULL, 1, 400000, 30000, 430000, b'0'),
('EXAWZYY2', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 15:41:14', '', 's', NULL, 1, 990000, 0, 990000, b'0'),
('EYCDR8PC', 'nguyễn quang anh', '365151822', 'số 18 ngõ 222 tựu liệt,thanh trì, hà nội', '2024-02-06 12:39:32', '                        fsd', NULL, 1, 1, 0, 0, 580000, b'0'),
('GB4ENHC1', 'nguyễn quang anh', '365151822', 'số 18 ngõ 222 tựu liệt,thanh trì, hà nội', '2024-01-21 16:42:11', '', 'dfs', NULL, 0, 1980000, 0, 1980000, b'0'),
('GCRM2OC5', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 13:46:00', '', 'sd', NULL, 1, NULL, 30000, 380000, b'0'),
('GGTWEEBJ', 'quang anh', '0365151822', '4dvsdsf', '2024-02-12 18:45:34', '', 'd', NULL, 1, 200000, 30000, 230000, b'1'),
('GQ9U9AXK', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 13:38:56', '', 'fd', NULL, 1, 380000, NULL, NULL, b'0'),
('GWW0LOZ8', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 18:52:29', '', 'v', NULL, 1, 750000, 0, 750000, b'0'),
('I1TWS5QJ', 'quang anh', '423432', 'sdf', '2024-01-21 09:18:55', '', 'sd', 1, 1, 550000, 0, NULL, b'0'),
('I8XDEQJH', 'nguyễn quang anh', '365151822', 'số 18 ngõ 222 tựu liệt,thanh trì, hà nội', '2024-01-21 16:36:57', '', 'sd', 1, 2, 598000, 0, 598000, b'0'),
('IS8THSPA', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 16:21:26', '', 'd', 1, 1, 100000, 30000, 130000, b'0'),
('JDIVW1PL', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 16:09:54', '', 's', NULL, 1, 500000, 0, 500000, b'0'),
('JFFE99ZQ', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 14:31:15', '', 'fd', 1, 1, 1250000, 0, 1250000, b'0'),
('KT9P9ZMY', 'nguyễn quang anh', '365151822', 'số 18 ngõ 222 tựu liệt,thanh trì, hà nội', '2024-01-21 10:11:15', '', 'dsf', NULL, 1, 4040000, 20000, 4060000, b'0'),
('KYGSBUBG', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 17:49:38', '', 'd', NULL, 1, 500000, 0, 500000, b'0'),
('LUW8V8TY', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 17:36:40', '', 'd', NULL, 1, 750000, 0, 750000, b'0'),
('MDXPM23G', 'quang anh', '0365151822', '4dvsdsf', '2024-02-18 09:32:37', 'cvs', NULL, 1, 1, 760000, 10000, 770000, b'0'),
('MSFDUEXY', 'nguyễn quang anh', '365151822', 'số 18 ngõ 222 tựu liệt,thanh trì, hà nội', '2024-01-22 05:29:08', '', 'sd', 1, 1, 840000, 0, 840000, b'0'),
('MVNWRADX', 'nhanvien1', '365151822', 'số 18 ngõ 222 tựu liệt,thanh trì, hà nội', '2024-01-26 03:14:41', '                        ', NULL, 2, 5, NULL, NULL, NULL, b'0'),
('N6VKCD4X', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 17:54:59', '', 's', NULL, 1, 750000, 0, 750000, b'0'),
('NV7CM7AY', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 17:11:23', '', 'gh', NULL, 1, 750000, 0, 750000, b'0'),
('OCFAOWMB', 'fsdfsd', '333333', 'vd', '2024-01-21 09:45:14', '', 'd', 1, 1, 1380000, 30000, 1410000, b'0'),
('OUFWELJT', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 13:38:23', '', '', NULL, 1, 990000, NULL, NULL, b'0'),
('PPKY3TZA', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 18:11:02', '', 'g', NULL, 1, 990000, 0, 990000, b'0'),
('QIPTDMTO', 'nguyễn quang anh', '5342423432', 'số 18 ngõ 222 tựu liệt,thanh trì, hà nội', '2024-01-29 13:15:40', '', '', NULL, 1, 990000, NULL, NULL, b'0'),
('QUZEPN5K', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 17:57:07', '', 'd', NULL, 1, 750000, 0, 750000, b'0'),
('ROSWZNSR', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 13:47:21', '', 'sd', NULL, 1, 380000, 30000, 410000, b'0'),
('S9BQOPOP', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 17:26:23', '', 'f', NULL, 1, 750000, 0, 750000, b'0'),
('SGVWGKLQ', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 15:22:22', '', 'd', NULL, 1, 990000, 0, 990000, b'0'),
('SMMKHRU1', 'dfsd', '222222', 'sdf', '2024-01-21 09:17:25', '', 'fds', NULL, 1, 400000, 30000, 430000, b'0'),
('SNGWGR4V', 'quang anh', '0365151822', '4dvsdsf', '2024-02-08 15:38:43', '', 'd', 1, 1, 750000, 0, 750000, b'0'),
('SRXO1SSG', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 17:33:37', '', 'h', NULL, 1, 400000, 30000, 430000, b'0'),
('T1VCKYYG', 'sser', '44343', 'f', '2024-01-26 03:23:12', 'dfs', NULL, 2, 3, NULL, NULL, NULL, b'0'),
('TFWOAP9I', 'nguyễn quang anh', '4343222342', 'số 18 ngõ 222 tựu liệt,thanh trì, hà nội', '2024-01-29 13:12:12', '', '', NULL, 1, 500000, NULL, NULL, b'0'),
('TGPIGVXB', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 17:16:29', '', 'd', NULL, 1, 990000, 0, 990000, b'0'),
('TLSY7TFT', 'dfgdf', '323233232', 'fds', '2024-01-20 08:38:59', '', 'f', NULL, 1, 750000, 0, 750000, b'0'),
('U0F7TYG1', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 17:12:03', '', 'vs', NULL, 1, 890000, 0, 890000, b'0'),
('U7DZUREO', 'quang anh', '0365151822', '4dvsdsf', '2024-02-08 15:39:21', '', 'gd', 1, 1, 500000, 0, 500000, b'0'),
('UAEZV8YX', 'gdfgfdg', '3423', 'số 18 ngõ 222 tựu liệt,thanh trì, hà nội', '2024-01-20 08:24:41', '', 'vsd', 1, 1, 550000, 30000, 410000, b'0'),
('UAGHYL6A', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 17:44:28', '', 'd', NULL, 1, 750000, 0, 750000, b'0'),
('UZZHM3TR', 'nguyễn quang anh', '333322323', 'số 18 ngõ 222 tựu liệt,thanh trì, hà nội', '2024-01-20 08:28:41', '', 'fs', NULL, 1, 480000, 30000, 510000, b'0'),
('V2PBUUIU', 'quang anh', '2313121312', '4dvsdsf', '2024-02-18 09:37:22', '', NULL, 1, 1, NULL, 0, NULL, b'0'),
('VAZZJUMT', 'nguyễn quang anh', '3651518222', 'số 18 ngõ 222 tựu liệt,thanh trì, hà nội', '2024-01-29 13:22:28', '', 'zcx', NULL, 1, 990000, NULL, NULL, b'0'),
('VWQKIORR', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 18:01:00', '', 's', NULL, 1, 750000, 0, 750000, b'0'),
('WDVTINII', 'quang anh', '0365151822', '4dvsdsf', '2024-02-08 15:37:52', '', 'sda', 1, 1, 1250000, 0, 1250000, b'0'),
('WVHNNQAC', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 13:28:02', '', 'gfd', NULL, 1, 500000, 999999, 1499999, b'0'),
('X6JPOCJH', 'sdgsd', '345234532', 'cxgdf', '2024-01-21 10:22:04', '', 'df', NULL, 1, 1980000, 0, 1980000, b'0'),
('XNLM5KBW', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 17:26:42', '', 'f', NULL, 1, 750000, 0, 750000, b'0'),
('XRAPWYJI', 'quang anh', '4534543', 'fđ', '2024-01-21 10:02:57', '', 'dgf', 1, 1, 990000, 0, NULL, b'0'),
('YFJBR6YE', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 18:55:09', '', 'vd', NULL, 1, 333333, 0, 333333, b'0'),
('YHNB0POU', 'dsfds', '2312312', 'f', '2024-01-20 08:48:58', '', 's', NULL, 1, 420000, 30000, 450000, b'0'),
('YIFBIIM3', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 17:32:38', '', 's', NULL, 1, 990000, 0, 990000, b'0'),
('YK68ZX7R', 'nguyễn quang anh', '3432224222', 'số 18 ngõ 222 tựu liệt,thanh trì, hà nội', '2024-01-29 12:53:51', '', '', 1, 1, 990000, 0, 990000, b'0'),
('YTNKBIKE', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 18:02:44', '', 's', NULL, 1, 990000, 0, 990000, b'0'),
('YZSGNG1E', 'quang anh', '0365151822', '4dvsdsf', '2024-02-06 16:53:24', '', 'd', 1, 1, 750000, 0, 750000, b'0'),
('ZUI23NIT', 'nguyễn quang anh', '36515182222', 'số 18 ngõ 222 tựu liệt,thanh trì, hà nội', '2024-01-20 07:42:26', '                        dsf', NULL, 1, 1, 290000, 20000, 890000, b'0');

--
-- Bẫy `invoices`
--
DELIMITER $$
CREATE TRIGGER `after_invoice_history_insert` BEFORE INSERT ON `invoices` FOR EACH ROW BEGIN
	DECLARE content VARCHAR(255);
    DECLARE invoice_id VARCHAR(25);
    DECLARE account_name VARCHAR(25);
    
    SET account_name = COALESCE((SELECT accounts.user_name FROM accounts WHERE account_id = NEW.account_id), 'Hệ thống');
    SET invoice_id = NEW.invoice_id;
    
    SET content = CONCAT(@current_user , ' đã tạo đơn hàng: <br>Mã đơn: ', NEW.invoice_id, ',<br>Tên khách hàng: ', NEW.name, ',<br>Số điện thoại: ', NEW.phone, ',<br>Địa chỉ: ', NEW.address,',<br>Ghi chú: ', NEW.note,',<br>Nguồn:  ',account_name);
    
	INSERT INTO History (invoice_id,content) VALUES (invoice_id,content);
   
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_invoice_history_update` BEFORE UPDATE ON `invoices` FOR EACH ROW BEGIN
	DECLARE content VARCHAR(255);
    DECLARE invoice_id VARCHAR(25);
    DECLARE old_status VARCHAR(25);
    DECLARE new_status VARCHAR(25);
    DECLARE old_account VARCHAR(25);
    DECLARE new_account VARCHAR(25);
       
    SET old_account = (SELECT accounts.user_name FROM accounts WHERE account_id = OLD.account_id);
    SET new_account = (SELECT accounts.user_name FROM accounts WHERE account_id = NEW.account_id);
    SET invoice_id = NEW.invoice_id;
     SET old_status = (SELECT invoices_status.status FROM invoices_status WHERE status_id = OLD.invoice_status);
    SET new_status = (SELECT invoices_status.status FROM invoices_status WHERE status_id = NEW.invoice_status);
    
	IF NEW.name != OLD.name THEN
        SET content = CONCAT(@current_user , ' đã thay đổi Tên khách hàng: ', OLD.name, ' -> ', NEW.name);
        INSERT INTO history (invoice_id,content) VALUES (invoice_id,content);
    END IF;
    
    IF NEW.phone != OLD.phone THEN
        SET content = CONCAT(@current_user ,' đã thay đổi Số điện thoại: ', OLD.phone, ' -> ', NEW.phone);
        INSERT INTO history (invoice_id,content) VALUES (invoice_id,content);
    END IF;
    
    IF NEW.address != OLD.address THEN
        SET content = CONCAT(@current_user , ' đã thay đổi Địa chỉ: ', OLD.address, ' -> ', NEW.address);
        INSERT INTO history (invoice_id,content) VALUES (invoice_id,content);
    END IF;
    
    IF NEW.note != OLD.note THEN
        SET content = CONCAT(@current_user , ' đã thay đổi Ghi chú: ', OLD.note, ' -> ', NEW.note);
        INSERT INTO history (invoice_id,content) VALUES (invoice_id,content);
    END IF;
    
    IF NEW.invoice_status != OLD.invoice_status THEN
        SET content = CONCAT(@current_user , ' đã thay đổi Trạng thái đơn hàng: ', old_status , ' -> ', new_status);
        INSERT INTO history (invoice_id,content) VALUES (invoice_id,content);
    END IF;
    
    IF NEW.account_id != OLD.account_id THEN
        SET content = CONCAT(@current_user , ' đã thay đổi Nguồn tạo đơn hàng: ', old_account , ' -> ', new_account);
        INSERT INTO history (invoice_id,content) VALUES (invoice_id,content);
    END IF;
    
    IF NEW.shipping_fee != OLD.shipping_fee THEN
    SET content = CONCAT(@current_user , ' đã thay đổi Phí ship: ', OLD.shipping_fee, ' -> ', NEW.shipping_fee);
    
    INSERT INTO history (invoice_id,content) VALUES (invoice_id,content);
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_ship` BEFORE INSERT ON `invoices` FOR EACH ROW BEGIN
SET NEW.total_bill = NEW.total_price + NEW.shipping_fee;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_ship` BEFORE UPDATE ON `invoices` FOR EACH ROW BEGIN
IF NEW.shipping_fee != OLD.shipping_fee
THEN
SET NEW.total_bill = NEW.total_price + NEW.shipping_fee;
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
  `total_price` int(20) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `invoices_detail`
--

INSERT INTO `invoices_detail` (`detail_id`, `invoice_id`, `product_detail_id`, `price`, `quantity`, `total_price`) VALUES
(230, 'EYCDR8PC', 190, 290000, 1, 290000),
(231, 'ZUI23NIT', 190, 290000, 1, 290000),
(232, 'MSFDUEXY', 198, 420000, 2, 840000),
(233, 'I8XDEQJH', 671, 299000, 2, 598000),
(234, 'A5K1TOQE', 16, 380000, 2, 760000),
(235, 'EYCDR8PC', 191, 290000, 1, 290000),
(236, 'UAEZV8YX', 527, 550000, 1, 550000),
(237, 'OCFAOWMB', 33, 420000, 1, 420000),
(238, 'UZZHM3TR', 503, 480000, 1, 480000),
(239, 'TLSY7TFT', 697, 750000, 1, 750000),
(240, 'SMMKHRU1', 60, 400000, 1, 400000),
(241, 'YHNB0POU', 86, 420000, 1, 420000),
(242, 'GB4ENHC1', 691, 990000, 2, 1980000),
(244, 'KT9P9ZMY', 697, 750000, 2, 1500000),
(246, '7MOJYIGO', 191, 290000, 2, 580000),
(247, '7MOJYIGO', 192, 290000, 1, 290000),
(248, '7MOJYIGO', 614, 380000, 1, 380000),
(249, '7MOJYIGO', 533, 550000, 1, 550000),
(251, 'KT9P9ZMY', 527, 550000, 2, 1100000),
(252, 'I1TWS5QJ', 691, 990000, 1, 990000),
(253, 'I1TWS5QJ', 527, 550000, 1, 550000),
(254, 'OCFAOWMB', 442, 480000, 1, 480000),
(256, 'XRAPWYJI', 691, 990000, 1, 990000),
(260, 'KT9P9ZMY', 442, 480000, 2, 960000),
(261, 'KT9P9ZMY', 443, 480000, 1, 480000),
(262, 'AEAXIQS0', 691, 990000, 1, 990000),
(263, 'X6JPOCJH', 691, 990000, 2, 1980000),
(272, 'A5K1TOQE', 442, 480000, 4, 1920000),
(274, 'A5K1TOQE', 614, 380000, 1, 380000),
(365, '5FTZ8G2K', 614, 380000, 2, 760000),
(368, '5FTZ8G2K', 541, 550000, 1, 550000),
(369, '5FTZ8G2K', 542, 550000, 1, 550000),
(370, 'DMJHRKWM', 190, 290000, 1, 290000),
(371, 'DMJHRKWM', 191, 290000, 1, 290000),
(372, 'YK68ZX7R', 691, 990000, 1, 990000),
(373, 'TFWOAP9I', 522, 500000, 1, 500000),
(374, 'QIPTDMTO', 691, 990000, 1, 990000),
(375, '6LU8CYHS', 691, 990000, 1, 990000),
(376, 'VAZZJUMT', 691, 990000, 1, 990000),
(377, '8XVO3RJ8', 691, 990000, 1, 990000),
(379, 'BOXLJSBK', 502, 480000, 1, 480000),
(380, 'WVHNNQAC', 522, 500000, 1, 500000),
(381, 'OUFWELJT', 691, 990000, 1, 990000),
(382, 'GQ9U9AXK', 16, 380000, 1, 380000),
(383, 'GCRM2OC5', 573, 350000, 1, 350000),
(384, 'ROSWZNSR', 16, 380000, 1, 380000),
(385, 'JFFE99ZQ', 697, 750000, 1, 750000),
(386, 'JFFE99ZQ', 522, 500000, 1, 500000),
(387, '5RH2CLWH', 691, 990000, 1, 990000),
(388, 'YZSGNG1E', 709, 750000, 1, 750000),
(389, '41ZSPBHA', 692, 990000, 1, 990000),
(390, 'SGVWGKLQ', 691, 990000, 1, 990000),
(391, 'CK2RNNXU', 691, 990000, 1, 990000),
(392, 'EAEUPXUE', 691, 990000, 1, 990000),
(393, 'EXAWZYY2', 691, 990000, 1, 990000),
(394, 'JDIVW1PL', 252, 500000, 1, 500000),
(395, 'CYFRIM6O', 85, 420000, 1, 420000),
(396, 'IS8THSPA', 687, 50000, 2, 100000),
(398, 'NV7CM7AY', 697, 750000, 1, 750000),
(399, '5J8RUFRZ', 713, 890000, 1, 890000),
(400, 'U0F7TYG1', 713, 890000, 1, 890000),
(401, 'TGPIGVXB', 691, 990000, 1, 990000),
(402, 'S9BQOPOP', 709, 750000, 1, 750000),
(403, 'XNLM5KBW', 709, 750000, 1, 750000),
(404, '4LFFMS9V', 687, 50000, 1, 50000),
(405, 'YIFBIIM3', 691, 990000, 1, 990000),
(406, 'SRXO1SSG', 729, 400000, 1, 400000),
(407, 'B90AZKP8', 709, 750000, 1, 750000),
(408, '56BKIMXY', 691, 990000, 1, 990000),
(409, 'LUW8V8TY', 709, 750000, 1, 750000),
(410, 'UAGHYL6A', 709, 750000, 1, 750000),
(411, 'KYGSBUBG', 522, 500000, 1, 500000),
(412, 'EIIMQTNF', 729, 400000, 1, 400000),
(413, 'N6VKCD4X', 697, 750000, 1, 750000),
(414, 'QUZEPN5K', 709, 750000, 1, 750000),
(415, 'VWQKIORR', 709, 750000, 1, 750000),
(416, 'CQK0DVXD', 691, 990000, 1, 990000),
(417, 'YTNKBIKE', 691, 990000, 1, 990000),
(418, 'CK0I8M9L', 709, 750000, 1, 750000),
(419, 'CDJBJ419', 697, 750000, 1, 750000),
(420, '98ZCL96V', 697, 750000, 1, 750000),
(421, 'PPKY3TZA', 691, 990000, 1, 990000),
(422, 'YFJBR6YE', 46, 333333, 1, 333333),
(423, 'GWW0LOZ8', 697, 750000, 1, 750000),
(424, '5RH2CLWH', 527, 550000, 1, 550000),
(425, '41ZSPBHA', 82, 420000, 1, 420000),
(426, 'WDVTINII', 697, 750000, 1, 750000),
(427, 'WDVTINII', 522, 500000, 1, 500000),
(428, 'SNGWGR4V', 697, 750000, 1, 750000),
(429, 'U7DZUREO', 522, 500000, 1, 500000),
(430, 'GGTWEEBJ', 4, 200000, 1, 200000),
(432, 'MDXPM23G', 620, 380000, 2, 760000),
(433, '5CKTNJXP', 695, 990000, 1, 990000);

--
-- Bẫy `invoices_detail`
--
DELIMITER $$
CREATE TRIGGER `after_invoiceDetail_delete` BEFORE DELETE ON `invoices_detail` FOR EACH ROW BEGIN
	DECLARE content VARCHAR(255);
	DECLARE product_code VARCHAR(255);
    DECLARE invoice_id VARCHAR(25);
    SET invoice_id = OLD.invoice_id;
    SET product_code = (SELECT products_detail.code FROM products_detail WHERE product_detail_id = OLD.product_detail_id);
    
    SET content = CONCAT(@current_user, ' đã xóa sản phẩm: ',product_code,' (giá = ',OLD.price,')');

    INSERT INTO History (invoice_id,content) VALUES (invoice_id,content);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_invoiceDetail_insert` BEFORE INSERT ON `invoices_detail` FOR EACH ROW BEGIN
	DECLARE content VARCHAR(255);
	DECLARE product_code VARCHAR(255);
	DECLARE invoice_id VARCHAR(25);
    SET invoice_id = NEW.invoice_id;
	
    SET product_code = (SELECT products_detail.code FROM products_detail WHERE product_detail_id = NEW.product_detail_id);
    
    SET content = CONCAT(@current_user, ' đã thêm sản phẩm: ',product_code,' (giá = ',NEW.price,')');

    INSERT INTO History (invoice_id,content) VALUES (invoice_id,content);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_invoiceDetail_update` BEFORE UPDATE ON `invoices_detail` FOR EACH ROW BEGIN
	DECLARE content VARCHAR(255);
    DECLARE product_code VARCHAR(255);
    DECLARE invoice_id VARCHAR(25);
    SET invoice_id = NEW.invoice_id;
    SET product_code = (SELECT products_detail.code FROM products_detail WHERE product_detail_id = NEW.product_detail_id);
    
	IF NEW.quantity != OLD.quantity THEN
    SET content = CONCAT( ' đã thay đổi Số lượng (', product_code,') :' , OLD.quantity, ' -> ', NEW.quantity);
    
    INSERT INTO history (invoice_id,content) VALUES (invoice_id,content);
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `delete_invoice_detail` AFTER DELETE ON `invoices_detail` FOR EACH ROW BEGIN
    UPDATE invoices
    SET total_price = (
        SELECT SUM(total_price)
        FROM invoices_detail
        WHERE invoice_id = OLD.invoice_id
    )
    WHERE invoice_id = OLD.invoice_id;
    
    UPDATE invoices
    SET total_bill = total_price + shipping_fee
    WHERE invoice_id = OLD.invoice_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert` BEFORE INSERT ON `invoices_detail` FOR EACH ROW BEGIN
	SET NEW.total_price = NEW.price * NEW.quantity;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_invoice_detail` AFTER INSERT ON `invoices_detail` FOR EACH ROW BEGIN
    UPDATE invoices
    SET total_price = (
        SELECT SUM(total_price)
        FROM invoices_detail
        WHERE invoice_id = NEW.invoice_id
    )
    WHERE invoice_id = NEW.invoice_id;
    
    UPDATE invoices
    SET total_bill = total_price + shipping_fee
    WHERE invoice_id = NEW.invoice_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update` BEFORE UPDATE ON `invoices_detail` FOR EACH ROW BEGIN
    -- Update the totalPrice in invoice_detail
    SET NEW.total_price = NEW.price * NEW.quantity;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_invoice_detail` AFTER UPDATE ON `invoices_detail` FOR EACH ROW BEGIN
    UPDATE invoices
    SET total_price = (
        SELECT SUM(total_price)
        FROM invoices_detail
        WHERE invoice_id = NEW.invoice_id
    )
    WHERE invoice_id = NEW.invoice_id;
    
    UPDATE invoices
    SET total_bill = total_price + shipping_fee
    WHERE invoice_id = NEW.invoice_id;
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
  `total_size` int(11) DEFAULT 0,
  `total_color` int(11) DEFAULT 0,
  `image_background` varchar(255) DEFAULT 'no_image.jpg',
  `image_choose_size` varchar(255) DEFAULT 'no_image.jpg',
  `is_product_active` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `cat_id`, `price`, `discount_price`, `discount_percent`, `is_discount`, `brand`, `description`, `total_size`, `total_color`, `image_background`, `image_choose_size`, `is_product_active`) VALUES
('BI013', 'Quần short đũi phối chun eo BI013', 'SD', 380000, NULL, NULL, b'0', 'TORANO', '', 5, 6, '1707648349107_309472437_1159489334948483_878248476891481358_n.mp4', 'tagsize_4_img', b'1'),
('CABJ003', 'Quần Jeans rách Slim CABJ003', 'QJR', 550000, NULL, NULL, b'0', 'TORANO', 'Quần Jeans rách Slim CABJ003\r\n', 5, 1, '1702810774291_cabj003_75aa0eb2e3ef4d7cb175dcef6ceae9cf_master.jpg', 'tagsize_4_img', b'1'),
('DABJ004', 'Quần Jeans basic Slim DABJ004', 'QJB', 550000, NULL, NULL, b'0', 'TORANO', 'Quần Jeans basic Slim CABJ004/2\r\n', 5, 1, '1702810004163_52706071935_8966d1e12f_o_a66489be76c949d791609a08ca73993f_master.jpg', 'tagsize_4_img', b'1'),
('DABJ010', 'Quần Jeans basic Slim DABJ010', 'QJB', 550000, NULL, NULL, b'0', 'TORANO', 'Quần Jeans basic Slim CABJ010/2', 5, 1, '1702810256808_52169110354_87bd6ccaa0_o_abf9f4cabd204376b1d1cba50d2deec9_master.jpg', 'tagsize_4_img', b'1'),
('DABJ903', 'Quần Jeans basic Slim DABJ903', 'QJB', 550000, NULL, NULL, b'0', 'TORANO', 'Quần Jeans basic Slim DABJ903\r\n', 5, 1, '1702810455348_dabj903_bf925f25f2c244aeb43a9c4430f64ef8_master.jpg', 'tagsize_4_img', b'1'),
('DABJ904', 'Quần Jeans rách Slim DABJ904', 'QJR', 550000, NULL, NULL, b'0', 'TORANO', 'Quần Jeans rách Slim DABJ904\r\n', 5, 1, '1702810960863_20230209_2nqi04eclesynryo_614790fe9b5a479095c6726ef90f2df7_master.jpg', 'tagsize_4_img', b'1'),
('DABJ908', 'Quần Jeans rách Slim 1.DABJ908', 'QJR', 550000, NULL, NULL, b'0', 'TORANO', '', 5, 1, '1702810648513_bj908-2_53198051989_o_d8c0aeb3be18470c95b4e19e4481b38d_master.jpg', 'tagsize_4_img', b'1'),
('DABK906', 'Quần kaki dài basic cạp tender túi lé DABK906', 'QKB', 500000, NULL, NULL, b'0', 'TORANO', '', 5, 4, '1702808414194_dabk906-1_6be1255f7e6b427094e410388cb5f6a1_master.jpg', 'tagsize_4_img', b'1'),
('DABK908', 'Quần kaki dài basic DABK908', 'QKB', 500000, NULL, NULL, b'0', 'TORANO', '', 5, 4, '1702808850360_tp038---bk908-_20__de063447c1d34cf0a62c34b18ed2ffe6_master.jpg', 'tagsize_4_img', b'1'),
('DATB416', 'Sơ mi dài tay kẻ Checkerboard 2.DATB416', 'SMK', 480000, NULL, NULL, b'0', 'TORANO', '', 5, 1, '1703435106886_52695741049_ab53170a62_o_d4d8d423351a4330b41d0fc19ade0513_master.jpg', 'tagsize_2_img.jpeg', b'1'),
('DATB614', 'Áo sơ mi dài tay trơn Bamboo 4.DATB614', 'SMT', 450000, NULL, NULL, b'0', 'TORANO', '', 5, 4, '1702806015791_52660278521_2f6709e709_o_5d182bb3af21461d92187ab883f3e1db_master.jpg', 'tagsize_2_img.jpeg', b'1'),
('DATB920', 'Áo sơ mi dài tay trơn Bamboo 4.DATB920', 'SMT', 42000, NULL, NULL, b'0', 'TORANO', '', 5, 4, '1702806426640_untitled_design__5__5744f2809b2c4d3499ef8f70899e3c18_master.jpg', 'tagsize_2_img.jpeg', b'1'),
('DSTP611', 'Áo polo trơn bo kẻ DSTP611', 'PLBK', 333333, NULL, NULL, b'0', 'Torano', '', 4, 1, 'tp611_59ea616328234a9b969ce2d1c48c482f_master.jpg', 'size-polo.jpeg', b'1'),
('DSTP650', 'Áo Polo monogram TRN DSTP650', 'PLHT', 450000, NULL, NULL, b'0', 'TORANO', 'Áo Polo monogram TRN 1.DSTP650', 4, 1, 'tp650---bi801-_7__abbb944d2018481c829e959580b99514_master.jpg', 'size-polo.jpeg', b'1'),
('DSTP903', 'Áo polo can phối Horizontal Color Scheme DSTP903', 'PLCP', 420000, 290000, 31, b'1', 'TORANO', '', 4, 2, 'dstp903_52866905251_o_735380510ed1481090a9d817d712432b_master.jpg', 'size-polo.jpeg', b'1'),
('DWBS012', 'Quần nỉ trơn Basic 4.DWBS012', 'QN', 380000, 299000, 21, b'1', 'TORANO', '', 4, 3, '1703928526228_bs012-1_52615553322_o_0d15a75065ed4bf59b9e03ecded5d334_master.jpg', 'tagsize_4_img.jpg', b'1'),
('DWCT001', 'Áo khoác 2 lớp dạ cổ bomber 3.DWCT001', 'AK', 990000, NULL, NULL, b'0', 'TORANO', '', 4, 2, '1704190979928_ct001_51762266972_o_9bee17ad6de44acca391c7ad9847bf08_master.jpg', 'tagsize_5_img.jpeg', b'1'),
('DWCT004', 'Áo khoác 2 lớp dạ cổ cao 2.DWCT004', 'AK', 750000, NULL, NULL, b'0', 'TORANO', '', 4, 2, '1704191300171_ct004-13_52409234777_o_e7c882ac09994daaa3ef8a4b92a5614b_master.jpg', 'tagsize_5_img.jpeg', b'1'),
('DWCU007', 'Áo khoác 2 lớp lót lông cổ bomber 2.DWCU007', 'AK', 750000, NULL, NULL, b'0', 'TORANO', '', 4, 2, '1704191606458_20220929_3dshbpb0pecj63dcrkmah5yc_85f0fa938a844dc2a433bc82c3147ad4_master.jpg', 'tagsize_5_img.jpeg', b'1'),
('EABT019', 'Quần âu slim-fit cạp trơn EABT019', 'QAPTC', 500000, NULL, NULL, b'0', 'TORANO', '', 5, 4, '1702809800334_tb041---bt019-_14__13addb6f4b634d3bb1df83649ff1fdde_master.jpg', 'tagsize_3_img.jpeg', b'1'),
('EABT021', 'Quần âu slim-fit điều chỉnh cạp trơn 1.EABT021', 'QAPTC', 480000, NULL, NULL, b'0', 'TORANO', '', 5, 1, '1702809333060_eabt021-4_52951993446_o_0d23aa6812b3462cb69bdc6b19240434_master.jpg', 'tagsize_3_img.jpeg', b'1'),
('EATB003', 'Sơ mi dài tay kẻ Checkerboard 3.EATB003', 'SMK', 520000, NULL, NULL, b'0', 'TORANO', '', 5, 3, '1702807767115_eatb003-1_4b6bae1705b84deabfa237c94373b36e_master.jpg', 'tagsize_2_img.jpeg', b'1'),
('EATB006', 'Sơ mi dài tay đũi 5.EATB006', 'SMD', 480000, NULL, NULL, b'0', 'TORANO', 'Sơ mi dài tay nam vải đũi cao cấp thấm hút mồ hôi và thoáng mát\r\n', 5, 4, '1702806927321_eatb006-1_802efda9723841d59eb56fabb46d7b22_master.jpg', 'tagsize_2_img.jpeg', b'1'),
('ESBI006', 'Quần short đũi basic phối dây dệt gấu quần ESBI006', 'SD', 380000, NULL, NULL, b'0', 'TORANO', 'Quần short đũi nam basic phối dây dệt gấu quần. Chất đũi cao cấp mềm mịn, không bai xù và hạn chế nhăn nhàu. Vải thoáng mát thấm hút mồ hôi tốt và nhanh khô.\r\n', 5, 5, '1702815216177_esbi006-1_405724795b8f4f22867f345eaab26319_master.jpg', 'tagsize_4_img', b'1'),
('ESBK002', 'Quần short kaki basic, gấp LV bọc viền dây dệt sườn ESBK002', 'SKK', 380000, NULL, NULL, b'0', 'TORANO', '', 5, 4, '1702813549148_52933853176_7967f42e52_o_208bdabebdb14986a84a5ed6be961474_master.jpg', 'tagsize_4_img', b'1'),
('ESBK007', 'Quần short kaki phối chun cạp 3.ESBK007', 'SKK', 400000, NULL, NULL, b'0', 'TORANO', '', 5, 3, '1702812911838_b_d29e6bdf78d04be1aa1575b44e69b2fb_master.jpg', 'tagsize_4_img', b'1'),
('ESBW004', 'Quần short gió cạp thường vải hiệu ứng 3.ESBW004', 'SG', 350000, NULL, NULL, b'0', 'TORANO', '', 4, 3, '1702812478091_esbw004-12_52899473574_o_36fe3a92153a417b89b69bf2ce2d1490_master.jpg', 'tagsize_4_img', b'1'),
('ESBW005', 'Short gió cạp phối chun, in logo mép quần 2.ESBW005', 'SG', 320000, NULL, NULL, b'0', 'TORANO', '', 4, 2, '1702812110775_4268bd5eeb3e637ed3b_master.jpg', 'tagsize_4_img', b'1'),
('ESTA003', 'Áo tanktop in họa tiết Tents 2. ESTA003', 'TT', 300000, NULL, NULL, b'0', 'TORANO', '', 4, 2, '1702701667271_eata003-1_c8e90efa55944401946efba4f0ae02bf_master.jpg', 'size-polo.jpeg', b'1'),
('ESTA005', 'Áo Tanktop họa tiết in Wild Sool 1.ESTA005', 'TT', 250000, NULL, NULL, b'0', 'TORANO', '', 4, 1, '1702702646831_eata005-2_ef46f711d4734ba6a8be08d07f8f3567_master.jpg', 'size-polo.jpeg', b'1'),
('ESTA006', 'Áo tanktop họa tiết in Shoes ESTA006', 'TT', 250000, NULL, NULL, b'0', 'TORANO', '', 4, 1, '1702700896477_esta006-1_2a8dce82b88d4fd798c0434cf9bed833_master.jpg', 'size-polo.jpeg', b'1'),
('ESTA010', 'Áo Tanktop họa tiết Defeat ESTA010', 'TT', 250000, NULL, NULL, b'0', 'TORANO', 'Áo tanktop nam cá tính, năng động mặc cực thoải mái. Mẫu áo ba lỗ nam trẻ trung với 2 màu dễ mặc.\r\n', 4, 1, '1702537484269_esta010-1_ad9f734ad81a4f339a557960d10dd7f5_master.jpg', 'size-polo.jpeg', b'1'),
('ESTB026', 'Sơ mi ngắn tay đũi ESTB026', 'SMD', 450000, NULL, NULL, b'0', 'TORANO', '', 6, 5, '1702803942386_estb026-11_52822828632_o_fb5c8442ec4146618cca5021c9f98643_master.jpg', 'tagsize_2_img.jpeg', b'1'),
('ESTB030', 'Sơ mi ngắn tay trơn Bamboo ESTB030', 'SMT', 400000, NULL, NULL, b'0', 'TORANO', '', 5, 2, '1704715289535_eatb030-3_f4f3649109194318999a3e984bbd30f3_master.jpg', 'tagsize_2_img.jpeg', b'1'),
('ESTP001', 'Áo polo họa tiết in tràn ESTP001', 'PLHT', 420000, NULL, NULL, b'0', 'TORANO', '', 4, 1, '7_9bc29d0a14064c70aca802cc201f2750_master.jpg', 'size-polo.jpeg', b'1'),
('ESTP005', 'Áo polo trơn bo kẻ, logo cánh tay ESTP005', 'PLBK', 420000, NULL, NULL, b'0', 'TORANO', 'Áo polo trơn bo kẻ, logo cánh tay ESTP005', 4, 1, 'tp005_52e371ed726e4f2d8401d86c5e0b38fb_master.jpg', 'size-polo.jpeg', b'1'),
('ESTP007', 'Áo Polo can phối 3 màu ESTP007', 'PLCP', 420000, NULL, NULL, b'0', 'TORANO', 'Áo polo nam cao cấp đẹp, tôn dáng. Chất vải dệt mềm, dày dặn không bai xù nhăn nhàu', 4, 2, 'estp007-1_9cd4cd6e34ac4041bb7e96da2d1eeb22_master.jpg', 'size-polo.jpeg', b'1'),
('ESTP010', 'Áo polo trơn bo kẻ ESTP010', 'PLBK', 400000, NULL, NULL, b'0', 'TORANO', '', 5, 3, 'tp010---bk603-_8__b6487398009b4c6eaa1950ee0f26e718_master.jpg', 'size-polo.jpeg', b'1'),
('ESTP012', 'Áo Polo kẻ dệt ngang 1.ESTP012', 'PLK', 500000, NULL, NULL, b'0', 'TORANO', '', 4, 1, 'tp012_0d295f194e3f4f0eab7eede288c3a7c5_master.jpg', 'size-polo.jpeg', b'1'),
('ESTP014', 'Áo Polo kẻ dệt ngang 1.ESTP014', 'PLK', 500000, NULL, NULL, b'0', 'TORANO', '', 4, 1, 'estp014_f4dabbabbe0346598163050a85b06f1a_master.jpg', 'size-polo.jpeg', b'1'),
('ESTP015', 'Áo polo can phối Horizontal Color Scheme 1.ESTP015', 'PLCP', 450000, NULL, NULL, b'0', 'TORANO', '', 4, 1, 'estp015_a0e07e027c614085b06c261c289544ab_master.jpg', 'size-polo.jpeg', b'1'),
('ESTP017', 'Áo polo can phối Horizontal Color Scheme ESTP017', 'PLCP', 420000, NULL, NULL, b'0', 'TORANO', '', 4, 1, '52985905053_bdeffa314e_o_aa67bed06deb439399cc2046790f8c59_master.jpg', 'size-polo.jpeg', b'1'),
('ESTP018', 'Áo polo can phối, thêu logo ngực ESTP018', 'PLCP', 420000, NULL, NULL, b'0', 'TORANO', 'Áo polo can phối, thêu logo ngực ESTP018', 4, 1, 'tp018_0691972d076d4071a4fee5291912df9e_master.jpg', 'size-polo.jpeg', b'1'),
('ESTP020', 'Áo Polo can phối 3 màu ESTP020', 'PLCP', 450000, NULL, NULL, b'0', 'TORANO', '', 4, 1, 'tp020---bk001-_10__b44a6900b6934440ad797f313b2cdd9a_master.jpg', 'size-polo.jpeg', b'1'),
('ESTP021', 'Áo polo can phối, thêu logo ngực ESTP021', 'PLCP', 550000, 450000, 18, b'1', 'TORANO', '', 4, 1, 'estp021-2_7b1e8ac1a10c4163bf199b7b89332d81_master.jpg', 'size-polo.jpeg', b'1'),
('ESTP022', 'Áo polo can phối vai ESTP022', 'PLCP', 450000, NULL, NULL, b'0', 'TORANO', 'Áo polo nam cao cấp đẹp, tôn dáng. Chất vải dệt mềm, dày dặn không bai xù nhăn nhàu', 5, 2, '52901478774_f103d7180e_o_6ec337721b6d4a8bae3c2626bca7d037_master.jpg', 'size-polo.jpeg', b'1'),
('ESTP023', 'Áo Polo can phối họa tiết TRN ESTP023', 'PLCP', 420000, NULL, NULL, b'0', 'TORANO', 'Áo Polo can phối họa tiết nam phong cách trẻ trung và lịch lãm thích hợp với mọi dáng người.', 4, 1, '1_4554a899fc974e40bc58638b060b31ee_master.jpg', 'size-polo.jpeg', b'1'),
('ESTP028', 'Áo polo trơn bo kẻ cổ V, in logo ngực ESTP028', 'PLBK', 420000, NULL, NULL, b'0', 'TORANO', '', 5, 4, 'tp028---bk004-_11__9246a1d8b0184518abd852704bd4fa02_master.jpg', 'size-polo.jpeg', b'1'),
('ESTP032', 'Áo polo trơn bo kẻ ESTP032', 'PLBK', 400000, NULL, NULL, b'0', 'TORANO', '', 4, 3, 'estp032-3_f94042405af64ca581ca72c753b53b51_master.jpg', 'size-polo.jpeg', b'1'),
('ESTP033', 'Áo polo trơn bo kẻ phối viền cổ ESTP033', 'PLBK', 420000, NULL, NULL, b'0', 'TORANO', 'Áo polo trơn bo kẻ phối viền cổ cao cấp', 4, 1, 'm1t1_9a04e0331596472281861b7f44cc3ca2_master.jpg', 'size-polo.jpeg', b'1'),
('ESTP038', 'Áo Polo trơn basic đen thêu logo ngực ESTP038', 'PLT', 330000, 200000, 39, b'1', 'TORANO', 'Áo Polo trơn TORANO cổ bẻ tay ngắn trơn, bo kẻ nhiều màu ESTP038 chính là item hoàn hảo dễ mặc dễ phối đồ cho cả nam và nữ. Khám phá ngay!!!\r\n</br>+ Chất vải có độ co giãn tốt, thoáng khí và không phai màu.\r\n</br>+60% Poly +35% cotton +5% Spandex+ Thấm hút mồ hôi tối đa và thoải mái khi vận động\r\n</br>+ Thiết kế Slimfit vừa vặn tôn dáng\r\n</br>+ Phù hợp với đi làm, đi học, đi chơi, hẹn hò, du lịch...\r\n</br>+ Áo có 4 size : S – M –L – XL\r\n</br>Hướng dẫn sử dụng và bảo quản:\r\n</br>+ Giặt ở nhiệt độ bình thường, với đồ có màu tương tự.\r\n</br>+ Không được dùng hóa chất tẩy.\r\n</br>+ Hạn chế sử dụng máy sấy và ủi ở nhiệt độ thích hợp.\r\n</br>+ Lộn mặt trái khi phơi tránh bị phai màu\r\n</br>Chính sách và điều kiện đổi trả của TORANO:\r\n</br>+ Cam kết chất lượng và mẫu mã sản phẩm giống với hình ảnh.\r\n</br>+ Cam kết được đổi trả hàng trong vòng 7 ngày.\r\n</br>+ Hàng phải còn nguyên tem mác và chưa qua sử dụng\r\n</br>+ Sản phẩm bị lỗi do vận chuyển và do nhà sản xuất', 5, 1, 'tp038-1.jpeg', 'size-polo.jpeg', b'1'),
('ESTP041', 'Áo Polo trơn hiệu ứng ESTP041', 'PLT', 450000, NULL, NULL, b'0', 'TORANO', 'Áo polo nam cao cấp chống nhăn nhàu đang hot tại Torano', 4, 5, 'estp041-16_4cb9d42d84e7436884bd3f4e648621ed_master.jpg', 'size-polo.jpeg', b'1'),
('ESTP042', 'Áo Polo trơn vải lục giác kèm logo ngực ESTP042', 'PLT', 380000, 349000, 8, b'1', 'TORANO', 'Mẫu áo polo chất liệu cải tiến thế hệ mới mang lại cho các anh sự thoải mái cũng như vẻ ngoài lịch sự và đầy nam tính.', 5, 9, 'tp042---bk004-_9__2efe604ac9324e06841cf8edc590e169_master.jpg', 'size-polo.jpeg', b'1'),
('ESTP047', 'Áo Polo len bo kẻ cổ 2.ESTP047', 'PLBK', 500000, NULL, NULL, b'0', 'TORANO', 'Áo polo len bo kẻ nam cao cấp chính hãng Torano. Chất vải len dệt chắc chắn, không xù và dão.', 4, 2, '5_66590d1cba6041359e8a89a1c7e0feb5_master.jpg', 'size-polo.jpeg', b'1'),
('ESTP060', 'Áo Polo can phối 2 màu ESTP060', 'PLCP', 420000, NULL, NULL, b'0', 'TORANO', 'Áo polo nam cao cấp đẹp, tôn dáng. Chất vải dệt mềm, dày dặn không bai xù nhăn nhàu', 4, 2, '3_a6cdb2c46dd543fd9507418aef06c558_master.jpg', 'size-polo.jpeg', b'1'),
('ESTP067', 'Áo Polo trơn bo kẻ cổ ESTP067', 'PLBK', 380000, NULL, NULL, b'0', 'TORANO', '', 5, 3, 'tp067---bk004-_16__bc6a55b32ddb4d94bc5c0fa5a7997db4_master.jpg', 'size-polo.jpeg', b'1'),
('ESTP074', 'Áo Polo trơn bo kẻ ESTP074', 'PLBK', 420000, NULL, NULL, b'0', 'TORANO', 'Áo Polo nam trơn bo kẻ cao cấp phong cách trẻ trung và lịch lãm thích hợp với mọi dáng người.', 4, 2, '1701361255452_1_50f16dbd5df34aa3acc99865b4820084_master.jpg', 'size-polo.jpeg', b'1'),
('ESTS021', 'Áo T shirt họa tiết in Color scheme ESTS021', 'TIH', 300000, NULL, NULL, b'0', 'TORANO', '', 4, 2, '1702717756318_ests021_64a34ff68d6d4857bae234b1364576fc_master.jpg', 'size-polo.jpeg', b'1'),
('ESTS036', 'Áo T shirt họa tiết in Anxiety Disorders 2.ESTS036', 'TIH', 300000, NULL, NULL, b'0', 'TORANO', '', 4, 2, '1702802725844_52932058522_9aba18e17a_o_e54f4d9597d9417c80ecba97a29c218c_master.jpg', 'size-polo.jpeg', b'1'),
('ESTS038', 'Áo T shirt họa tiết in Vagabond 2.ESTS038', 'TIH', 300000, NULL, NULL, b'0', 'TORANO', '', 4, 2, '1702802210675_52933043930_8da87d7a6c_o_1af3f2feba9545f8be8a0a196b8b2567_master.jpg.jpg', 'size-polo.jpeg', b'1'),
('ESTS040', 'Áo T shirt họa tiết in Smithereens 2.ESTS040', 'TIH', 300000, NULL, NULL, b'0', 'TORANO', '', 4, 2, '1702703208795_ests040-2_52988193045_o_8fd6a00033484ba78cd9122314ac7912_master.jpg', 'size-polo.jpeg', b'1'),
('ESTS044', 'Áo T shirt họa tiết in monogram TRN 1.ESTS044', 'TIH', 300000, NULL, NULL, b'0', 'TORANO', '', 4, 1, '1702717326862_ests044-3_52952396788_o_5673812b89994da69cfc7ad22ca9677e_master.jpg', 'size-polo.jpeg', b'1'),
('ESTS046', 'Áo T shirt họa tiết in hình Intense ESTS046', 'TIH', 300000, NULL, NULL, b'0', 'TORANO', '', 4, 1, '1702802457873_52932806289_bc52c62c78_o_f52bd9c5a85245f994c7648225599922_master.jpg', 'size-polo.jpeg', b'1'),
('EWBS001', 'Quần nỉ trơn basic vải hiệu ứng 3.EWBS001', 'AK', 400000, NULL, NULL, b'0', 'TORANO', '', 4, 3, '1704251898000_tw003-bs001-3_53291377849_o_110158d740fc40de9fceb818bda1132b_master.jpg', 'tagsize_5_img.jpeg', b'1'),
('EWCL003', 'Áo khoác 2 lớp da lộn basic 1.EWCL003', 'AK', 890000, NULL, NULL, b'0', 'TORANO', '', 4, 1, '1704250844877_ewcl003-7_53376839244_o_be698d6fa9ab4f78bf2132679fc67647_master.jpg', 'tagsize_5_img.jpeg', b'1'),
('EWCP002', 'Áo khoác Hooded Puffer 4.EWCP002', 'AK', 1200000, NULL, NULL, b'0', 'TORANO', '', 4, 3, '1704251255837_ewcp002-30_53376967025_o_d452a9fe67ca4f9b9803a72fa15b64fd_master.jpg', 'tagsize_5_img.jpeg', b'1'),
('EWCW007', 'Áo khoác gió 1 lớp mũ liền EWCW007', 'AK', 50000, NULL, NULL, b'0', 'TORANO', 'Áo khoác gió 1 lớp mũ liền chống nước giá siêu tốt của nhà Torano đã cập bến.\r\n', 4, 3, '1704189991841_ewcw007-1_c8b1f230ddb2408daa72728d0ecee531_master.jpg', 'tagsize_5_img.jpeg', b'1'),
('EWTE003', 'Áo len kẻ ngang cổ tròn 2.EWTE003', 'ANL', 520000, NULL, NULL, b'0', 'TORANO', '', 4, 2, '1708267758762_ewte003-10_53297045794_o_af9bd1f2fa8246dab498a75b2a976f04_master.jpg', 'tagsize_5_img.jpeg', b'1'),
('EWTW003', 'Áo nỉ trơn basic vải hiệu ứng 3.EWTW003', 'ANL', 380000, NULL, NULL, b'0', 'TORANO', '', 5, 3, '1707657567773_tw003-bs001-6_53291471625_o_1f620c3d758e41d696fb128d159744a2_master.jpg', 'tagsize_5_img.jpeg', b'1'),
('TP004', 'Áo polo phối màu color-block 1.TP004', 'PLHT', 450000, NULL, NULL, b'0', 'TORANO', 'Áo polo phối màu color-block TP004', 4, 1, 'tp004_45415f65d7bc4f4c8d52f4893d682a43_master.jpg', 'size-polo.jpeg', b'1');

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
    SELECT COUNT(DISTINCT size)
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
  `color_id` varchar(5) NOT NULL,
  `size` varchar(10) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `out_of_stock` bit(1) DEFAULT NULL,
  `product_detail_active` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products_detail`
--

INSERT INTO `products_detail` (`product_detail_id`, `product_id`, `code`, `color_id`, `size`, `quantity`, `out_of_stock`, `product_detail_active`) VALUES
(1, 'ESTP038', 'ESTP03872PE00SB_BL-S', 'BL', 'Size S', 0, b'0', b'1'),
(2, 'ESTP038', 'ESTP03872PE00SB_BL-M', 'BL', 'Size M', 0, b'0', b'1'),
(3, 'ESTP038', 'ESTP03872PE00SB_BL-L', 'BL', 'Size L', 0, b'0', b'1'),
(4, 'ESTP038', 'ESTP03872PE00SB_BL-XL', 'BL', 'Size XL', 999, b'1', b'1'),
(5, 'ESTP038', 'ESTP03872PE00SB_BL-XXL', 'BL', 'Size XXL', 999, b'1', b'1'),
(6, 'ESTP067', 'ESTP06772TC00SB_NV-S', 'NV', 'Size S', 999, b'1', b'1'),
(7, 'ESTP067', 'ESTP06772TC00SB_NV-M', 'NV', 'Size M', 999, b'1', b'1'),
(8, 'ESTP067', 'ESTP06772TC00SB_NV-L', 'NV', 'Size L', 999, b'1', b'1'),
(9, 'ESTP067', 'ESTP06772TC00SB_NV-XL', 'NV', 'Size XL', 999, b'1', b'1'),
(10, 'ESTP067', 'ESTP06772TC00SB_NV-XXL', 'NV', 'Size XXL', 999, b'1', b'1'),
(11, 'ESTP067', 'ESTP06772TC00SB_WH-S', 'WH', 'Size S', 999, b'1', b'1'),
(12, 'ESTP067', 'ESTP06772TC00SB_WH-M', 'WH', 'Size M', 999, b'1', b'1'),
(13, 'ESTP067', 'ESTP06772TC00SB_WH-L', 'WH', 'Size L', 999, b'1', b'1'),
(14, 'ESTP067', 'ESTP06772TC00SB_WH-XL', 'WH', 'Size XL', 999, b'1', b'1'),
(15, 'ESTP067', 'ESTP06772TC00SB_WH-XXL', 'WH', 'Size XXL', 999, b'1', b'1'),
(16, 'ESTP067', 'ESTP06772TC00SB_BL-S', 'BL', 'Size S', 999, b'1', b'1'),
(17, 'ESTP067', 'ESTP06772TC00SB_BL-M', 'BL', 'Size M', 999, b'1', b'1'),
(18, 'ESTP067', 'ESTP06772TC00SB_BL-L', 'BL', 'Size L', 999, b'1', b'1'),
(19, 'ESTP067', 'ESTP06772TC00SB_BL-XL', 'BL', 'Size XL', 999, b'1', b'1'),
(20, 'ESTP067', 'ESTP06772TC00SB_BL-XXL', 'BL', 'Size XXL', 999, b'1', b'1'),
(26, 'ESTP028', 'ESTP02872CV00SB_DCB-S', 'DCB', 'Size S', 999, b'1', b'1'),
(27, 'ESTP028', 'ESTP02872CV00SB_DCB-M', 'DCB', 'Size M', 999, b'1', b'1'),
(28, 'ESTP028', 'ESTP02872CV00SB_DCB-L', 'DCB', 'Size L', 999, b'1', b'1'),
(29, 'ESTP028', 'ESTP02872CV00SB_DCB-XL', 'DCB', 'Size XL', 999, b'1', b'1'),
(30, 'ESTP028', 'ESTP02872CV00SB_DCB-XXL', 'DCB', 'Size XXL', 999, b'1', b'1'),
(31, 'ESTP028', 'ESTP02872CV00SB_WH-S', 'WH', 'Size S', 0, b'0', b'1'),
(32, 'ESTP028', 'ESTP02872CV00SB_WH-M', 'WH', 'Size M', 0, b'0', b'1'),
(33, 'ESTP028', 'ESTP02872CV00SB_WH-L', 'WH', 'Size L', 999, b'1', b'1'),
(34, 'ESTP028', 'ESTP02872CV00SB_WH-XL', 'WH', 'Size XL', 999, b'1', b'1'),
(35, 'ESTP028', 'ESTP02872CV00SB_WH-XXL', 'WH', 'Size XXL', 999, b'1', b'1'),
(36, 'ESTP028', 'ESTP02872CV00SB_BL-S', 'BL', 'Size S', 0, b'0', b'1'),
(37, 'ESTP028', 'ESTP02872CV00SB_BL-M', 'BL', 'Size M', 0, b'0', b'1'),
(38, 'ESTP028', 'ESTP02872CV00SB_BL-L', 'BL', 'Size L', 999, b'1', b'1'),
(39, 'ESTP028', 'ESTP02872CV00SB_BL-XL', 'BL', 'Size XL', 0, b'0', b'1'),
(40, 'ESTP028', 'ESTP02872CV00SB_BL-XXL', 'BL', 'Size XXL', 0, b'0', b'1'),
(41, 'ESTP028', 'ESTP02872CV00SB_NV-S', 'NV', 'Size S', 999, b'1', b'1'),
(42, 'ESTP028', 'ESTP02872CV00SB_NV-M', 'NV', 'Size M', 0, b'0', b'1'),
(43, 'ESTP028', 'ESTP02872CV00SB_NV-L', 'NV', 'Size L', 0, b'0', b'1'),
(44, 'ESTP028', 'ESTP02872CV00SB_NV-XL', 'NV', 'Size XL', 0, b'0', b'1'),
(45, 'ESTP028', 'ESTP02872CV00SB_NV-XXL', 'NV', 'Size XXL', 0, b'0', b'1'),
(46, 'DSTP611', 'DSTP61172CX00SB_WH-S', 'WH', 'Size S', 777, b'1', b'1'),
(47, 'DSTP611', 'DSTP61172CX00SB_WH-M', 'WH', 'Size M', 999, b'1', b'1'),
(48, 'DSTP611', 'DSTP61172CX00SB_WH-L', 'WH', 'Size L', 999, b'1', b'1'),
(49, 'DSTP611', 'DSTP61172CX00SB_WH-XL', 'WH', 'Size XL', 999, b'1', b'1'),
(50, 'ESTP010', 'ESTP01072TC00SB_DGN-S', 'DGN', 'Size S', 999, b'1', b'1'),
(51, 'ESTP010', 'ESTP01072TC00SB_DGN-M', 'DGN', 'Size M', 999, b'1', b'1'),
(52, 'ESTP010', 'ESTP01072TC00SB_DGN-L', 'DGN', 'Size L', 999, b'1', b'1'),
(53, 'ESTP010', 'ESTP01072TC00SB_DGN-XL', 'DGN', 'Size XL', 999, b'1', b'1'),
(54, 'ESTP010', 'ESTP01072TC00SB_DGN-XXL', 'DGN', 'Size XXL', 999, b'1', b'1'),
(55, 'ESTP010', 'ESTP01072TC00SB_CR-S', 'CR', 'Size S', 999, b'1', b'1'),
(56, 'ESTP010', 'ESTP01072TC00SB_CR-M', 'CR', 'Size M', 999, b'1', b'1'),
(57, 'ESTP010', 'ESTP01072TC00SB_CR-L', 'CR', 'Size L', 999, b'1', b'1'),
(58, 'ESTP010', 'ESTP01072TC00SB_CR-XL', 'CR', 'Size XL', 999, b'1', b'1'),
(59, 'ESTP010', 'ESTP01072TC00SB_CR-XXL', 'CR', 'Size XXL', 999, b'1', b'1'),
(60, 'ESTP010', 'ESTP01072TC00SB_WH-S', 'WH', 'Size S', 999, b'1', b'1'),
(61, 'ESTP010', 'ESTP01072TC00SB_WH-M', 'WH', 'Size M', 999, b'1', b'1'),
(62, 'ESTP010', 'ESTP01072TC00SB_WH-L', 'WH', 'Size L', 999, b'1', b'1'),
(63, 'ESTP010', 'ESTP01072TC00SB_WH-XL', 'WH', 'Size XL', 999, b'1', b'1'),
(64, 'ESTP010', 'ESTP01072TC00SB_WH-XXL', 'WH', 'Size XXL', 999, b'1', b'1'),
(65, 'ESTP032', 'ESTP03272TC00SB_BE-S', 'BE', 'Size S', 999, b'1', b'1'),
(66, 'ESTP032', 'ESTP03272TC00SB_BE-M', 'BE', 'Size M', 999, b'1', b'1'),
(67, 'ESTP032', 'ESTP03272TC00SB_BE-L', 'BE', 'Size L', 999, b'1', b'1'),
(68, 'ESTP032', 'ESTP03272TC00SB_BE-XL', 'BE', 'Size XL', 999, b'1', b'1'),
(69, 'ESTP032', 'ESTP03272TC00SB_BR-S', 'BR', 'Size S', 999, b'1', b'1'),
(70, 'ESTP032', 'ESTP03272TC00SB_BR-M', 'BR', 'Size M', 999, b'1', b'1'),
(71, 'ESTP032', 'ESTP03272TC00SB_BR-L', 'BR', 'Size L', 999, b'1', b'1'),
(72, 'ESTP032', 'ESTP03272TC00SB_BR-XL', 'BR', 'Size XL', 999, b'1', b'1'),
(73, 'ESTP032', 'ESTP03272TC00SB_WH-S', 'WH', 'Size S', 999, b'1', b'1'),
(74, 'ESTP032', 'ESTP03272TC00SB_WH-M', 'WH', 'Size M', 999, b'1', b'1'),
(75, 'ESTP032', 'ESTP03272TC00SB_WH-L', 'WH', 'Size L', 999, b'1', b'1'),
(76, 'ESTP032', 'ESTP03272TC00SB_WH-XL', 'WH', 'Size XL', 999, b'1', b'1'),
(77, 'ESTP074', 'ESTP07472CT00SB_NV-S', 'NV', 'Size S', 999, b'1', b'1'),
(78, 'ESTP074', 'ESTP07472CT00SB_NV-M', 'NV', 'Size M', 999, b'1', b'1'),
(79, 'ESTP074', 'ESTP07472CT00SB_NV-L', 'NV', 'Size L', 999, b'1', b'1'),
(80, 'ESTP074', 'ESTP07472CT00SB_NV-XL', 'NV', 'Size XL', 999, b'1', b'1'),
(81, 'ESTP074', 'ESTP07472CT00SB_WH-S', 'WH', 'Size S', 999, b'1', b'1'),
(82, 'ESTP074', 'ESTP07472CT00SB_WH-M', 'WH', 'Size M', 999, b'1', b'1'),
(83, 'ESTP074', 'ESTP07472CT00SB_WH-L', 'WH', 'Size L', 999, b'1', b'1'),
(84, 'ESTP074', 'ESTP07472CT00SB_WH-XL', 'WH', 'Size XL', 999, b'1', b'1'),
(85, 'ESTP005', 'ESTP00572CT00SB_DNV-S', 'DNV', 'Size S', 999, b'1', b'1'),
(86, 'ESTP005', 'ESTP00572CT00SB_DNV-M', 'DNV', 'Size M', 999, b'1', b'1'),
(87, 'ESTP005', 'ESTP00572CT00SB_DNV-L', 'DNV', 'Size L', 999, b'1', b'1'),
(88, 'ESTP005', 'ESTP00572CT00SB_DNV-XL', 'DNV', 'Size XL', 999, b'1', b'1'),
(89, 'ESTP041', 'ESTP04172CV01SB_DCR-S', 'DCR', 'Size S', 0, b'0', b'1'),
(90, 'ESTP041', 'ESTP04172CV01SB_DCR-M', 'DCR', 'Size M', 999, b'1', b'1'),
(91, 'ESTP041', 'ESTP04172CV01SB_DCR-L', 'DCR', 'Size L', 999, b'1', b'1'),
(92, 'ESTP041', 'ESTP04172CV01SB_DCR-XL', 'DCR', 'Size XL', 999, b'1', b'1'),
(93, 'ESTP041', 'ESTP04172CV01SB_BL-S', 'BL', 'Size S', 999, b'1', b'1'),
(94, 'ESTP041', 'ESTP04172CV01SB_BL-M', 'BL', 'Size M', 999, b'1', b'1'),
(95, 'ESTP041', 'ESTP04172CV01SB_BL-L', 'BL', 'Size L', 999, b'1', b'1'),
(96, 'ESTP041', 'ESTP04172CV01SB_BL-XL', 'BL', 'Size XL', 999, b'1', b'1'),
(97, 'ESTP041', 'ESTP04172CV01SB_CN-S', 'CN', 'Size S', 999, b'1', b'1'),
(98, 'ESTP041', 'ESTP04172CV01SB_CN-M', 'CN', 'Size M', 999, b'1', b'1'),
(99, 'ESTP041', 'ESTP04172CV01SB_CN-L', 'CN', 'Size L', 999, b'1', b'1'),
(100, 'ESTP041', 'ESTP04172CV01SB_CN-XL', 'CN', 'Size XL', 999, b'1', b'1'),
(101, 'ESTP041', 'ESTP04172CV01SB_DNV-S', 'DNV', 'Size S', 999, b'1', b'1'),
(102, 'ESTP041', 'ESTP04172CV01SB_DNV-M', 'DNV', 'Size M', 999, b'1', b'1'),
(103, 'ESTP041', 'ESTP04172CV01SB_DNV-L', 'DNV', 'Size L', 999, b'1', b'1'),
(104, 'ESTP041', 'ESTP04172CV01SB_DNV-XL', 'DNV', 'Size XL', 999, b'1', b'1'),
(105, 'ESTP041', 'ESTP04172CV01SB_WH-S', 'WH', 'Size S', 999, b'1', b'1'),
(106, 'ESTP041', 'ESTP04172CV01SB_WH-M', 'WH', 'Size M', 999, b'1', b'1'),
(107, 'ESTP041', 'ESTP04172CV01SB_WH-L', 'WH', 'Size L', 999, b'1', b'1'),
(108, 'ESTP041', 'ESTP04172CV01SB_WH-XL', 'WH', 'Size XL', 999, b'1', b'1'),
(109, 'ESTP042', 'ESTP04272CV00SB_BR-S', 'BR', 'Size S', 999, b'1', b'1'),
(110, 'ESTP042', 'ESTP04272CV00SB_BR-M', 'BR', 'Size M', 999, b'1', b'1'),
(111, 'ESTP042', 'ESTP04272CV00SB_BR-L', 'BR', 'Size L', 999, b'1', b'1'),
(112, 'ESTP042', 'ESTP04272CV00SB_BR-XL', 'BR', 'Size XL', 999, b'1', b'1'),
(113, 'ESTP042', 'ESTP04272CV00SB_BR-XXL', 'BR', 'Size XXL', 999, b'1', b'1'),
(114, 'ESTP042', 'ESTP04272CV00SB_LI-S', 'LI', 'Size S', 999, b'1', b'1'),
(115, 'ESTP042', 'ESTP04272CV00SB_LI-M', 'LI', 'Size M', 999, b'1', b'1'),
(116, 'ESTP042', 'ESTP04272CV00SB_LI-L', 'LI', 'Size L', 999, b'1', b'1'),
(117, 'ESTP042', 'ESTP04272CV00SB_LI-XL', 'LI', 'Size XL', 999, b'1', b'1'),
(118, 'ESTP042', 'ESTP04272CV00SB_LI-XXL', 'LI', 'Size XXL', 999, b'1', b'1'),
(119, 'ESTP042', 'ESTP04272CV00SB_BL-S', 'BL', 'Size S', 999, b'1', b'1'),
(120, 'ESTP042', 'ESTP04272CV00SB_BL-M', 'BL', 'Size M', 999, b'1', b'1'),
(121, 'ESTP042', 'ESTP04272CV00SB_BL-L', 'BL', 'Size L', 999, b'1', b'1'),
(122, 'ESTP042', 'ESTP04272CV00SB_BL-XL', 'BL', 'Size XL', 999, b'1', b'1'),
(123, 'ESTP042', 'ESTP04272CV00SB_BL-XXL', 'BL', 'Size XXL', 999, b'1', b'1'),
(124, 'ESTP042', 'ESTP04272CV00SB_NV-S', 'NV', 'Size S', 999, b'1', b'1'),
(125, 'ESTP042', 'ESTP04272CV00SB_NV-M', 'NV', 'Size M', 999, b'1', b'1'),
(126, 'ESTP042', 'ESTP04272CV00SB_NV-L', 'NV', 'Size L', 999, b'1', b'1'),
(127, 'ESTP042', 'ESTP04272CV00SB_NV-XL', 'NV', 'Size XL', 999, b'1', b'1'),
(128, 'ESTP042', 'ESTP04272CV00SB_NV-XXL', 'NV', 'Size XXL', 999, b'1', b'1'),
(129, 'ESTP042', 'ESTP04272CV00SB_DTU-S', 'DTU', 'Size S', 999, b'1', b'1'),
(130, 'ESTP042', 'ESTP04272CV00SB_DTU-M', 'DTU', 'Size M', 999, b'1', b'1'),
(131, 'ESTP042', 'ESTP04272CV00SB_DTU-L', 'DTU', 'Size L', 999, b'1', b'1'),
(132, 'ESTP042', 'ESTP04272CV00SB_DTU-XL', 'DTU', 'Size XL', 999, b'1', b'1'),
(133, 'ESTP042', 'ESTP04272CV00SB_DTU-XXL', 'DTU', 'Size XXL', 999, b'1', b'1'),
(134, 'ESTP042', 'ESTP04272CV00SB_TU-S', 'TU', 'Size S', 999, b'1', b'1'),
(135, 'ESTP042', 'ESTP04272CV00SB_TU-M', 'TU', 'Size M', 999, b'1', b'1'),
(136, 'ESTP042', 'ESTP04272CV00SB_TU-L', 'TU', 'Size L', 999, b'1', b'1'),
(137, 'ESTP042', 'ESTP04272CV00SB_TU-XL', 'TU', 'Size XL', 999, b'1', b'1'),
(138, 'ESTP042', 'ESTP04272CV00SB_TU-XXL', 'TU', 'Size XXL', 999, b'1', b'1'),
(139, 'ESTP042', 'ESTP04272CV00SB_LYL-S', 'LYL', 'Size S', 999, b'1', b'1'),
(140, 'ESTP042', 'ESTP04272CV00SB_LYL-M', 'LYL', 'Size M', 999, b'1', b'1'),
(141, 'ESTP042', 'ESTP04272CV00SB_LYL-L', 'LYL', 'Size L', 999, b'1', b'1'),
(142, 'ESTP042', 'ESTP04272CV00SB_LYL-XL', 'LYL', 'Size XL', 999, b'1', b'1'),
(143, 'ESTP042', 'ESTP04272CV00SB_LYL-XXL', 'LYL', 'Size XXL', 999, b'1', b'1'),
(144, 'ESTP042', 'ESTP04272CV00SB_CR-S', 'CR', 'Size S', 999, b'1', b'1'),
(145, 'ESTP042', 'ESTP04272CV00SB_CR-M', 'CR', 'Size M', 999, b'1', b'1'),
(146, 'ESTP042', 'ESTP04272CV00SB_CR-L', 'CR', 'Size L', 999, b'1', b'1'),
(147, 'ESTP042', 'ESTP04272CV00SB_CR-XL', 'CR', 'Size XL', 999, b'1', b'1'),
(148, 'ESTP042', 'ESTP04272CV00SB_CR-XXL', 'CR', 'Size XXL', 999, b'1', b'1'),
(149, 'ESTP042', 'ESTP04272CV00SB_WH-S', 'WH', 'Size S', 999, b'1', b'1'),
(150, 'ESTP042', 'ESTP04272CV00SB_WH-M', 'WH', 'Size M', 999, b'1', b'1'),
(151, 'ESTP042', 'ESTP04272CV00SB_WH-L', 'WH', 'Size L', 999, b'1', b'1'),
(152, 'ESTP042', 'ESTP04272CV00SB_WH-XL', 'WH', 'Size XL', 999, b'1', b'1'),
(153, 'ESTP042', 'ESTP04272CV00SB_WH-XXL', 'WH', 'Size XXL', 999, b'1', b'1'),
(154, 'ESTP033', 'ESTP03372CT00SB_BL-S', 'BL', 'Size S', 999, b'1', b'1'),
(155, 'ESTP033', 'ESTP03372CT00SB_BL-M', 'BL', 'Size M', 999, b'1', b'1'),
(156, 'ESTP033', 'ESTP03372CT00SB_BL-L', 'BL', 'Size L', 999, b'1', b'1'),
(157, 'ESTP033', 'ESTP03372CT00SB_BL-XL', 'BL', 'Size XL', 999, b'1', b'1'),
(158, 'ESTP001', 'ESTP00172TC04SB_WH-S', 'WH', 'Size S', 999, b'1', b'1'),
(159, 'ESTP001', 'ESTP00172TC04SB_WH-M', 'WH', 'Size M', 999, b'1', b'1'),
(160, 'ESTP001', 'ESTP00172TC04SB_WH-L', 'WH', 'Size L', 999, b'1', b'1'),
(161, 'ESTP001', 'ESTP00172TC04SB_WH-XL', 'WH', 'Size XL', 999, b'1', b'1'),
(162, 'ESTP060', 'ESTP06072CV32SB_NVC-S', 'NVC', 'Size S', 999, b'1', b'1'),
(163, 'ESTP060', 'ESTP06072CV32SB_NVC-M', 'NVC', 'Size M', 999, b'1', b'1'),
(164, 'ESTP060', 'ESTP06072CV32SB_NVC-L', 'NVC', 'Size L', 999, b'1', b'1'),
(165, 'ESTP060', 'ESTP06072CV32SB_NVC-XL', 'NVC', 'Size XL', 999, b'1', b'1'),
(166, 'ESTP060', 'ESTP06072CV32SB_HBR-S', 'HBR', 'Size S', 999, b'1', b'1'),
(167, 'ESTP060', 'ESTP06072CV32SB_HBR-M', 'HBR', 'Size M', 999, b'1', b'1'),
(168, 'ESTP060', 'ESTP06072CV32SB_HBR-L', 'HBR', 'Size L', 999, b'1', b'1'),
(169, 'ESTP060', 'ESTP06072CV32SB_HBR-XL', 'HBR', 'Size XL', 999, b'1', b'1'),
(170, 'ESTP007', 'ESTP00772CX32SB_WBL-S', 'WBL', 'Size S', 999, b'1', b'1'),
(171, 'ESTP007', 'ESTP00772CX32SB_WBL-M', 'WBL', 'Size M', 999, b'1', b'1'),
(172, 'ESTP007', 'ESTP00772CX32SB_WBL-L', 'WBL', 'Size L', 999, b'1', b'1'),
(173, 'ESTP007', 'ESTP00772CX32SB_WBL-XL', 'WBL', 'Size XL', 999, b'1', b'1'),
(174, 'ESTP007', 'ESTP00772CX32SB_WNV-S', 'WNV', 'Size S', 999, b'1', b'1'),
(175, 'ESTP007', 'ESTP00772CX32SB_WNV-M', 'WNV', 'Size M', 999, b'1', b'1'),
(176, 'ESTP007', 'ESTP00772CX32SB_WNV-L', 'WNV', 'Size L', 999, b'1', b'1'),
(177, 'ESTP007', 'ESTP00772CX32SB_WNV-XL', 'WNV', 'Size XL', 999, b'1', b'1'),
(178, 'ESTP020', 'ESTP02072TC32SB_BBR-S', 'BBR', 'Size S', 999, b'1', b'1'),
(179, 'ESTP020', 'ESTP02072TC32SB_BBR-M', 'BBR', 'Size M', 999, b'1', b'1'),
(180, 'ESTP020', 'ESTP02072TC32SB_BBR-L', 'BBR', 'Size L', 999, b'1', b'1'),
(181, 'ESTP020', 'ESTP02072TC32SB_BBR-XL', 'BBR', 'Size XL', 999, b'1', b'1'),
(182, 'ESTP023', 'ESTP02372CT32SB_NWH-S', 'NWH', 'Size S', 999, b'1', b'1'),
(183, 'ESTP023', 'ESTP02372CT32SB_NWH-M', 'NWH', 'Size M', 999, b'1', b'1'),
(184, 'ESTP023', 'ESTP02372CT32SB_NWH-L', 'NWH', 'Size L', 999, b'1', b'1'),
(185, 'ESTP023', 'ESTP02372CT32SB_NWH-XL', 'NWH', 'Size XL', 0, b'0', b'1'),
(186, 'ESTP015', 'ESTP01572CV32SB_WNV-S', 'WNV', 'Size S', 999, b'1', b'1'),
(187, 'ESTP015', 'ESTP01572CV32SB_WNV-M', 'WNV', 'Size M', 999, b'1', b'1'),
(188, 'ESTP015', 'ESTP01572CV32SB_WNV-L', 'WNV', 'Size L', 999, b'1', b'1'),
(189, 'ESTP015', 'ESTP01572CV32SB_WNV-XL', 'WNV', 'Size XL', 999, b'1', b'1'),
(190, 'DSTP903', 'DSTP90372CT32RB_WCB-S', 'WCB', 'Size S', 999, b'1', b'1'),
(191, 'DSTP903', 'DSTP90372CT32RB_WCB-M', 'WCB', 'Size M', 989, b'1', b'1'),
(192, 'DSTP903', 'DSTP90372CT32RB_WCB-L', 'WCB', 'Size L', 994, b'1', b'1'),
(193, 'DSTP903', 'DSTP90372CT32RB_WCB-XL', 'WCB', 'Size XL', 999, b'1', b'1'),
(194, 'DSTP903', 'DSTP90372CT32RB_HCR-S', 'HCR', 'Size S', 999, b'1', b'1'),
(195, 'DSTP903', 'DSTP90372CT32RB_HCR-M', 'HCR', 'Size M', 995, b'1', b'1'),
(196, 'DSTP903', 'DSTP90372CT32RB_HCR-L', 'HCR', 'Size L', 999, b'1', b'1'),
(197, 'DSTP903', 'DSTP90372CT32RB_HCR-XL', 'HCR', 'Size XL', 999, b'1', b'1'),
(198, 'ESTP017', 'ESTP01772CV32SB_BLE-S', 'BLE', 'Size S', 999, b'1', b'1'),
(199, 'ESTP017', 'ESTP01772CV32SB_BLE-M', 'BLE', 'Size M', 999, b'1', b'1'),
(200, 'ESTP017', 'ESTP01772CV32SB_BLE-L', 'BLE', 'Size L', 999, b'1', b'1'),
(201, 'ESTP017', 'ESTP01772CV32SB_BLE-XL', 'BLE', 'Size XL', 999, b'1', b'1'),
(202, 'ESTP022', 'ESTP02272CV32SB_WH-S', 'WH', 'Size S', 999, b'1', b'1'),
(203, 'ESTP022', 'ESTP02272CV32SB_WH-M', 'WH', 'Size M', 999, b'1', b'1'),
(204, 'ESTP022', 'ESTP02272CV32SB_WH-L', 'WH', 'Size L', 999, b'1', b'1'),
(205, 'ESTP022', 'ESTP02272CV32SB_WH-XL', 'WH', 'Size XL', 999, b'1', b'1'),
(206, 'ESTP022', 'ESTP02272CV32SB_WH-XXL', 'WH', 'Size XXL', 0, b'0', b'1'),
(207, 'ESTP022', 'ESTP02272CV32SB_NV-S', 'NV', 'Size S', 0, b'0', b'1'),
(208, 'ESTP022', 'ESTP02272CV32SB_NV-M', 'NV', 'Size M', 0, b'0', b'1'),
(209, 'ESTP022', 'ESTP02272CV32SB_NV-L', 'NV', 'Size L', 999, b'1', b'1'),
(210, 'ESTP022', 'ESTP02272CV32SB_NV-XL', 'NV', 'Size XL', 0, b'0', b'1'),
(211, 'ESTP022', 'ESTP02272CV32SB_NV-XXL', 'NV', 'Size XXL', 999, b'1', b'1'),
(212, 'ESTP018', 'ESTP01872CV32SB_NWH-S', 'WH', 'Size S', 999, b'1', b'1'),
(213, 'ESTP018', 'ESTP01872CV32SB_NWH-M', 'WH', 'Size M', 999, b'1', b'1'),
(214, 'ESTP018', 'ESTP01872CV32SB_NWH-L', 'WH', 'Size L', 999, b'1', b'1'),
(215, 'ESTP018', 'ESTP01872CV32SB_NWH-XL', 'WH', 'Size XL', 999, b'1', b'1'),
(224, 'ESTP021', 'ESTP02172CT32SB_NWH-S', 'WH', 'Size S', 999, b'1', b'1'),
(225, 'ESTP021', 'ESTP02172CT32SB_NWH-M', 'WH', 'Size M', 999, b'1', b'1'),
(226, 'ESTP021', 'ESTP02172CT32SB_NWH-L', 'WH', 'Size L', 999, b'1', b'1'),
(227, 'ESTP021', 'ESTP02172CT32SB_NWH-XL', 'WH', 'Size XL', 999, b'1', b'1'),
(232, 'ESTP014', 'ESTP01472CV08SB_BCR-S', 'BCR', 'Size S', 999, b'1', b'1'),
(233, 'ESTP014', 'ESTP01472CV08SB_BCR-M', 'BCR', 'Size M', 999, b'1', b'1'),
(234, 'ESTP014', 'ESTP01472CV08SB_BCR-L', 'BCR', 'Size L', 998, b'1', b'1'),
(235, 'ESTP014', 'ESTP01472CV08SB_BCR-XL', 'BCR', 'Size XL', 999, b'1', b'1'),
(240, 'ESTP012', 'ESTP01272CT08SB_VCB-S', 'VCB', 'Size S', 999, b'1', b'1'),
(241, 'ESTP012', 'ESTP01272CT08SB_VCB-M', 'VCB', 'Size M', 999, b'1', b'1'),
(242, 'ESTP012', 'ESTP01272CT08SB_VCB-L', 'VCB', 'Size L', 999, b'1', b'1'),
(243, 'ESTP012', 'ESTP01272CT08SB_VCB-XL', 'VCB', 'Size XL', 999, b'1', b'1'),
(244, 'DSTP650', 'DSTP65072CT04SB_BL-S', 'BL', 'Size S', 998, b'1', b'1'),
(245, 'DSTP650', 'DSTP65072CT04SB_BL-M', 'BL', 'Size M', 999, b'1', b'1'),
(246, 'DSTP650', 'DSTP65072CT04SB_BL-L', 'BL', 'Size L', 997, b'1', b'1'),
(247, 'DSTP650', 'DSTP65072CT04SB_BL-XL', 'BL', 'Size XL', 998, b'1', b'1'),
(248, 'ESTP047', 'ESTP04772CA00SB_DCR-S', 'DCR', 'Size S', 999, b'1', b'1'),
(249, 'ESTP047', 'ESTP04772CA00SB_DCR-M', 'DCR', 'Size M', 999, b'1', b'1'),
(250, 'ESTP047', 'ESTP04772CA00SB_DCR-L', 'DCR', 'Size L', 999, b'1', b'1'),
(251, 'ESTP047', 'ESTP04772CA00SB_DCR-XL', 'DCR', 'Size XL', 999, b'1', b'1'),
(252, 'ESTP047', 'ESTP04772CA00SB_BL-S', 'BL', 'Size S', 999, b'1', b'1'),
(253, 'ESTP047', 'ESTP04772CA00SB_BL-M', 'BL', 'Size M', 999, b'1', b'1'),
(254, 'ESTP047', 'ESTP04772CA00SB_BL-L', 'BL', 'Size L', 999, b'1', b'1'),
(255, 'ESTP047', 'ESTP04772CA00SB_BL-XL', 'BL', 'Size XL', 999, b'1', b'1'),
(256, 'TP004', 'DSTP00472CV32SB_BL-S', 'BL', 'Size S', 999, b'1', b'1'),
(257, 'TP004', 'DSTP00472CV32SB_BL-M', 'BL', 'Size M', 999, b'1', b'1'),
(258, 'TP004', 'DSTP00472CV32SB_BL-L', 'BL', 'Size L', 999, b'1', b'1'),
(259, 'TP004', 'DSTP00472CV32SB_BL-XL', 'BL', 'Size XL', 999, b'1', b'1'),
(271, 'ESTA010', 'ESTA01012CT06MB_NV-M', 'NV', 'Size M', 999, b'1', b'1'),
(272, 'ESTA010', 'ESTA01012CT06MB_NV-S', 'NV', 'Size S', 0, b'0', b'1'),
(273, 'ESTA010', 'ESTA01012CT06MB_NV-L', 'NV', 'Size L', 0, b'0', b'1'),
(277, 'ESTA010', 'ESTA01012CT06MB_NV-XL', 'NV', 'Size XL', 0, b'0', b'1'),
(283, 'ESTA006', 'ESTA00612CT06MB_BL-M', 'BL', 'Size M', 999, b'1', b'1'),
(284, 'ESTA006', 'ESTA00612CT06MB_BL-S', 'BL', 'Size S', 999, b'1', b'1'),
(285, 'ESTA006', 'ESTA00612CT06MB_BL-L', 'BL', 'Size L', 999, b'1', b'1'),
(286, 'ESTA006', 'ESTA00612CT06MB_BL-XL', 'BL', 'Size XL', 998, b'1', b'1'),
(287, 'ESTA003', 'ESTA00312CT06MB_NV-S', 'NV', 'Size S', 999, b'1', b'1'),
(288, 'ESTA003', 'ESTA00312CT06MB_NV-M', 'NV', 'Size M', 0, b'0', b'1'),
(289, 'ESTA003', 'ESTA00312CT06MB_NV-L', 'NV', 'Size L', 999, b'1', b'1'),
(290, 'ESTA003', 'ESTA00312CT06MB_NV-XL', 'NV', 'Size XL', 998, b'1', b'1'),
(291, 'ESTA003', 'ESTA00312CT06MB_WH-S', 'WH', 'Size S', 998, b'1', b'1'),
(292, 'ESTA003', 'ESTA00312CT06MB_WH-M', 'WH', 'Size M', 0, b'0', b'1'),
(293, 'ESTA003', 'ESTA00312CT06MB_WH-L', 'WH', 'Size L', 999, b'1', b'1'),
(294, 'ESTA003', 'ESTA00312CT06MB_WH-XL', 'WH', 'Size XL', 0, b'0', b'1'),
(295, 'ESTA005', 'ESTA00512CT06MB_BL-S', 'BL', 'Size S', 999, b'1', b'1'),
(296, 'ESTA005', 'ESTA00512CT06MB_BL-M', 'BL', 'Size M', 999, b'1', b'1'),
(297, 'ESTA005', 'ESTA00512CT06MB_BL-L', 'BL', 'Size L', 0, b'0', b'1'),
(298, 'ESTA005', 'ESTA00512CT06MB_BL-XL', 'BL', 'Size XL', 999, b'1', b'1'),
(299, 'ESTS040', 'ESTS04012CA06MB_WH-S', 'WH', 'Size S', 999, b'1', b'1'),
(300, 'ESTS040', 'ESTS04012CA06MB_WH-M', 'WH', 'Size M', 998, b'1', b'1'),
(301, 'ESTS040', 'ESTS04012CA06MB_WH-L', 'WH', 'Size L', 0, b'0', b'1'),
(302, 'ESTS040', 'ESTS04012CA06MB_WH-XL', 'WH', 'Size XL', 999, b'1', b'1'),
(303, 'ESTS040', 'ESTS04012CA06MB_BL-S', 'BL', 'Size S', 0, b'0', b'1'),
(304, 'ESTS040', 'ESTS04012CA06MB_BL-M', 'BL', 'Size M', 999, b'1', b'1'),
(305, 'ESTS040', 'ESTS04012CA06MB_BL-L', 'BL', 'Size L', 999, b'1', b'1'),
(306, 'ESTS040', 'ESTS04012CA06MB_BL_XL', 'BL', 'Size XL', 999, b'1', b'1'),
(307, 'ESTS044', 'ESTS04412CA04MB_WH-S', 'WH', 'Size S', 998, b'1', b'1'),
(308, 'ESTS044', 'ESTS04412CA04MB_WH-M', 'WH', 'Size M', 0, b'0', b'1'),
(309, 'ESTS044', 'ESTS04412CA04MB_WH-L', 'WH', 'Size L', 999, b'1', b'1'),
(310, 'ESTS044', 'ESTS04412CA04MB_WH-XL', 'WH', 'Size XL', 0, b'0', b'1'),
(311, 'ESTS021', 'ESTS02112CV06MB_DCB-S', 'DCB', 'Size S', 0, b'0', b'1'),
(312, 'ESTS021', 'ESTS02112CV06MB_DCB-M', 'DCB', 'Size M', 0, b'0', b'1'),
(313, 'ESTS021', 'ESTS02112CV06MB_DCB-L', 'DCB', 'Size L', 999, b'1', b'1'),
(314, 'ESTS021', 'ESTS02112CV06MB_DCB-XL', 'WH', 'Size XL', 998, b'1', b'1'),
(315, 'ESTS021', 'ESTS02112CV06MB_WH-L', 'WH', 'Size L', 999, b'1', b'1'),
(316, 'ESTS021', 'ESTS02112CV06MB_WH-S', 'WH', 'Size S', 999, b'1', b'1'),
(317, 'ESTS021', 'ESTS02112CV06MB_WH-M', 'WH', 'Size M', 999, b'1', b'1'),
(318, 'ESTS021', 'ESTS02112CV06MB_WH-XL', 'WH', 'Size XL', 998, b'1', b'1'),
(327, 'ESTS038', 'ESTS03812CT06MB_NV-M', 'NV', 'Size M', 999, b'1', b'1'),
(328, 'ESTS038', 'ESTS03812CT06MB_NV-S', 'NV', 'Size S', 999, b'1', b'1'),
(329, 'ESTS038', 'ESTS03812CT06MB_NV-L', 'NV', 'Size L', 999, b'1', b'1'),
(330, 'ESTS038', 'ESTS03812CT06MB_NV-XL', 'NV', 'Size XL', 999, b'1', b'1'),
(331, 'ESTS038', 'ESTS03812CT06MB_DCB-S', 'DCB', 'Size S', 0, b'0', b'1'),
(332, 'ESTS038', 'ESTS03812CT06MB_DCB-M', 'DCB', 'Size M', 0, b'0', b'1'),
(333, 'ESTS038', 'ESTS03812CT06MB_DCB-L', 'DCB', 'Size L', 999, b'1', b'1'),
(334, 'ESTS038', 'ESTS03812CT06MB_DCB-XL', 'DCB', 'Size XL', 999, b'1', b'1'),
(335, 'ESTS046', 'ESTS04612CT06MB_WH-S', 'WH', 'Size S', 999, b'1', b'1'),
(336, 'ESTS046', 'ESTS04612CT06MB_WH-M', 'WH', 'Size M', 999, b'1', b'1'),
(337, 'ESTS046', 'ESTS04612CT06MB_WH-L', 'WH', 'Size L', 999, b'1', b'1'),
(338, 'ESTS046', 'ESTS04612CT06MB_WH-XL', 'WH', 'Size XL', 999, b'1', b'1'),
(339, 'ESTS036', 'ESTS03612CA06MB_BL-XL', 'BL', 'Size XL', 0, b'0', b'1'),
(340, 'ESTS036', 'ESTS03612CA06MB_BL-L', 'BL', 'Size L', 0, b'0', b'1'),
(341, 'ESTS036', 'ESTS03612CA06MB_BL-M', 'BL', 'Size M', 0, b'0', b'1'),
(342, 'ESTS036', 'ESTS03612CA06MB_BL-S', 'BL', 'Size S', 0, b'0', b'1'),
(343, 'ESTS036', 'ESTS03612CA06MB_WH-L', 'WH', 'Size L', 999, b'1', b'1'),
(344, 'ESTS036', 'ESTS03612CA06MB_WH-S', 'WH', 'Size S', 999, b'1', b'1'),
(345, 'ESTS036', 'ESTS03612CA06MB_WH-M', 'WH', 'Size M', 0, b'0', b'1'),
(346, 'ESTS036', 'ESTS03612CA06MB_WH-XL', 'WH', 'Size XL', 0, b'0', b'1'),
(347, 'ESTB026', 'ESTB02672LI00RB_DNV-38', 'DNV', 'Size 38', 999, b'1', b'1'),
(348, 'ESTB026', 'ESTB02672LI00RB_DNV-39', 'DNV', 'Size 39', 999, b'1', b'1'),
(349, 'ESTB026', 'ESTB02672LI00RB_DNV-40', 'DNV', 'Size 40', 999, b'1', b'1'),
(350, 'ESTB026', 'ESTB02672LI00RB_DNV-41', 'DNV', 'Size 41', 999, b'1', b'1'),
(351, 'ESTB026', 'ESTB02672LI00RB_DNV-42', 'DNV', 'Size 42', 999, b'1', b'1'),
(352, 'ESTB026', 'ESTB02672LI00RB_WH-40', 'WH', 'Size 40', 999, b'1', b'1'),
(353, 'ESTB026', 'ESTB02672LI00RB_WH-39', 'WH', 'Size 39', 0, b'0', b'1'),
(354, 'ESTB026', 'ESTB02672LI00RB_WH-38', 'WH', 'Size 38', 0, b'0', b'1'),
(355, 'ESTB026', 'ESTB02672LI00RB_WH-41', 'WH', 'Size 41', 0, b'0', b'1'),
(356, 'ESTB026', 'ESTB02672LI00RB_WH-42', 'WH', 'Size XL', 999, b'1', b'1'),
(357, 'ESTB026', 'ESTB02672LI00RB_LG-38', 'LG', 'Size 38', 999, b'1', b'1'),
(358, 'ESTB026', 'ESTB02672LI00RB_LG-39', 'LG', 'Size 39', 0, b'0', b'1'),
(359, 'ESTB026', 'ESTB02672LI00RB_LG-40', 'LG', 'Size 40', 0, b'0', b'1'),
(360, 'ESTB026', 'ESTB02672LI00RB_LG-41', 'LG', 'Size 41', 999, b'1', b'1'),
(361, 'ESTB026', 'ESTB02672LI00RB_LG-42', 'LG', 'Size 42', 999, b'1', b'1'),
(362, 'ESTB026', 'ESTB02672LI00RB_LCR-42', 'LCR', 'Size 42', 999, b'1', b'1'),
(363, 'ESTB026', 'ESTB02672LI00RB_LCR-41', 'LCR', 'Size 41', 999, b'1', b'1'),
(364, 'ESTB026', 'ESTB02672LI00RB_LCR-40', 'LCR', 'Size 40', 0, b'0', b'1'),
(365, 'ESTB026', 'ESTB02672LI00RB_LCR-39', 'LCR', 'Size 39', 0, b'0', b'1'),
(366, 'ESTB026', 'ESTB02672LI00RB_LCR-38', 'LCR', 'Size 38', 999, b'1', b'1'),
(367, 'ESTB026', 'ESTB02672LI00RB_LB-42', 'LB', 'Size 42', 999, b'1', b'1'),
(368, 'ESTB026', 'ESTB02672LI00RB_LB-41', 'LB', 'Size 41', 999, b'1', b'1'),
(369, 'ESTB026', 'ESTB02672LI00RB_LB-40', 'LB', 'Size 40', 999, b'1', b'1'),
(370, 'ESTB026', 'ESTB02672LI00RB_LB-39', 'LB', 'Size 39', 999, b'1', b'1'),
(371, 'ESTB026', 'ESTB02672LI00RB_LB-38', 'LB', 'Size 38', 999, b'1', b'1'),
(372, 'ESTB030', 'ESTB03071BA02SB_WH-38', 'WH', 'Size 38', 999, b'1', b'1'),
(373, 'ESTB030', 'ESTB03071BA02SB_WH-39', 'WH', 'Size 39', 999, b'1', b'1'),
(374, 'ESTB030', 'ESTB03071BA02SB_WH-40', 'WH', 'Size 40', 999, b'1', b'1'),
(375, 'ESTB030', 'ESTB03071BA02SB_WH-41', 'WH', 'Size 41', 999, b'1', b'1'),
(376, 'ESTB030', 'ESTB03071BA02SB_WH-42', 'WH', 'Size 42', 999, b'1', b'1'),
(377, 'ESTB030', 'ESTB03071BA02SB_LCB-38', 'LCB', 'Size 38', 999, b'1', b'1'),
(378, 'ESTB030', 'ESTB03071BA02SB_LCB-39', 'LCB', 'Size 39', 999, b'1', b'1'),
(379, 'ESTB030', 'ESTB03071BA02SB_LCB-40', 'LCB', 'Size 40', 999, b'1', b'1'),
(380, 'ESTB030', 'ESTB03071BA02SB_LCB-41', 'LCB', 'Size 41', 999, b'1', b'1'),
(381, 'ESTB030', 'ESTB03071BA02SB_LCB-42', 'LCB', 'Size 42', 999, b'1', b'1'),
(382, 'DATB614', 'DATB61471BA00SB_LLB-38', 'LLB', 'Size 38', 999, b'1', b'1'),
(383, 'DATB614', 'DATB61471BA00SB_LLB-39', 'LLB', 'Size 39', 0, b'0', b'1'),
(384, 'DATB614', 'DATB61471BA00SB_LLB-40', 'LLB', 'Size 40', 999, b'1', b'1'),
(385, 'DATB614', 'DATB61471BA00SB_LLB-41', 'LLB', 'Size 41', 999, b'1', b'1'),
(386, 'DATB614', 'DATB61471BA00SB_LLB-42', 'LLB', 'Size 42', 999, b'1', b'1'),
(387, 'DATB614', 'DATB61471BA00SB_WH-38', 'WH', 'Size 38', 999, b'1', b'1'),
(388, 'DATB614', 'DATB61471BA00SB_WH-39', 'WH', 'Size 39', 999, b'1', b'1'),
(389, 'DATB614', 'DATB61471BA00SB_WH-40', 'WH', 'Size 39', 0, b'0', b'1'),
(390, 'DATB614', 'DATB61471BA00SB_WH-41', 'WH', 'Size 41', 999, b'1', b'1'),
(391, 'DATB614', 'DATB61471BA00SB_WH-42', 'WH', 'Size 42', 999, b'1', b'1'),
(392, 'DATB614', 'DATB61471BA00SB_NV-38', 'NV', 'Size 38', 999, b'1', b'1'),
(393, 'DATB614', 'DATB61471BA00SB_NV-39', 'NV', 'Size 39', 999, b'1', b'1'),
(394, 'DATB614', 'DATB61471BA00SB_NV-40', 'NV', 'Size 40', 0, b'0', b'1'),
(395, 'DATB614', 'DATB61471BA00SB_NV-41', 'NV', 'Size 41', 999, b'1', b'1'),
(396, 'DATB614', 'DATB61471BA00SB_NV-42', 'NV', 'Size 42', 999, b'1', b'1'),
(397, 'DATB614', 'DATB61471BA00SB_BL-38', 'BL', 'Size 38', 999, b'1', b'1'),
(398, 'DATB614', 'DATB61471BA00SB_BL-39', 'BL', 'Size 39', 0, b'0', b'1'),
(399, 'DATB614', 'DATB61471BA00SB_BL-40', 'BL', 'Size 40', 0, b'0', b'1'),
(400, 'DATB614', 'DATB61471BA00SB_BL-41', 'BL', 'Size 41', 999, b'1', b'1'),
(401, 'DATB614', 'DATB61471BA00SB_BL-42', 'BL', 'Size 42', 999, b'1', b'1'),
(402, 'DATB920', 'DATB92071BA00SB_BL-38', 'BL', 'Size 38', 999, b'1', b'1'),
(403, 'DATB920', 'DATB92071BA00SB_BL-39', 'BL', 'Size 39', 999, b'1', b'1'),
(404, 'DATB920', 'DATB92071BA00SB_BL-40', 'BL', 'Size 40', 999, b'1', b'1'),
(405, 'DATB920', 'DATB92071BA00SB_BL-41', 'BL', 'Size 41', 999, b'1', b'1'),
(406, 'DATB920', 'DATB92071BA00SB_BL-42', 'BL', 'Size 42', 999, b'1', b'1'),
(407, 'DATB920', 'DATB92071BA00SB_WH-38', 'WH', 'Size 38', 999, b'1', b'1'),
(408, 'DATB920', 'DATB92071BA00SB_WH-39', 'WH', 'Size 39', 999, b'1', b'1'),
(409, 'DATB920', 'DATB92071BA00SB_WH-40', 'WH', 'Size 40', 999, b'1', b'1'),
(410, 'DATB920', 'DATB92071BA00SB_WH-41', 'WH', 'Size 41', 999, b'1', b'1'),
(411, 'DATB920', 'DATB92071BA00SB_WH-42', 'WH', 'Size 42', 999, b'1', b'1'),
(412, 'DATB920', 'DATB92071BA00SB_LB-38', 'LB', 'Size 38', 999, b'1', b'1'),
(413, 'DATB920', 'DATB92071BA00SB_LB-39', 'LB', 'Size 39', 999, b'1', b'1'),
(414, 'DATB920', 'DATB92071BA00SB_LB-40', 'LB', 'Size 40', 999, b'1', b'1'),
(415, 'DATB920', 'DATB92071BA00SB_LB-41', 'LB', 'Size 41', 999, b'1', b'1'),
(416, 'DATB920', 'DATB92071BA00SB_LB-42', 'LB', 'Size 42', 999, b'1', b'1'),
(417, 'DATB920', 'DATB92071BA00SB_NV-38', 'NV', 'Size 38', 999, b'1', b'1'),
(418, 'DATB920', 'DATB92071BA00SB_NV-39', 'NV', 'Size 39', 999, b'1', b'1'),
(419, 'DATB920', 'DATB92071BA00SB_NV-40', 'NV', 'Size 40', 999, b'1', b'1'),
(420, 'DATB920', 'DATB92071BA00SB_NV-41', 'NV', 'Size 41', 999, b'1', b'1'),
(421, 'DATB920', 'DATB92071BA00SB_NV-42', 'NV', 'Size 42', 999, b'1', b'1'),
(422, 'EATB006', 'EATB00671LI13RB_DNV-38', 'DNV', 'Size 38', 999, b'1', b'1'),
(423, 'EATB006', 'EATB00671LI13RB_DNV-39', 'DNV', 'Size 39', 999, b'1', b'1'),
(424, 'EATB006', 'EATB00671LI13RB_DNV-40', 'DNV', 'Size 40', 0, b'0', b'1'),
(425, 'EATB006', 'EATB00671LI13RB_DNV-41', 'DNV', 'Size 41', 999, b'1', b'1'),
(426, 'EATB006', 'EATB00671LI13RB_DNV-42', 'DNV', 'Size 42', 999, b'1', b'1'),
(427, 'EATB006', 'EATB00671LI13RB_WH-38', 'WH', 'Size 38', 999, b'1', b'1'),
(428, 'EATB006', 'EATB00671LI13RB_WH-39', 'WH', 'Size 39', 999, b'1', b'1'),
(429, 'EATB006', 'EATB00671LI13RB_WH-40', 'WH', 'Size 40', 999, b'1', b'1'),
(430, 'EATB006', 'EATB00671LI13RB_WH-41', 'WH', 'Size 41', 999, b'1', b'1'),
(431, 'EATB006', 'EATB00671LI13RB_WH-42', 'WH', 'Size 42', 999, b'1', b'1'),
(432, 'EATB006', 'EATB00671LI13RB_LG-38', 'LG', 'Size 38', 999, b'1', b'1'),
(433, 'EATB006', 'EATB00671LI13RB_LG-39', 'LG', 'Size 39', 0, b'0', b'1'),
(434, 'EATB006', 'EATB00671LI13RB_LG-40', 'LG', 'Size 40', 0, b'0', b'1'),
(435, 'EATB006', 'EATB00671LI13RB_LG-41', 'LG', 'Size 41', 999, b'1', b'1'),
(436, 'EATB006', 'EATB00671LI13RB_LG-42', 'LG', 'Size 42', 999, b'1', b'1'),
(437, 'EATB006', 'EATB00671LI13RB_LB-39', 'LB', 'Size 39', 999, b'1', b'1'),
(438, 'EATB006', 'EATB00671LI13RB_LB-38', 'LB', 'Size 38', 999, b'1', b'1'),
(439, 'EATB006', 'EATB00671LI13RB_LB-40', 'LB', 'Size 40', 999, b'1', b'1'),
(440, 'EATB006', 'EATB00671LI13RB_LB-41', 'LB', 'Size 41', 999, b'1', b'1'),
(441, 'EATB006', 'EATB00671LI13RB_LB-42', 'LB', 'Size 42', 999, b'1', b'1'),
(442, 'DATB416', 'DATB41671CA11RB_NBX-38', 'NBX', 'Size 38', 992, b'1', b'1'),
(443, 'DATB416', 'DATB41671CA11RB_NBX-39', 'NBX', 'Size 39', 996, b'1', b'1'),
(444, 'DATB416', 'DATB41671CA11RB_NBX-40', 'NBX', 'Size 40', 999, b'1', b'1'),
(445, 'DATB416', 'DATB41671CA11RB_NBX-41', 'NBX', 'Size 41', 999, b'1', b'1'),
(446, 'DATB416', 'DATB41671CA11RB_NBX-42', 'NBX', 'Size 42', 999, b'1', b'1'),
(447, 'EATB003', 'EATB00371CA11SB_GN-38', 'GN', 'Size 38', 999, b'1', b'1'),
(448, 'EATB003', 'EATB00371CA11SB_GN-39', 'GN', 'Size 39', 999, b'1', b'1'),
(449, 'EATB003', 'EATB00371CA11SB_GN-40', 'GN', 'Size 40', 0, b'0', b'1'),
(450, 'EATB003', 'EATB00371CA11SB_GN-41', 'GN', 'Size 41', 0, b'0', b'1'),
(451, 'EATB003', 'EATB00371CA11SB_GN-42', 'GN', 'Size 42', 999, b'1', b'1'),
(452, 'EATB003', 'EATB00371CA11SB_LB-38', 'LB', 'Size 38', 999, b'1', b'1'),
(453, 'EATB003', 'EATB00371CA11SB_LB-39', 'LB', 'Size 39', 999, b'1', b'1'),
(454, 'EATB003', 'EATB00371CA11SB_LB-40', 'LB', 'Size 40', 999, b'1', b'1'),
(455, 'EATB003', 'EATB00371CA11SB_LB-41', 'LB', 'Size 41', 999, b'1', b'1'),
(456, 'EATB003', 'EATB00371CA11SB_LB-42', 'LB', 'Size 42', 999, b'1', b'1'),
(457, 'EATB003', 'EATB00371CA11SB_BL-38', 'BL', 'Size 38', 999, b'1', b'1'),
(458, 'EATB003', 'EATB00371CA11SB_BL-39', 'BL', 'Size 39', 999, b'1', b'1'),
(459, 'EATB003', 'EATB00371CA11SB_BL-40', 'BL', 'Size 40', 999, b'1', b'1'),
(460, 'EATB003', 'EATB00371CA11SB_BL-41', 'BL', 'Size 41', 999, b'1', b'1'),
(461, 'EATB003', 'EATB00371CA11SB_BL-42', 'BL', 'Size 42', 999, b'1', b'1'),
(462, 'DABK906', 'DABK90601CT00SB_NV-29', 'NV', 'Size 29', 999, b'1', b'1'),
(463, 'DABK906', 'DABK90601CT00SB_NV-30', 'NV', 'Size 30', 999, b'1', b'1'),
(464, 'DABK906', 'DABK90601CT00SB_NV-31', 'NV', 'Size 31', 999, b'1', b'1'),
(465, 'DABK906', 'DABK90601CT00SB_NV-32', 'NV', 'Size 32', 999, b'1', b'1'),
(466, 'DABK906', 'DABK90601CT00SB_NV-33', 'NV', 'Size 33', 999, b'1', b'1'),
(467, 'DABK906', 'DABK90601CT00SB_LG-29', 'LG', 'Size 29', 999, b'1', b'1'),
(468, 'DABK906', 'DABK90601CT00SB_LG-30', 'LG', 'Size 30', 999, b'1', b'1'),
(469, 'DABK906', 'DABK90601CT00SB_LG-31', 'LG', 'Size 31', 999, b'1', b'1'),
(470, 'DABK906', 'DABK90601CT00SB_LG-32', 'LG', 'Size 32', 999, b'1', b'1'),
(471, 'DABK906', 'DABK90601CT00SB_LG-33', 'LG', 'Size 33', 999, b'1', b'1'),
(472, 'DABK906', 'DABK90601CT00SB_CN-29', 'CN', 'Size 29', 999, b'1', b'1'),
(473, 'DABK906', 'DABK90601CT00SB_CN-30', 'CN', 'Size 30', 999, b'1', b'1'),
(474, 'DABK906', 'DABK90601CT00SB_CN-31', 'CN', 'Size 31', 999, b'1', b'1'),
(475, 'DABK906', 'DABK90601CT00SB_CN-32', 'CN', 'Size 32', 999, b'1', b'1'),
(476, 'DABK906', 'DABK90601CT00SB_CN-33', 'CN', 'Size 33', 999, b'1', b'1'),
(477, 'DABK906', 'DABK90601CT00SB_BL-31', 'BL', 'Size 31', 999, b'1', b'1'),
(478, 'DABK906', 'DABK90601CT00SB_BL-30', 'BL', 'Size 30', 0, b'0', b'1'),
(479, 'DABK906', 'DABK90601CT00SB_BL-32', 'BL', 'Size 32', 0, b'0', b'1'),
(480, 'DABK906', 'DABK90601CT00SB_BL-33', 'BL', 'Size 33', 999, b'1', b'1'),
(481, 'DABK906', 'DABK90601CT00SB_BL-29', 'BL', 'Size 29', 999, b'1', b'1'),
(482, 'DABK908', 'DABK90801CT00SB_NV-29', 'NV', 'Size 29', 999, b'1', b'1'),
(483, 'DABK908', 'DABK90801CT00SB_NV-30', 'NV', 'Size 30', 999, b'1', b'1'),
(484, 'DABK908', 'DABK90801CT00SB_NV-31', 'NV', 'Size 31', 0, b'0', b'1'),
(485, 'DABK908', 'DABK90801CT00SB_NV-32', 'NV', 'Size 32', 999, b'1', b'1'),
(486, 'DABK908', 'DABK90801CT00SB_NV-33', 'NV', 'Size 33', 999, b'1', b'1'),
(487, 'DABK908', 'DABK90801CT00SB_LG-32', 'LG', 'Size 32', 999, b'1', b'1'),
(488, 'DABK908', 'DABK90801CT00SB_LG-33', 'LG', 'Size 33', 999, b'1', b'1'),
(489, 'DABK908', 'DABK90801CT00SB_LG-31', 'LG', 'Size 31', 0, b'0', b'1'),
(490, 'DABK908', 'DABK90801CT00SB_LG-30', 'LG', 'Size 30', 999, b'1', b'1'),
(491, 'DABK908', 'DABK90801CT00SB_LG-29', 'LG', 'Size 29', 999, b'1', b'1'),
(492, 'DABK908', 'DABK90801CT00SB_CN-29', 'CN', 'Size 29', 999, b'1', b'1'),
(493, 'DABK908', 'DABK90801CT00SB_CN-30', 'CN', 'Size 30', 0, b'0', b'1'),
(494, 'DABK908', 'DABK90801CT00SB_CN-31', 'CN', 'Size 31', 999, b'1', b'1'),
(495, 'DABK908', 'DABK90801CT00SB_CN-32', 'CN', 'Size 32', 999, b'1', b'1'),
(496, 'DABK908', 'DABK90801CT00SB_CN-33', 'CN', 'Size 33', 999, b'1', b'1'),
(497, 'DABK908', 'DABK90801CT00SB_BL-30', 'BL', 'Size 30', 999, b'1', b'1'),
(498, 'DABK908', 'DABK90801CT00SB_BL-29', 'BL', 'Size 29', 999, b'1', b'1'),
(499, 'DABK908', 'DABK90801CT00SB_BL-31', 'BL', 'Size 31', 999, b'1', b'1'),
(500, 'DABK908', 'DABK90801CT00SB_BL-32', 'BL', 'Size 32', 999, b'1', b'1'),
(501, 'DABK908', 'DABK90801CT00SB_BL-33', 'BL', 'Size 33', 0, b'0', b'1'),
(502, 'EABT021', 'EABT02101PE00SB_BL-29', 'BL', 'Size 29', 999, b'1', b'1'),
(503, 'EABT021', 'EABT02101PE00SB_BL-30', 'BL', 'Size 30', 999, b'1', b'1'),
(504, 'EABT021', 'EABT02101PE00SB_BL-31', 'BL', 'Size 31', 999, b'1', b'1'),
(505, 'EABT021', 'EABT02101PE00SB_BL-32', 'BL', 'Size 32', 999, b'1', b'1'),
(506, 'EABT021', 'EABT02101PE00SB_BL-33', 'BL', 'Size 33', 999, b'1', b'1'),
(507, 'EABT019', 'EABT01901PE00SB_DNV-29', 'DNV', 'Size 29', 999, b'1', b'1'),
(508, 'EABT019', 'EABT01901PE00SB_DNV-30', 'DNV', 'Size 30', 999, b'1', b'1'),
(509, 'EABT019', 'EABT01901PE00SB_DNV-31', 'DNV', 'Size 31', 999, b'1', b'1'),
(510, 'EABT019', 'EABT01901PE00SB_DNV-32', 'DNV', 'Size 32', 999, b'1', b'1'),
(511, 'EABT019', 'EABT01901PE00SB_DNV-33', 'DNV', 'Size 33', 999, b'1', b'1'),
(512, 'EABT019', 'EABT01901PE00SB_LBL-29', 'LBL', 'Size 29', 999, b'1', b'1'),
(513, 'EABT019', 'EABT01901PE00SB_LBL-30', 'LBL', 'Size 30', 999, b'1', b'1'),
(514, 'EABT019', 'EABT01901PE00SB_LBL-31', 'LBL', 'Size 31', 999, b'1', b'1'),
(515, 'EABT019', 'EABT01901PE00SB_LBL-32', 'LBL', 'Size 32', 0, b'0', b'1'),
(516, 'EABT019', 'EABT01901PE00SB_LBL-33', 'LBL', 'Size 33', 999, b'1', b'1'),
(517, 'EABT019', 'EABT01901PE00SB_GR-29', 'GR', 'Size 29', 999, b'1', b'1'),
(518, 'EABT019', 'EABT01901PE00SB_GR-30', 'GR', 'Size 30', 0, b'0', b'1'),
(519, 'EABT019', 'EABT01901PE00SB_GR-31', 'GR', 'Size 31', 999, b'1', b'1'),
(520, 'EABT019', 'EABT01901PE00SB_GR-32', 'GR', 'Size 32', 999, b'1', b'1'),
(521, 'EABT019', 'EABT01901PE00SB_GR-33', 'GR', 'Size 33', 999, b'1', b'1'),
(522, 'EABT019', 'EABT01901PE00SB_BL-29', 'BL', 'Size 29', 999, b'1', b'1'),
(523, 'EABT019', 'EABT01901PE00SB_BL-30', 'BL', 'Size 30', 999, b'1', b'1'),
(524, 'EABT019', 'EABT01901PE00SB_BL-31', 'BL', 'Size 31', 999, b'1', b'1'),
(525, 'EABT019', 'EABT01901PE00SB_BL-32', 'BL', 'Size 32', 0, b'0', b'1'),
(526, 'EABT019', 'EABT01901PE00SB_BL-33', 'BL', 'Size 33', 999, b'1', b'1'),
(527, 'DABJ004', 'DABJ00401CT00SB_NV-29', 'NV', 'Size 29', 999, b'1', b'1'),
(528, 'DABJ004', 'DABJ00401CT00SB_NV-30', 'NV', 'Size 30', 999, b'1', b'1'),
(529, 'DABJ004', 'DABJ00401CT00SB_NV-31', 'NV', 'Size 31', 999, b'1', b'1'),
(530, 'DABJ004', 'DABJ00401CT00SB_NV-32', 'NV', 'Size 32', 999, b'1', b'1'),
(531, 'DABJ004', 'DABJ00401CT00SB_NV-33', 'NV', 'Size 33', 999, b'1', b'1'),
(532, 'DABJ010', 'DABJ01001CT00SB_BU-29', 'BU', 'Size 29', 999, b'1', b'1'),
(533, 'DABJ010', 'DABJ01001CT00SB_BU-30', 'BU', 'Size 30', -5, b'0', b'1'),
(534, 'DABJ010', 'DABJ01001CT00SB_BU-31', 'BU', 'Size 31', 999, b'1', b'1'),
(535, 'DABJ010', 'DABJ01001CT00SB_BU-32', 'BU', 'Size 32', 999, b'1', b'1'),
(536, 'DABJ010', 'DABJ01001CT00SB_BU-33', 'BU', 'Size 33', 999, b'1', b'1'),
(537, 'DABJ903', 'DABJ90301CT16SB_NV-33', 'NV', 'Size 33', 999, b'1', b'1'),
(538, 'DABJ903', 'DABJ90301CT16SB_NV-32', 'NV', 'Size 32', 999, b'1', b'1'),
(539, 'DABJ903', 'DABJ90301CT16SB_NV-31', 'NV', 'Size 31', 999, b'1', b'1'),
(540, 'DABJ903', 'DABJ90301CT16SB_NV-30', 'NV', 'Size 30', 999, b'1', b'1'),
(541, 'DABJ903', 'DABJ90301CT16SB_NV-29', 'NV', 'Size 29', 997, b'1', b'1'),
(542, 'DABJ908', 'DABJ90801CT19SB_DBU-29', 'DBU', 'Size 29', 997, b'1', b'1'),
(543, 'DABJ908', 'DABJ90801CT19SB_DBU-30', 'DBU', 'Size 30', 999, b'1', b'1'),
(544, 'DABJ908', 'DABJ90801CT19SB_DBU-31', 'DBU', 'Size 31', 999, b'1', b'1'),
(545, 'DABJ908', 'DABJ90801CT19SB_DBU-32', 'DBU', 'Size 32', 999, b'1', b'1'),
(546, 'DABJ908', 'DABJ90801CT19SB_DBU-33', 'DBU', 'Size 33', 999, b'1', b'1'),
(547, 'CABJ003', 'CABJ00301CT19SB_BU-29', 'BU', 'Size 29', 999, b'1', b'1'),
(548, 'CABJ003', 'CABJ00301CT19SB_BU-30', 'BU', 'Size 30', 999, b'1', b'1'),
(549, 'CABJ003', 'CABJ00301CT19SB_BU-31', 'BU', 'Size 31', 999, b'1', b'1'),
(550, 'CABJ003', 'CABJ00301CT19SB_BU-32', 'BU', 'Size 32', 999, b'1', b'1'),
(551, 'CABJ003', 'CABJ00301CT19SB_BU-33', 'BU', 'Size 33', 999, b'1', b'1'),
(552, 'DABJ904', 'DABJ90401CT19SB_NV-29', 'NV', 'Size 29', 0, b'0', b'1'),
(553, 'DABJ904', 'DABJ90401CT19SB_NV-30', 'NV', 'Size 30', 999, b'1', b'1'),
(554, 'DABJ904', 'DABJ90401CT19SB_NV-31', 'NV', 'Size 31', 999, b'1', b'1'),
(555, 'DABJ904', 'DABJ90401CT19SB_NV-32', 'NV', 'Size 32', 999, b'1', b'1'),
(556, 'DABJ904', 'DABJ90401CT19SB_NV-33', 'NV', 'Size 33', 999, b'1', b'1'),
(557, 'ESBW005', 'ESBW00502PE00RB_BL-S', 'BL', 'Size S', 999, b'1', b'1'),
(558, 'ESBW005', 'ESBW00502PE00RB_BL-M', 'BL', 'Size M', 999, b'1', b'1'),
(559, 'ESBW005', 'ESBW00502PE00RB_BL-L', 'BL', 'Size L', 999, b'1', b'1'),
(560, 'ESBW005', 'ESBW00502PE00RB_BL-XL', 'BL', 'Size XL', 999, b'1', b'1'),
(561, 'ESBW005', 'ESBW00502PE00RB_NV-S', 'NV', 'Size S', 999, b'1', b'1'),
(562, 'ESBW005', 'ESBW00502PE00RB_NV-M', 'NV', 'Size M', 999, b'1', b'1'),
(563, 'ESBW005', 'ESBW00502PE00RB_NV-L', 'NV', 'Size L', 999, b'1', b'1'),
(564, 'ESBW005', 'ESBW00502PE00RB_NV-XL', 'NV', 'Size XL', 999, b'1', b'1'),
(565, 'ESBW004', 'ESBW00402PE01MB_LG-S', 'LG', 'Size S', 999, b'1', b'1'),
(566, 'ESBW004', 'ESBW00402PE01MB_LG-M', 'LG', 'Size M', 0, b'0', b'1'),
(567, 'ESBW004', 'ESBW00402PE01MB_LG-L', 'LG', 'Size L', 999, b'1', b'1'),
(568, 'ESBW004', 'ESBW00402PE01MB_LG-XL', 'LG', 'Size XL', 999, b'1', b'1'),
(569, 'ESBW004', 'ESBW00402PE01MB_NV-S', 'NV', 'Size S', 999, b'1', b'1'),
(570, 'ESBW004', 'ESBW00402PE01MB_NV-M', 'NV', 'Size M', 999, b'1', b'1'),
(571, 'ESBW004', 'ESBW00402PE01MB_NV-L', 'NV', 'Size L', 999, b'1', b'1'),
(572, 'ESBW004', 'ESBW00402PE01MB_NV-XL', 'NV', 'Size XL', 999, b'1', b'1'),
(573, 'ESBW004', 'ESBW00402PE01MB_BL-S', 'BL', 'Size S', 999, b'1', b'1'),
(574, 'ESBW004', 'ESBW00402PE01MB_BL-M', 'BL', 'Size M', 999, b'1', b'1'),
(575, 'ESBW004', 'ESBW00402PE01MB_BL-L', 'BL', 'Size L', 999, b'1', b'1'),
(576, 'ESBW004', 'ESBW00402PE01MB_BL-XL', 'BL', 'Size XL', 999, b'1', b'1'),
(577, 'ESBK007', 'ESBK00702CT00RB_NV-29', 'NV', 'Size 29', 999, b'1', b'1'),
(578, 'ESBK007', 'ESBK00702CT00RB_NV-30', 'NV', 'Size 30', 0, b'0', b'1'),
(579, 'ESBK007', 'ESBK00702CT00RB_NV-31', 'NV', 'Size 31', 0, b'0', b'1'),
(580, 'ESBK007', 'ESBK00702CT00RB_NV-32', 'NV', 'Size 32', 999, b'1', b'1'),
(581, 'ESBK007', 'ESBK00702CT00RB_NV-33', 'NV', 'Size 33', 999, b'1', b'1'),
(582, 'ESBK007', 'ESBK00702CT00RB_LG-29', 'LG', 'Size 29', 999, b'1', b'1'),
(583, 'ESBK007', 'ESBK00702CT00RB_LG-30', 'LG', 'Size 30', 0, b'0', b'1'),
(584, 'ESBK007', 'ESBK00702CT00RB_LG-31', 'LG', 'Size 31', 999, b'1', b'1'),
(585, 'ESBK007', 'ESBK00702CT00RB_LG-32', 'LG', 'Size 32', 999, b'1', b'1'),
(586, 'ESBK007', 'ESBK00702CT00RB_LG-33', 'LG', 'Size 33', 0, b'0', b'1'),
(587, 'ESBK007', 'ESBK00702CT00RB_BL-29', 'BL', 'Size 29', 999, b'1', b'1'),
(588, 'ESBK007', 'ESBK00702CT00RB_BL-30', 'BL', 'Size 30', 999, b'1', b'1'),
(589, 'ESBK007', 'ESBK00702CT00RB_BL-31', 'BL', 'Size 31', 0, b'0', b'1'),
(590, 'ESBK007', 'ESBK00702CT00RB_BL-32', 'BL', 'Size 32', 999, b'1', b'1'),
(591, 'ESBK007', 'ESBK00702CT00RB_BL-33', 'BL', 'Size 33', 999, b'1', b'1'),
(592, 'ESBK002', 'ESBK00202CT00RB_NV-29', 'NV', 'Size 29', 999, b'1', b'1'),
(593, 'ESBK002', 'ESBK00202CT00RB_NV-30', 'NV', 'Size 30', 0, b'0', b'1'),
(594, 'ESBK002', 'ESBK00202CT00RB_NV-31', 'NV', 'Size 31', 999, b'1', b'1'),
(595, 'ESBK002', 'ESBK00202CT00RB_NV-32', 'NV', 'Size 32', 999, b'1', b'1'),
(596, 'ESBK002', 'ESBK00202CT00RB_NV-33', 'NV', 'Size 33', 999, b'1', b'1'),
(597, 'ESBK002', 'ESBK00202CT00RB_LG-29', 'LG', 'Size 29', 999, b'1', b'1'),
(598, 'ESBK002', 'ESBK00202CT00RB_LG-30', 'LG', 'Size 30', 0, b'0', b'1'),
(599, 'ESBK002', 'ESBK00202CT00RB_LG-31', 'LG', 'Size 31', 999, b'1', b'1'),
(600, 'ESBK002', 'ESBK00202CT00RB_LG-32', 'LG', 'Size 32', 999, b'1', b'1'),
(601, 'ESBK002', 'ESBK00202CT00RB_LG-33', 'LG', 'Size 33', 999, b'1', b'1'),
(602, 'ESBK002', 'ESBK00202CT00RB_BL-29', 'BL', 'Size 29', 0, b'0', b'1'),
(603, 'ESBK002', 'ESBK00202CT00RB_BL-30', 'BL', 'Size 30', 999, b'1', b'1'),
(604, 'ESBK002', 'ESBK00202CT00RB_BL-31', 'BL', 'Size 31', 999, b'1', b'1'),
(605, 'ESBK002', 'ESBK00202CT00RB_BL-32', 'BL', 'Size 32', 999, b'1', b'1'),
(606, 'ESBK002', 'ESBK00202CT00RB_BL-33', 'BE', 'Size 33', 999, b'1', b'1'),
(607, 'ESBK002', 'ESBK00202CT00RB_BE-29', 'BE', 'Size 29', 999, b'1', b'1'),
(608, 'ESBK002', 'ESBK00202CT00RB_BE-30', 'BE', 'Size 30', 999, b'1', b'1'),
(609, 'ESBK002', 'ESBK00202CT00RB_BE-31', 'BE', 'Size 31', 999, b'1', b'1'),
(610, 'ESBK002', 'ESBK00202CT00RB_BE-32', 'BE', 'Size 32', 999, b'1', b'1'),
(611, 'ESBK002', 'ESBK00202CT00RB_BE-33', 'BE', 'Size 33', 999, b'1', b'1'),
(612, 'BI013', 'DSBI01302LI00SB_BE-29', 'BE', 'Size 29', 996, b'1', b'1'),
(613, 'BI013', 'DSBI01302LI00SB_BE-30', 'BE', 'Size 30', 999, b'1', b'1'),
(614, 'BI013', 'DSBI01302LI00SB_BE-31', 'BE', 'Size 31', 991, b'1', b'1'),
(615, 'BI013', 'DSBI01302LI00SB_BE-32', 'BE', 'Size 32', 999, b'1', b'1'),
(616, 'BI013', 'DSBI01302LI00SB_BE-33', 'BE', 'Size 33', 999, b'1', b'1'),
(617, 'BI013', 'DSBI01302LI00SB_WH-29', 'WH', 'Size 29', 999, b'1', b'1'),
(618, 'BI013', 'DSBI01302LI00SB_WH-31', 'WH', 'Size 31', 999, b'1', b'1'),
(619, 'BI013', 'DSBI01302LI00SB_WH-30', 'WH', 'Size 30', 999, b'1', b'1'),
(620, 'BI013', 'DSBI01302LI00SB_WH-32', 'WH', 'Size 32', 999, b'1', b'1'),
(621, 'BI013', 'DSBI01302LI00SB_WH-33', 'WH', 'Size 33', 999, b'1', b'1'),
(622, 'BI013', 'DSBI01302LI00SB_LB-31', 'LB', 'Size 31', 999, b'1', b'1'),
(623, 'BI013', 'DSBI01302LI00SB_LB-30', 'LB', 'Size 30', 999, b'1', b'1'),
(624, NULL, 'DSBI01302LI00SB_LB-29', 'LB', 'Size 29', 0, b'0', b'1'),
(625, 'BI013', 'DSBI01302LI00SB_LB-32', 'LB', 'Size 32', 999, b'1', b'1'),
(626, 'BI013', 'DSBI01302LI00SB_LB-33', 'LB', 'Size 33', 999, b'1', b'1'),
(627, 'BI013', 'DSBI01302LI00SB_LG-29', 'LG', 'Size 29', 999, b'1', b'1'),
(628, 'BI013', 'DSBI01302LI00SB_LG-30', 'LG', 'Size 30', 0, b'0', b'1'),
(629, 'BI013', 'DSBI01302LI00SB_LG-31', 'LG', 'Size 31', 999, b'1', b'1'),
(630, 'BI013', 'DSBI01302LI00SB_LG-32', 'LG', 'Size 32', 999, b'1', b'1'),
(631, 'BI013', 'DSBI01302LI00SB_LG-33', 'LG', 'Size 33', 999, b'1', b'1'),
(632, 'BI013', 'DSBI01302LI00SB_NV-29', 'NV', 'Size 29', 999, b'1', b'1'),
(633, 'BI013', 'DSBI01302LI00SB_NV-30', 'NV', 'Size 30', 999, b'1', b'1'),
(634, 'BI013', 'DSBI01302LI00SB_NV-31', 'NV', 'Size 31', 999, b'1', b'1'),
(635, 'BI013', 'DSBI01302LI00SB_NV-32', 'NV', 'Size 32', 999, b'1', b'1'),
(636, 'BI013', 'DSBI01302LI00SB_NV-33', 'NV', 'Size 33', 999, b'1', b'1'),
(637, 'BI013', 'DSBI01302LI00SB_BL-29', 'BL', 'Size 29', 999, b'1', b'1'),
(638, 'BI013', 'DSBI01302LI00SB_BL-30', 'BL', 'Size 30', 999, b'1', b'1'),
(639, 'BI013', 'DSBI01302LI00SB_BL-31', 'BL', 'Size 31', 999, b'1', b'1'),
(640, 'BI013', 'DSBI01302LI00SB_BL-32', 'BL', 'Size 31', 999, b'1', b'1'),
(641, 'BI013', 'DSBI01302LI00SB_BL-33', 'BL', 'Size 33', 999, b'1', b'1'),
(642, 'ESBI006', 'ESBI00602CA00SB_BL-29', 'BL', 'Size 29', 999, b'1', b'1'),
(643, 'ESBI006', 'ESBI00602CA00SB_BL-30', 'BL', 'Size 29', 999, b'1', b'1'),
(644, 'ESBI006', 'ESBI00602CA00SB_BL-31', 'BL', 'Size 31', 999, b'1', b'1'),
(645, 'ESBI006', 'ESBI00602CA00SB_BL-32', 'BL', 'Size 32', 999, b'1', b'1'),
(646, 'ESBI006', 'ESBI00602CA00SB_BL-33', 'BL', 'Size 33', 999, b'1', b'1'),
(647, 'ESBI006', 'ESBI00602CA00SB_NV-29', 'NV', 'Size 29', 999, b'1', b'1'),
(648, 'ESBI006', 'ESBI00602CA00SB_NV-30', 'NV', 'Size 30', 999, b'1', b'1'),
(649, 'ESBI006', 'ESBI00602CA00SB_NV-31', 'NV', 'Size 31', 999, b'1', b'1'),
(650, 'ESBI006', 'ESBI00602CA00SB_NV-32', 'NV', 'Size 32', 999, b'1', b'1'),
(651, 'ESBI006', 'ESBI00602CA00SB_NV-33', 'NV', 'Size 33', 999, b'1', b'1'),
(652, 'ESBI006', 'ESBI00602CA00SB_LG-29', 'LG', 'Size 29', 999, b'1', b'1'),
(653, 'ESBI006', 'ESBI00602CA00SB_LG-30', 'LG', 'Size 30', 999, b'1', b'1'),
(654, 'ESBI006', 'ESBI00602CA00SB_LG-31', 'LG', 'Size 31', 999, b'1', b'1'),
(655, 'ESBI006', 'ESBI00602CA00SB_LG-32', 'LG', 'Size 32', 999, b'1', b'1'),
(656, 'ESBI006', 'ESBI00602CA00SB_LG-33', 'LG', 'Size 33', 999, b'1', b'1'),
(657, 'ESBI006', 'ESBI00602CA00SB_CR-29', 'CR', 'Size 29', 999, b'1', b'1'),
(658, 'ESBI006', 'ESBI00602CA00SB_CR-30', 'CR', 'Size 30', 999, b'1', b'1'),
(659, 'ESBI006', 'ESBI00602CA00SB_CR-31', 'CR', 'Size 31', 999, b'1', b'1'),
(660, 'ESBI006', 'ESBI00602CA00SB_CR-32', 'CR', 'Size 32', 999, b'1', b'1'),
(661, 'ESBI006', 'ESBI00602CA00SB_CR-33', 'CR', 'Size 33', 999, b'1', b'1'),
(662, 'ESBI006', 'ESBI00602CA00SB_WH-29', 'WH', 'Size 29', 999, b'1', b'1'),
(663, 'ESBI006', 'ESBI00602CA00SB_WH-30', 'WH', 'Size 30', 999, b'1', b'1'),
(664, 'ESBI006', 'ESBI00602CA00SB_WH-31', 'WH', 'Size 31', 999, b'1', b'1'),
(665, 'ESBI006', 'ESBI00602CA00SB_WH-32', 'WH', 'Size 32', 999, b'1', b'1'),
(666, 'ESBI006', 'ESBI00602CA00SB_WH-33', 'WH', 'Size 33', 999, b'1', b'1'),
(667, 'DWBS012', 'DWBS01203CV00SB_CN-S', 'CN', 'Size S', 999, b'1', b'1'),
(668, 'DWBS012', 'DWBS01203CV00SB_CN-M', 'CN', 'Size M', 999, b'1', b'1'),
(669, 'DWBS012', 'DWBS01203CV00SB_CN-L', 'CN', 'Size L', 999, b'1', b'1'),
(670, 'DWBS012', 'DWBS01203CV00SB_CN-XL', 'CN', 'Size XL', 999, b'1', b'1'),
(671, 'DWBS012', 'DWBS01203CV00SB_DGR-S-S', 'DGN', 'Size S', 999, b'1', b'1'),
(672, 'DWBS012', 'DWBS01203CV00SB_DGR-M', 'DGN', 'Size M', 999, b'1', b'1'),
(673, 'DWBS012', 'DWBS01203CV00SB_DGR-L', 'DGN', 'Size L', 999, b'1', b'1'),
(674, 'DWBS012', 'DWBS01203CV00SB_DGR-XL', 'DGN', 'Size XL', 999, b'1', b'1'),
(675, 'DWBS012', 'DWBS01203CV00SB_NV-S', 'NV', 'Size S', 999, b'1', b'1'),
(676, 'DWBS012', 'DWBS01203CV00SB_NV-M', 'NV', 'Size M', 999, b'1', b'1'),
(677, 'DWBS012', 'DWBS01203CV00SB_NV-L', 'NV', 'Size L', 999, b'1', b'1'),
(678, 'DWBS012', 'DWBS01203CV00SB_NV-XL', 'NV', 'Size XL', 999, b'1', b'1'),
(679, 'EWCW007', 'EWCW00751PE00SB_LG-S', 'LG', 'Size S', 999, b'1', b'1'),
(680, 'EWCW007', 'EWCW00751PE00SB_LG-M', 'LG', 'Size M', 999, b'1', b'1'),
(681, 'EWCW007', 'EWCW00751PE00SB_LG-L', 'LG', 'Size L', 999, b'1', b'1'),
(682, 'EWCW007', 'EWCW00751PE00SB_LG-XL', 'LG', 'Size XL', 999, b'1', b'1'),
(683, 'EWCW007', 'EWCW00751PE00SB_NV-S', 'NV', 'Size S', 0, b'0', b'1'),
(684, 'EWCW007', 'EWCW00751PE00SB_NV-M', 'NV', 'Size M', 0, b'0', b'1'),
(685, 'EWCW007', 'EWCW00751PE00SB_NV-L', 'NV', 'Size L', 0, b'0', b'1'),
(686, 'EWCW007', 'EWCW00751PE00SB_NV-XL', 'NV', 'Size XL', 0, b'0', b'1'),
(687, 'EWCW007', 'EWCW00751PE00SB_BL-S', 'BL', 'Size S', 999, b'1', b'1'),
(688, 'EWCW007', 'EWCW00751PE00SB_BL-M', 'BL', 'Size M', 0, b'0', b'1'),
(689, 'EWCW007', 'EWCW00751PE00SB_BL-L', 'BL', 'Size L', 0, b'0', b'1'),
(690, 'EWCW007', 'EWCW00751PE00SB_BL-XL', 'BL', 'Size XL', 0, b'0', b'1'),
(691, 'DWCT001', 'DWCT00161PE00RB_NV-S', 'NV', 'Size S', 996, b'1', b'1'),
(692, 'DWCT001', 'DWCT00161PE00RB_NV-M', 'NV', 'Size M', 999, b'1', b'1'),
(693, 'DWCT001', 'DWCT00161PE00RB_NV-L', 'NV', 'Size L', 0, b'0', b'1'),
(694, 'DWCT001', 'DWCT00161PE00RB_NV-XL', 'NV', 'Size XL', 0, b'0', b'1'),
(695, 'DWCT001', 'DWCT00161PE00RB_DGR-M', 'DGR', 'Size M', 999, b'1', b'1'),
(696, 'DWCT001', 'DWCT00161PE00RB_DGR-S', 'DGR', 'Size S', 999, b'1', b'1'),
(697, 'DWCT004', 'DWCT00431PE32SB_BL-S', 'BL', 'Size S', 999, b'1', b'1'),
(698, 'DWCT004', 'DWCT00431PE32SB_BL-M', 'BL', 'Size M', 0, b'0', b'1'),
(699, 'DWCT004', 'DWCT00431PE32SB_BL-L', 'BL', 'Size L', 999, b'1', b'1'),
(700, 'DWCT004', 'DWCT00431PE32SB_BL-XL', 'BL', 'Size XL', 999, b'1', b'1'),
(701, 'DWCT004', 'DWCT00431PE32SB_WH-S', 'WH', 'Size S', 999, b'1', b'1'),
(702, 'DWCT004', 'DWCT00431PE32SB_WH-M', 'WH', 'Size M', 999, b'1', b'1'),
(703, 'DWCT004', 'DWCT00431PE32SB_WH-L', 'WH', 'Size L', 999, b'1', b'1'),
(704, 'DWCT004', 'DWCT00431PE32SB_WH-XL', 'WH', 'Size XL', 999, b'1', b'1'),
(705, 'DWCU007', 'DWCU00761PE32SB_ENV-M', 'ENV', 'Size M', 999, b'1', b'1'),
(706, 'DWCU007', 'DWCU00761PE32SB_ENV-S', 'ENV', 'Size S', 999, b'1', b'1'),
(707, 'DWCU007', 'DWCU00761PE32SB_ENV-L', 'ENV', 'Size L', 999, b'1', b'1'),
(708, 'DWCU007', 'DWCU00761PE32SB_ENV-XL', 'ENV', 'Size XL', 999, b'1', b'1'),
(709, 'DWCU007', 'DWCU00761PE32SB_LLG-S', 'LLG', 'Size S', 999, b'1', b'1'),
(710, 'DWCU007', 'DWCU00761PE32SB_LLG-M', 'LLG', 'Size M', 999, b'1', b'1'),
(711, 'DWCU007', 'DWCU00761PE32SB_LLG-L', 'LLG', 'Size L', 999, b'1', b'1'),
(712, 'DWCU007', 'DWCU00761PE32SB_LLG-XXL', 'LLG', 'Size XL', 999, b'1', b'1'),
(713, 'EWCL003', 'EWCL00361PE00RB_CR-S', 'CR', 'Size S', 999, b'1', b'1'),
(714, 'EWCL003', 'EWCL00361PE00RB_CR-M', 'CR', 'Size M', 0, b'0', b'1'),
(715, 'EWCL003', 'EWCL00361PE00RB_CR-L', 'CR', 'Size L', 999, b'1', b'1'),
(716, 'EWCL003', 'EWCL00361PE00RB_CR-XL', 'CR', 'Size XL', 999, b'1', b'1'),
(717, 'EWCP002', 'EWCP00251PE00SB_LG-S', 'LG', 'Size S', 999, b'1', b'1'),
(718, 'EWCP002', 'EWCP00251PE00SB_LG-M', 'LG', 'Size M', 999, b'1', b'1'),
(719, 'EWCP002', 'EWCP00251PE00SB_LG-L', 'LG', 'Size L', 999, b'1', b'1');
INSERT INTO `products_detail` (`product_detail_id`, `product_id`, `code`, `color_id`, `size`, `quantity`, `out_of_stock`, `product_detail_active`) VALUES
(720, 'EWCP002', 'EWCP00251PE00SB_LG-XL', 'LG', 'Size XL', 999, b'1', b'1'),
(721, 'EWCP002', 'EWCP00251PE00SB_DNV-S', 'DNV', 'Size S', 999, b'1', b'1'),
(722, 'EWCP002', 'EWCP00251PE00SB_DNV-M', 'DNV', 'Size M', 999, b'1', b'1'),
(723, 'EWCP002', 'EWCP00251PE00SB_DNV-L', 'DNV', 'Size L', 999, b'1', b'1'),
(724, 'EWCP002', 'EWCP00251PE00SB_DNV-XL', 'DNV', 'Size XL', 999, b'1', b'1'),
(725, 'EWCP002', 'EWCP00251PE00SB_LBE-S', 'LBE', 'Size S', 999, b'1', b'1'),
(726, 'EWCP002', 'EWCP00251PE00SB_LBE-M', 'LBE', 'Size M', 999, b'1', b'1'),
(727, 'EWCP002', 'EWCP00251PE00SB_LBE-L', 'LBE', 'Size L', 999, b'1', b'1'),
(728, 'EWCP002', 'EWCP00251PE00SB_LBE-XL', 'LBE', 'Size XL', 999, b'1', b'1'),
(729, 'EWBS001', 'EWBS00103TC00RB_BL-S', 'BL', 'Size S', 999, b'1', b'1'),
(730, 'EWBS001', 'EWBS00103TC00RB_BL-M', 'BL', 'Size M', 999, b'1', b'1'),
(731, 'EWBS001', 'EWBS00103TC00RB_BL-L', 'BL', 'Size L', 999, b'1', b'1'),
(732, 'EWBS001', 'EWBS00103TC00RB_BL-XL', 'BL', 'Size XL', 999, b'1', b'1'),
(733, 'EWBS001', 'EWBS00103TC00RB_BE-S', 'BE', 'Size S', 999, b'1', b'1'),
(734, 'EWBS001', 'EWBS00103TC00RB_BE-M', 'BE', 'Size M', 999, b'1', b'1'),
(735, 'EWBS001', 'EWBS00103TC00RB_BE-L', 'BE', 'Size L', 999, b'1', b'1'),
(736, 'EWBS001', 'EWBS00103TC00RB_BE-XL', 'BE', 'Size XL', 999, b'1', b'1'),
(737, 'EWBS001', 'EWBS00103TC00RB_LG-S', 'LG', 'Size S', 999, b'1', b'1'),
(738, 'EWBS001', 'EWBS00103TC00RB_LG-M', 'LG', 'Size M', 999, b'1', b'1'),
(739, 'EWBS001', 'EWBS00103TC00RB_LG-L', 'LG', 'Size L', 999, b'1', b'1'),
(740, 'EWBS001', 'EWBS00103TC00RB_LG-XL', 'LG', 'Size XL', 999, b'1', b'1'),
(744, 'EWTW003', 'EWTW00311TC00RB_BL-S', 'BL', 'Size S', 999, b'1', b'1'),
(745, 'EWTW003', 'EWTW00311TC00RB_BL-M', 'BL', 'Size M', 999, b'1', b'1'),
(746, 'EWTW003', 'EWTW00311TC00RB_BL-L', 'BL', 'Size L', 999, b'1', b'1'),
(747, 'EWTW003', 'EWTW00311TC00RB_BL-XL', 'BL', 'Size XL', 999, b'1', b'1'),
(748, 'EWTW003', 'EWTW00311TC00RB_BE-L', 'BE', 'Size S', 999, b'1', b'1'),
(749, 'EWTW003', 'EWTW00311TC00RB_BE-S', 'BE', 'Size S', 999, b'1', b'1'),
(750, 'EWTW003', 'EWTW00311TC00RB_BE-M', 'BE', 'Size M', 0, b'0', b'1'),
(751, 'EWTW003', 'EWTW00311TC00RB_BE-XL', 'BE', 'Size XL', 0, b'0', b'1'),
(752, 'EWTW003', 'EWTW00311TC00RB_BE-XXL', 'BE', 'Size XXL', 999, b'1', b'1'),
(753, 'EWTW003', 'EWTW00311TC00RB_BL-XXL', 'BL', 'Size XXL', 999, b'1', b'1'),
(754, 'EWTW003', 'EWTW00311TC00RB_LG-M', 'LG', 'Size M', 0, b'0', b'1'),
(755, 'EWTW003', 'EWTW00311TC00RB_LG-L', 'LG', 'Size L', 0, b'0', b'1'),
(756, 'EWTW003', 'EWTW00311TC00RB_LG-S', 'LG', 'Size S', 999, b'1', b'1'),
(757, 'EWTW003', 'EWTW00311TC00RB_LG-XL', 'LG', 'Size XL', 999, b'1', b'1'),
(758, 'EWTW003', 'EWTW00311TC00RB_LG-XXL', 'LG', 'Size XXL', 999, b'1', b'1'),
(759, 'EWTE003', 'EWTE00311AC08SB_NV-M', 'NV', 'Size M', 999, b'1', b'1'),
(760, 'EWTE003', 'EWTE00311AC08SB_NV-S', 'NV', 'Size S', 999, b'1', b'1'),
(761, 'EWTE003', 'EWTE00311AC08SB_NV-L', 'NV', 'Size L', 999, b'1', b'1'),
(762, 'EWTE003', 'EWTE00311AC08SB_NV-XL', 'NV', 'Size XL', 999, b'1', b'1'),
(763, 'EWTE003', 'EWTE00311AC08SB_BL-S', 'BL', 'Size S', 999, b'1', b'1'),
(764, 'EWTE003', 'EWTE00311AC08SB_BL-M', 'BL', 'Size M', 999, b'1', b'1'),
(765, 'EWTE003', 'EWTE00311AC08SB_BL-XL', 'BL', 'Size XL', 999, b'1', b'1'),
(766, 'EWTE003', ' EWTE00311AC08SB_BL-L', 'BL', 'Size L', 999, b'1', b'1');

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
        SELECT COUNT(DISTINCT size)
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
        SELECT COUNT(DISTINCT size)
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
        SELECT COUNT(DISTINCT size)
        FROM products_detail
        WHERE product_id = NEW.product_id
    )
    WHERE product_id = NEW.product_id;
END
$$
DELIMITER ;

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
  `api` varchar(500) DEFAULT NULL,
  `city` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `stores`
--

INSERT INTO `stores` (`id`, `name`, `address`, `time`, `phone`, `api`, `city`) VALUES
(1, 'TORANO TRƯƠNG ĐỊNH', 'Số 179 Trương Định, Quận Hoàng Mai, Hà Nội', '8h30 - 20h00 (kể cả CN và ngày lễ)', '098989999', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3725.0480498187626!2d105.84330438099062!3d20.990710939209666!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ad2d85f4d157%3A0xb342677bf9ee0d68!2zVE9SQU5PIDE3OSBUUsavxqBORyDEkOG7ik5I!5e0!3m2!1svi!2s!4v1705909366457!5m2!1svi!2s', 'Hà Nội'),
(2, 'TORANO 425A SƯ VẠN HẠNH NỐI DÀI', '425A SƯ VẠN HẠNH NỐI DÀI, P.12, Q.10', '8h30 - 20h00 (kể cả CN và ngày lễ)', '096968696', 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3919.509913521864!2d106.669631!3d10.772203!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f5b255f0b29%3A0x9c61555ce8088f5a!2zVE9SQU5PIDQyNUEgU8avIFbhuqBOIEjhuqBOSA!5e0!3m2!1svi!2sus!4v1705923884646!5m2!1svi!2sus', 'Thành phố Hồ Chí Minh'),
(3, 'TORANO ĐÀ NẴNG', '281 Điện Biên Phủ, Q. Thanh Khê', '8h30 - 20h00 (kể cả CN và ngày lễ)', '0998999999‬', 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3833.9981268069027!2d108.193418!3d16.065587!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3142191253cf72b3%3A0xd5167753b8ddac4f!2zVG9yYW5vIMSQw6AgTuG6tW5n!5e0!3m2!1svi!2sus!4v1705923998699!5m2!1svi!2sus', 'Đà Nẵng'),
(4, 'TORANO 35 NGUYỄN PHONG SẮC', 'Số 35 Nguyễn Phong Sắc, Cầu Giấy, Hà Nội', '8h30 - 22h00 (kể cả CN và ngày lễ)', '0978361786', 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3723.8900233858894!2d105.789871!3d21.037086!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab23cb755bf9%3A0xf10ea9cb5e5101c4!2sTorano!5e0!3m2!1svi!2sus!4v1705924309896!5m2!1svi!2sus', 'Hà Nội'),
(5, 'TORANO VẠN PHÚC', 'Số 178 Vạn Phúc, Q. Hà Đông, Hà Nội', '8h30 - 22h00 (kể cả CN và ngày lễ)', '0989786959', 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d1862.6291204576075!2d105.770733!3d20.982283!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3134533079da2b41%3A0x3c0fb1a30fda48c!2zMTc4IMSQxrDhu51uZyBW4bqhbiBQaMO6YywgVuG6oW4gUGjDumMsIEjDoCDEkMO0bmcsIEjDoCBO4buZaSAxMDAwMDAsIFZp4buHdCBOYW0!5e0!3m2!1svi!2sus!4v1705924376967!5m2!1svi!2sus', 'Hà Nội');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`account_id`),
  ADD UNIQUE KEY `unique_constraint_name` (`user_name`,`phone`,`email`);

--
-- Chỉ mục cho bảng `banner_imgs`
--
ALTER TABLE `banner_imgs`
  ADD PRIMARY KEY (`id`);

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
-- Chỉ mục cho bảng `customer_mail`
--
ALTER TABLE `customer_mail`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `feedback_customer`
--
ALTER TABLE `feedback_customer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `imgs_product`
--
ALTER TABLE `imgs_product`
  ADD PRIMARY KEY (`img_id`),
  ADD KEY `bd` (`product_id`);

--
-- Chỉ mục cho bảng `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `invoice_status` (`invoice_status`),
  ADD KEY `invoices_ibfk_1` (`account_id`);

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
  ADD KEY `dsgd` (`cat_id`);

--
-- Chỉ mục cho bảng `products_detail`
--
ALTER TABLE `products_detail`
  ADD PRIMARY KEY (`product_detail_id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `gfd` (`color_id`),
  ADD KEY `grwr` (`product_id`);

--
-- Chỉ mục cho bảng `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `accounts`
--
ALTER TABLE `accounts`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `banner_imgs`
--
ALTER TABLE `banner_imgs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `customer_mail`
--
ALTER TABLE `customer_mail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `feedback_customer`
--
ALTER TABLE `feedback_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1206;

--
-- AUTO_INCREMENT cho bảng `imgs_product`
--
ALTER TABLE `imgs_product`
  MODIFY `img_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=682;

--
-- AUTO_INCREMENT cho bảng `invoices_detail`
--
ALTER TABLE `invoices_detail`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=436;

--
-- AUTO_INCREMENT cho bảng `invoices_status`
--
ALTER TABLE `invoices_status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `products_detail`
--
ALTER TABLE `products_detail`
  MODIFY `product_detail_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=767;

--
-- AUTO_INCREMENT cho bảng `stores`
--
ALTER TABLE `stores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `dsgsg` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`cat_id`);

--
-- Các ràng buộc cho bảng `imgs_product`
--
ALTER TABLE `imgs_product`
  ADD CONSTRAINT `bd` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Các ràng buộc cho bảng `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`),
  ADD CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`invoice_status`) REFERENCES `invoices_status` (`status_id`);

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
  ADD CONSTRAINT `dsgd` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`cat_id`);

--
-- Các ràng buộc cho bảng `products_detail`
--
ALTER TABLE `products_detail`
  ADD CONSTRAINT `gfd` FOREIGN KEY (`color_id`) REFERENCES `colors` (`color_id`),
  ADD CONSTRAINT `grwr` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
