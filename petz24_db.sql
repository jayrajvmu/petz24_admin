-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2024 at 01:31 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `petz24_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand_tbl`
--

CREATE TABLE `brand_tbl` (
  `brand_id` bigint(20) NOT NULL,
  `brand_name` varchar(100) NOT NULL,
  `brand_logo` varchar(300) NOT NULL,
  `flag` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brand_tbl`
--

INSERT INTO `brand_tbl` (`brand_id`, `brand_name`, `brand_logo`, `flag`) VALUES
(7, 'Pedigree', 'uploads/brand/1728493463_84e404799d4dc40dd734.jpeg', 1),
(8, 'Cesar', 'uploads/brand/1728493474_ab6dc8cf788ece8e1aae.jpeg', 1),
(9, 'Chappi', 'uploads/brand/1728493516_1da278d00a3829538622.jpeg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `breed_tbl`
--

CREATE TABLE `breed_tbl` (
  `breed_id` bigint(20) NOT NULL,
  `pet_id` bigint(20) NOT NULL,
  `breed_name` varchar(100) NOT NULL,
  `flag` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `breed_tbl`
--

INSERT INTO `breed_tbl` (`breed_id`, `pet_id`, `breed_name`, `flag`) VALUES
(10, 58, 'Bull Dog', 1),
(11, 58, 'American Bully', 1),
(12, 59, 'Abyssinian Cat Breed', 1),
(13, 59, 'Burmese Cat Breed', 1),
(14, 60, 'Australian King Parrot', 1);

-- --------------------------------------------------------

--
-- Table structure for table `clinic_tbl`
--

CREATE TABLE `clinic_tbl` (
  `clinic_id` int(11) NOT NULL,
  `clinic_name` varchar(150) NOT NULL,
  `address` varchar(500) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `pincode` varchar(10) NOT NULL,
  `flag` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `consultation_id`
--

CREATE TABLE `consultation_id` (
  `consultation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `clenic_id` int(11) NOT NULL,
  `concern` varchar(100) NOT NULL,
  `problem_description` varchar(250) DEFAULT NULL,
  `image_description` varchar(150) DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `appoinment_type` int(11) NOT NULL,
  `meeting_link` int(11) DEFAULT NULL,
  `log` timestamp NOT NULL DEFAULT current_timestamp(),
  `flag` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flavor_tbl`
--

CREATE TABLE `flavor_tbl` (
  `flavor_id` bigint(11) NOT NULL,
  `flavor` int(11) NOT NULL,
  `flag` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer_tbl`
--

CREATE TABLE `manufacturer_tbl` (
  `manufacturer_id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT 'Manufacturer Or Importers Name',
  `address` varchar(500) NOT NULL COMMENT 'Manufacturer Or Importer Address',
  `sold_by` varchar(100) NOT NULL,
  `origin` varchar(100) NOT NULL,
  `flag` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `otp_tbl`
--

CREATE TABLE `otp_tbl` (
  `otp_id` int(11) NOT NULL,
  `otp` varchar(10) NOT NULL,
  `log` timestamp NOT NULL DEFAULT current_timestamp(),
  `flag` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pet_tbl`
--

CREATE TABLE `pet_tbl` (
  `pet_id` bigint(20) NOT NULL,
  `pet_name` varchar(100) NOT NULL,
  `pet_img` varchar(300) DEFAULT NULL,
  `flag` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pet_tbl`
--

INSERT INTO `pet_tbl` (`pet_id`, `pet_name`, `pet_img`, `flag`) VALUES
(58, 'Dog', 'uploads/pet/1728492931_a5ea3bb3776aa456f3fe.jpg', 1),
(59, 'Cat', 'uploads/pet/1728492953_dfa68829fdc3ea7669c9.jpg', 1),
(60, 'Bird', 'uploads/pet/1728492964_363b6617473082413df7.png', 1),
(61, 'Small Animal', 'uploads/pet/1728492978_3fd4053c86f9102fefbc.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_category_tbl`
--

CREATE TABLE `product_category_tbl` (
  `product_category_id` bigint(20) NOT NULL,
  `product_type_id` bigint(20) NOT NULL,
  `category` varchar(100) NOT NULL,
  `flag` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_category_tbl`
--

INSERT INTO `product_category_tbl` (`product_category_id`, `product_type_id`, `category`, `flag`) VALUES
(29, 15, 'Main', 1),
(30, 17, 'Main', 1),
(31, 18, 'Oil', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_img_tbl`
--

CREATE TABLE `product_img_tbl` (
  `product_img_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `url` varchar(300) NOT NULL,
  `flag` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_img_tbl`
--

INSERT INTO `product_img_tbl` (`product_img_id`, `product_id`, `url`, `flag`) VALUES
(5, 18, 'uploads/product/1728643125_80077198b9778d68599a.jpg', 0),
(6, 18, 'uploads/product/1728643110_4cc94636547433e336fa.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_tbl`
--

CREATE TABLE `product_tbl` (
  `product_id` bigint(20) NOT NULL,
  `brand_id` bigint(20) NOT NULL,
  `pet_id` bigint(20) NOT NULL,
  `breed_id` bigint(20) NOT NULL,
  `product_type_id` bigint(20) NOT NULL,
  `product_category_id` bigint(20) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `summery` varchar(250) DEFAULT NULL,
  `description` varchar(750) DEFAULT NULL,
  `instruction` varchar(500) DEFAULT NULL,
  `product_json` varchar(1000) DEFAULT NULL,
  `flag` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_tbl`
--

INSERT INTO `product_tbl` (`product_id`, `brand_id`, `pet_id`, `breed_id`, `product_type_id`, `product_category_id`, `name`, `summery`, `description`, `instruction`, `product_json`, `flag`) VALUES
(17, 7, 58, 10, 15, 29, 'Test', 'test', 'test', 'test', NULL, 1),
(18, 7, 58, 10, 16, 31, 'Oil', 'oil', 'resr', 'sr', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_type_tbl`
--

CREATE TABLE `product_type_tbl` (
  `product_type_id` bigint(20) NOT NULL,
  `pet_id` bigint(20) NOT NULL,
  `type` varchar(100) NOT NULL,
  `flag` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_type_tbl`
--

INSERT INTO `product_type_tbl` (`product_type_id`, `pet_id`, `type`, `flag`) VALUES
(15, 58, 'Food', 1),
(16, 58, 'Health Care', 1),
(17, 59, 'Food', 1),
(18, 59, 'Health Care', 1),
(19, 60, 'Food', 1),
(20, 61, 'Food', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_type` varchar(100) NOT NULL,
  `flag` int(11) NOT NULL DEFAULT 1,
  `log` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `username`, `password`, `user_type`, `flag`, `log`) VALUES
(1, 'admin', 'admin', 'A', 1, '2024-02-29 09:55:31'),
(2, 'user', 'user', 'U', 1, '2024-02-29 09:55:31');

-- --------------------------------------------------------

--
-- Table structure for table `user_pet_tbl`
--

CREATE TABLE `user_pet_tbl` (
  `user_pety_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pet_id` int(11) NOT NULL,
  `breed_id` int(11) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `date_of_birth` date NOT NULL,
  `name` varchar(200) NOT NULL,
  `age` int(11) NOT NULL,
  `flag` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_tbl`
--

CREATE TABLE `user_tbl` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `mobile_number` varchar(50) NOT NULL,
  `email_id` varchar(150) NOT NULL,
  `password` varchar(100) NOT NULL,
  `flag` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_tbl`
--

INSERT INTO `user_tbl` (`user_id`, `first_name`, `last_name`, `mobile_number`, `email_id`, `password`, `flag`) VALUES
(1, 'karthik', 'sam', '8899556644', 'karthik@zoho.com', 'master', 1),
(8, 'master', 'master', '9879879875', 'karthik_2@zoho.com', '123', 1),
(9, 'master', 'qwqwqwq', '87985465', 'qwqwq@qwqwq.com', 'qwqwqw', 1),
(10, 'master', 'qwqwqwq', '87985465', 'qwqwq@qwqwqe.com', 'qwqwqw', 1),
(11, 'master', 'asasa', '5454', 'saasa@asas.com', 'asasas', 1),
(12, 'asasas', 'asasa', '545', 'sasas@asasa.com', 'dfdf', 1),
(13, 'master', 'asasas', '9879879875', 'karthik_4@zoho.com', 'asasas', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand_tbl`
--
ALTER TABLE `brand_tbl`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `breed_tbl`
--
ALTER TABLE `breed_tbl`
  ADD PRIMARY KEY (`breed_id`);

--
-- Indexes for table `clinic_tbl`
--
ALTER TABLE `clinic_tbl`
  ADD PRIMARY KEY (`clinic_id`);

--
-- Indexes for table `consultation_id`
--
ALTER TABLE `consultation_id`
  ADD PRIMARY KEY (`consultation_id`);

--
-- Indexes for table `flavor_tbl`
--
ALTER TABLE `flavor_tbl`
  ADD PRIMARY KEY (`flavor_id`);

--
-- Indexes for table `manufacturer_tbl`
--
ALTER TABLE `manufacturer_tbl`
  ADD PRIMARY KEY (`manufacturer_id`);

--
-- Indexes for table `otp_tbl`
--
ALTER TABLE `otp_tbl`
  ADD PRIMARY KEY (`otp_id`);

--
-- Indexes for table `pet_tbl`
--
ALTER TABLE `pet_tbl`
  ADD PRIMARY KEY (`pet_id`);

--
-- Indexes for table `product_category_tbl`
--
ALTER TABLE `product_category_tbl`
  ADD PRIMARY KEY (`product_category_id`);

--
-- Indexes for table `product_img_tbl`
--
ALTER TABLE `product_img_tbl`
  ADD PRIMARY KEY (`product_img_id`);

--
-- Indexes for table `product_tbl`
--
ALTER TABLE `product_tbl`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_type_tbl`
--
ALTER TABLE `product_type_tbl`
  ADD PRIMARY KEY (`product_type_id`);

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `user_pet_tbl`
--
ALTER TABLE `user_pet_tbl`
  ADD PRIMARY KEY (`user_pety_id`);

--
-- Indexes for table `user_tbl`
--
ALTER TABLE `user_tbl`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand_tbl`
--
ALTER TABLE `brand_tbl`
  MODIFY `brand_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `breed_tbl`
--
ALTER TABLE `breed_tbl`
  MODIFY `breed_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `clinic_tbl`
--
ALTER TABLE `clinic_tbl`
  MODIFY `clinic_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `consultation_id`
--
ALTER TABLE `consultation_id`
  MODIFY `consultation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flavor_tbl`
--
ALTER TABLE `flavor_tbl`
  MODIFY `flavor_id` bigint(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manufacturer_tbl`
--
ALTER TABLE `manufacturer_tbl`
  MODIFY `manufacturer_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `otp_tbl`
--
ALTER TABLE `otp_tbl`
  MODIFY `otp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pet_tbl`
--
ALTER TABLE `pet_tbl`
  MODIFY `pet_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `product_category_tbl`
--
ALTER TABLE `product_category_tbl`
  MODIFY `product_category_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `product_img_tbl`
--
ALTER TABLE `product_img_tbl`
  MODIFY `product_img_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_tbl`
--
ALTER TABLE `product_tbl`
  MODIFY `product_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `product_type_tbl`
--
ALTER TABLE `product_type_tbl`
  MODIFY `product_type_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_pet_tbl`
--
ALTER TABLE `user_pet_tbl`
  MODIFY `user_pety_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_tbl`
--
ALTER TABLE `user_tbl`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
