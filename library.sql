-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '书籍id',
  `title` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '''书名''',
  `author` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '''作者''',
  `publisher` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '''出版社''',
  `isbn` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '''ISBN号''',
  `stock` int NOT NULL COMMENT '''库存数''',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `isbn-unique` (`isbn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'数据库1','张三','人民出版社5','111-2222-3333',4),(2,'物流业','卢晓明','秦記技术有限责任公司','JhV19TecUt',44),(4,'电讯業','贾嘉伦','石記有限责任公司','5EH5AubzZt',15),(6,'房地产业','黄云熙','贺有限责任公司','uZ1h5aUaSR',16),(7,'制药业','汤云熙','子异顾问有限责任公司','FZXADt9CIW',10),(8,'制药业','吕秀英','睿电脑有限责任公司','kYvVLPSqxQ',34),(9,'工业','孙秀英','郝記有限责任公司','jQWWqSK8Dw',30),(11,'房地产业','崔致远','致远有限责任公司','4fCOO3Mouy',7),(17,'饮食业','苏詩涵','陈記有限责任公司','LAnDWDiL6C',33),(20,'工业','薛睿','嘉伦电子有限责任公司','Ue8ZlFFOOx',45),(21,'咨询业','张宇宁','璐有限责任公司','KjlCwO2zM4',43),(22,'资讯科技业','丁子韬','致远通讯有限责任公司','o15zGKqtIw',7),(23,'制造业','武晓明','陆記有限责任公司','uYKb0BpI56',16),(24,'饮食业','于致远','安琪有限责任公司','0MRB8SDJLB',19),(25,'资讯科技业','蔡致远','胡記有限责任公司','R794cx3dYU',18),(26,'制造业','张睿','嘉伦玩具有限责任公司','Dd9Rol6ZvC',27),(27,'工程业','莫晓明','岚制药有限责任公司','gJ5TXiDJJ7',3),(28,'咨询业','吕秀英','张記顾问有限责任公司','X0WfO3hJ6R',36),(29,'房地产业','萧安琪','秀英工业有限责任公司','j723S6jWIN',8),(30,'工业','宋子韬','许食品有限责任公司','ccF7URaLVD',12),(31,'物流业','潘秀英','震南有限责任公司','fmhEHzsJu9',11),(32,'资讯科技业','贾震南','詩涵工业有限责任公司','ikD75ATV6e',47),(33,'电子行业','廖璐','段有限责任公司','ahI2FhtNCU',23),(34,'房地产业','罗云熙','杰宏有限责任公司','nOuiMlSjXT',49),(35,'金融服务业','史子韬','陶記有限责任公司','tnOdPfRuHj',26),(36,'金融服务业','苏子异','侯食品有限责任公司','pIXVO6RsP7',1),(37,'饮食业','田子异','严記贸易有限责任公司','wirr6TyHvR',12),(38,'资讯科技业','黎璐','嘉伦物业代理有限责任公司','rFBBv1qAB6',8),(39,'房地产业','陆秀英','秀英有限责任公司','s7OAZ8Tz8T',8),(40,'工业','武嘉伦','贾記工程有限责任公司','Wmbl2EYnrI',31),(41,'物流业','魏岚','钟記发展贸易有限责任公司','I9pN5VB5aJ',26),(42,'饮食业','汪子异','安琪有限责任公司','T6ShW4MT84',40),(43,'房地产业','陈安琪','嘉伦工业有限责任公司','alwIQmacfd',1),(44,'电讯業','钟晓明','黎記食品有限责任公司','Lsub9M1gDe',6),(45,'电子行业','钟子韬','嘉伦技术有限责任公司','VoXsfKrawB',30),(46,'电讯業','毛晓明','黎記电脑有限责任公司','fe40z7RUWj',39),(47,'贸易行业','陈震南','子韬通讯有限责任公司','Gi15l0WtbL',37),(48,'工程业','罗晓明','秦顾问有限责任公司','kZM9MKfGrd',26),(49,'工业','郭嘉伦','莫制药有限责任公司','hkY4JQ4JvJ',9),(50,'工程业','范致远','邵有限责任公司','LmFbSY6vv2',0),(51,'贸易行业','邵宇宁','魏电子有限责任公司','QVyYILWbTL',27),(52,'工程业','卢安琪','云熙有限责任公司','svR7ar9FEW',5),(53,'咨询业','田嘉伦','宇宁有限责任公司','d0fGjv64DJ',13),(54,'资讯科技业','武嘉伦','詩涵有限责任公司','go7qyBWhMc',6),(55,'制药业','赵岚','莫有限责任公司','W08InPVJmM',24),(56,'制造业','蒋安琪','詩涵有限责任公司','130CLxs7fq',4),(57,'咨询业','潘致远','傅記有限责任公司','x3LZrES9pL',35),(58,'资讯科技业','吴秀英','杰宏有限责任公司','1sbLyELafR',13),(59,'制药业','龚致远','杨电脑有限责任公司','QyAdNZcmfm',33),(60,'资讯科技业','顾嘉伦','云熙玩具有限责任公司','o08a09RiMp',34),(61,'工业','胡岚','子异有限责任公司','b0bkVE9Lmi',35),(62,'资讯科技业','贺睿','致远贸易有限责任公司','kMsDLt1HHk',20),(63,'工程业','朱杰宏','阎制药有限责任公司','OPV8EAhP0e',13),(64,'工程业','丁秀英','岚技术有限责任公司','USQvfF3xcN',21),(65,'工业','朱詩涵','震南电脑有限责任公司','xc4L1Erl0S',18),(66,'物流业','陆岚','于記工业有限责任公司','LnlFhPrmBY',23),(67,'电子行业','石致远','薛記技术有限责任公司','4eoF1dYQN7',25),(68,'贸易行业','蒋秀英','郭記有限责任公司','FWgcvDKkhK',8),(69,'资讯科技业','宋致远','秀英有限责任公司','YpOOuxRrmc',12),(70,'电讯業','曾岚','杰宏有限责任公司','IyCp5DiYe7',48),(71,'物流业','郝宇宁','嘉伦电脑有限责任公司','l1zR6wRlpp',12),(72,'制药业','钱子韬','睿技术有限责任公司','Lx4D9IbOAE',44),(73,'制造业','朱秀英','岚贸易有限责任公司','5ZdiLcHpkN',10),(74,'制药业','韦詩涵','震南电脑有限责任公司','7IRQVqeZNF',33),(75,'贸易行业','冯秀英','向記电脑有限责任公司','a8nr9uvjgh',22),(76,'物流业','胡安琪','子韬有限责任公司','AhmBZt9Tg0',1),(77,'电讯業','龙岚','詩涵电脑有限责任公司','CeE8MilqfM',32),(78,'电子行业','秦致远','宇宁有限责任公司','Q4iCsGkGIm',12),(79,'咨询业','侯詩涵','宋有限责任公司','SEeohkKmEM',43),(80,'工程业','潘安琪','云熙电子有限责任公司','32eeEDCcrr',11),(81,'房地产业','汪詩涵','高电脑有限责任公司','SqXIQp4bwj',6),(82,'咨询业','孔致远','龙記有限责任公司','AiCUAKyw0l',18),(83,'物流业','秦宇宁','秀英技术有限责任公司','iLXvaGANyC',29),(84,'贸易行业','宋致远','宇宁玩具有限责任公司','CgtvIWHGwd',7),(85,'工业','孟杰宏','方記顾问有限责任公司','NqLYlInmpl',48),(86,'工业','龚云熙','宇宁有限责任公司','y7QfsNCLAx',11),(87,'工程业','邓震南','秀英发展贸易有限责任公司','1MXWiiRsEj',7),(88,'工程业','王嘉伦','岚食品有限责任公司','4Fyw8vHUBo',11),(89,'制造业','崔宇宁','潘物业代理有限责任公司','srGZbcCtJ0',8),(90,'电子行业','吴晓明','岚工业有限责任公司','nS8L0zvYJ1',37),(91,'贸易行业','蔡震南','王工程有限责任公司','qxtWGqcll3',5),(92,'资讯科技业','曹子韬','秀英有限责任公司','lGZ41DEEg4',22),(93,'咨询业','戴宇宁','阎記有限责任公司','YhZnNKDkVj',2),(94,'饮食业','黄詩涵','詩涵通讯有限责任公司','IJdL75s5l9',49),(95,'电子行业','秦云熙','嘉伦有限责任公司','wxOwcKWCtM',21),(96,'工程业','熊子韬','詩涵电讯有限责任公司','vbc8vODF74',44),(97,'电子行业','宋致远','蒋記有限责任公司','pXz5uaMGij',35),(98,'电子行业','石睿','于記电子有限责任公司','b55fKrZvrB',17),(99,'制造业','宋璐','宋記电脑有限责任公司','hWeRqMymNy',21),(100,'制造业','潘宇宁','何記有限责任公司','QxriK7awMz',50),(101,'电讯業','江秀英','岚发展贸易有限责任公司','3b4i08a3eO',37),(107,'工业11','郭嘉伦1','莫制药有限责任公司','hkY4JQ4JvJ12',9),(108,'工程业1','罗晓明1','秦顾问有限责任公司','kZM9MKfGrd1',26),(109,'工业1','郭嘉伦1','莫制药有限责任公司','hkY4JQ4JvJ1',9),(110,'123','123','123','123',123),(111,'11','11','11','11',11);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrow_record`
--

DROP TABLE IF EXISTS `borrow_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrow_record` (
  `record_id` int NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `book_id` int NOT NULL,
  `user_id` int NOT NULL,
  `borrow_date` date NOT NULL COMMENT '借阅日期',
  `return_date` date NOT NULL COMMENT '归还日期',
  `status` tinyint(1) NOT NULL COMMENT '1代表正在借阅，0代表已归还',
  `shiji_return_date` date DEFAULT NULL COMMENT '实际归还日期',
  PRIMARY KEY (`record_id`) USING BTREE,
  KEY `fk_book_id_idx` (`book_id`) USING BTREE,
  KEY `fk_user_id_idx` (`user_id`) USING BTREE,
  CONSTRAINT `fk_book_id` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrow_record`
--

LOCK TABLES `borrow_record` WRITE;
/*!40000 ALTER TABLE `borrow_record` DISABLE KEYS */;
INSERT INTO `borrow_record` VALUES (1,1,1,'2023-12-17','2023-12-24',0,'2023-12-17'),(2,25,22,'2023-12-17','2023-12-24',1,'2023-12-21'),(3,67,26,'2023-12-17','2023-12-24',1,'2023-12-21'),(4,32,38,'2023-12-17','2023-12-24',1,'2023-12-20'),(5,82,40,'2023-12-17','2023-12-24',1,'2023-12-20'),(7,94,15,'2023-12-17','2023-12-24',1,'2023-12-20'),(8,47,46,'2023-12-17','2023-12-24',1,'2023-12-20'),(10,62,39,'2023-12-17','2023-12-24',1,'2023-12-21'),(11,101,47,'2023-12-17','2023-12-24',1,'2023-12-20'),(13,56,9,'2023-12-17','2023-12-24',1,'2023-12-21'),(14,77,40,'2023-12-17','2023-12-24',1,'2023-12-20'),(15,17,26,'2023-12-17','2023-12-24',1,'2023-12-20'),(16,39,10,'2023-12-17','2023-12-24',0,'2023-12-21'),(17,11,13,'2023-12-17','2023-12-24',0,'2023-12-21'),(18,79,17,'2023-12-17','2023-12-24',1,'2023-12-20'),(19,59,37,'2023-12-17','2023-12-24',1,'2023-12-21'),(20,9,43,'2023-12-17','2023-12-24',0,'2023-12-20'),(21,71,37,'2023-12-17','2023-12-24',1,'2023-12-20'),(22,51,45,'2023-12-17','2023-12-24',1,'2023-12-20'),(23,40,21,'2023-12-17','2023-12-24',1,'2023-12-20'),(24,92,44,'2023-12-17','2023-12-24',1,'2023-12-21'),(25,75,10,'2023-12-17','2023-12-24',1,'2023-12-20'),(26,85,22,'2023-12-17','2023-12-24',1,'2023-12-20'),(30,9,1,'2023-12-18','2023-12-25',0,NULL),(37,8,7,'2023-12-18','2023-12-25',0,NULL),(38,2,1,'2023-12-18','2023-12-25',0,'2023-12-18'),(39,6,1,'2023-12-18','2023-12-25',0,NULL),(40,8,1,'2023-12-18','2023-12-25',0,NULL),(41,11,1,'2023-12-18','2023-12-25',0,NULL),(42,39,1,'2023-12-18','2023-12-25',0,NULL);
/*!40000 ALTER TABLE `borrow_record` ENABLE KEYS */;
UNLOCK TABLES;

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_borrow_date` BEFORE INSERT ON `borrow_record` FOR EACH ROW BEGIN
	 SET NEW.borrow_date = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `library` CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci ;

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;

/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_return_date` BEFORE INSERT ON `borrow_record` FOR EACH ROW BEGIN
    SET NEW.return_date = DATE_ADD(CURDATE(), INTERVAL 7 DAY);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `library` CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci ;

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;

/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_status` BEFORE INSERT ON `borrow_record` FOR EACH ROW BEGIN
    SET NEW.status = 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `library` CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci ;

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;

/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_shiji_return_date` BEFORE UPDATE ON `borrow_record` FOR EACH ROW BEGIN
    IF NEW.status = 0 AND OLD.status = 1 THEN
        SET NEW.shiji_return_date = CURDATE();
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `library` CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci ;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '密码',
  `name` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '姓名',
  `registration_date` date NOT NULL COMMENT '注册日期',
  `role` enum('common','admin') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'common' COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','123456hhh','吕布','2023-12-17','admin'),(2,'common','123456hhh','卢致远','2023-12-17','common'),(3,'23456','123456hhh','夏詩涵','2023-12-17','admin'),(4,'龚子异','773737','龚子异','2023-12-17','common'),(5,'姜岚','155172','姜岚','2023-12-17','common'),(6,'赵岚','791526','赵岚','2023-12-17','admin'),(7,'曹致远','988051','曹致远','2023-12-17','admin'),(8,'蔡晓明','893850','蔡晓明','2023-12-17','admin'),(9,'黎詩涵','917780','黎詩涵','2023-12-17','admin'),(10,'李睿','837659','李睿','2023-12-17','admin'),(11,'袁致远','333346','袁致远','2023-12-17','admin'),(12,'梁晓明','250519','梁晓明','2023-12-17','admin'),(13,'于睿','807227','于睿','2023-12-17','common'),(14,'金晓明','553560','金晓明','2023-12-17','admin'),(15,'邓詩涵','249028','邓詩涵','2023-12-17','common'),(16,'邹安琪','482643','邹安琪','2023-12-17','common'),(17,'孔宇宁','861350','孔宇宁','2023-12-17','common'),(18,'邵子异','657834','邵子异','2023-12-17','common'),(19,'向璐','053218','向璐','2023-12-17','admin'),(20,'姜岚','601909','姜岚','2023-12-17','common'),(21,'孔宇宁','150213','孔宇宁','2023-12-17','common'),(22,'蒋子异','880265','蒋子异','2023-12-17','admin'),(23,'夏云熙','108374','夏云熙','2023-12-17','common'),(24,'侯子韬','814828','侯子韬','2023-12-17','common'),(25,'孟晓明','313940','孟晓明','2023-12-17','common'),(26,'贾安琪','500394','贾安琪','2023-12-17','admin'),(27,'曹宇宁','415472','曹宇宁','2023-12-17','admin'),(28,'崔璐','029269','崔璐','2023-12-17','admin'),(29,'邓睿','170904','邓睿','2023-12-17','common'),(30,'熊子韬','777847','熊子韬','2023-12-17','admin'),(31,'孙杰宏','725209','孙杰宏','2023-12-17','common'),(32,'汤震南','404277','汤震南','2023-12-17','admin'),(33,'林睿','202372','林睿','2023-12-17','common'),(34,'潘秀英','651651','潘秀英','2023-12-17','admin'),(35,'黎云熙','252262','黎云熙','2023-12-17','common'),(36,'胡致远','136340','胡致远','2023-12-17','common'),(37,'袁子异','187964','袁子异','2023-12-17','admin'),(38,'崔璐','363562','崔璐','2023-12-17','admin'),(39,'段震南','715721','段震南','2023-12-17','admin'),(40,'姚嘉伦','429075','姚嘉伦','2023-12-17','common'),(41,'胡震南','291226','胡震南','2023-12-17','common'),(42,'沈致远','758807','沈致远','2023-12-17','admin'),(43,'苏杰宏','587608','苏杰宏','2023-12-17','admin'),(44,'范宇宁','233922','范宇宁','2023-12-17','common'),(45,'刘睿','439768','刘睿','2023-12-17','common'),(46,'夏安琪','537528','夏安琪','2023-12-17','common'),(47,'袁子异','638780','袁子异','2023-12-17','common'),(48,'余宇宁','962464','余宇宁','2023-12-17','common'),(49,'傅子韬','168357','傅子韬','2023-12-17','common'),(50,'田震南','231910','田震南','2023-12-17','admin'),(51,'潘秀英','010215','潘秀英','2023-12-17','admin'),(53,'123456','123456xxx5','笑死','2023-12-18','common');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;

/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_registration_date` BEFORE INSERT ON `users` FOR EACH ROW BEGIN
	SET NEW.registration_date = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `library` CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-18 18:04:08
