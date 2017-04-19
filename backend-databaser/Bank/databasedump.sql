-- phpMyAdmin SQL Dump
-- version 2.11.11.3
-- http://www.phpmyadmin.net
--
-- Värd: 83.168.227.23
-- Skapad: 19 april 2017 kl 13:50
-- Serverversion: 5.0.83
-- PHP-version: 4.4.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Databas: `db1164707_AndersR`
--

-- --------------------------------------------------------

--
-- Struktur för tabell `Account`
--

CREATE TABLE IF NOT EXISTS `Account` (
  `accountID` int(11) NOT NULL auto_increment,
  `accountName` varchar(45) NOT NULL,
  `accountFname` varchar(45) NOT NULL,
  `accountLname` varchar(45) NOT NULL,
  `accountBalance` float default NULL,
  PRIMARY KEY  (`accountID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Data i tabell `Account`
--

INSERT INTO `Account` (`accountID`, `accountName`, `accountFname`, `accountLname`, `accountBalance`) VALUES
(1, 'Corporate', 'Sohail', 'Hasware', 1e+06),
(2, 'Savings', 'Kalle', 'Anka', NULL),
(3, 'Salary', 'Musse', 'Pigg', 5000),
(4, 'Savings', 'Joakim', 'Anka', 10);

DELIMITER $$
--
-- Procedurer
--
CREATE DEFINER=`u1164707_AndersR`@`%` PROCEDURE `getbalance`(
  name varchar(40)
)
select *
from Account
  where Account.accountFname=name$$

DELIMITER ;
