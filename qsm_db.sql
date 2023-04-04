-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2023 at 03:47 PM
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
  `tokenable_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(25, 'App\\Models\\AccountModel', '01gw4dva5ta971t2ncdgawvke3', 'qsm_token', '83db93e636635f065ba6f8de78e2a2740d769f3f9b98f09b7c8fa2ac8c785042', '[\"*\"]', '2023-03-30 08:52:29', NULL, '2023-03-29 08:56:16', '2023-03-30 08:52:29'),
(26, 'App\\Models\\AccountModel', '01gw4dva5ta971t2ncdgawvke3', 'qsm_token', '5622d22d82382c8fe25f70210d05a033161532beff34daf9f233a55ebfd5e19f', '[\"*\"]', '2023-03-29 11:36:50', NULL, '2023-03-29 11:33:42', '2023-03-29 11:36:50'),
(27, 'App\\Models\\AccountModel', '01gw4dva5ta971t2ncdgawvke3', 'qsm_token', '54f03503c1128edec5469f1ec91748436249f4e7941b365f856ce9c0d85b8247', '[\"*\"]', '2023-04-04 12:23:26', NULL, '2023-03-30 08:58:34', '2023-04-04 12:23:26'),
(28, 'App\\Models\\AccountModel', '01gw4dva5ta971t2ncdgawvke3', 'qsm_token', '8e38df3589437c41d501f945f78e715627d14c5b116a247e77b8aa78103f6775', '[\"*\"]', '2023-04-04 11:49:57', NULL, '2023-04-04 11:46:21', '2023-04-04 11:49:57');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_account`
--

CREATE TABLE `tbl_account` (
  `id` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `last_login` varchar(100) DEFAULT NULL,
  `role` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_account`
--

INSERT INTO `tbl_account` (`id`, `username`, `password`, `last_login`, `role`) VALUES
('01gw4dva5ta971t2ncdgawvke3', 'qsm', '$2y$10$uZ57DtQHJkcoONsqEOjgjeXg8hji8KAT.2nbVtwzg./tH9pMBGrhe', '2023-04-04 12:46:21', 'admin');

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
-- Table structure for table `tbl_blog`
--

CREATE TABLE `tbl_blog` (
  `blog_id` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `body` text NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `imagePublicId` varchar(100) DEFAULT NULL,
  `created_at` varchar(100) NOT NULL,
  `updated_at` varchar(100) NOT NULL
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
  `no_of_downloads` int(100) DEFAULT 0,
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
  `isRead` varchar(10) DEFAULT NULL,
  `sent_date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_messages`
--

INSERT INTO `tbl_messages` (`id`, `name`, `email`, `message`, `isRead`, `sent_date`) VALUES
(11, 'sa', 'asas@maaa.com', 'sasasasas sadsad adadad', NULL, '2023-04-04 13:04:10');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_newsletter`
--

CREATE TABLE `tbl_newsletter` (
  `id` int(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

--
-- Dumping data for table `tbl_registrations`
--

INSERT INTO `tbl_registrations` (`id`, `training`, `name`, `email`, `phone`, `company`, `expiry`, `reg_date`) VALUES
(26, '01gws2mwtb9ap8awzc0psptx6n', 'emeka', 'sasas@mail.com', '234', 'sasasas', ' ', '2023-03-30 11:01:18');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_trainings`
--

CREATE TABLE `tbl_trainings` (
  `id` varchar(100) NOT NULL,
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

--
-- Dumping data for table `tbl_trainings`
--

INSERT INTO `tbl_trainings` (`id`, `title`, `info`, `image`, `start_date`, `end_date`, `venue`, `reg_count`, `created_at`, `updated_at`) VALUES
('01gws2mwtb9ap8awzc0psptx6n', 'the Adventure of snakes', 'http://localhost:5173/booktraining?trn=01gwrzmwydd1nxbvegjgz1tyqs', NULL, '2023-03-30', '2023-03-30', 'sasa', 1, '2023-03-30 10:57:35', '2023-03-30 11:01:18');

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
(1, '127.0.0.1', '2023-04-04 13:07:40');

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
-- Indexes for table `tbl_account`
--
ALTER TABLE `tbl_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_archives`
--
ALTER TABLE `tbl_archives`
  ADD PRIMARY KEY (`archive_id`);

--
-- Indexes for table `tbl_blog`
--
ALTER TABLE `tbl_blog`
  ADD PRIMARY KEY (`blog_id`);

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
-- Indexes for table `tbl_newsletter`
--
ALTER TABLE `tbl_newsletter`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tbl_archives`
--
ALTER TABLE `tbl_archives`
  MODIFY `archive_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tbl_materials`
--
ALTER TABLE `tbl_materials`
  MODIFY `material_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `tbl_material_categories`
--
ALTER TABLE `tbl_material_categories`
  MODIFY `category_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `tbl_material_otp`
--
ALTER TABLE `tbl_material_otp`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tbl_messages`
--
ALTER TABLE `tbl_messages`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_newsletter`
--
ALTER TABLE `tbl_newsletter`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_registrations`
--
ALTER TABLE `tbl_registrations`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tbl_visitors`
--
ALTER TABLE `tbl_visitors`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
