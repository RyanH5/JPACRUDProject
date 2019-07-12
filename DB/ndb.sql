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
-- -----------------------------------------------------
-- Schema orig
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `national_parkdb` ;

-- -----------------------------------------------------
-- Schema orig
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `national_parkdb` DEFAULT CHARACTER SET utf8 ;
USE `national_parkdb` ;

-- -----------------------------------------------------
-- Table `sighting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sighting` ;

CREATE TABLE IF NOT EXISTS `sighting` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date_seen` DATE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wild_flower`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wild_flower` ;

CREATE TABLE IF NOT EXISTS `wild_flower` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(450) NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  `blooming_period` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sighting_has_wild_flower`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sighting_has_wild_flower` ;

CREATE TABLE IF NOT EXISTS `sighting_has_wild_flower` (
  `sighting_id` INT NOT NULL,
  `wild_flower_id` INT NOT NULL,
  PRIMARY KEY (`sighting_id`, `wild_flower_id`),
  INDEX `fk_sighting_has_wild_flower_wild_flower1_idx` (`wild_flower_id` ASC),
  INDEX `fk_sighting_has_wild_flower_sighting_idx` (`sighting_id` ASC),
  CONSTRAINT `fk_sighting_has_wild_flower_sighting`
    FOREIGN KEY (`sighting_id`)
    REFERENCES `sighting` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sighting_has_wild_flower_wild_flower1`
    FOREIGN KEY (`wild_flower_id`)
    REFERENCES `wild_flower` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `national_parkdb` ;

-- -----------------------------------------------------
-- Table `animal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `animal` ;

CREATE TABLE IF NOT EXISTS `animal` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(2000) NULL DEFAULT NULL,
  `image` VARCHAR(2000) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `animal_has_sighting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `animal_has_sighting` ;

CREATE TABLE IF NOT EXISTS `animal_has_sighting` (
  `animal_id` INT(11) NOT NULL,
  `sighting_id` INT NOT NULL,
  PRIMARY KEY (`animal_id`, `sighting_id`),
  INDEX `fk_animal_has_sighting_sighting1_idx` (`sighting_id` ASC),
  INDEX `fk_animal_has_sighting_animal_idx` (`animal_id` ASC),
  CONSTRAINT `fk_animal_has_sighting_animal`
    FOREIGN KEY (`animal_id`)
    REFERENCES `animal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_animal_has_sighting_sighting1`
    FOREIGN KEY (`sighting_id`)
    REFERENCES `national_parkdb`.`sighting` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SET SQL_MODE = '';
DROP USER IF EXISTS marmot@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'marmot'@'localhost' IDENTIFIED BY 'marmot';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'marmot'@'localhost';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'marmot'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `sighting`
-- -----------------------------------------------------
START TRANSACTION;
USE `national_parkdb`;
INSERT INTO `sighting` (`id`, `date_seen`) VALUES (1, '2019-02-03');
INSERT INTO `sighting` (`id`, `date_seen`) VALUES (2, '2018-05-10');
INSERT INTO `sighting` (`id`, `date_seen`) VALUES (3, '2017-05-08');
INSERT INTO `sighting` (`id`, `date_seen`) VALUES (4, '2014-09-07');

COMMIT;


-- -----------------------------------------------------
-- Data for table `wild_flower`
-- -----------------------------------------------------
START TRANSACTION;
USE `national_parkdb`;
INSERT INTO `wild_flower` (`id`, `name`, `location`, `blooming_period`) VALUES (2, 'Marsh marigold', 'Wet meadows, parkwide & Beartooth Mountains', 'May–July');
INSERT INTO `wild_flower` (`id`, `name`, `location`, `blooming_period`) VALUES (3, 'Northern bedstraw', 'Northern range', 'July–August');
INSERT INTO `wild_flower` (`id`, `name`, `location`, `blooming_period`) VALUES (4, 'White geranium', 'Moist areas, parkwide', 'July–August');
INSERT INTO `wild_flower` (`id`, `name`, `location`, `blooming_period`) VALUES (5, 'Phlox', 'Parkwide', 'May–July');
INSERT INTO `wild_flower` (`id`, `name`, `location`, `blooming_period`) VALUES (6, 'Wild strawberry', 'Parkwide', 'May–July');
INSERT INTO `wild_flower` (`id`, `name`, `location`, `blooming_period`) VALUES (7, 'Yampa', 'Meadows, parkwide', 'July–August');
INSERT INTO `wild_flower` (`id`, `name`, `location`, `blooming_period`) VALUES (8, 'Cow parsnip', 'Wet areas, parkwide', 'July–August');
INSERT INTO `wild_flower` (`id`, `name`, `location`, `blooming_period`) VALUES (9, 'Evening primrose', 'Gardiner/Mammoth areas', 'May–June');
INSERT INTO `wild_flower` (`id`, `name`, `location`, `blooming_period`) VALUES (10, 'Ladies tresses', 'Thermal areas, meadows', 'July–August');
INSERT INTO `wild_flower` (`id`, `name`, `location`, `blooming_period`) VALUES (11, 'Woodland star', 'Meadows, parkwide', 'May–June');
INSERT INTO `wild_flower` (`id`, `name`, `location`, `blooming_period`) VALUES (12, 'Yarrow', 'Parkwide', 'June–September');
INSERT INTO `wild_flower` (`id`, `name`, `location`, `blooming_period`) VALUES (13, 'Pussytoes', 'Parkwide', 'June–July');
INSERT INTO `wild_flower` (`id`, `name`, `location`, `blooming_period`) VALUES (14, 'Spring beauty', 'Parkwide', 'April–June');
INSERT INTO `wild_flower` (`id`, `name`, `location`, `blooming_period`) VALUES (15, 'Bistort', 'Meadows, parkwide & Beartooth Mountains', 'June–August');

COMMIT;


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
INSERT INTO `animal` (`id`, `name`, `description`, `image`) VALUES (9, 'Lochness Monster', 'Big scary boat sinker', 'http://ichef.bbci.co.uk/news/976/cpsprodpb/0C36/production/_98762130_lochness1.jpg');
INSERT INTO `animal` (`id`, `name`, `description`, `image`) VALUES (11, 'giraffe', 'tall neck fighters', 'https://www.africa-wildlife-detective.com/images/giraffes-fighting-e.jpg');
INSERT INTO `animal` (`id`, `name`, `description`, `image`) VALUES (12, 'Bobcat', 'One of the elusive cats of yellowstone', 'https://www.nps.gov/common/uploads/grid_builder/yell/crop16_9/41F19631-1DD8-B71B-0B33B9A26B0783AF.jpg?width=307&quality=90&mode=crop');
INSERT INTO `animal` (`id`, `name`, `description`, `image`) VALUES (13, 'Black Bear', 'Commonly seen in Yellowstone', 'https://www.nps.gov/common/uploads/grid_builder/yell/crop16_9/419891EB-1DD8-B71B-0BCD6C888FD32498.jpg?width=307&quality=90&mode=crop');

COMMIT;

