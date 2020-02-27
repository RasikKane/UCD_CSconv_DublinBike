-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_24_2_1933
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `dublin_bike_dynamicdata`
--

DROP TABLE IF EXISTS `dublin_bike_dynamicdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dublin_bike_dynamicdata` (
  `id_Entry` int unsigned NOT NULL AUTO_INCREMENT,
  `number` smallint unsigned NOT NULL,
  `status` varchar(16) NOT NULL,
  `bike_stands` smallint unsigned NOT NULL,
  `available_bike_stands` smallint unsigned NOT NULL,
  `available_bikes` smallint unsigned NOT NULL,
  `last_update` timestamp NULL DEFAULT NULL,
  `data_entry_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_Entry`),
  UNIQUE KEY `id_Entry_UNIQUE` (`id_Entry`)
) ENGINE=InnoDB AUTO_INCREMENT=1097 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dublin_bike_dynamicdata`
--

LOCK TABLES `dublin_bike_dynamicdata` WRITE;
/*!40000 ALTER TABLE `dublin_bike_dynamicdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `dublin_bike_dynamicdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dublin_bike_staticdata`
--

DROP TABLE IF EXISTS `dublin_bike_staticdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dublin_bike_staticdata` (
  `number` int unsigned NOT NULL AUTO_INCREMENT,
  `contract_name` varchar(32) NOT NULL,
  `name` varchar(64) NOT NULL,
  `address` varchar(64) NOT NULL,
  `position_lat` float(10,6) NOT NULL,
  `position_lng` float(10,6) NOT NULL,
  `bonus` tinyint unsigned NOT NULL,
  `banking` tinyint unsigned NOT NULL,
  `data_entry_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`number`),
  UNIQUE KEY `number_UNIQUE` (`number`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `index4` (`position_lat`,`position_lng`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dublin_bike_staticdata`
--

LOCK TABLES `dublin_bike_staticdata` WRITE;
/*!40000 ALTER TABLE `dublin_bike_staticdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `dublin_bike_staticdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `open_weather_dynamicdata`
--

DROP TABLE IF EXISTS `open_weather_dynamicdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `open_weather_dynamicdata` (
  `id_Entry` int unsigned NOT NULL AUTO_INCREMENT,
  `coord_lon` float(10,6) DEFAULT NULL,
  `coord_lat` float(10,6) DEFAULT NULL,
  `weather_id` smallint unsigned DEFAULT NULL,
  `weather_main` varchar(32) DEFAULT NULL,
  `weather_description` varchar(64) DEFAULT NULL,
  `weather_icon` varchar(32) DEFAULT NULL,
  `base` varchar(32) DEFAULT NULL,
  `main_temp` float(5,2) DEFAULT NULL,
  `main_feels_like` float(5,2) DEFAULT NULL,
  `main_pressure` smallint unsigned DEFAULT NULL,
  `main_humidity` smallint unsigned DEFAULT NULL,
  `main_temp_min` float(5,2) DEFAULT NULL,
  `main_temp_max` float(5,2) DEFAULT NULL,
  `main_sea_level` smallint unsigned DEFAULT NULL,
  `main_grnd_level` smallint unsigned DEFAULT NULL,
  `wind_speed` float(5,2) DEFAULT NULL,
  `wind_deg` smallint unsigned DEFAULT NULL,
  `wind_gust` float(5,3) unsigned DEFAULT NULL,
  `clouds_all` smallint unsigned DEFAULT NULL,
  `visibility` smallint unsigned DEFAULT NULL,
  `rain_1h` float(5,2) DEFAULT NULL,
  `rain_3h` float(5,2) DEFAULT NULL,
  `snow_1h` float(5,2) DEFAULT NULL,
  `snow_3h` float(5,2) DEFAULT NULL,
  `dt` timestamp NULL DEFAULT NULL,
  `sys_type` smallint unsigned DEFAULT NULL,
  `sys_id` smallint unsigned DEFAULT NULL,
  `sys_message` varchar(32) DEFAULT NULL,
  `sys_country` varchar(32) DEFAULT NULL,
  `sys_sunrise` timestamp NULL DEFAULT NULL,
  `sys_sunset` timestamp NULL DEFAULT NULL,
  `timezone` smallint unsigned DEFAULT NULL,
  `id` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `cod` smallint unsigned DEFAULT NULL,
  `data_entry_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_Entry`),
  UNIQUE KEY `id_Entry_UNIQUE` (`id_Entry`),
  UNIQUE KEY `main.pressure_UNIQUE` (`main_pressure`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_weather_dynamicdata`
--

LOCK TABLES `open_weather_dynamicdata` WRITE;
/*!40000 ALTER TABLE `open_weather_dynamicdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `open_weather_dynamicdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_24_2_1933'
--

--
-- Dumping routines for database 'db_24_2_1933'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-26  9:47:46
