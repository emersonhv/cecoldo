-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.51b-community-nt-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema cecoldo
--

CREATE DATABASE IF NOT EXISTS cecoldo;
USE cecoldo;

--
-- Definition of table `archivo_datos`
--

DROP TABLE IF EXISTS `archivo_datos`;
CREATE TABLE `archivo_datos` (
  `id_archivo` int(10) unsigned NOT NULL auto_increment,
  `nombre_archivo` varchar(255) default NULL,
  `id_usuario` int(10) unsigned NOT NULL default '0',
  `fecha` date default NULL,
  `hora` time default NULL,
  `id_metadata` int(11) default NULL,
  `region` varchar(255) default NULL,
  `estado` varchar(255) default NULL,
  PRIMARY KEY  (`id_archivo`),
  KEY `FK_archivo_datos_1` (`id_metadata`),
  KEY `FKE8838288E47F6B6` (`id_metadata`),
  KEY `FKE8838288C52ADEF9` (`id_metadata`),
  CONSTRAINT `FKE8838288C52ADEF9` FOREIGN KEY (`id_metadata`) REFERENCES `metadata` (`id`),
  CONSTRAINT `FKE8838288E47F6B6` FOREIGN KEY (`id_metadata`) REFERENCES `metadata` (`id`),
  CONSTRAINT `FK_archivo_datos_1` FOREIGN KEY (`id_metadata`) REFERENCES `metadata` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `archivo_datos`
--

/*!40000 ALTER TABLE `archivo_datos` DISABLE KEYS */;
/*!40000 ALTER TABLE `archivo_datos` ENABLE KEYS */;


--
-- Definition of table `archivo_guardian`
--

DROP TABLE IF EXISTS `archivo_guardian`;
CREATE TABLE `archivo_guardian` (
  `id_archivo_datos` int(10) unsigned NOT NULL,
  `reportuser_id` int(11) NOT NULL,
  `estado` varchar(1) default NULL,
  PRIMARY KEY  (`id_archivo_datos`,`reportuser_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `archivo_guardian`
--

/*!40000 ALTER TABLE `archivo_guardian` DISABLE KEYS */;
/*!40000 ALTER TABLE `archivo_guardian` ENABLE KEYS */;


--
-- Definition of table `bodc_biota_comp_model`
--

DROP TABLE IF EXISTS `bodc_biota_comp_model`;
CREATE TABLE `bodc_biota_comp_model` (
  `CODE` varchar(8) default NULL,
  `PARAM` varchar(50) default NULL,
  `SUB_NAME` varchar(100) default NULL,
  `SUB_ALTNAM` varchar(30) default NULL,
  `TAXON_CODE` decimal(8,0) default NULL,
  `TAXON_NAME` varchar(100) default NULL,
  `TAXON_CLASS` varchar(50) default NULL,
  `PARAM_COMP` varchar(50) default NULL,
  `COMP` varchar(50) default NULL,
  `COMP_CLASS` varchar(50) default NULL,
  `SAMP_PREP` varchar(50) default NULL,
  `ANALYSIS` mediumtext,
  `DATA_PROC` varchar(100) default NULL,
  `CREATED` varchar(40) default NULL,
  `MODIFIED` varchar(40) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bodc_biota_comp_model`
--

/*!40000 ALTER TABLE `bodc_biota_comp_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `bodc_biota_comp_model` ENABLE KEYS */;


--
-- Definition of table `bodc_category`
--

DROP TABLE IF EXISTS `bodc_category`;
CREATE TABLE `bodc_category` (
  `CODE` varchar(4) NOT NULL default '',
  `TITLE` varchar(200) default NULL,
  `DOCREF` decimal(8,0) default NULL,
  `RECORD_LOCK` varchar(1) default NULL,
  `CREATED` varchar(40) default NULL,
  `MODIFIED` varchar(40) default NULL,
  `DISCIPLINE` int(10) unsigned default NULL,
  PRIMARY KEY  (`CODE`),
  KEY `FK4E53B25150CF1E1A` (`DISCIPLINE`),
  CONSTRAINT `FK4E53B25150CF1E1A` FOREIGN KEY (`DISCIPLINE`) REFERENCES `inv_discipline` (`id_discipline`),
  CONSTRAINT `FK_bodc_category_1` FOREIGN KEY (`DISCIPLINE`) REFERENCES `inv_discipline` (`id_discipline`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bodc_category`
--

/*!40000 ALTER TABLE `bodc_category` DISABLE KEYS */;
INSERT INTO `bodc_category` (`CODE`,`TITLE`,`DOCREF`,`RECORD_LOCK`,`CREATED`,`MODIFIED`,`DISCIPLINE`) VALUES 
 ('B005','Bacteria and viruses','99092',NULL,'2003-06-10 00:00:00','2003-06-10 15:23:21',4),
 ('B007','Biota composition','103350',NULL,'2004-04-30 09:47:00','2004-04-30 09:47:00',4),
 ('B015','Birds, mammals and reptiles','99105',NULL,'2003-06-10 00:00:00','2003-06-10 15:23:21',4),
 ('B020','Fish','99170',NULL,'2003-06-10 00:00:00','2003-06-10 15:23:21',4),
 ('B025','Microzooplankton','99245',NULL,'2003-06-10 00:00:00','2003-06-10 15:23:21',4),
 ('B027','Other biological measurements','99276',NULL,'2003-06-10 00:00:00','2003-06-10 15:23:21',4),
 ('B030','Phytoplankton','99340',NULL,'2003-06-10 00:00:00','2003-06-10 15:23:21',4),
 ('B035','Pigments','99354',NULL,'2003-06-10 00:00:00','2003-06-10 15:23:21',4),
 ('B040','Zoobenthos','99415',NULL,'2003-06-10 00:00:00','2003-06-10 15:23:21',4),
 ('B045','Zooplankton','99429',NULL,'2003-06-10 00:00:00','2003-06-10 15:23:21',4),
 ('C003','Amino acids','99075',NULL,'2003-06-10 00:00:00','2003-06-10 15:23:21',2),
 ('C005','Carbon, nitrogen and phosphorus','99119',NULL,'2003-06-10 00:00:00','2003-06-10 15:23:21',2),
 ('C010','Carbonate system','99122',NULL,'2003-06-10 00:00:00','2003-06-10 15:23:21',2),
 ('C015','Dissolved gases','99494',NULL,'2003-06-10 00:00:00','2003-06-10 15:23:21',2),
 ('C017','Fatty acids','99167',NULL,'2003-06-10 00:00:00','2003-06-10 15:23:21',2),
 ('C020','Halocarbons (including freons)','99463',NULL,'2003-06-10 00:00:00','2003-06-10 15:23:21',2),
 ('C025','Hydrocarbons','99200',NULL,'2003-06-10 00:00:00','2003-06-10 15:23:21',2),
 ('C030','Isotopes','99214',NULL,'2003-06-10 00:00:00','2003-06-10 15:23:21',2),
 ('C035','Metal concentrations','99228',NULL,'2003-06-10 00:00:00','2003-06-10 15:23:21',2),
 ('C040','Nutrients','99259',NULL,'2003-06-10 00:00:00','2003-06-10 15:23:21',2),
 ('C045','Other inorganic chemical measurements','99293',NULL,'2003-06-10 00:00:00','2003-06-10 15:23:21',2),
 ('C050','Other organic chemical measurements','99306',NULL,'2003-06-10 00:00:00','2003-06-10 15:23:21',2),
 ('C055','PCBs and organic micropollutants','99337',NULL,'2003-06-10 00:00:00','2003-06-10 15:23:21',2),
 ('C060','Mineral chemistry',NULL,NULL,'2008-10-10 11:29:01',NULL,2),
 ('C065','Metalloid concentrations',NULL,NULL,'2008-10-10 11:56:01',NULL,2),
 ('D005','Acoustics','99058',NULL,'2003-06-10 00:00:00','2003-06-10 15:23:21',1),
 ('D015','Optical properties','99262',NULL,'2003-06-10 00:00:00','2003-06-10 15:23:21',1),
 ('D020','Other physical oceanographic measurements','99323',NULL,'2003-06-10 00:00:00','2003-06-10 15:23:21',1),
 ('D025','Water column temperature and salinity','99371',NULL,'2003-06-10 00:00:00','2005-04-04 10:48:27',1),
 ('D030','Currents','118328',NULL,'2006-06-28 16:19:32','2006-06-28 16:19:32',1),
 ('D032','Sea level','118331',NULL,'2006-06-28 16:19:56','2006-06-28 16:19:56',1),
 ('D034','Waves','118345',NULL,'2006-06-28 16:20:14','2006-06-28 16:20:14',1),
 ('G005','Gravity, magnetics and bathymetry','99198',NULL,'2003-06-10 00:00:00','2003-06-10 15:23:21',6),
 ('G010','Sediment properties','99385',NULL,'2003-06-10 00:00:00','2003-06-10 15:23:21',6),
 ('G012','Sonar and seismics','99399',NULL,'2003-06-10 00:00:00','2003-06-10 15:23:21',6),
 ('G015','Suspended particulate matter','99401',NULL,'2003-06-10 00:00:00','2003-06-10 15:23:21',6),
 ('G020','Sedimentary rock geochemistry and geochronology','118362',NULL,'2006-06-28 16:22:20','2006-06-28 16:22:20',6),
 ('G025','Igneous and metamorphic rock geochemistry and geochronology','118376',NULL,'2006-06-28 16:25:01','2006-06-28 16:25:01',6),
 ('G030','Other geological/geophysical measurements',NULL,NULL,'2008-10-10 11:18:01',NULL,6),
 ('G035','Rock geochemistry and geochronology',NULL,NULL,'2008-10-10 11:40:01',NULL,2),
 ('M005','Atmospheric chemistry','99089',NULL,'2003-06-10 00:00:00','2003-06-10 15:23:21',2),
 ('M010','Meteorology','99231',NULL,'2003-06-10 00:00:00','2003-06-10 15:23:21',5),
 ('M015','Cryosphere','116260',NULL,'2006-02-28 08:58:25','2006-02-28 08:58:25',2),
 ('O005','Fluxes','99184',NULL,'2003-06-10 00:00:00','2003-06-10 15:23:21',6),
 ('O010','Rate measurements (including production, excretion and grazing)','99368',NULL,'2003-06-10 00:00:00','2003-06-10 15:23:21',4),
 ('T001','Terrestrial','118359',NULL,'2006-06-28 16:25:35','2006-06-28 16:25:35',6),
 ('Z005','Administration and dimensions','99061',NULL,'2003-06-10 00:00:00','2003-06-10 15:23:21',NULL),
 ('Z010','Palaeoclimatic records',NULL,NULL,'2008-10-10 11:33:01',NULL,1);
/*!40000 ALTER TABLE `bodc_category` ENABLE KEYS */;


--
-- Definition of table `bodc_category_group`
--

DROP TABLE IF EXISTS `bodc_category_group`;
CREATE TABLE `bodc_category_group` (
  `category_code` varchar(4) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY  (`category_code`,`group_id`),
  KEY `FK7E1C4B11ACA43B2F` (`group_id`),
  KEY `FK7E1C4B11903D89AF` (`category_code`),
  CONSTRAINT `FK7E1C4B11903D89AF` FOREIGN KEY (`category_code`) REFERENCES `bodc_category` (`CODE`),
  CONSTRAINT `FK7E1C4B11ACA43B2F` FOREIGN KEY (`group_id`) REFERENCES `report_group` (`GROUP_ID`),
  CONSTRAINT `FK_bodc_category_group_1` FOREIGN KEY (`category_code`) REFERENCES `bodc_category` (`CODE`),
  CONSTRAINT `FK_bodc_category_group_2` FOREIGN KEY (`group_id`) REFERENCES `report_group` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bodc_category_group`
--

/*!40000 ALTER TABLE `bodc_category_group` DISABLE KEYS */;
INSERT INTO `bodc_category_group` (`category_code`,`group_id`) VALUES 
 ('D005',2),
 ('D015',2),
 ('D020',2),
 ('D025',2),
 ('D030',2),
 ('D032',2),
 ('D034',2),
 ('Z010',2),
 ('G005',3),
 ('G010',3),
 ('G012',3),
 ('G015',3),
 ('G020',3),
 ('G025',3),
 ('G030',3),
 ('O005',3),
 ('T001',3),
 ('B005',4),
 ('B007',4),
 ('B015',4),
 ('B020',4),
 ('B025',4),
 ('B027',4),
 ('B030',4),
 ('B035',4),
 ('B040',4),
 ('B045',4),
 ('O010',4),
 ('M010',5),
 ('C003',6),
 ('C005',6),
 ('C010',6),
 ('C015',6),
 ('C017',6),
 ('C020',6),
 ('C025',6),
 ('C030',6),
 ('C035',6),
 ('C040',6),
 ('C045',6),
 ('C050',6),
 ('C055',6),
 ('C060',6),
 ('C065',6),
 ('G035',6),
 ('M005',6),
 ('M015',6);
/*!40000 ALTER TABLE `bodc_category_group` ENABLE KEYS */;


--
-- Definition of table `bodc_category_link`
--

DROP TABLE IF EXISTS `bodc_category_link`;
CREATE TABLE `bodc_category_link` (
  `CATEGORY_CODE` varchar(4) NOT NULL default '',
  `GROUP_CODE` varchar(4) NOT NULL default '',
  PRIMARY KEY  (`GROUP_CODE`,`CATEGORY_CODE`),
  KEY `FKFBD181289F5AF963` (`GROUP_CODE`),
  KEY `FKFBD18128515E7AEC` (`CATEGORY_CODE`),
  KEY `FKFBD18128DD96A9E6` (`GROUP_CODE`),
  KEY `FKFBD18128903D89AF` (`CATEGORY_CODE`),
  CONSTRAINT `FKFBD18128515E7AEC` FOREIGN KEY (`CATEGORY_CODE`) REFERENCES `bodc_category` (`CODE`),
  CONSTRAINT `FKFBD18128903D89AF` FOREIGN KEY (`CATEGORY_CODE`) REFERENCES `bodc_category` (`CODE`),
  CONSTRAINT `FKFBD181289F5AF963` FOREIGN KEY (`GROUP_CODE`) REFERENCES `bodc_parameter_group` (`CODE`),
  CONSTRAINT `FKFBD18128DD96A9E6` FOREIGN KEY (`GROUP_CODE`) REFERENCES `bodc_parameter_group` (`CODE`),
  CONSTRAINT `FK_bodc_category_link_1` FOREIGN KEY (`CATEGORY_CODE`) REFERENCES `bodc_category` (`CODE`),
  CONSTRAINT `FK_bodc_category_link_2` FOREIGN KEY (`GROUP_CODE`) REFERENCES `bodc_parameter_group` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bodc_category_link`
--

/*!40000 ALTER TABLE `bodc_category_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `bodc_category_link` ENABLE KEYS */;


--
-- Definition of table `bodc_category_user`
--

DROP TABLE IF EXISTS `bodc_category_user`;
CREATE TABLE `bodc_category_user` (
  `category_code` varchar(4) NOT NULL,
  `report_user` int(11) NOT NULL,
  KEY `FK_bodc_category_user_1` (`category_code`),
  KEY `FK_bodc_category_user_2` (`report_user`),
  CONSTRAINT `FK_bodc_category_user_1` FOREIGN KEY (`category_code`) REFERENCES `bodc_category` (`CODE`),
  CONSTRAINT `FK_bodc_category_user_2` FOREIGN KEY (`report_user`) REFERENCES `report_user` (`REPORTUSER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bodc_category_user`
--

/*!40000 ALTER TABLE `bodc_category_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `bodc_category_user` ENABLE KEYS */;


--
-- Definition of table `bodc_chem_model`
--

DROP TABLE IF EXISTS `bodc_chem_model`;
CREATE TABLE `bodc_chem_model` (
  `CODE` varchar(8) default NULL,
  `PARAM` varchar(80) default NULL,
  `PARAM_CL` varchar(50) default NULL,
  `SUB_NAME` varchar(100) default NULL,
  `SUB_NAME_CL` varchar(50) default NULL,
  `SUB_ALTNAM` varchar(50) default NULL,
  `PARAM_COMP` varchar(50) default NULL,
  `COMP` varchar(50) default NULL,
  `COMP_CLASS` varchar(50) default NULL,
  `COMP_PHASE` varchar(50) default NULL,
  `COMP_PHASE_CL` varchar(50) default NULL,
  `SAMP_PREP` varchar(100) default NULL,
  `ANALYSIS` varchar(150) default NULL,
  `DATA_PROC` varchar(150) default NULL,
  `CREATED` varchar(40) default NULL,
  `MODIFIED` varchar(40) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bodc_chem_model`
--

/*!40000 ALTER TABLE `bodc_chem_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `bodc_chem_model` ENABLE KEYS */;


--
-- Definition of table `bodc_datos`
--

DROP TABLE IF EXISTS `bodc_datos`;
CREATE TABLE `bodc_datos` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `fecha` date default NULL,
  `hora` time default NULL,
  `latitud` double default NULL,
  `longitud` double default NULL,
  `profundidad` double default NULL,
  `id_archivo` int(10) unsigned default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK7E934B489D30371E` (`id`),
  KEY `FK7E934B481A0373AB` (`id_archivo`),
  KEY `FK7E934B4858E2826E` (`id_archivo`),
  CONSTRAINT `FK7E934B481A0373AB` FOREIGN KEY (`id_archivo`) REFERENCES `archivo_datos` (`id_archivo`),
  CONSTRAINT `FK7E934B4858E2826E` FOREIGN KEY (`id_archivo`) REFERENCES `archivo_datos` (`id_archivo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bodc_datos`
--

/*!40000 ALTER TABLE `bodc_datos` DISABLE KEYS */;
/*!40000 ALTER TABLE `bodc_datos` ENABLE KEYS */;


--
-- Definition of table `bodc_detalle_datos`
--

DROP TABLE IF EXISTS `bodc_detalle_datos`;
CREATE TABLE `bodc_detalle_datos` (
  `id_detalle` int(10) unsigned NOT NULL auto_increment,
  `id_datos` int(10) unsigned NOT NULL,
  `bodc` varchar(8) default NULL,
  `valor` double default NULL,
  `qf` int(11) default NULL,
  PRIMARY KEY  (`id_detalle`),
  KEY `FK9DA9980826D3E12` (`id_datos`),
  KEY `FK9DA9980776F760F` (`id_datos`),
  CONSTRAINT `FK9DA9980776F760F` FOREIGN KEY (`id_datos`) REFERENCES `bodc_datos` (`id`),
  CONSTRAINT `FK9DA9980826D3E12` FOREIGN KEY (`id_datos`) REFERENCES `bodc_datos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bodc_detalle_datos`
--

/*!40000 ALTER TABLE `bodc_detalle_datos` DISABLE KEYS */;
/*!40000 ALTER TABLE `bodc_detalle_datos` ENABLE KEYS */;


--
-- Definition of table `bodc_itis_map`
--

DROP TABLE IF EXISTS `bodc_itis_map`;
CREATE TABLE `bodc_itis_map` (
  `CODE` varchar(8) default NULL,
  `PARAM` varchar(200) default NULL,
  `TAXON_CODE` decimal(8,0) default NULL,
  `TAXON_NAME` varchar(100) default NULL,
  `TAXON_CLASS` varchar(100) default NULL,
  `PARAM_COMP` varchar(50) default NULL,
  `COMP` varchar(50) default NULL,
  `COMP_CLASS` varchar(50) default NULL,
  `SAMP_PREP` varchar(100) default NULL,
  `ANALYSIS` varchar(100) default NULL,
  `DATA_PROC` varchar(100) default NULL,
  `CREATED` varchar(40) default NULL,
  `MODIFIED` varchar(40) default NULL,
  `BIOENTRF` varchar(8) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bodc_itis_map`
--

/*!40000 ALTER TABLE `bodc_itis_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `bodc_itis_map` ENABLE KEYS */;


--
-- Definition of table `bodc_parameter`
--

DROP TABLE IF EXISTS `bodc_parameter`;
CREATE TABLE `bodc_parameter` (
  `CODE` varchar(8) NOT NULL default '',
  `GROUP_CODE` varchar(4) default NULL,
  `UNIT_CODE` varchar(4) default NULL,
  `DUMMY_VAL` double default NULL,
  `MIN_PERMISS_VAL` double default NULL,
  `MAX_PERMISS_VAL` double default NULL,
  `BEFORE_DP` decimal(2,0) default NULL,
  `AFTER_DP` decimal(1,0) default NULL,
  `SIG_FIG` decimal(2,0) default NULL,
  `SHORT_TITLE` varchar(50) default NULL,
  `FULL_TITLE` mediumtext,
  `DEFINITION` mediumtext,
  `RECORD_LOCK` varchar(1) default NULL,
  `BODC_LEGAL` varchar(1) default NULL,
  `CREATED` varchar(40) default NULL,
  `MODIFIED` varchar(40) default NULL,
  PRIMARY KEY  (`CODE`),
  KEY `FK934C68B69F5AF963` (`GROUP_CODE`),
  KEY `FK934C68B649A68DD7` (`UNIT_CODE`),
  KEY `FK934C68B6DD96A9E6` (`GROUP_CODE`),
  KEY `FK934C68B66F20ADF4` (`UNIT_CODE`),
  CONSTRAINT `FK934C68B649A68DD7` FOREIGN KEY (`UNIT_CODE`) REFERENCES `bodc_units` (`CODE`),
  CONSTRAINT `FK934C68B66F20ADF4` FOREIGN KEY (`UNIT_CODE`) REFERENCES `bodc_units` (`CODE`),
  CONSTRAINT `FK934C68B69F5AF963` FOREIGN KEY (`GROUP_CODE`) REFERENCES `bodc_parameter_group` (`CODE`),
  CONSTRAINT `FK934C68B6DD96A9E6` FOREIGN KEY (`GROUP_CODE`) REFERENCES `bodc_parameter_group` (`CODE`),
  CONSTRAINT `FK_bodc_parameter_1` FOREIGN KEY (`GROUP_CODE`) REFERENCES `bodc_parameter_group` (`CODE`),
  CONSTRAINT `FK_bodc_parameter_2` FOREIGN KEY (`UNIT_CODE`) REFERENCES `bodc_units` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bodc_parameter`
--

/*!40000 ALTER TABLE `bodc_parameter` DISABLE KEYS */;
/*!40000 ALTER TABLE `bodc_parameter` ENABLE KEYS */;


--
-- Definition of table `bodc_parameter_group`
--

DROP TABLE IF EXISTS `bodc_parameter_group`;
CREATE TABLE `bodc_parameter_group` (
  `CODE` varchar(4) NOT NULL default '',
  `SHORT_TITLE` varchar(50) default NULL,
  `FULL_TITLE` varchar(200) default NULL,
  `DEFINITION` mediumtext,
  `RECORD_LOCK` varchar(1) default NULL,
  `BODC_LEGAL` varchar(1) default NULL,
  `CREATED` varchar(40) default NULL,
  `MODIFIED` varchar(40) default NULL,
  PRIMARY KEY  (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bodc_parameter_group`
--

/*!40000 ALTER TABLE `bodc_parameter_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `bodc_parameter_group` ENABLE KEYS */;


--
-- Definition of table `bodc_required_parameter`
--

DROP TABLE IF EXISTS `bodc_required_parameter`;
CREATE TABLE `bodc_required_parameter` (
  `id_parameter` int(10) unsigned NOT NULL auto_increment,
  `group_code` varchar(4) default NULL,
  `group_description` mediumtext,
  `unit_code` varchar(4) default NULL,
  `unit_description` mediumtext,
  `definition` mediumtext NOT NULL,
  `category_code` varchar(4) default NULL,
  `min_permiss_value` double default NULL,
  `max_permiss_val` double default NULL,
  `id_solicitud` int(10) unsigned NOT NULL,
  `full_title` mediumtext,
  PRIMARY KEY  (`id_parameter`),
  KEY `FKB3AAC89CA0862A47` (`id_solicitud`),
  CONSTRAINT `FKB3AAC89CA0862A47` FOREIGN KEY (`id_solicitud`) REFERENCES `solicitud_parametros` (`id_solicitud`),
  CONSTRAINT `FK_bodc_required_parameter_1` FOREIGN KEY (`id_solicitud`) REFERENCES `solicitud_parametros` (`id_solicitud`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bodc_required_parameter`
--

/*!40000 ALTER TABLE `bodc_required_parameter` DISABLE KEYS */;
/*!40000 ALTER TABLE `bodc_required_parameter` ENABLE KEYS */;


--
-- Definition of table `bodc_titulo`
--

DROP TABLE IF EXISTS `bodc_titulo`;
CREATE TABLE `bodc_titulo` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `id_archivo` int(10) unsigned NOT NULL,
  `parameter_code` varchar(8) NOT NULL,
  `titulo` varchar(50) default NULL,
  `descripcion` varchar(255) default NULL,
  `definition` varchar(255) default NULL,
  `dummyVal` double default NULL,
  `maxPermissVal` double default NULL,
  `minPermissVal` double default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK6F9479CC1A0373AB` (`id_archivo`),
  CONSTRAINT `FK6F9479CC1A0373AB` FOREIGN KEY (`id_archivo`) REFERENCES `archivo_datos` (`id_archivo`),
  CONSTRAINT `FK_bodc_titulo_1` FOREIGN KEY (`id_archivo`) REFERENCES `archivo_datos` (`id_archivo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bodc_titulo`
--

/*!40000 ALTER TABLE `bodc_titulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `bodc_titulo` ENABLE KEYS */;


--
-- Definition of table `bodc_units`
--

DROP TABLE IF EXISTS `bodc_units`;
CREATE TABLE `bodc_units` (
  `CODE` varchar(4) NOT NULL default '',
  `SHORT_TITLE` varchar(32) default NULL,
  `FULL_TITLE` varchar(120) default NULL,
  `COMMENTS` mediumtext,
  `RECORD_LOCK` varchar(1) default NULL,
  `CREATED` varchar(40) default NULL,
  `MODIFIED` varchar(40) default NULL,
  PRIMARY KEY  (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bodc_units`
--

/*!40000 ALTER TABLE `bodc_units` DISABLE KEYS */;
/*!40000 ALTER TABLE `bodc_units` ENABLE KEYS */;


--
-- Definition of table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL default '0',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;


--
-- Definition of table `categoriesdes`
--

DROP TABLE IF EXISTS `categoriesdes`;
CREATE TABLE `categoriesdes` (
  `idDes` int(11) NOT NULL default '0',
  `langId` varchar(5) NOT NULL default '',
  `label` varchar(96) NOT NULL,
  PRIMARY KEY  (`idDes`,`langId`),
  KEY `langId` (`langId`),
  CONSTRAINT `categoriesdes_ibfk_1` FOREIGN KEY (`idDes`) REFERENCES `categories` (`id`),
  CONSTRAINT `categoriesdes_ibfk_2` FOREIGN KEY (`langId`) REFERENCES `languages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categoriesdes`
--

/*!40000 ALTER TABLE `categoriesdes` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoriesdes` ENABLE KEYS */;


--
-- Definition of table `gen_municipio`
--

DROP TABLE IF EXISTS `gen_municipio`;
CREATE TABLE `gen_municipio` (
  `MUNICIPIO` varchar(255) default NULL,
  `DEPTO` int(10) unsigned default NULL,
  `DANE` char(5) NOT NULL,
  PRIMARY KEY  (`DANE`),
  KEY `FKB01F3DBEA6C28447` (`DEPTO`),
  CONSTRAINT `FKB01F3DBEA6C28447` FOREIGN KEY (`DEPTO`) REFERENCES `gendepartamento` (`Id_Departamento`),
  CONSTRAINT `FK_gen_municipio_1` FOREIGN KEY (`DEPTO`) REFERENCES `gendepartamento` (`Id_Departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gen_municipio`
--

/*!40000 ALTER TABLE `gen_municipio` DISABLE KEYS */;
INSERT INTO `gen_municipio` (`MUNICIPIO`,`DEPTO`,`DANE`) VALUES 
 ('MEDELLÃN',5,'05001'),
 ('ABEJORRAL',5,'05002'),
 ('ABRIAQUÃ',5,'05004'),
 ('ALEJANDRÃA',5,'05021'),
 ('AMAGÃ',5,'05030'),
 ('AMALFI',5,'05031'),
 ('ANDES',5,'05034'),
 ('ANGELÃ“POLIS',5,'05036'),
 ('ANGOSTURA',5,'05038'),
 ('ANORÃ',5,'05040'),
 ('SANTA FE DE\\ANTIOQUIA',5,'05042'),
 ('ANZÃ',5,'05044'),
 ('APARTADÃ“',5,'05045'),
 ('ARBOLETES',5,'05051'),
 ('ARGELIA',5,'05055'),
 ('ARMENIA',5,'05059'),
 ('BARBOSA',5,'05079'),
 ('BELMIRA',5,'05086'),
 ('BELLO',5,'05088'),
 ('BETANIA',5,'05091'),
 ('BETULIA',5,'05093'),
 ('BOLÃVAR',5,'05101'),
 ('BRICEÃ‘O',5,'05107'),
 ('BURITICÃ',5,'05113'),
 ('CÃCERES',5,'05120'),
 ('CAICEDO',5,'05125'),
 ('CALDAS',5,'05129'),
 ('CAMPAMENTO',5,'05134'),
 ('CAÃ‘ASGORDAS',5,'05138'),
 ('CARACOLÃ',5,'05142'),
 ('CARAMANTA',5,'05145'),
 ('CAREPA',5,'05147'),
 ('CARMEN DE\\VIBORAL',5,'05148'),
 ('CAROLINA',5,'05150'),
 ('CAUCASIA',5,'05154'),
 ('CHIGORODÃ“',5,'05172'),
 ('CISNEROS',5,'05190'),
 ('COCORNÃ',5,'05197'),
 ('CONCEPCIÃ“N',5,'05206'),
 ('CONCORDIA',5,'05209'),
 ('COPACABANA',5,'05212'),
 ('DABEIBA',5,'05234'),
 ('DON\\MATIAS',5,'05237'),
 ('EBÃ‰JICO',5,'05240'),
 ('EL BAGRE',5,'05250'),
 ('ENTERARÃAS',5,'05264'),
 ('ENVIGADO',5,'05266'),
 ('FREDONIA',5,'05282'),
 ('FRONTINO',5,'05284'),
 ('GIRALDO',5,'05306'),
 ('GIRARDOTA',5,'05308'),
 ('GÃ“MEZ\\PLATA',5,'05310'),
 ('GRANADA',5,'05313'),
 ('GUADALUPE',5,'05315'),
 ('GUARNE',5,'05318'),
 ('GUATAPÃ‰',5,'05321'),
 ('HELICONIA',5,'05347'),
 ('HISPANIA',5,'05353'),
 ('ITAGÃœI',5,'05360'),
 ('ITUANGO',5,'05361'),
 ('JARDÃN',5,'05364'),
 ('JERICÃ“',5,'05368'),
 ('LA CEJA',5,'05376'),
 ('LA\\ESTRELLA',5,'05380'),
 ('LA\\PINTADA',5,'05390'),
 ('LA\\UNIÃ“N',5,'05400'),
 ('LIBORINA',5,'05411'),
 ('MACEO',5,'05425'),
 ('MARINILLA',5,'05440'),
 ('MONTEBELLO',5,'05467'),
 ('MURINDÃ“',5,'05475'),
 ('MUTATÃ',5,'05480'),
 ('NARIÃ‘O',5,'05483'),
 ('NECOCLÃ',5,'05490'),
 ('NECHÃ',5,'05495'),
 ('OLAYA',5,'05501'),
 ('PEÃ‘OL',5,'05541'),
 ('PEQUÃ‰',5,'05543'),
 ('PUEBLORRICO',5,'05576'),
 ('PUERTO\\BERRÃO',5,'05579'),
 ('PUERTO\\NARE',5,'05585'),
 ('PUERTO\\TRIUNFO',5,'05591'),
 ('REMEDIOS',5,'05604'),
 ('RETIRO',5,'05607'),
 ('RÃONEGRO',5,'05615'),
 ('SABANALARGA',5,'05628'),
 ('SABANETA',5,'05631'),
 ('SALGAR',5,'05642'),
 ('SAN ANDRÃ‰S',5,'05647'),
 ('SAN CARLOS',5,'05649'),
 ('SAN\\FRANCISCO',5,'05652'),
 ('SAN\\JERÃ“NIMO',5,'05656'),
 ('SAN JOSÃ‰\\DE LA MONTAÃ‘A',5,'05658'),
 ('SAN JUAN\\DE URABÃ',5,'05659'),
 ('SAN LUIS',5,'05660'),
 ('SAN PEDRO',5,'05664'),
 ('SAN PEDRO\\DE URABÃ',5,'05665'),
 ('SAN\\RAFAEL',5,'05667'),
 ('SAN\\ROQUE',5,'05670'),
 ('SAN VICENTE',5,'05674'),
 ('SANTA BÃRBARA',5,'05679'),
 ('SANTA ROSA\\DE OSOS',5,'05686'),
 ('SANTO\\DOMINGO',5,'05690'),
 ('SANTUARIO',5,'05697'),
 ('SEGOVIA',5,'05736'),
 ('SONSÃ“N',5,'05756'),
 ('SOPETRÃN',5,'05761'),
 ('TÃMESIS',5,'05789'),
 ('TARAZA',5,'05790'),
 ('TARSO',5,'05792'),
 ('TITIRIBÃ',5,'05809'),
 ('TOLEDO',5,'05819'),
 ('TURBO',5,'05837'),
 ('URAMITA',5,'05842'),
 ('URRAO',5,'05847'),
 ('VALDIVIA',5,'05854'),
 ('VALPARAISO',5,'05856'),
 ('VEGACHÃ',5,'05858'),
 ('VENECIA',5,'05861'),
 ('VIGÃA\\EL FUERTE',5,'05873'),
 ('YALÃ',5,'05885'),
 ('YARUMAL',5,'05887'),
 ('YOLOMBO',5,'05890'),
 ('YONDÃ“',5,'05893'),
 ('ZARAGOZA',5,'05895'),
 ('BARRANQUILLA',8,'08001'),
 ('BARANOA',8,'08078'),
 ('CAMPO DE\\LA CRUZ',8,'08137'),
 ('CANDELARIA',8,'08141'),
 ('GALAPA',8,'08296'),
 ('JUAN DE\\ACOSTA',8,'08372'),
 ('LURUACO',8,'08421'),
 ('MALAMBÃ“',8,'08433'),
 ('MANATÃ',8,'08436'),
 ('PALMAR\\DE VARELA',8,'08520'),
 ('PIOJÃ“',8,'08549'),
 ('POLONUEVO',8,'08558'),
 ('PONEDERA',8,'08560'),
 ('PUERTO\\COLOMBIA',8,'08573'),
 ('REPELÃ“N',8,'08606'),
 ('SABANAGRANDE',8,'08634'),
 ('SABANALARGA',8,'08638'),
 ('SANTA\\LUCÃA',8,'08675'),
 ('SANTO TOMÃS',8,'08685'),
 ('SOLEDAD',8,'08758'),
 ('SUÃN',8,'08770'),
 ('TUBARA',8,'08832'),
 ('USIACURÃ',8,'08849'),
 ('SANTA FE DE BOGOTÃ',11,'11001'),
 ('CARTAGENA',13,'13001'),
 ('ACHÃ',13,'13006'),
 ('ALTO\\DEL ROSARIO',13,'13030'),
 ('ARENAL',13,'13042'),
 ('ARJONA',13,'13052'),
 ('ARROYO\\HONDO',13,'13062'),
 ('BARRANCO\\DE LOBA',13,'13074'),
 ('CALAMAR',13,'13140'),
 ('CANTAGALLO',13,'13160'),
 ('CICUCO',13,'13188'),
 ('CÃ“RDOBA',13,'13212'),
 ('CLEMENCIA',13,'13222'),
 ('EL CARMEN\\DE BOLÃVAR',13,'13244'),
 ('EL GUAMO',13,'13248'),
 ('EL\\PEÃ‘Ã“N',13,'13268'),
 ('HATILLO\\DE LOBA',13,'13300'),
 ('MAGANGUÃ‰',13,'13430'),
 ('MAHATES',13,'13433'),
 ('MARGARITA',13,'13440'),
 ('MARIA\\LA BAJA',13,'13442'),
 ('MONTECRISTO',13,'13458'),
 ('MOMPÃ“S',13,'13468'),
 ('MORALES',13,'13473'),
 ('PINILLOS',13,'13549'),
 ('REGIDOR',13,'13580'),
 ('RIOVIEJO',13,'13600'),
 ('SAN\\CRISTÃ“BAL',13,'13620'),
 ('SAN ESTANISLAO',13,'13647'),
 ('SAN\\FERNANDO',13,'13650'),
 ('SAN JACINTO',13,'13654'),
 ('SAN JACINTO\\DEL CAUCA',13,'13655'),
 ('SAN JUAN\\NEPOMUCENO',13,'13657'),
 ('SAN\\MARTÃN\\DE LOBA',13,'13667'),
 ('SAN PABLO',13,'13670'),
 ('SANTA CATALINA',13,'13673'),
 ('SANTA\\ROSA',13,'13683'),
 ('SANTA ROSA\\DEL SUR',13,'13688'),
 ('SIMITÃ',13,'13744'),
 ('SOPLAVIENTO',13,'13760'),
 ('TALAIGUA\\NUEVO',13,'13780'),
 ('TIQUISIO\\(Puerto Rico)',13,'13810'),
 ('TURBACO',13,'13836'),
 ('TURBANA',13,'13838'),
 ('VILLANUEVA',13,'13873'),
 ('ZAMBRANO',13,'13894'),
 ('TUNJA',15,'15001'),
 ('ALMEIDA',15,'15022'),
 ('AQUITANIA',15,'15047'),
 ('ARCABUCO',15,'15051'),
 ('BELÃ‰N',15,'15087'),
 ('BERBEO',15,'15090'),
 ('BETÃ‰ITIVA',15,'15092'),
 ('BOAVITA',15,'15097'),
 ('BOYACÃ',15,'15104'),
 ('BRICEÃ‘O',15,'15106'),
 ('BUENAVISTA',15,'15109'),
 ('BUSBANZA',15,'15114'),
 ('CALDAS',15,'15131'),
 ('CAMPOHERMOSO',15,'15135'),
 ('CERINZA',15,'15162'),
 ('CHINAVITA',15,'15172'),
 ('CHIQUINQUIRÃ',15,'15176'),
 ('CHISCAS',15,'15180'),
 ('CHITA',15,'15183'),
 ('CHITARAQUE',15,'15185'),
 ('CHIVATÃ',15,'15187'),
 ('CIÃ‰NEGA',15,'15189'),
 ('CÃ“MBITA',15,'15204'),
 ('COPER',15,'15212'),
 ('CORRALES',15,'15215'),
 ('COVARACHÃA',15,'15218'),
 ('CUBARÃ',15,'15223'),
 ('CUCAITA',15,'15224'),
 ('CUÃTIVA',15,'15226'),
 ('CHÃQUIZA',15,'15232'),
 ('CHIVOR',15,'15236'),
 ('DUITAMA',15,'15238'),
 ('EL COCUY',15,'15244'),
 ('EL\\ESPINO',15,'15248'),
 ('FIRAVITOBA',15,'15272'),
 ('FLORESTA',15,'15276'),
 ('GACHANTIVÃ',15,'15293'),
 ('GÃMEZA',15,'15296'),
 ('GARAGOA',15,'15299'),
 ('GUACAMAYAS',15,'15317'),
 ('GUATEQUE',15,'15322'),
 ('GUAYATA',15,'15325'),
 ('GÃœICÃN',15,'15332'),
 ('IZA',15,'15362'),
 ('JENESANO',15,'15367'),
 ('JERICÃ“',15,'15368'),
 ('LABRANZAGRANDE',15,'15377'),
 ('LA\\CAPILLA',15,'15380'),
 ('LA\\VICTORIA',15,'15401'),
 ('LA UVITA',15,'15403'),
 ('VILLA\\DE LEIVA',15,'15407'),
 ('MACANAL',15,'15425'),
 ('MARIPÃ',15,'15442'),
 ('MIRAFLORES',15,'15455'),
 ('MONGUA',15,'15464'),
 ('MONGÃœI',15,'15466'),
 ('MONIQUIRÃ',15,'15469'),
 ('MOTAVITA',15,'15476'),
 ('MUZO',15,'15480'),
 ('NOBSA',15,'15491'),
 ('NUEVO\\COLÃ“N',15,'15494'),
 ('OCAITÃ',15,'15500'),
 ('OTANCHE',15,'15507'),
 ('PACHAVITA',15,'15511'),
 ('PÃEZ',15,'15514'),
 ('PAIPA',15,'15516'),
 ('PAJARITO',15,'15518'),
 ('PANQUEBA',15,'15522'),
 ('PAUNA',15,'15531'),
 ('PAYA',15,'15533'),
 ('PAZ\\DE RÃO',15,'15537'),
 ('PESCA',15,'15542'),
 ('PISBA',15,'15550'),
 ('PUERTO\\BOYACÃ',15,'15572'),
 ('QUÃPAMA',15,'15580'),
 ('RAMIRIQUÃ',15,'15599'),
 ('RÃQUIRA',15,'15600'),
 ('RONDÃ“N',15,'15621'),
 ('SABOYÃ',15,'15632'),
 ('SÃCHICA',15,'15638'),
 ('SAMACÃ',15,'15646'),
 ('SAN EDUARDO',15,'15660'),
 ('SAN JOSÃ‰\\DE PARE',15,'15664'),
 ('SAN LUIS DE\\GACENO',15,'15667'),
 ('SAN\\MATEO',15,'15673'),
 ('SAN MIGUEL\\DE SEMA',15,'15676'),
 ('SAN PABLO\\DE BORBUR',15,'15681'),
 ('SANTAÃ‘A',15,'15686'),
 ('SANTA\\MARÃA',15,'15690'),
 ('SANTA ROSA\\DE VITERBO',15,'15693'),
 ('SANTA\\SOFÃA',15,'15696'),
 ('SATIVANORTE',15,'15720'),
 ('SATIVASUR',15,'15723'),
 ('SIACHOQUE',15,'15740'),
 ('SOATÃ',15,'15753'),
 ('SOCOTÃ',15,'15755'),
 ('SOCHA',15,'15757'),
 ('SOGAMOSO',15,'15759'),
 ('SOMONDOCO',15,'15761'),
 ('SORA',15,'15762'),
 ('SOTAQUIRÃ',15,'15763'),
 ('SORACA',15,'15764'),
 ('SUSACÃ“N',15,'15774'),
 ('SUTAMARCHÃN',15,'15776'),
 ('SUTATENZA',15,'15778'),
 ('TASCO',15,'15790'),
 ('TENZA',15,'15798'),
 ('TIBANÃ',15,'15804'),
 ('TIBASOSA',15,'15806'),
 ('TINJACÃ',15,'15808'),
 ('TIPACOQUE',15,'15810'),
 ('TOCA',15,'15814'),
 ('TOGÃœÃ',15,'15816'),
 ('TÃ“PAGA',15,'15820'),
 ('TOTA',15,'15822'),
 ('TUNUNGUA',15,'15832'),
 ('TURMEQUÃ‰',15,'15835'),
 ('TUTA',15,'15837'),
 ('TUTAZÃ',15,'15839'),
 ('UMBITA',15,'15842'),
 ('VENTAQUEMADA',15,'15861'),
 ('VIRACACHA',15,'15879'),
 ('ZETAQUIRÃ',15,'15897'),
 ('MANIZALES',17,'17001'),
 ('AGUADAS',17,'17013'),
 ('ANSERMA',17,'17042'),
 ('ARANZAZU',17,'17050'),
 ('BELALCÃZAR',17,'17088'),
 ('CHINCHINÃ',17,'17174'),
 ('FILADELFIA',17,'17272'),
 ('LA DORADA',17,'17380'),
 ('LA MERCED',17,'17388'),
 ('MANZANARES',17,'17433'),
 ('MARMATO',17,'17442'),
 ('MARQUETALIA',17,'17444'),
 ('MARULANDA',17,'17446'),
 ('NEIRA',17,'17486'),
 ('NORCASIA',17,'17495'),
 ('PÃCORA',17,'17513'),
 ('PALESTINA',17,'17524'),
 ('PENSILVANIA',17,'17541'),
 ('RIOSUCIO',17,'17614'),
 ('RISARALDA',17,'17616'),
 ('SALAMINA',17,'17653'),
 ('SAMANÃ',17,'17662'),
 ('SAN\\JOSÃ‰',17,'17665'),
 ('SUPÃA',17,'17777'),
 ('VICTORIA',17,'17867'),
 ('VILLAMARÃA',17,'17873'),
 ('VITERBO',17,'17877'),
 ('FLORENCIA',18,'18001'),
 ('ALBANIA',18,'18029'),
 ('BELÃ‰N DE\\LOS ANDAQUÃES',18,'18094'),
 ('CARTAGENA DEL\\CHAIRÃ',18,'18150'),
 ('CURILLO',18,'18205'),
 ('EL DONCELLO',18,'18247'),
 ('EL PAUJIL',18,'18256'),
 ('MONTAÃ‘ITA',18,'18410'),
 ('MILAN',18,'18460'),
 ('MORELIA',18,'18479'),
 ('PUERTO RICO',18,'18592'),
 ('SAN JOSÃ‰\\DEL FRAGUA',18,'18610'),
 ('SAN VICENTE\\DEL CAGUÃN',18,'18753'),
 ('SOLANO',18,'18756'),
 ('SOLITA',18,'18785'),
 ('VALPARAISO',18,'18860'),
 ('POPAYÃN',19,'19001'),
 ('ALMAGUER',19,'19022'),
 ('ARGELIA',19,'19050'),
 ('BALBOA',19,'19075'),
 ('BOLÃVAR',19,'19100'),
 ('BUENOS\\AIRES',19,'19110'),
 ('CAJIBÃO',19,'19130'),
 ('CALDONO',19,'19137'),
 ('CALOTO',19,'19142'),
 ('CORINTO',19,'19212'),
 ('EL TAMBO',19,'19256'),
 ('FLORENCIA',19,'19290'),
 ('GUAPÃ',19,'19318'),
 ('INZA',19,'19355'),
 ('JAMBALÃ“',19,'19364'),
 ('LA SIERRA',19,'19392'),
 ('LA VEGA',19,'19397'),
 ('LÃ“PEZ',19,'19418'),
 ('MERCADERES',19,'19450'),
 ('MIRANDA',19,'19455'),
 ('MORALES',19,'19473'),
 ('PADILLA',19,'19513'),
 ('BELALCÃZAR (PÃEZ)',19,'19517'),
 ('EL BORDO\\(PATÃA)',19,'19532'),
 ('PIAMONTE',19,'19533'),
 ('PIENDAMO',19,'19548'),
 ('PUERTO\\TEJADA',19,'19573'),
 ('COCONUCO\\(PURACÃ‰)',19,'19585'),
 ('ROSAS',19,'19622'),
 ('SAN SEBASTIAN',19,'19693'),
 ('SANTANDER\\DE QUILICHAO',19,'19698'),
 ('SANTA ROSA',19,'19701'),
 ('SILVIA',19,'19743'),
 ('PAISPAMBA\\(SOTARÃ)',19,'19760'),
 ('SUÃREZ',19,'19780'),
 ('SUCRE',19,'19785'),
 ('TIMBIO',19,'19807'),
 ('TIMBIQUÃ',19,'19809'),
 ('TORIBÃO',19,'19821'),
 ('TOTORO',19,'19824'),
 ('VILLA\\RICA',19,'19845'),
 ('VALLEDUPAR',20,'20001'),
 ('AGUACHICA',20,'20011'),
 ('AGUSTÃN\\CODAZZI',20,'20013'),
 ('ASTREA',20,'20032'),
 ('BECERRIL',20,'20045'),
 ('BOSCONIA',20,'20060'),
 ('CHIMICHAGUA',20,'20175'),
 ('CHIRIGUANÃ',20,'20178'),
 ('CURUMANÃ',20,'20228'),
 ('EL\\COPEY',20,'20238'),
 ('EL PASO',20,'20250'),
 ('GAMARRA',20,'20295'),
 ('GONZÃLEZ',20,'20310'),
 ('LA GLORIA',20,'20383'),
 ('LA JAGUA\\DE IBIRICO',20,'20400'),
 ('MANAURE\\BALCÃ“N DEL CESAR',20,'20443'),
 ('PAILITAS',20,'20517'),
 ('PELAYA',20,'20550'),
 ('PUEBLO BELLO',20,'20570'),
 ('RÃO DE ORO',20,'20614'),
 ('LA PAZ',20,'20621'),
 ('SAN ALBERTO',20,'20710'),
 ('SAN DIEGO',20,'20750'),
 ('SAN MARTÃN',20,'20770'),
 ('TAMALAMEQUE',20,'20787'),
 ('MONTERÃA',23,'23001'),
 ('AYAPEL',23,'23068'),
 ('BUENAVISTA',23,'23079'),
 ('CANALETE',23,'23090'),
 ('CERETE',23,'23162'),
 ('CHIMA',23,'23168'),
 ('CHINÃš',23,'23182'),
 ('CIÃ‰NAGA DE ORO',23,'23189'),
 ('COTORRA',23,'23300'),
 ('LA APARTADA\\(La Frontera)',23,'23350'),
 ('LORICA',23,'23417'),
 ('LOS CÃ“RDOBAS',23,'23419'),
 ('MOMIL',23,'23464'),
 ('MONTELÃBANO',23,'23466'),
 ('MONITOS',23,'23500'),
 ('PLANETA\\RICA',23,'23555'),
 ('PUEBLO NUEVO',23,'23570'),
 ('PUERTO\\ESCONDIDO',23,'23574'),
 ('PUERTO LIBERTADOR',23,'23580'),
 ('PURÃSIMA',23,'23586'),
 ('SAHAGÃšN',23,'23660'),
 ('SAN ANDRÃ‰S\\DE SOTAVIENTO',23,'23670'),
 ('SAN\\ANTERO',23,'23672'),
 ('SAN BERNARDO\\DEL VIENTO',23,'23675'),
 ('SAN CARLOS',23,'23678'),
 ('SAN PELAYO',23,'23686'),
 ('TIERRALTA',23,'23807'),
 ('VALENCIA',23,'23855'),
 ('AGUA\\DE DIOS',25,'25001'),
 ('ALBÃN',25,'25019'),
 ('ANAPOIMA',25,'25035'),
 ('ANOLAIMA',25,'25040'),
 ('ARBELÃEZ',25,'25053'),
 ('BELTRÃN',25,'25086'),
 ('BITUIMA',25,'25095'),
 ('BOJACÃ',25,'25099'),
 ('CABRERA',25,'25120'),
 ('CACHIPAY',25,'25123'),
 ('CAJICÃ',25,'25126'),
 ('CAPARRAPÃ',25,'25148'),
 ('CÃQUEZA',25,'25151'),
 ('CARMEN DE\\CARUPA',25,'25154'),
 ('CHAGUANÃ',25,'25168'),
 ('CHÃA',25,'25175'),
 ('CHIPAQUE',25,'25178'),
 ('CHOACHÃ',25,'25181'),
 ('CHOCONTÃ',25,'25183'),
 ('COGUA',25,'25200'),
 ('COTA',25,'25214'),
 ('CUCUNUBA',25,'25224'),
 ('EL COLEGIO',25,'25245'),
 ('EL\\PEÃ‘Ã“N',25,'25258'),
 ('EL\\ROSAL',25,'25260'),
 ('FACATATIVÃ',25,'25269'),
 ('FÃ“MEQUE',25,'25279'),
 ('FOSCA',25,'25281'),
 ('FUNZA',25,'25286'),
 ('FÃšQUENE',25,'25288'),
 ('FUSAGASUGÃ',25,'25290'),
 ('GACHALÃ',25,'25293'),
 ('GACHANCIPÃ',25,'25295'),
 ('GACHETÃ',25,'25297'),
 ('GAMA',25,'25299'),
 ('GIRARDOT',25,'25307'),
 ('GRANADA',25,'25312'),
 ('GUACHETÃ',25,'25317'),
 ('GUADUAS',25,'25320'),
 ('GUASCA',25,'25322'),
 ('GUATAQUÃ',25,'25324'),
 ('GUATAVITA',25,'25326'),
 ('GUAYABAL\\DE SIQUIMA',25,'25328'),
 ('GUAYABETAL',25,'25335'),
 ('GUTIÃ‰RREZ',25,'25339'),
 ('JERUSALÃ‰N',25,'25368'),
 ('JUNÃN',25,'25372'),
 ('LA\\CALERA',25,'25377'),
 ('LA\\MESA',25,'25386'),
 ('LA PALMA',25,'25394'),
 ('LA PEÃ‘A',25,'25398'),
 ('LA\\VEGA',25,'25402'),
 ('LENGUAZAQUE',25,'25407'),
 ('MACHETÃ',25,'25426'),
 ('MADRID',25,'25430'),
 ('MANTA',25,'25436'),
 ('MEDINA',25,'25438'),
 ('MOSQUERA',25,'25473'),
 ('NARIÃ‘O',25,'25483'),
 ('NEMOCÃ“N',25,'25486'),
 ('NILO',25,'25488'),
 ('NIMAIMA',25,'25489'),
 ('NOCAIMA',25,'25491'),
 ('VENECIA',25,'25506'),
 ('PACHO',25,'25513'),
 ('PAIME',25,'25518'),
 ('PANDI',25,'25524'),
 ('PARATEBUENO',25,'25530'),
 ('PASCA',25,'25535'),
 ('PUERTO\\SALGAR',94,'25572'),
 ('PULI',25,'25580'),
 ('QUEBRADA\\NEGRA',25,'25592'),
 ('QUETAME',25,'25594'),
 ('QUIPILE',25,'25596'),
 ('APULO',25,'25599'),
 ('RICAURTE',25,'25612'),
 ('SAN ANTONIO\\DEL TEQUENDAMA',25,'25645'),
 ('SAN\\BERNARDO',25,'25649'),
 ('SAN\\CAYETANO',25,'25653'),
 ('SAN\\FRANCISCO',25,'25658'),
 ('SAN JUAN\\DE RÃOSECO',25,'25662'),
 ('SASAIMA',25,'25718'),
 ('SESQUILÃ‰',25,'25736'),
 ('SIBATÃ‰',25,'25740'),
 ('SILVANIA',25,'25743'),
 ('SIMIJACA',25,'25745'),
 ('SOACHA',25,'25754'),
 ('SOPO',25,'25758'),
 ('SUBACHOQUE',25,'25769'),
 ('SUESCA',25,'25772'),
 ('SUPATÃ',25,'25777'),
 ('SUSA',25,'25779'),
 ('SUTATAUSA',25,'25781'),
 ('TABIO',25,'25785'),
 ('TAUSA',25,'25793'),
 ('TENA',25,'25797'),
 ('TENJO',25,'25799'),
 ('TIBACUY',25,'25805'),
 ('TIBIRITA',25,'25807'),
 ('TOCAIMA',25,'25815'),
 ('TOCANCIPÃ',25,'25817'),
 ('TOPAIPÃ',25,'25823'),
 ('UBALÃ',25,'25839'),
 ('UBAQUE',25,'25841'),
 ('UBATÃ‰',25,'25843'),
 ('UNE',25,'25845'),
 ('ÃšTICA',25,'25851'),
 ('VERGARA',25,'25862'),
 ('VIANI',25,'25867'),
 ('VILLAGÃ“MEZ',25,'25871'),
 ('VILLAPINZÃ“N',25,'25873'),
 ('VILLETA',25,'25875'),
 ('VIOTÃ',25,'25878'),
 ('YACOPÃ',25,'25885'),
 ('ZIPACÃ“N',25,'25898'),
 ('ZIPAQUIRÃ',25,'25899'),
 ('QUIBDÃ“',27,'27001'),
 ('ACANDÃ',27,'27006'),
 ('PIE DE PATO\\(ALTO BAUDÃ“)',27,'27025'),
 ('ATRATO\\(YUTO)',27,'27050'),
 ('BAGADÃ“',27,'27073'),
 ('BAHÃA SOLANO\\(CIUDAD MUTIS)',27,'27075'),
 ('BAJO BAUDÃ“\\(PIZARRO)',27,'27077'),
 ('BELÃ‰N DE BAJIRÃ',27,'27086'),
 ('BOJAYÃ\\(BELLAVISTA)',27,'27099'),
 ('EL CANTÃ“N\\DE SAN PABLO\\(MANAGRU)',27,'27135'),
 ('CARMEN DEL DARIÃ‰N\\(CUBARADÃ“)',27,'27150'),
 ('CÃ‰RTEGUI',27,'27160'),
 ('CONDOTO',27,'27205'),
 ('EL CARMEN',27,'27245'),
 ('LITORAL DE SAN JUAN\\(SANTA GENOVEVA DE DOCORDÃ“)',27,'27250'),
 ('ISTMINA',27,'27361'),
 ('JURADÃ“',27,'27372'),
 ('LLORÃ“',27,'27413'),
 ('BETÃ‰ (MEDIO ATRATO)',27,'27425'),
 ('PUERTO MELUK (MEDIO BAUDÃ“)',27,'27430'),
 ('MEDIO SAN JUAN\\(ANDAGOYA)',27,'27450'),
 ('NOVITA',27,'27491'),
 ('NUQUÃ',27,'27495'),
 ('RÃO IRÃ“\\(SANTA RITA)',27,'27580'),
 ('PAIMADÃ“ (RÃO QUITO)',27,'27600'),
 ('RIOSUCIO',27,'27615'),
 ('SAN JOSÃ‰\\DEL PALMAR',27,'27660'),
 ('SIPÃ',27,'27745'),
 ('TADÃ“',27,'27787'),
 ('UNGUÃA',27,'27800'),
 ('UNIÃ“N PANAMERICA \\ (ÃNIMAS)',27,'27810'),
 ('NEIVA',41,'41001'),
 ('ACEVEDO',41,'41006'),
 ('AGRADO',41,'41013'),
 ('AÃPE',41,'41016'),
 ('ALGECIRAS',41,'41020'),
 ('ALTAMIRA',41,'41026'),
 ('BARAYA',41,'41078'),
 ('CAMPOALEGRE',41,'41132'),
 ('COLOMBIA',41,'41206'),
 ('ELIAS',41,'41244'),
 ('GARZÃ“N',41,'41298'),
 ('GIGANTE',41,'41306'),
 ('GUADALUPE',41,'41319'),
 ('HOBO',41,'41349'),
 ('ÃQUIRA',41,'41357'),
 ('ISNOS',41,'41359'),
 ('LA\\ARGENTINA',41,'41378'),
 ('LA PLATA',41,'41396'),
 ('NATAGA',41,'41483'),
 ('OPORAPA',41,'41503'),
 ('PAICOL',41,'41518'),
 ('PALERMO',41,'41524'),
 ('PALESTINA',41,'41530'),
 ('PITAL',41,'41548'),
 ('PITALITO',41,'41551'),
 ('RIVERA',41,'41615'),
 ('SALADO\\BLANCO',41,'41660'),
 ('SAN\\AGUSTIN',41,'41668'),
 ('SANTA MARÃA',41,'41676'),
 ('SUAZÃ',41,'41770'),
 ('TARQUÃ',41,'41791'),
 ('TESALIA',41,'41797'),
 ('TELLO',41,'41799'),
 ('TERUEL',41,'41801'),
 ('TIMANÃ',41,'41807'),
 ('VILLA\\VIEJA',41,'41872'),
 ('YAGUARA',41,'41885'),
 ('RIOHACHA',44,'44001'),
 ('ALBANIA',44,'44035'),
 ('BARRANCAS',44,'44078'),
 ('DIBULLA',44,'44090'),
 ('DISTRACCIÃ“N',44,'44098'),
 ('EL\\MOLINO',44,'44110'),
 ('FONSECA',44,'44279'),
 ('HATO\\NUEVO',44,'44378'),
 ('LA JAGUA\\DEL PILAR',44,'44420'),
 ('MAICAO',44,'44430'),
 ('MANAURE',44,'44560'),
 ('SAN JUAN\\DEL CESAR',44,'44650'),
 ('URIBIA',44,'44847'),
 ('URUMITA',44,'44855'),
 ('VILLANUEVA',44,'44874'),
 ('SANTA MARTA',47,'47001'),
 ('ALGARROBO',47,'47030'),
 ('ARACATACA',47,'47053'),
 ('EL DIFÃCIL\\(ARIGUANÃ)',47,'47058'),
 ('CERRO DE SAN ANTONIO',47,'47161'),
 ('CHIVOLO',47,'47170'),
 ('CIÃ‰NAGA',47,'47189'),
 ('CONCORDIA',47,'47205'),
 ('EL BANCO',47,'47245'),
 ('EL PIÃ‘Ã“N',47,'47258'),
 ('EL RETÃ‰N',47,'47268'),
 ('FUNDACIÃ“N',47,'47288'),
 ('GUAMAL',47,'47318'),
 ('NUEVA\\GRANADA',47,'47460'),
 ('PEDRAZA',47,'47541'),
 ('PIJIÃ‘O\\DEL\\CARMEN',47,'47545'),
 ('PIVIJAY',47,'47551'),
 ('PLATO',47,'47555'),
 ('PUEBLOVIEJO',47,'47570'),
 ('REMOLINO',47,'47605'),
 ('SAN\\ÃNGEL',47,'47660'),
 ('SALAMINA',47,'47675'),
 ('SAN\\SEBASTIÃN DE\\BUENAVISTA',47,'47692'),
 ('SAN\\ZENÃ“N',47,'47703'),
 ('SANTA\\ANA',47,'47707'),
 ('SANTA BÃRBARA\\DE PINTO',47,'47720'),
 ('SITIONUEVO',47,'47745'),
 ('TENERIFE',47,'47798'),
 ('ZAPAYÃN\\(PUNTA DE PIEDRAS)',47,'47960'),
 ('ZONA BANANERA (PRADO-SEVILLA)',47,'47980'),
 ('VILLAVICENCIO',50,'50001'),
 ('ACACIAS',50,'50006'),
 ('BARRANCA DE UPÃA',50,'50110'),
 ('CABUYARO',50,'50124'),
 ('CASTILLA\\LA NUEVA',50,'50150'),
 ('CUBARRAL',50,'50223'),
 ('CUMARAL',50,'50226'),
 ('EL\\CALVARIO',50,'50245'),
 ('EL\\CASTILLO',50,'50251'),
 ('EL DORADO',50,'50270'),
 ('FUENTE\\DE ORO',50,'50287'),
 ('GRANADA',50,'50313'),
 ('GUAMAL',50,'50318'),
 ('MAPIRIPÃN',50,'50325'),
 ('MESETAS',50,'50330'),
 ('LA MACARENA',50,'50350'),
 ('URIBE',50,'50370'),
 ('LEJANÃAS',50,'50400'),
 ('PUERTO\\CONCORDIA',50,'50450'),
 ('PUERTO\\GAITÃN',50,'50568'),
 ('PUERTO LÃ“PEZ',50,'50573'),
 ('PUERTO\\LLERAS',50,'50577'),
 ('PUERTO RICO',50,'50590'),
 ('RESTREPO',50,'50606'),
 ('SAN CARLOS\\DE GUAROA',50,'50680'),
 ('SAN JUAN\\DE ARAMA',50,'50683'),
 ('SAN\\JUANITO',50,'50686'),
 ('SAN\\MARTÃN',50,'50689'),
 ('VISTA\\HERMOSA',50,'50711'),
 ('PASTO',52,'52001'),
 ('ALBÃN\\(SAN JOSÃ‰)',52,'52019'),
 ('ALDAÃ‘A',52,'52022'),
 ('ANCUYA',52,'52036'),
 ('ARBOLEDA\\(BERRUECAS)',52,'52051'),
 ('BARBACOAS',52,'52079'),
 ('BELÃ‰N',52,'52083'),
 ('BUESACO',52,'52110'),
 ('COLÃ“N\\(GÃ‰NOVA)',52,'52203'),
 ('CONSACA',52,'52207'),
 ('CONTADERO',52,'52210'),
 ('CÃ“RDOBA',52,'52215'),
 ('CUASPUD\\(CARLOSAMA)',52,'52224'),
 ('CUMBAL',52,'52227'),
 ('CUMBITARA',52,'52233'),
 ('CHACHAGÃœÃ',52,'52240'),
 ('EL\\CHARCO',52,'52250'),
 ('EL\\PEÃ‘OL',52,'52254'),
 ('EL\\ROSARIO',52,'52256'),
 ('EL TABLÃ“N',52,'52258'),
 ('EL TAMBO',52,'52260'),
 ('FUNES',52,'52287'),
 ('GUACHUCAL',52,'52317'),
 ('GUAITARILLA',52,'52320'),
 ('GUALMATÃN',52,'52323'),
 ('ILES',52,'52352'),
 ('IMUÃ‰S',52,'52354'),
 ('IPIALES',52,'52356'),
 ('LA CRUZ',52,'52378'),
 ('LA\\FLORIDA',52,'52381'),
 ('LA LLANADA',52,'52385'),
 ('LA\\TOLA',52,'52390'),
 ('LA\\UNIÃ“N',52,'52399'),
 ('LEIVA',52,'52405'),
 ('LINARES',52,'52411'),
 ('LOS ANDES\\(SOTOMAYOR)',52,'52418'),
 ('MAGÃœÃ\\(PAYAN)',52,'52427'),
 ('MALLAMA\\(PIEDRANCHA)',52,'52435'),
 ('MOSQUERA',52,'52473'),
 ('NARIÃ‘O',52,'52480'),
 ('OLAYA HERRERA\\(BOCAS DE SATINGA)',52,'52490'),
 ('OSPINA',52,'52506'),
 ('FRANCISCO PIZARRO\\(SALAHONDA)',52,'52520'),
 ('POLICARPA',52,'52540'),
 ('POTOSI',52,'52560'),
 ('PROVIDENCIA',52,'52565'),
 ('PUERRES',52,'52573'),
 ('PUPIALES',52,'52585'),
 ('RICAURTE',52,'52612'),
 ('ROBERTO PAYÃN\\(SAN JOSE)',52,'52621'),
 ('SAMANIEGO',52,'52678'),
 ('SANDONA',52,'52683'),
 ('SAN\\BERNARDO',52,'52685'),
 ('SAN LORENZO',52,'52687'),
 ('SAN PABLO',52,'52693'),
 ('SAN PEDRO\\DE CARTAGO',52,'52694'),
 ('SANTA BÃRBARA\\(ISCUANDE)',52,'52696'),
 ('SANTACRUZ\\(GAUCHÃVEZ)',52,'52699'),
 ('SAPUYES',52,'52720'),
 ('TAMINANGO',52,'52786'),
 ('TANGUA',52,'52788'),
 ('TUMACO',52,'52835'),
 ('TÃšQUERRES',52,'52838'),
 ('YACUANQUER',52,'52885'),
 ('CÃšCUTA',54,'54001'),
 ('ABREGO',54,'54003'),
 ('ARBOLEDAS',54,'54051'),
 ('BOCHALEMA',54,'54099'),
 ('BUCARASICA',54,'54109'),
 ('CÃCOTA',54,'54125'),
 ('CÃCHIRA',54,'54128'),
 ('CHINACOTA',54,'54172'),
 ('CHITAGÃ',54,'54174'),
 ('CONVENCIÃ“N',54,'54206'),
 ('CUCUTILLA',54,'54223'),
 ('DURANIA',54,'54239'),
 ('EL CARMEN',54,'54245'),
 ('EL TARRA',54,'54250'),
 ('EL ZULIA',54,'54261'),
 ('GRAMALOTE',54,'54313'),
 ('HACARÃ',54,'54344'),
 ('HERRÃN',54,'54347'),
 ('LABATECA',54,'54377'),
 ('LA ESPERANZA',54,'54385'),
 ('LA PLAYA',54,'54398'),
 ('LOS PATIOS',54,'54405'),
 ('LOURDES',54,'54418'),
 ('MUTISCUA',54,'54480'),
 ('OCAÃ‘A',54,'54498'),
 ('PAMPLONA',54,'54518'),
 ('PAMPLONITA',54,'54520'),
 ('PUERTO\\SANTANDER',54,'54535'),
 ('RAGONVALÃA',54,'54599'),
 ('SALÃZAR',54,'54660'),
 ('SAN CALIXTO',54,'54670'),
 ('SAN CAYETANO',54,'54673'),
 ('SANTIAGO',54,'54680'),
 ('SARDINATA',54,'54720'),
 ('SILOS',54,'54743'),
 ('TEORAMA',54,'54800'),
 ('TIBÃš',54,'54810'),
 ('TOLEDO',54,'54820'),
 ('VILLA CARO',54,'54871'),
 ('VILLA DEL ROSARIO',54,'54874'),
 ('ARMENIA',63,'63001'),
 ('BUENAVISTA',63,'63111'),
 ('CALARCÃ',63,'63130'),
 ('CIRCASIA',63,'63190'),
 ('CÃ“RDOBA',63,'63212'),
 ('FILANDIA',63,'63272'),
 ('GÃ‰NOVA',63,'63302'),
 ('LA TEBAIDA',63,'63401'),
 ('MONTENEGRO',63,'63470'),
 ('PIJAO',63,'63548'),
 ('QUIMBAYA',63,'63594'),
 ('SALENTO',63,'63690'),
 ('PEREIRA',66,'66001'),
 ('APÃA',66,'66045'),
 ('BALBOA',66,'66075'),
 ('BELÃ‰N DE\\UMBRÃA',66,'66088'),
 ('DOSQUEBRADAS',66,'66170'),
 ('GUÃTICA',66,'66318'),
 ('LA CELIA',66,'66383'),
 ('LA\\VIRGINIA',66,'66400'),
 ('MARSELLA',66,'66440'),
 ('MISTRATÃ“',66,'66456'),
 ('PUEBLO RICO',66,'66572'),
 ('QUINCHÃA',66,'66594'),
 ('SANTA ROSA\\DE CABAL',66,'66682'),
 ('SANTUARÃO',66,'66687'),
 ('BUCARAMANGA',68,'68001'),
 ('AGUADA',68,'68013'),
 ('ALBANIA',68,'68020'),
 ('ARATOCA',68,'68051'),
 ('BARBOSA',68,'68077'),
 ('BARICHARA',68,'68079'),
 ('BARRANCABERMEJA',68,'68081'),
 ('BETULIA',68,'68092'),
 ('BOLÃVAR',68,'68101'),
 ('CABRERA',68,'68121'),
 ('CALIFORNIA',68,'68132'),
 ('CAPITANEJO',68,'68147'),
 ('CARCASÃ',68,'68152'),
 ('CEPITA',68,'68160'),
 ('CERRITO',68,'68162'),
 ('CHALARÃ',68,'68167'),
 ('CHARTA',68,'68169'),
 ('CHIMA',68,'68176'),
 ('CHIPATÃ',68,'68179'),
 ('CIMITARRA',68,'68190'),
 ('CONCEPCIÃ“N',68,'68207'),
 ('CONFINES',68,'68209'),
 ('CONTRATACIÃ“N',68,'68211'),
 ('COROMORO',68,'68217'),
 ('CURITÃ',68,'68229'),
 ('EL CARMEN',68,'68235'),
 ('GUACAMAYO',68,'68245'),
 ('EL PEÃ‘Ã“N',68,'68250'),
 ('EL\\PLAYÃ“N',68,'68255'),
 ('ENCINO',68,'68264'),
 ('ENCISO',68,'68266'),
 ('FLORIÃN',68,'68271'),
 ('FLORIDABLANCA',68,'68276'),
 ('GALÃN',68,'68296'),
 ('GAMBITA',68,'68298'),
 ('GIRÃ“N',68,'68307'),
 ('GUACA',68,'68318'),
 ('GUADALUPE',68,'68320'),
 ('GUAPOTA',68,'68322'),
 ('GUAVATA',68,'68324'),
 ('GUEPSA',68,'68327'),
 ('HATO',68,'68344'),
 ('JESUS MARÃA',68,'68368'),
 ('JORDAN',68,'68370'),
 ('LA BELLEZA',68,'68377'),
 ('LANDÃZURI',68,'68385'),
 ('LA PAZ',68,'68397'),
 ('LEBRIJA',68,'68406'),
 ('LOS\\SANTOS',68,'68418'),
 ('MACARAVITA',68,'68425'),
 ('MÃLAGA',68,'68432'),
 ('MATANZA',68,'68444'),
 ('MOGOTES',68,'68464'),
 ('MOLAGAVITA',68,'68468'),
 ('OCAMONTE',68,'68498'),
 ('OIBA',68,'68500'),
 ('ONZAGA',68,'68502'),
 ('PALMAR',68,'68522'),
 ('PALMAS\\DEL SOCORRO',68,'68524'),
 ('PÃRAMO',68,'68533'),
 ('PIEDECUESTA',68,'68547'),
 ('PINCHOTE',68,'68549'),
 ('PUENTE\\NACIONAL',68,'68572'),
 ('PUERTO\\PARRA',68,'68573'),
 ('PUERTO WILCHES',68,'68575'),
 ('RIONEGRO',68,'68615'),
 ('SABANA DE TERRES',68,'68655'),
 ('SAN ANDRÃ‰S',68,'68669'),
 ('SAN\\BENITO',68,'68673'),
 ('SAN GIL',68,'68679'),
 ('SAN JOAQUÃN',68,'68682'),
 ('SAN JOSÃ‰\\DE MIRANDA',68,'68684'),
 ('SAN MIGUEL',68,'68686'),
 ('SAN VICENTE\\DE CHUCURI',68,'68689'),
 ('SANTA BÃRBARA',68,'68705'),
 ('SANTA ELENA DEL OPÃ“N',68,'68720'),
 ('SIMACOTA',68,'68745'),
 ('SOCORRO',68,'68755'),
 ('SUAITA',68,'68770'),
 ('SUCRE',68,'68773'),
 ('SURATA',68,'68780'),
 ('TONA',68,'68820'),
 ('VALLE DE\\SAN JOSE',68,'68855'),
 ('VÃ‰LEZ',68,'68861'),
 ('VETAS',68,'68867'),
 ('VILLANUEVA',68,'68872'),
 ('ZAPATOCA',68,'68895'),
 ('SINCELEJO',70,'70001'),
 ('BUENAVISTA',70,'70110'),
 ('CAIMITO',70,'70124'),
 ('COLOSO',70,'70204'),
 ('COROZAL',70,'70215'),
 ('COVEÃ‘AS',70,'70221'),
 ('CHALAN',70,'70230'),
 ('EL ROBLE',70,'70233'),
 ('GALERAS',70,'70235'),
 ('GUARANDA',70,'70265'),
 ('LA UNIÃ“N',70,'70400'),
 ('LOS\\PALMITOS',70,'70418'),
 ('MAJAGUAL',70,'70429'),
 ('MORROA',70,'70473'),
 ('OVEJAS',70,'70508'),
 ('PALMITO',70,'70523'),
 ('SAMPUÃ‰S',70,'70670'),
 ('SAN BENITO ABAD',70,'70678'),
 ('SAN JUAN\\DE BETULIA',70,'70702'),
 ('SAN\\MARCOS',70,'70708'),
 ('SAN ONOFRE',70,'70713'),
 ('SAN\\PEDRO',70,'70717'),
 ('SINCE',70,'70742'),
 ('SUCRE',70,'70771'),
 ('TOLÃš',70,'70820'),
 ('TOLUVIEJO',70,'70823'),
 ('IBAGUÃ‰',73,'73001'),
 ('ALPUJARRA',73,'73024'),
 ('ALVARADO',73,'73026'),
 ('AMBALEMA',73,'73030'),
 ('ANZOÃTEGUI',73,'73043'),
 ('GUAYABAL\\(ARMERO)',73,'73055'),
 ('ATACO',73,'73067'),
 ('CAJAMARCA',73,'73124'),
 ('CARMEN DE APICALÃ',73,'73148'),
 ('CASABIANCA',73,'73152'),
 ('CHAPARRAL',73,'73168'),
 ('COELLO',73,'73200'),
 ('COYAIMA',73,'73217'),
 ('CUNDAY',73,'73226'),
 ('DOLORES',73,'73236'),
 ('ESPINAL',73,'73268'),
 ('FALÃN',73,'73270'),
 ('FLANDES',73,'73275'),
 ('FRESNO',73,'73283'),
 ('GUAMO',73,'73319'),
 ('HERVEO',73,'73347'),
 ('HONDA',73,'73349'),
 ('ICONONZO',73,'73352'),
 ('LÃ‰RIDA',73,'73408'),
 ('LÃBANO',73,'73411'),
 ('MARIQUITA',73,'73443'),
 ('MELGAR',73,'73449'),
 ('MURILLO',73,'73461'),
 ('NATAGAIMA',73,'73483'),
 ('ORTEGA',73,'73504'),
 ('PALO\\CABILDO',73,'73520'),
 ('PIEDRAS',73,'73547'),
 ('PLANADAS',73,'73555'),
 ('PRADO',73,'73563'),
 ('PURIFICACIÃ“N',73,'73585'),
 ('RÃOBLANCO',73,'73616'),
 ('RONCESVALLES',73,'73622'),
 ('ROVIRA',73,'73624'),
 ('SALDAÃ‘A',73,'73671'),
 ('SAN ANTONIO',73,'73675'),
 ('SAN\\LUIS',73,'73678'),
 ('SANTA ISABEL',73,'73686'),
 ('SUÃREZ',73,'73770'),
 ('VALLE DE \\SAN JUAN',73,'73854'),
 ('VENADILLO',73,'73861'),
 ('VILLAHERMOSA',73,'73870'),
 ('VILLARRICA',73,'73873'),
 ('CALI',76,'76001'),
 ('ALCALÃ',76,'76020'),
 ('ANDALUCÃA',76,'76036'),
 ('ANSERMANUEVO',76,'76041'),
 ('ARGELIA',76,'76054'),
 ('BOLÃVAR',76,'76100'),
 ('BUENAVENTURA',76,'76109'),
 ('BUGA',76,'76111'),
 ('BUGALAGRANDE',76,'76113'),
 ('CAICEDONIA',76,'76122'),
 ('EL DARIÃ‰N\\(CALIMA)',76,'76126'),
 ('CANDELARIA',76,'76130'),
 ('CARTAGO',76,'76147'),
 ('DAGUA',76,'76233'),
 ('EL ÃGUILA',76,'76243'),
 ('EL CAIRO',76,'76246'),
 ('EL\\CERRITO',76,'76248'),
 ('EL DOVIO',76,'76250'),
 ('FLORIDA',76,'76275'),
 ('GINEBRA',76,'76306'),
 ('GUACARÃ',76,'76318'),
 ('JAMUNDÃ',76,'76364'),
 ('LA\\CUMBRE',76,'76377'),
 ('LA UNIÃ“N',76,'76400'),
 ('LA VICTORIA',76,'76403'),
 ('OBANDO',76,'76497'),
 ('PALMIRA',76,'76520'),
 ('PRADERA',76,'76563'),
 ('RESTREPO',76,'76606'),
 ('RIOFRÃO',76,'76616'),
 ('ROLDANILLO',76,'76622'),
 ('SAN PEDRO',76,'76670'),
 ('SEVILLA',76,'76736'),
 ('TORO',76,'76823'),
 ('TRUJILLO',76,'76828'),
 ('TULUÃ',76,'76834'),
 ('ULLOA',76,'76845'),
 ('VERSALLES',76,'76863'),
 ('VIJES',76,'76869'),
 ('YOTOCO',76,'76890'),
 ('YUMBO',76,'76892'),
 ('ZARZAL',76,'76895'),
 ('ARAUCA',81,'81001'),
 ('ARAUQUITA',81,'81065'),
 ('CRAVO NORTE',81,'81220'),
 ('FORTUL',81,'81300'),
 ('PUERTO RONDÃ“N',81,'81591'),
 ('SARAVENA',81,'81736'),
 ('TAME',81,'81794'),
 ('YOPAL',85,'85001'),
 ('AGUAZUL',85,'85010'),
 ('CHÃMEZA',85,'85015'),
 ('HATO COROZAL',85,'85125'),
 ('LA\\SALINA',85,'85136'),
 ('MANI',85,'85139'),
 ('MONTERREY',85,'85162'),
 ('NUNCHÃA',85,'85225'),
 ('OROCUE',85,'85230'),
 ('PAZ DE\\ARIPORO',85,'85250'),
 ('PORE',85,'85263'),
 ('RECETOR',85,'85279'),
 ('SABANALARGA',85,'85300'),
 ('SACAMA',85,'85315'),
 ('SAN LUIS\\DE PALENQUE',85,'85325'),
 ('TÃMARA',85,'85400'),
 ('TAURAMENA',85,'85410'),
 ('TRINIDAD',85,'85430'),
 ('VILLANUEVA',85,'85440'),
 ('MOCOA',86,'86001'),
 ('COLÃ“N',86,'86219'),
 ('ORITO',86,'86320'),
 ('PUERTO ASÃS',86,'86568'),
 ('PUERTO\\CAICEDO',86,'86569'),
 ('PUERTO GUZMÃN',86,'86571'),
 ('PUERTO LEGUÃZAMO',86,'86573'),
 ('SIBUNDOY',86,'86749'),
 ('SAN FRANCISCO',86,'86755'),
 ('San Miguel\\(La Dorada)',86,'86757'),
 ('SANTIAGO',86,'86760'),
 ('VALLE DEL GAMUEZ\\(LA HORMIGA)',86,'86865'),
 ('VILLAGARZÃ“N',86,'86885'),
 ('LETICIA',91,'91001'),
 ('EL ENCANTO',91,'91263'),
 ('LA CHORRERA',91,'91405'),
 ('LA PEDRERA',91,'91407'),
 ('PACOA',91,'91430'),
 ('MIRITÃ PARANÃ\\(CAMPOAMOR)',91,'91460'),
 ('PUERTO ALEGRÃA',91,'91530'),
 ('PUERTO ARICA',91,'91536'),
 ('PUERTO\\NARIÃ‘O',91,'91540'),
 ('PUERTO SANTANDER',91,'91669'),
 ('TARAPACÃ',91,'91798'),
 ('INÃRIDA',94,'94001'),
 ('Morichal\\Nuevo',94,'94109'),
 ('Barranco Mina',94,'94343'),
 ('Mapiripana',94,'94663'),
 ('San Felipe',94,'94883'),
 ('Puerto\\Colombia',94,'94884'),
 ('Guadalupe',94,'94885'),
 ('Cacahual',94,'94886'),
 ('PanÃ¡ PanÃ¡\\(Campo Alegre)',94,'94887'),
 ('SAN JOSÃ‰ DEL GUAVIARE',95,'95001'),
 ('CALAMAR',95,'95015'),
 ('EL RETORNO',95,'95025'),
 ('MIRAFLORES',95,'95200'),
 ('MITU',97,'97001'),
 ('CURURÃš',97,'97161'),
 ('PACOA',97,'97511'),
 ('TARAIRA',97,'97666'),
 ('PAPUNAUA',97,'97777'),
 ('YAVARATE',97,'97889'),
 ('PUERTO CARREÃ‘O',99,'99001'),
 ('LA\\PRIMAVERA',99,'99524'),
 ('SANTA\\ROSALÃA',99,'99624'),
 ('CUMARIBO',99,'99773');
/*!40000 ALTER TABLE `gen_municipio` ENABLE KEYS */;


--
-- Definition of table `gen_profesion`
--

DROP TABLE IF EXISTS `gen_profesion`;
CREATE TABLE `gen_profesion` (
  `id_profesion` int(10) unsigned NOT NULL,
  `profesion` varchar(255) default NULL,
  PRIMARY KEY  (`id_profesion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gen_profesion`
--

/*!40000 ALTER TABLE `gen_profesion` DISABLE KEYS */;
INSERT INTO `gen_profesion` (`id_profesion`,`profesion`) VALUES 
 (1,' Biologo(a) Marina'),
 (2,' Ingeniero(a) Catastral'),
 (3,' Ingeniero(a) de Sistemas'),
 (4,' Ingeniero(a) Civil'),
 (5,' Oceanografo(a)'),
 (6,' Geografo(a)'),
 (7,' Fisico(a) puro'),
 (8,' Ingeniero(a) Fisico(a)'),
 (9,' Ingeniero(a) Quimico(a)'),
 (10,' Geologo(a)'),
 (11,' Oceanologo(a)'),
 (12,' Meteorologo(a)'),
 (13,' Ingeniero(a) geografo'),
 (14,' Otra'),
 (15,' Digitalizador(a)'),
 (16,' Quimico(a) puro(a)'),
 (17,' Ingeniero(a) Industrial'),
 (18,' Comunicador(a) Social'),
 (19,' Ingeniero(a) de Procesos'),
 (20,'BiÃ³logo(a) Marino(a)'),
 (21,'BiÃ³logo(a)'),
 (22,'Calculista'),
 (23,'EcÃ³logo(a)'),
 (24,'GeÃ³logo(a)'),
 (25,'HidrÃ³grafo(a)'),
 (26,'Infante de Marina'),
 (27,'Ingeniero(a)'),
 (28,'Ingeniero(a) Ambiental y Sanitario'),
 (29,'Ingeniero(a) BiolÃ³gico'),
 (30,'Ingeniero(a) de Sistemas'),
 (31,'Ingeniero(a) FÃ­sico(a)'),
 (32,'Ingeniero QuÃ­mico'),
 (33,'Ingeniero(a) Civil'),
 (34,'Ingeniero(a) HidrÃ¡ulico'),
 (35,'Ingeniero(a) MecÃ¡nico(a)'),
 (36,'Ingeniero(a) OceanÃ³logo(a)'),
 (37,'MastozoÃ³logo(a)'),
 (38,'MeteorÃ³logo(a)'),
 (39,'MSc Ingeniero(a)'),
 (40,'OceanÃ³grafo'),
 (41,'OceanÃ³grafo FÃ­sico'),
 (42,'OceanÃ³loga'),
 (43,'Oficial de NavegaciÃ³n'),
 (44,'Oficial naval'),
 (45,'OrnitÃ³logo'),
 (46,'Periodista'),
 (47,'Publicista'),
 (48,'QuÃ­mica'),
 (49,'Suboficial naval'),
 (50,'TÃ©cnico de AerografÃ­a'),
 (51,'TÃ©cnico en Ciencias del Mar'),
 (52,'TÃ©cnico en MeteorologÃ­a'),
 (53,'TÃ©cnico Laboratorista de BiologÃ­a Marina'),
 (54,'TecnÃ³loga en Sistemas'),
 (55,'TecnÃ³logo en OceanografÃ­a');
/*!40000 ALTER TABLE `gen_profesion` ENABLE KEYS */;


--
-- Definition of table `gendepartamento`
--

DROP TABLE IF EXISTS `gendepartamento`;
CREATE TABLE `gendepartamento` (
  `Id_Departamento` int(10) unsigned NOT NULL default '0',
  `NombreDepartamento` varchar(30) NOT NULL default '',
  `id_Pais` char(2) NOT NULL default '',
  PRIMARY KEY  (`Id_Departamento`),
  KEY `id_pais` (`id_Pais`),
  KEY `FK7412435468CBE03E` (`id_Pais`),
  KEY `FK74124354F295C3C1` (`id_Pais`),
  CONSTRAINT `FK7412435468CBE03E` FOREIGN KEY (`id_Pais`) REFERENCES `paises_0101` (`pai_id`),
  CONSTRAINT `FK74124354F295C3C1` FOREIGN KEY (`id_Pais`) REFERENCES `paises_0101` (`pai_id`),
  CONSTRAINT `gendepartamento_ibfk_1` FOREIGN KEY (`id_Pais`) REFERENCES `paises_0101` (`pai_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Departamentos de algunos paises';

--
-- Dumping data for table `gendepartamento`
--

/*!40000 ALTER TABLE `gendepartamento` DISABLE KEYS */;
INSERT INTO `gendepartamento` (`Id_Departamento`,`NombreDepartamento`,`id_Pais`) VALUES 
 (5,'ANTIOQUIA','22'),
 (8,'ATLANTICO','22'),
 (11,'BOGOTA D.C.','22'),
 (13,'BOLIVAR','22'),
 (15,'BOYACA','22'),
 (17,'CALDAS','22'),
 (18,'CAQUETA','22'),
 (19,'CAUCA','22'),
 (20,'CESAR','22'),
 (23,'CORDOBA','22'),
 (25,'CUNDINAMARCA','22'),
 (27,'CHOCO','22'),
 (41,'HUILA','22'),
 (44,'LA GUAJIRA','22'),
 (47,'MAGDALENA','22'),
 (50,'META','22'),
 (52,'NARINO','22'),
 (54,'NORTE DE SANTANDER','22'),
 (63,'QUINDIO','22'),
 (66,'RISARALDA','22'),
 (68,'SANTANDER','22'),
 (70,'SUCRE','22'),
 (73,'TOLIMA','22'),
 (76,'VALLE','22'),
 (81,'ARAUCA','22'),
 (85,'CASANARE','22'),
 (86,'PUTUMAYO','22'),
 (88,'ARCHIPIELAGO SAN ANDRES, PROVI','22'),
 (91,'AMAZONAS','22'),
 (94,'GUAINIA','22'),
 (95,'GUAVIARE','22'),
 (97,'VAUPES','22'),
 (99,'VICHADA','22');
/*!40000 ALTER TABLE `gendepartamento` ENABLE KEYS */;


--
-- Definition of table `genmunicipio`
--

DROP TABLE IF EXISTS `genmunicipio`;
CREATE TABLE `genmunicipio` (
  `Id_Municipio` char(4) NOT NULL,
  `Id_Departamento` int(10) unsigned NOT NULL default '0',
  `NombreMunicipio` varchar(40) NOT NULL default '',
  PRIMARY KEY  (`Id_Municipio`),
  KEY `id_departamento` (`Id_Departamento`),
  KEY `FKDD0E429D85D8CFC8` (`Id_Departamento`),
  CONSTRAINT `FKDD0E429D85D8CFC8` FOREIGN KEY (`Id_Departamento`) REFERENCES `gendepartamento` (`Id_Departamento`),
  CONSTRAINT `genmunicipio_ibfk_1` FOREIGN KEY (`Id_Departamento`) REFERENCES `gendepartamento` (`Id_Departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genmunicipio`
--

/*!40000 ALTER TABLE `genmunicipio` DISABLE KEYS */;
INSERT INTO `genmunicipio` (`Id_Municipio`,`Id_Departamento`,`NombreMunicipio`) VALUES 
 ('1',25,'Agua de Dios'),
 ('10',85,'Aguazul'),
 ('11',20,'Aguachica'),
 ('12',25,'Cabrera'),
 ('13',41,'Agrado'),
 ('14',13,'Calamar'),
 ('15',95,'Calamar'),
 ('16',41,'Aipe'),
 ('17',25,'Chia'),
 ('18',23,'Chinu'),
 ('19',25,'Alban'),
 ('2',5,'Abejorral'),
 ('20',68,'Albania'),
 ('21',5,'Alejandria'),
 ('22',52,'Aldana'),
 ('23',70,'Chalan'),
 ('24',73,'Alpujarra'),
 ('25',27,'Alto Baudo'),
 ('26',41,'Altamira'),
 ('27',50,'El Dorado'),
 ('28',25,'Fosca'),
 ('29',18,'Albania'),
 ('3',54,'Abrego'),
 ('30',47,'Algarrobo'),
 ('31',5,'Amalfi'),
 ('32',20,'Astrea'),
 ('33',25,'Guayabetal'),
 ('34',94,'Barranco Mina'),
 ('35',25,'Anapoima'),
 ('36',52,'Ancuya'),
 ('37',44,'Hatonuevo'),
 ('38',5,'Angostura'),
 ('39',25,'La Palma'),
 ('4',5,'Abriaqui'),
 ('40',25,'Anolaima'),
 ('41',76,'Ansermanuevo'),
 ('42',17,'Anserma'),
 ('43',73,'Anzoategui'),
 ('44',5,'Anza'),
 ('45',5,'Apartado'),
 ('46',18,'Milan'),
 ('47',15,'Aquitania'),
 ('48',5,'Mutata'),
 ('49',5,'Nechi'),
 ('50',17,'Aranzazu'),
 ('51',68,'Aratoca'),
 ('52',13,'Arjona'),
 ('53',47,'Aracataca'),
 ('54',76,'Argelia'),
 ('55',5,'Argelia'),
 ('56',44,'Manaure'),
 ('57',20,'Pueblo Bello'),
 ('58',47,'Ariguani'),
 ('59',5,'Armenia'),
 ('6',50,'Acacias'),
 ('60',20,'Bosconia'),
 ('61',25,'Ricaurte'),
 ('62',13,'Arroyohondo'),
 ('63',8,'Sabanagrande'),
 ('64',5,'Salgar'),
 ('65',81,'Arauquita'),
 ('66',91,'Puerto Santander'),
 ('67',73,'Ataco'),
 ('68',23,'Ayapel'),
 ('69',63,'Salento'),
 ('70',70,'San Juan Betulia'),
 ('71',20,'San Alberto'),
 ('72',68,'Santa Helena del Opon'),
 ('73',27,'Bagado'),
 ('74',13,'Barranco de Loba'),
 ('75',27,'Bahia Solano'),
 ('76',86,'Santiago'),
 ('77',27,'Bajo Baudo'),
 ('78',8,'Baranoa'),
 ('79',52,'Barbacoas'),
 ('80',54,'Teorama'),
 ('81',68,'Barrancabermeja'),
 ('82',54,'Toledo'),
 ('83',52,'Belen'),
 ('84',25,'Ubaque'),
 ('85',44,'Urumita'),
 ('86',5,'Belmira'),
 ('87',15,'Belen'),
 ('88',17,'Belalcazar'),
 ('89',5,'Yolombo'),
 ('90',15,'Berbeo'),
 ('91',5,'Betania'),
 ('92',15,'Beteitiva'),
 ('93',5,'Betulia'),
 ('94',18,'Belen de los Andaquies'),
 ('95',25,'Bituima'),
 ('97',15,'Boavita'),
 ('98',44,'Distraccion'),
 ('99',54,'Bochalema');
/*!40000 ALTER TABLE `genmunicipio` ENABLE KEYS */;


--
-- Definition of table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL default '0',
  `name` varchar(32) NOT NULL,
  `description` varchar(255) default NULL,
  `email` varchar(32) default NULL,
  `referrer` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `referrer` (`referrer`),
  KEY `FKB63DD9D463416F90` (`referrer`),
  CONSTRAINT `FKB63DD9D463416F90` FOREIGN KEY (`referrer`) REFERENCES `users` (`id`),
  CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`referrer`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups`
--

/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;


--
-- Definition of table `groupsdes`
--

DROP TABLE IF EXISTS `groupsdes`;
CREATE TABLE `groupsdes` (
  `idDes` int(11) NOT NULL default '0',
  `langId` varchar(5) NOT NULL default '',
  `label` varchar(96) NOT NULL,
  PRIMARY KEY  (`idDes`,`langId`),
  KEY `langId` (`langId`),
  CONSTRAINT `groupsdes_ibfk_1` FOREIGN KEY (`idDes`) REFERENCES `groups` (`id`),
  CONSTRAINT `groupsdes_ibfk_2` FOREIGN KEY (`langId`) REFERENCES `languages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groupsdes`
--

/*!40000 ALTER TABLE `groupsdes` DISABLE KEYS */;
/*!40000 ALTER TABLE `groupsdes` ENABLE KEYS */;


--
-- Definition of table `inv_chief_scientist`
--

DROP TABLE IF EXISTS `inv_chief_scientist`;
CREATE TABLE `inv_chief_scientist` (
  `Id` char(11) NOT NULL,
  `initials` varchar(255) default NULL,
  `first_name` varchar(255) default NULL,
  `last_name` varchar(255) default NULL,
  `profession` int(10) unsigned default NULL,
  `cv_lac` varchar(255) default NULL,
  `job` varchar(255) default NULL,
  `institution` int(10) unsigned default NULL,
  `active` varchar(255) default NULL,
  `active_until` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `fax` varchar(255) default NULL,
  `country` char(2) default NULL,
  `personal_web_page` varchar(255) default NULL,
  `e_mail_1` varchar(255) default NULL,
  `e_mail_2` varchar(255) default NULL,
  PRIMARY KEY  (`Id`),
  KEY `FK3A057150B4AFB82D` (`institution`),
  KEY `FK3A057150F252BEE4` (`profession`),
  KEY `FK3A057150C92B13D8` (`country`),
  CONSTRAINT `FK3A057150B4AFB82D` FOREIGN KEY (`institution`) REFERENCES `inv_institutions` (`Id_institution`),
  CONSTRAINT `FK3A057150C92B13D8` FOREIGN KEY (`country`) REFERENCES `paises_0101` (`pai_id`),
  CONSTRAINT `FK3A057150F252BEE4` FOREIGN KEY (`profession`) REFERENCES `gen_profesion` (`id_profesion`),
  CONSTRAINT `FK_inv_chief_scientist_1` FOREIGN KEY (`country`) REFERENCES `paises_0101` (`pai_id`),
  CONSTRAINT `FK_inv_chief_scientist_2` FOREIGN KEY (`profession`) REFERENCES `gen_profesion` (`id_profesion`),
  CONSTRAINT `FK_inv_chief_scientist_3` FOREIGN KEY (`institution`) REFERENCES `inv_institutions` (`Id_institution`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_chief_scientist`
--

/*!40000 ALTER TABLE `inv_chief_scientist` DISABLE KEYS */;
INSERT INTO `inv_chief_scientist` (`Id`,`initials`,`first_name`,`last_name`,`profession`,`cv_lac`,`job`,`institution`,`active`,`active_until`,`phone`,`fax`,`country`,`personal_web_page`,`e_mail_1`,`e_mail_2`) VALUES 
 ('1',NULL,'Alberto','Martínez',44,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('10',NULL,'Brian','Chatez',48,NULL,NULL,37,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('100',NULL,'Irene','Marín Jaramillo',21,NULL,NULL,37,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('101',NULL,'Beatriz','Beltrán León',21,NULL,NULL,26,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('102',NULL,'Luis','Zapata',21,NULL,NULL,62,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('103',NULL,'Alberto','Collazos',21,NULL,NULL,37,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('104',NULL,'Jorge','Pérez',39,NULL,NULL,42,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('105',NULL,'Margarita','Marín',46,NULL,NULL,56,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('106',NULL,'Francisco','Carranza',46,NULL,NULL,56,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('107',NULL,'Victor','Bermúdez',51,NULL,NULL,3,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('108',NULL,'Oscar','Quintana',51,NULL,NULL,3,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('109',NULL,'Francisco','Reyes',35,NULL,NULL,55,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('11',NULL,'Ovidio','Zúñiga',48,NULL,NULL,51,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('110',NULL,'Jaime','Ramírez',50,NULL,NULL,55,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('111',NULL,'Jairo','González',50,NULL,NULL,55,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('112',NULL,'Guillermo','Rendón',34,NULL,NULL,42,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('113',NULL,'Francisco','Hernández',34,NULL,NULL,42,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('114',NULL,'Walter','Navarro',20,NULL,NULL,42,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('115',NULL,'Gabriel','Jácome',20,NULL,NULL,57,NULL,NULL,NULL,NULL,'PA',NULL,'e-mail_1','e-mail_2'),
 ('116',NULL,'Ross','Robertson',20,NULL,NULL,57,NULL,NULL,NULL,NULL,'PA',NULL,'e-mail_1','e-mail_2'),
 ('117',NULL,'Juan Diego','López',20,NULL,NULL,57,NULL,NULL,NULL,NULL,'PA',NULL,'e-mail_1','e-mail_2'),
 ('118',NULL,'Julio César','Escobar',20,NULL,NULL,37,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('119',NULL,'Wilfredo','Henao',20,NULL,NULL,37,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('12',NULL,'William','Aristizábal',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('120',NULL,'Raúl','Neira',53,NULL,NULL,37,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('121',NULL,'Nelson','Fernández',20,NULL,NULL,53,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('122',NULL,'Javier','Díaz',20,NULL,NULL,53,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('123',NULL,'Zenaida','Vizcaíno',20,NULL,NULL,3,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('124',NULL,'Manuel','Osorio',NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('125',NULL,'Francisco','Benavides',38,NULL,NULL,55,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('126',NULL,'Carlos','Casas',52,NULL,NULL,55,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('127',NULL,'Manuel','Garzón',NULL,NULL,NULL,55,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('128',NULL,'Warren','Krug',NULL,NULL,NULL,58,NULL,NULL,NULL,NULL,'31',NULL,'e-mail_1','e-mail_2'),
 ('129',NULL,'Liliana','Posada',NULL,NULL,NULL,42,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('13',NULL,'Celso','Beltrán',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('130',NULL,'Nelson','Parodi Díaz',34,NULL,NULL,42,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('131',NULL,'Carlos Roberto','Arango',NULL,NULL,NULL,42,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('132',NULL,'Juan Carlos','Suárez',21,NULL,NULL,59,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('133',NULL,'Rosa Elena','Pinzón',21,NULL,NULL,59,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('134',NULL,'Jaime Eduardo','Mauna De los Reyes',20,NULL,NULL,37,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('135',NULL,'Marco Antonio','Vizcaíno',35,NULL,NULL,37,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('136',NULL,'Héctor','Ospina',49,NULL,NULL,3,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('137',NULL,'Hernando','Wiest',40,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('138',NULL,'Mauricio','Moreno',40,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('139',NULL,'Orlando','Lemus',38,NULL,NULL,55,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('14',NULL,'Daniel','Dossman',NULL,NULL,NULL,37,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('140',NULL,'Gloria','Cabrera',38,NULL,NULL,55,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('141',NULL,'Mario','Vacca',27,NULL,NULL,55,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('142',NULL,'Noel','Garzón',NULL,NULL,NULL,55,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('143',NULL,'Guillermo','Ardila',NULL,NULL,NULL,55,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('144',NULL,'José','Barreto',NULL,NULL,NULL,55,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('145',NULL,'José','Cruz',NULL,NULL,NULL,55,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('146',NULL,'Alejandro','Suárez',20,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('147',NULL,'Clara','Barbos',20,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('148',NULL,'José','Vélez',20,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('149',NULL,'Julio','Vélez',NULL,NULL,NULL,37,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('15',NULL,'Rafael','García',NULL,NULL,NULL,52,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('150',NULL,'Rafael','Carazo B.',43,NULL,NULL,60,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('151',NULL,'Leonardo','Díaz B.',43,NULL,NULL,60,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('152',NULL,'Manuel','Coneo M.',43,NULL,NULL,60,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('153',NULL,'Luis','Coneo M.',43,NULL,NULL,60,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('154',NULL,'Carlos','Escamilla S.',43,NULL,NULL,60,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('155',NULL,'Abel F.','Silva',43,NULL,NULL,60,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('156',NULL,'Elis','García G.',43,NULL,NULL,60,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('157',NULL,'Didier','González C.',43,NULL,NULL,60,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('158',NULL,'Jorgan A.','Aroldo',43,NULL,NULL,60,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('159',NULL,'Obando B.','Ekener',43,NULL,NULL,60,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('16',NULL,'Felipe','Hawking',NULL,NULL,NULL,52,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('160',NULL,'Rolando ','Tovar A.',43,NULL,NULL,60,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('161',NULL,'Augusto','Ruiz C.',43,NULL,NULL,60,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('162',NULL,'Ricardo','Quintero Serpa',20,NULL,NULL,3,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('163',NULL,'Javier','Holguín',55,NULL,NULL,3,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('164',NULL,'Eduardo','Montagut',40,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('165',NULL,'Elías','Blanco',55,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('166',NULL,'Daniel','Rodríguez Godoy',NULL,NULL,NULL,61,NULL,NULL,NULL,NULL,'93',NULL,'e-mail_1','e-mail_2'),
 ('167',NULL,'Fredy','Pretil',NULL,NULL,NULL,62,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('168',NULL,'Wilson','González',NULL,NULL,NULL,62,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('169',NULL,'Martha','Lasso',38,NULL,NULL,55,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('17',NULL,'José','Lagos',NULL,NULL,NULL,51,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('170',NULL,'Jorge','Moreno',38,NULL,NULL,55,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('171',NULL,'Luis','Ramírez',48,NULL,NULL,42,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('172',NULL,'Norma','Grimaldo',21,NULL,NULL,42,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('173',NULL,'Gladis','Arguello',21,NULL,NULL,42,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('174',NULL,'Jackeline','Boada',21,NULL,NULL,42,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('175',NULL,'Rito Ernesto','Gómez',40,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('176',NULL,'Alonso','Marrugo',48,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('177',NULL,'Alex René','Pineda Devia',36,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('178',NULL,'Constanza','Soler',54,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('179',NULL,'Jhon','Álvarez',49,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('18',NULL,'Jorge','Morales',NULL,NULL,NULL,51,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('180',NULL,'Cesar','Pineda',49,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('181',NULL,'Héctor','Guevara',49,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('183',NULL,'Fabián','Molina',49,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('184',NULL,'Carlos','Portillo',26,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('185',NULL,'Alonso','Marrugo',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('186',NULL,'Lucía','Garcés',NULL,NULL,NULL,53,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('187',NULL,'Liliana','Medina Campos',21,NULL,NULL,53,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('188',NULL,'Julián Augusto','Reyna Moreno',40,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('189',NULL,'César','Pinto',49,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('19',NULL,'Mauro','Recalde',NULL,NULL,NULL,51,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('190',NULL,'Nairo','Montenegro',49,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('191',NULL,'Jorge','Batista',49,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('192',NULL,'Alejandro','Sarmiento',49,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('193',NULL,'Juan Carlos','Barraza',49,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('194',NULL,'Janeth','Acevedo',NULL,NULL,'Archivo Capitanía de Puerto',1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('195',NULL,'Fulleda','León',49,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('196',NULL,'Fredy','Cervantes',49,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('197',NULL,'Robinson Fidel','Casanova',48,NULL,'Jefe Laboratorio de Química',1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('198',NULL,'Juan','Herrera Leal',40,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('199',NULL,'Carlos','Moreno',49,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('2',NULL,'Gabriel','Acevedo',20,NULL,NULL,50,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('20',NULL,'Marcos','Torres',NULL,NULL,NULL,52,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('200',NULL,'Yuber','Paúl',49,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('201',NULL,'Salomón','Salazar',NULL,NULL,NULL,51,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('202',NULL,'Edgard Enrico','Cabrera Luna',40,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('203',NULL,'Jairo Javier','Peña',40,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('204',NULL,'Carlos','Vergara',49,NULL,NULL,63,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('205',NULL,'Ramón','López',49,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('206',NULL,'Diana','Molano',30,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('207',NULL,'Gustavo','Camacho Guerrero',40,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('208',NULL,'Valery','Tchantsev',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('209',NULL,'Julio','Vargas Gómez',40,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('21',NULL,'Guillermo','Vásquez',NULL,NULL,NULL,37,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('210',NULL,'José Fernando','Jiménez',33,NULL,NULL,42,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('211',NULL,'Carlos Ramón','Barrera',20,NULL,NULL,20,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('212',NULL,'Carlos','Fernández',NULL,NULL,NULL,51,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('213',NULL,'Mario','Guardo',49,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('214',NULL,'Alexandra','Quiceno',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('215',NULL,'Maria Fernanda','Barberi',47,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('216',NULL,'Angélica','Chilito',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('217',NULL,'Patricia','Macias',32,NULL,NULL,64,NULL,NULL,NULL,NULL,'28',NULL,'e-mail_1','e-mail_2'),
 ('218',NULL,'Oscar','Fajardo',49,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('219',NULL,'Diego Fernando','Guerrero Zorrilla',49,NULL,'DIMAR-División de Litorales y Areas Marinas',1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('22',NULL,'Vitelmo','Riveros Polanía',25,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('220',NULL,'Lewis','Cabezas',49,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('221',NULL,'Elcira','Delgado',20,NULL,NULL,65,NULL,NULL,NULL,NULL,'65',NULL,'e-mail_1','e-mail_2'),
 ('222',NULL,'Luis Jesús','Otero Díaz',40,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('223',NULL,'Demmys','Roso Sánchez',49,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('224',NULL,'Rocío','Meneses Sánchez',23,NULL,NULL,66,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('225',NULL,'Julián','Uribe',20,NULL,NULL,53,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('226',NULL,'Lucía','Fonseca',20,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('227',NULL,'Armando','De Lissa Bornachera',40,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('228',NULL,'Eric','Guayana Labrador',40,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('229',NULL,'Ingrid','García Hansen',20,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('23',NULL,'Pedro','Monsalve Angarita',40,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('230',NULL,'Andrea','Devis Morales',42,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('231',NULL,'Jorge','Soler',NULL,NULL,NULL,20,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('232',NULL,'Edgar','Arteaga',20,NULL,NULL,22,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('233',NULL,'Carlos','Guerrero',NULL,NULL,NULL,67,NULL,NULL,NULL,NULL,'9',NULL,'e-mail_1','e-mail_2'),
 ('234',NULL,'Miles','Hernán',20,NULL,NULL,68,NULL,NULL,NULL,NULL,'20',NULL,'e-mail_1','e-mail_2'),
 ('235',NULL,'Bernardo','Benavides White',40,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('236',NULL,'Urbano','Rosas',44,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('237',NULL,'Carolina','López',44,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('238',NULL,'Alejandro','Sanín',44,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('239',NULL,NULL,'Robledo',44,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('24',NULL,'Gustavo','Fajardo Méndez',40,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('240',NULL,'Cesar','Garzón',49,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('241',NULL,'Rico','Wilson',49,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('242',NULL,'Nilson Yan','Rueda',49,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('243',NULL,'Sandro','Babativa',49,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('244',NULL,'Jorge','Morillo Cuadrado',49,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('245',NULL,'Javier Roberto','Ortiz Galvis',44,NULL,'DIMAR-División de Litorales y Areas Marinas',1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('246',NULL,'Paula Judith','Rojas',20,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('247',NULL,'Fernando','Luna',48,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('248',NULL,'Emerson Esneider','Espitia Espitia',49,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('249',NULL,'Ernesto','Durán',40,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('25',NULL,'Orlando','Perdomo Quezada',40,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('250',NULL,'Julio','Poveda',44,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('251',NULL,'Jaime','Moreno',44,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('252',NULL,'Fair','Robledo',44,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('253',NULL,'Cesar','Garzón Marenco',49,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('254',NULL,'Jorge','Padilla',49,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('255',NULL,'Jorge','Morillo Cuadrado',49,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('256',NULL,'Jeimmy','Melo',27,NULL,NULL,20,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('257',NULL,'Natalia','Escobar',NULL,NULL,NULL,40,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('258',NULL,'Erika','Gutiérrez',NULL,NULL,NULL,37,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('259',NULL,'Héctor','Chaux Campo',48,NULL,NULL,69,NULL,NULL,NULL,NULL,'65',NULL,'e-mail_1','e-mail_2'),
 ('26',NULL,'Jaime','Hernández Devia',40,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('260',NULL,'Jorge','Tovar',20,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('261',NULL,'Marcela','Duarte',48,NULL,NULL,59,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('262',NULL,'Juan ','Rueda',49,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('263',NULL,'Ingrid','Jiménez',21,NULL,NULL,40,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('264',NULL,'Eugenia','Escarria',21,NULL,NULL,26,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('265',NULL,'Alba','Fonseca',21,NULL,NULL,38,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('266',NULL,'Isabel','Ávila',21,NULL,NULL,18,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('267',NULL,'Germán','Soler',20,NULL,NULL,16,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('268',NULL,'Georgina','Flores',48,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('269',NULL,'Efraín','Rodríguez Rubio',41,NULL,'CCCP-Director Científico Área Oceanografía Operacional',1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('27',NULL,'Jairo','Calle',48,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('270',NULL,'Sandra Liliana de La Esperanza','Franco',48,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('271',NULL,'Silvio Andrés','Ordóñez',31,NULL,NULL,34,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('272',NULL,'Martha Lucero','Bastidas',31,NULL,NULL,34,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('273',NULL,'Andrea','Santa Ríos',28,NULL,NULL,70,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('274',NULL,'Hernán Darío','Zamora',32,NULL,NULL,43,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('275',NULL,'Josué Alfredo','Montaña',38,NULL,NULL,20,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('276',NULL,'José Francisco','Torres ',NULL,NULL,NULL,71,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('277',NULL,'Guillermo Enrique','Galindo',NULL,NULL,NULL,72,NULL,NULL,NULL,NULL,'28',NULL,'e-mail_1','e-mail_2'),
 ('278',NULL,'José Augusto','Valencia',20,NULL,NULL,37,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('279',NULL,'Catherine','Díaz Chito',31,NULL,NULL,34,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('28',NULL,'Guillermo','Zambrano',48,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('280',NULL,'Carlos','Ruiz',49,NULL,'CCCP-Pronósticos Meteomarinos',1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('281',NULL,'Anderson','Lemus',49,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('282',NULL,'Yaneth','Morales',20,NULL,NULL,26,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('283',NULL,'Tulia Isabel','Martínez',20,NULL,NULL,37,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('284',NULL,'Claudia','Dagua',31,NULL,NULL,34,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('285',NULL,'José Luis','Valencia',46,NULL,NULL,73,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('286',NULL,'Luz Jenny','Aguirre Tobón',46,NULL,NULL,74,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('287',NULL,'Ernesto','Guzmán Jr.',46,NULL,NULL,74,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('288',NULL,'Carolina','García',20,NULL,NULL,16,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('289',NULL,'Enrique','Rojas',38,NULL,NULL,20,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('29',NULL,'Rodrigo','Ferreira',48,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('290',NULL,'Hermann','León Rincón',44,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('291',NULL,'David','Beltrán Peñaranda',49,NULL,NULL,1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('292',NULL,'Edgar','Pérez Porras',49,NULL,'CCCP-Auxiliar de Laboratorio de Química',1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('293',NULL,'Jeannet','León',NULL,NULL,NULL,72,NULL,NULL,NULL,NULL,'28',NULL,'e-mail_1','e-mail_2'),
 ('294',NULL,'Julio César','Herrera',20,NULL,NULL,18,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('295',NULL,'Oscar','Martinez R.',NULL,NULL,NULL,40,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('296',NULL,'Milena','Lozano',21,NULL,NULL,36,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('297',NULL,'Jorge','Donoso',NULL,NULL,NULL,75,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('298',NULL,'Elizabeth','Hernández O.',21,NULL,NULL,18,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('299',NULL,'Alba Marina','Cobo V.',21,NULL,NULL,37,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('3',NULL,'Gustavo','Guardo',48,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('30',NULL,'Alfonso','Clavijo',48,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('300',NULL,'Juan ','Camacho',49,NULL,'CCCP-Protección del Medio Marino',1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('301',NULL,'Alexander','Palomino',49,NULL,'CCCP-Administrador Base de Datos',1,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('302',NULL,'Tatiana','Espinosa Montoya',29,NULL,NULL,41,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('31',NULL,'Ernesto','Barriga',37,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('32',NULL,'Iván','Guerrero',21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('33',NULL,'Vicente','Rodríguez',21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('34',NULL,'Arturo','Bermúdez',22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('35',NULL,'Efraín','Ángel Cárdenas',20,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('36',NULL,'Jaime','Prada',38,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('37',NULL,'Alfonso','Lozano Julio',44,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('38',NULL,'Jorge','Orjuela Pérez',44,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('39',NULL,'David René','Moreno',40,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('4',NULL,'Armando','Hernández',20,NULL,NULL,50,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('40',NULL,'Darío','De la Torre',40,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('41',NULL,'Jean','Allain',21,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('42',NULL,'Nicolás','Paz',21,NULL,NULL,28,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('43',NULL,'Tito','Machado',21,NULL,NULL,28,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('44',NULL,'Jorge','Thous',21,NULL,NULL,29,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('45',NULL,'Sebastián','San Juan',21,NULL,NULL,29,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('46',NULL,'Domingo','Ramos',48,NULL,NULL,29,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('47',NULL,'Héctor','Egel',48,NULL,NULL,29,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('48',NULL,'Luis','Del Castillo',48,NULL,NULL,29,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('49',NULL,'Jorge','Monroy',21,NULL,NULL,53,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('5',NULL,'Rubi','Mejia',48,NULL,NULL,37,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('50',NULL,'José Ignacio','Borrero',45,NULL,NULL,37,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('51',NULL,'Daniel','Dossman',21,NULL,NULL,37,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('52',NULL,'Alfonso','Hernández',23,NULL,NULL,37,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('53',NULL,'Jaime','Cantera',21,NULL,NULL,37,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('54',NULL,'Fernando','Castro',21,NULL,NULL,37,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('55',NULL,'Jairo','Betancourt',21,NULL,NULL,37,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('56',NULL,'Efraín','Rubio',21,NULL,NULL,37,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('57',NULL,'Américo','Quintero',21,NULL,NULL,37,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('58',NULL,'Rafael','Steer Ruiz',44,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('59',NULL,'Ricardo','Parra Suárez',40,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('6',NULL,'Francisco','Pineda',20,NULL,NULL,37,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('60',NULL,'Bertha Cecilia','De Monsalve',21,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('61',NULL,'Consuelo','Carbonell',21,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('62',NULL,'David','Cortesero Olea',48,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('63',NULL,'Oswaldo','Mirazalde Vanegas',NULL,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('64',NULL,'Narda','Nates',NULL,NULL,NULL,53,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('65',NULL,'Iván','Rey',NULL,NULL,NULL,53,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('66',NULL,'Jorge','Trujillo Camacho',NULL,NULL,NULL,53,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('67',NULL,'Marco Antonio','Gómez',48,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('68',NULL,'Patrick','Lesueur',24,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('69',NULL,'Antonio','Bonfante',49,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('7',NULL,'Yesid','Ponce',48,NULL,NULL,51,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('70',NULL,'Hernando','Llamas',NULL,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('71',NULL,'Plinio','Romero',NULL,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('72',NULL,'Rodrigo','Díaz Granados',NULL,NULL,NULL,35,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('73',NULL,'Hernando','Correa',NULL,NULL,NULL,35,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('74',NULL,'Tomás','García',NULL,NULL,NULL,35,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('75',NULL,'Miguel','De Luque',NULL,NULL,NULL,35,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('76',NULL,'Luis','Obregón',NULL,NULL,NULL,35,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('77',NULL,'Martha','Muñoz',NULL,NULL,NULL,35,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('78',NULL,'Omar','Del Río',49,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('79',NULL,'Álvaro','González Hernández',NULL,NULL,NULL,54,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('8',NULL,'Jairo','Sánchez',48,NULL,NULL,42,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('80',NULL,'Gabriel','Meidinder',24,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('81',NULL,'Rubén A.','Cobariza',44,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('82',NULL,'Eusebio','Cabrales',44,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('83',NULL,'Francisco','Castillo',20,NULL,NULL,3,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('84',NULL,'Luis','Mendoza',25,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('85',NULL,'Amparo','Molina',24,NULL,NULL,3,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('86',NULL,'Mark','Elhayar',24,NULL,NULL,3,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('87',NULL,'Carmen','Parada',21,NULL,NULL,42,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('88',NULL,'Jorge E.','García Riaño',38,NULL,NULL,55,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('89',NULL,'Hugo','Cárdenas',38,NULL,NULL,55,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('9',NULL,'Harold','Santa Cruz Moncayo',40,NULL,NULL,49,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('90',NULL,'Liliana','Marín',NULL,NULL,NULL,42,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('91',NULL,'William Fernando','Parra',21,NULL,NULL,53,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('92',NULL,'Jesús','Garay',21,NULL,NULL,3,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('93',NULL,'Rubén','Serrano',44,NULL,NULL,3,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('94',NULL,'Oscar','Neira',49,NULL,NULL,3,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('95',NULL,'José','Godoy',49,NULL,NULL,3,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('97',NULL,'Luís','Peña',38,NULL,NULL,55,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('98',NULL,'Guillermo','Pulido',38,NULL,NULL,55,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2'),
 ('99',NULL,'Gabriel','Luna',21,NULL,NULL,53,NULL,NULL,NULL,NULL,'22',NULL,'e-mail_1','e-mail_2');
/*!40000 ALTER TABLE `inv_chief_scientist` ENABLE KEYS */;


--
-- Definition of table `inv_chief_scientist_cruise`
--

DROP TABLE IF EXISTS `inv_chief_scientist_cruise`;
CREATE TABLE `inv_chief_scientist_cruise` (
  `id_chief_scientist` char(11) NOT NULL,
  `id_cruise` int(11) NOT NULL,
  PRIMARY KEY  (`id_chief_scientist`,`id_cruise`),
  KEY `FK926476A495C09F07` (`id_chief_scientist`),
  KEY `FK926476A4F0F27186` (`id_cruise`),
  CONSTRAINT `FK926476A495C09F07` FOREIGN KEY (`id_chief_scientist`) REFERENCES `inv_chief_scientist` (`Id`),
  CONSTRAINT `FK926476A4F0F27186` FOREIGN KEY (`id_cruise`) REFERENCES `inv_cruise_inventory` (`id_cruise`),
  CONSTRAINT `FK_inv_chief_scientist_cruise_1` FOREIGN KEY (`id_chief_scientist`) REFERENCES `inv_chief_scientist` (`Id`),
  CONSTRAINT `FK_inv_chief_scientist_cruise_2` FOREIGN KEY (`id_cruise`) REFERENCES `inv_cruise_inventory` (`id_cruise`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_chief_scientist_cruise`
--

/*!40000 ALTER TABLE `inv_chief_scientist_cruise` DISABLE KEYS */;
INSERT INTO `inv_chief_scientist_cruise` (`id_chief_scientist`,`id_cruise`) VALUES 
 ('1',1),
 ('10',1),
 ('11',1),
 ('12',1),
 ('13',1),
 ('14',1),
 ('15',1),
 ('16',1),
 ('17',1),
 ('18',1),
 ('19',1),
 ('2',1),
 ('20',1),
 ('21',1),
 ('3',1),
 ('4',1),
 ('5',1),
 ('6',1),
 ('7',1),
 ('8',1),
 ('9',1),
 ('35',4),
 ('38',4),
 ('39',4),
 ('40',4),
 ('41',4),
 ('42',4),
 ('43',4),
 ('44',4),
 ('45',4),
 ('46',4),
 ('47',4),
 ('48',4),
 ('49',4),
 ('50',4),
 ('51',4),
 ('52',4),
 ('53',4),
 ('54',4),
 ('55',4),
 ('56',4),
 ('57',4),
 ('9',4),
 ('35',5),
 ('40',5),
 ('58',5),
 ('59',5),
 ('60',5),
 ('61',5),
 ('25',6),
 ('35',6),
 ('40',6),
 ('59',6),
 ('61',6),
 ('62',6),
 ('63',6),
 ('64',6),
 ('65',6),
 ('66',6),
 ('24',7),
 ('49',7),
 ('67',7),
 ('68',7),
 ('69',7),
 ('70',7),
 ('71',7),
 ('72',7),
 ('73',7),
 ('74',7),
 ('75',7),
 ('76',7),
 ('77',7),
 ('67',9),
 ('80',10),
 ('81',11),
 ('82',11),
 ('83',11),
 ('84',11),
 ('85',11),
 ('86',11),
 ('87',11),
 ('88',11),
 ('89',11),
 ('90',11),
 ('83',12),
 ('91',12),
 ('92',13),
 ('100',16),
 ('101',16),
 ('102',16),
 ('103',16),
 ('104',16),
 ('105',16),
 ('106',16),
 ('70',16),
 ('83',16),
 ('93',16),
 ('94',16),
 ('95',16),
 ('97',16),
 ('98',16),
 ('99',16),
 ('107',19),
 ('108',19),
 ('109',19),
 ('110',19),
 ('111',19),
 ('112',19),
 ('113',19),
 ('114',19),
 ('115',19),
 ('116',19),
 ('117',19),
 ('118',19),
 ('119',19),
 ('120',19),
 ('121',19),
 ('122',19),
 ('83',19),
 ('107',20),
 ('109',20),
 ('123',20),
 ('124',20),
 ('125',20),
 ('126',20),
 ('127',20),
 ('128',20),
 ('129',20),
 ('130',20),
 ('131',20),
 ('132',20),
 ('133',20),
 ('134',20),
 ('135',20),
 ('83',20),
 ('101',21),
 ('102',21),
 ('111',21),
 ('124',21),
 ('136',21),
 ('137',21),
 ('138',21),
 ('139',21),
 ('140',21),
 ('141',21),
 ('142',21),
 ('143',21),
 ('144',21),
 ('145',21),
 ('146',21),
 ('147',21),
 ('148',21),
 ('149',21),
 ('150',21),
 ('151',21),
 ('152',21),
 ('153',21),
 ('154',21),
 ('155',21),
 ('156',21),
 ('157',21),
 ('158',21),
 ('159',21),
 ('160',21),
 ('161',21),
 ('83',21),
 ('101',22),
 ('102',22),
 ('136',22),
 ('137',22),
 ('138',22),
 ('162',22),
 ('163',22),
 ('164',22),
 ('165',22),
 ('166',22),
 ('167',22),
 ('168',22),
 ('169',22),
 ('170',22),
 ('171',22),
 ('172',22),
 ('173',22),
 ('174',22),
 ('89',22),
 ('94',22),
 ('107',23),
 ('136',23),
 ('175',23),
 ('176',23),
 ('177',23),
 ('178',23),
 ('179',23),
 ('180',23),
 ('181',23),
 ('183',23),
 ('184',23),
 ('185',23),
 ('186',23),
 ('187',23),
 ('195',23),
 ('177',24),
 ('178',24),
 ('183',24),
 ('187',24),
 ('188',24),
 ('189',24),
 ('190',24),
 ('191',24),
 ('192',24),
 ('193',24),
 ('194',24),
 ('177',25),
 ('178',25),
 ('183',25),
 ('187',25),
 ('188',25),
 ('189',25),
 ('190',25),
 ('193',25),
 ('195',25),
 ('196',25),
 ('197',25),
 ('177',26),
 ('178',26),
 ('187',26),
 ('190',26),
 ('195',26),
 ('197',26),
 ('198',26),
 ('199',26),
 ('200',26),
 ('201',26),
 ('183',27),
 ('187',27),
 ('189',27),
 ('195',27),
 ('202',27),
 ('203',27),
 ('204',27),
 ('205',27),
 ('177',28),
 ('187',28),
 ('206',28),
 ('207',28),
 ('208',28),
 ('183',29),
 ('187',29),
 ('189',29),
 ('200',29),
 ('202',29),
 ('203',29),
 ('206',29),
 ('209',29),
 ('210',29),
 ('211',29),
 ('212',29),
 ('187',30),
 ('189',30),
 ('195',30),
 ('200',30),
 ('207',30),
 ('213',30),
 ('214',30),
 ('215',30),
 ('216',30),
 ('217',30),
 ('177',31),
 ('195',31),
 ('200',31),
 ('218',31),
 ('219',31),
 ('220',31),
 ('221',31),
 ('177',32),
 ('183',32),
 ('189',32),
 ('195',32),
 ('220',32),
 ('222',32),
 ('223',32),
 ('224',32),
 ('177',33),
 ('195',33),
 ('197',33),
 ('218',33),
 ('223',33),
 ('225',33),
 ('226',33),
 ('227',33),
 ('189',34),
 ('195',35),
 ('200',35),
 ('218',35),
 ('223',35),
 ('228',35),
 ('229',35),
 ('189',36),
 ('195',36),
 ('197',36),
 ('200',36),
 ('218',36),
 ('222',36),
 ('229',36),
 ('230',36),
 ('231',36),
 ('232',36),
 ('233',36),
 ('234',36),
 ('235',36),
 ('236',36),
 ('237',36),
 ('238',36),
 ('239',36),
 ('240',36),
 ('241',36),
 ('242',36),
 ('243',36),
 ('244',36),
 ('195',37),
 ('200',37),
 ('232',37),
 ('238',37),
 ('245',37),
 ('246',37),
 ('247',37),
 ('248',37),
 ('249',37),
 ('250',37),
 ('251',37),
 ('252',37),
 ('253',37),
 ('254',37),
 ('255',37),
 ('256',37),
 ('257',37),
 ('258',37),
 ('259',37),
 ('218',38),
 ('232',38),
 ('245',38),
 ('260',38),
 ('261',38),
 ('262',38),
 ('263',38),
 ('264',38),
 ('265',38),
 ('266',38),
 ('267',38),
 ('268',38),
 ('218',39),
 ('219',39),
 ('243',39),
 ('245',39),
 ('262',39),
 ('269',39),
 ('270',39),
 ('271',39),
 ('272',39),
 ('273',39),
 ('274',39),
 ('101',40),
 ('218',40),
 ('219',40),
 ('232',40),
 ('245',40),
 ('262',40),
 ('275',40),
 ('276',40),
 ('277',40),
 ('278',40),
 ('279',40),
 ('218',41),
 ('219',41),
 ('262',41),
 ('264',41),
 ('269',41),
 ('270',41),
 ('280',41),
 ('281',41),
 ('282',41),
 ('283',41),
 ('284',41),
 ('285',41),
 ('286',41),
 ('287',41),
 ('288',41),
 ('289',41),
 ('219',42),
 ('232',42),
 ('262',42),
 ('280',42),
 ('282',42),
 ('283',42),
 ('290',42),
 ('291',42),
 ('292',42),
 ('293',42),
 ('101',43),
 ('232',43),
 ('262',43),
 ('267',43),
 ('283',43),
 ('291',43),
 ('292',43),
 ('294',43),
 ('232',44),
 ('262',44),
 ('283',44),
 ('291',44),
 ('292',44),
 ('294',44),
 ('295',44),
 ('296',44),
 ('232',45),
 ('262',45),
 ('283',45),
 ('291',45),
 ('292',45),
 ('294',45),
 ('232',46),
 ('262',46),
 ('283',46),
 ('291',46),
 ('292',46),
 ('294',46),
 ('190',47),
 ('292',47),
 ('297',47),
 ('298',47),
 ('299',47),
 ('300',47),
 ('301',47),
 ('302',47),
 ('1',52),
 ('10',52),
 ('100',52),
 ('101',52),
 ('102',52),
 ('103',52),
 ('104',52),
 ('105',52),
 ('106',52),
 ('107',52),
 ('108',52),
 ('109',52),
 ('11',52),
 ('110',52),
 ('111',52),
 ('112',52),
 ('113',52),
 ('114',52),
 ('115',52),
 ('116',52),
 ('117',52),
 ('118',52),
 ('119',52),
 ('12',52),
 ('120',52),
 ('121',52),
 ('122',52),
 ('123',52),
 ('124',52),
 ('125',52),
 ('126',52),
 ('127',52),
 ('128',52),
 ('129',52),
 ('13',52),
 ('130',52),
 ('131',52),
 ('132',52),
 ('133',52),
 ('134',52),
 ('135',52),
 ('136',52),
 ('137',52),
 ('138',52),
 ('139',52),
 ('14',52),
 ('140',52),
 ('141',52),
 ('142',52),
 ('143',52),
 ('144',52),
 ('145',52),
 ('146',52),
 ('147',52),
 ('148',52),
 ('149',52),
 ('15',52),
 ('150',52),
 ('151',52),
 ('152',52),
 ('153',52),
 ('154',52),
 ('155',52),
 ('156',52),
 ('157',52),
 ('158',52),
 ('159',52),
 ('16',52),
 ('160',52),
 ('161',52),
 ('162',52),
 ('163',52),
 ('164',52),
 ('165',52),
 ('166',52),
 ('167',52),
 ('168',52),
 ('169',52),
 ('17',52),
 ('170',52),
 ('171',52),
 ('172',52),
 ('173',52),
 ('174',52),
 ('175',52),
 ('176',52),
 ('177',52),
 ('178',52),
 ('179',52),
 ('18',52),
 ('180',52),
 ('181',52),
 ('183',52),
 ('184',52),
 ('185',52),
 ('186',52),
 ('187',52),
 ('188',52),
 ('189',52),
 ('19',52),
 ('190',52),
 ('191',52),
 ('192',52),
 ('193',52),
 ('194',52),
 ('195',52),
 ('196',52),
 ('197',52),
 ('198',52),
 ('199',52),
 ('2',52),
 ('20',52),
 ('200',52),
 ('201',52),
 ('202',52),
 ('203',52),
 ('204',52),
 ('205',52),
 ('206',52),
 ('207',52),
 ('208',52),
 ('209',52),
 ('21',52),
 ('210',52),
 ('211',52),
 ('212',52),
 ('213',52),
 ('214',52),
 ('215',52),
 ('216',52),
 ('217',52),
 ('218',52),
 ('219',52),
 ('22',52),
 ('220',52),
 ('221',52),
 ('222',52),
 ('223',52),
 ('224',52),
 ('225',52),
 ('226',52),
 ('227',52),
 ('228',52),
 ('229',52),
 ('23',52),
 ('230',52),
 ('231',52),
 ('232',52),
 ('233',52),
 ('234',52),
 ('235',52),
 ('236',52),
 ('237',52),
 ('238',52),
 ('239',52),
 ('24',52),
 ('240',52),
 ('241',52),
 ('242',52),
 ('243',52),
 ('244',52),
 ('245',52),
 ('246',52),
 ('247',52),
 ('248',52),
 ('249',52),
 ('25',52),
 ('250',52),
 ('251',52),
 ('252',52),
 ('253',52),
 ('254',52),
 ('255',52),
 ('256',52),
 ('257',52),
 ('258',52),
 ('259',52),
 ('26',52),
 ('260',52),
 ('261',52),
 ('262',52),
 ('263',52),
 ('264',52),
 ('265',52),
 ('266',52),
 ('267',52),
 ('268',52),
 ('269',52),
 ('27',52),
 ('270',52),
 ('271',52),
 ('272',52),
 ('273',52),
 ('274',52),
 ('275',52),
 ('276',52),
 ('277',52),
 ('278',52),
 ('279',52),
 ('28',52),
 ('280',52),
 ('281',52),
 ('282',52),
 ('283',52),
 ('284',52),
 ('285',52),
 ('286',52),
 ('287',52),
 ('288',52),
 ('289',52),
 ('29',52),
 ('290',52),
 ('291',52),
 ('292',52),
 ('293',52),
 ('294',52),
 ('295',52),
 ('296',52),
 ('297',52),
 ('298',52),
 ('299',52),
 ('3',52),
 ('30',52),
 ('300',52),
 ('301',52),
 ('302',52),
 ('31',52),
 ('32',52),
 ('33',52),
 ('34',52),
 ('35',52),
 ('36',52),
 ('37',52),
 ('38',52),
 ('39',52),
 ('4',52),
 ('40',52),
 ('41',52),
 ('42',52),
 ('43',52),
 ('44',52),
 ('45',52),
 ('46',52),
 ('47',52),
 ('48',52),
 ('49',52),
 ('5',52),
 ('50',52),
 ('51',52),
 ('52',52),
 ('53',52),
 ('54',52),
 ('55',52),
 ('56',52),
 ('57',52),
 ('58',52),
 ('59',52),
 ('6',52),
 ('60',52),
 ('61',52),
 ('62',52),
 ('63',52),
 ('64',52),
 ('65',52),
 ('66',52),
 ('67',52),
 ('68',52),
 ('69',52),
 ('7',52),
 ('70',52),
 ('71',52),
 ('72',52),
 ('73',52),
 ('74',52),
 ('75',52),
 ('76',52),
 ('77',52),
 ('78',52),
 ('79',52),
 ('8',52),
 ('80',52),
 ('81',52),
 ('82',52),
 ('83',52),
 ('84',52),
 ('85',52),
 ('86',52),
 ('87',52),
 ('88',52),
 ('89',52),
 ('9',52),
 ('90',52),
 ('91',52),
 ('92',52),
 ('93',52),
 ('94',52),
 ('95',52),
 ('97',52),
 ('98',52),
 ('99',52);
/*!40000 ALTER TABLE `inv_chief_scientist_cruise` ENABLE KEYS */;


--
-- Definition of table `inv_cruise_bodc_category`
--

DROP TABLE IF EXISTS `inv_cruise_bodc_category`;
CREATE TABLE `inv_cruise_bodc_category` (
  `category_code` varchar(4) NOT NULL,
  `id_cruise` int(11) NOT NULL,
  PRIMARY KEY  (`category_code`,`id_cruise`),
  KEY `FKE9E183F5F0F27186` (`id_cruise`),
  KEY `FKE9E183F5903D89AF` (`category_code`),
  CONSTRAINT `FKE9E183F5903D89AF` FOREIGN KEY (`category_code`) REFERENCES `bodc_category` (`CODE`),
  CONSTRAINT `FKE9E183F5F0F27186` FOREIGN KEY (`id_cruise`) REFERENCES `inv_cruise_inventory` (`id_cruise`),
  CONSTRAINT `FK_inv_cruise_bodc_category_1` FOREIGN KEY (`category_code`) REFERENCES `bodc_category` (`CODE`),
  CONSTRAINT `FK_inv_cruise_bodc_category_2` FOREIGN KEY (`id_cruise`) REFERENCES `inv_cruise_inventory` (`id_cruise`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_cruise_bodc_category`
--

/*!40000 ALTER TABLE `inv_cruise_bodc_category` DISABLE KEYS */;
INSERT INTO `inv_cruise_bodc_category` (`category_code`,`id_cruise`) VALUES 
 ('B030',1),
 ('C010',1),
 ('C015',1),
 ('C045',1),
 ('D015',1),
 ('D020',1),
 ('D025',1),
 ('M010',1),
 ('B030',4),
 ('B045',4),
 ('C005',4),
 ('C010',4),
 ('C015',4),
 ('C040',4),
 ('D015',4),
 ('D025',4),
 ('D034',4),
 ('M010',4),
 ('C005',5),
 ('C010',5),
 ('C015',5),
 ('C040',5),
 ('D015',5),
 ('D025',5),
 ('D034',5),
 ('M010',5),
 ('C005',6),
 ('C010',6),
 ('C015',6),
 ('C040',6),
 ('D015',6),
 ('D025',6),
 ('D034',6),
 ('M010',6),
 ('C005',7),
 ('C010',7),
 ('C015',7),
 ('C040',7),
 ('D015',7),
 ('D025',7),
 ('D034',7),
 ('M010',7),
 ('C005',9),
 ('C010',9),
 ('C015',9),
 ('C040',9),
 ('D015',9),
 ('D025',9),
 ('D034',9),
 ('M010',9),
 ('C005',10),
 ('C010',10),
 ('C015',10),
 ('C040',10),
 ('D015',10),
 ('D025',10),
 ('D034',10),
 ('G010',10),
 ('G012',10),
 ('M010',10),
 ('B030',11),
 ('B045',11),
 ('C005',11),
 ('C010',11),
 ('C015',11),
 ('C040',11),
 ('D015',11),
 ('D025',11),
 ('D034',11),
 ('G010',11),
 ('G012',11),
 ('M010',11),
 ('C005',12),
 ('C010',12),
 ('C015',12),
 ('C040',12),
 ('D015',12),
 ('D025',12),
 ('D034',12),
 ('M010',12),
 ('C005',13),
 ('C010',13),
 ('C015',13),
 ('C040',13),
 ('C045',13),
 ('D015',13),
 ('D025',13),
 ('D034',13),
 ('M010',13),
 ('C005',15),
 ('C010',15),
 ('C015',15),
 ('C040',15),
 ('C045',15),
 ('D015',15),
 ('D025',15),
 ('D034',15),
 ('M010',15),
 ('B030',16),
 ('B035',16),
 ('B045',16),
 ('C005',16),
 ('C010',16),
 ('C015',16),
 ('C040',16),
 ('C045',16),
 ('D015',16),
 ('D025',16),
 ('D034',16),
 ('M010',16),
 ('C005',17),
 ('C010',17),
 ('C015',17),
 ('C040',17),
 ('C045',17),
 ('D015',17),
 ('D025',17),
 ('D034',17),
 ('M010',17),
 ('C005',18),
 ('C010',18),
 ('C015',18),
 ('C040',18),
 ('C045',18),
 ('D015',18),
 ('D025',18),
 ('D034',18),
 ('M010',18),
 ('B030',19),
 ('B045',19),
 ('C005',19),
 ('C010',19),
 ('C015',19),
 ('C040',19),
 ('C045',19),
 ('D015',19),
 ('D025',19),
 ('D034',19),
 ('M010',19),
 ('B030',20),
 ('B045',20),
 ('C005',20),
 ('C010',20),
 ('C015',20),
 ('C040',20),
 ('C045',20),
 ('D015',20),
 ('D025',20),
 ('D034',20),
 ('M010',20),
 ('B030',21),
 ('B045',21),
 ('C005',21),
 ('C010',21),
 ('C015',21),
 ('C040',21),
 ('C045',21),
 ('D015',21),
 ('D025',21),
 ('D034',21),
 ('M010',21),
 ('B030',22),
 ('B045',22),
 ('C005',22),
 ('C010',22),
 ('C015',22),
 ('C040',22),
 ('C045',22),
 ('D015',22),
 ('D025',22),
 ('D034',22),
 ('M010',22),
 ('B030',23),
 ('B035',23),
 ('B045',23),
 ('C005',23),
 ('C010',23),
 ('C015',23),
 ('C040',23),
 ('C045',23),
 ('D015',23),
 ('D025',23),
 ('D034',23),
 ('M010',23),
 ('B030',24),
 ('B045',24),
 ('C005',24),
 ('C010',24),
 ('C015',24),
 ('C040',24),
 ('C045',24),
 ('D015',24),
 ('D025',24),
 ('D034',24),
 ('M010',24),
 ('B030',25),
 ('B035',25),
 ('B045',25),
 ('C005',25),
 ('C010',25),
 ('C015',25),
 ('C040',25),
 ('C045',25),
 ('D015',25),
 ('D025',25),
 ('D034',25),
 ('M010',25),
 ('B030',26),
 ('B035',26),
 ('B045',26),
 ('C005',26),
 ('C010',26),
 ('C015',26),
 ('C040',26),
 ('C045',26),
 ('D015',26),
 ('D025',26),
 ('D034',26),
 ('M010',26),
 ('B030',27),
 ('B035',27),
 ('B045',27),
 ('C005',27),
 ('C010',27),
 ('C015',27),
 ('C040',27),
 ('C045',27),
 ('D015',27),
 ('D025',27),
 ('D034',27),
 ('M010',27),
 ('B030',28),
 ('B035',28),
 ('B045',28),
 ('C005',28),
 ('C010',28),
 ('C015',28),
 ('C040',28),
 ('C045',28),
 ('D015',28),
 ('D025',28),
 ('D034',28),
 ('M010',28),
 ('B030',29),
 ('B035',29),
 ('B045',29),
 ('C005',29),
 ('C010',29),
 ('C015',29),
 ('C040',29),
 ('C045',29),
 ('D015',29),
 ('D025',29),
 ('D034',29),
 ('M010',29),
 ('B030',30),
 ('B035',30),
 ('B045',30),
 ('C005',30),
 ('C010',30),
 ('C015',30),
 ('C040',30),
 ('C045',30),
 ('D015',30),
 ('D025',30),
 ('D034',30),
 ('M010',30),
 ('B030',31),
 ('B035',31),
 ('B045',31),
 ('C005',31),
 ('C010',31),
 ('C015',31),
 ('C040',31),
 ('C045',31),
 ('D015',31),
 ('D025',31),
 ('D034',31),
 ('M010',31),
 ('B030',32),
 ('B035',32),
 ('B045',32),
 ('C005',32),
 ('C010',32),
 ('C015',32),
 ('C040',32),
 ('C045',32),
 ('D015',32),
 ('D025',32),
 ('D034',32),
 ('M010',32),
 ('B030',33),
 ('B035',33),
 ('B045',33),
 ('C005',33),
 ('C010',33),
 ('C015',33),
 ('C040',33),
 ('C045',33),
 ('D015',33),
 ('D025',33),
 ('D034',33),
 ('M010',33),
 ('B030',34),
 ('B035',34),
 ('B045',34),
 ('C005',34),
 ('C010',34),
 ('C015',34),
 ('C040',34),
 ('C045',34),
 ('D015',34),
 ('D025',34),
 ('D034',34),
 ('M010',34),
 ('B030',35),
 ('B035',35),
 ('B045',35),
 ('C005',35),
 ('C010',35),
 ('C015',35),
 ('C040',35),
 ('C045',35),
 ('D015',35),
 ('D025',35),
 ('D034',35),
 ('M010',35),
 ('B030',36),
 ('B035',36),
 ('B045',36),
 ('C005',36),
 ('C010',36),
 ('C015',36),
 ('C040',36),
 ('C045',36),
 ('D015',36),
 ('D025',36),
 ('D034',36),
 ('M010',36),
 ('B030',37),
 ('B035',37),
 ('B045',37),
 ('C005',37),
 ('C010',37),
 ('C015',37),
 ('C040',37),
 ('C045',37),
 ('D015',37),
 ('D025',37),
 ('D034',37),
 ('M010',37),
 ('B030',38),
 ('B035',38),
 ('B045',38),
 ('C005',38),
 ('C010',38),
 ('C015',38),
 ('C040',38),
 ('C045',38),
 ('D015',38),
 ('D025',38),
 ('D034',38),
 ('M010',38),
 ('B030',39),
 ('B035',39),
 ('B045',39),
 ('C005',39),
 ('C010',39),
 ('C015',39),
 ('C040',39),
 ('C045',39),
 ('D015',39),
 ('D025',39),
 ('M010',39),
 ('B030',40),
 ('B035',40),
 ('B045',40),
 ('C005',40),
 ('C010',40),
 ('C015',40),
 ('C040',40),
 ('C045',40),
 ('D015',40),
 ('D025',40),
 ('M010',40),
 ('B030',41),
 ('B035',41),
 ('B045',41),
 ('C005',41),
 ('C010',41),
 ('C015',41),
 ('C040',41),
 ('C045',41),
 ('D015',41),
 ('D025',41),
 ('M010',41),
 ('B030',42),
 ('B035',42),
 ('B045',42),
 ('C005',42),
 ('C010',42),
 ('C015',42),
 ('C040',42),
 ('C045',42),
 ('D015',42),
 ('D025',42),
 ('M010',42),
 ('B015',43),
 ('B030',43),
 ('B035',43),
 ('B045',43),
 ('C005',43),
 ('C010',43),
 ('C015',43),
 ('C040',43),
 ('C045',43),
 ('D015',43),
 ('D025',43),
 ('M010',43),
 ('B015',44),
 ('B030',44),
 ('B035',44),
 ('B045',44),
 ('C005',44),
 ('C010',44),
 ('C015',44),
 ('C040',44),
 ('C045',44),
 ('D015',44),
 ('D025',44),
 ('M010',44),
 ('B015',45),
 ('B030',45),
 ('B035',45),
 ('B045',45),
 ('C005',45),
 ('C010',45),
 ('C015',45),
 ('C040',45),
 ('C045',45),
 ('D015',45),
 ('D025',45),
 ('M010',45),
 ('B015',46),
 ('B030',46),
 ('B035',46),
 ('B045',46),
 ('C005',46),
 ('C010',46),
 ('C015',46),
 ('C040',46),
 ('C045',46),
 ('D015',46),
 ('D025',46),
 ('M010',46),
 ('B015',47),
 ('B030',47),
 ('B035',47),
 ('B045',47),
 ('C005',47),
 ('C010',47),
 ('C015',47),
 ('C040',47),
 ('C045',47),
 ('D015',47),
 ('D025',47),
 ('M010',47),
 ('B005',52),
 ('B007',52),
 ('B015',52),
 ('B020',52),
 ('B025',52),
 ('B027',52),
 ('B030',52),
 ('B035',52),
 ('B040',52),
 ('B045',52),
 ('C003',52),
 ('C005',52),
 ('C010',52),
 ('C015',52),
 ('C017',52),
 ('C020',52),
 ('C025',52),
 ('C030',52),
 ('C035',52),
 ('C040',52),
 ('C045',52),
 ('C050',52),
 ('C055',52),
 ('C060',52),
 ('C065',52),
 ('D005',52),
 ('D015',52),
 ('D020',52),
 ('D025',52),
 ('D030',52),
 ('D032',52),
 ('D034',52),
 ('G005',52),
 ('G010',52),
 ('G012',52),
 ('G015',52),
 ('G020',52),
 ('G025',52),
 ('G030',52),
 ('G035',52),
 ('M005',52),
 ('M010',52),
 ('M015',52),
 ('O005',52),
 ('O010',52),
 ('T001',52),
 ('Z005',52),
 ('Z010',52);
/*!40000 ALTER TABLE `inv_cruise_bodc_category` ENABLE KEYS */;


--
-- Definition of table `inv_cruise_institutions`
--

DROP TABLE IF EXISTS `inv_cruise_institutions`;
CREATE TABLE `inv_cruise_institutions` (
  `Id_institution` int(10) unsigned NOT NULL,
  `id_cruise` int(11) NOT NULL,
  `relation_type` char(2) NOT NULL,
  PRIMARY KEY  (`Id_institution`,`id_cruise`,`relation_type`),
  KEY `FKE06A7B97F0F27186` (`id_cruise`),
  KEY `FKE06A7B975EC25309` (`Id_institution`),
  CONSTRAINT `FKE06A7B975EC25309` FOREIGN KEY (`Id_institution`) REFERENCES `inv_institutions` (`Id_institution`),
  CONSTRAINT `FKE06A7B97F0F27186` FOREIGN KEY (`id_cruise`) REFERENCES `inv_cruise_inventory` (`id_cruise`),
  CONSTRAINT `FK_inv_cruise_institutions_1` FOREIGN KEY (`Id_institution`) REFERENCES `inv_institutions` (`Id_institution`),
  CONSTRAINT `FK_inv_cruise_institutions_2` FOREIGN KEY (`id_cruise`) REFERENCES `inv_cruise_inventory` (`id_cruise`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_cruise_institutions`
--

/*!40000 ALTER TABLE `inv_cruise_institutions` DISABLE KEYS */;
INSERT INTO `inv_cruise_institutions` (`Id_institution`,`id_cruise`,`relation_type`) VALUES 
 (11,1,'FN'),
 (37,1,'PA'),
 (42,1,'PA'),
 (49,1,'FN'),
 (49,1,'PA'),
 (50,1,'PA'),
 (51,1,'PA'),
 (11,4,'FN'),
 (28,4,'PA'),
 (29,4,'PA'),
 (37,4,'PA'),
 (49,4,'FN'),
 (49,4,'PA'),
 (53,4,'PA'),
 (11,5,'FN'),
 (49,5,'FN'),
 (49,5,'PA'),
 (11,6,'FN'),
 (49,6,'FN'),
 (49,6,'PA'),
 (53,6,'PA'),
 (11,7,'FN'),
 (35,7,'PA'),
 (49,7,'FN'),
 (49,7,'PA'),
 (53,7,'PA'),
 (11,9,'FN'),
 (49,9,'FN'),
 (49,9,'PA'),
 (11,10,'FN'),
 (49,10,'FN'),
 (49,10,'PA'),
 (3,11,'PA'),
 (11,11,'FN'),
 (42,11,'PA'),
 (49,11,'FN'),
 (49,11,'PA'),
 (55,11,'PA'),
 (3,12,'PA'),
 (11,12,'FN'),
 (49,12,'FN'),
 (53,12,'PA'),
 (3,13,'PA'),
 (11,13,'FN'),
 (49,13,'FN'),
 (11,15,'FN'),
 (49,15,'FN'),
 (3,16,'PA'),
 (11,16,'FN'),
 (37,16,'PA'),
 (42,16,'PA'),
 (49,16,'FN'),
 (49,16,'PA'),
 (53,16,'PA'),
 (55,16,'PA'),
 (56,16,'PA'),
 (11,17,'FN'),
 (49,17,'FN'),
 (11,18,'FN'),
 (49,18,'FN'),
 (3,19,'PA'),
 (11,19,'FN'),
 (37,19,'PA'),
 (42,19,'PA'),
 (49,19,'FN'),
 (53,19,'PA'),
 (55,19,'PA'),
 (57,19,'PA'),
 (3,20,'PA'),
 (11,20,'FN'),
 (37,20,'PA'),
 (42,20,'PA'),
 (49,20,'FN'),
 (55,20,'PA'),
 (58,20,'PA'),
 (59,20,'PA'),
 (1,21,'PA'),
 (3,21,'PA'),
 (11,21,'FN'),
 (37,21,'PA'),
 (49,21,'PA'),
 (55,21,'PA'),
 (60,21,'PA'),
 (62,21,'PA'),
 (1,22,'PA'),
 (3,22,'PA'),
 (11,22,'FN'),
 (42,22,'PA'),
 (49,22,'FN'),
 (49,22,'PA'),
 (55,22,'PA'),
 (61,22,'PA'),
 (62,22,'PA'),
 (1,23,'PA'),
 (3,23,'PA'),
 (11,23,'FN'),
 (49,23,'FN'),
 (49,23,'PA'),
 (53,23,'PA'),
 (1,24,'PA'),
 (11,24,'FN'),
 (49,24,'FN'),
 (49,24,'PA'),
 (53,24,'PA'),
 (1,25,'PA'),
 (11,25,'FN'),
 (49,25,'FN'),
 (49,25,'PA'),
 (53,25,'PA'),
 (1,26,'PA'),
 (11,26,'FN'),
 (49,26,'FN'),
 (49,26,'PA'),
 (51,26,'PA'),
 (53,26,'PA'),
 (1,27,'PA'),
 (11,27,'FN'),
 (49,27,'FN'),
 (49,27,'PA'),
 (53,27,'PA'),
 (63,27,'PA'),
 (1,28,'PA'),
 (11,28,'FN'),
 (49,28,'FN'),
 (49,28,'PA'),
 (53,28,'PA'),
 (1,29,'PA'),
 (11,29,'FN'),
 (20,29,'PA'),
 (42,29,'PA'),
 (49,29,'FN'),
 (49,29,'PA'),
 (51,29,'PA'),
 (53,29,'PA'),
 (1,30,'PA'),
 (11,30,'FN'),
 (49,30,'FN'),
 (49,30,'PA'),
 (53,30,'PA'),
 (64,30,'PA'),
 (1,31,'PA'),
 (11,31,'FN'),
 (49,31,'FN'),
 (49,31,'PA'),
 (65,31,'PA'),
 (1,32,'PA'),
 (11,32,'FN'),
 (49,32,'FN'),
 (49,32,'PA'),
 (66,32,'PA'),
 (1,33,'PA'),
 (11,33,'FN'),
 (49,33,'FN'),
 (49,33,'PA'),
 (53,33,'PA'),
 (11,34,'FN'),
 (49,34,'FN'),
 (1,35,'PA'),
 (11,35,'FN'),
 (49,35,'FN'),
 (1,36,'PA'),
 (11,36,'FN'),
 (20,36,'PA'),
 (22,36,'PA'),
 (49,36,'FN'),
 (49,36,'PA'),
 (67,36,'PA'),
 (68,36,'PA'),
 (1,37,'PA'),
 (11,37,'FN'),
 (20,37,'PA'),
 (22,37,'PA'),
 (37,37,'PA'),
 (40,37,'PA'),
 (49,37,'FN'),
 (49,37,'PA'),
 (69,37,'PA'),
 (1,38,'PA'),
 (11,38,'FN'),
 (16,38,'PA'),
 (18,38,'PA'),
 (22,38,'PA'),
 (26,38,'PA'),
 (38,38,'PA'),
 (40,38,'PA'),
 (49,38,'FN'),
 (59,38,'PA'),
 (1,39,'PA'),
 (11,39,'FN'),
 (34,39,'PA'),
 (43,39,'PA'),
 (49,39,'FN'),
 (49,39,'PA'),
 (70,39,'PA'),
 (1,40,'PA'),
 (11,40,'FN'),
 (20,40,'PA'),
 (22,40,'PA'),
 (34,40,'PA'),
 (37,40,'PA'),
 (71,40,'PA'),
 (72,40,'PA'),
 (1,41,'PA'),
 (11,41,'FN'),
 (16,41,'PA'),
 (20,41,'PA'),
 (26,41,'PA'),
 (34,41,'PA'),
 (37,41,'PA'),
 (73,41,'PA'),
 (74,41,'PA'),
 (1,42,'PA'),
 (11,42,'FN'),
 (22,42,'PA'),
 (26,42,'PA'),
 (37,42,'PA'),
 (49,42,'PA'),
 (72,42,'PA'),
 (1,43,'PA'),
 (11,43,'FN'),
 (16,43,'PA'),
 (18,43,'PA'),
 (22,43,'PA'),
 (37,43,'PA'),
 (1,44,'PA'),
 (11,44,'FN'),
 (18,44,'PA'),
 (22,44,'PA'),
 (36,44,'PA'),
 (37,44,'PA'),
 (40,44,'PA'),
 (1,45,'PA'),
 (11,45,'FN'),
 (18,45,'PA'),
 (22,45,'PA'),
 (37,45,'PA'),
 (1,46,'PA'),
 (11,46,'FN'),
 (18,46,'PA'),
 (22,46,'PA'),
 (37,46,'PA'),
 (1,47,'PA'),
 (11,47,'FN'),
 (18,47,'PA'),
 (37,47,'PA'),
 (41,47,'PA'),
 (75,47,'PA'),
 (1,52,'PA'),
 (3,52,'PA'),
 (5,52,'PA'),
 (11,52,'PA'),
 (13,52,'PA'),
 (16,52,'PA'),
 (18,52,'PA'),
 (20,52,'PA'),
 (22,52,'PA'),
 (26,52,'PA'),
 (28,52,'PA'),
 (29,52,'PA'),
 (34,52,'PA'),
 (35,52,'PA'),
 (36,52,'PA'),
 (37,52,'PA'),
 (38,52,'PA'),
 (40,52,'PA'),
 (41,52,'PA'),
 (42,52,'PA'),
 (43,52,'PA'),
 (49,52,'PA'),
 (50,52,'PA'),
 (51,52,'PA'),
 (52,52,'PA'),
 (53,52,'PA'),
 (54,52,'PA'),
 (55,52,'PA'),
 (56,52,'PA'),
 (57,52,'PA'),
 (58,52,'PA'),
 (59,52,'PA'),
 (60,52,'PA'),
 (61,52,'PA'),
 (62,52,'PA'),
 (63,52,'PA'),
 (64,52,'PA'),
 (65,52,'PA'),
 (66,52,'PA'),
 (67,52,'PA'),
 (68,52,'PA'),
 (69,52,'PA'),
 (70,52,'PA'),
 (71,52,'PA'),
 (72,52,'PA'),
 (73,52,'PA'),
 (74,52,'PA'),
 (75,52,'PA');
/*!40000 ALTER TABLE `inv_cruise_institutions` ENABLE KEYS */;


--
-- Definition of table `inv_cruise_inventory`
--

DROP TABLE IF EXISTS `inv_cruise_inventory`;
CREATE TABLE `inv_cruise_inventory` (
  `id_cruise` int(11) NOT NULL auto_increment,
  `ocean_area` smallint(6) default NULL,
  `country` char(2) default NULL,
  `year` smallint(6) default NULL,
  `begin_date` datetime default NULL,
  `end_date` datetime default NULL,
  `ship_name` int(10) unsigned default NULL,
  `cruise_name` varchar(255) default NULL,
  `cruise_objetives` varchar(255) default NULL,
  `status` char(2) default NULL,
  `port_of_departure` char(3) default NULL,
  `port_of_return` char(3) default NULL,
  `uri_report` varchar(255) default NULL,
  `countryPort` varchar(255) default NULL,
  `return_country_port` varchar(255) default NULL,
  `id_report` int(11) default NULL,
  `metadata_title` varchar(150) default NULL,
  `metadata_url` varchar(255) default NULL,
  PRIMARY KEY  (`id_cruise`),
  KEY `FK_inv_cruise_inventory_4` (`country`,`port_of_departure`),
  KEY `FK99F05D0099652656` (`ocean_area`),
  KEY `FK99F05D001D87CD82` (`status`),
  KEY `FK99F05D007B672D02` (`countryPort`,`port_of_departure`),
  KEY `FK99F05D00C92B13D8` (`country`),
  KEY `FK99F05D006739E0F4` (`return_country_port`,`port_of_return`),
  KEY `FK99F05D00299B174F` (`ship_name`),
  KEY `fk_inv_cruise_inventory_inv_report1` (`id_report`),
  KEY `FK99F05D009B204A46` (`id_report`),
  CONSTRAINT `FK99F05D00299B174F` FOREIGN KEY (`ship_name`) REFERENCES `inv_ship_name` (`Id`),
  CONSTRAINT `FK99F05D006739E0F4` FOREIGN KEY (`return_country_port`, `port_of_return`) REFERENCES `unlocode_port` (`Country`, `Location`),
  CONSTRAINT `FK99F05D007B672D02` FOREIGN KEY (`countryPort`, `port_of_departure`) REFERENCES `unlocode_port` (`Country`, `Location`),
  CONSTRAINT `FK99F05D0099652656` FOREIGN KEY (`ocean_area`) REFERENCES `regions` (`id`),
  CONSTRAINT `FK99F05D009B204A46` FOREIGN KEY (`id_report`) REFERENCES `inv_report` (`id_report`),
  CONSTRAINT `FK99F05D00C92B13D8` FOREIGN KEY (`country`) REFERENCES `paises_0101` (`pai_id`),
  CONSTRAINT `FK_inv_cruise_inventory_7` FOREIGN KEY (`ship_name`) REFERENCES `inv_ship_name` (`Id`),
  CONSTRAINT `fk_inv_cruise_inventory_inv_report1` FOREIGN KEY (`id_report`) REFERENCES `inv_report` (`id_report`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_cruise_inventory`
--

/*!40000 ALTER TABLE `inv_cruise_inventory` DISABLE KEYS */;
INSERT INTO `inv_cruise_inventory` (`id_cruise`,`ocean_area`,`country`,`year`,`begin_date`,`end_date`,`ship_name`,`cruise_name`,`cruise_objetives`,`status`,`port_of_departure`,`port_of_return`,`uri_report`,`countryPort`,`return_country_port`,`id_report`,`metadata_title`,`metadata_url`) VALUES 
 (1,1,'22',1970,'1970-03-01 00:00:00','1970-03-30 00:00:00',152,'PACÍFICO I','Objetivos del crucero','0','TCO','TCO',NULL,'22','22',1,NULL,NULL),
 (4,1,'22',1975,'1975-01-31 00:00:00','1975-02-17 00:00:00',152,'PACÍFICO IV - ERFEN I',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (5,1,'22',1976,'1976-04-14 00:00:00','1976-05-17 00:00:00',152,'PACÍFICO V - ERFEN II',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (6,1,'22',1976,'1976-09-23 00:00:00','1976-10-29 00:00:00',152,'PACÍFICO VI - ERFEN III',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (7,1,'22',1977,'1977-10-22 00:00:00','1976-11-22 00:00:00',152,'PACÍFICO VII',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (9,1,'22',1982,'1982-11-01 00:00:00','1982-11-30 00:00:00',156,'PACÍFICO VIII - ERFEN V',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (10,1,'22',1986,'1986-05-01 00:00:00','1986-06-01 00:00:00',155,'PACÍFICO IX - ERFEN VI',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (11,1,'22',1987,'1987-03-24 00:00:00','1987-04-22 00:00:00',155,'PACÍFICO X - ERFEN VII',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (12,1,'22',1988,'1988-03-01 00:00:00','1988-04-01 00:00:00',155,'PACÍFICO XII - ERFEN IX',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (13,1,'22',1988,'1988-11-01 00:00:00','1988-11-30 00:00:00',NULL,'PACÍFICO XIII',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (15,1,'22',1989,'1989-03-01 00:00:00','1989-03-30 00:00:00',NULL,'PACÍFICO XIV- ERFEN XI',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (16,1,'22',1989,'1989-04-01 00:00:00','1989-04-30 00:00:00',156,'PACÍFICO XV - ERFEN XII',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (17,1,'22',1990,'1990-03-01 00:00:00','1990-04-01 00:00:00',NULL,'PACÍFICO XVI',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (18,1,'22',1990,'1990-09-01 00:00:00','1990-09-30 00:00:00',NULL,'PACÍFICO XVII',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (19,1,'22',1991,'1991-03-01 00:00:00','1991-04-01 00:00:00',156,'PACÍFICO XVIII - ERFEN XV',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (20,1,'22',1991,'1991-09-18 00:00:00','1991-10-14 00:00:00',156,'PACÍFICO XIX - ERFEN XVI',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (21,1,'22',1993,'1993-04-12 00:00:00','1993-05-08 00:00:00',155,'ERFEN XX',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (22,1,'22',1993,'1993-10-29 00:00:00','1993-10-20 00:00:00',155,'ERFEN XXI',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (23,1,'22',1994,'1994-11-01 00:00:00','1994-11-30 00:00:00',155,'PACÍFICO XXIV - ERFEN XXII',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (24,1,'22',1996,'1996-06-01 00:00:00','1996-06-30 00:00:00',NULL,'PACÍFICO XXV - ERFEN XXIII',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (25,1,'22',1996,'1996-10-01 00:00:00','1996-10-30 00:00:00',NULL,'PACÍFICO XXVI - ERFEN XXIV',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (26,1,'22',1997,'1997-05-01 00:00:00','1997-05-30 00:00:00',NULL,'PACÍFICO XXVII - ERFEN XXV',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (27,1,'22',1997,'1997-11-01 00:00:00','1997-12-01 00:00:00',156,'PACÍFICO XXVIII - ERFEN XXVI',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (28,1,'22',1998,'1998-05-01 00:00:00','1998-05-30 00:00:00',156,'PACÍFICO XXIX - ERFEN XXVII',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (29,1,'22',1998,'1998-10-01 00:00:00','1988-10-30 00:00:00',156,'PACÍFICO XXX - ERFEN XXVIII',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (30,1,'22',1999,'1999-05-01 00:00:00','1999-05-30 00:00:00',156,'PACÍFICO XXXI - ERFEN XXIX',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (31,1,'22',2000,'2000-05-01 00:00:00','2000-05-30 00:00:00',154,'PACÍFICO XXXI - ERFEN XXX',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (32,1,'22',2000,'2000-11-01 00:00:00','2000-12-01 00:00:00',155,'PACÍFICO XXXII',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (33,1,'22',2001,'2001-06-22 00:00:00','2001-07-12 00:00:00',155,'PACÍFICO XXXIV - ERFEN XXXII',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (34,1,'22',2001,'2001-08-01 00:00:00','2001-09-01 00:00:00',155,'PACÍFICO XXXV-ERFEN XXXIII',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (35,1,'22',2002,'2002-04-01 00:00:00','2002-04-30 00:00:00',156,'PACÍFICO XXXVI - ERFEN XXXIV',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (36,1,'22',2002,'2002-09-01 00:00:00','2002-09-30 00:00:00',156,'PACÍFICO XXXVII - ERFEN XXXV',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (37,1,'22',2003,'2003-09-01 00:00:00','2003-09-30 00:00:00',156,'PACÍFICO XXXVIII - ERFEN XXXVI',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (38,1,'22',2004,'2004-09-09 00:00:00','2004-10-08 00:00:00',155,'PACÍFICO XXXIX - ERFEN XXXVII',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (39,1,'22',2005,'2005-07-09 00:00:00','2005-07-26 00:00:00',155,'PACÍFICO XL',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (40,1,'22',2005,'2005-09-02 00:00:00','2005-09-27 00:00:00',156,'PACÍFICO XLI-ERFEN XXXVIII',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (41,1,'22',2006,'2006-03-01 00:00:00','2006-03-27 00:00:00',156,'PACÍFICO XLII-ERFEN XXXIX',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (42,1,'22',2006,'2006-09-15 00:00:00','2006-09-26 00:00:00',155,'PACÍFICO XLIII-ERFEN XL',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (43,1,'22',2007,'2007-01-30 00:00:00','2007-02-22 00:00:00',155,'PACÍFICO XLIV-ERFEN XLI',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (44,1,'22',2007,'2007-09-03 00:00:00','2007-09-27 00:00:00',156,'PACÍFICO XLV-ERFEN XLII',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (45,1,'22',2008,'2008-03-09 00:00:00','2008-03-28 00:00:00',156,'Pacífico XLVI - ERFEN XLIII',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (46,1,'22',2008,'2008-09-06 00:00:00','2008-09-26 00:00:00',156,'Pacífico XLVII - ERFEN XLIV',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (47,1,'22',2009,'2009-03-02 00:00:00','2009-03-27 00:00:00',156,'Pacífico XLVIII - ERFEN XLV',NULL,'0','TCO','TCO',NULL,'22','22',NULL,NULL,NULL),
 (48,NULL,'22',2011,'2011-11-10 00:00:00','2011-11-29 00:00:00',154,'nuevaprueba',NULL,'0','AGD','AGD',NULL,'22','22',6,'algomas','nuevo'),
 (52,NULL,'22',2011,'2011-11-10 00:00:00','2011-11-07 00:00:00',154,'otro mas',NULL,'0','EJA','SAR',NULL,'22','22',10,'algo mejor','http://laprueba.com');
/*!40000 ALTER TABLE `inv_cruise_inventory` ENABLE KEYS */;


--
-- Definition of table `inv_cruise_metadata`
--

DROP TABLE IF EXISTS `inv_cruise_metadata`;
CREATE TABLE `inv_cruise_metadata` (
  `id_cruise` int(11) NOT NULL,
  `id_metadata` int(11) NOT NULL,
  PRIMARY KEY  (`id_cruise`,`id_metadata`),
  KEY `fk_inv_cruise_inventory_has_inv_metadata_inv_metadata1` (`id_metadata`),
  KEY `fk_inv_cruise_inventory_has_inv_metadata_inv_cruise_inventory1` (`id_cruise`),
  KEY `FK61A4330B517A16BC` (`id_metadata`),
  KEY `FK61A4330BF0F27186` (`id_cruise`),
  CONSTRAINT `FK61A4330B517A16BC` FOREIGN KEY (`id_metadata`) REFERENCES `inv_metadata` (`id_metadata`),
  CONSTRAINT `FK61A4330BF0F27186` FOREIGN KEY (`id_cruise`) REFERENCES `inv_cruise_inventory` (`id_cruise`),
  CONSTRAINT `fk_inv_cruise_inventory_has_inv_metadata_inv_cruise_inventory1` FOREIGN KEY (`id_cruise`) REFERENCES `inv_cruise_inventory` (`id_cruise`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inv_cruise_inventory_has_inv_metadata_inv_metadata1` FOREIGN KEY (`id_metadata`) REFERENCES `inv_metadata` (`id_metadata`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_cruise_metadata`
--

/*!40000 ALTER TABLE `inv_cruise_metadata` DISABLE KEYS */;
INSERT INTO `inv_cruise_metadata` (`id_cruise`,`id_metadata`) VALUES 
 (1,1),
 (1,2),
 (1,3);
/*!40000 ALTER TABLE `inv_cruise_metadata` ENABLE KEYS */;


--
-- Definition of table `inv_cruise_to_project`
--

DROP TABLE IF EXISTS `inv_cruise_to_project`;
CREATE TABLE `inv_cruise_to_project` (
  `inv_project_id_project` int(10) unsigned NOT NULL,
  `inv_cruise_inventory_id_cruise` int(11) NOT NULL,
  PRIMARY KEY  (`inv_project_id_project`,`inv_cruise_inventory_id_cruise`),
  KEY `fk_inv_project_has_inv_cruise_inventory_inv_cruise_inventory1` (`inv_cruise_inventory_id_cruise`),
  KEY `fk_inv_project_has_inv_cruise_inventory_inv_project1` (`inv_project_id_project`),
  KEY `FKAEBB8631D40D6208` (`inv_project_id_project`),
  KEY `FKAEBB86319B138907` (`inv_cruise_inventory_id_cruise`),
  CONSTRAINT `FKAEBB86319B138907` FOREIGN KEY (`inv_cruise_inventory_id_cruise`) REFERENCES `inv_cruise_inventory` (`id_cruise`),
  CONSTRAINT `FKAEBB8631D40D6208` FOREIGN KEY (`inv_project_id_project`) REFERENCES `inv_project` (`id_project`),
  CONSTRAINT `fk_inv_project_has_inv_cruise_inventory_inv_cruise_inventory1` FOREIGN KEY (`inv_cruise_inventory_id_cruise`) REFERENCES `inv_cruise_inventory` (`id_cruise`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inv_project_has_inv_cruise_inventory_inv_project1` FOREIGN KEY (`inv_project_id_project`) REFERENCES `inv_project` (`id_project`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_cruise_to_project`
--

/*!40000 ALTER TABLE `inv_cruise_to_project` DISABLE KEYS */;
INSERT INTO `inv_cruise_to_project` (`inv_project_id_project`,`inv_cruise_inventory_id_cruise`) VALUES 
 (1,1),
 (2,1);
/*!40000 ALTER TABLE `inv_cruise_to_project` ENABLE KEYS */;


--
-- Definition of table `inv_discipline`
--

DROP TABLE IF EXISTS `inv_discipline`;
CREATE TABLE `inv_discipline` (
  `id_discipline` int(10) unsigned NOT NULL auto_increment,
  `discipline` varchar(255) NOT NULL,
  PRIMARY KEY  (`id_discipline`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_discipline`
--

/*!40000 ALTER TABLE `inv_discipline` DISABLE KEYS */;
INSERT INTO `inv_discipline` (`id_discipline`,`discipline`) VALUES 
 (1,'Physical oceanography'),
 (2,'Chemical oceanography'),
 (3,'Contaminants'),
 (4,'Biology and fisheries'),
 (5,'Meteorology'),
 (6,'Geology and geophysics');
/*!40000 ALTER TABLE `inv_discipline` ENABLE KEYS */;


--
-- Definition of table `inv_function_classifiers`
--

DROP TABLE IF EXISTS `inv_function_classifiers`;
CREATE TABLE `inv_function_classifiers` (
  `FunctionCode` varchar(2) NOT NULL,
  `FunctionDescription` varchar(250) default NULL,
  PRIMARY KEY  (`FunctionCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_function_classifiers`
--

/*!40000 ALTER TABLE `inv_function_classifiers` DISABLE KEYS */;
INSERT INTO `inv_function_classifiers` (`FunctionCode`,`FunctionDescription`) VALUES 
 ('0','Function not known, to be specified'),
 ('1','Port, as defined in Rec 16'),
 ('2','Rail Terminal'),
 ('3','Road Terminal'),
 ('4','Airport'),
 ('5','Postal Exchange Office'),
 ('6','Multimodal Functions (ICDs, etc.)'),
 ('7','Fixed Transport Functions (e.g. Oil platform)'),
 ('8','Inland Port'),
 ('B','Border Crossing');
/*!40000 ALTER TABLE `inv_function_classifiers` ENABLE KEYS */;


--
-- Definition of table `inv_institutions`
--

DROP TABLE IF EXISTS `inv_institutions`;
CREATE TABLE `inv_institutions` (
  `Id_institution` int(10) unsigned NOT NULL,
  `institution` varchar(255) default NULL,
  `abbreviation` varchar(20) default NULL,
  `contact` varchar(255) default NULL,
  `contact_job` varchar(255) default NULL,
  `address` varchar(255) default NULL,
  `phone` varchar(20) default NULL,
  `fax` varchar(20) default NULL,
  `cod_city` char(5) default NULL,
  `AA` char(5) default NULL,
  `country` char(2) default NULL,
  `web_page` varchar(255) default NULL,
  `email_1` varchar(255) default NULL,
  `email_2` varchar(255) default NULL,
  `observations` varchar(255) default NULL,
  PRIMARY KEY  (`Id_institution`),
  KEY `FK300113495159C0C6` (`cod_city`),
  KEY `FK30011349C92B13D8` (`country`),
  CONSTRAINT `FK300113495159C0C6` FOREIGN KEY (`cod_city`) REFERENCES `gen_municipio` (`DANE`),
  CONSTRAINT `FK30011349C92B13D8` FOREIGN KEY (`country`) REFERENCES `paises_0101` (`pai_id`),
  CONSTRAINT `FK_inv_institutions_1` FOREIGN KEY (`country`) REFERENCES `paises_0101` (`pai_id`),
  CONSTRAINT `FK_inv_institutions_2` FOREIGN KEY (`cod_city`) REFERENCES `gen_municipio` (`DANE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_institutions`
--

/*!40000 ALTER TABLE `inv_institutions` DISABLE KEYS */;
INSERT INTO `inv_institutions` (`Id_institution`,`institution`,`abbreviation`,`contact`,`contact_job`,`address`,`phone`,`fax`,`cod_city`,`AA`,`country`,`web_page`,`email_1`,`email_2`,`observations`) VALUES 
 (1,'Centro Control Contaminación del Pacífico','CCCP','CF Ricardo Molares Babra','Director',NULL,NULL,NULL,'52835','187','22','http://www.cccp.org.co','cccp@dimar.mil.co','jefcccp@dimar.mil.co',NULL),
 (3,'Centro de Investigaciones Oceanograficas e Hidrograficas','CIOH',NULL,NULL,NULL,NULL,NULL,'13001',NULL,'22','http://www.cioh.org.co','cioh@dimar.mil.co','jdihid@cioh.org.co',NULL),
 (5,'Comisión Colombiana del Océano','CCO','Julián Augusto Reyna','Secretario','Carrera 54 No. 26-50 piso 4','2220436','2220421','11001',NULL,'22','http://www.cco.gov.co','seco@cco.gov.co ','jreyna@dimar.mil.co',NULL),
 (11,'Dirección General Marítima','DIMAR','Contralmirante Jairo Javier Peña','Director','Carrera 54 No. 26-50 Of. 102','2200490',NULL,'11001',NULL,'22','http://www.dimar.mil.co','dimar@dimar.mil.co',NULL,NULL),
 (13,'Escuela Naval de Cadetes \"Almirante Padilla\" (Avalado)','ENAP','Serguei Lonin','Investigador',NULL,NULL,NULL,'13001',NULL,'22','http://www.escuelanaval.edu.co/investiga.html ','gio@enap.edu.co ',NULL,NULL),
 (16,'Fundación Malpelo y otros Ecosistemas Marinos',NULL,'Sandra Bessudo','Directora','Cra. 11  No. 87-51  Local 4  Piso 2','6402114','6402110','11001',NULL,'22','http://www.fundacionmalpelo.org/','sbessudo@fundacionmalpelo.org ',NULL,NULL),
 (18,'Fundación Yubarta','FYUB','Lilian Florez Gonzalez','Directora','Carrera 24F Oeste No. 3-110 Tejares de San Fernando','5585598','5585598','76001',NULL,'22','http://www.aventurassubmarinas.com/yubarta.htm',NULL,NULL,NULL),
 (20,'Instituto de Hidrología, Meteorología y Estudios Ambientales','IDEAM',NULL,NULL,'Carrea 40 No. 20-30 Piso 6','3527160','3527160','11001',NULL,'22','http://www.ideam.gov.co',NULL,NULL,NULL),
 (22,'Instituto de Investigaciones Marinas y Costeras - Sede Pacífico','INVEMAR',NULL,NULL,NULL,NULL,NULL,'76001',NULL,'22','http://www.invemar.org.co','gnavas@invemar.org.co','earteaga@invemar.org.co',NULL),
 (26,'Unidad Administrativa Especial del Sistema de Parques Nacionales Naturales','UAESPNN','Beatriz Beltrán','Directora','Avenida 3G  Norte No. 37N - 70 Prados del Norte','656124','553719','76001',NULL,'22','http://www.parquesnacionales.gov.co/','bbeltranleon@yahoo.com',NULL,NULL),
 (28,'Universidad de Antioquia','UDEA',NULL,NULL,NULL,NULL,NULL,'05001',NULL,'22','http://gaia.udea.edu.co/','gaia@udea.edu.co',NULL,NULL),
 (29,'Universidad de Cartagena','UNICARTAGENA',NULL,NULL,NULL,NULL,NULL,'13001',NULL,'22','http://www.reactivos.com','quicomputacional@unicartagena.edu.co',NULL,NULL),
 (34,'Universidad del Cauca','UNICAUCA','Andrés José Castrillón Muñoz',NULL,'Carrera 2 No. 1A-25 Urbanización Caldas','8209860',NULL,'19001',NULL,'22','http://unicauca.edu.co/','andresj9@unicauca.edu.co ',NULL,NULL),
 (35,'Universidad del Magdalena','UNIMAGDALENA',NULL,NULL,NULL,NULL,NULL,'47001',NULL,'22','http://www.unimagdalena.edu.co','juan.gaitan@docente.unimagdalena.edu.co',NULL,NULL),
 (36,'Universidad del Tolima','UT',NULL,NULL,NULL,'2726139',NULL,'73001',NULL,'22','http://www.ut.edu.co/',NULL,NULL,NULL),
 (37,'Universidad del Valle','UNIVALLE','Alan Giraldo López','Profesor Asistente del Departamento de Biología','Calle 13  No. 100 - 00 Ciudad Universitaria Meléndez','3212100','3212100','76001',NULL,'22','http://www.univalle.edu.co','agiraldo@univalle.edu.co ',NULL,NULL),
 (38,'Universidad EAFIT','EAFIT',NULL,NULL,NULL,NULL,NULL,'23001',NULL,'22','http://www.eafit.edu.co/','hermelin@eafit.edu.co',NULL,NULL),
 (40,'Universidad Militar Nueva Granada','UMNG',NULL,NULL,NULL,NULL,NULL,'11001',NULL,'22','http://www.umng.edu.co/',NULL,NULL,NULL),
 (41,'Universidad Nacional de Colombia - Sede Medellín','UNALMED',NULL,NULL,NULL,NULL,NULL,'05001',NULL,'22','http://www.unalmed.edu.co/','fmtoro@unalmed.edu.co',NULL,NULL),
 (42,'Universidad Nacional de Colombia','UNAL',NULL,NULL,NULL,NULL,NULL,'11001',NULL,'22','http://www.unal.edu.co/','frleiva@yahoo.es',NULL,NULL),
 (43,'Universidad Nacional de Colombia - Sede Manizales','UNAL',NULL,NULL,NULL,NULL,NULL,'17001',NULL,'22','http://www.manizales.unal.edu.co/','fmejiaf@unal.edu.co',NULL,NULL),
 (49,'Armada Nacional de Colombia',NULL,NULL,NULL,NULL,NULL,NULL,'11001',NULL,'22','http://www.armada.mil.co',NULL,NULL,NULL),
 (50,'Instituto Nacional de los Recursos Naturales Renovables y del Medio Ambiente','INDERENA',NULL,NULL,NULL,NULL,NULL,'11001',NULL,'22',NULL,NULL,NULL,'InstituciÃ³n no activa.'),
 (51,'Universidad de Nariño','UDENAR',NULL,NULL,NULL,NULL,NULL,'52001',NULL,'22','http//www.udenar.edu.co',NULL,NULL,NULL),
 (52,'xxxxxxxxxxxxxxxx','xxxxxxxxxxxxxx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'22','xxxxxxxxxxxxxxxxxxxxx',NULL,NULL,NULL),
 (53,'Universidad Jorge Tadeo Lozano','UNITADEO',NULL,NULL,NULL,NULL,NULL,'11001',NULL,'22','http://www.utadeo.edu.co',NULL,NULL,NULL),
 (54,'Comisión Colombiana de Oceanografía','CCO',NULL,NULL,NULL,NULL,NULL,'11001',NULL,'22',NULL,NULL,NULL,'InstituciÃ³n no activa. Actualmente conocida como ComisiÃ³n Colombiana del OcÃ©ano.'),
 (55,'Instituto Colombiano de Hidrología, Meteorología y Adecuación de Tierras','HIMAT',NULL,NULL,NULL,NULL,NULL,'11001',NULL,'22',NULL,NULL,NULL,'InstituciÃ³n no activa. Actualmente conocida como Instituto de HidrologÃ­a, MeteorologÃ­a y Estudios Ambientales (IDEAM)'),
 (56,'Diario El Espectador',NULL,NULL,NULL,NULL,NULL,NULL,'11001',NULL,'22','http://www.elespectador.com/',NULL,NULL,NULL),
 (57,'Smithsonian Tropical Research Institute','STRI',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'PA','http://www.stri.org/',NULL,NULL,NULL),
 (58,'National Oceanic and Atmospheric Administration','NOAA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'31','http://www.noaa.gov/',NULL,NULL,NULL),
 (59,'Universidad Industrial de Santander',NULL,NULL,NULL,NULL,NULL,NULL,'68001',NULL,'22','http://www.uis.edu.co',NULL,NULL,NULL),
 (60,'Servicio Nacional de Aprendizaje','SENA',NULL,NULL,NULL,NULL,NULL,'11001',NULL,'22','http://www.sena.edu.co',NULL,NULL,NULL),
 (61,'Armada Nacional de Venezuela',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'93','http://www.armada.mil.ve/',NULL,NULL,NULL),
 (62,'Instituto Nacional de Pesca y Acuicultura de Colombia','INPA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'22',NULL,NULL,NULL,'Institución no activa.'),
 (63,'Pontificia Universidad Javeriana','JAVERIANA',NULL,NULL,NULL,NULL,NULL,'11001',NULL,'22','http://www.javeriana.edu.co/',NULL,NULL,NULL),
 (64,'Instituto Nacional de Pesca de Ecuador','INP',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'28','http://www.inp.gov.ec',NULL,NULL,NULL),
 (65,'Instituto del Mar del Perú','IMARPE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'65','http://www.imarpe.gob.pe/',NULL,NULL,NULL),
 (66,'Fundación Universitaria de Popayán','FUP',NULL,NULL,NULL,NULL,NULL,'19001',NULL,'22','http://www.fup.edu.co/',NULL,NULL,NULL),
 (67,'Dirección de Hidrografía y Navegación de la Marina de Guerra del Perú','DHN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'65','http://www.dhn.mil.pe/',NULL,NULL,NULL),
 (68,'Instituto de Fomento Pesquero de Chile','IFOP',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'20','http://www.ifop.cl/',NULL,NULL,NULL),
 (69,'Instituto Oceanográfico de la Armada de Ecuador','INOCAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'65','http://www.inocar.mil.ec/',NULL,NULL,NULL),
 (70,'Universidad de La Salle','UNISALLE',NULL,NULL,NULL,NULL,NULL,'11001',NULL,'22','http://unisalle.lasalle.edu.co/',NULL,NULL,NULL),
 (71,'Instituto Colombiano para el Desarrollo Rural','INCODER',NULL,NULL,NULL,NULL,NULL,'11001',NULL,'22','http://www.incoder.gov.co/',NULL,NULL,NULL),
 (72,'Comisión Permanente del Pacífico Sur','CPPS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'28','http://www.cpps-int.org/',NULL,NULL,NULL),
 (73,'Diario El Tiempo',NULL,NULL,NULL,NULL,NULL,NULL,'11001',NULL,'22','http://www.eltiempo.com/',NULL,NULL,NULL),
 (74,'Diario El País',NULL,NULL,NULL,NULL,NULL,NULL,'76001',NULL,'22','http://www.elpais.com.co/',NULL,NULL,NULL),
 (75,'Fundación Omacha','OMACHA',NULL,NULL,NULL,NULL,NULL,'11001',NULL,'22','http://www.omacha.org/',NULL,NULL,NULL);
/*!40000 ALTER TABLE `inv_institutions` ENABLE KEYS */;


--
-- Definition of table `inv_laboratories`
--

DROP TABLE IF EXISTS `inv_laboratories`;
CREATE TABLE `inv_laboratories` (
  `id_lab` int(10) unsigned NOT NULL,
  `name_lab` varchar(255) default NULL,
  `institution_lab` int(10) unsigned default NULL,
  `credited_since` smallint(6) default NULL,
  `credited_procedures` varchar(255) default NULL,
  `contact` varchar(255) default NULL,
  `contact_job` varchar(255) default NULL,
  `address` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `fax` varchar(255) default NULL,
  `AA` smallint(6) default NULL,
  `country` char(2) default NULL,
  `Web_page` varchar(255) default NULL,
  `Email_1` varchar(255) default NULL,
  `Email_2` varchar(255) default NULL,
  PRIMARY KEY  (`id_lab`),
  KEY `FK511F211F17A2ECFB` (`institution_lab`),
  KEY `FK511F211FC92B13D8` (`country`),
  CONSTRAINT `FK511F211F17A2ECFB` FOREIGN KEY (`institution_lab`) REFERENCES `inv_institutions` (`Id_institution`),
  CONSTRAINT `FK511F211FC92B13D8` FOREIGN KEY (`country`) REFERENCES `paises_0101` (`pai_id`),
  CONSTRAINT `FK_inv_laboratories_1` FOREIGN KEY (`institution_lab`) REFERENCES `inv_institutions` (`Id_institution`),
  CONSTRAINT `FK_inv_laboratories_2` FOREIGN KEY (`country`) REFERENCES `paises_0101` (`pai_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_laboratories`
--

/*!40000 ALTER TABLE `inv_laboratories` DISABLE KEYS */;
INSERT INTO `inv_laboratories` (`id_lab`,`name_lab`,`institution_lab`,`credited_since`,`credited_procedures`,`contact`,`contact_job`,`address`,`phone`,`fax`,`AA`,`country`,`Web_page`,`Email_1`,`Email_2`) VALUES 
 (1,'DIMAR-CCCP-Chemistry laboratory',1,2004,'OxÃ­geno disuelto, nitratos, nitritos amonio, fÃ³sforo reactivo, pH, conductividad, sÃ³lidos suspendidos, clorofila a, silicato reactivo, salinidad, hidrocarburos aromÃ¡ticos polinucleares (HAP) en aguas y HAP en sedimentos','Robinson Casanova','Chemistry laboratory head','VÃ­a El Morro, CapitanÃ­a de Puerto Tumaco, NariÃ±o','7272637','7271180',187,'22','http://www.cccp.org.co/modules.php?name=Content&pa=showpage&pid=205','rcasanova@dimar.mil.co','cccp@dimar.mil.co'),
 (2,'DIMAR-CIOH-Chemistry laboratory',3,2006,'pH, ammonio, nitratos, ortofosfatos','Alex Barraza','Chemistry laboratory head','Barrio Bosque, Sector Manzanillo Escuela Naval, Cartagena','6694465-6694104-6695291','6694297-6694390-6694449',982,'22','http://www.cioh.org.co/proserv/laboratorios.html','arap@cioh.org.co','cioh@dimar.mil.co'),
 (3,'DIMAR-CCCP-Biology laboratory',1,NULL,NULL,'David Escobar Marmol','Biology laboratory head','VÃ­a El Morro, CapitanÃ­a de Puerto Tumaco, NariÃ±o','7272637','7271180',187,'22','http://www.cccp.org.co/modules.php?name=Content&pa=showpage&pid=213','descobar@dimar.mil.co','cccp@dimar.mil.co'),
 (4,'DIMAR-CIOH-Biology laboratory',3,NULL,NULL,'Gustavo Tous','Biology laboratory head','Barrio Bosque, Sector Manzanillo Escuela Naval, Cartagena','6694465','6694297',982,'22','http://www.cioh.org.co/proserv/laboratorios.html','gtous@cioh.org.co','cioh@dimar.mil.co'),
 (5,'UNIVALLE-Ecology laboratory',37,NULL,NULL,'Alan Giraldo',NULL,NULL,NULL,NULL,NULL,'22',NULL,'agiraldo@univalle.edu.co',NULL),
 (6,'INVEMAR-Ecology laboratory',22,NULL,NULL,'Edgar Arteaga',NULL,'INVEMAR SEDE PACIFICO\r\nCentro Internacional de Agricultura Tropical - CIAT\r\nRecta Cali â€“ Palmira Km. 17','4450000 ExtensiÃ³n 3260',NULL,NULL,'22','http://www.invemar.org.co','earteaga@invemar.org.co',NULL);
/*!40000 ALTER TABLE `inv_laboratories` ENABLE KEYS */;


--
-- Definition of table `inv_laboratories_cruises`
--

DROP TABLE IF EXISTS `inv_laboratories_cruises`;
CREATE TABLE `inv_laboratories_cruises` (
  `id_laboratory` int(10) unsigned NOT NULL,
  `id_cruise` int(11) NOT NULL,
  PRIMARY KEY  (`id_laboratory`,`id_cruise`),
  KEY `FK537ACF1E6FAB29A2` (`id_laboratory`),
  KEY `FK537ACF1EF0F27186` (`id_cruise`),
  CONSTRAINT `FK537ACF1E6FAB29A2` FOREIGN KEY (`id_laboratory`) REFERENCES `inv_laboratories` (`id_lab`),
  CONSTRAINT `FK537ACF1EF0F27186` FOREIGN KEY (`id_cruise`) REFERENCES `inv_cruise_inventory` (`id_cruise`),
  CONSTRAINT `FK_inv_laboratories_cruises_1` FOREIGN KEY (`id_laboratory`) REFERENCES `inv_laboratories` (`id_lab`),
  CONSTRAINT `FK_inv_laboratories_cruises_2` FOREIGN KEY (`id_cruise`) REFERENCES `inv_cruise_inventory` (`id_cruise`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_laboratories_cruises`
--

/*!40000 ALTER TABLE `inv_laboratories_cruises` DISABLE KEYS */;
INSERT INTO `inv_laboratories_cruises` (`id_laboratory`,`id_cruise`) VALUES 
 (1,21),
 (1,22),
 (1,23),
 (1,24),
 (1,25),
 (1,26),
 (1,27),
 (1,28),
 (1,29),
 (1,30),
 (1,31),
 (1,32),
 (1,33),
 (1,35),
 (1,36),
 (1,37),
 (1,38),
 (1,39),
 (1,40),
 (1,41),
 (1,42),
 (1,43),
 (1,44),
 (1,45),
 (1,46),
 (1,47),
 (1,52),
 (2,52),
 (3,52),
 (4,52),
 (5,1),
 (5,4),
 (5,16),
 (5,19),
 (5,20),
 (5,21),
 (5,37),
 (5,40),
 (5,41),
 (5,42),
 (5,43),
 (5,44),
 (5,45),
 (5,46),
 (5,47),
 (5,52),
 (6,36),
 (6,37),
 (6,38),
 (6,40),
 (6,42),
 (6,43),
 (6,44),
 (6,45),
 (6,46),
 (6,47),
 (6,52);
/*!40000 ALTER TABLE `inv_laboratories_cruises` ENABLE KEYS */;


--
-- Definition of table `inv_metadata`
--

DROP TABLE IF EXISTS `inv_metadata`;
CREATE TABLE `inv_metadata` (
  `id_metadata` int(11) NOT NULL auto_increment,
  `title` varchar(150) default NULL,
  `description` varchar(255) default NULL,
  `uri` varchar(200) default NULL,
  PRIMARY KEY  (`id_metadata`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inv_metadata`
--

/*!40000 ALTER TABLE `inv_metadata` DISABLE KEYS */;
INSERT INTO `inv_metadata` (`id_metadata`,`title`,`description`,`uri`) VALUES 
 (1,'Metadatos titulo 1','Prueba de metadatos','http://www.google.com'),
 (2,'Titulo de metadatos 2','Prueba de metadatos numero 2','http://www.yobus.co'),
 (3,'Otro metadato 3','Prueba de metadatos 3','http://www.lamaslinda.com');
/*!40000 ALTER TABLE `inv_metadata` ENABLE KEYS */;


--
-- Definition of table `inv_project`
--

DROP TABLE IF EXISTS `inv_project`;
CREATE TABLE `inv_project` (
  `id_project` int(10) unsigned NOT NULL auto_increment,
  `project_name` varchar(255) NOT NULL,
  `id_status` smallint(6) default NULL,
  `project_boss` varchar(255) default NULL,
  `id_institution` int(10) unsigned default NULL,
  `uri_project` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  PRIMARY KEY  (`id_project`),
  KEY `FKDB0708CBA0233FC2` (`id_status`),
  KEY `FKDB0708CB5EC25309` (`id_institution`),
  CONSTRAINT `FKDB0708CB5EC25309` FOREIGN KEY (`id_institution`) REFERENCES `inv_institutions` (`Id_institution`),
  CONSTRAINT `FKDB0708CBA0233FC2` FOREIGN KEY (`id_status`) REFERENCES `inv_status` (`id_status`),
  CONSTRAINT `FK_inv_project_1` FOREIGN KEY (`id_status`) REFERENCES `inv_status` (`id_status`),
  CONSTRAINT `FK_inv_project_2` FOREIGN KEY (`id_institution`) REFERENCES `inv_institutions` (`Id_institution`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_project`
--

/*!40000 ALTER TABLE `inv_project` DISABLE KEYS */;
INSERT INTO `inv_project` (`id_project`,`project_name`,`id_status`,`project_boss`,`id_institution`,`uri_project`,`description`) VALUES 
 (1,'Proyecto 1 de prueba',0,'Ruby Ortiz',1,'http://www.cccp.org.co','Proyecto de prueba principal'),
 (2,'Proyecto prueba 2',1,'Helbert Rico',1,'http://www.laurldelproyecto.com','proyecto de prueba secundario');
/*!40000 ALTER TABLE `inv_project` ENABLE KEYS */;


--
-- Definition of table `inv_report`
--

DROP TABLE IF EXISTS `inv_report`;
CREATE TABLE `inv_report` (
  `id_report` int(11) NOT NULL auto_increment,
  `title` varchar(150) default NULL,
  `uri` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  PRIMARY KEY  (`id_report`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inv_report`
--

/*!40000 ALTER TABLE `inv_report` DISABLE KEYS */;
INSERT INTO `inv_report` (`id_report`,`title`,`uri`,`description`) VALUES 
 (1,'Reporte resumido de crucero 1','http://www.taringa.net','un reporte de prueba del ejercicio'),
 (2,'Reporte de crucero resumido 2','http://www.whatismyip.com','segundo reporte de prueba'),
 (3,'','',NULL),
 (6,'ago','uuuu',NULL),
 (7,'nuevo','test',NULL),
 (8,'pero ','ya casi',NULL),
 (9,'ura','nuevo',NULL),
 (10,'otro','http://sisisi.com',NULL);
/*!40000 ALTER TABLE `inv_report` ENABLE KEYS */;


--
-- Definition of table `inv_ship_name`
--

DROP TABLE IF EXISTS `inv_ship_name`;
CREATE TABLE `inv_ship_name` (
  `Id` int(10) unsigned NOT NULL,
  `ship_type` char(2) default NULL,
  `ship_name` varchar(255) default NULL,
  `ship_picture` varchar(255) default NULL,
  `moored_port` char(3) default NULL,
  `construction_date` double default NULL,
  `construction_country` char(2) default NULL,
  `reception_date` double default NULL,
  `responsable_institution` int(10) unsigned default NULL,
  `reception_country` char(2) default NULL,
  `total_length` varchar(255) default NULL,
  `max_sleeve` varchar(255) default NULL,
  `average_openwork` varchar(255) default NULL,
  `max_speed` varchar(255) default NULL,
  `autonomy` varchar(255) default NULL,
  `displacement` varchar(255) default NULL,
  `lodging_capacity` varchar(255) default NULL,
  `description` mediumtext,
  `country_port` varchar(255) default NULL,
  `ship_uri` varchar(255) default NULL,
  PRIMARY KEY  (`Id`),
  KEY `FK_inv_ship_name_5` (`reception_country`,`moored_port`),
  KEY `FKAFF177E098A37967` (`country_port`,`moored_port`),
  KEY `FKAFF177E029A140AD` (`ship_type`),
  KEY `FKAFF177E0A9916A6A` (`construction_country`),
  KEY `FKAFF177E0A5259A68` (`reception_country`),
  KEY `FKAFF177E0CD5DAD6C` (`responsable_institution`),
  CONSTRAINT `FKAFF177E029A140AD` FOREIGN KEY (`ship_type`) REFERENCES `inv_ship_type` (`Id`),
  CONSTRAINT `FKAFF177E098A37967` FOREIGN KEY (`country_port`, `moored_port`) REFERENCES `unlocode_port` (`Country`, `Location`),
  CONSTRAINT `FKAFF177E0A5259A68` FOREIGN KEY (`reception_country`) REFERENCES `paises_0101` (`pai_id`),
  CONSTRAINT `FKAFF177E0A9916A6A` FOREIGN KEY (`construction_country`) REFERENCES `paises_0101` (`pai_id`),
  CONSTRAINT `FKAFF177E0CD5DAD6C` FOREIGN KEY (`responsable_institution`) REFERENCES `inv_institutions` (`Id_institution`),
  CONSTRAINT `FK_inv_ship_name_1` FOREIGN KEY (`construction_country`) REFERENCES `paises_0101` (`pai_id`),
  CONSTRAINT `FK_inv_ship_name_2` FOREIGN KEY (`reception_country`) REFERENCES `paises_0101` (`pai_id`),
  CONSTRAINT `FK_inv_ship_name_3` FOREIGN KEY (`responsable_institution`) REFERENCES `inv_institutions` (`Id_institution`),
  CONSTRAINT `FK_inv_ship_name_4` FOREIGN KEY (`ship_type`) REFERENCES `inv_ship_type` (`Id`),
  CONSTRAINT `FK_inv_ship_name_5` FOREIGN KEY (`reception_country`, `moored_port`) REFERENCES `unlocode_port` (`Country`, `Location`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_ship_name`
--

/*!40000 ALTER TABLE `inv_ship_name` DISABLE KEYS */;
INSERT INTO `inv_ship_name` (`Id`,`ship_type`,`ship_name`,`ship_picture`,`moored_port`,`construction_date`,`construction_country`,`reception_date`,`responsable_institution`,`reception_country`,`total_length`,`max_sleeve`,`average_openwork`,`max_speed`,`autonomy`,`displacement`,`lodging_capacity`,`description`,`country_port`,`ship_uri`) VALUES 
 (152,'HS','ARC San Andrés','images/buques/151_buque_arc_san_andres.jpg','ADZ',NULL,NULL,1963,11,'22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'This ship was used in the first oceanographic cruise made in 1969 in the Caribbean Sea \"Ocean I\" and later, it widely was used in 70Â´s years in oceanographic cruises in the Colombian Pacific area. From those events, the oceanographic investigation in Colombia tooks its first step towards the study of physical, chemical, biological and geologic changes that take place in the ocean.','22',NULL),
 (153,'HS','ARC Quindío','images/buques/153_buque_arc_quindio.jpg','CTG',1945,'31',1963,11,'22','40',NULL,NULL,NULL,NULL,'750',NULL,'Buque dedicado a labores hidrogrÃ¡ficas, de seÃ±alizaciÃ³n marÃ­tima y para labores de investigaciÃ³n oceanogrÃ¡fica. Cuenta con tecnologia multihaz para el desarrollo de las actividades hidrograficas.','22','http://www.cccp.org.co/index.php/component/joomgallery/plataformas/arc-quindio-72'),
 (154,'HS','ARC Gorgona','images/buques/154_buque_arc_gorgona.jpg','BUN',1953,'77',1953,11,'22','50',NULL,NULL,NULL,NULL,'560',NULL,'Buque dedicado desde 1992 como unidad de apoyo en investigaciÃ³n hidrogrÃ¡fica, trabajos de seÃ±alizaciÃ³n en la cuenca del PacÃ­fico y como plataforma de investigaciÃ³n oceanogrÃ¡fica. ','22','http://www.cccp.org.co/index.php/component/joomgallery/plataformas/arc-gorgona-71'),
 (155,'OS','ARC Providencia','images/buques/155_buque_arc_providencia.jpg','CTG',1981,'6',1981,11,'22','50.9','10','4','12.2','40',NULL,'9 officials, 22 sergeant majors and 10 scientists','Buque utilizado en los cruceros oceanogrÃ¡ficos colombianos. Cuenta con equipos para investigaciÃ³n oceanogrÃ¡fica en las disciplinas de fÃ­sica, quÃ­mica, meteorologÃ­a, biologÃ­a y geologÃ­a marina.','22','http://www.cccp.org.co/index.php/component/joomgallery/plataformas/arc-providencia-70'),
 (156,'OS','ARC Malpelo','images/buques/156_buque_arc_malpelo.jpg','CTG',1981,'6',1981,11,'22','50.9','10','4','12.2','40',NULL,'9 officials, 22 sergeant majors and 10 scientists','Para investigaciÃ³n oceanogrÃ¡fica en las Ã¡reas de fÃ­sica, quÃ­mica, meteorologÃ­a, biologÃ­a y geologÃ­a, ademÃ¡s cuenta con los mÃ¡s modernos equipos para la investigaciÃ³n en prospecciÃ³n pesquera.','22','http://www.cccp.org.co/index.php/component/joomgallery/plataformas/arc-malpelo-69'),
 (158,'BT','ARC Isla Palma','images/buques/35_buque_arc_isla_palma.jpg','BUN',NULL,'22',2000,11,'22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Surca las aguas del mar PacÃ­fico, efectuando operaciones de fondeo y mantenimiento de boyas y faros en este litoral, para facilitar la operaciÃ³n marÃ­tima y comercial de naves nacionales y extranjeras; adicionalmente es utilizado por los centros de investigaciÃ³n de DIMAR para el fondeo de equipos de investigaciÃ³n oceanogrÃ¡fica.','22','http://www.cccp.org.co/index.php/component/joomgallery/plataformas/arc-isla-palma-73');
/*!40000 ALTER TABLE `inv_ship_name` ENABLE KEYS */;


--
-- Definition of table `inv_ship_type`
--

DROP TABLE IF EXISTS `inv_ship_type`;
CREATE TABLE `inv_ship_type` (
  `Id` char(2) NOT NULL,
  `ship_type` varchar(255) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_ship_type`
--

/*!40000 ALTER TABLE `inv_ship_type` DISABLE KEYS */;
INSERT INTO `inv_ship_type` (`Id`,`ship_type`) VALUES 
 ('BT','Buoy tender ship'),
 ('HS','Hydrographic ship'),
 ('OS','Oceanographic ship');
/*!40000 ALTER TABLE `inv_ship_type` ENABLE KEYS */;


--
-- Definition of table `inv_status`
--

DROP TABLE IF EXISTS `inv_status`;
CREATE TABLE `inv_status` (
  `id_status` smallint(6) NOT NULL,
  `status` varchar(255) default NULL,
  PRIMARY KEY  (`id_status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_status`
--

/*!40000 ALTER TABLE `inv_status` DISABLE KEYS */;
INSERT INTO `inv_status` (`id_status`,`status`) VALUES 
 (0,'Completed'),
 (1,'Current'),
 (2,'Scheduled'),
 (3,'Cancelled'),
 (4,'Unknown');
/*!40000 ALTER TABLE `inv_status` ENABLE KEYS */;


--
-- Definition of table `inv_status_indicators`
--

DROP TABLE IF EXISTS `inv_status_indicators`;
CREATE TABLE `inv_status_indicators` (
  `STStatus` varchar(2) NOT NULL,
  `STDescription` varchar(255) default NULL,
  PRIMARY KEY  (`STStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_status_indicators`
--

/*!40000 ALTER TABLE `inv_status_indicators` DISABLE KEYS */;
INSERT INTO `inv_status_indicators` (`STStatus`,`STDescription`) VALUES 
 ('AA','Approved by competent national government agency'),
 ('AC','Approved by Customs Authority'),
 ('AF','Approved by national facilitation body'),
 ('AI','Code adopted by international  organisation (IATA, ECLAC, EUROSTAT, etc.)'),
 ('AM','Approved by the UN/LOCODE Maintenance Agency'),
 ('AQ','Entry approved, functions not verified'),
 ('AS','Approved by national standardisation body'),
 ('QQ','Original entry not verified since date indicated'),
 ('RL','Recognised location - Existence and representation of location name confirmed by check against nominated gazetteer or other reference work'),
 ('RN','Request from credible national sources for locations in their own country'),
 ('RQ','Request under consideration'),
 ('RR','Request rejected'),
 ('UR','Entry included on user\'s request; not officially approved'),
 ('XX','Entry that will be removed from the next issue of UN/LOCODE');
/*!40000 ALTER TABLE `inv_status_indicators` ENABLE KEYS */;


--
-- Definition of table `isolanguages`
--

DROP TABLE IF EXISTS `isolanguages`;
CREATE TABLE `isolanguages` (
  `id` int(11) NOT NULL default '0',
  `code` varchar(3) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `isolanguages`
--

/*!40000 ALTER TABLE `isolanguages` DISABLE KEYS */;
/*!40000 ALTER TABLE `isolanguages` ENABLE KEYS */;


--
-- Definition of table `isolanguagesdes`
--

DROP TABLE IF EXISTS `isolanguagesdes`;
CREATE TABLE `isolanguagesdes` (
  `idDes` int(11) NOT NULL default '0',
  `langId` varchar(5) NOT NULL default '',
  `label` varchar(96) NOT NULL,
  PRIMARY KEY  (`idDes`,`langId`),
  KEY `langId` (`langId`),
  CONSTRAINT `isolanguagesdes_ibfk_1` FOREIGN KEY (`idDes`) REFERENCES `isolanguages` (`id`),
  CONSTRAINT `isolanguagesdes_ibfk_2` FOREIGN KEY (`langId`) REFERENCES `languages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `isolanguagesdes`
--

/*!40000 ALTER TABLE `isolanguagesdes` DISABLE KEYS */;
/*!40000 ALTER TABLE `isolanguagesdes` ENABLE KEYS */;


--
-- Definition of table `languages`
--

DROP TABLE IF EXISTS `languages`;
CREATE TABLE `languages` (
  `id` varchar(5) NOT NULL default '',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `languages`
--

/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;


--
-- Definition of table `malla_datos`
--

DROP TABLE IF EXISTS `malla_datos`;
CREATE TABLE `malla_datos` (
  `id_malla_datos` int(11) NOT NULL auto_increment,
  `longitud` double NOT NULL,
  `latitud` double NOT NULL,
  `numero_estacion` int(10) unsigned default NULL,
  `descripcion` varchar(255) default NULL,
  `id_metadata` int(11) default NULL,
  PRIMARY KEY  (`id_malla_datos`),
  KEY `FK81999C9E47F6B6` (`id_metadata`),
  CONSTRAINT `FK81999C9E47F6B6` FOREIGN KEY (`id_metadata`) REFERENCES `metadata` (`id`),
  CONSTRAINT `FK_malla_datos_1` FOREIGN KEY (`id_metadata`) REFERENCES `metadata` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `malla_datos`
--

/*!40000 ALTER TABLE `malla_datos` DISABLE KEYS */;
/*!40000 ALTER TABLE `malla_datos` ENABLE KEYS */;


--
-- Definition of table `metadata`
--

DROP TABLE IF EXISTS `metadata`;
CREATE TABLE `metadata` (
  `id` int(11) NOT NULL default '0',
  `uuid` varchar(250) NOT NULL,
  `schemaId` varchar(32) NOT NULL,
  `isTemplate` char(1) NOT NULL default 'n',
  `isHarvested` char(1) NOT NULL default 'n',
  `createDate` varchar(24) NOT NULL,
  `changeDate` varchar(24) NOT NULL,
  `data` longtext NOT NULL,
  `source` varchar(250) NOT NULL,
  `title` varchar(255) default NULL,
  `root` varchar(255) default NULL,
  `harvestUuid` varchar(250) default NULL,
  `owner` int(11) NOT NULL,
  `groupOwner` int(11) default NULL,
  `harvestUri` varchar(255) default NULL,
  `rating` int(11) NOT NULL default '0',
  `popularity` int(11) NOT NULL default '0',
  `state` varchar(1) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uuid` (`uuid`,`source`,`harvestUuid`),
  KEY `owner` (`owner`),
  KEY `groupOwner` (`groupOwner`),
  KEY `MetadataNDX1` (`uuid`),
  KEY `MetadataNDX2` (`source`),
  KEY `FKE52D7B2F7172551F` (`groupOwner`),
  KEY `FKE52D7B2F94A6E624` (`owner`),
  CONSTRAINT `FKE52D7B2F7172551F` FOREIGN KEY (`groupOwner`) REFERENCES `groups` (`id`),
  CONSTRAINT `FKE52D7B2F94A6E624` FOREIGN KEY (`owner`) REFERENCES `users` (`id`),
  CONSTRAINT `metadata_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `users` (`id`),
  CONSTRAINT `metadata_ibfk_2` FOREIGN KEY (`groupOwner`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `metadata`
--

/*!40000 ALTER TABLE `metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadata` ENABLE KEYS */;


--
-- Definition of table `metadatacateg`
--

DROP TABLE IF EXISTS `metadatacateg`;
CREATE TABLE `metadatacateg` (
  `metadataId` int(11) NOT NULL default '0',
  `categoryId` int(11) NOT NULL default '0',
  PRIMARY KEY  (`metadataId`,`categoryId`),
  KEY `categoryId` (`categoryId`),
  CONSTRAINT `metadatacateg_ibfk_1` FOREIGN KEY (`metadataId`) REFERENCES `metadata` (`id`),
  CONSTRAINT `metadatacateg_ibfk_2` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `metadatacateg`
--

/*!40000 ALTER TABLE `metadatacateg` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadatacateg` ENABLE KEYS */;


--
-- Definition of table `metadatarating`
--

DROP TABLE IF EXISTS `metadatarating`;
CREATE TABLE `metadatarating` (
  `metadataId` int(11) NOT NULL default '0',
  `ipAddress` varchar(32) NOT NULL default '',
  `rating` int(11) NOT NULL,
  PRIMARY KEY  (`metadataId`,`ipAddress`),
  CONSTRAINT `metadatarating_ibfk_1` FOREIGN KEY (`metadataId`) REFERENCES `metadata` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `metadatarating`
--

/*!40000 ALTER TABLE `metadatarating` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadatarating` ENABLE KEYS */;


--
-- Definition of table `metadatos`
--

DROP TABLE IF EXISTS `metadatos`;
CREATE TABLE `metadatos` (
  `id_metadatos` int(10) unsigned NOT NULL auto_increment,
  `titulo` varchar(45) NOT NULL default '',
  `resumen` text,
  `proyecto` varchar(255) default NULL,
  `ubicacion` varchar(255) default NULL,
  `nombre_archivo` varchar(255) default NULL,
  `fecha_carga` datetime default NULL,
  `REPORTUSER_ID` int(11) default NULL,
  `efectuado` tinyint(1) default '0',
  `cantidad_registros` int(10) unsigned default NULL,
  PRIMARY KEY  (`id_metadatos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Datos de la información cargada en la base de datos';

--
-- Dumping data for table `metadatos`
--

/*!40000 ALTER TABLE `metadatos` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadatos` ENABLE KEYS */;


--
-- Definition of table `observacion_datos`
--

DROP TABLE IF EXISTS `observacion_datos`;
CREATE TABLE `observacion_datos` (
  `observacion` text,
  `id_user` int(11) default NULL,
  `id_archivo` int(10) unsigned default NULL,
  `id_observacion` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`id_observacion`),
  KEY `FKB045EED91A0373AB` (`id_archivo`),
  KEY `FKB045EED94FFDCBE7` (`id_user`),
  KEY `FKB045EED958E2826E` (`id_archivo`),
  KEY `FKB045EED9461B1FC5` (`id_user`),
  CONSTRAINT `FKB045EED91A0373AB` FOREIGN KEY (`id_archivo`) REFERENCES `archivo_datos` (`id_archivo`),
  CONSTRAINT `FKB045EED9461B1FC5` FOREIGN KEY (`id_user`) REFERENCES `report_user` (`REPORTUSER_ID`),
  CONSTRAINT `FKB045EED94FFDCBE7` FOREIGN KEY (`id_user`) REFERENCES `report_user` (`REPORTUSER_ID`),
  CONSTRAINT `FKB045EED958E2826E` FOREIGN KEY (`id_archivo`) REFERENCES `archivo_datos` (`id_archivo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `observacion_datos`
--

/*!40000 ALTER TABLE `observacion_datos` DISABLE KEYS */;
/*!40000 ALTER TABLE `observacion_datos` ENABLE KEYS */;


--
-- Definition of table `operationallowed`
--

DROP TABLE IF EXISTS `operationallowed`;
CREATE TABLE `operationallowed` (
  `groupId` int(11) NOT NULL default '0',
  `metadataId` int(11) NOT NULL default '0',
  `operationId` int(11) NOT NULL default '0',
  PRIMARY KEY  (`groupId`,`metadataId`,`operationId`),
  KEY `metadataId` (`metadataId`),
  KEY `operationId` (`operationId`),
  CONSTRAINT `operationallowed_ibfk_1` FOREIGN KEY (`groupId`) REFERENCES `groups` (`id`),
  CONSTRAINT `operationallowed_ibfk_2` FOREIGN KEY (`metadataId`) REFERENCES `metadata` (`id`),
  CONSTRAINT `operationallowed_ibfk_3` FOREIGN KEY (`operationId`) REFERENCES `operations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `operationallowed`
--

/*!40000 ALTER TABLE `operationallowed` DISABLE KEYS */;
/*!40000 ALTER TABLE `operationallowed` ENABLE KEYS */;


--
-- Definition of table `operations`
--

DROP TABLE IF EXISTS `operations`;
CREATE TABLE `operations` (
  `id` int(11) NOT NULL default '0',
  `name` varchar(32) NOT NULL,
  `reserved` char(1) NOT NULL default 'n',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `operations`
--

/*!40000 ALTER TABLE `operations` DISABLE KEYS */;
/*!40000 ALTER TABLE `operations` ENABLE KEYS */;


--
-- Definition of table `operationsdes`
--

DROP TABLE IF EXISTS `operationsdes`;
CREATE TABLE `operationsdes` (
  `idDes` int(11) NOT NULL default '0',
  `langId` varchar(5) NOT NULL default '',
  `label` varchar(96) NOT NULL,
  PRIMARY KEY  (`idDes`,`langId`),
  KEY `langId` (`langId`),
  CONSTRAINT `operationsdes_ibfk_1` FOREIGN KEY (`idDes`) REFERENCES `operations` (`id`),
  CONSTRAINT `operationsdes_ibfk_2` FOREIGN KEY (`langId`) REFERENCES `languages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `operationsdes`
--

/*!40000 ALTER TABLE `operationsdes` DISABLE KEYS */;
/*!40000 ALTER TABLE `operationsdes` ENABLE KEYS */;


--
-- Definition of table `or_properties`
--

DROP TABLE IF EXISTS `or_properties`;
CREATE TABLE `or_properties` (
  `PROPERTY_ID` int(11) NOT NULL auto_increment,
  `PROPERTY_KEY` varchar(255) NOT NULL,
  `PROPERTY_VALUE` varchar(255) default NULL,
  PRIMARY KEY  (`PROPERTY_ID`),
  UNIQUE KEY `PROPERTY_KEY` (`PROPERTY_KEY`),
  UNIQUE KEY `PROPERTY_KEY_2` (`PROPERTY_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `or_properties`
--

/*!40000 ALTER TABLE `or_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `or_properties` ENABLE KEYS */;


--
-- Definition of table `or_tags`
--

DROP TABLE IF EXISTS `or_tags`;
CREATE TABLE `or_tags` (
  `TAG_ID` int(11) NOT NULL auto_increment,
  `TAGGED_OBJECT_ID` int(11) NOT NULL,
  `TAGGED_OBJECT_CLASS` varchar(255) NOT NULL,
  `TAG_VALUE` varchar(255) NOT NULL,
  `TAG_TYPE` varchar(255) NOT NULL,
  PRIMARY KEY  (`TAG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `or_tags`
--

/*!40000 ALTER TABLE `or_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `or_tags` ENABLE KEYS */;


--
-- Definition of table `paises_0101`
--

DROP TABLE IF EXISTS `paises_0101`;
CREATE TABLE `paises_0101` (
  `pai_id` char(2) NOT NULL default '',
  `pai_nombre_pais` varchar(20) default NULL,
  PRIMARY KEY  (`pai_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paises_0101`
--

/*!40000 ALTER TABLE `paises_0101` DISABLE KEYS */;
INSERT INTO `paises_0101` (`pai_id`,`pai_nombre_pais`) VALUES 
 ('10','AUSTRIA'),
 ('11','BELGIUM'),
 ('12','BURMA'),
 ('13','BOLIVIA'),
 ('14','BRAZIL'),
 ('15','BULGARIA'),
 ('17','CAMEROON'),
 ('18','CANADA'),
 ('19','SRI LANKA'),
 ('20','CHILE'),
 ('21','TAIWAN'),
 ('22','COLOMBIA'),
 ('24','KOREA, REPUBLIC OF'),
 ('26','DENMARK'),
 ('27','ARAB REPUBLIC OF EGY'),
 ('28','ECUADOR'),
 ('29','SPAIN'),
 ('31','UNITED STATES'),
 ('34','FINLAND'),
 ('35','FRANCE'),
 ('36','GREECE'),
 ('37','GUATEMALA'),
 ('38','HAITI'),
 ('41','INDIA'),
 ('42','INDONESIA'),
 ('43','IRAQ'),
 ('44','IRAN'),
 ('45','IRELAND'),
 ('46','ICELAND'),
 ('47','ISRAEL'),
 ('48','ITALY'),
 ('49','JAPAN'),
 ('50','JORDAN'),
 ('51','JAPAN'),
 ('52','LEBANON'),
 ('53','LIBYA'),
 ('54','LIBERIA'),
 ('55','MALAGASY REPUBLIC'),
 ('56','MOROCCO'),
 ('57','MEXICO'),
 ('58','NORWAY'),
 ('59','NEW CALEDONIA'),
 ('6','GERMANY, FEDERAL REP'),
 ('60','JAPAN'),
 ('61','NEW ZEALAND'),
 ('62','PAKISTAN'),
 ('64','NETHERLANDS'),
 ('65','PERU'),
 ('66','PHILIPPINES'),
 ('67','POLAND'),
 ('68','PORTUGAL'),
 ('7','GERMANY, DEMOCRATIC'),
 ('70','DOMINICAN REPUBLIC'),
 ('72','ALBANIA'),
 ('73','ROMANIA'),
 ('74','UNITED KINGDOM'),
 ('75','EL SALVADOR'),
 ('76','CHINA, THE PEOPLES R'),
 ('77','SWEDEN'),
 ('78','SWITZERLAND'),
 ('79','SURINAM'),
 ('8','ARGENTINA'),
 ('80','SYRIA'),
 ('86','THAILAND'),
 ('87','TOGO'),
 ('88','TUNISIA'),
 ('89','TURKEY'),
 ('9','AUSTRALIA'),
 ('90','UNION OF SOVIET SOCI'),
 ('91','SOUTH AFRICA'),
 ('92','URUGUAY'),
 ('93','VENEZUELA'),
 ('94','VIET-NAM'),
 ('95','YUGOSLAVIA'),
 ('99','UNKNOWN'),
 ('AG','ANTIGUA'),
 ('AL','ALGERIA'),
 ('AN','ANGOLA'),
 ('BA','BARBADOS'),
 ('BH','BAHAMAS'),
 ('BN','BONAIRE'),
 ('CA','CURACAO'),
 ('CI','CAYMAN ISLANDS'),
 ('CR','COSTA RICA'),
 ('CU','CUBA'),
 ('CV','CAPE VERDE'),
 ('CY','CYPRUS'),
 ('ES','ESTONIA'),
 ('ET','ETHIOPIA'),
 ('FJ','FIJI ISLANDS'),
 ('GA','GABON'),
 ('GH','GHANA'),
 ('GM','GAMBIA'),
 ('GN','GUINEA-BISSAU'),
 ('GR','GRENADA'),
 ('GU','GUINEA'),
 ('GY','GUYANA'),
 ('HK','HONG KONG'),
 ('HO','HONDURAS'),
 ('IC','IVORY COAST'),
 ('IN','INTERNATIONAL'),
 ('JA','JAMAICA'),
 ('KE','KENYA'),
 ('KU','KUWAIT'),
 ('LA','LATVIA'),
 ('LT','LITHUANIA'),
 ('MA','MAURITIUS'),
 ('MH','MARSHALL ISLANDS'),
 ('ML','MALTA'),
 ('MO','MONACO'),
 ('MS','MALAYSIA'),
 ('MU','MAURITANIA'),
 ('MZ','MOZAMBIQUE'),
 ('NC','NICARAGUA'),
 ('NI','NIGERIA'),
 ('OM','OMAN'),
 ('PA','PANAMA'),
 ('QA','QUATAR'),
 ('RC','CONGO'),
 ('RU','RUSSIA'),
 ('SA','SAUDI ARABIA'),
 ('SC','SEYCHELLES'),
 ('SE','SENEGAL'),
 ('SI','SINGAPORE'),
 ('SL','SIERRA LEONE'),
 ('SM','SOMALIA'),
 ('SO','SOLOMON ISLANDS'),
 ('SU','SUDAN'),
 ('SV','SAINT VINCENT'),
 ('TN','TONGA'),
 ('TT','TRINIDAD/TOBAGO'),
 ('UA','U. ARAB EMIRATES'),
 ('UR','UKRAINE'),
 ('WS','WESTERN SAMOA'),
 ('YM','YEMEN'),
 ('ZA','TANZANIA'),
 ('ZZ','MISCELLANEOUS ORGANI');
/*!40000 ALTER TABLE `paises_0101` ENABLE KEYS */;


--
-- Definition of table `profundidades_estandar`
--

DROP TABLE IF EXISTS `profundidades_estandar`;
CREATE TABLE `profundidades_estandar` (
  `id` int(11) NOT NULL auto_increment,
  `profundidad` double default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profundidades_estandar`
--

/*!40000 ALTER TABLE `profundidades_estandar` DISABLE KEYS */;
/*!40000 ALTER TABLE `profundidades_estandar` ENABLE KEYS */;


--
-- Definition of table `qrtz_blob_triggers`
--

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `TRIGGER_NAME` varchar(80) NOT NULL,
  `TRIGGER_GROUP` varchar(80) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY  (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `TRIGGER_NAME` (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qrtz_blob_triggers`
--

/*!40000 ALTER TABLE `qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_blob_triggers` ENABLE KEYS */;


--
-- Definition of table `qrtz_calendars`
--

DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `CALENDAR_NAME` varchar(80) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY  (`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qrtz_calendars`
--

/*!40000 ALTER TABLE `qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_calendars` ENABLE KEYS */;


--
-- Definition of table `qrtz_cron_triggers`
--

DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `TRIGGER_NAME` varchar(80) NOT NULL,
  `TRIGGER_GROUP` varchar(80) NOT NULL,
  `CRON_EXPRESSION` varchar(80) NOT NULL,
  `TIME_ZONE_ID` varchar(80) default NULL,
  PRIMARY KEY  (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `TRIGGER_NAME` (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qrtz_cron_triggers`
--

/*!40000 ALTER TABLE `qrtz_cron_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_cron_triggers` ENABLE KEYS */;


--
-- Definition of table `qrtz_fired_triggers`
--

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(80) NOT NULL,
  `TRIGGER_GROUP` varchar(80) NOT NULL,
  `IS_VOLATILE` varchar(1) NOT NULL,
  `INSTANCE_NAME` varchar(80) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(80) default NULL,
  `JOB_GROUP` varchar(80) default NULL,
  `IS_STATEFUL` varchar(1) default NULL,
  `REQUESTS_RECOVERY` varchar(1) default NULL,
  PRIMARY KEY  (`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qrtz_fired_triggers`
--

/*!40000 ALTER TABLE `qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_fired_triggers` ENABLE KEYS */;


--
-- Definition of table `qrtz_job_details`
--

DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `JOB_NAME` varchar(80) NOT NULL,
  `JOB_GROUP` varchar(80) NOT NULL,
  `DESCRIPTION` varchar(120) default NULL,
  `JOB_CLASS_NAME` varchar(128) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_VOLATILE` varchar(1) NOT NULL,
  `IS_STATEFUL` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY  (`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qrtz_job_details`
--

/*!40000 ALTER TABLE `qrtz_job_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_job_details` ENABLE KEYS */;


--
-- Definition of table `qrtz_job_listeners`
--

DROP TABLE IF EXISTS `qrtz_job_listeners`;
CREATE TABLE `qrtz_job_listeners` (
  `JOB_NAME` varchar(80) NOT NULL,
  `JOB_GROUP` varchar(80) NOT NULL,
  `JOB_LISTENER` varchar(80) NOT NULL,
  PRIMARY KEY  (`JOB_NAME`,`JOB_GROUP`,`JOB_LISTENER`),
  KEY `JOB_NAME` (`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `qrtz_job_listeners_ibfk_1` FOREIGN KEY (`JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qrtz_job_listeners`
--

/*!40000 ALTER TABLE `qrtz_job_listeners` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_job_listeners` ENABLE KEYS */;


--
-- Definition of table `qrtz_locks`
--

DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY  (`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qrtz_locks`
--

/*!40000 ALTER TABLE `qrtz_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_locks` ENABLE KEYS */;


--
-- Definition of table `qrtz_paused_trigger_grps`
--

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `TRIGGER_GROUP` varchar(80) NOT NULL,
  PRIMARY KEY  (`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qrtz_paused_trigger_grps`
--

/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` ENABLE KEYS */;


--
-- Definition of table `qrtz_scheduler_state`
--

DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `INSTANCE_NAME` varchar(80) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY  (`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qrtz_scheduler_state`
--

/*!40000 ALTER TABLE `qrtz_scheduler_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_scheduler_state` ENABLE KEYS */;


--
-- Definition of table `qrtz_simple_triggers`
--

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `TRIGGER_NAME` varchar(80) NOT NULL,
  `TRIGGER_GROUP` varchar(80) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(7) NOT NULL,
  PRIMARY KEY  (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `TRIGGER_NAME` (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qrtz_simple_triggers`
--

/*!40000 ALTER TABLE `qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simple_triggers` ENABLE KEYS */;


--
-- Definition of table `qrtz_trigger_listeners`
--

DROP TABLE IF EXISTS `qrtz_trigger_listeners`;
CREATE TABLE `qrtz_trigger_listeners` (
  `TRIGGER_NAME` varchar(80) NOT NULL,
  `TRIGGER_GROUP` varchar(80) NOT NULL,
  `TRIGGER_LISTENER` varchar(80) NOT NULL,
  PRIMARY KEY  (`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_LISTENER`),
  KEY `TRIGGER_NAME` (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_trigger_listeners_ibfk_1` FOREIGN KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qrtz_trigger_listeners`
--

/*!40000 ALTER TABLE `qrtz_trigger_listeners` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_trigger_listeners` ENABLE KEYS */;


--
-- Definition of table `qrtz_triggers`
--

DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `TRIGGER_NAME` varchar(80) NOT NULL,
  `TRIGGER_GROUP` varchar(80) NOT NULL,
  `JOB_NAME` varchar(80) NOT NULL,
  `JOB_GROUP` varchar(80) NOT NULL,
  `IS_VOLATILE` varchar(1) NOT NULL,
  `DESCRIPTION` varchar(120) default NULL,
  `NEXT_FIRE_TIME` bigint(13) default NULL,
  `PREV_FIRE_TIME` bigint(13) default NULL,
  `PRIORITY` int(11) default NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) default NULL,
  `CALENDAR_NAME` varchar(80) default NULL,
  `MISFIRE_INSTR` smallint(2) default NULL,
  `JOB_DATA` blob,
  PRIMARY KEY  (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `JOB_NAME` (`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qrtz_triggers`
--

/*!40000 ALTER TABLE `qrtz_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_triggers` ENABLE KEYS */;


--
-- Definition of table `regions`
--

DROP TABLE IF EXISTS `regions`;
CREATE TABLE `regions` (
  `id` smallint(6) NOT NULL auto_increment,
  `west` double default NULL,
  `south` double default NULL,
  `east` double default NULL,
  `north` double default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `regions`
--

/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` (`id`,`west`,`south`,`east`,`north`) VALUES 
 (1,-180,-90,180,90),
 (2,-180,-85,180,90),
 (3,-90,-70,20,90),
 (4,20,-70,127,28),
 (5,120,-70,180,90),
 (6,-180,-85,180,-60),
 (7,131,-18,142,-3),
 (8,114,-9,117,-7),
 (9,120.5,-8.5,133,-1),
 (10,144,-6.5,152.5,-2),
 (11,117,1,125,8),
 (12,126,-3,132,-2),
 (13,142,-30,170,-7),
 (14,117,-8.5,123,-5.5),
 (15,143,-10,147,-7.5),
 (16,99,7,105,14),
 (17,105,-8,119,-3),
 (18,116,-4,119.5,1),
 (19,123,-1.5,128,8),
 (20,118,-11,125,-8),
 (21,147,-12,162,-4.5),
 (22,102,-3,120,25),
 (23,147,-53,175,-29),
 (24,123,-15,133,-8),
 (25,-180,-90,180,-60),
 (26,112,-44,154,-9),
 (27,125,-10,128,-8),
 (28,100,-12,141,2),
 (29,157,-23.5,174,-17),
 (30,164,-48,180,-32),
 (31,141,-12,156,-2),
 (32,155,-13,171,-5),
 (33,157.5,-21,174,-13),
 (34,45,-90,160,-60),
 (35,148.5,-36,149.5,-35),
 (36,141,-37.5,154,-28),
 (37,129,-26,138,-11),
 (38,138,-29.5,153.5,-9),
 (39,129,-38.5,141,-26),
 (40,144.5,-44,148.5,-39.5),
 (41,141,-39,150,-34),
 (42,112.5,-35.5,129,-13.5),
 (43,73,-53.3,74,-52.8),
 (44,105.1,-11,106.1,-10),
 (45,96.3,-12.4,97.3,-11.4),
 (46,73,-53.3,74,-52.8),
 (47,158.7,-31.8,159.3,-31.2),
 (48,158.5,-55,159.5,-54),
 (49,167.6,-29.6,168,-29),
 (50,44,-58,162,-71),
 (51,144,-36.5,171.8,-9.6),
 (52,66,-49,78,-57),
 (53,155,-36,162,-27),
 (54,151,-50,165,-59),
 (55,164,-25,172,-33),
 (57,125,-18,142,-8),
 (58,127.5,-17.7,142.1,-8.9),
 (59,109.2,-27.7,129,-11.2),
 (60,131.4,-58.45,164.7,-35.3),
 (61,109.2,-38.5,138,-25.5),
 (62,93,-7,109,-15),
 (63,108,-19,116,-34),
 (64,141.5,-13,142,-12.5),
 (65,114,-24,122,-17),
 (66,144,-41,150,-37),
 (67,150.9,-34.1,151.1,-33.9),
 (68,151.2,-33.7,151.4,-33.5),
 (69,147.2,-43.1,147.5,-42.7),
 (70,114,-23,115,-21),
 (71,114.5,-34.5,115.5,-33.5),
 (72,147.5,-40.5,148.5,-39.5),
 (73,152.5,-26,153.5,-24.5),
 (74,115,-34,116,-33),
 (75,118,-35,136,-31),
 (76,141,-24,153,-9),
 (77,145,-18,147,-15),
 (78,151.5,-24.5,153,-23),
 (79,146,-21,150.5,-18),
 (80,143,-15,145.5,-11),
 (81,149,-23,153,-21),
 (82,136,-14.5,137,-13.5),
 (83,136,-18,142,-11),
 (84,137,-35,139,-34),
 (85,152,-26,153,-25),
 (86,150.5,-35.5,151.5,-34.5),
 (87,127,-15,130,-13),
 (88,136.5,-36.5,138.5,-35.5),
 (89,143.5,-40.5,144.5,-39.5),
 (90,123,-18,124,-16),
 (91,144.5,-43.5,145.5,-42.5),
 (92,130,-12,132,-11),
 (93,153,-28,154,-27),
 (94,139,-17,140,-16),
 (95,151.1,-33.9,151.3,-33.7),
 (96,144.3,-38.3,145.2,-37.8),
 (97,113,-27,115,-25),
 (98,136,-35,138,-32),
 (99,115.5,-32,116.5,-31.5),
 (100,142,-11,143,-9),
 (101,131,-13,133,-11),
 (102,138,-35,139,-34.5),
 (103,117.5,-35.5,118.5,-34.5),
 (104,153,-28,153.5,-27),
 (105,122,-18.5,122.5,-17.5),
 (106,115.5,-33.5,116,-33),
 (107,152,-25,152.5,-24.5),
 (108,145.5,-41.5,146,-41),
 (109,145.5,-17,146,-16.5),
 (110,130.5,-13,131,-12),
 (111,116.5,-21,117,-20.5),
 (112,146,-41.5,146.5,-41),
 (113,121.5,-34,122,-33.5),
 (114,115.5,-32.5,116,-32),
 (115,114.5,-29,115,-28.5),
 (116,151,-24,151.5,-23.5),
 (117,147,-43,147.5,-42.5),
 (118,147,-41.5,147.5,-41),
 (119,149,-21.5,149.5,-21),
 (120,144.5,-38.5,145.5,-37.5),
 (121,151.5,-33.5,152,-32.5),
 (122,115.5,-32.5,116,-31.5),
 (123,118.5,-20.5,119,-20),
 (124,141.5,-38.5,142,-38),
 (125,150.5,-23.5,151,-23),
 (126,151,-34.5,151.5,-33.5),
 (127,146.5,-19.5,147,-19),
 (128,150.5,-34.5,151,-34),
 (129,67,-73,74,-68),
 (130,110,-66.3,111,-65),
 (131,152,-69,153,-68.5),
 (132,85,-66,100,-62),
 (133,77.5,-69,78.2,-68),
 (134,130,-66,145,-62),
 (135,62,-67.6,63,-67),
 (136,74,-70,77,-67),
 (137,75,-70,75.5,-69.5),
 (138,95,-66,104,-64.8),
 (139,108.5,-67,111,-65),
 (140,119,-65.8,120,-65.6),
 (141,82,-67,89,-66),
 (142,127,-60,145,-35);
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;


--
-- Definition of table `regionsdes`
--

DROP TABLE IF EXISTS `regionsdes`;
CREATE TABLE `regionsdes` (
  `idDes` smallint(6) NOT NULL default '0',
  `langId` varchar(255) NOT NULL default '0',
  `label` varchar(255) default NULL,
  PRIMARY KEY  (`idDes`,`langId`),
  KEY `FK896957B394DC043F` (`idDes`),
  CONSTRAINT `FK896957B394DC043F` FOREIGN KEY (`idDes`) REFERENCES `regions` (`id`),
  CONSTRAINT `FK_regionsdes_1` FOREIGN KEY (`idDes`) REFERENCES `regions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `regionsdes`
--

/*!40000 ALTER TABLE `regionsdes` DISABLE KEYS */;
INSERT INTO `regionsdes` (`idDes`,`langId`,`label`) VALUES 
 (1,'cn','World (Global / Oceans)'),
 (1,'en','World (Global / Oceans)'),
 (1,'es','World (Global / Oceans)'),
 (1,'fr','World (Global / Oceans)'),
 (2,'cn','World Ocean (Global / Oceans)'),
 (2,'en','World Ocean (Global / Oceans)'),
 (2,'es','World Ocean (Global / Oceans)'),
 (2,'fr','World Ocean (Global / Oceans)'),
 (3,'cn','Atlantic Ocean (Global / Oceans)'),
 (3,'en','Atlantic Ocean (Global / Oceans)'),
 (3,'es','Atlantic Ocean (Global / Oceans)'),
 (3,'fr','Atlantic Ocean (Global / Oceans)'),
 (4,'cn','Indian Ocean (Global / Oceans)'),
 (4,'en','Indian Ocean (Global / Oceans)'),
 (4,'es','Indian Ocean (Global / Oceans)'),
 (4,'fr','Indian Ocean (Global / Oceans)'),
 (5,'cn','Pacific Ocean (Global / Oceans)'),
 (5,'en','Pacific Ocean (Global / Oceans)'),
 (5,'es','Pacific Ocean (Global / Oceans)'),
 (5,'fr','Pacific Ocean (Global / Oceans)'),
 (6,'cn','Southern Ocean (Global / Oceans)'),
 (6,'en','Southern Ocean (Global / Oceans)'),
 (6,'es','Southern Ocean (Global / Oceans)'),
 (6,'fr','Southern Ocean (Global / Oceans)'),
 (7,'cn','Arafura Sea (Regional Seas)'),
 (7,'en','Arafura Sea (Regional Seas)'),
 (7,'es','Arafura Sea (Regional Seas)'),
 (7,'fr','Arafura Sea (Regional Seas)'),
 (8,'cn','Bali Sea (Regional Seas)'),
 (8,'en','Bali Sea (Regional Seas)'),
 (8,'es','Bali Sea (Regional Seas)'),
 (8,'fr','Bali Sea (Regional Seas)'),
 (9,'cn','Banda Sea (Regional Seas)'),
 (9,'en','Banda Sea (Regional Seas)'),
 (9,'es','Banda Sea (Regional Seas)'),
 (9,'fr','Banda Sea (Regional Seas)'),
 (10,'cn','Bismarck Sea (Regional Seas)'),
 (10,'en','Bismarck Sea (Regional Seas)'),
 (10,'es','Bismarck Sea (Regional Seas)'),
 (10,'fr','Bismarck Sea (Regional Seas)'),
 (11,'cn','Celebes Sea (Regional Seas)'),
 (11,'en','Celebes Sea (Regional Seas)'),
 (11,'es','Celebes Sea (Regional Seas)'),
 (11,'fr','Celebes Sea (Regional Seas)'),
 (12,'cn','Ceram Sea (Regional Seas)'),
 (12,'en','Ceram Sea (Regional Seas)'),
 (12,'es','Ceram Sea (Regional Seas)'),
 (12,'fr','Ceram Sea (Regional Seas)'),
 (13,'cn','Coral Sea (Regional Seas)'),
 (13,'en','Coral Sea (Regional Seas)'),
 (13,'es','Coral Sea (Regional Seas)'),
 (13,'fr','Coral Sea (Regional Seas)'),
 (14,'cn','Flores Sea (Regional Seas)'),
 (14,'en','Flores Sea (Regional Seas)'),
 (14,'es','Flores Sea (Regional Seas)'),
 (14,'fr','Flores Sea (Regional Seas)'),
 (15,'cn','Gulf of Papua (Regional Seas)'),
 (15,'en','Gulf of Papua (Regional Seas)'),
 (15,'es','Gulf of Papua (Regional Seas)'),
 (15,'fr','Gulf of Papua (Regional Seas)'),
 (16,'cn','Gulf of Thailand (Regional Seas)'),
 (16,'en','Gulf of Thailand (Regional Seas)'),
 (16,'es','Gulf of Thailand (Regional Seas)'),
 (16,'fr','Gulf of Thailand (Regional Seas)'),
 (17,'cn','Java Sea (Regional Seas)'),
 (17,'en','Java Sea (Regional Seas)'),
 (17,'es','Java Sea (Regional Seas)'),
 (17,'fr','Java Sea (Regional Seas)'),
 (18,'cn','Makassar Strait (Regional Seas)'),
 (18,'en','Makassar Strait (Regional Seas)'),
 (18,'es','Makassar Strait (Regional Seas)'),
 (18,'fr','Makassar Strait (Regional Seas)'),
 (19,'cn','Molucca Sea (Regional Seas)'),
 (19,'en','Molucca Sea (Regional Seas)'),
 (19,'es','Molucca Sea (Regional Seas)'),
 (19,'fr','Molucca Sea (Regional Seas)'),
 (20,'cn','Savu Sea (Regional Seas)'),
 (20,'en','Savu Sea (Regional Seas)'),
 (20,'es','Savu Sea (Regional Seas)'),
 (20,'fr','Savu Sea (Regional Seas)'),
 (21,'cn','Solomon Sea (Regional Seas)'),
 (21,'en','Solomon Sea (Regional Seas)'),
 (21,'es','Solomon Sea (Regional Seas)'),
 (21,'fr','Solomon Sea (Regional Seas)'),
 (22,'cn','South China Sea (Regional Seas)'),
 (22,'en','South China Sea (Regional Seas)'),
 (22,'es','South China Sea (Regional Seas)'),
 (22,'fr','South China Sea (Regional Seas)'),
 (23,'cn','Tasman Sea (Regional Seas)'),
 (23,'en','Tasman Sea (Regional Seas)'),
 (23,'es','Tasman Sea (Regional Seas)'),
 (23,'fr','Tasman Sea (Regional Seas)'),
 (24,'cn','Timor Sea (Regional Seas)'),
 (24,'en','Timor Sea (Regional Seas)'),
 (24,'es','Timor Sea (Regional Seas)'),
 (24,'fr','Timor Sea (Regional Seas)'),
 (25,'cn','Antarctica (Continents)'),
 (25,'en','Antarctica (Continents)'),
 (25,'es','Antarctica (Continents)'),
 (25,'fr','Antarctica (Continents)'),
 (26,'cn','Australia (Countries)'),
 (26,'en','Australia (Countries)'),
 (26,'es','Australia (Countries)'),
 (26,'fr','Australia (Countries)'),
 (27,'cn','Timor-Leste (Countries)'),
 (27,'en','Timor-Leste (Countries)'),
 (27,'es','Timor-Leste (Countries)'),
 (27,'fr','Timor-Leste (Countries)'),
 (28,'cn','Indonesia (Countries)'),
 (28,'en','Indonesia (Countries)'),
 (28,'es','Indonesia (Countries)'),
 (28,'fr','Indonesia (Countries)'),
 (29,'cn','New Caledonia (Countries)'),
 (29,'en','New Caledonia (Countries)'),
 (29,'es','New Caledonia (Countries)'),
 (29,'fr','New Caledonia (Countries)'),
 (30,'cn','New Zealand (Countries)'),
 (30,'en','New Zealand (Countries)'),
 (30,'es','New Zealand (Countries)'),
 (30,'fr','New Zealand (Countries)'),
 (31,'cn','Papua New Guinea (Countries)'),
 (31,'en','Papua New Guinea (Countries)'),
 (31,'es','Papua New Guinea (Countries)'),
 (31,'fr','Papua New Guinea (Countries)'),
 (32,'cn','Solomon Islands (Countries)'),
 (32,'en','Solomon Islands (Countries)'),
 (32,'es','Solomon Islands (Countries)'),
 (32,'fr','Solomon Islands (Countries)'),
 (33,'cn','Vanuatu (Countries)'),
 (33,'en','Vanuatu (Countries)'),
 (33,'es','Vanuatu (Countries)'),
 (33,'fr','Vanuatu (Countries)'),
 (34,'cn','Australian Antarctic Territory (States, Territories (Australia))'),
 (34,'en','Australian Antarctic Territory (States, Territories (Australia))'),
 (34,'es','Australian Antarctic Territory (States, Territories (Australia))'),
 (34,'fr','Australian Antarctic Territory (States, Territories (Australia))'),
 (35,'cn','Australian Capital Territory (States, Territories (Australia))'),
 (35,'en','Australian Capital Territory (States, Territories (Australia))'),
 (35,'es','Australian Capital Territory (States, Territories (Australia))'),
 (35,'fr','Australian Capital Territory (States, Territories (Australia))'),
 (36,'cn','New South Wales (States, Territories (Australia))'),
 (36,'en','New South Wales (States, Territories (Australia))'),
 (36,'es','New South Wales (States, Territories (Australia))'),
 (36,'fr','New South Wales (States, Territories (Australia))'),
 (37,'cn','Northern Territory (States, Territories (Australia))'),
 (37,'en','Northern Territory (States, Territories (Australia))'),
 (37,'es','Northern Territory (States, Territories (Australia))'),
 (37,'fr','Northern Territory (States, Territories (Australia))'),
 (38,'cn','Queensland (States, Territories (Australia))'),
 (38,'en','Queensland (States, Territories (Australia))'),
 (38,'es','Queensland (States, Territories (Australia))'),
 (38,'fr','Queensland (States, Territories (Australia))'),
 (39,'cn','South Australia (States, Territories (Australia))'),
 (39,'en','South Australia (States, Territories (Australia))'),
 (39,'es','South Australia (States, Territories (Australia))'),
 (39,'fr','South Australia (States, Territories (Australia))'),
 (40,'cn','Tasmania (States, Territories (Australia))'),
 (40,'en','Tasmania (States, Territories (Australia))'),
 (40,'es','Tasmania (States, Territories (Australia))'),
 (40,'fr','Tasmania (States, Territories (Australia))'),
 (41,'cn','Victoria (States, Territories (Australia))'),
 (41,'en','Victoria (States, Territories (Australia))'),
 (41,'es','Victoria (States, Territories (Australia))'),
 (41,'fr','Victoria (States, Territories (Australia))'),
 (42,'cn','Western Australia (States, Territories (Australia))'),
 (42,'en','Western Australia (States, Territories (Australia))'),
 (42,'es','Western Australia (States, Territories (Australia))'),
 (42,'fr','Western Australia (States, Territories (Australia))'),
 (43,'cn','Ashmore & Cartier Islands (Offshore Islands (Australia))'),
 (43,'en','Ashmore & Cartier Islands (Offshore Islands (Australia))'),
 (43,'es','Ashmore & Cartier Islands (Offshore Islands (Australia))'),
 (43,'fr','Ashmore & Cartier Islands (Offshore Islands (Australia))'),
 (44,'cn','Christmas Island (Offshore Islands (Australia))'),
 (44,'en','Christmas Island (Offshore Islands (Australia))'),
 (44,'es','Christmas Island (Offshore Islands (Australia))'),
 (44,'fr','Christmas Island (Offshore Islands (Australia))'),
 (45,'cn','Cocos (Keeling) Island (Offshore Islands (Australia))'),
 (45,'en','Cocos (Keeling) Island (Offshore Islands (Australia))'),
 (45,'es','Cocos (Keeling) Island (Offshore Islands (Australia))'),
 (45,'fr','Cocos (Keeling) Island (Offshore Islands (Australia))'),
 (46,'cn','Heard & McDonald Islands (Offshore Islands (Australia))'),
 (46,'en','Heard & McDonald Islands (Offshore Islands (Australia))'),
 (46,'es','Heard & McDonald Islands (Offshore Islands (Australia))'),
 (46,'fr','Heard & McDonald Islands (Offshore Islands (Australia))'),
 (47,'cn','Lord Howe Island (Offshore Islands (Australia))'),
 (47,'en','Lord Howe Island (Offshore Islands (Australia))'),
 (47,'es','Lord Howe Island (Offshore Islands (Australia))'),
 (47,'fr','Lord Howe Island (Offshore Islands (Australia))'),
 (48,'cn','Macquarie Island (Offshore Islands (Australia))'),
 (48,'en','Macquarie Island (Offshore Islands (Australia))'),
 (48,'es','Macquarie Island (Offshore Islands (Australia))'),
 (48,'fr','Macquarie Island (Offshore Islands (Australia))'),
 (49,'cn','Norfolk Island (Offshore Islands (Australia))'),
 (49,'en','Norfolk Island (Offshore Islands (Australia))'),
 (49,'es','Norfolk Island (Offshore Islands (Australia))'),
 (49,'fr','Norfolk Island (Offshore Islands (Australia))'),
 (50,'cn','Australian Antarctic (Marine Planning Regions (Australia))'),
 (50,'en','Australian Antarctic (Marine Planning Regions (Australia))'),
 (50,'es','Australian Antarctic (Marine Planning Regions (Australia))'),
 (50,'fr','Australian Antarctic (Marine Planning Regions (Australia))'),
 (51,'cn','East (Marine Planning Regions (Australia))'),
 (51,'en','East (Marine Planning Regions (Australia))'),
 (51,'es','East (Marine Planning Regions (Australia))'),
 (51,'fr','East (Marine Planning Regions (Australia))'),
 (52,'cn','Kerguelen (Marine Planning Regions (Australia))'),
 (52,'en','Kerguelen (Marine Planning Regions (Australia))'),
 (52,'es','Kerguelen (Marine Planning Regions (Australia))'),
 (52,'fr','Kerguelen (Marine Planning Regions (Australia))'),
 (53,'cn','Lord Howe (Marine Planning Regions (Australia))'),
 (53,'en','Lord Howe (Marine Planning Regions (Australia))'),
 (53,'es','Lord Howe (Marine Planning Regions (Australia))'),
 (53,'fr','Lord Howe (Marine Planning Regions (Australia))'),
 (54,'cn','Macquarie (Marine Planning Regions (Australia))'),
 (54,'en','Macquarie (Marine Planning Regions (Australia))'),
 (54,'es','Macquarie (Marine Planning Regions (Australia))'),
 (54,'fr','Macquarie (Marine Planning Regions (Australia))'),
 (55,'cn','Norfolk (Marine Planning Regions (Australia))'),
 (55,'en','Norfolk (Marine Planning Regions (Australia))'),
 (55,'es','Norfolk (Marine Planning Regions (Australia))'),
 (55,'fr','Norfolk (Marine Planning Regions (Australia))'),
 (57,'cn','North (Marine Planning Regions (Australia))'),
 (57,'en','North (Marine Planning Regions (Australia))'),
 (57,'es','North (Marine Planning Regions (Australia))'),
 (57,'fr','North (Marine Planning Regions (Australia))'),
 (58,'cn','North-east (Marine Planning Regions (Australia))'),
 (58,'en','North-east (Marine Planning Regions (Australia))'),
 (58,'es','North-east (Marine Planning Regions (Australia))'),
 (58,'fr','North-east (Marine Planning Regions (Australia))'),
 (59,'cn','North-west (Marine Planning Regions (Australia))'),
 (59,'en','North-west (Marine Planning Regions (Australia))'),
 (59,'es','North-west (Marine Planning Regions (Australia))'),
 (59,'fr','North-west (Marine Planning Regions (Australia))'),
 (60,'cn','South-east (Marine Planning Regions (Australia))'),
 (60,'en','South-east (Marine Planning Regions (Australia))'),
 (60,'es','South-east (Marine Planning Regions (Australia))'),
 (60,'fr','South-east (Marine Planning Regions (Australia))'),
 (61,'cn','South-west (Marine Planning Regions (Australia))'),
 (61,'en','South-west (Marine Planning Regions (Australia))'),
 (61,'es','South-west (Marine Planning Regions (Australia))'),
 (61,'fr','South-west (Marine Planning Regions (Australia))'),
 (62,'cn','Sunda (Marine Planning Regions (Australia))'),
 (62,'en','Sunda (Marine Planning Regions (Australia))'),
 (62,'es','Sunda (Marine Planning Regions (Australia))'),
 (62,'fr','Sunda (Marine Planning Regions (Australia))'),
 (63,'cn','Western-central (Marine Planning Regions (Australia))'),
 (63,'en','Western-central (Marine Planning Regions (Australia))'),
 (63,'es','Western-central (Marine Planning Regions (Australia))'),
 (63,'fr','Western-central (Marine Planning Regions (Australia))'),
 (64,'cn','Albatross Bay, QLD (Marine Features (Australia))'),
 (64,'en','Albatross Bay, QLD (Marine Features (Australia))'),
 (64,'es','Albatross Bay, QLD (Marine Features (Australia))'),
 (64,'fr','Albatross Bay, QLD (Marine Features (Australia))'),
 (65,'cn','Australian North West Shelf, WA (Marine Features (Australia))'),
 (65,'en','Australian North West Shelf, WA (Marine Features (Australia))'),
 (65,'es','Australian North West Shelf, WA (Marine Features (Australia))'),
 (65,'fr','Australian North West Shelf, WA (Marine Features (Australia))'),
 (66,'cn','Bass Strait, TAS/VIC (Marine Features (Australia))'),
 (66,'en','Bass Strait, TAS/VIC (Marine Features (Australia))'),
 (66,'es','Bass Strait, TAS/VIC (Marine Features (Australia))'),
 (66,'fr','Bass Strait, TAS/VIC (Marine Features (Australia))'),
 (67,'cn','Botany Bay, NSW (Marine Features (Australia))'),
 (67,'en','Botany Bay, NSW (Marine Features (Australia))'),
 (67,'es','Botany Bay, NSW (Marine Features (Australia))'),
 (67,'fr','Botany Bay, NSW (Marine Features (Australia))'),
 (68,'cn','Broken Bay, NSW (Marine Features (Australia))'),
 (68,'en','Broken Bay, NSW (Marine Features (Australia))'),
 (68,'es','Broken Bay, NSW (Marine Features (Australia))'),
 (68,'fr','Broken Bay, NSW (Marine Features (Australia))'),
 (69,'cn','Derwent Estuary, TAS (Marine Features (Australia))'),
 (69,'en','Derwent Estuary, TAS (Marine Features (Australia))'),
 (69,'es','Derwent Estuary, TAS (Marine Features (Australia))'),
 (69,'fr','Derwent Estuary, TAS (Marine Features (Australia))'),
 (70,'cn','Exmouth Gulf, WA (Marine Features (Australia))'),
 (70,'en','Exmouth Gulf, WA (Marine Features (Australia))'),
 (70,'es','Exmouth Gulf, WA (Marine Features (Australia))'),
 (70,'fr','Exmouth Gulf, WA (Marine Features (Australia))'),
 (71,'cn','Flinders Bay, WA (Marine Features (Australia))'),
 (71,'en','Flinders Bay, WA (Marine Features (Australia))'),
 (71,'es','Flinders Bay, WA (Marine Features (Australia))'),
 (71,'fr','Flinders Bay, WA (Marine Features (Australia))'),
 (72,'cn','Flinders Island, TAS (Marine Features (Australia))'),
 (72,'en','Flinders Island, TAS (Marine Features (Australia))'),
 (72,'es','Flinders Island, TAS (Marine Features (Australia))'),
 (72,'fr','Flinders Island, TAS (Marine Features (Australia))'),
 (73,'cn','Fraser Island, QLD (Marine Features (Australia))'),
 (73,'en','Fraser Island, QLD (Marine Features (Australia))'),
 (73,'es','Fraser Island, QLD (Marine Features (Australia))'),
 (73,'fr','Fraser Island, QLD (Marine Features (Australia))'),
 (74,'cn','Geographe Bay, WA (Marine Features (Australia))'),
 (74,'en','Geographe Bay, WA (Marine Features (Australia))'),
 (74,'es','Geographe Bay, WA (Marine Features (Australia))'),
 (74,'fr','Geographe Bay, WA (Marine Features (Australia))'),
 (75,'cn','Great Australian Bight, SA/WA (Marine Features (Australia))'),
 (75,'en','Great Australian Bight, SA/WA (Marine Features (Australia))'),
 (75,'es','Great Australian Bight, SA/WA (Marine Features (Australia))'),
 (75,'fr','Great Australian Bight, SA/WA (Marine Features (Australia))'),
 (76,'cn','Great Barrier Reef, QLD (Marine Features (Australia))'),
 (76,'en','Great Barrier Reef, QLD (Marine Features (Australia))'),
 (76,'es','Great Barrier Reef, QLD (Marine Features (Australia))'),
 (76,'fr','Great Barrier Reef, QLD (Marine Features (Australia))'),
 (77,'cn','Great Barrier Reef Cairns Section, QLD (Marine Features (Australia))'),
 (77,'en','Great Barrier Reef Cairns Section, QLD (Marine Features (Australia))'),
 (77,'es','Great Barrier Reef Cairns Section, QLD (Marine Features (Australia))'),
 (77,'fr','Great Barrier Reef Cairns Section, QLD (Marine Features (Australia))'),
 (78,'cn','Great Barrier Reef Capricorn/Bunker Section, QLD (Marine Features (Australia))'),
 (78,'en','Great Barrier Reef Capricorn/Bunker Section, QLD (Marine Features (Australia))'),
 (78,'es','Great Barrier Reef Capricorn/Bunker Section, QLD (Marine Features (Australia))'),
 (78,'fr','Great Barrier Reef Capricorn/Bunker Section, QLD (Marine Features (Australia))'),
 (79,'cn','Great Barrier Reef Central Section, QLD (Marine Features (Australia))'),
 (79,'en','Great Barrier Reef Central Section, QLD (Marine Features (Australia))'),
 (79,'es','Great Barrier Reef Central Section, QLD (Marine Features (Australia))'),
 (79,'fr','Great Barrier Reef Central Section, QLD (Marine Features (Australia))'),
 (80,'cn','Great Barrier Reef Far North Section, QLD (Marine Features (Australia))'),
 (80,'en','Great Barrier Reef Far North Section, QLD (Marine Features (Australia))'),
 (80,'es','Great Barrier Reef Far North Section, QLD (Marine Features (Australia))'),
 (80,'fr','Great Barrier Reef Far North Section, QLD (Marine Features (Australia))'),
 (81,'cn','Great Barrier Reef Mackay Section, QLD (Marine Features (Australia))'),
 (81,'en','Great Barrier Reef Mackay Section, QLD (Marine Features (Australia))'),
 (81,'es','Great Barrier Reef Mackay Section, QLD (Marine Features (Australia))'),
 (81,'fr','Great Barrier Reef Mackay Section, QLD (Marine Features (Australia))'),
 (82,'cn','Groote Eylandt, NT (Marine Features (Australia))'),
 (82,'en','Groote Eylandt, NT (Marine Features (Australia))'),
 (82,'es','Groote Eylandt, NT (Marine Features (Australia))'),
 (82,'fr','Groote Eylandt, NT (Marine Features (Australia))'),
 (83,'cn','Gulf of Carpentaria, NT/QLD (Marine Features (Australia))'),
 (83,'en','Gulf of Carpentaria, NT/QLD (Marine Features (Australia))'),
 (83,'es','Gulf of Carpentaria, NT/QLD (Marine Features (Australia))'),
 (83,'fr','Gulf of Carpentaria, NT/QLD (Marine Features (Australia))'),
 (84,'cn','Gulf St. Vincent, SE (Marine Features (Australia))'),
 (84,'en','Gulf St. Vincent, SE (Marine Features (Australia))'),
 (84,'es','Gulf St. Vincent, SE (Marine Features (Australia))'),
 (84,'fr','Gulf St. Vincent, SE (Marine Features (Australia))'),
 (85,'cn','Hervey Bay, QLD (Marine Features (Australia))'),
 (85,'en','Hervey Bay, QLD (Marine Features (Australia))'),
 (85,'es','Hervey Bay, QLD (Marine Features (Australia))'),
 (85,'fr','Hervey Bay, QLD (Marine Features (Australia))'),
 (86,'cn','Jervis Bay, ACT (Marine Features (Australia))'),
 (86,'en','Jervis Bay, ACT (Marine Features (Australia))'),
 (86,'es','Jervis Bay, ACT (Marine Features (Australia))'),
 (86,'fr','Jervis Bay, ACT (Marine Features (Australia))'),
 (87,'cn','Joseph Bonaparte Gulf, NT/WA (Marine Features (Australia))'),
 (87,'en','Joseph Bonaparte Gulf, NT/WA (Marine Features (Australia))'),
 (87,'es','Joseph Bonaparte Gulf, NT/WA (Marine Features (Australia))'),
 (87,'fr','Joseph Bonaparte Gulf, NT/WA (Marine Features (Australia))'),
 (88,'cn','Kangaroo Island, SA (Marine Features (Australia))'),
 (88,'en','Kangaroo Island, SA (Marine Features (Australia))'),
 (88,'es','Kangaroo Island, SA (Marine Features (Australia))'),
 (88,'fr','Kangaroo Island, SA (Marine Features (Australia))'),
 (89,'cn','King Island, TAS (Marine Features (Australia))'),
 (89,'en','King Island, TAS (Marine Features (Australia))'),
 (89,'es','King Island, TAS (Marine Features (Australia))'),
 (89,'fr','King Island, TAS (Marine Features (Australia))'),
 (90,'cn','King Sound, WA (Marine Features (Australia))'),
 (90,'en','King Sound, WA (Marine Features (Australia))'),
 (90,'es','King Sound, WA (Marine Features (Australia))'),
 (90,'fr','King Sound, WA (Marine Features (Australia))'),
 (91,'cn','Macquarie Harbour, TAS (Marine Features (Australia))'),
 (91,'en','Macquarie Harbour, TAS (Marine Features (Australia))'),
 (91,'es','Macquarie Harbour, TAS (Marine Features (Australia))'),
 (91,'fr','Macquarie Harbour, TAS (Marine Features (Australia))'),
 (92,'cn','Melville Island, NT (Marine Features (Australia))'),
 (92,'en','Melville Island, NT (Marine Features (Australia))'),
 (92,'es','Melville Island, NT (Marine Features (Australia))'),
 (92,'fr','Melville Island, NT (Marine Features (Australia))'),
 (93,'cn','Moreton Bay, QLD (Marine Features (Australia))'),
 (93,'en','Moreton Bay, QLD (Marine Features (Australia))'),
 (93,'es','Moreton Bay, QLD (Marine Features (Australia))'),
 (93,'fr','Moreton Bay, QLD (Marine Features (Australia))'),
 (94,'cn','Mornington Island, QLD (Marine Features (Australia))'),
 (94,'en','Mornington Island, QLD (Marine Features (Australia))'),
 (94,'es','Mornington Island, QLD (Marine Features (Australia))'),
 (94,'fr','Mornington Island, QLD (Marine Features (Australia))'),
 (95,'cn','Port Hacking, NSW (Marine Features (Australia))'),
 (95,'en','Port Hacking, NSW (Marine Features (Australia))'),
 (95,'es','Port Hacking, NSW (Marine Features (Australia))'),
 (95,'fr','Port Hacking, NSW (Marine Features (Australia))'),
 (96,'cn','Port Phillip Bay, VIC (Marine Features (Australia))'),
 (96,'en','Port Phillip Bay, VIC (Marine Features (Australia))'),
 (96,'es','Port Phillip Bay, VIC (Marine Features (Australia))'),
 (96,'fr','Port Phillip Bay, VIC (Marine Features (Australia))'),
 (97,'cn','Shark Bay, WA (Marine Features (Australia))'),
 (97,'en','Shark Bay, WA (Marine Features (Australia))'),
 (97,'es','Shark Bay, WA (Marine Features (Australia))'),
 (97,'fr','Shark Bay, WA (Marine Features (Australia))'),
 (98,'cn','Spencer Gulf, SA (Marine Features (Australia))'),
 (98,'en','Spencer Gulf, SA (Marine Features (Australia))'),
 (98,'es','Spencer Gulf, SA (Marine Features (Australia))'),
 (98,'fr','Spencer Gulf, SA (Marine Features (Australia))'),
 (99,'cn','Swan River, WA (Marine Features (Australia))'),
 (99,'en','Swan River, WA (Marine Features (Australia))'),
 (99,'es','Swan River, WA (Marine Features (Australia))'),
 (99,'fr','Swan River, WA (Marine Features (Australia))'),
 (100,'cn','Torres Strait, QLD (Marine Features (Australia))'),
 (100,'en','Torres Strait, QLD (Marine Features (Australia))'),
 (100,'es','Torres Strait, QLD (Marine Features (Australia))'),
 (100,'fr','Torres Strait, QLD (Marine Features (Australia))'),
 (101,'cn','Van Diemen Gulf, NT (Marine Features (Australia))'),
 (101,'en','Van Diemen Gulf, NT (Marine Features (Australia))'),
 (101,'es','Van Diemen Gulf, NT (Marine Features (Australia))'),
 (101,'fr','Van Diemen Gulf, NT (Marine Features (Australia))'),
 (102,'cn','Adelaide, SA (Coastal Cities / Towns (Australia))'),
 (102,'en','Adelaide, SA (Coastal Cities / Towns (Australia))'),
 (102,'es','Adelaide, SA (Coastal Cities / Towns (Australia))'),
 (102,'fr','Adelaide, SA (Coastal Cities / Towns (Australia))'),
 (103,'cn','Albany, WA (Coastal Cities / Towns (Australia))'),
 (103,'en','Albany, WA (Coastal Cities / Towns (Australia))'),
 (103,'es','Albany, WA (Coastal Cities / Towns (Australia))'),
 (103,'fr','Albany, WA (Coastal Cities / Towns (Australia))'),
 (104,'cn','Brisbane, QLD (Coastal Cities / Towns (Australia))'),
 (104,'en','Brisbane, QLD (Coastal Cities / Towns (Australia))'),
 (104,'es','Brisbane, QLD (Coastal Cities / Towns (Australia))'),
 (104,'fr','Brisbane, QLD (Coastal Cities / Towns (Australia))'),
 (105,'cn','Broome, WA (Coastal Cities / Towns (Australia))'),
 (105,'en','Broome, WA (Coastal Cities / Towns (Australia))'),
 (105,'es','Broome, WA (Coastal Cities / Towns (Australia))'),
 (105,'fr','Broome, WA (Coastal Cities / Towns (Australia))'),
 (106,'cn','Bunbury, WA (Coastal Cities / Towns (Australia))'),
 (106,'en','Bunbury, WA (Coastal Cities / Towns (Australia))'),
 (106,'es','Bunbury, WA (Coastal Cities / Towns (Australia))'),
 (106,'fr','Bunbury, WA (Coastal Cities / Towns (Australia))'),
 (107,'cn','Bundaberg, QLD (Coastal Cities / Towns (Australia))'),
 (107,'en','Bundaberg, QLD (Coastal Cities / Towns (Australia))'),
 (107,'es','Bundaberg, QLD (Coastal Cities / Towns (Australia))'),
 (107,'fr','Bundaberg, QLD (Coastal Cities / Towns (Australia))'),
 (108,'cn','Burnie, TAS (Coastal Cities / Towns (Australia))'),
 (108,'en','Burnie, TAS (Coastal Cities / Towns (Australia))'),
 (108,'es','Burnie, TAS (Coastal Cities / Towns (Australia))'),
 (108,'fr','Burnie, TAS (Coastal Cities / Towns (Australia))'),
 (109,'cn','Cairns, QLD (Coastal Cities / Towns (Australia))'),
 (109,'en','Cairns, QLD (Coastal Cities / Towns (Australia))'),
 (109,'es','Cairns, QLD (Coastal Cities / Towns (Australia))'),
 (109,'fr','Cairns, QLD (Coastal Cities / Towns (Australia))'),
 (110,'cn','Darwin, NT (Coastal Cities / Towns (Australia))'),
 (110,'en','Darwin, NT (Coastal Cities / Towns (Australia))'),
 (110,'es','Darwin, NT (Coastal Cities / Towns (Australia))'),
 (110,'fr','Darwin, NT (Coastal Cities / Towns (Australia))'),
 (111,'cn','Dampier, WA (Coastal Cities / Towns (Australia))'),
 (111,'en','Dampier, WA (Coastal Cities / Towns (Australia))'),
 (111,'es','Dampier, WA (Coastal Cities / Towns (Australia))'),
 (111,'fr','Dampier, WA (Coastal Cities / Towns (Australia))'),
 (112,'cn','Devonport, TAS (Coastal Cities / Towns (Australia))'),
 (112,'en','Devonport, TAS (Coastal Cities / Towns (Australia))'),
 (112,'es','Devonport, TAS (Coastal Cities / Towns (Australia))'),
 (112,'fr','Devonport, TAS (Coastal Cities / Towns (Australia))'),
 (113,'cn','Esperance, WA (Coastal Cities / Towns (Australia))'),
 (113,'en','Esperance, WA (Coastal Cities / Towns (Australia))'),
 (113,'es','Esperance, WA (Coastal Cities / Towns (Australia))'),
 (113,'fr','Esperance, WA (Coastal Cities / Towns (Australia))'),
 (114,'cn','Fremantle, WA (Coastal Cities / Towns (Australia))'),
 (114,'en','Fremantle, WA (Coastal Cities / Towns (Australia))'),
 (114,'es','Fremantle, WA (Coastal Cities / Towns (Australia))'),
 (114,'fr','Fremantle, WA (Coastal Cities / Towns (Australia))'),
 (115,'cn','Geraldton, WA (Coastal Cities / Towns (Australia))'),
 (115,'en','Geraldton, WA (Coastal Cities / Towns (Australia))'),
 (115,'es','Geraldton, WA (Coastal Cities / Towns (Australia))'),
 (115,'fr','Geraldton, WA (Coastal Cities / Towns (Australia))'),
 (116,'cn','Gladstone, QLD (Coastal Cities / Towns (Australia))'),
 (116,'en','Gladstone, QLD (Coastal Cities / Towns (Australia))'),
 (116,'es','Gladstone, QLD (Coastal Cities / Towns (Australia))'),
 (116,'fr','Gladstone, QLD (Coastal Cities / Towns (Australia))'),
 (117,'cn','Hobart, TAS (Coastal Cities / Towns (Australia))'),
 (117,'en','Hobart, TAS (Coastal Cities / Towns (Australia))'),
 (117,'es','Hobart, TAS (Coastal Cities / Towns (Australia))'),
 (117,'fr','Hobart, TAS (Coastal Cities / Towns (Australia))'),
 (118,'cn','Launceston, TAS (Coastal Cities / Towns (Australia))'),
 (118,'en','Launceston, TAS (Coastal Cities / Towns (Australia))'),
 (118,'es','Launceston, TAS (Coastal Cities / Towns (Australia))'),
 (118,'fr','Launceston, TAS (Coastal Cities / Towns (Australia))'),
 (119,'cn','Mackay, QLD (Coastal Cities / Towns (Australia))'),
 (119,'en','Mackay, QLD (Coastal Cities / Towns (Australia))'),
 (119,'es','Mackay, QLD (Coastal Cities / Towns (Australia))'),
 (119,'fr','Mackay, QLD (Coastal Cities / Towns (Australia))'),
 (120,'cn','Melbourne, VIC (Coastal Cities / Towns (Australia))'),
 (120,'en','Melbourne, VIC (Coastal Cities / Towns (Australia))'),
 (120,'es','Melbourne, VIC (Coastal Cities / Towns (Australia))'),
 (120,'fr','Melbourne, VIC (Coastal Cities / Towns (Australia))'),
 (121,'cn','Newcastle, NSW (Coastal Cities / Towns (Australia))'),
 (121,'en','Newcastle, NSW (Coastal Cities / Towns (Australia))'),
 (121,'es','Newcastle, NSW (Coastal Cities / Towns (Australia))'),
 (121,'fr','Newcastle, NSW (Coastal Cities / Towns (Australia))'),
 (122,'cn','Perth, WA (Coastal Cities / Towns (Australia))'),
 (122,'en','Perth, WA (Coastal Cities / Towns (Australia))'),
 (122,'es','Perth, WA (Coastal Cities / Towns (Australia))'),
 (122,'fr','Perth, WA (Coastal Cities / Towns (Australia))'),
 (123,'cn','Port Hedland, WA (Coastal Cities / Towns (Australia))'),
 (123,'en','Port Hedland, WA (Coastal Cities / Towns (Australia))'),
 (123,'es','Port Hedland, WA (Coastal Cities / Towns (Australia))'),
 (123,'fr','Port Hedland, WA (Coastal Cities / Towns (Australia))'),
 (124,'cn','Portland, VIC (Coastal Cities / Towns (Australia))'),
 (124,'en','Portland, VIC (Coastal Cities / Towns (Australia))'),
 (124,'es','Portland, VIC (Coastal Cities / Towns (Australia))'),
 (124,'fr','Portland, VIC (Coastal Cities / Towns (Australia))'),
 (125,'cn','Rockhampton, QLD (Coastal Cities / Towns (Australia))'),
 (125,'en','Rockhampton, QLD (Coastal Cities / Towns (Australia))'),
 (125,'es','Rockhampton, QLD (Coastal Cities / Towns (Australia))'),
 (125,'fr','Rockhampton, QLD (Coastal Cities / Towns (Australia))'),
 (126,'cn','Sydney, NSW (Coastal Cities / Towns (Australia))'),
 (126,'en','Sydney, NSW (Coastal Cities / Towns (Australia))'),
 (126,'es','Sydney, NSW (Coastal Cities / Towns (Australia))'),
 (126,'fr','Sydney, NSW (Coastal Cities / Towns (Australia))'),
 (127,'cn','Townsville, QLD (Coastal Cities / Towns (Australia))'),
 (127,'en','Townsville, QLD (Coastal Cities / Towns (Australia))'),
 (127,'es','Townsville, QLD (Coastal Cities / Towns (Australia))'),
 (127,'fr','Townsville, QLD (Coastal Cities / Towns (Australia))'),
 (128,'cn','Wollongong, NSW (Coastal Cities / Towns (Australia))'),
 (128,'en','Wollongong, NSW (Coastal Cities / Towns (Australia))'),
 (128,'es','Wollongong, NSW (Coastal Cities / Towns (Australia))'),
 (128,'fr','Wollongong, NSW (Coastal Cities / Towns (Australia))'),
 (129,'cn','Amery Ice Shelf, AAT (Named Locations (Antarctica))'),
 (129,'en','Amery Ice Shelf, AAT (Named Locations (Antarctica))'),
 (129,'es','Amery Ice Shelf, AAT (Named Locations (Antarctica))'),
 (129,'fr','Amery Ice Shelf, AAT (Named Locations (Antarctica))'),
 (130,'cn','Casey Station, AAT (Named Locations (Antarctica))'),
 (130,'en','Casey Station, AAT (Named Locations (Antarctica))'),
 (130,'es','Casey Station, AAT (Named Locations (Antarctica))'),
 (130,'fr','Casey Station, AAT (Named Locations (Antarctica))'),
 (131,'cn','Cook Ice Shelf, AAT (Named Locations (Antarctica))'),
 (131,'en','Cook Ice Shelf, AAT (Named Locations (Antarctica))'),
 (131,'es','Cook Ice Shelf, AAT (Named Locations (Antarctica))'),
 (131,'fr','Cook Ice Shelf, AAT (Named Locations (Antarctica))'),
 (132,'cn','Davis Sea, AAT (Named Locations (Antarctica))'),
 (132,'en','Davis Sea, AAT (Named Locations (Antarctica))'),
 (132,'es','Davis Sea, AAT (Named Locations (Antarctica))'),
 (132,'fr','Davis Sea, AAT (Named Locations (Antarctica))'),
 (133,'cn','Davis Station, AAT (Named Locations (Antarctica))'),
 (133,'en','Davis Station, AAT (Named Locations (Antarctica))'),
 (133,'es','Davis Station, AAT (Named Locations (Antarctica))'),
 (133,'fr','Davis Station, AAT (Named Locations (Antarctica))'),
 (134,'cn','Dumont D\'Urville Sea (France) (Named Locations (Antarctica))'),
 (134,'en','Dumont D\'Urville Sea (France) (Named Locations (Antarctica))'),
 (134,'es','Dumont D\'Urville Sea (France) (Named Locations (Antarctica))'),
 (134,'fr','Dumont D\'Urville Sea (France) (Named Locations (Antarctica))'),
 (135,'cn','Mawson Station, AAT (Named Locations (Antarctica))'),
 (135,'en','Mawson Station, AAT (Named Locations (Antarctica))'),
 (135,'es','Mawson Station, AAT (Named Locations (Antarctica))'),
 (135,'fr','Mawson Station, AAT (Named Locations (Antarctica))'),
 (136,'cn','Prydz Bay, AAT (Named Locations (Antarctica))'),
 (136,'en','Prydz Bay, AAT (Named Locations (Antarctica))'),
 (136,'es','Prydz Bay, AAT (Named Locations (Antarctica))'),
 (136,'fr','Prydz Bay, AAT (Named Locations (Antarctica))'),
 (137,'cn','Publications Ice Shelf, AAT (Named Locations (Antarctica))'),
 (137,'en','Publications Ice Shelf, AAT (Named Locations (Antarctica))'),
 (137,'es','Publications Ice Shelf, AAT (Named Locations (Antarctica))'),
 (137,'fr','Publications Ice Shelf, AAT (Named Locations (Antarctica))'),
 (138,'cn','Shackleton Ice Shelf, AAT (Named Locations (Antarctica))'),
 (138,'en','Shackleton Ice Shelf, AAT (Named Locations (Antarctica))'),
 (138,'es','Shackleton Ice Shelf, AAT (Named Locations (Antarctica))'),
 (138,'fr','Shackleton Ice Shelf, AAT (Named Locations (Antarctica))'),
 (139,'cn','Vincennes Bay, AAT (Named Locations (Antarctica))'),
 (139,'en','Vincennes Bay, AAT (Named Locations (Antarctica))'),
 (139,'es','Vincennes Bay, AAT (Named Locations (Antarctica))'),
 (139,'fr','Vincennes Bay, AAT (Named Locations (Antarctica))'),
 (140,'cn','Voyekov Ice Shelf, AAT (Named Locations (Antarctica))'),
 (140,'en','Voyekov Ice Shelf, AAT (Named Locations (Antarctica))'),
 (140,'es','Voyekov Ice Shelf, AAT (Named Locations (Antarctica))'),
 (140,'fr','Voyekov Ice Shelf, AAT (Named Locations (Antarctica))'),
 (141,'cn','West Ice Shelf, AAT (Named Locations (Antarctica))'),
 (141,'en','West Ice Shelf, AAT (Named Locations (Antarctica))'),
 (141,'es','West Ice Shelf, AAT (Named Locations (Antarctica))'),
 (141,'fr','West Ice Shelf, AAT (Named Locations (Antarctica))'),
 (142,'cn','Southern Ocean/ Australia extension (Global / Oceans (Antarctica))'),
 (142,'en','Southern Ocean/ Australia extension (Global / Oceans (Antarctica))'),
 (142,'es','Southern Ocean/ Australia extension (Global / Oceans (Antarctica))'),
 (142,'fr','Southern Ocean/ Australia extension (Global / Oceans (Antarctica))');
/*!40000 ALTER TABLE `regionsdes` ENABLE KEYS */;


--
-- Definition of table `relations`
--

DROP TABLE IF EXISTS `relations`;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL default '0',
  `relatedId` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`,`relatedId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `relations`
--

/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;


--
-- Definition of table `report`
--

DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `REPORT_ID` int(11) NOT NULL auto_increment,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `REPORT_FILE` varchar(255) NOT NULL,
  `PDF_EXPORT` bit(1) NOT NULL,
  `CSV_EXPORT` bit(1) NOT NULL,
  `XLS_EXPORT` bit(1) NOT NULL,
  `HTML_EXPORT` bit(1) NOT NULL,
  `RTF_EXPORT` bit(1) NOT NULL default '\0',
  `TEXT_EXPORT` bit(1) NOT NULL,
  `EXCEL_EXPORT` bit(1) NOT NULL,
  `IMAGE_EXPORT` bit(1) NOT NULL,
  `FILL_VIRTUAL` bit(1) NOT NULL,
  `HIDDEN_REPORT` bit(1) NOT NULL,
  `REPORT_QUERY` text,
  `DATASOURCE_ID` int(11) default NULL,
  `CHART_ID` int(11) default NULL,
  `EXPORT_OPTION_ID` int(11) default NULL,
  PRIMARY KEY  (`REPORT_ID`),
  UNIQUE KEY `NAME` (`NAME`),
  UNIQUE KEY `NAME_2` (`NAME`),
  KEY `FK8FDF4934F4DD5A50` (`EXPORT_OPTION_ID`),
  KEY `FK8FDF49344330D5A7` (`DATASOURCE_ID`),
  KEY `FK8FDF4934164AA2ED` (`CHART_ID`),
  KEY `FKC84C55342B065EE5` (`DATASOURCE_ID`),
  KEY `FKC84C553427C17779` (`EXPORT_OPTION_ID`),
  KEY `FKC84C5534E3D7CACF` (`CHART_ID`),
  CONSTRAINT `FK8FDF4934164AA2ED` FOREIGN KEY (`CHART_ID`) REFERENCES `report_chart` (`CHART_ID`),
  CONSTRAINT `FK8FDF49344330D5A7` FOREIGN KEY (`DATASOURCE_ID`) REFERENCES `report_datasource` (`DATASOURCE_ID`),
  CONSTRAINT `FK8FDF4934F4DD5A50` FOREIGN KEY (`EXPORT_OPTION_ID`) REFERENCES `report_export_options` (`EXPORT_OPTION_ID`),
  CONSTRAINT `FKC84C553427C17779` FOREIGN KEY (`EXPORT_OPTION_ID`) REFERENCES `report_export_options` (`EXPORT_OPTION_ID`),
  CONSTRAINT `FKC84C55342B065EE5` FOREIGN KEY (`DATASOURCE_ID`) REFERENCES `report_datasource` (`DATASOURCE_ID`),
  CONSTRAINT `FKC84C5534E3D7CACF` FOREIGN KEY (`CHART_ID`) REFERENCES `report_chart` (`CHART_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report`
--

/*!40000 ALTER TABLE `report` DISABLE KEYS */;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;


--
-- Definition of table `report_alert`
--

DROP TABLE IF EXISTS `report_alert`;
CREATE TABLE `report_alert` (
  `ALERT_ID` int(11) NOT NULL auto_increment,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `ALERT_QUERY` text NOT NULL,
  `DATASOURCE_ID` int(11) default NULL,
  PRIMARY KEY  (`ALERT_ID`),
  UNIQUE KEY `NAME` (`NAME`),
  UNIQUE KEY `NAME_2` (`NAME`),
  KEY `FKF81C86714330D5A7` (`DATASOURCE_ID`),
  CONSTRAINT `FKF81C86714330D5A7` FOREIGN KEY (`DATASOURCE_ID`) REFERENCES `report_datasource` (`DATASOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report_alert`
--

/*!40000 ALTER TABLE `report_alert` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_alert` ENABLE KEYS */;


--
-- Definition of table `report_chart`
--

DROP TABLE IF EXISTS `report_chart`;
CREATE TABLE `report_chart` (
  `CHART_ID` int(11) NOT NULL auto_increment,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `CHART_QUERY` text NOT NULL,
  `CHART_TYPE` int(11) NOT NULL,
  `WIDTH` int(11) NOT NULL,
  `HEIGHT` int(11) NOT NULL,
  `X_AXIS_LABEL` varchar(255) default NULL,
  `Y_AXIS_LABEL` varchar(255) default NULL,
  `SHOW_LEGEND` bit(1) NOT NULL,
  `SHOW_TITLE` bit(1) NOT NULL,
  `SHOW_VALUES` bit(1) NOT NULL,
  `PLOT_ORIENTATION` int(11) default NULL,
  `DATASOURCE_ID` int(11) default NULL,
  `REPORT_ID` int(11) default NULL,
  `OVERLAY_CHART_ID` int(11) default NULL,
  PRIMARY KEY  (`CHART_ID`),
  UNIQUE KEY `NAME` (`NAME`),
  UNIQUE KEY `NAME_2` (`NAME`),
  KEY `FKF836D4F3AAEF4A13` (`REPORT_ID`),
  KEY `FKF836D4F34330D5A7` (`DATASOURCE_ID`),
  KEY `FKF836D4F3C83B69FC` (`OVERLAY_CHART_ID`),
  KEY `FK377CD9132B065EE5` (`DATASOURCE_ID`),
  KEY `FK377CD913211D3CF1` (`REPORT_ID`),
  KEY `FK377CD91395C891DE` (`OVERLAY_CHART_ID`),
  CONSTRAINT `FK377CD913211D3CF1` FOREIGN KEY (`REPORT_ID`) REFERENCES `report` (`REPORT_ID`),
  CONSTRAINT `FK377CD9132B065EE5` FOREIGN KEY (`DATASOURCE_ID`) REFERENCES `report_datasource` (`DATASOURCE_ID`),
  CONSTRAINT `FK377CD91395C891DE` FOREIGN KEY (`OVERLAY_CHART_ID`) REFERENCES `report_chart` (`CHART_ID`),
  CONSTRAINT `FKF836D4F34330D5A7` FOREIGN KEY (`DATASOURCE_ID`) REFERENCES `report_datasource` (`DATASOURCE_ID`),
  CONSTRAINT `FKF836D4F3AAEF4A13` FOREIGN KEY (`REPORT_ID`) REFERENCES `report` (`REPORT_ID`),
  CONSTRAINT `FKF836D4F3C83B69FC` FOREIGN KEY (`OVERLAY_CHART_ID`) REFERENCES `report_chart` (`CHART_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report_chart`
--

/*!40000 ALTER TABLE `report_chart` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_chart` ENABLE KEYS */;


--
-- Definition of table `report_datasource`
--

DROP TABLE IF EXISTS `report_datasource`;
CREATE TABLE `report_datasource` (
  `DATASOURCE_ID` int(11) NOT NULL auto_increment,
  `NAME` varchar(255) NOT NULL,
  `DRIVER` varchar(255) default NULL,
  `URL` varchar(255) NOT NULL,
  `USERNAME` varchar(255) default NULL,
  `PASSWORD` varchar(255) default NULL,
  `MAX_IDLE` int(11) default NULL,
  `MAX_ACTIVE` int(11) default NULL,
  `MAX_WAIT` bigint(20) default NULL,
  `VALIDATION_QUERY` varchar(255) default NULL,
  `JNDI` bit(1) default NULL,
  PRIMARY KEY  (`DATASOURCE_ID`),
  UNIQUE KEY `NAME` (`NAME`),
  UNIQUE KEY `NAME_2` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report_datasource`
--

/*!40000 ALTER TABLE `report_datasource` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_datasource` ENABLE KEYS */;


--
-- Definition of table `report_delivery_log`
--

DROP TABLE IF EXISTS `report_delivery_log`;
CREATE TABLE `report_delivery_log` (
  `DELIVERY_LOG_ID` int(11) NOT NULL auto_increment,
  `START_TIME` datetime default NULL,
  `END_TIME` datetime default NULL,
  `STATUS` varchar(255) default NULL,
  `MESSAGE` text,
  `DELIVERY_METHOD` varchar(255) default NULL,
  `LOG_ID` int(11) default NULL,
  `DELIVERY_INDEX` int(11) default NULL,
  PRIMARY KEY  (`DELIVERY_LOG_ID`),
  KEY `FKC783FD84632801ED` (`LOG_ID`),
  CONSTRAINT `FKC783FD84632801ED` FOREIGN KEY (`LOG_ID`) REFERENCES `report_log` (`LOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report_delivery_log`
--

/*!40000 ALTER TABLE `report_delivery_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_delivery_log` ENABLE KEYS */;


--
-- Definition of table `report_export_options`
--

DROP TABLE IF EXISTS `report_export_options`;
CREATE TABLE `report_export_options` (
  `EXPORT_OPTION_ID` int(11) NOT NULL auto_increment,
  `XLS_REMOVE_EMPTY_SPACE` bit(1) NOT NULL,
  `XLS_ONE_PAGE_PER_SHEET` bit(1) NOT NULL,
  `XLS_AUTO_DETECT_CELL` bit(1) NOT NULL,
  `XLS_WHITE_BACKGROUND` bit(1) NOT NULL,
  `HTML_REMOVE_EMPTY_SPACE` bit(1) NOT NULL,
  `HTML_WHITE_BACKGROUND` bit(1) NOT NULL,
  `HTML_USE_IMAGES` bit(1) NOT NULL,
  `HTML_WRAP_BREAK` bit(1) NOT NULL,
  PRIMARY KEY  (`EXPORT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report_export_options`
--

/*!40000 ALTER TABLE `report_export_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_export_options` ENABLE KEYS */;


--
-- Definition of table `report_group`
--

DROP TABLE IF EXISTS `report_group`;
CREATE TABLE `report_group` (
  `GROUP_ID` int(11) NOT NULL auto_increment,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  PRIMARY KEY  (`GROUP_ID`),
  UNIQUE KEY `NAME` (`NAME`),
  UNIQUE KEY `NAME_2` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report_group`
--

/*!40000 ALTER TABLE `report_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_group` ENABLE KEYS */;


--
-- Definition of table `report_group_map`
--

DROP TABLE IF EXISTS `report_group_map`;
CREATE TABLE `report_group_map` (
  `GROUP_ID` int(11) NOT NULL,
  `REPORT_ID` int(11) NOT NULL,
  `MAP_ID` int(11) NOT NULL,
  PRIMARY KEY  (`GROUP_ID`,`MAP_ID`),
  KEY `FKEF946211AAEF4A13` (`REPORT_ID`),
  KEY `FKEF946211DF17134D` (`GROUP_ID`),
  CONSTRAINT `FKEF946211AAEF4A13` FOREIGN KEY (`REPORT_ID`) REFERENCES `report` (`REPORT_ID`),
  CONSTRAINT `FKEF946211DF17134D` FOREIGN KEY (`GROUP_ID`) REFERENCES `report_group` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report_group_map`
--

/*!40000 ALTER TABLE `report_group_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_group_map` ENABLE KEYS */;


--
-- Definition of table `report_log`
--

DROP TABLE IF EXISTS `report_log`;
CREATE TABLE `report_log` (
  `LOG_ID` int(11) NOT NULL auto_increment,
  `START_TIME` datetime default NULL,
  `END_TIME` datetime default NULL,
  `STATUS` varchar(255) default NULL,
  `MESSAGE` text,
  `EXPORT_TYPE` int(11) default NULL,
  `REQUEST_ID` varchar(255) default NULL,
  `REPORT_ID` int(11) default NULL,
  `USER_ID` int(11) default NULL,
  `ALERT_ID` int(11) default NULL,
  PRIMARY KEY  (`LOG_ID`),
  KEY `FK901BE599E4B42987` (`USER_ID`),
  KEY `FK901BE599AAEF4A13` (`REPORT_ID`),
  KEY `FK901BE59920DA4A2D` (`ALERT_ID`),
  CONSTRAINT `FK901BE59920DA4A2D` FOREIGN KEY (`ALERT_ID`) REFERENCES `report_alert` (`ALERT_ID`),
  CONSTRAINT `FK901BE599AAEF4A13` FOREIGN KEY (`REPORT_ID`) REFERENCES `report` (`REPORT_ID`),
  CONSTRAINT `FK901BE599E4B42987` FOREIGN KEY (`USER_ID`) REFERENCES `report_user` (`REPORTUSER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report_log`
--

/*!40000 ALTER TABLE `report_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_log` ENABLE KEYS */;


--
-- Definition of table `report_parameter`
--

DROP TABLE IF EXISTS `report_parameter`;
CREATE TABLE `report_parameter` (
  `PARAMETER_ID` int(11) NOT NULL auto_increment,
  `NAME` varchar(255) NOT NULL,
  `TYPE` varchar(255) NOT NULL,
  `CLASSNAME` varchar(255) NOT NULL,
  `DATA` text,
  `DATASOURCE_ID` int(11) default NULL,
  `DESCRIPTION` varchar(255) default NULL,
  `REQUIRED` bit(1) default NULL,
  `MULTI_SELECT` bit(1) default NULL,
  `DEFAULT_VALUE` varchar(255) default NULL,
  PRIMARY KEY  (`PARAMETER_ID`),
  UNIQUE KEY `NAME` (`NAME`),
  UNIQUE KEY `NAME_2` (`NAME`),
  KEY `FKBC64163E4330D5A7` (`DATASOURCE_ID`),
  CONSTRAINT `FKBC64163E4330D5A7` FOREIGN KEY (`DATASOURCE_ID`) REFERENCES `report_datasource` (`DATASOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report_parameter`
--

/*!40000 ALTER TABLE `report_parameter` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_parameter` ENABLE KEYS */;


--
-- Definition of table `report_parameter_map`
--

DROP TABLE IF EXISTS `report_parameter_map`;
CREATE TABLE `report_parameter_map` (
  `REPORT_ID` int(11) NOT NULL,
  `PARAMETER_ID` int(11) default NULL,
  `REQUIRED` bit(1) default NULL,
  `SORT_ORDER` int(11) default NULL,
  `STEP` int(11) default NULL,
  `MAP_ID` int(11) NOT NULL,
  PRIMARY KEY  (`REPORT_ID`,`MAP_ID`),
  KEY `FK23FF1FBB1AFAD98D` (`PARAMETER_ID`),
  KEY `FK23FF1FBBAAEF4A13` (`REPORT_ID`),
  CONSTRAINT `FK23FF1FBB1AFAD98D` FOREIGN KEY (`PARAMETER_ID`) REFERENCES `report_parameter` (`PARAMETER_ID`),
  CONSTRAINT `FK23FF1FBBAAEF4A13` FOREIGN KEY (`REPORT_ID`) REFERENCES `report` (`REPORT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report_parameter_map`
--

/*!40000 ALTER TABLE `report_parameter_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_parameter_map` ENABLE KEYS */;


--
-- Definition of table `report_user`
--

DROP TABLE IF EXISTS `report_user`;
CREATE TABLE `report_user` (
  `REPORTUSER_ID` int(11) NOT NULL auto_increment,
  `NAME` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `EXTERNAL_ID` varchar(255) default NULL,
  `EMAIL_ADDRESS` varchar(255) default NULL,
  `PDF_EXPORT_TYPE` int(11) NOT NULL,
  `DEFAULT_REPORT_ID` int(11) default NULL,
  `STATE` varchar(255) default NULL,
  `institution` varchar(255) default NULL,
  `acronim` varchar(255) default NULL,
  `lider` varchar(255) default NULL,
  `cargo_lider` varchar(255) default NULL,
  `country` int(11) default NULL,
  `depto` int(11) default NULL,
  `city` int(11) default NULL,
  `address` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `fax` varchar(255) default NULL,
  `web` varchar(255) default NULL,
  `privatePolitics` bit(1) default NULL,
  `exchangePolitics` bit(1) default NULL,
  `sha1` varchar(255) default NULL,
  `region` varchar(3) default NULL,
  PRIMARY KEY  (`REPORTUSER_ID`),
  UNIQUE KEY `NAME` (`NAME`),
  UNIQUE KEY `NAME_2` (`NAME`),
  KEY `FK7364F3F6EE01FD95` (`DEFAULT_REPORT_ID`),
  KEY `FKF14E6FF6642FF073` (`DEFAULT_REPORT_ID`),
  CONSTRAINT `FK7364F3F6EE01FD95` FOREIGN KEY (`DEFAULT_REPORT_ID`) REFERENCES `report` (`REPORT_ID`),
  CONSTRAINT `FKF14E6FF6642FF073` FOREIGN KEY (`DEFAULT_REPORT_ID`) REFERENCES `report` (`REPORT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report_user`
--

/*!40000 ALTER TABLE `report_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_user` ENABLE KEYS */;


--
-- Definition of table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL default '0',
  `parentId` int(11) default NULL,
  `name` varchar(32) NOT NULL,
  `value` varchar(250) default NULL,
  PRIMARY KEY  (`id`),
  KEY `parentId` (`parentId`),
  CONSTRAINT `settings_ibfk_1` FOREIGN KEY (`parentId`) REFERENCES `settings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;


--
-- Definition of table `solicitud_parametros`
--

DROP TABLE IF EXISTS `solicitud_parametros`;
CREATE TABLE `solicitud_parametros` (
  `id_solicitud` int(10) unsigned NOT NULL auto_increment,
  `fecha_solicitud` date NOT NULL,
  `nombre_institucion` varchar(255) NOT NULL,
  `solicitante` varchar(255) NOT NULL,
  `cargo_solicitante` varchar(45) NOT NULL,
  `correo_electronico` varchar(150) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `id_pais` char(2) default NULL,
  `id_departamento` int(10) unsigned default NULL,
  `id_municipio` char(5) default NULL,
  `observaciones` text,
  PRIMARY KEY  (`id_solicitud`),
  KEY `FKC2EBAD58CA2FEBD` (`id_municipio`),
  KEY `FKC2EBAD5F295C3C1` (`id_pais`),
  KEY `FKC2EBAD5ED4FA625` (`id_departamento`),
  CONSTRAINT `FKC2EBAD58CA2FEBD` FOREIGN KEY (`id_municipio`) REFERENCES `gen_municipio` (`DANE`),
  CONSTRAINT `FKC2EBAD5ED4FA625` FOREIGN KEY (`id_departamento`) REFERENCES `gendepartamento` (`Id_Departamento`),
  CONSTRAINT `FKC2EBAD5F295C3C1` FOREIGN KEY (`id_pais`) REFERENCES `paises_0101` (`pai_id`),
  CONSTRAINT `FK_solicitud_parametros_1` FOREIGN KEY (`id_municipio`) REFERENCES `gen_municipio` (`DANE`),
  CONSTRAINT `FK_solicitud_parametros_2` FOREIGN KEY (`id_departamento`) REFERENCES `gendepartamento` (`Id_Departamento`),
  CONSTRAINT `FK_solicitud_parametros_3` FOREIGN KEY (`id_pais`) REFERENCES `paises_0101` (`pai_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `solicitud_parametros`
--

/*!40000 ALTER TABLE `solicitud_parametros` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitud_parametros` ENABLE KEYS */;


--
-- Definition of table `sources`
--

DROP TABLE IF EXISTS `sources`;
CREATE TABLE `sources` (
  `uuid` varchar(250) NOT NULL default '',
  `name` varchar(250) default NULL,
  `isLocal` char(1) default 'y',
  PRIMARY KEY  (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sources`
--

/*!40000 ALTER TABLE `sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `sources` ENABLE KEYS */;


--
-- Definition of table `unlocode_port`
--

DROP TABLE IF EXISTS `unlocode_port`;
CREATE TABLE `unlocode_port` (
  `Country` char(2) NOT NULL,
  `Location` char(3) NOT NULL,
  `Name` varchar(255) default NULL,
  `NameWoDiacritics` varchar(255) default NULL,
  `Status` varchar(2) default NULL,
  `Subdivision` varchar(255) default NULL,
  `Date` varchar(255) default NULL,
  `Function` varchar(255) default NULL,
  `IATA` varchar(255) default NULL,
  `Latitude` double default NULL,
  `Longitude` double default NULL,
  `Remarks` varchar(255) default NULL,
  `Function1` varchar(255) default NULL,
  PRIMARY KEY  (`Country`,`Location`),
  KEY `FKC95BCD37A416EDA8` (`Status`),
  KEY `FKC95BCD37C92B13D8` (`Country`),
  CONSTRAINT `FKC95BCD37A416EDA8` FOREIGN KEY (`Status`) REFERENCES `unlocode_status_indicators` (`STStatus`),
  CONSTRAINT `FKC95BCD37C92B13D8` FOREIGN KEY (`Country`) REFERENCES `paises_0101` (`pai_id`),
  CONSTRAINT `FK_unlocode_port_2` FOREIGN KEY (`Country`) REFERENCES `paises_0101` (`pai_id`),
  CONSTRAINT `FK_unlocode_port_4` FOREIGN KEY (`Status`) REFERENCES `unlocode_status_indicators` (`STStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unlocode_port`
--

/*!40000 ALTER TABLE `unlocode_port` DISABLE KEYS */;
INSERT INTO `unlocode_port` (`Country`,`Location`,`Name`,`NameWoDiacritics`,`Status`,`Subdivision`,`Date`,`Function`,`IATA`,`Latitude`,`Longitude`,`Remarks`,`Function1`) VALUES 
 ('22','ACM','Arica','Arica','RL','','0601','1-3-----','',2.11666666666667,-71.7333333333333,'',NULL),
 ('22','ADZ','San Andres Island','San Andres Island','AI','','9601','---4----','',NULL,NULL,'',NULL),
 ('22','AGD','Agrado','Agrado','RQ','','0607','--3-----','',2.25,-75.9333333333333,'',NULL),
 ('22','AND','Andalucia','Andalucia','RQ','','0607','--3-----','',5.21666666666667,-74.1166666666666,'',NULL),
 ('22','APO','Apartado','Apartado','AI','','9601','---4----','',NULL,NULL,'',NULL),
 ('22','ASR','Astrea','Astrea','RQ','','0607','--3-----','',9.5,-73.9666666666667,'',NULL),
 ('22','AUC','Arauca','Arauca','AI','','9601','---4----','',NULL,NULL,'',NULL),
 ('22','AXM','Armenia','Armenia','AI','','9601','---4----','',NULL,NULL,'',NULL),
 ('22','AYA','Ayapel','Ayapel','RQ','','0607','--3-----','',8.31666666666666,-75.1333333333334,'',NULL),
 ('22','BAQ','Barranquilla','Barranquilla','AI','','9601','1--45---','',NULL,NULL,'',NULL),
 ('22','BET','Betania','Betania','RQ','','0607','--3-----','',5.75,-75.9833333333333,'',NULL),
 ('22','BGA','Bucaramanga','Bucaramanga','AI','','9601','---4----','',NULL,NULL,'',NULL),
 ('22','BOG','BogotÃ¡','Bogota','AI','','0307','-2345---','',4.6,-74.0833333333333,'',NULL),
 ('22','BUG','Buga','Buga','RQ','','0607','--3-----','',2.18333333333333,-77.8833333333334,'',NULL),
 ('22','BUN','Buenaventura','Buenaventura','AI','','9601','1--4----','',NULL,NULL,'',NULL),
 ('22','CAP','Cachipay','Cachipay','RQ','','0607','--3-----','',5,-72.5333333333333,'',NULL),
 ('22','CIE','Cienaga','Cienaga','RQ','','9601','0-------','',NULL,NULL,'',NULL),
 ('22','CLO','Cali','Cali','AI','','9601','---4----','',NULL,NULL,'',NULL),
 ('22','CRC','Cartago','Cartago','AI','','9601','1--4----','',NULL,NULL,'',NULL),
 ('22','CTG','Cartagena','Cartagena','AI','','9601','1--4----','',NULL,NULL,'',NULL),
 ('22','CUC','Cucuta','Cucuta','AI','','9601','---4----','',NULL,NULL,'',NULL),
 ('22','CVE','Covenas','Covenas','AI','','9401','---4----','',NULL,NULL,'',NULL),
 ('22','DAB','Dabeiba','Dabeiba','RQ','','0607','--3-----','',7,-76.2666666666667,'',NULL),
 ('22','DUR','Durania','Durania','RQ','','0607','--3-----','',10.0333333333333,-73.8833333333334,'',NULL),
 ('22','EBG','El Bagre','El Bagre','AI','','9601','---4----','',NULL,NULL,'',NULL),
 ('22','EBQ','El Bosque','El Bosque','RL','','0001','1-------','',NULL,NULL,'',NULL),
 ('22','EES','El Espino','El Espino','RQ','','0607','--3-----','',6.46666666666667,-72.5,'',NULL),
 ('22','EJA','Barrancabermeja','Barrancabermeja','AI','','9601','1--4----','',NULL,NULL,'',NULL),
 ('22','FLA','Florencia','Florencia','AI','','0101','--34----','',NULL,NULL,'',NULL),
 ('22','FUN','Fundacion','Fundacion','RQ','','0607','--3-----','',4.01666666666667,-74.45,'',NULL),
 ('22','GAM','Gamarra','Gamarra','RQ','','0607','--3-----','',8.33333333333334,-73.7333333333333,'',NULL),
 ('22','GAR','Garagoa','Garagoa','RQ','','0607','--3-----','',5.08333333333333,-73.3666666666666,'',NULL),
 ('22','GAZ','Garzon','Garzon','RQ','','0607','--3-----','',4.83333333333333,-72.3,'',NULL),
 ('22','GUA','Guaduas','Guaduas','RQ','','0607','--3-----','',5.76666666666667,-76.1666666666667,'',NULL),
 ('22','GUP','Guapi','Guapi','RQ','','0607','--3-----','',2.58333333333333,-77.9,'',NULL),
 ('22','IGO','ChigorodÃ³','Chigorodo','AI','','0212','---4----','',7.68333333333333,-76.6833333333333,'',NULL),
 ('22','LAD','La Dorada','La Dorada','RQ','','0607','--3-----','',8.35,-74.4833333333333,'',NULL),
 ('22','LEJ','Lejanias','Lejanias','RQ','','0607','--3-----','',3.51666666666667,-74.0166666666667,'',NULL),
 ('22','LET','Leticia','Leticia','AI','','9601','1--4----','',NULL,NULL,'',NULL),
 ('22','MAC','Macedonia','Macedonia','RQ','','0607','--3-----','',8.65,-73.9166666666667,'',NULL),
 ('22','MAM','Mamonal','Mamonal','RQ','','9506','0-------','',NULL,NULL,'',NULL),
 ('22','MAT','Matanza','Matanza','RQ','','0607','--3-----','',7.71666666666667,-74.75,'',NULL),
 ('22','MAU','Manaure','Manaure','RL','','0501','1-3-----','',11.7666666666667,-72.4333333333333,'',NULL),
 ('22','MDE','MedellÃ­n','Medellin','AI','','0212','---4----','',6.28333333333333,-75.5333333333333,'',NULL),
 ('22','MOL','Monte Libano','Monte Libano','RQ','','0607','--3-----','',9.25,-73.95,'',NULL),
 ('22','MTR','Monteria','Monteria','AI','','9601','---4----','',NULL,NULL,'',NULL),
 ('22','MZL','Manizales','Manizales','AI','','9601','---4----','',NULL,NULL,'',NULL),
 ('22','NOB','Nobsa','Nobsa','RQ','','0607','--3-----','',5.76666666666667,-72.95,'',NULL),
 ('22','NVA','Neiva','Neiva','RL','','0207','--34----','',2.91666666666667,-75.2666666666667,'',NULL),
 ('22','OIB','Oiba','Oiba','RQ','','0607','--3-----','',6.25,-73.3,'',NULL),
 ('22','PBE','Puerto Berrio','Puerto Berrio','AI','','9601','1--4----','',NULL,NULL,'',NULL),
 ('22','PBO','Puerto BolÃ­var','Puerto Bolivar','RL','','0212','1-------','',10.6833333333333,-74.7333333333333,'',NULL),
 ('22','PCR','Puerto CarreÃ±o','Puerto Carreno','RL','','0401','1-34----','',6.18333333333333,-67.4833333333333,'',NULL),
 ('22','PEI','Pereira','Pereira','AI','','9601','---4----','',NULL,NULL,'',NULL),
 ('22','PGA','Puerto Gaitan','Puerto Gaitan','RQ','','0607','--3-----','',6.25,-71.45,'',NULL),
 ('22','PLL','Puerto Lleras','Puerto Lleras','RQ','','0607','--3-----','',8.15,-72.4666666666667,'',NULL),
 ('22','PNM','Puerto LimÃ³n','Puerto Limon','RL','','0201','1-3-----','',1.05,-76.5,'',NULL),
 ('22','POC','Pozos Colorados','Pozos Colorados','RQ','','9506','1-------','',NULL,NULL,'',NULL),
 ('22','PPN','PopayÃ¡n','Popayan','RL','','0401','--34----','',2.43333333333333,-75.6166666666666,'',NULL),
 ('22','PPR','Puerto Prodeco','Puerto Prodeco','RQ','','9506','0-------','',NULL,NULL,'',NULL),
 ('22','PSB','Simon Bolivar','Simon Bolivar','RQ','','0607','1----6--','',4.13333333333333,-69.9666666666667,'',NULL),
 ('22','PSO','Pasto','Pasto','AI','','9601','---4----','',NULL,NULL,'',NULL),
 ('22','PUC','Puerto Colombia','Puerto Colombia','RL','','0701','1-3-----','',11,-74.95,'@Fun@Sta@Coo',NULL),
 ('22','PUG','Puerto Gaitan','Puerto Gaitan','RQ','','0607','--3-----','',4.31666666666667,-72.0666666666666,'',NULL),
 ('22','PUL','Puerto LimÃ³n','Puerto Limon','RL','','0201','1-3-----','',9.38333333333333,-76.1833333333333,'',NULL),
 ('22','PUU','Puerto AsÃ­s','Puerto Asis','RL','','0212','1-34----','',0.516666666666667,-76.5,'',NULL),
 ('22','RCH','Riohacha','Riohacha','AI','','9601','1--4----','',NULL,NULL,'',NULL),
 ('22','SAG','San Gil','San Gil','RQ','','0607','--3-----','',6.55,-73.1333333333334,'',NULL),
 ('22','SAM','Samaca','Samaca','RQ','','0607','--3-----','',5.48333333333333,-73.4833333333333,'',NULL),
 ('22','SAR','Santa Rosa','Santa Rosa','RQ','','0607','--3-----','',8.81666666666666,-76.4833333333333,'',NULL),
 ('22','SAV','Savanilla','Savanilla','RQ','','9506','0-------','',NULL,NULL,'',NULL),
 ('22','SIN','Since','Since','RQ','','0607','--3-----','',9.23333333333333,-75.1333333333334,'',NULL),
 ('22','SMR','Santa Marta','Santa Marta','AI','','9601','1--4----','',NULL,NULL,'',NULL),
 ('22','SRV','Saravena','Saravena','RQ','','0607','--3-----','',6.98333333333333,-71.9166666666667,'',NULL),
 ('22','STF','Santa Fee','Santa Fee','RQ','','0607','--3-----','',6.63333333333333,-70.7666666666667,'',NULL),
 ('22','TAM','Tame','Tame','RQ','','0607','--3-----','',6.45,-71.7333333333333,'',NULL),
 ('22','TCO','Tumaco','Tumaco','AI','','9601','1--4----','',NULL,NULL,'',NULL),
 ('22','TLU','TolÃº','Tolu','AI','','0212','1--4----','',9.53333333333333,-75.5833333333333,'',NULL),
 ('22','TRB','Turbo','Turbo','AI','','9601','1--4----','',NULL,NULL,'',NULL),
 ('22','TUE','Moniquira','Moniquira','RQ','','0607','--3-----','',5.88333333333333,-73.5833333333333,'',NULL),
 ('22','UIB','QuibdÃ³','Quibdo','AI','','0212','---4----','',5.7,-76.6666666666667,'',NULL),
 ('22','UMB','Umbita','Umbita','RQ','','0607','--3-----','',5.23333333333333,-73.45,'',NULL),
 ('22','VPZ','Villapinzon','Villapinzon','RQ','','0607','--3-----','',5.21666666666667,-73.5833333333333,'',NULL),
 ('22','VUP','Valledupar','Valledupar','RL','','0001','--34----','',NULL,NULL,'',NULL),
 ('22','YMB','Yumbo','Yumbo','RL','','0601','1-3-----','',3.58333333333333,-76.4666666666667,'',NULL);
/*!40000 ALTER TABLE `unlocode_port` ENABLE KEYS */;


--
-- Definition of table `unlocode_status_indicators`
--

DROP TABLE IF EXISTS `unlocode_status_indicators`;
CREATE TABLE `unlocode_status_indicators` (
  `STStatus` varchar(2) NOT NULL,
  `STDescription` varchar(255) default NULL,
  PRIMARY KEY  (`STStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unlocode_status_indicators`
--

/*!40000 ALTER TABLE `unlocode_status_indicators` DISABLE KEYS */;
INSERT INTO `unlocode_status_indicators` (`STStatus`,`STDescription`) VALUES 
 ('AA','Approved by competent national government agency'),
 ('AC','Approved by Customs Authority'),
 ('AF','Approved by national facilitation body'),
 ('AI','Code adopted by international  organisation (IATA, ECLAC, EUROSTAT, etc.)'),
 ('AM','Approved by the UN/LOCODE Maintenance Agency'),
 ('AQ','Entry approved, functions not verified'),
 ('AS','Approved by national standardisation body'),
 ('QQ','Original entry not verified since date indicated'),
 ('RL','Recognised location - Existence and representation of location name confirmed by check against nominated gazetteer or other reference work'),
 ('RN','Request from credible national sources for locations in their own country'),
 ('RQ','Request under consideration'),
 ('RR','Request rejected'),
 ('UR','Entry included on user\'s request; not officially approved'),
 ('XX','Entry that will be removed from the next issue of UN/LOCODE');
/*!40000 ALTER TABLE `unlocode_status_indicators` ENABLE KEYS */;


--
-- Definition of table `user_alert_map`
--

DROP TABLE IF EXISTS `user_alert_map`;
CREATE TABLE `user_alert_map` (
  `USER_ID` int(11) NOT NULL,
  `ALERT_ID` int(11) default NULL,
  `REPORT_ID` int(11) default NULL,
  `ALERT_LIMIT` int(11) default NULL,
  `ALERT_OPERATOR` varchar(255) default NULL,
  `MAP_ID` int(11) NOT NULL,
  PRIMARY KEY  (`USER_ID`,`MAP_ID`),
  KEY `FKD83C845E4B42987` (`USER_ID`),
  KEY `FKD83C845AAEF4A13` (`REPORT_ID`),
  KEY `FKD83C84520DA4A2D` (`ALERT_ID`),
  CONSTRAINT `FKD83C84520DA4A2D` FOREIGN KEY (`ALERT_ID`) REFERENCES `report_alert` (`ALERT_ID`),
  CONSTRAINT `FKD83C845AAEF4A13` FOREIGN KEY (`REPORT_ID`) REFERENCES `report` (`REPORT_ID`),
  CONSTRAINT `FKD83C845E4B42987` FOREIGN KEY (`USER_ID`) REFERENCES `report_user` (`REPORTUSER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_alert_map`
--

/*!40000 ALTER TABLE `user_alert_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_alert_map` ENABLE KEYS */;


--
-- Definition of table `user_group_map`
--

DROP TABLE IF EXISTS `user_group_map`;
CREATE TABLE `user_group_map` (
  `USER_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `MAP_ID` int(11) NOT NULL,
  PRIMARY KEY  (`USER_ID`,`MAP_ID`),
  KEY `FKC49EBE8E4B42987` (`USER_ID`),
  KEY `FKC49EBE8DF17134D` (`GROUP_ID`),
  CONSTRAINT `FKC49EBE8DF17134D` FOREIGN KEY (`GROUP_ID`) REFERENCES `report_group` (`GROUP_ID`),
  CONSTRAINT `FKC49EBE8E4B42987` FOREIGN KEY (`USER_ID`) REFERENCES `report_user` (`REPORTUSER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_group_map`
--

/*!40000 ALTER TABLE `user_group_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group_map` ENABLE KEYS */;


--
-- Definition of table `user_security`
--

DROP TABLE IF EXISTS `user_security`;
CREATE TABLE `user_security` (
  `USER_ID` int(11) NOT NULL,
  `ROLE_NAME` varchar(255) default NULL,
  KEY `FK7DE1C934E4B42987` (`USER_ID`),
  CONSTRAINT `FK7DE1C934E4B42987` FOREIGN KEY (`USER_ID`) REFERENCES `report_user` (`REPORTUSER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_security`
--

/*!40000 ALTER TABLE `user_security` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_security` ENABLE KEYS */;


--
-- Definition of table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
CREATE TABLE `usergroups` (
  `userId` int(11) NOT NULL default '0',
  `groupId` int(11) NOT NULL default '0',
  PRIMARY KEY  (`userId`,`groupId`),
  KEY `groupId` (`groupId`),
  KEY `FK80E9815F359B8165` (`groupId`),
  KEY `FK80E9815F5C7E2597` (`userId`),
  CONSTRAINT `FK80E9815F359B8165` FOREIGN KEY (`groupId`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK80E9815F5C7E2597` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  CONSTRAINT `usergroups_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  CONSTRAINT `usergroups_ibfk_2` FOREIGN KEY (`groupId`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usergroups`
--

/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;


--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL default '0',
  `username` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `surname` varchar(32) default NULL,
  `name` varchar(32) default NULL,
  `profile` varchar(32) NOT NULL,
  `address` varchar(128) default NULL,
  `state` varchar(32) default NULL,
  `zip` varchar(16) default NULL,
  `country` varchar(128) default NULL,
  `email` varchar(128) default NULL,
  `organisation` varchar(128) default NULL,
  `kind` varchar(16) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`,`username`,`password`,`surname`,`name`,`profile`,`address`,`state`,`zip`,`country`,`email`,`organisation`,`kind`) VALUES 
 (1,'admin','d033e22ae348aeb566fc214aec3585c4da997','admin','admin','Administrator',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


--
-- Definition of table `usuario_datos`
--

DROP TABLE IF EXISTS `usuario_datos`;
CREATE TABLE `usuario_datos` (
  `id` int(11) NOT NULL auto_increment,
  `apellidos` varchar(255) default NULL,
  `ciudad` varchar(255) default NULL,
  `confirmacionContrasena` varchar(255) default NULL,
  `contrasena` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `estado` varchar(255) default NULL,
  `fecha` datetime default NULL,
  `identificacion` varchar(255) default NULL,
  `nombres` varchar(255) default NULL,
  `organizacion` varchar(255) default NULL,
  `pais` varchar(255) default NULL,
  `uso` varchar(255) default NULL,
  `id_metadata` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK4C7CC36AE47F6B6` (`id_metadata`),
  CONSTRAINT `FK4C7CC36AE47F6B6` FOREIGN KEY (`id_metadata`) REFERENCES `metadata` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuario_datos`
--

/*!40000 ALTER TABLE `usuario_datos` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_datos` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
