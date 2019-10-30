-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 30, 2019 at 02:18 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bloodbank`
--

-- --------------------------------------------------------

--
-- Table structure for table `blood`
--

DROP TABLE IF EXISTS `blood`;
CREATE TABLE IF NOT EXISTS `blood` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `bgroup` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `donates`
--

DROP TABLE IF EXISTS `donates`;
CREATE TABLE IF NOT EXISTS `donates` (
  `donid` int(11) NOT NULL,
  `did` int(11) DEFAULT NULL,
  `bid` int(11) DEFAULT NULL,
  `dateofdon` date DEFAULT NULL,
  PRIMARY KEY (`donid`),
  KEY `did` (`did`),
  KEY `bid` (`bid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `donor`
--

DROP TABLE IF EXISTS `donor`;
CREATE TABLE IF NOT EXISTS `donor` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `dfname` varchar(20) DEFAULT NULL,
  `dlname` varchar(20) DEFAULT NULL,
  `ddob` date DEFAULT NULL,
  `dgender` char(1) DEFAULT NULL,
  `dwt` float DEFAULT NULL,
  `dbgroup` varchar(3) DEFAULT NULL,
  `dphone` bigint(20) DEFAULT NULL,
  `daddr` varchar(100) DEFAULT NULL,
  `demail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `donor`
--

INSERT INTO `donor` (`did`, `dfname`, `dlname`, `ddob`, `dgender`, `dwt`, `dbgroup`, `dphone`, `daddr`, `demail`) VALUES
(1, 'a', 'b', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'b', 'c', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `has`
--

DROP TABLE IF EXISTS `has`;
CREATE TABLE IF NOT EXISTS `has` (
  `hid` int(11) NOT NULL,
  `bgroup` int(11) DEFAULT NULL,
  `bid` int(11) DEFAULT NULL,
  PRIMARY KEY (`hid`),
  KEY `sid` (`bgroup`),
  KEY `bid` (`bid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pfname` varchar(20) DEFAULT NULL,
  `plname` varchar(20) NOT NULL,
  `pbgroup` varchar(3) DEFAULT NULL,
  `pbloodamt` int(11) DEFAULT NULL,
  `pphone` bigint(20) DEFAULT NULL,
  `paddr` varchar(20) DEFAULT NULL,
  `pemail` varchar(20) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
CREATE TABLE IF NOT EXISTS `requests` (
  `reqid` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `bid` int(11) DEFAULT NULL,
  `dateofreq` date DEFAULT NULL,
  PRIMARY KEY (`reqid`),
  KEY `pid` (`pid`),
  KEY `bid` (`bid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `bgroup` varchar(3) NOT NULL,
  `amt` int(11) DEFAULT '0',
  PRIMARY KEY (`bgroup`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`bgroup`, `amt`) VALUES
('A+', 0),
('A-', 0),
('B+', 0),
('B-', 0),
('AB+', 0),
('AB-', 0),
('O+', 0),
('O-', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
