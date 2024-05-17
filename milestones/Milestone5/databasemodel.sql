-- MySQL Script generated by MySQL Workbench
-- Thu May 16 00:04:23 2024
-- Model: HospitalManagementDatabase    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema HospitalManagementDB
-- -----------------------------------------------------
DROP DATABASE IF EXISTS HospitalManagementDB;
CREATE DATABASE IF NOT EXISTS HospitalManagementDB;
USE HospitalManagementDB;
-- -----------------------------------------------------
-- Table `Hospital`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Hospital` ;

CREATE TABLE IF NOT EXISTS `Hospital` (
  `hospital_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`hospital_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Employee` ;

CREATE TABLE IF NOT EXISTS `Employee` (
  `employee_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_name` VARCHAR(255) NOT NULL,
  `hospital` INT UNSIGNED NOT NULL,
  `department` INT UNSIGNED NULL,
  `bio` VARCHAR(255) NULL,
  `email` VARCHAR(255) NULL,
  PRIMARY KEY (`employee_id`),
  INDEX `FK_EMPLOYEE_DEPARTMENT_idx` (`department` ASC) VISIBLE,
  INDEX `FK_EMPLOYEE_HOSPITAL_idx` (`hospital` ASC) VISIBLE,
  CONSTRAINT `FK_EMPLOYEE_DEPARTMENT`
    FOREIGN KEY (`department`)
    REFERENCES `Department` (`department_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `FK_EMPLOYEE_HOSPITAL`
    FOREIGN KEY (`hospital`)
    REFERENCES `Hospital` (`hospital_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Department` ;

CREATE TABLE IF NOT EXISTS `Department` (
  `department_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `hospital` INT UNSIGNED NULL,
  `name` VARCHAR(255) NOT NULL,
  `manager` INT UNSIGNED NULL,
  PRIMARY KEY (`department_id`),
  UNIQUE INDEX `manager_UNIQUE` (`manager` ASC) VISIBLE,
  CONSTRAINT `FK_DEPARTMENT_HOSPITAL`
    FOREIGN KEY (`hospital`)
    REFERENCES `Hospital` (`hospital_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `FK_DEPARTMENT_EMPLOYEE`
    FOREIGN KEY (`manager`)
    REFERENCES `Employee` (`employee_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Doctor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Doctor` ;

CREATE TABLE IF NOT EXISTS `Doctor` (
  `doctor_id` INT UNSIGNED NOT NULL,
  `specialization` VARCHAR(255) NULL,
  `license_number` VARCHAR(255) NULL,
  PRIMARY KEY (`doctor_id`),
  CONSTRAINT `FKPK_DOCTOR_EMPLOYEE`
    FOREIGN KEY (`doctor_id`)
    REFERENCES `Employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Nurse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Nurse` ;

CREATE TABLE IF NOT EXISTS `Nurse` (
  `nurse_id` INT UNSIGNED NOT NULL,
  `qualification` VARCHAR(255) NULL,
  `specialized_area` VARCHAR(255) NULL,
  PRIMARY KEY (`nurse_id`),
  CONSTRAINT `FKPK_NURSE_EMPLOYEE`
    FOREIGN KEY (`nurse_id`)
    REFERENCES `Employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Patient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Patient` ;

CREATE TABLE IF NOT EXISTS `Patient` (
  `patient_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `patient_name` VARCHAR(255) NOT NULL,
  `patient_DOB` DATE NULL,
  `contact_number` VARCHAR(15) NULL,
  PRIMARY KEY (`patient_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicalRecord`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MedicalRecord` ;

CREATE TABLE IF NOT EXISTS `MedicalRecord` (
  `medicalRecord_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `patient` INT UNSIGNED NOT NULL,
  `doctor` INT UNSIGNED NULL,
  `record_date` DATE NULL,
  `notes` TEXT NULL,
  PRIMARY KEY (`medicalRecord_id`),
  INDEX `FK_MEDICALRECORD_PATIENT_idx` (`patient` ASC) VISIBLE,
  INDEX `FK_MEDICALRECORD_DOCTOR_idx` (`doctor` ASC) VISIBLE,
  CONSTRAINT `FK_MEDICALRECORD_PATIENT`
    FOREIGN KEY (`patient`)
    REFERENCES `Patient` (`patient_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_MEDICALRECORD_DOCTOR`
    FOREIGN KEY (`doctor`)
    REFERENCES `Doctor` (`doctor_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Prescription`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Prescription` ;

CREATE TABLE IF NOT EXISTS `Prescription` (
  `prescription_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `medical_record` INT UNSIGNED NOT NULL,
  `medication_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`prescription_id`),
  INDEX `FK_PRESCRIPTION_MEDICALRECORD_idx` (`medical_record` ASC) VISIBLE,
  CONSTRAINT `FK_PRESCRIPTION_MEDICALRECORD`
    FOREIGN KEY (`medical_record`)
    REFERENCES `MedicalRecord` (`medicalRecord_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Appointment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Appointment` ;

CREATE TABLE IF NOT EXISTS `Appointment` (
  `appointment_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `patient` INT UNSIGNED NOT NULL,
  `doctor` INT UNSIGNED NOT NULL,
  `equipment` INT UNSIGNED NULL,
  `appointment_date` DATE NOT NULL,
  `appointment_time` TIME NOT NULL,
  PRIMARY KEY (`appointment_id`),
  INDEX `FK_APPOINTMENT_PATIENT_idx` (`patient` ASC) VISIBLE,
  INDEX `FK_APPOINTMENT_DOCTOR_idx` (`doctor` ASC) VISIBLE,
  CONSTRAINT `FK_APPOINTMENT_PATIENT`
    FOREIGN KEY (`patient`)
    REFERENCES `Patient` (`patient_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_APPOINTMENT_DOCTOR`
    FOREIGN KEY (`doctor`)
    REFERENCES `Doctor` (`doctor_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `InventoryManager`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `InventoryManager` ;

CREATE TABLE IF NOT EXISTS `InventoryManager` (
  `inventory_manager_id` INT UNSIGNED NOT NULL,
  `assigned_warehouses` TEXT NULL,
  `areas_of_responsibility` TEXT NULL,
  PRIMARY KEY (`inventory_manager_id`),
  CONSTRAINT `FKPK_INVENTORYMANAGER_EMPLOYEE`
    FOREIGN KEY (`inventory_manager_id`)
    REFERENCES `Employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Equipment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Equipment` ;

CREATE TABLE IF NOT EXISTS `Equipment` (
  `equipment_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `department` INT UNSIGNED NULL,
  `appointment` INT UNSIGNED NULL,
  `managed_by` INT UNSIGNED NULL,
  INDEX `FK_EQUIPMENT_DEPARTMENT_idx` (`department` ASC) VISIBLE,
  INDEX `FK_EQUIPMENT_APPOINTMENT_idx` (`appointment` ASC) VISIBLE,
  INDEX `FK_EQUIPMENT_INVENTORYMANAGER_idx` (`managed_by` ASC) VISIBLE,
  PRIMARY KEY (`equipment_id`),
  CONSTRAINT `FK_EQUIPMENT_DEPARTMENT`
    FOREIGN KEY (`department`)
    REFERENCES `Department` (`department_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `FK_EQUIPMENT_APPOINTMENT`
    FOREIGN KEY (`appointment`)
    REFERENCES `Appointment` (`appointment_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `FK_EQUIPMENT_INVENTORYMANAGER`
    FOREIGN KEY (`managed_by`)
    REFERENCES `InventoryManager` (`inventory_manager_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `InsurancePlan`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `InsurancePlan` ;

CREATE TABLE IF NOT EXISTS `InsurancePlan` (
  `insurance_plan_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `plan_name` VARCHAR(255) NOT NULL,
  `provider` VARCHAR(45) NOT NULL,
  `policy` TEXT NOT NULL,
  PRIMARY KEY (`insurance_plan_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `InsuranceRecord`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `InsuranceRecord` ;

CREATE TABLE IF NOT EXISTS `InsuranceRecord` (
  `insurance_record_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `patient` INT UNSIGNED NOT NULL,
  `insurance_plan` INT UNSIGNED NOT NULL,
  `expiration_date` DATE NOT NULL,
  PRIMARY KEY (`insurance_record_id`),
  INDEX `FK_INSURANCERECORD_PATIENT_idx` (`patient` ASC) VISIBLE,
  INDEX `FK_INSURANCERECORD_INSURANCEPLAN_idx` (`insurance_plan` ASC) VISIBLE,
  CONSTRAINT `FK_INSURANCERECORD_PATIENT`
    FOREIGN KEY (`patient`)
    REFERENCES `Patient` (`patient_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_INSURANCERECORD_INSURANCEPLAN`
    FOREIGN KEY (`insurance_plan`)
    REFERENCES `InsurancePlan` (`insurance_plan_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PharmacyStaff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PharmacyStaff` ;

CREATE TABLE IF NOT EXISTS `PharmacyStaff` (
  `pharmacy_staff_id` INT UNSIGNED NOT NULL,
  `qualifications` TEXT NULL,
  `specialization_area` VARCHAR(255) NULL,
  PRIMARY KEY (`pharmacy_staff_id`),
  CONSTRAINT `FKPK_PHARMACYSTAFF_EMPLOYEE`
    FOREIGN KEY (`pharmacy_staff_id`)
    REFERENCES `Employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Medication`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Medication` ;

CREATE TABLE IF NOT EXISTS `Medication` (
  `medication_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `managed_by` INT UNSIGNED NULL,
  `type` VARCHAR(45) NULL,
  `expiration_date` DATE NULL,
  `stock_level` INT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`medication_id`),
  INDEX `FK_MEDICATION_PHARMACYSTAFF_idx` (`managed_by` ASC) VISIBLE,
  CONSTRAINT `FK_MEDICATION_PHARMACYSTAFF`
    FOREIGN KEY (`managed_by`)
    REFERENCES `PharmacyStaff` (`pharmacy_staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `InsuranceContract`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `InsuranceContract` ;

CREATE TABLE IF NOT EXISTS `InsuranceContract` (
  `insurance_contract_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `insurance_plan` INT UNSIGNED NOT NULL,
  `patient` INT UNSIGNED NOT NULL,
  `annual_coverage_limit` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`insurance_contract_id`),
  INDEX `FK_INSURANCECONTRACT_INSURANCEPLAN_idx` (`insurance_plan` ASC) VISIBLE,
  INDEX `FK_INSURANCECONTRACT_PATIENT_idx` (`patient` ASC) VISIBLE,
  CONSTRAINT `FK_INSURANCECONTRACT_INSURANCEPLAN`
    FOREIGN KEY (`insurance_plan`)
    REFERENCES `InsurancePlan` (`insurance_plan_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_INSURANCECONTRACT_PATIENT`
    FOREIGN KEY (`patient`)
    REFERENCES `Patient` (`patient_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PrescriptionMedication`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PrescriptionMedication` ;

CREATE TABLE IF NOT EXISTS `PrescriptionMedication` (
  `prescription_medication_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `prescription` INT UNSIGNED NOT NULL,
  `medication` INT UNSIGNED NOT NULL,
  `dosage` VARCHAR(255) NOT NULL,
  `frequency` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`prescription_medication_id`),
  INDEX `FK_PRESCRIPTIONMEDICATION_PRESCRIPTION_idx` (`prescription` ASC) VISIBLE,
  INDEX `FK_PRESCRIPTIONMEDICATION_MEDICATION_idx` (`medication` ASC) VISIBLE,
  CONSTRAINT `FK_PRESCRIPTIONMEDICATION_PRESCRIPTION`
    FOREIGN KEY (`prescription`)
    REFERENCES `Prescription` (`prescription_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_PRESCRIPTIONMEDICATION_MEDICATION`
    FOREIGN KEY (`medication`)
    REFERENCES `Medication` (`medication_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;