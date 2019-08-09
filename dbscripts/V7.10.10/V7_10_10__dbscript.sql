-- MySQL dump 10.13  Distrib 5.7.26, for macos10.14 (x86_64)
--
-- Host: 34.67.196.20    Database: suitecrm
-- ------------------------------------------------------
-- Server version	5.5.5-10.2.25-MariaDB-1:10.2.25+maria~bionic

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` char(36) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `account_type` varchar(50) DEFAULT NULL,
  `industry` varchar(50) DEFAULT NULL,
  `annual_revenue` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `billing_address_street` varchar(150) DEFAULT NULL,
  `billing_address_city` varchar(100) DEFAULT NULL,
  `billing_address_state` varchar(100) DEFAULT NULL,
  `billing_address_postalcode` varchar(20) DEFAULT NULL,
  `billing_address_country` varchar(255) DEFAULT NULL,
  `rating` varchar(100) DEFAULT NULL,
  `phone_office` varchar(100) DEFAULT NULL,
  `phone_alternate` varchar(100) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `ownership` varchar(100) DEFAULT NULL,
  `employees` varchar(10) DEFAULT NULL,
  `ticker_symbol` varchar(10) DEFAULT NULL,
  `shipping_address_street` varchar(150) DEFAULT NULL,
  `shipping_address_city` varchar(100) DEFAULT NULL,
  `shipping_address_state` varchar(100) DEFAULT NULL,
  `shipping_address_postalcode` varchar(20) DEFAULT NULL,
  `shipping_address_country` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `sic_code` varchar(10) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_accnt_id_del` (`id`,`deleted`),
  KEY `idx_accnt_name_del` (`name`,`deleted`),
  KEY `idx_accnt_assigned_del` (`deleted`,`assigned_user_id`),
  KEY `idx_accnt_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_audit`
--

DROP TABLE IF EXISTS `accounts_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_accounts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_audit`
--

