SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `cecoldo` DEFAULT CHARACTER SET utf8 ;
USE `cecoldo` ;

-- -----------------------------------------------------
-- Table `cecoldo`.`users`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`users` (
  `id` INT(11) NOT NULL DEFAULT '0' ,
  `username` VARCHAR(32) NOT NULL ,
  `password` VARCHAR(40) NOT NULL ,
  `surname` VARCHAR(32) NULL DEFAULT NULL ,
  `name` VARCHAR(32) NULL DEFAULT NULL ,
  `profile` VARCHAR(32) NOT NULL ,
  `address` VARCHAR(128) NULL DEFAULT NULL ,
  `state` VARCHAR(32) NULL DEFAULT NULL ,
  `zip` VARCHAR(16) NULL DEFAULT NULL ,
  `country` VARCHAR(128) NULL DEFAULT NULL ,
  `email` VARCHAR(128) NULL DEFAULT NULL ,
  `organisation` VARCHAR(128) NULL DEFAULT NULL ,
  `kind` VARCHAR(16) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `username` (`username` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`groups`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`groups` (
  `id` INT(11) NOT NULL DEFAULT '0' ,
  `name` VARCHAR(32) NOT NULL ,
  `description` VARCHAR(255) NULL DEFAULT NULL ,
  `email` VARCHAR(32) NULL DEFAULT NULL ,
  `referrer` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  INDEX `referrer` (`referrer` ASC) ,
  INDEX `FKB63DD9D463416F90` (`referrer` ASC) ,
  CONSTRAINT `FKB63DD9D463416F90`
    FOREIGN KEY (`referrer` )
    REFERENCES `cecoldo`.`users` (`id` ),
  CONSTRAINT `groups_ibfk_1`
    FOREIGN KEY (`referrer` )
    REFERENCES `cecoldo`.`users` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`metadata`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`metadata` (
  `id` INT(11) NOT NULL DEFAULT '0' ,
  `uuid` VARCHAR(250) NOT NULL ,
  `schemaId` VARCHAR(32) NOT NULL ,
  `isTemplate` CHAR(1) NOT NULL DEFAULT 'n' ,
  `isHarvested` CHAR(1) NOT NULL DEFAULT 'n' ,
  `createDate` VARCHAR(24) NOT NULL ,
  `changeDate` VARCHAR(24) NOT NULL ,
  `data` LONGTEXT NOT NULL ,
  `source` VARCHAR(250) NOT NULL ,
  `title` VARCHAR(255) NULL DEFAULT NULL ,
  `root` VARCHAR(255) NULL DEFAULT NULL ,
  `harvestUuid` VARCHAR(250) NULL DEFAULT NULL ,
  `owner` INT(11) NOT NULL ,
  `groupOwner` INT(11) NULL DEFAULT NULL ,
  `harvestUri` VARCHAR(255) NULL DEFAULT NULL ,
  `rating` INT(11) NOT NULL DEFAULT '0' ,
  `popularity` INT(11) NOT NULL DEFAULT '0' ,
  `state` VARCHAR(1) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `uuid` (`uuid` ASC, `source` ASC, `harvestUuid` ASC) ,
  INDEX `owner` (`owner` ASC) ,
  INDEX `groupOwner` (`groupOwner` ASC) ,
  INDEX `MetadataNDX1` (`uuid` ASC) ,
  INDEX `MetadataNDX2` (`source` ASC) ,
  INDEX `FKE52D7B2F7172551F` (`groupOwner` ASC) ,
  INDEX `FKE52D7B2F94A6E624` (`owner` ASC) ,
  CONSTRAINT `FKE52D7B2F7172551F`
    FOREIGN KEY (`groupOwner` )
    REFERENCES `cecoldo`.`groups` (`id` ),
  CONSTRAINT `FKE52D7B2F94A6E624`
    FOREIGN KEY (`owner` )
    REFERENCES `cecoldo`.`users` (`id` ),
  CONSTRAINT `metadata_ibfk_1`
    FOREIGN KEY (`owner` )
    REFERENCES `cecoldo`.`users` (`id` ),
  CONSTRAINT `metadata_ibfk_2`
    FOREIGN KEY (`groupOwner` )
    REFERENCES `cecoldo`.`groups` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`archivo_datos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`archivo_datos` (
  `id_archivo` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `nombre_archivo` VARCHAR(255) NULL DEFAULT NULL ,
  `id_usuario` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  `fecha` DATE NULL DEFAULT NULL ,
  `hora` TIME NULL DEFAULT NULL ,
  `id_metadata` INT(11) NULL DEFAULT NULL ,
  `region` VARCHAR(255) NULL DEFAULT NULL ,
  `estado` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_archivo`) ,
  INDEX `FK_archivo_datos_1` (`id_metadata` ASC) ,
  INDEX `FKE8838288E47F6B6` (`id_metadata` ASC) ,
  INDEX `FKE8838288C52ADEF9` (`id_metadata` ASC) ,
  CONSTRAINT `FKE8838288C52ADEF9`
    FOREIGN KEY (`id_metadata` )
    REFERENCES `cecoldo`.`metadata` (`id` ),
  CONSTRAINT `FKE8838288E47F6B6`
    FOREIGN KEY (`id_metadata` )
    REFERENCES `cecoldo`.`metadata` (`id` ),
  CONSTRAINT `FK_archivo_datos_1`
    FOREIGN KEY (`id_metadata` )
    REFERENCES `cecoldo`.`metadata` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`archivo_guardian`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`archivo_guardian` (
  `id_archivo_datos` INT(10) UNSIGNED NOT NULL ,
  `reportuser_id` INT(11) NOT NULL ,
  `estado` VARCHAR(1) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_archivo_datos`, `reportuser_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`bodc_biota_comp_model`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`bodc_biota_comp_model` (
  `CODE` VARCHAR(8) NULL DEFAULT NULL ,
  `PARAM` VARCHAR(50) NULL DEFAULT NULL ,
  `SUB_NAME` VARCHAR(100) NULL DEFAULT NULL ,
  `SUB_ALTNAM` VARCHAR(30) NULL DEFAULT NULL ,
  `TAXON_CODE` DECIMAL(8,0) NULL DEFAULT NULL ,
  `TAXON_NAME` VARCHAR(100) NULL DEFAULT NULL ,
  `TAXON_CLASS` VARCHAR(50) NULL DEFAULT NULL ,
  `PARAM_COMP` VARCHAR(50) NULL DEFAULT NULL ,
  `COMP` VARCHAR(50) NULL DEFAULT NULL ,
  `COMP_CLASS` VARCHAR(50) NULL DEFAULT NULL ,
  `SAMP_PREP` VARCHAR(50) NULL DEFAULT NULL ,
  `ANALYSIS` MEDIUMTEXT NULL DEFAULT NULL ,
  `DATA_PROC` VARCHAR(100) NULL DEFAULT NULL ,
  `CREATED` VARCHAR(40) NULL DEFAULT NULL ,
  `MODIFIED` VARCHAR(40) NULL DEFAULT NULL )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`inv_discipline`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`inv_discipline` (
  `id_discipline` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `discipline` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id_discipline`) )
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`bodc_category`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`bodc_category` (
  `CODE` VARCHAR(4) NOT NULL DEFAULT '' ,
  `TITLE` VARCHAR(200) NULL DEFAULT NULL ,
  `DOCREF` DECIMAL(8,0) NULL DEFAULT NULL ,
  `RECORD_LOCK` VARCHAR(1) NULL DEFAULT NULL ,
  `CREATED` VARCHAR(40) NULL DEFAULT NULL ,
  `MODIFIED` VARCHAR(40) NULL DEFAULT NULL ,
  `DISCIPLINE` INT(10) UNSIGNED NULL DEFAULT NULL ,
  PRIMARY KEY (`CODE`) ,
  INDEX `FK4E53B25150CF1E1A` (`DISCIPLINE` ASC) ,
  CONSTRAINT `FK4E53B25150CF1E1A`
    FOREIGN KEY (`DISCIPLINE` )
    REFERENCES `cecoldo`.`inv_discipline` (`id_discipline` ),
  CONSTRAINT `FK_bodc_category_1`
    FOREIGN KEY (`DISCIPLINE` )
    REFERENCES `cecoldo`.`inv_discipline` (`id_discipline` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`report_group`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`report_group` (
  `GROUP_ID` INT(11) NOT NULL AUTO_INCREMENT ,
  `NAME` VARCHAR(255) NOT NULL ,
  `DESCRIPTION` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`GROUP_ID`) ,
  UNIQUE INDEX `NAME` (`NAME` ASC) ,
  UNIQUE INDEX `NAME_2` (`NAME` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`bodc_category_group`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`bodc_category_group` (
  `category_code` VARCHAR(4) NOT NULL ,
  `group_id` INT(11) NOT NULL ,
  PRIMARY KEY (`category_code`, `group_id`) ,
  INDEX `FK7E1C4B11ACA43B2F` (`group_id` ASC) ,
  INDEX `FK7E1C4B11903D89AF` (`category_code` ASC) ,
  CONSTRAINT `FK7E1C4B11903D89AF`
    FOREIGN KEY (`category_code` )
    REFERENCES `cecoldo`.`bodc_category` (`CODE` ),
  CONSTRAINT `FK7E1C4B11ACA43B2F`
    FOREIGN KEY (`group_id` )
    REFERENCES `cecoldo`.`report_group` (`GROUP_ID` ),
  CONSTRAINT `FK_bodc_category_group_1`
    FOREIGN KEY (`category_code` )
    REFERENCES `cecoldo`.`bodc_category` (`CODE` ),
  CONSTRAINT `FK_bodc_category_group_2`
    FOREIGN KEY (`group_id` )
    REFERENCES `cecoldo`.`report_group` (`GROUP_ID` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`bodc_parameter_group`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`bodc_parameter_group` (
  `CODE` VARCHAR(4) NOT NULL DEFAULT '' ,
  `SHORT_TITLE` VARCHAR(50) NULL DEFAULT NULL ,
  `FULL_TITLE` VARCHAR(200) NULL DEFAULT NULL ,
  `DEFINITION` MEDIUMTEXT NULL DEFAULT NULL ,
  `RECORD_LOCK` VARCHAR(1) NULL DEFAULT NULL ,
  `BODC_LEGAL` VARCHAR(1) NULL DEFAULT NULL ,
  `CREATED` VARCHAR(40) NULL DEFAULT NULL ,
  `MODIFIED` VARCHAR(40) NULL DEFAULT NULL ,
  PRIMARY KEY (`CODE`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`bodc_category_link`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`bodc_category_link` (
  `CATEGORY_CODE` VARCHAR(4) NOT NULL DEFAULT '' ,
  `GROUP_CODE` VARCHAR(4) NOT NULL DEFAULT '' ,
  PRIMARY KEY (`GROUP_CODE`, `CATEGORY_CODE`) ,
  INDEX `FKFBD181289F5AF963` (`GROUP_CODE` ASC) ,
  INDEX `FKFBD18128515E7AEC` (`CATEGORY_CODE` ASC) ,
  INDEX `FKFBD18128DD96A9E6` (`GROUP_CODE` ASC) ,
  INDEX `FKFBD18128903D89AF` (`CATEGORY_CODE` ASC) ,
  CONSTRAINT `FKFBD18128515E7AEC`
    FOREIGN KEY (`CATEGORY_CODE` )
    REFERENCES `cecoldo`.`bodc_category` (`CODE` ),
  CONSTRAINT `FKFBD18128903D89AF`
    FOREIGN KEY (`CATEGORY_CODE` )
    REFERENCES `cecoldo`.`bodc_category` (`CODE` ),
  CONSTRAINT `FKFBD181289F5AF963`
    FOREIGN KEY (`GROUP_CODE` )
    REFERENCES `cecoldo`.`bodc_parameter_group` (`CODE` ),
  CONSTRAINT `FKFBD18128DD96A9E6`
    FOREIGN KEY (`GROUP_CODE` )
    REFERENCES `cecoldo`.`bodc_parameter_group` (`CODE` ),
  CONSTRAINT `FK_bodc_category_link_1`
    FOREIGN KEY (`CATEGORY_CODE` )
    REFERENCES `cecoldo`.`bodc_category` (`CODE` ),
  CONSTRAINT `FK_bodc_category_link_2`
    FOREIGN KEY (`GROUP_CODE` )
    REFERENCES `cecoldo`.`bodc_parameter_group` (`CODE` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`report_datasource`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`report_datasource` (
  `DATASOURCE_ID` INT(11) NOT NULL AUTO_INCREMENT ,
  `NAME` VARCHAR(255) NOT NULL ,
  `DRIVER` VARCHAR(255) NULL DEFAULT NULL ,
  `URL` VARCHAR(255) NOT NULL ,
  `USERNAME` VARCHAR(255) NULL DEFAULT NULL ,
  `PASSWORD` VARCHAR(255) NULL DEFAULT NULL ,
  `MAX_IDLE` INT(11) NULL DEFAULT NULL ,
  `MAX_ACTIVE` INT(11) NULL DEFAULT NULL ,
  `MAX_WAIT` BIGINT(20) NULL DEFAULT NULL ,
  `VALIDATION_QUERY` VARCHAR(255) NULL DEFAULT NULL ,
  `JNDI` BIT(1) NULL DEFAULT NULL ,
  PRIMARY KEY (`DATASOURCE_ID`) ,
  UNIQUE INDEX `NAME` (`NAME` ASC) ,
  UNIQUE INDEX `NAME_2` (`NAME` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`report_chart`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`report_chart` (
  `CHART_ID` INT(11) NOT NULL AUTO_INCREMENT ,
  `NAME` VARCHAR(255) NOT NULL ,
  `DESCRIPTION` VARCHAR(255) NOT NULL ,
  `CHART_QUERY` TEXT NOT NULL ,
  `CHART_TYPE` INT(11) NOT NULL ,
  `WIDTH` INT(11) NOT NULL ,
  `HEIGHT` INT(11) NOT NULL ,
  `X_AXIS_LABEL` VARCHAR(255) NULL DEFAULT NULL ,
  `Y_AXIS_LABEL` VARCHAR(255) NULL DEFAULT NULL ,
  `SHOW_LEGEND` BIT(1) NOT NULL ,
  `SHOW_TITLE` BIT(1) NOT NULL ,
  `SHOW_VALUES` BIT(1) NOT NULL ,
  `PLOT_ORIENTATION` INT(11) NULL DEFAULT NULL ,
  `DATASOURCE_ID` INT(11) NULL DEFAULT NULL ,
  `REPORT_ID` INT(11) NULL DEFAULT NULL ,
  `OVERLAY_CHART_ID` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`CHART_ID`) ,
  UNIQUE INDEX `NAME` (`NAME` ASC) ,
  UNIQUE INDEX `NAME_2` (`NAME` ASC) ,
  INDEX `FKF836D4F3AAEF4A13` (`REPORT_ID` ASC) ,
  INDEX `FKF836D4F34330D5A7` (`DATASOURCE_ID` ASC) ,
  INDEX `FKF836D4F3C83B69FC` (`OVERLAY_CHART_ID` ASC) ,
  INDEX `FK377CD9132B065EE5` (`DATASOURCE_ID` ASC) ,
  INDEX `FK377CD913211D3CF1` (`REPORT_ID` ASC) ,
  INDEX `FK377CD91395C891DE` (`OVERLAY_CHART_ID` ASC) ,
  CONSTRAINT `FK377CD913211D3CF1`
    FOREIGN KEY (`REPORT_ID` )
    REFERENCES `cecoldo`.`report` (`REPORT_ID` ),
  CONSTRAINT `FK377CD9132B065EE5`
    FOREIGN KEY (`DATASOURCE_ID` )
    REFERENCES `cecoldo`.`report_datasource` (`DATASOURCE_ID` ),
  CONSTRAINT `FK377CD91395C891DE`
    FOREIGN KEY (`OVERLAY_CHART_ID` )
    REFERENCES `cecoldo`.`report_chart` (`CHART_ID` ),
  CONSTRAINT `FKF836D4F34330D5A7`
    FOREIGN KEY (`DATASOURCE_ID` )
    REFERENCES `cecoldo`.`report_datasource` (`DATASOURCE_ID` ),
  CONSTRAINT `FKF836D4F3AAEF4A13`
    FOREIGN KEY (`REPORT_ID` )
    REFERENCES `cecoldo`.`report` (`REPORT_ID` ),
  CONSTRAINT `FKF836D4F3C83B69FC`
    FOREIGN KEY (`OVERLAY_CHART_ID` )
    REFERENCES `cecoldo`.`report_chart` (`CHART_ID` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`report_export_options`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`report_export_options` (
  `EXPORT_OPTION_ID` INT(11) NOT NULL AUTO_INCREMENT ,
  `XLS_REMOVE_EMPTY_SPACE` BIT(1) NOT NULL ,
  `XLS_ONE_PAGE_PER_SHEET` BIT(1) NOT NULL ,
  `XLS_AUTO_DETECT_CELL` BIT(1) NOT NULL ,
  `XLS_WHITE_BACKGROUND` BIT(1) NOT NULL ,
  `HTML_REMOVE_EMPTY_SPACE` BIT(1) NOT NULL ,
  `HTML_WHITE_BACKGROUND` BIT(1) NOT NULL ,
  `HTML_USE_IMAGES` BIT(1) NOT NULL ,
  `HTML_WRAP_BREAK` BIT(1) NOT NULL ,
  PRIMARY KEY (`EXPORT_OPTION_ID`) )
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`report`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`report` (
  `REPORT_ID` INT(11) NOT NULL AUTO_INCREMENT ,
  `NAME` VARCHAR(255) NOT NULL ,
  `DESCRIPTION` VARCHAR(255) NOT NULL ,
  `REPORT_FILE` VARCHAR(255) NOT NULL ,
  `PDF_EXPORT` BIT(1) NOT NULL ,
  `CSV_EXPORT` BIT(1) NOT NULL ,
  `XLS_EXPORT` BIT(1) NOT NULL ,
  `HTML_EXPORT` BIT(1) NOT NULL ,
  `RTF_EXPORT` BIT(1) NOT NULL DEFAULT '\0' ,
  `TEXT_EXPORT` BIT(1) NOT NULL ,
  `EXCEL_EXPORT` BIT(1) NOT NULL ,
  `IMAGE_EXPORT` BIT(1) NOT NULL ,
  `FILL_VIRTUAL` BIT(1) NOT NULL ,
  `HIDDEN_REPORT` BIT(1) NOT NULL ,
  `REPORT_QUERY` TEXT NULL DEFAULT NULL ,
  `DATASOURCE_ID` INT(11) NULL DEFAULT NULL ,
  `CHART_ID` INT(11) NULL DEFAULT NULL ,
  `EXPORT_OPTION_ID` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`REPORT_ID`) ,
  UNIQUE INDEX `NAME` (`NAME` ASC) ,
  UNIQUE INDEX `NAME_2` (`NAME` ASC) ,
  INDEX `FK8FDF4934F4DD5A50` (`EXPORT_OPTION_ID` ASC) ,
  INDEX `FK8FDF49344330D5A7` (`DATASOURCE_ID` ASC) ,
  INDEX `FK8FDF4934164AA2ED` (`CHART_ID` ASC) ,
  INDEX `FKC84C55342B065EE5` (`DATASOURCE_ID` ASC) ,
  INDEX `FKC84C553427C17779` (`EXPORT_OPTION_ID` ASC) ,
  INDEX `FKC84C5534E3D7CACF` (`CHART_ID` ASC) ,
  CONSTRAINT `FK8FDF4934164AA2ED`
    FOREIGN KEY (`CHART_ID` )
    REFERENCES `cecoldo`.`report_chart` (`CHART_ID` ),
  CONSTRAINT `FK8FDF49344330D5A7`
    FOREIGN KEY (`DATASOURCE_ID` )
    REFERENCES `cecoldo`.`report_datasource` (`DATASOURCE_ID` ),
  CONSTRAINT `FK8FDF4934F4DD5A50`
    FOREIGN KEY (`EXPORT_OPTION_ID` )
    REFERENCES `cecoldo`.`report_export_options` (`EXPORT_OPTION_ID` ),
  CONSTRAINT `FKC84C553427C17779`
    FOREIGN KEY (`EXPORT_OPTION_ID` )
    REFERENCES `cecoldo`.`report_export_options` (`EXPORT_OPTION_ID` ),
  CONSTRAINT `FKC84C55342B065EE5`
    FOREIGN KEY (`DATASOURCE_ID` )
    REFERENCES `cecoldo`.`report_datasource` (`DATASOURCE_ID` ),
  CONSTRAINT `FKC84C5534E3D7CACF`
    FOREIGN KEY (`CHART_ID` )
    REFERENCES `cecoldo`.`report_chart` (`CHART_ID` ))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`report_user`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`report_user` (
  `REPORTUSER_ID` INT(11) NOT NULL AUTO_INCREMENT ,
  `NAME` VARCHAR(255) NOT NULL ,
  `PASSWORD` VARCHAR(255) NOT NULL ,
  `EXTERNAL_ID` VARCHAR(255) NULL DEFAULT NULL ,
  `EMAIL_ADDRESS` VARCHAR(255) NULL DEFAULT NULL ,
  `PDF_EXPORT_TYPE` INT(11) NOT NULL ,
  `DEFAULT_REPORT_ID` INT(11) NULL DEFAULT NULL ,
  `STATE` VARCHAR(255) NULL DEFAULT NULL ,
  `institution` VARCHAR(255) NULL DEFAULT NULL ,
  `acronim` VARCHAR(255) NULL DEFAULT NULL ,
  `lider` VARCHAR(255) NULL DEFAULT NULL ,
  `cargo_lider` VARCHAR(255) NULL DEFAULT NULL ,
  `country` INT(11) NULL DEFAULT NULL ,
  `depto` INT(11) NULL DEFAULT NULL ,
  `city` INT(11) NULL DEFAULT NULL ,
  `address` VARCHAR(255) NULL DEFAULT NULL ,
  `phone` VARCHAR(255) NULL DEFAULT NULL ,
  `fax` VARCHAR(255) NULL DEFAULT NULL ,
  `web` VARCHAR(255) NULL DEFAULT NULL ,
  `privatePolitics` BIT(1) NULL DEFAULT NULL ,
  `exchangePolitics` BIT(1) NULL DEFAULT NULL ,
  `sha1` VARCHAR(255) NULL DEFAULT NULL ,
  `region` VARCHAR(3) NULL DEFAULT NULL ,
  PRIMARY KEY (`REPORTUSER_ID`) ,
  UNIQUE INDEX `NAME` (`NAME` ASC) ,
  UNIQUE INDEX `NAME_2` (`NAME` ASC) ,
  INDEX `FK7364F3F6EE01FD95` (`DEFAULT_REPORT_ID` ASC) ,
  INDEX `FKF14E6FF6642FF073` (`DEFAULT_REPORT_ID` ASC) ,
  CONSTRAINT `FK7364F3F6EE01FD95`
    FOREIGN KEY (`DEFAULT_REPORT_ID` )
    REFERENCES `cecoldo`.`report` (`REPORT_ID` ),
  CONSTRAINT `FKF14E6FF6642FF073`
    FOREIGN KEY (`DEFAULT_REPORT_ID` )
    REFERENCES `cecoldo`.`report` (`REPORT_ID` ))
ENGINE = InnoDB
AUTO_INCREMENT = 128
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`bodc_category_user`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`bodc_category_user` (
  `category_code` VARCHAR(4) NOT NULL ,
  `report_user` INT(11) NOT NULL ,
  INDEX `FK_bodc_category_user_1` (`category_code` ASC) ,
  INDEX `FK_bodc_category_user_2` (`report_user` ASC) ,
  CONSTRAINT `FK_bodc_category_user_1`
    FOREIGN KEY (`category_code` )
    REFERENCES `cecoldo`.`bodc_category` (`CODE` ),
  CONSTRAINT `FK_bodc_category_user_2`
    FOREIGN KEY (`report_user` )
    REFERENCES `cecoldo`.`report_user` (`REPORTUSER_ID` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`bodc_chem_model`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`bodc_chem_model` (
  `CODE` VARCHAR(8) NULL DEFAULT NULL ,
  `PARAM` VARCHAR(80) NULL DEFAULT NULL ,
  `PARAM_CL` VARCHAR(50) NULL DEFAULT NULL ,
  `SUB_NAME` VARCHAR(100) NULL DEFAULT NULL ,
  `SUB_NAME_CL` VARCHAR(50) NULL DEFAULT NULL ,
  `SUB_ALTNAM` VARCHAR(50) NULL DEFAULT NULL ,
  `PARAM_COMP` VARCHAR(50) NULL DEFAULT NULL ,
  `COMP` VARCHAR(50) NULL DEFAULT NULL ,
  `COMP_CLASS` VARCHAR(50) NULL DEFAULT NULL ,
  `COMP_PHASE` VARCHAR(50) NULL DEFAULT NULL ,
  `COMP_PHASE_CL` VARCHAR(50) NULL DEFAULT NULL ,
  `SAMP_PREP` VARCHAR(100) NULL DEFAULT NULL ,
  `ANALYSIS` VARCHAR(150) NULL DEFAULT NULL ,
  `DATA_PROC` VARCHAR(150) NULL DEFAULT NULL ,
  `CREATED` VARCHAR(40) NULL DEFAULT NULL ,
  `MODIFIED` VARCHAR(40) NULL DEFAULT NULL )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`bodc_datos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`bodc_datos` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `fecha` DATE NULL DEFAULT NULL ,
  `hora` TIME NULL DEFAULT NULL ,
  `latitud` DOUBLE NULL DEFAULT NULL ,
  `longitud` DOUBLE NULL DEFAULT NULL ,
  `profundidad` DOUBLE NULL DEFAULT NULL ,
  `id_archivo` INT(10) UNSIGNED NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `FK7E934B489D30371E` (`id` ASC) ,
  INDEX `FK7E934B481A0373AB` (`id_archivo` ASC) ,
  INDEX `FK7E934B4858E2826E` (`id_archivo` ASC) ,
  CONSTRAINT `FK7E934B481A0373AB`
    FOREIGN KEY (`id_archivo` )
    REFERENCES `cecoldo`.`archivo_datos` (`id_archivo` ),
  CONSTRAINT `FK7E934B4858E2826E`
    FOREIGN KEY (`id_archivo` )
    REFERENCES `cecoldo`.`archivo_datos` (`id_archivo` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`bodc_detalle_datos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`bodc_detalle_datos` (
  `id_detalle` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `id_datos` INT(10) UNSIGNED NOT NULL ,
  `bodc` VARCHAR(8) NULL DEFAULT NULL ,
  `valor` DOUBLE NULL DEFAULT NULL ,
  `qf` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_detalle`) ,
  INDEX `FK9DA9980826D3E12` (`id_datos` ASC) ,
  INDEX `FK9DA9980776F760F` (`id_datos` ASC) ,
  CONSTRAINT `FK9DA9980776F760F`
    FOREIGN KEY (`id_datos` )
    REFERENCES `cecoldo`.`bodc_datos` (`id` ),
  CONSTRAINT `FK9DA9980826D3E12`
    FOREIGN KEY (`id_datos` )
    REFERENCES `cecoldo`.`bodc_datos` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`bodc_itis_map`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`bodc_itis_map` (
  `CODE` VARCHAR(8) NULL DEFAULT NULL ,
  `PARAM` VARCHAR(200) NULL DEFAULT NULL ,
  `TAXON_CODE` DECIMAL(8,0) NULL DEFAULT NULL ,
  `TAXON_NAME` VARCHAR(100) NULL DEFAULT NULL ,
  `TAXON_CLASS` VARCHAR(100) NULL DEFAULT NULL ,
  `PARAM_COMP` VARCHAR(50) NULL DEFAULT NULL ,
  `COMP` VARCHAR(50) NULL DEFAULT NULL ,
  `COMP_CLASS` VARCHAR(50) NULL DEFAULT NULL ,
  `SAMP_PREP` VARCHAR(100) NULL DEFAULT NULL ,
  `ANALYSIS` VARCHAR(100) NULL DEFAULT NULL ,
  `DATA_PROC` VARCHAR(100) NULL DEFAULT NULL ,
  `CREATED` VARCHAR(40) NULL DEFAULT NULL ,
  `MODIFIED` VARCHAR(40) NULL DEFAULT NULL ,
  `BIOENTRF` VARCHAR(8) NULL DEFAULT NULL )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`bodc_units`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`bodc_units` (
  `CODE` VARCHAR(4) NOT NULL DEFAULT '' ,
  `SHORT_TITLE` VARCHAR(32) NULL DEFAULT NULL ,
  `FULL_TITLE` VARCHAR(120) NULL DEFAULT NULL ,
  `COMMENTS` MEDIUMTEXT NULL DEFAULT NULL ,
  `RECORD_LOCK` VARCHAR(1) NULL DEFAULT NULL ,
  `CREATED` VARCHAR(40) NULL DEFAULT NULL ,
  `MODIFIED` VARCHAR(40) NULL DEFAULT NULL ,
  PRIMARY KEY (`CODE`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`bodc_parameter`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`bodc_parameter` (
  `CODE` VARCHAR(8) NOT NULL DEFAULT '' ,
  `GROUP_CODE` VARCHAR(4) NULL DEFAULT NULL ,
  `UNIT_CODE` VARCHAR(4) NULL DEFAULT NULL ,
  `DUMMY_VAL` DOUBLE NULL DEFAULT NULL ,
  `MIN_PERMISS_VAL` DOUBLE NULL DEFAULT NULL ,
  `MAX_PERMISS_VAL` DOUBLE NULL DEFAULT NULL ,
  `BEFORE_DP` DECIMAL(2,0) NULL DEFAULT NULL ,
  `AFTER_DP` DECIMAL(1,0) NULL DEFAULT NULL ,
  `SIG_FIG` DECIMAL(2,0) NULL DEFAULT NULL ,
  `SHORT_TITLE` VARCHAR(50) NULL DEFAULT NULL ,
  `FULL_TITLE` MEDIUMTEXT NULL DEFAULT NULL ,
  `DEFINITION` MEDIUMTEXT NULL DEFAULT NULL ,
  `RECORD_LOCK` VARCHAR(1) NULL DEFAULT NULL ,
  `BODC_LEGAL` VARCHAR(1) NULL DEFAULT NULL ,
  `CREATED` VARCHAR(40) NULL DEFAULT NULL ,
  `MODIFIED` VARCHAR(40) NULL DEFAULT NULL ,
  PRIMARY KEY (`CODE`) ,
  INDEX `FK934C68B69F5AF963` (`GROUP_CODE` ASC) ,
  INDEX `FK934C68B649A68DD7` (`UNIT_CODE` ASC) ,
  INDEX `FK934C68B6DD96A9E6` (`GROUP_CODE` ASC) ,
  INDEX `FK934C68B66F20ADF4` (`UNIT_CODE` ASC) ,
  CONSTRAINT `FK934C68B649A68DD7`
    FOREIGN KEY (`UNIT_CODE` )
    REFERENCES `cecoldo`.`bodc_units` (`CODE` ),
  CONSTRAINT `FK934C68B66F20ADF4`
    FOREIGN KEY (`UNIT_CODE` )
    REFERENCES `cecoldo`.`bodc_units` (`CODE` ),
  CONSTRAINT `FK934C68B69F5AF963`
    FOREIGN KEY (`GROUP_CODE` )
    REFERENCES `cecoldo`.`bodc_parameter_group` (`CODE` ),
  CONSTRAINT `FK934C68B6DD96A9E6`
    FOREIGN KEY (`GROUP_CODE` )
    REFERENCES `cecoldo`.`bodc_parameter_group` (`CODE` ),
  CONSTRAINT `FK_bodc_parameter_1`
    FOREIGN KEY (`GROUP_CODE` )
    REFERENCES `cecoldo`.`bodc_parameter_group` (`CODE` ),
  CONSTRAINT `FK_bodc_parameter_2`
    FOREIGN KEY (`UNIT_CODE` )
    REFERENCES `cecoldo`.`bodc_units` (`CODE` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`paises_0101`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`paises_0101` (
  `pai_id` CHAR(2) NOT NULL DEFAULT '' ,
  `pai_nombre_pais` VARCHAR(20) NULL DEFAULT NULL ,
  PRIMARY KEY (`pai_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`gendepartamento`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`gendepartamento` (
  `Id_Departamento` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  `NombreDepartamento` VARCHAR(30) NOT NULL DEFAULT '' ,
  `id_Pais` CHAR(2) NOT NULL DEFAULT '' ,
  PRIMARY KEY (`Id_Departamento`) ,
  INDEX `id_pais` (`id_Pais` ASC) ,
  INDEX `FK7412435468CBE03E` (`id_Pais` ASC) ,
  INDEX `FK74124354F295C3C1` (`id_Pais` ASC) ,
  CONSTRAINT `FK7412435468CBE03E`
    FOREIGN KEY (`id_Pais` )
    REFERENCES `cecoldo`.`paises_0101` (`pai_id` ),
  CONSTRAINT `FK74124354F295C3C1`
    FOREIGN KEY (`id_Pais` )
    REFERENCES `cecoldo`.`paises_0101` (`pai_id` ),
  CONSTRAINT `gendepartamento_ibfk_1`
    FOREIGN KEY (`id_Pais` )
    REFERENCES `cecoldo`.`paises_0101` (`pai_id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Departamentos de algunos paises' ;


-- -----------------------------------------------------
-- Table `cecoldo`.`gen_municipio`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`gen_municipio` (
  `MUNICIPIO` VARCHAR(255) NULL DEFAULT NULL ,
  `DEPTO` INT(10) UNSIGNED NULL DEFAULT NULL ,
  `DANE` CHAR(5) NOT NULL ,
  PRIMARY KEY (`DANE`) ,
  INDEX `FKB01F3DBEA6C28447` (`DEPTO` ASC) ,
  CONSTRAINT `FKB01F3DBEA6C28447`
    FOREIGN KEY (`DEPTO` )
    REFERENCES `cecoldo`.`gendepartamento` (`Id_Departamento` ),
  CONSTRAINT `FK_gen_municipio_1`
    FOREIGN KEY (`DEPTO` )
    REFERENCES `cecoldo`.`gendepartamento` (`Id_Departamento` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`solicitud_parametros`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`solicitud_parametros` (
  `id_solicitud` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `fecha_solicitud` DATE NOT NULL ,
  `nombre_institucion` VARCHAR(255) NOT NULL ,
  `solicitante` VARCHAR(255) NOT NULL ,
  `cargo_solicitante` VARCHAR(45) NOT NULL ,
  `correo_electronico` VARCHAR(150) NOT NULL ,
  `telefono` VARCHAR(255) NOT NULL ,
  `id_pais` CHAR(2) NULL DEFAULT NULL ,
  `id_departamento` INT(10) UNSIGNED NULL DEFAULT NULL ,
  `id_municipio` CHAR(5) NULL DEFAULT NULL ,
  `observaciones` TEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`id_solicitud`) ,
  INDEX `FKC2EBAD58CA2FEBD` (`id_municipio` ASC) ,
  INDEX `FKC2EBAD5F295C3C1` (`id_pais` ASC) ,
  INDEX `FKC2EBAD5ED4FA625` (`id_departamento` ASC) ,
  CONSTRAINT `FKC2EBAD58CA2FEBD`
    FOREIGN KEY (`id_municipio` )
    REFERENCES `cecoldo`.`gen_municipio` (`DANE` ),
  CONSTRAINT `FKC2EBAD5ED4FA625`
    FOREIGN KEY (`id_departamento` )
    REFERENCES `cecoldo`.`gendepartamento` (`Id_Departamento` ),
  CONSTRAINT `FKC2EBAD5F295C3C1`
    FOREIGN KEY (`id_pais` )
    REFERENCES `cecoldo`.`paises_0101` (`pai_id` ),
  CONSTRAINT `FK_solicitud_parametros_1`
    FOREIGN KEY (`id_municipio` )
    REFERENCES `cecoldo`.`gen_municipio` (`DANE` ),
  CONSTRAINT `FK_solicitud_parametros_2`
    FOREIGN KEY (`id_departamento` )
    REFERENCES `cecoldo`.`gendepartamento` (`Id_Departamento` ),
  CONSTRAINT `FK_solicitud_parametros_3`
    FOREIGN KEY (`id_pais` )
    REFERENCES `cecoldo`.`paises_0101` (`pai_id` ))
ENGINE = InnoDB
AUTO_INCREMENT = 41
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`bodc_required_parameter`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`bodc_required_parameter` (
  `id_parameter` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `group_code` VARCHAR(4) NULL DEFAULT NULL ,
  `group_description` MEDIUMTEXT NULL DEFAULT NULL ,
  `unit_code` VARCHAR(4) NULL DEFAULT NULL ,
  `unit_description` MEDIUMTEXT NULL DEFAULT NULL ,
  `definition` MEDIUMTEXT NOT NULL ,
  `category_code` VARCHAR(4) NULL DEFAULT NULL ,
  `min_permiss_value` DOUBLE NULL DEFAULT NULL ,
  `max_permiss_val` DOUBLE NULL DEFAULT NULL ,
  `id_solicitud` INT(10) UNSIGNED NOT NULL ,
  `full_title` MEDIUMTEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`id_parameter`) ,
  INDEX `FKB3AAC89CA0862A47` (`id_solicitud` ASC) ,
  CONSTRAINT `FKB3AAC89CA0862A47`
    FOREIGN KEY (`id_solicitud` )
    REFERENCES `cecoldo`.`solicitud_parametros` (`id_solicitud` ),
  CONSTRAINT `FK_bodc_required_parameter_1`
    FOREIGN KEY (`id_solicitud` )
    REFERENCES `cecoldo`.`solicitud_parametros` (`id_solicitud` ))
ENGINE = InnoDB
AUTO_INCREMENT = 49
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`bodc_titulo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`bodc_titulo` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `id_archivo` INT(10) UNSIGNED NOT NULL ,
  `parameter_code` VARCHAR(8) NOT NULL ,
  `titulo` VARCHAR(50) NULL DEFAULT NULL ,
  `descripcion` VARCHAR(255) NULL DEFAULT NULL ,
  `definition` VARCHAR(255) NULL DEFAULT NULL ,
  `dummyVal` DOUBLE NULL DEFAULT NULL ,
  `maxPermissVal` DOUBLE NULL DEFAULT NULL ,
  `minPermissVal` DOUBLE NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `FK6F9479CC1A0373AB` (`id_archivo` ASC) ,
  CONSTRAINT `FK6F9479CC1A0373AB`
    FOREIGN KEY (`id_archivo` )
    REFERENCES `cecoldo`.`archivo_datos` (`id_archivo` ),
  CONSTRAINT `FK_bodc_titulo_1`
    FOREIGN KEY (`id_archivo` )
    REFERENCES `cecoldo`.`archivo_datos` (`id_archivo` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`categories`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`categories` (
  `id` INT(11) NOT NULL DEFAULT '0' ,
  `name` VARCHAR(32) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`languages`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`languages` (
  `id` VARCHAR(5) NOT NULL DEFAULT '' ,
  `name` VARCHAR(32) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`categoriesdes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`categoriesdes` (
  `idDes` INT(11) NOT NULL DEFAULT '0' ,
  `langId` VARCHAR(5) NOT NULL DEFAULT '' ,
  `label` VARCHAR(96) NOT NULL ,
  PRIMARY KEY (`idDes`, `langId`) ,
  INDEX `langId` (`langId` ASC) ,
  CONSTRAINT `categoriesdes_ibfk_1`
    FOREIGN KEY (`idDes` )
    REFERENCES `cecoldo`.`categories` (`id` ),
  CONSTRAINT `categoriesdes_ibfk_2`
    FOREIGN KEY (`langId` )
    REFERENCES `cecoldo`.`languages` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`gen_profesion`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`gen_profesion` (
  `id_profesion` INT(10) UNSIGNED NOT NULL ,
  `profesion` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_profesion`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`genmunicipio`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`genmunicipio` (
  `Id_Municipio` CHAR(4) NOT NULL ,
  `Id_Departamento` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  `NombreMunicipio` VARCHAR(40) NOT NULL DEFAULT '' ,
  PRIMARY KEY (`Id_Municipio`) ,
  INDEX `id_departamento` (`Id_Departamento` ASC) ,
  INDEX `FKDD0E429D85D8CFC8` (`Id_Departamento` ASC) ,
  CONSTRAINT `FKDD0E429D85D8CFC8`
    FOREIGN KEY (`Id_Departamento` )
    REFERENCES `cecoldo`.`gendepartamento` (`Id_Departamento` ),
  CONSTRAINT `genmunicipio_ibfk_1`
    FOREIGN KEY (`Id_Departamento` )
    REFERENCES `cecoldo`.`gendepartamento` (`Id_Departamento` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`groupsdes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`groupsdes` (
  `idDes` INT(11) NOT NULL DEFAULT '0' ,
  `langId` VARCHAR(5) NOT NULL DEFAULT '' ,
  `label` VARCHAR(96) NOT NULL ,
  PRIMARY KEY (`idDes`, `langId`) ,
  INDEX `langId` (`langId` ASC) ,
  CONSTRAINT `groupsdes_ibfk_1`
    FOREIGN KEY (`idDes` )
    REFERENCES `cecoldo`.`groups` (`id` ),
  CONSTRAINT `groupsdes_ibfk_2`
    FOREIGN KEY (`langId` )
    REFERENCES `cecoldo`.`languages` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`inv_institutions`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`inv_institutions` (
  `Id_institution` INT(10) UNSIGNED NOT NULL ,
  `institution` VARCHAR(255) NULL DEFAULT NULL ,
  `abbreviation` VARCHAR(20) NULL DEFAULT NULL ,
  `contact` VARCHAR(255) NULL DEFAULT NULL ,
  `contact_job` VARCHAR(255) NULL DEFAULT NULL ,
  `address` VARCHAR(255) NULL DEFAULT NULL ,
  `phone` VARCHAR(20) NULL DEFAULT NULL ,
  `fax` VARCHAR(20) NULL DEFAULT NULL ,
  `cod_city` CHAR(5) NULL DEFAULT NULL ,
  `AA` CHAR(5) NULL DEFAULT NULL ,
  `country` CHAR(2) NULL DEFAULT NULL ,
  `web_page` VARCHAR(255) NULL DEFAULT NULL ,
  `email_1` VARCHAR(255) NULL DEFAULT NULL ,
  `email_2` VARCHAR(255) NULL DEFAULT NULL ,
  `observations` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`Id_institution`) ,
  INDEX `FK300113495159C0C6` (`cod_city` ASC) ,
  INDEX `FK30011349C92B13D8` (`country` ASC) ,
  CONSTRAINT `FK300113495159C0C6`
    FOREIGN KEY (`cod_city` )
    REFERENCES `cecoldo`.`gen_municipio` (`DANE` ),
  CONSTRAINT `FK30011349C92B13D8`
    FOREIGN KEY (`country` )
    REFERENCES `cecoldo`.`paises_0101` (`pai_id` ),
  CONSTRAINT `FK_inv_institutions_1`
    FOREIGN KEY (`country` )
    REFERENCES `cecoldo`.`paises_0101` (`pai_id` ),
  CONSTRAINT `FK_inv_institutions_2`
    FOREIGN KEY (`cod_city` )
    REFERENCES `cecoldo`.`gen_municipio` (`DANE` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`inv_chief_scientist`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`inv_chief_scientist` (
  `Id` CHAR(11) NOT NULL ,
  `initials` VARCHAR(255) NULL DEFAULT NULL ,
  `first_name` VARCHAR(255) NULL DEFAULT NULL ,
  `last_name` VARCHAR(255) NULL DEFAULT NULL ,
  `profession` INT(10) UNSIGNED NULL DEFAULT NULL ,
  `cv_lac` VARCHAR(255) NULL DEFAULT NULL ,
  `job` VARCHAR(255) NULL DEFAULT NULL ,
  `institution` INT(10) UNSIGNED NULL DEFAULT NULL ,
  `active` VARCHAR(255) NULL DEFAULT NULL ,
  `active_until` VARCHAR(255) NULL DEFAULT NULL ,
  `phone` VARCHAR(255) NULL DEFAULT NULL ,
  `fax` VARCHAR(255) NULL DEFAULT NULL ,
  `country` CHAR(2) NULL DEFAULT NULL ,
  `personal_web_page` VARCHAR(255) NULL DEFAULT NULL ,
  `e_mail_1` VARCHAR(255) NULL DEFAULT NULL ,
  `e_mail_2` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`Id`) ,
  INDEX `FK3A057150B4AFB82D` (`institution` ASC) ,
  INDEX `FK3A057150F252BEE4` (`profession` ASC) ,
  INDEX `FK3A057150C92B13D8` (`country` ASC) ,
  CONSTRAINT `FK3A057150B4AFB82D`
    FOREIGN KEY (`institution` )
    REFERENCES `cecoldo`.`inv_institutions` (`Id_institution` ),
  CONSTRAINT `FK3A057150C92B13D8`
    FOREIGN KEY (`country` )
    REFERENCES `cecoldo`.`paises_0101` (`pai_id` ),
  CONSTRAINT `FK3A057150F252BEE4`
    FOREIGN KEY (`profession` )
    REFERENCES `cecoldo`.`gen_profesion` (`id_profesion` ),
  CONSTRAINT `FK_inv_chief_scientist_1`
    FOREIGN KEY (`country` )
    REFERENCES `cecoldo`.`paises_0101` (`pai_id` ),
  CONSTRAINT `FK_inv_chief_scientist_2`
    FOREIGN KEY (`profession` )
    REFERENCES `cecoldo`.`gen_profesion` (`id_profesion` ),
  CONSTRAINT `FK_inv_chief_scientist_3`
    FOREIGN KEY (`institution` )
    REFERENCES `cecoldo`.`inv_institutions` (`Id_institution` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`inv_ship_type`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`inv_ship_type` (
  `Id` CHAR(2) NOT NULL ,
  `ship_type` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`Id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`unlocode_status_indicators`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`unlocode_status_indicators` (
  `STStatus` VARCHAR(2) NOT NULL ,
  `STDescription` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`STStatus`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`unlocode_port`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`unlocode_port` (
  `Country` CHAR(2) NOT NULL ,
  `Location` CHAR(3) NOT NULL ,
  `Name` VARCHAR(255) NULL DEFAULT NULL ,
  `NameWoDiacritics` VARCHAR(255) NULL DEFAULT NULL ,
  `Status` VARCHAR(2) NULL DEFAULT NULL ,
  `Subdivision` VARCHAR(255) NULL DEFAULT NULL ,
  `Date` VARCHAR(255) NULL DEFAULT NULL ,
  `Function` VARCHAR(255) NULL DEFAULT NULL ,
  `IATA` VARCHAR(255) NULL DEFAULT NULL ,
  `Latitude` DOUBLE NULL DEFAULT NULL ,
  `Longitude` DOUBLE NULL DEFAULT NULL ,
  `Remarks` VARCHAR(255) NULL DEFAULT NULL ,
  `Function1` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`Country`, `Location`) ,
  INDEX `FKC95BCD37A416EDA8` (`Status` ASC) ,
  INDEX `FKC95BCD37C92B13D8` (`Country` ASC) ,
  CONSTRAINT `FKC95BCD37A416EDA8`
    FOREIGN KEY (`Status` )
    REFERENCES `cecoldo`.`unlocode_status_indicators` (`STStatus` ),
  CONSTRAINT `FKC95BCD37C92B13D8`
    FOREIGN KEY (`Country` )
    REFERENCES `cecoldo`.`paises_0101` (`pai_id` ),
  CONSTRAINT `FK_unlocode_port_2`
    FOREIGN KEY (`Country` )
    REFERENCES `cecoldo`.`paises_0101` (`pai_id` ),
  CONSTRAINT `FK_unlocode_port_4`
    FOREIGN KEY (`Status` )
    REFERENCES `cecoldo`.`unlocode_status_indicators` (`STStatus` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`inv_ship_name`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`inv_ship_name` (
  `Id` INT(10) UNSIGNED NOT NULL ,
  `ship_type` CHAR(2) NULL DEFAULT NULL ,
  `ship_name` VARCHAR(255) NULL DEFAULT NULL ,
  `ship_picture` VARCHAR(255) NULL DEFAULT NULL ,
  `moored_port` CHAR(3) NULL DEFAULT NULL ,
  `construction_date` DOUBLE NULL DEFAULT NULL ,
  `construction_country` CHAR(2) NULL DEFAULT NULL ,
  `reception_date` DOUBLE NULL DEFAULT NULL ,
  `responsable_institution` INT(10) UNSIGNED NULL DEFAULT NULL ,
  `reception_country` CHAR(2) NULL DEFAULT NULL ,
  `total_length` VARCHAR(255) NULL DEFAULT NULL ,
  `max_sleeve` VARCHAR(255) NULL DEFAULT NULL ,
  `average_openwork` VARCHAR(255) NULL DEFAULT NULL ,
  `max_speed` VARCHAR(255) NULL DEFAULT NULL ,
  `autonomy` VARCHAR(255) NULL DEFAULT NULL ,
  `displacement` VARCHAR(255) NULL DEFAULT NULL ,
  `lodging_capacity` VARCHAR(255) NULL DEFAULT NULL ,
  `description` MEDIUMTEXT NULL DEFAULT NULL ,
  `country_port` VARCHAR(255) NULL DEFAULT NULL ,
  `ship_uri` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`Id`) ,
  INDEX `FK_inv_ship_name_5` (`reception_country` ASC, `moored_port` ASC) ,
  INDEX `FKAFF177E098A37967` (`country_port` ASC, `moored_port` ASC) ,
  INDEX `FKAFF177E029A140AD` (`ship_type` ASC) ,
  INDEX `FKAFF177E0A9916A6A` (`construction_country` ASC) ,
  INDEX `FKAFF177E0A5259A68` (`reception_country` ASC) ,
  INDEX `FKAFF177E0CD5DAD6C` (`responsable_institution` ASC) ,
  CONSTRAINT `FKAFF177E029A140AD`
    FOREIGN KEY (`ship_type` )
    REFERENCES `cecoldo`.`inv_ship_type` (`Id` ),
  CONSTRAINT `FKAFF177E098A37967`
    FOREIGN KEY (`country_port` , `moored_port` )
    REFERENCES `cecoldo`.`unlocode_port` (`Country` , `Location` ),
  CONSTRAINT `FKAFF177E0A5259A68`
    FOREIGN KEY (`reception_country` )
    REFERENCES `cecoldo`.`paises_0101` (`pai_id` ),
  CONSTRAINT `FKAFF177E0A9916A6A`
    FOREIGN KEY (`construction_country` )
    REFERENCES `cecoldo`.`paises_0101` (`pai_id` ),
  CONSTRAINT `FKAFF177E0CD5DAD6C`
    FOREIGN KEY (`responsable_institution` )
    REFERENCES `cecoldo`.`inv_institutions` (`Id_institution` ),
  CONSTRAINT `FK_inv_ship_name_1`
    FOREIGN KEY (`construction_country` )
    REFERENCES `cecoldo`.`paises_0101` (`pai_id` ),
  CONSTRAINT `FK_inv_ship_name_2`
    FOREIGN KEY (`reception_country` )
    REFERENCES `cecoldo`.`paises_0101` (`pai_id` ),
  CONSTRAINT `FK_inv_ship_name_3`
    FOREIGN KEY (`responsable_institution` )
    REFERENCES `cecoldo`.`inv_institutions` (`Id_institution` ),
  CONSTRAINT `FK_inv_ship_name_4`
    FOREIGN KEY (`ship_type` )
    REFERENCES `cecoldo`.`inv_ship_type` (`Id` ),
  CONSTRAINT `FK_inv_ship_name_5`
    FOREIGN KEY (`reception_country` , `moored_port` )
    REFERENCES `cecoldo`.`unlocode_port` (`Country` , `Location` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`regions`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`regions` (
  `id` SMALLINT(6) NOT NULL DEFAULT '0' ,
  `west` DOUBLE NULL DEFAULT NULL ,
  `south` DOUBLE NULL DEFAULT NULL ,
  `east` DOUBLE NULL DEFAULT NULL ,
  `north` DOUBLE NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`inv_cruise_inventory`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`inv_cruise_inventory` (
  `id_cruise` INT NOT NULL ,
  `ocean_area` SMALLINT(6) NULL DEFAULT NULL ,
  `country` CHAR(2) NULL DEFAULT NULL ,
  `year` SMALLINT(6) NULL DEFAULT NULL ,
  `begin_date` VARCHAR(40) NULL DEFAULT NULL ,
  `end_date` VARCHAR(40) NULL DEFAULT NULL ,
  `ship_name` INT(10) UNSIGNED NULL DEFAULT NULL ,
  `cruise_name` VARCHAR(255) NULL DEFAULT NULL ,
  `cruise_objetives` VARCHAR(255) NULL DEFAULT NULL ,
  `status` CHAR(2) NULL DEFAULT NULL ,
  `port_of_departure` CHAR(3) NULL DEFAULT NULL ,
  `port_of_return` CHAR(3) NULL DEFAULT NULL ,
  `uri_report` VARCHAR(255) NULL DEFAULT NULL ,
  `countryPort` VARCHAR(255) NULL DEFAULT NULL ,
  `return_country_port` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_cruise`) ,
  INDEX `FK_inv_cruise_inventory_4` (`country` ASC, `port_of_departure` ASC) ,
  INDEX `FK99F05D0099652656` (`ocean_area` ASC) ,
  INDEX `FK99F05D001D87CD82` (`status` ASC) ,
  INDEX `FK99F05D007B672D02` (`countryPort` ASC, `port_of_departure` ASC) ,
  INDEX `FK99F05D00C92B13D8` (`country` ASC) ,
  INDEX `FK99F05D006739E0F4` (`return_country_port` ASC, `port_of_return` ASC) ,
  INDEX `FK99F05D00299B174F` (`ship_name` ASC) ,
  CONSTRAINT `FK99F05D00299B174F`
    FOREIGN KEY (`ship_name` )
    REFERENCES `cecoldo`.`inv_ship_name` (`Id` ),
  CONSTRAINT `FK99F05D006739E0F4`
    FOREIGN KEY (`return_country_port` , `port_of_return` )
    REFERENCES `cecoldo`.`unlocode_port` (`Country` , `Location` ),
  CONSTRAINT `FK99F05D007B672D02`
    FOREIGN KEY (`countryPort` , `port_of_departure` )
    REFERENCES `cecoldo`.`unlocode_port` (`Country` , `Location` ),
  CONSTRAINT `FK99F05D0099652656`
    FOREIGN KEY (`ocean_area` )
    REFERENCES `cecoldo`.`regions` (`id` ),
  CONSTRAINT `FK99F05D00C92B13D8`
    FOREIGN KEY (`country` )
    REFERENCES `cecoldo`.`paises_0101` (`pai_id` ),
  CONSTRAINT `FK_inv_cruise_inventory_7`
    FOREIGN KEY (`ship_name` )
    REFERENCES `cecoldo`.`inv_ship_name` (`Id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`inv_chief_scientist_cruise`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`inv_chief_scientist_cruise` (
  `id_chief_scientist` CHAR(11) NOT NULL ,
  `id_cruise` INT NOT NULL ,
  PRIMARY KEY (`id_chief_scientist`, `id_cruise`) ,
  INDEX `FK926476A495C09F07` (`id_chief_scientist` ASC) ,
  INDEX `FK926476A4F0F27186` (`id_cruise` ASC) ,
  CONSTRAINT `FK926476A495C09F07`
    FOREIGN KEY (`id_chief_scientist` )
    REFERENCES `cecoldo`.`inv_chief_scientist` (`Id` ),
  CONSTRAINT `FK926476A4F0F27186`
    FOREIGN KEY (`id_cruise` )
    REFERENCES `cecoldo`.`inv_cruise_inventory` (`id_cruise` ),
  CONSTRAINT `FK_inv_chief_scientist_cruise_1`
    FOREIGN KEY (`id_chief_scientist` )
    REFERENCES `cecoldo`.`inv_chief_scientist` (`Id` ),
  CONSTRAINT `FK_inv_chief_scientist_cruise_2`
    FOREIGN KEY (`id_cruise` )
    REFERENCES `cecoldo`.`inv_cruise_inventory` (`id_cruise` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`inv_cruise_bodc_category`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`inv_cruise_bodc_category` (
  `category_code` VARCHAR(4) NOT NULL ,
  `id_cruise` INT NOT NULL ,
  PRIMARY KEY (`category_code`, `id_cruise`) ,
  INDEX `FKE9E183F5F0F27186` (`id_cruise` ASC) ,
  INDEX `FKE9E183F5903D89AF` (`category_code` ASC) ,
  CONSTRAINT `FKE9E183F5903D89AF`
    FOREIGN KEY (`category_code` )
    REFERENCES `cecoldo`.`bodc_category` (`CODE` ),
  CONSTRAINT `FKE9E183F5F0F27186`
    FOREIGN KEY (`id_cruise` )
    REFERENCES `cecoldo`.`inv_cruise_inventory` (`id_cruise` ),
  CONSTRAINT `FK_inv_cruise_bodc_category_1`
    FOREIGN KEY (`category_code` )
    REFERENCES `cecoldo`.`bodc_category` (`CODE` ),
  CONSTRAINT `FK_inv_cruise_bodc_category_2`
    FOREIGN KEY (`id_cruise` )
    REFERENCES `cecoldo`.`inv_cruise_inventory` (`id_cruise` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`inv_cruise_institutions`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`inv_cruise_institutions` (
  `Id_institution` INT(10) UNSIGNED NOT NULL ,
  `id_cruise` INT NOT NULL ,
  `relation_type` CHAR(2) NOT NULL ,
  PRIMARY KEY (`Id_institution`, `id_cruise`, `relation_type`) ,
  INDEX `FKE06A7B97F0F27186` (`id_cruise` ASC) ,
  INDEX `FKE06A7B975EC25309` (`Id_institution` ASC) ,
  CONSTRAINT `FKE06A7B975EC25309`
    FOREIGN KEY (`Id_institution` )
    REFERENCES `cecoldo`.`inv_institutions` (`Id_institution` ),
  CONSTRAINT `FKE06A7B97F0F27186`
    FOREIGN KEY (`id_cruise` )
    REFERENCES `cecoldo`.`inv_cruise_inventory` (`id_cruise` ),
  CONSTRAINT `FK_inv_cruise_institutions_1`
    FOREIGN KEY (`Id_institution` )
    REFERENCES `cecoldo`.`inv_institutions` (`Id_institution` ),
  CONSTRAINT `FK_inv_cruise_institutions_2`
    FOREIGN KEY (`id_cruise` )
    REFERENCES `cecoldo`.`inv_cruise_inventory` (`id_cruise` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`inv_function_classifiers`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`inv_function_classifiers` (
  `FunctionCode` VARCHAR(2) NOT NULL ,
  `FunctionDescription` VARCHAR(250) NULL DEFAULT NULL ,
  PRIMARY KEY (`FunctionCode`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`inv_laboratories`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`inv_laboratories` (
  `id_lab` INT(10) UNSIGNED NOT NULL ,
  `name_lab` VARCHAR(255) NULL DEFAULT NULL ,
  `institution_lab` INT(10) UNSIGNED NULL DEFAULT NULL ,
  `credited_since` SMALLINT(6) NULL DEFAULT NULL ,
  `credited_procedures` VARCHAR(255) NULL DEFAULT NULL ,
  `contact` VARCHAR(255) NULL DEFAULT NULL ,
  `contact_job` VARCHAR(255) NULL DEFAULT NULL ,
  `address` VARCHAR(255) NULL DEFAULT NULL ,
  `phone` VARCHAR(255) NULL DEFAULT NULL ,
  `fax` VARCHAR(255) NULL DEFAULT NULL ,
  `AA` SMALLINT(6) NULL DEFAULT NULL ,
  `country` CHAR(2) NULL DEFAULT NULL ,
  `Web_page` VARCHAR(255) NULL DEFAULT NULL ,
  `Email_1` VARCHAR(255) NULL DEFAULT NULL ,
  `Email_2` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_lab`) ,
  INDEX `FK511F211F17A2ECFB` (`institution_lab` ASC) ,
  INDEX `FK511F211FC92B13D8` (`country` ASC) ,
  CONSTRAINT `FK511F211F17A2ECFB`
    FOREIGN KEY (`institution_lab` )
    REFERENCES `cecoldo`.`inv_institutions` (`Id_institution` ),
  CONSTRAINT `FK511F211FC92B13D8`
    FOREIGN KEY (`country` )
    REFERENCES `cecoldo`.`paises_0101` (`pai_id` ),
  CONSTRAINT `FK_inv_laboratories_1`
    FOREIGN KEY (`institution_lab` )
    REFERENCES `cecoldo`.`inv_institutions` (`Id_institution` ),
  CONSTRAINT `FK_inv_laboratories_2`
    FOREIGN KEY (`country` )
    REFERENCES `cecoldo`.`paises_0101` (`pai_id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`inv_laboratories_cruises`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`inv_laboratories_cruises` (
  `id_laboratory` INT(10) UNSIGNED NOT NULL ,
  `id_cruise` INT NOT NULL ,
  PRIMARY KEY (`id_laboratory`, `id_cruise`) ,
  INDEX `FK537ACF1E6FAB29A2` (`id_laboratory` ASC) ,
  INDEX `FK537ACF1EF0F27186` (`id_cruise` ASC) ,
  CONSTRAINT `FK537ACF1E6FAB29A2`
    FOREIGN KEY (`id_laboratory` )
    REFERENCES `cecoldo`.`inv_laboratories` (`id_lab` ),
  CONSTRAINT `FK537ACF1EF0F27186`
    FOREIGN KEY (`id_cruise` )
    REFERENCES `cecoldo`.`inv_cruise_inventory` (`id_cruise` ),
  CONSTRAINT `FK_inv_laboratories_cruises_1`
    FOREIGN KEY (`id_laboratory` )
    REFERENCES `cecoldo`.`inv_laboratories` (`id_lab` ),
  CONSTRAINT `FK_inv_laboratories_cruises_2`
    FOREIGN KEY (`id_cruise` )
    REFERENCES `cecoldo`.`inv_cruise_inventory` (`id_cruise` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`inv_status`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`inv_status` (
  `id_status` SMALLINT(6) NOT NULL ,
  `status` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_status`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`inv_project`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`inv_project` (
  `id_project` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `project_name` VARCHAR(255) NOT NULL ,
  `id_status` SMALLINT(6) NULL DEFAULT NULL ,
  `project_boss` VARCHAR(255) NULL DEFAULT NULL ,
  `id_institution` INT(10) UNSIGNED NULL DEFAULT NULL ,
  `uri_project` VARCHAR(255) NULL DEFAULT NULL ,
  `description` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_project`) ,
  INDEX `FKDB0708CBA0233FC2` (`id_status` ASC) ,
  INDEX `FKDB0708CB5EC25309` (`id_institution` ASC) ,
  CONSTRAINT `FKDB0708CB5EC25309`
    FOREIGN KEY (`id_institution` )
    REFERENCES `cecoldo`.`inv_institutions` (`Id_institution` ),
  CONSTRAINT `FKDB0708CBA0233FC2`
    FOREIGN KEY (`id_status` )
    REFERENCES `cecoldo`.`inv_status` (`id_status` ),
  CONSTRAINT `FK_inv_project_1`
    FOREIGN KEY (`id_status` )
    REFERENCES `cecoldo`.`inv_status` (`id_status` ),
  CONSTRAINT `FK_inv_project_2`
    FOREIGN KEY (`id_institution` )
    REFERENCES `cecoldo`.`inv_institutions` (`Id_institution` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`inv_status_indicators`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`inv_status_indicators` (
  `STStatus` VARCHAR(2) NOT NULL ,
  `STDescription` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`STStatus`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`isolanguages`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`isolanguages` (
  `id` INT(11) NOT NULL DEFAULT '0' ,
  `code` VARCHAR(3) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `code` (`code` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`isolanguagesdes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`isolanguagesdes` (
  `idDes` INT(11) NOT NULL DEFAULT '0' ,
  `langId` VARCHAR(5) NOT NULL DEFAULT '' ,
  `label` VARCHAR(96) NOT NULL ,
  PRIMARY KEY (`idDes`, `langId`) ,
  INDEX `langId` (`langId` ASC) ,
  CONSTRAINT `isolanguagesdes_ibfk_1`
    FOREIGN KEY (`idDes` )
    REFERENCES `cecoldo`.`isolanguages` (`id` ),
  CONSTRAINT `isolanguagesdes_ibfk_2`
    FOREIGN KEY (`langId` )
    REFERENCES `cecoldo`.`languages` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`malla_datos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`malla_datos` (
  `id_malla_datos` INT(11) NOT NULL AUTO_INCREMENT ,
  `longitud` DOUBLE NOT NULL ,
  `latitud` DOUBLE NOT NULL ,
  `numero_estacion` INT(10) UNSIGNED NULL DEFAULT NULL ,
  `descripcion` VARCHAR(255) NULL DEFAULT NULL ,
  `id_metadata` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_malla_datos`) ,
  INDEX `FK81999C9E47F6B6` (`id_metadata` ASC) ,
  CONSTRAINT `FK81999C9E47F6B6`
    FOREIGN KEY (`id_metadata` )
    REFERENCES `cecoldo`.`metadata` (`id` ),
  CONSTRAINT `FK_malla_datos_1`
    FOREIGN KEY (`id_metadata` )
    REFERENCES `cecoldo`.`metadata` (`id` ))
ENGINE = InnoDB
AUTO_INCREMENT = 2245
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`metadatacateg`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`metadatacateg` (
  `metadataId` INT(11) NOT NULL DEFAULT '0' ,
  `categoryId` INT(11) NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`metadataId`, `categoryId`) ,
  INDEX `categoryId` (`categoryId` ASC) ,
  CONSTRAINT `metadatacateg_ibfk_1`
    FOREIGN KEY (`metadataId` )
    REFERENCES `cecoldo`.`metadata` (`id` ),
  CONSTRAINT `metadatacateg_ibfk_2`
    FOREIGN KEY (`categoryId` )
    REFERENCES `cecoldo`.`categories` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`metadatarating`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`metadatarating` (
  `metadataId` INT(11) NOT NULL DEFAULT '0' ,
  `ipAddress` VARCHAR(32) NOT NULL DEFAULT '' ,
  `rating` INT(11) NOT NULL ,
  PRIMARY KEY (`metadataId`, `ipAddress`) ,
  CONSTRAINT `metadatarating_ibfk_1`
    FOREIGN KEY (`metadataId` )
    REFERENCES `cecoldo`.`metadata` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`metadatos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`metadatos` (
  `id_metadatos` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `titulo` VARCHAR(45) NOT NULL DEFAULT '' ,
  `resumen` TEXT NULL DEFAULT NULL ,
  `proyecto` VARCHAR(255) NULL DEFAULT NULL ,
  `ubicacion` VARCHAR(255) NULL DEFAULT NULL ,
  `nombre_archivo` VARCHAR(255) NULL DEFAULT NULL ,
  `fecha_carga` DATETIME NULL DEFAULT NULL ,
  `REPORTUSER_ID` INT(11) NULL DEFAULT NULL ,
  `efectuado` TINYINT(1) NULL DEFAULT '0' ,
  `cantidad_registros` INT(10) UNSIGNED NULL DEFAULT NULL ,
  PRIMARY KEY (`id_metadatos`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1, 
COMMENT = 'Datos de la información cargada en la base de datos' ;


-- -----------------------------------------------------
-- Table `cecoldo`.`observacion_datos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`observacion_datos` (
  `observacion` TEXT NULL DEFAULT NULL ,
  `id_user` INT(11) NULL DEFAULT NULL ,
  `id_archivo` INT(10) UNSIGNED NULL DEFAULT NULL ,
  `id_observacion` INT(11) NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`id_observacion`) ,
  INDEX `FKB045EED91A0373AB` (`id_archivo` ASC) ,
  INDEX `FKB045EED94FFDCBE7` (`id_user` ASC) ,
  INDEX `FKB045EED958E2826E` (`id_archivo` ASC) ,
  INDEX `FKB045EED9461B1FC5` (`id_user` ASC) ,
  CONSTRAINT `FKB045EED91A0373AB`
    FOREIGN KEY (`id_archivo` )
    REFERENCES `cecoldo`.`archivo_datos` (`id_archivo` ),
  CONSTRAINT `FKB045EED9461B1FC5`
    FOREIGN KEY (`id_user` )
    REFERENCES `cecoldo`.`report_user` (`REPORTUSER_ID` ),
  CONSTRAINT `FKB045EED94FFDCBE7`
    FOREIGN KEY (`id_user` )
    REFERENCES `cecoldo`.`report_user` (`REPORTUSER_ID` ),
  CONSTRAINT `FKB045EED958E2826E`
    FOREIGN KEY (`id_archivo` )
    REFERENCES `cecoldo`.`archivo_datos` (`id_archivo` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`operations`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`operations` (
  `id` INT(11) NOT NULL DEFAULT '0' ,
  `name` VARCHAR(32) NOT NULL ,
  `reserved` CHAR(1) NOT NULL DEFAULT 'n' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`operationallowed`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`operationallowed` (
  `groupId` INT(11) NOT NULL DEFAULT '0' ,
  `metadataId` INT(11) NOT NULL DEFAULT '0' ,
  `operationId` INT(11) NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`groupId`, `metadataId`, `operationId`) ,
  INDEX `metadataId` (`metadataId` ASC) ,
  INDEX `operationId` (`operationId` ASC) ,
  CONSTRAINT `operationallowed_ibfk_1`
    FOREIGN KEY (`groupId` )
    REFERENCES `cecoldo`.`groups` (`id` ),
  CONSTRAINT `operationallowed_ibfk_2`
    FOREIGN KEY (`metadataId` )
    REFERENCES `cecoldo`.`metadata` (`id` ),
  CONSTRAINT `operationallowed_ibfk_3`
    FOREIGN KEY (`operationId` )
    REFERENCES `cecoldo`.`operations` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`operationsdes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`operationsdes` (
  `idDes` INT(11) NOT NULL DEFAULT '0' ,
  `langId` VARCHAR(5) NOT NULL DEFAULT '' ,
  `label` VARCHAR(96) NOT NULL ,
  PRIMARY KEY (`idDes`, `langId`) ,
  INDEX `langId` (`langId` ASC) ,
  CONSTRAINT `operationsdes_ibfk_1`
    FOREIGN KEY (`idDes` )
    REFERENCES `cecoldo`.`operations` (`id` ),
  CONSTRAINT `operationsdes_ibfk_2`
    FOREIGN KEY (`langId` )
    REFERENCES `cecoldo`.`languages` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`or_properties`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`or_properties` (
  `PROPERTY_ID` INT(11) NOT NULL AUTO_INCREMENT ,
  `PROPERTY_KEY` VARCHAR(255) NOT NULL ,
  `PROPERTY_VALUE` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`PROPERTY_ID`) ,
  UNIQUE INDEX `PROPERTY_KEY` (`PROPERTY_KEY` ASC) ,
  UNIQUE INDEX `PROPERTY_KEY_2` (`PROPERTY_KEY` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`or_tags`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`or_tags` (
  `TAG_ID` INT(11) NOT NULL AUTO_INCREMENT ,
  `TAGGED_OBJECT_ID` INT(11) NOT NULL ,
  `TAGGED_OBJECT_CLASS` VARCHAR(255) NOT NULL ,
  `TAG_VALUE` VARCHAR(255) NOT NULL ,
  `TAG_TYPE` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`TAG_ID`) )
ENGINE = InnoDB
AUTO_INCREMENT = 42
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`profundidades_estandar`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`profundidades_estandar` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `profundidad` DOUBLE NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`qrtz_job_details`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`qrtz_job_details` (
  `JOB_NAME` VARCHAR(80) NOT NULL ,
  `JOB_GROUP` VARCHAR(80) NOT NULL ,
  `DESCRIPTION` VARCHAR(120) NULL DEFAULT NULL ,
  `JOB_CLASS_NAME` VARCHAR(128) NOT NULL ,
  `IS_DURABLE` VARCHAR(1) NOT NULL ,
  `IS_VOLATILE` VARCHAR(1) NOT NULL ,
  `IS_STATEFUL` VARCHAR(1) NOT NULL ,
  `REQUESTS_RECOVERY` VARCHAR(1) NOT NULL ,
  `JOB_DATA` BLOB NULL DEFAULT NULL ,
  PRIMARY KEY (`JOB_NAME`, `JOB_GROUP`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`qrtz_triggers`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`qrtz_triggers` (
  `TRIGGER_NAME` VARCHAR(80) NOT NULL ,
  `TRIGGER_GROUP` VARCHAR(80) NOT NULL ,
  `JOB_NAME` VARCHAR(80) NOT NULL ,
  `JOB_GROUP` VARCHAR(80) NOT NULL ,
  `IS_VOLATILE` VARCHAR(1) NOT NULL ,
  `DESCRIPTION` VARCHAR(120) NULL DEFAULT NULL ,
  `NEXT_FIRE_TIME` BIGINT(13) NULL DEFAULT NULL ,
  `PREV_FIRE_TIME` BIGINT(13) NULL DEFAULT NULL ,
  `PRIORITY` INT(11) NULL DEFAULT NULL ,
  `TRIGGER_STATE` VARCHAR(16) NOT NULL ,
  `TRIGGER_TYPE` VARCHAR(8) NOT NULL ,
  `START_TIME` BIGINT(13) NOT NULL ,
  `END_TIME` BIGINT(13) NULL DEFAULT NULL ,
  `CALENDAR_NAME` VARCHAR(80) NULL DEFAULT NULL ,
  `MISFIRE_INSTR` SMALLINT(2) NULL DEFAULT NULL ,
  `JOB_DATA` BLOB NULL DEFAULT NULL ,
  PRIMARY KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`) ,
  INDEX `JOB_NAME` (`JOB_NAME` ASC, `JOB_GROUP` ASC) ,
  CONSTRAINT `qrtz_triggers_ibfk_1`
    FOREIGN KEY (`JOB_NAME` , `JOB_GROUP` )
    REFERENCES `cecoldo`.`qrtz_job_details` (`JOB_NAME` , `JOB_GROUP` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`qrtz_blob_triggers`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`qrtz_blob_triggers` (
  `TRIGGER_NAME` VARCHAR(80) NOT NULL ,
  `TRIGGER_GROUP` VARCHAR(80) NOT NULL ,
  `BLOB_DATA` BLOB NULL DEFAULT NULL ,
  PRIMARY KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`) ,
  INDEX `TRIGGER_NAME` (`TRIGGER_NAME` ASC, `TRIGGER_GROUP` ASC) ,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1`
    FOREIGN KEY (`TRIGGER_NAME` , `TRIGGER_GROUP` )
    REFERENCES `cecoldo`.`qrtz_triggers` (`TRIGGER_NAME` , `TRIGGER_GROUP` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`qrtz_calendars`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`qrtz_calendars` (
  `CALENDAR_NAME` VARCHAR(80) NOT NULL ,
  `CALENDAR` BLOB NOT NULL ,
  PRIMARY KEY (`CALENDAR_NAME`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`qrtz_cron_triggers`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`qrtz_cron_triggers` (
  `TRIGGER_NAME` VARCHAR(80) NOT NULL ,
  `TRIGGER_GROUP` VARCHAR(80) NOT NULL ,
  `CRON_EXPRESSION` VARCHAR(80) NOT NULL ,
  `TIME_ZONE_ID` VARCHAR(80) NULL DEFAULT NULL ,
  PRIMARY KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`) ,
  INDEX `TRIGGER_NAME` (`TRIGGER_NAME` ASC, `TRIGGER_GROUP` ASC) ,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1`
    FOREIGN KEY (`TRIGGER_NAME` , `TRIGGER_GROUP` )
    REFERENCES `cecoldo`.`qrtz_triggers` (`TRIGGER_NAME` , `TRIGGER_GROUP` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`qrtz_fired_triggers`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`qrtz_fired_triggers` (
  `ENTRY_ID` VARCHAR(95) NOT NULL ,
  `TRIGGER_NAME` VARCHAR(80) NOT NULL ,
  `TRIGGER_GROUP` VARCHAR(80) NOT NULL ,
  `IS_VOLATILE` VARCHAR(1) NOT NULL ,
  `INSTANCE_NAME` VARCHAR(80) NOT NULL ,
  `FIRED_TIME` BIGINT(13) NOT NULL ,
  `PRIORITY` INT(11) NOT NULL ,
  `STATE` VARCHAR(16) NOT NULL ,
  `JOB_NAME` VARCHAR(80) NULL DEFAULT NULL ,
  `JOB_GROUP` VARCHAR(80) NULL DEFAULT NULL ,
  `IS_STATEFUL` VARCHAR(1) NULL DEFAULT NULL ,
  `REQUESTS_RECOVERY` VARCHAR(1) NULL DEFAULT NULL ,
  PRIMARY KEY (`ENTRY_ID`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`qrtz_job_listeners`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`qrtz_job_listeners` (
  `JOB_NAME` VARCHAR(80) NOT NULL ,
  `JOB_GROUP` VARCHAR(80) NOT NULL ,
  `JOB_LISTENER` VARCHAR(80) NOT NULL ,
  PRIMARY KEY (`JOB_NAME`, `JOB_GROUP`, `JOB_LISTENER`) ,
  INDEX `JOB_NAME` (`JOB_NAME` ASC, `JOB_GROUP` ASC) ,
  CONSTRAINT `qrtz_job_listeners_ibfk_1`
    FOREIGN KEY (`JOB_NAME` , `JOB_GROUP` )
    REFERENCES `cecoldo`.`qrtz_job_details` (`JOB_NAME` , `JOB_GROUP` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`qrtz_locks`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`qrtz_locks` (
  `LOCK_NAME` VARCHAR(40) NOT NULL ,
  PRIMARY KEY (`LOCK_NAME`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`qrtz_paused_trigger_grps`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`qrtz_paused_trigger_grps` (
  `TRIGGER_GROUP` VARCHAR(80) NOT NULL ,
  PRIMARY KEY (`TRIGGER_GROUP`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`qrtz_scheduler_state`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`qrtz_scheduler_state` (
  `INSTANCE_NAME` VARCHAR(80) NOT NULL ,
  `LAST_CHECKIN_TIME` BIGINT(13) NOT NULL ,
  `CHECKIN_INTERVAL` BIGINT(13) NOT NULL ,
  PRIMARY KEY (`INSTANCE_NAME`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`qrtz_simple_triggers`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`qrtz_simple_triggers` (
  `TRIGGER_NAME` VARCHAR(80) NOT NULL ,
  `TRIGGER_GROUP` VARCHAR(80) NOT NULL ,
  `REPEAT_COUNT` BIGINT(7) NOT NULL ,
  `REPEAT_INTERVAL` BIGINT(12) NOT NULL ,
  `TIMES_TRIGGERED` BIGINT(7) NOT NULL ,
  PRIMARY KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`) ,
  INDEX `TRIGGER_NAME` (`TRIGGER_NAME` ASC, `TRIGGER_GROUP` ASC) ,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1`
    FOREIGN KEY (`TRIGGER_NAME` , `TRIGGER_GROUP` )
    REFERENCES `cecoldo`.`qrtz_triggers` (`TRIGGER_NAME` , `TRIGGER_GROUP` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`qrtz_trigger_listeners`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`qrtz_trigger_listeners` (
  `TRIGGER_NAME` VARCHAR(80) NOT NULL ,
  `TRIGGER_GROUP` VARCHAR(80) NOT NULL ,
  `TRIGGER_LISTENER` VARCHAR(80) NOT NULL ,
  PRIMARY KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_LISTENER`) ,
  INDEX `TRIGGER_NAME` (`TRIGGER_NAME` ASC, `TRIGGER_GROUP` ASC) ,
  CONSTRAINT `qrtz_trigger_listeners_ibfk_1`
    FOREIGN KEY (`TRIGGER_NAME` , `TRIGGER_GROUP` )
    REFERENCES `cecoldo`.`qrtz_triggers` (`TRIGGER_NAME` , `TRIGGER_GROUP` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`regionsdes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`regionsdes` (
  `idDes` SMALLINT(6) NOT NULL DEFAULT '0' ,
  `langId` VARCHAR(255) NOT NULL DEFAULT '0' ,
  `label` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`idDes`, `langId`) ,
  INDEX `FK896957B394DC043F` (`idDes` ASC) ,
  CONSTRAINT `FK896957B394DC043F`
    FOREIGN KEY (`idDes` )
    REFERENCES `cecoldo`.`regions` (`id` ),
  CONSTRAINT `FK_regionsdes_1`
    FOREIGN KEY (`idDes` )
    REFERENCES `cecoldo`.`regions` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`relations`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`relations` (
  `id` INT(11) NOT NULL DEFAULT '0' ,
  `relatedId` INT(11) NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`id`, `relatedId`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`report_alert`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`report_alert` (
  `ALERT_ID` INT(11) NOT NULL AUTO_INCREMENT ,
  `NAME` VARCHAR(255) NOT NULL ,
  `DESCRIPTION` VARCHAR(255) NOT NULL ,
  `ALERT_QUERY` TEXT NOT NULL ,
  `DATASOURCE_ID` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`ALERT_ID`) ,
  UNIQUE INDEX `NAME` (`NAME` ASC) ,
  UNIQUE INDEX `NAME_2` (`NAME` ASC) ,
  INDEX `FKF81C86714330D5A7` (`DATASOURCE_ID` ASC) ,
  CONSTRAINT `FKF81C86714330D5A7`
    FOREIGN KEY (`DATASOURCE_ID` )
    REFERENCES `cecoldo`.`report_datasource` (`DATASOURCE_ID` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`report_log`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`report_log` (
  `LOG_ID` INT(11) NOT NULL AUTO_INCREMENT ,
  `START_TIME` DATETIME NULL DEFAULT NULL ,
  `END_TIME` DATETIME NULL DEFAULT NULL ,
  `STATUS` VARCHAR(255) NULL DEFAULT NULL ,
  `MESSAGE` TEXT NULL DEFAULT NULL ,
  `EXPORT_TYPE` INT(11) NULL DEFAULT NULL ,
  `REQUEST_ID` VARCHAR(255) NULL DEFAULT NULL ,
  `REPORT_ID` INT(11) NULL DEFAULT NULL ,
  `USER_ID` INT(11) NULL DEFAULT NULL ,
  `ALERT_ID` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`LOG_ID`) ,
  INDEX `FK901BE599E4B42987` (`USER_ID` ASC) ,
  INDEX `FK901BE599AAEF4A13` (`REPORT_ID` ASC) ,
  INDEX `FK901BE59920DA4A2D` (`ALERT_ID` ASC) ,
  CONSTRAINT `FK901BE59920DA4A2D`
    FOREIGN KEY (`ALERT_ID` )
    REFERENCES `cecoldo`.`report_alert` (`ALERT_ID` ),
  CONSTRAINT `FK901BE599AAEF4A13`
    FOREIGN KEY (`REPORT_ID` )
    REFERENCES `cecoldo`.`report` (`REPORT_ID` ),
  CONSTRAINT `FK901BE599E4B42987`
    FOREIGN KEY (`USER_ID` )
    REFERENCES `cecoldo`.`report_user` (`REPORTUSER_ID` ))
ENGINE = InnoDB
AUTO_INCREMENT = 45
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`report_delivery_log`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`report_delivery_log` (
  `DELIVERY_LOG_ID` INT(11) NOT NULL AUTO_INCREMENT ,
  `START_TIME` DATETIME NULL DEFAULT NULL ,
  `END_TIME` DATETIME NULL DEFAULT NULL ,
  `STATUS` VARCHAR(255) NULL DEFAULT NULL ,
  `MESSAGE` TEXT NULL DEFAULT NULL ,
  `DELIVERY_METHOD` VARCHAR(255) NULL DEFAULT NULL ,
  `LOG_ID` INT(11) NULL DEFAULT NULL ,
  `DELIVERY_INDEX` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`DELIVERY_LOG_ID`) ,
  INDEX `FKC783FD84632801ED` (`LOG_ID` ASC) ,
  CONSTRAINT `FKC783FD84632801ED`
    FOREIGN KEY (`LOG_ID` )
    REFERENCES `cecoldo`.`report_log` (`LOG_ID` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`report_group_map`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`report_group_map` (
  `GROUP_ID` INT(11) NOT NULL ,
  `REPORT_ID` INT(11) NOT NULL ,
  `MAP_ID` INT(11) NOT NULL ,
  PRIMARY KEY (`GROUP_ID`, `MAP_ID`) ,
  INDEX `FKEF946211AAEF4A13` (`REPORT_ID` ASC) ,
  INDEX `FKEF946211DF17134D` (`GROUP_ID` ASC) ,
  CONSTRAINT `FKEF946211AAEF4A13`
    FOREIGN KEY (`REPORT_ID` )
    REFERENCES `cecoldo`.`report` (`REPORT_ID` ),
  CONSTRAINT `FKEF946211DF17134D`
    FOREIGN KEY (`GROUP_ID` )
    REFERENCES `cecoldo`.`report_group` (`GROUP_ID` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`report_parameter`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`report_parameter` (
  `PARAMETER_ID` INT(11) NOT NULL AUTO_INCREMENT ,
  `NAME` VARCHAR(255) NOT NULL ,
  `TYPE` VARCHAR(255) NOT NULL ,
  `CLASSNAME` VARCHAR(255) NOT NULL ,
  `DATA` TEXT NULL DEFAULT NULL ,
  `DATASOURCE_ID` INT(11) NULL DEFAULT NULL ,
  `DESCRIPTION` VARCHAR(255) NULL DEFAULT NULL ,
  `REQUIRED` BIT(1) NULL DEFAULT NULL ,
  `MULTI_SELECT` BIT(1) NULL DEFAULT NULL ,
  `DEFAULT_VALUE` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`PARAMETER_ID`) ,
  UNIQUE INDEX `NAME` (`NAME` ASC) ,
  UNIQUE INDEX `NAME_2` (`NAME` ASC) ,
  INDEX `FKBC64163E4330D5A7` (`DATASOURCE_ID` ASC) ,
  CONSTRAINT `FKBC64163E4330D5A7`
    FOREIGN KEY (`DATASOURCE_ID` )
    REFERENCES `cecoldo`.`report_datasource` (`DATASOURCE_ID` ))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`report_parameter_map`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`report_parameter_map` (
  `REPORT_ID` INT(11) NOT NULL ,
  `PARAMETER_ID` INT(11) NULL DEFAULT NULL ,
  `REQUIRED` BIT(1) NULL DEFAULT NULL ,
  `SORT_ORDER` INT(11) NULL DEFAULT NULL ,
  `STEP` INT(11) NULL DEFAULT NULL ,
  `MAP_ID` INT(11) NOT NULL ,
  PRIMARY KEY (`REPORT_ID`, `MAP_ID`) ,
  INDEX `FK23FF1FBB1AFAD98D` (`PARAMETER_ID` ASC) ,
  INDEX `FK23FF1FBBAAEF4A13` (`REPORT_ID` ASC) ,
  CONSTRAINT `FK23FF1FBB1AFAD98D`
    FOREIGN KEY (`PARAMETER_ID` )
    REFERENCES `cecoldo`.`report_parameter` (`PARAMETER_ID` ),
  CONSTRAINT `FK23FF1FBBAAEF4A13`
    FOREIGN KEY (`REPORT_ID` )
    REFERENCES `cecoldo`.`report` (`REPORT_ID` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`settings`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`settings` (
  `id` INT(11) NOT NULL DEFAULT '0' ,
  `parentId` INT(11) NULL DEFAULT NULL ,
  `name` VARCHAR(32) NOT NULL ,
  `value` VARCHAR(250) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `parentId` (`parentId` ASC) ,
  CONSTRAINT `settings_ibfk_1`
    FOREIGN KEY (`parentId` )
    REFERENCES `cecoldo`.`settings` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`sources`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`sources` (
  `uuid` VARCHAR(250) NOT NULL DEFAULT '' ,
  `name` VARCHAR(250) NULL DEFAULT NULL ,
  `isLocal` CHAR(1) NULL DEFAULT 'y' ,
  PRIMARY KEY (`uuid`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`user_alert_map`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`user_alert_map` (
  `USER_ID` INT(11) NOT NULL ,
  `ALERT_ID` INT(11) NULL DEFAULT NULL ,
  `REPORT_ID` INT(11) NULL DEFAULT NULL ,
  `ALERT_LIMIT` INT(11) NULL DEFAULT NULL ,
  `ALERT_OPERATOR` VARCHAR(255) NULL DEFAULT NULL ,
  `MAP_ID` INT(11) NOT NULL ,
  PRIMARY KEY (`USER_ID`, `MAP_ID`) ,
  INDEX `FKD83C845E4B42987` (`USER_ID` ASC) ,
  INDEX `FKD83C845AAEF4A13` (`REPORT_ID` ASC) ,
  INDEX `FKD83C84520DA4A2D` (`ALERT_ID` ASC) ,
  CONSTRAINT `FKD83C84520DA4A2D`
    FOREIGN KEY (`ALERT_ID` )
    REFERENCES `cecoldo`.`report_alert` (`ALERT_ID` ),
  CONSTRAINT `FKD83C845AAEF4A13`
    FOREIGN KEY (`REPORT_ID` )
    REFERENCES `cecoldo`.`report` (`REPORT_ID` ),
  CONSTRAINT `FKD83C845E4B42987`
    FOREIGN KEY (`USER_ID` )
    REFERENCES `cecoldo`.`report_user` (`REPORTUSER_ID` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`user_group_map`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`user_group_map` (
  `USER_ID` INT(11) NOT NULL ,
  `GROUP_ID` INT(11) NOT NULL ,
  `MAP_ID` INT(11) NOT NULL ,
  PRIMARY KEY (`USER_ID`, `MAP_ID`) ,
  INDEX `FKC49EBE8E4B42987` (`USER_ID` ASC) ,
  INDEX `FKC49EBE8DF17134D` (`GROUP_ID` ASC) ,
  CONSTRAINT `FKC49EBE8DF17134D`
    FOREIGN KEY (`GROUP_ID` )
    REFERENCES `cecoldo`.`report_group` (`GROUP_ID` ),
  CONSTRAINT `FKC49EBE8E4B42987`
    FOREIGN KEY (`USER_ID` )
    REFERENCES `cecoldo`.`report_user` (`REPORTUSER_ID` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`user_security`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`user_security` (
  `USER_ID` INT(11) NOT NULL ,
  `ROLE_NAME` VARCHAR(255) NULL DEFAULT NULL ,
  INDEX `FK7DE1C934E4B42987` (`USER_ID` ASC) ,
  CONSTRAINT `FK7DE1C934E4B42987`
    FOREIGN KEY (`USER_ID` )
    REFERENCES `cecoldo`.`report_user` (`REPORTUSER_ID` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`usergroups`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`usergroups` (
  `userId` INT(11) NOT NULL DEFAULT '0' ,
  `groupId` INT(11) NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`userId`, `groupId`) ,
  INDEX `groupId` (`groupId` ASC) ,
  INDEX `FK80E9815F359B8165` (`groupId` ASC) ,
  INDEX `FK80E9815F5C7E2597` (`userId` ASC) ,
  CONSTRAINT `FK80E9815F359B8165`
    FOREIGN KEY (`groupId` )
    REFERENCES `cecoldo`.`groups` (`id` ),
  CONSTRAINT `FK80E9815F5C7E2597`
    FOREIGN KEY (`userId` )
    REFERENCES `cecoldo`.`users` (`id` ),
  CONSTRAINT `usergroups_ibfk_1`
    FOREIGN KEY (`userId` )
    REFERENCES `cecoldo`.`users` (`id` ),
  CONSTRAINT `usergroups_ibfk_2`
    FOREIGN KEY (`groupId` )
    REFERENCES `cecoldo`.`groups` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`usuario_datos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`usuario_datos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `apellidos` VARCHAR(255) NULL DEFAULT NULL ,
  `ciudad` VARCHAR(255) NULL DEFAULT NULL ,
  `confirmacionContrasena` VARCHAR(255) NULL DEFAULT NULL ,
  `contrasena` VARCHAR(255) NULL DEFAULT NULL ,
  `email` VARCHAR(255) NULL DEFAULT NULL ,
  `estado` VARCHAR(255) NULL DEFAULT NULL ,
  `fecha` DATETIME NULL DEFAULT NULL ,
  `identificacion` VARCHAR(255) NULL DEFAULT NULL ,
  `nombres` VARCHAR(255) NULL DEFAULT NULL ,
  `organizacion` VARCHAR(255) NULL DEFAULT NULL ,
  `pais` VARCHAR(255) NULL DEFAULT NULL ,
  `uso` VARCHAR(255) NULL DEFAULT NULL ,
  `id_metadata` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `FK4C7CC36AE47F6B6` (`id_metadata` ASC) ,
  CONSTRAINT `FK4C7CC36AE47F6B6`
    FOREIGN KEY (`id_metadata` )
    REFERENCES `cecoldo`.`metadata` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cecoldo`.`inv_inventory_project`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`inv_inventory_project` (
  `id_inventory_project` INT NOT NULL AUTO_INCREMENT ,
  `id_project` INT(10) UNSIGNED NULL ,
  `id_cruise` INT NULL ,
  PRIMARY KEY (`id_inventory_project`) ,
  INDEX `fk_inv_inventory_project_inv_project1` (`id_project` ASC) ,
  INDEX `fk_inv_inventory_project_inv_cruise_inventory1` (`id_cruise` ASC) ,
  CONSTRAINT `fk_inv_inventory_project_inv_project1`
    FOREIGN KEY (`id_project` )
    REFERENCES `cecoldo`.`inv_project` (`id_project` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inv_inventory_project_inv_cruise_inventory1`
    FOREIGN KEY (`id_cruise` )
    REFERENCES `cecoldo`.`inv_cruise_inventory` (`id_cruise` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cecoldo`.`inv_metadata`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cecoldo`.`inv_metadata` (
  `id_metadata` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`id_metadata`) )
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;