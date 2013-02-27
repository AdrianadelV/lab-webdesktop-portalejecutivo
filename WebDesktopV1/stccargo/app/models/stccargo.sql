-- phpMyAdmin SQL Dump
-- version 2.8.1-Debian-1~dapper1
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Apr 1, 2012 at 05:01 PM
-- Server version: 5.0.22
-- PHP Version: 5.1.2
-- 
-- Database: `stccargo`
-- 
CREATE DATABASE `stccargo` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `stccargo`;

-- --------------------------------------------------------


-- 
-- Table structure for table `stccargo_usuarios`
-- 

CREATE TABLE `stccargo_usuarios` (
  `id` int(11) NOT NULL auto_increment,
  `usuario` varchar(10) NOT NULL default '',
  `clave` varchar(50) NOT NULL default '',
  `nivel` char(2) NOT NULL default '',
  `nombre` char(50) NOT NULL default '',
  `correo` char(100) NOT NULL default '',
  `twitter` char(20) NOT NULL default '',
  `celular` char(20) NOT NULL default '',
  `direccion` char(100) NOT NULL default '',
  `telefono` char(20) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `stccargo_usuarios`
-- 

INSERT INTO `stccargo_usuarios` (`id`, `usuario`, `clave`, `nivel`,`nombre`,`correo`,`twitter`,`celular`,`direccion`,`telefono`)
                VALUES (1,'admin', 'admin', '1','Prof. Rodolfo Canelon','rcanelon@ucla.edu.ve','laboratorioiii','+5804141234567','Av. Las Industrias, Nucleo Obelisco. Departamento de Sistemas del DCyT','+5802512591569');

-- --------------------------------------------------------

--
-- Table structure for table `stccargo_transportistas`
--

CREATE TABLE `stccargo_transportistas` (
  `id` int(11) NOT NULL auto_increment,
  `codigo` varchar(10) NOT NULL default '',
  `nombre` char(100) NOT NULL default '',
  `descripcion` text NOT NULL default '',
  `estado` char(100) NOT NULL default '',
  `status` char(2) NOT NULL default '',
  `imagen` char(100) NOT NULL default '',
  `procedimiento` text NOT NULL default '',
  `planilla` char(100) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------
--
-- Definition of table `arbol`
--
DROP TABLE IF EXISTS `arbols`;
CREATE TABLE `arbols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` int(11) NOT NULL,
  `text` varchar(25) NOT NULL DEFAULT '',
  `vinculo` varchar(100) NOT NULL DEFAULT '',
  `padre_id` int(11),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `arbols` (`id`,`tipo`,`text`,`vinculo`,`padre_id`) VALUES 
 (1,1,'Administrador','',0),
 (2,1,'Inicio','menuadmin',1),
 (3,1,'Datos','actualizardatos',1),
 (4,1,'Transportistas','',1),
 (5,1,'Salir','menuadmin/salir',1),
 (6,2,'Mayorista','',0),
 (7,2,'Crear Transportistas','',6),
 (8,2,'Indicadores1','',7),
 (9,2,'Indicadores2','',7),
 (10,2,'Indicadores3','',7),
 (11,2,'Indicadores31','',9);


