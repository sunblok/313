TEE texts/create_BO.txt

Use BORecipies;
-- This enables dropping tables with foreign key dependencies.
-- It is specific to the InnoDB Engine.
SET FOREIGN_KEY_CHECKS = 0; 

-- Conditionally drop objects.
SELECT 'ingredient' AS "Drop Table";
DROP TABLE IF EXISTS ingredient;

SELECT 'ingredient' AS "Create Table";
CREATE TABLE ingredient
( ing_id              INT UNSIGNED   PRIMARY KEY AUTO_INCREMENT
, ing_name            CHAR(70)       NOT NULL UNIQUE
, ing_BOID            INT UNSIGNED   UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SHOW WARNINGS;

-- Conditionally drop objects.
SELECT 'recipe_list' AS "Drop Table";
DROP TABLE IF EXISTS recipe_list;

SELECT 'recipe_list' AS "Create Table";
CREATE TABLE recipe_list
( r_l_id           INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, r_l_ingredient   INT UNSIGNED   NOT NULL
, KEY r_l_fk1 ( r_l_ingredient)
, CONSTRAINT r_l_fk1 FOREIGN KEY (r_l_ingredient) REFERENCES ingredient (ing_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SHOW WARNINGS;

-- Conditionally drop objects.
SELECT 'recipe' AS "Drop Table";
DROP TABLE IF EXISTS recipe;

SELECT 'recipe' AS "Create Table";
CREATE TABLE recipe
( recipe_id           INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, recipe_name         CHAR(70)     NOT NULL
, recipe_BOID         INT UNSIGNED NOT NULL
, recipe_list_list         INT UNSIGNED NOT NULL
, KEY recipe_fk1 (recipe_list_list)
, CONSTRAINT recipe_fk1 FOREIGN KEY (recipe_list_list) REFERENCES recipe_list (r_l_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SHOW WARNINGS;


SELECT 'Foreign_KEY_CHECKS = 1' as 'SET';
SET FOREIGN_KEY_CHECKS = 1;

SELECT 'Commit' as 'Commit';
-- Commit inserts.
COMMIT;

SELECT 'Show Tables' as 'Select';
-- Display tables.
SHOW TABLES;

-- Close log file.
NOTEE
SOURCE seed_BO.sql