LOCK TABLES `accounts_audit` WRITE;
/*!40000 ALTER TABLE `accounts_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_bugs`
--

DROP TABLE IF EXISTS `accounts_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_bugs` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_acc_bug_acc` (`account_id`),
  KEY `idx_acc_bug_bug` (`bug_id`),
  KEY `idx_account_bug` (`account_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_bugs`
--

LOCK TABLES `accounts_bugs` WRITE;
/*!40000 ALTER TABLE `accounts_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_cases`
--

DROP TABLE IF EXISTS `accounts_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_cases` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_acc_case_acc` (`account_id`),
  KEY `idx_acc_acc_case` (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_cases`
--

LOCK TABLES `accounts_cases` WRITE;
/*!40000 ALTER TABLE `accounts_cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_contacts`
--

DROP TABLE IF EXISTS `accounts_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_account_contact` (`account_id`,`contact_id`),
  KEY `idx_contid_del_accid` (`contact_id`,`deleted`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_contacts`
--

LOCK TABLES `accounts_contacts` WRITE;
/*!40000 ALTER TABLE `accounts_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_cstm`
--

DROP TABLE IF EXISTS `accounts_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT 0.00000000,
  `jjwg_maps_lat_c` float(10,8) DEFAULT 0.00000000,
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_cstm`
--

LOCK TABLES `accounts_cstm` WRITE;
/*!40000 ALTER TABLE `accounts_cstm` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_cstm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_opportunities`
--

DROP TABLE IF EXISTS `accounts_opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_opportunities` (
  `id` varchar(36) NOT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_account_opportunity` (`account_id`,`opportunity_id`),
  KEY `idx_oppid_del_accid` (`opportunity_id`,`deleted`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_opportunities`
--

LOCK TABLES `accounts_opportunities` WRITE;
/*!40000 ALTER TABLE `accounts_opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_actions`
--

DROP TABLE IF EXISTS `acl_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_actions` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `acltype` varchar(100) DEFAULT NULL,
  `aclaccess` int(3) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aclaction_id_del` (`id`,`deleted`),
  KEY `idx_category_name` (`category`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_actions`
--

LOCK TABLES `acl_actions` WRITE;
/*!40000 ALTER TABLE `acl_actions` DISABLE KEYS */;
INSERT INTO `acl_actions` VALUES ('101cdcdb-6cc9-7205-44aa-5d4dc096117d','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','AOS_Contracts','module',90,0),('103bf659-9624-e113-c451-5d4dc04d38c2','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','AOK_KnowledgeBase','module',90,0),('1043266b-2008-bd21-adce-5d4dc0e6693f','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','AOS_PDF_Templates','module',89,0),('11103c26-34cf-9caa-deae-5d4dc01216d4','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','Surveys','module',90,0),('1129e257-e3f6-3bf8-f0ef-5d4dc06db1e3','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','Cases','module',90,0),('11947954-2194-ce50-3696-5d4dc000891b','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','AOP_Case_Events','module',90,0),('11e61c5b-cd9d-6943-ff01-5d4dc0535a55','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','Emails','module',90,0),('12818372-6302-eb5f-5507-5d4dc038a45f','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','AOD_IndexEvent','module',90,0),('12d781c6-e3ab-0f2a-fbac-5d4dc0a68d4b','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','Bugs','module',89,0),('13b2de2d-e465-473b-ea39-5d4dc01c2f9d','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','Contacts','module',90,0),('140871a0-25e9-f201-845f-5d4dc0566c55','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','Users','module',90,0),('146c78ce-629e-6c9d-bba7-5d4dc0efdd04','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','AOR_Reports','module',90,0),('1487011d-eb55-002e-41c7-5d4dc0a8684e','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','EmailTemplates','module',90,0),('153e462c-4c53-fad1-339d-5d4dc073a19e','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','AOS_Invoices','module',90,0),('1679d8e6-dfa8-b52a-ec98-5d4dc02b0e45','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','AOS_Quotes','module',89,0),('16ab8467-1665-c809-db65-5d4dc0ca6c40','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','jjwg_Maps','module',90,0),('1884c0b5-555c-e656-d61b-5d4dc08b1fba','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','EAPM','module',90,0),('18cc0375-ed18-541c-88ed-5d4dc03fe054','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','AOS_Invoices','module',90,0),('195f1aa6-f6f2-f883-3d5c-5d4dc0f13d44','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','Project','module',90,0),('1a1bbea5-6674-ca17-8e39-5d4dc09472aa','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','Calls','module',90,0),('1cdaa6be-6560-eec8-ad2a-5d4dc0465abd','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','AOP_Case_Updates','module',90,0),('1ce6cb0a-cb84-3ea8-0fd6-5d4dc0a5d8f1','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','AOR_Scheduled_Reports','module',90,0),('1d240bd6-1247-63bd-bbb6-5d4dc085f82d','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','AOD_Index','module',90,0),('1d97c76a-b4ba-454e-bcf1-5d4dc02d7d55','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','Accounts','module',90,0),('1e882779-e525-10c8-4eda-5d4dc0d03d96','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','FP_events','module',89,0),('1f444d42-a107-36fd-547f-5d4dc0349ab5','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','AOW_Processed','module',90,0),('1f7af666-8dd4-fed2-461f-5d4dc0cbb10e','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','ProspectLists','module',90,0),('1f9df032-3985-6a5e-179b-5d4dc0d3b0d0','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','AOS_Product_Categories','module',89,0),('21405bea-f28e-cce0-0c8f-5d4dc028d720','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','SurveyResponses','module',90,0),('21542a8f-f62c-e1cf-957f-5d4dc04bf999','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','Notes','module',90,0),('21837df7-254f-ffe3-a4a8-5d4dc0d0724f','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','Prospects','module',90,0),('224f5e43-fac0-83b1-fd87-5d4dc071ccf4','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','ProjectTask','module',90,0),('226cc16d-244a-e2af-05cb-5d4dc007fdd3','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','SurveyQuestionResponses','module',89,0),('2406bc89-9f17-c40e-a209-5d4dc0c6b0d9','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','AOS_Contracts','module',90,0),('240a05d6-c591-4285-2ac6-5d4dc0613d15','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','AOS_PDF_Templates','module',90,0),('247e3a5d-e031-de50-227d-5d4dc017cbe0','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','AOK_KnowledgeBase','module',90,0),('24fb0545-8c73-f774-7928-5d4dc0a1ef9a','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','jjwg_Maps','module',90,0),('25138fee-8fee-f5ed-d14b-5d4dc0513460','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','Cases','module',90,0),('25368a1d-5a99-20c2-87d1-5d4dc019f05c','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','AOK_Knowledge_Base_Categories','module',90,0),('25c893ab-6e4d-a031-e5a6-5d4dc09b8946','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','Surveys','module',90,0),('25ec2de4-f1c3-8a63-e337-5d4dc059f68b','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','Bugs','module',90,0),('2649d9e2-4ba2-7376-d39e-5d4dc05ccbfd','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','AOP_Case_Events','module',90,0),('26804040-e3b3-72c2-feaa-5d4dc0560f0d','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','Emails','module',90,0),('26f000f9-b259-237f-1240-5d4dc0588ee4','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','AOW_WorkFlow','module',90,0),('2814aea7-0199-29cb-ca9c-5d4dc05e5972','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','AOD_IndexEvent','module',90,0),('281ee33a-c72d-0451-7d2f-5d4dc0d6b40f','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','Contacts','module',90,0),('28a7c7a8-1944-faef-2b36-5d4dc0454830','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','EmailTemplates','module',90,0),('29389614-e032-522b-2f02-5d4dc045f8f8','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','AOS_Invoices','module',90,0),('298a0170-b621-28e5-a693-5d4dc0d27cfc','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','AOR_Reports','module',90,0),('2abb3d3a-41a8-03b5-339b-5d4dc0070b04','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','AOS_Quotes','module',90,0),('2b365bc4-d14b-b4d1-cf93-5d4dc0051988','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','jjwg_Maps','module',90,0),('2d09f9bb-580f-93c5-1c72-5d4dc02e6b58','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','EAPM','module',90,0),('2d66a446-e0aa-670a-6507-5d4dc0cda609','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','SurveyQuestions','module',89,0),('2d857601-80d0-a9f7-ae80-5d4dc0a60dcf','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','Project','module',90,0),('2e4bed56-d61b-e8c8-6754-5d4dc0ffdc8a','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','Calls','module',90,0),('30a74f78-fde9-347b-6d28-5d4dc057f90b','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','AOR_Scheduled_Reports','module',90,0),('311cc2ad-2be1-f859-d0b6-5d4dc085167f','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','AOP_Case_Updates','module',90,0),('330399d7-9944-2554-36b9-5d4dc0b211c4','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','AOD_Index','module',90,0),('33497423-453a-bf57-7ef3-5d4dc0ed3b17','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','FP_events','module',90,0),('3399f22f-da26-ef37-2653-5d4dc0ae0bde','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','AOS_Product_Categories','module',90,0),('339c9ab1-8224-80b2-e8fc-5d4dc06c1a34','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','ProspectLists','module',90,0),('33d27f18-9333-72ac-57b7-5d4dc0241dc4','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','AOW_Processed','module',90,0),('351beb86-b5fa-6f5d-7dfb-5d4dc0b7611d','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','SurveyResponses','module',90,0),('3558d94f-d4b6-4084-567e-5d4dc0cfa43c','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','Meetings','module',89,0),('3577e6a8-eb57-4779-da12-5d4dc0b56142','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','Leads','module',89,0),('35963422-d61b-91df-f7f9-5d4dc03567f3','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','Prospects','module',90,0),('35eb98dd-2c36-32b2-8253-5d4dc06fba4a','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','Notes','module',90,0),('361ed647-5520-3b73-9ff0-5d4dc021f685','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','ProjectTask','module',90,0),('364bbd77-3bae-7628-5565-5d4dc0a76ea0','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','SurveyQuestionResponses','module',90,0),('36794ded-5d64-2886-ad7a-5d4dc005e051','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','jjwg_Markers','module',89,0),('386196e9-8a3b-db3f-c623-5d4dc013ec7b','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','AOS_PDF_Templates','module',90,0),('3915ab17-9557-459d-a355-5d4dc0d6dce4','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','Cases','module',90,0),('39c8dd3f-7a49-6a62-c347-5d4dc09214cf','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','Bugs','module',90,0),('39fb4a7d-fd10-6c5d-bb14-5d4dc00c6210','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','Surveys','module',90,0),('3aa5b209-c7a5-817e-0c2e-5d4dc05690b5','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','AM_TaskTemplates','module',89,0),('3abf805b-15e3-43e3-065f-5d4dc0c0dd36','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','Emails','module',90,0),('3bc9c748-61af-430b-4522-5d4dc08e1b7c','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','AOP_Case_Events','module',90,0),('3c4d4928-402e-53b2-31e1-5d4dc0808c2f','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','EmailTemplates','module',90,0),('3cc87e74-1593-7488-24fe-5d4dc0eef018','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','Contacts','module',90,0),('3dbb0b7f-16f8-b73d-0163-5d4dc0a665ca','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','Spots','module',90,0),('3dc457b7-057c-6101-a0bd-5d4dc0706697','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','AOR_Reports','module',90,0),('3df84e57-3c6b-3e21-2875-5d4dc0ea5369','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','AOS_Invoices','module',90,0),('3e18facf-a019-172e-c71b-5d4dc0654b8a','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','Tasks','module',89,0),('3e3890a9-3044-7f99-7739-5d4dc0f63d29','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','SurveyQuestionOptions','module',89,0),('3e7fcc3c-2dfe-4eba-5fc5-5d4dc013b708','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','AM_ProjectTemplates','module',89,0),('3eab37af-b4a9-2b68-6351-5d4dc0458ffb','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','jjwg_Maps','module',90,0),('3f34efde-645f-f016-14a1-5d4dc0d661b5','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','AOS_Quotes','module',90,0),('3f79adea-e007-08ba-df76-5d4dc050f77a','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','AOS_Products','module',89,0),('410c97f0-1b57-a553-8853-5d4dc0e76b9a','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','EmailMarketing','module',89,0),('41263e4c-6ab9-ac7f-e9db-5d4dc0a185d4','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','Project','module',90,0),('412b521a-843e-2754-9dc2-5d4dc0264d2a','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','EAPM','module',90,0),('41c89708-7187-bcd8-01ab-5d4dc0fb54f4','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','SurveyQuestions','module',90,0),('42110260-f205-6703-15ad-5d4dc048ab9a','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','EAPM','module',90,0),('42889118-eb8b-73e8-fbee-5d4dc01858a0','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','Calls','module',90,0),('44816130-ebf8-f209-2f4d-5d4dc0801635','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','jjwg_Areas','module',89,0),('452c1791-a635-852e-aabc-5d4dc0d379bb','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','AOP_Case_Updates','module',90,0),('45746630-c228-4a65-2371-5d4dc0c9c126','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','AOR_Scheduled_Reports','module',90,0),('47b89c70-0dc3-6244-0c03-5d4dc00da59f','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','ProspectLists','module',90,0),('47c23a37-53f1-2e8f-4974-5d4dc03bea05','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','FP_events','module',90,0),('4864e5dd-1af8-46dd-5538-5d4dc0484015','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','AOS_Product_Categories','module',90,0),('492a5a9c-0a94-c6f5-64f4-5d4dc0ec461a','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','Prospects','module',90,0),('4a19dfee-9063-ae7e-7630-5d4dc051d31c','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','Notes','module',90,0),('4a2420e3-909c-0806-1e01-5d4dc0da08bf','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','ProjectTask','module',90,0),('4a80354b-6151-232d-63ec-5d4dc0bfeadb','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','SurveyQuestionResponses','module',90,0),('4aaa59bb-a2e6-3115-f8d7-5d4dc0458d4b','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','jjwg_Markers','module',90,0),('4acd0f69-74fb-c770-6996-5d4dc0f6f119','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','Meetings','module',90,0),('4b76da92-b842-2cd7-fdf9-5d4dc0612dab','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','Leads','module',90,0),('4bc192f9-cbb0-e57a-69a8-5d4dc0cdab0b','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','SurveyResponses','module',90,0),('4c612d7c-bec3-7a37-61b6-5d4dc0c6a3c9','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','Cases','module',90,0),('4d57885f-124a-3f5b-bdea-5d4dc0de811e','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','AOS_PDF_Templates','module',90,0),('4e103414-2b01-eb7d-bad6-5d4dc01788b2','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','Bugs','module',90,0),('4f431547-729d-85b4-d4ac-5d4dc087506f','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','Surveys','module',90,0),('4f4708ff-d265-0ccd-8be1-5d4dc0eebc05','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','Emails','module',90,0),('4f91484d-d27a-b4d3-1da3-5d4dc0c75851','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','EmailTemplates','module',90,0),('4fb036f1-29b6-3bf2-bf06-5d4dc03352aa','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','AM_TaskTemplates','module',90,0),('50248fed-646a-bcfb-17e8-5d4dc0ae9815','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','Alerts','module',89,0),('511f3650-dc66-d39f-659b-5d4dc0ce6775','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','Contacts','module',90,0),('516c02fa-2479-527b-bc46-5d4dc043aaeb','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','Calls_Reschedule','module',89,0),('51b2b0a9-88ca-d4c8-1cf8-5d4dc04c5269','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','AOR_Reports','module',90,0),('51e2f963-5566-02ee-a345-5d4dc0ddb527','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','AOS_Invoices','module',90,0),('526e0881-b84f-b1c1-ed10-5d4dc0bd78b5','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','AM_ProjectTemplates','module',90,0),('5288c391-d72c-d3bb-266a-5d4dc049d87f','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','Tasks','module',90,0),('5306aaf1-95b0-61d0-cf34-5d4dc06e3b5a','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','SurveyQuestionOptions','module',90,0),('532a9bf5-39c1-4064-86f1-5d4dc07b71a7','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','TemplateSectionLine','module',89,0),('533e4a26-4438-9a06-b9a4-5d4dc0d9fd6c','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','jjwg_Maps','module',90,0),('5367d8a1-1954-0eae-fd71-5d4dc0035db4','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','AOS_Quotes','module',90,0),('53d30a60-e0a3-db51-9db4-5d4dc08d09eb','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','AOS_Products','module',90,0),('53f1eb57-bf3c-af85-04a0-5d4dc02c49c1','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','Campaigns','module',89,0),('54010582-8636-a9b7-9b8f-5d4dc0c1fbba','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','Project','module',90,0),('549ab6c5-c74d-fe63-f99b-5d4dc0d0e5de','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','Project','module',90,0),('55251467-35a6-ac71-7b42-5d4dc0b944c0','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','EmailMarketing','module',90,0),('55598611-be5d-5000-7cfa-5d4dc0fae447','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','SurveyQuestions','module',90,0),('5581f76f-bf92-49ba-a66d-5d4dc09ff85c','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','EAPM','module',90,0),('5709fc24-fdda-c552-40e6-5d4dc044e702','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','jjwg_Address_Cache','module',89,0),('572bffe1-dacd-0850-ac45-5d4dc087ad81','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','Calls','module',90,0),('57caa9d6-4b56-5124-722a-5d4dc00bc9e1','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','OutboundEmailAccounts','module',89,0),('5a071d3a-ea17-5480-5436-5d4dc0c0f51c','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','FP_Event_Locations','module',89,0),('5b35ae7e-b1fd-2cd0-7326-5d4dc050bbe3','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','FP_events','module',90,0),('5b8c41f9-364a-c84e-5872-5d4dc088f4c7','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','SecurityGroups','module',89,0),('5c0327cc-5019-4421-1514-5d4dc0f02a07','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','ProspectLists','module',90,0),('5c275f5e-8717-324c-310d-5d4dc0c4c7f3','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','Opportunities','module',89,0),('5c3fd835-bf5a-255e-d1c6-5d4dc04870f3','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','AOS_Product_Categories','module',90,0),('5cb7304b-e580-e76c-f20e-5d4dc0fe7dfc','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','Prospects','module',90,0),('5e3183cc-7580-3eba-2d9d-5d4dc09116a3','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','jjwg_Markers','module',90,0),('5e5bbb18-cd75-fe12-b2ee-5d4dc0133017','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','ProjectTask','module',90,0),('5f291877-a7d4-e6ab-2658-5d4dc0e83245','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','Leads','module',90,0),('5f2d5b0c-bb2d-ecb5-dbf0-5d4dc0fefb36','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','SurveyResponses','module',90,0),('5f3bc900-3a8a-db63-bbbc-5d4dc0287ff8','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','Notes','module',90,0),('5fc40eb5-68e7-3e3d-1e9f-5d4dc015bc71','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','Calls','module',90,0),('601355ae-eca7-fae3-0701-5d4dc082778b','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','Meetings','module',90,0),('60d143cd-b478-f3ef-7f16-5d4dc0a76b1e','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','jjwg_Areas','module',90,0),('615f288a-dcb9-842e-1310-5d4dc083915f','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','SurveyQuestionResponses','module',90,0),('628924bc-3082-4b9e-a834-5d4dc0f054b1','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','Bugs','module',90,0),('6299450b-3782-d665-8c21-5d4dc07330a2','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','Documents','module',89,0),('631ad45d-10d2-18f8-da9e-5d4dc051fd11','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','Surveys','module',90,0),('63567a44-f0a5-c0b9-2bb9-5d4dc02532a8','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','EmailTemplates','module',90,0),('650b2fb8-08fe-39d1-96d5-5d4dc0cad103','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','Contacts','module',90,0),('65e188fd-255c-f836-b869-5d4dc0f85004','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','Tasks','module',90,0),('661e7f1c-1d0b-e779-cfeb-5d4dc0ac8b4a','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','Calls_Reschedule','module',90,0),('663799ba-f021-c808-1216-5d4dc0713f41','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','AM_ProjectTemplates','module',90,0),('66c8c3bf-7c7d-f352-e441-5d4dc0334fb5','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','AOS_Invoices','module',90,0),('670b4d82-46e6-34c3-a3e2-5d4dc03b05c8','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','AOR_Reports','module',90,0),('6754aff4-df5c-9b90-3cb7-5d4dc02baab9','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','SurveyQuestionOptions','module',90,0),('6797c97f-c44f-df62-288d-5d4dc0c84a6e','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','AOS_Quotes','module',90,0),('679b2054-4df2-148e-09e6-5d4dc05ec6d7','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','Alerts','module',90,0),('67d20f94-cf3d-97a8-2770-5d4dc088fb51','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','AOS_Products','module',90,0),('683153f7-e006-92d2-7d71-5d4dc08d73c5','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','AOS_PDF_Templates','module',90,0),('6840237e-8212-4143-04f5-5d4dc0f6cae1','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','Campaigns','module',90,0),('687781d4-5a70-c3a9-e2b9-5d4dc022b491','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','Spots','module',89,0),('690502c1-4fd9-7b76-70bb-5d4dc02ed8bf','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','TemplateSectionLine','module',90,0),('69572d28-a0db-5d29-72aa-5d4dc05b3708','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','EmailMarketing','module',90,0),('69a014a7-89e1-4b43-11b2-5d4dc09ef2f0','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','Emails','module',90,0),('69b004fd-40c9-1b98-ddde-5d4dc055b7a9','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','AOW_WorkFlow','module',89,0),('6a5153b5-c1b6-eb2f-95e2-5d4dc088104a','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','SurveyQuestions','module',90,0),('6a719397-48e1-9dbe-e004-5d4dc0516293','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','Users','module',89,0),('6ad6fc7e-74c4-11d3-fa45-5d4dc0c58c6a','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','jjwg_Address_Cache','module',90,0),('6b54211f-9d8c-dc11-33d3-5d4dc01e2291','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','OutboundEmailAccounts','module',90,0),('6d547f68-a354-bd65-97ae-5d4dc0a4eac5','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','FP_Event_Locations','module',90,0),('6e7de6fe-cb8e-58e0-3741-5d4dc000d9dd','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','FP_events','module',90,0),('6f430371-c5c7-4587-6e26-5d4dc0244acf','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','SecurityGroups','module',90,0),('6f9bad37-b413-4458-50cf-5d4dc09bdaa6','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','Opportunities','module',90,0),('6fa2e129-bd87-47a7-494e-5d4dc094d7ef','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','EAPM','module',90,0),('6fb86e98-bd2c-81bc-e5ef-5d4dc02245d7','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','AOS_Product_Categories','module',90,0),('70f0537b-c745-8300-59bf-5d4dc043c7c2','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','Prospects','module',90,0),('7206d889-3f27-d520-9adc-5d4dc0b0a761','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','ProjectTask','module',90,0),('7282e195-e8ab-0c5f-cd7d-5d4dc053630a','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','AM_TaskTemplates','module',90,0),('72b33a87-431d-f460-62f6-5d4dc0c110d1','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','jjwg_Markers','module',90,0),('74230884-b609-06b2-bb41-5d4dc0d597e9','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','jjwg_Areas','module',90,0),('7423f56b-ea16-3867-da8c-5d4dc083d49d','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','Leads','module',90,0),('7530dd0f-391e-c1ad-4ecb-5d4dc02179a8','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','Meetings','module',90,0),('7539f21a-cf3f-075e-e2ea-5d4dc01a2103','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','SurveyQuestionResponses','module',90,0),('77612833-1435-d530-9e35-5d4dc00e4afd','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','EmailTemplates','module',90,0),('77617e67-9f2b-8208-839e-5d4dc0c46be9','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','Bugs','module',90,0),('77a6ec4f-f249-351a-6fa0-5d4dc0fb4d62','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','Documents','module',90,0),('79178628-51ee-30ad-35ec-5d4dc0722836','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','Surveys','module',90,0),('792b88c4-6177-27c5-202c-5d4dc053d929','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','AOK_Knowledge_Base_Categories','module',89,0),('7a56c1b2-8ed4-1a0e-49bf-5d4dc0f1f35b','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','AM_ProjectTemplates','module',90,0),('7a713e46-b01f-fbe0-b98d-5d4dc054f032','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','AOS_Invoices','module',90,0),('7b8d26c2-acf2-6d21-6963-5d4dc026bbc6','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','SurveyQuestionOptions','module',90,0),('7be4ce3b-56e8-a757-0fb9-5d4dc04d6c26','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','AOS_Products','module',90,0),('7bf94135-78fb-1cf4-94f1-5d4dc000964a','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','AOS_Quotes','module',90,0),('7c149bfa-95bf-4187-9749-5d4dc0b70bfe','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','Calls_Reschedule','module',90,0),('7c1914cb-5d54-39de-8504-5d4dc0fe33e3','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','AOS_PDF_Templates','module',90,0),('7c4f16cf-8bee-9faa-b6c6-5d4dc0245b38','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','Tasks','module',90,0),('7c5f99f6-ac6f-adf1-33b6-5d4dc0ccec54','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','Campaigns','module',90,0),('7ca17787-dda9-b926-8406-5d4dc08b8bb3','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','AOD_IndexEvent','module',89,0),('7cfa7e70-9995-4a67-f71c-5d4dc0421f70','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','EmailMarketing','module',90,0),('7d432239-8b6f-c0ee-8b7f-5d4dc07413ac','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','Emails','module',90,0),('7d46e852-3a8b-48bb-c866-5d4dc0c50870','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','Spots','module',90,0),('7d85715c-3114-a366-6d23-5d4dc03093e1','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','TemplateSectionLine','module',90,0),('7d9462d1-9c28-4ba7-2d4f-5d4dc00e457f','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','SurveyQuestions','module',90,0),('7e4d3f1d-58ad-2dc2-2052-5d4dc059e546','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','Alerts','module',90,0),('7e4d92a9-33c7-04f6-53ad-5d4dc09d7928','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','AOW_WorkFlow','module',90,0),('7e9c3291-af32-53ee-acb9-5d4dc0aa3e6c','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','ProspectLists','module',90,0),('7ed566db-55eb-b506-0f01-5d4dc0893fe8','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','jjwg_Address_Cache','module',90,0),('7f1d8b05-81e2-0b10-f6e7-5d4dc0072963','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','Users','module',90,0),('7ffad7fe-13d9-6039-48d3-5d4dc0a35d9c','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','OutboundEmailAccounts','module',90,0),('80329b50-c126-fce9-4c7e-5d4dc0d6fa3e','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','FP_Event_Locations','module',90,0),('80f7017f-16a5-fac6-7681-5d4dc0974432','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','Accounts','module',90,0),('8182f0a1-802b-62d5-fcbc-5d4dc00c6141','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','FP_events','module',90,0),('82ebd214-6eae-8ffe-fc6e-5d4dc06101ae','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','Accounts','module',89,0),('83335cc9-1b3e-8e01-a21e-5d4dc0674e47','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','SecurityGroups','module',90,0),('84331806-ddd9-9dcf-231f-5d4dc059a4a2','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','Opportunities','module',90,0),('8434b348-715e-1bcb-c7f4-5d4dc0b3810a','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','AOS_Product_Categories','module',90,0),('84d70e9e-42dd-0aff-ad29-5d4dc0e17d17','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','AOD_Index','module',90,0),('85758b3c-b371-f668-0450-5d4dc01e6b2b','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','ProjectTask','module',90,0),('85d00f36-6b25-0cc8-1a8c-5d4dc01bf272','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','AOR_Reports','module',90,0),('8709aa0c-04c3-29d1-94ec-5d4dc06807ff','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','AM_TaskTemplates','module',90,0),('876f0cf5-6bcd-8937-02ab-5d4dc04d3c80','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','AOP_Case_Updates','module',90,0),('88234c1e-d7c5-8cb5-f2c8-5d4dc007b87d','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','Leads','module',90,0),('88318e3e-1cf7-9274-69a1-5d4dc0748ad0','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','AOK_KnowledgeBase','module',89,0),('88ae13cf-d47d-5321-7a99-5d4dc0672b12','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','SurveyQuestionResponses','module',90,0),('8a06a3ba-85f5-e9a8-0a05-5d4dc0788038','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','jjwg_Areas','module',90,0),('8a092099-3466-a2de-649c-5d4dc043710a','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','Meetings','module',90,0),('8a974e1d-1fec-f0d0-6d21-5d4dc0f09270','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','jjwg_Markers','module',90,0),('8bc06edb-7f73-4af8-a036-5d4dc018d128','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','Bugs','module',90,0),('8bcaf568-bf3d-2bbe-dfbe-5d4dc01aeed9','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','Documents','module',90,0),('8c241d25-71a0-9405-1326-5d4dc07aef88','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','AOS_Contracts','module',89,0),('8ce61d6f-881a-2134-401e-5d4dc09131aa','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','AOK_Knowledge_Base_Categories','module',90,0),('8e2c5874-9463-c213-38fd-5d4dc071e61d','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','AOD_Index','module',89,0),('8f343659-c870-a7f0-d00d-5d4dc0566b02','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','SurveyQuestionOptions','module',90,0),('8f878063-dbc3-ea39-be47-5d4dc0d037b0','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','AM_ProjectTemplates','module',90,0),('8ff3fe82-041f-7f01-3aa7-5d4dc04161e9','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','AOS_PDF_Templates','module',90,0),('9009e4dd-5d6d-7234-c781-5d4dc03fdcb4','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','Calls_Reschedule','module',90,0),('908250af-133f-b62a-c043-5d4dc0f8cc38','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','AOS_Products','module',90,0),('90974359-9774-5bd8-07c3-5d4dc01bc7de','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','Campaigns','module',90,0),('9098e498-3508-2983-17a1-5d4dc067fcc9','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','AOD_IndexEvent','module',90,0),('90ac057c-73ac-0c03-902d-5d4dc0f47ed9','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','AOS_Quotes','module',90,0),('90c5ccd4-17c3-27bd-7184-5d4dc050e154','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','Tasks','module',90,0),('91449eed-0407-2e90-213b-5d4dc049139a','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','SurveyQuestions','module',90,0),('914cf006-0e35-14ad-3a8e-5d4dc02bf989','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','EmailMarketing','module',90,0),('91a50bd8-66c1-9d8e-2899-5d4dc0edb629','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','AOR_Scheduled_Reports','module',90,0),('91a6f1de-c572-8f86-695a-5d4dc0d4dd78','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','AOW_WorkFlow','module',90,0),('92566d31-5e05-5442-23fd-5d4dc00f07d1','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','Spots','module',90,0),('92a3a0bf-99b5-d7ff-d404-5d4dc0e7a429','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','Alerts','module',90,0),('92aaa1ae-6670-d6e8-5460-5d4dc025412b','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','jjwg_Address_Cache','module',90,0),('92d5d55b-6b5c-137b-ff39-5d4dc0c6bac3','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','ProspectLists','module',90,0),('92edf469-84ef-0835-9207-5d4dc0465aa5','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','TemplateSectionLine','module',90,0),('93c7e4dd-1edc-0b8a-420a-5d4dc08cd1d0','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','FP_Event_Locations','module',90,0),('94e9aac0-faf2-e2e2-b5c7-5d4dc0cbca82','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','FP_events','module',90,0),('97753e86-f617-b8bf-4c6f-5d4dc06fa401','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','Accounts','module',90,0),('97a88a5a-68cf-e4f5-585e-5d4dc0605156','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','SecurityGroups','module',90,0),('97ad9fc5-364f-3abc-8bcd-5d4dc0d733f9','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','OutboundEmailAccounts','module',90,0),('982596ef-525d-eb06-2df7-5d4dc094946c','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','AOS_Product_Categories','module',90,0),('991a0bcb-95a0-c786-50ef-5d4dc0c8a1a5','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','ProjectTask','module',90,0),('992a17f7-61f2-0f95-b6a4-5d4dc0ce4377','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','AOW_Processed','module',89,0),('993e512f-c2f0-cf49-08ff-5d4dc0dcee6e','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','AOP_Case_Events','module',89,0),('9a879fc8-3669-b3c2-14dc-5d4dc02c7879','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','Opportunities','module',90,0),('9c27ecd8-1355-15e4-a491-5d4dc04936a0','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','Leads','module',90,0),('9c3f3aee-d838-44cf-65e7-5d4dc06e251b','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','AM_TaskTemplates','module',90,0),('9cb691fc-b701-4b5c-55aa-5d4dc0001d43','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','SurveyQuestionResponses','module',90,0),('9ce12a0c-5997-42f0-3ec0-5d4dc0a25c6d','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','AOK_KnowledgeBase','module',90,0),('9df740b7-5e09-b8b4-5d8f-5d4dc08e97f1','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','jjwg_Areas','module',90,0),('9e16edaf-33fd-c10e-6727-5d4dc0d9465b','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','Meetings','module',90,0),('9ed753fa-93b9-5e12-1add-5d4dc0fb5bce','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','jjwg_Markers','module',90,0),('9f7f55f5-3b35-ffff-e962-5d4dc0ca8997','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','Bugs','module',90,0),('a01d84e8-728c-c86b-c7fa-5d4dc0fa3016','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','AOS_Contracts','module',90,0),('a1894ded-7e12-d1c4-a032-5d4dc03da5e7','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','Users','module',90,0),('a395678f-04c8-c646-de81-5d4dc0e1ebe3','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','Calls_Reschedule','module',90,0),('a3a74327-ca4e-5170-0746-5d4dc0eef0e0','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','SurveyQuestionOptions','module',90,0),('a3c85b83-2649-19e5-c156-5d4dc0f97688','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','AM_ProjectTemplates','module',90,0),('a42a841e-a109-cb96-0485-5d4dc0a7f8e6','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','AOS_PDF_Templates','module',90,0),('a452b4ad-312b-ad74-792a-5d4dc07e5128','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','AOD_IndexEvent','module',90,0),('a4bbdf98-6c43-e872-e19c-5d4dc015feb5','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','SurveyQuestions','module',90,0),('a4d3ba97-7c2c-a43c-343b-5d4dc0096ccf','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','Campaigns','module',90,0),('a4eb0edb-8f74-90bb-0c22-5d4dc0fd23aa','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','AOS_Quotes','module',90,0),('a51a5b0d-b8be-06a3-60e2-5d4dc0962776','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','AOW_WorkFlow','module',90,0),('a52752e2-f4f4-8c14-c6c3-5d4dc0a8d709','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','AOS_Products','module',90,0),('a52e2d19-86da-a634-8778-5d4dc027adbb','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','Tasks','module',90,0),('a58294cf-d4d9-1edf-1e4f-5d4dc0696ef8','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','AOK_Knowledge_Base_Categories','module',90,0),('a5a15e2f-afa1-328d-a338-5d4dc028cea7','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','EmailMarketing','module',90,0),('a6a6f796-a179-62cb-2b28-5d4dc0fc0829','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','jjwg_Address_Cache','module',90,0),('a6b1f94e-8e3e-3cc6-faf3-5d4dc007b1f6','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','Spots','module',90,0),('a71b9469-6442-0067-90cb-5d4dc00c8927','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','TemplateSectionLine','module',90,0),('a779386d-4f96-2b1b-23b4-5d4dc01d1edc','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','FP_Event_Locations','module',90,0),('a84a12e2-073b-1488-930e-5d4dc09e44fe','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','FP_events','module',90,0),('a8f4cb01-641a-e4d6-7f83-5d4dc04cfde8','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','Alerts','module',90,0),('a9cfd4e5-bd71-e17b-0257-5d4dc08258f0','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','AOD_Index','module',90,0),('ab7dfe6b-725d-0b4e-042d-5d4dc059f805','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','SecurityGroups','module',90,0),('abc308b7-0d4a-be55-6da2-5d4dc0f68457','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','Accounts','module',90,0),('abdae115-f311-4adb-8e94-5d4dc05c5d29','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','OutboundEmailAccounts','module',90,0),('ac09aff1-8b6a-6f0f-08f5-5d4dc0cc234a','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','AOP_Case_Updates','module',89,0),('acd18e05-d7fc-7eb2-7f25-5d4dc088ef02','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','AOR_Scheduled_Reports','module',89,0),('adc10e44-a676-867b-10db-5d4dc0a5b705','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','ProspectLists','module',90,0),('adc6f75b-2227-f389-7628-5d4dc09f226d','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','AOP_Case_Events','module',90,0),('add8ad45-8eda-0679-a558-5d4dc02aae96','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','AOW_Processed','module',90,0),('ae548bd5-17f6-8657-48ba-5d4dc0296806','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','Documents','module',90,0),('ae69be44-8fff-2c0c-6611-5d4dc06868f0','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','Opportunities','module',90,0),('afbe68d5-d9bd-74cd-39ee-5d4dc0f83616','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','Leads','module',90,0),('b06c0bd2-5ee0-a84d-3487-5d4dc0330353','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','SurveyQuestionResponses','module',90,0),('b09b3c35-7417-3f9a-dc3f-5d4dc0f07102','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','AM_TaskTemplates','module',90,0),('b14114b3-6dd6-f82f-ca25-5d4dc0e33ad1','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','AOK_KnowledgeBase','module',90,0),('b2003cd1-caec-9555-7412-5d4dc01443de','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','Meetings','module',90,0),('b210182b-cabb-ba76-8ea4-5d4dc0525492','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','jjwg_Areas','module',90,0),('b2c30291-7d0e-6257-70bf-5d4dc0f75528','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','AOW_Processed','module',90,0),('b38c4cb6-e3a6-de85-cfe6-5d4dc03a9f8a','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','jjwg_Markers','module',90,0),('b3bc2e5d-bf9c-68c4-b858-5d4dc0350376','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','AOS_Contracts','module',90,0),('b556a5bc-9541-7777-8d1d-5d4dc0113a84','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','Cases','module',89,0),('b55a03b0-ed77-5ea8-bb96-5d4dc0f6cbda','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','Users','module',90,0),('b730d713-62f7-2bab-e4a9-5d4dc0bf738c','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','SurveyQuestionOptions','module',90,0),('b7639bf5-2257-58a2-8c75-5d4dc081de87','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','Calls_Reschedule','module',90,0),('b9015e78-f235-37e7-99a3-5d4dc0e80ce2','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','jjwg_Maps','module',89,0),('b9027099-ba6b-e43c-1d7a-5d4dc09bd561','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','SurveyQuestions','module',90,0),('b9049922-11c9-de97-8ec9-5d4dc0246c2b','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','AM_ProjectTemplates','module',90,0),('b9290732-b7e4-2e52-b861-5d4dc085ece2','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','AOS_Products','module',90,0),('b9559d92-1d09-2250-3b00-5d4dc0c4e8a6','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','AOK_Knowledge_Base_Categories','module',90,0),('b97e9c5e-ffe3-20a1-96d2-5d4dc0777f51','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','AOS_Product_Categories','module',90,0),('b9dfb855-82dd-a964-9e26-5d4dc0871aba','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','AOW_WorkFlow','module',90,0),('b9ef1e33-3700-73f1-b620-5d4dc0de50e0','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','EmailMarketing','module',90,0),('b9f4749d-b24e-88b6-08bc-5d4dc0bee71f','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','Campaigns','module',90,0),('ba438177-d11a-45b7-885a-5d4dc0e32e88','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','AOD_IndexEvent','module',90,0),('ba4a173d-ccdb-55ba-faed-5d4dc0b27ebd','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','Tasks','module',90,0),('baa7f415-9686-c77c-d16d-5d4dc0dd94ee','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','Spots','module',90,0),('bacf3300-8e64-ded1-4188-5d4dc08ad714','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','jjwg_Address_Cache','module',90,0),('bb29f3b8-9403-b8cd-2aaf-5d4dc088439f','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','TemplateSectionLine','module',90,0),('bb428305-b5eb-43f7-3d0d-5d4dc0016a7e','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','FP_Event_Locations','module',90,0),('bd3ae7c7-e142-8812-5abd-5d4dc0d9cecf','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','Project','module',89,0),('bdb04507-5581-b247-25b7-5d4dc0b6689f','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','Calls','module',89,0),('bed15170-be21-c093-fd58-5d4dc0b38e5d','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','Alerts','module',90,0),('bf5087dd-c860-466e-042a-5d4dc02b32e6','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','AOD_Index','module',90,0),('bf5b5852-dc25-68c5-222e-5d4dc0a89265','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','Accounts','module',90,0),('bfbeb19a-254a-a57a-1678-5d4dc07a2c14','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','SecurityGroups','module',90,0),('c02fa49b-cd85-eee0-2e8e-5d4dc0fc8f4f','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','OutboundEmailAccounts','module',90,0),('c06dfbe5-3308-8ea2-42e6-5d4dc00cda18','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','AOR_Scheduled_Reports','module',90,0),('c091e99a-5be3-6490-8f15-5d4dc0eacbb2','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','AOP_Case_Updates','module',90,0),('c091ebda-cef1-de0f-a8c3-5d4dc0c7cfde','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','Notes','module',89,0),('c2411de2-64c9-df67-d7a3-5d4dc03a9e15','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','AOW_Processed','module',90,0),('c2ca89ed-ba97-6d06-0fde-5d4dc048a9c7','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','Documents','module',90,0),('c3108cf8-5178-ed5a-8b67-5d4dc0ddc3eb','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','Opportunities','module',90,0),('c3f6b4de-3dff-8232-36c9-5d4dc0b86211','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','Leads','module',90,0),('c4e12249-812e-c6ef-2531-5d4dc04c1601','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','AM_TaskTemplates','module',90,0),('c5060b8f-646c-37f3-667a-5d4dc06e2e2f','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','SurveyResponses','module',89,0),('c5c9d512-422a-c130-b1fa-5d4dc07c4563','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','Meetings','module',90,0),('c626bea2-7fa0-9635-73b8-5d4dc09afedd','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','AOP_Case_Events','module',90,0),('c6a13faf-9ee5-2c1e-af83-5d4dc0d8360b','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','jjwg_Areas','module',90,0),('c751d34f-7b51-1f05-f857-5d4dc04224b0','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','AOK_KnowledgeBase','module',90,0),('c782b5f9-8723-dd37-e98c-5d4dc008e0ee','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','AOS_Contracts','module',90,0),('c8020834-9ed2-ba3d-7277-5d4dc04b8e76','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','jjwg_Markers','module',90,0),('c8e07d2b-c96b-0de2-d9f7-5d4dc040aaa0','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','Cases','module',90,0),('c976f96e-52d5-b747-ed77-5d4dc04d360d','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','Users','module',90,0),('ca686292-5210-f8df-0499-5d4dc03a3777','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','SurveyQuestionOptions','module',90,0),('cb4b82f2-30ce-9d23-caad-5d4dc091b271','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','Contacts','module',89,0),('cba5cb1d-473b-c602-d425-5d4dc0591100','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','Calls_Reschedule','module',90,0),('cc9ca593-9ff7-90e1-78b8-5d4dc0e7116d','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','AM_ProjectTemplates','module',90,0),('cc9d71f1-23a8-c39c-0ba5-5d4dc07154f3','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','AOR_Reports','module',89,0),('ccf13e0b-14cc-d2e0-541f-5d4dc07e68fe','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','jjwg_Maps','module',90,0),('cd9a531d-477c-2a25-d879-5d4dc01bc126','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','AOS_Products','module',90,0),('cde88efb-0442-656d-0685-5d4dc05277d7','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','AOW_WorkFlow','module',90,0),('ce077c06-fd6e-160b-1069-5d4dc0ed0e75','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','Campaigns','module',90,0),('ce1a9ef1-b9d6-244d-30d5-5d4dc046138f','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','EmailMarketing','module',90,0),('cecad74c-3808-01ab-6d18-5d4dc06d6286','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','Tasks','module',90,0),('cf0a77fc-4580-4485-6c62-5d4dc065cac4','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','AOD_IndexEvent','module',90,0),('cf5e573b-3219-5205-7c2d-5d4dc0a92157','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','TemplateSectionLine','module',90,0),('cf608103-f0da-bbc6-96d4-5d4dc04783dc','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','Spots','module',90,0),('cf99d06d-5e0f-2d9a-c3ea-5d4dc013ffa1','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','FP_Event_Locations','module',90,0),('cfc044e7-3d0e-e68d-088f-5d4dc02e1b63','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','jjwg_Address_Cache','module',90,0),('d004086d-b46b-c937-2b23-5d4dc0784373','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','AOK_Knowledge_Base_Categories','module',90,0),('d054bfe6-e6f0-9ee3-d8a1-5d4dc083f57e','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','Emails','module',89,0),('d0ea0e2b-8288-aa8e-575b-5d4dc088beb6','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','SurveyResponses','module',90,0),('d1082b5e-5524-4bac-1447-5d4dc0b598b9','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','EAPM','module',89,0),('d17175f6-804d-6727-4b63-5d4dc0cfc055','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','Project','module',90,0),('d1a28de1-c8c8-5953-59d1-5d4dc0855176','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','Calls','module',90,0),('d2d10911-9f3e-01e6-c0f4-5d4dc06d7bcd','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','Notes','module',90,0),('d382c733-a28f-f02e-dc0a-5d4dc0093860','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','AOD_Index','module',90,0),('d3a17edb-fdc2-da8c-c618-5d4dc0dd9e72','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','Accounts','module',90,0),('d40db0f6-bb65-7200-dcde-5d4dc08231ca','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','OutboundEmailAccounts','module',90,0),('d462a3a1-d178-5567-5e0d-5d4dc0f42c1d','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','SecurityGroups','module',90,0),('d46f72ae-9981-85b9-acab-5d4dc0addb33','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','AOP_Case_Updates','module',90,0),('d4ca4d6f-658f-c742-132b-5d4dc004a0f5','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','AOR_Scheduled_Reports','module',90,0),('d5ae0486-21dc-a30a-5d36-5d4dc0cca71f','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','Documents','module',90,0),('d5f1e9a0-5196-3450-96e1-5d4dc0c51c64','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','Alerts','module',90,0),('d65a42ff-2433-4d57-e4f0-5d4dc0612a7c','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','AOW_Processed','module',90,0),('d6d23ad3-3e7f-24ff-cb10-5d4dc04c2d04','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','Opportunities','module',90,0),('d854c646-f67b-19ef-ec85-5d4dc0bfd129','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','Notes','module',90,0),('d88fdd99-f2c7-0b92-c40e-5d4dc02af077','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','AM_TaskTemplates','module',90,0),('d8fa36cc-264c-d988-fedc-5d4dc0c7c436','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','Documents','module',90,0),('d97a128b-b5ee-6e78-71b4-5d4dc0e71303','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','SurveyResponses','module',90,0),('d9a05e27-8a0a-7733-933c-5d4dc0234f87','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','Prospects','module',89,0),('d9df5668-ed5f-9192-4a19-5d4dc0e1bc2d','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','Surveys','module',89,0),('da8afac3-4721-51fd-8141-5d4dc05ede99','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','AOP_Case_Events','module',90,0),('db5ccf4d-86af-a824-02d1-5d4dc0eb6c1c','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','jjwg_Areas','module',90,0),('dbbc3863-fb1a-b7c7-bf92-5d4dc059b9bf','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','AOS_Contracts','module',90,0),('dd28ef0d-2772-2356-a2d1-5d4dc0520a27','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','Cases','module',90,0),('dd320352-748e-a19a-9433-5d4dc009af36','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','AOK_KnowledgeBase','module',90,0),('ddc6cf42-3add-3c60-eb64-5d4dc06b3523','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','Users','module',90,0),('de2e0612-a702-95bf-d7a2-5d4dc036cd43','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','Prospects','module',90,0),('df9d1b32-90f7-d9ce-049c-5d4dc028c72d','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','Contacts','module',90,0),('dfbcb8d1-5eb8-9e93-5d13-5d4dc04d1102','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','Calls_Reschedule','module',90,0),('e0ef0bff-993c-a5be-de1e-5d4dc032139b','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','ProjectTask','module',89,0),('e104ed6a-f37f-917e-8914-5d4dc0b09976','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','AOR_Reports','module',90,0),('e1763d3e-5f2e-734b-9726-5d4dc0127285','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','EmailTemplates','module',89,0),('e17e6be8-5e09-83d4-c772-5d4dc01aa158','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','AOS_Invoices','module',89,0),('e19994ca-ded0-b1ba-1ff1-5d4dc0a9a2af','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','jjwg_Maps','module',90,0),('e1fe7d5d-19ca-8b69-9d0d-5d4dc0ba56ca','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','Campaigns','module',90,0),('e2785759-604d-0fd3-1946-5d4dc0633da4','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','AOW_WorkFlow','module',90,0),('e4078705-cfa0-1b34-4d32-5d4dc06caa4e','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','Spots','module',90,0),('e45e4645-717e-172b-9d56-5d4dc0852e67','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','jjwg_Address_Cache','module',90,0),('e4b11955-8f16-babc-2036-5d4dc0d2cb1d','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','EAPM','module',90,0),('e51f513c-9aa9-0bdb-c7d9-5d4dc061369e','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','Project','module',90,0),('e574e6f3-9ec2-3baa-005b-5d4dc02b9a03','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','FP_Event_Locations','module',90,0),('e5a7ff04-8404-a703-bb4b-5d4dc0be6e99','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','Calls','module',90,0),('e79fb255-302d-db49-888a-5d4dc01f514b','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','TemplateSectionLine','module',90,0),('e7d00c9f-05b9-012c-7d46-5d4dc0bc708f','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','EmailTemplates','module',90,0),('e7d98cc2-1e35-481f-1341-5d4dc0c1eae3','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','Accounts','module',90,0),('e7e3927e-1805-66a7-188c-5d4dc04a67de','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','AOD_Index','module',90,0),('e85cf892-5034-e0cc-6aa2-5d4dc0c24d26','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','OutboundEmailAccounts','module',90,0),('e86fdcd1-6ebe-2c2b-5e71-5d4dc0591d18','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','AOR_Scheduled_Reports','module',90,0),('e8b7df0e-b0f8-4a1a-9879-5d4dc0cbc475','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','AOP_Case_Updates','module',90,0),('e90063d6-d246-dc38-663f-5d4dc0fcf3f3','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','access','ProspectLists','module',89,0),('e9e8213d-65cb-116b-0bf3-5d4dc029e8f6','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','SecurityGroups','module',90,0),('ea0eae7e-b9d7-b960-2a61-5d4dc0abe97e','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','Opportunities','module',90,0),('eb2e3030-5331-100f-1e60-5d4dc08b21b3','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','AOW_Processed','module',90,0),('eb325835-ce4d-e271-5d80-5d4dc0e5fad1','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','massupdate','Alerts','module',90,0),('ec2fe2a7-722e-fcc7-6ed9-5d4dc0270022','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','AOK_Knowledge_Base_Categories','module',90,0),('ecdf779f-fe43-7973-6d2d-5d4dc09cda5e','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','SurveyResponses','module',90,0),('ece429d9-93c9-0c3e-6313-5d4dc0a52518','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','Notes','module',90,0),('ed2ed60d-1549-d819-beab-5d4dc0008b20','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','Documents','module',90,0),('ee572aaf-e3a0-8845-ceb8-5d4dc02124a3','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','Prospects','module',90,0),('eea6057d-2e06-7698-7b64-5d4dc09480c6','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','AOK_Knowledge_Base_Categories','module',90,0),('ef48d868-f7f5-6fa1-05f0-5d4dc0f913c2','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','delete','AOP_Case_Events','module',90,0),('f054088a-1cf1-3c9d-9e78-5d4dc0702446','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','AOS_Contracts','module',90,0),('f0863093-dc0c-172b-9252-5d4dc08c2a80','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','AOD_IndexEvent','module',90,0),('f0e6cece-567c-d045-8d06-5d4dc02e7555','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','import','AOK_KnowledgeBase','module',90,0),('f0efb6fe-99d8-b91a-6ee8-5d4dc0be6077','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','Surveys','module',90,0),('f154743c-e7e4-06fb-0dde-5d4dc093d082','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','edit','Cases','module',90,0),('f208563d-a9c2-2f56-51cb-5d4dc08dea91','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','export','Users','module',90,0),('f2135977-b647-9aed-c8ed-5d4dc054e138','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','view','Emails','module',90,0),('f3f99a4e-0e5e-b3ba-a9a4-5d4dc0c5fa6f','2019-08-09 18:51:09','2019-08-09 18:51:09','1','','list','Contacts','module',90,0);
/*!40000 ALTER TABLE `acl_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_roles`
--

DROP TABLE IF EXISTS `acl_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_roles` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aclrole_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_roles`
--

LOCK TABLES `acl_roles` WRITE;
/*!40000 ALTER TABLE `acl_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_roles_actions`
--

DROP TABLE IF EXISTS `acl_roles_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_roles_actions` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `action_id` varchar(36) DEFAULT NULL,
  `access_override` int(3) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_acl_role_id` (`role_id`),
  KEY `idx_acl_action_id` (`action_id`),
  KEY `idx_aclrole_action` (`role_id`,`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_roles_actions`
--

LOCK TABLES `acl_roles_actions` WRITE;
/*!40000 ALTER TABLE `acl_roles_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_roles_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_roles_users`
--

DROP TABLE IF EXISTS `acl_roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_roles_users` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_aclrole_id` (`role_id`),
  KEY `idx_acluser_id` (`user_id`),
  KEY `idx_aclrole_user` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_roles_users`
--

LOCK TABLES `acl_roles_users` WRITE;
/*!40000 ALTER TABLE `acl_roles_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_book`
--

DROP TABLE IF EXISTS `address_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_book` (
  `assigned_user_id` char(36) NOT NULL,
  `bean` varchar(50) DEFAULT NULL,
  `bean_id` char(36) NOT NULL,
  KEY `ab_user_bean_idx` (`assigned_user_id`,`bean`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_book`
--

LOCK TABLES `address_book` WRITE;
/*!40000 ALTER TABLE `address_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alerts` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `target_module` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `url_redirect` varchar(255) DEFAULT NULL,
  `reminder_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerts`
--

LOCK TABLES `alerts` WRITE;
/*!40000 ALTER TABLE `alerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_projecttemplates`
--

DROP TABLE IF EXISTS `am_projecttemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `am_projecttemplates` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Draft',
  `priority` varchar(100) DEFAULT 'High',
  `override_business_hours` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_projecttemplates`
--

LOCK TABLES `am_projecttemplates` WRITE;
/*!40000 ALTER TABLE `am_projecttemplates` DISABLE KEYS */;
/*!40000 ALTER TABLE `am_projecttemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_projecttemplates_audit`
--

DROP TABLE IF EXISTS `am_projecttemplates_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `am_projecttemplates_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_am_projecttemplates_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_projecttemplates_audit`
--

LOCK TABLES `am_projecttemplates_audit` WRITE;
/*!40000 ALTER TABLE `am_projecttemplates_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `am_projecttemplates_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_projecttemplates_contacts_1_c`
--

DROP TABLE IF EXISTS `am_projecttemplates_contacts_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `am_projecttemplates_contacts_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `am_projecttemplates_ida` varchar(36) DEFAULT NULL,
  `contacts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `am_projecttemplates_contacts_1_alt` (`am_projecttemplates_ida`,`contacts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_projecttemplates_contacts_1_c`
--

LOCK TABLES `am_projecttemplates_contacts_1_c` WRITE;
/*!40000 ALTER TABLE `am_projecttemplates_contacts_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `am_projecttemplates_contacts_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_projecttemplates_project_1_c`
--

DROP TABLE IF EXISTS `am_projecttemplates_project_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `am_projecttemplates_project_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `am_projecttemplates_project_1am_projecttemplates_ida` varchar(36) DEFAULT NULL,
  `am_projecttemplates_project_1project_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `am_projecttemplates_project_1_ida1` (`am_projecttemplates_project_1am_projecttemplates_ida`),
  KEY `am_projecttemplates_project_1_alt` (`am_projecttemplates_project_1project_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_projecttemplates_project_1_c`
--

LOCK TABLES `am_projecttemplates_project_1_c` WRITE;
/*!40000 ALTER TABLE `am_projecttemplates_project_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `am_projecttemplates_project_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_projecttemplates_users_1_c`
--

DROP TABLE IF EXISTS `am_projecttemplates_users_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `am_projecttemplates_users_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `am_projecttemplates_ida` varchar(36) DEFAULT NULL,
  `users_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `am_projecttemplates_users_1_alt` (`am_projecttemplates_ida`,`users_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_projecttemplates_users_1_c`
--

LOCK TABLES `am_projecttemplates_users_1_c` WRITE;
/*!40000 ALTER TABLE `am_projecttemplates_users_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `am_projecttemplates_users_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_tasktemplates`
--

DROP TABLE IF EXISTS `am_tasktemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `am_tasktemplates` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Not Started',
  `priority` varchar(100) DEFAULT 'High',
  `percent_complete` int(255) DEFAULT 0,
  `predecessors` int(255) DEFAULT NULL,
  `milestone_flag` tinyint(1) DEFAULT 0,
  `relationship_type` varchar(100) DEFAULT 'FS',
  `task_number` int(255) DEFAULT NULL,
  `order_number` int(255) DEFAULT NULL,
  `estimated_effort` int(255) DEFAULT NULL,
  `utilization` varchar(100) DEFAULT '0',
  `duration` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_tasktemplates`
--

LOCK TABLES `am_tasktemplates` WRITE;
/*!40000 ALTER TABLE `am_tasktemplates` DISABLE KEYS */;
/*!40000 ALTER TABLE `am_tasktemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_tasktemplates_am_projecttemplates_c`
--

DROP TABLE IF EXISTS `am_tasktemplates_am_projecttemplates_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `am_tasktemplates_am_projecttemplates_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `am_tasktemplates_am_projecttemplatesam_projecttemplates_ida` varchar(36) DEFAULT NULL,
  `am_tasktemplates_am_projecttemplatesam_tasktemplates_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `am_tasktemplates_am_projecttemplates_ida1` (`am_tasktemplates_am_projecttemplatesam_projecttemplates_ida`),
  KEY `am_tasktemplates_am_projecttemplates_alt` (`am_tasktemplates_am_projecttemplatesam_tasktemplates_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_tasktemplates_am_projecttemplates_c`
--

LOCK TABLES `am_tasktemplates_am_projecttemplates_c` WRITE;
/*!40000 ALTER TABLE `am_tasktemplates_am_projecttemplates_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `am_tasktemplates_am_projecttemplates_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_tasktemplates_audit`
--

DROP TABLE IF EXISTS `am_tasktemplates_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `am_tasktemplates_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_am_tasktemplates_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_tasktemplates_audit`
--

LOCK TABLES `am_tasktemplates_audit` WRITE;
/*!40000 ALTER TABLE `am_tasktemplates_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `am_tasktemplates_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aobh_businesshours`
--

DROP TABLE IF EXISTS `aobh_businesshours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aobh_businesshours` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `opening_hours` varchar(100) DEFAULT '1',
  `closing_hours` varchar(100) DEFAULT '1',
  `open` tinyint(1) DEFAULT NULL,
  `day` varchar(100) DEFAULT 'monday',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aobh_businesshours`
--

LOCK TABLES `aobh_businesshours` WRITE;
/*!40000 ALTER TABLE `aobh_businesshours` DISABLE KEYS */;
/*!40000 ALTER TABLE `aobh_businesshours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aod_index`
--

DROP TABLE IF EXISTS `aod_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aod_index` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `last_optimised` datetime DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aod_index`
--

LOCK TABLES `aod_index` WRITE;
/*!40000 ALTER TABLE `aod_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `aod_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aod_index_audit`
--

DROP TABLE IF EXISTS `aod_index_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aod_index_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aod_index_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aod_index_audit`
--

LOCK TABLES `aod_index_audit` WRITE;
/*!40000 ALTER TABLE `aod_index_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aod_index_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aod_indexevent`
--

DROP TABLE IF EXISTS `aod_indexevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aod_indexevent` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `error` varchar(255) DEFAULT NULL,
  `success` tinyint(1) DEFAULT 0,
  `record_id` char(36) DEFAULT NULL,
  `record_module` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_record_module` (`record_module`),
  KEY `idx_record_id` (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aod_indexevent`
--

LOCK TABLES `aod_indexevent` WRITE;
/*!40000 ALTER TABLE `aod_indexevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `aod_indexevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aod_indexevent_audit`
--

DROP TABLE IF EXISTS `aod_indexevent_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aod_indexevent_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aod_indexevent_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aod_indexevent_audit`
--

LOCK TABLES `aod_indexevent_audit` WRITE;
/*!40000 ALTER TABLE `aod_indexevent_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aod_indexevent_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aok_knowledge_base_categories`
--

DROP TABLE IF EXISTS `aok_knowledge_base_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aok_knowledge_base_categories` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aok_knowledge_base_categories`
--

LOCK TABLES `aok_knowledge_base_categories` WRITE;
/*!40000 ALTER TABLE `aok_knowledge_base_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `aok_knowledge_base_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aok_knowledge_base_categories_audit`
--

DROP TABLE IF EXISTS `aok_knowledge_base_categories_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aok_knowledge_base_categories_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aok_knowledge_base_categories_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aok_knowledge_base_categories_audit`
--

LOCK TABLES `aok_knowledge_base_categories_audit` WRITE;
/*!40000 ALTER TABLE `aok_knowledge_base_categories_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aok_knowledge_base_categories_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aok_knowledgebase`
--

DROP TABLE IF EXISTS `aok_knowledgebase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aok_knowledgebase` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Draft',
  `revision` varchar(255) DEFAULT NULL,
  `additional_info` text DEFAULT NULL,
  `user_id_c` char(36) DEFAULT NULL,
  `user_id1_c` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aok_knowledgebase`
--

LOCK TABLES `aok_knowledgebase` WRITE;
/*!40000 ALTER TABLE `aok_knowledgebase` DISABLE KEYS */;
/*!40000 ALTER TABLE `aok_knowledgebase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aok_knowledgebase_audit`
--

DROP TABLE IF EXISTS `aok_knowledgebase_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aok_knowledgebase_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aok_knowledgebase_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aok_knowledgebase_audit`
--

LOCK TABLES `aok_knowledgebase_audit` WRITE;
/*!40000 ALTER TABLE `aok_knowledgebase_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aok_knowledgebase_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aok_knowledgebase_categories`
--

DROP TABLE IF EXISTS `aok_knowledgebase_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aok_knowledgebase_categories` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `aok_knowledgebase_id` varchar(36) DEFAULT NULL,
  `aok_knowledge_base_categories_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aok_knowledgebase_categories_alt` (`aok_knowledgebase_id`,`aok_knowledge_base_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aok_knowledgebase_categories`
--

LOCK TABLES `aok_knowledgebase_categories` WRITE;
/*!40000 ALTER TABLE `aok_knowledgebase_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `aok_knowledgebase_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aop_case_events`
--

DROP TABLE IF EXISTS `aop_case_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aop_case_events` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `case_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aop_case_events`
--

LOCK TABLES `aop_case_events` WRITE;
/*!40000 ALTER TABLE `aop_case_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `aop_case_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aop_case_events_audit`
--

DROP TABLE IF EXISTS `aop_case_events_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aop_case_events_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aop_case_events_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aop_case_events_audit`
--

LOCK TABLES `aop_case_events_audit` WRITE;
/*!40000 ALTER TABLE `aop_case_events_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aop_case_events_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aop_case_updates`
--

DROP TABLE IF EXISTS `aop_case_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aop_case_updates` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `case_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `internal` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aop_case_updates`
--

LOCK TABLES `aop_case_updates` WRITE;
/*!40000 ALTER TABLE `aop_case_updates` DISABLE KEYS */;
/*!40000 ALTER TABLE `aop_case_updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aop_case_updates_audit`
--

DROP TABLE IF EXISTS `aop_case_updates_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aop_case_updates_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aop_case_updates_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aop_case_updates_audit`
--

LOCK TABLES `aop_case_updates_audit` WRITE;
/*!40000 ALTER TABLE `aop_case_updates_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aop_case_updates_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aor_charts`
--

DROP TABLE IF EXISTS `aor_charts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aor_charts` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `aor_report_id` char(36) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `x_field` int(11) DEFAULT NULL,
  `y_field` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aor_charts`
--

LOCK TABLES `aor_charts` WRITE;
/*!40000 ALTER TABLE `aor_charts` DISABLE KEYS */;
/*!40000 ALTER TABLE `aor_charts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aor_conditions`
--

DROP TABLE IF EXISTS `aor_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aor_conditions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `aor_report_id` char(36) DEFAULT NULL,
  `condition_order` int(255) DEFAULT NULL,
  `logic_op` varchar(255) DEFAULT NULL,
  `parenthesis` varchar(255) DEFAULT NULL,
  `module_path` longtext DEFAULT NULL,
  `field` varchar(100) DEFAULT NULL,
  `operator` varchar(100) DEFAULT NULL,
  `value_type` varchar(100) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `parameter` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aor_conditions_index_report_id` (`aor_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aor_conditions`
--

LOCK TABLES `aor_conditions` WRITE;
/*!40000 ALTER TABLE `aor_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `aor_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aor_fields`
--

DROP TABLE IF EXISTS `aor_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aor_fields` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `aor_report_id` char(36) DEFAULT NULL,
  `field_order` int(255) DEFAULT NULL,
  `module_path` longtext DEFAULT NULL,
  `field` varchar(100) DEFAULT NULL,
  `display` tinyint(1) DEFAULT NULL,
  `link` tinyint(1) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `field_function` varchar(100) DEFAULT NULL,
  `sort_by` varchar(100) DEFAULT NULL,
  `format` varchar(100) DEFAULT NULL,
  `total` varchar(100) DEFAULT NULL,
  `sort_order` varchar(100) DEFAULT NULL,
  `group_by` tinyint(1) DEFAULT NULL,
  `group_order` varchar(100) DEFAULT NULL,
  `group_display` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aor_fields_index_report_id` (`aor_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aor_fields`
--

LOCK TABLES `aor_fields` WRITE;
/*!40000 ALTER TABLE `aor_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `aor_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aor_reports`
--

DROP TABLE IF EXISTS `aor_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aor_reports` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `report_module` varchar(100) DEFAULT NULL,
  `graphs_per_row` int(11) DEFAULT 2,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aor_reports`
--

LOCK TABLES `aor_reports` WRITE;
/*!40000 ALTER TABLE `aor_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `aor_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aor_reports_audit`
--

DROP TABLE IF EXISTS `aor_reports_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aor_reports_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aor_reports_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aor_reports_audit`
--

LOCK TABLES `aor_reports_audit` WRITE;
/*!40000 ALTER TABLE `aor_reports_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aor_reports_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aor_scheduled_reports`
--

DROP TABLE IF EXISTS `aor_scheduled_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aor_scheduled_reports` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `schedule` varchar(100) DEFAULT NULL,
  `last_run` datetime DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `email_recipients` longtext DEFAULT NULL,
  `aor_report_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aor_scheduled_reports`
--

LOCK TABLES `aor_scheduled_reports` WRITE;
/*!40000 ALTER TABLE `aor_scheduled_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `aor_scheduled_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_contracts`
--

DROP TABLE IF EXISTS `aos_contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_contracts` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `reference_code` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `total_contract_value` decimal(26,6) DEFAULT NULL,
  `total_contract_value_usdollar` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Not Started',
  `customer_signed_date` date DEFAULT NULL,
  `company_signed_date` date DEFAULT NULL,
  `renewal_reminder_date` datetime DEFAULT NULL,
  `contract_type` varchar(100) DEFAULT 'Type',
  `contract_account_id` char(36) DEFAULT NULL,
  `opportunity_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `call_id` char(36) DEFAULT NULL,
  `total_amt` decimal(26,6) DEFAULT NULL,
  `total_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `discount_amount` decimal(26,6) DEFAULT NULL,
  `discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `tax_amount` decimal(26,6) DEFAULT NULL,
  `tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_amount` decimal(26,6) DEFAULT NULL,
  `shipping_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_tax` varchar(100) DEFAULT NULL,
  `shipping_tax_amt` decimal(26,6) DEFAULT NULL,
  `shipping_tax_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `total_amount` decimal(26,6) DEFAULT NULL,
  `total_amount_usdollar` decimal(26,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_contracts`
--

LOCK TABLES `aos_contracts` WRITE;
/*!40000 ALTER TABLE `aos_contracts` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_contracts_audit`
--

DROP TABLE IF EXISTS `aos_contracts_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_contracts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aos_contracts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_contracts_audit`
--

LOCK TABLES `aos_contracts_audit` WRITE;
/*!40000 ALTER TABLE `aos_contracts_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_contracts_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_contracts_documents`
--

DROP TABLE IF EXISTS `aos_contracts_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_contracts_documents` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `aos_contracts_id` varchar(36) DEFAULT NULL,
  `documents_id` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_contracts_documents_alt` (`aos_contracts_id`,`documents_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_contracts_documents`
--

LOCK TABLES `aos_contracts_documents` WRITE;
/*!40000 ALTER TABLE `aos_contracts_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_contracts_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_invoices`
--

DROP TABLE IF EXISTS `aos_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_invoices` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `billing_account_id` char(36) DEFAULT NULL,
  `billing_contact_id` char(36) DEFAULT NULL,
  `billing_address_street` varchar(150) DEFAULT NULL,
  `billing_address_city` varchar(100) DEFAULT NULL,
  `billing_address_state` varchar(100) DEFAULT NULL,
  `billing_address_postalcode` varchar(20) DEFAULT NULL,
  `billing_address_country` varchar(255) DEFAULT NULL,
  `shipping_address_street` varchar(150) DEFAULT NULL,
  `shipping_address_city` varchar(100) DEFAULT NULL,
  `shipping_address_state` varchar(100) DEFAULT NULL,
  `shipping_address_postalcode` varchar(20) DEFAULT NULL,
  `shipping_address_country` varchar(255) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `total_amt` decimal(26,6) DEFAULT NULL,
  `total_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `discount_amount` decimal(26,6) DEFAULT NULL,
  `discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `tax_amount` decimal(26,6) DEFAULT NULL,
  `tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_amount` decimal(26,6) DEFAULT NULL,
  `shipping_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_tax` varchar(100) DEFAULT NULL,
  `shipping_tax_amt` decimal(26,6) DEFAULT NULL,
  `shipping_tax_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `total_amount` decimal(26,6) DEFAULT NULL,
  `total_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `quote_number` int(11) DEFAULT NULL,
  `quote_date` date DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `template_ddown_c` text DEFAULT NULL,
  `subtotal_tax_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_invoices`
--

LOCK TABLES `aos_invoices` WRITE;
/*!40000 ALTER TABLE `aos_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_invoices_audit`
--

DROP TABLE IF EXISTS `aos_invoices_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_invoices_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aos_invoices_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_invoices_audit`
--

LOCK TABLES `aos_invoices_audit` WRITE;
/*!40000 ALTER TABLE `aos_invoices_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_invoices_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_line_item_groups`
--

DROP TABLE IF EXISTS `aos_line_item_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_line_item_groups` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `total_amt` decimal(26,6) DEFAULT NULL,
  `total_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `discount_amount` decimal(26,6) DEFAULT NULL,
  `discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `tax_amount` decimal(26,6) DEFAULT NULL,
  `tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_tax_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `total_amount` decimal(26,6) DEFAULT NULL,
  `total_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_line_item_groups`
--

LOCK TABLES `aos_line_item_groups` WRITE;
/*!40000 ALTER TABLE `aos_line_item_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_line_item_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_line_item_groups_audit`
--

DROP TABLE IF EXISTS `aos_line_item_groups_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_line_item_groups_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aos_line_item_groups_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_line_item_groups_audit`
--

LOCK TABLES `aos_line_item_groups_audit` WRITE;
/*!40000 ALTER TABLE `aos_line_item_groups_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_line_item_groups_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_pdf_templates`
--

DROP TABLE IF EXISTS `aos_pdf_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_pdf_templates` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `type` varchar(100) DEFAULT NULL,
  `pdfheader` text DEFAULT NULL,
  `pdffooter` text DEFAULT NULL,
  `margin_left` int(255) DEFAULT 15,
  `margin_right` int(255) DEFAULT 15,
  `margin_top` int(255) DEFAULT 16,
  `margin_bottom` int(255) DEFAULT 16,
  `margin_header` int(255) DEFAULT 9,
  `margin_footer` int(255) DEFAULT 9,
  `page_size` varchar(100) DEFAULT NULL,
  `orientation` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_pdf_templates`
--

LOCK TABLES `aos_pdf_templates` WRITE;
/*!40000 ALTER TABLE `aos_pdf_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_pdf_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_pdf_templates_audit`
--

DROP TABLE IF EXISTS `aos_pdf_templates_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_pdf_templates_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aos_pdf_templates_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_pdf_templates_audit`
--

LOCK TABLES `aos_pdf_templates_audit` WRITE;
/*!40000 ALTER TABLE `aos_pdf_templates_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_pdf_templates_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_product_categories`
--

DROP TABLE IF EXISTS `aos_product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_product_categories` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `is_parent` tinyint(1) DEFAULT 0,
  `parent_category_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_product_categories`
--

LOCK TABLES `aos_product_categories` WRITE;
/*!40000 ALTER TABLE `aos_product_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_product_categories_audit`
--

DROP TABLE IF EXISTS `aos_product_categories_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_product_categories_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aos_product_categories_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_product_categories_audit`
--

LOCK TABLES `aos_product_categories_audit` WRITE;
/*!40000 ALTER TABLE `aos_product_categories_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_product_categories_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_products`
--

DROP TABLE IF EXISTS `aos_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_products` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `maincode` varchar(100) DEFAULT 'XXXX',
  `part_number` varchar(25) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT 'Good',
  `cost` decimal(26,6) DEFAULT NULL,
  `cost_usdollar` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `price` decimal(26,6) DEFAULT NULL,
  `price_usdollar` decimal(26,6) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `aos_product_category_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_products`
--

LOCK TABLES `aos_products` WRITE;
/*!40000 ALTER TABLE `aos_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_products_audit`
--

DROP TABLE IF EXISTS `aos_products_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_products_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aos_products_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_products_audit`
--

LOCK TABLES `aos_products_audit` WRITE;
/*!40000 ALTER TABLE `aos_products_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_products_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_products_quotes`
--

DROP TABLE IF EXISTS `aos_products_quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_products_quotes` (
  `id` char(36) NOT NULL,
  `name` text DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `part_number` varchar(255) DEFAULT NULL,
  `item_description` text DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `product_qty` decimal(18,4) DEFAULT NULL,
  `product_cost_price` decimal(26,6) DEFAULT NULL,
  `product_cost_price_usdollar` decimal(26,6) DEFAULT NULL,
  `product_list_price` decimal(26,6) DEFAULT NULL,
  `product_list_price_usdollar` decimal(26,6) DEFAULT NULL,
  `product_discount` decimal(26,6) DEFAULT NULL,
  `product_discount_usdollar` decimal(26,6) DEFAULT NULL,
  `product_discount_amount` decimal(26,6) DEFAULT NULL,
  `product_discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `discount` varchar(255) DEFAULT 'Percentage',
  `product_unit_price` decimal(26,6) DEFAULT NULL,
  `product_unit_price_usdollar` decimal(26,6) DEFAULT NULL,
  `vat_amt` decimal(26,6) DEFAULT NULL,
  `vat_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `product_total_price` decimal(26,6) DEFAULT NULL,
  `product_total_price_usdollar` decimal(26,6) DEFAULT NULL,
  `vat` varchar(100) DEFAULT '5.0',
  `parent_type` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `product_id` char(36) DEFAULT NULL,
  `group_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aospq_par_del` (`parent_id`,`parent_type`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_products_quotes`
--

LOCK TABLES `aos_products_quotes` WRITE;
/*!40000 ALTER TABLE `aos_products_quotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_products_quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_products_quotes_audit`
--

DROP TABLE IF EXISTS `aos_products_quotes_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_products_quotes_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aos_products_quotes_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_products_quotes_audit`
--

LOCK TABLES `aos_products_quotes_audit` WRITE;
/*!40000 ALTER TABLE `aos_products_quotes_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_products_quotes_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_quotes`
--

DROP TABLE IF EXISTS `aos_quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_quotes` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `approval_issue` text DEFAULT NULL,
  `billing_account_id` char(36) DEFAULT NULL,
  `billing_contact_id` char(36) DEFAULT NULL,
  `billing_address_street` varchar(150) DEFAULT NULL,
  `billing_address_city` varchar(100) DEFAULT NULL,
  `billing_address_state` varchar(100) DEFAULT NULL,
  `billing_address_postalcode` varchar(20) DEFAULT NULL,
  `billing_address_country` varchar(255) DEFAULT NULL,
  `shipping_address_street` varchar(150) DEFAULT NULL,
  `shipping_address_city` varchar(100) DEFAULT NULL,
  `shipping_address_state` varchar(100) DEFAULT NULL,
  `shipping_address_postalcode` varchar(20) DEFAULT NULL,
  `shipping_address_country` varchar(255) DEFAULT NULL,
  `expiration` date DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `opportunity_id` char(36) DEFAULT NULL,
  `template_ddown_c` text DEFAULT NULL,
  `total_amt` decimal(26,6) DEFAULT NULL,
  `total_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `discount_amount` decimal(26,6) DEFAULT NULL,
  `discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `tax_amount` decimal(26,6) DEFAULT NULL,
  `tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_amount` decimal(26,6) DEFAULT NULL,
  `shipping_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_tax` varchar(100) DEFAULT NULL,
  `shipping_tax_amt` decimal(26,6) DEFAULT NULL,
  `shipping_tax_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `total_amount` decimal(26,6) DEFAULT NULL,
  `total_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `stage` varchar(100) DEFAULT 'Draft',
  `term` varchar(100) DEFAULT NULL,
  `terms_c` text DEFAULT NULL,
  `approval_status` varchar(100) DEFAULT NULL,
  `invoice_status` varchar(100) DEFAULT 'Not Invoiced',
  `subtotal_tax_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_quotes`
--

LOCK TABLES `aos_quotes` WRITE;
/*!40000 ALTER TABLE `aos_quotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_quotes_aos_invoices_c`
--

DROP TABLE IF EXISTS `aos_quotes_aos_invoices_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_quotes_aos_invoices_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `aos_quotes77d9_quotes_ida` varchar(36) DEFAULT NULL,
  `aos_quotes6b83nvoices_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_quotes_aos_invoices_alt` (`aos_quotes77d9_quotes_ida`,`aos_quotes6b83nvoices_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_quotes_aos_invoices_c`
--

LOCK TABLES `aos_quotes_aos_invoices_c` WRITE;
/*!40000 ALTER TABLE `aos_quotes_aos_invoices_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_quotes_aos_invoices_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_quotes_audit`
--

DROP TABLE IF EXISTS `aos_quotes_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_quotes_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aos_quotes_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_quotes_audit`
--

LOCK TABLES `aos_quotes_audit` WRITE;
/*!40000 ALTER TABLE `aos_quotes_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_quotes_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_quotes_os_contracts_c`
--

DROP TABLE IF EXISTS `aos_quotes_os_contracts_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_quotes_os_contracts_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `aos_quotese81e_quotes_ida` varchar(36) DEFAULT NULL,
  `aos_quotes4dc0ntracts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_quotes_aos_contracts_alt` (`aos_quotese81e_quotes_ida`,`aos_quotes4dc0ntracts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_quotes_os_contracts_c`
--

LOCK TABLES `aos_quotes_os_contracts_c` WRITE;
/*!40000 ALTER TABLE `aos_quotes_os_contracts_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_quotes_os_contracts_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_quotes_project_c`
--

DROP TABLE IF EXISTS `aos_quotes_project_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_quotes_project_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `aos_quotes1112_quotes_ida` varchar(36) DEFAULT NULL,
  `aos_quotes7207project_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_quotes_project_alt` (`aos_quotes1112_quotes_ida`,`aos_quotes7207project_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_quotes_project_c`
--

LOCK TABLES `aos_quotes_project_c` WRITE;
/*!40000 ALTER TABLE `aos_quotes_project_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_quotes_project_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aow_actions`
--

DROP TABLE IF EXISTS `aow_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aow_actions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `aow_workflow_id` char(36) DEFAULT NULL,
  `action_order` int(255) DEFAULT NULL,
  `action` varchar(100) DEFAULT NULL,
  `parameters` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aow_action_index_workflow_id` (`aow_workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aow_actions`
--

LOCK TABLES `aow_actions` WRITE;
/*!40000 ALTER TABLE `aow_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `aow_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aow_conditions`
--

DROP TABLE IF EXISTS `aow_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aow_conditions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `aow_workflow_id` char(36) DEFAULT NULL,
  `condition_order` int(255) DEFAULT NULL,
  `module_path` longtext DEFAULT NULL,
  `field` varchar(100) DEFAULT NULL,
  `operator` varchar(100) DEFAULT NULL,
  `value_type` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aow_conditions_index_workflow_id` (`aow_workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aow_conditions`
--

LOCK TABLES `aow_conditions` WRITE;
/*!40000 ALTER TABLE `aow_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `aow_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aow_processed`
--

DROP TABLE IF EXISTS `aow_processed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aow_processed` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `aow_workflow_id` char(36) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Pending',
  PRIMARY KEY (`id`),
  KEY `aow_processed_index_workflow` (`aow_workflow_id`,`status`,`parent_id`,`deleted`),
  KEY `aow_processed_index_status` (`status`),
  KEY `aow_processed_index_workflow_id` (`aow_workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aow_processed`
--

LOCK TABLES `aow_processed` WRITE;
/*!40000 ALTER TABLE `aow_processed` DISABLE KEYS */;
/*!40000 ALTER TABLE `aow_processed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aow_processed_aow_actions`
--

DROP TABLE IF EXISTS `aow_processed_aow_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aow_processed_aow_actions` (
  `id` varchar(36) NOT NULL,
  `aow_processed_id` varchar(36) DEFAULT NULL,
  `aow_action_id` varchar(36) DEFAULT NULL,
  `status` varchar(36) DEFAULT 'Pending',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_aow_processed_aow_actions` (`aow_processed_id`,`aow_action_id`),
  KEY `idx_actid_del_freid` (`aow_action_id`,`deleted`,`aow_processed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aow_processed_aow_actions`
--

LOCK TABLES `aow_processed_aow_actions` WRITE;
/*!40000 ALTER TABLE `aow_processed_aow_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `aow_processed_aow_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aow_workflow`
--

DROP TABLE IF EXISTS `aow_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aow_workflow` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `flow_module` varchar(100) DEFAULT NULL,
  `flow_run_on` varchar(100) DEFAULT '0',
  `status` varchar(100) DEFAULT 'Active',
  `run_when` varchar(100) DEFAULT 'Always',
  `multiple_runs` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `aow_workflow_index_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aow_workflow`
--

LOCK TABLES `aow_workflow` WRITE;
/*!40000 ALTER TABLE `aow_workflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `aow_workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aow_workflow_audit`
--

DROP TABLE IF EXISTS `aow_workflow_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aow_workflow_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aow_workflow_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aow_workflow_audit`
--

LOCK TABLES `aow_workflow_audit` WRITE;
/*!40000 ALTER TABLE `aow_workflow_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aow_workflow_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugs`
--

DROP TABLE IF EXISTS `bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bugs` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `bug_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` varchar(255) DEFAULT NULL,
  `work_log` text DEFAULT NULL,
  `found_in_release` varchar(255) DEFAULT NULL,
  `fixed_in_release` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `product_category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bugsnumk` (`bug_number`),
  KEY `bug_number` (`bug_number`),
  KEY `idx_bug_name` (`name`),
  KEY `idx_bugs_assigned_user` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugs`
--

LOCK TABLES `bugs` WRITE;
/*!40000 ALTER TABLE `bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugs_audit`
--

DROP TABLE IF EXISTS `bugs_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bugs_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_bugs_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugs_audit`
--

LOCK TABLES `bugs_audit` WRITE;
/*!40000 ALTER TABLE `bugs_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `bugs_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls`
--

DROP TABLE IF EXISTS `calls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `duration_hours` int(2) DEFAULT NULL,
  `duration_minutes` int(2) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Planned',
  `direction` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `reminder_time` int(11) DEFAULT -1,
  `email_reminder_time` int(11) DEFAULT -1,
  `email_reminder_sent` tinyint(1) DEFAULT 0,
  `outlook_id` varchar(255) DEFAULT NULL,
  `repeat_type` varchar(36) DEFAULT NULL,
  `repeat_interval` int(3) DEFAULT 1,
  `repeat_dow` varchar(7) DEFAULT NULL,
  `repeat_until` date DEFAULT NULL,
  `repeat_count` int(7) DEFAULT NULL,
  `repeat_parent_id` char(36) DEFAULT NULL,
  `recurring_source` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_call_name` (`name`),
  KEY `idx_status` (`status`),
  KEY `idx_calls_date_start` (`date_start`),
  KEY `idx_calls_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_calls_assigned_del` (`deleted`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls`
--

LOCK TABLES `calls` WRITE;
/*!40000 ALTER TABLE `calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls_contacts`
--

DROP TABLE IF EXISTS `calls_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls_contacts` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_con_call_call` (`call_id`),
  KEY `idx_con_call_con` (`contact_id`),
  KEY `idx_call_contact` (`call_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls_contacts`
--

LOCK TABLES `calls_contacts` WRITE;
/*!40000 ALTER TABLE `calls_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls_leads`
--

DROP TABLE IF EXISTS `calls_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls_leads` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `lead_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_lead_call_call` (`call_id`),
  KEY `idx_lead_call_lead` (`lead_id`),
  KEY `idx_call_lead` (`call_id`,`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls_leads`
--

LOCK TABLES `calls_leads` WRITE;
/*!40000 ALTER TABLE `calls_leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls_leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls_reschedule`
--

DROP TABLE IF EXISTS `calls_reschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls_reschedule` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `call_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls_reschedule`
--

LOCK TABLES `calls_reschedule` WRITE;
/*!40000 ALTER TABLE `calls_reschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls_reschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls_reschedule_audit`
--

DROP TABLE IF EXISTS `calls_reschedule_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls_reschedule_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_calls_reschedule_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls_reschedule_audit`
--

LOCK TABLES `calls_reschedule_audit` WRITE;
/*!40000 ALTER TABLE `calls_reschedule_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls_reschedule_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls_users`
--

DROP TABLE IF EXISTS `calls_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls_users` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_usr_call_call` (`call_id`),
  KEY `idx_usr_call_usr` (`user_id`),
  KEY `idx_call_users` (`call_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls_users`
--

LOCK TABLES `calls_users` WRITE;
/*!40000 ALTER TABLE `calls_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_log`
--

DROP TABLE IF EXISTS `campaign_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_log` (
  `id` char(36) NOT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `target_tracker_key` varchar(36) DEFAULT NULL,
  `target_id` varchar(36) DEFAULT NULL,
  `target_type` varchar(100) DEFAULT NULL,
  `activity_type` varchar(100) DEFAULT NULL,
  `activity_date` datetime DEFAULT NULL,
  `related_id` varchar(36) DEFAULT NULL,
  `related_type` varchar(100) DEFAULT NULL,
  `archived` tinyint(1) DEFAULT 0,
  `hits` int(11) DEFAULT 0,
  `list_id` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `more_information` varchar(100) DEFAULT NULL,
  `marketing_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_camp_tracker` (`target_tracker_key`),
  KEY `idx_camp_campaign_id` (`campaign_id`),
  KEY `idx_camp_more_info` (`more_information`),
  KEY `idx_target_id` (`target_id`),
  KEY `idx_target_id_deleted` (`target_id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_log`
--

LOCK TABLES `campaign_log` WRITE;
/*!40000 ALTER TABLE `campaign_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_trkrs`
--

DROP TABLE IF EXISTS `campaign_trkrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_trkrs` (
  `id` char(36) NOT NULL,
  `tracker_name` varchar(255) DEFAULT NULL,
  `tracker_url` varchar(255) DEFAULT 'http://',
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` char(36) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `is_optout` tinyint(1) DEFAULT 0,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `campaign_tracker_key_idx` (`tracker_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_trkrs`
--

LOCK TABLES `campaign_trkrs` WRITE;
/*!40000 ALTER TABLE `campaign_trkrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_trkrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigns`
--

DROP TABLE IF EXISTS `campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaigns` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_count` int(11) DEFAULT 0,
  `refer_url` varchar(255) DEFAULT 'http://',
  `tracker_text` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `impressions` int(11) DEFAULT 0,
  `currency_id` char(36) DEFAULT NULL,
  `budget` double DEFAULT NULL,
  `expected_cost` double DEFAULT NULL,
  `actual_cost` double DEFAULT NULL,
  `expected_revenue` double DEFAULT NULL,
  `campaign_type` varchar(100) DEFAULT NULL,
  `objective` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `frequency` varchar(100) DEFAULT NULL,
  `survey_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `camp_auto_tracker_key` (`tracker_key`),
  KEY `idx_campaign_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns`
--

LOCK TABLES `campaigns` WRITE;
/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigns_audit`
--

DROP TABLE IF EXISTS `campaigns_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaigns_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_campaigns_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns_audit`
--

LOCK TABLES `campaigns_audit` WRITE;
/*!40000 ALTER TABLE `campaigns_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaigns_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases`
--

DROP TABLE IF EXISTS `cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cases` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `case_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` text DEFAULT NULL,
  `work_log` text DEFAULT NULL,
  `account_id` char(36) DEFAULT NULL,
  `state` varchar(100) DEFAULT 'Open',
  `contact_created_by_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `casesnumk` (`case_number`),
  KEY `case_number` (`case_number`),
  KEY `idx_case_name` (`name`),
  KEY `idx_account_id` (`account_id`),
  KEY `idx_cases_stat_del` (`assigned_user_id`,`status`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases`
--

LOCK TABLES `cases` WRITE;
/*!40000 ALTER TABLE `cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases_audit`
--

DROP TABLE IF EXISTS `cases_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cases_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cases_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases_audit`
--

LOCK TABLES `cases_audit` WRITE;
/*!40000 ALTER TABLE `cases_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `cases_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases_bugs`
--

DROP TABLE IF EXISTS `cases_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cases_bugs` (
  `id` varchar(36) NOT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_cas_bug_cas` (`case_id`),
  KEY `idx_cas_bug_bug` (`bug_id`),
  KEY `idx_case_bug` (`case_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases_bugs`
--

LOCK TABLES `cases_bugs` WRITE;
/*!40000 ALTER TABLE `cases_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cases_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases_cstm`
--

DROP TABLE IF EXISTS `cases_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cases_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT 0.00000000,
  `jjwg_maps_lat_c` float(10,8) DEFAULT 0.00000000,
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases_cstm`
--

LOCK TABLES `cases_cstm` WRITE;
/*!40000 ALTER TABLE `cases_cstm` DISABLE KEYS */;
/*!40000 ALTER TABLE `cases_cstm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `category` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `value` text DEFAULT NULL,
  KEY `idx_config_cat` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES ('notify','fromaddress','do_not_reply@example.com'),('notify','fromname','SuiteCRM'),('notify','send_by_default','1'),('notify','on','1'),('notify','send_from_assigning_user','0'),('info','sugar_version','6.5.25'),('MySettings','tab','YTozODp7aTowO3M6NDoiSG9tZSI7aToxO3M6ODoiQWNjb3VudHMiO2k6MjtzOjg6IkNvbnRhY3RzIjtpOjM7czoxMzoiT3Bwb3J0dW5pdGllcyI7aTo0O3M6NToiTGVhZHMiO2k6NTtzOjEwOiJBT1NfUXVvdGVzIjtpOjY7czo4OiJDYWxlbmRhciI7aTo3O3M6OToiRG9jdW1lbnRzIjtpOjg7czo2OiJFbWFpbHMiO2k6OTtzOjU6IlNwb3RzIjtpOjEwO3M6OToiQ2FtcGFpZ25zIjtpOjExO3M6NToiQ2FsbHMiO2k6MTI7czo4OiJNZWV0aW5ncyI7aToxMztzOjU6IlRhc2tzIjtpOjE0O3M6NToiTm90ZXMiO2k6MTU7czoxMjoiQU9TX0ludm9pY2VzIjtpOjE2O3M6MTM6IkFPU19Db250cmFjdHMiO2k6MTc7czo1OiJDYXNlcyI7aToxODtzOjk6IlByb3NwZWN0cyI7aToxOTtzOjEzOiJQcm9zcGVjdExpc3RzIjtpOjIwO3M6NzoiUHJvamVjdCI7aToyMTtzOjE5OiJBTV9Qcm9qZWN0VGVtcGxhdGVzIjtpOjIyO3M6MTY6IkFNX1Rhc2tUZW1wbGF0ZXMiO2k6MjM7czo5OiJGUF9ldmVudHMiO2k6MjQ7czoxODoiRlBfRXZlbnRfTG9jYXRpb25zIjtpOjI1O3M6MTI6IkFPU19Qcm9kdWN0cyI7aToyNjtzOjIyOiJBT1NfUHJvZHVjdF9DYXRlZ29yaWVzIjtpOjI3O3M6MTc6IkFPU19QREZfVGVtcGxhdGVzIjtpOjI4O3M6OToiamp3Z19NYXBzIjtpOjI5O3M6MTI6Impqd2dfTWFya2VycyI7aTozMDtzOjEwOiJqandnX0FyZWFzIjtpOjMxO3M6MTg6Impqd2dfQWRkcmVzc19DYWNoZSI7aTozMjtzOjExOiJBT1JfUmVwb3J0cyI7aTozMztzOjEyOiJBT1dfV29ya0Zsb3ciO2k6MzQ7czoxNzoiQU9LX0tub3dsZWRnZUJhc2UiO2k6MzU7czoyOToiQU9LX0tub3dsZWRnZV9CYXNlX0NhdGVnb3JpZXMiO2k6MzY7czoxNDoiRW1haWxUZW1wbGF0ZXMiO2k6Mzc7czo3OiJTdXJ2ZXlzIjt9'),('portal','on','0'),('tracker','Tracker','1'),('system','skypeout_on','1'),('sugarfeed','enabled','1'),('sugarfeed','module_UserFeed','1'),('sugarfeed','module_Contacts','1'),('sugarfeed','module_Opportunities','1'),('sugarfeed','module_Cases','1'),('sugarfeed','module_Leads','1'),('Update','CheckUpdates','manual'),('system','name','SuiteCRM'),('system','adminwizard','1');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT 0,
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `lawful_basis` text DEFAULT NULL,
  `date_reviewed` date DEFAULT NULL,
  `lawful_basis_source` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `lead_source` varchar(255) DEFAULT NULL,
  `reports_to_id` char(36) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `joomla_account_id` varchar(255) DEFAULT NULL,
  `portal_account_disabled` tinyint(1) DEFAULT NULL,
  `portal_user_type` varchar(100) DEFAULT 'Single',
  PRIMARY KEY (`id`),
  KEY `idx_cont_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_contacts_del_last` (`deleted`,`last_name`),
  KEY `idx_cont_del_reports` (`deleted`,`reports_to_id`,`last_name`),
  KEY `idx_reports_to_id` (`reports_to_id`),
  KEY `idx_del_id_user` (`deleted`,`id`,`assigned_user_id`),
  KEY `idx_cont_assigned` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_audit`
--

DROP TABLE IF EXISTS `contacts_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_contacts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_audit`
--

LOCK TABLES `contacts_audit` WRITE;
/*!40000 ALTER TABLE `contacts_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_bugs`
--

DROP TABLE IF EXISTS `contacts_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_bugs` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_con_bug_con` (`contact_id`),
  KEY `idx_con_bug_bug` (`bug_id`),
  KEY `idx_contact_bug` (`contact_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_bugs`
--

LOCK TABLES `contacts_bugs` WRITE;
/*!40000 ALTER TABLE `contacts_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_cases`
--

DROP TABLE IF EXISTS `contacts_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_cases` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_con_case_con` (`contact_id`),
  KEY `idx_con_case_case` (`case_id`),
  KEY `idx_contacts_cases` (`contact_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_cases`
--

LOCK TABLES `contacts_cases` WRITE;
/*!40000 ALTER TABLE `contacts_cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_cstm`
--

DROP TABLE IF EXISTS `contacts_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT 0.00000000,
  `jjwg_maps_lat_c` float(10,8) DEFAULT 0.00000000,
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_cstm`
--

LOCK TABLES `contacts_cstm` WRITE;
/*!40000 ALTER TABLE `contacts_cstm` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_cstm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_users`
--

DROP TABLE IF EXISTS `contacts_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_users` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_con_users_con` (`contact_id`),
  KEY `idx_con_users_user` (`user_id`),
  KEY `idx_contacts_users` (`contact_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_users`
--

LOCK TABLES `contacts_users` WRITE;
/*!40000 ALTER TABLE `contacts_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cron_remove_documents`
--

DROP TABLE IF EXISTS `cron_remove_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cron_remove_documents` (
  `id` varchar(36) NOT NULL,
  `bean_id` varchar(36) DEFAULT NULL,
  `module` varchar(25) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cron_remove_document_bean_id` (`bean_id`),
  KEY `idx_cron_remove_document_stamp` (`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cron_remove_documents`
--

LOCK TABLES `cron_remove_documents` WRITE;
/*!40000 ALTER TABLE `cron_remove_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `cron_remove_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` char(36) NOT NULL,
  `name` varchar(36) DEFAULT NULL,
  `symbol` varchar(36) DEFAULT NULL,
  `iso4217` varchar(3) DEFAULT NULL,
  `conversion_rate` double DEFAULT 0,
  `status` varchar(100) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `created_by` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_currency_name` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields` (
  `bean_id` varchar(36) DEFAULT NULL,
  `set_num` int(11) DEFAULT 0,
  `field0` varchar(255) DEFAULT NULL,
  `field1` varchar(255) DEFAULT NULL,
  `field2` varchar(255) DEFAULT NULL,
  `field3` varchar(255) DEFAULT NULL,
  `field4` varchar(255) DEFAULT NULL,
  `field5` varchar(255) DEFAULT NULL,
  `field6` varchar(255) DEFAULT NULL,
  `field7` varchar(255) DEFAULT NULL,
  `field8` varchar(255) DEFAULT NULL,
  `field9` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  KEY `idx_beanid_set_num` (`bean_id`,`set_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_revisions`
--

DROP TABLE IF EXISTS `document_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_revisions` (
  `id` varchar(36) NOT NULL,
  `change_log` varchar(255) DEFAULT NULL,
  `document_id` varchar(36) DEFAULT NULL,
  `doc_id` varchar(100) DEFAULT NULL,
  `doc_type` varchar(100) DEFAULT NULL,
  `doc_url` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `file_ext` varchar(100) DEFAULT NULL,
  `file_mime_type` varchar(100) DEFAULT NULL,
  `revision` varchar(100) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documentrevision_mimetype` (`file_mime_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_revisions`
--

LOCK TABLES `document_revisions` WRITE;
/*!40000 ALTER TABLE `document_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `document_name` varchar(255) DEFAULT NULL,
  `doc_id` varchar(100) DEFAULT NULL,
  `doc_type` varchar(100) DEFAULT 'Sugar',
  `doc_url` varchar(255) DEFAULT NULL,
  `active_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `category_id` varchar(100) DEFAULT NULL,
  `subcategory_id` varchar(100) DEFAULT NULL,
  `status_id` varchar(100) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  `related_doc_id` char(36) DEFAULT NULL,
  `related_doc_rev_id` char(36) DEFAULT NULL,
  `is_template` tinyint(1) DEFAULT 0,
  `template_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_doc_cat` (`category_id`,`subcategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_accounts`
--

DROP TABLE IF EXISTS `documents_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_accounts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `document_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_accounts_account_id` (`account_id`,`document_id`),
  KEY `documents_accounts_document_id` (`document_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_accounts`
--

LOCK TABLES `documents_accounts` WRITE;
/*!40000 ALTER TABLE `documents_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_bugs`
--

DROP TABLE IF EXISTS `documents_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_bugs` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `document_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_bugs_bug_id` (`bug_id`,`document_id`),
  KEY `documents_bugs_document_id` (`document_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_bugs`
--

LOCK TABLES `documents_bugs` WRITE;
/*!40000 ALTER TABLE `documents_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_cases`
--

DROP TABLE IF EXISTS `documents_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_cases` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `document_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_cases_case_id` (`case_id`,`document_id`),
  KEY `documents_cases_document_id` (`document_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_cases`
--

LOCK TABLES `documents_cases` WRITE;
/*!40000 ALTER TABLE `documents_cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_contacts`
--

DROP TABLE IF EXISTS `documents_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_contacts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `document_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_contacts_contact_id` (`contact_id`,`document_id`),
  KEY `documents_contacts_document_id` (`document_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_contacts`
--

LOCK TABLES `documents_contacts` WRITE;
/*!40000 ALTER TABLE `documents_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_opportunities`
--

DROP TABLE IF EXISTS `documents_opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_opportunities` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `document_id` varchar(36) DEFAULT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_docu_opps_oppo_id` (`opportunity_id`,`document_id`),
  KEY `idx_docu_oppo_docu_id` (`document_id`,`opportunity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_opportunities`
--

LOCK TABLES `documents_opportunities` WRITE;
/*!40000 ALTER TABLE `documents_opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eapm`
--

DROP TABLE IF EXISTS `eapm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eapm` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `application` varchar(100) DEFAULT 'webex',
  `api_data` text DEFAULT NULL,
  `consumer_key` varchar(255) DEFAULT NULL,
  `consumer_secret` varchar(255) DEFAULT NULL,
  `oauth_token` varchar(255) DEFAULT NULL,
  `oauth_secret` varchar(255) DEFAULT NULL,
  `validated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_app_active` (`assigned_user_id`,`application`,`validated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eapm`
--

LOCK TABLES `eapm` WRITE;
/*!40000 ALTER TABLE `eapm` DISABLE KEYS */;
/*!40000 ALTER TABLE `eapm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_addr_bean_rel`
--

DROP TABLE IF EXISTS `email_addr_bean_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_addr_bean_rel` (
  `id` char(36) NOT NULL,
  `email_address_id` char(36) NOT NULL,
  `bean_id` char(36) NOT NULL,
  `bean_module` varchar(100) DEFAULT NULL,
  `primary_address` tinyint(1) DEFAULT 0,
  `reply_to_address` tinyint(1) DEFAULT 0,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_email_address_id` (`email_address_id`),
  KEY `idx_bean_id` (`bean_id`,`bean_module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_addr_bean_rel`
--

LOCK TABLES `email_addr_bean_rel` WRITE;
/*!40000 ALTER TABLE `email_addr_bean_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_addr_bean_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_addresses`
--

DROP TABLE IF EXISTS `email_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_addresses` (
  `id` char(36) NOT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `email_address_caps` varchar(255) DEFAULT NULL,
  `invalid_email` tinyint(1) DEFAULT 0,
  `opt_out` tinyint(1) DEFAULT 0,
  `confirm_opt_in` varchar(255) DEFAULT 'not-opt-in',
  `confirm_opt_in_date` datetime DEFAULT NULL,
  `confirm_opt_in_sent_date` datetime DEFAULT NULL,
  `confirm_opt_in_fail_date` datetime DEFAULT NULL,
  `confirm_opt_in_token` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_ea_caps_opt_out_invalid` (`email_address_caps`,`opt_out`,`invalid_email`),
  KEY `idx_ea_opt_out_invalid` (`email_address`,`opt_out`,`invalid_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_addresses`
--

LOCK TABLES `email_addresses` WRITE;
/*!40000 ALTER TABLE `email_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_addresses_audit`
--

DROP TABLE IF EXISTS `email_addresses_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_addresses_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_email_addresses_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_addresses_audit`
--

LOCK TABLES `email_addresses_audit` WRITE;
/*!40000 ALTER TABLE `email_addresses_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_addresses_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_cache`
--

DROP TABLE IF EXISTS `email_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_cache` (
  `ie_id` char(36) DEFAULT NULL,
  `mbox` varchar(60) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `fromaddr` varchar(100) DEFAULT NULL,
  `toaddr` varchar(255) DEFAULT NULL,
  `senddate` datetime DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `mailsize` int(10) unsigned DEFAULT NULL,
  `imap_uid` int(10) unsigned DEFAULT NULL,
  `msgno` int(10) unsigned DEFAULT NULL,
  `recent` tinyint(4) DEFAULT NULL,
  `flagged` tinyint(4) DEFAULT NULL,
  `answered` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `seen` tinyint(4) DEFAULT NULL,
  `draft` tinyint(4) DEFAULT NULL,
  KEY `idx_ie_id` (`ie_id`),
  KEY `idx_mail_date` (`ie_id`,`mbox`,`senddate`),
  KEY `idx_mail_from` (`ie_id`,`mbox`,`fromaddr`),
  KEY `idx_mail_subj` (`subject`),
  KEY `idx_mail_to` (`toaddr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_cache`
--

LOCK TABLES `email_cache` WRITE;
/*!40000 ALTER TABLE `email_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_marketing`
--

DROP TABLE IF EXISTS `email_marketing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_marketing` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `from_name` varchar(100) DEFAULT NULL,
  `from_addr` varchar(100) DEFAULT NULL,
  `reply_to_name` varchar(100) DEFAULT NULL,
  `reply_to_addr` varchar(100) DEFAULT NULL,
  `inbound_email_id` varchar(36) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `template_id` char(36) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `outbound_email_id` char(36) DEFAULT NULL,
  `all_prospect_lists` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_emmkt_name` (`name`),
  KEY `idx_emmkit_del` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_marketing`
--

LOCK TABLES `email_marketing` WRITE;
/*!40000 ALTER TABLE `email_marketing` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_marketing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_marketing_prospect_lists`
--

DROP TABLE IF EXISTS `email_marketing_prospect_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_marketing_prospect_lists` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `email_marketing_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `email_mp_prospects` (`email_marketing_id`,`prospect_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_marketing_prospect_lists`
--

LOCK TABLES `email_marketing_prospect_lists` WRITE;
/*!40000 ALTER TABLE `email_marketing_prospect_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_marketing_prospect_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `published` varchar(3) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` longtext DEFAULT NULL,
  `body_html` longtext DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `text_only` tinyint(1) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_email_template_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
INSERT INTO `email_templates` VALUES ('202143b0-f060-6235-720a-5d4dc0e4492a','2019-08-09 18:51:09','2019-08-09 18:51:09','1','1','off','User Case Update','Email template to send to a Sugar user when their case is updated.','$acase_name (# $acase_case_number) update','Hi $user_first_name $user_last_name,\n\n					   You\'ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:\n					       $contact_first_name $contact_last_name, said:\n					               $aop_case_updates_description\n                        You may review this Case at:\n                            $sugarurl/index.php?module=Cases&action=DetailView&record=$acase_id;','<p>Hi $user_first_name $user_last_name,</p>\n					     <p> </p>\n					     <p>You\'ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:</p>\n					     <p><strong>$contact_first_name $contact_last_name, said:</strong></p>\n					     <p style=\"padding-left:30px;\">$aop_case_updates_description</p>\n					     <p>You may review this Case at: $sugarurl/index.php?module=Cases&action=DetailView&record=$acase_id;</p>',0,NULL,NULL,'system'),('3a2d7d1c-a73d-c1e8-e054-5d4dc0f8c9b5','2019-08-09 18:51:09','2019-08-09 18:51:09','1','1','off','Confirmed Opt In','Email template to send to a contact to confirm they have opted in.','Confirm Opt In','Hi $contact_first_name $contact_last_name, \\n Please confirm that you have opted in by selecting the following link: $sugarurl/index.php?entryPoint=ConfirmOptIn&from=$emailaddress_email_address','<p>Hi $contact_first_name $contact_last_name,</p>\n             <p>\n                Please confirm that you have opted in by selecting the following link:\n                <a href=\"$sugarurl/index.php?entryPoint=ConfirmOptIn&from=$emailaddress_confirm_opt_in_token\">Opt In</a>\n             </p>',0,NULL,NULL,'system'),('3f76f376-332e-6f71-c846-5d4dc0ab59e2','2013-05-24 14:31:45','2019-08-09 18:51:09','1','1','off','Event Invite Template','Default event invite template.','You have been invited to $fp_events_name','Dear $contact_name,\nYou have been invited to $fp_events_name on $fp_events_date_start to $fp_events_date_end\n$fp_events_description\nYours Sincerely,\n','\n<p>Dear $contact_name,</p>\n<p>You have been invited to $fp_events_name on $fp_events_date_start to $fp_events_date_end</p>\n<p>$fp_events_description</p>\n<p>If you would like to accept this invititation please click accept.</p>\n<p> $fp_events_link or $fp_events_link_declined</p>\n<p>Yours Sincerely,</p>\n',0,NULL,NULL,'system'),('8a69057f-5517-57f6-0e31-5d4dc0a85643','2019-08-09 18:51:09','2019-08-09 18:51:09','1','1','off','Two Factor Authentication email','This template is used to send a user a code for Two Factor Authentication.','Two Factor Authentication Code','Two Factor Authentication code is $code.','<div><table width=\"550\"><tbody><tr><td><p>Two Factor Authentication code is <b>$code</b>.</p>  </td>         </tr><tr><td></td>         </tr></tbody></table></div>',0,NULL,0,'system'),('a8dc03cd-1df6-7907-b19b-5d4dc06a6905','2019-08-09 18:51:09','2019-08-09 18:51:09','1','1','off','Contact Case Update','Template to send to a contact when their case is updated.','$acase_name update [CASE:$acase_case_number]','Hi $user_first_name $user_last_name,\n\n					   You\'ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:\n					       $contact_first_name $contact_last_name, said:\n					               $aop_case_updates_description','<p>Hi $contact_first_name $contact_last_name,</p>\n					    <p> </p>\n					    <p>You\'ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:</p>\n					    <p><strong>$user_first_name $user_last_name said:</strong></p>\n					    <p style=\"padding-left:30px;\">$aop_case_updates_description</p>',0,NULL,NULL,'system'),('ab0d70b4-996d-03a1-8e79-5d4dc0bb5255','2019-08-09 18:51:09','2019-08-09 18:51:09','1','1','off','Case Closure','Template for informing a contact that their case has been closed.','$acase_name [CASE:$acase_case_number] closed','Hi $contact_first_name $contact_last_name,\n\n					   Your case $acase_name (# $acase_case_number) has been closed on $acase_date_entered\n					   Status:				$acase_status\n					   Reference:			$acase_case_number\n					   Resolution:			$acase_resolution','<p> Hi $contact_first_name $contact_last_name,</p>\n					    <p>Your case $acase_name (# $acase_case_number) has been closed on $acase_date_entered</p>\n					    <table border=\"0\"><tbody><tr><td>Status</td><td>$acase_status</td></tr><tr><td>Reference</td><td>$acase_case_number</td></tr><tr><td>Resolution</td><td>$acase_resolution</td></tr></tbody></table>',0,NULL,NULL,'system'),('c5c69f8e-24dd-c684-79ed-5d4dc00c66e5','2019-08-09 18:51:09','2019-08-09 18:51:09','1','1','off','Joomla Account Creation','Template used when informing a contact that they\'ve been given an account on the joomla portal.','Support Portal Account Created','Hi $contact_name,\n					   An account has been created for you at $portal_address.\n					   You may login using this email address and the password $joomla_pass','<p>Hi $contact_name,</p>\n					    <p>An account has been created for you at <a href=\"$portal_address\">$portal_address</a>.</p>\n					    <p>You may login using this email address and the password $joomla_pass</p>',0,NULL,NULL,'system'),('d1c82b4a-798d-06ce-d2d2-5d4dc0fcc1f6','2019-08-09 18:51:09','2019-08-09 18:51:09','1','1','off','System-generated password email','This template is used when the System Administrator sends a new password to a user.','New account information','\nHere is your account username and temporary password:\nUsername : $contact_user_user_name\nPassword : $contact_user_user_hash\n\n$config_site_url\n\nAfter you log in using the above password, you may be required to reset the password to one of your own choice.','<div><table width=\"550\"><tbody><tr><td><p>Here is your account username and temporary password:</p><p>Username : $contact_user_user_name </p><p>Password : $contact_user_user_hash </p><br /><p>$config_site_url</p><br /><p>After you log in using the above password, you may be required to reset the password to one of your own choice.</p>   </td>         </tr><tr><td></td>         </tr></tbody></table></div>',0,NULL,0,'system'),('dad21002-3c04-0150-87a5-5d4dc0162756','2019-08-09 18:51:09','2019-08-09 18:51:09','1','1','off','Case Creation','Template to send to a contact when a case is received from them.','$acase_name [CASE:$acase_case_number]','Hi $contact_first_name $contact_last_name,\n\n					   We\'ve received your case $acase_name (# $acase_case_number) on $acase_date_entered\n					   Status:		$acase_status\n					   Reference:	$acase_case_number\n					   Description:	$acase_description','<p> Hi $contact_first_name $contact_last_name,</p>\n					    <p>We\'ve received your case $acase_name (# $acase_case_number) on $acase_date_entered</p>\n					    <table border=\"0\"><tbody><tr><td>Status</td><td>$acase_status</td></tr><tr><td>Reference</td><td>$acase_case_number</td></tr><tr><td>Description</td><td>$acase_description</td></tr></tbody></table>',0,NULL,NULL,'system'),('e701e732-d71d-c623-c51e-5d4dc0597b67','2019-08-09 18:51:09','2019-08-09 18:51:09','1','1','off','Forgot Password email','This template is used to send a user a link to click to reset the user\'s account password.','Reset your account password','\nYou recently requested on $contact_user_pwd_last_changed to be able to reset your account password.\n\nClick on the link below to reset your password:\n\n$contact_user_link_guid','<div><table width=\"550\"><tbody><tr><td><p>You recently requested on $contact_user_pwd_last_changed to be able to reset your account password. </p><p>Click on the link below to reset your password:</p><p> $contact_user_link_guid </p>  </td>         </tr><tr><td></td>         </tr></tbody></table></div>',0,NULL,0,'system');
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailman`
--

DROP TABLE IF EXISTS `emailman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailman` (
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` char(36) DEFAULT NULL,
  `marketing_id` char(36) DEFAULT NULL,
  `list_id` char(36) DEFAULT NULL,
  `send_date_time` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `in_queue` tinyint(1) DEFAULT 0,
  `in_queue_date` datetime DEFAULT NULL,
  `send_attempts` int(11) DEFAULT 0,
  `deleted` tinyint(1) DEFAULT 0,
  `related_id` char(36) DEFAULT NULL,
  `related_type` varchar(100) DEFAULT NULL,
  `related_confirm_opt_in` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_eman_list` (`list_id`,`user_id`,`deleted`),
  KEY `idx_eman_campaign_id` (`campaign_id`),
  KEY `idx_eman_relid_reltype_id` (`related_id`,`related_type`,`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailman`
--

LOCK TABLES `emailman` WRITE;
/*!40000 ALTER TABLE `emailman` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `orphaned` tinyint(1) DEFAULT NULL,
  `last_synced` datetime DEFAULT NULL,
  `date_sent` datetime DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `flagged` tinyint(1) DEFAULT NULL,
  `reply_to_status` tinyint(1) DEFAULT NULL,
  `intent` varchar(100) DEFAULT 'pick',
  `mailbox_id` char(36) DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `category_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_email_name` (`name`),
  KEY `idx_message_id` (`message_id`),
  KEY `idx_email_parent_id` (`parent_id`),
  KEY `idx_email_assigned` (`assigned_user_id`,`type`,`status`),
  KEY `idx_email_cat` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails_beans`
--

DROP TABLE IF EXISTS `emails_beans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails_beans` (
  `id` char(36) NOT NULL,
  `email_id` char(36) DEFAULT NULL,
  `bean_id` char(36) DEFAULT NULL,
  `bean_module` varchar(100) DEFAULT NULL,
  `campaign_data` text DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_emails_beans_bean_id` (`bean_id`),
  KEY `idx_emails_beans_email_bean` (`email_id`,`bean_id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails_beans`
--

LOCK TABLES `emails_beans` WRITE;
/*!40000 ALTER TABLE `emails_beans` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails_beans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails_email_addr_rel`
--

DROP TABLE IF EXISTS `emails_email_addr_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails_email_addr_rel` (
  `id` char(36) NOT NULL,
  `email_id` char(36) NOT NULL,
  `address_type` varchar(4) DEFAULT NULL,
  `email_address_id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_eearl_email_id` (`email_id`,`address_type`),
  KEY `idx_eearl_address_id` (`email_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails_email_addr_rel`
--

LOCK TABLES `emails_email_addr_rel` WRITE;
/*!40000 ALTER TABLE `emails_email_addr_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails_email_addr_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails_text`
--

DROP TABLE IF EXISTS `emails_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails_text` (
  `email_id` char(36) NOT NULL,
  `from_addr` varchar(255) DEFAULT NULL,
  `reply_to_addr` varchar(255) DEFAULT NULL,
  `to_addrs` text DEFAULT NULL,
  `cc_addrs` text DEFAULT NULL,
  `bcc_addrs` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `description_html` longtext DEFAULT NULL,
  `raw_source` longtext DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`email_id`),
  KEY `emails_textfromaddr` (`from_addr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails_text`
--

LOCK TABLES `emails_text` WRITE;
/*!40000 ALTER TABLE `emails_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorites` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields_meta_data`
--

DROP TABLE IF EXISTS `fields_meta_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields_meta_data` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `vname` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `help` varchar(255) DEFAULT NULL,
  `custom_module` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `len` int(11) DEFAULT NULL,
  `required` tinyint(1) DEFAULT 0,
  `default_value` varchar(255) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `audited` tinyint(1) DEFAULT 0,
  `massupdate` tinyint(1) DEFAULT 0,
  `duplicate_merge` smallint(6) DEFAULT 0,
  `reportable` tinyint(1) DEFAULT 1,
  `importable` varchar(255) DEFAULT NULL,
  `ext1` varchar(255) DEFAULT NULL,
  `ext2` varchar(255) DEFAULT NULL,
  `ext3` varchar(255) DEFAULT NULL,
  `ext4` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_meta_id_del` (`id`,`deleted`),
  KEY `idx_meta_cm_del` (`custom_module`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields_meta_data`
--

LOCK TABLES `fields_meta_data` WRITE;
/*!40000 ALTER TABLE `fields_meta_data` DISABLE KEYS */;
INSERT INTO `fields_meta_data` VALUES ('Accountsjjwg_maps_address_c','jjwg_maps_address_c','LBL_JJWG_MAPS_ADDRESS','Address','Address','Accounts','varchar',255,0,NULL,'2019-08-09 18:51:09',0,0,0,0,1,'true',NULL,'','',''),('Accountsjjwg_maps_geocode_status_c','jjwg_maps_geocode_status_c','LBL_JJWG_MAPS_GEOCODE_STATUS','Geocode Status','Geocode Status','Accounts','varchar',255,0,NULL,'2019-08-09 18:51:09',0,0,0,0,1,'true',NULL,'','',''),('Accountsjjwg_maps_lat_c','jjwg_maps_lat_c','LBL_JJWG_MAPS_LAT','','Latitude','Accounts','float',10,0,'0.00000000','2019-08-09 18:51:09',0,0,0,0,1,'true','8','','',''),('Accountsjjwg_maps_lng_c','jjwg_maps_lng_c','LBL_JJWG_MAPS_LNG','','Longitude','Accounts','float',11,0,'0.00000000','2019-08-09 18:51:09',0,0,0,0,1,'true','8','','',''),('Casesjjwg_maps_address_c','jjwg_maps_address_c','LBL_JJWG_MAPS_ADDRESS','Address','Address','Cases','varchar',255,0,NULL,'2019-08-09 18:51:09',0,0,0,0,1,'true',NULL,'','',''),('Casesjjwg_maps_geocode_status_c','jjwg_maps_geocode_status_c','LBL_JJWG_MAPS_GEOCODE_STATUS','Geocode Status','Geocode Status','Cases','varchar',255,0,NULL,'2019-08-09 18:51:09',0,0,0,0,1,'true',NULL,'','',''),('Casesjjwg_maps_lat_c','jjwg_maps_lat_c','LBL_JJWG_MAPS_LAT','','Latitude','Cases','float',10,0,'0.00000000','2019-08-09 18:51:09',0,0,0,0,1,'true','8','','',''),('Casesjjwg_maps_lng_c','jjwg_maps_lng_c','LBL_JJWG_MAPS_LNG','','Longitude','Cases','float',11,0,'0.00000000','2019-08-09 18:51:09',0,0,0,0,1,'true','8','','',''),('Contactsjjwg_maps_address_c','jjwg_maps_address_c','LBL_JJWG_MAPS_ADDRESS','Address','Address','Contacts','varchar',255,0,NULL,'2019-08-09 18:51:09',0,0,0,0,1,'true',NULL,'','',''),('Contactsjjwg_maps_geocode_status_c','jjwg_maps_geocode_status_c','LBL_JJWG_MAPS_GEOCODE_STATUS','Geocode Status','Geocode Status','Contacts','varchar',255,0,NULL,'2019-08-09 18:51:09',0,0,0,0,1,'true',NULL,'','',''),('Contactsjjwg_maps_lat_c','jjwg_maps_lat_c','LBL_JJWG_MAPS_LAT','','Latitude','Contacts','float',10,0,'0.00000000','2019-08-09 18:51:09',0,0,0,0,1,'true','8','','',''),('Contactsjjwg_maps_lng_c','jjwg_maps_lng_c','LBL_JJWG_MAPS_LNG','','Longitude','Contacts','float',11,0,'0.00000000','2019-08-09 18:51:09',0,0,0,0,1,'true','8','','',''),('Leadsjjwg_maps_address_c','jjwg_maps_address_c','LBL_JJWG_MAPS_ADDRESS','Address','Address','Leads','varchar',255,0,NULL,'2019-08-09 18:51:09',0,0,0,0,1,'true',NULL,'','',''),('Leadsjjwg_maps_geocode_status_c','jjwg_maps_geocode_status_c','LBL_JJWG_MAPS_GEOCODE_STATUS','Geocode Status','Geocode Status','Leads','varchar',255,0,NULL,'2019-08-09 18:51:09',0,0,0,0,1,'true',NULL,'','',''),('Leadsjjwg_maps_lat_c','jjwg_maps_lat_c','LBL_JJWG_MAPS_LAT','','Latitude','Leads','float',10,0,'0.00000000','2019-08-09 18:51:09',0,0,0,0,1,'true','8','','',''),('Leadsjjwg_maps_lng_c','jjwg_maps_lng_c','LBL_JJWG_MAPS_LNG','','Longitude','Leads','float',11,0,'0.00000000','2019-08-09 18:51:09',0,0,0,0,1,'true','8','','',''),('Meetingsjjwg_maps_address_c','jjwg_maps_address_c','LBL_JJWG_MAPS_ADDRESS','Address','Address','Meetings','varchar',255,0,NULL,'2019-08-09 18:51:09',0,0,0,0,1,'true',NULL,'','',''),('Meetingsjjwg_maps_geocode_status_c','jjwg_maps_geocode_status_c','LBL_JJWG_MAPS_GEOCODE_STATUS','Geocode Status','Geocode Status','Meetings','varchar',255,0,NULL,'2019-08-09 18:51:09',0,0,0,0,1,'true',NULL,'','',''),('Meetingsjjwg_maps_lat_c','jjwg_maps_lat_c','LBL_JJWG_MAPS_LAT','','Latitude','Meetings','float',10,0,'0.00000000','2019-08-09 18:51:09',0,0,0,0,1,'true','8','','',''),('Meetingsjjwg_maps_lng_c','jjwg_maps_lng_c','LBL_JJWG_MAPS_LNG','','Longitude','Meetings','float',11,0,'0.00000000','2019-08-09 18:51:09',0,0,0,0,1,'true','8','','',''),('Opportunitiesjjwg_maps_address_c','jjwg_maps_address_c','LBL_JJWG_MAPS_ADDRESS','Address','Address','Opportunities','varchar',255,0,NULL,'2019-08-09 18:51:09',0,0,0,0,1,'true',NULL,'','',''),('Opportunitiesjjwg_maps_geocode_status_c','jjwg_maps_geocode_status_c','LBL_JJWG_MAPS_GEOCODE_STATUS','Geocode Status','Geocode Status','Opportunities','varchar',255,0,NULL,'2019-08-09 18:51:09',0,0,0,0,1,'true',NULL,'','',''),('Opportunitiesjjwg_maps_lat_c','jjwg_maps_lat_c','LBL_JJWG_MAPS_LAT','','Latitude','Opportunities','float',10,0,'0.00000000','2019-08-09 18:51:09',0,0,0,0,1,'true','8','','',''),('Opportunitiesjjwg_maps_lng_c','jjwg_maps_lng_c','LBL_JJWG_MAPS_LNG','','Longitude','Opportunities','float',11,0,'0.00000000','2019-08-09 18:51:09',0,0,0,0,1,'true','8','','',''),('Projectjjwg_maps_address_c','jjwg_maps_address_c','LBL_JJWG_MAPS_ADDRESS','Address','Address','Project','varchar',255,0,NULL,'2019-08-09 18:51:09',0,0,0,0,1,'true',NULL,'','',''),('Projectjjwg_maps_geocode_status_c','jjwg_maps_geocode_status_c','LBL_JJWG_MAPS_GEOCODE_STATUS','Geocode Status','Geocode Status','Project','varchar',255,0,NULL,'2019-08-09 18:51:09',0,0,0,0,1,'true',NULL,'','',''),('Projectjjwg_maps_lat_c','jjwg_maps_lat_c','LBL_JJWG_MAPS_LAT','','Latitude','Project','float',10,0,'0.00000000','2019-08-09 18:51:09',0,0,0,0,1,'true','8','','',''),('Projectjjwg_maps_lng_c','jjwg_maps_lng_c','LBL_JJWG_MAPS_LNG','','Longitude','Project','float',11,0,'0.00000000','2019-08-09 18:51:09',0,0,0,0,1,'true','8','','',''),('Prospectsjjwg_maps_address_c','jjwg_maps_address_c','LBL_JJWG_MAPS_ADDRESS','Address','Address','Prospects','varchar',255,0,NULL,'2019-08-09 18:51:09',0,0,0,0,1,'true',NULL,'','',''),('Prospectsjjwg_maps_geocode_status_c','jjwg_maps_geocode_status_c','LBL_JJWG_MAPS_GEOCODE_STATUS','Geocode Status','Geocode Status','Prospects','varchar',255,0,NULL,'2019-08-09 18:51:09',0,0,0,0,1,'true',NULL,'','',''),('Prospectsjjwg_maps_lat_c','jjwg_maps_lat_c','LBL_JJWG_MAPS_LAT','','Latitude','Prospects','float',10,0,'0.00000000','2019-08-09 18:51:09',0,0,0,0,1,'true','8','','',''),('Prospectsjjwg_maps_lng_c','jjwg_maps_lng_c','LBL_JJWG_MAPS_LNG','','Longitude','Prospects','float',11,0,'0.00000000','2019-08-09 18:51:09',0,0,0,0,1,'true','8','','','');
/*!40000 ALTER TABLE `fields_meta_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folders`
--

DROP TABLE IF EXISTS `folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folders` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `folder_type` varchar(25) DEFAULT NULL,
  `parent_folder` char(36) DEFAULT NULL,
  `has_child` tinyint(1) DEFAULT 0,
  `is_group` tinyint(1) DEFAULT 0,
  `is_dynamic` tinyint(1) DEFAULT 0,
  `dynamic_query` text DEFAULT NULL,
  `assign_to_id` char(36) DEFAULT NULL,
  `created_by` char(36) NOT NULL,
  `modified_by` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_parent_folder` (`parent_folder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folders`
--

LOCK TABLES `folders` WRITE;
/*!40000 ALTER TABLE `folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folders_rel`
--

DROP TABLE IF EXISTS `folders_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folders_rel` (
  `id` char(36) NOT NULL,
  `folder_id` char(36) NOT NULL,
  `polymorphic_module` varchar(25) DEFAULT NULL,
  `polymorphic_id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_poly_module_poly_id` (`polymorphic_module`,`polymorphic_id`),
  KEY `idx_fr_id_deleted_poly` (`folder_id`,`deleted`,`polymorphic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folders_rel`
--

LOCK TABLES `folders_rel` WRITE;
/*!40000 ALTER TABLE `folders_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `folders_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folders_subscriptions`
--

DROP TABLE IF EXISTS `folders_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folders_subscriptions` (
  `id` char(36) NOT NULL,
  `folder_id` char(36) NOT NULL,
  `assigned_user_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_folder_id_assigned_user_id` (`folder_id`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folders_subscriptions`
--

LOCK TABLES `folders_subscriptions` WRITE;
/*!40000 ALTER TABLE `folders_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `folders_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_event_locations`
--

DROP TABLE IF EXISTS `fp_event_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_event_locations` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `address_city` varchar(100) DEFAULT NULL,
  `address_country` varchar(100) DEFAULT NULL,
  `address_postalcode` varchar(20) DEFAULT NULL,
  `address_state` varchar(100) DEFAULT NULL,
  `capacity` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_event_locations`
--

LOCK TABLES `fp_event_locations` WRITE;
/*!40000 ALTER TABLE `fp_event_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_event_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_event_locations_audit`
--

DROP TABLE IF EXISTS `fp_event_locations_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_event_locations_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_fp_event_locations_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_event_locations_audit`
--

LOCK TABLES `fp_event_locations_audit` WRITE;
/*!40000 ALTER TABLE `fp_event_locations_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_event_locations_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_event_locations_fp_events_1_c`
--

DROP TABLE IF EXISTS `fp_event_locations_fp_events_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_event_locations_fp_events_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `fp_event_locations_fp_events_1fp_event_locations_ida` varchar(36) DEFAULT NULL,
  `fp_event_locations_fp_events_1fp_events_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fp_event_locations_fp_events_1_ida1` (`fp_event_locations_fp_events_1fp_event_locations_ida`),
  KEY `fp_event_locations_fp_events_1_alt` (`fp_event_locations_fp_events_1fp_events_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_event_locations_fp_events_1_c`
--

LOCK TABLES `fp_event_locations_fp_events_1_c` WRITE;
/*!40000 ALTER TABLE `fp_event_locations_fp_events_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_event_locations_fp_events_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_events`
--

DROP TABLE IF EXISTS `fp_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_events` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `duration_hours` int(3) DEFAULT NULL,
  `duration_minutes` int(2) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `budget` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `invite_templates` varchar(100) DEFAULT NULL,
  `accept_redirect` varchar(255) DEFAULT NULL,
  `decline_redirect` varchar(255) DEFAULT NULL,
  `activity_status_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_events`
--

LOCK TABLES `fp_events` WRITE;
/*!40000 ALTER TABLE `fp_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_events_audit`
--

DROP TABLE IF EXISTS `fp_events_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_events_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_fp_events_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_events_audit`
--

LOCK TABLES `fp_events_audit` WRITE;
/*!40000 ALTER TABLE `fp_events_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_events_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_events_contacts_c`
--

DROP TABLE IF EXISTS `fp_events_contacts_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_events_contacts_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `fp_events_contactsfp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_contactscontacts_idb` varchar(36) DEFAULT NULL,
  `invite_status` varchar(25) DEFAULT 'Not Invited',
  `accept_status` varchar(25) DEFAULT 'No Response',
  `email_responded` int(2) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fp_events_contacts_alt` (`fp_events_contactsfp_events_ida`,`fp_events_contactscontacts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_events_contacts_c`
--

LOCK TABLES `fp_events_contacts_c` WRITE;
/*!40000 ALTER TABLE `fp_events_contacts_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_events_contacts_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_events_fp_event_delegates_1_c`
--

DROP TABLE IF EXISTS `fp_events_fp_event_delegates_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_events_fp_event_delegates_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `fp_events_fp_event_delegates_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_fp_event_delegates_1fp_event_delegates_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fp_events_fp_event_delegates_1_ida1` (`fp_events_fp_event_delegates_1fp_events_ida`),
  KEY `fp_events_fp_event_delegates_1_alt` (`fp_events_fp_event_delegates_1fp_event_delegates_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_events_fp_event_delegates_1_c`
--

LOCK TABLES `fp_events_fp_event_delegates_1_c` WRITE;
/*!40000 ALTER TABLE `fp_events_fp_event_delegates_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_events_fp_event_delegates_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_events_fp_event_locations_1_c`
--

DROP TABLE IF EXISTS `fp_events_fp_event_locations_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_events_fp_event_locations_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `fp_events_fp_event_locations_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_fp_event_locations_1fp_event_locations_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fp_events_fp_event_locations_1_alt` (`fp_events_fp_event_locations_1fp_events_ida`,`fp_events_fp_event_locations_1fp_event_locations_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_events_fp_event_locations_1_c`
--

LOCK TABLES `fp_events_fp_event_locations_1_c` WRITE;
/*!40000 ALTER TABLE `fp_events_fp_event_locations_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_events_fp_event_locations_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_events_leads_1_c`
--

DROP TABLE IF EXISTS `fp_events_leads_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_events_leads_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `fp_events_leads_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_leads_1leads_idb` varchar(36) DEFAULT NULL,
  `invite_status` varchar(25) DEFAULT 'Not Invited',
  `accept_status` varchar(25) DEFAULT 'No Response',
  `email_responded` int(2) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fp_events_leads_1_alt` (`fp_events_leads_1fp_events_ida`,`fp_events_leads_1leads_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_events_leads_1_c`
--

LOCK TABLES `fp_events_leads_1_c` WRITE;
/*!40000 ALTER TABLE `fp_events_leads_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_events_leads_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_events_prospects_1_c`
--

DROP TABLE IF EXISTS `fp_events_prospects_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_events_prospects_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `fp_events_prospects_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_prospects_1prospects_idb` varchar(36) DEFAULT NULL,
  `invite_status` varchar(25) DEFAULT 'Not Invited',
  `accept_status` varchar(25) DEFAULT 'No Response',
  `email_responded` int(2) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fp_events_prospects_1_alt` (`fp_events_prospects_1fp_events_ida`,`fp_events_prospects_1prospects_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_events_prospects_1_c`
--

LOCK TABLES `fp_events_prospects_1_c` WRITE;
/*!40000 ALTER TABLE `fp_events_prospects_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_events_prospects_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_maps`
--

DROP TABLE IF EXISTS `import_maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_maps` (
  `id` char(36) NOT NULL,
  `name` varchar(254) DEFAULT NULL,
  `source` varchar(36) DEFAULT NULL,
  `enclosure` varchar(1) DEFAULT ' ',
  `delimiter` varchar(1) DEFAULT ',',
  `module` varchar(36) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `default_values` text DEFAULT NULL,
  `has_header` tinyint(1) DEFAULT 1,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `is_published` varchar(3) DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `idx_owner_module_name` (`assigned_user_id`,`module`,`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_maps`
--

LOCK TABLES `import_maps` WRITE;
/*!40000 ALTER TABLE `import_maps` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_maps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbound_email`
--

DROP TABLE IF EXISTS `inbound_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inbound_email` (
  `id` varchar(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Active',
  `server_url` varchar(100) DEFAULT NULL,
  `email_user` varchar(100) DEFAULT NULL,
  `email_password` varchar(100) DEFAULT NULL,
  `port` int(5) DEFAULT NULL,
  `service` varchar(50) DEFAULT NULL,
  `mailbox` text DEFAULT NULL,
  `delete_seen` tinyint(1) DEFAULT 0,
  `mailbox_type` varchar(10) DEFAULT NULL,
  `template_id` char(36) DEFAULT NULL,
  `stored_options` text DEFAULT NULL,
  `group_id` char(36) DEFAULT NULL,
  `is_personal` tinyint(1) DEFAULT 0,
  `groupfolder_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbound_email`
--

LOCK TABLES `inbound_email` WRITE;
/*!40000 ALTER TABLE `inbound_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbound_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbound_email_autoreply`
--

DROP TABLE IF EXISTS `inbound_email_autoreply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inbound_email_autoreply` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `autoreplied_to` varchar(100) DEFAULT NULL,
  `ie_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ie_autoreplied_to` (`autoreplied_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbound_email_autoreply`
--

LOCK TABLES `inbound_email_autoreply` WRITE;
/*!40000 ALTER TABLE `inbound_email_autoreply` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbound_email_autoreply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbound_email_cache_ts`
--

DROP TABLE IF EXISTS `inbound_email_cache_ts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inbound_email_cache_ts` (
  `id` varchar(255) NOT NULL,
  `ie_timestamp` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbound_email_cache_ts`
--

LOCK TABLES `inbound_email_cache_ts` WRITE;
/*!40000 ALTER TABLE `inbound_email_cache_ts` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbound_email_cache_ts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_address_cache`
--

DROP TABLE IF EXISTS `jjwg_address_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_address_cache` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `lat` float(10,8) DEFAULT NULL,
  `lng` float(11,8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_address_cache`
--

LOCK TABLES `jjwg_address_cache` WRITE;
/*!40000 ALTER TABLE `jjwg_address_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_address_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_address_cache_audit`
--

DROP TABLE IF EXISTS `jjwg_address_cache_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_address_cache_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_jjwg_address_cache_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_address_cache_audit`
--

LOCK TABLES `jjwg_address_cache_audit` WRITE;
/*!40000 ALTER TABLE `jjwg_address_cache_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_address_cache_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_areas`
--

DROP TABLE IF EXISTS `jjwg_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_areas` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `coordinates` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_areas`
--

LOCK TABLES `jjwg_areas` WRITE;
/*!40000 ALTER TABLE `jjwg_areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_areas_audit`
--

DROP TABLE IF EXISTS `jjwg_areas_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_areas_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_jjwg_areas_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_areas_audit`
--

LOCK TABLES `jjwg_areas_audit` WRITE;
/*!40000 ALTER TABLE `jjwg_areas_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_areas_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_maps`
--

DROP TABLE IF EXISTS `jjwg_maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_maps` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `distance` float(9,4) DEFAULT NULL,
  `unit_type` varchar(100) DEFAULT 'mi',
  `module_type` varchar(100) DEFAULT 'Accounts',
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_maps`
--

LOCK TABLES `jjwg_maps` WRITE;
/*!40000 ALTER TABLE `jjwg_maps` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_maps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_maps_audit`
--

DROP TABLE IF EXISTS `jjwg_maps_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_maps_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_jjwg_maps_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_maps_audit`
--

LOCK TABLES `jjwg_maps_audit` WRITE;
/*!40000 ALTER TABLE `jjwg_maps_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_maps_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_maps_jjwg_areas_c`
--

DROP TABLE IF EXISTS `jjwg_maps_jjwg_areas_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_maps_jjwg_areas_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `jjwg_maps_5304wg_maps_ida` varchar(36) DEFAULT NULL,
  `jjwg_maps_41f2g_areas_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jjwg_maps_jjwg_areas_alt` (`jjwg_maps_5304wg_maps_ida`,`jjwg_maps_41f2g_areas_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_maps_jjwg_areas_c`
--

LOCK TABLES `jjwg_maps_jjwg_areas_c` WRITE;
/*!40000 ALTER TABLE `jjwg_maps_jjwg_areas_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_maps_jjwg_areas_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_maps_jjwg_markers_c`
--

DROP TABLE IF EXISTS `jjwg_maps_jjwg_markers_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_maps_jjwg_markers_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `jjwg_maps_b229wg_maps_ida` varchar(36) DEFAULT NULL,
  `jjwg_maps_2e31markers_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jjwg_maps_jjwg_markers_alt` (`jjwg_maps_b229wg_maps_ida`,`jjwg_maps_2e31markers_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_maps_jjwg_markers_c`
--

LOCK TABLES `jjwg_maps_jjwg_markers_c` WRITE;
/*!40000 ALTER TABLE `jjwg_maps_jjwg_markers_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_maps_jjwg_markers_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_markers`
--

DROP TABLE IF EXISTS `jjwg_markers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_markers` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `jjwg_maps_lat` float(10,8) DEFAULT 0.00000000,
  `jjwg_maps_lng` float(11,8) DEFAULT 0.00000000,
  `marker_image` varchar(100) DEFAULT 'company',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_markers`
--

LOCK TABLES `jjwg_markers` WRITE;
/*!40000 ALTER TABLE `jjwg_markers` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_markers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_markers_audit`
--

DROP TABLE IF EXISTS `jjwg_markers_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_markers_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_jjwg_markers_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_markers_audit`
--

LOCK TABLES `jjwg_markers_audit` WRITE;
/*!40000 ALTER TABLE `jjwg_markers_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_markers_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_queue`
--

DROP TABLE IF EXISTS `job_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_queue` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `scheduler_id` char(36) DEFAULT NULL,
  `execute_time` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `resolution` varchar(20) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `requeue` tinyint(1) DEFAULT 0,
  `retry_count` tinyint(4) DEFAULT NULL,
  `failure_count` tinyint(4) DEFAULT NULL,
  `job_delay` int(11) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `percent_complete` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_status_scheduler` (`status`,`scheduler_id`),
  KEY `idx_status_time` (`status`,`execute_time`,`date_entered`),
  KEY `idx_status_entered` (`status`,`date_entered`),
  KEY `idx_status_modified` (`status`,`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_queue`
--

LOCK TABLES `job_queue` WRITE;
/*!40000 ALTER TABLE `job_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads`
--

DROP TABLE IF EXISTS `leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leads` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT 0,
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `lawful_basis` text DEFAULT NULL,
  `date_reviewed` date DEFAULT NULL,
  `lawful_basis_source` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `converted` tinyint(1) DEFAULT 0,
  `refered_by` varchar(100) DEFAULT NULL,
  `lead_source` varchar(100) DEFAULT NULL,
  `lead_source_description` text DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `status_description` text DEFAULT NULL,
  `reports_to_id` char(36) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `account_description` text DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `account_id` char(36) DEFAULT NULL,
  `opportunity_id` char(36) DEFAULT NULL,
  `opportunity_name` varchar(255) DEFAULT NULL,
  `opportunity_amount` varchar(50) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `portal_name` varchar(255) DEFAULT NULL,
  `portal_app` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lead_acct_name_first` (`account_name`,`deleted`),
  KEY `idx_lead_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_lead_del_stat` (`last_name`,`status`,`deleted`,`first_name`),
  KEY `idx_lead_opp_del` (`opportunity_id`,`deleted`),
  KEY `idx_leads_acct_del` (`account_id`,`deleted`),
  KEY `idx_del_user` (`deleted`,`assigned_user_id`),
  KEY `idx_lead_assigned` (`assigned_user_id`),
  KEY `idx_lead_contact` (`contact_id`),
  KEY `idx_reports_to` (`reports_to_id`),
  KEY `idx_lead_phone_work` (`phone_work`),
  KEY `idx_leads_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads`
--

LOCK TABLES `leads` WRITE;
/*!40000 ALTER TABLE `leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads_audit`
--

DROP TABLE IF EXISTS `leads_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leads_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_leads_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads_audit`
--

LOCK TABLES `leads_audit` WRITE;
/*!40000 ALTER TABLE `leads_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `leads_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads_cstm`
--

DROP TABLE IF EXISTS `leads_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leads_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT 0.00000000,
  `jjwg_maps_lat_c` float(10,8) DEFAULT 0.00000000,
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads_cstm`
--

LOCK TABLES `leads_cstm` WRITE;
/*!40000 ALTER TABLE `leads_cstm` DISABLE KEYS */;
/*!40000 ALTER TABLE `leads_cstm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linked_documents`
--

DROP TABLE IF EXISTS `linked_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `linked_documents` (
  `id` varchar(36) NOT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  `parent_type` varchar(25) DEFAULT NULL,
  `document_id` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_parent_document` (`parent_type`,`parent_id`,`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linked_documents`
--

LOCK TABLES `linked_documents` WRITE;
/*!40000 ALTER TABLE `linked_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `linked_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings`
--

DROP TABLE IF EXISTS `meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `join_url` varchar(200) DEFAULT NULL,
  `host_url` varchar(400) DEFAULT NULL,
  `displayed_url` varchar(400) DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `external_id` varchar(50) DEFAULT NULL,
  `duration_hours` int(3) DEFAULT NULL,
  `duration_minutes` int(2) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Planned',
  `type` varchar(255) DEFAULT 'Sugar',
  `parent_id` char(36) DEFAULT NULL,
  `reminder_time` int(11) DEFAULT -1,
  `email_reminder_time` int(11) DEFAULT -1,
  `email_reminder_sent` tinyint(1) DEFAULT 0,
  `outlook_id` varchar(255) DEFAULT NULL,
  `sequence` int(11) DEFAULT 0,
  `repeat_type` varchar(36) DEFAULT NULL,
  `repeat_interval` int(3) DEFAULT 1,
  `repeat_dow` varchar(7) DEFAULT NULL,
  `repeat_until` date DEFAULT NULL,
  `repeat_count` int(7) DEFAULT NULL,
  `repeat_parent_id` char(36) DEFAULT NULL,
  `recurring_source` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mtg_name` (`name`),
  KEY `idx_meet_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_meet_stat_del` (`assigned_user_id`,`status`,`deleted`),
  KEY `idx_meet_date_start` (`date_start`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings`
--

LOCK TABLES `meetings` WRITE;
/*!40000 ALTER TABLE `meetings` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings_contacts`
--

DROP TABLE IF EXISTS `meetings_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings_contacts` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_con_mtg_mtg` (`meeting_id`),
  KEY `idx_con_mtg_con` (`contact_id`),
  KEY `idx_meeting_contact` (`meeting_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings_contacts`
--

LOCK TABLES `meetings_contacts` WRITE;
/*!40000 ALTER TABLE `meetings_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings_cstm`
--

DROP TABLE IF EXISTS `meetings_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT 0.00000000,
  `jjwg_maps_lat_c` float(10,8) DEFAULT 0.00000000,
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings_cstm`
--

LOCK TABLES `meetings_cstm` WRITE;
/*!40000 ALTER TABLE `meetings_cstm` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings_cstm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings_leads`
--

DROP TABLE IF EXISTS `meetings_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings_leads` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `lead_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_lead_meeting_meeting` (`meeting_id`),
  KEY `idx_lead_meeting_lead` (`lead_id`),
  KEY `idx_meeting_lead` (`meeting_id`,`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings_leads`
--

LOCK TABLES `meetings_leads` WRITE;
/*!40000 ALTER TABLE `meetings_leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings_leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings_users`
--

DROP TABLE IF EXISTS `meetings_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings_users` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_usr_mtg_mtg` (`meeting_id`),
  KEY `idx_usr_mtg_usr` (`user_id`),
  KEY `idx_meeting_users` (`meeting_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings_users`
--

LOCK TABLES `meetings_users` WRITE;
/*!40000 ALTER TABLE `meetings_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `file_mime_type` varchar(100) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `portal_flag` tinyint(1) DEFAULT NULL,
  `embed_flag` tinyint(1) DEFAULT 0,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_note_name` (`name`),
  KEY `idx_notes_parent` (`parent_id`,`parent_type`),
  KEY `idx_note_contact` (`contact_id`),
  KEY `idx_notes_assigned_del` (`deleted`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2clients`
--

DROP TABLE IF EXISTS `oauth2clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2clients` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `secret` varchar(4000) DEFAULT NULL,
  `redirect_url` varchar(255) DEFAULT NULL,
  `is_confidential` tinyint(1) DEFAULT 1,
  `allowed_grant_type` varchar(255) DEFAULT 'password',
  `duration_value` int(11) DEFAULT NULL,
  `duration_amount` int(11) DEFAULT NULL,
  `duration_unit` varchar(255) DEFAULT 'Duration Unit',
  `assigned_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2clients`
--

LOCK TABLES `oauth2clients` WRITE;
/*!40000 ALTER TABLE `oauth2clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2tokens`
--

DROP TABLE IF EXISTS `oauth2tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2tokens` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `token_is_revoked` tinyint(1) DEFAULT NULL,
  `token_type` varchar(255) DEFAULT NULL,
  `access_token_expires` datetime DEFAULT NULL,
  `access_token` varchar(4000) DEFAULT NULL,
  `refresh_token` varchar(4000) DEFAULT NULL,
  `refresh_token_expires` datetime DEFAULT NULL,
  `grant_type` varchar(255) DEFAULT NULL,
  `state` varchar(1024) DEFAULT NULL,
  `client` char(36) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2tokens`
--

LOCK TABLES `oauth2tokens` WRITE;
/*!40000 ALTER TABLE `oauth2tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_consumer`
--

DROP TABLE IF EXISTS `oauth_consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_consumer` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `c_key` varchar(255) DEFAULT NULL,
  `c_secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ckey` (`c_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_consumer`
--

LOCK TABLES `oauth_consumer` WRITE;
/*!40000 ALTER TABLE `oauth_consumer` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_nonce`
--

DROP TABLE IF EXISTS `oauth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_nonce` (
  `conskey` varchar(32) NOT NULL,
  `nonce` varchar(32) NOT NULL,
  `nonce_ts` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`conskey`,`nonce`),
  KEY `oauth_nonce_keyts` (`conskey`,`nonce_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_nonce`
--

LOCK TABLES `oauth_nonce` WRITE;
/*!40000 ALTER TABLE `oauth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_tokens`
--

DROP TABLE IF EXISTS `oauth_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_tokens` (
  `id` char(36) NOT NULL,
  `secret` varchar(32) DEFAULT NULL,
  `tstate` varchar(1) DEFAULT NULL,
  `consumer` char(36) NOT NULL,
  `token_ts` bigint(20) DEFAULT NULL,
  `verify` varchar(32) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `callback_url` varchar(255) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`,`deleted`),
  KEY `oauth_state_ts` (`tstate`,`token_ts`),
  KEY `constoken_key` (`consumer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_tokens`
--

LOCK TABLES `oauth_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunities`
--

DROP TABLE IF EXISTS `opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opportunities` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `opportunity_type` varchar(255) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `lead_source` varchar(50) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `amount_usdollar` double DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `date_closed` date DEFAULT NULL,
  `next_step` varchar(100) DEFAULT NULL,
  `sales_stage` varchar(255) DEFAULT NULL,
  `probability` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_opp_name` (`name`),
  KEY `idx_opp_assigned` (`assigned_user_id`),
  KEY `idx_opp_id_deleted` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunities`
--

LOCK TABLES `opportunities` WRITE;
/*!40000 ALTER TABLE `opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunities_audit`
--

DROP TABLE IF EXISTS `opportunities_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opportunities_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_opportunities_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunities_audit`
--

LOCK TABLES `opportunities_audit` WRITE;
/*!40000 ALTER TABLE `opportunities_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `opportunities_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunities_contacts`
--

DROP TABLE IF EXISTS `opportunities_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opportunities_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_con_opp_con` (`contact_id`),
  KEY `idx_con_opp_opp` (`opportunity_id`),
  KEY `idx_opportunities_contacts` (`opportunity_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunities_contacts`
--

LOCK TABLES `opportunities_contacts` WRITE;
/*!40000 ALTER TABLE `opportunities_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `opportunities_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunities_cstm`
--

DROP TABLE IF EXISTS `opportunities_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opportunities_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT 0.00000000,
  `jjwg_maps_lat_c` float(10,8) DEFAULT 0.00000000,
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunities_cstm`
--

LOCK TABLES `opportunities_cstm` WRITE;
/*!40000 ALTER TABLE `opportunities_cstm` DISABLE KEYS */;
/*!40000 ALTER TABLE `opportunities_cstm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outbound_email`
--

DROP TABLE IF EXISTS `outbound_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outbound_email` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(15) DEFAULT 'user',
  `user_id` char(36) NOT NULL,
  `smtp_from_name` varchar(255) DEFAULT NULL,
  `smtp_from_addr` varchar(255) DEFAULT NULL,
  `mail_sendtype` varchar(8) DEFAULT 'smtp',
  `mail_smtptype` varchar(20) DEFAULT 'other',
  `mail_smtpserver` varchar(100) DEFAULT NULL,
  `mail_smtpport` int(5) DEFAULT 0,
  `mail_smtpuser` varchar(100) DEFAULT NULL,
  `mail_smtppass` varchar(100) DEFAULT NULL,
  `mail_smtpauth_req` tinyint(1) DEFAULT 0,
  `mail_smtpssl` varchar(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outbound_email`
--

LOCK TABLES `outbound_email` WRITE;
/*!40000 ALTER TABLE `outbound_email` DISABLE KEYS */;
INSERT INTO `outbound_email` VALUES ('744088cd-3874-1c0a-7ee9-5d4dc07d4c31','system','system','1',NULL,NULL,'SMTP','other','',25,'','',1,'0',NULL,NULL,NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `outbound_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outbound_email_audit`
--

DROP TABLE IF EXISTS `outbound_email_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outbound_email_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_outbound_email_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outbound_email_audit`
--

LOCK TABLES `outbound_email_audit` WRITE;
/*!40000 ALTER TABLE `outbound_email_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `outbound_email_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `estimated_start_date` date DEFAULT NULL,
  `estimated_end_date` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `override_business_hours` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_contacts_1_c`
--

DROP TABLE IF EXISTS `project_contacts_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_contacts_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `project_contacts_1project_ida` varchar(36) DEFAULT NULL,
  `project_contacts_1contacts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_contacts_1_alt` (`project_contacts_1project_ida`,`project_contacts_1contacts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_contacts_1_c`
--

LOCK TABLES `project_contacts_1_c` WRITE;
/*!40000 ALTER TABLE `project_contacts_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_contacts_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_cstm`
--

DROP TABLE IF EXISTS `project_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT 0.00000000,
  `jjwg_maps_lat_c` float(10,8) DEFAULT 0.00000000,
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_cstm`
--

LOCK TABLES `project_cstm` WRITE;
/*!40000 ALTER TABLE `project_cstm` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_cstm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_task`
--

DROP TABLE IF EXISTS `project_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_task` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `project_id` char(36) NOT NULL,
  `project_task_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `relationship_type` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `predecessors` text DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `time_start` int(11) DEFAULT NULL,
  `time_finish` int(11) DEFAULT NULL,
  `date_finish` date DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `duration_unit` text DEFAULT NULL,
  `actual_duration` int(11) DEFAULT NULL,
  `percent_complete` int(11) DEFAULT NULL,
  `date_due` date DEFAULT NULL,
  `time_due` time DEFAULT NULL,
  `parent_task_id` int(11) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `milestone_flag` tinyint(1) DEFAULT NULL,
  `order_number` int(11) DEFAULT 1,
  `task_number` int(11) DEFAULT NULL,
  `estimated_effort` int(11) DEFAULT NULL,
  `actual_effort` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `utilization` int(11) DEFAULT 100,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_task`
--

LOCK TABLES `project_task` WRITE;
/*!40000 ALTER TABLE `project_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_task_audit`
--

DROP TABLE IF EXISTS `project_task_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_task_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_project_task_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_task_audit`
--

LOCK TABLES `project_task_audit` WRITE;
/*!40000 ALTER TABLE `project_task_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_task_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_users_1_c`
--

DROP TABLE IF EXISTS `project_users_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_users_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `project_users_1project_ida` varchar(36) DEFAULT NULL,
  `project_users_1users_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_users_1_alt` (`project_users_1project_ida`,`project_users_1users_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_users_1_c`
--

LOCK TABLES `project_users_1_c` WRITE;
/*!40000 ALTER TABLE `project_users_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_users_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_accounts`
--

DROP TABLE IF EXISTS `projects_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_accounts` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_proj_acct_proj` (`project_id`),
  KEY `idx_proj_acct_acct` (`account_id`),
  KEY `projects_accounts_alt` (`project_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_accounts`
--

LOCK TABLES `projects_accounts` WRITE;
/*!40000 ALTER TABLE `projects_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_bugs`
--

DROP TABLE IF EXISTS `projects_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_bugs` (
  `id` varchar(36) NOT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_proj_bug_proj` (`project_id`),
  KEY `idx_proj_bug_bug` (`bug_id`),
  KEY `projects_bugs_alt` (`project_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_bugs`
--

LOCK TABLES `projects_bugs` WRITE;
/*!40000 ALTER TABLE `projects_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_cases`
--

DROP TABLE IF EXISTS `projects_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_cases` (
  `id` varchar(36) NOT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_proj_case_proj` (`project_id`),
  KEY `idx_proj_case_case` (`case_id`),
  KEY `projects_cases_alt` (`project_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_cases`
--

LOCK TABLES `projects_cases` WRITE;
/*!40000 ALTER TABLE `projects_cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_contacts`
--

DROP TABLE IF EXISTS `projects_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_proj_con_proj` (`project_id`),
  KEY `idx_proj_con_con` (`contact_id`),
  KEY `projects_contacts_alt` (`project_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_contacts`
--

LOCK TABLES `projects_contacts` WRITE;
/*!40000 ALTER TABLE `projects_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_opportunities`
--

DROP TABLE IF EXISTS `projects_opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_opportunities` (
  `id` varchar(36) NOT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_proj_opp_proj` (`project_id`),
  KEY `idx_proj_opp_opp` (`opportunity_id`),
  KEY `projects_opportunities_alt` (`project_id`,`opportunity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_opportunities`
--

LOCK TABLES `projects_opportunities` WRITE;
/*!40000 ALTER TABLE `projects_opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_products`
--

DROP TABLE IF EXISTS `projects_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_products` (
  `id` varchar(36) NOT NULL,
  `product_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_proj_prod_project` (`project_id`),
  KEY `idx_proj_prod_product` (`product_id`),
  KEY `projects_products_alt` (`project_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_products`
--

LOCK TABLES `projects_products` WRITE;
/*!40000 ALTER TABLE `projects_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospect_list_campaigns`
--

DROP TABLE IF EXISTS `prospect_list_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospect_list_campaigns` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `campaign_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_pro_id` (`prospect_list_id`),
  KEY `idx_cam_id` (`campaign_id`),
  KEY `idx_prospect_list_campaigns` (`prospect_list_id`,`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospect_list_campaigns`
--

LOCK TABLES `prospect_list_campaigns` WRITE;
/*!40000 ALTER TABLE `prospect_list_campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospect_list_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospect_lists`
--

DROP TABLE IF EXISTS `prospect_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospect_lists` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `list_type` varchar(100) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `domain_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_prospect_list_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospect_lists`
--

LOCK TABLES `prospect_lists` WRITE;
/*!40000 ALTER TABLE `prospect_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospect_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospect_lists_prospects`
--

DROP TABLE IF EXISTS `prospect_lists_prospects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospect_lists_prospects` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `related_id` varchar(36) DEFAULT NULL,
  `related_type` varchar(25) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_plp_pro_id` (`prospect_list_id`),
  KEY `idx_plp_rel_id` (`related_id`,`related_type`,`prospect_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospect_lists_prospects`
--

LOCK TABLES `prospect_lists_prospects` WRITE;
/*!40000 ALTER TABLE `prospect_lists_prospects` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospect_lists_prospects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospects`
--

DROP TABLE IF EXISTS `prospects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospects` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT 0,
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `lawful_basis` text DEFAULT NULL,
  `date_reviewed` date DEFAULT NULL,
  `lawful_basis_source` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `birthdate` date DEFAULT NULL,
  `lead_id` char(36) DEFAULT NULL,
  `account_name` varchar(150) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prospect_auto_tracker_key` (`tracker_key`),
  KEY `idx_prospects_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_prospecs_del_last` (`last_name`,`deleted`),
  KEY `idx_prospects_id_del` (`id`,`deleted`),
  KEY `idx_prospects_assigned` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospects`
--

LOCK TABLES `prospects` WRITE;
/*!40000 ALTER TABLE `prospects` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospects_cstm`
--

DROP TABLE IF EXISTS `prospects_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospects_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT 0.00000000,
  `jjwg_maps_lat_c` float(10,8) DEFAULT 0.00000000,
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospects_cstm`
--

LOCK TABLES `prospects_cstm` WRITE;
/*!40000 ALTER TABLE `prospects_cstm` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospects_cstm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationships`
--

DROP TABLE IF EXISTS `relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relationships` (
  `id` char(36) NOT NULL,
  `relationship_name` varchar(150) DEFAULT NULL,
  `lhs_module` varchar(100) DEFAULT NULL,
  `lhs_table` varchar(64) DEFAULT NULL,
  `lhs_key` varchar(64) DEFAULT NULL,
  `rhs_module` varchar(100) DEFAULT NULL,
  `rhs_table` varchar(64) DEFAULT NULL,
  `rhs_key` varchar(64) DEFAULT NULL,
  `join_table` varchar(64) DEFAULT NULL,
  `join_key_lhs` varchar(64) DEFAULT NULL,
  `join_key_rhs` varchar(64) DEFAULT NULL,
  `relationship_type` varchar(64) DEFAULT NULL,
  `relationship_role_column` varchar(64) DEFAULT NULL,
  `relationship_role_column_value` varchar(50) DEFAULT NULL,
  `reverse` tinyint(1) DEFAULT 0,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_rel_name` (`relationship_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationships`
--

LOCK TABLES `relationships` WRITE;
/*!40000 ALTER TABLE `relationships` DISABLE KEYS */;
INSERT INTO `relationships` VALUES ('103edc12-b8a8-4586-0cbe-5d4dc1845539','emails_prospects_rel','Emails','emails','id','Prospects','prospects','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Prospects',0,0),('108b7b52-17f9-e9cc-7743-5d4dc19d37c8','securitygroups_accounts','SecurityGroups','securitygroups','id','Accounts','accounts','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Accounts',0,0),('115cac6a-89ba-92bd-be4b-5d4dc1af50ae','fp_event_locations_modified_user','Users','users','id','FP_Event_Locations','fp_event_locations','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('118d8b2c-1f7d-d55a-b7b7-5d4dc1828d1b','securitygroups_surveyquestionoptions','SecurityGroups','securitygroups','id','SurveyQuestionOptions','surveyquestionoptions','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','SurveyQuestionOptions',0,0),('11fb1990-e183-3a51-4036-5d4dc1008945','aos_quotes_assigned_user','Users','users','id','AOS_Quotes','aos_quotes','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('122f8e42-5439-783b-3da5-5d4dc1edbecc','tasks_notes','Tasks','tasks','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('132f45ea-f901-37fd-6acc-5d4dc1e58086','aos_contracts_created_by','Users','users','id','AOS_Contracts','aos_contracts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('14747ab9-487b-99cb-7d2c-5d4dc17ab5bf','surveyresponses_surveyquestionresponses','SurveyResponses','surveyresponses','id','SurveyQuestionResponses','surveyquestionresponses','surveyresponse_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('15800366-ce06-355b-6be3-5d4dc1968e98','calls_reschedule_created_by','Users','users','id','Calls_Reschedule','calls_reschedule','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('15e83298-9b78-4853-43db-5d4dc0d4b690','lead_emails','Leads','leads','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('16148a34-97c1-e42a-7488-5d4dc1cafc0a','aobh_businesshours_modified_user','Users','users','id','AOBH_BusinessHours','aobh_businesshours','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('161b9576-8e47-ec16-42c5-5d4dc1ca1178','project_tasks_tasks','ProjectTask','project_task','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('16555c97-22e2-6c38-1e36-5d4dc17e6c5f','fp_events_fp_event_locations_1','FP_events','fp_events','id','FP_Event_Locations','fp_event_locations','id','fp_events_fp_event_locations_1_c','fp_events_fp_event_locations_1fp_events_ida','fp_events_fp_event_locations_1fp_event_locations_idb','many-to-many',NULL,NULL,0,0),('17a05db3-49e6-74b1-d5b8-5d4dc130560f','contact_tasks','Contacts','contacts','id','Tasks','tasks','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('17cdaba7-2ff5-58b0-cbe9-5d4dc1e99470','aos_product_categories_created_by','Users','users','id','AOS_Product_Categories','aos_product_categories','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('17f6ac6d-9259-28a3-4548-5d4dc162051e','emails_assigned_user','Users','users','id','Emails','emails','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('193989ed-5481-bad8-9bb1-5d4dc1433754','favorites_created_by','Users','users','id','Favorites','favorites','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1b6314a5-42d1-42f6-9a75-5d4dc1b7a2e0','campaignlog_targeted_users','CampaignLog','campaign_log','target_id','Users','users','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1bab6d4f-097c-910d-7736-5d4dc1edb160','securitygroups_modified_user','Users','users','id','SecurityGroups','securitygroups','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1ca34c9e-8186-8c01-2d23-5d4dc1b9e994','meetings_contacts','Meetings','meetings','id','Contacts','contacts','id','meetings_contacts','meeting_id','contact_id','many-to-many',NULL,NULL,0,0),('1cb2f396-4aca-9029-b1b3-5d4dc1495b3d','campaign_campaignlog','Campaigns','campaigns','id','CampaignLog','campaign_log','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1cd13030-67dc-9b65-c90e-5d4dc108b671','accounts_email_addresses','Accounts','accounts','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Accounts',0,0),('1d3a02cd-d71b-4f9f-a7d4-5d4dc129280d','email_marketing_prospect_lists','EmailMarketing','email_marketing','id','ProspectLists','prospect_lists','id','email_marketing_prospect_lists','email_marketing_id','prospect_list_id','many-to-many',NULL,NULL,0,0),('1d5f855d-0ef6-fde2-0dff-5d4dc187cb04','aop_case_updates_notes','AOP_Case_Updates','aop_case_updates','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','AOP_Case_Updates',0,0),('1dccd37e-b3bf-c460-66b1-5d4dc1db1d00','fp_event_locations_created_by','Users','users','id','FP_Event_Locations','fp_event_locations','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1df1c79f-a399-e921-5f36-5d4dc15c91d3','securitygroups_aos_quotes','SecurityGroups','securitygroups','id','AOS_Quotes','aos_quotes','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOS_Quotes',0,0),('1f400bb6-d8b4-10b2-34fc-5d4dc16c8b51','securitygroups_jjwg_maps','SecurityGroups','securitygroups','id','jjwg_Maps','jjwg_maps','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','jjwg_Maps',0,0),('1f673fdf-6515-1fe0-1e30-5d4dc12fd669','aos_contracts_assigned_user','Users','users','id','AOS_Contracts','aos_contracts','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2046ca38-9f20-d26e-2eab-5d4dc11af3cd','accounts_bugs','Accounts','accounts','id','Bugs','bugs','id','accounts_bugs','account_id','bug_id','many-to-many',NULL,NULL,0,0),('20da25dd-b870-deb2-6b10-5d4dc1b71167','surveys_modified_user','Users','users','id','Surveys','surveys','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('22109717-9c99-36b2-0fe0-5d4dc0cd6a64','lead_campaign_log','Leads','leads','id','CampaignLog','campaign_log','target_id',NULL,NULL,NULL,'one-to-many','target_type','Leads',0,0),('224b2777-7b63-9144-fb9b-5d4dc1736fe6','aobh_businesshours_created_by','Users','users','id','AOBH_BusinessHours','aobh_businesshours','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('226c5bb9-e2b9-cb41-c0f1-5d4dc114f11c','fp_events_leads_1','FP_events','fp_events','id','Leads','leads','id','fp_events_leads_1_c','fp_events_leads_1fp_events_ida','fp_events_leads_1leads_idb','many-to-many',NULL,NULL,0,0),('24261f83-f6bc-5f7d-7092-5d4dc158eba8','contact_tasks_parent','Contacts','contacts','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Contacts',0,0),('24268166-266c-bd2c-0796-5d4dc1fb2ad7','aos_product_categories_assigned_user','Users','users','id','AOS_Product_Categories','aos_product_categories','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('242ee042-608a-7121-3b5d-5d4dc18b0093','project_tasks_meetings','ProjectTask','project_task','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('244fa966-ab0c-2c07-4c1a-5d4dc1a4a4d7','securitygroups_emails','SecurityGroups','securitygroups','id','Emails','emails','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Emails',0,0),('256a3dc5-2be2-1e3c-3396-5d4dc1d881fe','favorites_assigned_user','Users','users','id','Favorites','favorites','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('27aadd4a-1b78-0571-b9bc-5d4dc15bf415','jjwg_Maps_meetings','jjwg_Maps','jjwg_Maps','parent_id','Meetings','meetings','id',NULL,NULL,NULL,'one-to-many','parent_type','Meetings',0,0),('27c1cfd7-a067-067f-3e30-5d4dc1e8d045','securitygroups_created_by','Users','users','id','SecurityGroups','securitygroups','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('288eac62-3555-6f9f-66ad-5d4dc1bf52cd','campaignlog_sent_emails','CampaignLog','campaign_log','related_id','Emails','emails','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('28e9d34c-abf6-8d77-c257-5d4dc16c366f','meetings_users','Meetings','meetings','id','Users','users','id','meetings_users','meeting_id','user_id','many-to-many',NULL,NULL,0,0),('290d6082-c4a1-4cbd-0eb8-5d4dc1f813e6','accounts_email_addresses_primary','Accounts','accounts','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('29940d97-aeaa-8459-32bc-5d4dc115c6ee','leads_documents','Leads','leads','id','Documents','documents','id','linked_documents','parent_id','document_id','many-to-many','parent_type','Leads',0,0),('29c01389-4617-7a7b-ae12-5d4dc1d0f2ae','campaign_assigned_user','Users','users','id','Campaigns','campaigns','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('29d43ca4-3c1c-2711-decc-5d4dc1ff5f9d','aor_reports_modified_user','Users','users','id','AOR_Reports','aor_reports','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2a228bb6-ffac-b66f-74c5-5d4dc1cd86e9','fp_event_locations_assigned_user','Users','users','id','FP_Event_Locations','fp_event_locations','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2a3855ae-a4bb-6923-ba51-5d4dc1525505','aos_quotes_aos_product_quotes','AOS_Quotes','aos_quotes','id','AOS_Products_Quotes','aos_products_quotes','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2bd8012b-b03d-ca03-588a-5d4dc17ecc1e','securitygroups_aos_contracts','SecurityGroups','securitygroups','id','AOS_Contracts','aos_contracts','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOS_Contracts',0,0),('2c8bc817-2784-77bc-f2e4-5d4dc141ae82','accounts_contacts','Accounts','accounts','id','Contacts','contacts','id','accounts_contacts','account_id','contact_id','many-to-many',NULL,NULL,0,0),('2e6109af-57da-dc0d-59c6-5d4dc1c171b8','campaignlog_lead','CampaignLog','campaign_log','related_id','Leads','leads','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2e800112-fc95-7d9b-fccb-5d4dc12352f4','fp_events_prospects_1','FP_events','fp_events','id','Prospects','prospects','id','fp_events_prospects_1_c','fp_events_prospects_1fp_events_ida','fp_events_prospects_1prospects_idb','many-to-many',NULL,NULL,0,0),('2ef361cd-edde-45d7-5cd1-5d4dc17c32dc','sugarfeed_modified_user','Users','users','id','SugarFeed','sugarfeed','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3071a401-03df-0ac9-b563-5d4dc147e21d','emails_notes_rel','Emails','emails','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('30902f50-6d96-1d96-df5f-5d4dc14c173c','project_tasks_calls','ProjectTask','project_task','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('3094a777-aa95-6225-a30e-5d4dc1485c52','securitygroups_aos_product_categories','SecurityGroups','securitygroups','id','AOS_Product_Categories','aos_product_categories','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOS_Product_Categories',0,0),('30b9410d-2e06-5c3e-ab3c-5d4dc13ea036','surveys_created_by','Users','users','id','Surveys','surveys','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('30ef8bc3-7f01-bb5d-5c1c-5d4dc17838f3','contact_notes_parent','Contacts','contacts','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Contacts',0,0),('31c5834a-26bb-1b77-33ce-5d4dc1831dd0','aok_knowledge_base_categories_modified_user','Users','users','id','AOK_Knowledge_Base_Categories','aok_knowledge_base_categories','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('320ed523-768d-d1c0-c025-5d4dc1dacd0f','jjwg_markers_assigned_user','Users','users','id','jjwg_Markers','jjwg_markers','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('338799f7-9442-238b-d497-5d4dc1034cb7','jjwg_Maps_accounts','jjwg_Maps','jjwg_Maps','parent_id','Accounts','accounts','id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('33ed5a41-aa26-d537-bb8a-5d4dc1fc2528','securitygroups_assigned_user','Users','users','id','SecurityGroups','securitygroups','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('34eed2b4-8a65-37b2-800c-5d4dc16c8c1c','meetings_leads','Meetings','meetings','id','Leads','leads','id','meetings_leads','meeting_id','lead_id','many-to-many',NULL,NULL,0,0),('352de15d-8d63-829d-f2f9-5d4dc1afe2b3','securitygroups_project','SecurityGroups','securitygroups','id','Project','project','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Project',0,0),('355bb356-bea7-a07e-99ec-5d4dc1363b6f','member_accounts','Accounts','accounts','id','Accounts','accounts','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('35cf925a-6f2a-a26e-f2c3-5d4dc1154a3b','documents_accounts','Documents','documents','id','Accounts','accounts','id','documents_accounts','document_id','account_id','many-to-many',NULL,NULL,0,0),('36443051-56aa-68d1-11f9-5d4dc12becc0','aos_quotes_aos_line_item_groups','AOS_Quotes','aos_quotes','id','AOS_Line_Item_Groups','aos_line_item_groups','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('36565443-d43c-0a12-0aeb-5d4dc1f0b8de','campaign_modified_user','Users','users','id','Campaigns','campaigns','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('36743789-11ce-1c37-0da9-5d4dc1d2623f','securitygroups_fp_event_locations','SecurityGroups','securitygroups','id','FP_Event_Locations','fp_event_locations','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','FP_Event_Locations',0,0),('37c15903-795a-9c59-9b8d-5d4dc109e33e','bugs_modified_user','Users','users','id','Bugs','bugs','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('38379964-aa33-49be-0f33-5d4dc15ee718','aos_contracts_tasks','AOS_Contracts','aos_contracts','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','AOS_Contracts',0,0),('387bcc03-55da-bfca-2260-5d4dc1e8de07','accounts_opportunities','Accounts','accounts','id','Opportunities','opportunities','id','accounts_opportunities','account_id','opportunity_id','many-to-many',NULL,NULL,0,0),('39940477-c430-2426-75e4-5d4dc13a9a42','campaign_email_marketing','Campaigns','campaigns','id','EmailMarketing','email_marketing','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3ab858f3-73cd-f68e-01d0-5d4dc1a51bd4','jjwg_maps_jjwg_areas','jjwg_Maps','jjwg_maps','id','jjwg_Areas','jjwg_areas','id','jjwg_maps_jjwg_areas_c','jjwg_maps_5304wg_maps_ida','jjwg_maps_41f2g_areas_idb','many-to-many',NULL,NULL,0,0),('3b241cbe-f28a-6c98-1517-5d4dc186986e','sugarfeed_created_by','Users','users','id','SugarFeed','sugarfeed','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3c9aa9f0-7e70-b001-cf2e-5d4dc1e0b277','emails_contacts_rel','Emails','emails','id','Contacts','contacts','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Contacts',0,0),('3cd26340-5a64-57fe-d0bc-5d4dc1435216','sub_product_categories','AOS_Product_Categories','aos_product_categories','id','AOS_Product_Categories','aos_product_categories','parent_category_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3cf631ed-6f2f-2618-53c6-5d4dc13ffddb','surveys_assigned_user','Users','users','id','Surveys','surveys','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3d5fe60b-a5d9-24c0-087e-5d4dc1bdfbe9','contact_campaign_log','Contacts','contacts','id','CampaignLog','campaign_log','target_id',NULL,NULL,NULL,'one-to-many','target_type','Contacts',0,0),('3db60a6d-a6eb-6c65-a8a0-5d4dc1f1330a','emails_projects_rel','Emails','emails','id','Project','project','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Project',0,0),('3dee4bf7-8f14-afb8-95bb-5d4dc1f499ef','opportunities_modified_user','Users','users','id','Opportunities','opportunities','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3e0f70f9-7d34-8799-a51a-5d4dc141862d','aok_knowledge_base_categories_created_by','Users','users','id','AOK_Knowledge_Base_Categories','aok_knowledge_base_categories','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3e72ccc8-0c9b-9550-0816-5d4dc1d55ec4','project_tasks_emails','ProjectTask','project_task','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('402c1ff9-cfee-b83e-2fb5-5d4dc1268460','outbound_email_modified_user','Users','users','id','OutboundEmailAccounts','outbound_email','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('403efff4-84e4-a147-beca-5d4dc15f39f4','aor_reports_created_by','Users','users','id','AOR_Reports','aor_reports','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('40f993f2-1c05-204f-ff79-5d4dc1acb849','opportunities_contacts','Opportunities','opportunities','id','Contacts','contacts','id','opportunities_contacts','opportunity_id','contact_id','many-to-many',NULL,NULL,0,0),('4196040f-a3a0-3d22-3402-5d4dc100a8d0','accounts_assigned_user','Users','users','id','Accounts','accounts','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('41bfd76e-5482-d00c-62b8-5d4dc1efb93b','account_cases','Accounts','accounts','id','Cases','cases','account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4238053a-49ca-a80e-d6ce-5d4dc19dd6ff','documents_contacts','Documents','documents','id','Contacts','contacts','id','documents_contacts','document_id','contact_id','many-to-many',NULL,NULL,0,0),('4270c8d8-af2f-f355-9c29-5d4dc12ebe28','alerts_modified_user','Users','users','id','Alerts','alerts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('42790903-b069-e68a-e2b3-5d4dc16952a1','surveyresponses_campaigns','Campaigns','campaigns','id','SurveyResponses','surveyresponses','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('42ee2f3b-c9d1-c2c0-2e8c-5d4dc1ceb174','projects_notes','Project','project','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('433f53b8-8885-86c3-df8c-5d4dc1417eb2','aow_actions_modified_user','Users','users','id','AOW_Actions','aow_actions','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('43c046bb-bc53-83a6-8a48-5d4dc1bda2a7','optimistic_locking',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),('44868a6c-1776-7e83-e3f3-5d4dc1ac50ac','calls_contacts','Calls','calls','id','Contacts','contacts','id','calls_contacts','call_id','contact_id','many-to-many',NULL,NULL,0,0),('44a7784a-4ff4-a2a3-549d-5d4dc1c87079','aos_contracts_notes','AOS_Contracts','aos_contracts','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','AOS_Contracts',0,0),('44fe10d4-7d91-8150-7ea7-5d4dc1771bcc','bugs_created_by','Users','users','id','Bugs','bugs','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('46b054ea-19f5-613a-6389-5d4dc16dc45e','jjwg_maps_jjwg_markers','jjwg_Maps','jjwg_maps','id','jjwg_Markers','jjwg_markers','id','jjwg_maps_jjwg_markers_c','jjwg_maps_b229wg_maps_ida','jjwg_maps_2e31markers_idb','many-to-many',NULL,NULL,0,0),('47db83b2-daf1-7fed-ccf1-5d4dc1488732','sugarfeed_assigned_user','Users','users','id','SugarFeed','sugarfeed','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('48d69a85-4ec9-dcff-7ac8-5d4dc1c0c1cd','emails_accounts_rel','Emails','emails','id','Accounts','accounts','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Accounts',0,0),('493896d7-840b-0e72-303a-5d4dc1f0b4ee','securitygroups_emailtemplates','SecurityGroups','securitygroups','id','EmailTemplates','email_templates','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','EmailTemplates',0,0),('49435de9-7ddf-e481-29b7-5d4dc1e598de','securitygroups_surveys','SecurityGroups','securitygroups','id','Surveys','surveys','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Surveys',0,0),('4962e437-719d-29f6-edaf-5d4dc176684d','aos_products_modified_user','Users','users','id','AOS_Products','aos_products','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('49fa3935-f63e-2ee6-be3d-5d4dc134abf8','contact_aos_quotes','Contacts','contacts','id','AOS_Quotes','aos_quotes','billing_contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4a5df542-4601-f3b2-173e-5d4dc10d2015','aok_knowledge_base_categories_assigned_user','Users','users','id','AOK_Knowledge_Base_Categories','aok_knowledge_base_categories','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4a60e21e-07d7-cb4f-f95b-5d4dc1758dfa','opportunities_created_by','Users','users','id','Opportunities','opportunities','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4aeb0902-6e73-66c5-3fd3-5d4dc178682e','securitygroups_fp_events','SecurityGroups','securitygroups','id','FP_events','fp_events','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','FP_events',0,0),('4b25f67c-7b19-759a-bcd9-5d4dc1d03005','project_tasks_assigned_user','Users','users','id','ProjectTask','project_task','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4caf4c93-e9d6-c2a8-0a22-5d4dc197c215','aor_reports_assigned_user','Users','users','id','AOR_Reports','aor_reports','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4cbe3037-83fd-0a13-ecae-5d4dc1d98357','outbound_email_created_by','Users','users','id','OutboundEmailAccounts','outbound_email','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4d1ef10b-52b7-954f-6e97-5d4dc15b130a','prospect_list_campaigns','ProspectLists','prospect_lists','id','Campaigns','campaigns','id','prospect_list_campaigns','prospect_list_id','campaign_id','many-to-many',NULL,NULL,0,0),('4e0548a5-7239-5a54-fae0-5d4dc1d771fc','account_tasks','Accounts','accounts','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('4e37dda3-0abe-d600-c1b1-5d4dc1d4077f','documents_opportunities','Documents','documents','id','Opportunities','opportunities','id','documents_opportunities','document_id','opportunity_id','many-to-many',NULL,NULL,0,0),('4f0212b0-6eec-90b8-5824-5d4dc1180411','alerts_created_by','Users','users','id','Alerts','alerts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4f5419da-0aaa-056e-8a9a-5d4dc1f4a0fa','prospectlists_assigned_user','Users','users','id','prospectlists','prospect_lists','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4f773e7d-07ef-d842-171e-5d4dc1e9b2c6','aow_actions_created_by','Users','users','id','AOW_Actions','aow_actions','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4fe7493c-d8ff-7c4d-61b1-5d4dc1813419','projects_tasks','Project','project','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('4fe98cff-932f-580b-b082-5d4dc1942858','unified_search',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),('509dac88-5cd4-2c45-b9bc-5d4dc1dd9f87','calls_users','Calls','calls','id','Users','users','id','calls_users','call_id','user_id','many-to-many',NULL,NULL,0,0),('5113cff7-caf5-a24b-77fd-5d4dc15906eb','bugs_assigned_user','Users','users','id','Bugs','bugs','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('512098fe-4b15-24ab-e857-5d4dc194abf0','aos_contracts_meetings','AOS_Contracts','aos_contracts','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','AOS_Contracts',0,0),('51381aac-9e76-c0f3-8aa6-5d4dc100c306','email_template_email_marketings','EmailTemplates','email_templates','id','EmailMarketing','email_marketing','template_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5180080a-bf6d-73c1-e245-5d4dc19fee50','am_tasktemplates_assigned_user','Users','users','id','AM_TaskTemplates','am_tasktemplates','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('52b20417-9b30-253c-0832-5d4dc1d7d700','surveyquestionoptions_surveyquestionresponses','SurveyQuestionOptions','surveyquestionoptions','id','SurveyQuestionResponses','surveyquestionresponses','id','surveyquestionoptions_surveyquestionresponses','surveyq72c7options_ida','surveyq10d4sponses_idb','many-to-many',NULL,NULL,0,0),('52d01b95-32e5-8b98-f3f5-5d4dc11c17ac','project_contacts_1','Project','project','id','Contacts','contacts','id','project_contacts_1_c','project_contacts_1project_ida','project_contacts_1contacts_idb','many-to-many',NULL,NULL,0,0),('53b08be8-1303-9caa-0adc-5d4dc169a454','jjwg_Maps_prospects','jjwg_Maps','jjwg_Maps','parent_id','Prospects','prospects','id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('5444cb92-1aaf-b63f-d8c4-5d4dc1918383','eapm_modified_user','Users','users','id','EAPM','eapm','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('55111649-e1ba-9aac-f5b3-5d4dc1980747','emails_leads_rel','Emails','emails','id','Leads','leads','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Leads',0,0),('5598ecae-aecc-8e0d-b99f-5d4dc1cc747d','emailtemplates_assigned_user','Users','users','id','EmailTemplates','email_templates','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('55e39b0d-7533-92e1-ad82-5d4dc1bad887','aos_products_created_by','Users','users','id','AOS_Products','aos_products','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('560d6977-7370-2b62-548b-5d4dc13cad9d','surveys_surveyquestions','Surveys','surveys','id','SurveyQuestions','surveyquestions','survey_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5614bfaf-b106-0e7e-7430-5d4dc113761e','contact_aos_invoices','Contacts','contacts','id','AOS_Invoices','aos_invoices','billing_contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('56bafac5-86eb-aedf-0765-5d4dc123b0dc','aok_knowledgebase_modified_user','Users','users','id','AOK_KnowledgeBase','aok_knowledgebase','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('56c23c66-15be-3d5f-1d38-5d4dc134e1c0','opportunities_assigned_user','Users','users','id','Opportunities','opportunities','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('579943e6-923d-c2cc-b613-5d4dc1db99ce','project_tasks_modified_user','Users','users','id','ProjectTask','project_task','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5807008a-78d3-fa41-cbf0-5d4dc13a287c','surveyquestionoptions_assigned_user','Users','users','id','SurveyQuestionOptions','surveyquestionoptions','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('58adc444-5b6c-44c5-d2c9-5d4dc1a15907','securitygroups_aor_reports','SecurityGroups','securitygroups','id','AOR_Reports','aor_reports','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOR_Reports',0,0),('5915a9b0-56a0-5057-af74-5d4dc1b0e14e','outbound_email_assigned_user','Users','users','id','OutboundEmailAccounts','outbound_email','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('597560a6-dbcb-44df-55f3-5d4dc1ebb917','prospect_list_contacts','ProspectLists','prospect_lists','id','Contacts','contacts','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Contacts',0,0),('5a3e27ac-0894-1989-33b4-5d4dc10e1f6b','account_notes','Accounts','accounts','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('5aa45546-42b4-289f-6fac-5d4dc1a68a0f','documents_cases','Documents','documents','id','Cases','cases','id','documents_cases','document_id','case_id','many-to-many',NULL,NULL,0,0),('5b8e4d99-f87c-0fba-0a55-5d4dc1f64043','securitygroups_prospectlists','SecurityGroups','securitygroups','id','ProspectLists','prospect_lists','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','ProspectLists',0,0),('5b9403ca-c233-b871-c60c-5d4dc121cd4d','aos_quotes_created_by','Users','users','id','AOS_Quotes','aos_quotes','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5bb3cb9c-3212-8fb9-9819-5d4dc12c6c18','alerts_assigned_user','Users','users','id','Alerts','alerts','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5bdcd39a-9ea9-c831-2a1c-5d4dc15f87d5','aow_workflow_modified_user','Users','users','id','AOW_WorkFlow','aow_workflow','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5c64f7cf-adc5-7ff4-0801-5d4dc130bc72','projects_meetings','Project','project','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('5c72758c-60f8-55ee-8ee1-5d4dc1f6ae7b','aod_indexevent_modified_user','Users','users','id','AOD_IndexEvent','aod_indexevent','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5d0bfb7b-d4ed-7300-6a13-5d4dc16772de','calls_leads','Calls','calls','id','Leads','leads','id','calls_leads','call_id','lead_id','many-to-many',NULL,NULL,0,0),('5d1beffa-8a5e-01e5-be3b-5d4dc12d2db6','securitygroups_bugs','SecurityGroups','securitygroups','id','Bugs','bugs','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Bugs',0,0),('5d9af917-6a79-c6a1-8347-5d4dc1d863a8','aos_contracts_calls','AOS_Contracts','aos_contracts','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','AOS_Contracts',0,0),('5df93ccf-7595-c093-997c-5d4dc1a7f81b','campaign_campaigntrakers','Campaigns','campaigns','id','CampaignTrackers','campaign_trkrs','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5ed276c8-ccdb-d184-f9fb-5d4dc1ac200b','securitygroups_jjwg_markers','SecurityGroups','securitygroups','id','jjwg_Markers','jjwg_markers','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','jjwg_Markers',0,0),('5eeb5d8e-cc69-0efe-95e0-5d4dc1db3cab','project_users_1','Project','project','id','Users','users','id','project_users_1_c','project_users_1project_ida','project_users_1users_idb','many-to-many',NULL,NULL,0,0),('5f4f63dc-c353-cbc2-7182-5d4dc1615880','jjwg_Maps_contacts','jjwg_Maps','jjwg_Maps','parent_id','Contacts','contacts','id',NULL,NULL,NULL,'one-to-many','parent_type','Contacts',0,0),('5faa0036-446c-f37f-d12b-5d4dc18d0a53','securitygroups_tasks','SecurityGroups','securitygroups','id','Tasks','tasks','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Tasks',0,0),('60845f3c-1bd2-9ff6-62c2-5d4dc1199db3','eapm_created_by','Users','users','id','EAPM','eapm','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6173ac79-cc42-a298-15e8-5d4dc17ad0f0','emails_aos_contracts_rel','Emails','emails','id','AOS_Contracts','aos_contracts','id','emails_beans','email_id','bean_id','many-to-many','bean_module','AOS_Contracts',0,0),('6209098a-44bf-6b61-2e5c-5d4dc1ecc413','contact_aos_contracts','Contacts','contacts','id','AOS_Contracts','aos_contracts','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6210d933-e9d2-819c-9f34-5d4dc14973c9','aos_products_assigned_user','Users','users','id','AOS_Products','aos_products','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('624021cb-babb-854a-37f5-5d4dc1f94866','notes_assigned_user','Users','users','id','Notes','notes','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('62dcec82-8513-36fa-bd8b-5d4dc1170663','securitygroups_opportunities','SecurityGroups','securitygroups','id','Opportunities','opportunities','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Opportunities',0,0),('62e50777-0d90-4544-d3f8-5d4dc15ae6b1','surveys_surveyresponses','Surveys','surveys','id','SurveyResponses','surveyresponses','survey_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('630b4dc6-8214-427f-b026-5d4dc19e826a','aok_knowledgebase_created_by','Users','users','id','AOK_KnowledgeBase','aok_knowledgebase','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('646e5dd1-482b-f900-85fc-5d4dc1b48d37','jjwg_maps_modified_user','Users','users','id','jjwg_Maps','jjwg_maps','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6516781d-bf1d-6455-40d9-5d4dc12d7dfe','aor_reports_aor_fields','AOR_Reports','aor_reports','id','AOR_Fields','aor_fields','aor_report_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('65bf7ac7-dcf3-453a-2369-5d4dc1aa2e0e','prospect_list_prospects','ProspectLists','prospect_lists','id','Prospects','prospects','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Prospects',0,0),('65e42653-19d6-24d6-9994-5d4dc11fac78','templatesectionline_modified_user','Users','users','id','TemplateSectionLine','templatesectionline','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6645ab2a-d959-2744-aab1-5d4dc17f18a4','account_meetings','Accounts','accounts','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('66ea2aa4-fd31-cd84-31b7-5d4dc1326b16','documents_bugs','Documents','documents','id','Bugs','bugs','id','documents_bugs','document_id','bug_id','many-to-many',NULL,NULL,0,0),('6772f5a6-6869-7577-d016-5d4dc10201ad','project_tasks_created_by','Users','users','id','ProjectTask','project_task','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('681d636f-827d-41f1-2e8a-5d4dc13a0e72','aow_workflow_created_by','Users','users','id','AOW_WorkFlow','aow_workflow','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('684b5ed5-b153-b99d-512d-5d4dc1ce8a68','prospects_modified_user','Users','users','id','Prospects','prospects','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('687a1e9a-e0bd-3511-701f-5d4dc1b679ed','documents_modified_user','Users','users','id','Documents','documents','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('68a4462f-9a71-0963-1e04-5d4dc1e30988','projects_calls','Project','project','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('6905996e-1cf5-f6c9-71df-5d4dc1cacf0c','aod_indexevent_created_by','Users','users','id','AOD_IndexEvent','aod_indexevent','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('696171b7-ec93-39ba-9003-5d4dc12b35aa','cases_bugs','Cases','cases','id','Bugs','bugs','id','cases_bugs','case_id','bug_id','many-to-many',NULL,NULL,0,0),('69775f1d-d7c5-95bb-953a-5d4dc1b5b189','bug_tasks','Bugs','bugs','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('699936fe-373a-0665-da10-5d4dc1629249','aos_contracts_aos_products_quotes','AOS_Contracts','aos_contracts','id','AOS_Products_Quotes','aos_products_quotes','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6a6584ff-4e47-a27e-fc90-5d4dc1a99c08','schedulers_created_by_rel','Users','users','id','Schedulers','schedulers','created_by',NULL,NULL,NULL,'one-to-one',NULL,NULL,0,0),('6ae0d261-3e31-8d4d-c7e3-5d4dc1a5a377','securitygroups_acl_roles','SecurityGroups','securitygroups','id','ACLRoles','acl_roles','id','securitygroups_acl_roles','securitygroup_id','role_id','many-to-many',NULL,NULL,0,0),('6ca38a95-0a96-3d70-70ea-5d4dc19836db','eapm_assigned_user','Users','users','id','EAPM','eapm','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6dca240d-af2a-8a88-9b66-5d4dc14ad25b','emails_meetings_rel','Emails','emails','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6e26e06c-32fa-635f-d35a-5d4dc1bb1b63','contacts_aop_case_updates','Contacts','contacts','id','AOP_Case_Updates','aop_case_updates','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6e3aaaf3-0b26-6476-0b4d-5d4dc199135c','securitygroups_aos_products','SecurityGroups','securitygroups','id','AOS_Products','aos_products','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOS_Products',0,0),('6eba7272-7c4a-e39d-1cb1-5d4dc199800e','securitygroups_notes','SecurityGroups','securitygroups','id','Notes','notes','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Notes',0,0),('6f6fd5a0-fba1-0427-4310-5d4dc1d88115','opportunity_calls','Opportunities','opportunities','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('704cca99-fc77-d3f0-adfc-5d4dc1220c74','surveyquestionresponses_modified_user','Users','users','id','SurveyQuestionResponses','surveyquestionresponses','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('708edb69-9776-de58-a229-5d4dc11f6623','aok_knowledgebase_assigned_user','Users','users','id','AOK_KnowledgeBase','aok_knowledgebase','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7124368c-b964-b961-8bbe-5d4dc175dcc0','aor_reports_aor_conditions','AOR_Reports','aor_reports','id','AOR_Conditions','aor_conditions','aor_report_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('712b0d4d-0151-973b-cc60-5d4dc15f3a7e','aos_contracts_modified_user','Users','users','id','AOS_Contracts','aos_contracts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7225aee7-aa3a-51cc-0075-5d4dc191f63e','prospect_list_leads','ProspectLists','prospect_lists','id','Leads','leads','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Leads',0,0),('729c2cb1-ee84-f1d8-009b-5d4dc1a67647','templatesectionline_created_by','Users','users','id','TemplateSectionLine','templatesectionline','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('72aec8b9-1442-82f7-9fad-5d4dc157c04a','account_calls','Accounts','accounts','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('7302ba6e-38a0-6843-017f-5d4dc14dd9e1','aok_knowledgebase_categories','AOK_KnowledgeBase','aok_knowledgebase','id','AOK_Knowledge_Base_Categories','aok_knowledge_base_categories','id','aok_knowledgebase_categories','aok_knowledgebase_id','aok_knowledge_base_categories_id','many-to-many',NULL,NULL,0,0),('732e09bd-5c91-1e1c-e7f0-5d4dc1ee0044','jjwg_Maps_projects','jjwg_Maps','jjwg_Maps','parent_id','Project','project','id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('74bcb917-e955-0af7-912f-5d4dc17155cf','aow_workflow_assigned_user','Users','users','id','AOW_WorkFlow','aow_workflow','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('74bd8e74-5220-1133-3903-5d4dc17e2b97','prospects_created_by','Users','users','id','Prospects','prospects','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('74f47611-8f69-652f-482a-5d4dc17d1fe1','projects_emails','Project','project','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('74f8f7c6-5ce2-6a95-12af-5d4dc16ce0a0','documents_created_by','Users','users','id','Documents','documents','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('752f04d6-50e6-a4f2-2c62-5d4dc14fcacb','campaigns_modified_user','Users','users','id','Campaigns','campaigns','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('756255d6-3447-d194-9a9a-5d4dc14c69fe','aod_indexevent_assigned_user','Users','users','id','AOD_IndexEvent','aod_indexevent','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7572afc8-8ff0-7c6f-d27d-5d4dc11ee54c','contacts_bugs','Contacts','contacts','id','Bugs','bugs','id','contacts_bugs','contact_id','bug_id','many-to-many',NULL,NULL,0,0),('75e22c69-9c38-ae08-cff9-5d4dc17d326c','aos_contracts_aos_line_item_groups','AOS_Contracts','aos_contracts','id','AOS_Line_Item_Groups','aos_line_item_groups','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('76488099-70dd-7a0b-a0fd-5d4dc1919c9f','jjwg_Maps_leads','jjwg_Maps','jjwg_Maps','parent_id','Leads','leads','id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('76c4e957-2943-8db4-e078-5d4dc16fd84a','schedulers_modified_user_id_rel','Users','users','id','Schedulers','schedulers','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('786a7486-854e-a533-30d1-5d4dc1588af9','bug_meetings','Bugs','bugs','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('78ea74c5-04e8-34ce-3aa2-5d4dc1865ec6','oauthkeys_modified_user','Users','users','id','OAuthKeys','oauth_consumer','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('79c30ec9-75d1-f57b-6249-5d4dc1f1d90b','securitygroups_surveyresponses','SecurityGroups','securitygroups','id','SurveyResponses','surveyresponses','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','SurveyResponses',0,0),('7a22eaf0-2fd3-05d9-7116-5d4dc1a03301','meetings_modified_user','Users','users','id','Meetings','meetings','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7a4d9b16-ac07-4827-6d0d-5d4dc14761e3','product_categories','AOS_Product_Categories','aos_product_categories','id','AOS_Products','aos_products','aos_product_category_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7ac9aaec-754b-e3fd-8437-5d4dc1ffb443','notes_modified_user','Users','users','id','Notes','notes','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7b8bf315-c855-854f-e6c9-5d4dc0460747','cases_modified_user','Users','users','id','Cases','cases','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7bf943a7-c164-3c70-e098-5d4dc1de1721','opportunity_meetings','Opportunities','opportunities','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('7ca7aec1-9cec-8635-28c4-5d4dc1b15c69','surveyquestionresponses_created_by','Users','users','id','SurveyQuestionResponses','surveyquestionresponses','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7cd3614f-efe7-256a-1905-5d4dc1fe08de','securitygroups_aok_knowledgebase','SecurityGroups','securitygroups','id','AOK_KnowledgeBase','aok_knowledgebase','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOK_KnowledgeBase',0,0),('7d262171-b655-cd46-9b5a-5d4dc1ab0381','jjwg_areas_modified_user','Users','users','id','jjwg_Areas','jjwg_areas','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7d6c6b1c-c7e0-3a10-ed34-5d4dc1bcf943','aor_scheduled_reports_aor_reports','AOR_Reports','aor_reports','id','AOR_Scheduled_Reports','aor_scheduled_reports','aor_report_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7ee597d4-da3d-b6cb-2785-5d4dc194641e','prospect_list_users','ProspectLists','prospect_lists','id','Users','users','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Users',0,0),('7f17fb3b-8a83-e91f-2a94-5d4dc1bd5952','oauth2tokens_modified_user','Users','users','id','OAuth2Tokens','oauth2tokens','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7f49b96b-534b-7b6b-ddd8-5d4dc1422ae8','account_emails','Accounts','accounts','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('7f6bfd86-27be-6e4b-ab86-5d4dc1691852','am_projecttemplates_project_1','AM_ProjectTemplates','am_projecttemplates','id','Project','project','id','am_projecttemplates_project_1_c','am_projecttemplates_project_1am_projecttemplates_ida','am_projecttemplates_project_1project_idb','many-to-many',NULL,NULL,0,0),('80d45399-fee7-8827-6ee9-5d4dc13ed6de','securitygroups_aow_workflow','SecurityGroups','securitygroups','id','AOW_WorkFlow','aow_workflow','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOW_WorkFlow',0,0),('814d57c8-c9fe-5156-1d64-5d4dc00d65c0','leads_modified_user','Users','users','id','Leads','leads','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8164608e-10a1-3b8b-f780-5d4dc1e75afc','documents_assigned_user','Users','users','id','Documents','documents','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('816e1a90-8a3a-36cc-ca6d-5d4dc1cf30d5','campaigns_created_by','Users','users','id','Campaigns','campaigns','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('81819336-7c6f-9956-396f-5d4dc105c67f','prospects_assigned_user','Users','users','id','Prospects','prospects','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('819e5a64-202a-1fc9-7018-5d4dc119eba7','projects_project_tasks','Project','project','id','ProjectTask','project_task','project_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('81dda13f-b73f-456a-c209-5d4dc11fae56','contacts_cases','Contacts','contacts','id','Cases','cases','id','contacts_cases','contact_id','case_id','many-to-many',NULL,NULL,0,0),('8248ea7f-f472-096e-20d6-5d4dc1142757','aod_index_modified_user','Users','users','id','AOD_Index','aod_index','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('82d4b441-c224-b7a0-c923-5d4dc12c9fa7','schedulers_jobs_rel','Schedulers','schedulers','id','SchedulersJobs','job_queue','scheduler_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8344ba64-6988-6969-c82e-5d4dc17c943e','aos_invoices_modified_user','Users','users','id','AOS_Invoices','aos_invoices','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('84f3d562-a457-5234-d629-5d4dc1b11b9d','bug_calls','Bugs','bugs','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('8561b3e1-0185-d299-5799-5d4dc138a154','oauthkeys_created_by','Users','users','id','OAuthKeys','oauth_consumer','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8644d149-d3c7-870f-54f3-5d4dc1266c33','meetings_created_by','Users','users','id','Meetings','meetings','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8764b1ad-5c56-fb2c-a2ad-5d4dc13cf5b7','aos_products_quotes_modified_user','Users','users','id','AOS_Products_Quotes','aos_products_quotes','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('880351a7-fdde-77ed-8707-5d4dc0ffd731','cases_created_by','Users','users','id','Cases','cases','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('88266526-9be4-db87-0679-5d4dc1268a39','opportunity_tasks','Opportunities','opportunities','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('89370b59-b8b9-6502-b004-5d4dc1e3033f','surveyquestionresponses_assigned_user','Users','users','id','SurveyQuestionResponses','surveyquestionresponses','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('89467228-b31f-37ec-7f82-5d4dc10a7dc6','reminders_modified_user','Users','users','id','Reminders','reminders','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('89b5b8e5-dc71-c2ae-e63a-5d4dc1b45eb5','aor_fields_modified_user','Users','users','id','AOR_Fields','aor_fields','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8a9ff759-6ece-ab82-1e7c-5d4dc1f069cd','jjwg_areas_created_by','Users','users','id','jjwg_Areas','jjwg_areas','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8b225b52-bce2-e9a1-d5cb-5d4dc12b8f60','prospect_list_accounts','ProspectLists','prospect_lists','id','Accounts','accounts','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Accounts',0,0),('8b77ed15-1617-3068-8af0-5d4dc1dc9d4f','oauth2tokens_created_by','Users','users','id','OAuth2Tokens','oauth2tokens','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8b92e396-245b-eaef-d743-5d4dc1654ab2','account_leads','Accounts','accounts','id','Leads','leads','account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8bcd742a-d4e0-121b-9836-5d4dc1d5d3a4','am_projecttemplates_contacts_1','AM_ProjectTemplates','am_projecttemplates','id','Contacts','contacts','id','am_projecttemplates_contacts_1_c','am_projecttemplates_ida','contacts_idb','many-to-many',NULL,NULL,0,0),('8ce74c3d-58c2-c1bd-ddc1-5d4dc1a7fb28','aow_workflow_aow_conditions','AOW_WorkFlow','aow_workflow','id','AOW_Conditions','aow_conditions','aow_workflow_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8db0eee2-e9bf-cf1d-2e3a-5d4dc101e49d','campaigns_assigned_user','Users','users','id','Campaigns','campaigns','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8de30f74-0177-078a-6be7-5d4dc1a13f23','securitygroups_documents','SecurityGroups','securitygroups','id','Documents','documents','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Documents',0,0),('8dedcebc-1f78-7b4f-1b60-5d4dc1809928','contacts_users','Contacts','contacts','id','Users','users','id','contacts_users','contact_id','user_id','many-to-many',NULL,NULL,0,0),('8defdf63-60ff-bccd-31c4-5d4dc0791497','leads_created_by','Users','users','id','Leads','leads','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8df2e77b-cc7e-a334-78d6-5d4dc141e4f7','projects_assigned_user','Users','users','id','Project','project','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8e0f809a-22d2-e187-02e1-5d4dc1c83d91','securitygroups_prospects','SecurityGroups','securitygroups','id','Prospects','prospects','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Prospects',0,0),('8e61d858-92b4-a377-1d4c-5d4dc1c697ba','aod_index_created_by','Users','users','id','AOD_Index','aod_index','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8f333934-ffd2-1470-71ff-5d4dc107e76b','schedulersjobs_assigned_user','Users','users','id','SchedulersJobs','job_queue','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8f782bb6-6cc2-1f2f-3490-5d4dc117e41b','aos_invoices_created_by','Users','users','id','AOS_Invoices','aos_invoices','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('91bba6e0-0a13-da10-ed1b-5d4dc17e6165','oauthkeys_assigned_user','Users','users','id','OAuthKeys','oauth_consumer','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('91c26d8f-aac4-9a07-0155-5d4dc13ce559','bug_emails','Bugs','bugs','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('927c005f-5a24-b9a7-2258-5d4dc1f626e4','project_tasks_notes','ProjectTask','project_task','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('9286cb7a-df0b-d25d-a2f6-5d4dc18cc20a','meetings_assigned_user','Users','users','id','Meetings','meetings','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('93f91d80-741b-658c-b314-5d4dc1dc4c3a','aos_products_quotes_created_by','Users','users','id','AOS_Products_Quotes','aos_products_quotes','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('94442023-8d27-467f-4811-5d4dc0119386','cases_assigned_user','Users','users','id','Cases','cases','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('949eed91-7156-dfb1-0be3-5d4dc1bb8704','opportunity_notes','Opportunities','opportunities','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('9571f3c6-19c0-1a1b-644b-5d4dc15be667','reminders_created_by','Users','users','id','Reminders','reminders','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('95bf22cc-76a9-1066-56ec-5d4dc13a841a','aor_fields_created_by','Users','users','id','AOR_Fields','aor_fields','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('95bfd2b5-2437-d24f-0408-5d4dc11de36c','securitygroups_surveyquestionresponses','SecurityGroups','securitygroups','id','SurveyQuestionResponses','surveyquestionresponses','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','SurveyQuestionResponses',0,0),('96b0379f-c555-8780-31b9-5d4dc1852b49','notes_created_by','Users','users','id','Notes','notes','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('96e30e0a-9c2b-0884-f79e-5d4dc1b6fb98','securitygroups_spots','SecurityGroups','securitygroups','id','Spots','spots','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Spots',0,0),('97281d17-efc3-fc2a-24e7-5d4dc1f0f5bf','jjwg_areas_assigned_user','Users','users','id','jjwg_Areas','jjwg_areas','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('97776368-d105-93df-4ecd-5d4dc18db9d0','roles_users','Roles','roles','id','Users','users','id','roles_users','role_id','user_id','many-to-many',NULL,NULL,0,0),('97c57b7f-2b16-51ad-f69b-5d4dc141e1b3','account_campaign_log','Accounts','accounts','id','CampaignLog','campaign_log','target_id',NULL,NULL,NULL,'one-to-many','target_type','Accounts',0,0),('97e1cba8-5489-7919-d94e-5d4dc17224d7','am_projecttemplates_users_1','AM_ProjectTemplates','am_projecttemplates','id','Users','users','id','am_projecttemplates_users_1_c','am_projecttemplates_ida','users_idb','many-to-many',NULL,NULL,0,0),('97e8ad1d-1b18-fc5b-1ec9-5d4dc10141c8','oauth2tokens_assigned_user','Users','users','id','OAuth2Tokens','oauth2tokens','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9827089b-ce35-7bd9-34b7-5d4dc0a9a378','lead_calls','Leads','leads','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('999d02b9-2464-8f0d-24d0-5d4dc1e000e4','aow_workflow_aow_actions','AOW_WorkFlow','aow_workflow','id','AOW_Actions','aow_actions','aow_workflow_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9a189e82-3459-aff3-9910-5d4dc19c5d87','document_revisions','Documents','documents','id','DocumentRevisions','document_revisions','document_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9a199d34-8258-59be-53e9-5d4dc1e6519a','projects_modified_user','Users','users','id','Project','project','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9a46a13b-3565-fed6-bc42-5d4dc1d4043a','prospects_email_addresses','Prospects','prospects','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Prospects',0,0),('9a5385d3-32f1-3dfb-f20f-5d4dc1940484','securitygroups_campaigns','SecurityGroups','securitygroups','id','Campaigns','campaigns','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Campaigns',0,0),('9a66bd18-a215-30de-7f03-5d4dc0773d3d','leads_assigned_user','Users','users','id','Leads','leads','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9b260bae-f9a1-848c-201d-5d4dc1581ac3','aod_index_assigned_user','Users','users','id','AOD_Index','aod_index','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9bb30af7-fc6a-da1e-3de1-5d4dc1d87c9f','acl_roles_users','ACLRoles','acl_roles','id','Users','users','id','acl_roles_users','role_id','user_id','many-to-many',NULL,NULL,0,0),('9bbca86e-9d3e-54e7-d687-5d4dc1169141','aos_invoices_assigned_user','Users','users','id','AOS_Invoices','aos_invoices','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9c4a243a-2068-32c3-00ec-5d4dc10bf7b3','contacts_modified_user','Users','users','id','Contacts','contacts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9e4b818c-d330-67f5-b1c8-5d4dc16e5ccc','consumer_tokens','OAuthKeys','oauth_consumer','id','OAuthTokens','oauth_tokens','consumer',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9eb5e93a-3915-f6ba-dd1b-5d4dc1d5b1c9','securitygroups_meetings','SecurityGroups','securitygroups','id','Meetings','meetings','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Meetings',0,0),('9ed60118-1298-1d07-02d1-5d4dc1287a56','bug_notes','Bugs','bugs','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('a04c9077-6ec1-f92d-4a02-5d4dc1c27b0f','aos_products_quotes_assigned_user','Users','users','id','AOS_Products_Quotes','aos_products_quotes','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a07f81f7-316e-a1da-7915-5d4dc1f33786','emails_bugs_rel','Emails','emails','id','Bugs','bugs','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Bugs',0,0),('a0842a34-c026-3553-7266-5d4dc01e0a2f','securitygroups_cases','SecurityGroups','securitygroups','id','Cases','cases','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Cases',0,0),('a0a0abfa-ace6-2274-7b0a-5d4dc1240eb0','opportunity_emails','Opportunities','opportunities','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('a2228807-d94b-72f8-a216-5d4dc144542f','reminders_assigned_user','Users','users','id','Reminders','reminders','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a265d5b0-1e56-3eb6-93d9-5d4dc169e1f6','surveyquestions_modified_user','Users','users','id','SurveyQuestions','surveyquestions','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a29802a8-2e47-9a8b-928d-5d4dc12db57f','jjwg_Maps_opportunities','jjwg_Maps','jjwg_Maps','parent_id','Opportunities','opportunities','id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('a3568842-ebf5-e96d-4c1f-5d4dc10c3e4a','calls_modified_user','Users','users','id','Calls','calls','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a3dd31c8-bb87-12ac-a858-5d4dc1bf16ba','aor_charts_modified_user','Users','users','id','AOR_Charts','aor_charts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a3f7db91-8b43-fbfc-2c25-5d4dc1461254','account_aos_quotes','Accounts','accounts','id','AOS_Quotes','aos_quotes','billing_account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a42943de-c3d9-9282-77e1-5d4dc1b97f49','securitygroups_jjwg_areas','SecurityGroups','securitygroups','id','jjwg_Areas','jjwg_areas','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','jjwg_Areas',0,0),('a42c5e76-0c58-ef91-f469-5d4dc193026c','am_tasktemplates_am_projecttemplates','AM_ProjectTemplates','am_projecttemplates','id','AM_TaskTemplates','am_tasktemplates','id','am_tasktemplates_am_projecttemplates_c','am_tasktemplates_am_projecttemplatesam_projecttemplates_ida','am_tasktemplates_am_projecttemplatesam_tasktemplates_idb','many-to-many',NULL,NULL,0,0),('a43cb4ef-9e62-5783-0d1b-5d4dc197dda5','projects_bugs','Project','project','id','Bugs','bugs','id','projects_bugs','project_id','bug_id','many-to-many',NULL,NULL,0,0),('a457fe6d-2089-ff3e-7814-5d4dc126c9f0','oauth2clients_modified_user','Users','users','id','OAuth2Clients','oauth2clients','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a46a0316-f4a3-63b5-7bbe-5d4dc1ef816e','fp_events_contacts','FP_events','fp_events','id','Contacts','contacts','id','fp_events_contacts_c','fp_events_contactsfp_events_ida','fp_events_contactscontacts_idb','many-to-many',NULL,NULL,0,0),('a5cc0833-b3cc-4aa3-ddf5-5d4dc190b5c3','aow_workflow_aow_processed','AOW_WorkFlow','aow_workflow','id','AOW_Processed','aow_processed','aow_workflow_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a69df397-87c8-5024-827b-5d4dc11558c1','projects_created_by','Users','users','id','Project','project','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a6a5fef2-0ded-ab93-9ea2-5d4dc15db390','prospects_email_addresses_primary','Prospects','prospects','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('a6ad612f-4aa4-d678-7999-5d4dc1cdd091','campaign_accounts','Campaigns','campaigns','id','Accounts','accounts','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a6b86c9d-f80f-e4a1-8c98-5d4dc03cc0ed','securitygroups_leads','SecurityGroups','securitygroups','id','Leads','leads','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Leads',0,0),('a6fc13fc-392f-1398-0020-5d4dc1d1c110','revisions_created_by','Users','users','id','DocumentRevisions','document_revisions','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a7a8fa7c-4d85-0fce-49f2-5d4dc1652dd1','aop_case_events_modified_user','Users','users','id','AOP_Case_Events','aop_case_events','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a7c6a7b6-1346-1c30-d5cb-5d4dc18bca04','securitygroups_aos_invoices','SecurityGroups','securitygroups','id','AOS_Invoices','aos_invoices','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOS_Invoices',0,0),('a8bb2627-e2ed-7792-626f-5d4dc17fdb75','contacts_created_by','Users','users','id','Contacts','contacts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a8da26d1-ff17-cf73-363e-5d4dc13800f3','jjwg_maps_created_by','Users','users','id','jjwg_Maps','jjwg_maps','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a9d9055f-7e38-6eb5-836a-5d4dc1c4bc5b','jjwg_markers_created_by','Users','users','id','jjwg_Markers','jjwg_markers','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('aa7983cc-1637-b4a9-116c-5d4dc10cf189','oauthtokens_assigned_user','Users','users','id','OAuthTokens','oauth_tokens','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('aac9a626-b9e9-8574-7c4d-5d4dc1b48568','meetings_notes','Meetings','meetings','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Meetings',0,0),('ab83c603-0706-a90d-dfec-5d4dc145e2a3','bugs_release','Releases','releases','id','Bugs','bugs','found_in_release',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ac9ba86f-85e6-1e97-d831-5d4dc19f6ad9','aos_product_quotes_aos_products','AOS_Products','aos_products','id','AOS_Products_Quotes','aos_products_quotes','product_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('acaa2177-bbdc-d044-2179-5d4dc102e18d','opportunity_leads','Opportunities','opportunities','id','Leads','leads','opportunity_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('acc7dae6-e1a3-eb9e-1c11-5d4dc02b4858','case_calls','Cases','cases','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('ad25c8a7-44da-71f8-cdc9-5d4dc108d7a1','emails_cases_rel','Emails','emails','id','Cases','cases','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Cases',0,0),('ae8a0f49-1762-0d15-cc12-5d4dc18cf7fb','surveyquestions_created_by','Users','users','id','SurveyQuestions','surveyquestions','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('aef3f73e-0ad8-1a8e-2eaa-5d4dc12b1c8a','reminders_invitees_modified_user','Users','users','id','Reminders_Invitees','reminders_invitees','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b00edca2-d26a-01be-b79f-5d4dc11f142e','aor_charts_created_by','Users','users','id','AOR_Charts','aor_charts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b02ff59b-3655-351f-3b77-5d4dc155f6dc','account_aos_invoices','Accounts','accounts','id','AOS_Invoices','aos_invoices','billing_account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b067c7a9-c30e-4f86-6f63-5d4dc17bfe52','aos_contracts_documents','AOS_Contracts','aos_contracts','id','Documents','documents','id','aos_contracts_documents','aos_contracts_id','documents_id','many-to-many',NULL,NULL,0,0),('b0a925a2-f71b-d30b-2861-5d4dc1f501d0','oauth2clients_created_by','Users','users','id','OAuth2Clients','oauth2clients','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b0b738c8-8565-eadf-0fbb-5d4dc12ad55f','projects_cases','Project','project','id','Cases','cases','id','projects_cases','project_id','case_id','many-to-many',NULL,NULL,0,0),('b11330a1-a614-a821-e65b-5d4dc157707a','calls_created_by','Users','users','id','Calls','calls','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b2300c7a-72fa-2022-2e77-5d4dc17dfe07','aos_product_categories_modified_user','Users','users','id','AOS_Product_Categories','aos_product_categories','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b2665be0-b68d-5e31-91f0-5d4dc1474127','aow_processed_modified_user','Users','users','id','AOW_Processed','aow_processed','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b2d39459-820e-e061-c8e1-5d4dc1ad1948','prospect_tasks','Prospects','prospects','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('b2fce7e2-723a-8035-dee5-5d4dc05dd0fd','leads_email_addresses','Leads','leads','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Leads',0,0),('b3180626-f508-1881-b2fe-5d4dc15ad1d7','contact_notes','Contacts','contacts','id','Notes','notes','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b3c06568-2d1c-d8c2-d47c-5d4dc1b2e313','inbound_email_created_by','Users','users','id','InboundEmail','inbound_email','created_by',NULL,NULL,NULL,'one-to-one',NULL,NULL,0,0),('b3d300af-cd2c-110a-1fcd-5d4dc1560797','cases_aop_case_updates','Cases','cases','id','AOP_Case_Updates','aop_case_updates','case_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b3ee17aa-6824-0d72-4578-5d4dc190f8f0','aop_case_events_created_by','Users','users','id','AOP_Case_Events','aop_case_events','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b42e34c8-ac18-dcf6-b22b-5d4dc1cdd91f','aos_invoices_aos_product_quotes','AOS_Invoices','aos_invoices','id','AOS_Products_Quotes','aos_products_quotes','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b54e6103-8e11-c038-98d2-5d4dc170efac','contacts_assigned_user','Users','users','id','Contacts','contacts','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b7221779-655c-27f1-501f-5d4dc17b5251','am_projecttemplates_modified_user','Users','users','id','AM_ProjectTemplates','am_projecttemplates','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b81b9ce9-645e-5494-fa4e-5d4dc10e0014','bugs_fixed_in_release','Releases','releases','id','Bugs','bugs','fixed_in_release',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b8e400b5-c37b-3860-fd1d-5d4dc1944ef6','opportunity_currencies','Opportunities','opportunities','currency_id','Currencies','currencies','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b926ae6f-a808-1c0b-f2f8-5d4dc1a3ce80','aos_line_item_groups_modified_user','Users','users','id','AOS_Line_Item_Groups','aos_line_item_groups','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b9ef06cc-d372-5477-94ee-5d4dc049d38f','case_tasks','Cases','cases','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('baa62e10-1917-7572-25b7-5d4dc1f19039','surveyquestions_assigned_user','Users','users','id','SurveyQuestions','surveyquestions','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('bb189295-2476-2ce4-400b-5d4dc1ed4f57','reminders_invitees_created_by','Users','users','id','Reminders_Invitees','reminders_invitees','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('bc2b75b2-366d-037d-57d2-5d4dc185c66a','aor_charts_aor_reports','AOR_Reports','aor_reports','id','AOR_Charts','aor_charts','aor_report_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('bc907a35-cc3b-875a-7f5d-5d4dc169e808','account_aos_contracts','Accounts','accounts','id','AOS_Contracts','aos_contracts','contract_account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('bd142eef-1e76-fb45-1c38-5d4dc16b93b2','oauth2clients_oauth2tokens','OAuth2Clients','oauth2clients','id','OAuth2Tokens','oauth2tokens','client',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('bd6b8e1e-36a6-45b7-4b01-5d4dc119de1f','projects_accounts','Project','project','id','Accounts','accounts','id','projects_accounts','project_id','account_id','many-to-many',NULL,NULL,0,0),('bdb70b70-77aa-4366-e67d-5d4dc1c33858','emails_created_by','Users','users','id','Emails','emails','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('bf01f3dc-5f49-c7d7-cd23-5d4dc1a220b2','prospect_notes','Prospects','prospects','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('bf0f5f4a-e570-9cb4-473e-5d4dc1e19655','aow_processed_created_by','Users','users','id','AOW_Processed','aow_processed','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('bf1d2a6e-05ea-c1ea-3c3d-5d4dc04ca2c4','leads_email_addresses_primary','Leads','leads','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('bf1f0b8c-223d-12cb-3d6b-5d4dc123930a','calls_assigned_user','Users','users','id','Calls','calls','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('bfc00424-25f7-21ad-a492-5d4dc1316d51','jjwg_maps_assigned_user','Users','users','id','jjwg_Maps','jjwg_maps','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('bfc9dbbc-cfbc-bc29-d658-5d4dc13490fa','aos_quotes_aos_contracts','AOS_Quotes','aos_quotes','id','AOS_Contracts','aos_contracts','id','aos_quotes_os_contracts_c','aos_quotese81e_quotes_ida','aos_quotes4dc0ntracts_idb','many-to-many',NULL,NULL,0,0),('c025ac57-7304-16d9-409b-5d4dc121f447','aop_case_events_assigned_user','Users','users','id','AOP_Case_Events','aop_case_events','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c03ebf99-3072-0f2b-2655-5d4dc18b71fa','inbound_email_modified_user_id','Users','users','id','InboundEmail','inbound_email','modified_user_id',NULL,NULL,NULL,'one-to-one',NULL,NULL,0,0),('c0bd4efe-7bf5-9f29-393e-5d4dc1495787','aos_invoices_aos_line_item_groups','AOS_Invoices','aos_invoices','id','AOS_Line_Item_Groups','aos_line_item_groups','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c19fb1ad-c4d9-a53d-4f20-5d4dc10ff99c','securitygroups_contacts','SecurityGroups','securitygroups','id','Contacts','contacts','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Contacts',0,0),('c312ffb9-0405-9e77-dfe8-5d4dc1311adf','jjwg_address_cache_modified_user','Users','users','id','jjwg_Address_Cache','jjwg_address_cache','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c3788121-53eb-ab42-57af-5d4dc164973d','am_projecttemplates_created_by','Users','users','id','AM_ProjectTemplates','am_projecttemplates','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c47d59be-f300-b5a4-5c32-5d4dc1713215','user_direct_reports','Users','users','id','Users','users','reports_to_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c552a7b4-8684-a315-151e-5d4dc1396ad0','campaign_contacts','Campaigns','campaigns','id','Contacts','contacts','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c56c01d8-728c-491b-007d-5d4dc144a9c0','emails_opportunities_rel','Emails','emails','id','Opportunities','opportunities','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Opportunities',0,0),('c5b08047-8209-acbe-09e5-5d4dc1894f50','opportunities_campaign','Campaigns','campaigns','id','Opportunities','opportunities','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c5f2dded-5751-fb2f-babb-5d4dc1e16586','aos_line_item_groups_created_by','Users','users','id','AOS_Line_Item_Groups','aos_line_item_groups','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c7098ea6-c446-41bb-21b0-5d4dc0b3c40a','case_notes','Cases','cases','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('c71c0953-3cb8-b527-9030-5d4dc189ffc9','securitygroups_surveyquestions','SecurityGroups','securitygroups','id','SurveyQuestions','surveyquestions','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','SurveyQuestions',0,0),('c7ddd46c-9ded-e697-6207-5d4dc1fefc79','reminders_invitees_assigned_user','Users','users','id','Reminders_Invitees','reminders_invitees','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c88b1934-f19a-fa74-23ca-5d4dc164e173','aor_conditions_modified_user','Users','users','id','AOR_Conditions','aor_conditions','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c909d5d9-6516-0a17-f59f-5d4dc12076f1','securitygroups_project_task','SecurityGroups','securitygroups','id','ProjectTask','project_task','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','ProjectTask',0,0),('c95b96a5-4275-77b3-4c40-5d4dc188e501','oauth2clients_assigned_user','Users','users','id','OAuth2Clients','oauth2clients','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('cbb3a1a3-a15b-de48-2775-5d4dc16f67fb','prospect_meetings','Prospects','prospects','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('cbb5c86d-e0a9-953a-1f29-5d4dc04516d3','lead_direct_reports','Leads','leads','id','Leads','leads','reports_to_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('cc02b3b4-96ce-3bd7-815a-5d4dc1b8f9a1','securitygroups_calls','SecurityGroups','securitygroups','id','Calls','calls','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Calls',0,0),('cc3a73a3-6a63-d95c-5a72-5d4dc1dcebf6','aos_quotes_aos_invoices','AOS_Quotes','aos_quotes','id','AOS_Invoices','aos_invoices','id','aos_quotes_aos_invoices_c','aos_quotes77d9_quotes_ida','aos_quotes6b83nvoices_idb','many-to-many',NULL,NULL,0,0),('cca52a05-b07f-db05-b6ee-5d4dc1203760','saved_search_assigned_user','Users','users','id','SavedSearch','saved_search','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ccc31353-fe48-9cb1-7aa6-5d4dc16614d4','cases_aop_case_events','Cases','cases','id','AOP_Case_Events','aop_case_events','case_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ccd0860d-6bfc-349a-cfd4-5d4dc152d85e','aow_conditions_modified_user','Users','users','id','AOW_Conditions','aow_conditions','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('cd3c3168-641f-0957-0e83-5d4dc1ef9234','aos_pdf_templates_modified_user','Users','users','id','AOS_PDF_Templates','aos_pdf_templates','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('cde8368a-d492-48ac-4a7e-5d4dc1717458','contacts_email_addresses','Contacts','contacts','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Contacts',0,0),('ce441687-1be4-ba28-004a-5d4dc1585eed','jjwg_Maps_cases','jjwg_Maps','jjwg_Maps','parent_id','Cases','cases','id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('cfa6f7d2-6dd5-5724-bd0c-5d4dc1e02fdd','jjwg_address_cache_created_by','Users','users','id','jjwg_Address_Cache','jjwg_address_cache','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('cfda5415-8968-3d20-7312-5d4dc1c03097','am_projecttemplates_assigned_user','Users','users','id','AM_ProjectTemplates','am_projecttemplates','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d08622b5-b741-1cab-5e94-5d4dc1d7a02a','users_email_addresses','Users','users','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Users',0,0),('d226bc02-a5af-c4a8-e612-5d4dc153647b','jjwg_markers_modified_user','Users','users','id','jjwg_Markers','jjwg_markers','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d23fc92f-8746-cea8-0413-5d4dc1f733ba','opportunity_aos_quotes','Opportunities','opportunities','id','AOS_Quotes','aos_quotes','opportunity_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d2926abd-a72d-73dc-6438-5d4dc10fbafd','aos_line_item_groups_assigned_user','Users','users','id','AOS_Line_Item_Groups','aos_line_item_groups','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d2f05786-7bb5-b629-28ae-5d4dc19b76cf','campaign_leads','Campaigns','campaigns','id','Leads','leads','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d304a353-59aa-9255-26ca-5d4dc11c1bf2','emails_tasks_rel','Emails','emails','id','Tasks','tasks','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Tasks',0,0),('d32826d2-2776-6018-2f12-5d4dc0bc8d1e','case_meetings','Cases','cases','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('d3410391-ab4a-ac3a-3815-5d4dc145f261','favorites_modified_user','Users','users','id','Favorites','favorites','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d42ceded-85a8-b0c3-98cc-5d4dc125364a','fp_events_modified_user','Users','users','id','FP_events','fp_events','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d43f0f9d-fbfb-eb0c-b7bb-5d4dc1091301','surveyquestions_surveyquestionoptions','SurveyQuestions','surveyquestions','id','SurveyQuestionOptions','surveyquestionoptions','survey_question_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d4c12835-dcf8-f309-0d3b-5d4dc1b0291e','tasks_modified_user','Users','users','id','Tasks','tasks','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d4d38392-4291-b168-423b-5d4dc1b1162c','aor_conditions_created_by','Users','users','id','AOR_Conditions','aor_conditions','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d5223f88-432c-72b6-51a4-5d4dc1bd1cac','securitygroups_prospect_lists','SecurityGroups','securitygroups','id','ProspectLists','prospect_lists','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','ProspectLists',0,0),('d617abed-8adb-fa7f-5c0c-5d4dc1cc3f58','surveyresponses_modified_user','Users','users','id','SurveyResponses','surveyresponses','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d80d1f43-55ed-c810-1ab9-5d4dc100c779','prospect_calls','Prospects','prospects','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('d83ba702-5edd-3744-3b57-5d4dc1715f8d','aos_quotes_project','AOS_Quotes','aos_quotes','id','Project','project','id','aos_quotes_project_c','aos_quotes1112_quotes_ida','aos_quotes7207project_idb','many-to-many',NULL,NULL,0,0),('d8904a6e-f704-3ebb-730a-5d4dc067e50d','lead_tasks','Leads','leads','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('d89faacc-bb6c-a9ee-de5e-5d4dc169de40','calls_notes','Calls','calls','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Calls',0,0),('d8c840cf-7571-aafb-fef0-5d4dc141ef57','projects_contacts','Project','project','id','Contacts','contacts','id','projects_contacts','project_id','contact_id','many-to-many',NULL,NULL,0,0),('d93ba419-cb90-b3a4-4a3d-5d4dc1c8426f','spots_modified_user','Users','users','id','Spots','spots','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d95c2d54-09a4-73e5-e7fb-5d4dc1569228','aow_conditions_created_by','Users','users','id','AOW_Conditions','aow_conditions','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d9695a04-99a9-508d-74d5-5d4dc1074a9c','aop_case_updates_modified_user','Users','users','id','AOP_Case_Updates','aop_case_updates','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('da65b193-73b7-461d-e705-5d4dc16a2809','contacts_email_addresses_primary','Contacts','contacts','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('da6bec0c-388e-6a6d-6834-5d4dc13538df','aos_pdf_templates_created_by','Users','users','id','AOS_PDF_Templates','aos_pdf_templates','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('dc3a4ab9-f5b3-afff-b89f-5d4dc1de4062','am_tasktemplates_modified_user','Users','users','id','AM_TaskTemplates','am_tasktemplates','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('dc5da7f4-8cc2-20d1-6f50-5d4dc17786d1','jjwg_address_cache_assigned_user','Users','users','id','jjwg_Address_Cache','jjwg_address_cache','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('dd889702-a384-4397-dd29-5d4dc1ca189a','users_email_addresses_primary','Users','users','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('ded2b5cc-453d-0029-6f79-5d4dc1f39762','opportunity_aos_contracts','Opportunities','opportunities','id','AOS_Contracts','aos_contracts','opportunity_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('def102ba-9ae1-5cdb-a820-5d4dc1d87875','calls_reschedule_assigned_user','Users','users','id','Calls_Reschedule','calls_reschedule','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('df1b72d7-5259-a6bd-8023-5d4dc1c121e7','emails_users_rel','Emails','emails','id','Users','users','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Users',0,0),('df3cfe9a-12e2-170c-999c-5d4dc11d7e12','campaign_prospects','Campaigns','campaigns','id','Prospects','prospects','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('df55a5f5-8112-f280-421b-5d4dc018068e','case_emails','Cases','cases','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('df953528-cc14-0498-a891-5d4dc1951ed5','groups_aos_product_quotes','AOS_Line_Item_Groups','aos_line_item_groups','id','AOS_Products_Quotes','aos_products_quotes','group_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('dfeaabe1-57b6-d96d-8e36-5d4dc1d40276','accounts_modified_user','Users','users','id','Accounts','accounts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e057f850-891a-4c29-5074-5d4dc1a0eb80','fp_events_created_by','Users','users','id','FP_events','fp_events','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e0f27025-8687-bcc8-45af-5d4dc13c87a1','surveyquestionoptions_modified_user','Users','users','id','SurveyQuestionOptions','surveyquestionoptions','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e126da06-5751-26c1-74ca-5d4dc15e1c9f','tasks_created_by','Users','users','id','Tasks','tasks','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e1af28c8-5bc7-3ad0-c315-5d4dc10c1e87','aor_scheduled_reports_modified_user','Users','users','id','AOR_Scheduled_Reports','aor_scheduled_reports','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e23f3e9c-9e6e-500e-69ff-5d4dc129e5d0','surveyresponses_created_by','Users','users','id','SurveyResponses','surveyresponses','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e48061ee-f1e4-7758-3ac2-5d4dc165a2bc','aow_processed_aow_actions','AOW_Processed','aow_processed','id','AOW_Actions','aow_actions','id','aow_processed_aow_actions','aow_processed_id','aow_action_id','many-to-many',NULL,NULL,0,0),('e4c2a2e1-4ec7-c14c-a7c3-5d4dc056c0c9','lead_notes','Leads','leads','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('e51ff182-5bfa-3433-5094-5d4dc114837c','projects_opportunities','Project','project','id','Opportunities','opportunities','id','projects_opportunities','project_id','opportunity_id','many-to-many',NULL,NULL,0,0),('e547d21f-bdb7-dacd-1469-5d4dc1371785','spots_created_by','Users','users','id','Spots','spots','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e5645f29-bf0c-f754-bb5f-5d4dc1e2e738','prospect_emails','Prospects','prospects','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('e56e1108-9978-ed7c-39af-5d4dc17e00cf','calls_reschedule','Calls','calls','id','Calls_Reschedule','calls_reschedule','call_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e60791a9-eb7d-93e9-f230-5d4dc17c6443','aop_case_updates_created_by','Users','users','id','AOP_Case_Updates','aop_case_updates','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e69894a2-acc2-7132-3a3c-5d4dc18e4482','aos_pdf_templates_assigned_user','Users','users','id','AOS_PDF_Templates','aos_pdf_templates','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e70b67ba-f7bc-4b61-072a-5d4dc17b8834','contact_direct_reports','Contacts','contacts','id','Contacts','contacts','reports_to_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e83bf067-e8ea-98df-a1ba-5d4dc105c5a7','am_tasktemplates_created_by','Users','users','id','AM_TaskTemplates','am_tasktemplates','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e90b5a35-c2af-5957-7f5c-5d4dc1aa8608','calls_reschedule_modified_user','Users','users','id','Calls_Reschedule','calls_reschedule','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ea804ce5-6db7-1a4d-7b11-5d4dc119b4e3','campaignlog_contact','CampaignLog','campaign_log','related_id','Contacts','contacts','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('eb565309-3428-5893-7080-5d4dc11cddc0','campaign_opportunities','Campaigns','campaigns','id','Opportunities','opportunities','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('eb6613ba-2e5b-6279-8274-5d4dc10b2be6','emails_project_task_rel','Emails','emails','id','ProjectTask','project_task','id','emails_beans','email_id','bean_id','many-to-many','bean_module','ProjectTask',0,0),('eba64c75-9544-70f5-8618-5d4dc0238cbb','cases_created_contact','Contacts','contacts','id','Cases','cases','contact_created_by_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ec286339-136d-e903-d278-5d4dc156e4cc','accounts_created_by','Users','users','id','Accounts','accounts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ec8b4923-7abd-c682-9e4f-5d4dc12ca694','fp_events_assigned_user','Users','users','id','FP_events','fp_events','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ed23e754-fa11-b14e-e2ff-5d4dc1ada5f7','aos_quotes_modified_user','Users','users','id','AOS_Quotes','aos_quotes','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ed327df1-9ce4-e0cd-e93b-5d4dc1f4576f','securitygroups_users','SecurityGroups','securitygroups','id','Users','users','id','securitygroups_users','securitygroup_id','user_id','many-to-many',NULL,NULL,0,0),('ed435c63-ea96-1b85-2009-5d4dc18be0b8','surveyquestionoptions_created_by','Users','users','id','SurveyQuestionOptions','surveyquestionoptions','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ed7446ae-c7d0-6e05-df16-5d4dc1275e3a','tasks_assigned_user','Users','users','id','Tasks','tasks','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('eddaffda-75f8-0ee1-5015-5d4dc14e47b7','aor_scheduled_reports_created_by','Users','users','id','AOR_Scheduled_Reports','aor_scheduled_reports','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('efa5294b-c776-064e-3a84-5d4dc13d614b','securitygroups_projecttask','SecurityGroups','securitygroups','id','ProjectTask','project_task','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','ProjectTask',0,0),('efa6e67f-3a4d-c362-9660-5d4dc170ba2e','surveyresponses_assigned_user','Users','users','id','SurveyResponses','surveyresponses','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('efaf036d-20d9-393e-e1dd-5d4dc1e63565','campaignlog_created_opportunities','CampaignLog','campaign_log','related_id','Opportunities','opportunities','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f139f69d-f43f-0a6c-e218-5d4dc0c46cce','lead_meetings','Leads','leads','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('f17721c8-aebd-e6d0-c500-5d4dc102dd14','spots_assigned_user','Users','users','id','Spots','spots','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f1800da2-56a4-97f8-7037-5d4dc1a84b86','acl_roles_actions','ACLRoles','acl_roles','id','ACLActions','acl_actions','id','acl_roles_actions','role_id','action_id','many-to-many',NULL,NULL,0,0),('f1cd8e78-ddec-6a38-8621-5d4dc18ad08b','prospect_campaign_log','Prospects','prospects','id','CampaignLog','campaign_log','target_id',NULL,NULL,NULL,'one-to-many','target_type','Prospects',0,0),('f227ec63-5469-e987-983a-5d4dc179ab13','fp_event_locations_fp_events_1','FP_Event_Locations','fp_event_locations','id','FP_events','fp_events','id','fp_event_locations_fp_events_1_c','fp_event_locations_fp_events_1fp_event_locations_ida','fp_event_locations_fp_events_1fp_events_idb','many-to-many',NULL,NULL,0,0),('f25afee7-ddad-49b8-9226-5d4dc1e883be','emails_modified_user','Users','users','id','Emails','emails','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f29cc982-2f5c-d770-569c-5d4dc1887546','aop_case_updates_assigned_user','Users','users','id','AOP_Case_Updates','aop_case_updates','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f2c7b59e-8bd2-847b-f945-5d4dc1b00c13','securitygroups_aos_pdf_templates','SecurityGroups','securitygroups','id','AOS_PDF_Templates','aos_pdf_templates','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOS_PDF_Templates',0,0),('f314f4c9-8560-9e72-6a03-5d4dc11ae3c8','contact_leads','Contacts','contacts','id','Leads','leads','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ffdd0062-9e03-06bd-288e-5d4dc1f7c457','campaign_emailman','Campaigns','campaigns','id','EmailMan','emailman','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0);
/*!40000 ALTER TABLE `relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `releases`
--

DROP TABLE IF EXISTS `releases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `releases` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `list_order` int(4) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_releases` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `releases`
--

LOCK TABLES `releases` WRITE;
/*!40000 ALTER TABLE `releases` DISABLE KEYS */;
/*!40000 ALTER TABLE `releases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reminders`
--

DROP TABLE IF EXISTS `reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reminders` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `popup` tinyint(1) DEFAULT NULL,
  `email` tinyint(1) DEFAULT NULL,
  `email_sent` tinyint(1) DEFAULT NULL,
  `timer_popup` varchar(32) DEFAULT NULL,
  `timer_email` varchar(32) DEFAULT NULL,
  `related_event_module` varchar(32) DEFAULT NULL,
  `related_event_module_id` char(36) NOT NULL,
  `date_willexecute` int(60) DEFAULT -1,
  `popup_viewed` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_reminder_name` (`name`),
  KEY `idx_reminder_deleted` (`deleted`),
  KEY `idx_reminder_related_event_module` (`related_event_module`),
  KEY `idx_reminder_related_event_module_id` (`related_event_module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reminders`
--

LOCK TABLES `reminders` WRITE;
/*!40000 ALTER TABLE `reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reminders_invitees`
--

DROP TABLE IF EXISTS `reminders_invitees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reminders_invitees` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `reminder_id` char(36) NOT NULL,
  `related_invitee_module` varchar(32) DEFAULT NULL,
  `related_invitee_module_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_reminder_invitee_name` (`name`),
  KEY `idx_reminder_invitee_assigned_user_id` (`assigned_user_id`),
  KEY `idx_reminder_invitee_reminder_id` (`reminder_id`),
  KEY `idx_reminder_invitee_related_invitee_module` (`related_invitee_module`),
  KEY `idx_reminder_invitee_related_invitee_module_id` (`related_invitee_module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reminders_invitees`
--

LOCK TABLES `reminders_invitees` WRITE;
/*!40000 ALTER TABLE `reminders_invitees` DISABLE KEYS */;
/*!40000 ALTER TABLE `reminders_invitees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `modules` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_role_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_modules`
--

DROP TABLE IF EXISTS `roles_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_modules` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `module_id` varchar(36) DEFAULT NULL,
  `allow` tinyint(1) DEFAULT 0,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_module_id` (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_modules`
--

LOCK TABLES `roles_modules` WRITE;
/*!40000 ALTER TABLE `roles_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_users` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_ru_role_id` (`role_id`),
  KEY `idx_ru_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saved_search`
--

DROP TABLE IF EXISTS `saved_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saved_search` (
  `id` char(36) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `search_module` varchar(150) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `contents` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_desc` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saved_search`
--

LOCK TABLES `saved_search` WRITE;
/*!40000 ALTER TABLE `saved_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `saved_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedulers`
--

DROP TABLE IF EXISTS `schedulers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedulers` (
  `id` varchar(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `date_time_start` datetime DEFAULT NULL,
  `date_time_end` datetime DEFAULT NULL,
  `job_interval` varchar(100) DEFAULT NULL,
  `time_from` time DEFAULT NULL,
  `time_to` time DEFAULT NULL,
  `last_run` datetime DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `catch_up` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_schedule` (`date_time_start`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedulers`
--

LOCK TABLES `schedulers` WRITE;
/*!40000 ALTER TABLE `schedulers` DISABLE KEYS */;
INSERT INTO `schedulers` VALUES ('161bb372-f25e-2aa6-e171-5d4dc0449e81',0,'2019-08-09 18:51:09','2019-08-09 18:51:09','1','1','Prune Database on 1st of Month','function::pruneDatabase','2015-01-01 19:30:01',NULL,'0::4::1::*::*',NULL,NULL,NULL,'Inactive',0),('23fcfe2d-c4af-85fd-1394-5d4dc02877ff',0,'2019-08-09 18:51:09','2019-08-09 18:51:09','1','1','Perform Lucene Index','function::aodIndexUnindexed','2015-01-01 12:15:01',NULL,'0::0::*::*::*',NULL,NULL,NULL,'Active',0),('32401721-21ad-3517-6d72-5d4dc07ab4f1',0,'2019-08-09 18:51:09','2019-08-09 18:51:09','1','1','Optimise AOD Index','function::aodOptimiseIndex','2015-01-01 07:15:01',NULL,'0::*/3::*::*::*',NULL,NULL,NULL,'Active',0),('41207353-a0f8-b959-c59c-5d4dc0db6cab',0,'2019-08-09 18:51:09','2019-08-09 18:51:09','1','1','Run Email Reminder Notifications','function::sendEmailReminders','2015-01-01 17:15:01',NULL,'*::*::*::*::*',NULL,NULL,NULL,'Active',0),('4f11b983-7761-13e6-f728-5d4dc09c3cb7',0,'2019-08-09 18:51:09','2019-08-09 18:51:09','1','1','Clean Jobs Queue','function::cleanJobQueue','2015-01-01 14:00:01',NULL,'0::5::*::*::*',NULL,NULL,NULL,'Active',0),('5d26ccf6-f216-2a7f-68a9-5d4dc02f1507',0,'2019-08-09 18:51:09','2019-08-09 18:51:09','1','1','Removal of documents from filesystem','function::removeDocumentsFromFS','2015-01-01 14:00:01',NULL,'0::3::1::*::*',NULL,NULL,NULL,'Active',0),('6b7d8203-3c10-e28c-658b-5d4dc0e050d1',0,'2019-08-09 18:51:09','2019-08-09 18:51:09','1','1','Prune SuiteCRM Feed Tables','function::trimSugarFeeds','2015-01-01 16:15:01',NULL,'0::2::1::*::*',NULL,NULL,NULL,'Active',1),('85380449-8586-d12e-e864-5d4dc095e965',0,'2019-08-09 18:51:09','2019-08-09 18:51:09','1','1','Run Nightly Mass Email Campaigns','function::runMassEmailCampaign','2015-01-01 17:00:01',NULL,'0::2-6::*::*::*',NULL,NULL,NULL,'Active',1),('b59dd1ee-2872-ee63-d0a7-5d4dc0d52f84',0,'2019-08-09 18:51:09','2019-08-09 18:51:09','1','1','Process Workflow Tasks','function::processAOW_Workflow','2015-01-01 13:15:01',NULL,'*::*::*::*::*',NULL,NULL,NULL,'Active',1),('c4516ae3-9b1f-8f12-9d23-5d4dc05468f2',0,'2019-08-09 18:51:09','2019-08-09 18:51:09','1','1','Run Report Generation Scheduled Tasks','function::aorRunScheduledReports','2015-01-01 10:45:01',NULL,'*::*::*::*::*',NULL,NULL,NULL,'Active',1),('d2174685-6011-e326-80df-5d4dc09e28eb',0,'2019-08-09 18:51:09','2019-08-09 18:51:09','1','1','Prune Tracker Tables','function::trimTracker','2015-01-01 15:15:01',NULL,'0::2::1::*::*',NULL,NULL,NULL,'Active',1),('e04bc7e1-40e1-683f-b502-5d4dc0e0c1bc',0,'2019-08-09 18:51:09','2019-08-09 18:51:09','1','1','Check Inbound Mailboxes','function::pollMonitoredInboxesAOP','2015-01-01 08:00:01',NULL,'*::*::*::*::*',NULL,NULL,NULL,'Active',0),('ee2e9838-e058-67ea-53f8-5d4dc0de24ab',0,'2019-08-09 18:51:09','2019-08-09 18:51:09','1','1','Run Nightly Process Bounced Campaign Emails','function::pollMonitoredInboxesForBouncedCampaignEmails','2015-01-01 07:00:01',NULL,'0::2-6::*::*::*',NULL,NULL,NULL,'Active',1);
/*!40000 ALTER TABLE `schedulers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitygroups`
--

DROP TABLE IF EXISTS `securitygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `securitygroups` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `noninheritable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitygroups`
--

LOCK TABLES `securitygroups` WRITE;
/*!40000 ALTER TABLE `securitygroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `securitygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitygroups_acl_roles`
--

DROP TABLE IF EXISTS `securitygroups_acl_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `securitygroups_acl_roles` (
  `id` char(36) NOT NULL,
  `securitygroup_id` char(36) DEFAULT NULL,
  `role_id` char(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitygroups_acl_roles`
--

LOCK TABLES `securitygroups_acl_roles` WRITE;
/*!40000 ALTER TABLE `securitygroups_acl_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `securitygroups_acl_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitygroups_audit`
--

DROP TABLE IF EXISTS `securitygroups_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `securitygroups_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_securitygroups_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitygroups_audit`
--

LOCK TABLES `securitygroups_audit` WRITE;
/*!40000 ALTER TABLE `securitygroups_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `securitygroups_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitygroups_default`
--

DROP TABLE IF EXISTS `securitygroups_default`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `securitygroups_default` (
  `id` char(36) NOT NULL,
  `securitygroup_id` char(36) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitygroups_default`
--

LOCK TABLES `securitygroups_default` WRITE;
/*!40000 ALTER TABLE `securitygroups_default` DISABLE KEYS */;
/*!40000 ALTER TABLE `securitygroups_default` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitygroups_records`
--

DROP TABLE IF EXISTS `securitygroups_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `securitygroups_records` (
  `id` char(36) NOT NULL,
  `securitygroup_id` char(36) DEFAULT NULL,
  `record_id` char(36) DEFAULT NULL,
  `module` char(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_securitygroups_records_mod` (`module`,`deleted`,`record_id`,`securitygroup_id`),
  KEY `idx_securitygroups_records_del` (`deleted`,`record_id`,`module`,`securitygroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitygroups_records`
--

LOCK TABLES `securitygroups_records` WRITE;
/*!40000 ALTER TABLE `securitygroups_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `securitygroups_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitygroups_users`
--

DROP TABLE IF EXISTS `securitygroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `securitygroups_users` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `securitygroup_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `primary_group` tinyint(1) DEFAULT NULL,
  `noninheritable` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `securitygroups_users_idxa` (`securitygroup_id`),
  KEY `securitygroups_users_idxb` (`user_id`),
  KEY `securitygroups_users_idxc` (`user_id`,`deleted`,`securitygroup_id`,`id`),
  KEY `securitygroups_users_idxd` (`user_id`,`deleted`,`securitygroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitygroups_users`
--

LOCK TABLES `securitygroups_users` WRITE;
/*!40000 ALTER TABLE `securitygroups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `securitygroups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spots`
--

DROP TABLE IF EXISTS `spots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spots` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `config` longtext DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spots`
--

LOCK TABLES `spots` WRITE;
/*!40000 ALTER TABLE `spots` DISABLE KEYS */;
/*!40000 ALTER TABLE `spots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sugarfeed`
--

DROP TABLE IF EXISTS `sugarfeed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sugarfeed` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `related_module` varchar(100) DEFAULT NULL,
  `related_id` char(36) DEFAULT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  `link_type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sgrfeed_date` (`date_entered`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sugarfeed`
--

LOCK TABLES `sugarfeed` WRITE;
/*!40000 ALTER TABLE `sugarfeed` DISABLE KEYS */;
/*!40000 ALTER TABLE `sugarfeed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveyquestionoptions`
--

DROP TABLE IF EXISTS `surveyquestionoptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveyquestionoptions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `sort_order` int(255) DEFAULT NULL,
  `survey_question_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyquestionoptions`
--

LOCK TABLES `surveyquestionoptions` WRITE;
/*!40000 ALTER TABLE `surveyquestionoptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `surveyquestionoptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveyquestionoptions_audit`
--

DROP TABLE IF EXISTS `surveyquestionoptions_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveyquestionoptions_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_surveyquestionoptions_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyquestionoptions_audit`
--

LOCK TABLES `surveyquestionoptions_audit` WRITE;
/*!40000 ALTER TABLE `surveyquestionoptions_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `surveyquestionoptions_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveyquestionoptions_surveyquestionresponses`
--

DROP TABLE IF EXISTS `surveyquestionoptions_surveyquestionresponses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveyquestionoptions_surveyquestionresponses` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `surveyq72c7options_ida` varchar(36) DEFAULT NULL,
  `surveyq10d4sponses_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `surveyquestionoptions_surveyquestionresponses_alt` (`surveyq72c7options_ida`,`surveyq10d4sponses_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyquestionoptions_surveyquestionresponses`
--

LOCK TABLES `surveyquestionoptions_surveyquestionresponses` WRITE;
/*!40000 ALTER TABLE `surveyquestionoptions_surveyquestionresponses` DISABLE KEYS */;
/*!40000 ALTER TABLE `surveyquestionoptions_surveyquestionresponses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveyquestionresponses`
--

DROP TABLE IF EXISTS `surveyquestionresponses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveyquestionresponses` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `answer_bool` tinyint(1) DEFAULT NULL,
  `answer_datetime` datetime DEFAULT NULL,
  `surveyquestion_id` char(36) DEFAULT NULL,
  `surveyresponse_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyquestionresponses`
--

LOCK TABLES `surveyquestionresponses` WRITE;
/*!40000 ALTER TABLE `surveyquestionresponses` DISABLE KEYS */;
/*!40000 ALTER TABLE `surveyquestionresponses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveyquestionresponses_audit`
--

DROP TABLE IF EXISTS `surveyquestionresponses_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveyquestionresponses_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_surveyquestionresponses_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyquestionresponses_audit`
--

LOCK TABLES `surveyquestionresponses_audit` WRITE;
/*!40000 ALTER TABLE `surveyquestionresponses_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `surveyquestionresponses_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveyquestions`
--

DROP TABLE IF EXISTS `surveyquestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveyquestions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `sort_order` int(255) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `happiness_question` tinyint(1) DEFAULT NULL,
  `survey_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyquestions`
--

LOCK TABLES `surveyquestions` WRITE;
/*!40000 ALTER TABLE `surveyquestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `surveyquestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveyquestions_audit`
--

DROP TABLE IF EXISTS `surveyquestions_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveyquestions_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_surveyquestions_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyquestions_audit`
--

LOCK TABLES `surveyquestions_audit` WRITE;
/*!40000 ALTER TABLE `surveyquestions_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `surveyquestions_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveyresponses`
--

DROP TABLE IF EXISTS `surveyresponses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveyresponses` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `happiness` int(11) DEFAULT NULL,
  `email_response_sent` tinyint(1) DEFAULT NULL,
  `account_id` char(36) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `survey_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyresponses`
--

LOCK TABLES `surveyresponses` WRITE;
/*!40000 ALTER TABLE `surveyresponses` DISABLE KEYS */;
/*!40000 ALTER TABLE `surveyresponses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveyresponses_audit`
--

DROP TABLE IF EXISTS `surveyresponses_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveyresponses_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_surveyresponses_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyresponses_audit`
--

LOCK TABLES `surveyresponses_audit` WRITE;
/*!40000 ALTER TABLE `surveyresponses_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `surveyresponses_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveys`
--

DROP TABLE IF EXISTS `surveys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveys` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Draft',
  `submit_text` varchar(255) DEFAULT 'Submit',
  `satisfied_text` varchar(255) DEFAULT 'Satisfied',
  `neither_text` varchar(255) DEFAULT 'Neither Satisfied nor Dissatisfied',
  `dissatisfied_text` varchar(255) DEFAULT 'Dissatisfied',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveys`
--

LOCK TABLES `surveys` WRITE;
/*!40000 ALTER TABLE `surveys` DISABLE KEYS */;
/*!40000 ALTER TABLE `surveys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveys_audit`
--

DROP TABLE IF EXISTS `surveys_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveys_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_surveys_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveys_audit`
--

LOCK TABLES `surveys_audit` WRITE;
/*!40000 ALTER TABLE `surveys_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `surveys_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Not Started',
  `date_due_flag` tinyint(1) DEFAULT 0,
  `date_due` datetime DEFAULT NULL,
  `date_start_flag` tinyint(1) DEFAULT 0,
  `date_start` datetime DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tsk_name` (`name`),
  KEY `idx_task_con_del` (`contact_id`,`deleted`),
  KEY `idx_task_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_task_assigned` (`assigned_user_id`),
  KEY `idx_task_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatesectionline`
--

DROP TABLE IF EXISTS `templatesectionline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatesectionline` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `thumbnail` varchar(255) DEFAULT NULL,
  `grp` varchar(255) DEFAULT NULL,
  `ord` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatesectionline`
--

LOCK TABLES `templatesectionline` WRITE;
/*!40000 ALTER TABLE `templatesectionline` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatesectionline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracker`
--

DROP TABLE IF EXISTS `tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `monitor_id` char(36) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `module_name` varchar(255) DEFAULT NULL,
  `item_id` varchar(36) DEFAULT NULL,
  `item_summary` varchar(255) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `session_id` varchar(36) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT 0,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tracker_iid` (`item_id`),
  KEY `idx_tracker_userid_vis_id` (`user_id`,`visible`,`id`),
  KEY `idx_tracker_userid_itemid_vis` (`user_id`,`item_id`,`visible`),
  KEY `idx_tracker_monitor_id` (`monitor_id`),
  KEY `idx_tracker_date_modified` (`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracker`
--

LOCK TABLES `tracker` WRITE;
/*!40000 ALTER TABLE `tracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `tracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upgrade_history`
--

DROP TABLE IF EXISTS `upgrade_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upgrade_history` (
  `id` char(36) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `md5sum` varchar(32) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `version` varchar(64) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `id_name` varchar(255) DEFAULT NULL,
  `manifest` longtext DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `upgrade_history_md5_uk` (`md5sum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upgrade_history`
--

LOCK TABLES `upgrade_history` WRITE;
/*!40000 ALTER TABLE `upgrade_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `upgrade_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preferences`
--

DROP TABLE IF EXISTS `user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_preferences` (
  `id` char(36) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `contents` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_userprefnamecat` (`assigned_user_id`,`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferences`
--

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
INSERT INTO `user_preferences` VALUES ('81aec2c7-59ab-ad1e-e3a3-5d4dc1732e4a','ETag',0,'2019-08-09 18:51:09','2019-08-09 18:51:09','1','YToxOntzOjEyOiJtYWluTWVudUVUYWciO2k6MTt9'),('a7108757-6662-002d-2cf1-5d4dc1372bfe','global',0,'2019-08-09 18:51:09','2019-08-09 18:51:09','1','YToyNjp7czoxMjoibWFpbG1lcmdlX29uIjtzOjI6Im9uIjtzOjE2OiJzd2FwX2xhc3Rfdmlld2VkIjtzOjA6IiI7czoxNDoic3dhcF9zaG9ydGN1dHMiO3M6MDoiIjtzOjE5OiJuYXZpZ2F0aW9uX3BhcmFkaWdtIjtzOjI6ImdtIjtzOjIwOiJzb3J0X21vZHVsZXNfYnlfbmFtZSI7czowOiIiO3M6MTM6InN1YnBhbmVsX3RhYnMiO3M6MDoiIjtzOjI1OiJjb3VudF9jb2xsYXBzZWRfc3VicGFuZWxzIjtzOjA6IiI7czoxMDoidXNlcl90aGVtZSI7czo2OiJTdWl0ZVAiO3M6MTQ6Im1vZHVsZV9mYXZpY29uIjtzOjA6IiI7czo5OiJoaWRlX3RhYnMiO2E6MDp7fXM6MTE6InJlbW92ZV90YWJzIjthOjA6e31zOjc6Im5vX29wcHMiO3M6Mzoib2ZmIjtzOjEzOiJyZW1pbmRlcl90aW1lIjtpOjE4MDA7czoxOToiZW1haWxfcmVtaW5kZXJfdGltZSI7aTozNjAwO3M6MTY6InJlbWluZGVyX2NoZWNrZWQiO3M6MToiMSI7czoyOiJ1dCI7czoxOiIxIjtzOjM1OiJkZWZhdWx0X2N1cnJlbmN5X3NpZ25pZmljYW50X2RpZ2l0cyI7czoxOiIyIjtzOjU6ImRhdGVmIjtzOjU6ImQtbS1ZIjtzOjI2OiJkZWZhdWx0X2xvY2FsZV9uYW1lX2Zvcm1hdCI7czo1OiJzIGYgbCI7czoxNjoiZXhwb3J0X2RlbGltaXRlciI7czoxOiIsIjtzOjIyOiJkZWZhdWx0X2V4cG9ydF9jaGFyc2V0IjtzOjEwOiJJU08tODg1OS0xIjtzOjE0OiJ1c2VfcmVhbF9uYW1lcyI7czoyOiJvbiI7czoxNzoibWFpbF9zbXRwYXV0aF9yZXEiO3M6MDoiIjtzOjEyOiJtYWlsX3NtdHBzc2wiO2k6MDtzOjE3OiJlbWFpbF9zaG93X2NvdW50cyI7aTowO3M6MjE6ImRlZmF1bHRfZW1haWxfY2hhcnNldCI7czo1OiJVVEYtOCI7fQ==');
/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` char(36) NOT NULL,
  `user_name` varchar(60) DEFAULT NULL,
  `user_hash` varchar(255) DEFAULT NULL,
  `system_generated_password` tinyint(1) DEFAULT NULL,
  `pwd_last_changed` datetime DEFAULT NULL,
  `authenticate_id` varchar(100) DEFAULT NULL,
  `sugar_login` tinyint(1) DEFAULT 1,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT 0,
  `external_auth_only` tinyint(1) DEFAULT 0,
  `receive_notifications` tinyint(1) DEFAULT 1,
  `description` text DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `phone_home` varchar(50) DEFAULT NULL,
  `phone_mobile` varchar(50) DEFAULT NULL,
  `phone_work` varchar(50) DEFAULT NULL,
  `phone_other` varchar(50) DEFAULT NULL,
  `phone_fax` varchar(50) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `address_street` varchar(150) DEFAULT NULL,
  `address_city` varchar(100) DEFAULT NULL,
  `address_state` varchar(100) DEFAULT NULL,
  `address_country` varchar(100) DEFAULT NULL,
  `address_postalcode` varchar(20) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `portal_only` tinyint(1) DEFAULT 0,
  `show_on_employees` tinyint(1) DEFAULT 1,
  `employee_status` varchar(100) DEFAULT NULL,
  `messenger_id` varchar(100) DEFAULT NULL,
  `messenger_type` varchar(100) DEFAULT NULL,
  `reports_to_id` char(36) DEFAULT NULL,
  `is_group` tinyint(1) DEFAULT NULL,
  `factor_auth` tinyint(1) DEFAULT NULL,
  `factor_auth_interface` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_name` (`user_name`,`is_group`,`status`,`last_name`,`first_name`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('1','admin','$1$gHW4irjt$A4y0p9fgLIfOURrX1TUVX/',0,NULL,NULL,1,NULL,'Administrator',1,0,1,NULL,'2019-08-09 18:51:09','2019-08-09 18:51:09','1','','Administrator',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,0,0,1,'Active',NULL,NULL,'',0,0,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_feeds`
--

DROP TABLE IF EXISTS `users_feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_feeds` (
  `user_id` varchar(36) DEFAULT NULL,
  `feed_id` varchar(36) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  KEY `idx_ud_user_id` (`user_id`,`feed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_feeds`
--

LOCK TABLES `users_feeds` WRITE;
/*!40000 ALTER TABLE `users_feeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_feeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_last_import`
--

DROP TABLE IF EXISTS `users_last_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_last_import` (
  `id` char(36) NOT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `import_module` varchar(36) DEFAULT NULL,
  `bean_type` varchar(36) DEFAULT NULL,
  `bean_id` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_last_import`
--

LOCK TABLES `users_last_import` WRITE;
/*!40000 ALTER TABLE `users_last_import` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_last_import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_password_link`
--

DROP TABLE IF EXISTS `users_password_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_password_link` (
  `id` char(36) NOT NULL,
  `username` varchar(36) DEFAULT NULL,
  `date_generated` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_password_link`
--

LOCK TABLES `users_password_link` WRITE;
/*!40000 ALTER TABLE `users_password_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_password_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_signatures`
--

DROP TABLE IF EXISTS `users_signatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_signatures` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `signature` text DEFAULT NULL,
  `signature_html` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_usersig_uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_signatures`
--

LOCK TABLES `users_signatures` WRITE;
/*!40000 ALTER TABLE `users_signatures` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_signatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vcals`
--

DROP TABLE IF EXISTS `vcals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vcals` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `user_id` char(36) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `content` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_vcal` (`type`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vcals`
--

LOCK TABLES `vcals` WRITE;
/*!40000 ALTER TABLE `vcals` DISABLE KEYS */;
/*!40000 ALTER TABLE `vcals` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-09 12:55:18
