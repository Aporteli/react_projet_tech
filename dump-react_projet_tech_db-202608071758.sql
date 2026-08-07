-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: react_projet_tech_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attribute_group_translations`
--

DROP TABLE IF EXISTS `attribute_group_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_group_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attr_group_locale_unique` (`attribute_group_id`,`locale`),
  CONSTRAINT `attribute_group_translations_ibfk_1` FOREIGN KEY (`attribute_group_id`) REFERENCES `attribute_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_group_translations`
--

LOCK TABLES `attribute_group_translations` WRITE;
/*!40000 ALTER TABLE `attribute_group_translations` DISABLE KEYS */;
INSERT INTO `attribute_group_translations` VALUES (1,1,'en','General Information'),(2,2,'en','Network'),(5,3,'en','Display'),(6,4,'en','Processor'),(7,5,'en','Memory'),(8,6,'en','Camera'),(9,1,'ru','Общая информация'),(10,2,'ru','Сеть'),(11,3,'ru','Дисплей'),(12,4,'ru','Процессор'),(13,5,'ru','Память'),(14,6,'ru','Камера'),(15,7,'en','Frontal Camera'),(16,7,'ru','Фронтальная камера'),(17,8,'en','Included Accessories'),(18,8,'ru','Входящие аксессуары'),(19,9,'en','Interface'),(20,9,'ru','Интерфейсы'),(21,10,'en','Sensors'),(22,10,'ru','Датчики'),(23,11,'en','Water Resistant'),(26,11,'ru','Водонепроницаемость'),(27,12,'en','Battery'),(28,12,'ru','Аккумулятор'),(29,13,'en','Operating System'),(30,13,'ru','Операционная система'),(31,14,'en','Video Adapter'),(32,14,'ru','Видеоадаптер / Графика'),(33,15,'en','Sound'),(34,15,'ru','Звук'),(35,16,'en','Connectivity'),(36,16,'ru','Подключение и связь'),(37,17,'en','GPS'),(38,17,'ru','Навигация'),(39,18,'en','Dimensions'),(40,18,'ru','Габариты'),(41,19,'en','Weight'),(42,19,'ru','Вес'),(43,20,'en','Color'),(44,20,'ru','Цвет'),(45,21,'en','Warranty'),(46,21,'ru','Гарантия');
/*!40000 ALTER TABLE `attribute_group_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_groups`
--

DROP TABLE IF EXISTS `attribute_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `position` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_groups`
--

LOCK TABLES `attribute_groups` WRITE;
/*!40000 ALTER TABLE `attribute_groups` DISABLE KEYS */;
INSERT INTO `attribute_groups` VALUES (1,1,'2026-07-21 18:51:27','2026-07-21 18:51:27'),(2,2,'2026-07-21 19:46:45','2026-07-21 19:46:45'),(3,3,'2026-07-21 19:46:51','2026-07-21 19:46:51'),(4,4,'2026-07-21 19:46:56','2026-07-21 19:46:56'),(5,5,'2026-07-21 19:47:00','2026-07-21 19:47:00'),(6,6,'2026-07-21 19:47:07','2026-07-21 19:47:07'),(7,7,'2026-07-28 12:37:29','2026-07-28 12:39:20'),(8,8,'2026-07-28 12:37:29','2026-07-28 12:43:27'),(9,9,'2026-07-28 12:37:29','2026-07-28 12:43:27'),(10,10,'2026-07-28 12:37:29','2026-07-28 12:43:27'),(11,11,'2026-07-28 12:37:29','2026-07-28 12:43:27'),(12,12,'2026-07-28 12:37:29','2026-07-28 12:43:27'),(13,13,'2026-07-28 12:37:29','2026-07-28 12:43:27'),(14,14,'2026-07-28 12:37:29','2026-07-28 12:43:27'),(15,15,'2026-07-28 12:37:29','2026-07-28 12:43:27'),(16,16,'2026-07-28 12:37:29','2026-07-28 12:43:27'),(17,17,'2026-07-28 12:37:29','2026-07-28 12:43:27'),(18,18,'2026-07-28 12:37:29','2026-07-28 12:43:27'),(19,19,'2026-07-28 12:37:29','2026-07-28 12:43:27'),(20,20,'2026-07-28 12:37:29','2026-07-28 12:43:27'),(21,21,'2026-07-28 12:37:29','2026-07-28 12:43:27'),(22,22,'2026-07-28 12:44:14','2026-07-28 12:44:14'),(23,23,'2026-07-28 12:44:14','2026-07-28 12:44:14'),(24,24,'2026-07-28 12:44:14','2026-07-28 12:44:14'),(25,25,'2026-07-28 12:44:14','2026-07-28 12:44:14'),(26,26,'2026-07-28 12:44:14','2026-07-28 12:44:14'),(27,27,'2026-07-28 12:44:14','2026-07-28 12:44:14'),(28,28,'2026-07-28 12:44:14','2026-07-28 12:44:14'),(29,29,'2026-07-28 12:44:14','2026-07-28 12:44:14'),(30,30,'2026-07-28 12:44:14','2026-07-28 12:44:14'),(31,31,'2026-07-28 12:44:14','2026-07-28 12:44:14');
/*!40000 ALTER TABLE `attribute_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_screen_groups`
--

DROP TABLE IF EXISTS `attribute_screen_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_screen_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categories_id` int(11) DEFAULT 0,
  `attribute_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `attribute_screen_groups_categories_FK` (`categories_id`),
  KEY `attribute_screen_groups_attributes_FK` (`attribute_id`),
  CONSTRAINT `attribute_screen_groups_attributes_FK` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `attribute_screen_groups_categories_FK` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_screen_groups`
--

LOCK TABLES `attribute_screen_groups` WRITE;
/*!40000 ALTER TABLE `attribute_screen_groups` DISABLE KEYS */;
INSERT INTO `attribute_screen_groups` VALUES (1,17,1,NULL),(2,17,18,NULL),(3,17,19,NULL),(4,17,20,NULL),(5,17,21,NULL),(6,17,22,NULL),(8,17,24,NULL),(9,17,25,NULL),(10,17,26,NULL),(11,17,27,NULL),(12,17,28,NULL),(13,17,29,NULL),(14,18,30,7),(15,18,1,1),(16,18,18,3),(18,18,31,2),(19,18,32,4),(21,18,33,5),(22,18,34,6);
/*!40000 ALTER TABLE `attribute_screen_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_translations`
--

DROP TABLE IF EXISTS `attribute_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) NOT NULL,
  `locale` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attr_locale_unique` (`attribute_id`,`locale`),
  CONSTRAINT `attribute_translations_ibfk_1` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_translations`
--

