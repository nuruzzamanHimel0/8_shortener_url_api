-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 21, 2022 at 10:31 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_lara_ecom_vue_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(10) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED DEFAULT NULL,
  `productid` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_quantity` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `userid`, `productid`, `order_id`, `ip_address`, `product_quantity`, `created_at`, `updated_at`) VALUES
(70, 4, 9, 3, '127.0.0.1', 1, '2022-01-29 08:58:33', '2022-01-29 11:02:10'),
(71, 4, 8, 3, '127.0.0.1', 1, '2022-01-29 08:59:59', '2022-01-29 11:02:10'),
(72, 4, 12, 3, '127.0.0.1', 1, '2022-01-29 09:10:30', '2022-01-29 11:02:10'),
(73, 4, 1, 3, '127.0.0.1', 4, '2022-01-29 09:12:29', '2022-01-29 11:02:10'),
(75, NULL, 2, NULL, '127.0.0.1', 1, '2022-01-29 11:05:24', '2022-01-30 09:38:29'),
(76, NULL, 3, NULL, '127.0.0.1', 2, '2022-01-29 11:05:28', '2022-01-29 11:34:26'),
(77, NULL, 8, NULL, '127.0.0.1', 1, '2022-01-29 11:34:30', '2022-01-29 11:34:30'),
(78, NULL, 9, NULL, '127.0.0.1', 1, '2022-01-29 11:34:34', '2022-01-29 11:34:34'),
(79, NULL, 10, NULL, '127.0.0.1', 1, '2022-01-29 11:34:40', '2022-01-29 11:34:40'),
(80, 4, 11, 5, '127.0.0.1', 1, '2022-01-30 09:26:56', '2022-01-30 09:45:22'),
(82, 4, 9, 5, '127.0.0.1', 2, '2022-01-30 09:27:00', '2022-01-30 09:45:22'),
(83, 4, 8, 5, '127.0.0.1', 1, '2022-01-30 09:27:02', '2022-01-30 09:45:22'),
(84, 4, 3, 5, '127.0.0.1', 1, '2022-01-30 09:27:05', '2022-01-30 09:45:22'),
(85, 4, 2, 5, '127.0.0.1', 1, '2022-01-30 09:27:06', '2022-01-30 09:45:22');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2021_12_26_175617_create_user_roles_table', 1),
(9, '2021_12_27_161924_create_admins_table', 2),
(11, '2021_12_27_165751_create_sliders_table', 2),
(12, '2021_12_27_165852_create_paymentmethods_table', 2),
(13, '2021_12_27_165928_create_product_statuses_table', 2),
(14, '2021_12_27_165953_create_product_categories_table', 2),
(15, '2021_12_27_170011_create_product_brands_table', 2),
(16, '2021_12_27_170032_create_products_table', 2),
(17, '2021_12_27_170101_create_carts_table', 2),
(18, '2021_12_27_170137_create_orders_table', 2),
(19, '2021_12_27_170203_create_product_images_table', 2),
(20, '2021_12_28_160626_create_user_statuses_table', 2),
(21, '2021_12_27_165715_create_site_settings_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('014e2293a992bb24e8ba43017e1676cc500231f02378a59c1988b6e76dd2278149b80d4130275907', 1, 2, NULL, '[]', 0, '2021-12-27 10:13:01', '2021-12-27 10:13:01', '2022-12-27 16:13:01'),
('044ab983bc6c39a5ab4ea7c0528c2b678f94a3991998d8bdfb1ca0ec2ab80369b43a0a7ebdb5a53d', 3, 2, NULL, '[]', 0, '2022-01-20 17:37:56', '2022-01-20 17:37:56', '2023-01-20 23:37:56'),
('062a1efd2d2d621684c9c48491e66403107d967f92e2f4b819af5c7f202442dfa4ec178f8f137fa4', 4, 2, NULL, '[]', 0, '2022-01-20 22:49:33', '2022-01-20 22:49:33', '2023-01-21 04:49:33'),
('11656d93fa66ed5cdfa48f28830aa61273db8270272b4f9d95dc247d91f970268ef947d20d417f39', 4, 2, NULL, '[]', 0, '2022-01-29 10:04:36', '2022-01-29 10:04:36', '2023-01-29 16:04:36'),
('17edc17a1ab3086bac12a7dce7038e6d49393c53dad8bb5e0a54e717264ebc5bfe78d91991a24228', 1, 2, NULL, '[]', 0, '2021-12-30 11:08:51', '2021-12-30 11:08:51', '2022-12-30 17:08:51'),
('19e31898100b0aafa0d40cbaef330ee9df3bbebf86b27db3573ccca2c90b2fb5a96826021368702d', 4, 2, NULL, '[]', 0, '2022-01-20 21:32:33', '2022-01-20 21:32:33', '2023-01-21 03:32:33'),
('1e9f4cd0c8b06985b070d1be4518fba4af0a50cf70fe658088db63fb442144fcb67abc5edbd05e63', 4, 2, NULL, '[]', 0, '2022-01-30 08:55:39', '2022-01-30 08:55:39', '2023-01-30 14:55:39'),
('2683f3144768ae865d584663470693269702077fa87a2d7d8cdb7b40821dc5babb7ea0929354021e', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2022-02-17 11:35:46', '2022-02-17 11:35:46', '2023-02-17 17:35:46'),
('276d2d700966336629365ad807d45883eb7223ca6839d685e3b33250cd8ce23bd9cd077c74b6b304', 4, 2, NULL, '[]', 0, '2022-01-22 09:03:35', '2022-01-22 09:03:35', '2023-01-22 15:03:35'),
('33ae34b06336c0cc1532179a684a4afeba87860cde751333a6681e43d6a80a1c8b976481a7c1f6b1', 4, 2, NULL, '[]', 0, '2022-01-21 07:20:29', '2022-01-21 07:20:29', '2023-01-21 13:20:29'),
('391dea959346eb2f05ddb0c23e179fb29bbc70bc8ac8438ca99e90192f565e6a0110bca7a356ebf4', 1, 2, NULL, '[]', 0, '2021-12-31 10:02:07', '2021-12-31 10:02:07', '2022-12-31 16:02:07'),
('3cd3892670a0cbe5ae57c0437e0d0796d155c2f0f2344c6d302018fac6ee7c55bded263fdfaeebd6', 1, 2, NULL, '[]', 0, '2021-12-31 00:50:16', '2021-12-31 00:50:16', '2022-12-31 06:50:16'),
('3f987486c10540298a2cc2efc13480652151b38a9ab290042efe1f9622e1fbc21213488e4c7e3b55', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2022-02-17 10:40:22', '2022-02-17 10:40:22', '2023-02-17 16:40:22'),
('4b4e72eb23da8bf09e7a62db764ae0121482f67c29f641d38e0e455ee6cf4eace8559c726457e4e4', 1, 2, NULL, '[]', 0, '2021-12-30 11:06:59', '2021-12-30 11:06:59', '2022-12-30 17:06:59'),
('4b758c0c52f8af81cc2dc73401d53572a3ec50a243794752991cbafb2a77e746594ef8f33db5eab2', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2022-02-17 10:45:39', '2022-02-17 10:45:39', '2023-02-17 16:45:39'),
('4c51e347d343585621bc6bb342afa8a18fa9f2b140b0da80648a88946c4f2355b8602fd51b6cfae8', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2022-02-17 10:44:25', '2022-02-17 10:44:25', '2023-02-17 16:44:25'),
('4e7f2c1f949163454047756441f3e2ab87585700deb771253501a3ce75340dc89a7b056501afcddb', 1, 2, NULL, '[]', 0, '2021-12-31 00:49:12', '2021-12-31 00:49:12', '2022-12-31 06:49:12'),
('5229cb1a49862b4d677dd691f968bc1f18be32200af243940edcf38999d0fb7501bd65d7de6014b6', 1, 2, NULL, '[]', 0, '2022-01-01 09:59:46', '2022-01-01 09:59:46', '2023-01-01 15:59:46'),
('5b38dad5520c50223c51c2f30a40eea43cda2d7ec161a4562cdf39e04f55e7bad26a9537ab0c8da5', 1, 2, NULL, '[]', 0, '2021-12-30 11:06:12', '2021-12-30 11:06:12', '2022-12-30 17:06:12'),
('5c0b624b97d1495cce361c2baf027c06e419a4063af95e961d9c26e767edfd959c1e298e4613a3bf', 4, 2, NULL, '[]', 0, '2022-01-22 08:15:08', '2022-01-22 08:15:08', '2023-01-22 14:15:08'),
('65d023c4c33f7fb9859ddcd71fed9105d5d2bdd5c7bc13d905623a7ea9a68fa9ba026b7c85b04ae0', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2022-02-17 10:34:55', '2022-02-17 10:34:55', '2023-02-17 16:34:55'),
('6db17f1106885db8ce33c383c88f8049291cf7f840c4fc06e6d0d686a727b3694abc347a225ecdc2', 1, 2, NULL, '[]', 0, '2021-12-30 11:06:34', '2021-12-30 11:06:34', '2022-12-30 17:06:34'),
('6f400f07bfe173e6f5d78c8a29f590bcd421f2e7bd45fffde2a9f42f4fa3c876aa1cb55d12179ab6', 4, 2, NULL, '[]', 0, '2022-01-23 08:11:20', '2022-01-23 08:11:20', '2023-01-23 14:11:20'),
('72057b270fd5f3e4d57559d1b9a20b0ee178c2c7a0de8e7969ce2b152437f0a26e0791eb2161888c', 4, 2, NULL, '[]', 0, '2022-01-20 17:35:52', '2022-01-20 17:35:52', '2023-01-20 23:35:52'),
('735f82abda6c18a4a698ec959c90f3ab148c1e5d5db585623ccffe7b47b3a987a06770d6e3f9ef0f', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2022-02-17 11:35:08', '2022-02-17 11:35:08', '2023-02-17 17:35:08'),
('73958ba242cce439621a6efd66bf5bccd678285f5609ae5ec834fa039d22fad959974b779d1ff841', 4, 2, NULL, '[]', 0, '2022-01-20 17:39:12', '2022-01-20 17:39:12', '2023-01-20 23:39:12'),
('79289bdbd9f4681d07e2e3b5af76d5c52a4ae0af6fadf5ea2686ec2a6334b7dd2c87e1ae665453f1', 1, 2, NULL, '[]', 0, '2021-12-31 06:29:33', '2021-12-31 06:29:33', '2022-12-31 12:29:33'),
('7c0151b3cda3562fcbb2795e00a2324b7de9d51af8378f77faa792972f931ddb204eed8030dc85e9', 4, 2, NULL, '[]', 0, '2022-01-25 10:49:13', '2022-01-25 10:49:13', '2023-01-25 16:49:13'),
('7f333e9baa89c248e7e5dece8e75d770c4ec43d31c91a455c5f3a55f2fc108391cb27dfcf69d8ddf', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2022-02-17 10:38:01', '2022-02-17 10:38:01', '2023-02-17 16:38:01'),
('81d41e15ff69ea35119a93414030042b571ce1c6d830e0a910645710ed0e6ba8b999524f25fa326f', 4, 2, NULL, '[]', 0, '2022-01-26 11:37:17', '2022-01-26 11:37:17', '2023-01-26 17:37:17'),
('836660e7ec5fda068ff6e660dbf0a92299c89a27c5f862d897c42c9954fd8a5aac114144406a0e8f', 4, 2, NULL, '[]', 0, '2022-01-20 22:57:24', '2022-01-20 22:57:24', '2023-01-21 04:57:24'),
('85fa63b97b9551eaa6a4923a8a1cdbb5ca2566b2a07b638f57beb41d5b8d2eadbf7cb6148c61b6fd', 1, 2, NULL, '[]', 0, '2021-12-30 23:21:22', '2021-12-30 23:21:22', '2022-12-31 05:21:22'),
('8635a86b1747f898c2c1fd403e015d72e7faa02b863ae1f6705531def9e9edbbd4e6695eac333281', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2022-02-17 11:31:23', '2022-02-17 11:31:23', '2023-02-17 17:31:23'),
('873563f2f339f78b7a73cad05c0d3ebf1589393bcf421b60f312f93dbb3b0740c884ea9173f25a24', 1, 2, NULL, '[]', 0, '2022-01-15 09:03:32', '2022-01-15 09:03:32', '2023-01-15 15:03:32'),
('877c9777a42c1d7588f1e47b1e804d2325047e5e828c968ebb1dc44dc96d55899a334674b5d93c9e', 1, 2, NULL, '[]', 0, '2021-12-30 11:05:34', '2021-12-30 11:05:34', '2022-12-30 17:05:34'),
('8bbc3d28c678554d591b462b615ee9483e1fdd6a98d19a30f69b30a82ca2048a5e44936166d5b1a7', 1, 2, NULL, '[]', 0, '2021-12-30 11:09:13', '2021-12-30 11:09:13', '2022-12-30 17:09:13'),
('8bde092099916b9fe23467c20ddf26518f75746c3cd818e5351fc0259ed1ab64ab3ad2f237631919', 4, 2, NULL, '[]', 0, '2022-01-26 09:58:30', '2022-01-26 09:58:30', '2023-01-26 15:58:30'),
('8cc80fb4b8d928bcd7e53d07c09dfc6657dda63d4a16b0dcc9633d1be27f4ff15bcec22bb0cd1cd1', 4, 2, NULL, '[]', 0, '2022-02-21 10:31:08', '2022-02-21 10:31:08', '2023-02-21 16:31:08'),
('8f0eea9ab8ce8e546998200ee6671337a573d4279b66293eb36be063fbf8916c384481aab7129249', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2022-02-17 11:34:47', '2022-02-17 11:34:47', '2023-02-17 17:34:47'),
('8fa5d04c9287827a2e3cb5088d41f827052fc913942f08ffcb3ac38baae84522b33831a871f1ba1a', 1, 2, NULL, '[]', 0, '2021-12-30 23:19:30', '2021-12-30 23:19:30', '2022-12-31 05:19:30'),
('94409984e15647f07799eeb2acbd883b68d970d7c662859761e05f19c493cd257efe69cac105dc04', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2022-02-17 10:39:31', '2022-02-17 10:39:31', '2023-02-17 16:39:31'),
('98802da376f0e1da61b53c4c5286e1dcbb63e8944b7c2549736e66cebcfdc89c2c21763e48c42fcd', 4, 2, NULL, '[]', 0, '2022-01-20 18:36:33', '2022-01-20 18:36:33', '2023-01-21 00:36:33'),
('99de717013cf7a313bcdf6c8767aacc3802750f83b125aa5a6ce95459e7d179858aae79fc45babc3', 1, 2, NULL, '[]', 0, '2022-02-20 09:30:20', '2022-02-20 09:30:20', '2023-02-20 15:30:20'),
('9bc79ff1443548cc402bffa43fa6ab9f5b466fa6f13ef5106fc3bcba6f2214bd2d5d3503ac022c4b', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2022-02-17 10:39:49', '2022-02-17 10:39:49', '2023-02-17 16:39:49'),
('9d684f8a27c97029a06eafe6ff5b6c0cf30eb98cb171c4c4e1ccc4b736e680fa027853e6777fe605', 1, 2, NULL, '[]', 0, '2021-12-31 06:30:33', '2021-12-31 06:30:33', '2022-12-31 12:30:33'),
('a2c219050b2179daa22555e5c0dc080bf4e00ab5d373306d7ef19df66d9ae6442b02a52cfaa2f584', 4, 2, NULL, '[]', 0, '2022-01-20 18:35:28', '2022-01-20 18:35:28', '2023-01-21 00:35:28'),
('b0774fc8b9ef03deab40e812b788986c9606988faf5e0cea97314c6016c90ca170ad709ca9de8200', 1, 2, NULL, '[]', 0, '2021-12-27 10:14:46', '2021-12-27 10:14:46', '2022-12-27 16:14:46'),
('b6655dc52b15d02ab9957061ee9a7711cfb7ecf51b35090888f3a4d675f78ff4dc13d92dddb664b1', 1, 2, NULL, '[]', 0, '2021-12-27 10:29:23', '2021-12-27 10:29:23', '2022-12-27 16:29:23'),
('be293a54aad0f1e836eee316ff04d3bf20f8ca9ffa5e521b311f7cb65956a26a0011ec108bc7d79b', 1, 2, NULL, '[]', 0, '2022-02-19 10:55:21', '2022-02-19 10:55:21', '2023-02-19 16:55:21'),
('bea7561f321c65946b0ae53d4a04f6e40fa4f2fa378c814ca9e27c95c77c60e094d2f88f06b0dfba', 4, 2, NULL, '[]', 0, '2022-01-20 17:39:35', '2022-01-20 17:39:35', '2023-01-20 23:39:35'),
('c9990c5c78d30b461e2bb72e3492bbf5c3afd0b4bb1af550c978f616ab3e33a9d93b2d3fef81dbe0', 1, 2, NULL, '[]', 0, '2021-12-30 11:07:16', '2021-12-30 11:07:16', '2022-12-30 17:07:16'),
('cea4bf4deb14d5000b73f36fbea485d539dcc419f75126694909411096a2ea4ebba3640479f0648b', 1, 2, NULL, '[]', 0, '2021-12-29 12:08:06', '2021-12-29 12:08:06', '2022-12-29 18:08:06'),
('da2d62812f22057dc728254fbb378159c4c65f0959e4caf8c0976aca9d243185f9bc45ae76852b90', 4, 2, NULL, '[]', 0, '2022-01-27 22:19:56', '2022-01-27 22:19:56', '2023-01-28 04:19:56'),
('dfb8585fe059ba80850f77686c1d30a450391ba868b04d82f692209ffc6eeba88bc72f51a876a18b', 4, 2, NULL, '[]', 0, '2022-01-20 23:14:44', '2022-01-20 23:14:44', '2023-01-21 05:14:44'),
('e38d7e9fc63dd5b599f5ff17f7ba8aa7d5431af61e0b475f70baff0ece24d5d14afcf500ba487a15', 1, 2, NULL, '[]', 0, '2021-12-30 11:04:03', '2021-12-30 11:04:03', '2022-12-30 17:04:03'),
('ecce79b4d319c7365fd86d0dedda8f2fe3a32b4f1b6ef1fe1378caa59a2faf91f1b7c56b87114a4e', 4, 2, NULL, '[]', 0, '2022-01-20 18:44:21', '2022-01-20 18:44:21', '2023-01-21 00:44:21'),
('f107464776524f0fee8e9064295c2ee9537f133dc26b0b4187e423e95cecec567a45496575deb57e', 4, 2, NULL, '[]', 0, '2022-01-28 10:20:53', '2022-01-28 10:20:53', '2023-01-28 16:20:53'),
('f4444c4314364cf74176193f60d9d18d051f3d1b5ba4eac6160334bcc09ccf90c7c6c0c4c89c6024', 4, 2, NULL, '[]', 0, '2022-01-22 09:05:21', '2022-01-22 09:05:21', '2023-01-22 15:05:21'),
('f621ddc664d6b0812b51b580eb9860581881a2ad8347248d0526a67313b698ce8291d36a7c853b92', 1, 2, NULL, '[]', 0, '2021-12-29 12:07:49', '2021-12-29 12:07:49', '2022-12-29 18:07:49'),
('f794d92b5cae9868695756bfdbd192d0d3d512c79021faef3b826553b95e94484793bc9162d1f976', 1, 2, NULL, '[]', 0, '2021-12-31 06:40:09', '2021-12-31 06:40:09', '2022-12-31 12:40:09'),
('f82d2790db3af8cd0ecea287679bc3d5130147ba0d417461f3ea6ddc82e3463743b101ac79f450ce', 1, 2, NULL, '[]', 0, '2021-12-31 06:28:19', '2021-12-31 06:28:19', '2022-12-31 12:28:19'),
('fa2cf2e99cca5e13c10f588ac2b16b6b2c8e6f22d7e82e13e67dd950ce4cc163d11c738379e6ee4a', 4, 2, NULL, '[]', 0, '2022-01-20 18:44:54', '2022-01-20 18:44:54', '2023-01-21 00:44:54'),
('fb0efcfe260774ef651a287b52ea908a38999c586848eaa17b111eb785adbec7ce1562605f355476', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2022-02-17 10:43:27', '2022-02-17 10:43:27', '2023-02-17 16:43:27'),
('ff40a27c0e11723b325a7bc5b450585097c1bc10631435501a585f94a75eca0f8b454c07d23760a0', 1, 2, NULL, '[]', 0, '2021-12-31 06:29:55', '2021-12-31 06:29:55', '2022-12-31 12:29:55');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'F9FFXUCBNl0RAqu2dAjYMJ7c3JLwLXGEFaun5BNb', 'http://localhost', 1, 0, 0, '2021-12-26 11:58:08', '2021-12-26 11:58:08'),
(2, NULL, 'Laravel Password Grant Client', 'fVXNYS3d9oSEVqDH6O87NvyEANFgyFJnNAZ8rIR9', 'http://localhost', 0, 1, 0, '2021-12-26 11:58:08', '2021-12-26 11:58:08');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-12-26 11:58:08', '2021-12-26 11:58:08');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('038605ca4b554454092ba3695f572ec789de504f6a288c74d41d5303271fe980b625c1b52be7fe5d', 'b6655dc52b15d02ab9957061ee9a7711cfb7ecf51b35090888f3a4d675f78ff4dc13d92dddb664b1', 0, '2022-12-27 16:29:23'),
('0b31071247aa49ffc758b51bf3e3e478b4b4c6a5942fa84e1038ef4fbb02839e3ff5da7bc07ead12', '044ab983bc6c39a5ab4ea7c0528c2b678f94a3991998d8bdfb1ca0ec2ab80369b43a0a7ebdb5a53d', 0, '2023-01-20 23:37:56'),
('0b5ff690ea98f15f160d7a6d920728982d4733e291605f74efcbe7e7da783c9230179148bc0a407d', 'b0774fc8b9ef03deab40e812b788986c9606988faf5e0cea97314c6016c90ca170ad709ca9de8200', 0, '2022-12-27 16:14:46'),
('0cceaba6f2bcdadf7b3d4e1c83ba21ee05fdffe32b2a654d410fe6e1208e22efff9f7ea9cfe2e2ee', '6f400f07bfe173e6f5d78c8a29f590bcd421f2e7bd45fffde2a9f42f4fa3c876aa1cb55d12179ab6', 0, '2023-01-23 14:11:20'),
('17517d707221c2f4348402d4f050b142ce4e82fe349998587f16e0a00e42dd91e38b8781e54bfd89', '8bbc3d28c678554d591b462b615ee9483e1fdd6a98d19a30f69b30a82ca2048a5e44936166d5b1a7', 0, '2022-12-30 17:09:13'),
('17840165798746f5c35dc6f9f48ab406f9a9d843ba360d4f81aedcd89a21d241c6ba184602dd8f2f', '79289bdbd9f4681d07e2e3b5af76d5c52a4ae0af6fadf5ea2686ec2a6334b7dd2c87e1ae665453f1', 0, '2022-12-31 12:29:33'),
('198f6a1140f65ba1763ab9beb690ae62e3308f44e82190f9fd08a757bf27221d92c1b61efe13bc7f', '3cd3892670a0cbe5ae57c0437e0d0796d155c2f0f2344c6d302018fac6ee7c55bded263fdfaeebd6', 0, '2022-12-31 06:50:16'),
('20771946a9e3d436ac10c84372d5b29522517582ae0b09881b571ce4afb575dd961a17d63317c1ab', '1e9f4cd0c8b06985b070d1be4518fba4af0a50cf70fe658088db63fb442144fcb67abc5edbd05e63', 0, '2023-01-30 14:55:39'),
('2b74af5f9324619cfb94e8f4f3f61897bad8f1e7fefacedd42ddde573636c58ea934afe4cb337718', 'f621ddc664d6b0812b51b580eb9860581881a2ad8347248d0526a67313b698ce8291d36a7c853b92', 0, '2022-12-29 18:07:50'),
('38f9520946fc2fdcc76e8e71e937d7027a1c5664c063c5058dec710af7b2e62129268c769c9fcd3d', '81d41e15ff69ea35119a93414030042b571ce1c6d830e0a910645710ed0e6ba8b999524f25fa326f', 0, '2023-01-26 17:37:17'),
('396e2e4492c882e378dd5f9bd68d18380f98ca6e944be5b60e93c4b7a649b4e169a7cca88159a618', 'ecce79b4d319c7365fd86d0dedda8f2fe3a32b4f1b6ef1fe1378caa59a2faf91f1b7c56b87114a4e', 0, '2023-01-21 00:44:21'),
('3f43828a0b5af87d01a3a718d3168a5fb6562628acb88e77f1f3acdae005b96504c9cd1126447939', 'dfb8585fe059ba80850f77686c1d30a450391ba868b04d82f692209ffc6eeba88bc72f51a876a18b', 0, '2023-01-21 05:14:44'),
('432ff3eb044833429908d317db9f884ffabc28f5b65cf7cdd80e987039e5f2b5fe863fcb4b572af8', '8fa5d04c9287827a2e3cb5088d41f827052fc913942f08ffcb3ac38baae84522b33831a871f1ba1a', 0, '2022-12-31 05:19:30'),
('451213fb6d3304b9ecbd0a956abdf18e1e49ab864d5f5799bf27a4b03468dac4d6d36920deb4290f', '72057b270fd5f3e4d57559d1b9a20b0ee178c2c7a0de8e7969ce2b152437f0a26e0791eb2161888c', 0, '2023-01-20 23:35:52'),
('4c99717961dc3de020e5b307d3e35d64ca0e9dc5694795cd816a604842f600a0f9a27a766aa52dca', '19e31898100b0aafa0d40cbaef330ee9df3bbebf86b27db3573ccca2c90b2fb5a96826021368702d', 0, '2023-01-21 03:32:33'),
('4d7ab6c4a9bb19fddf775b3757dda4c99d84fc4038f43877dcaf21d68d736f63927f42ef85a59fa1', '7c0151b3cda3562fcbb2795e00a2324b7de9d51af8378f77faa792972f931ddb204eed8030dc85e9', 0, '2023-01-25 16:49:14'),
('519f2befb3dcc50513e53f35047dd05cdd90b1490d7503b72fe2a966899aafad3c8ca5297c4e0340', '391dea959346eb2f05ddb0c23e179fb29bbc70bc8ac8438ca99e90192f565e6a0110bca7a356ebf4', 0, '2022-12-31 16:02:07'),
('544ce2e22cb8f9119fb0b754b513f983d3e87f15d16aa514c10e6393bfddcea4903141617ec455ba', '8bde092099916b9fe23467c20ddf26518f75746c3cd818e5351fc0259ed1ab64ab3ad2f237631919', 0, '2023-01-26 15:58:30'),
('58a83b196cfabcd027f83e366950be7620ad174394e6faef38fde3527ea65b347f27a46d3b8ea960', '014e2293a992bb24e8ba43017e1676cc500231f02378a59c1988b6e76dd2278149b80d4130275907', 0, '2022-12-27 16:13:01'),
('5c83ee7624cd3a62d290b086a343acd14f14daf5cdef5c6a241d46aa19082e8976e84e81c064d7a6', 'bea7561f321c65946b0ae53d4a04f6e40fa4f2fa378c814ca9e27c95c77c60e094d2f88f06b0dfba', 0, '2023-01-20 23:39:35'),
('5ea3ef3ce21c4d7fedd7ebedde2809f231210ff8d26f60471d5bb37b7edccea4e3993fa369b9de0b', 'e38d7e9fc63dd5b599f5ff17f7ba8aa7d5431af61e0b475f70baff0ece24d5d14afcf500ba487a15', 0, '2022-12-30 17:04:03'),
('5ec023e51b9124196bdaee4c02f78122e9eaff1e8bd28d94928b66a2e14772200dd0cd5f606378d8', '98802da376f0e1da61b53c4c5286e1dcbb63e8944b7c2549736e66cebcfdc89c2c21763e48c42fcd', 0, '2023-01-21 00:36:33'),
('6de40cf0f0175f34cc6f2dcb2475881e0f287383b6d9847026e36f102923492d6a63c73412c15da7', '5c0b624b97d1495cce361c2baf027c06e419a4063af95e961d9c26e767edfd959c1e298e4613a3bf', 0, '2023-01-22 14:15:08'),
('740459ccb659d79f0eebd50556136115b3e3d93fbce289a21af6c53c5ec3a38aee658d943e497264', 'f794d92b5cae9868695756bfdbd192d0d3d512c79021faef3b826553b95e94484793bc9162d1f976', 0, '2022-12-31 12:40:09'),
('7a152c1e24829634d2513fefd86034ce7415236c94882b72e070e297b844566e58fb3c6b78fd0aeb', '5b38dad5520c50223c51c2f30a40eea43cda2d7ec161a4562cdf39e04f55e7bad26a9537ab0c8da5', 0, '2022-12-30 17:06:12'),
('7a1d6c55b9f0b18d1e2dbfb4038c0b1c11620fcd5a8588efd340c7c9dc13275983dfd6bb89045779', '5229cb1a49862b4d677dd691f968bc1f18be32200af243940edcf38999d0fb7501bd65d7de6014b6', 0, '2023-01-01 15:59:46'),
('84202629db3a4181a6ec7fda01d6713645c8635ba644e7a3919e5cc4ca9c3a46c817916888dc5ba9', '4b4e72eb23da8bf09e7a62db764ae0121482f67c29f641d38e0e455ee6cf4eace8559c726457e4e4', 0, '2022-12-30 17:06:59'),
('85a450dea86fdda8c3c83c20fdee7c417ba5a298793fa1f247310df5e7c20de5744903e9703b2841', '85fa63b97b9551eaa6a4923a8a1cdbb5ca2566b2a07b638f57beb41d5b8d2eadbf7cb6148c61b6fd', 0, '2022-12-31 05:21:22'),
('87b8633201b9d972651d90189c408b4c0e12d250fd45bef1231aad51685e4ac3f237c55c0816da3e', '836660e7ec5fda068ff6e660dbf0a92299c89a27c5f862d897c42c9954fd8a5aac114144406a0e8f', 0, '2023-01-21 04:57:24'),
('89174720453ec7402b51ad50ed57985155164110bc12974f9c76701e441e7f7ee7222ed9b2060758', '8cc80fb4b8d928bcd7e53d07c09dfc6657dda63d4a16b0dcc9633d1be27f4ff15bcec22bb0cd1cd1', 0, '2023-02-21 16:31:08'),
('8c2e4170a1fd106ac6cbf484e891e304a47885ee4bed4f67ff64d4efed31793fb0a2ee94745d52f7', 'f107464776524f0fee8e9064295c2ee9537f133dc26b0b4187e423e95cecec567a45496575deb57e', 0, '2023-01-28 16:20:54'),
('8fb481b1eb52866c00e10c2e22e7007f47e969afabbe126643a9391d162b885baad039364eebb519', 'be293a54aad0f1e836eee316ff04d3bf20f8ca9ffa5e521b311f7cb65956a26a0011ec108bc7d79b', 0, '2023-02-19 16:55:21'),
('902477a371108e3e7af580f13e7daccdfdcd04ed0227e5032c1c45f802e864022287a9c0f1ad1704', '99de717013cf7a313bcdf6c8767aacc3802750f83b125aa5a6ce95459e7d179858aae79fc45babc3', 0, '2023-02-20 15:30:20'),
('92f523093dc51042fc4c43196e90a659440ac3922735b6ea98689446ddf25121074d9c402aab047f', '11656d93fa66ed5cdfa48f28830aa61273db8270272b4f9d95dc247d91f970268ef947d20d417f39', 0, '2023-01-29 16:04:36'),
('94d7d8ee7bbb33b88d99fc2a44d1daad9155c0011caf5e53f142cb1507df292dbc34ad7a2062d800', 'cea4bf4deb14d5000b73f36fbea485d539dcc419f75126694909411096a2ea4ebba3640479f0648b', 0, '2022-12-29 18:08:06'),
('95ad7b01aa8ad3805eebfc647ed689d2744daf86a3a643fb4bd1c6f2cce88cd6a8a602b81b26fe85', '062a1efd2d2d621684c9c48491e66403107d967f92e2f4b819af5c7f202442dfa4ec178f8f137fa4', 0, '2023-01-21 04:49:34'),
('96deb20b9e19702f1dd5cd49fc4af237a1fc506eaa5b5a1dfbb4cb3c62fb6e7c135c2c955e945175', 'ff40a27c0e11723b325a7bc5b450585097c1bc10631435501a585f94a75eca0f8b454c07d23760a0', 0, '2022-12-31 12:29:55'),
('9894f95a2379d249c2aa5ef2c8ef310e29664751a7d4c751835e0b55987a6e7cee5beeddfcf0587c', '276d2d700966336629365ad807d45883eb7223ca6839d685e3b33250cd8ce23bd9cd077c74b6b304', 0, '2023-01-22 15:03:35'),
('ae2248df0e1cc46981f80c736c475c3ba9bd2ddd37cbd7a6845f7e353df6602adaa8ed276801f55e', '9d684f8a27c97029a06eafe6ff5b6c0cf30eb98cb171c4c4e1ccc4b736e680fa027853e6777fe605', 0, '2022-12-31 12:30:34'),
('b247a55b197294be15339c34bae6a624a1a475d1e5fce81e53e8ae52b74c5f4e5fb79d89fb9d2eec', '73958ba242cce439621a6efd66bf5bccd678285f5609ae5ec834fa039d22fad959974b779d1ff841', 0, '2023-01-20 23:39:12'),
('ba4806a603cf39614f976d6669ef0f7f10df18933af2fff89fca4c66fde92c382573f8d616d62471', 'f82d2790db3af8cd0ecea287679bc3d5130147ba0d417461f3ea6ddc82e3463743b101ac79f450ce', 0, '2022-12-31 12:28:19'),
('cac2cb3966641831d7ec779b0a4fadb9028d081c74c03a56d9d2fb6eb9aa37f8e639168049db5e7b', 'f4444c4314364cf74176193f60d9d18d051f3d1b5ba4eac6160334bcc09ccf90c7c6c0c4c89c6024', 0, '2023-01-22 15:05:22'),
('d895dc5c56a19e5cb8b4913c84568efc27fcd27fc819429e26dace5ba57e3baabd31b82874236ba1', 'a2c219050b2179daa22555e5c0dc080bf4e00ab5d373306d7ef19df66d9ae6442b02a52cfaa2f584', 0, '2023-01-21 00:35:28'),
('dc6589c0c29cd8b404f7ed7e1566b8f37ed67c7cc1c79ae7ce68d44bcb5a69ec6be4a710dc662b9a', 'fa2cf2e99cca5e13c10f588ac2b16b6b2c8e6f22d7e82e13e67dd950ce4cc163d11c738379e6ee4a', 0, '2023-01-21 00:44:54'),
('dfae03a349b4c383271339473ff6470dc49c9fe540c7a65ad73a56221d8bb18cb798089fd90bf3f3', '873563f2f339f78b7a73cad05c0d3ebf1589393bcf421b60f312f93dbb3b0740c884ea9173f25a24', 0, '2023-01-15 15:03:32'),
('e1ae9465068c838838bc0745e680542da2cf274c89d7549524dda58f7442096fcdc1decda8daa64a', '6db17f1106885db8ce33c383c88f8049291cf7f840c4fc06e6d0d686a727b3694abc347a225ecdc2', 0, '2022-12-30 17:06:34'),
('e94df3c7d127c6f63cedf919dc0169ed05a0dd09ef0d004642c478bb89499910db6342129cbb1c40', '17edc17a1ab3086bac12a7dce7038e6d49393c53dad8bb5e0a54e717264ebc5bfe78d91991a24228', 0, '2022-12-30 17:08:51'),
('ea2ab3ab159ff31a4d88f95699ac6f73ceecdfbd67107bec7ed8a6995a97b29fd2446d26ce67d826', '33ae34b06336c0cc1532179a684a4afeba87860cde751333a6681e43d6a80a1c8b976481a7c1f6b1', 0, '2023-01-21 13:20:29'),
('eae62ba65b763d4973949135b0e033a2f57ded3229dc26aba6998a7c509887e9ccaf9948c2b094fe', 'c9990c5c78d30b461e2bb72e3492bbf5c3afd0b4bb1af550c978f616ab3e33a9d93b2d3fef81dbe0', 0, '2022-12-30 17:07:16'),
('ec69231a1d6e42f07ed700b913da4c31f09d3cbe17ed4bdbd3756f5bb1ecfb2454c2ea77be3db671', '4e7f2c1f949163454047756441f3e2ab87585700deb771253501a3ce75340dc89a7b056501afcddb', 0, '2022-12-31 06:49:12'),
('f17ea0ce6656bbd00c62d4162ac1dd77f31d3898856d1b233c97c85fc43db82d3c7fe09316887a29', '877c9777a42c1d7588f1e47b1e804d2325047e5e828c968ebb1dc44dc96d55899a334674b5d93c9e', 0, '2022-12-30 17:05:34'),
('f660c7ab0efb2d26a05db66e0b60b1b3bee188d15f4f5b81fdef37738c16d089410cee9e96b9010a', 'da2d62812f22057dc728254fbb378159c4c65f0959e4caf8c0976aca9d243185f9bc45ae76852b90', 0, '2023-01-28 04:19:56');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL,
  `paymentid` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `is_paid` int(10) UNSIGNED DEFAULT NULL,
  `is_complete` int(10) UNSIGNED DEFAULT NULL,
  `is_seen_by_admin` int(10) UNSIGNED DEFAULT NULL,
  `transation_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_cost` int(11) NOT NULL,
  `customer_discount` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userid`, `paymentid`, `ip_address`, `name`, `phone_number`, `shipping_address`, `email`, `message`, `is_paid`, `is_complete`, `is_seen_by_admin`, `transation_id`, `shipping_cost`, `customer_discount`, `created_at`, `updated_at`) VALUES
