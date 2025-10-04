-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Окт 04 2025 г., 12:55
-- Версия сервера: 8.0.34-26-beget-1-1
-- Версия PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `stacknro_blog`
--

-- --------------------------------------------------------

--
-- Структура таблицы `api_rate_limits`
--
-- Создание: Окт 02 2025 г., 19:26
--

DROP TABLE IF EXISTS `api_rate_limits`;
CREATE TABLE `api_rate_limits` (
  `id` int NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `endpoint` varchar(100) NOT NULL,
  `request_count` int DEFAULT '1',
  `window_start` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `chat_messages`
--
-- Создание: Окт 02 2025 г., 10:36
-- Последнее обновление: Окт 04 2025 г., 06:40
--

DROP TABLE IF EXISTS `chat_messages`;
CREATE TABLE `chat_messages` (
  `id` int NOT NULL,
  `sender_id` int NOT NULL,
  `receiver_id` int NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `chat_messages`
--

INSERT INTO `chat_messages` (`id`, `sender_id`, `receiver_id`, `message`, `is_read`, `created_at`) VALUES
(1, 3, 2, 'salom', 1, '2025-10-02 16:30:18'),
(2, 3, 4, 'salom', 1, '2025-10-02 16:45:49'),
(3, 4, 3, 'Alikkk', 1, '2025-10-02 16:46:10'),
(4, 4, 3, 'salom', 1, '2025-10-02 17:01:08'),
(5, 2, 3, 'sa', 0, '2025-10-02 17:23:39'),
(6, 2, 3, 'salom', 0, '2025-10-02 17:23:41'),
(7, 2, 4, 'salom', 0, '2025-10-02 17:23:45'),
(8, 2, 3, 'salom', 0, '2025-10-02 17:23:52'),
(9, 2, 4, 'qandaysan', 0, '2025-10-04 02:12:30'),
(10, 2, 4, 'a', 0, '2025-10-04 02:12:33'),
(11, 2, 6, 'a', 0, '2025-10-04 02:12:38'),
(12, 2, 5, 'a', 0, '2025-10-04 02:12:43'),
(13, 2, 3, 'a', 0, '2025-10-04 02:12:50'),
(14, 2, 3, 'g', 0, '2025-10-04 06:40:05'),
(15, 2, 3, 'g', 0, '2025-10-04 06:40:07');

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--
-- Создание: Окт 02 2025 г., 10:36
-- Последнее обновление: Окт 04 2025 г., 06:39
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int NOT NULL,
  `post_id` int NOT NULL,
  `user_id` int NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `content`, `created_at`) VALUES
(1, 7, 2, 'qandayeeeeeee', '2025-10-02 15:00:06'),
(2, 10, 4, 'Salom', '2025-10-02 16:44:42'),
(3, 7, 2, 's', '2025-10-02 17:24:38'),
(4, 7, 2, 's', '2025-10-02 17:24:40'),
(5, 7, 2, 's', '2025-10-02 17:24:41'),
(6, 10, 2, 's', '2025-10-02 17:25:39'),
(7, 7, 2, 's', '2025-10-02 19:43:38'),
(8, 7, 2, 's', '2025-10-03 13:48:18'),
(9, 7, 2, 's', '2025-10-03 13:49:53'),
(10, 7, 2, 'f', '2025-10-03 13:49:55'),
(11, 7, 2, 'sfsf', '2025-10-03 13:49:57'),
(12, 7, 5, 'df', '2025-10-03 13:53:03'),
(13, 7, 6, 'vdds', '2025-10-03 13:56:58'),
(14, 7, 6, 'barcha testlar amalga oshirildi !', '2025-10-03 13:59:24'),
(15, 7, 2, 'g', '2025-10-04 01:54:06'),
(16, 10, 2, 'q', '2025-10-04 02:09:00'),
(17, 7, 2, 's', '2025-10-04 06:39:24');

-- --------------------------------------------------------

--
-- Структура таблицы `contact_messages`
--
-- Создание: Окт 02 2025 г., 10:36
-- Последнее обновление: Окт 04 2025 г., 06:41
--

DROP TABLE IF EXISTS `contact_messages`;
CREATE TABLE `contact_messages` (
  `id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('new','read','replied') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `message`, `status`, `created_at`) VALUES
(1, 'ligarx', 'ligarx0@gmail.com', 'sss', 'new', '2025-10-03 13:46:35'),
(2, 'ism', 'alikvv269@gmail.com', 'sdsd', 'new', '2025-10-03 13:58:43'),
(3, 'saf', 'fgsfsnjn@gmail.com', 'dsdg', 'new', '2025-10-04 06:41:08');

-- --------------------------------------------------------

--
-- Структура таблицы `email_verifications`
--
-- Создание: Окт 02 2025 г., 10:36
-- Последнее обновление: Окт 03 2025 г., 13:56
--

DROP TABLE IF EXISTS `email_verifications`;
CREATE TABLE `email_verifications` (
  `id` int NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verification_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_type` enum('registration','password_reset') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'registration',
  `expires_at` timestamp NOT NULL,
  `is_used` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `email_verifications`
--

INSERT INTO `email_verifications` (`id`, `email`, `verification_code`, `code_type`, `expires_at`, `is_used`, `created_at`) VALUES
(6, 'vvor80054@gmail.com', '375333', 'registration', '2025-10-03 13:57:16', 1, '2025-10-03 13:52:16'),
(7, 'alikvv269@gmail.com', '999648', 'registration', '2025-10-03 14:01:10', 1, '2025-10-03 13:56:10');

-- --------------------------------------------------------

--
-- Структура таблицы `likes`
--
-- Создание: Окт 02 2025 г., 10:36
-- Последнее обновление: Окт 04 2025 г., 02:08
--

DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `post_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `post_id`, `created_at`) VALUES
(7, 4, 10, '2025-10-02 16:44:38'),
(13, 5, 7, '2025-10-03 13:52:58'),
(14, 5, 10, '2025-10-03 13:53:00'),
(16, 6, 10, '2025-10-03 13:56:50'),
(21, 2, 7, '2025-10-04 02:08:56'),
(22, 2, 10, '2025-10-04 02:08:58');

-- --------------------------------------------------------

--
-- Структура таблицы `login_attempts`
--
-- Создание: Окт 02 2025 г., 19:22
-- Последнее обновление: Окт 04 2025 г., 07:02
--

DROP TABLE IF EXISTS `login_attempts`;
CREATE TABLE `login_attempts` (
  `id` int NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `success` tinyint(1) DEFAULT '0',
  `user_agent` text,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `identifier`, `success`, `user_agent`, `ip_address`, `created_at`) VALUES
(3, 'yakidza05@gmail.com', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '213.230.86.187', '2025-10-03 13:47:51'),
(4, 'yakidza05@gmail.com', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '213.230.86.187', '2025-10-03 13:47:58'),
(5, 'yakidza05@gmail.com', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '213.230.86.187', '2025-10-03 13:49:45'),
(6, 'vvor80054@gmail.com', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '213.230.86.187', '2025-10-03 13:52:50'),
(7, 'alikvv269@gmail.com', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:143.0) Gecko/20100101 Firefox/143.0', '213.230.86.187', '2025-10-03 13:56:45'),
(8, 'yakidza05@gmail.com', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '198.163.195.35', '2025-10-04 01:46:20'),
(9, 'yakidza05@gmail.com', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '213.230.92.63', '2025-10-04 06:41:51'),
(10, 'yakidza05@gmail.com', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '213.230.92.63', '2025-10-04 06:42:01'),
(11, 'yakidza05@gmail.com', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '213.230.92.63', '2025-10-04 06:53:57'),
(12, 'yakidza05@gmail.com', 0, 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1', '213.230.92.63', '2025-10-04 06:56:50'),
(13, 'yakidza05@gmail.com', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '213.230.92.63', '2025-10-04 07:01:41'),
(14, 'yakidza05@gmail.com', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '213.230.92.63', '2025-10-04 07:02:59');

-- --------------------------------------------------------

--
-- Структура таблицы `newsletter_subscribers`
--
-- Создание: Окт 02 2025 г., 10:36
-- Последнее обновление: Окт 04 2025 г., 07:03
--

DROP TABLE IF EXISTS `newsletter_subscribers`;
CREATE TABLE `newsletter_subscribers` (
  `id` int NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','unsubscribed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `newsletter_subscribers`
--

INSERT INTO `newsletter_subscribers` (`id`, `email`, `status`, `created_at`) VALUES
(1, 'yakidza05@gmail.com', 'active', '2025-10-02 14:56:41'),
(2, 'uhdfdb@gmail.com', 'active', '2025-10-02 17:21:43'),
(3, 'feaswd@gmail.com', 'active', '2025-10-02 19:44:00'),
(4, 'gyusdgbu@gmail.com', 'active', '2025-10-03 13:47:22'),
(5, 'syuygb@gmail.com', 'active', '2025-10-03 13:48:37'),
(6, 'sdsd@gmail.com', 'active', '2025-10-03 13:49:00'),
(7, 'hfghifhg@gmail.com', 'active', '2025-10-03 13:50:28'),
(8, 'fhdigfhfidhb@gmail.com', 'active', '2025-10-03 13:53:23'),
(9, 'dbdvbbj@gmail.com', 'active', '2025-10-03 13:57:32'),
(10, 'alikvv269@gmail.com', 'active', '2025-10-03 13:59:03'),
(11, 'sdbfsbdb@gmail.com', 'active', '2025-10-04 06:40:41'),
(12, 'sdfhvfi@gmail.com', 'active', '2025-10-04 06:41:33'),
(13, 'asdcbb@gmail.com', 'active', '2025-10-04 07:03:20');

-- --------------------------------------------------------

--
-- Структура таблицы `password_history`
--
-- Создание: Окт 02 2025 г., 19:26
--

DROP TABLE IF EXISTS `password_history`;
CREATE TABLE `password_history` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--
-- Создание: Окт 02 2025 г., 10:36
-- Последнее обновление: Окт 04 2025 г., 01:46
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hashtags` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` int NOT NULL,
  `status` enum('draft','published','archived') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `views` int DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `content`, `image`, `hashtags`, `author_id`, `status`, `views`, `created_at`) VALUES
(7, 'hammaga salom', 'hammaga-salom', '<h2>ES6+ da qanday yangiliklar bor?</h2><p>JavaScript ES6 va undan keyingi versiyalar ko\'plab yangi xususiyatlar bilan keldi.</p><h3>Arrow Functions</h3><pre><code>// Eski usul\r\nfunction add(a, b) {\r\n  return a + b;\r\n}\r\n\r\n// Yangi usul\r\nconst add = (a, b) => a + b;</code></pre><h3>Destructuring</h3><pre><code>// Array destructuring\r\nconst [first, second] = [1, 2, 3];\r\n\r\n// Object destructuring\r\nconst { name, age } = { name: \'Ali\', age: 25 };</code></pre><h3>Template Literals</h3><pre><code>const name = \'Ali\';\r\nconst greeting = `Salom, ${name}!`;</code></pre>', 'post_68de77d7c716e8.48701266.jpg', 'hammagasalom', 1, 'published', 12, '2025-10-02 13:02:15'),
(10, 'hammaga salom1', 'hammaga-salom1', '<h2>ES6+ da qanday yangiliklar bor?</h2><p>JavaScript ES6 va undan keyingi versiyalar ko\'plab yangi xususiyatlar bilan keldi.</p><h3>Arrow Functions</h3><pre><code>// Eski usul\r\nfunction add(a, b) {\r\n  return a + b;\r\n}\r\n\r\n// Yangi usul\r\nconst add = (a, b) => a + b;</code></pre><h3>Destructuring</h3><pre><code>// Array destructuring\r\nconst [first, second] = [1, 2, 3];\r\n\r\n// Object destructuring\r\nconst { name, age } = { name: \'Ali\', age: 25 };</code></pre><h3>Template Literals</h3><pre><code>const name = \'Ali\';\r\nconst greeting = `Salom, ${name}!`;</code></pre>', 'post_68de7c3fd60f44.12498866.jpg', 'hammagasalom', 1, 'published', 0, '2025-10-02 13:21:03');

-- --------------------------------------------------------

--
-- Структура таблицы `security_logs`
--
-- Создание: Окт 02 2025 г., 19:22
--

DROP TABLE IF EXISTS `security_logs`;
CREATE TABLE `security_logs` (
  `id` int NOT NULL,
  `event_type` varchar(50) NOT NULL,
  `severity` enum('low','medium','high','critical') DEFAULT 'medium',
  `user_id` int DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text,
  `details` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `session_security`
--
-- Создание: Окт 02 2025 г., 19:22
-- Последнее обновление: Окт 04 2025 г., 07:02
--

DROP TABLE IF EXISTS `session_security`;
CREATE TABLE `session_security` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `session_token` varchar(255) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text,
  `location` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `last_activity` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `session_security`
--

INSERT INTO `session_security` (`id`, `user_id`, `session_token`, `ip_address`, `user_agent`, `location`, `is_active`, `created_at`) VALUES
(1, 2, '88843c57f55933ab89f0635a30e92a6cb8c127ffef21891ecbe7aa9abd8129cdf2976cdc14e6c3ea942b390ee67d403b17142709caaf2478e4912de650205109', '213.230.92.63', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', NULL, 1, '2025-10-02 19:37:52'),
(2, 2, '60818539875699f2181b84bd06af7575229459bdce5c483b05b407b3c11580501392883217da2af2a4d78a2c2f64d0c87989738ee2f2d55388a7282168173b5e', '213.230.86.187', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', NULL, 1, '2025-10-03 13:47:58'),
(3, 2, '94785868f117162c87c4a77199248d53c86c8f51e31222132e15be45a56b89df3ff468fd7f0e90a0823aa27c565baab99b13af0b3418d1014036e4786d22c864', '213.230.86.187', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', NULL, 1, '2025-10-03 13:49:45'),
(4, 5, 'dca82169e965081254029e469766c5f1435c7cb885ab19a47e4dac4506f00a529aaef8b7c620e47570747e78c23c8e6c99864764abd4205cec32830be8ac990f', '213.230.86.187', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', NULL, 1, '2025-10-03 13:52:50'),
(5, 6, '895f04db955cd5c257d20808682415776474c5dccf734fc7a47d396cca73a7a16675c28047aa216a8f64fb8468f7c0c22741c0655152c6b055841cfbcaa94c73', '213.230.86.187', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:143.0) Gecko/20100101 Firefox/143.0', NULL, 1, '2025-10-03 13:56:45'),
(6, 2, 'a163616b132219f8f7a3ca1f8df8b619eef1e0467e8ede262d782503b00e5cab5f5693b47122d7ec96ec91a5fa25635e2ba017ef8cf945eb31bbff83fe321268', '198.163.195.35', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', NULL, 1, '2025-10-04 01:46:20'),
(7, 2, 'bf28ef17695babf0fc04d441cde0e1aed16413e279cfd4b08b3d0d7984633409012be1218a7b96b77d8cca8e6ca1e4a90ae23e17f40a6a971d827656906fafcb', '213.230.92.63', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', NULL, 1, '2025-10-04 06:42:01'),
(8, 2, '89dbf61c6d5e657c651473f28323efa20cc22d9944ae9c9198013c9fcc90b0c555e4790df9f8d50968c99599862ad8e0aee11c19380af9414d16567ede30fcac', '213.230.92.63', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', NULL, 1, '2025-10-04 06:53:57'),
(9, 2, '0e2e48dcbdcd07d71b353e2aba2c2776022e745775a6d2ce977dbce03231545085768147819f0533949c9e543e19936565535233d621111d05c169bbbaf5c642', '213.230.92.63', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', NULL, 1, '2025-10-04 07:01:41'),
(10, 2, '4a4c07b5259b21c2725bcf5b401a209d6bb781004cf6817cf07a7fb92cc54ebb25982cf6f99017b08b099c38d95a38f880f7790e6f0eec4e4149dd313f735c95', '213.230.92.63', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', NULL, 1, '2025-10-04 07:02:59');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--
-- Создание: Окт 04 2025 г., 02:08
-- Последнее обновление: Окт 04 2025 г., 07:02
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'default-avatar.png',
  `is_admin` tinyint(1) DEFAULT '0',
  `is_verified` tinyint(1) DEFAULT '0',
  `bio` text COLLATE utf8mb4_unicode_ci,
  `location` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `gender` enum('male','female','other') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive','banned') COLLATE utf8mb4_unicode_ci DEFAULT 'active',
  `last_login` timestamp NULL DEFAULT NULL,
  `email_notifications` tinyint(1) DEFAULT '1',
  `profile_visibility` enum('public','private','friends') COLLATE utf8mb4_unicode_ci DEFAULT 'public',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL,
  `is_online` tinyint(1) DEFAULT '0',
  `failed_login_attempts` int DEFAULT '0',
  `account_locked_until` datetime DEFAULT NULL,
  `password_changed_at` datetime DEFAULT NULL,
  `two_factor_enabled` tinyint(1) DEFAULT '0',
  `two_factor_secret` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_banned` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `avatar`, `is_admin`, `is_verified`, `bio`, `location`, `website`, `phone`, `birth_date`, `gender`, `status`, `last_login`, `email_notifications`, `profile_visibility`, `created_at`, `remember_token`, `last_seen`, `is_online`, `failed_login_attempts`, `account_locked_until`, `password_changed_at`, `two_factor_enabled`, `two_factor_secret`, `is_banned`) VALUES
(1, 'admin', 'admin@blog.com', '$2y$10$gSRZeOROQmi8O6qaa8PKvuSMQeu.Q7qaKDeWRL2tIFgYsWOyrbXAa', 'default-avatar.png', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'active', NULL, 1, 'public', '2025-10-02 10:36:22', NULL, NULL, 0, 0, NULL, NULL, 0, NULL, 0),
(2, 'ligarx1', 'yakidza05@gmail.com', '$2y$10$Mur.hTC3ra3cUnp6eDpLoOfHoRdZO7juA/YlHL4DmmNQimc2w9cYa', 'avatars/avatar_2_1759560153.jpg', 0, 1, 'hi', 'fg', 'fg', NULL, NULL, NULL, 'active', '2025-10-04 07:02:59', 1, 'public', '2025-10-02 10:49:33', 'ef7aa73d9f5203a0e3b242676b8283be5a99f2b237cec602132f6a03c68b289b12fc555557a1fb53706c1078eb97aeba3bcd35da34614d59c8a1182bcc3df6c9', '2025-10-03 10:45:22', 0, 0, NULL, NULL, 0, NULL, 0),
(3, 'ligarx2', 'ligarx61@gmail.com', '$2y$10$9QJFeGze6DVaxW7/jhy5OO4YZvL/paZrPl2s/gO8jENdUYb67iPo.', 'default-avatar.png', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'active', NULL, 1, 'public', '2025-10-02 16:29:01', NULL, NULL, 0, 0, NULL, NULL, 0, NULL, 0),
(4, 'ligarx3', 'dilshodbekd627@gmail.com', '$2y$10$s2ebGz8S9cy4epPrPoUjbOVN7hKq6MfO3XPX61He8AanQHrV9WOOK', 'default-avatar.png', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'active', NULL, 1, 'public', '2025-10-02 16:41:31', NULL, NULL, 0, 0, NULL, NULL, 0, NULL, 0),
(5, 'vvor', 'vvor80054@gmail.com', '$2y$10$fKzHVCe1RqxznAQ0q1WoTeq87BP25akh57qCyaV7FjVZ5OF121NlG', 'avatars/avatar_5_1759499623.png', 0, 1, 'trt', 'r', 'rt', NULL, NULL, NULL, 'active', '2025-10-03 13:52:50', 1, 'public', '2025-10-03 13:52:27', '153c3eea0a2f28d708874796a3f34c5cbb1e11479779fda1ae448d6308dd50cda5cf579b6192176b36e82420d74e38c6ce69e06cadf6c9a1193039ae67aa3719', NULL, 0, 0, NULL, NULL, 0, NULL, 0),
(6, 'alikv', 'alikvv269@gmail.com', '$2y$10$7cjT0DcP7d3mddvHttOf7uFdWix9hcQD1vgM5VUkSe.qocAbYVyCK', 'avatars/avatar_6_1759499876.png', 0, 1, 's', 's', 's', NULL, NULL, NULL, 'active', '2025-10-03 13:56:45', 1, 'public', '2025-10-03 13:56:23', '92e05935d16a352c519cdb77d569a43d6d53a4ded379ccea6c0fe4f19442818f76c301e51b9f43a9211d24de902c4152603ca50a4231ab09357d4f23ca2107ec', NULL, 0, 0, NULL, NULL, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `user_sessions`
--
-- Создание: Окт 02 2025 г., 10:36
-- Последнее обновление: Окт 04 2025 г., 07:05
--

DROP TABLE IF EXISTS `user_sessions`;
CREATE TABLE `user_sessions` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `session_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user_sessions`
--

INSERT INTO `user_sessions` (`id`, `user_id`, `session_token`, `expires_at`, `created_at`) VALUES
(3, 3, '508838eff2b0e5719b285b7155a1ef2fe7226cab8681a2477b613b23d5ce1607', '2025-11-01 18:05:17', '2025-10-02 16:29:48'),
(4, 4, '6fb07aad13f00ce1e0c26b0a738970d7735c9c6f86bf6be3b5032d91176506a8', '2025-11-01 18:05:17', '2025-10-02 16:43:36'),
(5, 4, '9b0e6e90d875cc94860ff1ea1849dfe2a1bfdf76852f47c266d8e39abc927a4b', '2025-11-01 18:05:17', '2025-10-02 16:44:22'),
(10, 5, 'dca82169e965081254029e469766c5f1435c7cb885ab19a47e4dac4506f00a529aaef8b7c620e47570747e78c23c8e6c99864764abd4205cec32830be8ac990f', '2025-11-02 13:53:52', '2025-10-03 13:52:50'),
(11, 6, '895f04db955cd5c257d20808682415776474c5dccf734fc7a47d396cca73a7a16675c28047aa216a8f64fb8468f7c0c22741c0655152c6b055841cfbcaa94c73', '2025-11-02 13:59:07', '2025-10-03 13:56:45'),
(14, 2, '89dbf61c6d5e657c651473f28323efa20cc22d9944ae9c9198013c9fcc90b0c555e4790df9f8d50968c99599862ad8e0aee11c19380af9414d16567ede30fcac', '2025-11-03 06:53:57', '2025-10-04 06:53:57'),
(15, 2, '0e2e48dcbdcd07d71b353e2aba2c2776022e745775a6d2ce977dbce03231545085768147819f0533949c9e543e19936565535233d621111d05c169bbbaf5c642', '2025-11-03 07:01:41', '2025-10-04 07:01:41'),
(16, 2, '4a4c07b5259b21c2725bcf5b401a209d6bb781004cf6817cf07a7fb92cc54ebb25982cf6f99017b08b099c38d95a38f880f7790e6f0eec4e4149dd313f735c95', '2025-11-03 07:05:26', '2025-10-04 07:02:59');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `api_rate_limits`
--
ALTER TABLE `api_rate_limits`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_limit` (`identifier`,`endpoint`,`window_start`),
  ADD KEY `idx_identifier` (`identifier`),
  ADD KEY `idx_endpoint` (`endpoint`),
  ADD KEY `idx_window_start` (`window_start`);

--
-- Индексы таблицы `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_sender` (`sender_id`),
  ADD KEY `idx_receiver` (`receiver_id`),
  ADD KEY `idx_conversation` (`sender_id`,`receiver_id`),
  ADD KEY `idx_created` (`created_at`),
  ADD KEY `idx_chat_unread` (`receiver_id`,`is_read`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_post` (`post_id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_created` (`created_at`);

--
-- Индексы таблицы `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_created` (`created_at`);

--
-- Индексы таблицы `email_verifications`
--
ALTER TABLE `email_verifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_email_code` (`email`,`verification_code`),
  ADD KEY `idx_expires` (`expires_at`);

--
-- Индексы таблицы `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_like` (`user_id`,`post_id`),
  ADD KEY `idx_post` (`post_id`),
  ADD KEY `idx_user` (`user_id`);

--
-- Индексы таблицы `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_identifier` (`identifier`),
  ADD KEY `idx_created_at` (`created_at`),
  ADD KEY `idx_success` (`success`);

--
-- Индексы таблицы `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_status` (`status`);

--
-- Индексы таблицы `password_history`
--
ALTER TABLE `password_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `idx_author` (`author_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_slug` (`slug`),
  ADD KEY `idx_created` (`created_at`),
  ADD KEY `idx_posts_hashtags` (`hashtags`(100));
ALTER TABLE `posts` ADD FULLTEXT KEY `idx_search` (`title`,`content`,`hashtags`);

--
-- Индексы таблицы `security_logs`
--
ALTER TABLE `security_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_event_type` (`event_type`),
  ADD KEY `idx_severity` (`severity`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Индексы таблицы `session_security`
--
ALTER TABLE `session_security`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_session_token` (`session_token`),
  ADD KEY `idx_is_active` (`is_active`),
  ADD KEY `idx_last_activity` (`last_activity`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_username` (`username`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_created` (`created_at`),
  ADD KEY `idx_remember_token` (`remember_token`),
  ADD KEY `idx_last_seen` (`last_seen`),
  ADD KEY `idx_is_online` (`is_online`),
  ADD KEY `idx_failed_attempts` (`failed_login_attempts`),
  ADD KEY `idx_locked_until` (`account_locked_until`),
  ADD KEY `idx_two_factor` (`two_factor_enabled`);

--
-- Индексы таблицы `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `session_token` (`session_token`),
  ADD KEY `idx_token` (`session_token`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_expires` (`expires_at`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `api_rate_limits`
--
ALTER TABLE `api_rate_limits`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `email_verifications`
--
ALTER TABLE `email_verifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `password_history`
--
ALTER TABLE `password_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `security_logs`
--
ALTER TABLE `security_logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `session_security`
--
ALTER TABLE `session_security`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `user_sessions`
--
ALTER TABLE `user_sessions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD CONSTRAINT `fk_messages_receiver` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_messages_sender` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comments_post` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_comments_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `fk_likes_post` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_likes_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `password_history`
--
ALTER TABLE `password_history`
  ADD CONSTRAINT `password_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `fk_posts_author` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `security_logs`
--
ALTER TABLE `security_logs`
  ADD CONSTRAINT `security_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ограничения внешнего ключа таблицы `session_security`
--
ALTER TABLE `session_security`
  ADD CONSTRAINT `session_security_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD CONSTRAINT `fk_sessions_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
