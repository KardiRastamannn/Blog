-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 02, 2025 at 08:13 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int NOT NULL,
  `user_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `publish_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `user_id`, `title`, `content`, `created_at`, `update_at`, `publish_at`) VALUES
(1, 1, 'Some article', 'A very interesting article...', '2025-04-02 08:38:41', '2025-04-02 08:38:41', '2025-04-02 08:38:41'),
(2, 6, 'Another interesting article', 'Lorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum', '2025-04-02 08:45:00', '2025-04-02 08:45:00', '2025-04-02 08:45:00'),
(4, 1, 'teszttt', 'wetwetewzwet', '2025-04-02 09:38:02', '2025-04-02 09:38:02', '2025-04-04 09:37:00'),
(6, 1, 'teszttt', 'wetwetewzwet', '2025-04-02 09:38:52', '2025-04-02 09:38:52', '2025-04-04 09:37:00'),
(7, 1, 'teszttt', 'wetwetewzwettaaa', '2025-04-02 09:45:28', '2025-04-02 09:45:28', '2025-04-04 09:37:00'),
(8, 1, 'new', 'asdasd', '2025-04-02 09:51:40', '2025-04-02 09:51:40', '2025-04-19 09:51:00'),
(9, 1, 'asdasdsadsadas', 'asdasdasdasdasd', '2025-04-02 10:03:32', '2025-04-02 10:03:32', '2025-04-26 10:03:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `email` varchar(253) NOT NULL,
  `password` varchar(72) NOT NULL,
  `is_active` tinyint DEFAULT '1',
  `role` enum('admin','user') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `is_active`, `role`) VALUES
(1, 'adrian@test.hu', 'asdasd1!', 1, 'admin'),
(5, 'qweqewqeqweqwe@qwewe.hu', '$2y$10$w1Gx3BdcG8qhKIcKLePD4ep1vqSGTSP8/tXqBAhUBVIWqoKpQVS6m', 1, 'admin'),
(6, 'qweqewqeqweqwe@qwewe.huasdasdas', '$2y$10$3Qm3CTIFzrDBFKI40WEU9OBy0Ut756ip/5Q8A2MvHs5.xUPJm2..q', 1, 'admin'),
(7, 'qweqewqeqweqwe@teszt.hu', 'asdasd', 1, 'user'),
(8, 'qweqewqeqweqwe@qwewe.huasdasdaseeeee', '$2y$10$dgb7IRiE3.T/e4XJTXjmheMHD4es12ZlopzufiG/jNIEqHa/RnxO6', 1, 'admin'),
(9, 'newestteszt@teszt.hu', '$2y$10$vAoIVmZxh3UNOvtYMbOhIe7Ueq4lPKeR2B.e8OcAP7vZFLKSYB6je', 1, 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
