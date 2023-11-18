-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: syncromall
-- ------------------------------------------------------
-- Server version	10.6.12-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `backend_access_log`
--

DROP TABLE IF EXISTS `backend_access_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_access_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_access_log`
--

LOCK TABLES `backend_access_log` WRITE;
/*!40000 ALTER TABLE `backend_access_log` DISABLE KEYS */;
INSERT INTO `backend_access_log` VALUES (1,1,'127.0.0.1','2023-11-03 08:22:50','2023-11-03 08:22:50'),(2,1,'127.0.0.1','2023-11-04 08:33:32','2023-11-04 08:33:32'),(3,1,'127.0.0.1','2023-11-05 15:43:14','2023-11-05 15:43:14'),(4,1,'127.0.0.1','2023-11-06 06:51:25','2023-11-06 06:51:25'),(5,1,'127.0.0.1','2023-11-06 15:25:41','2023-11-06 15:25:41'),(6,1,'127.0.0.1','2023-11-07 07:38:07','2023-11-07 07:38:07'),(7,1,'127.0.0.1','2023-11-07 15:48:50','2023-11-07 15:48:50'),(8,1,'127.0.0.1','2023-11-08 07:41:20','2023-11-08 07:41:20'),(9,1,'127.0.0.1','2023-11-08 14:14:47','2023-11-08 14:14:47'),(10,1,'127.0.0.1','2023-11-09 07:35:56','2023-11-09 07:35:56'),(11,1,'127.0.0.1','2023-11-09 14:37:02','2023-11-09 14:37:02'),(12,1,'127.0.0.1','2023-11-10 07:26:24','2023-11-10 07:26:24');
/*!40000 ALTER TABLE `backend_access_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_user_groups`
--

DROP TABLE IF EXISTS `backend_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_user_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_new_user_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_unique` (`name`),
  KEY `code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_user_groups`
--

LOCK TABLES `backend_user_groups` WRITE;
/*!40000 ALTER TABLE `backend_user_groups` DISABLE KEYS */;
INSERT INTO `backend_user_groups` VALUES (1,'Owners','owners','Default group for website owners.',0,'2023-10-28 06:58:51','2023-10-28 06:58:51');
/*!40000 ALTER TABLE `backend_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_user_preferences`
--

DROP TABLE IF EXISTS `backend_user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_user_preferences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `namespace` varchar(100) NOT NULL,
  `group` varchar(50) NOT NULL,
  `item` varchar(150) NOT NULL,
  `value` text DEFAULT NULL,
  `site_id` int(10) unsigned DEFAULT NULL,
  `site_root_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_item_index` (`user_id`,`namespace`,`group`,`item`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_user_preferences`
--

LOCK TABLES `backend_user_preferences` WRITE;
/*!40000 ALTER TABLE `backend_user_preferences` DISABLE KEYS */;
INSERT INTO `backend_user_preferences` VALUES (1,1,'cms','theme','edit','\"artistro08-bootstrap-mall-theme\"',NULL,NULL),(2,1,'tecnotrade_websync','clientproductrulescontroller','lists','{\"visible\":[\"rule_name\",\"label\",\"description\",\"primary_key\",\"somma_campi_numerici\",\"concatena_campi_come_stringa\",\"elimina_da_mall_se_inizia_per\"],\"order\":[\"rule_name\",\"label\",\"description\",\"primary_key\",\"somma_campi_numerici\",\"concatena_campi_come_stringa\",\"elimina_da_mall_se_inizia_per\"],\"per_page\":\"20\"}',NULL,NULL);
/*!40000 ALTER TABLE `backend_user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_user_roles`
--

DROP TABLE IF EXISTS `backend_user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_user_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `color_background` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `permissions` mediumtext DEFAULT NULL,
  `is_system` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_unique` (`name`),
  KEY `role_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_user_roles`
--

LOCK TABLES `backend_user_roles` WRITE;
/*!40000 ALTER TABLE `backend_user_roles` DISABLE KEYS */;
INSERT INTO `backend_user_roles` VALUES (1,'Developer','developer','#3498db','Site administrator with access to developer tools.','',1,1,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(2,'Publisher','publisher','#1abc9c','Site editor with access to publishing tools.','',1,2,'2023-10-28 06:58:51','2023-10-28 06:58:51');
/*!40000 ALTER TABLE `backend_user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_user_throttle`
--

DROP TABLE IF EXISTS `backend_user_throttle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_user_throttle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT 0,
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT 0,
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT 0,
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `backend_user_throttle_user_id_index` (`user_id`),
  KEY `backend_user_throttle_ip_address_index` (`ip_address`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_user_throttle`
--

LOCK TABLES `backend_user_throttle` WRITE;
/*!40000 ALTER TABLE `backend_user_throttle` DISABLE KEYS */;
INSERT INTO `backend_user_throttle` VALUES (1,1,'127.0.0.1',0,NULL,0,NULL,0,NULL);
/*!40000 ALTER TABLE `backend_user_throttle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_users`
--

DROP TABLE IF EXISTS `backend_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `login` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `persist_code` varchar(255) DEFAULT NULL,
  `reset_password_code` varchar(255) DEFAULT NULL,
  `permissions` mediumtext DEFAULT NULL,
  `is_activated` tinyint(1) NOT NULL DEFAULT 0,
  `is_superuser` tinyint(1) NOT NULL DEFAULT 0,
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_password_expired` tinyint(1) NOT NULL DEFAULT 0,
  `password_changed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_unique` (`login`),
  UNIQUE KEY `email_unique` (`email`),
  KEY `act_code_index` (`activation_code`),
  KEY `reset_code_index` (`reset_password_code`),
  KEY `admin_role_index` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_users`
--

LOCK TABLES `backend_users` WRITE;
/*!40000 ALTER TABLE `backend_users` DISABLE KEYS */;
INSERT INTO `backend_users` VALUES (1,'Andrea','Berni','admin','aberni.2501@gmail.com','$2y$10$iYI4MsrrpiKdReyglXSJA.GN14qHeB5OLzVTNj4/V1IloCDDi9xgC',NULL,'$2y$10$z4vH0rEVminaUukjvYta9e8GJQNaPrf.esZhRzIh4bOr5rbpISyGO',NULL,'',1,1,NULL,'2023-11-10 07:26:24',NULL,1,'2023-10-28 06:59:17','2023-11-10 07:26:24',0,'2023-10-28 06:59:17');
/*!40000 ALTER TABLE `backend_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_users_groups`
--

DROP TABLE IF EXISTS `backend_users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_users_groups` (
  `user_id` int(10) unsigned NOT NULL,
  `user_group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_users_groups`
--

LOCK TABLES `backend_users_groups` WRITE;
/*!40000 ALTER TABLE `backend_users_groups` DISABLE KEYS */;
INSERT INTO `backend_users_groups` VALUES (1,1);
/*!40000 ALTER TABLE `backend_users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `expiration` int(11) NOT NULL,
  UNIQUE KEY `cache_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_theme_data`
--

DROP TABLE IF EXISTS `cms_theme_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_theme_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `theme` varchar(255) DEFAULT NULL,
  `data` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_data_theme_index` (`theme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_theme_data`
--

LOCK TABLES `cms_theme_data` WRITE;
/*!40000 ALTER TABLE `cms_theme_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_theme_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_theme_logs`
--

DROP TABLE IF EXISTS `cms_theme_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_theme_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `theme` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `old_template` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `old_content` longtext DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_logs_type_index` (`type`),
  KEY `cms_theme_logs_theme_index` (`theme`),
  KEY `cms_theme_logs_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_theme_logs`
--

LOCK TABLES `cms_theme_logs` WRITE;
/*!40000 ALTER TABLE `cms_theme_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_theme_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_theme_templates`
--

DROP TABLE IF EXISTS `cms_theme_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_theme_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `file_size` int(10) unsigned NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_templates_source_index` (`source`),
  KEY `cms_theme_templates_path_index` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_theme_templates`
--

LOCK TABLES `cms_theme_templates` WRITE;
/*!40000 ALTER TABLE `cms_theme_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_theme_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deferred_bindings`
--

DROP TABLE IF EXISTS `deferred_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deferred_bindings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `master_type` varchar(255) NOT NULL,
  `master_field` varchar(255) NOT NULL,
  `slave_type` varchar(255) NOT NULL,
  `slave_id` int(11) NOT NULL,
  `pivot_data` mediumtext DEFAULT NULL,
  `session_key` varchar(255) NOT NULL,
  `is_bind` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deferred_bindings`
--

LOCK TABLES `deferred_bindings` WRITE;
/*!40000 ALTER TABLE `deferred_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `deferred_bindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` text NOT NULL,
  `exception` longtext DEFAULT NULL,
  `failed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` text NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2013_10_01_000001_Db_Deferred_Bindings',1),(2,'2013_10_01_000002_Db_System_Files',1),(3,'2013_10_01_000003_Db_System_Plugin_Versions',1),(4,'2013_10_01_000004_Db_System_Plugin_History',1),(5,'2013_10_01_000005_Db_System_Settings',1),(6,'2013_10_01_000006_Db_System_Parameters',1),(7,'2013_10_01_000008_Db_System_Mail_Templates',1),(8,'2013_10_01_000009_Db_System_Mail_Layouts',1),(9,'2014_10_01_000010_Db_Jobs',1),(10,'2014_10_01_000011_Db_System_Event_Logs',1),(11,'2014_10_01_000012_Db_System_Request_Logs',1),(12,'2014_10_01_000013_Db_System_Sessions',1),(13,'2015_10_01_000016_Db_Cache',1),(14,'2015_10_01_000017_Db_System_Revisions',1),(15,'2015_10_01_000018_Db_FailedJobs',1),(16,'2017_10_01_000023_Db_System_Mail_Partials',1),(17,'2021_10_01_000025_Db_Add_Pivot_Data_To_Deferred_Bindings',1),(18,'2022_10_01_000026_Db_System_Site_Definitions',1),(19,'2023_10_01_000027_Db_Add_Site_To_Settings',1),(20,'2023_10_01_000028_Db_Add_Restrict_Roles_To_Sites',1),(21,'2023_10_01_000029_Db_System_Site_Groups',1),(22,'2023_10_01_000030_Db_Add_Group_To_Sites',1),(23,'2013_10_01_000001_Db_Backend_Users',2),(24,'2013_10_01_000002_Db_Backend_User_Groups',2),(25,'2013_10_01_000003_Db_Backend_Users_Groups',2),(26,'2013_10_01_000004_Db_Backend_User_Throttle',2),(27,'2014_01_04_000005_Db_Backend_User_Preferences',2),(28,'2014_10_01_000006_Db_Backend_Access_Log',2),(29,'2017_10_01_000010_Db_Backend_User_Roles',2),(30,'2018_12_16_000011_Db_Backend_Add_Deleted_At',2),(31,'2022_10_01_000012_Db_Backend_User_Roles_Sortable',2),(32,'2023_10_01_000013_Db_Add_Site_To_Preferences',2),(33,'2023_10_01_000014_Db_Add_User_Expired_Password',2),(34,'2014_10_01_000001_Db_Cms_Theme_Data',3),(35,'2017_10_01_000003_Db_Cms_Theme_Logs',3),(36,'2018_11_01_000001_Db_Cms_Theme_Templates',3),(37,'2021_05_01_000001_Db_Tailor_Globals',4),(38,'2021_05_01_000002_Db_Tailor_Content',4),(39,'2021_06_01_000003_Db_Tailor_PreviewToken',4),(40,'2023_10_01_000004_Db_Tailor_Content_Joins',4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_addresses`
--

DROP TABLE IF EXISTS `offline_mall_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `lines` text NOT NULL,
  `zip` varchar(20) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state_id` int(10) unsigned DEFAULT NULL,
  `country_id` int(10) unsigned DEFAULT NULL,
  `details` text DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `offline_mall_addresses_state_id_index` (`state_id`),
  KEY `offline_mall_addresses_country_id_index` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_addresses`
--

LOCK TABLES `offline_mall_addresses` WRITE;
/*!40000 ALTER TABLE `offline_mall_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_brands`
--

DROP TABLE IF EXISTS `offline_mall_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `sort_order` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_brands`
--

LOCK TABLES `offline_mall_brands` WRITE;
/*!40000 ALTER TABLE `offline_mall_brands` DISABLE KEYS */;
INSERT INTO `offline_mall_brands` VALUES (1,'Brand 01','brand-01','<p>Prova del brand</p>','',1,'2023-10-28 08:54:21','2023-10-28 08:55:35');
/*!40000 ALTER TABLE `offline_mall_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_cart_custom_field_value`
--

DROP TABLE IF EXISTS `offline_mall_cart_custom_field_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_cart_custom_field_value` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cart_product_id` int(10) unsigned DEFAULT NULL,
  `custom_field_id` int(10) unsigned NOT NULL,
  `custom_field_option_id` int(10) unsigned DEFAULT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_cart_custom_field_value`
--

LOCK TABLES `offline_mall_cart_custom_field_value` WRITE;
/*!40000 ALTER TABLE `offline_mall_cart_custom_field_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_cart_custom_field_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_cart_discount`
--

DROP TABLE IF EXISTS `offline_mall_cart_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_cart_discount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cart_id` int(10) unsigned NOT NULL,
  `discount_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cart_discount_pivot` (`cart_id`,`discount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_cart_discount`
--

LOCK TABLES `offline_mall_cart_discount` WRITE;
/*!40000 ALTER TABLE `offline_mall_cart_discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_cart_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_cart_product_service_option`
--

DROP TABLE IF EXISTS `offline_mall_cart_product_service_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_cart_product_service_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_option_id` int(11) NOT NULL,
  `cart_product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_cart_product_service_option` (`cart_product_id`,`service_option_id`),
  KEY `idx_cart_product_service_option` (`cart_product_id`,`service_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_cart_product_service_option`
--

LOCK TABLES `offline_mall_cart_product_service_option` WRITE;
/*!40000 ALTER TABLE `offline_mall_cart_product_service_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_cart_product_service_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_cart_products`
--

DROP TABLE IF EXISTS `offline_mall_cart_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_cart_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cart_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `variant_id` int(10) unsigned DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `weight` int(11) DEFAULT NULL,
  `price` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_cart_products`
--

LOCK TABLES `offline_mall_cart_products` WRITE;
/*!40000 ALTER TABLE `offline_mall_cart_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_cart_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_carts`
--

DROP TABLE IF EXISTS `offline_mall_carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_carts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `shipping_address_id` int(10) unsigned DEFAULT NULL,
  `billing_address_id` int(10) unsigned DEFAULT NULL,
  `shipping_method_id` int(10) unsigned DEFAULT NULL,
  `payment_method_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `customer_payment_method_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cart_session_id` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_carts`
--

LOCK TABLES `offline_mall_carts` WRITE;
/*!40000 ALTER TABLE `offline_mall_carts` DISABLE KEYS */;
INSERT INTO `offline_mall_carts` VALUES (1,'BlAEWP4PbTgTrmz7HVQJSH1rFmZrffdX6a2OYbSOgmyWAC5xdOGuK0B1MW1YFTQ75PMSAupcfF3wkzQnotFuqsTS4hVBDGiqRqE2',NULL,NULL,NULL,1,NULL,'2023-10-28 07:05:20','2023-10-28 07:05:20',NULL,NULL),(2,'6slk6KY9hU1DpYfIEoATCIRXI2XPwaR13pMXoUKxjszDPcZo2gH4bzcRaz5FGdsO7wWyWWCQwejmn62G9ebyHWzDGaBw0DuEYkVQ',NULL,NULL,NULL,1,NULL,'2023-10-28 09:11:14','2023-10-28 09:11:14',NULL,NULL);
/*!40000 ALTER TABLE `offline_mall_carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_categories`
--

DROP TABLE IF EXISTS `offline_mall_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `sort_order` int(10) unsigned DEFAULT NULL,
  `google_product_category_id` int(11) DEFAULT NULL,
  `inherit_property_groups` tinyint(1) DEFAULT 0,
  `inherit_review_categories` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `nest_depth` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `description_short` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_category_deleted_at` (`deleted_at`),
  KEY `idx_category_parent_id` (`parent_id`),
  KEY `idx_category_nest_left` (`nest_left`),
  KEY `idx_category_nest_right` (`nest_right`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_categories`
--

LOCK TABLES `offline_mall_categories` WRITE;
/*!40000 ALTER TABLE `offline_mall_categories` DISABLE KEYS */;
INSERT INTO `offline_mall_categories` VALUES (1,'Example category','example','001','Categoria di esempio','Una Categoria di esempio',NULL,NULL,0,0,'2023-10-28 07:01:30','2023-10-28 08:57:11',NULL,NULL,1,2,0,'<p>Una categoria lunga</p>','Una categoria');
/*!40000 ALTER TABLE `offline_mall_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_category_product`
--

DROP TABLE IF EXISTS `offline_mall_category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_category_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `sort_order` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_category_product`
--

LOCK TABLES `offline_mall_category_product` WRITE;
/*!40000 ALTER TABLE `offline_mall_category_product` DISABLE KEYS */;
INSERT INTO `offline_mall_category_product` VALUES (1,1,1,NULL);
/*!40000 ALTER TABLE `offline_mall_category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_category_property_group`
--

DROP TABLE IF EXISTS `offline_mall_category_property_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_category_property_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `property_group_id` int(10) unsigned NOT NULL,
  `relation_sort_order` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_property_group_pivot` (`category_id`,`property_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_category_property_group`
--

LOCK TABLES `offline_mall_category_property_group` WRITE;
/*!40000 ALTER TABLE `offline_mall_category_property_group` DISABLE KEYS */;
INSERT INTO `offline_mall_category_property_group` VALUES (1,1,2,NULL,NULL,NULL);
/*!40000 ALTER TABLE `offline_mall_category_property_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_category_review_category`
--

DROP TABLE IF EXISTS `offline_mall_category_review_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_category_review_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `review_category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_review_category_id` (`category_id`,`review_category_id`),
  KEY `idx_review_category_id` (`category_id`,`review_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_category_review_category`
--

LOCK TABLES `offline_mall_category_review_category` WRITE;
/*!40000 ALTER TABLE `offline_mall_category_review_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_category_review_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_category_review_totals`
--

DROP TABLE IF EXISTS `offline_mall_category_review_totals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_category_review_totals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `review_category_id` int(11) NOT NULL,
  `rating` decimal(3,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `offline_mall_category_review_totals_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_category_review_totals`
--

LOCK TABLES `offline_mall_category_review_totals` WRITE;
/*!40000 ALTER TABLE `offline_mall_category_review_totals` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_category_review_totals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_category_reviews`
--

DROP TABLE IF EXISTS `offline_mall_category_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_category_reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `review_id` int(11) NOT NULL,
  `review_category_id` int(11) NOT NULL,
  `rating` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `offline_mall_category_reviews_review_id_index` (`review_id`),
  KEY `offline_mall_category_reviews_review_category_id_index` (`review_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_category_reviews`
--

LOCK TABLES `offline_mall_category_reviews` WRITE;
/*!40000 ALTER TABLE `offline_mall_category_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_category_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_country_tax`
--

DROP TABLE IF EXISTS `offline_mall_country_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_country_tax` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `tax_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offline_mall_country_tax_country_id_tax_id_unique` (`country_id`,`tax_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_country_tax`
--

LOCK TABLES `offline_mall_country_tax` WRITE;
/*!40000 ALTER TABLE `offline_mall_country_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_country_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_currencies`
--

DROP TABLE IF EXISTS `offline_mall_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_currencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `rate` decimal(12,4) NOT NULL DEFAULT 1.0000,
  `decimals` int(11) NOT NULL DEFAULT 2,
  `format` text NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rounding` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_currencies`
--

LOCK TABLES `offline_mall_currencies` WRITE;
/*!40000 ALTER TABLE `offline_mall_currencies` DISABLE KEYS */;
INSERT INTO `offline_mall_currencies` VALUES (2,'EUR','€',1.0000,2,'{{ price|number_format(2, \".\", \"\'\") }}{{ currency.symbol }}',2,1,'2023-10-28 07:01:30','2023-10-28 09:05:27',NULL);
/*!40000 ALTER TABLE `offline_mall_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_custom_field_options`
--

DROP TABLE IF EXISTS `offline_mall_custom_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_custom_field_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `option_value` varchar(255) DEFAULT NULL,
  `sort_order` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_custom_field_options`
--

LOCK TABLES `offline_mall_custom_field_options` WRITE;
/*!40000 ALTER TABLE `offline_mall_custom_field_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_custom_field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_custom_fields`
--

DROP TABLE IF EXISTS `offline_mall_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_custom_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'text',
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_custom_fields`
--

LOCK TABLES `offline_mall_custom_fields` WRITE;
/*!40000 ALTER TABLE `offline_mall_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_customer_group_prices`
--

DROP TABLE IF EXISTS `offline_mall_customer_group_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_customer_group_prices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(10) unsigned NOT NULL,
  `currency_id` int(10) unsigned NOT NULL,
  `priceable_id` int(10) unsigned NOT NULL,
  `priceable_type` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_group_unique_price` (`customer_group_id`,`priceable_id`,`priceable_type`,`currency_id`),
  KEY `idx_group_price_currency` (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_customer_group_prices`
--

LOCK TABLES `offline_mall_customer_group_prices` WRITE;
/*!40000 ALTER TABLE `offline_mall_customer_group_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_customer_group_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_customer_groups`
--

DROP TABLE IF EXISTS `offline_mall_customer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_customer_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `sort_order` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_customer_groups`
--

LOCK TABLES `offline_mall_customer_groups` WRITE;
/*!40000 ALTER TABLE `offline_mall_customer_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_customer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_customer_payment_methods`
--

DROP TABLE IF EXISTS `offline_mall_customer_payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_customer_payment_methods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `data` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_customer_payment_methods`
--

LOCK TABLES `offline_mall_customer_payment_methods` WRITE;
/*!40000 ALTER TABLE `offline_mall_customer_payment_methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_customer_payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_customers`
--

DROP TABLE IF EXISTS `offline_mall_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `is_guest` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` int(10) unsigned DEFAULT NULL,
  `default_shipping_address_id` int(11) DEFAULT NULL,
  `default_billing_address_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `stripe_customer_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_customers`
--

LOCK TABLES `offline_mall_customers` WRITE;
/*!40000 ALTER TABLE `offline_mall_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_discounts`
--

DROP TABLE IF EXISTS `offline_mall_discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_discounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `payment_method_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'Rate',
  `trigger` varchar(255) NOT NULL DEFAULT 'Code',
  `rate` int(10) unsigned DEFAULT NULL,
  `max_number_of_usages` int(10) unsigned DEFAULT NULL,
  `valid_from` datetime DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `number_of_usages` int(10) unsigned NOT NULL DEFAULT 0,
  `shipping_description` varchar(255) DEFAULT NULL,
  `shipping_guaranteed_days_to_delivery` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_group_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_discounts`
--

LOCK TABLES `offline_mall_discounts` WRITE;
/*!40000 ALTER TABLE `offline_mall_discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_image_sets`
--

DROP TABLE IF EXISTS `offline_mall_image_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_image_sets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `is_main_set` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_image_sets`
--

LOCK TABLES `offline_mall_image_sets` WRITE;
/*!40000 ALTER TABLE `offline_mall_image_sets` DISABLE KEYS */;
INSERT INTO `offline_mall_image_sets` VALUES (1,'Primo Prodotto',1,1,'2023-10-28 08:57:58','2023-10-28 08:57:58');
/*!40000 ALTER TABLE `offline_mall_image_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_index`
--

DROP TABLE IF EXISTS `offline_mall_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `index` varchar(255) NOT NULL,
  `name` varchar(191) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `stock` int(11) NOT NULL,
  `reviews_rating` decimal(3,2) NOT NULL,
  `sales_count` int(11) NOT NULL DEFAULT 0,
  `on_sale` tinyint(1) NOT NULL DEFAULT 0,
  `is_ghost` tinyint(1) NOT NULL DEFAULT 0,
  `category_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`category_id`)),
  `property_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`property_values`)),
  `sort_orders` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`sort_orders`)),
  `prices` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`prices`)),
  `parent_prices` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`parent_prices`)),
  `customer_group_prices` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`customer_group_prices`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_product_variant_index_is_ghost` (`product_id`,`variant_id`,`index`,`is_ghost`),
  KEY `idx_published_index` (`index`,`published`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_index`
--

LOCK TABLES `offline_mall_index` WRITE;
/*!40000 ALTER TABLE `offline_mall_index` DISABLE KEYS */;
INSERT INTO `offline_mall_index` VALUES (1,1,NULL,'products','Primo Prodotto','brand-01',1,999,0.00,0,0,0,'[1]','{\"4\":[\"xs\"]}','[]','{\"CHF\":900,\"EUR\":1026,\"USD\":900}','[]','[]','2023-10-28 08:57:58'),(2,1,NULL,'variants','Primo Prodotto','brand-01',1,999,0.00,0,0,1,'[1]','{\"4\":[\"xs\"]}','[]','{\"CHF\":900,\"EUR\":1026,\"USD\":900}','[]','[]','2023-10-28 08:57:58');
/*!40000 ALTER TABLE `offline_mall_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_notifications`
--

DROP TABLE IF EXISTS `offline_mall_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `template` varchar(255) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_notifications`
--

LOCK TABLES `offline_mall_notifications` WRITE;
/*!40000 ALTER TABLE `offline_mall_notifications` DISABLE KEYS */;
INSERT INTO `offline_mall_notifications` VALUES (1,1,'offline.mall::admin.checkout_succeeded','Admin notification: Checkout succeeded','Sent to the shop admin when a checkout succeeded','offline.mall::mail.admin.checkout_succeeded',1,'2023-10-28 07:01:30','2023-10-28 07:01:30'),(2,1,'offline.mall::admin.checkout_failed','Admin notification: Checkout failed','Sent to the shop admin when a checkout failed','offline.mall::mail.admin.checkout_failed',2,'2023-10-28 07:01:30','2023-10-28 07:01:30'),(3,1,'offline.mall::customer.created','Customer signed up','Sent when a customer has signed up','offline.mall::mail.customer.created',3,'2023-10-28 07:01:30','2023-10-28 07:01:30'),(4,1,'offline.mall::checkout.succeeded','Checkout succeeded','Sent when a checkout was successfull','offline.mall::mail.checkout.succeeded',4,'2023-10-28 07:01:30','2023-10-28 07:01:30'),(5,1,'offline.mall::checkout.failed','Checkout failed','Sent when a checkout has failed','offline.mall::mail.checkout.failed',5,'2023-10-28 07:01:30','2023-10-28 07:01:30'),(6,1,'offline.mall::order.shipped','Order shipped','Sent when the order has been marked as shipped','offline.mall::mail.order.shipped',6,'2023-10-28 07:01:30','2023-10-28 07:01:30'),(7,1,'offline.mall::order.state.changed','Order status changed','Sent when a order status was updated','offline.mall::mail.order.state_changed',7,'2023-10-28 07:01:30','2023-10-28 07:01:30'),(8,1,'offline.mall::payment.paid','Payment received','Sent when a payment has been received','offline.mall::mail.payment.paid',8,'2023-10-28 07:01:30','2023-10-28 07:01:30'),(9,1,'offline.mall::payment.failed','Payment failed','Sent when a payment has failed','offline.mall::mail.payment.failed',9,'2023-10-28 07:01:30','2023-10-28 07:01:30'),(10,1,'offline.mall::payment.refunded','Payment refunded','Sent when a payment has been refunded','offline.mall::mail.payment.refunded',10,'2023-10-28 07:01:30','2023-10-28 07:01:30'),(11,1,'offline.mall::product.file_download','Virutal product download links','Sent when a customer paid for an order with virtual products','offline.mall::mail.product.file_download',11,'2023-10-28 07:01:31','2023-10-28 07:01:31');
/*!40000 ALTER TABLE `offline_mall_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_order_products`
--

DROP TABLE IF EXISTS `offline_mall_order_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_order_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `variant_name` text DEFAULT NULL,
  `brand` text DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `is_virtual` tinyint(1) NOT NULL DEFAULT 0,
  `price_pre_taxes` int(11) NOT NULL,
  `price_taxes` int(11) NOT NULL,
  `price_post_taxes` int(11) NOT NULL,
  `total_pre_taxes` int(11) NOT NULL,
  `total_taxes` int(11) NOT NULL,
  `total_post_taxes` int(11) NOT NULL,
  `tax_factor` decimal(8,2) NOT NULL,
  `weight` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `total_weight` int(11) DEFAULT NULL,
  `stackable` tinyint(1) NOT NULL,
  `shippable` tinyint(1) NOT NULL,
  `property_values` mediumtext DEFAULT NULL,
  `properties_description` text DEFAULT NULL,
  `custom_field_values` longtext NOT NULL,
  `taxes` mediumtext NOT NULL,
  `item` mediumtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `service_options` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_order_products`
--

LOCK TABLES `offline_mall_order_products` WRITE;
/*!40000 ALTER TABLE `offline_mall_order_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_order_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_order_states`
--

DROP TABLE IF EXISTS `offline_mall_order_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_order_states` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `sort_order` int(10) unsigned DEFAULT NULL,
  `flag` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_order_states`
--

LOCK TABLES `offline_mall_order_states` WRITE;
/*!40000 ALTER TABLE `offline_mall_order_states` DISABLE KEYS */;
INSERT INTO `offline_mall_order_states` VALUES (1,'New',NULL,'#3498db',1,'NEW','2023-10-28 07:01:30','2023-10-28 07:01:30',NULL),(2,'In Progress',NULL,'#f1c40f',2,NULL,'2023-10-28 07:01:30','2023-10-28 07:01:30',NULL),(3,'Disputed',NULL,'#d30000',3,NULL,'2023-10-28 07:01:30','2023-10-28 07:01:30',NULL),(4,'Cancelled',NULL,'#5e667f',4,'CANCELLED','2023-10-28 07:01:30','2023-10-28 07:01:30',NULL),(5,'Complete',NULL,'#189e51',5,'COMPLETE','2023-10-28 07:01:30','2023-10-28 07:01:30',NULL);
/*!40000 ALTER TABLE `offline_mall_order_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_orders`
--

DROP TABLE IF EXISTS `offline_mall_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) DEFAULT NULL,
  `order_number` int(11) DEFAULT NULL,
  `invoice_number` varchar(255) DEFAULT NULL,
  `currency` mediumtext DEFAULT NULL,
  `payment_state` varchar(255) NOT NULL,
  `order_state_id` int(11) NOT NULL,
  `shipping_address_same_as_billing` tinyint(1) DEFAULT NULL,
  `billing_address` mediumtext DEFAULT NULL,
  `shipping_address` mediumtext DEFAULT NULL,
  `custom_fields` text DEFAULT NULL,
  `shipping` mediumtext DEFAULT NULL,
  `taxes` mediumtext DEFAULT NULL,
  `payment` mediumtext DEFAULT NULL,
  `discounts` text DEFAULT NULL,
  `payment_method_id` int(11) DEFAULT NULL,
  `payment_id` text DEFAULT NULL,
  `payment_hash` varchar(255) DEFAULT NULL,
  `total_shipping_pre_taxes` int(11) DEFAULT NULL,
  `total_shipping_taxes` int(11) DEFAULT NULL,
  `total_shipping_post_taxes` int(11) DEFAULT NULL,
  `total_payment_pre_taxes` int(11) DEFAULT NULL,
  `total_payment_taxes` int(11) DEFAULT NULL,
  `total_payment_post_taxes` int(11) DEFAULT NULL,
  `total_product_pre_taxes` int(11) DEFAULT NULL,
  `total_product_taxes` int(11) DEFAULT NULL,
  `total_product_post_taxes` int(11) DEFAULT NULL,
  `total_taxes` int(11) DEFAULT NULL,
  `total_pre_payment` int(11) DEFAULT NULL,
  `total_pre_taxes` int(11) DEFAULT NULL,
  `total_post_taxes` int(11) DEFAULT NULL,
  `is_virtual` tinyint(1) NOT NULL DEFAULT 0,
  `tracking_number` varchar(255) DEFAULT NULL,
  `tracking_url` varchar(255) DEFAULT NULL,
  `credit_card_last4_digits` varchar(4) DEFAULT NULL,
  `card_holder_name` varchar(255) DEFAULT NULL,
  `card_type` varchar(255) DEFAULT NULL,
  `lang` varchar(255) NOT NULL,
  `total_weight` int(11) DEFAULT NULL,
  `customer_notes` text DEFAULT NULL,
  `admin_notes` text DEFAULT NULL,
  `payment_transaction_id` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shipped_at` timestamp NULL DEFAULT NULL,
  `paid_at` date DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `customer_payment_method_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offline_mall_orders_order_number_unique` (`order_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_orders`
--

LOCK TABLES `offline_mall_orders` WRITE;
/*!40000 ALTER TABLE `offline_mall_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_payment_method_tax`
--

DROP TABLE IF EXISTS `offline_mall_payment_method_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_payment_method_tax` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_method_id` int(10) unsigned NOT NULL,
  `tax_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_payment_method_tax`
--

LOCK TABLES `offline_mall_payment_method_tax` WRITE;
/*!40000 ALTER TABLE `offline_mall_payment_method_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_payment_method_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_payment_methods`
--

DROP TABLE IF EXISTS `offline_mall_payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_payment_methods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `instructions` text DEFAULT NULL,
  `payment_provider` text NOT NULL,
  `sort_order` int(10) unsigned DEFAULT NULL,
  `fee_label` varchar(255) DEFAULT NULL,
  `fee_percentage` decimal(5,2) unsigned DEFAULT NULL,
  `pdf_partial` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_payment_methods`
--

LOCK TABLES `offline_mall_payment_methods` WRITE;
/*!40000 ALTER TABLE `offline_mall_payment_methods` DISABLE KEYS */;
INSERT INTO `offline_mall_payment_methods` VALUES (1,'Stripe','stripe',NULL,NULL,'stripe',1,NULL,NULL,NULL,'2023-10-28 07:01:30','2023-10-28 07:01:30',NULL),(2,'PayPal','paypal',NULL,NULL,'paypal-rest',2,NULL,NULL,NULL,'2023-10-28 07:01:30','2023-10-28 07:01:30',NULL),(3,'Invoice','invoice',NULL,NULL,'offline',3,NULL,NULL,NULL,'2023-10-28 07:01:30','2023-10-28 07:01:30',NULL);
/*!40000 ALTER TABLE `offline_mall_payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_payments_log`
--

DROP TABLE IF EXISTS `offline_mall_payments_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_payments_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(255) NOT NULL,
  `failed` tinyint(1) NOT NULL DEFAULT 1,
  `payment_method` mediumtext DEFAULT NULL,
  `payment_provider` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `data` mediumtext DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_data` longtext DEFAULT NULL,
  `message` text DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_payments_log`
--

LOCK TABLES `offline_mall_payments_log` WRITE;
/*!40000 ALTER TABLE `offline_mall_payments_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_payments_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_price_categories`
--

DROP TABLE IF EXISTS `offline_mall_price_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_price_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_price_categories`
--

LOCK TABLES `offline_mall_price_categories` WRITE;
/*!40000 ALTER TABLE `offline_mall_price_categories` DISABLE KEYS */;
INSERT INTO `offline_mall_price_categories` VALUES (1,'Old price','old_price',1,'2023-10-28 07:01:30','2023-10-28 07:01:30');
/*!40000 ALTER TABLE `offline_mall_price_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_prices`
--

DROP TABLE IF EXISTS `offline_mall_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_prices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `currency_id` int(10) unsigned NOT NULL,
  `priceable_id` int(10) unsigned NOT NULL,
  `priceable_type` varchar(255) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `price_category_id` int(10) unsigned DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_price` (`price_category_id`,`priceable_id`,`priceable_type`,`currency_id`,`field`),
  KEY `idx_price_priceable` (`priceable_id`,`priceable_type`),
  KEY `idx_price_currency` (`currency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_prices`
--

LOCK TABLES `offline_mall_prices` WRITE;
/*!40000 ALTER TABLE `offline_mall_prices` DISABLE KEYS */;
INSERT INTO `offline_mall_prices` VALUES (2,2,1,'mall.shipping_method',1200,NULL,NULL,'2023-10-28 07:01:30','2023-10-28 07:01:30');
/*!40000 ALTER TABLE `offline_mall_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_product_accessory`
--

DROP TABLE IF EXISTS `offline_mall_product_accessory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_product_accessory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `accessory_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_product_accessory`
--

LOCK TABLES `offline_mall_product_accessory` WRITE;
/*!40000 ALTER TABLE `offline_mall_product_accessory` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_product_accessory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_product_custom_field`
--

DROP TABLE IF EXISTS `offline_mall_product_custom_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_product_custom_field` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `custom_field_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_product_custom_field`
--

LOCK TABLES `offline_mall_product_custom_field` WRITE;
/*!40000 ALTER TABLE `offline_mall_product_custom_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_product_custom_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_product_file_grants`
--

DROP TABLE IF EXISTS `offline_mall_product_file_grants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_product_file_grants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_product_id` int(10) unsigned NOT NULL,
  `download_count` int(10) unsigned NOT NULL DEFAULT 0,
  `max_download_count` int(10) unsigned DEFAULT NULL,
  `download_key` varchar(64) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_product_file_grants`
--

LOCK TABLES `offline_mall_product_file_grants` WRITE;
/*!40000 ALTER TABLE `offline_mall_product_file_grants` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_product_file_grants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_product_files`
--

DROP TABLE IF EXISTS `offline_mall_product_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_product_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `version` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `download_count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_product_files`
--

LOCK TABLES `offline_mall_product_files` WRITE;
/*!40000 ALTER TABLE `offline_mall_product_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_product_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_product_prices`
--

DROP TABLE IF EXISTS `offline_mall_product_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_product_prices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `price` int(11) DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `variant_id` int(10) unsigned DEFAULT NULL,
  `currency_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_price_unique_price` (`product_id`,`currency_id`,`variant_id`),
  KEY `idx_product_price_product` (`product_id`),
  KEY `idx_product_price_variant` (`variant_id`),
  KEY `idx_product_price_currency` (`currency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_product_prices`
--

LOCK TABLES `offline_mall_product_prices` WRITE;
/*!40000 ALTER TABLE `offline_mall_product_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_product_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_product_service`
--

DROP TABLE IF EXISTS `offline_mall_product_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_product_service` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offline_mall_product_service_service_id_product_id_unique` (`service_id`,`product_id`),
  KEY `offline_mall_product_service_service_id_product_id_index` (`service_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_product_service`
--

LOCK TABLES `offline_mall_product_service` WRITE;
/*!40000 ALTER TABLE `offline_mall_product_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_product_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_product_tax`
--

DROP TABLE IF EXISTS `offline_mall_product_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_product_tax` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tax_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offline_mall_product_tax_tax_id_product_id_unique` (`tax_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_product_tax`
--

LOCK TABLES `offline_mall_product_tax` WRITE;
/*!40000 ALTER TABLE `offline_mall_product_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_product_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_product_variants`
--

DROP TABLE IF EXISTS `offline_mall_product_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_product_variants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `user_defined_id` varchar(255) DEFAULT NULL,
  `image_set_id` int(10) unsigned DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `reviews_rating` decimal(3,2) NOT NULL DEFAULT 0.00,
  `name` varchar(255) DEFAULT NULL,
  `weight` int(10) unsigned DEFAULT NULL,
  `length` int(10) unsigned DEFAULT NULL,
  `width` int(10) unsigned DEFAULT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 1,
  `sales_count` int(10) unsigned NOT NULL DEFAULT 0,
  `allow_out_of_stock_purchases` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `mpn` varchar(255) DEFAULT NULL,
  `gtin` varchar(255) DEFAULT NULL,
  `description_short` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_product_variant_product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_product_variants`
--

LOCK TABLES `offline_mall_product_variants` WRITE;
/*!40000 ALTER TABLE `offline_mall_product_variants` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_product_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_products`
--

DROP TABLE IF EXISTS `offline_mall_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) DEFAULT NULL,
  `user_defined_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description_short` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `additional_descriptions` longtext DEFAULT NULL,
  `additional_properties` text DEFAULT NULL,
  `weight` int(10) unsigned DEFAULT NULL,
  `length` int(10) unsigned DEFAULT NULL,
  `width` int(10) unsigned DEFAULT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  `quantity_default` int(10) unsigned DEFAULT NULL,
  `quantity_min` int(10) unsigned DEFAULT NULL,
  `quantity_max` int(10) unsigned DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `reviews_rating` decimal(3,2) NOT NULL DEFAULT 0.00,
  `links` text DEFAULT NULL,
  `inventory_management_method` varchar(255) NOT NULL DEFAULT 'single',
  `allow_out_of_stock_purchases` tinyint(1) NOT NULL DEFAULT 0,
  `stackable` tinyint(1) NOT NULL DEFAULT 1,
  `shippable` tinyint(1) NOT NULL DEFAULT 1,
  `price_includes_tax` tinyint(1) NOT NULL DEFAULT 1,
  `group_by_property_id` int(11) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `sales_count` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `mpn` varchar(255) DEFAULT NULL,
  `gtin` varchar(255) DEFAULT NULL,
  `embeds` text DEFAULT NULL,
  `is_virtual` tinyint(1) NOT NULL DEFAULT 0,
  `file_expires_after_days` int(10) unsigned DEFAULT NULL,
  `file_max_download_count` int(10) unsigned DEFAULT NULL,
  `file_session_required` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_product_deleted_at` (`deleted_at`),
  KEY `idx_product_slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_products`
--

LOCK TABLES `offline_mall_products` WRITE;
/*!40000 ALTER TABLE `offline_mall_products` DISABLE KEYS */;
INSERT INTO `offline_mall_products` VALUES (1,1,'001','Primo Prodotto','primo-prodotto','Inserire Descrizione','<p>Nuova Descrizione</p>','Primo Prodotto','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,999,0.00,NULL,'single',1,1,1,1,NULL,1,0,'2023-10-28 08:57:58','2023-10-28 08:59:49',NULL,'','',NULL,0,NULL,NULL,0);
/*!40000 ALTER TABLE `offline_mall_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_properties`
--

DROP TABLE IF EXISTS `offline_mall_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_properties` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `options` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offline_mall_properties_slug_unique` (`slug`),
  KEY `idx_property_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_properties`
--

LOCK TABLES `offline_mall_properties` WRITE;
/*!40000 ALTER TABLE `offline_mall_properties` DISABLE KEYS */;
INSERT INTO `offline_mall_properties` VALUES (1,'Height','height','text','mm',NULL,'2023-10-28 07:01:30','2023-10-28 07:01:30',NULL),(2,'Width','width','text','mm',NULL,'2023-10-28 07:01:30','2023-10-28 07:01:30',NULL),(3,'Depth','depth','text','mm',NULL,'2023-10-28 07:01:30','2023-10-28 07:01:30',NULL),(4,'Size','size','dropdown',NULL,'[{\"value\":\"XS\"},{\"value\":\"S\"},{\"value\":\"M\"},{\"value\":\"L\"},{\"value\":\"XL\"}]','2023-10-28 07:01:30','2023-10-28 07:01:30',NULL);
/*!40000 ALTER TABLE `offline_mall_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_property_groups`
--

DROP TABLE IF EXISTS `offline_mall_property_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_property_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_property_groups`
--

LOCK TABLES `offline_mall_property_groups` WRITE;
/*!40000 ALTER TABLE `offline_mall_property_groups` DISABLE KEYS */;
INSERT INTO `offline_mall_property_groups` VALUES (1,'Dimensions',NULL,NULL,'dimensions',1,'2023-10-28 07:01:30','2023-10-28 07:01:30'),(2,'Size',NULL,NULL,'size',2,'2023-10-28 07:01:30','2023-10-28 07:01:30');
/*!40000 ALTER TABLE `offline_mall_property_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_property_property_group`
--

DROP TABLE IF EXISTS `offline_mall_property_property_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_property_property_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `property_id` int(10) unsigned NOT NULL,
  `property_group_id` int(10) unsigned NOT NULL,
  `use_for_variants` tinyint(1) NOT NULL DEFAULT 0,
  `filter_type` varchar(255) DEFAULT NULL,
  `sort_order` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_property_property_group`
--

LOCK TABLES `offline_mall_property_property_group` WRITE;
/*!40000 ALTER TABLE `offline_mall_property_property_group` DISABLE KEYS */;
INSERT INTO `offline_mall_property_property_group` VALUES (1,1,1,0,NULL,NULL,NULL,NULL),(2,2,1,0,NULL,NULL,NULL,NULL),(3,3,1,0,NULL,NULL,NULL,NULL),(4,4,2,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `offline_mall_property_property_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_property_values`
--

DROP TABLE IF EXISTS `offline_mall_property_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_property_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `variant_id` int(10) unsigned DEFAULT NULL,
  `property_id` int(11) NOT NULL,
  `value` text DEFAULT NULL,
  `index_value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_property_value_value` (`value`(191)),
  KEY `idx_property_value_index_value` (`index_value`(191)),
  KEY `idx_property_value_product_variant` (`product_id`,`variant_id`),
  KEY `idx_property_value_product` (`product_id`),
  KEY `idx_property_value_variant` (`variant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_property_values`
--

LOCK TABLES `offline_mall_property_values` WRITE;
/*!40000 ALTER TABLE `offline_mall_property_values` DISABLE KEYS */;
INSERT INTO `offline_mall_property_values` VALUES (1,1,NULL,4,'XS','xs','2023-10-28 08:59:00','2023-10-28 08:59:00');
/*!40000 ALTER TABLE `offline_mall_property_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_review_categories`
--

DROP TABLE IF EXISTS `offline_mall_review_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_review_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_review_categories`
--

LOCK TABLES `offline_mall_review_categories` WRITE;
/*!40000 ALTER TABLE `offline_mall_review_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_review_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_reviews`
--

DROP TABLE IF EXISTS `offline_mall_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `rating` tinyint(4) NOT NULL,
  `user_hash` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `pros` text DEFAULT NULL,
  `cons` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `offline_mall_reviews_product_id_index` (`product_id`),
  KEY `offline_mall_reviews_variant_id_index` (`variant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_reviews`
--

LOCK TABLES `offline_mall_reviews` WRITE;
/*!40000 ALTER TABLE `offline_mall_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_service_options`
--

DROP TABLE IF EXISTS `offline_mall_service_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_service_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `offline_mall_service_options_service_id_index` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_service_options`
--

LOCK TABLES `offline_mall_service_options` WRITE;
/*!40000 ALTER TABLE `offline_mall_service_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_service_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_service_tax`
--

DROP TABLE IF EXISTS `offline_mall_service_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_service_tax` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tax_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offline_mall_service_tax_service_id_tax_id_unique` (`service_id`,`tax_id`),
  KEY `offline_mall_service_tax_service_id_tax_id_index` (`service_id`,`tax_id`),
  KEY `offline_mall_service_tax_tax_id_index` (`tax_id`),
  KEY `offline_mall_service_tax_service_id_index` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_service_tax`
--

LOCK TABLES `offline_mall_service_tax` WRITE;
/*!40000 ALTER TABLE `offline_mall_service_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_service_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_services`
--

DROP TABLE IF EXISTS `offline_mall_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_services`
--

LOCK TABLES `offline_mall_services` WRITE;
/*!40000 ALTER TABLE `offline_mall_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_shipping_countries`
--

DROP TABLE IF EXISTS `offline_mall_shipping_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_shipping_countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shipping_method_id` int(10) unsigned NOT NULL,
  `country_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_shipping_countries`
--

LOCK TABLES `offline_mall_shipping_countries` WRITE;
/*!40000 ALTER TABLE `offline_mall_shipping_countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_shipping_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_shipping_method_discount`
--

DROP TABLE IF EXISTS `offline_mall_shipping_method_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_shipping_method_discount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shipping_method_id` int(10) unsigned NOT NULL,
  `discount_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_shipping_method_discount`
--

LOCK TABLES `offline_mall_shipping_method_discount` WRITE;
/*!40000 ALTER TABLE `offline_mall_shipping_method_discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_shipping_method_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_shipping_method_rates`
--

DROP TABLE IF EXISTS `offline_mall_shipping_method_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_shipping_method_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shipping_method_id` int(10) unsigned NOT NULL,
  `from_weight` int(10) unsigned NOT NULL DEFAULT 0,
  `to_weight` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_shipping_method_rates`
--

LOCK TABLES `offline_mall_shipping_method_rates` WRITE;
/*!40000 ALTER TABLE `offline_mall_shipping_method_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_shipping_method_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_shipping_method_tax`
--

DROP TABLE IF EXISTS `offline_mall_shipping_method_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_shipping_method_tax` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shipping_method_id` int(10) unsigned NOT NULL,
  `tax_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_shipping_method_tax`
--

LOCK TABLES `offline_mall_shipping_method_tax` WRITE;
/*!40000 ALTER TABLE `offline_mall_shipping_method_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_shipping_method_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_shipping_methods`
--

DROP TABLE IF EXISTS `offline_mall_shipping_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_shipping_methods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `sort_order` int(10) unsigned DEFAULT NULL,
  `guaranteed_delivery_days` int(11) DEFAULT NULL,
  `price_includes_tax` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_shipping_methods`
--

LOCK TABLES `offline_mall_shipping_methods` WRITE;
/*!40000 ALTER TABLE `offline_mall_shipping_methods` DISABLE KEYS */;
INSERT INTO `offline_mall_shipping_methods` VALUES (1,'Default',NULL,1,NULL,1,'2023-10-28 07:01:30','2023-10-28 07:01:30');
/*!40000 ALTER TABLE `offline_mall_shipping_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_taxes`
--

DROP TABLE IF EXISTS `offline_mall_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_taxes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `percentage` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_taxes`
--

LOCK TABLES `offline_mall_taxes` WRITE;
/*!40000 ALTER TABLE `offline_mall_taxes` DISABLE KEYS */;
INSERT INTO `offline_mall_taxes` VALUES (1,'Default',22.00,'2023-10-28 07:01:30','2023-10-28 09:05:44',1);
/*!40000 ALTER TABLE `offline_mall_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_wishlist_items`
--

DROP TABLE IF EXISTS `offline_mall_wishlist_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_wishlist_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wishlist_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `offline_mall_wishlist_items_wishlist_id_index` (`wishlist_id`),
  KEY `offline_mall_wishlist_items_product_id_index` (`product_id`),
  KEY `offline_mall_wishlist_items_variant_id_index` (`variant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_wishlist_items`
--

LOCK TABLES `offline_mall_wishlist_items` WRITE;
/*!40000 ALTER TABLE `offline_mall_wishlist_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_wishlist_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_mall_wishlists`
--

DROP TABLE IF EXISTS `offline_mall_wishlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_mall_wishlists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shipping_method_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `offline_mall_wishlists_session_id_index` (`session_id`),
  KEY `offline_mall_wishlists_customer_id_index` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_mall_wishlists`
--

LOCK TABLES `offline_mall_wishlists` WRITE;
/*!40000 ALTER TABLE `offline_mall_wishlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_mall_wishlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_sitesearch_query_logs`
--

DROP TABLE IF EXISTS `offline_sitesearch_query_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_sitesearch_query_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `query` text NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `useragent` varchar(255) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_sitesearch_query_logs`
--

LOCK TABLES `offline_sitesearch_query_logs` WRITE;
/*!40000 ALTER TABLE `offline_sitesearch_query_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_sitesearch_query_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_location_countries`
--

DROP TABLE IF EXISTS `rainlab_location_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainlab_location_countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `is_pinned` tinyint(1) NOT NULL DEFAULT 0,
  `calling_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rainlab_location_countries_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_location_countries`
--

LOCK TABLES `rainlab_location_countries` WRITE;
/*!40000 ALTER TABLE `rainlab_location_countries` DISABLE KEYS */;
INSERT INTO `rainlab_location_countries` VALUES (1,1,'Australia','AU',1,'61'),(2,1,'Canada','CA',1,'1'),(3,1,'United Kingdom','GB',1,'44'),(4,1,'United States','US',1,'1'),(5,0,'Afghanistan','AF',0,'93'),(6,0,'Aland Islands ','AX',0,'358'),(7,0,'Albania','AL',0,'355'),(8,0,'Algeria','DZ',0,'213'),(9,0,'American Samoa','AS',0,'1684'),(10,0,'Andorra','AD',0,'376'),(11,0,'Angola','AO',0,'244'),(12,0,'Anguilla','AI',0,'1264'),(13,0,'Antarctica','AQ',0,'672'),(14,0,'Antigua and Barbuda','AG',0,'1268'),(15,0,'Argentina','AR',0,'54'),(16,0,'Armenia','AM',0,'374'),(17,0,'Aruba','AW',0,'297'),(18,0,'Austria','AT',0,'43'),(19,0,'Azerbaijan','AZ',0,'994'),(20,0,'Bahamas','BS',0,'1242'),(21,0,'Bahrain','BH',0,'973'),(22,0,'Bangladesh','BD',0,'880'),(23,0,'Barbados','BB',0,'1246'),(24,0,'Belarus','BY',0,'375'),(25,0,'Belgium','BE',0,'32'),(26,0,'Belize','BZ',0,'501'),(27,0,'Benin','BJ',0,'229'),(28,0,'Bermuda','BM',0,'1441'),(29,0,'Bhutan','BT',0,'975'),(30,0,'Bolivia, Plurinational State of','BO',0,'591'),(31,0,'Bonaire, Sint Eustatius and Saba','BQ',0,'599'),(32,0,'Bosnia and Herzegovina','BA',0,'387'),(33,0,'Botswana','BW',0,'267'),(34,0,'Bouvet Island','BV',0,'55'),(35,0,'Brazil','BR',0,'55'),(36,0,'British Indian Ocean Territory','IO',0,'246'),(37,0,'Brunei Darussalam','BN',0,'673'),(38,0,'Bulgaria','BG',0,'359'),(39,0,'Burkina Faso','BF',0,'226'),(40,0,'Burundi','BI',0,'257'),(41,0,'Cambodia','KH',0,'855'),(42,0,'Cameroon','CM',0,'237'),(43,0,'Cape Verde','CV',0,'238'),(44,0,'Cayman Islands','KY',0,'1345'),(45,0,'Central African Republic','CF',0,'236'),(46,0,'Chad','TD',0,'235'),(47,0,'Chile','CL',0,'56'),(48,0,'China','CN',0,'86'),(49,0,'Christmas Island','CX',0,'61'),(50,0,'Cocos (Keeling) Islands','CC',0,'61'),(51,0,'Colombia','CO',0,'57'),(52,0,'Comoros','KM',0,'269'),(53,0,'Congo','CG',0,'242'),(54,0,'Congo, the Democratic Republic of the','CD',0,'243'),(55,0,'Cook Islands','CK',0,'682'),(56,0,'Costa Rica','CR',0,'506'),(57,0,'Cote d\'Ivoire','CI',0,'225'),(58,0,'Croatia','HR',0,'385'),(59,0,'Cuba','CU',0,'53'),(60,0,'Curaçao','CW',0,'599'),(61,0,'Cyprus','CY',0,'357'),(62,0,'Czech Republic','CZ',0,'420'),(63,0,'Denmark','DK',0,'45'),(64,0,'Djibouti','DJ',0,'253'),(65,0,'Dominica','DM',0,'1767'),(66,0,'Dominican Republic','DO',0,'1809'),(67,0,'Ecuador','EC',0,'593'),(68,0,'Egypt','EG',0,'20'),(69,0,'El Salvador','SV',0,'503'),(70,0,'Equatorial Guinea','GQ',0,'240'),(71,0,'Eritrea','ER',0,'291'),(72,0,'Estonia','EE',0,'372'),(73,0,'Ethiopia','ET',0,'251'),(74,0,'Falkland Islands (Malvinas)','FK',0,'500'),(75,0,'Faroe Islands','FO',0,'298'),(76,0,'Finland','FI',0,'358'),(77,0,'Fiji','FJ',0,'679'),(78,1,'France','FR',0,'33'),(79,0,'French Guiana','GF',0,'594'),(80,0,'French Polynesia','PF',0,'689'),(81,0,'French Southern Territories','TF',0,'262'),(82,0,'Gabon','GA',0,'241'),(83,0,'Gambia','GM',0,'220'),(84,0,'Georgia','GE',0,'995'),(85,0,'Germany','DE',0,'49'),(86,0,'Ghana','GH',0,'233'),(87,0,'Gibraltar','GI',0,'350'),(88,0,'Greece','GR',0,'30'),(89,0,'Greenland','GL',0,'299'),(90,0,'Grenada','GD',0,'1473'),(91,0,'Guadeloupe','GP',0,'590'),(92,0,'Guam','GU',0,'1671'),(93,0,'Guatemala','GT',0,'502'),(94,0,'Guernsey','GG',0,'44'),(95,0,'Guinea','GN',0,'224'),(96,0,'Guinea-Bissau','GW',0,'245'),(97,0,'Guyana','GY',0,'592'),(98,0,'Haiti','HT',0,'509'),(99,0,'Heard Island and McDonald Islands','HM',0,'672'),(100,0,'Holy See (Vatican City State)','VA',0,'39'),(101,0,'Honduras','HN',0,'504'),(102,0,'Hong Kong','HK',0,'852'),(103,1,'Hungary','HU',0,'36'),(104,0,'Iceland','IS',0,'354'),(105,1,'India','IN',0,'91'),(106,0,'Indonesia','ID',0,'62'),(107,0,'Iran, Islamic Republic of','IR',0,'98'),(108,0,'Iraq','IQ',0,'964'),(109,1,'Ireland','IE',0,'353'),(110,0,'Isle of Man','IM',0,'44'),(111,0,'Israel','IL',0,'972'),(112,0,'Italy','IT',0,'39'),(113,0,'Jamaica','JM',0,'1876'),(114,0,'Japan','JP',0,'81'),(115,0,'Jersey','JE',0,'44'),(116,0,'Jordan','JO',0,'962'),(117,0,'Kazakhstan','KZ',0,'7'),(118,0,'Kenya','KE',0,'254'),(119,0,'Kiribati','KI',0,'686'),(120,0,'Korea, Democratic People\'s Republic of','KP',0,'850'),(121,0,'Korea, Republic of','KR',0,'82'),(122,0,'Kuwait','KW',0,'965'),(123,0,'Kyrgyzstan','KG',0,'996'),(124,0,'Lao People\'s Democratic Republic','LA',0,'856'),(125,0,'Latvia','LV',0,'371'),(126,0,'Lebanon','LB',0,'961'),(127,0,'Lesotho','LS',0,'266'),(128,0,'Liberia','LR',0,'231'),(129,0,'Libyan Arab Jamahiriya','LY',0,'218'),(130,0,'Liechtenstein','LI',0,'423'),(131,0,'Lithuania','LT',0,'370'),(132,0,'Luxembourg','LU',0,'352'),(133,0,'Macao','MO',0,'853'),(134,0,'North Macedonia','MK',0,'389'),(135,0,'Madagascar','MG',0,'261'),(136,0,'Malawi','MW',0,'265'),(137,0,'Malaysia','MY',0,'60'),(138,0,'Maldives','MV',0,'960'),(139,0,'Mali','ML',0,'223'),(140,0,'Malta','MT',0,'356'),(141,0,'Marshall Islands','MH',0,'692'),(142,0,'Martinique','MQ',0,'596'),(143,0,'Mauritania','MR',0,'222'),(144,0,'Mauritius','MU',0,'230'),(145,0,'Mayotte','YT',0,'262'),(146,0,'Mexico','MX',0,'52'),(147,0,'Micronesia, Federated States of','FM',0,'691'),(148,0,'Moldova, Republic of','MD',0,'373'),(149,0,'Monaco','MC',0,'377'),(150,0,'Mongolia','MN',0,'976'),(151,0,'Montenegro','ME',0,'382'),(152,0,'Montserrat','MS',0,'1664'),(153,0,'Morocco','MA',0,'212'),(154,0,'Mozambique','MZ',0,'258'),(155,0,'Myanmar','MM',0,'95'),(156,0,'Namibia','NA',0,'264'),(157,0,'Nauru','NR',0,'674'),(158,0,'Nepal','NP',0,'977'),(159,1,'Netherlands','NL',0,'31'),(160,0,'New Caledonia','NC',0,'687'),(161,1,'New Zealand','NZ',0,'64'),(162,0,'Nicaragua','NI',0,'505'),(163,0,'Niger','NE',0,'227'),(164,0,'Nigeria','NG',0,'234'),(165,0,'Niue','NU',0,'683'),(166,0,'Norfolk Island','NF',0,'672'),(167,0,'Northern Mariana Islands','MP',0,'1670'),(168,0,'Norway','NO',0,'47'),(169,0,'Oman','OM',0,'968'),(170,0,'Pakistan','PK',0,'92'),(171,0,'Palau','PW',0,'680'),(172,0,'Palestine','PS',0,'970'),(173,0,'Panama','PA',0,'507'),(174,0,'Papua New Guinea','PG',0,'675'),(175,0,'Paraguay','PY',0,'595'),(176,0,'Peru','PE',0,'51'),(177,0,'Philippines','PH',0,'63'),(178,0,'Pitcairn','PN',0,'870'),(179,0,'Poland','PL',0,'48'),(180,0,'Portugal','PT',0,'351'),(181,0,'Puerto Rico','PR',0,'1'),(182,0,'Qatar','QA',0,'974'),(183,0,'Reunion','RE',0,'262'),(184,1,'Romania','RO',0,'40'),(185,0,'Russian Federation','RU',0,'7'),(186,0,'Rwanda','RW',0,'250'),(187,0,'Saint Barthélemy','BL',0,'590'),(188,0,'Saint Helena','SH',0,'290'),(189,0,'Saint Kitts and Nevis','KN',0,'1869'),(190,0,'Saint Lucia','LC',0,'1758'),(191,0,'Saint Martin (French part)','MF',0,'1599'),(192,0,'Saint Pierre and Miquelon','PM',0,'508'),(193,0,'Saint Vincent and the Grenadines','VC',0,'1784'),(194,0,'Samoa','WS',0,'685'),(195,0,'San Marino','SM',0,'378'),(196,0,'Sao Tome and Principe','ST',0,'239'),(197,0,'Saudi Arabia','SA',0,'966'),(198,0,'Senegal','SN',0,'221'),(199,0,'Serbia','RS',0,'381'),(200,0,'Seychelles','SC',0,'248'),(201,0,'Sierra Leone','SL',0,'232'),(202,0,'Singapore','SG',0,'65'),(203,0,'Sint Maarten (Dutch part)','SX',0,'599'),(204,0,'Slovakia','SK',0,'421'),(205,0,'Slovenia','SI',0,'386'),(206,0,'Solomon Islands','SB',0,'677'),(207,0,'Somalia','SO',0,'252'),(208,0,'South Africa','ZA',0,'27'),(209,0,'South Georgia and the South Sandwich Islands','GS',0,'500'),(210,1,'Spain','ES',0,'34'),(211,0,'Sri Lanka','LK',0,'94'),(212,0,'Sudan','SD',0,'249'),(213,0,'Suriname','SR',0,'597'),(214,0,'Svalbard and Jan Mayen','SJ',0,'47'),(215,0,'Swaziland','SZ',0,'268'),(216,0,'Sweden','SE',0,'46'),(217,0,'Switzerland','CH',0,'41'),(218,0,'Syrian Arab Republic','SY',0,'963'),(219,0,'Taiwan, Province of China','TW',0,'886'),(220,0,'Tajikistan','TJ',0,'992'),(221,0,'Tanzania, United Republic of','TZ',0,'255'),(222,0,'Thailand','TH',0,'66'),(223,0,'Timor-Leste','TL',0,'670'),(224,0,'Togo','TG',0,'228'),(225,0,'Tokelau','TK',0,'690'),(226,0,'Tonga','TO',0,'676'),(227,0,'Trinidad and Tobago','TT',0,'1868'),(228,0,'Tunisia','TN',0,'216'),(229,0,'Turkey','TR',0,'90'),(230,0,'Turkmenistan','TM',0,'993'),(231,0,'Turks and Caicos Islands','TC',0,'1649'),(232,0,'Tuvalu','TV',0,'688'),(233,0,'Uganda','UG',0,'256'),(234,0,'Ukraine','UA',0,'380'),(235,0,'United Arab Emirates','AE',0,'971'),(236,0,'United States Minor Outlying Islands','UM',0,'246'),(237,0,'Uruguay','UY',0,'598'),(238,0,'Uzbekistan','UZ',0,'998'),(239,0,'Vanuatu','VU',0,'678'),(240,0,'Venezuela, Bolivarian Republic of','VE',0,'58'),(241,0,'Viet Nam','VN',0,'84'),(242,0,'Virgin Islands, British','VG',0,'1284'),(243,0,'Virgin Islands, U.S.','VI',0,'1340'),(244,0,'Wallis and Futuna','WF',0,'681'),(245,0,'Western Sahara','EH',0,'212'),(246,0,'Yemen','YE',0,'967'),(247,0,'Zambia','ZM',0,'260'),(248,0,'Zimbabwe','ZW',0,'263');
/*!40000 ALTER TABLE `rainlab_location_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_location_states`
--

DROP TABLE IF EXISTS `rainlab_location_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainlab_location_states` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(10) unsigned DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rainlab_location_states_country_id_index` (`country_id`),
  KEY `rainlab_location_states_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=749 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_location_states`
--

LOCK TABLES `rainlab_location_states` WRITE;
/*!40000 ALTER TABLE `rainlab_location_states` DISABLE KEYS */;
INSERT INTO `rainlab_location_states` VALUES (1,4,1,'Alabama','AL'),(2,4,1,'Alaska','AK'),(3,4,1,'American Samoa','AS'),(4,4,1,'Arizona','AZ'),(5,4,1,'Arkansas','AR'),(6,4,1,'California','CA'),(7,4,1,'Colorado','CO'),(8,4,1,'Connecticut','CT'),(9,4,1,'Delaware','DE'),(10,4,1,'Dist. of Columbia','DC'),(11,4,1,'Florida','FL'),(12,4,1,'Georgia','GA'),(13,4,1,'Guam','GU'),(14,4,1,'Hawaii','HI'),(15,4,1,'Idaho','ID'),(16,4,1,'Illinois','IL'),(17,4,1,'Indiana','IN'),(18,4,1,'Iowa','IA'),(19,4,1,'Kansas','KS'),(20,4,1,'Kentucky','KY'),(21,4,1,'Louisiana','LA'),(22,4,1,'Maine','ME'),(23,4,1,'Maryland','MD'),(24,4,1,'Marshall Islands','MH'),(25,4,1,'Massachusetts','MA'),(26,4,1,'Michigan','MI'),(27,4,1,'Micronesia','FM'),(28,4,1,'Minnesota','MN'),(29,4,1,'Mississippi','MS'),(30,4,1,'Missouri','MO'),(31,4,1,'Montana','MT'),(32,4,1,'Nebraska','NE'),(33,4,1,'Nevada','NV'),(34,4,1,'New Hampshire','NH'),(35,4,1,'New Jersey','NJ'),(36,4,1,'New Mexico','NM'),(37,4,1,'New York','NY'),(38,4,1,'North Carolina','NC'),(39,4,1,'North Dakota','ND'),(40,4,1,'Northern Marianas','MP'),(41,4,1,'Ohio','OH'),(42,4,1,'Oklahoma','OK'),(43,4,1,'Oregon','OR'),(44,4,1,'Palau','PW'),(45,4,1,'Pennsylvania','PA'),(46,4,1,'Puerto Rico','PR'),(47,4,1,'Rhode Island','RI'),(48,4,1,'South Carolina','SC'),(49,4,1,'South Dakota','SD'),(50,4,1,'Tennessee','TN'),(51,4,1,'Texas','TX'),(52,4,1,'Utah','UT'),(53,4,1,'Vermont','VT'),(54,4,1,'Virginia','VA'),(55,4,1,'Virgin Islands','VI'),(56,4,1,'Washington','WA'),(57,4,1,'West Virginia','WV'),(58,4,1,'Wisconsin','WI'),(59,4,1,'Wyoming','WY'),(60,35,1,'Acre','AC'),(61,35,1,'Alagoas','AL'),(62,35,1,'Amapá','AP'),(63,35,1,'Amazonas','AM'),(64,35,1,'Bahia','BA'),(65,35,1,'Ceará','CE'),(66,35,1,'Distrito Federal','DF'),(67,35,1,'Espírito Santo','ES'),(68,35,1,'Goiás','GO'),(69,35,1,'Maranhão','MA'),(70,35,1,'Mato Grosso','MT'),(71,35,1,'Mato Grosso do Sul','MS'),(72,35,1,'Minas Gerais','MG'),(73,35,1,'Pará','PA'),(74,35,1,'Paraíba','PB'),(75,35,1,'Paraná','PR'),(76,35,1,'Pernambuco','PE'),(77,35,1,'Piauí','PI'),(78,35,1,'Rio de Janeiro','RJ'),(79,35,1,'Rio Grande do Norte','RN'),(80,35,1,'Rio Grande do Sul','RS'),(81,35,1,'Rondônia','RO'),(82,35,1,'Roraima','RR'),(83,35,1,'Santa Catarina','SC'),(84,35,1,'São Paulo','SP'),(85,35,1,'Sergipe','SE'),(86,35,1,'Tocantins','TO'),(87,2,1,'Alberta','AB'),(88,2,1,'British Columbia','BC'),(89,2,1,'Manitoba','MB'),(90,2,1,'New Brunswick','NB'),(91,2,1,'Newfoundland and Labrador','NL'),(92,2,1,'Northwest Territories','NT'),(93,2,1,'Nova Scotia','NS'),(94,2,1,'Nunavut','NU'),(95,2,1,'Ontario','ON'),(96,2,1,'Prince Edward Island','PE'),(97,2,1,'Quebec','QC'),(98,2,1,'Saskatchewan','SK'),(99,2,1,'Yukon','YT'),(100,217,1,'Aargau','AG'),(101,217,1,'Appenzell Innerrhoden','AI'),(102,217,1,'Appenzell Ausserrhoden','AR'),(103,217,1,'Bern','BE'),(104,217,1,'Basel-Landschaft','BL'),(105,217,1,'Basel-Stadt','BS'),(106,217,1,'Fribourg','FR'),(107,217,1,'Genève','GE'),(108,217,1,'Glarus','GL'),(109,217,1,'Graubünden','GR'),(110,217,1,'Jura','JU'),(111,217,1,'Luzern','LU'),(112,217,1,'Neuchâtel','NE'),(113,217,1,'Nidwalden','NW'),(114,217,1,'Obwalden','OW'),(115,217,1,'St. Gallen','SG'),(116,217,1,'Solothurn','SO'),(117,217,1,'Schwyz','SZ'),(118,217,1,'Thurgau','TG'),(119,217,1,'Ticino','TI'),(120,217,1,'Uri','UR'),(121,217,1,'Vaud','VD'),(122,217,1,'Valais','VS'),(123,217,1,'Zug','ZG'),(124,217,1,'Zürich','ZH'),(125,1,1,'New South Wales','NSW'),(126,1,1,'Queensland','QLD'),(127,1,1,'South Australia','SA'),(128,1,1,'Tasmania','TAS'),(129,1,1,'Victoria','VIC'),(130,1,1,'Western Australia','WA'),(131,1,1,'Northern Territory','NT'),(132,1,1,'Australian Capital Territory','ACT'),(133,85,1,'Baden-Württemberg','BW'),(134,85,1,'Bayern','BY'),(135,85,1,'Berlin','BE'),(136,85,1,'Brandenburg','BB'),(137,85,1,'Bremen','HB'),(138,85,1,'Hamburg','HH'),(139,85,1,'Hessen','HE'),(140,85,1,'Mecklenburg-Vorpommern','MV'),(141,85,1,'Niedersachsen','NI'),(142,85,1,'Nordrhein-Westfalen','NW'),(143,85,1,'Rheinland-Pfalz','RP'),(144,85,1,'Saarland','SL'),(145,85,1,'Sachsen','SN'),(146,85,1,'Sachsen-Anhalt','ST'),(147,85,1,'Schleswig-Holstein','SH'),(148,85,1,'Thüringen','TH'),(149,72,1,'Harju','HA'),(150,72,1,'Hiiu','HI'),(151,72,1,'Ida-Viru','IV'),(152,72,1,'Jõgeva','JR'),(153,72,1,'Järva','JN'),(154,72,1,'Lääne','LN'),(155,72,1,'Lääne-Viru','LV'),(156,72,1,'Põlva','PL'),(157,72,1,'Pärnu','PR'),(158,72,1,'Rapla','RA'),(159,72,1,'Saare','SA'),(160,72,1,'Tartu','TA'),(161,72,1,'Valga','VG'),(162,72,1,'Viljandi','VD'),(163,72,1,'Võru','VR'),(164,109,1,'Dublin','D'),(165,109,1,'Wicklow','WW'),(166,109,1,'Wexford','WX'),(167,109,1,'Carlow','CW'),(168,109,1,'Kildare','KE'),(169,109,1,'Meath','MH'),(170,109,1,'Louth','LH'),(171,109,1,'Monaghan','MN'),(172,109,1,'Cavan','CN'),(173,109,1,'Longford','LD'),(174,109,1,'Westmeath','WH'),(175,109,1,'Offaly','OY'),(176,109,1,'Laois','LS'),(177,109,1,'Kilkenny','KK'),(178,109,1,'Waterford','WD'),(179,109,1,'Cork','C'),(180,109,1,'Kerry','KY'),(181,109,1,'Limerick','LK'),(182,109,1,'North Tipperary','TN'),(183,109,1,'South Tipperary','TS'),(184,109,1,'Clare','CE'),(185,109,1,'Galway','G'),(186,109,1,'Mayo','MO'),(187,109,1,'Roscommon','RN'),(188,109,1,'Sligo','SO'),(189,109,1,'Leitrim','LM'),(190,109,1,'Donegal','DL'),(191,159,1,'Drenthe','DR'),(192,159,1,'Flevoland','FL'),(193,159,1,'Friesland','FR'),(194,159,1,'Gelderland','GE'),(195,159,1,'Groningen','GR'),(196,159,1,'Limburg','LI'),(197,159,1,'Noord-Brabant','NB'),(198,159,1,'Noord-Holland','NH'),(199,159,1,'Overijssel','OV'),(200,159,1,'Utrecht','UT'),(201,159,1,'Zeeland','ZE'),(202,159,1,'Zuid-Holland','ZH'),(203,3,1,'Aberdeenshire','ABE'),(204,3,1,'Anglesey','ALY'),(205,3,1,'Angus','ANG'),(206,3,1,'Argyll','ARG'),(207,3,1,'Ayrshire','AYR'),(208,3,1,'Banffshire','BAN'),(209,3,1,'Bedfordshire','BED'),(210,3,1,'Berkshire','BER'),(211,3,1,'Berwickshire','BWS'),(212,3,1,'Brecknockshire','BRE'),(213,3,1,'Buckinghamshire','BUC'),(214,3,1,'Bute','BUT'),(215,3,1,'Caernarfonshire','CAE'),(216,3,1,'Caithness','CAI'),(217,3,1,'Cambridgeshire','CAM'),(218,3,1,'Cardiganshire','CAR'),(219,3,1,'Carmarthenshire','CMS'),(220,3,1,'Cheshire','CHE'),(221,3,1,'Clackmannanshire','CLA'),(222,3,1,'Cleveland','CLE'),(223,3,1,'Cornwall','COR'),(224,3,1,'Cromartyshire','CRO'),(225,3,1,'Cumberland','CBR'),(226,3,1,'Cumbria','CUM'),(227,3,1,'Denbighshire','DEN'),(228,3,1,'Derbyshire','DER'),(229,3,1,'Devon','DEV'),(230,3,1,'Dorset','DOR'),(231,3,1,'Dumbartonshire','DBS'),(232,3,1,'Dumfriesshire','DUM'),(233,3,1,'Durham','DUR'),(234,3,1,'East Lothian','ELO'),(235,3,1,'Essex','ESS'),(236,3,1,'Flintshire','FLI'),(237,3,1,'Fife','FIF'),(238,3,1,'Glamorgan','GLA'),(239,3,1,'Gloucestershire','GLO'),(240,3,1,'Hampshire','HAM'),(241,3,1,'Herefordshire','HER'),(242,3,1,'Hertfordshire','HTF'),(243,3,1,'Huntingdonshire','HUN'),(244,3,1,'Inverness','INV'),(245,3,1,'Kent','KEN'),(246,3,1,'Kincardineshire','KCD'),(247,3,1,'Kinross-shire','KIN'),(248,3,1,'Kirkcudbrightshire','KIR'),(249,3,1,'Lanarkshire','LKS'),(250,3,1,'Lancashire','LAN'),(251,3,1,'Leicestershire','LEI'),(252,3,1,'Lincolnshire','LIN'),(253,3,1,'London','LON'),(254,3,1,'Manchester','MAN'),(255,3,1,'Merionethshire','MER'),(256,3,1,'Merseyside','MSY'),(257,3,1,'Middlesex','MDX'),(258,3,1,'Midlands','MID'),(259,3,1,'Midlothian','MLT'),(260,3,1,'Monmouthshire','MON'),(261,3,1,'Montgomeryshire','MGY'),(262,3,1,'Moray','MOR'),(263,3,1,'Nairnshire','NAI'),(264,3,1,'Norfolk','NOR'),(265,3,1,'Northamptonshire','NMP'),(266,3,1,'Northumberland','NUM'),(267,3,1,'Nottinghamshire','NOT'),(268,3,1,'Orkney','ORK'),(269,3,1,'Oxfordshire','OXF'),(270,3,1,'Peebleshire','PEE'),(271,3,1,'Pembrokeshire','PEM'),(272,3,1,'Perthshire','PER'),(273,3,1,'Radnorshire','RAD'),(274,3,1,'Renfrewshire','REN'),(275,3,1,'Ross & Cromarty','ROS'),(276,3,1,'Roxburghshire','ROX'),(277,3,1,'Rutland','RUT'),(278,3,1,'Selkirkshire','SEL'),(279,3,1,'Shetland','SHE'),(280,3,1,'Shropshire','SHR'),(281,3,1,'Somerset','SOM'),(282,3,1,'Staffordshire','STA'),(283,3,1,'Stirlingshire','STI'),(284,3,1,'Suffolk','SUF'),(285,3,1,'Surrey','SUR'),(286,3,1,'Sussex','SUS'),(287,3,1,'Sutherland','SUT'),(288,3,1,'Tyne & Wear','TYN'),(289,3,1,'Warwickshire','WAR'),(290,3,1,'West Lothian','WLO'),(291,3,1,'Westmorland','WES'),(292,3,1,'Wigtownshire','WIG'),(293,3,1,'Wiltshire','WIL'),(294,3,1,'Worcestershire','WOR'),(295,3,1,'Yorkshire','YOR'),(296,184,1,'Alba','AB'),(297,184,1,'Arad','AR'),(298,184,1,'Arges','AG'),(299,184,1,'Bacău','BC'),(300,184,1,'Bihor','BH'),(301,184,1,'Bistrita - Nasaud Bistrita','BN'),(302,184,1,'Botosani','BT'),(303,184,1,'Brasov','BV'),(304,184,1,'Braila','BR'),(305,184,1,'Bucuresti','B'),(306,184,1,'Buzau','BZ'),(307,184,1,'Caras - Severin','CS'),(308,184,1,'Calarasi','CL'),(309,184,1,'Cluj','CJ'),(310,184,1,'Constanta','CT'),(311,184,1,'Covasna Sfantu Gheorghe','CV'),(312,184,1,'Dambovita','DB'),(313,184,1,'Dolj','DJ'),(314,184,1,'Galati','GL'),(315,184,1,'Giurgiu','GR'),(316,184,1,'Gorj','GJ'),(317,184,1,'Harghita','HR'),(318,184,1,'Hunedoara','HD'),(319,184,1,'Ialomita','IL'),(320,184,1,'Iasi','IS'),(321,184,1,'Ilfov','IF'),(322,184,1,'Maramures','MM'),(323,184,1,'Mehedinti','MH'),(324,184,1,'Mures','MS'),(325,184,1,'Neamt','NT'),(326,184,1,'Olt','OT'),(327,184,1,'Prahova Ploiesti','PH'),(328,184,1,'Satu Mare','SM'),(329,184,1,'Salaj','SJ'),(330,184,1,'Sibiu','SB'),(331,184,1,'Suceava','SV'),(332,184,1,'Teleorman','TR'),(333,184,1,'Timis','TM'),(334,184,1,'Tulcea','TL'),(335,184,1,'Vaslui','VS'),(336,184,1,'Valcea','VL'),(337,184,1,'Vrancea','VN'),(338,103,1,'Budapest','BUD'),(339,103,1,'Baranya','BAR'),(340,103,1,'Bács-Kiskun','BKM'),(341,103,1,'Békés','BEK'),(342,103,1,'Borsod-Abaúj-Zemplén','BAZ'),(343,103,1,'Csongrád','CSO'),(344,103,1,'Fejér','FEJ'),(345,103,1,'Győr-Moson-Sopron','GMS'),(346,103,1,'Hajdú-Bihar','HBM'),(347,103,1,'Heves','HEV'),(348,103,1,'Jász-Nagykun-Szolnok','JNS'),(349,103,1,'Komárom-Esztergom','KEM'),(350,103,1,'Nógrád','NOG'),(351,103,1,'Pest','PES'),(352,103,1,'Somogy','SOM'),(353,103,1,'Szabolcs-Szatmár-Bereg','SSB'),(354,103,1,'Tolna','TOL'),(355,103,1,'Vas','VAS'),(356,103,1,'Veszprém','VES'),(357,103,1,'Zala','ZAL'),(358,105,1,'Andhra Pradesh','AP'),(359,105,1,'Arunachal Pradesh','AR'),(360,105,1,'Assam','AS'),(361,105,1,'Bihar','BR'),(362,105,1,'Chhattisgarh','CT'),(363,105,1,'Goa','GA'),(364,105,1,'Gujarat','GJ'),(365,105,1,'Haryana','HR'),(366,105,1,'Himachal Pradesh','HP'),(367,105,1,'Jammu and Kashmir','JK'),(368,105,1,'Jharkhand','JH'),(369,105,1,'Karnataka','KA'),(370,105,1,'Kerala','KL'),(371,105,1,'Madhya Pradesh','MP'),(372,105,1,'Maharashtra','MH'),(373,105,1,'Manipur','MN'),(374,105,1,'Meghalaya','ML'),(375,105,1,'Mizoram','MZ'),(376,105,1,'Nagaland','NL'),(377,105,1,'Odisha','OR'),(378,105,1,'Punjab','PB'),(379,105,1,'Rajasthan','RJ'),(380,105,1,'Sikkim','SK'),(381,105,1,'Tamil Nadu','TN'),(382,105,1,'Telangana','TG'),(383,105,1,'Tripura','TR'),(384,105,1,'Uttarakhand','UT'),(385,105,1,'Uttar Pradesh','UP'),(386,105,1,'West Bengal','WB'),(387,105,1,'Andaman and Nicobar Islands','AN'),(388,105,1,'Chandigarh','CH'),(389,105,1,'Dadra and Nagar Haveli','DN'),(390,105,1,'Daman and Diu','DD'),(391,105,1,'Delhi','DL'),(392,105,1,'Lakshadweep','LD'),(393,105,1,'Puducherry','PY'),(394,78,1,'Auvergne-Rhône-Alpes','ARA'),(395,78,1,'Bourgogne-Franche-Comté','BFC'),(396,78,1,'Bretagne','BZH'),(397,78,1,'Centre–Val-de-Loire','CVL'),(398,78,1,'Corse','COR'),(399,78,1,'Guadeloupe','GP'),(400,78,1,'Guyane','GF'),(401,78,1,'Grand-Est','GE'),(402,78,1,'Hauts-de-France','HF'),(403,78,1,'Île-de-France','IDF'),(404,78,1,'Martinique','MQ'),(405,78,1,'Mayotte','YT'),(406,78,1,'Normandie','NOR'),(407,78,1,'Pays-de-la-Loire','PL'),(408,78,1,'Nouvelle-Aquitaine','NA'),(409,78,1,'Occitanie','OCC'),(410,78,1,'Provence-Alpes-Côte-d\'Azur','PACA'),(411,78,1,'Réunion','RE'),(412,161,1,'Northland','NTL'),(413,161,1,'Auckland','AUK'),(414,161,1,'Waikato','WKO'),(415,161,1,'Bay of Plenty','BOP'),(416,161,1,'Gisborne','GIS'),(417,161,1,'Hawke\'s Bay','HKB'),(418,161,1,'Taranaki','TKI'),(419,161,1,'Manawatu-Wanganui','MWT'),(420,161,1,'Wellington','WGN'),(421,161,1,'Tasman','TAS'),(422,161,1,'Nelson','NSN'),(423,161,1,'Marlborough','MBH'),(424,161,1,'West Coast','WTC'),(425,161,1,'Canterbury','CAN'),(426,161,1,'Otago Otago','OTA'),(427,161,1,'Southland','STL'),(428,210,1,'A Coruña (gl) [La Coruña]','ES-C'),(429,210,1,'Araba (eu)','ES-VI'),(430,210,1,'Albacete','ES-AB'),(431,210,1,'Alacant (ca)','ES-A'),(432,210,1,'Almería','ES-AL'),(433,210,1,'Asturias','ES-O'),(434,210,1,'Ávila','ES-AV'),(435,210,1,'Badajoz','ES-BA'),(436,210,1,'Balears (ca) [Baleares]','ES-PM'),(437,210,1,'Barcelona [Barcelona]','ES-B'),(438,210,1,'Burgos','ES-BU'),(439,210,1,'Cáceres','ES-CC'),(440,210,1,'Cádiz','ES-CA'),(441,210,1,'Cantabria','ES-S'),(442,210,1,'Castelló (ca)','ES-CS'),(443,210,1,'Ciudad Real','ES-CR'),(444,210,1,'Córdoba','ES-CO'),(445,210,1,'Cuenca','ES-CU'),(446,210,1,'Girona (ca) [Gerona]','ES-GI'),(447,210,1,'Granada','ES-GR'),(448,210,1,'Guadalajara','ES-GU'),(449,210,1,'Gipuzkoa (eu)','ES-SS'),(450,210,1,'Huelva','ES-H'),(451,210,1,'Huesca','ES-HU'),(452,210,1,'Jaén','ES-J'),(453,210,1,'La Rioja','ES-LO'),(454,210,1,'Las Palmas','ES-GC'),(455,210,1,'León','ES-LE'),(456,210,1,'Lleida (ca) [Lérida]','ES-L'),(457,210,1,'Lugo (gl) [Lugo]','ES-LU'),(458,210,1,'Madrid','ES-M'),(459,210,1,'Málaga','ES-MA'),(460,210,1,'Murcia','ES-MU'),(461,210,1,'Nafarroa (eu)','ES-NA'),(462,210,1,'Ourense (gl) [Orense]','ES-OR'),(463,210,1,'Palencia','ES-P'),(464,210,1,'Pontevedra (gl) [Pontevedra]','ES-PO'),(465,210,1,'Salamanca','ES-SA'),(466,210,1,'Santa Cruz de Tenerife','ES-TF'),(467,210,1,'Segovia','ES-SG'),(468,210,1,'Sevilla','ES-SE'),(469,210,1,'Soria','ES-SO'),(470,210,1,'Tarragona (ca) [Tarragona]','ES-T'),(471,210,1,'Teruel','ES-TE'),(472,210,1,'Toledo','ES-TO'),(473,210,1,'València (ca)','ES-V'),(474,210,1,'Valladolid','ES-VA'),(475,210,1,'Bizkaia (eu)','ES-BI'),(476,210,1,'Zamora','ES-ZA'),(477,210,1,'Zaragoza','ES-Z'),(478,146,1,'Aguascalientes','MX-AGU'),(479,146,1,'Baja California','MX-BCN'),(480,146,1,'Baja California Sur','MX-BCS'),(481,146,1,'Campeche','MX-CAM'),(482,146,1,'Chiapas','MX-CHP'),(483,146,1,'Chihuahua','MX-CHH'),(484,146,1,'Coahuila','MX-COA'),(485,146,1,'Colima','MX-COL'),(486,146,1,'Ciudad de México','MX-CMX​'),(487,146,1,'Durango','MX-DUR'),(488,146,1,'Guanajuato','MX-GUA'),(489,146,1,'Guerrero','MX-GRO'),(490,146,1,'Hidalgo','MX-HID'),(491,146,1,'Jalisco','MX-JAL'),(492,146,1,'Estado de México','MX-MEX'),(493,146,1,'Michoacán','MX-MIC'),(494,146,1,'Morelos','MX-MOR'),(495,146,1,'Nayarit','MX-NAY'),(496,146,1,'Nuevo León','MX-NLE'),(497,146,1,'Oaxaca','MX-OAX'),(498,146,1,'Puebla','MX-PUE'),(499,146,1,'Querétaro','MX-QUE'),(500,146,1,'Quintana Roo','MX-ROO'),(501,146,1,'San Luis Potosí','MX-SLP'),(502,146,1,'Sinaloa','MX-SIN'),(503,146,1,'Sonora','MX-SON'),(504,146,1,'Tabasco','MX-TAB'),(505,146,1,'Tamaulipas','MX-TAM'),(506,146,1,'Tlaxcala','MX-TLA'),(507,146,1,'Veracruz','MX-VER'),(508,146,1,'Yucatán','MX-YUC'),(509,146,1,'Zacatecas','MX-ZAC'),(510,15,1,'Buenos Aires','BA'),(511,15,1,'Catamarca','CA'),(512,15,1,'Chaco','CH'),(513,15,1,'Chubut','CT'),(514,15,1,'Córdoba','CB'),(515,15,1,'Corrientes','CR'),(516,15,1,'Entre Ríos','ER'),(517,15,1,'Formosa','FO'),(518,15,1,'Jujuy','JY'),(519,15,1,'La Pampa','LP'),(520,15,1,'La Rioja','LR'),(521,15,1,'Mendoza','MZ'),(522,15,1,'Misiones','MI'),(523,15,1,'Neuquén','NQ'),(524,15,1,'Río Negro','RN'),(525,15,1,'Salta','SA'),(526,15,1,'San Juan','SJ'),(527,15,1,'San Luis','SL'),(528,15,1,'Santa Cruz','SC'),(529,15,1,'Santa Fe','SF'),(530,15,1,'Santiago del Estero','SE'),(531,15,1,'Tierra del Fuego','TF'),(532,15,1,'Tucumán','TU'),(533,112,1,'Agrigento','AG'),(534,112,1,'Alessandria','AL'),(535,112,1,'Ancona','AN'),(536,112,1,'Aosta','AO'),(537,112,1,'Arezzo','AR'),(538,112,1,'Ascoli Piceno','AP'),(539,112,1,'Asti','AT'),(540,112,1,'Avellino','AV'),(541,112,1,'Bari','BA'),(542,112,1,'Belluno','BL'),(543,112,1,'Benevento','BN'),(544,112,1,'Bergamo','BG'),(545,112,1,'Biella','BI'),(546,112,1,'Bologna','BO'),(547,112,1,'Bolzano','BZ'),(548,112,1,'Brescia','BS'),(549,112,1,'Brindisi','BR'),(550,112,1,'Cagliari','CA'),(551,112,1,'Caltanissetta','CL'),(552,112,1,'Campobasso','CB'),(553,112,1,'Caserta','CE'),(554,112,1,'Catania','CT'),(555,112,1,'Catanzaro','CZ'),(556,112,1,'Chieti','CH'),(557,112,1,'Como','CO'),(558,112,1,'Cosenza','CS'),(559,112,1,'Cremona','CR'),(560,112,1,'Crotone','KR'),(561,112,1,'Cuneo','CN'),(562,112,1,'Enna','EN'),(563,112,1,'Ferrara','FE'),(564,112,1,'Firenze','FI'),(565,112,1,'Foggia','FG'),(566,112,1,'Forli\'-Cesena','FO'),(567,112,1,'Frosinone','FR'),(568,112,1,'Genova','GE'),(569,112,1,'Gorizia','GO'),(570,112,1,'Grosseto','GR'),(571,112,1,'Imperia','IM'),(572,112,1,'Isernia','IS'),(573,112,1,'La Spezia','SP'),(574,112,1,'L\'Aquila','AQ'),(575,112,1,'Latina','LT'),(576,112,1,'Lecce','LE'),(577,112,1,'Lecco','LC'),(578,112,1,'Livorno','LI'),(579,112,1,'Lodi','LO'),(580,112,1,'Lucca','LU'),(581,112,1,'Macerata','MC'),(582,112,1,'Mantova','MN'),(583,112,1,'Massa-Carrara','MS'),(584,112,1,'Matera','MT'),(585,112,1,'Messina','ME'),(586,112,1,'Milano','MI'),(587,112,1,'Modena','MO'),(588,112,1,'Napoli','NA'),(589,112,1,'Novara','NO'),(590,112,1,'Nuoro','NU'),(591,112,1,'Oristano','OR'),(592,112,1,'Padova','PD'),(593,112,1,'Palermo','PA'),(594,112,1,'Parma','PR'),(595,112,1,'Pavia','PV'),(596,112,1,'Perugia','PG'),(597,112,1,'Pesaro e Urbino','PS'),(598,112,1,'Pescara','PE'),(599,112,1,'Piacenza','PC'),(600,112,1,'Pisa','PI'),(601,112,1,'Pistoia','PT'),(602,112,1,'Pordenone','PN'),(603,112,1,'Potenza','PZ'),(604,112,1,'Prato','PO'),(605,112,1,'Ragusa','RG'),(606,112,1,'Ravenna','RA'),(607,112,1,'Reggio di Calabria','RC'),(608,112,1,'Reggio nell\'Emilia','RE'),(609,112,1,'Rieti','RI'),(610,112,1,'Rimini','RN'),(611,112,1,'Roma','RM'),(612,112,1,'Rovigo','RO'),(613,112,1,'Salerno','SA'),(614,112,1,'Sassari','SS'),(615,112,1,'Savona','SV'),(616,112,1,'Siena','SI'),(617,112,1,'Siracusa','SR'),(618,112,1,'Sondrio','SO'),(619,112,1,'Taranto','TA'),(620,112,1,'Teramo','TE'),(621,112,1,'Terni','TR'),(622,112,1,'Torino','TO'),(623,112,1,'Trapani','TP'),(624,112,1,'Trento','TN'),(625,112,1,'Treviso','TV'),(626,112,1,'Trieste','TS'),(627,112,1,'Udine','UD'),(628,112,1,'Varese','VA'),(629,112,1,'Venezia','VE'),(630,112,1,'Verbano-Cusio-Ossola','VB'),(631,112,1,'Vercelli','VC'),(632,112,1,'Verona','VR'),(633,112,1,'Vibo Valentia','VV'),(634,112,1,'Vicenza','VI'),(635,112,1,'Viterbo','VT'),(636,185,1,'Респ Адыгея','AD'),(637,185,1,'Респ Башкортостан','BA'),(638,185,1,'Респ Бурятия','BU'),(639,185,1,'Респ Алтай','AL'),(640,185,1,'Респ Дагестан','DA'),(641,185,1,'Респ Ингушетия','IN'),(642,185,1,'Респ Кабардино-Балкарская','KB'),(643,185,1,'Респ Калмыкия','KL'),(644,185,1,'Респ Карачаево-Черкесская','KC'),(645,185,1,'Респ Карелия','KR'),(646,185,1,'Респ Коми','KO'),(647,185,1,'Респ Марий Эл','ME'),(648,185,1,'Респ Мордовия','MO'),(649,185,1,'Респ Саха /Якутия/','SA'),(650,185,1,'Респ Северная Осетия - Алания','SE'),(651,185,1,'Респ Татарстан','TA'),(652,185,1,'Респ Тыва','TY'),(653,185,1,'Респ Удмуртская','UD'),(654,185,1,'Респ Хакасия','KK'),(655,185,1,'Респ Чеченская','CE'),(656,185,1,'Чувашская Республика - Чувашия','CU'),(657,185,1,'Алтайский край','ALT'),(658,185,1,'Краснодарский край','KDA'),(659,185,1,'Красноярский край','KYA'),(660,185,1,'Приморский край','PRI'),(661,185,1,'Ставропольский край','STA'),(662,185,1,'Хабаровский край','KHA'),(663,185,1,'Амурская обл','AMU'),(664,185,1,'Архангельская обл','ARK'),(665,185,1,'Астраханская обл','AST'),(666,185,1,'Белгородская обл','BEL'),(667,185,1,'Брянская обл','BRY'),(668,185,1,'Владимирская обл','VLA'),(669,185,1,'Волгоградская обл','VGG'),(670,185,1,'Вологодская обл','VLG'),(671,185,1,'Воронежская обл','VOR'),(672,185,1,'Ивановская обл','IVA'),(673,185,1,'Иркутская обл','IRK'),(674,185,1,'Калининградская обл','KGD'),(675,185,1,'Калужская обл','KLU'),(676,185,1,'Камчатский край','KAM'),(677,185,1,'Кемеровская область - Кузбасс','KEM'),(678,185,1,'Кировская обл','KIR'),(679,185,1,'Костромская обл','KOS'),(680,185,1,'Курганская обл','KGN'),(681,185,1,'Курская обл','KRS'),(682,185,1,'Ленинградская обл','LEN'),(683,185,1,'Липецкая обл','LIP'),(684,185,1,'Магаданская обл','MAG'),(685,185,1,'Московская обл','MOS'),(686,185,1,'Мурманская обл','MUR'),(687,185,1,'Нижегородская обл','NIZ'),(688,185,1,'Новгородская обл','NGR'),(689,185,1,'Новосибирская обл','NVS'),(690,185,1,'Омская обл','OMS'),(691,185,1,'Оренбургская обл','ORE'),(692,185,1,'Орловская обл','ORL'),(693,185,1,'Пензенская обл','PNZ'),(694,185,1,'Пермский край','PER'),(695,185,1,'Псковская обл','PSK'),(696,185,1,'Ростовская обл','ROS'),(697,185,1,'Рязанская обл','RYA'),(698,185,1,'Самарская обл','SAM'),(699,185,1,'Саратовская обл','SAR'),(700,185,1,'Сахалинская обл','SAK'),(701,185,1,'Свердловская обл','SVE'),(702,185,1,'Смоленская обл','SMO'),(703,185,1,'Тамбовская обл','TAM'),(704,185,1,'Тверская обл','TVE'),(705,185,1,'Томская обл','TOM'),(706,185,1,'Тульская обл','TUL'),(707,185,1,'Тюменская обл','TYU'),(708,185,1,'Ульяновская обл','ULY'),(709,185,1,'Челябинская обл','CHE'),(710,185,1,'Забайкальский край','ZAB'),(711,185,1,'Ярославская обл','YAR'),(712,185,1,'г Москва','MOW'),(713,185,1,'г Санкт-Петербург','SPE'),(714,185,1,'Еврейская Аобл','YEV'),(715,185,1,'Ненецкий АО','NEN'),(716,185,1,'Ханты-Мансийский Автономный округ - Югра АО','KHM'),(717,185,1,'Чукотский АО','CHU'),(718,185,1,'Ямало-Ненецкий АО','YAN'),(719,185,1,'Респ Крым','43'),(720,185,1,'г Севастополь','40'),(721,185,1,'г Байконур','BAY'),(722,18,1,'Wien','WI'),(723,18,1,'Niederösterreich','NI'),(724,18,1,'Oberösterreich','OB'),(725,18,1,'Steiermark','ST'),(726,18,1,'Tirol','TI'),(727,18,1,'Kärnten','KA'),(728,18,1,'Salzburg','SA'),(729,18,1,'Vorarlberg','VO'),(730,18,1,'Burgenland','BU'),(731,58,1,'Središnja Hrvatska','SH'),(732,58,1,'Dalmacija','DA'),(733,58,1,'Slavonija','SL'),(734,58,1,'Istra','IS'),(735,25,1,'Antwerpen','AN'),(736,25,1,'Oost-Vlaanderen','OV'),(737,25,1,'Vlaams-Brabant','VB'),(738,25,1,'West-Vlaanderen','WV'),(739,25,1,'Hainaut','HA'),(740,25,1,'Luxembourg','LU'),(741,25,1,'Namur','NA'),(742,25,1,'Walloon Region','WA'),(743,25,1,'Brussels Hoofdstedelijk Gewest','BR'),(744,63,1,'Hovedstaden Region','HO'),(745,63,1,'Midtjylland Region','MI'),(746,63,1,'Nordjylland Region','NO'),(747,63,1,'Sjælland Region','SA'),(748,63,1,'Region Syddanmark','SY');
/*!40000 ALTER TABLE `rainlab_location_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_notify_notification_rules`
--

DROP TABLE IF EXISTS `rainlab_notify_notification_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainlab_notify_notification_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `config_data` mediumtext DEFAULT NULL,
  `condition_data` mediumtext DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `is_custom` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rainlab_notify_notification_rules_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_notify_notification_rules`
--

LOCK TABLES `rainlab_notify_notification_rules` WRITE;
/*!40000 ALTER TABLE `rainlab_notify_notification_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `rainlab_notify_notification_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_notify_notifications`
--

DROP TABLE IF EXISTS `rainlab_notify_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainlab_notify_notifications` (
  `id` char(36) NOT NULL,
  `event_type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `body` text DEFAULT NULL,
  `data` mediumtext NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rainlab_notify_notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_notify_notifications`
--

LOCK TABLES `rainlab_notify_notifications` WRITE;
/*!40000 ALTER TABLE `rainlab_notify_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `rainlab_notify_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_notify_rule_actions`
--

DROP TABLE IF EXISTS `rainlab_notify_rule_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainlab_notify_rule_actions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) DEFAULT NULL,
  `config_data` mediumtext DEFAULT NULL,
  `rule_host_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rainlab_notify_rule_actions_rule_host_id_index` (`rule_host_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_notify_rule_actions`
--

LOCK TABLES `rainlab_notify_rule_actions` WRITE;
/*!40000 ALTER TABLE `rainlab_notify_rule_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `rainlab_notify_rule_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_notify_rule_conditions`
--

DROP TABLE IF EXISTS `rainlab_notify_rule_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainlab_notify_rule_conditions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) DEFAULT NULL,
  `config_data` mediumtext DEFAULT NULL,
  `condition_control_type` varchar(100) DEFAULT NULL,
  `rule_host_type` varchar(100) DEFAULT NULL,
  `rule_host_id` int(10) unsigned DEFAULT NULL,
  `rule_parent_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `host_rule_id_type` (`rule_host_id`,`rule_host_type`),
  KEY `rainlab_notify_rule_conditions_rule_host_id_index` (`rule_host_id`),
  KEY `rainlab_notify_rule_conditions_rule_parent_id_index` (`rule_parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_notify_rule_conditions`
--

LOCK TABLES `rainlab_notify_rule_conditions` WRITE;
/*!40000 ALTER TABLE `rainlab_notify_rule_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `rainlab_notify_rule_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_translate_attributes`
--

DROP TABLE IF EXISTS `rainlab_translate_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainlab_translate_attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) NOT NULL,
  `model_id` varchar(255) DEFAULT NULL,
  `model_type` varchar(255) DEFAULT NULL,
  `attribute_data` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rainlab_translate_attributes_locale_index` (`locale`),
  KEY `rainlab_translate_attributes_model_id_index` (`model_id`),
  KEY `rainlab_translate_attributes_model_type_index` (`model_type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_translate_attributes`
--

LOCK TABLES `rainlab_translate_attributes` WRITE;
/*!40000 ALTER TABLE `rainlab_translate_attributes` DISABLE KEYS */;
INSERT INTO `rainlab_translate_attributes` VALUES (1,'en','1','OFFLINE\\Mall\\Models\\OrderState','[]'),(2,'de','1','OFFLINE\\Mall\\Models\\OrderState','[]'),(3,'en','2','OFFLINE\\Mall\\Models\\OrderState','[]'),(4,'de','2','OFFLINE\\Mall\\Models\\OrderState','[]'),(5,'en','3','OFFLINE\\Mall\\Models\\OrderState','[]'),(6,'de','3','OFFLINE\\Mall\\Models\\OrderState','[]'),(7,'en','4','OFFLINE\\Mall\\Models\\OrderState','[]'),(8,'de','4','OFFLINE\\Mall\\Models\\OrderState','[]'),(9,'en','5','OFFLINE\\Mall\\Models\\OrderState','[]'),(10,'de','5','OFFLINE\\Mall\\Models\\OrderState','[]');
/*!40000 ALTER TABLE `rainlab_translate_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_translate_indexes`
--

DROP TABLE IF EXISTS `rainlab_translate_indexes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainlab_translate_indexes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) NOT NULL,
  `model_id` varchar(255) DEFAULT NULL,
  `model_type` varchar(255) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rainlab_translate_indexes_locale_index` (`locale`),
  KEY `rainlab_translate_indexes_model_id_index` (`model_id`),
  KEY `rainlab_translate_indexes_model_type_index` (`model_type`),
  KEY `rainlab_translate_indexes_item_index` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_translate_indexes`
--

LOCK TABLES `rainlab_translate_indexes` WRITE;
/*!40000 ALTER TABLE `rainlab_translate_indexes` DISABLE KEYS */;
/*!40000 ALTER TABLE `rainlab_translate_indexes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_translate_message_data`
--

DROP TABLE IF EXISTS `rainlab_translate_message_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainlab_translate_message_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `usage` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rainlab_translate_message_data_locale_index` (`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_translate_message_data`
--

LOCK TABLES `rainlab_translate_message_data` WRITE;
/*!40000 ALTER TABLE `rainlab_translate_message_data` DISABLE KEYS */;
INSERT INTO `rainlab_translate_message_data` VALUES (1,'it','[]','[]','2023-10-28 06:59:55','2023-10-28 06:59:55');
/*!40000 ALTER TABLE `rainlab_translate_message_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_user_mail_blockers`
--

DROP TABLE IF EXISTS `rainlab_user_mail_blockers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainlab_user_mail_blockers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rainlab_user_mail_blockers_email_index` (`email`),
  KEY `rainlab_user_mail_blockers_template_index` (`template`),
  KEY `rainlab_user_mail_blockers_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_user_mail_blockers`
--

LOCK TABLES `rainlab_user_mail_blockers` WRITE;
/*!40000 ALTER TABLE `rainlab_user_mail_blockers` DISABLE KEYS */;
/*!40000 ALTER TABLE `rainlab_user_mail_blockers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `payload` text DEFAULT NULL,
  `last_activity` int(11) DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_event_logs`
--

DROP TABLE IF EXISTS `system_event_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_event_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `details` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_event_logs_level_index` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_event_logs`
--

LOCK TABLES `system_event_logs` WRITE;
/*!40000 ALTER TABLE `system_event_logs` DISABLE KEYS */;
INSERT INTO `system_event_logs` VALUES (87,'error','ErrorException: file_put_contents(/var/www/html/syncromall/public/storage/cms/blueprint-debug.php): Failed to open stream: Permission denied in /var/www/html/syncromall/public/vendor/laravel/framework/src/Illuminate/Filesystem/Filesystem.php:190\nStack trace:\n#0 /var/www/html/syncromall/public/vendor/laravel/framework/src/Illuminate/Foundation/Bootstrap/HandleExceptions.php(270): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 [internal function]: Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}()\n#2 /var/www/html/syncromall/public/vendor/laravel/framework/src/Illuminate/Filesystem/Filesystem.php(190): file_put_contents()\n#3 /var/www/html/syncromall/public/vendor/october/rain/src/Filesystem/Filesystem.php(266): Illuminate\\Filesystem\\Filesystem->put()\n#4 /var/www/html/syncromall/public/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(338): October\\Rain\\Filesystem\\Filesystem->put()\n#5 /var/www/html/syncromall/public/modules/tailor/classes/BlueprintIndexer.php(216): Illuminate\\Support\\Facades\\Facade::__callStatic()\n#6 /var/www/html/syncromall/public/modules/tailor/classes/BlueprintIndexer.php(158): Tailor\\Classes\\BlueprintIndexer->resetCacheInDebugMode()\n#7 /var/www/html/syncromall/public/modules/tailor/classes/blueprintindexer/NavigationRegistry.php(55): Tailor\\Classes\\BlueprintIndexer->getCache()\n#8 /var/www/html/syncromall/public/modules/tailor/classes/blueprintindexer/NavigationRegistry.php(29): Tailor\\Classes\\BlueprintIndexer->listNavigationRaw()\n#9 /var/www/html/syncromall/public/modules/tailor/classes/blueprintindexer/NavigationRegistry.php(277): Tailor\\Classes\\BlueprintIndexer->listPrimaryNavigation()\n#10 /var/www/html/syncromall/public/modules/tailor/ServiceProvider.php(56): Tailor\\Classes\\BlueprintIndexer->getNavigationMainMenu()\n#11 /var/www/html/syncromall/public/modules/backend/classes/NavigationManager.php(74): Tailor\\ServiceProvider->registerNavigation()\n#12 /var/www/html/syncromall/public/modules/backend/classes/NavigationManager.php(380): Backend\\Classes\\NavigationManager->loadItems()\n#13 /var/www/html/syncromall/public/modules/backend/classes/NavigationManager.php(573): Backend\\Classes\\NavigationManager->listMainMenuItems()\n#14 /var/www/html/syncromall/public/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(338): Backend\\Classes\\NavigationManager->getActiveMainMenuItem()\n#15 /var/www/html/syncromall/public/modules/backend/layouts/_mainmenu.php(3): Illuminate\\Support\\Facades\\Facade::__callStatic()\n#16 /var/www/html/syncromall/public/modules/system/traits/ViewMaker.php(267): include(\'...\')\n#17 /var/www/html/syncromall/public/modules/system/traits/ViewMaker.php(161): Backend\\Classes\\Controller->makeFileContents()\n#18 /var/www/html/syncromall/public/modules/system/traits/ViewMaker.php(177): Backend\\Classes\\Controller->makeLayout()\n#19 /var/www/html/syncromall/public/modules/backend/layouts/default.php(17): Backend\\Classes\\Controller->makeLayoutPartial()\n#20 /var/www/html/syncromall/public/modules/system/traits/ViewMaker.php(267): include(\'...\')\n#21 /var/www/html/syncromall/public/modules/system/traits/ViewMaker.php(161): Backend\\Classes\\Controller->makeFileContents()\n#22 /var/www/html/syncromall/public/modules/system/traits/ViewMaker.php(133): Backend\\Classes\\Controller->makeLayout()\n#23 /var/www/html/syncromall/public/modules/system/traits/ViewMaker.php(114): Backend\\Classes\\Controller->makeViewContent()\n#24 /var/www/html/syncromall/public/modules/backend/classes/Controller.php(401): Backend\\Classes\\Controller->makeView()\n#25 /var/www/html/syncromall/public/modules/backend/classes/Controller.php(269): Backend\\Classes\\Controller->execPageAction()\n#26 /var/www/html/syncromall/public/modules/backend/classes/BackendController.php(118): Backend\\Classes\\Controller->run()\n#27 /var/www/html/syncromall/public/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): Backend\\Classes\\BackendController->run()\n#28 /var/www/html/syncromall/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(43): Illuminate\\Routing\\Controller->callAction()\n#29 /var/www/html/syncromall/public/vendor/laravel/framework/src/Illuminate/Routing/Route.php(260): Illuminate\\Routing\\ControllerDispatcher->dispatch()\n#30 /var/www/html/syncromall/public/vendor/laravel/framework/src/Illuminate/Routing/Route.php(205): Illuminate\\Routing\\Route->runController()\n#31 /var/www/html/syncromall/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(798): Illuminate\\Routing\\Route->run()\n#32 /var/www/html/syncromall/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}()\n#33 /var/www/html/syncromall/public/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#34 /var/www/html/syncromall/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle()\n#35 /var/www/html/syncromall/public/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#36 /var/www/html/syncromall/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle()\n#37 /var/www/html/syncromall/public/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#38 /var/www/html/syncromall/public/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest()\n#39 /var/www/html/syncromall/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Session\\Middleware\\StartSession->handle()\n#40 /var/www/html/syncromall/public/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#41 /var/www/html/syncromall/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle()\n#42 /var/www/html/syncromall/public/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#43 /var/www/html/syncromall/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle()\n#44 /var/www/html/syncromall/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#45 /var/www/html/syncromall/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(799): Illuminate\\Pipeline\\Pipeline->then()\n#46 /var/www/html/syncromall/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(776): Illuminate\\Routing\\Router->runRouteWithinStack()\n#47 /var/www/html/syncromall/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(740): Illuminate\\Routing\\Router->runRoute()\n#48 /var/www/html/syncromall/public/vendor/october/rain/src/Router/CoreRouter.php(32): Illuminate\\Routing\\Router->dispatchToRoute()\n#49 /var/www/html/syncromall/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(190): October\\Rain\\Router\\CoreRouter->dispatch()\n#50 /var/www/html/syncromall/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}()\n#51 /var/www/html/syncromall/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#52 /var/www/html/syncromall/public/vendor/october/rain/src/Foundation/Http/Middleware/CheckForMaintenanceMode.php(23): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle()\n#53 /var/www/html/syncromall/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#54 /var/www/html/syncromall/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#55 /var/www/html/syncromall/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(165): Illuminate\\Pipeline\\Pipeline->then()\n#56 /var/www/html/syncromall/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(134): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter()\n#57 /var/www/html/syncromall/public/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle()\n#58 {main}','[]','2023-11-10 09:30:40','2023-11-10 09:30:40');
/*!40000 ALTER TABLE `system_event_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_files`
--

DROP TABLE IF EXISTS `system_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `disk_name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_size` int(11) NOT NULL,
  `content_type` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  `attachment_type` varchar(255) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_files_master_index` (`attachment_type`,`attachment_id`,`field`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_files`
--

LOCK TABLES `system_files` WRITE;
/*!40000 ALTER TABLE `system_files` DISABLE KEYS */;
INSERT INTO `system_files` VALUES (1,'653ce8584a8e3208077805.jpg','il-periodo-di-prova-retribuito-e-quanto-dura.jpg',99350,'image/jpeg',NULL,NULL,'logo',1,'OFFLINE\\Mall\\Models\\Brand',1,1,'2023-10-28 08:54:16','2023-10-28 08:54:21'),(2,'653ce92fd5730212169215.png','logo-avec-cadre-CMJN.png',33796,'image/png',NULL,NULL,'images',1,'mall.imageset',1,1,'2023-10-28 08:57:51','2023-10-28 08:57:58');
/*!40000 ALTER TABLE `system_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_mail_layouts`
--

DROP TABLE IF EXISTS `system_mail_layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_mail_layouts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `content_html` text DEFAULT NULL,
  `content_text` text DEFAULT NULL,
  `content_css` text DEFAULT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `options` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_mail_layouts`
--

LOCK TABLES `system_mail_layouts` WRITE;
/*!40000 ALTER TABLE `system_mail_layouts` DISABLE KEYS */;
INSERT INTO `system_mail_layouts` VALUES (1,'Default layout','default','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n</head>\n<body>\n    <style type=\"text/css\" media=\"screen\">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class=\"wrapper layout-default\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n\n        <!-- Header -->\n        {% partial \'header\' body %}\n            {{ subject|raw }}\n        {% endpartial %}\n\n        <tr>\n            <td align=\"center\">\n                <table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class=\"body\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                            <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class=\"content-cell\">\n                                        {{ content|raw }}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n\n        <!-- Footer -->\n        {% partial \'footer\' body %}\n            &copy; {{ \"now\"|date(\"Y\") }} {{ appName }}. All rights reserved.\n        {% endpartial %}\n\n    </table>\n\n</body>\n</html>','{{ content|raw }}','@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}',1,NULL,'2023-10-28 06:58:49','2023-10-28 06:58:49'),(2,'System layout','system','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n</head>\n<body>\n    <style type=\"text/css\" media=\"screen\">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class=\"wrapper layout-system\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n        <tr>\n            <td align=\"center\">\n                <table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class=\"body\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                            <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class=\"content-cell\">\n                                        {{ content|raw }}\n\n                                        <!-- Subcopy -->\n                                        {% partial \'subcopy\' body %}\n                                            **This is an automatic message. Please do not reply to it.**\n                                        {% endpartial %}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n    </table>\n\n</body>\n</html>','{{ content|raw }}\n\n\n---\nThis is an automatic message. Please do not reply to it.','@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}',1,NULL,'2023-10-28 06:58:49','2023-10-28 06:58:49');
/*!40000 ALTER TABLE `system_mail_layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_mail_partials`
--

DROP TABLE IF EXISTS `system_mail_partials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_mail_partials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `content_html` text DEFAULT NULL,
  `content_text` text DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_mail_partials`
--

LOCK TABLES `system_mail_partials` WRITE;
/*!40000 ALTER TABLE `system_mail_partials` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_mail_partials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_mail_templates`
--

DROP TABLE IF EXISTS `system_mail_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_mail_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `content_html` text DEFAULT NULL,
  `content_text` text DEFAULT NULL,
  `layout_id` int(11) DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_mail_templates_layout_id_index` (`layout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_mail_templates`
--

LOCK TABLES `system_mail_templates` WRITE;
/*!40000 ALTER TABLE `system_mail_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_mail_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_parameters`
--

DROP TABLE IF EXISTS `system_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_parameters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(100) NOT NULL,
  `group` varchar(50) NOT NULL,
  `item` varchar(150) NOT NULL,
  `value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_index` (`namespace`,`group`,`item`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_parameters`
--

LOCK TABLES `system_parameters` WRITE;
/*!40000 ALTER TABLE `system_parameters` DISABLE KEYS */;
INSERT INTO `system_parameters` VALUES (1,'system','update','count','0'),(2,'system','core','build','\"5\"'),(3,'system','update','retry','1699634131'),(4,'system','project','key','\"0ZmplAwLgZwp3ZwR1YJR2MGMwZzD3LwOzAJRmBTR0LwVkAQp0ZTH3AGNkATAu\"'),(5,'system','project','id','277215'),(6,'system','project','name','\"Octomall\"'),(7,'system','project','owner','\"Tecnotrade S.r.l.\"'),(8,'system','project','is_active','true'),(9,'system','update','versions','{\"count\":0,\"core\":null,\"plugins\":[]}');
/*!40000 ALTER TABLE `system_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_plugin_history`
--

DROP TABLE IF EXISTS `system_plugin_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_plugin_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `version` varchar(50) NOT NULL,
  `detail` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_plugin_history_code_index` (`code`),
  KEY `system_plugin_history_type_index` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=858 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_plugin_history`
--

LOCK TABLES `system_plugin_history` WRITE;
/*!40000 ALTER TABLE `system_plugin_history` DISABLE KEYS */;
INSERT INTO `system_plugin_history` VALUES (1,'October.Demo','comment','1.0.1','First version of Demo','2023-10-28 06:58:49'),(2,'RainLab.Translate','script','1.0.1','create_attributes_table.php','2023-10-28 06:59:55'),(3,'RainLab.Translate','script','1.0.1','create_indexes_table.php','2023-10-28 06:59:55'),(4,'RainLab.Translate','comment','1.0.1','First version of Translate','2023-10-28 06:59:55'),(5,'RainLab.Translate','comment','1.1.0','Introduce compatibility with RainLab.Pages plugin.','2023-10-28 06:59:55'),(6,'RainLab.Translate','comment','1.2.0','CMS pages now support translating the URL.','2023-10-28 06:59:55'),(7,'RainLab.Translate','comment','1.3.0','Added search to the translate messages page.','2023-10-28 06:59:55'),(8,'RainLab.Translate','comment','1.4.0','Add importer and exporter for messages','2023-10-28 06:59:55'),(9,'RainLab.Translate','comment','1.5.0','Compatibility fix with Build 451','2023-10-28 06:59:55'),(10,'RainLab.Translate','comment','1.6.0','Make File Upload widget properties translatable. Merge Repeater core changes into MLRepeater widget. Add getter method to retrieve original translate data.','2023-10-28 06:59:55'),(11,'RainLab.Translate','comment','1.7.0','Breaking change for the Message::trans() method (params are now escaped), fix message translation documentation, fix string translation key for scan errors column header.','2023-10-28 06:59:55'),(12,'RainLab.Translate','comment','1.8.0','Adds initial support for October v2.0','2023-10-28 06:59:55'),(13,'RainLab.Translate','comment','1.9.0','Restores ability to translate URLs with CMS Editor in October v2.0','2023-10-28 06:59:55'),(14,'RainLab.Translate','comment','1.10.0','Adds new multilingual nested form widget. Adds withFallbackLocale method.','2023-10-28 06:59:55'),(15,'RainLab.Translate','comment','1.11.0','Update to latest Media Finder changes in October v2.2','2023-10-28 06:59:55'),(16,'RainLab.Translate','comment','1.12.0','Adds scopeTransWhereNoFallback method','2023-10-28 06:59:55'),(17,'RainLab.Translate','comment','2.0.0','Major upgrade and multisite integration','2023-10-28 06:59:55'),(18,'RainLab.Translate','script','2.0.1','create_message_data_table.php','2023-10-28 06:59:55'),(19,'RainLab.Translate','comment','2.0.1','Create message data store','2023-10-28 06:59:55'),(20,'RainLab.Translate','comment','2.0.2','Fixes various bugs in message translation','2023-10-28 06:59:55'),(21,'RainLab.Translate','comment','2.0.3','Remove deprecated class','2023-10-28 06:59:55'),(22,'RainLab.Translate','comment','2.0.4','Include component default partials in theme scanner','2023-10-28 06:59:55'),(23,'RainLab.Translate','comment','2.0.5','Reset locale when edit site changes programmatically','2023-10-28 06:59:55'),(24,'RainLab.Translate','comment','2.0.6','Restores the post scan purge feature in messages','2023-10-28 06:59:55'),(25,'RainLab.Translate','comment','2.1.0','Adds support for translatable file attachments','2023-10-28 06:59:55'),(26,'RainLab.Translate','comment','2.1.1','Fixes child menu item translations for pages plugin','2023-10-28 06:59:55'),(27,'RainLab.Translate','comment','2.1.2','Fixes translatable integration with settings models','2023-10-28 06:59:55'),(28,'RainLab.Translate','comment','2.1.3','Fixes installation of Translate with other dependencies','2023-10-28 06:59:55'),(29,'RainLab.Translate','comment','2.2.0','Adds localePage Twig filter for translating page URLs','2023-10-28 06:59:55'),(30,'RainLab.Translate','comment','2.2.1','Fixes translated checkboxes','2023-10-28 06:59:55'),(31,'RainLab.Translate','comment','2.2.2','Fixes translatable models without timestamps','2023-10-28 06:59:55'),(32,'RainLab.Translate','comment','2.2.3','Fixes translatable fields with fallback values','2023-10-28 06:59:55'),(33,'RainLab.Translate','comment','2.2.4','Fixes bug where translations are lost by unintentional cleanup','2023-10-28 06:59:55'),(34,'RainLab.Translate','comment','2.2.5','Fixes storing attributes via setAttributeTranslated','2023-10-28 06:59:55'),(35,'RainLab.Translate','comment','2.2.6','Adds option to disable fallback values when writing attributes','2023-10-28 06:59:55'),(36,'RainLab.Translate','comment','2.2.7','Improve theme scanner to show active theme and include component partials','2023-10-28 06:59:55'),(37,'RainLab.User','script','1.0.1','create_users_table.php','2023-10-28 07:00:10'),(38,'RainLab.User','script','1.0.1','create_throttle_table.php','2023-10-28 07:00:10'),(39,'RainLab.User','comment','1.0.1','Initialize plugin.','2023-10-28 07:00:10'),(40,'RainLab.User','comment','1.0.2','Seed tables.','2023-10-28 07:00:10'),(41,'RainLab.User','comment','1.0.3','Translated hard-coded text to language strings.','2023-10-28 07:00:10'),(42,'RainLab.User','comment','1.0.4','Improvements to user-interface for Location manager.','2023-10-28 07:00:10'),(43,'RainLab.User','comment','1.0.5','Added contact details for users.','2023-10-28 07:00:10'),(44,'RainLab.User','script','1.0.6','create_mail_blockers_table.php','2023-10-28 07:00:10'),(45,'RainLab.User','comment','1.0.6','Added Mail Blocker utility so users can block specific mail templates.','2023-10-28 07:00:10'),(46,'RainLab.User','comment','1.0.7','Add back-end Settings page.','2023-10-28 07:00:10'),(47,'RainLab.User','comment','1.0.8','Updated the Settings page.','2023-10-28 07:00:10'),(48,'RainLab.User','comment','1.0.9','Adds new welcome mail message for users and administrators.','2023-10-28 07:00:10'),(49,'RainLab.User','comment','1.0.10','Adds administrator-only activation mode.','2023-10-28 07:00:10'),(50,'RainLab.User','script','1.0.11','users_add_login_column.php','2023-10-28 07:00:10'),(51,'RainLab.User','comment','1.0.11','Users now have an optional login field that defaults to the email field.','2023-10-28 07:00:10'),(52,'RainLab.User','script','1.0.12','users_rename_login_to_username.php','2023-10-28 07:00:10'),(53,'RainLab.User','comment','1.0.12','Create a dedicated setting for choosing the login mode.','2023-10-28 07:00:10'),(54,'RainLab.User','comment','1.0.13','Minor fix to the Account sign in logic.','2023-10-28 07:00:10'),(55,'RainLab.User','comment','1.0.14','Minor improvements to the code.','2023-10-28 07:00:10'),(56,'RainLab.User','script','1.0.15','users_add_surname.php','2023-10-28 07:00:10'),(57,'RainLab.User','comment','1.0.15','Adds last name column to users table (surname).','2023-10-28 07:00:10'),(58,'RainLab.User','comment','1.0.16','Require permissions for settings page too.','2023-10-28 07:00:10'),(59,'RainLab.User','comment','1.1.0','Profile fields and Locations have been removed.','2023-10-28 07:00:10'),(60,'RainLab.User','script','1.1.1','create_user_groups_table.php','2023-10-28 07:00:10'),(61,'RainLab.User','script','1.1.1','seed_user_groups_table.php','2023-10-28 07:00:10'),(62,'RainLab.User','comment','1.1.1','Users can now be added to groups.','2023-10-28 07:00:10'),(63,'RainLab.User','comment','1.1.2','A raw URL can now be passed as the redirect property in the Account component.','2023-10-28 07:00:10'),(64,'RainLab.User','comment','1.1.3','Adds a super user flag to the users table, reserved for future use.','2023-10-28 07:00:10'),(65,'RainLab.User','comment','1.1.4','User list can be filtered by the group they belong to.','2023-10-28 07:00:10'),(66,'RainLab.User','comment','1.1.5','Adds a new permission to hide the User settings menu item.','2023-10-28 07:00:10'),(67,'RainLab.User','script','1.2.0','users_add_deleted_at.php','2023-10-28 07:00:10'),(68,'RainLab.User','comment','1.2.0','Users can now deactivate their own accounts.','2023-10-28 07:00:10'),(69,'RainLab.User','comment','1.2.1','New feature for checking if a user is recently active/online.','2023-10-28 07:00:10'),(70,'RainLab.User','comment','1.2.2','Add bulk action button to user list.','2023-10-28 07:00:10'),(71,'RainLab.User','comment','1.2.3','Included some descriptive paragraphs in the Reset Password component markup.','2023-10-28 07:00:10'),(72,'RainLab.User','comment','1.2.4','Added a checkbox for blocking all mail sent to the user.','2023-10-28 07:00:10'),(73,'RainLab.User','script','1.2.5','update_timestamp_nullable.php','2023-10-28 07:00:10'),(74,'RainLab.User','comment','1.2.5','Database maintenance. Updated all timestamp columns to be nullable.','2023-10-28 07:00:10'),(75,'RainLab.User','script','1.2.6','users_add_last_seen.php','2023-10-28 07:00:10'),(76,'RainLab.User','comment','1.2.6','Add a dedicated last seen column for users.','2023-10-28 07:00:10'),(77,'RainLab.User','comment','1.2.7','Minor fix to user timestamp attributes.','2023-10-28 07:00:10'),(78,'RainLab.User','comment','1.2.8','Add date range filter to users list. Introduced a logout event.','2023-10-28 07:00:10'),(79,'RainLab.User','comment','1.2.9','Add invitation mail for new accounts created in the back-end.','2023-10-28 07:00:10'),(80,'RainLab.User','script','1.3.0','users_add_guest_flag.php','2023-10-28 07:00:10'),(81,'RainLab.User','script','1.3.0','users_add_superuser_flag.php','2023-10-28 07:00:10'),(82,'RainLab.User','comment','1.3.0','Introduced guest user accounts.','2023-10-28 07:00:10'),(83,'RainLab.User','comment','1.3.1','User notification variables can now be extended.','2023-10-28 07:00:10'),(84,'RainLab.User','comment','1.3.2','Minor fix to the Auth::register method.','2023-10-28 07:00:10'),(85,'RainLab.User','comment','1.3.3','Allow prevention of concurrent user sessions via the user settings.','2023-10-28 07:00:10'),(86,'RainLab.User','comment','1.3.4','Added force secure protocol property to the account component.','2023-10-28 07:00:10'),(87,'RainLab.User','comment','1.4.0','The Notifications tab in User settings has been removed.','2023-10-28 07:00:10'),(88,'RainLab.User','comment','1.4.1','Added support for user impersonation.','2023-10-28 07:00:10'),(89,'RainLab.User','comment','1.4.2','Fixes security bug in Password Reset component.','2023-10-28 07:00:10'),(90,'RainLab.User','comment','1.4.3','Fixes session handling for AJAX requests.','2023-10-28 07:00:10'),(91,'RainLab.User','comment','1.4.4','Fixes bug where impersonation touches the last seen timestamp.','2023-10-28 07:00:10'),(92,'RainLab.User','comment','1.4.5','Added token fallback process to Account / Reset Password components when parameter is missing.','2023-10-28 07:00:10'),(93,'RainLab.User','comment','1.4.6','Fixes Auth::register method signature mismatch with core October CMS Auth library','2023-10-28 07:00:10'),(94,'RainLab.User','comment','1.4.7','Fixes redirect bug in Account component / Update translations and separate user and group management.','2023-10-28 07:00:10'),(95,'RainLab.User','comment','1.4.8','Fixes a bug where calling MailBlocker::removeBlock could remove all mail blocks for the user.','2023-10-28 07:00:10'),(96,'RainLab.User','comment','1.5.0','Required password length is now a minimum of 8 characters. Previous passwords will not be affected until the next password change.','2023-10-28 07:00:10'),(97,'RainLab.User','script','1.5.1','users_add_ip_address.php','2023-10-28 07:00:10'),(98,'RainLab.User','comment','1.5.1','User IP addresses are now logged. Introduce registration throttle.','2023-10-28 07:00:10'),(99,'RainLab.User','comment','1.5.2','Whitespace from usernames is now trimmed, allowed for username to be added to Reset Password mail templates.','2023-10-28 07:00:10'),(100,'RainLab.User','comment','1.5.3','Fixes a bug in the user update functionality if password is not changed. Added highlighting for banned users in user list.','2023-10-28 07:00:10'),(101,'RainLab.User','comment','1.5.4','Multiple translation improvements. Added view events to extend user preview and user listing toolbars.','2023-10-28 07:00:10'),(102,'RainLab.User','comment','1.5.5','Updated settings icon and description.','2023-10-28 07:00:10'),(103,'RainLab.User','comment','1.6.0','Apply persistence settings on activation and registration. Fixes last seen touched when impersonating. Fixes user suspension not clearing.','2023-10-28 07:00:10'),(104,'RainLab.User','comment','1.6.1','Adds component property for resetPage in ResetPassword component.','2023-10-28 07:00:10'),(105,'RainLab.User','comment','1.6.2','Improve support with October v3','2023-10-28 07:00:10'),(106,'RainLab.User','comment','1.6.3','Fixes mail blocker logic','2023-10-28 07:00:10'),(107,'RainLab.User','comment','1.6.4','Fixes bulk action button with October v3','2023-10-28 07:00:10'),(108,'RainLab.User','comment','1.7.0','Add password policy','2023-10-28 07:00:10'),(109,'RainLab.User','comment','1.7.1','Fixes compatibility with legacy sites','2023-10-28 07:00:10'),(110,'RainLab.User','comment','1.7.2','Stability fixes','2023-10-28 07:00:10'),(111,'RainLab.User','comment','2.0.0','Drops compatibility with October v1 and v2','2023-10-28 07:00:10'),(112,'RainLab.User','comment','2.1.0','Adds bearer token (JWT) support to session component','2023-10-28 07:00:10'),(113,'RainLab.Location','comment','1.0.1','Initialize plugin.','2023-10-28 07:00:40'),(114,'RainLab.Location','script','1.0.2','create_states_table.php','2023-10-28 07:00:40'),(115,'RainLab.Location','script','1.0.2','create_countries_table.php','2023-10-28 07:00:40'),(116,'RainLab.Location','comment','1.0.2','Create database tables.','2023-10-28 07:00:40'),(117,'RainLab.Location','script','1.0.3','seed_all_tables.php','2023-10-28 07:00:41'),(118,'RainLab.Location','script','1.0.3','seed_ar_states.php','2023-10-28 07:00:41'),(119,'RainLab.Location','script','1.0.3','seed_it_states.php','2023-10-28 07:00:42'),(120,'RainLab.Location','script','1.0.3','seed_ru_states.php','2023-10-28 07:00:42'),(121,'RainLab.Location','script','1.0.3','seed_at_states.php','2023-10-28 07:00:42'),(122,'RainLab.Location','script','1.0.3','seed_nl_states.php','2023-10-28 07:00:42'),(123,'RainLab.Location','script','1.0.3','seed_hr_states.php','2023-10-28 07:00:42'),(124,'RainLab.Location','script','1.0.3','seed_be_states.php','2023-10-28 07:00:42'),(125,'RainLab.Location','script','1.0.3','seed_pl_states.php','2023-10-28 07:00:42'),(126,'RainLab.Location','script','1.0.3','seed_dk_states.php','2023-10-28 07:00:42'),(127,'RainLab.Location','comment','1.0.3','Add seed data for countries and states.','2023-10-28 07:00:42'),(128,'RainLab.Location','comment','1.0.4','Satisfy the new Google API key requirement.','2023-10-28 07:00:42'),(129,'RainLab.Location','script','1.0.5','add_country_pinned_flag.php','2023-10-28 07:00:42'),(130,'RainLab.Location','comment','1.0.5','Countries can now be pinned to make them appear at the top of the list.','2023-10-28 07:00:42'),(131,'RainLab.Location','comment','1.0.6','Added support for defining a default country and state.','2023-10-28 07:00:42'),(132,'RainLab.Location','comment','1.0.7','Added basic geocoding method to the Country model.','2023-10-28 07:00:42'),(133,'RainLab.Location','comment','1.0.8','Include Mexico states','2023-10-28 07:00:42'),(134,'RainLab.Location','comment','1.1.0','Update requires Build 447. Fixed AddressFinder formwidget not working correctly in repeaters.','2023-10-28 07:00:42'),(135,'RainLab.Location','comment','1.1.1','Minor fix to AddressFinder formwidget for the change to the FormField API','2023-10-28 07:00:42'),(136,'RainLab.Location','comment','1.1.2','Yet another change to the AddressFinder for changes to the FormField API','2023-10-28 07:00:42'),(137,'RainLab.Location','comment','1.1.3','Include Argentina states','2023-10-28 07:00:42'),(138,'RainLab.Location','comment','1.1.4','Added support for UK counties','2023-10-28 07:00:42'),(139,'RainLab.Location','comment','1.1.5','Include Italian states (province)','2023-10-28 07:00:42'),(140,'RainLab.Location','script','1.1.6','add_enabled_states.php','2023-10-28 07:00:42'),(141,'RainLab.Location','comment','1.1.6','Added ability to disable specific states','2023-10-28 07:00:42'),(142,'RainLab.Location','comment','1.2.0','Fixes checkboxes in settings pages','2023-10-28 07:00:42'),(143,'RainLab.Location','script','1.2.1','add_country_callingcode.php','2023-10-28 07:00:42'),(144,'RainLab.Location','script','1.2.1','seed_callingcodes.php','2023-10-28 07:00:42'),(145,'RainLab.Location','comment','1.2.1','Add country calling codes','2023-10-28 07:00:42'),(146,'RainLab.Location','comment','1.2.2','Include Russian states','2023-10-28 07:00:42'),(147,'RainLab.Location','comment','1.2.3','Improve support with October v3','2023-10-28 07:00:42'),(148,'RainLab.Location','comment','1.2.4','Adds reverseStreetNumber option to address finder','2023-10-28 07:00:42'),(149,'RainLab.Location','comment','1.2.5','Fixes missing callback parameter on Google API','2023-10-28 07:00:42'),(150,'RainLab.Notify','script','1.0.1','create_notifications_table.php','2023-10-28 07:00:42'),(151,'RainLab.Notify','script','1.0.1','create_notification_rules_table.php','2023-10-28 07:00:42'),(152,'RainLab.Notify','script','1.0.1','create_rule_conditions_table.php','2023-10-28 07:00:42'),(153,'RainLab.Notify','script','1.0.1','create_rule_actions_table.php','2023-10-28 07:00:42'),(154,'RainLab.Notify','comment','1.0.1','First version of Notify','2023-10-28 07:00:42'),(155,'RainLab.Notify','comment','1.0.2','Fixes crashing bug.','2023-10-28 07:00:43'),(156,'RainLab.Notify','comment','1.0.3','Added Turkish & Russian translations, various bug fixes.','2023-10-28 07:00:43'),(157,'RainLab.Notify','comment','1.1.0','Fixes support for October CMS 2.0','2023-10-28 07:00:43'),(158,'RainLab.Notify','comment','1.1.1','Fixes missing template bug when saving notification rule','2023-10-28 07:00:43'),(159,'RainLab.Notify','comment','1.1.2','Fixes collisions with language keys in compose mail action','2023-10-28 07:00:43'),(160,'RainLab.Notify','comment','1.2.0','Adds delayed execution to actions','2023-10-28 07:00:43'),(161,'RainLab.Notify','comment','1.2.1','Improve support with October v3','2023-10-28 07:00:43'),(162,'RainLab.UserPlus','comment','1.0.1','First version of User Profile','2023-10-28 07:00:43'),(163,'RainLab.UserPlus','script','1.0.2','user_add_profile_fields.php','2023-10-28 07:00:43'),(164,'RainLab.UserPlus','script','1.0.2','user_add_location_fields.php','2023-10-28 07:00:43'),(165,'RainLab.UserPlus','comment','1.0.2','Reintroduce profile fields that were removed from User plugin','2023-10-28 07:00:43'),(166,'RainLab.UserPlus','script','1.0.3','user_add_mobile_field.php','2023-10-28 07:00:43'),(167,'RainLab.UserPlus','comment','1.0.3','Add mobile phone user profile field.','2023-10-28 07:00:43'),(168,'RainLab.UserPlus','comment','1.0.4','Add various languages and minor bug fixes.','2023-10-28 07:00:43'),(169,'RainLab.UserPlus','comment','1.1.0','Compatibility with Notify plugin.','2023-10-28 07:00:43'),(170,'RainLab.Pages','comment','1.0.1','Implemented the static pages management and the Static Page component.','2023-10-28 07:00:57'),(171,'RainLab.Pages','comment','1.0.2','Fixed the page preview URL.','2023-10-28 07:00:57'),(172,'RainLab.Pages','comment','1.0.3','Implemented menus.','2023-10-28 07:00:57'),(173,'RainLab.Pages','comment','1.0.4','Implemented the content block management and placeholder support.','2023-10-28 07:00:57'),(174,'RainLab.Pages','comment','1.0.5','Added support for the Sitemap plugin.','2023-10-28 07:00:57'),(175,'RainLab.Pages','comment','1.0.6','Minor updates to the internal API.','2023-10-28 07:00:57'),(176,'RainLab.Pages','comment','1.0.7','Added the Snippets feature.','2023-10-28 07:00:57'),(177,'RainLab.Pages','comment','1.0.8','Minor improvements to the code.','2023-10-28 07:00:57'),(178,'RainLab.Pages','comment','1.0.9','Fixes issue where Snippet tab is missing from the Partials form.','2023-10-28 07:00:57'),(179,'RainLab.Pages','comment','1.0.10','Add translations for various locales.','2023-10-28 07:00:57'),(180,'RainLab.Pages','comment','1.0.11','Fixes issue where placeholders tabs were missing from Page form.','2023-10-28 07:00:57'),(181,'RainLab.Pages','comment','1.0.12','Implement Media Manager support.','2023-10-28 07:00:57'),(182,'RainLab.Pages','comment','1.1.0','Adds meta title and description to pages. Adds |staticPage filter.','2023-10-28 07:00:57'),(183,'RainLab.Pages','comment','1.1.1','Add support for Syntax Fields.','2023-10-28 07:00:57'),(184,'RainLab.Pages','comment','1.1.2','Static Breadcrumbs component now respects the hide from navigation setting.','2023-10-28 07:00:57'),(185,'RainLab.Pages','comment','1.1.3','Minor back-end styling fix.','2023-10-28 07:00:57'),(186,'RainLab.Pages','comment','1.1.4','Minor fix to the StaticPage component API.','2023-10-28 07:00:57'),(187,'RainLab.Pages','comment','1.1.5','Fixes bug when using syntax fields.','2023-10-28 07:00:57'),(188,'RainLab.Pages','comment','1.1.6','Minor styling fix to the back-end UI.','2023-10-28 07:00:57'),(189,'RainLab.Pages','comment','1.1.7','Improved menu item form to include CSS class, open in a new window and hidden flag.','2023-10-28 07:00:57'),(190,'RainLab.Pages','comment','1.1.8','Improved the output of snippet partials when saved.','2023-10-28 07:00:57'),(191,'RainLab.Pages','comment','1.1.9','Minor update to snippet inspector internal API.','2023-10-28 07:00:57'),(192,'RainLab.Pages','comment','1.1.10','Fixes a bug where selecting a layout causes permanent unsaved changes.','2023-10-28 07:00:57'),(193,'RainLab.Pages','comment','1.1.11','Add support for repeater syntax field.','2023-10-28 07:00:57'),(194,'RainLab.Pages','comment','1.2.0','Added support for translations, UI updates.','2023-10-28 07:00:57'),(195,'RainLab.Pages','comment','1.2.1','Use nice titles when listing the content files.','2023-10-28 07:00:57'),(196,'RainLab.Pages','comment','1.2.2','Minor styling update.','2023-10-28 07:00:57'),(197,'RainLab.Pages','comment','1.2.3','Snippets can now be moved by dragging them.','2023-10-28 07:00:57'),(198,'RainLab.Pages','comment','1.2.4','Fixes a bug where the cursor is misplaced when editing text files.','2023-10-28 07:00:57'),(199,'RainLab.Pages','comment','1.2.5','Fixes a bug where the parent page is lost upon changing a page layout.','2023-10-28 07:00:57'),(200,'RainLab.Pages','comment','1.2.6','Shared view variables are now passed to static pages.','2023-10-28 07:00:57'),(201,'RainLab.Pages','comment','1.2.7','Fixes issue with duplicating properties when adding multiple snippets on the same page.','2023-10-28 07:00:57'),(202,'RainLab.Pages','comment','1.2.8','Fixes a bug where creating a content block without extension doesn\'t save the contents to file.','2023-10-28 07:00:57'),(203,'RainLab.Pages','comment','1.2.9','Add conditional support for translating page URLs.','2023-10-28 07:00:57'),(204,'RainLab.Pages','comment','1.2.10','Streamline generation of URLs to use the new Cms::url helper.','2023-10-28 07:00:57'),(205,'RainLab.Pages','comment','1.2.11','Implements repeater usage with translate plugin.','2023-10-28 07:00:57'),(206,'RainLab.Pages','comment','1.2.12','Fixes minor issue when using snippets and switching the application locale.','2023-10-28 07:00:57'),(207,'RainLab.Pages','comment','1.2.13','Fixes bug when AJAX is used on a page that does not yet exist.','2023-10-28 07:00:57'),(208,'RainLab.Pages','comment','1.2.14','Add theme logging support for changes made to menus.','2023-10-28 07:00:57'),(209,'RainLab.Pages','comment','1.2.15','Back-end navigation sort order updated.','2023-10-28 07:00:57'),(210,'RainLab.Pages','comment','1.2.16','Fixes a bug when saving a template that has been modified outside of the CMS (mtime mismatch).','2023-10-28 07:00:57'),(211,'RainLab.Pages','comment','1.2.17','Changes locations of custom fields to secondary tabs instead of the primary Settings area. New menu search ability on adding menu items','2023-10-28 07:00:57'),(212,'RainLab.Pages','comment','1.2.18','Fixes cache-invalidation issues when RainLab.Translate is not installed. Added Greek & Simplified Chinese translations. Removed deprecated calls. Allowed saving HTML in snippet properties. Added support for the MediaFinder in menu items.','2023-10-28 07:00:57'),(213,'RainLab.Pages','comment','1.2.19','Catch exception with corrupted menu file.','2023-10-28 07:00:57'),(214,'RainLab.Pages','comment','1.2.20','StaticMenu component now exposes menuName property; added pages.menu.referencesGenerated event.','2023-10-28 07:00:57'),(215,'RainLab.Pages','comment','1.2.21','Fixes a bug where last Static Menu item cannot be deleted. Improved Persian, Slovak and Turkish translations.','2023-10-28 07:00:57'),(216,'RainLab.Pages','comment','1.3.0','Added support for using Database-driven Themes when enabled in the CMS configuration.','2023-10-28 07:00:57'),(217,'RainLab.Pages','comment','1.3.1','Added ChildPages Component, prevent hidden pages from being returned via menu item resolver.','2023-10-28 07:00:57'),(218,'RainLab.Pages','comment','1.3.2','Fixes error when creating a subpage whose parent has no layout set.','2023-10-28 07:00:57'),(219,'RainLab.Pages','comment','1.3.3','Improves user experience for users with only partial access through permissions','2023-10-28 07:00:57'),(220,'RainLab.Pages','comment','1.3.4','Fix error where large menus were being truncated due to the PHP \"max_input_vars\" configuration value. Improved Slovenian translation.','2023-10-28 07:00:57'),(221,'RainLab.Pages','comment','1.3.5','Minor fix to bust the browser cache for JS assets. Prevent duplicate property fields in snippet inspector.','2023-10-28 07:00:57'),(222,'RainLab.Pages','comment','1.3.6','ChildPages component now displays localized page titles from Translate plugin.','2023-10-28 07:00:57'),(223,'RainLab.Pages','comment','1.3.7','Adds MenuPicker formwidget. Adds future support for v2.0 of October CMS.','2023-10-28 07:00:57'),(224,'RainLab.Pages','comment','1.4.0','Fixes bug when adding menu items in October CMS v2.0.','2023-10-28 07:00:57'),(225,'RainLab.Pages','comment','1.4.1','Fixes support for configuration values.','2023-10-28 07:00:57'),(226,'RainLab.Pages','comment','1.4.3','Fixes page deletion is newer platform builds.','2023-10-28 07:00:57'),(227,'RainLab.Pages','comment','1.4.4','Disable touch device detection','2023-10-28 07:00:57'),(228,'RainLab.Pages','comment','1.4.5','Minor styling improvements','2023-10-28 07:00:57'),(229,'RainLab.Pages','comment','1.4.6','Minor styling improvements','2023-10-28 07:00:57'),(230,'RainLab.Pages','comment','1.4.7','Minor layout fix in the Page editor','2023-10-28 07:00:57'),(231,'RainLab.Pages','comment','1.4.8','Fixes rich editor usage inside repeaters. Adds getProcessedMarkup event.','2023-10-28 07:00:57'),(232,'RainLab.Pages','comment','1.4.9','Fixes a lifecycle issue when switching the page layout.','2023-10-28 07:00:57'),(233,'RainLab.Pages','comment','1.4.10','Fixes maintenance mode when using static pages.','2023-10-28 07:00:57'),(234,'RainLab.Pages','comment','1.4.11','Adds type hidden to content placeholders.','2023-10-28 07:00:57'),(235,'RainLab.Pages','comment','1.4.12','Improve support with October v2.2','2023-10-28 07:00:57'),(236,'RainLab.Pages','comment','1.5.0','Improve support with October v3.0','2023-10-28 07:00:57'),(237,'RainLab.Pages','comment','1.5.4','Compatibility updates','2023-10-28 07:00:57'),(238,'RainLab.Pages','comment','1.5.5','Fixes media finder added to menu in October v2','2023-10-28 07:00:57'),(239,'RainLab.Pages','comment','1.5.6','Fixes concurrency save form in October v3','2023-10-28 07:00:57'),(240,'RainLab.Pages','comment','1.5.7','Adds page finder support for October v3.2','2023-10-28 07:00:57'),(241,'RainLab.Pages','comment','1.5.8','Fixes resolving links used in static pages','2023-10-28 07:00:57'),(242,'RainLab.Pages','comment','1.5.9','Fixes fancy layout with nested forms','2023-10-28 07:00:57'),(243,'RainLab.Pages','comment','1.5.10','Adds forward compatibility with October CMS v3.4','2023-10-28 07:00:57'),(244,'RainLab.Pages','comment','1.5.12','Fixes more areas of forward compatibility','2023-10-28 07:00:57'),(245,'RainLab.Pages','comment','2.0.1','Compatibility with core snippets','2023-10-28 07:00:57'),(246,'RainLab.Pages','comment','2.0.2','Fixes bug opening menu with tailor list menu items','2023-10-28 07:00:57'),(247,'RainLab.Pages','comment','2.0.3','Fixes bug showing wrong placeholder code','2023-10-28 07:00:57'),(248,'OFFLINE.SiteSearch','comment','1.0.1','First version of SiteSearch','2023-10-28 07:01:07'),(249,'OFFLINE.SiteSearch','comment','1.0.2','Added experimental CMS pages results provider','2023-10-28 07:01:07'),(250,'OFFLINE.SiteSearch','comment','1.0.3','Added missing component','2023-10-28 07:01:07'),(251,'OFFLINE.SiteSearch','comment','1.0.4','Added support for RadiantWeb.ProBlog','2023-10-28 07:01:07'),(252,'OFFLINE.SiteSearch','comment','1.0.5','Moved configuration to the backend','2023-10-28 07:01:07'),(253,'OFFLINE.SiteSearch','comment','1.0.6','Fixed hardcoded url in pagination','2023-10-28 07:01:07'),(254,'OFFLINE.SiteSearch','comment','1.0.7','Add function for getting last page number (Thanks to vojtasvoboda)','2023-10-28 07:01:07'),(255,'OFFLINE.SiteSearch','comment','1.0.8','Add cs_CZ locale (Thanks to vojtasvoboda)','2023-10-28 07:01:07'),(256,'OFFLINE.SiteSearch','comment','1.0.9','Added support for ArrizalAmin.Portfolio plugin','2023-10-28 07:01:07'),(257,'OFFLINE.SiteSearch','comment','1.0.10','Removed unused component','2023-10-28 07:01:07'),(258,'OFFLINE.SiteSearch','comment','1.1.0','Added support for translated contents in RainLab.Pages, ArrizalAmin.Portfolio and RadiantWeb.ProBlog','2023-10-28 07:01:07'),(259,'OFFLINE.SiteSearch','comment','1.1.0','Fixed bug where RainLab.Pages results were displayed twice','2023-10-28 07:01:07'),(260,'OFFLINE.SiteSearch','comment','1.1.0','Honor disabled plugins setting','2023-10-28 07:01:07'),(261,'OFFLINE.SiteSearch','comment','1.1.0','Generate absolute URLs in search results by default','2023-10-28 07:01:07'),(262,'OFFLINE.SiteSearch','comment','1.1.1','Added optimized siteSearchInclude component for cms pages search','2023-10-28 07:01:07'),(263,'OFFLINE.SiteSearch','comment','1.1.2','Fixed backend permissions','2023-10-28 07:01:07'),(264,'OFFLINE.SiteSearch','comment','1.1.3','Added ru_RU locale (Thanks to mokeev1995)','2023-10-28 07:01:07'),(265,'OFFLINE.SiteSearch','comment','1.2.1','Added support for Feegleweb.Octoshop (Thanks to billyzduke)','2023-10-28 07:01:07'),(266,'OFFLINE.SiteSearch','comment','1.2.1','Refactored search providers and results page','2023-10-28 07:01:07'),(267,'OFFLINE.SiteSearch','comment','1.2.2','Minor bugfix in Feegleweb.Octoshop settings page translation','2023-10-28 07:01:07'),(268,'OFFLINE.SiteSearch','comment','1.2.3','Fixed bug where the search results sometimes broke the page layout','2023-10-28 07:01:07'),(269,'OFFLINE.SiteSearch','comment','1.2.4','Fixed bug where unavailable thumbnails lead to an error','2023-10-28 07:01:07'),(270,'OFFLINE.SiteSearch','comment','1.2.5','Fixed bug where the provider badge is not displayed for custom search providers','2023-10-28 07:01:07'),(271,'OFFLINE.SiteSearch','comment','1.2.6','Added support for Responsiv.Showcase (Thanks to MichiReich)','2023-10-28 07:01:07'),(272,'OFFLINE.SiteSearch','comment','1.2.7','Fixed bug where custom url settings were ignored in search results for some providers','2023-10-28 07:01:07'),(273,'OFFLINE.SiteSearch','comment','1.2.8','Added support for viewBag properties in RainLab.Pages','2023-10-28 07:01:07'),(274,'OFFLINE.SiteSearch','comment','1.2.9','Added support for static page component hosts','2023-10-28 07:01:07'),(275,'OFFLINE.SiteSearch','comment','1.2.10','Added support for multiple variables in Rainlab.Blog urls (Thanks to graker)','2023-10-28 07:01:07'),(276,'OFFLINE.SiteSearch','comment','1.2.11','Optimized handling of multibyte strings','2023-10-28 07:01:07'),(277,'OFFLINE.SiteSearch','comment','1.2.12','Added support for Jiri.Jkshop','2023-10-28 07:01:07'),(278,'OFFLINE.SiteSearch','comment','1.2.13','Minor bugfixes for marked queries in search results and Rainlab.Blog provider (Thanks to graker)','2023-10-28 07:01:07'),(279,'OFFLINE.SiteSearch','comment','1.2.14','Fixed bug in Jiri.JKShop provider','2023-10-28 07:01:07'),(280,'OFFLINE.SiteSearch','comment','1.2.15','Added a new meta property for search results (thanks to cracki)','2023-10-28 07:01:07'),(281,'OFFLINE.SiteSearch','comment','1.2.16','Added Persian (Farsi) translations (thanks to cracki)','2023-10-28 07:01:07'),(282,'OFFLINE.SiteSearch','comment','1.2.17','Added support for Indikator.News (thanks to gergo85)','2023-10-28 07:01:07'),(283,'OFFLINE.SiteSearch','comment','1.2.18','Fixed bug where titles of static pages where not searched (thanks to beenen445)','2023-10-28 07:01:07'),(284,'OFFLINE.SiteSearch','comment','1.2.19','Added support for OFFLINE.SnipcartShop','2023-10-28 07:01:07'),(285,'OFFLINE.SiteSearch','comment','1.2.20','Added support for VojtaSvoboda.Brands (thanks to vojtasvoboda)','2023-10-28 07:01:07'),(286,'OFFLINE.SiteSearch','comment','1.2.21','Added Portuguese translations (thanks to ribsousa)','2023-10-28 07:01:07'),(287,'OFFLINE.SiteSearch','comment','1.2.22','Fixed Portuguese translations','2023-10-28 07:01:07'),(288,'OFFLINE.SiteSearch','comment','1.2.23','Fixed support for translated Rainlab.Blog contents','2023-10-28 07:01:07'),(289,'OFFLINE.SiteSearch','comment','1.2.24','Added composer.json to allow loading plugin as dependency (thanks to adduc)','2023-10-28 07:01:07'),(290,'OFFLINE.SiteSearch','comment','1.2.25','Fixed bug that sometimes lead to broken html in search results (thanks to graker)','2023-10-28 07:01:07'),(291,'OFFLINE.SiteSearch','comment','1.2.26','Exclude hidden static pages from search results (thanks to plyusninva)','2023-10-28 07:01:07'),(292,'OFFLINE.SiteSearch','comment','1.2.27','Added support for Graker.PhotoAlbums (thanks to graker)','2023-10-28 07:01:07'),(293,'OFFLINE.SiteSearch','comment','1.2.28','Added new result.identifier property','2023-10-28 07:01:07'),(294,'OFFLINE.SiteSearch','comment','1.2.29','Optimized thumbnail generation for Graker.PhotoAlbums results (thanks to graker)','2023-10-28 07:01:07'),(295,'OFFLINE.SiteSearch','comment','1.2.30','The searchResults component\'s resultsCollection is now publically accessible','2023-10-28 07:01:07'),(296,'OFFLINE.SiteSearch','comment','1.2.31','Added model property for each search result to retreive the original model the result was generated from','2023-10-28 07:01:07'),(297,'OFFLINE.SiteSearch','comment','1.2.32','Added support for custom ResultsProvider classes','2023-10-28 07:01:07'),(298,'OFFLINE.SiteSearch','comment','1.2.33','Fix the use of multiple custom ResultsProvider for a plugin','2023-10-28 07:01:07'),(299,'OFFLINE.SiteSearch','comment','1.3.1','Added new searchInput component with search-as-you-type feature','2023-10-28 07:01:07'),(300,'OFFLINE.SiteSearch','comment','1.3.2','Fixed bug in AutoCompleteComponent','2023-10-28 07:01:07'),(301,'OFFLINE.SiteSearch','comment','1.3.3','!!! All results are now returned with a relative URL to prevent problems with translated contents. Make sure to pass your result.url throught the \"app\" filter if you are using your own search result partials','2023-10-28 07:01:07'),(302,'OFFLINE.SiteSearch','comment','1.3.4','Fixed undefined index error when a static page doesn\'t have a title set','2023-10-28 07:01:07'),(303,'OFFLINE.SiteSearch','comment','1.3.5','Added ability to edit the user\'s query before searching','2023-10-28 07:01:07'),(304,'OFFLINE.SiteSearch','comment','1.3.6','!!! Using RadiantWeb.ProBlog\'s internal settings to get the correct parent page for a blog post result. This enables support for multiple blogs on the same website. If your blog search results have wrong URLs after this update make sure to configure your default page for rendering blog posts via the ProBlog backend settings.','2023-10-28 07:01:07'),(305,'OFFLINE.SiteSearch','comment','1.3.7','Added the ability to add age penalties to search results. This can be used to show newer results higher up in your search results.','2023-10-28 07:01:07'),(306,'OFFLINE.SiteSearch','comment','1.3.8','Optimized support for multiple SearchInput components on a single page.','2023-10-28 07:01:07'),(307,'OFFLINE.SiteSearch','comment','1.3.9','Added Chinese language support (thanks to Ckend)','2023-10-28 07:01:07'),(308,'OFFLINE.SiteSearch','comment','1.3.10','Fixed link to search result in default results partial (thanks to wizzard94)','2023-10-28 07:01:07'),(309,'OFFLINE.SiteSearch','comment','1.3.11','Trim query before searching','2023-10-28 07:01:07'),(310,'OFFLINE.SiteSearch','comment','1.3.12','Stability improvements','2023-10-28 07:01:07'),(311,'OFFLINE.SiteSearch','comment','1.3.13','Pre-populate search query in searchInput field','2023-10-28 07:01:07'),(312,'OFFLINE.SiteSearch','comment','1.3.14','Include placeholders on Rainlab.Pages pages in search results','2023-10-28 07:01:07'),(313,'OFFLINE.SiteSearch','comment','1.3.15','Catch invalid markup errors when searching RainLab.Pages','2023-10-28 07:01:07'),(314,'OFFLINE.SiteSearch','comment','1.3.16','Only search RainLab.Blog contents of current locale','2023-10-28 07:01:07'),(315,'OFFLINE.SiteSearch','comment','1.3.17','Fixed pagination links when using RainLab.Translate','2023-10-28 07:01:07'),(316,'OFFLINE.SiteSearch','comment','1.3.18','Updated persian translations (thanks to @sajjad-ser)','2023-10-28 07:01:07'),(317,'OFFLINE.SiteSearch','comment','1.3.19','Added finnish translations (thank to @mediaclinic)','2023-10-28 07:01:07'),(318,'OFFLINE.SiteSearch','comment','1.3.20','Added bulgarian translations (thank to @NGavanozov)','2023-10-28 07:01:07'),(319,'OFFLINE.SiteSearch','comment','1.3.21','Fixed RainLab.Blog published_at date handling','2023-10-28 07:01:07'),(320,'OFFLINE.SiteSearch','comment','1.3.22','Fixed problem with queries that contain only spaces','2023-10-28 07:01:07'),(321,'OFFLINE.SiteSearch','comment','1.4.0','SiteSearch can now log all search queries. Enable via backend settings.','2023-10-28 07:01:07'),(322,'OFFLINE.SiteSearch','script','1.4.1','create_offline_sitesearch_query_logs.php','2023-10-28 07:01:07'),(323,'OFFLINE.SiteSearch','comment','1.4.1','Minor bugfixes','2023-10-28 07:01:07'),(324,'OFFLINE.SiteSearch','comment','1.4.2','Added User-Agent to list view','2023-10-28 07:01:07'),(325,'OFFLINE.SiteSearch','comment','1.4.3','Fixed bug where empty queries resulted in an Exception','2023-10-28 07:01:07'),(326,'OFFLINE.SiteSearch','comment','1.4.4','Optimized support for cms pages search: Your Twig markup is now completely rendered and searched!','2023-10-28 07:01:07'),(327,'OFFLINE.SiteSearch','comment','1.4.5','Use meta_title for RainLab.Pages results if available','2023-10-28 07:01:07'),(328,'OFFLINE.SiteSearch','comment','1.4.6','Made getAgePenalty method static so it can be re-used in simple Event providers','2023-10-28 07:01:07'),(329,'OFFLINE.SiteSearch','comment','1.4.7','Optimized searchResults component so it can be used in partials and static pages','2023-10-28 07:01:07'),(330,'OFFLINE.SiteSearch','comment','1.4.8','Allow custom penalty parameters in ResultsProvider::agePenaltyForDays method','2023-10-28 07:01:07'),(331,'OFFLINE.SiteSearch','comment','1.4.9','Moved query log link from main navbar to backend settings','2023-10-28 07:01:07'),(332,'OFFLINE.SiteSearch','comment','1.4.10','Improved Czech translations','2023-10-28 07:01:07'),(333,'OFFLINE.SiteSearch','comment','1.5.0','Added `offline.sitesearch.results` event to allow customization (filter, sort) of the results collection before it is displayed','2023-10-28 07:01:07'),(334,'OFFLINE.SiteSearch','comment','1.5.1','Fixed typo in the newly added event name','2023-10-28 07:01:07'),(335,'OFFLINE.SiteSearch','comment','1.5.2','Made Result::markQuery method public for easier extension','2023-10-28 07:01:07'),(336,'OFFLINE.SiteSearch','comment','1.5.3','Fixed result order in searchInput component','2023-10-28 07:01:07'),(337,'OFFLINE.SiteSearch','comment','1.5.4','Fixed handling of invalid page url parameter','2023-10-28 07:01:07'),(338,'OFFLINE.SiteSearch','comment','1.5.5','Fixed handling of invalid offline.sitesearch.results event returns','2023-10-28 07:01:07'),(339,'OFFLINE.SiteSearch','comment','1.5.6','Updated russian translations (thanks to @Web-VPF)','2023-10-28 07:01:07'),(340,'OFFLINE.SiteSearch','comment','1.6.0','Updated October 3 compatibility','2023-10-28 07:01:07'),(341,'OFFLINE.SiteSearch','comment','1.6.1','Optimized RainLab pages search (thanks to @damsfx)','2023-10-28 07:01:07'),(342,'OFFLINE.SiteSearch','comment','1.6.2','Updated chinese translations (thanks to @ZhiweiWu0425)','2023-10-28 07:01:07'),(343,'OFFLINE.SiteSearch','comment','1.6.3','Added query and controller parameters to offline.sitesearch.extend event (thanks to @rvschuilenburg)','2023-10-28 07:01:07'),(344,'OFFLINE.SiteSearch','comment','1.6.4','Fixed static pages search when using multiple syntax fields (thanks to @damsfx)','2023-10-28 07:01:07'),(345,'OFFLINE.SiteSearch','comment','1.6.5','Only show search providers of installed plugins in the backend settings (thanks to @damsfx)','2023-10-28 07:01:07'),(346,'OFFLINE.SiteSearch','comment','1.6.6','Fixed bug in backend settings form (thanks to @igor-tv)','2023-10-28 07:01:07'),(347,'OFFLINE.SiteSearch','comment','1.7.0','Added native support for Tailor content','2023-10-28 07:01:07'),(348,'OFFLINE.SiteSearch','comment','1.7.1','Fixed version check for Tailor support','2023-10-28 07:01:07'),(349,'OFFLINE.SiteSearch','comment','1.7.2','Added support to search in \"groups\" fields in Tailor','2023-10-28 07:01:07'),(350,'OFFLINE.SiteSearch','comment','1.7.3','Fixed bug where only first matching Tailor blueprint returned results','2023-10-28 07:01:07'),(351,'OFFLINE.SiteSearch','comment','1.7.4','Added Tailor models to search results','2023-10-28 07:01:07'),(352,'OFFLINE.SiteSearch','comment','1.7.5','Fixed visibility class on searchInput component','2023-10-28 07:01:07'),(353,'OFFLINE.SiteSearch','comment','1.7.6','Leave additional setting fields that are added by the user to the backend settings from untouched','2023-10-28 07:01:07'),(354,'OFFLINE.SiteSearch','comment','1.7.8','Fixed locale prefix in search results','2023-10-28 07:01:07'),(355,'OFFLINE.SiteSearch','comment','1.7.9','Added minQueryLength parameter to searchResults component','2023-10-28 07:01:07'),(356,'OFFLINE.SiteSearch','comment','1.7.10','Always prefer forced query in searchResults component','2023-10-28 07:01:07'),(357,'OFFLINE.SiteSearch','comment','1.7.11','Fixed search call','2023-10-28 07:01:07'),(358,'OFFLINE.SiteSearch','comment','1.7.12','Added thumbFrom field to Tailor search results','2023-10-28 07:01:07'),(359,'OFFLINE.SiteSearch','comment','1.7.13','Updated RU translations (thanks to @point111)','2023-10-28 07:01:07'),(360,'OFFLINE.SiteSearch','comment','1.7.14','Fixed compatibility issue with RainLab.Translate 2.0 (thanks to @aarondiel)','2023-10-28 07:01:07'),(361,'OFFLINE.SiteSearch','comment','1.7.15','Fixed bug in cms results provider (thanks to @PubliAlex)','2023-10-28 07:01:07'),(362,'OFFLINE.SiteSearch','comment','1.7.16','Fixed URL generation when using Multisite','2023-10-28 07:01:07'),(363,'OFFLINE.Mall','script','1.0.0','create_offline_mall_products.php','2023-10-28 07:01:29'),(364,'OFFLINE.Mall','script','1.0.0','create_offline_mall_product_variants.php','2023-10-28 07:01:29'),(365,'OFFLINE.Mall','script','1.0.0','create_offline_mall_product_accessory.php','2023-10-28 07:01:29'),(366,'OFFLINE.Mall','script','1.0.0','create_offline_mall_custom_fields.php','2023-10-28 07:01:29'),(367,'OFFLINE.Mall','script','1.0.0','create_offline_mall_custom_field_options.php','2023-10-28 07:01:29'),(368,'OFFLINE.Mall','script','1.0.0','create_offline_mall_categories.php','2023-10-28 07:01:29'),(369,'OFFLINE.Mall','script','1.0.0','create_offline_mall_taxes.php','2023-10-28 07:01:29'),(370,'OFFLINE.Mall','script','1.0.0','create_offline_mall_product_tax.php','2023-10-28 07:01:29'),(371,'OFFLINE.Mall','script','1.0.0','create_offline_mall_carts.php','2023-10-28 07:01:29'),(372,'OFFLINE.Mall','script','1.0.0','create_offline_mall_cart_products.php','2023-10-28 07:01:29'),(373,'OFFLINE.Mall','script','1.0.0','create_offline_mall_shipping_methods.php','2023-10-28 07:01:29'),(374,'OFFLINE.Mall','script','1.0.0','create_offline_mall_shipping_method_tax.php','2023-10-28 07:01:29'),(375,'OFFLINE.Mall','script','1.0.0','create_offline_mall_country_tax.php','2023-10-28 07:01:29'),(376,'OFFLINE.Mall','script','1.0.0','create_offline_mall_shipping_method_rates.php','2023-10-28 07:01:29'),(377,'OFFLINE.Mall','script','1.0.0','create_offline_mall_cart_custom_field_value.php','2023-10-28 07:01:29'),(378,'OFFLINE.Mall','script','1.0.0','create_offline_mall_discounts.php','2023-10-28 07:01:29'),(379,'OFFLINE.Mall','script','1.0.0','create_offline_mall_cart_discount.php','2023-10-28 07:01:29'),(380,'OFFLINE.Mall','script','1.0.0','create_offline_mall_orders.php','2023-10-28 07:01:29'),(381,'OFFLINE.Mall','script','1.0.0','create_offline_mall_order_products.php','2023-10-28 07:01:29'),(382,'OFFLINE.Mall','script','1.0.0','create_offline_mall_addresses.php','2023-10-28 07:01:29'),(383,'OFFLINE.Mall','script','1.0.0','create_offline_mall_customers.php','2023-10-28 07:01:29'),(384,'OFFLINE.Mall','script','1.0.0','create_offline_mall_shipping_countries.php','2023-10-28 07:01:29'),(385,'OFFLINE.Mall','script','1.0.0','create_offline_mall_payments_log.php','2023-10-28 07:01:29'),(386,'OFFLINE.Mall','script','1.0.0','create_offline_mall_payment_methods.php','2023-10-28 07:01:29'),(387,'OFFLINE.Mall','script','1.0.0','create_offline_mall_payment_method_tax.php','2023-10-28 07:01:29'),(388,'OFFLINE.Mall','script','1.0.0','create_offline_mall_product_custom_field.php','2023-10-28 07:01:29'),(389,'OFFLINE.Mall','script','1.0.0','create_offline_mall_properties.php','2023-10-28 07:01:29'),(390,'OFFLINE.Mall','script','1.0.0','create_offline_mall_property_values.php','2023-10-28 07:01:29'),(391,'OFFLINE.Mall','script','1.0.0','create_offline_mall_order_states.php','2023-10-28 07:01:29'),(392,'OFFLINE.Mall','script','1.0.0','create_offline_mall_brands.php','2023-10-28 07:01:29'),(393,'OFFLINE.Mall','script','1.0.0','create_offline_mall_image_sets.php','2023-10-28 07:01:29'),(394,'OFFLINE.Mall','script','1.0.0','create_offline_mall_property_property_group.php','2023-10-28 07:01:29'),(395,'OFFLINE.Mall','script','1.0.0','create_offline_mall_property_groups.php','2023-10-28 07:01:29'),(396,'OFFLINE.Mall','script','1.0.0','create_offline_mall_category_property_group.php','2023-10-28 07:01:29'),(397,'OFFLINE.Mall','script','1.0.0','create_offline_mall_customer_groups.php','2023-10-28 07:01:29'),(398,'OFFLINE.Mall','script','1.0.0','create_offline_mall_customer_group_prices.php','2023-10-28 07:01:29'),(399,'OFFLINE.Mall','script','1.0.0','create_offline_mall_price_categories.php','2023-10-28 07:01:29'),(400,'OFFLINE.Mall','script','1.0.0','create_offline_mall_prices.php','2023-10-28 07:01:29'),(401,'OFFLINE.Mall','script','1.0.0','create_offline_mall_product_prices.php','2023-10-28 07:01:30'),(402,'OFFLINE.Mall','script','1.0.0','create_offline_mall_category_product_sort_order.php','2023-10-28 07:01:30'),(403,'OFFLINE.Mall','script','1.0.0','create_offline_mall_currencies.php','2023-10-28 07:01:30'),(404,'OFFLINE.Mall','script','1.0.0','allow_non_unique_emails_for_rainlab_user.php','2023-10-28 07:01:30'),(405,'OFFLINE.Mall','script','1.0.0','add_customer_group_id_to_rainlab_users.php','2023-10-28 07:01:30'),(406,'OFFLINE.Mall','script','1.0.0','create_offline_mall_notifications.php','2023-10-28 07:01:30'),(407,'OFFLINE.Mall','script','1.0.0','database_seeder.php','2023-10-28 07:01:30'),(408,'OFFLINE.Mall','comment','1.0.0','First public release','2023-10-28 07:01:30'),(409,'OFFLINE.Mall','comment','1.0.2','Fixed event handler for welcome email','2023-10-28 07:01:30'),(410,'OFFLINE.Mall','comment','1.0.3','Fixed build problems','2023-10-28 07:01:30'),(411,'OFFLINE.Mall','comment','1.0.4','Added russian translations (thanks to @HomaEEE)','2023-10-28 07:01:30'),(412,'OFFLINE.Mall','comment','1.0.5','Optimized SQLite support','2023-10-28 07:01:30'),(413,'OFFLINE.Mall','comment','1.0.6','Minor bugfixes','2023-10-28 07:01:30'),(414,'OFFLINE.Mall','comment','1.0.7','Added \"on sale\" filter option to products filter component (run php artisan mall:reindex to get this feature)','2023-10-28 07:01:30'),(415,'OFFLINE.Mall','comment','1.0.8','Optimized handling of manually created customer accounts','2023-10-28 07:01:30'),(416,'OFFLINE.Mall','comment','1.0.9','Added option to force filter string for Products component (https://offline-gmbh.github.io/oc-mall-plugin/components/products.html#filter-string)','2023-10-28 07:01:30'),(417,'OFFLINE.Mall','comment','1.0.10','Fixed usage of single Category as menu item (thanks to @PrestaSafe)','2023-10-28 07:01:30'),(418,'OFFLINE.Mall','comment','1.0.11','Fixed handling of 0 as price value (thanks to @ajsaces)','2023-10-28 07:01:30'),(419,'OFFLINE.Mall','comment','1.0.12','Allow Products component without category filter (thanks to @amdad)','2023-10-28 07:01:30'),(420,'OFFLINE.Mall','script','1.0.13','allow_non_unique_emails_for_rainlab_user.php','2023-10-28 07:01:30'),(421,'OFFLINE.Mall','comment','1.0.13','Fixed signup for guest accounts','2023-10-28 07:01:30'),(422,'OFFLINE.Mall','comment','1.0.14','Minor improvements to Cart and Products components','2023-10-28 07:01:30'),(423,'OFFLINE.Mall','script','1.0.15','add_description_field_to_category.php','2023-10-28 07:01:30'),(424,'OFFLINE.Mall','comment','1.0.15','Added description field to Category model','2023-10-28 07:01:30'),(425,'OFFLINE.Mall','comment','1.0.16','Fixed manage shipping methods permissions','2023-10-28 07:01:30'),(426,'OFFLINE.Mall','comment','1.0.17','Auto update price display when custom field options are changed','2023-10-28 07:01:30'),(427,'OFFLINE.Mall','comment','1.0.18','Minor bugfixes and improvements','2023-10-28 07:01:30'),(428,'OFFLINE.Mall','comment','1.0.19','Minor bugfixes and improvements','2023-10-28 07:01:30'),(429,'OFFLINE.Mall','comment','1.0.20','Optimized handling of customer group specific prices','2023-10-28 07:01:30'),(430,'OFFLINE.Mall','comment','1.0.21','Optimized RainLab.Translate integration (thanks to @alxy)','2023-10-28 07:01:30'),(431,'OFFLINE.Mall','comment','1.0.22','Updated Omnipay to v3, added list views for payment logs and customer addresses. If you have custom payment providers that use Omnipay make sure that they are compatible with v3 before updating','2023-10-28 07:01:30'),(432,'OFFLINE.Mall','script','1.1.0','migrate_categories_to_belongs_to_many_relation.php','2023-10-28 07:01:30'),(433,'OFFLINE.Mall','comment','1.1.0','\"!!! A product can now belong to multiple categories. If you are using the `$product->category`\nrelationship directly make sure to update it to use the new `$product->categories` relationship.\nExisting products will be migrated to the new database structure during this update.\"\n','2023-10-28 07:01:30'),(434,'OFFLINE.Mall','script','1.1.1','handle_index_table.php','2023-10-28 07:01:30'),(435,'OFFLINE.Mall','comment','1.1.1','\"!!! New database-backed index. To increase the performance of this plugin the product index can now be\nstored in the database if you use MySQL 5.7+ or MariaDB 10.2+ (support will be auto-detected).\nAfter this update your index will have to be rebuilt by running \"php artisan mall:reindex\" from the terminal.\nBetween the completition of the update and the re-indexing your store will be empty!\nMake sure to consider this downtime when deploying to a production system.\"\n','2023-10-28 07:01:30'),(436,'OFFLINE.Mall','comment','1.1.2','Fixed manual sort orders when using new table-backed index','2023-10-28 07:01:30'),(437,'OFFLINE.Mall','comment','1.1.3','Further improved MySQL 5.7 compatibility','2023-10-28 07:01:30'),(438,'OFFLINE.Mall','comment','1.1.4','Fixed bug in mall:check command','2023-10-28 07:01:30'),(439,'OFFLINE.Mall','script','1.1.5','use_text_columns_for_variant_names.php','2023-10-28 07:01:30'),(440,'OFFLINE.Mall','comment','1.1.5','Added simple scoreboard to Orders page, fixed problem with very long variant names','2023-10-28 07:01:30'),(441,'OFFLINE.Mall','comment','1.1.6','Fixed display of subcategories in Rainlab.Pages menus','2023-10-28 07:01:30'),(442,'OFFLINE.Mall','comment','1.1.7','Fixed calculation of country specific product taxes','2023-10-28 07:01:30'),(443,'OFFLINE.Mall','comment','1.1.8','Optimized logging of failed payments','2023-10-28 07:01:30'),(444,'OFFLINE.Mall','script','1.1.9','use_text_columns_for_payment_log.php','2023-10-28 07:01:30'),(445,'OFFLINE.Mall','comment','1.1.9','Fixed payment logging issue','2023-10-28 07:01:30'),(446,'OFFLINE.Mall','comment','1.1.10','Optimized saving of pricing and stock information','2023-10-28 07:01:30'),(447,'OFFLINE.Mall','comment','1.1.11','Minor changes to payment log display','2023-10-28 07:01:30'),(448,'OFFLINE.Mall','script','1.1.12','update_jsonable_columns_to_mediumtext.php','2023-10-28 07:01:30'),(449,'OFFLINE.Mall','comment','1.1.12','Update jsonable columns to mediumtext type / fixed product dropdown in discount form','2023-10-28 07:01:30'),(450,'OFFLINE.Mall','comment','1.1.13','Optimized handling of race conditions during order creation','2023-10-28 07:01:30'),(451,'OFFLINE.Mall','comment','1.1.14','Fixed deletion of discounts','2023-10-28 07:01:30'),(452,'OFFLINE.Mall','comment','1.1.15','Added italian translations (thanks to @marcomessa)','2023-10-28 07:01:30'),(453,'OFFLINE.Mall','script','1.2.0','create_offline_mall_customer_payment_methods.php','2023-10-28 07:01:30'),(454,'OFFLINE.Mall','comment','1.2.0','Customers can now re-use payment methods (like Credit cards)','2023-10-28 07:01:30'),(455,'OFFLINE.Mall','script','1.2.1','remove_description_column_from_order_products.php','2023-10-28 07:01:30'),(456,'OFFLINE.Mall','script','1.2.1','remove_payment_data_column_from_orders_table.php','2023-10-28 07:01:30'),(457,'OFFLINE.Mall','comment','1.2.1','Minor bug fixes and optimizations','2023-10-28 07:01:30'),(458,'OFFLINE.Mall','comment','1.2.2','Fixed handling of custom field color values, allow single category menu item to be replaced by its products','2023-10-28 07:01:30'),(459,'OFFLINE.Mall','comment','1.2.3','Added flash messages to add to cart events','2023-10-28 07:01:30'),(460,'OFFLINE.Mall','comment','1.2.4','Added support for RainLab.User account activation links (\"user\" mode only, \"admin\" mode is unsupported)','2023-10-28 07:01:30'),(461,'OFFLINE.Mall','comment','1.2.5','Fixed index entry creation of newly created variants','2023-10-28 07:01:30'),(462,'OFFLINE.Mall','comment','1.2.6','Updated italian translations (thanks to @Cryhex), fixed Variant indexing bug','2023-10-28 07:01:30'),(463,'OFFLINE.Mall','comment','1.2.7','Fixed some minor bugs','2023-10-28 07:01:30'),(464,'OFFLINE.Mall','comment','1.2.8','Added sort by name option to Products component (requires `php artisan mall:reindex` to work)','2023-10-28 07:01:30'),(465,'OFFLINE.Mall','script','1.3.0','add_identifier_columns_for_products_and_variants.php','2023-10-28 07:01:30'),(466,'OFFLINE.Mall','script','1.3.0','add_description_columns_to_variants.php','2023-10-28 07:01:30'),(467,'OFFLINE.Mall','script','1.3.0','add_brand_column_to_order_products_table.php','2023-10-28 07:01:30'),(468,'OFFLINE.Mall','script','1.3.0','add_name_column_to_index_table.php','2023-10-28 07:01:30'),(469,'OFFLINE.Mall','comment','1.3.0','Added Google Merchant Center integration','2023-10-28 07:01:30'),(470,'OFFLINE.Mall','comment','1.3.1','Added Google Tag Manager integration (see https://tinyurl.com/mall-analytics-docs)','2023-10-28 07:01:30'),(471,'OFFLINE.Mall','comment','1.3.2','Minor bug fix release','2023-10-28 07:01:30'),(472,'OFFLINE.Mall','comment','1.3.3','Fixed inheritance of Variant descriptions','2023-10-28 07:01:30'),(473,'OFFLINE.Mall','comment','1.3.4','Added french translations (thanks to @willouch)','2023-10-28 07:01:30'),(474,'OFFLINE.Mall','comment','1.3.5','Minor Google Merchant Feed integration fixes','2023-10-28 07:01:30'),(475,'OFFLINE.Mall','script','1.3.6','set_use_state_default_setting.php','2023-10-28 07:01:30'),(476,'OFFLINE.Mall','comment','1.3.6','Optimized MySQL/MariaDB Query compatibility,\nmade the use of states/counties in addresses optional (configurable via the backend settings),\nadded redirectOnPropertyChange property to Product component\n','2023-10-28 07:01:30'),(477,'OFFLINE.Mall','comment','1.3.7','Minor bugfix release','2023-10-28 07:01:30'),(478,'OFFLINE.Mall','comment','1.3.8','Added new mall.cart.product.updated and mall.cart.product.quantityChanged events','2023-10-28 07:01:30'),(479,'OFFLINE.Mall','comment','1.3.9','Fixed minor dataLayer bugs','2023-10-28 07:01:30'),(480,'OFFLINE.Mall','comment','1.3.10','Re-use Eloquent model events to trigger `mall.cart.product.*` events. If you added custom event listeners for any of these events make sure to update your function signature to only accept a single CartProduct model (see https://offline-gmbh.github.io/oc-mall-plugin/development/events.html#cart)','2023-10-28 07:01:30'),(481,'OFFLINE.Mall','comment','1.3.11','Added links to edit and preview customer data to orders list (thanks to @Eoler)','2023-10-28 07:01:30'),(482,'OFFLINE.Mall','comment','1.3.12','Bugfix release','2023-10-28 07:01:30'),(483,'OFFLINE.Mall','comment','1.3.13','Fixed payment log display in backend order list','2023-10-28 07:01:30'),(484,'OFFLINE.Mall','comment','1.3.14','!!! This release does not contain any code updates. If you are using the mall demo theme make sure to patch the following two lines to prevent XSS attacks on your website https://bit.ly/2Y4lUs3','2023-10-28 07:01:30'),(485,'OFFLINE.Mall','script','1.3.15','add_embeds_column_to_products_table.php','2023-10-28 07:01:30'),(486,'OFFLINE.Mall','comment','1.3.15','Added embeds repeater to Product model to add custom embed code (like videos)','2023-10-28 07:01:30'),(487,'OFFLINE.Mall','script','1.4.0','create_offline_mall_wishlists.php','2023-10-28 07:01:30'),(488,'OFFLINE.Mall','script','1.4.0','create_offline_mall_wishlist_items.php','2023-10-28 07:01:30'),(489,'OFFLINE.Mall','comment','1.4.0','Added Wishlists feature','2023-10-28 07:01:30'),(490,'OFFLINE.Mall','comment','1.4.1','!!! Added terms and conditions checkbox to signup form. If you manually modified the signup form partials make sure to add the checkbox as well since it is being validated as required by default. (see https://tinyurl.com/yyanm7eo)','2023-10-28 07:01:30'),(491,'OFFLINE.Mall','script','1.5.0','create_offline_mall_services.php','2023-10-28 07:01:31'),(492,'OFFLINE.Mall','comment','1.5.0','Added Services feature (e. g. extended warranty, on-site installation)','2023-10-28 07:01:31'),(493,'OFFLINE.Mall','comment','1.5.1','!!! There is now a changelog documenting breaking changes with every future release. Make sure to check it out: https://bit.ly/2kCk2F9','2023-10-28 07:01:31'),(494,'OFFLINE.Mall','comment','1.5.2','Various bugfixes','2023-10-28 07:01:31'),(495,'OFFLINE.Mall','comment','1.5.3','Another bugfix release','2023-10-28 07:01:31'),(496,'OFFLINE.Mall','script','1.6.0','create_offline_mall_reviews.php','2023-10-28 07:01:31'),(497,'OFFLINE.Mall','comment','1.6.0','Added Reviews. Speaking of reviews, did you already add a review for this plugin ;-)? https://octobercms.com/plugin/offline-mall','2023-10-28 07:01:31'),(498,'OFFLINE.Mall','comment','1.6.1','Bugfix release. Don\'t forget to check out the new changelog for updates to 1.6.0: https://offline-gmbh.github.io/oc-mall-plugin/changelog/1.6.0.html','2023-10-28 07:01:31'),(499,'OFFLINE.Mall','comment','1.6.2','Added forceShippingPrice method to Cart model','2023-10-28 07:01:31'),(500,'OFFLINE.Mall','comment','1.6.3','Bugfix release','2023-10-28 07:01:31'),(501,'OFFLINE.Mall','script','1.7.0','add_virtual_products_support.php','2023-10-28 07:01:31'),(502,'OFFLINE.Mall','comment','1.7.0','Added support for virtual products','2023-10-28 07:01:31'),(503,'OFFLINE.Mall','comment','1.7.1','Bugfix for parent category dropdown in backend','2023-10-28 07:01:31'),(504,'OFFLINE.Mall','comment','1.7.2','Fixed bug where product entries in RainLab.Pages menus included the wrong variant id','2023-10-28 07:01:31'),(505,'OFFLINE.Mall','comment','1.7.3','Minor Bugfix when editing a Review on the frontend','2023-10-28 07:01:31'),(506,'OFFLINE.Mall','comment','1.7.4','Bugfix release','2023-10-28 07:01:31'),(507,'OFFLINE.Mall','comment','1.7.5','Updated russian translations (thanks to @igor-tv)','2023-10-28 07:01:31'),(508,'OFFLINE.Mall','comment','1.7.6','Made forceShippingPrice feature to only override the price for a specific shipping method. Make sure to add the new ID parameter in case you use this feature in your custom code.','2023-10-28 07:01:31'),(509,'OFFLINE.Mall','comment','1.7.7','Bugfix release','2023-10-28 07:01:31'),(510,'OFFLINE.Mall','comment','1.7.8','Another bugfix release','2023-10-28 07:01:31'),(511,'OFFLINE.Mall','comment','1.7.9','Added showShipping property to the Cart component. This allows you to display a cart without including any shipping information.','2023-10-28 07:01:31'),(512,'OFFLINE.Mall','script','1.7.10','add_valid_from_column_to_discounts_table.php','2023-10-28 07:01:31'),(513,'OFFLINE.Mall','comment','1.7.10','Added a valid from date for discounts','2023-10-28 07:01:31'),(514,'OFFLINE.Mall','comment','1.7.11','Bugfix release','2023-10-28 07:01:31'),(515,'OFFLINE.Mall','script','1.8.0','add_pdf_partial_to_payment_method.php','2023-10-28 07:01:31'),(516,'OFFLINE.Mall','comment','1.8.0','Added PDF invoices and \"export as PDF\" support for wishlists (https://tinyurl.com/t6y2pxn)','2023-10-28 07:01:31'),(517,'OFFLINE.Mall','comment','1.8.1','Fixed price sorting in Products component using the MySQL index','2023-10-28 07:01:31'),(518,'OFFLINE.Mall','comment','1.8.2','Added onClear method to Wishlist component','2023-10-28 07:01:31'),(519,'OFFLINE.Mall','comment','1.8.3','Bugfix release','2023-10-28 07:01:31'),(520,'OFFLINE.Mall','comment','1.8.4','Prices are now correctly indexed in all registered currencies. Run php artisan mall:index to benefit of these optimizations.','2023-10-28 07:01:31'),(521,'OFFLINE.Mall','comment','1.8.5','The PDF button in the Wishlists component remains visible now after a Product has been removed or edited by the user','2023-10-28 07:01:31'),(522,'OFFLINE.Mall','script','1.9.0','add_is_default_column_to_taxes_table.php','2023-10-28 07:01:31'),(523,'OFFLINE.Mall','comment','1.9.0','Better handling of country specific taxes, multi-language e-mails, translatable property values and more! (Full Changelog: https://offline-gmbh.github.io/oc-mall-plugin/changelog/1.9.0.html)','2023-10-28 07:01:31'),(524,'OFFLINE.Mall','comment','1.9.1','Bugfix release','2023-10-28 07:01:31'),(525,'OFFLINE.Mall','comment','1.9.2','Fixed handling of country specific Taxes for Wishlists','2023-10-28 07:01:31'),(526,'OFFLINE.Mall','script','1.9.3','add_shipping_method_id_to_wishlists_table.php','2023-10-28 07:01:31'),(527,'OFFLINE.Mall','script','1.9.3','set_default_tax.php','2023-10-28 07:01:31'),(528,'OFFLINE.Mall','comment','1.9.3','Added shipping method support for Wishlists','2023-10-28 07:01:31'),(529,'OFFLINE.Mall','comment','1.9.4','Another bugfix release','2023-10-28 07:01:31'),(530,'OFFLINE.Mall','comment','1.9.5','Added Customer relation to Wishlist model','2023-10-28 07:01:31'),(531,'OFFLINE.Mall','comment','1.10.0','!!! Added property values to default Product component markup. This will add new markup that needs styling! See Changelog: https://tinyurl.com/txwozkj','2023-10-28 07:01:31'),(532,'OFFLINE.Mall','comment','1.10.1','Bugfix release','2023-10-28 07:01:31'),(533,'OFFLINE.Mall','comment','1.10.2','!!! Do not update until version 1.11 is released. There is a bug in RainLab.Translate because of which translations won\'t be loaded correctly. Also do not update RainLab.Translate until this bug is fixed: https://github.com/rainlab/translate-plugin/issues/539. We will release a new version as soon as everything is back in order.','2023-10-28 07:01:31'),(534,'OFFLINE.Mall','comment','1.11.0','!!! Fixed RainLab.Translate issue. Also, RainLab.Translate is now a required dependency for this plugin. Make sure to install at least version 1.6.6 of RainLab.Translate before installing this update.','2023-10-28 07:01:31'),(535,'OFFLINE.Mall','comment','1.11.1','Optimized compatibility with Laravel 6','2023-10-28 07:01:31'),(536,'OFFLINE.Mall','comment','1.11.2','A product\'s short description supports now multi-line text input','2023-10-28 07:01:31'),(537,'OFFLINE.Mall','script','1.11.3','update_description_short_column_of_products_table.php','2023-10-28 07:01:31'),(538,'OFFLINE.Mall','script','1.11.3','update_description_short_column_of_product_variants_table.php','2023-10-28 07:01:31'),(539,'OFFLINE.Mall','comment','1.11.3','A variants\'s short description also supports multi-line text input now :)','2023-10-28 07:01:31'),(540,'OFFLINE.Mall','comment','1.11.4','Save quantity for Wishlist items correctly','2023-10-28 07:01:31'),(541,'OFFLINE.Mall','comment','1.11.5','Added search boxes to various Product relation managers','2023-10-28 07:01:31'),(542,'OFFLINE.Mall','script','1.11.6','add_rounding_column_to_currencies_table.php','2023-10-28 07:01:31'),(543,'OFFLINE.Mall','comment','1.11.6','A customer can now set a default shipping and billing address on the profile page. Don\'t forget to add some styles! (see https://tinyurl.com/vpr3g8x)','2023-10-28 07:01:31'),(544,'OFFLINE.Mall','comment','1.11.7','Added Czech translations, fixed Review approvals in Product form','2023-10-28 07:01:31'),(545,'OFFLINE.Mall','comment','1.11.8','Added Farsi translations','2023-10-28 07:01:31'),(546,'OFFLINE.Mall','comment','1.11.9','Minor bugfix release','2023-10-28 07:01:31'),(547,'OFFLINE.Mall','comment','1.11.10','Fixed multi-lang search with recent RainLab.Translate versions','2023-10-28 07:01:31'),(548,'OFFLINE.Mall','comment','1.11.11','Fixed display of e-mail address in orders list','2023-10-28 07:01:31'),(549,'OFFLINE.Mall','comment','1.11.12','Various bugfixes','2023-10-28 07:01:31'),(550,'OFFLINE.Mall','comment','1.11.13','Fixed handling of virtual product downloads for logged out customers','2023-10-28 07:01:31'),(551,'OFFLINE.Mall','comment','1.11.14','Fixed infinite loop with certain Review Categories setups','2023-10-28 07:01:31'),(552,'OFFLINE.Mall','comment','1.11.15','Bugfix release','2023-10-28 07:01:31'),(553,'OFFLINE.Mall','comment','1.11.16','Added cart product count and quantity sum info to the mall.cart.productAdded event to make consistent counter updates in the frontend easier (see https://tinyurl.com/ybxl9jlf)','2023-10-28 07:01:31'),(554,'OFFLINE.Mall','comment','1.11.17','Added `mall.order.afterCreate` event, fixed various bugs','2023-10-28 07:01:31'),(555,'OFFLINE.Mall','script','1.11.18','add_short_description_field_to_category.php','2023-10-28 07:01:31'),(556,'OFFLINE.Mall','comment','1.11.18','Added short description field to Category model','2023-10-28 07:01:31'),(557,'OFFLINE.Mall','comment','1.11.19','Minor bugfix release','2023-10-28 07:01:31'),(558,'OFFLINE.Mall','script','1.11.20','add_user_belongs_to_group_discount.php','2023-10-28 07:01:31'),(559,'OFFLINE.Mall','comment','1.11.20','Added \"Customer Group\" discount trigger','2023-10-28 07:01:31'),(560,'OFFLINE.Mall','comment','1.11.21','Minor bugfix to color custom field type','2023-10-28 07:01:31'),(561,'OFFLINE.Mall','comment','1.11.22','Bugfix release','2023-10-28 07:01:31'),(562,'OFFLINE.Mall','script','1.11.23','add_width_and_length_to_product_model.php','2023-10-28 07:01:31'),(563,'OFFLINE.Mall','comment','1.11.23','Added width, height and length fields to Products and Variants','2023-10-28 07:01:31'),(564,'OFFLINE.Mall','script','1.11.24','add_google_category_id_to_categories_table.php','2023-10-28 07:01:31'),(565,'OFFLINE.Mall','comment','1.11.24','Added Google Category ID field to Categories (Google Merchant integration)','2023-10-28 07:01:31'),(566,'OFFLINE.Mall','comment','1.11.25','Bugfix release','2023-10-28 07:01:31'),(567,'OFFLINE.Mall','comment','1.11.26','Added date and datetime Property field types','2023-10-28 07:01:31'),(568,'OFFLINE.Mall','comment','1.11.27','Bugfix release','2023-10-28 07:01:31'),(569,'OFFLINE.Mall','comment','1.11.28','Bugfix release','2023-10-28 07:01:31'),(570,'OFFLINE.Mall','comment','1.11.29','Bugfix release','2023-10-28 07:01:31'),(571,'OFFLINE.Mall','comment','1.11.30','Fixed mall.index.extend event handling','2023-10-28 07:01:31'),(572,'OFFLINE.Mall','comment','1.11.31','Fixed handling of checkbox properties, prevent discount codes from being applied multiple times by the same user','2023-10-28 07:01:31'),(573,'OFFLINE.Mall','comment','1.12.0','Added experimental QuickCheckout component (single-page checkout), added dutch mail translations, various buxfixes and optimizations','2023-10-28 07:01:31'),(574,'OFFLINE.Mall','comment','1.12.1','Added option to display Shipping selector before Payment method selector in default Checkout component','2023-10-28 07:01:31'),(575,'OFFLINE.Mall','comment','1.12.2','Bugfix release','2023-10-28 07:01:31'),(576,'OFFLINE.Mall','comment','1.12.3','Re-use RainLab.User\'s min password length setting, fixed various bugs','2023-10-28 07:01:31'),(577,'OFFLINE.Mall','comment','1.13.0','!!! Switched to Stripe Intents API (supports Strong Customer Authentication and 3D Secure payment flows). Test this update with your Stripe setup before deploying it in production! (Changelog: https://tinyurl.com/y79ane6j)','2023-10-28 07:01:31'),(578,'OFFLINE.Mall','comment','1.13.1','Bugfix release','2023-10-28 07:01:31'),(579,'OFFLINE.Mall','comment','1.13.2','Bugfix release','2023-10-28 07:01:31'),(580,'OFFLINE.Mall','comment','1.13.3','Another Bugfix release','2023-10-28 07:01:31'),(581,'OFFLINE.Mall','comment','1.13.4','Optimized October 2.0 compatibility','2023-10-28 07:01:31'),(582,'OFFLINE.Mall','comment','1.13.5','Fixed another October 2.0 incompatibility','2023-10-28 07:01:31'),(583,'OFFLINE.Mall','comment','1.13.6','Optimized compatibility with Winter CMS, fixed various bugs','2023-10-28 07:01:31'),(584,'OFFLINE.Mall','comment','1.14.0','Added support for PHP 8 (see changelog: https://offline-gmbh.github.io/oc-mall-plugin/changelog/1.14.0.html)','2023-10-28 07:01:31'),(585,'OFFLINE.Mall','script','1.14.1','create_offline_mall_shipping_method_discount.php','2023-10-28 07:01:31'),(586,'OFFLINE.Mall','comment','1.14.1','Added possibility to apply discounts when a certain shipping method is selected (credits to @inalto)','2023-10-28 07:01:31'),(587,'OFFLINE.Mall','comment','1.14.2','Various minor bugfixes and improvements','2023-10-28 07:01:31'),(588,'OFFLINE.Mall','comment','1.14.3','Fixed various Bugs in the QuickCheckout component','2023-10-28 07:01:31'),(589,'OFFLINE.Mall','script','1.15.0','add_payment_method_id_to_discounts_table.php','2023-10-28 07:01:31'),(590,'OFFLINE.Mall','comment','1.15.0','Fixed many bugs, added discounts for payment methods, optimized performance of product page, optimized October 2.0 compatibility','2023-10-28 07:01:31'),(591,'OFFLINE.Mall','comment','1.15.1','Fixed many bugs, added discounts for payment methods, optimized performance of product page, optimized October 2.0 compatibility','2023-10-28 07:01:31'),(592,'OFFLINE.Mall','comment','1.15.2','Fixed invalid migration file','2023-10-28 07:01:31'),(593,'OFFLINE.Mall','comment','1.15.3','Optimized compatibility with October 1.0 releases','2023-10-28 07:01:31'),(594,'OFFLINE.Mall','comment','1.15.4','Further October 1.0 fixes','2023-10-28 07:01:31'),(595,'OFFLINE.Mall','comment','1.15.5','Various bug fixes','2023-10-28 07:01:31'),(596,'OFFLINE.Mall','comment','1.16.0','Added Support for October 2.2','2023-10-28 07:01:31'),(597,'OFFLINE.Mall','comment','1.16.1','Fixed compatibility issue with October 1','2023-10-28 07:01:31'),(598,'OFFLINE.Mall','comment','1.16.2','Fixed bug where properties are displayed multiple times on the product detail page','2023-10-28 07:01:31'),(599,'OFFLINE.Mall','comment','2.0.0','!!! This plugin now requires October 2+. If you have installed the plugin from the marketplace, we suggest to migrate to Composer and track the ^1.0 version. V1 will continue to receive bugfixes but no new features will be backported.','2023-10-28 07:01:31'),(600,'OFFLINE.Mall','comment','2.0.1','Bugfixes for October 2+, optimized Winter CMS compatibility (thanks to @mjauvin)','2023-10-28 07:01:31'),(601,'OFFLINE.Mall','comment','2.0.2','October 3 compatibility update','2023-10-28 07:01:31'),(602,'OFFLINE.Mall','comment','2.0.3','Bugfix release','2023-10-28 07:01:31'),(603,'OFFLINE.Mall','comment','2.0.4','Minor Bugfix release','2023-10-28 07:01:31'),(604,'OFFLINE.Mall','comment','2.0.5','Fixed demo seeder in October 3','2023-10-28 07:01:31'),(605,'OFFLINE.Mall','comment','2.0.7','Fixed compatibility with PHP 7.4','2023-10-28 07:01:31'),(606,'OFFLINE.Mall','comment','2.0.8','Further compatibility fixes','2023-10-28 07:01:31'),(607,'OFFLINE.Mall','comment','2.0.9','Optimized OFFLINE.SiteSearch integration','2023-10-28 07:01:31'),(608,'OFFLINE.Mall','comment','2.0.10','Added PDFMaker trait to product model','2023-10-28 07:01:32'),(609,'OFFLINE.Mall','comment','2.0.11','Update to Version 3 of this plugin to get RainLab.Translate v2 support','2023-10-28 07:01:32'),(610,'OFFLINE.Mall','comment','3.0.0','Introduced RainLab.Translate v2 support','2023-10-28 07:01:32'),(611,'OFFLINE.Mall','comment','3.0.1','Fixed product filter problem in October 3','2023-10-28 07:01:32'),(612,'OFFLINE.Mall','comment','3.0.2','Fixed mailing event handler not firing in October 3','2023-10-28 07:01:32'),(613,'OFFLINE.Mall','comment','3.0.3','Fixed handling of Currency model timestamps','2023-10-28 07:01:32'),(614,'OFFLINE.Mall','comment','3.0.4','Fixed bug in addressSelector component. If you did override any of the component partials, make sure to include the following change in your own partials: https://github.com/OFFLINE-GmbH/oc-mall-plugin/commit/8e66134b35e03bf373e2a7a91d09c190a3a7e8c4','2023-10-28 07:01:32'),(615,'OFFLINE.Mall','comment','3.0.5','Cleaned up the return values of the Product::onAddToCart component method','2023-10-28 07:01:32'),(616,'OFFLINE.Mall','comment','3.0.6','Fixed handling of recipient name in shipping addresses','2023-10-28 07:01:32'),(617,'OFFLINE.Mall','comment','3.0.7','Fixed handling of recipient name in billing addresses','2023-10-28 07:01:32'),(618,'OFFLINE.Mall','comment','3.0.8','Added mall.index.extendData event to extend the indexed data (thanks to @chocolata)','2023-10-28 07:01:32'),(619,'OFFLINE.Mall','script','3.0.9','add_deleted_at_column_to_payments_log_table.php','2023-10-28 07:01:32'),(620,'OFFLINE.Mall','comment','3.0.9','Made PaymentLog model soft-deletable','2023-10-28 07:01:32'),(621,'OFFLINE.Mall','comment','3.0.10','Minor bugfixes','2023-10-28 07:01:32'),(622,'OFFLINE.Mall','comment','3.0.11','Added view events `mall.backend.orders.extendCustomerDetails` and `mall.backend.orders.extendItemDetails` to extend backend order view','2023-10-28 07:01:32'),(623,'OFFLINE.Mall','comment','3.0.12','Fixed Stripe integration when changing payment methods during checkout','2023-10-28 07:01:32'),(624,'OFFLINE.Mall','comment','3.0.13','Added exceptions for new October v3 Twig Security Policy','2023-10-28 07:01:32'),(625,'OFFLINE.Mall','comment','3.0.14','Fixed Category cache in October 3 when sorting categories (thanks to @matteo-palazzo)','2023-10-28 07:01:32'),(626,'OFFLINE.Mall','comment','3.0.15','Minor bugfixes for October 3','2023-10-28 07:01:32'),(627,'OFFLINE.Mall','comment','3.0.16','Added product duplication feature to products list view','2023-10-28 07:01:32'),(628,'OFFLINE.Mall','comment','3.0.17','Improved setup of the MailingEventHandler','2023-10-28 07:01:32'),(629,'OFFLINE.Mall','comment','3.0.18','Added PL language (thanks to @adamo)','2023-10-28 07:01:32'),(630,'OFFLINE.Mall','comment','3.0.19','Fixed error handing in MySQL indexer','2023-10-28 07:01:32'),(631,'OFFLINE.Mall','comment','3.0.20','Fixed error handing in MySQL indexer (2)','2023-10-28 07:01:32'),(632,'OFFLINE.Mall','comment','3.0.21','Fixed translation strings (thanks to @andezer)','2023-10-28 07:01:32'),(633,'OFFLINE.Mall','comment','3.0.22','Added support for RainLab.User 2.0','2023-10-28 07:01:32'),(634,'OFFLINE.Mall','comment','3.0.23','Fixed compatibility with latest October version','2023-10-28 07:01:32'),(635,'OFFLINE.Mall','comment','3.0.24','Fixed QuickCheckout component in October 3.0','2023-10-28 07:01:32'),(636,'OFFLINE.Mall','comment','3.0.25','Fixed Stripe only working when it is the default payment method','2023-10-28 07:01:32'),(637,'OFFLINE.Mall','comment','3.0.26','Added support for DomPDF 2.x and Laravel 10 (thanks to @Pindagus)','2023-10-28 07:01:32'),(638,'OFFLINE.Mall','comment','3.0.27','Fixed handling of shipping notification','2023-10-28 07:01:32'),(639,'RainLab.Builder','comment','1.0.1','Initialize plugin.','2023-10-28 07:02:02'),(640,'RainLab.Builder','comment','1.0.2','Fixes the problem with selecting a plugin. Minor localization corrections. Configuration files in the list and form behaviors are now autocomplete.','2023-10-28 07:02:02'),(641,'RainLab.Builder','comment','1.0.3','Improved handling of the enum data type.','2023-10-28 07:02:02'),(642,'RainLab.Builder','comment','1.0.4','Added user permissions to work with the Builder.','2023-10-28 07:02:02'),(643,'RainLab.Builder','comment','1.0.5','Fixed permissions registration.','2023-10-28 07:02:02'),(644,'RainLab.Builder','comment','1.0.6','Fixed front-end record ordering in the Record List component.','2023-10-28 07:02:02'),(645,'RainLab.Builder','comment','1.0.7','Builder settings are now protected with user permissions. The database table column list is scrollable now. Minor code cleanup.','2023-10-28 07:02:02'),(646,'RainLab.Builder','comment','1.0.8','Added the Reorder Controller behavior.','2023-10-28 07:02:02'),(647,'RainLab.Builder','comment','1.0.9','Minor API and UI updates.','2023-10-28 07:02:02'),(648,'RainLab.Builder','comment','1.0.10','Minor styling update.','2023-10-28 07:02:02'),(649,'RainLab.Builder','comment','1.0.11','Fixed a bug where clicking placeholder in a repeater would open Inspector. Fixed a problem with saving forms with repeaters in tabs. Minor style fix.','2023-10-28 07:02:02'),(650,'RainLab.Builder','comment','1.0.12','Added support for the Trigger property to the Media Finder widget configuration. Names of form fields and list columns definition files can now contain underscores.','2023-10-28 07:02:02'),(651,'RainLab.Builder','comment','1.0.13','Minor styling fix on the database editor.','2023-10-28 07:02:02'),(652,'RainLab.Builder','comment','1.0.14','Added support for published_at timestamp field','2023-10-28 07:02:02'),(653,'RainLab.Builder','comment','1.0.15','Fixed a bug where saving a localization string in Inspector could cause a JavaScript error. Added support for Timestamps and Soft Deleting for new models.','2023-10-28 07:02:02'),(654,'RainLab.Builder','comment','1.0.16','Fixed a bug when saving a form with the Repeater widget in a tab could create invalid fields in the form\'s outside area. Added a check that prevents creating localization strings inside other existing strings.','2023-10-28 07:02:02'),(655,'RainLab.Builder','comment','1.0.17','Added support Trigger attribute support for RecordFinder and Repeater form widgets.','2023-10-28 07:02:02'),(656,'RainLab.Builder','comment','1.0.18','Fixes a bug where \'::class\' notations in a model class definition could prevent the model from appearing in the Builder model list. Added emptyOption property support to the dropdown form control.','2023-10-28 07:02:02'),(657,'RainLab.Builder','comment','1.0.19','Added a feature allowing to add all database columns to a list definition. Added max length validation for database table and column names.','2023-10-28 07:02:02'),(658,'RainLab.Builder','comment','1.0.20','Fixes a bug where form the builder could trigger the \"current.hasAttribute is not a function\" error.','2023-10-28 07:02:02'),(659,'RainLab.Builder','comment','1.0.21','Back-end navigation sort order updated.','2023-10-28 07:02:02'),(660,'RainLab.Builder','comment','1.0.22','Added scopeValue property to the RecordList component.','2023-10-28 07:02:02'),(661,'RainLab.Builder','comment','1.0.23','Added support for balloon-selector field type, added Brazilian Portuguese translation, fixed some bugs','2023-10-28 07:02:02'),(662,'RainLab.Builder','comment','1.0.24','Added support for tag list field type, added read only toggle for fields. Prevent plugins from using reserved PHP keywords for class names and namespaces','2023-10-28 07:02:02'),(663,'RainLab.Builder','comment','1.0.25','Allow editing of migration code in the \"Migration\" popup when saving changes in the database editor.','2023-10-28 07:02:02'),(664,'RainLab.Builder','comment','1.0.26','Allow special default values for columns and added new \"Add ID column\" button to database editor.','2023-10-28 07:02:02'),(665,'RainLab.Builder','comment','1.0.27','Added ability to use \'scope\' in a form relation field, added ability to change the sort order of versions and added additional properties for repeater widget in form builder. Added Polish translation.','2023-10-28 07:02:02'),(666,'RainLab.Builder','comment','1.0.28','Fixes support for PHP 8','2023-10-28 07:02:02'),(667,'RainLab.Builder','comment','1.0.29','Disable touch device detection','2023-10-28 07:02:02'),(668,'RainLab.Builder','comment','1.0.30','Minor styling improvements','2023-10-28 07:02:02'),(669,'RainLab.Builder','comment','1.0.31','Added support for more rich editor and file upload properties','2023-10-28 07:02:02'),(670,'RainLab.Builder','comment','1.0.32','Minor styling improvements','2023-10-28 07:02:02'),(671,'RainLab.Builder','comment','1.1.0','Adds feature for adding database fields to a form definition.','2023-10-28 07:02:02'),(672,'RainLab.Builder','comment','1.1.1','Adds DBAL timestamp column type. Adds database prefix support. Fixes various bugs.','2023-10-28 07:02:02'),(673,'RainLab.Builder','comment','1.1.2','Compatibility with October CMS v2.2','2023-10-28 07:02:02'),(674,'RainLab.Builder','comment','1.1.3','Adds comment support to database tables.','2023-10-28 07:02:02'),(675,'RainLab.Builder','comment','1.1.4','Fixes duplication bug saving backend menu permissions.','2023-10-28 07:02:02'),(676,'RainLab.Builder','comment','1.2.0','Improve support with October v3.0','2023-10-28 07:02:02'),(677,'RainLab.Builder','comment','1.2.2','Compatibility updates.','2023-10-28 07:02:02'),(678,'RainLab.Builder','comment','1.2.3','Fixes issue when removing items from permissions and menus.','2023-10-28 07:02:02'),(679,'RainLab.Builder','comment','1.2.5','Fixes validator conflict with other plugins.','2023-10-28 07:02:02'),(680,'RainLab.Builder','comment','1.2.6','Compatibility with October v3.1','2023-10-28 07:02:02'),(681,'RainLab.Builder','comment','2.0.1','Adds Tailor blueprint importer and code editor.','2023-10-28 07:02:02'),(682,'RainLab.Builder','comment','2.0.2','Fixes visual bug when tab fields overflow.','2023-10-28 07:02:02'),(683,'RainLab.Builder','comment','2.0.3','Fixes missing import in CMS components.','2023-10-28 07:02:02'),(684,'RainLab.Builder','comment','2.0.4','Fixes bad method name in controller model.','2023-10-28 07:02:02'),(685,'RainLab.Builder','comment','2.0.5','Fixes bug adding data table controls.','2023-10-28 07:02:02'),(733,'Tecnotrade.Websync','comment','1.0.1','Initialize plugin','2023-11-06 07:11:24'),(734,'Tecnotrade.Websync','script','1.0.2','builder_table_create_tecnotrade_websync_clientfields.php','2023-11-06 07:11:24'),(735,'Tecnotrade.Websync','comment','1.0.2','Created table tecnotrade_websync_clientfields','2023-11-06 07:11:24'),(736,'Tecnotrade.Websync','script','1.0.3','builder_table_update_tecnotrade_websync_clientfields.php','2023-11-06 07:12:14'),(737,'Tecnotrade.Websync','comment','1.0.3','Updated table tecnotrade_websync_clientfields','2023-11-06 07:12:14'),(738,'Tecnotrade.Websync','script','1.0.4','builder_table_update_tecnotrade_websync_clientfields_2.php','2023-11-06 07:12:42'),(739,'Tecnotrade.Websync','comment','1.0.4','Updated table tecnotrade_websync_clientfields','2023-11-06 07:12:42'),(740,'Tecnotrade.Websync','script','1.0.5','builder_table_create_tecnotrade_websync_fieldtype.php','2023-11-06 07:19:12'),(741,'Tecnotrade.Websync','comment','1.0.5','Created table tecnotrade_websync_fieldtype','2023-11-06 07:19:12'),(742,'Tecnotrade.Websync','script','1.0.6','builder_table_create_tecnotrade_websync_product_clientproductfields.php','2023-11-06 07:52:00'),(743,'Tecnotrade.Websync','comment','1.0.6','Created table tecnotrade_websync_product_clientproductfields','2023-11-06 07:52:00'),(744,'Tecnotrade.Websync','script','1.0.7','builder_table_delete_tecnotrade_websync_product_clientproductfields.php','2023-11-06 07:53:20'),(745,'Tecnotrade.Websync','comment','1.0.7','Drop table tecnotrade_websync_product_clientproductfields','2023-11-06 07:53:20'),(746,'Tecnotrade.Websync','script','1.0.8','builder_table_create_tecnotrade_websync_clientproductfields.php','2023-11-06 07:55:06'),(747,'Tecnotrade.Websync','comment','1.0.8','Created table tecnotrade_websync_clientproductfields','2023-11-06 07:55:06'),(748,'Tecnotrade.Websync','script','1.0.9','builder_table_create_tecnotrade_websync_clientproductrules.php','2023-11-06 08:16:40'),(749,'Tecnotrade.Websync','comment','1.0.9','Created table tecnotrade_websync_clientproductrules','2023-11-06 08:16:40'),(750,'Tecnotrade.Websync','script','1.0.10','builder_table_create_tecnotrade_websync_clientproductfields_clientproductrules.php','2023-11-06 08:30:54'),(751,'Tecnotrade.Websync','comment','1.0.10','Created table tecnotrade_websync_clientproductfields_clientproductrules','2023-11-06 08:30:54'),(752,'Tecnotrade.Websync','script','1.0.11','builder_table_update_tecnotrade_websync_clientproductfields.php','2023-11-06 08:38:57'),(753,'Tecnotrade.Websync','comment','1.0.11','Updated table tecnotrade_websync_clientproductfields','2023-11-06 08:38:57'),(754,'Tecnotrade.Websync','script','1.0.12','builder_table_update_tecnotrade_websync_clientproductfields_clientproductrules.php','2023-11-06 10:25:05'),(755,'Tecnotrade.Websync','comment','1.0.12','Updated table tecnotrade_websync_clientproductfields_clientproductrules','2023-11-06 10:25:05'),(756,'Tecnotrade.Websync','script','1.0.13','builder_table_update_tecnotrade_websync_clientproductfields_2.php','2023-11-06 15:41:06'),(757,'Tecnotrade.Websync','comment','1.0.13','Updated table tecnotrade_websync_clientproductfields','2023-11-06 15:41:06'),(758,'Tecnotrade.Websync','script','1.0.14','builder_table_update_tecnotrade_websync_clientproductrules.php','2023-11-06 15:45:45'),(759,'Tecnotrade.Websync','comment','1.0.14','Updated table tecnotrade_websync_clientproductrules','2023-11-06 15:45:45'),(760,'Tecnotrade.Websync','script','1.0.15','builder_table_update_tecnotrade_websync_clientproductrules_2.php','2023-11-06 15:50:02'),(761,'Tecnotrade.Websync','comment','1.0.15','Updated table tecnotrade_websync_clientproductrules','2023-11-06 15:50:02'),(762,'Tecnotrade.Websync','script','1.0.16','builder_table_update_tecnotrade_websync_clientproductrules_3.php','2023-11-06 15:57:04'),(763,'Tecnotrade.Websync','comment','1.0.16','Updated table tecnotrade_websync_clientproductrules','2023-11-06 15:57:04'),(764,'Tecnotrade.Websync','script','1.0.17','builder_table_update_tecnotrade_websync_clientproductrules_4.php','2023-11-06 16:08:19'),(765,'Tecnotrade.Websync','comment','1.0.17','Updated table tecnotrade_websync_clientproductrules','2023-11-06 16:08:19'),(766,'Tecnotrade.Websync','script','1.0.18','builder_table_update_tecnotrade_websync_clientproductrules_5.php','2023-11-07 07:38:58'),(767,'Tecnotrade.Websync','comment','1.0.18','Updated table tecnotrade_websync_clientproductrules','2023-11-07 07:38:58'),(768,'Tecnotrade.Websync','script','1.0.19','builder_table_create_tecnotrade_websync_clientcatfields.php','2023-11-07 08:02:31'),(769,'Tecnotrade.Websync','comment','1.0.19','Created table tecnotrade_websync_clientcatfields','2023-11-07 08:02:31'),(770,'Tecnotrade.Websync','script','1.0.20','builder_table_update_tecnotrade_websync_clientproductrules_6.php','2023-11-07 08:39:50'),(771,'Tecnotrade.Websync','comment','1.0.20','Updated table tecnotrade_websync_clientproductrules','2023-11-07 08:39:50'),(772,'Tecnotrade.Websync','script','1.0.21','builder_table_create_tecnotrade_websync_clientcatrules.php','2023-11-07 08:40:27'),(773,'Tecnotrade.Websync','comment','1.0.21','Created table tecnotrade_websync_clientcatrules','2023-11-07 08:40:27'),(774,'Tecnotrade.Websync','script','1.0.22','builder_table_create_tecnotrade_websync_clientcategoryfields_clientcategoryrules.php','2023-11-07 08:43:52'),(775,'Tecnotrade.Websync','comment','1.0.22','Created table tecnotrade_websync_clientcategoryfields_clientcategoryrules','2023-11-07 08:43:52'),(776,'Tecnotrade.Websync','script','1.0.23','builder_table_update_tecnotrade_websync_clientcatrules.php','2023-11-07 08:59:19'),(777,'Tecnotrade.Websync','comment','1.0.23','Updated table tecnotrade_websync_clientcatrules','2023-11-07 08:59:19'),(778,'Tecnotrade.Websync','script','1.0.24','builder_table_update_tecnotrade_websync_clientcategoryfields_clientcategoryrules.php','2023-11-07 09:00:45'),(779,'Tecnotrade.Websync','comment','1.0.24','Updated table tecnotrade_websync_clientcategoryfields_clientcategoryrules','2023-11-07 09:00:45'),(780,'Tecnotrade.Websync','script','1.0.25','builder_table_update_tecnotrade_websync_clientcatrules_2.php','2023-11-07 09:10:18'),(781,'Tecnotrade.Websync','comment','1.0.25','Updated table tecnotrade_websync_clientcatrules','2023-11-07 09:10:18'),(782,'Tecnotrade.Websync','script','1.0.26','builder_table_update_tecnotrade_websync_clientcatrules_3.php','2023-11-07 09:14:40'),(783,'Tecnotrade.Websync','comment','1.0.26','Updated table tecnotrade_websync_clientcatrules','2023-11-07 09:14:40'),(784,'Tecnotrade.Websync','script','1.0.27','builder_table_update_tecnotrade_websync_clientcatrules_4.php','2023-11-07 09:16:27'),(785,'Tecnotrade.Websync','comment','1.0.27','Updated table tecnotrade_websync_clientcatrules','2023-11-07 09:16:27'),(786,'Tecnotrade.Websync','script','1.0.28','builder_table_update_tecnotrade_websync_clientcatrules_5.php','2023-11-07 09:29:50'),(787,'Tecnotrade.Websync','comment','1.0.28','Updated table tecnotrade_websync_clientcatrules','2023-11-07 09:29:50'),(788,'Tecnotrade.Websync','script','1.0.29','builder_table_update_tecnotrade_websync_clientcatrules_6.php','2023-11-07 09:35:09'),(789,'Tecnotrade.Websync','comment','1.0.29','Updated table tecnotrade_websync_clientcatrules','2023-11-07 09:35:09'),(790,'Tecnotrade.Websync','script','1.0.30','builder_table_update_tecnotrade_websync_clientcatrules_7.php','2023-11-07 09:37:44'),(791,'Tecnotrade.Websync','comment','1.0.30','Updated table tecnotrade_websync_clientcatrules','2023-11-07 09:37:44'),(792,'Tecnotrade.Websync','script','1.0.31','builder_table_create_tecnotrade_websync_brandfields.php','2023-11-07 15:50:38'),(793,'Tecnotrade.Websync','comment','1.0.31','Created table tecnotrade_websync_brandfields','2023-11-07 15:50:38'),(794,'Tecnotrade.Websync','script','1.0.32','builder_table_create_tecnotrade_websync_clientbrandrules.php','2023-11-07 16:03:06'),(795,'Tecnotrade.Websync','comment','1.0.32','Created table tecnotrade_websync_clientbrandrules','2023-11-07 16:03:06'),(796,'Tecnotrade.Websync','script','1.0.33','builder_table_update_tecnotrade_websync_clientbrandrules.php','2023-11-07 16:04:47'),(797,'Tecnotrade.Websync','comment','1.0.33','Updated table tecnotrade_websync_clientbrandrules','2023-11-07 16:04:47'),(798,'Tecnotrade.Websync','script','1.0.34','builder_table_update_tecnotrade_websync_clientcatrules_8.php','2023-11-07 16:05:34'),(799,'Tecnotrade.Websync','comment','1.0.34','Updated table tecnotrade_websync_clientcatrules','2023-11-07 16:05:34'),(800,'Tecnotrade.Websync','script','1.0.35','builder_table_update_tecnotrade_websync_clientcatrules_9.php','2023-11-07 16:14:07'),(801,'Tecnotrade.Websync','comment','1.0.35','Updated table tecnotrade_websync_clientcatrules','2023-11-07 16:14:07'),(802,'Tecnotrade.Websync','script','1.0.36','builder_table_update_tecnotrade_websync_clientbrandrules_2.php','2023-11-07 16:14:18'),(803,'Tecnotrade.Websync','comment','1.0.36','Updated table tecnotrade_websync_clientbrandrules','2023-11-07 16:14:18'),(804,'Tecnotrade.Websync','script','1.0.37','builder_table_create_tecnotrade_websync_clientbradfields_clientbrandrules.php','2023-11-08 07:43:49'),(805,'Tecnotrade.Websync','comment','1.0.37','Created table tecnotrade_websync_clientbradfields_clientbrandrules','2023-11-08 07:43:49'),(806,'Tecnotrade.Websync','script','1.0.38','builder_table_update_tecnotrade_websync_clientbrandfields_clientbrandrules.php','2023-11-08 07:54:12'),(807,'Tecnotrade.Websync','comment','1.0.38','Updated table tecnotrade_websync_clientbradfields_clientbrandrules','2023-11-08 07:54:12'),(808,'Tecnotrade.Websync','script','1.0.39','builder_table_update_tecnotrade_websync_clientbrandfields_clientbrandrules_2.php','2023-11-08 07:54:58'),(809,'Tecnotrade.Websync','comment','1.0.39','Updated table tecnotrade_websync_clientbrandfields_clientbrandrules','2023-11-08 07:54:58'),(810,'Tecnotrade.Websync','script','1.0.40','builder_table_update_tecnotrade_websync_clientbrandrules_3.php','2023-11-08 08:26:27'),(811,'Tecnotrade.Websync','comment','1.0.40','Updated table tecnotrade_websync_clientbrandrules','2023-11-08 08:26:27'),(812,'Tecnotrade.Websync','script','1.0.41','builder_table_update_tecnotrade_websync_clientcatrules_10.php','2023-11-08 08:28:37'),(813,'Tecnotrade.Websync','comment','1.0.41','Updated table tecnotrade_websync_clientcatrules','2023-11-08 08:28:37'),(814,'Tecnotrade.Websync','script','1.0.42','builder_table_update_tecnotrade_websync_clientproductrules_7.php','2023-11-08 08:29:04'),(815,'Tecnotrade.Websync','comment','1.0.42','Updated table tecnotrade_websync_clientproductrules','2023-11-08 08:29:04'),(816,'Tecnotrade.Websync','script','1.0.43','builder_table_create_tecnotrade_websync_syncro_table_product_fields.php','2023-11-08 14:43:34'),(817,'Tecnotrade.Websync','comment','1.0.43','Created table tecnotrade_websync_syncro_table_product_fields','2023-11-08 14:43:34'),(818,'Tecnotrade.Websync','script','1.0.44','builder_table_update_tecnotrade_websync_syncro_table_product_fields.php','2023-11-08 15:13:37'),(819,'Tecnotrade.Websync','comment','1.0.44','Updated table tecnotrade_websync_syncro_table_product_fields','2023-11-08 15:13:37'),(820,'Tecnotrade.Websync','script','1.0.45','builder_table_update_tecnotrade_websync_syncro_table_product_fields_2.php','2023-11-09 08:26:12'),(821,'Tecnotrade.Websync','comment','1.0.45','Updated table tecnotrade_websync_syncro_table_product_fields','2023-11-09 08:26:12'),(822,'Tecnotrade.Websync','script','1.0.46','builder_table_create_tecnotrade_websync_products.php','2023-11-09 09:30:28'),(823,'Tecnotrade.Websync','comment','1.0.46','Created table tecnotrade_websync_products','2023-11-09 09:30:28'),(824,'Tecnotrade.Websync','script','1.0.47','fieldtypeseeder.php','2023-11-09 14:36:43'),(825,'Tecnotrade.Websync','comment','1.0.47','Seeder per field_types table','2023-11-09 14:36:43'),(826,'Tecnotrade.Websync','script','1.0.48','tableproductfieldseeder.php','2023-11-09 14:50:27'),(827,'Tecnotrade.Websync','comment','1.0.48','Seeder per ProductTableFields','2023-11-09 14:50:27'),(828,'Tecnotrade.Websync','script','1.0.49','builder_table_create_tecnotrade_websync_brand.php','2023-11-09 15:03:29'),(829,'Tecnotrade.Websync','comment','1.0.49','Created table tecnotrade_websync_brand','2023-11-09 15:03:29'),(830,'Tecnotrade.Websync','script','1.0.50','builder_table_create_tecnotrade_websync_syncro_table_brand.php','2023-11-09 15:09:14'),(831,'Tecnotrade.Websync','comment','1.0.50','Created table tecnotrade_websync_syncro_table_brand','2023-11-09 15:09:14'),(832,'Tecnotrade.Websync','script','1.0.51','builder_table_update_tecnotrade_websync_syncro_table_brand.php','2023-11-09 15:18:35'),(833,'Tecnotrade.Websync','comment','1.0.51','Updated table tecnotrade_websync_syncro_table_brand','2023-11-09 15:18:35'),(834,'Tecnotrade.Websync','script','1.0.52','builder_table_update_tecnotrade_websync_syncro_table_brand_2.php','2023-11-09 15:21:16'),(835,'Tecnotrade.Websync','comment','1.0.52','Updated table tecnotrade_websync_syncro_table_brand','2023-11-09 15:21:16'),(836,'Tecnotrade.Websync','script','1.0.53','builder_table_update_tecnotrade_websync_brand.php','2023-11-10 07:39:12'),(837,'Tecnotrade.Websync','comment','1.0.53','Updated table tecnotrade_websync_brand','2023-11-10 07:39:12'),(838,'Tecnotrade.Websync','script','1.0.54','tablebrandfieldseeder.php','2023-11-10 07:50:42'),(839,'Tecnotrade.Websync','comment','1.0.54','Seeder Per BrandTableFields','2023-11-10 07:50:42'),(840,'Tecnotrade.Websync','script','1.0.55','builder_table_create_tecnotrade_websync_category.php','2023-11-10 07:58:35'),(841,'Tecnotrade.Websync','comment','1.0.55','Created table tecnotrade_websync_category','2023-11-10 07:58:35'),(842,'Tecnotrade.Websync','script','1.0.56','builder_table_update_tecnotrade_websync_category.php','2023-11-10 08:02:51'),(843,'Tecnotrade.Websync','comment','1.0.56','Updated table tecnotrade_websync_category','2023-11-10 08:02:51'),(844,'Tecnotrade.Websync','script','1.0.57','builder_table_create_tecnotrade_websync_syncro_table_category.php','2023-11-10 08:09:01'),(845,'Tecnotrade.Websync','comment','1.0.57','Created table tecnotrade_websync_syncro_table_category','2023-11-10 08:09:01'),(846,'Tecnotrade.Websync','script','1.0.58','builder_table_update_tecnotrade_websync_syncro_table_brand_fields.php','2023-11-10 08:21:44'),(847,'Tecnotrade.Websync','comment','1.0.58','Updated table tecnotrade_websync_syncro_table_brand','2023-11-10 08:21:44'),(848,'Tecnotrade.Websync','script','1.0.59','builder_table_update_tecnotrade_websync_syncro_table_category_fields.php','2023-11-10 08:22:09'),(849,'Tecnotrade.Websync','comment','1.0.59','Updated table tecnotrade_websync_syncro_table_category','2023-11-10 08:22:09'),(850,'Tecnotrade.Websync','script','1.0.60','builder_table_update_tecnotrade_websync_syncro_table_category_fields_2.php','2023-11-10 08:40:19'),(851,'Tecnotrade.Websync','comment','1.0.60','Updated table tecnotrade_websync_syncro_table_category_fields','2023-11-10 08:40:19'),(852,'Tecnotrade.Websync','script','1.0.61','tablecategoryfieldseeder.php','2023-11-10 09:24:13'),(853,'Tecnotrade.Websync','comment','1.0.61','Seeder Per Table Category Fields','2023-11-10 09:24:13'),(854,'Tecnotrade.Websync','script','1.0.62','builder_table_update_tecnotrade_websync_category_2.php','2023-11-10 09:28:10'),(855,'Tecnotrade.Websync','comment','1.0.62','Updated table tecnotrade_websync_category','2023-11-10 09:28:10'),(856,'Tecnotrade.Websync','script','1.0.63','tablecategoryfieldseeder.php','2023-11-10 09:30:34'),(857,'Tecnotrade.Websync','comment','1.0.63','Rifatto Seeder Per Table Category Fields dopo modifica Database table','2023-11-10 09:30:34');
/*!40000 ALTER TABLE `system_plugin_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_plugin_versions`
--

DROP TABLE IF EXISTS `system_plugin_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_plugin_versions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `version` varchar(50) NOT NULL,
  `is_frozen` tinyint(1) NOT NULL DEFAULT 0,
  `is_disabled` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_plugin_versions_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_plugin_versions`
--

LOCK TABLES `system_plugin_versions` WRITE;
/*!40000 ALTER TABLE `system_plugin_versions` DISABLE KEYS */;
INSERT INTO `system_plugin_versions` VALUES (1,'October.Demo','1.0.1',0,0,'2023-10-28 06:58:49'),(2,'RainLab.Translate','2.2.7',0,0,'2023-10-28 06:59:55'),(3,'RainLab.User','2.1.0',0,0,'2023-10-28 07:00:10'),(4,'RainLab.Location','1.2.5',0,0,'2023-10-28 07:00:42'),(5,'RainLab.Notify','1.2.1',0,0,'2023-10-28 07:00:43'),(6,'RainLab.UserPlus','1.1.0',0,0,'2023-10-28 07:00:43'),(7,'RainLab.Pages','2.0.3',0,0,'2023-10-28 07:00:57'),(8,'OFFLINE.SiteSearch','1.7.16',0,0,'2023-10-28 07:01:07'),(9,'OFFLINE.Mall','3.0.27',0,0,'2023-10-28 07:01:32'),(10,'RainLab.Builder','2.0.5',0,0,'2023-10-28 07:02:02'),(12,'Tecnotrade.Websync','1.0.63',0,0,'2023-11-10 09:30:34');
/*!40000 ALTER TABLE `system_plugin_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_request_logs`
--

DROP TABLE IF EXISTS `system_request_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_request_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status_code` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `referer` text DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_request_logs`
--

LOCK TABLES `system_request_logs` WRITE;
/*!40000 ALTER TABLE `system_request_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_request_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_revisions`
--

DROP TABLE IF EXISTS `system_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_revisions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(255) NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `cast` varchar(255) DEFAULT NULL,
  `old_value` text DEFAULT NULL,
  `new_value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`),
  KEY `system_revisions_user_id_index` (`user_id`),
  KEY `system_revisions_field_index` (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_revisions`
--

LOCK TABLES `system_revisions` WRITE;
/*!40000 ALTER TABLE `system_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_settings`
--

DROP TABLE IF EXISTS `system_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(255) DEFAULT NULL,
  `value` mediumtext DEFAULT NULL,
  `site_id` int(10) unsigned DEFAULT NULL,
  `site_root_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_settings_item_index` (`item`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_settings`
--

LOCK TABLES `system_settings` WRITE;
/*!40000 ALTER TABLE `system_settings` DISABLE KEYS */;
INSERT INTO `system_settings` VALUES (1,'offline_mall_settings','{\"enabled\":true,\"moderated\":false,\"allow_anonymous\":false,\"use_state\":\"1\",\"admin_email\":\"\",\"index_driver\":\"database\",\"product_page\":\"product\",\"category_page\":\"category\",\"address_page\":\"address\",\"checkout_page\":\"checkout\",\"account_page\":\"myaccount\",\"cart_page\":\"cart\",\"redirect_to_cart\":\"0\",\"order_start\":\"\",\"group_search_results_by_product\":\"1\",\"shipping_selection_before_payment\":\"0\"}',NULL,NULL),(2,'rainlab_builder_settings','{\"author_name\":\"Tecnotrade\",\"author_namespace\":\"Tecnotrade\"}',NULL,NULL);
/*!40000 ALTER TABLE `system_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_site_definitions`
--

DROP TABLE IF EXISTS `system_site_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_site_definitions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `is_custom_url` tinyint(1) NOT NULL DEFAULT 0,
  `app_url` varchar(255) DEFAULT NULL,
  `theme` varchar(255) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `is_host_restricted` tinyint(1) NOT NULL DEFAULT 0,
  `allow_hosts` mediumtext DEFAULT NULL,
  `is_prefixed` tinyint(1) NOT NULL DEFAULT 0,
  `route_prefix` varchar(255) DEFAULT NULL,
  `is_styled` tinyint(1) NOT NULL DEFAULT 0,
  `color_foreground` varchar(255) DEFAULT NULL,
  `color_background` varchar(255) DEFAULT NULL,
  `is_role_restricted` tinyint(1) NOT NULL DEFAULT 0,
  `allow_roles` mediumtext DEFAULT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT 0,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `is_enabled_edit` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_site_definitions_code_index` (`code`),
  KEY `system_site_definitions_group_id_index` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_site_definitions`
--

LOCK TABLES `system_site_definitions` WRITE;
/*!40000 ALTER TABLE `system_site_definitions` DISABLE KEYS */;
INSERT INTO `system_site_definitions` VALUES (1,'Primary Site','primary',1,0,NULL,'artistro08-bootstrap-mall-theme',NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,0,NULL,1,1,1,'2023-10-28 06:58:48','2023-10-28 06:58:48',NULL);
/*!40000 ALTER TABLE `system_site_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_site_groups`
--

DROP TABLE IF EXISTS `system_site_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_site_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_site_groups_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_site_groups`
--

LOCK TABLES `system_site_groups` WRITE;
/*!40000 ALTER TABLE `system_site_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_site_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tailor_content_joins`
--

DROP TABLE IF EXISTS `tailor_content_joins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tailor_content_joins` (
  `parent_id` int(11) DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `relation_id` int(11) DEFAULT NULL,
  `relation_type` varchar(255) DEFAULT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  KEY `tailor_content_joins_pidx` (`parent_id`,`parent_type`),
  KEY `tailor_content_joins_ridx` (`relation_id`,`relation_type`),
  KEY `tailor_content_joins_field_name_index` (`field_name`),
  KEY `tailor_content_joins_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tailor_content_joins`
--

LOCK TABLES `tailor_content_joins` WRITE;
/*!40000 ALTER TABLE `tailor_content_joins` DISABLE KEYS */;
/*!40000 ALTER TABLE `tailor_content_joins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tailor_content_schema`
--

DROP TABLE IF EXISTS `tailor_content_schema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tailor_content_schema` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) DEFAULT NULL,
  `meta` mediumtext DEFAULT NULL,
  `fields` mediumtext DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tailor_content_schema_table_name_index` (`table_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tailor_content_schema`
--

LOCK TABLES `tailor_content_schema` WRITE;
/*!40000 ALTER TABLE `tailor_content_schema` DISABLE KEYS */;
INSERT INTO `tailor_content_schema` VALUES (1,'xc_6743a1c33e574cfaa886e0c0a277fd71c','{\"blueprint_uuid\":\"6743a1c3-3e57-4cfa-a886-e0c0a277fd71\",\"blueprint_type\":\"structure\",\"multisite_sync\":false}','{\"active\":{\"reference\":{\"type\":\"text\",\"name\":\"reference\",\"nullable\":true},\"priority\":{\"type\":\"text\",\"name\":\"priority\",\"nullable\":true},\"changefreq\":{\"type\":\"text\",\"name\":\"changefreq\",\"nullable\":true},\"nesting\":{\"type\":\"boolean\",\"name\":\"nesting\",\"nullable\":true},\"replace\":{\"type\":\"boolean\",\"name\":\"replace\",\"nullable\":true}},\"dropped\":[]}',NULL,'2023-10-28 06:58:50','2023-10-28 06:58:50'),(2,'xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c','{\"blueprint_uuid\":\"a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1\",\"blueprint_type\":\"single\",\"multisite_sync\":false}','{\"active\":[],\"dropped\":[]}',NULL,'2023-10-28 06:58:50','2023-10-28 06:58:50'),(3,'xc_339b11b769ad43c49be16953e7738827c','{\"blueprint_uuid\":\"339b11b7-69ad-43c4-9be1-6953e7738827\",\"blueprint_type\":\"structure\",\"multisite_sync\":false}','{\"active\":{\"content\":{\"type\":\"mediumText\",\"name\":\"content\",\"nullable\":true},\"show_in_toc\":{\"type\":\"boolean\",\"name\":\"show_in_toc\",\"nullable\":true},\"summary_text\":{\"type\":\"mediumText\",\"name\":\"summary_text\",\"nullable\":true}},\"dropped\":[]}',NULL,'2023-10-28 06:58:50','2023-10-28 06:58:50'),(4,'xc_6947ff28b66047d7924024ca6d58aeaec','{\"blueprint_uuid\":\"6947ff28-b660-47d7-9240-24ca6d58aeae\",\"blueprint_type\":\"entry\",\"multisite_sync\":false}','{\"active\":{\"avatar\":{\"type\":\"mediumText\",\"name\":\"avatar\",\"nullable\":true},\"role\":{\"type\":\"text\",\"name\":\"role\",\"nullable\":true},\"about\":{\"type\":\"mediumText\",\"name\":\"about\",\"nullable\":true}},\"dropped\":[]}',NULL,'2023-10-28 06:58:50','2023-10-28 06:58:51'),(5,'xc_b022a74b15e64c6b9eb917efc5103543c','{\"blueprint_uuid\":\"b022a74b-15e6-4c6b-9eb9-17efc5103543\",\"blueprint_type\":\"structure\",\"multisite_sync\":false}','{\"active\":{\"description\":{\"type\":\"text\",\"name\":\"description\",\"nullable\":true}},\"dropped\":[]}',NULL,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(6,'xc_edcd102e05254e4db07e633ae6c18db6c','{\"blueprint_uuid\":\"edcd102e-0525-4e4d-b07e-633ae6c18db6\",\"blueprint_type\":\"stream\",\"multisite_sync\":false}','{\"active\":{\"content\":{\"type\":\"mediumText\",\"name\":\"content\",\"nullable\":true},\"author_id\":{\"type\":\"integer\",\"name\":\"author_id\",\"autoIncrement\":false,\"unsigned\":true,\"nullable\":true},\"featured_text\":{\"type\":\"mediumText\",\"name\":\"featured_text\",\"nullable\":true},\"gallery_media\":{\"type\":\"mediumText\",\"name\":\"gallery_media\",\"nullable\":true}},\"dropped\":[]}',NULL,'2023-10-28 06:58:51','2023-10-28 06:58:51');
/*!40000 ALTER TABLE `tailor_content_schema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tailor_global_joins`
--

DROP TABLE IF EXISTS `tailor_global_joins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tailor_global_joins` (
  `parent_id` int(11) DEFAULT NULL,
  `relation_id` int(11) DEFAULT NULL,
  `relation_type` varchar(255) DEFAULT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  KEY `tailor_global_joins_idx` (`relation_id`,`relation_type`),
  KEY `tailor_global_joins_field_name_index` (`field_name`),
  KEY `tailor_global_joins_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tailor_global_joins`
--

LOCK TABLES `tailor_global_joins` WRITE;
/*!40000 ALTER TABLE `tailor_global_joins` DISABLE KEYS */;
/*!40000 ALTER TABLE `tailor_global_joins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tailor_global_repeaters`
--

DROP TABLE IF EXISTS `tailor_global_repeaters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tailor_global_repeaters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `host_id` int(11) DEFAULT NULL,
  `host_field` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `content_group` varchar(255) DEFAULT NULL,
  `content_value` mediumtext DEFAULT NULL,
  `content_spawn_path` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tailor_global_repeaters_idx` (`host_id`,`host_field`),
  KEY `tailor_global_repeaters_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tailor_global_repeaters`
--

LOCK TABLES `tailor_global_repeaters` WRITE;
/*!40000 ALTER TABLE `tailor_global_repeaters` DISABLE KEYS */;
/*!40000 ALTER TABLE `tailor_global_repeaters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tailor_globals`
--

DROP TABLE IF EXISTS `tailor_globals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tailor_globals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `site_root_id` int(11) DEFAULT NULL,
  `blueprint_uuid` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tailor_globals_site_id_index` (`site_id`),
  KEY `tailor_globals_site_root_id_index` (`site_root_id`),
  KEY `tailor_globals_blueprint_uuid_index` (`blueprint_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tailor_globals`
--

LOCK TABLES `tailor_globals` WRITE;
/*!40000 ALTER TABLE `tailor_globals` DISABLE KEYS */;
/*!40000 ALTER TABLE `tailor_globals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tailor_preview_tokens`
--

DROP TABLE IF EXISTS `tailor_preview_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tailor_preview_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `route` mediumtext DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `count_use` int(11) NOT NULL DEFAULT 0,
  `count_limit` int(11) NOT NULL DEFAULT 0,
  `created_user_id` int(10) unsigned DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tailor_preview_tokens_site_id_index` (`site_id`),
  KEY `tailor_preview_tokens_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tailor_preview_tokens`
--

LOCK TABLES `tailor_preview_tokens` WRITE;
/*!40000 ALTER TABLE `tailor_preview_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tailor_preview_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnotrade_websync_brand`
--

DROP TABLE IF EXISTS `tecnotrade_websync_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tecnotrade_websync_brand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(255) DEFAULT NULL,
  `brand_code` varchar(255) DEFAULT NULL,
  `october_id` int(11) DEFAULT NULL,
  `import_status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` text DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnotrade_websync_brand`
--

LOCK TABLES `tecnotrade_websync_brand` WRITE;
/*!40000 ALTER TABLE `tecnotrade_websync_brand` DISABLE KEYS */;
/*!40000 ALTER TABLE `tecnotrade_websync_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnotrade_websync_brandfields`
--

DROP TABLE IF EXISTS `tecnotrade_websync_brandfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tecnotrade_websync_brandfields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `fieldtype_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnotrade_websync_brandfields`
--

LOCK TABLES `tecnotrade_websync_brandfields` WRITE;
/*!40000 ALTER TABLE `tecnotrade_websync_brandfields` DISABLE KEYS */;
INSERT INTO `tecnotrade_websync_brandfields` VALUES (1,'Name','Nome Brand',NULL,1,'2023-11-08 07:53:35','2023-11-08 07:53:35'),(2,'Code','Codice',NULL,1,'2023-11-08 07:57:38','2023-11-08 07:57:38');
/*!40000 ALTER TABLE `tecnotrade_websync_brandfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnotrade_websync_category`
--

DROP TABLE IF EXISTS `tecnotrade_websync_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tecnotrade_websync_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `description_short` text DEFAULT NULL,
  `parent_code` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `october_id` int(11) DEFAULT NULL,
  `import_status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `october_parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnotrade_websync_category`
--

LOCK TABLES `tecnotrade_websync_category` WRITE;
/*!40000 ALTER TABLE `tecnotrade_websync_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `tecnotrade_websync_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnotrade_websync_clientbrandfields_clientbrandrules`
--

DROP TABLE IF EXISTS `tecnotrade_websync_clientbrandfields_clientbrandrules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tecnotrade_websync_clientbrandfields_clientbrandrules` (
  `client_brand_fields_id` int(11) NOT NULL,
  `client_brand_rules_id` int(11) NOT NULL,
  PRIMARY KEY (`client_brand_fields_id`,`client_brand_rules_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnotrade_websync_clientbrandfields_clientbrandrules`
--

LOCK TABLES `tecnotrade_websync_clientbrandfields_clientbrandrules` WRITE;
/*!40000 ALTER TABLE `tecnotrade_websync_clientbrandfields_clientbrandrules` DISABLE KEYS */;
/*!40000 ALTER TABLE `tecnotrade_websync_clientbrandfields_clientbrandrules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnotrade_websync_clientbrandrules`
--

DROP TABLE IF EXISTS `tecnotrade_websync_clientbrandrules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tecnotrade_websync_clientbrandrules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rule_name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `force_slug` text DEFAULT NULL,
  `elimina_da_mall_se_inizia_per` varchar(255) DEFAULT NULL,
  `elimina_da_mall_se_uguale_a` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_slug` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnotrade_websync_clientbrandrules`
--

LOCK TABLES `tecnotrade_websync_clientbrandrules` WRITE;
/*!40000 ALTER TABLE `tecnotrade_websync_clientbrandrules` DISABLE KEYS */;
INSERT INTO `tecnotrade_websync_clientbrandrules` VALUES (2,'Brand Rule Name','Prova','','','','','2023-11-08 15:19:29','2023-11-08 15:19:29',0);
/*!40000 ALTER TABLE `tecnotrade_websync_clientbrandrules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnotrade_websync_clientcategoryfields_clientcategoryrules`
--

DROP TABLE IF EXISTS `tecnotrade_websync_clientcategoryfields_clientcategoryrules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tecnotrade_websync_clientcategoryfields_clientcategoryrules` (
  `client_category_fields_id` int(11) NOT NULL,
  `client_category_rules_id` int(11) NOT NULL,
  PRIMARY KEY (`client_category_fields_id`,`client_category_rules_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnotrade_websync_clientcategoryfields_clientcategoryrules`
--

LOCK TABLES `tecnotrade_websync_clientcategoryfields_clientcategoryrules` WRITE;
/*!40000 ALTER TABLE `tecnotrade_websync_clientcategoryfields_clientcategoryrules` DISABLE KEYS */;
/*!40000 ALTER TABLE `tecnotrade_websync_clientcategoryfields_clientcategoryrules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnotrade_websync_clientcatfields`
--

DROP TABLE IF EXISTS `tecnotrade_websync_clientcatfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tecnotrade_websync_clientcatfields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `fieldtype_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnotrade_websync_clientcatfields`
--

LOCK TABLES `tecnotrade_websync_clientcatfields` WRITE;
/*!40000 ALTER TABLE `tecnotrade_websync_clientcatfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `tecnotrade_websync_clientcatfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnotrade_websync_clientcatrules`
--

DROP TABLE IF EXISTS `tecnotrade_websync_clientcatrules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tecnotrade_websync_clientcatrules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rule_name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `force_slug` text DEFAULT NULL,
  `elimina_da_mall_se_inizia_per` varchar(255) DEFAULT NULL,
  `elimina_da_mall_se_uguale_a` varchar(255) DEFAULT NULL,
  `is_root_se_valore_null` tinyint(1) DEFAULT NULL,
  `is_root_se_valore_uguale_a` varchar(255) DEFAULT NULL,
  `is_root_se_lunghezza_uguale_a` int(11) DEFAULT NULL,
  `is_child_se_lunghezza_multipla_di` int(11) DEFAULT NULL,
  `child_moltiplicatore_iniziale` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_slug` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnotrade_websync_clientcatrules`
--

LOCK TABLES `tecnotrade_websync_clientcatrules` WRITE;
/*!40000 ALTER TABLE `tecnotrade_websync_clientcatrules` DISABLE KEYS */;
INSERT INTO `tecnotrade_websync_clientcatrules` VALUES (2,'Prova Rule Brand','Prova Rule','','','','',0,'',NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `tecnotrade_websync_clientcatrules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnotrade_websync_clientfields`
--

DROP TABLE IF EXISTS `tecnotrade_websync_clientfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tecnotrade_websync_clientfields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `position_in_csv` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `fieldtype_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnotrade_websync_clientfields`
--

LOCK TABLES `tecnotrade_websync_clientfields` WRITE;
/*!40000 ALTER TABLE `tecnotrade_websync_clientfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `tecnotrade_websync_clientfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnotrade_websync_clientproductfields`
--

DROP TABLE IF EXISTS `tecnotrade_websync_clientproductfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tecnotrade_websync_clientproductfields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `fieldtype_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnotrade_websync_clientproductfields`
--

LOCK TABLES `tecnotrade_websync_clientproductfields` WRITE;
/*!40000 ALTER TABLE `tecnotrade_websync_clientproductfields` DISABLE KEYS */;
INSERT INTO `tecnotrade_websync_clientproductfields` VALUES (2,'Name','Nome',1,'2023-11-06 15:32:55','2023-11-06 15:32:55',0);
/*!40000 ALTER TABLE `tecnotrade_websync_clientproductfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnotrade_websync_clientproductfields_clientproductrules`
--

DROP TABLE IF EXISTS `tecnotrade_websync_clientproductfields_clientproductrules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tecnotrade_websync_clientproductfields_clientproductrules` (
  `order` int(11) NOT NULL DEFAULT 0,
  `client_product_fields_id` int(11) NOT NULL,
  `client_product_rules_id` int(11) NOT NULL,
  PRIMARY KEY (`client_product_fields_id`,`client_product_rules_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnotrade_websync_clientproductfields_clientproductrules`
--

LOCK TABLES `tecnotrade_websync_clientproductfields_clientproductrules` WRITE;
/*!40000 ALTER TABLE `tecnotrade_websync_clientproductfields_clientproductrules` DISABLE KEYS */;
INSERT INTO `tecnotrade_websync_clientproductfields_clientproductrules` VALUES (0,1,2),(0,2,2);
/*!40000 ALTER TABLE `tecnotrade_websync_clientproductfields_clientproductrules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnotrade_websync_clientproductrules`
--

DROP TABLE IF EXISTS `tecnotrade_websync_clientproductrules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tecnotrade_websync_clientproductrules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` text DEFAULT NULL,
  `primary_key` tinyint(1) DEFAULT NULL,
  `somma_campi_numerici` tinyint(1) DEFAULT NULL,
  `concatena_campi_come_stringa` tinyint(1) DEFAULT NULL,
  `elimina_da_mall_se_inizia_per` varchar(255) DEFAULT NULL,
  `force_slug` varchar(191) DEFAULT NULL,
  `rule_name` varchar(255) DEFAULT NULL,
  `elimina_da_mall_se_uguale_a` varchar(10) DEFAULT NULL,
  `is_slug` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnotrade_websync_clientproductrules`
--

LOCK TABLES `tecnotrade_websync_clientproductrules` WRITE;
/*!40000 ALTER TABLE `tecnotrade_websync_clientproductrules` DISABLE KEYS */;
INSERT INTO `tecnotrade_websync_clientproductrules` VALUES (2,'Product Name','2023-11-06 10:25:15','2023-11-08 15:42:15','',1,1,0,'','','Name',NULL,0);
/*!40000 ALTER TABLE `tecnotrade_websync_clientproductrules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnotrade_websync_fieldtype`
--

DROP TABLE IF EXISTS `tecnotrade_websync_fieldtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tecnotrade_websync_fieldtype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `max_length` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnotrade_websync_fieldtype`
--

LOCK TABLES `tecnotrade_websync_fieldtype` WRITE;
/*!40000 ALTER TABLE `tecnotrade_websync_fieldtype` DISABLE KEYS */;
INSERT INTO `tecnotrade_websync_fieldtype` VALUES (1,'varchar (191)','varchat-191',191,'2023-11-09 14:36:43','2023-11-09 14:36:43'),(2,'varchar (255)','varchat-255',255,'2023-11-09 14:36:43','2023-11-09 14:36:43'),(3,'Int (11)','int',11,'2023-11-09 14:36:43','2023-11-09 14:36:43'),(4,'Text (65535)','txt-65535',65535,'2023-11-09 14:36:43','2023-11-09 14:36:43'),(5,'Text (max)','txt-max',-1,'2023-11-09 14:36:43','2023-11-09 14:36:43'),(6,'Boolean (0/1)','bool',1,'2023-11-09 14:36:43','2023-11-09 14:36:43'),(7,'Date Time Utc (Y-m-d H:i:s)','dttm-utc',18,'2023-11-09 14:36:43','2023-11-09 14:36:43'),(8,'Date Utc (Y-m-d)','dt-utc',10,'2023-11-09 14:36:43','2023-11-09 14:36:43'),(9,'Timestamp (numero secondi dal 01/01/1970)','tstamp',-1,'2023-11-09 14:36:43','2023-11-09 14:36:43'),(10,'Decimal (10,2)','decimal-102',12,'2023-11-09 14:36:43','2023-11-09 14:36:43'),(11,'Decimal (10,3)','decimal-103',13,'2023-11-09 14:36:43','2023-11-09 14:36:43'),(12,'Blob (binary - per immagini base64)','blob',-1,'2023-11-09 14:36:43','2023-11-09 14:36:43'),(13,'Float','float',-1,'2023-11-09 14:44:37','2023-11-09 14:44:37');
/*!40000 ALTER TABLE `tecnotrade_websync_fieldtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnotrade_websync_products`
--

DROP TABLE IF EXISTS `tecnotrade_websync_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tecnotrade_websync_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) DEFAULT NULL,
  `codice_interno_univoco` varchar(255) DEFAULT NULL,
  `brand_code` varchar(255) DEFAULT NULL,
  `category_code` varchar(255) DEFAULT NULL,
  `excerpt` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `extended_description` text DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `qty_in_stock_int` int(11) DEFAULT NULL,
  `qty_in_stock_double` double DEFAULT NULL,
  `inventory_management_method` varchar(255) DEFAULT NULL,
  `allow_out_of_stock_purchase` tinyint(1) DEFAULT NULL,
  `stackable` tinyint(1) DEFAULT NULL,
  `shippable` tinyint(1) DEFAULT NULL,
  `price_included_taxes` tinyint(1) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `mpn` varchar(255) DEFAULT NULL,
  `gtin` varchar(255) DEFAULT NULL,
  `original_slug` varchar(255) DEFAULT NULL,
  `october_id` int(11) DEFAULT NULL,
  `category_october_id` int(11) DEFAULT NULL,
  `brand_october_id` int(11) DEFAULT NULL,
  `import_status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnotrade_websync_products`
--

LOCK TABLES `tecnotrade_websync_products` WRITE;
/*!40000 ALTER TABLE `tecnotrade_websync_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `tecnotrade_websync_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnotrade_websync_syncro_table_brand_fields`
--

DROP TABLE IF EXISTS `tecnotrade_websync_syncro_table_brand_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tecnotrade_websync_syncro_table_brand_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) DEFAULT NULL,
  `is_relation_with_product_table` tinyint(1) DEFAULT NULL,
  `clientproductrules_id` int(11) DEFAULT NULL,
  `fieldtype_id` int(11) DEFAULT NULL,
  `is_primary_key` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `clientbrandrules_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnotrade_websync_syncro_table_brand_fields`
--

LOCK TABLES `tecnotrade_websync_syncro_table_brand_fields` WRITE;
/*!40000 ALTER TABLE `tecnotrade_websync_syncro_table_brand_fields` DISABLE KEYS */;
INSERT INTO `tecnotrade_websync_syncro_table_brand_fields` VALUES (1,'brand_name',NULL,NULL,2,0,'2023-11-10 07:50:42','2023-11-10 07:50:42',NULL),(2,'slug',NULL,NULL,1,0,'2023-11-10 07:50:42','2023-11-10 07:50:42',NULL),(3,'brand_code',NULL,NULL,2,1,'2023-11-10 07:50:42','2023-11-10 07:50:42',NULL),(4,'description',NULL,NULL,4,0,'2023-11-10 07:50:42','2023-11-10 07:50:42',NULL),(5,'website',NULL,NULL,2,0,'2023-11-10 07:50:42','2023-11-10 07:50:42',NULL);
/*!40000 ALTER TABLE `tecnotrade_websync_syncro_table_brand_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnotrade_websync_syncro_table_category_fields`
--

DROP TABLE IF EXISTS `tecnotrade_websync_syncro_table_category_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tecnotrade_websync_syncro_table_category_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) DEFAULT NULL,
  `is_relation_with_product_table` tinyint(1) DEFAULT NULL,
  `clientproductrules_id` int(11) DEFAULT NULL,
  `is_primary_key` tinyint(1) DEFAULT NULL,
  `clientcategoryrules_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `fieldtype_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnotrade_websync_syncro_table_category_fields`
--

LOCK TABLES `tecnotrade_websync_syncro_table_category_fields` WRITE;
/*!40000 ALTER TABLE `tecnotrade_websync_syncro_table_category_fields` DISABLE KEYS */;
INSERT INTO `tecnotrade_websync_syncro_table_category_fields` VALUES (1,'name',NULL,NULL,0,NULL,'2023-11-10 09:30:34','2023-11-10 09:30:34',2),(2,'code',NULL,NULL,1,NULL,'2023-11-10 09:30:34','2023-11-10 09:30:34',2),(3,'slug',NULL,NULL,0,NULL,'2023-11-10 09:30:34','2023-11-10 09:30:34',1),(4,'meta_title',NULL,NULL,0,NULL,'2023-11-10 09:30:34','2023-11-10 09:30:34',2),(5,'meta_description',NULL,NULL,0,NULL,'2023-11-10 09:30:34','2023-11-10 09:30:34',4),(6,'description',NULL,NULL,0,NULL,'2023-11-10 09:30:34','2023-11-10 09:30:34',4),(7,'description_short',NULL,NULL,0,NULL,'2023-11-10 09:30:34','2023-11-10 09:30:34',4),(8,'parent_code',NULL,NULL,0,NULL,'2023-11-10 09:30:34','2023-11-10 09:30:34',2),(9,'level',NULL,NULL,0,NULL,'2023-11-10 09:30:34','2023-11-10 09:30:34',3);
/*!40000 ALTER TABLE `tecnotrade_websync_syncro_table_category_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnotrade_websync_syncro_table_product_fields`
--

DROP TABLE IF EXISTS `tecnotrade_websync_syncro_table_product_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tecnotrade_websync_syncro_table_product_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) DEFAULT NULL,
  `nullable` tinyint(1) DEFAULT NULL,
  `is_relation_field_with_brand_table` tinyint(1) DEFAULT NULL,
  `is_relation_field_with_category_table` tinyint(1) DEFAULT NULL,
  `fieldtype_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `clientproductrules_id` int(11) DEFAULT NULL,
  `clientbrandrules_id` int(11) DEFAULT NULL,
  `clientcategoryrules_id` int(11) DEFAULT NULL,
  `is_primary_key` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnotrade_websync_syncro_table_product_fields`
--

LOCK TABLES `tecnotrade_websync_syncro_table_product_fields` WRITE;
/*!40000 ALTER TABLE `tecnotrade_websync_syncro_table_product_fields` DISABLE KEYS */;
INSERT INTO `tecnotrade_websync_syncro_table_product_fields` VALUES (1,'product_name',NULL,NULL,NULL,2,'2023-11-09 14:50:27','2023-11-09 14:50:27',NULL,NULL,NULL,0),(2,'codice_interno_univoco',NULL,NULL,NULL,2,'2023-11-09 14:50:27','2023-11-09 14:50:27',NULL,NULL,NULL,1),(3,'brand_code',NULL,NULL,NULL,2,'2023-11-09 14:50:27','2023-11-09 14:50:27',NULL,NULL,NULL,0),(4,'category_code',NULL,NULL,NULL,2,'2023-11-09 14:50:27','2023-11-09 14:50:27',NULL,NULL,NULL,0),(5,'excerpt',NULL,NULL,NULL,4,'2023-11-09 14:50:27','2023-11-09 14:50:27',NULL,NULL,NULL,0),(6,'description',NULL,NULL,NULL,4,'2023-11-09 14:50:27','2023-11-09 14:50:27',NULL,NULL,NULL,0),(7,'extended_description',NULL,NULL,NULL,5,'2023-11-09 14:50:27','2023-11-09 14:50:27',NULL,NULL,NULL,0),(8,'meta_title',NULL,NULL,NULL,2,'2023-11-09 14:50:27','2023-11-09 14:50:27',NULL,NULL,NULL,0),(9,'meta_description',NULL,NULL,NULL,4,'2023-11-09 14:50:27','2023-11-09 14:50:27',NULL,NULL,NULL,0),(10,'qty_in_stock_int',0,0,0,3,'2023-11-09 14:50:27','2023-11-09 14:52:13',NULL,NULL,NULL,0),(11,'qty_in_stock_double',NULL,NULL,NULL,13,'2023-11-09 14:50:27','2023-11-09 14:50:27',NULL,NULL,NULL,0),(12,'inventory_management_method',NULL,NULL,NULL,12,'2023-11-09 14:50:27','2023-11-09 14:50:27',NULL,NULL,NULL,0),(13,'allow_out_of_stock_purchase',NULL,NULL,NULL,6,'2023-11-09 14:50:27','2023-11-09 14:50:27',NULL,NULL,NULL,0),(14,'stackable',NULL,NULL,NULL,6,'2023-11-09 14:50:27','2023-11-09 14:50:27',NULL,NULL,NULL,0),(15,'shippable',NULL,NULL,NULL,6,'2023-11-09 14:50:27','2023-11-09 14:50:27',NULL,NULL,NULL,0),(16,'price_included_taxes',NULL,NULL,NULL,6,'2023-11-09 14:50:27','2023-11-09 14:50:27',NULL,NULL,NULL,0),(17,'price',0,0,0,10,'2023-11-09 14:50:27','2023-11-09 14:54:34',NULL,NULL,NULL,0),(18,'mpn',NULL,NULL,NULL,2,'2023-11-09 14:50:27','2023-11-09 14:50:27',NULL,NULL,NULL,0),(19,'gtin',NULL,NULL,NULL,2,'2023-11-09 14:50:27','2023-11-09 14:50:27',NULL,NULL,NULL,0),(20,'original_slug',NULL,NULL,NULL,1,'2023-11-09 14:50:27','2023-11-09 14:50:27',NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `tecnotrade_websync_syncro_table_product_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_groups_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES (1,'Guest','guest','Default group for guest users.','2023-10-28 07:00:10','2023-10-28 07:00:10'),(2,'Registered','registered','Default group for registered users.','2023-10-28 07:00:10','2023-10-28 07:00:10');
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_throttle`
--

DROP TABLE IF EXISTS `user_throttle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_throttle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT 0,
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT 0,
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT 0,
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_throttle_user_id_index` (`user_id`),
  KEY `user_throttle_ip_address_index` (`ip_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_throttle`
--

LOCK TABLES `user_throttle` WRITE;
/*!40000 ALTER TABLE `user_throttle` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_throttle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `persist_code` varchar(255) DEFAULT NULL,
  `reset_password_code` varchar(255) DEFAULT NULL,
  `permissions` text DEFAULT NULL,
  `is_activated` tinyint(1) NOT NULL DEFAULT 0,
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `last_seen` timestamp NULL DEFAULT NULL,
  `is_guest` tinyint(1) NOT NULL DEFAULT 0,
  `is_superuser` tinyint(1) NOT NULL DEFAULT 0,
  `created_ip_address` varchar(255) DEFAULT NULL,
  `last_ip_address` varchar(255) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `street_addr` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `state_id` int(10) unsigned DEFAULT NULL,
  `country_id` int(10) unsigned DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `offline_mall_customer_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_activation_code_index` (`activation_code`),
  KEY `users_reset_password_code_index` (`reset_password_code`),
  KEY `users_login_index` (`username`),
  KEY `users_state_id_index` (`state_id`),
  KEY `users_country_id_index` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_groups` (
  `user_id` int(10) unsigned NOT NULL,
  `user_group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xc_339b11b769ad43c49be16953e7738827c`
--

DROP TABLE IF EXISTS `xc_339b11b769ad43c49be16953e7738827c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xc_339b11b769ad43c49be16953e7738827c` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `site_root_id` int(11) DEFAULT NULL,
  `blueprint_uuid` varchar(255) DEFAULT NULL,
  `content_group` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `published_at_date` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `draft_mode` int(11) NOT NULL DEFAULT 1,
  `primary_id` int(10) unsigned DEFAULT NULL,
  `primary_attrs` mediumtext DEFAULT NULL,
  `is_version` tinyint(1) NOT NULL DEFAULT 0,
  `fullslug` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `nest_depth` int(11) DEFAULT NULL,
  `content` mediumtext DEFAULT NULL,
  `show_in_toc` tinyint(1) DEFAULT NULL,
  `summary_text` mediumtext DEFAULT NULL,
  `created_user_id` int(10) unsigned DEFAULT NULL,
  `updated_user_id` int(10) unsigned DEFAULT NULL,
  `deleted_user_id` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xc_339b11b769ad43c49be16953e7738827c_site_id_index` (`site_id`),
  KEY `xc_339b11b769ad43c49be16953e7738827c_site_root_id_index` (`site_root_id`),
  KEY `xc_339b11b769ad43c49be16953e7738827c_blueprint_uuid_index` (`blueprint_uuid`),
  KEY `xc_339b11b769ad43c49be16953e7738827c_content_group_index` (`content_group`),
  KEY `xc_339b11b769ad43c49be16953e7738827c_slug_index` (`slug`),
  KEY `xc_339b11b769ad43c49be16953e7738827c_primary_id_index` (`primary_id`),
  KEY `xc_339b11b769ad43c49be16953e7738827c_fullslug_index` (`fullslug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Content for Article [Page\\Article].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_339b11b769ad43c49be16953e7738827c`
--

LOCK TABLES `xc_339b11b769ad43c49be16953e7738827c` WRITE;
/*!40000 ALTER TABLE `xc_339b11b769ad43c49be16953e7738827c` DISABLE KEYS */;
INSERT INTO `xc_339b11b769ad43c49be16953e7738827c` VALUES (1,1,1,'339b11b7-69ad-43c4-9be1-6953e7738827',NULL,'Our Locations','our-locations',1,NULL,'2023-10-28 06:58:51',NULL,1,NULL,NULL,0,'our-locations',NULL,1,8,0,'<p>The term location generally implies a higher degree of certainty than place, the latter often indicating an entity with an ambiguous boundary, relying more on human or social attributes of place identity and sense of place than on geometry. An absolute location can be designated using a specific pairing of latitude and longitude in a Cartesian coordinate grid (for example, a spherical coordinate system or an ellipsoid-based system such as the World Geodetic System) or similar methods. For instance, the position of Lake Maracaibo in Venezuela can be expressed using the coordinate system as the location 9.80°N (latitude), 71.56°W (longitude).</p>',1,'In geography, location or place are used to denote a region (point, line, or area) on Earth\'s surface or elsewhere.',NULL,NULL,NULL,NULL,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(2,1,2,'339b11b7-69ad-43c4-9be1-6953e7738827',NULL,'Canberra','canberra',1,NULL,'2023-10-28 06:58:51',NULL,1,NULL,NULL,0,'our-locations/canberra',1,2,3,1,'<p>Unusual among Australian cities, it is an entirely planned city. The city is located at the northern end of the Australian Capital Territory[11] at the northern tip of the Australian Alps, the country\'s highest mountain range. As of June 2020, Canberra\'s estimated population was 431,380.[12]</p><p>The area chosen for the capital had been inhabited by Indigenous Australians for up to 21,000 years,[13] with the principal group being the Ngunnawal people. European settlement commenced in the first half of the 19th century, as evidenced by surviving landmarks such as St John\'s Anglican Church and Blundells Cottage. On 1 January 1901, federation of the colonies of Australia was achieved. Following a long dispute over whether Sydney or Melbourne should be the national capital,[14] a compromise was reached: the new capital would be built in New South Wales, so long as it was at least 100 miles (160 km) from Sydney. The capital city was founded and formally named as Canberra in 1913. A blueprint by American architects Walter Burley Griffin and Marion Mahony Griffin was selected after an international design contest, and construction commenced in 1913.[15] The Griffins\' plan featured geometric motifs and was centred on axes aligned with significant topographical landmarks such as Black Mountain, Mount Ainslie, Capital Hill and City Hill. Canberra\'s mountainous location makes it the only mainland Australian city where snow-capped mountains can be seen in winter; although snow in the city itself is rare.</p><p>As the seat of the Government of Australia, Canberra is home to many important institutions of the federal government, national monuments and museums. This includes Parliament House, Government House, the High Court and the headquarters of numerous government agencies. It is the location of many social and cultural institutions of national significance such as the Australian War Memorial, the Australian National University, the Royal Australian Mint, the Australian Institute of Sport, the National Gallery, the National Museum and the National Library. The city is home to many important institutions of the Australian Defence Force including the Royal Military College Duntroon and the Australian Defence Force Academy. It hosts all foreign embassies in Australia as well as regional headquarters of many international organisations, not-for-profit groups, lobbying groups and professional associations.</p>',1,'Canberra (/ˈkænbərə/ KAN-bə-rə) is the capital city of Australia. Founded following the federation of the colonies of Australia as the seat of government for the new nation, it is Australia\'s largest inland city and the eighth-largest city overall.',NULL,NULL,NULL,NULL,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(3,1,3,'339b11b7-69ad-43c4-9be1-6953e7738827',NULL,'Sydney','sydney',1,NULL,'2023-10-28 06:58:51',NULL,1,NULL,NULL,0,'our-locations/sydney',1,4,5,1,'<p>Located on Australia\'s east coast, the metropolis surrounds Port Jackson and extends about 70 km (43.5 mi) on its periphery towards the Blue Mountains to the west, Hawkesbury to the north, the Royal National Park to the south and Macarthur to the south-west. Sydney is made up of 658 suburbs, spread across 33 local government areas. Residents of the city are known as \"Sydneysiders\". As of June 2020, Sydney\'s estimated metropolitan population was 5,361,466, meaning the city is home to approximately 66% of the state\'s population. Nicknames of the city include the \'Emerald City\' and the \'Harbour City\'.</p><p>Indigenous Australians have inhabited the Sydney area for at least 30,000 years, and thousands of Aboriginal engravings remain throughout the region. During his first Pacific voyage in 1770, Lieutenant James Cook and his crew became the first Europeans to chart the eastern coast of Australia, making landfall at Botany Bay. In 1788, the First Fleet of convicts, led by Arthur Phillip, founded Sydney as a British penal colony, the first European settlement in Australia. After World War II, it experienced mass migration and became one of the most multicultural cities in the world. Furthermore, 45.4% of the population reported having been born overseas, and the city has the third-largest foreign-born population of any city in the world after London and New York City.</p><p>Despite being one of the most expensive cities in the world, Sydney frequently ranks in the top ten most liveable cities in the world. It is classified as an Alpha global city by the Globalization and World Cities Research Network, indicating its influence in the region and throughout the world. Ranked eleventh in the world for economic opportunity, Sydney has an advanced market economy with strengths in finance, manufacturing and tourism. Established in 1850, the University of Sydney was Australia\'s first university and is regarded as one of the world\'s leading universities.</p>',1,'Sydney is the capital city of the state of New South Wales, and the most populous city in Australia and Oceania.',NULL,NULL,NULL,NULL,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(4,1,4,'339b11b7-69ad-43c4-9be1-6953e7738827',NULL,'Vancouver','vancouver',1,NULL,'2023-10-28 06:58:51',NULL,1,NULL,NULL,0,'our-locations/vancouver',1,6,7,1,'<p>As the most populous city in the province, the 2021 census recorded 662,248 people in the city, up from 631,486 in 2016. The Greater Vancouver area had a population of 2,642,825 in 2021, making it the third-largest metropolitan area in Canada. Vancouver has the highest population density in Canada, with over 5,400 people per square kilometre. Vancouver is one of the most ethnically and linguistically diverse cities in Canada: 52 percent of its residents are not native English speakers, 48.9 percent are native speakers of neither English nor French, and 50.6 percent of residents belong to visible minority groups.</p><p>Vancouver is one of the most livable cities in Canada and in the world. In terms of housing affordability, Vancouver is also one of the most expensive cities in Canada and in the world. Vancouver plans to become the greenest city in the world. Vancouverism is the city\'s urban planning design philosophy.</p><p>Indigenous settlement of Vancouver began more than 10,000 years ago, and the city is on the traditional and unceded territories of the Squamish, Musqueam, and Tsleil-Waututh (Burrard) peoples. The beginnings of the modern city, which was originally named Gastown, grew around the site of a makeshift tavern on the western edges of Hastings Mill that was built on July 1, 1867, and owned by proprietor Gassy Jack. The original site is marked by the Gastown steam clock. Gastown then formally registered as a townsite dubbed Granville, Burrard Inlet. The city was renamed \"Vancouver\" in 1886, through a deal with the Canadian Pacific Railway (CPR). The Canadian Pacific transcontinental railway was extended to the city by 1887. The city\'s large natural seaport on the Pacific Ocean became a vital link in the trade between Asia-Pacific, East Asia, Europe, and Eastern Canada.</p>',1,'Vancouver is a major city in western Canada, located in the Lower Mainland region of British Columbia.',NULL,NULL,NULL,NULL,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(5,1,5,'339b11b7-69ad-43c4-9be1-6953e7738827',NULL,'Knowledge Base','knowledge-base',1,NULL,'2023-10-28 06:58:51',NULL,1,NULL,NULL,0,'our-locations/knowledge-base',NULL,9,10,0,'<p>Knowledge Base</p>',1,'',NULL,NULL,NULL,NULL,'2023-10-28 06:58:51','2023-10-28 06:58:51');
/*!40000 ALTER TABLE `xc_339b11b769ad43c49be16953e7738827c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xc_339b11b769ad43c49be16953e7738827j`
--

DROP TABLE IF EXISTS `xc_339b11b769ad43c49be16953e7738827j`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xc_339b11b769ad43c49be16953e7738827j` (
  `parent_id` int(11) DEFAULT NULL,
  `relation_id` int(11) DEFAULT NULL,
  `relation_type` varchar(255) DEFAULT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  KEY `xc_339b11b769ad43c49be16953e7738827j_idx` (`relation_id`,`relation_type`),
  KEY `xc_339b11b769ad43c49be16953e7738827j_field_name_index` (`field_name`),
  KEY `xc_339b11b769ad43c49be16953e7738827j_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Joins for Article [Page\\Article].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_339b11b769ad43c49be16953e7738827j`
--

LOCK TABLES `xc_339b11b769ad43c49be16953e7738827j` WRITE;
/*!40000 ALTER TABLE `xc_339b11b769ad43c49be16953e7738827j` DISABLE KEYS */;
/*!40000 ALTER TABLE `xc_339b11b769ad43c49be16953e7738827j` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xc_339b11b769ad43c49be16953e7738827r`
--

DROP TABLE IF EXISTS `xc_339b11b769ad43c49be16953e7738827r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xc_339b11b769ad43c49be16953e7738827r` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `host_id` int(11) DEFAULT NULL,
  `host_field` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `content_group` varchar(255) DEFAULT NULL,
  `content_value` mediumtext DEFAULT NULL,
  `content_spawn_path` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xc_339b11b769ad43c49be16953e7738827r_idx` (`host_id`,`host_field`),
  KEY `xc_339b11b769ad43c49be16953e7738827r_site_id_index` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Repeaters for Article [Page\\Article].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_339b11b769ad43c49be16953e7738827r`
--

LOCK TABLES `xc_339b11b769ad43c49be16953e7738827r` WRITE;
/*!40000 ALTER TABLE `xc_339b11b769ad43c49be16953e7738827r` DISABLE KEYS */;
INSERT INTO `xc_339b11b769ad43c49be16953e7738827r` VALUES (1,2,'external_links',NULL,NULL,'{\"link_text\":\"Canberra travel guide from Wikivoyage\",\"link_url\":\"https:\\/\\/en.wikivoyage.org\\/wiki\\/Canberra\"}','Tailor\\Models\\EntryRecord@339b11b7-69ad-43c4-9be1-6953e7738827.external_links',1,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(2,2,'external_links',NULL,NULL,'{\"link_text\":\"Official Tourism Website\",\"link_url\":\"https:\\/\\/visitcanberra.com.au\\/\"}','Tailor\\Models\\EntryRecord@339b11b7-69ad-43c4-9be1-6953e7738827.external_links',2,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(3,2,'external_links',NULL,NULL,'{\"link_text\":\"Canberra 100 – Celebrating Canberra\'s 100th anniversary\",\"link_url\":\"https:\\/\\/www.canberra100.com.au\\/\"}','Tailor\\Models\\EntryRecord@339b11b7-69ad-43c4-9be1-6953e7738827.external_links',3,'2023-10-28 06:58:51','2023-10-28 06:58:51');
/*!40000 ALTER TABLE `xc_339b11b769ad43c49be16953e7738827r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xc_6743a1c33e574cfaa886e0c0a277fd71c`
--

DROP TABLE IF EXISTS `xc_6743a1c33e574cfaa886e0c0a277fd71c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xc_6743a1c33e574cfaa886e0c0a277fd71c` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `site_root_id` int(11) DEFAULT NULL,
  `blueprint_uuid` varchar(255) DEFAULT NULL,
  `content_group` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `published_at_date` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `draft_mode` int(11) NOT NULL DEFAULT 1,
  `primary_id` int(10) unsigned DEFAULT NULL,
  `primary_attrs` mediumtext DEFAULT NULL,
  `is_version` tinyint(1) NOT NULL DEFAULT 0,
  `fullslug` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `nest_depth` int(11) DEFAULT NULL,
  `reference` text DEFAULT NULL,
  `priority` text DEFAULT NULL,
  `changefreq` text DEFAULT NULL,
  `nesting` tinyint(1) DEFAULT NULL,
  `replace` tinyint(1) DEFAULT NULL,
  `created_user_id` int(10) unsigned DEFAULT NULL,
  `updated_user_id` int(10) unsigned DEFAULT NULL,
  `deleted_user_id` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xc_6743a1c33e574cfaa886e0c0a277fd71c_site_id_index` (`site_id`),
  KEY `xc_6743a1c33e574cfaa886e0c0a277fd71c_site_root_id_index` (`site_root_id`),
  KEY `xc_6743a1c33e574cfaa886e0c0a277fd71c_blueprint_uuid_index` (`blueprint_uuid`),
  KEY `xc_6743a1c33e574cfaa886e0c0a277fd71c_content_group_index` (`content_group`),
  KEY `xc_6743a1c33e574cfaa886e0c0a277fd71c_slug_index` (`slug`),
  KEY `xc_6743a1c33e574cfaa886e0c0a277fd71c_primary_id_index` (`primary_id`),
  KEY `xc_6743a1c33e574cfaa886e0c0a277fd71c_fullslug_index` (`fullslug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Content for Sitemap [Site\\Sitemap].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_6743a1c33e574cfaa886e0c0a277fd71c`
--

LOCK TABLES `xc_6743a1c33e574cfaa886e0c0a277fd71c` WRITE;
/*!40000 ALTER TABLE `xc_6743a1c33e574cfaa886e0c0a277fd71c` DISABLE KEYS */;
/*!40000 ALTER TABLE `xc_6743a1c33e574cfaa886e0c0a277fd71c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xc_6743a1c33e574cfaa886e0c0a277fd71j`
--

DROP TABLE IF EXISTS `xc_6743a1c33e574cfaa886e0c0a277fd71j`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xc_6743a1c33e574cfaa886e0c0a277fd71j` (
  `parent_id` int(11) DEFAULT NULL,
  `relation_id` int(11) DEFAULT NULL,
  `relation_type` varchar(255) DEFAULT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  KEY `xc_6743a1c33e574cfaa886e0c0a277fd71j_idx` (`relation_id`,`relation_type`),
  KEY `xc_6743a1c33e574cfaa886e0c0a277fd71j_field_name_index` (`field_name`),
  KEY `xc_6743a1c33e574cfaa886e0c0a277fd71j_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Joins for Sitemap [Site\\Sitemap].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_6743a1c33e574cfaa886e0c0a277fd71j`
--

LOCK TABLES `xc_6743a1c33e574cfaa886e0c0a277fd71j` WRITE;
/*!40000 ALTER TABLE `xc_6743a1c33e574cfaa886e0c0a277fd71j` DISABLE KEYS */;
/*!40000 ALTER TABLE `xc_6743a1c33e574cfaa886e0c0a277fd71j` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xc_6743a1c33e574cfaa886e0c0a277fd71r`
--

DROP TABLE IF EXISTS `xc_6743a1c33e574cfaa886e0c0a277fd71r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xc_6743a1c33e574cfaa886e0c0a277fd71r` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `host_id` int(11) DEFAULT NULL,
  `host_field` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `content_group` varchar(255) DEFAULT NULL,
  `content_value` mediumtext DEFAULT NULL,
  `content_spawn_path` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xc_6743a1c33e574cfaa886e0c0a277fd71r_idx` (`host_id`,`host_field`),
  KEY `xc_6743a1c33e574cfaa886e0c0a277fd71r_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Repeaters for Sitemap [Site\\Sitemap].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_6743a1c33e574cfaa886e0c0a277fd71r`
--

LOCK TABLES `xc_6743a1c33e574cfaa886e0c0a277fd71r` WRITE;
/*!40000 ALTER TABLE `xc_6743a1c33e574cfaa886e0c0a277fd71r` DISABLE KEYS */;
/*!40000 ALTER TABLE `xc_6743a1c33e574cfaa886e0c0a277fd71r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xc_6947ff28b66047d7924024ca6d58aeaec`
--

DROP TABLE IF EXISTS `xc_6947ff28b66047d7924024ca6d58aeaec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xc_6947ff28b66047d7924024ca6d58aeaec` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `site_root_id` int(11) DEFAULT NULL,
  `blueprint_uuid` varchar(255) DEFAULT NULL,
  `content_group` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `published_at_date` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `draft_mode` int(11) NOT NULL DEFAULT 1,
  `primary_id` int(10) unsigned DEFAULT NULL,
  `primary_attrs` mediumtext DEFAULT NULL,
  `is_version` tinyint(1) NOT NULL DEFAULT 0,
  `avatar` mediumtext DEFAULT NULL,
  `role` text DEFAULT NULL,
  `about` mediumtext DEFAULT NULL,
  `created_user_id` int(10) unsigned DEFAULT NULL,
  `updated_user_id` int(10) unsigned DEFAULT NULL,
  `deleted_user_id` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xc_6947ff28b66047d7924024ca6d58aeaec_site_id_index` (`site_id`),
  KEY `xc_6947ff28b66047d7924024ca6d58aeaec_site_root_id_index` (`site_root_id`),
  KEY `xc_6947ff28b66047d7924024ca6d58aeaec_blueprint_uuid_index` (`blueprint_uuid`),
  KEY `xc_6947ff28b66047d7924024ca6d58aeaec_content_group_index` (`content_group`),
  KEY `xc_6947ff28b66047d7924024ca6d58aeaec_slug_index` (`slug`),
  KEY `xc_6947ff28b66047d7924024ca6d58aeaec_primary_id_index` (`primary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Content for Author [Blog\\Author].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_6947ff28b66047d7924024ca6d58aeaec`
--

LOCK TABLES `xc_6947ff28b66047d7924024ca6d58aeaec` WRITE;
/*!40000 ALTER TABLE `xc_6947ff28b66047d7924024ca6d58aeaec` DISABLE KEYS */;
INSERT INTO `xc_6947ff28b66047d7924024ca6d58aeaec` VALUES (1,1,1,'6947ff28-b660-47d7-9240-24ca6d58aeae',NULL,'John Smith','john-smith',1,NULL,'2023-10-28 06:58:51',NULL,1,NULL,NULL,0,NULL,'Manager','Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',NULL,NULL,NULL,NULL,'2023-10-28 06:58:51','2023-10-28 06:58:51');
/*!40000 ALTER TABLE `xc_6947ff28b66047d7924024ca6d58aeaec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xc_6947ff28b66047d7924024ca6d58aeaej`
--

DROP TABLE IF EXISTS `xc_6947ff28b66047d7924024ca6d58aeaej`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xc_6947ff28b66047d7924024ca6d58aeaej` (
  `parent_id` int(11) DEFAULT NULL,
  `relation_id` int(11) DEFAULT NULL,
  `relation_type` varchar(255) DEFAULT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  KEY `xc_6947ff28b66047d7924024ca6d58aeaej_idx` (`relation_id`,`relation_type`),
  KEY `xc_6947ff28b66047d7924024ca6d58aeaej_field_name_index` (`field_name`),
  KEY `xc_6947ff28b66047d7924024ca6d58aeaej_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Joins for Author [Blog\\Author].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_6947ff28b66047d7924024ca6d58aeaej`
--

LOCK TABLES `xc_6947ff28b66047d7924024ca6d58aeaej` WRITE;
/*!40000 ALTER TABLE `xc_6947ff28b66047d7924024ca6d58aeaej` DISABLE KEYS */;
/*!40000 ALTER TABLE `xc_6947ff28b66047d7924024ca6d58aeaej` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xc_6947ff28b66047d7924024ca6d58aeaer`
--

DROP TABLE IF EXISTS `xc_6947ff28b66047d7924024ca6d58aeaer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xc_6947ff28b66047d7924024ca6d58aeaer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `host_id` int(11) DEFAULT NULL,
  `host_field` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `content_group` varchar(255) DEFAULT NULL,
  `content_value` mediumtext DEFAULT NULL,
  `content_spawn_path` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xc_6947ff28b66047d7924024ca6d58aeaer_idx` (`host_id`,`host_field`),
  KEY `xc_6947ff28b66047d7924024ca6d58aeaer_site_id_index` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Repeaters for Author [Blog\\Author].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_6947ff28b66047d7924024ca6d58aeaer`
--

LOCK TABLES `xc_6947ff28b66047d7924024ca6d58aeaer` WRITE;
/*!40000 ALTER TABLE `xc_6947ff28b66047d7924024ca6d58aeaer` DISABLE KEYS */;
INSERT INTO `xc_6947ff28b66047d7924024ca6d58aeaer` VALUES (1,1,'social_links',NULL,NULL,'{\"platform\":\"twitter\",\"url\":\"https:\\/\\/twitter.com\\/octobercms\"}','Tailor\\Models\\EntryRecord@6947ff28-b660-47d7-9240-24ca6d58aeae.social_links',1,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(2,1,'social_links',NULL,NULL,'{\"platform\":\"youtube\",\"url\":\"https:\\/\\/www.youtube.com\\/c\\/OctoberCMSOfficial\"}','Tailor\\Models\\EntryRecord@6947ff28-b660-47d7-9240-24ca6d58aeae.social_links',2,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(3,1,'social_links',NULL,NULL,'{\"platform\":\"facebook\",\"url\":\"https:\\/\\/facebook.com\\/octobercms\"}','Tailor\\Models\\EntryRecord@6947ff28-b660-47d7-9240-24ca6d58aeae.social_links',3,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(4,1,'social_links',NULL,NULL,'{\"platform\":\"linkedin\",\"url\":\"https:\\/\\/www.linkedin.com\\/company\\/october-cms\\/\"}','Tailor\\Models\\EntryRecord@6947ff28-b660-47d7-9240-24ca6d58aeae.social_links',4,'2023-10-28 06:58:51','2023-10-28 06:58:51');
/*!40000 ALTER TABLE `xc_6947ff28b66047d7924024ca6d58aeaer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c`
--

DROP TABLE IF EXISTS `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `site_root_id` int(11) DEFAULT NULL,
  `blueprint_uuid` varchar(255) DEFAULT NULL,
  `content_group` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `published_at_date` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `draft_mode` int(11) NOT NULL DEFAULT 1,
  `primary_id` int(10) unsigned DEFAULT NULL,
  `primary_attrs` mediumtext DEFAULT NULL,
  `is_version` tinyint(1) NOT NULL DEFAULT 0,
  `created_user_id` int(10) unsigned DEFAULT NULL,
  `updated_user_id` int(10) unsigned DEFAULT NULL,
  `deleted_user_id` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c_site_id_index` (`site_id`),
  KEY `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c_site_root_id_index` (`site_root_id`),
  KEY `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c_blueprint_uuid_index` (`blueprint_uuid`),
  KEY `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c_content_group_index` (`content_group`),
  KEY `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c_slug_index` (`slug`),
  KEY `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c_primary_id_index` (`primary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Content for About Page [Page\\About].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c`
--

LOCK TABLES `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c` WRITE;
/*!40000 ALTER TABLE `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c` DISABLE KEYS */;
INSERT INTO `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c` VALUES (1,1,1,'a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1',NULL,'About Us','about-us',1,NULL,'2023-10-28 06:58:51',NULL,1,NULL,NULL,0,NULL,NULL,NULL,NULL,'2023-10-28 06:58:51','2023-10-28 06:58:51');
/*!40000 ALTER TABLE `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1j`
--

DROP TABLE IF EXISTS `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1j`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1j` (
  `parent_id` int(11) DEFAULT NULL,
  `relation_id` int(11) DEFAULT NULL,
  `relation_type` varchar(255) DEFAULT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  KEY `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1j_idx` (`relation_id`,`relation_type`),
  KEY `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1j_field_name_index` (`field_name`),
  KEY `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1j_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Joins for About Page [Page\\About].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1j`
--

LOCK TABLES `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1j` WRITE;
/*!40000 ALTER TABLE `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1j` DISABLE KEYS */;
/*!40000 ALTER TABLE `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1j` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1r`
--

DROP TABLE IF EXISTS `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1r` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `host_id` int(11) DEFAULT NULL,
  `host_field` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `content_group` varchar(255) DEFAULT NULL,
  `content_value` mediumtext DEFAULT NULL,
  `content_spawn_path` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1r_idx` (`host_id`,`host_field`),
  KEY `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1r_site_id_index` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Repeaters for About Page [Page\\About].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1r`
--

LOCK TABLES `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1r` WRITE;
/*!40000 ALTER TABLE `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1r` DISABLE KEYS */;
INSERT INTO `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1r` VALUES (1,1,'blocks',NULL,'image_slice','{\"image\":\"\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:image_slice',1,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(2,1,'blocks',NULL,'paragraph_block','{\"title\":\"Outstanding performance\",\"content\":\"<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.<\\/p>\",\"image\":\"\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:paragraph_block',2,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(3,1,'blocks',NULL,'detailed_block','{\"title\":\"Why work with us\",\"content\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<\\/p>\",\"list_items\":\"[{\\\"text\\\":\\\"Doloremque\\\"},{\\\"text\\\":\\\"Beatae vitae\\\"},{\\\"text\\\":\\\"Totam rem aperiam\\\"}]\",\"button_text\":\"Learn more about our process\",\"button_url\":\"https:\\/\\/octobercms.com\\/features\",\"image\":\"\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:detailed_block',3,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(4,1,'blocks',NULL,'scoreboard_metrics','[]','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:scoreboard_metrics',4,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(5,4,'metrics',NULL,NULL,'{\"number\":3912,\"description\":\"Sed ut perspiciatis\",\"icon\":\"notepad\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:scoreboard_metrics.metrics',1,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(6,4,'metrics',NULL,NULL,'{\"number\":223,\"description\":\"Nemo enim ipsam\",\"icon\":\"shield\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:scoreboard_metrics.metrics',2,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(7,4,'metrics',NULL,NULL,'{\"number\":863,\"description\":\"Nam libero tempore\",\"icon\":\"basket\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:scoreboard_metrics.metrics',3,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(8,4,'metrics',NULL,NULL,'{\"number\":865,\"description\":\"Et harum quidem rerum\",\"icon\":\"briefcase\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:scoreboard_metrics.metrics',4,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(9,1,'blocks',NULL,'team_leaders','[]','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders',5,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(10,9,'members',NULL,NULL,'{\"title\":\"Andy Anderson\",\"role\":\"Sales Manager\",\"description\":\"Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam.\",\"avatar\":\"\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members',1,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(11,10,'social_links',NULL,NULL,'{\"platform\":\"twitter\",\"url\":\"https:\\/\\/twitter.com\\/octobercms\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links',1,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(12,10,'social_links',NULL,NULL,'{\"platform\":\"linkedin\",\"url\":\"https:\\/\\/www.linkedin.com\\/company\\/october-cms\\/\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links',2,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(13,10,'social_links',NULL,NULL,'{\"platform\":\"facebook\",\"url\":\"https:\\/\\/facebook.com\\/octobercms\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links',3,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(14,9,'members',NULL,NULL,'{\"title\":\"Bob Harris\",\"role\":\"Product Designer\",\"description\":\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque.\",\"avatar\":\"\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members',2,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(15,14,'social_links',NULL,NULL,'{\"platform\":\"twitter\",\"url\":\"https:\\/\\/twitter.com\\/octobercms\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links',1,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(16,14,'social_links',NULL,NULL,'{\"platform\":\"youtube\",\"url\":\"https:\\/\\/www.youtube.com\\/c\\/OctoberCMSOfficial\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links',2,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(17,14,'social_links',NULL,NULL,'{\"platform\":\"dribbble\",\"url\":\"https:\\/\\/www.dribbble.com\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links',3,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(18,14,'social_links',NULL,NULL,'{\"platform\":\"facebook\",\"url\":\"https:\\/\\/facebook.com\\/octobercms\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links',4,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(19,9,'members',NULL,NULL,'{\"title\":\"Ann Lewis\",\"role\":\"Marketing Manager\",\"description\":\"Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla.\",\"avatar\":\"\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members',3,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(20,19,'social_links',NULL,NULL,'{\"platform\":\"twitter\",\"url\":\"https:\\/\\/twitter.com\\/octobercms\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links',1,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(21,19,'social_links',NULL,NULL,'{\"platform\":\"linkedin\",\"url\":\"https:\\/\\/www.linkedin.com\\/company\\/october-cms\\/\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links',2,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(22,19,'social_links',NULL,NULL,'{\"platform\":\"facebook\",\"url\":\"https:\\/\\/facebook.com\\/octobercms\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links',3,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(23,9,'members',NULL,NULL,'{\"title\":\"Christina Thompson\",\"role\":\"System Analyst\",\"description\":\"Et harum quidem rerum facilis est et expedita distinctio.\",\"avatar\":\"\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members',4,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(24,23,'social_links',NULL,NULL,'{\"platform\":\"twitter\",\"url\":\"https:\\/\\/twitter.com\\/octobercms\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links',1,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(25,23,'social_links',NULL,NULL,'{\"platform\":\"youtube\",\"url\":\"https:\\/\\/www.youtube.com\\/c\\/OctoberCMSOfficial\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links',2,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(26,23,'social_links',NULL,NULL,'{\"platform\":\"dribbble\",\"url\":\"https:\\/\\/www.dribbble.com\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links',3,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(27,23,'social_links',NULL,NULL,'{\"platform\":\"facebook\",\"url\":\"https:\\/\\/facebook.com\\/octobercms\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links',4,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(28,9,'members',NULL,NULL,'{\"title\":\"John Smith\",\"role\":\"President\",\"description\":\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.\",\"avatar\":\"\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members',5,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(29,28,'social_links',NULL,NULL,'{\"platform\":\"dribbble\",\"url\":\"https:\\/\\/www.dribbble.com\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links',1,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(30,28,'social_links',NULL,NULL,'{\"platform\":\"linkedin\",\"url\":\"https:\\/\\/www.linkedin.com\\/company\\/october-cms\\/\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links',2,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(31,28,'social_links',NULL,NULL,'{\"platform\":\"youtube\",\"url\":\"https:\\/\\/www.youtube.com\\/c\\/OctoberCMSOfficial\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links',3,'2023-10-28 06:58:51','2023-10-28 06:58:51');
/*!40000 ALTER TABLE `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xc_b022a74b15e64c6b9eb917efc5103543c`
--

DROP TABLE IF EXISTS `xc_b022a74b15e64c6b9eb917efc5103543c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xc_b022a74b15e64c6b9eb917efc5103543c` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `site_root_id` int(11) DEFAULT NULL,
  `blueprint_uuid` varchar(255) DEFAULT NULL,
  `content_group` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `published_at_date` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `draft_mode` int(11) NOT NULL DEFAULT 1,
  `primary_id` int(10) unsigned DEFAULT NULL,
  `primary_attrs` mediumtext DEFAULT NULL,
  `is_version` tinyint(1) NOT NULL DEFAULT 0,
  `fullslug` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `nest_depth` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_user_id` int(10) unsigned DEFAULT NULL,
  `updated_user_id` int(10) unsigned DEFAULT NULL,
  `deleted_user_id` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xc_b022a74b15e64c6b9eb917efc5103543c_site_id_index` (`site_id`),
  KEY `xc_b022a74b15e64c6b9eb917efc5103543c_site_root_id_index` (`site_root_id`),
  KEY `xc_b022a74b15e64c6b9eb917efc5103543c_blueprint_uuid_index` (`blueprint_uuid`),
  KEY `xc_b022a74b15e64c6b9eb917efc5103543c_content_group_index` (`content_group`),
  KEY `xc_b022a74b15e64c6b9eb917efc5103543c_slug_index` (`slug`),
  KEY `xc_b022a74b15e64c6b9eb917efc5103543c_primary_id_index` (`primary_id`),
  KEY `xc_b022a74b15e64c6b9eb917efc5103543c_fullslug_index` (`fullslug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Content for Category [Blog\\Category].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_b022a74b15e64c6b9eb917efc5103543c`
--

LOCK TABLES `xc_b022a74b15e64c6b9eb917efc5103543c` WRITE;
/*!40000 ALTER TABLE `xc_b022a74b15e64c6b9eb917efc5103543c` DISABLE KEYS */;
INSERT INTO `xc_b022a74b15e64c6b9eb917efc5103543c` VALUES (1,1,1,'b022a74b-15e6-4c6b-9eb9-17efc5103543',NULL,'Announcements','announcements',1,NULL,'2023-10-28 06:58:51',NULL,1,NULL,NULL,0,NULL,NULL,1,2,0,'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt molliti',NULL,NULL,NULL,NULL,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(2,1,2,'b022a74b-15e6-4c6b-9eb9-17efc5103543',NULL,'News','news',1,NULL,'2023-10-28 06:58:51',NULL,1,NULL,NULL,0,NULL,NULL,3,4,0,'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.',NULL,NULL,NULL,NULL,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(3,1,3,'b022a74b-15e6-4c6b-9eb9-17efc5103543',NULL,'Startup Ideas','startup-ideas',1,NULL,'2023-10-28 06:58:51',NULL,1,NULL,NULL,0,NULL,NULL,5,6,0,'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proide',NULL,NULL,NULL,NULL,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(4,1,4,'b022a74b-15e6-4c6b-9eb9-17efc5103543',NULL,'Updates','updates',1,NULL,'2023-10-28 06:58:51',NULL,1,NULL,NULL,0,NULL,NULL,7,8,0,'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt molliti',NULL,NULL,NULL,NULL,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(5,1,5,'b022a74b-15e6-4c6b-9eb9-17efc5103543',NULL,'Automation','automation',1,NULL,'2023-10-28 06:58:51',NULL,1,NULL,NULL,0,NULL,NULL,9,10,0,'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',NULL,NULL,NULL,NULL,'2023-10-28 06:58:51','2023-10-28 06:58:51');
/*!40000 ALTER TABLE `xc_b022a74b15e64c6b9eb917efc5103543c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xc_b022a74b15e64c6b9eb917efc5103543j`
--

DROP TABLE IF EXISTS `xc_b022a74b15e64c6b9eb917efc5103543j`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xc_b022a74b15e64c6b9eb917efc5103543j` (
  `parent_id` int(11) DEFAULT NULL,
  `relation_id` int(11) DEFAULT NULL,
  `relation_type` varchar(255) DEFAULT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  KEY `xc_b022a74b15e64c6b9eb917efc5103543j_idx` (`relation_id`,`relation_type`),
  KEY `xc_b022a74b15e64c6b9eb917efc5103543j_field_name_index` (`field_name`),
  KEY `xc_b022a74b15e64c6b9eb917efc5103543j_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Joins for Category [Blog\\Category].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_b022a74b15e64c6b9eb917efc5103543j`
--

LOCK TABLES `xc_b022a74b15e64c6b9eb917efc5103543j` WRITE;
/*!40000 ALTER TABLE `xc_b022a74b15e64c6b9eb917efc5103543j` DISABLE KEYS */;
/*!40000 ALTER TABLE `xc_b022a74b15e64c6b9eb917efc5103543j` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xc_b022a74b15e64c6b9eb917efc5103543r`
--

DROP TABLE IF EXISTS `xc_b022a74b15e64c6b9eb917efc5103543r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xc_b022a74b15e64c6b9eb917efc5103543r` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `host_id` int(11) DEFAULT NULL,
  `host_field` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `content_group` varchar(255) DEFAULT NULL,
  `content_value` mediumtext DEFAULT NULL,
  `content_spawn_path` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xc_b022a74b15e64c6b9eb917efc5103543r_idx` (`host_id`,`host_field`),
  KEY `xc_b022a74b15e64c6b9eb917efc5103543r_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Repeaters for Category [Blog\\Category].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_b022a74b15e64c6b9eb917efc5103543r`
--

LOCK TABLES `xc_b022a74b15e64c6b9eb917efc5103543r` WRITE;
/*!40000 ALTER TABLE `xc_b022a74b15e64c6b9eb917efc5103543r` DISABLE KEYS */;
/*!40000 ALTER TABLE `xc_b022a74b15e64c6b9eb917efc5103543r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xc_edcd102e05254e4db07e633ae6c18db6c`
--

DROP TABLE IF EXISTS `xc_edcd102e05254e4db07e633ae6c18db6c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xc_edcd102e05254e4db07e633ae6c18db6c` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `site_root_id` int(11) DEFAULT NULL,
  `blueprint_uuid` varchar(255) DEFAULT NULL,
  `content_group` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `published_at_date` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `draft_mode` int(11) NOT NULL DEFAULT 1,
  `primary_id` int(10) unsigned DEFAULT NULL,
  `primary_attrs` mediumtext DEFAULT NULL,
  `is_version` tinyint(1) NOT NULL DEFAULT 0,
  `published_at_day` int(11) DEFAULT NULL,
  `published_at_month` int(11) DEFAULT NULL,
  `published_at_year` int(11) DEFAULT NULL,
  `content` mediumtext DEFAULT NULL,
  `author_id` int(10) unsigned DEFAULT NULL,
  `featured_text` mediumtext DEFAULT NULL,
  `gallery_media` mediumtext DEFAULT NULL,
  `created_user_id` int(10) unsigned DEFAULT NULL,
  `updated_user_id` int(10) unsigned DEFAULT NULL,
  `deleted_user_id` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xc_edcd102e05254e4db07e633ae6c18db6c_site_id_index` (`site_id`),
  KEY `xc_edcd102e05254e4db07e633ae6c18db6c_site_root_id_index` (`site_root_id`),
  KEY `xc_edcd102e05254e4db07e633ae6c18db6c_blueprint_uuid_index` (`blueprint_uuid`),
  KEY `xc_edcd102e05254e4db07e633ae6c18db6c_content_group_index` (`content_group`),
  KEY `xc_edcd102e05254e4db07e633ae6c18db6c_slug_index` (`slug`),
  KEY `xc_edcd102e05254e4db07e633ae6c18db6c_primary_id_index` (`primary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Content for Post [Blog\\Post].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_edcd102e05254e4db07e633ae6c18db6c`
--

LOCK TABLES `xc_edcd102e05254e4db07e633ae6c18db6c` WRITE;
/*!40000 ALTER TABLE `xc_edcd102e05254e4db07e633ae6c18db6c` DISABLE KEYS */;
INSERT INTO `xc_edcd102e05254e4db07e633ae6c18db6c` VALUES (1,1,1,'edcd102e-0525-4e4d-b07e-633ae6c18db6','regular_post','Consectetur adipiscing elit','consectetur-adipiscing-elit',1,NULL,'2023-10-28 06:58:51',NULL,1,NULL,NULL,0,28,10,2023,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>',1,'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',NULL,NULL,NULL,NULL,NULL,'2023-10-28 06:58:51','2023-10-28 06:58:51'),(2,1,2,'edcd102e-0525-4e4d-b07e-633ae6c18db6','regular_post','Nemo enim ipsam','nemo-enim-ipsam',1,NULL,'2023-10-28 06:58:51',NULL,1,NULL,NULL,0,28,10,2023,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>',1,'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.',NULL,NULL,NULL,NULL,NULL,'2023-10-28 06:58:51','2023-10-28 06:58:51');
/*!40000 ALTER TABLE `xc_edcd102e05254e4db07e633ae6c18db6c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xc_edcd102e05254e4db07e633ae6c18db6j`
--

DROP TABLE IF EXISTS `xc_edcd102e05254e4db07e633ae6c18db6j`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xc_edcd102e05254e4db07e633ae6c18db6j` (
  `parent_id` int(11) DEFAULT NULL,
  `relation_id` int(11) DEFAULT NULL,
  `relation_type` varchar(255) DEFAULT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  KEY `xc_edcd102e05254e4db07e633ae6c18db6j_idx` (`relation_id`,`relation_type`),
  KEY `xc_edcd102e05254e4db07e633ae6c18db6j_field_name_index` (`field_name`),
  KEY `xc_edcd102e05254e4db07e633ae6c18db6j_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Joins for Post [Blog\\Post].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_edcd102e05254e4db07e633ae6c18db6j`
--

LOCK TABLES `xc_edcd102e05254e4db07e633ae6c18db6j` WRITE;
/*!40000 ALTER TABLE `xc_edcd102e05254e4db07e633ae6c18db6j` DISABLE KEYS */;
INSERT INTO `xc_edcd102e05254e4db07e633ae6c18db6j` VALUES (1,1,'Tailor\\Models\\EntryRecord@xc_b022a74b15e64c6b9eb917efc5103543c','categories',NULL),(2,2,'Tailor\\Models\\EntryRecord@xc_b022a74b15e64c6b9eb917efc5103543c','categories',NULL);
/*!40000 ALTER TABLE `xc_edcd102e05254e4db07e633ae6c18db6j` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xc_edcd102e05254e4db07e633ae6c18db6r`
--

DROP TABLE IF EXISTS `xc_edcd102e05254e4db07e633ae6c18db6r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xc_edcd102e05254e4db07e633ae6c18db6r` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `host_id` int(11) DEFAULT NULL,
  `host_field` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `content_group` varchar(255) DEFAULT NULL,
  `content_value` mediumtext DEFAULT NULL,
  `content_spawn_path` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xc_edcd102e05254e4db07e633ae6c18db6r_idx` (`host_id`,`host_field`),
  KEY `xc_edcd102e05254e4db07e633ae6c18db6r_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Repeaters for Post [Blog\\Post].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_edcd102e05254e4db07e633ae6c18db6r`
--

LOCK TABLES `xc_edcd102e05254e4db07e633ae6c18db6r` WRITE;
/*!40000 ALTER TABLE `xc_edcd102e05254e4db07e633ae6c18db6r` DISABLE KEYS */;
/*!40000 ALTER TABLE `xc_edcd102e05254e4db07e633ae6c18db6r` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-13 16:53:47