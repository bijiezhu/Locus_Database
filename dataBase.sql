-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`PassWord`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PassWord` ;

CREATE TABLE IF NOT EXISTS `mydb`.`PassWord` (
  `idPassWord` INT NOT NULL AUTO_INCREMENT,
  `UserName` VARCHAR(200) NOT NULL,
  `PassWord` VARCHAR(200) NULL,
  PRIMARY KEY (`idPassWord`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`UserProfile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`UserProfile` ;

CREATE TABLE IF NOT EXISTS `mydb`.`UserProfile` (
  `idUserProfile` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NULL,
  `LastName` VARCHAR(45) NULL,
  `MiddleName` VARCHAR(45) NULL,
  `PassWord_idPassWord` INT NOT NULL,
  PRIMARY KEY (`idUserProfile`),
  INDEX `fk_UserProfile_PassWord_idx` (`PassWord_idPassWord` ASC),
  CONSTRAINT `fk_UserProfile_PassWord`
    FOREIGN KEY (`PassWord_idPassWord`)
    REFERENCES `mydb`.`PassWord` (`idPassWord`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Location` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Location` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Latitude` FLOAT NULL,
  `Longtitude` FLOAT NULL,
  `UserProfile_idUserProfile` INT NOT NULL,
  PRIMARY KEY (`id`, `UserProfile_idUserProfile`),
  INDEX `fk_Location_UserProfile1_idx` (`UserProfile_idUserProfile` ASC),
  CONSTRAINT `fk_Location_UserProfile1`
    FOREIGN KEY (`UserProfile_idUserProfile`)
    REFERENCES `mydb`.`UserProfile` (`idUserProfile`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
