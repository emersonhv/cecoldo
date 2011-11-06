SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `cenimarc_` DEFAULT CHARACTER SET utf8 ;
USE `cenimarc_` ;

-- -----------------------------------------------------
-- Table `cenimarc_`.`inv_discipline`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cenimarc_`.`inv_discipline` ;

CREATE  TABLE IF NOT EXISTS `cenimarc_`.`inv_discipline` (
  `id_discipline` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `discipline` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id_discipline`) )
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cenimarc_`.`inv_institutions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cenimarc_`.`inv_institutions` ;

CREATE  TABLE IF NOT EXISTS `cenimarc_`.`inv_institutions` (
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
    REFERENCES `cenimarc_`.`gen_municipio` (`DANE` ),
  CONSTRAINT `FK30011349C92B13D8`
    FOREIGN KEY (`country` )
    REFERENCES `cenimarc_`.`paises_0101` (`pai_id` ),
  CONSTRAINT `FK_inv_institutions_1`
    FOREIGN KEY (`country` )
    REFERENCES `cenimarc_`.`paises_0101` (`pai_id` ),
  CONSTRAINT `FK_inv_institutions_2`
    FOREIGN KEY (`cod_city` )
    REFERENCES `cenimarc_`.`gen_municipio` (`DANE` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cenimarc_`.`inv_chief_scientist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cenimarc_`.`inv_chief_scientist` ;

