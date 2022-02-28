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