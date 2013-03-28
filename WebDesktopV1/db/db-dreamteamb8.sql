-- MySQL dump 10.13  Distrib 5.5.28, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: db-dreamteamb
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
-- Current Database: `db-dreamteamb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db-dreamteamb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db-dreamteamb`;

--
-- Table structure for table `accesorios`
--

DROP TABLE IF EXISTS `accesorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accesorios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  `costo` float NOT NULL,
  `tipo_accesorio_id` int(11) NOT NULL,
  `concesionario_vehiculos_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_idx` (`tipo_accesorio_id`),
  KEY `fk_accesorios_concesionario_vehiculos1_idx` (`concesionario_vehiculos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accesorios`
--

LOCK TABLES `accesorios` WRITE;
/*!40000 ALTER TABLE `accesorios` DISABLE KEYS */;
/*!40000 ALTER TABLE `accesorios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arbols`
--

DROP TABLE IF EXISTS `arbols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arbols` (
  `id` int(11) NOT NULL,
  `tipo` int(11) DEFAULT NULL,
  `texto` varchar(45) DEFAULT NULL,
  `vinculo` varchar(45) DEFAULT NULL,
  `padre_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arbols`
--

LOCK TABLES `arbols` WRITE;
/*!40000 ALTER TABLE `arbols` DISABLE KEYS */;
INSERT INTO `arbols` VALUES (1,1,'Registrar o Modificar Nuevos Vehiculos','',0),(2,1,'Listado de Pedidos por Concesionario','',0),(3,1,'Configurar Nuevo Indicador','',4),(4,1,'Portal Ejecutivo','',0),(10,3,'Registrar Planes de Servicios','',0),(11,3,'Estado de la Proforma','',0),(12,3,'Portal Ejecutivo','',0),(13,3,'Configurar nuevo Indicador','',12),(14,3,'Lista de Espera','',0),(16,4,'Lista de Espera','',0),(17,4,'Anular Pedido','',0),(18,4,'Galeria','',0),(19,4,'Proforma','',0),(20,4,'Comprar Vehiculo','',0),(28,5,'Registrar Marca','',0),(29,5,'Registrar Concesionario','',0),(30,5,'Registrar Ensambladora','',0),(31,5,'Lista de Espera de Pedido','',0),(32,5,'Listado de Concesionarios','',0),(33,5,'Listado de Ensambladoras','',0),(34,5,'Listado de Marcas','',0),(35,1,'Registrar Modelo de Vehiculo',NULL,0),(36,1,'Registrar Caracteristica de un Modelo','',0);
/*!40000 ALTER TABLE `arbols` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bancos`
--

DROP TABLE IF EXISTS `bancos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bancos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rif` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bancos`
--

LOCK TABLES `bancos` WRITE;
/*!40000 ALTER TABLE `bancos` DISABLE KEYS */;
/*!40000 ALTER TABLE `bancos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bancos_comprador_vehiculos`
--

DROP TABLE IF EXISTS `bancos_comprador_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bancos_comprador_vehiculos` (
  `bancos_id` int(11) NOT NULL,
  `comprador_vehiculos_id` int(11) NOT NULL,
  `nro_cuentas` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`bancos_id`,`comprador_vehiculos_id`),
  KEY `fk_bancos_has_comprador_vehiculos_comprador_vehiculos1_idx` (`comprador_vehiculos_id`),
  KEY `fk_bancos_has_comprador_vehiculos_bancos1_idx` (`bancos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bancos_comprador_vehiculos`
--

LOCK TABLES `bancos_comprador_vehiculos` WRITE;
/*!40000 ALTER TABLE `bancos_comprador_vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `bancos_comprador_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bancos_concesionario_vehiculos`
--

