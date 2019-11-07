-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2019 at 07:07 PM
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`account_id`, `username`, `password`) VALUES
(1, 'test', 'test'),
(3, 'hll', 'hi'),
(5, 'hllu', 'hi'),
(6, 'hllus', 'hi'),
(8, 'hllusdq', 'hi'),
(9, 'AKHDSFJ', 'LKSDJF'),
(10, 'sadfh', 'sdf'),
(11, 'ewfw', 'wef'),
(12, 'ewfwj', 'wef'),
(13, 'gram', 'mypass'),
(14, 'gramtest', 'test'),
(15, 'gramtest2', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `codebook`
--

CREATE TABLE IF NOT EXISTS `codebook` (
  `CID` int(11) NOT NULL,
`DID` int(11) NOT NULL,
  `word` varchar(255) DEFAULT NULL,
  `codebook_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `counts`
--

CREATE TABLE IF NOT EXISTS `counts` (
  `CID` int(11) NOT NULL,
  `SID` int(11) NOT NULL,
  `Uword` varchar(255) DEFAULT NULL,
  `wordCount` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `header`
--

CREATE TABLE IF NOT EXISTS `header` (
`codebook_id` int(11) NOT NULL,
  `CreateDate` date NOT NULL,
  `UpdateDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE IF NOT EXISTS `session` (
`session_id` int(11) NOT NULL,
  `AID` int(11) NOT NULL,
  `CID` int(11) NOT NULL,
  `session_name` varchar(20) NOT NULL
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
-- Indexes for table `codebook`
--
ALTER TABLE `codebook`
 ADD PRIMARY KEY (`DID`), ADD KEY `CID` (`CID`);

--
-- Indexes for table `header`
--
ALTER TABLE `header`
 ADD PRIMARY KEY (`codebook_id`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
 ADD PRIMARY KEY (`session_id`), ADD KEY `AID` (`AID`), ADD KEY `CID` (`CID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `codebook`
--
ALTER TABLE `codebook`
MODIFY `DID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `header`
--
ALTER TABLE `header`
MODIFY `codebook_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `codebook`
--
ALTER TABLE `codebook`
ADD CONSTRAINT `codebook_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `header` (`codebook_id`);

--
-- Constraints for table `session`
--
ALTER TABLE `session`
ADD CONSTRAINT `session_ibfk_1` FOREIGN KEY (`AID`) REFERENCES `accounts` (`account_id`),
ADD CONSTRAINT `session_ibfk_2` FOREIGN KEY (`CID`) REFERENCES `header` (`codebook_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
