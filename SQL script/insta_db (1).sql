-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2025 at 08:31 PM
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
-- Database: `insta_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `commentername` varchar(25) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `comment_text` varchar(100) NOT NULL,
  `time_stamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`commentername`, `comment_id`, `post_id`, `comment_text`, `time_stamp`) VALUES
('Tanjid', 1, 8, 'nicee\r\n', '2025-05-03 16:50:34'),
('Tajin Mahbub', 2, 7, 'London City\r\n', '2025-05-03 17:56:40'),
('Tajin Mahbub', 3, 9, 'Nice and attractive', '2025-05-03 17:58:39');

-- --------------------------------------------------------

--
-- Table structure for table `followings`
--

CREATE TABLE `followings` (
  `username` varchar(25) NOT NULL,
  `following` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `followings`
--

INSERT INTO `followings` (`username`, `following`) VALUES
('Ayrin', 'Tanjid'),
('prerana', 'Tanjid'),
('prerana', 'Tayeb'),
('Shohanur Rahman', 'Ayrin '),
('Shohanur Rahman', 'prerana'),
('Shohanur Rahman', 'Sanjida'),
('Shohanur Rahman', 'Tajin Mahbub'),
('Shohanur Rahman', 'Tanjid'),
('Shohanur Rahman', 'Tayeb'),
('Tajin Mahbub', 'Ayrin '),
('Tajin Mahbub', 'prerana'),
('Tajin Mahbub', 'Sanjida'),
('Tajin Mahbub', 'Shohanur Rahman'),
('Tajin Mahbub', 'Tanjid'),
('Tajin Mahbub', 'Tayeb'),
('Tanjid', 'Ayrin '),
('Tanjid', 'Tayeb'),
('Tayeb', 'Ayrin '),
('Tayeb', 'prerana'),
('Tayeb', 'Sanjida'),
('Tayeb', 'Shohanur Rahman'),
('Tayeb', 'Tajin Mahbub'),
('Tayeb', 'Tanjid');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `post_id` int(11) NOT NULL,
  `likername` varchar(25) NOT NULL,
  `time_stamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`post_id`, `likername`, `time_stamp`) VALUES
(2, 'Tanjid', '2025-05-03 14:47:35'),
(7, 'Tajin Mahbub', '2025-05-03 17:56:10'),
(9, 'Tajin Mahbub', '2025-05-03 17:58:21'),
(12, 'Tayeb', '2025-05-07 10:31:04'),
(9, 'Tayeb', '2025-05-07 10:31:10'),
(14, 'Tayeb', '2025-05-07 10:31:16'),
(10, 'Tayeb', '2025-05-07 10:31:25'),
(13, 'Tayeb', '2025-05-07 10:31:37');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `username` varchar(25) DEFAULT NULL,
  `photo` blob NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `likes` int(11) DEFAULT 0,
  `comments` int(11) DEFAULT 0,
  `time_stamp` datetime DEFAULT current_timestamp(),
  `media_type` varchar(10) DEFAULT 'image'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `username`, `photo`, `description`, `likes`, `comments`, `time_stamp`, `media_type`) VALUES
(1, 'Tanjid', 0x70686f746f732f766964656f2e7765626d, '', 0, 0, '2025-05-03 14:16:10', 'image'),
(2, 'Tayeb', 0x6d656469612f36383136316534663138366432342e38333935373739352e7765626d, '', 1, 0, '2025-05-03 14:46:55', 'video'),
(3, 'Tayeb', 0x6d656469612f36383136316563353634376337322e35343430343337382e7765626d, '', 0, 0, '2025-05-03 14:48:53', 'video'),
(4, 'Tayeb', 0x6d656469612f36383136316632393164396131302e35383332323833382e7765626d, '', 0, 0, '2025-05-03 14:50:33', 'video'),
(5, 'Tayeb', 0x6d656469612f36383136316636336335623733382e34393932333935372e7765626d, '', 0, 0, '2025-05-03 14:51:31', 'video'),
(6, 'Tanjid', 0x6d656469612f36383136323063393661326639312e33343839373634332e6a7067, '', 0, 0, '2025-05-03 14:57:29', 'image'),
(7, 'Tanjid', 0x6d656469612f36383136333633396338346137392e31313830383035342e7765626d, '', 1, 1, '2025-05-03 16:28:57', 'video'),
(8, 'Tayeb', 0x6d656469612f36383136333763353963653733332e32333237333737372e7765626d, '', 0, 1, '2025-05-03 16:35:33', 'video'),
(9, 'Ayrin', 0x6d656469612f36383136333833653530353934352e34333939383435302e6a7067, '', 2, 1, '2025-05-03 16:37:34', 'image'),
(10, 'Tajin Mahbub', 0x6d656469612f36383136346139323462346462392e36363438343936322e6a7067, '', 1, 0, '2025-05-03 17:55:46', 'image'),
(11, 'Tayeb', 0x6d656469612f36383136346262653439326231322e30343630373134372e6a7067, '', 0, 0, '2025-05-03 18:00:46', 'image'),
(12, 'Shohanur Rahman', 0x6d656469612f36383136346632343738623064392e39353035313132372e6a7067, '', 1, 0, '2025-05-03 18:15:16', 'image'),
(13, 'Tanjid', 0x6d656469612f36383162323233636461363561362e31383636363637362e7765626d, '', 1, 0, '2025-05-07 10:05:00', 'video'),
(14, 'prerana', 0x6d656469612f36383162323831646335363739362e35333733303432352e6a706567, '', 1, 0, '2025-05-07 10:30:05', 'image');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `profile_name` varchar(25) NOT NULL,
  `profile_picture` blob DEFAULT NULL,
  `followings` int(11) DEFAULT 0,
  `followers` int(11) DEFAULT 0,
  `posts` int(11) DEFAULT 0,
  `email` varchar(50) NOT NULL,
  `bio` varchar(1000) DEFAULT NULL,
  `time_stamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `profile_name`, `profile_picture`, `followings`, `followers`, `posts`, `email`, `bio`, `time_stamp`) VALUES
