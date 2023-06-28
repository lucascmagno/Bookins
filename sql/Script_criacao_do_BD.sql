-- MySQL Script generated by MySQL Workbench
-- Wed Jun 21 13:22:38 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bookins
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bookins
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bookins` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `bookins` ;

-- -----------------------------------------------------
-- Table `bookins`.`Livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookins`.`Livro` (
  `idLivro` INT NOT NULL AUTO_INCREMENT,
  `nomeLivro` VARCHAR(250) NOT NULL,
  `descricao_livro` VARCHAR(250) NOT NULL,
  `preco_livro` DOUBLE NOT NULL,
  PRIMARY KEY (`idLivro`),
  UNIQUE INDEX `nomeLivro_UNIQUE` (`nomeLivro` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bookins`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookins`.`Categoria` (
  `idCategoria` INT NOT NULL AUTO_INCREMENT,
  `nome_categoria` VARCHAR(75) NOT NULL,
  PRIMARY KEY (`idCategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bookins`.`CategoriaLivro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookins`.`CategoriaLivro` (
  `Livro_idLivro` INT NOT NULL,
  `Categoria_idCategoria` INT NOT NULL,
  PRIMARY KEY (`Livro_idLivro`, `Categoria_idCategoria`),
  INDEX `fk_Livro_has_Categoria_Categoria1_idx` (`Categoria_idCategoria` ASC) VISIBLE,
  INDEX `fk_Livro_has_Categoria_Livro_idx` (`Livro_idLivro` ASC) VISIBLE,
  CONSTRAINT `fk_Livro_has_Categoria_Livro`
    FOREIGN KEY (`Livro_idLivro`)
    REFERENCES `bookins`.`Livro` (`idLivro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Livro_has_Categoria_Categoria1`
    FOREIGN KEY (`Categoria_idCategoria`)
    REFERENCES `bookins`.`Categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bookins`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookins`.`usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(80) NOT NULL,
  `usuario` VARCHAR(50) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bookins`.`Estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookins`.`Estoque` (
  `idEstoque` INT NOT NULL AUTO_INCREMENT,
  `idLivro` INT NOT NULL,
  `quantidade` INT NULL,
  `total` DOUBLE NULL,
  PRIMARY KEY (`idEstoque`),
  INDEX `fk_Estoque_Livro1_idx` (`idLivro` ASC) VISIBLE,
  CONSTRAINT `fk_Estoque_Livro1`
    FOREIGN KEY (`idLivro`)
    REFERENCES `bookins`.`Livro` (`idLivro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bookins`.`Venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookins`.`Venda` (
  `idVenda` INT NOT NULL AUTO_INCREMENT,
  `idLivro` INT NOT NULL,
  `idUsuario` INT NOT NULL,
  `Estoque_idEstoque` INT NOT NULL,
  INDEX `fk_Estoque_has_CadastroCliente_Estoque1_idx` (`Estoque_idEstoque` ASC) VISIBLE,
  PRIMARY KEY (`idVenda`),
  INDEX `fk_Venda_Livro1_idx` (`idLivro` ASC) VISIBLE,
  INDEX `fk_Venda_usuario1_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Estoque_has_CadastroCliente_Estoque1`
    FOREIGN KEY (`Estoque_idEstoque`)
    REFERENCES `bookins`.`Estoque` (`idEstoque`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venda_Livro1`
    FOREIGN KEY (`idLivro`)
    REFERENCES `bookins`.`Livro` (`idLivro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venda_usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `bookins`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
