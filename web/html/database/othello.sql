-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Dec 24, 2020 at 01:22 PM
-- Server version: 5.7.32
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `othello`
--

-- --------------------------------------------------------

--
-- Table structure for table `othello`
--

CREATE TABLE `othello` (
  `othello_id` int(11) NOT NULL,
  `othello_array` blob NOT NULL,
  `player` int(11) NOT NULL,
  `pattern` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `othello`
--

INSERT INTO `othello` (`othello_id`, `othello_array`, `player`, `pattern`, `user_id`) VALUES
(1, 0x613a33363a7b693a303b733a323a222d31223b693a313b733a323a222d31223b693a323b733a323a222d31223b693a333b733a323a222d31223b693a343b733a323a222d31223b693a353b733a323a222d31223b693a363b733a323a222d31223b693a373b733a313a2230223b693a383b733a313a2231223b693a393b733a313a2230223b693a31303b733a313a2230223b693a31313b733a323a222d31223b693a31323b733a323a222d31223b693a31333b733a313a2230223b693a31343b733a313a2231223b693a31353b733a313a2231223b693a31363b733a313a2230223b693a31373b733a323a222d31223b693a31383b733a323a222d31223b693a31393b733a313a2230223b693a32303b733a313a2231223b693a32313b733a313a2232223b693a32323b733a313a2230223b693a32333b733a323a222d31223b693a32343b733a323a222d31223b693a32353b733a313a2230223b693a32363b733a313a2230223b693a32373b733a313a2230223b693a32383b733a313a2230223b693a32393b733a323a222d31223b693a33303b733a323a222d31223b693a33313b733a323a222d31223b693a33323b733a323a222d31223b693a33333b733a323a222d31223b693a33343b733a323a222d31223b693a33353b733a323a222d31223b7d, 2, 3, 9),
(3, 0x613a33363a7b693a303b733a323a222d31223b693a313b733a323a222d31223b693a323b733a323a222d31223b693a333b733a323a222d31223b693a343b733a323a222d31223b693a353b733a323a222d31223b693a363b733a323a222d31223b693a373b733a313a2232223b693a383b733a313a2232223b693a393b733a313a2232223b693a31303b733a313a2231223b693a31313b733a323a222d31223b693a31323b733a323a222d31223b693a31333b733a313a2232223b693a31343b733a313a2232223b693a31353b733a313a2231223b693a31363b733a313a2232223b693a31373b733a323a222d31223b693a31383b733a323a222d31223b693a31393b733a313a2232223b693a32303b733a313a2231223b693a32313b733a313a2231223b693a32323b733a313a2232223b693a32333b733a323a222d31223b693a32343b733a323a222d31223b693a32353b733a313a2231223b693a32363b733a313a2231223b693a32373b733a313a2231223b693a32383b733a313a2232223b693a32393b733a323a222d31223b693a33303b733a323a222d31223b693a33313b733a323a222d31223b693a33323b733a323a222d31223b693a33333b733a323a222d31223b693a33343b733a323a222d31223b693a33353b733a323a222d31223b7d, 2, 4, 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `othello`
--
ALTER TABLE `othello`
  ADD PRIMARY KEY (`othello_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `othello`
--
ALTER TABLE `othello`
  MODIFY `othello_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `othello`
--
ALTER TABLE `othello`
  ADD CONSTRAINT `othello_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
