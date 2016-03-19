-- MySQL dump 10.13  Distrib 5.6.24, for Win32 (x86)
--
-- Host: localhost    Database: scratchcard
-- ------------------------------------------------------
-- Server version	5.6.23

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
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `MEM_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `NETID` varchar(11) NOT NULL,
  `PASSWORD` varchar(11) NOT NULL DEFAULT '',
  `DEPT_ID` int(11) DEFAULT NULL,
  `TEAM_ID` int(11) unsigned NOT NULL,
  `ROLE` varchar(50) NOT NULL DEFAULT '',
  `FIRSTNAME` varchar(20) DEFAULT NULL,
  `LASTNAME` varchar(20) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MEM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'ab543941','ab543941',1,1,'student','Alex','Brown','aabrown@albany.edu'),(2,'yj859275','yj859275',1,1,'student','You Kyung','Jeon','yjeon@albany.edu'),(3,'ao474158','ao474158',1,1,'student','Abdul','Owoiya','aowoiya@albany.edu'),(4,'bs568487','bs568487',1,1,'student','Benjamin','Sano','bsano@albany.edu'),(5,'as372144','as372144',1,1,'student','Lexi','Schermerhorn','aschermerhorn@albany.edu'),(6,'as412436','as412436',1,1,'student','Andrew','Streichler','astreichler@albany.edu'),(7,'zy1614422','zy1614422',1,1,'lead','Zeyu','Yao','zyao@albany.edu'),(8,'mr988476_s','mr988476_s',1,1,'student','Demo','Student','mmrana@albany.edu'),(9,'cc154751','cc154751',1,2,'student','Cristal','Cedano','ccedano@albany.edu'),(10,'ac617822','ac617822',1,2,'student','Anna','Cheung','acheung@albany.edu'),(11,'bg117496','bg117496',1,2,'student','Brandon','Garvey','bgarvey@albany.edu'),(12,'mk937774','mk937774',1,2,'student','Micheal','Kubenik','mkubenik@albany.edu'),(13,'cm397321','cm397321',1,2,'student','Christopher',' Maggiulli','cmaggiulli@albany.edu'),(14,'bv366458','bv366458',1,2,'student','Brandon','Viertel','bviertal@albany.edu'),(15,'rw626915','rw626915',1,2,'lead','Rob','Warshauer','rwarshauer@albany.edu'),(16,'da392927','da392927',1,2,'student','Dahlin','Aguilar','daguilar@albany.edu'),(17,'mr988476','mr988476',1,0,'professor','Mukhtar','Rana','mmrana@albany.edu');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `MSG_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `MEM_ID` int(11) unsigned NOT NULL,
  `TEAM_ID` int(11) unsigned NOT NULL,
  `MESSAGE` varchar(200) DEFAULT '',
  `TIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`MSG_ID`),
  KEY `FK_3` (`MEM_ID`),
  KEY `FK_4` (`TEAM_ID`),
  CONSTRAINT `FK_3` FOREIGN KEY (`MEM_ID`) REFERENCES `members` (`MEM_ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_4` FOREIGN KEY (`TEAM_ID`) REFERENCES `team` (`TEAM_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scores`
--

DROP TABLE IF EXISTS `scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scores` (
  `SCOR_ID` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `SCORE` int(11) NOT NULL DEFAULT '0',
  `DATE` date NOT NULL,
  `TEAM_ID` int(11) unsigned DEFAULT NULL,
  `EXAM` varchar(50) DEFAULT NULL,
  `MEM_ID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`SCOR_ID`),
  KEY `FK_5` (`TEAM_ID`),
  KEY `FK_7` (`MEM_ID`),
  CONSTRAINT `FK_7` FOREIGN KEY (`MEM_ID`) REFERENCES `members` (`MEM_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scores`
--

LOCK TABLES `scores` WRITE;
/*!40000 ALTER TABLE `scores` DISABLE KEYS */;
INSERT INTO `scores` VALUES (00000000001,35,'2015-09-15',1,'Web Programming',1),(00000000002,35,'2015-09-15',1,'Web Programming',3),(00000000003,35,'2015-09-15',1,'Web Programming',4),(00000000004,35,'2015-09-15',1,'Web Programming',5),(00000000005,20,'2015-09-15',2,'Web Programming',6),(00000000006,20,'2015-09-15',2,'Web Programming',7),(00000000007,20,'2015-09-15',2,'Web Programming',8),(00000000008,20,'2015-09-15',2,'Web Programming',9);
/*!40000 ALTER TABLE `scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `TEAM_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `SCORES_ID` int(11) unsigned NOT NULL,
  `DATE` date NOT NULL,
  `NETID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`TEAM_ID`),
  KEY `FK_6` (`SCORES_ID`),
  CONSTRAINT `FK_6` FOREIGN KEY (`SCORES_ID`) REFERENCES `scores` (`SCOR_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-02 12:16:26
