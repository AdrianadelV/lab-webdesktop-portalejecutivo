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
INSERT INTO `arbols` VALUES (1,1,'Registrar o Modificar Nuevos Vehiculos','',0),(2,1,'Listado de Pedidos por Concesionario','',0),(3,1,'Configurar Nuevo Indicador','',4),(4,1,'Portal Ejecutivo','',0),(10,3,'Registrar Planes de Servicios','',0),(12,3,'Portal Ejecutivo','',0),(13,3,'Configurar nuevo Indicador','',12),(14,3,'Lista de Espera','',0),(16,4,'Lista de Espera','',0),(17,4,'Anular Pedido','',0),(18,4,'Galeria','',0),(19,4,'Proforma','',0),(20,4,'Comprar Vehiculo','',0),(28,5,'Registrar Marca','',0),(29,5,'Registrar Concesionario','',0),(30,5,'Registrar Ensambladora','',0),(31,5,'Lista de Espera de Pedido','',0),(32,5,'Listado de Concesionarios','',0),(33,5,'Listado de Ensambladoras','',0),(34,5,'Listado de Marcas','',0),(35,1,'Registrar Modelo de Vehiculo',NULL,0),(36,1,'Registrar Caracteristica de un Modelo','',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bancos`
--

LOCK TABLES `bancos` WRITE;
/*!40000 ALTER TABLE `bancos` DISABLE KEYS */;
INSERT INTO `bancos` VALUES (1,'J-111','Banco de Venezuela','CALL 1 CARRERA 2','0251-2330981'),(2,'J-000','Banesco','CALL 1 CARRERA 2','0251-2330981'),(3,'J-222','BBVA Banco Provincial','CALL 1 CARRERA 2','0251-2330981'),(4,'J-333','Banco Mercantil','CALL 1 CARRERA 2','0251-2330981'),(5,'J-444','Bicentenario Banco Universal','CALL 1 CARRERA 2','0251-2330981'),(6,'J-555','Banco Occidental de Descuento BOD','CALL 1 CARRERA 2','0251-2330981'),(7,'J-666','BanCaribe','CALL 1 CARRERA 2','0251-2330981'),(8,'J-777','Banco Exterior','CALL 1 CARRERA 2','0251-2330981'),(9,'J-888','Banco del Tesoro','CALL 1 CARRERA 2','0251-2330981'),(10,'J-999','Banco Industrial de Venezuela','CALL 1 CARRERA 2','0251-2330981'),(11,'J-123','Banco Nacional de CrÃÂ©dito BNC','CALL 1 CARRERA 2','0251-2330981'),(12,'J-234','Corp Banca BOD','CALL 1 CARRERA 2','0251-2330981');
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
  `nro_cuentas` varchar(45) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudads`
--

LOCK TABLES `ciudads` WRITE;
/*!40000 ALTER TABLE `ciudads` DISABLE KEYS */;
INSERT INTO `ciudads` VALUES (1,'Caracas',10),(2,'Maracaibo',24),(3,'Valencia',7),(4,'Barquisimeto',13),(5,'Maracay',4),(6,'Petare',15),(7,'Turmero',4),(8,'Ciudad BolÃÂ­var',6),(9,'Barinas',5),(10,'Santa Teresa del Tuy',15),(11,'CumanÃÂ¡',19),(12,'San CristÃÂ³bal',20),(13,'Baruta',15),(14,'Puerto la Cruz',2),(15,'MÃÂ©rida',14),(16,'Cabimas',24),(17,'Coro',11),(18,'Guatire',15),(19,'Barcelona',2),(20,'Valera',21),(21,'Guarenas',15),(22,'Los Teques',15),(23,'Ocumare del Tuy',15),(24,'Puerto Cabello',7),(25,'Guacara',7),(26,'El Tigre',2),(27,'El LimÃÂ³n',4),(28,'Acarigua',18),(29,'Punto Fijo',11),(30,'Cabudare',13),(31,'Charallave',15),(32,'Palo Negro',4),(33,'Cagua',4),(34,'Anaco',2),(35,'Calabozo',12),(36,'Guanare',18),(37,'Ejido',14),(38,'Catia La Mar',22),(39,'Mariara',7);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprador_vehiculos`
--

LOCK TABLES `comprador_vehiculos` WRITE;
/*!40000 ALTER TABLE `comprador_vehiculos` DISABLE KEYS */;
INSERT INTO `comprador_vehiculos` VALUES (1,'19897522','maria','paez','0123-12345','callex_con_carrera_x','mandnd@gndhj.com','1990-01-24','Femenino',1),(2,'19000000','raul','castro','0123-12345','callex_con_carrera_x','qwe@qwe.com','1988-03-29','Masculino',40),(3,'18784563','fernando','colmenarez','0123-12345','callex_con_carrera_x','qwe@qwe.com','1985-04-05','Masculino',41),(4,'19879402','adriana','santana','0123-12345','callex_con_carrera_x','qwe@qwe.com','1989-06-07','Femenino',42),(5,'20016822','jose','galindez','0123-12345','callex_con_carrera_x','qwe@qwe.com','1989-05-05','Masculino',43),(6,'5768984','laura','vera','0123-12345','callex_con_carrera_x','qwe@qwe.com','1957-07-08','Femenino',35),(7,'6000234','guillermo','torrez','0123-12345','callex_con_carrera_x','qwe@qwe.com','1963-08-09','Masculino',36),(8,'8123765','pedro','perez','0123-12345','callex_con_carrera_x','qwe@qwe.com','1970-09-10','Masculino',37),(9,'12678522','alicia','machado','0123-12345','callex_con_carrera_x','qwe@qwe.com','1976-10-11','Femenino',38),(10,'16345121','miguel','crespo','0123-12345','callex_con_carrera_x','qwe@qwe.com','1982-11-12','Masculino',39);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concesionario_vehiculos`
--

LOCK TABLES `concesionario_vehiculos` WRITE;
/*!40000 ALTER TABLE `concesionario_vehiculos` DISABLE KEYS */;
INSERT INTO `concesionario_vehiculos` VALUES (1,'J-123','Hermanostoyota','QWE','0251-2330981|','Hermanostoyota@gmail.com','1','18',7,17,1),(2,'J-543','Alaventatoyota','QWE','0251-2330981|','Alaventatoyota@gmail.com','2','17',8,18,1),(3,'J-345','Cooperativatoyota','QWE','0251-2330981|','Cooperativatoyota@gmail.com','3','16',9,19,1),(4,'J-098','Hermanoshyunday','QWE','0251-2330981|','Hermanoshyunday@gmail.com','4','15',10,20,2),(5,'J-567','Alaventahyunday','QWE','0251-2330981|','Alaventahyunday@gmail.com','5','14',11,21,2),(6,'J-234','Cooperativahyunday','QWE','0251-2330981|','Cooperativahyunday@gmail.com','6','13',12,22,2),(7,'J-675','Hermanosford','QWE','0251-2330981|','Hermanosford@gmail.com ','7','12',13,23,3),(8,'J-111','Alaventaford','QWE','0251-2330981|','Alaventaford@gmail.com','8','11',14,24,3),(9,'J-222','Cooperativaford','QWE','0251-2330981|','Cooperativaford@gmail.com ','9','10',15,25,3),(10,'J-333','Hermanoschevrolet','QWE','0251-2330981|','Hermanoschevrolet@gmail.com ','10','9',16,26,4),(11,'J-444','Alaventachevrolet','QWE','0251-2330981|','Alaventachevrolet@gmail.com','11','8',17,27,4),(12,'J-555','Cooperativachevrolet','QWE','0251-2330981|','Cooperativachevrolet@gmail.com','12','7',18,28,4),(13,'J-666','Hermanosjeep','QWE','0251-2330981|','Hermanosjeep@gmail.com','13','6',19,29,5),(14,'J-777','Alaventajeep','QWE','0251-2330981|','Alaventajeep@gmail.com','14','5',20,30,5),(15,'J-888','Cooperativajeep','QWE','0251-2330981|','Cooperativajeep@gmail.com ','15','4',21,31,5),(16,'J-999','Hermanosferrari','QWE','0251-2330981|','Hermanosferrari@gmail.com','16','3',22,32,6),(17,'J-000','Alaventaferrari','QWE','0251-2330981|','Alaventaferrari@gmail.com','17','2',23,33,6),(18,'J-0987','Cooperativaferrari','QWE','0251-2330981|','Cooperativaferrari@gmail.com ','18','1',24,34,6);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_vehiculos`
--

LOCK TABLES `detalle_vehiculos` WRITE;
/*!40000 ALTER TABLE `detalle_vehiculos` DISABLE KEYS */;
INSERT INTO `detalle_vehiculos` VALUES (1,1,6,9,4),(2,2,7,10,5),(3,3,8,9,6),(4,4,6,10,7),(5,3,7,9,8),(6,4,8,10,9),(7,5,6,9,10),(8,1,7,10,11),(9,2,8,9,12),(10,3,6,10,13),(11,2,7,10,4),(12,3,8,9,5),(13,4,6,10,6),(14,5,7,9,7),(15,4,8,10,8),(16,5,6,9,9),(17,1,7,10,10),(18,2,8,9,11),(19,3,6,10,12),(20,4,7,9,13);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ensambladora_vehiculos`
--

LOCK TABLES `ensambladora_vehiculos` WRITE;
/*!40000 ALTER TABLE `ensambladora_vehiculos` DISABLE KEYS */;
INSERT INTO `ensambladora_vehiculos` VALUES (1,'Ensatoyota','J-1234','qweqwe','0251-2330981','Ensatoyota@gmail.com',1,11,1),(2,'Ensahyunday','J-2345','qweqwe','0251-2330981','Ensahyunday@gmail.com',2,12,2),(3,'Ensaford','J-3456','qwe','0251-2330981','Ensaford@gmail.com',3,13,3),(4,'Ensachevrolet','J-4567','qweqwe','0251-2330981','Ensachevrolet@gmail.com',4,14,4),(5,'Ensajeep','J-5678','qweqwe','0251-2330981','Ensajeep@gmail.com',5,15,5),(6,'Ensaferrari','J-6789','qwe','0251-2330981','Ensaferrari@gmail.com',6,16,6);
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'Amazonas'),(2,'AnzoÃÂ¡tegui'),(3,'Apure'),(4,'Aragua'),(5,'Barinas'),(6,'BolÃÂ­var'),(7,'Carabobo'),(8,'Cojedes'),(9,'Delta Amacuro'),(10,'Distrito Capital'),(11,'FalcÃÂ³n'),(12,'GuÃÂ¡rico'),(13,'Lara'),(14,'MÃÂ©rida'),(15,'Miranda'),(16,'Monagas'),(17,'Nueva Esparta'),(18,'Portuguesa'),(19,'Sucre'),(20,'Tachira'),(21,'Trujillo'),(22,'Vargas'),(23,'Yaracuy'),(24,'Zulia');
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
  KEY `fk_facturas_solicitud_vehiculos1_idx` (`solicitud_vehiculos_id`),
  KEY `fk_facturas_vehiculos1_idx` (`vehiculos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` VALUES (1,'2013-03-30',1,0.12,400000,440000,1),(2,'2013-03-30',2,0.12,500000,550000,2),(3,'2013-03-30',3,0.12,600000,660000,3),(4,'2013-03-30',4,0.12,700000,770000,4),(5,'2013-03-30',5,0.12,800000,880000,5),(6,'2013-03-30',6,0.12,400000,440000,6),(7,'2013-03-30',7,0.12,500000,550000,7),(8,'2013-03-30',8,0.12,600000,660000,8),(9,'2013-03-30',9,0.12,700000,770000,9),(10,'2013-03-30',10,0.12,800000,880000,10),(11,'2013-03-30',11,0.12,400000,440000,13),(12,'2013-03-30',12,0.12,500000,550000,14),(13,'2013-03-30',13,0.12,600000,660000,15),(14,'2013-03-30',14,0.12,700000,770000,16),(15,'2013-03-30',15,0.12,800000,880000,17),(16,'2013-03-30',16,0.12,400000,440000,18),(17,'2013-03-30',17,0.12,500000,550000,19),(18,'2013-03-30',18,0.12,600000,660000,20),(19,'2013-03-30',19,0.12,700000,770000,21),(20,'2013-03-30',20,0.12,800000,880000,22);
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
INSERT INTO `indicadors` VALUES (1,'Vehiculos vendidos','Representa el total de vehiculos vendidos',0),(2,'Vehiculos vendidos a hombres','Numero de vehiculos vendidos a el sexo masculino',0),(3,'Vehiculos vendidos a mujeres','Numero de vehiculos vendidos a el sexo femenino',0),(4,'Vehiculos vendidos-concesionario','Representa el total de vehiculos vendidos',0),(5,'Vehiculos vendidos a hombres-concesionario','Numero de vehiculos vendidos a el sexo masculino',0),(6,'Vehiculos vendidos a mujeres-concesionario','Numero de vehiculos vendidos a el sexo femenino',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'Toyota',NULL,'Ofrecer la mejor seguridad y confort en cualquiera de nuestro vehiculos.',NULL,'Ser los mejores y los mas eficientes en la rama. ','Escuchar y respetar siempre las necesidades del cliente y trabajar en funcion de elllo.','http://www.toyota.com.ve/'),(2,'Hyunday',NULL,'Ofrecer la mejor seguridad y confort en cualquiera de nuestro vehiculos.',NULL,'Ser los mejores y los mas eficientes en la rama.','Escuchar y respetar siempre las necesidades del cliente y trabajar en funcion de elllo.','http://www.hyunday-motor.ve/'),(3,'Ford',NULL,'Ofrecer la mejor seguridad y confort en cualquiera de nuestro vehiculos.',NULL,'Ser los mejores y los mas eficientes en la rama.','Escuchar y respetar siempre las necesidades del cliente y trabajar en funcion de elllo.','http://www.ford.com.ve/'),(4,'Chevrolet',NULL,'Ofrecer la mejor seguridad y confort en cualquiera de nuestro vehiculos.',NULL,'Ser los mejores y los mas eficientes en la rama.','Escuchar y respetar siempre las necesidades del cliente y trabajar en funcion de elllo.','http://www.chevrolet.com.ve/default.html'),(5,'Jeep',NULL,'Ofrecer la mejor seguridad y confort en cualquiera de nuestro vehiculos.',NULL,'Ser los mejores y los mas eficientes en la rama.','Escuchar y respetar siempre las necesidades del cliente y trabajar en funcion de elllo.','http://www.jeep.com.ve/'),(6,'Ferrari',NULL,'Ofrecer la mejor seguridad y confort en cualquiera de nuestro vehiculos.',NULL,'Ser los mejores y los mas eficientes en la rama.','Escuchar y respetar siempre las necesidades del cliente y trabajar en funcion de elllo.','http://www.ferrari.com/Spanish/Pages/home.aspx');
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
INSERT INTO `modelo_caracteristicas` VALUES (1,4,1),(6,4,1),(9,4,1),(2,5,1),(7,5,1),(10,5,1),(3,6,2),(8,6,2),(9,6,2),(4,7,2),(6,7,2),(10,7,2),(3,8,3),(7,8,3),(9,8,3),(4,9,3),(8,9,3),(10,9,3),(5,10,4),(6,10,4),(9,10,4),(1,11,4),(7,11,4),(10,11,4),(2,12,5),(8,12,5),(9,12,5),(3,13,5),(6,13,5),(10,13,5),(4,14,6),(7,14,6),(9,14,6),(5,15,6),(8,15,6),(10,15,6),(2,4,1),(7,4,1),(10,4,1),(3,5,1),(8,5,1),(9,5,1),(4,6,2),(6,6,2),(10,6,2),(5,7,2),(7,7,2),(9,7,2),(4,8,3),(8,8,3),(10,8,3),(5,9,3),(6,9,3),(9,9,3),(1,10,4),(7,10,4),(10,10,4),(2,11,4),(8,11,4),(9,11,4),(3,12,5),(6,12,5),(10,12,5),(4,13,5),(7,13,5),(9,13,5),(5,14,6),(8,14,6),(10,14,6),(1,15,6),(6,15,6),(9,15,6);
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo_vehiculos`
--

LOCK TABLES `modelo_vehiculos` WRITE;
/*!40000 ALTER TABLE `modelo_vehiculos` DISABLE KEYS */;
INSERT INTO `modelo_vehiculos` VALUES (2,'qwer bnm','2007',4,2,NULL,NULL,NULL,NULL),(3,'chevrolet 4x4 ','2009',4,1,NULL,NULL,NULL,NULL),(4,'Corolla','2012',1,3,NULL,NULL,NULL,NULL),(5,'Fortune','2013',1,1,NULL,NULL,NULL,NULL),(6,'Accent','2012',2,3,NULL,NULL,NULL,NULL),(7,'i30 wagon','2013',2,3,NULL,NULL,NULL,NULL),(8,'Explorer','2013',3,1,NULL,NULL,NULL,NULL),(9,'taurus','2013',3,3,NULL,NULL,NULL,NULL),(10,'Camaro coupe','2013',4,4,NULL,NULL,NULL,NULL),(11,'Traverse','2013',4,1,NULL,NULL,NULL,NULL),(12,'Gran cherokke','2012',5,1,NULL,NULL,NULL,NULL),(13,'Patriot','2013',5,1,NULL,NULL,NULL,NULL),(15,'GT knight','2013',6,4,NULL,NULL,NULL,NULL),(16,'RX phanton','2013',6,4,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proformas`
--

LOCK TABLES `proformas` WRITE;
/*!40000 ALTER TABLE `proformas` DISABLE KEYS */;
INSERT INTO `proformas` VALUES (1,'2013-03-01 00:00:00','2013-03-03 00:00:00','Espera',1,1,1,0,1),(2,'2013-03-02 00:00:00','2013-03-04 00:00:00','Espera',2,2,2,0,2),(3,'2013-03-03 00:00:00','2013-03-05 00:00:00','Espera',3,3,4,0,3),(4,'2013-03-04 00:00:00','2013-03-06 00:00:00','Espera',4,4,5,0,4),(5,'2013-03-05 00:00:00','2013-03-07 00:00:00','Espera',5,5,7,0,5),(6,'2013-03-06 00:00:00','2013-03-08 00:00:00','Espera',6,6,8,0,6),(7,'2013-03-07 00:00:00','2013-03-09 00:00:00','Espera',7,7,10,0,7),(8,'2013-03-08 00:00:00','2013-03-10 00:00:00','Espera',8,8,11,0,8),(9,'2013-03-09 00:00:00','2013-03-11 00:00:00','Espera',9,9,13,0,9),(10,'2013-03-10 00:00:00','2013-03-12 00:00:00','Espera',10,10,14,0,10),(11,'2013-03-11 00:00:00','2013-03-13 00:00:00','Espera',10,10,2,0,11),(12,'2013-03-12 00:00:00','2013-03-14 00:00:00','Espera',9,9,3,0,12),(13,'2013-03-13 00:00:00','2013-03-15 00:00:00','Espera',8,8,5,0,13),(14,'2013-03-14 00:00:00','2013-03-16 00:00:00','Espera',7,7,6,0,14),(15,'2013-03-15 00:00:00','2013-03-17 00:00:00','Espera',6,6,8,0,15),(16,'2013-03-16 00:00:00','2013-03-18 00:00:00','Espera',5,5,9,0,16),(17,'2013-03-17 00:00:00','2013-03-19 00:00:00','Espera',4,4,11,0,17),(18,'2013-03-18 00:00:00','2013-03-20 00:00:00','Espera',3,3,12,0,18),(19,'2013-03-19 00:00:00','2013-03-21 00:00:00','Espera',2,2,14,0,19),(20,'2013-03-20 00:00:00','2013-03-22 00:00:00','Espera',1,1,15,0,20);
/*!40000 ALTER TABLE `proformas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsables`
--

DROP TABLE IF EXISTS `responsables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `responsables` (
  `id_responsable` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_responsable`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsables`
--

LOCK TABLES `responsables` WRITE;
/*!40000 ALTER TABLE `responsables` DISABLE KEYS */;
INSERT INTO `responsables` VALUES (1,'Gerente Alam Bravo','jmgv1989@gmail.com','04149739510'),(2,'Contador Luis Perez','arturojose3@hotmail.com','04149739510'),(3,'ING. Raul Pietro','jmgv1989@hotmail.es','04269598401'),(4,'ING. Jesus Sanchez ','jmgv1989@gmail.com','04269598401');
/*!40000 ALTER TABLE `responsables` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud_vehiculos`
--

LOCK TABLES `solicitud_vehiculos` WRITE;
/*!40000 ALTER TABLE `solicitud_vehiculos` DISABLE KEYS */;
INSERT INTO `solicitud_vehiculos` VALUES (1,1,1,'Activo'),(2,2,1,'Activo'),(3,3,2,'Activo'),(4,4,2,'Activo'),(5,5,3,'Activo'),(6,6,3,'Activo'),(7,7,4,'Activo'),(8,8,4,'Activo'),(9,9,5,'Activo'),(10,10,5,'Activo'),(11,11,1,'Activo'),(12,12,1,'Activo'),(13,13,2,'Activo'),(14,14,2,'Activo'),(15,15,3,'Activo'),(16,16,3,'Activo'),(17,17,4,'Activo'),(18,18,4,'Activo'),(19,19,5,'Activo'),(20,20,5,'Activo');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_vehiculos`
--

LOCK TABLES `tipo_vehiculos` WRITE;
/*!40000 ALTER TABLE `tipo_vehiculos` DISABLE KEYS */;
INSERT INTO `tipo_vehiculos` VALUES (1,'Camioneta'),(2,'Camion'),(3,'Carro'),(4,'Deportivo'),(5,'Familiar');
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'AdrianaS','1234','a',NULL,NULL,1),(2,'Fernando','1234','a',NULL,NULL,4),(3,'Jose','1234','a',NULL,NULL,2),(4,'Maria','1234','a',NULL,NULL,3),(5,'adriana','1234','a',NULL,NULL,2),(6,'ConcesionarioToyota_Pedro','1234','a',NULL,NULL,2),(9,'concesionarioDaewood_Jose','1234','a',NULL,NULL,2),(10,'Ensambladorachevrolet_Pedro','1234','a',NULL,NULL,3),(11,'ensatoyota123','1234','a',NULL,NULL,3),(12,'ensahyunday123','1234','a',NULL,NULL,3),(13,'ensaford123','1234','a',NULL,NULL,3),(14,'ensachevrolet123','1234','a',NULL,'',3),(15,'ensajeep123','1234','a',NULL,NULL,3),(16,'ensaferrari123','1234','a',NULL,NULL,3),(17,'Hermanostoyota123','1234','a',NULL,NULL,2),(18,'Alaventatoyota123','1234','a',NULL,NULL,2),(19,'Cooperativatoyota123','1234','a',NULL,NULL,2),(20,'Hermanoshyunday123','1234','a',NULL,NULL,2),(21,'Alaventahyunday123','1234','a',NULL,NULL,2),(22,'Cooperativahyunday123','1234','a',NULL,NULL,2),(23,'Hermanosford123','1234','a',NULL,NULL,2),(24,'Alaventaford123','1234','a',NULL,NULL,2),(25,'Cooperativaford123','1234','a',NULL,NULL,2),(26,'Hermanoschevrolet123','1234','a',NULL,NULL,2),(27,'Alaventachevrolet123','1234','a',NULL,NULL,2),(28,'Cooperativachevrolet123','1234','a',NULL,NULL,2),(29,'Hermanosjeep123','1234','a',NULL,NULL,2),(30,'Alaventajeep123','1234','a',NULL,NULL,2),(31,'Cooperativajeep123','1234','a',NULL,NULL,2),(32,'Hermanosferrari123','1234','a',NULL,NULL,2),(33,'Alaventaferrari123','1234','a',NULL,NULL,2),(34,'Cooperativaferrari123','1234','a',NULL,NULL,2),(35,'laura123','1234','a',NULL,NULL,1),(36,'guillermo123','1234','a',NULL,NULL,1),(37,'pedro123','1234','a',NULL,NULL,1),(38,'alicia123','1234','a',NULL,NULL,1),(39,'miguel123','1234','a',NULL,NULL,1),(40,'raul123','1234','a',NULL,NULL,1),(41,'fernando123','1234','a',NULL,NULL,1),(42,'adriana123','1234','a',NULL,NULL,1),(43,'jose123','1234','a',NULL,NULL,1);
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
  `responsable` int(11) DEFAULT NULL,
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
INSERT INTO `usuarios_indicadors` VALUES (11,1,100,1,'2013-04-04',40,40,60,'2013-02-02','2013-01-01','2013-03-03',1,1,'jmgv1989@gmail.com','04149739510',2),(12,1,100,2,'2013-04-04',40,20,60,'2013-02-02','2013-01-01','2013-03-03',1,2,'jmgv1989@gmail.com','04149739510',2),(17,2,100,1,'2013-04-04',40,20,60,'2013-02-02','2013-01-01','2013-03-03',1,3,'jmgv1989@gmail.com','04149739510',2),(20,3,100,2,'2013-04-04',40,20,60,'2013-02-02','2013-01-01','2013-03-03',1,4,'jmgv1989@gmail.com','04149739510',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculos`
--

LOCK TABLES `vehiculos` WRITE;
/*!40000 ALTER TABLE `vehiculos` DISABLE KEYS */;
INSERT INTO `vehiculos` VALUES (1,'pam-031','2013',420000,'g1234','a',NULL,NULL,1,4),(2,'kmt-432','2013',535000,'q12341','a',NULL,NULL,2,5),(3,'qwe-123','2013',800000,'w2345','a',NULL,NULL,4,6),(4,'yui-098','2013',400000,'e435t','a',NULL,NULL,5,7),(5,'lkj-456','2013',800000,'r456543','a',NULL,NULL,7,8),(6,'vfe-234','2013',500000,'y56444','a',NULL,NULL,8,9),(7,'xcv-076','2013',600000,'u234234','a',NULL,NULL,10,10),(8,'ÃÂ±lk-239','2013',400000,'i1234','a',NULL,NULL,11,11),(9,'mko-762','2013',700000,'o13441','a',NULL,NULL,13,12),(10,'dsa-534','2013',500000,'p12341','a',NULL,NULL,14,13),(11,'rfd-567','2013',1700000,'a12341','a',NULL,NULL,16,14),(12,'yop-908','2013',1800000,'t12341','a',NULL,NULL,17,15),(13,'plo-125','2013',420000,'bg12356','a',NULL,NULL,2,4),(14,'plo-125','2013',NULL,'asdf123','a',NULL,NULL,3,5),(15,'plo-125','2013',NULL,'xcvr456','a',NULL,NULL,5,6),(16,'plo-125','2013',NULL,'vghj789','a',NULL,NULL,6,7),(17,'plo-125','2013',NULL,'jmkl3','a',NULL,NULL,8,8),(18,'plo-125','2013',NULL,'xcv567','a',NULL,NULL,9,9),(19,'plo-125','2013',NULL,'sd879','a',NULL,NULL,11,10),(20,'plo-125','2013',NULL,'u890jkl','a',NULL,NULL,12,11),(21,'plo-125','2013',NULL,'jp23egmjhm','a',NULL,NULL,14,12),(22,'plo-125','2013',NULL,'jo89y89','a',NULL,NULL,15,13);
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

-- Dump completed on 2013-04-03  8:28:39