(1, 4, 1, '127.0.0.1', 'Nuruzzaman tomal', '01622819929', 'south bonosri, dhaka', 'n.himel143@gmail.com', 'Nothing', 1, 0, 0, NULL, 100, NULL, NULL, NULL),
(2, 4, 2, '127.0.0.1', 'Nuruzzaman tomal', '01622819929', 'south bonosri, dhaka', 'n.himel143@gmail.com', 'dfdfdf', 1, 0, 0, 'aaaaaaaaaaaaaaaaa', 100, NULL, NULL, NULL),
(3, 4, 1, '127.0.0.1', 'Nuruzzaman tomal', '01622819929', 'south bonosri, dhaka', 'n.himel143@gmail.com', 'dfd', 1, 0, 0, NULL, 100, NULL, NULL, NULL),
(4, 4, 1, '127.0.0.1', 'Nuruzzaman tomal', '01622819929', 'south bonosri, dhaka', 'n.himel143@gmail.com', 'dfd', 1, 0, 0, NULL, 100, NULL, NULL, NULL),
(5, 4, 2, '127.0.0.1', 'Nuruzzaman tomal', '01622819929', 'south bonosri, dhaka', 'n.himel143@gmail.com', NULL, 1, 0, 0, 'দফদফ', 100, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paymentmethods`
--

CREATE TABLE `paymentmethods` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prority` int(11) NOT NULL DEFAULT '1' COMMENT '1=active,2=deactive',
  `short_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `paymentmethods`
--

INSERT INTO `paymentmethods` (`id`, `name`, `image`, `prority`, `short_name`, `created_at`, `updated_at`) VALUES
(1, 'Cache In', 'carchin.jpg', 1, 'Cache In', NULL, NULL),
(2, 'Bikash Mobile Banking', 'Bikash.jpg', 2, 'Bikash', NULL, NULL),
(3, 'Datch Bangla Mobile Banking', 'dbbm.jpg', 3, 'dbmb', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL,
  `categoryId` int(10) UNSIGNED NOT NULL,
  `brandId` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `offer_price` int(10) UNSIGNED DEFAULT NULL,
  `productstatus_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `userid`, `categoryId`, `brandId`, `title`, `description`, `slug`, `quantity`, `price`, `offer_price`, `productstatus_id`, `ip_address`, `created_at`, `updated_at`) VALUES
