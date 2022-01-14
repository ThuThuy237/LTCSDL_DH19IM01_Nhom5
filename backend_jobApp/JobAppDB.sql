-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: jobreferraldb
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
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
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add category',7,'add_category'),(26,'Can change category',7,'change_category'),(27,'Can delete category',7,'delete_category'),(28,'Can view category',7,'view_category'),(29,'Can add tag',8,'add_tag'),(30,'Can change tag',8,'change_tag'),(31,'Can delete tag',8,'delete_tag'),(32,'Can view tag',8,'view_tag'),(33,'Can add employer',9,'add_employer'),(34,'Can change employer',9,'change_employer'),(35,'Can delete employer',9,'delete_employer'),(36,'Can view employer',9,'view_employer'),(37,'Can add job applicant',10,'add_jobapplicant'),(38,'Can change job applicant',10,'change_jobapplicant'),(39,'Can delete job applicant',10,'delete_jobapplicant'),(40,'Can view job applicant',10,'view_jobapplicant'),(41,'Can add post',11,'add_post'),(42,'Can change post',11,'change_post'),(43,'Can delete post',11,'delete_post'),(44,'Can view post',11,'view_post'),(45,'Can add apply',12,'add_apply'),(46,'Can change apply',12,'change_apply'),(47,'Can delete apply',12,'delete_apply'),(48,'Can view apply',12,'view_apply'),(49,'Can add application',13,'add_application'),(50,'Can change application',13,'change_application'),(51,'Can delete application',13,'delete_application'),(52,'Can view application',13,'view_application'),(53,'Can add access token',14,'add_accesstoken'),(54,'Can change access token',14,'change_accesstoken'),(55,'Can delete access token',14,'delete_accesstoken'),(56,'Can view access token',14,'view_accesstoken'),(57,'Can add grant',15,'add_grant'),(58,'Can change grant',15,'change_grant'),(59,'Can delete grant',15,'delete_grant'),(60,'Can view grant',15,'view_grant'),(61,'Can add refresh token',16,'add_refreshtoken'),(62,'Can change refresh token',16,'change_refreshtoken'),(63,'Can delete refresh token',16,'delete_refreshtoken'),(64,'Can view refresh token',16,'view_refreshtoken'),(65,'Can add id token',17,'add_idtoken'),(66,'Can change id token',17,'change_idtoken'),(67,'Can delete id token',17,'delete_idtoken'),(68,'Can view id token',17,'view_idtoken'),(69,'Can add association',18,'add_association'),(70,'Can change association',18,'change_association'),(71,'Can delete association',18,'delete_association'),(72,'Can view association',18,'view_association'),(73,'Can add code',19,'add_code'),(74,'Can change code',19,'change_code'),(75,'Can delete code',19,'delete_code'),(76,'Can view code',19,'view_code'),(77,'Can add nonce',20,'add_nonce'),(78,'Can change nonce',20,'change_nonce'),(79,'Can delete nonce',20,'delete_nonce'),(80,'Can view nonce',20,'view_nonce'),(81,'Can add user social auth',21,'add_usersocialauth'),(82,'Can change user social auth',21,'change_usersocialauth'),(83,'Can delete user social auth',21,'delete_usersocialauth'),(84,'Can view user social auth',21,'view_usersocialauth'),(85,'Can add partial',22,'add_partial'),(86,'Can change partial',22,'change_partial'),(87,'Can delete partial',22,'delete_partial'),(88,'Can view partial',22,'view_partial'),(89,'Can add location',23,'add_location'),(90,'Can change location',23,'change_location'),(91,'Can delete location',23,'delete_location'),(92,'Can view location',23,'view_location');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
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
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_jobReferralApp_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_jobReferralApp_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobreferralapp_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-10-18 12:30:40.841770','1','admin',2,'[{\"changed\": {\"fields\": [\"Avatar\"]}}]',6,1),(2,'2021-10-18 12:57:00.312315','1','admin',2,'[{\"changed\": {\"fields\": [\"Avatar\"]}}]',6,1),(3,'2021-10-18 13:08:20.665392','1','Data Analysis',1,'[{\"added\": {}}]',7,1),(4,'2021-10-18 13:15:32.883733','2','VietNam',1,'[{\"added\": {}}]',23,1),(5,'2021-10-18 13:16:40.758417','4','MyWeb',1,'[{\"added\": {}}]',9,1),(6,'2021-10-18 13:17:18.033861','1','Data Analysis',1,'[{\"added\": {}}]',8,1),(7,'2021-10-18 13:17:23.760824','2','IT',1,'[{\"added\": {}}]',8,1),(8,'2021-10-18 13:17:38.248517','1','Job1',1,'[{\"added\": {}}]',11,1),(9,'2021-10-18 13:46:03.024543','2','Marketing',1,'[{\"added\": {}}]',7,1),(10,'2021-10-18 13:47:16.922606','2','TTDemy',1,'[{\"added\": {}}]',9,1),(11,'2021-10-18 13:47:28.855286','3','Marketing',1,'[{\"added\": {}}]',8,1),(12,'2021-10-18 13:47:58.800853','2','Post2',1,'[{\"added\": {}}]',11,1),(13,'2021-10-19 08:53:11.074237','3','Post 3',1,'[{\"added\": {}}]',11,1),(14,'2021-10-19 10:16:35.117954','4','newPost',1,'[{\"added\": {}}]',11,1),(15,'2021-10-19 10:18:51.157456','5','TestPost',1,'[{\"added\": {}}]',11,1),(16,'2021-10-20 13:29:38.392697','3','VietNam',1,'[{\"added\": {}}]',23,1),(17,'2021-10-20 13:29:49.058212','4','VietNam',1,'[{\"added\": {}}]',23,1),(18,'2021-10-21 15:15:38.640204','8','companyname',3,'',9,1),(19,'2021-10-22 16:47:51.119054','1','Job1',2,'[{\"changed\": {\"fields\": [\"Salary\"]}}]',11,1),(20,'2021-10-22 16:48:02.597367','2','Post2',2,'[{\"changed\": {\"fields\": [\"Salary\"]}}]',11,1),(21,'2021-10-22 16:48:09.277664','3','Post 3',2,'[{\"changed\": {\"fields\": [\"Salary\"]}}]',11,1),(22,'2021-10-22 16:48:16.179429','4','newPost',2,'[{\"changed\": {\"fields\": [\"Salary\"]}}]',11,1),(23,'2021-10-22 16:48:22.647581','5','TestPost',2,'[{\"changed\": {\"fields\": [\"Salary\"]}}]',11,1),(24,'2021-10-23 11:00:07.877981','12','ihihi',3,'',6,1),(25,'2021-10-23 11:00:07.882797','11','hihihi',3,'',6,1),(26,'2021-10-23 11:00:07.887587','10','hihi',3,'',6,1),(27,'2021-10-23 11:00:07.891139','9','newuser',3,'',6,1),(28,'2021-10-23 11:08:21.730728','17','thuthu',3,'',6,1),(29,'2021-10-23 11:08:21.736618','16','thu',3,'',6,1),(30,'2021-10-23 11:08:21.741084','15','newusers',3,'',6,1),(31,'2021-10-23 11:08:21.745266','14','newuser',3,'',6,1),(32,'2021-10-23 11:08:21.748610','13','hi',3,'',6,1),(33,'2021-10-23 11:13:14.241520','19','thuthuhi',3,'',6,1),(34,'2021-10-23 11:13:14.248437','18','thuthu',3,'',6,1),(35,'2021-12-19 08:32:26.980455','3','Information Technology - Sofware',1,'[{\"added\": {}}]',7,1),(36,'2021-12-19 08:33:53.218664','5','Hong Kong',1,'[{\"added\": {}}]',23,1),(37,'2021-12-19 08:36:15.691328','4','Sofware',1,'[{\"added\": {}}]',8,1),(38,'2021-12-19 08:36:25.786884','10','Java Technical Developer',1,'[{\"added\": {}}]',11,1),(39,'2021-12-19 08:37:31.530986','11','Haskell Developer - Remote (open for Expats)',1,'[{\"added\": {}}]',11,1),(40,'2021-12-19 08:38:43.027302','4','IT - Mobie',1,'[{\"added\": {}}]',7,1),(41,'2021-12-19 08:38:56.045814','5','Mobie',1,'[{\"added\": {}}]',8,1),(42,'2021-12-19 08:39:02.847933','6','IOS',1,'[{\"added\": {}}]',8,1),(43,'2021-12-19 08:39:05.132644','12','iOS Mobile Application Developer',1,'[{\"added\": {}}]',11,1),(44,'2021-12-19 08:50:36.098473','5','Construction Industry',1,'[{\"added\": {}}]',7,1),(45,'2021-12-19 08:51:02.279215','13','02 Regional Project Directors (Based in Philippines)',1,'[{\"added\": {}}]',11,1),(46,'2021-12-19 10:37:51.630135','2','TTDemy',2,'[{\"changed\": {\"fields\": [\"Logo image\"]}}]',9,1),(47,'2021-12-19 10:38:16.658801','4','Hrent',2,'[{\"changed\": {\"fields\": [\"Company name\", \"Logo image\"]}}, {\"changed\": {\"name\": \"post\", \"object\": \"Hi\", \"fields\": [\"Description\"]}}]',9,1),(48,'2021-12-19 17:03:21.191383','13','02 Regional Project Directors (Based in Philippines)',2,'[{\"changed\": {\"fields\": [\"Employer\"]}}]',11,1);
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
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(12,'jobReferralApp','apply'),(7,'jobReferralApp','category'),(9,'jobReferralApp','employer'),(10,'jobReferralApp','jobapplicant'),(23,'jobReferralApp','location'),(11,'jobReferralApp','post'),(8,'jobReferralApp','tag'),(6,'jobReferralApp','user'),(14,'oauth2_provider','accesstoken'),(13,'oauth2_provider','application'),(15,'oauth2_provider','grant'),(17,'oauth2_provider','idtoken'),(16,'oauth2_provider','refreshtoken'),(5,'sessions','session'),(18,'social_django','association'),(19,'social_django','code'),(20,'social_django','nonce'),(22,'social_django','partial'),(21,'social_django','usersocialauth');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-10-15 03:48:46.667547'),(2,'contenttypes','0002_remove_content_type_name','2021-10-15 03:48:46.983527'),(3,'auth','0001_initial','2021-10-15 03:48:47.583439'),(4,'auth','0002_alter_permission_name_max_length','2021-10-15 03:48:47.763431'),(5,'auth','0003_alter_user_email_max_length','2021-10-15 03:48:47.789751'),(6,'auth','0004_alter_user_username_opts','2021-10-15 03:48:47.813947'),(7,'auth','0005_alter_user_last_login_null','2021-10-15 03:48:47.833485'),(8,'auth','0006_require_contenttypes_0002','2021-10-15 03:48:47.843277'),(9,'auth','0007_alter_validators_add_error_messages','2021-10-15 03:48:47.861670'),(10,'auth','0008_alter_user_username_max_length','2021-10-15 03:48:47.904667'),(11,'auth','0009_alter_user_last_name_max_length','2021-10-15 03:48:47.914127'),(12,'auth','0010_alter_group_name_max_length','2021-10-15 03:48:48.024553'),(13,'auth','0011_update_proxy_permissions','2021-10-15 03:48:48.042700'),(14,'auth','0012_alter_user_first_name_max_length','2021-10-15 03:48:48.060031'),(15,'jobReferralApp','0001_initial','2021-10-15 03:48:50.295076'),(16,'admin','0001_initial','2021-10-15 03:48:50.538351'),(17,'admin','0002_logentry_remove_auto_add','2021-10-15 03:48:50.551617'),(18,'admin','0003_logentry_add_action_flag_choices','2021-10-15 03:48:50.565718'),(19,'oauth2_provider','0001_initial','2021-10-15 03:48:51.881240'),(20,'oauth2_provider','0002_auto_20190406_1805','2021-10-15 03:48:52.013342'),(21,'oauth2_provider','0003_auto_20201211_1314','2021-10-15 03:48:52.145058'),(22,'oauth2_provider','0004_auto_20200902_2022','2021-10-15 03:48:52.852915'),(23,'sessions','0001_initial','2021-10-15 03:48:52.923377'),(24,'default','0001_initial','2021-10-15 03:48:53.520896'),(25,'social_auth','0001_initial','2021-10-15 03:48:53.529609'),(26,'default','0002_add_related_name','2021-10-15 03:48:53.563189'),(27,'social_auth','0002_add_related_name','2021-10-15 03:48:53.570250'),(28,'default','0003_alter_email_max_length','2021-10-15 03:48:53.679558'),(29,'social_auth','0003_alter_email_max_length','2021-10-15 03:48:53.687223'),(30,'default','0004_auto_20160423_0400','2021-10-15 03:48:53.717783'),(31,'social_auth','0004_auto_20160423_0400','2021-10-15 03:48:53.724459'),(32,'social_auth','0005_auto_20160727_2333','2021-10-15 03:48:53.766594'),(33,'social_django','0006_partial','2021-10-15 03:48:53.858057'),(34,'social_django','0007_code_timestamp','2021-10-15 03:48:53.952854'),(35,'social_django','0008_partial_timestamp','2021-10-15 03:48:54.119553'),(36,'social_django','0009_auto_20191118_0520','2021-10-15 03:48:54.332132'),(37,'social_django','0010_uid_db_index','2021-10-15 03:48:54.392169'),(38,'social_django','0002_add_related_name','2021-10-15 03:48:54.404496'),(39,'social_django','0003_alter_email_max_length','2021-10-15 03:48:54.412568'),(40,'social_django','0004_auto_20160423_0400','2021-10-15 03:48:54.421275'),(41,'social_django','0001_initial','2021-10-15 03:48:54.429791'),(42,'social_django','0005_auto_20160727_2333','2021-10-15 03:48:54.438465'),(43,'jobReferralApp','0002_auto_20211018_2006','2021-10-18 13:06:52.393698'),(44,'jobReferralApp','0003_auto_20211018_2043','2021-10-18 13:43:54.836717'),(45,'jobReferralApp','0004_alter_apply_date_apply','2021-10-18 13:43:55.076476'),(46,'jobReferralApp','0005_auto_20211019_1709','2021-10-19 10:09:48.454080'),(47,'jobReferralApp','0006_rename_address_post_address','2021-10-20 10:40:22.214284'),(48,'jobReferralApp','0007_alter_user_avatar','2021-10-20 12:54:35.995359'),(49,'jobReferralApp','0008_post_salary','2021-10-20 14:02:26.033714'),(50,'jobReferralApp','0009_auto_20211022_2336','2021-10-22 16:36:40.088972'),(51,'jobReferralApp','0010_auto_20211204_1518','2021-12-04 08:18:20.712216'),(52,'jobReferralApp','0011_employer_logo_image','2021-12-19 10:36:25.278518'),(53,'jobReferralApp','0012_apply_comment','2021-12-20 07:04:20.987276'),(54,'jobReferralApp','0013_auto_20211220_1647','2021-12-20 09:47:09.278988'),(55,'jobReferralApp','0014_auto_20211222_1105','2021-12-22 04:05:43.262390');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1xd3ikn0y624dxu7paxmob1uv5n45pqj','.eJxVjEEOwiAQRe_C2hBgOmBduu8ZyACDVA0kpV0Z765NutDtf-_9l_C0rcVvnRc_J3ERWpx-t0DxwXUH6U711mRsdV3mIHdFHrTLqSV-Xg_376BQL9-atWVLSXPKVllrY0BwkJ3JGUfWCkdUGgnNWZNjdAzIeYCBgcEZdOL9AeFWN1I:1mc5k3:Ff5j1b32umRrDs4jz4fFDQzxFUrnNCL5pRiXucvIzGs','2021-10-31 12:58:19.993709'),('3xal4cogd3xrmxw5sfmsn5kl166qfw8z','.eJxVjEEOwiAQRe_C2hBgOmBduu8ZyACDVA0kpV0Z765NutDtf-_9l_C0rcVvnRc_J3ERWpx-t0DxwXUH6U711mRsdV3mIHdFHrTLqSV-Xg_376BQL9-atWVLSXPKVllrY0BwkJ3JGUfWCkdUGgnNWZNjdAzIeYCBgcEZdOL9AeFWN1I:1mdxRN:6Rac8qvDLvLEa13Cj7jhUs-8jUWByDj_u24aog_46to','2021-11-05 16:30:45.339595'),('fcz3lckod517kv5xue24lzbkndaka9ot','.eJxVjEEOwiAURO_C2hCg_AIu3fcM5MMHqRpISrsy3t026UJ3k3lv5s08bmvxW0-Ln4ldGbDLbxcwPlM9AD2w3huPra7LHPih8JN2PjVKr9vp_h0U7GVfC2cBRVDkiLTBwRijA2SZlMhByIjGkaIhO9gDBildsnaEiFFYnUdgny_jGDfi:1mjFLN:G3vKqjoNr0gHwt9jlDJn1Qys5hVMGblrLKL3Tmxc0ZI','2021-11-20 06:38:25.828007'),('h5exkxplck0d06v0343ccc14xjb88vq7','.eJxVjEEOwiAURO_C2hCg_AIu3fcM5MMHqRpISrsy3t026UJ3k3lv5s08bmvxW0-Ln4ldGbDLbxcwPlM9AD2w3huPra7LHPih8JN2PjVKr9vp_h0U7GVfC2cBRVDkiLTBwRijA2SZlMhByIjGkaIhO9gDBildsnaEiFFYnUdgny_jGDfi:1mt8Si:eHkQztPisRF4gVm7QM2vfqBQVJUHzFYd_T-nvhZDFjk','2021-12-17 13:18:52.399371'),('kmhfrytn4a69z2q307e21y0a9efzt6a1','.eJxVjEEOwiAQRe_C2hBgOmBduu8ZyACDVA0kpV0Z765NutDtf-_9l_C0rcVvnRc_J3ERWpx-t0DxwXUH6U711mRsdV3mIHdFHrTLqSV-Xg_376BQL9-atWVLSXPKVllrY0BwkJ3JGUfWCkdUGgnNWZNjdAzIeYCBgcEZdOL9AeFWN1I:1mbGZH:qKMhX35VIDe1mSEL3KbR40tIskdSVaKuJQ6KQtnyUH4','2021-10-29 06:19:47.713554'),('puuae3t18c30axde5jvznkhin3yhuil8','.eJxVjEEOwiAQRe_C2hBgOmBduu8ZyACDVA0kpV0Z765NutDtf-_9l_C0rcVvnRc_J3ERWpx-t0DxwXUH6U711mRsdV3mIHdFHrTLqSV-Xg_376BQL9-atWVLSXPKVllrY0BwkJ3JGUfWCkdUGgnNWZNjdAzIeYCBgcEZdOL9AeFWN1I:1meEkl:e0hj51AHLdTyM1FXbd6-omlLlZYaK5fk02HVhb-24Z4','2021-11-06 10:59:55.921907'),('qisu7arosu94ywyb17escva1x5wiaagn','.eJxVjEEOwiAQRe_C2hBgOmBduu8ZyACDVA0kpV0Z765NutDtf-_9l_C0rcVvnRc_J3ERWpx-t0DxwXUH6U711mRsdV3mIHdFHrTLqSV-Xg_376BQL9-atWVLSXPKVllrY0BwkJ3JGUfWCkdUGgnNWZNjdAzIeYCBgcEZdOL9AeFWN1I:1mytYj:XUJCBLiWLfQgCIf2oTdB0hm1fM8Xz2oCcY-GST_eo6c','2022-01-02 10:36:53.839707'),('u5w5sfbi87bf2e4ysul5vrp7jukghsiq','.eJxVjEEOwiAQRe_C2hBgOmBduu8ZyACDVA0kpV0Z765NutDtf-_9l_C0rcVvnRc_J3ERWpx-t0DxwXUH6U711mRsdV3mIHdFHrTLqSV-Xg_376BQL9-atWVLSXPKVllrY0BwkJ3JGUfWCkdUGgnNWZNjdAzIeYCBgcEZdOL9AeFWN1I:1mbJYE:ut5SWXPOo4JcrWkdtqJapMtnWYYCZzuHvdKN8cZ2pqA','2021-10-29 09:30:54.204885'),('wu1i9bc3jp5nnl5p1x4o6atevcpud8tr','.eJxVjEEOwiAQRe_C2hBgOmBduu8ZyACDVA0kpV0Z765NutDtf-_9l_C0rcVvnRc_J3ERWpx-t0DxwXUH6U711mRsdV3mIHdFHrTLqSV-Xg_376BQL9-atWVLSXPKVllrY0BwkJ3JGUfWCkdUGgnNWZNjdAzIeYCBgcEZdOL9AeFWN1I:1mzL9d:0WWgY8zgcRZnxW5KuIhKOCmTIKwbxbmBygMhka2zUm8','2022-01-03 16:04:49.558927');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobreferralapp_apply`
--

DROP TABLE IF EXISTS `jobreferralapp_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobreferralapp_apply` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date_apply` datetime(6) NOT NULL,
  `status` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `stars` int DEFAULT NULL,
  `post_id` bigint NOT NULL,
  `applicant_id` bigint NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `jobReferralApp_apply_post_id_b20e49dc_fk_jobReferralApp_post_id` (`post_id`),
  KEY `jobReferralApp_apply_applicant_id_a1ae9829_fk_jobReferr` (`applicant_id`),
  CONSTRAINT `jobReferralApp_apply_applicant_id_a1ae9829_fk_jobReferr` FOREIGN KEY (`applicant_id`) REFERENCES `jobreferralapp_jobapplicant` (`user_id`),
  CONSTRAINT `jobReferralApp_apply_post_id_b20e49dc_fk_jobReferralApp_post_id` FOREIGN KEY (`post_id`) REFERENCES `jobreferralapp_post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobreferralapp_apply`
--

LOCK TABLES `jobreferralapp_apply` WRITE;
/*!40000 ALTER TABLE `jobreferralapp_apply` DISABLE KEYS */;
INSERT INTO `jobreferralapp_apply` VALUES (1,'2021-12-20 07:37:26.075468','A',4,13,5,'Nice !'),(2,'2021-12-20 08:16:31.963959','R',NULL,12,5,NULL),(3,'2021-12-24 08:06:00.341660','A',5,23,7,'Very helpful counselor that helped me through all the process to my new job !'),(4,'2021-12-24 08:06:36.534103','P',NULL,11,7,NULL),(5,'2021-12-24 08:08:21.258783','A',2,10,7,'unfriendlly');
/*!40000 ALTER TABLE `jobreferralapp_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobreferralapp_category`
--

DROP TABLE IF EXISTS `jobreferralapp_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobreferralapp_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobreferralapp_category`
--

LOCK TABLES `jobreferralapp_category` WRITE;
/*!40000 ALTER TABLE `jobreferralapp_category` DISABLE KEYS */;
INSERT INTO `jobreferralapp_category` VALUES (1,'Data Analysis',NULL),(2,'Marketing',NULL),(3,'Information Technology - Sofware',NULL),(4,'IT - Mobie',NULL),(5,'Construction Industry',NULL);
/*!40000 ALTER TABLE `jobreferralapp_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobreferralapp_employer`
--

DROP TABLE IF EXISTS `jobreferralapp_employer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobreferralapp_employer` (
  `company_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact_email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `contact_phone` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `is_accepted` tinyint(1) NOT NULL,
  `user_id` bigint NOT NULL,
  `logo_image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `contact_phone` (`contact_phone`),
  CONSTRAINT `jobReferralApp_emplo_user_id_70fa6c1c_fk_jobReferr` FOREIGN KEY (`user_id`) REFERENCES `jobreferralapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobreferralapp_employer`
--

LOCK TABLES `jobreferralapp_employer` WRITE;
/*!40000 ALTER TABLE `jobreferralapp_employer` DISABLE KEYS */;
INSERT INTO `jobreferralapp_employer` VALUES ('TTDemy','Go Vap','npthuthuy237@gmail.com','+84941662402',1,2,'static/uploads/images/2021/12/biglogo.png'),('Hrent','HCM','1851050140thuy@ou.edu.vn','+84941662403',1,4,'static/uploads/images/2021/12/hrent.com.png'),('Platinum Corporation ','San Diego, CA','plat.care@gmail.com','+84941762422',0,8,'static/uploads/images/2021/12/creative-logo-or-icon-design-template-d6cdd0b35fc4b69ddc32_auaTM3j.jpg');
/*!40000 ALTER TABLE `jobreferralapp_employer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobreferralapp_jobapplicant`
--

DROP TABLE IF EXISTS `jobreferralapp_jobapplicant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobreferralapp_jobapplicant` (
  `cv` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cover_letter` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `phone` (`phone`),
  CONSTRAINT `jobReferralApp_jobap_user_id_14b10ee4_fk_jobReferr` FOREIGN KEY (`user_id`) REFERENCES `jobreferralapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobreferralapp_jobapplicant`
--

LOCK TABLES `jobreferralapp_jobapplicant` WRITE;
/*!40000 ALTER TABLE `jobreferralapp_jobapplicant` DISABLE KEYS */;
INSERT INTO `jobreferralapp_jobapplicant` VALUES ('static/uploads/cv/2021/12/cv2.pdf','','0123456788',5,'2 Cong xa Paris, Ben Nghe, tp. Ho Chi Minh, Ho Chi Minh, Vietnam'),('static/uploads/cv/2021/12/cv2_GeDR6zW.pdf','static/uploads/coverLetter/2021/12/The-cover-letter.pdf','',7,'');
/*!40000 ALTER TABLE `jobreferralapp_jobapplicant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobreferralapp_location`
--

DROP TABLE IF EXISTS `jobreferralapp_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobreferralapp_location` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobreferralapp_location`
--

LOCK TABLES `jobreferralapp_location` WRITE;
/*!40000 ALTER TABLE `jobreferralapp_location` DISABLE KEYS */;
INSERT INTO `jobreferralapp_location` VALUES (2,'VietNam','Ho Chi Minh City'),(3,'VietNam','Ha Noi'),(4,'VietNam','Da Nang'),(5,'Hong Kong','City of Victoria');
/*!40000 ALTER TABLE `jobreferralapp_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobreferralapp_post`
--

DROP TABLE IF EXISTS `jobreferralapp_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobreferralapp_post` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `category_id` bigint DEFAULT NULL,
  `employer_id` bigint NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location_id` bigint NOT NULL,
  `salary` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jobReferralApp_post_category_id_b5a3a96c_fk_jobReferr` (`category_id`),
  KEY `jobReferralApp_post_employer_id_72a4f46f_fk_jobReferr` (`employer_id`),
  KEY `jobReferralApp_post_location_id_128782af_fk_jobReferr` (`location_id`),
  CONSTRAINT `jobReferralApp_post_category_id_b5a3a96c_fk_jobReferr` FOREIGN KEY (`category_id`) REFERENCES `jobreferralapp_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobreferralapp_post`
--

LOCK TABLES `jobreferralapp_post` WRITE;
/*!40000 ALTER TABLE `jobreferralapp_post` DISABLE KEYS */;
INSERT INTO `jobreferralapp_post` VALUES (2,'Post2','<p>des1</p>','static/uploads/images/2021/10/biglogo.png','2021-10-18 00:00:00.000000','2021-10-22 16:48:02.597367',1,2,2,'Tan Binh',3,0),(4,'newPost','<h1>Hello</h1>\r\n\r\n<p>this is a description</p>','static/uploads/images/2021/10/contact.png','2021-10-19 10:16:35.111519','2021-12-22 16:55:32.314643',0,2,4,'Binh Thanh',2,0),(5,'TestPost','<p>hi</p>','static/uploads/images/2021/10/contact_ExQPZAS.png','2021-10-19 10:18:51.152455','2021-10-22 16:48:22.641965',1,1,2,'10 District',2,0),(8,'Job2','<p>test</p>','static/uploads/images/2021/10/biglogo.png','2021-10-19 10:18:51.152455','2021-10-22 16:48:22.641965',1,1,2,'null',4,0),(9,'Hi','<p>hi</p>','static/uploads/images/2021/10/biglogo.png','2021-10-19 10:18:51.152455','2021-12-21 12:28:30.277959',0,1,4,'null',3,0),(10,'Java Technical Developer ( 2 Dev)','<h3><u><em><strong>JOB DESCRIPTION</strong></em></u></h3>\r\n\r\n<p><em><strong>PERSOLKELLY Vietnam&#39;s client is a leading global information services and solutions company looking for a Java Technical Developer (Technical Consultant) in APAC Region. Main responsibilities as below:</strong></em></p>\r\n\r\n<ul>\r\n	<li>Conduct data gap analyses</li>\r\n	<li>Conduct interface mapping</li>\r\n	<li>Create Technical Documents as required</li>\r\n	<li>Conduct technical training</li>\r\n	<li>Understand functional specifications to ensure design and development of technical solutions</li>\r\n	<li>Identify test requirements from specifications, map test case requirements and design testing plans. Execute unit testing of developed programs</li>\r\n	<li>Support System Integration Testing (issue analysis and resolution)</li>\r\n	<li>Support regression testing and User Acceptance Testing (issue analysis and resolution)</li>\r\n	<li>Adhere to the company&rsquo;s project management and governance framework &ndash; specifically, monitor and track project milestones and deliverables; identify and manage issues and action items; create and maintain project status reports for project leads for incorporation into larger project status reports; proactively identify and mitigate potential project risks; and escalate issues where appropriate.</li>\r\n</ul>\r\n\r\n<h3><u><em><strong>JOB REQUIREMENT</strong></em></u></h3>\r\n\r\n<ul>\r\n	<li><strong>5+ years&rsquo; overall experience</strong>. Minimum one end-to-end implementation of Banking Solution in the capacity of a technical consultant</li>\r\n	<li>Demonstrated strong programming skills (PL/SQL, SQL, Java/any other programming Language)</li>\r\n	<li><strong>Core Java</strong>, junit, development using Eclipse/Idea IDE</li>\r\n	<li>Demonstrated RDBMS experience (Oracle, SQL Server)</li>\r\n	<li>Good Understanding of&nbsp;<strong>software development lifecycle (SDLC)</strong>&nbsp;and&nbsp;<strong>On-line Transaction Processing (OLTP) systems</strong>&nbsp;(Core Banking, Treasury Systems etc.)</li>\r\n	<li>Experience in Data Warehousing and Business Intelligence (DW/BI) project implementations and&nbsp;<strong>preferably worked in banking and finance field</strong></li>\r\n	<li><strong>Fluency in English, written and oral</strong></li>\r\n</ul>\r\n\r\n<h3><u><em><strong>MORE INFORMATION</strong></em></u></h3>\r\n\r\n<ul>\r\n	<li>Bằng cấp: Đại học</li>\r\n	<li>Độ tuổi: Kh&ocirc;ng giới hạn tuổi</li>\r\n</ul>','static/uploads/images/2021/12/6252_b87866cc835a354185cf9f283b5f0403.png','2021-12-19 08:36:25.777049','2021-12-24 07:58:47.691240',1,3,4,'Wang Yick Fireworks Company , Central Victoria , Hong Kong',5,1000),(11,'Haskell Developer - Remote (open for Expats)','<h3>JOB DESCRIPTION</h3>\r\n\r\n<ul>\r\n	<li>&middot; Participate in blockchain development projects (NFT marketplace &amp; DeFi applications) on Cardano. Build smartcontract based on Plutus (Alonzo) using Haskell.</li>\r\n	<li>&middot; Participate in the research and development of products and cooperate with background developers to implement software client interfaces and functions.</li>\r\n	<li>&middot; Working type: onsite/remote, parttime/fulltime</li>\r\n</ul>\r\n\r\n<p>Benefits:</p>\r\n\r\n<ul>\r\n	<li>&middot; Salary: upto 5000$/month plus performance bonus</li>\r\n	<li>&middot; Mentorship and coaching by senior leaders in the company, who are successful serial entrepreneurs and alumni of Ivy League schools (Yale, LSE, Harvard, University of Chicago)</li>\r\n	<li>&middot; Dynamic working environment, with high exposure to global projects, leading KOLs/ influencers and an international audience</li>\r\n	<li>&middot; Startup perks (e.g. remote working, relaxed dress code, annual health check, wellness stipend, happy hours, and high-performing startup culture)</li>\r\n	<li>&middot; Extra paid vacation days</li>\r\n	<li>&middot; Work with world-class experts around the world in the areas of blockchain, NFT, virtual reality, media and entertainment, arts, investment and more</li>\r\n	<li>&middot; Be a part of the blockchain and cryptocurrency revolution that is changing the world, with plenty of opportunities for personal growth and development</li>\r\n</ul>\r\n\r\n<h3>JOB REQUIREMENT</h3>\r\n\r\n<p>&bull;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Basic knowledge: data structure &amp; algorithm, database, OOP (design patterns).</p>\r\n\r\n<p>&bull;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Having strong knowledge in Blockchain and/or dApp (Ethereum Virtual Machine, Web3). Having experience in developing blockchain dapp, smartcontract.</p>\r\n\r\n<p>&bull;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Skillful in Haskell programming</p>\r\n\r\n<p>&bull;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Skillful in at least one popular programming language in the following tech stack.</p>\r\n\r\n<p>Overview tech stack at present:</p>\r\n\r\n<p>&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Backend: NodeJS, Go, Rust, Postgres, MongoDB</p>\r\n\r\n<p>&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Frontend: React, Javascript, HTML, CSS, Next.js</p>\r\n\r\n<p>&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Smartcontract: Solidity, Rust, Haskell</p>\r\n\r\n<h3>MORE INFORMATION</h3>\r\n\r\n<ul>\r\n	<li>Age: Unlimited</li>\r\n</ul>','static/uploads/images/2021/12/4175d17c66f179fea9b969bbf946820f.jpg','2021-12-19 08:37:31.526731','2021-12-19 08:37:31.526731',1,3,2,'Ho Chi Minh City, Vietnam',3,0),(12,'iOS Mobile Application Developer','<h3>JOB DESCRIPTION</h3>\r\n\r\n<p><strong>A little about us:</strong></p>\r\n\r\n<p>Next Sourcing is the wholly owned sourcing company of Next PLC.</p>\r\n\r\n<p>We design and source product via our global network of offices and suppliers; negotiating market leading prices; securing the fastest lead times and managing production to ensure fantastic product is safely delivered on time.</p>\r\n\r\n<p>At Next Sourcing we are embarking on a period of business transformation within our IT development and operations divisions. We aspire to continually develop innovative and functional IT systems and programmes to support our business and streamline work flow. The iOS Mobile Application Developer will work closely with our Technology Lead and a UX UI Designer to design and develop tailored mobile applications that support our business growth.</p>\r\n\r\n<p><strong>Job Responsibility</strong>&nbsp;(including but not limited to)<strong>:</strong></p>\r\n\r\n<ul>\r\n	<li>In-house mobile development environment</li>\r\n	<li>Responsible for the development, implementation and testing of iOS Applications</li>\r\n	<li>Designing and building new features with robust architecture for a mobile solution</li>\r\n	<li>Collaborate with team leads and project managers in order to integrate the solutions with various platforms</li>\r\n	<li>Sound up-to-date knowledge and understanding of the latest mobile developments and technology</li>\r\n	<li>Responsible for monitoring and fine-tuning App performance as appropriate.</li>\r\n</ul>\r\n\r\n<h3>JOB REQUIREMENT</h3>\r\n\r\n<p><strong>Essential Skills &amp; Requirements:</strong></p>\r\n\r\n<ul>\r\n	<li>Degree / Higher Diploma of computer science or related discipline;</li>\r\n	<li>Minimum 2 years of experience in iOS mobile application development</li>\r\n	<li>Solid experience in Swift and Objective C</li>\r\n	<li>Knowledge of SwiftUI is an advantage</li>\r\n	<li>Knowledge of Flutter is an advantage</li>\r\n</ul>\r\n\r\n<p>Fast learner, independent, responsible, self-motivated and able to accomplish deadlines</p>\r\n\r\n<h3>MORE INFORMATION</h3>\r\n\r\n<ul>\r\n	<li>Degree: Bachelor</li>\r\n	<li>Age: Unlimited</li>\r\n</ul>','static/uploads/images/2021/12/5072150_400.png','2021-12-19 08:39:05.125525','2021-12-21 10:04:13.450248',0,4,8,'Ho Chi Minh City, Vietnam',4,1200),(13,'02 Regional Project Directors (Based in Philippines)','<h3>JOB DESCRIPTION</h3>\r\n\r\n<p>I/ WORKING LOCATION:</p>\r\n\r\n<p>- 1 candidate in Visayas (Cebu)</p>\r\n\r\n<p>- 1 candidate in South Luzon (South Luzon)</p>\r\n\r\n<p>II/ ROLES AND RESPONSIBILITIES:</p>\r\n\r\n<p>- Responsible for successful performance and delivery of the project;</p>\r\n\r\n<p>- Establish and manage project objectives and baselines, planning and acquire</p>\r\n\r\n<p>project resources;</p>\r\n\r\n<p>- Manage and control project schedule, cost, quality, scope, risk,etc.,to meet</p>\r\n\r\n<p>requirements of the contract and customer;</p>\r\n\r\n<p>- Communication management, escalation of major/critical issues during project</p>\r\n\r\n<p>implementation;</p>\r\n\r\n<p>- Organizing to complete PAT/FAT as project schedule; establish and improve</p>\r\n\r\n<p>relationship with customer;</p>\r\n\r\n<p>- Team building and performance management of project teams and team</p>\r\n\r\n<p>members;</p>\r\n\r\n<p>- Responsible in overseeing workers in various departments who are assigned</p>\r\n\r\n<p>certain tasks to complete for a given project and involves creating schedules</p>\r\n\r\n<p>and following up with employees to ensure that each phase of project proceeds</p>\r\n\r\n<p>as planned;</p>\r\n\r\n<p>- Supervises other department heads in carrying out certain projects and keeps</p>\r\n\r\n<p>upper management personnel informed as to how a particular plan is</p>\r\n\r\n<p>progressing.</p>\r\n\r\n<p>- Responsible in coordinating telecommunication systems installation projects.</p>\r\n\r\n<h3>JOB REQUIREMENT</h3>\r\n\r\n<p>- Bachelor&#39;s degree in business, economics or communications.</p>\r\n\r\n<p>- With at least 10 years of experience in a leadership position (managerial level)</p>\r\n\r\n<p>- With extensive experience in managing, designing, implementing, and</p>\r\n\r\n<p>evaluating.</p>\r\n\r\n<p>- With technical/clinical expertise and/or program management skills and with</p>\r\n\r\n<p>ability to handle multiple assignments</p>\r\n\r\n<p>- Superior written and oral communication skills, able to matrix manage and have</p>\r\n\r\n<p>strong data/project analytic skills.</p>\r\n\r\n<p>- With strong networks/contacts in the local government units for purposes of site</p>\r\n\r\n<p>acquisition and permits processing</p>\r\n\r\n<p>- Must have end-to-end full turnkey (FTK) experience from site acquisition up to</p>\r\n\r\n<p>project implementation</p>\r\n\r\n<p>- Good at English skill (writing, reading, listening, speaking)</p>\r\n\r\n<p>- Those who are able to communicate normally in Chinese is preferred.</p>\r\n\r\n<p>- Maximum age limit is 47 years old</p>\r\n\r\n<h3>MORE INFORMATION</h3>\r\n\r\n<ul>\r\n	<li>Degree: Bachelor</li>\r\n	<li>Age: 33 - 47</li>\r\n</ul>','static/uploads/images/2021/12/22192360_400.png','2021-12-19 08:51:02.274227','2021-12-19 17:03:21.164870',1,5,2,'Ho Chi Minh City, Vietnam',4,800),(16,'Credit Officer Manager','<h3><strong>Job brief</strong></h3><p>We are looking for a Credit Officer to facilitate lending for our clients by assessing creditworthiness and processing relevant paperwork.</p><p>Credit Officer responsibilities include preparing loan applications, evaluating clients’ financial information and calculating risk ratios. To be successful in this role, you should have a good understanding of lending procedures and customer service experience.</p><p>Ultimately, you will help our clients acquire loans in a timely manner, while ensuring we comply with the law.</p><h2><strong>Responsibilities</strong></h2><ul><li>Review loan requests</li><li>Assess clients’ financial status</li><li>Evaluate creditworthiness and risks</li><li>Contact clients to gather financial data and documentation</li><li>Analyze risks and approve or reject loan requests</li><li>Calculate financial ratios (e.g. credit scores and interest rates)</li><li>Set up payment plans</li><li>Maintain updated records of loan applications</li><li>Follow up with clients about loan renewals</li><li>Monitor progress of existing loans</li></ul><h2><strong>Requirements</strong></h2><ul><li>Proven work experience as a Credit Officer, <a href=\"https://resources.workable.com/loan-officer-job-description\">Loan Officer</a> or similar role</li><li>Hands-on experience with lending procedures and products</li><li>Ability to create and process financial spreadsheets</li><li>Strong analytical skills</li><li>Customer service experience</li><li>BSc in Banking and Finance, Economics or related field</li></ul>','static/uploads/images/2021/12/images_jBHCRUF.png','2021-12-22 16:54:02.698754','2021-12-22 16:54:02.724928',1,2,4,'1 Han Thuyen Street , District 1 , Ho Chi Minh City , Vietnam',2,800),(19,'Billing Analyst','<h2><strong>Job brief</strong></h2><p>We are looking for a Billing Analyst to undertake billing operations in our accounting department. We’ll count on you to issue invoices with a high degree of accuracy to guarantee our revenue.</p><p>Our Billing Analyst should have a keen eye for detail. You should also be comfortable working with little supervision to meet tight deadlines.</p><p>Your goal will be to <a href=\"https://resources.workable.com/accounts-receivable-clerk-job-description\">monitor accounts receivable</a> and ensure we bill our customers correctly.</p><h2><strong>Responsibilities</strong></h2><ul><li>Issue and distribute invoices</li><li>Process new contracts and sales</li><li>Collaborate with other departments to ensure billing accuracy</li><li>Address customer complaints and questions</li><li>Keep track of accounts receivable and transactions</li><li>Assist with customer account reconciliations</li><li>Prepare and present analytical reports</li><li>Support monthly and quarterly audits and clean ups</li><li>Resolve any issues or mistakes</li></ul><h2><strong>Requirements</strong></h2><ul><li><a href=\"https://resources.workable.com/billing-analyst-interview-questions\">Proven experience</a> as a Billing Analyst or similar accounting role</li><li>Good knowledge of electronic billing procedures</li><li>Proficient in MS Office (especially Excel); familiarity with databases and SQL is an asset</li><li>Excellent communication ability</li><li>Organizational and time-management skills</li><li>Attention to detail</li><li>Teamwork skills</li><li>Ability to work independently and meet tight deadlines</li><li>BSc/BA in accounting or similar field is preferred</li></ul>','static/uploads/images/2021/12/data-khach-hang-bds-hcm-1_0MhYXuh.jpg','2021-12-22 17:06:24.218777','2021-12-22 17:06:24.218777',1,1,4,'508 Ngo Gia Tu, Phuong 9, Quan 5 , Ho Chi Minh City , Vietnam',4,0),(23,'Software Developer','<h2><strong>Software Developer responsibilities include:</strong></h2><ul><li>Producing clean, efficient code based on specifications</li><li>Testing and deploying programs and systems</li><li>Fixing and improving existing software</li></ul><p><img src=\"https://resources.workable.com/wp-content/uploads/2017/04/software-developer-shutterstock_404986099.jpg\" alt=\"software developer job description\"></p><h2><strong>Job brief</strong></h2><p>We are looking for a Software Developer to build and implement functional programs. You will work with other Developers and <a href=\"https://resources.workable.com/product-manager-job-description\">Product Managers</a> throughout the software development life cycle.</p><p>In this role, you should be a team player with a keen eye for detail and problem-solving skills. If you also have experience in Agile frameworks and popular coding languages (e.g. JavaScript), we’d like to meet you.</p><p>Your goal will be to build efficient programs and systems that serve user needs.</p><h2><strong>Responsibilities</strong></h2><ul><li>Work with developers to design algorithms and flowcharts</li><li>Produce clean, efficient code based on specifications</li><li>Integrate software components and third-party programs</li><li>Verify and deploy programs and systems</li><li>Troubleshoot, debug and upgrade existing software</li><li>Gather and evaluate user feedback</li><li>Recommend and execute improvements</li><li>Create technical documentation for reference and reporting</li></ul><h2><strong>Requirements</strong></h2><ul><li>Proven experience as a Software Developer, <a href=\"https://resources.workable.com/software-engineer-job-description\">Software Engineer</a> or similar role</li><li>Familiarity with Agile development methodologies</li><li>Experience with software design and development in a test-driven environment</li><li>Knowledge of coding languages (e.g. C++, Java, JavaScript) and frameworks/systems (e.g. AngularJS, Git)</li><li>Experience with databases and Object-Relational Mapping (ORM) frameworks (e.g. Hibernate)</li><li>Ability to learn new languages and technologies</li><li>Excellent communication skills</li><li>Resourcefulness and troubleshooting aptitude</li><li>Attention to detail</li><li>BSc/BA in Computer Science, Engineering or a related field</li></ul>','static/uploads/images/2021/12/cuus.jpg','2021-12-22 17:25:00.908972','2021-12-22 17:25:00.908972',1,3,4,'undefined',2,0);
/*!40000 ALTER TABLE `jobreferralapp_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobreferralapp_post_tags`
--

DROP TABLE IF EXISTS `jobreferralapp_post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobreferralapp_post_tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `post_id` bigint NOT NULL,
  `tag_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jobReferralApp_post_tags_post_id_tag_id_8561687d_uniq` (`post_id`,`tag_id`),
  KEY `jobReferralApp_post__tag_id_e0e78fa6_fk_jobReferr` (`tag_id`),
  CONSTRAINT `jobReferralApp_post__post_id_9ec8d8dc_fk_jobReferr` FOREIGN KEY (`post_id`) REFERENCES `jobreferralapp_post` (`id`),
  CONSTRAINT `jobReferralApp_post__tag_id_e0e78fa6_fk_jobReferr` FOREIGN KEY (`tag_id`) REFERENCES `jobreferralapp_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobreferralapp_post_tags`
--

LOCK TABLES `jobreferralapp_post_tags` WRITE;
/*!40000 ALTER TABLE `jobreferralapp_post_tags` DISABLE KEYS */;
INSERT INTO `jobreferralapp_post_tags` VALUES (3,2,3),(5,4,3),(6,5,1),(9,10,2),(10,10,4),(11,11,1),(12,11,2),(13,11,4),(14,12,2),(15,12,5),(16,12,6),(19,16,3),(27,23,2),(26,23,4);
/*!40000 ALTER TABLE `jobreferralapp_post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobreferralapp_tag`
--

DROP TABLE IF EXISTS `jobreferralapp_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobreferralapp_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobreferralapp_tag`
--

LOCK TABLES `jobreferralapp_tag` WRITE;
/*!40000 ALTER TABLE `jobreferralapp_tag` DISABLE KEYS */;
INSERT INTO `jobreferralapp_tag` VALUES (1,'Data Analysis'),(6,'IOS'),(2,'IT'),(3,'Marketing'),(5,'Mobie'),(4,'Sofware');
/*!40000 ALTER TABLE `jobreferralapp_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobreferralapp_user`
--

DROP TABLE IF EXISTS `jobreferralapp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobreferralapp_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `avatar` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobreferralapp_user`
--

LOCK TABLES `jobreferralapp_user` WRITE;
/*!40000 ALTER TABLE `jobreferralapp_user` DISABLE KEYS */;
INSERT INTO `jobreferralapp_user` VALUES (1,'pbkdf2_sha256$260000$3hhTBZkwzKfKo5xkceCRUo$vukFvLCoqj7ngzW42YUWt2G5BepHBPeqfI/EXccv1ks=','2021-12-20 16:04:49.539726',1,'admin','','','admin@gmail.com',1,1,'2021-10-15 03:49:11.000000','static/uploads/avatar/2021/10/001.png'),(2,'!CfdwKjk7a1BChheTz4hgz8dpnE5aYef3JfKMQjFz',NULL,0,'npthuthuy237','Thu Thủy','Nguyễn Phương','npthuthuy237@gmail.com',0,1,'2021-10-15 04:32:44.272403',''),(3,'!GIQ77KmNGTwZZVA9rIPtruTFFhx8ohIAZig43TnI',NULL,0,'ngaymuadai72','Thu Thủy','Nguyễn Phương','ngaymuadai72@gmail.com',0,1,'2021-10-15 06:12:51.178302',''),(4,'!GAehL94hCg8j4etMRBKwGoCz8zIedfwxkJEZhr7A',NULL,0,'1851050140thuy','Thuy','Nguyen Phuong Thu','1851050140thuy@ou.edu.vn',0,1,'2021-10-15 06:14:30.075098',''),(5,'pbkdf2_sha256$260000$IEDefOyDqzEHMo0irUiMtT$SwY/3fHNc4XcWukShI6dLZC21/jMXOhlZqj1K0RC1DM=','2021-12-03 13:18:52.390298',0,'ThuThuy','Thu','thuy','thuy@gmail.com',0,1,'2021-10-20 12:54:50.327138','static/uploads/avatar/2021/12/2-1589610736879798956643.jpg'),(6,'pbkdf2_sha256$260000$HAUqtpeZlm9mQPbK9siUQ2$tER6d/NAEUOIfQ7Hj0Okdat7Ev/854/is1I5CKm8qPk=',NULL,0,'meo','','','hihi@gmail.com',0,1,'2021-10-20 13:00:35.374357',''),(7,'pbkdf2_sha256$260000$PAiag15tLwHFX8QBD228RT$WU9TGe+4ADJmgPYD7msTinextpNLm8FgpVQC7hQXuJ0=',NULL,0,'thuy','','','thuy@gmail.com',0,1,'2021-10-20 13:02:08.563226',''),(8,'pbkdf2_sha256$260000$2fBJzKCTmnHwWGkkuo1JcD$/WRzUpsShd82r/ov+8SJtMFgpEB9HAFIeQXPsm4FOj4=',NULL,0,'helloword','hana','chris','hanna.chris@gmail.com',0,1,'2021-10-21 10:37:01.387961','static/uploads/avatar/2021/12/66119548_2403533389684885_6108844234071080960_n_vhcM1oI.jpg'),(20,'pbkdf2_sha256$260000$cQb4fhMBRtZqVkvQqxuGaD$8DYGXCSigw4m2vEtjMmL1jrjy2Ea1qkizgASbhgQTpY=',NULL,0,'thu','','','thuy@gmail.com',0,1,'2021-10-23 11:14:03.552094',''),(21,'pbkdf2_sha256$260000$IwuHuYKxoMG3cGACa1ctKL$dKpD8jZ0g5MbOFAUtKcBut2DSMti9g8FJPojSL0UVbQ=',NULL,0,'thuthu','','','thuy@gmail.com',0,1,'2021-10-23 11:16:15.696926',''),(22,'pbkdf2_sha256$260000$SsTii4H0gCud4vRwc2lfUQ$u0meKp1pYIEuC1EHsXVfYPNsCVjHqb5EkrAJZobtx2g=',NULL,0,'thuthuthu','','','thuy@gmail.com',0,1,'2021-10-23 11:17:57.904589',''),(23,'pbkdf2_sha256$260000$zRaWV2JvxIKlWD0I3qPAbR$xx+E5S7VfuWBbGAfbmngdHOg1DM73hcrLhKz1Q8Ov7I=',NULL,0,'hi','','','hihi@gmail.com',0,1,'2021-10-23 11:22:37.709089','');
/*!40000 ALTER TABLE `jobreferralapp_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobreferralapp_user_groups`
--

DROP TABLE IF EXISTS `jobreferralapp_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobreferralapp_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jobReferralApp_user_groups_user_id_group_id_d4a795b1_uniq` (`user_id`,`group_id`),
  KEY `jobReferralApp_user_groups_group_id_5e9ce792_fk_auth_group_id` (`group_id`),
  CONSTRAINT `jobReferralApp_user__user_id_ce04ccea_fk_jobReferr` FOREIGN KEY (`user_id`) REFERENCES `jobreferralapp_user` (`id`),
  CONSTRAINT `jobReferralApp_user_groups_group_id_5e9ce792_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobreferralapp_user_groups`
--

LOCK TABLES `jobreferralapp_user_groups` WRITE;
/*!40000 ALTER TABLE `jobreferralapp_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobreferralapp_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobreferralapp_user_user_permissions`
--

DROP TABLE IF EXISTS `jobreferralapp_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobreferralapp_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jobReferralApp_user_user_user_id_permission_id_b786f9be_uniq` (`user_id`,`permission_id`),
  KEY `jobReferralApp_user__permission_id_87b0b5f1_fk_auth_perm` (`permission_id`),
  CONSTRAINT `jobReferralApp_user__permission_id_87b0b5f1_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `jobReferralApp_user__user_id_5379cba9_fk_jobReferr` FOREIGN KEY (`user_id`) REFERENCES `jobreferralapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobreferralapp_user_user_permissions`
--

LOCK TABLES `jobreferralapp_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `jobreferralapp_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobreferralapp_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_accesstoken`
--

DROP TABLE IF EXISTS `oauth2_provider_accesstoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_accesstoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext COLLATE utf8_unicode_ci NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `source_refresh_token_id` bigint DEFAULT NULL,
  `id_token_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  UNIQUE KEY `source_refresh_token_id` (`source_refresh_token_id`),
  UNIQUE KEY `id_token_id` (`id_token_id`),
  KEY `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_acce_user_id_6e4c9a65_fk_jobReferr` (`user_id`),
  CONSTRAINT `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_acce_id_token_id_85db651b_fk_oauth2_pr` FOREIGN KEY (`id_token_id`) REFERENCES `oauth2_provider_idtoken` (`id`),
  CONSTRAINT `oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr` FOREIGN KEY (`source_refresh_token_id`) REFERENCES `oauth2_provider_refreshtoken` (`id`),
  CONSTRAINT `oauth2_provider_acce_user_id_6e4c9a65_fk_jobReferr` FOREIGN KEY (`user_id`) REFERENCES `jobreferralapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_accesstoken` VALUES (1,'3au70pfkrypqyPs2mRsHiHUvnK2768','2021-10-15 13:58:47.207373','read write',1,1,'2021-10-15 03:58:47.208373','2021-10-15 03:58:47.208373',NULL,NULL),(2,'bSceDW2rNjFpTT8pGzM5bdpXPTFUm3','2021-10-15 14:04:12.771542','read write',1,1,'2021-10-15 04:04:12.772543','2021-10-15 04:04:12.772543',NULL,NULL),(3,'Mcc5TQaS5zSjJaJosQ2E7vfRIPzQkG','2021-10-15 14:32:44.318698','read write',1,2,'2021-10-15 04:32:44.319816','2021-10-15 04:32:44.319816',NULL,NULL),(4,'ErXvQnJKbSBBN0icnYFfddwVk3Ik43','2021-10-15 14:33:35.771429','read write',1,2,'2021-10-15 04:33:35.771429','2021-10-15 04:33:35.771429',NULL,NULL),(5,'eD6pKrA29vWVwgrAQ8O8jHl2efKOdk','2021-10-15 14:34:22.676589','read write',1,2,'2021-10-15 04:34:22.676589','2021-10-15 04:34:22.676589',NULL,NULL),(6,'Ht6AEPYxgmmAC53caPiYi4EoCKZBNz','2021-10-15 14:35:20.647322','read write',1,2,'2021-10-15 04:35:20.647322','2021-10-15 04:35:20.647322',NULL,NULL),(7,'5vYbUj1Kv8io4UQtjIYcDfxs6URmRc','2021-10-15 15:38:42.451071','read write',1,2,'2021-10-15 05:38:42.452073','2021-10-15 05:38:42.452073',NULL,NULL),(8,'t6If9WLnOvaEguTiX6seIyihibSINw','2021-10-15 15:43:53.858699','read write',1,2,'2021-10-15 05:43:53.859688','2021-10-15 05:43:53.859688',NULL,NULL),(9,'L5yBHDjTZ4E7Kh5WZErPrzaZbDZkAq','2021-10-15 15:46:58.615738','read write',1,2,'2021-10-15 05:46:58.616738','2021-10-15 05:46:58.616738',NULL,NULL),(10,'LfOinJkMW8VhgEsn5QOhkrVSfRu9kA','2021-10-15 15:53:15.620413','read write',1,2,'2021-10-15 05:53:15.620413','2021-10-15 05:53:15.621415',NULL,NULL),(11,'ohU6K6L2AObqVEicK5z7CCQHeVU4Nn','2021-10-15 15:54:40.414550','read write',1,2,'2021-10-15 05:54:40.415577','2021-10-15 05:54:40.416348',NULL,NULL),(12,'81EOhUd7oMKyPvLA0m3hO7PC8FE9e9','2021-10-15 15:56:51.315595','read write',1,2,'2021-10-15 05:56:51.316577','2021-10-15 05:56:51.316577',NULL,NULL),(13,'qxLEltC5kjBHN2EXa6uL8cJMFf7mnp','2021-10-15 15:57:53.013233','read write',1,2,'2021-10-15 05:57:53.014231','2021-10-15 05:57:53.014231',NULL,NULL),(14,'bwczR3hYCKrbyeypHbxY6vogLxEF4e','2021-10-15 15:58:26.042202','read write',1,2,'2021-10-15 05:58:26.043199','2021-10-15 05:58:26.043199',NULL,NULL),(15,'lJH4w38uvN8GPjOqEeYlUtbAgQnkRe','2021-10-15 15:58:55.686092','read write',1,2,'2021-10-15 05:58:55.687091','2021-10-15 05:58:55.687091',NULL,NULL),(16,'AcG615SMdixcKY9QJ94eeBz5X07HHU','2021-10-15 15:59:06.751176','read write',1,2,'2021-10-15 05:59:06.752881','2021-10-15 05:59:06.752881',NULL,NULL),(17,'tSvvJwPyW92DAYqrlaLYGQP5Dodxnk','2021-10-15 15:59:16.400186','read write',1,2,'2021-10-15 05:59:16.401198','2021-10-15 05:59:16.401198',NULL,NULL),(18,'crfRazVwSxF4YrkDBo4QmMLozETTvY','2021-10-15 15:59:38.567523','read write',1,2,'2021-10-15 05:59:38.569245','2021-10-15 05:59:38.569245',NULL,NULL),(19,'svOD5OcauJb6fYAWqgwhn8rJeyLVh0','2021-10-15 16:00:11.934453','read write',1,1,'2021-10-15 06:00:11.935976','2021-10-15 06:00:11.935976',NULL,NULL),(20,'TbeKtHsK7Y4N4wadKTjwKrWsf3RAaz','2021-10-15 16:01:36.101972','read write',1,1,'2021-10-15 06:01:36.102970','2021-10-15 06:01:36.102970',NULL,NULL),(21,'I8s0W0pHLVhTmh22IGjgVmHCGOR5dJ','2021-10-15 16:01:51.657553','read write',1,2,'2021-10-15 06:01:51.658548','2021-10-15 06:01:51.658548',NULL,NULL),(22,'8HaXe8EGn4w0MSNiSif49vOUrDF9z0','2021-10-15 16:03:56.985857','read write',1,2,'2021-10-15 06:03:56.985857','2021-10-15 06:03:56.985857',NULL,NULL),(23,'YDj4aE8m3eB9lScyjFXHTZaf60QgZ2','2021-10-15 16:04:30.103045','read write',1,2,'2021-10-15 06:04:30.104054','2021-10-15 06:04:30.104054',NULL,NULL),(24,'pBp5dgKpXjgVSc9D6nSzyzhtwRikQo','2021-10-15 16:10:45.109291','read write',1,2,'2021-10-15 06:10:45.110290','2021-10-15 06:10:45.110290',NULL,NULL),(25,'z41mtxM6GshNNIsCIMV68YlUyyN4n6','2021-10-15 16:12:51.230616','read write',1,3,'2021-10-15 06:12:51.231612','2021-10-15 06:12:51.231612',NULL,NULL),(26,'42JLAZPtm3HtbFZOcCLnAibzBWjbsX','2021-10-15 16:14:30.109137','read write',1,4,'2021-10-15 06:14:30.110174','2021-10-15 06:14:30.110174',NULL,NULL),(27,'wkQAtFYFZJeBN7Ldd7jfyGz2LH5z5u','2021-10-15 16:15:00.877302','read write',1,4,'2021-10-15 06:15:00.878302','2021-10-15 06:15:00.878302',NULL,NULL),(28,'7wJ0s5abepepw9xeakvWZFhIQ2i8PM','2021-10-15 16:16:44.176630','read write',1,4,'2021-10-15 06:16:44.177628','2021-10-15 06:16:44.177628',NULL,NULL),(29,'AAhmkoCisd2EJQidCOCIA9tXYBO4p8','2021-10-15 16:18:05.718963','read write',1,2,'2021-10-15 06:18:05.719951','2021-10-15 06:18:05.719951',NULL,NULL),(30,'QCTAiDWVt1Oi8DfeSwh2bqTIR4XOdX','2021-10-15 16:18:42.829867','read write',1,2,'2021-10-15 06:18:42.830865','2021-10-15 06:18:42.830865',NULL,NULL),(31,'AKU1nZOrfMWtzCoBjMIz4884AietjZ','2021-10-15 16:19:17.820628','read write',1,4,'2021-10-15 06:19:17.821619','2021-10-15 06:19:17.821619',NULL,NULL),(32,'9t4J0p9IsPwieMuV94p71pbvsGnmtB','2021-10-15 16:20:33.029152','read write',1,2,'2021-10-15 06:20:33.030151','2021-10-15 06:20:33.030151',NULL,NULL),(33,'mF9Zz51bBR1rUM7worz7m3hOAHyB2h','2021-10-15 16:21:00.442898','read write',1,3,'2021-10-15 06:21:00.443897','2021-10-15 06:21:00.443897',NULL,NULL),(34,'901F6PKJM7RmV9UXIQEBSYepJxyksE','2021-10-15 16:22:04.688420','read write',1,3,'2021-10-15 06:22:04.688420','2021-10-15 06:22:04.688420',NULL,NULL),(35,'4Bf2ZY7WZEvJIpRXmSK7weiIXx7ARV','2021-10-15 16:22:32.377681','read write',1,2,'2021-10-15 06:22:32.378867','2021-10-15 06:22:32.378867',NULL,NULL),(36,'mKQguHJ71kved1REX1szNdmfPhIeHZ','2021-10-15 16:23:26.265439','read write',1,2,'2021-10-15 06:23:26.266431','2021-10-15 06:23:26.266431',NULL,NULL),(37,'Ql81e6I5Uf9CTEjpbDtBx4VhWh1kyQ','2021-10-15 16:26:56.232868','read write',1,2,'2021-10-15 06:26:56.233826','2021-10-15 06:26:56.234868',NULL,NULL),(38,'VIAr8D3eVaVGP47cWmIpeG4eQy35Rz','2021-10-15 16:27:32.403291','read write',1,3,'2021-10-15 06:27:32.404283','2021-10-15 06:27:32.404283',NULL,NULL),(39,'85ITOS8qXjix3Be53cw9t0FyvycbuM','2021-10-17 13:05:45.007330','read write',1,2,'2021-10-17 03:05:45.008330','2021-10-17 03:05:45.008330',NULL,NULL),(40,'2Rus8c7zqXGvMJC6ALfKEbz2TFhLKT','2021-10-17 13:11:21.915190','read write',1,1,'2021-10-17 03:11:21.916186','2021-10-17 03:11:21.916186',NULL,NULL),(41,'UuyiQsAINVAecuKQij2Tjv3SqPiEbd','2021-10-17 13:31:50.447442','read write',1,2,'2021-10-17 03:31:50.447442','2021-10-17 03:31:50.447442',NULL,NULL),(42,'WWyJzrpDey51WNMoJmRUdTYGZrcfEJ','2021-10-17 13:39:56.738266','read write',1,2,'2021-10-17 03:39:56.738266','2021-10-17 03:39:56.738266',NULL,NULL),(43,'YyDEXprxYt5eHa8hPiplqzNsahIJsA','2021-10-17 13:50:35.366006','read write',1,1,'2021-10-17 03:50:35.366006','2021-10-17 03:50:35.366006',NULL,NULL),(44,'EPy9UucNRahz0sKUsb6D9vyznTcg6r','2021-10-17 15:11:08.325634','read write',1,1,'2021-10-17 05:11:08.344758','2021-10-17 05:11:08.345754',NULL,NULL),(45,'LKTuTJOWFL3iuklI6ddRMAgXYsCwnz','2021-10-17 22:49:54.417710','read write',1,2,'2021-10-17 12:49:54.418747','2021-10-17 12:49:54.418747',NULL,NULL),(46,'kOJiDta2XCOtv3GCw2RpjrMGLLLEFo','2021-10-17 23:04:27.111289','read write',1,1,'2021-10-17 13:04:27.112264','2021-10-17 13:04:27.112264',NULL,NULL),(47,'iJqtqrbwdI3z7jFwUslpUd6rAyfxGL','2021-10-20 23:01:49.204497','read write',1,5,'2021-10-20 13:01:49.204497','2021-10-20 13:01:49.204497',NULL,NULL),(48,'Tno6PYWAHhEgolQm54XJUYNw2Rwe5M','2021-10-20 23:03:38.538590','read write',1,5,'2021-10-20 13:03:38.546009','2021-10-20 13:03:38.546009',NULL,NULL),(49,'ZD0STe9xKlHgtVkveuslJfH4gnnQVg','2021-10-20 23:03:55.434162','read write',1,1,'2021-10-20 13:03:55.434162','2021-10-20 13:03:55.434162',NULL,NULL),(50,'SVCCz09heJoy0VG3AZSwrrCXCkQpFe','2021-10-21 12:38:29.612767','read write',1,5,'2021-10-21 02:38:29.613766','2021-10-21 02:38:29.613766',NULL,NULL),(51,'7WxwmCOifsMXlSUMIrMEdMdBiaBEoR','2021-10-21 20:38:44.064818','read write',1,8,'2021-10-21 10:38:44.064818','2021-10-21 10:38:44.064818',NULL,NULL),(52,'YQw5cZCvyf7AJuKE1Bb2hOdyqyLpNW','2021-10-21 21:11:53.383187','read write',1,8,'2021-10-21 11:11:53.384187','2021-10-21 11:11:53.384187',NULL,NULL),(53,'CVufV6hyisuESQUcBNRtzPrPN8h29K','2021-10-23 02:49:24.149870','read write',1,5,'2021-10-22 16:49:24.150438','2021-10-22 16:49:24.150438',NULL,NULL),(54,'SBkXznvf7VVkuyKAm4HvB2LnsuGqfG','2021-10-23 02:49:35.662664','read write',1,1,'2021-10-22 16:49:35.662664','2021-10-22 16:49:35.662664',NULL,NULL),(55,'BVuUwgZVwPXhsgbBBnJdEfrkQKsDjG','2021-10-23 02:49:54.046571','read write',1,1,'2021-10-22 16:49:54.046571','2021-10-22 16:49:54.046571',NULL,NULL),(56,'GIy9dLnC8NdFgxNLx6iJmtwb4k6fv8','2021-10-23 02:53:26.706171','read write',1,5,'2021-10-22 16:53:26.714170','2021-10-22 16:53:26.714170',NULL,NULL),(57,'0s1AxaAG0NP2HgCcVMaqZvTed9vXTW','2021-10-23 20:20:50.130464','read write',1,5,'2021-10-23 10:20:50.130464','2021-10-23 10:20:50.130464',NULL,NULL),(58,'gWi4Q6S9mhWxRiJ7zFZBnWRFJG1EzX','2021-10-23 20:21:02.722679','read write',1,5,'2021-10-23 10:21:02.723679','2021-10-23 10:21:02.723679',NULL,NULL),(59,'mJe6da4d7XF2fhg4qjbr557b13Umzr','2021-10-23 20:52:17.142956','read write',1,5,'2021-10-23 10:52:17.144977','2021-10-23 10:52:17.144977',NULL,NULL),(60,'0uMiRuaQARHQ7B4h68Oetg9oV12zNz','2021-10-23 20:52:48.568831','read write',1,6,'2021-10-23 10:52:48.568831','2021-10-23 10:52:48.568831',NULL,NULL),(61,'Q9tLSGCC8Vm6StfV1k0B5l95ytmyYC','2021-10-23 20:53:00.798273','read write',1,6,'2021-10-23 10:53:00.799278','2021-10-23 10:53:00.799278',NULL,NULL),(62,'H3en8MA7tVAScmTODmPTwI9rgJ97kH','2021-10-23 20:53:28.187737','read write',1,6,'2021-10-23 10:53:28.188693','2021-10-23 10:53:28.188693',NULL,NULL),(63,'a5tFQ3UoE1DSZMW4zdIkrHYVV7buEY','2021-10-23 20:55:00.126768','read write',1,6,'2021-10-23 10:55:00.127722','2021-10-23 10:55:00.127722',NULL,NULL),(64,'1fCQTgKHXN0hxhSzfc7uPu4P3jFGpB','2021-10-23 21:22:37.899787','read write',1,23,'2021-10-23 11:22:37.900795','2021-10-23 11:22:37.900795',NULL,NULL),(65,'BE9PbsZegF3T0KT7zWNgv9nJIfkDBN','2021-10-23 21:23:30.438694','read write',1,23,'2021-10-23 11:23:30.439687','2021-10-23 11:23:30.439687',NULL,NULL),(66,'cvi7ZmU9IOT6jRfI5AfW1E04oWmFwK','2021-10-24 19:19:37.903496','read write',1,5,'2021-10-24 09:19:37.909510','2021-10-24 09:19:37.909510',NULL,NULL),(67,'psNZ5kwOaJhSrbbhM6PJLKOdInUyZJ','2021-10-24 19:23:28.697646','read write',1,4,'2021-10-24 09:23:28.697646','2021-10-24 09:23:28.697646',NULL,NULL),(68,'3HPrGkvq5ZhAXvCDUIutKYjUvYO77s','2021-10-24 19:24:09.668465','read write',1,4,'2021-10-24 09:24:09.668465','2021-10-24 09:24:09.668465',NULL,NULL),(69,'1PtIG56tyTcXquX0SsfizInUjwiao3','2021-10-24 19:25:08.078284','read write',1,3,'2021-10-24 09:25:08.078284','2021-10-24 09:25:08.078284',NULL,NULL),(70,'DLNSgixRjZXrLBNnE9iyorpMrB8PxO','2021-10-24 19:44:54.591728','read write',1,3,'2021-10-24 09:44:54.591728','2021-10-24 09:44:54.591728',NULL,NULL),(71,'ZYcZLdtU8iFPw1vwwOxd69DsSJ1oAq','2021-10-24 20:26:10.592441','read write',1,7,'2021-10-24 10:26:10.592441','2021-10-24 10:26:10.592441',NULL,NULL),(72,'TydXQXyXxswFJg5dfKK80WVQxkh6Je','2021-10-25 00:24:42.285443','read write',1,5,'2021-10-24 14:24:42.286443','2021-10-24 14:24:42.286443',NULL,NULL),(73,'nv1hjZZVUI3Vp8ULePUCqNhBuAhYUb','2021-10-25 00:49:47.772077','read write',1,4,'2021-10-24 14:49:47.772077','2021-10-24 14:49:47.772077',NULL,NULL),(74,'AWcEzZSOQrX3Pxuoj6msNH1HYKtTqH','2021-10-25 19:59:33.918230','read write',1,5,'2021-10-25 09:59:33.918230','2021-10-25 09:59:33.918230',NULL,NULL),(75,'aHxSHl9vTD6s0SV60epGPlT4HKEk0L','2021-10-25 20:26:22.536841','read write',1,5,'2021-10-25 10:26:22.536841','2021-10-25 10:26:22.536841',NULL,NULL),(76,'Zl0MILuszfLSa7dMFoSXy5IuIXhlZL','2021-10-25 21:03:22.140721','read write',1,5,'2021-10-25 11:03:22.144724','2021-10-25 11:03:22.144724',NULL,NULL),(77,'RSF28S3FgCqRPdQNMavfdxMiIhia8V','2021-11-21 15:51:58.305218','read write',1,5,'2021-11-21 05:51:58.305218','2021-11-21 05:51:58.305218',NULL,NULL),(78,'ftJOsQHLMZOY5zAM1QbFXBgIe6yVJY','2021-12-02 17:59:13.217290','read write',1,5,'2021-12-02 07:59:13.217290','2021-12-02 07:59:13.217290',NULL,NULL),(79,'v58ut5VfFEbxzOzhNK0xbWjTuyjibV','2021-12-02 19:17:41.669786','read write',1,1,'2021-12-02 09:17:41.669786','2021-12-02 09:17:41.669786',NULL,NULL),(80,'MJwh494FmpYKtIcMaQeE9bS82zRtAM','2021-12-02 19:20:20.935611','read write',1,1,'2021-12-02 09:20:20.936613','2021-12-02 09:20:20.936613',NULL,NULL),(81,'AAUcV7NiYh8Dj2braezMDrXOy8uTPK','2021-12-03 18:42:04.970530','read write',1,5,'2021-12-03 08:42:04.970530','2021-12-03 08:42:04.970530',NULL,NULL),(82,'ZFwYqN85WGl6vC8BtyAt13lXfLXxos','2021-12-04 16:47:42.701018','read write',1,5,'2021-12-04 06:47:42.701018','2021-12-04 06:47:42.701018',NULL,NULL),(83,'A9Lxp3T9YPp8g1Ek3rOMqLMiKC4YgC','2021-12-04 23:35:42.817346','read write',1,1,'2021-12-04 13:35:42.817346','2021-12-04 13:35:42.817346',NULL,NULL),(84,'vLvX2SlHwfJICe0rPcV2Dv7dJvloPl','2021-12-04 23:35:42.813162','read write',1,1,'2021-12-04 13:35:42.813162','2021-12-04 13:35:42.813162',NULL,NULL),(85,'XSMY1ux6D4W6fJTOsuj1Djn1KePxrc','2021-12-04 23:36:09.035616','read write',1,5,'2021-12-04 13:36:09.035616','2021-12-04 13:36:09.035616',NULL,NULL),(86,'MKEYI2QeVhr3L9FqhFkwjLHzZovgoW','2021-12-05 18:47:42.371268','read write',1,5,'2021-12-05 08:47:42.371268','2021-12-05 08:47:42.371268',NULL,NULL),(87,'nGcodxmLZveI3CpQa5C9NG11w92E5x','2021-12-05 18:48:02.330742','read write',1,5,'2021-12-05 08:48:02.331739','2021-12-05 08:48:02.331739',NULL,NULL),(88,'dOa2bF8CJzsbs3xrFU5sPm8xLLemlF','2021-12-05 20:08:33.301258','read write',1,1,'2021-12-05 10:08:33.302261','2021-12-05 10:08:33.302261',NULL,NULL),(89,'QnO6n02c9vcX4A2P9R4KYuGP7Icnry','2021-12-05 22:47:25.101304','read write',1,5,'2021-12-05 12:47:25.102303','2021-12-05 12:47:25.102303',NULL,NULL),(90,'DBWOuNEvs8LszZw2GbsNegsOZIzCYs','2021-12-19 21:14:16.674842','read write',1,5,'2021-12-19 11:14:16.678428','2021-12-19 11:14:16.678428',NULL,NULL),(91,'CUgkZIc2GWEWovyQ4zQ4HIgATWxodM','2021-12-20 13:48:17.601151','read write',1,6,'2021-12-20 03:48:17.602139','2021-12-20 03:48:17.602139',NULL,NULL),(92,'IdSqycDbBhH7bVnst0ehGi2JKwvETo','2021-12-20 13:58:27.989782','read write',1,1,'2021-12-20 03:58:27.990823','2021-12-20 03:58:27.990823',NULL,NULL),(93,'a1ZcEGEch6aoeqrbkGmZB390chhQud','2021-12-20 13:58:57.538793','read write',1,8,'2021-12-20 03:58:57.538793','2021-12-20 03:58:57.538793',NULL,NULL),(94,'JqqCCitxwTcuRnSpMvBzDK786dACAw','2021-12-20 16:29:27.073533','read write',1,5,'2021-12-20 06:29:27.074582','2021-12-20 06:29:27.074582',NULL,NULL),(95,'Xj4GGWzPCwV2mUnDOHv09ltGw53sGs','2021-12-20 17:45:28.439236','read write',1,5,'2021-12-20 07:45:28.440231','2021-12-20 07:45:28.440231',NULL,NULL),(96,'kuOwHvaIco4ngiRuJn4PJUh2feM2Pj','2021-12-20 18:21:36.969982','read write',1,5,'2021-12-20 08:21:36.969982','2021-12-20 08:21:36.969982',NULL,NULL),(97,'trMN8jRjGRIzCcCeThJ3cblDFaJwuj','2021-12-20 18:24:32.042598','read write',1,3,'2021-12-20 08:24:32.042598','2021-12-20 08:24:32.042598',NULL,NULL),(98,'6sV53XpnBDleOjf49hOXwmjv32018g','2021-12-20 18:24:50.635641','read write',1,5,'2021-12-20 08:24:50.635641','2021-12-20 08:24:50.635641',NULL,NULL),(99,'C5d4DfKYUYIdITxl1MiBEs0l1GfwYk','2021-12-20 18:25:08.125624','read write',1,5,'2021-12-20 08:25:08.125624','2021-12-20 08:25:08.125624',NULL,NULL),(100,'Ix53vp2lykYu1UOig08SUTNEyns6M1','2021-12-21 10:04:56.409796','read write',1,8,'2021-12-21 00:04:56.409796','2021-12-21 00:04:56.409796',NULL,NULL),(101,'0C20ijGsXjE4ewLsKrQE9QvefJkENG','2021-12-21 15:53:32.595362','read write',1,5,'2021-12-21 05:53:32.595362','2021-12-21 05:53:32.595362',NULL,NULL),(102,'fv53gMK4F6jfCBMP6FHG4DFYe6Gw3i','2021-12-21 15:57:41.603206','read write',1,8,'2021-12-21 05:57:41.603206','2021-12-21 05:57:41.604195',NULL,NULL),(103,'fwnSHZRmgaaN30frzTpX36QqHek7e9','2021-12-21 17:30:42.033104','read write',1,8,'2021-12-21 07:30:42.034104','2021-12-21 07:30:42.034104',NULL,NULL),(104,'Wd27MDxrXPe4OkFWPN3c8CFZZrJjcF','2021-12-21 22:27:32.305946','read write',1,4,'2021-12-21 12:27:32.305946','2021-12-21 12:27:32.305946',NULL,NULL),(105,'6GK2EEUtCjcvpyclFjkgsRCZiXRutN','2021-12-22 12:47:10.326205','read write',1,4,'2021-12-22 02:47:10.326205','2021-12-22 02:47:10.326205',NULL,NULL),(106,'SNEoobnXmtsVSzwpNk0g7wEWYvzz67','2021-12-22 18:09:02.049293','read write',1,4,'2021-12-22 08:09:02.049293','2021-12-22 08:09:02.049293',NULL,NULL),(107,'FNvZJBVe8D6P51mEcBCuW6XzYDrst6','2021-12-23 16:50:42.738252','read write',1,4,'2021-12-23 06:50:42.740372','2021-12-23 06:50:42.740372',NULL,NULL),(108,'jxHqCnpQZNIcItt9PLxH0QtV3fovgj','2021-12-24 14:13:15.250174','read write',1,4,'2021-12-24 04:13:15.250496','2021-12-24 04:13:15.250496',NULL,NULL),(109,'VvpOBpWpW6RIA05EaWR1JvNaOzE2ib','2021-12-24 14:41:26.385446','read write',1,8,'2021-12-24 04:41:26.386509','2021-12-24 04:41:26.386509',NULL,NULL),(110,'LWWGvNu8yABeeLItpZ2oZZuTouu8g8','2021-12-24 17:20:38.924459','read write',1,4,'2021-12-24 07:20:38.925456','2021-12-24 07:20:38.925456',NULL,NULL),(111,'ByabSyKRzaWNLL5BdwdHhccTJIA68n','2021-12-24 17:59:26.550748','read write',1,7,'2021-12-24 07:59:26.552122','2021-12-24 07:59:26.552122',NULL,NULL),(112,'5nVXjywjxZgw9vzUy6WJRXvvzfvI82','2021-12-24 18:25:01.453265','read write',1,5,'2021-12-24 08:25:01.454266','2021-12-24 08:25:01.454266',NULL,NULL),(113,'9SRVwFBOSHwbAvhDDWXrfQj28UropD','2021-12-24 18:25:26.534047','read write',1,4,'2021-12-24 08:25:26.535010','2021-12-24 08:25:26.535010',NULL,NULL),(114,'UpHLfR3IM2Ytpcop9T9owIhFvCnjgy','2021-12-24 18:25:38.833918','read write',1,7,'2021-12-24 08:25:38.833918','2021-12-24 08:25:38.833918',NULL,NULL),(115,'YMG3HksCxBkaPbhJPHUCW5nGhdWnA1','2021-12-24 18:26:09.295778','read write',1,8,'2021-12-24 08:26:09.295778','2021-12-24 08:26:09.295778',NULL,NULL),(116,'bvdYzx0bKpEfSGrt11yfYYuEChaeKc','2021-12-24 18:54:03.990384','read write',1,7,'2021-12-24 08:54:03.991379','2021-12-24 08:54:03.991379',NULL,NULL),(117,'NJTfGt4LbjtxTCpNBeGXk6I48DnOBg','2021-12-24 19:22:36.965985','read write',1,8,'2021-12-24 09:22:36.970062','2021-12-24 09:22:36.970062',NULL,NULL),(118,'aMHyFCHrJXlexqJn3XK7xVbnrFRggY','2021-12-24 20:06:27.696118','read write',1,7,'2021-12-24 10:06:27.697115','2021-12-24 10:06:27.697115',NULL,NULL),(119,'khFIxAHDjAqnwyeKip1cCqwYomjrzN','2021-12-24 20:06:48.401849','read write',1,4,'2021-12-24 10:06:48.402846','2021-12-24 10:06:48.402846',NULL,NULL),(120,'GXmTAyxbjoPeXP57et3VoafHIvAuEN','2021-12-24 23:39:35.794346','read write',1,7,'2021-12-24 13:39:35.794346','2021-12-24 13:39:35.794346',NULL,NULL),(121,'HziBzijW6Qd7cJh5CpXEqzqDiR37qO','2021-12-25 00:20:42.333372','read write',1,4,'2021-12-24 14:20:42.334370','2021-12-24 14:20:42.334370',NULL,NULL),(122,'Qwq4cKT9UXxtJEyxeGYcgoO9gRtlou','2021-12-25 00:21:07.922322','read write',1,7,'2021-12-24 14:21:07.923774','2021-12-24 14:21:07.923774',NULL,NULL);
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_application`
--

DROP TABLE IF EXISTS `oauth2_provider_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_application` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `redirect_uris` longtext COLLATE utf8_unicode_ci NOT NULL,
  `client_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `authorization_grant_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `client_secret` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `algorithm` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `oauth2_provider_appl_user_id_79829054_fk_jobReferr` (`user_id`),
  KEY `oauth2_provider_application_client_secret_53133678` (`client_secret`),
  CONSTRAINT `oauth2_provider_appl_user_id_79829054_fk_jobReferr` FOREIGN KEY (`user_id`) REFERENCES `jobreferralapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_application`
--

LOCK TABLES `oauth2_provider_application` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_application` DISABLE KEYS */;
INSERT INTO `oauth2_provider_application` VALUES (1,'rkIEIks89aJKch3vGO4JSwDWDwxgWK6l6MsQodwi','','confidential','password','tZnJ8hN76t6CQFI3lB1oRCw3Zgoyf3gFMWw4qqHscI8LWhlZGZHdFn8U2qXDa9l9qlOgjLXDoUrIa8moDzyiBXlEeGMnjKyIrhH9yIpmj7DHvmK8id2KsjZKFDi7hjK8','Job App',1,0,'2021-10-15 03:49:45.849525','2021-10-15 03:49:45.849525','');
/*!40000 ALTER TABLE `oauth2_provider_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_grant`
--

DROP TABLE IF EXISTS `oauth2_provider_grant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_grant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `redirect_uri` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scope` longtext COLLATE utf8_unicode_ci NOT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `code_challenge` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `code_challenge_method` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `nonce` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `claims` longtext COLLATE utf8_unicode_ci NOT NULL DEFAULT (_utf8mb3''),
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_grant_user_id_e8f62af8_fk_jobReferralApp_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_grant_user_id_e8f62af8_fk_jobReferralApp_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobreferralapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_grant`
--

LOCK TABLES `oauth2_provider_grant` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_grant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_idtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_idtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_idtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `jti` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jti` (`jti`),
  KEY `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_idto_user_id_dd512b59_fk_jobReferr` (`user_id`),
  CONSTRAINT `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_idto_user_id_dd512b59_fk_jobReferr` FOREIGN KEY (`user_id`) REFERENCES `jobreferralapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_idtoken`
--

LOCK TABLES `oauth2_provider_idtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_refreshtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_refreshtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_refreshtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` bigint DEFAULT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `revoked` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token_id` (`access_token_id`),
  UNIQUE KEY `oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq` (`token`,`revoked`),
  KEY `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_refr_user_id_da837fce_fk_jobReferr` (`user_id`),
  CONSTRAINT `oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`),
  CONSTRAINT `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_refr_user_id_da837fce_fk_jobReferr` FOREIGN KEY (`user_id`) REFERENCES `jobreferralapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_refreshtoken` VALUES (1,'saX4mUeQ0iw48d1sKyIf46CZRNEuY6',1,1,1,'2021-10-15 03:58:47.230775','2021-10-15 03:58:47.230775',NULL),(2,'gSO8BA8yaa4UXfScOGtBJuTSeo6b7S',2,1,1,'2021-10-15 04:04:12.774557','2021-10-15 04:04:12.775547',NULL),(3,'qLyoNNMvVqm0cqJSBQoYjy0hDMJ8dg',3,1,2,'2021-10-15 04:32:44.321576','2021-10-15 04:32:44.321576',NULL),(4,'n5IyiqbD26DAb6pwodBXHJt76oM19x',4,1,2,'2021-10-15 04:33:35.776761','2021-10-15 04:33:35.776761',NULL),(5,'WZFxDZDB1Egrho71qNuJoJZH8uBfUY',5,1,2,'2021-10-15 04:34:22.679822','2021-10-15 04:34:22.679822',NULL),(6,'LAgQ4uh0vaZsQGaW8DFmRiTJdldN98',6,1,2,'2021-10-15 04:35:20.651538','2021-10-15 04:35:20.652543',NULL),(7,'gpQer3uFRZT21UpfXNtcqovIYS0bcW',7,1,2,'2021-10-15 05:38:42.462115','2021-10-15 05:38:42.462115',NULL),(8,'BgwVRdGFDCpVMkmKlvsitaPWqJdM8h',8,1,2,'2021-10-15 05:43:53.865718','2021-10-15 05:43:53.865718',NULL),(9,'RevquyyhMJ4D5eSKECedvpQW9QBWUO',9,1,2,'2021-10-15 05:46:58.623032','2021-10-15 05:46:58.623032',NULL),(10,'GwWdxBxXJM12kuItJx29hyFZ8y1i6S',10,1,2,'2021-10-15 05:53:15.624416','2021-10-15 05:53:15.624416',NULL),(11,'94OjmqmD08ZpSKiKq3wAFjcXpSW0ap',11,1,2,'2021-10-15 05:54:40.423354','2021-10-15 05:54:40.423354',NULL),(12,'hsCVwwhJLt9uoI7sVwkwgaH5JeVjEl',12,1,2,'2021-10-15 05:56:51.320578','2021-10-15 05:56:51.320578',NULL),(13,'qArLW8fS3R8kH3uRi7Kg8QBlissjsZ',13,1,2,'2021-10-15 05:57:53.020777','2021-10-15 05:57:53.020777',NULL),(14,'5SBQ8fMz4ZdAw4Lx0Jelo0mKSYcF1E',14,1,2,'2021-10-15 05:58:26.045838','2021-10-15 05:58:26.046375',NULL),(15,'CELajuI7kVhJYDYsgn2cpehKft7cOJ',15,1,2,'2021-10-15 05:58:55.692089','2021-10-15 05:58:55.692089',NULL),(16,'ZB0IggrD40glEO7MoHtk3b3HWpYQU7',16,1,2,'2021-10-15 05:59:06.758840','2021-10-15 05:59:06.758840',NULL),(17,'8GZ3mKpG4buEU9avbeAyeWMn7yRHHD',17,1,2,'2021-10-15 05:59:16.404565','2021-10-15 05:59:16.404565',NULL),(18,'XQIRTBgwuC4tcCTxZzXurICPzqvSZu',18,1,2,'2021-10-15 05:59:38.572718','2021-10-15 05:59:38.572718',NULL),(19,'6lX8vOPZl6vUu0WapZ2ZzTlrIIlG4Z',19,1,1,'2021-10-15 06:00:11.939018','2021-10-15 06:00:11.939018',NULL),(20,'V3UKKeeFWiO2mHeWD7Mhuds7BAxvEE',20,1,1,'2021-10-15 06:01:36.107839','2021-10-15 06:01:36.107839',NULL),(21,'XswujXWzGsclxW1BKjtY8T4dpWYoz5',21,1,2,'2021-10-15 06:01:51.665215','2021-10-15 06:01:51.665215',NULL),(22,'PMQF7slfQlOW4HKaQCLGi2yMYtWXCC',22,1,2,'2021-10-15 06:03:56.989472','2021-10-15 06:03:56.989472',NULL),(23,'0fbWA5kQrbBZ6Z3cYkYzcVLzbzyNiC',23,1,2,'2021-10-15 06:04:30.110215','2021-10-15 06:04:30.110298',NULL),(24,'HWhTjCy08N2tn90pqed9Vkp6YbS6jj',24,1,2,'2021-10-15 06:10:45.112321','2021-10-15 06:10:45.112321',NULL),(25,'hEZxLSkIOXsGKcFOTyarFLaG9Y44AW',25,1,3,'2021-10-15 06:12:51.238081','2021-10-15 06:12:51.238081',NULL),(26,'541QVBwnqYV0JEqtkmUCqbmsqhB6kc',26,1,4,'2021-10-15 06:14:30.112142','2021-10-15 06:14:30.112142',NULL),(27,'d6UQ6RRnM71lQCbEvIxqVglcTz9xHy',27,1,4,'2021-10-15 06:15:00.882342','2021-10-15 06:15:00.882342',NULL),(28,'rmZt86nGsWWfqaWJ9h4pjzffUVjbTe',28,1,4,'2021-10-15 06:16:44.182438','2021-10-15 06:16:44.182438',NULL),(29,'CLLslwOopaxWkmwN8FgsvCEvur9FoH',29,1,2,'2021-10-15 06:18:05.722505','2021-10-15 06:18:05.722505',NULL),(30,'wIQzedvQCF0zCSyo2MBVJ6Qt4MLL7r',30,1,2,'2021-10-15 06:18:42.836074','2021-10-15 06:18:42.836074',NULL),(31,'G6CQXFlgMeG4xy3wslClFtCaWYufOw',31,1,4,'2021-10-15 06:19:17.824473','2021-10-15 06:19:17.824473',NULL),(32,'lMhpWI5kWJNj8rHJKWVxvo1cis5UpO',32,1,2,'2021-10-15 06:20:33.032774','2021-10-15 06:20:33.032774',NULL),(33,'bOghcJZ9iUyvNO0sV7UbX98urPYFFX',33,1,3,'2021-10-15 06:21:00.449445','2021-10-15 06:21:00.449445',NULL),(34,'hwowSqPtatuQrNnzOxN5EnU61WV8pF',34,1,3,'2021-10-15 06:22:04.691421','2021-10-15 06:22:04.691421',NULL),(35,'zb5xbeHITkSXB4IPJickkzWRbs47ix',35,1,2,'2021-10-15 06:22:32.381399','2021-10-15 06:22:32.381399',NULL),(36,'4c7l50CjQRqyTukG4JjNeDm84qrI02',36,1,2,'2021-10-15 06:23:26.273465','2021-10-15 06:23:26.273465',NULL),(37,'ufDQhbYLkT1kMrH7PLxaY1zgVtRTl1',37,1,2,'2021-10-15 06:26:56.237195','2021-10-15 06:26:56.237195',NULL),(38,'VZzQaptPEAadmHgKnm47YpKmBAe94t',38,1,3,'2021-10-15 06:27:32.410316','2021-10-15 06:27:32.410316',NULL),(39,'kdxlo01oAtskj9tAEeRd1IMwRenMHZ',39,1,2,'2021-10-17 03:05:45.028336','2021-10-17 03:05:45.028336',NULL),(40,'rJs1P7WBXDiuahXq4xcbweKtEWU4Da',40,1,1,'2021-10-17 03:11:21.922191','2021-10-17 03:11:21.922191',NULL),(41,'F7R5MkgmgxfdO0l37pFEQtk4rFN3UB',41,1,2,'2021-10-17 03:31:50.448909','2021-10-17 03:31:50.448909',NULL),(42,'zOkpuBRUmtyHRuToZnDzWpaA6beW18',42,1,2,'2021-10-17 03:39:56.740863','2021-10-17 03:39:56.740863',NULL),(43,'X6VNCUEiF5OiNDKyotm2XhVmEAeHfF',43,1,1,'2021-10-17 03:50:35.368087','2021-10-17 03:50:35.368087',NULL),(44,'NyO25Vw8MrCOZeFHMqYeEG7rwqV6BH',44,1,1,'2021-10-17 05:11:08.404732','2021-10-17 05:11:08.404732',NULL),(45,'3n8klliYEp4x8IPCR4emRUVeJNWAag',45,1,2,'2021-10-17 12:49:54.440037','2021-10-17 12:49:54.440037',NULL),(46,'LSqzVApfNWprsfYjSU9Zq3jwe1FojE',46,1,1,'2021-10-17 13:04:27.119271','2021-10-17 13:04:27.119271',NULL),(47,'FQBMONyymfbBdiQlIBuBJ7O2xU2NtI',47,1,5,'2021-10-20 13:01:49.221256','2021-10-20 13:01:49.221256',NULL),(48,'eaaE394IXTSRzH1e5KdNJGOnGxKpsK',48,1,5,'2021-10-20 13:03:38.551024','2021-10-20 13:03:38.551024',NULL),(49,'tU9BCui29kVQIeamYTKXiga2huAuTW',49,1,1,'2021-10-20 13:03:55.442329','2021-10-20 13:03:55.442329',NULL),(50,'Fy2nA3hdFXU6zziqtPiyiPq9GfYQ4n',50,1,5,'2021-10-21 02:38:29.631472','2021-10-21 02:38:29.631472',NULL),(51,'ICFKauEO4sjzT4Jol2Gi1kCQDzbeV7',51,1,8,'2021-10-21 10:38:44.080210','2021-10-21 10:38:44.080210',NULL),(52,'kVDWrdI1aQvAUghdSY07g9fP98v4kF',52,1,8,'2021-10-21 11:11:53.389505','2021-10-21 11:11:53.389505',NULL),(53,'ut5Fb47K69EkXtMjcubJrhQevFbviy',53,1,5,'2021-10-22 16:49:24.155134','2021-10-22 16:49:24.155134',NULL),(54,'iWEE4NilhbZ2AgBk5Bt8p3h8DM5ORA',54,1,1,'2021-10-22 16:49:35.670674','2021-10-22 16:49:35.670674',NULL),(55,'yYGxLgeJxCPweghLn7vltKN9XZtVHm',55,1,1,'2021-10-22 16:49:54.054618','2021-10-22 16:49:54.054618',NULL),(56,'zVQJyaWwYrMCQjz6FW0lkaXdQ1XidU',56,1,5,'2021-10-22 16:53:26.714170','2021-10-22 16:53:26.714170',NULL),(57,'L4TYmZtk3LSszzk9v9gBBKbS6AHMEX',57,1,5,'2021-10-23 10:20:50.152435','2021-10-23 10:20:50.152435',NULL),(58,'4fB3QTkToavhitAVcQSK3HW4QVsBs2',58,1,5,'2021-10-23 10:21:02.724679','2021-10-23 10:21:02.724679',NULL),(59,'uL8ZQdCUgXMfd0KU7QPVyhOgY6xDws',59,1,5,'2021-10-23 10:52:17.154982','2021-10-23 10:52:17.154982',NULL),(60,'qWIhogVRwymHzEEYvpdbU5WIaiCDSs',60,1,6,'2021-10-23 10:52:48.570878','2021-10-23 10:52:48.570878',NULL),(61,'KjwBVgp8Te7DjZwDINbz7SDryan4HF',61,1,6,'2021-10-23 10:53:00.801245','2021-10-23 10:53:00.801245',NULL),(62,'H7joNI4MiyvW6J46w69hdjBpAjDfj2',62,1,6,'2021-10-23 10:53:28.190954','2021-10-23 10:53:28.190954',NULL),(63,'knKD7v1wBDpglmIZTVlU7wz5YUGeaH',63,1,6,'2021-10-23 10:55:00.128981','2021-10-23 10:55:00.128981',NULL),(64,'32yauaRwGPDcxovH0R2YKASmO4VtAB',64,1,23,'2021-10-23 11:22:37.904013','2021-10-23 11:22:37.904013',NULL),(65,'Tkf1uJmjGuedYZXkMd0JSdDZZViJkA',65,1,23,'2021-10-23 11:23:30.440748','2021-10-23 11:23:30.440748',NULL),(66,'TTnlYH9WUP4RQtZvp4o6yCTtgVER5d',66,1,5,'2021-10-24 09:19:37.925519','2021-10-24 09:19:37.925519',NULL),(67,'2eqPESbMFfXQQpt1PC2WtvxmtDdO5A',67,1,4,'2021-10-24 09:23:28.697646','2021-10-24 09:23:28.697646',NULL),(68,'urAcgsM5rbD94dc322LSFIED6OweHD',68,1,4,'2021-10-24 09:24:09.668465','2021-10-24 09:24:09.668465',NULL),(69,'uDhuPOLsDApe982adgydLvmMysrL6S',69,1,3,'2021-10-24 09:25:08.078284','2021-10-24 09:25:08.078284',NULL),(70,'by0I8XOGM3S5AnXqrtlss2ymoEX8wl',70,1,3,'2021-10-24 09:44:54.599979','2021-10-24 09:44:54.599979',NULL),(71,'j6fWHo1FUaHzKSGI4pqcR7NiTMnQnT',71,1,7,'2021-10-24 10:26:10.600441','2021-10-24 10:26:10.600441',NULL),(72,'WNaiSz0zSICzc3USBISSJ3GWTy3Wl5',72,1,5,'2021-10-24 14:24:42.294554','2021-10-24 14:24:42.294554',NULL),(73,'H7SRBXseEFPbOLAooT00uTcMaq10xx',73,1,4,'2021-10-24 14:49:47.780558','2021-10-24 14:49:47.780558',NULL),(74,'wp7kgwJXl5Vpfra8EneCvxPidkQQSD',74,1,5,'2021-10-25 09:59:33.941982','2021-10-25 09:59:33.941982',NULL),(75,'LjLCyo2k9MRYFQPk4MQNJ4tWf00FrM',75,1,5,'2021-10-25 10:26:22.539455','2021-10-25 10:26:22.539455',NULL),(76,'LJ4KRc5C8711ePPAuA0C7dgMVIOr4M',76,1,5,'2021-10-25 11:03:22.150009','2021-10-25 11:03:22.150009',NULL),(77,'akWMvvwLa75zRuLJgnfi3aYLgVELwP',77,1,5,'2021-11-21 05:51:58.329237','2021-11-21 05:51:58.329237',NULL),(78,'EJxqtNqduDu5g1vzwyt0gvjywQZb69',78,1,5,'2021-12-02 07:59:13.238288','2021-12-02 07:59:13.238288',NULL),(79,'xVRfiMEVeHpZgOT396bzVWWONsEvTq',79,1,1,'2021-12-02 09:17:41.684024','2021-12-02 09:17:41.684024',NULL),(80,'qOQlQ3I80Ux42B2c9nkuuZxWgqj2lT',80,1,1,'2021-12-02 09:20:20.943684','2021-12-02 09:20:20.943684',NULL),(81,'qJ1EreOvmA8szAgRhUD3fQNpp5G0uu',81,1,5,'2021-12-03 08:42:04.985352','2021-12-03 08:42:04.986356',NULL),(82,'jwQmfkLTOqios7gZl47OcOM8jErYRP',82,1,5,'2021-12-04 06:47:42.720106','2021-12-04 06:47:42.720106',NULL),(83,'D1JTibSLMqWj3xoh6QuYYxp5AqYmo7',84,1,1,'2021-12-04 13:35:42.834775','2021-12-04 13:35:42.834775',NULL),(84,'LFoUOWWUOhfUIBMFe8vFoCuB5j9yLj',83,1,1,'2021-12-04 13:35:42.835785','2021-12-04 13:35:42.835785',NULL),(85,'EvZokthsjs9R6fvhDtSKFGdiPIHbJx',85,1,5,'2021-12-04 13:36:09.037576','2021-12-04 13:36:09.037576',NULL),(86,'mCNyJelO96jrSYhsUlpEk409Otv1oi',86,1,5,'2021-12-05 08:47:42.384347','2021-12-05 08:47:42.384347',NULL),(87,'eL510Xg7S8oN6HIsQzZ7wb22OCzCDd',87,1,5,'2021-12-05 08:48:02.336706','2021-12-05 08:48:02.336706',NULL),(88,'94jsAyLwuEDa8rzMN8Da2u5AYnhLTa',88,1,1,'2021-12-05 10:08:33.327980','2021-12-05 10:08:33.327980',NULL),(89,'jJ0XJZaKJjEHRpW3xXu10fIoKFsJ2e',89,1,5,'2021-12-05 12:47:25.114302','2021-12-05 12:47:25.114302',NULL),(90,'ri5KQqviU2iu4b3y9Ss2nTvMKmx2He',90,1,5,'2021-12-19 11:14:16.689352','2021-12-19 11:14:16.689352',NULL),(91,'E2uWSv8btn6VyWZWnVdVtdciraUorL',91,1,6,'2021-12-20 03:48:17.629403','2021-12-20 03:48:17.629403',NULL),(92,'28kYZe5tL8OewaxDKPdircUursHUHi',92,1,1,'2021-12-20 03:58:27.994813','2021-12-20 03:58:27.994813',NULL),(93,'Z7sBkJyTk1JawGimYfSSGXx0BqrI8A',93,1,8,'2021-12-20 03:58:57.547632','2021-12-20 03:58:57.547632',NULL),(94,'hnjoTklngaLPciUvFUZY2a56RfueP1',94,1,5,'2021-12-20 06:29:27.096364','2021-12-20 06:29:27.096364',NULL),(95,'bXz4OmfPY60sBVx2DvA0rCCK8rv4b4',95,1,5,'2021-12-20 07:45:28.453493','2021-12-20 07:45:28.453493',NULL),(96,'tNYIwElE6ErtIQOq2zk9EwvtCdDirF',96,1,5,'2021-12-20 08:21:36.976982','2021-12-20 08:21:36.976982',NULL),(97,'5iRFTQ5k7shxJc3ttZ3yJUiYSK2D8g',97,1,3,'2021-12-20 08:24:32.045732','2021-12-20 08:24:32.045732',NULL),(98,'6Whbl9q83abowBaT8mDxjl0ScZdgeC',98,1,5,'2021-12-20 08:24:50.637607','2021-12-20 08:24:50.637607',NULL),(99,'euqEZWidQ4BGEQPK7WzjYoZscGz5Be',99,1,5,'2021-12-20 08:25:08.129076','2021-12-20 08:25:08.129076',NULL),(100,'2mC5s2N5AVTYRW7ysQfwEBwqY7kllV',100,1,8,'2021-12-21 00:04:56.423798','2021-12-21 00:04:56.423798',NULL),(101,'QZsPFo2v68UjgjCXwkeQ9FHIFojif5',101,1,5,'2021-12-21 05:53:32.615306','2021-12-21 05:53:32.615306',NULL),(102,'miUMect26a5cGP7fqljQzWy9NylLVD',102,1,8,'2021-12-21 05:57:41.605031','2021-12-21 05:57:41.605031',NULL),(103,'UJ7WV8bjcI8RNChRLS9rxw7adAdNbJ',103,1,8,'2021-12-21 07:30:42.050105','2021-12-21 07:30:42.050105',NULL),(104,'vEXLQpDiMcs92GSii5041qeBazX06c',104,1,4,'2021-12-21 12:27:32.305946','2021-12-21 12:27:32.305946',NULL),(105,'CBqIbXcrXKhO0YqrCYSphMwRxIJGzO',105,1,4,'2021-12-22 02:47:10.343205','2021-12-22 02:47:10.343205',NULL),(106,'4LDC4KCa2cpUdh1Wn3r1T84oQq2Caf',106,1,4,'2021-12-22 08:09:02.063518','2021-12-22 08:09:02.063518',NULL),(107,'Dxkyzf6jhN62dWYFqND6ZSEJ6i11HV',107,1,4,'2021-12-23 06:50:42.754331','2021-12-23 06:50:42.754331',NULL),(108,'RRU2BabDo4K7m4h4CjV9s6AqXnKa99',108,1,4,'2021-12-24 04:13:15.265753','2021-12-24 04:13:15.265753',NULL),(109,'UUDb6HjSIv6IMCWXm86pehsphH3rS3',109,1,8,'2021-12-24 04:41:26.395117','2021-12-24 04:41:26.395117',NULL),(110,'KW4VP3Y9TJE9UCvxAZsuffzo1hvkk3',110,1,4,'2021-12-24 07:20:38.933570','2021-12-24 07:20:38.933570',NULL),(111,'S3K8kYhf1CWeFaiMMXePcR54qKDiNr',111,1,7,'2021-12-24 07:59:26.560029','2021-12-24 07:59:26.560029',NULL),(112,'9WNrTf3BlwGjWFg7OG9FOltKfKD35x',112,1,5,'2021-12-24 08:25:01.475159','2021-12-24 08:25:01.475159',NULL),(113,'EBYMP18pQUGY9P6FgqljlKFguXvYOC',113,1,4,'2021-12-24 08:25:26.539037','2021-12-24 08:25:26.539037',NULL),(114,'HtvoiG0O7cAe9JchfAuonj0SqHLLnQ',114,1,7,'2021-12-24 08:25:38.839882','2021-12-24 08:25:38.839882',NULL),(115,'6gByPzHKHCO3anbpVTzRx6eWeHpvpH',115,1,8,'2021-12-24 08:26:09.298970','2021-12-24 08:26:09.298970',NULL),(116,'paBQEYJLd66Tv57uw6mDIql1LUvq3E',116,1,7,'2021-12-24 08:54:03.996469','2021-12-24 08:54:03.996469',NULL),(117,'e4OV04zc77jzu8KwqZEolvMxnKmBeV',117,1,8,'2021-12-24 09:22:37.012963','2021-12-24 09:22:37.012963',NULL),(118,'nMQXPZDGVthA0RN1qsez3mZWomLUGw',118,1,7,'2021-12-24 10:06:27.707081','2021-12-24 10:06:27.707081',NULL),(119,'taMcCZ4im38Tj9q6niHU2MTiewf7pF',119,1,4,'2021-12-24 10:06:48.403843','2021-12-24 10:06:48.403843',NULL),(120,'NGL0Kw0NG2dI9b7U0oRD1TH38wy2Ig',120,1,7,'2021-12-24 13:39:35.808398','2021-12-24 13:39:35.808398',NULL),(121,'lXqyFk3LmEx2DZcPuVWGD2FWlw5nZv',121,1,4,'2021-12-24 14:20:42.343513','2021-12-24 14:20:42.343513',NULL),(122,'4tyUpq7wq1IcqRgpQ7Pd2tpfXipj68',122,1,7,'2021-12-24 14:21:07.925313','2021-12-24 14:21:07.926309',NULL);
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_association`
--

DROP TABLE IF EXISTS `social_auth_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_association` (
  `id` int NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `issued` int NOT NULL,
  `lifetime` int NOT NULL,
  `assoc_type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_association_server_url_handle_078befa2_uniq` (`server_url`,`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_association`
--

LOCK TABLES `social_auth_association` WRITE;
/*!40000 ALTER TABLE `social_auth_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_code`
--

DROP TABLE IF EXISTS `social_auth_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_code` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_code_email_code_801b2d02_uniq` (`email`,`code`),
  KEY `social_auth_code_code_a2393167` (`code`),
  KEY `social_auth_code_timestamp_176b341f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_code`
--

LOCK TABLES `social_auth_code` WRITE;
/*!40000 ALTER TABLE `social_auth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_nonce`
--

DROP TABLE IF EXISTS `social_auth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_nonce` (
  `id` int NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int NOT NULL,
  `salt` varchar(65) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_nonce_server_url_timestamp_salt_f6284463_uniq` (`server_url`,`timestamp`,`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_nonce`
--

LOCK TABLES `social_auth_nonce` WRITE;
/*!40000 ALTER TABLE `social_auth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_partial`
--

DROP TABLE IF EXISTS `social_auth_partial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_partial` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `next_step` smallint unsigned NOT NULL,
  `backend` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `social_auth_partial_token_3017fea3` (`token`),
  KEY `social_auth_partial_timestamp_50f2119f` (`timestamp`),
  CONSTRAINT `social_auth_partial_chk_1` CHECK ((`next_step` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_partial`
--

LOCK TABLES `social_auth_partial` WRITE;
/*!40000 ALTER TABLE `social_auth_partial` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_partial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_usersocialauth`
--

DROP TABLE IF EXISTS `social_auth_usersocialauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_usersocialauth` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `extra_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_usersocialauth_provider_uid_e6b5e668_uniq` (`provider`,`uid`),
  KEY `social_auth_usersoci_user_id_17d28448_fk_jobReferr` (`user_id`),
  KEY `social_auth_usersocialauth_uid_796e51dc` (`uid`),
  CONSTRAINT `social_auth_usersoci_user_id_17d28448_fk_jobReferr` FOREIGN KEY (`user_id`) REFERENCES `jobreferralapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_usersocialauth`
--

LOCK TABLES `social_auth_usersocialauth` WRITE;
/*!40000 ALTER TABLE `social_auth_usersocialauth` DISABLE KEYS */;
INSERT INTO `social_auth_usersocialauth` VALUES (1,'google-oauth2','npthuthuy237@gmail.com','{\"auth_time\": 1634474994, \"expires\": null, \"access_token\": \"ya29.a0ARrdaM_V_q36eqC9BSwV6m5uZdq9Qg0K9Hm_jKoKfFZfrSKw_j4r9KoSMiG4W_y_uvZKnKJaF5zLSEsRK2gctJOwhunfCouUYQW8P-n86Ey5fwbBikZLwQ7xvu46YsPDu7Z2H_pT8F-QgTGwsIl4nmc5Vv9m5g\", \"token_type\": null}',2,'2021-10-15 04:32:44.296181','2021-10-17 12:49:54.371733'),(2,'google-oauth2','ngaymuadai72@gmail.com','{\"auth_time\": 1639988672, \"expires\": null, \"access_token\": \"ya29.a0ARrdaM_f4_wHxpM8b413hJ9ncr6HvurC8ZXfQM6Q1Le2tYWhL7fpr5REsHJ9_KbXW0gQSJckWsivmeTwQx3Km_DsAwVaJ4MBzl9FjeqrwVJuY6OKov86B8jQVQtaccGQmUmj4aCVEtXAGiiBWo5Db_Ww0Sv25oc\", \"token_type\": null}',3,'2021-10-15 06:12:51.194116','2021-12-20 08:24:32.034591'),(3,'google-oauth2','1851050140thuy@ou.edu.vn','{\"auth_time\": 1640355642, \"expires\": null, \"access_token\": \"ya29.a0ARrdaM9EGndYazA4KqO4PCeJvNU7ipW_jNm_qKwLlb-kZQunhcuRWp3mVynuZw-CAbrV_aThcCSHTzkJA7JkJhnJyFBDSZYvTI62OuxOzRjJdoa3C7jzmogPOMY-RoxMO237KMYAikYgIN56Au9DlqF_aWsXDnI\", \"token_type\": null}',4,'2021-10-15 06:14:30.084270','2021-12-24 14:20:42.307149');
/*!40000 ALTER TABLE `social_auth_usersocialauth` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-24 23:18:02
