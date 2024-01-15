-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 15, 2024 lúc 05:53 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.0.28

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
  `shipping_fee` int(11) DEFAULT NULL,
  `total_bill` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `invoices`
--

INSERT INTO `invoices` (`invoice_id`, `name`, `phone`, `address`, `created_at`, `note`, `customer_note`, `account_id`, `invoice_status`, `shipping_fee`, `total_bill`) VALUES
('58TMCIA2', 'quanly', '453245', '4dvsdsf', '2024-01-14 13:55:25', '            fd            ', NULL, 1, 0, NULL, NULL),
('5N7P9LFG', 'fg anh', '9999', 'số 18 ngõ 222 tựu liệt,thanh trì, hà nội', '2024-01-14 13:35:54', '          dsfsd              ', NULL, 2, 1, NULL, NULL),
('60ALPBZ7', 'eee', '3242', 'gfdg', '2024-01-14 13:40:33', '              4523          ', NULL, 4, 1, NULL, NULL),
('ASJNSHOV', 'quang anh', '0365151822333', '4dvsdsf', NULL, 'dsdgd', 'dd', 1, 1, NULL, NULL),
('CUGSFZ6W', 'xcvcx', '324232', 'cs', '2024-01-14 12:42:15', '                  vsd      ', NULL, 1, 1, NULL, NULL),
('GZ7NLAVD', 'gfdgfd', '45345343', 'vd', '2024-01-14 12:41:57', '                        bvd', NULL, 4, 1, NULL, NULL),
('H7SMY3IX', 'quang anh', '4234', '4dvsdsf', '2023-12-31 11:34:00', '                        gh', NULL, 2, 3, NULL, NULL),
('HQ6FBRM7', 'fsd', '342344', 'đ', '2024-01-14 12:38:51', '                        fs', NULL, 1, 1, NULL, NULL),
('LJ15RWML', 'quang anh', '0365151822', 'dsf', '2023-12-31 11:34:00', 'sdfds', NULL, 2, 3, NULL, NULL),
('PB8NR0T5', 'nguyễn quang anh', '365151822', 'số 18 ngõ 222 tựu liệt,thanh trì, hà nội', '2024-01-14 12:17:43', '                        ', 'fds', 1, 2, NULL, NULL),
('QD57D21V', 'nhanvien1', '0365151822', 'sdfsd', '2023-12-31 11:34:00', '                        vsd', NULL, 2, 5, NULL, NULL),
('QHSU5DIX', 'nguyễn quang anh', '365151822', 'số 18 ngõ 222 tựu liệt,thanh trì, hà nội', '2024-01-14 12:16:09', '                        dsv', 'fds', 1, 4, NULL, NULL),
('QWEASVXZ', 'fdsfsd', '93232', 'cxvcx', '2023-12-31 11:34:20', 'cxfds', NULL, 1, 5, NULL, NULL),
('RMMVUD46', 'gsdvc', '4532', 'bvc', '2024-01-14 12:37:18', '                    fdg    ', NULL, 1, 1, NULL, NULL),
('RNQT0948', 'quang anh', '33', 'ds', '2023-12-31 11:34:20', 'a', NULL, 2, 5, NULL, NULL),
('SDDFGSEW', 'quang anh', '932', '4dvsdsf', '2023-12-31 11:34:20', 'hello\r\nx', NULL, 2, 2, NULL, NULL),
('SM1LHYCD', 'vsd', '534', 'fgdf', '2024-01-14 13:16:30', '                        43', NULL, 1, 1, NULL, NULL),
('VCXBDSGS', 'SF', '93232', '4fdsdvs', '2023-12-31 11:34:20', 'dsf', NULL, 2, 1, NULL, NULL),
('VEGIVWS6', 'vsd', '988888', 'gf', '2024-01-14 13:37:13', '         vbcx               ', NULL, NULL, 1, NULL, NULL),
('YHJFSFAS', 'Qvxa', '21932', '4cddvs', '2023-12-31 11:34:20', '', NULL, 1, 6, NULL, NULL),
('YHVJLZWX', 'fsd', '34543', 'df', '2023-12-24 08:17:57', '', NULL, NULL, 1, NULL, NULL),
('YS28NEXU', 'quang anh', '0365151822', 'dfgdf', '2023-12-30 14:26:44', '                        ds', NULL, 1, 1, NULL, NULL);

--
-- Bẫy `invoices`
--
DELIMITER $$
CREATE TRIGGER `after_invoice_insert` AFTER INSERT ON `invoices` FOR EACH ROW BEGIN
	DECLARE content VARCHAR(255);
    DECLARE invoice_id VARCHAR(25);
    DECLARE account_name VARCHAR(25);
    SET account_name = (SELECT accounts.user_name FROM accounts WHERE account_id = NEW.account_id);
    SET invoice_id = NEW.invoice_id;
    SET content = CONCAT(@current_user , ' đã tạo đơn hàng: <br>Mã đơn: ', NEW.invoice_id, ',<br>Tên khách hàng: ', NEW.name, ',<br>Số điện thoại: ', NEW.phone, ',<br>Địa chỉ: ', NEW.address,',<br>Ghi chú: ', NEW.note,',<br>Nguồn:  ',account_name);

    INSERT INTO History (invoice_id,content) VALUES (invoice_id,content);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_invoice_update` BEFORE UPDATE ON `invoices` FOR EACH ROW BEGIN
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
  ADD KEY `invoice_status` (`invoice_status`),
  ADD KEY `invoices_ibfk_1` (`account_id`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`),
  ADD CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`invoice_status`) REFERENCES `invoices_status` (`status_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
