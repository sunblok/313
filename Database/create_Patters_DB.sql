TEE create_Patterns.txt

Use Patterns;
-- This enables dropping tables with foreign key dependencies.
-- It is specific to the InnoDB Engine.
SET FOREIGN_KEY_CHECKS = 0; 

-- Conditionally drop objects.
SELECT 'owner' AS "Drop Table";
DROP TABLE IF EXISTS owner;

SELECT 'owner' AS "Create Table";
CREATE TABLE owner
( owner_id              INT UNSIGNED   PRIMARY KEY AUTO_INCREMENT
, owner_name            CHAR(70)       NOT NULL
, owner_email           INT UNSIGNED   NOT NULL
, owner_date_created    DATE           NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Insert into owner
SELECT 'owner' AS "Insert Into";
INSERT INTO owner
( owner_name
, owner_email
, owner_date_created)
VALUES
('LaVona Comsa','daMom@gmail.com',UTC_DATE());


-- Conditionally drop objects.
SELECT 'publisher' AS "Drop Table";
DROP TABLE IF EXISTS publisher;

SELECT 'publisher' AS "Create Table";
CREATE TABLE publisher
( publisher_id           INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, publisher_name         CHAR(70)     NOT NULL
, publisher_date_created DATE         NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Insert into owner
SELECT 'publisher' AS "Insert Into";
INSERT INTO publisher
( publisher_name
, publisher_date_created)
VALUES
('Mccalls', UTC_DATE());

-- Conditionally drop objects.
SELECT 'pType' AS "Drop Table";
DROP TABLE IF EXISTS pType;

SELECT 'pType' AS "Create Table";
CREATE TABLE pType
( pType_id           INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, pType_name         CHAR(5)     NOT NULL
, pType_date_created DATE        NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Insert into pType
SELECT 'pType' AS "Insert Into";
INSERT INTO pType
( pType_name
, pType_date_created)
VALUES
('Dress', UTC_DATE());


-- Conditionally drop objects.
SELECT 'pSize' AS "Drop Table";
DROP TABLE IF EXISTS pSize;

SELECT 'pSize' AS "Create Table";
CREATE TABLE pSize
( pSize_id           INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, pSize_size         CHAR(5)     NOT NULL
, pSize_date_created DATE        NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Insert into pSize
SELECT 'pSize' AS "Insert Into";

INSERT INTO pSize
( pSize_size
, pSize_date_created)
VALUES
('XS', UTC_DATE());

INSERT INTO pSize
( pSize_size
, pSize_date_created)
VALUES
('S', UTC_DATE());

INSERT INTO pSize
( pSize_size
, pSize_date_created)
VALUES
('M', UTC_DATE());

INSERT INTO pSize
( pSize_size
, pSize_date_created)
VALUES
('L', UTC_DATE());

INSERT INTO pSize
( pSize_size
, pSize_date_created)
VALUES
('XL', UTC_DATE());

-- Conditionally drop objects.
SELECT 'pattern' AS "Drop Table";
DROP TABLE IF EXISTS pattern;

SELECT 'pattern' AS "Create Table";
CREATE TABLE pattern
( pattern_id           INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, pattern_name         CHAR(70)       NOT NULL
, pattern_number       VARCHAR(20)    NOT NULL
, pattern_dateAdded    DATE           NOT NULL
, pattern_picture      VARCHAR(200)   NOT NULL
, pattern_publisher    INT UNSIGNED   NOT NULL
, pattern_date_created DATE           NOT NULL
, KEY pattern_fk1 (pattern_publisher)
, CONSTRAINT pattern_fk1 FOREIGN KEY (pattern_publisher) REFERENCES publisher (publisher_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO pattern
( pattern_name
, pattern_number
, pattern_dateAdded
, pattern_picture
, pattern_publisher
, pattern_date_created)
VALUES
('Misses\'\/Miss Petite Dress','6698MCC','Database/Pictures/mcc6698.jpg'
, (SELECT publisher_id
   FROM publisher
   WHERE publisher_name - 'Mccalls')
,UTC_DATE());


-- Conditionally drop objects.
SELECT 'pattern_Type' AS "Drop Table";
DROP TABLE IF EXISTS pattern_Type;

SELECT 'type_Pattern' AS "Create Table";
CREATE TABLE type_Pattern
( type_Pattern_id           INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, type_Pattern_pType         INT UNSIGNED     NOT NULL
, type_Pattern_pattern      INT UNSIGNED     NOT NULL
, KEY type_Pattern_fk1 (pattern_Type_pType)
, CONSTRAINT type_Pattern_fk1 FOREIGN KEY (type_Pattern_pType) REFERENCES pType (pType_id)
, KEY type_Pattern_fk2 (type_Pattern_pattern)
, CONSTRAINT type_Pattern_fk2 FOREIGN KEY (type_Pattern_pattern) REFERENCES pattern (pattern_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Conditionally drop objects.
SELECT 'size_Pattern' AS "Drop Table";
DROP TABLE IF EXISTS size_Pattern;

SELECT 'size_Pattern' AS "Create Table";
CREATE TABLE size_Pattern
( size_Pattern_id           INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, size_Pattern_pSize        INT UNSIGNED     NOT NULL
, size_Pattern_pattern      INT UNSIGNED     NOT NULL
, KEY size_Pattern_fk1 (size_Pattern_pSize)
, CONSTRAINT size_Pattern_fk1 FOREIGN KEY (size_Pattern_pSize) REFERENCES pSize (pSize_id)
, KEY size_Pattern_fk2 (size_Pattern_pattern)
, CONSTRAINT size_Pattern_fk2 FOREIGN KEY (size_Pattern_pattern) REFERENCES pattern (pattern_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- Conditionally drop objects.
SELECT 'owner_Pattern' AS "Drop Table";
DROP TABLE IF EXISTS owner_Pattern;

SELECT 'owner_Pattern' AS "Create Table";
CREATE TABLE owner_Pattern
( owner_Pattern_id           INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, owner_Pattern_pSize        INT UNSIGNED     NOT NULL
, owner_Pattern_pattern      INT UNSIGNED     NOT NULL
, KEY owner_Pattern_fk1 (owner_Pattern_pSize)
, CONSTRAINT owner_Pattern_fk1 FOREIGN KEY (owner_Pattern_pSize) REFERENCES owner (owner_id)
, KEY owner_Pattern_fk2 (owner_Pattern_pattern)
, CONSTRAINT owner_Pattern_fk2 FOREIGN KEY (owner_Pattern_pattern) REFERENCES pattern (pattern_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

