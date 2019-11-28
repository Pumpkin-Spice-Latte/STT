-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2019 at 03:07 AM
-- Server version: 5.6.21
-- PHP Version: 5.5.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `s2tdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
`account_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL DEFAULT 'admin',
  `password` varchar(255) DEFAULT 'password'
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`account_id`, `username`, `password`) VALUES
(14, 'gramtest', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `codebook_dtl`
--

CREATE TABLE IF NOT EXISTS `codebook_dtl` (
  `codebook_id` int(11) DEFAULT NULL,
`detail_id` int(11) NOT NULL,
  `start_word` varchar(50) NOT NULL,
  `end_word` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `codebook_dtl`
--

INSERT INTO `codebook_dtl` (`codebook_id`, `detail_id`, `start_word`, `end_word`) VALUES
(13, 5, 'one', ''),
(13, 6, ' two', ' three'),
(14, 8, 'yay', ''),
(14, 9, ' double', ' yay'),
(14, 10, ' ', ''),
(15, 11, 'one', ''),
(15, 12, ' two', ' three!'),
(15, 13, ' ', ''),
(16, 14, 'one', ''),
(16, 15, ' two', ' three'),
(16, 16, ' four', ''),
(16, 17, ' ', ''),
(17, 18, 'one', ''),
(17, 19, ' two', ' three'),
(17, 20, ' four', ''),
(17, 21, ' ', ''),
(18, 22, 'one', ''),
(18, 23, ' two', ' three'),
(18, 24, ' ', ''),
(19, 25, ' two', ' three'),
(20, 26, 'one', ''),
(20, 27, ' two', ' three'),
(20, 28, ' four', '');

-- --------------------------------------------------------

--
-- Table structure for table `codebook_hdr`
--

CREATE TABLE IF NOT EXISTS `codebook_hdr` (
`codebook_id` int(11) NOT NULL,
  `codebook_name` varchar(20) NOT NULL,
  `account_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `codebook_hdr`
--

INSERT INTO `codebook_hdr` (`codebook_id`, `codebook_name`, `account_id`) VALUES
(13, 'testbook5', 14),
(14, 'code', 14),
(15, 'test34', 14),
(16, 'test54', 14),
(17, 'test56', 14),
(18, 'test76', 14),
(19, 'test9898', 14),
(20, 'test984598', 14);

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE IF NOT EXISTS `session` (
`session_id` int(11) NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `codebook_id` int(11) DEFAULT NULL,
  `session_name` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`session_id`, `account_id`, `codebook_id`, `session_name`) VALUES
(3, 14, 15, 'test'),
(4, 14, 14, 'test2'),
(5, 14, 15, 'test3'),
(6, 14, 16, 'test7'),
(7, 14, 20, 'test56'),
(8, 14, 20, 'tet2'),
(9, 14, 20, 'tew');

-- --------------------------------------------------------

--
-- Table structure for table `session_counts`
--

CREATE TABLE IF NOT EXISTS `session_counts` (
  `session_id` int(11) NOT NULL,
  `detail_id` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
 ADD PRIMARY KEY (`account_id`), ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `codebook_dtl`
--
ALTER TABLE `codebook_dtl`
 ADD PRIMARY KEY (`detail_id`), ADD KEY `CID` (`codebook_id`);

--
-- Indexes for table `codebook_hdr`
--
ALTER TABLE `codebook_hdr`
 ADD PRIMARY KEY (`codebook_id`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
 ADD PRIMARY KEY (`session_id`), ADD KEY `AID` (`account_id`), ADD KEY `CID` (`codebook_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `codebook_dtl`
--
ALTER TABLE `codebook_dtl`
MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `codebook_hdr`
--
ALTER TABLE `codebook_hdr`
MODIFY `codebook_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `codebook_dtl`
--
ALTER TABLE `codebook_dtl`
ADD CONSTRAINT `codebook_dtl_ibfk_1` FOREIGN KEY (`codebook_id`) REFERENCES `codebook_hdr` (`codebook_id`);

--
-- Constraints for table `session`
--
ALTER TABLE `session`
ADD CONSTRAINT `session_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`),
ADD CONSTRAINT `session_ibfk_2` FOREIGN KEY (`codebook_id`) REFERENCES `codebook_hdr` (`codebook_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
