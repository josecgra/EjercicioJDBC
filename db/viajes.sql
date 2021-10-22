-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.45-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema viajes
--

CREATE DATABASE IF NOT EXISTS viajes;
USE viajes;

--
-- Definition of table `hoteles`
--

DROP TABLE IF EXISTS `hoteles`;
CREATE TABLE `hoteles` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `nombre` varchar(50) collate latin1_spanish_ci default NULL,
  `direccion` varchar(50) collate latin1_spanish_ci default NULL,
  `anyoCrea` smallint(5) unsigned default NULL,
  `plazasDisp` int(11) unsigned default NULL,
  `precio` int(10) unsigned default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `hoteles`
--

/*!40000 ALTER TABLE `hoteles` DISABLE KEYS */;
INSERT INTO `hoteles` (`id`,`nombre`,`direccion`,`anyoCrea`,`plazasDisp`,`precio`) VALUES 
 (1,'Hotelito','Avda. Nacional, 14',1970,100,50),
 (2,'Gran Hotel','C/ Escudero, S/N',1990,1,100),
 (3,'Hostalito','C/ Paradita, 1',2001,23,30),
 (4,'Pension','C/ Tenencio, 100',1930,0,20);
/*!40000 ALTER TABLE `hoteles` ENABLE KEYS */;


--
-- Definition of table `reshotel`
--

