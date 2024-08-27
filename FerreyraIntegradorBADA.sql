/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.5.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: TPIntegrador
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `CLIENTES`
--

DROP TABLE IF EXISTS `CLIENTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENTES` (
  `NUM_CLIE` int(11) NOT NULL,
  `EMPRESA` varchar(20) NOT NULL,
  `REP_CLIE` int(11) DEFAULT NULL,
  `LIMITE_CREDITO` float DEFAULT NULL,
  PRIMARY KEY (`NUM_CLIE`),
  KEY `fk_clientes` (`REP_CLIE`),
  CONSTRAINT `fk_clientes` FOREIGN KEY (`REP_CLIE`) REFERENCES `REPVENTAS` (`NUM_EMPL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENTES`
--

LOCK TABLES `CLIENTES` WRITE;
/*!40000 ALTER TABLE `CLIENTES` DISABLE KEYS */;
INSERT INTO `CLIENTES` VALUES
(2101,'Jones Mfg.',106,65000),
(2102,'First Corp.',101,65000),
(2103,'Acme Mfg.',105,50000),
(2105,'AAA Investments',101,45000),
(2106,'Fred Lewis Corp.',102,65000),
(2107,'Ace International',110,35000),
(2108,'Holm & Landis',109,55000),
(2109,'Chen Associates',103,25000),
(2111,'JCP Inc.',103,50000),
(2112,'Zetacorp',108,50000),
(2113,'Ian & Schmith',104,20000),
(2114,'Orion Corp.',102,20000),
(2115,'Smithson Corp.',101,20000),
(2117,'J.P.Sinclair',106,35000),
(2118,'Midwest Systems',108,60000),
(2119,'Solomon Inc.',109,25000),
(2120,'Rico Enterprises',102,50000),
(2121,'QMA Assoc.',103,45000),
(2122,'Three-Way Lines',105,30000),
(2123,'Carter & Sons',102,40000),
(2124,'Peter Brothers',107,40000);
/*!40000 ALTER TABLE `CLIENTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFICINAS`
--

DROP TABLE IF EXISTS `OFICINAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OFICINAS` (
  `OFICINA` int(11) NOT NULL,
  `CIUDAD` varchar(15) DEFAULT NULL,
  `REGION` varchar(10) DEFAULT NULL,
  `DIR` int(11) DEFAULT NULL,
  `OBJETIVO` float DEFAULT NULL,
  `VENTAS` float NOT NULL,
  PRIMARY KEY (`OFICINA`),
  KEY `FK_OFICINAS_DIR` (`DIR`),
  CONSTRAINT `FK_OFICINAS_DIR` FOREIGN KEY (`DIR`) REFERENCES `REPVENTAS` (`NUM_EMPL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFICINAS`
--

LOCK TABLES `OFICINAS` WRITE;
/*!40000 ALTER TABLE `OFICINAS` DISABLE KEYS */;
INSERT INTO `OFICINAS` VALUES
(11,'New York','Este',106,575000,692637),
(12,'Chicago','Este',104,800000,735042),
(13,'Atlanta','Este',105,350000,367911),
(21,'Los Angeles','Oeste',108,725000,835915),
(22,'Denver','Oeste',108,300000,186042);
/*!40000 ALTER TABLE `OFICINAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PEDIDOS`
--

DROP TABLE IF EXISTS `PEDIDOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PEDIDOS` (
  `NUM_PEDIDO` int(11) NOT NULL,
  `FECHA_PEDIDO` date NOT NULL,
  `CLIE` int(11) NOT NULL,
  `REP` int(11) DEFAULT NULL,
  `FAB` char(3) NOT NULL,
  `PRODUCTO` char(5) NOT NULL,
  `CANT` int(11) NOT NULL,
  `IMPORTE` float NOT NULL,
  PRIMARY KEY (`NUM_PEDIDO`),
  KEY `CLIE` (`CLIE`),
  KEY `REP` (`REP`),
  KEY `FAB` (`FAB`,`PRODUCTO`),
  CONSTRAINT `PEDIDOS_ibfk_1` FOREIGN KEY (`CLIE`) REFERENCES `CLIENTES` (`NUM_CLIE`),
  CONSTRAINT `PEDIDOS_ibfk_2` FOREIGN KEY (`REP`) REFERENCES `REPVENTAS` (`NUM_EMPL`),
  CONSTRAINT `PEDIDOS_ibfk_3` FOREIGN KEY (`FAB`, `PRODUCTO`) REFERENCES `PRODUCTOS` (`ID_FAB`, `ID_PRODUCTO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PEDIDOS`
--

LOCK TABLES `PEDIDOS` WRITE;
/*!40000 ALTER TABLE `PEDIDOS` DISABLE KEYS */;
INSERT INTO `PEDIDOS` VALUES
(1,'1989-12-17',2117,106,'REI','2A44L',7,31500),
(2,'1990-01-11',2111,105,'ACI','41003',35,3745),
(3,'1990-01-03',2101,106,'FEA','114',6,1458),
(4,'1990-02-10',2118,108,'QSA','K47',4,1420),
(5,'1989-10-12',2102,101,'ACI','41004',34,3978),
(6,'1990-01-30',2107,110,'ACI','4100Z',9,22500),
(7,'1990-02-02',2112,108,'REI','2A44R',10,45000),
(8,'1989-12-17',2103,105,'ACI','41004',28,3276),
(9,'1990-01-14',2118,108,'BIC','41003',1,652),
(10,'1990-02-23',2108,109,'FEA','112',10,1480),
(11,'1990-01-08',2124,107,'BIC','41003',1,652),
(12,'1989-12-27',2103,105,'ACI','41004',6,702),
(13,'1990-01-20',2114,108,'QSA','XK47',20,7100),
(14,'1990-02-24',2124,107,'FEA','114',10,2430),
(15,'1989-10-12',2114,102,'ACI','4100Z',6,15000),
(16,'1990-01-22',2103,105,'ACI','41002',54,4104),
(17,'1990-01-08',2112,108,'IMM','773C',3,2925),
(18,'1990-03-02',2109,107,'IMM','775C',22,31350),
(19,'1990-01-29',2107,110,'REI','2A45C',8,632),
(20,'1989-11-04',2118,108,'ACI','41002',10,760),
(21,'1989-10-12',2111,103,'REI','2A44G',6,2100),
(22,'1998-02-15',2108,101,'ACI','4100X',6,150),
(23,'1990-02-10',2120,102,'IMM','779C',2,3750),
(24,'1989-01-04',2106,102,'REI','2A45C',24,1896),
(25,'1990-02-27',2106,102,'QSA','XK47',6,2130),
(26,'1990-01-25',2108,109,'IMM','779C',3,5625),
(27,'1990-02-10',2118,108,'QSA','XK47',2,776),
(28,'1989-12-31',2103,105,'ACI','4100Y',11,27500),
(29,'1990-02-18',2111,103,'ACI','4100X',24,600),
(30,'1990-02-02',2113,101,'REI','2A44R',5,22500);
/*!40000 ALTER TABLE `PEDIDOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCTOS`
--

DROP TABLE IF EXISTS `PRODUCTOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCTOS` (
  `ID_FAB` char(3) NOT NULL,
  `ID_PRODUCTO` char(5) NOT NULL,
  `DESCRIPCION` varchar(20) NOT NULL,
  `PRECIO` float NOT NULL,
  `EXISTENCIAS` int(11) NOT NULL,
  PRIMARY KEY (`ID_FAB`,`ID_PRODUCTO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCTOS`
--

LOCK TABLES `PRODUCTOS` WRITE;
/*!40000 ALTER TABLE `PRODUCTOS` DISABLE KEYS */;
INSERT INTO `PRODUCTOS` VALUES
('ACI','41002','Articulo tipo 2',76,167),
('ACI','41003','Articulo tipo 3',107,207),
('ACI','41004','Articulo tipo 4',117,139),
('ACI','4100X','Ajustador',25,37),
('ACI','4100Z','Montador',2500,28),
('ASI','41001','Articulo tipo 1',55,277),
('ASI','4100Y','Extractor',2750,25),
('BIC','41003','Manivela',652,3),
('BIC','41089','RETN',225,78),
('BIC','41672','Plate',180,0),
('FEA','112','Cubierta',148,115),
('FEA','114','Bancada Motor',243,15),
('IMM','773C','Riostra 1/2-TM',975,28),
('IMM','775C','Riostra 1-Tm',1425,5),
('IMM','779C','Riostra 2-Tm',1875,9),
('IMM','887H','Soporte Riostra',54,223),
('IMM','887P','Perno Riostra',250,24),
('IMM','887X','Retenedor Riostra',475,32),
('QSA','XK47','Reductor',355,38),
('QSA','XK48','Reductor',134,203),
('QSA','XK48A','Reductor',117,37),
('REI','2A44G','Pasador Bisagra',350,14),
('REI','2A44L','Bisagra Izqda.',4500,12),
('REI','2A44R','Bisagra Dcha.',4500,12),
('REI','2A45C','V Stago Trinquete',79,210);
/*!40000 ALTER TABLE `PRODUCTOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REPVENTAS`
--

DROP TABLE IF EXISTS `REPVENTAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REPVENTAS` (
  `NUM_EMPL` int(11) NOT NULL,
  `NAME` varchar(15) NOT NULL,
  `EDAD` int(11) DEFAULT NULL,
  `OFICINA_REP` int(11) DEFAULT NULL,
  `TITULO` varchar(10) DEFAULT NULL,
  `CONTRATO` date NOT NULL,
  `DIRECTOR` int(11) DEFAULT NULL,
  `CUOTA` float DEFAULT NULL,
  `VENTAS` float NOT NULL,
  PRIMARY KEY (`NUM_EMPL`),
  KEY `OFICINA_REP` (`OFICINA_REP`),
  CONSTRAINT `REPVENTAS_ibfk_1` FOREIGN KEY (`OFICINA_REP`) REFERENCES `OFICINAS` (`OFICINA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REPVENTAS`
--

LOCK TABLES `REPVENTAS` WRITE;
/*!40000 ALTER TABLE `REPVENTAS` DISABLE KEYS */;
INSERT INTO `REPVENTAS` VALUES
(101,'Dan Roberts',45,12,'Rep Ventas','1986-10-20',104,300000,305673),
(102,'Sue Smith',48,21,'Rep Ventas','1986-12-10',108,350000,474050),
(103,'Paul Cruz',29,12,'Rep Ventas','1987-03-01',104,275000,286775),
(104,'Bob Smith',33,12,'Dir Ventas','1987-05-19',106,200000,142594),
(105,'BIll Adams',37,13,'Rep Ventas','1988-02-12',104,350000,367911),
(106,'Sam Clark',52,11,'VP Ventas','1988-06-14',NULL,275000,299912),
(107,'Nancy Angelli',49,22,'Rep Ventas','1988-11-14',108,300000,186042),
(108,'Larry Fitch',62,21,'Dir Ventas','1989-10-12',106,350000,361865),
(109,'Mary Jones',31,11,'Rep Ventas','1999-10-12',106,300000,392725),
(110,'Tom Snyder',41,NULL,'Rep Ventas','1990-01-13',101,NULL,75985);
/*!40000 ALTER TABLE `REPVENTAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'TPIntegrador'
--
