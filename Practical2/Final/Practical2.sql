-- MariaDB dump 10.19  Distrib 10.5.9-MariaDB, for Linux (x86_64)
--
-- Host: wheatley.cs.up.ac.za    Database: u20456078_CARRENTALS
-- ------------------------------------------------------
-- Server version	10.3.27-MariaDB-0+deb10u1

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
-- Table structure for table `Cars`
--

DROP TABLE IF EXISTS `Cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cars` (
  `CarID` int(11) NOT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `YearModel` int(4) DEFAULT NULL,
  PRIMARY KEY (`CarID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cars`
--

LOCK TABLES `Cars` WRITE;
/*!40000 ALTER TABLE `Cars` DISABLE KEYS */;
INSERT INTO `Cars` VALUES (1,'Red Mercedez AMG',2020),(2,'White BMW X5',2017),(3,'Grey Mini Copper JCW',2020),(4,'Silver Toyota Corolla',2015),(5,'Yellow Honda Jazz Sport',2021),(6,'Blue Nissan Amra',2018),(7,'Orange Toyota Hilux',2020);
/*!40000 ALTER TABLE `Cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `CustomerID` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Surname` varchar(45) DEFAULT NULL,
  `Title` varchar(4) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,'Mohammed','Abraham','Mr','2 Jean Drive'),(2,'Abby','Smith','Ms','514 Mackenzie St'),(3,'Refiloe','Molete','Mrs','6 Joker St'),(4,'Corlize','Van Heerden','Ms','12 Lotus Ave'),(5,'Simone','Fourie','Dr','2 Duncan St'),(6,'Samantha','Hanna','Mrs','34 Lynwood St'),(7,'Rebecca','Duncan','Ms','111 Bondev Drive'),(8,'Gary','Lou','Mr','5555 Rands St'),(9,'Ronald','Wang','Prof','65 Quinton Ave'),(10,'Fatima','Vallee','Ms','987 Sabie Road'),(11,'Thando','Moloi','Dr','9 Lira St'),(12,'Sphesihle','Mangena','Ms','3333 Warden St'),(13,'Daniel','Alberts','Mrs','3 Peso St'),(14,'Jason','Mackenzie','Mr','98 Theo St'),(15,'Michael','Nouwens','Mr','18 De Villiers St');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer_Bike`
--

DROP TABLE IF EXISTS `Customer_Bike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer_Bike` (
  `CustID` int(11) DEFAULT NULL,
  `BID` int(11) DEFAULT NULL,
  `RentedDate` date DEFAULT NULL,
  KEY `CBFKMB` (`BID`),
  KEY `CBFKCU` (`CustID`),
  CONSTRAINT `CBFKCU` FOREIGN KEY (`CustID`) REFERENCES `Customer` (`CustomerID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CBFKMB` FOREIGN KEY (`BID`) REFERENCES `Motorbikes` (`BikeID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer_Bike`
--

LOCK TABLES `Customer_Bike` WRITE;
/*!40000 ALTER TABLE `Customer_Bike` DISABLE KEYS */;
INSERT INTO `Customer_Bike` VALUES (1,1,'2021-11-11'),(4,2,'2020-12-10'),(8,3,'2020-08-14'),(9,4,'2020-07-06'),(14,5,'2021-11-11'),(15,6,'2020-11-11'),(14,7,'2020-11-11');
/*!40000 ALTER TABLE `Customer_Bike` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer_Car`
--

DROP TABLE IF EXISTS `Customer_Car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer_Car` (
  `CustID` int(11) DEFAULT NULL,
  `CID` int(11) DEFAULT NULL,
  `RentedDate` date DEFAULT NULL,
  KEY `CCFKCA` (`CID`),
  KEY `CCFKCU` (`CustID`),
  CONSTRAINT `CCFKCA` FOREIGN KEY (`CID`) REFERENCES `Cars` (`CarID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CCFKCU` FOREIGN KEY (`CustID`) REFERENCES `Customer` (`CustomerID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer_Car`
--

LOCK TABLES `Customer_Car` WRITE;
/*!40000 ALTER TABLE `Customer_Car` DISABLE KEYS */;
INSERT INTO `Customer_Car` VALUES (1,1,'2021-11-11'),(4,2,'2020-11-09'),(8,3,'2020-02-14'),(9,4,'2020-06-06'),(14,5,'2021-11-11'),(1,6,'2021-01-01'),(4,7,'2020-11-09');
/*!40000 ALTER TABLE `Customer_Car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Motorbikes`
--

DROP TABLE IF EXISTS `Motorbikes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Motorbikes` (
  `BikeID` int(11) NOT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `YearModel` int(4) DEFAULT NULL,
  PRIMARY KEY (`BikeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Motorbikes`
--

LOCK TABLES `Motorbikes` WRITE;
/*!40000 ALTER TABLE `Motorbikes` DISABLE KEYS */;
INSERT INTO `Motorbikes` VALUES (1,'Ducati V4S',2021),(2,'BMW S1000RR',2020),(3,'Honda Fireblade SP',2018),(4,'Yamaha YZF-R1M',2015),(5,'Kawasaki Ninja H2',2017),(6,'Kawasaki ZX-10R SE',2019),(7,'Yamaha YZF-R1',2020);
/*!40000 ALTER TABLE `Motorbikes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Returned_Bike`
--

DROP TABLE IF EXISTS `Returned_Bike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Returned_Bike` (
  `CustID` int(11) DEFAULT NULL,
  `BID` int(11) DEFAULT NULL,
  `ReturnedDate` date DEFAULT NULL,
  KEY `RBFKMB` (`BID`),
  KEY `RBFKCU` (`CustID`),
  CONSTRAINT `RBFKCU` FOREIGN KEY (`CustID`) REFERENCES `Customer` (`CustomerID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `RBFKMB` FOREIGN KEY (`BID`) REFERENCES `Motorbikes` (`BikeID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Returned_Bike`
--

LOCK TABLES `Returned_Bike` WRITE;
/*!40000 ALTER TABLE `Returned_Bike` DISABLE KEYS */;
INSERT INTO `Returned_Bike` VALUES (4,2,'2020-12-14'),(9,4,'2020-08-06'),(15,6,'2021-02-14'),(14,7,'2021-01-11');
/*!40000 ALTER TABLE `Returned_Bike` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Returned_Car`
--

DROP TABLE IF EXISTS `Returned_Car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Returned_Car` (
  `CustID` int(11) DEFAULT NULL,
  `CID` int(11) DEFAULT NULL,
  `ReturnedDate` date DEFAULT NULL,
  KEY `RCFKCA` (`CID`),
  KEY `RCFKCU` (`CustID`),
  CONSTRAINT `RCFKCA` FOREIGN KEY (`CID`) REFERENCES `Cars` (`CarID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `RCFKCU` FOREIGN KEY (`CustID`) REFERENCES `Customer` (`CustomerID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Returned_Car`
--

LOCK TABLES `Returned_Car` WRITE;
/*!40000 ALTER TABLE `Returned_Car` DISABLE KEYS */;
INSERT INTO `Returned_Car` VALUES (4,2,'2020-12-14'),(8,3,'2020-02-16'),(9,4,'2020-08-06'),(4,7,'2020-12-14');
/*!40000 ALTER TABLE `Returned_Car` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-21  4:30:56
