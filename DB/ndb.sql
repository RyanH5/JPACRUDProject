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
DROP SCHEMA IF EXISTS `orig` ;

-- -----------------------------------------------------
-- Schema orig
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `orig` DEFAULT CHARACTER SET utf8 ;
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
  `image` VARCHAR(450) NULL,
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

USE `orig` ;

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
INSERT INTO `wild_flower` (`id`, `name`, `location`, `blooming_period`, `image`) VALUES (id, 'plant', 'location', 'blooming_period', 'image ');
INSERT INTO `wild_flower` (`id`, `name`, `location`, `blooming_period`, `image`) VALUES (2, 'Marsh marigold', 'Wet meadows, parkwide & Beartooth Mountains', 'May–July', 'https://previews.123rf.com/images/voltan1/voltan11205/voltan1120500124/13836048-marsh-marigold-caltha-palustris-in-the-swamp.jpg');
INSERT INTO `wild_flower` (`id`, `name`, `location`, `blooming_period`, `image`) VALUES (3, 'Northern bedstraw', 'Northern range', 'July–August', 'http://www.minnesotawildflowers.info/udata/r9ndp23q/white/northern-bedstraw-100_8682.jpg');
INSERT INTO `wild_flower` (`id`, `name`, `location`, `blooming_period`, `image`) VALUES (4, 'White geranium', 'Moist areas, parkwide', 'July–August', 'http://cdn.shopify.com/s/files/1/1537/5553/products/22654_3f94a00d-f5ae-438c-a9ab-c150f0491f97_grande.jpg?v=1486448703');
INSERT INTO `wild_flower` (`id`, `name`, `location`, `blooming_period`, `image`) VALUES (5, 'Phlox', 'Parkwide', 'May–July', 'https://www.gardendesign.com/pictures/images/900x705Max/dream-team-s-portland-garden_6/garden-phlox-purple-phlox-shutterstock-com_12822.jpg');
INSERT INTO `wild_flower` (`id`, `name`, `location`, `blooming_period`, `image`) VALUES (6, 'Wild strawberry', 'Parkwide', 'May–July', 'https://i.etsystatic.com/13735725/r/il/49583a/1242836099/il_794xN.1242836099_c1lg.jpg');
INSERT INTO `wild_flower` (`id`, `name`, `location`, `blooming_period`, `image`) VALUES (7, 'Yampa', 'Meadows, parkwide', 'July–August', 'https://3apq7g38q3kw2yn3fx4bojii-wpengine.netdna-ssl.com/wp-content/uploads/2017/05/2534438617_ccd227efcb_o_hemlock-750x500.jpg');
INSERT INTO `wild_flower` (`id`, `name`, `location`, `blooming_period`, `image`) VALUES (8, 'Cow parsnip', 'Wet areas, parkwide', 'July–August', 'http://preparednessadvice.com/wp-content/uploads/2015/08/cow-parsnip.jpg');
INSERT INTO `wild_flower` (`id`, `name`, `location`, `blooming_period`, `image`) VALUES (9, 'Evening primrose', 'Gardiner/Mammoth areas', 'May–June', 'https://www.outsidepride.com/images/products/detail/wildflowers/eveningprimrose.jpg');
INSERT INTO `wild_flower` (`id`, `name`, `location`, `blooming_period`, `image`) VALUES (10, 'Ladies tresses', 'Thermal areas, meadows', 'July–August', 'https://i.pinimg.com/originals/bc/24/12/bc2412bd22dca5b259074ab2ad0b73b6.jpg');
INSERT INTO `wild_flower` (`id`, `name`, `location`, `blooming_period`, `image`) VALUES (11, 'Woodland star', 'Meadows, parkwide', 'May–June', 'https://live.staticflickr.com/4540/38567960482_02c2944770_b.jpg');
INSERT INTO `wild_flower` (`id`, `name`, `location`, `blooming_period`, `image`) VALUES (12, 'Yarrow', 'Parkwide', 'June–September', 'https://d2v9y0dukr6mq2.cloudfront.net/video/thumbnail/E_u2TU1Ix/achillea-millefolium-yarrow-flower-close-up-yarrow-is-a-medicinal-and-ornamental-herb-and-plant-cultivated-by-many-plant-nurseries-it-is-planted-in-gardens-and-natural-landscaping-settings-of_brlg41oeo_thumbnail-full01.png');
INSERT INTO `wild_flower` (`id`, `name`, `location`, `blooming_period`, `image`) VALUES (13, 'Pussytoes', 'Parkwide', 'June–July', 'https://cdn.shopify.com/s/files/1/1008/4432/products/Antennaria_Pussytoes_White.JPG?v=1479871198');
INSERT INTO `wild_flower` (`id`, `name`, `location`, `blooming_period`, `image`) VALUES (14, 'Spring beauty', 'Parkwide', 'April–June', 'https://www.ediblewildfood.com/images/spring-beauty-pictures/spring-beauty-flowers.jpg');
INSERT INTO `wild_flower` (`id`, `name`, `location`, `blooming_period`, `image`) VALUES (15, 'Bistort', 'Meadows, parkwide & Beartooth Mountains', 'June–August', 'https://cdn.shopify.com/s/files/1/1186/5156/products/Bistort_39ed7fdb-4c21-4f45-bcc2-e45a5b6486cd_large.jpeg?v=1456915032');

COMMIT;


-- -----------------------------------------------------
-- Data for table `animal`
-- -----------------------------------------------------
START TRANSACTION;
USE `orig`;
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