DROP TABLE IF EXISTS `reshotel`;
CREATE TABLE `reshotel` (
  `fk_usuario` int(10) unsigned NOT NULL,
  `FechaReserva` date default NULL,
  `Numdias` int(11) default NULL,
  `fk_hotel` int(10) unsigned NOT NULL,
  PRIMARY KEY (`fk_usuario`,`fk_hotel`) USING BTREE,
  KEY `FK_reshotel_1` (`fk_hotel`),
  CONSTRAINT `FK_reshotel_2` FOREIGN KEY (`fk_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_reshotel_1` FOREIGN KEY (`fk_hotel`) REFERENCES `hoteles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `reshotel`
--

/*!40000 ALTER TABLE `reshotel` DISABLE KEYS */;
INSERT INTO `reshotel` (`fk_usuario`,`FechaReserva`,`Numdias`,`fk_hotel`) VALUES 
 (1,'2007-11-01',3,1),
 (1,'2007-11-03',1,2),
 (2,'2007-10-29',2,3);
/*!40000 ALTER TABLE `reshotel` ENABLE KEYS */;


--
-- Definition of table `resvuelo`
--

DROP TABLE IF EXISTS `resvuelo`;
CREATE TABLE `resvuelo` (
  `fk_usuario` int(10) unsigned NOT NULL,
  `fk_vuelo` int(10) unsigned NOT NULL,
  `fechaReserva` date default NULL,
  `precio` int(10) unsigned default NULL,
  PRIMARY KEY (`fk_usuario`,`fk_vuelo`) USING BTREE ,
  KEY `FK_resvuelo_2` (`fk_vuelo`),
  CONSTRAINT `FK_resvuelo_1` FOREIGN KEY (`fk_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_resvuelo_2` FOREIGN KEY (`fk_vuelo`) REFERENCES `vuelos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `resvuelo`
--

/*!40000 ALTER TABLE `resvuelo` DISABLE KEYS */;
INSERT INTO `resvuelo` (`fk_usuario`,`fk_vuelo`,`fechaReserva`,`precio`) VALUES 
 (1,1,'2007-11-02',150),
 (1,3,'2007-10-10',1500),
 (2,1,'2007-11-01',200),
 (3,3,'2007-10-27',1000);
/*!40000 ALTER TABLE `resvuelo` ENABLE KEYS */;


--
-- Definition of table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `dni` int(11) default NULL,
  `nombre` varchar(50) collate latin1_spanish_ci default NULL,
  `apellido1` varchar(50) collate latin1_spanish_ci default NULL,
  `apellido2` varchar(50) collate latin1_spanish_ci default NULL,
  `direccion` varchar(50) collate latin1_spanish_ci default NULL,
  `nacionalidad` varchar(50) collate latin1_spanish_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `usuarios`
--

/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`,`dni`,`nombre`,`apellido1`,`apellido2`,`direccion`,`nacionalidad`) VALUES 
 (1,2121212,'Miguel','Cazorlas','Quevedor','Avda Mi casa','España'),
 (2,2222222,'Otto','Colomina','Parduzco','C/ Su casa','España'),
 (3,3333333,'Domingo','Gallardo','Loperado','C/ Otra casa','España'),
 (4,4444444,'Dinio','González','Penalcul','Paseo Habana','Cuba');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;


--
-- Definition of table `vuelos`
--

DROP TABLE IF EXISTS `vuelos`;
CREATE TABLE `vuelos` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `aeroInic` varchar(50) collate latin1_spanish_ci default NULL,
  `aeroFin` varchar(50) collate latin1_spanish_ci default NULL,
  `diaSal` date default NULL,
  `diaLleg` date default NULL,
  `horaSal` time default NULL,
  `horaLleg` time default NULL,
  `avion` varchar(50) collate latin1_spanish_ci default NULL,
  `plazasDisp` int(10) unsigned default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `vuelos`
--

/*!40000 ALTER TABLE `vuelos` DISABLE KEYS */;
INSERT INTO `vuelos` (`id`,`aeroInic`,`aeroFin`,`diaSal`,`diaLleg`,`horaSal`,`horaLleg`,`avion`,`plazasDisp`) VALUES 
 (1,'ALC','BCN','2003-01-01','2003-01-01','07:30:00','08:10:00','IBE 2',100),
 (2,'ALC','MAD','2003-01-01','2003-01-01','07:00:00','07:50:00','IBE 1',10),
 (3,'MAD','JFK','2003-01-01','2003-01-01','10:00:00','13:00:00','IBE 3',0),
 (4,'MAD','AMS','2003-01-01','2003-01-01','11:00:00','15:00:00','IBE 4',1),
 (5,'JFK','SFA','2003-01-01','2003-01-01','15:00:00','18:00:00','AA 1',30),
 (6,'JFK','SFA','2003-01-02','2003-01-02','15:00:00','18:00:00','AA 2',40),
 (7,'AMS','LHR','2003-01-01','2003-01-01','15:00:00','16:00:00','KLM 1',50),
 (8,'MAD','LHR','2003-01-01','2003-01-01','11:00:00','14:00:00','BAI 1',10),
 (9,'AMS','SFA','2003-01-01','2003-01-01','10:00:00','13:00:00','KLM 2',12),
 (10,'ALC','AMS','2003-01-01','2003-01-01','07:00:00','09:00:00','KLM 3',18),
 (11,'AMS','SFA','2003-01-02','2003-01-02','10:00:00','13:00:00','KLM 2',23),
 (12,'ALC','MAD','2003-01-02','2003-01-02','07:00:00','07:50:00','IBE 1',76),
 (13,'ALC','BCN','2003-01-02','2003-01-02','07:30:00','08:10:00','IBE 2',150),
 (14,'MAD','JFK','2003-01-02','2003-01-02','10:00:00','13:00:00','IBE 3',0),
 (15,'MAD','AMS','2003-01-02','2003-01-02','11:00:00','15:00:00','IBE 4',1),
 (16,'JFK','SFA','2003-01-02','2003-01-02','15:00:00','18:00:00','AA 1',3),
 (17,'AMS','LHR','2003-01-02','2003-01-02','15:00:00','16:00:00','KLM 1',5),
 (18,'MAD','LHR','2003-01-02','2003-01-02','11:00:00','14:00:00','BAI 1',6),
 (19,'ALC','AMS','2003-01-02','2003-01-02','07:00:00','09:00:00','KLM 3',8);
/*!40000 ALTER TABLE `vuelos` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