CREATE  TABLE IF NOT EXISTS `cenimarc_`.`inv_chief_scientist` (
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
    REFERENCES `cenimarc_`.`inv_institutions` (`Id_institution` ),
  CONSTRAINT `FK3A057150C92B13D8`
    FOREIGN KEY (`country` )
    REFERENCES `cenimarc_`.`paises_0101` (`pai_id` ),
  CONSTRAINT `FK3A057150F252BEE4`
    FOREIGN KEY (`profession` )
    REFERENCES `cenimarc_`.`gen_profesion` (`id_profesion` ),
  CONSTRAINT `FK_inv_chief_scientist_1`
    FOREIGN KEY (`country` )
    REFERENCES `cenimarc_`.`paises_0101` (`pai_id` ),
  CONSTRAINT `FK_inv_chief_scientist_2`
    FOREIGN KEY (`profession` )
    REFERENCES `cenimarc_`.`gen_profesion` (`id_profesion` ),
  CONSTRAINT `FK_inv_chief_scientist_3`
    FOREIGN KEY (`institution` )
    REFERENCES `cenimarc_`.`inv_institutions` (`Id_institution` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cenimarc_`.`inv_ship_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cenimarc_`.`inv_ship_type` ;

CREATE  TABLE IF NOT EXISTS `cenimarc_`.`inv_ship_type` (
  `Id` CHAR(2) NOT NULL ,
  `ship_type` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`Id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cenimarc_`.`inv_ship_name`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cenimarc_`.`inv_ship_name` ;

CREATE  TABLE IF NOT EXISTS `cenimarc_`.`inv_ship_name` (
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
    REFERENCES `cenimarc_`.`inv_ship_type` (`Id` ),
  CONSTRAINT `FKAFF177E098A37967`
    FOREIGN KEY (`country_port` , `moored_port` )
    REFERENCES `cenimarc_`.`unlocode_port` (`Country` , `Location` ),
  CONSTRAINT `FKAFF177E0A5259A68`
    FOREIGN KEY (`reception_country` )
    REFERENCES `cenimarc_`.`paises_0101` (`pai_id` ),
  CONSTRAINT `FKAFF177E0A9916A6A`
    FOREIGN KEY (`construction_country` )
    REFERENCES `cenimarc_`.`paises_0101` (`pai_id` ),
  CONSTRAINT `FKAFF177E0CD5DAD6C`
    FOREIGN KEY (`responsable_institution` )
    REFERENCES `cenimarc_`.`inv_institutions` (`Id_institution` ),
  CONSTRAINT `FK_inv_ship_name_1`
    FOREIGN KEY (`construction_country` )
    REFERENCES `cenimarc_`.`paises_0101` (`pai_id` ),
  CONSTRAINT `FK_inv_ship_name_2`
    FOREIGN KEY (`reception_country` )
    REFERENCES `cenimarc_`.`paises_0101` (`pai_id` ),
  CONSTRAINT `FK_inv_ship_name_3`
    FOREIGN KEY (`responsable_institution` )
    REFERENCES `cenimarc_`.`inv_institutions` (`Id_institution` ),
  CONSTRAINT `FK_inv_ship_name_4`
    FOREIGN KEY (`ship_type` )
    REFERENCES `cenimarc_`.`inv_ship_type` (`Id` ),
  CONSTRAINT `FK_inv_ship_name_5`
    FOREIGN KEY (`reception_country` , `moored_port` )
    REFERENCES `cenimarc_`.`unlocode_port` (`Country` , `Location` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cenimarc_`.`inv_cruise_inventory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cenimarc_`.`inv_cruise_inventory` ;

CREATE  TABLE IF NOT EXISTS `cenimarc_`.`inv_cruise_inventory` (
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
    REFERENCES `cenimarc_`.`inv_ship_name` (`Id` ),
  CONSTRAINT `FK99F05D006739E0F4`
    FOREIGN KEY (`return_country_port` , `port_of_return` )
    REFERENCES `cenimarc_`.`unlocode_port` (`Country` , `Location` ),
  CONSTRAINT `FK99F05D007B672D02`
    FOREIGN KEY (`countryPort` , `port_of_departure` )
    REFERENCES `cenimarc_`.`unlocode_port` (`Country` , `Location` ),
  CONSTRAINT `FK99F05D0099652656`
    FOREIGN KEY (`ocean_area` )
    REFERENCES `cenimarc_`.`regions` (`id` ),
  CONSTRAINT `FK99F05D00C92B13D8`
    FOREIGN KEY (`country` )
    REFERENCES `cenimarc_`.`paises_0101` (`pai_id` ),
  CONSTRAINT `FK_inv_cruise_inventory_7`
    FOREIGN KEY (`ship_name` )
    REFERENCES `cenimarc_`.`inv_ship_name` (`Id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cenimarc_`.`inv_chief_scientist_cruise`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cenimarc_`.`inv_chief_scientist_cruise` ;

CREATE  TABLE IF NOT EXISTS `cenimarc_`.`inv_chief_scientist_cruise` (
  `id_chief_scientist` CHAR(11) NOT NULL ,
  `id_cruise` INT NOT NULL ,
  PRIMARY KEY (`id_chief_scientist`, `id_cruise`) ,
  INDEX `FK926476A495C09F07` (`id_chief_scientist` ASC) ,
  INDEX `FK926476A4F0F27186` (`id_cruise` ASC) ,
  CONSTRAINT `FK926476A495C09F07`
    FOREIGN KEY (`id_chief_scientist` )
    REFERENCES `cenimarc_`.`inv_chief_scientist` (`Id` ),
  CONSTRAINT `FK926476A4F0F27186`
    FOREIGN KEY (`id_cruise` )
    REFERENCES `cenimarc_`.`inv_cruise_inventory` (`id_cruise` ),
  CONSTRAINT `FK_inv_chief_scientist_cruise_1`
    FOREIGN KEY (`id_chief_scientist` )
    REFERENCES `cenimarc_`.`inv_chief_scientist` (`Id` ),
  CONSTRAINT `FK_inv_chief_scientist_cruise_2`
    FOREIGN KEY (`id_cruise` )
    REFERENCES `cenimarc_`.`inv_cruise_inventory` (`id_cruise` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cenimarc_`.`inv_cruise_bodc_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cenimarc_`.`inv_cruise_bodc_category` ;

CREATE  TABLE IF NOT EXISTS `cenimarc_`.`inv_cruise_bodc_category` (
  `category_code` VARCHAR(4) NOT NULL ,
  `id_cruise` INT NOT NULL ,
  PRIMARY KEY (`category_code`, `id_cruise`) ,
  INDEX `FKE9E183F5F0F27186` (`id_cruise` ASC) ,
  INDEX `FKE9E183F5903D89AF` (`category_code` ASC) ,
  CONSTRAINT `FKE9E183F5903D89AF`
    FOREIGN KEY (`category_code` )
    REFERENCES `cenimarc_`.`bodc_category` (`CODE` ),
  CONSTRAINT `FKE9E183F5F0F27186`
    FOREIGN KEY (`id_cruise` )
    REFERENCES `cenimarc_`.`inv_cruise_inventory` (`id_cruise` ),
  CONSTRAINT `FK_inv_cruise_bodc_category_1`
    FOREIGN KEY (`category_code` )
    REFERENCES `cenimarc_`.`bodc_category` (`CODE` ),
  CONSTRAINT `FK_inv_cruise_bodc_category_2`
    FOREIGN KEY (`id_cruise` )
    REFERENCES `cenimarc_`.`inv_cruise_inventory` (`id_cruise` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cenimarc_`.`inv_cruise_institutions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cenimarc_`.`inv_cruise_institutions` ;

CREATE  TABLE IF NOT EXISTS `cenimarc_`.`inv_cruise_institutions` (
  `Id_institution` INT(10) UNSIGNED NOT NULL ,
  `id_cruise` INT NOT NULL ,
  `relation_type` CHAR(2) NOT NULL ,
  PRIMARY KEY (`Id_institution`, `id_cruise`, `relation_type`) ,
  INDEX `FKE06A7B97F0F27186` (`id_cruise` ASC) ,
  INDEX `FKE06A7B975EC25309` (`Id_institution` ASC) ,
  CONSTRAINT `FKE06A7B975EC25309`
    FOREIGN KEY (`Id_institution` )
    REFERENCES `cenimarc_`.`inv_institutions` (`Id_institution` ),
  CONSTRAINT `FKE06A7B97F0F27186`
    FOREIGN KEY (`id_cruise` )
    REFERENCES `cenimarc_`.`inv_cruise_inventory` (`id_cruise` ),
  CONSTRAINT `FK_inv_cruise_institutions_1`
    FOREIGN KEY (`Id_institution` )
    REFERENCES `cenimarc_`.`inv_institutions` (`Id_institution` ),
  CONSTRAINT `FK_inv_cruise_institutions_2`
    FOREIGN KEY (`id_cruise` )
    REFERENCES `cenimarc_`.`inv_cruise_inventory` (`id_cruise` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cenimarc_`.`inv_function_classifiers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cenimarc_`.`inv_function_classifiers` ;

CREATE  TABLE IF NOT EXISTS `cenimarc_`.`inv_function_classifiers` (
  `FunctionCode` VARCHAR(2) NOT NULL ,
  `FunctionDescription` VARCHAR(250) NULL DEFAULT NULL ,
  PRIMARY KEY (`FunctionCode`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cenimarc_`.`inv_laboratories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cenimarc_`.`inv_laboratories` ;

CREATE  TABLE IF NOT EXISTS `cenimarc_`.`inv_laboratories` (
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
    REFERENCES `cenimarc_`.`inv_institutions` (`Id_institution` ),
  CONSTRAINT `FK511F211FC92B13D8`
    FOREIGN KEY (`country` )
    REFERENCES `cenimarc_`.`paises_0101` (`pai_id` ),
  CONSTRAINT `FK_inv_laboratories_1`
    FOREIGN KEY (`institution_lab` )
    REFERENCES `cenimarc_`.`inv_institutions` (`Id_institution` ),
  CONSTRAINT `FK_inv_laboratories_2`
    FOREIGN KEY (`country` )
    REFERENCES `cenimarc_`.`paises_0101` (`pai_id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cenimarc_`.`inv_laboratories_cruises`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cenimarc_`.`inv_laboratories_cruises` ;

CREATE  TABLE IF NOT EXISTS `cenimarc_`.`inv_laboratories_cruises` (
  `id_laboratory` INT(10) UNSIGNED NOT NULL ,
  `id_cruise` INT NOT NULL ,
  PRIMARY KEY (`id_laboratory`, `id_cruise`) ,
  INDEX `FK537ACF1E6FAB29A2` (`id_laboratory` ASC) ,
  INDEX `FK537ACF1EF0F27186` (`id_cruise` ASC) ,
  CONSTRAINT `FK537ACF1E6FAB29A2`
    FOREIGN KEY (`id_laboratory` )
    REFERENCES `cenimarc_`.`inv_laboratories` (`id_lab` ),
  CONSTRAINT `FK537ACF1EF0F27186`
    FOREIGN KEY (`id_cruise` )
    REFERENCES `cenimarc_`.`inv_cruise_inventory` (`id_cruise` ),
  CONSTRAINT `FK_inv_laboratories_cruises_1`
    FOREIGN KEY (`id_laboratory` )
    REFERENCES `cenimarc_`.`inv_laboratories` (`id_lab` ),
  CONSTRAINT `FK_inv_laboratories_cruises_2`
    FOREIGN KEY (`id_cruise` )
    REFERENCES `cenimarc_`.`inv_cruise_inventory` (`id_cruise` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cenimarc_`.`inv_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cenimarc_`.`inv_status` ;

CREATE  TABLE IF NOT EXISTS `cenimarc_`.`inv_status` (
  `id_status` SMALLINT(6) NOT NULL ,
  `status` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_status`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cenimarc_`.`inv_project`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cenimarc_`.`inv_project` ;

CREATE  TABLE IF NOT EXISTS `cenimarc_`.`inv_project` (
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
    REFERENCES `cenimarc_`.`inv_institutions` (`Id_institution` ),
  CONSTRAINT `FKDB0708CBA0233FC2`
    FOREIGN KEY (`id_status` )
    REFERENCES `cenimarc_`.`inv_status` (`id_status` ),
  CONSTRAINT `FK_inv_project_1`
    FOREIGN KEY (`id_status` )
    REFERENCES `cenimarc_`.`inv_status` (`id_status` ),
  CONSTRAINT `FK_inv_project_2`
    FOREIGN KEY (`id_institution` )
    REFERENCES `cenimarc_`.`inv_institutions` (`Id_institution` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cenimarc_`.`inv_status_indicators`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cenimarc_`.`inv_status_indicators` ;

CREATE  TABLE IF NOT EXISTS `cenimarc_`.`inv_status_indicators` (
  `STStatus` VARCHAR(2) NOT NULL ,
  `STDescription` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`STStatus`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cenimarc_`.`inv_inventory_project`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cenimarc_`.`inv_inventory_project` ;

CREATE  TABLE IF NOT EXISTS `cenimarc_`.`inv_inventory_project` (
  `id_inventory_project` INT NOT NULL AUTO_INCREMENT ,
  `id_project` INT(10) UNSIGNED NULL ,
  `id_cruise` INT NULL ,
  PRIMARY KEY (`id_inventory_project`) ,
  INDEX `fk_inv_inventory_project_inv_project1` (`id_project` ASC) ,
  INDEX `fk_inv_inventory_project_inv_cruise_inventory1` (`id_cruise` ASC) ,
  CONSTRAINT `fk_inv_inventory_project_inv_project1`
    FOREIGN KEY (`id_project` )
    REFERENCES `cenimarc_`.`inv_project` (`id_project` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inv_inventory_project_inv_cruise_inventory1`
    FOREIGN KEY (`id_cruise` )
    REFERENCES `cenimarc_`.`inv_cruise_inventory` (`id_cruise` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cenimarc_`.`inv_metadata`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cenimarc_`.`inv_metadata` ;

CREATE  TABLE IF NOT EXISTS `cenimarc_`.`inv_metadata` (
  `id_metadata` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`id_metadata`) )
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
