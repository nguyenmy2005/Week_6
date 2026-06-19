-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 19, 2026 at 07:25 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `week5`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`id`, `name`, `email`) VALUES
(1, 'Minh Tuan Nguyen', 'minhtuan@gmail.com'),
(2, 'Bao Chau Le', 'baochau@gmail.com'),
(3, 'Thanh Truc Vo', 'thanhtruc@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Dark Humor'),
(2, 'Dad Jokes'),
(3, 'Puns');

-- --------------------------------------------------------

--
-- Table structure for table `joke`
--

CREATE TABLE `joke` (
  `id` int(11) NOT NULL,
  `joketext` text NOT NULL,
  `jokedate` date NOT NULL,
  `image` varchar(255) DEFAULT '',
  `jokeimage` varchar(255) DEFAULT '',
  `authorid` int(11) DEFAULT NULL,
  `categoryid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `joke`
--

INSERT INTO `joke` (`id`, `joketext`, `jokedate`, `image`, `jokeimage`, `authorid`, `categoryid`) VALUES
(4, 'Why dont eggs tell jokes? Theyd crack each other up!', '2026-06-12', '', 'image1.jpg', 2, 2),
(5, 'What do you call cheese that isnt yours? Nacho cheese!', '2026-06-12', '', 'image2.jpg', 3, 3),
(6, 'Why did the math book look sad? It had too many problems!', '2026-06-12', '', 'image3.jpg', 1, 1),
(7, 'I told my wife she was drawing her eyebrows too high. She looked surprised!', '2026-06-12', '', 'image4.jpg', 2, 2),
(8, 'What do you call a fake noodle? An impasta!', '2026-06-12', '', 'image5.jpg', 3, 3),
(9, 'Im reading a book about anti-gravity. Its impossible to put down!', '2026-06-19', '', 'image6.jpg', 1, NULL),
(10, 'Why did the bicycle fall over? It was two-tired!', '2026-06-19', '', 'image7.jpg', 2, NULL),
(11, 'I used to hate facial hair but then it grew on me!', '2026-06-19', '', 'image8.jpg', 3, NULL),
(12, 'hihi', '2026-06-19', '', '6a34c621cf714.jpg', NULL, NULL),
(13, 'helo', '2026-06-19', '', '6a34cd1cf171a.jpg', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `joke`
--
ALTER TABLE `joke`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_author` (`authorid`),
  ADD KEY `fk_category` (`categoryid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `joke`
--
ALTER TABLE `joke`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `joke`
--
ALTER TABLE `joke`
  ADD CONSTRAINT `fk_author` FOREIGN KEY (`authorid`) REFERENCES `author` (`id`),
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`categoryid`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
