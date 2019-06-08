-- MySQL dump 10.13  Distrib 8.0.14, for Win64 (x86_64)
--
-- Host: localhost    Database: xsolla_4_db
-- ------------------------------------------------------
-- Server version	8.0.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_name_uindex` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (4,'карьера и учёба'),(5,'материальные ценности'),(3,'саморазвитие'),(1,'социальная'),(2,'спорт');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `ranking` int(11) DEFAULT NULL,
  `var_value` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `service_name_uindex` (`name`),
  KEY `service_var_value_id_fk` (`var_value`),
  CONSTRAINT `service_var_value_id_fk` FOREIGN KEY (`var_value`) REFERENCES `var_value` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,'Udacity',1,NULL),(2,'Swifty',1,52),(3,'Swift',2,52),(4,'Codecademy Hour of Code',1,NULL),(5,'Lrn',1,NULL),(6,'Tynker',2,NULL),(7,'Khan Academy',1,NULL),(8,'Javvy',2,NULL),(9,'Coursera: Online courses',3,NULL),(10,'EdX — Online Courses',1,NULL),(11,'CodeCombat',1,NULL),(12,'CodeWars',1,NULL),(13,'https://metanit.com/sharp/',3,49),(14,'https://metanit.com/java/',3,56),(15,'https://metanit.com/web/',3,NULL),(16,'https://metanit.com/python/',2,51),(17,'https://metanit.com/cpp/',2,47),(18,'https://metanit.com/nosql/mongodb/',2,NULL),(19,'https://metanit.com/go/',2,50),(20,'https://metanit.com/visualbasic/tutorial/',2,53),(21,'https://metanit.com/swift/tutorial/',2,52),(22,'https://metanit.com/sql/mysql/',2,57),(23,'https://metanit.com/sql/postgresql/',3,58),(24,'http://begin-english.ru/samouchitel',3,1),(25,'https://lingust.ru/english',2,1),(26,'https://mir-slov.com/',1,1),(27,'https://lingust.ru/japanese',1,2),(28,'https://lingust.ru/deutsch/deutschunterricht',1,3),(31,'https://pythonworld.ru',3,51),(32,'https://kotlinlang.ru',3,55);
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `everyday` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,'купить самоучитель или книгу по языку',0),(2,'читать 10 страниц в день',1),(3,'учить 10 слов в день',1),(4,'перейти на язык в повседневной жизни (смотреть видео/читать тексты на этом языке)',1),(5,'перевести часть ПО на этот язык',1),(6,'пройти онлайн-курс',0),(7,'записаться на сдачу экзамена и сдать его',0),(8,'купить словарик',0),(9,'сделать карточки со словами и их переводами',0),(10,'проверить себя на специализированных сайтах или с помощью карточек',0),(11,'скачать необходимое ПО',0),(12,'смотреть 1 обучающее видео в день',1),(13,'изучать 3 функции ПО в день',1),(14,'практиковаться как минимум 20 минут в день',1),(15,'опубликовать работу и собрать фидбэк',0),(16,'купить необходимые инструменты',0),(17,'записаться в художественную школу',0),(18,'выполнять задания в этой школе',1),(19,'выпуститься из школы и сдать проект',0);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_template`
--

DROP TABLE IF EXISTS `task_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `task_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task` int(11) NOT NULL,
  `template` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `task_template_task_id_fk` (`task`),
  KEY `task_template_template_id_fk` (`template`),
  CONSTRAINT `task_template_task_id_fk` FOREIGN KEY (`task`) REFERENCES `task` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `task_template_template_id_fk` FOREIGN KEY (`template`) REFERENCES `template` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_template`
--

