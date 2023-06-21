-- MySQL Script generated by MySQL Workbench
-- Tue Jun 20 22:43:02 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema wevcake
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema wevcake
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `wevcake` DEFAULT CHARACTER SET utf8 ;
USE `wevcake` ;

-- -----------------------------------------------------
-- Table `wevcake`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wevcake`.`usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `sobrenome` VARCHAR(50) NOT NULL,
  `email` VARCHAR(100) NULL,
  `telefone` VARCHAR(45) NULL,
  `senha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wevcake`.`bolo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wevcake`.`bolo` (
  `idBolo` INT NOT NULL AUTO_INCREMENT,
  `nomeBolo` VARCHAR(100) NOT NULL,
  `precoBolo` DOUBLE NULL,
  PRIMARY KEY (`idBolo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wevcake`.`venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wevcake`.`venda` (
  `idVenda` INT NOT NULL AUTO_INCREMENT,
  `idusuario` INT NOT NULL,
  `idbolo` INT NOT NULL,
  `data_venda` DATE NULL,
  INDEX `fk_usuario_has_bolo_bolo1_idx` (`idbolo` ASC) VISIBLE,
  INDEX `fk_usuario_has_bolo_usuario_idx` (`idusuario` ASC) VISIBLE,
  PRIMARY KEY (`idVenda`),
  CONSTRAINT `fk_usuario_has_bolo_usuario`
    FOREIGN KEY (`idusuario`)
    REFERENCES `wevcake`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_bolo_bolo1`
    FOREIGN KEY (`idbolo`)
    REFERENCES `wevcake`.`bolo` (`idBolo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
