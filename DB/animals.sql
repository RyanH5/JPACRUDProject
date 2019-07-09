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
INSERT INTO `animal` (`id`, `name`, `description`, `image`) VALUES (1, 'Short Tailed Weasel', 'Small weasels also known as ermine.', 'https://www.nps.gov/common/uploads/grid_builder/yell/crop16_9/3895DD36-1DD8-B71B-0BAC5CE03E9838E5.jpg?width=465&quality=90&mode=crop');
INSERT INTO `animal` (`id`, `name`, `description`, `image`) VALUES (2, 'Yellow-bellied Marmot', 'Rodents that hibernate for eight months and are seen climbing around rocks.', 'https://www.nps.gov/common/uploads/grid_builder/yell/crop16_9/36DAB1BF-1DD8-B71B-0BD6F96459B4A666.jpg?width=465&quality=90&mode=crop');
INSERT INTO `animal` (`id`, `name`, `description`, `image`) VALUES (3, 'Red Fox', 'Smallest of the three canid species found in the park.', 'https://www.nps.gov/common/uploads/grid_builder/yell/crop16_9/387534AE-1DD8-B71B-0BBD9E0ECC020D35.jpg?width=465&quality=90&mode=crop');
INSERT INTO `animal` (`id`, `name`, `description`, `image`) VALUES (4, 'Bison', 'Yellowstone bison exhibit behavior like their ancient ancestors.', 'https://www.nps.gov/common/uploads/grid_builder/yell/crop16_9/41AB5A70-1DD8-B71B-0BA44DC1D8BDE013.jpg?width=950&quality=90&mode=crop');
INSERT INTO `animal` (`id`, `name`, `description`, `image`) VALUES (5, 'Elk', 'Elk are the most abundant large mammal found in Yellowstone.', 'https://www.nps.gov/common/uploads/grid_builder/yell/crop16_9/41860828-1DD8-B71B-0B9296FEBFFF0D90.jpg?width=465&quality=90&mode=crop');
INSERT INTO `animal` (`id`, `name`, `description`, `image`) VALUES (6, 'Mountain Goat', 'Mountain goats are considered non-native species.', 'https://www.nps.gov/common/uploads/grid_builder/yell/crop16_9/397EC5ED-1DD8-B71B-0BD4EC53A6A1F8D9.jpg?width=307&quality=90&mode=crop');

COMMIT;

