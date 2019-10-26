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
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurants` (
  `idRestaurants` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `idProvinces` int(11) NOT NULL,
  PRIMARY KEY (`idRestaurants`),
  KEY `fk_restaurants_provinces1_idx` (`idProvinces`),
  CONSTRAINT `fk_restaurants_provinces1` FOREIGN KEY (`idProvinces`) REFERENCES `provinces` (`idProvinces`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES (1,'La Sanwuchera','Por el tec',3),(2,'Monkeys','En buenos centro',5),(3,'Mauss Pizza','Buenos Aires, sintetica',5),(4,'Satur Bar','Frente a Mauss',5),(5,'La 33','Frente al tec',3),(6,'El rest del tata de sebas','En moravia',1),(7,'La cuchara de dona Ana','En san vito ',6),(8,'Pepes','Al frente de donde vive thor',16),(9,'El naruto','Por konoha',28),(10,'Erasmus cocina','Al frente de donde jorge',10),(11,'Kuber','Por docky',50),(12,'Solo hay agua','Por la piedra',19),(13,'Tacaños bar','250 mts sur de donde el profe',41),(14,'El fogon','Por la flor de la sabana',5),(15,'Tía marta','En donde tía marta',33),(16,'El hormiguero rest','Cañas centro',7),(17,'Josefas restaurante','Por el bajo del paraíso',14),(18,'Bob burguers','En compton',23),(19,'Wahl burguers','En medio USA',17),(20,'La sodita','Santo Domingo',4);
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-25 14:34:04
