TEE create_Actors.txt

Use Actors;
-- This enables dropping tables with foreign key dependencies.
-- It is specific to the InnoDB Engine.
SET FOREIGN_KEY_CHECKS = 0; 

-- Conditionally drop objects.
SELECT 'actor' AS "Drop Table";
DROP TABLE IF EXISTS actor;

SELECT 'actor' AS "Create Table";
CREATE TABLE actor
( actor_id              INT UNSIGNED   PRIMARY KEY AUTO_INCREMENT
, actor_name            CHAR(70)       NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SHOW WARNINGS;

-- Conditionally drop objects.
SELECT 'movie' AS "Drop Table";
DROP TABLE IF EXISTS movie;

SELECT 'movie' AS "Create Table";
CREATE TABLE movie
( movie_id           INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, movie_name         CHAR(70)     NOT NULL
, movie_year         SMALLINT     NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SHOW WARNINGS;

-- Conditionally drop objects.
SELECT 'actor_movie' AS "Drop Table";
DROP TABLE IF EXISTS actor_movie;

SELECT 'actor_movie' AS "Create Table";
CREATE TABLE actor_movie
( actor_movie_id           INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, actor_movie_character    varchar(100)      NOT NULL
, actor_movie_actor         INT UNSIGNED     NOT NULL
, actor_movie_movie      INT UNSIGNED     NOT NULL
, KEY actor_movie_fk1 (actor_movie_actor)
, CONSTRAINT actor_movie_fk1 FOREIGN KEY (actor_movie_actor) REFERENCES actor (actor_id)
, KEY actor_movie_fk2 (actor_movie_movie)
, CONSTRAINT actor_movie_fk2 FOREIGN KEY (actor_movie_movie) REFERENCES movie (movie_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SHOW WARNINGS;

SELECT 'actor' AS "Insert Into";
INSERT INTO actor
( actor_name)
VALUES
('Harrison Ford');
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