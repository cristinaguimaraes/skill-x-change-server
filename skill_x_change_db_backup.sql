-- MySQL dump 10.13  Distrib 8.0.11, for osx10.13 (x86_64)
--
-- Host: localhost    Database: skill_x_change_db
-- ------------------------------------------------------
-- Server version	8.0.11

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
-- Table structure for table `Categories`
--

DROP TABLE IF EXISTS `Categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Categories` (
  `pk_category_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(30) NOT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`pk_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categories`
--

LOCK TABLES `Categories` WRITE;
/*!40000 ALTER TABLE `Categories` DISABLE KEYS */;
INSERT INTO `Categories` VALUES ('09ddf25a-c7ee-4613-b40e-8fd374495bdf','travel','https://source.unsplash.com/1600x900/?travel,travellers','2018-06-29 14:40:41','2018-06-29 14:40:41'),('6be8ec03-3cb9-47e7-9e29-059d47a6c620','sport','https://unsplash.com/photos/PHIgYUGQPvU','2018-06-28 14:51:51','2018-06-28 14:51:51'),('864cb4f0-5d4b-4cf0-9717-7a3e94d6cc29','dance','https://unsplash.com/photos/Yyk4OmVJAyE','2018-06-28 14:51:51','2018-06-28 14:51:51'),('9674f5db-d529-4852-a4e1-edca00a7965d','cooking','https://unsplash.com/photos/vlXAcYROlKY','2018-06-28 14:51:51','2018-06-28 14:51:51'),('9e343b15-64d3-4f56-81b0-98de27a66a8c','nature','https://unsplash.com/photos/b82R8cnxfZg','2018-06-28 14:51:51','2018-06-28 14:51:51'),('a69b4260-9f1d-4d2c-a2dd-ecd43961b198','knowledge','https://unsplash.com/photos/a-AWnRtwlWM','2018-06-28 14:51:51','2018-06-28 14:51:51');
/*!40000 ALTER TABLE `Categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Conversations`
--

DROP TABLE IF EXISTS `Conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Conversations` (
  `pk_conversation_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `approved` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `fk_skill_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fk_sender_user_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`pk_conversation_id`),
  KEY `fk_skill_id` (`fk_skill_id`),
  KEY `fk_sender_user_id` (`fk_sender_user_id`),
  CONSTRAINT `conversations_ibfk_1` FOREIGN KEY (`fk_skill_id`) REFERENCES `skills` (`pk_skill_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `conversations_ibfk_2` FOREIGN KEY (`fk_sender_user_id`) REFERENCES `users` (`pk_user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Conversations`
--

LOCK TABLES `Conversations` WRITE;
/*!40000 ALTER TABLE `Conversations` DISABLE KEYS */;
/*!40000 ALTER TABLE `Conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Messages`
--

DROP TABLE IF EXISTS `Messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Messages` (
  `pk_message_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `time_stamp` datetime NOT NULL,
  `message` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `fk_conversation_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`pk_message_id`),
  KEY `fk_conversation_id` (`fk_conversation_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`fk_conversation_id`) REFERENCES `conversations` (`pk_conversation_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Messages`
--

LOCK TABLES `Messages` WRITE;
/*!40000 ALTER TABLE `Messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `Messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reviews`
--

DROP TABLE IF EXISTS `Reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Reviews` (
  `pk_review_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` varchar(400) NOT NULL,
  `time_stamp` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `fk_conversation_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`pk_review_id`),
  KEY `fk_conversation_id` (`fk_conversation_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`fk_conversation_id`) REFERENCES `conversations` (`pk_conversation_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reviews`
--

LOCK TABLES `Reviews` WRITE;
/*!40000 ALTER TABLE `Reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `Reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Skills`
--

DROP TABLE IF EXISTS `Skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Skills` (
  `pk_skill_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(400) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `counter_visits` int(11) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  `img_url` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `fk_category_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fk_user_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`pk_skill_id`),
  KEY `fk_category_id` (`fk_category_id`),
  KEY `fk_user_id` (`fk_user_id`),
  CONSTRAINT `skills_ibfk_1` FOREIGN KEY (`fk_category_id`) REFERENCES `categories` (`pk_category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `skills_ibfk_2` FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`pk_user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Skills`
--

LOCK TABLES `Skills` WRITE;
/*!40000 ALTER TABLE `Skills` DISABLE KEYS */;
INSERT INTO `Skills` VALUES ('03861ead-3a37-4109-8ca3-1fde55cf5787','Trekking to the magic mountain, Montserrat','If you like hiking come to one of the most caracteristic mountain in Catalonia','Barcelona',90,0,'https://www.pexels.com/photo/active-activity-adventure-backpack-547116/','2018-06-29 13:03:31','2018-06-30 10:53:51','9e343b15-64d3-4f56-81b0-98de27a66a8c','28992ac9-b2d3-437e-bf31-40469b247e67'),('18c8ce06-5607-44ea-9434-10dc0de4cd28','10k run','Share a run by shore of Barcelona beach','Barcelona',9,0,NULL,'2018-06-30 10:18:21','2018-06-30 10:53:47','6be8ec03-3cb9-47e7-9e29-059d47a6c620','7a5ace07-7e37-408b-97a3-ca9d846dc42b'),('5b3414bd-e4c0-4190-8b64-de22a0932f8c','10k run','Share a run by shore of Barcelona beach','Barcelona',1,0,NULL,'2018-06-30 09:57:29','2018-06-30 10:26:03','6be8ec03-3cb9-47e7-9e29-059d47a6c620','7a5ace07-7e37-408b-97a3-ca9d846dc42b'),('882260e9-f2a8-4f23-9782-1fc719d48db0','How to make \'pa amb tomaquet\'','All you need to know about this simple but delicous traditional food','Barcelona',91,0,'https://www.pexels.com/photo/active-activity-adventure-backpack-547116/','2018-06-29 18:22:22','2018-06-30 10:54:35','9674f5db-d529-4852-a4e1-edca00a7965d','7a5ace07-7e37-408b-97a3-ca9d846dc42b'),('b2064265-fe67-4ba1-aa20-ddcadaa41daf','Up your Packing game','When travelling, the key to packing light is selecting versatile and interchangeable garments to sport om. If you want to learn more on packing a suitcase for a week-long trip – look no further, I can share the 5 best tips on this subject, and then some!','Barcelona',102,0,'https://images.unsplash.com/photo-1462043103994-3eb31d19a057?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1600&h=900&fit=crop&ixid=eyJhcHBfaWQiOjF9&s=9a53be0e5275b5f21e5da59889e1e458','2018-06-29 14:47:07','2018-06-30 10:54:19','09ddf25a-c7ee-4613-b40e-8fd374495bdf','6fda3397-c2e0-42b5-8ba9-b1ee77966494'),('cd0a329a-aeb3-460c-9a1d-8682fee7dc9f','Cuban Salsa moves','The beauty of Cuban salsa (when you know it) is that you can jump in to a group of ten dancers, all from different countries, none of whom you know, and together, instantly create a beautiful, synchronized dance choreography.','Barcelona',111,0,'http://legacy.shadowandact.com/wp-content/uploads/2017/02/dancing-in-the-streets-of-cuba.jpg','2018-06-29 14:11:35','2018-06-30 10:36:47','864cb4f0-5d4b-4cf0-9717-7a3e94d6cc29','6fda3397-c2e0-42b5-8ba9-b1ee77966494'),('daede478-8d4d-41b2-a0dd-3228deeb418b','Yoga in Ciutadella Park','Let\'s go to the park to enjoy the nice weather of Barcelona while practicing Yoga','Barcelona',45,0,'https://www.pexels.com/photo/active-activity-adventure-backpack-547116/','2018-06-29 13:14:08','2018-06-30 09:48:27','6be8ec03-3cb9-47e7-9e29-059d47a6c620','28992ac9-b2d3-437e-bf31-40469b247e67');
/*!40000 ALTER TABLE `Skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Users` (
  `pk_user_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(30) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `date_of_birth` varchar(30) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `last_login` datetime NOT NULL,
  `current_location` varchar(255) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `fb_id` varchar(255) DEFAULT NULL,
  `auth_type` varchar(50) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`pk_user_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `fb_id` (`fb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES ('28992ac9-b2d3-437e-bf31-40469b247e67','Mark','Qinwitz',NULL,NULL,NULL,NULL,'2018-06-28 14:53:53',NULL,NULL,'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=109900983254785&height=200&width=200&ext=1530555125&hash=AeSrgt7A9r5E4kAV','109900983254785',NULL,'2018-06-28 14:53:53','2018-06-29 18:12:05'),('29cda09d-3a3e-44b5-9250-70674d843d87','Christopher','Harju','charju@abo.fi',NULL,NULL,NULL,'2018-06-29 13:23:11',NULL,NULL,'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=10157157275892366&height=200&width=200&ext=1530557288&hash=AeRE4jzcGNm66PpE','10157157275892366',NULL,'2018-06-29 13:23:11','2018-06-29 18:48:09'),('6fda3397-c2e0-42b5-8ba9-b1ee77966494','Pablo','Anttila',NULL,NULL,NULL,NULL,'2018-06-29 13:57:04',NULL,NULL,'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=190979358410536&height=200&width=200&ext=1530539824&hash=AeQ2Dyzx7hEE3EAq','190979358410536',NULL,'2018-06-29 13:57:04','2018-06-29 13:57:04'),('7a5ace07-7e37-408b-97a3-ca9d846dc42b','David','Mir','davidecorreu@gmail.com',NULL,NULL,NULL,'2018-06-28 14:50:09',NULL,NULL,'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=10217196115914110&height=200&width=200&ext=1530547957&hash=AeT8vMNcXX3P3WS4','10217196115914110',NULL,'2018-06-28 14:50:09','2018-06-29 16:12:37'),('893cf0f2-f24f-49aa-b739-a31d9c235555','Linda','Fergiesen',NULL,NULL,NULL,NULL,'2018-06-28 14:54:38',NULL,NULL,'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=115276749381199&height=200&width=200&ext=1530456878&hash=AeRiIttMT-VzGrSi','115276749381199',NULL,'2018-06-28 14:54:38','2018-06-28 14:54:38'),('eff71e8f-ffa1-413f-af9c-e133a2956a30','Patricia','Sharpeberg',NULL,NULL,NULL,NULL,'2018-06-28 14:53:18',NULL,NULL,'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=102877730629155&height=200&width=200&ext=1530456798&hash=AeSY2BP9R6uSBCv2','102877730629155',NULL,'2018-06-28 14:53:18','2018-06-28 14:53:18');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-30 12:59:09
