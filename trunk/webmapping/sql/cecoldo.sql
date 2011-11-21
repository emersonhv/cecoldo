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
-- Create schema cenimarc_
--

CREATE DATABASE IF NOT EXISTS cenimarc_;
USE cenimarc_;

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
/*!40000 ALTER TABLE `inv_chief_scientist` ENABLE KEYS */;


--
-- Definition of table `inv_chief_scientist_cruise`
--

DROP TABLE IF EXISTS `inv_chief_scientist_cruise`;
CREATE TABLE `inv_chief_scientist_cruise` (
  `id_chief_scientist` char(11) NOT NULL,
  `id_cruise` char(10) NOT NULL,
  PRIMARY KEY  (`id_chief_scientist`,`id_cruise`),
  KEY `FK926476A495C09F07` (`id_chief_scientist`),
  KEY `FK926476A4F0F27186` (`id_cruise`),
  CONSTRAINT `FK926476A495C09F07` FOREIGN KEY (`id_chief_scientist`) REFERENCES `inv_chief_scientist` (`Id`),
  CONSTRAINT `FK_inv_chief_scientist_cruise_1` FOREIGN KEY (`id_chief_scientist`) REFERENCES `inv_chief_scientist` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_chief_scientist_cruise`
--

/*!40000 ALTER TABLE `inv_chief_scientist_cruise` DISABLE KEYS */;
INSERT INTO `inv_chief_scientist_cruise` (`id_chief_scientist`,`id_cruise`) VALUES 
 ('1','1'),
 ('10','1'),
 ('11','1'),
 ('12','1'),
 ('13','1'),
 ('14','1'),
 ('15','1'),
 ('16','1'),
 ('17','1'),
 ('18','1'),
 ('19','1'),
 ('2','1'),
 ('20','1'),
 ('21','1'),
 ('3','1'),
 ('4','1'),
 ('5','1'),
 ('6','1'),
 ('7','1'),
 ('8','1'),
 ('9','1'),
 ('80','10'),
 ('81','11'),
 ('82','11'),
 ('83','11'),
 ('84','11'),
 ('85','11'),
 ('86','11'),
 ('87','11'),
 ('88','11'),
 ('89','11'),
 ('90','11'),
 ('83','12'),
 ('91','12'),
 ('92','13'),
 ('100','16'),
 ('101','16'),
 ('102','16'),
 ('103','16'),
 ('104','16'),
 ('105','16'),
 ('106','16'),
 ('70','16'),
 ('83','16'),
 ('93','16'),
 ('94','16'),
 ('95','16'),
 ('97','16'),
 ('98','16'),
 ('99','16'),
 ('107','19'),
 ('108','19'),
 ('109','19'),
 ('110','19'),
 ('111','19'),
 ('112','19'),
 ('113','19'),
 ('114','19'),
 ('115','19'),
 ('116','19'),
 ('117','19'),
 ('118','19'),
 ('119','19'),
 ('120','19'),
 ('121','19'),
 ('122','19'),
 ('83','19'),
 ('22','2'),
 ('23','2'),
 ('24','2'),
 ('25','2'),
 ('26','2'),
 ('27','2'),
 ('28','2'),
 ('29','2'),
 ('30','2'),
 ('31','2'),
 ('32','2'),
 ('33','2'),
 ('34','2'),
 ('107','20'),
 ('109','20'),
 ('123','20'),
 ('124','20'),
 ('125','20'),
 ('126','20'),
 ('127','20'),
 ('128','20'),
 ('129','20'),
 ('130','20'),
 ('131','20'),
 ('132','20'),
 ('133','20'),
 ('134','20'),
 ('135','20'),
 ('83','20'),
 ('101','21'),
 ('102','21'),
 ('111','21'),
 ('124','21'),
 ('136','21'),
 ('137','21'),
 ('138','21'),
 ('139','21'),
 ('140','21'),
 ('141','21'),
 ('142','21'),
 ('143','21'),
 ('144','21'),
 ('145','21'),
 ('146','21'),
 ('147','21'),
 ('148','21'),
 ('149','21'),
 ('150','21'),
 ('151','21'),
 ('152','21'),
 ('153','21'),
 ('154','21'),
 ('155','21'),
 ('156','21'),
 ('157','21'),
 ('158','21'),
 ('159','21'),
 ('160','21'),
 ('161','21'),
 ('83','21'),
 ('101','22'),
 ('102','22'),
 ('136','22'),
 ('137','22'),
 ('138','22'),
 ('162','22'),
 ('163','22'),
 ('164','22'),
 ('165','22'),
 ('166','22'),
 ('167','22'),
 ('168','22'),
 ('169','22'),
 ('170','22'),
 ('171','22'),
 ('172','22'),
 ('173','22'),
 ('174','22'),
 ('89','22'),
 ('94','22'),
 ('107','23'),
 ('136','23'),
 ('175','23'),
 ('176','23'),
 ('177','23'),
 ('178','23'),
 ('179','23'),
 ('180','23'),
 ('181','23'),
 ('183','23'),
 ('184','23'),
 ('185','23'),
 ('186','23'),
 ('187','23'),
 ('195','23'),
 ('177','24'),
 ('178','24'),
 ('183','24'),
 ('187','24'),
 ('188','24'),
 ('189','24'),
 ('190','24'),
 ('191','24'),
 ('192','24'),
 ('193','24'),
 ('194','24'),
 ('177','25'),
 ('178','25'),
 ('183','25'),
 ('187','25'),
 ('188','25'),
 ('189','25'),
 ('190','25'),
 ('193','25'),
 ('195','25'),
 ('196','25'),
 ('197','25'),
 ('177','26'),
 ('178','26'),
 ('187','26'),
 ('190','26'),
 ('195','26'),
 ('197','26'),
 ('198','26'),
 ('199','26'),
 ('200','26'),
 ('201','26'),
 ('183','27'),
 ('187','27'),
 ('189','27'),
 ('195','27'),
 ('202','27'),
 ('203','27'),
 ('204','27'),
 ('205','27'),
 ('177','28'),
 ('187','28'),
 ('206','28'),
 ('207','28'),
 ('208','28'),
 ('183','29'),
 ('187','29'),
 ('189','29'),
 ('200','29'),
 ('202','29'),
 ('203','29'),
 ('206','29'),
 ('209','29'),
 ('210','29'),
 ('211','29'),
 ('212','29'),
 ('22','3'),
 ('23','3'),
 ('24','3'),
 ('25','3'),
 ('35','3'),
 ('36','3'),
 ('37','3'),
 ('187','30'),
 ('189','30'),
 ('195','30'),
 ('200','30'),
 ('207','30'),
 ('213','30'),
 ('214','30'),
 ('215','30'),
 ('216','30'),
 ('217','30'),
 ('177','31'),
 ('195','31'),
 ('200','31'),
 ('218','31'),
 ('219','31'),
 ('220','31'),
 ('221','31'),
 ('177','32'),
 ('183','32'),
 ('189','32'),
 ('195','32'),
 ('220','32'),
 ('222','32'),
 ('223','32'),
 ('224','32'),
 ('177','33'),
 ('195','33'),
 ('197','33'),
 ('218','33'),
 ('223','33'),
 ('225','33'),
 ('226','33'),
 ('227','33'),
 ('189','34'),
 ('195','35'),
 ('200','35'),
 ('218','35'),
 ('223','35'),
 ('228','35'),
 ('229','35'),
 ('189','36'),
 ('195','36'),
 ('197','36'),
 ('200','36'),
 ('218','36'),
 ('222','36'),
 ('229','36'),
 ('230','36'),
 ('231','36'),
 ('232','36'),
 ('233','36'),
 ('234','36'),
 ('235','36'),
 ('236','36'),
 ('237','36'),
 ('238','36'),
 ('239','36'),
 ('240','36'),
 ('241','36'),
 ('242','36'),
 ('243','36'),
 ('244','36'),
 ('195','37'),
 ('200','37'),
 ('232','37'),
 ('238','37'),
 ('245','37'),
 ('246','37'),
 ('247','37'),
 ('248','37'),
 ('249','37'),
 ('250','37'),
 ('251','37'),
 ('252','37'),
 ('253','37'),
 ('254','37'),
 ('255','37'),
 ('256','37'),
 ('257','37'),
 ('258','37'),
 ('259','37'),
 ('218','38'),
 ('232','38'),
 ('245','38'),
 ('260','38'),
 ('261','38'),
 ('262','38'),
 ('263','38'),
 ('264','38'),
 ('265','38'),
 ('266','38'),
 ('267','38'),
 ('268','38'),
 ('218','39'),
 ('219','39'),
 ('243','39'),
 ('245','39'),
 ('262','39'),
 ('269','39'),
 ('270','39'),
 ('271','39'),
 ('272','39'),
 ('273','39'),
 ('274','39'),
 ('35','4'),
 ('38','4'),
 ('39','4'),
 ('40','4'),
 ('41','4'),
 ('42','4'),
 ('43','4'),
 ('44','4'),
 ('45','4'),
 ('46','4'),
 ('47','4'),
 ('48','4'),
 ('49','4'),
 ('50','4'),
 ('51','4'),
 ('52','4'),
 ('53','4'),
 ('54','4'),
 ('55','4'),
 ('56','4'),
 ('57','4'),
 ('9','4'),
 ('101','40'),
 ('218','40'),
 ('219','40'),
 ('232','40'),
 ('245','40'),
 ('262','40'),
 ('275','40'),
 ('276','40'),
 ('277','40'),
 ('278','40'),
 ('279','40'),
 ('218','41'),
 ('219','41'),
 ('262','41'),
 ('264','41'),
 ('269','41'),
 ('270','41'),
 ('280','41'),
 ('281','41'),
 ('282','41'),
 ('283','41'),
 ('284','41'),
 ('285','41'),
 ('286','41'),
 ('287','41'),
 ('288','41'),
 ('289','41'),
 ('219','42'),
 ('232','42'),
 ('262','42'),
 ('280','42'),
 ('282','42'),
 ('283','42'),
 ('290','42'),
 ('291','42'),
 ('292','42'),
 ('293','42'),
 ('101','43'),
 ('232','43'),
 ('262','43'),
 ('267','43'),
 ('283','43'),
 ('291','43'),
 ('292','43'),
 ('294','43'),
 ('232','44'),
 ('262','44'),
 ('283','44'),
 ('291','44'),
 ('292','44'),
 ('294','44'),
 ('295','44'),
 ('296','44'),
 ('232','45'),
 ('262','45'),
 ('283','45'),
 ('291','45'),
 ('292','45'),
 ('294','45'),
 ('232','46'),
 ('262','46'),
 ('283','46'),
 ('291','46'),
 ('292','46'),
 ('294','46'),
 ('190','47'),
 ('292','47'),
 ('297','47'),
 ('298','47'),
 ('299','47'),
 ('300','47'),
 ('301','47'),
 ('302','47'),
 ('35','5'),
 ('40','5'),
 ('58','5'),
 ('59','5'),
 ('60','5'),
 ('61','5'),
 ('25','6'),
 ('35','6'),
 ('40','6'),
 ('59','6'),
 ('61','6'),
 ('62','6'),
 ('63','6'),
 ('64','6'),
 ('65','6'),
 ('66','6'),
 ('24','7'),
 ('49','7'),
 ('67','7'),
 ('68','7'),
 ('69','7'),
 ('70','7'),
 ('71','7'),
 ('72','7'),
 ('73','7'),
 ('74','7'),
 ('75','7'),
 ('76','7'),
 ('77','7'),
 ('24','8'),
 ('49','8'),
 ('59','8'),
 ('60','8'),
 ('68','8'),
 ('69','8'),
 ('78','8'),
 ('79','8'),
 ('67','9');
/*!40000 ALTER TABLE `inv_chief_scientist_cruise` ENABLE KEYS */;


--
-- Definition of table `inv_cruise_bodc_category`
--

DROP TABLE IF EXISTS `inv_cruise_bodc_category`;
CREATE TABLE `inv_cruise_bodc_category` (
  `category_code` varchar(4) NOT NULL,
  `id_cruise` char(10) NOT NULL,
  PRIMARY KEY  (`category_code`,`id_cruise`),
  KEY `FKE9E183F5F0F27186` (`id_cruise`),
  KEY `FKE9E183F5903D89AF` (`category_code`),
  CONSTRAINT `FKE9E183F5903D89AF` FOREIGN KEY (`category_code`) REFERENCES `bodc_category` (`CODE`),
  CONSTRAINT `FK_inv_cruise_bodc_category_1` FOREIGN KEY (`category_code`) REFERENCES `bodc_category` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_cruise_bodc_category`
--

/*!40000 ALTER TABLE `inv_cruise_bodc_category` DISABLE KEYS */;
INSERT INTO `inv_cruise_bodc_category` (`category_code`,`id_cruise`) VALUES 
 ('B015','43'),
 ('B015','44'),
 ('B015','45'),
 ('B015','46'),
 ('B015','47'),
 ('B030','1'),
 ('B030','11'),
 ('B030','16'),
 ('B030','19'),
 ('B030','20'),
 ('B030','21'),
 ('B030','22'),
 ('B030','23'),
 ('B030','24'),
 ('B030','25'),
 ('B030','26'),
 ('B030','27'),
 ('B030','28'),
 ('B030','29'),
 ('B030','30'),
 ('B030','31'),
 ('B030','32'),
 ('B030','33'),
 ('B030','34'),
 ('B030','35'),
 ('B030','36'),
 ('B030','37'),
 ('B030','38'),
 ('B030','39'),
 ('B030','4'),
 ('B030','40'),
 ('B030','41'),
 ('B030','42'),
 ('B030','43'),
 ('B030','44'),
 ('B030','45'),
 ('B030','46'),
 ('B030','47'),
 ('B035','16'),
 ('B035','23'),
 ('B035','25'),
 ('B035','26'),
 ('B035','27'),
 ('B035','28'),
 ('B035','29'),
 ('B035','30'),
 ('B035','31'),
 ('B035','32'),
 ('B035','33'),
 ('B035','34'),
 ('B035','35'),
 ('B035','36'),
 ('B035','37'),
 ('B035','38'),
 ('B035','39'),
 ('B035','40'),
 ('B035','41'),
 ('B035','42'),
 ('B035','43'),
 ('B035','44'),
 ('B035','45'),
 ('B035','46'),
 ('B035','47'),
 ('B045','11'),
 ('B045','16'),
 ('B045','19'),
 ('B045','20'),
 ('B045','21'),
 ('B045','22'),
 ('B045','23'),
 ('B045','24'),
 ('B045','25'),
 ('B045','26'),
 ('B045','27'),
 ('B045','28'),
 ('B045','29'),
 ('B045','30'),
 ('B045','31'),
 ('B045','32'),
 ('B045','33'),
 ('B045','34'),
 ('B045','35'),
 ('B045','36'),
 ('B045','37'),
 ('B045','38'),
 ('B045','39'),
 ('B045','4'),
 ('B045','40'),
 ('B045','41'),
 ('B045','42'),
 ('B045','43'),
 ('B045','44'),
 ('B045','45'),
 ('B045','46'),
 ('B045','47'),
 ('C005','10'),
 ('C005','11'),
 ('C005','12'),
 ('C005','13'),
 ('C005','15'),
 ('C005','16'),
 ('C005','17'),
 ('C005','18'),
 ('C005','19'),
 ('C005','20'),
 ('C005','21'),
 ('C005','22'),
 ('C005','23'),
 ('C005','24'),
 ('C005','25'),
 ('C005','26'),
 ('C005','27'),
 ('C005','28'),
 ('C005','29'),
 ('C005','30'),
 ('C005','31'),
 ('C005','32'),
 ('C005','33'),
 ('C005','34'),
 ('C005','35'),
 ('C005','36'),
 ('C005','37'),
 ('C005','38'),
 ('C005','39'),
 ('C005','4'),
 ('C005','40'),
 ('C005','41'),
 ('C005','42'),
 ('C005','43'),
 ('C005','44'),
 ('C005','45'),
 ('C005','46'),
 ('C005','47'),
 ('C005','5'),
 ('C005','6'),
 ('C005','7'),
 ('C005','8'),
 ('C005','9'),
 ('C010','1'),
 ('C010','10'),
 ('C010','11'),
 ('C010','12'),
 ('C010','13'),
 ('C010','15'),
 ('C010','16'),
 ('C010','17'),
 ('C010','18'),
 ('C010','19'),
 ('C010','20'),
 ('C010','21'),
 ('C010','22'),
 ('C010','23'),
 ('C010','24'),
 ('C010','25'),
 ('C010','26'),
 ('C010','27'),
 ('C010','28'),
 ('C010','29'),
 ('C010','3'),
 ('C010','30'),
 ('C010','31'),
 ('C010','32'),
 ('C010','33'),
 ('C010','34'),
 ('C010','35'),
 ('C010','36'),
 ('C010','37'),
 ('C010','38'),
 ('C010','39'),
 ('C010','4'),
 ('C010','40'),
 ('C010','41'),
 ('C010','42'),
 ('C010','43'),
 ('C010','44'),
 ('C010','45'),
 ('C010','46'),
 ('C010','47'),
 ('C010','5'),
 ('C010','6'),
 ('C010','7'),
 ('C010','8'),
 ('C010','9'),
 ('C015','1'),
 ('C015','10'),
 ('C015','11'),
 ('C015','12'),
 ('C015','13'),
 ('C015','15'),
 ('C015','16'),
 ('C015','17'),
 ('C015','18'),
 ('C015','19'),
 ('C015','2'),
 ('C015','20'),
 ('C015','21'),
 ('C015','22'),
 ('C015','23'),
 ('C015','24'),
 ('C015','25'),
 ('C015','26'),
 ('C015','27'),
 ('C015','28'),
 ('C015','29'),
 ('C015','3'),
 ('C015','30'),
 ('C015','31'),
 ('C015','32'),
 ('C015','33'),
 ('C015','34'),
 ('C015','35'),
 ('C015','36'),
 ('C015','37'),
 ('C015','38'),
 ('C015','39'),
 ('C015','4'),
 ('C015','40'),
 ('C015','41'),
 ('C015','42'),
 ('C015','43'),
 ('C015','44'),
 ('C015','45'),
 ('C015','46'),
 ('C015','47'),
 ('C015','5'),
 ('C015','6'),
 ('C015','7'),
 ('C015','8'),
 ('C015','9'),
 ('C040','10'),
 ('C040','11'),
 ('C040','12'),
 ('C040','13'),
 ('C040','15'),
 ('C040','16'),
 ('C040','17'),
 ('C040','18'),
 ('C040','19'),
 ('C040','20'),
 ('C040','21'),
 ('C040','22'),
 ('C040','23'),
 ('C040','24'),
 ('C040','25'),
 ('C040','26'),
 ('C040','27'),
 ('C040','28'),
 ('C040','29'),
 ('C040','30'),
 ('C040','31'),
 ('C040','32'),
 ('C040','33'),
 ('C040','34'),
 ('C040','35'),
 ('C040','36'),
 ('C040','37'),
 ('C040','38'),
 ('C040','39'),
 ('C040','4'),
 ('C040','40'),
 ('C040','41'),
 ('C040','42'),
 ('C040','43'),
 ('C040','44'),
 ('C040','45'),
 ('C040','46'),
 ('C040','47'),
 ('C040','5'),
 ('C040','6'),
 ('C040','7'),
 ('C040','8'),
 ('C040','9'),
 ('C045','1'),
 ('C045','13'),
 ('C045','15'),
 ('C045','16'),
 ('C045','17'),
 ('C045','18'),
 ('C045','19'),
 ('C045','2'),
 ('C045','20'),
 ('C045','21'),
 ('C045','22'),
 ('C045','23'),
 ('C045','24'),
 ('C045','25'),
 ('C045','26'),
 ('C045','27'),
 ('C045','28'),
 ('C045','29'),
 ('C045','30'),
 ('C045','31'),
 ('C045','32'),
 ('C045','33'),
 ('C045','34'),
 ('C045','35'),
 ('C045','36'),
 ('C045','37'),
 ('C045','38'),
 ('C045','39'),
 ('C045','40'),
 ('C045','41'),
 ('C045','42'),
 ('C045','43'),
 ('C045','44'),
 ('C045','45'),
 ('C045','46'),
 ('C045','47'),
 ('D015','1'),
 ('D015','10'),
 ('D015','11'),
 ('D015','12'),
 ('D015','13'),
 ('D015','15'),
 ('D015','16'),
 ('D015','17'),
 ('D015','18'),
 ('D015','19'),
 ('D015','2'),
 ('D015','20'),
 ('D015','21'),
 ('D015','22'),
 ('D015','23'),
 ('D015','24'),
 ('D015','25'),
 ('D015','26'),
 ('D015','27'),
 ('D015','28'),
 ('D015','29'),
 ('D015','3'),
 ('D015','30'),
 ('D015','31'),
 ('D015','32'),
 ('D015','33'),
 ('D015','34'),
 ('D015','35'),
 ('D015','36'),
 ('D015','37'),
 ('D015','38'),
 ('D015','39'),
 ('D015','4'),
 ('D015','40'),
 ('D015','41'),
 ('D015','42'),
 ('D015','43'),
 ('D015','44'),
 ('D015','45'),
 ('D015','46'),
 ('D015','47'),
 ('D015','5'),
 ('D015','6'),
 ('D015','7'),
 ('D015','8'),
 ('D015','9'),
 ('D020','1'),
 ('D020','2'),
 ('D025','1'),
 ('D025','10'),
 ('D025','11'),
 ('D025','12'),
 ('D025','13'),
 ('D025','15'),
 ('D025','16'),
 ('D025','17'),
 ('D025','18'),
 ('D025','19'),
 ('D025','2'),
 ('D025','20'),
 ('D025','21'),
 ('D025','22'),
 ('D025','23'),
 ('D025','24'),
 ('D025','25'),
 ('D025','26'),
 ('D025','27'),
 ('D025','28'),
 ('D025','29'),
 ('D025','3'),
 ('D025','30'),
 ('D025','31'),
 ('D025','32'),
 ('D025','33'),
 ('D025','34'),
 ('D025','35'),
 ('D025','36'),
 ('D025','37'),
 ('D025','38'),
 ('D025','39'),
 ('D025','4'),
 ('D025','40'),
 ('D025','41'),
 ('D025','42'),
 ('D025','43'),
 ('D025','44'),
 ('D025','45'),
 ('D025','46'),
 ('D025','47'),
 ('D025','5'),
 ('D025','6'),
 ('D025','7'),
 ('D025','8'),
 ('D025','9'),
 ('D034','10'),
 ('D034','11'),
 ('D034','12'),
 ('D034','13'),
 ('D034','15'),
 ('D034','16'),
 ('D034','17'),
 ('D034','18'),
 ('D034','19'),
 ('D034','20'),
 ('D034','21'),
 ('D034','22'),
 ('D034','23'),
 ('D034','24'),
 ('D034','25'),
 ('D034','26'),
 ('D034','27'),
 ('D034','28'),
 ('D034','29'),
 ('D034','30'),
 ('D034','31'),
 ('D034','32'),
 ('D034','33'),
 ('D034','34'),
 ('D034','35'),
 ('D034','36'),
 ('D034','37'),
 ('D034','38'),
 ('D034','4'),
 ('D034','5'),
 ('D034','6'),
 ('D034','7'),
 ('D034','8'),
 ('D034','9'),
 ('G010','10'),
 ('G010','11'),
 ('G012','10'),
 ('G012','11'),
 ('M010','1'),
 ('M010','10'),
 ('M010','11'),
 ('M010','12'),
 ('M010','13'),
 ('M010','15'),
 ('M010','16'),
 ('M010','17'),
 ('M010','18'),
 ('M010','19'),
 ('M010','2'),
 ('M010','20'),
 ('M010','21'),
 ('M010','22'),
 ('M010','23'),
 ('M010','24'),
 ('M010','25'),
 ('M010','26'),
 ('M010','27'),
 ('M010','28'),
 ('M010','29'),
 ('M010','3'),
 ('M010','30'),
 ('M010','31'),
 ('M010','32'),
 ('M010','33'),
 ('M010','34'),
 ('M010','35'),
 ('M010','36'),
 ('M010','37'),
 ('M010','38'),
 ('M010','39'),
 ('M010','4'),
 ('M010','40'),
 ('M010','41'),
 ('M010','42'),
 ('M010','43'),
 ('M010','44'),
 ('M010','45'),
 ('M010','46'),
 ('M010','47'),
 ('M010','5'),
 ('M010','6'),
 ('M010','7'),
 ('M010','8'),
 ('M010','9');
/*!40000 ALTER TABLE `inv_cruise_bodc_category` ENABLE KEYS */;


--
-- Definition of table `inv_cruise_institutions`
--

DROP TABLE IF EXISTS `inv_cruise_institutions`;
CREATE TABLE `inv_cruise_institutions` (
  `Id_institution` int(10) unsigned NOT NULL,
  `id_cruise` char(10) NOT NULL,
  `relation_type` char(2) NOT NULL,
  PRIMARY KEY  (`Id_institution`,`id_cruise`,`relation_type`),
  KEY `FKE06A7B97F0F27186` (`id_cruise`),
  KEY `FKE06A7B975EC25309` (`Id_institution`),
  CONSTRAINT `FKE06A7B975EC25309` FOREIGN KEY (`Id_institution`) REFERENCES `inv_institutions` (`Id_institution`),
  CONSTRAINT `FK_inv_cruise_institutions_1` FOREIGN KEY (`Id_institution`) REFERENCES `inv_institutions` (`Id_institution`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_cruise_institutions`
--

/*!40000 ALTER TABLE `inv_cruise_institutions` DISABLE KEYS */;
INSERT INTO `inv_cruise_institutions` (`Id_institution`,`id_cruise`,`relation_type`) VALUES 
 (1,'21','PA'),
 (1,'22','PA'),
 (1,'23','PA'),
 (1,'24','PA'),
 (1,'25','PA'),
 (1,'26','PA'),
 (1,'27','PA'),
 (1,'28','PA'),
 (1,'29','PA'),
 (1,'30','PA'),
 (1,'31','PA'),
 (1,'32','PA'),
 (1,'33','PA'),
 (1,'35','PA'),
 (1,'36','PA'),
 (1,'37','PA'),
 (1,'38','PA'),
 (1,'39','PA'),
 (1,'40','PA'),
 (1,'41','PA'),
 (1,'42','PA'),
 (1,'43','PA'),
 (1,'44','PA'),
 (1,'45','PA'),
 (1,'46','PA'),
 (1,'47','PA'),
 (3,'11','PA'),
 (3,'12','PA'),
 (3,'13','PA'),
 (3,'16','PA'),
 (3,'19','PA'),
 (3,'20','PA'),
 (3,'21','PA'),
 (3,'22','PA'),
 (3,'23','PA'),
 (11,'1','FN'),
 (11,'10','FN'),
 (11,'11','FN'),
 (11,'12','FN'),
 (11,'13','FN'),
 (11,'15','FN'),
 (11,'16','FN'),
 (11,'17','FN'),
 (11,'18','FN'),
 (11,'19','FN'),
 (11,'2','FN'),
 (11,'20','FN'),
 (11,'21','FN'),
 (11,'22','FN'),
 (11,'23','FN'),
 (11,'24','FN'),
 (11,'25','FN'),
 (11,'26','FN'),
 (11,'27','FN'),
 (11,'28','FN'),
 (11,'29','FN'),
 (11,'3','FN'),
 (11,'30','FN'),
 (11,'31','FN'),
 (11,'32','FN'),
 (11,'33','FN'),
 (11,'34','FN'),
 (11,'35','FN'),
 (11,'36','FN'),
 (11,'37','FN'),
 (11,'38','FN'),
 (11,'39','FN'),
 (11,'4','FN'),
 (11,'40','FN'),
 (11,'41','FN'),
 (11,'42','FN'),
 (11,'43','FN'),
 (11,'44','FN'),
 (11,'45','FN'),
 (11,'46','FN'),
 (11,'47','FN'),
 (11,'5','FN'),
 (11,'6','FN'),
 (11,'7','FN'),
 (11,'8','FN'),
 (11,'9','FN'),
 (16,'38','PA'),
 (16,'41','PA'),
 (16,'43','PA'),
 (18,'38','PA'),
 (18,'43','PA'),
 (18,'44','PA'),
 (18,'45','PA'),
 (18,'46','PA'),
 (18,'47','PA'),
 (20,'29','PA'),
 (20,'36','PA'),
 (20,'37','PA'),
 (20,'40','PA'),
 (20,'41','PA'),
 (22,'36','PA'),
 (22,'37','PA'),
 (22,'38','PA'),
 (22,'40','PA'),
 (22,'42','PA'),
 (22,'43','PA'),
 (22,'44','PA'),
 (22,'45','PA'),
 (22,'46','PA'),
 (26,'38','PA'),
 (26,'41','PA'),
 (26,'42','PA'),
 (28,'4','PA'),
 (29,'4','PA'),
 (34,'39','PA'),
 (34,'40','PA'),
 (34,'41','PA'),
 (35,'7','PA'),
 (36,'44','PA'),
 (37,'1','PA'),
 (37,'16','PA'),
 (37,'19','PA'),
 (37,'20','PA'),
 (37,'21','PA'),
 (37,'37','PA'),
 (37,'4','PA'),
 (37,'40','PA'),
 (37,'41','PA'),
 (37,'42','PA'),
 (37,'43','PA'),
 (37,'44','PA'),
 (37,'45','PA'),
 (37,'46','PA'),
 (37,'47','PA'),
 (38,'38','PA'),
 (40,'37','PA'),
 (40,'38','PA'),
 (40,'44','PA'),
 (41,'47','PA'),
 (42,'1','PA'),
 (42,'11','PA'),
 (42,'16','PA'),
 (42,'19','PA'),
 (42,'20','PA'),
 (42,'22','PA'),
 (42,'29','PA'),
 (43,'39','PA'),
 (49,'1','FN'),
 (49,'1','PA'),
 (49,'10','FN'),
 (49,'10','PA'),
 (49,'11','FN'),
 (49,'11','PA'),
 (49,'12','FN'),
 (49,'13','FN'),
 (49,'15','FN'),
 (49,'16','FN'),
 (49,'16','PA'),
 (49,'17','FN'),
 (49,'18','FN'),
 (49,'19','FN'),
 (49,'2','FN'),
 (49,'2','PA'),
 (49,'20','FN'),
 (49,'21','PA'),
 (49,'22','FN'),
 (49,'22','PA'),
 (49,'23','FN'),
 (49,'23','PA'),
 (49,'24','FN'),
 (49,'24','PA'),
 (49,'25','FN'),
 (49,'25','PA'),
 (49,'26','FN'),
 (49,'26','PA'),
 (49,'27','FN'),
 (49,'27','PA'),
 (49,'28','FN'),
 (49,'28','PA'),
 (49,'29','FN'),
 (49,'29','PA'),
 (49,'3','FN'),
 (49,'3','PA'),
 (49,'30','FN'),
 (49,'30','PA'),
 (49,'31','FN'),
 (49,'31','PA'),
 (49,'32','FN'),
 (49,'32','PA'),
 (49,'33','FN'),
 (49,'33','PA'),
 (49,'34','FN'),
 (49,'35','FN'),
 (49,'36','FN'),
 (49,'36','PA'),
 (49,'37','FN'),
 (49,'37','PA'),
 (49,'38','FN'),
 (49,'39','FN'),
 (49,'39','PA'),
 (49,'4','FN'),
 (49,'4','PA'),
 (49,'42','PA'),
 (49,'5','FN'),
 (49,'5','PA'),
 (49,'6','FN'),
 (49,'6','PA'),
 (49,'7','FN'),
 (49,'7','PA'),
 (49,'8','FN'),
 (49,'8','PA'),
 (49,'9','FN'),
 (49,'9','PA'),
 (50,'1','PA'),
 (51,'1','PA'),
 (51,'26','PA'),
 (51,'29','PA'),
 (53,'12','PA'),
 (53,'16','PA'),
 (53,'19','PA'),
 (53,'23','PA'),
 (53,'24','PA'),
 (53,'25','PA'),
 (53,'26','PA'),
 (53,'27','PA'),
 (53,'28','PA'),
 (53,'29','PA'),
 (53,'30','PA'),
 (53,'33','PA'),
 (53,'4','PA'),
 (53,'6','PA'),
 (53,'7','PA'),
 (53,'8','PA'),
 (54,'8','PA'),
 (55,'11','PA'),
 (55,'16','PA'),
 (55,'19','PA'),
 (55,'20','PA'),
 (55,'21','PA'),
 (55,'22','PA'),
 (56,'16','PA'),
 (57,'19','PA'),
 (58,'20','PA'),
 (59,'20','PA'),
 (59,'38','PA'),
 (60,'21','PA'),
 (61,'22','PA'),
 (62,'21','PA'),
 (62,'22','PA'),
 (63,'27','PA'),
 (64,'30','PA'),
 (65,'31','PA'),
 (66,'32','PA'),
 (67,'36','PA'),
 (68,'36','PA'),
 (69,'37','PA'),
 (70,'39','PA'),
 (71,'40','PA'),
 (72,'40','PA'),
 (72,'42','PA'),
 (73,'41','PA'),
 (74,'41','PA'),
 (75,'47','PA');
/*!40000 ALTER TABLE `inv_cruise_institutions` ENABLE KEYS */;


--
-- Definition of table `inv_cruise_inventory`
--

DROP TABLE IF EXISTS `inv_cruise_inventory`;
CREATE TABLE `inv_cruise_inventory` (
  `id_cruise` char(10) NOT NULL,
  `ocean_area` smallint(6) default NULL,
  `country` char(2) default NULL,
  `year` smallint(6) default NULL,
  `begin_date` varchar(40) default NULL,
  `end_date` varchar(40) default NULL,
  `ship_name` int(10) unsigned default NULL,
  `cruise_name` varchar(255) default NULL,
  `cruise_objetives` varchar(255) default NULL,
  `status` char(2) default NULL,
  `port_of_departure` char(3) default NULL,
  `port_of_return` char(3) default NULL,
  `uri_metadata` varchar(255) default NULL,
  `uri_project` varchar(255) default NULL,
  `uri_report` varchar(255) default NULL,
  `countryPort` varchar(255) default NULL,
  `id_project` int(10) unsigned default NULL,
  `return_country_port` varchar(255) default NULL,
  PRIMARY KEY  (`id_cruise`),
  KEY `FK_inv_cruise_inventory_4` (`country`,`port_of_departure`),
  KEY `FK99F05D0099652656` (`ocean_area`),
  KEY `FK99F05D001D87CD82` (`status`),
  KEY `FK99F05D007B672D02` (`countryPort`,`port_of_departure`),
  KEY `FK99F05D00C92B13D8` (`country`),
  KEY `FK99F05D006739E0F4` (`return_country_port`,`port_of_return`),
  KEY `FK99F05D00299B174F` (`ship_name`),
  KEY `FK99F05D00218CF214` (`id_project`),
  CONSTRAINT `FK99F05D00299B174F` FOREIGN KEY (`ship_name`) REFERENCES `inv_ship_name` (`Id`),
  CONSTRAINT `FK99F05D006739E0F4` FOREIGN KEY (`return_country_port`, `port_of_return`) REFERENCES `unlocode_port` (`Country`, `Location`),
  CONSTRAINT `FK99F05D007B672D02` FOREIGN KEY (`countryPort`, `port_of_departure`) REFERENCES `unlocode_port` (`Country`, `Location`),
  CONSTRAINT `FK99F05D0099652656` FOREIGN KEY (`ocean_area`) REFERENCES `regions` (`id`),
  CONSTRAINT `FK99F05D00C92B13D8` FOREIGN KEY (`country`) REFERENCES `paises_0101` (`pai_id`),
  CONSTRAINT `FK_inv_cruise_inventory_7` FOREIGN KEY (`ship_name`) REFERENCES `inv_ship_name` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_cruise_inventory`
--

/*!40000 ALTER TABLE `inv_cruise_inventory` DISABLE KEYS */;
INSERT INTO `inv_cruise_inventory` (`id_cruise`,`ocean_area`,`country`,`year`,`begin_date`,`end_date`,`ship_name`,`cruise_name`,`cruise_objetives`,`status`,`port_of_departure`,`port_of_return`,`uri_metadata`,`uri_project`,`uri_report`,`countryPort`,`id_project`,`return_country_port`) VALUES 
 ('1',1,'22',1970,'1970-03-01 00:00:00','1970-03-30 00:00:00',152,'PACÍFICO I',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('10',1,'22',1986,'1986-05-01 00:00:00','1986-06-01 00:00:00',155,'PACÍFICO IX - ERFEN VI',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('11',1,'22',1987,'1987-03-24 00:00:00','1987-04-22 00:00:00',155,'PACÍFICO X - ERFEN VII',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('12',1,'22',1988,'1988-03-01 00:00:00','1988-04-01 00:00:00',155,'PACÍFICO XII - ERFEN IX',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('13',1,'22',1988,'1988-11-01 00:00:00','1988-11-30 00:00:00',NULL,'PACÍFICO XIII',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('15',1,'22',1989,'1989-03-01 00:00:00','1989-03-30 00:00:00',NULL,'PACÍFICO XIV- ERFEN XI',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('16',1,'22',1989,'1989-04-01 00:00:00','1989-04-30 00:00:00',156,'PACÍFICO XV - ERFEN XII',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('17',1,'22',1990,'1990-03-01 00:00:00','1990-04-01 00:00:00',NULL,'PACÍFICO XVI',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('18',1,'22',1990,'1990-09-01 00:00:00','1990-09-30 00:00:00',NULL,'PACÍFICO XVII',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('19',1,'22',1991,'1991-03-01 00:00:00','1991-04-01 00:00:00',156,'PACÍFICO XVIII - ERFEN XV',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('2',1,'22',1972,'1972-02-13 00:00:00','1972-03-11 00:00:00',152,'PACÍFICO II',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('20',1,'22',1991,'1991-09-18 00:00:00','1991-10-14 00:00:00',156,'PACÍFICO XIX - ERFEN XVI',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('21',1,'22',1993,'1993-04-12 00:00:00','1993-05-08 00:00:00',155,'ERFEN XX',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('22',1,'22',1993,'1993-10-29 00:00:00','1993-10-20 00:00:00',155,'ERFEN XXI',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('23',1,'22',1994,'1994-11-01 00:00:00','1994-11-30 00:00:00',155,'PACÍFICO XXIV - ERFEN XXII',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('24',1,'22',1996,'1996-06-01 00:00:00','1996-06-30 00:00:00',NULL,'PACÍFICO XXV - ERFEN XXIII',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('25',1,'22',1996,'1996-10-01 00:00:00','1996-10-30 00:00:00',NULL,'PACÍFICO XXVI - ERFEN XXIV',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('26',1,'22',1997,'1997-05-01 00:00:00','1997-05-30 00:00:00',NULL,'PACÍFICO XXVII - ERFEN XXV',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('27',1,'22',1997,'1997-11-01 00:00:00','1997-12-01 00:00:00',156,'PACÍFICO XXVIII - ERFEN XXVI',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('28',1,'22',1998,'1998-05-01 00:00:00','1998-05-30 00:00:00',156,'PACÍFICO XXIX - ERFEN XXVII',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('29',1,'22',1998,'1998-10-01 00:00:00','1988-10-30 00:00:00',156,'PACÍFICO XXX - ERFEN XXVIII',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('3',1,'22',1972,'1972-06-10 00:00:00','1972-06-28 00:00:00',152,'PACÍFICO III',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('30',1,'22',1999,'1999-05-01 00:00:00','1999-05-30 00:00:00',156,'PACÍFICO XXXI - ERFEN XXIX',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('31',1,'22',2000,'2000-05-01 00:00:00','2000-05-30 00:00:00',154,'PACÍFICO XXXI - ERFEN XXX',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('32',1,'22',2000,'2000-11-01 00:00:00','2000-12-01 00:00:00',155,'PACÍFICO XXXII',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('33',1,'22',2001,'2001-06-22 00:00:00','2001-07-12 00:00:00',155,'PACÍFICO XXXIV - ERFEN XXXII',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('34',1,'22',2001,'2001-08-01 00:00:00','2001-09-01 00:00:00',155,'PACÍFICO XXXV-ERFEN XXXIII',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('35',1,'22',2002,'2002-04-01 00:00:00','2002-04-30 00:00:00',156,'PACÍFICO XXXVI - ERFEN XXXIV',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('36',1,'22',2002,'2002-09-01 00:00:00','2002-09-30 00:00:00',156,'PACÍFICO XXXVII - ERFEN XXXV',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('37',1,'22',2003,'2003-09-01 00:00:00','2003-09-30 00:00:00',156,'PACÍFICO XXXVIII - ERFEN XXXVI',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('38',1,'22',2004,'2004-09-09 00:00:00','2004-10-08 00:00:00',155,'PACÍFICO XXXIX - ERFEN XXXVII',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('39',1,'22',2005,'2005-07-09 00:00:00','2005-07-26 00:00:00',155,'PACÍFICO XL',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('4',1,'22',1975,'1975-01-31 00:00:00','1975-02-17 00:00:00',152,'PACÍFICO IV - ERFEN I',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('40',1,'22',2005,'2005-09-02 00:00:00','2005-09-27 00:00:00',156,'PACÍFICO XLI-ERFEN XXXVIII',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('41',1,'22',2006,'2006-03-01 00:00:00','2006-03-27 00:00:00',156,'PACÍFICO XLII-ERFEN XXXIX',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('42',1,'22',2006,'2006-09-15 00:00:00','2006-09-26 00:00:00',155,'PACÍFICO XLIII-ERFEN XL',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('43',1,'22',2007,'2007-01-30 00:00:00','2007-02-22 00:00:00',155,'PACÍFICO XLIV-ERFEN XLI',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('44',1,'22',2007,'2007-09-03 00:00:00','2007-09-27 00:00:00',156,'PACÍFICO XLV-ERFEN XLII',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('45',1,'22',2008,'2008-03-09 00:00:00','2008-03-28 00:00:00',156,'Pacífico XLVI - ERFEN XLIII',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('46',1,'22',2008,'2008-09-06 00:00:00','2008-09-26 00:00:00',156,'Pacífico XLVII - ERFEN XLIV',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('47',1,'22',2009,'2009-03-02 00:00:00','2009-03-27 00:00:00',156,'Pacífico XLVIII - ERFEN XLV',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('5',1,'22',1976,'1976-04-14 00:00:00','1976-05-17 00:00:00',152,'PACÍFICO V - ERFEN II',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('6',1,'22',1976,'1976-09-23 00:00:00','1976-10-29 00:00:00',152,'PACÍFICO VI - ERFEN III',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('7',1,'22',1977,'1977-10-22 00:00:00','1976-11-22 00:00:00',152,'PACÍFICO VII',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('8',1,'22',1978,'1978-11-29 00:00:00','1978-12-12 00:00:00',152,'ERFEN IV',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22'),
 ('9',1,'22',1982,'1982-11-01 00:00:00','1982-11-30 00:00:00',156,'PACÍFICO VIII - ERFEN V',NULL,'0','TCO','TCO',NULL,NULL,NULL,'22',NULL,'22');
/*!40000 ALTER TABLE `inv_cruise_inventory` ENABLE KEYS */;


--
-- Definition of table `inv_discipline`
--

DROP TABLE IF EXISTS `inv_discipline`;
CREATE TABLE `inv_discipline` (
  `id_discipline` int(10) unsigned NOT NULL auto_increment,
  `discipline` varchar(255) NOT NULL,
  PRIMARY KEY  (`id_discipline`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_discipline`
--

/*!40000 ALTER TABLE `inv_discipline` DISABLE KEYS */;
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
 (1,'DIMAR-CCCP-Chemistry laboratory',1,2004,'Oxígeno disuelto, nitratos, nitritos amonio, fósforo reactivo, pH, conductividad, sólidos suspendidos, clorofila a, silicato reactivo, salinidad, hidrocarburos aromáticos polinucleares (HAP) en aguas y HAP en sedimentos','Robinson Casanova','Chemistry laboratory head','Vía El Morro, Capitanía de Puerto Tumaco, Nariño','7272637','7271180',187,'22','http://www.cccp.org.co/modules.php?name=Content&pa=showpage&pid=205','rcasanova@dimar.mil.co','cccp@dimar.mil.co'),
 (2,'DIMAR-CIOH-Chemistry laboratory',3,2006,'pH, ammonio, nitratos, ortofosfatos','Alex Barraza','Chemistry laboratory head','Barrio Bosque, Sector Manzanillo Escuela Naval, Cartagena','6694465-6694104-6695291','6694297-6694390-6694449',982,'22','http://www.cioh.org.co/proserv/laboratorios.html','arap@cioh.org.co','cioh@dimar.mil.co'),
 (3,'DIMAR-CCCP-Biology laboratory',1,NULL,NULL,'David Escobar Marmol','Biology laboratory head','Vía El Morro, Capitanía de Puerto Tumaco, Nariño','7272637','7271180',187,'22','http://www.cccp.org.co/modules.php?name=Content&pa=showpage&pid=213','descobar@dimar.mil.co','cccp@dimar.mil.co'),
 (4,'DIMAR-CIOH-Biology laboratory',3,NULL,NULL,'Gustavo Tous','Biology laboratory head','Barrio Bosque, Sector Manzanillo Escuela Naval, Cartagena','6694465','6694297',982,'22','http://www.cioh.org.co/proserv/laboratorios.html','gtous@cioh.org.co','cioh@dimar.mil.co'),
 (5,'UNIVALLE-Ecology laboratory',37,NULL,NULL,'Alan Giraldo',NULL,NULL,NULL,NULL,NULL,'22',NULL,'agiraldo@univalle.edu.co',NULL),
 (6,'INVEMAR-Ecology laboratory',22,NULL,NULL,'Edgar Arteaga',NULL,'INVEMAR SEDE PACIFICO\r\nCentro Internacional de Agricultura Tropical - CIAT\r\nRecta Cali – Palmira Km. 17','4450000 Extensión 3260',NULL,NULL,'22','http://www.invemar.org.co','earteaga@invemar.org.co',NULL);
/*!40000 ALTER TABLE `inv_laboratories` ENABLE KEYS */;


--
-- Definition of table `inv_laboratories_cruises`
--

DROP TABLE IF EXISTS `inv_laboratories_cruises`;
CREATE TABLE `inv_laboratories_cruises` (
  `id_laboratory` int(10) unsigned NOT NULL,
  `id_cruise` varchar(10) NOT NULL,
  PRIMARY KEY  (`id_laboratory`,`id_cruise`),
  KEY `FK537ACF1E6FAB29A2` (`id_laboratory`),
  KEY `FK537ACF1EF0F27186` (`id_cruise`),
  CONSTRAINT `FK537ACF1E6FAB29A2` FOREIGN KEY (`id_laboratory`) REFERENCES `inv_laboratories` (`id_lab`),
  CONSTRAINT `FK_inv_laboratories_cruises_1` FOREIGN KEY (`id_laboratory`) REFERENCES `inv_laboratories` (`id_lab`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_laboratories_cruises`
--

/*!40000 ALTER TABLE `inv_laboratories_cruises` DISABLE KEYS */;
INSERT INTO `inv_laboratories_cruises` (`id_laboratory`,`id_cruise`) VALUES 
 (1,'21'),
 (1,'22'),
 (1,'23'),
 (1,'24'),
 (1,'25'),
 (1,'26'),
 (1,'27'),
 (1,'28'),
 (1,'29'),
 (1,'30'),
 (1,'31'),
 (1,'32'),
 (1,'33'),
 (1,'35'),
 (1,'36'),
 (1,'37'),
 (1,'38'),
 (1,'39'),
 (1,'40'),
 (1,'41'),
 (1,'42'),
 (1,'43'),
 (1,'44'),
 (1,'45'),
 (1,'46'),
 (1,'47'),
 (5,'1'),
 (5,'16'),
 (5,'19'),
 (5,'20'),
 (5,'21'),
 (5,'37'),
 (5,'4'),
 (5,'40'),
 (5,'41'),
 (5,'42'),
 (5,'43'),
 (5,'44'),
 (5,'45'),
 (5,'46'),
 (5,'47'),
 (6,'36'),
 (6,'37'),
 (6,'38'),
 (6,'40'),
 (6,'42'),
 (6,'43'),
 (6,'44'),
 (6,'45'),
 (6,'46'),
 (6,'47');
/*!40000 ALTER TABLE `inv_laboratories_cruises` ENABLE KEYS */;


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
  PRIMARY KEY  (`id_project`),
  KEY `FKDB0708CBA0233FC2` (`id_status`),
  KEY `FKDB0708CB5EC25309` (`id_institution`),
  CONSTRAINT `FKDB0708CB5EC25309` FOREIGN KEY (`id_institution`) REFERENCES `inv_institutions` (`Id_institution`),
  CONSTRAINT `FKDB0708CBA0233FC2` FOREIGN KEY (`id_status`) REFERENCES `inv_status` (`id_status`),
  CONSTRAINT `FK_inv_project_1` FOREIGN KEY (`id_status`) REFERENCES `inv_status` (`id_status`),
  CONSTRAINT `FK_inv_project_2` FOREIGN KEY (`id_institution`) REFERENCES `inv_institutions` (`Id_institution`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_project`
--

/*!40000 ALTER TABLE `inv_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_project` ENABLE KEYS */;


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
INSERT INTO `isolanguages` (`id`,`code`) VALUES 
 (1,'aar'),
 (2,'abk'),
 (3,'ace'),
 (4,'ach'),
 (5,'ada'),
 (6,'ady'),
 (7,'afa'),
 (8,'afh'),
 (9,'afr'),
 (10,'ain'),
 (11,'aka'),
 (12,'akk'),
 (13,'alb'),
 (14,'ale'),
 (15,'alg'),
 (16,'alt'),
 (17,'amh'),
 (18,'ang'),
 (19,'anp'),
 (20,'apa'),
 (21,'ara'),
 (22,'arc'),
 (23,'arg'),
 (24,'arm'),
 (25,'arn'),
 (26,'arp'),
 (27,'art'),
 (28,'arw'),
 (29,'asm'),
 (30,'ast'),
 (31,'ath'),
 (32,'aus'),
 (33,'ava'),
 (34,'ave'),
 (35,'awa'),
 (36,'aym'),
 (37,'aze'),
 (38,'bad'),
 (39,'bai'),
 (40,'bak'),
 (41,'bal'),
 (42,'bam'),
 (43,'ban'),
 (44,'baq'),
 (45,'bas'),
 (46,'bat'),
 (47,'bej'),
 (48,'bel'),
 (49,'bem'),
 (50,'ben'),
 (51,'ber'),
 (52,'bho'),
 (53,'bih'),
 (54,'bik'),
 (55,'bin'),
 (56,'bis'),
 (57,'bla'),
 (58,'bnt'),
 (59,'bos'),
 (60,'bra'),
 (61,'bre'),
 (62,'btk'),
 (63,'bua'),
 (64,'bug'),
 (65,'bul'),
 (66,'bur'),
 (67,'byn'),
 (68,'cad'),
 (69,'cai'),
 (70,'car'),
 (71,'cat'),
 (72,'cau'),
 (73,'ceb'),
 (74,'cel'),
 (75,'cha'),
 (76,'chb'),
 (77,'che'),
 (78,'chg'),
 (79,'chi'),
 (80,'chk'),
 (81,'chm'),
 (82,'chn'),
 (83,'cho'),
 (84,'chp'),
 (85,'chr'),
 (86,'chu'),
 (87,'chv'),
 (88,'chy'),
 (89,'cmc'),
 (90,'cop'),
 (91,'cor'),
 (92,'cos'),
 (93,'cpe'),
 (94,'cpf'),
 (95,'cpp'),
 (96,'cre'),
 (97,'crh'),
 (98,'crp'),
 (99,'csb'),
 (100,'cus'),
 (101,'cze'),
 (102,'dak'),
 (103,'dan'),
 (104,'dar'),
 (105,'day'),
 (106,'del'),
 (107,'den'),
 (108,'dgr'),
 (109,'din'),
 (110,'div'),
 (111,'doi'),
 (112,'dra'),
 (113,'dsb'),
 (114,'dua'),
 (115,'dum'),
 (116,'dut'),
 (117,'dyu'),
 (118,'dzo'),
 (119,'efi'),
 (120,'egy'),
 (121,'eka'),
 (122,'elx'),
 (123,'eng'),
 (124,'enm'),
 (125,'epo'),
 (126,'est'),
 (127,'ewe'),
 (128,'ewo'),
 (129,'fan'),
 (130,'fao'),
 (131,'fat'),
 (132,'fij'),
 (133,'fil'),
 (134,'fin'),
 (135,'fiu'),
 (136,'fon'),
 (137,'fre'),
 (138,'frm'),
 (139,'fro'),
 (140,'frr'),
 (141,'frs'),
 (142,'fry'),
 (143,'ful'),
 (144,'fur'),
 (145,'gaa'),
 (146,'gay'),
 (147,'gba'),
 (148,'gem'),
 (149,'geo'),
 (150,'ger'),
 (151,'gez'),
 (152,'gil'),
 (153,'gla'),
 (154,'gle'),
 (155,'glg'),
 (156,'glv'),
 (157,'gmh'),
 (158,'goh'),
 (159,'gon'),
 (160,'gor'),
 (161,'got'),
 (162,'grb'),
 (163,'grc'),
 (164,'gre'),
 (165,'grn'),
 (166,'gsw'),
 (167,'guj'),
 (168,'gwi'),
 (169,'hai'),
 (170,'hat'),
 (171,'hau'),
 (172,'haw'),
 (173,'heb'),
 (174,'her'),
 (175,'hil'),
 (176,'him'),
 (177,'hin'),
 (178,'hit'),
 (179,'hmn'),
 (180,'hmo'),
 (181,'hsb'),
 (182,'hun'),
 (183,'hup'),
 (184,'iba'),
 (185,'ibo'),
 (186,'ice'),
 (187,'ido'),
 (188,'iii'),
 (189,'ijo'),
 (190,'iku'),
 (191,'ile'),
 (192,'ilo'),
 (193,'ina'),
 (194,'inc'),
 (195,'ind'),
 (196,'ine'),
 (197,'inh'),
 (198,'ipk'),
 (199,'ira'),
 (200,'iro'),
 (201,'ita'),
 (202,'jav'),
 (203,'jbo'),
 (204,'jpn'),
 (205,'jpr'),
 (206,'jrb'),
 (207,'kaa'),
 (208,'kab'),
 (209,'kac'),
 (210,'kal'),
 (211,'kam'),
 (212,'kan'),
 (213,'kar'),
 (214,'kas'),
 (215,'kau'),
 (216,'kaw'),
 (217,'kaz'),
 (218,'kbd'),
 (219,'kha'),
 (220,'khi'),
 (221,'khm'),
 (222,'kho'),
 (223,'kik'),
 (224,'kin'),
 (225,'kir'),
 (226,'kmb'),
 (227,'kok'),
 (228,'kom'),
 (229,'kon'),
 (230,'kor'),
 (231,'kos'),
 (232,'kpe'),
 (233,'krc'),
 (234,'krl'),
 (235,'kro'),
 (236,'kru'),
 (237,'kua'),
 (238,'kum'),
 (239,'kur'),
 (240,'kut'),
 (241,'lad'),
 (242,'lah'),
 (243,'lam'),
 (244,'lao'),
 (245,'lat'),
 (246,'lav'),
 (247,'lez'),
 (248,'lim'),
 (249,'lin'),
 (250,'lit'),
 (251,'lol'),
 (252,'loz'),
 (253,'ltz'),
 (254,'lua'),
 (255,'lub'),
 (256,'lug'),
 (257,'lui'),
 (258,'lun'),
 (259,'luo'),
 (260,'lus'),
 (261,'mac'),
 (262,'mad'),
 (263,'mag'),
 (264,'mah'),
 (265,'mai'),
 (266,'mak'),
 (267,'mal'),
 (268,'man'),
 (269,'mao'),
 (270,'map'),
 (271,'mar'),
 (272,'mas'),
 (273,'may'),
 (274,'mdf'),
 (275,'mdr'),
 (276,'men'),
 (277,'mga'),
 (278,'mic'),
 (279,'min'),
 (280,'mis'),
 (281,'mkh'),
 (282,'mlg'),
 (283,'mlt'),
 (284,'mnc'),
 (285,'mni'),
 (286,'mno'),
 (287,'moh'),
 (288,'mol'),
 (289,'mon'),
 (290,'mos'),
 (291,'mul'),
 (292,'mun'),
 (293,'mus'),
 (294,'mwl'),
 (295,'mwr'),
 (296,'myn'),
 (297,'myv'),
 (298,'nah'),
 (299,'nai'),
 (300,'nap'),
 (301,'nau'),
 (302,'nav'),
 (303,'nbl'),
 (304,'nde'),
 (305,'ndo'),
 (306,'nds'),
 (307,'nep'),
 (308,'new'),
 (309,'nia'),
 (310,'nic'),
 (311,'niu'),
 (312,'nno'),
 (313,'nob'),
 (314,'nog'),
 (315,'non'),
 (316,'nor'),
 (483,'nqo'),
 (317,'nso'),
 (318,'nub'),
 (319,'nwc'),
 (320,'nya'),
 (321,'nym'),
 (322,'nyn'),
 (323,'nyo'),
 (324,'nzi'),
 (325,'oci'),
 (326,'oji'),
 (327,'ori'),
 (328,'orm'),
 (329,'osa'),
 (330,'oss'),
 (331,'ota'),
 (332,'oto'),
 (333,'paa'),
 (334,'pag'),
 (335,'pal'),
 (336,'pam'),
 (337,'pan'),
 (338,'pap'),
 (339,'pau'),
 (340,'peo'),
 (341,'per'),
 (342,'phi'),
 (343,'phn'),
 (344,'pli'),
 (345,'pol'),
 (346,'pon'),
 (347,'por'),
 (348,'pra'),
 (349,'pro'),
 (350,'pus'),
 (351,'qaa'),
 (352,'que'),
 (353,'raj'),
 (354,'rap'),
 (355,'rar'),
 (356,'roa'),
 (357,'roh'),
 (358,'rom'),
 (359,'rum'),
 (360,'run'),
 (361,'rup'),
 (362,'rus'),
 (363,'sad'),
 (364,'sag'),
 (365,'sah'),
 (366,'sai'),
 (367,'sal'),
 (368,'sam'),
 (369,'san'),
 (370,'sas'),
 (371,'sat'),
 (372,'scc'),
 (373,'scn'),
 (374,'sco'),
 (375,'scr'),
 (376,'sel'),
 (377,'sem'),
 (378,'sga'),
 (379,'sgn'),
 (380,'shn'),
 (381,'sid'),
 (382,'sin'),
 (383,'sio'),
 (384,'sit'),
 (385,'sla'),
 (386,'slo'),
 (387,'slv'),
 (388,'sma'),
 (389,'sme'),
 (390,'smi'),
 (391,'smj'),
 (392,'smn'),
 (393,'smo'),
 (394,'sms'),
 (395,'sna'),
 (396,'snd'),
 (397,'snk'),
 (398,'sog'),
 (399,'som'),
 (400,'son'),
 (401,'sot'),
 (402,'spa'),
 (403,'srd'),
 (404,'srn'),
 (405,'srr'),
 (406,'ssa'),
 (407,'ssw'),
 (408,'suk'),
 (409,'sun'),
 (410,'sus'),
 (411,'sux'),
 (412,'swa'),
 (413,'swe'),
 (414,'syr'),
 (415,'tah'),
 (416,'tai'),
 (417,'tam'),
 (418,'tat'),
 (419,'tel'),
 (420,'tem'),
 (421,'ter'),
 (422,'tet'),
 (423,'tgk'),
 (424,'tgl'),
 (425,'tha'),
 (426,'tib'),
 (427,'tig'),
 (428,'tir'),
 (429,'tiv'),
 (430,'tkl'),
 (431,'tlh'),
 (432,'tli'),
 (433,'tmh'),
 (434,'tog'),
 (435,'ton'),
 (436,'tpi'),
 (437,'tsi'),
 (438,'tsn'),
 (439,'tso'),
 (440,'tuk'),
 (441,'tum'),
 (442,'tup'),
 (443,'tur'),
 (444,'tut'),
 (445,'tvl'),
 (446,'twi'),
 (447,'tyv'),
 (448,'udm'),
 (449,'uga'),
 (450,'uig'),
 (451,'ukr'),
 (452,'umb'),
 (453,'und'),
 (454,'urd'),
 (455,'uzb'),
 (456,'vai'),
 (457,'ven'),
 (458,'vie'),
 (459,'vol'),
 (460,'vot'),
 (461,'wak'),
 (462,'wal'),
 (463,'war'),
 (464,'was'),
 (465,'wel'),
 (466,'wen'),
 (467,'wln'),
 (468,'wol'),
 (469,'xal'),
 (470,'xho'),
 (471,'yao'),
 (472,'yap'),
 (473,'yid'),
 (474,'yor'),
 (475,'ypk'),
 (476,'zap'),
 (477,'zen'),
 (478,'zha'),
 (479,'znd'),
 (480,'zul'),
 (481,'zun'),
 (482,'zxx'),
 (484,'zza');
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
INSERT INTO `isolanguagesdes` (`idDes`,`langId`,`label`) VALUES 
 (1,'cn','Afar'),
 (1,'en','Afar'),
 (1,'es','Afar'),
 (1,'fr','Afar'),
 (2,'cn','Abkhazian'),
 (2,'en','Abkhazian'),
 (2,'es','Abkhazian'),
 (2,'fr','Abkhaze'),
 (3,'cn','Achinese'),
 (3,'en','Achinese'),
 (3,'es','Achinese'),
 (3,'fr','Aceh'),
 (4,'cn','Acoli'),
 (4,'en','Acoli'),
 (4,'es','Acoli'),
 (4,'fr','Acoli'),
 (5,'cn','Adangme'),
 (5,'en','Adangme'),
 (5,'es','Adangme'),
 (5,'fr','Adangme'),
 (6,'cn','Adyghe; Adygei'),
 (6,'en','Adyghe; Adygei'),
 (6,'es','Adyghe; Adygei'),
 (6,'fr','Adyghé'),
 (7,'cn','Afro-Asiatic (Other)'),
 (7,'en','Afro-Asiatic (Other)'),
 (7,'es','Afro-Asiatic (Other)'),
 (7,'fr','Afro-asiatiques, autres langues'),
 (8,'cn','Afrihili'),
 (8,'en','Afrihili'),
 (8,'es','Afrihili'),
 (8,'fr','Afrihili'),
 (9,'cn','Afrikaans'),
 (9,'en','Afrikaans'),
 (9,'es','Afrikaans'),
 (9,'fr','Afrikaans'),
 (10,'cn','Ainu'),
 (10,'en','Ainu'),
 (10,'es','Ainu'),
 (10,'fr','Aïnou'),
 (11,'cn','Akan'),
 (11,'en','Akan'),
 (11,'es','Akan'),
 (11,'fr','Akan'),
 (12,'cn','Akkadian'),
 (12,'en','Akkadian'),
 (12,'es','Akkadian'),
 (12,'fr','Akkadien'),
 (13,'cn','Albanian'),
 (13,'en','Albanian'),
 (13,'es','Albanian'),
 (13,'fr','Albanais'),
 (14,'cn','Aleut'),
 (14,'en','Aleut'),
 (14,'es','Aleut'),
 (14,'fr','Aléoute'),
 (15,'cn','Algonquian languages'),
 (15,'en','Algonquian languages'),
 (15,'es','Algonquian languages'),
 (15,'fr','Algonquines, langues'),
 (16,'cn','Southern Altai'),
 (16,'en','Southern Altai'),
 (16,'es','Southern Altai'),
 (16,'fr','Altai du Sud'),
 (17,'cn','Amharic'),
 (17,'en','Amharic'),
 (17,'es','Amharic'),
 (17,'fr','Amharique'),
 (18,'cn','English, Old (ca.450-1100)'),
 (18,'en','English, Old (ca.450-1100)'),
 (18,'es','English, Old (ca.450-1100)'),
 (18,'fr','Anglo-saxon (ca.450-1100)'),
 (19,'cn','Angika'),
 (19,'en','Angika'),
 (19,'es','Angika'),
 (19,'fr','Angika'),
 (20,'cn','Apache languages'),
 (20,'en','Apache languages'),
 (20,'es','Apache languages'),
 (20,'fr','Apache'),
 (21,'cn','Arabic'),
 (21,'en','Arabic'),
 (21,'es','Arabic'),
 (21,'fr','Arabe'),
 (22,'cn','Aramaic'),
 (22,'en','Aramaic'),
 (22,'es','Aramaic'),
 (22,'fr','Araméen'),
 (23,'cn','Aragonese'),
 (23,'en','Aragonese'),
 (23,'es','Aragonese'),
 (23,'fr','Aragonais'),
 (24,'cn','Armenian'),
 (24,'en','Armenian'),
 (24,'es','Armenian'),
 (24,'fr','Arménien'),
 (25,'cn','Mapudungun; Mapuche'),
 (25,'en','Mapudungun; Mapuche'),
 (25,'es','Mapudungun; Mapuche'),
 (25,'fr','Mapudungun; mapuche; mapuce'),
 (26,'cn','Arapaho'),
 (26,'en','Arapaho'),
 (26,'es','Arapaho'),
 (26,'fr','Arapaho'),
 (27,'cn','Artificial (Other)'),
 (27,'en','Artificial (Other)'),
 (27,'es','Artificial (Other)'),
 (27,'fr','Artificielles, autres langues'),
 (28,'cn','Arawak'),
 (28,'en','Arawak'),
 (28,'es','Arawak'),
 (28,'fr','Arawak'),
 (29,'cn','Assamese'),
 (29,'en','Assamese'),
 (29,'es','Assamese'),
 (29,'fr','Assamais'),
 (30,'cn','Asturian; Bable'),
 (30,'en','Asturian; Bable'),
 (30,'es','Asturian; Bable'),
 (30,'fr','Asturien; bable'),
 (31,'cn','Athapascan languages'),
 (31,'en','Athapascan languages'),
 (31,'es','Athapascan languages'),
 (31,'fr','Athapascanes, langues'),
 (32,'cn','Australian languages'),
 (32,'en','Australian languages'),
 (32,'es','Australian languages'),
 (32,'fr','Australiennes, langues'),
 (33,'cn','Avaric'),
 (33,'en','Avaric'),
 (33,'es','Avaric'),
 (33,'fr','Avar'),
 (34,'cn','Avestan'),
 (34,'en','Avestan'),
 (34,'es','Avestan'),
 (34,'fr','Avestique'),
 (35,'cn','Awadhi'),
 (35,'en','Awadhi'),
 (35,'es','Awadhi'),
 (35,'fr','Awadhi'),
 (36,'cn','Aymara'),
 (36,'en','Aymara'),
 (36,'es','Aymara'),
 (36,'fr','Aymara'),
 (37,'cn','Azerbaijani'),
 (37,'en','Azerbaijani'),
 (37,'es','Azerbaijani'),
 (37,'fr','Azéri'),
 (38,'cn','Banda languages'),
 (38,'en','Banda languages'),
 (38,'es','Banda languages'),
 (38,'fr','Banda, langues'),
 (39,'cn','Bamileke languages'),
 (39,'en','Bamileke languages'),
 (39,'es','Bamileke languages'),
 (39,'fr','Bamilékés, langues'),
 (40,'cn','Bashkir'),
 (40,'en','Bashkir'),
 (40,'es','Bashkir'),
 (40,'fr','Bachkir'),
 (41,'cn','Baluchi'),
 (41,'en','Baluchi'),
 (41,'es','Baluchi'),
 (41,'fr','Baloutchi'),
 (42,'cn','Bambara'),
 (42,'en','Bambara'),
 (42,'es','Bambara'),
 (42,'fr','Bambara'),
 (43,'cn','Balinese'),
 (43,'en','Balinese'),
 (43,'es','Balinese'),
 (43,'fr','Balinais'),
 (44,'cn','Basque'),
 (44,'en','Basque'),
 (44,'es','Basque'),
 (44,'fr','Basque'),
 (45,'cn','Basa'),
 (45,'en','Basa'),
 (45,'es','Basa'),
 (45,'fr','Basa'),
 (46,'cn','Baltic (Other)'),
 (46,'en','Baltic (Other)'),
 (46,'es','Baltic (Other)'),
 (46,'fr','Baltiques, autres langues'),
 (47,'cn','Beja'),
 (47,'en','Beja'),
 (47,'es','Beja'),
 (47,'fr','Bedja'),
 (48,'cn','Belarusian'),
 (48,'en','Belarusian'),
 (48,'es','Belarusian'),
 (48,'fr','Biélorusse'),
 (49,'cn','Bemba'),
 (49,'en','Bemba'),
 (49,'es','Bemba'),
 (49,'fr','Bemba'),
 (50,'cn','Bengali'),
 (50,'en','Bengali'),
 (50,'es','Bengali'),
 (50,'fr','Bengali'),
 (51,'cn','Berber (Other)'),
 (51,'en','Berber (Other)'),
 (51,'es','Berber (Other)'),
 (51,'fr','Berbères, autres langues'),
 (52,'cn','Bhojpuri'),
 (52,'en','Bhojpuri'),
 (52,'es','Bhojpuri'),
 (52,'fr','Bhojpuri'),
 (53,'cn','Bihari'),
 (53,'en','Bihari'),
 (53,'es','Bihari'),
 (53,'fr','Bihari'),
 (54,'cn','Bikol'),
 (54,'en','Bikol'),
 (54,'es','Bikol'),
 (54,'fr','Bikol'),
 (55,'cn','Bini; Edo'),
 (55,'en','Bini; Edo'),
 (55,'es','Bini; Edo'),
 (55,'fr','Bini; edo'),
 (56,'cn','Bislama'),
 (56,'en','Bislama'),
 (56,'es','Bislama'),
 (56,'fr','Bichlamar'),
 (57,'cn','Siksika'),
 (57,'en','Siksika'),
 (57,'es','Siksika'),
 (57,'fr','Blackfoot'),
 (58,'cn','Bantu (Other)'),
 (58,'en','Bantu (Other)'),
 (58,'es','Bantu (Other)'),
 (58,'fr','Bantoues, autres langues'),
 (59,'cn','Bosnian'),
 (59,'en','Bosnian'),
 (59,'es','Bosnian'),
 (59,'fr','Bosniaque'),
 (60,'cn','Braj'),
 (60,'en','Braj'),
 (60,'es','Braj'),
 (60,'fr','Braj'),
 (61,'cn','Breton'),
 (61,'en','Breton'),
 (61,'es','Breton'),
 (61,'fr','Breton'),
 (62,'cn','Batak languages'),
 (62,'en','Batak languages'),
 (62,'es','Batak languages'),
 (62,'fr','Batak, langues'),
 (63,'cn','Buriat'),
 (63,'en','Buriat'),
 (63,'es','Buriat'),
 (63,'fr','Bouriate'),
 (64,'cn','Buginese'),
 (64,'en','Buginese'),
 (64,'es','Buginese'),
 (64,'fr','Bugi'),
 (65,'cn','Bulgarian'),
 (65,'en','Bulgarian'),
 (65,'es','Bulgarian'),
 (65,'fr','Bulgare'),
 (66,'cn','Burmese'),
 (66,'en','Burmese'),
 (66,'es','Burmese'),
 (66,'fr','Birman'),
 (67,'cn','Blin; Bilin'),
 (67,'en','Blin; Bilin'),
 (67,'es','Blin; Bilin'),
 (67,'fr','Blin; bilen'),
 (68,'cn','Caddo'),
 (68,'en','Caddo'),
 (68,'es','Caddo'),
 (68,'fr','Caddo'),
 (69,'cn','Central American Indian (Other)'),
 (69,'en','Central American Indian (Other)'),
 (69,'es','Central American Indian (Other)'),
 (69,'fr','Indiennes d\'Amérique centrale, autres langues'),
 (70,'cn','Galibi Carib'),
 (70,'en','Galibi Carib'),
 (70,'es','Galibi Carib'),
 (70,'fr','Karib; galibi; carib'),
 (71,'cn','Catalan; Valencian'),
 (71,'en','Catalan; Valencian'),
 (71,'es','Catalan; Valencian'),
 (71,'fr','Catalan; valencien'),
 (72,'cn','Caucasian (Other)'),
 (72,'en','Caucasian (Other)'),
 (72,'es','Caucasian (Other)'),
 (72,'fr','Caucasiennes, autres langues'),
 (73,'cn','Cebuano'),
 (73,'en','Cebuano'),
 (73,'es','Cebuano'),
 (73,'fr','Cebuano'),
 (74,'cn','Celtic (Other)'),
 (74,'en','Celtic (Other)'),
 (74,'es','Celtic (Other)'),
 (74,'fr','Celtiques, autres langues'),
 (75,'cn','Chamorro'),
 (75,'en','Chamorro'),
 (75,'es','Chamorro'),
 (75,'fr','Chamorro'),
 (76,'cn','Chibcha'),
 (76,'en','Chibcha'),
 (76,'es','Chibcha'),
 (76,'fr','Chibcha'),
 (77,'cn','Chechen'),
 (77,'en','Chechen'),
 (77,'es','Chechen'),
 (77,'fr','Tchétchène'),
 (78,'cn','Chagatai'),
 (78,'en','Chagatai'),
 (78,'es','Chagatai'),
 (78,'fr','Djaghataï'),
 (79,'cn','Chinese'),
 (79,'en','Chinese'),
 (79,'es','Chinese'),
 (79,'fr','Chinois'),
 (80,'cn','Chuukese'),
 (80,'en','Chuukese'),
 (80,'es','Chuukese'),
 (80,'fr','Chuuk'),
 (81,'cn','Mari'),
 (81,'en','Mari'),
 (81,'es','Mari'),
 (81,'fr','Mari'),
 (82,'cn','Chinook jargon'),
 (82,'en','Chinook jargon'),
 (82,'es','Chinook jargon'),
 (82,'fr','Chinook, jargon'),
 (83,'cn','Choctaw'),
 (83,'en','Choctaw'),
 (83,'es','Choctaw'),
 (83,'fr','Choctaw'),
 (84,'cn','Chipewyan'),
 (84,'en','Chipewyan'),
 (84,'es','Chipewyan'),
 (84,'fr','Chipewyan'),
 (85,'cn','Cherokee'),
 (85,'en','Cherokee'),
 (85,'es','Cherokee'),
 (85,'fr','Cherokee'),
 (86,'cn','Church Slavic; Old Slavonic; Church Slavonic; Old Bulgarian; Old Church Slavonic'),
 (86,'en','Church Slavic; Old Slavonic; Church Slavonic; Old Bulgarian; Old Church Slavonic'),
 (86,'es','Church Slavic; Old Slavonic; Church Slavonic; Old Bulgarian; Old Church Slavonic'),
 (86,'fr','Slavon d\'église; vieux slave; slavon liturgique; vieux bulgare'),
 (87,'cn','Chuvash'),
 (87,'en','Chuvash'),
 (87,'es','Chuvash'),
 (87,'fr','Tchouvache'),
 (88,'cn','Cheyenne'),
 (88,'en','Cheyenne'),
 (88,'es','Cheyenne'),
 (88,'fr','Cheyenne'),
 (89,'cn','Chamic languages'),
 (89,'en','Chamic languages'),
 (89,'es','Chamic languages'),
 (89,'fr','Chames, langues'),
 (90,'cn','Coptic'),
 (90,'en','Coptic'),
 (90,'es','Coptic'),
 (90,'fr','Copte'),
 (91,'cn','Cornish'),
 (91,'en','Cornish'),
 (91,'es','Cornish'),
 (91,'fr','Cornique'),
 (92,'cn','Corsican'),
 (92,'en','Corsican'),
 (92,'es','Corsican'),
 (92,'fr','Corse'),
 (93,'cn','Creoles and pidgins, English based (Other)'),
 (93,'en','Creoles and pidgins, English based (Other)'),
 (93,'es','Creoles and pidgins, English based (Other)'),
 (93,'fr','Créoles et pidgins anglais, autres'),
 (94,'cn','Creoles and pidgins, French-based (Other)'),
 (94,'en','Creoles and pidgins, French-based (Other)'),
 (94,'es','Creoles and pidgins, French-based (Other)'),
 (94,'fr','Créoles et pidgins français, autres'),
 (95,'cn','Creoles and pidgins, Portuguese-based (Other)'),
 (95,'en','Creoles and pidgins, Portuguese-based (Other)'),
 (95,'es','Creoles and pidgins, Portuguese-based (Other)'),
 (95,'fr','Créoles et pidgins portugais, autres'),
 (96,'cn','Cree'),
 (96,'en','Cree'),
 (96,'es','Cree'),
 (96,'fr','Cree'),
 (97,'cn','Crimean Tatar; Crimean Turkish'),
 (97,'en','Crimean Tatar; Crimean Turkish'),
 (97,'es','Crimean Tatar; Crimean Turkish'),
 (97,'fr','Tatar de Crimé'),
 (98,'cn','Creoles and pidgins (Other)'),
 (98,'en','Creoles and pidgins (Other)'),
 (98,'es','Creoles and pidgins (Other)'),
 (98,'fr','Créoles et pidgins divers'),
 (99,'cn','Kashubian'),
 (99,'en','Kashubian'),
 (99,'es','Kashubian'),
 (99,'fr','Kachoube'),
 (100,'cn','Cushitic (Other)'),
 (100,'en','Cushitic (Other)'),
 (100,'es','Cushitic (Other)'),
 (100,'fr','Couchitiques, autres langues'),
 (101,'cn','Czech'),
 (101,'en','Czech'),
 (101,'es','Czech'),
 (101,'fr','Tchèque'),
 (102,'cn','Dakota'),
 (102,'en','Dakota'),
 (102,'es','Dakota'),
 (102,'fr','Dakota'),
 (103,'cn','Danish'),
 (103,'en','Danish'),
 (103,'es','Danish'),
 (103,'fr','Danois'),
 (104,'cn','Dargwa'),
 (104,'en','Dargwa'),
 (104,'es','Dargwa'),
 (104,'fr','Dargwa'),
 (105,'cn','Land Dayak languages'),
 (105,'en','Land Dayak languages'),
 (105,'es','Land Dayak languages'),
 (105,'fr','Dayak, langues'),
 (106,'cn','Delaware'),
 (106,'en','Delaware'),
 (106,'es','Delaware'),
 (106,'fr','Delaware'),
 (107,'cn','Slave (Athapascan)'),
 (107,'en','Slave (Athapascan)'),
 (107,'es','Slave (Athapascan)'),
 (107,'fr','Esclave (athapascan)'),
 (108,'cn','Dogrib'),
 (108,'en','Dogrib'),
 (108,'es','Dogrib'),
 (108,'fr','Dogrib'),
 (109,'cn','Dinka'),
 (109,'en','Dinka'),
 (109,'es','Dinka'),
 (109,'fr','Dinka'),
 (110,'cn','Divehi; Dhivehi; Maldivian'),
 (110,'en','Divehi; Dhivehi; Maldivian'),
 (110,'es','Divehi; Dhivehi; Maldivian'),
 (110,'fr','Maldivien'),
 (111,'cn','Dogri'),
 (111,'en','Dogri'),
 (111,'es','Dogri'),
 (111,'fr','Dogri'),
 (112,'cn','Dravidian (Other)'),
 (112,'en','Dravidian (Other)'),
 (112,'es','Dravidian (Other)'),
 (112,'fr','Dravidiennes, autres langues'),
 (113,'cn','Lower Sorbian'),
 (113,'en','Lower Sorbian'),
 (113,'es','Lower Sorbian'),
 (113,'fr','Bas-sorabe'),
 (114,'cn','Duala'),
 (114,'en','Duala'),
 (114,'es','Duala'),
 (114,'fr','Douala'),
 (115,'cn','Dutch, Middle (ca.1050-1350)'),
 (115,'en','Dutch, Middle (ca.1050-1350)'),
 (115,'es','Dutch, Middle (ca.1050-1350)'),
 (115,'fr','Néerlandais moyen (ca. 1050-1350)'),
 (116,'cn','Dutch; Flemish'),
 (116,'en','Dutch; Flemish'),
 (116,'es','Dutch; Flemish'),
 (116,'fr','Néerlandais; flamand'),
 (117,'cn','Dyula'),
 (117,'en','Dyula'),
 (117,'es','Dyula'),
 (117,'fr','Dioula'),
 (118,'cn','Dzongkha'),
 (118,'en','Dzongkha'),
 (118,'es','Dzongkha'),
 (118,'fr','Dzongkha'),
 (119,'cn','Efik'),
 (119,'en','Efik'),
 (119,'es','Efik'),
 (119,'fr','Efik'),
 (120,'cn','Egyptian (Ancient)'),
 (120,'en','Egyptian (Ancient)'),
 (120,'es','Egyptian (Ancient)'),
 (120,'fr','Égyptien'),
 (121,'cn','Ekajuk'),
 (121,'en','Ekajuk'),
 (121,'es','Ekajuk'),
 (121,'fr','Ekajuk'),
 (122,'cn','Elamite'),
 (122,'en','Elamite'),
 (122,'es','Elamite'),
 (122,'fr','Élamite'),
 (123,'cn','English'),
 (123,'en','English'),
 (123,'es','English'),
 (123,'fr','Anglais'),
 (124,'cn','English, Middle (1100-1500)'),
 (124,'en','English, Middle (1100-1500)'),
 (124,'es','English, Middle (1100-1500)'),
 (124,'fr','Anglais moyen (1100-1500)'),
 (125,'cn','Esperanto'),
 (125,'en','Esperanto'),
 (125,'es','Esperanto'),
 (125,'fr','Espéranto'),
 (126,'cn','Estonian'),
 (126,'en','Estonian'),
 (126,'es','Estonian'),
 (126,'fr','Estonien'),
 (127,'cn','Ewe'),
 (127,'en','Ewe'),
 (127,'es','Ewe'),
 (127,'fr','Éwé'),
 (128,'cn','Ewondo'),
 (128,'en','Ewondo'),
 (128,'es','Ewondo'),
 (128,'fr','Éwondo'),
 (129,'cn','Fang'),
 (129,'en','Fang'),
 (129,'es','Fang'),
 (129,'fr','Fang'),
 (130,'cn','Faroese'),
 (130,'en','Faroese'),
 (130,'es','Faroese'),
 (130,'fr','Féroïen'),
 (131,'cn','Fanti'),
 (131,'en','Fanti'),
 (131,'es','Fanti'),
 (131,'fr','Fanti'),
 (132,'cn','Fijian'),
 (132,'en','Fijian'),
 (132,'es','Fijian'),
 (132,'fr','Fidjien'),
 (133,'cn','Filipino; Pilipino'),
 (133,'en','Filipino; Pilipino'),
 (133,'es','Filipino; Pilipino'),
 (133,'fr','Filipino; pilipino'),
 (134,'cn','Finnish'),
 (134,'en','Finnish'),
 (134,'es','Finnish'),
 (134,'fr','Finnois'),
 (135,'cn','Finno-Ugrian (Other)'),
 (135,'en','Finno-Ugrian (Other)'),
 (135,'es','Finno-Ugrian (Other)'),
 (135,'fr','Finno-ougriennes, autres langues'),
 (136,'cn','Fon'),
 (136,'en','Fon'),
 (136,'es','Fon'),
 (136,'fr','Fon'),
 (137,'cn','French'),
 (137,'en','French'),
 (137,'es','French'),
 (137,'fr','Français'),
 (138,'cn','French, Middle (ca.1400-1600)'),
 (138,'en','French, Middle (ca.1400-1600)'),
 (138,'es','French, Middle (ca.1400-1600)'),
 (138,'fr','Français moyen (1400-1600)'),
 (139,'cn','French, Old (842-ca.1400)'),
 (139,'en','French, Old (842-ca.1400)'),
 (139,'es','French, Old (842-ca.1400)'),
 (139,'fr','Français ancien (842-ca.1400)'),
 (140,'cn','Northern Frisian'),
 (140,'en','Northern Frisian'),
 (140,'es','Northern Frisian'),
 (140,'fr','Frison septentrional'),
 (141,'cn','Eastern Frisian'),
 (141,'en','Eastern Frisian'),
 (141,'es','Eastern Frisian'),
 (141,'fr','Frison oriental'),
 (142,'cn','Western Frisian'),
 (142,'en','Western Frisian'),
 (142,'es','Western Frisian'),
 (142,'fr','Frison occidental'),
 (143,'cn','Fulah'),
 (143,'en','Fulah'),
 (143,'es','Fulah'),
 (143,'fr','Peul'),
 (144,'cn','Friulian'),
 (144,'en','Friulian'),
 (144,'es','Friulian'),
 (144,'fr','Frioulan'),
 (145,'cn','Ga'),
 (145,'en','Ga'),
 (145,'es','Ga'),
 (145,'fr','Ga'),
 (146,'cn','Gayo'),
 (146,'en','Gayo'),
 (146,'es','Gayo'),
 (146,'fr','Gayo'),
 (147,'cn','Gbaya'),
 (147,'en','Gbaya'),
 (147,'es','Gbaya'),
 (147,'fr','Gbaya'),
 (148,'cn','Germanic (Other)'),
 (148,'en','Germanic (Other)'),
 (148,'es','Germanic (Other)'),
 (148,'fr','Germaniques, autres langues'),
 (149,'cn','Georgian'),
 (149,'en','Georgian'),
 (149,'es','Georgian'),
 (149,'fr','Géorgien'),
 (150,'cn','German'),
 (150,'en','German'),
 (150,'es','German'),
 (150,'fr','Allemand'),
 (151,'cn','Geez'),
 (151,'en','Geez'),
 (151,'es','Geez'),
 (151,'fr','Guèze'),
 (152,'cn','Gilbertese'),
 (152,'en','Gilbertese'),
 (152,'es','Gilbertese'),
 (152,'fr','Kiribati'),
 (153,'cn','Gaelic; Scottish Gaelic'),
 (153,'en','Gaelic; Scottish Gaelic'),
 (153,'es','Gaelic; Scottish Gaelic'),
 (153,'fr','Gaélique; gaélique écossais'),
 (154,'cn','Irish'),
 (154,'en','Irish'),
 (154,'es','Irish'),
 (154,'fr','Irlandais'),
 (155,'cn','Galician'),
 (155,'en','Galician'),
 (155,'es','Galician'),
 (155,'fr','Galicien'),
 (156,'cn','Manx'),
 (156,'en','Manx'),
 (156,'es','Manx'),
 (156,'fr','Manx; mannois'),
 (157,'cn','German, Middle High (ca.1050-1500)'),
 (157,'en','German, Middle High (ca.1050-1500)'),
 (157,'es','German, Middle High (ca.1050-1500)'),
 (157,'fr','Allemand, moyen haut (ca. 1050-1500)'),
 (158,'cn','German, Old High (ca.750-1050)'),
 (158,'en','German, Old High (ca.750-1050)'),
 (158,'es','German, Old High (ca.750-1050)'),
 (158,'fr','Allemand, vieux haut (ca. 750-1050)'),
 (159,'cn','Gondi'),
 (159,'en','Gondi'),
 (159,'es','Gondi'),
 (159,'fr','Gond'),
 (160,'cn','Gorontalo'),
 (160,'en','Gorontalo'),
 (160,'es','Gorontalo'),
 (160,'fr','Gorontalo'),
 (161,'cn','Gothic'),
 (161,'en','Gothic'),
 (161,'es','Gothic'),
 (161,'fr','Gothique'),
 (162,'cn','Grebo'),
 (162,'en','Grebo'),
 (162,'es','Grebo'),
 (162,'fr','Grebo'),
 (163,'cn','Greek, Ancient (to 1453)'),
 (163,'en','Greek, Ancient (to 1453)'),
 (163,'es','Greek, Ancient (to 1453)'),
 (163,'fr','Grec ancien (jusqu\'à 1453)'),
 (164,'cn','Greek, Modern (1453-)'),
 (164,'en','Greek, Modern (1453-)'),
 (164,'es','Greek, Modern (1453-)'),
 (164,'fr','Grec moderne (après 1453)'),
 (165,'cn','Guarani'),
 (165,'en','Guarani'),
 (165,'es','Guarani'),
 (165,'fr','Guarani'),
 (166,'cn','Swiss German; Alemannic'),
 (166,'en','Swiss German; Alemannic'),
 (166,'es','Swiss German; Alemannic'),
 (166,'fr','Alémanique'),
 (167,'cn','Gujarati'),
 (167,'en','Gujarati'),
 (167,'es','Gujarati'),
 (167,'fr','Goudjrati'),
 (168,'cn','Gwich\'in'),
 (168,'en','Gwich\'in'),
 (168,'es','Gwich\'in'),
 (168,'fr','Gwich\'in'),
 (169,'cn','Haida'),
 (169,'en','Haida'),
 (169,'es','Haida'),
 (169,'fr','Haida'),
 (170,'cn','Haitian; Haitian Creole'),
 (170,'en','Haitian; Haitian Creole'),
 (170,'es','Haitian; Haitian Creole'),
 (170,'fr','Haïtien; créole haïtien'),
 (171,'cn','Hausa'),
 (171,'en','Hausa'),
 (171,'es','Hausa'),
 (171,'fr','Haoussa'),
 (172,'cn','Hawaiian'),
 (172,'en','Hawaiian'),
 (172,'es','Hawaiian'),
 (172,'fr','Hawaïen'),
 (173,'cn','Hebrew'),
 (173,'en','Hebrew'),
 (173,'es','Hebrew'),
 (173,'fr','Hébreu'),
 (174,'cn','Herero'),
 (174,'en','Herero'),
 (174,'es','Herero'),
 (174,'fr','Herero'),
 (175,'cn','Hiligaynon'),
 (175,'en','Hiligaynon'),
 (175,'es','Hiligaynon'),
 (175,'fr','Hiligaynon'),
 (176,'cn','Himachali'),
 (176,'en','Himachali'),
 (176,'es','Himachali'),
 (176,'fr','Himachali'),
 (177,'cn','Hindi'),
 (177,'en','Hindi'),
 (177,'es','Hindi'),
 (177,'fr','Hindi'),
 (178,'cn','Hittite'),
 (178,'en','Hittite'),
 (178,'es','Hittite'),
 (178,'fr','Hittite'),
 (179,'cn','Hmong'),
 (179,'en','Hmong'),
 (179,'es','Hmong'),
 (179,'fr','Hmong'),
 (180,'cn','Hiri Motu'),
 (180,'en','Hiri Motu'),
 (180,'es','Hiri Motu'),
 (180,'fr','Hiri motu'),
 (181,'cn','Upper Sorbian'),
 (181,'en','Upper Sorbian'),
 (181,'es','Upper Sorbian'),
 (181,'fr','Haut-sorabe'),
 (182,'cn','Hungarian'),
 (182,'en','Hungarian'),
 (182,'es','Hungarian'),
 (182,'fr','Hongrois'),
 (183,'cn','Hupa'),
 (183,'en','Hupa'),
 (183,'es','Hupa'),
 (183,'fr','Hupa'),
 (184,'cn','Iban'),
 (184,'en','Iban'),
 (184,'es','Iban'),
 (184,'fr','Iban'),
 (185,'cn','Igbo'),
 (185,'en','Igbo'),
 (185,'es','Igbo'),
 (185,'fr','Igbo'),
 (186,'cn','Icelandic'),
 (186,'en','Icelandic'),
 (186,'es','Icelandic'),
 (186,'fr','Islandais'),
 (187,'cn','Ido'),
 (187,'en','Ido'),
 (187,'es','Ido'),
 (187,'fr','Ido'),
 (188,'cn','Sichuan Yi'),
 (188,'en','Sichuan Yi'),
 (188,'es','Sichuan Yi'),
 (188,'fr','Yi de Sichuan'),
 (189,'cn','Ijo languages'),
 (189,'en','Ijo languages'),
 (189,'es','Ijo languages'),
 (189,'fr','Ijo, langues'),
 (190,'cn','Inuktitut'),
 (190,'en','Inuktitut'),
 (190,'es','Inuktitut'),
 (190,'fr','Inuktitut'),
 (191,'cn','Interlingue'),
 (191,'en','Interlingue'),
 (191,'es','Interlingue'),
 (191,'fr','Interlingue'),
 (192,'cn','Iloko'),
 (192,'en','Iloko'),
 (192,'es','Iloko'),
 (192,'fr','Ilocano'),
 (193,'cn','Interlingua (International Auxiliary Language Association)'),
 (193,'en','Interlingua (International Auxiliary Language Association)'),
 (193,'es','Interlingua (International Auxiliary Language Association)'),
 (193,'fr','Interlingua (langue auxiliaire internationale)'),
 (194,'cn','Indic (Other)'),
 (194,'en','Indic (Other)'),
 (194,'es','Indic (Other)'),
 (194,'fr','Indo-aryennes, autres langues'),
 (195,'cn','Indonesian'),
 (195,'en','Indonesian'),
 (195,'es','Indonesian'),
 (195,'fr','Indonésien'),
 (196,'cn','Indo-European (Other)'),
 (196,'en','Indo-European (Other)'),
 (196,'es','Indo-European (Other)'),
 (196,'fr','Indo-européennes, autres langues'),
 (197,'cn','Ingush'),
 (197,'en','Ingush'),
 (197,'es','Ingush'),
 (197,'fr','Ingouche'),
 (198,'cn','Inupiaq'),
 (198,'en','Inupiaq'),
 (198,'es','Inupiaq'),
 (198,'fr','Inupiaq'),
 (199,'cn','Iranian (Other)'),
 (199,'en','Iranian (Other)'),
 (199,'es','Iranian (Other)'),
 (199,'fr','Iraniennes, autres langues'),
 (200,'cn','Iroquoian languages'),
 (200,'en','Iroquoian languages'),
 (200,'es','Iroquoian languages'),
 (200,'fr','Iroquoises, langues (famille)'),
 (201,'cn','Italian'),
 (201,'en','Italian'),
 (201,'es','Italian'),
 (201,'fr','Italien'),
 (202,'cn','Javanese'),
 (202,'en','Javanese'),
 (202,'es','Javanese'),
 (202,'fr','Javanais'),
 (203,'cn','Lojban'),
 (203,'en','Lojban'),
 (203,'es','Lojban'),
 (203,'fr','Lojban'),
 (204,'cn','Japanese'),
 (204,'en','Japanese'),
 (204,'es','Japanese'),
 (204,'fr','Japonais'),
 (205,'cn','Judeo-Persian'),
 (205,'en','Judeo-Persian'),
 (205,'es','Judeo-Persian'),
 (205,'fr','Judéo-persan'),
 (206,'cn','Judeo-Arabic'),
 (206,'en','Judeo-Arabic'),
 (206,'es','Judeo-Arabic'),
 (206,'fr','Judéo-arabe'),
 (207,'cn','Kara-Kalpak'),
 (207,'en','Kara-Kalpak'),
 (207,'es','Kara-Kalpak'),
 (207,'fr','Karakalpak'),
 (208,'cn','Kabyle'),
 (208,'en','Kabyle'),
 (208,'es','Kabyle'),
 (208,'fr','Kabyle'),
 (209,'cn','Kachin; Jingpho'),
 (209,'en','Kachin; Jingpho'),
 (209,'es','Kachin; Jingpho'),
 (209,'fr','Kachin; jingpho'),
 (210,'cn','Kalaallisut; Greenlandic'),
 (210,'en','Kalaallisut; Greenlandic'),
 (210,'es','Kalaallisut; Greenlandic'),
 (210,'fr','Groenlandais'),
 (211,'cn','Kamba'),
 (211,'en','Kamba'),
 (211,'es','Kamba'),
 (211,'fr','Kamba'),
 (212,'cn','Kannada'),
 (212,'en','Kannada'),
 (212,'es','Kannada'),
 (212,'fr','Kannada'),
 (213,'cn','Karen languages'),
 (213,'en','Karen languages'),
 (213,'es','Karen languages'),
 (213,'fr','Karen, langues'),
 (214,'cn','Kashmiri'),
 (214,'en','Kashmiri'),
 (214,'es','Kashmiri'),
 (214,'fr','Kashmiri'),
 (215,'cn','Kanuri'),
 (215,'en','Kanuri'),
 (215,'es','Kanuri'),
 (215,'fr','Kanouri'),
 (216,'cn','Kawi'),
 (216,'en','Kawi'),
 (216,'es','Kawi'),
 (216,'fr','Kawi'),
 (217,'cn','Kazakh'),
 (217,'en','Kazakh'),
 (217,'es','Kazakh'),
 (217,'fr','Kazakh'),
 (218,'cn','Kabardian'),
 (218,'en','Kabardian'),
 (218,'es','Kabardian'),
 (218,'fr','Kabardien'),
 (219,'cn','Khasi'),
 (219,'en','Khasi'),
 (219,'es','Khasi'),
 (219,'fr','Khasi'),
 (220,'cn','Khoisan (Other)'),
 (220,'en','Khoisan (Other)'),
 (220,'es','Khoisan (Other)'),
 (220,'fr','Khoisan, autres langues'),
 (221,'cn','Central Khmer'),
 (221,'en','Central Khmer'),
 (221,'es','Central Khmer'),
 (221,'fr','Khmer central'),
 (222,'cn','Khotanese'),
 (222,'en','Khotanese'),
 (222,'es','Khotanese'),
 (222,'fr','Khotanais'),
 (223,'cn','Kikuyu; Gikuyu'),
 (223,'en','Kikuyu; Gikuyu'),
 (223,'es','Kikuyu; Gikuyu'),
 (223,'fr','Kikuyu'),
 (224,'cn','Kinyarwanda'),
 (224,'en','Kinyarwanda'),
 (224,'es','Kinyarwanda'),
 (224,'fr','Rwanda'),
 (225,'cn','Kirghiz; Kyrgyz'),
 (225,'en','Kirghiz; Kyrgyz'),
 (225,'es','Kirghiz; Kyrgyz'),
 (225,'fr','Kirghiz'),
 (226,'cn','Kimbundu'),
 (226,'en','Kimbundu'),
 (226,'es','Kimbundu'),
 (226,'fr','Kimbundu'),
 (227,'cn','Konkani'),
 (227,'en','Konkani'),
 (227,'es','Konkani'),
 (227,'fr','Konkani'),
 (228,'cn','Komi'),
 (228,'en','Komi'),
 (228,'es','Komi'),
 (228,'fr','Kom'),
 (229,'cn','Kongo'),
 (229,'en','Kongo'),
 (229,'es','Kongo'),
 (229,'fr','Kongo'),
 (230,'cn','Korean'),
 (230,'en','Korean'),
 (230,'es','Korean'),
 (230,'fr','Coréen'),
 (231,'cn','Kosraean'),
 (231,'en','Kosraean'),
 (231,'es','Kosraean'),
 (231,'fr','Kosrae'),
 (232,'cn','Kpelle'),
 (232,'en','Kpelle'),
 (232,'es','Kpelle'),
 (232,'fr','Kpellé'),
 (233,'cn','Karachay-Balkar'),
 (233,'en','Karachay-Balkar'),
 (233,'es','Karachay-Balkar'),
 (233,'fr','Karatchai balkar'),
 (234,'cn','Karelian'),
 (234,'en','Karelian'),
 (234,'es','Karelian'),
 (234,'fr','Carélien'),
 (235,'cn','Kru languages'),
 (235,'en','Kru languages'),
 (235,'es','Kru languages'),
 (235,'fr','Krou, langues'),
 (236,'cn','Kurukh'),
 (236,'en','Kurukh'),
 (236,'es','Kurukh'),
 (236,'fr','Kurukh'),
 (237,'cn','Kuanyama; Kwanyama'),
 (237,'en','Kuanyama; Kwanyama'),
 (237,'es','Kuanyama; Kwanyama'),
 (237,'fr','Kuanyama; kwanyama'),
 (238,'cn','Kumyk'),
 (238,'en','Kumyk'),
 (238,'es','Kumyk'),
 (238,'fr','Koumyk'),
 (239,'cn','Kurdish'),
 (239,'en','Kurdish'),
 (239,'es','Kurdish'),
 (239,'fr','Kurde'),
 (240,'cn','Kutenai'),
 (240,'en','Kutenai'),
 (240,'es','Kutenai'),
 (240,'fr','Kutenai'),
 (241,'cn','Ladino'),
 (241,'en','Ladino'),
 (241,'es','Ladino'),
 (241,'fr','Judéo-espagnol'),
 (242,'cn','Lahnda'),
 (242,'en','Lahnda'),
 (242,'es','Lahnda'),
 (242,'fr','Lahnda'),
 (243,'cn','Lamba'),
 (243,'en','Lamba'),
 (243,'es','Lamba'),
 (243,'fr','Lamba'),
 (244,'cn','Lao'),
 (244,'en','Lao'),
 (244,'es','Lao'),
 (244,'fr','Lao'),
 (245,'cn','Latin'),
 (245,'en','Latin'),
 (245,'es','Latin'),
 (245,'fr','Latin'),
 (246,'cn','Latvian'),
 (246,'en','Latvian'),
 (246,'es','Latvian'),
 (246,'fr','Letton'),
 (247,'cn','Lezghian'),
 (247,'en','Lezghian'),
 (247,'es','Lezghian'),
 (247,'fr','Lezghien'),
 (248,'cn','Limburgan; Limburger; Limburgish'),
 (248,'en','Limburgan; Limburger; Limburgish'),
 (248,'es','Limburgan; Limburger; Limburgish'),
 (248,'fr','Limbourgeois'),
 (249,'cn','Lingala'),
 (249,'en','Lingala'),
 (249,'es','Lingala'),
 (249,'fr','Lingala'),
 (250,'cn','Lithuanian'),
 (250,'en','Lithuanian'),
 (250,'es','Lithuanian'),
 (250,'fr','Lituanien'),
 (251,'cn','Mongo'),
 (251,'en','Mongo'),
 (251,'es','Mongo'),
 (251,'fr','Mongo'),
 (252,'cn','Lozi'),
 (252,'en','Lozi'),
 (252,'es','Lozi'),
 (252,'fr','Lozi'),
 (253,'cn','Luxembourgish; Letzeburgesch'),
 (253,'en','Luxembourgish; Letzeburgesch'),
 (253,'es','Luxembourgish; Letzeburgesch'),
 (253,'fr','Luxembourgeois'),
 (254,'cn','Luba-Lulua'),
 (254,'en','Luba-Lulua'),
 (254,'es','Luba-Lulua'),
 (254,'fr','Luba-lulua'),
 (255,'cn','Luba-Katanga'),
 (255,'en','Luba-Katanga'),
 (255,'es','Luba-Katanga'),
 (255,'fr','Luba-katanga'),
 (256,'cn','Ganda'),
 (256,'en','Ganda'),
 (256,'es','Ganda'),
 (256,'fr','Ganda'),
 (257,'cn','Luiseno'),
 (257,'en','Luiseno'),
 (257,'es','Luiseno'),
 (257,'fr','Luiseno'),
 (258,'cn','Lunda'),
 (258,'en','Lunda'),
 (258,'es','Lunda'),
 (258,'fr','Lunda'),
 (259,'cn','Luo (Kenya and Tanzania)'),
 (259,'en','Luo (Kenya and Tanzania)'),
 (259,'es','Luo (Kenya and Tanzania)'),
 (259,'fr','Luo (Kenya et Tanzanie)'),
 (260,'cn','Lushai'),
 (260,'en','Lushai'),
 (260,'es','Lushai'),
 (260,'fr','Lushai'),
 (261,'cn','Macedonian'),
 (261,'en','Macedonian'),
 (261,'es','Macedonian'),
 (261,'fr','Macédonien'),
 (262,'cn','Madurese'),
 (262,'en','Madurese'),
 (262,'es','Madurese'),
 (262,'fr','Madourais'),
 (263,'cn','Magahi'),
 (263,'en','Magahi'),
 (263,'es','Magahi'),
 (263,'fr','Magahi'),
 (264,'cn','Marshallese'),
 (264,'en','Marshallese'),
 (264,'es','Marshallese'),
 (264,'fr','Marshall'),
 (265,'cn','Maithili'),
 (265,'en','Maithili'),
 (265,'es','Maithili'),
 (265,'fr','Maithili'),
 (266,'cn','Makasar'),
 (266,'en','Makasar'),
 (266,'es','Makasar'),
 (266,'fr','Makassar'),
 (267,'cn','Malayalam'),
 (267,'en','Malayalam'),
 (267,'es','Malayalam'),
 (267,'fr','Malayalam'),
 (268,'cn','Mandingo'),
 (268,'en','Mandingo'),
 (268,'es','Mandingo'),
 (268,'fr','Mandingue'),
 (269,'cn','Maori'),
 (269,'en','Maori'),
 (269,'es','Maori'),
 (269,'fr','Maori'),
 (270,'cn','Austronesian (Other)'),
 (270,'en','Austronesian (Other)'),
 (270,'es','Austronesian (Other)'),
 (270,'fr','Malayo-polynésiennes, autres langues'),
 (271,'cn','Marathi'),
 (271,'en','Marathi'),
 (271,'es','Marathi'),
 (271,'fr','Marathe'),
 (272,'cn','Masai'),
 (272,'en','Masai'),
 (272,'es','Masai'),
 (272,'fr','Massaï'),
 (273,'cn','Malay'),
 (273,'en','Malay'),
 (273,'es','Malay'),
 (273,'fr','Malais'),
 (274,'cn','Moksha'),
 (274,'en','Moksha'),
 (274,'es','Moksha'),
 (274,'fr','Moksa'),
 (275,'cn','Mandar'),
 (275,'en','Mandar'),
 (275,'es','Mandar'),
 (275,'fr','Mandar'),
 (276,'cn','Mende'),
 (276,'en','Mende'),
 (276,'es','Mende'),
 (276,'fr','Mendé'),
 (277,'cn','Irish, Middle (900-1200)'),
 (277,'en','Irish, Middle (900-1200)'),
 (277,'es','Irish, Middle (900-1200)'),
 (277,'fr','Irlandais moyen (900-1200)'),
 (278,'cn','Mi\'kmaq; Micmac'),
 (278,'en','Mi\'kmaq; Micmac'),
 (278,'es','Mi\'kmaq; Micmac'),
 (278,'fr','Mi\'kmaq; micmac'),
 (279,'cn','Minangkabau'),
 (279,'en','Minangkabau'),
 (279,'es','Minangkabau'),
 (279,'fr','Minangkabau'),
 (280,'cn','Miscellaneous languages'),
 (280,'en','Miscellaneous languages'),
 (280,'es','Miscellaneous languages'),
 (280,'fr','Diverses, langues'),
 (281,'cn','Mon-Khmer (Other)'),
 (281,'en','Mon-Khmer (Other)'),
 (281,'es','Mon-Khmer (Other)'),
 (281,'fr','Môn-khmer, autres langues'),
 (282,'cn','Malagasy'),
 (282,'en','Malagasy'),
 (282,'es','Malagasy'),
 (282,'fr','Malgache'),
 (283,'cn','Maltese'),
 (283,'en','Maltese'),
 (283,'es','Maltese'),
 (283,'fr','Maltais'),
 (284,'cn','Manchu'),
 (284,'en','Manchu'),
 (284,'es','Manchu'),
 (284,'fr','Mandchou'),
 (285,'cn','Manipuri'),
 (285,'en','Manipuri'),
 (285,'es','Manipuri'),
 (285,'fr','Manipuri'),
 (286,'cn','Manobo languages'),
 (286,'en','Manobo languages'),
 (286,'es','Manobo languages'),
 (286,'fr','Manobo, langues'),
 (287,'cn','Mohawk'),
 (287,'en','Mohawk'),
 (287,'es','Mohawk'),
 (287,'fr','Mohawk'),
 (288,'cn','Moldavian'),
 (288,'en','Moldavian'),
 (288,'es','Moldavian'),
 (288,'fr','Moldave'),
 (289,'cn','Mongolian'),
 (289,'en','Mongolian'),
 (289,'es','Mongolian'),
 (289,'fr','Mongol'),
 (290,'cn','Mossi'),
 (290,'en','Mossi'),
 (290,'es','Mossi'),
 (290,'fr','Moré'),
 (291,'cn','Multiple languages'),
 (291,'en','Multiple languages'),
 (291,'es','Multiple languages'),
 (291,'fr','Multilingue'),
 (292,'cn','Munda languages'),
 (292,'en','Munda languages'),
 (292,'es','Munda languages'),
 (292,'fr','Mounda, langues'),
 (293,'cn','Creek'),
 (293,'en','Creek'),
 (293,'es','Creek'),
 (293,'fr','Muskogee'),
 (294,'cn','Mirandese'),
 (294,'en','Mirandese'),
 (294,'es','Mirandese'),
 (294,'fr','Mirandais'),
 (295,'cn','Marwari'),
 (295,'en','Marwari'),
 (295,'es','Marwari'),
 (295,'fr','Marvari'),
 (296,'cn','Mayan languages'),
 (296,'en','Mayan languages'),
 (296,'es','Mayan languages'),
 (296,'fr','Maya, langues'),
 (297,'cn','Erzya'),
 (297,'en','Erzya'),
 (297,'es','Erzya'),
 (297,'fr','Erza'),
 (298,'cn','Nahuatl languages'),
 (298,'en','Nahuatl languages'),
 (298,'es','Nahuatl languages'),
 (298,'fr','Nahuatl, langues'),
 (299,'cn','North American Indian'),
 (299,'en','North American Indian'),
 (299,'es','North American Indian'),
 (299,'fr','Indiennes d\'Amérique du Nord, autres langues'),
 (300,'cn','Neapolitan'),
 (300,'en','Neapolitan'),
 (300,'es','Neapolitan'),
 (300,'fr','Napolitain'),
 (301,'cn','Nauru'),
 (301,'en','Nauru'),
 (301,'es','Nauru'),
 (301,'fr','Nauruan'),
 (302,'cn','Navajo; Navaho'),
 (302,'en','Navajo; Navaho'),
 (302,'es','Navajo; Navaho'),
 (302,'fr','Navaho'),
 (303,'cn','Ndebele, South; South Ndebele'),
 (303,'en','Ndebele, South; South Ndebele'),
 (303,'es','Ndebele, South; South Ndebele'),
 (303,'fr','Ndébélé du Sud'),
 (304,'cn','Ndebele, North; North Ndebele'),
 (304,'en','Ndebele, North; North Ndebele'),
 (304,'es','Ndebele, North; North Ndebele'),
 (304,'fr','Ndébélé du Nord'),
 (305,'cn','Ndonga'),
 (305,'en','Ndonga'),
 (305,'es','Ndonga'),
 (305,'fr','Ndonga'),
 (306,'cn','Low German; Low Saxon; German, Low; Saxon, Low'),
 (306,'en','Low German; Low Saxon; German, Low; Saxon, Low'),
 (306,'es','Low German; Low Saxon; German, Low; Saxon, Low'),
 (306,'fr','Bas allemand; bas saxon; allemand, bas; saxon, bas'),
 (307,'cn','Nepali'),
 (307,'en','Nepali'),
 (307,'es','Nepali'),
 (307,'fr','Népalais'),
 (308,'cn','Nepal Bhasa; Newari'),
 (308,'en','Nepal Bhasa; Newari'),
 (308,'es','Nepal Bhasa; Newari'),
 (308,'fr','Nepal bhasa; newari'),
 (309,'cn','Nias'),
 (309,'en','Nias'),
 (309,'es','Nias'),
 (309,'fr','Nias'),
 (310,'cn','Niger-Kordofanian (Other)'),
 (310,'en','Niger-Kordofanian (Other)'),
 (310,'es','Niger-Kordofanian (Other)'),
 (310,'fr','Nigéro-congolaises, autres langues'),
 (311,'cn','Niuean'),
 (311,'en','Niuean'),
 (311,'es','Niuean'),
 (311,'fr','Niué'),
 (312,'cn','Norwegian Nynorsk; Nynorsk, Norwegian'),
 (312,'en','Norwegian Nynorsk; Nynorsk, Norwegian'),
 (312,'es','Norwegian Nynorsk; Nynorsk, Norwegian'),
 (312,'fr','Norvégien nynorsk; nynorsk, norvégien'),
 (313,'cn','Bokmål, Norwegian; Norwegian Bokmål'),
 (313,'en','Bokmål, Norwegian; Norwegian Bokmål'),
 (313,'es','Bokmål, Norwegian; Norwegian Bokmål'),
 (313,'fr','Norvégien bokmål'),
 (314,'cn','Nogai'),
 (314,'en','Nogai'),
 (314,'es','Nogai'),
 (314,'fr','Nogaï; nogay'),
 (315,'cn','Norse, Old'),
 (315,'en','Norse, Old'),
 (315,'es','Norse, Old'),
 (315,'fr','Norrois, vieux'),
 (316,'cn','Norwegian'),
 (316,'en','Norwegian'),
 (316,'es','Norwegian'),
 (316,'fr','Norvégien'),
 (317,'cn','Pedi; Sepedi; Northern Sotho'),
 (317,'en','Pedi; Sepedi; Northern Sotho'),
 (317,'es','Pedi; Sepedi; Northern Sotho'),
 (317,'fr','Pedi; sepedi; sotho du Nord'),
 (318,'cn','Nubian languages'),
 (318,'en','Nubian languages'),
 (318,'es','Nubian languages'),
 (318,'fr','Nubiennes, langues'),
 (319,'cn','Classical Newari; Old Newari; Classical Nepal Bhasa'),
 (319,'en','Classical Newari; Old Newari; Classical Nepal Bhasa'),
 (319,'es','Classical Newari; Old Newari; Classical Nepal Bhasa'),
 (319,'fr','Newari classique'),
 (320,'cn','Chichewa; Chewa; Nyanja'),
 (320,'en','Chichewa; Chewa; Nyanja'),
 (320,'es','Chichewa; Chewa; Nyanja'),
 (320,'fr','Chichewa; chewa; nyanja'),
 (321,'cn','Nyamwezi'),
 (321,'en','Nyamwezi'),
 (321,'es','Nyamwezi'),
 (321,'fr','Nyamwezi'),
 (322,'cn','Nyankole'),
 (322,'en','Nyankole'),
 (322,'es','Nyankole'),
 (322,'fr','Nyankolé'),
 (323,'cn','Nyoro'),
 (323,'en','Nyoro'),
 (323,'es','Nyoro'),
 (323,'fr','Nyoro'),
 (324,'cn','Nzima'),
 (324,'en','Nzima'),
 (324,'es','Nzima'),
 (324,'fr','Nzema'),
 (325,'cn','Occitan (post 1500); Provençal'),
 (325,'en','Occitan (post 1500); Provençal'),
 (325,'es','Occitan (post 1500); Provençal'),
 (325,'fr','Occitan (après 1500); provençal'),
 (326,'cn','Ojibwa'),
 (326,'en','Ojibwa'),
 (326,'es','Ojibwa'),
 (326,'fr','Ojibwa'),
 (327,'cn','Oriya'),
 (327,'en','Oriya'),
 (327,'es','Oriya'),
 (327,'fr','Oriya'),
 (328,'cn','Oromo'),
 (328,'en','Oromo'),
 (328,'es','Oromo'),
 (328,'fr','Galla'),
 (329,'cn','Osage'),
 (329,'en','Osage'),
 (329,'es','Osage'),
 (329,'fr','Osage'),
 (330,'cn','Ossetian; Ossetic'),
 (330,'en','Ossetian; Ossetic'),
 (330,'es','Ossetian; Ossetic'),
 (330,'fr','Ossète'),
 (331,'cn','Turkish, Ottoman (1500-1928)'),
 (331,'en','Turkish, Ottoman (1500-1928)'),
 (331,'es','Turkish, Ottoman (1500-1928)'),
 (331,'fr','Turc ottoman (1500-1928)'),
 (332,'cn','Otomian languages'),
 (332,'en','Otomian languages'),
 (332,'es','Otomian languages'),
 (332,'fr','Otomangue, langues'),
 (333,'cn','Papuan (Other)'),
 (333,'en','Papuan (Other)'),
 (333,'es','Papuan (Other)'),
 (333,'fr','Papoues, autres langues'),
 (334,'cn','Pangasinan'),
 (334,'en','Pangasinan'),
 (334,'es','Pangasinan'),
 (334,'fr','Pangasinan'),
 (335,'cn','Pahlavi'),
 (335,'en','Pahlavi'),
 (335,'es','Pahlavi'),
 (335,'fr','Pahlavi'),
 (336,'cn','Pampanga'),
 (336,'en','Pampanga'),
 (336,'es','Pampanga'),
 (336,'fr','Pampangan'),
 (337,'cn','Panjabi; Punjabi'),
 (337,'en','Panjabi; Punjabi'),
 (337,'es','Panjabi; Punjabi'),
 (337,'fr','Pendjabi'),
 (338,'cn','Papiamento'),
 (338,'en','Papiamento'),
 (338,'es','Papiamento'),
 (338,'fr','Papiamento'),
 (339,'cn','Palauan'),
 (339,'en','Palauan'),
 (339,'es','Palauan'),
 (339,'fr','Palau'),
 (340,'cn','Persian, Old (ca.600-400 B.C.)'),
 (340,'en','Persian, Old (ca.600-400 B.C.)'),
 (340,'es','Persian, Old (ca.600-400 B.C.)'),
 (340,'fr','Perse, vieux (ca. 600-400 av. J.-C.)'),
 (341,'cn','Persian'),
 (341,'en','Persian'),
 (341,'es','Persian'),
 (341,'fr','Persan'),
 (342,'cn','Philippine (Other)'),
 (342,'en','Philippine (Other)'),
 (342,'es','Philippine (Other)'),
 (342,'fr','Philippines, autres langues'),
 (343,'cn','Phoenician'),
 (343,'en','Phoenician'),
 (343,'es','Phoenician'),
 (343,'fr','Phénicien'),
 (344,'cn','Pali'),
 (344,'en','Pali'),
 (344,'es','Pali'),
 (344,'fr','Pali'),
 (345,'cn','Polish'),
 (345,'en','Polish'),
 (345,'es','Polish'),
 (345,'fr','Polonais'),
 (346,'cn','Pohnpeian'),
 (346,'en','Pohnpeian'),
 (346,'es','Pohnpeian'),
 (346,'fr','Pohnpei'),
 (347,'cn','Portuguese'),
 (347,'en','Portuguese'),
 (347,'es','Portuguese'),
 (347,'fr','Portugais'),
 (348,'cn','Prakrit languages'),
 (348,'en','Prakrit languages'),
 (348,'es','Prakrit languages'),
 (348,'fr','Prâkrit'),
 (349,'cn','Provençal, Old (to 1500)'),
 (349,'en','Provençal, Old (to 1500)'),
 (349,'es','Provençal, Old (to 1500)'),
 (349,'fr','Provençal ancien (jusqu\'à 1500)'),
 (350,'cn','Pushto'),
 (350,'en','Pushto'),
 (350,'es','Pushto'),
 (350,'fr','Pachto'),
 (351,'cn','Reserved for local use'),
 (351,'en','Reserved for local use'),
 (351,'es','Reserved for local use'),
 (351,'fr','Réservée à l\'usage local'),
 (352,'cn','Quechua'),
 (352,'en','Quechua'),
 (352,'es','Quechua'),
 (352,'fr','Quechua'),
 (353,'cn','Rajasthani'),
 (353,'en','Rajasthani'),
 (353,'es','Rajasthani'),
 (353,'fr','Rajasthani'),
 (354,'cn','Rapanui'),
 (354,'en','Rapanui'),
 (354,'es','Rapanui'),
 (354,'fr','Rapanui'),
 (355,'cn','Rarotongan; Cook Islands Maori'),
 (355,'en','Rarotongan; Cook Islands Maori'),
 (355,'es','Rarotongan; Cook Islands Maori'),
 (355,'fr','Rarotonga; maori des îles Cook'),
 (356,'cn','Romance (Other)'),
 (356,'en','Romance (Other)'),
 (356,'es','Romance (Other)'),
 (356,'fr','Romanes, autres langues'),
 (357,'cn','Romansh'),
 (357,'en','Romansh'),
 (357,'es','Romansh'),
 (357,'fr','Romanche'),
 (358,'cn','Romany'),
 (358,'en','Romany'),
 (358,'es','Romany'),
 (358,'fr','Tsigane'),
 (359,'cn','Romanian'),
 (359,'en','Romanian'),
 (359,'es','Romanian'),
 (359,'fr','Roumain'),
 (360,'cn','Rundi'),
 (360,'en','Rundi'),
 (360,'es','Rundi'),
 (360,'fr','Rundi'),
 (361,'cn','Aromanian; Arumanian; Macedo-Romanian'),
 (361,'en','Aromanian; Arumanian; Macedo-Romanian'),
 (361,'es','Aromanian; Arumanian; Macedo-Romanian'),
 (361,'fr','Aroumain; macédo-roumain'),
 (362,'cn','Russian'),
 (362,'en','Russian'),
 (362,'es','Russian'),
 (362,'fr','Russe'),
 (363,'cn','Sandawe'),
 (363,'en','Sandawe'),
 (363,'es','Sandawe'),
 (363,'fr','Sandawe'),
 (364,'cn','Sango'),
 (364,'en','Sango'),
 (364,'es','Sango'),
 (364,'fr','Sango'),
 (365,'cn','Yakut'),
 (365,'en','Yakut'),
 (365,'es','Yakut'),
 (365,'fr','Iakoute'),
 (366,'cn','South American Indian (Other)'),
 (366,'en','South American Indian (Other)'),
 (366,'es','South American Indian (Other)'),
 (366,'fr','Indiennes d\'Amérique du Sud, autres langues'),
 (367,'cn','Salishan languages'),
 (367,'en','Salishan languages'),
 (367,'es','Salishan languages'),
 (367,'fr','Salish, langues'),
 (368,'cn','Samaritan Aramaic'),
 (368,'en','Samaritan Aramaic'),
 (368,'es','Samaritan Aramaic'),
 (368,'fr','Samaritain'),
 (369,'cn','Sanskrit'),
 (369,'en','Sanskrit'),
 (369,'es','Sanskrit'),
 (369,'fr','Sanskrit'),
 (370,'cn','Sasak'),
 (370,'en','Sasak'),
 (370,'es','Sasak'),
 (370,'fr','Sasak'),
 (371,'cn','Santali'),
 (371,'en','Santali'),
 (371,'es','Santali'),
 (371,'fr','Santal'),
 (372,'cn','Serbian'),
 (372,'en','Serbian'),
 (372,'es','Serbian'),
 (372,'fr','Serbe'),
 (373,'cn','Sicilian'),
 (373,'en','Sicilian'),
 (373,'es','Sicilian'),
 (373,'fr','Sicilien'),
 (374,'cn','Scots'),
 (374,'en','Scots'),
 (374,'es','Scots'),
 (374,'fr','Écossais'),
 (375,'cn','Croatian'),
 (375,'en','Croatian'),
 (375,'es','Croatian'),
 (375,'fr','Croate'),
 (376,'cn','Selkup'),
 (376,'en','Selkup'),
 (376,'es','Selkup'),
 (376,'fr','Selkoupe'),
 (377,'cn','Semitic (Other)'),
 (377,'en','Semitic (Other)'),
 (377,'es','Semitic (Other)'),
 (377,'fr','Sémitiques, autres langues'),
 (378,'cn','Irish, Old (to 900)'),
 (378,'en','Irish, Old (to 900)'),
 (378,'es','Irish, Old (to 900)'),
 (378,'fr','Irlandais ancien (jusqu\'à 900)'),
 (379,'cn','Sign Languages'),
 (379,'en','Sign Languages'),
 (379,'es','Sign Languages'),
 (379,'fr','Langues des signes'),
 (380,'cn','Shan'),
 (380,'en','Shan'),
 (380,'es','Shan'),
 (380,'fr','Chan'),
 (381,'cn','Sidamo'),
 (381,'en','Sidamo'),
 (381,'es','Sidamo'),
 (381,'fr','Sidamo'),
 (382,'cn','Sinhala; Sinhalese'),
 (382,'en','Sinhala; Sinhalese'),
 (382,'es','Sinhala; Sinhalese'),
 (382,'fr','Singhalais'),
 (383,'cn','Siouan languages'),
 (383,'en','Siouan languages'),
 (383,'es','Siouan languages'),
 (383,'fr','Sioux, langues'),
 (384,'cn','Sino-Tibetan (Other)'),
 (384,'en','Sino-Tibetan (Other)'),
 (384,'es','Sino-Tibetan (Other)'),
 (384,'fr','Sino-tibétaines, autres langues'),
 (385,'cn','Slavic (Other)'),
 (385,'en','Slavic (Other)'),
 (385,'es','Slavic (Other)'),
 (385,'fr','Slaves, autres langues'),
 (386,'cn','Slovak'),
 (386,'en','Slovak'),
 (386,'es','Slovak'),
 (386,'fr','Slovaque'),
 (387,'cn','Slovenian'),
 (387,'en','Slovenian'),
 (387,'es','Slovenian'),
 (387,'fr','Slovène'),
 (388,'cn','Southern Sami'),
 (388,'en','Southern Sami'),
 (388,'es','Southern Sami'),
 (388,'fr','Sami du Sud'),
 (389,'cn','Northern Sami'),
 (389,'en','Northern Sami'),
 (389,'es','Northern Sami'),
 (389,'fr','Sami du Nord'),
 (390,'cn','Sami languages (Other)'),
 (390,'en','Sami languages (Other)'),
 (390,'es','Sami languages (Other)'),
 (390,'fr','Sami, autres langues'),
 (391,'cn','Lule Sami'),
 (391,'en','Lule Sami'),
 (391,'es','Lule Sami'),
 (391,'fr','Sami de Lule'),
 (392,'cn','Inari Sami'),
 (392,'en','Inari Sami'),
 (392,'es','Inari Sami'),
 (392,'fr','Sami d\'Inari'),
 (393,'cn','Samoan'),
 (393,'en','Samoan'),
 (393,'es','Samoan'),
 (393,'fr','Samoan'),
 (394,'cn','Skolt Sami'),
 (394,'en','Skolt Sami'),
 (394,'es','Skolt Sami'),
 (394,'fr','Sami skolt'),
 (395,'cn','Shona'),
 (395,'en','Shona'),
 (395,'es','Shona'),
 (395,'fr','Shona'),
 (396,'cn','Sindhi'),
 (396,'en','Sindhi'),
 (396,'es','Sindhi'),
 (396,'fr','Sindhi'),
 (397,'cn','Soninke'),
 (397,'en','Soninke'),
 (397,'es','Soninke'),
 (397,'fr','Soninké'),
 (398,'cn','Sogdian'),
 (398,'en','Sogdian'),
 (398,'es','Sogdian'),
 (398,'fr','Sogdien'),
 (399,'cn','Somali'),
 (399,'en','Somali'),
 (399,'es','Somali'),
 (399,'fr','Somali'),
 (400,'cn','Songhai languages'),
 (400,'en','Songhai languages'),
 (400,'es','Songhai languages'),
 (400,'fr','Songhai, langues'),
 (401,'cn','Sotho, Southern'),
 (401,'en','Sotho, Southern'),
 (401,'es','Sotho, Southern'),
 (401,'fr','Sotho du Sud'),
 (402,'cn','Spanish; Castilian'),
 (402,'en','Spanish; Castilian'),
 (402,'es','Spanish; Castilian'),
 (402,'fr','Espagnol; castillan'),
 (403,'cn','Sardinian'),
 (403,'en','Sardinian'),
 (403,'es','Sardinian'),
 (403,'fr','Sarde'),
 (404,'cn','Sranan Tongo'),
 (404,'en','Sranan Tongo'),
 (404,'es','Sranan Tongo'),
 (404,'fr','Sranan tongo'),
 (405,'cn','Serer'),
 (405,'en','Serer'),
 (405,'es','Serer'),
 (405,'fr','Sérère'),
 (406,'cn','Nilo-Saharan (Other)'),
 (406,'en','Nilo-Saharan (Other)'),
 (406,'es','Nilo-Saharan (Other)'),
 (406,'fr','Nilo-sahariennes, autres langues'),
 (407,'cn','Swati'),
 (407,'en','Swati'),
 (407,'es','Swati'),
 (407,'fr','Swati'),
 (408,'cn','Sukuma'),
 (408,'en','Sukuma'),
 (408,'es','Sukuma'),
 (408,'fr','Sukuma'),
 (409,'cn','Sundanese'),
 (409,'en','Sundanese'),
 (409,'es','Sundanese'),
 (409,'fr','Soundanais'),
 (410,'cn','Susu'),
 (410,'en','Susu'),
 (410,'es','Susu'),
 (410,'fr','Soussou'),
 (411,'cn','Sumerian'),
 (411,'en','Sumerian'),
 (411,'es','Sumerian'),
 (411,'fr','Sumérien'),
 (412,'cn','Swahili'),
 (412,'en','Swahili'),
 (412,'es','Swahili'),
 (412,'fr','Swahili'),
 (413,'cn','Swedish'),
 (413,'en','Swedish'),
 (413,'es','Swedish'),
 (413,'fr','Suédois'),
 (414,'cn','Syriac'),
 (414,'en','Syriac'),
 (414,'es','Syriac'),
 (414,'fr','Syriaque'),
 (415,'cn','Tahitian'),
 (415,'en','Tahitian'),
 (415,'es','Tahitian'),
 (415,'fr','Tahitien'),
 (416,'cn','Tai (Other)'),
 (416,'en','Tai (Other)'),
 (416,'es','Tai (Other)'),
 (416,'fr','Thaïes, autres langues'),
 (417,'cn','Tamil'),
 (417,'en','Tamil'),
 (417,'es','Tamil'),
 (417,'fr','Tamoul'),
 (418,'cn','Tatar'),
 (418,'en','Tatar'),
 (418,'es','Tatar'),
 (418,'fr','Tatar'),
 (419,'cn','Telugu'),
 (419,'en','Telugu'),
 (419,'es','Telugu'),
 (419,'fr','Télougou'),
 (420,'cn','Timne'),
 (420,'en','Timne'),
 (420,'es','Timne'),
 (420,'fr','Temne'),
 (421,'cn','Tereno'),
 (421,'en','Tereno'),
 (421,'es','Tereno'),
 (421,'fr','Tereno'),
 (422,'cn','Tetum'),
 (422,'en','Tetum'),
 (422,'es','Tetum'),
 (422,'fr','Tetum'),
 (423,'cn','Tajik'),
 (423,'en','Tajik'),
 (423,'es','Tajik'),
 (423,'fr','Tadjik'),
 (424,'cn','Tagalog'),
 (424,'en','Tagalog'),
 (424,'es','Tagalog'),
 (424,'fr','Tagalog'),
 (425,'cn','Thai'),
 (425,'en','Thai'),
 (425,'es','Thai'),
 (425,'fr','Thaï'),
 (426,'cn','Tibetan'),
 (426,'en','Tibetan'),
 (426,'es','Tibetan'),
 (426,'fr','Tibétain'),
 (427,'cn','Tigre'),
 (427,'en','Tigre'),
 (427,'es','Tigre'),
 (427,'fr','Tigré'),
 (428,'cn','Tigrinya'),
 (428,'en','Tigrinya'),
 (428,'es','Tigrinya'),
 (428,'fr','Tigrigna'),
 (429,'cn','Tiv'),
 (429,'en','Tiv'),
 (429,'es','Tiv'),
 (429,'fr','Tiv'),
 (430,'cn','Tokelau'),
 (430,'en','Tokelau'),
 (430,'es','Tokelau'),
 (430,'fr','Tokelau'),
 (431,'cn','Klingon; tlhIngan-Hol'),
 (431,'en','Klingon; tlhIngan-Hol'),
 (431,'es','Klingon; tlhIngan-Hol'),
 (431,'fr','Klingon'),
 (432,'cn','Tlingit'),
 (432,'en','Tlingit'),
 (432,'es','Tlingit'),
 (432,'fr','Tlingit'),
 (433,'cn','Tamashek'),
 (433,'en','Tamashek'),
 (433,'es','Tamashek'),
 (433,'fr','Tamacheq'),
 (434,'cn','Tonga (Nyasa)'),
 (434,'en','Tonga (Nyasa)'),
 (434,'es','Tonga (Nyasa)'),
 (434,'fr','Tonga (Nyasa)'),
 (435,'cn','Tonga (Tonga Islands)'),
 (435,'en','Tonga (Tonga Islands)'),
 (435,'es','Tonga (Tonga Islands)'),
 (435,'fr','Tongan (Îles Tonga)'),
 (436,'cn','Tok Pisin'),
 (436,'en','Tok Pisin'),
 (436,'es','Tok Pisin'),
 (436,'fr','Tok pisin'),
 (437,'cn','Tsimshian'),
 (437,'en','Tsimshian'),
 (437,'es','Tsimshian'),
 (437,'fr','Tsimshian'),
 (438,'cn','Tswana'),
 (438,'en','Tswana'),
 (438,'es','Tswana'),
 (438,'fr','Tswana'),
 (439,'cn','Tsonga'),
 (439,'en','Tsonga'),
 (439,'es','Tsonga'),
 (439,'fr','Tsonga'),
 (440,'cn','Turkmen'),
 (440,'en','Turkmen'),
 (440,'es','Turkmen'),
 (440,'fr','Turkmène'),
 (441,'cn','Tumbuka'),
 (441,'en','Tumbuka'),
 (441,'es','Tumbuka'),
 (441,'fr','Tumbuka'),
 (442,'cn','Tupi languages'),
 (442,'en','Tupi languages'),
 (442,'es','Tupi languages'),
 (442,'fr','Tupi, langues'),
 (443,'cn','Turkish'),
 (443,'en','Turkish'),
 (443,'es','Turkish'),
 (443,'fr','Turc'),
 (444,'cn','Altaic (Other)'),
 (444,'en','Altaic (Other)'),
 (444,'es','Altaic (Other)'),
 (444,'fr','Altaïques, autres langues'),
 (445,'cn','Tuvalu'),
 (445,'en','Tuvalu'),
 (445,'es','Tuvalu'),
 (445,'fr','Tuvalu'),
 (446,'cn','Twi'),
 (446,'en','Twi'),
 (446,'es','Twi'),
 (446,'fr','Twi'),
 (447,'cn','Tuvinian'),
 (447,'en','Tuvinian'),
 (447,'es','Tuvinian'),
 (447,'fr','Touva'),
 (448,'cn','Udmurt'),
 (448,'en','Udmurt'),
 (448,'es','Udmurt'),
 (448,'fr','Oudmourte'),
 (449,'cn','Ugaritic'),
 (449,'en','Ugaritic'),
 (449,'es','Ugaritic'),
 (449,'fr','Ougaritique'),
 (450,'cn','Uighur; Uyghur'),
 (450,'en','Uighur; Uyghur'),
 (450,'es','Uighur; Uyghur'),
 (450,'fr','Ouïgour'),
 (451,'cn','Ukrainian'),
 (451,'en','Ukrainian'),
 (451,'es','Ukrainian'),
 (451,'fr','Ukrainien'),
 (452,'cn','Umbundu'),
 (452,'en','Umbundu'),
 (452,'es','Umbundu'),
 (452,'fr','Umbundu'),
 (453,'cn','Undetermined'),
 (453,'en','Undetermined'),
 (453,'es','Undetermined'),
 (453,'fr','Indéterminée'),
 (454,'cn','Urdu'),
 (454,'en','Urdu'),
 (454,'es','Urdu'),
 (454,'fr','Ourdou'),
 (455,'cn','Uzbek'),
 (455,'en','Uzbek'),
 (455,'es','Uzbek'),
 (455,'fr','Ouszbek'),
 (456,'cn','Vai'),
 (456,'en','Vai'),
 (456,'es','Vai'),
 (456,'fr','Vaï'),
 (457,'cn','Venda'),
 (457,'en','Venda'),
 (457,'es','Venda'),
 (457,'fr','Venda'),
 (458,'cn','Vietnamese'),
 (458,'en','Vietnamese'),
 (458,'es','Vietnamese'),
 (458,'fr','Vietnamien'),
 (459,'cn','Volapük'),
 (459,'en','Volapük'),
 (459,'es','Volapük'),
 (459,'fr','Volapük'),
 (460,'cn','Votic'),
 (460,'en','Votic'),
 (460,'es','Votic'),
 (460,'fr','Vote'),
 (461,'cn','Wakashan languages'),
 (461,'en','Wakashan languages'),
 (461,'es','Wakashan languages'),
 (461,'fr','Wakashennes, langues'),
 (462,'cn','Walamo'),
 (462,'en','Walamo'),
 (462,'es','Walamo'),
 (462,'fr','Walamo'),
 (463,'cn','Waray'),
 (463,'en','Waray'),
 (463,'es','Waray'),
 (463,'fr','Waray'),
 (464,'cn','Washo'),
 (464,'en','Washo'),
 (464,'es','Washo'),
 (464,'fr','Washo'),
 (465,'cn','Welsh'),
 (465,'en','Welsh'),
 (465,'es','Welsh'),
 (465,'fr','Gallois'),
 (466,'cn','Sorbian languages'),
 (466,'en','Sorbian languages'),
 (466,'es','Sorbian languages'),
 (466,'fr','Sorabes, langues'),
 (467,'cn','Walloon'),
 (467,'en','Walloon'),
 (467,'es','Walloon'),
 (467,'fr','Wallon'),
 (468,'cn','Wolof'),
 (468,'en','Wolof'),
 (468,'es','Wolof'),
 (468,'fr','Wolof'),
 (469,'cn','Kalmyk; Oirat'),
 (469,'en','Kalmyk; Oirat'),
 (469,'es','Kalmyk; Oirat'),
 (469,'fr','Kalmouk; oïrat'),
 (470,'cn','Xhosa'),
 (470,'en','Xhosa'),
 (470,'es','Xhosa'),
 (470,'fr','Xhosa'),
 (471,'cn','Yao'),
 (471,'en','Yao'),
 (471,'es','Yao'),
 (471,'fr','Yao'),
 (472,'cn','Yapese'),
 (472,'en','Yapese'),
 (472,'es','Yapese'),
 (472,'fr','Yapois'),
 (473,'cn','Yiddish'),
 (473,'en','Yiddish'),
 (473,'es','Yiddish'),
 (473,'fr','Yiddish'),
 (474,'cn','Yoruba'),
 (474,'en','Yoruba'),
 (474,'es','Yoruba'),
 (474,'fr','Yoruba'),
 (475,'cn','Yupik languages'),
 (475,'en','Yupik languages'),
 (475,'es','Yupik languages'),
 (475,'fr','Yupik, langues'),
 (476,'cn','Zapotec'),
 (476,'en','Zapotec'),
 (476,'es','Zapotec'),
 (476,'fr','Zapotèque'),
 (477,'cn','Zenaga'),
 (477,'en','Zenaga'),
 (477,'es','Zenaga'),
 (477,'fr','Zenaga'),
 (478,'cn','Zhuang; Chuang'),
 (478,'en','Zhuang; Chuang'),
 (478,'es','Zhuang; Chuang'),
 (478,'fr','Zhuang; chuang'),
 (479,'cn','Zande languages'),
 (479,'en','Zande languages'),
 (479,'es','Zande languages'),
 (479,'fr','Zandé, langues'),
 (480,'cn','Zulu'),
 (480,'en','Zulu'),
 (480,'es','Zulu'),
 (480,'fr','Zoulou'),
 (481,'cn','Zuni'),
 (481,'en','Zuni'),
 (481,'es','Zuni'),
 (481,'fr','Zuni'),
 (482,'cn','No linguistic content'),
 (482,'en','No linguistic content'),
 (482,'es','No linguistic content'),
 (482,'fr','Pas de contenu linguistique'),
 (483,'cn','N\'Ko'),
 (483,'en','N\'Ko'),
 (483,'es','N\'Ko'),
 (483,'fr','N\'ko'),
 (484,'cn','Zaza; Dimili; Dimli; Kirdki; Kirmanjki; Zazaki'),
 (484,'en','Zaza; Dimili; Dimli; Kirdki; Kirmanjki; Zazaki'),
 (484,'es','Zaza; Dimili; Dimli; Kirdki; Kirmanjki; Zazaki'),
 (484,'fr','Zaza; dimili; dimli; kirdki; kirmanjki; zazaki');
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
) ENGINE=InnoDB AUTO_INCREMENT=2245 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `malla_datos`
--

/*!40000 ALTER TABLE `malla_datos` DISABLE KEYS */;
INSERT INTO `malla_datos` (`id_malla_datos`,`longitud`,`latitud`,`numero_estacion`,`descripcion`,`id_metadata`) VALUES 
 (2219,-77.8,6.5,1,'Cuenca Pacifica Colombiana',NULL),
 (2220,-77.8,5.5,3,'Cuenca Pacifica Colombiana',NULL),
 (2221,-77.8,4.5,5,'Cuenca Pacifica Colombiana',NULL),
 (2222,-77.8,3.5,7,'Cuenca Pacifica Colombiana',NULL),
 (2223,-78,6,10,'Cuenca Pacifica Colombiana',NULL),
 (2224,-78,5,12,'Cuenca Pacifica Colombiana',NULL),
 (2225,-78,4,14,'Cuenca Pacifica Colombiana',NULL),
 (2226,-78,3,16,'Cuenca Pacifica Colombiana',NULL),
 (2227,-79,6,25,'Cuenca Pacifica Colombiana',NULL),
 (2228,-79,5,27,'Cuenca Pacifica Colombiana',NULL),
 (2229,-79,4,29,'Cuenca Pacifica Colombiana',NULL),
 (2230,-79,3,31,'Cuenca Pacifica Colombiana',NULL),
 (2231,-80,5,43,'Cuenca Pacifica Colombiana',NULL),
 (2232,-80,4,45,'Cuenca Pacifica Colombiana',NULL),
 (2233,-80,3,47,'Cuenca Pacifica Colombiana',NULL),
 (2234,-80,2,49,'Cuenca Pacifica Colombiana',NULL),
 (2235,-81,4,61,'Cuenca Pacifica Colombiana',NULL),
 (2236,-82,5,75,'Cuenca Pacifica Colombiana',NULL),
 (2237,-82,4,77,'Cuenca Pacifica Colombiana',NULL),
 (2238,-82,2.54,79,'Cuenca Pacifica Colombiana',NULL),
 (2239,-82,2,81,'Cuenca Pacifica Colombiana',NULL),
 (2240,-83,4,93,'Cuenca Pacifica Colombiana',NULL),
 (2241,-84,5,107,'Cuenca Pacifica Colombiana',NULL),
 (2242,-84,4,109,'Cuenca Pacifica Colombiana',NULL),
 (2243,-84,3,111,'Cuenca Pacifica Colombiana',NULL),
 (2244,-84,2,113,'Cuenca Pacifica Colombiana',NULL);
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
INSERT INTO `operationallowed` (`groupId`,`metadataId`,`operationId`) VALUES 
 (1,1,0),
 (1,2,0),
 (1,3,0),
 (1,4,0),
 (1,5,0),
 (2,35,0),
 (2,35,1),
 (2,35,3),
 (2,35,5),
 (2,37,0),
 (2,37,1),
 (2,37,3),
 (2,37,5),
 (2,39,0),
 (2,39,1),
 (2,39,3),
 (2,39,5),
 (2,43,0),
 (2,43,1),
 (2,43,3),
 (2,43,5),
 (2,44,0),
 (2,44,1),
 (2,44,3),
 (2,44,5),
 (2,45,0),
 (2,45,1),
 (2,45,3),
 (2,45,5),
 (2,46,0),
 (2,46,1),
 (2,46,3),
 (2,46,5),
 (2,47,0),
 (2,47,1),
 (2,47,3),
 (2,47,5),
 (2,49,0),
 (2,49,1),
 (2,49,3),
 (2,49,5),
 (2,50,0),
 (2,50,1),
 (2,50,3),
 (2,50,5),
 (2,51,0),
 (2,51,1),
 (2,51,3),
 (2,51,5),
 (2,52,0),
 (2,52,1),
 (2,52,3),
 (2,52,5),
 (2,53,0),
 (2,53,1),
 (2,53,3),
 (2,53,5),
 (2,54,0),
 (2,54,1),
 (2,54,3),
 (2,54,5),
 (2,55,0),
 (2,55,1),
 (2,55,3),
 (2,55,5),
 (2,56,0),
 (2,56,1),
 (2,56,3),
 (2,56,5),
 (2,57,0),
 (2,57,1),
 (2,57,3),
 (2,57,5),
 (2,58,0),
 (2,58,1),
 (2,58,3),
 (2,58,5),
 (2,59,0),
 (2,59,1),
 (2,59,3),
 (2,59,5);
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
INSERT INTO `operations` (`id`,`name`,`reserved`) VALUES 
 (0,'view','y'),
 (1,'download','y'),
 (3,'notify','y'),
 (5,'dynamic','y'),
 (6,'featured','y');
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
INSERT INTO `operationsdes` (`idDes`,`langId`,`label`) VALUES 
 (0,'cn','Publish'),
 (0,'en','Publish'),
 (0,'es','Publish'),
 (0,'fr','Publish'),
 (1,'cn','Download'),
 (1,'en','Download'),
 (1,'es','Download'),
 (1,'fr','Télécharger'),
 (3,'cn','Notify'),
 (3,'en','Notify'),
 (3,'es','Notify'),
 (3,'fr','Notifier'),
 (5,'cn','Interactive Map'),
 (5,'en','Interactive Map'),
 (5,'es','Interactive Map'),
 (5,'fr','Interactive Map'),
 (6,'cn','Featured'),
 (6,'en','Featured'),
 (6,'es','Featured'),
 (6,'fr','Epingler');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `or_properties`
--

/*!40000 ALTER TABLE `or_properties` DISABLE KEYS */;
INSERT INTO `or_properties` (`PROPERTY_ID`,`PROPERTY_KEY`,`PROPERTY_VALUE`) VALUES 
 (1,'date.format','yyyyMMdd'),
 (2,'mail.auth.password',''),
 (3,'mail.auth.user',''),
 (4,'mail.smtp.auth','false'),
 (5,'mail.smtp.host','localhost'),
 (6,'role.admin','admin'),
 (8,'temp.directory','C:/openreports-tomcat/temp'),
 (9,'queryreport.maxrows','1000'),
 (10,'report.generation.directory','C:/openreports-tomcat/reports'),
 (12,'base.directory','C:/openreports-tomcat/reports'),
 (13,'xmla.catalog',''),
 (14,'xmla.datasource',''),
 (15,'xmla.uri',''),
 (16,'url.domain','http://172.25.2.51:8080/openreports'),
 (17,'max.days.for.dataadmin','8'),
 (18,'max.days.fot.dataguard','15'),
 (19,'url.webmapping.domain','http://172.25.2.51:8084/WebMappingFaces'),
 (20,'mail.admin','jhelbert@cecoldo.org');
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `or_tags`
--

/*!40000 ALTER TABLE `or_tags` DISABLE KEYS */;
INSERT INTO `or_tags` (`TAG_ID`,`TAGGED_OBJECT_ID`,`TAGGED_OBJECT_CLASS`,`TAG_VALUE`,`TAG_TYPE`) VALUES 
 (1,1,'org.efs.openreports.objects.Report','Datos','UI'),
 (2,1,'org.efs.openreports.objects.Report','de','UI'),
 (3,1,'org.efs.openreports.objects.Report','prueba','UI'),
 (4,2,'org.efs.openreports.objects.ReportUser','Helbert','UI'),
 (6,49,'org.efs.openreports.objects.ReportUser','Jhelbert','UI'),
 (7,50,'org.efs.openreports.objects.ReportUser','uni','UI'),
 (8,51,'org.efs.openreports.objects.ReportUser','Ruby','UI'),
 (11,52,'org.efs.openreports.objects.ReportUser','provider','UI'),
 (12,67,'org.efs.openreports.objects.ReportUser','Ruby','UI'),
 (13,67,'org.efs.openreports.objects.ReportUser','Ortiz','UI'),
 (14,2,'org.efs.openreports.objects.ReportGroup','Oceanografía','UI'),
 (15,2,'org.efs.openreports.objects.ReportGroup','Física','UI'),
 (16,3,'org.efs.openreports.objects.ReportGroup','Oceanografía','UI'),
 (17,3,'org.efs.openreports.objects.ReportGroup','Geológica','UI'),
 (18,4,'org.efs.openreports.objects.ReportGroup','Oceanografía','UI'),
 (19,4,'org.efs.openreports.objects.ReportGroup','Biológica','UI'),
 (20,5,'org.efs.openreports.objects.ReportGroup','Meteorología','UI'),
 (21,5,'org.efs.openreports.objects.ReportGroup','Marina','UI'),
 (22,6,'org.efs.openreports.objects.ReportGroup','Oceanografía','UI'),
 (23,6,'org.efs.openreports.objects.ReportGroup','Química','UI'),
 (39,3,'org.efs.openreports.objects.Report','Consulta','UI'),
 (40,3,'org.efs.openreports.objects.Report','Diccionario','UI'),
 (41,7,'org.efs.openreports.objects.ReportGroup','general','UI');
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
INSERT INTO `qrtz_locks` (`LOCK_NAME`) VALUES 
 ('CALENDAR_ACCESS'),
 ('JOB_ACCESS'),
 ('MISFIRE_ACCESS'),
 ('STATE_ACCESS'),
 ('TRIGGER_ACCESS');
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
  `id` smallint(6) NOT NULL default '0',
  `west` double default NULL,
  `south` double default NULL,
  `east` double default NULL,
  `north` double default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
INSERT INTO `report_group_map` (`GROUP_ID`,`REPORT_ID`,`MAP_ID`) VALUES 
 (7,3,0),
 (7,4,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report_log`
--

/*!40000 ALTER TABLE `report_log` DISABLE KEYS */;
INSERT INTO `report_log` (`LOG_ID`,`START_TIME`,`END_TIME`,`STATUS`,`MESSAGE`,`EXPORT_TYPE`,`REQUEST_ID`,`REPORT_ID`,`USER_ID`,`ALERT_ID`) VALUES 
 (1,'2008-11-11 05:23:30','2008-11-11 05:23:30','success',NULL,NULL,NULL,1,1,NULL),
 (2,'2008-11-11 05:23:59','2008-11-11 05:23:59','success',NULL,NULL,NULL,1,1,NULL),
 (3,'2008-11-11 05:26:29','2008-11-11 05:26:29','success',NULL,NULL,NULL,1,1,NULL),
 (4,'2008-11-11 05:29:20','2008-11-11 05:29:20','success',NULL,NULL,NULL,1,1,NULL),
 (5,'2008-11-11 11:33:52','2008-11-11 11:33:52','success',NULL,NULL,NULL,1,1,NULL),
 (6,'2008-11-11 11:34:32','2008-11-11 11:34:32','success',NULL,NULL,NULL,1,1,NULL),
 (7,'2008-11-11 12:04:28','2008-11-11 12:04:28','success',NULL,NULL,NULL,1,1,NULL),
 (8,'2008-11-14 21:06:17','2008-11-14 21:06:17','success',NULL,NULL,NULL,1,1,NULL),
 (9,'2008-11-18 04:00:35','2008-11-18 04:00:35','success',NULL,NULL,NULL,1,1,NULL),
 (10,'2008-11-18 05:14:10','2008-11-18 05:14:10','success',NULL,NULL,NULL,1,1,NULL),
 (11,'2008-11-18 05:44:58','2008-11-18 05:44:58','success',NULL,NULL,NULL,1,1,NULL),
 (12,'2008-11-18 05:49:30','2008-11-18 05:49:31','success',NULL,NULL,NULL,1,1,NULL),
 (13,'2008-11-18 06:00:04','2008-11-18 06:00:04','success',NULL,NULL,NULL,2,1,NULL),
 (14,'2008-11-18 06:01:47','2008-11-18 06:01:47','success',NULL,NULL,NULL,2,1,NULL),
 (15,'2008-11-18 11:34:14','2008-11-18 11:34:14','success',NULL,NULL,NULL,2,1,NULL),
 (16,'2008-12-08 23:06:47','2008-12-08 23:06:48','success',NULL,NULL,NULL,2,1,NULL),
 (17,'2008-12-09 07:13:21','2008-12-09 07:13:22','success',NULL,NULL,NULL,2,1,NULL),
 (18,'2009-02-13 01:36:05','2009-02-13 01:36:05','success',NULL,NULL,NULL,2,1,NULL),
 (19,'2009-02-15 20:40:04','2009-02-15 20:40:04','success',NULL,NULL,NULL,2,1,NULL),
 (20,'2009-02-15 20:46:55','2009-02-15 20:46:55','success',NULL,NULL,NULL,2,1,NULL),
 (21,'2009-02-15 22:45:40','2009-02-15 22:45:40','success',NULL,NULL,NULL,2,1,NULL),
 (22,'2009-02-16 14:25:18','2009-02-16 14:25:19','success',NULL,NULL,NULL,2,1,NULL),
 (23,'2009-02-16 16:49:55','2009-02-16 16:49:55','success',NULL,NULL,NULL,2,1,NULL),
 (24,'2009-02-18 10:04:51','2009-02-18 10:04:52','success',NULL,NULL,NULL,2,1,NULL),
 (25,'2009-02-18 14:01:03','2009-02-18 14:01:03','success',NULL,NULL,NULL,2,1,NULL),
 (26,'2009-02-18 23:06:33','2009-02-18 23:06:33','success',NULL,NULL,NULL,2,1,NULL),
 (27,'2009-02-18 23:58:52','2009-02-18 23:58:52','success',NULL,NULL,NULL,2,1,NULL),
 (28,'2009-02-19 09:17:23','2009-02-19 09:17:23','success',NULL,NULL,NULL,2,1,NULL),
 (29,'2009-02-19 10:25:44','2009-02-19 10:25:44','success',NULL,NULL,NULL,2,1,NULL),
 (30,'2009-02-19 12:01:17','2009-02-19 12:01:18','success',NULL,NULL,NULL,2,1,NULL),
 (31,'2009-02-20 09:49:22','2009-02-20 09:49:22','success',NULL,NULL,NULL,1,1,NULL),
 (32,'2009-02-20 10:11:05','2009-02-20 10:11:06','success',NULL,NULL,NULL,1,1,NULL),
 (33,'2009-03-01 18:19:09','2009-03-01 18:19:09','failure','Error executing report query: Table \'cenimarc_.bodc_parameters\' doesn\'t exist',NULL,NULL,3,1,NULL),
 (34,'2009-03-01 18:20:56','2009-03-01 18:20:56','success',NULL,NULL,NULL,3,1,NULL),
 (35,'2009-03-01 18:24:25','2009-03-01 18:24:25','failure','Error executing report query: Unknown column \'category\' in \'where clause\'',NULL,NULL,3,1,NULL),
 (36,'2009-03-01 18:25:08','2009-03-01 18:25:08','failure','Error executing report query: Unknown column \'P\' in \'where clause\'',NULL,NULL,3,1,NULL),
 (37,'2009-03-01 18:38:50','2009-03-01 18:38:50','failure','Error executing report query: null',NULL,NULL,3,1,NULL),
 (38,'2009-03-01 18:51:58','2009-03-01 18:51:58','failure','Error executing report query: null',NULL,NULL,3,1,NULL),
 (39,'2009-03-01 18:53:59','2009-03-01 18:53:59','success',NULL,NULL,NULL,3,1,NULL),
 (40,'2009-03-02 09:24:49','2009-03-02 09:24:49','failure','Error executing report query: Error preparing statement for executing the report query : \n\nselect * from bodc_parameter where full_title like \'%?%\'\n\n',NULL,NULL,4,1,NULL),
 (41,'2009-03-02 09:39:33','2009-03-02 09:39:33','success',NULL,NULL,NULL,4,1,NULL),
 (42,'2009-03-02 09:45:16','2009-03-02 09:45:16','success',NULL,NULL,NULL,4,1,NULL),
 (43,'2009-03-02 09:45:35','2009-03-02 09:45:35','success',NULL,NULL,NULL,4,1,NULL),
 (44,'2009-03-02 09:56:38','2009-03-02 09:56:38','failure','Error executing report query: Unknown column \'Atomic\' in \'where clause\'',NULL,NULL,4,1,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report_parameter`
--

/*!40000 ALTER TABLE `report_parameter` DISABLE KEYS */;
INSERT INTO `report_parameter` (`PARAMETER_ID`,`NAME`,`TYPE`,`CLASSNAME`,`DATA`,`DATASOURCE_ID`,`DESCRIPTION`,`REQUIRED`,`MULTI_SELECT`,`DEFAULT_VALUE`) VALUES 
 (1,'Grupo','Query','java.lang.String','select code, full_title from bodc_parameter_group',1,'Grupo de Parámetros',0x01,0x00,''),
 (2,'titulo_parametro','Text','java.lang.String','',NULL,'Título del Parámetro',0x01,0x00,'');
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
INSERT INTO `report_parameter_map` (`REPORT_ID`,`PARAMETER_ID`,`REQUIRED`,`SORT_ORDER`,`STEP`,`MAP_ID`) VALUES 
 (3,1,0x01,0,0,0),
 (4,2,0x01,0,0,0);
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
INSERT INTO `settings` (`id`,`parentId`,`name`,`value`) VALUES 
 (0,NULL,'root',NULL),
 (1,0,'system',NULL),
 (2,0,'harvesting',NULL),
 (10,1,'site',NULL),
 (11,10,'name','dummy'),
 (12,10,'siteId','b6897ecc-0916-4e5d-ac31-620a82fa3192'),
 (13,10,'organization','dummy'),
 (14,1,'platform',NULL),
 (15,14,'version','2.2.0'),
 (16,14,'subVersion','0'),
 (20,1,'server',NULL),
 (21,20,'host','localhost'),
 (22,20,'port','8080'),
 (30,1,'intranet',NULL),
 (31,30,'network','127.0.0.1'),
 (32,30,'netmask','255.0.0.0'),
 (40,1,'z3950',NULL),
 (41,40,'enable','true'),
 (42,40,'port','2100'),
 (50,1,'proxy',NULL),
 (51,50,'use','false'),
 (52,50,'host',NULL),
 (53,50,'port',NULL),
 (54,50,'username',NULL),
 (55,50,'password',NULL),
 (60,1,'feedback',NULL),
 (61,60,'email',NULL),
 (62,60,'mailServer',NULL),
 (63,62,'host',NULL),
 (64,62,'port','25'),
 (70,1,'removedMetadata',NULL),
 (71,70,'dir','WEB-INF/removed'),
 (80,1,'ldap',NULL),
 (81,80,'use','false'),
 (82,80,'host',NULL),
 (83,80,'port',NULL),
 (84,80,'defaultProfile','RegisteredUser'),
 (86,80,'distinguishedNames',NULL),
 (87,80,'userAttribs',NULL),
 (100,86,'base','dc=fao,dc=org'),
 (101,86,'users','ou=people'),
 (110,87,'name','cn'),
 (112,87,'profile','profile');
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
INSERT INTO `user_group_map` (`USER_ID`,`GROUP_ID`,`MAP_ID`) VALUES 
 (84,2,1),
 (86,3,0),
 (84,4,0),
 (85,5,0),
 (87,6,0),
 (1,7,0);
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
INSERT INTO `user_security` (`USER_ID`,`ROLE_NAME`) VALUES 
 (1,'ROOT_ADMIN_ROLE'),
 (1,'LOG_VIEWER_ROLE'),
 (1,'UPLOAD_ROLE'),
 (1,'GROUP_ADMIN_ROLE'),
 (1,'DATASOURCE_ADMIN_ROLE'),
 (1,'CHART_ADMIN_ROLE'),
 (1,'REPORT_ADMIN_ROLE'),
 (1,'ADVANCED_SCHEDULER_ROLE'),
 (1,'PARAMETER_ADMIN_ROLE'),
 (1,'SCHEDULER_ROLE'),
 (70,'DATA_PROVIDER_ROLE'),
 (85,'DATA_GUARD_ROLE'),
 (84,'DATA_GUARD_ROLE'),
 (86,'DATA_GUARD_ROLE'),
 (87,'DATA_GUARD_ROLE'),
 (88,'DATA_PROVIDER_ROLE'),
 (89,'DATA_PROVIDER_ROLE'),
 (85,'DATA_ADMIN_ROLE'),
 (90,'DATA_PROVIDER_ROLE'),
 (92,'DATA_PROVIDER_ROLE'),
 (94,'DATA_PROVIDER_ROLE'),
 (96,'DATA_PROVIDER_ROLE'),
 (99,'DATA_PROVIDER_ROLE'),
 (102,'DATA_PROVIDER_ROLE'),
 (104,'DATA_PROVIDER_ROLE'),
 (105,'DATA_PROVIDER_ROLE'),
 (106,'DATA_PROVIDER_ROLE'),
 (107,'DATA_PROVIDER_ROLE'),
 (109,'DATA_PROVIDER_ROLE'),
 (110,'DATA_PROVIDER_ROLE'),
 (111,'DATA_PROVIDER_ROLE'),
 (113,'DATA_PROVIDER_ROLE'),
 (115,'DATA_PROVIDER_ROLE'),
 (117,'DATA_PROVIDER_ROLE'),
 (119,'DATA_PROVIDER_ROLE'),
 (120,'DATA_PROVIDER_ROLE'),
 (122,'DATA_PROVIDER_ROLE'),
 (124,'DATA_PROVIDER_ROLE'),
 (125,'DATA_PROVIDER_ROLE'),
 (126,'DATA_PROVIDER_ROLE'),
 (127,'DATA_PROVIDER_ROLE');
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
