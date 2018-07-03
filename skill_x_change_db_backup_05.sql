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
INSERT INTO `Categories` VALUES ('09ddf25a-c7ee-4613-b40e-8fd374495bdf','travel','https://images.unsplash.com/photo-1495361174397-84e5b61bb77f?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1600&h=900&fit=crop&ixid=eyJhcHBfaWQiOjF9&s=13445d95ae8a60793096085ab4205685','2018-06-29 14:40:41','2018-06-29 14:40:41'),('6be8ec03-3cb9-47e7-9e29-059d47a6c620','sport','https://images.unsplash.com/photo-1475790052866-72dd161a712f?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1600&h=900&fit=crop&ixid=eyJhcHBfaWQiOjF9&s=ab2c6ffc3f6b6c8577649a3dace0afd3','2018-06-28 14:51:51','2018-06-28 14:51:51'),('864cb4f0-5d4b-4cf0-9717-7a3e94d6cc29','dance','https://images.unsplash.com/photo-1499439398383-cfcbab21207d?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1600&h=900&fit=crop&ixid=eyJhcHBfaWQiOjF9&s=a70249acc20a7a7ec78e247bb53b7cc7','2018-06-28 14:51:51','2018-06-28 14:51:51'),('9674f5db-d529-4852-a4e1-edca00a7965d','cooking','https://images.unsplash.com/photo-1461530927168-44328109da52?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1600&h=900&fit=crop&ixid=eyJhcHBfaWQiOjF9&s=16f65d0b3538d5e28aa7d6130b5142b8','2018-06-28 14:51:51','2018-06-28 14:51:51'),('9e343b15-64d3-4f56-81b0-98de27a66a8c','nature','https://images.unsplash.com/photo-1438129663958-a89900ab804b?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1600&h=900&fit=crop&ixid=eyJhcHBfaWQiOjF9&s=513a2e1a691f039a334bcf1bd9e7e9a1','2018-06-28 14:51:51','2018-06-28 14:51:51'),('a69b4260-9f1d-4d2c-a2dd-ecd43961b198','knowledge','https://images.unsplash.com/photo-1486125305436-b7144b0734f0?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1600&h=900&fit=crop&ixid=eyJhcHBfaWQiOjF9&s=3a7e4b7b506f25bbdc7ffcabcb80266a','2018-06-28 14:51:51','2018-06-28 14:51:51');
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
  `request_message` varchar(255) DEFAULT NULL,
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
INSERT INTO `Conversations` VALUES ('267c40b6-e89a-4bdf-a82f-5f0ac75b1f6a',0,'2018-06-30 11:29:36','2018-06-30 11:29:36','cd0a329a-aeb3-460c-9a1d-8682fee7dc9f','29cda09d-3a3e-44b5-9250-70674d843d87',NULL),('2cbfa480-19f3-44be-bc9c-22a2dcf25bd9',1,'2018-07-02 16:20:51','2018-07-02 17:06:05','882260e9-f2a8-4f23-9782-1fc719d48db0','efbca5a1-4700-477e-b74b-f86a7eb7929d','fun!'),('3a2bde9e-dc1c-46da-b728-3a7be0300097',0,'2018-07-02 16:31:36','2018-07-02 16:31:36','b2064265-fe67-4ba1-aa20-ddcadaa41daf','efbca5a1-4700-477e-b74b-f86a7eb7929d','hello'),('3a35a30a-60db-4a6f-8004-96e84609e5a9',1,'2018-06-30 11:17:53','2018-07-02 16:20:22','882260e9-f2a8-4f23-9782-1fc719d48db0','29cda09d-3a3e-44b5-9250-70674d843d87','Hello Rosita, I like your moves, dance moves. Would you consider teaching me sometime this week. In exchange I\'d be happy....'),('4166b3e7-27da-41a2-8fa9-d68cebf43b2c',0,'2018-07-02 14:43:42','2018-07-02 14:43:42','daede478-8d4d-41b2-a0dd-3228deeb418b','28992ac9-b2d3-437e-bf31-40469b247e67',''),('5474df3d-d1e1-436d-90a1-2a40afa7531e',0,'2018-06-30 11:24:23','2018-07-02 15:30:47','cd0a329a-aeb3-460c-9a1d-8682fee7dc9f','7a5ace07-7e37-408b-97a3-ca9d846dc42b',NULL),('59c64c0c-48ac-45a4-92f6-e5e413c92ab9',0,'2018-07-03 07:58:37','2018-07-03 07:58:37','b2064265-fe67-4ba1-aa20-ddcadaa41daf','efbca5a1-4700-477e-b74b-f86a7eb7929d','testing'),('74ca33f4-88c0-4207-9869-7d821a681e9e',0,'2018-07-02 16:22:17','2018-07-02 16:22:17','daede478-8d4d-41b2-a0dd-3228deeb418b','efbca5a1-4700-477e-b74b-f86a7eb7929d','fun'),('b4c2eb78-f694-4491-8246-ecfde70d7a94',0,'2018-07-02 14:54:07','2018-07-02 14:54:07','03861ead-3a37-4109-8ca3-1fde55cf5787','efbca5a1-4700-477e-b74b-f86a7eb7929d','testing'),('b838c4e6-166b-4ac6-8958-e782ed9a2a96',0,'2018-07-02 16:49:19','2018-07-02 16:49:19','b2064265-fe67-4ba1-aa20-ddcadaa41daf','efbca5a1-4700-477e-b74b-f86a7eb7929d','testiiiiiing'),('bd26e847-3199-4ae4-8582-5bdcd7f9d05e',1,'2018-06-30 11:18:49','2018-07-02 16:22:26','882260e9-f2a8-4f23-9782-1fc719d48db0','6fda3397-c2e0-42b5-8ba9-b1ee77966494','Such a nice skill, I\'m looking forward to get into it!!!'),('dd767096-cec6-452f-a920-900694c8c129',0,'2018-07-02 15:21:17','2018-07-02 15:21:17','daede478-8d4d-41b2-a0dd-3228deeb418b','efbca5a1-4700-477e-b74b-f86a7eb7929d','testing'),('e4fd28bc-13f4-4ee2-b7b2-8ee2dc9b7793',0,'2018-07-02 16:29:20','2018-07-02 16:29:20','882260e9-f2a8-4f23-9782-1fc719d48db0','efbca5a1-4700-477e-b74b-f86a7eb7929d','working'),('e717921f-b3f0-4a31-96e2-59e3dc8bd103',1,'2018-07-02 16:19:38','2018-07-02 16:21:26','882260e9-f2a8-4f23-9782-1fc719d48db0','efbca5a1-4700-477e-b74b-f86a7eb7929d','testing'),('ff73374f-80c0-47c2-afab-36c4e05596cb',0,'2018-07-02 14:44:24','2018-07-02 14:44:24','daede478-8d4d-41b2-a0dd-3228deeb418b','28992ac9-b2d3-437e-bf31-40469b247e67','testing');
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
  `message_creator_id` char(36) NOT NULL,
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
INSERT INTO `Messages` VALUES ('91af7212-3fde-43a5-a217-d49d1de23432','2018-07-02 16:49:57','7a5ace07-7e37-408b-97a3-ca9d846dc42b','Your skill looks amazing!!!','2018-07-02 16:49:57','2018-07-02 16:49:57','bd26e847-3199-4ae4-8582-5bdcd7f9d05e'),('aeff5da0-682c-49ad-9f8f-5da9bfcbc084','2018-07-03 08:23:47','7a5ace07-7e37-408b-97a3-ca9d846dc42b','Really amazing!','2018-07-03 08:23:47','2018-07-03 08:23:47','bd26e847-3199-4ae4-8582-5bdcd7f9d05e');
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
INSERT INTO `Skills` VALUES ('03861ead-3a37-4109-8ca3-1fde55cf5787','Trekking to the magic mountain, Montserrat','If you like hiking come to one of the most caracteristic mountain in Catalonia','Barcelona',161,0,'https://images.unsplash.com/photo-1529537333698-b2051a6e74bb?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1600&h=2000&fit=crop&ixid=eyJhcHBfaWQiOjF9&s=91df2f0ee9eb76c85864214be65bd88d','2018-06-29 13:03:31','2018-07-03 08:22:36','9e343b15-64d3-4f56-81b0-98de27a66a8c','28992ac9-b2d3-437e-bf31-40469b247e67'),('18c8ce06-5607-44ea-9434-10dc0de4cd28','10k run','Share a run by shore of Barcelona beach','Barcelona',102,0,'https://images.unsplash.com/photo-1518964304623-806d206bf2e8?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1600&h=900&fit=crop&ixid=eyJhcHBfaWQiOjF9&s=a7595b4b7d43c4316aedfabea32ed0c3','2018-06-30 10:18:21','2018-07-03 08:22:36','6be8ec03-3cb9-47e7-9e29-059d47a6c620','7a5ace07-7e37-408b-97a3-ca9d846dc42b'),('6ff313b6-e494-4cd2-b847-4afa25936dba','101: Sauna techniques','Curious about how to bath in a Sauna, step in, and experience something unique!','Barcelona',86,0,'https://d34ip4tojxno3w.cloudfront.net/app/uploads/Finland_sauna-400x300.jpg','2018-06-30 11:54:50','2018-07-03 07:55:48','9e343b15-64d3-4f56-81b0-98de27a66a8c','29cda09d-3a3e-44b5-9250-70674d843d87'),('882260e9-f2a8-4f23-9782-1fc719d48db0','How to make \'pa amb tomaquet\'','All you need to know about this simple but delicous traditional food','Barcelona',245,0,'https://images.unsplash.com/photo-1515084356819-83801a5f0a7a?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1600&h=900&fit=crop&ixid=eyJhcHBfaWQiOjF9&s=8099dfbd42499d728d120569ab4dffb7','2018-06-29 18:22:22','2018-07-02 17:51:16','9674f5db-d529-4852-a4e1-edca00a7965d','7a5ace07-7e37-408b-97a3-ca9d846dc42b'),('b2064265-fe67-4ba1-aa20-ddcadaa41daf','Up your Packing game','When travelling, the key to packing light is selecting versatile and interchangeable garments to sport om. If you want to learn more on packing a suitcase for a week-long trip – look no further, I can share the 5 best tips on this subject, and then some!','Barcelona',291,0,'https://images.unsplash.com/photo-1462043103994-3eb31d19a057?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1600&h=900&fit=crop&ixid=eyJhcHBfaWQiOjF9&s=9a53be0e5275b5f21e5da59889e1e458','2018-06-29 14:47:07','2018-07-03 07:58:30','09ddf25a-c7ee-4613-b40e-8fd374495bdf','6fda3397-c2e0-42b5-8ba9-b1ee77966494'),('cd0a329a-aeb3-460c-9a1d-8682fee7dc9f','Cuban Salsa moves','The beauty of Cuban salsa (when you know it) is that you can jump in to a group of ten dancers, all from different countries, none of whom you know, and together, instantly create a beautiful, synchronized dance choreography.','Barcelona',295,0,'http://legacy.shadowandact.com/wp-content/uploads/2017/02/dancing-in-the-streets-of-cuba.jpg','2018-06-29 14:11:35','2018-07-02 17:51:36','864cb4f0-5d4b-4cf0-9717-7a3e94d6cc29','6fda3397-c2e0-42b5-8ba9-b1ee77966494'),('daede478-8d4d-41b2-a0dd-3228deeb418b','Yoga in Ciutadella Park','Let\'s go to the park to enjoy the nice weather of Barcelona while practicing Yoga','Barcelona',93,0,'https://images.unsplash.com/photo-1508081685193-835a84a79091?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1600&h=900&fit=crop&ixid=eyJhcHBfaWQiOjF9&s=90748759861822f7135b143a83f7be01','2018-06-29 13:14:08','2018-07-02 17:51:46','6be8ec03-3cb9-47e7-9e29-059d47a6c620','28992ac9-b2d3-437e-bf31-40469b247e67');
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
INSERT INTO `Users` VALUES ('28992ac9-b2d3-437e-bf31-40469b247e67','Mark','Qinwitz',NULL,NULL,NULL,NULL,'2018-06-28 14:53:53',NULL,NULL,'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=109900983254785&height=200&width=200&ext=1530626595&hash=AeSlIxOJl-puw2ZX','109900983254785',NULL,'2018-06-28 14:53:53','2018-06-30 14:03:15'),('29cda09d-3a3e-44b5-9250-70674d843d87','Christopher','Harju','charju@abo.fi',NULL,NULL,NULL,'2018-06-29 13:23:11',NULL,NULL,'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=10157157275892366&height=200&width=200&ext=1530865750&hash=AeQ5Sq4LbYSxZti_','10157157275892366',NULL,'2018-06-29 13:23:11','2018-07-03 08:29:13'),('6fda3397-c2e0-42b5-8ba9-b1ee77966494','Pablo','Anttila',NULL,'01-01-1984','Swedish','By spite about do of do allow blush. Additions in conveying or collected objection in. Suffer few desire wonder her object hardly nearer. Abroad no chatty others my silent an. Fat way appear denote who wholly narrow gay settle. Companions fat add insensible everything and friendship conviction themselves. Theirs months ten had add narrow own. . ','2018-06-29 13:57:04','Barcelona',NULL,'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=190979358410536&height=200&width=200&ext=1530865249&hash=AeRZpioSEIqJV8HL','190979358410536',NULL,'2018-06-29 13:57:04','2018-07-03 08:20:50'),('7a5ace07-7e37-408b-97a3-ca9d846dc42b','David','Mir','davidecorreu@gmail.com','01-01-1988','Spanish','Expenses as material breeding insisted building to in. Continual so distrusts pronounce by unwilling listening. Thing do taste on we manor. Him had wound use found hoped. Of distrusts immediate enjoyment curiosity do. Marianne numerous saw thoughts the humoured. ','2018-06-28 14:50:09','Barcelona',NULL,'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=10217196115914110&height=200&width=200&ext=1530865660&hash=AeQ7lxdU8LLJHCYP','10217196115914110',NULL,'2018-06-28 14:50:09','2018-07-03 08:27:40'),('893cf0f2-f24f-49aa-b739-a31d9c235555','Linda','Fergiesen',NULL,NULL,NULL,NULL,'2018-06-28 14:54:38',NULL,NULL,'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=115276749381199&height=200&width=200&ext=1530456878&hash=AeRiIttMT-VzGrSi','115276749381199',NULL,'2018-06-28 14:54:38','2018-06-28 14:54:38'),('efbca5a1-4700-477e-b74b-f86a7eb7929d','Cristina','Ferreira','crisgferreira@gmail.com',NULL,NULL,NULL,'2018-07-02 14:51:56',NULL,NULL,'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=10212457914108898&height=200&width=200&ext=1530863560&hash=AeTuizKKQvOFU-Nb','10212457914108898',NULL,'2018-07-02 14:51:56','2018-07-03 07:52:40'),('eff71e8f-ffa1-413f-af9c-e133a2956a30','Patricia','Sharpeberg',NULL,NULL,NULL,NULL,'2018-06-28 14:53:18',NULL,NULL,'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=102877730629155&height=200&width=200&ext=1530456798&hash=AeSY2BP9R6uSBCv2','102877730629155',NULL,'2018-06-28 14:53:18','2018-06-28 14:53:18');
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

-- Dump completed on 2018-07-03 10:29:39
