-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2023 at 12:07 AM
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
(26, 'App\\Models\\AccountModel', '01gw4dva5ta971t2ncdgawvke3', 'qsm_token', '5622d22d82382c8fe25f70210d05a033161532beff34daf9f233a55ebfd5e19f', '[\"*\"]', '2023-05-18 05:29:20', NULL, '2023-03-29 11:33:42', '2023-05-18 05:29:20'),
(28, 'App\\Models\\AccountModel', '01gw4dva5ta971t2ncdgawvke3', 'qsm_token', '8e38df3589437c41d501f945f78e715627d14c5b116a247e77b8aa78103f6775', '[\"*\"]', '2023-04-04 11:49:57', NULL, '2023-04-04 11:46:21', '2023-04-04 11:49:57'),
(34, 'App\\Models\\AccountModel', '01gw4dva5ta971t2ncdgawvke3', 'qsm_token', 'dbfbb9d320800ec5680495ee0eb10947d6186c293b1a877de9a05447f24f6949', '[\"*\"]', '2023-05-19 11:22:31', NULL, '2023-05-16 14:12:13', '2023-05-19 11:22:31');

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
('01gw4dva5ta971t2ncdgawvke3', 'qsm', '$2y$10$uZ57DtQHJkcoONsqEOjgjeXg8hji8KAT.2nbVtwzg./tH9pMBGrhe', '2023-05-16 15:12:13', 'admin');

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

--
-- Dumping data for table `tbl_archives`
--

INSERT INTO `tbl_archives` (`archive_id`, `archive_name`, `count`, `created`) VALUES
(35, 'Archive_001', 0, '2023-04-20 15:00:14');

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

--
-- Dumping data for table `tbl_blog`
--

INSERT INTO `tbl_blog` (`blog_id`, `title`, `body`, `category`, `image`, `imagePublicId`, `created_at`, `updated_at`) VALUES
('992ec724-6f66-49bd-8a63-d9113230da65', 'emeka is a boy', '<p>emeka</p>', NULL, NULL, NULL, '2023-05-16 18:31:26', '2023-05-16 18:31:48'),
('99324f29-ce52-4663-854f-120e3cc960dc', 'wwww', '<p>asasas</p>', NULL, NULL, NULL, '2023-05-18 12:39:16', '2023-05-18 12:39:16');

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

--
-- Dumping data for table `tbl_materials`
--

INSERT INTO `tbl_materials` (`material_id`, `category_id`, `pages`, `material_code`, `doc`, `no_of_downloads`, `isArchived`, `name`, `created_at`, `updated_at`) VALUES
(43, '8', '40', 'M943LP', 'Good_practice_of_Bookkeeping_and_Accounting_Software-QSM1682002716.pptx', 2, '0', 'Good practice of Bookkeeping and Accounting Software', '2023-04-20 14:58:36', '2023-05-09 11:47:36'),
(44, '7', '25', 'M544OW', 'BEST_PRACTICES_FOR_COLLECTING_WATER_SAMPLES_FOR_ANALYSES-QSM1683204797.pptx', 2, '0', 'BEST PRACTICES FOR COLLECTING WATER SAMPLES FOR ANALYSES', '2023-05-04 12:53:17', '2023-05-04 13:52:19');

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
  `phone` varchar(20) NOT NULL,
  `message` text NOT NULL,
  `isRead` varchar(10) DEFAULT NULL,
  `sent_date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_newsletter`
--