LOCK TABLES `task_template` WRITE;
/*!40000 ALTER TABLE `task_template` DISABLE KEYS */;
INSERT INTO `task_template` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,2),(9,9,2),(10,10,2),(11,3,2),(12,4,2),(13,5,2),(14,11,3),(15,12,3),(16,13,3),(17,14,3),(18,15,3),(19,16,4),(20,17,4),(21,18,4),(22,19,4),(23,1,16),(24,11,16),(25,12,16),(26,13,16),(27,14,16),(28,15,16),(29,6,16);
/*!40000 ALTER TABLE `task_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template`
--

DROP TABLE IF EXISTS `template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `category` int(11) NOT NULL,
  `formula` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `template_category_id_fk` (`category`),
  CONSTRAINT `template_category_id_fk` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template`
--

LOCK TABLES `template` WRITE;
/*!40000 ALTER TABLE `template` DISABLE KEYS */;
INSERT INTO `template` VALUES (1,'выучить язык до определенного уровня',3,'выучить %s язык до уровня %s'),(2,'выучить слова в языке',3,'выучить %d слов в %s языке'),(3,'научиться рисовать в программе',3,'научиться рисовать %s в программе %s'),(4,'научиться рисовать на бумаге',3,'научиться рисовать %s %s'),(5,'научиться играть на музыкальном инструменте',3,'научиться играть %d мелодий на %s'),(6,'пробежать марафон',2,'пробежать марафон длиной %d км'),(7,'научиться поднимать штангу',2,'научиться поднимать штангу %d кг %d раз подряд '),(8,'похудеть',2,'похудеть на %d кг'),(9,'набрать вес',2,'набрать %d кг'),(10,'приобрести',5,'накопить %d рублей для покупки %s'),(11,'накопить',5,'накопить %d рублей'),(12,'повысить квалификацию',4,'повыситься до %s'),(13,'приобрести квалификацию',4,'приобрести квалификацию %s'),(14,'принять участие',1,'принять участие в %s'),(15,'организовать',1,'организовать %s на %s уровне'),(16,'выучить язык программирования',4,'реализовать %d проектов на языке %d'),(17,'выучить конкретный язык SQL',4,'реализовать %d баз данных на языке %d');
/*!40000 ALTER TABLE `template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `value_name`
--

DROP TABLE IF EXISTS `value_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `value_name` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `scope` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `value_name_template_id_fk` (`scope`),
  CONSTRAINT `value_name_template_id_fk` FOREIGN KEY (`scope`) REFERENCES `template` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `value_name`
--

LOCK TABLES `value_name` WRITE;
/*!40000 ALTER TABLE `value_name` DISABLE KEYS */;
INSERT INTO `value_name` VALUES (1,'lang',1),(2,'level',1),(3,'events',14),(4,'lang',2),(5,'prog',3),(6,'style',4),(7,'level',15),(8,'music',5),(9,'events',15),(10,'lang',16),(11,'lang',17);
/*!40000 ALTER TABLE `value_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `var_value`
--

DROP TABLE IF EXISTS `var_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `var_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `value_name` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `var_value_value_names_id_fk` (`value_name`),
  CONSTRAINT `var_value_value_names_id_fk` FOREIGN KEY (`value_name`) REFERENCES `value_name` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `var_value`
--

LOCK TABLES `var_value` WRITE;
/*!40000 ALTER TABLE `var_value` DISABLE KEYS */;
INSERT INTO `var_value` VALUES (1,'английский',1),(2,'японский',1),(3,'немецкий',1),(4,'A1 (выживание)',2),(5,'A2 (предпороговый)',2),(6,'B1 (пороговой)',2),(7,'B2 (пороговый продвинутый)',2),(8,'C1 (профессиональный)',2),(9,'C2 (в совершенстве)',2),(10,'митинге',3),(11,'хакатоне',3),(12,'форуме',3),(13,'олимпиаде',3),(14,'фестивале',3),(15,'балу',3),(16,'английский',4),(17,'японский',4),(18,'немецкий',4),(19,'photoshop',5),(20,'paint tool sai',5),(21,'gimp',5),(22,'paint net',5),(23,'акварелью',6),(24,'карандашом',6),(25,'фломастерами',6),(26,'красками',6),(27,'без лайна',6),(28,'в стиле аниме',6),(29,'районном',7),(30,'муниципальном',7),(31,'городском',7),(32,'областном',7),(33,'краевом',7),(34,'всероссийском',7),(35,'международном',7),(36,'гитаре',8),(37,'скрипке',8),(38,'пианино',8),(39,'бояне',8),(40,'барабанах',8),(41,'форум',9),(42,'олимпиаду',9),(43,'фестиваль',9),(44,'бал',9),(45,'митинг',9),(46,'хакатон',9),(47,'C++',10),(48,'C',10),(49,'C#',10),(50,'Go',10),(51,'Python',10),(52,'Swift',10),(53,'Visual Basic',10),(54,'Java Script',10),(55,'Kotlin',10),(56,'Java',10),(57,'MySQL',11),(58,'PostgreSQL',11);
/*!40000 ALTER TABLE `var_value` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-08 21:23:19
