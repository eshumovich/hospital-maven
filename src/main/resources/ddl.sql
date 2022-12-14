-- MySQL Script generated by MySQL Workbench
-- Tue Oct  4 12:35:05 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema hospitals_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hospitals_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hospitals_db` DEFAULT CHARACTER SET utf8 ;
USE `hospitals_db` ;

-- -----------------------------------------------------
-- Table `hospitals_db`.`adresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitals_db`.`adresses` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(50) NOT NULL,
  `house_number` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitals_db`.`head_physicians`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitals_db`.`head_physicians` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitals_db`.`hospitals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitals_db`.`hospitals` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `adress_id` BIGINT UNSIGNED NOT NULL,
  `head_physician_id` BIGINT UNSIGNED NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  INDEX `fk_hospitals_adresses1_idx` (`adress_id` ASC) VISIBLE,
  INDEX `fk_hospitals_head_physicians1_idx` (`head_physician_id` ASC) VISIBLE,
  CONSTRAINT `fk_hospitals_adresses1`
    FOREIGN KEY (`adress_id`)
    REFERENCES `hospitals_db`.`adresses` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hospitals_head_physicians1`
    FOREIGN KEY (`head_physician_id`)
    REFERENCES `hospitals_db`.`head_physicians` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitals_db`.`cards`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitals_db`.`cards` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `number` INT NOT NULL,
  `registration` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitals_db`.`contacts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitals_db`.`contacts` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `passport` VARCHAR(50) NOT NULL,
  `phone_number` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitals_db`.`patients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitals_db`.`patients` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `hospital_id` BIGINT UNSIGNED NOT NULL,
  `card_id` BIGINT UNSIGNED NOT NULL,
  `contact_id` BIGINT UNSIGNED NOT NULL,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `dob` DATE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_patients_hospitals_idx` (`hospital_id` ASC) VISIBLE,
  INDEX `fk_patients_cards1_idx` (`card_id` ASC) VISIBLE,
  INDEX `fk_patients_contacts1_idx` (`contact_id` ASC) VISIBLE,
  CONSTRAINT `fk_patients_hospitals`
    FOREIGN KEY (`hospital_id`)
    REFERENCES `hospitals_db`.`hospitals` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_patients_cards1`
    FOREIGN KEY (`card_id`)
    REFERENCES `hospitals_db`.`cards` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_patients_contacts1`
    FOREIGN KEY (`contact_id`)
    REFERENCES `hospitals_db`.`contacts` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitals_db`.`diseases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitals_db`.`diseases` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `price` DECIMAL NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitals_db`.`departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitals_db`.`departments` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `hospital_id` BIGINT UNSIGNED NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_departments_hospitals1_idx` (`hospital_id` ASC) VISIBLE,
  CONSTRAINT `fk_departments_hospitals1`
    FOREIGN KEY (`hospital_id`)
    REFERENCES `hospitals_db`.`hospitals` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitals_db`.`doctors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitals_db`.`doctors` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `department_id` BIGINT UNSIGNED NOT NULL,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `specification` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_doctors_departments1_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `fk_doctors_departments1`
    FOREIGN KEY (`department_id`)
    REFERENCES `hospitals_db`.`departments` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitals_db`.`reception_hours`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitals_db`.`reception_hours` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `department_id` BIGINT UNSIGNED NOT NULL,
  `receptionTime` DATE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_reception_hours_departments1_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `fk_reception_hours_departments1`
    FOREIGN KEY (`department_id`)
    REFERENCES `hospitals_db`.`departments` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitals_db`.`doctor_diseases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitals_db`.`doctor_diseases` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `doctor_id` BIGINT UNSIGNED NOT NULL,
  `disease_id` BIGINT UNSIGNED NOT NULL,
  INDEX `fk_doctors_has_diseases_diseases1_idx` (`disease_id` ASC) VISIBLE,
  INDEX `fk_doctors_has_diseases_doctors1_idx` (`doctor_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_doctors_has_diseases_doctors1`
    FOREIGN KEY (`doctor_id`)
    REFERENCES `hospitals_db`.`doctors` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_doctors_has_diseases_diseases1`
    FOREIGN KEY (`disease_id`)
    REFERENCES `hospitals_db`.`diseases` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
