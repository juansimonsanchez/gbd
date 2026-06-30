SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

SHOW WARNINGS;
DROP SCHEMA IF EXISTS `ventas` ;
CREATE SCHEMA IF NOT EXISTS `ventas` DEFAULT CHARACTER SET latin1 ;
SHOW WARNINGS;
USE `ventas` ;

-- -----------------------------------------------------
-- Table `categorias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `categorias` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `categorias` (
  `idcategoria` INT(11) NOT NULL ,
  `nombre_categoria` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idcategoria`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `clientes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clientes` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `clientes` (
  `idcliente` INT(11) NOT NULL ,
  `numero_cta_cliente` INT(11) NOT NULL ,
  `nombre_cliente` VARCHAR(45) NOT NULL ,
  `nombre_contacto` VARCHAR(45) NULL DEFAULT NULL ,
  `telefono_cliente` VARCHAR(15) NULL DEFAULT NULL ,
  `direccion_cliente` VARCHAR(45) NULL DEFAULT NULL ,
  `ciudad_cliente` VARCHAR(45) NULL DEFAULT NULL ,
  `pais_cliente` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`idcliente`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `detalle_venta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `detalle_venta` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `detalle_venta` (
  `idventa` INT(11) NOT NULL ,
  `orden_detalle_venta` INT(2) NOT NULL ,
  `idproducto` INT(11) NULL DEFAULT NULL ,
  `precio_unitario` DOUBLE NULL DEFAULT NULL ,
  `cantidad` INT(6) NULL DEFAULT NULL ,
  PRIMARY KEY (`idventa`, `orden_detalle_venta`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `distribuidores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `distribuidores` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `distribuidores` (
  `iddistribuidor` INT(11) NOT NULL ,
  PRIMARY KEY (`iddistribuidor`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `empleados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `empleados` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `empleados` (
  `idempleado` INT(11) NOT NULL ,
  `ci_empleado` INT(11) NOT NULL ,
  `nombre_empleado` VARCHAR(45) NOT NULL ,
  `apellido_empleado` VARCHAR(45) NOT NULL ,
  `fecha_nac_empleado` DATE NOT NULL ,
  `fecha_contrato_empleado` DATE NOT NULL ,
  PRIMARY KEY (`idempleado`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `productos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `productos` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `productos` (
  `idproducto` INT(11) NOT NULL ,
  `idcategoria` INT(11) NULL DEFAULT NULL ,
  `nombre_producto` VARCHAR(45) NULL DEFAULT NULL ,
  `precio_compra` INT(11) NULL DEFAULT NULL ,
  `precio_venta` INT(11) NULL DEFAULT NULL ,
  `stock` INT(11) NULL DEFAULT NULL ,
  `stock_minimo` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`idproducto`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `proveedores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proveedores` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `proveedores` (
  `idproveedor` INT(11) NOT NULL ,
  `nombre_proveedor` VARCHAR(45) NULL DEFAULT NULL ,
  `ruc_proveedor` VARCHAR(45) NULL DEFAULT NULL ,
  `direccion_proveedor` VARCHAR(45) NULL DEFAULT NULL ,
  `telefono_proveedor` VARCHAR(45) NULL DEFAULT NULL ,
  `ciudad_proveedor` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`idproveedor`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ventas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ventas` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `ventas` (
  `idventa` INT(11) NOT NULL ,
  `idcliente` INT(11) NOT NULL ,
  `idempleado` INT(11) NOT NULL ,
  `iddistribuidor` INT(11) NOT NULL ,
  `fecha_venta` DATETIME NOT NULL ,
  `total_venta` DOUBLE NULL DEFAULT NULL ,
  PRIMARY KEY (`idventa`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