(1, 1, 12, 2, 'BMW 123', 'Bayerische Motoren Werke AG, commonly known as Bavarian Motor Works, BMW or BMW AG, is a German automobile, motorcycle and engine manufacturing company founded in 1916. BMW is headquartered in Munich, Bavaria. It also owns and produces Mini cars, and is the parent company of Rolls-Royce Motor Cars', 'bmw-123', 100, 100000, NULL, 1, '127.0.0.1', NULL, NULL),
(2, 1, 12, 4, 'Ferarri 215', 'Bayerische Motoren Werke AG, commonly known as Bavarian Motor Works, BMW or BMW AG, is a German automobile, motorcycle and engine manufacturing company founded in 1916. BMW is headquartered in Munich, Bavaria. It also owns and produces Mini cars, and is the parent company of Rolls-Royce Motor Cars', 'ferarri-215', 50, 200000, 149999, 1, '127.0.0.1', NULL, NULL),
(3, 1, 4, 16, 'Nokia', 'Bayerische Motoren Werke AG, commonly known as Bavarian Motor Works, BMW or BMW AG, is a German automobile, motorcycle and engine manufacturing company founded in 1916. BMW is headquartered in Munich, Bavaria. It also owns and produces Mini cars, and is the parent company of Rolls-Royce Motor CarsBayerische Motoren Werke AG, commonly known as Bavarian Motor Works, BMW or BMW AG, is a German automobile, motorcycle and engine manufacturing company founded in 1916. BMW is headquartered in Munich, Bavaria. It also owns and produces Mini cars, and is the parent company of Rolls-Royce Motor Cars', 'nokia', 500, 5000, 0, 1, '127.0.0.1', NULL, NULL),
(4, 1, 4, 14, 'IPhone', 'Bayerische Motoren Werke AG, commonly known as Bavarian Motor Works, BMW or BMW AG, is a German automobile, motorcycle and engine manufacturing company founded in 1916. BMW is headquartered in Munich, Bavaria. It also owns and produces Mini cars, and is the parent company of Rolls-Royce Motor Cars', 'iphone', 600, 80000, 75000, 1, '127.0.0.1', NULL, NULL),
(5, 1, 5, 3, 'NEWFAN 254', 'Bayerische Motoren Werke AG, commonly known as Bavarian Motor Works, BMW or BMW AG, is a German automobile, motorcycle and engine manufacturing company founded in 1916. BMW is headquartered in Munich, Bavaria. It also owns and produces Mini cars, and is the parent company of Rolls-Royce Motor Cars', 'newfan-254', 500, 1750, 1696, 1, '127.0.0.1', NULL, NULL),
(6, 1, 5, 6, 'GORRDIM FAN', 'Bayerische Motoren Werke AG, commonly known as Bavarian Motor Works, BMW or BMW AG, is a German automobile, motorcycle and engine manufacturing company founded in 1916. BMW is headquartered in Munich, Bavaria. It also owns and produces Mini cars, and is the parent company of Rolls-Royce Motor Cars', 'gorrdim-fan', 200, 2499, NULL, 1, '127.0.0.1', NULL, NULL),
(7, 1, 6, 7, 'BARSELONA BALL', 'Bayerische Motoren Werke AG, commonly known as Bavarian Motor Works, BMW or BMW AG, is a German automobile, motorcycle and engine manufacturing company founded in 1916. BMW is headquartered in Munich, Bavaria. It also owns and produces Mini cars, and is the parent company of Rolls-Royce Motor Cars', 'barselona-ball', 500, 3000, NULL, 1, '127.0.0.1', NULL, NULL),
(8, 1, 6, 11, 'Another Ball', 'Bayerische Motoren Werke AG, commonly known as Bavarian Motor Works, BMW or BMW AG, is a German automobile, motorcycle and engine manufacturing company founded in 1916. BMW is headquartered in Munich, Bavaria. It also owns and produces Mini cars, and is the parent company of Rolls-Royce Motor Cars', 'another-ball', 200, 4000, 3797, 1, '127.0.0.1', NULL, NULL),
(9, 1, 11, 8, 'RFL table', 'Bayerische Motoren Werke AG, commonly known as Bavarian Motor Works, BMW or BMW AG, is a German automobile, motorcycle and engine manufacturing company founded in 1916. BMW is headquartered in Munich, Bavaria. It also owns and produces Mini cars, and is the parent company of Rolls-Royce Motor Cars', 'rfl-table', 50, 5000, NULL, 1, '127.0.0.1', NULL, NULL),
(10, 1, 7, 11, 'NEW AIRPLAN', 'Bayerische Motoren Werke AG, commonly known as Bavarian Motor Works, BMW or BMW AG, is a German automobile, motorcycle and engine manufacturing company founded in 1916. BMW is headquartered in Munich, Bavaria. It also owns and produces Mini cars, and is the parent company of Rolls-Royce Motor Cars', 'new-airplan', 50, 10000000, NULL, 1, '127.0.0.1', NULL, NULL),
(11, 1, 7, 4, 'DUMDAM Air Plain', 'Bayerische Motoren Werke AG, commonly known as Bavarian Motor Works, BMW or BMW AG, is a German automobile, motorcycle and engine manufacturing company founded in 1916. BMW is headquartered in Munich, Bavaria. It also owns and produces Mini cars, and is the parent company of Rolls-Royce Motor CarsBayerische Motoren Werke AG, commonly known as Bavarian Motor Works, BMW or BMW AG, is a German automobile, motorcycle and engine manufacturing company founded in 1916. BMW is headquartered in Munich, Bavaria. It also owns and produces Mini cars, and is the parent company of Rolls-Royce Motor Cars', 'dumdam-air-plain', 30, 800000, NULL, 1, '127.0.0.1', NULL, NULL),
(12, 1, 10, 12, 'New Cool AC', 'Bayerische Motoren Werke AG, commonly known as Bavarian Motor Works, BMW or BMW AG, is a German automobile, motorcycle and engine manufacturing company founded in 1916. BMW is headquartered in Munich, Bavaria. It also owns and produces Mini cars, and is the parent company of Rolls-Royce Motor CarsBayerische Motoren Werke AG, commonly known as Bavarian Motor Works, BMW or BMW AG, is a German automobile, motorcycle and engine manufacturing company founded in 1916. BMW is headquartered in Munich, Bavaria. It also owns and produces Mini cars, and is the parent company of Rolls-Royce Motor Cars', 'new-cool-ac', 500, 50000, NULL, 1, '127.0.0.1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_brands`
--

CREATE TABLE `product_brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_brands`
--

INSERT INTO `product_brands` (`id`, `name`, `image`, `created_at`, `updated_at`) VALUES
(1, 'dd', 'dd_70422430.png', '2022-01-03 11:33:49', '2022-01-03 11:33:49'),
(2, 'BMW', 'BMW_1753317752.png', '2022-01-04 09:09:39', '2022-01-04 09:09:39'),
(3, 'Samgsang', 'Samgsang_1590275447.jpeg', '2022-01-06 22:22:56', '2022-01-06 22:22:56'),
(4, 'HITACHI', 'HITACHI_1451857813.jpeg', '2022-01-06 22:23:30', '2022-01-06 22:23:30'),
(5, 'Transtec Ac', 'Transtec Ac_523762093.jpeg', '2022-01-06 22:24:22', '2022-01-06 22:24:22'),
(6, 'Riddell', 'Riddell_1420401927.jpeg', '2022-01-06 22:25:36', '2022-01-06 22:25:36'),
(7, 'Adidas Football.', 'Adidas Football._670443198.jpeg', '2022-01-06 22:26:01', '2022-01-06 22:26:01'),
(8, 'Schutt', 'Schutt_1662916776.jpeg', '2022-01-06 22:26:30', '2022-01-06 22:26:30'),
(9, 'Sunwing', 'Sunwing_611168508.jpeg', '2022-01-06 22:27:33', '2022-01-06 22:27:33'),
(10, 'Delta.', 'Delta._694560852.jpeg', '2022-01-06 22:28:03', '2022-01-06 22:28:03'),
(11, 'Usha', 'Usha_1146052270.jpeg', '2022-01-06 22:28:36', '2022-01-06 22:28:36'),
(12, 'Superfan', 'Superfan_308966022.jpeg', '2022-01-06 22:28:55', '2022-01-06 22:28:55'),
(13, 'Khaitan', 'Khaitan_1895468005.jpeg', '2022-01-06 22:29:22', '2022-01-06 22:29:22'),
(14, 'IPhone', 'IPhone_2102575831.jpeg', '2022-01-06 22:30:09', '2022-01-06 22:30:09'),
(15, 'Samsang', 'Samsang_1101239442.jpeg', '2022-01-06 22:30:32', '2022-01-06 22:30:32'),
(16, 'Nokia', 'Nokia_1502183061.jpeg', '2022-01-06 22:30:56', '2022-01-06 22:31:05');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `name`, `image`, `created_at`, `updated_at`) VALUES
(4, 'Mobile', 'Mobile_623483595.jpeg', '2022-01-02 09:09:06', '2022-01-02 09:09:06'),
(5, 'Fan', 'Fan_999357015.jpeg', '2022-01-02 09:12:47', '2022-01-02 09:12:47'),
(6, 'Ball', 'Ball_302872318.jpeg', '2022-01-02 09:14:23', '2022-01-02 09:14:23'),
(7, 'Air plan', 'Air plan_650424940.jpeg', '2022-01-02 09:20:26', '2022-01-02 09:20:26'),
(10, 'AC', 'AC_722705621.jpeg', '2022-01-03 11:05:55', '2022-01-03 11:05:55'),
(11, 'Table', 'Table_183668310.png', '2022-01-03 11:06:20', '2022-01-03 11:06:20'),
(12, 'Carr', 'Car_241774517.png', '2022-01-07 00:27:21', '2022-02-20 10:17:21');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(20) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'bmw-123_598355355.jpeg', '2022-01-09 08:42:59', '2022-01-09 08:42:59'),
(2, 1, 'bmw-123_900453581.jpeg', '2022-01-09 08:42:59', '2022-01-09 08:42:59'),
(3, 2, 'ferarri-215_1018946389.jpeg', '2022-01-09 08:43:55', '2022-01-09 08:43:55'),
(4, 2, 'ferarri-215_980576102.jpeg', '2022-01-09 08:43:55', '2022-01-09 08:43:55'),
(6, 3, 'nokia_1480274586.jpeg', '2022-01-09 08:44:45', '2022-01-09 08:44:45'),
(7, 4, 'iphone_1571099517.jpeg', '2022-01-09 08:45:43', '2022-01-09 08:45:43'),
(8, 4, 'iphone_1083981201.jpeg', '2022-01-09 08:45:43', '2022-01-09 08:45:43'),
(9, 4, 'iphone_1183818828.jpeg', '2022-01-09 08:45:44', '2022-01-09 08:45:44'),
(10, 3, 'nokia_1190867546.jpeg', '2022-01-09 08:45:57', '2022-01-09 08:45:57'),
(11, 5, 'newfan-254_1409315351.jpeg', '2022-01-09 08:46:57', '2022-01-09 08:46:57'),
(12, 5, 'newfan-254_1497734317.jpeg', '2022-01-09 08:46:57', '2022-01-09 08:46:57'),
(13, 6, 'gorrdim-fan_1820878691.jpeg', '2022-01-09 08:48:12', '2022-01-09 08:48:12'),
(14, 6, 'gorrdim-fan_70009234.jpeg', '2022-01-09 08:48:12', '2022-01-09 08:48:12'),
(15, 7, 'barselona-ball_1632013243.jpeg', '2022-01-09 08:49:04', '2022-01-09 08:49:04'),
(16, 7, 'barselona-ball_2125290173.jpeg', '2022-01-09 08:49:04', '2022-01-09 08:49:04'),
(17, 8, 'another-ball_1367298242.jpeg', '2022-01-09 08:50:14', '2022-01-09 08:50:14'),
(18, 8, 'another-ball_858852117.jpeg', '2022-01-09 08:50:14', '2022-01-09 08:50:14'),
(19, 8, 'another-ball_1256694882.jpeg', '2022-01-09 08:50:14', '2022-01-09 08:50:14'),
(20, 9, 'rfl-table_1777462588.jpeg', '2022-01-09 08:51:03', '2022-01-09 08:51:03'),
(21, 9, 'rfl-table_1542318180.png', '2022-01-09 08:51:03', '2022-01-09 08:51:03'),
(22, 10, 'new-airplan_1433122526.jpeg', '2022-01-09 08:51:57', '2022-01-09 08:51:57'),
(23, 10, 'new-airplan_1051744732.jpeg', '2022-01-09 08:51:57', '2022-01-09 08:51:57'),
(24, 11, 'dumdam-air-plain_1746544574.jpeg', '2022-01-09 08:53:05', '2022-01-09 08:53:05'),
(25, 11, 'dumdam-air-plain_644687558.jpeg', '2022-01-09 08:53:05', '2022-01-09 08:53:05'),
(26, 12, 'new-cool-ac_423488510.jpeg', '2022-01-09 08:53:54', '2022-01-09 08:53:54'),
(27, 12, 'new-cool-ac_487878042.jpeg', '2022-01-09 08:53:54', '2022-01-09 08:53:54');