CREATE TABLE `tbl_newsletter` (
  `id` int(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_newsletter`
--

INSERT INTO `tbl_newsletter` (`id`, `email`) VALUES
(1, 'fogy@mailinator.com'),
(2, 'vikyvunyv@mailinator.com'),
(3, 'bexoty@mailinator.com'),
(4, 'emeka@mail.com'),
(5, 'emeka@mail.co'),
(6, 'emka@gmail.com'),
(7, 'emeka@ddd.com'),
(8, 'sammy@mail.com'),
(9, 'ee@email.com');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_newsletters`
--

CREATE TABLE `tbl_newsletters` (
  `id` int(100) NOT NULL,
  `title` varchar(255) NOT NULL,
  `doc` varchar(255) NOT NULL,
  `created_at` varchar(100) NOT NULL,
  `updated_at` varchar(100) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `downloads` int(100) NOT NULL DEFAULT 0
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
(31, '01gyfk66trwmz2wnppd57xmhvn', 'Joseph', 'josepiwu@gmail.com', '080', 'proffictech', ' ', '2023-05-10 09:54:52'),
(32, '01gyfkadayjm7g769s4gxv89h8', 'Joseph', 'josepiwu@gmail.com', '080', 'proffictech', ' ', '2023-05-10 09:54:52'),
(33, '01gyfk66trwmz2wnppd57xmhvn', 'Joseph', 'josepiwu@gmail.com', '080', 'proffictech', ' ', '2023-05-10 09:56:03'),
(34, '01gyfkadayjm7g769s4gxv89h8', 'Joseph', 'josepiwu@gmail.com', '080', 'proffictech', ' ', '2023-05-10 09:56:03'),
(35, '01gyfk66trwmz2wnppd57xmhvn', 'Qui ex aut ex fuga', 'notez@mailinator.com', '09023456789', 'Voluptas quam incidi', ' ', '2023-05-10 12:21:39'),
(36, '01gyfkadayjm7g769s4gxv89h8', 'Eum enim quidem nisi', 'tejaha@mailinator.com', '3455', 'Accusamus error dist', ' ', '2023-05-10 21:50:48'),
(37, '01gyfkadayjm7g769s4gxv89h8', 'Ut aute nisi et dolo', 'josephiwuji@gmail.com', '090', 'Excepturi consectetu', ' ', '2023-05-10 21:52:39'),
(38, '01gyfk66trwmz2wnppd57xmhvn', 'Duis velit laborum i', 'josephiwuji@gmail.com', '090', 'Voluptatibus tempore', ' ', '2023-05-10 22:02:54'),
(39, '01gyfkadayjm7g769s4gxv89h8', 'Duis velit laborum i', 'josephiwuji@gmail.com', '090', 'Voluptatibus tempore', ' ', '2023-05-10 22:02:55'),
(40, '01gyfk66trwmz2wnppd57xmhvn', 'Nostrud perferendis', 'sevunyfov@mailinator.com', '08098767834', 'Fugiat duis vero ass', ' ', '2023-05-11 03:14:21'),
(41, '01gyfk66trwmz2wnppd57xmhvn', 'Nostrud perferendis', 'sevunyfov@mailinator.com', '08098767834', 'Fugiat duis vero ass', ' ', '2023-05-11 03:15:50'),
(42, '01gyfk66trwmz2wnppd57xmhvn', 'Nostrud perferendis', 'sevunyfov@mailinator.com', '08098767834', 'Fugiat duis vero ass', ' ', '2023-05-11 03:16:27');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_trainings`
--

CREATE TABLE `tbl_trainings` (
  `id` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `info` text NOT NULL,
  `price` varchar(100) DEFAULT NULL,
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

INSERT INTO `tbl_trainings` (`id`, `title`, `info`, `price`, `image`, `start_date`, `end_date`, `venue`, `reg_count`, `created_at`, `updated_at`) VALUES
('01gyfk66trwmz2wnppd57xmhvn', 'QA in Pharmaceuticals - Module 6', '<ul><li>Cleaning validation</li></ul><p><br></p><p><strong>Bank Details: </strong></p><p>QSM Training &amp; Consulting Ltd.</p><p>GTBank (0240416491)</p>', '35000', 'training-1682003139.jpg', '2023-05-16', '2023-05-17', 'QSM Training Palace - No 1, Ekololu street, Off Itire Road, Oposite Mobile Filling Station', 7, '2023-04-20 15:05:39', '2023-05-11 03:16:27'),
('01gyfkadayjm7g769s4gxv89h8', 'QA In Pharmaceuticals - Module 5', '<ul><li>Application of HACCP in <strong style=\"color: rgba(33, 37, 41, 0.75);\">&nbsp;</strong><span style=\"color: rgba(33, 37, 41, 0.75);\">Pharmaceuticals</span></li></ul><p><br></p><p><strong>Bank Details: </strong>QSM Training &amp; Consulting Ltd., GTBank (0240416491)</p><p><strong>Fee:  </strong>N30, 000</p>', '30000', 'training-1682003277.jpg', '2023-05-30', '2023-06-10', 'QSM Training Palace - No 1, Ekololu street, Off Itire Road, Oposite Mobile Filling Station', 5, '2023-04-20 15:07:57', '2023-05-18 06:14:52'),
('01h0pqwy515cmfpf0n1gmng8ks', 'Consequatur Ea arch', '<p>In numquam dolorem e.</p>', '340000', 'training-1684390439.jpg', '2023-05-19', '2023-06-10', 'Modi porro est sed c', 0, '2023-05-18 06:14:03', '2023-05-19 07:51:45'),
('01h0ps1cmhcmshcd3ezz2g1ka6', 'Quasi quam expedita', '<p>Aliquam consequuntur.</p>', '20000', NULL, '2023-05-23', '2023-05-31', 'Iste eiusmod aute ir', 0, '2023-05-18 06:33:57', '2023-05-18 10:02:20');

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
(1, '127.0.0.1', '2023-05-19 08:39:46');

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
-- Indexes for table `tbl_newsletters`
--
ALTER TABLE `tbl_newsletters`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tbl_archives`
--
ALTER TABLE `tbl_archives`
  MODIFY `archive_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `tbl_materials`
--
ALTER TABLE `tbl_materials`
  MODIFY `material_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `tbl_material_categories`
--
ALTER TABLE `tbl_material_categories`
  MODIFY `category_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `tbl_material_otp`
--
ALTER TABLE `tbl_material_otp`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `tbl_messages`
--
ALTER TABLE `tbl_messages`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tbl_newsletter`
--
ALTER TABLE `tbl_newsletter`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_newsletters`
--
ALTER TABLE `tbl_newsletters`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_registrations`
--
ALTER TABLE `tbl_registrations`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `tbl_visitors`
--
ALTER TABLE `tbl_visitors`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
