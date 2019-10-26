-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: SOA4ID
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.16.04.1

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
-- Table structure for table `provinces`
--

DROP TABLE IF EXISTS `provinces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provinces` (
  `idProvinces` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `idCountries` int(11) NOT NULL,
  PRIMARY KEY (`idProvinces`),
  KEY `fk_provinces_countries1_idx` (`idCountries`),
  CONSTRAINT `fk_provinces_countries1` FOREIGN KEY (`idCountries`) REFERENCES `countries` (`idCountries`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provinces`
--

LOCK TABLES `provinces` WRITE;
/*!40000 ALTER TABLE `provinces` DISABLE KEYS */;
INSERT INTO `provinces` VALUES (1,'San Jose',1),(2,'Alajuela',1),(3,'Cartago',1),(4,'Heredia',1),(5,'Puntarenas',1),(6,'Guanacaste',1),(7,'Limon',1),(8,'David',2),(9,'Barcelona',5),(10,'Antofagasta',4),(11,'Atlantis',10),(12,'El dorado',10),(13,'Tokio',9),(14,'Rio de Janeiro',6),(15,'Nueva York',7),(16,'Los Angeles',7),(17,'Los Santos',7),(18,'San Andreas',7),(19,'San Fierro',7),(20,'Las Venturas',7),(21,'Tijuana',8),(22,'Toluca',8),(23,'Guadalajara',8),(24,'Asgard',10),(25,'California',7),(26,'Kyoto',9),(27,'Philadelpia',7),(28,'Madrid',5),(29,'Asturias',5),(30,'Galicia',5),(31,'Salamanca',5),(32,'Zaragoza',5),(33,'Mexico D.F',8),(34,'RedLine',10),(35,'Gotica',10),(36,'Villa Chica',10),(37,'Osaka',9),(39,'Okinawa',9),(40,'Buenos Aires',3),(41,'La Paz',4),(42,'Konoha',9),(43,'Kumogakure',9),(44,'Sunagakure',9),(45,'Kirigakure',9),(46,'Iwagakure',9),(47,'Brasilia',6),(48,'Texas',7),(49,'Iowa',7),(50,'La Plata',3);
/*!40000 ALTER TABLE `provinces` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-25 14:34:03
