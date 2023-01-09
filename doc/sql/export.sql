CREATE DATABASE  IF NOT EXISTS `banka` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `banka`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: banka
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `aktivni_ucty`
--

DROP TABLE IF EXISTS `aktivni_ucty`;
/*!50001 DROP VIEW IF EXISTS `aktivni_ucty`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `aktivni_ucty` AS SELECT 
 1 AS `cislo_uctu`,
 1 AS `jmeno`,
 1 AS `prijmeni`,
 1 AS `zustatek`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `karta`
--

DROP TABLE IF EXISTS `karta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `karta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cislo_karty` int NOT NULL,
  `datum_vyprseni` date NOT NULL,
  `CVC_kod` int NOT NULL,
  `jmeno_uzivatele` varchar(20) NOT NULL,
  `debetni_karta` tinyint(1) NOT NULL,
  `kreditni_karta` tinyint(1) NOT NULL,
  `bezkontaktni` tinyint(1) NOT NULL,
  `online_karta` tinyint(1) NOT NULL,
  `zakaznik_id` int DEFAULT NULL,
  `ucet_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `zakaznik_constraint2` (`zakaznik_id`),
  KEY `ucet_constraint` (`ucet_id`),
  CONSTRAINT `ucet_constraint` FOREIGN KEY (`ucet_id`) REFERENCES `ucet` (`id`),
  CONSTRAINT `zakaznik_constraint2` FOREIGN KEY (`zakaznik_id`) REFERENCES `zakaznik` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `karta`
--

LOCK TABLES `karta` WRITE;
/*!40000 ALTER TABLE `karta` DISABLE KEYS */;
INSERT INTO `karta` VALUES (1,123456,'2022-12-01',123,'Jan Novak',1,0,1,0,1,1),(2,123457,'2023-01-01',123,'Petr Novak',0,1,0,1,2,2),(3,123458,'2023-02-01',123,'Jana Novakova',0,1,1,0,3,3),(4,123459,'2023-03-01',123,'Jiri Novak',0,0,0,1,4,4),(5,123460,'2023-04-01',123,'Lenka Novakova',1,1,1,1,5,5);
/*!40000 ALTER TABLE `karta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kontakt`
--

DROP TABLE IF EXISTS `kontakt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kontakt` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `tel_cislo` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kontakt`
--

LOCK TABLES `kontakt` WRITE;
/*!40000 ALTER TABLE `kontakt` DISABLE KEYS */;
INSERT INTO `kontakt` VALUES (1,'jan.novak@example.com',12345678),(2,'petr.svoboda@example.com',23456789),(3,'lucie.dvorakova@example.com',34567890),(4,'petr.mlady@example.com',456789102),(5,'jakub.bily@example.com',567890123);
/*!40000 ALTER TABLE `kontakt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lokace`
--

DROP TABLE IF EXISTS `lokace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lokace` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ulice` varchar(20) NOT NULL,
  `mesto` varchar(20) NOT NULL,
  `stat` varchar(40) NOT NULL,
  `cislo_domu` int NOT NULL,
  `PSC` int NOT NULL,
  `pobocka_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pobocka_constraint2` (`pobocka_id`),
  CONSTRAINT `pobocka_constraint2` FOREIGN KEY (`pobocka_id`) REFERENCES `pobocka` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lokace`
--

LOCK TABLES `lokace` WRITE;
/*!40000 ALTER TABLE `lokace` DISABLE KEYS */;
INSERT INTO `lokace` VALUES (1,'Ulica 1','Město 1','Stát 1',1,11111,1),(2,'Ulica 2','Město 2','Stát 2',2,22222,2),(3,'Ulica 3','Město 3','Stát 3',3,33333,3),(4,'Ulica 4','Město 4','Stát 4',4,44444,4),(5,'Ulica 5','Město 5','Stát 5',5,55555,5);
/*!40000 ALTER TABLE `lokace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `nesplacene_uvery`
--

DROP TABLE IF EXISTS `nesplacene_uvery`;
/*!50001 DROP VIEW IF EXISTS `nesplacene_uvery`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `nesplacene_uvery` AS SELECT 
 1 AS `jmeno`,
 1 AS `prijmeni`,
 1 AS `email`,
 1 AS `tel_cislo`,
 1 AS `castka`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pobocka`
--

DROP TABLE IF EXISTS `pobocka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pobocka` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nazev` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pobocka_index` (`nazev`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pobocka`
--

LOCK TABLES `pobocka` WRITE;
/*!40000 ALTER TABLE `pobocka` DISABLE KEYS */;
INSERT INTO `pobocka` VALUES (1,'Pobočka 1'),(2,'Pobočka 2'),(3,'Pobočka 3'),(4,'Pobočka 4'),(5,'Pobočka 5');
/*!40000 ALTER TABLE `pobocka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pujcka`
--

DROP TABLE IF EXISTS `pujcka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pujcka` (
  `id` int NOT NULL AUTO_INCREMENT,
  `datum_zalozeni` date NOT NULL,
  `castka` int NOT NULL,
  `urok` int NOT NULL,
  `zakaznik_id` int DEFAULT NULL,
  `delka_pujcky` int DEFAULT NULL,
  `pocet_splatek` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `zakaznik_constraint3` (`zakaznik_id`),
  CONSTRAINT `zakaznik_constraint3` FOREIGN KEY (`zakaznik_id`) REFERENCES `zakaznik` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pujcka`
--

LOCK TABLES `pujcka` WRITE;
/*!40000 ALTER TABLE `pujcka` DISABLE KEYS */;
INSERT INTO `pujcka` VALUES (1,'2022-01-01',10000,5,1,20,40),(2,'2022-01-01',20000,10,2,20,40),(3,'2022-01-01',30000,15,3,20,40),(4,'2022-01-01',40000,20,4,20,40),(5,'2022-01-01',50000,25,5,20,40);
/*!40000 ALTER TABLE `pujcka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `splatka`
--

DROP TABLE IF EXISTS `splatka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `splatka` (
  `id` int NOT NULL AUTO_INCREMENT,
  `datum_splatky` date NOT NULL,
  `castka` int NOT NULL,
  `pujcka_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pujcka_constraint` (`pujcka_id`),
  CONSTRAINT `pujcka_constraint` FOREIGN KEY (`pujcka_id`) REFERENCES `pujcka` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `splatka`
--

LOCK TABLES `splatka` WRITE;
/*!40000 ALTER TABLE `splatka` DISABLE KEYS */;
INSERT INTO `splatka` VALUES (1,'2022-01-01',1000,2),(2,'2022-02-01',1000,2),(3,'2022-03-01',1000,2),(4,'2022-04-01',1000,2),(5,'2022-05-01',1000,2);
/*!40000 ALTER TABLE `splatka` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `aktulizace_zustatku_na_uctu` AFTER INSERT ON `splatka` FOR EACH ROW BEGIN
  -- Update the balance of the associated account
  UPDATE ucet
  SET zustatek = zustatek - NEW.castka
  WHERE id = (SELECT ucet_id FROM zakaznik WHERE id = (SELECT zakaznik_id FROM pujcka WHERE id = NEW.pujcka_id));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ucet`
--

DROP TABLE IF EXISTS `ucet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ucet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cislo_uctu` int NOT NULL,
  `IBAN` varchar(40) NOT NULL,
  `SWIFT` varchar(40) NOT NULL,
  `mena` varchar(20) NOT NULL,
  `plus_ucet` tinyint(1) NOT NULL,
  `standartni_ucet` tinyint(1) NOT NULL,
  `sporici_ucet` tinyint(1) NOT NULL,
  `zakaznik_id` int DEFAULT NULL,
  `zustatek` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `zakaznik_constraint` (`zakaznik_id`),
  CONSTRAINT `zakaznik_constraint` FOREIGN KEY (`zakaznik_id`) REFERENCES `zakaznik` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ucet`
--

LOCK TABLES `ucet` WRITE;
/*!40000 ALTER TABLE `ucet` DISABLE KEYS */;
INSERT INTO `ucet` VALUES (1,123456,'CZ123456','CZBACZPP','CZK',0,1,0,1,321483842),(2,123457,'CZ123457','CZBACZPP','CZK',1,0,0,2,321483842),(3,123458,'CZ123458','CZBACZPP','CZK',0,0,1,3,321483842),(4,123458,'CZ123459','CZBACZPP','CZK',0,1,1,3,321483842),(5,123458,'CZ123450','CZBACZPP','CZK',0,1,1,3,321483842);
/*!40000 ALTER TABLE `ucet` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `zabraneni_vice_sporicim_uctum` BEFORE INSERT ON `ucet` FOR EACH ROW BEGIN
  IF NEW.sporici_ucet = 1 THEN
    IF (SELECT COUNT(*) FROM ucet WHERE zakaznik_id = NEW.zakaznik_id AND sporici_ucet = 1) > 0 THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Zákazník může mít pouze jeden spořicí účet';
    END IF;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `ucty_s_vysokym_zustatkem`
--

DROP TABLE IF EXISTS `ucty_s_vysokym_zustatkem`;
/*!50001 DROP VIEW IF EXISTS `ucty_s_vysokym_zustatkem`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ucty_s_vysokym_zustatkem` AS SELECT 
 1 AS `jmeno`,
 1 AS `prijmeni`,
 1 AS `email`,
 1 AS `tel_cislo`,
 1 AS `zustatek`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `uzivatel_s_aktivni_pucjkou`
--

DROP TABLE IF EXISTS `uzivatel_s_aktivni_pucjkou`;
/*!50001 DROP VIEW IF EXISTS `uzivatel_s_aktivni_pucjkou`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `uzivatel_s_aktivni_pucjkou` AS SELECT 
 1 AS `jmeno`,
 1 AS `prijmeni`,
 1 AS `email`,
 1 AS `tel_cislo`,
 1 AS `castka`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `zakaznik`
--

DROP TABLE IF EXISTS `zakaznik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zakaznik` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jmeno` varchar(20) NOT NULL,
  `prijmeni` varchar(20) NOT NULL,
  `kontakt_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kontakt_constraint2` (`kontakt_id`),
  KEY `zakaznik_index` (`jmeno`,`prijmeni`),
  CONSTRAINT `kontakt_constraint2` FOREIGN KEY (`kontakt_id`) REFERENCES `kontakt` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zakaznik`
--

LOCK TABLES `zakaznik` WRITE;
/*!40000 ALTER TABLE `zakaznik` DISABLE KEYS */;
INSERT INTO `zakaznik` VALUES (1,'Jan','Novák',1),(2,'Petr','Svoboda',1),(3,'Lucie','Dvořáková',1),(4,'Petr','Mladý',1),(5,'Jakub','Bílý',1);
/*!40000 ALTER TABLE `zakaznik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zamestnanec`
--

DROP TABLE IF EXISTS `zamestnanec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zamestnanec` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jmeno` varchar(20) NOT NULL,
  `prijmeni` varchar(20) NOT NULL,
  `pobocka_id` int DEFAULT NULL,
  `kontakt_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pobocka_constraint` (`pobocka_id`),
  KEY `kontakt_constraint` (`kontakt_id`),
  KEY `zamestnanec_index` (`jmeno`,`prijmeni`),
  CONSTRAINT `kontakt_constraint` FOREIGN KEY (`kontakt_id`) REFERENCES `kontakt` (`id`),
  CONSTRAINT `pobocka_constraint` FOREIGN KEY (`pobocka_id`) REFERENCES `pobocka` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zamestnanec`
--

LOCK TABLES `zamestnanec` WRITE;
/*!40000 ALTER TABLE `zamestnanec` DISABLE KEYS */;
INSERT INTO `zamestnanec` VALUES (1,'Jana','Nováková',1,4),(2,'Petra','Svobodová',2,5),(3,'Lucie','Dvořákové',2,5),(4,'Petr','Mladý',2,5),(5,'Jakub','Bílý',2,5);
/*!40000 ALTER TABLE `zamestnanec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'banka'
--
/*!50003 DROP PROCEDURE IF EXISTS `vytvor_zakaznika` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `vytvor_zakaznika`(IN jmeno VARCHAR(20), IN prijmeni VARCHAR(20), IN email VARCHAR(50), IN tel_cislo INT)
BEGIN
  DECLARE kontakt_id INT DEFAULT 0;

  INSERT INTO kontakt (email, tel_cislo) VALUES (email, tel_cislo);
  SET kontakt_id = LAST_INSERT_ID();
  INSERT INTO zakaznik (jmeno, prijmeni, kontakt_id) VALUES (jmeno, prijmeni, kontakt_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ziskani_pujcky` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ziskani_pujcky`(IN zakaznik_id INT, OUT pujcka_id INT, OUT castka_pujcky INT, OUT urok_z_pujcky INT)
BEGIN
  -- Get the loan information for the customer with the given ID
  SELECT pujcka.id, pujcka.castka, pujcka.urok INTO pujcka_id, castka_pujcky, urok_z_pujcky
  FROM zakaznik
  INNER JOIN pujcka ON zakaznik.id = pujcka.zakaznik_id
  WHERE zakaznik.id = zakaznik_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `zmena_udaju_zakaznika` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `zmena_udaju_zakaznika`(IN zakaznik_id INT, IN jmeno VARCHAR(20), IN prijmeni VARCHAR(20), IN email VARCHAR(50), IN cislo INT)
BEGIN
  -- Update the customer's information
  UPDATE zakaznik
  SET jmeno = jmeno,
      prijmeni = prijmeni
  WHERE id = zakaznik_id;

  -- Update the customer's contact information
  UPDATE kontakt
  SET email = email,
      tel_cislo = cislo
  WHERE id = (SELECT kontakt_id FROM zakaznik WHERE id = zakaznik_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `aktivni_ucty`
--

/*!50001 DROP VIEW IF EXISTS `aktivni_ucty`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `aktivni_ucty` AS select `ucet`.`cislo_uctu` AS `cislo_uctu`,`zakaznik`.`jmeno` AS `jmeno`,`zakaznik`.`prijmeni` AS `prijmeni`,`ucet`.`zustatek` AS `zustatek` from (`ucet` join `zakaznik` on((`ucet`.`zakaznik_id` = `zakaznik`.`id`))) where ((`ucet`.`plus_ucet` = true) and (`ucet`.`zustatek` > 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `nesplacene_uvery`
--

/*!50001 DROP VIEW IF EXISTS `nesplacene_uvery`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `nesplacene_uvery` AS select `zakaznik`.`jmeno` AS `jmeno`,`zakaznik`.`prijmeni` AS `prijmeni`,`kontakt`.`email` AS `email`,`kontakt`.`tel_cislo` AS `tel_cislo`,`pujcka`.`castka` AS `castka` from ((`zakaznik` join `kontakt` on((`zakaznik`.`kontakt_id` = `kontakt`.`id`))) join `pujcka` on((`zakaznik`.`id` = `pujcka`.`zakaznik_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ucty_s_vysokym_zustatkem`
--

/*!50001 DROP VIEW IF EXISTS `ucty_s_vysokym_zustatkem`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ucty_s_vysokym_zustatkem` AS select `zakaznik`.`jmeno` AS `jmeno`,`zakaznik`.`prijmeni` AS `prijmeni`,`kontakt`.`email` AS `email`,`kontakt`.`tel_cislo` AS `tel_cislo`,`ucet`.`zustatek` AS `zustatek` from ((`zakaznik` join `ucet` on((`zakaznik`.`id` = `ucet`.`zakaznik_id`))) join `kontakt` on((`zakaznik`.`kontakt_id` = `kontakt`.`id`))) where (`ucet`.`zustatek` > 10000) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `uzivatel_s_aktivni_pucjkou`
--

/*!50001 DROP VIEW IF EXISTS `uzivatel_s_aktivni_pucjkou`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `uzivatel_s_aktivni_pucjkou` AS select `zakaznik`.`jmeno` AS `jmeno`,`zakaznik`.`prijmeni` AS `prijmeni`,`kontakt`.`email` AS `email`,`kontakt`.`tel_cislo` AS `tel_cislo`,`pujcka`.`castka` AS `castka` from ((`zakaznik` join `kontakt` on((`zakaznik`.`kontakt_id` = `kontakt`.`id`))) join `pujcka` on((`zakaznik`.`id` = `pujcka`.`zakaznik_id`))) where exists(select 1 from `splatka` where (`splatka`.`pujcka_id` = `pujcka`.`id`)) is false */;
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

-- Dump completed on 2023-01-07 20:39:15
