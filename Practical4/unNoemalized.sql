-- MariaDB dump 10.19  Distrib 10.5.10-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: unnomormalisedDCIM
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
  `RoomId` char(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RoomCapacity` int(11) DEFAULT NULL,
  `Status` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RoomType` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RoomName` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `WarehouseNo` int(11) DEFAULT NULL,
  `DataCentreCapacity` int(11) DEFAULT NULL,
  `WarehouseName` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `WarehouseStatus` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MTXId`),
  KEY `DCFKST` (`PlantSpecialists`),
  CONSTRAINT `DCFKST` FOREIGN KEY (`PlantSpecialists`) REFERENCES `STAFF` (`EmplId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATACENTRE`
--

LOCK TABLES `DATACENTRE` WRITE;
/*!40000 ALTER TABLE `DATACENTRE` DISABLE KEYS */;
/*!40000 ALTER TABLE `DATACENTRE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPARTMENTS`
--

DROP TABLE IF EXISTS `DEPARTMENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEPARTMENTS` (
  `departmentId` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departmentName` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Location` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MTXId` char(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`departmentId`),
  KEY `OFKDC` (`MTXId`),
  CONSTRAINT `OFKDC` FOREIGN KEY (`MTXId`) REFERENCES `DATACENTRE` (`MTXId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPARTMENTS`
--

LOCK TABLES `DEPARTMENTS` WRITE;
/*!40000 ALTER TABLE `DEPARTMENTS` DISABLE KEYS */;
/*!40000 ALTER TABLE `DEPARTMENTS` ENABLE KEYS */;
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
  `Rating` double DEFAULT NULL,
  `Utilization` double DEFAULT NULL,
  `ServiceStatus` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CommsProtocol` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Location` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MTXId` char(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Model` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SerialNumber` char(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RectId` char(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RectCapacity` int(11) DEFAULT NULL,
  `RectUtilization` double DEFAULT NULL,
  `RectActiveAlarms` int(11) DEFAULT NULL,
  `RectServiceDate` date DEFAULT NULL,
  `UPSNo` int(11) DEFAULT NULL,
  `UPSCapacity` double DEFAULT NULL,
  `UPSUtilization` double DEFAULT NULL,
  `UPSStatus` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GenId` char(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GenCapacity` int(11) DEFAULT NULL,
  `GenUtilization` double DEFAULT NULL,
  `GenActiveAlarms` int(11) DEFAULT NULL,
  `GenServiceDate` date DEFAULT NULL,
  `TransformerId` char(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TransformerRating` double DEFAULT NULL,
  `TransformerUtilization` double DEFAULT NULL,
  PRIMARY KEY (`EquipmentId`),
  KEY `EEFKDC` (`MTXId`),
  CONSTRAINT `EEFKDC` FOREIGN KEY (`MTXId`) REFERENCES `DATACENTRE` (`MTXId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ENERGYEQUIPMENT`
--

LOCK TABLES `ENERGYEQUIPMENT` WRITE;
/*!40000 ALTER TABLE `ENERGYEQUIPMENT` DISABLE KEYS */;
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
  `Equipmentname` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SerialNumber` char(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Rating` tinyint(4) DEFAULT NULL,
  `Model` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MTXId` char(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`EquipmentId`),
  KEY `OFKD` (`MTXId`),
  CONSTRAINT `OFKD` FOREIGN KEY (`MTXId`) REFERENCES `DATACENTRE` (`MTXId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EQUIPMENTS`
--

LOCK TABLES `EQUIPMENTS` WRITE;
/*!40000 ALTER TABLE `EQUIPMENTS` DISABLE KEYS */;
/*!40000 ALTER TABLE `EQUIPMENTS` ENABLE KEYS */;
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
  `RackLabel` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Model` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SerialNumber` char(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ResponsibleStaff` char(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Utilization` double DEFAULT NULL,
  `Vendor` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VMNames` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VMCount` int(11) DEFAULT NULL,
  `ProcessorDetails` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MTXId` char(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ServerId`),
  KEY `SEFKDC` (`MTXId`),
  KEY `SEFKST` (`ResponsibleStaff`),
  CONSTRAINT `SEFKDC` FOREIGN KEY (`MTXId`) REFERENCES `DATACENTRE` (`MTXId`),
  CONSTRAINT `SEFKST` FOREIGN KEY (`ResponsibleStaff`) REFERENCES `STAFF` (`EmplId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SERVER`
--

LOCK TABLES `SERVER` WRITE;
/*!40000 ALTER TABLE `SERVER` DISABLE KEYS */;
/*!40000 ALTER TABLE `SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STAFF`
--

DROP TABLE IF EXISTS `STAFF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STAFF` (
  `Names` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmplId` char(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PhoneNumber` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Department` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmergencyContacts` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProjectId` char(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProjectName` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HoursInDataCentre` int(11) DEFAULT NULL,
  `Supervisor` char(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Age` tinyint(4) DEFAULT NULL,
  `HealthStatus` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`EmplId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STAFF`
--

LOCK TABLES `STAFF` WRITE;
/*!40000 ALTER TABLE `STAFF` DISABLE KEYS */;
/*!40000 ALTER TABLE `STAFF` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-30  3:03:43
