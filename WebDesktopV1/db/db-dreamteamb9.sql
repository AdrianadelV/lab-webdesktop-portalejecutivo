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
  `color` int(11) DEFAULT NULL,
  `transmision` int(11) DEFAULT NULL,
  `tapiceria` int(11) DEFAULT NULL,
  `modelo_vehiculos_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_detalle_vehiculos_modelo_vehiculos1_idx` (`modelo_vehiculos_id`)
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
  `vehiculos_id` int(11) NOT NULL,
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
INSERT INTO `modelo_caracteristicas` VALUES (7,1,1),(9,1,1),(7,1,1),(10,3,1);
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
INSERT INTO `modelo_vehiculos` VALUES (1,'Ford 4x4 fortaleza','2010',3,1,NULL,NULL,NULL,NULL),(2,'qwer bnm','2007',4,2,'ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0„\0	\Z\Z\Z& #/ #(),,,151*5&+,)	\n\n\Z\Z,$$,),,,,,,,),,),,),,,),,,,,),,,,),,),,,,,,,,,,),,,,,ÿÀ\0\0¢6\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0P\0\n\0\0!\01AQ\"aq2‘B¡±ÁÑ#RáğCSbr‚’¢Òñ3Dƒ²Â$T£Óâ%4cd“³ãÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0 \0\0\0\0\0\0\0\0!1AQ\"aÿÚ\0\0\0?\0·iÇºqOok9ü¹ô¥ù¶#>×²|“0á§âø¤®º1°LQO¶¯*9ƒıZãÆ‡Û%YzçãL~\'\0_Å<l)ã·¶j|²•O­DÆ‡Û@å“oaşÒE,n)c˜Ÿm-Ë$>5ÿ\0şxÔûg­Ë\'OãUÜ£\0u!KŠXäí‹;3ÜeàòŠ“ó×øbFöÇœåC-ò«ş<ëÂ–6±Ç¶ÿ\0*yaıJŸú˜Ğû\\â2ãş~/€k´\nXÜRÇ>Õø‰úôG¥øœh}¨ñ/å©J4ÿ\0€k¹\nXÛF8;{KâGıäJ4Áˆ›Ú?ïmğ§DÑ†Nû£¤cçÖíß?ïµ~Ü¸»cÄùÜÇÁãîÀzú\Z1šqó£v›:wÎæüÏøDÜk4wÍæOüzŸâÀZúGG–3»=Ë4¶v¹ß1\\úÖ©ş,DuêT>®ß\Zúb­E[±\n<ÈàfâÔ\0“^ˆÿ\0ˆŸ>nú;Éõ3÷âeàªE”|†£_BUí6QDı&´€*¡ci€’|±Ï³şÙŞ™Côze\\ÉPÍ¬$½†³6ùPß:Ôé6¡±	16<#ÏñQ¥Ò@\03ª±´˜RADôÂË§³Çıgğè‘˜Ÿ •\'şXæ9óé…|GÛYAîi½B--àA s<¯a<ãˆÓáoÍÑ}ZyGÕGŒÖÍ•0yÇL_›üO¨èµ=²W2U)@i\'š\0}íâ§÷[*â>Ø3u’“\ZUw‚<&ÇQŸè\r®M<Q \"jÔ&Û*£©=\"aBßíõ—ğ\\/4jÿ\0ÙŸl_GÊÓ£Z“Öt‘¯¼T´¬È$	ù/[Úß!E[»4{¶\"5êAI3¤m÷â’ï—Ÿqÿ\0·ÿ\0´bZ|N’®‘H3w©7·&—L+ÎşªuŸ‚»Ú?¡ç©W$èÔV¨%Índ{Şª1×ŸÛH}\\Áÿ\0„?åœ+‚å3(ÇUZ,§ª¸±‚å×z½Š¡©VbÀÁ½µA1¦yÉ{‡âÂõWöÓ”åK2©Oÿ\0S7¶¼·,¶`ú÷cş£„‡Ù†kÿ\0ó«OüxÏõa™şJ˜õª¿8X4Õı¶Òå”¬}]çˆÛXå’oaø&ç=W¥Mê2R„Vc&cÃ½ºâ”s }_·\0×KáŞÙé3ÿ\0.ôÖ- ÷„Ÿ1çŒÇ2áÙª!ÏÒR‘nè¨i‘¹u\"\"~Ì{„¯©ü›|±:ğŠ§ø¦û?<_WØ–dïQè*~cîĞvèãÁÄ»}RI^š¡ÍÍíäq>•äœp:ßÉšşxÆá5éùàvàmü¤„<eÎ–eR÷c¿ù=£#g];ŒÂøI¯ª*S¦AªÌº‰ÙPbíµ€›áE^§ëHê°O\r§‚[Pu4ô(,^d\\Ş-ƒhÆá<zTë$ÂéÄf\0P@c&Û`¬Å\r;µ+TêĞ…›õT˜Ôo-ë¾4ÍTZdªŞCÔÊ	:©R;â†q½ÀğÉgş\Z‹™îÌ*ÑpSIm&Ò>8=Q„3:N’…H0A73éø`tÿ\0–§ûüq·lN6?ûŠŸmBXÓÙà>îV¹ş­oÙ‡zÂ“U‘^—òËı–ÆİıuÇÁ:ŞÍk‘¨}Kùœai8:Yš‰N™\n•`´Ø9¹˜ˆÂô~QŒÖ_ùfşÁü±ŸMË)Sû³\'°ü*rª+ğ³R¨&sï.á™œ…ñ¿!‹öV›Ñğ¬!Öª£ì¢Ÿ¿ØòâgˆåZ©ø.<şÊô­ıßÏ´vXş‘²è#jJ	ıæV8æ=¨áTèÖ:t´²øWmF9Q·\\½¸/?\nÿ\0ğ¾[õ*ŸŠşx‘x®^$Qr\r¿Ú	ø¨3xë=íC-’Nõ¨­@Õ¹ı+iì«xˆŒ1§í*ƒTZyJ*Ôrl´Ô“´³\\8ÁêŒq?áº?øføÔl˜ã\nÑ¢†¾\"[{K¦fÍf¾–ZT„^Yâ£iå¡ü#sïF±-’\\á”SQ‘–AP#œ©X<Èå‚uiÙòİ¨W¦¡8vRÖ¨E‰­¨ô\npo;C½r%Ô±(4¢9_·óLù`T¡­u=‡%äÇ\Z\nkÉ~wÅÄŠÿ\0H\0])E7Õ,54ÄnbŞQŠ§Ì#Ã7:UWşU‡¾GïğÀïTáíVÍToy‰>dŸÄàq\'i?¿–$F3××åøãÚG—¡ÂÛO$g÷8Ö:ŒHÏ4âMš‡êıøğß–=\0ùà£ °`\n}1”i†0Fø–¥1¥3\ZöSŠı;F£ûº´Th÷Iù~xë¹¾J†aUÒhf	î˜Y©U»:#‹¨a5>°qÌc‰ñ\ZVFıt\rñF4Èù\0qİû:?„¸E0Z¦üÒ­ğTõªß9ã~.Æ=ü]*í´lÎA‚W)\nõ•ÒiTÒ\Z]AØÙéÔ^@’{íñ*•i½%¤È¡”)c\"t±$ØA+ë\'¦góYnú¢14ƒÒÍ ‚QTş™bÇR0ïWyîâÓâ¬ğn\"x-s^ Jâµ.è-:‚TÓ4üN`À`¡–ÆUÁ›Œú˜¹òìu©îDÅ£HX¹bl\rÉÇíf;Àù¼•E1«õãŞª‰´fÀ™ë¶ÄqŸkßJÑN¦X®_P5Ñ*øª¨6Fm\":FüÈÇnËèjk¢;¶Q¤\04è#ÃhÓË¦$ñòUÇ¸ú<û<áä’r”¯ı/Ï†b¦k=Ÿ’Õ3€¹ñÅ5¹ˆE?#¿‚Û*¬¯R™j‹î%@Åa–íê\"ğ2qJµÙÚ¹w$,eT…À1xd‹VTJj³OXƒ3oŒímYÆšb]½Ğ\'¨\'ÒÓğœ5ÎqBèhÑ¥M»Îæœïõu™f[nO‹ÓxòtUëSË£Gzê•*3¨¥E¼\"Üà@ÃZ|*‰âuèÔ«ÜSš‘¤ÀªèLĞáS/Éçºfhš•j0 tÓ;•i@TP\0\"\"Ãğ	S1Q¨e€vkÔ¢@jt˜sãyá’ä55Ìæ3c-T\nkIÉ«³ÔJh&š	‰f‰‚A;Ùİ*”ëw´ÕÊ”(¢S&ÌT³şŒ@RL’A‹@ ÍpĞ½ôFšU\r 9øµ•?ùx?Ps\0H^ó¹:Œé\Zé¤±€L	å_>é\nA\rVªºˆÛOz?ßsLÁûºdzXÿ\0—\0	Ûô!šó}_ÚEiûqôY«º!ÕIPl¬ípä¨şéÇö•Kÿ\0ˆV?¬´ÏÎŠbÏ—ÏU«JŸ{ÄØ\rú:=ã0ğ	‚€F×87;•U\Z«æj\0>*«IwèmägcˆPÿ\0¾W^Wÿ\0Ùƒ+­1ŞĞNğëUmU@Ö[X¸\0’£Iæg5~÷8õ\";Æs¾,L5ù=¥\0ª”²Õ*¸P°Q \0`(s¿Âş)í:ŒŠiåò½çºj÷„ï,cÖ07£›ÍŠ”èæt- !i±ğ¡$ÎfAÇœ{±MF‹Ö®éP¨¶¦¨í,B:ö7åÓ\0	Ÿí>b¹¤ßHª”³ª+á$D,H$lzà>ÙİrúôGØóÀJ\r<º’.àèô.Çğ<8í&[^S$VúQ–}4úq3íWè\'fÉ¼42ìCÑ5‘ˆ$\0áí^9™£MŸSJ‰îÒŠ\"¨6T,•YÙI¹µ›NÈv‹èùuË-Jk^½fîõ0…Tk\"nd©¹>[¸íz¦O i©fj¯ãf2Î@ÖîçÃÒÀaÒOÇx{æ\\;< ’ÒI,$¿RŒµ¢L3šõnn.)Håá“ç8°ñîÔØi%¹ä\0¤Œæz€9óÂl­NñªW\"Ÿè€xGöcíÅsó¯€ÙºBØşXTZÃïÃóHÌÜúaMc\'\Z!¾UuO_\'ûÎ3†VU\'QEµ>şx=ª«{§Wôo÷aUš}7Ò¢0ÚŸ®ÇÃF¥ú©|ã¡Ù¦Ú¿WXù\rXrQ±YÓéR\r&`Çü,ëØlÈÜS_‹õ°ÄÔ{R}\"š‹7¸±!š~rÛš[jÙ2»‚=cüğU*1DNú¼­ùâİS°Õ*\0æ¥Zò‰@ÆGRF•øŸ†NÈ²JÔ¡Uy€õé!ù@Ÿ–š=*™š°#¶,ÜG„œ»ıZšÇ.hHæ9\rğ-.Ë9»ENİã}aVGõ£âÁ:•\rEï2¡#U\ZúOôk$ü¥ÌâÅì×Úğåt®*=ºŠzIWÀf``Çê.Ëğ´*Ğ¦Z±ªi–(«à4É#ëÂêûĞmŠå~Å]€µuÍ¯¨¨Q&í½„Ù®eæR¹~#†ûWÊSÏ×ª)Ö\\¾eUYP‘UF’à.¡A“¾öÇ6ã¥©R£S‘KTRWAÂŠ`‘!!}bëšş¥ÃèVÉ¾!M©<;U%Š\ZGvër°Ë{Hâts9ºurÎÏ4Gy#bu0PHƒ\nğwØÜÆ&œRªS‹ü#œFøú?Ù¶w½á™y>*iİ¿‘§áYş¦“ØL¹¹ÕşB9~ñïì{‰w¼<®O¹©İ?ZIc3âi2Ş[â6êòbç\"ó\"ï·Ç|f\'îúŒÅ%Àøj	ªÏ–5©2°¤šVÇPiı!T\0ÒNÀblöj|áJ)¡Y4;B/†šÀL·Š ™<†)kœx\"jAn×0oåŒËÒvp\\¹6´œı¸^Fœ¦E›Â–kÔ‘ò9ğŠ4Şš•«\\À$Ò¦ß©h/õ¶x^à¨îé\rE­V ‹iNcô}[vò_z\\¿x>ŞtÚÄ^ò?yÂ´ğü˜¥š4UÑ“ºª¡—c«.ÑÌÈ%·üñ—â‘M(¥B”„¸djB bº-R¬…\"oiÀYn\Zábwú·‘å‡T8a	~q ÈâæÇ­ˆ½.E{3ÂŠ×i3ä°$’&gbn.,wÁYÜ£0C°Z!M· °ÖÚ>XwœÊVÀø•§»U\'®Ö¿#¶$­”&ŠH7ßk¸ÏáƒĞò®ö¦˜Ífƒ!iÓY;1U\0@üãhëcì¯ÈÒË*çS‹\0½í”XgüI\nî€bz’Óï}rô÷­¼ávw„O‹ÂE‰\0F¢\'ÔB`aúŸEæƒâÜ_,õs5)Ê‚ÑßÑ&óĞ‘ˆ³œ~‹f;ÅÕ…çİmÈúÓ÷á~kƒ$ï?«ë\"?Èvá¢Fãğß¯Ï$Mµnì÷l²”\Z«=:šœØ‘Ñ†° [ö—·”kåE\Z)Pe˜°Qib¢C»–)«ÃÒŞ3ó\\H2T¹¼yŸ1ö`È[Nx·i)Tl°¦Œ4Hb ’»›Nñ÷áã–š‚«Nš(Şğ€–›L’Oõ°M,¢j•\Z£•ÊÜZ@ò¿Ÿ¦vµéLÎ.®dŸO[mÊc\nÉ6ƒËgH¨ØÊ]O0C#§YÅ·ŒöÎ@šªU¯Î	o‘*Kì`G„RòôK:ª©rÆ‰$“°\0\\œuÁ2 ­LâÑM\";L5ô*’t°à›™›ÇSÎ–à|§©˜È»2i•î©±rÕSÅVn\"Bol0á]ˆÌV¤\"•JkóÎT1ƒçºğ.ÎS‡\'@\rcZš‘İÒd2¨¨îm7òøf¢Æ¿rIñU[ú’Äü±¯<#®œÛ‹vm“3ôTj•A¨Ò‰MÜšÌùj›l0£ÙL­3)Ö¬GTşó9?/†/Y`ˆšPÖxªÎä™–jJ¤“¹“Œ­—úßDo >²Õ	7òÆ³†~ÕUZqİP¤±6k“ÓeR> æ3dæ€”j¶tüğÚ¿iÅ;\Z¹Z M»újoÔ)›tŒ\'ÎvöŒ’ÙÊD˜÷R«›l\0zb²Oº^¿‘áÜNem%W~‹¬| ãqÙ|ÓŞ5!¹ñÔYğîliÂÌÏ´L¼É¯˜èÒP>\ZØanc·Ùi?¢ÌÔ?Îª¨?º¼Gı¿‹Gú(æ&½«Şr`Åî«‹G<Bü\"3©ó€Áˆ	©IŸ|Zş_•Iû}@	\\\'ºÄòQ8/„öó¼¨¨årÉ¤øşV©l =ç¬b}ğyÑılÅ($ç3ÁB(Û` ÇÃÌîJ«ËÓªÎO&0Ş€ì~Ì\\2¨ZÕéĞ§Š•JàêKKQ÷C–búIµ±mì·f(g<ËÓçP©Mƒ]:Mˆ›Ä©?ê_©K,q®ÚG¡ªQØ~‘A Xò8’·kë7º´V#j4ÄOõ|¾Ìt¬Ï¢õš ËÒ-R£“*Öò,9Ş,l™*ˆÑLŠqúˆ©sp$)?¿®3ëı$›ÕkÏùŞ¾$sõâ¹Æ¤ÍúM(DìéPLÀ0fÃ&á­Z¶]rëM¹f\rCCÖ`ÊdT¦Œ»¨•÷`ƒ1»Âj\n€­bÄV&@Í*5¤X±²Á6‹é3Ëë‡Ó~\"S\'ON(äKL¡ŠmîI\0È\"×¨<ù¿1GÙã™W†ñ\nJ©«{j,Äî&âûâÑšìfR¡XÊ=+Oèê(&\0±ˆéË¡ë‹&~™‹‚\ZÌf	\"ûıØCÏ„©HÍ¤©ÚÚ”ı­¤t_ô>BÀä‘ehÕ.¤6†e	ªC	øV¸Åï³UééjTˆ„ñ/èÖ¤ª+½úâCŠ¤S¼j]-}À™Ÿ+(øà¼‡h…:Õ	´Ô–€¾ëLØéÔ7ë³N/1LÆİL‚fbz3å³‹QèÈdƒ 1äH\"\" F3§ÌY\"Õ_B\0I¼„óØy˜\0Mğß„ğƒXé‘¤°Vaâ\r&gL›HÓTU*V˜,*8¯…˜!&?¤bFÀXøVCB#Dø¹uğ´+ú[×Br	îØ¦­ZNO0$v>{ùœJ™g\0Ë‹˜6ƒm¤Ï»\0a÷£úV\0XL¿3¿íÄc+¼ˆmœ¯µ¯Œõ¦äxd²a€`(İÄ‹^û1Êdz“ÁRdNÿ\0å×TËq±èÒ/s¢\\O-LØıÇï×ğÄ^— *”A<¾ÈSç·,@•\0ªO½`&`Üû½lumöáÇr6\"×å=#ã1óˆÎX]‡”íÈX|ÏÀâL«7Sİğ¬XÁsiéÒóîí|•“È^6››@¶£h=zY+eB€Àîo‹ø~ryoÏ×¤\0\"ıê\'òç€Õú_A„†Ág}õĞH‚6ƒ\0|wÎpêd/$ \0“ƒq¼Û¤È¶\ZŒ”Ò!`‚fÜàòËaÒÂ5%:„\\[M€™3ùmô^CpŞ—5­Q)øuj!w$,x¯çñÀ•)\n`»\"Åû¥*5	£Õ X[Qşh’CA°Ülbbç¬_§Qˆ³9ribIslƒ&\"Ác–ûm‹3¼¶à(jQ­Q‰Ôµ\".\Zd·9‘ä:ahû/_2Zº½=4ÏvÀÈa\rce¸‡[Ï\\]¸_z9:¬êWZÓa1ôØìg–øøE)ĞÌS`KÕ¨\r5Ÿt±@FçóÙ¯³z†ZÄ¡gı6˜\n7©¿ŠL¨°Ø0ç‡5}‘Õ\'ÅZ‚õñ±#á }øaÂøÅj,º+*í™˜âcQì\'`\0ı¸xg©5*Õ&j6†É\0N–¶Ûÿ\0¬á\\ÿ\0•ïåjã\\`ä¸sÈ–ËÓ´xC€AF>ê’D›•¾ñ8ç<CµG/˜9j™—Á\nÔ²|>›xˆBÔ®ÌÏ¼ûáïm³gø:¦¦\'_}I¹Éjnè/ÿ\0Ô¤°|üÎ9şw¥?K7U¡SgeÀjÓìA°Æ“»Ÿo?&}¡Èñjî£*xš$C}\"­:dP”ŠnQ…”ı‹ñJæj²O3R©cøáö‰Lf*=,Ğ4™ƒ*šH>0Á”€Yv3¹ˆœ™öæºa)Näƒ¿P5ˆ3ÏÔşš‡+ÿ\0gzçı¦jšù*±üpÑ?ìÿ\0—¦5WÎ°aU~mªå½ fk÷¦Z”Å5ÖÌJ’ª\\¦ŠêÔàjb@Ïxr¹5Ì/}˜,ìÅ´½Vj¥€ÁÚF¹V%BÙ@æÊ\rË©±yÈû(à³§éiQº}&œŸ€l?Ëû1àèÚ{ºLİ¨\'å33ÊÓPJš-\0NšÓ¨Ìä‰TĞÀSõG!ÔœC™ËU+M2Ë˜/ßR§¬¢Ìh$t9¼¯ÃÛø3úúŸfø]<Tİ“çsˆ«ö‡…Q°«”Säı F8M?füR ÔrÕ¯Íÿ\0iÆìÓ6¬Næ›Á¨	ø…’1;ĞÎWh}®ÊVÍğú™ZªíB¼¾• /LïõN.=âÉJ­J¾o4©é¨VeHÇâı|µ3U«Qp¥u*3j…Ôåê|±Ñ²*´³u\\š.M¤Ó¬”Äé76CqÓ¦&÷ŠœK>,Í6\Z€V±Ø}V.\'§Õ\\H8{ÕôLÄDbH2:L~x;…e³Õ$Ç[şF1ñfùâã’É÷tÂ‹EöæLãŸ¹;é¿=Ş\"…•áµÓSTmŠ¶‘24Èc&-ã¶Ç<ìMyÊ•[ë34ÏSï»zc¸vŠ¢­}Ì@<üãå\rÁdQ®ûŒ!gŞ+°{	q¿Lº¶Õ9ÛŠuÆªz„8V°-%NÆÒ#•Üa6s?ª¡™‘ğ‚¬IøÎ+Y\Z†XY½„F™ËqÑàÏóæ&I\r2IŒ‘?½ö?iÅGpés€C±>À¸Ÿ¸b>ÌñeŒÕLÃ®‡So£…Sğ$ Í¸î³¸fËİd6şÖäÜŒµqÈªüái<àßğT¹[x7i+å…&\0·¼¤j_é(Ÿ„Œfeê¦… ’£~±ßÓ€Qád`4È´ù\06$G Nı)À“:İ-,•WmÂÚ\00a¶é?³v­š¦TN¾å¹°ƒ7#¤ü£­„ñ\\¿é˜í qyQ·/,x˜æmm.¦1¶ˆ+°![Ü`€A‹ô\0ùÀ±çx\0‹ßm¢Òá8›+QO}‡”ÈM‡_OÛ%WR·\"}<[O;Oáˆ°*ayï<ˆ Mï_ç5\\É,L-Í†¨ç·?ß”¬=yİ·—ÌƒäIæ\r±#¨Ñ$ßT|ÄùZÛoSPæ÷\0ÌõˆéaÎ1«Uc €$Ï;0å¿FØş0j\\Å¼u0ØÍ ü‰ü\\Şö˜½ÈëaòŸˆûpa¦M\"‹9Q)Ê<Ç#ù‘J\rùÛóó\rÂÜXtÄÕÆ‚·’$ù¶›uòmw$4ÁĞ$ê0v‘éÄ`ç `h;™·˜cp u¼ùØ\\å6DŠ†/-n¢/ïÊ\0ÂÓV«åÎ‘\Z@l-½”‚	åõ …ñ™b4óVğ‚@œˆŞ0Ë‹åİhÍ\Zqxİˆ n@•u0o ’lmr¹* jb¬¡µ¢O¹â‚ ·Û¶*Qbİ›ã”›,ªAmBA1È˜h¤ùJ¬Ÿ¥½Hï\r! *€X\"NÊ4cxø•Ï–\rSK4xm¼\\‘¦Lc´Ú÷Ûe»<ìŒHğ›^>¯[ï7åñÒtÊó‹UL•æšÕï5Òª…F¨x\"[6óôÆf{6 Wh´k\0ì[IËGÀù6Z!ÕaA	QäDÿ\0ÂG¤¶8gÄó´¨øÉAHúÇ{ˆÆ][*¥S¸Ç\r’zo>Â]¿œº$üXŸ\\qNĞdFÈA¾ ‹\'`Æ«‚O8†;½~-N¥Î l‹S@ 9Ğä’³ÏÁ¾8Ïá¡éÑNõ)¾\\¸aU´øYõÒ¨…AÔ…bıGÀmÇLì9ÿ\0UdgZ™º§»÷ÈJh<ÈÔäé¸|öƒ€òİœáº•O|I’Z¥dU\0ASy…ü±§\ZíUv^ğTÉÕ©0ËMj3™`Âv¼m#‘Â÷ˆV:×*ÌM¥r`íh“LúcI{ÄÙÎŸ·\rJš)½$b²T¬c‘=á€|Ğî,7ÄyŞËPÔ˜UR\'SS¥¤Îå[»²‰‹rÓâ\"ÅŒò×NÙ+²¹ºƒ]JŠgõ«øøu[\nîıœÏáòğŠTÕV*L÷$¦€JB;$ó˜Û7ËP´³„\"›¥6ÓÔ¥4¹0$’I\'±Ù5jfh§—?“8;-Ù<©ôª•<©Ğ\'íğfşÿ\0Å¦¯n²ZNº•j˜6ÒäI7»<yté…íŠŸ\"f\nÑ-Ôá¿ìI„ı‰×3hUE3æÂ™û~81{LÑğhæc5pI+©‡1Ëôz(í	Ìfhšn¹<²<4ÔÌ¡{\\I_¶ØsÃ•\0«X¶ª!(Ó\0µG¤®ÔÆì²TÕZ†yNÊæQ†œ¿¡)³›¢¨7úb|ïeªÕ“™ÍwˆÜ§L\"õ¤’ZM Ûy™‡:»¨?ÓUzrô*h:µ\"€Á‡™\'İìÄrƒ‡¿éæq’,5r,Z9™‘·ÈúcjïK+MED\0o·„\0˜6#á„)ÄsY²_/Aê¥ˆ}$,_®ä~©½şJÎb¥·ğ/ã\\F©:ÖšOUmÔø ³i\0ÿ\0XsÅvŸ­zhu)\0²sk©:AÒ!fâÓÔa…n\'TÖ4Í2h!‹§Ä‹3‘cø——^ì\0	5*vx\"Ş¿o–çÑUy8bÄˆ@¾ò…ƒ<È‹nÁñuÇµ¸YG†:ŒÉ \r¤ÆÖ‹_óÚßF’²È†Ôd‰€uÆ¨òH‰‹±0¿‹ä´ˆR·?/\r‰ÌŸ„ìwÁ:ù+ZŒ—RLA‰åå³©ÀÎºªºoàr=å ™díñÃzù`lmqÜÁ36÷w$Î±+¸y•¸Õqa;8Û\Zjå«~C¦a§™6<÷¿§¦3ƒoS>{œyŠ•6:7\0;\0ÁÂ´ˆ\nìå)o vÅ²ôVšV\nÏŒq7;Ä|±PàµË›¦ÊDÏ3/\'c$ıû¸áêÀ¹i¹€¹Ó*1æ^ä‘@Å¢ÁÄ‘¦ÈšF™Æ!¢	3…Âºiõ¼, E¼`õë>£á†qB)\'Â¢56“±ŒtßÓæ3@HfÀ#Ã¹3Zz“};LJ1õsl4‚v4Å¹\"æÜÏŸÇn#SS^N¥_ŒÓ]şË˜³#P,lHQÓÖÜ‚ÄrÆœC>¶$’€lÑe\0Í­¶üşxœ§°Î¥@SP$‘Sr: b“\"ÇŸ<xZX\räÌÉùn~ü-¡Ä”Re:µk\r;Vg¬Çï=.$„•\Zïe˜¿ÂGY‹NŸQ¦4¬ÀÏ¨‰ê~_,iN„	™“¸´üqíJÁ©“õ”¬ì7Ÿ¾ß?\\ßy[ûÑµ¼ù~sÏŞjçL¬NşurQäw#üñµi¸-f#ÍHµÈ;ZA3Êq­^!!Gr²7$Ìép}Ğco>˜Ç¨ì&4!LMµ:ˆ#m£æ¬9Aç²ŠÈHv`-ªR¶€³&Ç§(Âª´ ƒ$rŞÚ`››‚y™ß~mXÁ˜¸éö‰Û”y¯\\M ¥À½…0`Ø‡™ÂY#±¦«¥@PÖÒd…’_x¾¨1;O38iÃ³2ºÀägÄ6btÏ8&×ØØÆ¬ĞaÈ$ÍÉ›\\zæA>ƒQªıéetÜiÒªK>ß2A ê1P«ªPÊå%f«T$’HªôF§ñ4•e·ˆîp±Ÿ„;èUË×©ÃUïÚ÷,Ço³®ÔSxu9\ZÅÅ9º¸dt°Ú7·\\\\xO³nr4ë--5Z’Ôƒêì¡ûÅƒ¤×\0´D[·Î³É*±Ç)¢WÆœ§YB\Z¹J±ö¸›\06{,Š¾,Ñ‚%JĞiÈ+M¢L`L÷5~Šíüe\0Å†ÚŠË[­óŒ\"Íq—OâÑˆ\0 \n3µ‡Øo‹Ÿ%~|¾]YŠÓÍf‘õi¢´–y\0o¹˜EÆ{„b*U©Q!‘ëQGR†‰‚6™“p0¯%İÓ4GûMuTÆ’`sCzƒiä\r¹®âLªu.–hovaT;Í˜€ä›âæ¢n7–YVİkf›ìALcÓÚì˜Q:l÷“£Rÿ\04ş•Ù½1U¬Ã¢Ûœ¶ÿ\0åÈ@Ì:‰Åü¥n¡í Šyta)/§»OñÁ\'ÚÆoR”Z@ˆÎIAh\'Î1PËğúî#¼í¥Xÿ\0Ê¥Ù,Û	jÀud*>oË{VâLù3ÍQ\'æAÀu{WŸuÙÊáK2˜¨FÚfËÈıÆ!‰ÌıaI?§^ÜŸ³ÑìÉE*ù¼ª\\Ÿ~¡‰v§ºòòÂø\0;R«V­b	Ó©ª9ŞÂÆqzö~zwÿ\0i¬j#Ş&™°›õ–æR6Tğì^‰³s§¥2Aa¼eØ…1bf`‡<)éS¨]Øl|pÒ	“¦f%¯&a_£‹ŸPT©ƒ ÆÛ¬813b¤Ø|àá¿d;CFH-úBĞŠIñDJ“+{	éåŠÆS8+¿€@%M¶•Ø¨2¤’cc6€q6[9Mi„’Å¦ÄŸ’± GM6‰ŞÛüÅıâù“W5V²øul-	\"ÒoÖuy`Õáã”³S³kø¬ÒnyîawZÌ\"Š›ÀDLw v¸Ş¶}T±1o­\0ˆ[r7;Ié6ÿ\0\"F\Z\'L€$Xí¤ÈƒÖ`ßÌZF!â@(Ø&neAmDE¦ı¶ÀUsê¡\ZAõÚâ×ƒöávgˆDŞMŒõ|H“#ÔD¬ª/­V¸<…É›‰6o·ìÂ¬Ú€.n´DiNÛü0oñ4“bA\0@éqûu`*ÇÄ/Î6ó’D8ë!;JÏÄî6°gïûq˜õ³$L&ò&÷éaåéÓŠÔàŠU,­«Â#­Æä)´Dü›œXø~y…-Ì¸:I;\\›­€˜çÍ©ñ*”Z%Xvı\"0Ë)ÚİE%`É¯âb\"cÅXˆ¾fó€èa\'J±i-¤ÍÖA‘ıc2ÈŒfK?qJ’\"ÿ\026ƒçïí(öÉ\Z±VË£Q&QP•uğ§Uï{Á’o8’—¦ärcÂcTv÷å7Ú.p`µw§T0;I&62@\Z¦äuéh¹:æi¼‹˜:˜DÄ\nò·§4;?¤®‘*bA é‘r&Ã ÆĞ0Ö£gpU€Üò$µó\"ö¸½ñš©RåŒ÷¦gIB ù“$Lò¾\\°Ëˆ®•+h¦Áb	š†cú£W[±ö‘\\ÌvU\nqX@-›‚×9,ØìÚ°[qaE³Õë!*	Y\0€)³\\€¤˜D*m¤İái‰âÀ\r7¸‹Úa¶Ü·ô\"p8¨îJÒRL›(›l¼ùŞ\'bŸhÀB 0C%­5_ÂTÉZÛÄ/›\ZÊK1€°wç<Ë¿[ø°gàÕ††V¢¶ŠÊàÉğ…‡6Ø.À“iÚ>×=E ˆñ–Rº€d“> <õI8«Pâ,‰± \\ÌÅÌ0±çÓV¤Yšãİr±v– Fämîƒ¼EöÄ^W:\rPjhºˆ&,\rŒs™ò×)P«x\\²Xì¤ÉàòÜyj•ûÓ&™ÕÈ¾ÃIè/é1Éˆñßqxˆ·Î=q•˜Ö]kœVy,PÚHÒN£b~µ†âæİ,º“\0¥©Ê´‹…7Ó$Hó	`ˆ\'	L$FA‹Åâ=p»9\\)ºé`o~Gkò™1…ŸŠÓŞZ–fZUK(eÚÁRa3\ZHˆ§@ŸG9œñ¦¤ï¾ZiÁM-×iùàÌÀ(Ÿ&C}JÆ2dõ\'¦ãF«ÃOx\" ˆ\0if\"şøÛ®ø©)\\Ç²”ÂÓÈ	HhU+xÉ:ºõ8…iäÕÔ`îÅHEcªB•pH˜#¤s±šPÖA:Uy~©ıSã¥À˜8µ]\0¨& r˜ƒÊnyt7Ös¬¯Sø³å+eéËmıüD@BFğ9Z!Ìñì»‚ˆrÄ³J†1\nAS9Ü’ƒ+T(,Ñir	 	7\Z6$l	WÆu@Ÿ€¶Ú5DØÈÛc&Ğ#ˆÓZœrš	L­354h°ñxn{úcVíµ`H¥¡ÛE5_Ot[	-ùGÈÇ§ÙULyOÛë†s®Í·½V¡Ÿ3çû~X¦~³\\–ä\'ÿ\0wœ‘ÄzAÛr:mû6ùâl¿+:ÌEï`c¨ç€%É«TğÙš\r¢Lxˆ\ZO½\0ïÊ~erÁÅà\\¬am@²`Dı÷-AB¤‘¼0FÓc¶ÑËé’Tˆ\"¢`4€ Xu›˜ú Ø$yrUb@b³™‘ %z€=Ó\\5‡#Ù½%XjWñ+mÃ€#Hdf†b\rÔƒ„Â„T%^µ	%LÉúÂûŒî}0ó‡ñ@\n+¹6\ZZ\rÊaLÉ¦0¨4£šÑº,\"Á¸†•fa¤ÜcÌ×ÌeâÅ©Äî K®ê& `ìcN\'šPB‚GÕWÃî0\rŠø¤N£8C[2‘“E‰ƒïÒ	Û¨êq«Xèf)¹ñÈ÷ FóßpêgÆ©•\n›Dóå‘3ÒMïdÙÌÛ²ïdéˆ-3¸äç¼@jA: È±2w\0fÄÈé‰ò­2|äB©¤`<úL+ÌfšldíÔZİM­lC[0&fDìA‹Vgí‹Le3´Lï-çíŒT…h¦ÌÜ¼¢÷›o#§Ù¶ñ¹–&\r¹ïo#éøjÅ¶ñêfâ:z}ºTÌ\\şûØ‰ışb°µµJû	€okmaøşÌfz¤şÿ\0,f#A;HYÓ.ÄéBI{iùâtuƒ¨	[|q×OªøÇÄÛîÅ¥	-M¾Vûğ|±\n_Z€%N’\0‚¦ÜâóÏd‘)€ìI È˜€y3=oòÀ™Ş$õ\\—rÄ™,ÆIøôû0Ì¿iÚUfïSH\001ÍI¹†,œ;ˆ}$DÒ…Ø …Nöè-qcÊ“ÁÊifp\rÀSiïËC‹5\Z…è¶†3Ğˆƒë8,ƒ–§¥Ã#j*)‘DÕ¦^|f<vÖX$1IÆx¬fİ+T5‰m/TÉ‚ °ñlÈ™Y¶ìÏi»ªˆ„‰f…’åÙî(š€ZŞ&&E°«µ¹µ|ÕrëU¨Ëu˜¼së‰Ÿj>¯V	X€¶\0<æ\'ÃA¿)ßl{M˜x„X˜0,oÌ#G/x^òMá¥MYĞ\Z†ë2eˆ…&\"Á¹=9’7‰ªZ,AD\r–$Xí6\0XÏ‡7Êgˆ\nuÒÚ¦\r…åIs${»õ+;ÇjÔPSôbHPAÚäÀŸ‚gM°·¸eªÊ.‘0	ÎÛõLŒL¹gmÁóÊG1qÖæ>±œ,\ZcGˆi3LxH€z\\‚ &oÑLMÎä¸íÎ¤=ÌüA\0l9t¸¯QÊ¾©¾ûÍÌm@m¢Ö™cC‡Ôn$s7å$_Ë!Ê16*S!H3Bé`Ñ;ƒp&-\'Ÿ®ãÖÉ–Qà,‚¤’\r†ê`‹(÷ç•2u’Y@#Ï ?Ò:›ïÁ\'Öâ›¬.ÃŸ)ø‰æ \rçåüm)s&ˆ‚“µö’\'Èm›áVn¤\06\'e–6´<¾{^„éY‚éúË´ªÊ9È7ßÃc{×ó<?I*F£\Z´ÜAP	ø‹ÚÜñ|Òèš!Z­@³¬‰ßÅ,ÀLéñ\\€| .ÍdLø†ñ$^9¦ÿ\0ŞøáŞo À‘¸‘¶‘\Zš=.}q,™\0‚¼Œ\rW±›Ïï‘åuœ»’/1êAzôØ‹cÁ—Tr6¹›||ÆVÉ±høïÒÒ-öâ¤`0\Z@ÃrŞéä‘Ş7ÃÒÂôË)GH¹´˜’óÓÈÆ×Òµ0:‘oçğŞıpÍ2â¾£¸/üë¶şqÀF˜2:ì mc7;ÀÛÈuÀ\n6S½Éƒ{s ïó¸”¬Ki|H`Ì·ò¿–#6dÛ¯Ë–ıwœz¤‹pxëâê‹yk2OMbdXn¤Ü)Rm§q°&ÓÌaÆUáŠwh…!J±0b—\'kú€……Œ{ÍÇ;ˆƒ¸‘ca5ËJ“îˆ\0-–\"ÿ\0,´W¬=ÍgN™w´fb\0]àBÔÍé²–ğ€\ràA&ú-¼¬±s^ Ó´XsƒÎÂ1æ¤•Şÿ\0vğ9zá`ÓªœVğC@ğÅ„ßmæn ‘nQó °&Ò,“{Äm“ûÈëzó\0]£˜ßo+uÄ”i˜¸›sÛä|ÀÀmq¤ÍîzÉIÛ¤Ÿ.˜Û3›’Waa‰{ì7·—,^˜›zÿ\0<jÓÓãÌÛøà\r«V‘$ÌúƒoÂñğ¾#5A>øm71ˆBçûóÇİ¶ÀM™ïûÛ÷ëçˆjTüñ±¤yFhœ0Ò¥OS1ãÓ8Ì20­”GI,&ä°üã|,ïÚœ¨·[	ùôÁ™|Ö«$ƒ¿/œóÀÙê\'Ş#È™›ÅËîÃ¥ÏÔãÆ¤Fø‘k€ 8€™ÀÓ¨ËHÁ±kü¾ì?ÏÓ#F’`“Îzñ66ëüğ*÷\rmÄÈÂû~Ì[+ª™Ò ¶¯«ÔÉµî`‘ÂáT[b\'îë‚x~}Á2I\0ïß€,}•Éw´†`‘æw‹Ağï7û_<YZÂÆ\r…úŞ$OÄÚm€½Ÿöí2ÔkRJ«M7dx>-Õˆ›oå‹ö“#NO-Õ\nBˆ&Mï;MP<Ÿ«§N†ÑĞ(qq}É°ädáÇ\rìf‚N’wÕ/Ù|ÙïjuÔ¦PGWA¢\n‘2H`ÌA1¤€\"&ûâL¿o]s\r^+(¨B¥ªÄ˜Q)ˆ0ÆßXÉˆ›VUì‰\'Å¤ßœõ)Ÿxùù˜gş©PÅb,Â:G¦9Íhg4k*’ŠÈ•\ZnìúĞØ±<„;œTé{PÎS«SVr³\rR$£ÂÀ¨Iˆ>MùÌçUn;uL•0á’cQA\Z´ÜôZ$m{ïêviK¤ì/á$ŞØ9c€ö‡´O™Ï6m+21e4îu$\0¢ãhñğèyj™¡A\0zOWI\Z&¾’¾-”x”àXeÌ½/yJ¹0ZŠ×¤jINğß$Cn`à+ØÅa©’°¸,<…ü±Æ¸ƒ-WƒL£T`uCx˜d$˜¢/$á·\0ã9Ü©aO5P\"ÆšeSº Ì­¥=Ò<#—!|?øÇ·@iºsıããˆß±-É|ä|/Ï—ùM|{MÍ¶ùb5^İàîÀÍÌKxwõã]ºÌ²F]V™\Z	¨]ª<¡ìªI‚oÈLâ|ô~¡ÃöØûŸe¯ÏoÛñÂ¼ßaêÀÜşü&ÿ\0XÆÙÁf$ x®+1Üü®§ŒvàëÜ¨˜ğéØ¾¬B`om°ó¡±™ŞÈ¸RY NÅ¼È1&6´útÂ\nü9B—º@“\"-pLEüöÁùµ­X*²T\ZXŸÑ¬K=ëCÆáy	7äº¾GºÔÕEÔB†-³1 ›±ˆ6&7Æ’&Ğ•stRš‚å y5Ff<Éya~S8µjée°tb/si&7Ã¼®F“ºª‰›´µ|\Zö²m¼Ÿ‹ÄT¶¥c!@ÚÚTd\r\"=&92-	‚ğ9ø[[ßo;ùk¡&…±’·`=gáƒ8ŸåMÌ	ÚT<&‰G(#}ı­YJ%ñ/° 3ö3ÀM©šGrçnP`Ï/ÛlkZ¥!:EKmªGQ?/ñ\ZÖÒŞ$’@3¼\r\"\0/7AS.9j3~cÏ”tŒ5¶O4‹PÊJ@ƒ}@Ä‘Ç-†Ø\'øR˜÷i™åÊÇ\nØ(¸Ÿ‡=Ï3Ó÷ë«\0 @ckßì‹[åƒ³;wPLÈ7÷ı÷Ä9|ãªŸÉÙ®9üAÆ•“W 3£—ÙˆœF6ø|pğ\'ş©ÏO¬E_4ÍHçlkR™‰\rÏœãÍ&ÒóÀ®e„ŞÜ¤ß\Zı!¹™û±¨¿ß\\Gç†MjcËŒ§öã0\0àà‰±ôÿ\0«ŒÀcußŒÀlÄ«¶3„\Z×÷ç‚iïñÆc0;Â™‚ ƒpd»=fÀ1\0WeM‡ê/,f38×3]¡£?¡¼™ñæOX1­V—`n\0°åşËVŞ·õÇ¸Ì SÛZ*  ˜hğÅY1˜Ìı_i¨lpÓÔ\"°\0\rˆ}Œ·¾3ŠK¤S ¿ª7nC“ÔQö(Š:`>Äç¨©2ÑXˆÓ˜\ZHæ y˜Ìf!cı9sT¹,EF\0µÌiaò¶æòˆ´Ø*(ØY@Ù©>øÌf\0MÅó,«A•˜1Ö	‚@x\0`\0>CŠÙÚ•35£»¯vL3\'NğyØ_ËŒÃ*ñª¤ƒ{ƒZ~ûá_r+(¤Û—ºq˜Ìç¬ÅRX™7’oà;ü‡ËÑPL\\±Ÿ8PDüoq˜dÊ‚Îyëÿ\0æ~gåR\0µş`cÌf\0,}ï%sboÓŸèşŒÃ&gTNßWóÄ\\€óŸïŒÆ`âŠH‘a¶ SúVgŒÂ7“âaÊM¾8Ğî=q˜Ì2IHøWúCîÄŒïËŒÀFŞ˜Ìf3\0ÿÙ',NULL,NULL,NULL),(3,'chevrolet 4x4 ','2009',1,1,'ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0„\0	\'\Z#/ $\'),,,150*5&+,)	\n\n\r))),)),)))))),))))))),))))))))1))*),0)*)))))))))),+ÿÀ\0\0 ;\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0Q\0\r\0\0\0!1AQa\"q‘2BRS‚’“¡±ÁÑÒ#3CTr¢Óğ$b£²Â4DƒÃá„¤ñ%cdtÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0!1AqÁ\"ÿÚ\0\0\0?\0¼h¢ŠŠ( (¢ŠŠ( (¢ŠŠ+ÂqAí¦[ıäUsjòÊ\0%#RÚAÎ“#ˆÁÁÆ®x8Î\rhŞIÊ!í2ıaúhËúÇ®ôÁ.Î¸÷L>q¿Ù]7Oc(çÕÚ?ú®~Ê*^n@­M´ãİGœUÖÑºhÎ\nÛçÂŞ3ô³55K·\\r5½¿Û©¦-VÛrÆ<î¿}jmæ¶î!yºªgŞ™Ç\'Í·ğkD›év9MşU·ğªv\\[‡{­?Zƒç£üU‡õÎÏ8ö]¿ÏEøª©zoØgÙ¿µ¿ğkÆŞ;ÿ\0‡·o<VçşØ¦¦-ÄŞ«SÊææ–3şêŞ›rÊXÏ™ÔıµJÉ¼W¾é,ßö­à?u&“m¹üæËÙ²é£Ö­šºbûKÅ<|Õ˜œw×<«l8É±ã_\'¹ƒÕ§…\"mèø‚K¨Ê¸á¥)EÔlŒ–Ös<i¦:TJ;ë ÕPZí\0j¾½ü®)€ÏvtŠrÙ›×#êïÃõjëí×@«Š@ ÷ãW½4Óuİ½çk†Æ«y^ŞRp{DÃ#<xê>j“ƒUÑEQ@QEQ@QEQ@QEQ@QEW„ĞØ¨nÛŞ)g¸6v2şšb3²o|çí#°+†õï$²L,lpndwæ¶ñğÌÜÏˆí\"öFËƒg[Ó‰öÎííåsíÏyõ\0\0½‰±b³‡«Lœ’Ò;RK!Æ©$nÖ8\0\0\0°Ú}Pp5Ú»ÑÏBv¶òcÇ€¬ÚÖ&{C{|i†ûy¿ŸÕQ!´7Às¤7;KSšŠÜmÌó¬#Ûˆ9¦O£EÚî•ìÍ¤‰GÊc\\\0óùêa§©o‹6Dmì}¤R{™Y¹GUf×5¦Iè¤ì¯İôŠÓ-#Ç\nÜÓÓ]¥ØÔËÚX‘D/êÛß¦¼Ã{ÿ\0®µ™«L÷šTš£zÌÁôƒÙœÔ_lKıãÒ¿HãìÒ[\'»)“kI™ı+öU‘-]wl!ìÒ;|*)·¶™‚í.£à%*²÷u‰­Ïr‡Ã=õ9ÙB[Hˆâ4cÒ¤©úA¦Í©¸½|rGËP8=ÇšŸAÇª¢·mª. K›PúI\0L£ÛA.=¸a‘Ç“É©îåï”Wöë,g©O¶FíSæ9ğªt¯¤Y:—Êº±B0àá—Ï¨”iÚÃj¾ÊÚøˆ.²½™ı(¿“E]GEÑZm. e9äAVêÓ\"Š( (¢ŠŠ( (¢ŠŠ( (¢ŠŠ( )·iïÿ\0š8óË¬uLù<iÅ¹W/ôÛv[lÊ¸ ?ÖÆ‚ùn’öpç{oó‹öR]ñßa1­°Ü\\ám‘puû sËÑ’9†ÎÜÊQY˜éÆNx“G®­½m41{\"IYo\n,0¡¦öñ® œF²6=±È\0×jŠ±6Ê]™nÅÛ¬¹˜ë¸—™w9à	ã¥r@$ócQâŞ€IËIªãkìËë†&[ÀÙ?¤˜qáÍ¸pîšNàHO«1ûW	Ÿ¦¢¥7ûs9ò†|ôÆ×„ÑmÑÄÀ^ÚüY¡?÷)ÆF\rÌMçšl?\n_¦2{OÛÿ\0Š@f©2îDœŒñ°ìh›fÎ¯¦µ¶à9ı*ú$Š©ˆá–µ<Õ\"“£—?¤ÿ\02#IdèÍ½ÿ\0ïG÷Sa†Ó·d÷Ã‡€¥`³ärÈÀû«ctm äÍèÒ~ªÔÛƒ:ö¿Éû©àò]ì€y¿ÕM¶óaåı¯¯4¥wVé—J«¸ı†b==‚›®ö<ç­‘½Y•›äj×B—¡ßIv…Ç’1ßö\Z@\Z68dÿ\0†7cêÍ:\\n­ÙEu‚G†U„l¤ƒÈ•æ\rÖ\'¦ûÉs7¤}•²è¼M¦D*AÆ{#çºoi2Ùª“è½ÄĞ˜Éâ¾Pó`ßH*—oÖşÁ²LH`yå”\n¤(URYyœã‡aåU6èt§ŒêÍº€êÚ†$ã\rÜtŸE4t¿«´îÖh‘ãE‰cÒädÎÄù<=Ş=‹XmíëIoåºŠˆHË&jtÈİ+—:tŞış‹hÇQÙ¼wbÛ­V]Dé#\ZAÁÏ`ªğÊOm:nŒZ¶…ª÷Ïÿ\01h:3¢-ºe´ê_ó–ìc#´.N‘è!ÓâU\\÷Ñ¦Ş0í™ãc…yæCñ¤b§\\|s]\0“9ÕFÊ+ÍBŒĞ{EPQEEPQEEP‹8HØWíÍúºœ“cjòÀ­ 2€]AÒN‚9<yàvPNö†òÃÒÒ\r~ñrÎ|È¹o¢ªëİË«ö»¹º’0Ø«Ë&%8•O@f±]ãÚ#@]1uŒQp“€Ydû¢0{ÍFÛyG#J™}e¤‘ƒ;™¥vÖ¡*óY<£Ø«QR¸o6T¢3zÊ;¬J}¢°“xöpö»:Y<dšVú5b¢¿ÖğP‹8â!–qù†ÁÇ¦½ÛÛòğÈ±¬Cóq9ö‹ùÔWÖ1È0ãõSR…Şûeö›ûJë¶¯H=¦È·h”}B Ÿ×©›‡V£ş¤ßcŠÕ.óÌ{µ?~>\Z˜š°ÿ\0´û±ívlCÌ‡î¬‡Kwã•’Šj­—oJ}ÊúLßÄ¤í¶d>åÌş%0[_Û%øÿ\0’_SVC¦»ÑÎÄz5U<vÌôzäüt·dm’M,¤\r,IWq€ªX,{¨-qÓ¤ãÛXŸŞ­«ÓÈ÷vl=uNG½rgÉ24­÷S­øNÊß”pPjôÈ§Ï©|ÔMïO–Ê?à‹>8}dŠ’¯¯ßE­½­ºŸvcBG¹¡Pím;Ç’rˆ4E«EàÇ\ZãŸÇMLcè«€êö”$\0È§\'³I4½Ñ‡²€m¥µåŸ?¢ŠM1+#Ô¢æèËfÛ¦bX°4ªn›°.·\'QîQšª®÷&â0Z-§nàdù2ÉÉx“xŒÖ¸7Skë\\š›IÃ	Tğ\r¥€$äy\\1Ãˆ šíİÉêa’S%¬+ÍLîÖáÏhêÆ£œrÂ«Ûmå,1–åŸdŒ áJ,wbæ[—‚C)R[Éï^ÌyªÉfÙìØ„“¨\'°Or^šŠ¦öõ¤Å“¨	!|–bO2íæ*6|*üŞ]÷³Ú–OhÀÁ¨¡I\0(Àç@Æxjº­VÛÚÍ±º‰cxF¹»‰®È¤jÊˆHlŒ‚|“Äâ¬J¨¶Fæ]Ü§Yø€ú$e$sÁU9­Òt|=‹)ã€z·\0ñÀ<T`yñãŠé{ß JÅ[š®…9D\'Jdé\'†i®ÿ\0isãSWìÜ/·æ2ö\nÕa¹Ïmq‹pšâe‘|†a”`GFjµ¶§A-ö³Í®O\'Bœ±8\ZIÉá56ÕÈÛ<J“<ÈH‘Ø±`xê-¯Pî:¸ÖK¿—èÓçè«öğe4Ï{yM\\V™©¥¿KûIüJ·íÅÿ\0HûaÓmî|¥¶o8•>ÆªbkÕb9PtVÁéNYY–É†`G: 5ip<xU•äf¹fßa3¬«y]¸1Œvñ®ŸÜ f°·‘½³Ão>Ÿ§4•yqÌ?QEYQEEPQE{v™·Ù×2/¶XŸN9êa¥1ã©…Wñíë¥Ùq-½´q…F$Õ’òDÅ¥ÈÂ ‚TãNy‘Â§ûï¤Úº³i\nç‰Á é8\0xä*¨İÛ±nİ\\·%£\0ymoq«Å@)`9ûŠQ»»»´òæ=\rÆ-K&¹QÕjqä‰9åÃÆóìèÌİVJ¯U2ä`ğ¸1?ÙO#R7ÚéìŸİĞ\"¦aptÆ]›É+ƒ­˜Ÿ\nÓuuow3­¾?¼Ã4L ¦Ycë\"@âf\0×9ß½ß_½zÌö„\0\r³0í‰¼şÑÅ>ï®Û¶K¨c;:	dÖ€Ë$—\nXµ¼e|˜¤P0§…FvlÅ­`ù*ê~¿G:”ïğZÆöeözM!²´c+M<e³…‰€à3Ï‡…ts ƒm¡åah2}õéïÿ\0ö‡uJöFÆ†EŒÏioùtëB.@DÎ<;‚{Ô)ÆA$q*»É8lè€åÿ\0yØp¿¥ïåJ-·ôÄŒ‘ØÂğH72÷…‘ÙCpâqÇÆµÆÉ|³ËsÂS´wVÍ˜ÛD=¹2²é\0xäóà8ñ¨õõv²F#ÚD•‹äÌ® ³(:ÜgÉÈ à‚Öçßb>Ä‡Ğå{3H]6K¶!f,û>brKOtI>\'®É5®|¸Ùâ\'Ê{­0m…?ò¶çÃòã³Âj•l«¨ÎÚ2û(8cE’6”œÏ/W§;Y<1ÈÓ%¾Ş€rÙ–ùÿ\0ú/GtÔı¼;Z#°Ul–í5àW	$²XaÖe%€\r Î3“Û\\ÛA65®²Ç¸´ÿ\0¶—íÀGº?eIıcã\nÏu­Ë+\0=³cpRÀ5dÒm£8¹¼\n2#Ôx„‰Â‚OáÙA2Ü­…Zu²»«1ÔjX²­uÈ¬5c\'å 9<©¿o¼Š²Éìñ‚Ñ§’€oo’I8Ç”9©<³Šxİı½¸e™\\şPÈ­?“ä•U$SJTàÆ›6ÛÎ]4Å$õ%&tmXÕ¨u`qÀåÈÎ¹Îı®æ|nõë3Úeo³¤k{Rnì¨ušP¬f AU‘€^øóãLĞÉr³Äì\Z8Õœ¬¾TzÁ£É[S‚Ú»)FÏŞKbû¥xP¡	4®ƒP`¡Œ`áH8ãÛÇ\'‰6ÿ\0HV¯\0K¤‚‚T•cL“–X‚¨ÒNpxqÍnÍ˜œn]Yéh“=¬˜â¯\"“ûQkÆ|è*é7zMİû„?’Œ”Œvô5fo\'IÖ1Ø*ÙM®`[É+(`^	P±f@8ª¡Üİ%ÍäiGpPÈ\rÄ™vª(g#·\0v×?ÇÃ§	Æükòrœ¹[>¥û¸èÃ72I€DQÆòº†V”\"¬ÄjÁ#ˆáR}‰¼¦Îv³‘¼–ÉCÄGŒñáŞ+~ôoå¦ÅÎŞ#<ËÆR[[q-,˜%¥lê>~c•EööÜ‹jÙ5Ô+ÕİY#&rz²|¬6¥íåÃI¼wŒêO>ò€òqæTşâ²šovş{j&Ş$“xú©,»hÚ˜º“_í\\öÔv[Ä\0â1¯$kš™ãN9ñ>ß.Ğ&‘É=YÒ›‹ŒšOª´´µ†kL”+dÖRÆ@Ík³UI¶.ÊYµ4Ÿ›N\'H\'™ÉÈÀ;{j*?oµåA…v\0xyXÕÃÇÕ]IÑ<º¶]·„`z«˜vşÊê&ÒQ€d<øß?šº‡¢ÙÙvØÄJ=+ÀšŸZÏñsú—ÑE¦Q@QExM{XÉÈĞDvÉšI£L_“\\¶Ÿ(ª³·©•GÇï¨.ÕÙ×LNJü³÷Uˆ$ü“ù¦%ô¶£[@qåXäÔWW{·;sdùMøj-·­§²¸ITã‚Ë:\0F{ÁôÕ«qõR)¢È ŒƒÌ|àó©.5f«›İóŠl³YF²9&F¥A!<ËF²É<ğ\0ğ­7{ÕÚ:ÛTq\Z„LJ/µPVA<sÎ§2ì¨¾/šğÒ¶tcô1|Ì†µÙ¨sï\"û˜ÊÛ”óóÉZnîOÊ“ø•.{(ş/šğÖ‡¶O‚‹æ¢ü4ìuD›jƒîOÊÇXH¯½?)ÿ\0Jš%ø8¾j/ÃZ™ÁÇóQş\Zºa‚-²ƒœ9ÿ\0©(ú¤Ò:5¼p>Ï¶hâ,S&]AŸÛ±my$àq\'°wV–?àOšğÖ‡”÷/ÍÆ?ÛMLi›z‹)K{há/z³+±ÕÀ­Ûğ\0ú8Sê\\ÚØ–{¥‘ça€±…\"yê,Ãò‡´j8$€Ù-ë€@v\0óÓäçÏ§Ù5Şë{¬›’L<èŸcÓ]ÆŞµ<‹:}Æ¢ÍÊ“\Z˜ºÏ´á<™¾I¢Çc½ÉÄ\\|ü*>œêÅèÖî%fëàãSŸ]_Ií{>©ôÈØÁã€OÕV_G³Ege{´À$AQn\\®i4—:xàdÂ¾eo\Z®÷•Á¸bÆO×S=îŒÃ²6m‚ŒÙsöyR’cĞÎ>  ¬nîZIİ‹;±fcÍ™I>$š}Ü\r #¿‰_ós£°¤ŞAÏ˜~--ƒqÌ‹äûlpÃs<;óåxSÓØòÚH:Å#‰ĞÜƒhldwqÇM1\"şÏ\'’@Á+éRWì¤SnŒ«ÌŠ¸ç¹GRÙ_(+ó€±úMDöÂdùkò‡ßYÖ²+ÉwmÇ6‘ö;Î¦WWQûôùK÷ÓEÍÄ~ı9t;üõeKé,í­=A§k¹Ó±—Ği\n²ñò…VZSÉãRÍôÅ­½­’û~©\'¹ïë&\ZÑì¡Îã¸SFïlÁsyo9JŠ|#Qù9­[Ùµı•}q?d’¹_Î#„\n=Vs²Á<a™£ø’¦´)%õ×JôE&­“lİèsçà¢¹’Ôÿ\0sœùmÏ©nû«¤:Ïô5¾{æõuòb†ÜÅEUAEPQEX¿*ÊµÜ>ĞTûø±ëÖ½jR†UšhĞ²ÊêÌR7Q’A9íÍU·[_Tâ ydc€×LIî®âjq¼[d\\#È¾×¯œ/Š–§Q>šŠîØ†Ûj±¸Óx¦$s…&\n±orÔ¹ÿ\0gë_®ØÆÅ\0Œ¼ÕÌ¤Ş9”ç‡mjŠùCyPDÃcò‹Ä‚å7ƒÏ²:B½KÌÄAJJœŒªqÁíæ*.Zª6NCğzM×ñ«Ã· ø÷?Æ¤÷›#­mq4yn,ŒéVíÆ²)9#‘œÃŠêäİÉó°ş:ÇlÃğ0ÿ\0î?‹^¯ÀÃêŸø”‹úµ?½_‹ñ×‡w\'÷«ó‘~*‡jÃğQz§ş%xv¤?ùßÄ¤ŸÕÙıêüäŠ¼ş®ÏïWç\"üT?¤áø8½S~:Äí~?ó¿\'·?½O‡ñÖÕ§^2ÉkÚL±»cÂ4bÌ|\0 q•àêQ„)©²IÌÜ#€ë=ïSHšdøırÿ\0´Ş^  Â(\n€ã!W´ãİ–>,i1cDmšâ<àB¹ğ2~:S´6Dc¯´xµ¯X$Lùµ\Z[¹;Nv¬—\0£•KÄ/¥‚¶ÑSŞ•6ªB‚X¤]0º·I°ìò1+œy<9ñÈ=¼B©Ê|õ·ßSN·jÒösÂºŒr9ñÎjçJ·Ki¸88û)VoÖÃ³¶™’İY‚öÉ#1ú1IvŒ³A$²:bVrI\'Hñ$\ndÛ›LË#s“RÎvì’íKb-ºÊV­°¬gSÍÎ1çÀ¤`\n6´×VmıæÒHÎ9Æ¢1’½ƒé9§½—uÒ‡Ø³²æAˆeÀ.¤0*1ØN1æ\'ˆãMİ&ìù6\\vVkpÒ2%ÄŒÜ@n½ôà¡$¥Ypyå»êa{ÔÈ‡¾2>K~</E0Ó¶ñ$ÜºOk#J¢0Ç¯êÆDh=§RHì÷TÒ×–ŞæÌ|iä?éR“ W×«ïRS&Xp¹ÓÙ”ÓêõÁCP-kÈ»-!àÿ\0İ­mt½D>tÿ\0ªCIëÍTÏø#}¹¬Dç¹>B~\Z×šğ8ï |İ{áÒNp6óÀò’/S 94€ú)Óu7ÙÖÏ†\'N5ºŒ…ôòôÔ9dæ3Ï¡Çë©®ÖAÌ±–\"ë\"HÁN–b‰7\08\r!€=¼h\"6ÒŠD<2É{×_\nè€ö´ÓØÉ×HÎ#”G¬y*‘Gä‘T¶ôX³Ş\\cwœ„Vm+2,œp8\0d#Ñ]Ğşí=Ì%R²9iHÁRøÂ‘ØB…ÈïÍTNh¢ŠŠ( (¢Š™7ÊğÅe;k„yôœ}4÷Q’™u“Ô¿Ğ2~ŒĞsÁÚå-ÙU”á—ÉÒxåNX6®ñY<\rG¥ÚìNJ\\9yil¼KÇ\'¸`Œğ ç–>)¦{ÇË·’£f@õf¤ZŞv«wWşkPÔç:”~ÓõÒ\\øW¡ê£s‡ƒ)Ç[=|?ŸE%ÕáF|(¿7óè£Ù>oçÑI³áF|(7™ÿ\0ŸäWoóüŠÓŸ\n÷>:Ñüÿ\0ñAlòş~ê×šPo–Ø¨Éd>•ÑXx6>Î«4PmÀ÷ßGşk7`ÀeøC˜vRzõFME@ä~ŠQ×#Ì¹ûkOWáõ×‚Aï­¾ú]İŒ•Ànc‹Ë’#•Ö«Í|œŸşxf®Û‹­¶]÷³VIh	Š\0½d‘³yç2\"+ŒgˆÎqÆ§Ù;z[;Hn-[«•&p[\nÀ‡CÀ† =Â¤{c~¦¼k+Ö\Z2Ñ7S¯ãxå}#<5Fê0sÈâ¢§$ôb6„ğL÷F6DHZ<ëUË†E\0Ùs‘œqğÁ«úAØÖö¤ÚÛA ö8W{‰±œÊ«Ø\0T\09á»ªÚŞÍà’ÖÅæ’Qu ,ŠBukùLF‹¨,Iú1ÛKmüº¾IVU„)a\Z. €	\',OÌöĞ+’ì\\lW\\àÅ,N5dœQ°=ºøµÃß}_i©Në\\*ÙO­5£4`©!CfD÷DyñÂ­kŞÙlš¡ÙM(^\Z´JrGJz(9êA‚Fs[ä´xÂ–R5Œ®FCÚ8`×@40Çù­‚OşœŸ¤µ\'Ÿo^/v/w÷hşÒi¦(5´sÉù”Ö¦R;\r[»Á¿[VÙ:ÉlÚİb‰F¢	!9àUW{Ë½S_2´í\0éåÃQò¸P4Â8ú*ÖŞMÓèë@ì©\Z%ÄÅÉá®sT˜Éêú¡áªª¸:»ãŞÉ/,ã€CÃÅ\0È8\nÑªë\'İ2è=ÜX{Ü\"iÑ‚M“lİº4“ÚLlÈ2|ÀENBâ«îƒÇÿ\0hƒÏ\'éaUAEPQEEPİ·ìzëyc?¤G_”¤}´ãXºäPq¼À£pTŒ©¤89åîõSeÉãš±ºgİsk|eUÄW9p{ƒó‹áÄ†øÇº«™j\r4QEPQEc=İÌVñà4¬Èg™>\0}am€nâ„É©;~MT£Û¤±Á#‡¾jUÿ\0Óşê.^ñ×È„Œ‘ÎGQü)‘ÿ\0PWCi äSÑÒãıÆnïãHFå_~£só2~\Zìn¨wW@î äK^6”™Óc8Ç¾B­xÍ)şÊ6§êRzãüUÖbİ^õcºƒ¶æèİÙ…70<AÉ\n[$‘ÀÊg®šéÏauÛ-FL²üQ”R¶¯‹\\Ğüè0¯Tñ¯+m­³Hêˆ2ÎÁTÖc€=dPln¡ªiÒVçGİ@z©Z2Nx¨ Éãí¸ù˜T1Åw-\rÍ´Öã\Z²²)9æ_Wg…]û\'bØYìY!˜ErmcöDêÕÖHšãe<×RéUnêç‹´Ì+ÎwƒÀƒçrm›ÿ\0fìÙİáYgÉvX„Âò8\nÇ\n¯©°ÊÄ9àEI÷SyövÑÙw-,kJ4İ#°bªÛX\0Ÿ%@SŒå08U>önÊìûWÒåÖn®(…üªì‰eã@Ï|„v\ZY¹û½.Î‘ŞúH\"¶–\'XúØæ–`FWªŠ\"ÇXp¤1À<xÓò_›©”è1[Ä¡-âìHÁïäY{üÂ‚UÑí-ÄŠ²gLef#±Š8ĞÃW5Ğ©\0ªÛ¡ŠRÑ§a½†ŒüyU>–.|Ø«6ª0ê‡uPî¬è ®úpÙ¡öDÄ1˜ä;¤U8ø¬ŞŒ×1×bï–ËöEÄ#œ‘H£öŠ?½Šãš\rˆØÍ^›µ¼ÖÇg²hÉn‘Ì¬¡XâÖbå³í0ã»%{MPù«Gpì¢Âv28™£ê%¨E·VYÛb¡|o5J±lô=lSdÛÌ«înÆ¦ôËº6]Uœ)Œi>¬Ÿ¤ÓÕTQEEPQEEP0ïéÅ´-š	GÅXcR8ö®¹íH$v×.o~å\\ìéJN‡I>Dª	AŞ°ÿ\0„ñØ4šïg¤ªVDVVàU€e>px\Z&Å®¶“¢İšN}…¡1ô\nÔz&ÙŸ©Cêo¾ƒ“±RmËÜIv„ƒG#\\¯€‚|¶ğiÑ°ôQ³TäYCŸ[èbE.‡eú¬? Pg»–vö–é%U#P$ö’Ok’Oy§_g§¾±Lÿ\0Ô+/Õ!ù°nìü¬^¢>£@÷ìô÷ÃÖ(öz{áëÇıY~­ï}õ‰èêÇõXÿ\0{ï };I=òúÅ\'›x`Om4kûNƒë4Ğz6°ıV?ŞûëÑÏıR?Şûè<Û;ñ³ú¶In`*À«.°ù0A\Zæ\ráÙ‘Çpëm/]&ø é<ƒˆåG®=lÿ\0Õcıï¾¼şË6ê±ş÷â¨®Pö;wTÏ¢ç´‚ğ\\^É§ªãéfÏ\rL@8Ò8ßƒÃo¿ì«gşª¶üUƒtM³Ïü²úş*?Hûİ³6…¡ŒMùTò¡aù.\"HKr>ƒÙTcŠêŸìgş¬¿)ÿ\0jŸ¡­šãØz@}a¨W§-“¼ÛçAòN2§ˆ8ğ5ÑØ6Íø)>uşúğô³~Oz¢‘ìã\nÃ=™ññ­v¢êâ5Š@ë[H÷*=ñåáœöUæìÁÎ)Y>Â)ïfôaa´¶NûSÿ\0¨š˜¦½›Òe”q¬q‡\n *ÀU\0qä\0§HºC¹,Çş“Sô;%ö± ó*¨R•µCE¾ô+OóMKly/ÍI÷Rá¯z±U\ròm@F4KóO÷W9ô‹ÑµÄw®ö–ÓI§XÓÄ–B1œÄx;+§:±^GuT/R¹ù™?\rMz2èæò[¥3C,àƒ)‘Ju€qªÜNOq€3ÛŠé> wVK”D˜¬è¢€¢Š(\n(¢ƒÿÙ',NULL,NULL,NULL);
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

-- Dump completed on 2013-03-29 12:24:20
