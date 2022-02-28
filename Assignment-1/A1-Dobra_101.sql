-- >>>>>>>>>>>>>>>>>>
-- >>>>>>>>>>>>>>>>>>
-- >>>>>>>>>>>>>>>>>>
/* STEP 1 - DESIGN */
-- >>>>>>>>>>>>>>>>>>
-- >>>>>>>>>>>>>>>>>>
-- >>>>>>>>>>>>>>>>>>

/* Forward Engineer EERD */
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema A1Dobra
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema A1Dobra
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `A1Dobra` DEFAULT CHARACTER SET utf8 ;
USE `A1Dobra` ;

-- -----------------------------------------------------
-- Table `A1Dobra`.`manufacturer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `A1Dobra`.`manufacturer` (
  `manufacturer_code` INT NOT NULL,
  `manufacturer_name` VARCHAR(45) NULL,
  `manufacturer_address` VARCHAR(45) NULL,
  `manufacturer_phone` VARCHAR(45) NULL,
  `manufacturer_account_num` INT NULL,
  PRIMARY KEY (`manufacturer_code`),
  UNIQUE INDEX `manufacturer_code_UNIQUE` (`manufacturer_code` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `A1Dobra`.`spa_brands`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `A1Dobra`.`spa_brands` (
  `brand_id` INT NOT NULL,
  `brand_name` VARCHAR(45) NULL,
  `brand_level` VARCHAR(45) NULL,
  `fk_manufacturer_manufacturer_code` INT NOT NULL,
  PRIMARY KEY (`brand_id`),
  INDEX `fk_spa_brands_manufacturers_idx` (`fk_manufacturer_manufacturer_code` ASC) VISIBLE,
  UNIQUE INDEX `brand_id_UNIQUE` (`brand_id` ASC) VISIBLE,
  CONSTRAINT `fk_spa_brands_manufacturers`
    FOREIGN KEY (`fk_manufacturer_manufacturer_code`)
    REFERENCES `A1Dobra`.`manufacturer` (`manufacturer_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `A1Dobra`.`energy_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `A1Dobra`.`energy_type` (
  `energy_id` INT NOT NULL,
  `energy_type` VARCHAR(45) NULL,
  PRIMARY KEY (`energy_id`),
  UNIQUE INDEX `energy_id_UNIQUE` (`energy_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `A1Dobra`.`models`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `A1Dobra`.`models` (
  `model_number` INT NOT NULL,
  `jets_number` INT NULL,
  `motors_number` INT NULL,
  `horsepower_number` INT NULL,
  `suggested_retail` INT NULL,
  `unicorn_retail` INT NULL,
  `water_capacity` INT NULL,
  `seating_capacity` INT NULL,
  `fk_spa_brands_brand_id` INT NOT NULL,
  `fk_energy_type_energy_id` INT NOT NULL,
  PRIMARY KEY (`model_number`),
  INDEX `fk_models_spa_brands1_idx` (`fk_spa_brands_brand_id` ASC) VISIBLE,
  INDEX `fk_models_energy_type1_idx` (`fk_energy_type_energy_id` ASC) VISIBLE,
  UNIQUE INDEX `model_number_UNIQUE` (`model_number` ASC) VISIBLE,
  CONSTRAINT `fk_models_spa_brands1`
    FOREIGN KEY (`fk_spa_brands_brand_id`)
    REFERENCES `A1Dobra`.`spa_brands` (`brand_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_models_energy_type1`
    FOREIGN KEY (`fk_energy_type_energy_id`)
    REFERENCES `A1Dobra`.`energy_type` (`energy_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- >>>>>>>>>>>>>>>>>>>>
-- >>>>>>>>>>>>>>>>>>>>
-- >>>>>>>>>>>>>>>>>>>>
/* STEP 2 - ADD DATA */
-- >>>>>>>>>>>>>>>>>>>>
-- >>>>>>>>>>>>>>>>>>>>
-- >>>>>>>>>>>>>>>>>>>>

/* Insert values into energy_type table */
INSERT INTO `a1dobra`.`energy_type` (`energy_id`, `energy_type`) VALUES ('1', 'propane');
INSERT INTO `a1dobra`.`energy_type` (`energy_id`, `energy_type`) VALUES ('2', 'electricity');
INSERT INTO `a1dobra`.`energy_type` (`energy_id`, `energy_type`) VALUES ('3', 'wood');
INSERT INTO `a1dobra`.`energy_type` (`energy_id`, `energy_type`) VALUES ('4', 'solar');

/* Insert values into manufacturer table */
INSERT INTO `a1dobra`.`manufacturer` (`manufacturer_code`, `manufacturer_name`, `manufacturer_address`, `manufacturer_phone`, `manufacturer_account_num`) VALUES ('34025002', 'Catalina Spas', '639 Cat Street', '6139604586', '34253464');
INSERT INTO `a1dobra`.`manufacturer` (`manufacturer_code`, `manufacturer_name`, `manufacturer_address`, `manufacturer_phone`, `manufacturer_account_num`) VALUES ('23050235', 'Fort Spas', '421 Fort Street', '6130648603', '86435255');
INSERT INTO `a1dobra`.`manufacturer` (`manufacturer_code`, `manufacturer_name`, `manufacturer_address`, `manufacturer_phone`, `manufacturer_account_num`) VALUES ('23501235', 'ThermoSpas', '593 Thermo Street', '6136845930', '65387234');
INSERT INTO `a1dobra`.`manufacturer` (`manufacturer_code`, `manufacturer_name`, `manufacturer_address`, `manufacturer_phone`, `manufacturer_account_num`) VALUES ('16495023', 'Caldera Spas', '168 Caldera Street', '6136452738', '91453463');
INSERT INTO `a1dobra`.`manufacturer` (`manufacturer_code`, `manufacturer_name`, `manufacturer_address`, `manufacturer_phone`, `manufacturer_account_num`) VALUES ('86390240', 'Master Spas', '603 Master Street', '6135873495', '75235832');

/* Insert into spa_brands table */
INSERT INTO `a1dobra`.`spa_brands` (`brand_id`, `brand_name`, `brand_level`, `fk_manufacturer_manufacturer_code`) VALUES ('1', 'SpaA', 'premium', '23502101');
INSERT INTO `a1dobra`.`spa_brands` (`brand_id`, `brand_name`, `brand_level`, `fk_manufacturer_manufacturer_code`) VALUES ('2', 'SpaB', 'mid-level', '23502101');
INSERT INTO `a1dobra`.`spa_brands` (`brand_id`, `brand_name`, `brand_level`, `fk_manufacturer_manufacturer_code`) VALUES ('3', 'SpaC', 'entry-level', '23502101');
INSERT INTO `a1dobra`.`spa_brands` (`brand_id`, `brand_name`, `brand_level`, `fk_manufacturer_manufacturer_code`) VALUES ('4', 'SpaD', 'premium', '23502101');
INSERT INTO `a1dobra`.`spa_brands` (`brand_id`, `brand_name`, `brand_level`, `fk_manufacturer_manufacturer_code`) VALUES ('5', 'SpaF', 'mid-level', '23502101');
INSERT INTO `a1dobra`.`spa_brands` (`brand_id`, `brand_name`, `brand_level`, `fk_manufacturer_manufacturer_code`) VALUES ('6', 'SpaG', 'entry-level', '23502101');
INSERT INTO `a1dobra`.`spa_brands` (`brand_id`, `brand_name`, `brand_level`, `fk_manufacturer_manufacturer_code`) VALUES ('7', 'SpaH', 'mid-level', '34025002');
INSERT INTO `a1dobra`.`spa_brands` (`brand_id`, `brand_name`, `brand_level`, `fk_manufacturer_manufacturer_code`) VALUES ('8', 'SpaI', 'premium', '34025002');
INSERT INTO `a1dobra`.`spa_brands` (`brand_id`, `brand_name`, `brand_level`, `fk_manufacturer_manufacturer_code`) VALUES ('9', 'SpaJ', 'entry-level', '34025002');
INSERT INTO `a1dobra`.`spa_brands` (`brand_id`, `brand_name`, `brand_level`, `fk_manufacturer_manufacturer_code`) VALUES ('10', 'SpaK', 'mid-level', '34025002');
INSERT INTO `a1dobra`.`spa_brands` (`brand_id`, `brand_name`, `brand_level`, `fk_manufacturer_manufacturer_code`) VALUES ('11', 'SpaL', 'entry-level', '34025002');
INSERT INTO `a1dobra`.`spa_brands` (`brand_id`, `brand_name`, `brand_level`, `fk_manufacturer_manufacturer_code`) VALUES ('12', 'SpaM', 'mid-level', '50345034');
INSERT INTO `a1dobra`.`spa_brands` (`brand_id`, `brand_name`, `brand_level`, `fk_manufacturer_manufacturer_code`) VALUES ('13', 'SpaN', 'premium', '50345034');
INSERT INTO `a1dobra`.`spa_brands` (`brand_id`, `brand_name`, `brand_level`, `fk_manufacturer_manufacturer_code`) VALUES ('14', 'SpaO', 'entry-level', '50345034');
INSERT INTO `a1dobra`.`spa_brands` (`brand_id`, `brand_name`, `brand_level`, `fk_manufacturer_manufacturer_code`) VALUES ('15', 'SpaP', 'premium', '86390240');
INSERT INTO `a1dobra`.`spa_brands` (`brand_id`, `brand_name`, `brand_level`, `fk_manufacturer_manufacturer_code`) VALUES ('16', 'SpaQ', 'mid-level', '86390240');
INSERT INTO `a1dobra`.`spa_brands` (`brand_id`, `brand_name`, `brand_level`, `fk_manufacturer_manufacturer_code`) VALUES ('17', 'SpaR', 'entry-level', '16495023');
INSERT INTO `a1dobra`.`spa_brands` (`brand_id`, `brand_name`, `brand_level`, `fk_manufacturer_manufacturer_code`) VALUES ('18', 'SpaS', 'mid-level', '16495023');

/* Insert values into mdeols table */
INSERT INTO `a1dobra`.`models` (`model_id`, `jets_number`, `motors_number`, `horsepower_number`, `suggested_retail`, `unicorn_retail`, `water_capacity`, `seating_capacity`, `fk_spa_brands_brand_id`, `fk_energy_type_energy_id`) VALUES ('LRS-1', '50', '2', '6', '6500', '7000', '200', '8', '1', '1');
INSERT INTO `a1dobra`.`models` (`model_id`, `jets_number`, `motors_number`, `horsepower_number`, `suggested_retail`, `unicorn_retail`, `water_capacity`, `seating_capacity`, `fk_spa_brands_brand_id`, `fk_energy_type_energy_id`) VALUES ('LRS-6', '30', '6', '5', '3000', '3500', '60', '5', '1', '2');
INSERT INTO `a1dobra`.`models` (`model_id`, `jets_number`, `motors_number`, `horsepower_number`, `suggested_retail`, `unicorn_retail`, `water_capacity`, `seating_capacity`, `fk_spa_brands_brand_id`, `fk_energy_type_energy_id`) VALUES ('RST-4', '50', '5', '8', '7500', '8000', '220', '8', '2', '3');
INSERT INTO `a1dobra`.`models` (`model_id`, `jets_number`, `motors_number`, `horsepower_number`, `suggested_retail`, `unicorn_retail`, `water_capacity`, `seating_capacity`, `fk_spa_brands_brand_id`, `fk_energy_type_energy_id`) VALUES ('RQR-8', '70', '3', '7', '8500', '9000', '300', '9', '3', '4');
INSERT INTO `a1dobra`.`models` (`model_id`, `jets_number`, `motors_number`, `horsepower_number`, `suggested_retail`, `unicorn_retail`, `water_capacity`, `seating_capacity`, `fk_spa_brands_brand_id`, `fk_energy_type_energy_id`) VALUES ('LFT-2', '150', '2', '4', '10000', '12000', '400', '12', '4', '2');
INSERT INTO `a1dobra`.`models` (`model_id`, `jets_number`, `motors_number`, `horsepower_number`, `suggested_retail`, `unicorn_retail`, `water_capacity`, `seating_capacity`, `fk_spa_brands_brand_id`, `fk_energy_type_energy_id`) VALUES ('PQR-2', '40', '8', '4', '1900', '2000', '150', '4', '5', '3');
INSERT INTO `a1dobra`.`models` (`model_id`, `jets_number`, `motors_number`, `horsepower_number`, `suggested_retail`, `unicorn_retail`, `water_capacity`, `seating_capacity`, `fk_spa_brands_brand_id`, `fk_energy_type_energy_id`) VALUES ('SSR-4', '20', '4', '9', '1500', '1500', '60', '2', '6', '2');
INSERT INTO `a1dobra`.`models` (`model_id`, `jets_number`, `motors_number`, `horsepower_number`, `suggested_retail`, `unicorn_retail`, `water_capacity`, `seating_capacity`, `fk_spa_brands_brand_id`, `fk_energy_type_energy_id`) VALUES ('JKE-1', '210', '10', '6', '10500', '13000', '400', '14', '7', '3');
INSERT INTO `a1dobra`.`models` (`model_id`, `jets_number`, `motors_number`, `horsepower_number`, `suggested_retail`, `unicorn_retail`, `water_capacity`, `seating_capacity`, `fk_spa_brands_brand_id`, `fk_energy_type_energy_id`) VALUES ('LOP-7', '150', '1', '4', '2100', '2300', '40', '6', '8', '1');
INSERT INTO `a1dobra`.`models` (`model_id`, `jets_number`, `motors_number`, `horsepower_number`, `suggested_retail`, `unicorn_retail`, `water_capacity`, `seating_capacity`, `fk_spa_brands_brand_id`, `fk_energy_type_energy_id`) VALUES ('RFT-2', '180', '7', '9', '8000', '7500', '250', '10', '9', '3');
INSERT INTO `a1dobra`.`models` (`model_id`, `jets_number`, `motors_number`, `horsepower_number`, `suggested_retail`, `unicorn_retail`, `water_capacity`, `seating_capacity`, `fk_spa_brands_brand_id`, `fk_energy_type_energy_id`) VALUES ('KIO-7', '90', '9', '12', '8000', '8500', '220', '9', '10', '1');
INSERT INTO `a1dobra`.`models` (`model_id`, `jets_number`, `motors_number`, `horsepower_number`, `suggested_retail`, `unicorn_retail`, `water_capacity`, `seating_capacity`, `fk_spa_brands_brand_id`, `fk_energy_type_energy_id`) VALUES ('KIO-2', '45', '4', '6', '1200', '1400', '100', '4', '10', '4');
INSERT INTO `a1dobra`.`models` (`model_id`, `jets_number`, `motors_number`, `horsepower_number`, `suggested_retail`, `unicorn_retail`, `water_capacity`, `seating_capacity`, `fk_spa_brands_brand_id`, `fk_energy_type_energy_id`) VALUES ('LOP-5', '40', '3', '5', '2500', '2800', '170', '7', '8', '3');
INSERT INTO `a1dobra`.`models` (`model_id`, `jets_number`, `motors_number`, `horsepower_number`, `suggested_retail`, `unicorn_retail`, `water_capacity`, `seating_capacity`, `fk_spa_brands_brand_id`, `fk_energy_type_energy_id`) VALUES ('LOP-3', '140', '1', '8', '7000', '7500', '210', '10', '8', '1');
INSERT INTO `a1dobra`.`models` (`model_id`, `jets_number`, `motors_number`, `horsepower_number`, `suggested_retail`, `unicorn_retail`, `water_capacity`, `seating_capacity`, `fk_spa_brands_brand_id`, `fk_energy_type_energy_id`) VALUES ('RQR-2', '170', '2', '20', '6000', '6400', '230', '12', '3', '1');
INSERT INTO `a1dobra`.`models` (`model_id`, `jets_number`, `motors_number`, `horsepower_number`, `suggested_retail`, `unicorn_retail`, `water_capacity`, `seating_capacity`, `fk_spa_brands_brand_id`, `fk_energy_type_energy_id`) VALUES ('RQR-4', '30', '4', '6', '3500', '3100', '70', '6', '3', '2');
INSERT INTO `a1dobra`.`models` (`model_id`, `jets_number`, `motors_number`, `horsepower_number`, `suggested_retail`, `unicorn_retail`, `water_capacity`, `seating_capacity`, `fk_spa_brands_brand_id`, `fk_energy_type_energy_id`) VALUES ('SSR-1', '10', '2', '2', '1500', '1200', '25', '2', '6', '2');
INSERT INTO `a1dobra`.`models` (`model_id`, `jets_number`, `motors_number`, `horsepower_number`, `suggested_retail`, `unicorn_retail`, `water_capacity`, `seating_capacity`, `fk_spa_brands_brand_id`, `fk_energy_type_energy_id`) VALUES ('SSR-3', '200', '8', '10', '10000', '9500', '170', '11', '6', '3');
INSERT INTO `a1dobra`.`models` (`model_id`, `jets_number`, `motors_number`, `horsepower_number`, `suggested_retail`, `unicorn_retail`, `water_capacity`, `seating_capacity`, `fk_spa_brands_brand_id`, `fk_energy_type_energy_id`) VALUES ('OOP-1', '20', '4', '5', '3200', '3400', '150', '8', '11', '1');
INSERT INTO `a1dobra`.`models` (`model_id`, `jets_number`, `motors_number`, `horsepower_number`, `suggested_retail`, `unicorn_retail`, `water_capacity`, `seating_capacity`, `fk_spa_brands_brand_id`, `fk_energy_type_energy_id`) VALUES ('KLK-2', '70', '7', '8', '2800', '3000', '200', '6', '12', '2');
INSERT INTO `a1dobra`.`models` (`model_id`, `jets_number`, `motors_number`, `horsepower_number`, `suggested_retail`, `unicorn_retail`, `water_capacity`, `seating_capacity`, `fk_spa_brands_brand_id`, `fk_energy_type_energy_id`) VALUES ('ILO-3', '30', '5', '5', '3900', '4200', '100', '9', '13', '3');
INSERT INTO `a1dobra`.`models` (`model_id`, `jets_number`, `motors_number`, `horsepower_number`, `suggested_retail`, `unicorn_retail`, `water_capacity`, `seating_capacity`, `fk_spa_brands_brand_id`, `fk_energy_type_energy_id`) VALUES ('SPF-4', '50', '12', '3', '1500', '2100', '70', '5', '14', '4');
INSERT INTO `a1dobra`.`models` (`model_id`, `jets_number`, `motors_number`, `horsepower_number`, `suggested_retail`, `unicorn_retail`, `water_capacity`, `seating_capacity`, `fk_spa_brands_brand_id`, `fk_energy_type_energy_id`) VALUES ('REP-5', '40', '4', '8', '2000', '2000', '50', '4', '15', '1');
INSERT INTO `a1dobra`.`models` (`model_id`, `jets_number`, `motors_number`, `horsepower_number`, `suggested_retail`, `unicorn_retail`, `water_capacity`, `seating_capacity`, `fk_spa_brands_brand_id`, `fk_energy_type_energy_id`) VALUES ('UTF-6', '40', '7', '9', '5000', '6000', '120', '9', '16', '2');
INSERT INTO `a1dobra`.`models` (`model_id`, `jets_number`, `motors_number`, `horsepower_number`, `suggested_retail`, `unicorn_retail`, `water_capacity`, `seating_capacity`, `fk_spa_brands_brand_id`, `fk_energy_type_energy_id`) VALUES ('APA-7', '60', '5', '10', '8000', '9000', '180', '10', '17', '3');
INSERT INTO `a1dobra`.`models` (`model_id`, `jets_number`, `motors_number`, `horsepower_number`, `suggested_retail`, `unicorn_retail`, `water_capacity`, `seating_capacity`, `fk_spa_brands_brand_id`, `fk_energy_type_energy_id`) VALUES ('SOB-8', '120', '4', '16', '12000', '14000', '220', '12', '18', '4');
INSERT INTO `a1dobra`.`models` (`model_id`, `jets_number`, `motors_number`, `horsepower_number`, `suggested_retail`, `unicorn_retail`, `water_capacity`, `seating_capacity`, `fk_spa_brands_brand_id`, `fk_energy_type_energy_id`) VALUES ('KLK-6', '30', '3', '4', '2200', '2400', '70', '4', '12', '1');
INSERT INTO `a1dobra`.`models` (`model_id`, `jets_number`, `motors_number`, `horsepower_number`, `suggested_retail`, `unicorn_retail`, `water_capacity`, `seating_capacity`, `fk_spa_brands_brand_id`, `fk_energy_type_energy_id`) VALUES ('SPF-2', '15', '2', '2', '1000', '1200', '40', '2', '14', '2');
INSERT INTO `a1dobra`.`models` (`model_id`, `jets_number`, `motors_number`, `horsepower_number`, `suggested_retail`, `unicorn_retail`, `water_capacity`, `seating_capacity`, `fk_spa_brands_brand_id`, `fk_energy_type_energy_id`) VALUES ('REP-8', '20', '8', '7', '1500', '1400', '50', '2', '15', '3');
INSERT INTO `a1dobra`.`models` (`model_id`, `jets_number`, `motors_number`, `horsepower_number`, `suggested_retail`, `unicorn_retail`, `water_capacity`, `seating_capacity`, `fk_spa_brands_brand_id`, `fk_energy_type_energy_id`) VALUES ('REP-4', '25', '5', '6', '2500', '2000', '80', '4', '15', '4');
INSERT INTO `a1dobra`.`models` (`model_id`, `jets_number`, `motors_number`, `horsepower_number`, `suggested_retail`, `unicorn_retail`, `water_capacity`, `seating_capacity`, `fk_spa_brands_brand_id`, `fk_energy_type_energy_id`) VALUES ('UTF-4', '30', '4', '3', '3200', '3600', '110', '8', '16', '3');
INSERT INTO `a1dobra`.`models` (`model_id`, `jets_number`, `motors_number`, `horsepower_number`, `suggested_retail`, `unicorn_retail`, `water_capacity`, `seating_capacity`, `fk_spa_brands_brand_id`, `fk_energy_type_energy_id`) VALUES ('SOB-9', '70', '3', '12', '10000', '11000', '190', '12', '18', '3');

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
/* STEP 3 - CREATE QUERIES AND VIEWS */
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

/* 1 Create a view to list all large-capacity spas that have a seating capacity of 8 or more. Display brand
name, model number, retail price, and seating capacity. */

CREATE VIEW large_spas AS 
	SELECT spa_brands.brand_name, md.model_id, md.unicorn_retail, md.seating_capacity 
    FROM models as md
	INNER JOIN spa_brands sb ON md.fk_spa_brands_brand_id=sb.brand_id
    WHERE md.seating_capacity >= 8;

/* 2. Create a view to display wood-heated spas and their retail prices. */
CREATE VIEW wood_spas AS
	SELECT et.energy_type, models.suggested_retail, models.unicorn_retail
    FROM energy_type as et
    INNER JOIN models ON models.fk_energy_type_energy_id=et.energy_id;
    
/* 3. Generate a list of manufacturers and the number of brands each have. */
CREATE VIEW manufacturers_brands_amount AS
	SELECT mc.manufacturer_name, count(sb.fk_manufacturer_manufacturer_code) as brands_total 
    FROM manufacturer mc
    INNER JOIN spa_brands sb ON sb.fk_manufacturer_manufacturer_code=mc.manufacturer_code
    GROUP BY mc.manufacturer_name;
    
/* 4. Generate a list of manufacturers (company name), their brand names, and brand model names, and
heating source. Sort alphabetically by company name, brand name, and model name. */
CREATE VIEW manufacturers_models_detail AS
	SELECT mc.manufacturer_name, sb.brand_name, md.model_id, et.energy_type 
    FROM models as md
    INNER JOIN spa_brands sb ON sb.brand_id=md.fk_spa_brands_brand_id
    INNER JOIN energy_type et ON md.fk_energy_type_energy_id=et.energy_id
    INNER JOIN manufacturer mc ON sb.fk_manufacturer_manufacturer_code=mc.manufacturer_code
    ORDER BY mc.manufacturer_name, sb.brand_name, md.model_id ASC;

/* 5. Create a view to display model number, retail price and Unicorn Spa retail price for models that are
$3500 or less. */
CREATE VIEW lowprice_models AS
	SELECT md.model_id, md.suggested_retail, md.unicorn_retail
    FROM models as md
    WHERE md.unicorn_retail <= 3500;

/* 6. Update retail prices of spas that are $3500 or less. Due to shortages in manufacturer’s shipping
routes, Unicorn Spa retail price will increase by 20% for all retail prices $3500 or less. Use the view
you created in previous step. */
UPDATE lowprice_models 
	SET unicorn_retail=unicorn_retail*1.2
    WHERE unicorn_retail <= 3500;