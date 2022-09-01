-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: restaurantmanagement
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `bill_id` int NOT NULL,
  `bill_created_date` date DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `bill_total_money` decimal(12,0) DEFAULT '0',
  `bill_is_payment` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`bill_id`),
  CONSTRAINT `fk_bill_order` FOREIGN KEY (`bill_id`) REFERENCES `order` (`ord_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (1,'2022-01-01',2,181000000,0),(2,'2022-01-04',3,262000000,0),(3,'2022-01-11',4,443000000,0),(4,'2022-01-12',5,321500000,0),(5,'2022-02-21',6,442500000,0),(6,'2022-02-27',7,501000000,0),(7,'2022-03-15',8,522000000,0),(8,'2022-03-22',9,483000000,0),(9,'2022-04-12',10,261500000,0),(10,'2022-04-17',3,340000000,0),(11,'2020-01-01',2,181000000,0),(12,'2021-01-01',2,442500000,0),(13,'2020-05-01',2,181000000,0),(14,'2021-05-01',10,442500000,0),(15,'2021-07-01',2,181000000,0),(16,'2021-07-01',10,501000000,0),(17,'2021-08-01',10,501000000,0),(18,'2021-10-01',8,262000000,0),(19,'2021-11-01',8,262000000,0),(20,'2021-12-01',8,340000000,0),(21,'2022-08-11',10,100000000,0),(22,'2022-08-11',10,100000000,0),(23,'2022-08-13',10,200000000,0),(24,'2022-08-11',10,260000000,0),(29,'2022-08-11',10,750000000,0),(31,'2022-08-11',10,162500000,0);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coefficient`
--

DROP TABLE IF EXISTS `coefficient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coefficient` (
  `coef_id` int NOT NULL AUTO_INCREMENT,
  `coef_type_date` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `coef_type_lesson` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `coef_value` float DEFAULT NULL,
  PRIMARY KEY (`coef_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coefficient`
--

LOCK TABLES `coefficient` WRITE;
/*!40000 ALTER TABLE `coefficient` DISABLE KEYS */;
INSERT INTO `coefficient` VALUES (1,'ngày thường','sáng',1),(2,'ngày thường','trưa',1),(3,'ngày thường','tối',1.3),(4,'cuối tuần','sáng',1.2),(5,'cuối tuần','trưa',1.2),(6,'cuối tuần','tối',1.5);
/*!40000 ALTER TABLE `coefficient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `cmt_id` int NOT NULL AUTO_INCREMENT,
  `cmt_content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `cmt_star` int DEFAULT NULL,
  `lobby_id` int DEFAULT NULL,
  PRIMARY KEY (`cmt_id`),
  KEY `fk_comment_user_idx` (`user_id`),
  KEY `fk_comment_lobby_idx` (`lobby_id`),
  CONSTRAINT `fk_comment_lobby` FOREIGN KEY (`lobby_id`) REFERENCES `lobby` (`lob_id`),
  CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'nice',5,5,1);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish`
--

DROP TABLE IF EXISTS `dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish` (
  `dish_id` int NOT NULL AUTO_INCREMENT,
  `dish_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dish_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dish_is_active` tinyint(1) DEFAULT '1',
  `dish_description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`dish_id`),
  UNIQUE KEY `dish_name_UNIQUE` (`dish_name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish`
--

LOCK TABLES `dish` WRITE;
/*!40000 ALTER TABLE `dish` DISABLE KEYS */;
INSERT INTO `dish` VALUES (1,'dish 1','https://res.cloudinary.com/dqifjhxxg/image/upload/v1650673517/restaurant%20management/dish/GgbZsKa_xeaziu.jpg',1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),(2,'dish 2','https://res.cloudinary.com/dqifjhxxg/image/upload/v1650673487/restaurant%20management/dish/lau-hai-san-hong-kong-2-1445x1084_dvfip3.jpg',1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),(3,'dish 3','https://res.cloudinary.com/dqifjhxxg/image/upload/v1650672333/restaurant%20management/dish/dish5_hyrun6.jpg',1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),(4,'dish 4','https://res.cloudinary.com/dqifjhxxg/image/upload/v1650672335/restaurant%20management/dish/dish6_ug8gts.jpg',1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),(5,'dish 5','https://res.cloudinary.com/dqifjhxxg/image/upload/v1650672331/restaurant%20management/dish/dish4_gnmvrd.jpg',1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),(6,'dish 6','https://res.cloudinary.com/dqifjhxxg/image/upload/v1650672331/restaurant%20management/dish/dish3_nuqdpz.jpg',1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),(7,'dish 7','https://res.cloudinary.com/dqifjhxxg/image/upload/v1650672328/restaurant%20management/dish/dish2_plhoz8.jpg',1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),(8,'dish 8','https://res.cloudinary.com/dqifjhxxg/image/upload/v1650672326/restaurant%20management/dish/dish1_cs7k0s.jpg',1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),(9,'dish 9','https://res.cloudinary.com/dqifjhxxg/image/upload/v1650674202/restaurant%20management/toast_d2vk24.png',1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),(10,'dish 10','https://res.cloudinary.com/dqifjhxxg/image/upload/v1650674202/restaurant%20management/toast_d2vk24.png',1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),(11,'dish 11','https://res.cloudinary.com/dqifjhxxg/image/upload/v1650674202/restaurant%20management/toast_d2vk24.png',1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),(12,'dish 12','https://res.cloudinary.com/dqifjhxxg/image/upload/v1650674202/restaurant%20management/toast_d2vk24.png',1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),(13,'dish 13','https://res.cloudinary.com/dqifjhxxg/image/upload/v1650674202/restaurant%20management/toast_d2vk24.png',1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),(14,'dish 14','https://res.cloudinary.com/dqifjhxxg/image/upload/v1650674202/restaurant%20management/toast_d2vk24.png',1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),(15,'dish 15','https://res.cloudinary.com/dqifjhxxg/image/upload/v1650674202/restaurant%20management/toast_d2vk24.png',1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),(16,'dish 16','https://res.cloudinary.com/dqifjhxxg/image/upload/v1650674202/restaurant%20management/toast_d2vk24.png',1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),(17,'dish 17','https://res.cloudinary.com/dqifjhxxg/image/upload/v1650674202/restaurant%20management/toast_d2vk24.png',1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),(18,'dish 18','https://res.cloudinary.com/dqifjhxxg/image/upload/v1650674202/restaurant%20management/toast_d2vk24.png',1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),(19,'dish 19','https://res.cloudinary.com/dqifjhxxg/image/upload/v1650674202/restaurant%20management/toast_d2vk24.png',1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),(20,'dish 20','https://res.cloudinary.com/dqifjhxxg/image/upload/v1650674202/restaurant%20management/toast_d2vk24.png',1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
/*!40000 ALTER TABLE `dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `feed_id` int NOT NULL AUTO_INCREMENT,
  `feed_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feed_created_date` datetime DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `feed_is_read` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`feed_id`),
  KEY `fk_feedback_user_user_idx` (`user_id`),
  CONSTRAINT `fk_feedback_user_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'good','2022-01-01 00:00:00',2,1),(2,'well','2022-01-15 00:00:00',3,0),(3,'bad','2022-02-24 00:00:00',4,0),(4,'excellent','2022-03-16 00:00:00',5,0);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lobby`
--

DROP TABLE IF EXISTS `lobby`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lobby` (
  `lob_id` int NOT NULL AUTO_INCREMENT,
  `lob_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lob_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lob_price` decimal(12,0) NOT NULL DEFAULT '0',
  `lob_is_active` tinyint(1) DEFAULT '1',
  `lob_total_table` int NOT NULL DEFAULT '0',
  `lob_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lob_description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lob_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lobby`
--

LOCK TABLES `lobby` WRITE;
/*!40000 ALTER TABLE `lobby` DISABLE KEYS */;
INSERT INTO `lobby` VALUES (1,'SẢNH ROSY','address 1',100000000,1,100,'https://res.cloudinary.com/dqifjhxxg/image/upload/v1650672348/restaurant%20management/lobby/lobby2_xyenvr.jpg','Với 2 tone màu tím lavender  và hồng  pastel là những gam màu mới hiện đại đầy quyến rũ. Không gian lãng mạng đầy tinh tế của sắc tím hay không gian tươi trẻ của sắc hồng sẽ tạo cho khách mời một cảm giác vui vẻ. Với mong muốn mang lại một không gian mới mẻ, lãng mạng và tinh tế thì sảnh Rosy là không gian hoàn hảo cho các cặp đôi trong ngày hạnh phúc, mở ra một cuộc sống ngập tràn yêu thương!'),(2,'SẢNH GREEN','address sanh green',200000000,1,80,'https://res.cloudinary.com/dqifjhxxg/image/upload/v1650673733/restaurant%20management/lobby/2-1_kw80mx.jpg','Tone màu xanh tươi mát là sắc màu của thiên nhiên, trẻ trung và tràn đầy hy vọng. Sảnh Green lựa chọn tone màu này làm chủ đạo để đem lại cảm giác vui tươi dễ chịu cho khách mời tham dự. Đây là sảnh mang phong cách hiện đại, tươi mát đầy niềm vui và hạnh phúc'),(3,'SẢNH GOLD','address 3',300000000,1,85,'https://res.cloudinary.com/dqifjhxxg/image/upload/v1650673733/restaurant%20management/lobby/2-1_kw80mx.jpg','Được thiết kế với 2 tone màu vàng đồng và đỏ Bordeaux là hai sắc màu truyền thống đặc trưng cho không gian tiệc cưới. Màu đỏ rực rỡ hay màu vàng quý phái lộng lẫy đều tạo nên cảm giác ấm áp sang trọng. Sảnh Gold được thiết kế và trang trí với hai sắc màu này như một lời chúc tốt lành mà BáchViệt muốn gửi đến đôi bạn trong ngày trọng đại.Từ sự ấm áp bởi 2 sắc màu này sẽ góp phần tạo nên không khí thân thiện, thoải mái.'),(4,'lobby 4','address 4',400000000,1,90,'https://res.cloudinary.com/dqifjhxxg/image/upload/v1650673733/restaurant%20management/lobby/2-1_kw80mx.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisl tincidunt eget nullam non. Quis hendrerit dolor magna eget est lorem ipsum dolor sit. Volutpat odio facilisis mauris sit amet massa. Commodo odio aenean sed adipiscing diam donec adipiscing tristique. Mi eget mauris pharetra et. Non tellus orci ac auctor augue. Elit at imperdiet dui accumsan sit. Ornare arcu dui vivamus arcu felis'),(5,'lobby 5','hồ chí minh',500000000,1,100,'https://res.cloudinary.com/dqifjhxxg/image/upload/v1650673733/restaurant%20management/lobby/2-1_kw80mx.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisl tincidunt eget nullam non. Quis hendrerit dolor magna eget est lorem ipsum dolor sit. Volutpat odio facilisis mauris sit amet massa. Commodo odio aenean sed adipiscing diam donec adipiscing tristique. Mi eget mauris pharetra et. Non tellus orci ac auctor augue. Elit at imperdiet dui accumsan sit. Ornare arcu dui vivamus arcu felis'),(6,'SẢNH ROSY 2','address 6',100000000,1,100,'https://res.cloudinary.com/dqifjhxxg/image/upload/v1650673733/restaurant%20management/lobby/2-1_kw80mx.jpg','Với 2 tone màu tím lavender  và hồng  pastel là những gam màu mới hiện đại đầy quyến rũ. Không gian lãng mạng đầy tinh tế của sắc tím hay không gian tươi trẻ của sắc hồng sẽ tạo cho khách mời một ...'),(7,'SẢNH GREEN 2','address 7',200000000,1,80,'https://res.cloudinary.com/dqifjhxxg/image/upload/v1650673733/restaurant%20management/lobby/2-1_kw80mx.jpg','Tone màu xanh tươi mát là sắc màu của thiên nhiên, trẻ trung và tràn đầy hy vọng. Sảnh Green lựa chọn tone màu này làm chủ đạo để đem lại cảm giác vui tươi dễ chịu cho khách mời tham dự. Đây là s...'),(8,'SẢNH GOLD 2','address 8',300000000,1,85,'https://res.cloudinary.com/dqifjhxxg/image/upload/v1650673733/restaurant%20management/lobby/2-1_kw80mx.jpg','Được thiết kế với 2 tone màu vàng đồng và đỏ Bordeaux là hai sắc màu truyền thống đặc trưng cho không gian tiệc cưới. Màu đỏ rực rỡ hay màu vàng quý phái lộng lẫy đều tạo nên cảm giác ấm áp...'),(9,'lobby 6','address 9',400000000,1,90,'https://res.cloudinary.com/dqifjhxxg/image/upload/v1650672348/restaurant%20management/lobby/lobby2_xyenvr.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisl tincidunt eget nullam non. Quis hendrerit dolor magna eget est lorem ipsum dolor sit. Volutpat odio facilisis mauris sit amet...'),(10,'lobby 7','address 10',500000000,1,100,'https://res.cloudinary.com/dqifjhxxg/image/upload/v1650672349/restaurant%20management/lobby/lobby3_uj0fpv.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisl tincidunt eget nullam non. Quis hendrerit dolor magna eget est lorem ipsum dolor sit. Volutpat odio facilisis mauris sit amet...'),(17,'122222','12222',15000000,1,150,'https://res.cloudinary.com/dqifjhxxg/image/upload/v1650672348/restaurant%20management/lobby/lobby2_xyenvr.jpg','Được thiết kế với 2 tone màu vàng đồng và đỏ Bordeaux là hai sắc màu truyền thống đặc trưng cho không gian tiệc cưới. Màu đỏ rực rỡ hay màu vàng quý phái lộng lẫy đều tạo nên cảm giác ấm áp...'),(18,'lobby 55','address 5',500000000,0,100,'https://res.cloudinary.com/dqifjhxxg/image/upload/v1650672348/restaurant%20management/lobby/lobby2_xyenvr.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisl tincidunt eget nullam non. Quis hendrerit dolor magna eget est lorem ipsum dolor sit. Volutpat odio facilisis mauris sit amet massa. Commodo odio aenean sed adipiscing diam donec adipiscing tristique. Mi eget mauris pharetra et. Non tellus orci ac auctor augue. Elit at imperdiet dui accumsan sit. Ornare arcu dui vivamus arcu felis'),(19,'SẢNH ROSY 2222','address 6',100000000,1,100,'https://res.cloudinary.com/dqifjhxxg/image/upload/v1650672348/restaurant%20management/lobby/lobby2_xyenvr.jpg','Với 2 tone màu tím lavender  và hồng  pastel là những gam màu mới hiện đại đầy quyến rũ. Không gian lãng mạng đầy tinh tế của sắc tím hay không gian tươi trẻ của sắc hồng sẽ tạo cho khách mời một ...'),(20,'SẢNH GREEN 2','address 7',200000000,1,80,'https://res.cloudinary.com/dqifjhxxg/image/upload/v1650673733/restaurant%20management/lobby/2-1_kw80mx.jpg','Tone màu xanh tươi mát là sắc màu của thiên nhiên, trẻ trung và tràn đầy hy vọng. Sảnh Green lựa chọn tone màu này làm chủ đạo để đem lại cảm giác vui tươi dễ chịu cho khách mời tham dự. Đây là s...'),(21,'SẢNH ROSY 2SẢNH ROSY 2','address 6',100000000,1,100,'https://res.cloudinary.com/dqifjhxxg/image/upload/v1650673733/restaurant%20management/lobby/2-1_kw80mx.jpg','Với 2 tone màu tím lavender  và hồng  pastel là những gam màu mới hiện đại đầy quyến rũ. Không gian lãng mạng đầy tinh tế của sắc tím hay không gian tươi trẻ của sắc hồng sẽ tạo cho khách mời một ...'),(22,'SẢNH ROSY 222','address 6',100000000,1,100,'https://res.cloudinary.com/dqifjhxxg/image/upload/v1650673733/restaurant%20management/lobby/2-1_kw80mx.jpg','Với 2 tone màu tím lavender  và hồng  pastel là những gam màu mới hiện đại đầy quyến rũ. Không gian lãng mạng đầy tinh tế của sắc tím hay không gian tươi trẻ của sắc hồng sẽ tạo cho khách mời một ...'),(23,'122222','12222',15000000,1,150,'https://res.cloudinary.com/dqifjhxxg/image/upload/v1650673733/restaurant%20management/lobby/2-1_kw80mx.jpg','mô tả sảnh cưới 11211'),(24,'122222','12222',15000000,1,150,'https://res.cloudinary.com/dqifjhxxg/image/upload/v1650673733/restaurant%20management/lobby/2-1_kw80mx.jpg','Được thiết kế với 2 tone màu vàng đồng và đỏ Bordeaux là hai sắc màu truyền thống đặc trưng cho không gian tiệc cưới. Màu đỏ rực rỡ hay màu vàng quý phái lộng lẫy đều tạo nên cảm giác ấm áp...'),(25,'122222','12222',15000000,1,150,'https://res.cloudinary.com/dqifjhxxg/image/upload/v1650673733/restaurant%20management/lobby/2-1_kw80mx.jpg','Được thiết kế với 2 tone màu vàng đồng và đỏ Bordeaux là hai sắc màu truyền thống đặc trưng cho không gian tiệc cưới. Màu đỏ rực rỡ hay màu vàng quý phái lộng lẫy đều tạo nên cảm giác ấm áp...'),(26,'122222','12222',15000000,1,150,'https://res.cloudinary.com/dqifjhxxg/image/upload/v1650673733/restaurant%20management/lobby/2-1_kw80mx.jpghttps://res.cloudinary.com/dqifjhxxg/image/upload/v1650673733/restaurant%20management/lobby/2-1_kw80mx.jpg','Được thiết kế với 2 tone màu vàng đồng và đỏ Bordeaux là hai sắc màu truyền thống đặc trưng cho không gian tiệc cưới. Màu đỏ rực rỡ hay màu vàng quý phái lộng lẫy đều tạo nên cảm giác ấm áp...');
/*!40000 ALTER TABLE `lobby` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lobby_image`
--

DROP TABLE IF EXISTS `lobby_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lobby_image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lob_id` int DEFAULT NULL,
  `image` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_lobby_idx` (`lob_id`),
  CONSTRAINT `fk_lobby` FOREIGN KEY (`lob_id`) REFERENCES `lobby` (`lob_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lobby_image`
--

LOCK TABLES `lobby_image` WRITE;
/*!40000 ALTER TABLE `lobby_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `lobby_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menu_id` int NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_price` decimal(12,0) DEFAULT '0',
  `menu_is_active` tinyint(1) DEFAULT '1',
  `menu_image` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`menu_id`),
  UNIQUE KEY `menu_name_UNIQUE` (`menu_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'menu 1',1000000,1,'https://res.cloudinary.com/dqifjhxxg/image/upload/v1650672997/restaurant%20management/menu/Menu-wed-Melisa-1024x768-1--1024x711_xk9mv2.jpg'),(2,'menu 2',2000000,1,'https://res.cloudinary.com/dqifjhxxg/image/upload/v1650672931/restaurant%20management/menu/Menu-wed-Melisa-1024x768-2--1024x679_p8utbf.jpg'),(3,'menu 3 ',3000000,1,'https://res.cloudinary.com/dqifjhxxg/image/upload/v1650672978/restaurant%20management/menu/Menu-wed-Melisa-1024x768-3--1024x679_qml4i0.jpg'),(4,'menu 4',1500000,1,'https://res.cloudinary.com/dqifjhxxg/image/upload/v1650672961/restaurant%20management/menu/Menu-wed-Melisa-1024x768-4--1024x679_zmsb9g.jpg'),(5,'menu 5',1750000,1,'https://res.cloudinary.com/dqifjhxxg/image/upload/v1650673027/restaurant%20management/menu/Menu-wed-Melisa-1024x768-5--1024x679_fiddgi.jpg'),(6,'menu 6',2500000,1,'https://res.cloudinary.com/dqifjhxxg/image/upload/v1650673039/restaurant%20management/menu/Menu-wed-Melisa-1024x768-6--1024x679_dkqsjf.jpg'),(7,'menu 7',2750000,1,'https://res.cloudinary.com/dqifjhxxg/image/upload/v1650673049/restaurant%20management/menu/Menu-wed-Melisa-1024x768-7--1024x679_vwuej3.jpg');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_dish`
--

DROP TABLE IF EXISTS `menu_dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_dish` (
  `id` int NOT NULL AUTO_INCREMENT,
  `menu_id` int NOT NULL,
  `dish_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_menu_dish_menu_idx` (`menu_id`),
  KEY `fk_menu_dish_dish_idx` (`dish_id`),
  CONSTRAINT `fk_menu_dish_dish` FOREIGN KEY (`dish_id`) REFERENCES `dish` (`dish_id`),
  CONSTRAINT `fk_menu_dish_menu` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_dish`
--

LOCK TABLES `menu_dish` WRITE;
/*!40000 ALTER TABLE `menu_dish` DISABLE KEYS */;
INSERT INTO `menu_dish` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,2,6),(7,2,7),(8,2,8),(9,2,9),(10,2,10),(11,3,11),(12,3,12),(13,3,13),(14,3,14),(15,3,15),(16,4,16),(17,4,17),(18,4,18),(19,4,19),(20,4,20),(21,5,1),(22,5,3),(23,5,5),(24,5,7),(25,5,9),(26,6,2),(27,6,4),(28,6,6),(29,6,8),(30,6,10),(31,7,1),(32,7,5),(33,7,10),(34,7,15),(35,7,20);
/*!40000 ALTER TABLE `menu_dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `ord_id` int NOT NULL AUTO_INCREMENT,
  `ord_created_date` date DEFAULT NULL,
  `ord_booking_date` date DEFAULT NULL,
  `ord_booking_lesson` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `coef_id` int DEFAULT NULL,
  `lob_id` int DEFAULT NULL,
  `ord_is_payment` tinyint(1) DEFAULT '0',
  `ord_total_money` decimal(12,0) DEFAULT NULL,
  `coef_value` double DEFAULT '1',
  PRIMARY KEY (`ord_id`),
  KEY `fk_order_user_user_idx` (`user_id`),
  KEY `fk_order_coefficient_cofficient_idx` (`coef_id`),
  KEY `fk_order_user_lobby_idx` (`lob_id`),
  CONSTRAINT `fk_order_coefficient_cofficient` FOREIGN KEY (`coef_id`) REFERENCES `coefficient` (`coef_id`),
  CONSTRAINT `fk_order_user_lobby` FOREIGN KEY (`lob_id`) REFERENCES `lobby` (`lob_id`),
  CONSTRAINT `fk_order_user_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'2022-01-01','2022-01-07','sáng',2,1,1,1,262000000,1),(2,'2022-01-04','2022-01-12','sáng',3,1,1,1,443000000,1),(3,'2022-01-11','2022-01-17','trưa',4,2,2,1,262000000,1),(4,'2022-01-12','2022-01-17','tối',5,3,2,1,443000000,1),(5,'2022-02-21','2022-02-27','trưa',6,1,3,1,262000000,1),(6,'2022-02-27','2022-03-05','trưa',7,5,3,1,443000000,1),(7,'2022-03-15','2022-03-20','sáng',2,4,3,1,262000000,1),(8,'2022-03-22','2022-03-29','tối',3,3,4,1,443000000,1),(9,'2022-04-12','2022-04-17','tối',4,6,5,1,443000000,1),(10,'2022-04-17','2022-04-27','sáng',5,1,5,1,262000000,1),(11,'2022-01-01','2022-01-01','sáng',2,1,1,1,443000000,1),(12,'2021-01-12','2022-01-12','sáng',3,1,1,1,262000000,1),(13,'2021-05-01','2021-05-01','trưa',4,2,2,1,443000000,1),(14,'2021-05-01','2021-05-01','tối',5,3,2,1,262000000,1),(15,'2021-07-04','2021-07-04','trưa',6,1,3,1,443000000,1),(16,'2021-07-01','2021-07-01','trưa',7,5,3,1,262000000,1),(17,'2021-08-21','2021-08-21','sáng',2,4,3,1,443000000,1),(18,'2021-10-10','2021-10-10','tối',3,3,4,1,262000000,1),(19,'2021-11-01','2021-11-01','tối',4,6,5,1,443000000,1),(20,'2021-12-23','2021-12-23','sáng',5,1,5,1,262000000,1),(21,'2020-01-01','2020-01-04','sáng',2,1,1,1,443000000,1),(22,'2020-01-12','2020-02-04','sáng',3,1,1,1,262000000,1),(23,'2020-05-01','2020-05-04','trưa',4,2,2,1,443000000,1),(24,'2020-05-01','2020-05-04','tối',5,3,2,1,262000000,1),(25,'2020-07-04','2020-07-04','trưa',6,1,3,0,443000000,1),(26,'2020-07-04','2021-07-04','trưa',7,5,3,0,262000000,1),(27,'2020-07-04','2020-07-04','sáng',2,4,3,0,262000000,1),(28,'2020-07-04','2021-07-04','tối',3,3,4,0,181000000,1),(29,'2020-07-04','2020-08-04','tối',4,6,5,1,262000000,1),(30,'2020-07-04','2020-10-04','sáng',5,1,5,0,181000000,1),(31,'2022-08-11','2022-08-12','sáng',2,1,1,1,NULL,1),(32,'2022-08-11','2022-08-14','trưa',2,5,3,0,NULL,1);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_menu`
--

DROP TABLE IF EXISTS `order_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ord_id` int NOT NULL,
  `menu_id` int NOT NULL,
  `amount_table` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_order_menu_order_idx` (`ord_id`),
  KEY `fk_order_menu_menu_idx` (`menu_id`),
  CONSTRAINT `fk_order_menu_menu` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`),
  CONSTRAINT `fk_order_menu_order` FOREIGN KEY (`ord_id`) REFERENCES `order` (`ord_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_menu`
--

LOCK TABLES `order_menu` WRITE;
/*!40000 ALTER TABLE `order_menu` DISABLE KEYS */;
INSERT INTO `order_menu` VALUES (1,1,1,80),(2,2,2,80),(3,3,3,80),(4,4,4,80),(5,5,5,80),(6,6,6,80),(7,7,7,80),(8,8,1,80),(9,9,2,80),(10,10,3,80),(11,31,4,1),(12,31,1,60),(13,32,1,52);
/*!40000 ALTER TABLE `order_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_service`
--

DROP TABLE IF EXISTS `order_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_service` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ord_id` int NOT NULL,
  `ser_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_service_order_idx` (`ord_id`),
  KEY `fk_order_service_service_idx` (`ser_id`),
  CONSTRAINT `fk_order_service_order` FOREIGN KEY (`ord_id`) REFERENCES `order` (`ord_id`),
  CONSTRAINT `fk_order_service_service` FOREIGN KEY (`ser_id`) REFERENCES `service` (`ser_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_service`
--

LOCK TABLES `order_service` WRITE;
/*!40000 ALTER TABLE `order_service` DISABLE KEYS */;
INSERT INTO `order_service` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,1),(7,7,2),(8,8,3),(9,9,4),(10,1,2),(11,31,1),(12,32,1);
/*!40000 ALTER TABLE `order_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `ser_id` int NOT NULL AUTO_INCREMENT,
  `ser_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ser_price` decimal(10,0) NOT NULL DEFAULT '0',
  `ser_is_active` tinyint(1) DEFAULT '1',
  `ser_description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ser_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ser_id`),
  UNIQUE KEY `ser_name_UNIQUE` (`ser_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,'BÀN TRANG TRÍ',1000000,1,'Cung cấp các gói từ tiêu chuẩn đến cao cấp được thiết kế theo ý tưởng của hai bạn','https://res.cloudinary.com/dqifjhxxg/image/upload/v1651295970/restaurant%20management/service/MG_0591_tzl438.jpg'),(2,'CỔNG HOA CHÀO',2000000,1,'Hơn 10 mẫu cổng chào với đủ màu sắc, kiểu thiết kế, phong cách phù hợp với từng sảnh, từng sở thích của cô dâu chú rể','https://res.cloudinary.com/dqifjhxxg/image/upload/v1651295970/restaurant%20management/service/MG_0591_tzl438.jpg'),(3,'TIẾT MỤC KHAI TIỆC',3000000,1,'Nhiều chương trình đa dạng từ dân gian – hiện đại – hỗ trợ các tiết mục dàn dựng riêng của cô dâu chú rể','https://res.cloudinary.com/dqifjhxxg/image/upload/v1651295970/restaurant%20management/service/MG_0591_tzl438.jpg'),(4,'TRANH KÝ TÊN',1500000,1,'Liễn ký tên-  nơi các vị khách mời lưu lại những lời chúc mừng hạnh phúc dành cho hai bạn','https://res.cloudinary.com/dqifjhxxg/image/upload/v1651295970/restaurant%20management/service/MG_0591_tzl438.jpg'),(5,'PIANIST VÀ VIOLINIST  ĐÓN KHÁCH',2500000,1,'Không khí sẽ trở nên trang trọng hơn với Pianist và Violinist đón khách tại đại sảnh','https://res.cloudinary.com/dqifjhxxg/image/upload/v1651295970/restaurant%20management/service/MG_0591_tzl438.jpg'),(6,'KHU VỰC CHỤP HÌNH',2500000,1,'Bốt chụp hình lấy ngay, và nhiều khu vực trang trí khác để bạn và người thân có những tấm hình yêu thương','https://res.cloudinary.com/dqifjhxxg/image/upload/v1651295970/restaurant%20management/service/MG_0591_tzl438.jpg'),(10,'2222222',1000000,1,'Bốt chụp hình lấy ngay, và nhiều khu vực trang trí khác để bạn và người thân có những tấm hình yêu thương','https://res.cloudinary.com/dqifjhxxg/image/upload/v1651295970/restaurant%20management/service/MG_0591_tzl438.jpg');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_id_card` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_phone_number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_sex` tinyint(1) DEFAULT '1',
  `user_last_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `user_first_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `user_date_of_birth` date NOT NULL,
  `user_joined_date` date DEFAULT NULL,
  `user_username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_is_active` tinyint(1) DEFAULT '1',
  `user_role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT 'USER',
  `user_image` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `user_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_address` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_card` (`user_id_card`),
  UNIQUE KEY `user_usename` (`user_username`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'1234567890','0123456789',1,'Nguyễn Văn','Thanh','1997-12-12','2022-04-01','admin','$2a$10$Nd9H.IFDmEuCYfxEvXRIY.lJ3ajQpUHh/p52QY/VbYds5ddafi2pm',1,'ADMIN','https://res.cloudinary.com/dqifjhxxg/image/upload/v1651911047/restaurant%20management/user/img_0324_jtycdw.png','mail1@gmail.com','Ho Chi Minh'),(2,'1234567891','0123456799',0,'Nguyễn Thị','Vân','1997-05-11','2022-04-01','user1','$2a$10$Nd9H.IFDmEuCYfxEvXRIY.lJ3ajQpUHh/p52QY/VbYds5ddafi2pm',1,'USER','https://res.cloudinary.com/dqifjhxxg/image/upload/v1651911661/restaurant%20management/user/lovepik-cute-girl-avatar-png-image_401231841_wh1200_kikrjm.png','mail2@gmail.com','Ha Noi'),(3,'1234567892','0123456779',1,'Trần Quốc','Toàn','1997-05-22','2022-04-01','user2','$2a$10$Nd9H.IFDmEuCYfxEvXRIY.lJ3ajQpUHh/p52QY/VbYds5ddafi2pm',1,'USER','https://res.cloudinary.com/dqifjhxxg/image/upload/v1651911089/restaurant%20management/user/pngtree-cute-boy-couple-avatar-image_1235465_r5sf0n.jpg','mail3@gmail.com','Ho Chi Minh'),(4,'1234567893','0123456769',0,'Lê Thị Diệu','Hiền','1997-12-23','2022-04-01','user3','$2a$10$Nd9H.IFDmEuCYfxEvXRIY.lJ3ajQpUHh/p52QY/VbYds5ddafi2pm',1,'USER','https://res.cloudinary.com/dqifjhxxg/image/upload/v1651911575/restaurant%20management/user/smiling-girl-avatar_102172-32_vzpnvx.jpg','mail4@gmail.com','Ho Chi Minh'),(5,'1234567894','0123456759',1,'Trần Văn','Cường','1998-01-21','2022-04-01','user4','$2a$10$Nd9H.IFDmEuCYfxEvXRIY.lJ3ajQpUHh/p52QY/VbYds5ddafi2pm',1,'USER','https://res.cloudinary.com/dqifjhxxg/image/upload/v1651911179/restaurant%20management/user/portrait-young-man-beautiful-handsome-boy-avatar-portrait-young-man-beautiful-handsome-boy-avatar-guy-dirty-hair-male-131435304_sknpat.jpg','mail5@gmail.com','Da Nang'),(6,'1234567895','0123456749',1,'Lý Minh','Hùng','1998-12-07','2022-04-01','user5','$2a$10$Nd9H.IFDmEuCYfxEvXRIY.lJ3ajQpUHh/p52QY/VbYds5ddafi2pm',1,'USER','https://res.cloudinary.com/dqifjhxxg/image/upload/v1651911133/restaurant%20management/user/stock-vector-asian-boy-smiling-male-avatar-cartoon-guy-character-facial-expression-smile-vector-illustration-625960208_wmse8e.jpg','mail6@gmail.com','Ho Chi Minh'),(7,'1234567896','0123456739',0,'Võ Ánh','Nguyệt','1998-10-16','2022-04-01','666666','$2a$10$Nd9H.IFDmEuCYfxEvXRIY.lJ3ajQpUHh/p52QY/VbYds5ddafi2pm',1,'USER','https://res.cloudinary.com/dqifjhxxg/image/upload/v1651911330/restaurant%20management/user/pngtree-cute-girl-avatar-material-png-image_4023832_r1ddxr.jpg','mail7@gmail.com','Ho Chi Minh'),(8,'1234567897','0123456729',0,'Lê Kim','Anh','1988-12-15','2022-04-01','staff1','$2a$10$Nd9H.IFDmEuCYfxEvXRIY.lJ3ajQpUHh/p52QY/VbYds5ddafi2pm',1,'STAFF','https://res.cloudinary.com/dqifjhxxg/image/upload/v1651911278/restaurant%20management/user/360_F_385500115_T8QiYsPeliQ5tE3npwOuJNUfunqFBo1U_qx22uo.jpg','mail8@gmail.com','Can Tho'),(9,'1234567898','0123456719',1,'Võ Thành','Luân','1987-03-04','2022-04-01','staff2','$2a$10$Nd9H.IFDmEuCYfxEvXRIY.lJ3ajQpUHh/p52QY/VbYds5ddafi2pm',1,'STAFF','https://res.cloudinary.com/dqifjhxxg/image/upload/v1651911227/restaurant%20management/user/pngtree-couple-boy-cute-avatar-image_1153281_kzalco.jpg','mail9@gmail.com','Hai Phong'),(10,'1234567899','0123456709',1,'Hà Văn','Huy','1995-02-07','2022-04-01','staff3','$2a$10$Nd9H.IFDmEuCYfxEvXRIY.lJ3ajQpUHh/p52QY/VbYds5ddafi2pm',0,'STAFF','https://res.cloudinary.com/dqifjhxxg/image/upload/v1650672290/restaurant%20management/user/man_psirpi.jpg','mail10@gmail.com','Ho Chi Minh');
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

-- Dump completed on 2022-09-01 20:20:54
