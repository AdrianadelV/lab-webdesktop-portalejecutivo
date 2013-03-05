-- MySQL dump 10.13  Distrib 5.5.28, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: AEVEV
-- ------------------------------------------------------
-- Server version	5.5.28-0ubuntu0.12.04.3

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
-- Current Database: `AEVEV`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `AEVEV` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `AEVEV`;

--
-- Table structure for table `Banco`
--

DROP TABLE IF EXISTS `Banco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Banco` (
  `id_banco` int(11) NOT NULL,
  `rif` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_banco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Banco`
--

LOCK TABLES `Banco` WRITE;
/*!40000 ALTER TABLE `Banco` DISABLE KEYS */;
/*!40000 ALTER TABLE `Banco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Caracteristicas_Vehiculo`
--

DROP TABLE IF EXISTS `Caracteristicas_Vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Caracteristicas_Vehiculo` (
  `id_caracteristicas` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_caracteristicas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Caracteristicas_Vehiculo`
--

LOCK TABLES `Caracteristicas_Vehiculo` WRITE;
/*!40000 ALTER TABLE `Caracteristicas_Vehiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Caracteristicas_Vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categoria`
--

DROP TABLE IF EXISTS `Categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre` int(10) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categoria`
--

LOCK TABLES `Categoria` WRITE;
/*!40000 ALTER TABLE `Categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `Categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ciudad`
--

DROP TABLE IF EXISTS `Ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ciudad` (
  `id_ciudad` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `Estado_id_estado` int(11) NOT NULL,
  PRIMARY KEY (`id_ciudad`),
  KEY `fk_Ciudad_Estado1_idx` (`Estado_id_estado`),
  CONSTRAINT `fk_Ciudad_Estado1` FOREIGN KEY (`Estado_id_estado`) REFERENCES `Estado` (`id_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ciudad`
--

LOCK TABLES `Ciudad` WRITE;
/*!40000 ALTER TABLE `Ciudad` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comprador_Vehiculo`
--

DROP TABLE IF EXISTS `Comprador_Vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comprador_Vehiculo` (
  `id_comprador` int(11) NOT NULL,
  `cedula` varchar(45) DEFAULT NULL,
  `nombres` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `Usuarios_id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_comprador`),
  KEY `fk_Comprador_Vehiculo_Usuarios1_idx` (`Usuarios_id_usuario`),
  CONSTRAINT `fk_Comprador_Vehiculo_Usuarios1` FOREIGN KEY (`Usuarios_id_usuario`) REFERENCES `Usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comprador_Vehiculo`
--

LOCK TABLES `Comprador_Vehiculo` WRITE;
/*!40000 ALTER TABLE `Comprador_Vehiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comprador_Vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comprador_Vehiculo_Banco`
--

DROP TABLE IF EXISTS `Comprador_Vehiculo_Banco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comprador_Vehiculo_Banco` (
  `Comprador_Vehiculo_id_comprador` int(11) NOT NULL,
  `Banco_id_banco` int(11) NOT NULL,
  `cuentas` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Comprador_Vehiculo_id_comprador`,`Banco_id_banco`),
  KEY `fk_Comprador_Vehiculo_has_Banco_Banco1_idx` (`Banco_id_banco`),
  KEY `fk_Comprador_Vehiculo_has_Banco_Comprador_Vehiculo1_idx` (`Comprador_Vehiculo_id_comprador`),
  CONSTRAINT `fk_Comprador_Vehiculo_has_Banco_Comprador_Vehiculo1` FOREIGN KEY (`Comprador_Vehiculo_id_comprador`) REFERENCES `Comprador_Vehiculo` (`id_comprador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comprador_Vehiculo_has_Banco_Banco1` FOREIGN KEY (`Banco_id_banco`) REFERENCES `Banco` (`id_banco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comprador_Vehiculo_Banco`
--

LOCK TABLES `Comprador_Vehiculo_Banco` WRITE;
/*!40000 ALTER TABLE `Comprador_Vehiculo_Banco` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comprador_Vehiculo_Banco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Concesionario_Vehiculo`
--

DROP TABLE IF EXISTS `Concesionario_Vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Concesionario_Vehiculo` (
  `id_concesionario` int(11) NOT NULL,
  `rif` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `direccion` int(11) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `Marca_id_marca` int(11) NOT NULL,
  `Usuarios_id_usuario` int(11) NOT NULL,
  `Ciudad_id_ciudad` int(11) NOT NULL,
  PRIMARY KEY (`id_concesionario`),
  KEY `fk_Concesionario_Marca1_idx` (`Marca_id_marca`),
  KEY `fk_Concesionario_Usuarios1_idx` (`Usuarios_id_usuario`),
  KEY `fk_Concesionario_Ciudad1_idx` (`Ciudad_id_ciudad`),
  CONSTRAINT `fk_Concesionario_Marca1` FOREIGN KEY (`Marca_id_marca`) REFERENCES `Marca` (`id_marca`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Concesionario_Usuarios1` FOREIGN KEY (`Usuarios_id_usuario`) REFERENCES `Usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Concesionario_Ciudad1` FOREIGN KEY (`Ciudad_id_ciudad`) REFERENCES `Ciudad` (`id_ciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Concesionario_Vehiculo`
--

LOCK TABLES `Concesionario_Vehiculo` WRITE;
/*!40000 ALTER TABLE `Concesionario_Vehiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Concesionario_Vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Concesionario_Vehiculo_Banco`
--

DROP TABLE IF EXISTS `Concesionario_Vehiculo_Banco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Concesionario_Vehiculo_Banco` (
  `Concesionario_Vehiculo_id_concesionario` int(11) NOT NULL,
  `Banco_id_banco` int(11) NOT NULL,
  PRIMARY KEY (`Concesionario_Vehiculo_id_concesionario`,`Banco_id_banco`),
  KEY `fk_Concesionario_Vehiculo_has_Banco_Banco1_idx` (`Banco_id_banco`),
  KEY `fk_Concesionario_Vehiculo_has_Banco_Concesionario_Vehiculo1_idx` (`Concesionario_Vehiculo_id_concesionario`),
  CONSTRAINT `fk_Concesionario_Vehiculo_has_Banco_Concesionario_Vehiculo1` FOREIGN KEY (`Concesionario_Vehiculo_id_concesionario`) REFERENCES `Concesionario_Vehiculo` (`id_concesionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Concesionario_Vehiculo_has_Banco_Banco1` FOREIGN KEY (`Banco_id_banco`) REFERENCES `Banco` (`id_banco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Concesionario_Vehiculo_Banco`
--

LOCK TABLES `Concesionario_Vehiculo_Banco` WRITE;
/*!40000 ALTER TABLE `Concesionario_Vehiculo_Banco` DISABLE KEYS */;
/*!40000 ALTER TABLE `Concesionario_Vehiculo_Banco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Detalle_Vehiculo`
--

DROP TABLE IF EXISTS `Detalle_Vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Detalle_Vehiculo` (
  `id_detalle` int(11) NOT NULL,
  `Vehiculo_id_vehiculo` int(11) NOT NULL,
  `Modelo_Caracteristicas_Modelo_id_modelo` int(11) NOT NULL,
  `Modelo_Caracteristicas_Caracteristicas_id_caracteristicas` int(11) NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `fk_Detalle_Vehiculo_Vehiculo1_idx` (`Vehiculo_id_vehiculo`),
  KEY `fk_Detalle_Vehiculo_Modelo_Caracteristicas1_idx` (`Modelo_Caracteristicas_Modelo_id_modelo`,`Modelo_Caracteristicas_Caracteristicas_id_caracteristicas`),
  CONSTRAINT `fk_Detalle_Vehiculo_Vehiculo1` FOREIGN KEY (`Vehiculo_id_vehiculo`) REFERENCES `Vehiculo` (`id_vehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalle_Vehiculo_Modelo_Caracteristicas1` FOREIGN KEY (`Modelo_Caracteristicas_Modelo_id_modelo`, `Modelo_Caracteristicas_Caracteristicas_id_caracteristicas`) REFERENCES `Modelo_Caracteristicas` (`Modelo_id_modelo`, `Caracteristicas_id_caracteristicas`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Detalle_Vehiculo`
--

LOCK TABLES `Detalle_Vehiculo` WRITE;
/*!40000 ALTER TABLE `Detalle_Vehiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Detalle_Vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ejecutivo`
--

DROP TABLE IF EXISTS `Ejecutivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ejecutivo` (
  `id_ejecutivo` int(11) NOT NULL,
  `cedula` int(10) NOT NULL,
  `nombre` int(10) NOT NULL,
  `apellido` int(10) NOT NULL,
  `telefono` int(10) NOT NULL,
  `direccion` int(10) NOT NULL,
  `correo` int(10) NOT NULL,
  `Usuarios_id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_ejecutivo`),
  KEY `fk_Ejecutivo_Usuarios1_idx` (`Usuarios_id_usuario`),
  CONSTRAINT `fk_Ejecutivo_Usuarios1` FOREIGN KEY (`Usuarios_id_usuario`) REFERENCES `Usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ejecutivo`
--

LOCK TABLES `Ejecutivo` WRITE;
/*!40000 ALTER TABLE `Ejecutivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ejecutivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ejecutivo_Indicador`
--

DROP TABLE IF EXISTS `Ejecutivo_Indicador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ejecutivo_Indicador` (
  `Ejecutivo_id_ejecutivo` int(11) NOT NULL,
  `Indicador_id_indicador` int(11) NOT NULL,
  `valor_meta` int(10) DEFAULT NULL,
  `unidad_meta` int(10) DEFAULT NULL,
  `fecha_meta` int(10) DEFAULT NULL,
  `valor_amarillo` int(10) DEFAULT NULL,
  `valor_rojo` int(10) DEFAULT NULL,
  `valor_verde` int(10) DEFAULT NULL,
  `unidad` int(10) DEFAULT NULL,
  `Frecuencia_Movil_id_frecuencia_movil` int(10) NOT NULL,
  `Frecuencia_Email_id_frecuencia_email` int(10) NOT NULL,
  PRIMARY KEY (`Ejecutivo_id_ejecutivo`,`Indicador_id_indicador`),
  KEY `fk_Ejecutivo_has_Indicador_Indicador1_idx` (`Indicador_id_indicador`),
  KEY `fk_Ejecutivo_has_Indicador_Ejecutivo1_idx` (`Ejecutivo_id_ejecutivo`),
  KEY `fk_Ejecutivo_Indicador_Frecuencia_Movil1_idx` (`Frecuencia_Movil_id_frecuencia_movil`),
  KEY `fk_Ejecutivo_Indicador_Frecuencia_Email1_idx` (`Frecuencia_Email_id_frecuencia_email`),
  CONSTRAINT `fk_Ejecutivo_has_Indicador_Ejecutivo1` FOREIGN KEY (`Ejecutivo_id_ejecutivo`) REFERENCES `Ejecutivo` (`id_ejecutivo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ejecutivo_has_Indicador_Indicador1` FOREIGN KEY (`Indicador_id_indicador`) REFERENCES `Indicador` (`id_indicador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ejecutivo_Indicador_Frecuencia_Movil1` FOREIGN KEY (`Frecuencia_Movil_id_frecuencia_movil`) REFERENCES `Frecuencia_Movil` (`id_frecuencia_movil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ejecutivo_Indicador_Frecuencia_Email1` FOREIGN KEY (`Frecuencia_Email_id_frecuencia_email`) REFERENCES `Frecuencia_Email` (`id_frecuencia_email`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ejecutivo_Indicador`
--

LOCK TABLES `Ejecutivo_Indicador` WRITE;
/*!40000 ALTER TABLE `Ejecutivo_Indicador` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ejecutivo_Indicador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ensambladora_Vehiculo`
--

DROP TABLE IF EXISTS `Ensambladora_Vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ensambladora_Vehiculo` (
  `id_ensambladora` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `rif` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `Usuarios_id_usuario` int(11) NOT NULL,
  `Marca_id_marca` int(11) NOT NULL,
  `Ciudad_id_ciudad` int(11) NOT NULL,
  PRIMARY KEY (`id_ensambladora`),
  KEY `fk_Ensambladora_Vehiculo_Usuarios1_idx` (`Usuarios_id_usuario`),
  KEY `fk_Ensambladora_Vehiculo_Marca1_idx` (`Marca_id_marca`),
  KEY `fk_Ensambladora_Vehiculo_Ciudad1_idx` (`Ciudad_id_ciudad`),
  CONSTRAINT `fk_Ensambladora_Vehiculo_Usuarios1` FOREIGN KEY (`Usuarios_id_usuario`) REFERENCES `Usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ensambladora_Vehiculo_Marca1` FOREIGN KEY (`Marca_id_marca`) REFERENCES `Marca` (`id_marca`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ensambladora_Vehiculo_Ciudad1` FOREIGN KEY (`Ciudad_id_ciudad`) REFERENCES `Ciudad` (`id_ciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ensambladora_Vehiculo`
--

LOCK TABLES `Ensambladora_Vehiculo` WRITE;
/*!40000 ALTER TABLE `Ensambladora_Vehiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ensambladora_Vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Estado`
--

DROP TABLE IF EXISTS `Estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Estado` (
  `id_estado` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Estado`
--

LOCK TABLES `Estado` WRITE;
/*!40000 ALTER TABLE `Estado` DISABLE KEYS */;
/*!40000 ALTER TABLE `Estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Factura`
--

DROP TABLE IF EXISTS `Factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Factura` (
  `id_factura` int(11) NOT NULL,
  `fecha` varchar(45) DEFAULT NULL,
  `iva` varchar(45) DEFAULT NULL,
  `Solicitud_Vehiculo_id_solicitud` int(11) NOT NULL,
  `Forma_Pago_id_forma` int(11) NOT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `fk_Factura_Solicitud_Vehiculo1_idx` (`Solicitud_Vehiculo_id_solicitud`),
  KEY `fk_Factura_Forma_Pago1_idx` (`Forma_Pago_id_forma`),
  CONSTRAINT `fk_Factura_Solicitud_Vehiculo1` FOREIGN KEY (`Solicitud_Vehiculo_id_solicitud`) REFERENCES `Solicitud_Vehiculo` (`id_solicitud`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_Forma_Pago1` FOREIGN KEY (`Forma_Pago_id_forma`) REFERENCES `Forma_Pago` (`id_forma`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Factura`
--

LOCK TABLES `Factura` WRITE;
/*!40000 ALTER TABLE `Factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `Factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Factura_Servicios`
--

DROP TABLE IF EXISTS `Factura_Servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Factura_Servicios` (
  `id_facturas` int(11) NOT NULL,
  `Plan_Servicios_id_plan` int(11) NOT NULL,
  `Comprador_Vehiculo_id_comprador` int(11) NOT NULL,
  `iva` varchar(45) DEFAULT NULL,
  `Forma_Pago_id_forma` int(11) NOT NULL,
  PRIMARY KEY (`id_facturas`),
  KEY `fk_Factura_Servicios_Plan_Servicios1_idx` (`Plan_Servicios_id_plan`),
  KEY `fk_Factura_Servicios_Comprador_Vehiculo1_idx` (`Comprador_Vehiculo_id_comprador`),
  KEY `fk_Factura_Servicios_Forma_Pago1_idx` (`Forma_Pago_id_forma`),
  CONSTRAINT `fk_Factura_Servicios_Plan_Servicios1` FOREIGN KEY (`Plan_Servicios_id_plan`) REFERENCES `Plan_Servicios` (`id_plan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_Servicios_Comprador_Vehiculo1` FOREIGN KEY (`Comprador_Vehiculo_id_comprador`) REFERENCES `Comprador_Vehiculo` (`id_comprador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_Servicios_Forma_Pago1` FOREIGN KEY (`Forma_Pago_id_forma`) REFERENCES `Forma_Pago` (`id_forma`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Factura_Servicios`
--

LOCK TABLES `Factura_Servicios` WRITE;
/*!40000 ALTER TABLE `Factura_Servicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `Factura_Servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Forma_Pago`
--

DROP TABLE IF EXISTS `Forma_Pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Forma_Pago` (
  `id_forma` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_forma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Forma_Pago`
--

LOCK TABLES `Forma_Pago` WRITE;
/*!40000 ALTER TABLE `Forma_Pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `Forma_Pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Frecuencia_Email`
--

DROP TABLE IF EXISTS `Frecuencia_Email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Frecuencia_Email` (
  `id_frecuencia_email` int(10) NOT NULL,
  `nombre` int(10) NOT NULL,
  PRIMARY KEY (`id_frecuencia_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Frecuencia_Email`
--

LOCK TABLES `Frecuencia_Email` WRITE;
/*!40000 ALTER TABLE `Frecuencia_Email` DISABLE KEYS */;
/*!40000 ALTER TABLE `Frecuencia_Email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Frecuencia_Movil`
--

DROP TABLE IF EXISTS `Frecuencia_Movil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Frecuencia_Movil` (
  `id_frecuencia_movil` int(10) NOT NULL,
  `nombre` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_frecuencia_movil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Frecuencia_Movil`
--

LOCK TABLES `Frecuencia_Movil` WRITE;
/*!40000 ALTER TABLE `Frecuencia_Movil` DISABLE KEYS */;
/*!40000 ALTER TABLE `Frecuencia_Movil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Garantia_Vehiculo`
--

DROP TABLE IF EXISTS `Garantia_Vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Garantia_Vehiculo` (
  `id_garantia` int(11) NOT NULL,
  `fecha_emision` varchar(45) DEFAULT NULL,
  `fecha_vencimiento` varchar(45) DEFAULT NULL,
  `cobertura` varchar(45) DEFAULT NULL,
  `Vehiculo_id_vehiculo` int(11) NOT NULL,
  PRIMARY KEY (`id_garantia`),
  KEY `fk_Garantia_Vehiculo1_idx` (`Vehiculo_id_vehiculo`),
  CONSTRAINT `fk_Garantia_Vehiculo1` FOREIGN KEY (`Vehiculo_id_vehiculo`) REFERENCES `Vehiculo` (`id_vehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Garantia_Vehiculo`
--

LOCK TABLES `Garantia_Vehiculo` WRITE;
/*!40000 ALTER TABLE `Garantia_Vehiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Garantia_Vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Indicador`
--

DROP TABLE IF EXISTS `Indicador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Indicador` (
  `id_indicador` int(11) NOT NULL,
  `nombre` int(10) DEFAULT NULL,
  `descripcion` int(10) DEFAULT NULL,
  `funcion` int(10) DEFAULT NULL,
  `Tipo_Indicador_id_tipo` int(11) NOT NULL,
  `Categoria_id_categoria` int(11) NOT NULL,
  PRIMARY KEY (`id_indicador`,`Tipo_Indicador_id_tipo`,`Categoria_id_categoria`),
  KEY `fk_Indicador_Tipo_Indicador1_idx` (`Tipo_Indicador_id_tipo`),
  KEY `fk_Indicador_Categoria1_idx` (`Categoria_id_categoria`),
  CONSTRAINT `fk_Indicador_Tipo_Indicador1` FOREIGN KEY (`Tipo_Indicador_id_tipo`) REFERENCES `Tipo_Indicador` (`id_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Indicador_Categoria1` FOREIGN KEY (`Categoria_id_categoria`) REFERENCES `Categoria` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Indicador`
--

LOCK TABLES `Indicador` WRITE;
/*!40000 ALTER TABLE `Indicador` DISABLE KEYS */;
/*!40000 ALTER TABLE `Indicador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Marca`
--

DROP TABLE IF EXISTS `Marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Marca` (
  `id_marca` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Marca`
--

LOCK TABLES `Marca` WRITE;
/*!40000 ALTER TABLE `Marca` DISABLE KEYS */;
/*!40000 ALTER TABLE `Marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Modelo_Caracteristicas`
--

DROP TABLE IF EXISTS `Modelo_Caracteristicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Modelo_Caracteristicas` (
  `Modelo_id_modelo` int(11) NOT NULL,
  `Caracteristicas_id_caracteristicas` int(11) NOT NULL,
  `Ensambladora_Vehiculo_id_ensambladora` int(11) NOT NULL,
  PRIMARY KEY (`Modelo_id_modelo`,`Caracteristicas_id_caracteristicas`),
  KEY `fk_Modelo_has_Caracteristicas_Caracteristicas1_idx` (`Caracteristicas_id_caracteristicas`),
  KEY `fk_Modelo_has_Caracteristicas_Modelo1_idx` (`Modelo_id_modelo`),
  KEY `fk_Modelo_Caracteristicas_Ensambladora_Vehiculo1_idx` (`Ensambladora_Vehiculo_id_ensambladora`),
  CONSTRAINT `fk_Modelo_has_Caracteristicas_Modelo1` FOREIGN KEY (`Modelo_id_modelo`) REFERENCES `Modelo_Vehiculo` (`id_modelo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Modelo_has_Caracteristicas_Caracteristicas1` FOREIGN KEY (`Caracteristicas_id_caracteristicas`) REFERENCES `Caracteristicas_Vehiculo` (`id_caracteristicas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Modelo_Caracteristicas_Ensambladora_Vehiculo1` FOREIGN KEY (`Ensambladora_Vehiculo_id_ensambladora`) REFERENCES `Ensambladora_Vehiculo` (`id_ensambladora`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Modelo_Caracteristicas`
--

LOCK TABLES `Modelo_Caracteristicas` WRITE;
/*!40000 ALTER TABLE `Modelo_Caracteristicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Modelo_Caracteristicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Modelo_Vehiculo`
--

DROP TABLE IF EXISTS `Modelo_Vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Modelo_Vehiculo` (
  `id_modelo` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `ano_m` varchar(45) DEFAULT NULL,
  `Marca_id_marca` int(11) NOT NULL,
  `Tipo_Vehiculo_id_tipo` int(11) NOT NULL,
  PRIMARY KEY (`id_modelo`),
  KEY `fk_Modelo_Marca1_idx` (`Marca_id_marca`),
  KEY `fk_Modelo_Tipo_Vehiculo1_idx` (`Tipo_Vehiculo_id_tipo`),
  CONSTRAINT `fk_Modelo_Marca1` FOREIGN KEY (`Marca_id_marca`) REFERENCES `Marca` (`id_marca`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Modelo_Tipo_Vehiculo1` FOREIGN KEY (`Tipo_Vehiculo_id_tipo`) REFERENCES `Tipo_Vehiculo` (`id_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Modelo_Vehiculo`
--

LOCK TABLES `Modelo_Vehiculo` WRITE;
/*!40000 ALTER TABLE `Modelo_Vehiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Modelo_Vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Plan_Servicios`
--

DROP TABLE IF EXISTS `Plan_Servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Plan_Servicios` (
  `id_plan` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `costo` varchar(45) DEFAULT NULL,
  `Servicios_id_servicio` int(11) NOT NULL,
  PRIMARY KEY (`id_plan`),
  KEY `fk_Plan_Servicios_Servicios1_idx` (`Servicios_id_servicio`),
  CONSTRAINT `fk_Plan_Servicios_Servicios1` FOREIGN KEY (`Servicios_id_servicio`) REFERENCES `Servicios` (`id_servicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plan_Servicios`
--

LOCK TABLES `Plan_Servicios` WRITE;
/*!40000 ALTER TABLE `Plan_Servicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `Plan_Servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Proforma`
--

DROP TABLE IF EXISTS `Proforma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Proforma` (
  `id_proforma` int(11) NOT NULL,
  `fecha` varchar(45) DEFAULT NULL,
  `validez` varchar(45) DEFAULT NULL,
  `estatus` varchar(45) DEFAULT NULL,
  `Detalle_Vehiculo_id_detalle` int(11) NOT NULL,
  `Banco_id_banco` int(11) NOT NULL,
  `Comprador_Vehiculo_id_comprador` int(11) NOT NULL,
  PRIMARY KEY (`id_proforma`),
  KEY `fk_Proforma_Detalle_Vehiculo2_idx` (`Detalle_Vehiculo_id_detalle`),
  KEY `fk_Proforma_Banco2_idx` (`Banco_id_banco`),
  KEY `fk_Proforma_Comprador_Vehiculo2_idx` (`Comprador_Vehiculo_id_comprador`),
  CONSTRAINT `fk_Proforma_Detalle_Vehiculo2` FOREIGN KEY (`Detalle_Vehiculo_id_detalle`) REFERENCES `Detalle_Vehiculo` (`id_detalle`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proforma_Banco2` FOREIGN KEY (`Banco_id_banco`) REFERENCES `Banco` (`id_banco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proforma_Comprador_Vehiculo2` FOREIGN KEY (`Comprador_Vehiculo_id_comprador`) REFERENCES `Comprador_Vehiculo` (`id_comprador`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proforma`
--

LOCK TABLES `Proforma` WRITE;
/*!40000 ALTER TABLE `Proforma` DISABLE KEYS */;
/*!40000 ALTER TABLE `Proforma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rol`
--

DROP TABLE IF EXISTS `Rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rol` (
  `id_rol` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `estatus` varchar(20) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rol`
--

LOCK TABLES `Rol` WRITE;
/*!40000 ALTER TABLE `Rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Servicios`
--

DROP TABLE IF EXISTS `Servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Servicios` (
  `id_servicio` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `costo` varchar(45) DEFAULT NULL,
  `estatus` varchar(45) DEFAULT NULL,
  `Concesionario_Vehiculo_id_concesionario` int(11) NOT NULL,
  PRIMARY KEY (`id_servicio`),
  KEY `fk_Servicios_Concesionario_Vehiculo1_idx` (`Concesionario_Vehiculo_id_concesionario`),
  CONSTRAINT `fk_Servicios_Concesionario_Vehiculo1` FOREIGN KEY (`Concesionario_Vehiculo_id_concesionario`) REFERENCES `Concesionario_Vehiculo` (`id_concesionario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Servicios`
--

LOCK TABLES `Servicios` WRITE;
/*!40000 ALTER TABLE `Servicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `Servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Solicitud_Vehiculo`
--

DROP TABLE IF EXISTS `Solicitud_Vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Solicitud_Vehiculo` (
  `id_solicitud` int(11) NOT NULL,
  `Proforma_id_proforma` int(11) NOT NULL,
  `Ensambladora_Vehiculo_id_ensambladora` int(11) NOT NULL,
  `estatus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_solicitud`),
  KEY `fk_Solicitud_Vehiculo_Proforma1_idx` (`Proforma_id_proforma`),
  KEY `fk_Solicitud_Vehiculo_Ensambladora_Vehiculo1_idx` (`Ensambladora_Vehiculo_id_ensambladora`),
  CONSTRAINT `fk_Solicitud_Vehiculo_Proforma1` FOREIGN KEY (`Proforma_id_proforma`) REFERENCES `Proforma` (`id_proforma`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Solicitud_Vehiculo_Ensambladora_Vehiculo1` FOREIGN KEY (`Ensambladora_Vehiculo_id_ensambladora`) REFERENCES `Ensambladora_Vehiculo` (`id_ensambladora`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Solicitud_Vehiculo`
--

LOCK TABLES `Solicitud_Vehiculo` WRITE;
/*!40000 ALTER TABLE `Solicitud_Vehiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Solicitud_Vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tipo_Indicador`
--

DROP TABLE IF EXISTS `Tipo_Indicador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tipo_Indicador` (
  `id_tipo` int(11) NOT NULL,
  `nombre` int(10) NOT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tipo_Indicador`
--

LOCK TABLES `Tipo_Indicador` WRITE;
/*!40000 ALTER TABLE `Tipo_Indicador` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tipo_Indicador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tipo_Vehiculo`
--

DROP TABLE IF EXISTS `Tipo_Vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tipo_Vehiculo` (
  `id_tipo` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tipo_Vehiculo`
--

LOCK TABLES `Tipo_Vehiculo` WRITE;
/*!40000 ALTER TABLE `Tipo_Vehiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tipo_Vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuarios`
--

DROP TABLE IF EXISTS `Usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuarios` (
  `id_usuario` int(11) NOT NULL,
  `password` varchar(20) NOT NULL,
  `estatus` varchar(20) NOT NULL,
  `rol_id_rol` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `fk_usuarios_rol_idx` (`rol_id_rol`),
  CONSTRAINT `fk_usuarios_rol` FOREIGN KEY (`rol_id_rol`) REFERENCES `Rol` (`id_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuarios`
--

LOCK TABLES `Usuarios` WRITE;
/*!40000 ALTER TABLE `Usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `Usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vehiculo`
--

DROP TABLE IF EXISTS `Vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vehiculo` (
  `id_vehiculo` int(11) NOT NULL,
  `matricula` varchar(45) DEFAULT NULL,
  `costo` varchar(45) DEFAULT NULL,
  `ano_fabricacion` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `serial_motor` varchar(45) DEFAULT NULL,
  `estatus` varchar(45) DEFAULT NULL,
  `Tipo_Vehiculo_id_tipo` int(11) NOT NULL,
  `Concesionario_id_concesionario` int(11) NOT NULL,
  PRIMARY KEY (`id_vehiculo`),
  KEY `fk_Vehiculo_Tipo_Vehiculo1_idx` (`Tipo_Vehiculo_id_tipo`),
  KEY `fk_Vehiculo_Concesionario1_idx` (`Concesionario_id_concesionario`),
  CONSTRAINT `fk_Vehiculo_Tipo_Vehiculo1` FOREIGN KEY (`Tipo_Vehiculo_id_tipo`) REFERENCES `Tipo_Vehiculo` (`id_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vehiculo_Concesionario1` FOREIGN KEY (`Concesionario_id_concesionario`) REFERENCES `Concesionario_Vehiculo` (`id_concesionario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vehiculo`
--

LOCK TABLES `Vehiculo` WRITE;
/*!40000 ALTER TABLE `Vehiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vehiculos_Existencia`
--

DROP TABLE IF EXISTS `Vehiculos_Existencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vehiculos_Existencia` (
  `id_stock` int(11) NOT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `Vehiculo_id_vehiculo` int(11) NOT NULL,
  PRIMARY KEY (`id_stock`),
  KEY `fk_Vehiculos_Existencia_Vehiculo1_idx` (`Vehiculo_id_vehiculo`),
  CONSTRAINT `fk_Vehiculos_Existencia_Vehiculo1` FOREIGN KEY (`Vehiculo_id_vehiculo`) REFERENCES `Vehiculo` (`id_vehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vehiculos_Existencia`
--

LOCK TABLES `Vehiculos_Existencia` WRITE;
/*!40000 ALTER TABLE `Vehiculos_Existencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `Vehiculos_Existencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_ejecutivo_desktops`
--

DROP TABLE IF EXISTS `portal_ejecutivo_desktops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_ejecutivo_desktops` (
  `id` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `vinculo` varchar(100) NOT NULL,
  `padre_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_ejecutivo_desktops`
--

LOCK TABLES `portal_ejecutivo_desktops` WRITE;
/*!40000 ALTER TABLE `portal_ejecutivo_desktops` DISABLE KEYS */;
INSERT INTO `portal_ejecutivo_desktops` VALUES (1,1,'Registrar o Modificar Nuevos Vehiculos','',0),(2,1,'Listado de Pedidos por Concesionario','',0),(3,1,'Configurar Nuevo Indicador','',4),(4,1,'Portal Ejecutivo','',0),(5,2,'Toyota','',0),(6,2,'Hyundai','',0),(7,2,'Daewood','',0),(8,2,'Chevroleth','',0),(9,2,'Ford','',0),(10,3,'Registrar Planes de Servicios','',0),(11,3,'Estado de la Proforma','',0),(12,3,'Configurar nuevo Indicador','',17),(13,3,'Portal Ejecutivo','',0),(14,3,'Lista de Espera','',0),(15,4,'Actualizar Datos Personales','',0),(16,4,'Lista de Espera','',0),(17,4,'Anular Pedido','',0),(18,4,'Catalogo Vehiculos','',0),(19,4,'Proforma','',0),(20,4,'Comprar Vehiculo','',0),(21,4,'Ford','',18),(22,4,'Fiat','',18),(23,4,'Daewood','',18),(24,4,'Toyota','',18),(25,4,'Huyndai','',18),(26,4,'Portal Ejecutivo','',0),(27,4,'Configurar Nuevo Indicador','',26),(28,5,'Registrar Marca','',0),(29,5,'Registrar Concesionario','',0),(30,5,'Registrar Ensambladora','',0),(31,5,'Lista de Espera de Pedido','',0),(32,5,'Listado de Concesionarios','',0),(33,5,'Listado de Ensambladoras','',0),(34,5,'Listado de Marcas','',0);
/*!40000 ALTER TABLE `portal_ejecutivo_desktops` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-03-05 17:58:27
