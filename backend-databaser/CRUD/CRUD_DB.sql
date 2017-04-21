-- phpMyAdmin SQL Dump
-- version 2.11.11.3
-- http://www.phpmyadmin.net
--
-- Värd: 83.168.227.23
-- Skapad: 21 april 2017 kl 13:20
-- Serverversion: 5.0.83
-- PHP-version: 4.4.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databas: `db1164707_AndersR`
--

-- --------------------------------------------------------

--
-- Struktur för tabell `bowl`
--

DROP TABLE IF EXISTS `bowl`;
CREATE TABLE IF NOT EXISTS `bowl` (
  `bowlID` int(11) NOT NULL auto_increment,
  `bowlName` varchar(30) default NULL,
  `bowlColor` varchar(30) default NULL,
  `bowlType` varchar(30) default NULL,
  `bowlWeight` float default NULL,
  PRIMARY KEY  (`bowlID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Data i tabell `bowl`
--

INSERT INTO `bowl` (`bowlID`, `bowlName`, `bowlColor`, `bowlType`, `bowlWeight`) VALUES
(1, 'grannys bowl', 'grön', 'kristall', 1750),
(2, 'Anty Esters', 'svart', 'silver', 1250);

-- --------------------------------------------------------

--
-- Struktur för tabell `fruit`
--

DROP TABLE IF EXISTS `fruit`;
CREATE TABLE IF NOT EXISTS `fruit` (
  `fruitID` int(11) NOT NULL auto_increment,
  `fruitName` varchar(30) default NULL,
  `bowlID` int(11) NOT NULL,
  `fruitQTY` int(11) NOT NULL,
  `fruitWeight` float default NULL,
  PRIMARY KEY  (`fruitID`),
  KEY `fk_bowl` (`bowlID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Data i tabell `fruit`
--

INSERT INTO `fruit` (`fruitID`, `fruitName`, `bowlID`, `fruitQTY`, `fruitWeight`) VALUES
(1, 'Banana', 1, 4, 234.34),
(2, 'Apple', 1, 6, 123.43),
(3, 'Orange', 1, 3, 256.21),
(4, 'Clementine', 2, 3, 560),
(5, 'Pomegranate', 2, 2, 432.3);


--
-- Restriktioner för tabell `fruit`
--
ALTER TABLE `fruit`
  ADD CONSTRAINT `fk_bowl` FOREIGN KEY (`bowlID`) REFERENCES `bowl` (`bowlID`);

DELIMITER $$
--
-- Procedurer
--

DROP PROCEDURE IF EXISTS `totalweight`$$
CREATE DEFINER=`u1164707_AndersR`@`%` PROCEDURE `totalweight`()
select b.bowlName, sum(f.fruitWeight) as 'Total fruit weight' from   fruit f join   bowl b on b.bowlID = f.bowlID group by   bowlName$$

DELIMITER ;
