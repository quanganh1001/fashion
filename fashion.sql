-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th12 03, 2023 lúc 08:01 AM
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
CREATE DATABASE IF NOT EXISTS `fashion` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `fashion`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `accounts`
--
-- Error reading structure for table fashion.accounts: #1932 - Table &#039;fashion.accounts&#039; doesn&#039;t exist in engine
-- Error reading data for table fashion.accounts: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `fashion`.`accounts`&#039; at line 1

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--
-- Error reading structure for table fashion.categories: #1932 - Table &#039;fashion.categories&#039; doesn&#039;t exist in engine
-- Error reading data for table fashion.categories: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `fashion`.`categories`&#039; at line 1

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `colors`
--
-- Error reading structure for table fashion.colors: #1932 - Table &#039;fashion.colors&#039; doesn&#039;t exist in engine
-- Error reading data for table fashion.colors: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `fashion`.`colors`&#039; at line 1

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `history`
--
-- Error reading structure for table fashion.history: #1932 - Table &#039;fashion.history&#039; doesn&#039;t exist in engine
-- Error reading data for table fashion.history: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `fashion`.`history`&#039; at line 1

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `imgs_product`
--
-- Error reading structure for table fashion.imgs_product: #1932 - Table &#039;fashion.imgs_product&#039; doesn&#039;t exist in engine
-- Error reading data for table fashion.imgs_product: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `fashion`.`imgs_product`&#039; at line 1

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `imgs_size`
--
-- Error reading structure for table fashion.imgs_size: #1932 - Table &#039;fashion.imgs_size&#039; doesn&#039;t exist in engine
-- Error reading data for table fashion.imgs_size: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `fashion`.`imgs_size`&#039; at line 1

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `incvoice_status`
--
-- Error reading structure for table fashion.incvoice_status: #1932 - Table &#039;fashion.incvoice_status&#039; doesn&#039;t exist in engine
-- Error reading data for table fashion.incvoice_status: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `fashion`.`incvoice_status`&#039; at line 1

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoices`
--
-- Error reading structure for table fashion.invoices: #1932 - Table &#039;fashion.invoices&#039; doesn&#039;t exist in engine
-- Error reading data for table fashion.invoices: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `fashion`.`invoices`&#039; at line 1

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
-- Error reading structure for table fashion.invoices_detail: #1932 - Table &#039;fashion.invoices_detail&#039; doesn&#039;t exist in engine
-- Error reading data for table fashion.invoices_detail: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `fashion`.`invoices_detail`&#039; at line 1

--
-- Bẫy `invoices_detail`
--
DELIMITER $$
CREATE TRIGGER `calculate_invoice_total` AFTER INSERT ON `invoices_detail` FOR EACH ROW BEGIN
    DECLARE total double;

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
    DECLARE total double;

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
-- Error reading structure for table fashion.invoices_status: #1932 - Table &#039;fashion.invoices_status&#039; doesn&#039;t exist in engine
-- Error reading data for table fashion.invoices_status: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `fashion`.`invoices_status`&#039; at line 1

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--
-- Error reading structure for table fashion.products: #1932 - Table &#039;fashion.products&#039; doesn&#039;t exist in engine
-- Error reading data for table fashion.products: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `fashion`.`products`&#039; at line 1

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
-- Error reading structure for table fashion.products_detail: #1932 - Table &#039;fashion.products_detail&#039; doesn&#039;t exist in engine
-- Error reading data for table fashion.products_detail: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `fashion`.`products_detail`&#039; at line 1

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
-- Error reading structure for table fashion.roles: #1932 - Table &#039;fashion.roles&#039; doesn&#039;t exist in engine
-- Error reading data for table fashion.roles: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `fashion`.`roles`&#039; at line 1

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sizes`
--
-- Error reading structure for table fashion.sizes: #1932 - Table &#039;fashion.sizes&#039; doesn&#039;t exist in engine
-- Error reading data for table fashion.sizes: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `fashion`.`sizes`&#039; at line 1

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `stores`
--
-- Error reading structure for table fashion.stores: #1932 - Table &#039;fashion.stores&#039; doesn&#039;t exist in engine
-- Error reading data for table fashion.stores: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `fashion`.`stores`&#039; at line 1
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
