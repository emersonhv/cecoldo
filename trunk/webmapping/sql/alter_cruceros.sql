SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

ALTER TABLE `cenimarc_`.`inv_cruise_inventory` DROP FOREIGN KEY `FK_inv_cruise_inventory_8` , DROP FOREIGN KEY `FK99F05D00218CF214` ;

ALTER TABLE `cenimarc_`.`inv_cruise_inventory` DROP COLUMN `id_project` , DROP COLUMN `uri_project` , DROP COLUMN `uri_metadata` 
, DROP INDEX `FK99F05D00218CF214` ;

ALTER TABLE `cenimarc_`.`inv_project` ADD COLUMN `description` VARCHAR(255) NULL DEFAULT NULL  AFTER `uri_project` ;

CREATE  TABLE IF NOT EXISTS `cenimarc_`.`inv_inventory_project` (
  `id_inventory_project` INT(11) NOT NULL AUTO_INCREMENT ,
  `id_project` INT(10) UNSIGNED NOT NULL ,
  `id_cruise` CHAR(10) NOT NULL ,
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
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE  TABLE IF NOT EXISTS `cenimarc_`.`inv_metadata` (
  `id_metadata` INT(11) NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`id_metadata`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
