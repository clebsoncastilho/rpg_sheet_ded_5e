-- MySQL Script generated by MySQL Workbench
-- Fri Jun 23 19:41:30 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema RPG
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `RPG` ;

-- -----------------------------------------------------
-- Schema RPG
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `RPG` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `RPG` ;
SELECT * FROM raca;
SELECT * FROM usuario;
-- -----------------------------------------------------
-- Table `RPG`.`usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RPG`.`usuario` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `RPG`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(256) NOT NULL,
  `senha` VARCHAR(200) NOT NULL,
  `tipo_usuario` VARCHAR(20) NOT NULL,
  `data_nascimento` DATE NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `email_UNIQUE` ON `RPG`.`usuario` (`email` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `RPG`.`raca`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RPG`.`raca` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `RPG`.`raca` (
  `id_raca` INT NOT NULL AUTO_INCREMENT,
  `nome_raca` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_raca`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `nome_raca_UNIQUE` ON `RPG`.`raca` (`nome_raca` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `RPG`.`personagem`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RPG`.`personagem` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `RPG`.`personagem` (
  `id_personagem` INT NOT NULL AUTO_INCREMENT,
  `id_usuario` INT NOT NULL,
  `id_raca` INT NOT NULL,
  `nome_personagem` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_personagem`),
  CONSTRAINT `fk_personagem_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `RPG`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_personagem_raca1`
    FOREIGN KEY (`id_raca`)
    REFERENCES `RPG`.`raca` (`id_raca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_personagem_usuario_idx` ON `RPG`.`personagem` (`id_usuario` ASC) VISIBLE;

SHOW WARNINGS;
CREATE INDEX `fk_personagem_raca1_idx` ON `RPG`.`personagem` (`id_raca` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `RPG`.`classe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RPG`.`classe` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `RPG`.`classe` (
  `id_classe` INT NOT NULL AUTO_INCREMENT,
  `nome_classe` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_classe`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `nome_classe_UNIQUE` ON `RPG`.`classe` (`nome_classe` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `RPG`.`classe_personagem`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RPG`.`classe_personagem` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `RPG`.`classe_personagem` (
  `id_classe_personagem` INT NOT NULL,
  `id_personagem` INT NOT NULL,
  `id_classe` INT NOT NULL,
  PRIMARY KEY (`id_classe_personagem`),
  CONSTRAINT `fk_classes_personagem_personagem1`
    FOREIGN KEY (`id_personagem`)
    REFERENCES `RPG`.`personagem` (`id_personagem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_classes_personagem_classe1`
    FOREIGN KEY (`id_classe`)
    REFERENCES `RPG`.`classe` (`id_classe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_classes_personagem_personagem1_idx` ON `RPG`.`classe_personagem` (`id_personagem` ASC) VISIBLE;

SHOW WARNINGS;
CREATE INDEX `fk_classes_personagem_classe1_idx` ON `RPG`.`classe_personagem` (`id_classe` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `RPG`.`atributos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RPG`.`atributos` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `RPG`.`atributos` (
  `id_atributos` INT NOT NULL AUTO_INCREMENT,
  `id_personagem` INT NOT NULL,
  `forca` INT NULL,
  `destreza` INT NULL,
  `constituicao` INT NULL,
  `inteligencia` INT NULL,
  `sabedoria` INT NULL,
  `carisma` INT NULL,
  `bonus_proficiencia` INT NULL,
  PRIMARY KEY (`id_atributos`),
  CONSTRAINT `fk_atributos_personagem1`
    FOREIGN KEY (`id_personagem`)
    REFERENCES `RPG`.`personagem` (`id_personagem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_atributos_personagem1_idx` ON `RPG`.`atributos` (`id_personagem` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `id_personagem_UNIQUE` ON `RPG`.`atributos` (`id_personagem` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `RPG`.`pericia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RPG`.`pericia` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `RPG`.`pericia` (
  `id_pericia` INT NOT NULL AUTO_INCREMENT,
  `nome_pericia` VARCHAR(45) NOT NULL,
  `status_uso` VARCHAR(45) NULL,
  PRIMARY KEY (`id_pericia`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `RPG`.`pericia_personagem`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RPG`.`pericia_personagem` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `RPG`.`pericia_personagem` (
  `id_pericia_personagem` INT NOT NULL AUTO_INCREMENT,
  `id_pericia` INT NOT NULL,
  `id_personagem` INT NOT NULL,
  PRIMARY KEY (`id_pericia_personagem`),
  CONSTRAINT `fk_perificia_personagem_pericia1`
    FOREIGN KEY (`id_pericia`)
    REFERENCES `RPG`.`pericia` (`id_pericia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_perificia_personagem_personagem1`
    FOREIGN KEY (`id_personagem`)
    REFERENCES `RPG`.`personagem` (`id_personagem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_perificia_personagem_pericia1_idx` ON `RPG`.`pericia_personagem` (`id_pericia` ASC) VISIBLE;

SHOW WARNINGS;
CREATE INDEX `fk_perificia_personagem_personagem1_idx` ON `RPG`.`pericia_personagem` (`id_personagem` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `RPG`.`espaco_magia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RPG`.`espaco_magia` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `RPG`.`espaco_magia` (
  `id_espaco_magia` INT NOT NULL AUTO_INCREMENT,
  `id_personagem` INT NOT NULL,
  `nivel_magia` INT NOT NULL,
  `qtd_utilizado` INT NULL,
  PRIMARY KEY (`id_espaco_magia`),
  CONSTRAINT `fk_espaco_magia_personagem1`
    FOREIGN KEY (`id_personagem`)
    REFERENCES `RPG`.`personagem` (`id_personagem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_espaco_magia_personagem1_idx` ON `RPG`.`espaco_magia` (`id_personagem` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `RPG`.`caracteristicas_personagem`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RPG`.`caracteristicas_personagem` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `RPG`.`caracteristicas_personagem` (
  `id_caracteristicas_personagem` INT NOT NULL AUTO_INCREMENT,
  `id_personagem` INT NOT NULL,
  `idade` INT NULL,
  `cor_olhos` VARCHAR(45) NULL,
  `cor_pele` VARCHAR(45) NULL,
  `cor_cabelo` VARCHAR(45) NULL,
  `peso` FLOAT NULL,
  `altura` FLOAT NULL,
  `imagem_personagem` VARCHAR(300) NULL,
  PRIMARY KEY (`id_caracteristicas_personagem`),
  CONSTRAINT `fk_caracteristicas_personagem_personagem1`
    FOREIGN KEY (`id_personagem`)
    REFERENCES `RPG`.`personagem` (`id_personagem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_caracteristicas_personagem_personagem1_idx` ON `RPG`.`caracteristicas_personagem` (`id_personagem` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `id_personagem_UNIQUE` ON `RPG`.`caracteristicas_personagem` (`id_personagem` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `RPG`.`tipo_dano`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RPG`.`tipo_dano` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `RPG`.`tipo_dano` (
  `id_tipo_dano` INT NOT NULL,
  `nome_tipo` VARCHAR(60) NULL,
  PRIMARY KEY (`id_tipo_dano`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `RPG`.`armas_personagem`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RPG`.`armas_personagem` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `RPG`.`armas_personagem` (
  `id_armas_personagem` INT NOT NULL,
  `id_personagem` INT NOT NULL,
  `id_tipo_dano` INT NOT NULL,
  `nome_arma` VARCHAR(45) NULL,
  `dado_dano` VARCHAR(12) NULL,
  `bonus` FLOAT NULL,
  `extra` VARCHAR(120) NULL,
  PRIMARY KEY (`id_armas_personagem`),
  CONSTRAINT `fk_armas_personagem_personagem1`
    FOREIGN KEY (`id_personagem`)
    REFERENCES `RPG`.`personagem` (`id_personagem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_armas_personagem_tipo_dano1`
    FOREIGN KEY (`id_tipo_dano`)
    REFERENCES `RPG`.`tipo_dano` (`id_tipo_dano`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_armas_personagem_personagem1_idx` ON `RPG`.`armas_personagem` (`id_personagem` ASC) VISIBLE;

SHOW WARNINGS;
CREATE INDEX `fk_armas_personagem_tipo_dano1_idx` ON `RPG`.`armas_personagem` (`id_tipo_dano` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `RPG`.`dinheiro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RPG`.`dinheiro` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `RPG`.`dinheiro` (
  `id_dinheiro` INT NOT NULL,
  `id_personagem` INT NOT NULL,
  `prata` FLOAT NULL,
  `ouro` FLOAT NULL,
  `cobre` FLOAT NULL,
  `platina` FLOAT NULL,
  `diamante` FLOAT NULL,
  PRIMARY KEY (`id_dinheiro`),
  CONSTRAINT `fk_dinheiro_personagem1`
    FOREIGN KEY (`id_personagem`)
    REFERENCES `RPG`.`personagem` (`id_personagem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_dinheiro_personagem1_idx` ON `RPG`.`dinheiro` (`id_personagem` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `id_personagem_UNIQUE` ON `RPG`.`dinheiro` (`id_personagem` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `RPG`.`status_base`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RPG`.`status_base` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `RPG`.`status_base` (
  `id_status_base` INT NOT NULL,
  `id_personagem` INT NOT NULL,
  `vida` INT NULL,
  `xp` DOUBLE NULL,
  `nivel` INT NULL,
  `alinhamento` VARCHAR(45) NULL,
  `antecendente` VARCHAR(45) NULL,
  `faccao` VARCHAR(45) NULL,
  `inspiracao` INT NULL,
  `ca` INT NULL,
  `iniciativa` INT NULL,
  `deslocamento` INT NULL,
  `vida_atual` INT NULL,
  `vida_temporaria` INT NULL,
  PRIMARY KEY (`id_status_base`),
  CONSTRAINT `fk_status_base_personagem1`
    FOREIGN KEY (`id_personagem`)
    REFERENCES `RPG`.`personagem` (`id_personagem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_status_base_personagem1_idx` ON `RPG`.`status_base` (`id_personagem` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `id_personagem_UNIQUE` ON `RPG`.`status_base` (`id_personagem` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `RPG`.`feitico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RPG`.`feitico` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `RPG`.`feitico` (
  `id_feitico` INT NOT NULL,
  `id_tipo_dano` INT NOT NULL,
  `nome_feitico` VARCHAR(45) NOT NULL,
  `tipo_feiticol` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_feitico`),
  CONSTRAINT `fk_feitico_tipo_dano1`
    FOREIGN KEY (`id_tipo_dano`)
    REFERENCES `RPG`.`tipo_dano` (`id_tipo_dano`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `nome_feitico_UNIQUE` ON `RPG`.`feitico` (`nome_feitico` ASC) VISIBLE;

SHOW WARNINGS;
CREATE INDEX `fk_feitico_tipo_dano1_idx` ON `RPG`.`feitico` (`id_tipo_dano` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `RPG`.`feitico_personagem`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RPG`.`feitico_personagem` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `RPG`.`feitico_personagem` (
  `id_feitico_personagem` INT NOT NULL AUTO_INCREMENT,
  `id_feitico` INT NOT NULL,
  `id_personagem` INT NOT NULL,
  PRIMARY KEY (`id_feitico_personagem`),
  CONSTRAINT `fk_feitico_personagem_feitico1`
    FOREIGN KEY (`id_feitico`)
    REFERENCES `RPG`.`feitico` (`id_feitico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_feitico_personagem_personagem1`
    FOREIGN KEY (`id_personagem`)
    REFERENCES `RPG`.`personagem` (`id_personagem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_feitico_personagem_feitico1_idx` ON `RPG`.`feitico_personagem` (`id_feitico` ASC) VISIBLE;

SHOW WARNINGS;
CREATE INDEX `fk_feitico_personagem_personagem1_idx` ON `RPG`.`feitico_personagem` (`id_personagem` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `RPG`.`salvaguarda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RPG`.`salvaguarda` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `RPG`.`salvaguarda` (
  `id_salvaguarda` INT NOT NULL AUTO_INCREMENT,
  `nome_salvaguarda` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_salvaguarda`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `nome_salvaguarda_UNIQUE` ON `RPG`.`salvaguarda` (`nome_salvaguarda` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `RPG`.`salvaguarda_personagem`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RPG`.`salvaguarda_personagem` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `RPG`.`salvaguarda_personagem` (
  `id_salvaguarda_personagem` INT NOT NULL AUTO_INCREMENT,
  `id_salvaguarda` INT NOT NULL,
  `id_personagem` INT NOT NULL,
  PRIMARY KEY (`id_salvaguarda_personagem`),
  CONSTRAINT `fk_salvaguarda_personagem_salvaguarda1`
    FOREIGN KEY (`id_salvaguarda`)
    REFERENCES `RPG`.`salvaguarda` (`id_salvaguarda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_salvaguarda_personagem_personagem1`
    FOREIGN KEY (`id_personagem`)
    REFERENCES `RPG`.`personagem` (`id_personagem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_salvaguarda_personagem_salvaguarda1_idx` ON `RPG`.`salvaguarda_personagem` (`id_salvaguarda` ASC) VISIBLE;

SHOW WARNINGS;
CREATE INDEX `fk_salvaguarda_personagem_personagem1_idx` ON `RPG`.`salvaguarda_personagem` (`id_personagem` ASC) VISIBLE;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
