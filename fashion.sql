-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th10 29, 2023 lúc 06:35 PM
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
-- Cơ sở dữ liệu: `fashion`
--

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
('QWEASVXZ', 'zxca', '93232', 'vxdvs', 2050000, '2023-11-26 09:39:38', 'dsfds', 2),
('SDDFGSEW', 'qfwqfq', '932', '4dvs', 2050000, '2023-11-26 09:39:38', 'fdsfd', 1),
('VCXBDSGS', 'SF', '93232', '4fdsdvs', 2050000, '2023-11-26 09:39:38', '', 0),
('YHJFSFAS', 'Qvxa', '21932', '4cddvs', 2050000, '2023-11-26 09:39:38', '', 1);

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

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `invoice_status` (`invoice_status`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`invoice_status`) REFERENCES `invoices_status` (`status_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
