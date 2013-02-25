-- MySQL dump 10.13  Distrib 5.5.28, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: bdlab
-- ------------------------------------------------------
-- Server version	5.5.28-0ubuntu0.12.10.2

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
-- Current Database: `bdlab`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `bdlab` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `bdlab`;

--
-- Table structure for table `arbols`
--

DROP TABLE IF EXISTS `arbols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arbols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` int(11) NOT NULL,
  `text` varchar(100) NOT NULL DEFAULT '',
  `vinculo` varchar(100) NOT NULL DEFAULT '',
  `padre_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arbols`
--

LOCK TABLES `arbols` WRITE;
/*!40000 ALTER TABLE `arbols` DISABLE KEYS */;
INSERT INTO `arbols` VALUES (5,1,'Registrar Planes de Servicios','',0),(4,1,'Estado de la Proforma','',0),(14,4,'Registrar Marca','',0),(2,1,'Configurar nuevo Indicador','',1),(1,1,'Indicadores','',0),(6,1,'Lista de Espera','',0),(15,4,'Registrar Concesionario','',0),(7,3,'Actualizar Datos Personales','',0),(8,3,'Lista de Espera','',0),(9,3,'Anular Pedido','',0),(10,3,'Catalogo Vehiculos','',0),(11,3,'Proforma','',0),(12,3,'Comprar Vehiculo','',0),(13,4,'Registrar Ensambladora','',0),(16,4,'Lista de Espera de Pedido','',0),(17,4,'Listado de Concesionarios','',0),(18,4,'Listado de Ensambladoras','',0),(19,4,'Listado de Marcas','',0),(20,3,'Ford','',10),(21,3,'Fiat','',10),(22,3,'Daewood','',10),(23,3,'Toyota','',10),(24,3,'Huyndai','',10),(25,3,'Portal Ejecutivo','',0),(26,3,'Configurar Nuevo Indicador','',25),(27,3,'Indicadores Activos ','',25),(28,3,'Indicador','',27),(29,3,'Indicador','',27);
/*!40000 ALTER TABLE `arbols` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inicios`
--

DROP TABLE IF EXISTS `inicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inicios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` int(11) NOT NULL,
  `text` varchar(25) NOT NULL DEFAULT '',
  `vinculo` varchar(100) NOT NULL DEFAULT '',
  `padre_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inicios`
--

LOCK TABLES `inicios` WRITE;
/*!40000 ALTER TABLE `inicios` DISABLE KEYS */;
INSERT INTO `inicios` VALUES (6,2,'Conocenos Ford','',1),(5,2,'Toyota','',0),(4,2,'Hyundai','',0),(10,2,'Conocenos Toyota','',5),(2,2,'Daewood','',0),(3,2,'Chevroleth','',0),(1,2,'Ford','',0),(7,2,'Conocenos Daewood','',2),(8,2,'Conocenos Chevroleth','',3),(9,2,'Conocenos Hyundai','',4);
/*!40000 ALTER TABLE `inicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_ejecutivos`
--

DROP TABLE IF EXISTS `menu_ejecutivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_ejecutivos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` int(11) NOT NULL,
  `text` varchar(500) NOT NULL DEFAULT '',
  `vinculo` varchar(100) NOT NULL DEFAULT '',
  `padre_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_ejecutivos`
--

LOCK TABLES `menu_ejecutivos` WRITE;
/*!40000 ALTER TABLE `menu_ejecutivos` DISABLE KEYS */;
INSERT INTO `menu_ejecutivos` VALUES (1,2,'Concesionarios','',0),(2,2,'Ensambladoras','',0),(3,2,'Comprador','',0),(4,2,'Configurar Nuevo Indicador','',1),(5,2,'Configurar Nuevo Indicador','',2),(6,2,'Configurar Nuevo Indicador','',3),(8,2,'Numero de Vehiculos Vendidos por Marca Ford','',7),(7,2,'Indicadores Activados','',0),(9,2,'Ingreso en Bolivares de Vehiculos Vendidos por Marca','',7),(10,2,'Promedio de Vehiculos Ensamblados','',7);
/*!40000 ALTER TABLE `menu_ejecutivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_ensambladoras`
--

DROP TABLE IF EXISTS `menu_ensambladoras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_ensambladoras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` int(11) NOT NULL,
  `text` varchar(50) NOT NULL DEFAULT '',
  `vinculo` varchar(100) NOT NULL DEFAULT '',
  `padre_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_ensambladoras`
--

LOCK TABLES `menu_ensambladoras` WRITE;
/*!40000 ALTER TABLE `menu_ensambladoras` DISABLE KEYS */;
INSERT INTO `menu_ensambladoras` VALUES (1,2,'Registrar o Modificar Nuevos Vehiculos','',0),(7,2,'Portal Ejecutivo','',0),(2,2,'Listado de Pedidos por Concesionario','',0),(3,2,'Configurar Nuevo Indicador','',7),(4,2,'Indicadores Activos','',7),(5,2,'Promedio de Vehiculos Ensamblados','',4),(6,2,'Numero de Vehiculos Vendidos por Marca Ford','',4),(8,2,'Ingreso en Bolivares de Vehiculos Vendidos por Mar','',4);
/*!40000 ALTER TABLE `menu_ensambladoras` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-02-25 14:42:26
