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
INSERT INTO `arbols` VALUES (1,1,'Registrar o Modificar Nuevos Vehiculos','',0),(2,1,'Listado de Pedidos por Concesionario','',0),(3,1,'Configurar Nuevo Indicador','',4),(4,1,'Portal Ejecutivo','',0),(10,3,'Registrar Planes de Servicios','',0),(11,3,'Estado de la Proforma','',0),(12,3,'Portal Ejecutivo','',0),(13,3,'Configurar nuevo Indicador','',12),(14,3,'Lista de Espera','',0),(15,4,'Actualizar Datos Personales','',0),(16,4,'Lista de Espera','',0),(17,4,'Anular Pedido','',0),(18,4,'Catalogo Vehiculos','',0),(19,4,'Proforma','',0),(20,4,'Comprar Vehiculo','',0),(21,4,'Ford','',18),(22,4,'Fiat','',18),(23,4,'Daewood','',18),(24,4,'Toyota','',18),(25,4,'Huyndai','',18),(26,4,'Portal Ejecutivo','',0),(27,4,'Configurar Nuevo Indicador','',26),(28,5,'Registrar Marca','',0),(29,5,'Registrar Concesionario','',0),(30,5,'Registrar Ensambladora','',0),(31,5,'Lista de Espera de Pedido','',0),(32,5,'Listado de Concesionarios','',0),(33,5,'Listado de Ensambladoras','',0),(34,5,'Listado de Marcas','',0),(35,1,'Registrar Modelo de Vehiculo',NULL,0);
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
INSERT INTO `caracteristicas` VALUES (1,'Color','Negro'),(2,'Color','Blanco'),(3,'Color','Plateado'),(4,'Color','Rojo'),(5,'Color','Azul'),(6,'Tapiceria','Cuero'),(7,'Tapiceria','Semi-Cuero'),(8,'Tapiceria','Tela'),(9,'Trasmision','Sincronico'),(10,'Trasmision','Hidromatico');
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
INSERT INTO `comprador_vehiculos` VALUES (1,'19618874','maria','paez','123456','carora','mandnd@gndhj.com','1990-01-24','femenono',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo_vehiculos`
--

LOCK TABLES `modelo_vehiculos` WRITE;
/*!40000 ALTER TABLE `modelo_vehiculos` DISABLE KEYS */;
INSERT INTO `modelo_vehiculos` VALUES (1,'Ford 4x4 fortaleza','2010',3,1,NULL,NULL,NULL,NULL);
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

-- Dump completed on 2013-03-26 15:37:25