DROP TABLE IF EXISTS `bancos_concesionario_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bancos_concesionario_vehiculos` (
  `bancos_id` int(11) NOT NULL,
  `concesionario_vehiculos_id` int(11) NOT NULL,
  PRIMARY KEY (`bancos_id`,`concesionario_vehiculos_id`),
  KEY `fk_bancos_has_concesionario_vehiculos_concesionario_vehicul_idx` (`concesionario_vehiculos_id`),
  KEY `fk_bancos_has_concesionario_vehiculos_bancos1_idx` (`bancos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bancos_concesionario_vehiculos`
--

LOCK TABLES `bancos_concesionario_vehiculos` WRITE;
/*!40000 ALTER TABLE `bancos_concesionario_vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `bancos_concesionario_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caracteristicas`
--

DROP TABLE IF EXISTS `caracteristicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caracteristicas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `valor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caracteristicas`
--

LOCK TABLES `caracteristicas` WRITE;
/*!40000 ALTER TABLE `caracteristicas` DISABLE KEYS */;
INSERT INTO `caracteristicas` VALUES (1,'Color','Color-Negro'),(2,'Color','Color-Blanco'),(3,'Color','Color-Plateado'),(4,'Color','Color-Rojo'),(5,'Color','Color-Azul'),(6,'Tapiceria','Tapiceria-Cuero'),(7,'Tapiceria','Tapiceria-Semi-Cuero'),(8,'Tapiceria','Tapiceria-Tela'),(9,'Trasmision','Trasmision Sincronico'),(10,'Trasmision','Trasmision Hidromatico');
/*!40000 ALTER TABLE `caracteristicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudads`
--

DROP TABLE IF EXISTS `ciudads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `estados_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ciudad_estado1_idx` (`estados_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudads`
--

LOCK TABLES `ciudads` WRITE;
/*!40000 ALTER TABLE `ciudads` DISABLE KEYS */;
INSERT INTO `ciudads` VALUES (1,'Carora',1),(2,'El Tocuyo',1),(3,'Quibor',1),(4,'Cabudare',1),(5,'San Felipe',2),(6,'Yaritagua',2),(7,'Nirgua',2);
/*!40000 ALTER TABLE `ciudads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprador_vehiculos`
--

DROP TABLE IF EXISTS `comprador_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comprador_vehiculos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(45) DEFAULT NULL,
  `nombres` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `sexo` varchar(45) DEFAULT NULL,
  `usuarios_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comprador_vehiculos_usuarios1_idx` (`usuarios_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprador_vehiculos`
--

LOCK TABLES `comprador_vehiculos` WRITE;
/*!40000 ALTER TABLE `comprador_vehiculos` DISABLE KEYS */;
INSERT INTO `comprador_vehiculos` VALUES (1,'19618874','maria','paez','123456','carora','mandnd@gndhj.com','1990-01-24','femenino',1);
/*!40000 ALTER TABLE `comprador_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concesionario_vehiculos`
--

DROP TABLE IF EXISTS `concesionario_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concesionario_vehiculos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rif` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `latitud` varchar(45) DEFAULT NULL,
  `longitud` varchar(45) DEFAULT NULL,
  `ciudads_id` int(11) NOT NULL,
  `usuarios_id` int(11) NOT NULL,
  `marcas_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_concesionario_vehiculos_ciudad1_idx` (`ciudads_id`),
  KEY `fk_concesionario_vehiculos_usuarios1_idx` (`usuarios_id`),
  KEY `fk_concesionario_vehiculos_marcas1_idx` (`marcas_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concesionario_vehiculos`
--

LOCK TABLES `concesionario_vehiculos` WRITE;
/*!40000 ALTER TABLE `concesionario_vehiculos` DISABLE KEYS */;
INSERT INTO `concesionario_vehiculos` VALUES (1,'L-123789','Concesionario Ford','Pedro Leon Torres con calle 54','0251-2456789','concesionarioford@gmail.com',NULL,NULL,1,5,1),(2,'N-456189','Concesionario Toyota','Calle 1300 con carrera 2000','0251-4569845','concesionariotoyota@gmail.com',NULL,NULL,4,6,4),(3,'T-8976','Concesionario Daewood','calle 300 entre carreras 90 y 91','0251-2345465','concesionariodaewood@gmail.com',NULL,NULL,5,9,2);
/*!40000 ALTER TABLE `concesionario_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_vehiculos`
--

DROP TABLE IF EXISTS `detalle_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_vehiculos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehiculos_id` int(11) NOT NULL,
  `color` int(11) DEFAULT NULL,
  `transmision` int(11) DEFAULT NULL,
  `tapiceria` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_detalle_vehiculos_vehiculos1_idx` (`vehiculos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_vehiculos`
--

LOCK TABLES `detalle_vehiculos` WRITE;
/*!40000 ALTER TABLE `detalle_vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ensambladora_vehiculos`
--

DROP TABLE IF EXISTS `ensambladora_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ensambladora_vehiculos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `rif` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `ciudads_id` int(11) NOT NULL,
  `usuarios_id` int(11) NOT NULL,
  `marcas_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ensambladora_vehiculos_ciudad1_idx` (`ciudads_id`),
  KEY `fk_ensambladora_vehiculos_usuarios1_idx` (`usuarios_id`),
  KEY `fk_ensambladora_vehiculos_marcas1_idx` (`marcas_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ensambladora_vehiculos`
--

LOCK TABLES `ensambladora_vehiculos` WRITE;
/*!40000 ALTER TABLE `ensambladora_vehiculos` DISABLE KEYS */;
INSERT INTO `ensambladora_vehiculos` VALUES (1,'Ensambladora Chevrolet','T-U896','Calle 53','0251-5674323','ensambladorachevrlet@gmail.com',6,10,6);
/*!40000 ALTER TABLE `ensambladora_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'Lara'),(2,'Yaracuy'),(3,'Carabobo'),(4,'Zulia'),(5,'Trujullo');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados_indicadors`
--

DROP TABLE IF EXISTS `estados_indicadors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estados_indicadors` (
  `id_estado` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados_indicadors`
--

LOCK TABLES `estados_indicadors` WRITE;
/*!40000 ALTER TABLE `estados_indicadors` DISABLE KEYS */;
INSERT INTO `estados_indicadors` VALUES (1,'Activado'),(2,'Inactivo');
/*!40000 ALTER TABLE `estados_indicadors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `existencia_vehiculos`
--

DROP TABLE IF EXISTS `existencia_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `existencia_vehiculos` (
  `id_existencia` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` varchar(45) DEFAULT NULL,
  `modelo_vehiculos_id` int(11) NOT NULL,
  `concesionario_vehiculos_id` int(11) NOT NULL,
  PRIMARY KEY (`id_existencia`),
  KEY `fk_existencia_vehiculos_modelo_vehiculos1_idx` (`modelo_vehiculos_id`),
  KEY `fk_existencia_vehiculos_concesionario_vehiculos1_idx` (`concesionario_vehiculos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `existencia_vehiculos`
--

LOCK TABLES `existencia_vehiculos` WRITE;
/*!40000 ALTER TABLE `existencia_vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `existencia_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_accesorios`
--

DROP TABLE IF EXISTS `factura_accesorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura_accesorios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comprador_vehiculos_id` int(11) NOT NULL,
  `vehiculo_accesorios_id` int(11) NOT NULL,
  `iva` float NOT NULL,
  `formas_pagos_id` int(11) NOT NULL,
  `subtotal` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_factura_accesorios_vehiculo_accesorios_idx` (`vehiculo_accesorios_id`),
  KEY `fk_factura_accesorios_formas_pagos2_idx` (`formas_pagos_id`),
  KEY `fk_factura_accesorios_comprador_vehiculos1_idx` (`comprador_vehiculos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_accesorios`
--

LOCK TABLES `factura_accesorios` WRITE;
/*!40000 ALTER TABLE `factura_accesorios` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura_accesorios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_servicios`
--

DROP TABLE IF EXISTS `factura_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura_servicios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iva` float DEFAULT NULL,
  `plan_servicios_id` int(11) NOT NULL,
  `comprador_vehiculos_id` int(11) NOT NULL,
  `bancos_id` int(11) NOT NULL,
  `formas_pagos_id` int(11) NOT NULL,
  `subtotal` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_factura_servicios_plan_servicios1_idx` (`plan_servicios_id`),
  KEY `fk_factura_servicios_comprador_vehiculos1_idx` (`comprador_vehiculos_id`),
  KEY `fk_factura_servicios_bancos1_idx` (`bancos_id`),
  KEY `fk_factura_servicios_formas_pagos1_idx` (`formas_pagos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_servicios`
--

LOCK TABLES `factura_servicios` WRITE;
/*!40000 ALTER TABLE `factura_servicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura_servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facturas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `solicitud_vehiculos_id` int(11) NOT NULL,
  `iva` float NOT NULL,
  `subtotal` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_facturas_solicitud_vehiculos1_idx` (`solicitud_vehiculos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formas_pagos`
--

DROP TABLE IF EXISTS `formas_pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formas_pagos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formas_pagos`
--

LOCK TABLES `formas_pagos` WRITE;
/*!40000 ALTER TABLE `formas_pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `formas_pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frecuencia_notificacions`
--

DROP TABLE IF EXISTS `frecuencia_notificacions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frecuencia_notificacions` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frecuencia_notificacions`
--

LOCK TABLES `frecuencia_notificacions` WRITE;
/*!40000 ALTER TABLE `frecuencia_notificacions` DISABLE KEYS */;
INSERT INTO `frecuencia_notificacions` VALUES (1,'Diaria'),(2,'Semanal'),(3,'Mensual'),(4,'Anual');
/*!40000 ALTER TABLE `frecuencia_notificacions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garantia_vehiculos`
--

DROP TABLE IF EXISTS `garantia_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `garantia_vehiculos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_emision` date DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `cobertura` varchar(45) DEFAULT NULL,
  `vehiculos_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_garantia_vehiculos_vehiculos1_idx` (`vehiculos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garantia_vehiculos`
--

LOCK TABLES `garantia_vehiculos` WRITE;
/*!40000 ALTER TABLE `garantia_vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `garantia_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indicadors`
--

DROP TABLE IF EXISTS `indicadors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indicadors` (
  `id` int(10) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `funcion` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indicadors`
--

LOCK TABLES `indicadors` WRITE;
/*!40000 ALTER TABLE `indicadors` DISABLE KEYS */;
INSERT INTO `indicadors` VALUES (1,'Numero de Vehiculos Vendidos',NULL,NULL),(2,'Promedio de Vehiculos Vendidos',NULL,NULL);
/*!40000 ALTER TABLE `indicadors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marcas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `imagen` longblob,
  `mision` text,
  `imagen1` char(100) DEFAULT NULL,
  `vision` text,
  `valores` text,
  `contacto` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'Toyota',NULL,'Letras Letras letras',NULL,'Letras Letras letras','Letras Letras letras','Letras Letras letras'),(2,'Daewood',NULL,'Letras Letras letras',NULL,'Letras Letras letras','Letras Letras letras','Letras Letras letras'),(3,'Ford',NULL,'Letras Letras letras',NULL,'Letras Letras letras','Letras Letras letras','Letras Letras letras'),(4,'Chevrolet',NULL,'Letras',NULL,'Letras','Letras','Letras'),(5,'Jeep','C:\\fakepath\\stccargo2.jpg','La mejor',NULL,'LA MEJO','la mejond','kadksdok');
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo_caracteristicas`
--

DROP TABLE IF EXISTS `modelo_caracteristicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modelo_caracteristicas` (
  `caracteristicas_id` int(11) NOT NULL,
  `modelo_vehiculos_id` int(11) NOT NULL,
  `ensambladora_vehiculos_id` int(11) NOT NULL,
  KEY `fk_modelo_caracteristicas_caracteristicas1_idx` (`caracteristicas_id`),
  KEY `fk_modelo_caracteristicas_modelo_vehiculos1_idx` (`modelo_vehiculos_id`),
  KEY `fk_modelo_caracteristicas_ensambladora_vehiculos1_idx` (`ensambladora_vehiculos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo_caracteristicas`
--

LOCK TABLES `modelo_caracteristicas` WRITE;
/*!40000 ALTER TABLE `modelo_caracteristicas` DISABLE KEYS */;
INSERT INTO `modelo_caracteristicas` VALUES (7,1,1),(9,1,1),(7,1,1);
/*!40000 ALTER TABLE `modelo_caracteristicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo_vehiculos`
--

DROP TABLE IF EXISTS `modelo_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modelo_vehiculos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `ano_m` varchar(45) DEFAULT NULL,
  `marcas_id` int(11) NOT NULL,
  `tipo_vehiculos_id` int(11) NOT NULL,
  `imagen1` longblob,
  `imagen2` longblob,
  `imagen3` char(100) DEFAULT NULL,
  `imgen5` char(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_modelo_vehiculos_marcas1_idx` (`marcas_id`),
  KEY `fk_modelo_vehiculos_tipo_vehiculos1_idx` (`tipo_vehiculos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo_vehiculos`
--

LOCK TABLES `modelo_vehiculos` WRITE;
/*!40000 ALTER TABLE `modelo_vehiculos` DISABLE KEYS */;
INSERT INTO `modelo_vehiculos` VALUES (1,'Ford 4x4 fortaleza','2010',3,1,NULL,NULL,NULL,NULL),(2,'qwer bnm','2007',4,2,'C:\\fakepath\\camioneta1.jpg',NULL,NULL,NULL),(3,'chevrolet 4x4 ','2009',1,1,'ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0„\0	\'\Z#/ $\'),,,150*5&+,)	\n\n\r))),)),)))))),))))))),))))))))1))*),0)*)))))))))),+ÿÀ\0\0 ;\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0Q\0\r\0\0\0!1AQa\"q‘2BRS‚’“¡±ÁÑÒ#3CTr¢Óğ$b£²Â4DƒÃá„¤ñ%cdtÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0!1AqÁ\"ÿÚ\0\0\0?\0¼h¢ŠŠ( (¢ŠŠ( (¢ŠŠ+ÂqAí¦[ıäUsjòÊ\0%#RÚAÎ“#ˆÁÁÆ®x8Î\rhŞIÊ!í2ıaúhËúÇ®ôÁ.Î¸÷L>q¿Ù]7Oc(çÕÚ?ú®~Ê*^n@­M´ãİGœUÖÑºhÎ\nÛçÂŞ3ô³55K·\\r5½¿Û©¦-VÛrÆ<î¿}jmæ¶î!yºªgŞ™Ç\'Í·ğkD›év9MşU·ğªv\\[‡{­?Zƒç£üU‡õÎÏ8ö]¿ÏEøª©zoØgÙ¿µ¿ğkÆŞ;ÿ\0‡·o<VçşØ¦¦-ÄŞ«SÊææ–3şêŞ›rÊXÏ™ÔıµJÉ¼W¾é,ßö­à?u&“m¹üæËÙ²é£Ö­šºbûKÅ<|Õ˜œw×<«l8É±ã_\'¹ƒÕ§…\"mèø‚K¨Ê¸á¥)EÔlŒ–Ös<i¦:TJ;ë ÕPZí\0j¾½ü®)€ÏvtŠrÙ›×#êïÃõjëí×@«Š@ ÷ãW½4Óuİ½çk†Æ«y^ŞRp{DÃ#<xê>j“ƒUÑEQ@QEQ@QEQ@QEQ@QEW„ĞØ¨nÛŞ)g¸6v2şšb3²o|çí#°+†õï$²L,lpndwæ¶ñğÌÜÏˆí\"öFËƒg[Ó‰öÎííåsíÏyõ\0\0½‰±b³‡«Lœ’Ò;RK!Æ©$nÖ8\0\0\0°Ú}Pp5Ú»ÑÏBv¶òcÇ€¬ÚÖ&{C{|i†ûy¿ŸÕQ!´7Às¤7;KSšŠÜmÌó¬#Ûˆ9¦O£EÚî•ìÍ¤‰GÊc\\\0óùêa§©o‹6Dmì}¤R{™Y¹GUf×5¦Iè¤ì¯İôŠÓ-#Ç\nÜÓÓ]¥ØÔËÚX‘D/êÛß¦¼Ã{ÿ\0®µ™«L÷šTš£zÌÁôƒÙœÔ_lKıãÒ¿HãìÒ[\'»)“kI™ı+öU‘-]wl!ìÒ;|*)·¶™‚í.£à%*²÷u‰­Ïr‡Ã=õ9ÙB[Hˆâ4cÒ¤©úA¦Í©¸½|rGËP8=ÇšŸAÇª¢·mª. K›PúI\0L£ÛA.=¸a‘Ç“É©îåï”Wöë,g©O¶FíSæ9ğªt¯¤Y:—Êº±B0àá—Ï¨”iÚÃj¾ÊÚøˆ.²½™ı(¿“E]GEÑZm. e9äAVêÓ\"Š( (¢ŠŠ( (¢ŠŠ( (¢ŠŠ( )·iïÿ\0š8óË¬uLù<iÅ¹W/ôÛv[lÊ¸ ?ÖÆ‚ùn’öpç{oó‹öR]ñßa1­°Ü\\ám‘puû sËÑ’9†ÎÜÊQY˜éÆNx“G®­½m41{\"IYo\n,0¡¦öñ® œF²6=±È\0×jŠ±6Ê]™nÅÛ¬¹˜ë¸—™w9à	ã¥r@$ócQâŞ€IËIªãkìËë†&[ÀÙ?¤˜qáÍ¸pîšNàHO«1ûW	Ÿ¦¢¥7ûs9ò†|ôÆ×„ÑmÑÄÀ^ÚüY¡?÷)ÆF\rÌMçšl?\n_¦2{OÛÿ\0Š@f©2îDœŒñ°ìh›fÎ¯¦µ¶à9ı*ú$Š©ˆá–µ<Õ\"“£—?¤ÿ\02#IdèÍ½ÿ\0ïG÷Sa†Ó·d÷Ã‡€¥`³ärÈÀû«ctm äÍèÒ~ªÔÛƒ:ö¿Éû©àò]ì€y¿ÕM¶óaåı¯¯4¥wVé—J«¸ı†b==‚›®ö<ç­‘½Y•›äj×B—¡ßIv…Ç’1ßö\Z@\Z68dÿ\0†7cêÍ:\\n­ÙEu‚G†U„l¤ƒÈ•æ\rÖ\'¦ûÉs7¤}•²è¼M¦D*AÆ{#çºoi2Ùª“è½ÄĞ˜Éâ¾Pó`ßH*—oÖşÁ²LH`yå”\n¤(URYyœã‡aåU6èt§ŒêÍº€êÚ†$ã\rÜtŸE4t¿«´îÖh‘ãE‰cÒädÎÄù<=Ş=‹XmíëIoåºŠˆHË&jtÈİ+—:tŞış‹hÇQÙ¼wbÛ­V]Dé#\ZAÁÏ`ªğÊOm:nŒZ¶…ª÷Ïÿ\01h:3¢-ºe´ê_ó–ìc#´.N‘è!ÓâU\\÷Ñ¦Ş0í™ãc…yæCñ¤b§\\|s]\0“9ÕFÊ+ÍBŒĞ{EPQEEPQEEP‹8HØWíÍúºœ“cjòÀ­ 2€]AÒN‚9<yàvPNö†òÃÒÒ\r~ñrÎ|È¹o¢ªëİË«ö»¹º’0Ø«Ë&%8•O@f±]ãÚ#@]1uŒQp“€Ydû¢0{ÍFÛyG#J™}e¤‘ƒ;™¥vÖ¡*óY<£Ø«QR¸o6T¢3zÊ;¬J}¢°“xöpö»:Y<dšVú5b¢¿ÖğP‹8â!–qù†ÁÇ¦½ÛÛòğÈ±¬Cóq9ö‹ùÔWÖ1È0ãõSR…Şûeö›ûJë¶¯H=¦È·h”}B Ÿ×©›‡V£ş¤ßcŠÕ.óÌ{µ?~>\Z˜š°ÿ\0´û±ívlCÌ‡î¬‡Kwã•’Šj­—oJ}ÊúLßÄ¤í¶d>åÌş%0[_Û%øÿ\0’_SVC¦»ÑÎÄz5U<vÌôzäüt·dm’M,¤\r,IWq€ªX,{¨-qÓ¤ãÛXŸŞ­«ÓÈ÷vl=uNG½rgÉ24­÷S­øNÊß”pPjôÈ§Ï©|ÔMïO–Ê?à‹>8}dŠ’¯¯ßE­½­ºŸvcBG¹¡Pím;Ç’rˆ4E«EàÇ\ZãŸÇMLcè«€êö”$\0È§\'³I4½Ñ‡²€m¥µåŸ?¢ŠM1+#Ô¢æèËfÛ¦bX°4ªn›°.·\'QîQšª®÷&â0Z-§nàdù2ÉÉx“xŒÖ¸7Skë\\š›IÃ	Tğ\r¥€$äy\\1Ãˆ šíİÉêa’S%¬+ÍLîÖáÏhêÆ£œrÂ«Ûmå,1–åŸdŒ áJ,wbæ[—‚C)R[Éï^ÌyªÉfÙìØ„“¨\'°Or^šŠ¦öõ¤Å“¨	!|–bO2íæ*6|*üŞ]÷³Ú–OhÀÁ¨¡I\0(Àç@Æxjº­VÛÚÍ±º‰cxF¹»‰®È¤jÊˆHlŒ‚|“Äâ¬J¨¶Fæ]Ü§Yø€ú$e$sÁU9­Òt|=‹)ã€z·\0ñÀ<T`yñãŠé{ß JÅ[š®…9D\'Jdé\'†i®ÿ\0isãSWìÜ/·æ2ö\nÕa¹Ïmq‹pšâe‘|†a”`GFjµ¶§A-ö³Í®O\'Bœ±8\ZIÉá56ÕÈÛ<J“<ÈH‘Ø±`xê-¯Pî:¸ÖK¿—èÓçè«öğe4Ï{yM\\V™©¥¿KûIüJ·íÅÿ\0HûaÓmî|¥¶o8•>ÆªbkÕb9PtVÁéNYY–É†`G: 5ip<xU•äf¹fßa3¬«y]¸1Œvñ®ŸÜ f°·‘½³Ão>Ÿ§4•yqÌ?QEYQEEPQE{v™·Ù×2/¶XŸN9êa¥1ã©…Wñíë¥Ùq-½´q…F$Õ’òDÅ¥ÈÂ ‚TãNy‘Â§ûï¤Úº³i\nç‰Á é8\0xä*¨İÛ±nİ\\·%£\0ymoq«Å@)`9ûŠQ»»»´òæ=\rÆ-K&¹QÕjqä‰9åÃÆóìèÌİVJ¯U2ä`ğ¸1?ÙO#R7ÚéìŸİĞ\"¦aptÆ]›É+ƒ­˜Ÿ\nÓuuow3­¾?¼Ã4L ¦Ycë\"@âf\0×9ß½ß_½zÌö„\0\r³0í‰¼şÑÅ>ï®Û¶K¨c;:	dÖ€Ë$—\nXµ¼e|˜¤P0§…FvlÅ­`ù*ê~¿G:”ïğZÆöeözM!²´c+M<e³…‰€à3Ï‡…ts ƒm¡åah2}õéïÿ\0ö‡uJöFÆ†EŒÏioùtëB.@DÎ<;‚{Ô)ÆA$q*»É8lè€åÿ\0yØp¿¥ïåJ-·ôÄŒ‘ØÂğH72÷…‘ÙCpâqÇÆµÆÉ|³ËsÂS´wVÍ˜ÛD=¹2²é\0xäóà8ñ¨õõv²F#ÚD•‹äÌ® ³(:ÜgÉÈ à‚Öçßb>Ä‡Ğå{3H]6K¶!f,û>brKOtI>\'®É5®|¸Ùâ\'Ê{­0m…?ò¶çÃòã³Âj•l«¨ÎÚ2û(8cE’6”œÏ/W§;Y<1ÈÓ%¾Ş€rÙ–ùÿ\0ú/GtÔı¼;Z#°Ul–í5àW	$²XaÖe%€\r Î3“Û\\ÛA65®²Ç¸´ÿ\0¶—íÀGº?eIıcã\nÏu­Ë+\0=³cpRÀ5dÒm£8¹¼\n2#Ôx„‰Â‚OáÙA2Ü­…Zu²»«1ÔjX²­uÈ¬5c\'å 9<©¿o¼Š²Éìñ‚Ñ§’€oo’I8Ç”9©<³Šxİı½¸e™\\şPÈ­?“ä•U$SJTàÆ›6ÛÎ]4Å$õ%&tmXÕ¨u`qÀåÈÎ¹Îı®æ|nõë3Úeo³¤k{Rnì¨ušP¬f AU‘€^øóãLĞÉr³Äì\Z8Õœ¬¾TzÁ£É[S‚Ú»)FÏŞKbû¥xP¡	4®ƒP`¡Œ`áH8ãÛÇ\'‰6ÿ\0HV¯\0K¤‚‚T•cL“–X‚¨ÒNpxqÍnÍ˜œn]Yéh“=¬˜â¯\"“ûQkÆ|è*é7zMİû„?’Œ”Œvô5fo\'IÖ1Ø*ÙM®`[É+(`^	P±f@8ª¡Üİ%ÍäiGpPÈ\rÄ™vª(g#·\0v×?ÇÃ§	Æükòrœ¹[>¥û¸èÃ72I€DQÆòº†V”\"¬ÄjÁ#ˆáR}‰¼¦Îv³‘¼–ÉCÄGŒñáŞ+~ôoå¦ÅÎŞ#<ËÆR[[q-,˜%¥lê>~c•EööÜ‹jÙ5Ô+ÕİY#&rz²|¬6¥íåÃI¼wŒêO>ò€òqæTşâ²šovş{j&Ş$“xú©,»hÚ˜º“_í\\öÔv[Ä\0â1¯$kš™ãN9ñ>ß.Ğ&‘É=YÒ›‹ŒšOª´´µ†kL”+dÖRÆ@Ík³UI¶.ÊYµ4Ÿ›N\'H\'™ÉÈÀ;{j*?oµåA…v\0xyXÕÃÇÕ]IÑ<º¶]·„`z«˜vşÊê&ÒQ€d<øß?šº‡¢ÙÙvØÄJ=+ÀšŸZÏñsú—ÑE¦Q@QExM{XÉÈĞDvÉšI£L_“\\¶Ÿ(ª³·©•GÇï¨.ÕÙ×LNJü³÷Uˆ$ü“ù¦%ô¶£[@qåXäÔWW{·;sdùMøj-·­§²¸ITã‚Ë:\0F{ÁôÕ«qõR)¢È ŒƒÌ|àó©.5f«›İóŠl³YF²9&F¥A!<ËF²É<ğ\0ğ­7{ÕÚ:ÛTq\Z„LJ/µPVA<sÎ§2ì¨¾/šğÒ¶tcô1|Ì†µÙ¨sï\"û˜ÊÛ”óóÉZnîOÊ“ø•.{(ş/šğÖ‡¶O‚‹æ¢ü4ìuD›jƒîOÊÇXH¯½?)ÿ\0Jš%ø8¾j/ÃZ™ÁÇóQş\Zºa‚-²ƒœ9ÿ\0©(ú¤Ò:5¼p>Ï¶hâ,S&]AŸÛ±my$àq\'°wV–?àOšğÖ‡”÷/ÍÆ?ÛMLi›z‹)K{há/z³+±ÕÀ­Ûğ\0ú8Sê\\ÚØ–{¥‘ça€±…\"yê,Ãò‡´j8$€Ù-ë€@v\0óÓäçÏ§Ù5Şë{¬›’L<èŸcÓ]ÆŞµ<‹:}Æ¢ÍÊ“\Z˜ºÏ´á<™¾I¢Çc½ÉÄ\\|ü*>œêÅèÖî%fëàãSŸ]_Ií{>©ôÈØÁã€OÕV_G³Ege{´À$AQn\\®i4—:xàdÂ¾eo\Z®÷•Á¸bÆO×S=îŒÃ²6m‚ŒÙsöyR’cĞÎ>  ¬nîZIİ‹;±fcÍ™I>$š}Ü\r #¿‰_ós£°¤ŞAÏ˜~--ƒqÌ‹äûlpÃs<;óåxSÓØòÚH:Å#‰ĞÜƒhldwqÇM1\"şÏ\'’@Á+éRWì¤SnŒ«ÌŠ¸ç¹GRÙ_(+ó€±úMDöÂdùkò‡ßYÖ²+ÉwmÇ6‘ö;Î¦WWQûôùK÷ÓEÍÄ~ı9t;üõeKé,í­=A§k¹Ó±—Ği\n²ñò…VZSÉãRÍôÅ­½­’û~©\'¹ïë&\ZÑì¡Îã¸SFïlÁsyo9JŠ|#Qù9­[Ùµı•}q?d’¹_Î#„\n=Vs²Á<a™£ø’¦´)%õ×JôE&­“lİèsçà¢¹’Ôÿ\0sœùmÏ©nû«¤:Ïô5¾{æõuòb†ÜÅEUAEPQEX¿*ÊµÜ>ĞTûø±ëÖ½jR†UšhĞ²ÊêÌR7Q’A9íÍU·[_Tâ ydc€×LIî®âjq¼[d\\#È¾×¯œ/Š–§Q>šŠîØ†Ûj±¸Óx¦$s…&\n±orÔ¹ÿ\0gë_®ØÆÅ\0Œ¼ÕÌ¤Ş9”ç‡mjŠùCyPDÃcò‹Ä‚å7ƒÏ²:B½KÌÄAJJœŒªqÁíæ*.Zª6NCğzM×ñ«Ã· ø÷?Æ¤÷›#­mq4yn,ŒéVíÆ²)9#‘œÃŠêäİÉó°ş:ÇlÃğ0ÿ\0î?‹^¯ÀÃêŸø”‹úµ?½_‹ñ×‡w\'÷«ó‘~*‡jÃğQz§ş%xv¤?ùßÄ¤ŸÕÙıêüäŠ¼ş®ÏïWç\"üT?¤áø8½S~:Äí~?ó¿\'·?½O‡ñÖÕ§^2ÉkÚL±»cÂ4bÌ|\0 q•àêQ„)©²IÌÜ#€ë=ïSHšdøırÿ\0´Ş^  Â(\n€ã!W´ãİ–>,i1cDmšâ<àB¹ğ2~:S´6Dc¯´xµ¯X$Lùµ\Z[¹;Nv¬—\0£•KÄ/¥‚¶ÑSŞ•6ªB‚X¤]0º·I°ìò1+œy<9ñÈ=¼B©Ê|õ·ßSN·jÒösÂºŒr9ñÎjçJ·Ki¸88û)VoÖÃ³¶™’İY‚öÉ#1ú1IvŒ³A$²:bVrI\'Hñ$\ndÛ›LË#s“RÎvì’íKb-ºÊV­°¬gSÍÎ1çÀ¤`\n6´×VmıæÒHÎ9Æ¢1’½ƒé9§½—uÒ‡Ø³²æAˆeÀ.¤0*1ØN1æ\'ˆãMİ&ìù6\\vVkpÒ2%ÄŒÜ@n½ôà¡$¥Ypyå»êa{ÔÈ‡¾2>K~</E0Ó¶ñ$ÜºOk#J¢0Ç¯êÆDh=§RHì÷TÒ×–ŞæÌ|iä?éR“ W×«ïRS&Xp¹ÓÙ”ÓêõÁCP-kÈ»-!àÿ\0İ­mt½D>tÿ\0ªCIëÍTÏø#}¹¬Dç¹>B~\Z×šğ8ï |İ{áÒNp6óÀò’/S 94€ú)Óu7ÙÖÏ†\'N5ºŒ…ôòôÔ9dæ3Ï¡Çë©®ÖAÌ±–\"ë\"HÁN–b‰7\08\r!€=¼h\"6ÒŠD<2É{×_\nè€ö´ÓØÉ×HÎ#”G¬y*‘Gä‘T¶ôX³Ş\\cwœ„Vm+2,œp8\0d#Ñ]Ğşí=Ì%R²9iHÁRøÂ‘ØB…ÈïÍTNh¢ŠŠ( (¢Š™7ÊğÅe;k„yôœ}4÷Q’™u“Ô¿Ğ2~ŒĞsÁÚå-ÙU”á—ÉÒxåNX6®ñY<\rG¥ÚìNJ\\9yil¼KÇ\'¸`Œğ ç–>)¦{ÇË·’£f@õf¤ZŞv«wWşkPÔç:”~ÓõÒ\\øW¡ê£s‡ƒ)Ç[=|?ŸE%ÕáF|(¿7óè£Ù>oçÑI³áF|(7™ÿ\0ŸäWoóüŠÓŸ\n÷>:Ñüÿ\0ñAlòş~ê×šPo–Ø¨Éd>•ÑXx6>Î«4PmÀ÷ßGşk7`ÀeøC˜vRzõFME@ä~ŠQ×#Ì¹ûkOWáõ×‚Aï­¾ú]İŒ•Ànc‹Ë’#•Ö«Í|œŸşxf®Û‹­¶]÷³VIh	Š\0½d‘³yç2\"+ŒgˆÎqÆ§Ù;z[;Hn-[«•&p[\nÀ‡CÀ† =Â¤{c~¦¼k+Ö\Z2Ñ7S¯ãxå}#<5Fê0sÈâ¢§$ôb6„ğL÷F6DHZ<ëUË†E\0Ùs‘œqğÁ«úAØÖö¤ÚÛA ö8W{‰±œÊ«Ø\0T\09á»ªÚŞÍà’ÖÅæ’Qu ,ŠBukùLF‹¨,Iú1ÛKmüº¾IVU„)a\Z. €	\',OÌöĞ+’ì\\lW\\àÅ,N5dœQ°=ºøµÃß}_i©Në\\*ÙO­5£4`©!CfD÷DyñÂ­kŞÙlš¡ÙM(^\Z´JrGJz(9êA‚Fs[ä´xÂ–R5Œ®FCÚ8`×@40Çù­‚OşœŸ¤µ\'Ÿo^/v/w÷hşÒi¦(5´sÉù”Ö¦R;\r[»Á¿[VÙ:ÉlÚİb‰F¢	!9àUW{Ë½S_2´í\0éåÃQò¸P4Â8ú*ÖŞMÓèë@ì©\Z%ÄÅÉá®sT˜Éêú¡áªª¸:»ãŞÉ/,ã€CÃÅ\0È8\nÑªë\'İ2è=ÜX{Ü\"iÑ‚M“lİº4“ÚLlÈ2|ÀENBâ«îƒÇÿ\0hƒÏ\'éaUAEPQEEPİ·ìzëyc?¤G_”¤}´ãXºäPq¼À£pTŒ©¤89åîõSeÉãš±ºgİsk|eUÄW9p{ƒó‹áÄ†øÇº«™j\r4QEPQEc=İÌVñà4¬Èg™>\0}am€nâ„É©;~MT£Û¤±Á#‡¾jUÿ\0Óşê.^ñ×È„Œ‘ÎGQü)‘ÿ\0PWCi äSÑÒãıÆnïãHFå_~£só2~\Zìn¨wW@î äK^6”™Óc8Ç¾B­xÍ)şÊ6§êRzãüUÖbİ^õcºƒ¶æèİÙ…70<AÉ\n[$‘ÀÊg®šéÏauÛ-FL²üQ”R¶¯‹\\Ğüè0¯Tñ¯+m­³Hêˆ2ÎÁTÖc€=dPln¡ªiÒVçGİ@z©Z2Nx¨ Éãí¸ù˜T1Åw-\rÍ´Öã\Z²²)9æ_Wg…]û\'bØYìY!˜ErmcöDêÕÖHšãe<×RéUnêç‹´Ì+ÎwƒÀƒçrm›ÿ\0fìÙİáYgÉvX„Âò8\nÇ\n¯©°ÊÄ9àEI÷SyövÑÙw-,kJ4İ#°bªÛX\0Ÿ%@SŒå08U>önÊìûWÒåÖn®(…üªì‰eã@Ï|„v\ZY¹û½.Î‘ŞúH\"¶–\'XúØæ–`FWªŠ\"ÇXp¤1À<xÓò_›©”è1[Ä¡-âìHÁïäY{üÂ‚UÑí-ÄŠ²gLef#±Š8ĞÃW5Ğ©\0ªÛ¡ŠRÑ§a½†ŒüyU>–.|Ø«6ª0ê‡uPî¬è ®úpÙ¡öDÄ1˜ä;¤U8ø¬ŞŒ×1×bï–ËöEÄ#œ‘H£öŠ?½Šãš\rˆØÍ^›µ¼ÖÇg²hÉn‘Ì¬¡XâÖbå³í0ã»%{MPù«Gpì¢Âv28™£ê%¨E·VYÛb¡|o5J±lô=lSdÛÌ«înÆ¦ôËº6]Uœ)Œi>¬Ÿ¤ÓÕTQEEPQEEP0ïéÅ´-š	GÅXcR8ö®¹íH$v×.o~å\\ìéJN‡I>Dª	AŞ°ÿ\0„ñØ4šïg¤ªVDVVàU€e>px\Z&Å®¶“¢İšN}…¡1ô\nÔz&ÙŸ©Cêo¾ƒ“±RmËÜIv„ƒG#\\¯€‚|¶ğiÑ°ôQ³TäYCŸ[èbE.‡eú¬? Pg»–vö–é%U#P$ö’Ok’Oy§_g§¾±Lÿ\0Ô+/Õ!ù°nìü¬^¢>£@÷ìô÷ÃÖ(öz{áëÇıY~­ï}õ‰èêÇõXÿ\0{ï };I=òúÅ\'›x`Om4kûNƒë4Ğz6°ıV?ŞûëÑÏıR?Şûè<Û;ñ³ú¶In`*À«.°ù0A\Zæ\ráÙ‘Çpëm/]&ø é<ƒˆåG®=lÿ\0Õcıï¾¼şË6ê±ş÷â¨®Pö;wTÏ¢ç´‚ğ\\^É§ªãéfÏ\rL@8Ò8ßƒÃo¿ì«gşª¶üUƒtM³Ïü²úş*?Hûİ³6…¡ŒMùTò¡aù.\"HKr>ƒÙTcŠêŸìgş¬¿)ÿ\0jŸ¡­šãØz@}a¨W§-“¼ÛçAòN2§ˆ8ğ5ÑØ6Íø)>uşúğô³~Oz¢‘ìã\nÃ=™ññ­v¢êâ5Š@ë[H÷*=ñåáœöUæìÁÎ)Y>Â)ïfôaa´¶NûSÿ\0¨š˜¦½›Òe”q¬q‡\n *ÀU\0qä\0§HºC¹,Çş“Sô;%ö± ó*¨R•µCE¾ô+OóMKly/ÍI÷Rá¯z±U\ròm@F4KóO÷W9ô‹ÑµÄw®ö–ÓI§XÓÄ–B1œÄx;+§:±^GuT/R¹ù™?\rMz2èæò[¥3C,àƒ)‘Ju€qªÜNOq€3ÛŠé> wVK”D˜¬è¢€¢Š(\n(¢ƒÿÙ',NULL,NULL,NULL);
/*!40000 ALTER TABLE `modelo_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticias`
--

DROP TABLE IF EXISTS `noticias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `noticias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imagen` longblob,
  `detalles` text,
  `titulo` varchar(100) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `usuarios_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_noticias_usuarios1_idx` (`usuarios_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticias`
--

LOCK TABLES `noticias` WRITE;
/*!40000 ALTER TABLE `noticias` DISABLE KEYS */;
/*!40000 ALTER TABLE `noticias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_concesionarios`
--

DROP TABLE IF EXISTS `pedido_concesionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido_concesionarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `concesionario_vehiculos_id` int(11) NOT NULL,
  `modelo_vehiculos_id` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `ensambladora_vehiculos_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pedido_concesionario_modelo_vehiculos1_idx` (`modelo_vehiculos_id`),
  KEY `fk_pedido_concesionario_ensambladora_vehiculos1_idx` (`ensambladora_vehiculos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_concesionarios`
--

LOCK TABLES `pedido_concesionarios` WRITE;
/*!40000 ALTER TABLE `pedido_concesionarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_concesionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_servicios`
--

DROP TABLE IF EXISTS `plan_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_servicios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `costo` float DEFAULT NULL,
  `servicios_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_plan_servicios_servicios1_idx` (`servicios_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_servicios`
--

LOCK TABLES `plan_servicios` WRITE;
/*!40000 ALTER TABLE `plan_servicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proformas`
--

DROP TABLE IF EXISTS `proformas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proformas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `validez` datetime DEFAULT NULL,
  `estatus` varchar(45) DEFAULT NULL,
  `bancos_id` int(11) NOT NULL,
  `comprador_vehiculos_id` int(11) NOT NULL,
  `concesionario_vehiculos_id` int(11) NOT NULL,
  `vendedor_vehiculos_id` int(11) DEFAULT NULL,
  `detalle_vehiculos_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_proformas_bancos1_idx` (`bancos_id`),
  KEY `fk_proformas_comprador_vehiculos1_idx` (`comprador_vehiculos_id`),
  KEY `fk_proformas_concesionario_vehiculos1_idx` (`concesionario_vehiculos_id`),
  KEY `fk_proformas_vendedor_vehiculos1_idx` (`vendedor_vehiculos_id`),
  KEY `fk_proformas_detalle_vehiculos1_idx` (`detalle_vehiculos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proformas`
--

LOCK TABLES `proformas` WRITE;
/*!40000 ALTER TABLE `proformas` DISABLE KEYS */;
/*!40000 ALTER TABLE `proformas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rols`
--

DROP TABLE IF EXISTS `rols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  `estatus` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rols`
--

LOCK TABLES `rols` WRITE;
/*!40000 ALTER TABLE `rols` DISABLE KEYS */;
INSERT INTO `rols` VALUES (1,'Comprador','a'),(2,'Concesionario','a'),(3,'Ensambladora','a'),(4,'Gobierno','a');
/*!40000 ALTER TABLE `rols` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `costo` float DEFAULT NULL,
  `estatus` varchar(45) DEFAULT NULL,
  `concesionario_vehiculos_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_servicios_concesionario_vehiculos1_idx` (`concesionario_vehiculos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud_vehiculos`
--

DROP TABLE IF EXISTS `solicitud_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitud_vehiculos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proformas_id` int(11) NOT NULL,
  `ensambladora_vehiculos_id` int(11) NOT NULL,
  `estatus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_solicitud_vehiculos_proformas1_idx` (`proformas_id`),
  KEY `fk_solicitud_vehiculos_ensambladora_vehiculos1_idx` (`ensambladora_vehiculos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud_vehiculos`
--

LOCK TABLES `solicitud_vehiculos` WRITE;
/*!40000 ALTER TABLE `solicitud_vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitud_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_accesorios`
--

DROP TABLE IF EXISTS `tipo_accesorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_accesorios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_accesorios`
--

LOCK TABLES `tipo_accesorios` WRITE;
/*!40000 ALTER TABLE `tipo_accesorios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_accesorios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_vehiculos`
--

DROP TABLE IF EXISTS `tipo_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_vehiculos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_vehiculos`
--

LOCK TABLES `tipo_vehiculos` WRITE;
/*!40000 ALTER TABLE `tipo_vehiculos` DISABLE KEYS */;
INSERT INTO `tipo_vehiculos` VALUES (1,'Camioneta'),(2,'Camion'),(3,'Carro');
/*!40000 ALTER TABLE `tipo_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidads`
--

DROP TABLE IF EXISTS `unidads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidads` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidads`
--

LOCK TABLES `unidads` WRITE;
/*!40000 ALTER TABLE `unidads` DISABLE KEYS */;
INSERT INTO `unidads` VALUES (1,'Cantidad'),(2,'Bolivares');
/*!40000 ALTER TABLE `unidads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `estatus` varchar(45) NOT NULL,
  `imagen` longblob,
  `imagen1` char(100) DEFAULT NULL,
  `rols_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `fk_usuarios_rol1_idx` (`rols_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'AdrianaS','1234','a',NULL,NULL,1),(2,'Fernando','1234','a',NULL,NULL,4),(3,'Jose','1234','a',NULL,NULL,2),(4,'Maria','1234','a',NULL,NULL,3),(5,'adriana','1234','a',NULL,NULL,2),(6,'ConcesionarioToyota_Pedro','1234','a',NULL,NULL,2),(9,'concesionarioDaewood_Jose','1234','a',NULL,NULL,2),(10,'Ensambladorachevrolet_Pedro','1234','a',NULL,NULL,3);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_indicadors`
--

DROP TABLE IF EXISTS `usuarios_indicadors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios_indicadors` (
  `usuarios_id` int(11) NOT NULL,
  `indicadors_id` int(10) NOT NULL,
  `valor_meta` int(10) DEFAULT NULL,
  `unidads_id` int(11) NOT NULL,
  `fecha_meta` date DEFAULT NULL,
  `valor_amarillo` int(10) DEFAULT NULL,
  `valor_rojo` int(10) DEFAULT NULL,
  `valor_verde` int(10) DEFAULT NULL,
  `fecha_amarillo` date DEFAULT NULL,
  `fecha_rojo` date DEFAULT NULL,
  `fecha_verde` date DEFAULT NULL,
  `estados_indicadors_id` int(11) NOT NULL,
  `responsable` varchar(100) DEFAULT NULL,
  `correo_responsable` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `frecuencia_notificacions_id` int(11) NOT NULL,
  PRIMARY KEY (`usuarios_id`,`indicadors_id`),
  KEY `fk_usuarios_has_indicador_indicador1_idx` (`indicadors_id`),
  KEY `fk_usuarios_has_indicador_usuarios1_idx` (`usuarios_id`),
  KEY `fk_usuarios_indicador_unidad1_idx` (`unidads_id`),
  KEY `fk_usuarios_indicador_estados1_idx` (`estados_indicadors_id`),
  KEY `fk_usuarios_indicador_frecuencia_notificacion1_idx` (`frecuencia_notificacions_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_indicadors`
--

LOCK TABLES `usuarios_indicadors` WRITE;
/*!40000 ALTER TABLE `usuarios_indicadors` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios_indicadors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo_accesorios`
--

DROP TABLE IF EXISTS `vehiculo_accesorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehiculo_accesorios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehiculos_id` int(11) NOT NULL,
  `accesorios_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vehiculo_accesorios_idx` (`vehiculos_id`),
  KEY `fk_vehiculo_accesorios_accesorios1_idx` (`accesorios_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo_accesorios`
--

LOCK TABLES `vehiculo_accesorios` WRITE;
/*!40000 ALTER TABLE `vehiculo_accesorios` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehiculo_accesorios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculos`
--

DROP TABLE IF EXISTS `vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehiculos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matricula` varchar(45) DEFAULT NULL,
  `ano_fabricacion` varchar(45) DEFAULT NULL,
  `precio_venta` float DEFAULT NULL,
  `serial_motor` varchar(45) DEFAULT NULL,
  `estatus` varchar(45) DEFAULT NULL,
  `imagen` longblob,
  `imagen1` char(100) DEFAULT NULL,
  `concesionario_vehiculos_id` int(11) NOT NULL,
  `modelo_vehiculos_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vehiculos_concesionario_vehiculos1_idx` (`concesionario_vehiculos_id`),
  KEY `fk_vehiculos_modelo_vehiculos1_idx` (`modelo_vehiculos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculos`
--

LOCK TABLES `vehiculos` WRITE;
/*!40000 ALTER TABLE `vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor_vehiculos`
--

DROP TABLE IF EXISTS `vendedor_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendedor_vehiculos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `concesionario_vehiculos_id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `cedula` varchar(45) DEFAULT NULL,
  `ciudads_id_ciudad` int(11) NOT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `correo` int(11) DEFAULT NULL,
  `usuarios_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vendedor_vehiculos_concesionario_vehiculos2_idx` (`concesionario_vehiculos_id`),
  KEY `fk_vendedor_vehiculos_ciudad1_idx` (`ciudads_id_ciudad`),
  KEY `fk_vendedor_vehiculos_usuarios1_idx` (`usuarios_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor_vehiculos`
--

LOCK TABLES `vendedor_vehiculos` WRITE;
/*!40000 ALTER TABLE `vendedor_vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendedor_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-03-28 17:26:18
