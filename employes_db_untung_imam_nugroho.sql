-- MySQL Script generated by MySQL Workbench
-- Tue Jul  2 18:39:00 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`departments` (
  `dept_no` CHAR(4) NOT NULL,
  `dept_name` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`dept_no`),
  INDEX `dept_name` ())
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `mydb`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`employees` (
  `emp_no` INT(11) NOT NULL,
  `birth_date` DATE NULL DEFAULT NULL,
  `first_name` VARCHAR(14) NULL DEFAULT NULL,
  `last_name` VARCHAR(16) NULL DEFAULT NULL,
  `gender` SET('M', 'F') NULL DEFAULT NULL,
  `hire_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`emp_no`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `mydb`.`dept_emp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`dept_emp` (
  `emp_no` INT(11) NOT NULL,
  `dept_no` CHAR(4) NOT NULL,
  `from_date` DATE NOT NULL,
  `to_date` DATE NOT NULL,
  `dept_empcol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`emp_no`, `dept_no`),
  INDEX `dept_no` (),
  CONSTRAINT `fk_emp_no`
    FOREIGN KEY (`emp_no`)
    REFERENCES `mydb`.`employees` (`emp_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dept_no`
    FOREIGN KEY (`dept_no`)
    REFERENCES `mydb`.`departments` (`dept_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `mydb`.`dept_manager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`dept_manager` (
  `dept_no` CHAR(4) NOT NULL,
  `emp_no` INT(11) NOT NULL,
  `from_date` DATE NOT NULL,
  `to_date` DATE NOT NULL,
  PRIMARY KEY (`dept_no`, `emp_no`),
  INDEX `dept_no` (),
  CONSTRAINT `dept_no`
    FOREIGN KEY (`dept_no`)
    REFERENCES `mydb`.`departments` (`dept_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `emp_no`
    FOREIGN KEY (`emp_no`)
    REFERENCES `mydb`.`employees` (`emp_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `mydb`.`salaries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`salaries` (
  `emp_no` INT(11) NOT NULL,
  `salary` INT(11) NOT NULL,
  `from_date` DATE NOT NULL,
  `to_date` DATE NOT NULL,
  PRIMARY KEY (`emp_no`, `from_date`),
  INDEX `emp_no` (`emp_no` ASC),
  CONSTRAINT `emp_no`
    FOREIGN KEY (`emp_no`)
    REFERENCES `mydb`.`employees` (`emp_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `mydb`.`titles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`titles` (
  `emp_no` INT(11) NOT NULL,
  `title` VARCHAR(50) NULL DEFAULT NULL,
  `from_date` DATE NULL DEFAULT NULL,
  `to_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`emp_no`),
  INDEX `emp_no` (),
  CONSTRAINT `emp_no`
    FOREIGN KEY (`emp_no`)
    REFERENCES `mydb`.`employees` (`emp_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
