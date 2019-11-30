-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2019 at 06:43 PM
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
  `username` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`account_id`, `username`, `password`) VALUES
(14, 'gramtest', 'test'),
(15, 'test', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `codebook_dtl`
--

CREATE TABLE IF NOT EXISTS `codebook_dtl` (
  `codebook_id` int(11) DEFAULT NULL,
`detail_id` int(11) NOT NULL,
  `start_word` varchar(50) NOT NULL,
  `end_word` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `codebook_dtl`
--

INSERT INTO `codebook_dtl` (`codebook_id`, `detail_id`, `start_word`, `end_word`) VALUES
(4, 6, 'star', ''),
(4, 7, ' start', 'end');

-- --------------------------------------------------------

--
-- Table structure for table `codebook_hdr`
--

CREATE TABLE IF NOT EXISTS `codebook_hdr` (
`codebook_id` int(11) NOT NULL,
  `codebook_name` varchar(20) NOT NULL,
  `account_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `codebook_hdr`
--

INSERT INTO `codebook_hdr` (`codebook_id`, `codebook_name`, `account_id`) VALUES
(4, 'test', 14);

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE IF NOT EXISTS `session` (
`session_id` int(11) NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `codebook_id` int(11) DEFAULT NULL,
  `session_name` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`session_id`, `account_id`, `codebook_id`, `session_name`) VALUES
(2, 14, 4, 'test');

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
-- Dumping data for table `session_counts`
--

INSERT INTO `session_counts` (`session_id`, `detail_id`, `count`) VALUES
(2, 6, 2),
(2, 7, 0);

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
 ADD PRIMARY KEY (`codebook_id`), ADD KEY `ACCOUNT_CONSTR` (`account_id`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
 ADD PRIMARY KEY (`session_id`), ADD KEY `AID` (`account_id`), ADD KEY `CID` (`codebook_id`);

--
-- Indexes for table `session_counts`
--
ALTER TABLE `session_counts`
 ADD KEY `session_id_constr` (`session_id`), ADD KEY `detail_id_constr` (`detail_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `codebook_dtl`
--
ALTER TABLE `codebook_dtl`
MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `codebook_hdr`
--
ALTER TABLE `codebook_hdr`
MODIFY `codebook_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `codebook_dtl`
--
ALTER TABLE `codebook_dtl`
ADD CONSTRAINT `codebook_dtl_ibfk_1` FOREIGN KEY (`codebook_id`) REFERENCES `codebook_hdr` (`codebook_id`);

--
-- Constraints for table `codebook_hdr`
--
ALTER TABLE `codebook_hdr`
ADD CONSTRAINT `ACCOUNT_CONSTR` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`);

--
-- Constraints for table `session`
--
ALTER TABLE `session`
ADD CONSTRAINT `session_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`),
ADD CONSTRAINT `session_ibfk_2` FOREIGN KEY (`codebook_id`) REFERENCES `codebook_hdr` (`codebook_id`);

--
-- Constraints for table `session_counts`
--
ALTER TABLE `session_counts`
ADD CONSTRAINT `detail_id_constr` FOREIGN KEY (`detail_id`) REFERENCES `codebook_dtl` (`detail_id`),
ADD CONSTRAINT `session_id_constr` FOREIGN KEY (`session_id`) REFERENCES `session` (`session_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
