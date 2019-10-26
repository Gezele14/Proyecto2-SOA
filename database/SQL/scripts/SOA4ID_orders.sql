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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `idOrders` int(11) NOT NULL AUTO_INCREMENT,
  `orderDate` datetime NOT NULL,
  `details` varchar(45) DEFAULT NULL,
  `idRestaurants` int(11) NOT NULL,
  PRIMARY KEY (`idOrders`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2008-11-11 13:23:44','Cena',4),(2,'2008-11-09 15:45:21','Almuerzo',2),(3,'2008-10-29 07:56:59','Desayuno',8),(4,'2016-10-29 14:56:59','Cafe',9),(5,'2016-12-02 11:12:59','Cervezas',17),(6,'2017-08-13 14:05:12','Cena',5),(7,'2019-10-03 21:43:18','Almuerzo',17),(8,'2018-04-21 12:06:51','Almuerzo',4),(9,'2011-12-24 13:16:34','Almuerzo',8),(10,'2017-11-01 22:32:02','Cena',12),(11,'2015-08-24 06:57:42','Desayuno',19),(12,'2016-09-27 08:31:12','Desayuno',20),(13,'2012-07-04 19:37:53','Cena',11),(14,'2019-01-11 21:04:16','Cena',1),(15,'2018-01-23 19:09:09','Cena',9),(16,'2013-03-11 23:36:43','Cena',16),(17,'2017-05-08 10:19:07','Bebidas',5),(18,'2019-12-10 22:44:55','Cervezas',8),(19,'2016-06-21 09:36:59','Cafe',2),(20,'2017-04-09 18:28:22','Cena',13);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
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