('Ayrin ', '113601', 'Ayrin Montasir', 0x70686f746f732f61792e6a7067, 1, 4, 1, 'ayrinmontasir@gmail.com', '', '2025-05-03 16:37:16'),
('prerana', '113601', 'Prerana Das', 0x70686f746f732f706572612e6a7067, 2, 3, 1, 'perana32@gmail.com', '', '2025-05-03 17:53:13'),
('Sanjida', '113601', 'Hur E Jannat', 0x70686f746f732f, 0, 3, 0, 'jannatsanjida4@gmail.com', '', '2025-05-03 17:52:09'),
('Shohanur Rahman', '113601', 'Shohanur Rahman', 0x70686f746f732f736f68616e2e6a7067, 6, 2, 1, 'shohan12@gmail.com', '', '2025-05-03 17:54:34'),
('Tajin Mahbub', '113601', 'Tajin Mahbub Emon', 0x70686f746f732f656d6f6e2e6a7067, 6, 2, 1, 'masumtanjid39@gmail.com', '', '2025-05-03 17:51:21'),
('Tanjid', '113601', 'Tanjid Masum', 0x70686f746f732f, 2, 5, 4, 'masumtanjid39@gmail.com', '', '2025-05-03 14:15:02'),
('Tayeb', '113601', 'Tayeb Mahmud', 0x70686f746f732f74617965622e6a7067, 6, 4, 6, 'tayeb@gmail.com', '', '2025-05-03 14:14:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `followings`
--
ALTER TABLE `followings`
  ADD PRIMARY KEY (`username`,`following`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`) ON DELETE CASCADE;

--
-- Constraints for table `followings`
--
ALTER TABLE `followings`
  ADD CONSTRAINT `followings_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
