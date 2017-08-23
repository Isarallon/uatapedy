CREATE DATABASE  IF NOT EXISTS `duchy` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `duchy`;
-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: duchy
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

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
-- Table structure for table `escrever`
--

DROP TABLE IF EXISTS `escrever`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `escrever` (
  `e_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `h_codigo` int(11) NOT NULL,
  `us_email` varchar(100) NOT NULL,
  PRIMARY KEY (`e_codigo`),
  UNIQUE KEY `e_codigo_UNIQUE` (`e_codigo`),
  KEY `eh_fk` (`h_codigo`),
  KEY `eus_fk` (`us_email`),
  CONSTRAINT `eh_fk` FOREIGN KEY (`h_codigo`) REFERENCES `historia` (`h_codigo`),
  CONSTRAINT `eus_fk` FOREIGN KEY (`us_email`) REFERENCES `usuario` (`us_email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escrever`
--

LOCK TABLES `escrever` WRITE;
/*!40000 ALTER TABLE `escrever` DISABLE KEYS */;
/*!40000 ALTER TABLE `escrever` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historia`
--

DROP TABLE IF EXISTS `historia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historia` (
  `h_qtdcaps` decimal(10,0) DEFAULT NULL,
  `h_qtdpalavras` decimal(10,0) DEFAULT NULL,
  `h_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `h_genero` varchar(30) NOT NULL,
  `h_nome` varchar(100) NOT NULL,
  PRIMARY KEY (`h_codigo`),
  UNIQUE KEY `h_codigo_UNIQUE` (`h_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historia`
--

LOCK TABLES `historia` WRITE;
/*!40000 ALTER TABLE `historia` DISABLE KEYS */;
/*!40000 ALTER TABLE `historia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ler`
--

DROP TABLE IF EXISTS `ler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ler` (
  `l_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `h_codigo` int(11) NOT NULL,
  `us_email` varchar(100) NOT NULL,
  PRIMARY KEY (`l_codigo`),
  UNIQUE KEY `l_codigo_UNIQUE` (`l_codigo`),
  KEY `lh_fk` (`h_codigo`),
  KEY `lus_fk` (`us_email`),
  CONSTRAINT `lh_fk` FOREIGN KEY (`h_codigo`) REFERENCES `historia` (`h_codigo`),
  CONSTRAINT `lus_fk` FOREIGN KEY (`us_email`) REFERENCES `usuario` (`us_email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ler`
--

LOCK TABLES `ler` WRITE;
/*!40000 ALTER TABLE `ler` DISABLE KEYS */;
/*!40000 ALTER TABLE `ler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `us_email` varchar(100) NOT NULL,
  `us_user` varchar(50) NOT NULL,
  `us_senha` varchar(100) NOT NULL,
  `us_admin` tinyint(1) NOT NULL DEFAULT '0',
  `us_nome` varchar(100) NOT NULL,
  PRIMARY KEY (`us_email`),
  UNIQUE KEY `us_email_UNIQUE` (`us_email`),
  UNIQUE KEY `us_user_UNIQUE` (`us_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-23 11:21:51
