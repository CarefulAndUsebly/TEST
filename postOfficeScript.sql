-- MySQL Script generated by MySQL Workbench
-- Mon May  2 12:34:06 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema postModel
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema postModel
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `postModel` DEFAULT CHARACTER SET utf8 ;
USE `postModel` ;

-- -----------------------------------------------------
-- Table `postModel`.`Countrys`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `postModel`.`Countrys` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `Countryscol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `postModel`.`Citys`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `postModel`.`Citys` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `Countrys_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Citys_Countrys1_idx` (`Countrys_id` ASC) VISIBLE,
  CONSTRAINT `fk_Citys_Countrys1`
    FOREIGN KEY (`Countrys_id`)
    REFERENCES `postModel`.`Countrys` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `postModel`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `postModel`.`Address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(45) NULL,
  `district` VARCHAR(45) NULL,
  `postalCode` INT(10) NULL,
  `Citys_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Address_Citys1_idx` (`Citys_id` ASC) VISIBLE,
  CONSTRAINT `fk_Address_Citys1`
    FOREIGN KEY (`Citys_id`)
    REFERENCES `postModel`.`Citys` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `postModel`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `postModel`.`Customer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NULL,
  `lastName` VARCHAR(45) NULL,
  `Address_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Customer_Address1_idx` (`Address_id` ASC) VISIBLE,
  CONSTRAINT `fk_Customer_Address1`
    FOREIGN KEY (`Address_id`)
    REFERENCES `postModel`.`Address` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `postModel`.`PostalOffices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `postModel`.`PostalOffices` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `phone` INT(14) NULL,
  `type` VARCHAR(10) NULL,
  `Address_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_postalOffice_Address_idx` (`Address_id` ASC) VISIBLE,
  CONSTRAINT `fk_postalOffice_Address`
    FOREIGN KEY (`Address_id`)
    REFERENCES `postModel`.`Address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `postModel`.`Stuffs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `postModel`.`Stuffs` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NULL,
  `lastName` VARCHAR(45) NULL,
  `position` VARCHAR(45) NULL,
  `phoneNumberl` VARCHAR(45) NULL,
  `PostalOffices_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Stuffs_PostalOffices_idx` (`PostalOffices_id` ASC) VISIBLE,
  CONSTRAINT `fk_Stuffs_PostalOffices`
    FOREIGN KEY (`PostalOffices_id`)
    REFERENCES `postModel`.`PostalOffices` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `postModel`.`Payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `postModel`.`Payments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `amount` DECIMAL(8,2) NULL,
  `paymentDate` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `postModel`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `postModel`.`Orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `createDate` DATETIME NULL,
  `sender` VARCHAR(45) NOT NULL,
  `recipient` VARCHAR(45) NOT NULL,
  `Customer_id` INT NOT NULL,
  `Stuffs_id` INT NOT NULL,
  `Payments_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Orders_Customer1_idx` (`Customer_id` ASC) VISIBLE,
  INDEX `fk_Orders_Stuffs1_idx` (`Stuffs_id` ASC) VISIBLE,
  INDEX `fk_Orders_Payments1_idx` (`Payments_id` ASC) INVISIBLE,
  CONSTRAINT `fk_Orders_Customer1`
    FOREIGN KEY (`Customer_id`)
    REFERENCES `postModel`.`Customer` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Orders_Stuffs1`
    FOREIGN KEY (`Stuffs_id`)
    REFERENCES `postModel`.`Stuffs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Payments`
    FOREIGN KEY (`Payments_id`)
    REFERENCES `postModel`.`Payments` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `postModel`.`Categorys`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `postModel`.`Categorys` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `size` VARCHAR(45) NULL,
  `weight` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `postModel`.`Packages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `postModel`.`Packages` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `options` VARCHAR(80) NULL,
  `insuranceAmount` DECIMAL(10,2) NULL,
  `status` VARCHAR(45) NULL,
  `Categorys_id` INT NOT NULL,
  `Orders_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Packages_Categorys_idx` (`Categorys_id` ASC) VISIBLE,
  INDEX `fk_Packages_Orders_idx` (`Orders_id` ASC) VISIBLE,
  CONSTRAINT `fk_Packages_Categorys`
    FOREIGN KEY (`Categorys_id`)
    REFERENCES `postModel`.`Categorys` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Packages_Orders`
    FOREIGN KEY (`Orders_id`)
    REFERENCES `postModel`.`Orders` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `postModel`.`СargoLists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `postModel`.`СargoLists` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `СargoList` VARCHAR(45) NULL,
  `Packages_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_СargoLists_Packages1_idx` (`Packages_id` ASC) VISIBLE,
  CONSTRAINT `fk_СargoLists_Packages1`
    FOREIGN KEY (`Packages_id`)
    REFERENCES `postModel`.`Packages` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `postModel`.`Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `postModel`.`Cars` (
  `idCars` INT NOT NULL AUTO_INCREMENT,
  `model` VARCHAR(45) NOT NULL,
  `year` VARCHAR(4) NOT NULL,
  `capasity` INT(4) NOT NULL,
  `Carscol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCars`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `postModel`.`Routesheets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `postModel`.`Routesheets` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `addressList` VARCHAR(80) NULL,
  `СargoLists_id` INT NOT NULL,
  `stardAddress` VARCHAR(45) NULL,
  `finishAddress` VARCHAR(45) NULL,
  `Cars_idCars` INT NOT NULL,
  `Stuffs_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Routesheets_СargoLists_idx` (`СargoLists_id` ASC) VISIBLE,
  INDEX `fk_Routesheets_Cars_idx` (`Cars_idCars` ASC) VISIBLE,
  INDEX `fk_Routesheets_Stuffs_idx` (`Stuffs_id` ASC) VISIBLE,
  CONSTRAINT `fk_Routesheets_СargoLists`
    FOREIGN KEY (`СargoLists_id`)
    REFERENCES `postModel`.`СargoLists` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Routesheets_Cars`
    FOREIGN KEY (`Cars_idCars`)
    REFERENCES `postModel`.`Cars` (`idCars`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Routesheets_Stuffs`
    FOREIGN KEY (`Stuffs_id`)
    REFERENCES `postModel`.`Stuffs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `postModel`;

DELIMITER $$
USE `postModel`$$
CREATE DEFINER = CURRENT_USER TRIGGER `postModel`.`Orders_AFTER_DELETE` AFTER DELETE ON `Orders` FOR EACH ROW
BEGIN

END
$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
