-- MariaDB dump 10.19  Distrib 10.5.10-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: u20575085_NormalisedDCIM
-- ------------------------------------------------------
-- Server version	10.5.10-MariaDB

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
-- Table structure for table `DATACENTRE`
--

DROP TABLE IF EXISTS `DATACENTRE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATACENTRE` (
  `Name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Location` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PlantSpecialists` char(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EnergyConsumption` double DEFAULT NULL,
  `NumberOfServers` int(11) DEFAULT NULL,
  `RackCount` int(11) DEFAULT NULL,
  `MTXId` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`MTXId`),
  KEY `PSFKDC` (`PlantSpecialists`),
  CONSTRAINT `PSFKDC` FOREIGN KEY (`PlantSpecialists`) REFERENCES `STAFF` (`EmplId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATACENTRE`
--

LOCK TABLES `DATACENTRE` WRITE;
/*!40000 ALTER TABLE `DATACENTRE` DISABLE KEYS */;
INSERT INTO `DATACENTRE` VALUES ('GP Terror DCIM','GP','2002 VVV','10111',25.25,250,50,'11235'),('MP Terror DCIM','Mpumalanga','74 Invisible Avenue','12345',47.92,42,6,'61235'),('WC Terror DCIM','Western Cape','125 Downcity Street','47852',36.12,157,16,'71235');
/*!40000 ALTER TABLE `DATACENTRE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPARTMENTPROJECT`
--

DROP TABLE IF EXISTS `DEPARTMENTPROJECT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEPARTMENTPROJECT` (
  `ProjectId` char(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Department` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `Department` (`Department`),
  CONSTRAINT `DEPARTMENTPROJECT_ibfk_1` FOREIGN KEY (`Department`) REFERENCES `DEPARTMENTS` (`DepartmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPARTMENTPROJECT`
--

LOCK TABLES `DEPARTMENTPROJECT` WRITE;
/*!40000 ALTER TABLE `DEPARTMENTPROJECT` DISABLE KEYS */;
INSERT INTO `DEPARTMENTPROJECT` VALUES ('IT11GP09','TC11GP12'),('IT61GP09','IT61MP09');
/*!40000 ALTER TABLE `DEPARTMENTPROJECT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPARTMENTS`
--

DROP TABLE IF EXISTS `DEPARTMENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEPARTMENTS` (
  `DepartmentId` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DepartmentName` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DepartmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPARTMENTS`
--

LOCK TABLES `DEPARTMENTS` WRITE;
/*!40000 ALTER TABLE `DEPARTMENTS` DISABLE KEYS */;
INSERT INTO `DEPARTMENTS` VALUES ('AM11GP01','Administration'),('AM61MP01','Administration'),('AM71WC01','Administration'),('FC11GP05','Finance'),('FC61MP05','Finance'),('FC71WC05','Finance'),('IT11GP09','Information Technology'),('IT61MP09','Information Technology'),('IT71WC09','Information Technology'),('TC11GP12','Technical'),('TC61MP12','Technical'),('TC71WC12','Technical');
/*!40000 ALTER TABLE `DEPARTMENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMERGENCYCONTACTS`
--

DROP TABLE IF EXISTS `EMERGENCYCONTACTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EMERGENCYCONTACTS` (
  `EmplId` char(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Names` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PhoneNumber` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `EMCPK` (`EmplId`),
  CONSTRAINT `EMCPK` FOREIGN KEY (`EmplId`) REFERENCES `STAFF` (`EmplId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMERGENCYCONTACTS`
--

LOCK TABLES `EMERGENCYCONTACTS` WRITE;
/*!40000 ALTER TABLE `EMERGENCYCONTACTS` DISABLE KEYS */;
INSERT INTO `EMERGENCYCONTACTS` VALUES ('12345','Precious Oliphant','0741254875','74 AtThis Street, Witbank, Mpumalanga'),('12345','Tshepo Khosi','0874215874','62 Down Street, The Valley, Mpumalanga'),('16012','Thato Dzimati','0667841245','471 Over Street, Cosmo City, Gauteng'),('20145','Lesego Mokoena','0774125874','120 Under Avenue, Witbank Mpumalanga');
/*!40000 ALTER TABLE `EMERGENCYCONTACTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ENERGYEQUIPMENT`
--

DROP TABLE IF EXISTS `ENERGYEQUIPMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ENERGYEQUIPMENT` (
  `EquipmentId` char(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `EqName` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Utilization` double DEFAULT NULL,
  `ServiceStatus` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CommsProtocol` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Location` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MTXId` char(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Model` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SerialNumber` char(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`EquipmentId`),
  UNIQUE KEY `SerialNumber` (`SerialNumber`),
  KEY `Model` (`Model`),
  CONSTRAINT `ENERGYEQUIPMENT_ibfk_1` FOREIGN KEY (`Model`) REFERENCES `MODELENERGYEQUIPMENT` (`Model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ENERGYEQUIPMENT`
--

LOCK TABLES `ENERGYEQUIPMENT` WRITE;
/*!40000 ALTER TABLE `ENERGYEQUIPMENT` DISABLE KEYS */;
INSERT INTO `ENERGYEQUIPMENT` VALUES ('AC11GP112','Happiness',14.12,'Functional','HTTPS','GP','11235','Ryobi 987pvc-fcl','12-745-6'),('AC11GP113','Joy',26.74,'Functional','IP','GP','11235','Ryobi 74Hx-6','6-278-74'),('AC61MP311','Peachy',8.16,'Functional','TCP','MP','61235','Ryobi 451cvx','127-9612'),('AC71WC210','Anxious',36.8,'Abandoned','SSL','WC','71235','Ryobi 987pvc-fcl','74-85-74'),('AC71WC211','Excite',14.8,'Functional','FTP','WC','71235','Ryobi 451cvx','417-7497');
/*!40000 ALTER TABLE `ENERGYEQUIPMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EQUIPMENTS`
--

DROP TABLE IF EXISTS `EQUIPMENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EQUIPMENTS` (
  `EquipmentId` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SerialNumber` char(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EquipmentName` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MTXId` char(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Model` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`EquipmentId`),
  UNIQUE KEY `SerialNumber` (`SerialNumber`),
  KEY `MTXId` (`MTXId`),
  KEY `Model` (`Model`),
  CONSTRAINT `EQUIPMENTS_ibfk_1` FOREIGN KEY (`MTXId`) REFERENCES `DATACENTRE` (`MTXId`),
  CONSTRAINT `EQUIPMENTS_ibfk_2` FOREIGN KEY (`Model`) REFERENCES `EQUIPRATING` (`Model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EQUIPMENTS`
--

LOCK TABLES `EQUIPMENTS` WRITE;
/*!40000 ALTER TABLE `EQUIPMENTS` DISABLE KEYS */;
INSERT INTO `EQUIPMENTS` VALUES ('AW7WCS0','4152036979548','King','61235','DELL'),('GG3M145','4518216975848','Galapagos','11235','ALIEN'),('GGC11P3','1574896250349','Little','71235','DELL'),('MM12R12','4589612357980','Emperor','61235','ASUS'),('WR71211','4587912365478','Humboldt','71235','ASUS');
/*!40000 ALTER TABLE `EQUIPMENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EQUIPRATING`
--

DROP TABLE IF EXISTS `EQUIPRATING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EQUIPRATING` (
  `Model` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Rating` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`Model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EQUIPRATING`
--

LOCK TABLES `EQUIPRATING` WRITE;
/*!40000 ALTER TABLE `EQUIPRATING` DISABLE KEYS */;
INSERT INTO `EQUIPRATING` VALUES ('ALIEN',5),('ASUS',4),('DELL',4);
/*!40000 ALTER TABLE `EQUIPRATING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GENERATOR`
--

DROP TABLE IF EXISTS `GENERATOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GENERATOR` (
  `GenId` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `GenCapacity` int(11) DEFAULT NULL,
  `GenUtilization` double DEFAULT NULL,
  `ActiveAlarms` int(11) DEFAULT NULL,
  `ServiceDate` date DEFAULT NULL,
  PRIMARY KEY (`GenId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GENERATOR`
--

LOCK TABLES `GENERATOR` WRITE;
/*!40000 ALTER TABLE `GENERATOR` DISABLE KEYS */;
INSERT INTO `GENERATOR` VALUES ('GN11GP50',7,25.19,2,'2021-01-08'),('GN11GP51',5,41.62,1,'2021-01-06'),('GN11GP52',6,13.24,2,'2021-05-10'),('GN11GP53',1,74.13,7,'2021-04-30'),('GN61MP20',2,17.32,6,'2021-01-11'),('GN61MP21',4,32.87,4,'2021-06-18'),('GN71WC00',1,74.13,7,'2021-04-30'),('GN71WC01',6,13.24,2,'2021-05-10'),('GN71WC02',3,29.1,3,'2021-02-28');
/*!40000 ALTER TABLE `GENERATOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GENERFORENERGYEQUIP`
--

DROP TABLE IF EXISTS `GENERFORENERGYEQUIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GENERFORENERGYEQUIP` (
  `EquipmentId` char(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GenId` char(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `GKEE` (`EquipmentId`),
  KEY `GFKGE` (`GenId`),
  CONSTRAINT `GFKGE` FOREIGN KEY (`GenId`) REFERENCES `GENERATOR` (`GenId`),
  CONSTRAINT `GKEE` FOREIGN KEY (`EquipmentId`) REFERENCES `ENERGYEQUIPMENT` (`EquipmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GENERFORENERGYEQUIP`
--

LOCK TABLES `GENERFORENERGYEQUIP` WRITE;
/*!40000 ALTER TABLE `GENERFORENERGYEQUIP` DISABLE KEYS */;
INSERT INTO `GENERFORENERGYEQUIP` VALUES ('AC11GP112','GN11GP51'),('AC11GP112','GN11GP53'),('AC11GP113','GN11GP50'),('AC11GP112','GN11GP52'),('AC71WC211','GN71WC01'),('AC71WC210','GN71WC02'),('AC71WC210','GN71WC00'),('AC61MP311','GN61MP21'),('AC61MP311','GN61MP20');
/*!40000 ALTER TABLE `GENERFORENERGYEQUIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MODELENERGYEQUIPMENT`
--

DROP TABLE IF EXISTS `MODELENERGYEQUIPMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MODELENERGYEQUIPMENT` (
  `Model` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Rating` double DEFAULT NULL,
  PRIMARY KEY (`Model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MODELENERGYEQUIPMENT`
--

LOCK TABLES `MODELENERGYEQUIPMENT` WRITE;
/*!40000 ALTER TABLE `MODELENERGYEQUIPMENT` DISABLE KEYS */;
INSERT INTO `MODELENERGYEQUIPMENT` VALUES ('Ryobi 451cvx',8.6),('Ryobi 74Hx-6',7.2),('Ryobi 987pvc-fcl',6.9);
/*!40000 ALTER TABLE `MODELENERGYEQUIPMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MODELSERVER`
--

DROP TABLE IF EXISTS `MODELSERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MODELSERVER` (
  `Model` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ServerName` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Model`),
  KEY `ServerName` (`ServerName`),
  CONSTRAINT `MODELSERVER_ibfk_1` FOREIGN KEY (`ServerName`) REFERENCES `SERVERNAME` (`ServerName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MODELSERVER`
--

LOCK TABLES `MODELSERVER` WRITE;
/*!40000 ALTER TABLE `MODELSERVER` DISABLE KEYS */;
INSERT INTO `MODELSERVER` VALUES ('Gigabyte XC123','Dove'),('Gigabyte MT75','Hybrid'),('Samsung Y23','Hybrid'),('Samsung qn123','Lighthouse'),('Asus w123-rg12x','Maze'),('HP i123XD','Maze'),('HP acV1129','Plague'),('Samsung G230-xc12','Plague'),('HP bc213-x','Python');
/*!40000 ALTER TABLE `MODELSERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROJECT`
--

DROP TABLE IF EXISTS `PROJECT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROJECT` (
  `ProjectId` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProjectName` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Supervisor` char(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ProjectId`),
  KEY `Supervisor` (`Supervisor`),
  CONSTRAINT `PROJECT_ibfk_1` FOREIGN KEY (`Supervisor`) REFERENCES `STAFF` (`EmplId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROJECT`
--

LOCK TABLES `PROJECT` WRITE;
/*!40000 ALTER TABLE `PROJECT` DISABLE KEYS */;
INSERT INTO `PROJECT` VALUES ('IT11GP10','Project X','14023'),('IT61MP04','Project Y','20145');
/*!40000 ALTER TABLE `PROJECT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RACK`
--

DROP TABLE IF EXISTS `RACK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RACK` (
  `RackId` int(11) NOT NULL,
  `RackLabel` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VMNames` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VMCount` int(11) DEFAULT NULL,
  `Utilization` double DEFAULT NULL,
  PRIMARY KEY (`RackId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RACK`
--

LOCK TABLES `RACK` WRITE;
/*!40000 ALTER TABLE `RACK` DISABLE KEYS */;
INSERT INTO `RACK` VALUES (14,'Pizzly','Garter',40,15),(19,'Spectacled','Boas',15,45),(22,'Sloth','Taipan',14,33),(61,'Giant','Viper',12,60),(77,'Polar','Cobra',20,90),(84,'Sun','Anaconda',60,75);
/*!40000 ALTER TABLE `RACK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RECTIFIER`
--

DROP TABLE IF EXISTS `RECTIFIER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RECTIFIER` (
  `RectId` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `RectCapacity` int(11) DEFAULT NULL,
  `RectUtilization` double DEFAULT NULL,
  `ActiveAlarms` int(11) DEFAULT NULL,
  `ServiceDate` date DEFAULT NULL,
  PRIMARY KEY (`RectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RECTIFIER`
--

LOCK TABLES `RECTIFIER` WRITE;
/*!40000 ALTER TABLE `RECTIFIER` DISABLE KEYS */;
INSERT INTO `RECTIFIER` VALUES ('RC11GP50',7,25.19,2,'2021-01-08'),('RC11GP51',5,41.62,1,'2021-01-06'),('RC11GP52',6,13.24,2,'2021-05-10'),('RC11GP53',1,74.13,7,'2021-04-30'),('RC61MP20',2,17.32,6,'2021-01-11'),('RC61MP21',4,32.87,4,'2021-06-18'),('RC71WC00',1,74.13,7,'2021-04-30'),('RC71WC01',6,13.24,2,'2021-05-10'),('RC71WC02',3,29.1,3,'2021-02-28');
/*!40000 ALTER TABLE `RECTIFIER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RECTIFORENERGYEQUIP`
--

DROP TABLE IF EXISTS `RECTIFORENERGYEQUIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RECTIFORENERGYEQUIP` (
  `EquipmentId` char(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RectId` char(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `RKEE` (`EquipmentId`),
  KEY `RFKREC` (`RectId`),
  CONSTRAINT `RFKREC` FOREIGN KEY (`RectId`) REFERENCES `RECTIFIER` (`RectId`),
  CONSTRAINT `RKEE` FOREIGN KEY (`EquipmentId`) REFERENCES `ENERGYEQUIPMENT` (`EquipmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RECTIFORENERGYEQUIP`
--

LOCK TABLES `RECTIFORENERGYEQUIP` WRITE;
/*!40000 ALTER TABLE `RECTIFORENERGYEQUIP` DISABLE KEYS */;
INSERT INTO `RECTIFORENERGYEQUIP` VALUES ('AC11GP112','RC11GP51'),('AC11GP112','RC11GP53'),('AC11GP113','RC11GP50'),('AC11GP112','RC11GP52'),('AC71WC211','RC71WC01'),('AC71WC210','RC71WC02'),('AC71WC210','RC71WC00'),('AC61MP311','RC61MP21'),('AC61MP311','RC61MP20');
/*!40000 ALTER TABLE `RECTIFORENERGYEQUIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROOMS`
--

DROP TABLE IF EXISTS `ROOMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROOMS` (
  `RoomId` char(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Capacity` int(11) DEFAULT NULL,
  `Status` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RoomType` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RoomName` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`RoomId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROOMS`
--

LOCK TABLES `ROOMS` WRITE;
/*!40000 ALTER TABLE `ROOMS` DISABLE KEYS */;
INSERT INTO `ROOMS` VALUES ('GPTD74560',50,'Good','Storage','Java'),('GPTD74561',17,'Excellent','Server','COnly'),('GPTD74562',60,'Excellent','Server','CPlusPlus'),('MPTD12456',10,'Excellent','Storage','Perl'),('MPTD12457',40,'Good','Server','Lisp'),('MPTD12458',10,'Good','Server','Ruby'),('WCTC23455',50,'Average','Server','JavaScript'),('WCTC23456',20,'Excellent','Storage','PHP');
/*!40000 ALTER TABLE `ROOMS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROOMSINDC`
--

DROP TABLE IF EXISTS `ROOMSINDC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROOMSINDC` (
  `MTXId` char(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RoomId` char(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `RFKRM` (`RoomId`),
  KEY `RFKDC` (`MTXId`),
  CONSTRAINT `RFKDC` FOREIGN KEY (`MTXId`) REFERENCES `DATACENTRE` (`MTXId`),
  CONSTRAINT `RFKRM` FOREIGN KEY (`RoomId`) REFERENCES `ROOMS` (`RoomId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROOMSINDC`
--

LOCK TABLES `ROOMSINDC` WRITE;
/*!40000 ALTER TABLE `ROOMSINDC` DISABLE KEYS */;
INSERT INTO `ROOMSINDC` VALUES ('61235','MPTD12458'),('61235','MPTD12457'),('61235','MPTD12456'),('71235','WCTC23456'),('71235','WCTC23455'),('11235','GPTD74562'),('11235','GPTD74561'),('11235','GPTD74560');
/*!40000 ALTER TABLE `ROOMSINDC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SERVER`
--

DROP TABLE IF EXISTS `SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SERVER` (
  `ServerId` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `RackId` int(11) DEFAULT NULL,
  `ServerName` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SerialNumber` char(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ResponsibleStaff` char(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Vendor` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RoomId` char(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ServerId`),
  UNIQUE KEY `SerialNumber` (`SerialNumber`),
  KEY `SEFKDC` (`RoomId`),
  KEY `SEFKST` (`ResponsibleStaff`),
  KEY `RackId` (`RackId`),
  KEY `ServerName` (`ServerName`),
  CONSTRAINT `SEFKDC` FOREIGN KEY (`RoomId`) REFERENCES `ROOMS` (`RoomId`),
  CONSTRAINT `SEFKST` FOREIGN KEY (`ResponsibleStaff`) REFERENCES `STAFF` (`EmplId`),
  CONSTRAINT `SERVER_ibfk_1` FOREIGN KEY (`RackId`) REFERENCES `RACK` (`RackId`),
  CONSTRAINT `SERVER_ibfk_2` FOREIGN KEY (`ServerName`) REFERENCES `SERVERNAME` (`ServerName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SERVER`
--

LOCK TABLES `SERVER` WRITE;
/*!40000 ALTER TABLE `SERVER` DISABLE KEYS */;
INSERT INTO `SERVER` VALUES ('SV11GP10',77,'Hybrid','124-74-6','14023','Gigabyte','GPTD74562'),('SV11GP11',77,'Hybrid','42-125-9','14023','Gigabyte','GPTD74562'),('SV11GP12',77,'Hybrid','7-1240-9','14023','Gigabyte','GPTD74562'),('SV11GP13',77,'Plague','777-8413','14023','Samsumng','GPTD74561'),('SV11GP14',77,'Plague','61-7-7-9','14023','Samsung','GPTD74561'),('SV11GP15',77,'Plague','149-7-87','14023','Samsung','GPTD74561'),('SV61MP60',14,'Lighthouse','3125-741','12345','Samsung','MPTD12458'),('SV61MP61',14,'Lighthouse','14-85203','12345','Samsung','MPTD12458'),('SV61MP62',14,'Lighthouse','12-74203','12345','Samsung','MPTD12458'),('SV61MP63',14,'Dove','145-7452','12345','Gigabyte','MPTD12458'),('SV61MP64',19,'Maze','1203-758','20145','Asus','MPTD12456'),('SV71WC40',22,'Plague','1247-787','47852','Samsung','WCTC23455'),('SV71WC41',22,'Dove','58-78214','47852','Gigabyte','WCTC23455'),('SV71WC42',22,'Dove','9-74-152','47852','Gigabyte','WCTC23455'),('SV71WC43',19,'Python','12-74-94','47852','HP','WCTC23455'),('SV71WC44',19,'Python','33-745-7','47852','HP','WCTC23455');
/*!40000 ALTER TABLE `SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SERVERNAME`
--

DROP TABLE IF EXISTS `SERVERNAME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SERVERNAME` (
  `ServerName` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProcessorDetails` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ServerName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SERVERNAME`
--

LOCK TABLES `SERVERNAME` WRITE;
/*!40000 ALTER TABLE `SERVERNAME` DISABLE KEYS */;
INSERT INTO `SERVERNAME` VALUES ('Dove','AMD Ryzen 9 5900X'),('Hybrid','i7-Intel'),('Lighthouse','i5-Intel'),('Maze','AMD Ryzen Threadripper 3960X'),('Plague','17-Intel'),('Python','i5-Intel');
/*!40000 ALTER TABLE `SERVERNAME` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STAFF`
--

DROP TABLE IF EXISTS `STAFF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STAFF` (
  `Name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmplId` char(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PhoneNumber` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Department` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HoursInDataCentre` int(11) DEFAULT NULL,
  `Age` tinyint(4) DEFAULT NULL,
  `HealthStatus` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`EmplId`),
  KEY `Department` (`Department`),
  CONSTRAINT `STAFF_ibfk_1` FOREIGN KEY (`Department`) REFERENCES `DEPARTMENTS` (`DepartmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STAFF`
--

LOCK TABLES `STAFF` WRITE;
/*!40000 ALTER TABLE `STAFF` DISABLE KEYS */;
INSERT INTO `STAFF` VALUES ('Jacob van Zyl','1012 That Street, Midrand, Gauteng','10111','0814526214','TC11GP12',36,41,'Excellent'),('Njabulo Khosi','62 Down Street, The Valley, Mpumalanga','12345','0651234587','TC61MP12',51,22,'Excellent'),('Tlholo Koma','45 Long Street, Vereeniging, Gauteng','14023','0728412356','TC11GP12',45,26,'Excellent'),('Batsirai Dzimati','471 Over Street, Cosmo City, Gauteng','16012','0785146984','FC11GP05',44,29,'Excellent'),('Isheneanesu Dzingirai','10 This Avenue, Witbank, Mpumalanga','20145','0668942510','IT61MP09',62,29,'Excellent'),('Sarah Williams','521 Here Street, George, Western Cape','41203','0745214152','AM71WC01',23,25,'Good'),('Mandla Sisulu','12 Under Avenue, Alberton, Gauteng','44521','0852367412','AM11GP01',28,27,'Excellent'),('Patrick Williams','521 Here Street, George, Western Cape','47852','0812359745','IT71WC09',61,28,'Excellent');
/*!40000 ALTER TABLE `STAFF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRANSFORMER`
--

DROP TABLE IF EXISTS `TRANSFORMER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRANSFORMER` (
  `TransformerId` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TransformerRating` double DEFAULT NULL,
  `TransformerUtilization` double DEFAULT NULL,
  `EquipmentId` char(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`TransformerId`),
  KEY `EquipmentId` (`EquipmentId`),
  CONSTRAINT `TRANSFORMER_ibfk_1` FOREIGN KEY (`EquipmentId`) REFERENCES `ENERGYEQUIPMENT` (`EquipmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRANSFORMER`
--

LOCK TABLES `TRANSFORMER` WRITE;
/*!40000 ALTER TABLE `TRANSFORMER` DISABLE KEYS */;
INSERT INTO `TRANSFORMER` VALUES ('12',3.9,33.51,'AC11GP113'),('14',3.2,32.57,'AC11GP113'),('17',4,55.7,'AC11GP113'),('41',4.2,42.6,'AC71WC211'),('42',4.6,37.41,'AC71WC211'),('47',4.7,14.87,'AC71WC211'),('51',3.7,25.33,'AC71WC210'),('85',3.7,12.23,'AC61MP311'),('86',3.9,24.95,'AC61MP311'),('89',3.4,19.41,'AC61MP311'),('9',4,61.32,'AC11GP112');
/*!40000 ALTER TABLE `TRANSFORMER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UPS`
--

DROP TABLE IF EXISTS `UPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UPS` (
  `UPSNo` int(11) NOT NULL,
  `UPSCapacity` double DEFAULT NULL,
  `UPSUtilization` double DEFAULT NULL,
  `UPSStatus` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EquipmentId` char(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`UPSNo`),
  KEY `EquipmentId` (`EquipmentId`),
  CONSTRAINT `UPS_ibfk_1` FOREIGN KEY (`EquipmentId`) REFERENCES `ENERGYEQUIPMENT` (`EquipmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UPS`
--

LOCK TABLES `UPS` WRITE;
/*!40000 ALTER TABLE `UPS` DISABLE KEYS */;
INSERT INTO `UPS` VALUES (9,1340,61.32,'Poor','AC11GP112'),(12,1500,33.51,'Good','AC11GP113'),(14,1400,32.57,'Good','AC11GP113'),(17,2400,55.7,'Poor','AC11GP113'),(41,1200,42.6,'Good','AC71WC211'),(42,2230,37.41,'Excellent','AC71WC211'),(47,3600,14.87,'Excellent','AC71WC211'),(51,1140,25.33,'Good','AC71WC210'),(85,1200,12.23,'Excellent','AC61MP311'),(86,2100,24.95,'Excellent','AC61MP311'),(89,1620,19.41,'Excellent','AC61MP311');
/*!40000 ALTER TABLE `UPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WAREHOUSES`
--

DROP TABLE IF EXISTS `WAREHOUSES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WAREHOUSES` (
  `WarehouseNo` int(11) NOT NULL,
  `Capacity` int(11) DEFAULT NULL,
  `WarehouseName` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `WarehouseStatus` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MTXId` char(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`WarehouseNo`),
  KEY `WhKDC` (`MTXId`),
  CONSTRAINT `WhKDC` FOREIGN KEY (`MTXId`) REFERENCES `DATACENTRE` (`MTXId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WAREHOUSES`
--

LOCK TABLES `WAREHOUSES` WRITE;
/*!40000 ALTER TABLE `WAREHOUSES` DISABLE KEYS */;
INSERT INTO `WAREHOUSES` VALUES (60,270,'SegFault','Good','61235'),(70,100,'NullPoiner','Good','71235'),(71,100,'OutOfBounds','Excellent','71235'),(110,50,'IO','Good','11235'),(111,70,'Syntax','Excellent','11235'),(112,100,'Linkers','Excellent','11235'),(113,20,'Runtime','Bad','11235');
/*!40000 ALTER TABLE `WAREHOUSES` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-30  2:41:41
