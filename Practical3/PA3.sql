-- MariaDB dump 10.19  Distrib 10.5.9-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: IEC_VotingSystem
-- ------------------------------------------------------
-- Server version	10.5.9-MariaDB

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
-- Table structure for table `Candidate_Party`
--

DROP TABLE IF EXISTS `Candidate_Party`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Candidate_Party` (
  `PName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Party` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Votes` int(11) DEFAULT NULL,
  PRIMARY KEY (`Party`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Candidate_Party`
--

LOCK TABLES `Candidate_Party` WRITE;
/*!40000 ALTER TABLE `Candidate_Party` DISABLE KEYS */;
/*!40000 ALTER TABLE `Candidate_Party` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Electoral_Staff`
--

DROP TABLE IF EXISTS `Electoral_Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Electoral_Staff` (
  `Emp_Id` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Job_Title` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Department` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `National_Id` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Emp_Id`),
  UNIQUE KEY `Emp_Id` (`Emp_Id`),
  UNIQUE KEY `National_Id` (`National_Id`),
  CONSTRAINT `ESFKP` FOREIGN KEY (`National_Id`) REFERENCES `Person` (`National_Id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Electoral_Staff`
--

LOCK TABLES `Electoral_Staff` WRITE;
/*!40000 ALTER TABLE `Electoral_Staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `Electoral_Staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Independent_Candidate`
--

DROP TABLE IF EXISTS `Independent_Candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Independent_Candidate` (
  `National_Id` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `National_Id` (`National_Id`),
  CONSTRAINT `ICFKP` FOREIGN KEY (`National_Id`) REFERENCES `Person` (`National_Id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Independent_Candidate`
--

LOCK TABLES `Independent_Candidate` WRITE;
/*!40000 ALTER TABLE `Independent_Candidate` DISABLE KEYS */;
/*!40000 ALTER TABLE `Independent_Candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Individual_Contestant`
--

DROP TABLE IF EXISTS `Individual_Contestant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Individual_Contestant` (
  `National_Id` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ward_Num` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Votes` int(11) DEFAULT NULL,
  `Post` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `National_Id` (`National_Id`),
  KEY `ICOFKW` (`Ward_Num`),
  CONSTRAINT `ICFKPM` FOREIGN KEY (`National_Id`) REFERENCES `Party_Member` (`National_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ICOFKIC` FOREIGN KEY (`National_Id`) REFERENCES `Independent_Candidate` (`National_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ICOFKW` FOREIGN KEY (`Ward_Num`) REFERENCES `Ward` (`Ward_Num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Individual_Contestant`
--

LOCK TABLES `Individual_Contestant` WRITE;
/*!40000 ALTER TABLE `Individual_Contestant` DISABLE KEYS */;
/*!40000 ALTER TABLE `Individual_Contestant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Municipality`
--

DROP TABLE IF EXISTS `Municipality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Municipality` (
  `MDB_Code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MType` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Province` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Num_Of_Seats` int(11) DEFAULT NULL,
  PRIMARY KEY (`MDB_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Municipality`
--

LOCK TABLES `Municipality` WRITE;
/*!40000 ALTER TABLE `Municipality` DISABLE KEYS */;
/*!40000 ALTER TABLE `Municipality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Party_Member`
--

DROP TABLE IF EXISTS `Party_Member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Party_Member` (
  `National_Id` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Party` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `National_Id` (`National_Id`),
  UNIQUE KEY `Party` (`Party`),
  CONSTRAINT `PMFKCP` FOREIGN KEY (`Party`) REFERENCES `Candidate_Party` (`Party`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `PMFKP` FOREIGN KEY (`National_Id`) REFERENCES `Person` (`National_Id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Party_Member`
--

LOCK TABLES `Party_Member` WRITE;
/*!40000 ALTER TABLE `Party_Member` DISABLE KEYS */;
/*!40000 ALTER TABLE `Party_Member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Person`
--

DROP TABLE IF EXISTS `Person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Person` (
  `National_Id` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Last_Name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `First_Name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Initials` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Sex` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Birth_Date` date DEFAULT NULL,
  `Address` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_Voted` tinyint(1) DEFAULT NULL,
  `Ward_Num` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UPassword` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`National_Id`),
  UNIQUE KEY `National_Id` (`National_Id`),
  KEY `PFKW` (`Ward_Num`),
  CONSTRAINT `PFKW` FOREIGN KEY (`Ward_Num`) REFERENCES `Ward` (`Ward_Num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Person`
--

LOCK TABLES `Person` WRITE;
/*!40000 ALTER TABLE `Person` DISABLE KEYS */;
/*!40000 ALTER TABLE `Person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Running_For`
--

DROP TABLE IF EXISTS `Running_For`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Running_For` (
  `MDB_Code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Party` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `RFFKCP` (`Party`),
  KEY `RFFKM` (`MDB_Code`),
  CONSTRAINT `RFFKCP` FOREIGN KEY (`Party`) REFERENCES `Candidate_Party` (`Party`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `RFFKM` FOREIGN KEY (`MDB_Code`) REFERENCES `Municipality` (`MDB_Code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Running_For`
--

LOCK TABLES `Running_For` WRITE;
/*!40000 ALTER TABLE `Running_For` DISABLE KEYS */;
/*!40000 ALTER TABLE `Running_For` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ward`
--

DROP TABLE IF EXISTS `Ward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ward` (
  `Ward_Num` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MDB_Code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Ward_Num`),
  UNIQUE KEY `Ward_Num` (`Ward_Num`),
  UNIQUE KEY `MDB_Code` (`MDB_Code`),
  CONSTRAINT `WFKMU` FOREIGN KEY (`MDB_Code`) REFERENCES `Municipality` (`MDB_Code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ward`
--

LOCK TABLES `Ward` WRITE;
/*!40000 ALTER TABLE `Ward` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ward` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-05 10:41:16
