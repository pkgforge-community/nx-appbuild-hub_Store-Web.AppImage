-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: db
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Developers');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35),(36,1,36),(37,1,37),(38,1,38),(39,1,39),(40,1,40),(41,1,41),(42,1,42),(43,1,43),(44,1,44),(45,1,45),(46,1,46),(47,1,47),(48,1,48),(49,1,49),(50,1,50),(51,1,51),(52,1,52),(53,1,53),(54,1,54),(55,1,55),(56,1,56),(57,1,57),(58,1,58),(59,1,59),(60,1,60),(61,1,61),(62,1,62),(63,1,63),(64,1,64),(65,1,65),(66,1,66),(67,1,67),(68,1,68),(69,1,69),(70,1,70),(71,1,71),(72,1,72),(73,1,73),(74,1,74),(75,1,75),(76,1,76),(77,1,77),(78,1,78),(79,1,79),(80,1,80),(81,1,81),(82,1,82),(83,1,83),(84,1,84),(85,1,85),(86,1,86),(87,1,87),(88,1,88),(89,1,89),(90,1,90),(91,1,91),(92,1,92),(93,1,93),(94,1,94),(95,1,95),(96,1,96),(97,1,97),(98,1,98),(99,1,99),(100,1,100);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can view permission',1,'view_permission'),(5,'Can add group',2,'add_group'),(6,'Can change group',2,'change_group'),(7,'Can delete group',2,'delete_group'),(8,'Can view group',2,'view_group'),(9,'Can add user',3,'add_user'),(10,'Can change user',3,'change_user'),(11,'Can delete user',3,'delete_user'),(12,'Can view user',3,'view_user'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user dashboard module',6,'add_userdashboardmodule'),(22,'Can change user dashboard module',6,'change_userdashboardmodule'),(23,'Can delete user dashboard module',6,'delete_userdashboardmodule'),(24,'Can view user dashboard module',6,'view_userdashboardmodule'),(25,'Can add bookmark',7,'add_bookmark'),(26,'Can change bookmark',7,'change_bookmark'),(27,'Can delete bookmark',7,'delete_bookmark'),(28,'Can view bookmark',7,'view_bookmark'),(29,'Can add pinned application',8,'add_pinnedapplication'),(30,'Can change pinned application',8,'change_pinnedapplication'),(31,'Can delete pinned application',8,'delete_pinnedapplication'),(32,'Can view pinned application',8,'view_pinnedapplication'),(33,'Can add log entry',9,'add_logentry'),(34,'Can change log entry',9,'change_logentry'),(35,'Can delete log entry',9,'delete_logentry'),(36,'Can view log entry',9,'view_logentry'),(37,'Can add public page',10,'add_publicpage'),(38,'Can change public page',10,'change_publicpage'),(39,'Can delete public page',10,'delete_publicpage'),(40,'Can view public page',10,'view_publicpage'),(41,'Can add customer',11,'add_customer'),(42,'Can change customer',11,'change_customer'),(43,'Can delete customer',11,'delete_customer'),(44,'Can view customer',11,'view_customer'),(45,'Can add customer group',12,'add_customergroup'),(46,'Can change customer group',12,'change_customergroup'),(47,'Can delete customer group',12,'delete_customergroup'),(48,'Can view customer group',12,'view_customergroup'),(49,'Can add customer token',13,'add_customertoken'),(50,'Can change customer token',13,'change_customertoken'),(51,'Can delete customer token',13,'delete_customertoken'),(52,'Can view customer token',13,'view_customertoken'),(53,'Can add customer package',14,'add_customerpackage'),(54,'Can change customer package',14,'change_customerpackage'),(55,'Can delete customer package',14,'delete_customerpackage'),(56,'Can view customer package',14,'view_customerpackage'),(57,'Can add customer group package',15,'add_customergrouppackage'),(58,'Can change customer group package',15,'change_customergrouppackage'),(59,'Can delete customer group package',15,'delete_customergrouppackage'),(60,'Can view customer group package',15,'view_customergrouppackage'),(61,'Can add customer group member',16,'add_customergroupmember'),(62,'Can change customer group member',16,'change_customergroupmember'),(63,'Can delete customer group member',16,'delete_customergroupmember'),(64,'Can view customer group member',16,'view_customergroupmember'),(65,'Can add customer group invite',17,'add_customergroupinvite'),(66,'Can change customer group invite',17,'change_customergroupinvite'),(67,'Can delete customer group invite',17,'delete_customergroupinvite'),(68,'Can view customer group invite',17,'view_customergroupinvite'),(69,'Can add customer group admin',18,'add_customergroupadmin'),(70,'Can change customer group admin',18,'change_customergroupadmin'),(71,'Can delete customer group admin',18,'delete_customergroupadmin'),(72,'Can view customer group admin',18,'view_customergroupadmin'),(73,'Can add customer company member',19,'add_customercompanymember'),(74,'Can change customer company member',19,'change_customercompanymember'),(75,'Can delete customer company member',19,'delete_customercompanymember'),(76,'Can view customer company member',19,'view_customercompanymember'),(77,'Can add customer company admin',20,'add_customercompanyadmin'),(78,'Can change customer company admin',20,'change_customercompanyadmin'),(79,'Can delete customer company admin',20,'delete_customercompanyadmin'),(80,'Can view customer company admin',20,'view_customercompanyadmin'),(81,'Can add company',21,'add_company'),(82,'Can change company',21,'change_company'),(83,'Can delete company',21,'delete_company'),(84,'Can view company',21,'view_company'),(85,'Can add company invite customer',22,'add_companyinvitecustomer'),(86,'Can change company invite customer',22,'change_companyinvitecustomer'),(87,'Can delete company invite customer',22,'delete_companyinvitecustomer'),(88,'Can view company invite customer',22,'view_companyinvitecustomer'),(89,'Can add company package group',23,'add_companypackagegroup'),(90,'Can change company package group',23,'change_companypackagegroup'),(91,'Can delete company package group',23,'delete_companypackagegroup'),(92,'Can view company package group',23,'view_companypackagegroup'),(93,'Can add company package group member',24,'add_companypackagegroupmember'),(94,'Can change company package group member',24,'change_companypackagegroupmember'),(95,'Can delete company package group member',24,'delete_companypackagegroupmember'),(96,'Can view company package group member',24,'view_companypackagegroupmember'),(97,'Can add company package group package',25,'add_companypackagegrouppackage'),(98,'Can change company package group package',25,'change_companypackagegrouppackage'),(99,'Can delete company package group package',25,'delete_companypackagegrouppackage'),(100,'Can view company package group package',25,'view_companypackagegrouppackage'),(101,'Can add chunked upload',28,'add_chunkedupload'),(102,'Can change chunked upload',28,'change_chunkedupload'),(103,'Can delete chunked upload',28,'delete_chunkedupload'),(104,'Can view chunked upload',28,'view_chunkedupload'),(105,'Can add package',27,'add_package'),(106,'Can change package',27,'change_package'),(107,'Can delete package',27,'delete_package'),(108,'Can view package',27,'view_package'),(109,'Can add package group',26,'add_packagegroup'),(110,'Can change package group',26,'change_packagegroup'),(111,'Can delete package group',26,'delete_packagegroup'),(112,'Can view package group',26,'view_packagegroup'),(113,'Can add package version',30,'add_packageversion'),(114,'Can change package version',30,'change_packageversion'),(115,'Can delete package version',30,'delete_packageversion'),(116,'Can view package version',30,'view_packageversion'),(117,'Can add package request',31,'add_packagerequest'),(118,'Can change package request',31,'change_packagerequest'),(119,'Can delete package request',31,'delete_packagerequest'),(120,'Can view package request',31,'view_packagerequest'),(121,'Can add package image',32,'add_packageimage'),(122,'Can change package image',32,'change_packageimage'),(123,'Can delete package image',32,'delete_packageimage'),(124,'Can view package image',32,'view_packageimage'),(125,'Can add package group package',33,'add_packagegrouppackage'),(126,'Can change package group package',33,'change_packagegrouppackage'),(127,'Can delete package group package',33,'delete_packagegrouppackage'),(128,'Can view package group package',33,'view_packagegrouppackage'),(129,'Can add package upload',29,'add_packageupload'),(130,'Can change package upload',29,'change_packageupload'),(131,'Can delete package upload',29,'delete_packageupload'),(132,'Can view package upload',29,'view_packageupload'),(133,'Can add package comment',34,'add_packagecomment'),(134,'Can change package comment',34,'change_packagecomment'),(135,'Can delete package comment',34,'delete_packagecomment'),(136,'Can view package comment',34,'view_packagecomment');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (3,'pbkdf2_sha256$150000$4ZsHE3pzT1VR$2Bu511SHJ02hjAXa6dYEIW31kmHEU4TII7AZUlyBVdE=','2023-01-14 13:41:20.775120',1,'root','','','alex@apprepo.de',1,1,'2023-01-14 13:41:16.316629');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chunked_upload_chunkedupload`
--

DROP TABLE IF EXISTS `chunked_upload_chunkedupload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chunked_upload_chunkedupload` (
  `id` int NOT NULL AUTO_INCREMENT,
  `upload_id` varchar(32) NOT NULL,
  `file` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `offset` bigint NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `status` smallint unsigned NOT NULL,
  `completed_on` datetime(6) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `upload_id` (`upload_id`),
  KEY `chunked_upload_chunkedupload_user_id_70ff6dbf_fk_auth_user_id` (`user_id`),
  CONSTRAINT `chunked_upload_chunkedupload_user_id_70ff6dbf_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chunked_upload_chunkedupload`
--

LOCK TABLES `chunked_upload_chunkedupload` WRITE;
/*!40000 ALTER TABLE `chunked_upload_chunkedupload` DISABLE KEYS */;
/*!40000 ALTER TABLE `chunked_upload_chunkedupload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_company`
--

DROP TABLE IF EXISTS `company_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext,
  `icon` varchar(100) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `parent_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_company_parent_id_3abe3587_fk_company_company_id` (`parent_id`),
  CONSTRAINT `company_company_parent_id_3abe3587_fk_company_company_id` FOREIGN KEY (`parent_id`) REFERENCES `company_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_company`
--

LOCK TABLES `company_company` WRITE;
/*!40000 ALTER TABLE `company_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_companyinvitecustomer`
--

DROP TABLE IF EXISTS `company_companyinvitecustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_companyinvitecustomer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `text` longtext,
  `created` datetime(6) NOT NULL,
  `processed` datetime(6) DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_companyinvit_company_id_95aa6ea6_fk_company_c` (`company_id`),
  KEY `company_companyinvit_customer_id_57102794_fk_customer_` (`customer_id`),
  CONSTRAINT `company_companyinvit_company_id_95aa6ea6_fk_company_c` FOREIGN KEY (`company_id`) REFERENCES `company_company` (`id`),
  CONSTRAINT `company_companyinvit_customer_id_57102794_fk_customer_` FOREIGN KEY (`customer_id`) REFERENCES `customer_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_companyinvitecustomer`
--

LOCK TABLES `company_companyinvitecustomer` WRITE;
/*!40000 ALTER TABLE `company_companyinvitecustomer` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_companyinvitecustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_companypackagegroup`
--

DROP TABLE IF EXISTS `company_companypackagegroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_companypackagegroup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `description` varchar(300) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `company_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_companypacka_company_id_a2da6735_fk_company_c` (`company_id`),
  CONSTRAINT `company_companypacka_company_id_a2da6735_fk_company_c` FOREIGN KEY (`company_id`) REFERENCES `company_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_companypackagegroup`
--

LOCK TABLES `company_companypackagegroup` WRITE;
/*!40000 ALTER TABLE `company_companypackagegroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_companypackagegroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_companypackagegroupmember`
--

DROP TABLE IF EXISTS `company_companypackagegroupmember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_companypackagegroupmember` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_companypacka_customer_id_e15138e9_fk_customer_` (`customer_id`),
  KEY `company_companypacka_group_id_31dc5e01_fk_company_c` (`group_id`),
  CONSTRAINT `company_companypacka_customer_id_e15138e9_fk_customer_` FOREIGN KEY (`customer_id`) REFERENCES `customer_customer` (`id`),
  CONSTRAINT `company_companypacka_group_id_31dc5e01_fk_company_c` FOREIGN KEY (`group_id`) REFERENCES `company_companypackagegroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_companypackagegroupmember`
--

LOCK TABLES `company_companypackagegroupmember` WRITE;
/*!40000 ALTER TABLE `company_companypackagegroupmember` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_companypackagegroupmember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_companypackagegrouppackage`
--

DROP TABLE IF EXISTS `company_companypackagegrouppackage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_companypackagegrouppackage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `package_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_companypacka_group_id_7dd79808_fk_company_c` (`group_id`),
  KEY `company_companypacka_package_id_a05a2c60_fk_package_p` (`package_id`),
  CONSTRAINT `company_companypacka_group_id_7dd79808_fk_company_c` FOREIGN KEY (`group_id`) REFERENCES `company_companypackagegroup` (`id`),
  CONSTRAINT `company_companypacka_package_id_a05a2c60_fk_package_p` FOREIGN KEY (`package_id`) REFERENCES `package_package` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_companypackagegrouppackage`
--

LOCK TABLES `company_companypackagegrouppackage` WRITE;
/*!40000 ALTER TABLE `company_companypackagegrouppackage` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_companypackagegrouppackage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_customer`
--

DROP TABLE IF EXISTS `customer_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `invite_company_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_customer_invite_company_id_ff1ba2f5_fk_company_c` (`invite_company_id`),
  CONSTRAINT `customer_customer_invite_company_id_ff1ba2f5_fk_company_c` FOREIGN KEY (`invite_company_id`) REFERENCES `company_companyinvitecustomer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_customer`
--

LOCK TABLES `customer_customer` WRITE;
/*!40000 ALTER TABLE `customer_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_customercompanyadmin`
--

DROP TABLE IF EXISTS `customer_customercompanyadmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_customercompanyadmin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `company_id` int NOT NULL,
  `customer_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_customercom_company_id_bbb927ed_fk_company_c` (`company_id`),
  KEY `customer_customercom_customer_id_23a1e6aa_fk_customer_` (`customer_id`),
  CONSTRAINT `customer_customercom_company_id_bbb927ed_fk_company_c` FOREIGN KEY (`company_id`) REFERENCES `company_company` (`id`),
  CONSTRAINT `customer_customercom_customer_id_23a1e6aa_fk_customer_` FOREIGN KEY (`customer_id`) REFERENCES `customer_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_customercompanyadmin`
--

LOCK TABLES `customer_customercompanyadmin` WRITE;
/*!40000 ALTER TABLE `customer_customercompanyadmin` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_customercompanyadmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_customercompanymember`
--

DROP TABLE IF EXISTS `customer_customercompanymember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_customercompanymember` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `company_id` int NOT NULL,
  `customer_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_customercom_company_id_1ac06ccf_fk_company_c` (`company_id`),
  KEY `customer_customercom_customer_id_1aa17bbb_fk_customer_` (`customer_id`),
  CONSTRAINT `customer_customercom_company_id_1ac06ccf_fk_company_c` FOREIGN KEY (`company_id`) REFERENCES `company_company` (`id`),
  CONSTRAINT `customer_customercom_customer_id_1aa17bbb_fk_customer_` FOREIGN KEY (`customer_id`) REFERENCES `customer_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_customercompanymember`
--

LOCK TABLES `customer_customercompanymember` WRITE;
/*!40000 ALTER TABLE `customer_customercompanymember` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_customercompanymember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_customergroup`
--

DROP TABLE IF EXISTS `customer_customergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_customergroup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `owner_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_customergroup_owner_id_22b2c72c_fk_customer_customer_id` (`owner_id`),
  CONSTRAINT `customer_customergroup_owner_id_22b2c72c_fk_customer_customer_id` FOREIGN KEY (`owner_id`) REFERENCES `customer_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_customergroup`
--

LOCK TABLES `customer_customergroup` WRITE;
/*!40000 ALTER TABLE `customer_customergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_customergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_customergroupadmin`
--

DROP TABLE IF EXISTS `customer_customergroupadmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_customergroupadmin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `customer_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_customergro_customer_id_8c306c08_fk_customer_` (`customer_id`),
  KEY `customer_customergro_group_id_70588fa6_fk_customer_` (`group_id`),
  CONSTRAINT `customer_customergro_customer_id_8c306c08_fk_customer_` FOREIGN KEY (`customer_id`) REFERENCES `customer_customer` (`id`),
  CONSTRAINT `customer_customergro_group_id_70588fa6_fk_customer_` FOREIGN KEY (`group_id`) REFERENCES `customer_customergroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_customergroupadmin`
--

LOCK TABLES `customer_customergroupadmin` WRITE;
/*!40000 ALTER TABLE `customer_customergroupadmin` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_customergroupadmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_customergroupinvite`
--

DROP TABLE IF EXISTS `customer_customergroupinvite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_customergroupinvite` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(300) NOT NULL,
  `token` varchar(32) NOT NULL,
  `text` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `accepted` datetime(6) NOT NULL,
  `customer_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_customergro_customer_id_16eae76d_fk_customer_` (`customer_id`),
  KEY `customer_customergro_group_id_172505f4_fk_customer_` (`group_id`),
  CONSTRAINT `customer_customergro_customer_id_16eae76d_fk_customer_` FOREIGN KEY (`customer_id`) REFERENCES `customer_customer` (`id`),
  CONSTRAINT `customer_customergro_group_id_172505f4_fk_customer_` FOREIGN KEY (`group_id`) REFERENCES `customer_customergroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_customergroupinvite`
--

LOCK TABLES `customer_customergroupinvite` WRITE;
/*!40000 ALTER TABLE `customer_customergroupinvite` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_customergroupinvite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_customergroupmember`
--

DROP TABLE IF EXISTS `customer_customergroupmember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_customergroupmember` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `customer_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_customergro_customer_id_ec1e830a_fk_customer_` (`customer_id`),
  KEY `customer_customergro_group_id_d6956686_fk_customer_` (`group_id`),
  CONSTRAINT `customer_customergro_customer_id_ec1e830a_fk_customer_` FOREIGN KEY (`customer_id`) REFERENCES `customer_customer` (`id`),
  CONSTRAINT `customer_customergro_group_id_d6956686_fk_customer_` FOREIGN KEY (`group_id`) REFERENCES `customer_customergroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_customergroupmember`
--

LOCK TABLES `customer_customergroupmember` WRITE;
/*!40000 ALTER TABLE `customer_customergroupmember` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_customergroupmember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_customergrouppackage`
--

DROP TABLE IF EXISTS `customer_customergrouppackage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_customergrouppackage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `package_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_customergro_group_id_59c8c9d5_fk_customer_` (`group_id`),
  KEY `customer_customergro_package_id_93f7c226_fk_package_p` (`package_id`),
  CONSTRAINT `customer_customergro_group_id_59c8c9d5_fk_customer_` FOREIGN KEY (`group_id`) REFERENCES `customer_customergroup` (`id`),
  CONSTRAINT `customer_customergro_package_id_93f7c226_fk_package_p` FOREIGN KEY (`package_id`) REFERENCES `package_package` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_customergrouppackage`
--

LOCK TABLES `customer_customergrouppackage` WRITE;
/*!40000 ALTER TABLE `customer_customergrouppackage` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_customergrouppackage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_customerpackage`
--

DROP TABLE IF EXISTS `customer_customerpackage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_customerpackage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `package_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_customerpac_customer_id_3d748ff6_fk_customer_` (`customer_id`),
  KEY `customer_customerpac_package_id_5e2009af_fk_package_p` (`package_id`),
  CONSTRAINT `customer_customerpac_customer_id_3d748ff6_fk_customer_` FOREIGN KEY (`customer_id`) REFERENCES `customer_customer` (`id`),
  CONSTRAINT `customer_customerpac_package_id_5e2009af_fk_package_p` FOREIGN KEY (`package_id`) REFERENCES `package_package` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_customerpackage`
--

LOCK TABLES `customer_customerpackage` WRITE;
/*!40000 ALTER TABLE `customer_customerpackage` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_customerpackage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_customertoken`
--

DROP TABLE IF EXISTS `customer_customertoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_customertoken` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `created` datetime(6) NOT NULL,
  `expired` datetime(6) DEFAULT NULL,
  `customer_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_customertok_customer_id_47643b2a_fk_customer_` (`customer_id`),
  CONSTRAINT `customer_customertok_customer_id_47643b2a_fk_customer_` FOREIGN KEY (`customer_id`) REFERENCES `customer_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_customertoken`
--

LOCK TABLES `customer_customertoken` WRITE;
/*!40000 ALTER TABLE `customer_customertoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_customertoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_userdashboardmodule`
--

DROP TABLE IF EXISTS `dashboard_userdashboardmodule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_userdashboardmodule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `module` varchar(255) NOT NULL,
  `app_label` varchar(255) DEFAULT NULL,
  `user` int unsigned NOT NULL,
  `column` int unsigned NOT NULL,
  `order` int NOT NULL,
  `settings` longtext NOT NULL,
  `children` longtext NOT NULL,
  `collapsed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_userdashboardmodule`
--

LOCK TABLES `dashboard_userdashboardmodule` WRITE;
/*!40000 ALTER TABLE `dashboard_userdashboardmodule` DISABLE KEYS */;
INSERT INTO `dashboard_userdashboardmodule` VALUES (1,'Application models','jet.dashboard.modules.ModelList','package',1,0,0,'{\"models\": [\"package.*\"], \"exclude\": null}','',0),(2,'Recent Actions','jet.dashboard.modules.RecentActions','package',1,1,0,'{\"limit\": 10, \"include_list\": [\"package.*\"], \"exclude_list\": null, \"user\": null}','',0),(3,'Quick links','jet.dashboard.modules.LinkList',NULL,1,0,0,'{\"draggable\": false, \"deletable\": false, \"collapsible\": false, \"layout\": \"inline\"}','[{\"title\": \"Return to site\", \"url\": \"/\"}, {\"title\": \"Change password\", \"url\": \"/admin/password_change/\"}, {\"title\": \"Log out\", \"url\": \"/admin/logout/\"}]',0),(4,'Applications','jet.dashboard.modules.AppList',NULL,1,1,0,'{\"models\": null, \"exclude\": [\"auth.*\"]}','',0),(5,'Administration','jet.dashboard.modules.AppList',NULL,1,2,0,'{\"models\": [\"auth.*\"], \"exclude\": null}','',0),(6,'Recent Actions','jet.dashboard.modules.RecentActions',NULL,1,0,1,'{\"limit\": 10, \"include_list\": null, \"exclude_list\": null, \"user\": null}','',0),(7,'Latest Django News','jet.dashboard.modules.Feed',NULL,1,1,1,'{\"feed_url\": \"http://www.djangoproject.com/rss/weblog/\", \"limit\": 5}','',0),(8,'Support','jet.dashboard.modules.LinkList',NULL,1,2,1,'{\"draggable\": true, \"deletable\": true, \"collapsible\": true, \"layout\": \"stacked\"}','[{\"title\": \"Django documentation\", \"url\": \"http://docs.djangoproject.com/\", \"external\": true}, {\"title\": \"Django \\\"django-users\\\" mailing list\", \"url\": \"http://groups.google.com/group/django-users\", \"external\": true}, {\"title\": \"Django irc channel\", \"url\": \"irc://irc.freenode.net/django\", \"external\": true}]',0),(9,'Quick links','jet.dashboard.modules.LinkList',NULL,2,0,0,'{\"draggable\": false, \"deletable\": false, \"collapsible\": false, \"layout\": \"inline\"}','[{\"title\": \"Return to site\", \"url\": \"/\"}, {\"title\": \"Change password\", \"url\": \"/admin/password_change/\"}, {\"title\": \"Log out\", \"url\": \"/admin/logout/\"}]',0),(10,'Applications','jet.dashboard.modules.AppList',NULL,2,1,0,'{\"models\": null, \"exclude\": [\"auth.*\"]}','',0),(11,'Administration','jet.dashboard.modules.AppList',NULL,2,2,0,'{\"models\": [\"auth.*\"], \"exclude\": null}','',0),(12,'Recent Actions','jet.dashboard.modules.RecentActions',NULL,2,0,1,'{\"limit\": 10, \"include_list\": null, \"exclude_list\": null, \"user\": null}','',0),(13,'Latest Django News','jet.dashboard.modules.Feed',NULL,2,1,1,'{\"feed_url\": \"http://www.djangoproject.com/rss/weblog/\", \"limit\": 5}','',0),(14,'Support','jet.dashboard.modules.LinkList',NULL,2,2,1,'{\"draggable\": true, \"deletable\": true, \"collapsible\": true, \"layout\": \"stacked\"}','[{\"title\": \"Django documentation\", \"url\": \"http://docs.djangoproject.com/\", \"external\": true}, {\"title\": \"Django \\\"django-users\\\" mailing list\", \"url\": \"http://groups.google.com/group/django-users\", \"external\": true}, {\"title\": \"Django irc channel\", \"url\": \"irc://irc.freenode.net/django\", \"external\": true}]',0),(15,'Quick links','jet.dashboard.modules.LinkList',NULL,3,0,0,'{\"draggable\": false, \"deletable\": false, \"collapsible\": false, \"layout\": \"inline\"}','[{\"title\": \"Return to site\", \"url\": \"/\"}, {\"title\": \"Change password\", \"url\": \"/admin/password_change/\"}, {\"title\": \"Log out\", \"url\": \"/admin/logout/\"}]',0),(16,'Applications','jet.dashboard.modules.AppList',NULL,3,1,0,'{\"models\": null, \"exclude\": [\"auth.*\"]}','',0),(17,'Administration','jet.dashboard.modules.AppList',NULL,3,2,0,'{\"models\": [\"auth.*\"], \"exclude\": null}','',0),(18,'Recent Actions','jet.dashboard.modules.RecentActions',NULL,3,0,1,'{\"limit\": 10, \"include_list\": null, \"exclude_list\": null, \"user\": null}','',0),(19,'Latest Django News','jet.dashboard.modules.Feed',NULL,3,1,1,'{\"feed_url\": \"http://www.djangoproject.com/rss/weblog/\", \"limit\": 5}','',0),(20,'Support','jet.dashboard.modules.LinkList',NULL,3,2,1,'{\"draggable\": true, \"deletable\": true, \"collapsible\": true, \"layout\": \"stacked\"}','[{\"title\": \"Django documentation\", \"url\": \"http://docs.djangoproject.com/\", \"external\": true}, {\"title\": \"Django \\\"django-users\\\" mailing list\", \"url\": \"http://groups.google.com/group/django-users\", \"external\": true}, {\"title\": \"Django irc channel\", \"url\": \"irc://irc.freenode.net/django\", \"external\": true}]',0);
/*!40000 ALTER TABLE `dashboard_userdashboardmodule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=928 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (918,'2023-01-14 13:45:50.386832','58','OpenOffice',2,'[{\"changed\": {\"fields\": [\"repository\", \"description\", \"download\"]}}]',27,3),(919,'2023-01-14 14:10:24.867624','1','admin',3,'',3,3),(920,'2023-01-14 14:10:24.881493','2','alex@ergofox.me',3,'',3,3),(921,'2023-01-14 14:18:13.704342','1','alex.woroschilow@gmail.com',3,'',11,3),(922,'2023-01-14 14:22:39.619850','4','<file - upload_id: 552d7410cfe14e768223882a171927da - bytes: 76152808 - status: 2>',3,'',29,3),(923,'2023-01-14 14:22:39.635331','3','<file - upload_id: 5600c89ccabf4edf85951422927fe768 - bytes: 105 - status: 2>',3,'',29,3),(924,'2023-01-14 14:22:39.643350','2','<file - upload_id: 9d43129d829c41148baa3c24a74326a4 - bytes: 105 - status: 2>',3,'',29,3),(925,'2023-01-14 14:22:39.649661','1','<file - upload_id: d23bdac438d0489dba26f70756f4af8d - bytes: 105 - status: 2>',3,'',29,3),(926,'2023-01-14 14:22:57.124349','1','Fitbase',3,'',21,3),(927,'2023-01-14 14:23:05.551933','1','IT',3,'',23,3);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (9,'admin','logentry'),(2,'auth','group'),(1,'auth','permission'),(3,'auth','user'),(28,'chunked_upload','chunkedupload'),(21,'company','company'),(22,'company','companyinvitecustomer'),(23,'company','companypackagegroup'),(24,'company','companypackagegroupmember'),(25,'company','companypackagegrouppackage'),(4,'contenttypes','contenttype'),(11,'customer','customer'),(20,'customer','customercompanyadmin'),(19,'customer','customercompanymember'),(12,'customer','customergroup'),(18,'customer','customergroupadmin'),(17,'customer','customergroupinvite'),(16,'customer','customergroupmember'),(15,'customer','customergrouppackage'),(14,'customer','customerpackage'),(13,'customer','customertoken'),(6,'dashboard','userdashboardmodule'),(7,'jet','bookmark'),(8,'jet','pinnedapplication'),(27,'package','package'),(34,'package','packagecomment'),(26,'package','packagegroup'),(33,'package','packagegrouppackage'),(32,'package','packageimage'),(31,'package','packagerequest'),(29,'package','packageupload'),(30,'package','packageversion'),(10,'public','publicpage'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-04-04 13:07:41.422911'),(2,'auth','0001_initial','2020-04-04 13:07:41.567331'),(3,'admin','0001_initial','2020-04-04 13:07:42.088383'),(4,'admin','0002_logentry_remove_auto_add','2020-04-04 13:07:42.231613'),(5,'admin','0003_logentry_add_action_flag_choices','2020-04-04 13:07:42.240231'),(6,'contenttypes','0002_remove_content_type_name','2020-04-04 13:07:42.312403'),(7,'auth','0002_alter_permission_name_max_length','2020-04-04 13:07:42.370037'),(8,'auth','0003_alter_user_email_max_length','2020-04-04 13:07:42.387770'),(9,'auth','0004_alter_user_username_opts','2020-04-04 13:07:42.399518'),(10,'auth','0005_alter_user_last_login_null','2020-04-04 13:07:42.455050'),(11,'auth','0006_require_contenttypes_0002','2020-04-04 13:07:42.458872'),(12,'auth','0007_alter_validators_add_error_messages','2020-04-04 13:07:42.467877'),(13,'auth','0008_alter_user_username_max_length','2020-04-04 13:07:42.484050'),(14,'auth','0009_alter_user_last_name_max_length','2020-04-04 13:07:42.502422'),(15,'auth','0010_alter_group_name_max_length','2020-04-04 13:07:42.520364'),(16,'auth','0011_update_proxy_permissions','2020-04-04 13:07:42.532863'),(17,'package','0001_initial','2020-04-04 13:07:42.707261'),(18,'company','0001_initial','2020-04-04 13:07:43.128338'),(19,'customer','0001_initial','2020-04-04 13:07:43.676502'),(20,'company','0002_auto_20200404_1307','2020-04-04 13:07:44.876563'),(21,'dashboard','0001_initial','2020-04-04 13:07:45.283512'),(22,'jet','0001_initial','2020-04-04 13:07:45.357247'),(23,'jet','0002_delete_userdashboardmodule','2020-04-04 13:07:45.374378'),(24,'public','0001_initial','2020-04-04 13:07:45.402790'),(25,'sessions','0001_initial','2020-04-04 13:07:45.427464'),(26,'package','0002_auto_20200407_1841','2020-04-07 18:41:42.693390'),(27,'package','0003_auto_20200407_1843','2020-04-07 18:43:18.733811'),(31,'chunked_upload','0001_initial','2020-04-12 00:21:21.959519'),(32,'package','0004_auto_20200412_2057','2020-04-12 20:59:20.376644'),(33,'package','0005_auto_20200412_2141','2020-04-12 21:42:05.422745'),(34,'package','0006_auto_20200412_2143','2020-04-12 21:45:36.753506'),(35,'package','0007_auto_20200412_2143','2020-04-12 21:45:36.831474'),(36,'package','0008_auto_20200412_2147','2020-04-12 21:49:40.792715'),(37,'package','0009_auto_20200412_2155','2020-04-12 21:55:48.381614'),(38,'package','0010_auto_20200412_2156','2020-04-12 21:56:54.190056'),(39,'package','0011_packageversion_downloads','2020-04-14 19:21:08.235333'),(40,'package','0012_packagecomment','2020-04-27 19:47:11.565254'),(41,'customer','0002_auto_20200601_0047','2021-11-24 21:14:04.323865'),(42,'package','0013_auto_20200601_0047','2021-11-24 21:14:04.331882'),(43,'package','0014_auto_20200601_0052','2021-11-24 21:14:04.341924'),(44,'package','0015_packageupload_customer','2021-11-24 21:14:04.439122'),(45,'package','0016_remove_packageupload_customer','2021-11-24 21:14:04.705658'),(46,'package','0017_packageupload_customer','2021-11-24 21:14:04.768280'),(47,'package','0018_auto_20210818_2058','2021-11-24 21:14:04.961112'),(48,'package','0019_auto_20210820_1937','2021-11-24 21:14:05.076335'),(49,'package','0020_package_repository','2021-11-24 21:15:30.624402'),(50,'package','0021_package_download','2023-01-14 13:43:44.249746');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('eehnz26mm0t2yzgpcj29mb2u0hrdvv1m','ZTM0MmM0MzU0OTExMDU3Zjg5N2MzNmNlYWY3YWVjNGQ4YTQ5MDIwNTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzYTVjMjI2NDY0OTYwZjRhMGVmODI2ODg5M2Q0NWJkNGY5ZmZiNmFkIn0=','2023-01-28 13:41:20.784100'),('k9x1qn95480vhlz8z339k5wjf4hg6kap','NTZhYjBlN2MwMGFmYjg3MzU2YWY0ODNlYzViYWY3YmQ5NzA1MzM4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkYzdjZDllZjU2ZDkxNzEwZjg4OTdjODg3NGQ1ZTdkMDYzNWI2NzdmIn0=','2020-05-03 21:51:38.916901'),('nctu6gkny3iqru5nzvpbvck0u4a7awvj','NTZhYjBlN2MwMGFmYjg3MzU2YWY0ODNlYzViYWY3YmQ5NzA1MzM4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkYzdjZDllZjU2ZDkxNzEwZjg4OTdjODg3NGQ1ZTdkMDYzNWI2NzdmIn0=','2020-04-18 13:08:48.177231'),('nit7qcppd61b6yc0ev65vhdsd3l8sp7q','NTZhYjBlN2MwMGFmYjg3MzU2YWY0ODNlYzViYWY3YmQ5NzA1MzM4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkYzdjZDllZjU2ZDkxNzEwZjg4OTdjODg3NGQ1ZTdkMDYzNWI2NzdmIn0=','2022-10-18 20:15:14.271847'),('q1d92gjintqerd9b5c0vmeiu9r2facwe','NTZhYjBlN2MwMGFmYjg3MzU2YWY0ODNlYzViYWY3YmQ5NzA1MzM4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkYzdjZDllZjU2ZDkxNzEwZjg4OTdjODg3NGQ1ZTdkMDYzNWI2NzdmIn0=','2020-04-24 20:59:09.809863'),('uctvqjlh7jrpuay22ehwbg7s4x3rppon','ZmNkNzM5YTUyYjM5NWQwYTUxMjZiYmE0MTk1MzE5MjA5ODMwYWNmMTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NDkzMTZmZjJlNTRjNjQ5M2MwNTdlZTk3NjBiOTY1MTQzNGIwMWMzIn0=','2021-12-08 21:20:05.633297'),('xvykcqc3motwy0c918r2p44yf4o0zlwi','NTZhYjBlN2MwMGFmYjg3MzU2YWY0ODNlYzViYWY3YmQ5NzA1MzM4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkYzdjZDllZjU2ZDkxNzEwZjg4OTdjODg3NGQ1ZTdkMDYzNWI2NzdmIn0=','2020-05-17 22:23:13.219910');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jet_bookmark`
--

DROP TABLE IF EXISTS `jet_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jet_bookmark` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(200) NOT NULL,
  `title` varchar(255) NOT NULL,
  `user` int unsigned NOT NULL,
  `date_add` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jet_bookmark`
--

LOCK TABLES `jet_bookmark` WRITE;
/*!40000 ALTER TABLE `jet_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `jet_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jet_pinnedapplication`
--

DROP TABLE IF EXISTS `jet_pinnedapplication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jet_pinnedapplication` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(255) NOT NULL,
  `user` int unsigned NOT NULL,
  `date_add` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jet_pinnedapplication`
--

LOCK TABLES `jet_pinnedapplication` WRITE;
/*!40000 ALTER TABLE `jet_pinnedapplication` DISABLE KEYS */;
/*!40000 ALTER TABLE `jet_pinnedapplication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_package`
--

DROP TABLE IF EXISTS `package_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_package` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext,
  `icon` varchar(100) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `package` varchar(255) NOT NULL,
  `homepage` varchar(255) DEFAULT NULL,
  `repository` varchar(255) DEFAULT NULL,
  `download` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `package_package_name_ad012621_uniq` (`name`),
  UNIQUE KEY `package_package_package_771abf2e_uniq` (`package`),
  UNIQUE KEY `package_package_slug_c221d551_uniq` (`slug`),
  UNIQUE KEY `package_package_token_84101a34_uniq` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_package`
--

LOCK TABLES `package_package` WRITE;
/*!40000 ALTER TABLE `package_package` DISABLE KEYS */;
INSERT INTO `package_package` VALUES (1,'Firefox','<p>Mozilla Firefox, kurz Firefox genannt, ist ein freier Webbrowser des Mozilla-Projektes. Er wurde im September 2002 ver&ouml;ffentlicht. Laut StatCounter geh&ouml;rte Firefox im Juli 2019 mit einem Anteil von 8,82 Prozent an der weltweiten Internetnutzung ohne mobile Ger&auml;te zu den drei meistgenutzten Webbrowsern.</p>','package/icon/2020/04/13/182017/icon.svg','2020-04-04 13:10:29.539872','2022-10-04 20:15:38.457335','firefox','76e4fa85-940e-11ed-9827-0242ac19','Firefox.AppImage','https://bulma.io/documentation/elements/image/','https://apprepo.de/appimage/firefox','https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(2,'Chromium','Unter dem Namen Chromium wird der Großteil des Quelltextes des Webbrowsers Google Chrome unter der BSD-Lizenz als Open-Source-Projekt zur Verfügung gestellt. Das Projekt wurde am 2. September 2008 gestartet. Chromium ist nach dem chemischen Element Chrom benannt.','package/icon/2020/04/12/221544/app-svgrepo-com.svg','2020-04-04 13:16:58.271456','2020-04-13 18:28:14.607510','chromium','76e50151-940e-11ed-9827-0242ac19','Chromium.AppImage',NULL,NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(3,'Google Chrome','Google Chrome ist ein Webbrowser des US-amerikanischen Unternehmens Google LLC. Er ist seit Mai 2012 der weltweit am weitesten verbreitete Browser. Google veröffentlicht große Teile des Quelltextes von Google Chrome in dem Open-Source-Projekt Chromium.','package/icon/2020/04/12/221537/app-svgrepo-com.svg','2020-04-04 13:18:23.750818','2020-04-13 18:37:13.820709','google-chrome','76e503ec-940e-11ed-9827-0242ac19','Google-Chrome.AppImage',NULL,NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(4,'Opera','Opera ist ein kostenloser proprietärer Webbrowser. Er basierte bis einschließlich Version 12.18 auf einem eigenen HTML-Renderer. Seit der 2013 freigegebenen Version 15 nutzt er den Renderer der jeweils aktuellen Version des Webbrowsers Chromium. Opera ist für viele Plattformen verfügbar.','package/icon/2020/04/12/221531/app-svgrepo-com.svg','2020-04-04 23:45:34.406270','2020-04-14 19:42:39.736549','opera','76e50627-940e-11ed-9827-0242ac19','Opera.AppImage',NULL,NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(5,'Olive','Olive is a free non-linear video editor aiming to provide a fully-featured alternative to high-end professional video editing software.','package/icon/2020/04/12/221520/app-svgrepo-com.svg','2020-04-12 21:38:42.540684','2020-04-25 21:54:02.171655','olive','76e50848-940e-11ed-9827-0242ac19','Olive.AppImage','https://www.olivevideoeditor.org/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(6,'VLC','VLC ist ein freier und quelloffener Multimediaplayer sowie ein Framework für verschiedene Betriebssysteme, das die meisten Multimediadateien, sowie DVDs, Audio-CDs, VCDs und verschiedene Streamingprotokolle abspielt.','package/icon/2020/04/12/221953/app-svgrepo-com.svg','2020-04-12 22:19:33.150171','2020-04-14 20:09:04.077698','vlc','76e50a67-940e-11ed-9827-0242ac19','VLC.AppImage','https://www.videolan.org',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(7,'AOD-PerformanceTuner','<p>The performance tuner is a free open source program for the energy consumption fine-tuning in Linux, inspired by the powertop, and tlp. You can setup the performance schema using the gui and apply the setup to the system.</p>','package/icon/2020/04/12/222118/app-svgrepo-com.svg','2020-04-12 22:21:18.956591','2020-05-03 22:59:21.764782','N1hD5ArmP9ziHCkXejluOgWItysfwxZ0','76e50c6e-940e-11ed-9827-0242ac19','AOD-PerformanceTuner.AppImage','https://github.com/AlexWoroschilow/AOD-PerformanceTuner',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(8,'AOD-Notes','','package/icon/2020/04/12/222326/app-svgrepo-com.svg','2020-04-12 22:23:26.162404','2020-04-13 18:39:44.657631','aod-notes','76e50e73-940e-11ed-9827-0242ac19','AOD-Notes.AppImage','https://github.com/AlexWoroschilow/ApplicationNotes',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(9,'Xmind','XMind, ein voll funktionsfähiges Mindmapping- und Brainstorming-Tool, wird entwickelt, um Ideen zu generieren, Kreativität zu inspirieren und Ihnen Effizienz sowohl in der Arbeit als auch im Leben zu bringen. Zehn Millionen Menschen lieben es.','package/icon/2020/04/12/222527/app-svgrepo-com.svg','2020-04-12 22:25:27.137003','2020-04-14 19:45:30.979812','xmind','76e5106b-940e-11ed-9827-0242ac19','Xmind.AppImage','https://www.xmind.net/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(10,'DigiKam','<p><strong>digiKam</strong> is an advanced open-source digital photo management application that runs on Linux, Windows, and MacOS. The application provides a comprehensive set of tools for importing, managing, editing, and sharing photos and raw files.</p>','package/icon/2020/04/12/222650/app-svgrepo-com.svg','2020-04-12 22:26:50.632192','2020-04-26 17:37:51.339409','digikam','76e51260-940e-11ed-9827-0242ac19','DigiKam.AppImage','https://www.digikam.org/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(11,'GIMP','<p>This is the official website of the GNU Image Manipulation Program (GIMP). GIMP is a cross-platform image editor available for GNU/Linux, OS X, Windows and more operating systems. It is free software, you can change its source code and distribute your changes.&nbsp;</p>','package/icon/2020/04/12/222806/app-svgrepo-com.svg','2020-04-12 22:28:06.693652','2020-04-26 17:55:32.032362','gimp','76e51482-940e-11ed-9827-0242ac19','GIMP.AppImage','https://www.gimp.org/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(12,'Inkscape','Inkscape is a professional vector graphics editor for Linux, Windows and macOS. It\'s free and open source.','package/icon/2020/04/12/222916/app-svgrepo-com.svg','2020-04-12 22:29:10.125600','2020-04-14 20:05:37.720583','inkscape','76e51703-940e-11ed-9827-0242ac19','Inkscape.AppImage','https://inkscape.org/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(13,'Krita','Krita is a professional FREE and open source painting program. It is made by artists that want to see affordable art tools for everyone.','package/icon/2020/04/12/223043/app-svgrepo-com.svg','2020-04-12 22:30:43.633587','2020-04-14 21:29:06.201019','krita','76e518e3-940e-11ed-9827-0242ac19','Krita.AppImage','https://krita.org',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(14,'Thunderbird','Thunderbird makes email better for you, bringing together speed, privacy and the latest technologies.','package/icon/2020/04/12/223330/app-svgrepo-com.svg','2020-04-12 22:33:30.100582','2020-04-14 19:38:41.390316','thunderbird','76e51ac5-940e-11ed-9827-0242ac19','Thunderbird.AppImage','https://www.thunderbird.net',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(15,'Thunderbird-Beta','Thunderbird makes email better for you, bringing together speed, privacy and the latest technologies.','package/icon/2020/04/12/223455/app-svgrepo-com.svg','2020-04-12 22:34:55.204880','2020-04-14 19:38:06.093438','thunderbird-beta','76e51e0c-940e-11ed-9827-0242ac19','Thunderbird-Beta.AppImage','https://www.thunderbird.net',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(16,'AOD-Dictionary','This is a free open source dictionary program for linux.\r\n\r\nThe first version used the stardict dictionary format but then i decided to switch to the simple sqlite db for the dictionaries.\r\n\r\nThere are a converter to actually convert the stardict format to sqlite - db (currently broken)','package/icon/2020/04/12/223600/app-svgrepo-com.svg','2020-04-12 22:36:00.324041','2020-04-25 21:56:41.179467','aod-dictionary','76e51fa0-940e-11ed-9827-0242ac19','AOD-Dictionary.AppImage','https://github.com/AlexWoroschilow/AOD-Dictionary',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(17,'Android-Studio','Android Studio provides the fastest tools for building apps on every type of Android device.','package/icon/2020/04/12/223740/app-svgrepo-com.svg','2020-04-12 22:37:40.002552','2020-04-14 19:54:16.921514','android-studio','76e5213b-940e-11ed-9827-0242ac19','Android-Studio.AppImage','https://developer.android.com/studio',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(18,'Atom','A hackable text editor for the 21st Century','package/icon/2020/04/12/223853/app-svgrepo-com.svg','2020-04-12 22:38:53.072042','2020-04-14 23:00:40.556764','atom','76e52357-940e-11ed-9827-0242ac19','Atom.AppImage','https://atom.io/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(19,'CLion','Dank nativer Unterstützung für C und C++, einschließlich moderner C++ Standards, libc++ und Boost, kennt CLion Ihren Code in- und auswendig und kümmert sich um die Routine, während Sie sich auf die wichtigen Dinge konzentrieren.','package/icon/2020/04/12/224805/app-svgrepo-com.svg','2020-04-12 22:48:05.255686','2020-04-14 19:55:40.935411','3NIvibZwXKEjmyO5qpcgon2stC19MhG8','76e525a3-940e-11ed-9827-0242ac19','CLion.AppImage','https://www.jetbrains.com/de-de/clion/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(20,'DBeaver','<p>Free multi-platform database tool for developers, database administrators, analysts and all people who need to work with databases. Supports all popular databases: MySQL, PostgreSQL, SQLite, Oracle, DB2, SQL Server, Sybase, MS Access, Teradata, Firebird, Apache Hive, Phoenix, Presto, etc.</p>','package/icon/2020/04/12/224902/app-svgrepo-com.svg','2020-04-12 22:49:02.153408','2021-11-24 21:23:21.329382','dbeaver','76e52751-940e-11ed-9827-0242ac19','DBeaver.AppImage','https://dbeaver.io/','https://github.com/area-of-dev/DBeaver.Appimage','https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(21,'Eclipse for PHP Developers','The PHP IDE project delivers a PHP Integrated Development Environment framework for the Eclipse platform. This project encompasses the development components necessary to develop PHP-based Web Applications and facilitates extensibility. It leverages the existing Web Tools Project in providing developers with PHP capabilities.','package/icon/2020/04/12/225039/app-svgrepo-com.svg','2020-04-12 22:50:39.130058','2020-04-14 20:35:40.846227','eclipse-pdt','76e5292e-940e-11ed-9827-0242ac19','Eclipse-PDT.AppImage','https://www.eclipse.org/pdt/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(22,'Eclipse IDE for C Developers','The CDT Project provides a fully functional C and C++ Integrated Development Environment based on the Eclipse platform. Features include: support for project creation and managed build for various toolchains, standard make build, source navigation, various source knowledge tools, such as type hierarchy, call graph, include browser, macro definition browser, code editor with syntax highlighting, folding and hyperlink navigation, source code refactoring and code generation, visual debugging tools, including memory, registers, and disassembly viewers.','package/icon/2020/04/12/225129/app-svgrepo-com.svg','2020-04-12 22:51:29.155183','2020-04-14 20:37:37.221960','eclipse-cdt','76e52d01-940e-11ed-9827-0242ac19','Ecliupse-CDT.AppImage','https://www.eclipse.org/cdt/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(23,'Eclipse IDE for Java Developers','The JDT project provides the tool plug-ins that implement a Java IDE supporting the development of any Java application, including Eclipse plug-ins. It adds a Java project nature and Java perspective to the Eclipse Workbench as well as a number of views, editors, wizards, builders, and code merging and refactoring tools. The JDT project allows Eclipse to be a development environment for itself.','package/icon/2020/04/12/225223/app-svgrepo-com.svg','2020-04-12 22:52:23.958633','2020-04-15 19:47:53.872424','eclipse-jdt','76e52ec4-940e-11ed-9827-0242ac19','Eclipse-JDT.AppImage','https://www.eclipse.org/jdt/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(24,'Insomnia','Debug APIs like a human, not a robot. Finally, a REST client you\'ll love','package/icon/2020/04/12/225417/app-svgrepo-com.svg','2020-04-12 22:54:17.691808','2020-04-15 19:49:53.936778','insomnia','76e5319e-940e-11ed-9827-0242ac19','Insomnia.AppImage','https://insomnia.rest/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(25,'MongoDB-Compass','The GUI for MongoDB. Visually explore your data. Run ad hoc queries in seconds. Interact with your data with full CRUD functionality. View and optimize your query performance. Available on Linux, Mac, or Windows. Compass empowers you to make smarter decisions about indexing, document validation, and more.','package/icon/2020/04/12/225547/app-svgrepo-com.svg','2020-04-12 22:55:47.220977','2020-04-14 20:16:02.718935','mongodb-compass','76e533cd-940e-11ed-9827-0242ac19','MongoDB-Compass.AppImage','https://www.mongodb.com/products/compass',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(26,'NetBeans','Apache NetBeans\r\nFits the Pieces Together\r\n\r\nQuickly and easily develop desktop, mobile, and web applications\r\nwith Java, JavaScript, HTML5, PHP, C/C++ and more.\r\n\r\nApache NetBeans is free and open source and is governed by the Apache Software Foundation.','package/icon/2020/04/12/225636/app-svgrepo-com.svg','2020-04-12 22:56:36.930886','2020-04-15 19:52:03.328259','netbeans','76e53548-940e-11ed-9827-0242ac19','NetBeans.AppImage','https://netbeans.org/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(27,'Pencil','An open-source GUI prototyping tool that\'s available for ALL platforms.\r\n\r\nPencil is built for the purpose of providing a free and open-source GUI prototyping tool that people can easily install and use to create mockups in popular desktop platforms.\r\n\r\nThe latest stable version of Pencil is 3.1.0 which contains stability fixes and many new features. More details can befound in the releaste notes.','package/icon/2020/04/12/225729/app-svgrepo-com.svg','2020-04-12 22:57:29.508593','2020-04-14 21:26:23.434897','pencil','76e537eb-940e-11ed-9827-0242ac19','Pencil.AppImage','https://pencil.evolus.vn/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(28,'PhpStorm','PhpStorm ist eine PHP-IDE, die Ihren Code wirklich versteht. Sie unterstützt PHP 5.3/5.4/5.5/5.6/7.0/7.1/7.2, bietet Fehlerbehebung in Echtzeit, bestmögliche Autovervollständigung und Code-Refaktorierung, konfigurationsfreies Debugging und einen erweiterten Editor für HTML, CSS und JavaScript.','package/icon/2020/04/12/225835/app-svgrepo-com.svg','2020-04-12 22:58:35.425982','2020-04-15 19:55:38.490896','phpstorm','76e53a35-940e-11ed-9827-0242ac19','PhpStorm.AppImage','https://www.jetbrains.com/de-de/phpstorm/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(29,'PyCharm-Community','<p>Die Python-IDE f&uuml;r professionelle Entwickler</p>','package/icon/2020/04/12/230006/app-svgrepo-com.svg','2020-04-12 23:00:06.112039','2020-05-04 20:18:20.849532','pucharm-community','76e53ced-940e-11ed-9827-0242ac19','PyCharm-Community.AppImage','https://www.jetbrains.com/de-de/pycharm/download/#section=linux',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(30,'RubyMine','Die intelligenteste IDE für Ruby und Rails','package/icon/2020/04/12/230111/app-svgrepo-com.svg','2020-04-12 23:01:11.043235','2020-04-15 20:45:36.225759','rubymine','76e53e67-940e-11ed-9827-0242ac19','RubyMine.AppImage','https://www.jetbrains.com/de-de/ruby/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(31,'SP-Flash-Tool','SP flash tool is an application which mainly helps you to flash Stock ROM, Custom recovery and fixing in some extreme cases ( firmware update, Flash recovery, unbrick bricked Android device etc.). SmartPhone FlashTool is working with MediaTek Android smartphones (MTK based) You can Download SPFlashTool from our downloading section. You need to load scatter file for MTK based device for functioning.','package/icon/2020/04/12/230202/app-svgrepo-com.svg','2020-04-12 23:02:02.276540','2020-04-14 20:20:35.116655','sp-flash-tool','76e540f8-940e-11ed-9827-0242ac19','SP-Flash-Tool.AppImage','https://spflashtool.com/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(32,'SQLiteStudio','SQLiteStudio is a SQLite database manager with the following features:\r\n\r\n    Portable - no need to install or uninstall. Just download, unpack and run.\r\n    Intuitive interface,\r\n    Powerful, yet light and fast,\r\n    All SQLite3 and SQLite2 features wrapped within simple GUI,','package/icon/2020/04/12/230319/app-svgrepo-com.svg','2020-04-12 23:03:19.622007','2020-04-14 20:18:05.234595','sqlite-studio','76e543af-940e-11ed-9827-0242ac19','SQLiteStudio.AppImage','https://sqlitestudio.pl',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(33,'Sublime Text','A sophisticated text editor for code, markup and prose','package/icon/2020/04/12/230434/app-svgrepo-com.svg','2020-04-12 23:04:34.340575','2020-04-14 22:54:10.608498','sublime-text','76e54625-940e-11ed-9827-0242ac19','Sublime-Text.AppImage','https://www.sublimetext.com/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(34,'VSCode','Code editing. Redefined. Free. Built on open source. Runs everywhere.','package/icon/2020/04/12/230527/app-svgrepo-com.svg','2020-04-12 23:05:27.754578','2020-04-14 22:59:01.268630','vscode','76e6ded1-940e-11ed-9827-0242ac19','VSCode.AppImage','https://code.visualstudio.com/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(35,'WebStorm','Die raffinierteste JavaScript-IDE','package/icon/2020/04/12/230613/app-svgrepo-com.svg','2020-04-12 23:06:13.761131','2020-04-15 19:57:42.812111','webstorm','76e6e48f-940e-11ed-9827-0242ac19','WebStorm.AppImage','https://www.jetbrains.com/de-de/webstorm/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(36,'Telegram','<p>Our apps are open source and support reproducible builds. This means that anyone can independently verify that our code on GitHub is the exact same code that was used to build the apps you download from App Store or Google Play.</p>','package/icon/2020/04/12/230850/app-svgrepo-com.svg','2020-04-12 23:08:50.417537','2020-04-26 17:53:23.806806','telegram','76e6e781-940e-11ed-9827-0242ac19','Telegram.AppImage','https://telegram.org/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(37,'Skype','Skype macht es einfach, in Kontakt zu bleiben\r\nSprechen. Chatten. Zusammenarbeiten.','package/icon/2020/04/12/230944/app-svgrepo-com.svg','2020-04-12 23:09:44.575822','2020-04-14 19:48:01.751948','skype','76e6eb7e-940e-11ed-9827-0242ac19','Skype.AppImage','https://www.skype.com',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(38,'Mattermost','High Trust Messaging for the Enterprise\r\n\r\nMattermost is a flexible, open source messaging platform\r\nthat enables secure team collaboration','package/icon/2020/04/12/231036/app-svgrepo-com.svg','2020-04-12 23:10:36.203280','2020-04-14 19:34:56.518319','mattermost','76e6edbb-940e-11ed-9827-0242ac19','Mattermost.AppImage','https://mattermost.com/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(39,'Audacity','Audacity ist kostenlos. Dies beeinflusst die Qualität von Audacity jedoch keineswegs negativ. Mit Audacity erhalten Sie ein Premiumprodukt, das von Profis entwickelt und im Laufe der Zeit ständig optimiert wurde. Audacity ist ein vollwertiges Tonstudio für den Heimrechner, ernsthafte Konkurrenz sucht man vergeblich!','package/icon/2020/04/12/231156/app-svgrepo-com.svg','2020-04-12 23:11:56.181537','2020-04-14 20:12:17.784244','audacity','76e6f00f-940e-11ed-9827-0242ac19','Audacity.AppImage','https://www.audacity.de/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(40,'RStudio','RStudio ist eine vom Unternehmen RStudio, Inc. angebotene, integrierte Entwicklungsumgebung und grafische Benutzeroberfläche für die statistische Programmiersprache R. RStudio ist sowohl als lokale Desktop-Version als auch als Server-Version mit gleichem Layout verfügbar.','package/icon/2020/04/14/202553/app-svgrepo-com.svg','2020-04-14 20:25:53.007770','2020-04-14 20:29:37.849995','rstudio','76e6f183-940e-11ed-9827-0242ac19','RStudio.AppDir',NULL,NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(41,'LibreOffice','LibreOffice ist eine freie Zusammenstellung typischer Standardsoftware für Bürotätigkeiten. Zu LibreOffice gehören Programme für Textverarbeitung, Tabellenkalkulation, Präsentation und zum Erstellen von Zeichnungen. Ein Datenbankmanagementsystem und ein Formeleditor sind ebenfalls enthalten.','package/icon/2020/04/14/205100/app-svgrepo-com.svg','2020-04-14 20:51:00.590846','2020-04-14 20:53:18.361057','librefffice','76e6f2fc-940e-11ed-9827-0242ac19','LibreOffice.AppImage','https://libreoffice.org',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(42,'WPS Office','WPS Office ist ein Office-Paket für Apple iOS, Windows, MacOS, Android und Linux. Das Officepaket ist in seiner Bedienbarkeit eng an Microsoft Office angelehnt und bietet eine Reihe der Funktionalitäten und Dateiformate der aktuellen Microsoft-Office-Pakete an.','package/icon/2020/04/14/205508/app-svgrepo-com.svg','2020-04-14 20:55:08.462289','2020-04-14 20:55:47.236526','wps-office','76e6f58d-940e-11ed-9827-0242ac19','WPS-Office.AppImage','https://www.wps.com/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(43,'OnlyOffice','OnlyOffice ist ein Open-Source-Office-Paket, das von Ascensio System mit Hauptsitz in Riga, Lettland, entwickelt wurde. Die Lösung umfasst Online-Dokumenten-Editoren, Plattform für Dokumenten- und Projektmanagement, CRM-System und E-Mail-Client.','package/icon/2020/04/14/205735/app-svgrepo-com.svg','2020-04-14 20:57:35.171752','2020-04-14 20:58:09.734640','onlyoffice','76e6f761-940e-11ed-9827-0242ac19','OnlyOffice.AppImage','https://www.onlyoffice.com/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(44,'Tor','Tor ist ein Netzwerk zur Anonymisierung von Verbindungsdaten. Es wird für TCP-Verbindungen eingesetzt und kann beispielsweise im Internet für Browsing, Instant Messaging, IRC, SSH, E-Mail oder P2P benutzt werden. Tor schützt seine Nutzer vor der Analyse des Datenverkehrs. Es basiert auf der Idee des Onion-Routings.','package/icon/2020/04/14/210600/app-svgrepo-com.svg','2020-04-14 21:06:00.824354','2020-04-14 21:08:05.164820','tor','76e6fae0-940e-11ed-9827-0242ac19','Tor.AppImage','https://www.torproject.org',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(45,'Vivaldi','Vivaldi ist ein kostenloser Webbrowser des norwegischen Unternehmens Vivaldi Technologies, das Jon Stephenson von Tetzchner, Mitgründer und langjähriger Leiter von Opera Software, nach seinem Ausscheiden dort zur Entwicklung eines neuen Browsers 2013 gründete.','package/icon/2020/04/14/210935/app-svgrepo-com.svg','2020-04-14 21:09:35.782068','2020-04-14 21:11:01.479415','vivaldi','76e70083-940e-11ed-9827-0242ac19','Vivaldi.AppImage','https://vivaldi.com',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(46,'draw.io','diagrams.net is free online diagram software for making flowcharts, process diagrams, org charts, UML, ER and network diagrams.','package/icon/2020/04/14/211307/app-svgrepo-com.svg','2020-04-14 21:13:07.759890','2020-04-14 21:14:06.439460','drawio','76e70300-940e-11ed-9827-0242ac19','DrawIo.AppImage','https://app.diagrams.net/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(47,'Pinta','Pinta is a free, open source program for drawing and image editing.\r\n\r\nIts goal is to provide users with a simple yet powerful way to draw and manipulate images on Linux, Mac, Windows, and *BSD.','package/icon/2020/04/14/213239/app-svgrepo-com.svg','2020-04-14 21:32:39.769322','2020-04-14 21:37:19.208363','pinta','76e704dc-940e-11ed-9827-0242ac19','Pinta.AppImage','https://pinta-project.com',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(48,'Gravit','Gravit is a quite impressive vector graphics editor for Linux and other platforms. It is a full-featured vector design app that can be used for screen designs, high-quality icons, illustrations, printing, presentation, prototyping, and animation.\r\n\r\nWith an easy and clean interface, Gravit is one of the favorites for vector design applications.\r\n\r\nWith a modern and clean interface, Gravit is one of the latest favorite tools for Graphic designers. However, it is not an open-source solution.','package/icon/2020/04/14/213957/app-svgrepo-com.svg','2020-04-14 21:39:57.327513','2020-04-14 21:42:06.714317','gravit','76e70616-940e-11ed-9827-0242ac19','Gravit.AppImage','https://www.designer.io',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(50,'MindMaster','Needs registration!!! \r\nMindMaster is a cross-platform mind mapping software, which has various themes and multiple functions and allows users to create content-organized and style-rich mind maps on Mac for a vairety of purposes like brainstorming, project management, knowledge management, business presentation, etc.','package/icon/2020/04/14/215302/app-svgrepo-com.svg','2020-04-14 21:53:02.807344','2020-04-25 08:31:59.286639','mindmaster','76e708a8-940e-11ed-9827-0242ac19','MindMaster.AppImage','https://www.edrawsoft.com/download-mindmaster.html',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(51,'Blender','Blender is the free and open source 3D creation suite. It supports the entirety of the 3D pipeline—modeling, rigging, animation, simulation, rendering, compositing and motion tracking, video editing and 2D animation pipeline.','package/icon/2020/04/14/220336/app-svgrepo-com.svg','2020-04-14 22:03:36.719066','2020-04-14 22:05:03.743383','blender','76e709c5-940e-11ed-9827-0242ac19','Blender.AppImage','https://www.blender.org/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(52,'Synfig Studio','<p>Synfig is well known for 2D animation, is open source and free vector graphics editor on the Linux platform. It is widely used for creating stunning animation with a timeline and keyframe moreover; it paves the way of transporting it very easily. Because of using its format; simply there is a little complexity to export the SVG files. There are some formats thus; transforming from SVG to synfig, not a barrier.</p>','package/icon/2020/04/14/220715/app-svgrepo-com.svg','2020-04-14 22:07:15.847283','2020-04-27 19:49:54.740525','synfig-studio','76e70adf-940e-11ed-9827-0242ac19','Synfig-Studio.AppImage','https://www.synfig.org/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(53,'Bloom Image Editor','<p>Bloom image editor is previously known as Ormr that can integrate seamlessly vector graphics and raster. It is capable of editing and automatically converting between these two forms if it is required. This feature has made it extremely versatile and effective for different tasks from interface design to image retouching. Moreover; it facilitates applying raster effects and filters purely to vector shapes without missing any vector data.</p>','package/icon/2020/04/14/221233/app-svgrepo-com.svg','2020-04-14 22:12:33.921495','2020-04-27 19:50:14.854791','bloom','76e70c2f-940e-11ed-9827-0242ac19','Bloom.AppImage','https://www.thebloomapp.com/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(54,'Brackets','Brackets is a modern free and open source code editor created by Adobe with a focus on web development. It is written in HTML, CSS, and JavaScript to offer web developers with a rich code editing experience with the ability to extend its native features using several free extensions.','package/icon/2020/04/14/224626/app-svgrepo-com.svg','2020-04-14 22:46:26.998163','2020-04-14 22:48:41.937943','brackets','76e70e64-940e-11ed-9827-0242ac19','Brackets.AppImage','http://brackets.io/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(55,'LightTable','build is broken\r\n\r\nLight Table is a powerful, clutter-free cross-platform text editor built to be customizable enough to be used in any that its user chooses.','package/icon/2020/04/14/225033/app-svgrepo-com.svg','2020-04-14 22:50:33.691488','2020-04-25 08:29:40.666646','lighttable','76e7101f-940e-11ed-9827-0242ac19','LightTable.AppImage','http://lighttable.com/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(56,'RawTherapee','RawTherapee is a free and open source photo editor for optimizing digital images. It is feature rich and powerful when you need quality digital images from RAW image files. RAW files can be modified and then saved in compressed formats as well.','package/icon/2020/04/14/230407/app-svgrepo-com.svg','2020-04-14 23:04:07.817674','2020-04-14 23:05:23.021964','rawtherapee','76e7111b-940e-11ed-9827-0242ac19','RawTherapee.AppImage','https://rawtherapee.com/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(57,'Darktable','Missed libs <br/>\r\ndarktable is an open source photography workflow application and raw developer. A virtual lighttable and darkroom for photographers. It manages your digital negatives in a database, lets you view them through a zoomable lighttable and enables you to develop raw images and enhance them.','package/icon/2020/04/14/231037/app-svgrepo-com.svg','2020-04-14 23:10:37.654695','2020-04-21 21:10:49.211830','darktable','76e712d8-940e-11ed-9827-0242ac19','Darktable.AppImage','https://www.darktable.org/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(58,'OpenOffice','<p>OpenOffice has quite a lot in common with LibreOffice given that they share the same underlying code. Development on OpenOffice has somewhat lagged behind LibreOffice particularly because of its slow development cycle which was one of the main reasons LibreOffice broke off from them back in the day, however, OpenOffice remains a viable alternative with many of the functions available in LibreOffice and many years of development work.</p>','package/icon/2020/04/14/232119/app-svgrepo-com.svg','2020-04-14 23:21:19.590861','2023-01-14 13:45:50.373617','openoffice','76e713d4-940e-11ed-9827-0242ac19','OpenOffice.AppImage','http://www.openoffice.org/','https://github.com/area-of-dev/OpenOffice.AppImage','https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(59,'Foxit-Reader','It is a cross platform, small and fast secure PDF reader. The latest version as of this writing is Foxit reader 7 which offers some security features that protect against vulnerabilities.','package/icon/2020/04/14/232333/app-svgrepo-com.svg','2020-04-14 23:23:33.453689','2020-04-23 20:50:59.072609','foxit-reader','76e71636-940e-11ed-9827-0242ac19','Foxit-Reader.AppImage','https://www.foxitsoftware.com/de/pdf-reader/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(60,'Master PDF Editor','Master PDF Editor is straightforward, easy to use application for working with PDF documents equipped with powerful multi-purpose functionality. With Master PDF Editor you can easily view, create and modify PDF documents. The application enables you to merge several files into one, split a source document into multiple documents, and also to comment, sign and encrypt PDF files.','package/icon/2020/04/14/232522/app-svgrepo-com.svg','2020-04-14 23:25:22.784786','2020-04-23 21:06:56.787748','master-pdf-editor','76e71856-940e-11ed-9827-0242ac19','Master-PDF-Editor.AppImage','https://code-industry.net/masterpdfeditor/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(61,'Mixxx','This is a music mixing software that can help you become a professional DJ. It is available on Linux, Mac OS X, and Windows. It can help you test your audio after complete production by mixing it with other audio files while listening to it.\r\n\r\nTherefore having it in a studio can be so helpful just in case the user is also a sound producer.','package/icon/2020/04/14/232817/app-svgrepo-com.svg','2020-04-14 23:28:17.885061','2020-04-14 23:30:55.729800','mixxx','76e71bb6-940e-11ed-9827-0242ac19','Mixxx.AppImage','https://www.mixxx.org/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(62,'Ardour','It is available on Linux and Mac OS X and allows you to record, edit, mix and master audio and MIDI projects. It can be used by musicians, soundtrack editors, and composers.','package/icon/2020/04/14/233152/app-svgrepo-com.svg','2020-04-14 23:31:52.547124','2020-04-14 23:32:56.902030','ardour','76e71dc2-940e-11ed-9827-0242ac19','Ardour.AppImage','https://ardour.org/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(63,'Hydrogen Drum Machine','Need to build from source!!!!\r\n\r\nIt is an advanced drum sampler developed for Linux and Mac OS X operating systems though it is still experimental in OS X.','package/icon/2020/04/14/233600/app-svgrepo-com.svg','2020-04-14 23:36:00.094370','2020-04-26 08:05:47.722462','hydrogen','76e7200f-940e-11ed-9827-0242ac19','Hydrogen.AppImage','http://hydrogen-music.org/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(64,'Guitarix','Need to build it from the sources!!!!!\r\n\r\nThis is a virtual guitar amplifier and is available on Linux but can be built to work on BSD and Mac OS X. It runs on the Jack audio connection kit and works by taking a signal from a guitar and processes it mono amp and a rack section. It also has in-built modules to allow you to add effects to the rack.','package/icon/2020/04/14/233735/app-svgrepo-com.svg','2020-04-14 23:37:35.602721','2020-04-26 08:08:11.312721','guitarix','76e722b2-940e-11ed-9827-0242ac19','Guitarix.AppImage','http://guitarix.org/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(65,'Qtractor','It is an audio Audio/MIDI multi-track sequencer designed specifically for personal home studios. It runs on Linux as the target operating system.','package/icon/2020/04/14/234209/app-svgrepo-com.svg','2020-04-14 23:42:09.451406','2020-04-14 23:43:34.510629','qtractor','76e7247e-940e-11ed-9827-0242ac19','Qtractor.AppImage','https://qtractor.sourceforge.io/qtractor-index.html',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(66,'LMMS','LMMS (Let’s Make Music) is a free, open-source and cross-platform software for making music on your computer, made by musicians, for musicians. It comes with a user-friendly and modern interface.\r\n\r\nLMMS also comes with playback instruments, samples, and plugins. It is bundled with ready-to-use content such as a collection of instrument and effect plugins, presets and samples to VST and SoundFont support.','package/icon/2020/04/14/234415/app-svgrepo-com.svg','2020-04-14 23:44:15.305444','2020-04-14 23:46:48.222200','lmms','76e7b3fa-940e-11ed-9827-0242ac19','LMMS.AppImage','https://lmms.io/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(67,'MuseScore','MuseScore is also a free, open-source and easy to use, yet powerful tool for creating, playing and printing beautiful sheet music. It supports input via the MIDI keyboard and also supports exporting to and from other programs via MusicXML, MIDI and more.','package/icon/2020/04/14/234749/app-svgrepo-com.svg','2020-04-14 23:47:49.605972','2020-04-14 23:49:44.885761','ETbFJou5dizUp3xOeIl6vNhfwGkVct7Z','76e7b5cd-940e-11ed-9827-0242ac19','MuseScore.AppImage','https://musescore.org',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(68,'Renoise','Renoise is a cross-platform Digital Audio Workstation with a unique top-down approach to music composition known as a tracker interface. Already known to be a very feature-complete software, version 3 improves on core features such as the native sampler and instrument.','package/icon/2020/04/14/235028/app-svgrepo-com.svg','2020-04-14 23:50:28.796573','2020-04-26 08:52:27.849156','renoise','76e7b730-940e-11ed-9827-0242ac19','Renoise.AppImage','https://www.renoise.com/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(69,'Virtual DJ','Wine is required!!!!\r\n\r\nVirtual DJ is a premium, powerful, widely used, feature-rich and highly-configurable music mixing software. Many DJ hardware devices such as those from ‘Pioneer’ include built-in support for ‘Virtual DJ’. Unfortunately, the Virtual DJ is designed to run on Windows and Mac OS X only.\r\n\r\nTo run a Virtual DJ on GNU/Linux, you can use Wine, a tool that lets you run some of MS Windows software on GNU/Linux.','package/icon/2020/04/14/235616/app-svgrepo-com.svg','2020-04-14 23:56:16.432641','2020-04-26 09:16:35.576100','virtual-dj','76e7b84e-940e-11ed-9827-0242ac19','Virtual-DJ.AppImage','https://www.virtualdj.com/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(70,'KDEnlive','Kdenlive is another open source video editing software. It relies on few other projects such as FFmpeg and MLT video framework. It is designed to cover basic needs to semi-professional tasks.','package/icon/2020/04/15/000048/app-svgrepo-com.svg','2020-04-15 00:00:48.807542','2020-04-25 21:54:27.697640','kdenlive','76e7b971-940e-11ed-9827-0242ac19','KDEnlive.AppImage','https://kdenlive.org/de/download-de/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(71,'Lightworks','Lightworks is a professional video editing tool designed for everyone. It has a free and paid version, both of which are quite feature rich. It’s multi-platform and can be used on Linux, Windows and Mac. It has plenty of features that you can use.','package/icon/2020/04/15/000207/app-svgrepo-com.svg','2020-04-15 00:02:07.498619','2020-04-25 21:54:34.871556','lightworks','76e7bc0d-940e-11ed-9827-0242ac19','Lightworks.AppImage','https://www.lwks.com/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(72,'WhatsApp','<div class=\"_2zi1\">\r\n<p>Mit <strong>WhatsApp</strong> ist Nachrichtenaustausch und Telefonieren schnell, einfach und sicher, und zwar&nbsp;<span class=\"\">kostenlos<sup>*</sup>,</span>&nbsp;und auf Telefonen rund um die Welt verf&uuml;gbar.</p>\r\n</div>','package/icon/2020/04/15/002242/app-svgrepo-com.svg','2020-04-15 00:22:42.382308','2020-04-26 17:52:45.932582','whatsapp','76e7bd8a-940e-11ed-9827-0242ac19','WhatsApp.AppImage',NULL,NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(73,'Viber','Viber is a VoIP application and Skype contender – it offers text, audio, gif, and video services as well as Unity integration.','package/icon/2020/04/15/002408/app-svgrepo-com.svg','2020-04-15 00:24:08.686190','2020-04-26 11:48:43.214531','viber','76e7c02e-940e-11ed-9827-0242ac19','Viber.AppImage','https://www.viber.com/de/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(74,'Wire','Wire is arguably the best instant messaging app available for Linux. It is a free and Open Source VoIP application with top-notch features including gif support, HD group calls, and audio filters, among others.','package/icon/2020/04/15/002529/app-svgrepo-com.svg','2020-04-15 00:25:29.584168','2020-04-26 11:52:41.676625','wire','76e7c1bb-940e-11ed-9827-0242ac19','Wire.AppImage','https://wire.com/de/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(75,'Slack','Slack is the messaging app almost every startup company in the world uses because it is ideal for team communication and collaboration.','package/icon/2020/04/15/002637/app-svgrepo-com.svg','2020-04-15 00:26:37.419504','2020-04-26 11:54:58.473556','slack','76e7c3db-940e-11ed-9827-0242ac19','Slack.AppImage','https://slack.com',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(76,'RetroShare','RetroShare is a completely decentralized app for sending files, emails, and multimedia messages. It is decentralized in the sense that it has no central servers as it is based on a peer-to-peer network built on GPG IGNU Privacy Guard).','package/icon/2020/04/15/002734/app-svgrepo-com.svg','2020-04-15 00:27:34.958062','2020-04-23 19:21:04.757407','retroshare','76e7c764-940e-11ed-9827-0242ac19','RetroShare.AppImage','https://retroshare.cc/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(77,'Tox','Tox, like RetroShare, is a peer-to-peer instant messaging app with end-to-end encryption and no central server.','package/icon/2020/04/15/002920/app-svgrepo-com.svg','2020-04-15 00:29:20.663885','2020-04-23 20:09:29.333004','tox','76e7c907-940e-11ed-9827-0242ac19','Tox.AppImage','https://tox.chat/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(78,'Discord','Discord is the ideal cross-platform VoIP application designed to fit gamers’ needs and possibly overthrow Skype. It is a proprietary software that is secure, free, properly documented, beautifully designed, and has over 25 million users.','package/icon/2020/04/15/003055/app-svgrepo-com.svg','2020-04-15 00:30:55.862823','2020-04-26 11:56:54.137821','discord','76e7ca77-940e-11ed-9827-0242ac19','Discord.AppImage','https://discordapp.com/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(85,'Redis Desktop Manager','<p>Redis Desktop Manager (aka RDM) &mdash; offers you an easy-to-use GUI to access your Redis databases and perform some basic operations: View keys as a tree CRUD keys Analyse memory usage for entire DB or for selected namespace in tree-view (redis-server &gt;= 4.0 is required) List connected clients, Pub/Sub channels and Slow log commands Execute commands via shell</p>','package/icon/2020/04/15/205041/app-svgrepo-com.svg','2020-04-15 20:50:41.057242','2020-04-27 20:33:10.669011','redis-desktop-manager','76e7cc73-940e-11ed-9827-0242ac19','Redis-Desktop-Manager.AppImage','https://redisdesktop.com/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(87,'DataGrip','<p>Viele Datenbanken, ein Tool</p>','package/icon/2020/04/15/205408/app-svgrepo-com.svg','2020-04-15 20:54:08.175364','2020-04-27 20:17:27.326015','datagrip','76e7cdc4-940e-11ed-9827-0242ac19','DataGrip.AppImage','https://www.jetbrains.com/de-de/datagrip/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(88,'NixNote','NixNote is an free, open source program designed to help you take notes and stay organized. You can create text notes, attach files or images, and enen synchronize with Evernote so you can have your notes whevere you go.','package/icon/2020/04/15/205856/app-svgrepo-com.svg','2020-04-15 20:58:56.418965','2020-04-23 19:17:30.322782','nixnote','76e7cf06-940e-11ed-9827-0242ac19','NixNote.AppImage','http://nixnote.org/NixNote-Home/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(89,'Etcher','Flash OS images to SD cards & USB drives, safely and easily.','package/icon/2020/04/15/210106/app-svgrepo-com.svg','2020-04-15 21:01:06.299100','2020-04-25 21:02:08.617261','etcher','76e7d04a-940e-11ed-9827-0242ac19','Etcher.AppImage','https://www.balena.io/etcher/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(90,'Anki','Anki is a program which makes remembering things easy. Because it\'s a lot more efficient than traditional study methods, you can either greatly decrease your time spent studying, or greatly increase the amount you learn.','package/icon/2020/04/15/210404/app-svgrepo-com.svg','2020-04-15 21:04:04.671012','2020-04-25 21:59:29.239223','anki','76e7d188-940e-11ed-9827-0242ac19','Anki.AppImage','https://apps.ankiweb.net/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(91,'yEd Graph Editor','yEd is a powerful desktop application that can be used to quickly and effectively generate high-quality diagrams.\r\nCreate diagrams manually, or import your external data for analysis. Our automatic layout algorithms arrange even large data sets with just the press of a button.','package/icon/2020/04/25/205928/app-svgrepo-com.svg','2020-04-25 11:15:39.244229','2020-04-25 20:59:28.980466','QSCIL7cjwv0ifsgn2kPxdGTuzEhB9N5l','76e7d3c4-940e-11ed-9827-0242ac19','yEd-Graph-Editor.AppImage','https://www.yworks.com/products/yed',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(92,'OpenShot','OpenShot Video Editor verfügbar als Download für Linux, OS X, und Windows. Wir stellen sowohl direkte Downloadlinks als auch Torrents bereit. Wir haben auch täglich aktuelle Versionen zur Verfügung, benutzen Sie das Tägliche Version Schaltfeld weiter unten.  Informationen zur aktuellen Version','package/icon/2020/04/25/215024/app-svgrepo-com.svg','2020-04-25 21:50:24.621625','2020-04-25 21:55:04.892911','openshot','76e7d63c-940e-11ed-9827-0242ac19','OpenShot.AppImage','https://www.openshot.org/de/download/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(94,'Slic3r','<p>Slic3r is the tool you need to&nbsp;<strong>convert a 3D model into printing instructions for your 3D printer</strong>. It cuts the model into horizontal slices (<strong>layers</strong>), generates toolpaths to fill them and calculates the amount of material to be extruded.</p>','package/icon/2020/05/03/191328/app-svgrepo-com.svg','2020-05-03 19:13:28.535400','2020-05-03 19:25:15.344905','slic3r','76e7d788-940e-11ed-9827-0242ac19','Slic3r.AppImage','https://slic3r.org/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(95,'Repetier','<p>Since 2011 we are absolute 3D printing enthusiasts and develop several software solutions for 3D printers. Our first printer was a RepRap Mendel. At that time no useful software was available, so we started to program Repetier-Firmware and Repetier-Host to achieve the best possible printing results. Later Repetier-Server was added to optimize the possibilities and get more flexibility.</p>','package/icon/2020/05/03/192305/app-svgrepo-com.svg','2020-05-03 19:23:05.620752','2020-05-03 19:24:56.064652','repetier','76e7da22-940e-11ed-9827-0242ac19','Repetier.AppImage','https://www.repetier.com/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(96,'Ultimaker Cura','<p>Trusted by millions of users, Ultimaker Cura is the world&rsquo;s most popular 3D printing software. Prepare prints with a few clicks, integrate with CAD software for an easier workflow, or dive into custom settings for in-depth control.</p>','package/icon/2020/05/03/192722/app-svgrepo-com.svg','2020-05-03 19:26:58.596283','2020-05-04 20:48:55.525637','cura','76e7db30-940e-11ed-9827-0242ac19','Cura.AppImage','https://ultimaker.com/software/ultimaker-cura',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(97,'FreeCAD','<p>FreeCAD is an open-source parametric 3D modeler made primarily to design real-life objects of any size. Parametric modeling allows you to easily modify your design by going back into your model history and changing its parameters.</p>','package/icon/2020/05/03/194639/app-svgrepo-com.svg','2020-05-03 19:46:39.147198','2020-05-04 20:50:39.140628','freecad','76e7dc2f-940e-11ed-9827-0242ac19','FreeCAD.AppImage','https://freecadweb.org/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(98,'MeshLab','<p>the open source system for processing and editing 3D triangular meshes.<br />It provides a set of tools for editing, cleaning, healing, inspecting, rendering, texturing and converting meshes. It offers features for processing raw data produced by 3D digitization tools/devices and for preparing models for 3D printing.</p>','package/icon/2020/05/03/194943/app-svgrepo-com.svg','2020-05-03 19:49:43.405701','2020-05-04 20:52:05.254084','meshlab','76e7de06-940e-11ed-9827-0242ac19','MeshLab.AppImage','http://www.meshlab.net/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(100,'Simplenote','<p>Simplenote is the best note-taking app for Linux right now. It provides all the features that a modern and professional note-taking app must have. This how it becomes the best Evernote alternative app for Linux. This simple and elegant app is designed and developed by the same company who developed WordPress &ndash; Best Blogging open source platform, Automattic, Inc.&nbsp;</p>','package/icon/2020/05/03/195827/app-svgrepo-com.svg','2020-05-03 19:58:27.669211','2020-05-04 20:30:59.596473','simplenote','76e7df0d-940e-11ed-9827-0242ac19','Simplenote.AppImage','https://simplenote.com/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(101,'Turtl','<div class=\"turtl-cover turtl-cover-light uk-cover-container uk-height-large\">\r\n<div class=\"uk-position-center\">\r\n<div class=\"uk-container uk-container-small uk-dark\">\r\n<p>Whether it\'s bookmarks or passwords, files or shopping lists...Turtl organizes it all and makes it easy to find later. Sync across your devices. Leave nothing behind.</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"turtl-cover uk-cover-container uk-height-large\">&nbsp;</div>','package/icon/2020/05/03/195957/app-svgrepo-com.svg','2020-05-03 19:59:57.262113','2020-05-04 20:34:12.475228','turtl','76e7e114-940e-11ed-9827-0242ac19','Turtl.AppImage','https://turtlapp.com',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(102,'Medleytext','<p>Medleytext is not just another note taking app or alternative to Evernote. It&rsquo;s made especially for the developers and programmers. Though general users also can use it without any specialized knowledge or coding.</p>','package/icon/2020/05/03/200137/app-svgrepo-com.svg','2020-05-03 20:01:37.820449','2020-05-04 20:35:32.556883','medley','76e7e224-940e-11ed-9827-0242ac19','Medleytext.AppImage','https://medleytext.net/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(103,'WizNote','<p>WizNote is an open source and completely free note-taking app for Linux, and apparently, it&rsquo;s a great Evernote replacement software available right now on the market. Users can create, edit or view notes and documents on Windows, Linux, iOS, Android and much more.</p>','package/icon/2020/05/03/200313/app-svgrepo-com.svg','2020-05-03 20:03:13.679481','2020-05-04 20:37:27.902961','wiznote','76e7e3c0-940e-11ed-9827-0242ac19','WizNote.AppImage','https://github.com/WizTeam/WizQTClient',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(104,'Laverna','<p>Laverna has a simple and robust markdown editor, which can help you write faster than ever before with our live markdown preview.</p>','package/icon/2020/05/03/200430/app-svgrepo-com.svg','2020-05-03 20:04:30.201846','2020-05-04 20:41:18.603123','laverna','76e7e4b9-940e-11ed-9827-0242ac19','Laverna.AppImage','https://laverna.cc/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(105,'Zotero','<p>Zotero is the only software that automatically senses research on the web. Need an article from JSTOR or a preprint from arXiv.org? A news story from the New York Times or a book from a library? Zotero has you covered, everywhere.</p>','package/icon/2020/05/03/200613/app-svgrepo-com.svg','2020-05-03 20:06:13.257329','2020-05-04 20:42:56.623593','zotero','76e7e657-940e-11ed-9827-0242ac19','Zotero.AppImage','https://www.zotero.org/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(106,'Boostnote','<p>Boostnote is also an open source and advanced note-taking editor app for developers and programmers, just like MidleText. With a little bit advanced knowledge, it can be a great alternative to Evernote app for Linux. This Evernote alternative note-taking app saves the content when you write and this how you never lost any notes or documents.</p>','package/icon/2020/05/03/200800/app-svgrepo-com.svg','2020-05-03 20:08:00.853137','2020-05-04 20:44:54.753993','boostnote','76e7e7e1-940e-11ed-9827-0242ac19','Boostnote.AppImage','https://boostnote.io/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(107,'TagSpaces','<p>Though TagSpaces is not that familiar with the world of note taking app or Evernote replacement app, still it&rsquo;s a feature-rich software for Ubuntu Linux. I might be wrong if I mention this app as the only note-taking app instead it&rsquo;s a complete data management software. The user can organize and manage all the files of the system through this simple and highly customizable app. You can also host your files with a tag system which is helpful when searching the files and documents quickly.</p>','package/icon/2020/05/03/200929/app-svgrepo-com.svg','2020-05-03 20:09:29.525548','2020-05-04 20:46:35.195085','tagspaces','76e7e963-940e-11ed-9827-0242ac19','TagSpaces.AppImage','https://www.tagspaces.org/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(108,'Qoppa PDF Studio','<p>PDF Studio is a commercial PDF editor from Qoppa Software that has all the necessary editing features. You can create, review and edit a PDF file.</p>','package/icon/2020/05/03/201951/app-svgrepo-com.svg','2020-05-03 20:19:51.040413','2020-05-04 20:21:06.695137','qoppa-pdf-studio','76e7eb07-940e-11ed-9827-0242ac19','PDF-Studio.AppImage','https://www.qoppa.com/pdfstudioviewer',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(109,'Okular','<p>Okular is a universal document viewer developed by KDE. Okular works on multiple platforms, including but not limited to Linux, Windows, macOS, *BSD, etc.</p>\r\n<p>&nbsp;</p>\r\n<p><a href=\"http://www.linuxfromscratch.org/blfs/view/svn/kde/okular5.html\">http://www.linuxfromscratch.org/blfs/view/svn/kde/okular5.html</a></p>','package/icon/2020/05/03/222333/app-svgrepo-com.svg','2020-05-03 21:41:19.430987','2020-05-04 20:22:28.838394','okular','76e7ec9a-940e-11ed-9827-0242ac19','Okular.AppImage','https://okular.kde.org/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(110,'PDFsam Visual','<p>A powerful tool to visually compose documents, reorder pages, delete pages, extract pages, extract text, convert to grayscale, repair, split, merge, rotate, encrypt, decrypt, crop PDF files</p>','package/icon/2020/05/03/222421/app-svgrepo-com.svg','2020-05-03 22:24:21.110262','2020-05-04 20:25:13.964907','pdfsam-visual','76e8aa05-940e-11ed-9827-0242ac19','PDFsam-Visual.AppImage','https://pdfsam.org/downloads/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(111,'PDFsam Basic','<p>A free, open source, platform independent software designed to split, merge, mix, extract pages and rotate PDF files</p>','package/icon/2020/05/03/222517/app-svgrepo-com.svg','2020-05-03 22:25:17.903673','2020-05-04 20:28:33.291150','pdfsam-basic','76e8abd4-940e-11ed-9827-0242ac19','PDFsam-Basic.AppImage','https://pdfsam.org/downloads/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(112,'Gparted','<p>There are lots of choices comes to mind when the question arises about best Linux Partition Manager. If you are a new Linux user or not comfortable with a text-based partition manager, then GUI based Gparted is the best option for you to choose. You can do almost all the task of disk partitioning using this free and open source partition manager.</p>\r\n<p>&nbsp;</p>','package/icon/2020/05/03/225527/app-svgrepo-com.svg','2020-05-03 22:55:27.229219','2020-05-04 19:56:55.988129','gparted','76e8ae75-940e-11ed-9827-0242ac19','Gparted.AppImage','https://gparted.org/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(113,'Kazam','<p>Screencasting is an important task for many people for many reasons including making a video tutorial, creating a presentation, compiling a how-to tutorial or do a software review or having the fun of streaming while playing pc games. Moreover now a day many users are making an earning opportunity for themselves through YouTube, Facebook video or any other video hosting sites by making many helpful how-to guide videos.</p>','package/icon/2020/05/03/225814/app-svgrepo-com.svg','2020-05-03 22:58:14.462970','2020-05-04 19:59:17.753579','kazam','76e8afa6-940e-11ed-9827-0242ac19','Kazam.AppImage','https://launchpad.net/kazam',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(114,'FileZilla','<p>Welcome to the homepage of FileZilla&reg;, the free FTP solution. The FileZilla Client not only supports FTP, but also FTP over TLS (FTPS) and SFTP. It is open source software distributed free of charge under the terms of the GNU General Public License.</p>\r\n<p>We are also offering FileZilla Pro, with additional protocol support for WebDAV, Amazon S3, Backblaze B2, Dropbox, Microsoft OneDrive, Google Drive, Microsoft Azure Blob and File Storage, and Google Cloud Storage.</p>\r\n<p>Last but not least, FileZilla Server is a free open source FTP and FTPS Server.</p>','package/icon/2020/05/03/230109/app-svgrepo-com.svg','2020-05-03 23:01:09.983818','2020-05-04 20:01:04.710662','filezilla','76e8b0b6-940e-11ed-9827-0242ac19','FileZilla.AppImage','https://filezilla-project.org/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(115,'Bacula','<p>Bacula is an Open Source Backup Software. This computer backup system can work in various networks. It is an automated task that need not require intervention from a systems administrator or computer operator. Bacula supports Linux, UNIX, and Windows backup clients.</p>','package/icon/2020/05/03/230210/app-svgrepo-com.svg','2020-05-03 23:02:10.712894','2020-05-04 20:03:54.319680','bacula','76e8b2cc-940e-11ed-9827-0242ac19','Bacula.AppImage','https://www.bacula.org/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(116,'FlareGet','<p>FlareGet is another one of the best download managers for Linux. It comes with two variations but remembers its source is closed and comes to both free and paid version. FlareGet supports most of the dominant OS platform including Windows, Ubuntu, Linux Mint and other Linux distros. It offers multi-thread support and four segments for each file (free version). One of the best features of this download manager is to auto capture Youtube videos and URLs from the clipboard.</p>','package/icon/2020/05/03/230648/app-svgrepo-com.svg','2020-05-03 23:06:48.753613','2020-05-04 20:05:38.206381','flareget','76e8b3e1-940e-11ed-9827-0242ac19','FlareGet.AppImage','https://flareget.com/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(117,'VirtualBox','<p>VirtualBox is a powerful x86 and AMD64/Intel64 virtualization product for enterprise as well as home use. Not only is VirtualBox an extremely feature rich, high performance product for enterprise customers, it is also the only professional solution that is freely available as Open Source Software under the terms of the GNU General Public License (GPL) version 2. See \"About VirtualBox\" for an introduction.</p>','package/icon/2020/05/03/230935/app-svgrepo-com.svg','2020-05-03 23:09:35.330165','2020-05-04 20:07:58.639007','virtualbox','76e8b4dd-940e-11ed-9827-0242ac19','VirtualBox.AppImage','https://www.virtualbox.org/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(118,'Timeshift','<p>System restore tool for Linux. Creates filesystem snapshots using rsync+hardlinks, or BTRFS snapshots. Supports scheduled snapshots, multiple backup levels, and exclude filters. Snapshots can be restored while system is running or from Live CD/USB.</p>','package/icon/2020/05/03/231143/app-svgrepo-com.svg','2020-05-03 23:11:43.252445','2020-05-04 20:10:17.072853','timeshift','76e8b746-940e-11ed-9827-0242ac19','Timeshift.AppImage','https://github.com/teejee2008/timeshift',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(119,'HandBrake','<p>Brief: HandBrake is a free and open-source video conversion tool that is quite useful. Let&rsquo;s see what are its main features and how to use them for converting videos from one format to another.</p>','package/icon/2020/05/03/231530/app-svgrepo-com.svg','2020-05-03 23:15:30.090417','2020-05-04 20:12:49.790345','handbrake','76e8b8b8-940e-11ed-9827-0242ac19','HandBrake.AppImage','https://handbrake.fr/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(120,'Stacer','<p>Stacer is an open source system optimizer and application monitor that helps users to manage entire system with different aspects, its an all in one system utility.</p>','package/icon/2020/05/03/231831/app-svgrepo-com.svg','2020-05-03 23:18:31.910829','2020-05-04 20:14:31.280832','stacer','76e8b9c6-940e-11ed-9827-0242ac19','Stacer.AppImage','https://oguzhaninan.github.io/Stacer-Web/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(121,'Ksnip','<p><strong>A really cool one!</strong></p>\r\n<p>Ksnip is a Qt based cross-platform screenshot tool that provides many annotation features for your screenshots.</p>\r\n<p>&nbsp;</p>','package/icon/2020/05/03/232057/app-svgrepo-com.svg','2020-05-03 23:20:57.383799','2020-05-04 20:16:23.253959','ksnip','76e8be40-940e-11ed-9827-0242ac19','Ksnip.AppImage','https://github.com/ksnip/ksnip',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(122,'Texmaker','<p>Texmaker is a free, modern and cross-platform LaTeX editor for linux, macosx and windows systems that integrates many tools needed to develop documents with LaTeX, in just one application.</p>','package/icon/2020/05/04/194016/app-svgrepo-com.svg','2020-05-04 19:40:16.998258','2020-05-04 20:54:38.746964','texmaker','76e8c2e0-940e-11ed-9827-0242ac19','Texmaker.AppImage','https://www.xm1math.net/texmaker/download.html',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(123,'TeXstudio','<p>TeXstudio is an integrated writing environment for creating LaTeX documents. Our goal is to make writing LaTeX as easy and comfortable as possible. Therefore TeXstudio has numerous features like syntax-highlighting, integrated viewer, reference checking and various assistants. For more details see the features.</p>','package/icon/2020/05/04/194127/app-svgrepo-com.svg','2020-05-04 19:41:27.628225','2020-05-04 20:56:30.949965','texstudio','76e8c4c1-940e-11ed-9827-0242ac19','TeXstudio.AppImage','https://www.texstudio.org/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(124,'TeXpen','<p>TeXpen is yet another simplified tool to go with. You get the auto-completion functionality with this LaTeX editor. However, you may not find the user interface impressive. If you do not mind the UI, but want a super easy LaTeX editor, TeXpen could fulfill that wish for you. Also, TeXpen lets you correct/improve the English grammar and expressions used in the document.</p>','package/icon/2020/05/04/194332/app-svgrepo-com.svg','2020-05-04 19:43:32.978463','2020-05-04 20:58:20.118271','texpen','76e8c5c2-940e-11ed-9827-0242ac19','TeXpen.AppImage','https://github.com/Amuwa/TeXpen',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(125,'Gummi','<p>Gummi is a very simple LaTeX editor based on the GTK+ toolkit. Well, you may not find a lot of fancy options here but if you are just starting out &ndash; Gummi will be our recommendation.It supports exporting the documents to PDF format, lets you highlight syntax, and helps you with some basic error checking functionalities. Though Gummi isn&rsquo;t actively maintained via GitHub it works just fine.</p>\r\n<p>&nbsp;</p>','package/icon/2020/05/04/194452/app-svgrepo-com.svg','2020-05-04 19:44:52.298912','2020-05-04 20:59:47.592195','gummi','76e8c761-940e-11ed-9827-0242ac19','Gummi.AppImage','https://github.com/alexandervdm/gummi',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(126,'Kile','<p>Everything has been designed to make your LaTeX document creation simple, but it&rsquo;s far from basic. You can create templates for documents, easily insert images, have LaTeX commands auto-complete for time-saving, as well as integrate your document into BibTeX, a major tool for academic referencing.</p>','package/icon/2020/05/04/194656/app-svgrepo-com.svg','2020-05-04 19:46:56.527476','2020-05-04 21:01:12.743270','lile','76e8c8ec-940e-11ed-9827-0242ac19','Kile.AppImage','https://kile.sourceforge.io/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(127,'LyX','<p>LyX is a document processor that combines the power and flexibility of TeX/LaTeX with the ease of use of a graphical interface. It&rsquo;s an open-source LaTeX editor that&rsquo;s available for Windows, Mac, and Linux. It&rsquo;s quite intuitive and user-friendly. LyX offers import from and export to LaTeX. Unlike other LaTeX editors, it has all the significant features that make the editing comfortable and hassle-free.</p>','package/icon/2020/05/04/194809/app-svgrepo-com.svg','2020-05-04 19:48:09.722113','2020-05-04 21:03:13.626637','lyx','76e8ca6f-940e-11ed-9827-0242ac19','LyX.AppImage','https://www.lyx.org/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(128,'Open LaTeX Studio','<p>It&rsquo;s an open-source and free LaTeX editor for Windows and Linux system. It offers document template and remote collaboration via Dropbox. Syntax highlighting, code completion, code folding, spell checking, built-in output viewer, etc. are the main features of this LaTeX editor.</p>','package/icon/2020/05/04/195019/app-svgrepo-com.svg','2020-05-04 19:50:19.195374','2020-05-04 21:05:04.541111','open-latex-studio','76e8cbfe-940e-11ed-9827-0242ac19','Open-LaTeX-Studio.AppImage','https://sebbrudzinski.github.io/Open-LaTeX-Studio/download.html',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(129,'Bookworm','<p>Read the books you love without having to worry about the different format complexities like epub, pdf, mobi, cbr, etc. This version supports EPUB, MOBI, FB2, PDF, FB2 and Comics (CBR and CBZ) formats with support for more formats to follow soon.</p>\r\n<p>Check the Bookworm website for details on features, shortcuts, installation guides for supported distros :&nbsp;<a href=\"https://babluboy.github.io/bookworm/\" rel=\"nofollow\">https://babluboy.github.io/bookworm/</a></p>','package/icon/2020/05/05/214743/app-svgrepo-com.svg','2020-05-05 21:47:43.033734','2020-05-06 19:35:33.995272','bookworm','76e8cda3-940e-11ed-9827-0242ac19','Bookworm.AppImage','https://babluboy.github.io/bookworm/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(130,'Buka','<p>Buka is a modern software that helps you manage your ebook at ease. With a simple, clean and straight-forward user interface, Buka aims to gather your ebooks for a reading experience without hassles. Buka currently support .PDF format with configurations that helps user focus more on the content.</p>','package/icon/2020/05/05/215102/app-svgrepo-com.svg','2020-05-05 21:51:02.151582','2020-05-06 19:37:45.808042','buka','76e8d084-940e-11ed-9827-0242ac19','Buka.AppImage','https://github.com/oguzhaninan/Buka',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(131,'Calibre','<p>calibre is a powerful and easy to use e-book manager. Users say it&rsquo;s outstanding and a must-have. It&rsquo;ll allow you to do nearly everything and it takes things a step beyond normal e-book software. It&rsquo;s also completely free and open source and great for both casual users and computer experts.</p>','package/icon/2020/05/05/215247/app-svgrepo-com.svg','2020-05-05 21:52:47.248063','2020-05-06 19:39:15.814948','calibre','76e8d18c-940e-11ed-9827-0242ac19','Calibre.AppImage','https://www.calibre-ebook.com/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(132,'FBReader','<p>FBReader is an open-source, lightweight, multi-platform ebook reader supporting various formats like ePub, fb2, mobi, rtf, html etc. It includes access to popular network libraries from where you can download ebooks for free or buy one.</p>\r\n<p>FBReader is highly customizable with options to choose colors, fonts, page-turning animations, bookmarks and dictionaries.</p>','package/icon/2020/05/05/215457/app-svgrepo-com.svg','2020-05-05 21:54:57.518847','2020-05-06 19:41:46.331664','fbreader','76e8d283-940e-11ed-9827-0242ac19','FBReader.AppImage','https://fbreader.org/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(135,'TigerVNC','<p>TigerVNC is an open source, free and multi-platform VNC implemented software that allows you to interact with the remote system via GUI based client/server application. This Linux remote desktop software capable of running 3D and multimedia files smoothly. In all the devices, it maintains a consistent look and feels with the re-use of components.</p>','package/icon/2020/05/06/190919/app-svgrepo-com.svg','2020-05-06 19:09:19.918242','2020-05-06 19:51:57.519340','tigervnc','76e8d380-940e-11ed-9827-0242ac19','TigerVNC.AppImage','https://tigervnc.org/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(136,'TeamViewer','<p>TeamViewer is a protected, robust, cross-platform and modern remote desktop software that lets you access the remote devices with multiple devices and users simultaneously. It has both the options to use, free for personal and a paid version for business purposes.</p>','package/icon/2020/05/06/191027/app-svgrepo-com.svg','2020-05-06 19:10:27.704716','2020-05-06 19:53:57.950248','teamviewer','76e8d47b-940e-11ed-9827-0242ac19','TeamViewer.AppImage','https://www.teamviewer.com/de/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(137,'RealVNC','<p>RealVNC is also a multi-platform, reliable, and easy to use remote access client for Linux, Windows and much more. It offers a unique technology based on VNC screen sharing with add-on products like VNC connect and VNC viewer.</p>','package/icon/2020/05/06/191158/app-svgrepo-com.svg','2020-05-06 19:11:58.606280','2020-05-06 19:56:18.821601','realvnc','76e8d586-940e-11ed-9827-0242ac19','RealVNC.AppImage','https://www.realvnc.com/',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(139,'X2Go','<p>X2Go is an open source remote desktop access client for Linux that uses desktop sharing NX protocol. X2Go is speedy and works better than VNC protocol. It&rsquo;s the best alternative to RDP and VNC desktop sharing protocols.</p>','package/icon/2020/05/06/191505/app-svgrepo-com.svg','2020-05-06 19:15:05.757642','2020-05-06 20:01:34.427749','x2go','76e8d693-940e-11ed-9827-0242ac19','X2Go.AppImage','https://wiki.x2go.org',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(141,'AnyDesk','<p>AnyDesk is a popular remote desktop software that is used in almost everywhere and can be counted as an alternative to TeamViewer. Employees can help their clients from their office by accessing the client&rsquo;s PC through AnyDesk to solve problems. It allows users to whitelist trusted access and block unauthorized access. The monitoring team is noticing all the reports on AnyDesk and deciding on the upgrade of the software.</p>','package/icon/2020/05/06/191855/app-svgrepo-com.svg','2020-05-06 19:18:55.792891','2020-05-06 20:08:50.583426','anydesk','76e8d78e-940e-11ed-9827-0242ac19','AnyDesk.AppImage','https://anydesk.com/de',NULL,'https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage'),(142,'FreeRDP','<p>FreeRDP is a free implementation of the Remote Desktop Protocol (RDP), released under the Apache license. Enjoy the freedom of using your software wherever you want, the way you want it, in a world where interoperability can finally liberate your computing experience.</p>','package/icon/2020/05/06/192147/app-svgrepo-com.svg','2020-05-06 19:21:47.147802','2021-11-24 21:22:10.787129','freerdp','76e8d88a-940e-11ed-9827-0242ac19','FreeRDP.AppImage','https://www.freerdp.com/','http://localhost:8001/admin/package/package/142/change/','https://github.com/area-of-dev/OpenOffice.AppImage/releases/download/latest/OpenOffice.AppImage');
/*!40000 ALTER TABLE `package_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_packagecomment`
--

DROP TABLE IF EXISTS `package_packagecomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_packagecomment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `package_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `package_packagecomment_package_id_42784160_fk_package_package_id` (`package_id`),
  CONSTRAINT `package_packagecomment_package_id_42784160_fk_package_package_id` FOREIGN KEY (`package_id`) REFERENCES `package_package` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_packagecomment`
--

LOCK TABLES `package_packagecomment` WRITE;
/*!40000 ALTER TABLE `package_packagecomment` DISABLE KEYS */;
INSERT INTO `package_packagecomment` VALUES (1,'test comment','2020-04-27 19:48:37.995804','2020-04-27 19:48:37.995832',1),(2,'Free but hard to download','2020-04-27 19:49:33.639306','2020-04-27 19:49:33.639332',52),(3,'Available by request with registartion.','2020-04-27 19:50:14.867836','2020-04-27 19:50:14.867883',53),(4,'need to build from the sources','2020-04-27 20:33:10.684285','2020-04-27 20:33:10.684313',85);
/*!40000 ALTER TABLE `package_packagecomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_packagegroup`
--

DROP TABLE IF EXISTS `package_packagegroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_packagegroup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `icon` varchar(100) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_packagegroup`
--

LOCK TABLES `package_packagegroup` WRITE;
/*!40000 ALTER TABLE `package_packagegroup` DISABLE KEYS */;
INSERT INTO `package_packagegroup` VALUES (1,'Browsers','internet browsers','package/icon/2020/04/04/Arrow_right.svg','2020-04-04 13:09:26.459698','2020-04-04 13:09:26.459727'),(2,'Office','office','package/icon/2020/04/04/Arrow_right_bEBE7n9.svg','2020-04-04 21:55:38.791032','2020-04-14 20:39:09.547674'),(3,'Development','Development','package/icon/2020/04/04/Arrow_right_f1u52Qm.svg','2020-04-04 21:55:54.994153','2020-04-14 22:44:46.845597'),(4,'Graphic','Graphic','package/icon/2020/04/04/Arrow_right_bYwACB7.svg','2020-04-04 21:56:12.914853','2020-04-15 00:32:49.663153'),(5,'Internet','Internet','package/icon/2020/04/04/Arrow_right_sLFaMpL.svg','2020-04-04 21:56:27.088625','2020-04-12 23:07:51.920831'),(6,'Education','Education','package/icon/2020/04/04/Arrow_right_ODuAaXT.svg','2020-04-04 21:56:37.327663','2020-04-15 21:03:02.273459'),(7,'Multimedia','Multimedia','package/icon/2020/04/04/Arrow_right_lcsaA6N.svg','2020-04-04 21:56:57.153818','2020-04-04 21:56:57.153850'),(10,'Chat','Chat','package/icon/2020/04/04/Arrow_right_UjIuiKi.svg','2020-04-04 21:57:33.852141','2020-04-04 21:57:33.852169'),(11,'Science','Science','package/icon/2020/04/04/Arrow_right_KhP88Of.svg','2020-04-04 21:58:03.842934','2020-04-04 21:58:03.842970'),(12,'Utilites','Utilites','package/icon/2020/04/04/Arrow_right_ABgRO8a.svg','2020-04-04 21:58:14.113799','2020-04-04 21:58:14.113843'),(13,'Video','Video editors, redactors, etc..','package/icon/2020/04/12/app-svgrepo-com.svg','2020-04-12 22:18:11.638810','2020-04-12 22:18:11.638838'),(14,'Email','Email clients and so on','package/icon/2020/04/12/app-svgrepo-com_FKSO42t.svg','2020-04-12 22:34:04.453697','2020-04-12 22:34:04.453856'),(15,'Databases','database tools','package/icon/2020/04/12/app-svgrepo-com_BTzALhL.svg','2020-04-12 22:49:33.908800','2020-04-12 22:49:33.908837'),(16,'Audio','Audio editors, players, convertors and so on','package/icon/2020/04/12/app-svgrepo-com_eC2hyF9.svg','2020-04-12 23:12:34.784460','2020-04-12 23:12:34.784538'),(17,'IDE','Integrated development environment','package/icon/2020/04/14/app-svgrepo-com.svg','2020-04-14 20:30:37.101121','2020-04-14 20:31:45.551955'),(18,'Diagrams','Diagrams, mind - maps, UML','package/icon/2020/04/14/app-svgrepo-com_dqARbPd.svg','2020-04-14 21:58:50.583689','2020-04-14 21:59:06.197447'),(19,'Text editors','Text / source code editors','package/icon/2020/04/14/app-svgrepo-com_xASn14L.svg','2020-04-14 22:43:34.655661','2020-04-14 22:43:46.470160'),(20,'PDF toos','PDF readers / editors','package/icon/2020/04/14/app-svgrepo-com_UDkyN01.svg','2020-04-14 23:23:30.592007','2020-05-06 20:18:30.817861'),(21,'Privacy','Darknet, secured messagin, decentralized messeging','package/icon/2020/04/15/app-svgrepo-com.svg','2020-04-15 00:28:17.460862','2020-04-23 20:07:11.663234'),(22,'Notes','Notes','package/icon/2020/04/15/app-svgrepo-com_CKGwRH5.svg','2020-04-15 20:58:53.340749','2020-04-15 20:59:13.960457'),(23,'3D editors','3D editors / printing software','package/icon/2020/05/03/app-svgrepo-com.svg','2020-05-03 19:17:27.041725','2020-05-06 20:14:27.341535'),(24,'LaTeX','LaTeX is a high-quality typesetting system; it includes features designed for the production of technical and scientific documentation. LaTeX is the de facto standard for the communication and publication of scientific documents. LaTeX is available as free software.','package/icon/2020/05/03/app-svgrepo-com_3HzVa6q.svg','2020-05-03 22:56:38.327406','2020-05-06 19:30:09.564603'),(25,'eBook','...','package/icon/2020/05/05/app-svgrepo-com.svg','2020-05-05 21:45:59.388737','2020-05-06 19:30:20.415608'),(26,'RDP / VNC','...','package/icon/2020/05/06/app-svgrepo-com.svg','2020-05-06 19:04:43.562515','2020-05-06 19:30:33.852051');
/*!40000 ALTER TABLE `package_packagegroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_packagegrouppackage`
--

DROP TABLE IF EXISTS `package_packagegrouppackage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_packagegrouppackage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `package_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `package_packagegroup_group_id_de4eea10_fk_package_p` (`group_id`),
  KEY `package_packagegroup_package_id_71d6f751_fk_package_p` (`package_id`),
  CONSTRAINT `package_packagegroup_group_id_de4eea10_fk_package_p` FOREIGN KEY (`group_id`) REFERENCES `package_packagegroup` (`id`),
  CONSTRAINT `package_packagegroup_package_id_71d6f751_fk_package_p` FOREIGN KEY (`package_id`) REFERENCES `package_package` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_packagegrouppackage`
--

LOCK TABLES `package_packagegrouppackage` WRITE;
/*!40000 ALTER TABLE `package_packagegrouppackage` DISABLE KEYS */;
INSERT INTO `package_packagegrouppackage` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(6,13,5),(7,7,6),(8,13,6),(10,12,7),(11,6,16),(15,4,10),(16,4,11),(17,4,12),(18,4,13),(20,14,14),(22,14,15),(26,3,17),(27,3,18),(29,3,19),(31,15,20),(32,3,21),(33,3,22),(34,3,23),(35,3,24),(37,15,25),(38,3,26),(40,4,27),(41,3,28),(42,3,29),(43,3,30),(44,12,31),(46,15,32),(47,3,33),(48,3,34),(49,3,35),(50,5,1),(51,5,2),(52,5,3),(53,5,4),(54,5,14),(55,5,15),(56,5,36),(57,10,36),(58,5,37),(59,10,37),(61,5,38),(62,10,38),(64,7,39),(65,16,39),(66,11,40),(67,6,40),(68,17,21),(69,17,22),(70,17,23),(71,17,26),(72,17,28),(73,17,35),(74,17,19),(75,17,30),(76,2,41),(77,2,42),(78,2,43),(79,1,44),(80,5,44),(81,1,45),(82,5,45),(84,4,47),(85,4,48),(88,18,9),(89,18,50),(90,18,46),(91,4,51),(92,4,52),(93,4,53),(94,19,18),(95,19,34),(96,19,33),(97,19,54),(98,19,55),(99,4,56),(100,4,57),(101,2,58),(102,20,59),(103,20,60),(104,16,61),(105,16,62),(106,16,63),(107,16,64),(108,16,65),(109,16,66),(110,16,67),(111,16,68),(112,16,69),(113,13,70),(114,13,71),(115,10,72),(116,5,72),(117,10,73),(118,5,73),(119,10,74),(120,5,74),(121,10,75),(122,5,75),(123,10,76),(124,5,76),(125,21,76),(126,10,77),(127,5,77),(128,10,78),(129,5,78),(134,17,29),(137,15,85),(139,15,87),(140,22,88),(141,22,8),(142,12,89),(143,6,90),(144,21,44),(145,21,77),(146,18,91),(147,13,92),(148,7,5),(149,7,70),(150,7,71),(151,7,92),(154,23,94),(155,23,51),(156,23,95),(157,23,96),(158,23,97),(159,23,98),(161,22,100),(162,22,101),(163,22,102),(164,22,103),(165,22,104),(166,22,105),(167,22,106),(168,22,107),(169,20,108),(170,20,109),(171,20,110),(172,20,111),(173,12,112),(174,12,113),(175,12,114),(176,12,115),(177,12,116),(178,12,117),(179,12,118),(180,12,119),(181,12,120),(182,12,121),(183,24,122),(184,24,123),(185,24,124),(186,24,125),(187,24,126),(188,24,127),(189,24,128),(190,25,129),(191,25,130),(192,25,131),(193,25,132),(196,26,135),(197,26,136),(198,26,137),(200,26,139),(202,26,141),(203,26,142);
/*!40000 ALTER TABLE `package_packagegrouppackage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_packageimage`
--

DROP TABLE IF EXISTS `package_packageimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_packageimage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `created` datetime(6) NOT NULL,
  `package_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `package_packageimage_package_id_e2f04107_fk_package_package_id` (`package_id`),
  CONSTRAINT `package_packageimage_package_id_e2f04107_fk_package_package_id` FOREIGN KEY (`package_id`) REFERENCES `package_package` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=427 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_packageimage`
--

LOCK TABLES `package_packageimage` WRITE;
/*!40000 ALTER TABLE `package_packageimage` DISABLE KEYS */;
INSERT INTO `package_packageimage` VALUES (9,'package/image/2020/04/13/182332/Screenshot_20200413_202317.png','2020-04-13 18:22:08.211677',1),(10,'package/image/2020/04/13/182403/Screenshot_20200413_202349.png','2020-04-13 18:24:03.252373',1),(11,'package/image/2020/04/13/182438/Screenshot_20200413_202427.png','2020-04-13 18:24:38.458616',1),(12,'package/image/2020/04/13/182743/Screenshot_20200413_202721.png','2020-04-13 18:27:43.180270',2),(13,'package/image/2020/04/13/182800/Screenshot_20200413_202755.png','2020-04-13 18:28:00.156031',2),(14,'package/image/2020/04/13/182814/Screenshot_20200413_202806.png','2020-04-13 18:28:14.628726',2),(15,'package/image/2020/05/04/201809/pc1.png','2020-04-13 18:29:39.557468',29),(16,'package/image/2020/05/04/201820/pc2.png','2020-04-13 18:31:02.548808',29),(17,'package/image/2020/04/14/230040/at1.webp','2020-04-13 18:33:38.821355',18),(18,'package/image/2020/04/14/230040/at2.png','2020-04-13 18:34:06.068148',18),(19,'package/image/2020/04/14/230040/at3.jpg','2020-04-13 18:34:59.343588',18),(20,'package/image/2020/04/13/183621/Screenshot_20200413_203613.png','2020-04-13 18:36:21.303675',3),(21,'package/image/2020/04/13/183653/Screenshot_20200413_203646.png','2020-04-13 18:36:53.551711',3),(22,'package/image/2020/04/13/183713/Screenshot_20200413_203705.png','2020-04-13 18:37:13.836640',3),(23,'package/image/2020/04/13/183810/Screenshot_20200413_203751.png','2020-04-13 18:38:10.579442',8),(24,'package/image/2020/04/13/183824/Screenshot_20200413_203814.png','2020-04-13 18:38:24.089730',8),(26,'package/image/2020/04/13/183944/Screenshot_20200413_203931.png','2020-04-13 18:39:44.667665',8),(28,'package/image/2020/04/14/193237/Screenshot_20200414_212919.png','2020-04-14 19:32:37.345797',14),(29,'package/image/2020/04/14/193301/Screenshot_20200414_212919.png','2020-04-14 19:33:01.216870',15),(30,'package/image/2020/04/14/193420/Mattermost_UI.png','2020-04-14 19:34:20.578907',38),(31,'package/image/2020/04/14/193430/Press-DevOps.png','2020-04-14 19:34:30.160123',38),(32,'package/image/2020/04/14/193456/1576x.webp','2020-04-14 19:34:56.522950',38),(33,'package/image/2020/04/14/193706/tb1.png','2020-04-14 19:37:06.893080',15),(34,'package/image/2020/04/14/193724/tb2.jpg','2020-04-14 19:37:24.663086',15),(35,'package/image/2020/04/14/193732/tb3.jpg','2020-04-14 19:37:32.593183',15),(36,'package/image/2020/04/14/193757/tb4.png','2020-04-14 19:37:57.614093',15),(37,'package/image/2020/04/14/193806/tb5.jpg','2020-04-14 19:38:06.106387',15),(38,'package/image/2020/04/14/193813/tb1.png','2020-04-14 19:38:13.900900',14),(39,'package/image/2020/04/14/193820/tb2.jpg','2020-04-14 19:38:20.042604',14),(40,'package/image/2020/04/14/193826/tb3.jpg','2020-04-14 19:38:26.460843',14),(41,'package/image/2020/04/14/193833/tb4.png','2020-04-14 19:38:33.693246',14),(42,'package/image/2020/04/14/193841/tb5.jpg','2020-04-14 19:38:41.401442',14),(43,'package/image/2020/04/14/194222/op1.jpg','2020-04-14 19:42:22.652063',4),(44,'package/image/2020/04/14/194230/op2.jpg','2020-04-14 19:42:30.549668',4),(45,'package/image/2020/04/14/194239/op3.png','2020-04-14 19:42:39.743039',4),(46,'package/image/2020/04/14/194510/xm1.png','2020-04-14 19:45:10.627207',9),(47,'package/image/2020/04/14/194517/xm2.png','2020-04-14 19:45:17.535734',9),(48,'package/image/2020/04/14/194524/xm3.jpg','2020-04-14 19:45:24.216355',9),(49,'package/image/2020/04/14/194530/xm4.png','2020-04-14 19:45:30.985824',9),(50,'package/image/2020/04/14/194730/sk1.gif','2020-04-14 19:47:30.230484',37),(51,'package/image/2020/04/14/194739/sk2.jpg','2020-04-14 19:47:39.473940',37),(52,'package/image/2020/04/14/194746/sk3.jpg','2020-04-14 19:47:46.226057',37),(53,'package/image/2020/04/14/194754/sk4.png','2020-04-14 19:47:54.418906',37),(54,'package/image/2020/04/14/194801/sk5.jpg','2020-04-14 19:48:01.760381',37),(56,'package/image/2020/04/14/194938/translations.png','2020-04-14 19:49:38.904237',16),(57,'package/image/2020/04/14/194947/statistic.png','2020-04-14 19:49:47.708720',16),(59,'package/image/2020/04/14/195402/ans1.jpg','2020-04-14 19:54:02.262507',17),(60,'package/image/2020/04/14/195408/ans2.png','2020-04-14 19:54:08.993541',17),(61,'package/image/2020/04/14/195416/ans3.jpg','2020-04-14 19:54:16.925842',17),(62,'package/image/2020/04/14/195526/cl3.gif','2020-04-14 19:55:26.605770',19),(63,'package/image/2020/04/14/195533/cl2.png','2020-04-14 19:55:33.459278',19),(64,'package/image/2020/04/14/195540/cl1.png','2020-04-14 19:55:40.940235',19),(65,'package/image/2020/04/14/195828/gmp1.jpg','2020-04-14 19:58:28.740432',11),(66,'package/image/2020/04/14/195836/gmp2.png','2020-04-14 19:58:36.861069',11),(67,'package/image/2020/04/14/195848/gmp3.jpg','2020-04-14 19:58:48.970338',11),(68,'package/image/2020/04/14/200010/dg1.jpeg','2020-04-14 20:00:10.088815',10),(69,'package/image/2020/04/14/200019/dg2.jpg','2020-04-14 20:00:19.062169',10),(70,'package/image/2020/04/14/200026/dg3.jpeg','2020-04-14 20:00:26.691160',10),(71,'package/image/2020/04/14/200313/in1.jpg','2020-04-14 20:03:13.354149',12),(73,'package/image/2020/04/14/200326/in3.jpg','2020-04-14 20:03:26.668802',12),(74,'package/image/2020/04/14/200537/in2.jpg','2020-04-14 20:05:37.724867',12),(75,'package/image/2020/04/14/200714/ol1.jpg','2020-04-14 20:07:14.751012',5),(76,'package/image/2020/04/14/200722/ol2.jpeg','2020-04-14 20:07:22.217159',5),(77,'package/image/2020/04/14/200729/ol3.png','2020-04-14 20:07:29.452246',5),(78,'package/image/2020/04/14/200846/vlc1.png','2020-04-14 20:08:46.399527',6),(79,'package/image/2020/04/14/200855/vlc2.gif','2020-04-14 20:08:55.783512',6),(80,'package/image/2020/04/14/200904/vlc3.png','2020-04-14 20:09:04.081818',6),(81,'package/image/2020/04/14/201145/aud1.jpg','2020-04-14 20:11:45.324984',39),(82,'package/image/2020/04/14/201203/aud3.png','2020-04-14 20:12:03.383434',39),(83,'package/image/2020/04/14/201210/aud4.png','2020-04-14 20:12:10.991552',39),(84,'package/image/2020/04/14/201217/aud5.png','2020-04-14 20:12:17.790130',39),(85,'package/image/2020/04/14/201420/dbv1.png','2020-04-14 20:14:20.106219',20),(86,'package/image/2020/04/14/201427/dbv2.png','2020-04-14 20:14:27.204993',20),(87,'package/image/2020/04/14/201434/dbv3.png','2020-04-14 20:14:34.181967',20),(88,'package/image/2020/04/14/201549/mdb1.png','2020-04-14 20:15:49.666469',25),(89,'package/image/2020/04/14/201556/mdb2.png','2020-04-14 20:15:56.303503',25),(90,'package/image/2020/04/14/201602/mdb3.png','2020-04-14 20:16:02.724680',25),(91,'package/image/2020/04/14/201751/sqs1.jpeg','2020-04-14 20:17:51.945251',32),(92,'package/image/2020/04/14/201758/sqs2.png','2020-04-14 20:17:58.011956',32),(93,'package/image/2020/04/14/201805/sqs3.jpg','2020-04-14 20:18:05.239323',32),(94,'package/image/2020/04/14/201854/dashboard.png','2020-04-14 20:18:54.309954',7),(95,'package/image/2020/04/14/201900/devices-01.png','2020-04-14 20:19:00.591479',7),(96,'package/image/2020/04/14/201906/devices-02.png','2020-04-14 20:19:06.832820',7),(97,'package/image/2020/04/14/202020/spf1.jpeg','2020-04-14 20:20:20.863740',31),(98,'package/image/2020/04/14/202027/spf2.png','2020-04-14 20:20:27.479194',31),(99,'package/image/2020/04/14/202035/spf3.png','2020-04-14 20:20:35.121451',31),(100,'package/image/2020/04/14/202214/tg.jpg','2020-04-14 20:22:14.848198',36),(101,'package/image/2020/04/14/202221/tg1.png','2020-04-14 20:22:21.598746',36),(102,'package/image/2020/04/14/202348/tg3.jpg','2020-04-14 20:22:29.691636',36),(103,'package/image/2020/04/14/202757/rst1.png','2020-04-14 20:27:57.824791',40),(104,'package/image/2020/04/14/202804/rst2.png','2020-04-14 20:28:04.161129',40),(105,'package/image/2020/04/14/202811/rst3.png','2020-04-14 20:28:11.349000',40),(106,'package/image/2020/04/14/202817/rst4.png','2020-04-14 20:28:17.269248',40),(107,'package/image/2020/04/14/202828/rst5.png','2020-04-14 20:28:28.756017',40),(108,'package/image/2020/04/14/203527/pdt1.png','2020-04-14 20:35:27.022552',21),(109,'package/image/2020/04/14/203533/pdt2.png','2020-04-14 20:35:33.791282',21),(110,'package/image/2020/04/14/203540/pdt3.png','2020-04-14 20:35:40.851115',21),(111,'package/image/2020/04/14/203722/cdt1.png','2020-04-14 20:37:22.436557',22),(112,'package/image/2020/04/14/203730/cdt2.png','2020-04-14 20:37:30.652146',22),(113,'package/image/2020/04/14/203737/cdt3.jpg','2020-04-14 20:37:37.226847',22),(114,'package/image/2020/04/14/205307/lo1.png','2020-04-14 20:53:07.143919',41),(115,'package/image/2020/04/14/205313/lo2.jpg','2020-04-14 20:53:13.385970',41),(116,'package/image/2020/04/14/205318/lo3.jpg','2020-04-14 20:53:18.365214',41),(117,'package/image/2020/04/14/205537/wps1.jpg','2020-04-14 20:55:37.567605',42),(118,'package/image/2020/04/14/205542/wps2.png','2020-04-14 20:55:42.458898',42),(119,'package/image/2020/04/14/205547/wps3.png','2020-04-14 20:55:47.241225',42),(120,'package/image/2020/04/14/205749/oo1.webp','2020-04-14 20:57:49.102066',43),(121,'package/image/2020/04/14/205754/oo2.webp','2020-04-14 20:57:54.110419',43),(122,'package/image/2020/04/14/205759/oo3.png','2020-04-14 20:57:59.471218',43),(123,'package/image/2020/04/14/210733/tb1.jpg','2020-04-14 21:07:33.022353',44),(124,'package/image/2020/04/14/210748/tb2.png','2020-04-14 21:07:48.835539',44),(125,'package/image/2020/04/14/210758/tb3.png','2020-04-14 21:07:58.121151',44),(126,'package/image/2020/04/14/210805/tb4.jpg','2020-04-14 21:08:05.171002',44),(127,'package/image/2020/04/14/211050/vv1.jpg','2020-04-14 21:10:50.985520',45),(128,'package/image/2020/04/14/211056/vv2.png','2020-04-14 21:10:56.186296',45),(129,'package/image/2020/04/14/211101/vv3.jpg','2020-04-14 21:11:01.483903',45),(130,'package/image/2020/04/14/211353/dio1.png','2020-04-14 21:13:53.234090',46),(131,'package/image/2020/04/14/211400/dio2.png','2020-04-14 21:14:00.502735',46),(132,'package/image/2020/04/14/211406/dio3.png','2020-04-14 21:14:06.444149',46),(133,'package/image/2020/04/14/212605/pc3.png','2020-04-14 21:26:05.848172',27),(134,'package/image/2020/04/14/212612/pc1.png','2020-04-14 21:26:12.123410',27),(135,'package/image/2020/04/14/212623/pc2.png','2020-04-14 21:26:23.439634',27),(136,'package/image/2020/04/14/212847/kr1.png','2020-04-14 21:28:47.282326',13),(137,'package/image/2020/04/14/212854/kr2.jpg','2020-04-14 21:28:54.225053',13),(138,'package/image/2020/04/14/212906/kr3.jpg','2020-04-14 21:29:06.207208',13),(139,'package/image/2020/04/14/213708/pt1.png','2020-04-14 21:37:08.825218',47),(140,'package/image/2020/04/14/213714/pt2.jpg','2020-04-14 21:37:14.270438',47),(141,'package/image/2020/04/14/213719/pt3.jpg','2020-04-14 21:37:19.213270',47),(142,'package/image/2020/04/14/214156/gv1.webp','2020-04-14 21:41:56.248917',48),(143,'package/image/2020/04/14/214202/gv2.png','2020-04-14 21:42:02.166273',48),(144,'package/image/2020/04/14/214206/gv3.png','2020-04-14 21:42:06.718639',48),(148,'package/image/2020/04/14/215745/mm1.jpg','2020-04-14 21:57:45.162018',50),(149,'package/image/2020/04/14/215750/mm2.png','2020-04-14 21:57:50.459930',50),(150,'package/image/2020/04/14/215756/mm3.png','2020-04-14 21:57:56.242655',50),(151,'package/image/2020/04/14/220453/bl1.jpg','2020-04-14 22:04:53.321005',51),(152,'package/image/2020/04/14/220458/bl2.jpg','2020-04-14 22:04:58.501147',51),(153,'package/image/2020/04/14/220503/bl3.jpg','2020-04-14 22:05:03.748639',51),(154,'package/image/2020/04/14/220826/sy1.webp','2020-04-14 22:08:26.842249',52),(155,'package/image/2020/04/14/220831/sy2.webp','2020-04-14 22:08:31.883915',52),(156,'package/image/2020/04/14/220838/sy3.webp','2020-04-14 22:08:38.532637',52),(157,'package/image/2020/04/14/221358/blm1.jpg','2020-04-14 22:13:58.325407',53),(158,'package/image/2020/04/14/221403/blm2.jpg','2020-04-14 22:14:03.350409',53),(159,'package/image/2020/04/14/221408/blm3.png','2020-04-14 22:14:08.160650',53),(160,'package/image/2020/04/14/224831/br1.jpg','2020-04-14 22:48:31.145021',54),(161,'package/image/2020/04/14/224836/br2.png','2020-04-14 22:48:36.913156',54),(162,'package/image/2020/04/14/224841/br3.jpg','2020-04-14 22:48:41.942416',54),(163,'package/image/2020/04/14/225146/lt1.png','2020-04-14 22:51:46.983358',55),(164,'package/image/2020/04/14/225151/lt2.webp','2020-04-14 22:51:51.923523',55),(165,'package/image/2020/04/14/225158/lt3.png','2020-04-14 22:51:58.099394',55),(166,'package/image/2020/04/14/225357/sl1.png','2020-04-14 22:53:57.163804',33),(167,'package/image/2020/04/14/225403/sl2.png','2020-04-14 22:54:03.772049',33),(168,'package/image/2020/04/14/225410/sl3.jpg','2020-04-14 22:54:10.612831',33),(169,'package/image/2020/04/14/225846/vs1.png','2020-04-14 22:58:46.364421',34),(170,'package/image/2020/04/14/225853/vs2.png','2020-04-14 22:58:53.976465',34),(171,'package/image/2020/04/14/225901/vs3.png','2020-04-14 22:59:01.273135',34),(172,'package/image/2020/04/14/230505/rt1.jpg','2020-04-14 23:05:05.806567',56),(173,'package/image/2020/04/14/230511/rt2.jpg','2020-04-14 23:05:11.831830',56),(174,'package/image/2020/04/14/230517/rt3.jpg','2020-04-14 23:05:17.270084',56),(175,'package/image/2020/04/14/230523/rt4.jpg','2020-04-14 23:05:23.028180',56),(176,'package/image/2020/04/14/231137/dt1.jpg','2020-04-14 23:11:37.570159',57),(177,'package/image/2020/04/14/231146/dt2.jpg','2020-04-14 23:11:46.326889',57),(178,'package/image/2020/04/14/231159/dt3.png','2020-04-14 23:11:59.864729',57),(179,'package/image/2020/04/14/232954/mix1.png','2020-04-14 23:29:54.664407',61),(180,'package/image/2020/04/14/232959/mix2.png','2020-04-14 23:29:59.756919',61),(181,'package/image/2020/04/14/233004/mix3.jpg','2020-04-14 23:30:04.633949',61),(182,'package/image/2020/04/14/233010/mix4.webp','2020-04-14 23:30:10.408830',61),(183,'package/image/2020/04/14/233231/ard1.png','2020-04-14 23:32:31.691401',62),(184,'package/image/2020/04/14/233236/ard2.png','2020-04-14 23:32:36.247918',62),(185,'package/image/2020/04/14/233240/ard3.png','2020-04-14 23:32:40.985162',62),(186,'package/image/2020/04/14/233600/hd1.png','2020-04-14 23:36:00.095317',63),(187,'package/image/2020/04/14/233605/hd2.png','2020-04-14 23:36:05.613516',63),(188,'package/image/2020/04/14/233610/hd3.png','2020-04-14 23:36:10.865223',63),(189,'package/image/2020/04/14/233832/gt1.jpg','2020-04-14 23:38:32.040623',64),(190,'package/image/2020/04/14/233837/gt2.jpg','2020-04-14 23:38:37.252168',64),(191,'package/image/2020/04/14/233844/gt3.jpg','2020-04-14 23:38:44.399229',64),(192,'package/image/2020/04/14/234209/qt1.png','2020-04-14 23:42:09.452270',65),(193,'package/image/2020/04/14/234214/qt2.png','2020-04-14 23:42:14.086989',65),(194,'package/image/2020/04/14/234219/qt3.png','2020-04-14 23:42:19.039719',65),(195,'package/image/2020/04/14/234224/qt4.png','2020-04-14 23:42:24.136889',65),(196,'package/image/2020/04/14/234523/lm1.png','2020-04-14 23:45:23.037236',66),(197,'package/image/2020/04/14/234533/lm2.png','2020-04-14 23:45:33.591126',66),(198,'package/image/2020/04/14/234539/lm3.png','2020-04-14 23:45:39.506366',66),(199,'package/image/2020/04/14/234544/lm4.jpg','2020-04-14 23:45:44.805734',66),(200,'package/image/2020/04/14/234845/ms1.png','2020-04-14 23:48:45.828276',67),(201,'package/image/2020/04/14/234850/ms2.png','2020-04-14 23:48:50.455594',67),(202,'package/image/2020/04/14/234855/ms3.jpg','2020-04-14 23:48:55.736088',67),(203,'package/image/2020/04/14/235138/rn1.png','2020-04-14 23:51:38.536590',68),(204,'package/image/2020/04/14/235143/rn2.png','2020-04-14 23:51:43.878247',68),(205,'package/image/2020/04/14/235148/rn3.jpg','2020-04-14 23:51:48.701217',68),(206,'package/image/2020/04/14/235154/rn4.png','2020-04-14 23:51:54.378957',68),(207,'package/image/2020/04/14/235714/vd1.jpg','2020-04-14 23:57:14.988940',69),(208,'package/image/2020/04/14/235719/vd2.jpg','2020-04-14 23:57:19.986666',69),(209,'package/image/2020/04/14/235724/vd3.jpg','2020-04-14 23:57:24.983952',69),(210,'package/image/2020/04/14/235730/vd4.jpg','2020-04-14 23:57:30.198768',69),(211,'package/image/2020/04/15/001514/ke1.png','2020-04-15 00:15:14.525182',70),(212,'package/image/2020/04/15/001524/ke2.jpg','2020-04-15 00:15:24.920947',70),(213,'package/image/2020/04/15/001533/ke3.png','2020-04-15 00:15:33.734089',70),(214,'package/image/2020/04/15/001541/ke4.png','2020-04-15 00:15:41.929101',70),(215,'package/image/2020/04/15/001721/lw1.jpg','2020-04-15 00:17:21.220387',71),(216,'package/image/2020/04/15/001727/lw2.jpg','2020-04-15 00:17:27.716657',71),(217,'package/image/2020/04/15/001735/lw3.jpg','2020-04-15 00:17:35.672544',71),(218,'package/image/2020/04/15/001742/lw4.jpg','2020-04-15 00:17:42.255262',71),(219,'package/image/2020/04/15/001921/oof1.webp','2020-04-15 00:19:21.810543',58),(220,'package/image/2020/04/15/001928/oof2.jpg','2020-04-15 00:19:28.415876',58),(221,'package/image/2020/04/15/001936/oof3.webp','2020-04-15 00:19:36.756708',58),(222,'package/image/2020/04/15/194736/jdt1.png','2020-04-15 19:47:36.731958',23),(223,'package/image/2020/04/15/194745/jdt2.png','2020-04-15 19:47:45.403692',23),(224,'package/image/2020/04/15/194753/jdt3.png','2020-04-15 19:47:53.876631',23),(225,'package/image/2020/04/15/194939/ins1.png','2020-04-15 19:49:39.658642',24),(226,'package/image/2020/04/15/194947/ins2.png','2020-04-15 19:49:47.328033',24),(227,'package/image/2020/04/15/194953/ins3.png','2020-04-15 19:49:53.941144',24),(228,'package/image/2020/04/15/195144/nb1.png','2020-04-15 19:51:44.312620',26),(229,'package/image/2020/04/15/195152/nb2.jpg','2020-04-15 19:51:52.679621',26),(230,'package/image/2020/04/15/195157/nb3.png','2020-04-15 19:51:57.773198',26),(231,'package/image/2020/04/15/195203/nb4.jpg','2020-04-15 19:52:03.335011',26),(232,'package/image/2020/04/15/195527/phs.png','2020-04-15 19:55:27.905146',28),(233,'package/image/2020/04/15/195533/phs1.jpg','2020-04-15 19:55:33.095886',28),(234,'package/image/2020/04/15/195538/phs2.jpg','2020-04-15 19:55:38.495292',28),(235,'package/image/2020/04/15/195728/ws1.png','2020-04-15 19:57:28.508554',35),(236,'package/image/2020/04/15/195734/ws2.png','2020-04-15 19:57:34.661905',35),(237,'package/image/2020/04/15/195742/ws3.png','2020-04-15 19:57:42.816534',35),(238,'package/image/2020/04/15/204520/rb1.png','2020-04-15 20:45:20.511153',30),(239,'package/image/2020/04/15/204528/rb2.png','2020-04-15 20:45:28.287944',30),(240,'package/image/2020/04/15/204536/rb3.jpeg','2020-04-15 20:45:36.229436',30),(241,'package/image/2020/04/23/191659/nn1.jpg','2020-04-23 19:16:59.161280',88),(242,'package/image/2020/04/23/191720/nn2.png','2020-04-23 19:17:20.041882',88),(243,'package/image/2020/04/23/191730/nn3.jpg','2020-04-23 19:17:30.328844',88),(244,'package/image/2020/04/23/191829/rs1.png','2020-04-23 19:18:29.082261',76),(245,'package/image/2020/04/23/191912/rs2.jpg','2020-04-23 19:19:12.633357',76),(246,'package/image/2020/04/23/192104/rs3.png','2020-04-23 19:21:04.764913',76),(247,'package/image/2020/04/23/200905/qtx1.png','2020-04-23 20:09:05.311351',77),(248,'package/image/2020/04/23/200920/qtx2.png','2020-04-23 20:09:20.156986',77),(249,'package/image/2020/04/23/200929/qtx3.png','2020-04-23 20:09:29.348575',77),(250,'package/image/2020/04/23/205042/fx1.jpeg','2020-04-23 20:50:42.658092',59),(251,'package/image/2020/04/23/205051/fx2.png','2020-04-23 20:50:51.293629',59),(252,'package/image/2020/04/23/205059/fx3.png','2020-04-23 20:50:59.085888',59),(253,'package/image/2020/04/23/210637/mpe1.png','2020-04-23 21:06:37.153230',60),(254,'package/image/2020/04/23/210647/mpe2.jpg','2020-04-23 21:06:47.222839',60),(255,'package/image/2020/04/23/210656/mp3.jpeg','2020-04-23 21:06:56.800792',60),(256,'package/image/2020/04/25/111722/ye1.ppm','2020-04-25 11:17:22.750316',91),(257,'package/image/2020/04/25/111729/ye2.png','2020-04-25 11:17:29.835748',91),(258,'package/image/2020/04/25/111738/ye3.png','2020-04-25 11:17:38.293269',91),(259,'package/image/2020/04/25/210150/et1.jpg','2020-04-25 21:01:50.916873',89),(260,'package/image/2020/04/25/210159/et2.jpg','2020-04-25 21:01:59.603352',89),(261,'package/image/2020/04/25/210208/et3.jpg','2020-04-25 21:02:08.634319',89),(262,'package/image/2020/04/25/215156/os1.jpg','2020-04-25 21:51:56.886975',92),(263,'package/image/2020/04/25/215202/os2.jpg','2020-04-25 21:52:02.629884',92),(264,'package/image/2020/04/25/215208/os3.jpg','2020-04-25 21:52:08.756896',92),(265,'package/image/2020/04/25/215909/ak1.jpg','2020-04-25 21:59:09.140110',90),(266,'package/image/2020/04/25/215919/ak2.jpg','2020-04-25 21:59:19.479801',90),(267,'package/image/2020/04/25/215929/ak3.jpg','2020-04-25 21:59:29.251963',90),(271,'package/image/2020/04/26/114639/ws1.jpg','2020-04-26 11:46:39.791029',72),(272,'package/image/2020/04/26/114649/ws2.jpg','2020-04-26 11:46:49.737342',72),(273,'package/image/2020/04/26/114658/ws3.png','2020-04-26 11:46:58.880284',72),(274,'package/image/2020/04/26/114828/vb1.jpg','2020-04-26 11:48:28.317603',73),(275,'package/image/2020/04/26/114836/vb2.jpg','2020-04-26 11:48:36.080888',73),(276,'package/image/2020/04/26/114843/vb3.jpg','2020-04-26 11:48:43.220357',73),(277,'package/image/2020/04/26/115225/wr1.png','2020-04-26 11:52:25.054585',74),(278,'package/image/2020/04/26/115234/wr2.jpeg','2020-04-26 11:52:34.248164',74),(279,'package/image/2020/04/26/115241/wr3.png','2020-04-26 11:52:41.681404',74),(280,'package/image/2020/04/26/115439/slk3.gif','2020-04-26 11:54:39.477569',75),(281,'package/image/2020/04/26/115446/slk1.jpg','2020-04-26 11:54:46.582554',75),(282,'package/image/2020/04/26/115458/slk2.png','2020-04-26 11:54:58.484762',75),(283,'package/image/2020/04/26/115621/ds1.jpg','2020-04-26 11:56:21.780551',78),(284,'package/image/2020/04/26/115627/ds2.png','2020-04-26 11:56:27.674744',78),(285,'package/image/2020/04/26/115654/ds3.jpeg','2020-04-26 11:56:54.146195',78),(286,'package/image/2020/04/27/201708/dg1.png','2020-04-27 20:17:08.421714',87),(287,'package/image/2020/04/27/201717/dg2.png','2020-04-27 20:17:17.407822',87),(288,'package/image/2020/04/27/201727/dg3.png','2020-04-27 20:17:27.334798',87),(289,'package/image/2020/04/27/203236/red1.png','2020-04-27 20:32:36.619186',85),(290,'package/image/2020/04/27/203243/red2.png','2020-04-27 20:32:43.503365',85),(291,'package/image/2020/04/27/203251/red3.png','2020-04-27 20:32:51.887628',85),(292,'package/image/2020/05/03/191522/sl1.jpg','2020-05-03 19:15:22.135994',94),(293,'package/image/2020/05/03/191530/sl2.png','2020-05-03 19:15:30.236884',94),(294,'package/image/2020/05/03/191539/sl3.png','2020-05-03 19:15:39.589869',94),(295,'package/image/2020/05/03/192432/rp1.png','2020-05-03 19:24:32.681818',95),(296,'package/image/2020/05/03/192439/rp2.png','2020-05-03 19:24:39.795846',95),(297,'package/image/2020/05/03/192445/rp3.png','2020-05-03 19:24:45.241383',95),(298,'package/image/2020/05/03/232421/kn1.png','2020-05-03 23:24:21.036524',121),(299,'package/image/2020/05/04/195635/gp1.jpg','2020-05-04 19:56:35.169565',112),(300,'package/image/2020/05/04/195644/gp2.jpg','2020-05-04 19:56:44.553082',112),(301,'package/image/2020/05/04/195655/gp3.png','2020-05-04 19:56:55.994902',112),(302,'package/image/2020/05/04/195906/kz1.png','2020-05-04 19:59:06.088770',113),(303,'package/image/2020/05/04/195917/kz2.png','2020-05-04 19:59:17.757866',113),(304,'package/image/2020/05/04/200057/fz1.jpg','2020-05-04 20:00:57.524825',114),(305,'package/image/2020/05/04/200104/fz2.jpg','2020-05-04 20:01:04.715368',114),(306,'package/image/2020/05/04/200340/bc1.jpeg','2020-05-04 20:03:40.710910',115),(307,'package/image/2020/05/04/200346/bc2.jpeg','2020-05-04 20:03:46.842397',115),(308,'package/image/2020/05/04/200354/bc3.png','2020-05-04 20:03:54.326862',115),(309,'package/image/2020/05/04/200519/fg1.png','2020-05-04 20:05:19.397584',116),(310,'package/image/2020/05/04/200532/fg2.jpg','2020-05-04 20:05:32.438041',116),(311,'package/image/2020/05/04/200538/fg3.png','2020-05-04 20:05:38.213085',116),(312,'package/image/2020/05/04/200744/vb1.png','2020-05-04 20:07:44.514971',117),(313,'package/image/2020/05/04/200750/vb2.png','2020-05-04 20:07:50.777015',117),(314,'package/image/2020/05/04/200758/vb.jpg','2020-05-04 20:07:58.647180',117),(315,'package/image/2020/05/04/201008/ts1.jpg','2020-05-04 20:10:08.667413',118),(316,'package/image/2020/05/04/201017/ts2.jpg','2020-05-04 20:10:17.077896',118),(317,'package/image/2020/05/04/201235/hb1.jpg','2020-05-04 20:12:35.865034',119),(318,'package/image/2020/05/04/201243/hb2.png','2020-05-04 20:12:43.018301',119),(319,'package/image/2020/05/04/201249/hb3.jpg','2020-05-04 20:12:49.797885',119),(320,'package/image/2020/05/04/201414/st1.png','2020-05-04 20:14:14.610787',120),(321,'package/image/2020/05/04/201422/st2.png','2020-05-04 20:14:22.152110',120),(322,'package/image/2020/05/04/201431/st3.jpg','2020-05-04 20:14:31.287275',120),(323,'package/image/2020/05/04/201616/ks1.png','2020-05-04 20:16:16.619617',121),(324,'package/image/2020/05/04/201623/ks2.jpg','2020-05-04 20:16:23.260523',121),(325,'package/image/2020/05/04/201820/pc3.jpg','2020-05-04 20:18:20.856247',29),(326,'package/image/2020/05/04/202048/pv.gif','2020-05-04 20:20:48.918476',108),(327,'package/image/2020/05/04/202100/pv1.png','2020-05-04 20:21:00.370530',108),(328,'package/image/2020/05/04/202106/pv2.png','2020-05-04 20:21:06.703142',108),(329,'package/image/2020/05/04/202211/ok.png','2020-05-04 20:22:11.753105',109),(330,'package/image/2020/05/04/202218/ok1.png','2020-05-04 20:22:18.321137',109),(331,'package/image/2020/05/04/202228/ok2.png','2020-05-04 20:22:28.846950',109),(332,'package/image/2020/05/04/202501/psv1.webp','2020-05-04 20:25:01.666372',110),(333,'package/image/2020/05/04/202507/psv2.jpg','2020-05-04 20:25:07.823645',110),(334,'package/image/2020/05/04/202513/psv3.webp','2020-05-04 20:25:13.973078',110),(335,'package/image/2020/05/04/202817/psb1.jpg','2020-05-04 20:28:17.404308',111),(336,'package/image/2020/05/04/202826/psb2.webp','2020-05-04 20:28:26.493050',111),(337,'package/image/2020/05/04/202833/psb3.png','2020-05-04 20:28:33.299153',111),(338,'package/image/2020/05/04/203042/sn.png','2020-05-04 20:30:42.418015',100),(339,'package/image/2020/05/04/203050/sn1.png','2020-05-04 20:30:50.434167',100),(340,'package/image/2020/05/04/203059/sn2.jpg','2020-05-04 20:30:59.603118',100),(341,'package/image/2020/05/04/203347/tl1.jpg','2020-05-04 20:33:47.297359',101),(342,'package/image/2020/05/04/203354/tl2.jpg','2020-05-04 20:33:54.080198',101),(343,'package/image/2020/05/04/203404/tl2.png','2020-05-04 20:34:04.568892',101),(344,'package/image/2020/05/04/203412/tl3.jpg','2020-05-04 20:34:12.486599',101),(345,'package/image/2020/05/04/203520/mt1.png','2020-05-04 20:35:20.798914',102),(346,'package/image/2020/05/04/203526/mt2.png','2020-05-04 20:35:26.799957',102),(347,'package/image/2020/05/04/203532/mt3.png','2020-05-04 20:35:32.564686',102),(348,'package/image/2020/05/04/203714/wn1.png','2020-05-04 20:37:14.514303',103),(349,'package/image/2020/05/04/203720/wn2.jpg','2020-05-04 20:37:20.403780',103),(350,'package/image/2020/05/04/203727/wn3.jpg','2020-05-04 20:37:27.912490',103),(351,'package/image/2020/05/04/204111/lv1.png','2020-05-04 20:41:11.195928',104),(352,'package/image/2020/05/04/204118/lv2.png','2020-05-04 20:41:18.607490',104),(353,'package/image/2020/05/04/204244/zt1.png','2020-05-04 20:42:44.792664',105),(354,'package/image/2020/05/04/204250/zt2.gif','2020-05-04 20:42:50.796597',105),(355,'package/image/2020/05/04/204256/zt3.png','2020-05-04 20:42:56.632931',105),(356,'package/image/2020/05/04/204439/bn1.png','2020-05-04 20:44:39.779901',106),(357,'package/image/2020/05/04/204446/bn2.png','2020-05-04 20:44:46.406100',106),(358,'package/image/2020/05/04/204454/bn3.jpg','2020-05-04 20:44:54.759710',106),(359,'package/image/2020/05/04/204615/ts1.png','2020-05-04 20:46:15.390985',107),(360,'package/image/2020/05/04/204626/ts2.png','2020-05-04 20:46:26.295190',107),(361,'package/image/2020/05/04/204635/ts3.gif','2020-05-04 20:46:35.204455',107),(362,'package/image/2020/05/04/204842/uc1.jpg','2020-05-04 20:48:42.870712',96),(363,'package/image/2020/05/04/204848/uc2.jpeg','2020-05-04 20:48:48.949463',96),(364,'package/image/2020/05/04/204855/uc3.jpg','2020-05-04 20:48:55.534410',96),(365,'package/image/2020/05/04/205024/fc1.png','2020-05-04 20:50:24.521836',97),(366,'package/image/2020/05/04/205031/fc2.jpg','2020-05-04 20:50:31.797844',97),(367,'package/image/2020/05/04/205039/fc3.jpg','2020-05-04 20:50:39.146572',97),(368,'package/image/2020/05/04/205152/ml1.jpg','2020-05-04 20:51:52.492754',98),(369,'package/image/2020/05/04/205158/ml2.png','2020-05-04 20:51:58.435870',98),(370,'package/image/2020/05/04/205205/ml3.png','2020-05-04 20:52:05.260856',98),(371,'package/image/2020/05/04/205423/tm1.jpg','2020-05-04 20:54:23.329498',122),(372,'package/image/2020/05/04/205431/tm2.jpg','2020-05-04 20:54:31.718315',122),(373,'package/image/2020/05/04/205438/tm3.png','2020-05-04 20:54:38.755312',122),(374,'package/image/2020/05/04/205623/txs1.png','2020-05-04 20:56:23.493132',123),(375,'package/image/2020/05/04/205630/txs3.jpg','2020-05-04 20:56:30.955441',123),(376,'package/image/2020/05/04/205805/tp1.png','2020-05-04 20:58:05.133308',124),(377,'package/image/2020/05/04/205813/tp2.png','2020-05-04 20:58:13.123932',124),(378,'package/image/2020/05/04/205820/tp3.jpg','2020-05-04 20:58:20.127114',124),(379,'package/image/2020/05/04/205935/gm1.png','2020-05-04 20:59:35.709751',125),(380,'package/image/2020/05/04/205941/gm2.png','2020-05-04 20:59:41.784978',125),(381,'package/image/2020/05/04/205947/gm3.png','2020-05-04 20:59:47.599511',125),(382,'package/image/2020/05/04/210057/kl1.png','2020-05-04 21:00:57.957404',126),(383,'package/image/2020/05/04/210105/kl2.png','2020-05-04 21:01:05.049391',126),(384,'package/image/2020/05/04/210112/kl3.jpg','2020-05-04 21:01:12.751180',126),(385,'package/image/2020/05/04/210252/lx.png','2020-05-04 21:02:52.141735',127),(386,'package/image/2020/05/04/210259/lx2.png','2020-05-04 21:02:59.931264',127),(387,'package/image/2020/05/04/210313/lx1.jpg','2020-05-04 21:03:13.633105',127),(388,'package/image/2020/05/04/210458/ols1.png','2020-05-04 21:04:58.156116',128),(389,'package/image/2020/05/04/210504/ols2.jpeg','2020-05-04 21:05:04.544707',128),(390,'package/image/2020/05/06/193521/bw2.jpg','2020-05-06 19:35:21.090337',129),(391,'package/image/2020/05/06/193528/bw1.jpg','2020-05-06 19:35:28.287551',129),(392,'package/image/2020/05/06/193534/bw3.png','2020-05-06 19:35:34.002261',129),(393,'package/image/2020/05/06/193732/bk1.png','2020-05-06 19:37:32.179613',130),(394,'package/image/2020/05/06/193738/bk2.jpg','2020-05-06 19:37:38.408070',130),(395,'package/image/2020/05/06/193745/bk3.png','2020-05-06 19:37:45.815482',130),(396,'package/image/2020/05/06/193903/cl1.jpg','2020-05-06 19:39:03.793169',131),(397,'package/image/2020/05/06/193910/cl2.jpg','2020-05-06 19:39:10.121175',131),(398,'package/image/2020/05/06/193915/cl3.jpg','2020-05-06 19:39:15.822127',131),(399,'package/image/2020/05/06/194130/fb1.jpg','2020-05-06 19:41:30.712526',132),(400,'package/image/2020/05/06/194138/fb2.png','2020-05-06 19:41:38.537475',132),(401,'package/image/2020/05/06/194146/fb3.png','2020-05-06 19:41:46.339456',132),(405,'package/image/2020/05/06/195157/tv1.jpg','2020-05-06 19:51:57.520286',135),(406,'package/image/2020/05/06/195343/tv1.png','2020-05-06 19:53:43.558841',136),(407,'package/image/2020/05/06/195351/tv2.jpg','2020-05-06 19:53:51.198913',136),(408,'package/image/2020/05/06/195357/tv3.jpg','2020-05-06 19:53:57.957602',136),(409,'package/image/2020/05/06/195603/rv1.jpg','2020-05-06 19:56:03.960046',137),(410,'package/image/2020/05/06/195611/rv2.png','2020-05-06 19:56:11.327583',137),(411,'package/image/2020/05/06/195618/rv3.png','2020-05-06 19:56:18.829912',137),(415,'package/image/2020/05/06/200113/x21.jpg','2020-05-06 20:01:13.961298',139),(416,'package/image/2020/05/06/200125/x22.png','2020-05-06 20:01:25.887052',139),(417,'package/image/2020/05/06/200134/x23.jpg','2020-05-06 20:01:34.433810',139),(421,'package/image/2020/05/06/200832/an1.png','2020-05-06 20:07:47.362356',141),(422,'package/image/2020/05/06/200843/an2.jpg','2020-05-06 20:08:43.523622',141),(423,'package/image/2020/05/06/200850/an3.jpg','2020-05-06 20:08:50.591611',141),(424,'package/image/2020/05/06/201216/fr1.png','2020-05-06 20:12:16.743629',142),(425,'package/image/2020/05/06/201223/fr2.jpeg','2020-05-06 20:12:23.852823',142),(426,'package/image/2020/05/06/201231/fr3.png','2020-05-06 20:12:31.284570',142);
/*!40000 ALTER TABLE `package_packageimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_packagerequest`
--

DROP TABLE IF EXISTS `package_packagerequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_packagerequest` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `icon` varchar(100) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `package_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `package_packagerequest_package_id_ac1e0e13_fk_package_package_id` (`package_id`),
  CONSTRAINT `package_packagerequest_package_id_ac1e0e13_fk_package_package_id` FOREIGN KEY (`package_id`) REFERENCES `package_package` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_packagerequest`
--

LOCK TABLES `package_packagerequest` WRITE;
/*!40000 ALTER TABLE `package_packagerequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `package_packagerequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_packageupload`
--

DROP TABLE IF EXISTS `package_packageupload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_packageupload` (
  `chunkedupload_ptr_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`chunkedupload_ptr_id`),
  KEY `package_packageuploa_customer_id_5e2ff5dc_fk_customer_` (`customer_id`),
  CONSTRAINT `package_packageuploa_customer_id_5e2ff5dc_fk_customer_` FOREIGN KEY (`customer_id`) REFERENCES `customer_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_packageupload`
--

LOCK TABLES `package_packageupload` WRITE;
/*!40000 ALTER TABLE `package_packageupload` DISABLE KEYS */;
/*!40000 ALTER TABLE `package_packageupload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_packageversion`
--

DROP TABLE IF EXISTS `package_packageversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_packageversion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(300) NOT NULL,
  `file` varchar(100) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `package_id` int NOT NULL,
  `hash` varchar(255) NOT NULL,
  `downloads` int DEFAULT NULL,
  `ipfs_cid` varchar(255) DEFAULT NULL,
  `ipfs_gateway` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `package_packageversion_package_id_726608e5_fk_package_package_id` (`package_id`),
  CONSTRAINT `package_packageversion_package_id_726608e5_fk_package_package_id` FOREIGN KEY (`package_id`) REFERENCES `package_package` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_packageversion`
--

LOCK TABLES `package_packageversion` WRITE;
/*!40000 ALTER TABLE `package_packageversion` DISABLE KEYS */;
INSERT INTO `package_packageversion` VALUES (2,'Version 80.0.3987.149','(openSUSE Build) (64-Bit)','package/version/2020/04/04/Arrow_right.svg','2020-04-04 13:16:58.285660','2020-04-07 18:47:15.860789',2,'28GSjyXlI1XAPxgCM54m',0,NULL,NULL),(3,'Version 80.0.3987.149','(openSUSE Build) (64-Bit)','package/version/2020/04/04/Arrow_right_507toyr.svg','2020-04-04 13:18:23.764313','2020-04-07 18:47:02.310541',3,'Qn6T8XDpW7r0liR5qZOX',0,NULL,NULL),(4,'b4','64-Bit','package/version/2020/04/04/Arrow_right_edks5nh.svg','2020-04-04 23:45:34.413322','2020-04-30 21:08:08.684500',4,'wCE2ZcvfHMUs7MZJNZ8A',3,NULL,NULL),(44,'75.0','test','package/version/2020/04/13/001929/Firefox.AppImage','2020-04-13 00:19:29.317262','2020-05-02 09:06:17.499148',1,'a502c6046bda79dd4dc7b42f8e821823',6,NULL,NULL);
/*!40000 ALTER TABLE `package_packageversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `public_publicpage`
--

DROP TABLE IF EXISTS `public_publicpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `public_publicpage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `path` varchar(500) NOT NULL,
  `content` longtext,
  `description` longtext,
  `keywords` longtext,
  `enabled` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_publicpage`
--

LOCK TABLES `public_publicpage` WRITE;
/*!40000 ALTER TABLE `public_publicpage` DISABLE KEYS */;
INSERT INTO `public_publicpage` VALUES (1,'Data protection','data-protection','<p>Website privacy statement and at the same time informing the data subjects in accordance with Article 13 and Article 14 of the EU Data Protection Regulation</p>\r\n\r\n<p>Thank you for your interest in our services. A.O.D. takes the protection of your personal data very seriously. We want you to know how we handle your data and how we use them.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><big><strong>General information</strong></big></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3>Details of the responsible body</h3>\r\n\r\n<p>Company: A.O.D.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3>&nbsp;</h3>\r\n\r\n<h3><big><strong>General data processing information</strong></big></h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Data concerned:</p>\r\n\r\n<p>The use of our website A.O.D.&nbsp;is usually possible without providing personal data. If you use our contact form, we use the data exclusively for the communication you requested. The collection and processing of the necessary data for participation in an A.O.D. measurement is regulated in a separate data protection agreement. This can be viewed at any time during the registration process and as a registered participant.</p>\r\n\r\n<p>Personal data will therefore only be collected if you provide us with this data of your own accord. No further personal data is collected. Any processing of your personal data beyond the scope of the statutory provisions will only be carried out on the basis of your express consent.</p>\r\n\r\n<p>Processing purpose: Contract execution</p>\r\n\r\n<p>Categories of recipients: public bodies in the case of overriding legal provisions, external service providers or other contractors or other external bodies, provided that the data subject has given his or her consent or that a transfer is permitted for overriding reasons of interest.</p>\r\n\r\n<p>Duration of data storage: The duration of data storage is governed by the statutory storage obligations and is generally 10 years.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3><big><strong>Specific information about the website</strong></big></h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The use of the contents and offers of A.O.D. is not evaluated in relation to the user. It is only stored user-related by logging the IP address. This means that neither personal user profiles nor user profiles using pseudonyms are created at A.O.D. The combination of your personal data with the data from the access logging via the IP address for the purpose of creating a personal user profile is excluded.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3><big><strong>Access Logging</strong></big></h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>This website uses Matomo (formerly Piwik) for the statistical evaluation of visitor accesses in order to improve the internet offer. A personal evaluation is not possible with this data. Matomo is configured in conformity with data protection and uses cookies. The information generated by the cookie regarding the use of the website is stored on the server of fitbase in Germany. The IP address is anonymized immediately after processing and before saving. The information generated by the cookie about your use of this website is not passed on to third parties.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3><big><strong>Use of own &quot;cookies&quot;</strong></big></h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>This website uses its own &quot;cookies&quot; to enhance user-friendliness (&quot;cookies&quot; are data records that are sent from the web server to the user&#39;s browser and stored there for later retrieval). No personal data is stored in our own &quot;cookies&quot;. You can generally prevent the use of &quot;cookies&quot; if you prohibit the storage of &quot;cookies&quot; in your browser.</p>\r\n\r\n<p>We use our own cookies, e.g. to note that information placed on our website has been displayed to you - so that it will not be displayed again the next time you visit the website. In this way, we want to enable you to use our website more conveniently and individually.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3><big><strong>Server log files</strong></big></h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Every time you use our website, we collect the data that your browser automatically transmits to enable you to visit the website. These are:</p>\r\n\r\n<p>&nbsp; &nbsp; IP address of the enquiring terminal device<br />\r\n&nbsp; &nbsp; Date and time of the request<br />\r\n&nbsp; &nbsp; Address of the website called up and the website requesting the information<br />\r\n&nbsp; &nbsp; Information on the browser and operating system used on the terminal device</p>\r\n\r\n<p>Data processing is necessary to enable you to visit our website and to ensure the functionality and security of our systems. For the purposes described above, the aforementioned data is also stored temporarily in internal log files in order to compile statistical data on the use of our website, to further develop our website with regard to the usage habits of our visitors (e.g. if the proportion of mobile devices with which the pages are called up increases) and for general administrative maintenance of our website.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><big><strong>Data security</strong></big></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>All A.O.D. systems in which your personal data is stored and processed are protected by strict measures and are only accessible to a selected and additionally trained group of employees. Data will not be passed on to third parties and is strictly prohibited to all employees.</p>\r\n\r\n<p>We maintain up-to-date technical measures to ensure data security, in particular to protect your personal data from dangers during data transfers and from third parties gaining knowledge of them. These measures are adapted to the current state of the art.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3><big><strong>Changes to the data protection declaration</strong></big></h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Further development of the A.O.D. system or technical changes may make it necessary to adapt this data protection declaration. We therefore reserve the right to amend the data protection declaration at any time and without giving reasons by publishing the amended data protection declaration.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3><big><strong>Further information and contacts</strong></big></h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>In addition, you may at any time exercise your rights of access, rectification or erasure, or limitation of processing, or exercise your right to object to processing, and your right to data transferability. In the imprint you will find the possibility to contact us by e-mail or letter. You also have the right to contact us in case of complaints.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Hamburg, march 2020</p>','','',1,'2020-04-29 19:58:39.555431','2020-05-01 19:14:48.415110'),(2,'Projects','projects','<p>Projects</p>','','',1,'2020-04-29 20:25:50.686855','2020-04-29 20:25:50.686894'),(3,'About Us','about-us','<p>App A.O.D. Store is a Universal application store inspired by the Linux App Store online service. It allows you to easily search and download applications that run on most Linux distributions using AppImages.</p>','','',1,'2020-04-29 20:26:17.634329','2020-05-01 21:14:18.035085'),(4,'How it works','how-it-works','<p>В основе проекта лежит одна простая идея одно - приложение - один файл лучшая реализация который, на мой взгляд, представлена AppImage. Так же есть ряд необходимых элементов без которых невозможна реализация всего проекта. Этими элементами являются Store-Web, Store-Desktop, Store-Console, которые будут описаны ниже. Все эти приложения так же собраны в отельные AppImage без каких - либо внешних зависимостей и должны в идеале запускаться на всех актуальных линукс системах.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><big>One app = one file</big></strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>AppImages are simple to understand. Every AppImage is a regular file, and every AppImage contains exactly one app with all its dependencies. Once the AppImage is made executable, a user can just run it, either by double clicking it in their desktop environment&rsquo;s file manager, by running it from the console etc.</p>\r\n\r\n<p>The AppImage is a compressed ISO image with an ELF binary header, it uses&nbsp;libz to decompress itself and&nbsp;<a href=\"http://fuse.sourceforge.net/\">fuse</a>&nbsp;to mount itself into a temporary directory, and then it just runs a script, letting you modify your environment and launch your App from within the unpacked bundle environment.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><big><strong>Store-Web</strong></big></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Сервер магазина приложений. Централизованное хранилище с которым работают все остальные клиенты, такие как Store-Desktop и Store-Console. Сервер предлагает как веб - интерфейс пользователя для поиска и просмотра информации по приложениям, так и веб - интерфейс администратора для управления коллекцией доступных приложений. Кроме того, сервер так же предоставляет API для работы Store-Desktop and Store-Console.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><big><strong>Store-Desktop</strong></big></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Предоставляет пользовательское приложения для взаимодействия с сервером, кроме того отвечает так же за интеграцию загруженных приложений с текущей системой. Ближайшими аналогами из мира дистрибутивов линукс являются KDE-Discover, Gnome-Software-Center и их аналоги.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><big><strong>Store-Console</strong></big></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Консольное приложение для взаимодействия с сервером. Реализует все тоже что и приложение с графическим интерфейсом но используя интерфейс коммандной строки. Кроме того имеет несколько дополнительных функций полезных для разработчиков и обеспечивающих возможность интеграции системы с системой сборки приложений для автоматической загрузки билда на сервер.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>','','',1,'2020-04-29 20:26:48.074456','2020-05-01 21:31:58.722355'),(5,'Impressum','impressum','<p>Information according to &sect; 5 TMG</p>\r\n\r\n<p>A.O.D.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><big><strong>Disclaimer</strong></big></p>\r\n\r\n<p><br />\r\n<strong>Liability for contents</strong><br />\r\nThe contents of our pages were created with the greatest care. However, we cannot assume any liability for the correctness, completeness and topicality of the contents. As a service provider, we are responsible for our own content on these pages according to &sect; 7 para.1 TMG (German Telemedia Act) and general laws. According to &sect;&sect; 8 to 10 TMG, we are not obliged to monitor transmitted or stored external information or to investigate circumstances that indicate illegal activity. Obligations to remove or block the use of information according to general laws remain unaffected. However, liability in this respect is only possible from the time of knowledge of a concrete infringement. If we become aware of any such infringements, we will remove such content immediately.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Liability for links</strong><br />\r\nOur offer contains links to external websites of third parties, on whose contents we have no influence. Therefore we cannot assume any liability for these external contents. The respective provider or operator of the sites is always responsible for the contents of the linked sites. The linked pages were checked for possible legal violations at the time of linking. Illegal contents were not identifiable at the time of linking. However, a permanent control of the contents of the linked pages is not reasonable without concrete evidence of a violation of the law. If we become aware of any infringements, we will remove such links immediately.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><big><strong>Copyright</strong></big></p>\r\n\r\n<p><br />\r\nThe contents and works on these pages created by the site operators are subject to German copyright law. The reproduction, editing, distribution and any kind of use outside the limits of copyright law require the written consent of the respective author or creator. Downloads and copies of these pages are only permitted for private, non-commercial use. Insofar as the content on this site was not created by the operator, the copyrights of third parties are respected. In particular, third-party content is marked as such. Should you nevertheless become aware of a copyright infringement, please inform us accordingly. If we become aware of any infringements, we will remove such contents immediately.</p>\r\n\r\n<p><br />\r\n&copy;2020 A.O.D. All rights reserved. All texts, pictures and graphics, as well as their design are subject to copyright and other laws for the protection of intellectual property. Reproduction or reproduction of even parts of the web pages and their contents is not permitted without the written consent of A.O.D.</p>','','',1,'2020-04-30 19:54:32.224411','2020-05-01 19:13:30.935898'),(6,'Terms and Conditions','terms-and-conditions','<p>The usage of this website is subject to the following terms of use. Please read them carefully before using this website. By using the online offers you agree to these terms of use.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>If, when using special offers, you transmit personal information to this website or make it available on this website, you declare your agreement that such information will be treated in accordance with the regulations in the A.O.D. online data protection declaration. A.O.D. may update or change these terms of use at any time. They are obligatory in their present version. If this website contains more specific regulations, these take precedence over the clauses of these terms of use. If you have questions about data protection, please read our data protection declaration.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><big><strong>Copyright protection</strong></big></p>\r\n\r\n<p><br />\r\nThe content of the A.O.D. website are protected by copyright. Viewing and downloading as well as temporary storage of individual web pages on a computer is permitted for all content on A.O.D. pages exclusively for non-commercial use. The content is not permitted to be changed or used in other electronic or printed publications without the written permission of the respective rights holder. This also applies to the reproduction, permanent storage or sending of content posted on these websites. A violation of these provisions obliges the immediate destruction of all printed or downloaded contents. We reserve the right to assert further claims for damages. Trademarks and business designations may be used in the present contents; even if they are not marked as such, the corresponding protection provisions apply.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><big><strong>Connection with other websites (links)</strong></big></p>\r\n\r\n<p><br />\r\nThis website contains links to the websites of other companies, which are not under the control of only provided as a service offer for the users. If you use such a link you will leave the A.O.D. website. A.O.D. cannot check all websites of other companies, it has no influence on and accepts no responsibility for these websites and their contents. In particular the inclusion of such links on the A.O.D. website does not mean that A.O.D. advertises these products, services, contents, information or the material offered or that there is a connection between A.O.D. and the aforementioned. Access to a website of other companies via a link on this website is the sole responsibility of the user. A.O.D. is not liable for linked contents.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><big><strong>Disclaimer of warranty</strong></big></p>\r\n\r\n<p><br />\r\nThe contents of this website are provided without any warranty of any kind, in particular for their correctness, completeness or suitability for certain purposes and, with regard to the contents, for their freedom from third-party rights and the non-infringement of intellectual property. A.O.D. may make changes to the content of this website at any time without prior notice. We make every effort to keep the content of this website up to date, but are not obliged to update it. A.O.D. assumes no guarantee for the accessibility, technical usability and freedom from viruses of the internet pages or transmitted files.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><big><strong>Liability</strong></big></p>\r\n\r\n<p><br />\r\nThe use of the contents provided on this website is at the sole risk of the user. A.O.D. or third parties mentioned on this website are not liable for possible damages. This does not apply in the case of intent and in the event that liability is mandatory by law. If the use of this website or the contents offered on it leads to damage to your equipment or your data, A.O.D. will not assume any costs for this.</p>\r\n\r\n<p>In addition to the generally regulated liability modalities, the following additional regulations apply to the use of A.O.D. content: A.O.D. accepts no liability if the information and information provided is misused contrary to its express purpose for self-diagnosis or self-treatment. The same applies if a necessary consultation with a doctor does not take place on the basis of the information and information provided. A.O.D. accepts no liability for contents made available for retrieval, unless it is a matter of intentional or grossly negligent misinformation. In view of the general informative character of the offer, liability in cases of slight negligence is excluded.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><big><strong>Applicable law</strong></big></p>\r\n\r\n<p><br />\r\nThis website is designed and provided by A.O.D.. The terms of use are subject to the law of the Federal Republic of Germany (FRG), excluding private international law and the UN Convention on Contracts for the International Sale of Goods. The place of jurisdiction for all legal disputes is Hamburg. A.O.D. is not responsible for whether the content of this website is suitable for use outside the Federal Republic of Germany or whether access to the content of this website is permitted outside the Federal Republic of Germany; such access is at the user&#39;s own instigation and risk. The user himself is responsible for compliance with the applicable local law.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><big><strong>Scope of services</strong></big></p>\r\n\r\n<p><br />\r\nWith the medical/health specific contents A.O.D. wants to give companies, employees and citizens in general the opportunity to inform themselves comprehensively about medical/health specific questions. The content presented provides information on the subject of health and is intended exclusively for the use of information. Authors and experts take great care to present the objective information in a form understandable to the layperson. The information is not a substitute for consultation or treatment by a licensed medical practitioners. In no case can it replace the advice of a medical doctor and/or a pharmacist. Furthermore, the contents of this website are not suitable for independently making diagnoses or starting treatment. Nor should the information or advice given be understood as a request for a specific treatment or for not treating a possible illness. The diagnosis or treatment of an illness or other ailment can only be made by consulting a doctor. Furthermore, the information and data provided must never be understood as an invitation to self-treatment or self-cognition of a disease or other condition.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><big><strong>Blocking</strong></big></p>\r\n\r\n<p><br />\r\nA.O.D. is entitled to block, partially or completely remove all or certain data of a user without prior notice or warning, or not to store the data provided by the user for uploading, provided that A.O.D. has the justified assumption that</p>\r\n\r\n<p>(1) constitute defamation or libel for other natural or legal persons<br />\r\n(2) violate protected rights such as copyrights and ancillary copyrights, trademark and other labelling rights, patent rights, business secrets or confidentiality agreements,<br />\r\n(3) cause damage to persons or property or harass persons in any other way<br />\r\n(4) violate the rights of other persons, such as the protection of privacy or the general right of personality,<br />\r\n(5) contain pornographic, obscene, otherwise indecent and offensive as well as illegal contents/data/references,<br />\r\n(6) incite or promote illegal and unconstitutional acts<br />\r\n(7) be liable to criminal or civil prosecution in accordance with applicable law<br />\r\n(8) and/or if the legitimate assumption exists that the user violates these conditions of participation.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><big><strong>Amendment of the Conditions of Participation</strong></big></p>\r\n\r\n<p><br />\r\nA.O.D. can update or change these conditions of participation at any time. The conditions of participation are binding in their respective version.<br />\r\nHamburg, March 2020</p>','','',1,'2020-05-01 19:19:19.667568','2020-05-01 19:27:37.525758'),(7,'Motivation','motivation','<p>Linus addresses some core issues of Linux on the desktop in his&nbsp;<a href=\"https://www.youtube.com/watch?v=5PmHRSeA2c8\" rel=\"nofollow\">DebConf 14_ QA with Linus Torvalds talk</a>.</p>\r\n\r\n<p>At 05:40 Linus highlights application packaging:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<pre>\r\nWe basically don&#39;t make binaries for Linux. Why? \r\nBecause binaries for Linux desktop applications is a major f*ing pain in the ass. \r\nRight. You don&#39;t make binaries for Linux. \r\nYou make binaries for Fedora 19, Fedora 20, maybe there&#39;s even like RHEL 5 from ten years ago, you make binaries for debian stable.</pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>So why not use the same approach as on Windows and OS X, namely, treat the base operating system as a&nbsp;<em>platform</em>&nbsp;on top of which we run the application we care about. This means that we have to bundle the application with all their dependencies that are&nbsp;<em>not</em>&nbsp;part of the base operating system.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>В то же время подход с репозиториями софта в линукс кажется мне очень удобным так же как и подход с app-store в android / iOS / OSX. В рамках этого проекта я пытаюсь&nbsp;совместить все эти подходы и предоставить удобную базу для дистибьюции приложений в мире линукс собрав воедино лучшие (на мой взгляд) техники и подходы других экосистем, с которыми мне приходилось сталкиваться.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>','','',1,'2020-05-01 19:40:05.409843','2020-05-01 21:13:32.206487');
/*!40000 ALTER TABLE `public_publicpage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-14 14:23:21
