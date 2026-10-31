
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
DROP TABLE IF EXISTS `activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint unsigned DEFAULT NULL,
  `causer_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint unsigned DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `batch_uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2838 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `activity_log` WRITE;
/*!40000 ALTER TABLE `activity_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_log` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `address_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `input_type` enum('text','dropdown','textarea') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dropdown_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `print_preview` tinyint(1) NOT NULL DEFAULT '0',
  `complain_preview` tinyint(1) NOT NULL DEFAULT '0',
  `order` int NOT NULL DEFAULT '0',
  `receipt_order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `address_fields_label_unique` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `address_fields` WRITE;
/*!40000 ALTER TABLE `address_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_fields` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `billing_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing_infos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_bill_unique_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `monthly_rent` decimal(11,2) NOT NULL DEFAULT '0.00',
  `additional_charge` decimal(11,2) NOT NULL DEFAULT '0.00',
  `vat` decimal(11,2) NOT NULL DEFAULT '0.00',
  `previous_due` decimal(11,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `advance` decimal(11,2) NOT NULL DEFAULT '0.00',
  `total_amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `paid_amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `paid_date` timestamp NULL DEFAULT NULL,
  `due_amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `billing_type` enum('prepaid','postpaid') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_disable` tinyint(1) NOT NULL DEFAULT '1',
  `auto_disable_date` timestamp NULL DEFAULT NULL,
  `auto_disable_month` tinyint DEFAULT NULL,
  `extra_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `billing_infos_customer_bill_unique_id_foreign` (`customer_bill_unique_id`),
  CONSTRAINT `billing_infos_customer_bill_unique_id_foreign` FOREIGN KEY (`customer_bill_unique_id`) REFERENCES `customers_infos` (`customer_unique_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2838 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `billing_infos` WRITE;
/*!40000 ALTER TABLE `billing_infos` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing_infos` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `collection_summaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection_summaries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_collection_unique_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `collection_date` timestamp NOT NULL,
  `collection_amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `collected_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_no` bigint NOT NULL,
  `bill_month` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `collection_summaries_invoice_no_unique` (`invoice_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `collection_summaries` WRITE;
/*!40000 ALTER TABLE `collection_summaries` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_summaries` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `comment_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `comment_lists` WRITE;
/*!40000 ALTER TABLE `comment_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_lists` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `customer_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ppp_user_id` bigint unsigned NOT NULL,
  `rating` int NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `edit_count` int NOT NULL DEFAULT '0',
  `show_on_site` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_reviews_ppp_user_id_foreign` (`ppp_user_id`),
  CONSTRAINT `customer_reviews_ppp_user_id_foreign` FOREIGN KEY (`ppp_user_id`) REFERENCES `p_p_p_secrets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `customer_reviews` WRITE;
/*!40000 ALTER TABLE `customer_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_reviews` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `customers_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_address_unique_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `input_type_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `input_type_dropdown` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `input_type_textarea` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `latitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customers_addresses_customer_address_unique_id_foreign` (`customer_address_unique_id`),
  KEY `customers_addresses_label_name_foreign` (`label_name`),
  CONSTRAINT `customers_addresses_customer_address_unique_id_foreign` FOREIGN KEY (`customer_address_unique_id`) REFERENCES `customers_infos` (`customer_unique_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customers_addresses_label_name_foreign` FOREIGN KEY (`label_name`) REFERENCES `address_fields` (`label`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `customers_addresses` WRITE;
/*!40000 ALTER TABLE `customers_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers_addresses` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `customers_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers_infos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reseller_id` bigint unsigned DEFAULT NULL,
  `customer_unique_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_person` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parents_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouse_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternative_mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identification_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profession` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disable_count` int DEFAULT '0',
  `ppp_user_id` bigint unsigned DEFAULT NULL,
  `connection_date` timestamp NULL DEFAULT NULL,
  `package_id` bigint unsigned DEFAULT NULL,
  `status` enum('pending','active','inactive','deleted','disable','free') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_infos_customer_unique_id_unique` (`customer_unique_id`),
  KEY `customers_infos_ppp_user_id_foreign` (`ppp_user_id`),
  KEY `customers_infos_package_id_foreign` (`package_id`),
  KEY `customers_infos_reseller_id_foreign` (`reseller_id`),
  CONSTRAINT `customers_infos_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `package_lists` (`id`) ON DELETE SET NULL,
  CONSTRAINT `customers_infos_ppp_user_id_foreign` FOREIGN KEY (`ppp_user_id`) REFERENCES `p_p_p_secrets` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `customers_infos_reseller_id_foreign` FOREIGN KEY (`reseller_id`) REFERENCES `resellers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2838 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `customers_infos` WRITE;
/*!40000 ALTER TABLE `customers_infos` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers_infos` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `hotspot_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotspot_sales` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `router_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `voucher_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cash',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sale_date` date NOT NULL,
  `sold_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hotspot_sales_sold_by_foreign` (`sold_by`),
  KEY `hotspot_sales_router_name_sale_date_index` (`router_name`,`sale_date`),
  CONSTRAINT `hotspot_sales_sold_by_foreign` FOREIGN KEY (`sold_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `hotspot_sales` WRITE;
/*!40000 ALTER TABLE `hotspot_sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotspot_sales` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `hotspot_vouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotspot_vouchers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `router_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `batch_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('unused','used','expired') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unused',
  `used_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mac_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validity_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'uptime',
  `validity_duration` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_login_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hotspot_vouchers_code_unique` (`code`),
  KEY `hotspot_vouchers_created_by_foreign` (`created_by`),
  KEY `hotspot_vouchers_router_name_status_index` (`router_name`,`status`),
  KEY `hotspot_vouchers_batch_name_index` (`batch_name`),
  CONSTRAINT `hotspot_vouchers_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `hotspot_vouchers` WRITE;
/*!40000 ALTER TABLE `hotspot_vouchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotspot_vouchers` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `isp_expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `isp_expenses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `amount` decimal(12,2) NOT NULL,
  `expense_date` date NOT NULL,
  `reference_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` bigint unsigned DEFAULT NULL,
  `linked_user_id` bigint unsigned DEFAULT NULL,
  `linked_reseller_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `isp_expenses_added_by_foreign` (`added_by`),
  KEY `isp_expenses_category_index` (`category`),
  KEY `isp_expenses_linked_user_id_foreign` (`linked_user_id`),
  KEY `isp_expenses_linked_reseller_id_foreign` (`linked_reseller_id`),
  CONSTRAINT `isp_expenses_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `isp_expenses_linked_reseller_id_foreign` FOREIGN KEY (`linked_reseller_id`) REFERENCES `resellers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `isp_expenses_linked_user_id_foreign` FOREIGN KEY (`linked_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `isp_expenses` WRITE;
/*!40000 ALTER TABLE `isp_expenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `isp_expenses` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `log_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_tables` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `record_id` bigint unsigned DEFAULT NULL,
  `old_data` json DEFAULT NULL,
  `new_data` json DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `log_tables` WRITE;
/*!40000 ALTER TABLE `log_tables` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_tables` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `main_site_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_site_data` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_site_data_type_unique` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `main_site_data` WRITE;
/*!40000 ALTER TABLE `main_site_data` DISABLE KEYS */;
INSERT INTO `main_site_data` VALUES (1,'site_name','johirxofficial','2026-10-24 05:26:41','2026-10-24 13:53:48'),(2,'site_title','johirxofficial','2026-10-24 05:26:41','2026-10-24 05:26:41'),(3,'theme_preset','neo','2026-10-24 05:26:41','2026-10-24 05:26:41'),(4,'theme_name','midnight_purple','2026-10-24 05:26:41','2026-10-24 05:26:41'),(5,'theme_primary_color','#6366f1','2026-10-24 05:26:41','2026-10-24 05:26:41'),(6,'theme_accent_color','#06b6d4','2026-10-24 05:26:41','2026-10-24 05:26:41'),(7,'theme_card_style','glass','2026-10-24 05:26:41','2026-10-24 05:26:41'),(8,'theme_border_radius','20px','2026-10-24 05:26:41','2026-10-24 05:26:41'),(9,'portal_name','johirxofficial','2026-10-24 13:25:37','2026-10-24 13:53:48'),(10,'site_status','active','2026-10-24 13:25:37','2026-10-24 13:25:37'),(11,'site_maintenance','0','2026-10-24 13:25:38','2026-10-24 13:25:38'),(12,'site_message',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(13,'site_locale','en','2026-10-24 13:25:38','2026-10-24 13:25:38'),(14,'main_site_locale','en','2026-10-24 13:25:38','2026-10-24 13:25:38'),(15,'portal_theme_preset','orange','2026-10-24 13:25:38','2026-10-24 13:25:45'),(16,'portal_primary_color','#6366f1','2026-10-24 13:25:38','2026-10-24 13:25:38'),(17,'portal_accent_color','#a78bfa','2026-10-24 13:25:38','2026-10-24 13:25:38'),(18,'portal_registration_enabled','1','2026-10-24 13:25:38','2026-10-24 13:25:38'),(19,'portal_change_password_enabled','1','2026-10-24 13:25:38','2026-10-24 13:25:38'),(20,'site_logo',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(21,'site_icon',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(22,'site_favicon',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(23,'site_description',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(24,'site_keywords',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(25,'site_author',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(26,'site_email',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(27,'site_phone','','2026-10-24 13:25:38','2026-10-24 13:25:38'),(28,'site_address',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(29,'site_map',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(30,'site_facebook',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(31,'site_twitter',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(32,'site_instagram',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(33,'site_whatsapp',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(34,'site_linkedin',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(35,'site_youtube',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(36,'site_pinterest',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(37,'site_currency','BDT','2026-10-24 13:25:38','2026-10-24 13:25:38'),(38,'site_invoice_prefix','INV-','2026-10-24 13:25:38','2026-10-24 13:25:38'),(39,'customer_id_prefix','JOHIR','2026-10-24 13:25:38','2026-10-24 13:25:38'),(40,'site_invoice_logo',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(41,'site_invoice_color','#000000','2026-10-24 13:25:38','2026-10-24 13:25:38'),(42,'site_invoice_footer',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(43,'site_invoice_notes',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(44,'site_invoice_terms','{\"type\":\"doc\",\"content\":[]}','2026-10-24 13:25:38','2026-10-24 13:25:38'),(45,'site_invoice_signature',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(46,'disable_check_no','0','2026-10-24 13:25:38','2026-10-24 13:25:38'),(47,'disable_check_days','0','2026-10-24 13:25:38','2026-10-24 13:25:38'),(48,'expired_profile_name','Expired','2026-10-24 13:25:38','2026-10-24 13:25:38'),(49,'site_secret_key',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(50,'site_secret_value',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(51,'site_secret_validity',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(52,'site_secret_url',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(53,'site_secret_email',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(54,'mysql_binary_path','','2026-10-24 13:25:38','2026-10-24 13:25:38'),(55,'log_server_enabled','0','2026-10-24 13:25:38','2026-10-24 13:25:38'),(56,'log_server_routers','[]','2026-10-24 13:25:38','2026-10-24 13:25:38'),(57,'log_retention_days','30','2026-10-24 13:25:38','2026-10-24 13:25:38'),(58,'hero_title',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(59,'hero_subtitle',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(60,'hero_button_text','Get Online','2026-10-24 13:25:38','2026-10-24 13:25:38'),(61,'hero_button_link',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(62,'registration_link',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(63,'about_title',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(64,'about_body',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(65,'packages_section_title',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(66,'footer_copyright',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(67,'is_active','1','2026-10-24 13:25:38','2026-10-24 13:25:38'),(68,'hero_slides','[]','2026-10-24 13:25:38','2026-10-24 13:25:38'),(69,'services','[]','2026-10-24 13:25:38','2026-10-24 13:25:38'),(70,'testimonials','[]','2026-10-24 13:25:38','2026-10-24 13:25:38'),(71,'gallery_items','[]','2026-10-24 13:25:38','2026-10-24 13:25:38'),(72,'gallery_categories','{\"ab565b99-ba05-4fb4-9e94-ee9a4ec036d4\":{\"key\":\"category-1\",\"label\":\"Equipment\"},\"eed83750-5030-4750-9e17-63e664b807b2\":{\"key\":\"category-2\",\"label\":\"Server\"},\"138d1cad-a8f6-4e45-aa83-5078ce7f5cbf\":{\"key\":\"category-3\",\"label\":\"Illustration\"},\"8b744018-b4f0-48b8-8109-eaf9c7da4a54\":{\"key\":\"category-4\",\"label\":\"Media\"}}','2026-10-24 13:25:38','2026-10-24 13:53:48'),(73,'valuable_clients','[]','2026-10-24 13:25:38','2026-10-24 13:25:38'),(74,'btcl_tariff_link','#','2026-10-24 13:25:38','2026-10-24 13:25:38'),(75,'btcl_tariff_pdf',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(76,'important_links','[]','2026-10-24 13:25:38','2026-10-24 13:25:38'),(77,'payment_bkash_enabled','0','2026-10-24 13:25:38','2026-10-24 13:25:38'),(78,'payment_bkash_base_url','https://tokenized.sandbox.bka.sh/v1.2.0-beta','2026-10-24 13:25:38','2026-10-24 13:25:38'),(79,'payment_bkash_username',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(80,'payment_bkash_password',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(81,'payment_bkash_app_key',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(82,'payment_bkash_app_secret',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(83,'payment_bkash_api_type','tokenized','2026-10-24 13:25:38','2026-10-24 13:25:38'),(84,'payment_nagad_enabled','0','2026-10-24 13:25:38','2026-10-24 13:25:38'),(85,'payment_nagad_base_url','http://sandbox.nagad.com.bd:10080/remote-payment-gateway-1.0/api/dfs','2026-10-24 13:25:38','2026-10-24 13:25:38'),(86,'payment_nagad_merchant_id',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(87,'payment_nagad_public_key',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(88,'payment_nagad_private_key',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(89,'payment_sslcommerz_enabled','0','2026-10-24 13:25:38','2026-10-24 13:25:38'),(90,'payment_sslcommerz_store_id',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(91,'payment_sslcommerz_store_password',NULL,'2026-10-24 13:25:38','2026-10-24 13:25:38'),(92,'payment_sslcommerz_sandbox','1','2026-10-24 13:25:38','2026-10-24 13:25:38'),(93,'theme_font_size','medium','2026-10-24 13:25:38','2026-10-24 13:25:38'),(94,'theme_font_family','Outfit','2026-10-24 13:25:38','2026-10-24 13:25:38'),(95,'theme_nav_style','sidebar','2026-10-24 13:25:38','2026-10-24 13:25:38'),(96,'theme_widget_style','glass','2026-10-24 13:25:38','2026-10-24 13:25:38'),(97,'theme_mode','dark','2026-10-24 13:25:38','2026-10-24 13:25:38'),(98,'theme_transparency','0.5','2026-10-24 13:25:38','2026-10-24 13:25:38'),(99,'theme_blur','16px','2026-10-24 13:25:38','2026-10-24 13:25:38'),(100,'theme_animations','1.0','2026-10-24 13:25:38','2026-10-24 13:25:38'),(101,'theme_gradient_intensity','0.7','2026-10-24 13:25:38','2026-10-24 13:25:38'),(102,'theme_section_height','auto','2026-10-24 13:25:38','2026-10-24 13:25:38'),(103,'theme_updated_at','1792850028','2026-10-24 13:25:38','2026-10-24 13:53:48');
/*!40000 ALTER TABLE `main_site_data` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2024_01_01_000000_create_sms_gateways_table',1),(5,'2024_09_08_134914_create_router_lists_table',1),(6,'2024_09_08_170128_create_package_lists_table',1),(7,'2024_09_08_171326_create_p_p_p_secrets_table',1),(8,'2024_09_09_123629_create_customers_infos_table',1),(9,'2024_09_10_184836_create_billing_infos_table',1),(10,'2024_09_10_184902_create_official_infos_table',1),(11,'2024_09_16_082404_create_address_fields_table',1),(12,'2024_09_16_123900_create_customers_addresses_table',1),(13,'2024_09_17_173002_add_two_factor_columns_to_users_table',1),(14,'2024_09_17_173032_create_personal_access_tokens_table',1),(15,'2024_09_17_173032_create_teams_table',1),(16,'2024_09_17_173033_create_team_user_table',1),(17,'2024_09_17_173034_create_team_invitations_table',1),(18,'2024_09_17_173853_create_permission_tables',1),(19,'2024_10_25_190007_create_payment_summaries_table',1),(20,'2024_10_26_154913_create_log_tables_table',1),(21,'2024_10_26_181535_create_collection_summaries_table',1),(22,'2024_10_31_184205_create_notification_logs_table',1),(23,'2024_11_04_011236_create_sms_templates_table',1),(24,'2025_05_11_062914_create_activity_log_table',1),(25,'2025_05_11_062915_add_event_column_to_activity_log_table',1),(26,'2025_05_11_062916_add_batch_uuid_column_to_activity_log_table',1),(27,'2025_05_27_062221_create_telescope_entries_table',1),(28,'2026_01_01_000000_create_payment_gateway_settings_table',1),(29,'2026_02_06_151341_create_comment_lists_table',1),(30,'2026_03_27_000002_update_package_lists_table',1),(31,'2026_03_27_181554_make_packages_router_specific',1),(32,'2026_03_27_210000_add_mikrotik_fields_to_package_lists',1),(33,'2026_03_28_000000_add_address_pools_to_package_lists',1),(34,'2026_03_28_131403_refactor_package_lists_to_router_name',1),(35,'2026_03_28_132205_add_package_id_to_customers_infos_table',1),(36,'2026_04_03_090317_create_mikrotik_logs_table',1),(37,'2026_04_03_110034_merge_universal_site_configurations',1),(38,'2026_04_08_000001_create_hotspot_vouchers_table',1),(39,'2026_04_08_000002_create_hotspot_sales_table',1),(40,'2026_04_13_121827_create_permitted_urls_table',1),(41,'2026_05_24_170251_add_missing_columns_to_collection_summaries_table',1),(42,'2026_05_25_000001_create_support_tickets_table',1),(43,'2026_06_06_200000_create_reseller_system_tables',1),(44,'2026_06_06_200001_add_reseller_columns_to_existing_tables',1),(45,'2026_06_07_144916_create_isp_expenses_table',1),(46,'2026_06_09_190140_create_package_purchase_requests_table',1),(47,'2026_06_30_185552_change_status_in_vouchers_table',1),(48,'2026_06_30_235500_create_review_and_log_tables',1),(49,'2026_07_03_080249_add_voucher_rules_to_resellers_table',1),(50,'2026_07_03_084342_add_commission_paid_upfront_to_vouchers_table',1),(51,'2026_07_04_004012_add_linked_columns_to_isp_expenses_table',1),(52,'2026_07_09_221000_change_ports_to_string_in_router_lists',1),(53,'2026_07_09_230643_create_site_visitors_table',1),(54,'2026_07_18_000001_add_validity_type_to_hotspot_vouchers',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `mikrotik_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mikrotik_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `router_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buffer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `topics` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mikrotik_logs_router_name_created_at_index` (`router_name`,`created_at`),
  KEY `mikrotik_logs_router_name_index` (`router_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `mikrotik_logs` WRITE;
/*!40000 ALTER TABLE `mikrotik_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mikrotik_logs` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',2),(4,'App\\Models\\User',3);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `notification_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `notification_logs` WRITE;
/*!40000 ALTER TABLE `notification_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_logs` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `official_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `official_infos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_office_unique_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_charge` decimal(11,2) NOT NULL DEFAULT '0.00',
  `security_deposit` decimal(11,2) NOT NULL DEFAULT '0.00',
  `customer_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_type` enum('prepaid','postpaid') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection_type` enum('fiber','wired','wireless') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connectivity_type` enum('shared','dedicated','hybrid','virtual','private','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `distribution_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bill_create` tinyint(1) NOT NULL DEFAULT '1',
  `bill_print` tinyint(1) NOT NULL DEFAULT '1',
  `bill_email` tinyint(1) NOT NULL DEFAULT '1',
  `bill_sms` tinyint(1) NOT NULL DEFAULT '1',
  `bill_fax` tinyint(1) NOT NULL DEFAULT '0',
  `continue_bill` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connected_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `official_infos_customer_office_unique_id_foreign` (`customer_office_unique_id`),
  KEY `official_infos_connected_by_foreign` (`connected_by`),
  CONSTRAINT `official_infos_connected_by_foreign` FOREIGN KEY (`connected_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `official_infos_customer_office_unique_id_foreign` FOREIGN KEY (`customer_office_unique_id`) REFERENCES `customers_infos` (`customer_unique_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2838 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `official_infos` WRITE;
/*!40000 ALTER TABLE `official_infos` DISABLE KEYS */;
/*!40000 ALTER TABLE `official_infos` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `p_p_p_secrets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `p_p_p_secrets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `router_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `profile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `caller_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ppp_remote_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bandwidth` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uptime` timestamp NULL DEFAULT NULL,
  `downtime` timestamp NULL DEFAULT NULL,
  `last_logged_out` timestamp NULL DEFAULT NULL,
  `last_caller_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_disconnect_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `routes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ipv6_routes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `login_count` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `p_p_p_secrets_router_name_foreign` (`router_name`),
  CONSTRAINT `p_p_p_secrets_router_name_foreign` FOREIGN KEY (`router_name`) REFERENCES `router_lists` (`router_name`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2839 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `p_p_p_secrets` WRITE;
/*!40000 ALTER TABLE `p_p_p_secrets` DISABLE KEYS */;
/*!40000 ALTER TABLE `p_p_p_secrets` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `package_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reseller_id` bigint unsigned DEFAULT NULL,
  `router_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `speed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mikrotik_rate_limit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mikrotik_local_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mikrotik_remote_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `push_to_mikrotik` tinyint(1) NOT NULL DEFAULT '0',
  `features` json DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `show_on_site` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `merchant_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `package_lists_package_router_name_unique` (`package`,`router_name`),
  KEY `package_lists_reseller_id_foreign` (`reseller_id`),
  CONSTRAINT `package_lists_reseller_id_foreign` FOREIGN KEY (`reseller_id`) REFERENCES `resellers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `package_lists` WRITE;
/*!40000 ALTER TABLE `package_lists` DISABLE KEYS */;
INSERT INTO `package_lists` VALUES (5,NULL,NULL,'Home 10 Mbps','Home Basic','10 Mbps','10M/10M',NULL,NULL,0,'[\"10 Mbps download\", \"24/7 support\", \"Free installation\"]',1,1,1,500.00,'Perfect for browsing, social media and HD streaming.',NULL,'2026-10-29 04:57:54','2026-10-29 04:57:54'),(6,NULL,NULL,'Home 20 Mbps','Home Plus','20 Mbps','20M/20M',NULL,NULL,0,'[\"20 Mbps download\", \"24/7 support\", \"Free installation\", \"Priority support\"]',0,1,2,800.00,'Great for families with multiple devices.',NULL,'2026-10-29 04:57:54','2026-10-29 04:57:54'),(7,NULL,NULL,'Home 30 Mbps','Home Premium','30 Mbps','30M/30M',NULL,NULL,0,'[\"30 Mbps download\", \"24/7 support\", \"Free installation\", \"Priority support\", \"Static IP ready\"]',0,1,3,1100.00,'High-speed connection for heavy users and small offices.',NULL,'2026-10-29 04:57:54','2026-10-29 04:57:54');
/*!40000 ALTER TABLE `package_lists` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `package_purchase_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_purchase_requests` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `package_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `package_purchase_requests` WRITE;
/*!40000 ALTER TABLE `package_purchase_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `package_purchase_requests` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `payment_gateway_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_gateway_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'mfs',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `is_sandbox` tinyint(1) NOT NULL DEFAULT '1',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `credentials` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sort_order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payment_gateway_settings_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `payment_gateway_settings` WRITE;
/*!40000 ALTER TABLE `payment_gateway_settings` DISABLE KEYS */;
INSERT INTO `payment_gateway_settings` VALUES (1,'bkash_tokenize','bKash (Tokenized)','MFS',0,1,0,NULL,1,'2026-10-24 12:21:06','2026-10-24 12:21:06'),(2,'bkash_pwg','bKash (PWG / Checkout URL)','MFS',0,1,0,NULL,2,'2026-10-24 12:21:06','2026-10-24 12:21:06'),(3,'nagad','Nagad','MFS',0,1,0,NULL,3,'2026-10-24 12:21:06','2026-10-24 12:21:06'),(4,'rocket','Rocket','MFS',0,1,0,NULL,4,'2026-10-24 12:21:06','2026-10-24 12:21:06'),(5,'upay','Upay','MFS',0,1,0,NULL,5,'2026-10-24 12:21:06','2026-10-24 12:21:06'),(6,'sslcommerz','SSLCommerz','Aggregators',0,1,0,NULL,6,'2026-10-24 12:21:06','2026-10-24 12:21:06'),(7,'aamarpay','AamarPay','Aggregators',0,1,0,NULL,7,'2026-10-24 12:21:06','2026-10-24 12:21:06'),(8,'surjopay','SurjoPay','Aggregators',0,1,0,NULL,8,'2026-10-24 12:21:07','2026-10-24 12:21:07'),(9,'sonalipay','Sonali Pay','Banks',0,1,0,NULL,9,'2026-10-24 12:21:07','2026-10-24 12:21:07'),(10,'portpay','PortPay','Aggregators',0,1,0,NULL,10,'2026-10-24 12:21:07','2026-10-24 12:21:07'),(11,'eps','Easy Payment System (EPS)','Banks',0,1,0,NULL,11,'2026-10-24 12:21:07','2026-10-24 12:21:07'),(12,'stripe','Stripe','International Cards',0,1,0,NULL,12,'2026-10-24 12:21:07','2026-10-24 12:21:07'),(13,'paypal','PayPal','International Cards',0,1,0,NULL,13,'2026-10-24 12:21:07','2026-10-24 12:21:07'),(14,'binance_pay','Binance Pay','Crypto',0,1,0,NULL,14,'2026-10-24 12:21:07','2026-10-24 12:21:07'),(15,'nowpayments','NOWPayments','Crypto',0,1,0,NULL,15,'2026-10-24 12:21:07','2026-10-24 12:21:07'),(16,'bangla_qr','Bangla QR','Banks & QR',0,1,0,NULL,16,'2026-10-24 12:21:07','2026-10-24 12:21:07');
/*!40000 ALTER TABLE `payment_gateway_settings` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `payment_summaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_summaries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_payment_unique_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary_date` timestamp NOT NULL,
  `monthly_rent` decimal(11,2) NOT NULL DEFAULT '0.00',
  `additional_charge` decimal(11,2) NOT NULL DEFAULT '0.00',
  `vat` decimal(11,2) NOT NULL DEFAULT '0.00',
  `previous_due` decimal(11,2) NOT NULL DEFAULT '0.00',
  `advance` decimal(11,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `payment_summaries` WRITE;
/*!40000 ALTER TABLE `payment_summaries` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_summaries` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'create-user-role','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(2,'edit-user-role','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(3,'delete-user-role','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(4,'create-user','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(5,'edit-user','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(6,'delete-user','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(7,'view-user','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(8,'create-customer','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(9,'edit-customer','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(10,'delete-customer','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(11,'view-customer','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(12,'enable-customer','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(13,'disable-customer','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(14,'inactive-customer','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(15,'free-customer','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(16,'pending-customer','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(17,'collection-customer','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(18,'customer-billing-info','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(19,'customer-server-info','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(20,'customer-official-info','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(21,'password-reset','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(22,'payment-collection','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(23,'payment-edit','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(24,'payment-delete','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(25,'payment-history','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(26,'address-setup','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(27,'edit-address','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(28,'delete-address','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(29,'address-order','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(30,'mikrotik-setup','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(31,'edit-mikrotik','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(32,'delete-mikrotik','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(33,'mikrotik-user-create','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(34,'mikrotik-user-edit','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(35,'mikrotik-user-delete','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(36,'mikrotik-connection','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(37,'package-setup','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(38,'edit-package','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(39,'delete-package','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(40,'sms-setup','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(41,'edit-sms','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(42,'delete-sms','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(43,'create-web-content','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(44,'edit-web-content','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(45,'delete-web-content','web','2026-10-24 05:26:42','2026-10-24 05:26:42'),(46,'site-settings','web','2026-10-24 05:26:43','2026-10-24 05:26:43'),(47,'create-product','web','2026-10-24 05:26:43','2026-10-24 05:26:43'),(48,'edit-product','web','2026-10-24 05:26:43','2026-10-24 05:26:43'),(49,'delete-product','web','2026-10-24 05:26:43','2026-10-24 05:26:43'),(50,'search-customer','web','2026-10-24 05:26:43','2026-10-24 05:26:43'),(51,'all-customer','web','2026-10-24 05:26:43','2026-10-24 05:26:43'),(52,'collection-list','web','2026-10-24 05:26:43','2026-10-24 05:26:43'),(53,'without-collection-list','web','2026-10-24 05:26:43','2026-10-24 05:26:43'),(54,'enable-pending-customer','web','2026-10-24 05:26:43','2026-10-24 05:26:43'),(55,'recent-customer','web','2026-10-24 05:26:43','2026-10-24 05:26:43'),(56,'update-bill','web','2026-10-24 05:26:43','2026-10-24 05:26:43'),(57,'amount-collection','web','2026-10-24 05:26:43','2026-10-24 05:26:43'),(58,'amount-collection-report','web','2026-10-24 05:26:43','2026-10-24 05:26:43'),(59,'amount-collection-edit','web','2026-10-24 05:26:43','2026-10-24 05:26:43'),(60,'complain-list','web','2026-10-24 05:26:43','2026-10-24 05:26:43'),(61,'print-setup','web','2026-10-24 05:26:43','2026-10-24 05:26:43'),(62,'payment-setup','web','2026-10-24 05:26:43','2026-10-24 05:26:43'),(63,'mikrotik-auto-backup','web','2026-10-24 05:26:43','2026-10-24 05:26:43');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `permitted_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permitted_urls` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `router_id` bigint unsigned DEFAULT NULL,
  `url_or_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('url','ip') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'url',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permitted_urls_router_id_foreign` (`router_id`),
  CONSTRAINT `permitted_urls_router_id_foreign` FOREIGN KEY (`router_id`) REFERENCES `router_lists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `permitted_urls` WRITE;
/*!40000 ALTER TABLE `permitted_urls` DISABLE KEYS */;
/*!40000 ALTER TABLE `permitted_urls` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `reseller_commissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reseller_commissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reseller_id` bigint unsigned NOT NULL,
  `customer_id` bigint unsigned NOT NULL,
  `package_id` bigint unsigned DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL,
  `commission_percentage` decimal(8,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `reseller_commissions_reseller_id_foreign` (`reseller_id`),
  KEY `reseller_commissions_customer_id_foreign` (`customer_id`),
  KEY `reseller_commissions_package_id_foreign` (`package_id`),
  CONSTRAINT `reseller_commissions_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers_infos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reseller_commissions_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `package_lists` (`id`) ON DELETE SET NULL,
  CONSTRAINT `reseller_commissions_reseller_id_foreign` FOREIGN KEY (`reseller_id`) REFERENCES `resellers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `reseller_commissions` WRITE;
/*!40000 ALTER TABLE `reseller_commissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `reseller_commissions` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `reseller_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reseller_packages` (
  `reseller_id` bigint unsigned NOT NULL,
  `package_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`reseller_id`,`package_id`),
  KEY `reseller_packages_package_id_foreign` (`package_id`),
  CONSTRAINT `reseller_packages_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `package_lists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reseller_packages_reseller_id_foreign` FOREIGN KEY (`reseller_id`) REFERENCES `resellers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `reseller_packages` WRITE;
/*!40000 ALTER TABLE `reseller_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `reseller_packages` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `reseller_wallet_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reseller_wallet_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reseller_id` bigint unsigned NOT NULL,
  `type` enum('credit','debit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reseller_wallet_transactions_reseller_id_foreign` (`reseller_id`),
  CONSTRAINT `reseller_wallet_transactions_reseller_id_foreign` FOREIGN KEY (`reseller_id`) REFERENCES `resellers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `reseller_wallet_transactions` WRITE;
/*!40000 ALTER TABLE `reseller_wallet_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `reseller_wallet_transactions` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `resellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resellers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission_percentage` decimal(8,2) NOT NULL DEFAULT '10.00',
  `balance` decimal(15,2) NOT NULL DEFAULT '0.00',
  `status` enum('active','suspended') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `resellers_user_id_foreign` (`user_id`),
  CONSTRAINT `resellers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `resellers` WRITE;
/*!40000 ALTER TABLE `resellers` DISABLE KEYS */;
/*!40000 ALTER TABLE `resellers` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (4,2),(5,2),(6,2),(43,2),(44,2),(45,2),(43,3),(44,3),(45,3);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Super Admin','web','2026-10-24 05:26:43','2026-10-24 05:26:43'),(2,'Admin','web','2026-10-24 05:26:43','2026-10-24 05:26:43'),(3,'Manager','web','2026-10-24 05:26:43','2026-10-24 05:26:43'),(4,'Reseller','web','2026-10-24 05:26:43','2026-10-24 05:26:43');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `router_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `router_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `router_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ssh_port` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_port` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'connected',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `router_lists_router_name_unique` (`router_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `router_lists` WRITE;
/*!40000 ALTER TABLE `router_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `router_lists` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `site_visitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_visitors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `visited_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `site_visitors` WRITE;
/*!40000 ALTER TABLE `site_visitors` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_visitors` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `sms_gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_gateways` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_send_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_balance_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_profile_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `sms_gateways` WRITE;
/*!40000 ALTER TABLE `sms_gateways` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_gateways` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `sms_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_templates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `template_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `template` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_ex_en` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_ex_bn` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sms_templates_template_name_unique` (`template_name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `sms_templates` WRITE;
/*!40000 ALTER TABLE `sms_templates` DISABLE KEYS */;
INSERT INTO `sms_templates` VALUES (1,'all_customers','Dear {CUSTOMER_NAME}, Your {MONTH}\'s bill is {BILL_AMOUNT}/=, ID- {CUSTOMER_ID} Please pay before {LAST_DAY_OF_PAY_BILL}. -{COMPANY_NAME}, {COMPANY_MOBILE}','Example 1:\n</br>\n{CUSTOMER_NAME},\nThanks for being with us.\nID: {CUSTOMER_ID},\nIP {IP},\nPPPoE Username {PPPOE_USERNAME},\n- {COMPANY_NAME} {COMPANY_MOBILE}\n</br></br>\nExample 2:\n</br>\n{CUSTOMER_NAME},\nYour {MONTH}\'s bill is {BILL_AMOUNT}/=,\nID- {CUSTOMER_ID}\nPlease pay before {LAST_DAY_OF_PAY_BILL}.\n-{COMPANY_NAME}, {COMPANY_MOBILE}','Example 1:\n</br>\n{CUSTOMER_NAME},\nআমাদের সাথে থাকার জন্য ধন্যবাদ।\nID: {CUSTOMER_ID},\nIP {IP},\nPPPoE Username: {PPPOE_USERNAME}, \n- {COMPANY_NAME} {COMPANY_MOBILE}\n</br></br>\nExample 2:\n</br>\nআপনার NET এর, {MONTH} মাসের বিল {BILL_AMOUNT}/=,\nID- {CUSTOMER_ID}\nবিল দেয়ার শেষ দিন {LAST_DAY_OF_PAY_BILL},\n-{COMPANY_NAME}',1,'2026-10-24 05:26:44','2026-10-24 05:26:44'),(2,'area_wise_customer_due_list','Your NET service total due is {AMOUNT}Tk. ID- {CUSTOMER_ID}, Last day to pay the bill is {LAST_DAY_DUE_DATE} / {AUTO_TEMPORARY_DAY}, Please pay as soon as possible. - {COMPANY_NAME}','Your NET service total due is {AMOUNT}Tk.\nID- {CUSTOMER_ID},\nLast day to pay the bill is\n{LAST_DAY_DUE_DATE} / {AUTO_TEMPORARY_DAY},\nPlease pay as soon as possible.\n- {COMPANY_NAME}','আপনার NET বিল বকেয়া আছে {AMOUNT}/=,\nID- {CUSTOMER_ID},\nবিলটি পরিশোধ করার জন্য অনুরোধ করা হচ্ছে।\n- {COMPANY_NAME}',0,'2026-10-24 05:26:44','2026-10-24 05:26:44'),(3,'area_wise_customer_list','Dear {CUSTOMER_NAME}, Let us know if any problems you may have with your service and advice us to help you with it. -{COMPANY_NAME},{COMPANY_MOBILE}','Example 1:\n</br>\n{CUSTOMER_NAME},\nLet us know if any problems you may have with your service and\nadvice us to help you with it.\n-{COMPANY_NAME},{COMPANY_MOBILE}\n</br></br>\nExample 2:\n</br>\nYour NET Service {MONTH}\'s bill is {BILL_AMOUNT}Tk.\nPlease pay before {LAST_DAY_OF_PAY_BILL}.\n- {COMPANY_NAME}, {COMPANY_MOBILE}','Example 1:\n</br>\nআপনার NET সার্ভিস পেতে যেকোনো সমস্যা আমাদেরকে জানাবেন।\n-{COMPANY_NAME},{COMPANY_MOBILE}\n</br></br>\nExample 2:\n</br>\nআপনার NET এর, {MONTH} মাসের বিল {BILL_AMOUNT}/=,\nবিল দেয়ার শেষ দিন {LAST_DAY_OF_PAY_BILL},\n-{COMPANY_NAME}, {COMPANY_MOBILE}',0,'2026-10-24 05:26:44','2026-10-24 05:26:44'),(4,'auto_temporary_disable_alert','Dear {CUSTOMER_NAME}, ID: {CUSTOMER_ID}, Your connection is temporarily disconnected. Due is {DUE_AMOUNT}/=, - {COMPANY_NAME}, {COMPANY_MOBILE}','{CUSTOMER_NAME},\nID: {CUSTOMER_ID},\nYour connection is temporarily disconnected.\nDue is {DUE_AMOUNT}/=,\n- {COMPANY_NAME}, {COMPANY_MOBILE}','{CUSTOMER_NAME},\nID- {CUSTOMER_ID},\nআপনার সংযোগ অস্থায়ীভাবে বন্ধ হয়েছে।\nবকেয়া {DUE_AMOUNT}/=,\n- {COMPANY_NAME}',1,'2026-10-24 05:26:44','2026-10-24 05:26:44'),(5,'bill_generate','Your NET {MONTH}\'s bill is {BILL_AMOUNT}/=, ID- {CUSTOMER_ID} Please pay before {LAST_DAY_OF_PAY_BILL}. -{COMPANY_NAME}, {COMPANY_MOBILE}','Your NET {MONTH}\'s bill is {BILL_AMOUNT}/=,\nID- {CUSTOMER_ID}\nPlease pay before {LAST_DAY_OF_PAY_BILL}.\n-{COMPANY_NAME}, {COMPANY_MOBILE}','আপনার NET এর, {MONTH} মাসের বিল {BILL_AMOUNT}/=,\nID- {CUSTOMER_ID}\nবিল দেয়ার শেষ দিন {LAST_DAY_OF_PAY_BILL},\n-{COMPANY_NAME}',1,'2026-10-24 05:26:44','2026-10-24 05:26:44'),(6,'payment_collection','Dear {CUSTOMER_NAME}, We got {AMOUNT}/=, for {IP_OR_USER_NAME_OR_ID}, Your {BALANCE}/=, - {COMPANY_NAME}','Dear {CUSTOMER_NAME}, We got {AMOUNT}/=, for {IP_OR_USER_NAME_OR_ID}, Your {BALANCE}/=, - {COMPANY_NAME}','ইন্টারনেট বিল পরিশোধ {AMOUNT}/=,\nUsername/IP- {IP_OR_USER_NAME_OR_ID},\nবকেয়া {BALANCE}/=,\n- {COMPANY_NAME}',1,'2026-10-24 05:26:44','2026-10-24 05:26:44'),(7,'collection_(MFS)_to_owner','Got a payment of {AMOUNT}, from {CUSTOMER_NAME}, ID- {CUSTOMER_ID}, at {PAYMENT_SYSTEM}.','Got a payment of {AMOUNT}, from {CUSTOMER_NAME},\nID- {CUSTOMER_ID},\nat {PAYMENT_SYSTEM}.','টাকা কালেকশন- {AMOUNT}/=,\nID- {CUSTOMER_ID},\n{PAYMENT_SYSTEM} থেকে।',0,'2026-10-24 05:26:44','2026-10-24 05:26:44'),(8,'collection_delete','{CUSTOMER_NAME},\nYour {AMOUNT}Tk.\nthe collection has been canceled.\nYou paid {TOTAL_COLLECTION}Tk.\nFor any questions,\n- {COMPANY_NAME}, {COMPANY_MOBILE}','{CUSTOMER_NAME},\nYour {AMOUNT}Tk.\nthe collection has been canceled.\nYou paid {TOTAL_COLLECTION}Tk.\nFor any questions,\n- {COMPANY_NAME}, {COMPANY_MOBILE}','ইন্টারনেট বিলের টাকা ভুল করে {AMOUNT}/= জমা হয়েছিল।\nমোট {TOTAL_COLLECTION}/= দিয়েছেন,\nপ্রশ্ন থাকলে {COMPANY_MOBILE}\nযোগাযোগ করুন।',1,'2026-10-24 05:26:44','2026-10-24 05:26:44'),(9,'collection_edit','{CUSTOMER_NAME},\nYour collection amount {PREVIOUS_COLLECTION_AMOUNT}Tk.\nhas been updated with {CURRENT_COLLECTION_AMOUNT}Tk.\nThanks- {COMPANY_NAME}','{CUSTOMER_NAME},\nYour collection amount {PREVIOUS_COLLECTION_AMOUNT}Tk.\nhas been updated with {CURRENT_COLLECTION_AMOUNT}Tk.\nThanks- {COMPANY_NAME}','ইন্টারনেট বিল ভুল করে\n{PREVIOUS_COLLECTION_AMOUNT}/= জমা দেয়া হয়েছিল।\nএখন সঠিক ভাবে {CURRENT_COLLECTION_AMOUNT}/=\nজমা দেয়া হয়েছে।\n- {COMPANY_NAME}',1,'2026-10-24 05:26:44','2026-10-24 05:26:44'),(10,'collection_to_owner','Amount Collection {AMOUNT} for {CUSTOMER_NAME},\nID- {CUSTOMER_ID}\nat EasyEBilling Software.','Amount Collection {AMOUNT} for {CUSTOMER_NAME},\nID- {CUSTOMER_ID}\nat EasyEBilling Software.','টাকা কালেকশন- {AMOUNT}/=,\n{CUSTOMER_NAME},\nID- {CUSTOMER_ID}',0,'2026-10-24 05:26:44','2026-10-24 05:26:44'),(11,'complain_employee','New Complain-\n{CUSTOMER_NAME},\nID: {CUSTOMER_ID},\nIP: {IP},\nPPPoE: {PPPOE_USERNAME},\n{CUSTOMER_MOBILE},\nComplain: {COMPLAINS},\nComment: {COMMENT},\nAddress: {CUSTOMER_ADDRESS}','New Complain-\n{CUSTOMER_NAME},\nID: {CUSTOMER_ID},\nIP: {IP},\nPPPoE: {PPPOE_USERNAME},\n{CUSTOMER_MOBILE},\nComplain: {COMPLAINS},\nComment: {COMMENT},\nAddress: {CUSTOMER_ADDRESS}','নতুন অভিযোগ-\n{CUSTOMER_NAME},\nIP: {IP},\nPPPoE: {PPPOE_USERNAME},\n{CUSTOMER_MOBILE},\nঅভিযোগ: {COMPLAINS},\nমন্তব্য: {COMMENT},\nঠিকানা: {CUSTOMER_ADDRESS}',0,'2026-10-24 05:26:44','2026-10-24 05:26:44'),(12,'complain_list','Dear\n{CUSTOMER_NAME},\nYour problem has been resolved.\nIf needed give us a call {COMPANY_MOBILE}.\n- {COMPANY_NAME}','Dear\n{CUSTOMER_NAME},\nYour problem has been resolved.\nIf needed give us a call {COMPANY_MOBILE}.\n- {COMPANY_NAME}','{CUSTOMER_NAME},\nআপনার সমস্যাটি সমাধান করা হয়েছে।\nপ্রয়োজনে ফোন করুন {COMPANY_MOBILE},\n- {COMPANY_NAME}',0,'2026-10-24 05:26:44','2026-10-24 05:26:44'),(13,'complain_to_customer','{CUSTOMER_NAME},\nYour complain is: {COMPLAINS}, {COMMENT},\njust arised. {EMPLOYEE_NAME}, {EMPLOYEE_MOBILE}\nwill contact with you- {COMPANY_NAME}, {COMPANY_MOBILE}','{CUSTOMER_NAME},\nYour complain is: {COMPLAINS}, {COMMENT},\njust arised. {EMPLOYEE_NAME}, {EMPLOYEE_MOBILE}\nwill contact with you- {COMPANY_NAME}, {COMPANY_MOBILE}','আপনার অভিযোগ {COMPLAINS}, {COMMENT} পেয়েছি।\n{EMPLOYEE_NAME}, {EMPLOYEE_MOBILE} \nআপনার সাথে যোগাযোগ করবে।\n-{COMPANY_NAME}',0,'2026-10-24 05:26:44','2026-10-24 05:26:44'),(14,'create_customer','{CUSTOMER_NAME},\nID: {CUSTOMER_ID},\nIP: {IP},\nUsername: {PPPOE_USERNAME},\nEnjoy your new connection.\n-{COMPANY_NAME}','{CUSTOMER_NAME},\nID: {CUSTOMER_ID},\nIP: {IP},\nUsername: {PPPOE_USERNAME},\nEnjoy your new connection.\n-{COMPANY_NAME}','আমাদের ইন্টারনেট সংযোগ নেওয়ার জন্য ধন্যবাদ\nID: {CUSTOMER_ID}\nIP: {IP}\nUsername: {PPPOE_USERNAME}\nPassword : {PPPOE_PASSWORD}\n- {COMPANY_NAME}',0,'2026-10-24 05:26:44','2026-10-24 05:26:44'),(15,'create_customer_to_owner','A new customer just created-\n{CUSTOMER_NAME},\nID- {CUSTOMER_ID},\nIP- {IP},\nPPPoE Username- {PPPOE_USERNAME}','A new customer just created-\n{CUSTOMER_NAME},\nID- {CUSTOMER_ID},\nIP- {IP},\nPPPoE Username- {PPPOE_USERNAME}','নতুন গ্রাহক-\n{CUSTOMER_NAME},\nIP- {IP},\nPPPoE ID- {PPPOE_USERNAME}',0,'2026-10-24 05:26:44','2026-10-24 05:26:44'),(16,'free_customer_list','Dear\n{CUSTOMER_NAME},\nYou are given a complimentary free connection.\nIf you have a query let us know.\n- {COMPANY_NAME} {COMPANY_MOBILE}','Dear\n{CUSTOMER_NAME},\nYou are given a complimentary free connection.\nIf you have a query let us know.\n- {COMPANY_NAME} {COMPANY_MOBILE}','{CUSTOMER_NAME},\nআপনাকে একটি কমপ্লিমেন্টারি, ফ্রী সংযোগ দেওয়া হলো,\n- {COMPANY_NAME}, {COMPANY_MOBILE}',0,'2026-10-24 05:26:44','2026-10-24 05:26:44'),(17,'inactive_customer_list','{CUSTOMER_NAME},\nYour connection still remains inactive.\nTotal due is {DUE_AMOUNT}/=, to turn ON the connection\n- {COMPANY_NAME}, {COMPANY_MOBILE}','{CUSTOMER_NAME},\nYour connection still remains inactive.\nTotal due is {DUE_AMOUNT}/=, to turn ON the connection\n- {COMPANY_NAME}, {COMPANY_MOBILE}','আপনার NET সংযোগটি এখনও বন্ধ।\nসংযোগ ON করতে যোগাযোগ করুন।\n- {COMPANY_NAME}, {COMPANY_MOBILE}',0,'2026-10-24 05:26:44','2026-10-24 05:26:44'),(18,'failed_to_disable_at_mikrotik','{CUSTOMER_NAME},\nID- {ID},\nIP- {IP},\nPPPoE ID- {PPPOE_USERNAME}\nEnjoy your internet connection.\n- {COMPANY_NAME} {COMPANY_MOBILE}','{CUSTOMER_NAME},\nID- {ID},\nIP- {IP},\nPPPoE ID- {PPPOE_USERNAME}\nEnjoy your internet connection.\n- {COMPANY_NAME} {COMPANY_MOBILE}','{CUSTOMER_NAME},\nID- {ID},\nIP- {IP},\nPPPoE ID- {PPPOE_USERNAME}\nইন্টারনেটের সমস্যা থাকলে-\n{COMPANY_NAME}, {COMPANY_MOBILE}',0,'2026-10-24 05:26:44','2026-10-24 05:26:44'),(19,'temporary_disable_customer_list','{CUSTOMER_NAME},\nYour NET service is temporarily disconnected. \nThe due amount is {DUE_AMOUNT}/=,\n- {COMPANY_NAME}, {COMPANY_MOBILE}','{CUSTOMER_NAME},\nYour NET service is temporarily disconnected. \nThe due amount is {DUE_AMOUNT}/=,\n- {COMPANY_NAME}, {COMPANY_MOBILE}','আপনার NET সংযোগ অস্থায়ীভাবে বন্ধ আছে।\nবকেয়ার পরিমাণ {DUE_AMOUNT}/=,\n- {COMPANY_NAME}, {COMPANY_MOBILE}',1,'2026-10-24 05:26:44','2026-10-24 05:26:44'),(20,'reminder','{CUSTOMER_NAME},\nYour connection will be discontinued from\n{AUTO_TEMPORARY_DAY}. Please pay your bill.\nID- {ID},\nDue- {DUE_AMOUNT}/=,\n- {COMPANY_NAME}, {COMPANY_MOBILE}','{CUSTOMER_NAME},\nYour connection will be discontinued from\n{AUTO_TEMPORARY_DAY}. Please pay your bill.\nID- {ID},\nDue- {DUE_AMOUNT}/=,\n- {COMPANY_NAME}, {COMPANY_MOBILE}','আপনার সংযোগটি {AUTO_TEMPORARY_DAY} বন্ধ হবে।\nবন্ধ এড়াতে বিল পরিশোধ করুন।\nID- {ID},\nবকেয়া- {DUE_AMOUNT}/=,\n- {COMPANY_NAME}',0,'2026-10-24 05:26:44','2026-10-24 05:26:44');
/*!40000 ALTER TABLE `sms_templates` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `support_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_tickets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ticket_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_unique_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ppp_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` enum('low','medium','high') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'medium',
  `status` enum('open','in_progress','resolved','closed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_reply` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `replied_at` timestamp NULL DEFAULT NULL,
  `replied_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `support_tickets_ticket_no_unique` (`ticket_no`),
  KEY `support_tickets_customer_unique_id_index` (`customer_unique_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `support_tickets` WRITE;
/*!40000 ALTER TABLE `support_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `support_tickets` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `team_invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_invitations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `team_id` bigint unsigned NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `team_invitations_team_id_email_unique` (`team_id`,`email`),
  CONSTRAINT `team_invitations_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `team_invitations` WRITE;
/*!40000 ALTER TABLE `team_invitations` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_invitations` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `team_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `team_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `team_user_team_id_user_id_unique` (`team_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `team_user` WRITE;
/*!40000 ALTER TABLE `team_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_user` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_team` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teams_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `telescope_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telescope_entries` (
  `sequence` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`sequence`),
  UNIQUE KEY `telescope_entries_uuid_unique` (`uuid`),
  KEY `telescope_entries_batch_id_index` (`batch_id`),
  KEY `telescope_entries_family_hash_index` (`family_hash`),
  KEY `telescope_entries_created_at_index` (`created_at`),
  KEY `telescope_entries_type_should_display_on_index_index` (`type`,`should_display_on_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `telescope_entries` WRITE;
/*!40000 ALTER TABLE `telescope_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `telescope_entries` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `telescope_entries_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telescope_entries_tags` (
  `entry_uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`entry_uuid`,`tag`),
  KEY `telescope_entries_tags_tag_index` (`tag`),
  CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `telescope_entries_tags` WRITE;
/*!40000 ALTER TABLE `telescope_entries_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `telescope_entries_tags` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `telescope_monitoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telescope_monitoring` (
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `telescope_monitoring` WRITE;
/*!40000 ALTER TABLE `telescope_monitoring` DISABLE KEYS */;
/*!40000 ALTER TABLE `telescope_monitoring` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `user_login_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_login_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `authenticatable_id` bigint unsigned NOT NULL,
  `authenticatable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_login_logs_authenticatable_id_authenticatable_type_index` (`authenticatable_id`,`authenticatable_type`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `user_login_logs` WRITE;
/*!40000 ALTER TABLE `user_login_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_login_logs` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint unsigned DEFAULT NULL,
  `profile_photo_path` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'johirxofficial','admin@johirxofficial.local',NULL,NULL,'2026-10-24 13:16:34','$2y$12$IX9lRBFbC.3wRVf8R0UjRuSjzoUY9MvuXkQ2f.hdEExEG3Oz25QL2',NULL,NULL,NULL,'Hcocu4AgDyWSL66gcgaGJJUWvF5kp2japuYbqClP0ZArsr25mJqKiicNrC1V',NULL,NULL,'2026-10-24 05:26:43','2026-10-24 13:16:46'),(3,'johirxofficial Reseller','reseller@johirxofficial.local','01711122233',NULL,NULL,'$2y$12$8fL5IeNSXZQ9aw6bk3aXGeV3NuRlnqe8YtiVGjscZMTnkMgRD838y',NULL,NULL,NULL,NULL,NULL,NULL,'2026-10-24 05:26:44','2026-10-24 05:26:44');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `vouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vouchers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(15,2) NOT NULL,
  `type` enum('fixed_amount','package_based') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `package_id` bigint unsigned DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unused',
  `expiry_date` date NOT NULL,
  `reseller_id` bigint unsigned NOT NULL,
  `commission_paid_upfront` tinyint(1) NOT NULL DEFAULT '0',
  `used_by_customer_id` bigint unsigned DEFAULT NULL,
  `used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vouchers_code_unique` (`code`),
  KEY `vouchers_package_id_foreign` (`package_id`),
  KEY `vouchers_reseller_id_foreign` (`reseller_id`),
  KEY `vouchers_used_by_customer_id_foreign` (`used_by_customer_id`),
  CONSTRAINT `vouchers_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `package_lists` (`id`) ON DELETE SET NULL,
  CONSTRAINT `vouchers_reseller_id_foreign` FOREIGN KEY (`reseller_id`) REFERENCES `resellers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `vouchers_used_by_customer_id_foreign` FOREIGN KEY (`used_by_customer_id`) REFERENCES `customers_infos` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `vouchers` WRITE;
/*!40000 ALTER TABLE `vouchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `vouchers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

