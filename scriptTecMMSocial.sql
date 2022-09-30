-- MySQL Script generated by MySQL Workbench
-- Fri Apr 23 11:22:54 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Administrativo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Administrativo` (
  `id_administrativo` INT NOT NULL,
  `departamento` VARCHAR(50) NULL,
  `Administrativocol` VARCHAR(45) NULL,
  PRIMARY KEY (`id_administrativo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Docente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Docente` (
  `id_docente` INT NOT NULL,
  `numerodecontrol` INT NULL,
  PRIMARY KEY (`id_docente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Carrera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Carrera` (
  `id_carrera` INT NOT NULL,
  `nombre_carrera` VARCHAR(100) NULL,
  `codigo` VARCHAR(15) NULL,
  `Docente_id_docente` INT NOT NULL,
  PRIMARY KEY (`id_carrera`, `Docente_id_docente`),
  INDEX `fk_Carrera_Docente1_idx` (`Docente_id_docente` ASC) VISIBLE,
  CONSTRAINT `fk_Carrera_Docente1`
    FOREIGN KEY (`Docente_id_docente`)
    REFERENCES `mydb`.`Docente` (`id_docente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Estudiante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Estudiante` (
  `id_estudiante` INT NOT NULL,
  `numero de control` INT(8) NULL,
  `Carrera_id_carrera` INT NOT NULL,
  `Carrera_Docente_id_docente` INT NOT NULL,
  PRIMARY KEY (`id_estudiante`, `Carrera_id_carrera`, `Carrera_Docente_id_docente`),
  INDEX `fk_Estudiante_Carrera1_idx` (`Carrera_id_carrera` ASC, `Carrera_Docente_id_docente` ASC) VISIBLE,
  CONSTRAINT `fk_Estudiante_Carrera1`
    FOREIGN KEY (`Carrera_id_carrera` , `Carrera_Docente_id_docente`)
    REFERENCES `mydb`.`Carrera` (`id_carrera` , `Docente_id_docente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `id_usuario` INT NOT NULL,
  `correo_instituccional` VARCHAR(50) NULL,
  `alias` VARCHAR(15) NULL,
  `nombre` VARCHAR(50) NULL,
  `apellido_paterno` VARCHAR(30) NULL,
  `apellido_materno` VARCHAR(30) NULL,
  `contrasenia` VARCHAR(20) NULL,
  `imagen_perfil` MEDIUMBLOB NULL,
  `Administrativo_id_administrativo` INT NOT NULL,
  `Docente_id_docente` INT NOT NULL,
  `Estudiante_id_estudiante` INT NOT NULL,
  PRIMARY KEY (`id_usuario`, `Administrativo_id_administrativo`, `Docente_id_docente`, `Estudiante_id_estudiante`),
  INDEX `fk_Usuario_Administrativo_idx` (`Administrativo_id_administrativo` ASC) VISIBLE,
  INDEX `fk_Usuario_Docente1_idx` (`Docente_id_docente` ASC) VISIBLE,
  INDEX `fk_Usuario_Estudiante1_idx` (`Estudiante_id_estudiante` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_Administrativo`
    FOREIGN KEY (`Administrativo_id_administrativo`)
    REFERENCES `mydb`.`Administrativo` (`id_administrativo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Docente1`
    FOREIGN KEY (`Docente_id_docente`)
    REFERENCES `mydb`.`Docente` (`id_docente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Estudiante1`
    FOREIGN KEY (`Estudiante_id_estudiante`)
    REFERENCES `mydb`.`Estudiante` (`id_estudiante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Nota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Nota` (
  `id_nota` INT NOT NULL,
  `contenido` VARCHAR(30) NULL,
  `Usuario_id_usuario` INT NOT NULL,
  `Usuario_Administrativo_id_administrativo` INT NOT NULL,
  `Usuario_Docente_id_docente` INT NOT NULL,
  `Usuario_Estudiante_id_estudiante` INT NOT NULL,
  PRIMARY KEY (`id_nota`, `Usuario_id_usuario`, `Usuario_Administrativo_id_administrativo`, `Usuario_Docente_id_docente`, `Usuario_Estudiante_id_estudiante`),
  INDEX `fk_Nota_Usuario1_idx` (`Usuario_id_usuario` ASC, `Usuario_Administrativo_id_administrativo` ASC, `Usuario_Docente_id_docente` ASC, `Usuario_Estudiante_id_estudiante` ASC) VISIBLE,
  CONSTRAINT `fk_Nota_Usuario1`
    FOREIGN KEY (`Usuario_id_usuario` , `Usuario_Administrativo_id_administrativo` , `Usuario_Docente_id_docente` , `Usuario_Estudiante_id_estudiante`)
    REFERENCES `mydb`.`Usuario` (`id_usuario` , `Administrativo_id_administrativo` , `Docente_id_docente` , `Estudiante_id_estudiante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Materia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Materia` (
  `id_materia` INT NOT NULL,
  `nombre` VARCHAR(50) NULL,
  PRIMARY KEY (`id_materia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Grupo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Grupo` (
  `id_grupo` INT NOT NULL,
  `tipo` VARCHAR(2) NULL,
  `codigo` VARCHAR(8) NULL,
  `Docente_id_docente` INT NOT NULL,
  `Estudiante_id_estudiante` INT NOT NULL,
  `Estudiante_Carrera_id_carrera` INT NOT NULL,
  `Estudiante_Carrera_Docente_id_docente` INT NOT NULL,
  `Materia_id_materia` INT NOT NULL,
  PRIMARY KEY (`id_grupo`, `Docente_id_docente`, `Estudiante_id_estudiante`, `Estudiante_Carrera_id_carrera`, `Estudiante_Carrera_Docente_id_docente`, `Materia_id_materia`),
  INDEX `fk_Grupo_Docente1_idx` (`Docente_id_docente` ASC) VISIBLE,
  INDEX `fk_Grupo_Estudiante1_idx` (`Estudiante_id_estudiante` ASC, `Estudiante_Carrera_id_carrera` ASC, `Estudiante_Carrera_Docente_id_docente` ASC) VISIBLE,
  INDEX `fk_Grupo_Materia1_idx` (`Materia_id_materia` ASC) VISIBLE,
  CONSTRAINT `fk_Grupo_Docente1`
    FOREIGN KEY (`Docente_id_docente`)
    REFERENCES `mydb`.`Docente` (`id_docente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Grupo_Estudiante1`
    FOREIGN KEY (`Estudiante_id_estudiante` , `Estudiante_Carrera_id_carrera` , `Estudiante_Carrera_Docente_id_docente`)
    REFERENCES `mydb`.`Estudiante` (`id_estudiante` , `Carrera_id_carrera` , `Carrera_Docente_id_docente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Grupo_Materia1`
    FOREIGN KEY (`Materia_id_materia`)
    REFERENCES `mydb`.`Materia` (`id_materia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Publicacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Publicacion` (
  `id_publicacion` INT NOT NULL,
  `contenido` VARCHAR(144) NULL,
  `contador_vistas` INT NULL,
  `Usuario_id_usuario` INT NOT NULL,
  `Usuario_Administrativo_id_administrativo` INT NOT NULL,
  `Usuario_Docente_id_docente` INT NOT NULL,
  `Usuario_Estudiante_id_estudiante` INT NOT NULL,
  `Grupo_id_grupo` INT NOT NULL,
  PRIMARY KEY (`id_publicacion`, `Usuario_id_usuario`, `Usuario_Administrativo_id_administrativo`, `Usuario_Docente_id_docente`, `Usuario_Estudiante_id_estudiante`, `Grupo_id_grupo`),
  INDEX `fk_Publicacion_Usuario1_idx` (`Usuario_id_usuario` ASC, `Usuario_Administrativo_id_administrativo` ASC, `Usuario_Docente_id_docente` ASC, `Usuario_Estudiante_id_estudiante` ASC) VISIBLE,
  INDEX `fk_Publicacion_Grupo1_idx` (`Grupo_id_grupo` ASC) VISIBLE,
  CONSTRAINT `fk_Publicacion_Usuario1`
    FOREIGN KEY (`Usuario_id_usuario` , `Usuario_Administrativo_id_administrativo` , `Usuario_Docente_id_docente` , `Usuario_Estudiante_id_estudiante`)
    REFERENCES `mydb`.`Usuario` (`id_usuario` , `Administrativo_id_administrativo` , `Docente_id_docente` , `Estudiante_id_estudiante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Publicacion_Grupo1`
    FOREIGN KEY (`Grupo_id_grupo`)
    REFERENCES `mydb`.`Grupo` (`id_grupo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Comentario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Comentario` (
  `id_comentario` INT NOT NULL,
  `contenido` VARCHAR(144) NULL,
  `Publicacion_id_publicacion` INT NOT NULL,
  `Publicacion_Usuario_id_usuario` INT NOT NULL,
  `Publicacion_Usuario_Administrativo_id_administrativo` INT NOT NULL,
  `Publicacion_Usuario_Docente_id_docente` INT NOT NULL,
  `Publicacion_Usuario_Estudiante_id_estudiante` INT NOT NULL,
  `Publicacion_Grupo_id_grupo` INT NOT NULL,
  `Usuario_id_usuario` INT NOT NULL,
  `Usuario_Administrativo_id_administrativo` INT NOT NULL,
  `Usuario_Docente_id_docente` INT NOT NULL,
  `Usuario_Estudiante_id_estudiante` INT NOT NULL,
  PRIMARY KEY (`id_comentario`, `Publicacion_id_publicacion`, `Publicacion_Usuario_id_usuario`, `Publicacion_Usuario_Administrativo_id_administrativo`, `Publicacion_Usuario_Docente_id_docente`, `Publicacion_Usuario_Estudiante_id_estudiante`, `Publicacion_Grupo_id_grupo`, `Usuario_id_usuario`, `Usuario_Administrativo_id_administrativo`, `Usuario_Docente_id_docente`, `Usuario_Estudiante_id_estudiante`),
  INDEX `fk_Comentario_Publicacion1_idx` (`Publicacion_id_publicacion` ASC, `Publicacion_Usuario_id_usuario` ASC, `Publicacion_Usuario_Administrativo_id_administrativo` ASC, `Publicacion_Usuario_Docente_id_docente` ASC, `Publicacion_Usuario_Estudiante_id_estudiante` ASC, `Publicacion_Grupo_id_grupo` ASC) VISIBLE,
  INDEX `fk_Comentario_Usuario1_idx` (`Usuario_id_usuario` ASC, `Usuario_Administrativo_id_administrativo` ASC, `Usuario_Docente_id_docente` ASC, `Usuario_Estudiante_id_estudiante` ASC) VISIBLE,
  CONSTRAINT `fk_Comentario_Publicacion1`
    FOREIGN KEY (`Publicacion_id_publicacion` , `Publicacion_Usuario_id_usuario` , `Publicacion_Usuario_Administrativo_id_administrativo` , `Publicacion_Usuario_Docente_id_docente` , `Publicacion_Usuario_Estudiante_id_estudiante` , `Publicacion_Grupo_id_grupo`)
    REFERENCES `mydb`.`Publicacion` (`id_publicacion` , `Usuario_id_usuario` , `Usuario_Administrativo_id_administrativo` , `Usuario_Docente_id_docente` , `Usuario_Estudiante_id_estudiante` , `Grupo_id_grupo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comentario_Usuario1`
    FOREIGN KEY (`Usuario_id_usuario` , `Usuario_Administrativo_id_administrativo` , `Usuario_Docente_id_docente` , `Usuario_Estudiante_id_estudiante`)
    REFERENCES `mydb`.`Usuario` (`id_usuario` , `Administrativo_id_administrativo` , `Docente_id_docente` , `Estudiante_id_estudiante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Evento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Evento` (
  `id_evento` INT NOT NULL,
  `fecha` DATE NULL,
  `lugar` VARCHAR(50) NULL,
  `descripcion` VARCHAR(45) NULL,
  `Administrativo_id_administrativo` INT NOT NULL,
  PRIMARY KEY (`id_evento`, `Administrativo_id_administrativo`),
  INDEX `fk_Evento_Administrativo1_idx` (`Administrativo_id_administrativo` ASC) VISIBLE,
  CONSTRAINT `fk_Evento_Administrativo1`
    FOREIGN KEY (`Administrativo_id_administrativo`)
    REFERENCES `mydb`.`Administrativo` (`id_administrativo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Semestre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Semestre` (
  `id_semestre` INT NOT NULL,
  `numero` INT NULL,
  `Estudiante_id_estudiante` INT NOT NULL,
  `Estudiante_Carrera_id_carrera` INT NOT NULL,
  `Estudiante_Carrera_Docente_id_docente` INT NOT NULL,
  PRIMARY KEY (`id_semestre`, `Estudiante_id_estudiante`, `Estudiante_Carrera_id_carrera`, `Estudiante_Carrera_Docente_id_docente`),
  INDEX `fk_Semestre_Estudiante1_idx` (`Estudiante_id_estudiante` ASC, `Estudiante_Carrera_id_carrera` ASC, `Estudiante_Carrera_Docente_id_docente` ASC) VISIBLE,
  CONSTRAINT `fk_Semestre_Estudiante1`
    FOREIGN KEY (`Estudiante_id_estudiante` , `Estudiante_Carrera_id_carrera` , `Estudiante_Carrera_Docente_id_docente`)
    REFERENCES `mydb`.`Estudiante` (`id_estudiante` , `Carrera_id_carrera` , `Carrera_Docente_id_docente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
