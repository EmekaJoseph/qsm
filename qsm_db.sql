-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2023 at 01:36 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qsm_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_08_19_000000_create_failed_jobs_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_archives`
--

CREATE TABLE `tbl_archives` (
  `archive_id` int(100) NOT NULL,
  `archive_name` varchar(100) NOT NULL,
  `count` int(100) NOT NULL DEFAULT 0,
  `created` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_materials`
--

CREATE TABLE `tbl_materials` (
  `material_id` int(100) NOT NULL,
  `category_id` varchar(5) NOT NULL,
  `pages` varchar(10) NOT NULL,
  `material_code` varchar(10) NOT NULL,
  `doc` varchar(100) NOT NULL,
  `isArchived` varchar(2) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `created_at` varchar(100) NOT NULL,
  `updated_at` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_material_categories`
--

CREATE TABLE `tbl_material_categories` (
  `category_id` int(100) NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_material_categories`
--

INSERT INTO `tbl_material_categories` (`category_id`, `category_name`) VALUES
(3, 'Laboratory'),
(4, 'Food'),
(5, 'Pharmaceuticals'),
(6, 'SMEs'),
(7, 'Water'),
(8, 'ICT/Accounting'),
(9, 'Administration'),
(10, 'Microbiology/Chemistry'),
(11, 'Regulatory Requirements'),
(12, 'Methods and Specifications'),
(13, 'Miscellaneous');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_material_otp`
--

CREATE TABLE `tbl_material_otp` (
  `id` int(100) NOT NULL,
  `material_id` varchar(100) NOT NULL,
  `code` varchar(10) NOT NULL,
  `ref` varchar(100) DEFAULT NULL,
  `created_date` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_messages`
--

CREATE TABLE `tbl_messages` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `sent_date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_messages`
--

INSERT INTO `tbl_messages` (`id`, `name`, `email`, `message`, `sent_date`) VALUES
(1, 'emeka', 'gmail@mail.com', 'message', '2023-03-22 00:33:11');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_registrations`
--

CREATE TABLE `tbl_registrations` (
  `id` int(100) NOT NULL,
  `training` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `company` varchar(100) DEFAULT NULL,
  `expiry` varchar(100) NOT NULL,
  `reg_date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_trainings`
--

CREATE TABLE `tbl_trainings` (
  `id` int(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `info` text NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `start_date` varchar(100) NOT NULL,
  `end_date` varchar(100) NOT NULL,
  `venue` varchar(100) NOT NULL,
  `reg_count` int(100) NOT NULL DEFAULT 0,
  `created_at` varchar(100) NOT NULL,
  `updated_at` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_visitors`
--

CREATE TABLE `tbl_visitors` (
  `id` int(100) NOT NULL,
  `ip_addr` varchar(100) NOT NULL,
  `visit_date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_visitors`
--

INSERT INTO `tbl_visitors` (`id`, `ip_addr`, `visit_date`) VALUES
(1, '127.0.0.1', '2023-03-22 00:32:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `tbl_archives`
--
ALTER TABLE `tbl_archives`
  ADD PRIMARY KEY (`archive_id`);

--
-- Indexes for table `tbl_materials`
--
ALTER TABLE `tbl_materials`
  ADD PRIMARY KEY (`material_id`);

--
-- Indexes for table `tbl_material_categories`
--
ALTER TABLE `tbl_material_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `tbl_material_otp`
--
ALTER TABLE `tbl_material_otp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_messages`
--
ALTER TABLE `tbl_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_registrations`
--
ALTER TABLE `tbl_registrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_trainings`
--
ALTER TABLE `tbl_trainings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_visitors`
--
ALTER TABLE `tbl_visitors`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_archives`
--
ALTER TABLE `tbl_archives`
  MODIFY `archive_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_materials`
--
ALTER TABLE `tbl_materials`
  MODIFY `material_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tbl_material_categories`
--
ALTER TABLE `tbl_material_categories`
  MODIFY `category_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tbl_material_otp`
--
ALTER TABLE `tbl_material_otp`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tbl_messages`
--
ALTER TABLE `tbl_messages`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_registrations`
--
ALTER TABLE `tbl_registrations`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_trainings`
--
ALTER TABLE `tbl_trainings`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_visitors`
--
ALTER TABLE `tbl_visitors`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
