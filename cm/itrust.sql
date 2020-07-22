-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: iTrust2
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

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
-- Table structure for table `AppointmentRequests`
--

DROP TABLE IF EXISTS `AppointmentRequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AppointmentRequests` (
  `id` bigint(20) NOT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `hcp_id` varchar(100) DEFAULT NULL,
  `patient_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlpa5tri2ufo8t7bt7nusa1pss` (`hcp_id`),
  KEY `FKo65c0ooyqou8d1x56y37u1nau` (`patient_id`),
  CONSTRAINT `FKlpa5tri2ufo8t7bt7nusa1pss` FOREIGN KEY (`hcp_id`) REFERENCES `Users` (`username`),
  CONSTRAINT `FKo65c0ooyqou8d1x56y37u1nau` FOREIGN KEY (`patient_id`) REFERENCES `Users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AppointmentRequests`
--

LOCK TABLES `AppointmentRequests` WRITE;
/*!40000 ALTER TABLE `AppointmentRequests` DISABLE KEYS */;
INSERT INTO `AppointmentRequests` VALUES (1638,'Test appointment please ignore','2030-11-19 04:50:00','APPROVED','GENERAL_OPHTHALMOLOGY','hcp','patient');
/*!40000 ALTER TABLE `AppointmentRequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BasicHealthMetrics`
--

DROP TABLE IF EXISTS `BasicHealthMetrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BasicHealthMetrics` (
  `id` bigint(20) NOT NULL,
  `diastolic` int(11) DEFAULT NULL,
  `hdl` int(11) DEFAULT NULL,
  `headCircumference` float DEFAULT NULL,
  `height` float DEFAULT NULL,
  `houseSmokingStatus` int(11) DEFAULT NULL,
  `ldl` int(11) DEFAULT NULL,
  `patientSmokingStatus` int(11) DEFAULT NULL,
  `systolic` int(11) DEFAULT NULL,
  `tri` int(11) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `hcp_id` varchar(100) DEFAULT NULL,
  `patient_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKd9uamofafbqloq2v2j2o4f0pg` (`hcp_id`),
  KEY `FKj6od5nqw6nvjgmpuilsfj3ad` (`patient_id`),
  CONSTRAINT `FKd9uamofafbqloq2v2j2o4f0pg` FOREIGN KEY (`hcp_id`) REFERENCES `Users` (`username`),
  CONSTRAINT `FKj6od5nqw6nvjgmpuilsfj3ad` FOREIGN KEY (`patient_id`) REFERENCES `Users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BasicHealthMetrics`
--

LOCK TABLES `BasicHealthMetrics` WRITE;
/*!40000 ALTER TABLE `BasicHealthMetrics` DISABLE KEYS */;
INSERT INTO `BasicHealthMetrics` VALUES (14,150,75,NULL,75,1,75,1,150,300,130,'hcp','AliceThirteen'),(28,100,75,NULL,75,1,NULL,NULL,NULL,NULL,NULL,'hcp','AliceThirteen'),(37,150,75,NULL,75,1,75,1,150,300,130,'hcp','patient'),(44,150,75,NULL,75,1,75,1,150,300,130,'hcp','patient'),(49,100,75,NULL,75,1,NULL,NULL,NULL,NULL,NULL,'hcp','AliceThirteen'),(61,150,NULL,NULL,75,1,NULL,NULL,NULL,NULL,130,'bobbyOD','AliceThirteen'),(63,150,75,NULL,75,1,75,1,150,300,130,'bobbyOD','AliceThirteen'),(86,150,75,NULL,75,1,75,1,150,300,130,'bobbyOD','AliceThirteen'),(99,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'hcp','patient'),(105,83,70,20,69.1,3,30,2,102,150,175.2,'hcp','antti'),(706,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'hcp','patient'),(711,83,70,20,69.1,3,30,2,102,150,175.2,'hcp','antti'),(717,100,75,NULL,75,1,NULL,NULL,NULL,NULL,NULL,'hcp','AliceThirteen'),(734,100,75,NULL,75,1,NULL,NULL,NULL,NULL,NULL,'hcp','AliceThirteen'),(753,100,75,NULL,75,1,NULL,NULL,NULL,NULL,NULL,'hcp','AliceThirteen'),(771,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'hcp','patient'),(776,83,70,20,69.1,3,30,2,102,150,175.2,'hcp','antti'),(788,1,1,NULL,1,1,1,2,1,100,1,'hcp','patient'),(796,1,1,NULL,1,1,1,2,1,100,1,'hcp','patient'),(800,1,1,NULL,1,1,1,2,1,100,1,'hcp','patient'),(822,1,1,NULL,1,1,1,1,1,100,1,'hcp','onionman'),(834,1,1,NULL,1,1,1,1,1,100,1,'hcp','onionman'),(847,1,1,NULL,1,1,1,1,1,100,1,'hcp','onionman'),(860,1,1,NULL,1,1,1,1,1,100,1,'hcp','onionman'),(880,150,75,NULL,75,1,75,1,150,300,130,'hcp','AliceThirteen'),(894,100,75,NULL,75,1,NULL,NULL,NULL,NULL,NULL,'hcp','AliceThirteen'),(903,150,75,NULL,75,1,75,1,150,300,130,'hcp','patient'),(910,150,75,NULL,75,1,75,1,150,300,130,'hcp','patient'),(915,100,75,NULL,75,1,NULL,NULL,NULL,NULL,NULL,'hcp','AliceThirteen'),(927,150,NULL,NULL,75,1,NULL,NULL,NULL,NULL,130,'bobbyOD','AliceThirteen'),(929,150,75,NULL,75,1,75,1,150,300,130,'bobbyOD','AliceThirteen'),(952,150,75,NULL,75,1,75,1,150,300,130,'bobbyOD','AliceThirteen'),(964,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'hcp','patient'),(969,83,70,20,69.1,3,30,2,102,150,175.2,'hcp','antti'),(1564,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'hcp','patient'),(1569,83,70,20,69.1,3,30,2,102,150,175.2,'hcp','antti'),(1575,100,75,NULL,75,1,NULL,NULL,NULL,NULL,NULL,'hcp','AliceThirteen'),(1592,100,75,NULL,75,1,NULL,NULL,NULL,NULL,NULL,'hcp','AliceThirteen'),(1611,100,75,NULL,75,1,NULL,NULL,NULL,NULL,NULL,'hcp','AliceThirteen'),(1629,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'hcp','patient'),(1634,83,70,20,69.1,3,30,2,102,150,175.2,'hcp','antti'),(1646,1,1,NULL,1,1,1,2,1,100,1,'hcp','patient'),(1654,1,1,NULL,1,1,1,2,1,100,1,'hcp','patient'),(1658,1,1,NULL,1,1,1,2,1,100,1,'hcp','patient'),(1680,1,1,NULL,1,1,1,1,1,100,1,'hcp','onionman'),(1692,1,1,NULL,1,1,1,1,1,100,1,'hcp','onionman'),(1705,1,1,NULL,1,1,1,1,1,100,1,'hcp','onionman'),(1718,1,1,NULL,1,1,1,1,1,100,1,'hcp','onionman');
/*!40000 ALTER TABLE `BasicHealthMetrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BloodSugarDiaryEntries`
--

DROP TABLE IF EXISTS `BloodSugarDiaryEntries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BloodSugarDiaryEntries` (
  `id` bigint(20) NOT NULL,
  `date` datetime DEFAULT NULL,
  `fastingLevel` int(11) DEFAULT NULL,
  `firstLevel` int(11) DEFAULT NULL,
  `secondLevel` int(11) DEFAULT NULL,
  `thirdLevel` int(11) DEFAULT NULL,
  `patient_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKg2lof8kd38p2vv48wdm9capi6` (`patient_id`),
  CONSTRAINT `FKg2lof8kd38p2vv48wdm9capi6` FOREIGN KEY (`patient_id`) REFERENCES `Patients` (`self_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BloodSugarDiaryEntries`
--

LOCK TABLES `BloodSugarDiaryEntries` WRITE;
/*!40000 ALTER TABLE `BloodSugarDiaryEntries` DISABLE KEYS */;
/*!40000 ALTER TABLE `BloodSugarDiaryEntries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BloodSugarLimits`
--

DROP TABLE IF EXISTS `BloodSugarLimits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BloodSugarLimits` (
  `id` bigint(20) NOT NULL,
  `fastingLimit` int(11) NOT NULL,
  `mealLimit` int(11) NOT NULL,
  `patient_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrg3yjyrsjd5ceohxphsskxb2o` (`patient_id`),
  CONSTRAINT `FKrg3yjyrsjd5ceohxphsskxb2o` FOREIGN KEY (`patient_id`) REFERENCES `Patients` (`self_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BloodSugarLimits`
--

LOCK TABLES `BloodSugarLimits` WRITE;
/*!40000 ALTER TABLE `BloodSugarLimits` DISABLE KEYS */;
/*!40000 ALTER TABLE `BloodSugarLimits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Diagnoses`
--

DROP TABLE IF EXISTS `Diagnoses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Diagnoses` (
  `id` bigint(20) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `code_id` bigint(20) DEFAULT NULL,
  `visit_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKthsk14tdxoeeadlpvkot8fdhb` (`code_id`),
  KEY `FKjm5cnpdmv6x9iajrypt72lguy` (`visit_id`),
  CONSTRAINT `FKjm5cnpdmv6x9iajrypt72lguy` FOREIGN KEY (`visit_id`) REFERENCES `GeneralCheckups` (`id`),
  CONSTRAINT `FKthsk14tdxoeeadlpvkot8fdhb` FOREIGN KEY (`code_id`) REFERENCES `ICDCodes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Diagnoses`
--

LOCK TABLES `Diagnoses` WRITE;
/*!40000 ALTER TABLE `Diagnoses` DISABLE KEYS */;
INSERT INTO `Diagnoses` VALUES (1721,'This guy needs some Sunny D stat!',1717,1719),(1723,'This guy is poisoned!  Quick, eat some purple moss!',1716,1719);
/*!40000 ALTER TABLE `Diagnoses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Drugs`
--

DROP TABLE IF EXISTS `Drugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Drugs` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Drugs`
--

LOCK TABLES `Drugs` WRITE;
/*!40000 ALTER TABLE `Drugs` DISABLE KEYS */;
INSERT INTO `Drugs` VALUES (5,'1000-0001-10','atypical antipsychotic and antidepressant','Quetiane Fumarate'),(22,'1234-4321-89','Lithium Compounds','Li2O8'),(30,'1234-4321-89','Lithium Compounds','Li2O8'),(51,'1234-4321-89','Lithium Compounds','Li2O8'),(690,'0000-0000-20','DESC','TEST'),(719,'1234-4321-89','Lithium Compounds','Li2O8'),(736,'1234-4321-89','Lithium Compounds','Li2O8'),(755,'1234-4321-89','Lithium Compounds','Li2O8'),(816,'1111-2222-33','Estus to heal up those wounds!','Sunny D'),(818,'3333-2222-11','Medicinal purple moss clump.\nReduces poison build-up. Cures poison.','Purple Moss'),(828,'1111-2222-33','Estus to heal up those wounds!','Sunny D'),(830,'3333-2222-11','Medicinal purple moss clump.\nReduces poison build-up. Cures poison.','Purple Moss'),(841,'1111-2222-33','Estus to heal up those wounds!','Sunny D'),(843,'3333-2222-11','Medicinal purple moss clump.\nReduces poison build-up. Cures poison.','Purple Moss'),(854,'1111-2222-33','Estus to heal up those wounds!','Sunny D'),(856,'3333-2222-11','Medicinal purple moss clump.\nReduces poison build-up. Cures poison.','Purple Moss'),(888,'1234-4321-89','Lithium Compounds','Li2O8'),(896,'1234-4321-89','Lithium Compounds','Li2O8'),(917,'1234-4321-89','Lithium Compounds','Li2O8'),(1577,'1234-4321-89','Lithium Compounds','Li2O8'),(1594,'1234-4321-89','Lithium Compounds','Li2O8'),(1613,'1234-4321-89','Lithium Compounds','Li2O8'),(1674,'1111-2222-33','Estus to heal up those wounds!','Sunny D'),(1676,'3333-2222-11','Medicinal purple moss clump.\nReduces poison build-up. Cures poison.','Purple Moss'),(1686,'1111-2222-33','Estus to heal up those wounds!','Sunny D'),(1688,'3333-2222-11','Medicinal purple moss clump.\nReduces poison build-up. Cures poison.','Purple Moss'),(1699,'1111-2222-33','Estus to heal up those wounds!','Sunny D'),(1701,'3333-2222-11','Medicinal purple moss clump.\nReduces poison build-up. Cures poison.','Purple Moss'),(1712,'1111-2222-33','Estus to heal up those wounds!','Sunny D'),(1714,'3333-2222-11','Medicinal purple moss clump.\nReduces poison build-up. Cures poison.','Purple Moss');
/*!40000 ALTER TABLE `Drugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FoodDiaryEntry`
--

DROP TABLE IF EXISTS `FoodDiaryEntry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FoodDiaryEntry` (
  `id` bigint(20) NOT NULL,
  `calories` int(11) DEFAULT NULL,
  `carbs` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `fat` int(11) DEFAULT NULL,
  `fiber` int(11) DEFAULT NULL,
  `food` varchar(255) DEFAULT NULL,
  `mealType` varchar(255) DEFAULT NULL,
  `patient` varchar(255) DEFAULT NULL,
  `protein` int(11) DEFAULT NULL,
  `servings` int(11) DEFAULT NULL,
  `sodium` int(11) DEFAULT NULL,
  `sugars` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FoodDiaryEntry`
--

LOCK TABLES `FoodDiaryEntry` WRITE;
/*!40000 ALTER TABLE `FoodDiaryEntry` DISABLE KEYS */;
INSERT INTO `FoodDiaryEntry` VALUES (933,900,100,'2018-09-02 19:00:00',30,40,'Peanut Butter and Jelly Sandwich','Lunch','patient',10,1,60,50),(934,100,10,'2018-09-02 19:00:00',10,10,'Peanut Butter','Lunch','patient',30,1,20,10),(1671,900,100,'2018-09-02 19:00:00',30,40,'Peanut Butter and Jelly Sandwich','Lunch','patient',10,1,60,50);
/*!40000 ALTER TABLE `FoodDiaryEntry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GeneralCheckups`
--

DROP TABLE IF EXISTS `GeneralCheckups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GeneralCheckups` (
  `id` bigint(20) NOT NULL,
  `date` datetime DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `appointment_id` bigint(20) DEFAULT NULL,
  `basichealthmetrics_id` bigint(20) DEFAULT NULL,
  `hcp_id` varchar(100) DEFAULT NULL,
  `hospital_id` varchar(100) DEFAULT NULL,
  `patient_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKtgti6uflcm2q9uvfx4obmpwv4` (`appointment_id`),
  KEY `FKqtpf2nfiuf47019rc8gnaeb6v` (`basichealthmetrics_id`),
  KEY `FKplofss0lwup9mbnu0abrtalxx` (`hcp_id`),
  KEY `FK9tghbxo0xq6bba8p1rp7rbecg` (`hospital_id`),
  KEY `FK5fa5nrrfo22p8q5xiptgh83x5` (`patient_id`),
  CONSTRAINT `FK5fa5nrrfo22p8q5xiptgh83x5` FOREIGN KEY (`patient_id`) REFERENCES `Users` (`username`),
  CONSTRAINT `FK9tghbxo0xq6bba8p1rp7rbecg` FOREIGN KEY (`hospital_id`) REFERENCES `Hospitals` (`name`),
  CONSTRAINT `FKplofss0lwup9mbnu0abrtalxx` FOREIGN KEY (`hcp_id`) REFERENCES `Users` (`username`),
  CONSTRAINT `FKqtpf2nfiuf47019rc8gnaeb6v` FOREIGN KEY (`basichealthmetrics_id`) REFERENCES `BasicHealthMetrics` (`id`),
  CONSTRAINT `FKtgti6uflcm2q9uvfx4obmpwv4` FOREIGN KEY (`appointment_id`) REFERENCES `AppointmentRequests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GeneralCheckups`
--

LOCK TABLES `GeneralCheckups` WRITE;
/*!40000 ALTER TABLE `GeneralCheckups` DISABLE KEYS */;
INSERT INTO `GeneralCheckups` VALUES (1719,'2048-04-20 15:20:00','Office Visit For SiegwardOf Catarina','GENERAL_CHECKUP',NULL,1718,'hcp','General Hospital','onionman');
/*!40000 ALTER TABLE `GeneralCheckups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GeneralOphthalmology`
--

DROP TABLE IF EXISTS `GeneralOphthalmology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GeneralOphthalmology` (
  `id` bigint(20) NOT NULL,
  `date` datetime DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `axisOD` int(11) DEFAULT NULL,
  `axisOS` int(11) DEFAULT NULL,
  `cylinderOD` double DEFAULT NULL,
  `cylinderOS` double DEFAULT NULL,
  `sphereOD` double DEFAULT NULL,
  `sphereOS` double DEFAULT NULL,
  `visualAcuityOD` int(11) DEFAULT NULL,
  `visualAcuityOS` int(11) DEFAULT NULL,
  `diagnosis` varchar(255) DEFAULT NULL,
  `appointment_id` bigint(20) DEFAULT NULL,
  `basichealthmetrics_id` bigint(20) DEFAULT NULL,
  `hcp_id` varchar(100) DEFAULT NULL,
  `hospital_id` varchar(100) DEFAULT NULL,
  `patient_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKtcx79uvv1o4wrp9xqdk3hcap2` (`appointment_id`),
  KEY `FK6svu0my7r662s5sn2d7cgf1jq` (`basichealthmetrics_id`),
  KEY `FKfeh4gtxe0s4kr52i7u5i8tkum` (`hcp_id`),
  KEY `FKc5kn71vr8tbt5ty5cc7pfrbgf` (`hospital_id`),
  KEY `FKr2whnupl6f7k12gx78f5lhdx9` (`patient_id`),
  CONSTRAINT `FK6svu0my7r662s5sn2d7cgf1jq` FOREIGN KEY (`basichealthmetrics_id`) REFERENCES `BasicHealthMetrics` (`id`),
  CONSTRAINT `FKc5kn71vr8tbt5ty5cc7pfrbgf` FOREIGN KEY (`hospital_id`) REFERENCES `Hospitals` (`name`),
  CONSTRAINT `FKfeh4gtxe0s4kr52i7u5i8tkum` FOREIGN KEY (`hcp_id`) REFERENCES `Users` (`username`),
  CONSTRAINT `FKr2whnupl6f7k12gx78f5lhdx9` FOREIGN KEY (`patient_id`) REFERENCES `Users` (`username`),
  CONSTRAINT `FKtcx79uvv1o4wrp9xqdk3hcap2` FOREIGN KEY (`appointment_id`) REFERENCES `AppointmentRequests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GeneralOphthalmology`
--

LOCK TABLES `GeneralOphthalmology` WRITE;
/*!40000 ALTER TABLE `GeneralOphthalmology` DISABLE KEYS */;
/*!40000 ALTER TABLE `GeneralOphthalmology` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hospitals`
--

DROP TABLE IF EXISTS `Hospitals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Hospitals` (
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hospitals`
--

LOCK TABLES `Hospitals` WRITE;
/*!40000 ALTER TABLE `Hospitals` DISABLE KEYS */;
INSERT INTO `Hospitals` VALUES ('Dr. Jenkins\' Insane Asylum','123 Main St','NC','12345'),('General Hospital','123 Main St','NC','12345'),('iTrust Test Hospital','2770 Wolf Village Drive, Raleigh','NC','27607'),('iTrust Test Hospital 2','1 iTrust Test Street','NC','27607');
/*!40000 ALTER TABLE `Hospitals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ICDCodes`
--

DROP TABLE IF EXISTS `ICDCodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ICDCodes` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ICDCodes`
--

LOCK TABLES `ICDCodes` WRITE;
/*!40000 ALTER TABLE `ICDCodes` DISABLE KEYS */;
INSERT INTO `ICDCodes` VALUES (6,'E11.9','Type 2 Diabetes'),(7,'R73.03','Prediabetes'),(16,'A21','Top Quality'),(29,'A21','Top Quality'),(50,'A21','Top Quality'),(718,'A21','Top Quality'),(735,'A21','Top Quality'),(749,'E11.9','Type 2 Diabetes'),(750,'R73.03','Prediabetes'),(754,'A21','Top Quality'),(783,'T10','Test 10'),(785,'T10','Test 10'),(820,'T49','Poisoned by topical agents.  Probably in Blighttown'),(821,'S34','Injury of lumbar and sacral spinal cord.  Probably carrying teammates.'),(832,'T49','Poisoned by topical agents.  Probably in Blighttown'),(833,'S34','Injury of lumbar and sacral spinal cord.  Probably carrying teammates.'),(845,'T49','Poisoned by topical agents.  Probably in Blighttown'),(846,'S34','Injury of lumbar and sacral spinal cord.  Probably carrying teammates.'),(858,'T49','Poisoned by topical agents.  Probably in Blighttown'),(859,'S34','Injury of lumbar and sacral spinal cord.  Probably carrying teammates.'),(882,'A21','Top Quality'),(895,'A21','Top Quality'),(916,'A21','Top Quality'),(1576,'A21','Top Quality'),(1593,'A21','Top Quality'),(1607,'E11.9','Type 2 Diabetes'),(1608,'R73.03','Prediabetes'),(1612,'A21','Top Quality'),(1641,'T10','Test 10'),(1643,'T10','Test 10'),(1678,'T49','Poisoned by topical agents.  Probably in Blighttown'),(1679,'S34','Injury of lumbar and sacral spinal cord.  Probably carrying teammates.'),(1690,'T49','Poisoned by topical agents.  Probably in Blighttown'),(1691,'S34','Injury of lumbar and sacral spinal cord.  Probably carrying teammates.'),(1703,'T49','Poisoned by topical agents.  Probably in Blighttown'),(1704,'S34','Injury of lumbar and sacral spinal cord.  Probably carrying teammates.'),(1716,'T49','Poisoned by topical agents.  Probably in Blighttown'),(1717,'S34','Injury of lumbar and sacral spinal cord.  Probably carrying teammates.');
/*!40000 ALTER TABLE `ICDCodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LOINCCodes`
--

DROP TABLE IF EXISTS `LOINCCodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LOINCCodes` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `commonName` varchar(255) DEFAULT NULL,
  `component` varchar(255) DEFAULT NULL,
  `property` varchar(255) DEFAULT NULL,
  `scale` varchar(255) DEFAULT NULL,
  `result_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKg096u65wbjmwxny136tptntlr` (`result_id`),
  CONSTRAINT `FKg096u65wbjmwxny136tptntlr` FOREIGN KEY (`result_id`) REFERENCES `LOINCResult` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOINCCodes`
--

LOCK TABLES `LOINCCodes` WRITE;
/*!40000 ALTER TABLE `LOINCCodes` DISABLE KEYS */;
INSERT INTO `LOINCCodes` VALUES (1574,'12345-1','Jump around','Jump jump jump','JUMP','NONE',NULL),(1591,'12345-1','Jump around','Jump jump jump','JUMP','NONE',NULL),(1610,'20436-2','Glucose 2 Hr After Glucose, Blood','Glucose^2H post dose glucose','MCnc','QUANTITATIVE',1609);
/*!40000 ALTER TABLE `LOINCCodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LOINCResult`
--

DROP TABLE IF EXISTS `LOINCResult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LOINCResult` (
  `DTYPE` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOINCResult`
--

LOCK TABLES `LOINCResult` WRITE;
/*!40000 ALTER TABLE `LOINCResult` DISABLE KEYS */;
INSERT INTO `LOINCResult` VALUES ('QuantitativeLOINCResult',926),('QuantitativeLOINCResult',1609);
/*!40000 ALTER TABLE `LOINCResult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LabProcedures`
--

DROP TABLE IF EXISTS `LabProcedures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LabProcedures` (
  `id` bigint(20) NOT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `result` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `labtech` varchar(100) DEFAULT NULL,
  `LOINC_code` bigint(20) DEFAULT NULL,
  `patient` varchar(100) DEFAULT NULL,
  `suggestedDiagnosis` bigint(20) DEFAULT NULL,
  `visit` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKn8ctd2oj7knwaxxfakrmwybj6` (`labtech`),
  KEY `FKq97sa9kb1vkse9jbn0s38drei` (`LOINC_code`),
  KEY `FKd9netwr78cspphyqtctsdy9cl` (`patient`),
  KEY `FKev74nk6ig1t5h0i4h4tg5ar9q` (`suggestedDiagnosis`),
  KEY `FKf1qdex4yna7yac0e29xylgqt7` (`visit`),
  CONSTRAINT `FKd9netwr78cspphyqtctsdy9cl` FOREIGN KEY (`patient`) REFERENCES `Users` (`username`),
  CONSTRAINT `FKev74nk6ig1t5h0i4h4tg5ar9q` FOREIGN KEY (`suggestedDiagnosis`) REFERENCES `ICDCodes` (`id`),
  CONSTRAINT `FKf1qdex4yna7yac0e29xylgqt7` FOREIGN KEY (`visit`) REFERENCES `GeneralCheckups` (`id`),
  CONSTRAINT `FKn8ctd2oj7knwaxxfakrmwybj6` FOREIGN KEY (`labtech`) REFERENCES `Users` (`username`),
  CONSTRAINT `FKq97sa9kb1vkse9jbn0s38drei` FOREIGN KEY (`LOINC_code`) REFERENCES `LOINCCodes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LabProcedures`
--

LOCK TABLES `LabProcedures` WRITE;
/*!40000 ALTER TABLE `LabProcedures` DISABLE KEYS */;
/*!40000 ALTER TABLE `LabProcedures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LogEntries`
--

DROP TABLE IF EXISTS `LogEntries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LogEntries` (
  `id` bigint(20) NOT NULL,
  `logCode` int(11) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `primaryUser` varchar(255) DEFAULT NULL,
  `secondaryUser` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LogEntries`
--

LOCK TABLES `LogEntries` WRITE;
/*!40000 ALTER TABLE `LogEntries` DISABLE KEYS */;
INSERT INTO `LogEntries` VALUES (17,41,'edu.ncsu.csc.itrust2.models.persistent.User@9d1bd1da created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@c9f556c9','hcp','AliceThirteen','2020-07-22 11:40:48'),(20,75,'edu.ncsu.csc.itrust2.models.persistent.User@9d1bd1da created a Lab Procedure for edu.ncsu.csc.itrust2.models.persistent.User@c9f556c9','hcp','AliceThirteen','2020-07-22 11:40:49'),(24,48,'Creating prescription with id 23','SPRING_API_TEST_USER','AliceThirteen','2020-07-22 11:40:49'),(25,43,'edu.ncsu.csc.itrust2.models.persistent.User@9d1bd1da deleted a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@c9f556c9','hcp','AliceThirteen','2020-07-22 11:40:49'),(26,77,'hcp deleted a Lab Procedure for AliceThirteen','hcp','AliceThirteen','2020-07-22 11:40:49'),(32,48,'Creating prescription with id 31','SPRING_API_TEST_USER','AliceThirteen','2020-07-22 11:40:50'),(34,41,'edu.ncsu.csc.itrust2.models.persistent.User@c9f556c9 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@c9f556c9','AliceThirteen',NULL,'2020-07-22 11:40:50'),(53,48,'Creating prescription with id 52','SPRING_API_TEST_USER','AliceThirteen','2020-07-22 11:40:51'),(55,41,'edu.ncsu.csc.itrust2.models.persistent.User@c9f556c9 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@c9f556c9','AliceThirteen',NULL,'2020-07-22 11:40:51'),(69,19,'test log entry with patient and hcp','logPatient','logHcp','2020-07-22 11:40:53'),(70,15,NULL,'logAdmin',NULL,'2020-07-22 11:40:53'),(71,1,'login succeeded for logPatient.','logPatient',NULL,'2020-07-22 11:40:53'),(72,1,'login succeeded for dupUser.','dupUser',NULL,'2020-07-22 11:40:53'),(85,1,'User has logged in','test',NULL,'2020-07-22 11:40:56'),(89,33,'admin created an ICD Code','admin',NULL,'2020-07-22 11:41:02'),(90,36,'Fetched icd code with id 88','admin',NULL,'2020-07-22 11:41:02'),(91,35,'admin edited an ICD Code','admin',NULL,'2020-07-22 11:41:02'),(92,36,'Fetched icd code with id 88','admin',NULL,'2020-07-22 11:41:02'),(93,34,'admin deleted an ICD Code','admin',NULL,'2020-07-22 11:41:02'),(95,20,NULL,'patient','hcp','2020-07-22 11:41:03'),(96,30,NULL,'bobbyOD',NULL,'2020-07-22 11:41:03'),(97,15,NULL,'patient',NULL,'2020-07-22 11:41:03'),(98,30,NULL,'patient',NULL,'2020-07-22 11:41:03'),(101,94,'patient','patient',NULL,'2020-07-22 11:41:03'),(102,7,NULL,'patient','antti','2020-07-22 11:41:03'),(103,97,NULL,'patient',NULL,'2020-07-22 11:41:04'),(104,96,'hcp updated basic health metrics for antti from 2048-04-16T09:45:00.000-04:00','hcp','antti','2020-07-22 11:41:04'),(106,96,NULL,'patient',NULL,'2020-07-22 11:41:04'),(107,98,NULL,'patient',NULL,'2020-07-22 11:41:04'),(108,30,NULL,'patient',NULL,'2020-07-22 11:41:04'),(109,5,NULL,'logapitest',NULL,'2020-07-22 11:41:04'),(110,5,NULL,'logapitest',NULL,'2020-07-22 11:41:04'),(111,5,NULL,'logapitest',NULL,'2020-07-22 11:41:04'),(112,5,NULL,'logapitest',NULL,'2020-07-22 11:41:04'),(113,5,NULL,'logapitest',NULL,'2020-07-22 11:41:04'),(114,5,NULL,'logapitest',NULL,'2020-07-22 11:41:04'),(115,5,NULL,'logapitest',NULL,'2020-07-22 11:41:04'),(116,5,NULL,'logapitest',NULL,'2020-07-22 11:41:04'),(117,5,NULL,'logapitest',NULL,'2020-07-22 11:41:04'),(118,5,NULL,'logapitest',NULL,'2020-07-22 11:41:04'),(119,5,NULL,'logapitest',NULL,'2020-07-22 11:41:04'),(120,5,NULL,'logapitest',NULL,'2020-07-22 11:41:04'),(121,5,NULL,'logapitest',NULL,'2020-07-22 11:41:04'),(122,5,NULL,'logapitest',NULL,'2020-07-22 11:41:04'),(123,5,NULL,'logapitest',NULL,'2020-07-22 11:41:04'),(124,5,NULL,'logapitest',NULL,'2020-07-22 11:41:04'),(125,5,NULL,'logapitest',NULL,'2020-07-22 11:41:04'),(126,5,NULL,'logapitest',NULL,'2020-07-22 11:41:04'),(127,5,NULL,'logapitest',NULL,'2020-07-22 11:41:04'),(128,5,NULL,'logapitest',NULL,'2020-07-22 11:41:04'),(129,5,NULL,'logapitest',NULL,'2020-07-22 11:41:04'),(130,5,NULL,'logapitest',NULL,'2020-07-22 11:41:04'),(131,5,NULL,'logapitest',NULL,'2020-07-22 11:41:04'),(132,5,NULL,'logapitest',NULL,'2020-07-22 11:41:04'),(133,5,NULL,'logapitest',NULL,'2020-07-22 11:41:04'),(134,5,NULL,'logapitest',NULL,'2020-07-22 11:41:04'),(135,5,NULL,'logapitest',NULL,'2020-07-22 11:41:04'),(136,5,NULL,'logapitest',NULL,'2020-07-22 11:41:04'),(137,5,NULL,'logapitest',NULL,'2020-07-22 11:41:04'),(138,5,NULL,'logapitest',NULL,'2020-07-22 11:41:04'),(139,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(140,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(141,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(142,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(143,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(144,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(145,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(146,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(147,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(148,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(149,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(150,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(151,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(152,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(153,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(154,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(155,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(156,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(157,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(158,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(159,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(160,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(161,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(162,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(163,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(164,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(165,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(166,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(167,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(168,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(169,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(170,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(171,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(172,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(173,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(174,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(175,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(176,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(177,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(178,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(179,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(180,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(181,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(182,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(183,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(184,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(185,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(186,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(187,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(188,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(189,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(190,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(191,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(192,5,NULL,'logapitest',NULL,'2020-07-22 11:41:05'),(193,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(194,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(195,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(196,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(197,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(198,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(199,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(200,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(201,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(202,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(203,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(204,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(205,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(206,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(207,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(208,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(209,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(210,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(211,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(212,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(213,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(214,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(215,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(216,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(217,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(218,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(219,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(220,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(221,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(222,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(223,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(224,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(225,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(226,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(227,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(228,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(229,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(230,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(231,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(232,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(233,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(234,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(235,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(236,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(237,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(238,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(239,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(240,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(241,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(242,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(243,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(244,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(245,5,NULL,'logapitest',NULL,'2020-07-22 11:41:06'),(246,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(247,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(248,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(249,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(250,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(251,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(252,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(253,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(254,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(255,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(256,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(257,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(258,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(259,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(260,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(261,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(262,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(263,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(264,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(265,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(266,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(267,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(268,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(269,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(270,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(271,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(272,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(273,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(274,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(275,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(276,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(277,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(278,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(279,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(280,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(281,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(282,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(283,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(284,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(285,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(286,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(287,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(288,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(289,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(290,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(291,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(292,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(293,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(294,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(295,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(296,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(297,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(298,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(299,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(300,5,NULL,'logapitest',NULL,'2020-07-22 11:41:07'),(301,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(302,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(303,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(304,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(305,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(306,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(307,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(308,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(309,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(310,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(311,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(312,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(313,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(314,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(315,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(316,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(317,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(318,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(319,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(320,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(321,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(322,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(323,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(324,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(325,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(326,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(327,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(328,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(329,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(330,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(331,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(332,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(333,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(334,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(335,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(336,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(337,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(338,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(339,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(340,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(341,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(342,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(343,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(344,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(345,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(346,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(347,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(348,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(349,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(350,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(351,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(352,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(353,5,NULL,'logapitest',NULL,'2020-07-22 11:41:08'),(354,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(355,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(356,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(357,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(358,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(359,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(360,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(361,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(362,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(363,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(364,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(365,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(366,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(367,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(368,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(369,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(370,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(371,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(372,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(373,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(374,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(375,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(376,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(377,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(378,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(379,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(380,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(381,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(382,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(383,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(384,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(385,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(386,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(387,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(388,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(389,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(390,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(391,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(392,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(393,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(394,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(395,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(396,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(397,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(398,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(399,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(400,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(401,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(402,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(403,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(404,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(405,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(406,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(407,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(408,5,NULL,'logapitest',NULL,'2020-07-22 11:41:09'),(409,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(410,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(411,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(412,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(413,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(414,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(415,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(416,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(417,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(418,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(419,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(420,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(421,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(422,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(423,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(424,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(425,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(426,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(427,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(428,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(429,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(430,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(431,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(432,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(433,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(434,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(435,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(436,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(437,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(438,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(439,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(440,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(441,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(442,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(443,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(444,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(445,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(446,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(447,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(448,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(449,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(450,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(451,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(452,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(453,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(454,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(455,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(456,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(457,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(458,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(459,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(460,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(461,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(462,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(463,5,NULL,'logapitest',NULL,'2020-07-22 11:41:10'),(464,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(465,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(466,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(467,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(468,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(469,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(470,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(471,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(472,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(473,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(474,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(475,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(476,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(477,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(478,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(479,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(480,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(481,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(482,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(483,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(484,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(485,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(486,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(487,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(488,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(489,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(490,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(491,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(492,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(493,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(494,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(495,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(496,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(497,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(498,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(499,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(500,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(501,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(502,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(503,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(504,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(505,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(506,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(507,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(508,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(509,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(510,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(511,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(512,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(513,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(514,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(515,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(516,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(517,5,NULL,'logapitest',NULL,'2020-07-22 11:41:11'),(518,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(519,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(520,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(521,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(522,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(523,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(524,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(525,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(526,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(527,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(528,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(529,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(530,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(531,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(532,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(533,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(534,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(535,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(536,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(537,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(538,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(539,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(540,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(541,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(542,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(543,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(544,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(545,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(546,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(547,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(548,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(549,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(550,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(551,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(552,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(553,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(554,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(555,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(556,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(557,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(558,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(559,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(560,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(561,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(562,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(563,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(564,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(565,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(566,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(567,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(568,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(569,5,NULL,'logapitest',NULL,'2020-07-22 11:41:12'),(570,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(571,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(572,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(573,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(574,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(575,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(576,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(577,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(578,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(579,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(580,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(581,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(582,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(583,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(584,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(585,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(586,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(587,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(588,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(589,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(590,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(591,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(592,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(593,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(594,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(595,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(596,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(597,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(598,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(599,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(600,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(601,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(602,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(603,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(604,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(605,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(606,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(607,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(608,5,NULL,'logapitest',NULL,'2020-07-22 11:41:13'),(609,58,NULL,'admin',NULL,'2020-07-22 11:41:13'),(611,14,NULL,'patientPW',NULL,'2020-07-22 11:41:14'),(612,54,'Successfully changed password for user patientPW','patientPW',NULL,'2020-07-22 11:41:14'),(614,14,NULL,'patientPW',NULL,'2020-07-22 11:41:15'),(615,54,'Successfully changed password for user patientPW','patientPW',NULL,'2020-07-22 11:41:15'),(616,62,NULL,'patientPW',NULL,'2020-07-22 11:41:15'),(617,14,NULL,'patent',NULL,'2020-07-22 11:41:15'),(620,14,NULL,'patient',NULL,'2020-07-22 11:41:16'),(623,104,NULL,'patient',NULL,'2020-07-22 11:41:16'),(624,107,NULL,'patient',NULL,'2020-07-22 11:41:16'),(625,105,NULL,'patient',NULL,'2020-07-22 11:41:16'),(627,104,NULL,'patient',NULL,'2020-07-22 11:41:16'),(628,105,NULL,'patient',NULL,'2020-07-22 11:41:16'),(629,14,NULL,'hcp',NULL,'2020-07-22 11:41:16'),(631,106,NULL,'hcp','patient','2020-07-22 11:41:16'),(632,14,NULL,'hcp',NULL,'2020-07-22 11:41:16'),(634,109,NULL,'hcp',NULL,'2020-07-22 11:41:16'),(635,110,NULL,'hcp',NULL,'2020-07-22 11:41:16'),(636,14,NULL,'patient',NULL,'2020-07-22 11:41:17'),(638,108,NULL,'patient',NULL,'2020-07-22 11:41:17'),(639,14,NULL,'patient',NULL,'2020-07-22 11:41:17'),(642,104,NULL,'patient',NULL,'2020-07-22 11:41:17'),(644,104,NULL,'patient',NULL,'2020-07-22 11:41:17'),(646,104,NULL,'patient',NULL,'2020-07-22 11:41:17'),(648,104,NULL,'patient',NULL,'2020-07-22 11:41:17'),(650,104,NULL,'patient',NULL,'2020-07-22 11:41:17'),(651,107,NULL,'patient',NULL,'2020-07-22 11:41:17'),(652,107,NULL,'patient',NULL,'2020-07-22 11:41:17'),(653,16,NULL,'admin',NULL,'2020-07-22 11:41:18'),(654,17,NULL,'admin',NULL,'2020-07-22 11:41:18'),(655,16,NULL,'admin',NULL,'2020-07-22 11:41:18'),(656,7,NULL,'SPRING_API_TEST_USER','sven_forkbeard','2020-07-22 11:41:18'),(657,9,NULL,'SPRING_API_TEST_USER',NULL,'2020-07-22 11:41:18'),(658,8,NULL,'sven_forkbeard',NULL,'2020-07-22 11:41:18'),(659,11,NULL,'SPRING_API_TEST_USER',NULL,'2020-07-22 11:41:18'),(660,8,NULL,'-1',NULL,'2020-07-22 11:41:18'),(661,14,NULL,'hcp',NULL,'2020-07-22 11:41:19'),(663,56,'HCP retrieved demographics for patient with username antti','hcp','antti','2020-07-22 11:41:19'),(664,13,'User with username anttiupdated their demographics','hcp',NULL,'2020-07-22 11:41:19'),(665,57,'HCP edited demographics for patient with username antti','antti',NULL,'2020-07-22 11:41:19'),(666,7,NULL,'hcp','bobbo','2020-07-22 11:41:19'),(667,14,NULL,'hcp',NULL,'2020-07-22 11:41:19'),(669,7,NULL,'hcp','terry','2020-07-22 11:41:19'),(670,14,NULL,'hcp',NULL,'2020-07-22 11:41:19'),(672,7,NULL,'hcp','jerry','2020-07-22 11:41:19'),(673,14,NULL,'hcp',NULL,'2020-07-22 11:41:19'),(675,7,NULL,'hcp','candy','2020-07-22 11:41:20'),(676,65,'HCP hcp has declared terry as a representative for bobbo','hcp','terry','2020-07-22 11:41:20'),(677,65,'HCP hcp has declared jerry as a representative for bobbo','hcp','jerry','2020-07-22 11:41:20'),(678,65,'HCP hcp has declared bobbo as a representative for terry','hcp','bobbo','2020-07-22 11:41:20'),(679,65,'HCP hcp has declared bobbo as a representative for jerry','hcp','bobbo','2020-07-22 11:41:20'),(680,68,'User terry has undeclared self as representative for bobbo','bobbo','terry','2020-07-22 11:41:20'),(681,14,NULL,'antti',NULL,'2020-07-22 11:41:20'),(683,14,NULL,'antti',NULL,'2020-07-22 11:41:20'),(685,14,NULL,'antti',NULL,'2020-07-22 11:41:20'),(687,66,'User bobbo has been added as a representative for user antti','antti','bobbo','2020-07-22 11:41:21'),(688,67,'User antti has undeclared representative bobbo','antti','bobbo','2020-07-22 11:41:21'),(689,7,NULL,'hcp','api_test_patient','2020-07-22 11:41:21'),(691,44,'Drug 0000-0000-20 created','hcp',NULL,'2020-07-22 11:41:21'),(693,48,'Created prescription with id 692','hcp','api_test_patient','2020-07-22 11:41:21'),(695,48,'Created prescription with id 694','hcp','api_test_patient','2020-07-22 11:41:21'),(696,51,'HCP viewed a list of all prescriptions','hcp',NULL,'2020-07-22 11:41:21'),(697,49,'Edited prescription with id 692','hcp','api_test_patient','2020-07-22 11:41:21'),(698,49,'Edited prescription with id 692','hcp','api_test_patient','2020-07-22 11:41:21'),(699,49,'Failed to edit prescription','hcp',NULL,'2020-07-22 11:41:21'),(700,50,'Deleted prescription with id 692','hcp','api_test_patient','2020-07-22 11:41:21'),(701,50,'Deleted prescription with id 694','hcp','api_test_patient','2020-07-22 11:41:21'),(703,20,NULL,'patient','hcp','2020-07-22 11:41:22'),(704,30,NULL,'hcp',NULL,'2020-07-22 11:41:22'),(705,30,NULL,'patient',NULL,'2020-07-22 11:41:22'),(708,26,'patient','patient',NULL,'2020-07-22 11:41:22'),(709,29,NULL,'patient',NULL,'2020-07-22 11:41:22'),(710,28,'hcp updated basic health metrics for antti from 2048-04-16T09:45:00.000-04:00','hcp','antti','2020-07-22 11:41:23'),(712,28,NULL,'patient',NULL,'2020-07-22 11:41:23'),(713,32,NULL,'patient',NULL,'2020-07-22 11:41:23'),(714,30,NULL,'patient',NULL,'2020-07-22 11:41:23'),(715,72,'LabTech labtech Views Their Lab Procedures','labtech',NULL,'2020-07-22 11:41:23'),(721,48,'Creating prescription with id 720','labtech','AliceThirteen','2020-07-22 11:41:23'),(723,41,'edu.ncsu.csc.itrust2.models.persistent.User@9d1bd1da created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@c9f556c9','hcp','AliceThirteen','2020-07-22 11:41:23'),(726,72,'LabTech labtech Views Lab Procedure 725','labtech',NULL,'2020-07-22 11:41:23'),(727,73,NULL,'labtech',NULL,'2020-07-22 11:41:23'),(728,74,'LabTech labtech Reassigns Procedure To assignedTech2','labtech','assignedTech2','2020-07-22 11:41:23'),(729,73,NULL,'labtech',NULL,'2020-07-22 11:41:23'),(730,74,'LabTech labtech Reassigns Procedure To assignedTech2','labtech','assignedTech2','2020-07-22 11:41:23'),(731,78,'HCP hcp Views Lab Procedures','hcp',NULL,'2020-07-22 11:41:23'),(732,77,NULL,'hcp',NULL,'2020-07-22 11:41:23'),(738,48,'Creating prescription with id 737','hcp','patient','2020-07-22 11:41:24'),(740,41,'edu.ncsu.csc.itrust2.models.persistent.User@764a9c57 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@764a9c57','patient',NULL,'2020-07-22 11:41:24'),(743,75,NULL,'hcp',NULL,'2020-07-22 11:41:24'),(744,78,'HCP hcp Views Lab Procedures','hcp',NULL,'2020-07-22 11:41:24'),(745,78,'HCP hcp Views labtech\'s Lab Procedures','hcp','labtech','2020-07-22 11:41:24'),(746,78,'HCP hcp Views OfficeVisit 739 Lab Procedures','hcp',NULL,'2020-07-22 11:41:24'),(747,78,'HCP hcp Views Lab Procedure 742','hcp',NULL,'2020-07-22 11:41:24'),(748,77,NULL,'hcp',NULL,'2020-07-22 11:41:24'),(757,48,'Creating prescription with id 756','labtech','AliceThirteen','2020-07-22 11:41:24'),(759,41,'edu.ncsu.csc.itrust2.models.persistent.User@9d1bd1da created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@c9f556c9','hcp','AliceThirteen','2020-07-22 11:41:24'),(762,73,NULL,'labtech',NULL,'2020-07-22 11:41:25'),(763,74,'LabTech labtech Reassigns Procedure To assignedTech','labtech','assignedTech','2020-07-22 11:41:25'),(765,20,NULL,'patient','hcp','2020-07-22 11:41:26'),(766,21,NULL,'patient','hcp','2020-07-22 11:41:26'),(767,25,NULL,'patient','hcp','2020-07-22 11:41:26'),(768,24,NULL,'patient','hcp','2020-07-22 11:41:26'),(769,22,NULL,'patient','hcp','2020-07-22 11:41:26'),(770,30,NULL,'patient',NULL,'2020-07-22 11:41:26'),(773,99,'patient','patient',NULL,'2020-07-22 11:41:27'),(774,102,NULL,'patient',NULL,'2020-07-22 11:41:27'),(775,101,'hcp updated basic health metrics for antti from 2048-04-16T09:45:00.000-04:00','hcp','antti','2020-07-22 11:41:27'),(777,101,NULL,'patient',NULL,'2020-07-22 11:41:27'),(778,103,NULL,'patient',NULL,'2020-07-22 11:41:27'),(779,30,NULL,'patient',NULL,'2020-07-22 11:41:27'),(781,20,NULL,'patient','hcp','2020-07-22 11:41:27'),(782,30,NULL,'robortOPH',NULL,'2020-07-22 11:41:27'),(784,33,'admin created an ICD Code','admin',NULL,'2020-07-22 11:41:28'),(786,33,'admin created an ICD Code','admin',NULL,'2020-07-22 11:41:28'),(787,30,NULL,'admin',NULL,'2020-07-22 11:41:28'),(790,41,'edu.ncsu.csc.itrust2.models.persistent.User@9d1bd1da created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@764a9c57','hcp','patient','2020-07-22 11:41:28'),(792,41,'edu.ncsu.csc.itrust2.models.persistent.User@9d1bd1da created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@764a9c57','hcp','patient','2020-07-22 11:41:28'),(794,26,'patient','admin',NULL,'2020-07-22 11:41:28'),(795,39,'Retrieved diagnoses for office visit with id 789','admin','patient','2020-07-22 11:41:28'),(797,42,'edu.ncsu.csc.itrust2.models.persistent.User@9d1bd1da edit a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@764a9c57','hcp','patient','2020-07-22 11:41:28'),(798,28,NULL,'admin',NULL,'2020-07-22 11:41:28'),(799,39,'Retrieved diagnoses for office visit with id 789','admin','patient','2020-07-22 11:41:28'),(801,43,'hcp deleted a diagnosis for patient','hcp','patient','2020-07-22 11:41:28'),(802,28,NULL,'admin',NULL,'2020-07-22 11:41:28'),(803,39,'Retrieved diagnoses for office visit with id 789','admin','patient','2020-07-22 11:41:28'),(804,12,NULL,'hcp',NULL,'2020-07-22 11:41:29'),(805,13,NULL,'hcp',NULL,'2020-07-22 11:41:29'),(806,14,NULL,'hcp',NULL,'2020-07-22 11:41:29'),(808,82,NULL,'hcp','patient','2020-07-22 11:41:29'),(809,14,NULL,'patent',NULL,'2020-07-22 11:41:29'),(811,14,NULL,'patient',NULL,'2020-07-22 11:41:29'),(814,80,NULL,'patient',NULL,'2020-07-22 11:41:29'),(815,81,NULL,'patient',NULL,'2020-07-22 11:41:29'),(824,41,'edu.ncsu.csc.itrust2.models.persistent.User@9d1bd1da created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@24834c43','hcp','onionman','2020-07-22 11:41:30'),(826,41,'edu.ncsu.csc.itrust2.models.persistent.User@9d1bd1da created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@24834c43','hcp','onionman','2020-07-22 11:41:30'),(836,41,'edu.ncsu.csc.itrust2.models.persistent.User@9d1bd1da created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@24834c43','hcp','onionman','2020-07-22 11:41:30'),(838,41,'edu.ncsu.csc.itrust2.models.persistent.User@9d1bd1da created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@24834c43','hcp','onionman','2020-07-22 11:41:30'),(840,63,'Fetched Emergency Record for user onionman','hcp','onionman','2020-07-22 11:41:30'),(849,41,'edu.ncsu.csc.itrust2.models.persistent.User@9d1bd1da created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@24834c43','hcp','onionman','2020-07-22 11:41:31'),(851,41,'edu.ncsu.csc.itrust2.models.persistent.User@9d1bd1da created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@24834c43','hcp','onionman','2020-07-22 11:41:31'),(853,64,'Fetched Emergency Record for user onionman','er','onionman','2020-07-22 11:41:31'),(862,41,'edu.ncsu.csc.itrust2.models.persistent.User@9d1bd1da created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@24834c43','hcp','onionman','2020-07-22 11:41:31'),(864,41,'edu.ncsu.csc.itrust2.models.persistent.User@9d1bd1da created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@24834c43','hcp','onionman','2020-07-22 11:41:31'),(867,44,'Drug 0000-0000-00 created','admin',NULL,'2020-07-22 11:41:31'),(868,44,'Conflict: drug with code 0000-0000-00 already exists','admin',NULL,'2020-07-22 11:41:31'),(870,44,'Drug 0000-0000-01 created','admin',NULL,'2020-07-22 11:41:31'),(871,47,'Fetched list of drugs','admin',NULL,'2020-07-22 11:41:31'),(872,45,'Drug with id 866 edited','admin',NULL,'2020-07-22 11:41:31'),(873,45,'Drug with id 869 edited','admin',NULL,'2020-07-22 11:41:31'),(874,46,'Deleted drug with id 866','admin',NULL,'2020-07-22 11:41:31'),(875,46,'Deleted drug with id 869','admin',NULL,'2020-07-22 11:41:31'),(877,69,'admin created a LOINC Code','admin',NULL,'2020-07-22 11:41:31'),(878,71,'admin edited a LOINC Code','admin',NULL,'2020-07-22 11:41:32'),(879,70,'admin deleted a LOINC Code','admin',NULL,'2020-07-22 11:41:32'),(883,41,'edu.ncsu.csc.itrust2.models.persistent.User@f3222d6d created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@4db005c2','hcp','AliceThirteen','2020-07-22 11:42:38'),(886,75,'edu.ncsu.csc.itrust2.models.persistent.User@f3222d6d created a Lab Procedure for edu.ncsu.csc.itrust2.models.persistent.User@4db005c2','hcp','AliceThirteen','2020-07-22 11:42:39'),(890,48,'Creating prescription with id 889','SPRING_API_TEST_USER','AliceThirteen','2020-07-22 11:42:39'),(891,43,'edu.ncsu.csc.itrust2.models.persistent.User@f3222d6d deleted a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@4db005c2','hcp','AliceThirteen','2020-07-22 11:42:39'),(892,77,'hcp deleted a Lab Procedure for AliceThirteen','hcp','AliceThirteen','2020-07-22 11:42:39'),(898,48,'Creating prescription with id 897','SPRING_API_TEST_USER','AliceThirteen','2020-07-22 11:42:39'),(900,41,'edu.ncsu.csc.itrust2.models.persistent.User@4db005c2 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@4db005c2','AliceThirteen',NULL,'2020-07-22 11:42:39'),(919,48,'Creating prescription with id 918','SPRING_API_TEST_USER','AliceThirteen','2020-07-22 11:42:40'),(921,41,'edu.ncsu.csc.itrust2.models.persistent.User@4db005c2 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@4db005c2','AliceThirteen',NULL,'2020-07-22 11:42:41'),(935,19,'test log entry with patient and hcp','logPatient','logHcp','2020-07-22 11:42:43'),(936,15,NULL,'logAdmin',NULL,'2020-07-22 11:42:43'),(937,1,'login succeeded for logPatient.','logPatient',NULL,'2020-07-22 11:42:43'),(938,1,'login succeeded for dupUser.','dupUser',NULL,'2020-07-22 11:42:43'),(951,1,'User has logged in','test',NULL,'2020-07-22 11:42:46'),(955,33,'admin created an ICD Code','admin',NULL,'2020-07-22 11:42:51'),(956,36,'Fetched icd code with id 954','admin',NULL,'2020-07-22 11:42:51'),(957,35,'admin edited an ICD Code','admin',NULL,'2020-07-22 11:42:52'),(958,36,'Fetched icd code with id 954','admin',NULL,'2020-07-22 11:42:52'),(959,34,'admin deleted an ICD Code','admin',NULL,'2020-07-22 11:42:52'),(961,20,NULL,'patient','hcp','2020-07-22 11:42:52'),(962,30,NULL,'bobbyOD',NULL,'2020-07-22 11:42:52'),(963,30,NULL,'patient',NULL,'2020-07-22 11:42:53'),(966,94,'patient','patient',NULL,'2020-07-22 11:42:53'),(967,97,NULL,'patient',NULL,'2020-07-22 11:42:53'),(968,96,'hcp updated basic health metrics for antti from 2048-04-16T09:45:00.000-04:00','hcp','antti','2020-07-22 11:42:53'),(970,96,NULL,'patient',NULL,'2020-07-22 11:42:53'),(971,98,NULL,'patient',NULL,'2020-07-22 11:42:53'),(972,30,NULL,'patient',NULL,'2020-07-22 11:42:53'),(973,5,NULL,'logapitest',NULL,'2020-07-22 11:42:53'),(974,5,NULL,'logapitest',NULL,'2020-07-22 11:42:53'),(975,5,NULL,'logapitest',NULL,'2020-07-22 11:42:53'),(976,5,NULL,'logapitest',NULL,'2020-07-22 11:42:53'),(977,5,NULL,'logapitest',NULL,'2020-07-22 11:42:53'),(978,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(979,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(980,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(981,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(982,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(983,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(984,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(985,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(986,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(987,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(988,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(989,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(990,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(991,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(992,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(993,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(994,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(995,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(996,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(997,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(998,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(999,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(1000,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(1001,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(1002,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(1003,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(1004,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(1005,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(1006,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(1007,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(1008,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(1009,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(1010,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(1011,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(1012,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(1013,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(1014,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(1015,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(1016,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(1017,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(1018,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(1019,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(1020,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(1021,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(1022,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(1023,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(1024,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(1025,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(1026,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(1027,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(1028,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(1029,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(1030,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(1031,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(1032,5,NULL,'logapitest',NULL,'2020-07-22 11:42:54'),(1033,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1034,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1035,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1036,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1037,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1038,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1039,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1040,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1041,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1042,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1043,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1044,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1045,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1046,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1047,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1048,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1049,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1050,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1051,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1052,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1053,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1054,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1055,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1056,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1057,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1058,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1059,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1060,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1061,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1062,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1063,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1064,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1065,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1066,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1067,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1068,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1069,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1070,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1071,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1072,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1073,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1074,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1075,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1076,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1077,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1078,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1079,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1080,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1081,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1082,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1083,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1084,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1085,5,NULL,'logapitest',NULL,'2020-07-22 11:42:55'),(1086,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1087,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1088,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1089,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1090,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1091,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1092,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1093,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1094,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1095,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1096,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1097,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1098,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1099,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1100,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1101,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1102,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1103,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1104,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1105,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1106,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1107,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1108,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1109,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1110,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1111,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1112,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1113,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1114,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1115,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1116,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1117,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1118,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1119,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1120,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1121,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1122,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1123,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1124,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1125,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1126,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1127,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1128,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1129,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1130,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1131,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1132,5,NULL,'logapitest',NULL,'2020-07-22 11:42:56'),(1133,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1134,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1135,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1136,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1137,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1138,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1139,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1140,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1141,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1142,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1143,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1144,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1145,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1146,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1147,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1148,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1149,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1150,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1151,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1152,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1153,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1154,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1155,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1156,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1157,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1158,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1159,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1160,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1161,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1162,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1163,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1164,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1165,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1166,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1167,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1168,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1169,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1170,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1171,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1172,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1173,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1174,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1175,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1176,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1177,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1178,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1179,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1180,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1181,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1182,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1183,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1184,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1185,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1186,5,NULL,'logapitest',NULL,'2020-07-22 11:42:57'),(1187,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1188,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1189,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1190,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1191,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1192,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1193,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1194,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1195,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1196,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1197,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1198,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1199,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1200,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1201,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1202,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1203,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1204,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1205,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1206,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1207,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1208,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1209,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1210,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1211,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1212,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1213,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1214,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1215,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1216,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1217,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1218,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1219,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1220,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1221,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1222,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1223,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1224,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1225,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1226,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1227,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1228,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1229,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1230,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1231,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1232,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1233,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1234,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1235,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1236,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1237,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1238,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1239,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1240,5,NULL,'logapitest',NULL,'2020-07-22 11:42:58'),(1241,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1242,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1243,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1244,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1245,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1246,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1247,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1248,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1249,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1250,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1251,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1252,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1253,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1254,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1255,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1256,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1257,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1258,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1259,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1260,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1261,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1262,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1263,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1264,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1265,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1266,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1267,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1268,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1269,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1270,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1271,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1272,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1273,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1274,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1275,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1276,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1277,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1278,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1279,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1280,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1281,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1282,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1283,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1284,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1285,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1286,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1287,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1288,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1289,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1290,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1291,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1292,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1293,5,NULL,'logapitest',NULL,'2020-07-22 11:42:59'),(1294,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1295,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1296,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1297,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1298,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1299,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1300,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1301,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1302,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1303,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1304,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1305,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1306,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1307,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1308,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1309,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1310,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1311,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1312,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1313,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1314,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1315,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1316,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1317,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1318,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1319,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1320,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1321,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1322,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1323,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1324,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1325,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1326,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1327,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1328,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1329,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1330,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1331,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1332,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1333,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1334,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1335,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1336,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1337,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1338,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1339,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1340,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1341,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1342,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1343,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1344,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1345,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1346,5,NULL,'logapitest',NULL,'2020-07-22 11:43:00'),(1347,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1348,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1349,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1350,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1351,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1352,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1353,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1354,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1355,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1356,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1357,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1358,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1359,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1360,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1361,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1362,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1363,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1364,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1365,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1366,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1367,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1368,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1369,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1370,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1371,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1372,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1373,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1374,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1375,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1376,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1377,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1378,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1379,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1380,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1381,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1382,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1383,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1384,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1385,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1386,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1387,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1388,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1389,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1390,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1391,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1392,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1393,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1394,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1395,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1396,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1397,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1398,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1399,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1400,5,NULL,'logapitest',NULL,'2020-07-22 11:43:01'),(1401,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1402,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1403,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1404,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1405,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1406,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1407,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1408,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1409,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1410,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1411,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1412,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1413,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1414,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1415,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1416,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1417,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1418,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1419,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1420,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1421,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1422,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1423,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1424,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1425,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1426,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1427,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1428,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1429,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1430,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1431,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1432,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1433,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1434,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1435,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1436,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1437,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1438,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1439,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1440,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1441,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1442,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1443,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1444,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1445,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1446,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1447,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1448,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1449,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1450,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1451,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1452,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1453,5,NULL,'logapitest',NULL,'2020-07-22 11:43:02'),(1454,5,NULL,'logapitest',NULL,'2020-07-22 11:43:03'),(1455,5,NULL,'logapitest',NULL,'2020-07-22 11:43:03'),(1456,5,NULL,'logapitest',NULL,'2020-07-22 11:43:03'),(1457,5,NULL,'logapitest',NULL,'2020-07-22 11:43:03'),(1458,5,NULL,'logapitest',NULL,'2020-07-22 11:43:03'),(1459,5,NULL,'logapitest',NULL,'2020-07-22 11:43:03'),(1460,5,NULL,'logapitest',NULL,'2020-07-22 11:43:03'),(1461,5,NULL,'logapitest',NULL,'2020-07-22 11:43:03'),(1462,5,NULL,'logapitest',NULL,'2020-07-22 11:43:03'),(1463,5,NULL,'logapitest',NULL,'2020-07-22 11:43:03'),(1464,5,NULL,'logapitest',NULL,'2020-07-22 11:43:03'),(1465,5,NULL,'logapitest',NULL,'2020-07-22 11:43:03'),(1466,5,NULL,'logapitest',NULL,'2020-07-22 11:43:03'),(1467,5,NULL,'logapitest',NULL,'2020-07-22 11:43:03'),(1468,5,NULL,'logapitest',NULL,'2020-07-22 11:43:03'),(1469,5,NULL,'logapitest',NULL,'2020-07-22 11:43:03'),(1470,5,NULL,'logapitest',NULL,'2020-07-22 11:43:03'),(1471,5,NULL,'logapitest',NULL,'2020-07-22 11:43:03'),(1472,5,NULL,'logapitest',NULL,'2020-07-22 11:43:03'),(1473,58,NULL,'admin',NULL,'2020-07-22 11:43:03'),(1475,14,NULL,'patientPW',NULL,'2020-07-22 11:43:03'),(1476,54,'Successfully changed password for user patientPW','patientPW',NULL,'2020-07-22 11:43:04'),(1478,14,NULL,'patientPW',NULL,'2020-07-22 11:43:04'),(1479,54,'Successfully changed password for user patientPW','patientPW',NULL,'2020-07-22 11:43:05'),(1480,62,NULL,'patientPW',NULL,'2020-07-22 11:43:05'),(1481,14,NULL,'patent',NULL,'2020-07-22 11:43:05'),(1484,14,NULL,'patient',NULL,'2020-07-22 11:43:06'),(1487,104,NULL,'patient',NULL,'2020-07-22 11:43:06'),(1488,107,NULL,'patient',NULL,'2020-07-22 11:43:06'),(1489,105,NULL,'patient',NULL,'2020-07-22 11:43:06'),(1491,104,NULL,'patient',NULL,'2020-07-22 11:43:06'),(1492,105,NULL,'patient',NULL,'2020-07-22 11:43:06'),(1493,14,NULL,'hcp',NULL,'2020-07-22 11:43:06'),(1495,106,NULL,'hcp','patient','2020-07-22 11:43:06'),(1496,14,NULL,'hcp',NULL,'2020-07-22 11:43:06'),(1498,109,NULL,'hcp',NULL,'2020-07-22 11:43:06'),(1499,110,NULL,'hcp',NULL,'2020-07-22 11:43:06'),(1500,14,NULL,'patient',NULL,'2020-07-22 11:43:07'),(1502,108,NULL,'patient',NULL,'2020-07-22 11:43:07'),(1503,14,NULL,'patient',NULL,'2020-07-22 11:43:07'),(1506,104,NULL,'patient',NULL,'2020-07-22 11:43:07'),(1508,104,NULL,'patient',NULL,'2020-07-22 11:43:07'),(1510,104,NULL,'patient',NULL,'2020-07-22 11:43:07'),(1512,104,NULL,'patient',NULL,'2020-07-22 11:43:07'),(1514,104,NULL,'patient',NULL,'2020-07-22 11:43:07'),(1515,107,NULL,'patient',NULL,'2020-07-22 11:43:07'),(1516,107,NULL,'patient',NULL,'2020-07-22 11:43:07'),(1517,16,NULL,'admin',NULL,'2020-07-22 11:43:08'),(1518,17,NULL,'admin',NULL,'2020-07-22 11:43:08'),(1519,16,NULL,'admin',NULL,'2020-07-22 11:43:08'),(1520,7,NULL,'SPRING_API_TEST_USER','sven_forkbeard','2020-07-22 11:43:08'),(1521,9,NULL,'SPRING_API_TEST_USER',NULL,'2020-07-22 11:43:08'),(1522,8,NULL,'sven_forkbeard',NULL,'2020-07-22 11:43:08'),(1523,11,NULL,'SPRING_API_TEST_USER',NULL,'2020-07-22 11:43:08'),(1524,8,NULL,'-1',NULL,'2020-07-22 11:43:08'),(1525,14,NULL,'hcp',NULL,'2020-07-22 11:43:09'),(1527,56,'HCP retrieved demographics for patient with username antti','hcp','antti','2020-07-22 11:43:09'),(1528,13,'User with username anttiupdated their demographics','hcp',NULL,'2020-07-22 11:43:09'),(1529,57,'HCP edited demographics for patient with username antti','antti',NULL,'2020-07-22 11:43:09'),(1530,14,NULL,'hcp',NULL,'2020-07-22 11:43:09'),(1532,14,NULL,'hcp',NULL,'2020-07-22 11:43:09'),(1534,14,NULL,'hcp',NULL,'2020-07-22 11:43:09'),(1536,65,'HCP hcp has declared terry as a representative for bobbo','hcp','terry','2020-07-22 11:43:10'),(1537,65,'HCP hcp has declared jerry as a representative for bobbo','hcp','jerry','2020-07-22 11:43:10'),(1538,65,'HCP hcp has declared bobbo as a representative for terry','hcp','bobbo','2020-07-22 11:43:10'),(1539,65,'HCP hcp has declared bobbo as a representative for jerry','hcp','bobbo','2020-07-22 11:43:10'),(1540,68,'User terry has undeclared self as representative for bobbo','bobbo','terry','2020-07-22 11:43:10'),(1541,14,NULL,'antti',NULL,'2020-07-22 11:43:10'),(1543,14,NULL,'antti',NULL,'2020-07-22 11:43:11'),(1545,14,NULL,'antti',NULL,'2020-07-22 11:43:11'),(1547,66,'User bobbo has been added as a representative for user antti','antti','bobbo','2020-07-22 11:43:11'),(1548,67,'User antti has undeclared representative bobbo','antti','bobbo','2020-07-22 11:43:11'),(1549,44,'Conflict: drug with code 0000-0000-20 already exists','hcp',NULL,'2020-07-22 11:43:11'),(1551,48,'Created prescription with id 1550','hcp','api_test_patient','2020-07-22 11:43:11'),(1553,48,'Created prescription with id 1552','hcp','api_test_patient','2020-07-22 11:43:11'),(1554,51,'HCP viewed a list of all prescriptions','hcp',NULL,'2020-07-22 11:43:11'),(1555,49,'Edited prescription with id 1550','hcp','api_test_patient','2020-07-22 11:43:11'),(1556,49,'Edited prescription with id 1550','hcp','api_test_patient','2020-07-22 11:43:11'),(1557,49,'Failed to edit prescription','hcp',NULL,'2020-07-22 11:43:11'),(1558,50,'Deleted prescription with id 1550','hcp','api_test_patient','2020-07-22 11:43:11'),(1559,50,'Deleted prescription with id 1552','hcp','api_test_patient','2020-07-22 11:43:11'),(1561,20,NULL,'patient','hcp','2020-07-22 11:43:12'),(1562,30,NULL,'hcp',NULL,'2020-07-22 11:43:12'),(1563,30,NULL,'patient',NULL,'2020-07-22 11:43:12'),(1566,26,'patient','patient',NULL,'2020-07-22 11:43:12'),(1567,29,NULL,'patient',NULL,'2020-07-22 11:43:12'),(1568,28,'hcp updated basic health metrics for antti from 2048-04-16T09:45:00.000-04:00','hcp','antti','2020-07-22 11:43:13'),(1570,28,NULL,'patient',NULL,'2020-07-22 11:43:13'),(1571,32,NULL,'patient',NULL,'2020-07-22 11:43:13'),(1572,30,NULL,'patient',NULL,'2020-07-22 11:43:13'),(1573,72,'LabTech labtech Views Their Lab Procedures','labtech',NULL,'2020-07-22 11:43:13'),(1579,48,'Creating prescription with id 1578','labtech','AliceThirteen','2020-07-22 11:43:13'),(1581,41,'edu.ncsu.csc.itrust2.models.persistent.User@f3222d6d created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@4db005c2','hcp','AliceThirteen','2020-07-22 11:43:13'),(1584,72,'LabTech labtech Views Lab Procedure 1583','labtech',NULL,'2020-07-22 11:43:13'),(1585,73,NULL,'labtech',NULL,'2020-07-22 11:43:13'),(1586,74,'LabTech labtech Reassigns Procedure To assignedTech2','labtech','assignedTech2','2020-07-22 11:43:13'),(1587,73,NULL,'labtech',NULL,'2020-07-22 11:43:13'),(1588,74,'LabTech labtech Reassigns Procedure To assignedTech2','labtech','assignedTech2','2020-07-22 11:43:13'),(1589,78,'HCP hcp Views Lab Procedures','hcp',NULL,'2020-07-22 11:43:13'),(1590,77,NULL,'hcp',NULL,'2020-07-22 11:43:13'),(1596,48,'Creating prescription with id 1595','hcp','patient','2020-07-22 11:43:14'),(1598,41,'edu.ncsu.csc.itrust2.models.persistent.User@fa054b50 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@fa054b50','patient',NULL,'2020-07-22 11:43:14'),(1601,75,NULL,'hcp',NULL,'2020-07-22 11:43:14'),(1602,78,'HCP hcp Views Lab Procedures','hcp',NULL,'2020-07-22 11:43:14'),(1603,78,'HCP hcp Views labtech\'s Lab Procedures','hcp','labtech','2020-07-22 11:43:14'),(1604,78,'HCP hcp Views OfficeVisit 1597 Lab Procedures','hcp',NULL,'2020-07-22 11:43:14'),(1605,78,'HCP hcp Views Lab Procedure 1600','hcp',NULL,'2020-07-22 11:43:14'),(1606,77,NULL,'hcp',NULL,'2020-07-22 11:43:14'),(1615,48,'Creating prescription with id 1614','labtech','AliceThirteen','2020-07-22 11:43:15'),(1617,41,'edu.ncsu.csc.itrust2.models.persistent.User@f3222d6d created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@4db005c2','hcp','AliceThirteen','2020-07-22 11:43:15'),(1620,73,NULL,'labtech',NULL,'2020-07-22 11:43:15'),(1621,74,'LabTech labtech Reassigns Procedure To assignedTech','labtech','assignedTech','2020-07-22 11:43:15'),(1623,20,NULL,'patient','hcp','2020-07-22 11:43:16'),(1624,21,NULL,'patient','hcp','2020-07-22 11:43:16'),(1625,25,NULL,'patient','hcp','2020-07-22 11:43:16'),(1626,24,NULL,'patient','hcp','2020-07-22 11:43:16'),(1627,22,NULL,'patient','hcp','2020-07-22 11:43:16'),(1628,30,NULL,'patient',NULL,'2020-07-22 11:43:17'),(1631,99,'patient','patient',NULL,'2020-07-22 11:43:17'),(1632,102,NULL,'patient',NULL,'2020-07-22 11:43:17'),(1633,101,'hcp updated basic health metrics for antti from 2048-04-16T09:45:00.000-04:00','hcp','antti','2020-07-22 11:43:17'),(1635,101,NULL,'patient',NULL,'2020-07-22 11:43:17'),(1636,103,NULL,'patient',NULL,'2020-07-22 11:43:17'),(1637,30,NULL,'patient',NULL,'2020-07-22 11:43:17'),(1639,20,NULL,'patient','hcp','2020-07-22 11:43:18'),(1640,30,NULL,'robortOPH',NULL,'2020-07-22 11:43:18'),(1642,33,'admin created an ICD Code','admin',NULL,'2020-07-22 11:43:18'),(1644,33,'admin created an ICD Code','admin',NULL,'2020-07-22 11:43:18'),(1645,30,NULL,'admin',NULL,'2020-07-22 11:43:18'),(1648,41,'edu.ncsu.csc.itrust2.models.persistent.User@f3222d6d created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@fa054b50','hcp','patient','2020-07-22 11:43:18'),(1650,41,'edu.ncsu.csc.itrust2.models.persistent.User@f3222d6d created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@fa054b50','hcp','patient','2020-07-22 11:43:18'),(1652,26,'patient','admin',NULL,'2020-07-22 11:43:18'),(1653,39,'Retrieved diagnoses for office visit with id 1647','admin','patient','2020-07-22 11:43:18'),(1655,42,'edu.ncsu.csc.itrust2.models.persistent.User@f3222d6d edit a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@fa054b50','hcp','patient','2020-07-22 11:43:19'),(1656,28,NULL,'admin',NULL,'2020-07-22 11:43:19'),(1657,39,'Retrieved diagnoses for office visit with id 1647','admin','patient','2020-07-22 11:43:19'),(1659,43,'hcp deleted a diagnosis for patient','hcp','patient','2020-07-22 11:43:19'),(1660,28,NULL,'admin',NULL,'2020-07-22 11:43:19'),(1661,39,'Retrieved diagnoses for office visit with id 1647','admin','patient','2020-07-22 11:43:19'),(1662,12,NULL,'hcp',NULL,'2020-07-22 11:43:19'),(1663,13,NULL,'hcp',NULL,'2020-07-22 11:43:19'),(1664,14,NULL,'hcp',NULL,'2020-07-22 11:43:20'),(1666,82,NULL,'hcp','patient','2020-07-22 11:43:20'),(1667,14,NULL,'patent',NULL,'2020-07-22 11:43:20'),(1669,14,NULL,'patient',NULL,'2020-07-22 11:43:20'),(1672,80,NULL,'patient',NULL,'2020-07-22 11:43:20'),(1673,81,NULL,'patient',NULL,'2020-07-22 11:43:20'),(1682,41,'edu.ncsu.csc.itrust2.models.persistent.User@f3222d6d created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@a83dfb3c','hcp','onionman','2020-07-22 11:43:20'),(1684,41,'edu.ncsu.csc.itrust2.models.persistent.User@f3222d6d created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@a83dfb3c','hcp','onionman','2020-07-22 11:43:20'),(1694,41,'edu.ncsu.csc.itrust2.models.persistent.User@f3222d6d created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@a83dfb3c','hcp','onionman','2020-07-22 11:43:21'),(1696,41,'edu.ncsu.csc.itrust2.models.persistent.User@f3222d6d created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@a83dfb3c','hcp','onionman','2020-07-22 11:43:21'),(1698,63,'Fetched Emergency Record for user onionman','hcp','onionman','2020-07-22 11:43:21'),(1707,41,'edu.ncsu.csc.itrust2.models.persistent.User@f3222d6d created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@a83dfb3c','hcp','onionman','2020-07-22 11:43:21'),(1709,41,'edu.ncsu.csc.itrust2.models.persistent.User@f3222d6d created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@a83dfb3c','hcp','onionman','2020-07-22 11:43:21'),(1711,64,'Fetched Emergency Record for user onionman','er','onionman','2020-07-22 11:43:21'),(1720,41,'edu.ncsu.csc.itrust2.models.persistent.User@f3222d6d created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@a83dfb3c','hcp','onionman','2020-07-22 11:43:22'),(1722,41,'edu.ncsu.csc.itrust2.models.persistent.User@f3222d6d created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@a83dfb3c','hcp','onionman','2020-07-22 11:43:22'),(1725,44,'Drug 0000-0000-00 created','admin',NULL,'2020-07-22 11:43:22'),(1726,44,'Conflict: drug with code 0000-0000-00 already exists','admin',NULL,'2020-07-22 11:43:22'),(1728,44,'Drug 0000-0000-01 created','admin',NULL,'2020-07-22 11:43:22'),(1729,47,'Fetched list of drugs','admin',NULL,'2020-07-22 11:43:22'),(1730,45,'Drug with id 1724 edited','admin',NULL,'2020-07-22 11:43:22'),(1731,45,'Drug with id 1727 edited','admin',NULL,'2020-07-22 11:43:22'),(1732,46,'Deleted drug with id 1724','admin',NULL,'2020-07-22 11:43:22'),(1733,46,'Deleted drug with id 1727','admin',NULL,'2020-07-22 11:43:22'),(1735,69,'admin created a LOINC Code','admin',NULL,'2020-07-22 11:43:22'),(1736,71,'admin edited a LOINC Code','admin',NULL,'2020-07-22 11:43:22'),(1737,70,'admin deleted a LOINC Code','admin',NULL,'2020-07-22 11:43:22');
/*!40000 ALTER TABLE `LogEntries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LoginAttempts`
--

DROP TABLE IF EXISTS `LoginAttempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LoginAttempts` (
  `id` bigint(20) NOT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `user_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6me6sh9op6gntvqnqqqiev95q` (`user_id`),
  CONSTRAINT `FK6me6sh9op6gntvqnqqqiev95q` FOREIGN KEY (`user_id`) REFERENCES `Users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LoginAttempts`
--

LOCK TABLES `LoginAttempts` WRITE;
/*!40000 ALTER TABLE `LoginAttempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `LoginAttempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LoginBans`
--

DROP TABLE IF EXISTS `LoginBans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LoginBans` (
  `id` bigint(20) NOT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `user_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpmi5daj2jt8w5gq9maxjpro1f` (`user_id`),
  CONSTRAINT `FKpmi5daj2jt8w5gq9maxjpro1f` FOREIGN KEY (`user_id`) REFERENCES `Users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LoginBans`
--

LOCK TABLES `LoginBans` WRITE;
/*!40000 ALTER TABLE `LoginBans` DISABLE KEYS */;
/*!40000 ALTER TABLE `LoginBans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LoginLockouts`
--

DROP TABLE IF EXISTS `LoginLockouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LoginLockouts` (
  `id` bigint(20) NOT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `user_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhndsii960xs59bv7a7x5669ii` (`user_id`),
  CONSTRAINT `FKhndsii960xs59bv7a7x5669ii` FOREIGN KEY (`user_id`) REFERENCES `Users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LoginLockouts`
--

LOCK TABLES `LoginLockouts` WRITE;
/*!40000 ALTER TABLE `LoginLockouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `LoginLockouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OphthalmologySurgery`
--

DROP TABLE IF EXISTS `OphthalmologySurgery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OphthalmologySurgery` (
  `id` bigint(20) NOT NULL,
  `date` datetime DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `axisOD` int(11) DEFAULT NULL,
  `axisOS` int(11) DEFAULT NULL,
  `cylinderOD` double DEFAULT NULL,
  `cylinderOS` double DEFAULT NULL,
  `sphereOD` double DEFAULT NULL,
  `sphereOS` double DEFAULT NULL,
  `visualAcuityOD` int(11) DEFAULT NULL,
  `visualAcuityOS` int(11) DEFAULT NULL,
  `surgeryType` int(11) DEFAULT NULL,
  `appointment_id` bigint(20) DEFAULT NULL,
  `basichealthmetrics_id` bigint(20) DEFAULT NULL,
  `hcp_id` varchar(100) DEFAULT NULL,
  `hospital_id` varchar(100) DEFAULT NULL,
  `patient_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2ab5y8krlqw4407jo9je2rodh` (`appointment_id`),
  KEY `FK64ijwgpf2cbt4t6vcwyj0vy77` (`basichealthmetrics_id`),
  KEY `FK43k7w4nn8hxf36s3xonve9l5v` (`hcp_id`),
  KEY `FKg3nwmi2eh9lxpys9gom75nsvx` (`hospital_id`),
  KEY `FK526jd5m6bguykj27g8jbl2idt` (`patient_id`),
  CONSTRAINT `FK2ab5y8krlqw4407jo9je2rodh` FOREIGN KEY (`appointment_id`) REFERENCES `AppointmentRequests` (`id`),
  CONSTRAINT `FK43k7w4nn8hxf36s3xonve9l5v` FOREIGN KEY (`hcp_id`) REFERENCES `Users` (`username`),
  CONSTRAINT `FK526jd5m6bguykj27g8jbl2idt` FOREIGN KEY (`patient_id`) REFERENCES `Users` (`username`),
  CONSTRAINT `FK64ijwgpf2cbt4t6vcwyj0vy77` FOREIGN KEY (`basichealthmetrics_id`) REFERENCES `BasicHealthMetrics` (`id`),
  CONSTRAINT `FKg3nwmi2eh9lxpys9gom75nsvx` FOREIGN KEY (`hospital_id`) REFERENCES `Hospitals` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OphthalmologySurgery`
--

LOCK TABLES `OphthalmologySurgery` WRITE;
/*!40000 ALTER TABLE `OphthalmologySurgery` DISABLE KEYS */;
/*!40000 ALTER TABLE `OphthalmologySurgery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERSONAL_REPRESENTATIVES`
--

DROP TABLE IF EXISTS `PERSONAL_REPRESENTATIVES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERSONAL_REPRESENTATIVES` (
  `patient_id` varchar(100) NOT NULL,
  `representative_id` varchar(100) NOT NULL,
  PRIMARY KEY (`patient_id`,`representative_id`),
  KEY `FK4xcw5y8obck13wkbeja8cxy6d` (`representative_id`),
  CONSTRAINT `FK4xcw5y8obck13wkbeja8cxy6d` FOREIGN KEY (`representative_id`) REFERENCES `Patients` (`self_id`),
  CONSTRAINT `FKthu0xxghbfmojk34tnmg17qxd` FOREIGN KEY (`patient_id`) REFERENCES `Patients` (`self_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERSONAL_REPRESENTATIVES`
--

LOCK TABLES `PERSONAL_REPRESENTATIVES` WRITE;
/*!40000 ALTER TABLE `PERSONAL_REPRESENTATIVES` DISABLE KEYS */;
/*!40000 ALTER TABLE `PERSONAL_REPRESENTATIVES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PasswordResetTokens`
--

DROP TABLE IF EXISTS `PasswordResetTokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PasswordResetTokens` (
  `id` bigint(20) NOT NULL,
  `creationTime` bigint(20) NOT NULL,
  `tempPassword` varchar(255) DEFAULT NULL,
  `user_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdtqvlc6is6k5ibp1xc1nshrc8` (`user_id`),
  CONSTRAINT `FKdtqvlc6is6k5ibp1xc1nshrc8` FOREIGN KEY (`user_id`) REFERENCES `Users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PasswordResetTokens`
--

LOCK TABLES `PasswordResetTokens` WRITE;
/*!40000 ALTER TABLE `PasswordResetTokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `PasswordResetTokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patients`
--

DROP TABLE IF EXISTS `Patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Patients` (
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `bloodType` varchar(255) DEFAULT NULL,
  `causeOfDeath` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `dateOfBirth` datetime DEFAULT NULL,
  `dateOfDeath` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `ethnicity` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `id` bigint(20) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `preferredName` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `self_id` varchar(100) NOT NULL,
  `father_id` varchar(100) DEFAULT NULL,
  `mother_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`self_id`),
  KEY `FK8s22h2pw102ce5ytcmqmhegp3` (`father_id`),
  KEY `FK3aemk5yjohgj9y6j4lq57g4o5` (`mother_id`),
  CONSTRAINT `FK3aemk5yjohgj9y6j4lq57g4o5` FOREIGN KEY (`mother_id`) REFERENCES `Users` (`username`),
  CONSTRAINT `FK8s22h2pw102ce5ytcmqmhegp3` FOREIGN KEY (`father_id`) REFERENCES `Users` (`username`),
  CONSTRAINT `FKe0d1x2xac4nte49udxrwdiew5` FOREIGN KEY (`self_id`) REFERENCES `Users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patients`
--

LOCK TABLES `Patients` WRITE;
/*!40000 ALTER TABLE `Patients` DISABLE KEYS */;
INSERT INTO `Patients` VALUES (NULL,NULL,'OPos',NULL,NULL,'1990-07-21 19:00:00',NULL,NULL,NULL,'King','Male',NULL,'Four',NULL,NULL,NULL,NULL,'kingfour',NULL,NULL),(NULL,NULL,'OPos',NULL,NULL,'1990-07-21 19:00:00',NULL,NULL,NULL,'King','Male',NULL,'One',NULL,NULL,NULL,NULL,'kingone',NULL,NULL),(NULL,NULL,'OPos',NULL,NULL,'1990-07-21 19:00:00',NULL,NULL,NULL,'King','Male',NULL,'Three',NULL,NULL,NULL,NULL,'kingthree',NULL,NULL),(NULL,NULL,'OPos',NULL,NULL,'1990-07-21 19:00:00',NULL,NULL,NULL,'King','Male',NULL,'Two',NULL,NULL,NULL,NULL,'kingtwo',NULL,NULL),(NULL,NULL,'OPos',NULL,NULL,'1990-07-21 19:00:00',NULL,NULL,NULL,'SiegwardOf','Male',NULL,'Catarina',NULL,NULL,NULL,NULL,'onionman',NULL,NULL);
/*!40000 ALTER TABLE `Patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Personnel`
--

DROP TABLE IF EXISTS `Personnel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Personnel` (
  `id` bigint(20) NOT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `specialty` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `self_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKa9l63705rm5c4tf50y9h9x8rp` (`self_id`),
  CONSTRAINT `FKa9l63705rm5c4tf50y9h9x8rp` FOREIGN KEY (`self_id`) REFERENCES `Users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Personnel`
--

LOCK TABLES `Personnel` WRITE;
/*!40000 ALTER TABLE `Personnel` DISABLE KEYS */;
INSERT INTO `Personnel` VALUES (1,'1 Test Street','Address Part 2','Prag','hcp@itrust.cz',_binary '\0','Test','HCP','123-456-7890','Doctor Stuff','NC','27514','hcp'),(2,NULL,NULL,NULL,NULL,_binary '\0','Knight','Solaire',NULL,NULL,NULL,NULL,'knightSolaire'),(3,NULL,NULL,NULL,NULL,_binary '\0','Lab','Technician',NULL,NULL,NULL,NULL,'labtech'),(4,NULL,NULL,NULL,NULL,_binary '\0','Larry','Teacher',NULL,NULL,NULL,NULL,'larrytech');
/*!40000 ALTER TABLE `Personnel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prescriptions`
--

DROP TABLE IF EXISTS `Prescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Prescriptions` (
  `id` bigint(20) NOT NULL,
  `dosage` int(11) NOT NULL,
  `endDate` datetime DEFAULT NULL,
  `renewals` int(11) NOT NULL,
  `startDate` datetime DEFAULT NULL,
  `drug_id` bigint(20) DEFAULT NULL,
  `patient_id` varchar(100) DEFAULT NULL,
  `prescriptions_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrr7q2rw34mv2h8p24dwo2sw39` (`drug_id`),
  KEY `FK11c0dywqeqm53244c088xriq0` (`patient_id`),
  KEY `FKkhctha3d1ti34dbaplmn8tsyk` (`prescriptions_id`),
  CONSTRAINT `FK11c0dywqeqm53244c088xriq0` FOREIGN KEY (`patient_id`) REFERENCES `Users` (`username`),
  CONSTRAINT `FKkhctha3d1ti34dbaplmn8tsyk` FOREIGN KEY (`prescriptions_id`) REFERENCES `GeneralCheckups` (`id`),
  CONSTRAINT `FKrr7q2rw34mv2h8p24dwo2sw39` FOREIGN KEY (`drug_id`) REFERENCES `Drugs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prescriptions`
--

LOCK TABLES `Prescriptions` WRITE;
/*!40000 ALTER TABLE `Prescriptions` DISABLE KEYS */;
INSERT INTO `Prescriptions` VALUES (23,3,'2020-07-31 19:00:00',5,'2020-07-21 19:00:00',22,'AliceThirteen',NULL),(31,3,'2020-07-31 19:00:00',5,'2020-07-21 19:00:00',30,'AliceThirteen',NULL),(52,3,'2020-07-31 19:00:00',5,'2020-07-21 19:00:00',51,'AliceThirteen',NULL),(720,3,'2020-07-31 19:00:00',5,'2020-07-21 19:00:00',719,'AliceThirteen',NULL),(737,3,'2020-07-31 19:00:00',5,'2020-07-21 19:00:00',736,'patient',NULL),(756,3,'2020-07-31 19:00:00',5,'2020-07-21 19:00:00',755,'AliceThirteen',NULL),(817,1,'2020-09-19 19:00:00',20,'2020-06-21 19:00:00',816,'onionman',NULL),(819,1,'2020-08-20 19:00:00',99,'2020-05-22 19:00:00',818,'onionman',NULL),(829,1,'2020-09-19 19:00:00',20,'2020-06-21 19:00:00',828,'onionman',NULL),(831,1,'2020-08-20 19:00:00',99,'2020-05-22 19:00:00',830,'onionman',NULL),(842,1,'2020-09-19 19:00:00',20,'2020-06-21 19:00:00',841,'onionman',NULL),(844,1,'2020-08-20 19:00:00',99,'2020-05-22 19:00:00',843,'onionman',NULL),(855,1,'2020-09-19 19:00:00',20,'2020-06-21 19:00:00',854,'onionman',NULL),(857,1,'2020-08-20 19:00:00',99,'2020-05-22 19:00:00',856,'onionman',NULL),(889,3,'2020-07-31 19:00:00',5,'2020-07-21 19:00:00',888,'AliceThirteen',NULL),(897,3,'2020-07-31 19:00:00',5,'2020-07-21 19:00:00',896,'AliceThirteen',NULL),(918,3,'2020-07-31 19:00:00',5,'2020-07-21 19:00:00',917,'AliceThirteen',NULL),(1578,3,'2020-07-31 19:00:00',5,'2020-07-21 19:00:00',1577,'AliceThirteen',NULL),(1595,3,'2020-07-31 19:00:00',5,'2020-07-21 19:00:00',1594,'patient',NULL),(1614,3,'2020-07-31 19:00:00',5,'2020-07-21 19:00:00',1613,'AliceThirteen',NULL),(1675,1,'2020-09-19 19:00:00',20,'2020-06-21 19:00:00',1674,'onionman',NULL),(1677,1,'2020-08-20 19:00:00',99,'2020-05-22 19:00:00',1676,'onionman',NULL),(1687,1,'2020-09-19 19:00:00',20,'2020-06-21 19:00:00',1686,'onionman',NULL),(1689,1,'2020-08-20 19:00:00',99,'2020-05-22 19:00:00',1688,'onionman',NULL),(1700,1,'2020-09-19 19:00:00',20,'2020-06-21 19:00:00',1699,'onionman',NULL),(1702,1,'2020-08-20 19:00:00',99,'2020-05-22 19:00:00',1701,'onionman',NULL),(1713,1,'2020-09-19 19:00:00',20,'2020-06-21 19:00:00',1712,'onionman',NULL),(1715,1,'2020-08-20 19:00:00',99,'2020-05-22 19:00:00',1714,'onionman',NULL);
/*!40000 ALTER TABLE `Prescriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QualitativeLOINCResult_resultEntries`
--

DROP TABLE IF EXISTS `QualitativeLOINCResult_resultEntries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QualitativeLOINCResult_resultEntries` (
  `QualitativeLOINCResult_id` bigint(20) NOT NULL,
  `icd_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  KEY `FKj5v90k5cus9qwi7s21n9q77ct` (`icd_id`),
  KEY `FKt20aq6o1nrhhtoimh35a912hj` (`QualitativeLOINCResult_id`),
  CONSTRAINT `FKj5v90k5cus9qwi7s21n9q77ct` FOREIGN KEY (`icd_id`) REFERENCES `ICDCodes` (`id`),
  CONSTRAINT `FKt20aq6o1nrhhtoimh35a912hj` FOREIGN KEY (`QualitativeLOINCResult_id`) REFERENCES `LOINCResult` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QualitativeLOINCResult_resultEntries`
--

LOCK TABLES `QualitativeLOINCResult_resultEntries` WRITE;
/*!40000 ALTER TABLE `QualitativeLOINCResult_resultEntries` DISABLE KEYS */;
/*!40000 ALTER TABLE `QualitativeLOINCResult_resultEntries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QuantitativeLOINCResult_resultRanges`
--

DROP TABLE IF EXISTS `QuantitativeLOINCResult_resultRanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QuantitativeLOINCResult_resultRanges` (
  `QuantitativeLOINCResult_id` bigint(20) NOT NULL,
  `icd_id` bigint(20) DEFAULT NULL,
  `max` float DEFAULT NULL,
  `min` float DEFAULT NULL,
  KEY `FKegy2iicpobqfn9fkwqbwhtvok` (`icd_id`),
  KEY `FK8bxt649q99k8cxq5jjxigo3ip` (`QuantitativeLOINCResult_id`),
  CONSTRAINT `FK8bxt649q99k8cxq5jjxigo3ip` FOREIGN KEY (`QuantitativeLOINCResult_id`) REFERENCES `LOINCResult` (`id`),
  CONSTRAINT `FKegy2iicpobqfn9fkwqbwhtvok` FOREIGN KEY (`icd_id`) REFERENCES `ICDCodes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QuantitativeLOINCResult_resultRanges`
--

LOCK TABLES `QuantitativeLOINCResult_resultRanges` WRITE;
/*!40000 ALTER TABLE `QuantitativeLOINCResult_resultRanges` DISABLE KEYS */;
INSERT INTO `QuantitativeLOINCResult_resultRanges` VALUES (926,NULL,139,0),(926,7,199,140),(926,6,5000,200),(1609,NULL,139,0),(1609,7,199,140),(1609,6,5000,200);
/*!40000 ALTER TABLE `QuantitativeLOINCResult_resultRanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `username` varchar(255) NOT NULL,
  `enabled` int(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES ('admin',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_ADMIN'),('AliceThirteen',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('alminister',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_ADMIN'),('antti',1,'$2a$10$wdhjqY/KrRpe4QuNiT/OZujkDF5TM6C/gRWWyJyUYwCtHPEbCW9oi','ROLE_PATIENT'),('api_test_patient',1,'$2a$10$CGotsCUNwkO9JleQkBC8su./PGRWGoEzsi/g5yMPFRSCuHOdUR1nS','ROLE_PATIENT'),('assignedTech',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_LABTECH'),('assignedTech2',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_LABTECH'),('BillyBob',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('bobbo',1,'$2a$10$ql7/c0gPH7cpOXJYuuSEnOqcryM6mKiZieT9Dprpklhh4GbbIxoeK','ROLE_PATIENT'),('bobbyOD',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_OD'),('BobTheFourYearOld',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('candy',1,'$2a$10$lm97NZ52SEMcApwXYHOuh.XWUbpIIPIVAjdPnD67i6zsVwFTCyNOy','ROLE_HCP'),('er',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_ER'),('hcp',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_HCP'),('jbean',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('jerry',1,'$2a$10$KhL/cmZKFjrnCQfaxwxOVOMRJHivd/rcRyGw6Lj8nB1WyMsM2b752','ROLE_PATIENT'),('JillBob',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('kingfour',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('kingone',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('kingthree',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('kingtwo',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('knightSolaire',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_ER'),('labtech',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_LABTECH'),('labtech2',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_LABTECH'),('labtech3',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_LABTECH'),('larrytech',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_LABTECH'),('lockoutUser',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_HCP'),('lockoutUser2',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_HCP'),('logapitest',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('nsanderson',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('onionman',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('patient',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('patient2',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_LABTECH'),('patient3',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('patientTestDad',1,'123456','ROLE_PATIENT'),('patientTestMom',1,'123456','ROLE_PATIENT'),('patientTestPatient',1,'123456','ROLE_PATIENT'),('patientTestRep',1,'123456','ROLE_PATIENT'),('pwtestuser1',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_HCP'),('pwtestuser2',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_HCP'),('pwtestuser3',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_HCP'),('pwtestuser4',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_HCP'),('pwtestuser5',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_HCP'),('robortOPH',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_OPH'),('svang',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_HCP'),('sven_forkbeard',0,'$2a$10$pxmQSasifaR/ZSkIVsAozueGxZ7WorRiuzyJpHJTTVTNB9NixK6Tq','ROLE_PATIENT'),('terry',1,'$2a$10$F/0T13v/RwRKoK5EiWjrS./QdDvsgyVZTF/ttaYMhLnYN/6.ctPWy','ROLE_PATIENT'),('TimTheOneYearOld',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (1738),(1738),(1738),(1738),(1738),(1738),(1738),(1738),(1738),(1738),(1738),(1738),(1738),(1738),(1738),(1738),(1738),(1738),(1738),(1738);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-22 17:01:56
