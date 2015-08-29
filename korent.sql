-- MySQL dump 10.14  Distrib 5.5.44-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: korent
-- ------------------------------------------------------
-- Server version	5.5.44-MariaDB-log

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  PRIMARY KEY (`aid`),
  UNIQUE KEY `UK_5cca88c6i17ttuegcvdkgehah` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follow` (
  `uid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  KEY `FK_m3snfbnyeimqngtt5ie8wamt` (`rid`),
  KEY `FK_r3awpfjt8kgdw4hrokne1lrsu` (`uid`),
  CONSTRAINT `FK_m3snfbnyeimqngtt5ie8wamt` FOREIGN KEY (`rid`) REFERENCES `rent` (`rid`),
  CONSTRAINT `FK_r3awpfjt8kgdw4hrokne1lrsu` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notify`
--

DROP TABLE IF EXISTS `notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notify` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `ToId` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notify`
--

LOCK TABLES `notify` WRITE;
/*!40000 ALTER TABLE `notify` DISABLE KEYS */;
/*!40000 ALTER TABLE `notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picturePath`
--

DROP TABLE IF EXISTS `picturePath`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `picturePath` (
  `rid` int(11) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`rid`,`id`),
  CONSTRAINT `FK_bnlno6jrtky9i6lf56c7t76xx` FOREIGN KEY (`rid`) REFERENCES `rent` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picturePath`
--

LOCK TABLES `picturePath` WRITE;
/*!40000 ALTER TABLE `picturePath` DISABLE KEYS */;
/*!40000 ALTER TABLE `picturePath` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rent`
--

DROP TABLE IF EXISTS `rent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rent` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `district` varchar(20) NOT NULL,
  `province` varchar(20) NOT NULL,
  `classify` varchar(255) NOT NULL,
  `description` varchar(3000) NOT NULL,
  `priceDescription` varchar(30) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `updateDate` date DEFAULT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL,
  PRIMARY KEY (`rid`),
  KEY `FK_1ogcvngy59ny1gbk24tskpsmr` (`ownerId`),
  KEY `FK_4uxmjp03a1lf0plfj0b2ji8nv` (`orderId`),
  CONSTRAINT `FK_1ogcvngy59ny1gbk24tskpsmr` FOREIGN KEY (`ownerId`) REFERENCES `user` (`uid`),
  CONSTRAINT `FK_4uxmjp03a1lf0plfj0b2ji8nv` FOREIGN KEY (`orderId`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rent`
--

LOCK TABLES `rent` WRITE;
/*!40000 ALTER TABLE `rent` DISABLE KEYS */;
INSERT INTO `rent` VALUES (1,'xian','changan','xianyoudian','shanxi','fangzi','adfa',NULL,NULL,NULL,NULL,NULL),(2,'xian','changan','xianyoudian','shanxi','fangzi','adfa',NULL,NULL,NULL,2,2),(3,'xian','changan','xianyoudian','shanxi','fangzi','adfa',NULL,NULL,NULL,3,4),(4,'xian','changan','xianyoudian','shanxi','fangzi','adfa',NULL,NULL,NULL,4,2),(5,'xian','changan','xianyoudian','shanxi','fangzi','adfa',NULL,NULL,NULL,6,3),(6,'xian','changan','xianyoudian','shanxi','fangzi','adfa',NULL,NULL,NULL,5,4),(7,'xian','changan','xianyoudian','shanxi','fangzi','adfa',NULL,NULL,NULL,2,3),(8,'xian','changan','xianyoudian','shanxi','fangzi','adfa',NULL,NULL,NULL,NULL,3),(9,'xian','changan','xianyoudian','shanxi','fangzi','adfa',NULL,NULL,NULL,4,4),(10,'xian','changan','xianyoudian','shanxi','fangzi','adfa',NULL,NULL,NULL,3,5),(11,'xian','changan','xianyoudian','shanxi','fangzi','adfa',NULL,NULL,NULL,4,3),(12,'xian','changan','xianyoudian','shanxi','fangzi','adfa',NULL,NULL,NULL,NULL,5),(13,'xian','changan','xianyoudian','shanxi','fangzi','adfa',NULL,NULL,NULL,3,3);
/*!40000 ALTER TABLE `rent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `UK_gj2fy3dcix7ph7k8684gka40c` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'1679211339@qq.com','leilei1','change My Password',NULL,NULL),(3,'1679211339@qq.com','leilei2','leilei',NULL,NULL),(4,'1679211339@qq.com','leilei3','leilei',NULL,NULL),(5,'1679211339@qq.com','leilei4','leilei',NULL,NULL),(6,'1679211339@qq.com','leilei5','leilei',NULL,NULL),(7,'1679211339@qq.com','leilei6','leilei',NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-29  8:29:05
