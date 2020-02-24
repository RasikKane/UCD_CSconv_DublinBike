-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: t1
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
  `number` smallint unsigned NOT NULL DEFAULT '65535',
  `status` varchar(16) NOT NULL DEFAULT 'close',
  `bike_stands` smallint unsigned NOT NULL DEFAULT '65535',
  `available_bike_stands` smallint unsigned NOT NULL DEFAULT '65535',
  `available_bikes` smallint unsigned NOT NULL DEFAULT '65535',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_entry_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`number`),
  UNIQUE KEY `number_UNIQUE` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dublin_bike_dynamicdata`
--

LOCK TABLES `dublin_bike_dynamicdata` WRITE;
/*!40000 ALTER TABLE `dublin_bike_dynamicdata` DISABLE KEYS */;
INSERT INTO `dublin_bike_dynamicdata` VALUES (1,'open',65535,65535,65535,'2020-02-24 19:20:21','2020-02-24 19:20:21'),(2,'open',65535,65535,65535,'2020-02-24 19:22:41','2020-02-24 19:22:41'),(3,'open',65535,65535,65535,'2020-02-24 19:23:33','2020-02-24 19:23:33'),(4,'open',65535,65535,65535,'2020-02-24 19:25:28','2020-02-24 19:25:28'),(5,'open',65535,65535,65535,'2020-02-24 19:27:13','2020-02-24 19:27:13'),(6,'open',65535,65535,65535,'2020-02-24 19:29:27','2020-02-24 19:29:27');
/*!40000 ALTER TABLE `dublin_bike_dynamicdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dublin_bike_staticdata`
--

DROP TABLE IF EXISTS `dublin_bike_staticdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dublin_bike_staticdata` (
  `number` smallint unsigned NOT NULL DEFAULT '65535',
  `contract_name` varchar(32) NOT NULL DEFAULT 'dublin',
  `name` varchar(32) NOT NULL DEFAULT 'dublin station',
  `address` varchar(32) NOT NULL DEFAULT 'dublin station address',
  `lat` float(10,6) NOT NULL DEFAULT '53.349800',
  `lng` float(10,6) NOT NULL DEFAULT '-6.260300',
  `bonus` tinyint NOT NULL DEFAULT '0',
  `banking` tinyint NOT NULL DEFAULT '0',
  `data_entry_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`number`),
  UNIQUE KEY `number_UNIQUE` (`number`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `index4` (`lat`,`lng`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `coord.lon` float(10,6) NOT NULL DEFAULT '53.349800',
  `coord.lat` float(10,6) NOT NULL DEFAULT '-6.260300',
  `weather.id` smallint unsigned NOT NULL DEFAULT '65535',
  `weather.main` varchar(16) NOT NULL DEFAULT 'weather main',
  `weather.discription` varchar(32) NOT NULL DEFAULT 'weather discription',
  `weather.icon` varchar(16) NOT NULL DEFAULT 'weather icon',
  `base` varchar(16) NOT NULL DEFAULT 'weather base',
  `main.temp` float(5,2) NOT NULL DEFAULT '999.99',
  `main.feels_like` float(5,2) NOT NULL DEFAULT '999.99',
  `main.pressure` smallint unsigned NOT NULL DEFAULT '65535',
  `main.humidity` smallint unsigned NOT NULL DEFAULT '65535',
  `main.temp_min` float(5,2) NOT NULL DEFAULT '999.99',
  `main.temp_max` float(5,2) NOT NULL DEFAULT '999.99',
  `main.sea_level` smallint unsigned NOT NULL DEFAULT '65535',
  `main.grnd_level` smallint unsigned NOT NULL DEFAULT '65535',
  `wind.speed` float(5,2) NOT NULL DEFAULT '999.99',
  `wind.deg` smallint unsigned NOT NULL DEFAULT '65535',
  `clouds.all` smallint unsigned NOT NULL DEFAULT '65535',
  `visibility` smallint unsigned NOT NULL DEFAULT '65535',
  `rain.1h` float(5,2) NOT NULL DEFAULT '999.99',
  `rain.3h` float(5,2) NOT NULL DEFAULT '999.99',
  `snow.1h` float(5,2) NOT NULL DEFAULT '999.99',
  `snow.3h` float(5,2) NOT NULL DEFAULT '999.99',
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sys.type` smallint unsigned NOT NULL DEFAULT '65535',
  `sys.id` smallint unsigned NOT NULL DEFAULT '65535',
  `sys.message` varchar(16) NOT NULL DEFAULT 'system message',
  `sys.country` varchar(16) NOT NULL DEFAULT 'system country',
  `sys.sunrise` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sys.sunset` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `timezone` smallint unsigned NOT NULL DEFAULT '65535',
  `id` varchar(16) NOT NULL DEFAULT 'city id',
  `name` varchar(32) NOT NULL DEFAULT 'city name',
  `cod` smallint unsigned NOT NULL DEFAULT '65535',
  `data_entry_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `main.pressure_UNIQUE` (`main.pressure`)
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
-- Dumping events for database 't1'
--

--
-- Dumping routines for database 't1'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-24 19:33:12
