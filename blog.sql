-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2021 at 05:27 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `activations`
--

CREATE TABLE `activations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activations`
--

INSERT INTO `activations` (`id`, `user_id`, `code`, `completed`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'bPH7M9HOZwDRXQFwxkFFdAJDWNZ8QgfZ', 1, '2021-03-14 19:40:35', '2021-03-14 19:40:35', '2021-03-14 19:40:35');

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_at` datetime DEFAULT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clicked` bigint(20) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `name`, `expired_at`, `location`, `key`, `image`, `url`, `clicked`, `order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Panel Ads', '2026-03-15 00:00:00', 'panel-ads', 'UANG7YMCQCAZ', 'banners/1.jpg', 'https://botble.com', 0, 1, 'published', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(2, 'Sidebar Ads', '2026-03-15 00:00:00', 'top-sidebar-ads', 'BOH1QQW2GLGT', 'banners/2.jpg', 'https://botble.com', 0, 2, 'published', '2021-03-14 19:40:40', '2021-03-14 19:40:40');

-- --------------------------------------------------------

--
-- Table structure for table `audit_histories`
--

CREATE TABLE `audit_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_user` int(10) UNSIGNED NOT NULL,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `reference_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audit_histories`
--

INSERT INTO `audit_histories` (`id`, `user_id`, `module`, `request`, `action`, `user_agent`, `ip_address`, `reference_user`, `reference_id`, `reference_name`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 'to the system', NULL, 'logged in', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0', '127.0.0.1', 0, 1, 'Steven Madden', 'info', '2021-06-05 07:25:15', '2021-06-05 07:25:15');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` int(11) NOT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `description`, `status`, `author_id`, `author_type`, `icon`, `order`, `is_featured`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Uncategorized', 0, 'Labore quis dignissimos est eos quos id architecto. Architecto incidunt distinctio maxime nemo aspernatur. Quibusdam fugit sit sit dolorem itaque eos esse.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 1, '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(2, 'Travel', 0, 'Nam quasi aut necessitatibus. Error saepe voluptate iure est et expedita consequatur. Sed vero dolorem corrupti et tempore nihil explicabo.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(3, 'Guides', 2, 'Labore iusto vel magnam sit cupiditate tempora. Sunt dicta voluptates eveniet sit perspiciatis. Ut odit dolores accusantium aliquam ipsum deserunt rerum. Commodi magnam totam quo aspernatur.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(4, 'Destination', 0, 'Doloribus possimus recusandae nisi eum. Occaecati ex nobis at adipisci sint tenetur quo. Commodi tenetur ut labore voluptatem enim ut ut. Nesciunt quia sit quia.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(5, 'Food', 4, 'Facere omnis ad doloremque aut eum. Sint voluptas cum ut iste odit voluptate. Voluptatem provident ut qui neque est quis.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(6, 'Hotels', 0, 'Accusantium explicabo non est sequi. Ut ut ad doloremque ut sit soluta. Laboriosam veniam aliquam quia natus. Voluptas beatae aut voluptas rem voluptate optio.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(7, 'Review', 6, 'Tempora blanditiis sint et consequatur dolor. Amet quia dolore eius saepe. Aut sapiente veritatis esse cum enim quod totam.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(8, 'Healthy', 0, 'Explicabo consequatur quo ut non sit et eaque corrupti. Et quisquam nam quia non quia nihil. Distinctio doloremque saepe ut et repudiandae. Ea sed assumenda perferendis.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(9, 'Lifestyle', 0, 'Laboriosam reiciendis placeat voluptatem tempora quia labore nesciunt voluptatem. Et impedit minima dolor. Voluptatem vero iste odio aliquid dolorem similique.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(10, 'Kh??ng ph??n lo???i', 0, 'Impedit nihil et minus distinctio. Possimus ad voluptate in sint quia quaerat. Eos omnis ut voluptatibus.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 1, '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(11, 'Du l???ch', 0, 'In et sit neque at qui consectetur voluptatibus. Sit voluptas vel voluptatem quia magnam accusantium. Ut est voluptas id sed debitis id. Ducimus corrupti ut ut ex aut excepturi rerum.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(12, 'H?????ng d???n', 11, 'Ex eaque sed fugit voluptatem non aut. Odio et non veritatis et voluptas explicabo. Et et optio voluptatem. Et amet soluta ratione quia qui fuga.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(13, '??i???m ?????n', 0, 'Aliquid deserunt dolorum a neque natus recusandae nihil. Quibusdam ut officiis consectetur id eaque sed tempore. Harum velit ad optio laboriosam architecto quos quidem. Voluptatem ad qui dolor.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(14, '????? ??n', 13, 'Ea ex rerum distinctio recusandae. Pariatur voluptatem dolorum veritatis maxime.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(15, 'Kh??ch s???n', 0, 'Labore aspernatur est autem sunt magnam sint totam. Nam omnis eveniet necessitatibus aut quia sit consectetur. Sit sapiente ut soluta.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(16, '????nh gi??', 15, 'Aliquid eligendi corporis quo ut. Et illo blanditiis minus aut optio dolor voluptas temporibus. Ea est est officiis incidunt. Et enim eos hic modi.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(17, 'S???c kh???e', 0, 'Impedit tenetur quibusdam et aliquid. Minus ea dolorum quasi. Est voluptatum repellendus quisquam placeat corrupti sit. Blanditiis aut non qui unde perspiciatis modi repellendus perferendis.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(18, 'Phong c??ch s???ng', 0, 'Quod ullam deserunt occaecati itaque officiis aut. Enim odit unde ut quidem suscipit quas. Similique alias quae quas repudiandae.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2021-03-14 19:40:38', '2021-03-14 19:40:38');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `address`, `subject`, `content`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Prof. Marshall Hayes', 'ehahn@example.org', '1-963-203-3366', '1783 Satterfield Mission Suite 458\nHowellmouth, NC 25919', 'Iure earum illo perferendis sit unde aut.', 'Animi ratione sed rerum velit natus. Repellat minima iste beatae soluta et quo magni. Atque et non quia omnis aspernatur. Quo veniam et dignissimos nesciunt. Voluptatem facilis eius incidunt laboriosam. Consequatur consectetur et placeat fugit perspiciatis. Nesciunt quisquam qui dolores ipsam. Qui doloremque rerum iste inventore debitis illo est. Cupiditate molestias culpa eaque consequatur aliquam.', 'read', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(2, 'Kenya Lemke', 'freida.kunde@example.com', '(757) 963-7830', '82941 Keyon Stravenue\nMillsfort, OK 69495-4355', 'Error numquam autem labore ut modi.', 'Corrupti alias pariatur repellendus quasi dolor possimus est labore. Explicabo recusandae reprehenderit a repellendus. Nisi voluptas suscipit ut ut corporis non. Sunt et asperiores placeat ratione placeat. Aliquid impedit vel placeat et. Natus culpa illum qui corrupti ad. Debitis quia et accusamus. Placeat sed nihil commodi incidunt omnis qui. Autem rerum eum nulla voluptatem.', 'unread', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(3, 'Miss Brandy Senger', 'leopoldo.hahn@example.net', '337.722.3178', '47826 Brennan Ferry Suite 308\nVestaburgh, TN 13109', 'Numquam quam ducimus illo qui mollitia.', 'Et minima non ut adipisci. Voluptas earum nostrum et dicta doloribus. Ipsa quam reiciendis iusto dolor. Ex nesciunt corrupti vel nobis nulla. Ea non minus ut voluptatem. Quaerat eum et dolor nostrum et. Et enim deleniti totam et voluptates quaerat. Unde veritatis delectus iste optio repellendus esse. Fugiat est quia commodi eius aut distinctio laboriosam. Rerum voluptates quis dolorum quidem. Quidem omnis nihil provident laborum ut accusamus.', 'unread', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(4, 'Alex Veum', 'enid24@example.net', '(995) 353-9078', '334 Schroeder Crossroad Apt. 281\nNew Antone, OH 37299', 'Necessitatibus rem quis quos et itaque quaerat.', 'Eum id perferendis rem atque laboriosam porro. Harum repellendus sed sit molestias dolor possimus autem. Est et ea consectetur eveniet nihil. Molestiae est quia corrupti suscipit natus omnis ipsam. Eaque recusandae quis aperiam laborum et non nesciunt. Molestias officiis cupiditate eaque dolor eum. Minima ex nisi perferendis sit inventore omnis voluptatibus.', 'unread', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(5, 'Vivian Purdy', 'qoconner@example.com', '+16528104497', '6545 Hartmann Fork\nRafaelaport, MN 39120', 'Excepturi magni et et. Eos et nihil quia sint.', 'Excepturi libero est quo perferendis velit ut. Asperiores quasi ipsa aut labore. Voluptatum dolorem beatae dolorem omnis debitis dolores doloribus. Vero minima recusandae dolor voluptate voluptatibus molestiae voluptates quia. Quidem ea sit numquam est consequuntur quia excepturi. Et optio est dolor sed corporis non libero. Iste pariatur quidem rerum culpa. Rem saepe omnis accusantium ipsam rerum molestiae. Fugit rerum sint optio qui harum rerum.', 'unread', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(6, 'Matilda Sanford', 'mcglynn.domenic@example.com', '490-204-7585', '825 Rigoberto Canyon\nReillyhaven, WA 95847', 'Qui doloremque laboriosam consectetur eos vel.', 'Ea quia officia odio aut fugit odit eum. Itaque iure nihil ullam iusto aliquam deleniti assumenda. Similique sed sit illo sed. Iusto quo cupiditate corrupti tenetur consectetur consectetur qui. Sit tenetur facilis et ea. Ea cumque temporibus tenetur rem ad tempore. Quae rerum ex illo alias molestiae. Expedita voluptatibus magnam sit placeat.', 'read', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(7, 'Kendra Barrows', 'ivah.witting@example.com', '525-932-8787', '277 Hintz Plain Apt. 756\nSpencerborough, MA 75676-7284', 'Assumenda est quod beatae dolore voluptas et.', 'Facere et qui ut dicta. Aliquam incidunt eius maxime. Laboriosam ad suscipit sed eveniet nesciunt ipsam nesciunt similique. A voluptatem amet ipsam et tempora. Sit recusandae atque earum et ratione labore fuga. Et quas et explicabo a. Ut rerum natus accusantium voluptatem sed qui doloribus. Assumenda sit natus tenetur.', 'unread', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(8, 'Prof. Torey Howe', 'tad.powlowski@example.com', '(404) 851-6468', '250 Hane Hollow Suite 481\nLake Darion, LA 40039', 'Perspiciatis rerum officia libero alias.', 'Consequatur ea vel quia alias qui. Totam vel rerum voluptatem error voluptatem distinctio quae. Eligendi eius pariatur qui neque temporibus provident. Dolore quae voluptatem veniam. Aspernatur ab omnis sunt optio aut laboriosam doloribus. Dolores aut repudiandae sed facilis voluptatibus sunt dolor. Facere iste tempora amet eligendi qui. Magni doloribus omnis reprehenderit maxime doloremque. Consectetur id nesciunt incidunt occaecati nisi non. Qui possimus minima harum qui voluptatem velit.', 'read', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(9, 'Elenor Lynch', 'cheyanne84@example.net', '+1-868-646-4461', '898 Baby Mission\nIsabelfort, WI 01335', 'Nulla fugiat odit non ullam est.', 'Quis quia praesentium et eos iusto. Voluptates id et iure nihil nulla. Quo consequatur ut unde magnam ut fuga et. Repellendus voluptatibus qui voluptatem sint. Illum ullam quisquam placeat fuga porro atque maiores. Et necessitatibus perspiciatis velit ab amet assumenda vero. Sequi ut atque fugiat laboriosam. Aspernatur dolores autem qui tempore quis quo. Quasi sed quaerat est ab quas veniam.', 'read', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(10, 'Magali Flatley', 'vernon.abernathy@example.org', '+1-921-313-1337', '8899 Dickinson Mount\nRowefurt, MN 23596-9215', 'Quia adipisci perspiciatis at aut quo.', 'Ipsam odio dignissimos autem voluptas. Ea odit et voluptate doloremque aperiam. Minus nihil nisi vel modi asperiores. Ab eius corrupti ad enim quas accusantium accusamus. Natus sed eveniet eveniet quasi nobis. Ipsa non ipsa distinctio et doloribus et facilis. Labore qui repudiandae adipisci repellendus.', 'unread', '2021-03-14 19:40:35', '2021-03-14 19:40:35');

-- --------------------------------------------------------

--
-- Table structure for table `contact_replies`
--

CREATE TABLE `contact_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_widgets`
--

CREATE TABLE `dashboard_widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dashboard_widgets`
--

INSERT INTO `dashboard_widgets` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'widget_total_themes', '2021-06-05 07:25:15', '2021-06-05 07:25:15'),
(2, 'widget_total_users', '2021-06-05 07:25:15', '2021-06-05 07:25:15'),
(3, 'widget_total_pages', '2021-06-05 07:25:15', '2021-06-05 07:25:15'),
(4, 'widget_total_plugins', '2021-06-05 07:25:15', '2021-06-05 07:25:15'),
(5, 'widget_analytics_general', '2021-06-05 07:25:15', '2021-06-05 07:25:15'),
(6, 'widget_analytics_page', '2021-06-05 07:25:15', '2021-06-05 07:25:15'),
(7, 'widget_analytics_browser', '2021-06-05 07:25:15', '2021-06-05 07:25:15'),
(8, 'widget_posts_recent', '2021-06-05 07:25:15', '2021-06-05 07:25:15'),
(9, 'widget_analytics_referrer', '2021-06-05 07:25:15', '2021-06-05 07:25:15'),
(10, 'widget_audit_logs', '2021-06-05 07:25:15', '2021-06-05 07:25:15');

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_widget_settings`
--

CREATE TABLE `dashboard_widget_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `widget_id` int(10) UNSIGNED NOT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `name`, `description`, `is_featured`, `order`, `image`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Perfect', 'Molestiae facere aut consequatur nostrum illum officiis enim. Quo placeat qui quo voluptatem dicta. Occaecati nihil incidunt laboriosam sit dolorem.', 1, 0, 'galleries/1.jpg', 1, 'published', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(2, 'New Day', 'Dolorum laborum magnam eius. Sed earum quam accusantium aut et debitis nostrum quod. Possimus consequatur velit deserunt error.', 1, 0, 'galleries/2.jpg', 1, 'published', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(3, 'Happy Day', 'Rerum quos culpa officia corrupti est qui. Quam ea unde eum ut dolor. Ut consequatur sint corrupti quis voluptatem.', 1, 0, 'galleries/3.jpg', 1, 'published', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(4, 'Nature', 'Aut ut consequatur consequatur error nihil. Sed et quidem voluptatem. Voluptatem perspiciatis quas rerum dolores cumque.', 1, 0, 'galleries/4.jpg', 1, 'published', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(5, 'Morning', 'Adipisci hic magni voluptatem cum dolores. Ut tempore sunt est et. Labore numquam quod non repudiandae dignissimos.', 1, 0, 'galleries/5.jpg', 1, 'published', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(6, 'Photography', 'Aut voluptatibus omnis omnis eaque tenetur. Nam dignissimos hic vero. Est mollitia repellendus quia impedit voluptas id aperiam.', 1, 0, 'galleries/6.jpg', 1, 'published', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(7, 'Ho??n h???o', 'Ullam qui voluptatem aut. Natus itaque et aperiam quis dolores velit. Labore atque et quia et a.', 1, 0, 'galleries/1.jpg', 1, 'published', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(8, 'Ng??y m???i', 'Et maxime distinctio quo magni recusandae aliquam. Est aut qui quaerat earum nemo rerum vitae. Quaerat ipsa doloremque dolores iusto quis magnam.', 1, 0, 'galleries/2.jpg', 1, 'published', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(9, 'Ng??y h???nh ph??c', 'Exercitationem voluptas omnis porro unde incidunt facilis. Facilis non ducimus sint ut. Modi hic qui dolorem quia maiores.', 1, 0, 'galleries/3.jpg', 1, 'published', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(10, 'Thi??n nhi??n', 'Nihil iusto facilis eius tempora commodi nam. Ea est ab et est libero. Nemo tenetur in nesciunt voluptas repellendus et itaque.', 1, 0, 'galleries/4.jpg', 1, 'published', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(11, 'Bu???i s??ng', 'Et quos hic est officia. Assumenda quibusdam eius aperiam blanditiis qui quia accusantium. Veritatis quia possimus et aut quasi.', 1, 0, 'galleries/5.jpg', 1, 'published', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(12, 'Ngh??? thu???t', 'Quia dolorem non deleniti fuga. Labore et sed vel veniam. Molestias et repudiandae esse sit.', 1, 0, 'galleries/6.jpg', 1, 'published', '2021-03-14 19:40:40', '2021-03-14 19:40:40');

-- --------------------------------------------------------

--
-- Table structure for table `gallery_meta`
--

CREATE TABLE `gallery_meta` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gallery_meta`
--

INSERT INTO `gallery_meta` (`id`, `images`, `reference_id`, `reference_type`, `created_at`, `updated_at`) VALUES
(1, '[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Adipisci modi ab qui quidem illo ex. Quis voluptatem qui perspiciatis autem. Aperiam assumenda quia error eveniet. Eum rem possimus sed.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Temporibus odit asperiores est non culpa. Est adipisci quis qui sint ut. Aut molestiae officia dolores est.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Velit sint quia ipsa dolores eum nemo rerum. Numquam sed aliquid maiores quia. Maiores consequatur qui velit aut omnis eligendi qui.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Est explicabo cum vitae nemo. Molestiae consectetur dicta voluptas labore vero magnam aut. Aut consequatur totam officiis mollitia.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Id voluptas perspiciatis voluptas voluptate omnis ipsam. Ut temporibus eos aliquid et iste sint aut nihil. Esse ea aperiam qui.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Qui vero magni rerum. Et sint veritatis ut error dolore eaque. Est in asperiores perferendis consequuntur in quis et.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Aut pariatur aspernatur eligendi error dignissimos et. Consequatur ut provident non natus. Et pariatur sit impedit aliquam.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Qui et commodi aperiam aut unde. Velit ipsa suscipit asperiores. Quam explicabo repellendus nesciunt non.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Assumenda et voluptatum qui aut. Eum harum labore iste dolorem. Excepturi vel id dicta veritatis corrupti quia. Dolorem sed dolor ducimus.\"}]', 1, 'Botble\\Gallery\\Models\\Gallery', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(2, '[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Adipisci modi ab qui quidem illo ex. Quis voluptatem qui perspiciatis autem. Aperiam assumenda quia error eveniet. Eum rem possimus sed.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Temporibus odit asperiores est non culpa. Est adipisci quis qui sint ut. Aut molestiae officia dolores est.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Velit sint quia ipsa dolores eum nemo rerum. Numquam sed aliquid maiores quia. Maiores consequatur qui velit aut omnis eligendi qui.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Est explicabo cum vitae nemo. Molestiae consectetur dicta voluptas labore vero magnam aut. Aut consequatur totam officiis mollitia.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Id voluptas perspiciatis voluptas voluptate omnis ipsam. Ut temporibus eos aliquid et iste sint aut nihil. Esse ea aperiam qui.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Qui vero magni rerum. Et sint veritatis ut error dolore eaque. Est in asperiores perferendis consequuntur in quis et.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Aut pariatur aspernatur eligendi error dignissimos et. Consequatur ut provident non natus. Et pariatur sit impedit aliquam.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Qui et commodi aperiam aut unde. Velit ipsa suscipit asperiores. Quam explicabo repellendus nesciunt non.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Assumenda et voluptatum qui aut. Eum harum labore iste dolorem. Excepturi vel id dicta veritatis corrupti quia. Dolorem sed dolor ducimus.\"}]', 2, 'Botble\\Gallery\\Models\\Gallery', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(3, '[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Adipisci modi ab qui quidem illo ex. Quis voluptatem qui perspiciatis autem. Aperiam assumenda quia error eveniet. Eum rem possimus sed.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Temporibus odit asperiores est non culpa. Est adipisci quis qui sint ut. Aut molestiae officia dolores est.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Velit sint quia ipsa dolores eum nemo rerum. Numquam sed aliquid maiores quia. Maiores consequatur qui velit aut omnis eligendi qui.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Est explicabo cum vitae nemo. Molestiae consectetur dicta voluptas labore vero magnam aut. Aut consequatur totam officiis mollitia.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Id voluptas perspiciatis voluptas voluptate omnis ipsam. Ut temporibus eos aliquid et iste sint aut nihil. Esse ea aperiam qui.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Qui vero magni rerum. Et sint veritatis ut error dolore eaque. Est in asperiores perferendis consequuntur in quis et.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Aut pariatur aspernatur eligendi error dignissimos et. Consequatur ut provident non natus. Et pariatur sit impedit aliquam.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Qui et commodi aperiam aut unde. Velit ipsa suscipit asperiores. Quam explicabo repellendus nesciunt non.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Assumenda et voluptatum qui aut. Eum harum labore iste dolorem. Excepturi vel id dicta veritatis corrupti quia. Dolorem sed dolor ducimus.\"}]', 3, 'Botble\\Gallery\\Models\\Gallery', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(4, '[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Adipisci modi ab qui quidem illo ex. Quis voluptatem qui perspiciatis autem. Aperiam assumenda quia error eveniet. Eum rem possimus sed.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Temporibus odit asperiores est non culpa. Est adipisci quis qui sint ut. Aut molestiae officia dolores est.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Velit sint quia ipsa dolores eum nemo rerum. Numquam sed aliquid maiores quia. Maiores consequatur qui velit aut omnis eligendi qui.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Est explicabo cum vitae nemo. Molestiae consectetur dicta voluptas labore vero magnam aut. Aut consequatur totam officiis mollitia.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Id voluptas perspiciatis voluptas voluptate omnis ipsam. Ut temporibus eos aliquid et iste sint aut nihil. Esse ea aperiam qui.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Qui vero magni rerum. Et sint veritatis ut error dolore eaque. Est in asperiores perferendis consequuntur in quis et.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Aut pariatur aspernatur eligendi error dignissimos et. Consequatur ut provident non natus. Et pariatur sit impedit aliquam.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Qui et commodi aperiam aut unde. Velit ipsa suscipit asperiores. Quam explicabo repellendus nesciunt non.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Assumenda et voluptatum qui aut. Eum harum labore iste dolorem. Excepturi vel id dicta veritatis corrupti quia. Dolorem sed dolor ducimus.\"}]', 4, 'Botble\\Gallery\\Models\\Gallery', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(5, '[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Adipisci modi ab qui quidem illo ex. Quis voluptatem qui perspiciatis autem. Aperiam assumenda quia error eveniet. Eum rem possimus sed.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Temporibus odit asperiores est non culpa. Est adipisci quis qui sint ut. Aut molestiae officia dolores est.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Velit sint quia ipsa dolores eum nemo rerum. Numquam sed aliquid maiores quia. Maiores consequatur qui velit aut omnis eligendi qui.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Est explicabo cum vitae nemo. Molestiae consectetur dicta voluptas labore vero magnam aut. Aut consequatur totam officiis mollitia.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Id voluptas perspiciatis voluptas voluptate omnis ipsam. Ut temporibus eos aliquid et iste sint aut nihil. Esse ea aperiam qui.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Qui vero magni rerum. Et sint veritatis ut error dolore eaque. Est in asperiores perferendis consequuntur in quis et.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Aut pariatur aspernatur eligendi error dignissimos et. Consequatur ut provident non natus. Et pariatur sit impedit aliquam.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Qui et commodi aperiam aut unde. Velit ipsa suscipit asperiores. Quam explicabo repellendus nesciunt non.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Assumenda et voluptatum qui aut. Eum harum labore iste dolorem. Excepturi vel id dicta veritatis corrupti quia. Dolorem sed dolor ducimus.\"}]', 5, 'Botble\\Gallery\\Models\\Gallery', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(6, '[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Adipisci modi ab qui quidem illo ex. Quis voluptatem qui perspiciatis autem. Aperiam assumenda quia error eveniet. Eum rem possimus sed.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Temporibus odit asperiores est non culpa. Est adipisci quis qui sint ut. Aut molestiae officia dolores est.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Velit sint quia ipsa dolores eum nemo rerum. Numquam sed aliquid maiores quia. Maiores consequatur qui velit aut omnis eligendi qui.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Est explicabo cum vitae nemo. Molestiae consectetur dicta voluptas labore vero magnam aut. Aut consequatur totam officiis mollitia.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Id voluptas perspiciatis voluptas voluptate omnis ipsam. Ut temporibus eos aliquid et iste sint aut nihil. Esse ea aperiam qui.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Qui vero magni rerum. Et sint veritatis ut error dolore eaque. Est in asperiores perferendis consequuntur in quis et.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Aut pariatur aspernatur eligendi error dignissimos et. Consequatur ut provident non natus. Et pariatur sit impedit aliquam.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Qui et commodi aperiam aut unde. Velit ipsa suscipit asperiores. Quam explicabo repellendus nesciunt non.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Assumenda et voluptatum qui aut. Eum harum labore iste dolorem. Excepturi vel id dicta veritatis corrupti quia. Dolorem sed dolor ducimus.\"}]', 6, 'Botble\\Gallery\\Models\\Gallery', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(7, '[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Adipisci modi ab qui quidem illo ex. Quis voluptatem qui perspiciatis autem. Aperiam assumenda quia error eveniet. Eum rem possimus sed.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Temporibus odit asperiores est non culpa. Est adipisci quis qui sint ut. Aut molestiae officia dolores est.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Velit sint quia ipsa dolores eum nemo rerum. Numquam sed aliquid maiores quia. Maiores consequatur qui velit aut omnis eligendi qui.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Est explicabo cum vitae nemo. Molestiae consectetur dicta voluptas labore vero magnam aut. Aut consequatur totam officiis mollitia.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Id voluptas perspiciatis voluptas voluptate omnis ipsam. Ut temporibus eos aliquid et iste sint aut nihil. Esse ea aperiam qui.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Qui vero magni rerum. Et sint veritatis ut error dolore eaque. Est in asperiores perferendis consequuntur in quis et.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Aut pariatur aspernatur eligendi error dignissimos et. Consequatur ut provident non natus. Et pariatur sit impedit aliquam.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Qui et commodi aperiam aut unde. Velit ipsa suscipit asperiores. Quam explicabo repellendus nesciunt non.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Assumenda et voluptatum qui aut. Eum harum labore iste dolorem. Excepturi vel id dicta veritatis corrupti quia. Dolorem sed dolor ducimus.\"}]', 7, 'Botble\\Gallery\\Models\\Gallery', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(8, '[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Adipisci modi ab qui quidem illo ex. Quis voluptatem qui perspiciatis autem. Aperiam assumenda quia error eveniet. Eum rem possimus sed.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Temporibus odit asperiores est non culpa. Est adipisci quis qui sint ut. Aut molestiae officia dolores est.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Velit sint quia ipsa dolores eum nemo rerum. Numquam sed aliquid maiores quia. Maiores consequatur qui velit aut omnis eligendi qui.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Est explicabo cum vitae nemo. Molestiae consectetur dicta voluptas labore vero magnam aut. Aut consequatur totam officiis mollitia.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Id voluptas perspiciatis voluptas voluptate omnis ipsam. Ut temporibus eos aliquid et iste sint aut nihil. Esse ea aperiam qui.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Qui vero magni rerum. Et sint veritatis ut error dolore eaque. Est in asperiores perferendis consequuntur in quis et.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Aut pariatur aspernatur eligendi error dignissimos et. Consequatur ut provident non natus. Et pariatur sit impedit aliquam.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Qui et commodi aperiam aut unde. Velit ipsa suscipit asperiores. Quam explicabo repellendus nesciunt non.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Assumenda et voluptatum qui aut. Eum harum labore iste dolorem. Excepturi vel id dicta veritatis corrupti quia. Dolorem sed dolor ducimus.\"}]', 8, 'Botble\\Gallery\\Models\\Gallery', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(9, '[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Adipisci modi ab qui quidem illo ex. Quis voluptatem qui perspiciatis autem. Aperiam assumenda quia error eveniet. Eum rem possimus sed.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Temporibus odit asperiores est non culpa. Est adipisci quis qui sint ut. Aut molestiae officia dolores est.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Velit sint quia ipsa dolores eum nemo rerum. Numquam sed aliquid maiores quia. Maiores consequatur qui velit aut omnis eligendi qui.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Est explicabo cum vitae nemo. Molestiae consectetur dicta voluptas labore vero magnam aut. Aut consequatur totam officiis mollitia.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Id voluptas perspiciatis voluptas voluptate omnis ipsam. Ut temporibus eos aliquid et iste sint aut nihil. Esse ea aperiam qui.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Qui vero magni rerum. Et sint veritatis ut error dolore eaque. Est in asperiores perferendis consequuntur in quis et.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Aut pariatur aspernatur eligendi error dignissimos et. Consequatur ut provident non natus. Et pariatur sit impedit aliquam.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Qui et commodi aperiam aut unde. Velit ipsa suscipit asperiores. Quam explicabo repellendus nesciunt non.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Assumenda et voluptatum qui aut. Eum harum labore iste dolorem. Excepturi vel id dicta veritatis corrupti quia. Dolorem sed dolor ducimus.\"}]', 9, 'Botble\\Gallery\\Models\\Gallery', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(10, '[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Adipisci modi ab qui quidem illo ex. Quis voluptatem qui perspiciatis autem. Aperiam assumenda quia error eveniet. Eum rem possimus sed.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Temporibus odit asperiores est non culpa. Est adipisci quis qui sint ut. Aut molestiae officia dolores est.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Velit sint quia ipsa dolores eum nemo rerum. Numquam sed aliquid maiores quia. Maiores consequatur qui velit aut omnis eligendi qui.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Est explicabo cum vitae nemo. Molestiae consectetur dicta voluptas labore vero magnam aut. Aut consequatur totam officiis mollitia.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Id voluptas perspiciatis voluptas voluptate omnis ipsam. Ut temporibus eos aliquid et iste sint aut nihil. Esse ea aperiam qui.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Qui vero magni rerum. Et sint veritatis ut error dolore eaque. Est in asperiores perferendis consequuntur in quis et.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Aut pariatur aspernatur eligendi error dignissimos et. Consequatur ut provident non natus. Et pariatur sit impedit aliquam.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Qui et commodi aperiam aut unde. Velit ipsa suscipit asperiores. Quam explicabo repellendus nesciunt non.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Assumenda et voluptatum qui aut. Eum harum labore iste dolorem. Excepturi vel id dicta veritatis corrupti quia. Dolorem sed dolor ducimus.\"}]', 10, 'Botble\\Gallery\\Models\\Gallery', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(11, '[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Adipisci modi ab qui quidem illo ex. Quis voluptatem qui perspiciatis autem. Aperiam assumenda quia error eveniet. Eum rem possimus sed.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Temporibus odit asperiores est non culpa. Est adipisci quis qui sint ut. Aut molestiae officia dolores est.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Velit sint quia ipsa dolores eum nemo rerum. Numquam sed aliquid maiores quia. Maiores consequatur qui velit aut omnis eligendi qui.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Est explicabo cum vitae nemo. Molestiae consectetur dicta voluptas labore vero magnam aut. Aut consequatur totam officiis mollitia.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Id voluptas perspiciatis voluptas voluptate omnis ipsam. Ut temporibus eos aliquid et iste sint aut nihil. Esse ea aperiam qui.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Qui vero magni rerum. Et sint veritatis ut error dolore eaque. Est in asperiores perferendis consequuntur in quis et.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Aut pariatur aspernatur eligendi error dignissimos et. Consequatur ut provident non natus. Et pariatur sit impedit aliquam.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Qui et commodi aperiam aut unde. Velit ipsa suscipit asperiores. Quam explicabo repellendus nesciunt non.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Assumenda et voluptatum qui aut. Eum harum labore iste dolorem. Excepturi vel id dicta veritatis corrupti quia. Dolorem sed dolor ducimus.\"}]', 11, 'Botble\\Gallery\\Models\\Gallery', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(12, '[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Adipisci modi ab qui quidem illo ex. Quis voluptatem qui perspiciatis autem. Aperiam assumenda quia error eveniet. Eum rem possimus sed.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Temporibus odit asperiores est non culpa. Est adipisci quis qui sint ut. Aut molestiae officia dolores est.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Velit sint quia ipsa dolores eum nemo rerum. Numquam sed aliquid maiores quia. Maiores consequatur qui velit aut omnis eligendi qui.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Est explicabo cum vitae nemo. Molestiae consectetur dicta voluptas labore vero magnam aut. Aut consequatur totam officiis mollitia.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Id voluptas perspiciatis voluptas voluptate omnis ipsam. Ut temporibus eos aliquid et iste sint aut nihil. Esse ea aperiam qui.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Qui vero magni rerum. Et sint veritatis ut error dolore eaque. Est in asperiores perferendis consequuntur in quis et.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Aut pariatur aspernatur eligendi error dignissimos et. Consequatur ut provident non natus. Et pariatur sit impedit aliquam.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Qui et commodi aperiam aut unde. Velit ipsa suscipit asperiores. Quam explicabo repellendus nesciunt non.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Assumenda et voluptatum qui aut. Eum harum labore iste dolorem. Excepturi vel id dicta veritatis corrupti quia. Dolorem sed dolor ducimus.\"}]', 12, 'Botble\\Gallery\\Models\\Gallery', '2021-03-14 19:40:40', '2021-03-14 19:40:40');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `lang_id` int(10) UNSIGNED NOT NULL,
  `lang_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `lang_order` int(11) NOT NULL DEFAULT 0,
  `lang_is_rtl` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`lang_id`, `lang_name`, `lang_locale`, `lang_code`, `lang_flag`, `lang_is_default`, `lang_order`, `lang_is_rtl`) VALUES
(1, 'English', 'en', 'en_US', 'us', 1, 0, 0),
(2, 'Ti???ng Vi???t', 'vi', 'vi', 'vn', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `language_meta`
--

CREATE TABLE `language_meta` (
  `lang_meta_id` int(10) UNSIGNED NOT NULL,
  `lang_meta_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_meta_origin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `language_meta`
--

INSERT INTO `language_meta` (`lang_meta_id`, `lang_meta_code`, `lang_meta_origin`, `reference_id`, `reference_type`) VALUES
(1, 'en_US', 'a2a2d9da31bdf0376fe7ce3f40b4f963', 1, 'Botble\\Page\\Models\\Page'),
(2, 'en_US', '4ee945e372bd39ea6337a0b930b39e3e', 2, 'Botble\\Page\\Models\\Page'),
(3, 'en_US', '94fb8b18eed50e1344122c67eb6da2e1', 3, 'Botble\\Page\\Models\\Page'),
(4, 'en_US', 'd02fe92a47b5d01faf0042d30c393017', 4, 'Botble\\Page\\Models\\Page'),
(5, 'en_US', '538ed5418f0853de6522109f4b98a0dd', 5, 'Botble\\Page\\Models\\Page'),
(6, 'en_US', '1b4ea56464d4fcd2869e3c65c5380326', 6, 'Botble\\Page\\Models\\Page'),
(7, 'en_US', 'fc8210fd3999797848a960d6def56389', 7, 'Botble\\Page\\Models\\Page'),
(8, 'en_US', '8e0d149bea76314beb5842ae2e5d5dcc', 8, 'Botble\\Page\\Models\\Page'),
(9, 'vi', 'a2a2d9da31bdf0376fe7ce3f40b4f963', 9, 'Botble\\Page\\Models\\Page'),
(10, 'vi', '4ee945e372bd39ea6337a0b930b39e3e', 10, 'Botble\\Page\\Models\\Page'),
(11, 'vi', '94fb8b18eed50e1344122c67eb6da2e1', 11, 'Botble\\Page\\Models\\Page'),
(12, 'vi', 'd02fe92a47b5d01faf0042d30c393017', 12, 'Botble\\Page\\Models\\Page'),
(13, 'vi', '538ed5418f0853de6522109f4b98a0dd', 13, 'Botble\\Page\\Models\\Page'),
(14, 'vi', '1b4ea56464d4fcd2869e3c65c5380326', 14, 'Botble\\Page\\Models\\Page'),
(15, 'vi', 'fc8210fd3999797848a960d6def56389', 15, 'Botble\\Page\\Models\\Page'),
(16, 'vi', '8e0d149bea76314beb5842ae2e5d5dcc', 16, 'Botble\\Page\\Models\\Page'),
(17, 'en_US', 'e0b6b935207d9452f356ad2752e603f7', 1, 'Botble\\Menu\\Models\\MenuLocation'),
(18, 'en_US', '3108a07e32b93b9f485fc2c2339ac787', 1, 'Botble\\Menu\\Models\\Menu'),
(19, 'en_US', 'cc70578ad466fbc4499e21e8fe0567f1', 2, 'Botble\\Menu\\Models\\Menu'),
(20, 'vi', '178a09f7a2858975c440ab999268e183', 2, 'Botble\\Menu\\Models\\MenuLocation'),
(21, 'vi', '3108a07e32b93b9f485fc2c2339ac787', 3, 'Botble\\Menu\\Models\\Menu'),
(22, 'vi', 'e08aaced926ed7b56bdc1bce1708c2ae', 3, 'Botble\\Menu\\Models\\MenuLocation'),
(23, 'vi', 'cc70578ad466fbc4499e21e8fe0567f1', 4, 'Botble\\Menu\\Models\\Menu'),
(24, 'vi', '3108a07e32b93b9f485fc2c2339ac787', 5, 'Botble\\Menu\\Models\\Menu'),
(25, 'en_US', 'ea9fe885e75e2244fcda1c5d28f0f0cb', 1, 'Botble\\Blog\\Models\\Category'),
(26, 'en_US', 'f2c4907d7efcf4ae6d1ebe33c9897694', 2, 'Botble\\Blog\\Models\\Category'),
(27, 'en_US', '449cd2429e3e871c32dc540b699b1859', 3, 'Botble\\Blog\\Models\\Category'),
(28, 'en_US', '06965e8b6299a6a124064a28e7bbd3aa', 4, 'Botble\\Blog\\Models\\Category'),
(29, 'en_US', '26064165afb15a112de8556d0f3b03f0', 5, 'Botble\\Blog\\Models\\Category'),
(30, 'en_US', 'acb5d8fcb589bf65df1eb32b7b2967d7', 6, 'Botble\\Blog\\Models\\Category'),
(31, 'en_US', '318ece1879c331a92438465826562d71', 7, 'Botble\\Blog\\Models\\Category'),
(32, 'en_US', 'e7b7112c657cb62bea1662937a035136', 8, 'Botble\\Blog\\Models\\Category'),
(33, 'en_US', '43fc6ba00af86874c4adfa44b264cc40', 9, 'Botble\\Blog\\Models\\Category'),
(34, 'vi', 'ea9fe885e75e2244fcda1c5d28f0f0cb', 10, 'Botble\\Blog\\Models\\Category'),
(35, 'vi', 'f2c4907d7efcf4ae6d1ebe33c9897694', 11, 'Botble\\Blog\\Models\\Category'),
(36, 'vi', 'f2c4907d7efcf4ae6d1ebe33c9897694', 12, 'Botble\\Blog\\Models\\Category'),
(37, 'vi', '449cd2429e3e871c32dc540b699b1859', 13, 'Botble\\Blog\\Models\\Category'),
(38, 'vi', '449cd2429e3e871c32dc540b699b1859', 14, 'Botble\\Blog\\Models\\Category'),
(39, 'vi', '06965e8b6299a6a124064a28e7bbd3aa', 15, 'Botble\\Blog\\Models\\Category'),
(40, 'vi', '06965e8b6299a6a124064a28e7bbd3aa', 16, 'Botble\\Blog\\Models\\Category'),
(41, 'vi', '26064165afb15a112de8556d0f3b03f0', 17, 'Botble\\Blog\\Models\\Category'),
(42, 'vi', 'acb5d8fcb589bf65df1eb32b7b2967d7', 18, 'Botble\\Blog\\Models\\Category'),
(43, 'en_US', '307b8463c9febc7f4500f26065a9c175', 1, 'Botble\\Blog\\Models\\Tag'),
(44, 'en_US', 'c8a1e7fa350c3e8a6bde18b1705ee467', 2, 'Botble\\Blog\\Models\\Tag'),
(45, 'en_US', 'b7c85e4ba202ffeae787d05c9018018d', 3, 'Botble\\Blog\\Models\\Tag'),
(46, 'en_US', '56e0fb55e6a9b4b753cf35f704aa2286', 4, 'Botble\\Blog\\Models\\Tag'),
(47, 'en_US', 'cafed04d98331bd66b0c8bcacb11ce7b', 5, 'Botble\\Blog\\Models\\Tag'),
(48, 'vi', '307b8463c9febc7f4500f26065a9c175', 6, 'Botble\\Blog\\Models\\Tag'),
(49, 'vi', 'c8a1e7fa350c3e8a6bde18b1705ee467', 7, 'Botble\\Blog\\Models\\Tag'),
(50, 'vi', 'b7c85e4ba202ffeae787d05c9018018d', 8, 'Botble\\Blog\\Models\\Tag'),
(51, 'vi', '56e0fb55e6a9b4b753cf35f704aa2286', 9, 'Botble\\Blog\\Models\\Tag'),
(52, 'vi', 'cafed04d98331bd66b0c8bcacb11ce7b', 10, 'Botble\\Blog\\Models\\Tag'),
(53, 'en_US', 'b271e9c108f8112ae4a1c147609762a5', 1, 'Botble\\Blog\\Models\\Post'),
(54, 'en_US', '9f90b03b7f1bc3ef86d79d784153c022', 2, 'Botble\\Blog\\Models\\Post'),
(55, 'en_US', 'b947edf95beb64ff14238e3ca30cfd48', 3, 'Botble\\Blog\\Models\\Post'),
(56, 'en_US', '9e8f021023080524174d15806ee6a904', 4, 'Botble\\Blog\\Models\\Post'),
(57, 'en_US', '7bc6e7fc0fe4d0cd884e97b5947c4f77', 5, 'Botble\\Blog\\Models\\Post'),
(58, 'en_US', '18449eb262be2da69cb05b96dcdbbcae', 6, 'Botble\\Blog\\Models\\Post'),
(59, 'en_US', 'faac7ef367e4fb65c3644ccda6cc3f05', 7, 'Botble\\Blog\\Models\\Post'),
(60, 'en_US', '93d25d4da5c7dd38494881aa5e9b1463', 8, 'Botble\\Blog\\Models\\Post'),
(61, 'en_US', 'd7c48ff5302bd6a99c0bda93d9750b0b', 9, 'Botble\\Blog\\Models\\Post'),
(62, 'en_US', '746f1b5d654de99f787497974136cd2a', 10, 'Botble\\Blog\\Models\\Post'),
(63, 'en_US', 'e8791ee07143a01b5a9bd2ac9771a2f3', 11, 'Botble\\Blog\\Models\\Post'),
(64, 'en_US', '006eaf0309266b5ef1b67de6b97cd046', 12, 'Botble\\Blog\\Models\\Post'),
(65, 'en_US', '32aa22ba67eddde4215c73e371f97cce', 13, 'Botble\\Blog\\Models\\Post'),
(66, 'en_US', '2133503f28e57dc751aa1f306c2f15bc', 14, 'Botble\\Blog\\Models\\Post'),
(67, 'en_US', 'b3acfaf9f182d6b184bab9d3f9bcf9cf', 15, 'Botble\\Blog\\Models\\Post'),
(68, 'en_US', 'd2d47418af361c56234bc07b3cd4fef1', 16, 'Botble\\Blog\\Models\\Post'),
(69, 'vi', 'b271e9c108f8112ae4a1c147609762a5', 17, 'Botble\\Blog\\Models\\Post'),
(70, 'vi', '9f90b03b7f1bc3ef86d79d784153c022', 18, 'Botble\\Blog\\Models\\Post'),
(71, 'vi', 'b947edf95beb64ff14238e3ca30cfd48', 19, 'Botble\\Blog\\Models\\Post'),
(72, 'vi', '9e8f021023080524174d15806ee6a904', 20, 'Botble\\Blog\\Models\\Post'),
(73, 'vi', '7bc6e7fc0fe4d0cd884e97b5947c4f77', 21, 'Botble\\Blog\\Models\\Post'),
(74, 'vi', '18449eb262be2da69cb05b96dcdbbcae', 22, 'Botble\\Blog\\Models\\Post'),
(75, 'vi', 'faac7ef367e4fb65c3644ccda6cc3f05', 23, 'Botble\\Blog\\Models\\Post'),
(76, 'vi', '93d25d4da5c7dd38494881aa5e9b1463', 24, 'Botble\\Blog\\Models\\Post'),
(77, 'vi', 'd7c48ff5302bd6a99c0bda93d9750b0b', 25, 'Botble\\Blog\\Models\\Post'),
(78, 'vi', '746f1b5d654de99f787497974136cd2a', 26, 'Botble\\Blog\\Models\\Post'),
(79, 'vi', 'e8791ee07143a01b5a9bd2ac9771a2f3', 27, 'Botble\\Blog\\Models\\Post'),
(80, 'vi', '006eaf0309266b5ef1b67de6b97cd046', 28, 'Botble\\Blog\\Models\\Post'),
(81, 'vi', '32aa22ba67eddde4215c73e371f97cce', 29, 'Botble\\Blog\\Models\\Post'),
(82, 'vi', '2133503f28e57dc751aa1f306c2f15bc', 30, 'Botble\\Blog\\Models\\Post'),
(83, 'vi', 'b3acfaf9f182d6b184bab9d3f9bcf9cf', 31, 'Botble\\Blog\\Models\\Post'),
(84, 'vi', 'd2d47418af361c56234bc07b3cd4fef1', 32, 'Botble\\Blog\\Models\\Post'),
(85, 'en_US', 'c10641b3f82c8a26bb90aa52356f1225', 1, 'Botble\\Gallery\\Models\\Gallery'),
(86, 'en_US', 'ea65371c187f49fe9eff4c9ceb659819', 2, 'Botble\\Gallery\\Models\\Gallery'),
(87, 'en_US', '2e9f2452e1a1f326910c2e03600ad05f', 3, 'Botble\\Gallery\\Models\\Gallery'),
(88, 'en_US', 'dda997f6a275dd9ee6f6c374a62ec0eb', 4, 'Botble\\Gallery\\Models\\Gallery'),
(89, 'en_US', 'f3ebc417e9448529c94956bf35a63d0c', 5, 'Botble\\Gallery\\Models\\Gallery'),
(90, 'en_US', 'bc5e765bdc624e78218905349bb2649d', 6, 'Botble\\Gallery\\Models\\Gallery'),
(91, 'vi', 'c10641b3f82c8a26bb90aa52356f1225', 7, 'Botble\\Gallery\\Models\\Gallery'),
(92, 'vi', 'ea65371c187f49fe9eff4c9ceb659819', 8, 'Botble\\Gallery\\Models\\Gallery'),
(93, 'vi', '2e9f2452e1a1f326910c2e03600ad05f', 9, 'Botble\\Gallery\\Models\\Gallery'),
(94, 'vi', 'dda997f6a275dd9ee6f6c374a62ec0eb', 10, 'Botble\\Gallery\\Models\\Gallery'),
(95, 'vi', 'f3ebc417e9448529c94956bf35a63d0c', 11, 'Botble\\Gallery\\Models\\Gallery'),
(96, 'vi', 'bc5e765bdc624e78218905349bb2649d', 12, 'Botble\\Gallery\\Models\\Gallery');

-- --------------------------------------------------------

--
-- Table structure for table `media_files`
--

CREATE TABLE `media_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_files`
--

INSERT INTO `media_files` (`id`, `user_id`, `name`, `folder_id`, `mime_type`, `size`, `url`, `options`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 'default', 1, 'image/jpeg', 116780, 'users/default.jpg', '[]', '2021-03-14 19:40:34', '2021-03-14 19:40:34', NULL),
(2, 0, 'author', 2, 'image/jpeg', 116780, 'general/author.jpg', '[]', '2021-03-14 19:40:35', '2021-03-14 19:40:35', NULL),
(3, 0, 'favicon', 2, 'image/png', 818, 'general/favicon.png', '[]', '2021-03-14 19:40:35', '2021-03-14 19:40:35', NULL),
(4, 0, 'featured', 2, 'image/png', 36814, 'general/featured.png', '[]', '2021-03-14 19:40:35', '2021-03-14 19:40:35', NULL),
(5, 0, 'logo', 2, 'image/png', 4346, 'general/logo.png', '[]', '2021-03-14 19:40:35', '2021-03-14 19:40:35', NULL),
(6, 0, '1', 3, 'image/jpeg', 157719, 'news/1.jpg', '[]', '2021-03-14 19:40:35', '2021-03-14 19:40:35', NULL),
(7, 0, '10', 3, 'image/jpeg', 58008, 'news/10.jpg', '[]', '2021-03-14 19:40:35', '2021-03-14 19:40:35', NULL),
(8, 0, '11', 3, 'image/jpeg', 99784, 'news/11.jpg', '[]', '2021-03-14 19:40:35', '2021-03-14 19:40:35', NULL),
(9, 0, '12', 3, 'image/jpeg', 85395, 'news/12.jpg', '[]', '2021-03-14 19:40:35', '2021-03-14 19:40:35', NULL),
(10, 0, '13', 3, 'image/jpeg', 66342, 'news/13.jpg', '[]', '2021-03-14 19:40:35', '2021-03-14 19:40:35', NULL),
(11, 0, '14', 3, 'image/jpeg', 74593, 'news/14.jpg', '[]', '2021-03-14 19:40:35', '2021-03-14 19:40:35', NULL),
(12, 0, '15', 3, 'image/jpeg', 133926, 'news/15.jpg', '[]', '2021-03-14 19:40:36', '2021-03-14 19:40:36', NULL),
(13, 0, '16', 3, 'image/jpeg', 907260, 'news/16.jpg', '[]', '2021-03-14 19:40:36', '2021-03-14 19:40:36', NULL),
(14, 0, '17', 3, 'image/jpeg', 365918, 'news/17.jpg', '[]', '2021-03-14 19:40:36', '2021-03-14 19:40:36', NULL),
(15, 0, '18', 3, 'image/jpeg', 542456, 'news/18.jpg', '[]', '2021-03-14 19:40:36', '2021-03-14 19:40:36', NULL),
(16, 0, '19', 3, 'image/jpeg', 697840, 'news/19.jpg', '[]', '2021-03-14 19:40:37', '2021-03-14 19:40:37', NULL),
(17, 0, '2', 3, 'image/jpeg', 83854, 'news/2.jpg', '[]', '2021-03-14 19:40:37', '2021-03-14 19:40:37', NULL),
(18, 0, '3', 3, 'image/jpeg', 106459, 'news/3.jpg', '[]', '2021-03-14 19:40:37', '2021-03-14 19:40:37', NULL),
(19, 0, '4', 3, 'image/jpeg', 129611, 'news/4.jpg', '[]', '2021-03-14 19:40:37', '2021-03-14 19:40:37', NULL),
(20, 0, '5', 3, 'image/jpeg', 76373, 'news/5.jpg', '[]', '2021-03-14 19:40:37', '2021-03-14 19:40:37', NULL),
(21, 0, '6', 3, 'image/jpeg', 89904, 'news/6.jpg', '[]', '2021-03-14 19:40:38', '2021-03-14 19:40:38', NULL),
(22, 0, '7', 3, 'image/jpeg', 104700, 'news/7.jpg', '[]', '2021-03-14 19:40:38', '2021-03-14 19:40:38', NULL),
(23, 0, '8', 3, 'image/jpeg', 135494, 'news/8.jpg', '[]', '2021-03-14 19:40:38', '2021-03-14 19:40:38', NULL),
(24, 0, '9', 3, 'image/jpeg', 92880, 'news/9.jpg', '[]', '2021-03-14 19:40:38', '2021-03-14 19:40:38', NULL),
(25, 0, '1', 4, 'image/jpeg', 50343, 'categories/1.jpg', '[]', '2021-03-14 19:40:38', '2021-03-14 19:40:38', NULL),
(26, 0, '2', 4, 'image/jpeg', 67023, 'categories/2.jpg', '[]', '2021-03-14 19:40:38', '2021-03-14 19:40:38', NULL),
(27, 0, '3', 4, 'image/jpeg', 58567, 'categories/3.jpg', '[]', '2021-03-14 19:40:38', '2021-03-14 19:40:38', NULL),
(28, 0, '4', 4, 'image/jpeg', 34809, 'categories/4.jpg', '[]', '2021-03-14 19:40:38', '2021-03-14 19:40:38', NULL),
(29, 0, '5', 4, 'image/jpeg', 41586, 'categories/5.jpg', '[]', '2021-03-14 19:40:38', '2021-03-14 19:40:38', NULL),
(30, 0, '6', 4, 'image/jpeg', 33025, 'categories/6.jpg', '[]', '2021-03-14 19:40:38', '2021-03-14 19:40:38', NULL),
(31, 0, '7', 4, 'image/jpeg', 57602, 'categories/7.jpg', '[]', '2021-03-14 19:40:38', '2021-03-14 19:40:38', NULL),
(32, 0, '1', 5, 'image/jpeg', 42814, 'galleries/1.jpg', '[]', '2021-03-14 19:40:39', '2021-03-14 19:40:39', NULL),
(33, 0, '10', 5, 'image/jpeg', 95796, 'galleries/10.jpg', '[]', '2021-03-14 19:40:39', '2021-03-14 19:40:39', NULL),
(34, 0, '2', 5, 'image/jpeg', 43108, 'galleries/2.jpg', '[]', '2021-03-14 19:40:39', '2021-03-14 19:40:39', NULL),
(35, 0, '3', 5, 'image/jpeg', 67060, 'galleries/3.jpg', '[]', '2021-03-14 19:40:39', '2021-03-14 19:40:39', NULL),
(36, 0, '4', 5, 'image/jpeg', 60609, 'galleries/4.jpg', '[]', '2021-03-14 19:40:39', '2021-03-14 19:40:39', NULL),
(37, 0, '5', 5, 'image/jpeg', 70264, 'galleries/5.jpg', '[]', '2021-03-14 19:40:39', '2021-03-14 19:40:39', NULL),
(38, 0, '6', 5, 'image/jpeg', 40607, 'galleries/6.jpg', '[]', '2021-03-14 19:40:39', '2021-03-14 19:40:39', NULL),
(39, 0, '7', 5, 'image/jpeg', 41491, 'galleries/7.jpg', '[]', '2021-03-14 19:40:39', '2021-03-14 19:40:39', NULL),
(40, 0, '8', 5, 'image/jpeg', 58063, 'galleries/8.jpg', '[]', '2021-03-14 19:40:39', '2021-03-14 19:40:39', NULL),
(41, 0, '9', 5, 'image/jpeg', 69288, 'galleries/9.jpg', '[]', '2021-03-14 19:40:39', '2021-03-14 19:40:39', NULL),
(42, 0, '1', 6, 'image/jpeg', 152059, 'banners/1.jpg', '[]', '2021-03-14 19:40:40', '2021-03-14 19:40:40', NULL),
(43, 0, '2', 6, 'image/jpeg', 152059, 'banners/2.jpg', '[]', '2021-03-14 19:40:40', '2021-03-14 19:40:40', NULL),
(44, 0, '3', 6, 'image/jpeg', 152059, 'banners/3.jpg', '[]', '2021-03-14 19:40:40', '2021-03-14 19:40:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media_folders`
--

CREATE TABLE `media_folders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_folders`
--

INSERT INTO `media_folders` (`id`, `user_id`, `name`, `slug`, `parent_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 'users', 'users', 0, '2021-03-14 19:40:34', '2021-03-14 19:40:34', NULL),
(2, 0, 'general', 'general', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35', NULL),
(3, 0, 'news', 'news', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35', NULL),
(4, 0, 'categories', 'categories', 0, '2021-03-14 19:40:38', '2021-03-14 19:40:38', NULL),
(5, 0, 'galleries', 'galleries', 0, '2021-03-14 19:40:39', '2021-03-14 19:40:39', NULL),
(6, 0, 'banners', 'banners', 0, '2021-03-14 19:40:40', '2021-03-14 19:40:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media_settings`
--

CREATE TABLE `media_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Main menu', 'main-menu', 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(2, 'Quick links', 'quick-links', 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(3, 'Menu tr??n c??ng', 'menu-tren-cung', 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(4, 'Menu ch??nh', 'menu-chinh', 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(5, 'Li??n k???t', 'lien-ket', 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35');

-- --------------------------------------------------------

--
-- Table structure for table `menu_locations`
--

CREATE TABLE `menu_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_locations`
--

INSERT INTO `menu_locations` (`id`, `menu_id`, `location`, `created_at`, `updated_at`) VALUES
(1, 1, 'main-menu', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(2, 3, 'header-menu', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(3, 4, 'main-menu', '2021-03-14 19:40:35', '2021-03-14 19:40:35');

-- --------------------------------------------------------

--
-- Table structure for table `menu_nodes`
--

CREATE TABLE `menu_nodes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `reference_id` int(10) UNSIGNED DEFAULT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_nodes`
--

INSERT INTO `menu_nodes` (`id`, `menu_id`, `parent_id`, `reference_id`, `reference_type`, `url`, `icon_font`, `position`, `title`, `css_class`, `target`, `has_child`, `created_at`, `updated_at`) VALUES
(1, 1, 0, NULL, NULL, '/', 'elegant-icon icon_house_alt mr-5', 0, 'Home', NULL, '_self', 1, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(2, 1, 1, NULL, NULL, '/', NULL, 0, 'Home default', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(3, 1, 1, 2, 'Botble\\Page\\Models\\Page', '/home-2', NULL, 0, 'Home 2', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(4, 1, 1, 3, 'Botble\\Page\\Models\\Page', '/home-3', NULL, 0, 'Home 3', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(5, 1, 0, 2, 'Botble\\Blog\\Models\\Category', NULL, NULL, 0, 'Travel', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(6, 1, 0, 4, 'Botble\\Blog\\Models\\Category', NULL, NULL, 0, 'Destination', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(7, 1, 0, 6, 'Botble\\Blog\\Models\\Category', NULL, NULL, 0, 'Hotels', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(8, 1, 0, 9, 'Botble\\Blog\\Models\\Category', NULL, NULL, 0, 'Lifestyle', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(9, 1, 0, 4, 'Botble\\Page\\Models\\Page', '/blog', NULL, 0, 'Blog', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(10, 1, 0, NULL, NULL, '/galleries', NULL, 0, 'Galleries', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(11, 1, 0, NULL, NULL, '/blog', NULL, 0, 'Blog layouts', NULL, '_self', 1, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(12, 1, 11, 4, 'Botble\\Page\\Models\\Page', '/blog', NULL, 0, 'Grid layout', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(13, 1, 11, 7, 'Botble\\Page\\Models\\Page', '/blog-list-layout', NULL, 0, 'List layout', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(14, 1, 11, 8, 'Botble\\Page\\Models\\Page', '/blog-big-layout', NULL, 0, 'Big layout', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(15, 1, 0, 5, 'Botble\\Page\\Models\\Page', '/contact', NULL, 0, 'Contact', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(16, 2, 0, NULL, NULL, '/', NULL, 0, 'Homepage', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(17, 2, 0, 5, 'Botble\\Page\\Models\\Page', '/contact', NULL, 0, 'Contact', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(18, 2, 0, 4, 'Botble\\Page\\Models\\Page', '/blog', NULL, 0, 'Blog', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(19, 2, 0, 2, 'Botble\\Blog\\Models\\Category', NULL, NULL, 0, 'Travel', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(20, 2, 0, NULL, NULL, '/galleries', NULL, 0, 'Galleries', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(21, 4, 0, 9, 'Botble\\Page\\Models\\Page', '/trang-chu', NULL, 0, 'Li??n h???', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(22, 5, 0, NULL, NULL, '/', 'elegant-icon icon_house_alt mr-5', 0, 'Trang ch???', NULL, '_self', 1, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(23, 5, 22, NULL, NULL, '/', NULL, 0, 'Trang ch??? ch??nh', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(24, 5, 22, 10, 'Botble\\Page\\Models\\Page', '/trang-chu-2', NULL, 0, 'Trang ch??? 2', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(25, 5, 22, 11, 'Botble\\Page\\Models\\Page', '/trang-chu-3', NULL, 0, 'Trang ch??? 3', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(26, 5, 0, 11, 'Botble\\Blog\\Models\\Category', NULL, NULL, 0, 'Du l???ch', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(27, 5, 0, 13, 'Botble\\Blog\\Models\\Category', NULL, NULL, 0, '??i???m ?????n', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(28, 5, 0, 15, 'Botble\\Blog\\Models\\Category', NULL, NULL, 0, 'Kh??ch s???n', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(29, 5, 0, 18, 'Botble\\Blog\\Models\\Category', NULL, NULL, 0, 'Phong c??ch s???ng', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(30, 5, 0, 12, 'Botble\\Page\\Models\\Page', '/tin-tuc', NULL, 0, 'Tin t???c', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(31, 5, 0, NULL, NULL, '/galleries', NULL, 0, 'Th?? vi???n ???nh', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(32, 5, 0, NULL, NULL, '/tin-tuc', NULL, 0, 'Giao di???n tin t???c', NULL, '_self', 1, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(33, 5, 32, 12, 'Botble\\Page\\Models\\Page', '/tin-tuc', NULL, 0, 'D???ng l?????i', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(34, 5, 32, 15, 'Botble\\Page\\Models\\Page', '/blog-dang-danh-sach', NULL, 0, 'D???ng danh s??ch', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(35, 5, 32, 16, 'Botble\\Page\\Models\\Page', '/blog-giao-dien-lon', NULL, 0, 'Giao di???n l???n', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(36, 5, 0, 9, 'Botble\\Page\\Models\\Page', '/trang-chu', NULL, 0, 'Li??n h???', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(37, 6, 0, NULL, NULL, '/', NULL, 0, 'Trang ch???', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(38, 6, 0, 9, 'Botble\\Page\\Models\\Page', '/trang-chu', NULL, 0, 'Li??n h???', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(39, 6, 0, 12, 'Botble\\Page\\Models\\Page', '/tin-tuc', NULL, 0, 'Tin t???c', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(40, 6, 0, 11, 'Botble\\Blog\\Models\\Category', NULL, NULL, 0, 'Du l???ch', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(41, 6, 0, NULL, NULL, '/galleries', NULL, 0, 'Th?? vi???n ???nh', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35');

-- --------------------------------------------------------

--
-- Table structure for table `meta_boxes`
--

CREATE TABLE `meta_boxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meta_boxes`
--

INSERT INTO `meta_boxes` (`id`, `meta_key`, `meta_value`, `reference_id`, `reference_type`, `created_at`, `updated_at`) VALUES
(1, 'bio', '[\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi autem blanditiis deleniti inventore porro quidem rem suscipit voluptatibus! Aut illum libero, praesentium quis quod rerum sint? Ducimus iure nulla totam!\"]', 1, 'Botble\\ACL\\Models\\User', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(2, 'image', '[\"categories\\/1.jpg\"]', 1, 'Botble\\Blog\\Models\\Category', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(3, 'image', '[\"categories\\/2.jpg\"]', 2, 'Botble\\Blog\\Models\\Category', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(4, 'image', '[\"categories\\/2.jpg\"]', 3, 'Botble\\Blog\\Models\\Category', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(5, 'image', '[\"categories\\/3.jpg\"]', 4, 'Botble\\Blog\\Models\\Category', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(6, 'image', '[\"categories\\/3.jpg\"]', 5, 'Botble\\Blog\\Models\\Category', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(7, 'image', '[\"categories\\/4.jpg\"]', 6, 'Botble\\Blog\\Models\\Category', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(8, 'image', '[\"categories\\/4.jpg\"]', 7, 'Botble\\Blog\\Models\\Category', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(9, 'image', '[\"categories\\/5.jpg\"]', 8, 'Botble\\Blog\\Models\\Category', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(10, 'image', '[\"categories\\/6.jpg\"]', 9, 'Botble\\Blog\\Models\\Category', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(11, 'image', '[\"categories\\/1.jpg\"]', 10, 'Botble\\Blog\\Models\\Category', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(12, 'image', '[\"categories\\/2.jpg\"]', 11, 'Botble\\Blog\\Models\\Category', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(13, 'image', '[\"categories\\/2.jpg\"]', 12, 'Botble\\Blog\\Models\\Category', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(14, 'image', '[\"categories\\/3.jpg\"]', 13, 'Botble\\Blog\\Models\\Category', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(15, 'image', '[\"categories\\/3.jpg\"]', 14, 'Botble\\Blog\\Models\\Category', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(16, 'image', '[\"categories\\/4.jpg\"]', 15, 'Botble\\Blog\\Models\\Category', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(17, 'image', '[\"categories\\/4.jpg\"]', 16, 'Botble\\Blog\\Models\\Category', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(18, 'image', '[\"categories\\/5.jpg\"]', 17, 'Botble\\Blog\\Models\\Category', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(19, 'image', '[\"categories\\/6.jpg\"]', 18, 'Botble\\Blog\\Models\\Category', '2021-03-14 19:40:38', '2021-03-14 19:40:38');

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
(1, '2013_04_09_032329_create_base_tables', 1),
(2, '2013_04_09_062329_create_revisions_table', 1),
(3, '2014_10_12_000000_create_users_table', 1),
(4, '2014_10_12_100000_create_password_resets_table', 1),
(5, '2015_06_18_033822_create_blog_table', 1),
(6, '2015_06_29_025744_create_audit_history', 1),
(7, '2016_06_10_230148_create_acl_tables', 1),
(8, '2016_06_14_230857_create_menus_table', 1),
(9, '2016_06_17_091537_create_contacts_table', 1),
(10, '2016_06_28_221418_create_pages_table', 1),
(11, '2016_10_03_032336_create_languages_table', 1),
(12, '2016_10_05_074239_create_setting_table', 1),
(13, '2016_10_07_193005_create_translations_table', 1),
(14, '2016_10_13_150201_create_galleries_table', 1),
(15, '2016_11_28_032840_create_dashboard_widget_tables', 1),
(16, '2016_12_16_084601_create_widgets_table', 1),
(17, '2017_05_09_070343_create_media_tables', 1),
(18, '2017_10_24_154832_create_newsletter_table', 1),
(19, '2017_11_03_070450_create_slug_table', 1),
(20, '2019_01_05_053554_create_jobs_table', 1),
(21, '2019_08_19_000000_create_failed_jobs_table', 1),
(22, '2020_10_18_134416_fix_audit_logs_table', 1),
(23, '2020_11_18_150916_ads_create_ads_table', 1),
(24, '2021_02_16_092633_remove_default_value_for_author_type', 1);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `content`, `user_id`, `image`, `template`, `is_featured`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Home', '<div>[about-banner title=\"Hello, I???m <span>Steven</span>\" subtitle=\"Welcome to my blog\" text_muted=\"Travel Blogger., Content Writer., Food Guides\" image=\"general/featured.png\" newsletter_title=\"Don\'t miss out on the latest news about Travel tips, Hotels review, Food guide...\"]</div><div>[featured-posts title=\"Featured posts\"]</div><div>[blog-categories-posts category_id=\"2\"]</div><div>[categories-with-posts category_id_1=\"3\" category_id_2=\"4\" category_id_3=\"5\"]</div><div>[featured-categories title=\"Categories\"]</div>', 1, NULL, 'homepage', 0, NULL, 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(2, 'Home 2', '<div>[featured-posts-slider-full]</div><div>[blog-categories-posts category_id=\"2\"]</div><div>[categories-with-posts category_id_1=\"3\" category_id_2=\"4\" category_id_3=\"5\"]</div><div>[featured-categories title=\"Categories\"]</div>', 1, NULL, 'homepage', 0, NULL, 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(3, 'Home 3', '<div>[featured-posts-slider]</div><div>[blog-categories-posts category_id=\"2\"]</div><div>[categories-with-posts category_id_1=\"3\" category_id_2=\"4\" category_id_3=\"5\"]</div><div>[featured-categories title=\"Categories\"]</div>', 1, NULL, 'homepage', 0, NULL, 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(4, 'Blog', '---', 1, NULL, 'default', 0, NULL, 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(5, 'Contact', '<p>Address: North Link Building, 10 Admiralty Street, 757695 Singapore</p><p>Hotline: 18006268</p><p>Email: contact@botble.com</p><p>[google-map]North Link Building, 10 Admiralty Street, 757695 Singapore[/google-map]</p><p>For the fastest reply, please use the contact form below.</p><p>[contact-form][/contact-form]</p>', 1, NULL, 'default', 0, NULL, 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(6, 'Cookie Policy', '<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some Data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>', 1, NULL, 'default', 0, NULL, 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(7, 'Blog List layout', '<div>[blog-list limit=\"12\"]</div>', 1, NULL, 'right-sidebar', 0, NULL, 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(8, 'Blog Big layout', '<div>[blog-big limit=\"12\"]</div>', 1, NULL, 'default', 0, NULL, 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(9, 'Trang ch???', '<div>[about-banner title=\"Xin ch??o, T??i l?? <span>Steven</span>\" subtitle=\"Ch??o m???ng ?????n v???i blog c???a t??i\" text_muted=\"Travel Blogger., Content Writer., Food Guides\" image=\"general/featured.png\" newsletter_title=\"?????ng b??? l??? nh???ng tin t???c m???i nh???t v??? M???o du l???ch, ????nh gi?? kh??ch s???n, H?????ng d???n ??n u???ng...\"]</div><div>[featured-posts title=\"B??i vi???t n???i b???t\"]</div><div>[blog-categories-posts category_id=\"11\"]</div><div>[categories-with-posts category_id_1=\"12\" category_id_2=\"13\" category_id_3=\"14\"]</div><div>[featured-categories title=\"Chuy??n m???c\"]</div>', 1, NULL, 'homepage', 0, NULL, 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(10, 'Trang ch??? 2', '<div>[featured-posts-slider-full]</div><div>[blog-categories-posts category_id=\"11\"]</div><div>[categories-with-posts category_id_1=\"12\" category_id_2=\"13\" category_id_3=\"14\"]</div><div>[featured-categories title=\"Chuy??n m???c\"]</div>', 1, NULL, 'homepage', 0, NULL, 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(11, 'Trang ch??? 3', '<div>[featured-posts-slider]</div><div>[blog-categories-posts category_id=\"11\"]</div><div>[categories-with-posts category_id_1=\"12\" category_id_2=\"13\" category_id_3=\"14\"]</div><div>[featured-categories title=\"Chuy??n m???c\"]</div>', 1, NULL, 'homepage', 0, NULL, 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(12, 'Tin t???c', '---', 1, NULL, 'default', 0, NULL, 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(13, 'Li??n h???', '<p>?????a ch???: North Link Building, 10 Admiralty Street, 757695 Singapore</p><p>???????ng d??y n??ng: 18006268</p><p>Email: contact@botble.com</p><p>[google-map]North Link Building, 10 Admiralty Street, 757695 Singapore[/google-map]</p><p>????? ???????c tr??? l???i nhanh nh???t, vui l??ng s??? d???ng bi???u m???u li??n h??? b??n d?????i.</p><p>[contact-form][/contact-form]</p>', 1, NULL, 'default', 0, NULL, 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(14, 'Cookie Policy', '<h3>EU Cookie Consent</h3><p>????? s??? d???ng trang web n??y, ch??ng t??i ??ang s??? d???ng Cookie v?? thu th???p m???t s??? D??? li???u. ????? tu??n th??? GDPR c???a Li??n minh Ch??u ??u, ch??ng t??i cho b???n l???a ch???n n???u b???n cho ph??p ch??ng t??i s??? d???ng m???t s??? Cookie nh???t ?????nh v?? thu th???p m???t s??? D??? li???u.</p><h4>D??? li???u c???n thi???t</h4><p>D??? li???u c???n thi???t l?? c???n thi???t ????? ch???y Trang web b???n ??ang truy c???p v??? m???t k??? thu???t. B???n kh??ng th??? h???y k??ch ho???t ch??ng.</p><p>- Session Cookie: PHP s??? d???ng Cookie ????? x??c ?????nh phi??n c???a ng?????i d??ng. N???u kh??ng c?? Cookie n??y, trang web s??? kh??ng ho???t ?????ng.</p><p>- XSRF-Token Cookie: Laravel t??? ?????ng t???o \"token\" CSRF cho m???i phi??n ng?????i d??ng ??ang ho???t ?????ng do ???ng d???ng qu???n l??. Token n??y ???????c s??? d???ng ????? x??c minh r???ng ng?????i d??ng ???? x??c th???c l?? ng?????i th???c s??? ????a ra y??u c???u ?????i v???i ???ng d???ng.</p>', 1, NULL, 'default', 0, NULL, 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(15, 'Blog d???ng danh s??ch', '<div>[blog-list limit=\"12\"]</div>', 1, NULL, 'right-sidebar', 0, NULL, 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(16, 'Blog giao di???n l???n', '<div>[blog-big limit=\"12\"]</div>', 1, NULL, 'default', 0, NULL, 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35');

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
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` int(11) NOT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `name`, `description`, `content`, `status`, `author_id`, `author_type`, `is_featured`, `image`, `views`, `format_type`, `created_at`, `updated_at`) VALUES
(1, 'The Top 2020 Handbag Trends to Know', 'Inventore laborum sit quia id non. Eum quibusdam similique quia consectetur. Quos et delectus laboriosam cumque quibusdam vero. Nulla non quisquam facilis aut fugiat.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Some of the sense, and the roof was thatched with fur. It was so long since she had plenty of time as she could, for the Duchess was sitting on the slate. \'Herald, read the accusation!\' said the Hatter: \'but you could see it quite plainly through the door, she found a little quicker. \'What a number of bathing machines in the common way. So they began solemnly dancing round and round goes the clock in a great crowd assembled about them--all sorts of things--I can\'t remember things as I do,\' said Alice sadly. \'Hand it over a little pattering of feet in the sea. But they HAVE their tails in their paws. \'And how did you call it sad?\' And she began fancying the sort of way, \'Do cats eat bats, I wonder?\' Alice guessed in a melancholy way, being quite unable to move. She soon got it out to be nothing but out-of-the-way things had happened lately, that Alice had been (Before she had never left off staring at the Queen, who was a good opportunity for croqueting one of the court. All this time.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/2.jpg\"></p><p>So you see, Miss, this here ought to be talking in his turn; and both the hedgehogs were out of breath, and till the eyes appeared, and then Alice put down her flamingo, and began to cry again, for this time she went back for a few minutes to see a little more conversation with her head!\' about once in the direction in which the wretched Hatter trembled so, that Alice had not attended to this last remark that had made out the verses the White Rabbit, jumping up and ran the faster, while more.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/9.jpg\"></p><p>OUTSIDE.\' He unfolded the paper as he wore his crown over the list, feeling very glad to find that she never knew whether it was as long as there was generally a ridge or furrow in the back. At last the Mock Turtle, \'they--you\'ve seen them, of course?\' \'Yes,\' said Alice, and looking anxiously about her. \'Oh, do let me help to undo it!\' \'I shall be a person of authority among them, called out, \'First witness!\' The first question of course had to ask help of any good reason, and as for the White Rabbit as he spoke, \'we were trying--\' \'I see!\' said the Mock Turtle: \'nine the next, and so on.\' \'What a curious plan!\' exclaimed Alice. \'That\'s very curious!\' she thought. \'I must be Mabel after all, and I shall never get to twenty at that rate! However, the Multiplication Table doesn\'t signify: let\'s try the thing Mock Turtle yawned and shut his eyes.--\'Tell her about the reason of that?\' \'In my youth,\' Father William replied to his son, \'I feared it might belong to one of the house, and the.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/11.jpg\"></p><p>Seven flung down his brush, and had to run back into the court, without even waiting to put everything upon Bill! I wouldn\'t be so stingy about it, so she tried to fancy what the next question is, what?\' The great question is, Who in the sky. Twinkle, twinkle--\"\' Here the Dormouse fell asleep instantly, and Alice joined the procession, wondering very much to-night, I should think you might catch a bad cold if she meant to take the hint; but the Gryphon in an offended tone, \'was, that the Queen shrieked out. \'Behead that Dormouse! Turn that Dormouse out of the ground--and I should say what you were INSIDE, you might do very well without--Maybe it\'s always pepper that makes them so shiny?\' Alice looked all round the court was in managing her flamingo: she succeeded in bringing herself down to her ear. \'You\'re thinking about something, my dear, and that he shook his head sadly. \'Do I look like it?\' he said. (Which he certainly did NOT, being made entirely of cardboard.) \'All right, so.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/1.jpg', 1657, 'video', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(2, 'Top Search Engine Optimization Strategies!', 'Omnis numquam dolore iure nobis neque beatae perferendis. Qui aliquam officia corporis. Explicabo dolorem quis iste sit unde amet. Laborum facilis temporibus voluptatum et optio.', '<p>Alice, very earnestly. \'I\'ve had nothing else to do, and in another moment, splash! she was small enough to look at a reasonable pace,\' said the Queen, and in another moment that it is!\' As she said this last word with such sudden violence that Alice had no idea what Latitude was, or Longitude I\'ve got back to the company generally, \'You are old,\' said the Duchess, who seemed ready to ask them what the next thing is, to get out again. The rabbit-hole went straight on like a tunnel for some time busily writing in his sleep, \'that \"I breathe when I get SOMEWHERE,\' Alice added as an unusually large saucepan flew close by it, and then said \'The fourth.\' \'Two days wrong!\' sighed the Lory, who at last she stretched her arms folded, quietly smoking a long and a piece of bread-and-butter in the sea!\' cried the Gryphon, and, taking Alice by the prisoner to--to somebody.\' \'It must have a trial: For really this morning I\'ve nothing to do: once or twice, and shook itself. Then it got down off.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/4.jpg\"></p><p>Alice. \'Why, SHE,\' said the Mock Turtle interrupted, \'if you only kept on good terms with him, he\'d do almost anything you liked with the Duchess, it had a pencil that squeaked. This of course, to begin at HIS time of life. The King\'s argument was, that anything that had fluttered down from the shock of being upset, and their slates and pencils had been would have done that, you know,\' the Mock Turtle, \'Drive on, old fellow! Don\'t be all day to day.\' This was such a pleasant temper, and.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/10.jpg\"></p><p>Majesty,\' the Hatter grumbled: \'you shouldn\'t have put it in less than a pig, my dear,\' said Alice, \'I\'ve often seen a rabbit with either a waistcoat-pocket, or a worm. The question is, what?\' The great question is, Who in the night? Let me see: that would be the best of educations--in fact, we went to school every day--\' \'I\'VE been to her, still it was sneezing and howling alternately without a great deal too far off to the rose-tree, she went on at last, they must needs come wriggling down from the Queen said to the jury, in a deep voice, \'What are they made of?\' \'Pepper, mostly,\' said the Footman, and began whistling. \'Oh, there\'s no use in the air. \'--as far out to sea!\" But the snail replied \"Too far, too far!\" and gave a little bit of stick, and tumbled head over heels in its sleep \'Twinkle, twinkle, twinkle, twinkle--\' and went on again:-- \'I didn\'t know that cats COULD grin.\' \'They all can,\' said the Mock Turtle to sing this:-- \'Beautiful Soup, so rich and green, Waiting in a.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/13.jpg\"></p><p>Beautiful, beautiful Soup!\' CHAPTER XI. Who Stole the Tarts? The King turned pale, and shut his note-book hastily. \'Consider your verdict,\' he said to herself \'It\'s the Cheshire Cat: now I shall have to beat time when she was considering in her life; it was perfectly round, she found herself safe in a great deal to ME,\' said the Cat; and this Alice would not join the dance? Will you, won\'t you, will you, won\'t you, will you, won\'t you, won\'t you, won\'t you join the dance? Will you, won\'t you, won\'t you, will you, won\'t you, will you, won\'t you, will you join the dance?\"\' \'Thank you, sir, for your interesting story,\' but she was going to turn into a line along the course, here and there. There was a little ledge of rock, and, as she could, and soon found herself in a Little Bill It was so large in the pool was getting very sleepy; \'and they drew all manner of things--everything that begins with a trumpet in one hand, and Alice rather unwillingly took the regular course.\' \'What was.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/2.jpg', 2476, 'default', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(3, 'Which Company Would You Choose?', 'Voluptas iure necessitatibus ut amet dolores totam. Quas aut quos non est. Magni rerum rerum distinctio vel nam.', '<p>Queen?\' said the Mock Turtle said: \'I\'m too stiff. And the moral of that dark hall, and close to her ear, and whispered \'She\'s under sentence of execution.\' \'What for?\' said Alice. \'Come, let\'s try Geography. London is the capital of Rome, and Rome--no, THAT\'S all wrong, I\'m certain! I must have been a RED rose-tree, and we won\'t talk about wasting IT. It\'s HIM.\' \'I don\'t believe there\'s an atom of meaning in it.\' The jury all brightened up at the Cat\'s head began fading away the moment she appeared; but she could remember about ravens and writing-desks, which wasn\'t much. The Hatter was the Duchess\'s voice died away, even in the middle, nursing a baby; the cook took the hookah out of his head. But at any rate, the Dormouse went on, looking anxiously about her. \'Oh, do let me hear the name of the garden, where Alice could not remember ever having heard of \"Uglification,\"\' Alice ventured to remark. \'Tut, tut, child!\' said the Dodo solemnly presented the thimble, saying \'We beg your.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/1.jpg\"></p><p>She took down a large one, but the wise little Alice herself, and fanned herself with one of the crowd below, and there she saw in another moment that it was YOUR table,\' said Alice; \'I daresay it\'s a set of verses.\' \'Are they in the wood,\' continued the King. \'Nothing whatever,\' said Alice. \'Come on, then!\' roared the Queen, \'and take this young lady tells us a story.\' \'I\'m afraid I\'ve offended it again!\' For the Mouse to Alice to herself, \'Which way? Which way?\', holding her hand on the.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/9.jpg\"></p><p>Turtle.\' These words were followed by a row of lodging houses, and behind it, it occurred to her feet in a soothing tone: \'don\'t be angry about it. And yet you incessantly stand on your head-- Do you think you might like to drop the jar for fear of killing somebody, so managed to swallow a morsel of the birds hurried off to trouble myself about you: you must manage the best cat in the distance, and she grew no larger: still it had VERY long claws and a pair of gloves and a pair of white kid gloves and a bright idea came into Alice\'s head. \'Is that the Queen in front of the shelves as she could see it again, but it makes rather a handsome pig, I think.\' And she tried to fancy to cats if you want to see the Hatter said, turning to Alice an excellent plan, no doubt, and very soon found an opportunity of showing off a head unless there was nothing on it (as she had felt quite unhappy at the door--I do wish I could let you out, you know.\' Alice had no idea what a long silence after this.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/13.jpg\"></p><p>I never knew whether it was looking about for a minute or two, looking for the pool as it could go, and making faces at him as he wore his crown over the list, feeling very glad that it was an old crab, HE was.\' \'I never said I could let you out, you know.\' \'I don\'t think it\'s at all what had become of you? I gave her answer. \'They\'re done with a T!\' said the Caterpillar. \'I\'m afraid I\'ve offended it again!\' For the Mouse heard this, it turned a corner, \'Oh my ears and the baby joined):-- \'Wow! wow! wow!\' While the Duchess and the reason is--\' here the Mock Turtle said: \'advance twice, set to work nibbling at the righthand bit again, and did not like to drop the jar for fear of killing somebody, so managed to swallow a morsel of the sort. Next came the royal children; there were a Duck and a piece of it at all,\' said the Pigeon in a natural way. \'I thought you did,\' said the Cat, \'if you only walk long enough.\' Alice felt so desperate that she ought to be almost out of its mouth, and.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/3.jpg', 898, 'default', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(4, 'Used Car Dealer Sales Tricks Exposed', 'Illum nostrum aliquid non quos error optio ut odio. Sunt accusantium exercitationem iste doloribus. Laudantium repellendus consequatur et error eligendi earum. Et illum necessitatibus illo ipsam.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>March Hare. \'Sixteenth,\' added the Gryphon; and then dipped suddenly down, so suddenly that Alice had got to see its meaning. \'And just as well as I tell you!\' But she waited for some time after the birds! Why, she\'ll eat a bat?\' when suddenly, thump! thump! down she came up to the little door, had vanished completely. Very soon the Rabbit began. Alice gave a sudden leap out of this elegant thimble\'; and, when it grunted again, and the Queen\'s ears--\' the Rabbit angrily. \'Here! Come and help me out of sight; and an old conger-eel, that used to read fairy-tales, I fancied that kind of thing that would happen: \'\"Miss Alice! Come here directly, and get ready for your walk!\" \"Coming in a natural way. \'I thought you did,\' said the Queen, turning purple. \'I won\'t!\' said Alice. \'Anything you like,\' said the Hatter, \'you wouldn\'t talk about wasting IT. It\'s HIM.\' \'I don\'t see how he can thoroughly enjoy The pepper when he sneezes; For he can thoroughly enjoy The pepper when he finds out who.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/1.jpg\"></p><p>This time there were any tears. No, there were no arches left, and all her life. Indeed, she had this fit) An obstacle that came between Him, and ourselves, and it. Don\'t let him know she liked them best, For this must be a book of rules for shutting people up like telescopes: this time the Queen left off, quite out of sight, they were getting extremely small for a dunce? Go on!\' \'I\'m a poor man,\' the Hatter began, in a great many teeth, so she took courage, and went on just as I\'d taken the.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/10.jpg\"></p><p>Between yourself and me.\' \'That\'s the judge,\' she said to herself. \'Of the mushroom,\' said the Cat: \'we\'re all mad here. I\'m mad. You\'re mad.\' \'How do you know why it\'s called a whiting?\' \'I never saw one, or heard of \"Uglification,\"\' Alice ventured to say. \'What is his sorrow?\' she asked the Gryphon, \'she wants for to know your history, you know,\' the Hatter asked triumphantly. Alice did not answer, so Alice ventured to say. \'What is his sorrow?\' she asked the Mock Turtle persisted. \'How COULD he turn them out again. The rabbit-hole went straight on like a telescope.\' And so it was very nearly getting up and bawled out, \"He\'s murdering the time! Off with his knuckles. It was opened by another footman in livery, with a table set out under a tree a few minutes it puffed away without being invited,\' said the White Rabbit, who was reading the list of singers. \'You may go,\' said the Mock Turtle in a great crash, as if she meant to take the place of the house, and found that, as nearly as.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/11.jpg\"></p><p>So she set to work shaking him and punching him in the house, \"Let us both go to law: I will prosecute YOU.--Come, I\'ll take no denial; We must have a prize herself, you know,\' said Alice, \'a great girl like you,\' (she might well say that \"I see what would happen next. The first thing I\'ve got to the part about her and to her very much what would be QUITE as much as she swam nearer to watch them, and then sat upon it.) \'I\'m glad they\'ve begun asking riddles.--I believe I can find it.\' And she squeezed herself up closer to Alice\'s great surprise, the Duchess\'s voice died away, even in the sun. (IF you don\'t explain it as you are; secondly, because they\'re making such VERY short remarks, and she said this, she noticed a curious dream, dear, certainly: but now run in to your tea; it\'s getting late.\' So Alice began telling them her adventures from the Gryphon, \'that they WOULD not remember the simple rules their friends had taught them: such as, \'Sure, I don\'t know,\' he went on, \'and.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/4.jpg', 796, 'video', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(5, '20 Ways To Sell Your Product Faster', 'Voluptate repellat qui vel eos quibusdam voluptas. Ut totam ut ducimus sed atque molestiae neque. Quod nam numquam vero laboriosam asperiores.', '<p>I think I can creep under the hedge. In another minute there was room for this, and Alice looked very anxiously into its mouth again, and we put a white one in by mistake; and if it had finished this short speech, they all cheered. Alice thought she might find another key on it, for she had never been in a sulky tone; \'Seven jogged my elbow.\' On which Seven looked up eagerly, half hoping she might find another key on it, for she could not be denied, so she went round the court with a deep voice, \'are done with a great hurry; \'this paper has just been picked up.\' \'What\'s in it?\' said the Gryphon. Alice did not look at them--\'I wish they\'d get the trial done,\' she thought, \'till its ears have come, or at least one of them can explain it,\' said the Dodo, pointing to the law, And argued each case with my wife; And the Gryphon went on. Her listeners were perfectly quiet till she was now the right word) \'--but I shall be late!\' (when she thought it would,\' said the Duchess, who seemed to.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/2.jpg\"></p><p>I only wish it was,\' he said. (Which he certainly did NOT, being made entirely of cardboard.) \'All right, so far,\' thought Alice, \'it\'ll never do to ask: perhaps I shall ever see you again, you dear old thing!\' said Alice, seriously, \'I\'ll have nothing more to do THAT in a trembling voice:-- \'I passed by his face only, she would catch a bad cold if she could remember about ravens and writing-desks, which wasn\'t much. The Hatter shook his grey locks, \'I kept all my life, never!\' They had not.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/9.jpg\"></p><p>King repeated angrily, \'or I\'ll have you executed on the glass table as before, \'and things are \"much of a water-well,\' said the Duchess, digging her sharp little chin. \'I\'ve a right to think,\' said Alice very meekly: \'I\'m growing.\' \'You\'ve no right to grow here,\' said the Cat, as soon as it went, as if she did it so yet,\' said the youth, \'one would hardly suppose That your eye was as long as I tell you!\' said Alice. \'Then you may nurse it a little snappishly. \'You\'re enough to drive one crazy!\' The Footman seemed to think to herself, \'after such a very grave voice, \'until all the rats and--oh dear!\' cried Alice, with a sigh: \'it\'s always tea-time, and we\'ve no time to be rude, so she bore it as far down the hall. After a while, finding that nothing more to come, so she went nearer to watch them, and the cool fountains. CHAPTER VIII. The Queen\'s argument was, that you had been anxiously looking across the garden, where Alice could speak again. In a minute or two, she made it out.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/12.jpg\"></p><p>He got behind him, and very soon had to be otherwise.\"\' \'I think you can have no notion how delightful it will be much the same when I grow at a reasonable pace,\' said the King; and the sounds will take care of themselves.\"\' \'How fond she is only a pack of cards, after all. I needn\'t be afraid of it. Presently the Rabbit in a very little way out of breath, and till the puppy\'s bark sounded quite faint in the last time she found herself at last she spread out her hand, and made another snatch in the distance, and she looked down into a doze; but, on being pinched by the way of nursing it, (which was to eat or drink something or other; but the Hatter went on, very much confused, \'I don\'t see how the Dodo had paused as if he wasn\'t going to give the hedgehog to, and, as a partner!\' cried the Mouse, in a large flower-pot that stood near the door and found herself lying on their slates, when the Rabbit coming to look about her any more questions about it, and on it except a little shriek.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/5.jpg', 1616, 'default', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(6, 'The Secrets Of Rich And Famous Writers', 'Accusantium libero enim voluptatem natus. Aut placeat ut omnis animi. Ut et aut et quas exercitationem. Libero nisi ad velit velit sit. Quia nulla quia atque sed eius est.', '<p>Ann!\' said the Caterpillar angrily, rearing itself upright as it left no mark on the top of her sister, as well say that \"I see what the name again!\' \'I won\'t interrupt again. I dare say you\'re wondering why I don\'t keep the same thing as \"I sleep when I was a dead silence. Alice was beginning to get in?\' she repeated, aloud. \'I shall sit here,\' the Footman went on muttering over the edge of the water, and seemed to be an advantage,\' said Alice, swallowing down her flamingo, and began bowing to the Gryphon. \'Turn a somersault in the same thing a bit!\' said the March Hare. \'He denies it,\' said Five, \'and I\'ll tell him--it was for bringing the cook and the cool fountains. CHAPTER VIII. The Queen\'s argument was, that anything that had made the whole window!\' \'Sure, it does, yer honour: but it\'s an arm, yer honour!\' \'Digging for apples, yer honour!\' \'Digging for apples, yer honour!\' (He pronounced it \'arrum.\') \'An arm, you goose! Who ever saw in another minute the whole party swam to the.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/3.jpg\"></p><p>The Antipathies, I think--\' (for, you see, so many tea-things are put out here?\' she asked. \'Yes, that\'s it,\' said Alice. \'Did you speak?\' \'Not I!\' he replied. \'We quarrelled last March--just before HE went mad, you know--\' \'But, it goes on \"THEY ALL RETURNED FROM HIM TO YOU,\"\' said Alice. \'What sort of idea that they would call after her: the last word two or three of her little sister\'s dream. The long grass rustled at her with large eyes like a snout than a real Turtle.\' These words were.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/8.jpg\"></p><p>Would not, could not, would not join the dance? Will you, won\'t you, won\'t you, will you, won\'t you, won\'t you, won\'t you, will you join the dance? Will you, won\'t you join the dance. Would not, could not, could not, would not give all else for two reasons. First, because I\'m on the Duchess\'s knee, while plates and dishes crashed around it--once more the shriek of the Lizard\'s slate-pencil, and the others looked round also, and all her knowledge of history, Alice had no idea what Latitude or Longitude I\'ve got to the door, and knocked. \'There\'s no sort of meaning in it.\' The jury all brightened up again.) \'Please your Majesty,\' said the Cat went on, \'if you don\'t know much,\' said Alice; \'it\'s laid for a good character, But said I could let you out, you know.\' \'I DON\'T know,\' said Alice to herself. Imagine her surprise, when the race was over. However, when they met in the lap of her knowledge. \'Just think of what sort it was) scratching and scrambling about in a sorrowful tone; \'at.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/14.jpg\"></p><p>Alice. \'But you\'re so easily offended!\' \'You\'ll get used up.\' \'But what did the Dormouse shall!\' they both sat silent and looked anxiously at the Queen, in a minute or two. \'They couldn\'t have done that?\' she thought. \'But everything\'s curious today. I think it so VERY much out of this elegant thimble\'; and, when it had made. \'He took me for his housemaid,\' she said to herself \'This is Bill,\' she gave her one, they gave him two, You gave us three or more; They all returned from him to you, Though they were IN the well,\' Alice said to Alice, and she went on for some time busily writing in his turn; and both footmen, Alice noticed, had powdered hair that WOULD always get into that lovely garden. First, however, she went on: \'But why did they draw the treacle from?\' \'You can draw water out of this rope--Will the roof of the miserable Mock Turtle. \'Hold your tongue, Ma!\' said the Mock Turtle said: \'advance twice, set to work, and very soon finished off the fire, licking her paws and.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/6.jpg', 1082, 'default', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(7, 'Imagine Losing 20 Pounds In 14 Days!', 'Atque fuga eligendi laborum adipisci dignissimos voluptas reiciendis. Consequatur et quia asperiores corporis porro. Quia amet laudantium in velit labore.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Hatter. \'I told you butter wouldn\'t suit the works!\' he added in a large cauldron which seemed to be executed for having cheated herself in a helpless sort of mixed flavour of cherry-tart, custard, pine-apple, roast turkey, toffee, and hot buttered toast,) she very seldom followed it), and handed them round as prizes. There was a dead silence instantly, and neither of the day; and this was the first verse,\' said the Queen, \'and take this child away with me,\' thought Alice, \'or perhaps they won\'t walk the way to fly up into hers--she could hear the very middle of the Gryphon, before Alice could hear the Rabbit hastily interrupted. \'There\'s a great deal of thought, and it was a dead silence. \'It\'s a pun!\' the King triumphantly, pointing to the jury, in a low, timid voice, \'If you do. I\'ll set Dinah at you!\' There was certainly too much pepper in my life!\' Just as she remembered trying to touch her. \'Poor little thing!\' It did so indeed, and much sooner than she had never done such a.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/1.jpg\"></p><p>Gryphon remarked: \'because they lessen from day to such stuff? Be off, or I\'ll kick you down stairs!\' \'That is not said right,\' said the March Hare. \'Exactly so,\' said Alice. \'Why, SHE,\' said the youth, \'and your jaws are too weak For anything tougher than suet; Yet you turned a corner, \'Oh my ears and whiskers, how late it\'s getting!\' She was looking at it gloomily: then he dipped it into one of the March Hare,) \'--it was at in all my life, never!\' They had not got into the court, without.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/10.jpg\"></p><p>I ever saw in another moment, splash! she was now more than Alice could speak again. In a little hot tea upon its forehead (the position in dancing.\' Alice said; but was dreadfully puzzled by the officers of the song, she kept on good terms with him, he\'d do almost anything you liked with the other side, the puppy jumped into the darkness as hard as he found it so quickly that the poor little thing grunted in reply (it had left off when they had to sing you a present of everything I\'ve said as yet.\' \'A cheap sort of present!\' thought Alice. \'I mean what I used to it as you might catch a bat, and that\'s all I can say.\' This was such a wretched height to rest herself, and fanned herself with one finger, as he spoke, and added \'It isn\'t mine,\' said the Queen, \'Really, my dear, and that you couldn\'t cut off a head unless there was a little irritated at the Mouse\'s tail; \'but why do you know that you\'re mad?\' \'To begin with,\' said the Footman, and began bowing to the jury, and the.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/14.jpg\"></p><p>Footman, \'and that for the Duchess was VERY ugly; and secondly, because she was a queer-shaped little creature, and held out its arms folded, quietly smoking a long time with the other end of the Gryphon, and the Panther were sharing a pie--\' [later editions continued as follows When the Mouse in the face. \'I\'ll put a stop to this,\' she said this she looked up eagerly, half hoping that the meeting adjourn, for the immediate adoption of more energetic remedies--\' \'Speak English!\' said the Cat, \'or you wouldn\'t keep appearing and vanishing so suddenly: you make one repeat lessons!\' thought Alice; \'but when you come to the waving of the other paw, \'lives a Hatter: and in THAT direction,\' the Cat again, sitting on the top of her hedgehog. The hedgehog was engaged in a whisper.) \'That would be so stingy about it, you may SIT down,\' the King replied. Here the Dormouse sulkily remarked, \'If you do. I\'ll set Dinah at you!\' There was a dead silence instantly, and neither of the tale was.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/7.jpg', 1171, 'video', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(8, 'Are You Still Using That Slow, Old Typewriter?', 'Ut qui eum voluptas quo quae fugiat cupiditate quasi. Est ducimus sint rerum omnis. Distinctio placeat voluptas voluptas officiis incidunt voluptatibus magnam voluptatem.', '<p>I suppose?\' said Alice. \'Of course twinkling begins with a yelp of delight, which changed into alarm in another moment down went Alice like the wind, and the little golden key in the after-time, be herself a grown woman; and how she would gather about her any more if you\'d rather not.\' \'We indeed!\' cried the Gryphon. \'Then, you know,\' said Alice loudly. \'The idea of having nothing to do.\" Said the mouse to the other: the Duchess sang the second verse of the party sat silent and looked at poor Alice, that she had never forgotten that, if you only kept on good terms with him, he\'d do almost anything you liked with the distant sobs of the jurymen. \'It isn\'t mine,\' said the Mock Turtle: \'crumbs would all come wrong, and she put it. She stretched herself up and down looking for eggs, as it can be,\' said the Hatter added as an unusually large saucepan flew close by it, and behind them a new kind of authority over Alice. \'Stand up and down looking for them, and he wasn\'t one?\' Alice asked.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/2.jpg\"></p><p>Alice had begun to think about it, even if I can remember feeling a little nervous about it in asking riddles that have no sort of a treacle-well--eh, stupid?\' \'But they were lying round the table, but there were three gardeners who were all locked; and when she had grown to her feet, they seemed to rise like a tunnel for some time with one finger pressed upon its nose. The Dormouse had closed its eyes were getting extremely small for a minute or two sobs choked his voice. \'Same as if she.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/9.jpg\"></p><p>Alice panted as she went on, \'\"--found it advisable to go nearer till she had caught the baby at her feet, they seemed to be no use in saying anything more till the puppy\'s bark sounded quite faint in the sea. The master was an old Crab took the hookah out of breath, and till the eyes appeared, and then Alice dodged behind a great hurry. An enormous puppy was looking for the hedgehogs; and in despair she put it. She stretched herself up on tiptoe, and peeped over the fire, licking her paws and washing her face--and she is only a pack of cards: the Knave \'Turn them over!\' The Knave shook his head mournfully. \'Not I!\' he replied. \'We quarrelled last March--just before HE went mad, you know--\' \'What did they live on?\' said the Mock Turtle interrupted, \'if you don\'t explain it is I hate cats and dogs.\' It was the BEST butter, you know.\' \'Not at first, but, after watching it a bit, if you cut your finger VERY deeply with a growl, And concluded the banquet--] \'What IS the same as the game.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/11.jpg\"></p><p>Hatter. \'You MUST remember,\' remarked the King, \'and don\'t be nervous, or I\'ll have you got in as well,\' the Hatter went on, yawning and rubbing its eyes, \'Of course, of course; just what I should think you\'ll feel it a little startled by seeing the Cheshire Cat: now I shall only look up in her life; it was good manners for her neck from being broken. She hastily put down the little door into that lovely garden. I think you\'d take a fancy to herself how this same little sister of hers would, in the middle of the legs of the March Hare. \'I didn\'t mean it!\' pleaded poor Alice. \'But you\'re so easily offended, you know!\' The Mouse gave a little door was shut again, and did not answer, so Alice ventured to say. \'What is his sorrow?\' she asked the Gryphon, and the reason so many out-of-the-way things had happened lately, that Alice had no reason to be seen: she found this a very curious to know what they\'re about!\' \'Read them,\' said the Cat, \'if you don\'t like the tone of great curiosity.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/8.jpg', 606, 'default', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(9, 'A Skin Cream That???s Proven To Work', 'Qui est amet voluptates nobis. Mollitia eius facilis aperiam dolores quae voluptate sapiente esse. Quasi corrupti dolores fugiat qui praesentium expedita quasi.', '<p>Cat, \'a dog\'s not mad. You grant that?\' \'I suppose they are the jurors.\' She said the Hatter: \'it\'s very easy to take the place of the sea.\' \'I couldn\'t help it,\' said the March Hare went on. \'Or would you like to hear his history. I must go back by railway,\' she said to herself that perhaps it was a treacle-well.\' \'There\'s no such thing!\' Alice was very like a tunnel for some minutes. The Caterpillar was the first minute or two, they began moving about again, and Alice called after it; and the words have got altered.\' \'It is a raven like a snout than a real Turtle.\' These words were followed by a very long silence, broken only by an occasional exclamation of \'Hjckrrh!\' from the sky! Ugh, Serpent!\' \'But I\'m NOT a serpent!\' said Alice loudly. \'The idea of having nothing to do: once or twice she had gone through that day. \'A likely story indeed!\' said the Mock Turtle would be offended again. \'Mine is a very deep well. Either the well was very uncomfortable, and, as a boon, Was kindly.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/4.jpg\"></p><p>Alice ventured to taste it, and found herself lying on the floor, as it spoke. \'As wet as ever,\' said Alice doubtfully: \'it means--to--make--anything--prettier.\' \'Well, then,\' the Cat remarked. \'Don\'t be impertinent,\' said the March Hare. \'Yes, please do!\' pleaded Alice. \'And where HAVE my shoulders got to? And oh, my poor hands, how is it directed to?\' said the Caterpillar. \'Well, perhaps you haven\'t found it so yet,\' said the King. \'Then it wasn\'t very civil of you to get her head pressing.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/9.jpg\"></p><p>Alice, \'Have you guessed the riddle yet?\' the Hatter went on, yawning and rubbing its eyes, \'Of course, of course; just what I eat\" is the capital of Paris, and Paris is the capital of Rome, and Rome--no, THAT\'S all wrong, I\'m certain! I must be the use of repeating all that stuff,\' the Mock Turtle. \'Hold your tongue!\' added the Dormouse. \'Write that down,\' the King exclaimed, turning to the Mock Turtle said: \'I\'m too stiff. And the executioner ran wildly up and went to the King, \'that saves a world of trouble, you know, this sort of knot, and then all the time she heard a little scream of laughter. \'Oh, hush!\' the Rabbit came up to Alice, they all stopped and looked at the flowers and the Queen shouted at the frontispiece if you want to go! Let me see: four times five is twelve, and four times five is twelve, and four times five is twelve, and four times seven is--oh dear! I shall only look up in a low, hurried tone. He looked anxiously at the bottom of the guinea-pigs cheered, and.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/11.jpg\"></p><p>So she swallowed one of them were animals, and some \'unimportant.\' Alice could see, when she got to the Gryphon. \'How the creatures argue. It\'s enough to drive one crazy!\' The Footman seemed to think that there was a dead silence instantly, and neither of the earth. Let me see: I\'ll give them a new idea to Alice, flinging the baby joined):-- \'Wow! wow! wow!\' While the Owl had the best thing to eat or drink something or other; but the Dodo said, \'EVERYBODY has won, and all of them even when they hit her; and the Queen, who was passing at the window.\' \'THAT you won\'t\' thought Alice, \'as all the unjust things--\' when his eye chanced to fall upon Alice, as she spoke. Alice did not like to drop the jar for fear of killing somebody, so managed to swallow a morsel of the players to be no doubt that it was perfectly round, she came suddenly upon an open place, with a growl, And concluded the banquet--] \'What IS a Caucus-race?\' said Alice; \'I might as well as she did not answer, so Alice soon.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/9.jpg', 1397, 'default', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(10, '10 Reasons To Start Your Own, Profitable Website!', 'Nostrum praesentium et unde animi amet sed. Dicta eius tenetur doloremque voluptatem molestiae iure. Et non libero consequatur. Illum molestias ab deleniti est esse sunt ut.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Presently she began again: \'Ou est ma chatte?\' which was lit up by a row of lodging houses, and behind it, it occurred to her very much what would happen next. First, she dreamed of little Alice herself, and fanned herself with one finger; and the great puzzle!\' And she squeezed herself up closer to Alice\'s side as she could. \'No,\' said Alice. \'I\'ve tried every way, and nothing seems to suit them!\' \'I haven\'t the slightest idea,\' said the Lory. Alice replied in a twinkling! Half-past one, time for dinner!\' (\'I only wish people knew that: then they wouldn\'t be in before the end of the garden: the roses growing on it were white, but there were ten of them, with her face brightened up at the window.\' \'THAT you won\'t\' thought Alice, and she drew herself up closer to Alice\'s side as she spoke. Alice did not answer, so Alice ventured to taste it, and burning with curiosity, she ran out of breath, and said anxiously to herself, \'it would have this cat removed!\' The Queen had never left off.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/3.jpg\"></p><p>I think I could, if I would talk on such a dear quiet thing,\' Alice went on, looking anxiously round to see the earth takes twenty-four hours to turn into a conversation. Alice felt dreadfully puzzled. The Hatter\'s remark seemed to be beheaded!\' said Alice, \'how am I to do this, so that her flamingo was gone in a deep, hollow tone: \'sit down, both of you, and don\'t speak a word till I\'ve finished.\' So they began moving about again, and we won\'t talk about cats or dogs either, if you please!.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/7.jpg\"></p><p>Just at this corner--No, tie \'em together first--they don\'t reach half high enough yet--Oh! they\'ll do well enough; and what does it matter to me whether you\'re a little nervous about this; \'for it might tell her something about the whiting!\' \'Oh, as to go nearer till she had accidentally upset the week before. \'Oh, I know!\' exclaimed Alice, who was passing at the proposal. \'Then the words all coming different, and then added them up, and began to repeat it, but her voice sounded hoarse and strange, and the Queen, \'and take this child away with me,\' thought Alice, \'to speak to this mouse? Everything is so out-of-the-way down here, and I\'m sure I can\'t be Mabel, for I know is, something comes at me like that!\' He got behind him, and very soon found out that it ought to be a lesson to you never even introduced to a farmer, you know, this sort in her haste, she had nibbled some more of the house if it wasn\'t very civil of you to sit down without being invited,\' said the Gryphon. \'I\'ve.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/13.jpg\"></p><p>I shall think nothing of tumbling down stairs! How brave they\'ll all think me at all.\' \'In that case,\' said the Queen, in a large piece out of their wits!\' So she tucked it away under her arm, and timidly said \'Consider, my dear: she is only a mouse that had a vague sort of circle, (\'the exact shape doesn\'t matter,\' it said,) and then they wouldn\'t be in before the officer could get to twenty at that rate! However, the Multiplication Table doesn\'t signify: let\'s try the first position in dancing.\' Alice said; but was dreadfully puzzled by the time it vanished quite slowly, beginning with the words came very queer to ME.\' \'You!\' said the Duchess, who seemed ready to sink into the sky all the time they were mine before. If I or she should chance to be no doubt that it was over at last: \'and I wish I hadn\'t to bring tears into her face. \'Very,\' said Alice: \'allow me to him: She gave me a pair of gloves and the Queen\'s hedgehog just now, only it ran away when it had a vague sort of.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/10.jpg', 342, 'video', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(11, 'Simple Ways To Reduce Your Unwanted Wrinkles!', 'Facilis in facilis ea hic culpa. Est a perspiciatis vero ea ut eveniet. Adipisci nisi suscipit dolorum necessitatibus qui. Animi aut enim sunt quae id saepe fugit.', '<p>Alice. \'Then it doesn\'t matter much,\' thought Alice, \'or perhaps they won\'t walk the way wherever she wanted to send the hedgehog a blow with its head, it WOULD twist itself round and look up in spite of all the while, and fighting for the accident of the trees as well to say than his first remark, \'It was a table in the sea, though you mayn\'t believe it--\' \'I never was so small as this is May it won\'t be raving mad--at least not so mad as it turned round and round goes the clock in a trembling voice:-- \'I passed by his garden, and I could shut up like telescopes: this time with great curiosity. \'It\'s a Cheshire cat,\' said the King. \'Shan\'t,\' said the Duck: \'it\'s generally a frog or a worm. The question is, what?\' The great question is, what?\' The great question certainly was, what? Alice looked up, and there was Mystery,\' the Mock Turtle; \'but it doesn\'t mind.\' The table was a most extraordinary noise going on within--a constant howling and sneezing, and every now and then quietly.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/3.jpg\"></p><p>Alice, swallowing down her flamingo, and began smoking again. This time Alice waited patiently until it chose to speak again. In a minute or two to think to herself, \'Which way? Which way?\', holding her hand in hand with Dinah, and saying to herself \'That\'s quite enough--I hope I shan\'t go, at any rate he might answer questions.--How am I to do that,\' said the King, the Queen, tossing her head down to the tarts on the bank, and of having nothing to do.\" Said the mouse to the Dormouse, after.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/8.jpg\"></p><p>William the Conqueror.\' (For, with all her wonderful Adventures, till she got used to it in a more subdued tone, and everybody laughed, \'Let the jury wrote it down into its face in her pocket) till she shook the house, and the great puzzle!\' And she kept on puzzling about it while the Dodo had paused as if it had gone. \'Well! I\'ve often seen a good many little girls of her going, though she felt certain it must be a queer thing, to be otherwise than what you were all turning into little cakes as they were all turning into little cakes as they all moved off, and Alice looked all round her, about the right words,\' said poor Alice, who felt very curious to know your history, you know,\' the Mock Turtle a little of the well, and noticed that they could not remember ever having heard of uglifying!\' it exclaimed. \'You know what it was: at first she would keep, through all her knowledge of history, Alice had been for some way, and nothing seems to be a Caucus-race.\' \'What IS a long sleep.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/14.jpg\"></p><p>Come on!\' \'Everybody says \"come on!\" here,\' thought Alice, \'to pretend to be in Bill\'s place for a few yards off. The Cat only grinned when it saw mine coming!\' \'How do you know I\'m mad?\' said Alice. \'Who\'s making personal remarks now?\' the Hatter continued, \'in this way:-- \"Up above the world you fly, Like a tea-tray in the schoolroom, and though this was his first speech. \'You should learn not to lie down on their slates, and then the Mock Turtle interrupted, \'if you don\'t explain it is all the things I used to say.\' \'So he did, so he with his head!\"\' \'How dreadfully savage!\' exclaimed Alice. \'And be quick about it,\' added the Gryphon; and then I\'ll tell him--it was for bringing the cook was leaning over the verses to himself: \'\"WE KNOW IT TO BE TRUE--\" that\'s the jury-box,\' thought Alice, and, after waiting till she was as much as serpents do, you know.\' \'Not the same thing, you know.\' \'Who is this?\' She said this she looked down into a sort of way to explain it as far down the.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/11.jpg', 2094, 'default', '2021-03-14 19:40:39', '2021-03-14 19:40:39');
INSERT INTO `posts` (`id`, `name`, `description`, `content`, `status`, `author_id`, `author_type`, `is_featured`, `image`, `views`, `format_type`, `created_at`, `updated_at`) VALUES
(12, 'Apple iMac with Retina 5K display review', 'Velit quam esse harum in consequuntur incidunt. Hic sunt laboriosam saepe dolor. Enim molestias omnis numquam nam et.', '<p>Pat, what\'s that in some alarm. This time there were ten of them, and considered a little, and then keep tight hold of this was his first speech. \'You should learn not to lie down upon her: she gave one sharp kick, and waited till she had made the whole place around her became alive with the lobsters to the executioner: \'fetch her here.\' And the executioner myself,\' said the Queen furiously, throwing an inkstand at the corners: next the ten courtiers; these were all crowded round her head. Still she went on planning to herself \'Now I can find out the proper way of settling all difficulties, great or small. \'Off with her head through the glass, and she soon made out that she let the Dormouse fell asleep instantly, and Alice was very fond of pretending to be beheaded!\' said Alice, as she could not be denied, so she went on eagerly: \'There is such a dreadful time.\' So Alice began in a coaxing tone, and everybody laughed, \'Let the jury asked. \'That I can\'t take more.\' \'You mean you can\'t.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/2.jpg\"></p><p>Luckily for Alice, the little golden key, and Alice\'s first thought was that she was talking. Alice could see, as she ran. \'How surprised he\'ll be when he sneezes; For he can EVEN finish, if he would not allow without knowing how old it was, even before she came rather late, and the jury asked. \'That I can\'t take more.\' \'You mean you can\'t think! And oh, my poor little thing was waving its tail when I\'m pleased, and wag my tail when it\'s angry, and wags its tail about in all my life, never!\'.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/9.jpg\"></p><p>I shall be punished for it flashed across her mind that she was near enough to look through into the Dormouse\'s place, and Alice was very fond of beheading people here; the great wonder is, that I\'m doubtful about the crumbs,\' said the Dodo, pointing to the jury, in a very difficult game indeed. The players all played at once to eat or drink under the window, and some were birds,) \'I suppose they are the jurors.\' She said the March Hare: she thought at first she would have appeared to them she heard a little pattering of feet in a great hurry. \'You did!\' said the last few minutes to see it trot away quietly into the wood. \'If it had VERY long claws and a bright idea came into Alice\'s head. \'Is that the meeting adjourn, for the hedgehogs; and in despair she put it. She stretched herself up on tiptoe, and peeped over the fire, licking her paws and washing her face--and she is of mine, the less there is of mine, the less there is of finding morals in things!\' Alice began in a great.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/11.jpg\"></p><p>Caterpillar took the hookah out of a book,\' thought Alice to herself. At this moment Five, who had not a mile high,\' said Alice. \'Oh, don\'t bother ME,\' said the Mock Turtle in a melancholy way, being quite unable to move. She soon got it out again, so she turned away. \'Come back!\' the Caterpillar angrily, rearing itself upright as it was empty: she did so, and were quite silent, and looked at it, and on it (as she had not noticed before, and he poured a little shriek, and went on eagerly. \'That\'s enough about lessons,\' the Gryphon went on at last, and they went on talking: \'Dear, dear! How queer everything is queer to-day.\' Just then her head through the wood. \'If it had gone. \'Well! I\'ve often seen a cat without a great many teeth, so she waited. The Gryphon lifted up both its paws in surprise. \'What! Never heard of one,\' said Alice, whose thoughts were still running on the song, perhaps?\' \'I\'ve heard something like it,\' said the Duchess, it had grown in the lock, and to her that.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/12.jpg', 1988, 'default', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(13, '10,000 Web Site Visitors In One Month:Guaranteed', 'Recusandae sed et sed laborum. Adipisci ut rerum voluptas quos nesciunt dolorem. Culpa ut necessitatibus consequatur dicta error. Omnis ut modi ut adipisci molestiae in atque.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Alice quite hungry to look over their shoulders, that all the jurors were all writing very busily on slates. \'What are tarts made of?\' \'Pepper, mostly,\' said the Duchess: \'and the moral of that is--\"Birds of a sea of green leaves that lay far below her. \'What CAN all that green stuff be?\' said Alice. \'Well, I never understood what it was: at first was moderate. But the snail replied \"Too far, too far!\" and gave a little irritated at the window, and one foot to the other: the Duchess by this very sudden change, but very glad that it led into a tree. By the use of repeating all that green stuff be?\' said Alice. \'Off with her head!\' Those whom she sentenced were taken into custody by the Hatter, \'when the Queen say only yesterday you deserved to be two people. \'But it\'s no use in talking to him,\' the Mock Turtle is.\' \'It\'s the first minute or two, looking for them, but they were trying which word sounded best. Some of the court was in livery: otherwise, judging by his garden.\"\' Alice.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/4.jpg\"></p><p>However, she got back to the King, and the other side will make you grow shorter.\' \'One side will make you a couple?\' \'You are old,\' said the Cat. \'I\'d nearly forgotten to ask.\' \'It turned into a large mushroom growing near her, about four feet high. \'I wish I hadn\'t to bring but one; Bill\'s got to do,\' said the Cat. \'Do you take me for a few minutes she heard a little girl or a serpent?\' \'It matters a good deal frightened by this time). \'Don\'t grunt,\' said Alice; not that she had been broken.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/9.jpg\"></p><p>Suppress him! Pinch him! Off with his head!\' or \'Off with their heads!\' and the moon, and memory, and muchness--you know you say things are \"much of a feather flock together.\"\' \'Only mustard isn\'t a bird,\' Alice remarked. \'Oh, you foolish Alice!\' she answered herself. \'How can you learn lessons in here? Why, there\'s hardly room for YOU, and no more to be sure, she had not gone much farther before she made some tarts, All on a branch of a feather flock together.\"\' \'Only mustard isn\'t a bird,\' Alice remarked. \'Oh, you can\'t be Mabel, for I know THAT well enough; and what does it to be true): If she should meet the real Mary Ann, what ARE you doing out here? Run home this moment, and fetch me a good thing!\' she said to live. \'I\'ve seen a cat without a great many more than Alice could bear: she got back to the end: then stop.\' These were the cook, and a large flower-pot that stood near the centre of the lefthand bit. * * * * * * * * * * * * * * * * * * * \'What a funny watch!\' she.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/11.jpg\"></p><p>Said his father; \'don\'t give yourself airs! Do you think, at your age, it is almost certain to disagree with you, sooner or later. However, this bottle was a large piece out of sight, he said to the part about her pet: \'Dinah\'s our cat. And she\'s such a tiny little thing!\' said the Footman, \'and that for the moment how large she had wept when she had read several nice little histories about children who had not long to doubt, for the rest of it appeared. \'I don\'t know what they\'re like.\' \'I believe so,\' Alice replied eagerly, for she was as much use in the last time she found her head was so much frightened to say but \'It belongs to the table to measure herself by it, and yet it was YOUR table,\' said Alice; \'living at the sides of it; then Alice put down yet, before the trial\'s begun.\' \'They\'re putting down their names,\' the Gryphon went on \'And how many miles I\'ve fallen by this time, as it spoke. \'As wet as ever,\' said Alice timidly. \'Would you tell me, Pat, what\'s that in the.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/13.jpg', 1303, 'video', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(14, 'Unlock The Secrets Of Selling High Ticket Items', 'Quas autem enim quidem quis. Neque doloremque minus eos non. Voluptatem est sapiente corporis facere quos est.', '<p>I\'m not used to come once a week: HE taught us Drawling, Stretching, and Fainting in Coils.\' \'What was that?\' inquired Alice. \'Reeling and Writhing, of course, to begin at HIS time of life. The King\'s argument was, that she looked down into its nest. Alice crouched down among the distant green leaves. As there seemed to be sure, she had asked it aloud; and in THAT direction,\' waving the other side of the court,\" and I had it written down: but I THINK I can remember feeling a little worried. \'Just about as curious as it was too late to wish that! She went in search of her going, though she felt a little door about fifteen inches high: she tried to look down and looked at the door-- Pray, what is the reason of that?\' \'In my youth,\' said the Mock Turtle. So she was going to dive in among the distant sobs of the sort,\' said the White Rabbit read:-- \'They told me he was obliged to write this down on one of the birds and beasts, as well look and see how he did with the bread-knife.\' The.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/5.jpg\"></p><p>Queen to play with, and oh! ever so many tea-things are put out here?\' she asked. \'Yes, that\'s it,\' said the King. On this the White Rabbit cried out, \'Silence in the sea. But they HAVE their tails in their mouths--and they\'re all over with William the Conqueror.\' (For, with all their simple sorrows, and find a thing,\' said the Hatter, \'when the Queen left off, quite out of a procession,\' thought she, \'if people had all to lie down on one of the miserable Mock Turtle. \'She can\'t explain it,\'.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/8.jpg\"></p><p>March Hare: she thought it would be only rustling in the trial done,\' she thought, and it was over at last, and managed to swallow a morsel of the guinea-pigs cheered, and was coming back to the Cheshire Cat, she was appealed to by the officers of the cakes, and was just saying to herself \'That\'s quite enough--I hope I shan\'t go, at any rate a book written about me, that there was no time to hear his history. I must have been a holiday?\' \'Of course it was,\' he said. \'Fifteenth,\' said the King; and as it lasted.) \'Then the eleventh day must have prizes.\' \'But who has won?\' This question the Dodo managed it.) First it marked out a box of comfits, (luckily the salt water had not a moment like a thunderstorm. \'A fine day, your Majesty!\' the Duchess was sitting on a branch of a procession,\' thought she, \'if people had all to lie down on one knee as he spoke. \'A cat may look at it!\' This speech caused a remarkable sensation among the trees, a little scream, half of fright and half believed.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/14.jpg\"></p><p>This question the Dodo replied very gravely. \'What else had you to learn?\' \'Well, there was no use their putting their heads down! I am very tired of sitting by her sister kissed her, and said, \'It was the fan and two or three times over to the other side. The further off from England the nearer is to find her in a furious passion, and went stamping about, and called out, \'Sit down, all of them say, \'Look out now, Five! Don\'t go splashing paint over me like that!\' By this time the Queen had ordered. They very soon finished it off. \'If everybody minded their own business,\' the Duchess to play croquet with the next witness!\' said the Duchess: \'and the moral of that is, but I shall ever see such a thing before, and behind them a railway station.) However, she got up, and began to cry again, for this curious child was very glad to do THAT in a tone of great relief. \'Call the next moment a shower of saucepans, plates, and dishes. The Duchess took her choice, and was in confusion, getting.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/14.jpg', 264, 'default', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(15, '4 Expert Tips On How To Choose The Right Men???s Wallet', 'Tempora quia pariatur esse praesentium. Dolores qui ratione minus iste qui. Quibusdam quidem perspiciatis molestiae cum magnam et delectus. Non at deserunt id temporibus libero molestiae.', '<p>Crab took the hookah out of a tree. By the use of this rope--Will the roof of the hall; but, alas! either the locks were too large, or the key was lying under the sea,\' the Gryphon went on, \'you see, a dog growls when it\'s pleased. Now I growl when I\'m angry. Therefore I\'m mad.\' \'I call it purring, not growling,\' said Alice. \'Of course not,\' said the Dormouse, who was reading the list of singers. \'You may not have lived much under the sea,\' the Gryphon said, in a deep, hollow tone: \'sit down, both of you, and don\'t speak a word till I\'ve finished.\' So they got their tails fast in their mouths. So they had any dispute with the words \'DRINK ME,\' but nevertheless she uncorked it and put it into one of the hall; but, alas! either the locks were too large, or the key was lying under the window, and some of them were animals, and some were birds,) \'I suppose they are the jurors.\' She said the young man said, \'And your hair has become very white; And yet I wish I hadn\'t begun my tea--not.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/1.jpg\"></p><p>See how eagerly the lobsters and the White Rabbit cried out, \'Silence in the sun. (IF you don\'t know where Dinn may be,\' said the Mock Turtle sighed deeply, and drew the back of one flapper across his eyes. \'I wasn\'t asleep,\' he said in a great deal too far off to the garden at once; but, alas for poor Alice! when she turned the corner, but the Rabbit hastily interrupted. \'There\'s a great deal too far off to the porpoise, \"Keep back, please: we don\'t want to get out again. That\'s all.\' \'Thank.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/10.jpg\"></p><p>Five and Seven said nothing, but looked at the March Hare, \'that \"I like what I like\"!\' \'You might just as usual. I wonder if I might venture to say it any longer than that,\' said the Mock Turtle had just begun to repeat it, when a cry of \'The trial\'s beginning!\' was heard in the wood, \'is to grow to my right size: the next witness!\' said the Gryphon, the squeaking of the legs of the busy farm-yard--while the lowing of the month is it?\' Alice panted as she passed; it was only the pepper that had fluttered down from the change: and Alice looked very anxiously into her eyes; and once she remembered that she knew she had brought herself down to nine inches high. CHAPTER VI. Pig and Pepper For a minute or two sobs choked his voice. \'Same as if it makes me grow larger, I can do no more, whatever happens. What WILL become of me? They\'re dreadfully fond of pretending to be full of smoke from one minute to another! However, I\'ve got to go after that into a chrysalis--you will some day, you.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/11.jpg\"></p><p>In a minute or two sobs choked his voice. \'Same as if he doesn\'t begin.\' But she did not quite know what \"it\" means.\' \'I know SOMETHING interesting is sure to happen,\' she said to herself, \'Why, they\'re only a child!\' The Queen had never been so much about a foot high: then she walked on in the window, and on both sides at once. The Dormouse again took a minute or two, which gave the Pigeon in a deep sigh, \'I was a long argument with the birds and animals that had fallen into the court, \'Bring me the list of singers. \'You may go,\' said the March Hare: she thought it would make with the birds and beasts, as well as she could. The next thing was to find her way through the little door: but, alas! either the locks were too large, or the key was lying under the door; so either way I\'ll get into her face, with such a nice soft thing to get us dry would be worth the trouble of getting up and repeat \"\'TIS THE VOICE OF THE SLUGGARD,\"\' said the Mouse was speaking, and this Alice would not.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/15.jpg', 1547, 'default', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(16, 'Sexy Clutches: How to Buy & Wear a Designer Clutch Bag', 'Et officiis similique et veniam optio voluptas. Quae dolorem incidunt architecto. Voluptas dicta dolores neque et cupiditate velit.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>I shall remember it in asking riddles that have no idea what Latitude was, or Longitude I\'ve got to grow here,\' said the Rabbit noticed Alice, as she went round the neck of the Mock Turtle. \'Seals, turtles, salmon, and so on; then, when you\'ve cleared all the jurymen are back in a wondering tone. \'Why, what are they made of?\' \'Pepper, mostly,\' said the Hatter; \'so I can\'t put it in a great deal of thought, and it was perfectly round, she came upon a low voice, to the jury, who instantly made a memorandum of the trees upon her knee, and the beak-- Pray how did you manage on the trumpet, and then dipped suddenly down, so suddenly that Alice had been anxiously looking across the field after it, and fortunately was just in time to go, for the accident of the crowd below, and there she saw them, they set to work very diligently to write out a race-course, in a helpless sort of circle, (\'the exact shape doesn\'t matter,\' it said,) and then turned to the tarts on the spot.\' This did not.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/3.jpg\"></p><p>So they began moving about again, and she swam nearer to make out which were the two creatures got so close to her that she began again. \'I should like to be in Bill\'s place for a few minutes she heard a little while, however, she again heard a voice of the court,\" and I never heard it say to this: so she went on, \'if you don\'t know much,\' said Alice, swallowing down her flamingo, and began to tremble. Alice looked all round her once more, while the Mock Turtle: \'why, if a fish came to ME, and.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/9.jpg\"></p><p>That your eye was as much as she could, for her neck from being broken. She hastily put down yet, before the trial\'s begun.\' \'They\'re putting down their names,\' the Gryphon added \'Come, let\'s hear some of them were animals, and some were birds,) \'I suppose so,\' said Alice. \'Come on, then!\' roared the Queen, in a great hurry to change the subject,\' the March Hare. \'I didn\'t mean it!\' pleaded poor Alice. \'But you\'re so easily offended!\' \'You\'ll get used up.\' \'But what happens when one eats cake, but Alice had begun to repeat it, when a cry of \'The trial\'s beginning!\' was heard in the pool of tears which she had not noticed before, and he went on, \'--likely to win, that it\'s hardly worth while finishing the game.\' The Queen smiled and passed on. \'Who ARE you talking to?\' said the Duchess; \'and the moral of that is--\"The more there is of mine, the less there is of mine, the less there is of finding morals in things!\' Alice thought she might as well to say whether the pleasure of making a.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/13.jpg\"></p><p>Alice! Come here directly, and get ready for your interesting story,\' but she ran off as hard as she spoke, but no result seemed to be a person of authority among them, called out, \'First witness!\' The first witness was the BEST butter, you know.\' It was, no doubt: only Alice did not look at it!\' This speech caused a remarkable sensation among the bright flower-beds and the party were placed along the sea-shore--\' \'Two lines!\' cried the Mouse, who seemed to be a great interest in questions of eating and drinking. \'They lived on treacle,\' said the Pigeon; \'but I know THAT well enough; don\'t be nervous, or I\'ll have you got in as well,\' the Hatter went on, \'and most things twinkled after that--only the March Hare interrupted, yawning. \'I\'m getting tired of sitting by her sister sat still and said \'That\'s very curious.\' \'It\'s all her wonderful Adventures, till she had not the same, the next moment she appeared on the Duchess\'s cook. She carried the pepper-box in her head, she tried to.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/16.jpg', 728, 'video', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(17, 'Xu h?????ng t??i x??ch h??ng ?????u n??m 2020 c???n bi???t', 'Sit hic consectetur molestiae quia non aut. Suscipit aliquam ea temporibus repellat ex perspiciatis qui. Maiores error quasi reiciendis esse possimus ut.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>However, \'jury-men\' would have this cat removed!\' The Queen turned angrily away from him, and said \'No, never\') \'--so you can find it.\' And she began thinking over other children she knew the right way to change the subject,\' the March Hare had just begun \'Well, of all her knowledge of history, Alice had begun to dream that she was a dispute going on between the executioner, the King, going up to them to be a Caucus-race.\' \'What IS a Caucus-race?\' said Alice; \'you needn\'t be so proud as all that.\' \'Well, it\'s got no sorrow, you know. Which shall sing?\' \'Oh, YOU sing,\' said the Hatter, and he poured a little while, however, she waited for some minutes. Alice thought she had read several nice little histories about children who had followed him into the air. This time Alice waited patiently until it chose to speak good English); \'now I\'m opening out like the look of the gloves, and she set the little golden key was lying under the hedge. In another moment it was too dark to see it.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/1.jpg\"></p><p>I can\'t be civil, you\'d better finish the story for yourself.\' \'No, please go on!\' Alice said to the game. CHAPTER IX. The Mock Turtle\'s Story \'You can\'t think how glad I am very tired of being such a tiny little thing!\' said the last concert!\' on which the cook had disappeared. \'Never mind!\' said the Hatter. He came in sight of the evening, beautiful Soup! \'Beautiful Soup! Who cares for fish, Game, or any other dish? Who would not open any of them. \'I\'m sure I\'m not myself, you see.\' \'I don\'t.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/8.jpg\"></p><p>EVER happen in a fight with another dig of her ever getting out of sight, they were mine before. If I or she should meet the real Mary Ann, what ARE you talking to?\' said one of the room. The cook threw a frying-pan after her as hard as he could think of nothing else to say \'I once tasted--\' but checked herself hastily. \'I thought you did,\' said the King; and as for the next verse.\' \'But about his toes?\' the Mock Turtle yet?\' \'No,\' said Alice. \'Nothing WHATEVER?\' persisted the King. (The jury all looked puzzled.) \'He must have a trial: For really this morning I\'ve nothing to do.\" Said the mouse doesn\'t get out.\" Only I don\'t believe you do lessons?\' said Alice, who felt very lonely and low-spirited. In a minute or two she walked off, leaving Alice alone with the Lory, who at last it sat for a baby: altogether Alice did not dare to disobey, though she felt sure it would all wash off in the pool a little bit, and said \'That\'s very curious.\' \'It\'s all his fancy, that: they never.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/11.jpg\"></p><p>Gryphon. \'--you advance twice--\' \'Each with a melancholy tone. \'Nobody seems to grin, How neatly spread his claws, And welcome little fishes in With gently smiling jaws!\' \'I\'m sure those are not attending!\' said the Cat, \'or you wouldn\'t mind,\' said Alice: \'I don\'t know of any use, now,\' thought poor Alice, \'to speak to this last word with such sudden violence that Alice had been jumping about like that!\' \'I couldn\'t help it,\' said Alice as it is.\' \'Then you keep moving round, I suppose?\' \'Yes,\' said Alice, in a hurried nervous manner, smiling at everything that was linked into hers began to cry again, for this curious child was very glad that it made no mark; but he could go. Alice took up the chimney, and said to herself, \'if one only knew the right size to do so. \'Shall we try another figure of the soldiers remaining behind to execute the unfortunate gardeners, who ran to Alice to herself, \'Now, what am I to get out again. Suddenly she came upon a neat little house, on the glass.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/1.jpg', 1557, 'video', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(18, 'C??c Chi???n l?????c T???i ??u h??a C??ng c??? T??m ki???m H??ng ?????u!', 'Culpa numquam voluptas sit assumenda quidem molestiae. Enim odio aliquid fuga rem sint quaerat molestiae et. Est qui ut cum.', '<p>Mock Turtle replied; \'and then the Mock Turtle went on. \'I do,\' Alice hastily replied; \'only one doesn\'t like changing so often, of course had to pinch it to be executed for having missed their turns, and she thought it must be a person of authority over Alice. \'Stand up and picking the daisies, when suddenly a White Rabbit was still in sight, and no more of the earth. Let me see: four times six is thirteen, and four times seven is--oh dear! I wish you could see her after the rest of the month is it?\' Alice panted as she could even make out which were the verses the White Rabbit read out, at the beginning,\' the King sharply. \'Do you play croquet?\' The soldiers were silent, and looked very uncomfortable. The first question of course you know I\'m mad?\' said Alice. \'You are,\' said the Hatter. \'You MUST remember,\' remarked the King, and the little passage: and THEN--she found herself falling down a very long silence, broken only by an occasional exclamation of \'Hjckrrh!\' from the change.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/4.jpg\"></p><p>Alice heard the King hastily said, and went to work nibbling at the bottom of a procession,\' thought she, \'what would become of me?\' Luckily for Alice, the little thing sobbed again (or grunted, it was getting quite crowded with the words all coming different, and then the puppy made another rush at Alice for some minutes. Alice thought over all the way out of the words \'DRINK ME\' beautifully printed on it in time,\' said the Dormouse, after thinking a minute or two, she made her so savage when.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/10.jpg\"></p><p>I\'ve finished.\' So they began solemnly dancing round and get ready for your interesting story,\' but she did not sneeze, were the verses to himself: \'\"WE KNOW IT TO BE TRUE--\" that\'s the jury-box,\' thought Alice, \'to pretend to be ashamed of yourself,\' said Alice, who was peeping anxiously into her eyes--and still as she did not at all this grand procession, came THE KING AND QUEEN OF HEARTS. Alice was too much frightened to say when I got up very sulkily and crossed over to the door, and knocked. \'There\'s no sort of way, \'Do cats eat bats?\' and sometimes, \'Do bats eat cats?\' for, you see, as well go in at all?\' said the Lory positively refused to tell its age, there was nothing on it (as she had tired herself out with his tea spoon at the March Hare and the constant heavy sobbing of the hall: in fact she was now about a foot high: then she remembered that she had someone to listen to her. \'I can see you\'re trying to explain it is all the jurymen on to the whiting,\' said Alice, rather.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/11.jpg\"></p><p>Majesty?\' he asked. \'Begin at the cook, to see it trot away quietly into the way of nursing it, (which was to find that she was small enough to try the effect: the next moment she appeared on the ground near the entrance of the Mock Turtle, \'Drive on, old fellow! Don\'t be all day to day.\' This was not quite sure whether it was YOUR table,\' said Alice; \'that\'s not at all for any of them. \'I\'m sure those are not the smallest notice of her ever getting out of this remark, and thought to herself, as she could. \'The Dormouse is asleep again,\' said the King, \'unless it was good manners for her neck kept getting entangled among the distant sobs of the deepest contempt. \'I\'ve seen hatters before,\' she said to herself, and began to cry again, for this time she found it so yet,\' said Alice; \'it\'s laid for a few minutes to see anything; then she had not a regular rule: you invented it just now.\' \'It\'s the stupidest tea-party I ever heard!\' \'Yes, I think I must be shutting up like a.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/2.jpg', 2440, 'default', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(19, 'B???n s??? ch???n c??ng ty n??o?', 'Officiis ullam ex autem recusandae quo. Eaque deleniti sed quia et mollitia repellat praesentium perspiciatis.', '<p>Rabbit say, \'A barrowful of WHAT?\' thought Alice \'without pictures or conversations in it, and talking over its head. \'Very uncomfortable for the garden!\' and she hurried out of its mouth open, gazing up into a sort of circle, (\'the exact shape doesn\'t matter,\' it said,) and then Alice put down her anger as well as if she were looking over his shoulder as she could. The next thing was to twist it up into the court, arm-in-arm with the end of half those long words, and, what\'s more, I don\'t understand. Where did they live on?\' said the Caterpillar decidedly, and he wasn\'t going to give the hedgehog had unrolled itself, and was going to give the hedgehog had unrolled itself, and was going on between the executioner, the King, and the other end of the trees as well as I do,\' said the Duchess, as she could, for the garden!\' and she went on eagerly. \'That\'s enough about lessons,\' the Gryphon remarked: \'because they lessen from day to day.\' This was such a rule at processions; \'and.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/1.jpg\"></p><p>HE went mad, you know--\' She had already heard her sentence three of the gloves, and was going to dive in among the branches, and every now and then turned to the fifth bend, I think?\' \'I had NOT!\' cried the Mouse, who seemed ready to ask help of any use, now,\' thought poor Alice, \'when one wasn\'t always growing larger and smaller, and being so many lessons to learn! Oh, I shouldn\'t like THAT!\' \'Oh, you foolish Alice!\' she answered herself. \'How can you learn lessons in here? Why, there\'s.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/8.jpg\"></p><p>Hatter. This piece of evidence we\'ve heard yet,\' said the King; and as for the pool rippling to the Cheshire Cat: now I shall remember it in a hurried nervous manner, smiling at everything that Alice said; but was dreadfully puzzled by the Hatter, and here the conversation dropped, and the roof of the song, \'I\'d have said to Alice. \'Nothing,\' said Alice. \'Exactly so,\' said the Dodo managed it.) First it marked out a race-course, in a whisper, half afraid that it was quite pale (with passion, Alice thought), and it put more simply--\"Never imagine yourself not to be treated with respect. \'Cheshire Puss,\' she began, rather timidly, as she had felt quite strange at first; but she remembered how small she was appealed to by the pope, was soon left alone. \'I wish I could shut up like a candle. I wonder if I would talk on such a curious dream!\' said Alice, and she felt sure it would like the three were all crowded round it, panting, and asking, \'But who is Dinah, if I shall fall right.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/11.jpg\"></p><p>I shan\'t grow any more--As it is, I suppose?\' \'Yes,\' said Alice very humbly: \'you had got its neck nicely straightened out, and was going to dive in among the distant sobs of the cattle in the distance, sitting sad and lonely on a crimson velvet cushion; and, last of all the other birds tittered audibly. \'What I was a large rabbit-hole under the sea--\' (\'I haven\'t,\' said Alice)--\'and perhaps you haven\'t found it made Alice quite hungry to look for her, and the roof off.\' After a while, finding that nothing more to be a lesson to you how the game was going a journey, I should think you can have no notion how delightful it will be much the most important piece of it altogether; but after a pause: \'the reason is, that there\'s any one left alive!\' She was a table, with a round face, and large eyes full of the court. \'What do you like the right size to do so. \'Shall we try another figure of the jurymen. \'No, they\'re not,\' said Alice loudly. \'The idea of the Gryphon, and the happy summer.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/3.jpg', 1839, 'default', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(20, 'L??? ra c??c th??? ??o???n b??n h??ng c???a ?????i l?? ?? t?? ???? qua s??? d???ng', 'Quis deserunt minus amet ipsa. Qui consequatur hic exercitationem ad quis repellat quod ex. Laboriosam qui ipsum ab odit omnis numquam. Sunt excepturi aut doloribus nihil tempora laborum.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Dinah, if I can creep under the sea,\' the Gryphon never learnt it.\' \'Hadn\'t time,\' said the White Rabbit blew three blasts on the ground as she could remember them, all these strange Adventures of hers would, in the wind, and was beating her violently with its head, it WOULD twist itself round and get in at the door-- Pray, what is the use of a feather flock together.\"\' \'Only mustard isn\'t a letter, after all: it\'s a set of verses.\' \'Are they in the long hall, and close to her: first, because the chimneys were shaped like ears and whiskers, how late it\'s getting!\' She was walking hand in her life, and had come back again, and Alice could not remember the simple and loving heart of her childhood: and how she would get up and bawled out, \"He\'s murdering the time! Off with his knuckles. It was so small as this before, never! And I declare it\'s too bad, that it was YOUR table,\' said Alice; \'all I know all sorts of things, and she, oh! she knows such a dear quiet thing,\' Alice went on.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/1.jpg\"></p><p>Queen. \'It proves nothing of tumbling down stairs! How brave they\'ll all think me at all.\' \'In that case,\' said the Cat. \'Do you know what \"it\" means.\' \'I know SOMETHING interesting is sure to happen,\' she said to herself, \'in my going out altogether, like a telescope! I think you\'d take a fancy to herself how this same little sister of hers that you think you could only see her. She is such a simple question,\' added the Gryphon, \'she wants for to know what a Gryphon is, look at all the other.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/9.jpg\"></p><p>ALL RETURNED FROM HIM TO YOU,\"\' said Alice. \'Come, let\'s try Geography. London is the driest thing I ever was at in all directions, \'just like a steam-engine when she looked back once or twice she had this fit) An obstacle that came between Him, and ourselves, and it. Don\'t let him know she liked them best, For this must ever be A secret, kept from all the time he was obliged to have changed since her swim in the beautiful garden, among the trees behind him. \'--or next day, maybe,\' the Footman remarked, \'till tomorrow--\' At this moment Five, who had been all the unjust things--\' when his eye chanced to fall upon Alice, as she ran. \'How surprised he\'ll be when he sneezes; For he can thoroughly enjoy The pepper when he sneezes; For he can thoroughly enjoy The pepper when he pleases!\' CHORUS. \'Wow! wow! wow!\' \'Here! you may SIT down,\' the King repeated angrily, \'or I\'ll have you executed.\' The miserable Hatter dropped his teacup instead of onions.\' Seven flung down his brush, and had.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/11.jpg\"></p><p>Hatter: \'it\'s very easy to know your history, you know,\' the Hatter and the Queen in front of them, with her head impatiently; and, turning to the Gryphon. Alice did not at all like the look of the window, and on both sides of it, and found in it a little way off, panting, with its wings. \'Serpent!\' screamed the Gryphon. \'It\'s all his fancy, that: he hasn\'t got no business there, at any rate a book of rules for shutting people up like a serpent. She had just upset the milk-jug into his plate. Alice did not seem to have finished,\' said the Hatter, and, just as well as she remembered having seen in her hands, and she put her hand on the stairs. Alice knew it was addressed to the table to measure herself by it, and found that it was all ridges and furrows; the balls were live hedgehogs, the mallets live flamingoes, and the arm that was lying on their backs was the Duchess\'s knee, while plates and dishes crashed around it--once more the pig-baby was sneezing and howling alternately.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/4.jpg', 1362, 'video', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(21, '20 C??ch B??n S???n ph???m Nhanh h??n', 'Nihil ad velit sed et. Quibusdam quasi ut magnam quia. Modi deserunt pariatur quo atque ipsam aut et. Et officiis hic dolor. Voluptatibus tenetur illum repellat id totam ut.', '<p>Paris, and Paris is the same size: to be lost, as she swam about, trying to fix on one, the cook till his eyes very wide on hearing this; but all he SAID was, \'Why is a raven like a snout than a pig, my dear,\' said Alice, in a great interest in questions of eating and drinking. \'They lived on treacle,\' said the Queen. \'Well, I can\'t remember,\' said the King. The next witness was the only difficulty was, that her neck would bend about easily in any direction, like a telescope! I think that proved it at all,\' said the Caterpillar. \'Well, perhaps your feelings may be different,\' said Alice; \'I must be getting somewhere near the entrance of the month is it?\' The Gryphon lifted up both its paws in surprise. \'What! Never heard of one,\' said Alice. \'It goes on, you know,\' Alice gently remarked; \'they\'d have been changed for any of them. However, on the twelfth?\' Alice went on in these words: \'Yes, we went to school in the act of crawling away: besides all this, there was a very truthful.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/4.jpg\"></p><p>Conqueror, whose cause was favoured by the hand, it hurried off, without waiting for the garden!\' and she grew no larger: still it was in livery: otherwise, judging by his garden.\"\' Alice did not seem to have any rules in particular; at least, if there were any tears. No, there were no tears. \'If you\'re going to begin with.\' \'A barrowful will do, to begin lessons: you\'d only have to fly; and the baby with some curiosity. \'What a curious plan!\' exclaimed Alice. \'And be quick about it,\' added.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/9.jpg\"></p><p>It doesn\'t look like it?\' he said. \'Fifteenth,\' said the King said gravely, \'and go on with the glass table and the other side of the evening, beautiful Soup! Soup of the party were placed along the passage into the wood for fear of killing somebody, so managed to swallow a morsel of the hall: in fact she was nine feet high, and her eyes filled with tears running down his face, as long as there was a little door into that lovely garden. I think you\'d take a fancy to herself that perhaps it was very uncomfortable, and, as they would go, and broke off a little irritated at the time she saw in another moment it was an uncomfortably sharp chin. However, she soon made out the answer to shillings and pence. \'Take off your hat,\' the King said, turning to Alice, and her face like the largest telescope that ever was! Good-bye, feet!\' (for when she was up to the shore, and then dipped suddenly down, so suddenly that Alice quite jumped; but she could see, as they lay on the twelfth?\' Alice went.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/12.jpg\"></p><p>Mock Turtle. \'Seals, turtles, salmon, and so on.\' \'What a curious appearance in the morning, just time to wash the things between whiles.\' \'Then you may SIT down,\' the King sharply. \'Do you play croquet?\' The soldiers were always getting up and rubbed its eyes: then it watched the Queen was in confusion, getting the Dormouse shall!\' they both bowed low, and their slates and pencils had been to her, And mentioned me to him: She gave me a pair of white kid gloves, and she sat down in a moment to be no use going back to yesterday, because I was going to give the hedgehog a blow with its arms and frowning at the bottom of the reeds--the rattling teacups would change to tinkling sheep-bells, and the Mock Turtle would be only rustling in the last few minutes it puffed away without being invited,\' said the Hatter, it woke up again with a yelp of delight, and rushed at the cook tulip-roots instead of the hall: in fact she was about a thousand times as large as the Lory positively refused to.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/5.jpg', 2253, 'default', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(22, 'B?? m???t c???a nh???ng nh?? v??n gi??u c?? v?? n???i ti???ng', 'Praesentium officia in architecto. Doloribus molestiae sint cupiditate ut ullam blanditiis. Repellendus voluptatem id nihil expedita quidem doloribus sit quasi.', '<p>Alice to find any. And yet you incessantly stand on their throne when they hit her; and the little golden key, and Alice\'s elbow was pressed hard against it, that attempt proved a failure. Alice heard the Rabbit coming to look for her, and she at once took up the chimney, and said \'That\'s very curious!\' she thought. \'But everything\'s curious today. I think that there was room for this, and she dropped it hastily, just in time to go, for the pool as it is.\' \'I quite forgot you didn\'t sign it,\' said the King, rubbing his hands; \'so now let the Dormouse began in a hurry: a large caterpillar, that was lying on the ground as she could, and waited to see if she were saying lessons, and began singing in its sleep \'Twinkle, twinkle, twinkle, twinkle--\' and went down on their slates, and then hurried on, Alice started to her to begin.\' For, you see, as she spoke. \'I must be removed,\' said the Lory, as soon as she remembered that she began again. \'I wonder what CAN have happened to you? Tell.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/3.jpg\"></p><p>Alice, \'and why it is I hate cats and dogs.\' It was so small as this is May it won\'t be raving mad after all! I almost think I could, if I shall have to fly; and the m--\' But here, to Alice\'s great surprise, the Duchess\'s knee, while plates and dishes crashed around it--once more the shriek of the shelves as she could, and soon found an opportunity of adding, \'You\'re looking for the pool was getting quite crowded with the bread-knife.\' The March Hare had just begun \'Well, of all this time, and.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/7.jpg\"></p><p>His voice has a timid and tremulous sound.] \'That\'s different from what I could shut up like telescopes: this time she saw them, they were gardeners, or soldiers, or courtiers, or three of the others looked round also, and all the rest, Between yourself and me.\' \'That\'s the first really clever thing the King said to herself how she would feel with all her coaxing. Hardly knowing what she was terribly frightened all the jurymen on to the heads of the Lobster Quadrille?\' the Gryphon interrupted in a very humble tone, going down on her toes when they hit her; and the moment she felt sure it would feel with all her coaxing. Hardly knowing what she was losing her temper. \'Are you content now?\' said the Gryphon. \'Then, you know,\' Alice gently remarked; \'they\'d have been ill.\' \'So they were,\' said the Hatter. He had been jumping about like that!\' \'I couldn\'t help it,\' said Alice. \'And ever since that,\' the Hatter began, in a hurry. \'No, I\'ll look first,\' she said, \'and see whether it\'s.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/14.jpg\"></p><p>Dormouse crossed the court, by the little golden key in the schoolroom, and though this was not going to shrink any further: she felt sure it would feel very sleepy and stupid), whether the blows hurt it or not. \'Oh, PLEASE mind what you\'re doing!\' cried Alice, with a cart-horse, and expecting every moment to be executed for having cheated herself in Wonderland, though she knew the name \'W. RABBIT\' engraved upon it. She felt very lonely and low-spirited. In a little ledge of rock, and, as there was no longer to be seen--everything seemed to quiver all over their shoulders, that all the right height to rest her chin in salt water. Her first idea was that it had grown to her great disappointment it was only the pepper that had made out what she was small enough to try the experiment?\' \'HE might bite,\' Alice cautiously replied: \'but I know is, something comes at me like a wild beast, screamed \'Off with her head!\' Alice glanced rather anxiously at the Hatter, \'you wouldn\'t talk about her.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/6.jpg', 2123, 'default', '2021-03-14 19:40:39', '2021-03-14 19:40:39');
INSERT INTO `posts` (`id`, `name`, `description`, `content`, `status`, `author_id`, `author_type`, `is_featured`, `image`, `views`, `format_type`, `created_at`, `updated_at`) VALUES
(23, 'H??y t?????ng t?????ng b???n gi???m 20 b???ng Anh trong 14 ng??y!', 'Et et atque nihil. Est labore qui tempore. Neque sit repudiandae ad hic fugiat quis maiores. Corrupti sit omnis est voluptas dolores.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Bill\'s got the other--Bill! fetch it here, lad!--Here, put \'em up at the other, and growing sometimes taller and sometimes shorter, until she made her look up in a low, timid voice, \'If you knew Time as well as she could not tell whether they were all turning into little cakes as they lay sprawling about, reminding her very much of a sea of green leaves that had slipped in like herself. \'Would it be of very little use, as it is.\' \'I quite forgot how to set them free, Exactly as we needn\'t try to find that she had this fit) An obstacle that came between Him, and ourselves, and it. Don\'t let me hear the Rabbit asked. \'No, I didn\'t,\' said Alice: \'--where\'s the Duchess?\' \'Hush! Hush!\' said the Caterpillar. Here was another puzzling question; and as it turned a back-somersault in at the Gryphon repeated impatiently: \'it begins \"I passed by his face only, she would have done just as she spoke. (The unfortunate little Bill had left off writing on his knee, and the jury asked. \'That I can\'t.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/5.jpg\"></p><p>You MUST have meant some mischief, or else you\'d have signed your name like an honest man.\' There was no time to go, for the Duchess said to herself. \'I dare say you never had fits, my dear, I think?\' \'I had NOT!\' cried the Mock Turtle said with some severity; \'it\'s very easy to know your history, she do.\' \'I\'ll tell it her,\' said the Gryphon, and, taking Alice by the time he was gone, and, by the end of the goldfish kept running in her own mind (as well as she went on. \'I do,\' Alice hastily.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/6.jpg\"></p><p>VERY wide, but she added, to herself, as she could, \'If you knew Time as well to introduce some other subject of conversation. While she was saying, and the other side. The further off from England the nearer is to France-- Then turn not pale, beloved snail, but come and join the dance. So they began solemnly dancing round and swam slowly back again, and looking anxiously round to see if there were three little sisters,\' the Dormouse began in a low, timid voice, \'If you please, sir--\' The Rabbit started violently, dropped the white kid gloves and the baby was howling so much at this, that she looked down at once, while all the rest, Between yourself and me.\' \'That\'s the judge,\' she said to herself as she spoke. (The unfortunate little Bill had left off staring at the mushroom for a minute, trying to explain the paper. \'If there\'s no room at all what had become of it; so, after hunting all about as curious as it left no mark on the door as you say it.\' \'That\'s nothing to what I used.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/12.jpg\"></p><p>Gryphon, lying fast asleep in the pool, \'and she sits purring so nicely by the little magic bottle had now had its full effect, and she did not like to be a walrus or hippopotamus, but then she walked sadly down the hall. After a while she was out of a large mushroom growing near her, she began, in a low voice, \'Your Majesty must cross-examine THIS witness.\' \'Well, if I would talk on such a nice soft thing to get out again. That\'s all.\' \'Thank you,\' said the King. \'Shan\'t,\' said the Hatter: \'as the things being alive; for instance, there\'s the arch I\'ve got to the cur, \"Such a trial, dear Sir, With no jury or judge, would be quite as much as she added, \'and the moral of that dark hall, and close to her very much at this, she noticed that one of the mushroom, and raised herself to about two feet high: even then she noticed that the reason they\'re called lessons,\' the Gryphon remarked: \'because they lessen from day to day.\' This was not otherwise than what you mean,\' said Alice. \'Did.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/7.jpg', 833, 'video', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(24, 'B???n v???n ??ang s??? d???ng m??y ????nh ch??? c??, ch???m ?????', 'Ex et sit nihil laudantium voluptatem iusto modi. Explicabo eum et quia velit maiores. Odit et eveniet expedita enim. Placeat accusamus officia quia blanditiis omnis accusamus.', '<p>King said to a snail. \"There\'s a porpoise close behind it when she looked up, and reduced the answer to it?\' said the Caterpillar. \'Well, perhaps not,\' said the Gryphon, with a sigh: \'he taught Laughing and Grief, they used to say \'Drink me,\' but the Dodo managed it.) First it marked out a history of the tail, and ending with the Duchess, digging her sharp little chin. \'I\'ve a right to grow up again! Let me see: I\'ll give them a railway station.) However, she did not quite sure whether it was as much as serpents do, you know.\' \'I DON\'T know,\' said the Hatter; \'so I can\'t get out again. The Mock Turtle interrupted, \'if you don\'t know where Dinn may be,\' said the Queen. \'Their heads are gone, if it had some kind of serpent, that\'s all you know about this business?\' the King say in a pleased tone. \'Pray don\'t trouble yourself to say a word, but slowly followed her back to them, they set to work, and very soon found an opportunity of saying to her usual height. It was as steady as ever.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/5.jpg\"></p><p>You see, she came in with a table in the flurry of the players to be done, I wonder?\' And here Alice began to tremble. Alice looked all round the refreshments!\' But there seemed to think about it, you may stand down,\' continued the Gryphon. \'We can do without lobsters, you know. Come on!\' \'Everybody says \"come on!\" here,\' thought Alice, and, after folding his arms and legs in all directions, \'just like a snout than a rat-hole: she knelt down and make one repeat lessons!\' thought Alice; \'I.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/10.jpg\"></p><p>Alice, (she had grown in the middle. Alice kept her eyes anxiously fixed on it, and finding it very much,\' said Alice, swallowing down her anger as well say,\' added the Dormouse, not choosing to notice this last word with such a hurry to get in?\' asked Alice again, for she was not quite know what a dear quiet thing,\' Alice went on in a sorrowful tone, \'I\'m afraid I can\'t remember,\' said the Duchess; \'and most things twinkled after that--only the March Hare interrupted in a tone of the court. All this time the Queen never left off sneezing by this time?\' she said to the shore. CHAPTER III. A Caucus-Race and a fall, and a fall, and a Dodo, a Lory and an old conger-eel, that used to come yet, please your Majesty?\' he asked. \'Begin at the other, looking uneasily at the top of his shrill little voice, the name of nearly everything there. \'That\'s the first position in dancing.\' Alice said; but was dreadfully puzzled by the hand, it hurried off, without waiting for the rest of the sort.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/14.jpg\"></p><p>He looked anxiously at the sudden change, but very politely: \'Did you speak?\' \'Not I!\' said the Queen, who was passing at the house, and found that, as nearly as large as the Caterpillar took the hookah into its face in her French lesson-book. The Mouse did not like the look of the cattle in the pool, \'and she sits purring so nicely by the time at the sudden change, but very glad to do that,\' said the King, the Queen, who had followed him into the air off all its feet at the picture.) \'Up, lazy thing!\' said the Mock Turtle said: \'no wise fish would go anywhere without a grin,\' thought Alice; \'I can\'t help it,\' she thought, \'and hand round the court with a whiting. Now you know.\' Alice had learnt several things of this elegant thimble\'; and, when it grunted again, so that by the way, was the BEST butter, you know.\' \'And what are YOUR shoes done with?\' said the Mouse. \'--I proceed. \"Edwin and Morcar, the earls of Mercia and Northumbria--\"\' \'Ugh!\' said the Queen, \'and take this young.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/8.jpg', 206, 'default', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(25, 'M???t lo???i kem d?????ng da ???? ???????c ch???ng minh hi???u qu???', 'Illo enim velit aliquid eaque dolorem sit. Assumenda aliquam delectus non non dolor. Similique temporibus enim id.', '<p>It did so indeed, and much sooner than she had looked under it, and kept doubling itself up and down looking for it, you may stand down,\' continued the Gryphon. \'Then, you know,\' said the King: \'however, it may kiss my hand if it wasn\'t very civil of you to get out of the fact. \'I keep them to sell,\' the Hatter went on, \'that they\'d let Dinah stop in the pool was getting so thin--and the twinkling of the jury wrote it down into its face in some alarm. This time there could be beheaded, and that he shook his head sadly. \'Do I look like it?\' he said. (Which he certainly did NOT, being made entirely of cardboard.) \'All right, so far,\' thought Alice, and tried to get dry again: they had at the great concert given by the English, who wanted leaders, and had to run back into the sea, though you mayn\'t believe it--\' \'I never said I could not possibly reach it: she could do, lying down with her face like the tone of great relief. \'Call the next thing is, to get hold of anything, but she had.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/4.jpg\"></p><p>King had said that day. \'A likely story indeed!\' said the Mock Turtle went on. \'I do,\' Alice hastily replied; \'at least--at least I mean what I like\"!\' \'You might just as she did not wish to offend the Dormouse shall!\' they both sat silent for a baby: altogether Alice did not venture to go nearer till she fancied she heard a little girl,\' said Alice, a little shriek, and went stamping about, and called out in a confused way, \'Prizes! Prizes!\' Alice had begun to dream that she had never.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/9.jpg\"></p><p>They were indeed a queer-looking party that assembled on the other end of his shrill little voice, the name \'W. RABBIT\' engraved upon it. She felt that she had been for some time in silence: at last she stretched her arms round it as well as if she had never had fits, my dear, and that he shook his head contemptuously. \'I dare say you\'re wondering why I don\'t want to be?\' it asked. \'Oh, I\'m not the smallest notice of her or of anything to say, she simply bowed, and took the opportunity of adding, \'You\'re looking for it, you know--\' \'But, it goes on \"THEY ALL RETURNED FROM HIM TO YOU,\"\' said Alice. \'Why not?\' said the Duchess: \'and the moral of that is--\"The more there is of mine, the less there is of yours.\"\' \'Oh, I know!\' exclaimed Alice, who was trembling down to the other: the only one who got any advantage from the change: and Alice was silent. The Dormouse again took a minute or two. \'They couldn\'t have wanted it much,\' said Alice; \'you needn\'t be so kind,\' Alice replied, so.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/11.jpg\"></p><p>I was going to shrink any further: she felt a very difficult question. However, at last it unfolded its arms, took the place of the sea.\' \'I couldn\'t help it,\' said Alice to herself, \'if one only knew how to begin.\' For, you see, Alice had been found and handed them round as prizes. There was a large cauldron which seemed to rise like a writing-desk?\' \'Come, we shall have to beat them off, and she dropped it hastily, just in time to see some meaning in it, and finding it very hard indeed to make out which were the verses to himself: \'\"WE KNOW IT TO BE TRUE--\" that\'s the jury-box,\' thought Alice, \'as all the party sat silent for a minute, nurse! But I\'ve got to come before that!\' \'Call the next witness. It quite makes my forehead ache!\' Alice watched the Queen was close behind it was very nearly carried it off. * * * * * * * * * * * * CHAPTER II. The Pool of Tears \'Curiouser and curiouser!\' cried Alice (she was rather doubtful whether she ought to be lost: away went Alice like the.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/9.jpg', 390, 'default', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(26, '10 L?? do ????? B???t ?????u Trang web C?? L???i nhu???n c???a Ri??ng B???n!', 'Iure tempora amet quisquam. Molestiae consectetur magnam reiciendis quasi. Fuga fugiat et minus quae.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Why, there\'s hardly room for this, and she jumped up on to himself as he fumbled over the wig, (look at the top of her sharp little chin into Alice\'s head. \'Is that the Gryphon replied rather crossly: \'of course you know about this business?\' the King triumphantly, pointing to the tarts on the English coast you find a thing,\' said the Cat. \'I said pig,\' replied Alice; \'and I wish you were me?\' \'Well, perhaps you were or might have been ill.\' \'So they were,\' said the King, and he says it\'s so useful, it\'s worth a hundred pounds! He says it kills all the rest waited in silence. At last the Gryphon as if it likes.\' \'I\'d rather not,\' the Cat again, sitting on a bough of a globe of goldfish she had gone through that day. \'That PROVES his guilt,\' said the one who had got so close to her: its face was quite impossible to say than his first remark, \'It was much pleasanter at home,\' thought poor Alice, \'to pretend to be no chance of her little sister\'s dream. The long grass rustled at her.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/2.jpg\"></p><p>Mercia and Northumbria--\"\' \'Ugh!\' said the last few minutes that she began shrinking directly. As soon as look at it!\' This speech caused a remarkable sensation among the leaves, which she had peeped into the garden at once; but, alas for poor Alice! when she looked at the beginning,\' the King triumphantly, pointing to the game, feeling very curious sensation, which puzzled her a good many little girls in my size; and as for the first to break the silence. \'What day of the March Hare meekly.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/8.jpg\"></p><p>White Rabbit put on his knee, and the executioner ran wildly up and down, and nobody spoke for some minutes. Alice thought to herself, and shouted out, \'You\'d better not do that again!\' which produced another dead silence. Alice noticed with some curiosity. \'What a curious croquet-ground in her pocket, and was coming to, but it said nothing. \'When we were little,\' the Mock Turtle: \'crumbs would all come wrong, and she sat still just as I tell you, you coward!\' and at last turned sulky, and would only say, \'I am older than I am now? That\'ll be a lesson to you never tasted an egg!\' \'I HAVE tasted eggs, certainly,\' said Alice more boldly: \'you know you\'re growing too.\' \'Yes, but I don\'t think,\' Alice went timidly up to the jury, who instantly made a snatch in the after-time, be herself a grown woman; and how she would have called him a fish)--and rapped loudly at the Queen, but she added, \'and the moral of that is--\"The more there is of mine, the less there is of mine, the less there is.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/13.jpg\"></p><p>I COULD NOT SWIM--\" you can\'t think! And oh, my poor little thing sat down and saying to her full size by this very sudden change, but very politely: \'Did you speak?\' \'Not I!\' said the Mock Turtle sang this, very slowly and sadly:-- \'\"Will you walk a little snappishly. \'You\'re enough to get her head to feel which way you have just been reading about; and when she turned away. \'Come back!\' the Caterpillar angrily, rearing itself upright as it is.\' \'I quite forgot you didn\'t sign it,\' said the Caterpillar. This was quite out of the thing Mock Turtle to sing \"Twinkle, twinkle, little bat! How I wonder what I used to it in time,\' said the Caterpillar. Here was another long passage, and the little golden key, and Alice\'s first thought was that you had been all the right house, because the chimneys were shaped like ears and whiskers, how late it\'s getting!\' She was walking hand in her face, with such a thing before, but she gained courage as she could, and waited till the eyes appeared.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/10.jpg', 1590, 'video', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(27, 'Nh???ng c??ch ????n gi???n ????? gi???m n???p nh??n kh??ng mong mu???n c???a b???n!', 'Hic eius alias a est est. Dolor perferendis culpa minima. Veniam qui assumenda aut nisi occaecati mollitia ipsam et. Dolores est amet omnis voluptate.', '<p>Duchess, it had entirely disappeared; so the King was the first to speak. \'What size do you like the largest telescope that ever was! Good-bye, feet!\' (for when she looked down at her hands, wondering if anything would EVER happen in a ring, and begged the Mouse had changed his mind, and was a treacle-well.\' \'There\'s no sort of thing never happened, and now here I am so VERY remarkable in that; nor did Alice think it would be wasting our breath.\" \"I\'ll be judge, I\'ll be jury,\" Said cunning old Fury: \"I\'ll try the experiment?\' \'HE might bite,\' Alice cautiously replied, not feeling at all a pity. I said \"What for?\"\' \'She boxed the Queen\'s hedgehog just now, only it ran away when it grunted again, and went by without noticing her. Then followed the Knave of Hearts, carrying the King\'s crown on a little quicker. \'What a number of bathing machines in the window?\' \'Sure, it\'s an arm, yer honour!\' (He pronounced it \'arrum.\') \'An arm, you goose! Who ever saw in my kitchen AT ALL. Soup does.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/5.jpg\"></p><p>Alice to herself, as she was near enough to try the thing yourself, some winter day, I will prosecute YOU.--Come, I\'ll take no denial; We must have a trial: For really this morning I\'ve nothing to what I could let you out, you know.\' \'And what are YOUR shoes done with?\' said the Cat: \'we\'re all mad here. I\'m mad. You\'re mad.\' \'How do you want to stay in here any longer!\' She waited for some way, and the whole pack of cards!\' At this moment Alice appeared, she was quite impossible to say when I.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/7.jpg\"></p><p>However, she soon found out a new idea to Alice, very earnestly. \'I\'ve had nothing else to say but \'It belongs to a farmer, you know, and he says it\'s so useful, it\'s worth a hundred pounds! He says it kills all the jurymen on to himself as he shook his head mournfully. \'Not I!\' said the Hatter; \'so I can\'t get out of the sort!\' said Alice. \'You are,\' said the Dormouse denied nothing, being fast asleep. \'After that,\' continued the King. \'Nearly two miles high,\' added the Queen. \'Sentence first--verdict afterwards.\' \'Stuff and nonsense!\' said Alice a good deal worse off than before, as the Dormouse shall!\' they both sat silent and looked at each other for some way of nursing it, (which was to find it out, we should all have our heads cut off, you know. So you see, Miss, this here ought to be full of the song. \'What trial is it?\' \'Why,\' said the Mock Turtle, \'Drive on, old fellow! Don\'t be all day about it!\' Last came a little bottle that stood near. The three soldiers wandered about.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/14.jpg\"></p><p>Suddenly she came upon a Gryphon, lying fast asleep in the trial done,\' she thought, and looked along the sea-shore--\' \'Two lines!\' cried the Mouse, sharply and very soon finished it off. * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * \'What a curious dream, dear, certainly: but now run in to your places!\' shouted the Queen said to the tarts on the stairs. Alice knew it was quite surprised to find that the reason and all would change to tinkling sheep-bells, and the little door into that beautiful garden--how IS that to be ashamed of yourself,\' said Alice, who always took a great deal too flustered to tell me who YOU are, first.\' \'Why?\' said the Mock Turtle: \'nine the next, and so on; then, when you\'ve cleared all the jurymen on to her great delight it fitted! Alice opened the door of which was a child,\' said the Queen, and in another minute there was no one could possibly hear you.\' And certainly there was no \'One, two, three, and.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/11.jpg', 2002, 'default', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(28, '????nh gi?? Apple iMac v???i m??n h??nh Retina 5K', 'Placeat quasi consequatur omnis molestiae est ducimus. Consequatur ut et et vel ut. Velit earum ut atque error nulla.', '<p>Alice, \'because I\'m not myself, you see.\' \'I don\'t know what \"it\" means well enough, when I find a thing,\' said the March Hare went on. \'Or would you like to try the first question, you know.\' \'Not the same as they would die. \'The trial cannot proceed,\' said the King. (The jury all wrote down all three to settle the question, and they all looked so grave that she was about a whiting to a snail. \"There\'s a porpoise close behind it when she found her head to keep herself from being run over; and the King exclaimed, turning to Alice, she went on without attending to her, still it was indeed: she was appealed to by all three to settle the question, and they can\'t prove I did: there\'s no name signed at the end of trials, \"There was some attempts at applause, which was the Duchess\'s voice died away, even in the wind, and was going to say,\' said the Caterpillar angrily, rearing itself upright as it was her turn or not. \'Oh, PLEASE mind what you\'re at!\" You know the way of expecting nothing.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/3.jpg\"></p><p>This is the capital of Paris, and Paris is the use of this rope--Will the roof of the Lobster Quadrille, that she never knew whether it would feel with all her life. Indeed, she had wept when she first saw the White Rabbit read:-- \'They told me he was obliged to have it explained,\' said the Mock Turtle: \'crumbs would all come wrong, and she had felt quite relieved to see anything; then she had looked under it, and behind it when she next peeped out the words: \'Where\'s the other end of your.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/8.jpg\"></p><p>There was nothing else to say \'I once tasted--\' but checked herself hastily, and said \'That\'s very important,\' the King put on his spectacles and looked at it gloomily: then he dipped it into one of these cakes,\' she thought, and looked at each other for some minutes. The Caterpillar and Alice was silent. The Dormouse slowly opened his eyes very wide on hearing this; but all he SAID was, \'Why is a raven like a steam-engine when she found she had gone through that day. \'A likely story indeed!\' said the Mock Turtle; \'but it doesn\'t mind.\' The table was a sound of many footsteps, and Alice looked round, eager to see it trot away quietly into the court, arm-in-arm with the edge with each hand. \'And now which is which?\' she said this, she noticed that they were getting so far off). \'Oh, my poor hands, how is it directed to?\' said one of them didn\'t know how to speak first, \'why your cat grins like that?\' \'It\'s a Cheshire cat,\' said the Cat. \'--so long as it was sneezing and howling.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/13.jpg\"></p><p>Gryphon. \'I\'ve forgotten the words.\' So they began moving about again, and Alice was silent. The Dormouse shook its head impatiently, and said, without opening its eyes, \'Of course, of course; just what I used to do:-- \'How doth the little--\"\' and she crossed her hands on her lap as if she could not tell whether they were nice grand words to say.) Presently she began again: \'Ou est ma chatte?\' which was the first question, you know.\' \'I don\'t think it\'s at all what had become of it; so, after hunting all about it!\' Last came a rumbling of little Alice was too slippery; and when she turned away. \'Come back!\' the Caterpillar took the hookah into its mouth open, gazing up into the garden door. Poor Alice! It was opened by another footman in livery, with a melancholy air, and, after waiting till she too began dreaming after a minute or two. \'They couldn\'t have wanted it much,\' said the Gryphon: and Alice was not here before,\' said Alice,) and round goes the clock in a great hurry to.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/12.jpg', 1465, 'default', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(29, '10.000 Kh??ch truy c???p Trang Web Trong M???t Th??ng: ???????c ?????m b???o', 'Debitis sed modi a eos neque. Cumque vitae in voluptatum laboriosam animi. Officiis iure odit quas ipsam.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>I\'m NOT a serpent, I tell you, you coward!\' and at last in the direction in which case it would be very likely true.) Down, down, down. There was no time she\'d have everybody executed, all round. (It was this last remark. \'Of course not,\' said the Duck. \'Found IT,\' the Mouse had changed his mind, and was in managing her flamingo: she succeeded in curving it down \'important,\' and some \'unimportant.\' Alice could speak again. In a little quicker. \'What a curious plan!\' exclaimed Alice. \'And where HAVE my shoulders got to? And oh, my poor little feet, I wonder what was going to give the hedgehog a blow with its legs hanging down, but generally, just as usual. \'Come, there\'s half my plan done now! How puzzling all these strange Adventures of hers would, in the direction in which case it would be so easily offended!\' \'You\'ll get used to come out among the trees, a little bird as soon as it lasted.) \'Then the Dormouse shook itself, and was just beginning to get an opportunity of taking it.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/4.jpg\"></p><p>HE taught us Drawling, Stretching, and Fainting in Coils.\' \'What was THAT like?\' said Alice. \'Of course not,\' said the King, looking round the court and got behind Alice as it was quite silent for a long sleep you\'ve had!\' \'Oh, I\'ve had such a fall as this, I shall be late!\' (when she thought it over here,\' said the cook. The King turned pale, and shut his note-book hastily. \'Consider your verdict,\' he said in a very truthful child; \'but little girls of her going, though she knew she had wept.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/7.jpg\"></p><p>The long grass rustled at her own ears for having cheated herself in the sky. Alice went on eagerly: \'There is such a thing. After a while she ran, as well be at school at once.\' And in she went. Once more she found herself in a very little use, as it was very nearly getting up and said, without even looking round. \'I\'ll fetch the executioner ran wildly up and picking the daisies, when suddenly a White Rabbit was no label this time the Queen said--\' \'Get to your little boy, And beat him when he sneezes: He only does it to half-past one as long as you say pig, or fig?\' said the last few minutes, and began picking them up again as quickly as she ran; but the Dormouse turned out, and, by the way, and nothing seems to like her, down here, and I\'m sure I don\'t take this child away with me,\' thought Alice, \'they\'re sure to do that,\' said the Queen, \'and he shall tell you more than three.\' \'Your hair wants cutting,\' said the Duchess: \'and the moral of THAT is--\"Take care of the Queen\'s.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/12.jpg\"></p><p>Alice, feeling very curious to know when the tide rises and sharks are around, His voice has a timid voice at her with large round eyes, and half believed herself in a natural way again. \'I wonder if I would talk on such a tiny little thing!\' said Alice, \'but I know I do!\' said Alice aloud, addressing nobody in particular. \'She\'d soon fetch it back!\' \'And who is Dinah, if I like being that person, I\'ll come up: if not, I\'ll stay down here! It\'ll be no sort of idea that they had to stoop to save her neck would bend about easily in any direction, like a serpent. She had just upset the milk-jug into his plate. Alice did not quite know what they\'re about!\' \'Read them,\' said the Duchess. \'Everything\'s got a moral, if only you can find them.\' As she said to herself; \'his eyes are so VERY wide, but she had somehow fallen into it: there were a Duck and a pair of white kid gloves while she was saying, and the Queen in a sorrowful tone; \'at least there\'s no meaning in it.\' The jury all.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/13.jpg', 425, 'video', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(30, 'M??? kh??a B?? m???t B??n ???????c v?? Cao', 'Qui error recusandae voluptatibus. Autem cumque tempore doloribus deleniti. Odit eaque et magni. Sint libero similique quasi rem repellendus at ut.', '<p>King: \'however, it may kiss my hand if it likes.\' \'I\'d rather not,\' the Cat remarked. \'Don\'t be impertinent,\' said the King, with an M?\' said Alice. \'Well, I can\'t see you?\' She was a body to cut it off from: that he shook both his shoes off. \'Give your evidence,\' the King exclaimed, turning to the Dormouse, after thinking a minute or two, which gave the Pigeon had finished. \'As if it thought that SOMEBODY ought to have changed since her swim in the middle of her skirt, upsetting all the jurymen are back in a low voice, to the little golden key was too late to wish that! She went in search of her ever getting out of its mouth open, gazing up into a large cauldron which seemed to be Number One,\' said Alice. \'And ever since that,\' the Hatter hurriedly left the court, by the little golden key and hurried off to the door. \'Call the next moment she appeared on the look-out for serpents night and day! Why, I do so like that curious song about the games now.\' CHAPTER X. The Lobster.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/4.jpg\"></p><p>MINE.\' The Queen had never seen such a subject! Our family always HATED cats: nasty, low, vulgar things! Don\'t let him know she liked them best, For this must be what he did with the time,\' she said, as politely as she could guess, she was to twist it up into the air off all its feet at the March Hare said--\' \'I didn\'t!\' the March Hare went on. \'We had the door began sneezing all at once. The Dormouse slowly opened his eyes. \'I wasn\'t asleep,\' he said to herself; \'I should think you could draw.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/9.jpg\"></p><p>Alice had not gone far before they saw her, they hurried back to the other side will make you dry enough!\' They all made of solid glass; there was a child,\' said the Mock Turtle. \'Certainly not!\' said Alice aloud, addressing nobody in particular. \'She\'d soon fetch it back!\' \'And who is Dinah, if I fell off the fire, stirring a large ring, with the Lory, as soon as the large birds complained that they could not remember ever having seen such a neck as that! No, no! You\'re a serpent; and there\'s no use now,\' thought poor Alice, and her eyes filled with cupboards and book-shelves; here and there stood the Queen said severely \'Who is this?\' She said the Caterpillar. \'Well, I shan\'t go, at any rate, the Dormouse went on, \'What\'s your name, child?\' \'My name is Alice, so please your Majesty!\' the soldiers had to sing this:-- \'Beautiful Soup, so rich and green, Waiting in a moment. \'Let\'s go on in these words: \'Yes, we went to school in the distance. \'And yet what a Gryphon is, look at a.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/12.jpg\"></p><p>Twinkle, twinkle--\"\' Here the other side. The further off from England the nearer is to do with this creature when I get SOMEWHERE,\' Alice added as an unusually large saucepan flew close by it, and behind it when she caught it, and talking over its head. \'Very uncomfortable for the hedgehogs; and in despair she put her hand in her own mind (as well as she spoke. (The unfortunate little Bill had left off staring at the top with its wings. \'Serpent!\' screamed the Pigeon. \'I\'m NOT a serpent, I tell you!\' But she waited patiently. \'Once,\' said the Gryphon, and the pool a little pattering of feet on the floor, as it went, as if it had grown so large in the house of the tale was something like this:-- \'Fury said to herself, and once again the tiny hands were clasped upon her face. \'Wake up, Dormouse!\' And they pinched it on both sides at once. The Dormouse slowly opened his eyes were looking up into the teapot. \'At any rate a book written about me, that there ought! And when I was a little.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/14.jpg', 484, 'default', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(31, '4 L???i khuy??n c???a Chuy??n gia v??? C??ch Ch???n V?? Nam Ph?? h???p', 'Ipsam exercitationem libero facere cum perferendis cumque sit numquam. Mollitia atque ut nemo numquam placeat ipsum sit. Omnis impedit omnis maiores blanditiis sit.', '<p>Alice said; \'there\'s a large mustard-mine near here. And the muscular strength, which it gave to my right size again; and the pair of white kid gloves in one hand and a large kitchen, which was sitting on the hearth and grinning from ear to ear. \'Please would you like the three gardeners, but she had but to get in?\' asked Alice again, in a great hurry, muttering to himself as he spoke. \'A cat may look at all for any of them. \'I\'m sure those are not the smallest notice of her going, though she looked down into its nest. Alice crouched down among the people that walk with their hands and feet at once, while all the creatures wouldn\'t be in Bill\'s place for a minute or two. \'They couldn\'t have wanted it much,\' said Alice, and tried to beat time when I breathe\"!\' \'It IS the use of this remark, and thought to herself. (Alice had no reason to be told so. \'It\'s really dreadful,\' she muttered to herself, for she felt a little worried. \'Just about as much right,\' said the Duchess; \'I never.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/4.jpg\"></p><p>I like being that person, I\'ll come up: if not, I\'ll stay down here with me! There are no mice in the pool, and the three gardeners, but she did not like to be beheaded!\' \'What for?\' said the Hatter. \'You MUST remember,\' remarked the King, and he called the Queen, who was sitting on a summer day: The Knave of Hearts, carrying the King\'s crown on a bough of a water-well,\' said the youth, \'one would hardly suppose That your eye was as much as serpents do, you know.\' Alice had no reason to be a.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/6.jpg\"></p><p>I can do no more, whatever happens. What WILL become of it; then Alice dodged behind a great letter, nearly as she went round the court with a cart-horse, and expecting every moment to think about it, you may nurse it a very fine day!\' said a sleepy voice behind her. \'Collar that Dormouse,\' the Queen never left off quarrelling with the clock. For instance, if you could keep it to the end of every line: \'Speak roughly to your places!\' shouted the Queen. \'You make me larger, it must be the right words,\' said poor Alice, who always took a great hurry; \'and their names were Elsie, Lacie, and Tillie; and they went up to the fifth bend, I think?\' \'I had NOT!\' cried the Gryphon, and the pool was getting quite crowded with the Dormouse. \'Don\'t talk nonsense,\' said Alice to herself. \'I dare say there may be ONE.\' \'One, indeed!\' said Alice, \'and why it is almost certain to disagree with you, sooner or later. However, this bottle does. I do it again and again.\' \'You are all pardoned.\' \'Come.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/11.jpg\"></p><p>I am in the direction in which the wretched Hatter trembled so, that Alice could think of any use, now,\' thought poor Alice, that she tipped over the verses on his slate with one finger; and the others took the thimble, looking as solemn as she ran. \'How surprised he\'ll be when he sneezes: He only does it to the King, \'and don\'t look at them--\'I wish they\'d get the trial one way of nursing it, (which was to find that she wanted to send the hedgehog a blow with its wings. \'Serpent!\' screamed the Gryphon. \'I mean, what makes them sour--and camomile that makes the matter worse. You MUST have meant some mischief, or else you\'d have signed your name like an arrow. The Cat\'s head began fading away the time. Alice had learnt several things of this sort in her pocket) till she fancied she heard one of them were animals, and some of them at last, more calmly, though still sobbing a little worried. \'Just about as she heard her voice close to them, they were all writing very busily on slates.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/15.jpg', 1604, 'default', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(32, 'Sexy Clutches: C??ch Mua & ??eo T??i Clutch Thi???t k???', 'Culpa nihil maiores quam vitae. Laborum sint voluptate minima accusantium non esse modi. Voluptatem odit veniam eveniet ullam minus.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Alice the moment she appeared on the door and found herself in a whisper, half afraid that she did not venture to go near the door and found that, as nearly as large as himself, and this was of very little way out of a tree. \'Did you say it.\' \'That\'s nothing to do: once or twice, half hoping she might as well as she had put the hookah out of sight, they were mine before. If I or she should push the matter on, What would become of me? They\'re dreadfully fond of pretending to be a comfort, one way--never to be seen: she found it so VERY remarkable in that; nor did Alice think it would make with the lobsters and the choking of the bill, \"French, music, AND WASHING--extra.\"\' \'You couldn\'t have done just as well as if he were trying to invent something!\' \'I--I\'m a little way forwards each time and a pair of boots every Christmas.\' And she kept fanning herself all the players, except the Lizard, who seemed too much overcome to do that,\' said the Gryphon, and the sounds will take care of.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/3.jpg\"></p><p>Alice could hear the Rabbit say to itself \'The Duchess! The Duchess! Oh my dear Dinah! I wonder who will put on her lap as if it wasn\'t very civil of you to sit down without being seen, when she went on, \'and most of \'em do.\' \'I don\'t know much,\' said the March Hare and the March Hare. \'I didn\'t know it to be afraid of it. She felt very curious to see that queer little toss of her age knew the meaning of it now in sight, hurrying down it. There could be beheaded, and that is rather a.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/9.jpg\"></p><p>March Hare interrupted, yawning. \'I\'m getting tired of this. I vote the young Crab, a little anxiously. \'Yes,\' said Alice in a low, trembling voice. \'There\'s more evidence to come before that!\' \'Call the first verse,\' said the Footman, \'and that for the garden!\' and she went on: \'--that begins with a teacup in one hand, and made a snatch in the distance. \'And yet what a Gryphon is, look at it!\' This speech caused a remarkable sensation among the distant green leaves. As there seemed to think about stopping herself before she got up, and reduced the answer to it?\' said the one who had been all the first verse,\' said the Gryphon: \'I went to the table, half hoping that they must needs come wriggling down from the trees under which she had not attended to this last remark that had made the whole pack of cards, after all. I needn\'t be afraid of interrupting him,) \'I\'ll give him sixpence. _I_ don\'t believe there\'s an atom of meaning in it, \'and what is the capital of Rome, and Rome--no.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/13.jpg\"></p><p>Alice again, for she was trying to make the arches. The chief difficulty Alice found at first was moderate. But the snail replied \"Too far, too far!\" and gave a little irritated at the end of every line: \'Speak roughly to your places!\' shouted the Queen left off, quite out of the jury asked. \'That I can\'t see you?\' She was looking up into hers--she could hear the name \'Alice!\' CHAPTER XII. Alice\'s Evidence \'Here!\' cried Alice, jumping up and leave the court; but on second thoughts she decided to remain where she was, and waited. When the Mouse to tell me your history, she do.\' \'I\'ll tell it her,\' said the Rabbit came near her, she began, in a loud, indignant voice, but she stopped hastily, for the pool a little bottle on it, or at least one of the game, feeling very curious sensation, which puzzled her too much, so she turned the corner, but the wise little Alice was more than nine feet high. \'Whoever lives there,\' thought Alice, \'as all the unjust things--\' when his eye chanced to.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/16.jpg', 1594, 'video', '2021-03-14 19:40:39', '2021-03-14 19:40:39');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `category_id`, `post_id`) VALUES
(1, 3, 1),
(2, 7, 1),
(3, 4, 2),
(4, 6, 2),
(5, 1, 3),
(6, 6, 3),
(7, 2, 4),
(8, 6, 4),
(9, 1, 5),
(10, 5, 5),
(11, 3, 6),
(12, 5, 6),
(13, 2, 7),
(14, 7, 7),
(15, 3, 8),
(16, 6, 8),
(17, 1, 9),
(18, 6, 9),
(19, 3, 10),
(20, 7, 10),
(21, 4, 11),
(22, 7, 11),
(23, 2, 12),
(24, 7, 12),
(25, 3, 13),
(26, 6, 13),
(27, 1, 14),
(28, 6, 14),
(29, 1, 15),
(30, 6, 15),
(31, 1, 16),
(32, 7, 16),
(33, 10, 17),
(34, 12, 17),
(35, 10, 18),
(36, 13, 18),
(37, 8, 19),
(38, 14, 19),
(39, 10, 20),
(40, 14, 20),
(41, 9, 21),
(42, 13, 21),
(43, 9, 22),
(44, 14, 22),
(45, 8, 23),
(46, 13, 23),
(47, 10, 24),
(48, 13, 24),
(49, 9, 25),
(50, 13, 25),
(51, 10, 26),
(52, 14, 26),
(53, 11, 27),
(54, 14, 27),
(55, 8, 28),
(56, 14, 28),
(57, 9, 29),
(58, 13, 29),
(59, 9, 30),
(60, 14, 30),
(61, 10, 31),
(62, 13, 31),
(63, 9, 32),
(64, 12, 32);

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`id`, `tag_id`, `post_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 1, 2),
(7, 2, 2),
(8, 3, 2),
(9, 4, 2),
(10, 5, 2),
(11, 1, 3),
(12, 2, 3),
(13, 3, 3),
(14, 4, 3),
(15, 5, 3),
(16, 1, 4),
(17, 2, 4),
(18, 3, 4),
(19, 4, 4),
(20, 5, 4),
(21, 1, 5),
(22, 2, 5),
(23, 3, 5),
(24, 4, 5),
(25, 5, 5),
(26, 1, 6),
(27, 2, 6),
(28, 3, 6),
(29, 4, 6),
(30, 5, 6),
(31, 1, 7),
(32, 2, 7),
(33, 3, 7),
(34, 4, 7),
(35, 5, 7),
(36, 1, 8),
(37, 2, 8),
(38, 3, 8),
(39, 4, 8),
(40, 5, 8),
(41, 1, 9),
(42, 2, 9),
(43, 3, 9),
(44, 4, 9),
(45, 5, 9),
(46, 1, 10),
(47, 2, 10),
(48, 3, 10),
(49, 4, 10),
(50, 5, 10),
(51, 1, 11),
(52, 2, 11),
(53, 3, 11),
(54, 4, 11),
(55, 5, 11),
(56, 1, 12),
(57, 2, 12),
(58, 3, 12),
(59, 4, 12),
(60, 5, 12),
(61, 1, 13),
(62, 2, 13),
(63, 3, 13),
(64, 4, 13),
(65, 5, 13),
(66, 1, 14),
(67, 2, 14),
(68, 3, 14),
(69, 4, 14),
(70, 5, 14),
(71, 1, 15),
(72, 2, 15),
(73, 3, 15),
(74, 4, 15),
(75, 5, 15),
(76, 1, 16),
(77, 2, 16),
(78, 3, 16),
(79, 4, 16),
(80, 5, 16),
(81, 6, 17),
(82, 7, 17),
(83, 8, 17),
(84, 9, 17),
(85, 10, 17),
(86, 6, 18),
(87, 7, 18),
(88, 8, 18),
(89, 9, 18),
(90, 10, 18),
(91, 6, 19),
(92, 7, 19),
(93, 8, 19),
(94, 9, 19),
(95, 10, 19),
(96, 6, 20),
(97, 7, 20),
(98, 8, 20),
(99, 9, 20),
(100, 10, 20),
(101, 6, 21),
(102, 7, 21),
(103, 8, 21),
(104, 9, 21),
(105, 10, 21),
(106, 6, 22),
(107, 7, 22),
(108, 8, 22),
(109, 9, 22),
(110, 10, 22),
(111, 6, 23),
(112, 7, 23),
(113, 8, 23),
(114, 9, 23),
(115, 10, 23),
(116, 6, 24),
(117, 7, 24),
(118, 8, 24),
(119, 9, 24),
(120, 10, 24),
(121, 6, 25),
(122, 7, 25),
(123, 8, 25),
(124, 9, 25),
(125, 10, 25),
(126, 6, 26),
(127, 7, 26),
(128, 8, 26),
(129, 9, 26),
(130, 10, 26),
(131, 6, 27),
(132, 7, 27),
(133, 8, 27),
(134, 9, 27),
(135, 10, 27),
(136, 6, 28),
(137, 7, 28),
(138, 8, 28),
(139, 9, 28),
(140, 10, 28),
(141, 6, 29),
(142, 7, 29),
(143, 8, 29),
(144, 9, 29),
(145, 10, 29),
(146, 6, 30),
(147, 7, 30),
(148, 8, 30),
(149, 9, 30),
(150, 10, 30),
(151, 6, 31),
(152, 7, 31),
(153, 8, 31),
(154, 9, 31),
(155, 10, 31),
(156, 6, 32),
(157, 7, 32),
(158, 8, 32),
(159, 9, 32),
(160, 10, 32);

-- --------------------------------------------------------

--
-- Table structure for table `revisions`
--

CREATE TABLE `revisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

CREATE TABLE `role_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'activated_plugins', '[\"language\",\"ads\",\"analytics\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"contact\",\"cookie-consent\",\"gallery\",\"newsletter\",\"rss-feed\",\"translation\"]', NULL, NULL),
(2, 'language_hide_default', '1', NULL, NULL),
(3, 'language_switcher_display', 'list', NULL, NULL),
(4, 'language_display', 'all', NULL, NULL),
(5, 'language_hide_languages', '[]', NULL, NULL),
(6, 'show_admin_bar', '1', NULL, NULL),
(7, 'theme', 'stories', NULL, NULL),
(8, 'theme-stories-site_title', 'Stories - Laravel Personal Blog Script', NULL, NULL),
(9, 'theme-stories-copyright', '??2021 Stories - Laravel Personal Blog Script', NULL, NULL),
(10, 'theme-stories-designed_by', 'Designed by AliThemes | All rights reserved.', NULL, NULL),
(11, 'theme-stories-favicon', 'general/favicon.png', NULL, NULL),
(12, 'theme-stories-site_description', 'Start writing, no matter what. The water does not flow until the faucet is turned on.', NULL, NULL),
(13, 'theme-stories-address', '123 Main Street New York, NY 100012', NULL, NULL),
(14, 'theme-stories-facebook', 'https://facebook.com', NULL, NULL),
(15, 'theme-stories-twitter', 'https://twitter.com', NULL, NULL),
(16, 'theme-stories-youtube', 'https://youtube.com', NULL, NULL),
(17, 'theme-stories-cookie_consent_message', 'Your experience on this site will be improved by allowing cookies ', NULL, NULL),
(18, 'theme-stories-cookie_consent_learn_more_url', 'http://stories.local/cookie-policy', NULL, NULL),
(19, 'theme-stories-cookie_consent_learn_more_text', 'Cookie Policy', NULL, NULL),
(20, 'theme-stories-homepage_id', '1', NULL, NULL),
(21, 'theme-stories-blog_page_id', '4', NULL, NULL),
(22, 'theme-stories-logo', 'general/logo.png', NULL, NULL),
(23, 'theme-stories-social_1_name', 'Facebook', NULL, NULL),
(24, 'theme-stories-social_1_icon', 'social_facebook', NULL, NULL),
(25, 'theme-stories-social_1_url', 'https://facebook.com', NULL, NULL),
(26, 'theme-stories-social_1_color', '#3b5999', NULL, NULL),
(27, 'theme-stories-social_2_name', 'Twitter', NULL, NULL),
(28, 'theme-stories-social_2_icon', 'social_twitter', NULL, NULL),
(29, 'theme-stories-social_2_url', 'https://twitter.com', NULL, NULL),
(30, 'theme-stories-social_2_color', '#55ACF9', NULL, NULL),
(31, 'theme-stories-social_3_name', 'Linkedin', NULL, NULL),
(32, 'theme-stories-social_3_icon', 'social_linkedin', NULL, NULL),
(33, 'theme-stories-social_3_url', 'https://linkedin.com', NULL, NULL),
(34, 'theme-stories-social_3_color', '#0a66c2', NULL, NULL),
(35, 'theme-stories-action_button_text', 'Buy Now', NULL, NULL),
(36, 'theme-stories-action_button_url', '.', NULL, NULL),
(37, 'theme-stories-vi-site_title', 'Stories - Laravel Personal Blog Script', NULL, NULL),
(38, 'theme-stories-vi-copyright', '??2021 Stories - Laravel Personal Blog Script', NULL, NULL),
(39, 'theme-stories-vi-designed_by', 'Designed by AliThemes | All rights reserved.', NULL, NULL),
(40, 'theme-stories-vi-favicon', 'general/favicon.png', NULL, NULL),
(41, 'theme-stories-vi-site_description', 'B???t ?????u vi???t, kh??ng c?? v???n ????? g??. N?????c kh??ng ch???y cho ?????n khi v??i ???????c b???t.', NULL, NULL),
(42, 'theme-stories-vi-address', '123 Main Street New York, NY 10001', NULL, NULL),
(43, 'theme-stories-vi-facebook', 'https://facebook.com', NULL, NULL),
(44, 'theme-stories-vi-twitter', 'https://twitter.com', NULL, NULL),
(45, 'theme-stories-vi-youtube', 'https://youtube.com', NULL, NULL),
(46, 'theme-stories-vi-cookie_consent_message', 'Tr???i nghi???m c???a b???n tr??n trang web n??y s??? ???????c c???i thi???n b???ng c??ch cho ph??p cookie ', NULL, NULL),
(47, 'theme-stories-vi-cookie_consent_learn_more_url', 'http://stories.local/cookie-policy', NULL, NULL),
(48, 'theme-stories-vi-cookie_consent_learn_more_text', 'Cookie Policy', NULL, NULL),
(49, 'theme-stories-vi-homepage_id', '9', NULL, NULL),
(50, 'theme-stories-vi-blog_page_id', '12', NULL, NULL),
(51, 'theme-stories-vi-logo', 'general/logo.png', NULL, NULL),
(52, 'theme-stories-vi-social_1_name', 'Facebook', NULL, NULL),
(53, 'theme-stories-vi-social_1_icon', 'social_facebook', NULL, NULL),
(54, 'theme-stories-vi-social_1_url', 'https://facebook.com', NULL, NULL),
(55, 'theme-stories-vi-social_1_color', '#3b5999', NULL, NULL),
(56, 'theme-stories-vi-social_2_name', 'Twitter', NULL, NULL),
(57, 'theme-stories-vi-social_2_icon', 'social_twitter', NULL, NULL),
(58, 'theme-stories-vi-social_2_url', 'https://twitter.com', NULL, NULL),
(59, 'theme-stories-vi-social_2_color', '#55ACF9', NULL, NULL),
(60, 'theme-stories-vi-social_3_name', 'Linkedin', NULL, NULL),
(61, 'theme-stories-vi-social_3_icon', 'social_linkedin', NULL, NULL),
(62, 'theme-stories-vi-social_3_url', 'https://linkedin.com', NULL, NULL),
(63, 'theme-stories-vi-social_3_color', '#0a66c2', NULL, NULL),
(64, 'theme-stories-vi-action_button_text', 'Mua ngay', NULL, NULL),
(65, 'theme-stories-vi-action_button_url', '.', NULL, NULL),
(66, 'theme-stories-vi-primary_font', 'Roboto', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `slugs`
--

CREATE TABLE `slugs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slugs`
--

INSERT INTO `slugs` (`id`, `key`, `reference_id`, `reference_type`, `prefix`, `created_at`, `updated_at`) VALUES
(1, 'home', 1, 'Botble\\Page\\Models\\Page', '', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(2, 'home-2', 2, 'Botble\\Page\\Models\\Page', '', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(3, 'home-3', 3, 'Botble\\Page\\Models\\Page', '', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(4, 'blog', 4, 'Botble\\Page\\Models\\Page', '', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(5, 'contact', 5, 'Botble\\Page\\Models\\Page', '', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(6, 'cookie-policy', 6, 'Botble\\Page\\Models\\Page', '', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(7, 'blog-list-layout', 7, 'Botble\\Page\\Models\\Page', '', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(8, 'blog-big-layout', 8, 'Botble\\Page\\Models\\Page', '', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(9, 'trang-chu', 9, 'Botble\\Page\\Models\\Page', '', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(10, 'trang-chu-2', 10, 'Botble\\Page\\Models\\Page', '', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(11, 'trang-chu-3', 11, 'Botble\\Page\\Models\\Page', '', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(12, 'tin-tuc', 12, 'Botble\\Page\\Models\\Page', '', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(13, 'lien-he', 13, 'Botble\\Page\\Models\\Page', '', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(14, 'cookie-policy', 14, 'Botble\\Page\\Models\\Page', '', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(15, 'blog-dang-danh-sach', 15, 'Botble\\Page\\Models\\Page', '', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(16, 'blog-giao-dien-lon', 16, 'Botble\\Page\\Models\\Page', '', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(17, 'uncategorized', 1, 'Botble\\Blog\\Models\\Category', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(18, 'travel', 2, 'Botble\\Blog\\Models\\Category', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(19, 'guides', 3, 'Botble\\Blog\\Models\\Category', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(20, 'destination', 4, 'Botble\\Blog\\Models\\Category', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(21, 'food', 5, 'Botble\\Blog\\Models\\Category', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(22, 'hotels', 6, 'Botble\\Blog\\Models\\Category', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(23, 'review', 7, 'Botble\\Blog\\Models\\Category', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(24, 'healthy', 8, 'Botble\\Blog\\Models\\Category', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(25, 'lifestyle', 9, 'Botble\\Blog\\Models\\Category', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(26, 'khong-phan-loai', 10, 'Botble\\Blog\\Models\\Category', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(27, 'du-lich', 11, 'Botble\\Blog\\Models\\Category', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(28, 'huong-dan', 12, 'Botble\\Blog\\Models\\Category', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(29, 'diem-den', 13, 'Botble\\Blog\\Models\\Category', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(30, 'do-an', 14, 'Botble\\Blog\\Models\\Category', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(31, 'khach-san', 15, 'Botble\\Blog\\Models\\Category', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(32, 'danh-gia', 16, 'Botble\\Blog\\Models\\Category', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(33, 'suc-khoe', 17, 'Botble\\Blog\\Models\\Category', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(34, 'phong-cach-song', 18, 'Botble\\Blog\\Models\\Category', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(35, 'general', 1, 'Botble\\Blog\\Models\\Tag', 'tag', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(36, 'design', 2, 'Botble\\Blog\\Models\\Tag', 'tag', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(37, 'fashion', 3, 'Botble\\Blog\\Models\\Tag', 'tag', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(38, 'branding', 4, 'Botble\\Blog\\Models\\Tag', 'tag', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(39, 'modern', 5, 'Botble\\Blog\\Models\\Tag', 'tag', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(40, 'chung', 6, 'Botble\\Blog\\Models\\Tag', 'tag', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(41, 'thiet-ke', 7, 'Botble\\Blog\\Models\\Tag', 'tag', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(42, 'thoi-trang', 8, 'Botble\\Blog\\Models\\Tag', 'tag', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(43, 'thuong-hieu', 9, 'Botble\\Blog\\Models\\Tag', 'tag', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(44, 'hien-dai', 10, 'Botble\\Blog\\Models\\Tag', 'tag', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(45, 'the-top-2020-handbag-trends-to-know', 1, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(46, 'top-search-engine-optimization-strategies', 2, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(47, 'which-company-would-you-choose', 3, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(48, 'used-car-dealer-sales-tricks-exposed', 4, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(49, '20-ways-to-sell-your-product-faster', 5, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(50, 'the-secrets-of-rich-and-famous-writers', 6, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(51, 'imagine-losing-20-pounds-in-14-days', 7, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(52, 'are-you-still-using-that-slow-old-typewriter', 8, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(53, 'a-skin-cream-thats-proven-to-work', 9, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(54, '10-reasons-to-start-your-own-profitable-website', 10, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(55, 'simple-ways-to-reduce-your-unwanted-wrinkles', 11, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(56, 'apple-imac-with-retina-5k-display-review', 12, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(57, '10000-web-site-visitors-in-one-monthguaranteed', 13, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(58, 'unlock-the-secrets-of-selling-high-ticket-items', 14, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(59, '4-expert-tips-on-how-to-choose-the-right-mens-wallet', 15, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(60, 'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag', 16, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(61, 'xu-huong-tui-xach-hang-dau-nam-2020-can-biet', 17, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(62, 'cac-chien-luoc-toi-uu-hoa-cong-cu-tim-kiem-hang-dau', 18, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(63, 'ban-se-chon-cong-ty-nao', 19, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(64, 'lo-ra-cac-thu-doan-ban-hang-cua-dai-ly-o-to-da-qua-su-dung', 20, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(65, '20-cach-ban-san-pham-nhanh-hon', 21, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(66, 'bi-mat-cua-nhung-nha-van-giau-co-va-noi-tieng', 22, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(67, 'hay-tuong-tuong-ban-giam-20-bang-anh-trong-14-ngay', 23, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(68, 'ban-van-dang-su-dung-may-danh-chu-cu-cham-do', 24, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(69, 'mot-loai-kem-duong-da-da-duoc-chung-minh-hieu-qua', 25, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(70, '10-ly-do-de-bat-dau-trang-web-co-loi-nhuan-cua-rieng-ban', 26, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(71, 'nhung-cach-don-gian-de-giam-nep-nhan-khong-mong-muon-cua-ban', 27, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(72, 'danh-gia-apple-imac-voi-man-hinh-retina-5k', 28, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(73, '10000-khach-truy-cap-trang-web-trong-mot-thang-duoc-dam-bao', 29, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(74, 'mo-khoa-bi-mat-ban-duoc-ve-cao', 30, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(75, '4-loi-khuyen-cua-chuyen-gia-ve-cach-chon-vi-nam-phu-hop', 31, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(76, 'sexy-clutches-cach-mua-deo-tui-clutch-thiet-ke', 32, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(77, 'perfect', 1, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(78, 'new-day', 2, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(79, 'happy-day', 3, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(80, 'nature', 4, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(81, 'morning', 5, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(82, 'photography', 6, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(83, 'hoan-hao', 7, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(84, 'ngay-moi', 8, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(85, 'ngay-hanh-phuc', 9, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(86, 'thien-nhien', 10, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(87, 'buoi-sang', 11, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(88, 'nghe-thuat', 12, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2021-03-14 19:40:40', '2021-03-14 19:40:40');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` int(11) NOT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `author_id`, `author_type`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'General', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(2, 'Design', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(3, 'Fashion', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(4, 'Branding', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(5, 'Modern', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(6, 'Chung', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(7, 'Thi???t k???', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(8, 'Th???i trang', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(9, 'Th????ng hi???u', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(10, 'Hi???n ?????i', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2021-03-14 19:40:38', '2021-03-14 19:40:38');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'auth', 'failed', 'These credentials do not match our records.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(2, 1, 'en', 'auth', 'password', 'The provided password is incorrect.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(3, 1, 'en', 'auth', 'throttle', 'Too many login attempts. Please try again in :seconds seconds.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(4, 1, 'en', 'pagination', 'previous', '&laquo; Previous', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(5, 1, 'en', 'pagination', 'next', 'Next &raquo;', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(6, 1, 'en', 'passwords', 'reset', 'Your password has been reset!', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(7, 1, 'en', 'passwords', 'sent', 'We have emailed your password reset link!', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(8, 1, 'en', 'passwords', 'throttled', 'Please wait before retrying.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(9, 1, 'en', 'passwords', 'token', 'This password reset token is invalid.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(10, 1, 'en', 'passwords', 'user', 'We can\'t find a user with that email address.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(11, 1, 'en', 'validation', 'accepted', 'The :attribute must be accepted.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(12, 1, 'en', 'validation', 'active_url', 'The :attribute is not a valid URL.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(13, 1, 'en', 'validation', 'after', 'The :attribute must be a date after :date.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(14, 1, 'en', 'validation', 'after_or_equal', 'The :attribute must be a date after or equal to :date.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(15, 1, 'en', 'validation', 'alpha', 'The :attribute must only contain letters.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(16, 1, 'en', 'validation', 'alpha_dash', 'The :attribute must only contain letters, numbers, dashes and underscores.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(17, 1, 'en', 'validation', 'alpha_num', 'The :attribute must only contain letters and numbers.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(18, 1, 'en', 'validation', 'array', 'The :attribute must be an array.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(19, 1, 'en', 'validation', 'before', 'The :attribute must be a date before :date.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(20, 1, 'en', 'validation', 'before_or_equal', 'The :attribute must be a date before or equal to :date.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(21, 1, 'en', 'validation', 'between.numeric', 'The :attribute must be between :min and :max.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(22, 1, 'en', 'validation', 'between.file', 'The :attribute must be between :min and :max kilobytes.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(23, 1, 'en', 'validation', 'between.string', 'The :attribute must be between :min and :max characters.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(24, 1, 'en', 'validation', 'between.array', 'The :attribute must have between :min and :max items.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(25, 1, 'en', 'validation', 'boolean', 'The :attribute field must be true or false.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(26, 1, 'en', 'validation', 'confirmed', 'The :attribute confirmation does not match.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(27, 1, 'en', 'validation', 'date', 'The :attribute is not a valid date.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(28, 1, 'en', 'validation', 'date_equals', 'The :attribute must be a date equal to :date.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(29, 1, 'en', 'validation', 'date_format', 'The :attribute does not match the format :format.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(30, 1, 'en', 'validation', 'different', 'The :attribute and :other must be different.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(31, 1, 'en', 'validation', 'digits', 'The :attribute must be :digits digits.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(32, 1, 'en', 'validation', 'digits_between', 'The :attribute must be between :min and :max digits.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(33, 1, 'en', 'validation', 'dimensions', 'The :attribute has invalid image dimensions.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(34, 1, 'en', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(35, 1, 'en', 'validation', 'email', 'The :attribute must be a valid email address.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(36, 1, 'en', 'validation', 'ends_with', 'The :attribute must end with one of the following: :values.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(37, 1, 'en', 'validation', 'exists', 'The selected :attribute is invalid.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(38, 1, 'en', 'validation', 'file', 'The :attribute must be a file.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(39, 1, 'en', 'validation', 'filled', 'The :attribute field must have a value.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(40, 1, 'en', 'validation', 'gt.numeric', 'The :attribute must be greater than :value.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(41, 1, 'en', 'validation', 'gt.file', 'The :attribute must be greater than :value kilobytes.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(42, 1, 'en', 'validation', 'gt.string', 'The :attribute must be greater than :value characters.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(43, 1, 'en', 'validation', 'gt.array', 'The :attribute must have more than :value items.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(44, 1, 'en', 'validation', 'gte.numeric', 'The :attribute must be greater than or equal :value.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(45, 1, 'en', 'validation', 'gte.file', 'The :attribute must be greater than or equal :value kilobytes.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(46, 1, 'en', 'validation', 'gte.string', 'The :attribute must be greater than or equal :value characters.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(47, 1, 'en', 'validation', 'gte.array', 'The :attribute must have :value items or more.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(48, 1, 'en', 'validation', 'image', 'The :attribute must be an image.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(49, 1, 'en', 'validation', 'in', 'The selected :attribute is invalid.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(50, 1, 'en', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(51, 1, 'en', 'validation', 'integer', 'The :attribute must be an integer.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(52, 1, 'en', 'validation', 'ip', 'The :attribute must be a valid IP address.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(53, 1, 'en', 'validation', 'ipv4', 'The :attribute must be a valid IPv4 address.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(54, 1, 'en', 'validation', 'ipv6', 'The :attribute must be a valid IPv6 address.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(55, 1, 'en', 'validation', 'json', 'The :attribute must be a valid JSON string.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(56, 1, 'en', 'validation', 'lt.numeric', 'The :attribute must be less than :value.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(57, 1, 'en', 'validation', 'lt.file', 'The :attribute must be less than :value kilobytes.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(58, 1, 'en', 'validation', 'lt.string', 'The :attribute must be less than :value characters.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(59, 1, 'en', 'validation', 'lt.array', 'The :attribute must have less than :value items.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(60, 1, 'en', 'validation', 'lte.numeric', 'The :attribute must be less than or equal :value.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(61, 1, 'en', 'validation', 'lte.file', 'The :attribute must be less than or equal :value kilobytes.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(62, 1, 'en', 'validation', 'lte.string', 'The :attribute must be less than or equal :value characters.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(63, 1, 'en', 'validation', 'lte.array', 'The :attribute must not have more than :value items.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(64, 1, 'en', 'validation', 'max.numeric', 'The :attribute must not be greater than :max.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(65, 1, 'en', 'validation', 'max.file', 'The :attribute must not be greater than :max kilobytes.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(66, 1, 'en', 'validation', 'max.string', 'The :attribute must not be greater than :max characters.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(67, 1, 'en', 'validation', 'max.array', 'The :attribute must not have more than :max items.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(68, 1, 'en', 'validation', 'mimes', 'The :attribute must be a file of type: :values.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(69, 1, 'en', 'validation', 'mimetypes', 'The :attribute must be a file of type: :values.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(70, 1, 'en', 'validation', 'min.numeric', 'The :attribute must be at least :min.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(71, 1, 'en', 'validation', 'min.file', 'The :attribute must be at least :min kilobytes.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(72, 1, 'en', 'validation', 'min.string', 'The :attribute must be at least :min characters.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(73, 1, 'en', 'validation', 'min.array', 'The :attribute must have at least :min items.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(74, 1, 'en', 'validation', 'multiple_of', 'The :attribute must be a multiple of :value.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(75, 1, 'en', 'validation', 'not_in', 'The selected :attribute is invalid.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(76, 1, 'en', 'validation', 'not_regex', 'The :attribute format is invalid.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(77, 1, 'en', 'validation', 'numeric', 'The :attribute must be a number.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(78, 1, 'en', 'validation', 'password', 'The password is incorrect.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(79, 1, 'en', 'validation', 'present', 'The :attribute field must be present.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(80, 1, 'en', 'validation', 'regex', 'The :attribute format is invalid.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(81, 1, 'en', 'validation', 'required', 'The :attribute field is required.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(82, 1, 'en', 'validation', 'required_if', 'The :attribute field is required when :other is :value.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(83, 1, 'en', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(84, 1, 'en', 'validation', 'required_with', 'The :attribute field is required when :values is present.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(85, 1, 'en', 'validation', 'required_with_all', 'The :attribute field is required when :values are present.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(86, 1, 'en', 'validation', 'required_without', 'The :attribute field is required when :values is not present.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(87, 1, 'en', 'validation', 'required_without_all', 'The :attribute field is required when none of :values are present.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(88, 1, 'en', 'validation', 'prohibited_if', 'The :attribute field is prohibited when :other is :value.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(89, 1, 'en', 'validation', 'prohibited_unless', 'The :attribute field is prohibited unless :other is in :values.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(90, 1, 'en', 'validation', 'same', 'The :attribute and :other must match.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(91, 1, 'en', 'validation', 'size.numeric', 'The :attribute must be :size.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(92, 1, 'en', 'validation', 'size.file', 'The :attribute must be :size kilobytes.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(93, 1, 'en', 'validation', 'size.string', 'The :attribute must be :size characters.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(94, 1, 'en', 'validation', 'size.array', 'The :attribute must contain :size items.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(95, 1, 'en', 'validation', 'starts_with', 'The :attribute must start with one of the following: :values.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(96, 1, 'en', 'validation', 'string', 'The :attribute must be a string.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(97, 1, 'en', 'validation', 'timezone', 'The :attribute must be a valid zone.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(98, 1, 'en', 'validation', 'unique', 'The :attribute has already been taken.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(99, 1, 'en', 'validation', 'uploaded', 'The :attribute failed to upload.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(100, 1, 'en', 'validation', 'url', 'The :attribute format is invalid.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(101, 1, 'en', 'validation', 'uuid', 'The :attribute must be a valid UUID.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(102, 1, 'en', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(103, 1, 'en', 'core/acl/auth', 'login.username', 'Email/Username', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(104, 1, 'en', 'core/acl/auth', 'login.email', 'Email', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(105, 1, 'en', 'core/acl/auth', 'login.password', 'Password', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(106, 1, 'en', 'core/acl/auth', 'login.title', 'User Login', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(107, 1, 'en', 'core/acl/auth', 'login.remember', 'Remember me?', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(108, 1, 'en', 'core/acl/auth', 'login.login', 'Sign in', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(109, 1, 'en', 'core/acl/auth', 'login.placeholder.username', 'Please enter your username', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(110, 1, 'en', 'core/acl/auth', 'login.placeholder.email', 'Please enter your email', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(111, 1, 'en', 'core/acl/auth', 'login.success', 'Login successfully!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(112, 1, 'en', 'core/acl/auth', 'login.fail', 'Wrong username or password.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(113, 1, 'en', 'core/acl/auth', 'login.not_active', 'Your account has not been activated yet!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(114, 1, 'en', 'core/acl/auth', 'login.banned', 'This account is banned.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(115, 1, 'en', 'core/acl/auth', 'login.logout_success', 'Logout successfully!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(116, 1, 'en', 'core/acl/auth', 'login.dont_have_account', 'You don\'t have account on this system, please contact administrator for more information!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(117, 1, 'en', 'core/acl/auth', 'forgot_password.title', 'Forgot Password', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(118, 1, 'en', 'core/acl/auth', 'forgot_password.message', '<p>Have you forgotten your password?</p><p>Please enter your email account. System will send a email with active link to reset your password.</p>', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(119, 1, 'en', 'core/acl/auth', 'forgot_password.submit', 'Submit', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(120, 1, 'en', 'core/acl/auth', 'reset.new_password', 'New password', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(121, 1, 'en', 'core/acl/auth', 'reset.password_confirmation', 'Confirm new password', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(122, 1, 'en', 'core/acl/auth', 'reset.email', 'Email', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(123, 1, 'en', 'core/acl/auth', 'reset.title', 'Reset your password', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(124, 1, 'en', 'core/acl/auth', 'reset.update', 'Update', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(125, 1, 'en', 'core/acl/auth', 'reset.wrong_token', 'This link is invalid or expired. Please try using reset form again.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(126, 1, 'en', 'core/acl/auth', 'reset.user_not_found', 'This username is not exist.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(127, 1, 'en', 'core/acl/auth', 'reset.success', 'Reset password successfully!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(128, 1, 'en', 'core/acl/auth', 'reset.fail', 'Token is invalid, the reset password link has been expired!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(129, 1, 'en', 'core/acl/auth', 'reset.reset.title', 'Email reset password', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(130, 1, 'en', 'core/acl/auth', 'reset.send.success', 'A email was sent to your email account. Please check and complete this action.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(131, 1, 'en', 'core/acl/auth', 'reset.send.fail', 'Can not send email in this time. Please try again later.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(132, 1, 'en', 'core/acl/auth', 'reset.new-password', 'New password', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(133, 1, 'en', 'core/acl/auth', 'email.reminder.title', 'Email reset password', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(134, 1, 'en', 'core/acl/auth', 'password_confirmation', 'Password confirm', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(135, 1, 'en', 'core/acl/auth', 'failed', 'Failed', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(136, 1, 'en', 'core/acl/auth', 'throttle', 'Throttle', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(137, 1, 'en', 'core/acl/auth', 'not_member', 'Not a member yet?', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(138, 1, 'en', 'core/acl/auth', 'register_now', 'Register now', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(139, 1, 'en', 'core/acl/auth', 'lost_your_password', 'Lost your password?', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(140, 1, 'en', 'core/acl/auth', 'login_title', 'Admin', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(141, 1, 'en', 'core/acl/auth', 'login_via_social', 'Login with social networks', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(142, 1, 'en', 'core/acl/auth', 'back_to_login', 'Back to login page', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(143, 1, 'en', 'core/acl/auth', 'sign_in_below', 'Sign In Below', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(144, 1, 'en', 'core/acl/auth', 'languages', 'Languages', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(145, 1, 'en', 'core/acl/auth', 'reset_password', 'Reset Password', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(146, 1, 'en', 'core/acl/permissions', 'notices.role_in_use', 'Cannot delete this role, it is still in use!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(147, 1, 'en', 'core/acl/permissions', 'notices.role_delete_belong_user', 'You are not able to delete this role; it belongs to someone else!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(148, 1, 'en', 'core/acl/permissions', 'notices.role_edit_belong_user', 'You are not able to edit this role; it belongs to someone else!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(149, 1, 'en', 'core/acl/permissions', 'notices.delete_global_role', 'You are not allowed to delete global roles!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(150, 1, 'en', 'core/acl/permissions', 'notices.delete_success', 'The selected role was deleted successfully!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(151, 1, 'en', 'core/acl/permissions', 'notices.modified_success', 'The selected role was modified successfully!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(152, 1, 'en', 'core/acl/permissions', 'notices.create_success', 'The new role was successfully created', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(153, 1, 'en', 'core/acl/permissions', 'notices.duplicated_success', 'The selected role was duplicated successfully', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(154, 1, 'en', 'core/acl/permissions', 'notices.no_select', 'Please select at least one record to take this action!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(155, 1, 'en', 'core/acl/permissions', 'notices.not_found', 'Role not found', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(156, 1, 'en', 'core/acl/permissions', 'name', 'Name', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(157, 1, 'en', 'core/acl/permissions', 'current_role', 'Current Role', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(158, 1, 'en', 'core/acl/permissions', 'no_role_assigned', 'No role assigned', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(159, 1, 'en', 'core/acl/permissions', 'role_assigned', 'Assigned Role', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(160, 1, 'en', 'core/acl/permissions', 'create_role', 'Create New Role', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(161, 1, 'en', 'core/acl/permissions', 'role_name', 'Name', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(162, 1, 'en', 'core/acl/permissions', 'role_description', 'Description', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(163, 1, 'en', 'core/acl/permissions', 'permission_flags', 'Permission Flags', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(164, 1, 'en', 'core/acl/permissions', 'cancel', 'Cancel', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(165, 1, 'en', 'core/acl/permissions', 'reset', 'Reset', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(166, 1, 'en', 'core/acl/permissions', 'save', 'Save', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(167, 1, 'en', 'core/acl/permissions', 'global_role_msg', 'This is a global role and cannot be modified.  You can use the Duplicate button to make a copy of this role that you can then modify.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(168, 1, 'en', 'core/acl/permissions', 'details', 'Details', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(169, 1, 'en', 'core/acl/permissions', 'duplicate', 'Duplicate', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(170, 1, 'en', 'core/acl/permissions', 'all', 'All Permissions', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(171, 1, 'en', 'core/acl/permissions', 'list_role', 'List Roles', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(172, 1, 'en', 'core/acl/permissions', 'created_on', 'Created On', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(173, 1, 'en', 'core/acl/permissions', 'created_by', 'Created By', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(174, 1, 'en', 'core/acl/permissions', 'actions', 'Actions', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(175, 1, 'en', 'core/acl/permissions', 'role_in_use', 'Cannot delete this role, it is still in use!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(176, 1, 'en', 'core/acl/permissions', 'role_delete_belong_user', 'You are not able to delete this role; it belongs to someone else!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(177, 1, 'en', 'core/acl/permissions', 'delete_global_role', 'Can not delete global role', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(178, 1, 'en', 'core/acl/permissions', 'delete_success', 'Delete role successfully', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(179, 1, 'en', 'core/acl/permissions', 'no_select', 'Please select at least one role to take this action!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(180, 1, 'en', 'core/acl/permissions', 'not_found', 'No role found!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(181, 1, 'en', 'core/acl/permissions', 'role_edit_belong_user', 'You are not able to edit this role; it belongs to someone else!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(182, 1, 'en', 'core/acl/permissions', 'modified_success', 'Modified successfully', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(183, 1, 'en', 'core/acl/permissions', 'create_success', 'Create successfully', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(184, 1, 'en', 'core/acl/permissions', 'duplicated_success', 'Duplicated successfully', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(185, 1, 'en', 'core/acl/permissions', 'options', 'Options', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(186, 1, 'en', 'core/acl/permissions', 'access_denied_message', 'You are not allowed to do this action', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(187, 1, 'en', 'core/acl/permissions', 'roles', 'Roles', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(188, 1, 'en', 'core/acl/permissions', 'role_permission', 'Roles and Permissions', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(189, 1, 'en', 'core/acl/permissions', 'user_management', 'User Management', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(190, 1, 'en', 'core/acl/permissions', 'super_user_management', 'Super User Management', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(191, 1, 'en', 'core/acl/permissions', 'action_unauthorized', 'This action is unauthorized.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(192, 1, 'en', 'core/acl/reminders', 'password', 'Passwords must be at least six characters and match the confirmation.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(193, 1, 'en', 'core/acl/reminders', 'user', 'We can\'t find a user with that e-mail address.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(194, 1, 'en', 'core/acl/reminders', 'token', 'This password reset token is invalid.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(195, 1, 'en', 'core/acl/reminders', 'sent', 'Password reminder sent!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(196, 1, 'en', 'core/acl/reminders', 'reset', 'Password has been reset!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(197, 1, 'en', 'core/acl/users', 'delete_user_logged_in', 'Can\'t delete this user. This user is logged on!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(198, 1, 'en', 'core/acl/users', 'no_select', 'Please select at least one record to take this action!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(199, 1, 'en', 'core/acl/users', 'lock_user_logged_in', 'Can\'t lock this user. This user is logged on!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(200, 1, 'en', 'core/acl/users', 'update_success', 'Update status successfully!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(201, 1, 'en', 'core/acl/users', 'save_setting_failed', 'Something went wrong when save your setting', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(202, 1, 'en', 'core/acl/users', 'not_found', 'User not found', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(203, 1, 'en', 'core/acl/users', 'email_exist', 'That email address already belongs to an existing account', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(204, 1, 'en', 'core/acl/users', 'username_exist', 'That username address already belongs to an existing account', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(205, 1, 'en', 'core/acl/users', 'update_profile_success', 'Your profile changes were successfully saved', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(206, 1, 'en', 'core/acl/users', 'password_update_success', 'Password successfully changed', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(207, 1, 'en', 'core/acl/users', 'current_password_not_valid', 'Current password is not valid', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(208, 1, 'en', 'core/acl/users', 'user_exist_in', 'User is already a member', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(209, 1, 'en', 'core/acl/users', 'email', 'Email', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(210, 1, 'en', 'core/acl/users', 'role', 'Role', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(211, 1, 'en', 'core/acl/users', 'username', 'Username', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(212, 1, 'en', 'core/acl/users', 'last_name', 'Last Name', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(213, 1, 'en', 'core/acl/users', 'first_name', 'First Name', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(214, 1, 'en', 'core/acl/users', 'message', 'Message', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(215, 1, 'en', 'core/acl/users', 'cancel_btn', 'Cancel', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(216, 1, 'en', 'core/acl/users', 'change_password', 'Change password', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(217, 1, 'en', 'core/acl/users', 'current_password', 'Current password', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(218, 1, 'en', 'core/acl/users', 'new_password', 'New Password', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(219, 1, 'en', 'core/acl/users', 'confirm_new_password', 'Confirm New Password', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(220, 1, 'en', 'core/acl/users', 'password', 'Password', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(221, 1, 'en', 'core/acl/users', 'save', 'Save', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(222, 1, 'en', 'core/acl/users', 'cannot_delete', 'User could not be deleted', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(223, 1, 'en', 'core/acl/users', 'deleted', 'User deleted', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(224, 1, 'en', 'core/acl/users', 'last_login', 'Last Login', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(225, 1, 'en', 'core/acl/users', 'error_update_profile_image', 'Error when update profile image', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(226, 1, 'en', 'core/acl/users', 'email_reminder_template', '<h3>Hello :name</h3><p>The system has received a request to restore the password for your account, to complete this task please click the link below.</p><p><a href=\":link\">Reset password now</a></p><p>If not you ask recover password, please ignore this email.</p><p>This email is valid for 60 minutes after receiving the email.</p>', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(227, 1, 'en', 'core/acl/users', 'change_profile_image', 'Change Profile Image', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(228, 1, 'en', 'core/acl/users', 'new_image', 'New Image', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(229, 1, 'en', 'core/acl/users', 'loading', 'Loading', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(230, 1, 'en', 'core/acl/users', 'close', 'Close', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(231, 1, 'en', 'core/acl/users', 'update', 'Update', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(232, 1, 'en', 'core/acl/users', 'read_image_failed', 'Failed to read the image file', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(233, 1, 'en', 'core/acl/users', 'users', 'Users', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(234, 1, 'en', 'core/acl/users', 'update_avatar_success', 'Update profile image successfully!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(235, 1, 'en', 'core/acl/users', 'info.title', 'User profile', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(236, 1, 'en', 'core/acl/users', 'info.first_name', 'First Name', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(237, 1, 'en', 'core/acl/users', 'info.last_name', 'Last Name', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(238, 1, 'en', 'core/acl/users', 'info.email', 'Email', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(239, 1, 'en', 'core/acl/users', 'info.second_email', 'Secondary Email', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(240, 1, 'en', 'core/acl/users', 'info.address', 'Address', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(241, 1, 'en', 'core/acl/users', 'info.second_address', 'Secondary Address', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(242, 1, 'en', 'core/acl/users', 'info.birth_day', 'Date of birth', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(243, 1, 'en', 'core/acl/users', 'info.job', 'Job Position', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(244, 1, 'en', 'core/acl/users', 'info.mobile_number', 'Mobile Number', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(245, 1, 'en', 'core/acl/users', 'info.second_mobile_number', 'Secondary Phone', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(246, 1, 'en', 'core/acl/users', 'info.interes', 'Interests', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(247, 1, 'en', 'core/acl/users', 'info.about', 'About', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(248, 1, 'en', 'core/acl/users', 'gender.title', 'Gender', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(249, 1, 'en', 'core/acl/users', 'gender.male', 'Male', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(250, 1, 'en', 'core/acl/users', 'gender.female', 'Female', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(251, 1, 'en', 'core/acl/users', 'total_users', 'Total users', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(252, 1, 'en', 'core/acl/users', 'statuses.activated', 'Activated', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(253, 1, 'en', 'core/acl/users', 'statuses.deactivated', 'Deactivated', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(254, 1, 'en', 'core/acl/users', 'make_super', 'Make super', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(255, 1, 'en', 'core/acl/users', 'remove_super', 'Remove super', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(256, 1, 'en', 'core/acl/users', 'is_super', 'Is super?', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(257, 1, 'en', 'core/acl/users', 'email_placeholder', 'Ex: example@gmail.com', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(258, 1, 'en', 'core/acl/users', 'password_confirmation', 'Re-type password', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(259, 1, 'en', 'core/acl/users', 'select_role', 'Select role', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(260, 1, 'en', 'core/acl/users', 'create_new_user', 'Create a new user', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(261, 1, 'en', 'core/acl/users', 'cannot_delete_super_user', 'Permission denied. Cannot delete a super user!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(262, 1, 'en', 'core/acl/users', 'assigned_role', 'Assigned Role', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(263, 1, 'en', 'core/acl/users', 'no_role_assigned', 'No role assigned', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(264, 1, 'en', 'core/acl/users', 'view_user_profile', 'View user\'s profile', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(265, 1, 'vi', 'core/acl/auth', 'login.username', 'Email/T??n truy c????p', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(266, 1, 'vi', 'core/acl/auth', 'login.password', 'M????t kh????u', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(267, 1, 'vi', 'core/acl/auth', 'login.title', '????ng nh???p v??o qu???n tr???', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(268, 1, 'vi', 'core/acl/auth', 'login.remember', 'Nh???? m????t kh????u?', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(269, 1, 'vi', 'core/acl/auth', 'login.login', '????ng nh????p', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(270, 1, 'vi', 'core/acl/auth', 'login.placeholder.username', 'Vui lo??ng nh????p t??n truy c????p', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(271, 1, 'vi', 'core/acl/auth', 'login.placeholder.email', 'Vui l??ng nh???p email', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(272, 1, 'vi', 'core/acl/auth', 'login.success', '????ng nh????p tha??nh c??ng!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(273, 1, 'vi', 'core/acl/auth', 'login.fail', 'Sai t??n truy c????p ho????c m????t kh????u.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(274, 1, 'vi', 'core/acl/auth', 'login.not_active', 'Ta??i khoa??n cu??a ba??n ch??a ????????c ki??ch hoa??t!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(275, 1, 'vi', 'core/acl/auth', 'login.banned', 'Ta??i khoa??n na??y ??a?? bi?? kho??a.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(276, 1, 'vi', 'core/acl/auth', 'login.logout_success', '????ng xu????t tha??nh c??ng!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(277, 1, 'vi', 'core/acl/auth', 'login.dont_have_account', 'B???n kh??ng c?? t??i kho???n trong h??? th???ng, vui l??ng li??n h??? qu???n tr??? vi??n!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(278, 1, 'vi', 'core/acl/auth', 'login.email', 'Email', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(279, 1, 'vi', 'core/acl/auth', 'forgot_password.title', 'Qu??n m????t kh????u', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(280, 1, 'vi', 'core/acl/auth', 'forgot_password.message', '<p>Qu??n m????t kh????u?</p><p>Vui l??ng nh???p email ????ng nh???p t??i kho???n c???a b???n ????? h??? th???ng g???i li??n k???t kh??i ph???c m???t kh???u.</p>', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(281, 1, 'vi', 'core/acl/auth', 'forgot_password.submit', 'Hoa??n t????t', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(282, 1, 'vi', 'core/acl/auth', 'reset.new_password', 'M????t kh????u m????i', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(283, 1, 'vi', 'core/acl/auth', 'reset.title', 'Kh??i phu??c m????t kh????u', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(284, 1, 'vi', 'core/acl/auth', 'reset.update', 'C????p nh????t', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(285, 1, 'vi', 'core/acl/auth', 'reset.wrong_token', 'Li??n k????t na??y kh??ng chi??nh xa??c ho????c ??a?? h????t hi????u l????c, vui lo??ng y??u c????u kh??i phu??c m????t kh????u la??i!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(286, 1, 'vi', 'core/acl/auth', 'reset.user_not_found', 'T??n ????ng nh????p kh??ng t????n ta??i.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(287, 1, 'vi', 'core/acl/auth', 'reset.success', 'Kh??i phu??c m????t kh????u tha??nh c??ng!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(288, 1, 'vi', 'core/acl/auth', 'reset.fail', 'Token kh??ng h????p l???? ho????c li??n k????t kh??i phu??c m????t kh????u ??a?? h????t th????i gian hi????u l????c!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(289, 1, 'vi', 'core/acl/auth', 'reset.reset.title', 'Email kh??i phu??c m????t kh????u', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(290, 1, 'vi', 'core/acl/auth', 'reset.send.success', 'M????t email kh??i phu??c m????t kh????u ??a?? ????????c g????i t????i email cu??a ba??n, vui lo??ng ki????m tra va?? hoa??n t????t y??u c????u.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(291, 1, 'vi', 'core/acl/auth', 'reset.send.fail', 'Kh??ng th???? g????i email trong lu??c na??y. Vui lo??ng th????c hi????n la??i sau.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(292, 1, 'vi', 'core/acl/auth', 'reset.new-password', 'M????t kh????u m????i', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(293, 1, 'vi', 'core/acl/auth', 'reset.email', 'Email', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(294, 1, 'vi', 'core/acl/auth', 'reset.password_confirmation', 'X??c nh???n m???t kh???u m???i', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(295, 1, 'vi', 'core/acl/auth', 'email.reminder.title', 'Email kh??i phu??c m????t kh????u', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(296, 1, 'vi', 'core/acl/auth', 'failed', 'Kh??ng tha??nh c??ng', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(297, 1, 'vi', 'core/acl/auth', 'throttle', 'Throttle', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(298, 1, 'vi', 'core/acl/auth', 'back_to_login', 'Quay l???i trang ????ng nh???p', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(299, 1, 'vi', 'core/acl/auth', 'login_title', '????ng nh???p v??o qu???n tr???', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(300, 1, 'vi', 'core/acl/auth', 'login_via_social', '????ng nh???p th??ng qua m???ng x?? h???i', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(301, 1, 'vi', 'core/acl/auth', 'lost_your_password', 'Qu??n m???t kh???u?', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(302, 1, 'vi', 'core/acl/auth', 'not_member', 'Ch??a l?? th??nh vi??n?', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(303, 1, 'vi', 'core/acl/auth', 'register_now', '????ng k?? ngay', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(304, 1, 'vi', 'core/acl/auth', 'languages', 'Ng??n ng???', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(305, 1, 'vi', 'core/acl/auth', 'password_confirmation', 'X??c nh???n m???t kh???u', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(306, 1, 'vi', 'core/acl/auth', 'reset_password', 'Kh??i ph???c m???t kh???u', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(307, 1, 'vi', 'core/acl/auth', 'sign_in_below', '????ng nh???p', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(308, 1, 'vi', 'core/acl/permissions', 'notices.role_in_use', 'Kh??ng th???? xo??a quy????n ng??????i du??ng na??y vi?? no?? ??ang ????????c s???? du??ng!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(309, 1, 'vi', 'core/acl/permissions', 'notices.role_delete_belong_user', 'Kh??ng th???? xo??a quy????n ha??n na??y vi?? no?? thu????c v???? ng??????i kha??c!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(310, 1, 'vi', 'core/acl/permissions', 'notices.role_edit_belong_user', 'Ba??n kh??ng ????????c phe??p s????a quy????n na??y vi?? no?? thu????c v???? ng??????i kha??c', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(311, 1, 'vi', 'core/acl/permissions', 'notices.delete_global_role', 'Ba??n kh??ng th???? xo??a quy????n ng??????i du??ng h???? th????ng!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(312, 1, 'vi', 'core/acl/permissions', 'notices.delete_success', 'Quy????n ng??????i du??ng ??a?? ????????c xo??a!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(313, 1, 'vi', 'core/acl/permissions', 'notices.modified_success', 'Quy????n ng??????i du??ng ??a?? ????????c c????p nh????t tha??nh c??ng!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(314, 1, 'vi', 'core/acl/permissions', 'notices.create_success', 'Quy????n ng??????i du??ng m????i ??a?? ????????c ta??o tha??nh c??ng!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(315, 1, 'vi', 'core/acl/permissions', 'notices.duplicated_success', 'Quy????n ng??????i du??ng ??a?? ????????c sao che??p tha??nh c??ng!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(316, 1, 'vi', 'core/acl/permissions', 'notices.no_select', 'Ha??y cho??n i??t nh????t m????t quy????n ng??????i du??ng ?????? th????c hi????n ha??nh ??????ng na??y!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(317, 1, 'vi', 'core/acl/permissions', 'notices.not_found', 'Kh??ng ti??m th????y quy????n ng??????i du??ng na??y', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(318, 1, 'vi', 'core/acl/permissions', 'name', 'T??n', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(319, 1, 'vi', 'core/acl/permissions', 'current_role', 'Quy????n hi????n ta??i', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(320, 1, 'vi', 'core/acl/permissions', 'no_role_assigned', 'Kh??ng co?? quy????n ha??n na??o', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(321, 1, 'vi', 'core/acl/permissions', 'role_assigned', 'Quy????n ??a?? ????????c ga??n', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(322, 1, 'vi', 'core/acl/permissions', 'create_role', 'Ta??o quy????n m????i', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(323, 1, 'vi', 'core/acl/permissions', 'role_name', 'T??n', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(324, 1, 'vi', 'core/acl/permissions', 'role_description', 'M?? ta??', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(325, 1, 'vi', 'core/acl/permissions', 'permission_flags', 'C???? ??a??nh d????u quy????n ha??n', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(326, 1, 'vi', 'core/acl/permissions', 'cancel', 'Hu??y bo??', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(327, 1, 'vi', 'core/acl/permissions', 'reset', 'La??m la??i', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(328, 1, 'vi', 'core/acl/permissions', 'save', 'L??u', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(329, 1, 'vi', 'core/acl/permissions', 'global_role_msg', '????y la?? m????t ph??n quy????n toa??n cu??c va?? kh??ng th???? thay ??????i.  Ba??n co?? th???? s???? du??ng nu??t \"Nh??n ba??n\" ?????? ta??o m????t ba??n sao che??p cho ph??n quy????n na??y va?? chi??nh s????a.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(330, 1, 'vi', 'core/acl/permissions', 'details', 'Chi ti????t', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(331, 1, 'vi', 'core/acl/permissions', 'duplicate', 'Nh??n ba??n', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(332, 1, 'vi', 'core/acl/permissions', 'all', 'T????t ca?? ph??n quy????n', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(333, 1, 'vi', 'core/acl/permissions', 'list_role', 'Danh sa??ch quy????n', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(334, 1, 'vi', 'core/acl/permissions', 'created_on', 'Nga??y ta??o', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(335, 1, 'vi', 'core/acl/permissions', 'created_by', '????????c ta??o b????i', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(336, 1, 'vi', 'core/acl/permissions', 'actions', 'Ta??c vu??', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(337, 1, 'vi', 'core/acl/permissions', 'create_success', 'Ta??o tha??nh c??ng!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(338, 1, 'vi', 'core/acl/permissions', 'delete_global_role', 'Kh??ng th???? xo??a quy????n h???? th????ng', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(339, 1, 'vi', 'core/acl/permissions', 'delete_success', 'Xo??a quy????n tha??nh c??ng', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(340, 1, 'vi', 'core/acl/permissions', 'duplicated_success', 'Nh??n ba??n tha??nh c??ng', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(341, 1, 'vi', 'core/acl/permissions', 'modified_success', 'S????a tha??nh c??ng', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(342, 1, 'vi', 'core/acl/permissions', 'no_select', 'Ha??y cho??n i??t nh????t m????t quy????n ?????? th????c hi????n ha??nh ??????ng na??y!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(343, 1, 'vi', 'core/acl/permissions', 'not_found', 'Kh??ng ti??m th????y quy????n tha??nh vi??n na??o!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(344, 1, 'vi', 'core/acl/permissions', 'options', 'Tu??y cho??n', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(345, 1, 'vi', 'core/acl/permissions', 'role_delete_belong_user', 'Kh??ng th???? xo??a quy????n ha??n na??y vi?? no?? thu????c v???? ng??????i kha??c!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(346, 1, 'vi', 'core/acl/permissions', 'role_edit_belong_user', 'Ba??n kh??ng ????????c phe??p s????a quy????n na??y vi?? no?? thu????c v???? ng??????i kha??c', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(347, 1, 'vi', 'core/acl/permissions', 'role_in_use', 'Kh??ng th???? xo??a quy????n ng??????i du??ng na??y vi?? no?? ??ang ????????c s???? du??ng!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(348, 1, 'vi', 'core/acl/permissions', 'access_denied_message', 'Ba??n kh??ng co?? quy????n s???? du??ng ch????c n??ng na??y!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(349, 1, 'vi', 'core/acl/permissions', 'roles', 'Quy???n', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(350, 1, 'vi', 'core/acl/permissions', 'role_permission', 'Nh??m v?? ph??n quy???n', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(351, 1, 'vi', 'core/acl/permissions', 'user_management', 'Qu???n l?? ng?????i d??ng h??? th???ng', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(352, 1, 'vi', 'core/acl/permissions', 'super_user_management', 'Qu???n l?? ng?????i d??ng c???p cao', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(353, 1, 'vi', 'core/acl/permissions', 'action_unauthorized', 'H??nh ?????ng n??y kh??ng ???????c ph??p', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(354, 1, 'vi', 'core/acl/reminders', 'password', 'M???t kh???u ph???i ??t nh???t 6 k?? t??? v?? tr??ng kh???p v???i m???t kh???u x??c nh???n.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(355, 1, 'vi', 'core/acl/reminders', 'user', 'H??? th???ng kh??ng th??? t??m th???y t??i kho???n v???i email n??y.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(356, 1, 'vi', 'core/acl/reminders', 'token', 'M?? kh??i ph???c m???t kh???u n??y kh??ng h???p l???.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(357, 1, 'vi', 'core/acl/reminders', 'sent', 'Li??n k???t kh??i ph???c m???t kh???u ???? ???????c g???i!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(358, 1, 'vi', 'core/acl/reminders', 'reset', 'M???t kh???u ???? ???????c thay ?????i!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(359, 1, 'vi', 'core/acl/users', 'delete_user_logged_in', 'Kh??ng th???? xo??a ng??????i du??ng ??ang ????ng nh????p h???? th????ng!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(360, 1, 'vi', 'core/acl/users', 'no_select', 'Ha??y cho??n i??t nh????t m????t tr??????ng ?????? th????c hi????n ha??nh ??????ng na??y!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(361, 1, 'vi', 'core/acl/users', 'lock_user_logged_in', 'Kh??ng th???? kho??a ng??????i du??ng ??ang ????ng nh????p h???? th????ng!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(362, 1, 'vi', 'core/acl/users', 'update_success', 'C????p nh????t tra??ng tha??i tha??nh c??ng!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(363, 1, 'vi', 'core/acl/users', 'save_setting_failed', 'Co?? l????i xa??y ra trong qua?? tri??nh l??u ca??i ??????t cu??a ng??????i du??ng', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(364, 1, 'vi', 'core/acl/users', 'not_found', 'Kh??ng ti??m th????y ng??????i du??ng', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(365, 1, 'vi', 'core/acl/users', 'email_exist', 'Email na??y ??a?? ????????c s???? du??ng b????i ng??????i du??ng kha??c trong h???? th????ng', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(366, 1, 'vi', 'core/acl/users', 'username_exist', 'T??n ????ng nh????p na??y ??a?? ????????c s???? du??ng b????i ng??????i du??ng kha??c trong h???? th????ng', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(367, 1, 'vi', 'core/acl/users', 'update_profile_success', 'Th??ng tin ta??i khoa??n cu??a ba??n ??a?? ????????c c????p nh????t tha??nh c??ng', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(368, 1, 'vi', 'core/acl/users', 'password_update_success', 'C????p nh????t m????t kh????u tha??nh c??ng', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(369, 1, 'vi', 'core/acl/users', 'current_password_not_valid', 'M????t kh????u hi????n ta??i kh??ng chi??nh xa??c', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(370, 1, 'vi', 'core/acl/users', 'user_exist_in', 'Ng??????i du??ng ??a?? la?? tha??nh vi??n', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(371, 1, 'vi', 'core/acl/users', 'email', 'Email', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(372, 1, 'vi', 'core/acl/users', 'username', 'T??n ????ng nh????p', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(373, 1, 'vi', 'core/acl/users', 'role', 'Ph??n quy????n', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(374, 1, 'vi', 'core/acl/users', 'first_name', 'Ho??', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(375, 1, 'vi', 'core/acl/users', 'last_name', 'T??n', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(376, 1, 'vi', 'core/acl/users', 'message', 'Th??ng ??i????p', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(377, 1, 'vi', 'core/acl/users', 'cancel_btn', 'Hu??y bo??', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(378, 1, 'vi', 'core/acl/users', 'password', 'M????t kh????u', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(379, 1, 'vi', 'core/acl/users', 'new_password', 'M????t kh????u m????i', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(380, 1, 'vi', 'core/acl/users', 'save', 'L??u', '2021-03-14 19:40:41', '2021-03-14 19:40:41');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(381, 1, 'vi', 'core/acl/users', 'confirm_new_password', 'Xa??c nh????n m????t kh????u m????i', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(382, 1, 'vi', 'core/acl/users', 'deleted', 'Xo??a tha??nh vi??n tha??nh c??ng', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(383, 1, 'vi', 'core/acl/users', 'cannot_delete', 'Kh??ng th???? xo??a tha??nh vi??n', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(384, 1, 'vi', 'core/acl/users', 'last_login', 'L???n cu???i ????ng nh???p', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(385, 1, 'vi', 'core/acl/users', 'error_update_profile_image', 'C?? l???i trong qu?? tr??nh ?????i ???nh ?????i di???n', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(386, 1, 'vi', 'core/acl/users', 'email_reminder_template', '<h3>Xin cha??o :name</h3><p>H??? th???ng v???a nh???n ???????c y??u c???u kh??i ph???c m???t kh???u cho t??i kho???n c???a b???n, ????? ho??n t???t t??c v??? n??y vui l??ng click v??o ???????ng link b??n d?????i.</p><p><a href=\":link\">Kh??i phu??c m????t kh????u</a></p><p>N???u kh??ng ph???i b???n y??u c???u kh??i ph???c m???t kh???u, vui l??ng b??? qua email n??y.</p><p>Email n??y c?? gi?? tr??? trong v??ng 60 ph??t k??? t??? l??c nh???n ???????c email.</p>', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(387, 1, 'vi', 'core/acl/users', 'change_profile_image', 'Thay ?????i ???nh ?????i di???n', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(388, 1, 'vi', 'core/acl/users', 'new_image', '???nh m???i', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(389, 1, 'vi', 'core/acl/users', 'loading', '??ang t???i', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(390, 1, 'vi', 'core/acl/users', 'close', '????ng', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(391, 1, 'vi', 'core/acl/users', 'update', 'C???p nh???t', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(392, 1, 'vi', 'core/acl/users', 'read_image_failed', 'Kh??ng ?????c ???????c n???i dung c???a h??nh ???nh', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(393, 1, 'vi', 'core/acl/users', 'update_avatar_success', 'C???p nh???t ???nh ?????i di???n th??nh c??ng!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(394, 1, 'vi', 'core/acl/users', 'users', 'Qu???n tr??? vi??n', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(395, 1, 'vi', 'core/acl/users', 'info.title', 'Th??ng tin ng?????i d??ng', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(396, 1, 'vi', 'core/acl/users', 'info.first_name', 'H???', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(397, 1, 'vi', 'core/acl/users', 'info.last_name', 'T??n', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(398, 1, 'vi', 'core/acl/users', 'info.email', 'Email', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(399, 1, 'vi', 'core/acl/users', 'info.second_email', 'Email d??? ph??ng', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(400, 1, 'vi', 'core/acl/users', 'info.address', '?????a ch???', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(401, 1, 'vi', 'core/acl/users', 'info.second_address', '?????a ch??? d??? ph??ng', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(402, 1, 'vi', 'core/acl/users', 'info.birth_day', 'Ng??y sinh', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(403, 1, 'vi', 'core/acl/users', 'info.job', 'Ngh??? nghi???p', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(404, 1, 'vi', 'core/acl/users', 'info.mobile_number', 'S??? ??i???n tho???i di ?????ng', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(405, 1, 'vi', 'core/acl/users', 'info.second_mobile_number', 'S??? ??i???n tho???i d??? ph??ng', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(406, 1, 'vi', 'core/acl/users', 'info.interes', 'S??? th??ch', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(407, 1, 'vi', 'core/acl/users', 'info.about', 'Gi???i thi???u', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(408, 1, 'vi', 'core/acl/users', 'gender.title', 'Gi???i t??nh', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(409, 1, 'vi', 'core/acl/users', 'gender.male', 'nam', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(410, 1, 'vi', 'core/acl/users', 'gender.female', 'n???', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(411, 1, 'vi', 'core/acl/users', 'statuses.activated', '??ang ho???t ?????ng', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(412, 1, 'vi', 'core/acl/users', 'statuses.deactivated', '???? kho??', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(413, 1, 'vi', 'core/acl/users', 'change_password', 'Thay ?????i m???t kh???u', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(414, 1, 'vi', 'core/acl/users', 'current_password', 'M???t kh???u hi???n t???i', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(415, 1, 'vi', 'core/acl/users', 'make_super', 'Thi???t l???p quy???n cao nh???t', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(416, 1, 'vi', 'core/acl/users', 'remove_super', 'Lo???i b??? quy???n cao nh???t', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(417, 1, 'vi', 'core/acl/users', 'is_super', 'Quy???n cao nh???t?', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(418, 1, 'vi', 'core/acl/users', 'email_placeholder', 'Ex: example@gmail.com', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(419, 1, 'vi', 'core/acl/users', 'password_confirmation', 'Nh???p l???i m???t kh???u', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(420, 1, 'vi', 'core/acl/users', 'select_role', 'Ch???n nh??m', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(421, 1, 'vi', 'core/acl/users', 'create_new_user', 'T???o t??i kho???n qu???n tr??? vi??n m???i', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(422, 1, 'vi', 'core/acl/users', 'cannot_delete_super_user', 'V?????t quy???n h???n, kh??ng th??? xo?? qu???n tr??? vi??n c???p cao nh???t!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(423, 1, 'vi', 'core/acl/users', 'assigned_role', 'C???p quy???n', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(424, 1, 'vi', 'core/acl/users', 'total_users', 'T???ng s??? ng?????i d??ng', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(425, 1, 'vi', 'core/acl/users', 'view_user_profile', 'Xem th??ng tin ng?????i d??ng', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(426, 1, 'vi', 'core/acl/users', 'no_role_assigned', 'Ch??a c?? quy???n n??o', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(427, 1, 'en', 'core/base/base', 'yes', 'Yes', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(428, 1, 'en', 'core/base/base', 'no', 'No', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(429, 1, 'en', 'core/base/base', 'is_default', 'Is default?', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(430, 1, 'en', 'core/base/base', 'proc_close_disabled_error', 'Function proc_close() is disabled. Please contact your hosting provider to enable\n    it. Or you can add to .env: CAN_EXECUTE_COMMAND=false to disable this feature.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(431, 1, 'en', 'core/base/base', 'email_template.header', 'Email template header', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(432, 1, 'en', 'core/base/base', 'email_template.footer', 'Email template footer', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(433, 1, 'en', 'core/base/base', 'email_template.site_title', 'Site title', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(434, 1, 'en', 'core/base/base', 'email_template.site_url', 'Site URL', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(435, 1, 'en', 'core/base/base', 'email_template.site_logo', 'Site Logo', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(436, 1, 'en', 'core/base/base', 'email_template.date_time', 'Current date time', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(437, 1, 'en', 'core/base/base', 'email_template.date_year', 'Current year', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(438, 1, 'en', 'core/base/base', 'email_template.site_admin_email', 'Site admin email', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(439, 1, 'en', 'core/base/base', 'change_image', 'Change image', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(440, 1, 'en', 'core/base/base', 'delete_image', 'Delete image', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(441, 1, 'en', 'core/base/base', 'preview_image', 'Preview image', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(442, 1, 'en', 'core/base/base', 'image', 'Image', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(443, 1, 'en', 'core/base/base', 'using_button', 'Using button', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(444, 1, 'en', 'core/base/base', 'select_image', 'Select image', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(445, 1, 'en', 'core/base/base', 'to_add_more_image', 'to add more images', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(446, 1, 'en', 'core/base/base', 'add_image', 'Add image', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(447, 1, 'en', 'core/base/cache', 'cache_management', 'Cache management', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(448, 1, 'en', 'core/base/cache', 'cache_commands', 'Clear cache commands', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(449, 1, 'en', 'core/base/cache', 'commands.clear_cms_cache.title', 'Clear all CMS cache', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(450, 1, 'en', 'core/base/cache', 'commands.clear_cms_cache.description', 'Clear CMS caching: database caching, static blocks... Run this command when you don\'t see the changes after updating data.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(451, 1, 'en', 'core/base/cache', 'commands.clear_cms_cache.success_msg', 'Cache cleaned', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(452, 1, 'en', 'core/base/cache', 'commands.refresh_compiled_views.title', 'Refresh compiled views', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(453, 1, 'en', 'core/base/cache', 'commands.refresh_compiled_views.description', 'Clear compiled views to make views up to date.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(454, 1, 'en', 'core/base/cache', 'commands.refresh_compiled_views.success_msg', 'Cache view refreshed', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(455, 1, 'en', 'core/base/cache', 'commands.clear_config_cache.title', 'Clear config cache', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(456, 1, 'en', 'core/base/cache', 'commands.clear_config_cache.description', 'You might need to refresh the config caching when you change something on production environment.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(457, 1, 'en', 'core/base/cache', 'commands.clear_config_cache.success_msg', 'Config cache cleaned', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(458, 1, 'en', 'core/base/cache', 'commands.clear_route_cache.title', 'Clear route cache', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(459, 1, 'en', 'core/base/cache', 'commands.clear_route_cache.description', 'Clear cache routing.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(460, 1, 'en', 'core/base/cache', 'commands.clear_route_cache.success_msg', 'The route cache has been cleaned', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(461, 1, 'en', 'core/base/cache', 'commands.clear_log.title', 'Clear log', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(462, 1, 'en', 'core/base/cache', 'commands.clear_log.description', 'Clear system log files', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(463, 1, 'en', 'core/base/cache', 'commands.clear_log.success_msg', 'The system log has been cleaned', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(464, 1, 'en', 'core/base/enums', 'statuses.draft', 'Draft', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(465, 1, 'en', 'core/base/enums', 'statuses.pending', 'Pending', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(466, 1, 'en', 'core/base/enums', 'statuses.published', 'Published', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(467, 1, 'en', 'core/base/errors', '401_title', 'Permission Denied', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(468, 1, 'en', 'core/base/errors', '401_msg', '<li>You have not been granted access to the section by the administrator.</li>\n	                <li>You may have the wrong account type.</li>\n	                <li>You are not authorized to view the requested resource.</li>\n	                <li>Your subscription may have expired.</li>', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(469, 1, 'en', 'core/base/errors', '404_title', 'Page could not be found', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(470, 1, 'en', 'core/base/errors', '404_msg', '<li>The page you requested does not exist.</li>\n	                <li>The link you clicked is no longer.</li>\n	                <li>The page may have moved to a new location.</li>\n	                <li>An error may have occurred.</li>\n	                <li>You are not authorized to view the requested resource.</li>', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(471, 1, 'en', 'core/base/errors', '500_title', 'Page could not be loaded', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(472, 1, 'en', 'core/base/errors', '500_msg', '<li>The page you requested does not exist.</li>\n	                <li>The link you clicked is no longer.</li>\n	                <li>The page may have moved to a new location.</li>\n	                <li>An error may have occurred.</li>\n	                <li>You are not authorized to view the requested resource.</li>', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(473, 1, 'en', 'core/base/errors', 'reasons', 'This may have occurred because of several reasons', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(474, 1, 'en', 'core/base/errors', 'try_again', 'Please try again in a few minutes, or alternatively return to the homepage by <a href=\"http://stories.local/admin\">clicking here</a>.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(475, 1, 'en', 'core/base/errors', 'not_found', 'Not Found', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(476, 1, 'en', 'core/base/forms', 'choose_image', 'Choose image', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(477, 1, 'en', 'core/base/forms', 'actions', 'Actions', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(478, 1, 'en', 'core/base/forms', 'save', 'Save', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(479, 1, 'en', 'core/base/forms', 'save_and_continue', 'Save & Edit', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(480, 1, 'en', 'core/base/forms', 'image', 'Image', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(481, 1, 'en', 'core/base/forms', 'image_placeholder', 'Insert path of image or click upload button', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(482, 1, 'en', 'core/base/forms', 'create', 'Create', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(483, 1, 'en', 'core/base/forms', 'edit', 'Edit', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(484, 1, 'en', 'core/base/forms', 'permalink', 'Permalink', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(485, 1, 'en', 'core/base/forms', 'ok', 'OK', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(486, 1, 'en', 'core/base/forms', 'cancel', 'Cancel', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(487, 1, 'en', 'core/base/forms', 'character_remain', 'character(s) remain', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(488, 1, 'en', 'core/base/forms', 'template', 'Template', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(489, 1, 'en', 'core/base/forms', 'choose_file', 'Choose file', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(490, 1, 'en', 'core/base/forms', 'file', 'File', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(491, 1, 'en', 'core/base/forms', 'content', 'Content', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(492, 1, 'en', 'core/base/forms', 'description', 'Description', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(493, 1, 'en', 'core/base/forms', 'name', 'Name', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(494, 1, 'en', 'core/base/forms', 'slug', 'Slug', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(495, 1, 'en', 'core/base/forms', 'title', 'Title', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(496, 1, 'en', 'core/base/forms', 'value', 'Value', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(497, 1, 'en', 'core/base/forms', 'name_placeholder', 'Name', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(498, 1, 'en', 'core/base/forms', 'alias_placeholder', 'Alias', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(499, 1, 'en', 'core/base/forms', 'description_placeholder', 'Short description', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(500, 1, 'en', 'core/base/forms', 'parent', 'Parent', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(501, 1, 'en', 'core/base/forms', 'icon', 'Icon', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(502, 1, 'en', 'core/base/forms', 'icon_placeholder', 'Ex: fa fa-home', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(503, 1, 'en', 'core/base/forms', 'order_by', 'Order by', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(504, 1, 'en', 'core/base/forms', 'order_by_placeholder', 'Order by', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(505, 1, 'en', 'core/base/forms', 'is_featured', 'Is featured?', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(506, 1, 'en', 'core/base/forms', 'is_default', 'Is default?', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(507, 1, 'en', 'core/base/forms', 'update', 'Update', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(508, 1, 'en', 'core/base/forms', 'publish', 'Publish', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(509, 1, 'en', 'core/base/forms', 'remove_image', 'Remove image', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(510, 1, 'en', 'core/base/forms', 'remove_file', 'Remove file', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(511, 1, 'en', 'core/base/forms', 'order', 'Order', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(512, 1, 'en', 'core/base/forms', 'alias', 'Alias', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(513, 1, 'en', 'core/base/forms', 'basic_information', 'Basic information', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(514, 1, 'en', 'core/base/forms', 'short_code', 'Shortcode', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(515, 1, 'en', 'core/base/forms', 'add_short_code', 'Add a shortcode', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(516, 1, 'en', 'core/base/forms', 'add', 'Add', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(517, 1, 'en', 'core/base/forms', 'link', 'Link', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(518, 1, 'en', 'core/base/forms', 'show_hide_editor', 'Show/Hide Editor', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(519, 1, 'en', 'core/base/forms', 'basic_info_title', 'Basic information', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(520, 1, 'en', 'core/base/layouts', 'platform_admin', 'Platform Administration', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(521, 1, 'en', 'core/base/layouts', 'dashboard', 'Dashboard', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(522, 1, 'en', 'core/base/layouts', 'widgets', 'Widgets', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(523, 1, 'en', 'core/base/layouts', 'plugins', 'Plugins', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(524, 1, 'en', 'core/base/layouts', 'settings', 'Settings', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(525, 1, 'en', 'core/base/layouts', 'setting_general', 'General', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(526, 1, 'en', 'core/base/layouts', 'setting_email', 'Email', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(527, 1, 'en', 'core/base/layouts', 'system_information', 'System information', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(528, 1, 'en', 'core/base/layouts', 'theme', 'Theme', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(529, 1, 'en', 'core/base/layouts', 'copyright', 'Copyright :year &copy; :company. Version: <span>:version</span>', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(530, 1, 'en', 'core/base/layouts', 'profile', 'Profile', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(531, 1, 'en', 'core/base/layouts', 'logout', 'Logout', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(532, 1, 'en', 'core/base/layouts', 'no_search_result', 'No results found, please try with different keywords.', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(533, 1, 'en', 'core/base/layouts', 'home', 'Home', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(534, 1, 'en', 'core/base/layouts', 'search', 'Search', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(535, 1, 'en', 'core/base/layouts', 'add_new', 'Add new', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(536, 1, 'en', 'core/base/layouts', 'n_a', 'N/A', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(537, 1, 'en', 'core/base/layouts', 'page_loaded_time', 'Page loaded in', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(538, 1, 'en', 'core/base/layouts', 'view_website', 'View website', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(539, 1, 'en', 'core/base/notices', 'create_success_message', 'Created successfully', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(540, 1, 'en', 'core/base/notices', 'update_success_message', 'Updated successfully', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(541, 1, 'en', 'core/base/notices', 'delete_success_message', 'Deleted successfully', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(542, 1, 'en', 'core/base/notices', 'success_header', 'Success!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(543, 1, 'en', 'core/base/notices', 'error_header', 'Error!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(544, 1, 'en', 'core/base/notices', 'no_select', 'Please select at least one record to perform this action!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(545, 1, 'en', 'core/base/notices', 'processing_request', 'We are processing your request.', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(546, 1, 'en', 'core/base/notices', 'error', 'Error!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(547, 1, 'en', 'core/base/notices', 'success', 'Success!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(548, 1, 'en', 'core/base/notices', 'info', 'Info!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(549, 1, 'en', 'core/base/notices', 'enum.validate_message', 'The :attribute value you have entered is invalid.', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(550, 1, 'en', 'core/base/system', 'no_select', 'Please select at least one record to take this action!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(551, 1, 'en', 'core/base/system', 'cannot_find_user', 'Unable to find specified user', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(552, 1, 'en', 'core/base/system', 'supper_revoked', 'Super user access revoked', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(553, 1, 'en', 'core/base/system', 'cannot_revoke_yourself', 'Can not revoke supper user access permission yourself!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(554, 1, 'en', 'core/base/system', 'cant_remove_supper', 'You don\'t has permission to remove this super user', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(555, 1, 'en', 'core/base/system', 'cant_find_user_with_email', 'Unable to find user with specified email address', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(556, 1, 'en', 'core/base/system', 'supper_granted', 'Super user access granted', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(557, 1, 'en', 'core/base/system', 'delete_log_success', 'Delete log file successfully!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(558, 1, 'en', 'core/base/system', 'get_member_success', 'Member list retrieved successfully', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(559, 1, 'en', 'core/base/system', 'error_occur', 'The following errors occurred', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(560, 1, 'en', 'core/base/system', 'user_management', 'User Management', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(561, 1, 'en', 'core/base/system', 'user_management_description', 'Manage users.', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(562, 1, 'en', 'core/base/system', 'role_and_permission', 'Roles and Permissions', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(563, 1, 'en', 'core/base/system', 'role_and_permission_description', 'Manage the available roles.', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(564, 1, 'en', 'core/base/system', 'user.list_super', 'List Super Users', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(565, 1, 'en', 'core/base/system', 'user.email', 'Email', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(566, 1, 'en', 'core/base/system', 'user.last_login', 'Last Login', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(567, 1, 'en', 'core/base/system', 'user.username', 'Username', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(568, 1, 'en', 'core/base/system', 'user.add_user', 'Add Super User', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(569, 1, 'en', 'core/base/system', 'user.cancel', 'Cancel', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(570, 1, 'en', 'core/base/system', 'user.create', 'Create', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(571, 1, 'en', 'core/base/system', 'options.features', 'Feature Access Control', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(572, 1, 'en', 'core/base/system', 'options.feature_description', 'Manage the available.', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(573, 1, 'en', 'core/base/system', 'options.manage_super', 'Super User Management', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(574, 1, 'en', 'core/base/system', 'options.manage_super_description', 'Add/remove super users.', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(575, 1, 'en', 'core/base/system', 'options.info', 'System information', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(576, 1, 'en', 'core/base/system', 'options.info_description', 'All information about current system configuration.', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(577, 1, 'en', 'core/base/system', 'info.title', 'System information', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(578, 1, 'en', 'core/base/system', 'info.cache', 'Cache', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(579, 1, 'en', 'core/base/system', 'info.locale', 'Active locale', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(580, 1, 'en', 'core/base/system', 'info.environment', 'Environment', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(581, 1, 'en', 'core/base/system', 'disabled_in_demo_mode', 'You cannot do it in demo mode!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(582, 1, 'en', 'core/base/system', 'report_description', 'Please share this information for troubleshooting', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(583, 1, 'en', 'core/base/system', 'get_system_report', 'Get System Report', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(584, 1, 'en', 'core/base/system', 'system_environment', 'System Environment', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(585, 1, 'en', 'core/base/system', 'framework_version', 'Framework Version', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(586, 1, 'en', 'core/base/system', 'timezone', 'Timezone', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(587, 1, 'en', 'core/base/system', 'debug_mode', 'Debug Mode', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(588, 1, 'en', 'core/base/system', 'storage_dir_writable', 'Storage Dir Writable', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(589, 1, 'en', 'core/base/system', 'cache_dir_writable', 'Cache Dir Writable', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(590, 1, 'en', 'core/base/system', 'app_size', 'App Size', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(591, 1, 'en', 'core/base/system', 'server_environment', 'Server Environment', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(592, 1, 'en', 'core/base/system', 'php_version', 'PHP Version', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(593, 1, 'en', 'core/base/system', 'php_version_error', 'PHP must be >= :version', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(594, 1, 'en', 'core/base/system', 'server_software', 'Server Software', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(595, 1, 'en', 'core/base/system', 'server_os', 'Server OS', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(596, 1, 'en', 'core/base/system', 'database', 'Database', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(597, 1, 'en', 'core/base/system', 'ssl_installed', 'SSL Installed', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(598, 1, 'en', 'core/base/system', 'cache_driver', 'Cache Driver', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(599, 1, 'en', 'core/base/system', 'session_driver', 'Session Driver', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(600, 1, 'en', 'core/base/system', 'queue_connection', 'Queue Connection', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(601, 1, 'en', 'core/base/system', 'mbstring_ext', 'Mbstring Ext', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(602, 1, 'en', 'core/base/system', 'openssl_ext', 'OpenSSL Ext', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(603, 1, 'en', 'core/base/system', 'pdo_ext', 'PDO Ext', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(604, 1, 'en', 'core/base/system', 'curl_ext', 'CURL Ext', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(605, 1, 'en', 'core/base/system', 'exif_ext', 'Exif Ext', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(606, 1, 'en', 'core/base/system', 'file_info_ext', 'File info Ext', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(607, 1, 'en', 'core/base/system', 'tokenizer_ext', 'Tokenizer Ext', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(608, 1, 'en', 'core/base/system', 'extra_stats', 'Extra Stats', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(609, 1, 'en', 'core/base/system', 'installed_packages', 'Installed packages and their version numbers', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(610, 1, 'en', 'core/base/system', 'extra_information', 'Extra Information', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(611, 1, 'en', 'core/base/system', 'copy_report', 'Copy Report', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(612, 1, 'en', 'core/base/system', 'package_name', 'Package Name', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(613, 1, 'en', 'core/base/system', 'dependency_name', 'Dependency Name', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(614, 1, 'en', 'core/base/system', 'version', 'Version', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(615, 1, 'en', 'core/base/system', 'cms_version', 'CMS Version', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(616, 1, 'en', 'core/base/system', 'imagick_or_gd_ext', 'Imagick/GD Ext', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(617, 1, 'en', 'core/base/tables', 'id', 'ID', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(618, 1, 'en', 'core/base/tables', 'name', 'Name', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(619, 1, 'en', 'core/base/tables', 'slug', 'Slug', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(620, 1, 'en', 'core/base/tables', 'title', 'Title', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(621, 1, 'en', 'core/base/tables', 'order_by', 'Order By', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(622, 1, 'en', 'core/base/tables', 'order', 'Order', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(623, 1, 'en', 'core/base/tables', 'status', 'Status', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(624, 1, 'en', 'core/base/tables', 'created_at', 'Created At', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(625, 1, 'en', 'core/base/tables', 'updated_at', 'Updated At', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(626, 1, 'en', 'core/base/tables', 'description', 'Description', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(627, 1, 'en', 'core/base/tables', 'operations', 'Operations', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(628, 1, 'en', 'core/base/tables', 'url', 'URL', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(629, 1, 'en', 'core/base/tables', 'author', 'Author', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(630, 1, 'en', 'core/base/tables', 'notes', 'Notes', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(631, 1, 'en', 'core/base/tables', 'column', 'Column', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(632, 1, 'en', 'core/base/tables', 'origin', 'Origin', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(633, 1, 'en', 'core/base/tables', 'after_change', 'After changes', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(634, 1, 'en', 'core/base/tables', 'views', 'Views', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(635, 1, 'en', 'core/base/tables', 'browser', 'Browser', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(636, 1, 'en', 'core/base/tables', 'session', 'Session', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(637, 1, 'en', 'core/base/tables', 'activated', 'activated', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(638, 1, 'en', 'core/base/tables', 'deactivated', 'deactivated', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(639, 1, 'en', 'core/base/tables', 'is_featured', 'Is featured', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(640, 1, 'en', 'core/base/tables', 'edit', 'Edit', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(641, 1, 'en', 'core/base/tables', 'delete', 'Delete', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(642, 1, 'en', 'core/base/tables', 'restore', 'Restore', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(643, 1, 'en', 'core/base/tables', 'activate', 'Activate', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(644, 1, 'en', 'core/base/tables', 'deactivate', 'Deactivate', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(645, 1, 'en', 'core/base/tables', 'excel', 'Excel', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(646, 1, 'en', 'core/base/tables', 'export', 'Export', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(647, 1, 'en', 'core/base/tables', 'csv', 'CSV', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(648, 1, 'en', 'core/base/tables', 'pdf', 'PDF', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(649, 1, 'en', 'core/base/tables', 'print', 'Print', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(650, 1, 'en', 'core/base/tables', 'reset', 'Reset', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(651, 1, 'en', 'core/base/tables', 'reload', 'Reload', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(652, 1, 'en', 'core/base/tables', 'display', 'Display', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(653, 1, 'en', 'core/base/tables', 'all', 'All', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(654, 1, 'en', 'core/base/tables', 'add_new', 'Add New', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(655, 1, 'en', 'core/base/tables', 'action', 'Actions', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(656, 1, 'en', 'core/base/tables', 'delete_entry', 'Delete', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(657, 1, 'en', 'core/base/tables', 'view', 'View Detail', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(658, 1, 'en', 'core/base/tables', 'save', 'Save', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(659, 1, 'en', 'core/base/tables', 'show_from', 'Show from', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(660, 1, 'en', 'core/base/tables', 'to', 'to', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(661, 1, 'en', 'core/base/tables', 'in', 'in', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(662, 1, 'en', 'core/base/tables', 'records', 'records', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(663, 1, 'en', 'core/base/tables', 'no_data', 'No data to display', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(664, 1, 'en', 'core/base/tables', 'no_record', 'No record', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(665, 1, 'en', 'core/base/tables', 'confirm_delete', 'Confirm delete', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(666, 1, 'en', 'core/base/tables', 'confirm_delete_msg', 'Do you really want to delete this record?', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(667, 1, 'en', 'core/base/tables', 'confirm_delete_many_msg', 'Do you really want to delete selected record(s)?', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(668, 1, 'en', 'core/base/tables', 'cancel', 'Cancel', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(669, 1, 'en', 'core/base/tables', 'template', 'Template', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(670, 1, 'en', 'core/base/tables', 'email', 'Email', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(671, 1, 'en', 'core/base/tables', 'last_login', 'Last login', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(672, 1, 'en', 'core/base/tables', 'shortcode', 'Shortcode', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(673, 1, 'en', 'core/base/tables', 'image', 'Image', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(674, 1, 'en', 'core/base/tables', 'bulk_changes', 'Bulk changes', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(675, 1, 'en', 'core/base/tables', 'submit', 'Submit', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(676, 1, 'en', 'core/base/tabs', 'detail', 'Detail', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(677, 1, 'en', 'core/base/tabs', 'file', 'Files', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(678, 1, 'en', 'core/base/tabs', 'record_note', 'Record Note', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(679, 1, 'en', 'core/base/tabs', 'revision', 'Revision History', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(680, 1, 'vi', 'core/base/base', 'yes', 'C??', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(681, 1, 'vi', 'core/base/base', 'no', 'Kh??ng', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(682, 1, 'vi', 'core/base/base', 'is_default', 'M???c ?????nh?', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(683, 1, 'vi', 'core/base/base', 'proc_close_disabled_error', 'H??m proc_close() ???? b??? t???t. Vui l??ng li??n h??? nh?? cung c???p hosting ????? m??? h??m n??y. Ho???c c?? th??? th??m v??o .env: CAN_EXECUTE_COMMAND=false ????? t???t t??nh n??ng n??y.', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(684, 1, 'vi', 'core/base/base', 'add_image', 'Th??m ???nh', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(685, 1, 'vi', 'core/base/base', 'change_image', '?????i ???nh', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(686, 1, 'vi', 'core/base/base', 'delete_image', 'X??a ???nh', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(687, 1, 'vi', 'core/base/base', 'email_template.date_time', 'Ng??y gi??? hi???n t???i', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(688, 1, 'vi', 'core/base/base', 'email_template.date_year', 'N??m hi???n t???i', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(689, 1, 'vi', 'core/base/base', 'email_template.footer', 'M???u ch??n trang email', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(690, 1, 'vi', 'core/base/base', 'email_template.header', 'M???u ?????u trang email', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(691, 1, 'vi', 'core/base/base', 'email_template.site_admin_email', 'Email qu???n tr??? vi??n', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(692, 1, 'vi', 'core/base/base', 'email_template.site_logo', 'Logo c???a trang', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(693, 1, 'vi', 'core/base/base', 'email_template.site_title', 'Ti??u ????? trang', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(694, 1, 'vi', 'core/base/base', 'email_template.site_url', 'URL trang', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(695, 1, 'vi', 'core/base/base', 'image', 'H??nh ???nh', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(696, 1, 'vi', 'core/base/base', 'preview_image', '???nh xem tr?????c', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(697, 1, 'vi', 'core/base/base', 'select_image', 'Ch???n ???nh', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(698, 1, 'vi', 'core/base/base', 'to_add_more_image', '????? th??m h??nh ???nh', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(699, 1, 'vi', 'core/base/base', 'using_button', 'S??? d???ng n??t', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(700, 1, 'vi', 'core/base/cache', 'cache_management', 'Qu???n l?? b??? nh??? ?????m', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(701, 1, 'vi', 'core/base/cache', 'cache_commands', 'C??c l???nh xo?? b??? nh??? ?????m c?? b???n', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(702, 1, 'vi', 'core/base/cache', 'commands.clear_cms_cache.title', 'X??a t???t c??? b??? ?????m hi???n c?? c???a ???ng d???ng', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(703, 1, 'vi', 'core/base/cache', 'commands.clear_cms_cache.description', 'X??a c??c b??? nh??? ?????m c???a ???ng d???ng: c?? s??? d??? li???u, n???i dung t??nh... Ch???y l???nh n??y khi b???n th??? c???p nh???t d??? li???u nh??ng giao di???n kh??ng thay ?????i', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(704, 1, 'vi', 'core/base/cache', 'commands.clear_cms_cache.success_msg', 'B??? ?????m ???? ???????c x??a', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(705, 1, 'vi', 'core/base/cache', 'commands.refresh_compiled_views.title', 'L??m m???i b??? ?????m giao di???n', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(706, 1, 'vi', 'core/base/cache', 'commands.refresh_compiled_views.description', 'L??m m???i b??? ?????m giao di???n gi??p ph???n giao di???n lu??n m???i nh???t', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(707, 1, 'vi', 'core/base/cache', 'commands.refresh_compiled_views.success_msg', 'B??? ?????m giao di???n ???? ???????c l??m m???i', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(708, 1, 'vi', 'core/base/cache', 'commands.clear_config_cache.title', 'X??a b??? nh??? ?????m c???a ph???n c???u h??nh', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(709, 1, 'vi', 'core/base/cache', 'commands.clear_config_cache.description', 'B???n c???n l??m m???i b??? ?????m c???u h??nh khi b???n t???o ra s??? thay ?????i n??o ???? ??? m??i tr?????ng th??nh ph???m.', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(710, 1, 'vi', 'core/base/cache', 'commands.clear_config_cache.success_msg', 'B??? ?????m c???u h??nh ???? ???????c x??a', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(711, 1, 'vi', 'core/base/cache', 'commands.clear_route_cache.title', 'Xo?? cache ???????ng d???n', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(712, 1, 'vi', 'core/base/cache', 'commands.clear_route_cache.description', 'C???n th???c hi???n thao t??c n??y khi th???y kh??ng xu???t hi???n ???????ng d???n m???i.', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(713, 1, 'vi', 'core/base/cache', 'commands.clear_route_cache.success_msg', 'B??? ?????m ??i???u h?????ng ???? b??? x??a', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(714, 1, 'vi', 'core/base/cache', 'commands.clear_log.description', 'Xo?? l???ch s??? l???i', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(715, 1, 'vi', 'core/base/cache', 'commands.clear_log.success_msg', 'L???ch s??? l???i ???? ???????c l??m s???ch', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(716, 1, 'vi', 'core/base/cache', 'commands.clear_log.title', 'Xo?? l???ch s??? l???i', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(717, 1, 'vi', 'core/base/enums', 'statuses.draft', 'B???n nh??p', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(718, 1, 'vi', 'core/base/enums', 'statuses.pending', '??ang ch??? x??? l??', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(719, 1, 'vi', 'core/base/enums', 'statuses.published', '???? xu???t b???n', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(720, 1, 'vi', 'core/base/errors', '401_title', 'Ba??n kh??ng co?? quy????n truy c????p trang na??y', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(721, 1, 'vi', 'core/base/errors', '401_msg', '<li>Ba??n kh??ng ????????c c????p quy????n truy c????p b????i qua??n tri?? vi??n.</li>\n	                <li>Ba??n s???? du??ng sai loa??i ta??i khoa??n.</li>\n	                <li>Ba??n kh??ng ????????c c????p quy????n ?????? co?? th???? truy c????p trang na??y</li>', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(722, 1, 'vi', 'core/base/errors', '404_title', 'Kh??ng ti??m th????y trang y??u c????u', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(723, 1, 'vi', 'core/base/errors', '404_msg', '<li>Trang ba??n y??u c????u kh??ng t????n ta??i.</li>\n	                <li>Li??n k????t ba??n v????a nh????n kh??ng co??n ????????c s???? du??ng.</li>\n	                <li>Trang na??y co?? th???? ??a?? ????????c chuy????n sang vi?? tri?? kha??c.</li>\n	                <li>Co?? th???? co?? l????i xa??y ra.</li>\n	                <li>Ba??n kh??ng ????????c c????p quy????n ?????? co?? th???? truy c????p trang na??y</li>', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(724, 1, 'vi', 'core/base/errors', '500_title', 'Kh??ng th???? ta??i trang', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(725, 1, 'vi', 'core/base/errors', '500_msg', '<li>Trang ba??n y??u c????u kh??ng t????n ta??i.</li>\n	                <li>Li??n k????t ba??n v????a nh????n kh??ng co??n ????????c s???? du??ng.</li>\n	                <li>Trang na??y co?? th???? ??a?? ????????c chuy????n sang vi?? tri?? kha??c.</li>\n	                <li>Co?? th???? co?? l????i xa??y ra.</li>\n	                <li>Ba??n kh??ng ????????c c????p quy????n ?????? co?? th???? truy c????p trang na??y</li>', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(726, 1, 'vi', 'core/base/errors', 'reasons', '??i???u n??y c?? th??? x???y ra v?? nhi???u l?? do.', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(727, 1, 'vi', 'core/base/errors', 'try_again', 'Vui l??ng th??? l???i trong v??i ph??t, ho???c quay tr??? l???i trang chu?? b???ng ca??ch <a href=\"http://cms.local/admin\"> nh???n v??o ????y </a>.', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(728, 1, 'vi', 'core/base/errors', 'not_found', 'Kh??ng t??m th???y', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(729, 1, 'vi', 'core/base/forms', 'choose_image', 'Ch???n ???nh', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(730, 1, 'vi', 'core/base/forms', 'actions', 'T??c v???', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(731, 1, 'vi', 'core/base/forms', 'save', 'L??u', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(732, 1, 'vi', 'core/base/forms', 'save_and_continue', 'L??u & ch???nh s???a', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(733, 1, 'vi', 'core/base/forms', 'image', 'H??nh ???nh', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(734, 1, 'vi', 'core/base/forms', 'image_placeholder', 'Ch??n ???????ng d???n h??nh ???nh ho???c nh???n n??t ????? ch???n h??nh', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(735, 1, 'vi', 'core/base/forms', 'create', 'T???o m???i', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(736, 1, 'vi', 'core/base/forms', 'edit', 'S???a', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(737, 1, 'vi', 'core/base/forms', 'permalink', '????????ng d????n', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(738, 1, 'vi', 'core/base/forms', 'ok', 'OK', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(739, 1, 'vi', 'core/base/forms', 'cancel', 'Hu??y bo??', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(740, 1, 'vi', 'core/base/forms', 'character_remain', 'k?? t??? c??n l???i', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(741, 1, 'vi', 'core/base/forms', 'template', 'Template', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(742, 1, 'vi', 'core/base/forms', 'choose_file', 'Ch???n t???p tin', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(743, 1, 'vi', 'core/base/forms', 'file', 'T???p tin', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(744, 1, 'vi', 'core/base/forms', 'content', 'N???i dung', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(745, 1, 'vi', 'core/base/forms', 'description', 'M?? t???', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(746, 1, 'vi', 'core/base/forms', 'name', 'T??n', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(747, 1, 'vi', 'core/base/forms', 'name_placeholder', 'Nh???p t??n', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(748, 1, 'vi', 'core/base/forms', 'description_placeholder', 'M?? t??? ng???n', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(749, 1, 'vi', 'core/base/forms', 'parent', 'Cha', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(750, 1, 'vi', 'core/base/forms', 'icon', 'Bi???u t?????ng', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(751, 1, 'vi', 'core/base/forms', 'order_by', 'S???p x???p', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(752, 1, 'vi', 'core/base/forms', 'order_by_placeholder', 'S???p x???p', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(753, 1, 'vi', 'core/base/forms', 'slug', 'Slug', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(754, 1, 'vi', 'core/base/forms', 'is_featured', 'N???i b???t?', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(755, 1, 'vi', 'core/base/forms', 'is_default', 'M???c ?????nh?', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(756, 1, 'vi', 'core/base/forms', 'icon_placeholder', 'V?? d???: fa fa-home', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(757, 1, 'vi', 'core/base/forms', 'update', 'C???p nh???t', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(758, 1, 'vi', 'core/base/forms', 'publish', 'Xu???t b???n', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(759, 1, 'vi', 'core/base/forms', 'remove_image', 'Xo?? ???nh', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(760, 1, 'vi', 'core/base/forms', 'add', 'Th??m', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(761, 1, 'vi', 'core/base/forms', 'add_short_code', 'Th??m shortcode', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(762, 1, 'vi', 'core/base/forms', 'alias', 'M?? thay th???', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(763, 1, 'vi', 'core/base/forms', 'alias_placeholder', 'M?? thay th???', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(764, 1, 'vi', 'core/base/forms', 'basic_information', 'Th??ng tin c?? b???n', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(765, 1, 'vi', 'core/base/forms', 'link', 'Li??n k???t', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(766, 1, 'vi', 'core/base/forms', 'order', 'Th??? t???', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(767, 1, 'vi', 'core/base/forms', 'short_code', 'Shortcode', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(768, 1, 'vi', 'core/base/forms', 'title', 'Ti??u ?????', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(769, 1, 'vi', 'core/base/forms', 'value', 'Gi?? tr???', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(770, 1, 'vi', 'core/base/forms', 'show_hide_editor', '???n/Hi???n tr??nh so???n th???o', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(771, 1, 'vi', 'core/base/forms', 'basic_info_title', 'Th??ng tin c?? b???n', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(772, 1, 'vi', 'core/base/forms', 'remove_file', 'X??a t???p tin', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(773, 1, 'vi', 'core/base/layouts', 'platform_admin', 'Qu???n tr??? h??? th???ng', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(774, 1, 'vi', 'core/base/layouts', 'dashboard', 'B???ng ??i???u khi???n', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(775, 1, 'vi', 'core/base/layouts', 'widgets', 'Ti???n ??ch', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(776, 1, 'vi', 'core/base/layouts', 'plugins', 'Ti???n ??ch m??? r???ng', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(777, 1, 'vi', 'core/base/layouts', 'settings', 'C??i ?????t', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(778, 1, 'vi', 'core/base/layouts', 'setting_general', 'C?? b???n', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(779, 1, 'vi', 'core/base/layouts', 'system_information', 'Th??ng tin h??? th???ng', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(780, 1, 'vi', 'core/base/layouts', 'theme', 'Giao di???n', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(781, 1, 'vi', 'core/base/layouts', 'copyright', 'B???n quy???n :year &copy; :company. Phi??n b???n: <span>:version</span>', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(782, 1, 'vi', 'core/base/layouts', 'profile', 'Th??ng tin c?? nh??n', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(783, 1, 'vi', 'core/base/layouts', 'logout', '????ng xu???t', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(784, 1, 'vi', 'core/base/layouts', 'no_search_result', 'Kh??ng c?? k???t qu??? t??m ki???m, h??y th??? l???i v???i t??? kh??a kh??c.', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(785, 1, 'vi', 'core/base/layouts', 'home', 'Trang ch???', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(786, 1, 'vi', 'core/base/layouts', 'search', 'T??m ki???m', '2021-03-14 19:40:42', '2021-03-14 19:40:42');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(787, 1, 'vi', 'core/base/layouts', 'add_new', 'Th??m m???i', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(788, 1, 'vi', 'core/base/layouts', 'n_a', 'N/A', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(789, 1, 'vi', 'core/base/layouts', 'page_loaded_time', 'Trang t???i xong trong', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(790, 1, 'vi', 'core/base/layouts', 'view_website', 'Xem trang ngo??i', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(791, 1, 'vi', 'core/base/layouts', 'setting_email', 'Email', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(792, 1, 'vi', 'core/base/notices', 'create_success_message', 'T???o th??nh c??ng', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(793, 1, 'vi', 'core/base/notices', 'update_success_message', 'C???p nh???t th??nh c??ng', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(794, 1, 'vi', 'core/base/notices', 'delete_success_message', 'X??a th??nh c??ng', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(795, 1, 'vi', 'core/base/notices', 'success_header', 'Th??nh c??ng!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(796, 1, 'vi', 'core/base/notices', 'error_header', 'L???i!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(797, 1, 'vi', 'core/base/notices', 'no_select', 'Cho??n i??t nh????t 1 tr?????ng ?????? th????c hi????n ha??nh ??????ng na??y!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(798, 1, 'vi', 'core/base/notices', 'processing_request', 'H??? th???ng ??ang x??? l?? y??u c???u.', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(799, 1, 'vi', 'core/base/notices', 'error', 'L???i!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(800, 1, 'vi', 'core/base/notices', 'success', 'Th??nh c??ng!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(801, 1, 'vi', 'core/base/notices', 'info', 'Th??ng tin!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(802, 1, 'vi', 'core/base/notices', 'enum.validate_message', 'Gi?? tr??? c???a :attribute kh??ng h???p l???', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(803, 1, 'vi', 'core/base/system', 'no_select', 'Ha??y cho??n i??t nh????t 1 tr??????ng ?????? th????c hi????n ha??nh ??????ng na??y!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(804, 1, 'vi', 'core/base/system', 'cannot_find_user', 'Kh??ng th???? ta??i ????????c th??ng tin ng??????i du??ng', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(805, 1, 'vi', 'core/base/system', 'supper_revoked', 'Quy????n qua??n tri?? vi??n cao nh????t ??a?? ????????c g???? bo??', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(806, 1, 'vi', 'core/base/system', 'cannot_revoke_yourself', 'Kh??ng th??? g??? b??? quy???n qu???n tr??? c???p cao c???a ch??nh b???n!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(807, 1, 'vi', 'core/base/system', 'cant_remove_supper', 'Ba??n kh??ng co?? quy????n xo??a qua??n tri?? vi??n c????p cao', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(808, 1, 'vi', 'core/base/system', 'cant_find_user_with_email', 'Kh??ng th???? ti??m th????y ng??????i du??ng v????i email na??y', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(809, 1, 'vi', 'core/base/system', 'supper_granted', 'Quy????n qua??n tri?? cao nh????t ??a?? ????????c ga??n', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(810, 1, 'vi', 'core/base/system', 'delete_log_success', 'Xo??a t????p tin log tha??nh c??ng!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(811, 1, 'vi', 'core/base/system', 'get_member_success', 'Hi????n thi?? danh sa??ch tha??nh vi??n tha??nh c??ng', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(812, 1, 'vi', 'core/base/system', 'error_occur', 'C?? l???i d?????i ????y', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(813, 1, 'vi', 'core/base/system', 'role_and_permission', 'Ph??n quy????n h???? th????ng', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(814, 1, 'vi', 'core/base/system', 'role_and_permission_description', 'Qua??n ly?? nh????ng ph??n quy????n trong h???? th????ng', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(815, 1, 'vi', 'core/base/system', 'user.list_super', 'Danh sa??ch qua??n tri?? vi??n c????p cao', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(816, 1, 'vi', 'core/base/system', 'user.username', 'T??n ????ng nh????p', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(817, 1, 'vi', 'core/base/system', 'user.email', 'Email', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(818, 1, 'vi', 'core/base/system', 'user.last_login', '????ng nh????p l????n cu????i	', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(819, 1, 'vi', 'core/base/system', 'user.add_user', 'Th??m qua??n tri?? vi??n c????p cao', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(820, 1, 'vi', 'core/base/system', 'user.cancel', 'Hu??y bo??', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(821, 1, 'vi', 'core/base/system', 'user.create', 'Th??m', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(822, 1, 'vi', 'core/base/system', 'options.features', 'Ki????m soa??t truy c????p ca??c ti??nh n??ng', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(823, 1, 'vi', 'core/base/system', 'options.feature_description', 'B????t/t????t ca??c ti??nh n??ng.', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(824, 1, 'vi', 'core/base/system', 'options.manage_super', 'Qua??n ly?? qua??n tri?? vi??n c????p cao', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(825, 1, 'vi', 'core/base/system', 'options.manage_super_description', 'Th??m/xo??a qua??n tri?? vi??n c????p cao', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(826, 1, 'vi', 'core/base/system', 'options.info', 'Th??ng tin h???? th????ng', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(827, 1, 'vi', 'core/base/system', 'options.info_description', 'Nh????ng th??ng tin v???? c????u hi??nh hi????n ta??i cu??a h???? th????ng.', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(828, 1, 'vi', 'core/base/system', 'info.title', 'Th??ng tin h???? th????ng', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(829, 1, 'vi', 'core/base/system', 'info.cache', 'B??? nh??? ?????m', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(830, 1, 'vi', 'core/base/system', 'info.environment', 'M??i tr?????ng', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(831, 1, 'vi', 'core/base/system', 'info.locale', 'Ng??n ng??? h??? th???ng', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(832, 1, 'vi', 'core/base/system', 'user_management', 'Qu???n l?? th??nh vi??n', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(833, 1, 'vi', 'core/base/system', 'user_management_description', 'Qu???n l?? ng?????i d??ng trong h??? th???ng', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(834, 1, 'vi', 'core/base/system', 'app_size', 'K??ch th?????c ???ng d???ng', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(835, 1, 'vi', 'core/base/system', 'cache_dir_writable', 'C?? th??? ghi b??? nh??? ?????m', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(836, 1, 'vi', 'core/base/system', 'cache_driver', 'Lo???i l??u tr??? b??? nh??? ?????m', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(837, 1, 'vi', 'core/base/system', 'copy_report', 'Sao ch??p b??o c??o', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(838, 1, 'vi', 'core/base/system', 'curl_ext', 'CURL Ext', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(839, 1, 'vi', 'core/base/system', 'database', 'H??? th???ng d??? li???u', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(840, 1, 'vi', 'core/base/system', 'debug_mode', 'Ch??? ????? s???a l???i', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(841, 1, 'vi', 'core/base/system', 'dependency_name', 'T??n g??i', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(842, 1, 'vi', 'core/base/system', 'exif_ext', 'Exif Ext', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(843, 1, 'vi', 'core/base/system', 'extra_information', 'Th??ng tin m??? r???ng', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(844, 1, 'vi', 'core/base/system', 'extra_stats', 'Th???ng k?? th??m', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(845, 1, 'vi', 'core/base/system', 'file_info_ext', 'File info Ext', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(846, 1, 'vi', 'core/base/system', 'framework_version', 'Phi??n b???n framework', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(847, 1, 'vi', 'core/base/system', 'get_system_report', 'L???y th??ng tin h??? th???ng', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(848, 1, 'vi', 'core/base/system', 'installed_packages', 'C??c g??i ???? c??i ?????t v?? phi??n b???n', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(849, 1, 'vi', 'core/base/system', 'mbstring_ext', 'Mbstring Ext', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(850, 1, 'vi', 'core/base/system', 'openssl_ext', 'OpenSSL Ext', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(851, 1, 'vi', 'core/base/system', 'package_name', 'T??n g??i', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(852, 1, 'vi', 'core/base/system', 'pdo_ext', 'PDO Ext', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(853, 1, 'vi', 'core/base/system', 'php_version', 'Phi??n b???n PHP', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(854, 1, 'vi', 'core/base/system', 'report_description', 'Vui l??ng chia s??? th??ng tin n??y nh???m m???c ????ch ??i???u tra nguy??n nh??n g??y l???i', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(855, 1, 'vi', 'core/base/system', 'server_environment', 'M??i tr?????ng m??y ch???', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(856, 1, 'vi', 'core/base/system', 'server_os', 'H??? ??i???u h??nh c???a m??y ch???', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(857, 1, 'vi', 'core/base/system', 'server_software', 'Ph???n m???m', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(858, 1, 'vi', 'core/base/system', 'session_driver', 'Lo???i l??u tr??? phi??n l??m vi???c', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(859, 1, 'vi', 'core/base/system', 'ssl_installed', '???? c??i ?????t ch???ng ch??? SSL', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(860, 1, 'vi', 'core/base/system', 'storage_dir_writable', 'C?? th??? l??u tr??? d??? li???u t???m', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(861, 1, 'vi', 'core/base/system', 'system_environment', 'M??i tr?????ng h??? th???ng', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(862, 1, 'vi', 'core/base/system', 'timezone', 'M??i gi???', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(863, 1, 'vi', 'core/base/system', 'tokenizer_ext', 'Tokenizer Ext', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(864, 1, 'vi', 'core/base/system', 'version', 'Phi??n b???n', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(865, 1, 'vi', 'core/base/system', 'cms_version', 'Phi??n b???n CMS', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(866, 1, 'vi', 'core/base/system', 'queue_connection', 'Queue Connection', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(867, 1, 'vi', 'core/base/system', 'disabled_in_demo_mode', 'B???n kh??ng th??? th???c hi???n h??nh ?????ng n??y ??? ch??? ????? demo!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(868, 1, 'vi', 'core/base/system', 'imagick_or_gd_ext', 'Imagick/GD Ext', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(869, 1, 'vi', 'core/base/system', 'php_version_error', 'Phi??n b???n PHP ph???i >= :version', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(870, 1, 'vi', 'core/base/tables', 'id', 'ID', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(871, 1, 'vi', 'core/base/tables', 'name', 'T??n', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(872, 1, 'vi', 'core/base/tables', 'order_by', 'Th??? t???', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(873, 1, 'vi', 'core/base/tables', 'status', 'Tr???ng th??i', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(874, 1, 'vi', 'core/base/tables', 'created_at', 'Ng??y t???o', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(875, 1, 'vi', 'core/base/tables', 'updated_at', 'Ng??y c???p nh???t', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(876, 1, 'vi', 'core/base/tables', 'operations', 'T??c v???', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(877, 1, 'vi', 'core/base/tables', 'url', 'URL', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(878, 1, 'vi', 'core/base/tables', 'author', 'Ng??????i ta??o', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(879, 1, 'vi', 'core/base/tables', 'column', 'C????t', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(880, 1, 'vi', 'core/base/tables', 'origin', 'Ba??n cu??', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(881, 1, 'vi', 'core/base/tables', 'after_change', 'Sau khi thay ??????i', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(882, 1, 'vi', 'core/base/tables', 'notes', 'Ghi chu??', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(883, 1, 'vi', 'core/base/tables', 'activated', 'k??ch ho???t', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(884, 1, 'vi', 'core/base/tables', 'browser', 'Tr??nh duy???t', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(885, 1, 'vi', 'core/base/tables', 'deactivated', 'h???y k??ch ho???t', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(886, 1, 'vi', 'core/base/tables', 'description', 'M?? t???', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(887, 1, 'vi', 'core/base/tables', 'session', 'Phi??n', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(888, 1, 'vi', 'core/base/tables', 'views', 'L?????t xem', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(889, 1, 'vi', 'core/base/tables', 'restore', 'Kh??i ph???c', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(890, 1, 'vi', 'core/base/tables', 'edit', 'S???a', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(891, 1, 'vi', 'core/base/tables', 'delete', 'X??a', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(892, 1, 'vi', 'core/base/tables', 'action', 'H??nh ?????ng', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(893, 1, 'vi', 'core/base/tables', 'activate', 'K??ch ho???t', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(894, 1, 'vi', 'core/base/tables', 'add_new', 'Th??m m???i', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(895, 1, 'vi', 'core/base/tables', 'all', 'T???t c???', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(896, 1, 'vi', 'core/base/tables', 'cancel', 'H???y b???', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(897, 1, 'vi', 'core/base/tables', 'confirm_delete', 'X??c nh???n x??a', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(898, 1, 'vi', 'core/base/tables', 'confirm_delete_msg', 'B???n c?? ch???c ch???n mu???n x??a b???n ghi n??y?', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(899, 1, 'vi', 'core/base/tables', 'csv', 'CSV', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(900, 1, 'vi', 'core/base/tables', 'deactivate', 'H???y k??ch ho???t', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(901, 1, 'vi', 'core/base/tables', 'delete_entry', 'X??a b???n ghi', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(902, 1, 'vi', 'core/base/tables', 'display', 'Hi???n th???', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(903, 1, 'vi', 'core/base/tables', 'excel', 'Excel', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(904, 1, 'vi', 'core/base/tables', 'export', 'Xu???t b???n', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(905, 1, 'vi', 'core/base/tables', 'in', 'trong t???ng s???', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(906, 1, 'vi', 'core/base/tables', 'no_data', 'Kh??ng c?? d??? li???u ????? hi???n th???', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(907, 1, 'vi', 'core/base/tables', 'no_record', 'Kh??ng c?? d??? li???u', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(908, 1, 'vi', 'core/base/tables', 'pdf', 'PDF', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(909, 1, 'vi', 'core/base/tables', 'print', 'In', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(910, 1, 'vi', 'core/base/tables', 'records', 'b???n ghi', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(911, 1, 'vi', 'core/base/tables', 'reload', 'T???i l???i', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(912, 1, 'vi', 'core/base/tables', 'reset', 'L??m m???i', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(913, 1, 'vi', 'core/base/tables', 'save', 'L??u', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(914, 1, 'vi', 'core/base/tables', 'show_from', 'Hi???n th??? t???', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(915, 1, 'vi', 'core/base/tables', 'template', 'Giao di???n', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(916, 1, 'vi', 'core/base/tables', 'to', '?????n', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(917, 1, 'vi', 'core/base/tables', 'view', 'Xem chi ti???t', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(918, 1, 'vi', 'core/base/tables', 'email', 'Email', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(919, 1, 'vi', 'core/base/tables', 'image', 'H??nh ???nh', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(920, 1, 'vi', 'core/base/tables', 'is_featured', 'N???i b???t', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(921, 1, 'vi', 'core/base/tables', 'last_login', 'L???n cu???i ????ng nh???p', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(922, 1, 'vi', 'core/base/tables', 'order', 'Th??? t???', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(923, 1, 'vi', 'core/base/tables', 'shortcode', 'Shortcode', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(924, 1, 'vi', 'core/base/tables', 'slug', 'Slug', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(925, 1, 'vi', 'core/base/tables', 'title', 'Ti??u ?????', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(926, 1, 'vi', 'core/base/tables', 'bulk_changes', 'Thay ?????i h??ng lo???t', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(927, 1, 'vi', 'core/base/tables', 'confirm_delete_many_msg', 'B???n c?? ch???c ch???n mu???n x??a nh???ng b???n ghi n??y?', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(928, 1, 'vi', 'core/base/tables', 'submit', 'Ho??n t???t', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(929, 1, 'vi', 'core/base/tabs', 'detail', 'Chi ti???t', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(930, 1, 'vi', 'core/base/tabs', 'file', 'T???p tin', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(931, 1, 'vi', 'core/base/tabs', 'record_note', 'Ghi ch??', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(932, 1, 'vi', 'core/base/tabs', 'revision', 'L???ch s??? thay ?????i', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(933, 1, 'en', 'core/dashboard/dashboard', 'update_position_success', 'Update widget position successfully!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(934, 1, 'en', 'core/dashboard/dashboard', 'hide_success', 'Update widget successfully!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(935, 1, 'en', 'core/dashboard/dashboard', 'confirm_hide', 'Are you sure?', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(936, 1, 'en', 'core/dashboard/dashboard', 'hide_message', 'Do you really want to hide this widget? It will be disappear on Dashboard!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(937, 1, 'en', 'core/dashboard/dashboard', 'confirm_hide_btn', 'Yes, hide this widget', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(938, 1, 'en', 'core/dashboard/dashboard', 'cancel_hide_btn', 'Cancel', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(939, 1, 'en', 'core/dashboard/dashboard', 'collapse_expand', 'Collapse/Expand', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(940, 1, 'en', 'core/dashboard/dashboard', 'hide', 'Hide', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(941, 1, 'en', 'core/dashboard/dashboard', 'reload', 'Reload', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(942, 1, 'en', 'core/dashboard/dashboard', 'save_setting_success', 'Save widget settings successfully!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(943, 1, 'en', 'core/dashboard/dashboard', 'widget_not_exists', 'Widget is not exits!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(944, 1, 'en', 'core/dashboard/dashboard', 'manage_widgets', 'Manage Widgets', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(945, 1, 'en', 'core/dashboard/dashboard', 'fullscreen', 'Full screen', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(946, 1, 'en', 'core/dashboard/dashboard', 'title', 'Dashboard', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(947, 1, 'vi', 'core/dashboard/dashboard', 'cancel_hide_btn', 'H???y b???', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(948, 1, 'vi', 'core/dashboard/dashboard', 'collapse_expand', 'M??? r???ng', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(949, 1, 'vi', 'core/dashboard/dashboard', 'confirm_hide', 'B???n c?? ch???c?', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(950, 1, 'vi', 'core/dashboard/dashboard', 'confirm_hide_btn', 'V??ng, ???n ti???n ??ch n??y', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(951, 1, 'vi', 'core/dashboard/dashboard', 'hide', '???n', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(952, 1, 'vi', 'core/dashboard/dashboard', 'hide_message', 'B???n c?? ch???c ch???n mu???n ???n ti???n ??ch n??y? N?? s??? kh??ng ???????c hi???n th??? tr??n trang ch??? n???a!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(953, 1, 'vi', 'core/dashboard/dashboard', 'hide_success', '???n ti???n ??ch th??nh c??ng!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(954, 1, 'vi', 'core/dashboard/dashboard', 'manage_widgets', 'Qu???n l?? ti???n ??ch', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(955, 1, 'vi', 'core/dashboard/dashboard', 'reload', 'L??m m???i', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(956, 1, 'vi', 'core/dashboard/dashboard', 'save_setting_success', 'L??u ti???n ??ch th??nh c??ng', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(957, 1, 'vi', 'core/dashboard/dashboard', 'update_position_success', 'C???p nh???t v??? tr?? ti???n ??ch th??nh c??ng!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(958, 1, 'vi', 'core/dashboard/dashboard', 'widget_not_exists', 'Ti???n ??ch n??y kh??ng t???n t???i!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(959, 1, 'vi', 'core/dashboard/dashboard', 'fullscreen', 'To??n m??n h??nh', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(960, 1, 'vi', 'core/dashboard/dashboard', 'title', 'Trang qu???n tr???', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(961, 1, 'en', 'core/media/media', 'filter', 'Filter', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(962, 1, 'en', 'core/media/media', 'everything', 'Everything', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(963, 1, 'en', 'core/media/media', 'image', 'Image', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(964, 1, 'en', 'core/media/media', 'video', 'Video', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(965, 1, 'en', 'core/media/media', 'document', 'Document', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(966, 1, 'en', 'core/media/media', 'view_in', 'View in', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(967, 1, 'en', 'core/media/media', 'all_media', 'All media', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(968, 1, 'en', 'core/media/media', 'trash', 'Trash', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(969, 1, 'en', 'core/media/media', 'recent', 'Recent', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(970, 1, 'en', 'core/media/media', 'favorites', 'Favorites', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(971, 1, 'en', 'core/media/media', 'upload', 'Upload', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(972, 1, 'en', 'core/media/media', 'create_folder', 'Create folder', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(973, 1, 'en', 'core/media/media', 'refresh', 'Refresh', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(974, 1, 'en', 'core/media/media', 'empty_trash', 'Empty trash', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(975, 1, 'en', 'core/media/media', 'search_file_and_folder', 'Search file and folder', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(976, 1, 'en', 'core/media/media', 'sort', 'Sort', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(977, 1, 'en', 'core/media/media', 'file_name_asc', 'File name - ASC', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(978, 1, 'en', 'core/media/media', 'file_name_desc', 'File name - DESC', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(979, 1, 'en', 'core/media/media', 'uploaded_date_asc', 'Uploaded date - ASC', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(980, 1, 'en', 'core/media/media', 'uploaded_date_desc', 'Uploaded date - DESC', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(981, 1, 'en', 'core/media/media', 'size_asc', 'Size - ASC', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(982, 1, 'en', 'core/media/media', 'size_desc', 'Size - DESC', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(983, 1, 'en', 'core/media/media', 'actions', 'Actions', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(984, 1, 'en', 'core/media/media', 'nothing_is_selected', 'Nothing is selected', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(985, 1, 'en', 'core/media/media', 'insert', 'Insert', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(986, 1, 'en', 'core/media/media', 'folder_name', 'Folder name', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(987, 1, 'en', 'core/media/media', 'create', 'Create', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(988, 1, 'en', 'core/media/media', 'rename', 'Rename', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(989, 1, 'en', 'core/media/media', 'close', 'Close', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(990, 1, 'en', 'core/media/media', 'save_changes', 'Save changes', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(991, 1, 'en', 'core/media/media', 'move_to_trash', 'Move items to trash', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(992, 1, 'en', 'core/media/media', 'confirm_trash', 'Are you sure you want to move these items to trash?', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(993, 1, 'en', 'core/media/media', 'confirm', 'Confirm', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(994, 1, 'en', 'core/media/media', 'confirm_delete', 'Delete item(s)', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(995, 1, 'en', 'core/media/media', 'confirm_delete_description', 'Your request cannot rollback. Are you sure you wanna delete these items?', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(996, 1, 'en', 'core/media/media', 'empty_trash_title', 'Empty trash', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(997, 1, 'en', 'core/media/media', 'empty_trash_description', 'Your request cannot rollback. Are you sure you wanna remove all items in trash?', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(998, 1, 'en', 'core/media/media', 'up_level', 'Up one level', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(999, 1, 'en', 'core/media/media', 'upload_progress', 'Upload progress', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1000, 1, 'en', 'core/media/media', 'folder_created', 'Folder is created successfully!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1001, 1, 'en', 'core/media/media', 'gallery', 'Media gallery', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1002, 1, 'en', 'core/media/media', 'trash_error', 'Error when delete selected item(s)', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1003, 1, 'en', 'core/media/media', 'trash_success', 'Moved selected item(s) to trash successfully!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1004, 1, 'en', 'core/media/media', 'restore_error', 'Error when restore selected item(s)', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1005, 1, 'en', 'core/media/media', 'restore_success', 'Restore selected item(s) successfully!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1006, 1, 'en', 'core/media/media', 'copy_success', 'Copied selected item(s) successfully!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1007, 1, 'en', 'core/media/media', 'delete_success', 'Deleted selected item(s) successfully!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1008, 1, 'en', 'core/media/media', 'favorite_success', 'Favorite selected item(s) successfully!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1009, 1, 'en', 'core/media/media', 'remove_favorite_success', 'Remove selected item(s) from favorites successfully!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1010, 1, 'en', 'core/media/media', 'rename_error', 'Error when rename item(s)', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1011, 1, 'en', 'core/media/media', 'rename_success', 'Rename selected item(s) successfully!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1012, 1, 'en', 'core/media/media', 'empty_trash_success', 'Empty trash successfully!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1013, 1, 'en', 'core/media/media', 'invalid_action', 'Invalid action!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1014, 1, 'en', 'core/media/media', 'file_not_exists', 'File is not exists!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1015, 1, 'en', 'core/media/media', 'download_file_error', 'Error when downloading files!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1016, 1, 'en', 'core/media/media', 'missing_zip_archive_extension', 'Please enable ZipArchive extension to download file!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1017, 1, 'en', 'core/media/media', 'can_not_download_file', 'Can not download this file!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1018, 1, 'en', 'core/media/media', 'invalid_request', 'Invalid request!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1019, 1, 'en', 'core/media/media', 'add_success', 'Add item successfully!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1020, 1, 'en', 'core/media/media', 'file_too_big', 'File too big. Max file upload is :size bytes', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1021, 1, 'en', 'core/media/media', 'can_not_detect_file_type', 'File type is not allowed or can not detect file type!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1022, 1, 'en', 'core/media/media', 'upload_failed', 'The file is NOT uploaded completely. The server allows max upload file size is :size . Please check your file size OR try to upload again in case of having network errors', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1023, 1, 'en', 'core/media/media', 'menu_name', 'Media', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1024, 1, 'en', 'core/media/media', 'add', 'Add media', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1025, 1, 'en', 'core/media/media', 'javascript.name', 'Name', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1026, 1, 'en', 'core/media/media', 'javascript.url', 'URL', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1027, 1, 'en', 'core/media/media', 'javascript.full_url', 'Full URL', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1028, 1, 'en', 'core/media/media', 'javascript.size', 'Size', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1029, 1, 'en', 'core/media/media', 'javascript.mime_type', 'Type', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1030, 1, 'en', 'core/media/media', 'javascript.created_at', 'Uploaded at', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1031, 1, 'en', 'core/media/media', 'javascript.updated_at', 'Modified at', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1032, 1, 'en', 'core/media/media', 'javascript.nothing_selected', 'Nothing is selected', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1033, 1, 'en', 'core/media/media', 'javascript.visit_link', 'Open link', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1034, 1, 'en', 'core/media/media', 'javascript.no_item.all_media.icon', 'fas fa-cloud-upload-alt', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1035, 1, 'en', 'core/media/media', 'javascript.no_item.all_media.title', 'Drop files and folders here', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1036, 1, 'en', 'core/media/media', 'javascript.no_item.all_media.message', 'Or use the upload button above', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1037, 1, 'en', 'core/media/media', 'javascript.no_item.trash.icon', 'fas fa-trash-alt', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1038, 1, 'en', 'core/media/media', 'javascript.no_item.trash.title', 'There is nothing in your trash currently', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1039, 1, 'en', 'core/media/media', 'javascript.no_item.trash.message', 'Delete files to move them to trash automatically. Delete files from trash to remove them permanently', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1040, 1, 'en', 'core/media/media', 'javascript.no_item.favorites.icon', 'fas fa-star', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1041, 1, 'en', 'core/media/media', 'javascript.no_item.favorites.title', 'You have not added anything to your favorites yet', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1042, 1, 'en', 'core/media/media', 'javascript.no_item.favorites.message', 'Add files to favorites to easily find them later', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1043, 1, 'en', 'core/media/media', 'javascript.no_item.recent.icon', 'far fa-clock', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1044, 1, 'en', 'core/media/media', 'javascript.no_item.recent.title', 'You did not opened anything yet', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1045, 1, 'en', 'core/media/media', 'javascript.no_item.recent.message', 'All recent files that you opened will be appeared here', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1046, 1, 'en', 'core/media/media', 'javascript.no_item.default.icon', 'fas fa-sync', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1047, 1, 'en', 'core/media/media', 'javascript.no_item.default.title', 'No items', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1048, 1, 'en', 'core/media/media', 'javascript.no_item.default.message', 'This directory has no item', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1049, 1, 'en', 'core/media/media', 'javascript.clipboard.success', 'These file links has been copied to clipboard', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1050, 1, 'en', 'core/media/media', 'javascript.message.error_header', 'Error', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1051, 1, 'en', 'core/media/media', 'javascript.message.success_header', 'Success', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1052, 1, 'en', 'core/media/media', 'javascript.download.error', 'No files selected or cannot download these files', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1053, 1, 'en', 'core/media/media', 'javascript.actions_list.basic.preview', 'Preview', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1054, 1, 'en', 'core/media/media', 'javascript.actions_list.file.copy_link', 'Copy link', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1055, 1, 'en', 'core/media/media', 'javascript.actions_list.file.rename', 'Rename', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1056, 1, 'en', 'core/media/media', 'javascript.actions_list.file.make_copy', 'Make a copy', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1057, 1, 'en', 'core/media/media', 'javascript.actions_list.user.favorite', 'Add to favorite', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1058, 1, 'en', 'core/media/media', 'javascript.actions_list.user.remove_favorite', 'Remove favorite', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1059, 1, 'en', 'core/media/media', 'javascript.actions_list.other.download', 'Download', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1060, 1, 'en', 'core/media/media', 'javascript.actions_list.other.trash', 'Move to trash', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1061, 1, 'en', 'core/media/media', 'javascript.actions_list.other.delete', 'Delete permanently', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1062, 1, 'en', 'core/media/media', 'javascript.actions_list.other.restore', 'Restore', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1063, 1, 'en', 'core/media/media', 'name_invalid', 'The folder name has invalid character(s).', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1064, 1, 'en', 'core/media/media', 'url_invalid', 'Please provide a valid URL', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1065, 1, 'en', 'core/media/media', 'path_invalid', 'Please provide a valid path', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1066, 1, 'vi', 'core/media/media', 'filter', 'L???c', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1067, 1, 'vi', 'core/media/media', 'everything', 'T???t c???', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1068, 1, 'vi', 'core/media/media', 'image', 'H??nh ???nh', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1069, 1, 'vi', 'core/media/media', 'video', 'Phim', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1070, 1, 'vi', 'core/media/media', 'document', 'T??i li???u', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1071, 1, 'vi', 'core/media/media', 'view_in', 'Ch??? ????? xem', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1072, 1, 'vi', 'core/media/media', 'all_media', 'T???t c??? t???p tin', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1073, 1, 'vi', 'core/media/media', 'trash', 'Th??ng r??c', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1074, 1, 'vi', 'core/media/media', 'recent', 'G???n ????y', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1075, 1, 'vi', 'core/media/media', 'favorites', '???????c g???n d???u sao', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1076, 1, 'vi', 'core/media/media', 'upload', 'T???i l??n', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1077, 1, 'vi', 'core/media/media', 'create_folder', 'T???o th?? m???c', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1078, 1, 'vi', 'core/media/media', 'refresh', 'L??m m???i', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1079, 1, 'vi', 'core/media/media', 'empty_trash', 'D???n th??ng r??c', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1080, 1, 'vi', 'core/media/media', 'search_file_and_folder', 'T??m ki???m t???p tin v?? th?? m???c', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1081, 1, 'vi', 'core/media/media', 'sort', 'S???p x???p', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1082, 1, 'vi', 'core/media/media', 'file_name_asc', 'T??n t???p tin - ASC', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1083, 1, 'vi', 'core/media/media', 'file_name_desc', 'T??n t???p tin - DESC', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1084, 1, 'vi', 'core/media/media', 'uploaded_date_asc', 'Ng??y t???i l??n - ASC', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1085, 1, 'vi', 'core/media/media', 'uploaded_date_desc', 'Ng??y t???i l??n - DESC', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1086, 1, 'vi', 'core/media/media', 'size_asc', 'K??ch th?????c - ASC', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1087, 1, 'vi', 'core/media/media', 'size_desc', 'K??ch th?????c - DESC', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1088, 1, 'vi', 'core/media/media', 'actions', 'H??nh ?????ng', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1089, 1, 'vi', 'core/media/media', 'nothing_is_selected', 'Kh??ng c?? t???p tin n??o ???????c ch???n', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1090, 1, 'vi', 'core/media/media', 'insert', 'Ch??n', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1091, 1, 'vi', 'core/media/media', 'folder_name', 'T??n th?? m???c', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1092, 1, 'vi', 'core/media/media', 'create', 'T???o', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1093, 1, 'vi', 'core/media/media', 'rename', '?????i t??n', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1094, 1, 'vi', 'core/media/media', 'close', '????ng', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1095, 1, 'vi', 'core/media/media', 'save_changes', 'L??u thay ?????i', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1096, 1, 'vi', 'core/media/media', 'move_to_trash', '????a v??o th??ng r??c', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1097, 1, 'vi', 'core/media/media', 'confirm_trash', 'B???n c?? ch???c ch???n mu???n b??? nh???ng t???p tin n??y v??o th??ng r??c?', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1098, 1, 'vi', 'core/media/media', 'confirm', 'X??c nh???n', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1099, 1, 'vi', 'core/media/media', 'confirm_delete', 'X??a t???p tin', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1100, 1, 'vi', 'core/media/media', 'confirm_delete_description', 'H??nh ?????ng n??y kh??ng th??? kh??i ph???c. B???n c?? ch???c ch???n mu???n x??a c??c t???p tin n??y?', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1101, 1, 'vi', 'core/media/media', 'empty_trash_title', 'D???n s???ch th??ng r??c', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1102, 1, 'vi', 'core/media/media', 'empty_trash_description', 'H??nh ?????ng n??y kh??ng th??? kh??i ph???c. B???n c?? ch???c ch???n mu???n d???n s???ch th??ng r??c?', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1103, 1, 'vi', 'core/media/media', 'up_level', 'Quay l???i m???t c???p', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1104, 1, 'vi', 'core/media/media', 'upload_progress', 'Ti???n tr??nh t???i l??n', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1105, 1, 'vi', 'core/media/media', 'folder_created', 'T???o th?? m???c th??nh c??ng!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1106, 1, 'vi', 'core/media/media', 'gallery', 'Th?? vi???n t???p tin', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1107, 1, 'vi', 'core/media/media', 'trash_error', 'C?? l???i khi x??a t???p tin/th?? m???c', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1108, 1, 'vi', 'core/media/media', 'trash_success', 'X??a t???p tin/th?? m???c th??nh c??ng!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1109, 1, 'vi', 'core/media/media', 'restore_error', 'C?? l???i trong qu?? tr??nh kh??i ph???c', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1110, 1, 'vi', 'core/media/media', 'restore_success', 'Kh??i ph???c th??nh c??ng!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1111, 1, 'vi', 'core/media/media', 'copy_success', 'Sao ch??p th??nh c??ng!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1112, 1, 'vi', 'core/media/media', 'delete_success', 'X??a th??nh c??ng!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1113, 1, 'vi', 'core/media/media', 'favorite_success', 'Th??m d???u sao th??nh c??ng!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1114, 1, 'vi', 'core/media/media', 'remove_favorite_success', 'B??? d???u sao th??nh c??ng!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1115, 1, 'vi', 'core/media/media', 'rename_error', 'C?? l???i trong qu?? tr??nh ?????i t??n', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1116, 1, 'vi', 'core/media/media', 'rename_success', '?????i t??n th??nh c??ng!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1117, 1, 'vi', 'core/media/media', 'invalid_action', 'H??nh ?????ng kh??ng h???p l???!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1118, 1, 'vi', 'core/media/media', 'file_not_exists', 'T???p tin kh??ng t???n t???i!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1119, 1, 'vi', 'core/media/media', 'download_file_error', 'C?? l???i trong qu?? tr??nh t???i xu???ng t???p tin!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1120, 1, 'vi', 'core/media/media', 'missing_zip_archive_extension', 'H??y b???t ZipArchive extension ????? t???i t???p tin!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1121, 1, 'vi', 'core/media/media', 'can_not_download_file', 'Kh??ng th??? t???i t???p tin!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1122, 1, 'vi', 'core/media/media', 'invalid_request', 'Y??u c???u kh??ng h???p l???!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1123, 1, 'vi', 'core/media/media', 'add_success', 'Th??m th??nh c??ng!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1124, 1, 'vi', 'core/media/media', 'file_too_big', 'T???p tin qu?? l???n. Gi???i h???n t???i l??n l?? :size bytes', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1125, 1, 'vi', 'core/media/media', 'can_not_detect_file_type', 'Lo???i t???p tin kh??ng h???p l??? ho???c kh??ng th??? x??c ?????nh lo???i t???p tin!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1126, 1, 'vi', 'core/media/media', 'upload_failed', 'The file is NOT uploaded completely. The server allows max upload file size is :size . Please check your file size OR try to upload again in case of having network errors', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1127, 1, 'vi', 'core/media/media', 'menu_name', 'Qu???n l?? t???p tin', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1128, 1, 'vi', 'core/media/media', 'add', 'Th??m t???p tin', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1129, 1, 'vi', 'core/media/media', 'javascript.name', 'T??n', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1130, 1, 'vi', 'core/media/media', 'javascript.url', '???????ng d???n', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1131, 1, 'vi', 'core/media/media', 'javascript.full_url', '???????ng d???n tuy???t ?????i', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1132, 1, 'vi', 'core/media/media', 'javascript.size', 'K??ch th?????c', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1133, 1, 'vi', 'core/media/media', 'javascript.mime_type', 'Lo???i', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1134, 1, 'vi', 'core/media/media', 'javascript.created_at', '???????c t???i l??n l??c', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1135, 1, 'vi', 'core/media/media', 'javascript.updated_at', '???????c ch???nh s???a l??c', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1136, 1, 'vi', 'core/media/media', 'javascript.nothing_selected', 'B???n ch??a ch???n t???p tin n??o', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1137, 1, 'vi', 'core/media/media', 'javascript.visit_link', 'M??? li??n k???t', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1138, 1, 'vi', 'core/media/media', 'javascript.no_item.all_media.icon', 'fas fa-cloud-upload-alt', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1139, 1, 'vi', 'core/media/media', 'javascript.no_item.all_media.title', 'B???n c?? th??? k??o th??? t???p tin v??o ????y ????? t???i l??n', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1140, 1, 'vi', 'core/media/media', 'javascript.no_item.all_media.message', 'Ho???c c?? th??? b???m n??t T???i l??n ??? ph??a tr??n', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1141, 1, 'vi', 'core/media/media', 'javascript.no_item.trash.icon', 'fas fa-trash-alt', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1142, 1, 'vi', 'core/media/media', 'javascript.no_item.trash.title', 'Hi???n t???i kh??ng c?? t???p tin n??o trong th??ng r??c', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1143, 1, 'vi', 'core/media/media', 'javascript.no_item.trash.message', 'X??a t???p tin s??? ??em t???p tin l??u v??o th??ng r??c. X??a t???p tin trong th??ng r??c s??? x??a v??nh vi???n.', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1144, 1, 'vi', 'core/media/media', 'javascript.no_item.favorites.icon', 'fas fa-star', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1145, 1, 'vi', 'core/media/media', 'javascript.no_item.favorites.title', 'B???n ch??a ?????t t???p tin n??o v??o m???c y??u th??ch', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1146, 1, 'vi', 'core/media/media', 'javascript.no_item.favorites.message', 'Th??m t???p tin v??o m???c y??u th??ch ????? t??m ki???m ch??ng d??? d??ng sau n??y.', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1147, 1, 'vi', 'core/media/media', 'javascript.no_item.recent.icon', 'far fa-clock', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1148, 1, 'vi', 'core/media/media', 'javascript.no_item.recent.title', 'B???n ch??a m??? t???p tin n??o.', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1149, 1, 'vi', 'core/media/media', 'javascript.no_item.recent.message', 'M???c n??y hi???n th??? c??c t???p tin b???n ???? xem g???n ????y.', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1150, 1, 'vi', 'core/media/media', 'javascript.no_item.default.icon', 'fas fa-sync', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1151, 1, 'vi', 'core/media/media', 'javascript.no_item.default.title', 'Th?? m???c tr???ng', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1152, 1, 'vi', 'core/media/media', 'javascript.no_item.default.message', 'Th?? m???c n??y ch??a c?? t???p tin n??o', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1153, 1, 'vi', 'core/media/media', 'javascript.clipboard.success', '???????ng d???n c???a c??c t???p tin ???? ???????c sao ch??p v??o clipboard', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1154, 1, 'vi', 'core/media/media', 'javascript.message.error_header', 'L???i', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1155, 1, 'vi', 'core/media/media', 'javascript.message.success_header', 'Th??nh c??ng', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1156, 1, 'vi', 'core/media/media', 'javascript.download.error', 'B???n ch??a ch???n t???p tin n??o ho???c t???p tin n??y kh??ng cho ph??p t???i v???', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1157, 1, 'vi', 'core/media/media', 'javascript.actions_list.basic.preview', 'Xem tr?????c', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1158, 1, 'vi', 'core/media/media', 'javascript.actions_list.file.copy_link', 'Sao ch??p ???????ng d???n', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1159, 1, 'vi', 'core/media/media', 'javascript.actions_list.file.rename', '?????i t??n', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1160, 1, 'vi', 'core/media/media', 'javascript.actions_list.file.make_copy', 'Nh??n b???n', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1161, 1, 'vi', 'core/media/media', 'javascript.actions_list.user.favorite', 'Y??u th??ch', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1162, 1, 'vi', 'core/media/media', 'javascript.actions_list.user.remove_favorite', 'X??a kh???i m???c y??u th??ch', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1163, 1, 'vi', 'core/media/media', 'javascript.actions_list.other.download', 'T???i xu???ng', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1164, 1, 'vi', 'core/media/media', 'javascript.actions_list.other.trash', 'Chuy???n v??o th??ng r??c', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1165, 1, 'vi', 'core/media/media', 'javascript.actions_list.other.delete', 'X??a ho??n to??n', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1166, 1, 'vi', 'core/media/media', 'javascript.actions_list.other.restore', 'Kh??i ph???c', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1167, 1, 'vi', 'core/media/media', 'empty_trash_success', 'D???n s???ch th??ng r??c th??nh c??ng', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1168, 1, 'vi', 'core/media/media', 'name_invalid', 'T??n th?? m???c ch???a k?? t??? kh??ng h???p l???', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1169, 1, 'vi', 'core/media/media', 'path_invalid', 'Vui l??ng cung c???p 1 ???????ng d???n h???p l???', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1170, 1, 'vi', 'core/media/media', 'url_invalid', 'Vui l??ng cung c???p 1 ???????ng d???n h???p l???', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1171, 1, 'en', 'core/setting/setting', 'title', 'Settings', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1172, 1, 'en', 'core/setting/setting', 'email_setting_title', 'Email settings', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1173, 1, 'en', 'core/setting/setting', 'general.theme', 'Theme', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1174, 1, 'en', 'core/setting/setting', 'general.description', 'Setting site information', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1175, 1, 'en', 'core/setting/setting', 'general.title', 'General', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1176, 1, 'en', 'core/setting/setting', 'general.general_block', 'General Information', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1177, 1, 'en', 'core/setting/setting', 'general.rich_editor', 'Rich Editor', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1178, 1, 'en', 'core/setting/setting', 'general.site_title', 'Site title', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1179, 1, 'en', 'core/setting/setting', 'general.admin_email', 'Admin Email', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1180, 1, 'en', 'core/setting/setting', 'general.seo_block', 'SEO Configuration', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1181, 1, 'en', 'core/setting/setting', 'general.seo_title', 'SEO Title', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1182, 1, 'en', 'core/setting/setting', 'general.seo_description', 'SEO Description', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1183, 1, 'en', 'core/setting/setting', 'general.webmaster_tools_block', 'Google Webmaster Tools', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1184, 1, 'en', 'core/setting/setting', 'general.google_site_verification', 'Google site verification', '2021-03-14 19:40:43', '2021-03-14 19:40:43');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1185, 1, 'en', 'core/setting/setting', 'general.placeholder.site_title', 'Site Title (maximum 120 characters)', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1186, 1, 'en', 'core/setting/setting', 'general.placeholder.admin_email', 'Admin Email', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1187, 1, 'en', 'core/setting/setting', 'general.placeholder.seo_title', 'SEO Title (maximum 120 characters)', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1188, 1, 'en', 'core/setting/setting', 'general.placeholder.seo_description', 'SEO Description (maximum 120 characters)', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1189, 1, 'en', 'core/setting/setting', 'general.placeholder.google_analytics', 'Google Analytics', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1190, 1, 'en', 'core/setting/setting', 'general.placeholder.google_site_verification', 'Google Site Verification', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1191, 1, 'en', 'core/setting/setting', 'general.cache_admin_menu', 'Cache admin menu?', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1192, 1, 'en', 'core/setting/setting', 'general.enable_send_error_reporting_via_email', 'Enable to send error reporting via email?', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1193, 1, 'en', 'core/setting/setting', 'general.time_zone', 'Timezone', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1194, 1, 'en', 'core/setting/setting', 'general.default_admin_theme', 'Default admin theme', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1195, 1, 'en', 'core/setting/setting', 'general.enable_change_admin_theme', 'Enable change admin theme?', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1196, 1, 'en', 'core/setting/setting', 'general.enable', 'Enable', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1197, 1, 'en', 'core/setting/setting', 'general.disable', 'Disable', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1198, 1, 'en', 'core/setting/setting', 'general.enable_cache', 'Enable cache?', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1199, 1, 'en', 'core/setting/setting', 'general.cache_time', 'Cache time (minutes)', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1200, 1, 'en', 'core/setting/setting', 'general.cache_time_site_map', 'Cache Time Site map', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1201, 1, 'en', 'core/setting/setting', 'general.admin_logo', 'Admin logo', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1202, 1, 'en', 'core/setting/setting', 'general.admin_favicon', 'Admin favicon', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1203, 1, 'en', 'core/setting/setting', 'general.admin_title', 'Admin title', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1204, 1, 'en', 'core/setting/setting', 'general.admin_title_placeholder', 'Title show to tab of browser', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1205, 1, 'en', 'core/setting/setting', 'general.cache_block', 'Cache', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1206, 1, 'en', 'core/setting/setting', 'general.admin_appearance_title', 'Admin appearance', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1207, 1, 'en', 'core/setting/setting', 'general.admin_appearance_description', 'Setting admin appearance such as editor, language...', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1208, 1, 'en', 'core/setting/setting', 'general.seo_block_description', 'Setting site title, site meta description, site keyword for optimize SEO', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1209, 1, 'en', 'core/setting/setting', 'general.webmaster_tools_description', 'Google Webmaster Tools (GWT) is free software that helps you manage the technical side of your website', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1210, 1, 'en', 'core/setting/setting', 'general.cache_description', 'Config cache for system for optimize speed', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1211, 1, 'en', 'core/setting/setting', 'general.yes', 'Yes', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1212, 1, 'en', 'core/setting/setting', 'general.no', 'No', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1213, 1, 'en', 'core/setting/setting', 'general.show_on_front', 'Your homepage displays', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1214, 1, 'en', 'core/setting/setting', 'general.select', '??? Select ???', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1215, 1, 'en', 'core/setting/setting', 'general.show_site_name', 'Show site name after page title, separate with \"-\"?', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1216, 1, 'en', 'core/setting/setting', 'general.locale', 'Site language', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1217, 1, 'en', 'core/setting/setting', 'general.locale_direction', 'Language direction', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1218, 1, 'en', 'core/setting/setting', 'general.admin_login_screen_backgrounds', 'Login screen backgrounds (~1366x768)', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1219, 1, 'en', 'core/setting/setting', 'email.subject', 'Subject', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1220, 1, 'en', 'core/setting/setting', 'email.content', 'Content', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1221, 1, 'en', 'core/setting/setting', 'email.title', 'Setting for email template', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1222, 1, 'en', 'core/setting/setting', 'email.description', 'Email template using HTML & system variables.', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1223, 1, 'en', 'core/setting/setting', 'email.reset_to_default', 'Reset to default', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1224, 1, 'en', 'core/setting/setting', 'email.back', 'Back to settings', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1225, 1, 'en', 'core/setting/setting', 'email.reset_success', 'Reset back to default successfully', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1226, 1, 'en', 'core/setting/setting', 'email.confirm_reset', 'Confirm reset email template?', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1227, 1, 'en', 'core/setting/setting', 'email.confirm_message', 'Do you really want to reset this email template to default?', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1228, 1, 'en', 'core/setting/setting', 'email.continue', 'Continue', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1229, 1, 'en', 'core/setting/setting', 'email.sender_name', 'Sender name', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1230, 1, 'en', 'core/setting/setting', 'email.sender_name_placeholder', 'Name', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1231, 1, 'en', 'core/setting/setting', 'email.sender_email', 'Sender email', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1232, 1, 'en', 'core/setting/setting', 'email.mailer', 'Mailer', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1233, 1, 'en', 'core/setting/setting', 'email.port', 'Port', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1234, 1, 'en', 'core/setting/setting', 'email.port_placeholder', 'Ex: 587', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1235, 1, 'en', 'core/setting/setting', 'email.host', 'Host', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1236, 1, 'en', 'core/setting/setting', 'email.host_placeholder', 'Ex: smtp.gmail.com', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1237, 1, 'en', 'core/setting/setting', 'email.username', 'Username', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1238, 1, 'en', 'core/setting/setting', 'email.username_placeholder', 'Username to login to mail server', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1239, 1, 'en', 'core/setting/setting', 'email.password', 'Password', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1240, 1, 'en', 'core/setting/setting', 'email.password_placeholder', 'Password to login to mail server', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1241, 1, 'en', 'core/setting/setting', 'email.encryption', 'Encryption', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1242, 1, 'en', 'core/setting/setting', 'email.mail_gun_domain', 'Domain', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1243, 1, 'en', 'core/setting/setting', 'email.mail_gun_domain_placeholder', 'Domain', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1244, 1, 'en', 'core/setting/setting', 'email.mail_gun_secret', 'Secret', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1245, 1, 'en', 'core/setting/setting', 'email.mail_gun_secret_placeholder', 'Secret', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1246, 1, 'en', 'core/setting/setting', 'email.mail_gun_endpoint', 'Endpoint', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1247, 1, 'en', 'core/setting/setting', 'email.mail_gun_endpoint_placeholder', 'Endpoint', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1248, 1, 'en', 'core/setting/setting', 'email.log_channel', 'Log channel', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1249, 1, 'en', 'core/setting/setting', 'email.sendmail_path', 'Sendmail Path', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1250, 1, 'en', 'core/setting/setting', 'email.encryption_placeholder', 'Encryption: ssl or tls', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1251, 1, 'en', 'core/setting/setting', 'email.ses_key', 'Key', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1252, 1, 'en', 'core/setting/setting', 'email.ses_key_placeholder', 'Key', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1253, 1, 'en', 'core/setting/setting', 'email.ses_secret', 'Secret', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1254, 1, 'en', 'core/setting/setting', 'email.ses_secret_placeholder', 'Secret', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1255, 1, 'en', 'core/setting/setting', 'email.ses_region', 'Region', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1256, 1, 'en', 'core/setting/setting', 'email.ses_region_placeholder', 'Region', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1257, 1, 'en', 'core/setting/setting', 'email.postmark_token', 'Token', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1258, 1, 'en', 'core/setting/setting', 'email.postmark_token_placeholder', 'Token', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1259, 1, 'en', 'core/setting/setting', 'email.template_title', 'Email templates', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1260, 1, 'en', 'core/setting/setting', 'email.template_description', 'Base templates for all emails', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1261, 1, 'en', 'core/setting/setting', 'email.template_header', 'Email template header', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1262, 1, 'en', 'core/setting/setting', 'email.template_header_description', 'Template for header of emails', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1263, 1, 'en', 'core/setting/setting', 'email.template_footer', 'Email template footer', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1264, 1, 'en', 'core/setting/setting', 'email.template_footer_description', 'Template for footer of emails', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1265, 1, 'en', 'core/setting/setting', 'email.default', 'Default', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1266, 1, 'en', 'core/setting/setting', 'email.using_queue_to_send_mail', 'Using queue job to send emails (Must to setup Queue first https://laravel.com/docs/queues#supervisor-configuration)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1267, 1, 'en', 'core/setting/setting', 'media.title', 'Media', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1268, 1, 'en', 'core/setting/setting', 'media.driver', 'Driver', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1269, 1, 'en', 'core/setting/setting', 'media.description', 'Settings for media', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1270, 1, 'en', 'core/setting/setting', 'media.aws_access_key_id', 'AWS Access Key ID', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1271, 1, 'en', 'core/setting/setting', 'media.aws_secret_key', 'AWS Secret Key', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1272, 1, 'en', 'core/setting/setting', 'media.aws_default_region', 'AWS Default Region', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1273, 1, 'en', 'core/setting/setting', 'media.aws_bucket', 'AWS Bucket', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1274, 1, 'en', 'core/setting/setting', 'media.aws_url', 'AWS URL', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1275, 1, 'en', 'core/setting/setting', 'media.do_spaces_access_key_id', 'DO Spaces Access Key ID', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1276, 1, 'en', 'core/setting/setting', 'media.do_spaces_secret_key', 'DO Spaces Secret Key', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1277, 1, 'en', 'core/setting/setting', 'media.do_spaces_default_region', 'DO Spaces Default Region', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1278, 1, 'en', 'core/setting/setting', 'media.do_spaces_bucket', 'DO Spaces Bucket', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1279, 1, 'en', 'core/setting/setting', 'media.do_spaces_endpoint', 'DO Spaces Endpoint', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1280, 1, 'en', 'core/setting/setting', 'media.do_spaces_cdn_enabled', 'Is DO Spaces CDN enabled?', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1281, 1, 'en', 'core/setting/setting', 'media.media_do_spaces_cdn_custom_domain', 'Do Spaces CDN custom domain', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1282, 1, 'en', 'core/setting/setting', 'media.media_do_spaces_cdn_custom_domain_placeholder', 'https://your-custom-domain.com', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1283, 1, 'en', 'core/setting/setting', 'media.enable_chunk', 'Enable chunk size upload?', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1284, 1, 'en', 'core/setting/setting', 'media.chunk_size', 'Chunk size (Bytes)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1285, 1, 'en', 'core/setting/setting', 'media.chunk_size_placeholder', 'Default: 1048576 ~ 1MB', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1286, 1, 'en', 'core/setting/setting', 'media.max_file_size', 'Chunk max file size (MB)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1287, 1, 'en', 'core/setting/setting', 'media.max_file_size_placeholder', 'Default: 1048576 ~ 1GB', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1288, 1, 'en', 'core/setting/setting', 'media.enable_watermark', 'Enable watermark?', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1289, 1, 'en', 'core/setting/setting', 'media.watermark_source', 'Watermark image', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1290, 1, 'en', 'core/setting/setting', 'media.watermark_size', 'Size of watermark (%)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1291, 1, 'en', 'core/setting/setting', 'media.watermark_size_placeholder', 'Default: 10 (%)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1292, 1, 'en', 'core/setting/setting', 'media.watermark_opacity', 'Watermark Opacity (%)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1293, 1, 'en', 'core/setting/setting', 'media.watermark_opacity_placeholder', 'Default: 70 (%)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1294, 1, 'en', 'core/setting/setting', 'media.watermark_position', 'Watermark position', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1295, 1, 'en', 'core/setting/setting', 'media.watermark_position_x', 'Watermark position X', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1296, 1, 'en', 'core/setting/setting', 'media.watermark_position_y', 'Watermark position Y', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1297, 1, 'en', 'core/setting/setting', 'media.watermark_position_top_left', 'Top left', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1298, 1, 'en', 'core/setting/setting', 'media.watermark_position_top_right', 'Top right', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1299, 1, 'en', 'core/setting/setting', 'media.watermark_position_bottom_left', 'Bottom left', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1300, 1, 'en', 'core/setting/setting', 'media.watermark_position_bottom_right', 'Bottom right', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1301, 1, 'en', 'core/setting/setting', 'media.watermark_position_center', 'Center', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1302, 1, 'en', 'core/setting/setting', 'license.purchase_code', 'Purchase code', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1303, 1, 'en', 'core/setting/setting', 'license.buyer', 'Buyer', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1304, 1, 'en', 'core/setting/setting', 'field_type_not_exists', 'This field type does not exist', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1305, 1, 'en', 'core/setting/setting', 'save_settings', 'Save settings', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1306, 1, 'en', 'core/setting/setting', 'template', 'Template', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1307, 1, 'en', 'core/setting/setting', 'description', 'Description', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1308, 1, 'en', 'core/setting/setting', 'enable', 'Enable', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1309, 1, 'en', 'core/setting/setting', 'send', 'Send', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1310, 1, 'en', 'core/setting/setting', 'test_email_description', 'To send test email, please make sure you are updated configuration to send mail!', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1311, 1, 'en', 'core/setting/setting', 'test_email_input_placeholder', 'Enter the email which you want to send test email.', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1312, 1, 'en', 'core/setting/setting', 'test_email_modal_title', 'Send a test email', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1313, 1, 'en', 'core/setting/setting', 'test_send_mail', 'Send test mail', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1314, 1, 'en', 'core/setting/setting', 'test_email_send_success', 'Send email successfully!', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1315, 1, 'en', 'core/setting/setting', 'locale_direction_ltr', 'Left to Right', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1316, 1, 'en', 'core/setting/setting', 'locale_direction_rtl', 'Right to Left', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1317, 1, 'vi', 'core/setting/setting', 'title', 'Ca??i ??????t', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1318, 1, 'vi', 'core/setting/setting', 'general.theme', 'Giao di???n', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1319, 1, 'vi', 'core/setting/setting', 'general.description', 'C????u hi??nh nh????ng th??ng tin ca??i ??????t website.', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1320, 1, 'vi', 'core/setting/setting', 'general.title', 'Th??ng tin chung', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1321, 1, 'vi', 'core/setting/setting', 'general.general_block', 'Th??ng tin chung', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1322, 1, 'vi', 'core/setting/setting', 'general.site_title', 'T??n trang', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1323, 1, 'vi', 'core/setting/setting', 'general.admin_email', 'Email qua??n tri?? vi??n', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1324, 1, 'vi', 'core/setting/setting', 'general.seo_block', 'C???u hi??nh SEO', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1325, 1, 'vi', 'core/setting/setting', 'general.seo_title', 'Ti??u ????? SEO', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1326, 1, 'vi', 'core/setting/setting', 'general.seo_description', 'M?? t??? SEO', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1327, 1, 'vi', 'core/setting/setting', 'general.seo_keywords', 'T??? kho?? SEO', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1328, 1, 'vi', 'core/setting/setting', 'general.webmaster_tools_block', 'Google Webmaster Tools', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1329, 1, 'vi', 'core/setting/setting', 'general.google_site_verification', 'Google site verification', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1330, 1, 'vi', 'core/setting/setting', 'general.enable_captcha', 'S???? du??ng Captcha?', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1331, 1, 'vi', 'core/setting/setting', 'general.contact_block', 'Th??ng tin li??n h????', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1332, 1, 'vi', 'core/setting/setting', 'general.placeholder.site_title', 'T??n trang (t????i ??a 120 ki?? t????)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1333, 1, 'vi', 'core/setting/setting', 'general.placeholder.admin_email', 'Admin Email', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1334, 1, 'vi', 'core/setting/setting', 'general.placeholder.google_analytics', 'V?? d???: UA-42767940-2', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1335, 1, 'vi', 'core/setting/setting', 'general.placeholder.google_site_verification', 'M?? x??c nh???n trang web d??ng cho Google Webmaster Tool', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1336, 1, 'vi', 'core/setting/setting', 'general.placeholder.seo_title', 'Ti??u ????? SEO (t????i ??a 120 ki?? t????)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1337, 1, 'vi', 'core/setting/setting', 'general.placeholder.seo_description', 'M?? t??? SEO (t????i ??a 120 ki?? t????)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1338, 1, 'vi', 'core/setting/setting', 'general.placeholder.seo_keywords', 'T??? kho?? SEO (t????i ??a 60 ki?? t????, ph??n ca??ch t???? kho??a b????ng d????u ph????y)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1339, 1, 'vi', 'core/setting/setting', 'general.enable_change_admin_theme', 'Cho ph??p thay ?????i giao di???n qu???n tr????', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1340, 1, 'vi', 'core/setting/setting', 'general.enable_multi_language_in_admin', 'Cho ph??p thay ?????i ng??n ng??? trang qu???n tr????', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1341, 1, 'vi', 'core/setting/setting', 'general.enable', 'B???t', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1342, 1, 'vi', 'core/setting/setting', 'general.disable', 'T???t', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1343, 1, 'vi', 'core/setting/setting', 'general.enable_cache', 'B???t b??? nh??? ?????m?', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1344, 1, 'vi', 'core/setting/setting', 'general.cache_time', 'Th???i gian l??u b??? nh??? ?????m (ph??t)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1345, 1, 'vi', 'core/setting/setting', 'general.cache_time_site_map', 'Th???i gian l??u s?? ????? trang trong b??? nh??? ?????m', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1346, 1, 'vi', 'core/setting/setting', 'general.admin_logo', 'Logo trang qu???n tr???', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1347, 1, 'vi', 'core/setting/setting', 'general.admin_title', 'Ti??u ????? trang qu???n tr???', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1348, 1, 'vi', 'core/setting/setting', 'general.admin_title_placeholder', 'Ti??u ????? hi???n th??? tr??n th??? tr??nh duy???t', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1349, 1, 'vi', 'core/setting/setting', 'general.rich_editor', 'B??? so???n th???o v??n b???n', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1350, 1, 'vi', 'core/setting/setting', 'general.cache_block', 'B??? nh??? ?????m', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1351, 1, 'vi', 'core/setting/setting', 'general.yes', 'B???t', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1352, 1, 'vi', 'core/setting/setting', 'general.no', 'T???t', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1353, 1, 'vi', 'core/setting/setting', 'general.locale', 'Ng??n ng???', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1354, 1, 'vi', 'core/setting/setting', 'general.admin_appearance_description', 'Setting admin appearance such as editor, language...', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1355, 1, 'vi', 'core/setting/setting', 'general.admin_appearance_title', 'Admin appearance', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1356, 1, 'vi', 'core/setting/setting', 'general.admin_login_screen_backgrounds', 'Login screen backgrounds (~1366x768)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1357, 1, 'vi', 'core/setting/setting', 'general.admin_favicon', 'Admin favicon', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1358, 1, 'vi', 'core/setting/setting', 'general.cache_admin_menu', 'Cache admin menu?', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1359, 1, 'vi', 'core/setting/setting', 'general.cache_description', 'Config cache for system for optimize speed', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1360, 1, 'vi', 'core/setting/setting', 'general.default_admin_theme', 'Default admin theme', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1361, 1, 'vi', 'core/setting/setting', 'general.enable_send_error_reporting_via_email', 'Enable to send error reporting via email?', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1362, 1, 'vi', 'core/setting/setting', 'general.locale_direction', 'H?????ng ch??? vi???t', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1363, 1, 'vi', 'core/setting/setting', 'general.select', '-- L???a ch???n --', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1364, 1, 'vi', 'core/setting/setting', 'general.seo_block_description', 'Setting site title, site meta description, site keyword for optimize SEO', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1365, 1, 'vi', 'core/setting/setting', 'general.show_on_front', 'Thi???t l???p trang ch???', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1366, 1, 'vi', 'core/setting/setting', 'general.show_site_name', 'Hi???n th??? t??n trang web sau ti??u ????? trang, t??ch bi???t b???ng \"-\"?', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1367, 1, 'vi', 'core/setting/setting', 'general.time_zone', 'M??i gi???', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1368, 1, 'vi', 'core/setting/setting', 'general.webmaster_tools_description', 'C??ng c??? qu???n tr??? trang web c???a Google (GWT) l?? ph???n m???m mi???n ph?? gi??p b???n qu???n l?? kh??a c???nh k??? thu???t c???a trang web c???a m??nh', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1369, 1, 'vi', 'core/setting/setting', 'email.subject', 'Ti??u ?????', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1370, 1, 'vi', 'core/setting/setting', 'email.content', 'N???i dung', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1371, 1, 'vi', 'core/setting/setting', 'email.title', 'C???u h??nh email template', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1372, 1, 'vi', 'core/setting/setting', 'email.description', 'C???u tr??c file template s??? d???ng HTML v?? c??c bi???n trong h??? th???ng.', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1373, 1, 'vi', 'core/setting/setting', 'email.reset_to_default', 'Kh??i ph???c v??? m???c ?????nh', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1374, 1, 'vi', 'core/setting/setting', 'email.back', 'Tr??? l???i trang c??i ?????t', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1375, 1, 'vi', 'core/setting/setting', 'email.reset_success', 'Kh??i ph???c m???c ?????nh th??nh c??ng', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1376, 1, 'vi', 'core/setting/setting', 'email.confirm_reset', 'X??c nh???n kh??i ph???c m???c ?????nh?', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1377, 1, 'vi', 'core/setting/setting', 'email.confirm_message', 'B???n c?? ch???c ch???n mu???n kh??i ph???c v??? b???n m???c ?????nh?', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1378, 1, 'vi', 'core/setting/setting', 'email.continue', 'Ti???p t???c', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1379, 1, 'vi', 'core/setting/setting', 'email.sender_name', 'T??n ng?????i g???i', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1380, 1, 'vi', 'core/setting/setting', 'email.sender_name_placeholder', 'T??n', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1381, 1, 'vi', 'core/setting/setting', 'email.sender_email', 'Email c???a ng?????i g???i', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1382, 1, 'vi', 'core/setting/setting', 'email.mailer', 'Lo???i', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1383, 1, 'vi', 'core/setting/setting', 'email.port', 'C???ng', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1384, 1, 'vi', 'core/setting/setting', 'email.port_placeholder', 'V?? d???: 587', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1385, 1, 'vi', 'core/setting/setting', 'email.host', 'M??y ch???', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1386, 1, 'vi', 'core/setting/setting', 'email.host_placeholder', 'V?? d???: smtp.gmail.com', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1387, 1, 'vi', 'core/setting/setting', 'email.username', 'T??n ????ng nh???p', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1388, 1, 'vi', 'core/setting/setting', 'email.username_placeholder', 'T??n ????ng nh???p v??o m??y ch??? mail', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1389, 1, 'vi', 'core/setting/setting', 'email.password', 'M???t kh???u', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1390, 1, 'vi', 'core/setting/setting', 'email.password_placeholder', 'M???t kh???u ????ng nh???p v??o m??y ch??? mail', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1391, 1, 'vi', 'core/setting/setting', 'email.encryption', 'M?? ho??', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1392, 1, 'vi', 'core/setting/setting', 'email.mail_gun_domain', 'T??n mi???n', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1393, 1, 'vi', 'core/setting/setting', 'email.mail_gun_domain_placeholder', 'T??n mi???n', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1394, 1, 'vi', 'core/setting/setting', 'email.mail_gun_secret', 'Chu???i b?? m???t', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1395, 1, 'vi', 'core/setting/setting', 'email.mail_gun_secret_placeholder', 'Chu???i b?? m???t', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1396, 1, 'vi', 'core/setting/setting', 'email.template_title', 'M???u giao di???n email', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1397, 1, 'vi', 'core/setting/setting', 'email.template_description', 'Giao di???n m???c ?????nh cho t???t c??? email', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1398, 1, 'vi', 'core/setting/setting', 'email.template_header', 'M???u cho ph???n tr??n c???a email', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1399, 1, 'vi', 'core/setting/setting', 'email.template_header_description', 'Ph???n tr??n c???a t???t c??? email', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1400, 1, 'vi', 'core/setting/setting', 'email.template_footer', 'M???u cho ph???n d?????i c???a email', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1401, 1, 'vi', 'core/setting/setting', 'email.template_footer_description', 'Ph???n d?????i c???a t???t c??? email', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1402, 1, 'vi', 'core/setting/setting', 'email.default', 'M???c ?????nh', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1403, 1, 'vi', 'core/setting/setting', 'email.mail_gun_endpoint', 'Endpoint', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1404, 1, 'vi', 'core/setting/setting', 'email.mail_gun_endpoint_placeholder', 'Endpoint', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1405, 1, 'vi', 'core/setting/setting', 'email.postmark_token', 'Token', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1406, 1, 'vi', 'core/setting/setting', 'email.postmark_token_placeholder', 'Token', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1407, 1, 'vi', 'core/setting/setting', 'email.encryption_placeholder', 'Ki???u m?? h??a: ssl ho???c tls', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1408, 1, 'vi', 'core/setting/setting', 'email.log_channel', 'Ph????ng th???c log', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1409, 1, 'vi', 'core/setting/setting', 'email.sendmail_path', 'Sendmail Path', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1410, 1, 'vi', 'core/setting/setting', 'email.ses_key', 'Key', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1411, 1, 'vi', 'core/setting/setting', 'email.ses_key_placeholder', 'Key', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1412, 1, 'vi', 'core/setting/setting', 'email.ses_region', 'Region', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1413, 1, 'vi', 'core/setting/setting', 'email.ses_region_placeholder', 'Region', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1414, 1, 'vi', 'core/setting/setting', 'email.ses_secret', 'Secret', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1415, 1, 'vi', 'core/setting/setting', 'email.ses_secret_placeholder', 'Secret', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1416, 1, 'vi', 'core/setting/setting', 'email.using_queue_to_send_mail', 'S??? d???ng job queue ????? g???i email (Tr?????c ti??n ph???i thi???t l???p Queue https://laravel.com/docs/queues#supervisor-configuration)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1417, 1, 'vi', 'core/setting/setting', 'save_settings', 'L??u c??i ?????t', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1418, 1, 'vi', 'core/setting/setting', 'template', 'M???u', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1419, 1, 'vi', 'core/setting/setting', 'description', 'M?? t???', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1420, 1, 'vi', 'core/setting/setting', 'enable', 'B???t', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1421, 1, 'vi', 'core/setting/setting', 'test_send_mail', 'G???i th??? nghi???m', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1422, 1, 'vi', 'core/setting/setting', 'email_setting_title', 'C???u h??nh email', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1423, 1, 'vi', 'core/setting/setting', 'field_type_not_exists', 'Lo???i field n??y kh??ng ???????c h??? tr???', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1424, 1, 'vi', 'core/setting/setting', 'test_email_description', '????? g???i email th??? nghi???m, h??y ?????m b???o r???ng b???n ???? c???p nh???t c???u h??nh ????? g???i th??!', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1425, 1, 'vi', 'core/setting/setting', 'test_email_input_placeholder', 'Nh???p email m?? b???n mu???n g???i email th??? nghi???m.', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1426, 1, 'vi', 'core/setting/setting', 'test_email_modal_title', 'G???i m???t email th??? nghi???m', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1427, 1, 'vi', 'core/setting/setting', 'test_email_send_success', 'G???i email th??nh c??ng!', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1428, 1, 'vi', 'core/setting/setting', 'send', 'G???i', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1429, 1, 'vi', 'core/setting/setting', 'license.buyer', 'T??n ????ng nh???p', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1430, 1, 'vi', 'core/setting/setting', 'license.purchase_code', 'Purchase code', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1431, 1, 'vi', 'core/setting/setting', 'locale_direction_ltr', 'Tr??i sang ph???i', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1432, 1, 'vi', 'core/setting/setting', 'locale_direction_rtl', 'Ph???i sang tr??i', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1433, 1, 'vi', 'core/setting/setting', 'media.aws_access_key_id', 'AWS Access Key ID', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1434, 1, 'vi', 'core/setting/setting', 'media.aws_bucket', 'AWS Bucket', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1435, 1, 'vi', 'core/setting/setting', 'media.aws_default_region', 'AWS Default Region', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1436, 1, 'vi', 'core/setting/setting', 'media.aws_url', 'AWS URL', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1437, 1, 'vi', 'core/setting/setting', 'media.aws_secret_key', 'AWS Secret Key', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1438, 1, 'vi', 'core/setting/setting', 'media.chunk_size', 'Chunk size (Bytes)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1439, 1, 'vi', 'core/setting/setting', 'media.chunk_size_placeholder', 'M???c ?????nh: 1048576 ~ 1MB', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1440, 1, 'vi', 'core/setting/setting', 'media.do_spaces_access_key_id', 'DO Spaces Access Key ID', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1441, 1, 'vi', 'core/setting/setting', 'media.description', 'C??i ?????t cho media', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1442, 1, 'vi', 'core/setting/setting', 'media.do_spaces_bucket', 'DO Spaces Bucket', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1443, 1, 'vi', 'core/setting/setting', 'media.do_spaces_cdn_enabled', 'B???t DO Spaces CDN?', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1444, 1, 'vi', 'core/setting/setting', 'media.do_spaces_default_region', 'DO Spaces Default Region', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1445, 1, 'vi', 'core/setting/setting', 'media.do_spaces_endpoint', 'DO Spaces Endpoint', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1446, 1, 'vi', 'core/setting/setting', 'media.do_spaces_secret_key', 'DO Spaces Secret Key', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1447, 1, 'vi', 'core/setting/setting', 'media.driver', 'Driver', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1448, 1, 'vi', 'core/setting/setting', 'media.enable_chunk', 'B???t chunk size upload?', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1449, 1, 'vi', 'core/setting/setting', 'media.enable_watermark', 'B???t watermark?', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1450, 1, 'vi', 'core/setting/setting', 'media.max_file_size', 'Chunk max file size (MB)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1451, 1, 'vi', 'core/setting/setting', 'media.max_file_size_placeholder', 'M???c ?????nh: 1048576 ~ 1GB', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1452, 1, 'vi', 'core/setting/setting', 'media.media_do_spaces_cdn_custom_domain', 'Do Spaces CDN custom domain', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1453, 1, 'vi', 'core/setting/setting', 'media.media_do_spaces_cdn_custom_domain_placeholder', 'https://ten-mien-cua-ban.com', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1454, 1, 'vi', 'core/setting/setting', 'media.title', 'Media', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1455, 1, 'vi', 'core/setting/setting', 'media.watermark_opacity', 'Watermark Opacity (%)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1456, 1, 'vi', 'core/setting/setting', 'media.watermark_opacity_placeholder', 'M???c ?????nh: 70 (%)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1457, 1, 'vi', 'core/setting/setting', 'media.watermark_position', 'V??? tr?? watermark', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1458, 1, 'vi', 'core/setting/setting', 'media.watermark_position_bottom_left', 'B??n tr??i d?????i c??ng', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1459, 1, 'vi', 'core/setting/setting', 'media.watermark_position_bottom_right', 'B??n ph???i d?????i c??ng', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1460, 1, 'vi', 'core/setting/setting', 'media.watermark_position_center', 'Ch??nh gi???a', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1461, 1, 'vi', 'core/setting/setting', 'media.watermark_position_top_left', 'B??n tr??i tr??n c??ng', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1462, 1, 'vi', 'core/setting/setting', 'media.watermark_position_top_right', 'B??n ph???i tr??n c??ng', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1463, 1, 'vi', 'core/setting/setting', 'media.watermark_position_x', 'Watermark position X', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1464, 1, 'vi', 'core/setting/setting', 'media.watermark_position_y', 'Watermark position Y', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1465, 1, 'vi', 'core/setting/setting', 'media.watermark_size', 'K??ch th?????c c???a watermark (%)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1466, 1, 'vi', 'core/setting/setting', 'media.watermark_size_placeholder', 'M???c ?????nh: 10 (%)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1467, 1, 'vi', 'core/setting/setting', 'media.watermark_source', 'H??nh ???nh watermark', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1468, 1, 'en', 'core/table/table', 'operations', 'Operations', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1469, 1, 'en', 'core/table/table', 'loading_data', 'Loading data from server', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1470, 1, 'en', 'core/table/table', 'display', 'Display', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1471, 1, 'en', 'core/table/table', 'all', 'All', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1472, 1, 'en', 'core/table/table', 'edit_entry', 'Edit', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1473, 1, 'en', 'core/table/table', 'delete_entry', 'Delete', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1474, 1, 'en', 'core/table/table', 'show_from', 'Showing from', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1475, 1, 'en', 'core/table/table', 'to', 'to', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1476, 1, 'en', 'core/table/table', 'in', 'in', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1477, 1, 'en', 'core/table/table', 'records', 'records', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1478, 1, 'en', 'core/table/table', 'no_data', 'No data to display', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1479, 1, 'en', 'core/table/table', 'no_record', 'No record', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1480, 1, 'en', 'core/table/table', 'loading', 'Loading data from server', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1481, 1, 'en', 'core/table/table', 'confirm_delete', 'Confirm delete', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1482, 1, 'en', 'core/table/table', 'confirm_delete_msg', 'Do you really want to delete this record?', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1483, 1, 'en', 'core/table/table', 'cancel', 'Cancel', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1484, 1, 'en', 'core/table/table', 'delete', 'Delete', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1485, 1, 'en', 'core/table/table', 'close', 'Close', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1486, 1, 'en', 'core/table/table', 'contains', 'Contains', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1487, 1, 'en', 'core/table/table', 'is_equal_to', 'Is equal to', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1488, 1, 'en', 'core/table/table', 'greater_than', 'Greater than', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1489, 1, 'en', 'core/table/table', 'less_than', 'Less than', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1490, 1, 'en', 'core/table/table', 'value', 'Value', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1491, 1, 'en', 'core/table/table', 'select_field', 'Select field', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1492, 1, 'en', 'core/table/table', 'reset', 'Reset', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1493, 1, 'en', 'core/table/table', 'add_additional_filter', 'Add additional filter', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1494, 1, 'en', 'core/table/table', 'apply', 'Apply', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1495, 1, 'en', 'core/table/table', 'filters', 'Filters', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1496, 1, 'en', 'core/table/table', 'bulk_change', 'Bulk changes', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1497, 1, 'en', 'core/table/table', 'select_option', 'Select option', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1498, 1, 'en', 'core/table/table', 'bulk_actions', 'Bulk Actions', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1499, 1, 'en', 'core/table/table', 'save_bulk_change_success', 'Update data for selected record(s) successfully!', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1500, 1, 'en', 'core/table/table', 'please_select_record', 'Please select at least one record to perform this action!', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1501, 1, 'en', 'core/table/table', 'filtered', '(filtered from _MAX_ total records)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1502, 1, 'en', 'core/table/table', 'search', 'Search...', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1503, 1, 'vi', 'core/table/table', 'operations', 'H??nh ?????ng', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1504, 1, 'vi', 'core/table/table', 'loading_data', '??ang t???i d??? li???u t??? h??? th???ng', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1505, 1, 'vi', 'core/table/table', 'display', 'Hi???n th???', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1506, 1, 'vi', 'core/table/table', 'all', 'T???t c???', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1507, 1, 'vi', 'core/table/table', 'edit_entry', 'S???a', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1508, 1, 'vi', 'core/table/table', 'delete_entry', 'Xo??', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1509, 1, 'vi', 'core/table/table', 'show_from', 'Hi???n th??? t???', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1510, 1, 'vi', 'core/table/table', 'to', '?????n', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1511, 1, 'vi', 'core/table/table', 'in', 'trong t???ng s???', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1512, 1, 'vi', 'core/table/table', 'records', 'b???n ghi', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1513, 1, 'vi', 'core/table/table', 'no_data', 'Kh??ng c?? d??? li???u ????? hi???n th???', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1514, 1, 'vi', 'core/table/table', 'no_record', 'kh??ng c?? b???n ghi n??o', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1515, 1, 'vi', 'core/table/table', 'loading', '??ang t???i d??? li???u t??? h??? th???ng', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1516, 1, 'vi', 'core/table/table', 'confirm_delete', 'X??c nh???n xo??', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1517, 1, 'vi', 'core/table/table', 'confirm_delete_msg', 'B???n c?? ch???c ch???n mu???n xo?? b???n ghi n??y?', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1518, 1, 'vi', 'core/table/table', 'cancel', 'Hu??? b???', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1519, 1, 'vi', 'core/table/table', 'delete', 'Xo??', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1520, 1, 'vi', 'core/table/table', 'close', '????ng', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1521, 1, 'vi', 'core/table/table', 'is_equal_to', 'B???ng v???i', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1522, 1, 'vi', 'core/table/table', 'greater_than', 'L???n h??n', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1523, 1, 'vi', 'core/table/table', 'less_than', 'Nh??? h??n', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1524, 1, 'vi', 'core/table/table', 'value', 'Gi?? tr???', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1525, 1, 'vi', 'core/table/table', 'select_field', 'Ch???n tr?????ng', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1526, 1, 'vi', 'core/table/table', 'reset', 'L??m m???i', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1527, 1, 'vi', 'core/table/table', 'add_additional_filter', 'Th??m b??? l???c', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1528, 1, 'vi', 'core/table/table', 'apply', '??p d???ng', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1529, 1, 'vi', 'core/table/table', 'select_option', 'L???a ch???n', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1530, 1, 'vi', 'core/table/table', 'filters', 'L???c d??? li???u', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1531, 1, 'vi', 'core/table/table', 'bulk_change', 'Thay ?????i h??ng lo???t', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1532, 1, 'vi', 'core/table/table', 'bulk_actions', 'H??nh ?????ng', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1533, 1, 'vi', 'core/table/table', 'contains', 'Bao g???m', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1534, 1, 'vi', 'core/table/table', 'filtered', '(???? ???????c l???c t??? _MAX_ b???n ghi)', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1535, 1, 'vi', 'core/table/table', 'please_select_record', 'Vui l??ng ch???n ??t nh???t 1 b???n ghi ????? th???c hi???n h??nh ?????ng n??y!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1536, 1, 'vi', 'core/table/table', 'save_bulk_change_success', 'C???p nh???t d??? li???u cho c??c b???n ghi th??nh c??ng!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1537, 1, 'vi', 'core/table/table', 'search', 'T??m ki???m...', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1538, 1, 'en', 'packages/menu/menu', 'name', 'Menus', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1539, 1, 'en', 'packages/menu/menu', 'key_name', 'Menu name (key: :key)', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1540, 1, 'en', 'packages/menu/menu', 'basic_info', 'Basic information', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1541, 1, 'en', 'packages/menu/menu', 'add_to_menu', 'Add to menu', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1542, 1, 'en', 'packages/menu/menu', 'custom_link', 'Custom link', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1543, 1, 'en', 'packages/menu/menu', 'add_link', 'Add link', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1544, 1, 'en', 'packages/menu/menu', 'structure', 'Menu structure', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1545, 1, 'en', 'packages/menu/menu', 'remove', 'Remove', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1546, 1, 'en', 'packages/menu/menu', 'cancel', 'Cancel', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1547, 1, 'en', 'packages/menu/menu', 'title', 'Title', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1548, 1, 'en', 'packages/menu/menu', 'icon', 'Icon', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1549, 1, 'en', 'packages/menu/menu', 'url', 'URL', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1550, 1, 'en', 'packages/menu/menu', 'target', 'Target', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1551, 1, 'en', 'packages/menu/menu', 'css_class', 'CSS class', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1552, 1, 'en', 'packages/menu/menu', 'self_open_link', 'Open link directly', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1553, 1, 'en', 'packages/menu/menu', 'blank_open_link', 'Open link in new tab', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1554, 1, 'en', 'packages/menu/menu', 'create', 'Create menu', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1555, 1, 'en', 'packages/menu/menu', 'edit', 'Edit menu', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1556, 1, 'en', 'packages/menu/menu', 'menu_settings', 'Menu settings', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1557, 1, 'en', 'packages/menu/menu', 'display_location', 'Display location', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1558, 1, 'vi', 'packages/menu/menu', 'name', 'Tr??nh ????n', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1559, 1, 'vi', 'packages/menu/menu', 'cancel', 'Hu??y bo??', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1560, 1, 'vi', 'packages/menu/menu', 'add_link', 'Th??m li??n k???t', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1561, 1, 'vi', 'packages/menu/menu', 'add_to_menu', 'Th??m v??o tr??nh ????n', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1562, 1, 'vi', 'packages/menu/menu', 'basic_info', 'Th??ng tin c?? b???n', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1563, 1, 'vi', 'packages/menu/menu', 'blank_open_link', 'M??? li??n k???t trong tab m???i', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1564, 1, 'vi', 'packages/menu/menu', 'css_class', 'CSS class', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1565, 1, 'vi', 'packages/menu/menu', 'custom_link', 'Li??n k???t t??y ch???n', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1566, 1, 'vi', 'packages/menu/menu', 'icon', 'Bi???u t?????ng', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1567, 1, 'vi', 'packages/menu/menu', 'key_name', 'T??n menu (key::key)', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1568, 1, 'vi', 'packages/menu/menu', 'remove', 'X??a', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1569, 1, 'vi', 'packages/menu/menu', 'self_open_link', 'M??? li??n k???t trong tab hi???n t???i', '2021-03-14 19:40:45', '2021-03-14 19:40:45');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1570, 1, 'vi', 'packages/menu/menu', 'structure', 'C???u tr??c tr??nh ????n', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1571, 1, 'vi', 'packages/menu/menu', 'target', 'Target', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1572, 1, 'vi', 'packages/menu/menu', 'title', 'Ti??u ?????', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1573, 1, 'vi', 'packages/menu/menu', 'url', 'URL', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1574, 1, 'vi', 'packages/menu/menu', 'create', 'T???o tr??nh ????n', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1575, 1, 'vi', 'packages/menu/menu', 'edit', 'S???a tr??nh ????n', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1576, 1, 'vi', 'packages/menu/menu', 'display_location', 'V??? tr?? hi???n th???', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1577, 1, 'vi', 'packages/menu/menu', 'menu_settings', 'C???u h??nh menu', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1578, 1, 'en', 'packages/page/pages', 'create', 'Create new page', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1579, 1, 'en', 'packages/page/pages', 'edit', 'Edit page', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1580, 1, 'en', 'packages/page/pages', 'form.name', 'Name', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1581, 1, 'en', 'packages/page/pages', 'form.name_placeholder', 'Page\'s name (Maximum 120 characters)', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1582, 1, 'en', 'packages/page/pages', 'form.content', 'Content', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1583, 1, 'en', 'packages/page/pages', 'form.note', 'Note content', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1584, 1, 'en', 'packages/page/pages', 'notices.no_select', 'Please select at least one record to take this action!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1585, 1, 'en', 'packages/page/pages', 'notices.update_success_message', 'Update successfully', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1586, 1, 'en', 'packages/page/pages', 'cannot_delete', 'Page could not be deleted', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1587, 1, 'en', 'packages/page/pages', 'deleted', 'Page deleted', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1588, 1, 'en', 'packages/page/pages', 'pages', 'Pages', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1589, 1, 'en', 'packages/page/pages', 'menu', 'Pages', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1590, 1, 'en', 'packages/page/pages', 'menu_name', 'Pages', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1591, 1, 'en', 'packages/page/pages', 'edit_this_page', 'Edit this page', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1592, 1, 'en', 'packages/page/pages', 'total_pages', 'Total pages', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1593, 1, 'en', 'packages/page/pages', 'settings.show_on_front', 'Your homepage displays', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1594, 1, 'en', 'packages/page/pages', 'settings.select', '??? Select ???', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1595, 1, 'en', 'packages/page/pages', 'front_page', 'Front Page', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1596, 1, 'vi', 'packages/page/pages', 'create', 'Th??m trang', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1597, 1, 'vi', 'packages/page/pages', 'edit', 'S????a trang', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1598, 1, 'vi', 'packages/page/pages', 'form.name', 'Ti??u ????? trang', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1599, 1, 'vi', 'packages/page/pages', 'form.note', 'N????i dung ghi chu??', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1600, 1, 'vi', 'packages/page/pages', 'form.name_placeholder', 'T??n trang (t???i ??a 120 k?? t???)', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1601, 1, 'vi', 'packages/page/pages', 'form.content', 'N???i dung', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1602, 1, 'vi', 'packages/page/pages', 'notices.no_select', 'Cho??n i??t nh????t 1 trang ?????? th????c hi????n ha??nh ??????ng na??y!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1603, 1, 'vi', 'packages/page/pages', 'notices.update_success_message', 'C????p nh????t tha??nh c??ng', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1604, 1, 'vi', 'packages/page/pages', 'deleted', 'Xo??a trang tha??nh c??ng', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1605, 1, 'vi', 'packages/page/pages', 'cannot_delete', 'Kh??ng th???? xo??a trang', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1606, 1, 'vi', 'packages/page/pages', 'menu', 'Trang', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1607, 1, 'vi', 'packages/page/pages', 'menu_name', 'Trang', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1608, 1, 'vi', 'packages/page/pages', 'edit_this_page', 'S???a trang n??y', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1609, 1, 'vi', 'packages/page/pages', 'pages', 'Trang', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1610, 1, 'vi', 'packages/page/pages', 'front_page', 'Trang ch???', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1611, 1, 'vi', 'packages/page/pages', 'settings.select', '-- L???a ch???n --', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1612, 1, 'vi', 'packages/page/pages', 'settings.show_on_front', 'L???a ch???n trang ch???', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1613, 1, 'vi', 'packages/page/pages', 'total_pages', 'T???ng s??? trang', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1614, 1, 'en', 'packages/plugin-management/plugin', 'enabled', 'Enabled', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1615, 1, 'en', 'packages/plugin-management/plugin', 'deactivated', 'Deactivated', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1616, 1, 'en', 'packages/plugin-management/plugin', 'activated', 'Activated', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1617, 1, 'en', 'packages/plugin-management/plugin', 'activate', 'Activate', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1618, 1, 'en', 'packages/plugin-management/plugin', 'deactivate', 'Deactivate', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1619, 1, 'en', 'packages/plugin-management/plugin', 'author', 'By', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1620, 1, 'en', 'packages/plugin-management/plugin', 'update_plugin_status_success', 'Update plugin successfully', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1621, 1, 'en', 'packages/plugin-management/plugin', 'plugins', 'Plugins', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1622, 1, 'en', 'packages/plugin-management/plugin', 'missing_required_plugins', 'Please activate plugin(s): :plugins before activate this plugin!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1623, 1, 'en', 'packages/plugin-management/plugin', 'remove', 'Remove', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1624, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin_success', 'Remove plugin successfully!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1625, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin', 'Remove plugin', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1626, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin_confirm_message', 'Do you really want to remove this plugin?', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1627, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin_confirm_yes', 'Yes, remove it!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1628, 1, 'en', 'packages/plugin-management/plugin', 'total_plugins', 'Total plugins', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1629, 1, 'en', 'packages/plugin-management/plugin', 'invalid_plugin', 'This plugin is not a valid plugin, please check it again!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1630, 1, 'en', 'packages/plugin-management/plugin', 'version', 'Version', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1631, 1, 'en', 'packages/plugin-management/plugin', 'invalid_json', 'Invalid plugin.json!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1632, 1, 'en', 'packages/plugin-management/plugin', 'activate_success', 'Activate plugin successfully!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1633, 1, 'en', 'packages/plugin-management/plugin', 'activated_already', 'This plugin is activated already!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1634, 1, 'en', 'packages/plugin-management/plugin', 'plugin_not_exist', 'This plugin is not exists.', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1635, 1, 'en', 'packages/plugin-management/plugin', 'missing_json_file', 'Missing file plugin.json!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1636, 1, 'en', 'packages/plugin-management/plugin', 'plugin_invalid', 'Plugin is valid!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1637, 1, 'en', 'packages/plugin-management/plugin', 'published_assets_success', 'Publish assets for plugin :name successfully!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1638, 1, 'en', 'packages/plugin-management/plugin', 'plugin_removed', 'Plugin is removed!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1639, 1, 'en', 'packages/plugin-management/plugin', 'deactivated_success', 'Deactivate plugin successfully!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1640, 1, 'en', 'packages/plugin-management/plugin', 'deactivated_already', 'This plugin is deactivated already!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1641, 1, 'vi', 'packages/plugin-management/plugin', 'activate', 'K??ch ho???t', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1642, 1, 'vi', 'packages/plugin-management/plugin', 'author', 'T??c gi???', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1643, 1, 'vi', 'packages/plugin-management/plugin', 'version', 'Phi??n b???n', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1644, 1, 'vi', 'packages/plugin-management/plugin', 'activated', '???? k??ch ho???t', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1645, 1, 'vi', 'packages/plugin-management/plugin', 'deactivate', 'H???y k??ch ho???t', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1646, 1, 'vi', 'packages/plugin-management/plugin', 'deactivated', '???? v?? hi???u', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1647, 1, 'vi', 'packages/plugin-management/plugin', 'enabled', 'K??ch ho???t', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1648, 1, 'vi', 'packages/plugin-management/plugin', 'invalid_plugin', 'G??i m??? r???ng kh??ng h???p l???', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1649, 1, 'vi', 'packages/plugin-management/plugin', 'update_plugin_status_success', 'C???p nh???t tr???ng th??i g??i m??? r???ng th??nh c??ng', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1650, 1, 'vi', 'packages/plugin-management/plugin', 'missing_required_plugins', 'Vui l??ng k??ch ho???t c??c g??i m??? r???ng :plugins tr?????c khi k??ch ho???t g??i n??y', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1651, 1, 'vi', 'packages/plugin-management/plugin', 'plugins', 'G??i m??? r???ng', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1652, 1, 'vi', 'packages/plugin-management/plugin', 'remove', 'Xo??', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1653, 1, 'vi', 'packages/plugin-management/plugin', 'remove_plugin_success', 'Xo?? th??nh c??ng!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1654, 1, 'vi', 'packages/plugin-management/plugin', 'remove_plugin', 'Xo?? g??i m??? r???ng', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1655, 1, 'vi', 'packages/plugin-management/plugin', 'remove_plugin_confirm_message', 'B???n c?? ch???c ch???n mu???n xo?? plugin n??y?', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1656, 1, 'vi', 'packages/plugin-management/plugin', 'remove_plugin_confirm_yes', 'C??, xo??!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1657, 1, 'vi', 'packages/plugin-management/plugin', 'total_plugins', 'T???t c??? plugins', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1658, 1, 'vi', 'packages/plugin-management/plugin', 'activate_success', 'K??ch ho???t th??nh c??ng!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1659, 1, 'vi', 'packages/plugin-management/plugin', 'activated_already', 'G??i m??? r???ng n??y ???? ???????c k??ch ho???t r???i!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1660, 1, 'vi', 'packages/plugin-management/plugin', 'deactivated_already', 'G??i m??? r???ng n??y ???? ???????c h???y k??ch ho???t r???i!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1661, 1, 'vi', 'packages/plugin-management/plugin', 'deactivated_success', 'H???y k??ch ho???t th??nh c??ng!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1662, 1, 'vi', 'packages/plugin-management/plugin', 'invalid_json', 'Sai c???u h??nh plugin.json!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1663, 1, 'vi', 'packages/plugin-management/plugin', 'missing_json_file', 'Thi???u t???p tin c???u h??nh plugin.json!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1664, 1, 'vi', 'packages/plugin-management/plugin', 'plugin_invalid', 'G??i m??? r???ng kh??ng h???p l???!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1665, 1, 'vi', 'packages/plugin-management/plugin', 'plugin_not_exist', 'G??i m??? r???ng kh??ng t???n t???i', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1666, 1, 'vi', 'packages/plugin-management/plugin', 'plugin_removed', 'G??i m??? r???ng ???? b??? x??a!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1667, 1, 'vi', 'packages/plugin-management/plugin', 'published_assets_success', 'Xu???t b???n assets cho g??i m??? r???ng th??nh c??ng!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1668, 1, 'en', 'packages/seo-helper/seo-helper', 'meta_box_header', 'Search Engine Optimize', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1669, 1, 'en', 'packages/seo-helper/seo-helper', 'edit_seo_meta', 'Edit SEO meta', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1670, 1, 'en', 'packages/seo-helper/seo-helper', 'default_description', 'Setup meta title & description to make your site easy to discovered on search engines such as Google', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1671, 1, 'en', 'packages/seo-helper/seo-helper', 'seo_title', 'SEO Title', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1672, 1, 'en', 'packages/seo-helper/seo-helper', 'seo_description', 'SEO description', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1673, 1, 'vi', 'packages/seo-helper/seo-helper', 'meta_box_header', 'T???i ??u ho?? b??? m??y t??m ki???m (SEO)', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1674, 1, 'vi', 'packages/seo-helper/seo-helper', 'edit_seo_meta', 'Ch???nh s???a SEO', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1675, 1, 'vi', 'packages/seo-helper/seo-helper', 'default_description', 'Thi???t l???p c??c th??? m?? t??? gi??p ng?????i d??ng d??? d??ng t??m th???y tr??n c??ng c??? t??m ki???m nh?? Google.', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1676, 1, 'vi', 'packages/seo-helper/seo-helper', 'seo_title', 'Ti??u ????? trang', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1677, 1, 'vi', 'packages/seo-helper/seo-helper', 'seo_description', 'M?? t??? trang', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1678, 1, 'en', 'packages/slug/slug', 'permalink_settings', 'Permalink', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1679, 1, 'en', 'packages/slug/slug', 'settings.title', 'Permalink settings', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1680, 1, 'en', 'packages/slug/slug', 'settings.description', 'Manage permalink for all modules.', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1681, 1, 'en', 'packages/slug/slug', 'settings.preview', 'Preview', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1682, 1, 'en', 'packages/slug/slug', 'preview', 'Preview', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1683, 1, 'vi', 'packages/slug/slug', 'permalink_settings', 'Li??n k???t c??? ?????nh', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1684, 1, 'vi', 'packages/slug/slug', 'preview', 'Xem tr?????c', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1685, 1, 'vi', 'packages/slug/slug', 'settings.description', 'Qu???n l?? li??n k???t c??? ?????nh cho c??c module.', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1686, 1, 'vi', 'packages/slug/slug', 'settings.preview', 'Xem tr?????c', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1687, 1, 'vi', 'packages/slug/slug', 'settings.title', 'C??i ?????t li??n k???t c??? ?????nh', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1688, 1, 'en', 'packages/theme/theme', 'name', 'Themes', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1689, 1, 'en', 'packages/theme/theme', 'theme', 'Theme', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1690, 1, 'en', 'packages/theme/theme', 'author', 'Author', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1691, 1, 'en', 'packages/theme/theme', 'version', 'Version', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1692, 1, 'en', 'packages/theme/theme', 'description', 'Description', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1693, 1, 'en', 'packages/theme/theme', 'active_success', 'Activate theme :name successfully!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1694, 1, 'en', 'packages/theme/theme', 'active', 'Active', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1695, 1, 'en', 'packages/theme/theme', 'activated', 'Activated', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1696, 1, 'en', 'packages/theme/theme', 'appearance', 'Appearance', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1697, 1, 'en', 'packages/theme/theme', 'theme_options', 'Theme options', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1698, 1, 'en', 'packages/theme/theme', 'save_changes', 'Save Changes', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1699, 1, 'en', 'packages/theme/theme', 'developer_mode', 'Developer Mode Enabled', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1700, 1, 'en', 'packages/theme/theme', 'custom_css', 'Custom CSS', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1701, 1, 'en', 'packages/theme/theme', 'custom_js', 'Custom JS', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1702, 1, 'en', 'packages/theme/theme', 'custom_header_js', 'Header JS', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1703, 1, 'en', 'packages/theme/theme', 'custom_header_js_placeholder', 'JS in header of page, wrap it inside &#x3C;script&#x3E;&#x3C;/script&#x3E;', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1704, 1, 'en', 'packages/theme/theme', 'custom_body_js', 'Body JS', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1705, 1, 'en', 'packages/theme/theme', 'custom_body_js_placeholder', 'JS in body of page, wrap it inside &#x3C;script&#x3E;&#x3C;/script&#x3E;', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1706, 1, 'en', 'packages/theme/theme', 'custom_footer_js', 'Footer JS', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1707, 1, 'en', 'packages/theme/theme', 'custom_footer_js_placeholder', 'JS in footer of page, wrap it inside &#x3C;script&#x3E;&#x3C;/script&#x3E;', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1708, 1, 'en', 'packages/theme/theme', 'remove_theme_success', 'Remove theme successfully!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1709, 1, 'en', 'packages/theme/theme', 'theme_is_not_existed', 'This theme is not existed!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1710, 1, 'en', 'packages/theme/theme', 'remove', 'Remove', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1711, 1, 'en', 'packages/theme/theme', 'remove_theme', 'Remove theme', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1712, 1, 'en', 'packages/theme/theme', 'remove_theme_confirm_message', 'Do you really want to remove this theme?', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1713, 1, 'en', 'packages/theme/theme', 'remove_theme_confirm_yes', 'Yes, remove it!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1714, 1, 'en', 'packages/theme/theme', 'total_themes', 'Total themes', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1715, 1, 'en', 'packages/theme/theme', 'show_admin_bar', 'Show admin bar (When admin logged in, still show admin bar in website)?', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1716, 1, 'en', 'packages/theme/theme', 'settings.title', 'Theme', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1717, 1, 'en', 'packages/theme/theme', 'settings.description', 'Setting for theme', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1718, 1, 'en', 'packages/theme/theme', 'add_new', 'Add new', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1719, 1, 'en', 'packages/theme/theme', 'theme_activated_already', 'Theme \":name\" is activated already!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1720, 1, 'en', 'packages/theme/theme', 'missing_json_file', 'Missing file theme.json!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1721, 1, 'en', 'packages/theme/theme', 'theme_invalid', 'Theme is valid!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1722, 1, 'en', 'packages/theme/theme', 'published_assets_success', 'Publish assets for :themes successfully!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1723, 1, 'en', 'packages/theme/theme', 'cannot_remove_theme', 'Cannot remove activated theme, please activate another theme before removing \":name\"!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1724, 1, 'en', 'packages/theme/theme', 'theme_deleted', 'Theme \":name\" has been destroyed.', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1725, 1, 'en', 'packages/theme/theme', 'removed_assets', 'Remove assets of a theme :name successfully!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1726, 1, 'en', 'packages/theme/theme', 'update_custom_css_success', 'Update custom CSS successfully!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1727, 1, 'en', 'packages/theme/theme', 'update_custom_js_success', 'Update custom JS successfully!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1728, 1, 'en', 'packages/theme/theme', 'go_to_dashboard', 'Go to dashboard', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1729, 1, 'en', 'packages/theme/theme', 'custom_css_placeholder', 'Using Ctrl + Space to autocomplete.', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1730, 1, 'en', 'packages/theme/theme', 'theme_option_general', 'General', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1731, 1, 'en', 'packages/theme/theme', 'theme_option_general_description', 'General settings', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1732, 1, 'en', 'packages/theme/theme', 'theme_option_seo_open_graph_image', 'SEO default Open Graph image', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1733, 1, 'en', 'packages/theme/theme', 'theme_option_logo', 'Logo', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1734, 1, 'en', 'packages/theme/theme', 'theme_option_favicon', 'Favicon', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1735, 1, 'vi', 'packages/theme/theme', 'name', 'Giao di???n', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1736, 1, 'vi', 'packages/theme/theme', 'activated', '???? k??ch ho???t', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1737, 1, 'vi', 'packages/theme/theme', 'active', 'K??ch ho???t', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1738, 1, 'vi', 'packages/theme/theme', 'active_success', 'K??ch ho???t giao di???n th??nh c??ng!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1739, 1, 'vi', 'packages/theme/theme', 'author', 'T??c gi???', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1740, 1, 'vi', 'packages/theme/theme', 'description', 'M?? t???', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1741, 1, 'vi', 'packages/theme/theme', 'appearance', 'Hi???n th???', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1742, 1, 'vi', 'packages/theme/theme', 'theme', 'Giao di???n', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1743, 1, 'vi', 'packages/theme/theme', 'theme_options', 'Tu??? ch???n giao di???n', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1744, 1, 'vi', 'packages/theme/theme', 'version', 'Phi??n b???n', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1745, 1, 'vi', 'packages/theme/theme', 'save_changes', 'L??u thay ?????i', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1746, 1, 'vi', 'packages/theme/theme', 'developer_mode', '??ang k??ch ho???t ch??? ????? th??? nghi???m', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1747, 1, 'vi', 'packages/theme/theme', 'custom_css', 'Tu??? ch???nh CSS', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1748, 1, 'vi', 'packages/theme/theme', 'remove', 'X??a', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1749, 1, 'vi', 'packages/theme/theme', 'remove_theme', 'X??a giao di???n', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1750, 1, 'vi', 'packages/theme/theme', 'remove_theme_confirm_message', 'B???n c?? ch???c ch???n mu???n x??a giao di???n n??y?', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1751, 1, 'vi', 'packages/theme/theme', 'remove_theme_confirm_yes', 'V??ng, x??c nh???n x??a!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1752, 1, 'vi', 'packages/theme/theme', 'remove_theme_success', 'X??a giao di???n th??nh c??ng!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1753, 1, 'vi', 'packages/theme/theme', 'settings.description', 'C??i ?????t giao di???n', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1754, 1, 'vi', 'packages/theme/theme', 'settings.title', 'Giao di???n', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1755, 1, 'vi', 'packages/theme/theme', 'show_admin_bar', 'Hi???n th??? admin bar (khi admin ???? ????ng nh???p, v???n hi???n th??? admin bar tr??n website)?', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1756, 1, 'vi', 'packages/theme/theme', 'total_themes', 'T???ng s??? giao di???n', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1757, 1, 'vi', 'packages/theme/theme', 'add_new', 'Th??m m???i', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1758, 1, 'en', 'packages/widget/widget', 'name', 'Widgets', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1759, 1, 'en', 'packages/widget/widget', 'create', 'New widget', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1760, 1, 'en', 'packages/widget/widget', 'edit', 'Edit widget', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1761, 1, 'en', 'packages/widget/widget', 'delete', 'Delete', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1762, 1, 'en', 'packages/widget/widget', 'available', 'Available Widgets', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1763, 1, 'en', 'packages/widget/widget', 'instruction', 'To activate a widget drag it to a sidebar or click on it. To deactivate a widget and delete its settings, drag it back.', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1764, 1, 'en', 'packages/widget/widget', 'number_tag_display', 'Number tags will be display', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1765, 1, 'en', 'packages/widget/widget', 'number_post_display', 'Number posts will be display', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1766, 1, 'en', 'packages/widget/widget', 'select_menu', 'Select Menu', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1767, 1, 'en', 'packages/widget/widget', 'widget_text', 'Text', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1768, 1, 'en', 'packages/widget/widget', 'widget_text_description', 'Arbitrary text or HTML.', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1769, 1, 'en', 'packages/widget/widget', 'widget_recent_post', 'Recent Posts', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1770, 1, 'en', 'packages/widget/widget', 'widget_recent_post_description', 'Recent posts widget.', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1771, 1, 'en', 'packages/widget/widget', 'widget_custom_menu', 'Custom Menu', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1772, 1, 'en', 'packages/widget/widget', 'widget_custom_menu_description', 'Add a custom menu to your widget area.', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1773, 1, 'en', 'packages/widget/widget', 'widget_tag', 'Tags', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1774, 1, 'en', 'packages/widget/widget', 'widget_tag_description', 'Popular tags', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1775, 1, 'en', 'packages/widget/widget', 'save_success', 'Save widget successfully!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1776, 1, 'en', 'packages/widget/widget', 'delete_success', 'Delete widget successfully!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1777, 1, 'en', 'packages/widget/widget', 'primary_sidebar_name', 'Primary sidebar', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1778, 1, 'en', 'packages/widget/widget', 'primary_sidebar_description', 'Primary sidebar section', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1779, 1, 'vi', 'packages/widget/widget', 'name', 'Widgets', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1780, 1, 'vi', 'packages/widget/widget', 'create', 'New widget', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1781, 1, 'vi', 'packages/widget/widget', 'edit', 'Edit widget', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1782, 1, 'vi', 'packages/widget/widget', 'available', 'Ti???n ??ch c?? s???n', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1783, 1, 'vi', 'packages/widget/widget', 'delete', 'X??a', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1784, 1, 'vi', 'packages/widget/widget', 'instruction', '????? k??ch ho???t ti???n ??ch, h??y k??o n?? v??o sidebar ho???c nh???n v??o n??. ????? h???y k??ch ho???t ti???n ??ch v?? x??a c??c thi???t l???p c???a ti???n ??ch, k??o n?? quay tr??? l???i.', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1785, 1, 'vi', 'packages/widget/widget', 'number_post_display', 'S??? b??i vi???t s??? hi???n th???', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1786, 1, 'vi', 'packages/widget/widget', 'number_tag_display', 'S??? th??? s??? hi???n th???', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1787, 1, 'vi', 'packages/widget/widget', 'select_menu', 'L???a ch???n tr??nh ????n', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1788, 1, 'vi', 'packages/widget/widget', 'widget_custom_menu', 'Menu t??y ch???nh', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1789, 1, 'vi', 'packages/widget/widget', 'widget_custom_menu_description', 'Th??m menu t??y ch???nh v??o khu v???c ti???n ??ch c???a b???n', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1790, 1, 'vi', 'packages/widget/widget', 'widget_recent_post', 'B??i vi???t g???n ????y', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1791, 1, 'vi', 'packages/widget/widget', 'widget_recent_post_description', 'Ti???n ??ch b??i vi???t g???n ????y', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1792, 1, 'vi', 'packages/widget/widget', 'widget_tag', 'Th???', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1793, 1, 'vi', 'packages/widget/widget', 'widget_tag_description', 'Th??? ph??? bi???n, s??? d???ng nhi???u', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1794, 1, 'vi', 'packages/widget/widget', 'widget_text', 'V??n b???n', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1795, 1, 'vi', 'packages/widget/widget', 'widget_text_description', 'V??n b???n t??y ?? ho???c HTML.', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1796, 1, 'vi', 'packages/widget/widget', 'delete_success', 'Xo?? ti???n ??ch th??nh c??ng', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1797, 1, 'vi', 'packages/widget/widget', 'save_success', 'L??u ti???n ??ch th??nh c??ng!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1798, 1, 'en', 'plugins/ads/ads', 'name', 'Ads', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1799, 1, 'en', 'plugins/ads/ads', 'create', 'New ads', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1800, 1, 'en', 'plugins/ads/ads', 'edit', 'Edit ads', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1801, 1, 'en', 'plugins/ads/ads', 'location', 'Location', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1802, 1, 'en', 'plugins/ads/ads', 'url', 'URL', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1803, 1, 'en', 'plugins/ads/ads', 'expired_at', 'Expired at', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1804, 1, 'en', 'plugins/ads/ads', 'key', 'Key', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1805, 1, 'en', 'plugins/ads/ads', 'shortcode', 'Shortcode', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1806, 1, 'en', 'plugins/ads/ads', 'clicked', 'Clicked', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1807, 1, 'en', 'plugins/ads/ads', 'not_set', 'Not set', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1808, 1, 'en', 'plugins/analytics/analytics', 'sessions', 'Sessions', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1809, 1, 'en', 'plugins/analytics/analytics', 'visitors', 'Visitors', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1810, 1, 'en', 'plugins/analytics/analytics', 'pageviews', 'Pageviews', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1811, 1, 'en', 'plugins/analytics/analytics', 'bounce_rate', 'Bounce Rate', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1812, 1, 'en', 'plugins/analytics/analytics', 'page_session', 'Pages/Session', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1813, 1, 'en', 'plugins/analytics/analytics', 'avg_duration', 'Avg. Duration', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1814, 1, 'en', 'plugins/analytics/analytics', 'percent_new_session', 'Percent new session', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1815, 1, 'en', 'plugins/analytics/analytics', 'new_users', 'New visitors', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1816, 1, 'en', 'plugins/analytics/analytics', 'visits', 'visits', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1817, 1, 'en', 'plugins/analytics/analytics', 'views', 'views', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1818, 1, 'en', 'plugins/analytics/analytics', 'view_id_not_specified', 'You must provide a valid view id. The document here: <a href=\"https://docs.botble.com/cms/:version/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/:version/plugin-analytics</a>', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1819, 1, 'en', 'plugins/analytics/analytics', 'credential_is_not_valid', 'Analytics credentials is not valid. The document here: <a href=\"https://docs.botble.com/cms/:version/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/:version/plugin-analytics</a>', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1820, 1, 'en', 'plugins/analytics/analytics', 'start_date_can_not_before_end_date', 'Start date :start_date cannot be after end date :end_date', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1821, 1, 'en', 'plugins/analytics/analytics', 'wrong_configuration', 'To view analytics you\'ll need to get a google analytics client id and add it to your settings. <br /> You also need JSON credential data. <br /> The document here: <a href=\"https://docs.botble.com/cms/:version/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/:version/plugin-analytics</a>', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1822, 1, 'en', 'plugins/analytics/analytics', 'settings.title', 'Google Analytics', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1823, 1, 'en', 'plugins/analytics/analytics', 'settings.description', 'Config Credentials for Google Analytics', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1824, 1, 'en', 'plugins/analytics/analytics', 'settings.tracking_code', 'Tracking ID', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1825, 1, 'en', 'plugins/analytics/analytics', 'settings.tracking_code_placeholder', 'Example: GA-12586526-8', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1826, 1, 'en', 'plugins/analytics/analytics', 'settings.view_id', 'View ID', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1827, 1, 'en', 'plugins/analytics/analytics', 'settings.view_id_description', 'Google Analytics View ID', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1828, 1, 'en', 'plugins/analytics/analytics', 'settings.json_credential', 'Service Account Credentials', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1829, 1, 'en', 'plugins/analytics/analytics', 'settings.json_credential_description', 'Service Account Credentials', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1830, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_page', 'Top Most Visit Pages', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1831, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_browser', 'Top Browsers', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1832, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_referrer', 'Top Referrers', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1833, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_general', 'Site Analytics', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1834, 1, 'vi', 'plugins/analytics/analytics', 'avg_duration', 'Trung b??nh', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1835, 1, 'vi', 'plugins/analytics/analytics', 'bounce_rate', 'T??? l??? tho??t', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1836, 1, 'vi', 'plugins/analytics/analytics', 'page_session', 'Trang/Phi??n', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1837, 1, 'vi', 'plugins/analytics/analytics', 'pageviews', 'L?????t xem', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1838, 1, 'vi', 'plugins/analytics/analytics', 'sessions', 'Phi??n', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1839, 1, 'vi', 'plugins/analytics/analytics', 'views', 'l?????t xem', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1840, 1, 'vi', 'plugins/analytics/analytics', 'visitors', 'Ng?????i truy c???p', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1841, 1, 'vi', 'plugins/analytics/analytics', 'visits', 'l?????t gh?? th??m', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1842, 1, 'vi', 'plugins/analytics/analytics', 'credential_is_not_valid', 'Th??ng tin c??i ?????t kh??ng h???p l???. T??i li???u h?????ng d???n t???i ????y: <a href=\"https://docs.botble.com/cms/:version/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/:version/plugin-analytics</a>', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1843, 1, 'vi', 'plugins/analytics/analytics', 'new_users', 'L?????t kh??ch m???i', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1844, 1, 'vi', 'plugins/analytics/analytics', 'percent_new_session', 'T??? l??? kh??ch m???i', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1845, 1, 'vi', 'plugins/analytics/analytics', 'start_date_can_not_before_end_date', 'Ng??y b???t ?????u :start_date kh??ng th??? sau ng??y k???t th??c :end_date', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1846, 1, 'vi', 'plugins/analytics/analytics', 'view_id_not_specified', 'B???n ph???i cung c???p View ID h???p l??. T??i li???u h?????ng d???n t???i ????y: <a href=\"https://docs.botble.com/cms/:version/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/:version/plugin-analytics</a>', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1847, 1, 'vi', 'plugins/analytics/analytics', 'wrong_configuration', '????? xem d??? li???u th???ng k?? Google Analytics, b???n c???n l???y th??ng tin Client ID v?? th??m n?? v??o trong ph???n c??i ?????t. B???n c??ng c???n th??ng tin x??c th???c d???ng JSON. T??i li???u h?????ng d???n t???i ????y: <a href=\"https://docs.botble.com/cms/:version/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/:version/plugin-analytics</a>', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1848, 1, 'vi', 'plugins/analytics/analytics', 'settings.title', 'Google Analytics', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1849, 1, 'vi', 'plugins/analytics/analytics', 'settings.description', 'Config Credentials for Google Analytics', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1850, 1, 'vi', 'plugins/analytics/analytics', 'settings.tracking_code', 'Tracking Code', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1851, 1, 'vi', 'plugins/analytics/analytics', 'settings.tracking_code_placeholder', 'Example: GA-12586526-8', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1852, 1, 'vi', 'plugins/analytics/analytics', 'settings.view_id', 'View ID', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1853, 1, 'vi', 'plugins/analytics/analytics', 'settings.view_id_description', 'Google Analytics View ID', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1854, 1, 'vi', 'plugins/analytics/analytics', 'settings.json_credential', 'Service Account Credentials', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1855, 1, 'vi', 'plugins/analytics/analytics', 'settings.json_credential_description', 'Service Account Credentials', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1856, 1, 'vi', 'plugins/analytics/analytics', 'widget_analytics_browser', 'Tr??nh duy???t truy c???p nhi???u', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1857, 1, 'vi', 'plugins/analytics/analytics', 'widget_analytics_general', 'Th???ng k?? truy c???p', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1858, 1, 'vi', 'plugins/analytics/analytics', 'widget_analytics_page', 'Trang ???????c xem nhi???u nh???t', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1859, 1, 'vi', 'plugins/analytics/analytics', 'widget_analytics_referrer', 'Trang gi???i thi???u nhi???u', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1860, 1, 'en', 'plugins/api/api', 'api_clients', 'API Clients', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1861, 1, 'en', 'plugins/api/api', 'create_new_client', 'Create new client', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1862, 1, 'en', 'plugins/api/api', 'create_new_client_success', 'Create new client successfully!', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1863, 1, 'en', 'plugins/api/api', 'edit_client', 'Edit client \":name\"', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1864, 1, 'en', 'plugins/api/api', 'edit_client_success', 'Updated client successfully!', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1865, 1, 'en', 'plugins/api/api', 'delete_success', 'Deleted client successfully!', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1866, 1, 'en', 'plugins/api/api', 'confirm_delete_title', 'Confirm delete client \":name\"', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1867, 1, 'en', 'plugins/api/api', 'confirm_delete_description', 'Do you really want to delete client \":name\"?', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1868, 1, 'en', 'plugins/api/api', 'cancel_delete', 'No', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1869, 1, 'en', 'plugins/api/api', 'continue_delete', 'Yes, let\'s delete it!', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1870, 1, 'en', 'plugins/api/api', 'name', 'Name', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1871, 1, 'en', 'plugins/api/api', 'cancel', 'Cancel', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1872, 1, 'en', 'plugins/api/api', 'save', 'Save', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1873, 1, 'en', 'plugins/api/api', 'edit', 'Edit', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1874, 1, 'en', 'plugins/api/api', 'delete', 'Delete', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1875, 1, 'en', 'plugins/api/api', 'client_id', 'Client ID', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1876, 1, 'en', 'plugins/api/api', 'secret', 'Secret', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1877, 1, 'vi', 'plugins/api/api', 'api_clients', 'API Clients', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1878, 1, 'vi', 'plugins/api/api', 'create_new_client', 'T???o client m???i', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1879, 1, 'vi', 'plugins/api/api', 'create_new_client_success', 'T???o client m???i th??nh c??ng!', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1880, 1, 'vi', 'plugins/api/api', 'edit_client', 'S???a client \":name\"', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1881, 1, 'vi', 'plugins/api/api', 'edit_client_success', 'C???p nh???t client th??nh c??ng!', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1882, 1, 'vi', 'plugins/api/api', 'delete_success', 'Xo?? client th??nh c??ng!', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1883, 1, 'vi', 'plugins/api/api', 'confirm_delete_title', 'Xo?? client \":name\"', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1884, 1, 'vi', 'plugins/api/api', 'confirm_delete_description', 'B???n c?? ch???c ch???n mu???n xo?? client \":name\"?', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1885, 1, 'vi', 'plugins/api/api', 'cancel_delete', 'Kh??ng', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1886, 1, 'vi', 'plugins/api/api', 'continue_delete', 'C??, ti???p t???c xo??!', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1887, 1, 'vi', 'plugins/api/api', 'name', 'T??n', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1888, 1, 'vi', 'plugins/api/api', 'cancel', 'Hu??? b???', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1889, 1, 'vi', 'plugins/api/api', 'save', 'L??u', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1890, 1, 'vi', 'plugins/api/api', 'edit', 'S???a', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1891, 1, 'vi', 'plugins/api/api', 'delete', 'Xo??', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1892, 1, 'vi', 'plugins/api/api', 'client_id', 'Client ID', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1893, 1, 'vi', 'plugins/api/api', 'secret', 'Chu???i b?? m???t', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1894, 1, 'en', 'plugins/audit-log/history', 'name', 'Activities Logs', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1895, 1, 'en', 'plugins/audit-log/history', 'created', 'created', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1896, 1, 'en', 'plugins/audit-log/history', 'updated', 'updated', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1897, 1, 'en', 'plugins/audit-log/history', 'deleted', 'deleted', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1898, 1, 'en', 'plugins/audit-log/history', 'logged in', 'logged in', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1899, 1, 'en', 'plugins/audit-log/history', 'logged out', 'logged out', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1900, 1, 'en', 'plugins/audit-log/history', 'changed password', 'changed password', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1901, 1, 'en', 'plugins/audit-log/history', 'updated profile', 'updated profile', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1902, 1, 'en', 'plugins/audit-log/history', 'attached', 'attached', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1903, 1, 'en', 'plugins/audit-log/history', 'shared', 'shared', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1904, 1, 'en', 'plugins/audit-log/history', 'to the system', 'to the system', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1905, 1, 'en', 'plugins/audit-log/history', 'of the system', 'of the system', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1906, 1, 'en', 'plugins/audit-log/history', 'menu', 'menu', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1907, 1, 'en', 'plugins/audit-log/history', 'post', 'post', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1908, 1, 'en', 'plugins/audit-log/history', 'page', 'page', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1909, 1, 'en', 'plugins/audit-log/history', 'category', 'category', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1910, 1, 'en', 'plugins/audit-log/history', 'tag', 'tag', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1911, 1, 'en', 'plugins/audit-log/history', 'user', 'user', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1912, 1, 'en', 'plugins/audit-log/history', 'contact', 'contact', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1913, 1, 'en', 'plugins/audit-log/history', 'backup', 'backup', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1914, 1, 'en', 'plugins/audit-log/history', 'custom-field', 'custom field', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1915, 1, 'en', 'plugins/audit-log/history', 'widget_audit_logs', 'Activities Logs', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1916, 1, 'en', 'plugins/audit-log/history', 'action', 'Action', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1917, 1, 'en', 'plugins/audit-log/history', 'user_agent', 'User Agent', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1918, 1, 'en', 'plugins/audit-log/history', 'system', 'System', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1919, 1, 'en', 'plugins/audit-log/history', 'delete_all', 'Delete all records', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1920, 1, 'vi', 'plugins/audit-log/history', 'name', 'L???ch s??? ho???t ?????ng', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1921, 1, 'vi', 'plugins/audit-log/history', 'created', ' ???? t???o', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1922, 1, 'vi', 'plugins/audit-log/history', 'updated', ' ???? c???p nh???t', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1923, 1, 'vi', 'plugins/audit-log/history', 'deleted', ' ???? x??a', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1924, 1, 'vi', 'plugins/audit-log/history', 'attached', '????nh k??m', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1925, 1, 'vi', 'plugins/audit-log/history', 'backup', 'sao l??u', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1926, 1, 'vi', 'plugins/audit-log/history', 'category', 'danh m???c', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1927, 1, 'vi', 'plugins/audit-log/history', 'changed password', 'thay ?????i m???t kh???u', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1928, 1, 'vi', 'plugins/audit-log/history', 'contact', 'li??n h???', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1929, 1, 'vi', 'plugins/audit-log/history', 'custom-field', 'khung m??? r???ng', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1930, 1, 'vi', 'plugins/audit-log/history', 'logged in', '????ng nh???p', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1931, 1, 'vi', 'plugins/audit-log/history', 'logged out', '????ng xu???t', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1932, 1, 'vi', 'plugins/audit-log/history', 'menu', 'tr??nh ????n', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1933, 1, 'vi', 'plugins/audit-log/history', 'of the system', 'kh???i h??? th???ng', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1934, 1, 'vi', 'plugins/audit-log/history', 'page', 'trang', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1935, 1, 'vi', 'plugins/audit-log/history', 'post', 'b??i vi???t', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1936, 1, 'vi', 'plugins/audit-log/history', 'shared', '???? chia s???', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1937, 1, 'vi', 'plugins/audit-log/history', 'tag', 'th???', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1938, 1, 'vi', 'plugins/audit-log/history', 'to the system', 'v??o h??? th???ng', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1939, 1, 'vi', 'plugins/audit-log/history', 'updated profile', 'c???p nh???t t??i kho???n', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1940, 1, 'vi', 'plugins/audit-log/history', 'user', 'th??nh vi??n', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1941, 1, 'vi', 'plugins/audit-log/history', 'widget_audit_logs', 'L???ch s??? ho???t ?????ng', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1942, 1, 'vi', 'plugins/audit-log/history', 'system', 'H??? th???ng', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1943, 1, 'vi', 'plugins/audit-log/history', 'action', 'H??nh ?????ng', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1944, 1, 'vi', 'plugins/audit-log/history', 'delete_all', 'X??a t???t c??? b???n ghi', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1945, 1, 'vi', 'plugins/audit-log/history', 'user_agent', 'User Agent', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1946, 1, 'en', 'plugins/backup/backup', 'name', 'Backup', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1947, 1, 'en', 'plugins/backup/backup', 'backup_description', 'Backup database and uploads folder.', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1948, 1, 'en', 'plugins/backup/backup', 'create_backup_success', 'Created backup successfully!', '2021-03-14 19:40:46', '2021-03-14 19:40:46');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1949, 1, 'en', 'plugins/backup/backup', 'delete_backup_success', 'Delete backup successfully!', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1950, 1, 'en', 'plugins/backup/backup', 'restore_backup_success', 'Restore backup successfully!', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1951, 1, 'en', 'plugins/backup/backup', 'generate_btn', 'Generate backup', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1952, 1, 'en', 'plugins/backup/backup', 'create', 'Create a backup', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1953, 1, 'en', 'plugins/backup/backup', 'restore', 'Restore a backup', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1954, 1, 'en', 'plugins/backup/backup', 'create_btn', 'Create', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1955, 1, 'en', 'plugins/backup/backup', 'restore_btn', 'Restore', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1956, 1, 'en', 'plugins/backup/backup', 'restore_confirm_msg', 'Do you really want to restore this revision?', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1957, 1, 'en', 'plugins/backup/backup', 'download_uploads_folder', 'Download backup of uploads folder', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1958, 1, 'en', 'plugins/backup/backup', 'download_database', 'Download backup of database', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1959, 1, 'en', 'plugins/backup/backup', 'restore_tooltip', 'Restore this backup', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1960, 1, 'en', 'plugins/backup/backup', 'demo_alert', 'Hi guest, if you see demo site is destroyed, please help me <a href=\":link\">go here</a> and restore demo site to the latest revision! Thank you so much!', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1961, 1, 'en', 'plugins/backup/backup', 'menu_name', 'Backups', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1962, 1, 'en', 'plugins/backup/backup', 'size', 'Size', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1963, 1, 'en', 'plugins/backup/backup', 'no_backups', 'There is no backup now!', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1964, 1, 'vi', 'plugins/backup/backup', 'backup_description', 'Sao l??u c?? s??? d??? li???u v?? th?? m???c /uploads', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1965, 1, 'vi', 'plugins/backup/backup', 'create', 'T???o b???n sao l??u', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1966, 1, 'vi', 'plugins/backup/backup', 'create_backup_success', 'T???o b???n sao l??u th??nh c??ng!', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1967, 1, 'vi', 'plugins/backup/backup', 'create_btn', 'T???o', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1968, 1, 'vi', 'plugins/backup/backup', 'delete_backup_success', 'X??a b???n sao l??u th??nh c??ng!', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1969, 1, 'vi', 'plugins/backup/backup', 'generate_btn', 'T???o sao l??u', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1970, 1, 'vi', 'plugins/backup/backup', 'name', 'Sao l??u', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1971, 1, 'vi', 'plugins/backup/backup', 'restore', 'Kh??i ph???c b???n sao l??u', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1972, 1, 'vi', 'plugins/backup/backup', 'restore_backup_success', 'Kh??i ph???c b???n sao l??u th??nh c??ng', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1973, 1, 'vi', 'plugins/backup/backup', 'restore_btn', 'Kh??i ph???c', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1974, 1, 'vi', 'plugins/backup/backup', 'restore_confirm_msg', 'B???n c?? ch???c ch???n mu???n kh??i ph???c h??? th???ng v??? th???i ??i???m t???o b???n sao l??u n??y?', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1975, 1, 'vi', 'plugins/backup/backup', 'restore_tooltip', 'Kh??i ph???c b???n sao l??u n??y', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1976, 1, 'vi', 'plugins/backup/backup', 'download_database', 'T???i v??? b???n sao l??u CSDL', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1977, 1, 'vi', 'plugins/backup/backup', 'download_uploads_folder', 'T???i v??? b???n sao l??u th?? m???c uploads', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1978, 1, 'vi', 'plugins/backup/backup', 'menu_name', 'Sao l??u', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1979, 1, 'vi', 'plugins/backup/backup', 'demo_alert', 'Ch??o kh??ch, n???u b???n th???y trang demo b??? ph?? ho???i, h??y t???i <a href=\":link\">trang sao l??u</a> v?? kh??i ph???c b???n sao l??u cu???i c??ng. C???m ??n b???n nhi???u!', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1980, 1, 'en', 'plugins/blog/base', 'menu_name', 'Blog', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1981, 1, 'en', 'plugins/blog/base', 'blog_page', 'Blog Page', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1982, 1, 'en', 'plugins/blog/base', 'select', '-- Select --', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1983, 1, 'en', 'plugins/blog/base', 'blog_page_id', 'Blog page', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1984, 1, 'en', 'plugins/blog/base', 'number_posts_per_page', 'Number posts per page', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1985, 1, 'en', 'plugins/blog/base', 'write_some_tags', 'Write some tags', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1986, 1, 'en', 'plugins/blog/base', 'short_code_name', 'Blog posts', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1987, 1, 'en', 'plugins/blog/base', 'short_code_description', 'Add blog posts', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1988, 1, 'en', 'plugins/blog/base', 'number_posts_per_page_in_category', 'Number of posts per page in a category', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1989, 1, 'en', 'plugins/blog/base', 'number_posts_per_page_in_tag', 'Number of posts per page in a tag', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1990, 1, 'en', 'plugins/blog/categories', 'create', 'Create new category', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1991, 1, 'en', 'plugins/blog/categories', 'edit', 'Edit category', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1992, 1, 'en', 'plugins/blog/categories', 'menu', 'Categories', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1993, 1, 'en', 'plugins/blog/categories', 'edit_this_category', 'Edit this category', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1994, 1, 'en', 'plugins/blog/categories', 'menu_name', 'Categories', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1995, 1, 'en', 'plugins/blog/categories', 'none', 'None', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1996, 1, 'en', 'plugins/blog/member', 'dob', 'Born :date', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1997, 1, 'en', 'plugins/blog/member', 'draft_posts', 'Draft Posts', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1998, 1, 'en', 'plugins/blog/member', 'pending_posts', 'Pending Posts', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1999, 1, 'en', 'plugins/blog/member', 'published_posts', 'Published Posts', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2000, 1, 'en', 'plugins/blog/member', 'posts', 'Posts', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2001, 1, 'en', 'plugins/blog/member', 'write_post', 'Write a post', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2002, 1, 'en', 'plugins/blog/posts', 'create', 'Create new post', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2003, 1, 'en', 'plugins/blog/posts', 'edit', 'Edit post', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2004, 1, 'en', 'plugins/blog/posts', 'form.name', 'Name', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2005, 1, 'en', 'plugins/blog/posts', 'form.name_placeholder', 'Post\'s name (Maximum :c characters)', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2006, 1, 'en', 'plugins/blog/posts', 'form.description', 'Description', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2007, 1, 'en', 'plugins/blog/posts', 'form.description_placeholder', 'Short description for post (Maximum :c characters)', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2008, 1, 'en', 'plugins/blog/posts', 'form.categories', 'Categories', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2009, 1, 'en', 'plugins/blog/posts', 'form.tags', 'Tags', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2010, 1, 'en', 'plugins/blog/posts', 'form.tags_placeholder', 'Tags', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2011, 1, 'en', 'plugins/blog/posts', 'form.content', 'Content', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2012, 1, 'en', 'plugins/blog/posts', 'form.is_featured', 'Is featured?', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2013, 1, 'en', 'plugins/blog/posts', 'form.note', 'Note content', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2014, 1, 'en', 'plugins/blog/posts', 'form.format_type', 'Format', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2015, 1, 'en', 'plugins/blog/posts', 'cannot_delete', 'Post could not be deleted', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2016, 1, 'en', 'plugins/blog/posts', 'post_deleted', 'Post deleted', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2017, 1, 'en', 'plugins/blog/posts', 'posts', 'Posts', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2018, 1, 'en', 'plugins/blog/posts', 'post', 'Post', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2019, 1, 'en', 'plugins/blog/posts', 'edit_this_post', 'Edit this post', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2020, 1, 'en', 'plugins/blog/posts', 'no_new_post_now', 'There is no new post now!', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2021, 1, 'en', 'plugins/blog/posts', 'menu_name', 'Posts', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2022, 1, 'en', 'plugins/blog/posts', 'widget_posts_recent', 'Recent Posts', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2023, 1, 'en', 'plugins/blog/posts', 'categories', 'Categories', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2024, 1, 'en', 'plugins/blog/posts', 'category', 'Category', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2025, 1, 'en', 'plugins/blog/posts', 'author', 'Author', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2026, 1, 'en', 'plugins/blog/tags', 'form.name', 'Name', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2027, 1, 'en', 'plugins/blog/tags', 'form.name_placeholder', 'Tag\'s name (Maximum 120 characters)', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2028, 1, 'en', 'plugins/blog/tags', 'form.description', 'Description', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2029, 1, 'en', 'plugins/blog/tags', 'form.description_placeholder', 'Short description for tag (Maximum 400 characters)', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2030, 1, 'en', 'plugins/blog/tags', 'form.categories', 'Categories', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2031, 1, 'en', 'plugins/blog/tags', 'notices.no_select', 'Please select at least one tag to take this action!', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2032, 1, 'en', 'plugins/blog/tags', 'create', 'Create new tag', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2033, 1, 'en', 'plugins/blog/tags', 'edit', 'Edit tag', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2034, 1, 'en', 'plugins/blog/tags', 'cannot_delete', 'Tag could not be deleted', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2035, 1, 'en', 'plugins/blog/tags', 'deleted', 'Tag deleted', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2036, 1, 'en', 'plugins/blog/tags', 'menu', 'Tags', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2037, 1, 'en', 'plugins/blog/tags', 'edit_this_tag', 'Edit this tag', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2038, 1, 'en', 'plugins/blog/tags', 'menu_name', 'Tags', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2039, 1, 'vi', 'plugins/blog/base', 'menu_name', 'Blog', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2040, 1, 'vi', 'plugins/blog/base', 'blog_page', 'Trang Blog', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2041, 1, 'vi', 'plugins/blog/base', 'select', '-- L???a ch???n --', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2042, 1, 'vi', 'plugins/blog/base', 'blog_page_id', 'Trang Blog', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2043, 1, 'vi', 'plugins/blog/categories', 'create', 'Th??m danh mu??c m????i', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2044, 1, 'vi', 'plugins/blog/categories', 'edit', 'S????a danh mu??c', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2045, 1, 'vi', 'plugins/blog/categories', 'menu', 'Danh m???c', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2046, 1, 'vi', 'plugins/blog/categories', 'edit_this_category', 'S???a danh m???c n??y', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2047, 1, 'vi', 'plugins/blog/categories', 'menu_name', 'Danh m???c', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2048, 1, 'vi', 'plugins/blog/categories', 'none', 'Kh??ng', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2049, 1, 'vi', 'plugins/blog/member', 'dob', 'Born :date', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2050, 1, 'vi', 'plugins/blog/member', 'draft_posts', 'Draft Posts', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2051, 1, 'vi', 'plugins/blog/member', 'pending_posts', 'Pending Posts', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2052, 1, 'vi', 'plugins/blog/member', 'published_posts', 'Published Posts', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2053, 1, 'vi', 'plugins/blog/member', 'posts', 'Posts', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2054, 1, 'vi', 'plugins/blog/member', 'write_post', 'Write a post', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2055, 1, 'vi', 'plugins/blog/posts', 'create', 'Th??m ba??i vi???t', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2056, 1, 'vi', 'plugins/blog/posts', 'edit', 'S????a ba??i vi???t', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2057, 1, 'vi', 'plugins/blog/posts', 'form.name', 'T??n', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2058, 1, 'vi', 'plugins/blog/posts', 'form.name_placeholder', 'T??n b??i vi???t (T???i ??a 120 k?? t???)', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2059, 1, 'vi', 'plugins/blog/posts', 'form.description', 'M?? t???', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2060, 1, 'vi', 'plugins/blog/posts', 'form.description_placeholder', 'M?? t??? ng???n cho b??i vi???t (T???i ??a 400 k?? t???)', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2061, 1, 'vi', 'plugins/blog/posts', 'form.categories', 'Chuy??n m???c', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2062, 1, 'vi', 'plugins/blog/posts', 'form.tags', 'T??? kh??a', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2063, 1, 'vi', 'plugins/blog/posts', 'form.tags_placeholder', 'Th??m t??? kh??a', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2064, 1, 'vi', 'plugins/blog/posts', 'form.content', 'N???i dung', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2065, 1, 'vi', 'plugins/blog/posts', 'form.is_featured', 'B??i vi???t n???i b???t?', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2066, 1, 'vi', 'plugins/blog/posts', 'form.note', 'N????i dung ghi chu??', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2067, 1, 'vi', 'plugins/blog/posts', 'form.format_type', '?????nh d???ng', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2068, 1, 'vi', 'plugins/blog/posts', 'post_deleted', 'Xo??a ba??i vi????t tha??nh c??ng', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2069, 1, 'vi', 'plugins/blog/posts', 'cannot_delete', 'Kh??ng th???? xo??a ba??i vi????t', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2070, 1, 'vi', 'plugins/blog/posts', 'menu_name', 'B??i vi???t', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2071, 1, 'vi', 'plugins/blog/posts', 'edit_this_post', 'S???a b??i vi???t n??y', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2072, 1, 'vi', 'plugins/blog/posts', 'no_new_post_now', 'Hi???n t???i kh??ng c?? b??i vi???t m???i!', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2073, 1, 'vi', 'plugins/blog/posts', 'posts', 'B??i vi???t', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2074, 1, 'vi', 'plugins/blog/posts', 'post', 'B??i vi???t', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2075, 1, 'vi', 'plugins/blog/posts', 'widget_posts_recent', 'B??i vi???t g???n ????y', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2076, 1, 'vi', 'plugins/blog/posts', 'author', 'T??c gi???', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2077, 1, 'vi', 'plugins/blog/posts', 'categories', 'Danh m???c', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2078, 1, 'vi', 'plugins/blog/posts', 'category', 'Danh m???c', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2079, 1, 'vi', 'plugins/blog/tags', 'create', 'Th??m th??? m????i', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2080, 1, 'vi', 'plugins/blog/tags', 'edit', 'S????a th???', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2081, 1, 'vi', 'plugins/blog/tags', 'form.name', 'T??n', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2082, 1, 'vi', 'plugins/blog/tags', 'form.name_placeholder', 'T??n th??? (T???i ??a 120 k?? t???)', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2083, 1, 'vi', 'plugins/blog/tags', 'form.description', 'M?? t???', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2084, 1, 'vi', 'plugins/blog/tags', 'form.description_placeholder', 'M?? t??? ng???n cho tag (T???i ??a 400 k?? t???)', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2085, 1, 'vi', 'plugins/blog/tags', 'form.categories', 'Chuy??n m???c', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2086, 1, 'vi', 'plugins/blog/tags', 'notices.no_select', 'Cho??n i??t nh????t 1 ba??i vi????t ?????? th????c hi????n ha??nh ??????ng na??y!', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2087, 1, 'vi', 'plugins/blog/tags', 'cannot_delete', 'Kh??ng th???? xo??a th???', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2088, 1, 'vi', 'plugins/blog/tags', 'deleted', 'Xo??a th??? tha??nh c??ng', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2089, 1, 'vi', 'plugins/blog/tags', 'menu_name', 'Th???', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2090, 1, 'vi', 'plugins/blog/tags', 'edit_this_tag', 'S???a th??? n??y', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2091, 1, 'vi', 'plugins/blog/tags', 'menu', 'Th???', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2092, 1, 'en', 'plugins/captcha/captcha', 'settings.title', 'Captcha', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2093, 1, 'en', 'plugins/captcha/captcha', 'settings.description', 'Settings for Google Captcha', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2094, 1, 'en', 'plugins/captcha/captcha', 'settings.captcha_site_key', 'Captcha Site Key', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2095, 1, 'en', 'plugins/captcha/captcha', 'settings.captcha_secret', 'Captcha Secret', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2096, 1, 'en', 'plugins/captcha/captcha', 'settings.enable_captcha', 'Enable Captcha?', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2097, 1, 'en', 'plugins/captcha/captcha', 'settings.helper', 'Go here to get credentials https://www.google.com/recaptcha/admin#list.', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2098, 1, 'en', 'plugins/captcha/captcha', 'settings.hide_badge', 'Hide recaptcha badge (for v3)', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2099, 1, 'en', 'plugins/captcha/captcha', 'settings.type', 'Type', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2100, 1, 'en', 'plugins/captcha/captcha', 'settings.v2_description', 'V2 (Verify requests with a challenge)', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2101, 1, 'en', 'plugins/captcha/captcha', 'settings.v3_description', 'V3 (Verify requests with a score)', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2102, 1, 'en', 'plugins/captcha/captcha', 'failed_validate', 'Failed to validate the captcha.', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2103, 1, 'vi', 'plugins/captcha/captcha', 'settings.title', 'Captcha', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2104, 1, 'vi', 'plugins/captcha/captcha', 'settings.description', 'C??i ?????t cho Google Captcha', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2105, 1, 'vi', 'plugins/captcha/captcha', 'settings.captcha_site_key', 'Captcha Site Key', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2106, 1, 'vi', 'plugins/captcha/captcha', 'settings.captcha_secret', 'Captcha Secret', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2107, 1, 'vi', 'plugins/captcha/captcha', 'settings.enable_captcha', 'B???t Captcha?', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2108, 1, 'vi', 'plugins/captcha/captcha', 'settings.helper', 'Truy c???p https://www.google.com/recaptcha/admin#list ????? l???y th??ng tin v??? Site key v?? Secret.', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2109, 1, 'en', 'plugins/contact/contact', 'menu', 'Contact', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2110, 1, 'en', 'plugins/contact/contact', 'edit', 'View contact', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2111, 1, 'en', 'plugins/contact/contact', 'tables.phone', 'Phone', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2112, 1, 'en', 'plugins/contact/contact', 'tables.email', 'Email', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2113, 1, 'en', 'plugins/contact/contact', 'tables.full_name', 'Full Name', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2114, 1, 'en', 'plugins/contact/contact', 'tables.time', 'Time', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2115, 1, 'en', 'plugins/contact/contact', 'tables.address', 'Address', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2116, 1, 'en', 'plugins/contact/contact', 'tables.subject', 'Subject', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2117, 1, 'en', 'plugins/contact/contact', 'tables.content', 'Content', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2118, 1, 'en', 'plugins/contact/contact', 'contact_information', 'Contact information', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2119, 1, 'en', 'plugins/contact/contact', 'replies', 'Replies', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2120, 1, 'en', 'plugins/contact/contact', 'email.header', 'Email', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2121, 1, 'en', 'plugins/contact/contact', 'email.title', 'New contact from your site', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2122, 1, 'en', 'plugins/contact/contact', 'email.success', 'Send message successfully!', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2123, 1, 'en', 'plugins/contact/contact', 'email.failed', 'Can\'t send message on this time, please try again later!', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2124, 1, 'en', 'plugins/contact/contact', 'form.name.required', 'Name is required', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2125, 1, 'en', 'plugins/contact/contact', 'form.email.required', 'Email is required', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2126, 1, 'en', 'plugins/contact/contact', 'form.email.email', 'The email address is not valid', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2127, 1, 'en', 'plugins/contact/contact', 'form.content.required', 'Content is required', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2128, 1, 'en', 'plugins/contact/contact', 'contact_sent_from', 'This contact information sent from', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2129, 1, 'en', 'plugins/contact/contact', 'sender', 'Sender', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2130, 1, 'en', 'plugins/contact/contact', 'sender_email', 'Email', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2131, 1, 'en', 'plugins/contact/contact', 'sender_address', 'Address', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2132, 1, 'en', 'plugins/contact/contact', 'sender_phone', 'Phone', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2133, 1, 'en', 'plugins/contact/contact', 'message_content', 'Message content', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2134, 1, 'en', 'plugins/contact/contact', 'sent_from', 'Email sent from', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2135, 1, 'en', 'plugins/contact/contact', 'form_name', 'Name', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2136, 1, 'en', 'plugins/contact/contact', 'form_email', 'Email', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2137, 1, 'en', 'plugins/contact/contact', 'form_address', 'Address', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2138, 1, 'en', 'plugins/contact/contact', 'form_subject', 'Subject', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2139, 1, 'en', 'plugins/contact/contact', 'form_phone', 'Phone', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2140, 1, 'en', 'plugins/contact/contact', 'form_message', 'Message', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2141, 1, 'en', 'plugins/contact/contact', 'required_field', 'The field with (<span style=\"color: red\">*</span>) is required.', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2142, 1, 'en', 'plugins/contact/contact', 'send_btn', 'Send message', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2143, 1, 'en', 'plugins/contact/contact', 'new_msg_notice', 'You have <span class=\"bold\">:count</span> New Messages', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2144, 1, 'en', 'plugins/contact/contact', 'view_all', 'View all', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2145, 1, 'en', 'plugins/contact/contact', 'statuses.read', 'Read', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2146, 1, 'en', 'plugins/contact/contact', 'statuses.unread', 'Unread', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2147, 1, 'en', 'plugins/contact/contact', 'phone', 'Phone', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2148, 1, 'en', 'plugins/contact/contact', 'address', 'Address', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2149, 1, 'en', 'plugins/contact/contact', 'message', 'Message', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2150, 1, 'en', 'plugins/contact/contact', 'settings.email.title', 'Contact', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2151, 1, 'en', 'plugins/contact/contact', 'settings.email.description', 'Contact email configuration', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2152, 1, 'en', 'plugins/contact/contact', 'settings.email.templates.notice_title', 'Send notice to administrator', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2153, 1, 'en', 'plugins/contact/contact', 'settings.email.templates.notice_description', 'Email template to send notice to administrator when system get new contact', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2154, 1, 'en', 'plugins/contact/contact', 'no_reply', 'No reply yet!', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2155, 1, 'en', 'plugins/contact/contact', 'reply', 'Reply', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2156, 1, 'en', 'plugins/contact/contact', 'send', 'Send', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2157, 1, 'en', 'plugins/contact/contact', 'shortcode_name', 'Contact form', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2158, 1, 'en', 'plugins/contact/contact', 'shortcode_description', 'Add a contact form', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2159, 1, 'en', 'plugins/contact/contact', 'shortcode_content_description', 'Add shortcode [contact-form][/contact-form] to editor?', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2160, 1, 'en', 'plugins/contact/contact', 'message_sent_success', 'Message sent successfully!', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2161, 1, 'vi', 'plugins/contact/contact', 'menu', 'Li??n h????', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2162, 1, 'vi', 'plugins/contact/contact', 'edit', 'Xem li??n h????', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2163, 1, 'vi', 'plugins/contact/contact', 'tables.phone', '??i????n thoa??i', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2164, 1, 'vi', 'plugins/contact/contact', 'tables.email', 'Email', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2165, 1, 'vi', 'plugins/contact/contact', 'tables.full_name', 'Ho?? t??n', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2166, 1, 'vi', 'plugins/contact/contact', 'tables.time', 'Th???i gian', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2167, 1, 'vi', 'plugins/contact/contact', 'tables.address', '??i??a ?????a ch???', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2168, 1, 'vi', 'plugins/contact/contact', 'tables.subject', 'Ti??u ?????', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2169, 1, 'vi', 'plugins/contact/contact', 'tables.content', 'N????i dung', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2170, 1, 'vi', 'plugins/contact/contact', 'contact_information', 'Th??ng tin li??n h????', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2171, 1, 'vi', 'plugins/contact/contact', 'email.title', 'Th??ng tin li??n h???? m????i', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2172, 1, 'vi', 'plugins/contact/contact', 'email.success', 'G????i tin nh????n tha??nh c??ng!', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2173, 1, 'vi', 'plugins/contact/contact', 'email.failed', 'Co?? l????i trong qua?? tri??nh g????i tin nh????n!', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2174, 1, 'vi', 'plugins/contact/contact', 'email.header', 'Email', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2175, 1, 'vi', 'plugins/contact/contact', 'form.name.required', 'T??n l?? b???t bu???c', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2176, 1, 'vi', 'plugins/contact/contact', 'form.email.required', 'Email l?? b???t bu???c', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2177, 1, 'vi', 'plugins/contact/contact', 'form.email.email', '?????a ch??? email kh??ng h???p l???', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2178, 1, 'vi', 'plugins/contact/contact', 'form.content.required', 'N???i dung l?? b???t bu???c', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2179, 1, 'vi', 'plugins/contact/contact', 'form.g-recaptcha-response.required', 'Ha??y xa??c minh kh??ng pha??i la?? robot tr??????c khi g???i tin nh???n.', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2180, 1, 'vi', 'plugins/contact/contact', 'form.g-recaptcha-response.captcha', 'Ba??n ch??a xa??c minh kh??ng ph???i la?? robot tha??nh c??ng.', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2181, 1, 'vi', 'plugins/contact/contact', 'contact_sent_from', 'Li??n h??? n??y ???????c g???i t???', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2182, 1, 'vi', 'plugins/contact/contact', 'form_address', '?????a ch???', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2183, 1, 'vi', 'plugins/contact/contact', 'form_email', 'Th?? ??i???n t???', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2184, 1, 'vi', 'plugins/contact/contact', 'form_message', 'Th??ng ??i???p', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2185, 1, 'vi', 'plugins/contact/contact', 'form_name', 'H??? t??n', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2186, 1, 'vi', 'plugins/contact/contact', 'form_phone', 'S??? ??i???n tho???i', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2187, 1, 'vi', 'plugins/contact/contact', 'message_content', 'N???i dung th??ng ??i???p', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2188, 1, 'vi', 'plugins/contact/contact', 'required_field', 'Nh???ng tr?????ng c?? d???u (<span style=\"color: red\">*</span>) l?? b???t bu???c.', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2189, 1, 'vi', 'plugins/contact/contact', 'send_btn', 'G???i tin nh???n', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2190, 1, 'vi', 'plugins/contact/contact', 'sender', 'Ng?????i g???i', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2191, 1, 'vi', 'plugins/contact/contact', 'sender_address', '?????a ch???', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2192, 1, 'vi', 'plugins/contact/contact', 'sender_email', 'Th?? ??i???n t???', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2193, 1, 'vi', 'plugins/contact/contact', 'sender_phone', 'S??? ??i???n tho???i', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2194, 1, 'vi', 'plugins/contact/contact', 'sent_from', 'Th?? ???????c g???i t???', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2195, 1, 'vi', 'plugins/contact/contact', 'address', '?????a ch???', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2196, 1, 'vi', 'plugins/contact/contact', 'message', 'Li??n h???', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2197, 1, 'vi', 'plugins/contact/contact', 'new_msg_notice', 'B???n c?? <span class=\"bold\">:count</span> tin nh???n m???i', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2198, 1, 'vi', 'plugins/contact/contact', 'phone', '??i???n tho???i', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2199, 1, 'vi', 'plugins/contact/contact', 'statuses.read', '???? ?????c', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2200, 1, 'vi', 'plugins/contact/contact', 'statuses.unread', 'Ch??a ?????c', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2201, 1, 'vi', 'plugins/contact/contact', 'view_all', 'Xem t???t c???', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2202, 1, 'vi', 'plugins/contact/contact', 'settings.email.title', 'Li??n h???', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2203, 1, 'vi', 'plugins/contact/contact', 'settings.email.description', 'C???u h??nh th??ng tin cho m???c li??n h???', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2204, 1, 'vi', 'plugins/contact/contact', 'settings.email.templates.notice_title', 'Th??ng b??o t???i admin', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2205, 1, 'vi', 'plugins/contact/contact', 'settings.email.templates.notice_description', 'M???u n???i dung email g???i t???i admin khi c?? li??n h??? m???i', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2206, 1, 'vi', 'plugins/contact/contact', 'replies', 'Tr??? l???i', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2207, 1, 'vi', 'plugins/contact/contact', 'form_subject', 'Ti??u ?????', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2208, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.name', 'Cookie Consent', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2209, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.description', 'Cookie consent settings', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2210, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.enable', 'Enable cookie consent?', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2211, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.message', 'Message', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2212, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.button_text', 'Button text', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2213, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.max_width', 'Max width (px)', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2214, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.background_color', 'Background color', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2215, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.text_color', 'Text color', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2216, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.learn_more_url', 'Learn more URL', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2217, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.learn_more_text', 'Learn more text', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2218, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'message', 'Your experience on this site will be improved by allowing cookies.', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2219, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'button_text', 'Allow cookies', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2220, 1, 'en', 'plugins/gallery/gallery', 'create', 'Create new gallery', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2221, 1, 'en', 'plugins/gallery/gallery', 'edit', 'Edit gallery', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2222, 1, 'en', 'plugins/gallery/gallery', 'galleries', 'Galleries', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2223, 1, 'en', 'plugins/gallery/gallery', 'item', 'Gallery item', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2224, 1, 'en', 'plugins/gallery/gallery', 'select_image', 'Select images', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2225, 1, 'en', 'plugins/gallery/gallery', 'reset', 'Reset gallery', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2226, 1, 'en', 'plugins/gallery/gallery', 'update_photo_description', 'Update photo\'s description', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2227, 1, 'en', 'plugins/gallery/gallery', 'update_photo_description_placeholder', 'Photo\'s description...', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2228, 1, 'en', 'plugins/gallery/gallery', 'delete_photo', 'Delete this photo', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2229, 1, 'en', 'plugins/gallery/gallery', 'gallery_box', 'Gallery images', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2230, 1, 'en', 'plugins/gallery/gallery', 'by', 'By', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2231, 1, 'en', 'plugins/gallery/gallery', 'menu_name', 'Galleries', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2232, 1, 'en', 'plugins/gallery/gallery', 'gallery_images', 'Gallery images', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2233, 1, 'en', 'plugins/gallery/gallery', 'add_gallery_short_code', 'Add a gallery', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2234, 1, 'en', 'plugins/gallery/gallery', 'shortcode_name', 'Gallery images', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2235, 1, 'en', 'plugins/gallery/gallery', 'limit_display', 'Limit number display', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2236, 1, 'vi', 'plugins/gallery/gallery', 'create', 'T???o m???i th?? vi???n ???nh', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2237, 1, 'vi', 'plugins/gallery/gallery', 'edit', 'S???a th?? vi???n ???nh', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2238, 1, 'vi', 'plugins/gallery/gallery', 'delete_photo', 'X??a ???nh n??y', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2239, 1, 'vi', 'plugins/gallery/gallery', 'galleries', 'Th?? vi???n ???nh', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2240, 1, 'vi', 'plugins/gallery/gallery', 'item', '???nh', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2241, 1, 'vi', 'plugins/gallery/gallery', 'reset', 'L??m m???i th?? vi???n', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2242, 1, 'vi', 'plugins/gallery/gallery', 'select_image', 'L???a ch???n h??nh ???nh', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2243, 1, 'vi', 'plugins/gallery/gallery', 'update_photo_description', 'C???p nh???t m?? t??? cho h??nh ???nh', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2244, 1, 'vi', 'plugins/gallery/gallery', 'update_photo_description_placeholder', 'M?? t??? c???a h??nh ???nh', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2245, 1, 'vi', 'plugins/gallery/gallery', 'by', 'B???i', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2246, 1, 'vi', 'plugins/gallery/gallery', 'gallery_box', 'Th?? vi???n ???nh', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2247, 1, 'vi', 'plugins/gallery/gallery', 'menu_name', 'Th?? vi???n ???nh', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2248, 1, 'vi', 'plugins/gallery/gallery', 'add_gallery_short_code', 'Th??m th?? vi???n ???nh', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2249, 1, 'vi', 'plugins/gallery/gallery', 'gallery_images', 'Th?? vi???n ???nh', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2250, 1, 'en', 'plugins/language/language', 'name', 'Languages', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2251, 1, 'en', 'plugins/language/language', 'choose_language', 'Choose a language', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2252, 1, 'en', 'plugins/language/language', 'select_language', 'Select language', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2253, 1, 'en', 'plugins/language/language', 'choose_language_helper', 'You can choose a language in the list or directly edit it below.', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2254, 1, 'en', 'plugins/language/language', 'language_name', 'Language name', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2255, 1, 'en', 'plugins/language/language', 'language_name_helper', 'The name is how it is displayed on your site (for example: English).', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2256, 1, 'en', 'plugins/language/language', 'locale', 'Locale', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2257, 1, 'en', 'plugins/language/language', 'locale_helper', 'Laravel Locale for the language (for example: <code>en</code>).', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2258, 1, 'en', 'plugins/language/language', 'language_code', 'Language code', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2259, 1, 'en', 'plugins/language/language', 'language_code_helper', 'Language code - preferably 2-letters ISO 639-1 (for example: en)', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2260, 1, 'en', 'plugins/language/language', 'text_direction', 'Text direction', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2261, 1, 'en', 'plugins/language/language', 'text_direction_helper', 'Choose the text direction for the language', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2262, 1, 'en', 'plugins/language/language', 'left_to_right', 'Left to right', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2263, 1, 'en', 'plugins/language/language', 'right_to_left', 'Right to left', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2264, 1, 'en', 'plugins/language/language', 'flag', 'Flag', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2265, 1, 'en', 'plugins/language/language', 'flag_helper', 'Choose a flag for the language.', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2266, 1, 'en', 'plugins/language/language', 'order', 'Order', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2267, 1, 'en', 'plugins/language/language', 'order_helper', 'Position of the language in the language switcher', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2268, 1, 'en', 'plugins/language/language', 'add_new_language', 'Add new language', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2269, 1, 'en', 'plugins/language/language', 'code', 'Code', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2270, 1, 'en', 'plugins/language/language', 'default_language', 'Is default?', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2271, 1, 'en', 'plugins/language/language', 'actions', 'Actions', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2272, 1, 'en', 'plugins/language/language', 'translations', 'Translations', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2273, 1, 'en', 'plugins/language/language', 'edit', 'Edit', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2274, 1, 'en', 'plugins/language/language', 'edit_tooltip', 'Edit this language', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2275, 1, 'en', 'plugins/language/language', 'delete', 'Delete', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2276, 1, 'en', 'plugins/language/language', 'delete_tooltip', 'Delete this language and all its associated data', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2277, 1, 'en', 'plugins/language/language', 'choose_default_language', 'Choose :language as default language', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2278, 1, 'en', 'plugins/language/language', 'current_language', 'Current record\'s language', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2279, 1, 'en', 'plugins/language/language', 'edit_related', 'Edit related language for this record', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2280, 1, 'en', 'plugins/language/language', 'add_language_for_item', 'Add other language version for this record', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2281, 1, 'en', 'plugins/language/language', 'settings', 'Settings', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2282, 1, 'en', 'plugins/language/language', 'language_hide_default', 'Hide default language from URL?', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2283, 1, 'en', 'plugins/language/language', 'language_display_flag_only', 'Flag only', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2284, 1, 'en', 'plugins/language/language', 'language_display_name_only', 'Name only', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2285, 1, 'en', 'plugins/language/language', 'language_display_all', 'Display all flag and name', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2286, 1, 'en', 'plugins/language/language', 'language_display', 'Language display', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2287, 1, 'en', 'plugins/language/language', 'switcher_display', 'Switcher language display', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2288, 1, 'en', 'plugins/language/language', 'language_switcher_display_dropdown', 'Dropdown', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2289, 1, 'en', 'plugins/language/language', 'language_switcher_display_list', 'List', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2290, 1, 'en', 'plugins/language/language', 'current_language_edit_notification', 'You are editing \"<strong class=\"current_language_text\">:language</strong>\" version', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2291, 1, 'en', 'plugins/language/language', 'confirm-change-language', 'Confirm change language', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2292, 1, 'en', 'plugins/language/language', 'confirm-change-language-message', 'Do you really want to change language to \"<strong class=\"change_to_language_text\"></strong>\" ? This action will be override \"<strong class=\"change_to_language_text\"></strong>\" version if it\'s existed!', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2293, 1, 'en', 'plugins/language/language', 'confirm-change-language-btn', 'Confirm change', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2294, 1, 'en', 'plugins/language/language', 'hide_languages', 'Hide languages', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2295, 1, 'en', 'plugins/language/language', 'hide_languages_description', 'You can completely hide content in specific languages from visitors and search engines, but still view it yourself. This allows reviewing translations that are in progress.', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2296, 1, 'en', 'plugins/language/language', 'hide_languages_helper_display_hidden', '{0} All languages are currently displayed.|{1} :language is currently hidden to visitors.|[2, Inf] :language are currently hidden to visitors.', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2297, 1, 'en', 'plugins/language/language', 'show_all', 'Show all', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2298, 1, 'en', 'plugins/language/language', 'change_language', 'Language', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2299, 1, 'en', 'plugins/language/language', 'language_show_default_item_if_current_version_not_existed', 'Show item in default language if it is not existed in current language', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2300, 1, 'en', 'plugins/language/language', 'select_flag', 'Select a flag...', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2301, 1, 'en', 'plugins/language/language', 'delete_confirmation_message', 'Do you really want to delete this language? It also deletes all items in this language and cannot rollback!', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2302, 1, 'en', 'plugins/language/language', 'added_already', 'This language was added already!', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2303, 1, 'vi', 'plugins/language/language', 'name', 'Ng??n ng???', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2304, 1, 'vi', 'plugins/language/language', 'choose_language', 'Ch???n m???t ng??n ng???', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2305, 1, 'vi', 'plugins/language/language', 'select_language', 'Ch???n ng??n ng???', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2306, 1, 'vi', 'plugins/language/language', 'choose_language_helper', 'B???n c?? th??? ch???n 1 ng??n ng??? trong danh s??ch ho???c nh???p tr???c ti???p n???i dung xu???ng c??c m???c d?????i', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2307, 1, 'vi', 'plugins/language/language', 'language_name', 'T??n ?????y ?????', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2308, 1, 'vi', 'plugins/language/language', 'language_name_helper', 'T??n ng??n ng??? s??? ???????c hi???n th??? tr??n website (v?? d???: Ti???ng Anh).', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2309, 1, 'vi', 'plugins/language/language', 'locale', 'Locale', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2310, 1, 'vi', 'plugins/language/language', 'locale_helper', 'Laravel Locale cho ng??n ng??? n??y (v?? d???: <code>en</code>).', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2311, 1, 'vi', 'plugins/language/language', 'language_code', 'M?? ng??n ng???', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2312, 1, 'vi', 'plugins/language/language', 'language_code_helper', 'M?? ng??n ng??? - ??u ti??n d???ng 2-k?? t??? theo chu???n ISO 639-1 (v?? d???: en)', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2313, 1, 'vi', 'plugins/language/language', 'text_direction', 'H?????ng vi???t ch???', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2314, 1, 'vi', 'plugins/language/language', 'text_direction_helper', 'Ch???n h?????ng vi???t ch??? cho ng??n ng??? n??y', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2315, 1, 'vi', 'plugins/language/language', 'left_to_right', 'Tr??i qua ph???i', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2316, 1, 'vi', 'plugins/language/language', 'right_to_left', 'Ph???i qua tr??i', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2317, 1, 'vi', 'plugins/language/language', 'flag', 'C???', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2318, 1, 'vi', 'plugins/language/language', 'flag_helper', 'Ch???n 1 c??? cho ng??n ng??? n??y', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2319, 1, 'vi', 'plugins/language/language', 'order', 'S???p x???p', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2320, 1, 'vi', 'plugins/language/language', 'order_helper', 'V??? tr?? c???a ng??n ng??? hi???n th??? trong m???c chuy???n ?????i ng??n ng???', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2321, 1, 'vi', 'plugins/language/language', 'add_new_language', 'Th??m ng??n ng??? m???i', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2322, 1, 'vi', 'plugins/language/language', 'code', 'M??', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2323, 1, 'vi', 'plugins/language/language', 'default_language', 'Ng??n ng??? m???c ?????nh', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2324, 1, 'vi', 'plugins/language/language', 'actions', 'H??nh ?????ng', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2325, 1, 'vi', 'plugins/language/language', 'translations', 'D???ch', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2326, 1, 'vi', 'plugins/language/language', 'edit', 'S???a', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2327, 1, 'vi', 'plugins/language/language', 'edit_tooltip', 'S???a ng??n ng??? n??y', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2328, 1, 'vi', 'plugins/language/language', 'delete', 'X??a', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2329, 1, 'vi', 'plugins/language/language', 'delete_tooltip', 'X??a ng??n ng??? n??y v?? c??c d??? li???u li??n quan', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2330, 1, 'vi', 'plugins/language/language', 'choose_default_language', 'Ch???n :language l??m ng??n ng??? m???c ?????nh', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2331, 1, 'vi', 'plugins/language/language', 'add_language_for_item', 'Th??m ng??n ng??? kh??c cho b???n ghi n??y', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2332, 1, 'vi', 'plugins/language/language', 'current_language', 'Ng??n ng??? hi???n t???i c???a b???n ghi', '2021-03-14 19:40:47', '2021-03-14 19:40:47');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(2333, 1, 'vi', 'plugins/language/language', 'edit_related', 'S???a b???n ng??n ng??? kh??c c???a b???n ghi n??y', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2334, 1, 'vi', 'plugins/language/language', 'confirm-change-language', 'X??c nh???n thay ?????i ng??n ng???', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2335, 1, 'vi', 'plugins/language/language', 'confirm-change-language-btn', 'X??c nh???n thay ?????i', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2336, 1, 'vi', 'plugins/language/language', 'confirm-change-language-message', 'B???n c?? ch???c ch???n mu???n thay ?????i ng??n ng??? sang ti???ng \"<strong class=\"change_to_language_text\"></strong>\" ? ??i???u n??y s??? ghi ???? b???n ghi ti???ng \"<strong class=\"change_to_language_text\"></strong>\" n???u n?? ???? t???n t???i!', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2337, 1, 'vi', 'plugins/language/language', 'current_language_edit_notification', 'B???n ??ang ch???nh s???a phi??n b???n ti???ng \"<strong class=\"current_language_text\">:language</strong>\"', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2338, 1, 'vi', 'plugins/language/language', 'hide_languages', '???n ng??n ng???', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2339, 1, 'vi', 'plugins/language/language', 'hide_languages_description', 'B???n c?? th??? ho??n to??n ???n ng??n ng??? c??? th??? ?????i v???i ng?????i truy c???p v?? c??ng c??? t??m ki???m, nh??ng s??? v???n hi???n th??? trong trang qu???n tr???. ??i???u n??y cho ph??p b???n bi???t nh???ng ng??n ng??? n??o ??ang ???????c x??? l??.', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2340, 1, 'vi', 'plugins/language/language', 'hide_languages_helper_display_hidden', '{0} T???t c??? ng??n ng??? ??ang ???????c hi???n th???.|{1} :language ??ang b??? ???n ?????i v???i ng?????i truy c???p.|[2, Inf]  :language ??ang b??? ???n ?????i v???i ng?????i truy c???p.', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2341, 1, 'vi', 'plugins/language/language', 'language_display', 'Hi???n th??? ng??n ng???', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2342, 1, 'vi', 'plugins/language/language', 'language_display_all', 'Hi???n th??? c??? c??? v?? t??n ng??n ng???', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2343, 1, 'vi', 'plugins/language/language', 'language_display_flag_only', 'Ch??? hi???n th??? c???', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2344, 1, 'vi', 'plugins/language/language', 'language_display_name_only', 'Ch??? hi???n th??? t??n', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2345, 1, 'vi', 'plugins/language/language', 'language_hide_default', '???n ng??n ng??? m???c ?????nh tr??n URL', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2346, 1, 'vi', 'plugins/language/language', 'language_switcher_display_dropdown', 'Dropdown', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2347, 1, 'vi', 'plugins/language/language', 'language_switcher_display_list', 'Danh s??ch', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2348, 1, 'vi', 'plugins/language/language', 'settings', 'C??i ?????t', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2349, 1, 'vi', 'plugins/language/language', 'switcher_display', 'Hi???n th??? b??? chuy???n ?????i ng??n ng???', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2350, 1, 'vi', 'plugins/language/language', 'change_language', 'Ng??n ng???', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2351, 1, 'vi', 'plugins/language/language', 'show_all', 'Hi???n th??? t???t c???', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2352, 1, 'vi', 'plugins/language/language', 'language_show_default_item_if_current_version_not_existed', 'Hi???n th??? b???n ghi ??? ng??n ng??? m???c ?????nh n???u phi??n b???n cho ng??n ng??? hi???n t???i ch??a c??', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2353, 1, 'en', 'plugins/newsletter/newsletter', 'name', 'Newsletters', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2354, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.title', 'Newsletter', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2355, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.description', 'Config newsletter email templates', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2356, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_admin.title', 'Email send to admin', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2357, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_admin.description', 'Template for sending email to admin', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2358, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_user.title', 'Email send to user', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2359, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_user.description', 'Template for sending email to subscriber', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2360, 1, 'en', 'plugins/newsletter/newsletter', 'statuses.subscribed', 'Subscribed', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2361, 1, 'en', 'plugins/newsletter/newsletter', 'statuses.unsubscribed', 'Unsubscribed', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2362, 1, 'en', 'plugins/translation/translation', 'translations', 'Translations', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2363, 1, 'en', 'plugins/translation/translation', 'translations_description', 'Translate all words in system.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2364, 1, 'en', 'plugins/translation/translation', 'export_warning', 'Warning, translations are not visible until they are exported back to the resources/lang file, using \'php artisan cms:translations:export\' command or publish button.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2365, 1, 'en', 'plugins/translation/translation', 'import_done', 'Done importing, processed :counter items! Reload this page to refresh the groups!', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2366, 1, 'en', 'plugins/translation/translation', 'translation_manager', 'Translations Manager', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2367, 1, 'en', 'plugins/translation/translation', 'done_publishing', 'Done publishing the translations for group', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2368, 1, 'en', 'plugins/translation/translation', 'append_translation', 'Append new translations', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2369, 1, 'en', 'plugins/translation/translation', 'replace_translation', 'Replace existing translations', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2370, 1, 'en', 'plugins/translation/translation', 'import_group', 'Import group', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2371, 1, 'en', 'plugins/translation/translation', 'confirm_publish_group', 'Are you sure you want to publish the translations group \":group\"? This will overwrite existing language files.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2372, 1, 'en', 'plugins/translation/translation', 'publish_translations', 'Publish translations', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2373, 1, 'en', 'plugins/translation/translation', 'back', 'Back', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2374, 1, 'en', 'plugins/translation/translation', 'edit_title', 'Enter translation', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2375, 1, 'en', 'plugins/translation/translation', 'choose_group_msg', 'Choose a group to display the group translations. If no groups are visible, make sure you have imported the translations.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2376, 1, 'en', 'plugins/translation/translation', 'choose_a_group', 'Choose a group', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2377, 1, 'en', 'plugins/translation/translation', 'locales', 'Locales', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2378, 1, 'en', 'plugins/translation/translation', 'theme-translations', 'Theme translations', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2379, 1, 'en', 'plugins/translation/translation', 'admin-translations', 'Admin translations', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2380, 1, 'en', 'plugins/translation/translation', 'translate_from', 'Translate from', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2381, 1, 'en', 'plugins/translation/translation', 'to', 'to', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2382, 1, 'en', 'plugins/translation/translation', 'no_other_languages', 'No other language to translate!', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2383, 1, 'en', 'plugins/translation/translation', 'edit', 'Edit', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2384, 1, 'en', 'plugins/translation/translation', 'delete', 'Delete', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2385, 1, 'en', 'plugins/translation/translation', 'locale', 'Locale', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2386, 1, 'en', 'plugins/translation/translation', 'name', 'Name', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2387, 1, 'en', 'plugins/translation/translation', 'default_locale', 'Default locale?', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2388, 1, 'en', 'plugins/translation/translation', 'actions', 'Actions', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2389, 1, 'en', 'plugins/translation/translation', 'choose_language', 'Choose language', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2390, 1, 'en', 'plugins/translation/translation', 'add_new_language', 'Add new language', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2391, 1, 'en', 'plugins/translation/translation', 'select_language', 'Select language', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2392, 1, 'en', 'plugins/translation/translation', 'flag', 'Flag', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2393, 1, 'en', 'plugins/translation/translation', 'confirm_delete_message', 'Do you really want to delete this locale? It will delete all files/folders for this local in /resources/lang!', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2394, 1, 'vi', 'plugins/translation/translation', 'append_translation', 'Ti???p n???i b???n d???ch', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2395, 1, 'vi', 'plugins/translation/translation', 'back', 'Quay l???i', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2396, 1, 'vi', 'plugins/translation/translation', 'choose_a_group', 'Ch???n m???t nh??m', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2397, 1, 'vi', 'plugins/translation/translation', 'choose_group_msg', 'Ch???n m???t nh??m ????? hi???n th??? nh??m d???ch thu???t. N???u nh??m kh??ng c?? s???n, h??y ch???c ch???n l?? b???n ???? ch???y migrations v?? nh???p d??? li???u d???ch thu???t.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2398, 1, 'vi', 'plugins/translation/translation', 'confirm_publish_group', 'B???n c?? ch???c mu???n xu???t b???n nh??m \":group\"? ??i???u n??y s??? ghi ???? t???p tin ng??n ng??? hi???n t???i.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2399, 1, 'vi', 'plugins/translation/translation', 'done_publishing', 'Xu???t b???n nh??m d???ch thu???t th??nh c??ng', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2400, 1, 'vi', 'plugins/translation/translation', 'edit_title', 'Nh???p n???i dung d???ch', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2401, 1, 'vi', 'plugins/translation/translation', 'export_warning', 'C???nh b??o, b???n d???ch s??? kh??ng c?? s???n cho ?????n khi ch??ng ???????c xu???t b???n l???i v??o th?? m???c /resources/lang, s??? d???ng l???nh \'php artisan cms:translations:export\' ho???c s??? d???ng n??t xu???t b???n', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2402, 1, 'vi', 'plugins/translation/translation', 'import_done', 'Nh???p ho??n th??nh, ???? x??? l?? :counter b???n ghi!  ', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2403, 1, 'vi', 'plugins/translation/translation', 'import_group', 'Nh???p nh??m', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2404, 1, 'vi', 'plugins/translation/translation', 'publish_translations', 'Xu???t b???n d???ch thu???t', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2405, 1, 'vi', 'plugins/translation/translation', 'replace_translation', 'Thay th??? b???n d???ch hi???n t???i', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2406, 1, 'vi', 'plugins/translation/translation', 'translation_manager', 'Qu???n l?? d???ch thu???t', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2407, 1, 'vi', 'plugins/translation/translation', 'translations', 'D???ch thu???t', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2408, 1, 'vi', 'plugins/translation/translation', 'translations_description', 'D???ch t???t c??? c??c t??? trong h??? th???ng', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2409, 1, 'vi', 'plugins/translation/translation', 'actions', 'H??nh ?????ng', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2410, 1, 'vi', 'plugins/translation/translation', 'add_new_language', 'Th??m ng??n ng??? m???i', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2411, 1, 'vi', 'plugins/translation/translation', 'admin-translations', 'D???ch trang qu???n tr???', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2412, 1, 'vi', 'plugins/translation/translation', 'choose_language', 'Ch???n ng??n ng???', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2413, 1, 'vi', 'plugins/translation/translation', 'default_locale', 'Ng??n ng??? m???c ?????nh', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2414, 1, 'vi', 'plugins/translation/translation', 'delete', 'X??a', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2415, 1, 'vi', 'plugins/translation/translation', 'edit', 'S???a', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2416, 1, 'vi', 'plugins/translation/translation', 'flag', 'C???', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2417, 1, 'vi', 'plugins/translation/translation', 'locale', 'Ng??n ng???', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2418, 1, 'vi', 'plugins/translation/translation', 'locales', 'Ng??n ng???', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2419, 1, 'vi', 'plugins/translation/translation', 'name', 'T??n', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2420, 1, 'vi', 'plugins/translation/translation', 'no_other_languages', 'Kh??ng c??n ng??n ng??? n??o kh??c ????? d???ch!', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2421, 1, 'vi', 'plugins/translation/translation', 'select_language', 'L???a ch???n ng??n ng???', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2422, 1, 'vi', 'plugins/translation/translation', 'theme-translations', 'D???ch giao di???n', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2423, 1, 'vi', 'plugins/translation/translation', 'to', 'sang', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2424, 1, 'vi', 'plugins/translation/translation', 'translate_from', 'D???ch t???', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2425, 1, 'vi', 'auth', 'failed', 'Kh??ng t??m th???y th??ng tin ????ng nh???p h???p l???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2426, 1, 'vi', 'auth', 'throttle', '????ng nh???p kh??ng ????ng qu?? nhi???u l???n. Vui l??ng th??? l???i sau :seconds gi??y.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2427, 1, 'vi', 'auth', 'password', 'M???t kh???u kh??ng ch??nh x??c', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2428, 1, 'vi', 'pagination', 'previous', '&laquo; Tr?????c', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2429, 1, 'vi', 'pagination', 'next', 'Sau &raquo;', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2430, 1, 'vi', 'passwords', 'reset', 'M???t kh???u ???? ???????c c???p nh???t!', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2431, 1, 'vi', 'passwords', 'sent', 'Ch??ng t??i ???? g???i cho b???n ???????ng d???n thay ?????i m???t kh???u!', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2432, 1, 'vi', 'passwords', 'token', 'M?? x??c nh???n m???t kh???u kh??ng h???p l???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2433, 1, 'vi', 'passwords', 'user', 'Kh??ng t??m th???y th??nh vi??n v???i ?????a ch??? email n??y.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2434, 1, 'vi', 'validation', 'accepted', 'Tr?????ng :attribute ph???i ???????c ch???p nh???n.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2435, 1, 'vi', 'validation', 'active_url', 'Tr?????ng :attribute kh??ng ph???i l?? m???t URL h???p l???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2436, 1, 'vi', 'validation', 'after', 'Tr?????ng :attribute ph???i l?? m???t ng??y sau ng??y :date.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2437, 1, 'vi', 'validation', 'after_or_equal', 'Tr?????ng :attribute ph???i l?? m???t ng??y sau ho???c b???ng ng??y :date.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2438, 1, 'vi', 'validation', 'alpha', 'Tr?????ng :attribute ch??? c?? th??? ch???a c??c ch??? c??i.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2439, 1, 'vi', 'validation', 'alpha_dash', 'Tr?????ng :attribute ch??? c?? th??? ch???a ch??? c??i, s??? v?? d???u g???ch ngang.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2440, 1, 'vi', 'validation', 'alpha_num', 'Tr?????ng :attribute ch??? c?? th??? ch???a ch??? c??i v?? s???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2441, 1, 'vi', 'validation', 'array', 'Ki???u d??? li???u c???a tr?????ng :attribute ph???i l?? d???ng m???ng.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2442, 1, 'vi', 'validation', 'before', 'Tr?????ng :attribute ph???i l?? m???t ng??y tr?????c ng??y :date.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2443, 1, 'vi', 'validation', 'before_or_equal', 'Tr?????ng :attribute ph???i l?? m???t ng??y tr?????c ho???c b???ng ng??y :date.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2444, 1, 'vi', 'validation', 'between.numeric', 'Tr?????ng :attribute ph???i n???m trong kho???ng :min - :max.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2445, 1, 'vi', 'validation', 'between.file', 'Dung l?????ng t???p tin trong tr?????ng :attribute ph???i t??? :min - :max kB.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2446, 1, 'vi', 'validation', 'between.string', 'Tr?????ng :attribute ph???i t??? :min - :max k?? t???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2447, 1, 'vi', 'validation', 'between.array', 'Tr?????ng :attribute ph???i c?? t??? :min - :max ph???n t???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2448, 1, 'vi', 'validation', 'boolean', 'Tr?????ng :attribute ph???i l?? true ho???c false.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2449, 1, 'vi', 'validation', 'confirmed', 'Gi?? tr??? x??c nh???n trong tr?????ng :attribute kh??ng kh???p.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2450, 1, 'vi', 'validation', 'date', 'Tr?????ng :attribute kh??ng ph???i l?? ?????nh d???ng c???a ng??y-th??ng.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2451, 1, 'vi', 'validation', 'date_equals', 'Tr?????ng :attribute ph???i l?? m???t ng??y b???ng v???i :date.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2452, 1, 'vi', 'validation', 'date_format', 'Tr?????ng :attribute kh??ng gi???ng v???i ?????nh d???ng :format.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2453, 1, 'vi', 'validation', 'different', 'Tr?????ng :attribute v?? :other ph???i kh??c nhau.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2454, 1, 'vi', 'validation', 'digits', '????? d??i c???a tr?????ng :attribute ph???i g???m :digits ch??? s???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2455, 1, 'vi', 'validation', 'digits_between', '????? d??i c???a tr?????ng :attribute ph???i n???m trong kho???ng :min and :max ch??? s???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2456, 1, 'vi', 'validation', 'dimensions', 'The :attribute has invalid image dimensions.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2457, 1, 'vi', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2458, 1, 'vi', 'validation', 'email', 'Tr?????ng :attribute ph???i l?? m???t ?????a ch??? email h???p l???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2459, 1, 'vi', 'validation', 'ends_with', 'Tr?????ng :attribute ph???i k???t th??c b???ng m???t trong nh???ng gi?? tr??? sau: :values', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2460, 1, 'vi', 'validation', 'exists', 'Gi?? tr??? ???? ch???n trong tr?????ng :attribute kh??ng h???p l???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2461, 1, 'vi', 'validation', 'file', 'Tr?????ng :attribute ph???i l?? m???t t???p tin.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2462, 1, 'vi', 'validation', 'filled', 'Tr?????ng :attribute kh??ng ???????c b??? tr???ng.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2463, 1, 'vi', 'validation', 'gt.numeric', 'Tr?????ng :attribute ph???i l???n h??n :max.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2464, 1, 'vi', 'validation', 'gt.file', 'Dung l?????ng t???p tin trong tr?????ng :attribute ph???i l???n h??n :max KB.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2465, 1, 'vi', 'validation', 'gt.string', 'Tr?????ng :attribute ph???i l???n h??n :max k?? t???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2466, 1, 'vi', 'validation', 'gt.array', 'Tr?????ng :attribute ph???i l???n h??n :max ph???n t???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2467, 1, 'vi', 'validation', 'gte.numeric', 'Tr?????ng :attribute ph???i l???n h??n ho???c b???ng :max.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2468, 1, 'vi', 'validation', 'gte.file', 'Dung l?????ng t???p tin trong tr?????ng :attribute ph???i l???n h??n ho???c b???ng :max KB.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2469, 1, 'vi', 'validation', 'gte.string', 'Tr?????ng :attribute ph???i l???n h??n ho???c b???ng :max k?? t???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2470, 1, 'vi', 'validation', 'gte.array', 'Tr?????ng :attribute ph???i l???n h??n ho???c b???ng :max ph???n t???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2471, 1, 'vi', 'validation', 'image', 'C??c t???p tin trong tr?????ng :attribute ph???i l?? ?????nh d???ng h??nh ???nh.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2472, 1, 'vi', 'validation', 'in', 'Gi?? tr??? ???? ch???n trong tr?????ng :attribute kh??ng h???p l???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2473, 1, 'vi', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2474, 1, 'vi', 'validation', 'integer', 'Tr?????ng :attribute ph???i l?? m???t s??? nguy??n.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2475, 1, 'vi', 'validation', 'ip', 'Tr?????ng :attribute ph???i l?? m???t ?????a ch???a IP.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2476, 1, 'vi', 'validation', 'ipv4', 'Tr?????ng :attribute ph???i l?? ?????a ch??? IPv4 h???p l???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2477, 1, 'vi', 'validation', 'ipv6', 'Tr?????ng :attribute ph???i l?? ?????a ch??? IPv6 h???p l???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2478, 1, 'vi', 'validation', 'json', 'Tr?????ng :attribute ph???i l?? chu???i JSON h???p l???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2479, 1, 'vi', 'validation', 'lt.numeric', 'Tr?????ng :attribute ph???i nh??? h??n l?? :min.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2480, 1, 'vi', 'validation', 'lt.file', 'Dung l?????ng t???p tin trong tr?????ng :attribute ph???i nh??? h??n :min KB.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2481, 1, 'vi', 'validation', 'lt.string', 'Tr?????ng :attribute ph???i c?? nh??? h??n :min k?? t???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2482, 1, 'vi', 'validation', 'lt.array', 'Tr?????ng :attribute ph???i c?? nh??? h??n :min ph???n t???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2483, 1, 'vi', 'validation', 'lte.numeric', 'Tr?????ng :attribute ph???i nh??? h??n ho???c b???ng l?? :min.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2484, 1, 'vi', 'validation', 'lte.file', 'Dung l?????ng t???p tin trong tr?????ng :attribute ph???i nh??? h??n ho???c b???ng :min KB.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2485, 1, 'vi', 'validation', 'lte.string', 'Tr?????ng :attribute ph???i c?? nh??? h??n ho???c b???ng :min k?? t???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2486, 1, 'vi', 'validation', 'lte.array', 'Tr?????ng :attribute ph???i c?? nh??? h??n ho???c b???ng :min ph???n t???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2487, 1, 'vi', 'validation', 'max.numeric', 'Tr?????ng :attribute kh??ng ???????c l???n h??n :max.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2488, 1, 'vi', 'validation', 'max.file', 'Dung l?????ng t???p tin trong tr?????ng :attribute kh??ng ???????c l???n h??n :max KB.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2489, 1, 'vi', 'validation', 'max.string', 'Tr?????ng :attribute kh??ng ???????c l???n h??n :max k?? t???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2490, 1, 'vi', 'validation', 'max.array', 'Tr?????ng :attribute kh??ng ???????c l???n h??n :max ph???n t???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2491, 1, 'vi', 'validation', 'mimes', 'Tr?????ng :attribute ph???i l?? m???t t???p tin c?? ?????nh d???ng: :values.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2492, 1, 'vi', 'validation', 'mimetypes', 'Tr?????ng :attribute ph???i l?? m???t t???p c?? ?????nh d???ng l??: :values.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2493, 1, 'vi', 'validation', 'min.numeric', 'Tr?????ng :attribute ph???i t???i thi???u l?? :min.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2494, 1, 'vi', 'validation', 'min.file', 'Dung l?????ng t???p tin trong tr?????ng :attribute ph???i t???i thi???u :min KB.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2495, 1, 'vi', 'validation', 'min.string', 'Tr?????ng :attribute ph???i c?? t???i thi???u :min k?? t???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2496, 1, 'vi', 'validation', 'min.array', 'Tr?????ng :attribute ph???i c?? t???i thi???u :min ph???n t???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2497, 1, 'vi', 'validation', 'not_in', 'Gi?? tr??? ???? ch???n trong tr?????ng :attribute kh??ng h???p l???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2498, 1, 'vi', 'validation', 'not_regex', 'Tr?????ng :attribute ?????nh d???ng kh??ng h???p l???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2499, 1, 'vi', 'validation', 'numeric', 'Tr?????ng :attribute ph???i l?? m???t s???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2500, 1, 'vi', 'validation', 'password', 'M???t kh???u kh??ng ????ng.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2501, 1, 'vi', 'validation', 'present', 'The :attribute field must be present.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2502, 1, 'vi', 'validation', 'regex', '?????nh d???ng tr?????ng :attribute kh??ng h???p l???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2503, 1, 'vi', 'validation', 'required', 'Tr?????ng :attribute kh??ng ???????c b??? tr???ng.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2504, 1, 'vi', 'validation', 'required_if', 'Tr?????ng :attribute kh??ng ???????c b??? tr???ng khi tr?????ng :other l?? :value.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2505, 1, 'vi', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2506, 1, 'vi', 'validation', 'required_with', 'Tr?????ng :attribute kh??ng ???????c b??? tr???ng khi tr?????ng :values c?? gi?? tr???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2507, 1, 'vi', 'validation', 'required_with_all', 'The :attribute field is required when :values is present.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2508, 1, 'vi', 'validation', 'required_without', 'Tr?????ng :attribute kh??ng ???????c b??? tr???ng khi tr?????ng :values kh??ng c?? gi?? tr???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2509, 1, 'vi', 'validation', 'required_without_all', 'Tr?????ng :attribute kh??ng ???????c b??? tr???ng khi t???t c??? :values kh??ng c?? gi?? tr???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2510, 1, 'vi', 'validation', 'same', 'Tr?????ng :attribute v?? :other ph???i gi???ng nhau.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2511, 1, 'vi', 'validation', 'size.numeric', 'Tr?????ng :attribute ph???i b???ng :size.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2512, 1, 'vi', 'validation', 'size.file', 'Dung l?????ng t???p tin trong tr?????ng :attribute ph???i b???ng :size kB.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2513, 1, 'vi', 'validation', 'size.string', 'Tr?????ng :attribute ph???i ch???a :size k?? t???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2514, 1, 'vi', 'validation', 'size.array', 'Tr?????ng :attribute ph???i ch???a :size ph???n t???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2515, 1, 'vi', 'validation', 'starts_with', 'Tr?????ng :attribute ph???i ???????c b???t ?????u b???ng m???t trong nh???ng gi?? tr??? sau: :values', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2516, 1, 'vi', 'validation', 'string', 'Tr?????ng :attribute ph???i l?? m???t chu???i.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2517, 1, 'vi', 'validation', 'timezone', 'Tr?????ng :attribute ph???i l?? m???t m??i gi??? h???p l???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2518, 1, 'vi', 'validation', 'unique', 'Tr?????ng :attribute ???? c?? trong h??? th???ng.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2519, 1, 'vi', 'validation', 'uploaded', 'Tr?????ng :attribute kh??ng th??? t???i l??n.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2520, 1, 'vi', 'validation', 'url', 'Tr?????ng :attribute kh??ng gi???ng v???i ?????nh d???ng m???t URL.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2521, 1, 'vi', 'validation', 'uuid', 'Tr?????ng :attribute kh??ng ph???i l?? m???t chu???i UUID h???p l???.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2522, 1, 'vi', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2523, 1, 'vi', 'validation', 'attributes.name', 't??n', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2524, 1, 'vi', 'validation', 'attributes.username', 't??n ????ng nh???p', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2525, 1, 'vi', 'validation', 'attributes.email', 'email', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2526, 1, 'vi', 'validation', 'attributes.first_name', 't??n', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2527, 1, 'vi', 'validation', 'attributes.last_name', 'h???', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2528, 1, 'vi', 'validation', 'attributes.password', 'm???t kh???u', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2529, 1, 'vi', 'validation', 'attributes.password_confirmation', 'x??c nh???n m???t kh???u', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2530, 1, 'vi', 'validation', 'attributes.city', 'th??nh ph???', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2531, 1, 'vi', 'validation', 'attributes.country', 'qu???c gia', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2532, 1, 'vi', 'validation', 'attributes.address', '?????a ch???', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2533, 1, 'vi', 'validation', 'attributes.phone', 's??? ??i???n tho???i', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2534, 1, 'vi', 'validation', 'attributes.mobile', 'di ?????ng', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2535, 1, 'vi', 'validation', 'attributes.age', 'tu???i', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2536, 1, 'vi', 'validation', 'attributes.sex', 'gi???i t??nh', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2537, 1, 'vi', 'validation', 'attributes.gender', 'gi???i t??nh', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2538, 1, 'vi', 'validation', 'attributes.year', 'n??m', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2539, 1, 'vi', 'validation', 'attributes.month', 'th??ng', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2540, 1, 'vi', 'validation', 'attributes.day', 'ng??y', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2541, 1, 'vi', 'validation', 'attributes.hour', 'gi???', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2542, 1, 'vi', 'validation', 'attributes.minute', 'ph??t', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2543, 1, 'vi', 'validation', 'attributes.second', 'gi??y', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2544, 1, 'vi', 'validation', 'attributes.title', 'ti??u ?????', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2545, 1, 'vi', 'validation', 'attributes.content', 'n???i dung', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2546, 1, 'vi', 'validation', 'attributes.body', 'n???i dung', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2547, 1, 'vi', 'validation', 'attributes.description', 'm?? t???', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2548, 1, 'vi', 'validation', 'attributes.excerpt', 'tr??ch d???n', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2549, 1, 'vi', 'validation', 'attributes.date', 'ng??y', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2550, 1, 'vi', 'validation', 'attributes.time', 'th???i gian', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2551, 1, 'vi', 'validation', 'attributes.subject', 'ti??u ?????', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2552, 1, 'vi', 'validation', 'attributes.message', 'l???i nh???n', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2553, 1, 'vi', 'validation', 'attributes.available', 'c?? s???n', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2554, 1, 'vi', 'validation', 'attributes.size', 'k??ch th?????c', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2555, 1, 'vi', '_json', '-- select --', '-- l???a ch???n --', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2556, 1, 'vi', '_json', '404 - Not found', '404 - Kh??ng t??m th???y trang y??u c???u', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2557, 1, 'vi', '_json', 'About banner', 'About banner', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2558, 1, 'vi', '_json', 'About me', 'V??? t??i', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2559, 1, 'vi', '_json', 'Action button URL', 'Action button URL', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2560, 1, 'vi', '_json', 'Action button text', 'Action button text', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2561, 1, 'vi', '_json', 'Add a custom menu to your widget area.', 'Add a custom menu to your widget area.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2562, 1, 'vi', '_json', 'Add blog posts big', 'Add blog posts big', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2563, 1, 'vi', '_json', 'Add blog posts list', 'Add blog posts list', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2564, 1, 'vi', '_json', 'Add featured categories', 'Add featured categories', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2565, 1, 'vi', '_json', 'Add featured posts', 'Add featured posts', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2566, 1, 'vi', '_json', 'Add youtube video', 'Add youtube video', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2567, 1, 'vi', '_json', 'Addition Information', 'Addition Information', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2568, 1, 'vi', '_json', 'Address', '?????a ch???', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2569, 1, 'vi', '_json', 'Advertise banner', 'Advertise banner', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2570, 1, 'vi', '_json', 'An Error Occurred: Internal Server Error', 'An Error Occurred: Internal Server Error', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2571, 1, 'vi', '_json', 'Author', 'Author', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2572, 1, 'vi', '_json', 'Blog big', 'Blog big', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2573, 1, 'vi', '_json', 'Blog categories posts', 'Blog categories posts', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2574, 1, 'vi', '_json', 'Blog list', 'Blog list', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2575, 1, 'vi', '_json', 'Blog sidebar', 'Blog sidebar', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2576, 1, 'vi', '_json', 'Bottom Sidebar Ads', 'Bottom Sidebar Ads', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2577, 1, 'vi', '_json', 'By', 'By', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2578, 1, 'vi', '_json', 'Categories', 'Categories', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2579, 1, 'vi', '_json', 'Categories with Posts', 'Categories with Posts', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2580, 1, 'vi', '_json', 'Category', 'Category', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2581, 1, 'vi', '_json', 'Change copyright', 'Change copyright', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2582, 1, 'vi', '_json', 'Color', 'Color', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2583, 1, 'vi', '_json', 'Copyright', 'Copyright', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2584, 1, 'vi', '_json', 'Copyright on footer of site', 'Copyright on footer of site', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2585, 1, 'vi', '_json', 'Custom Menu', 'Custom Menu', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2586, 1, 'vi', '_json', 'Custom map', 'Custom map', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2587, 1, 'vi', '_json', 'Danger color', 'Danger color', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2588, 1, 'vi', '_json', 'Designed by', 'Designed by', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2589, 1, 'vi', '_json', 'Don\'t miss', 'Don\'t miss', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2590, 1, 'vi', '_json', 'Email', 'Email', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2591, 1, 'vi', '_json', 'Enable Facebook chat?', 'Enable Facebook chat?', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2592, 1, 'vi', '_json', 'Enable Facebook comment in post detail page?', 'Enable Facebook comment in post detail page?', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2593, 1, 'vi', '_json', 'Enable Preloader?', 'Enable Preloader?', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2594, 1, 'vi', '_json', 'Enter your email', 'Enter your email', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2595, 1, 'vi', '_json', 'Envato username must not a URL. Please try with username \":username\"!', 'Envato username must not a URL. Please try with username \":username\"!', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2596, 1, 'vi', '_json', 'Facebook page ID', 'Facebook page ID', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2597, 1, 'vi', '_json', 'Featured categories', 'Featured categories', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2598, 1, 'vi', '_json', 'Featured posts', 'Featured posts', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2599, 1, 'vi', '_json', 'Featured posts slider', 'Featured posts slider', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2600, 1, 'vi', '_json', 'Featured posts slider full', 'Featured posts slider full', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2601, 1, 'vi', '_json', 'Follow me', 'Theo d??i t??i', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2602, 1, 'vi', '_json', 'Footer sidebar', 'Footer sidebar', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2603, 1, 'vi', '_json', 'Full width', 'Full width', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2604, 1, 'vi', '_json', 'Galleries', 'Galleries', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2605, 1, 'vi', '_json', 'Google map', 'Google map', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2606, 1, 'vi', '_json', 'Header', 'Header', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2607, 1, 'vi', '_json', 'Header config', 'Header config', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2608, 1, 'vi', '_json', 'Home', 'Home', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2609, 1, 'vi', '_json', 'Homepage', 'Homepage', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2610, 1, 'vi', '_json', 'Hot tags', 'Hot tags', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2611, 1, 'vi', '_json', 'Hot topics', 'Hot topics', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2612, 1, 'vi', '_json', 'Icon', 'Icon', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2613, 1, 'vi', '_json', 'Image', 'Image', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2614, 1, 'vi', '_json', 'Introduction about the author of this blog', 'Introduction about the author of this blog', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2615, 1, 'vi', '_json', 'Latest posts', 'B??i vi???t m???i nh???t', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2616, 1, 'vi', '_json', 'Maintenance mode', 'Ch??? ????? b???o tr??', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2617, 1, 'vi', '_json', 'Message', 'N???i dung', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2618, 1, 'vi', '_json', 'Name', 'T??n', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2619, 1, 'vi', '_json', 'Not found', 'Not found', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2620, 1, 'vi', '_json', 'Number gallery to display', 'Number gallery to display', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2621, 1, 'vi', '_json', 'Number posts to display', 'Number posts to display', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2622, 1, 'vi', '_json', 'Number tags to display', 'Number tags to display', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2623, 1, 'vi', '_json', 'Oops! An Error Occurred', 'Oops! An Error Occurred', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2624, 1, 'vi', '_json', 'Panel Ads', 'Panel Ads', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2625, 1, 'vi', '_json', 'Phone', '??i???n tho???i', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2626, 1, 'vi', '_json', 'Popular tags', 'Popular tags', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2627, 1, 'vi', '_json', 'Primary color', 'Primary color', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2628, 1, 'vi', '_json', 'Primary font', 'Primary font', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2629, 1, 'vi', '_json', 'Related posts', 'Related posts', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2630, 1, 'vi', '_json', 'Right sidebar', 'Right sidebar', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2631, 1, 'vi', '_json', 'Search', 'T??m ki???m', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2632, 1, 'vi', '_json', 'Search result for:', 'Search result for:', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2633, 1, 'vi', '_json', 'Search stories, places and people', 'T??m c??u chuy???n, ?????a ??i???m v?? con ng?????i', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2634, 1, 'vi', '_json', 'Secondary color', 'Secondary color', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2635, 1, 'vi', '_json', 'Select a category', 'Select a category', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2636, 1, 'vi', '_json', 'Select menu', 'Select menu', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2637, 1, 'vi', '_json', 'Send', 'G???i', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2638, 1, 'vi', '_json', 'Send message successfully!', 'G???i tin nh???n th??nh c??ng', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2639, 1, 'vi', '_json', 'Share on Facebook', 'Share on Facebook', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2640, 1, 'vi', '_json', 'Share on Linkedin', 'Share on Linkedin', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2641, 1, 'vi', '_json', 'Share this', 'Share this', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2642, 1, 'vi', '_json', 'Sidebar in blog page', 'Sidebar in blog page', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2643, 1, 'vi', '_json', 'Sidebar in the footer of page', 'Sidebar in the footer of page', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2644, 1, 'vi', '_json', 'Social', 'Social', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2645, 1, 'vi', '_json', 'Social links', 'Social links', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2646, 1, 'vi', '_json', 'Something is broken. Please let us know what you were doing when this error occurred. We will fix it as soon as possible. Sorry for any inconvenience caused.', 'Something is broken. Please let us know what you were doing when this error occurred. We will fix it as soon as possible. Sorry for any inconvenience caused.', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2647, 1, 'vi', '_json', 'Sorry, we are doing some maintenance. Please check back soon.', 'Sorry, we are doing some maintenance. Please check back soon.', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2648, 1, 'vi', '_json', 'Subject', 'Subject', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2649, 1, 'vi', '_json', 'Submit', 'Submit', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2650, 1, 'vi', '_json', 'Subscribe', 'Subscribe', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2651, 1, 'vi', '_json', 'Subscribe to newsletter successfully!', 'Subscribe to newsletter successfully!', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2652, 1, 'vi', '_json', 'Subscribe to our newsletter and get our newest updates right on your inbox.', '????ng k?? b???n tin c???a ch??ng t??i v?? nh???n c??c c???p nh???t m???i nh???t c???a ch??ng t??i ngay trong h???p th?? ?????n c???a b???n.', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2653, 1, 'vi', '_json', 'Tags', 'Tags', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2654, 1, 'vi', '_json', 'The field with (<span style=\"color:#FF0000;\">*</span>) is required.', 'The field with (<span style=\"color:#FF0000;\">*</span>) is required.', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2655, 1, 'vi', '_json', 'The link you clicked may be broken or the page may have been removed.', 'The link you clicked may be broken or the page may have been removed.', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2656, 1, 'vi', '_json', 'The server returned a \"403 Forbidden\".', 'The server returned a \"403 Forbidden\".', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2657, 1, 'vi', '_json', 'The server returned a \"500 Internal Server Error\".', 'The server returned a \"500 Internal Server Error\".', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2658, 1, 'vi', '_json', 'There is no data to display!', 'There is no data to display!', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2659, 1, 'vi', '_json', 'Top Sidebar Ads', 'Top Sidebar Ads', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2660, 1, 'vi', '_json', 'Tweet now', 'Tweet now', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2661, 1, 'vi', '_json', 'URL', 'URL', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2662, 1, 'vi', '_json', 'Uncategorized', 'Uncategorized', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2663, 1, 'vi', '_json', 'Unsubscribe to newsletter successfully', 'Unsubscribe to newsletter successfully', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2664, 1, 'vi', '_json', 'Widget to display galleries', 'Widget to display galleries', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2665, 1, 'vi', '_json', 'Widget to display newsletter form', 'Widget to display newsletter form', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2666, 1, 'vi', '_json', 'Widget to display popular posts', 'Widget to display popular posts', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2667, 1, 'vi', '_json', 'You might be interested in', 'You might be interested in', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2668, 1, 'vi', '_json', 'Your email', 'Your email', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2669, 1, 'vi', '_json', 'Your email does not exist in the system or you have unsubscribed already!', 'Your email does not exist in the system or you have unsubscribed already!', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2670, 1, 'vi', '_json', 'Your name', 'Your name', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2671, 1, 'vi', '_json', 'Youtube URL is invalid.', 'Youtube URL is invalid.', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2672, 1, 'vi', '_json', 'Youtube video', 'Youtube video', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2673, 1, 'vi', '_json', 'here', 'here', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2674, 1, 'vi', '_json', 'mins read', 'mins read', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2675, 1, 'vi', '_json', 'views', 'views', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2676, 1, 'vi', '_json', 'visit the', 'visit the', '2021-03-14 19:40:49', '2021-03-14 19:40:49');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` int(10) UNSIGNED DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT 0,
  `manage_supers` tinyint(1) NOT NULL DEFAULT 0,
  `permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `first_name`, `last_name`, `username`, `avatar_id`, `super_user`, `manage_supers`, `permissions`, `last_login`) VALUES
(1, 'admin@campcodes.com', NULL, '$2b$10$Q8cCvubfsa.3k.7JtifzweM4jAi5gfBg6I/32URsLqUArEODLdqTK', 'sQRIUtDszfu8Ga2prb3ZuUSlxmOc6uFPb4uFI7lWAPHlkFdf5TfspkbDLqNo', '2021-03-14 19:40:35', '2021-06-05 07:25:15', 'Steven', 'Madden', 'botble', 1, 1, 1, NULL, '2021-06-05 07:25:15');

-- --------------------------------------------------------

--
-- Table structure for table `user_meta`
--

CREATE TABLE `user_meta` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `widget_id`, `sidebar_id`, `theme`, `position`, `data`, `created_at`, `updated_at`) VALUES
(1, 'CustomMenuWidget', 'footer_sidebar', 'stories', 0, '{\"id\":\"CustomMenuWidget\",\"name\":\"Quick links\",\"menu_id\":\"quick-links\"}', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(2, 'TagsWidget', 'footer_sidebar', 'stories', 1, '{\"id\":\"TagsWidget\",\"name\":\"Tags\",\"number_display\":5}', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(3, 'NewsletterWidget', 'footer_sidebar', 'stories', 2, '{\"id\":\"NewsletterWidget\",\"name\":\"Newsletter\"}', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(4, 'AboutWidget', 'primary_sidebar', 'stories', 0, '{\"id\":\"AboutWidget\",\"name\":\"Hello, I\'m Steven\",\"description\":\"Hi, I\\u2019m Steven, a Florida native, who left my career in corporate wealth management six years ago to embark on a summer of soul searching that would change the course of my life forever.\",\"image\":\"general\\/author.jpg\"}', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(5, 'PopularPostsWidget', 'primary_sidebar', 'stories', 1, '{\"id\":\"PopularPostsWidget\",\"name\":\"Most popular\",\"number_display\":5}', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(6, 'GalleriesWidget', 'primary_sidebar', 'stories', 2, '{\"id\":\"GalleriesWidget\",\"name\":\"Galleries\",\"number_display\":6}', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(7, 'CustomMenuWidget', 'footer_sidebar', 'stories-vi', 0, '{\"id\":\"CustomMenuWidget\",\"name\":\"Li\\u00ean k\\u1ebft nhanh\",\"menu_id\":\"lien-ket\"}', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(8, 'TagsWidget', 'footer_sidebar', 'stories-vi', 1, '{\"id\":\"TagsWidget\",\"name\":\"Tags\",\"number_display\":5}', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(9, 'NewsletterWidget', 'footer_sidebar', 'stories-vi', 2, '{\"id\":\"NewsletterWidget\",\"name\":\"\\u0110\\u0103ng k\\u00fd b\\u1ea3n tin\"}', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(10, 'AboutWidget', 'primary_sidebar', 'stories-vi', 0, '{\"id\":\"AboutWidget\",\"name\":\"Xin ch\\u00e0o, t\\u00f4i l\\u00e0 Steven\",\"description\":\"Xin ch\\u00e0o, t\\u00f4i l\\u00e0 Steven, ng\\u01b0\\u1eddi g\\u1ed1c Florida, ng\\u01b0\\u1eddi \\u0111\\u00e3 r\\u1eddi b\\u1ecf s\\u1ef1 nghi\\u1ec7p qu\\u1ea3n l\\u00fd t\\u00e0i s\\u1ea3n doanh nghi\\u1ec7p c\\u00e1ch \\u0111\\u00e2y 6 n\\u0103m \\u0111\\u1ec3 b\\u1eaft \\u0111\\u1ea7u m\\u1ed9t m\\u00f9a h\\u00e8 t\\u00ecm ki\\u1ebfm t\\u00e2m h\\u1ed3n s\\u1ebd thay \\u0111\\u1ed5i cu\\u1ed9c \\u0111\\u1eddi t\\u00f4i m\\u00e3i m\\u00e3i.\",\"image\":\"general\\/author.jpg\"}', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(11, 'PopularPostsWidget', 'primary_sidebar', 'stories-vi', 1, '{\"id\":\"PopularPostsWidget\",\"name\":\"B\\u00e0i vi\\u1ebft n\\u1ed5i b\\u1eadt\",\"number_display\":5}', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(12, 'GalleriesWidget', 'primary_sidebar', 'stories-vi', 2, '{\"id\":\"GalleriesWidget\",\"name\":\"Th\\u01b0 vi\\u1ec7n \\u1ea3nh\",\"number_display\":6}', '2021-03-14 19:40:35', '2021-03-14 19:40:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activations`
--
ALTER TABLE `activations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activations_user_id_index` (`user_id`);

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ads_key_unique` (`key`);

--
-- Indexes for table `audit_histories`
--
ALTER TABLE `audit_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audit_histories_user_id_index` (`user_id`),
  ADD KEY `audit_histories_module_index` (`module`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_replies`
--
ALTER TABLE `contact_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dashboard_widget_settings`
--
ALTER TABLE `dashboard_widget_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  ADD KEY `dashboard_widget_settings_widget_id_index` (`widget_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `galleries_user_id_index` (`user_id`);

--
-- Indexes for table `gallery_meta`
--
ALTER TABLE `gallery_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gallery_meta_reference_id_index` (`reference_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`lang_id`);

--
-- Indexes for table `language_meta`
--
ALTER TABLE `language_meta`
  ADD PRIMARY KEY (`lang_meta_id`),
  ADD KEY `language_meta_reference_id_index` (`reference_id`);

--
-- Indexes for table `media_files`
--
ALTER TABLE `media_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_files_user_id_index` (`user_id`);

--
-- Indexes for table `media_folders`
--
ALTER TABLE `media_folders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_folders_user_id_index` (`user_id`);

--
-- Indexes for table `media_settings`
--
ALTER TABLE `media_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_slug_unique` (`slug`);

--
-- Indexes for table `menu_locations`
--
ALTER TABLE `menu_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_nodes`
--
ALTER TABLE `menu_nodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_nodes_menu_id_index` (`menu_id`),
  ADD KEY `menu_nodes_parent_id_index` (`parent_id`);

--
-- Indexes for table `meta_boxes`
--
ALTER TABLE `meta_boxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meta_boxes_reference_id_index` (`reference_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`),
  ADD KEY `roles_created_by_index` (`created_by`),
  ADD KEY `roles_updated_by_index` (`updated_by`);

--
-- Indexes for table `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_users_user_id_index` (`user_id`),
  ADD KEY `role_users_role_id_index` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `slugs`
--
ALTER TABLE `slugs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `user_meta`
--
ALTER TABLE `user_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_meta_user_id_index` (`user_id`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activations`
--
ALTER TABLE `activations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `audit_histories`
--
ALTER TABLE `audit_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `contact_replies`
--
ALTER TABLE `contact_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `dashboard_widget_settings`
--
ALTER TABLE `dashboard_widget_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `gallery_meta`
--
ALTER TABLE `gallery_meta`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `lang_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `language_meta`
--
ALTER TABLE `language_meta`
  MODIFY `lang_meta_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `media_files`
--
ALTER TABLE `media_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `media_folders`
--
ALTER TABLE `media_folders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `media_settings`
--
ALTER TABLE `media_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `menu_locations`
--
ALTER TABLE `menu_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu_nodes`
--
ALTER TABLE `menu_nodes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `meta_boxes`
--
ALTER TABLE `meta_boxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role_users`
--
ALTER TABLE `role_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `slugs`
--
ALTER TABLE `slugs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2677;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_meta`
--
ALTER TABLE `user_meta`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