LOCK TABLES `attribute_translations` WRITE;
/*!40000 ALTER TABLE `attribute_translations` DISABLE KEYS */;
INSERT INTO `attribute_translations` VALUES (2,1,'en','Brand'),(3,1,'ru','Бренд'),(5,2,'en','Model/PN'),(6,2,'ru','Модель / Артикул (P/N)'),(8,8,'en','Series'),(9,8,'ru','Серия'),(10,9,'en','Dual-SIM'),(11,9,'ru','Поддержка двух SIM-карт'),(12,10,'en','SIM Type'),(13,10,'ru','Тип SIM-карты'),(14,11,'en','Technology'),(15,11,'ru','Технология связи'),(16,15,'en','4G (LTE):'),(17,15,'ru','4G (LTE):'),(18,16,'en','5G'),(19,16,'ru','5G'),(20,17,'en','eSIM'),(21,17,'ru','eSIM'),(23,18,'en','Operating System Version'),(24,18,'ru','Операционная система'),(25,19,'en','Diagonal'),(26,19,'ru','Диагональ'),(27,20,'en','Dual-SIM'),(28,20,'ru','Две SIM-карты'),(29,21,'en','Internal Memory'),(30,21,'ru','Внутренняя память'),(31,22,'en','Memory Card Support'),(32,22,'ru','Поддержка карт памяти'),(33,23,'en','RAM'),(34,23,'ru','RAM'),(35,24,'en','Refresh Rate'),(36,24,'ru','Частота обновления'),(37,25,'en','3.5 mm Audio Jack'),(38,25,'ru','Аудиоразъем 3,5 мм'),(39,26,'en','eSIM'),(40,26,'ru','eSIM'),(41,27,'en','5G'),(42,27,'ru','5G'),(43,28,'en','Series'),(44,28,'ru','Series'),(45,29,'en','NFC'),(46,29,'ru','NFC'),(47,30,'en','Case Size'),(48,30,'ru','Case Size'),(52,31,'en','Type'),(53,31,'ru','Тип'),(54,32,'en','Color'),(55,32,'ru','Цвет'),(56,33,'en','Series'),(57,33,'ru','серия'),(58,34,'en','NFC'),(59,34,'ru','NFC');
/*!40000 ALTER TABLE `attribute_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_attributes_group` (`attribute_group_id`),
  CONSTRAINT `fk_attributes_group` FOREIGN KEY (`attribute_group_id`) REFERENCES `attribute_groups` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (18,NULL),(19,NULL),(20,NULL),(21,NULL),(22,NULL),(23,NULL),(24,NULL),(25,NULL),(26,NULL),(27,NULL),(28,NULL),(29,NULL),(30,NULL),(31,NULL),(32,NULL),(33,NULL),(34,NULL),(1,1),(2,1),(8,1),(9,1),(10,1),(11,1),(15,2),(16,2),(17,2);
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES (1,'City Mall Saburtalo',NULL,1),(2,'Saburtalo Branch',NULL,1),(3,'Tbilisi Central',NULL,1),(4,'Tbilisi Mall',NULL,1),(5,'East Point',NULL,1),(6,'City Mall Gldani',NULL,1),(7,'Samgori Mall',NULL,1),(8,'Hualing Plaza',NULL,1),(9,'Rustavi Branch',NULL,1),(10,'Telavi Branch',NULL,1),(11,'Gori Branch',NULL,1),(12,'Kutaisi Branch 4 Tsereteli Str','4 Tsereteli Str',1),(13,'Kutaisi Branch 2 Zhiuli Shartava Str','2 Zhiuli Shartava Str',1),(14,'Zugdidi Branch',NULL,1),(15,'Batumi Branch Chavchavadze Str.','Chavchavadze Str.',1);
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Samsung','samsung','','2026-07-21 14:32:37','2026-07-21 14:34:32'),(2,'Apple','apple','','2026-07-21 14:33:19','2026-07-21 14:34:31'),(3,'Lenovo','lenovo','','2026-07-21 14:33:36','2026-07-21 14:34:30'),(4,'Asus','asus','','2026-07-21 14:33:45','2026-07-21 14:34:30'),(5,'Sony','sony','','2026-07-21 14:33:55','2026-07-21 14:34:28'),(6,'LG','lg','','2026-07-21 14:34:05','2026-07-21 14:34:27'),(7,'TCL','tcl','','2026-07-21 14:34:18','2026-07-21 14:34:18'),(8,'Honor','honor','','2026-07-21 14:34:45','2026-07-21 14:34:48'),(9,'Electrolux ','electrolux ','','2026-07-21 14:35:05','2026-07-21 14:35:05'),(10,'Philips','philips','','2026-07-21 14:35:32','2026-07-21 14:35:32'),(11,'Sencor','sencor','','2026-07-21 14:35:52','2026-07-21 14:35:52'),(12,'Panasonic','panasonic','','2026-07-21 14:36:15','2026-07-21 14:36:15'),(13,'Toshiba','toshiba','','2026-07-21 14:36:33','2026-07-21 14:36:33'),(14,'AEG','aeg','','2026-07-21 14:36:47','2026-07-21 14:36:47'),(15,'House Of Marley','house-of-marley','','2026-07-21 14:37:17','2026-07-21 14:37:19'),(16,'TP Link','tp-link','','2026-07-21 14:37:41','2026-07-21 14:37:41'),(17,'Xiaomi ','xiaomi ','','2026-07-21 14:37:58','2026-07-21 14:37:58'),(18,'Acer','acer','','2026-07-21 14:38:33','2026-07-21 14:38:33'),(19,'HP','hp','','2026-07-21 14:38:43','2026-07-21 14:38:43'),(20,'Dell','dell','','2026-07-21 14:38:54','2026-07-21 14:38:54'),(21,'MSI','msi','','2026-07-21 14:39:05','2026-07-21 14:39:05'),(22,'Infinix','infinix','','2026-07-21 14:39:48','2026-07-21 14:39:48'),(23,'OnePlus','oneplus','','2026-07-21 14:40:02','2026-07-21 14:40:02'),(24,'Oukitel','oukitel','','2026-07-21 14:40:26','2026-07-21 14:40:26'),(25,'OPPO','oppo','','2026-07-21 14:40:43','2026-07-21 14:40:43'),(26,'Google','google','','2026-07-21 14:40:55','2026-07-21 14:40:55'),(27,'Nothing','nothing','','2026-07-21 14:41:24','2026-07-21 14:41:26'),(28,'Realme','realme','','2026-07-21 14:41:54','2026-07-21 14:41:54'),(29,'Canyon','canyon','','2026-07-21 14:42:35','2026-07-21 14:42:35'),(30,'Celly','celly','','2026-07-21 14:43:01','2026-07-21 14:43:01'),(31,'Beko','beko','','2026-07-21 14:43:39','2026-07-21 14:43:39'),(32,'ETA','eta','','2026-07-21 14:43:54','2026-07-21 14:43:54'),(33,'Remington','remington','','2026-07-21 14:44:23','2026-07-21 14:44:23'),(34,'Midea','midea','','2026-07-21 14:44:39','2026-07-21 14:44:39'),(35,'2E','2e','','2026-07-21 14:44:54','2026-07-21 14:44:54'),(36,'Westinghouse','westinghouse','','2026-07-21 14:45:08','2026-07-21 14:53:27'),(37,'Tucano','tucano','','2026-07-21 14:45:28','2026-07-21 14:45:28'),(38,'Dreame','dreame','','2026-07-21 14:45:43','2026-07-21 14:45:43'),(39,'Arshia','arshia','','2026-07-21 14:45:57','2026-07-21 14:45:57'),(40,'Wiwu','wiwu','','2026-07-21 14:46:10','2026-07-21 14:46:10'),(41,'Arzum','arzum','','2026-07-21 14:46:40','2026-07-21 14:46:40'),(42,'DeLonghi','deLonghi','','2026-07-21 14:46:52','2026-07-21 14:46:52'),(43,'Laifen','laifen','','2026-07-21 14:47:07','2026-07-21 14:47:07'),(44,'Ardesto','ardesto','','2026-07-21 14:47:18','2026-07-21 14:47:18'),(45,'Oz','oz','','2026-07-21 14:47:33','2026-07-21 14:47:33'),(46,'BRAUN','braun','','2026-07-21 14:47:48','2026-07-21 14:47:48'),(47,'Wanbo','wanbo','','2026-07-21 14:47:59','2026-07-21 14:47:59'),(48,'QCY','qcy','','2026-07-21 14:48:12','2026-07-21 14:48:12'),(49,'Ecovacs','ecovacs','','2026-07-21 14:48:27','2026-07-21 14:48:27'),(50,'AUKEY','aukey','','2026-07-21 14:48:44','2026-07-21 14:48:44'),(51,'Karcher','karcher','','2026-07-21 14:48:59','2026-07-21 14:48:59'),(52,'OTL','otl','','2026-07-21 14:49:22','2026-07-21 14:49:22'),(53,'Amazfit','amazfit','','2026-07-21 14:50:33','2026-07-21 14:50:33'),(54,'GoPro','gopro','','2026-07-21 14:51:04','2026-07-21 14:51:04'),(55,'Russell Hobbs','russell-hobbs','','2026-07-21 14:51:21','2026-07-21 14:53:19'),(56,'Razer','razer','','2026-07-21 14:51:41','2026-07-21 14:51:41'),(57,'Logitech','logitech','','2026-07-21 14:51:58','2026-07-21 14:51:58'),(58,'DJI','djl','','2026-07-21 14:52:16','2026-07-21 14:52:16'),(59,'Insta360','insta360','','2026-07-21 14:52:31','2026-07-21 14:52:31'),(60,'Western Digital','western-digital',NULL,'2026-07-21 14:53:19','2026-07-21 14:53:19'),(61,'Sigma Mobile','sigma-mobile',NULL,'2026-07-21 15:53:42','2026-07-21 15:53:42'),(62,'Hoco','hoco',NULL,'2026-08-05 10:19:08','2026-08-05 10:19:08'),(63,'TVC','tvc',NULL,'2026-08-05 10:19:08','2026-08-05 10:19:08'),(64,'JBL','jbl',NULL,'2026-08-05 10:26:35','2026-08-05 10:52:10');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`image`)),
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'mobile-phones-and-accessories',NULL,'[\"subcategories/mobile-phones-accessories_1.webp\", \"subcategories/mobile-phones-accessories_2.webp\",\"subcategories/mobile-phones-accessories_3.webp\",\"subcategories/mobile-phones-accessories_4.webp\"]'),(2,'computers-and-accessories',NULL,'[\"subcategories/Computers & Accessories_1.webp\",\n  \"subcategories/Computers & Accessories_2.webp\",\n  \"subcategories/Computers & Accessories_3.webp\",\n  \"subcategories/Computers & Accessories_4.webp\",\n  \"subcategories/Computers & Accessories_5.webp\",\n  \"subcategories/Computers & Accessories_6.webp\",\n  \"subcategories/Computers & Accessories_7.webp\",\n  \"subcategories/Computers & Accessories_8.webp\",\n  \"subcategories/Computers & Accessories_9.webp\",\n  \"subcategories/Computers & Accessories_10.webp\",\n  \"subcategories/Computers & Accessories_11.webp\",\n  \"subcategories/Computers & Accessories_12.webp\",\n  \"subcategories/Computers & Accessories_13.webp\"]'),(3,'tv-and-audio',NULL,'[\"subcategories/TV & Audio_1.webp\",\r\n  \"subcategories/TV & Audio_2.webp\",\r\n  \"subcategories/TV & Audio_3.webp\",\r\n  \"subcategories/TV & Audio_4.webp\",\r\n  \"subcategories/TV & Audio_5.webp\"]'),(4,'gaming',NULL,'[\"subcategories/Gaming_1.webp\",\"subcategories/Gaming_2.webp\",\"subcategories/Gaming_3.webp\",\"subcategories/Gaming_4.webp\",\"subcategories/Gaming_5.webp\"]'),(5,'photo-and-video',NULL,'[\"subcategories/Audio&Video1.webp\",\"subcategories/Audio&Video2.webp\",\"subcategories/Audio&Video3.webp\",\"subcategories/Audio&Video4.webp\",\"subcategories/Audio&Video5.webp\",\"subcategories/Audio&Video6.webp\",\"subcategories/Audio&Video7.webp\",\"subcategories/Audio&Video8.webp\"]'),(6,'headphones',NULL,'[\"subcategories/Headphones1.webp\",\"subcategories/Headphones2.webp\",\"subcategories/Headphones3.webp\",\"subcategories/Headphones4.webp\",\"subcategories/Headphones5.webp\",\"subcategories/Headphones6.webp\"]'),(7,'home-appliances',NULL,'[\"subcategories/Home Appliances01.webp\",\"subcategories/Home Appliances02.webp\",\"subcategories/Home Appliances03.webp\",\"subcategories/Home Appliances04.webp\",\"subcategories/Home Appliances05.webp\",\"subcategories/Home Appliances06.webp\",\"subcategories/Home Appliances07.webp\",\"subcategories/Home Appliances08.webp\",\"subcategories/Home Appliances09.webp\",\"subcategories/Home Appliances10.webp\",\"subcategories/Home Appliances11.webp\"]'),(8,'small-domestic-appliances',NULL,'[\"subcategories/Small Domestic Appliances1.webp\",\"subcategories/Small Domestic Appliances2.webp\"]'),(9,'house-and-garden',NULL,'[\"subcategories/House and Garden1.webp\",\"subcategories/House and Garden2.webp\",\"subcategories/House and Garden3.webp\",\"subcategories/House and Garden4.webp\",\"subcategories/House and Garden5.webp\",\"subcategories/House and Garden6.webp\",\"subcategories/House and Garden7.webp\",\"subcategories/House and Garden8.webp\",\"subcategories/House and Garden9.webp\"]'),(10,'personal-care',NULL,'[\"subcategories/Personal Care_1.webp\",\"subcategories/Personal Care_2.webp\",\"subcategories/Personal Care_3.webp\",\"subcategories/Personal Care_4.webp\",\"subcategories/Personal Care_5.webp\",\"subcategories/Personal Care_6.webp\",\"subcategories/Personal Care_7.webp\",\"subcategories/Personal Care_8.webp\",\"subcategories/Personal Care_9.webp\",\"subcategories/Personal Care_10.webp\"]'),(11,'smart-home',NULL,'[\"subcategories/Smart Home_1.webp\",\"subcategories/Smart Home_2.webp\",\"subcategories/Smart Home_3.webp\",\"subcategories/Smart Home_4.webp\",\"subcategories/Smart Home_5.webp\",\"subcategories/Smart Home_6.webp\",\"subcategories/Smart Home_7.webp\",\"subcategories/Smart Home_8.webp\"]'),(12,'parent-and-child',NULL,'[\"subcategories/Parent And Child_1.webp\",\"subcategories/Parent And Child_2.webp\",\"subcategories/Parent And Child_3.webp\",\"subcategories/Parent And Child_4.webp\",\"subcategories/Parent And Child_5.webp\",\"subcategories/Parent And Child_6.webp\",\"subcategories/Parent And Child_7.webp\",\"subcategories/Parent And Child_8.webp\",\"subcategories/Parent And Child_9.webp\"]'),(13,'electric-vehicles-and-car-tools',NULL,'[\"subcategories/Electric Vechiles & Car Tools_1.webp\",\"subcategories/Electric Vechiles & Car Tools_2.webp\",\"subcategories/Electric Vechiles & Car Tools_3.webp\"]'),(14,'electric-transport',NULL,'[\"subcategories/Electric Tranport.webp\"]'),(15,'outlet',NULL,'[\"subcategories/Outlet1.webp\",\"subcategories/Outlet2.webp\",\"subcategories/Outlet3.webp\"]'),(16,'services',NULL,NULL),(17,'mobile-phones',1,NULL),(18,'smart-watches',1,NULL),(19,'smart-watch-accessories',1,NULL),(20,'mobile-phone-accessories',1,NULL),(21,'laptop',2,NULL),(22,'laptop-accessories',2,NULL),(23,'tablet-computer',2,NULL),(24,'tab-accessories',2,NULL),(25,'all-in-one-computer',2,NULL),(26,'desktop-computer',2,NULL),(27,'monitor',2,NULL),(28,'monitor-accessories',2,NULL),(29,'pc-components',2,NULL),(30,'print-and-copy',2,NULL),(31,'networking-products',2,NULL),(32,'computer-accessories',2,NULL),(33,'ups-systems',2,NULL),(34,'tv',3,NULL),(35,'tv-accessories',3,NULL),(36,'projector',3,NULL),(37,'projector-accessories',3,NULL),(38,'audio-systems',3,NULL),(39,'gaming-laptop',4,NULL),(40,'gaming-consoles',4,NULL),(41,'pc-gaming',4,NULL),(42,'pc-gaming-accessories',4,NULL),(43,'gaming-monitor',4,NULL),(44,'digital-camera',5,NULL),(45,'digital-camera-accessories',5,NULL),(46,'video-camera',5,NULL),(47,'action-camera',5,NULL),(48,'drone',5,NULL),(49,'telescope',5,NULL),(50,'binocular',5,NULL),(51,'microscope',5,NULL),(52,'wireless-headphones',6,NULL),(53,'kid-headphones',6,NULL),(54,'computer-headset',6,NULL),(55,'headphone-accessories',6,NULL),(56,'buds',6,NULL),(57,'wired-headphones',6,NULL),(58,'refrigerator',7,NULL),(59,'washing-machine',7,NULL),(60,'dryer-machine',7,NULL),(61,'dishwasher',7,NULL),(62,'gas-cooker',7,NULL),(63,'hob',7,NULL),(64,'built-in-appliances',7,NULL),(65,'climate-control-appliances',7,NULL),(66,'water-dispenser',7,NULL),(67,'air-dresser',7,NULL),(68,'home-appliances-accessories',7,NULL),(69,'kitchen-appliances',8,NULL),(70,'coffee-lovers',8,NULL),(71,'mop-and-floor-cleaner',9,NULL),(72,'vacuum-cleaner',9,NULL),(73,'vacuum-cleaner-accessories',9,NULL),(74,'robotic-vacuum-cleaner',9,NULL),(75,'high-pressure-washer',9,NULL),(76,'iron',9,NULL),(77,'steam-cleaner',9,NULL),(78,'garden-inventory',9,NULL),(79,'glass-cleaner',9,NULL),(80,'hair-straightener',10,NULL),(81,'hair-dryer',10,NULL),(82,'hair-curling-iron',10,NULL),(83,'epilator',10,NULL),(84,'electric-toothbrushes-and-oral-irrigator',10,NULL),(85,'treadmill',10,NULL),(86,'trimmer',10,NULL),(87,'scale',10,NULL),(88,'massager',10,NULL),(89,'skin-care',10,NULL),(90,'electric-shaver',10,NULL),(91,'smart-home-accessories',11,NULL),(92,'smart-lightning',11,NULL),(93,'smart-sensors',11,NULL),(94,'smart-plugs',11,NULL),(95,'smart-locks',11,NULL),(96,'smart-camera',11,NULL),(97,'control-smart-home',11,NULL),(98,'pet-care',11,NULL),(99,'kid-tab',12,NULL),(100,'kid-microphone',12,NULL),(101,'kids-electric-toothbrush',12,NULL),(102,'radio-nanny',12,NULL),(103,'kid-smart-watch',12,NULL),(104,'nanny-camera',12,NULL),(105,'breast-pump',12,NULL),(106,'baby-scale',12,NULL),(107,'baby-food-maker',12,NULL),(108,'car-battery-tools',13,NULL),(109,'car-wheel-tools',13,NULL),(110,'video-recorder',13,NULL),(111,'electric-scooter',14,NULL),(112,'refrigerator-outlet',15,NULL),(113,'air-conditioner-outlet',15,NULL),(114,'tv-outlet',15,NULL),(115,'induction-builtin-stove-outlet',15,NULL),(116,'builtin-cooker-hood-outlet',15,NULL),(117,'gas-cookers-outlet',15,NULL),(118,'builtin-electric-oven-outlet',15,NULL),(119,'dryer-machines-outlet',15,NULL),(120,'dishwashers-outlet',15,NULL),(121,'washing-machine-outlet',15,NULL),(122,'mobile-phone-services',16,NULL),(123,'tab-services',16,NULL),(124,'laptop-services',16,NULL),(125,'protective-case',20,NULL),(126,'screen-protector',20,NULL),(127,'smart-glasses',20,NULL),(128,'adapter',20,NULL),(129,'portable-speaker',20,NULL),(130,'power-bank',20,NULL),(131,'wireless-charger',20,NULL),(132,'wall-adapter',20,NULL),(133,'usb-cable',20,NULL),(134,'micro-sd-card',20,NULL),(135,'car-holder',20,NULL),(136,'car-charger',20,NULL),(137,'mobile-gaming-controller',20,NULL),(138,'video-stabilizer-gimbal',20,NULL),(139,'selfie-stick',20,NULL),(140,'laptop-bag',22,NULL),(141,'laptop-charger',22,NULL),(142,'laptop-cooler',22,NULL),(143,'laptop-stand',22,NULL),(144,'laptop-stylus',22,NULL),(145,'tab-protective-case',24,NULL),(146,'tab-screen-protector',24,NULL),(147,'tab-stylus',24,NULL),(148,'tab-keyboard',24,NULL),(149,'motherboard',29,NULL),(150,'cpu',29,NULL),(151,'video-card',29,NULL),(152,'ram',29,NULL),(153,'pc-case',29,NULL),(154,'power-supply',29,NULL),(155,'cooler',29,NULL),(156,'thermal-paste',29,NULL),(157,'storage-hdd-ssd',29,NULL),(158,'printer',30,NULL),(159,'scanner',30,NULL),(160,'cartridges-and-toners',30,NULL),(161,'router',31,NULL),(162,'network-switch',31,NULL),(163,'network-cables',31,NULL),(164,'mouse',32,NULL),(165,'mousepad',32,NULL),(166,'keyboard',32,NULL),(167,'pc-speaker',32,NULL),(168,'pc-webcam',32,NULL),(169,'pc-streaming-accessories',32,NULL),(170,'external-hdd-ssd',32,NULL),(171,'usb-flash-drive',32,NULL),(172,'cables-and-adapters',32,NULL),(173,'usb-hubs',32,NULL),(174,'batteries-and-battery-chargers',32,NULL),(175,'screen-cleaners',32,NULL),(176,'surge-protection-and-adapter',33,NULL),(177,'ups-systems-sub',33,NULL),(178,'ups-accessories',33,NULL),(179,'portable-powerstation',33,NULL),(180,'wall-mount',35,NULL),(181,'smart-tv-box',35,NULL),(182,'tv-cables-and-adapters',35,NULL),(183,'party-speaker',38,NULL),(184,'turntable',38,NULL),(185,'soundbar',38,NULL),(186,'playstation',40,NULL),(187,'playstation-accessories',40,NULL),(188,'playstation-games',40,NULL),(189,'xbox',40,NULL),(190,'xbox-accessories',40,NULL),(191,'xbox-games',40,NULL),(192,'nintendo-switch',40,NULL),(193,'handheld-gaming-consoles',40,NULL),(194,'meta-vr-headset',40,NULL),(195,'gaming-desktop-pc',41,NULL),(196,'pc-gaming-component',41,NULL),(197,'gaming-chair',42,NULL),(198,'gaming-desk',42,NULL),(199,'gaming-wheel',42,NULL),(200,'gaming-mouse',42,NULL),(201,'gaming-mouse-pad',42,NULL),(202,'gaming-keyboard',42,NULL),(203,'gaming-microphone',42,NULL),(204,'gaming-controller',42,NULL),(205,'gaming-backpack',42,NULL),(206,'camera-lens',45,NULL),(207,'camera-bag',45,NULL),(208,'camera-memory-card',45,NULL),(209,'camera-battery',45,NULL),(210,'drone-accessories',48,NULL),(211,'built-in-electric-oven',64,NULL),(212,'built-in-hob',64,NULL),(213,'built-in-cooker-hood',64,NULL),(214,'built-in-microwave',64,NULL),(215,'built-in-coffee-machine',64,NULL),(216,'air-conditioner',65,NULL),(217,'gas-heater',65,NULL),(218,'electric-heater',65,NULL),(219,'air-purifier-and-humidifier',65,NULL),(220,'air-cooler',65,NULL),(221,'fan',65,NULL),(222,'portable-air-conditioning',65,NULL),(223,'microwave-oven',69,NULL),(224,'air-fryer',69,NULL),(225,'electric-oven',69,NULL),(226,'kitchen-machine',69,NULL),(227,'blender-and-chopper',69,NULL),(228,'bread-maker',69,NULL),(229,'mixer',69,NULL),(230,'multi-cooker',69,NULL),(231,'meat-grinder',69,NULL),(232,'sandwich-maker',69,NULL),(233,'waffle-maker',69,NULL),(234,'slush-maker',69,NULL),(235,'toaster',69,NULL),(236,'pizza-maker',69,NULL),(237,'grill',69,NULL),(238,'juicer',69,NULL),(239,'electric-kettle',69,NULL),(240,'fruit-dehydrator',69,NULL),(241,'ice-machine',69,NULL),(242,'deep-fryer',69,NULL),(243,'wine-bottle-opener',69,NULL),(244,'kitchen-scale',69,NULL),(245,'kitchen-appliance-accessories',69,NULL),(246,'slicer',69,NULL),(247,'coffee-machine',70,NULL),(248,'coffee-boiler',70,NULL),(249,'coffee-grinder',70,NULL),(250,'coffee-machine-accessories',70,NULL),(251,'coffee',70,NULL),(252,'milk-frother',70,NULL),(253,'iron-accessories',76,NULL),(254,'trimmer-head',86,NULL),(255,'pet-food-feeder',98,NULL),(256,'pet-water-dispenser',98,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_attributes`
--

DROP TABLE IF EXISTS `category_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `attribute_groups_id` bigint(20) unsigned NOT NULL,
  `display_order` int(11) DEFAULT 0,
  `is_filterable` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_category_attribute` (`category_id`,`attribute_groups_id`),
  KEY `fk_ca_attribute_group` (`attribute_groups_id`),
  CONSTRAINT `fk_ca_attribute_group` FOREIGN KEY (`attribute_groups_id`) REFERENCES `attribute_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ca_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_attributes`
--

LOCK TABLES `category_attributes` WRITE;
/*!40000 ALTER TABLE `category_attributes` DISABLE KEYS */;
INSERT INTO `category_attributes` VALUES (1,17,1,1,1),(2,17,2,2,1),(3,17,3,3,1),(4,17,4,4,1),(5,17,5,5,1),(6,17,6,6,1);
/*!40000 ALTER TABLE `category_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_translations`
--

DROP TABLE IF EXISTS `category_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `lang` varchar(5) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lang` (`lang`),
  KEY `fk_category_translation` (`category_id`),
  CONSTRAINT `fk_category_translation` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_translations`
--

LOCK TABLES `category_translations` WRITE;
/*!40000 ALTER TABLE `category_translations` DISABLE KEYS */;
INSERT INTO `category_translations` VALUES (3,1,'en','Mobile Phones & Accessories'),(4,1,'ru','Мобильные телефоны и аксессуары'),(5,2,'en','Computers & Accessories'),(6,2,'ru','Компьютеры и аксессуары'),(7,3,'en','TV & Audio'),(8,3,'ru','ТВ и аудио'),(9,4,'en','Gaming'),(10,4,'ru','Гейминг'),(11,5,'en','Photo & Video'),(12,5,'ru','Фото и видео'),(13,6,'en','Headphones'),(14,6,'ru','Наушники'),(15,7,'en','Home Appliances'),(16,7,'ru','Бытовая техника'),(17,8,'en','Small Domestic Appliances'),(18,8,'ru','Мелкая бытовая техника'),(19,9,'en','House and Garden'),(20,9,'ru','Дом и сад'),(21,10,'en','Personal Care'),(22,10,'ru','Личная гигиена'),(23,11,'en','Smart Home'),(24,11,'ru','Умный дом'),(25,12,'en','Parent and Child'),(26,12,'ru','Родители и дети'),(27,13,'en','Electric Vehicles & Car Tools'),(28,13,'ru','Электромобили и автоинструменты'),(29,14,'en','Electric Transport'),(30,14,'ru','Электротранспорт'),(31,15,'en','Outlet'),(32,15,'ru','Аутлет'),(33,16,'en','Services'),(34,16,'ru','Услуги'),(35,17,'en','Mobile Phones'),(36,17,'ru','Мобильные телефоны'),(37,18,'en','Smart Watches'),(38,18,'ru','Умные часы'),(39,19,'en','Smart Watch Accessories'),(40,19,'ru','Аксессуары для умных часов'),(41,20,'en','Mobile Phone Accessories'),(42,20,'ru','Аксессуары для мобильных телефонов'),(43,21,'en','Laptop'),(44,21,'ru','Ноутбуки'),(45,22,'en','Laptop Accessories'),(46,22,'ru','Аксессуары для ноутбуков'),(47,23,'en','Tablet Computer'),(48,23,'ru','Планшеты'),(49,24,'en','Tab Accessories'),(50,24,'ru','Аксессуары для планшетов'),(51,25,'en','All-in-One Computer'),(52,25,'ru','Моноблоки'),(53,26,'en','Desktop Computer'),(54,26,'ru','Настольные компьютеры'),(55,27,'en','Monitor'),(56,27,'ru','Мониторы'),(57,28,'en','Monitor Accessories'),(58,28,'ru','Аксессуары для мониторов'),(59,29,'en','PC Components'),(60,29,'ru','Комплектующие для ПК'),(61,30,'en','Print & Copy'),(62,30,'ru','Печать и копирование'),(63,31,'en','Networking Products'),(64,31,'ru','Сетевое оборудование'),(65,32,'en','Computer Accessories'),(66,32,'ru','Компьютерные аксессуары'),(67,33,'en','UPS Systems'),(68,33,'ru','Источники бесперебойного питания (ИБП)'),(69,34,'en','TV'),(70,34,'ru','Телевизоры'),(71,35,'en','TV Accessories'),(72,35,'ru','Аксессуары для ТВ'),(73,36,'en','Projector'),(74,36,'ru','Проекторы'),(75,37,'en','Projector Accessories'),(76,37,'ru','Аксессуары для проекторов'),(77,38,'en','Audio Systems'),(78,38,'ru','Аудиосистемы'),(79,39,'en','Gaming Laptop'),(80,39,'ru','Игровые ноутбуки'),(81,40,'en','Gaming Consoles'),(82,40,'ru','Игровые консоли'),(83,41,'en','PC Gaming'),(84,41,'ru','Игровые ПК'),(85,42,'en','PC Gaming Accessories'),(86,42,'ru','Аксессуары для игровых ПК'),(87,43,'en','Gaming Monitor'),(88,43,'ru','Игровые мониторы'),(89,44,'en','Digital Camera'),(90,44,'ru','Цифровые фотоаппараты'),(91,45,'en','Digital Camera Accessories'),(92,45,'ru','Аксессуары для цифровых фотоаппаратов'),(93,46,'en','Video Camera'),(94,46,'ru','Видеокамеры'),(95,47,'en','Action Camera'),(96,47,'ru','Экшн-камеры'),(97,48,'en','Drone'),(98,48,'ru','Квадрокоптеры'),(99,49,'en','Telescope'),(100,49,'ru','Телескопы'),(101,50,'en','Binocular'),(102,50,'ru','Бинокли'),(103,51,'en','Microscope'),(104,51,'ru','Микроскопы'),(105,52,'en','Wireless Headphones'),(106,52,'ru','Беспроводные наушники'),(107,53,'en','Kid Headphones'),(108,53,'ru','Детские наушники'),(109,54,'en','Computer Headset'),(110,54,'ru','Компьютерные гарнитуры'),(111,55,'en','Headphone Accessories'),(112,55,'ru','Аксессуары для наушников'),(113,56,'en','Buds'),(114,56,'ru','Наушники-вкладыши'),(115,57,'en','Wired Headphones'),(116,57,'ru','Проводные наушники'),(117,58,'en','Refrigerator'),(118,58,'ru','Холодильники'),(119,59,'en','Washing Machine'),(120,59,'ru','Стиральные машины'),(121,60,'en','Dryer Machine'),(122,60,'ru','Сушильные машины'),(123,61,'en','Dishwasher'),(124,61,'ru','Посудомоечные машины'),(125,62,'en','Gas Cooker'),(126,62,'ru','Газовые плиты'),(127,63,'en','Hob'),(128,63,'ru','Вытяжки'),(129,64,'en','Built-in Appliances'),(130,64,'ru','Встраиваемая техника'),(131,65,'en','Climate Control Appliances'),(132,65,'ru','Климатическая техника'),(133,66,'en','Water Dispenser'),(134,66,'ru','Кулеры для воды'),(135,67,'en','Air Dresser'),(136,67,'ru','Паровые шкафы для одежды'),(137,68,'en','Home Appliance Accessories'),(138,68,'ru','Аксессуары для бытовой техники'),(139,69,'en','Kitchen Appliances'),(140,69,'ru','Кухонная техника'),(141,70,'en','Coffee Lovers'),(142,70,'ru','Любители кофе'),(143,71,'en','Mop & Floor Cleaner'),(144,71,'ru','Швабры и очистители пола'),(145,72,'en','Vacuum Cleaner'),(146,72,'ru','Пылесосы'),(147,73,'en','Vacuum Cleaner Accessories'),(148,73,'ru','Аксессуары для пылесосов'),(149,74,'en','Robotic Vacuum Cleaner'),(150,74,'ru','Роботы-пылесосы'),(151,75,'en','High-Pressure Washer'),(152,75,'ru','Мойки высокого давления'),(153,76,'en','Iron'),(154,76,'ru','Утюги'),(155,77,'en','Steam Cleaner'),(156,77,'ru','Пароочистители'),(157,78,'en','Garden Inventory'),(158,78,'ru','Садовый инвентарь'),(159,79,'en','Glass Cleaner'),(160,79,'ru','Оконные пылесосы'),(161,80,'en','Hair Straightener'),(162,80,'ru','Выпрямители для волос'),(163,81,'en','Hair Dryer'),(164,81,'ru','Фены для волос'),(165,82,'en','Hair Curling Iron'),(166,82,'ru','Плойки для волос'),(167,83,'en','Epilator'),(168,83,'ru','Эпиляторы'),(169,84,'en','Electric Toothbrushes & Oral Irrigator'),(170,84,'ru','Электрические зубные щетки и ирригаторы'),(171,85,'en','Treadmill'),(172,85,'ru','Беговые дорожки'),(173,86,'en','Trimmer'),(174,86,'ru','Триммеры'),(175,87,'en','Scale'),(176,87,'ru','Весы напольные'),(177,88,'en','Massager'),(178,88,'ru','Массажеры'),(179,89,'en','Skin Care'),(180,89,'ru','Уход за кожей'),(181,90,'en','Electric Shaver'),(182,90,'ru','Электробритвы'),(183,91,'en','Smart Home Accessories'),(184,91,'ru','Аксессуары для умного дома'),(185,92,'en','Smart Lightning'),(186,92,'ru','Умное освещение'),(187,93,'en','Smart Sensors'),(188,93,'ru','Умные датчики'),(189,94,'en','Smart Plugs'),(190,94,'ru','Умные розетки'),(191,95,'en','Smart Locks'),(192,95,'ru','Умные замки'),(193,96,'en','Smart Camera'),(194,96,'ru','Умные камеры'),(195,97,'en','Control / Smart Home'),(196,97,'ru','Управление умным домом'),(197,98,'en','Pet Care'),(198,98,'ru','Умные гаджеты для питомцев'),(199,99,'en','Kid Tab'),(200,99,'ru','Детские планшеты'),(201,100,'en','Kid Microphone'),(202,100,'ru','Детские микрофоны'),(203,101,'en','Kids Electric Toothbrush'),(204,101,'ru','Детские электрические зубные щетки'),(205,102,'en','Radio Nanny'),(206,102,'ru','Радионяни'),(207,103,'en','Kid Smart Watch'),(208,103,'ru','Детские умные часы'),(209,104,'en','Nanny Camera'),(210,104,'ru','Видеоняни'),(211,105,'en','Breast Pump'),(212,105,'ru','Молокоотсосы'),(213,106,'en','Baby Scale'),(214,106,'ru','Детские весы'),(215,107,'en','Baby Food Maker'),(216,107,'ru','Блендеры-пароварки для детского питания'),(217,108,'en','Car Battery Tools'),(218,108,'ru','Инструменты для автомобильных аккумуляторов'),(219,109,'en','Car Wheel Tools'),(220,109,'ru','Инструменты для автомобильных колес'),(221,110,'en','Video Recorder'),(222,110,'ru','Видеорегистраторы'),(223,111,'en','Electric Scooter'),(224,111,'ru','Электросамокаты'),(225,112,'en','Refrigerator (Outlet)'),(226,112,'ru','Холодильники (Аутлет)'),(227,113,'en','Air Conditioner (Outlet)'),(228,113,'ru','Кондиционеры (Аутлет)'),(229,114,'en','TV (Outlet)'),(230,114,'ru','Телевизоры (Аутлет)'),(231,115,'en','Induction / Built-in Stove (Outlet)'),(232,115,'ru','Индукционные / Встраиваемые плиты (Аутлет)'),(233,116,'en','Built-in Cooker Hood (Outlet)'),(234,116,'ru','Встраиваемые вытяжки (Аутлет)'),(235,117,'en','Gas Cookers (Outlet)'),(236,117,'ru','Газовые плиты (Аутлет)'),(237,118,'en','Built-in Electric Oven (Outlet)'),(238,118,'ru','Встраиваемые электрические духовки (Аутлет)'),(239,119,'en','Dryer Machines (Outlet)'),(240,119,'ru','Сушильные машины (Аутлет)'),(241,120,'en','Dishwashers (Outlet)'),(242,120,'ru','Посудомоечные машины (Аутлет)'),(243,121,'en','Washing Machine (Outlet)'),(244,121,'ru','Стиральные машины (Аутлет)'),(245,122,'en','Mobile Phone Services'),(246,122,'ru','Ремонт мобильных телефонов'),(247,123,'en','Tab Services'),(248,123,'ru','Ремонт планшетов'),(249,124,'en','Laptop Services'),(250,124,'ru','Ремонт ноутбуков');
/*!40000 ALTER TABLE `category_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `discount_percent` int(11) DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price_at_purchase` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `guest_email` varchar(255) DEFAULT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` enum('pending','processing','shipped','delivered','cancelled') DEFAULT 'pending',
  `shipping_address` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('pending','completed','failed','refunded') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_attribute_values`
--

DROP TABLE IF EXISTS `product_attribute_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_attribute_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `attribute_id` (`attribute_id`),
  CONSTRAINT `product_attribute_values_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_attribute_values_ibfk_2` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1020 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attribute_values`
--

LOCK TABLES `product_attribute_values` WRITE;
/*!40000 ALTER TABLE `product_attribute_values` DISABLE KEYS */;
INSERT INTO `product_attribute_values` VALUES (1,1,1),(2,1,2),(3,1,8),(4,1,9),(5,1,10),(6,1,11),(7,1,15),(8,1,16),(9,1,17),(12,1,18),(13,2,1),(17,35,1),(18,36,1),(19,37,1),(20,38,1),(21,43,1),(22,44,1),(23,51,1),(24,52,1),(25,53,1),(26,76,1),(27,77,1),(28,79,1),(29,81,1),(30,99,1),(31,100,1),(32,102,1),(33,103,1),(34,104,1),(35,105,1),(36,106,1),(37,121,1),(38,128,1),(39,132,1),(40,133,1),(41,144,1),(42,145,1),(43,146,1),(44,147,1),(45,149,1),(46,151,1),(47,153,1),(48,154,1),(49,164,1),(50,165,1),(51,168,1),(52,178,1),(53,180,1),(54,181,1),(55,182,1),(56,183,1),(57,184,1),(58,185,1),(59,186,1),(60,2,18),(61,35,18),(62,36,18),(63,37,18),(64,38,18),(65,43,18),(66,44,18),(67,51,18),(68,52,18),(69,53,18),(70,76,18),(71,77,18),(72,79,18),(73,81,18),(74,99,18),(75,100,18),(76,102,18),(77,103,18),(78,104,18),(79,105,18),(80,106,18),(82,128,18),(83,132,18),(84,133,18),(85,144,18),(86,145,18),(87,146,18),(88,147,18),(89,149,18),(90,151,18),(91,153,18),(92,154,18),(93,164,18),(94,165,18),(95,168,18),(96,178,18),(97,180,18),(98,181,18),(99,182,18),(100,183,18),(101,184,18),(102,185,18),(103,186,18),(104,1,19),(105,2,19),(106,35,19),(107,36,19),(108,37,19),(109,38,19),(110,43,19),(111,44,19),(112,51,19),(113,52,19),(114,53,19),(115,76,19),(116,77,19),(117,79,19),(118,81,19),(119,99,19),(120,100,19),(121,102,19),(122,103,19),(123,104,19),(124,105,19),(125,106,19),(126,121,19),(127,128,19),(128,132,19),(129,133,19),(130,144,19),(131,145,19),(132,146,19),(133,147,19),(134,149,19),(135,151,19),(136,153,19),(137,154,19),(138,164,19),(139,165,19),(140,168,19),(141,178,19),(142,180,19),(143,181,19),(144,182,19),(145,183,19),(146,184,19),(147,185,19),(148,186,19),(149,1,20),(150,2,20),(151,35,20),(152,36,20),(153,37,20),(154,38,20),(155,43,20),(156,44,20),(157,51,20),(158,52,20),(159,53,20),(160,76,20),(161,77,20),(162,79,20),(163,81,20),(164,99,20),(165,100,20),(166,102,20),(167,103,20),(168,104,20),(169,105,20),(170,106,20),(171,121,20),(172,128,20),(173,132,20),(174,133,20),(175,144,20),(176,145,20),(177,146,20),(178,147,20),(179,149,20),(180,151,20),(181,153,20),(182,154,20),(183,164,20),(184,165,20),(185,168,20),(186,178,20),(187,180,20),(188,181,20),(189,182,20),(190,183,20),(191,184,20),(192,185,20),(193,186,20),(194,1,21),(195,2,21),(196,35,21),(197,36,21),(198,37,21),(199,38,21),(200,43,21),(201,44,21),(202,51,21),(203,52,21),(204,53,21),(205,76,21),(206,77,21),(207,79,21),(208,81,21),(209,99,21),(210,100,21),(211,102,21),(212,103,21),(213,104,21),(214,105,21),(215,106,21),(216,121,21),(217,128,21),(218,132,21),(219,133,21),(220,144,21),(221,145,21),(222,146,21),(223,147,21),(224,149,21),(225,151,21),(226,153,21),(227,154,21),(228,164,21),(229,165,21),(230,168,21),(231,178,21),(232,180,21),(233,181,21),(234,182,21),(235,183,21),(236,184,21),(237,185,21),(238,186,21),(239,1,22),(240,2,22),(241,35,22),(242,36,22),(243,37,22),(244,38,22),(245,43,22),(246,44,22),(247,51,22),(248,52,22),(249,53,22),(250,76,22),(251,77,22),(252,79,22),(253,81,22),(254,99,22),(255,100,22),(256,102,22),(257,103,22),(258,104,22),(259,105,22),(260,106,22),(261,121,22),(262,128,22),(263,132,22),(264,133,22),(265,144,22),(266,145,22),(267,146,22),(268,147,22),(269,149,22),(270,151,22),(271,153,22),(272,154,22),(273,164,22),(274,165,22),(275,168,22),(276,178,22),(277,180,22),(278,181,22),(279,182,22),(280,183,22),(281,184,22),(282,185,22),(283,186,22),(284,1,24),(285,2,24),(286,35,24),(287,36,24),(288,37,24),(289,38,24),(290,43,24),(291,44,24),(292,51,24),(293,52,24),(294,53,24),(295,76,24),(296,77,24),(297,79,24),(298,81,24),(299,99,24),(300,100,24),(301,102,24),(302,103,24),(303,104,24),(304,105,24),(305,106,24),(306,121,24),(307,128,24),(308,132,24),(309,133,24),(310,144,24),(311,145,24),(312,146,24),(313,147,24),(314,149,24),(315,151,24),(316,153,24),(317,154,24),(318,164,24),(319,165,24),(320,168,24),(321,178,24),(322,180,24),(323,181,24),(324,182,24),(325,183,24),(326,184,24),(327,185,24),(328,186,24),(329,1,25),(330,2,25),(331,35,25),(332,36,25),(333,37,25),(334,38,25),(335,43,25),(336,44,25),(337,51,25),(338,52,25),(339,53,25),(340,76,25),(341,77,25),(342,79,25),(343,81,25),(344,99,25),(345,100,25),(346,102,25),(347,103,25),(348,104,25),(349,105,25),(350,106,25),(351,121,25),(352,128,25),(353,132,25),(354,133,25),(355,144,25),(356,145,25),(357,146,25),(358,147,25),(359,149,25),(360,151,25),(361,153,25),(362,154,25),(363,164,25),(364,165,25),(365,168,25),(366,178,25),(367,180,25),(368,181,25),(369,182,25),(370,183,25),(371,184,25),(372,185,25),(373,186,25),(374,1,26),(375,2,26),(376,35,26),(377,36,26),(378,37,26),(379,38,26),(380,43,26),(381,44,26),(382,51,26),(383,52,26),(384,53,26),(385,76,26),(386,77,26),(387,79,26),(388,81,26),(389,99,26),(390,100,26),(391,102,26),(392,103,26),(393,104,26),(394,105,26),(395,106,26),(396,121,26),(397,128,26),(398,132,26),(399,133,26),(400,144,26),(401,145,26),(402,146,26),(403,147,26),(404,149,26),(405,151,26),(406,153,26),(407,154,26),(408,164,26),(409,165,26),(410,168,26),(411,178,26),(412,180,26),(413,181,26),(414,182,26),(415,183,26),(416,184,26),(417,185,26),(418,186,26),(419,1,27),(420,2,27),(421,35,27),(422,36,27),(423,37,27),(424,38,27),(425,43,27),(426,44,27),(427,51,27),(428,52,27),(429,53,27),(430,76,27),(431,77,27),(432,79,27),(433,81,27),(434,99,27),(435,100,27),(436,102,27),(437,103,27),(438,104,27),(439,105,27),(440,106,27),(441,121,27),(442,128,27),(443,132,27),(444,133,27),(445,144,27),(446,145,27),(447,146,27),(448,147,27),(449,149,27),(450,151,27),(451,153,27),(452,154,27),(453,164,27),(454,165,27),(455,168,27),(456,178,27),(457,180,27),(458,181,27),(459,182,27),(460,183,27),(461,184,27),(462,185,27),(463,186,27),(464,1,28),(465,2,28),(466,35,28),(467,36,28),(468,37,28),(469,38,28),(470,43,28),(471,44,28),(472,51,28),(473,52,28),(474,53,28),(475,76,28),(476,77,28),(477,79,28),(478,81,28),(479,99,28),(480,100,28),(481,102,28),(482,103,28),(483,104,28),(484,105,28),(485,106,28),(486,121,28),(487,128,28),(488,132,28),(489,133,28),(490,144,28),(491,145,28),(492,146,28),(493,147,28),(494,149,28),(495,151,28),(496,153,28),(497,154,28),(498,164,28),(499,165,28),(500,168,28),(501,178,28),(502,180,28),(503,181,28),(504,182,28),(505,183,28),(506,184,28),(507,185,28),(508,186,28),(509,1,29),(510,2,29),(511,35,29),(512,36,29),(513,37,29),(514,38,29),(515,43,29),(516,44,29),(517,51,29),(518,52,29),(519,53,29),(520,76,29),(521,77,29),(522,79,29),(523,81,29),(524,99,29),(525,100,29),(526,102,29),(527,103,29),(528,104,29),(529,105,29),(530,106,29),(531,121,29),(532,128,29),(533,132,29),(534,133,29),(535,144,29),(536,145,29),(537,146,29),(538,147,29),(539,149,29),(540,151,29),(541,153,29),(542,154,29),(543,164,29),(544,165,29),(545,168,29),(546,178,29),(547,180,29),(548,181,29),(549,182,29),(550,183,29),(551,184,29),(552,185,29),(553,186,29),(555,202,30),(556,203,30),(557,204,30),(558,205,30),(559,206,30),(560,207,30),(561,208,30),(562,209,30),(563,210,30),(564,211,30),(565,212,30),(566,213,30),(567,214,30),(568,215,30),(569,216,30),(570,217,30),(571,218,30),(572,219,30),(573,220,30),(574,221,30),(575,222,30),(576,223,30),(577,224,30),(578,225,30),(579,298,30),(580,299,30),(581,300,30),(582,301,30),(584,303,30),(585,304,30),(586,305,30),(587,306,30),(588,307,30),(589,308,30),(590,309,30),(644,202,1),(645,203,1),(646,204,1),(647,205,1),(648,206,1),(649,207,1),(650,208,1),(651,209,1),(652,210,1),(653,211,1),(654,212,1),(655,213,1),(656,214,1),(657,215,1),(658,216,1),(659,217,1),(660,218,1),(661,219,1),(662,220,1),(663,221,1),(664,222,1),(665,223,1),(666,224,1),(667,225,1),(668,298,1),(669,299,1),(670,300,1),(671,301,1),(673,303,1),(674,304,1),(675,305,1),(676,306,1),(677,307,1),(678,308,1),(679,309,1),(680,202,31),(681,203,31),(682,204,31),(683,205,31),(684,206,31),(685,207,31),(686,208,31),(687,209,31),(688,210,31),(689,211,31),(690,212,31),(691,213,31),(692,214,31),(693,215,31),(694,216,31),(695,217,31),(696,218,31),(697,219,31),(698,220,31),(699,221,31),(700,222,31),(701,223,31),(702,224,31),(703,225,31),(704,298,31),(705,299,31),(706,300,31),(707,301,31),(709,303,31),(710,304,31),(711,305,31),(712,306,31),(713,307,31),(714,308,31),(715,309,31),(716,202,32),(717,203,32),(718,204,32),(719,205,32),(720,206,32),(721,207,32),(722,208,32),(723,209,32),(724,210,32),(725,211,32),(726,212,32),(727,213,32),(728,214,32),(729,215,32),(730,216,32),(731,217,32),(732,218,32),(733,219,32),(734,220,32),(735,221,32),(736,222,32),(737,223,32),(738,224,32),(739,225,32),(740,298,32),(741,299,32),(742,300,32),(743,301,32),(745,303,32),(746,304,32),(747,305,32),(748,306,32),(749,307,32),(750,308,32),(751,309,32),(752,202,18),(753,203,18),(754,204,18),(755,205,18),(756,206,18),(757,207,18),(758,208,18),(759,209,18),(760,210,18),(761,211,18),(762,212,18),(763,213,18),(764,214,18),(765,215,18),(766,216,18),(767,217,18),(768,218,18),(769,219,18),(770,220,18),(771,221,18),(772,222,18),(773,223,18),(774,224,18),(775,225,18),(776,298,18),(777,299,18),(778,300,18),(779,301,18),(781,303,18),(782,304,18),(783,305,18),(784,306,18),(785,307,18),(786,308,18),(787,309,18),(788,202,33),(789,203,33),(790,204,33),(791,205,33),(792,206,33),(793,207,33),(794,208,33),(795,209,33),(796,210,33),(797,211,33),(798,212,33),(799,213,33),(800,214,33),(801,215,33),(802,216,33),(803,217,33),(804,218,33),(805,219,33),(806,220,33),(807,221,33),(808,222,33),(809,223,33),(810,224,33),(811,225,33),(812,298,33),(813,299,33),(814,300,33),(815,301,33),(817,303,33),(818,304,33),(819,305,33),(820,306,33),(821,307,33),(822,308,33),(823,309,33),(824,202,33),(825,203,33),(826,204,33),(827,205,33),(828,206,33),(829,207,33),(830,208,33),(831,209,33),(832,210,33),(833,211,33),(834,212,33),(835,213,33),(836,214,33),(837,215,33),(838,216,33),(839,217,33),(840,218,33),(841,219,33),(842,220,33),(843,221,33),(844,222,33),(845,223,33),(846,224,33),(847,225,33),(848,298,33),(849,299,33),(850,300,33),(851,301,33),(853,303,33),(854,304,33),(855,305,33),(856,306,33),(857,307,33),(858,308,33),(859,309,33),(860,202,34),(861,203,34),(862,204,34),(863,205,34),(864,206,34),(865,207,34),(866,208,34),(867,209,34),(868,210,34),(869,211,34),(870,212,34),(871,213,34),(872,214,34),(873,215,34),(874,216,34),(875,217,34),(876,218,34),(877,219,34),(878,220,34),(879,221,34),(880,222,34),(881,223,34),(882,224,34),(883,225,34),(884,298,34),(885,299,34),(886,300,34),(887,301,34),(889,303,34),(890,304,34),(891,305,34),(892,306,34),(893,307,34),(894,308,34),(895,309,34),(896,202,34),(897,203,34),(898,204,34),(899,205,34),(900,206,34),(901,207,34),(902,208,34),(903,209,34),(904,210,34),(905,211,34),(906,212,34),(907,213,34),(908,214,34),(909,215,34),(910,216,34),(911,217,34),(912,218,34),(913,219,34),(914,220,34),(915,221,34),(916,222,34),(917,223,34),(918,224,34),(919,225,34),(920,298,34),(921,299,34),(922,300,34),(923,301,34),(925,303,34),(926,304,34),(927,305,34),(928,306,34),(929,307,34),(930,308,34),(931,309,34),(932,2,2),(933,35,2),(934,36,2),(935,37,2),(936,38,2),(937,43,2),(938,44,2),(939,51,2),(940,52,2),(941,53,2),(942,76,2),(943,77,2),(944,79,2),(945,81,2),(946,99,2),(947,100,2),(948,102,2),(949,103,2),(950,104,2),(951,105,2),(952,106,2),(953,121,2),(954,128,2),(955,132,2),(956,133,2),(957,144,2),(958,145,2),(959,146,2),(960,147,2),(961,149,2),(962,151,2),(963,153,2),(964,154,2),(965,164,2),(966,165,2),(967,168,2),(968,178,2),(969,180,2),(970,181,2),(971,182,2),(972,183,2),(973,184,2),(974,185,2),(975,186,2),(976,2,10),(977,35,10),(978,36,10),(979,37,10),(980,38,10),(981,43,10),(982,44,10),(983,51,10),(984,52,10),(985,53,10),(986,76,10),(987,77,10),(988,79,10),(989,81,10),(990,99,10),(991,100,10),(992,102,10),(993,103,10),(994,104,10),(995,105,10),(996,106,10),(997,121,10),(998,128,10),(999,132,10),(1000,133,10),(1001,144,10),(1002,145,10),(1003,146,10),(1004,147,10),(1005,149,10),(1006,151,10),(1007,153,10),(1008,154,10),(1009,164,10),(1010,165,10),(1011,168,10),(1012,178,10),(1013,180,10),(1014,181,10),(1015,182,10),(1016,183,10),(1017,184,10),(1018,185,10),(1019,186,10);
/*!40000 ALTER TABLE `product_attribute_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_attribute_values_translations`
--

DROP TABLE IF EXISTS `product_attribute_values_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_attribute_values_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_attribute_value_id` int(11) NOT NULL,
  `lang` varchar(10) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_pav_lang` (`product_attribute_value_id`,`lang`),
  CONSTRAINT `fk_pav_translations_pav_id` FOREIGN KEY (`product_attribute_value_id`) REFERENCES `product_attribute_values` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1971 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attribute_values_translations`
--

LOCK TABLES `product_attribute_values_translations` WRITE;
/*!40000 ALTER TABLE `product_attribute_values_translations` DISABLE KEYS */;
INSERT INTO `product_attribute_values_translations` VALUES (1,1,'en','Samsung'),(2,1,'ru','Samsung'),(3,2,'en','SM-S948BZKBCAU'),(4,2,'ru','SM-S948BZKBCAU'),(5,3,'en','Galaxy S26 Ultra'),(6,3,'ru','Galaxy S26 Ultra'),(7,4,'en','Yes'),(8,4,'ru','Да'),(9,5,'en','Dual SIM, eSIM'),(10,5,'ru','Dual SIM, eSIM'),(11,6,'en','GSM / HSPA / LTE / 5G'),(12,6,'ru','GSM / HSPA / LTE / 5G'),(13,7,'en','4G (LTE):'),(14,7,'ru','4G (LTE):'),(15,8,'en','5G:'),(16,8,'ru','5G:'),(17,9,'en','eSIM:'),(18,9,'ru','eSIM:'),(19,12,'en','Android 16'),(20,12,'ru','Android '),(21,13,'en','Samsung'),(22,13,'ru','Samsung'),(23,17,'en','Apple'),(24,17,'ru','Apple'),(25,18,'en','Apple'),(26,18,'ru','Apple'),(27,19,'en','Samsung'),(28,19,'ru','Samsung'),(29,20,'en','Samsung'),(30,20,'ru','Samsung'),(31,21,'en','Infinix'),(32,21,'ru','Infinix'),(33,22,'en','Infinix'),(34,22,'ru','Infinix'),(35,23,'en','Oukitel '),(36,23,'ru','Oukitel '),(37,24,'en','Samsung'),(38,24,'ru','Samsung'),(39,25,'en','Samsung'),(40,25,'ru','Samsung'),(41,26,'en','Samsung'),(42,26,'ru','Samsung'),(43,27,'en','Samsung'),(44,27,'ru','Samsung'),(45,28,'en','Apple'),(46,28,'ru','Apple'),(47,29,'en','Apple'),(48,29,'ru','Apple'),(49,30,'en','Honor '),(50,30,'ru','Honor '),(51,31,'en','Honor '),(52,31,'ru','Honor '),(53,32,'en','OPPO '),(54,32,'ru','OPPO '),(55,33,'en','OPPO '),(56,33,'ru','OPPO '),(57,34,'en','Nothing '),(58,34,'ru','Nothing '),(59,35,'en','Honor '),(60,35,'ru','Honor '),(61,36,'en','Honor '),(62,36,'ru','Honor '),(63,37,'en','SIGMA '),(64,37,'ru','SIGMA '),(65,38,'en','Oukitel '),(66,38,'ru','Oukitel '),(67,39,'en','Google '),(68,39,'ru','Google '),(69,40,'en','Google '),(70,40,'ru','Google '),(71,41,'en','OPPO '),(72,41,'ru','OPPO '),(73,42,'en','OPPO '),(74,42,'ru','OPPO '),(75,43,'en','Honor '),(76,43,'ru','Honor '),(77,44,'en','Honor '),(78,44,'ru','Honor '),(79,45,'en','Apple'),(80,45,'ru','Apple'),(81,46,'en','Google '),(82,46,'ru','Google '),(83,47,'en','Samsung'),(84,47,'ru','Samsung'),(85,48,'en','Samsung'),(86,48,'ru','Samsung'),(87,49,'en','OnePlus '),(88,49,'ru','OnePlus '),(89,50,'en','OnePlus '),(90,50,'ru','OnePlus '),(91,51,'en','Honor '),(92,51,'ru','Honor '),(93,52,'en','Honor '),(94,52,'ru','Honor '),(95,53,'en','Google '),(96,53,'ru','Google '),(97,54,'en','Google '),(98,54,'ru','Google '),(99,55,'en','Nothing '),(100,55,'ru','Nothing '),(101,56,'en','Nothing '),(102,56,'ru','Nothing '),(103,57,'en','Nothing '),(104,57,'ru','Nothing '),(105,58,'en','Xiaomi '),(106,58,'ru','Xiaomi '),(107,59,'en','Xiaomi '),(108,59,'ru','Xiaomi '),(109,60,'en','Android 16'),(110,60,'ru','Android 16'),(111,61,'en','iOS 18'),(112,61,'ru','iOS 18'),(113,62,'en','iOS 18'),(114,62,'ru','iOS 18'),(115,63,'en','Android 15'),(116,63,'ru','Android 15'),(117,64,'en','Android 15'),(118,64,'ru','Android 15'),(119,65,'en','Android 14 (Go edition)'),(120,65,'ru','Android 14 (Go edition)'),(121,66,'en','Android 14 (Go edition)'),(122,66,'ru','Android 14 (Go edition)'),(123,67,'en','Android 14'),(124,67,'ru','Android 14'),(125,68,'en','Android 14'),(126,68,'ru','Android 14'),(127,69,'en','Android 15'),(128,69,'ru','Android 15'),(129,70,'en','Android 15'),(130,70,'ru','Android 15'),(131,71,'en','Android 15'),(132,71,'ru','Android 15'),(133,72,'en','Android 15'),(134,72,'ru','Android 15'),(135,73,'en','iOS 19'),(136,73,'ru','iOS 19'),(137,74,'en','iOS 19'),(138,74,'ru','iOS 19'),(139,75,'en','Android 14'),(140,75,'ru','Android 14'),(141,76,'en','Android 14'),(142,76,'ru','Android 14'),(143,77,'en','Android 15'),(144,77,'ru','Android 15'),(145,78,'en','Android 15'),(146,78,'ru','Android 15'),(147,79,'en','Android 16'),(148,79,'ru','Android 16'),(149,80,'en','Android 16'),(150,80,'ru','Android 16'),(151,82,'en','Android 15'),(152,82,'ru','Android 15'),(153,83,'en','Android 15'),(154,83,'ru','Android 15'),(155,84,'en','Proprietary'),(156,84,'ru','Proprietary'),(157,85,'en','Proprietary'),(158,85,'ru','Proprietary'),(159,86,'en','Android 14'),(160,86,'ru','Android 14'),(161,87,'en','Android 14'),(162,87,'ru','Android 14'),(163,88,'en','Android 16'),(164,88,'ru','Android 16'),(165,89,'en','Android 16'),(166,89,'ru','Android 16'),(167,90,'en','Android 16'),(168,90,'ru','Android 16'),(169,91,'en','Android 16'),(170,91,'ru','Android 16'),(171,92,'en','Android 16'),(172,92,'ru','Android 16'),(173,93,'en','Android 16'),(174,93,'ru','Android 16'),(175,94,'en','Android 14'),(176,94,'ru','Android 14'),(177,95,'en','Android 14'),(178,95,'ru','Android 14'),(179,96,'en','Android 15'),(180,96,'ru','Android 15'),(181,97,'en','Android 15'),(182,97,'ru','Android 15'),(183,98,'en','iOS 19'),(184,98,'ru','iOS 19'),(185,99,'en','iOS 19'),(186,99,'ru','iOS 19'),(187,100,'en','Android 16'),(188,100,'ru','Android 16'),(189,101,'en','Android 16'),(190,101,'ru','Android 16'),(191,102,'en','Android 16'),(192,102,'ru','Android 16'),(193,103,'en','Android 16'),(194,103,'ru','Android 16'),(195,104,'en','77.6 mm / 6.9\"'),(196,104,'ru','77.6 mm / 6.9\"'),(197,105,'en','77.6 mm / 6.9\"'),(198,105,'ru','77.6 mm / 6.9\"'),(199,106,'en','71.6 mm / 6.1\"'),(200,106,'ru','71.6 mm / 6.1\"'),(201,107,'en','71.6 mm / 6.1\"'),(202,107,'ru','71.6 mm / 6.1\"'),(203,108,'en','70.6 mm / 6.2\"'),(204,108,'ru','70.6 mm / 6.2\"'),(205,109,'en','70.6 mm / 6.2\"'),(206,109,'ru','70.6 mm / 6.2\"'),(207,110,'en','77.1 mm / 6.7\"'),(208,110,'ru','77.1 mm / 6.7\"'),(209,111,'en','75.4 mm / 6.78\"'),(210,111,'ru','75.4 mm / 6.78\"'),(211,112,'en','78.0 mm / 6.52\"'),(212,112,'ru','78.0 mm / 6.52\"'),(213,113,'en','77.8 mm / 6.7\"'),(214,113,'ru','77.8 mm / 6.7\"'),(215,114,'en','77.8 mm / 6.7\"'),(216,114,'ru','77.8 mm / 6.7\"'),(217,115,'en','77.9 mm / 6.7\"'),(218,115,'ru','77.9 mm / 6.7\"'),(219,116,'en','77.9 mm / 6.7\"'),(220,116,'ru','77.9 mm / 6.7\"'),(221,117,'en','71.5 mm / 6.27\"'),(222,117,'ru','71.5 mm / 6.27\"'),(223,118,'en','71.5 mm / 6.27\"'),(224,118,'ru','71.5 mm / 6.27\"'),(225,119,'en','75.1 mm / 6.56\"'),(226,119,'ru','75.1 mm / 6.56\"'),(227,120,'en','75.1 mm / 6.56\"'),(228,120,'ru','75.1 mm / 6.56\"'),(229,121,'en','75.8 mm / 6.67\"'),(230,121,'ru','75.8 mm / 6.67\"'),(231,122,'en','75.8 mm / 6.67\"'),(232,122,'ru','75.8 mm / 6.67\"'),(233,123,'en','76.3 mm / 6.7\"'),(234,123,'ru','76.3 mm / 6.7\"'),(235,124,'en','76.3 mm / 6.78\"'),(236,124,'ru','76.3 mm / 6.78\"'),(237,125,'en','76.3 mm / 6.78\"'),(238,125,'ru','76.3 mm / 6.78\"'),(239,126,'en','58.0 mm / 2.8\"'),(240,126,'ru','58.0 mm / 2.8\"'),(241,127,'en','76.8 mm / 6.74\"'),(242,127,'ru','76.8 mm / 6.74\"'),(243,128,'en','72.0 mm / 6.3\"'),(244,128,'ru','72.0 mm / 6.3\"'),(245,129,'en','72.0 mm / 6.3\"'),(246,129,'ru','72.0 mm / 6.3\"'),(247,130,'en','75.5 mm / 6.7\"'),(248,130,'ru','75.5 mm / 6.7\"'),(249,131,'en','76.0 mm / 6.67\"'),(250,131,'ru','76.0 mm / 6.67\"'),(251,132,'en','74.6 mm / 6.7\"'),(252,132,'ru','74.6 mm / 6.7\"'),(253,133,'en','74.6 mm / 6.7\"'),(254,133,'ru','74.6 mm / 6.7\"'),(255,134,'en','71.5 mm / 6.1\"'),(256,134,'ru','71.5 mm / 6.1\"'),(257,135,'en','72.0 mm / 6.3\"'),(258,135,'ru','72.0 mm / 6.3\"'),(259,136,'en','77.9 mm / 6.7\"'),(260,136,'ru','77.9 mm / 6.7\"'),(261,137,'en','77.9 mm / 6.7\"'),(262,137,'ru','77.9 mm / 6.7\"'),(263,138,'en','75.8 mm / 6.82\"'),(264,138,'ru','75.8 mm / 6.82\"'),(265,139,'en','75.8 mm / 6.78\"'),(266,139,'ru','75.8 mm / 6.78\"'),(267,140,'en','75.2 mm / 6.7\"'),(268,140,'ru','75.2 mm / 6.7\"'),(269,141,'en','75.5 mm / 6.78\"'),(270,141,'ru','75.5 mm / 6.78\"'),(271,142,'en','72.7 mm / 6.3\"'),(272,142,'ru','72.7 mm / 6.3\"'),(273,143,'en','72.7 mm / 6.3\"'),(274,143,'ru','72.7 mm / 6.3\"'),(275,144,'en','76.5 mm / 6.7\"'),(276,144,'ru','76.5 mm / 6.7\"'),(277,145,'en','76.5 mm / 6.7\"'),(278,145,'ru','76.5 mm / 6.7\"'),(279,146,'en','76.5 mm / 6.7\"'),(280,146,'ru','76.5 mm / 6.7\"'),(281,147,'en','77.8 mm / 6.88\"'),(282,147,'ru','77.8 mm / 6.88\"'),(283,148,'en','77.8 mm / 6.88\"'),(284,148,'ru','77.8 mm / 6.88\"'),(285,149,'en','Yes'),(286,149,'ru','Yes'),(287,150,'en','Yes'),(288,150,'ru','Yes'),(289,151,'en','Yes'),(290,151,'ru','Yes'),(291,152,'en','Yes'),(292,152,'ru','Yes'),(293,153,'en','Yes'),(294,153,'ru','Yes'),(295,154,'en','Yes'),(296,154,'ru','Yes'),(297,155,'en','Yes'),(298,155,'ru','Yes'),(299,156,'en','Yes'),(300,156,'ru','Yes'),(301,157,'en','Yes'),(302,157,'ru','Yes'),(303,158,'en','Yes'),(304,158,'ru','Yes'),(305,159,'en','Yes'),(306,159,'ru','Yes'),(307,160,'en','Yes'),(308,160,'ru','Yes'),(309,161,'en','Yes'),(310,161,'ru','Yes'),(311,162,'en','Yes'),(312,162,'ru','Yes'),(313,163,'en','Yes'),(314,163,'ru','Yes'),(315,164,'en','Yes'),(316,164,'ru','Yes'),(317,165,'en','Yes'),(318,165,'ru','Yes'),(319,166,'en','Yes'),(320,166,'ru','Yes'),(321,167,'en','Yes'),(322,167,'ru','Yes'),(323,168,'en','Yes'),(324,168,'ru','Yes'),(325,169,'en','Yes'),(326,169,'ru','Yes'),(327,170,'en','Yes'),(328,170,'ru','Yes'),(329,171,'en','Yes'),(330,171,'ru','Yes'),(331,172,'en','Yes'),(332,172,'ru','Yes'),(333,173,'en','Yes'),(334,173,'ru','Yes'),(335,174,'en','Yes'),(336,174,'ru','Yes'),(337,175,'en','Yes'),(338,175,'ru','Yes'),(339,176,'en','Yes'),(340,176,'ru','Yes'),(341,177,'en','Yes'),(342,177,'ru','Yes'),(343,178,'en','Yes'),(344,178,'ru','Yes'),(345,179,'en','Yes'),(346,179,'ru','Yes'),(347,180,'en','Yes'),(348,180,'ru','Yes'),(349,181,'en','Yes'),(350,181,'ru','Yes'),(351,182,'en','Yes'),(352,182,'ru','Yes'),(353,183,'en','Yes'),(354,183,'ru','Yes'),(355,184,'en','Yes'),(356,184,'ru','Yes'),(357,185,'en','Yes'),(358,185,'ru','Yes'),(359,186,'en','Yes'),(360,186,'ru','Yes'),(361,187,'en','Yes'),(362,187,'ru','Yes'),(363,188,'en','Yes'),(364,188,'ru','Yes'),(365,189,'en','Yes'),(366,189,'ru','Yes'),(367,190,'en','Yes'),(368,190,'ru','Yes'),(369,191,'en','Yes'),(370,191,'ru','Yes'),(371,192,'en','Yes'),(372,192,'ru','Yes'),(373,193,'en','Yes'),(374,193,'ru','Yes'),(375,194,'en','256GB'),(376,194,'ru','256GB'),(377,195,'en','1TB'),(378,195,'ru','1TB'),(379,196,'en','128GB'),(380,196,'ru','128GB'),(381,197,'en','128GB'),(382,197,'ru','128GB'),(383,198,'en','128GB'),(384,198,'ru','128GB'),(385,199,'en','128GB'),(386,199,'ru','128GB'),(387,200,'en','128GB'),(388,200,'ru','128GB'),(389,201,'en','256GB'),(390,201,'ru','256GB'),(391,202,'en','64GB'),(392,202,'ru','64GB'),(393,203,'en','128GB'),(394,203,'ru','128GB'),(395,204,'en','128GB'),(396,204,'ru','128GB'),(397,205,'en','128GB'),(398,205,'ru','128GB'),(399,206,'en','128GB'),(400,206,'ru','128GB'),(401,207,'en','256GB'),(402,207,'ru','256GB'),(403,208,'en','256GB'),(404,208,'ru','256GB'),(405,209,'en','128GB'),(406,209,'ru','128GB'),(407,210,'en','128GB'),(408,210,'ru','128GB'),(409,211,'en','256GB'),(410,211,'ru','256GB'),(411,212,'en','256GB'),(412,212,'ru','256GB'),(413,213,'en','256GB'),(414,213,'ru','256GB'),(415,214,'en','256GB'),(416,214,'ru','256GB'),(417,215,'en','256GB'),(418,215,'ru','256GB'),(419,216,'en','256GB'),(420,216,'ru','256GB'),(421,217,'en','256GB'),(422,217,'ru','128GB'),(423,218,'en','128GB'),(424,218,'ru','128GB'),(425,219,'en','128GB'),(426,219,'ru','512GB'),(427,220,'en','512GB'),(428,220,'ru','64GB'),(429,221,'en','64GB'),(430,221,'ru','256GB'),(431,222,'en','256GB'),(432,222,'ru','256GB'),(433,223,'en','256GB'),(434,223,'ru','256GB'),(435,224,'en','256GB'),(436,224,'ru','128GB'),(437,225,'en','128GB'),(438,225,'ru','128GB'),(439,226,'en','128GB'),(440,226,'ru','128GB'),(441,227,'en','128GB'),(442,227,'ru','256GB'),(443,228,'en','256GB'),(444,228,'ru','512GB'),(445,229,'en','512GB'),(446,229,'ru','512GB'),(447,230,'en','512GB'),(448,230,'ru','512GB'),(449,231,'en','512GB'),(450,231,'ru','128GB'),(451,232,'en','128GB'),(452,232,'ru','128GB'),(453,233,'en','128GB'),(454,233,'ru','256GB'),(455,234,'en','256GB'),(456,234,'ru','128GB'),(457,235,'en','128GB'),(458,235,'ru','128GB'),(459,236,'en','128GB'),(460,236,'ru','128GB'),(461,237,'en','128GB'),(462,237,'ru','128GB'),(463,238,'en','128GB'),(464,238,'ru','128GB'),(465,239,'en','No'),(466,239,'ru','No'),(467,240,'en','No'),(468,240,'ru','No'),(469,241,'en','No'),(470,241,'ru','No'),(471,242,'en','No'),(472,242,'ru','No'),(473,243,'en','No'),(474,243,'ru','No'),(475,244,'en','No'),(476,244,'ru','No'),(477,245,'en','Yes'),(478,245,'ru','Yes'),(479,246,'en','Yes'),(480,246,'ru','Yes'),(481,247,'en','Yes'),(482,247,'ru','Yes'),(483,248,'en','Yes'),(484,248,'ru','Yes'),(485,249,'en','Yes'),(486,249,'ru','Yes'),(487,250,'en','Yes'),(488,250,'ru','Yes'),(489,251,'en','Yes'),(490,251,'ru','Yes'),(491,252,'en','No'),(492,252,'ru','No'),(493,253,'en','No'),(494,253,'ru','No'),(495,254,'en','No'),(496,254,'ru','No'),(497,255,'en','No'),(498,255,'ru','No'),(499,256,'en','No'),(500,256,'ru','No'),(501,257,'en','No'),(502,257,'ru','No'),(503,258,'en','Yes'),(504,258,'ru','Yes'),(505,259,'en','Yes'),(506,259,'ru','Yes'),(507,260,'en','No'),(508,260,'ru','No'),(509,261,'en','Yes'),(510,261,'ru','Yes'),(511,262,'en','No'),(512,262,'ru','No'),(513,263,'en','No'),(514,263,'ru','No'),(515,264,'en','No'),(516,264,'ru','No'),(517,265,'en','No'),(518,265,'ru','No'),(519,266,'en','Yes'),(520,266,'ru','Yes'),(521,267,'en','No'),(522,267,'ru','No'),(523,268,'en','No'),(524,268,'ru','No'),(525,269,'en','No'),(526,269,'ru','No'),(527,270,'en','No'),(528,270,'ru','No'),(529,271,'en','Yes'),(530,271,'ru','Yes'),(531,272,'en','Yes'),(532,272,'ru','Yes'),(533,273,'en','No'),(534,273,'ru','No'),(535,274,'en','No'),(536,274,'ru','No'),(537,275,'en','No'),(538,275,'ru','No'),(539,276,'en','No'),(540,276,'ru','No'),(541,277,'en','No'),(542,277,'ru','No'),(543,278,'en','No'),(544,278,'ru','No'),(545,279,'en','No'),(546,279,'ru','No'),(547,280,'en','No'),(548,280,'ru','No'),(549,281,'en','No'),(550,281,'ru','No'),(551,282,'en','Yes'),(552,282,'ru','Yes'),(553,283,'en','Yes'),(554,283,'ru','Yes'),(555,284,'en','120 Hz'),(556,284,'ru','120 Hz'),(557,285,'en','120 Hz'),(558,285,'ru','120 Hz'),(559,286,'en','60 Hz'),(560,286,'ru','60 Hz'),(561,287,'en','60 Hz'),(562,287,'ru','60 Hz'),(563,288,'en','120 Hz'),(564,288,'ru','120 Hz'),(565,289,'en','120 Hz'),(566,289,'ru','120 Hz'),(567,290,'en','120 Hz'),(568,290,'ru','120 Hz'),(569,291,'en','120 Hz'),(570,291,'ru','120 Hz'),(571,292,'en','90 Hz'),(572,292,'ru','90 Hz'),(573,293,'en','90 Hz'),(574,293,'ru','90 Hz'),(575,294,'en','90 Hz'),(576,294,'ru','90 Hz'),(577,295,'en','90 Hz'),(578,295,'ru','90 Hz'),(579,296,'en','120 Hz'),(580,296,'ru','120 Hz'),(581,297,'en','120 Hz'),(582,297,'ru','120 Hz'),(583,298,'en','90 Hz'),(584,298,'ru','90 Hz'),(585,299,'en','90 Hz'),(586,299,'ru','90 Hz'),(587,300,'en','120 Hz'),(588,300,'ru','120 Hz'),(589,301,'en','120 Hz'),(590,301,'ru','120 Hz'),(591,302,'en','120 Hz'),(592,302,'ru','120 Hz'),(593,303,'en','120 Hz'),(594,303,'ru','120 Hz'),(595,304,'en','120 Hz'),(596,304,'ru','120 Hz'),(597,305,'en','60 Hz'),(598,305,'ru','60 Hz'),(599,306,'en','90 Hz'),(600,306,'ru','90 Hz'),(601,307,'en','120 Hz'),(602,307,'ru','120 Hz'),(603,308,'en','120 Hz'),(604,308,'ru','120 Hz'),(605,309,'en','120 Hz'),(606,309,'ru','120 Hz'),(607,310,'en','90 Hz'),(608,310,'ru','90 Hz'),(609,311,'en','120 Hz'),(610,311,'ru','120 Hz'),(611,312,'en','120 Hz'),(612,312,'ru','120 Hz'),(613,313,'en','60 Hz'),(614,313,'ru','60 Hz'),(615,314,'en','120 Hz'),(616,314,'ru','120 Hz'),(617,315,'en','120 Hz'),(618,315,'ru','120 Hz'),(619,316,'en','120 Hz'),(620,316,'ru','120 Hz'),(621,317,'en','120 Hz'),(622,317,'ru','120 Hz'),(623,318,'en','120 Hz'),(624,318,'ru','120 Hz'),(625,319,'en','120 Hz'),(626,319,'ru','120 Hz'),(627,320,'en','120 Hz'),(628,320,'ru','120 Hz'),(629,321,'en','120 Hz'),(630,321,'ru','120 Hz'),(631,322,'en','120 Hz'),(632,322,'ru','120 Hz'),(633,323,'en','120 Hz'),(634,323,'ru','120 Hz'),(635,324,'en','120 Hz'),(636,324,'ru','120 Hz'),(637,325,'en','120 Hz'),(638,325,'ru','120 Hz'),(639,326,'en','120 Hz'),(640,326,'ru','120 Hz'),(641,327,'en','120 Hz'),(642,327,'ru','120 Hz'),(643,328,'en','120 Hz'),(644,328,'ru','120 Hz'),(645,329,'en','No'),(646,329,'ru','No'),(647,330,'en','No'),(648,330,'ru','No'),(649,331,'en','No'),(650,331,'ru','No'),(651,332,'en','No'),(652,332,'ru','No'),(653,333,'en','No'),(654,333,'ru','No'),(655,334,'en','No'),(656,334,'ru','No'),(657,335,'en','Yes'),(658,335,'ru','Yes'),(659,336,'en','Yes'),(660,336,'ru','Yes'),(661,337,'en','Yes'),(662,337,'ru','Yes'),(663,338,'en','Yes'),(664,338,'ru','Yes'),(665,339,'en','Yes'),(666,339,'ru','Yes'),(667,340,'en','Yes'),(668,340,'ru','Yes'),(669,341,'en','Yes'),(670,341,'ru','Yes'),(671,342,'en','No'),(672,342,'ru','No'),(673,343,'en','No'),(674,343,'ru','No'),(675,344,'en','No'),(676,344,'ru','No'),(677,345,'en','No'),(678,345,'ru','No'),(679,346,'en','No'),(680,346,'ru','No'),(681,347,'en','No'),(682,347,'ru','No'),(683,348,'en','Yes'),(684,348,'ru','Yes'),(685,349,'en','Yes'),(686,349,'ru','Yes'),(687,350,'en','No'),(688,350,'ru','No'),(689,351,'en','Yes'),(690,351,'ru','Yes'),(691,352,'en','No'),(692,352,'ru','No'),(693,353,'en','No'),(694,353,'ru','No'),(695,354,'en','No'),(696,354,'ru','No'),(697,355,'en','No'),(698,355,'ru','No'),(699,356,'en','Yes'),(700,356,'ru','Yes'),(701,357,'en','No'),(702,357,'ru','No'),(703,358,'en','No'),(704,358,'ru','No'),(705,359,'en','No'),(706,359,'ru','No'),(707,360,'en','No'),(708,360,'ru','No'),(709,361,'en','No'),(710,361,'ru','No'),(711,362,'en','No'),(712,362,'ru','No'),(713,363,'en','No'),(714,363,'ru','No'),(715,364,'en','No'),(716,364,'ru','No'),(717,365,'en','No'),(718,365,'ru','No'),(719,366,'en','No'),(720,366,'ru','No'),(721,367,'en','No'),(722,367,'ru','No'),(723,368,'en','No'),(724,368,'ru','No'),(725,369,'en','No'),(726,369,'ru','No'),(727,370,'en','No'),(728,370,'ru','No'),(729,371,'en','No'),(730,371,'ru','No'),(731,372,'en','Yes'),(732,372,'ru','Yes'),(733,373,'en','Yes'),(734,373,'ru','Yes'),(735,374,'en','Yes'),(736,374,'ru','Yes'),(737,375,'en','Yes'),(738,375,'ru','Yes'),(739,376,'en','Yes'),(740,376,'ru','Yes'),(741,377,'en','Yes'),(742,377,'ru','Yes'),(743,378,'en','Yes'),(744,378,'ru','Yes'),(745,379,'en','Yes'),(746,379,'ru','Yes'),(747,380,'en','No'),(748,380,'ru','No'),(749,381,'en','No'),(750,381,'ru','No'),(751,382,'en','No'),(752,382,'ru','No'),(753,383,'en','No'),(754,383,'ru','No'),(755,384,'en','No'),(756,384,'ru','No'),(757,385,'en','No'),(758,385,'ru','No'),(759,386,'en','No'),(760,386,'ru','No'),(761,387,'en','Yes'),(762,387,'ru','Yes'),(763,388,'en','Yes'),(764,388,'ru','Yes'),(765,389,'en','No'),(766,389,'ru','No'),(767,390,'en','No'),(768,390,'ru','No'),(769,391,'en','No'),(770,391,'ru','No'),(771,392,'en','No'),(772,392,'ru','No'),(773,393,'en','Yes'),(774,393,'ru','Yes'),(775,394,'en','No'),(776,394,'ru','No'),(777,395,'en','No'),(778,395,'ru','No'),(779,396,'en','No'),(780,396,'ru','No'),(781,397,'en','No'),(782,397,'ru','No'),(783,398,'en','Yes'),(784,398,'ru','Yes'),(785,399,'en','Yes'),(786,399,'ru','Yes'),(787,400,'en','No'),(788,400,'ru','No'),(789,401,'en','No'),(790,401,'ru','No'),(791,402,'en','No'),(792,402,'ru','No'),(793,403,'en','No'),(794,403,'ru','No'),(795,404,'en','Yes'),(796,404,'ru','Yes'),(797,405,'en','Yes'),(798,405,'ru','Yes'),(799,406,'en','No'),(800,406,'ru','No'),(801,407,'en','No'),(802,407,'ru','No'),(803,408,'en','Yes'),(804,408,'ru','Yes'),(805,409,'en','No'),(806,409,'ru','No'),(807,410,'en','Yes'),(808,410,'ru','Yes'),(809,411,'en','Yes'),(810,411,'ru','Yes'),(811,412,'en','Yes'),(812,412,'ru','Yes'),(813,413,'en','Yes'),(814,413,'ru','Yes'),(815,414,'en','No'),(816,414,'ru','No'),(817,415,'en','No'),(818,415,'ru','No'),(819,416,'en','No'),(820,416,'ru','No'),(821,417,'en','No'),(822,417,'ru','No'),(823,418,'en','No'),(824,418,'ru','No'),(825,419,'en','Yes'),(826,419,'ru','Yes'),(827,420,'en','Yes'),(828,420,'ru','Yes'),(829,421,'en','Yes'),(830,421,'ru','Yes'),(831,422,'en','Yes'),(832,422,'ru','Yes'),(833,423,'en','No'),(834,423,'ru','No'),(835,424,'en','No'),(836,424,'ru','No'),(837,425,'en','No'),(838,425,'ru','No'),(839,426,'en','No'),(840,426,'ru','No'),(841,427,'en','No'),(842,427,'ru','No'),(843,428,'en','No'),(844,428,'ru','No'),(845,429,'en','No'),(846,429,'ru','No'),(847,430,'en','No'),(848,430,'ru','No'),(849,431,'en','No'),(850,431,'ru','No'),(851,432,'en','Yes'),(852,432,'ru','Yes'),(853,433,'en','Yes'),(854,433,'ru','Yes'),(855,434,'en','No'),(856,434,'ru','No'),(857,435,'en','No'),(858,435,'ru','No'),(859,436,'en','Yes'),(860,436,'ru','Yes'),(861,437,'en','Yes'),(862,437,'ru','Yes'),(863,438,'en','Yes'),(864,438,'ru','Yes'),(865,439,'en','No'),(866,439,'ru','No'),(867,440,'en','No'),(868,440,'ru','No'),(869,441,'en','No'),(870,441,'ru','No'),(871,442,'en','No'),(872,442,'ru','No'),(873,443,'en','Yes'),(874,443,'ru','Yes'),(875,444,'en','Yes'),(876,444,'ru','Yes'),(877,445,'en','Yes'),(878,445,'ru','Yes'),(879,446,'en','No'),(880,446,'ru','No'),(881,447,'en','No'),(882,447,'ru','No'),(883,448,'en','No'),(884,448,'ru','No'),(885,449,'en','Yes'),(886,449,'ru','Yes'),(887,450,'en','Yes'),(888,450,'ru','Yes'),(889,451,'en','Yes'),(890,451,'ru','Yes'),(891,452,'en','Yes'),(892,452,'ru','Yes'),(893,453,'en','Yes'),(894,453,'ru','Yes'),(895,454,'en','Yes'),(896,454,'ru','Yes'),(897,455,'en','Yes'),(898,455,'ru','Yes'),(899,456,'en','Yes'),(900,456,'ru','Yes'),(901,457,'en','Yes'),(902,457,'ru','Yes'),(903,458,'en','Yes'),(904,458,'ru','Yes'),(905,459,'en','No'),(906,459,'ru','No'),(907,460,'en','No'),(908,460,'ru','No'),(909,461,'en','No'),(910,461,'ru','No'),(911,462,'en','No'),(912,462,'ru','No'),(913,463,'en','No'),(914,463,'ru','No'),(915,464,'en','Galaxy S'),(916,464,'ru','Galaxy S'),(917,465,'en','iPhone 16'),(918,465,'ru','iPhone 16'),(919,466,'en','Galaxy S'),(920,466,'ru','Galaxy S'),(921,467,'en','Hot'),(922,467,'ru','Hot'),(923,468,'en','G Series'),(924,468,'ru','Galaxy A'),(925,469,'en','Galaxy A'),(926,469,'ru','Galaxy A'),(927,470,'en','Galaxy A'),(928,470,'ru','iPhone 17'),(929,471,'en','iPhone 17'),(930,471,'ru','X Series'),(931,472,'en','X Series'),(932,472,'ru','Reno'),(933,473,'en','Reno'),(934,473,'ru','Phone'),(935,474,'en','X Series'),(936,474,'ru','X Series'),(937,475,'en','X-Style'),(938,475,'ru','C Series'),(939,476,'en','Pixel'),(940,476,'ru','Pixel'),(941,477,'en','Reno'),(942,477,'ru','A Series'),(943,478,'en','600 Series'),(944,478,'ru','600 Series'),(945,479,'en','iPhone 17'),(946,479,'ru','Pixel'),(947,480,'en','Galaxy A'),(948,480,'ru','Galaxy A'),(949,481,'en','OnePlus'),(950,481,'ru','OnePlus'),(951,482,'en','600 Series'),(952,482,'ru','600 Series'),(953,483,'en','Pixel'),(954,483,'ru','Pixel'),(955,484,'en','Phone'),(956,484,'ru','Phone'),(957,485,'en','Phone'),(958,485,'ru','Redmi'),(959,486,'en','Redmi'),(960,486,'ru','Galaxy S'),(961,487,'en','Galaxy S'),(962,487,'ru','iPhone 16'),(963,488,'en','iPhone 16'),(964,488,'ru','Galaxy S'),(965,489,'en','Galaxy S'),(966,489,'ru','Hot'),(967,490,'en','Hot'),(968,490,'ru','G Series'),(969,491,'en','Galaxy A'),(970,491,'ru','Galaxy A'),(971,492,'en','Galaxy A'),(972,492,'ru','Galaxy A'),(973,493,'en','iPhone 17'),(974,493,'ru','iPhone 17'),(975,494,'en','X Series'),(976,494,'ru','X Series'),(977,495,'en','Reno'),(978,495,'ru','Reno'),(979,496,'en','Phone'),(980,496,'ru','X Series'),(981,497,'en','X Series'),(982,497,'ru','X-Style'),(983,498,'en','C Series'),(984,498,'ru','Pixel'),(985,499,'en','Pixel'),(986,499,'ru','Reno'),(987,500,'en','A Series'),(988,500,'ru','600 Series'),(989,501,'en','600 Series'),(990,501,'ru','iPhone 17'),(991,502,'en','Pixel'),(992,502,'ru','Galaxy A'),(993,503,'en','Galaxy A'),(994,503,'ru','OnePlus'),(995,504,'en','OnePlus'),(996,504,'ru','600 Series'),(997,505,'en','600 Series'),(998,505,'ru','Pixel'),(999,506,'en','Pixel'),(1000,506,'ru','Phone'),(1001,507,'en','Phone'),(1002,507,'ru','Phone'),(1003,508,'en','Redmi'),(1004,508,'ru','Redmi'),(1005,509,'en','Yes'),(1006,509,'ru','Да'),(1007,510,'en','Yes'),(1008,510,'ru','Да'),(1009,511,'en','Yes'),(1010,511,'ru','Да'),(1011,512,'en','Yes'),(1012,512,'ru','Да'),(1013,513,'en','Yes'),(1014,513,'ru','Да'),(1015,514,'en','Yes'),(1016,514,'ru','Да'),(1017,515,'en','Yes'),(1018,515,'ru','Да'),(1019,516,'en','Yes'),(1020,516,'ru','Да'),(1021,517,'en','Yes'),(1022,517,'ru','Да'),(1023,518,'en','Yes'),(1024,518,'ru','Да'),(1025,519,'en','Yes'),(1026,519,'ru','Да'),(1027,520,'en','Yes'),(1028,520,'ru','Да'),(1029,521,'en','No'),(1030,521,'ru','Нет'),(1031,522,'en','No'),(1032,522,'ru','Нет'),(1033,523,'en','Yes'),(1034,523,'ru','Да'),(1035,524,'en','Yes'),(1036,524,'ru','Да'),(1037,525,'en','No'),(1038,525,'ru','Нет'),(1039,526,'en','No'),(1040,526,'ru','Нет'),(1041,527,'en','Yes'),(1042,527,'ru','Да'),(1043,528,'en','Yes'),(1044,528,'ru','Да'),(1045,529,'en','Yes'),(1046,529,'ru','Да'),(1047,530,'en','Yes'),(1048,530,'ru','Да'),(1049,531,'en','Yes'),(1050,531,'ru','Да'),(1051,532,'en','Yes'),(1052,532,'ru','Да'),(1053,533,'en','Yes'),(1054,533,'ru','Да'),(1055,534,'en','Yes'),(1056,534,'ru','Да'),(1057,535,'en','Yes'),(1058,535,'ru','Да'),(1059,536,'en','Yes'),(1060,536,'ru','Да'),(1061,537,'en','Yes'),(1062,537,'ru','Да'),(1063,538,'en','Yes'),(1064,538,'ru','Да'),(1065,539,'en','Yes'),(1066,539,'ru','Да'),(1067,540,'en','Yes'),(1068,540,'ru','Да'),(1069,541,'en','Yes'),(1070,541,'ru','Да'),(1071,542,'en','Yes'),(1072,542,'ru','Да'),(1073,543,'en','Yes'),(1074,543,'ru','Да'),(1075,544,'en','Yes'),(1076,544,'ru','Да'),(1077,545,'en','No'),(1078,545,'ru','Нет'),(1079,546,'en','No'),(1080,546,'ru','Нет'),(1081,547,'en','Yes'),(1082,547,'ru','Да'),(1083,548,'en','Yes'),(1084,548,'ru','Да'),(1085,549,'en','Yes'),(1086,549,'ru','Да'),(1087,550,'en','Yes'),(1088,550,'ru','Да'),(1089,551,'en','Yes'),(1090,551,'ru','Да'),(1091,552,'en','Yes'),(1092,552,'ru','Да'),(1093,553,'en','Yes'),(1094,553,'ru','Да'),(1104,555,'en','45mm'),(1105,555,'ru','45мм'),(1106,556,'en','45mm'),(1107,556,'ru','45мм'),(1108,557,'en','46mm'),(1109,557,'ru','46мм'),(1110,558,'en','46mm'),(1111,558,'ru','46мм'),(1112,559,'en','40mm'),(1113,559,'ru','40мм'),(1114,560,'en','49mm'),(1115,560,'ru','49мм'),(1116,561,'en','46mm'),(1117,561,'ru','46мм'),(1118,562,'en','46mm'),(1119,562,'ru','46мм'),(1120,563,'en','40mm'),(1121,563,'ru','40мм'),(1122,564,'en','44mm'),(1123,564,'ru','44мм'),(1124,565,'en','44mm'),(1125,565,'ru','44мм'),(1126,566,'en','42mm'),(1127,566,'ru','42мм'),(1128,567,'en','45mm'),(1129,567,'ru','45мм'),(1130,568,'en','45mm'),(1131,568,'ru','45мм'),(1132,569,'en','44mm'),(1133,569,'ru','44мм'),(1134,570,'en','45mm'),(1135,570,'ru','45мм'),(1136,571,'en','45mm'),(1137,571,'ru','45мм'),(1138,572,'en','38mm'),(1139,572,'ru','38мм'),(1140,573,'en','46mm'),(1141,573,'ru','46мм'),(1142,574,'en','38mm'),(1143,574,'ru','38мм'),(1144,575,'en','51mm'),(1145,575,'ru','51мм'),(1146,576,'en','51mm'),(1147,576,'ru','51мм'),(1148,577,'en','51mm'),(1149,577,'ru','51мм'),(1150,578,'en','44mm'),(1151,578,'ru','44мм'),(1152,579,'en','50mm'),(1153,579,'ru','50мм'),(1154,580,'en','46mm'),(1155,580,'ru','46мм'),(1156,581,'en','48mm'),(1157,581,'ru','48мм'),(1158,582,'en','48mm'),(1159,582,'ru','48мм'),(1162,584,'en','42mm'),(1163,584,'ru','42мм'),(1164,585,'en','47mm'),(1165,585,'ru','47мм'),(1166,586,'en','44mm'),(1167,586,'ru','44мм'),(1168,587,'en','40mm'),(1169,587,'ru','40мм'),(1170,588,'en','46mm'),(1171,588,'ru','46мм'),(1172,589,'en','44mm'),(1173,589,'ru','44мм'),(1174,590,'en','47mm'),(1175,590,'ru','47мм'),(1176,644,'en','Amazfit'),(1177,644,'ru','Amazfit'),(1178,645,'en','Amazfit'),(1179,645,'ru','Amazfit'),(1180,646,'en','QCY'),(1181,646,'ru','QCY'),(1182,647,'en','Apple'),(1183,647,'ru','Apple'),(1184,648,'en','Apple'),(1185,648,'ru','Apple'),(1186,649,'en','Apple'),(1187,649,'ru','Apple'),(1188,650,'en','Apple'),(1189,650,'ru','Apple'),(1190,651,'en','Apple'),(1191,651,'ru','Apple'),(1192,652,'en','Apple'),(1193,652,'ru','Apple'),(1194,653,'en','Apple'),(1195,653,'ru','Apple'),(1196,654,'en','Apple'),(1197,654,'ru','Apple'),(1198,655,'en','Apple'),(1199,655,'ru','Apple'),(1200,656,'en','Canyon'),(1201,656,'ru','Canyon'),(1202,657,'en','Canyon'),(1203,657,'ru','Canyon'),(1204,658,'en','Canyon'),(1205,658,'ru','Canyon'),(1206,659,'en','Canyon'),(1207,659,'ru','Canyon'),(1208,660,'en','Canyon'),(1209,660,'ru','Canyon'),(1210,661,'en','Canyon'),(1211,661,'ru','Canyon'),(1212,662,'en','Canyon'),(1213,662,'ru','Canyon'),(1214,663,'en','Canyon'),(1215,663,'ru','Canyon'),(1216,664,'en','Xiaomi'),(1217,664,'ru','Xiaomi'),(1218,665,'en','Xiaomi'),(1219,665,'ru','Xiaomi'),(1220,666,'en','Xiaomi'),(1221,666,'ru','Xiaomi'),(1222,667,'en','Honor'),(1223,667,'ru','Honor'),(1224,668,'en','OUKITEL'),(1225,668,'ru','OUKITEL'),(1226,669,'en','Apple'),(1227,669,'ru','Apple'),(1228,670,'en','Celly'),(1229,670,'ru','Celly'),(1230,671,'en','Celly'),(1231,671,'ru','Celly'),(1234,673,'en','Apple'),(1235,673,'ru','Apple'),(1236,674,'en','Xiaomi'),(1237,674,'ru','Xiaomi'),(1238,675,'en','Realme'),(1239,675,'ru','Realme'),(1240,676,'en','Samsung'),(1241,676,'ru','Samsung'),(1242,677,'en','Amazfit'),(1243,677,'ru','Amazfit'),(1244,678,'en','Amazfit'),(1245,678,'ru','Amazfit'),(1246,679,'en','Amazfit'),(1247,679,'ru','Amazfit'),(1248,680,'en','Smart Watch'),(1249,680,'ru','Умные часы'),(1250,681,'en','Smart Watch'),(1251,681,'ru','Умные часы'),(1252,682,'en','Smart Watch'),(1253,682,'ru','Умные часы'),(1254,683,'en','Smart Watch'),(1255,683,'ru','Умные часы'),(1256,684,'en','Smart Watch'),(1257,684,'ru','Умные часы'),(1258,685,'en','Smart Watch'),(1259,685,'ru','Умные часы'),(1260,686,'en','Smart Watch'),(1261,686,'ru','Умные часы'),(1262,687,'en','Smart Watch'),(1263,687,'ru','Умные часы'),(1264,688,'en','Smart Watch'),(1265,688,'ru','Умные часы'),(1266,689,'en','Smart Watch'),(1267,689,'ru','Умные часы'),(1268,690,'en','Smart Watch'),(1269,690,'ru','Умные часы'),(1270,691,'en','Smart Watch'),(1271,691,'ru','Умные часы'),(1272,692,'en','Smart Watch'),(1273,692,'ru','Умные часы'),(1274,693,'en','Smart Watch'),(1275,693,'ru','Умные часы'),(1276,694,'en','Smart Watch'),(1277,694,'ru','Умные часы'),(1278,695,'en','Smart Watch'),(1279,695,'ru','Умные часы'),(1280,696,'en','Smart Watch'),(1281,696,'ru','Умные часы'),(1282,697,'en','Smart Watch'),(1283,697,'ru','Умные часы'),(1284,698,'en','Smart Watch'),(1285,698,'ru','Умные часы'),(1286,699,'en','Smart Watch'),(1287,699,'ru','Умные часы'),(1288,700,'en','Smart Watch'),(1289,700,'ru','Умные часы'),(1290,701,'en','Smart Watch'),(1291,701,'ru','Умные часы'),(1292,702,'en','Smart Watch'),(1293,702,'ru','Умные часы'),(1294,703,'en','Smart Watch'),(1295,703,'ru','Умные часы'),(1296,704,'en','Smart Watch'),(1297,704,'ru','Умные часы'),(1298,705,'en','Smart Watch'),(1299,705,'ru','Умные часы'),(1300,706,'en','Smart Watch'),(1301,706,'ru','Умные часы'),(1302,707,'en','Smart Watch'),(1303,707,'ru','Умные часы'),(1306,709,'en','Smart Watch'),(1307,709,'ru','Умные часы'),(1308,710,'en','Smart Watch'),(1309,710,'ru','Умные часы'),(1310,711,'en','Smart Watch'),(1311,711,'ru','Умные часы'),(1312,712,'en','Fitness Tracker'),(1313,712,'ru','Фитнес-браслет'),(1314,713,'en','Smart Watch'),(1315,713,'ru','Умные часы'),(1316,714,'en','Smart Watch'),(1317,714,'ru','Умные часы'),(1318,715,'en','Smart Watch'),(1319,715,'ru','Умные часы'),(1320,716,'en','Black'),(1321,716,'ru','Черный'),(1322,717,'en','Cream White'),(1323,717,'ru','Кремово-белый'),(1324,718,'en','Rose Gold'),(1325,718,'ru','Розовое золото'),(1326,719,'en','Space Grey'),(1327,719,'ru','Космический серый'),(1328,720,'en','Starlight'),(1329,720,'ru','Сияющая звезда'),(1330,721,'en','Black'),(1331,721,'ru','Черный'),(1332,722,'en','Jet Black'),(1333,722,'ru','Глянцевый черный'),(1334,723,'en','Jet Black'),(1335,723,'ru','Глянцевый черный'),(1336,724,'en','Starlight'),(1337,724,'ru','Сияющая звезда'),(1338,725,'en','Midnight'),(1339,725,'ru','Темная ночь'),(1340,726,'en','Midnight'),(1341,726,'ru','Темная ночь'),(1342,727,'en','Jet Black'),(1343,727,'ru','Глянцевый черный'),(1344,728,'en','Silver'),(1345,728,'ru','Серебристый'),(1346,729,'en','Red'),(1347,729,'ru','Красный'),(1348,730,'en','Black Green'),(1349,730,'ru','Черный / Зеленый'),(1350,731,'en','Black'),(1351,731,'ru','Черный'),(1352,732,'en','Silver'),(1353,732,'ru','Серебристый'),(1354,733,'en','Blue Yellow'),(1355,733,'ru','Синий / Желтый'),(1356,734,'en','Silver'),(1357,734,'ru','Серебристый'),(1358,735,'en','Green Orange'),(1359,735,'ru','Зеленый / Оранжевый'),(1360,736,'en','Obsidian Black'),(1361,736,'ru','Черный обсидиан'),(1362,737,'en','Silver Gray'),(1363,737,'ru','Серебристо-серый'),(1364,738,'en','Lavender Purple'),(1365,738,'ru','Лавандово-фиолетовый'),(1366,739,'en','Black'),(1367,739,'ru','Черный'),(1368,740,'en','Black'),(1369,740,'ru','Черный'),(1370,741,'en','Rose Gold'),(1371,741,'ru','Розовое золото'),(1372,742,'en','Black'),(1373,742,'ru','Черный'),(1374,743,'en','Black'),(1375,743,'ru','Черный'),(1378,745,'en','Rose Gold'),(1379,745,'ru','Розовое золото'),(1380,746,'en','Silver Gray'),(1381,746,'ru','Серебристо-серый'),(1382,747,'en','Black'),(1383,747,'ru','Черный'),(1384,748,'en','Gray'),(1385,748,'ru','Серый'),(1386,749,'en','Sunset Grey'),(1387,749,'ru','Закатный серый'),(1388,750,'en','Winner Champagne'),(1389,750,'ru','Шампань'),(1390,751,'en','Black'),(1391,751,'ru','Черный'),(1392,752,'en','Zepp OS'),(1393,752,'ru','Zepp OS'),(1394,753,'en','Proprietary'),(1395,753,'ru','Proprietary'),(1396,754,'en','Proprietary'),(1397,754,'ru','Proprietary'),(1398,755,'en','watchOS'),(1399,755,'ru','watchOS'),(1400,756,'en','watchOS'),(1401,756,'ru','watchOS'),(1402,757,'en','watchOS'),(1403,757,'ru','watchOS'),(1404,758,'en','watchOS'),(1405,758,'ru','watchOS'),(1406,759,'en','watchOS'),(1407,759,'ru','watchOS'),(1408,760,'en','watchOS'),(1409,760,'ru','watchOS'),(1410,761,'en','watchOS'),(1411,761,'ru','watchOS'),(1412,762,'en','watchOS'),(1413,762,'ru','watchOS'),(1414,763,'en','Proprietary'),(1415,763,'ru','Proprietary'),(1416,764,'en','Proprietary'),(1417,764,'ru','Proprietary'),(1418,765,'en','Proprietary'),(1419,765,'ru','Proprietary'),(1420,766,'en','Proprietary'),(1421,766,'ru','Proprietary'),(1422,767,'en','Proprietary'),(1423,767,'ru','Proprietary'),(1424,768,'en','Proprietary'),(1425,768,'ru','Proprietary'),(1426,769,'en','Proprietary'),(1427,769,'ru','Proprietary'),(1428,770,'en','Proprietary'),(1429,770,'ru','Proprietary'),(1430,771,'en','HyperOS'),(1431,771,'ru','HyperOS'),(1432,772,'en','HyperOS'),(1433,772,'ru','HyperOS'),(1434,773,'en','HyperOS'),(1435,773,'ru','HyperOS'),(1436,774,'en','Proprietary'),(1437,774,'ru','Proprietary'),(1438,775,'en','Proprietary'),(1439,775,'ru','Proprietary'),(1440,776,'en','watchOS'),(1441,776,'ru','watchOS'),(1442,777,'en','Proprietary'),(1443,777,'ru','Proprietary'),(1444,778,'en','Proprietary'),(1445,778,'ru','Proprietary'),(1446,779,'en','Nothing OS (Wearable)'),(1447,779,'ru','Nothing OS (Wearable)'),(1450,781,'en','HyperOS'),(1451,781,'ru','HyperOS'),(1452,782,'en','Proprietary'),(1453,782,'ru','Proprietary'),(1454,783,'en','FreeRTOS'),(1455,783,'ru','FreeRTOS'),(1456,784,'en','Zepp OS'),(1457,784,'ru','Zepp OS'),(1458,785,'en','Zepp OS'),(1459,785,'ru','Zepp OS'),(1460,786,'en','Zepp OS'),(1461,786,'ru','Zepp OS'),(1462,787,'en','Zepp OS'),(1463,787,'ru','Zepp OS'),(1464,788,'en','Bip 5'),(1465,788,'ru','Bip 5'),(1466,789,'en','Bip 5'),(1467,789,'ru','Bip 5'),(1468,790,'en','Watch Elite S11'),(1469,790,'ru','Watch Elite S11'),(1470,791,'en','Series 11'),(1471,791,'ru','Series 11'),(1472,792,'en','SE 3'),(1473,792,'ru','SE 3'),(1474,793,'en','Ultra 3'),(1475,793,'ru','Ultra 3'),(1476,794,'en','Series 11'),(1477,794,'ru','Series 11'),(1478,795,'en','Series 11'),(1479,795,'ru','Series 11'),(1480,796,'en','SE 3'),(1481,796,'ru','SE 3'),(1482,797,'en','SE 3'),(1483,797,'ru','SE 3'),(1484,798,'en','SE 3'),(1485,798,'ru','SE 3'),(1486,799,'en','Series 11'),(1487,799,'ru','Series 11'),(1488,800,'en','Otto SW-86'),(1489,800,'ru','Otto SW-86'),(1490,801,'en','Otto SW-86'),(1491,801,'ru','Otto SW-86'),(1492,802,'en','Chatter SW-58'),(1493,802,'ru','Chatter SW-58'),(1494,803,'en','Maverick SW-83'),(1495,803,'ru','Maverick SW-83'),(1496,804,'en','Maverick SW-83'),(1497,804,'ru','Maverick SW-83'),(1498,805,'en','Jacky SW-69'),(1499,805,'ru','Jacky SW-69'),(1500,806,'en','Hexagon SW-88'),(1501,806,'ru','Hexagon SW-88'),(1502,807,'en','Jacky SW-69'),(1503,807,'ru','Jacky SW-69'),(1504,808,'en','Redmi Watch 5'),(1505,808,'ru','Redmi Watch 5'),(1506,809,'en','Redmi Watch 5'),(1507,809,'ru','Redmi Watch 5'),(1508,810,'en','Redmi Watch 5'),(1509,810,'ru','Redmi Watch 5'),(1510,811,'en','Choice 2i'),(1511,811,'ru','Choice 2i'),(1512,812,'en','BT11'),(1513,812,'ru','BT11'),(1514,813,'en','Series 11'),(1515,813,'ru','Series 11'),(1516,814,'en','SMARTW'),(1517,814,'ru','SMARTW'),(1518,815,'en','TrainerWide'),(1519,815,'ru','TrainerWide'),(1522,817,'en','Series 11'),(1523,817,'ru','Series 11'),(1524,818,'en','Redmi Watch 6'),(1525,818,'ru','Redmi Watch 6'),(1526,819,'en','TechLife Watch R100'),(1527,819,'ru','TechLife Watch R100'),(1528,820,'en','Galaxy Fit 3'),(1529,820,'ru','Galaxy Fit 3'),(1530,821,'en','Balance'),(1531,821,'ru','Balance'),(1532,822,'en','Cheetah'),(1533,822,'ru','Cheetah'),(1534,823,'en','Cheetah'),(1535,823,'ru','Cheetah'),(1536,824,'en','Bip 5'),(1537,824,'ru','Bip 5'),(1538,825,'en','Bip 5'),(1539,825,'ru','Bip 5'),(1540,826,'en','Watch Elite S11'),(1541,826,'ru','Watch Elite S11'),(1542,827,'en','Series 11'),(1543,827,'ru','Series 11'),(1544,828,'en','SE 3'),(1545,828,'ru','SE 3'),(1546,829,'en','Ultra 3'),(1547,829,'ru','Ultra 3'),(1548,830,'en','Series 11'),(1549,830,'ru','Series 11'),(1550,831,'en','Series 11'),(1551,831,'ru','Series 11'),(1552,832,'en','SE 3'),(1553,832,'ru','SE 3'),(1554,833,'en','SE 3'),(1555,833,'ru','SE 3'),(1556,834,'en','SE 3'),(1557,834,'ru','SE 3'),(1558,835,'en','Series 11'),(1559,835,'ru','Series 11'),(1560,836,'en','Otto SW-86'),(1561,836,'ru','Otto SW-86'),(1562,837,'en','Otto SW-86'),(1563,837,'ru','Otto SW-86'),(1564,838,'en','Chatter SW-58'),(1565,838,'ru','Chatter SW-58'),(1566,839,'en','Maverick SW-83'),(1567,839,'ru','Maverick SW-83'),(1568,840,'en','Maverick SW-83'),(1569,840,'ru','Maverick SW-83'),(1570,841,'en','Jacky SW-69'),(1571,841,'ru','Jacky SW-69'),(1572,842,'en','Hexagon SW-88'),(1573,842,'ru','Hexagon SW-88'),(1574,843,'en','Jacky SW-69'),(1575,843,'ru','Jacky SW-69'),(1576,844,'en','Redmi Watch 5'),(1577,844,'ru','Redmi Watch 5'),(1578,845,'en','Redmi Watch 5'),(1579,845,'ru','Redmi Watch 5'),(1580,846,'en','Redmi Watch 5'),(1581,846,'ru','Redmi Watch 5'),(1582,847,'en','Choice 2i'),(1583,847,'ru','Choice 2i'),(1584,848,'en','BT11'),(1585,848,'ru','BT11'),(1586,849,'en','Series 11'),(1587,849,'ru','Series 11'),(1588,850,'en','SMARTW'),(1589,850,'ru','SMARTW'),(1590,851,'en','TrainerWide'),(1591,851,'ru','TrainerWide'),(1594,853,'en','Series 11'),(1595,853,'ru','Series 11'),(1596,854,'en','Redmi Watch 6'),(1597,854,'ru','Redmi Watch 6'),(1598,855,'en','TechLife Watch R100'),(1599,855,'ru','TechLife Watch R100'),(1600,856,'en','Galaxy Fit 3'),(1601,856,'ru','Galaxy Fit 3'),(1602,857,'en','Balance'),(1603,857,'ru','Balance'),(1604,858,'en','Cheetah'),(1605,858,'ru','Cheetah'),(1606,859,'en','Cheetah'),(1607,859,'ru','Cheetah'),(1608,860,'en','Yes'),(1609,860,'ru','Да'),(1610,861,'en','Yes'),(1611,861,'ru','Да'),(1612,862,'en','No'),(1613,862,'ru','Нет'),(1614,863,'en','Yes'),(1615,863,'ru','Да'),(1616,864,'en','Yes'),(1617,864,'ru','Да'),(1618,865,'en','Yes'),(1619,865,'ru','Да'),(1620,866,'en','Yes'),(1621,866,'ru','Да'),(1622,867,'en','Yes'),(1623,867,'ru','Да'),(1624,868,'en','Yes'),(1625,868,'ru','Да'),(1626,869,'en','Yes'),(1627,869,'ru','Да'),(1628,870,'en','Yes'),(1629,870,'ru','Да'),(1630,871,'en','Yes'),(1631,871,'ru','Да'),(1632,872,'en','No'),(1633,872,'ru','Нет'),(1634,873,'en','No'),(1635,873,'ru','Нет'),(1636,874,'en','No'),(1637,874,'ru','Нет'),(1638,875,'en','No'),(1639,875,'ru','Нет'),(1640,876,'en','No'),(1641,876,'ru','Нет'),(1642,877,'en','No'),(1643,877,'ru','Нет'),(1644,878,'en','No'),(1645,878,'ru','Нет'),(1646,879,'en','No'),(1647,879,'ru','Нет'),(1648,880,'en','Yes'),(1649,880,'ru','Да'),(1650,881,'en','Yes'),(1651,881,'ru','Да'),(1652,882,'en','Yes'),(1653,882,'ru','Да'),(1654,883,'en','No'),(1655,883,'ru','Нет'),(1656,884,'en','No'),(1657,884,'ru','Нет'),(1658,885,'en','Yes'),(1659,885,'ru','Да'),(1660,886,'en','No'),(1661,886,'ru','Нет'),(1662,887,'en','No'),(1663,887,'ru','Нет'),(1666,889,'en','Yes'),(1667,889,'ru','Да'),(1668,890,'en','Yes'),(1669,890,'ru','Да'),(1670,891,'en','No'),(1671,891,'ru','Нет'),(1672,892,'en','No'),(1673,892,'ru','Нет'),(1674,893,'en','Yes'),(1675,893,'ru','Да'),(1676,894,'en','Yes'),(1677,894,'ru','Да'),(1678,895,'en','Yes'),(1679,895,'ru','Да'),(1680,896,'en','Yes'),(1681,896,'ru','Да'),(1682,897,'en','Yes'),(1683,897,'ru','Да'),(1684,898,'en','No'),(1685,898,'ru','Нет'),(1686,899,'en','Yes'),(1687,899,'ru','Да'),(1688,900,'en','Yes'),(1689,900,'ru','Да'),(1690,901,'en','Yes'),(1691,901,'ru','Да'),(1692,902,'en','Yes'),(1693,902,'ru','Да'),(1694,903,'en','Yes'),(1695,903,'ru','Да'),(1696,904,'en','Yes'),(1697,904,'ru','Да'),(1698,905,'en','Yes'),(1699,905,'ru','Да'),(1700,906,'en','Yes'),(1701,906,'ru','Да'),(1702,907,'en','Yes'),(1703,907,'ru','Да'),(1704,908,'en','No'),(1705,908,'ru','Нет'),(1706,909,'en','No'),(1707,909,'ru','Нет'),(1708,910,'en','No'),(1709,910,'ru','Нет'),(1710,911,'en','No'),(1711,911,'ru','Нет'),(1712,912,'en','No'),(1713,912,'ru','Нет'),(1714,913,'en','No'),(1715,913,'ru','Нет'),(1716,914,'en','No'),(1717,914,'ru','Нет'),(1718,915,'en','No'),(1719,915,'ru','Нет'),(1720,916,'en','Yes'),(1721,916,'ru','Да'),(1722,917,'en','Yes'),(1723,917,'ru','Да'),(1724,918,'en','Yes'),(1725,918,'ru','Да'),(1726,919,'en','No'),(1727,919,'ru','Нет'),(1728,920,'en','No'),(1729,920,'ru','Нет'),(1730,921,'en','Yes'),(1731,921,'ru','Да'),(1732,922,'en','No'),(1733,922,'ru','Нет'),(1734,923,'en','No'),(1735,923,'ru','Нет'),(1738,925,'en','Yes'),(1739,925,'ru','Да'),(1740,926,'en','Yes'),(1741,926,'ru','Да'),(1742,927,'en','No'),(1743,927,'ru','Нет'),(1744,928,'en','No'),(1745,928,'ru','Нет'),(1746,929,'en','Yes'),(1747,929,'ru','Да'),(1748,930,'en','Yes'),(1749,930,'ru','Да'),(1750,931,'en','Yes'),(1751,931,'ru','Да'),(1752,932,'en','SM-S948BZKQCAU'),(1753,932,'ru','SM-S948BZKQCAU'),(1797,933,'en','SM-S948B'),(1798,933,'ru','SM-S948B'),(1799,934,'en','A3287 / MYEE3PX/A'),(1800,934,'ru','A3287 / MYED3PX/A'),(1801,935,'en','SM-S931B'),(1802,935,'ru','SM-S931B'),(1803,936,'en','X6881'),(1804,936,'ru','X6881'),(1805,937,'en','SM-A075F/DS'),(1806,937,'ru','SM-A075F/DS'),(1807,938,'en','SM-A175F'),(1808,938,'ru','SM-A175F'),(1809,939,'en','A3500'),(1810,939,'ru','A3500'),(1811,940,'en','WDN-LX2'),(1812,940,'ru','WDN-LX2'),(1813,941,'en','CPH2699'),(1814,941,'ru','CPH2699'),(1815,942,'en','BRC-LX1'),(1816,942,'ru','BRC-LX1'),(1817,943,'en','BRC-LX1'),(1818,943,'ru','BRC-LX1'),(1819,944,'en','X-Style 31 Power'),(1820,944,'ru','X-Style 31 Power'),(1821,945,'en','Pixel 10'),(1822,945,'ru','Pixel 10'),(1823,946,'en','CPH2715'),(1824,946,'ru','CPH2685'),(1825,947,'en','5109CEJS / LLY-LX1'),(1826,947,'ru','5109CEJR / LLY-LX1'),(1827,948,'en','iPhone 17e'),(1828,948,'ru','iPhone 17e'),(1829,949,'en','SM-A376E/DS'),(1830,949,'ru','SM-A376E/DS'),(1831,950,'en','PJP110 / CPH2739'),(1832,950,'ru','PJP110 / CPH2739'),(1833,951,'en','ELP-AN00 / ELP-N21'),(1834,951,'ru','LNP-AN00 / LNP-N21'),(1835,952,'en','Pixel 10a'),(1836,952,'ru','Pixel 10a'),(1837,953,'en','A065'),(1838,953,'ru','A065'),(1839,954,'en','A065'),(1840,954,'ru','A065'),(1841,955,'en','24103RN82G'),(1842,955,'ru','24103RN82G'),(1843,956,'en','SM-S948B'),(1844,956,'ru','SM-S948B'),(1845,957,'en','A3287 / MYED3PX/A'),(1846,957,'ru','A3287 / MYED3PX/A'),(1847,958,'en','SM-S931B'),(1848,958,'ru','SM-S931B'),(1849,959,'en','X6881'),(1850,959,'ru','X6881'),(1851,960,'en','SM-A075F/DS'),(1852,960,'ru','SM-A075F/DS'),(1853,961,'en','SM-A175F'),(1854,961,'ru','SM-A175F'),(1855,962,'en','A3500'),(1856,962,'ru','A3500'),(1857,963,'en','WDN-LX2'),(1858,963,'ru','WDN-LX2'),(1859,964,'en','CPH2699'),(1860,964,'ru','CPH2699'),(1861,965,'en','A059'),(1862,965,'ru','A059'),(1863,966,'en','BRC-LX1'),(1864,966,'ru','BRC-LX1BRC-LX1'),(1865,967,'en','C61 Pro'),(1866,967,'ru','C61 Pro'),(1867,968,'en','Pixel 10'),(1868,968,'ru','Pixel 10'),(1869,969,'en','CPH2685'),(1870,969,'ru','CPH2685'),(1871,970,'en','5109CEJR / LLY-LX1'),(1872,970,'ru','5109CEJR / LLY-LX1'),(1873,971,'en','Pixel 10'),(1874,971,'ru','Pixel 10'),(1875,972,'en','SM-A376E/DS'),(1876,972,'ru','SM-A376E/DS'),(1877,973,'en','CPH2745'),(1878,973,'ru','CPH2745'),(1879,974,'en','LNP-AN00 / LNP-N21'),(1880,974,'ru','LNP-AN00 / LNP-N21'),(1881,975,'en','Pixel 10a'),(1882,975,'ru','Pixel 10a'),(1883,976,'en','Nano-SIM + eSIM (Global) / Dual eSIM (US)'),(1884,976,'ru','Nano-SIM + eSIM (Глобальная) / Dual eSIM (США)'),(1885,977,'en','Nano-SIM + eSIM (Global) / Dual eSIM (US)'),(1886,977,'ru','Nano-SIM + eSIM (Глобальная) / Dual eSIM (США)'),(1887,978,'en','Nano-SIM + eSIM (Global) / Dual eSIM (US)'),(1888,978,'ru','Nano-SIM + eSIM (Глобальная) / Dual eSIM (США)'),(1889,979,'en','Nano-SIM + eSIM (Global) / Dual eSIM (US)'),(1890,979,'ru','Nano-SIM + eSIM (Глобальная) / Dual eSIM (США)'),(1891,980,'en','Nano-SIM + eSIM (Global) / Dual eSIM (US)'),(1892,980,'ru','Nano-SIM + eSIM (Глобальная) / Dual eSIM (США)'),(1893,981,'en','Nano-SIM + eSIM (Global) / Dual eSIM (US)'),(1894,981,'ru','Nano-SIM + eSIM (Глобальная) / Dual eSIM (США)'),(1895,982,'en','Dual Nano-SIM'),(1896,982,'ru','Две Nano-SIM'),(1897,983,'en','Dual Nano-SIM'),(1898,983,'ru','Две Nano-SIM'),(1899,984,'en','Dual Nano-SIM'),(1900,984,'ru','Две Nano-SIM'),(1901,985,'en','Dual Nano-SIM'),(1902,985,'ru','Две Nano-SIM'),(1903,986,'en','Dual Nano-SIM'),(1904,986,'ru','Две Nano-SIM'),(1905,987,'en','Dual Nano-SIM'),(1906,987,'ru','Две Nano-SIM'),(1907,988,'en','Dual Nano-SIM'),(1908,988,'ru','Две Nano-SIM'),(1909,989,'en','Nano-SIM + eSIM (Global) / Dual eSIM (US)'),(1910,989,'ru','Nano-SIM + eSIM (Глобальная) / Dual eSIM (США)'),(1911,990,'en','Nano-SIM + eSIM (Global) / Dual eSIM (US)'),(1912,990,'ru','Nano-SIM + eSIM (Глобальная) / Dual eSIM (США)'),(1913,991,'en','Dual Nano-SIM'),(1914,991,'ru','Две Nano-SIM'),(1915,992,'en','Dual Nano-SIM'),(1916,992,'ru','Две Nano-SIM'),(1917,993,'en','Dual Nano-SIM'),(1918,993,'ru','Две Nano-SIM'),(1919,994,'en','Dual Nano-SIM'),(1920,994,'ru','Две Nano-SIM'),(1921,995,'en','Dual Nano-SIM'),(1922,995,'ru','Две Nano-SIM'),(1923,996,'en','Dual Nano-SIM'),(1924,996,'ru','Две Nano-SIM'),(1925,997,'en','Dual Nano-SIM'),(1926,997,'ru','Две Nano-SIM'),(1927,998,'en','Dual SIM (Standard/Mini-SIM + Micro-SIM)'),(1928,998,'ru','Две SIM (Standard/Mini-SIM + Micro-SIM)'),(1929,999,'en','Dual Nano-SIM'),(1930,999,'ru','Две Nano-SIM'),(1931,1000,'en','Nano-SIM + eSIM (Dual SIM)'),(1932,1000,'ru','Nano-SIM + eSIM (Две SIM)'),(1933,1001,'en','Nano-SIM + eSIM (Dual SIM)'),(1934,1001,'ru','Nano-SIM + eSIM (Две SIM)'),(1935,1002,'en','Dual Nano-SIM'),(1936,1002,'ru','Две Nano-SIM'),(1937,1003,'en','Dual Nano-SIM'),(1938,1003,'ru','Две Nano-SIM'),(1939,1004,'en','Dual Nano-SIM'),(1940,1004,'ru','Две Nano-SIM'),(1941,1005,'en','Dual Nano-SIM'),(1942,1005,'ru','Две Nano-SIM'),(1943,1006,'en','Nano-SIM + eSIM (Global) / Dual eSIM (US)'),(1944,1006,'ru','Nano-SIM + eSIM (Глобальная) / Dual eSIM (США)'),(1945,1007,'en','Nano-SIM + eSIM (Dual SIM)'),(1946,1007,'ru','Nano-SIM + eSIM (Две SIM)'),(1947,1008,'en','Dual Nano-SIM / Nano-SIM + eSIM'),(1948,1008,'ru','Две Nano-SIM / Nano-SIM + eSIM'),(1949,1009,'en','Dual Nano-SIM / Nano-SIM + eSIM'),(1950,1009,'ru','Две Nano-SIM / Nano-SIM + eSIM'),(1951,1010,'en','Dual Nano-SIM'),(1952,1010,'ru','Две Nano-SIM'),(1953,1011,'en','Dual Nano-SIM'),(1954,1011,'ru','Две Nano-SIM'),(1955,1012,'en','Dual Nano-SIM'),(1956,1012,'ru','Две Nano-SIM'),(1957,1013,'en','Dual Nano-SIM'),(1958,1013,'ru','Две Nano-SIM'),(1959,1014,'en','Nano-SIM + eSIM (Dual SIM)'),(1960,1014,'ru','Nano-SIM + eSIM (Две SIM)'),(1961,1015,'en','Nano-SIM + eSIM (Dual SIM)'),(1962,1015,'ru','Nano-SIM + eSIM (Две SIM)'),(1963,1016,'en','Dual Nano-SIM'),(1964,1016,'ru','Две Nano-SIM'),(1965,1017,'en','Dual Nano-SIM'),(1966,1017,'ru','Две Nano-SIM'),(1967,1018,'en','Dual Nano-SIM'),(1968,1018,'ru','Две Nano-SIM'),(1969,1019,'en','Dual Nano-SIM'),(1970,1019,'ru','Две Nano-SIM');
/*!40000 ALTER TABLE `product_attribute_values_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_branches`
--

DROP TABLE IF EXISTS `product_branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_branches` (
  `product_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 0,
  PRIMARY KEY (`product_id`,`branch_id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `product_branches_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_branches_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_branches`
--

LOCK TABLES `product_branches` WRITE;
/*!40000 ALTER TABLE `product_branches` DISABLE KEYS */;
INSERT INTO `product_branches` VALUES (1,1,12),(1,3,14),(1,5,3);
/*!40000 ALTER TABLE `product_branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_categories` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_categories_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_categories_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES (1,17),(2,17),(35,17),(36,17),(37,17),(38,17),(43,17),(44,17),(51,17),(52,17),(53,17),(76,17),(77,17),(79,17),(81,17),(99,17),(100,17),(102,17),(103,17),(104,17),(105,17),(106,17),(121,17),(128,17),(132,17),(133,17),(144,17),(145,17),(146,17),(147,17),(149,17),(151,17),(153,17),(154,17),(164,17),(165,17),(168,17),(178,17),(180,17),(181,17),(182,17),(183,17),(184,17),(185,17),(186,17);
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image_url` varchar(500) NOT NULL,
  `is_main` tinyint(1) DEFAULT 0,
  `sort_order` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_product_images_products` (`product_id`),
  CONSTRAINT `fk_product_images_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_translations`
--

DROP TABLE IF EXISTS `product_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `locale` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `short_description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_translations_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_translations`
--

LOCK TABLES `product_translations` WRITE;
/*!40000 ALTER TABLE `product_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `specifications` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`specifications`)),
  `description` text DEFAULT NULL,
  `short_description` varchar(500) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount_price` decimal(10,2) DEFAULT NULL,
  `image` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `images_gallery` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `views` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `stock` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `fk_product_category` (`category_id`),
  KEY `brand_id` (`brand_id`),
  CONSTRAINT `fk_product_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=610 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Samsung S948B Galaxy S26 Ultra 12GB/256GB 5G Black',17,'samsung-s948b-galaxy-s26-ultra-12gb-256gb-5g-black',1,NULL,NULL,'phone',3899.00,3349.00,'products/samsung-s26-ultra-black-256.webp',NULL,1,0,'2026-07-21 15:41:48','2026-08-03 10:53:02',100),(2,'Samsung S948B Galaxy S26 Ultra 16GB/1TB 5G Black',17,'samsung-s948b-galaxy-s26-ultra-16gb-1tb-5g-black',1,NULL,NULL,'phone',5399.00,4849.00,'products/samsung-s26-ultra-black-1tb.webp',NULL,1,0,'2026-07-21 15:41:48','2026-08-03 10:53:02',100),(35,'Apple iPhone 16 128GB - Ultramarine',17,'apple-iphone-16-128gb-ultramarine',2,NULL,NULL,'phone',2619.00,2539.00,'products/iphone-16-ultramarine-128.webp',NULL,1,0,'2026-07-21 15:46:03','2026-08-03 10:53:02',100),(36,'Apple iPhone 16 128GB - Teal',17,'apple-iphone-16-128gb-teal',2,NULL,NULL,'phone',2619.00,2539.00,'products/iphone-16-teal-128.webp',NULL,1,0,'2026-07-21 15:46:03','2026-08-03 10:53:02',100),(37,'Samsung S931B Galaxy S25 12GB/128GB 5G Navy',17,'samsung-s931b-galaxy-s25-12gb-128gb-5g-navy',1,NULL,NULL,'phone',2199.00,2049.00,'products/samsung-s25-navy-128.webp',NULL,1,0,'2026-07-21 15:46:03','2026-08-03 10:53:02',100),(38,'Samsung S931B Galaxy S25 12GB/128GB 5G Icy Blue',17,'samsung-s931b-galaxy-s25-12gb-128gb-5g-icy-blue',1,NULL,NULL,'phone',2199.00,2049.00,'products/samsung-s25-icy-blue-128.webp',NULL,1,0,'2026-07-21 15:46:03','2026-08-03 10:53:02',100),(43,'Infinix Hot 50i 4GB/128GB Black',17,'infinix-hot-50i-4gb-128gb-black',22,NULL,NULL,'phone',319.00,319.00,'products/infinix-hot-50i-black-128.webp',NULL,1,0,'2026-07-21 15:46:53','2026-08-03 10:53:02',100),(44,'Infinix Hot 50 Pro 8GB/256GB Black',17,'infinix-hot-50-pro-8gb-256gb-black',22,NULL,NULL,'phone',539.00,419.00,'products/infinix-hot-50-pro-black-256.webp',NULL,1,0,'2026-07-21 15:46:53','2026-08-03 10:53:02',100),(51,'Oukitel G5 4GB/64GB Black',17,'oukitel-g5-4gb-64gb-black',24,NULL,NULL,'phone',599.00,599.00,'products/oukitel-g5-black-64.webp',NULL,1,0,'2026-07-21 15:48:07','2026-08-03 10:53:02',100),(52,'Samsung A075F Galaxy A07 6GB/128GB LTE Duo Green',17,'samsung-a075f-galaxy-a07-6gb-128gb-lte-duo-green',1,NULL,NULL,'phone',389.00,389.00,'products/samsung-a07-green-128-6gb.webp',NULL,1,0,'2026-07-21 15:48:07','2026-08-03 10:53:02',100),(53,'Samsung A075F Galaxy A07 4GB/128GB LTE Duo Silver',17,'samsung-a075f-galaxy-a07-4gb-128gb-lte-duo-silver',1,NULL,NULL,'phone',349.00,349.00,'products/samsung-a07-silver-128.webp',NULL,1,0,'2026-07-21 15:48:07','2026-08-03 10:53:02',100),(76,'Samsung A175F Galaxy A17 4GB/128GB LTE Blue',17,'samsung-a175f-galaxy-a17-4gb-128gb-lte-blue',1,NULL,NULL,'phone',489.00,489.00,'products/samsung-a17-blue-128-4gb.webp',NULL,1,0,'2026-07-21 15:49:57','2026-08-03 10:53:02',100),(77,'Samsung A175F Galaxy A17 4GB/128GB LTE Silver',17,'samsung-a175f-galaxy-a17-4gb-128gb-lte-silver',1,NULL,NULL,'phone',489.00,489.00,'products/samsung-a17-silver-128-4gb.webp',NULL,1,0,'2026-07-21 15:50:57','2026-08-03 10:53:02',100),(79,'Apple iPhone 17 (8GB/256GB) - Black',17,'apple-iphone-17-8gb-256gb-black',2,NULL,NULL,'phone',2999.00,2899.00,'products/iphone-17-black-256.webp',NULL,1,0,'2026-07-21 15:50:57','2026-08-03 10:53:02',100),(81,'Apple iPhone 17 (8GB/256GB) - Mist Blue',17,'apple-iphone-17-8gb-256gb-mist-blue',2,NULL,NULL,'phone',2999.00,2899.00,'products/iphone-17-mist-blue-256.webp',NULL,1,0,'2026-07-21 15:50:57','2026-08-03 10:53:02',100),(99,'Honor X5c 4GB/128GB Dual Sim Midnight Black',17,'honor-x5c-4gb-128gb-dual-sim-midnight-black',8,NULL,NULL,'phone',329.00,329.00,'products/honor-x5c-midnight-black-128.webp',NULL,1,0,'2026-07-21 15:51:39','2026-08-03 10:53:02',100),(100,'Honor X5c 4GB/128GB Dual Sim Meteor Silver',17,'honor-x5c-4gb-128gb-dual-sim-meteor-silver',8,NULL,NULL,'phone',329.00,329.00,'products/honor-x5c-meteor-silver-128.webp',NULL,1,0,'2026-07-21 15:51:39','2026-08-03 10:53:02',100),(102,'OPPO Reno 14F 12GB/256GB Opal Blue',17,'oppo-reno-14f-12gb-256gb-opal-blue',25,NULL,NULL,'phone',1349.00,999.00,'products/oppo-reno-14f-opal-blue-256.webp',NULL,1,0,'2026-07-21 15:52:16','2026-08-03 10:53:02',100),(103,'OPPO Reno 14F 12GB/256GB Luminous Green',17,'oppo-reno-14f-12gb-256gb-luminous-green',25,NULL,NULL,'phone',1349.00,999.00,'products/oppo-reno-14f-luminous-green-256.webp',NULL,1,0,'2026-07-21 15:52:16','2026-08-03 10:53:02',100),(104,'Nothing Phone 3 12GB/256GB Black',17,'nothing-phone-3-12gb-256gb-black',27,NULL,NULL,'phone',2299.00,2299.00,'products/nothing-phone-3-black-256.webp',NULL,1,0,'2026-07-21 15:52:16','2026-08-03 10:53:02',100),(105,'Honor X9d 8GB/256GB Midnight Black',17,'honor-x9d-8gb-256gb-midnight-black',8,NULL,NULL,'phone',1099.00,999.00,'products/honor-x9d-midnight-black-256-8gb.webp',NULL,1,0,'2026-07-21 15:52:16','2026-08-03 10:53:02',100),(106,'Honor X9d 12GB/256GB Midnight Black',17,'honor-x9d-12gb-256gb-midnight-black',8,NULL,NULL,'phone',1299.00,1099.00,'products/honor-x9d-midnight-black-256-12gb.webp',NULL,1,0,'2026-07-21 15:52:16','2026-08-03 10:53:02',100),(121,'SIGMA MOBILE X-Style 31 Power Red',17,'sigma-mobile-x-style-31-power-red',61,NULL,NULL,'phone',99.00,99.00,'products/sigma-mobile-x-style-31-power-red.webp',NULL,1,0,'2026-07-21 15:54:08','2026-08-03 10:53:02',100),(128,'Oukitel C61 Pro 8GB/256GB - Blue',17,'oukitel-c61-pro-8gb-256gb-blue',24,NULL,NULL,'phone',559.00,559.00,'products/oukitel-c61-pro-blue-256.webp',NULL,1,0,'2026-07-21 15:55:03','2026-08-03 10:53:02',100),(132,'Google Pixel 10 12GB/128GB Obsidian',17,'google-pixel-10-12gb-128gb-obsidian',26,NULL,NULL,'phone',2199.00,1999.00,'products/google-pixel-10-obsidian-128.webp',NULL,1,0,'2026-07-21 15:55:03','2026-08-03 10:53:02',100),(133,'Google Pixel 10 12GB/128GB Frost',17,'google-pixel-10-12gb-128gb-frost',26,NULL,NULL,'phone',2199.00,1999.00,'products/google-pixel-10-frost-128.webp',NULL,1,0,'2026-07-21 15:55:03','2026-08-03 10:53:02',100),(144,'OPPO Reno 15 12GB/512GB 5G Aurora White',17,'oppo-reno-15-12gb-512gb-5g-aurora-white',25,NULL,NULL,'phone',1699.00,1699.00,'products/oppo-reno-15-aurora-white-512.webp',NULL,1,0,'2026-07-21 15:56:14','2026-08-03 10:53:02',100),(145,'OPPO A6x 4GB/64GB Ice Blue',17,'oppo-a6x-4gb-64gb-ice-blue',25,NULL,NULL,'phone',349.00,299.00,'products/oppo-a6x-ice-blue-64.webp',NULL,1,0,'2026-07-21 15:56:14','2026-08-03 10:53:02',100),(146,'Honor 600 Lite 5109CEJS 8GB/256GB Dual Sim Gold',17,'honor-600-lite-5109cejs-8gb-256gb-dual-sim-gold',8,NULL,NULL,'phone',1099.00,1099.00,'products/honor-600-lite-gold-256.webp',NULL,1,0,'2026-07-21 15:56:14','2026-08-03 10:53:02',100),(147,'Honor 600 Lite 5109CEJR 8GB/256GB Dual Sim Green',17,'honor-600-lite-5109cejr-8gb-256gb-dual-sim-green',8,NULL,NULL,'phone',1099.00,1099.00,'products/honor-600-lite-green-256.webp',NULL,1,0,'2026-07-21 15:56:14','2026-08-03 10:53:02',100),(149,'Apple iPhone 17e 256GB Soft Pink',17,'apple-iphone-17e-256gb-soft-pink',2,NULL,NULL,'phone',2269.00,2179.00,'products/iphone-17e-soft-pink-256.webp',NULL,1,0,'2026-07-21 15:57:11','2026-08-03 10:53:02',100),(151,'Google Pixel 10 12GB/128GB Indigo',17,'google-pixel-10-12gb-128gb-indigo',26,NULL,NULL,'phone',2199.00,1999.00,'products/google-pixel-10-indigo-128.webp',NULL,1,0,'2026-07-21 15:57:11','2026-08-03 10:53:02',100),(153,'Samsung A376E Galaxy A37 5G 8GB/128GB Duo Black',17,'samsung-a376e-galaxy-a37-5g-8gb-128gb-duo-black',1,NULL,NULL,'phone',1079.00,929.00,'products/samsung-a37-black-128.webp',NULL,1,0,'2026-07-21 15:57:11','2026-08-03 10:53:02',100),(154,'Samsung A376E Galaxy A37 5G 8GB/128GB Duo Violet',17,'samsung-a376e-galaxy-a37-5g-8gb-128gb-duo-violet',1,NULL,NULL,'phone',1079.00,929.00,'products/samsung-a37-violet-128.webp',NULL,1,0,'2026-07-21 15:57:11','2026-08-03 10:53:02',100),(164,'OnePlus 15 12GB/256GB Infinite Black',17,'oneplus-15-12gb-256gb-infinite-black',23,NULL,NULL,'phone',2699.00,2699.00,'products/oneplus-15-infinite-black-256.webp',NULL,1,0,'2026-07-21 15:57:52','2026-08-03 10:53:02',100),(165,'OnePlus 15R 12GB/512GB Charcoal Black',17,'oneplus-15r-12gb-512gb-charcoal-black',23,NULL,NULL,'phone',1799.00,1799.00,'products/oneplus-15r-charcoal-black-512.webp',NULL,1,0,'2026-07-21 15:57:52','2026-08-03 10:53:02',100),(168,'Honor 600 8GB/512GB Dual Black',17,'honor-600-8gb-512gb-dual-black',8,NULL,NULL,'phone',1849.00,1849.00,'products/honor-600-black-512-8gb.webp',NULL,1,0,'2026-07-21 15:57:52','2026-08-03 10:53:02',100),(178,'Honor 600 Pro 12GB/512GB Dual Orange',17,'honor-600-pro-12gb-512gb-dual-orange',8,NULL,NULL,'phone',2799.00,2799.00,'products/honor-600-pro-orange-512.webp',NULL,1,0,'2026-07-21 15:58:33','2026-08-03 10:53:02',100),(180,'Google Pixel 10a 8GB/128GB Lavender',17,'google-pixel-10a-8gb-128gb-lavender',26,NULL,NULL,'phone',1799.00,1579.00,'products/google-pixel-10a-lavender-128.webp',NULL,1,0,'2026-07-21 15:58:33','2026-08-03 10:53:02',100),(181,'Google Pixel 10a 8GB/128GB Obsidian',17,'google-pixel-10a-8gb-128gb-obsidian',26,NULL,NULL,'phone',1799.00,1579.00,'products/google-pixel-10a-obsidian-128.webp',NULL,1,0,'2026-07-21 15:58:33','2026-08-03 10:53:02',100),(182,'Nothing Phone 4A 12GB/256GB Black',17,'nothing-phone-4a-12gb-256gb-black',27,NULL,NULL,'phone',1449.00,1449.00,'products/nothing-phone-4a-black-256.webp',NULL,1,0,'2026-07-21 15:58:33','2026-08-03 10:53:02',100),(183,'Nothing Phone 4A 8GB/128GB White',17,'nothing-phone-4a-8gb-128gb-white',27,NULL,NULL,'phone',1149.00,1149.00,'products/nothing-phone-4a-white-128.webp',NULL,1,0,'2026-07-21 15:58:33','2026-08-03 10:53:02',100),(184,'Nothing Phone 4A 8GB/128GB Black',17,'nothing-phone-4a-8gb-128gb-black',27,NULL,NULL,'phone',1149.00,1149.00,'products/nothing-phone-4a-black-128.webp',NULL,1,0,'2026-07-21 15:58:33','2026-08-03 10:53:02',100),(185,'Xiaomi Redmi 15C 4GB/128GB Without NFC Black',17,'xiaomi-redmi-15c-4gb-128gb-without-nfc-black',17,NULL,NULL,'phone',369.00,369.00,'products/xiaomi-redmi-15c-black-128.webp',NULL,1,0,'2026-07-21 16:00:05','2026-08-03 10:53:02',100),(186,'Xiaomi Redmi 15C 4GB/128GB Without NFC Blue',17,'xiaomi-redmi-15c-4gb-128gb-without-nfc-blue',17,NULL,NULL,'phone',369.00,369.00,'products/xiaomi-redmi-15c-blue-128.webp',NULL,1,0,'2026-07-21 16:00:05','2026-08-03 10:53:02',100),(202,'Amazfit Bip 5 Soft Black',18,'amazfit-bip-5-soft-black',53,NULL,NULL,'Smart Watch',279.00,189.00,'products/amazfit-bip-5-soft-black.webp',NULL,1,0,'2026-07-30 06:40:33','2026-08-03 10:52:48',100),(203,'Amazfit Bip 5 Cream White',18,'amazfit-bip-5-cream-white',53,NULL,NULL,'Smart Watch',279.00,189.00,'products/amazfit-bip-5-cream-white.webp',NULL,1,0,'2026-07-30 06:40:33','2026-08-03 10:52:48',100),(204,'QCY Watch Elite S11 Rose Gold',18,'qcy-watch-elite-s11-rose-gold',48,NULL,NULL,'Smart Watch',139.00,89.00,'products/qcy-watch-elite-s11-rose-gold.webp',NULL,1,0,'2026-07-30 06:40:33','2026-08-03 10:52:48',100),(205,'Apple Watch Series 11 GPS 46mm Space Grey Aluminium',18,'apple-watch-series-11-gps-46mm-space-grey-aluminiumm',2,NULL,NULL,'Smart Watch',1299.00,1299.00,'products/apple-watch-series-11-gps-46mm-space-grey.webp',NULL,1,0,'2026-07-30 06:40:33','2026-08-05 10:24:27',100),(206,'Apple Watch SE 3 GPS 40mm Starlight Aluminium',18,'apple-watch-se-3-gps-40mm-starlight-aluminium',2,NULL,NULL,'Smart Watch',819.00,819.00,'products/apple-watch-se-3-gps-40mm-starlight.webp',NULL,1,0,'2026-07-30 06:40:33','2026-08-03 10:52:48',100),(207,'Apple Watch Ultra 3 GPS + Cellular 49mm Black Titanium',18,'apple-watch-ultra-3-gps-cellular-49mm-black-titanium',2,NULL,NULL,'Smart Watch',2899.00,2699.00,'products/apple-watch-ultra-3-gps-cellular-49mm-black.webp',NULL,1,0,'2026-07-30 06:40:33','2026-08-03 10:52:48',100),(208,'Apple Watch Series 11 GPS 46mm Jet Black Aluminium',18,'apple-watch-series-11-gps-46mm-jet-black-aluminium',2,NULL,NULL,'Smart Watch',1299.00,1299.00,'products/apple-watch-series-11-gps-46mm-jet-black.webp',NULL,1,0,'2026-07-30 06:40:33','2026-08-03 10:52:48',100),(209,'Apple Watch Series 11 GPS 46mm Jet Black Sport Band',18,'apple-watch-series-11-gps-46mm-jet-black-sport-band',2,NULL,NULL,'Smart Watch',1299.00,1299.00,'products/apple-watch-series-11-gps-46mm-jet-black-band.webp',NULL,1,0,'2026-07-30 06:40:33','2026-08-03 10:52:48',100),(210,'Apple Watch SE 3 GPS 40mm Starlight Aluminium Sport Loop',18,'apple-watch-se-3-gps-40mm-starlight-aluminium-sport-loop',2,NULL,NULL,'Smart Watch',819.00,819.00,'products/apple-watch-se-3-gps-40mm-starlight-loop.webp',NULL,1,0,'2026-07-30 06:40:33','2026-08-03 10:52:48',100),(211,'Apple Watch SE 3 GPS 44mm Midnight Aluminium',18,'apple-watch-se-3-gps-44mm-midnight-aluminium',2,NULL,NULL,'Smart Watch',929.00,929.00,'products/apple-watch-se-3-gps-44mm-midnight.webp',NULL,1,0,'2026-07-30 06:40:33','2026-08-03 10:52:48',100),(212,'Apple Watch SE 3 GPS 44mm Midnight Aluminium Sport Band',18,'apple-watch-se-3-gps-44mm-midnight-aluminium-sport-band',2,NULL,NULL,'Smart Watch',929.00,929.00,'products/apple-watch-se-3-gps-44mm-midnight-band.webp',NULL,1,0,'2026-07-30 06:40:33','2026-08-03 10:52:48',100),(213,'Apple Watch Series 11 GPS 42mm Jet Black Aluminium',18,'apple-watch-series-11-gps-42mm-jet-black-aluminium',2,NULL,NULL,'Smart Watch',1199.00,1199.00,'products/apple-watch-series-11-gps-42mm-jet-black.webp',NULL,1,0,'2026-07-30 06:40:33','2026-08-03 10:52:48',100),(214,'Canyon Otto SW-86 Silver',18,'canyon-otto-sw-86-silver',29,NULL,NULL,'Smart Watch',199.00,129.00,'products/canyon-otto-sw-86-silver.webp',NULL,1,0,'2026-07-30 06:41:59','2026-08-03 10:52:48',100),(215,'Canyon Otto SW-86 Red',18,'canyon-otto-sw-86-red',29,NULL,NULL,'Smart Watch',199.00,129.00,'products/canyon-otto-sw-86-red.webp',NULL,1,0,'2026-07-30 06:41:59','2026-08-03 10:52:48',100),(216,'Canyon Chatter SW-58 BT-CALL Black Green',18,'canyon-chatter-sw-58-bt-call-black-green',29,NULL,NULL,'Smart Watch',159.00,99.00,'products/canyon-chatter-sw-58-black-green.webp',NULL,1,0,'2026-07-30 06:41:59','2026-08-03 10:52:48',100),(217,'Canyon Maverick SW-83 GPS Black',18,'canyon-maverick-sw-83-gps-black',29,NULL,NULL,'Smart Watch',249.00,149.00,'products/canyon-maverick-sw-83-gps-black.webp',NULL,1,0,'2026-07-30 06:41:59','2026-08-03 10:52:48',100),(218,'Canyon Maverick SW-83 GPS Silver',18,'canyon-maverick-sw-83-gps-silver',29,NULL,NULL,'Smart Watch',249.00,149.00,'products/canyon-maverick-sw-83-gps-silver.webp',NULL,1,0,'2026-07-30 06:41:59','2026-08-03 10:52:48',100),(219,'Canyon Jacky SW-69 Blue Yellow',18,'canyon-jacky-sw-69-blue-yellow',29,NULL,NULL,'Smart Watch',189.00,99.00,'products/canyon-jacky-sw-69-blue-yellow.webp',NULL,1,0,'2026-07-30 06:41:59','2026-08-03 10:52:48',100),(220,'CANYON Smart Watch Hexagon SW-88 BT-CALL Silver',18,'canyon-smart-watch-hexagon-sw-88-bt-call-silver',29,NULL,NULL,'Smart Watch',259.00,119.00,'products/canyon-hexagon-sw-88-silver.webp',NULL,1,0,'2026-07-30 06:41:59','2026-08-03 10:52:48',100),(221,'Canyon Jacky SW-69 Green Orange',18,'canyon-jacky-sw-69-green-orange',29,NULL,NULL,'Smart Watch',189.00,99.00,'products/canyon-jacky-sw-69-green-orange.webp',NULL,1,0,'2026-07-30 06:41:59','2026-08-03 10:52:48',100),(222,'Xiaomi Redmi Watch 5 Obsidian Black',18,'xiaomi-redmi-watch-5-obsidian-black',17,NULL,NULL,'Smart Watch',279.00,279.00,'products/xiaomi-redmi-watch-5-obsidian-black.webp',NULL,1,0,'2026-07-30 06:41:59','2026-08-03 10:52:48',100),(223,'Xiaomi Redmi Watch 5 Silver Gray (BHR9381GL)',18,'xiaomi-redmi-watch-5-silver-gray-bhr9381glf',17,NULL,NULL,'Smart Watch',259.00,259.00,'products/xiaomi-redmi-watch-5-silver-gray.webp',NULL,1,0,'2026-07-30 06:41:59','2026-08-05 10:23:11',100),(224,'Xiaomi Redmi Watch 5 Lavender Purple',18,'xiaomi-redmi-watch-5-lavender-purpled',17,NULL,NULL,'Smart Watch',259.00,259.00,'products/xiaomi-redmi-watch-5-lavender-purple.webp',NULL,1,0,'2026-07-30 06:41:59','2026-08-05 10:23:44',100),(225,'Honor Choice 2i (5504ACGM) Black',18,'honor-choice-2i-5504acgm-blackd',8,NULL,NULL,'Smart Watch',159.00,159.00,'products/honor-choice-2i-black.webp',NULL,1,0,'2026-07-30 06:41:59','2026-08-05 10:24:08',100),(298,'OUKITEL BT11 Smart Watch Black',18,'oukitel-bt11-smart-watch-black',24,NULL,NULL,'Smart Watch',179.00,179.00,'products/oukitel-bt11-smart-watch-black.webp',NULL,1,0,'2026-07-30 06:45:12','2026-08-03 10:52:48',100),(299,'Apple Watch Series 11 GPS 46mm Rose Gold Aluminium',18,'apple-watch-series-11-gps-46mm-rose-gold-alumdinium',2,NULL,NULL,'Smart Watch',1299.00,1299.00,'products/apple-watch-series-11-gps-46mm-rose-gold.webp',NULL,1,0,'2026-07-30 06:45:12','2026-08-05 10:24:39',100),(300,'Celly - SMARTW 1.96 FABRIC+SIL BAND',18,'celly-smartw-1-96-fabric-sil-band',30,NULL,NULL,'Smart Watch',119.00,69.00,'products/celly-smartw-1-96-fabric-sil-band.webp',NULL,1,0,'2026-07-30 06:45:12','2026-08-03 10:52:48',100),(301,'Celly TrainerWide Smart Watch (TRAINERWIDEBK)',18,'celly-trainerwide-smart-watch-trainerwidebk',30,NULL,NULL,'Smart Watch',119.00,99.00,'products/celly-trainerwide-smart-watch-trainerwidebk.webp',NULL,1,0,'2026-07-30 06:45:12','2026-08-03 10:52:48',100),(303,'Apple Watch Series 11 GPS 42mm Rose Gold Aluminium',18,'apple-watch-series-11-gps-42mm-rose-gold-aluminium',2,NULL,NULL,'Smart Watch',1199.00,1199.00,'products/apple-watch-series-11-gps-42mm-rose-gold.webp',NULL,1,0,'2026-07-30 06:45:12','2026-08-03 10:52:48',100),(304,'Xiaomi Redmi Watch 6 Silver Gray (BHR08CUGL)',18,'xiaomi-redmi-watch-6-silver-gray-bhr08cugl',17,NULL,NULL,'Smart Watch',299.00,299.00,'products/xiaomi-redmi-watch-6-silver-gray.webp',NULL,1,0,'2026-07-30 06:45:12','2026-08-03 10:52:48',100),(305,'Realme TechLife Watch R100 - Black',18,'realme-techlife-watch-r100-black',28,NULL,NULL,'Smart Watch',199.00,199.00,'products/realme-techlife-watch-r100-black.webp',NULL,1,0,'2026-07-30 06:45:12','2026-08-03 10:52:48',100),(306,'Samsung SM-R390 Galaxy Fit 3 Gray',18,'samsung-sm-r390-galaxy-fit-3-gray',1,NULL,NULL,'Smart Watch',159.00,159.00,'products/samsung-sm-r390-galaxy-fit-3-gray.webp',NULL,1,0,'2026-07-30 06:45:12','2026-08-03 10:52:48',100),(307,'Amazfit Balance - Sunset Grey',18,'amazfit-balance-sunset-grey',53,NULL,NULL,'Smart Watch',549.00,499.00,'products/amazfit-balance-sunset-grey.webp',NULL,1,0,'2026-07-30 06:45:12','2026-08-03 10:52:48',100),(308,'Amazfit Cheetah Square - Winner Champagne',18,'amazfit-cheetah-square-winner-champagne',53,NULL,NULL,'Smart Watch',629.00,499.00,'products/amazfit-cheetah-square-winner-champagne.webp',NULL,1,0,'2026-07-30 06:45:12','2026-08-03 10:52:48',100),(309,'Amazfit Cheetah Pro Run Track - Black',18,'amazfit-cheetah-pro-run-track-black',53,NULL,NULL,'Smart Watch',849.00,699.00,'products/amazfit-cheetah-pro-run-track-black.webp',NULL,1,0,'2026-07-30 06:45:12','2026-08-03 10:52:48',100),(454,'Hoco 3D Hot Bending Full Adhesive Protective Film Black 1',19,'hoco-3d-hot-bending-full-adhesive-protective-film-black-1',62,NULL,NULL,NULL,15.00,15.00,'products/hoco-3d-hot-bending-protective-film-1.webp',NULL,1,0,'2026-08-05 10:19:30','2026-08-05 10:19:30',10),(455,'Hoco 3D Hot Bending Full Adhesive Protective Film Black 2',19,'hoco-3d-hot-bending-full-adhesive-protective-film-black-2',62,NULL,NULL,NULL,15.00,15.00,'products/hoco-3d-hot-bending-protective-film-2.webp',NULL,1,0,'2026-08-05 10:19:30','2026-08-05 10:19:30',10),(456,'Samsung Galaxy Watch 42mm Elastic Nylon Watch Strap Black',19,'samsung-galaxy-watch-42mm-elastic-nylon-watch-strap-black',1,NULL,NULL,NULL,39.00,39.00,'products/samsung-galaxy-watch-42mm-elastic-nylon-black.webp',NULL,1,0,'2026-08-05 10:19:30','2026-08-05 10:19:30',10),(457,'Samsung Galaxy KLB-ZQWFKGJ-001 Silicone Strap White',19,'samsung-galaxy-klb-zqwfkgj-001-silicone-strap-white',1,NULL,NULL,NULL,25.00,25.00,'products/samsung-galaxy-klb-zqwfkgj-001-silicone-white.webp',NULL,1,0,'2026-08-05 10:19:30','2026-08-05 10:19:30',10),(458,'Samsung Galaxy Watch FE 40mm KALEBOL KLB- Strap Orange',19,'samsung-galaxy-watch-fe-40mm-kalebol-klb-strap-orange',1,NULL,NULL,NULL,25.00,25.00,'products/samsung-watch-fe-40mm-kalebol-orange.webp',NULL,1,0,'2026-08-05 10:19:30','2026-08-05 10:19:30',10),(459,'Samsung Galaxy Watch FE 40mm KALEBOL KLB- Strap Green',19,'samsung-galaxy-watch-fe-40mm-kalebol-klb-strap-green',1,NULL,NULL,NULL,25.00,25.00,'products/samsung-watch-fe-40mm-kalebol-green.webp',NULL,1,0,'2026-08-05 10:19:30','2026-08-05 10:19:30',10),(460,'Samsung Galaxy Watch FE 40mm KALEBOL KLB- Strap Grey',19,'samsung-galaxy-watch-fe-40mm-kalebol-klb-strap-grey',1,NULL,NULL,NULL,25.00,25.00,'products/samsung-watch-fe-40mm-kalebol-grey.webp',NULL,1,0,'2026-08-05 10:19:30','2026-08-05 10:19:30',10),(461,'DUX DUCIS YA Series 43mm Genuine Cowhide Leather Strap Brown',19,'dux-ducis-ya-series-43mm-genuine-cowhide-leather-strap-brown',63,NULL,NULL,NULL,39.00,39.00,'products/dux-ducis-ya-series-43mm-brown.webp',NULL,1,0,'2026-08-05 10:19:30','2026-08-05 10:19:30',10),(462,'DUX DUCIS YA Series 43mm Genuine Cowhide Leather Strap Light Brown',19,'dux-ducis-ya-series-43mm-genuine-cowhide-leather-strap-light-brown',63,NULL,NULL,NULL,39.00,39.00,'products/dux-ducis-ya-series-43mm-light-brown.webp',NULL,1,0,'2026-08-05 10:19:30','2026-08-05 10:19:30',10),(463,'DUX DUCIS YA Series 43mm Genuine Cowhide Leather Strap Yellow',19,'dux-ducis-ya-series-43mm-genuine-cowhide-leather-strap-yellow',63,NULL,NULL,NULL,39.00,39.00,'products/dux-ducis-ya-series-43mm-yellow.webp',NULL,1,0,'2026-08-05 10:19:30','2026-08-05 10:19:30',10),(464,'DUX DUCIS YA Series 43mm Genuine Cowhide Leather Strap Blue',19,'dux-ducis-ya-series-43mm-genuine-cowhide-leather-strap-blue',63,NULL,NULL,NULL,39.00,39.00,'products/dux-ducis-ya-series-43mm-blue.webp',NULL,1,0,'2026-08-05 10:19:30','2026-08-05 10:19:30',10),(465,'For Samsung Galaxy Watch 5 40mm / 44mm Replacement Strap Black',19,'for-samsung-galaxy-watch-5-40mm-44mm-replacement-strap-black',1,NULL,NULL,NULL,25.00,9.00,'products/samsung-galaxy-watch-5-replacement-strap-black.webp',NULL,1,0,'2026-08-05 10:19:30','2026-08-05 10:19:30',10),(466,'20mm Oil Wax Skin Cowhide Leather Watch Strap Black',19,'20mm-oil-wax-skin-cowhide-leather-watch-strap-black',1,NULL,NULL,NULL,49.00,49.00,'products/20mm-oil-wax-skin-cowhide-leather-strap-black.webp',NULL,1,0,'2026-08-05 10:19:30','2026-08-05 10:19:30',10),(467,'Watch Strap Samsung Galaxy Watch 6 Classic Green',19,'watch-strap-samsung-galaxy-watch-6-classic-green',1,NULL,NULL,NULL,19.00,19.00,'products/watch-strap-samsung-galaxy-watch-6-classic-green.webp',NULL,1,0,'2026-08-05 10:19:30','2026-08-05 10:19:30',10),(468,'Watch Strap Samsung Galaxy Watch 6 Classic Blue',19,'watch-strap-samsung-galaxy-watch-6-classic-blue',1,NULL,NULL,NULL,19.00,9.00,'products/watch-strap-samsung-galaxy-watch-6-classic-blue.webp',NULL,1,0,'2026-08-05 10:19:30','2026-08-05 10:19:30',10),(469,'For Samsung Galaxy Fit3 Replacement Strap Drop Black',19,'for-samsung-galaxy-fit3-replacement-strap-drop-black',1,NULL,NULL,NULL,25.00,9.00,'products/samsung-galaxy-fit3-replacement-strap-black.webp',NULL,1,0,'2026-08-05 10:19:30','2026-08-05 10:19:30',10),(558,'Xiaomi Redmi Watch 5 Silver Gray (BHR9381GL)',18,'xiaomi-redmi-watch-5-silver-gray-bhr9381gl',17,NULL,NULL,NULL,259.00,259.00,'products/xiaomi-redmi-watch-5-silver-gray.webp',NULL,1,0,'2026-08-05 10:24:44','2026-08-05 10:24:44',10),(559,'Xiaomi Redmi Watch 5 Lavender Purple',18,'xiaomi-redmi-watch-5-lavender-purple',17,NULL,NULL,NULL,259.00,259.00,'products/xiaomi-redmi-watch-5-lavender-purple.webp',NULL,1,0,'2026-08-05 10:24:44','2026-08-05 10:24:44',10),(560,'Honor Choice 2i (5504ACGM) Black',18,'honor-choice-2i-5504acgm-black',8,NULL,NULL,NULL,159.00,159.00,'products/honor-choice-2i-black.webp',NULL,1,0,'2026-08-05 10:24:44','2026-08-05 10:24:44',10),(561,'Samsung Galaxy Watch 8 44mm Silver SM-R940',18,'samsung-galaxy-watch-8-44mm-silver-sm-r940',1,NULL,NULL,NULL,999.00,799.00,'products/samsung-galaxy-watch-8-44mm-silver.webp',NULL,1,0,'2026-08-05 10:24:44','2026-08-05 10:24:44',10),(562,'Samsung Galaxy Watch 8 Classic Black SM-R950',18,'samsung-galaxy-watch-8-classic-black-sm-r950',1,NULL,NULL,NULL,999.00,999.00,'products/samsung-galaxy-watch-8-classic-black.webp',NULL,1,0,'2026-08-05 10:24:44','2026-08-05 10:24:44',10),(563,'Apple Watch SE 3 GPS 40mm Midnight Aluminium',18,'apple-watch-se-3-gps-40mm-midnight-aluminium',2,NULL,NULL,NULL,819.00,819.00,'products/apple-watch-se-3-gps-40mm-midnight.webp',NULL,1,0,'2026-08-05 10:24:44','2026-08-05 10:24:44',10),(564,'Apple Watch Series 11 GPS 46mm Space Grey Aluminium',18,'apple-watch-series-11-gps-46mm-space-grey-aluminium',2,NULL,NULL,NULL,1299.00,1299.00,'products/apple-watch-series-11-gps-46mm-space-grey.webp',NULL,1,0,'2026-08-05 10:24:44','2026-08-05 10:24:44',10),(565,'Apple Watch Series 11 GPS 46mm Rose Gold Aluminium',18,'apple-watch-series-11-gps-46mm-rose-gold-aluminium',2,NULL,NULL,NULL,1299.00,1299.00,'products/apple-watch-series-11-gps-46mm-rose-gold.webp',NULL,1,0,'2026-08-05 10:24:44','2026-08-05 10:24:44',10),(566,'Apple Watch SE 3 GPS 40mm Midnight Aluminium Sport Band',18,'apple-watch-se-3-gps-40mm-midnight-aluminium-sport-band',2,NULL,NULL,NULL,819.00,819.00,'products/apple-watch-se-3-gps-40mm-midnight-band.webp',NULL,1,0,'2026-08-05 10:24:44','2026-08-05 10:24:44',10),(567,'Apple Watch Series 11 GPS 46mm Silver Aluminium',18,'apple-watch-series-11-gps-46mm-silver-aluminium',2,NULL,NULL,NULL,1299.00,1299.00,'products/apple-watch-series-11-gps-46mm-silver.webp',NULL,1,0,'2026-08-05 10:24:44','2026-08-05 10:24:44',10),(568,'Apple Watch Series 11 GPS 42mm Silver Aluminium',18,'apple-watch-series-11-gps-42mm-silver-aluminium',2,NULL,NULL,NULL,1199.00,1199.00,'products/apple-watch-series-11-gps-42mm-silver.webp',NULL,1,0,'2026-08-05 10:24:44','2026-08-05 10:24:44',10),(569,'Apple Watch SE 3 GPS 44mm Starlight Aluminium',18,'apple-watch-se-3-gps-44mm-starlight-aluminium',2,NULL,NULL,NULL,929.00,929.00,'products/apple-watch-se-3-gps-44mm-starlight.webp',NULL,1,0,'2026-08-05 10:24:44','2026-08-05 10:24:44',10),(582,'JBL GO 5 Black',20,'jbl-go-5-black',64,NULL,NULL,NULL,149.00,149.00,'products/jbl-go-5-black.webp',NULL,1,0,'2026-08-05 10:52:22','2026-08-05 10:52:22',10),(583,'JBL GO 5 Blue',20,'jbl-go-5-blue',64,NULL,NULL,NULL,149.00,149.00,'products/jbl-go-5-blue.webp',NULL,1,0,'2026-08-05 10:52:22','2026-08-05 10:52:22',10),(584,'JBL GO 5 Pink',20,'jbl-go-5-pink',64,NULL,NULL,NULL,149.00,149.00,'products/jbl-go-5-pink.webp',NULL,1,0,'2026-08-05 10:52:22','2026-08-05 10:52:22',10),(585,'JBL GO 5 Purple',20,'jbl-go-5-purple',64,NULL,NULL,NULL,149.00,149.00,'products/jbl-go-5-purple.webp',NULL,1,0,'2026-08-05 10:52:22','2026-08-05 10:52:22',10),(586,'JBL GO 5 Red',20,'jbl-go-5-red',64,NULL,NULL,NULL,149.00,149.00,'products/jbl-go-5-red.webp',NULL,1,0,'2026-08-05 10:52:22','2026-08-05 10:52:22',10),(587,'JBL GO 5 Squad',20,'jbl-go-5-squad',64,NULL,NULL,NULL,149.00,149.00,'products/jbl-go-5-squad.webp',NULL,1,0,'2026-08-05 10:52:22','2026-08-05 10:52:22',10),(588,'JBL GO 5 White',20,'jbl-go-5-white',64,NULL,NULL,NULL,149.00,149.00,'products/jbl-go-5-white.webp',NULL,1,0,'2026-08-05 10:52:22','2026-08-05 10:52:22',10),(589,'Samsung Galaxy S26+ Silicone Magnet Case Grey',20,'samsung-galaxy-s26-plus-silicone-magnet-case-grey',1,NULL,NULL,NULL,149.00,149.00,'products/samsung-galaxy-s26-plus-silicone-magnet-case-grey.webp',NULL,1,0,'2026-08-05 10:52:22','2026-08-05 10:52:22',10),(590,'Samsung Galaxy S26+ Silicone Magnet Case Dark Grey',20,'samsung-galaxy-s26-plus-silicone-magnet-case-dark-grey',1,NULL,NULL,NULL,149.00,149.00,'products/samsung-galaxy-s26-plus-silicone-magnet-case-dark-grey.webp',NULL,1,0,'2026-08-05 10:52:22','2026-08-05 10:52:22',10),(591,'Samsung Galaxy S26 Clear Case (M1)',20,'samsung-galaxy-s26-clear-case-m1',1,NULL,NULL,NULL,69.00,69.00,'products/samsung-galaxy-s26-clear-case-m1.webp',NULL,1,0,'2026-08-05 10:52:22','2026-08-05 10:52:22',10),(592,'Samsung Galaxy S26 Clear Magnet Case (M1)',20,'samsung-galaxy-s26-clear-magnet-case-m1',1,NULL,NULL,NULL,99.00,99.00,'products/samsung-galaxy-s26-clear-magnet-case-m1.webp',NULL,1,0,'2026-08-05 10:52:22','2026-08-05 10:52:22',10),(593,'Samsung Galaxy S26 Rugged Magnet Case Black',20,'samsung-galaxy-s26-rugged-magnet-case-black',1,NULL,NULL,NULL,199.00,199.00,'products/samsung-galaxy-s26-rugged-magnet-case-black.webp',NULL,1,0,'2026-08-05 10:52:22','2026-08-05 10:52:22',10),(594,'Samsung Galaxy S26+ Clear Case (M2)',20,'samsung-galaxy-s26-plus-clear-case-m2',1,NULL,NULL,NULL,69.00,69.00,'products/samsung-galaxy-s26-plus-clear-case-m2.webp',NULL,1,0,'2026-08-05 10:53:52','2026-08-05 10:53:52',10),(595,'Samsung Galaxy S26 Silicone Magnet Case Black',20,'samsung-galaxy-s26-silicone-magnet-case-black',1,NULL,NULL,NULL,149.00,149.00,'products/samsung-galaxy-s26-silicone-magnet-case-black.webp',NULL,1,0,'2026-08-05 10:53:52','2026-08-05 10:53:52',10),(596,'Samsung Galaxy S26+ Clear Magnet Case (M2)',20,'samsung-galaxy-s26-plus-clear-magnet-case-m2',1,NULL,NULL,NULL,99.00,99.00,'products/samsung-galaxy-s26-plus-clear-magnet-case-m2.webp',NULL,1,0,'2026-08-05 10:53:52','2026-08-05 10:53:52',10),(597,'Samsung Galaxy S26+ Rugged Magnet Case Black',20,'samsung-galaxy-s26-plus-rugged-magnet-case-black',1,NULL,NULL,NULL,199.00,199.00,'products/samsung-galaxy-s26-plus-rugged-magnet-case-black.webp',NULL,1,0,'2026-08-05 10:53:52','2026-08-05 10:53:52',10),(598,'Samsung Galaxy S26 Silicone Magnet Case Grey',20,'samsung-galaxy-s26-silicone-magnet-case-grey',1,NULL,NULL,NULL,149.00,149.00,'products/samsung-galaxy-s26-silicone-magnet-case-grey.webp',NULL,1,0,'2026-08-05 10:53:52','2026-08-05 10:53:52',10),(599,'Samsung Galaxy S26+ Slim Magnet Case (M2) Black',20,'samsung-galaxy-s26-plus-slim-magnet-case-m2-black',1,NULL,NULL,NULL,199.00,199.00,'products/samsung-galaxy-s26-plus-slim-magnet-case-m2-black.webp',NULL,1,0,'2026-08-05 10:53:52','2026-08-05 10:53:52',10),(600,'Samsung Galaxy S26+ Slim Magnet Case (M2) Purple',20,'samsung-galaxy-s26-plus-slim-magnet-case-m2-purple',1,NULL,NULL,NULL,199.00,199.00,'products/samsung-galaxy-s26-plus-slim-magnet-case-m2-purple.webp',NULL,1,0,'2026-08-05 10:53:52','2026-08-05 10:53:52',10),(601,'Samsung Galaxy S26 Slim Magnet Case (M1) Black',20,'samsung-galaxy-s26-slim-magnet-case-m1-black',1,NULL,NULL,NULL,199.00,199.00,'products/samsung-galaxy-s26-slim-magnet-case-m1-black.webp',NULL,1,0,'2026-08-05 10:53:52','2026-08-05 10:53:52',10),(602,'Samsung Galaxy S26+ Slim Magnet Case (M2) Grey',20,'samsung-galaxy-s26-plus-slim-magnet-case-m2-grey',1,NULL,NULL,NULL,199.00,199.00,'products/samsung-galaxy-s26-plus-slim-magnet-case-m2-grey.webp',NULL,1,0,'2026-08-05 10:53:52','2026-08-05 10:53:52',10),(603,'Samsung Galaxy S26+ Slim Magnet Case (M2) White',20,'samsung-galaxy-s26-plus-slim-magnet-case-m2-white',1,NULL,NULL,NULL,199.00,199.00,'products/samsung-galaxy-s26-plus-slim-magnet-case-m2-white.webp',NULL,1,0,'2026-08-05 10:53:52','2026-08-05 10:53:52',10),(604,'Samsung Galaxy S26 Ultra Silicone Magnet Case Grey',20,'samsung-galaxy-s26-ultra-silicone-magnet-case-grey',1,NULL,NULL,NULL,149.00,149.00,'products/samsung-galaxy-s26-ultra-silicone-magnet-case-grey.webp',NULL,1,0,'2026-08-05 10:53:52','2026-08-05 10:53:52',10),(605,'Samsung Galaxy S26 Ultra Slim Magnet Case (M3) Black',20,'samsung-galaxy-s26-ultra-slim-magnet-case-m3-black',1,NULL,NULL,NULL,199.00,199.00,'products/samsung-galaxy-s26-ultra-slim-magnet-case-m3-black.webp',NULL,1,0,'2026-08-05 10:53:52','2026-08-05 10:53:52',10),(606,'Samsung Galaxy S26 Ultra Slim Magnet Case (M3) Purple',20,'samsung-galaxy-s26-ultra-slim-magnet-case-m3-purple',1,NULL,NULL,NULL,199.00,199.00,'products/samsung-galaxy-s26-ultra-slim-magnet-case-m3-purple.webp',NULL,1,0,'2026-08-05 10:53:52','2026-08-05 10:53:52',10),(607,'Samsung Galaxy S26 Ultra Slim Magnet Case (M3) Grey',20,'samsung-galaxy-s26-ultra-slim-magnet-case-m3-grey',1,NULL,NULL,NULL,199.00,199.00,'products/samsung-galaxy-s26-ultra-slim-magnet-case-m3-grey.webp',NULL,1,0,'2026-08-05 10:53:52','2026-08-05 10:53:52',10),(608,'Samsung Galaxy S26 Ultra Slim Magnet Case (M3) White',20,'samsung-galaxy-s26-ultra-slim-magnet-case-m3-white',1,NULL,NULL,NULL,199.00,199.00,'products/samsung-galaxy-s26-ultra-slim-magnet-case-m3-white.webp',NULL,1,0,'2026-08-05 10:53:52','2026-08-05 10:53:52',10),(609,'Samsung Galaxy S26 Ultra Rugged Magnet Case Black',20,'samsung-galaxy-s26-ultra-rugged-magnet-case-black',1,NULL,NULL,NULL,199.00,199.00,'products/samsung-galaxy-s26-ultra-rugged-magnet-case-black.webp',NULL,1,0,'2026-08-05 10:53:52','2026-08-05 10:53:52',10);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` tinyint(1) NOT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_addresses`
--

DROP TABLE IF EXISTS `user_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_addresses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `city` varchar(255) NOT NULL,
  `address_line_1` varchar(255) NOT NULL,
  `address_line_2` varchar(255) DEFAULT NULL,
  `zip_code` varchar(20) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_addresses`
--

LOCK TABLES `user_addresses` WRITE;
/*!40000 ALTER TABLE `user_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_compares`
--

DROP TABLE IF EXISTS `user_compares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_compares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_product` (`user_id`,`product_id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `user_compares_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_compares_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_compares`
--

LOCK TABLES `user_compares` WRITE;
/*!40000 ALTER TABLE `user_compares` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_compares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `firebase_uid` varchar(128) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `profile_image` varchar(500) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `role` enum('user','admin') DEFAULT 'user',
  `agree_marketing` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `google_id` (`google_id`),
  UNIQUE KEY `firebase_uid` (`firebase_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (18,'',NULL,'giorgi101mikolaichukis@gmail.com',NULL,'$2b$10$YzFoK5TayMTZFKHHU7MlDeYlwUA/JLq7bGX6hacSJ0dx44iQ7Dxva',NULL,NULL,NULL,NULL,'user',0,'2026-08-07 10:39:08','2026-08-07 10:39:08');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlists`
--

DROP TABLE IF EXISTS `wishlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `wishlists_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlists_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlists`
--

LOCK TABLES `wishlists` WRITE;
/*!40000 ALTER TABLE `wishlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'react_projet_tech_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-07 17:58:18
