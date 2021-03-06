-- MySQL Script generated by MySQL Workbench
-- jue 07 sep 2017 09:06:49 CDT
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema angeles
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema angeles
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `angeles` DEFAULT CHARACTER SET latin1 ;
USE `angeles` ;

-- -----------------------------------------------------
-- Table `angeles`.`comanda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `angeles`.`comanda` (
  `idcomanda` INT(11) NOT NULL AUTO_INCREMENT,
  `idepisodio` VARCHAR(45) NULL DEFAULT NULL,
  `idpaciente` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idcomanda`),
  UNIQUE INDEX `idcomanda_UNIQUE` (`idcomanda` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 120
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `angeles`.`diagnostico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `angeles`.`diagnostico` (
  `iddiagnostico` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(140) NULL DEFAULT NULL,
  `codigo_cie9` VARCHAR(10) NULL DEFAULT NULL,
  `codigo_cie10` VARCHAR(8) NULL DEFAULT NULL,
  PRIMARY KEY (`iddiagnostico`))
ENGINE = InnoDB
AUTO_INCREMENT = 4948
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `angeles`.`status_comanda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `angeles`.`status_comanda` (
  `idstatus_comanda` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idstatus_comanda`),
  UNIQUE INDEX `idstatus_comanda_UNIQUE` (`idstatus_comanda` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `angeles`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `angeles`.`usuario` (
  `idusuario` INT(11) NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(45) NULL DEFAULT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `hash` VARCHAR(66) NULL DEFAULT NULL,
  PRIMARY KEY (`idusuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `angeles`.`diagnostico_comanda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `angeles`.`diagnostico_comanda` (
  `iddiagnosticocomanda` INT(11) NOT NULL AUTO_INCREMENT,
  `status_comanda_idstatus_comanda` INT(11) NOT NULL,
  `usuario_idusuario` INT(11) NOT NULL,
  `diagnostico_iddiagnostico` INT(11) NOT NULL,
  `comanda_idcomanda` INT(11) NOT NULL,
  PRIMARY KEY (`iddiagnosticocomanda`, `status_comanda_idstatus_comanda`, `usuario_idusuario`, `diagnostico_iddiagnostico`, `comanda_idcomanda`),
  INDEX `fk_diagnostico_comanda_status_comanda1_idx` (`status_comanda_idstatus_comanda` ASC),
  INDEX `fk_diagnostico_comanda_usuario1_idx` (`usuario_idusuario` ASC),
  INDEX `fk_diagnostico_comanda_diagnostico1_idx` (`diagnostico_iddiagnostico` ASC),
  INDEX `fk_diagnostico_comanda_comanda1_idx` (`comanda_idcomanda` ASC),
  CONSTRAINT `fk_diagnostico_comanda_comanda1`
    FOREIGN KEY (`comanda_idcomanda`)
    REFERENCES `angeles`.`comanda` (`idcomanda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_diagnostico_comanda_diagnostico1`
    FOREIGN KEY (`diagnostico_iddiagnostico`)
    REFERENCES `angeles`.`diagnostico` (`iddiagnostico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_diagnostico_comanda_status_comanda1`
    FOREIGN KEY (`status_comanda_idstatus_comanda`)
    REFERENCES `angeles`.`status_comanda` (`idstatus_comanda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_diagnostico_comanda_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `angeles`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 133
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `angeles`.`gri`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `angeles`.`gri` (
  `idgri` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`idgri`),
  UNIQUE INDEX `idcategorianormalizada_UNIQUE` (`idgri` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 669
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `angeles`.`insumo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `angeles`.`insumo` (
  `idinsumo` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `codigo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idinsumo`),
  UNIQUE INDEX `idinsumo2_UNIQUE` (`idinsumo` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 1607
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `angeles`.`evaluacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `angeles`.`evaluacion` (
  `idevaluacion` INT(11) NOT NULL AUTO_INCREMENT,
  `insumo_idinsumo` INT(11) NOT NULL,
  `usuario_idusuario` INT(11) NOT NULL,
  `diagnostico_iddiagnostico` INT(11) NOT NULL,
  `gri_idgri` INT(11) NULL DEFAULT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `incidencia` TINYINT(4) NULL DEFAULT NULL,
  `extra` VARCHAR(100) NULL DEFAULT NULL,
  `check` INT(11) NOT NULL,
  PRIMARY KEY (`idevaluacion`, `insumo_idinsumo`, `usuario_idusuario`, `diagnostico_iddiagnostico`),
  UNIQUE INDEX `idevaluacion_UNIQUE` (`idevaluacion` ASC),
  INDEX `fk_evaluacion_insumo1_idx` (`insumo_idinsumo` ASC),
  INDEX `fk_evaluacion_usuario1_idx` (`usuario_idusuario` ASC),
  INDEX `fk_evaluacion_diagnostico1_idx` (`diagnostico_iddiagnostico` ASC),
  INDEX `fk_evaluacion_gri1` (`gri_idgri` ASC),
  CONSTRAINT `fk_evaluacion_gri1`
    FOREIGN KEY (`gri_idgri`)
    REFERENCES `angeles`.`gri` (`idgri`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_evaluacion_diagnostico1`
    FOREIGN KEY (`diagnostico_iddiagnostico`)
    REFERENCES `angeles`.`diagnostico` (`iddiagnostico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_evaluacion_insumo1`
    FOREIGN KEY (`insumo_idinsumo`)
    REFERENCES `angeles`.`insumo` (`idinsumo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_evaluacion_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `angeles`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 23
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `angeles`.`incidencias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `angeles`.`incidencias` (
  `idincidencias` INT(11) NOT NULL AUTO_INCREMENT,
  `status_comanda_idstatus_comanda` INT(11) NOT NULL,
  `usuario_idusuario` INT(11) NOT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`idincidencias`, `status_comanda_idstatus_comanda`, `usuario_idusuario`),
  UNIQUE INDEX `idincidencias_UNIQUE` (`idincidencias` ASC),
  INDEX `fk_incidencias_status_comanda1_idx` (`status_comanda_idstatus_comanda` ASC),
  INDEX `fk_incidencias_usuario1_idx` (`usuario_idusuario` ASC),
  CONSTRAINT `fk_incidencias_status_comanda1`
    FOREIGN KEY (`status_comanda_idstatus_comanda`)
    REFERENCES `angeles`.`status_comanda` (`idstatus_comanda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_incidencias_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `angeles`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `angeles`.`registro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `angeles`.`registro` (
  `idregistro` INT(11) NOT NULL AUTO_INCREMENT,
  `comanda_idcomanda` INT(11) NOT NULL,
  `insum_idinsumo` INT(11) NOT NULL,
  `fecha_inicio` VARCHAR(45) NULL DEFAULT NULL,
  `fecha_fin` VARCHAR(45) NULL DEFAULT NULL,
  `cantidad` VARCHAR(45) NULL DEFAULT NULL,
  `unidad` VARCHAR(45) NULL DEFAULT NULL,
  `importe` DOUBLE NULL DEFAULT NULL,
  `repeticiones` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idregistro`, `comanda_idcomanda`, `insum_idinsumo`),
  UNIQUE INDEX `idinsumo_UNIQUE` (`idregistro` ASC),
  INDEX `fk_insumo_insumo21_idx` (`insum_idinsumo` ASC),
  INDEX `fk_registro_comanda1_idx` (`comanda_idcomanda` ASC),
  CONSTRAINT `fk_insumo_insumo21`
    FOREIGN KEY (`insum_idinsumo`)
    REFERENCES `angeles`.`insumo` (`idinsumo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_registro_comanda1`
    FOREIGN KEY (`comanda_idcomanda`)
    REFERENCES `angeles`.`comanda` (`idcomanda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 19241
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
