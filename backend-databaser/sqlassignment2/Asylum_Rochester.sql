-- MySQL dump 10.13  Distrib 5.6.35, for osx10.9 (x86_64)
--
-- Host: localhost    Database: asylum
-- ------------------------------------------------------
-- Server version	5.6.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `diagnos`
--

DROP TABLE IF EXISTS `diagnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diagnos` (
  `diagnosID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `symptom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`diagnosID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnos`
--

LOCK TABLES `diagnos` WRITE;
/*!40000 ALTER TABLE `diagnos` DISABLE KEYS */;
INSERT INTO `diagnos` VALUES (3,'MS','domningar och svaghet eller stickningar i en eller flera kroppsdelar\"'),(4,'Fibromyalgi','\"trötthet\"'),(5,'Rabies','\"Symtom som vid hjärninflammation visar sig med tilltagande neurologisk påverkan'),(6,'Difteri','\"Sväljningssvårigheter och svullnad i halsen brukar göra att man inte sällan blandar ihop difteri med halsfluss. Gråa beläggningar i svalget som kan ge andningssvårigheter förkommer ofta vid difteri. Av den anledningen kallas difteri för äkta krupp. Ett a'),(7,'Körtelfeber','svullna lymfkörtlar'),(8,'Fönstertittarsjuka','Smärta i ett eller båda benen vid promenad är det typiska symtomet vid claudicatio intermittens, som förorsakas av försämrat blodflöde i benens pulsådror på grund av åderförkalkning, ateroskleros. Att symtomet fått namnet ”fönstertittarsjuka” beror på att'),(9,'Alopeci (håravfall)','Normalt börjar Alopecia areata med att man på relativt kort tid tappar hår fläckvis. Många upptäcker en kal fläck som är ungefär femkronestor på huvudet. Fläcken kan växa till sig snabbt men det kan också ta månader eller år innan den tillväxer.'),(10,'Stelkramp','Dessa krampanfall utlöses ofta av beröring och höga ljud och andra stimuli. Om man inte får behandling kan sjukdomen leda till döden. Bland annat riskerar man att kvävas under anfallen. Det är dock viktigt att understryka att stelkramp inte smittar från m');
/*!40000 ALTER TABLE `diagnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnos_patient`
--

DROP TABLE IF EXISTS `diagnos_patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diagnos_patient` (
  `diagnosID` int(11) NOT NULL,
  `patientID` int(11) NOT NULL,
  PRIMARY KEY (`diagnosID`,`patientID`),
  KEY `fk_pd` (`patientID`),
  CONSTRAINT `fk_dp` FOREIGN KEY (`diagnosID`) REFERENCES `diagnos` (`diagnosID`),
  CONSTRAINT `fk_pd` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnos_patient`
--

LOCK TABLES `diagnos_patient` WRITE;
/*!40000 ALTER TABLE `diagnos_patient` DISABLE KEYS */;
INSERT INTO `diagnos_patient` VALUES (3,1),(5,1),(3,2),(4,2),(13,3),(4,4),(5,4),(6,4),(7,4),(13,6),(13,7),(4,10),(5,10),(4,11),(5,11);
/*!40000 ALTER TABLE `diagnos_patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctors` (
  `doctorID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(30) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`doctorID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (1,'Gregory','House'),(2,'Hawkey','Pierce'),(3,'Leonard','McCoy'),(4,'John','Dorian'),(5,'John','Watson'),(6,'Thomas','Diafoirus');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicin`
--

DROP TABLE IF EXISTS `medicin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicin` (
  `medicinID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `description` text,
  `diagnosID` int(11) NOT NULL,
  `dose` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`medicinID`),
  KEY `fk_diagnos` (`diagnosID`),
  CONSTRAINT `fk_diagnos` FOREIGN KEY (`diagnosID`) REFERENCES `diagnos` (`diagnosID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicin`
--

LOCK TABLES `medicin` WRITE;
/*!40000 ALTER TABLE `medicin` DISABLE KEYS */;
INSERT INTO `medicin` VALUES (4,'paracetamol','Dessa läkemedel är förutom att vara smärtlindrande (ett så kallat analgetikum) också febernedsättande.',7,'3 * 3 dagligen'),(5,'flukloxacillin ','användbara för behandling av olika stafylokockinfektioner',3,'2 * 1 dagligen'),(6,'immunglobulin','Förebyggande behandling när man utsatts för smitta är det andra sättet att hindra att den dödliga sjukdomen utvecklas.',5,'1 spruta'),(7,'heparin','Fysiologiskt antikoagulans  ',8,'15000 IE som intravenös injekt'),(8,'amitriptylin','tricykliskt antidepressivt läkemedel',4,'1-2 tabletter till natten'),(9,'KBT','Beteende terapi',4,'minimum 5 månader 1 gång per v'),(10,'ÖL','En gammal beprövad teknik',9,'masseras in i hårbotten 2ggr d'),(11,'Depolan','För förlängd lindring av svår eller mycket svår smärta, såsom cancersmärta, då andra analgetika ej ger tillräcklig smärtlindring.',3,'20mg dagligen');
/*!40000 ALTER TABLE `medicin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurse`
--

DROP TABLE IF EXISTS `nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nurse` (
  `nurseID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(30) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`nurseID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurse`
--

LOCK TABLES `nurse` WRITE;
/*!40000 ALTER TABLE `nurse` DISABLE KEYS */;
INSERT INTO `nurse` VALUES (1,'Jackie','Peyton'),(2,'Olivia','Harper'),(3,'Abby','Lockheart'),(4,'Carla','Espinosa'),(5,'Margaret','Houlihan');
/*!40000 ALTER TABLE `nurse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurse_patient`
--

DROP TABLE IF EXISTS `nurse_patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nurse_patient` (
  `nurseID` int(11) NOT NULL,
  `patientID` int(11) NOT NULL,
  PRIMARY KEY (`nurseID`,`patientID`),
  KEY `fk_pn` (`patientID`),
  CONSTRAINT `fk_np` FOREIGN KEY (`nurseID`) REFERENCES `nurse` (`nurseID`),
  CONSTRAINT `fk_pn` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurse_patient`
--

LOCK TABLES `nurse_patient` WRITE;
/*!40000 ALTER TABLE `nurse_patient` DISABLE KEYS */;
INSERT INTO `nurse_patient` VALUES (1,1),(2,1),(2,3),(3,3),(1,4),(2,4),(3,4);
/*!40000 ALTER TABLE `nurse_patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `patientID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(30) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  `doctorID` int(11) NOT NULL,
  PRIMARY KEY (`patientID`),
  KEY `fk_doctor` (`doctorID`),
  CONSTRAINT `fk_doctor` FOREIGN KEY (`doctorID`) REFERENCES `doctors` (`doctorID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'John','Yossarian',4),(2,'Davis','Caravaggio',2),(3,'monsieur','Argan',1),(4,'Glenn','Gould',3),(11,'Anders','Andersson',2),(12,'Filip','Kristiansson',2),(13,'John','Doh',1),(15,'Sixten','Blomgren',1);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `quest1`
--

DROP TABLE IF EXISTS `quest1`;
/*!50001 DROP VIEW IF EXISTS `quest1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `quest1` AS SELECT 
 1 AS `name`,
 1 AS `antal insjukna`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `quest2`
--

DROP TABLE IF EXISTS `quest2`;
/*!50001 DROP VIEW IF EXISTS `quest2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `quest2` AS SELECT 
 1 AS `antal insjukna`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `quest3`
--

DROP TABLE IF EXISTS `quest3`;
/*!50001 DROP VIEW IF EXISTS `quest3`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `quest3` AS SELECT 
 1 AS `name`,
 1 AS `dose`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `quest4`
--

DROP TABLE IF EXISTS `quest4`;
/*!50001 DROP VIEW IF EXISTS `quest4`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `quest4` AS SELECT 
 1 AS `firstName`,
 1 AS `lastName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `quest5`
--

DROP TABLE IF EXISTS `quest5`;
/*!50001 DROP VIEW IF EXISTS `quest5`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `quest5` AS SELECT 
 1 AS `firstName`,
 1 AS `lastName`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'asylum'
--
/*!50003 DROP PROCEDURE IF EXISTS `input_diagnos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `input_diagnos`(in i_name varchar(30), in i_symptom varchar(255))
begin
  insert into diagnos (name, symptom)
  values (i_name, i_symptom);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rabies` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rabies`()
begin   select count(pat.patientID) as 'Antal insjuknade i Rabies'   from diagnos_patient dp   join patient pat on dp.patientID = pat.patientID   join diagnos dia on dp.diagnosID = dia.diagnosID   where dia.diagnosID = 5; end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `three` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `three`()
begin
  select 'q1' as '';
  select * from quest1;
  select 'q2' as '';
  select * from quest2;
  select 'q3' as '';
  select * from quest3;
  select 'q4' as '';
  select * from quest4;
  select 'q5' as '';
  select * from quest5;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `quest1`
--

/*!50001 DROP VIEW IF EXISTS `quest1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `quest1` AS select `dia`.`name` AS `name`,count(`pat`.`patientID`) AS `antal insjukna` from ((`diagnos_patient` `dp` join `patient` `pat` on((`dp`.`patientID` = `pat`.`patientID`))) join `diagnos` `dia` on((`dp`.`diagnosID` = `dia`.`diagnosID`))) group by `dia`.`diagnosID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `quest2`
--

/*!50001 DROP VIEW IF EXISTS `quest2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `quest2` AS select count(`patient`.`patientID`) AS `antal insjukna` from `patient` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `quest3`
--

/*!50001 DROP VIEW IF EXISTS `quest3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `quest3` AS select `med`.`name` AS `name`,`med`.`dose` AS `dose` from (`medicin` `med` join `diagnos` `dia` on((`med`.`diagnosID` = `dia`.`diagnosID`))) where (`dia`.`diagnosID` = 4) group by `med`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `quest4`
--

/*!50001 DROP VIEW IF EXISTS `quest4`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `quest4` AS select `nu`.`firstName` AS `firstName`,`nu`.`lastName` AS `lastName` from ((`nurse_patient` `np` join `patient` `pat` on((`np`.`patientID` = `pat`.`patientID`))) join `nurse` `nu` on((`np`.`nurseID` = `nu`.`nurseID`))) where (`pat`.`patientID` = 4) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `quest5`
--

/*!50001 DROP VIEW IF EXISTS `quest5`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `quest5` AS select `pat`.`firstName` AS `firstName`,`pat`.`lastName` AS `lastName` from (`patient` `pat` join `doctors` `dr` on((`pat`.`doctorID` = `dr`.`doctorID`))) where (`dr`.`doctorID` = 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-04 20:06:58
