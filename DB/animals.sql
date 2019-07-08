-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema national_parkdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `national_parkdb` ;

-- -----------------------------------------------------
-- Schema national_parkdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `national_parkdb` DEFAULT CHARACTER SET utf8 ;
USE `national_parkdb` ;

-- -----------------------------------------------------
-- Table `animal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `animal` ;

CREATE TABLE IF NOT EXISTS `animal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(300) NULL,
  `image` VARCHAR(500) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS marmot@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'marmot'@'localhost' IDENTIFIED BY 'marmot';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'marmot'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `animal`
-- -----------------------------------------------------
START TRANSACTION;
USE `national_parkdb`;
INSERT INTO `animal` (`id`, `name`, `description`, `image`) VALUES (1, 'Short Tailed Weasel', 'weasely', 'urlagsdgavsgas');
INSERT INTO `animal` (`id`, `name`, `description`, `image`) VALUES (2, 'marmut', 'weasely', 'gsdjlagval;snglasgoasgo');
INSERT INTO `animal` (`id`, `name`, `description`, `image`) VALUES (3, 'ferret', 'jhgllkjblh;j', 'gjaiklgjpewjg');

COMMIT;

