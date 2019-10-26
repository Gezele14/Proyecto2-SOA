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
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `idClients` int(11) NOT NULL AUTO_INCREMENT,
  `identification` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phoneNumber` int(11) NOT NULL,
  `idProvinces` int(11) NOT NULL,
  PRIMARY KEY (`idClients`),
  KEY `fk_clients_provinces1_idx` (`idProvinces`),
  CONSTRAINT `fk_clients_provinces1` FOREIGN KEY (`idProvinces`) REFERENCES `provinces` (`idProvinces`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,116630006,'Juan D','Esquivel','Buenos Aires centro','juanesro@gmail.com',86074248,5),(2,102133326,'Meca','Dios del futbol','La selva de cartago','mecadios@gmail.com',89247112,3),(3,763211276,'MM','Aguilar','La selva de turrialba','doblemm@gmail.com',88231482,3),(4,531719213,'Kathya','Rojas','EL socorro','kath29@gmail.com',83125243,5),(5,239184213,'Serca','Sama','Chepelandia','sercakun1@gmail.com',88943241,1),(6,431173128,'Sebastian','Villalobos','Ciudad Cortez','sebcord@gmail.com',81243923,5),(7,124818216,'Sebastian','Rivera','Moravia','sebas123@gmail.com',81749932,1),(8,332148291,'Lorena','Porras','En el bajo de buenos','lore231@hotmail.com',82148392,23),(9,249381221,'Josefa','Rodriguez','Al frente de asgard','josefis89@hotmail.com',87313429,41),(10,123456789,'Mari','Huana','Barrio Jamaica','huanamari69@yahoo.es',87383129,17),(11,123188926,'Odara','Lopez','Volcan','odlop21@gmail.com',83122318,11),(12,342819127,'Juan Erney','Esquivel','Buenos aires centro','jerney25@gmail.com',84312482,24),(13,124392421,'Maria','La auxiliadora','Por ahí perdidilla','lamamaria@gmail.com',75392981,19),(14,573191842,'Rober','Calderon','Turrialba','robcal329@gmail.com',89884788,8),(15,321249211,'Pedro','Elescamoso','La vecindad del chavo','pedrito22@gmail.com',75419821,34);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
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
