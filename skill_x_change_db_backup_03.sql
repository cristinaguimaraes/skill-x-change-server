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
INSERT INTO `Conversations` VALUES ('267c40b6-e89a-4bdf-a82f-5f0ac75b1f6a',0,'2018-06-30 11:29:36','2018-06-30 11:29:36','cd0a329a-aeb3-460c-9a1d-8682fee7dc9f','29cda09d-3a3e-44b5-9250-70674d843d87'),('3a35a30a-60db-4a6f-8004-96e84609e5a9',0,'2018-06-30 11:17:53','2018-06-30 11:17:53','882260e9-f2a8-4f23-9782-1fc719d48db0','29cda09d-3a3e-44b5-9250-70674d843d87'),('5474df3d-d1e1-436d-90a1-2a40afa7531e',0,'2018-06-30 11:24:23','2018-06-30 11:24:23','cd0a329a-aeb3-460c-9a1d-8682fee7dc9f','7a5ace07-7e37-408b-97a3-ca9d846dc42b'),('bd26e847-3199-4ae4-8582-5bdcd7f9d05e',0,'2018-06-30 11:18:49','2018-06-30 11:18:49','882260e9-f2a8-4f23-9782-1fc719d48db0','6fda3397-c2e0-42b5-8ba9-b1ee77966494');
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
INSERT INTO `Reviews` VALUES ('0d552c3b-e3a0-4577-93f4-74b32dbe48d1','Dissuade ecstatic and properly saw entirely sir why laughter endeavor. In on my jointure horrible margaret suitable he followed speedily. Indeed vanity excuse or mr lovers of on. By offer scale an stuff. Blush be sorry no sight. Sang lose of hour then he left find.','2018-06-30 11:31:39','2018-06-30 11:31:39','2018-06-30 11:31:39','267c40b6-e89a-4bdf-a82f-5f0ac75b1f6a'),('241ed748-3b34-4a8b-8ea9-cb41bff63245','He share of first to worse. Weddings and any opinions suitable smallest nay. My he houses or months settle remove ladies appear.','2018-06-30 11:22:56','2018-06-30 11:22:56','2018-06-30 11:22:56','bd26e847-3199-4ae4-8582-5bdcd7f9d05e'),('7c411d8f-435d-4676-9b0a-f072bc722613','Had a great time! The food was amazing.','2018-06-30 11:21:09','2018-06-30 11:21:09','2018-06-30 11:21:09','3a35a30a-60db-4a6f-8004-96e84609e5a9'),('c9a27567-f487-46bc-ae61-8e535e3671d7','Much did had call new drew that kept. Limits expect wonder law she. Now has you views woman noisy match money rooms. To up remark it eldest length oh passed. Off because yet mistake feeling has men. Consulted disposing to moonlight ye extremity. Engage piqued in on coming. ','2018-06-30 11:32:12','2018-06-30 11:32:12','2018-06-30 11:32:12','5474df3d-d1e1-436d-90a1-2a40afa7531e');
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
INSERT INTO `Skills` VALUES ('03861ead-3a37-4109-8ca3-1fde55cf5787','Trekking to the magic mountain, Montserrat','If you like hiking come to one of the most caracteristic mountain in Catalonia','Barcelona',108,0,'https://www.pexels.com/photo/active-activity-adventure-backpack-547116/','2018-06-29 13:03:31','2018-06-30 17:26:35','9e343b15-64d3-4f56-81b0-98de27a66a8c','28992ac9-b2d3-437e-bf31-40469b247e67'),('18c8ce06-5607-44ea-9434-10dc0de4cd28','10k run','Share a run by shore of Barcelona beach','Barcelona',40,0,NULL,'2018-06-30 10:18:21','2018-06-30 17:24:19','6be8ec03-3cb9-47e7-9e29-059d47a6c620','7a5ace07-7e37-408b-97a3-ca9d846dc42b'),('5b3414bd-e4c0-4190-8b64-de22a0932f8c','10k run','Share a run by shore of Barcelona beach','Barcelona',18,0,NULL,'2018-06-30 09:57:29','2018-06-30 16:57:18','6be8ec03-3cb9-47e7-9e29-059d47a6c620','7a5ace07-7e37-408b-97a3-ca9d846dc42b'),('6ff313b6-e494-4cd2-b847-4afa25936dba','101: Sauna techniques','Curious about how to bath in a Sauna, step in, and experience something unique!','Barcelona',28,0,'https://d34ip4tojxno3w.cloudfront.net/app/uploads/Finland_sauna-400x300.jpg','2018-06-30 11:54:50','2018-06-30 17:28:19','9e343b15-64d3-4f56-81b0-98de27a66a8c','29cda09d-3a3e-44b5-9250-70674d843d87'),('882260e9-f2a8-4f23-9782-1fc719d48db0','How to make \'pa amb tomaquet\'','All you need to know about this simple but delicous traditional food','Barcelona',175,0,'https://www.pexels.com/photo/active-activity-adventure-backpack-547116/','2018-06-29 18:22:22','2018-06-30 17:26:45','9674f5db-d529-4852-a4e1-edca00a7965d','7a5ace07-7e37-408b-97a3-ca9d846dc42b'),('b2064265-fe67-4ba1-aa20-ddcadaa41daf','Up your Packing game','When travelling, the key to packing light is selecting versatile and interchangeable garments to sport om. If you want to learn more on packing a suitcase for a week-long trip – look no further, I can share the 5 best tips on this subject, and then some!','Barcelona',150,0,'https://images.unsplash.com/photo-1462043103994-3eb31d19a057?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1600&h=900&fit=crop&ixid=eyJhcHBfaWQiOjF9&s=9a53be0e5275b5f21e5da59889e1e458','2018-06-29 14:47:07','2018-06-30 17:25:48','09ddf25a-c7ee-4613-b40e-8fd374495bdf','6fda3397-c2e0-42b5-8ba9-b1ee77966494'),('cd0a329a-aeb3-460c-9a1d-8682fee7dc9f','Cuban Salsa moves','The beauty of Cuban salsa (when you know it) is that you can jump in to a group of ten dancers, all from different countries, none of whom you know, and together, instantly create a beautiful, synchronized dance choreography.','Barcelona',179,0,'http://legacy.shadowandact.com/wp-content/uploads/2017/02/dancing-in-the-streets-of-cuba.jpg','2018-06-29 14:11:35','2018-06-30 17:29:21','864cb4f0-5d4b-4cf0-9717-7a3e94d6cc29','6fda3397-c2e0-42b5-8ba9-b1ee77966494'),('daede478-8d4d-41b2-a0dd-3228deeb418b','Yoga in Ciutadella Park','Let\'s go to the park to enjoy the nice weather of Barcelona while practicing Yoga','Barcelona',60,0,'https://www.pexels.com/photo/active-activity-adventure-backpack-547116/','2018-06-29 13:14:08','2018-06-30 17:31:15','6be8ec03-3cb9-47e7-9e29-059d47a6c620','28992ac9-b2d3-437e-bf31-40469b247e67'),('f98ef857-bd63-4dfd-b60f-4a959288db9b','101: Sauna techniques','Curious about how to bath in a Sauna, step in, and experience something unique!','Barcelona',21,0,'https://d34ip4tojxno3w.cloudfront.net/app/uploads/Finland_sauna-400x300.jpg','2018-06-30 11:36:41','2018-06-30 16:57:09','9e343b15-64d3-4f56-81b0-98de27a66a8c','29cda09d-3a3e-44b5-9250-70674d843d87');
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
INSERT INTO `Users` VALUES ('28992ac9-b2d3-437e-bf31-40469b247e67','Mark','Qinwitz',NULL,NULL,NULL,NULL,'2018-06-28 14:53:53',NULL,NULL,'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=109900983254785&height=200&width=200&ext=1530626595&hash=AeSlIxOJl-puw2ZX','109900983254785',NULL,'2018-06-28 14:53:53','2018-06-30 14:03:15'),('29cda09d-3a3e-44b5-9250-70674d843d87','Christopher','Harju','charju@abo.fi',NULL,NULL,NULL,'2018-06-29 13:23:11',NULL,NULL,'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=10157157275892366&height=200&width=200&ext=1530637999&hash=AeQbhBl8Rd8FY0HW','10157157275892366',NULL,'2018-06-29 13:23:11','2018-06-30 17:13:19'),('6fda3397-c2e0-42b5-8ba9-b1ee77966494','Pablo','Anttila',NULL,'01-01-1984','Swedish','By spite about do of do allow blush. Additions in conveying or collected objection in. Suffer few desire wonder her object hardly nearer. Abroad no chatty others my silent an. Fat way appear denote who wholly narrow gay settle. Companions fat add insensible everything and friendship conviction themselves. Theirs months ten had add narrow own. . ','2018-06-29 13:57:04','Barcelona',NULL,'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=190979358410536&height=200&width=200&ext=1530539824&hash=AeQ2Dyzx7hEE3EAq','190979358410536',NULL,'2018-06-29 13:57:04','2018-06-30 11:10:59'),('7a5ace07-7e37-408b-97a3-ca9d846dc42b','David','Mir','davidecorreu@gmail.com','01-01-1988','Spanish','Expenses as material breeding insisted building to in. Continual so distrusts pronounce by unwilling listening. Thing do taste on we manor. Him had wound use found hoped. Of distrusts immediate enjoyment curiosity do. Marianne numerous saw thoughts the humoured. ','2018-06-28 14:50:09','Barcelona',NULL,'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=10217196115914110&height=200&width=200&ext=1530640643&hash=AeQug_hX39JvwuQR','10217196115914110',NULL,'2018-06-28 14:50:09','2018-06-30 17:57:23'),('893cf0f2-f24f-49aa-b739-a31d9c235555','Linda','Fergiesen',NULL,NULL,NULL,NULL,'2018-06-28 14:54:38',NULL,NULL,'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=115276749381199&height=200&width=200&ext=1530456878&hash=AeRiIttMT-VzGrSi','115276749381199',NULL,'2018-06-28 14:54:38','2018-06-28 14:54:38'),('eff71e8f-ffa1-413f-af9c-e133a2956a30','Patricia','Sharpeberg',NULL,NULL,NULL,NULL,'2018-06-28 14:53:18',NULL,NULL,'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=102877730629155&height=200&width=200&ext=1530456798&hash=AeSY2BP9R6uSBCv2','102877730629155',NULL,'2018-06-28 14:53:18','2018-06-28 14:53:18');
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

-- Dump completed on 2018-06-30 20:01:16
