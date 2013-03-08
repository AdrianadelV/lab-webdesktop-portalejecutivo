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
-- Table structure for table `arbol`
--

DROP TABLE IF EXISTS `arbol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arbol` (
  `id` int(11) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `texto` varchar(45) DEFAULT NULL,
  `vinculo` varchar(45) DEFAULT NULL,
  `padre_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arbol`
--

LOCK TABLES `arbol` WRITE;
/*!40000 ALTER TABLE `arbol` DISABLE KEYS */;
/*!40000 ALTER TABLE `arbol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bancos`
--

DROP TABLE IF EXISTS `bancos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bancos` (
  `id_banco` varchar(20) NOT NULL,
  `rif` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_banco`),
  UNIQUE KEY `id_banco_UNIQUE` (`id_banco`)
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
-- Table structure for table `caracteristicas_vehiculos`
--

DROP TABLE IF EXISTS `caracteristicas_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caracteristicas_vehiculos` (
  `id_caracteristicas` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_caracteristicas`),
  UNIQUE KEY `id_caracteristicas_UNIQUE` (`id_caracteristicas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caracteristicas_vehiculos`
--

LOCK TABLES `caracteristicas_vehiculos` WRITE;
/*!40000 ALTER TABLE `caracteristicas_vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `caracteristicas_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre` int(10) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `id_categoria_UNIQUE` (`id_categoria`)
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
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudad` (
  `id_ciudad` varchar(20) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `c_id_estado` varchar(20) NOT NULL,
  PRIMARY KEY (`id_ciudad`),
  UNIQUE KEY `id_ciudad_UNIQUE` (`id_ciudad`),
  KEY `fk_Ciudad_Estado1_idx` (`c_id_estado`),
  CONSTRAINT `fk_Ciudad_Estado1` FOREIGN KEY (`c_id_estado`) REFERENCES `estados` (`id_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprador_vehiculos`
--

DROP TABLE IF EXISTS `comprador_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comprador_vehiculos` (
  `id_comprador` varchar(20) NOT NULL,
  `cedula` varchar(45) DEFAULT NULL,
  `nombres` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `sexo` varchar(45) DEFAULT NULL,
  `cv_id_usuario` varchar(20) NOT NULL,
  PRIMARY KEY (`id_comprador`),
  UNIQUE KEY `id_comprador_UNIQUE` (`id_comprador`),
  KEY `fk_Comprador_Vehiculo_Usuarios1_idx` (`cv_id_usuario`),
  CONSTRAINT `fk_Comprador_Vehiculo_Usuarios1` FOREIGN KEY (`cv_id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprador_vehiculos`
--

LOCK TABLES `comprador_vehiculos` WRITE;
/*!40000 ALTER TABLE `comprador_vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `comprador_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprador_vehiculos_bancos`
--

DROP TABLE IF EXISTS `comprador_vehiculos_bancos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comprador_vehiculos_bancos` (
  `cvbs_id_comprador` varchar(20) NOT NULL,
  `cvb_id_banco` varchar(20) NOT NULL,
  `cuentas` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cvbs_id_comprador`,`cvb_id_banco`),
  KEY `fk_Comprador_Vehiculo_has_Banco_Banco1_idx` (`cvb_id_banco`),
  KEY `fk_Comprador_Vehiculo_has_Banco_Comprador_Vehiculo1_idx` (`cvbs_id_comprador`),
  CONSTRAINT `fk_Comprador_Vehiculo_has_Banco_Comprador_Vehiculo1` FOREIGN KEY (`cvbs_id_comprador`) REFERENCES `comprador_vehiculos` (`id_comprador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comprador_Vehiculo_has_Banco_Banco1` FOREIGN KEY (`cvb_id_banco`) REFERENCES `bancos` (`id_banco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprador_vehiculos_bancos`
--

LOCK TABLES `comprador_vehiculos_bancos` WRITE;
/*!40000 ALTER TABLE `comprador_vehiculos_bancos` DISABLE KEYS */;
/*!40000 ALTER TABLE `comprador_vehiculos_bancos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concesionarios_vehiculos`
--

DROP TABLE IF EXISTS `concesionarios_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concesionarios_vehiculos` (
  `id_concesionario` varchar(20) NOT NULL,
  `rif` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `direccion` int(11) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `cv_id_marca` varchar(20) NOT NULL,
  `cv_id_ciudad` varchar(20) NOT NULL,
  `cv_id_usuario` varchar(20) NOT NULL,
  PRIMARY KEY (`id_concesionario`),
  UNIQUE KEY `id_concesionario_UNIQUE` (`id_concesionario`),
  KEY `fk_Concesionario_Marca1_idx` (`cv_id_marca`),
  KEY `fk_Concesionario_Usuarios1_idx` (`cv_id_usuario`),
  KEY `fk_Concesionario_Ciudad1_idx` (`cv_id_ciudad`),
  CONSTRAINT `fk_Concesionario_Marca1` FOREIGN KEY (`cv_id_marca`) REFERENCES `marcas` (`id_marca`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Concesionario_Usuarios1` FOREIGN KEY (`cv_id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Concesionario_Ciudad1` FOREIGN KEY (`cv_id_ciudad`) REFERENCES `ciudad` (`id_ciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concesionarios_vehiculos`
--

LOCK TABLES `concesionarios_vehiculos` WRITE;
/*!40000 ALTER TABLE `concesionarios_vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `concesionarios_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concesionarios_vehiculos_bancos`
--

DROP TABLE IF EXISTS `concesionarios_vehiculos_bancos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concesionarios_vehiculos_bancos` (
  `concesionarios_vehiculos_id_concesionario` varchar(20) NOT NULL,
  `bancos_id_banco` varchar(20) NOT NULL,
  PRIMARY KEY (`concesionarios_vehiculos_id_concesionario`,`bancos_id_banco`),
  UNIQUE KEY `concesionarios_vehiculos_id_concesionario_UNIQUE` (`concesionarios_vehiculos_id_concesionario`),
  KEY `fk_Concesionario_Vehiculo_has_Banco_Banco1_idx` (`bancos_id_banco`),
  KEY `fk_Concesionario_Vehiculo_has_Banco_Concesionario_Vehiculo1_idx` (`concesionarios_vehiculos_id_concesionario`),
  CONSTRAINT `fk_Concesionario_Vehiculo_has_Banco_Concesionario_Vehiculo1` FOREIGN KEY (`concesionarios_vehiculos_id_concesionario`) REFERENCES `concesionarios_vehiculos` (`id_concesionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Concesionario_Vehiculo_has_Banco_Banco1` FOREIGN KEY (`bancos_id_banco`) REFERENCES `bancos` (`id_banco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concesionarios_vehiculos_bancos`
--

LOCK TABLES `concesionarios_vehiculos_bancos` WRITE;
/*!40000 ALTER TABLE `concesionarios_vehiculos_bancos` DISABLE KEYS */;
/*!40000 ALTER TABLE `concesionarios_vehiculos_bancos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_vehiculos`
--

DROP TABLE IF EXISTS `detalle_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_vehiculos` (
  `id_detalle` varchar(20) NOT NULL,
  `dv_id_vehiculo` varchar(20) NOT NULL,
  `dv_id_modelo` varchar(20) NOT NULL,
  `dv_id_caracteristicas` int(11) NOT NULL,
  PRIMARY KEY (`id_detalle`),
  UNIQUE KEY `id_detalle_UNIQUE` (`id_detalle`),
  KEY `fk_Detalle_Vehiculo_Vehiculo1_idx` (`dv_id_vehiculo`),
  KEY `fk_Detalle_Vehiculo_Modelo_Caracteristicas1_idx` (`dv_id_modelo`,`dv_id_caracteristicas`),
  CONSTRAINT `fk_Detalle_Vehiculo_Vehiculo1` FOREIGN KEY (`dv_id_vehiculo`) REFERENCES `vehiculos` (`id_vehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalle_Vehiculo_Modelo_Caracteristicas1` FOREIGN KEY (`dv_id_modelo`, `dv_id_caracteristicas`) REFERENCES `modelo_caracteristicas` (`mc_id_modelo`, `mc_id_caracteristicas`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for table `ejecutivo_indicador`
--

DROP TABLE IF EXISTS `ejecutivo_indicador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ejecutivo_indicador` (
  `ejecutivos_id_ejecutivo` int(11) NOT NULL,
  `indicadores_id_indicador` int(11) NOT NULL,
  `valor_meta` int(10) DEFAULT NULL,
  `unidad_meta` int(10) DEFAULT NULL,
  `fecha_meta` int(10) DEFAULT NULL,
  `valor_amarillo` int(10) DEFAULT NULL,
  `valor_rojo` int(10) DEFAULT NULL,
  `valor_verde` int(10) DEFAULT NULL,
  `unidad` int(10) DEFAULT NULL,
  `ei_id_frecuencia_movil` int(10) NOT NULL,
  `ei_id_frecuencia_email` int(10) NOT NULL,
  PRIMARY KEY (`ejecutivos_id_ejecutivo`,`indicadores_id_indicador`),
  UNIQUE KEY `ejecutivos_id_ejecutivo_UNIQUE` (`ejecutivos_id_ejecutivo`),
  KEY `fk_Ejecutivo_has_Indicador_Indicador1_idx` (`indicadores_id_indicador`),
  KEY `fk_Ejecutivo_has_Indicador_Ejecutivo1_idx` (`ejecutivos_id_ejecutivo`),
  KEY `fk_Ejecutivo_Indicador_Frecuencia_Movil1_idx` (`ei_id_frecuencia_movil`),
  KEY `fk_Ejecutivo_Indicador_Frecuencia_Email1_idx` (`ei_id_frecuencia_email`),
  CONSTRAINT `fk_Ejecutivo_has_Indicador_Ejecutivo1` FOREIGN KEY (`ejecutivos_id_ejecutivo`) REFERENCES `ejecutivos` (`id_ejecutivo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ejecutivo_has_Indicador_Indicador1` FOREIGN KEY (`indicadores_id_indicador`) REFERENCES `indicador` (`id_indicador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ejecutivo_Indicador_Frecuencia_Movil1` FOREIGN KEY (`ei_id_frecuencia_movil`) REFERENCES `frecuencia_movil` (`id_frecuencia_movil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ejecutivo_Indicador_Frecuencia_Email1` FOREIGN KEY (`ei_id_frecuencia_email`) REFERENCES `frecuencia_email` (`id_frecuencia_email`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ejecutivo_indicador`
--

LOCK TABLES `ejecutivo_indicador` WRITE;
/*!40000 ALTER TABLE `ejecutivo_indicador` DISABLE KEYS */;
/*!40000 ALTER TABLE `ejecutivo_indicador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ejecutivos`
--

DROP TABLE IF EXISTS `ejecutivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ejecutivos` (
  `id_ejecutivo` int(11) NOT NULL,
  `cedula` int(10) NOT NULL,
  `nombre` int(10) NOT NULL,
  `apellido` int(10) NOT NULL,
  `telefono` int(10) NOT NULL,
  `direccion` int(10) NOT NULL,
  `correo` int(10) NOT NULL,
  `e_id_usuario` varchar(20) NOT NULL,
  PRIMARY KEY (`id_ejecutivo`),
  UNIQUE KEY `id_ejecutivo_UNIQUE` (`id_ejecutivo`),
  KEY `fk_Ejecutivo_Usuarios1_idx` (`e_id_usuario`),
  CONSTRAINT `fk_Ejecutivo_Usuarios1` FOREIGN KEY (`e_id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ejecutivos`
--

LOCK TABLES `ejecutivos` WRITE;
/*!40000 ALTER TABLE `ejecutivos` DISABLE KEYS */;
/*!40000 ALTER TABLE `ejecutivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ensambladora_vehiculos`
--

DROP TABLE IF EXISTS `ensambladora_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ensambladora_vehiculos` (
  `id_ensambladora` varchar(20) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `rif` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `ev_id_usuario` varchar(20) NOT NULL,
  `ev_id_marca` varchar(20) NOT NULL,
  `ev_id_ciudad` varchar(20) NOT NULL,
  `ensambladora_vehiculoscol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_ensambladora`),
  UNIQUE KEY `id_ensambladora_UNIQUE` (`id_ensambladora`),
  KEY `fk_Ensambladora_Vehiculo_Usuarios1_idx` (`ev_id_usuario`),
  KEY `fk_Ensambladora_Vehiculo_Marca1_idx` (`ev_id_marca`),
  KEY `fk_Ensambladora_Vehiculo_Ciudad1_idx` (`ev_id_ciudad`),
  CONSTRAINT `fk_Ensambladora_Vehiculo_Usuarios1` FOREIGN KEY (`ev_id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ensambladora_Vehiculo_Marca1` FOREIGN KEY (`ev_id_marca`) REFERENCES `marcas` (`id_marca`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ensambladora_Vehiculo_Ciudad1` FOREIGN KEY (`ev_id_ciudad`) REFERENCES `ciudad` (`id_ciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ensambladora_vehiculos`
--

LOCK TABLES `ensambladora_vehiculos` WRITE;
/*!40000 ALTER TABLE `ensambladora_vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `ensambladora_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estados` (
  `id_estado` varchar(20) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_estado`),
  UNIQUE KEY `id_estado_UNIQUE` (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_servicios`
--

DROP TABLE IF EXISTS `factura_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura_servicios` (
  `id_facturas` varchar(20) NOT NULL,
  `iva` varchar(45) DEFAULT NULL,
  `fs_id_plan` varchar(20) NOT NULL,
  `fs_id_comprador` varchar(20) NOT NULL,
  `fs_id_forma` varchar(20) NOT NULL,
  PRIMARY KEY (`id_facturas`),
  UNIQUE KEY `id_facturas_UNIQUE` (`id_facturas`),
  KEY `fk_Factura_Servicios_Plan_Servicios1_idx` (`fs_id_plan`),
  KEY `fk_Factura_Servicios_Comprador_Vehiculo1_idx` (`fs_id_comprador`),
  KEY `fk_Factura_Servicios_Forma_Pago1_idx` (`fs_id_forma`),
  CONSTRAINT `fk_Factura_Servicios_Plan_Servicios1` FOREIGN KEY (`fs_id_plan`) REFERENCES `plan_servicios` (`id_plan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_Servicios_Comprador_Vehiculo1` FOREIGN KEY (`fs_id_comprador`) REFERENCES `comprador_vehiculos` (`id_comprador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_Servicios_Forma_Pago1` FOREIGN KEY (`fs_id_forma`) REFERENCES `formas_pagos` (`id_forma`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `id_factura` varchar(20) NOT NULL,
  `fecha` varchar(45) DEFAULT NULL,
  `iva` varchar(45) DEFAULT NULL,
  `f_id_solicitud` varchar(20) NOT NULL,
  `f_id_forma` varchar(20) NOT NULL,
  PRIMARY KEY (`id_factura`),
  UNIQUE KEY `id_factura_UNIQUE` (`id_factura`),
  KEY `fk_Factura_Solicitud_Vehiculo1_idx` (`f_id_solicitud`),
  KEY `fk_Factura_Forma_Pago1_idx` (`f_id_forma`),
  CONSTRAINT `fk_Factura_Solicitud_Vehiculo1` FOREIGN KEY (`f_id_solicitud`) REFERENCES `solicitud_vehiculos` (`id_solicitud`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_Forma_Pago1` FOREIGN KEY (`f_id_forma`) REFERENCES `formas_pagos` (`id_forma`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `id_forma` varchar(20) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_forma`),
  UNIQUE KEY `id_forma_UNIQUE` (`id_forma`)
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
-- Table structure for table `frecuencia_email`
--

DROP TABLE IF EXISTS `frecuencia_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frecuencia_email` (
  `id_frecuencia_email` int(10) NOT NULL,
  `nombre` int(10) NOT NULL,
  PRIMARY KEY (`id_frecuencia_email`),
  UNIQUE KEY `id_frecuencia_email_UNIQUE` (`id_frecuencia_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frecuencia_email`
--

LOCK TABLES `frecuencia_email` WRITE;
/*!40000 ALTER TABLE `frecuencia_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `frecuencia_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frecuencia_movil`
--

DROP TABLE IF EXISTS `frecuencia_movil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frecuencia_movil` (
  `id_frecuencia_movil` int(10) NOT NULL,
  `nombre` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_frecuencia_movil`),
  UNIQUE KEY `id_frecuencia_movil_UNIQUE` (`id_frecuencia_movil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frecuencia_movil`
--

LOCK TABLES `frecuencia_movil` WRITE;
/*!40000 ALTER TABLE `frecuencia_movil` DISABLE KEYS */;
/*!40000 ALTER TABLE `frecuencia_movil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garantia_vehiculos`
--

DROP TABLE IF EXISTS `garantia_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `garantia_vehiculos` (
  `id_garantia` int(11) NOT NULL,
  `fecha_emision` varchar(45) DEFAULT NULL,
  `fecha_vencimiento` varchar(45) DEFAULT NULL,
  `cobertura` varchar(45) DEFAULT NULL,
  `gv_id_vehiculo` varchar(20) NOT NULL,
  PRIMARY KEY (`id_garantia`),
  UNIQUE KEY `id_garantia_UNIQUE` (`id_garantia`),
  KEY `fk_Garantia_Vehiculo1_idx` (`gv_id_vehiculo`),
  CONSTRAINT `fk_Garantia_Vehiculo1` FOREIGN KEY (`gv_id_vehiculo`) REFERENCES `vehiculos` (`id_vehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for table `indicador`
--

DROP TABLE IF EXISTS `indicador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indicador` (
  `id_indicador` int(11) NOT NULL,
  `nombre` int(10) DEFAULT NULL,
  `descripcion` int(10) DEFAULT NULL,
  `funcion` int(10) DEFAULT NULL,
  `tipo_indicador_id_tipo` int(11) NOT NULL,
  `categorias_id_categoria` int(11) NOT NULL,
  PRIMARY KEY (`id_indicador`,`tipo_indicador_id_tipo`,`categorias_id_categoria`),
  UNIQUE KEY `id_indicador_UNIQUE` (`id_indicador`),
  KEY `fk_Indicador_Tipo_Indicador1_idx` (`tipo_indicador_id_tipo`),
  KEY `fk_Indicador_Categoria1_idx` (`categorias_id_categoria`),
  CONSTRAINT `fk_Indicador_Tipo_Indicador1` FOREIGN KEY (`tipo_indicador_id_tipo`) REFERENCES `tipo_indicador` (`id_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Indicador_Categoria1` FOREIGN KEY (`categorias_id_categoria`) REFERENCES `categorias` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indicador`
--

LOCK TABLES `indicador` WRITE;
/*!40000 ALTER TABLE `indicador` DISABLE KEYS */;
/*!40000 ALTER TABLE `indicador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marcas` (
  `id_marca` varchar(20) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo_caracteristicas`
--

DROP TABLE IF EXISTS `modelo_caracteristicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modelo_caracteristicas` (
  `mc_id_modelo` varchar(20) NOT NULL,
  `mc_id_caracteristicas` int(11) NOT NULL,
  `mc_id_ensambladora` varchar(20) NOT NULL,
  `modelo_caracteristicascol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`mc_id_modelo`,`mc_id_caracteristicas`,`mc_id_ensambladora`),
  UNIQUE KEY `mc_id_modelo_UNIQUE` (`mc_id_modelo`),
  UNIQUE KEY `mc_id_caracteristicas_UNIQUE` (`mc_id_caracteristicas`),
  KEY `fk_Modelo_has_Caracteristicas_Caracteristicas1_idx` (`mc_id_caracteristicas`),
  KEY `fk_Modelo_has_Caracteristicas_Modelo1_idx` (`mc_id_modelo`),
  KEY `fk_Modelo_Caracteristicas_Ensambladora_Vehiculo1_idx` (`mc_id_ensambladora`),
  CONSTRAINT `fk_Modelo_has_Caracteristicas_Modelo1` FOREIGN KEY (`mc_id_modelo`) REFERENCES `modelo_vehiculos` (`id_modelo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Modelo_has_Caracteristicas_Caracteristicas1` FOREIGN KEY (`mc_id_caracteristicas`) REFERENCES `caracteristicas_vehiculos` (`id_caracteristicas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Modelo_Caracteristicas_Ensambladora_Vehiculo1` FOREIGN KEY (`mc_id_ensambladora`) REFERENCES `ensambladora_vehiculos` (`id_ensambladora`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `id_modelo` varchar(20) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `ano_m` varchar(45) DEFAULT NULL,
  `mv_id_marca` varchar(20) NOT NULL,
  `mv_vehiculos_id_tipo` varchar(20) NOT NULL,
  PRIMARY KEY (`id_modelo`),
  UNIQUE KEY `id_modelo_UNIQUE` (`id_modelo`),
  KEY `fk_Modelo_Marca1_idx` (`mv_id_marca`),
  KEY `fk_Modelo_Tipo_Vehiculo1_idx` (`mv_vehiculos_id_tipo`),
  CONSTRAINT `fk_Modelo_Marca1` FOREIGN KEY (`mv_id_marca`) REFERENCES `marcas` (`id_marca`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Modelo_Tipo_Vehiculo1` FOREIGN KEY (`mv_vehiculos_id_tipo`) REFERENCES `tipo_vehiculos` (`id_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo_vehiculos`
--

LOCK TABLES `modelo_vehiculos` WRITE;
/*!40000 ALTER TABLE `modelo_vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `modelo_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_servicios`
--

DROP TABLE IF EXISTS `plan_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_servicios` (
  `id_plan` varchar(20) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `costo` varchar(45) DEFAULT NULL,
  `ps_id_servicio` varchar(20) NOT NULL,
  PRIMARY KEY (`id_plan`),
  UNIQUE KEY `id_plan_UNIQUE` (`id_plan`),
  KEY `fk_Plan_Servicios_Servicios1_idx` (`ps_id_servicio`),
  CONSTRAINT `fk_Plan_Servicios_Servicios1` FOREIGN KEY (`ps_id_servicio`) REFERENCES `servicios` (`id_servicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
INSERT INTO `portal_ejecutivo_desktops` VALUES (1,1,'Registrar o Modificar Nuevos Vehiculos','',0),(2,1,'Listado de Pedidos por Concesionario','',0),(3,1,'Configurar Nuevo Indicador','',4),(4,1,'Portal Ejecutivo','',0),(10,3,'Registrar Planes de Servicios','',0),(11,3,'Estado de la Proforma','',0),(12,3,'Configurar nuevo Indicador','',13),(13,3,'Portal Ejecutivo','',0),(14,3,'Lista de Espera','',0),(15,4,'Actualizar Datos Personales','',0),(16,4,'Lista de Espera','',0),(17,4,'Anular Pedido','',0),(18,4,'Catalogo Vehiculos','',0),(19,4,'Proforma','',0),(20,4,'Comprar Vehiculo','',0),(21,4,'Ford','',18),(22,4,'Fiat','',18),(23,4,'Daewood','',18),(24,4,'Toyota','',18),(25,4,'Huyndai','',18),(26,4,'Portal Ejecutivo','',0),(27,4,'Configurar Nuevo Indicador','',26),(28,5,'Registrar Marca','',0),(29,5,'Registrar Concesionario','',0),(30,5,'Registrar Ensambladora','',0),(31,5,'Lista de Espera de Pedido','',0),(32,5,'Listado de Concesionarios','',0),(33,5,'Listado de Ensambladoras','',0),(34,5,'Listado de Marcas','',0);
/*!40000 ALTER TABLE `portal_ejecutivo_desktops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proformas`
--

DROP TABLE IF EXISTS `proformas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proformas` (
  `id_proforma` varchar(20) NOT NULL,
  `fecha` varchar(45) DEFAULT NULL,
  `validez` varchar(45) DEFAULT NULL,
  `estatus` varchar(45) DEFAULT NULL,
  `p_id_detalle` varchar(20) NOT NULL,
  `p_id_banco` varchar(20) NOT NULL,
  `p_id_comprador` varchar(20) NOT NULL,
  PRIMARY KEY (`id_proforma`),
  UNIQUE KEY `id_proforma_UNIQUE` (`id_proforma`),
  KEY `fk_Proforma_Detalle_Vehiculo2_idx` (`p_id_detalle`),
  KEY `fk_Proforma_Banco2_idx` (`p_id_banco`),
  KEY `fk_Proforma_Comprador_Vehiculo2_idx` (`p_id_comprador`),
  CONSTRAINT `fk_Proforma_Detalle_Vehiculo2` FOREIGN KEY (`p_id_detalle`) REFERENCES `detalle_vehiculos` (`id_detalle`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proforma_Banco2` FOREIGN KEY (`p_id_banco`) REFERENCES `bancos` (`id_banco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proforma_Comprador_Vehiculo2` FOREIGN KEY (`p_id_comprador`) REFERENCES `comprador_vehiculos` (`id_comprador`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `id_rol` varchar(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `estatus` varchar(20) NOT NULL,
  PRIMARY KEY (`id_rol`),
  UNIQUE KEY `id_rol_UNIQUE` (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicios` (
  `id_servicio` varchar(20) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `costo` varchar(45) DEFAULT NULL,
  `estatus` varchar(45) DEFAULT NULL,
  `s_id_concesionario` varchar(20) NOT NULL,
  PRIMARY KEY (`id_servicio`),
  UNIQUE KEY `id_servicio_UNIQUE` (`id_servicio`),
  KEY `fk_Servicios_Concesionario_Vehiculo1_idx` (`s_id_concesionario`),
  CONSTRAINT `fk_Servicios_Concesionario_Vehiculo1` FOREIGN KEY (`s_id_concesionario`) REFERENCES `concesionarios_vehiculos` (`id_concesionario`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `id_solicitud` varchar(20) NOT NULL,
  `proformas_id_proforma` varchar(20) NOT NULL,
  `ensambladora_vehiculos_id_ensambladora` varchar(20) NOT NULL,
  `estatus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_solicitud`),
  KEY `fk_Solicitud_Vehiculo_Proforma1_idx` (`proformas_id_proforma`),
  KEY `fk_Solicitud_Vehiculo_Ensambladora_Vehiculo1_idx` (`ensambladora_vehiculos_id_ensambladora`),
  CONSTRAINT `fk_Solicitud_Vehiculo_Proforma1` FOREIGN KEY (`proformas_id_proforma`) REFERENCES `proformas` (`id_proforma`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Solicitud_Vehiculo_Ensambladora_Vehiculo1` FOREIGN KEY (`ensambladora_vehiculos_id_ensambladora`) REFERENCES `ensambladora_vehiculos` (`id_ensambladora`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for table `tipo_indicador`
--

DROP TABLE IF EXISTS `tipo_indicador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_indicador` (
  `id_tipo` int(11) NOT NULL,
  `nombre` int(10) NOT NULL,
  PRIMARY KEY (`id_tipo`),
  UNIQUE KEY `id_tipo_UNIQUE` (`id_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_indicador`
--

LOCK TABLES `tipo_indicador` WRITE;
/*!40000 ALTER TABLE `tipo_indicador` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_indicador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_vehiculos`
--

DROP TABLE IF EXISTS `tipo_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_vehiculos` (
  `id_tipo` varchar(20) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_tipo`),
  UNIQUE KEY `id_tipo_UNIQUE` (`id_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_vehiculos`
--

LOCK TABLES `tipo_vehiculos` WRITE;
/*!40000 ALTER TABLE `tipo_vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id_usuario` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `estatus` varchar(20) NOT NULL,
  `imagen` varchar(45) DEFAULT NULL,
  `u_id_rol` varchar(20) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `id_usuario_UNIQUE` (`id_usuario`),
  KEY `fk_usuarios_rol_idx` (`u_id_rol`),
  CONSTRAINT `fk_usuarios_rol` FOREIGN KEY (`u_id_rol`) REFERENCES `rol` (`id_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculos`
--

DROP TABLE IF EXISTS `vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehiculos` (
  `id_vehiculo` varchar(20) NOT NULL,
  `matricula` varchar(45) DEFAULT NULL,
  `costo` varchar(45) DEFAULT NULL,
  `ano_fabricacion` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `serial_motor` varchar(45) DEFAULT NULL,
  `estatus` varchar(45) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `v_id_tipo` varchar(20) NOT NULL,
  `v_id_concesionario` varchar(20) NOT NULL,
  PRIMARY KEY (`id_vehiculo`),
  UNIQUE KEY `id_vehiculo_UNIQUE` (`id_vehiculo`),
  KEY `fk_Vehiculo_Tipo_Vehiculo1_idx` (`v_id_tipo`),
  KEY `fk_Vehiculo_Concesionario1_idx` (`v_id_concesionario`),
  CONSTRAINT `fk_Vehiculo_Tipo_Vehiculo1` FOREIGN KEY (`v_id_tipo`) REFERENCES `tipo_vehiculos` (`id_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vehiculo_Concesionario1` FOREIGN KEY (`v_id_concesionario`) REFERENCES `concesionarios_vehiculos` (`id_concesionario`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for table `vehiculos_existencias`
--

DROP TABLE IF EXISTS `vehiculos_existencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehiculos_existencias` (
  `id_stock` varchar(20) NOT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `ve_id_vehiculo` varchar(20) NOT NULL,
  PRIMARY KEY (`id_stock`),
  UNIQUE KEY `id_stock_UNIQUE` (`id_stock`),
  KEY `fk_Vehiculos_Existencia_Vehiculo1_idx` (`ve_id_vehiculo`),
  CONSTRAINT `fk_Vehiculos_Existencia_Vehiculo1` FOREIGN KEY (`ve_id_vehiculo`) REFERENCES `vehiculos` (`id_vehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculos_existencias`
--

LOCK TABLES `vehiculos_existencias` WRITE;
/*!40000 ALTER TABLE `vehiculos_existencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehiculos_existencias` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-03-08 11:03:09