-- --------------------------------------------------------

--
-- Table structure for table `product_statuses`
--

CREATE TABLE `product_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=active,2=deactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_statuses`
--

INSERT INTO `product_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Active', NULL, NULL),
(2, 'Decline', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_cost` int(10) UNSIGNED NOT NULL DEFAULT '100',
  `client_id` int(10) UNSIGNED NOT NULL DEFAULT '2',
  `client_secret` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `email`, `phone`, `address`, `shipping_cost`, `client_id`, `client_secret`, `created_at`, `updated_at`) VALUES
(1, 'n.himel143@gmail.com', '01622819929', 'Dhaka', 100, 2, 'fVXNYS3d9oSEVqDH6O87NvyEANFgyFJnNAZ8rIR9', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prority` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1=actiove,2=deactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `image`, `prority`, `status`, `created_at`, `updated_at`) VALUES
(1, 'This is first slide', '14804376.jpeg', 1, 1, '2022-01-11 09:40:03', '2022-01-11 09:40:03'),
(2, 'Slider Image twoo', '63147603.jpeg', 2, 2, '2022-01-11 11:15:25', '2022-01-11 11:36:56'),
(4, 'Slider Image three', '17037630.jpeg', 3, 1, '2022-01-11 11:17:14', '2022-01-12 09:27:03'),
(5, 'THis is Slider Four', '16522631.jpeg', 4, 1, '2022-01-12 09:27:29', '2022-01-12 09:27:29'),
(6, 'This is slider Five', '86541015.jpeg', 5, 1, '2022-01-12 09:28:43', '2022-01-12 09:28:43'),
(7, 'This is slider siz', '41035462.jpeg', 6, 1, '2022-01-12 09:29:57', '2022-01-12 09:29:57');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Active', '2022-01-09 16:36:44', '2022-01-09 16:36:44'),
(2, 'Decline', '2022-01-09 16:36:44', '2022-01-09 16:36:44');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `secure_login` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userStatusId` int(11) NOT NULL DEFAULT '1' COMMENT '1=active,2=pending,3=successpend',
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `present_address` text COLLATE utf8mb4_unicode_ci,
  `shipping_address` text COLLATE utf8mb4_unicode_ci,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `user_role` int(11) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `secure_login`, `firstname`, `lastname`, `username`, `email`, `password`, `image`, `phone_no`, `userStatusId`, `ip_address`, `present_address`, `shipping_address`, `email_verified_at`, `user_role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'BPvubGrQxq', 'Nuruzzaman', 'Himel', 'himel147', 'nuruzzaman.himel147@gmail.com', '$2y$10$54wAdEF6MYF2wPpoE1oXveAEqcLGiw7SR0Ysysa2T7SMWkBSgwmG6', 'himel.jpg', '01622819929', 1, '192.168.0.1', 'dd', 'dd', NULL, 1, NULL, '2021-12-26 12:23:20', '2022-02-17 12:20:51'),
(3, NULL, 'Nuruzzaman', 'himel', 'Nuruzzaman588', 'himel@gmail.com', '$2y$10$YCEXOIh2YeR9yDgOt1JhwOEpmOikWZHAfyAUNwskT9uYolq3WSkBG', 'Nuruzzaman_407184838.jpeg', '01622819929', 1, '127.0.0.1', 'dhaka', 'dostala, south bonosry,dhaka', NULL, 2, NULL, '2022-01-20 10:53:53', '2022-01-20 10:53:53'),
(4, NULL, 'Nuruzzaman', 'tomal', 'Nuruzzaman140', 'n.himel143@gmail.com', '$2y$10$IXtyyPWN.HBe3PPSziLZ3u3rmZYhq.TNc18pdHDdUlGckm288U22m', 'Nuruzzaman_2095255242.jpeg', '01622819929', 1, '127.0.0.1', 'dhaka', 'south bonosri, dhaka', NULL, 2, NULL, '2022-01-20 17:35:24', '2022-01-30 10:17:02');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', NULL, NULL),
(2, 'User', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_statuses`
--

CREATE TABLE `user_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `paymentmethods`
--
ALTER TABLE `paymentmethods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_brands`
--
ALTER TABLE `product_brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_statuses`
--
ALTER TABLE `product_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_statuses`
--
ALTER TABLE `user_statuses`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `paymentmethods`
--
ALTER TABLE `paymentmethods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_brands`
--
ALTER TABLE `product_brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `product_statuses`
--
ALTER TABLE `product_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_statuses`
--
ALTER TABLE `user_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
