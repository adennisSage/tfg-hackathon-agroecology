-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: agroecology-team1
-- ------------------------------------------------------
-- Server version	5.6.51

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
-- Table structure for table `crop`
--

DROP TABLE IF EXISTS `crop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crop` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crop`
--

LOCK TABLES `crop` WRITE;
/*!40000 ALTER TABLE `crop` DISABLE KEYS */;
/*!40000 ALTER TABLE `crop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crop-media`
--

DROP TABLE IF EXISTS `crop-media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crop-media` (
  `crop-id` int(11) unsigned NOT NULL,
  `media-id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`crop-id`,`media-id`),
  CONSTRAINT `crop-id` FOREIGN KEY (`crop-id`) REFERENCES `crop` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `media-id` FOREIGN KEY (`crop-id`) REFERENCES `media` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crop-media`
--

LOCK TABLES `crop-media` WRITE;
/*!40000 ALTER TABLE `crop-media` DISABLE KEYS */;
/*!40000 ALTER TABLE `crop-media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detection`
--

DROP TABLE IF EXISTS `detection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detection` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `collection-date` datetime NOT NULL,
  `collection-location` varchar(45) NOT NULL,
  `collection-temperature` tinyint(8) DEFAULT NULL,
  `severity-id` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `approved` binary(1) DEFAULT NULL,
  `approver-id` int(11) DEFAULT NULL,
  `note-id` int(11) DEFAULT NULL,
  `weather-id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detection`
--

LOCK TABLES `detection` WRITE;
/*!40000 ALTER TABLE `detection` DISABLE KEYS */;
/*!40000 ALTER TABLE `detection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detection-pest`
--

DROP TABLE IF EXISTS `detection-pest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detection-pest` (
  `detection-id` int(10) unsigned NOT NULL,
  `pest-id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`detection-id`,`pest-id`),
  UNIQUE KEY `detection-id_UNIQUE` (`detection-id`),
  UNIQUE KEY `pest-id_UNIQUE` (`pest-id`),
  CONSTRAINT `detection-id` FOREIGN KEY (`detection-id`) REFERENCES `detection` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pest-id` FOREIGN KEY (`pest-id`) REFERENCES `pest` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detection-pest`
--

LOCK TABLES `detection-pest` WRITE;
/*!40000 ALTER TABLE `detection-pest` DISABLE KEYS */;
/*!40000 ALTER TABLE `detection-pest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detection-solution`
--

DROP TABLE IF EXISTS `detection-solution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detection-solution` (
  `sdetection-id` int(10) unsigned NOT NULL,
  `solution-id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sdetection-id`,`solution-id`),
  UNIQUE KEY `sdetection-id_UNIQUE` (`sdetection-id`),
  UNIQUE KEY `solution-id_UNIQUE` (`solution-id`),
  CONSTRAINT `sdetection-id` FOREIGN KEY (`sdetection-id`) REFERENCES `detection` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `solution-id` FOREIGN KEY (`solution-id`) REFERENCES `solution` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detection-solution`
--

LOCK TABLES `detection-solution` WRITE;
/*!40000 ALTER TABLE `detection-solution` DISABLE KEYS */;
/*!40000 ALTER TABLE `detection-solution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detection_media`
--

DROP TABLE IF EXISTS `detection_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detection_media` (
  `detection_id` int(10) unsigned NOT NULL,
  `media_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`detection_id`,`media_id`),
  UNIQUE KEY `detection_id_UNIQUE` (`detection_id`),
  UNIQUE KEY `media_id_UNIQUE` (`media_id`),
  CONSTRAINT `detection_id` FOREIGN KEY (`detection_id`) REFERENCES `detection` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detection_media`
--

LOCK TABLES `detection_media` WRITE;
/*!40000 ALTER TABLE `detection_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `detection_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detection_notes`
--

DROP TABLE IF EXISTS `detection_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detection_notes` (
  `detextion_id` int(10) unsigned NOT NULL,
  `notes_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`detextion_id`,`notes_id`),
  UNIQUE KEY `detextion_id_UNIQUE` (`detextion_id`),
  UNIQUE KEY `notes_id_UNIQUE` (`notes_id`),
  CONSTRAINT `detextion_id` FOREIGN KEY (`detextion_id`) REFERENCES `detection` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `notes_id` FOREIGN KEY (`notes_id`) REFERENCES `notes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detection_notes`
--

LOCK TABLES `detection_notes` WRITE;
/*!40000 ALTER TABLE `detection_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `detection_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmer`
--

DROP TABLE IF EXISTS `farmer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `farmer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `phone` varchar(24) NOT NULL,
  `email` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmer`
--

LOCK TABLES `farmer` WRITE;
/*!40000 ALTER TABLE `farmer` DISABLE KEYS */;
/*!40000 ALTER TABLE `farmer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `data` blob,
  `type` enum('pic','video','audio') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user-id` int(11) DEFAULT NULL,
  `note` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pest`
--

DROP TABLE IF EXISTS `pest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pest` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pest`
--

LOCK TABLES `pest` WRITE;
/*!40000 ALTER TABLE `pest` DISABLE KEYS */;
/*!40000 ALTER TABLE `pest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `severity`
--

DROP TABLE IF EXISTS `severity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `severity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `severity`
--

LOCK TABLES `severity` WRITE;
/*!40000 ALTER TABLE `severity` DISABLE KEYS */;
/*!40000 ALTER TABLE `severity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solution`
--

DROP TABLE IF EXISTS `solution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solution` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `ecotext` varchar(512) DEFAULT NULL,
  `chemtext` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solution`
--

LOCK TABLES `solution` WRITE;
/*!40000 ALTER TABLE `solution` DISABLE KEYS */;
/*!40000 ALTER TABLE `solution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solution-library`
--

DROP TABLE IF EXISTS `solution-library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solution-library` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solution-library`
--

LOCK TABLES `solution-library` WRITE;
/*!40000 ALTER TABLE `solution-library` DISABLE KEYS */;
/*!40000 ALTER TABLE `solution-library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(64) NOT NULL,
  `lastname` varchar(64) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `role` enum('student','researcher','professor','farmer') DEFAULT NULL,
  `media-id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather`
--

DROP TABLE IF EXISTS `weather`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weather` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather`
--

LOCK TABLES `weather` WRITE;
/*!40000 ALTER TABLE `weather` DISABLE KEYS */;
/*!40000 ALTER TABLE `weather` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-12 12:00:37
