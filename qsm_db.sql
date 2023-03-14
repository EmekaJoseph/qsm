-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2023 at 03:19 AM
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
-- Table structure for table `tbl_materials`
--

CREATE TABLE `tbl_materials` (
  `material_id` int(100) NOT NULL,
  `category_id` varchar(5) NOT NULL,
  `pages` varchar(10) NOT NULL,
  `material_code` varchar(10) NOT NULL,
  `doc` varchar(100) NOT NULL,
  `isArchived` varchar(2) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL,
  `created_at` varchar(100) NOT NULL,
  `updated_at` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_materials`
--

INSERT INTO `tbl_materials` (`material_id`, `category_id`, `pages`, `material_code`, `doc`, `isArchived`, `name`, `created_at`, `updated_at`) VALUES
(2, '2', '100', 'M1UY', '', '1', 'new Doc2', '2023-03-13 23:11:33', '2023-03-13 23:11:33'),
(3, '2', '100', 'MJJP', '', '0', 'new Doc23', '2023-03-13 23:12:24', '2023-03-13 23:12:24'),
(4, '1', '100', 'MO4PL', '', '0', 'new Doc234', '2023-03-13 23:13:07', '2023-03-13 23:13:07'),
(5, '2', '100', '', '', '0', 'new Doc234ew', '2023-03-13 23:15:49', '2023-03-13 23:15:49'),
(6, '2', '100', 'M4670', '', '0', 'new Doc234ews', '2023-03-13 23:16:41', '2023-03-13 23:16:41');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_material_categories`
--

CREATE TABLE `tbl_material_categories` (
  `category_id` int(100) NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_material_otp`
--

CREATE TABLE `tbl_material_otp` (
  `id` int(100) NOT NULL,
  `material_id` varchar(100) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `created_date` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_material_otp`
--

INSERT INTO `tbl_material_otp` (`id`, `material_id`, `code`, `name`, `created_date`) VALUES
(1, '6', 'QSM67FX', 'sammy', '2023-03-14 01:31:45');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_registrations`
--

CREATE TABLE `tbl_registrations` (
  `id` int(100) NOT NULL,
  `trainings` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `company` varchar(100) DEFAULT NULL,
  `expiry` varchar(100) NOT NULL,
  `reg_date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_registrations`
--

INSERT INTO `tbl_registrations` (`id`, `trainings`, `name`, `email`, `phone`, `company`, `expiry`, `reg_date`) VALUES
(1, '2', 'emeka', 'josephiwuji@gmail.com', '080', 'proffictech', '2023-03-12 00:00:00', '2023-03-13 12:49:32'),
(2, '2', 'emeka', 'josephiwuji@gmail.com', '080', 'proffictech', '2023-03-12 00:00:00', '2023-03-13 12:49:35'),
(4, '2,3,4,5', 'emeka', 'josephiwuji@gmail.com', '080', 'proffictech', '2023-03-30 00:00:00', '2023-03-13 13:26:24'),
(5, '2,6', 'emeka', 'josephiwuji@gmail.com', '080', 'proffictech', '2023-03-12 00:00:00', '2023-03-13 13:28:25');

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
  `created_at` varchar(100) NOT NULL,
  `updated_at` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_trainings`
--

INSERT INTO `tbl_trainings` (`id`, `title`, `info`, `image`, `start_date`, `end_date`, `venue`, `created_at`, `updated_at`) VALUES
(2, 'title_3', 'info new', NULL, '2023-03-08', '2023-03-12', 'new venue', '2023-03-13 10:27:23', '2023-03-13 10:38:20'),
(3, 'title3', 'info3', NULL, '2023-03-20', '2023-03-26', 'venue3', '2023-03-13 10:28:08', '2023-03-13 10:28:08'),
(4, 'title4', 'info4', NULL, '2023-03-02', '2023-03-30', 'venue4', '2023-03-13 11:47:58', '2023-03-13 11:47:58'),
(5, 'title5', 'info4', NULL, '2023-03-02', '2023-03-24', 'venue5', '2023-03-13 11:48:36', '2023-03-13 11:48:36');

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
(1, '127.0.0.1', '2023-03-13 08:58:33');

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
-- AUTO_INCREMENT for table `tbl_materials`
--
ALTER TABLE `tbl_materials`
  MODIFY `material_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_material_categories`
--
ALTER TABLE `tbl_material_categories`
  MODIFY `category_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_material_otp`
--
ALTER TABLE `tbl_material_otp`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_registrations`
--
ALTER TABLE `tbl_registrations`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_trainings`
--
ALTER TABLE `tbl_trainings`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_visitors`
--
ALTER TABLE `tbl_visitors`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
