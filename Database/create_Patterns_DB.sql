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
SHOW WARNINGS;

-- Insert into owner
SELECT 'owner' AS "Insert Into";
INSERT INTO owner
( owner_name
, owner_email
, owner_date_created)
VALUES
('LaVona Comsa','daMom@gmail.com',UTC_DATE());
SHOW WARNINGS;

-- Insert into owner
SELECT 'owner' AS "Insert Into";
INSERT INTO owner
( owner_name
, owner_email
, owner_date_created)
VALUES
('Jeane Leake','notDaMom@gmail.com',UTC_DATE());
SHOW WARNINGS;

-- Conditionally drop objects.
SELECT 'publisher' AS "Drop Table";
DROP TABLE IF EXISTS publisher;

SELECT 'publisher' AS "Create Table";
CREATE TABLE publisher
( publisher_id           INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, publisher_name         CHAR(70)     NOT NULL
, publisher_date_created DATE         NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SHOW WARNINGS;

-- Insert into owner
SELECT 'publisher' AS "Insert Into";
INSERT INTO publisher
( publisher_name
, publisher_date_created)
VALUES
('Mccalls', UTC_DATE());
SHOW WARNINGS;

-- Insert into owner
SELECT 'publisher' AS "Insert Into";
INSERT INTO publisher
( publisher_name
, publisher_date_created)
VALUES
('Butterick', UTC_DATE());
SHOW WARNINGS;

-- Insert into owner
SELECT 'publisher' AS "Insert Into";
INSERT INTO publisher
( publisher_name
, publisher_date_created)
VALUES
('Vouge', UTC_DATE());
SHOW WARNINGS;

-- Insert into owner
SELECT 'publisher' AS "Insert Into";
INSERT INTO publisher
( publisher_name
, publisher_date_created)
VALUES
('Kwik Sew', UTC_DATE());
SHOW WARNINGS;

-- Insert into owner
SELECT 'publisher' AS "Insert Into";
INSERT INTO publisher
( publisher_name
, publisher_date_created)
VALUES
('Wallies', UTC_DATE());
SHOW WARNINGS;

-- Insert into owner
SELECT 'publisher' AS "Insert Into";
INSERT INTO publisher
( publisher_name
, publisher_date_created)
VALUES
('Burda', UTC_DATE());
SHOW WARNINGS;

-- Insert into owner
SELECT 'publisher' AS "Insert Into";
INSERT INTO publisher
( publisher_name
, publisher_date_created)
VALUES
('Simplicity', UTC_DATE());
SHOW WARNINGS;

-- Insert into owner
SELECT 'publisher' AS "Insert Into";
INSERT INTO publisher
( publisher_name
, publisher_date_created)
VALUES
('NewLook', UTC_DATE());
SHOW WARNINGS;

-- Insert into owner
SELECT 'publisher' AS "Insert Into";
INSERT INTO publisher
( publisher_name
, publisher_date_created)
VALUES
('Neue Mode', UTC_DATE());
SHOW WARNINGS;

-- Conditionally drop objects.
SELECT 'pType' AS "Drop Table";
DROP TABLE IF EXISTS pType;

SELECT 'pType' AS "Create Table";
CREATE TABLE pType
( pType_id           INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, pType_name         VarCHAR(20)     NOT NULL
, pType_date_created DATE        NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SHOW WARNINGS;

-- Insert into pType
SELECT 'pType' AS "Insert Into";
INSERT INTO pType
( pType_name
, pType_date_created)
VALUES
('Dress', UTC_DATE());
SHOW WARNINGS;

-- Insert into pType
SELECT 'pType' AS "Insert Into";
INSERT INTO pType
( pType_name
, pType_date_created)
VALUES
('Pants', UTC_DATE());
SHOW WARNINGS;

-- Insert into pType
SELECT 'pType' AS "Insert Into";
INSERT INTO pType
( pType_name
, pType_date_created)
VALUES
('Top', UTC_DATE());
SHOW WARNINGS;

-- Insert into pType
SELECT 'pType' AS "Insert Into";
INSERT INTO pType
( pType_name
, pType_date_created)
VALUES
('Skirt', UTC_DATE());
SHOW WARNINGS;

-- Insert into pType
SELECT 'pType' AS "Insert Into";
INSERT INTO pType
( pType_name
, pType_date_created)
VALUES
('Jaket', UTC_DATE());
SHOW WARNINGS;

-- Insert into pType
SELECT 'pType' AS "Insert Into";
INSERT INTO pType
( pType_name
, pType_date_created)
VALUES
('Costume', UTC_DATE());
SHOW WARNINGS;

-- Insert into pType
SELECT 'pType' AS "Insert Into";
INSERT INTO pType
( pType_name
, pType_date_created)
VALUES
('Children', UTC_DATE());
SHOW WARNINGS;

-- Insert into pType
SELECT 'pType' AS "Insert Into";
INSERT INTO pType
( pType_name
, pType_date_created)
VALUES
('Baby', UTC_DATE());
SHOW WARNINGS;

-- Insert into pType
SELECT 'pType' AS "Insert Into";
INSERT INTO pType
( pType_name
, pType_date_created)
VALUES
('Bridal', UTC_DATE());
SHOW WARNINGS;

-- Insert into pType
SELECT 'pType' AS "Insert Into";
INSERT INTO pType
( pType_name
, pType_date_created)
VALUES
('Evening', UTC_DATE());
SHOW WARNINGS;

-- Insert into pType
SELECT 'pType' AS "Insert Into";
INSERT INTO pType
( pType_name
, pType_date_created)
VALUES
('Prom', UTC_DATE());
SHOW WARNINGS;

-- Insert into pType
SELECT 'pType' AS "Insert Into";
INSERT INTO pType
( pType_name
, pType_date_created)
VALUES
('Cape', UTC_DATE());
SHOW WARNINGS;

-- Insert into pType
SELECT 'pType' AS "Insert Into";
INSERT INTO pType
( pType_name
, pType_date_created)
VALUES
('Shorts', UTC_DATE());
SHOW WARNINGS;

-- Insert into pType
SELECT 'pType' AS "Insert Into";
INSERT INTO pType
( pType_name
, pType_date_created)
VALUES
('Activewear', UTC_DATE());
SHOW WARNINGS;

-- Insert into pType
SELECT 'pType' AS "Insert Into";
INSERT INTO pType
( pType_name
, pType_date_created)
VALUES
('Suit', UTC_DATE());
SHOW WARNINGS;

-- Insert into pType
SELECT 'pType' AS "Insert Into";
INSERT INTO pType
( pType_name
, pType_date_created)
VALUES
('Vest', UTC_DATE());
SHOW WARNINGS;

-- Insert into pType
SELECT 'pType' AS "Insert Into";
INSERT INTO pType
( pType_name
, pType_date_created)
VALUES
('Poncho', UTC_DATE());
SHOW WARNINGS;

-- Insert into pType
SELECT 'pType' AS "Insert Into";
INSERT INTO pType
( pType_name
, pType_date_created)
VALUES
('Apron', UTC_DATE());
SHOW WARNINGS;

-- Insert into pType
SELECT 'pType' AS "Insert Into";
INSERT INTO pType
( pType_name
, pType_date_created)
VALUES
('Uniform', UTC_DATE());
SHOW WARNINGS;

-- Insert into pType
SELECT 'pType' AS "Insert Into";
INSERT INTO pType
( pType_name
, pType_date_created)
VALUES
('Sleapwear', UTC_DATE());
SHOW WARNINGS;

-- Insert into pType
SELECT 'pType' AS "Insert Into";
INSERT INTO pType
( pType_name
, pType_date_created)
VALUES
('Crafts', UTC_DATE());
SHOW WARNINGS;

-- Insert into pType
SELECT 'pType' AS "Insert Into";
INSERT INTO pType
( pType_name
, pType_date_created)
VALUES
('Halloween', UTC_DATE());
SHOW WARNINGS;

-- Insert into pType
SELECT 'pType' AS "Insert Into";
INSERT INTO pType
( pType_name
, pType_date_created)
VALUES
('Historical', UTC_DATE());
SHOW WARNINGS;

-- Insert into pType
SELECT 'pType' AS "Insert Into";
INSERT INTO pType
( pType_name
, pType_date_created)
VALUES
('Religious', UTC_DATE());
SHOW WARNINGS;

-- Insert into pType
SELECT 'pType' AS "Insert Into";
INSERT INTO pType
( pType_name
, pType_date_created)
VALUES
('Accessory', UTC_DATE());
SHOW WARNINGS;

-- Conditionally drop objects.
SELECT 'pSize' AS "Drop Table";
DROP TABLE IF EXISTS pSize;

SELECT 'pSize' AS "Create Table";
CREATE TABLE pSize
( pSize_id           INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, pSize_size         CHAR(5)     NOT NULL
, pSize_date_created DATE        NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SHOW WARNINGS;

-- Insert into pSize
SELECT 'pSize' AS "Insert Into";

INSERT INTO pSize
( pSize_size
, pSize_date_created)
VALUES
('XS', UTC_DATE());
SHOW WARNINGS;

INSERT INTO pSize
( pSize_size
, pSize_date_created)
VALUES
('S', UTC_DATE());
SHOW WARNINGS;

INSERT INTO pSize
( pSize_size
, pSize_date_created)
VALUES
('M', UTC_DATE());
SHOW WARNINGS;

INSERT INTO pSize
( pSize_size
, pSize_date_created)
VALUES
('L', UTC_DATE());
SHOW WARNINGS;

INSERT INTO pSize
( pSize_size
, pSize_date_created)
VALUES
('XL', UTC_DATE());
SHOW WARNINGS;

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
SHOW WARNINGS;

-- Insert into pattern
SELECT 'pattern' AS "Insert Into";
INSERT INTO pattern
( pattern_name
, pattern_number
, pattern_dateAdded
, pattern_picture
, pattern_publisher
, pattern_date_created)
VALUES
('Misses/Miss Petite Dress'
, '6698MCC'
, UTC_DATE()
, 'Database/Pictures/mcc6698.jpg'
, (SELECT publisher_id
   FROM publisher
   WHERE publisher_name = 'Mccalls')
,UTC_DATE());
SHOW WARNINGS;


-- Conditionally drop objects.
SELECT 'type_Pattern' AS "Drop Table";
DROP TABLE IF EXISTS type_Pattern;

SELECT 'type_Pattern' AS "Create Table";
CREATE TABLE type_Pattern
( type_Pattern_id           INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, type_Pattern_pType         INT UNSIGNED     NOT NULL
, type_Pattern_pattern      INT UNSIGNED     NOT NULL
, KEY type_Pattern_fk1 (type_Pattern_pType)
, CONSTRAINT type_Pattern_fk1 FOREIGN KEY (type_Pattern_pType) REFERENCES pType (pType_id)
, KEY type_Pattern_fk2 (type_Pattern_pattern)
, CONSTRAINT type_Pattern_fk2 FOREIGN KEY (type_Pattern_pattern) REFERENCES pattern (pattern_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SHOW WARNINGS;

-- Insert into type_Pattern
SELECT 'type_Pattern' AS "Insert Into";
INSERT INTO type_Pattern
( type_Pattern_pType
, type_Pattern_pattern)
VALUES
((SELECT pType_id
   FROM pType
   WHERE pType_name = 'Dress')
, (SELECT pattern_id
   FROM pattern
   WHERE pattern_number = '6698MCC')
);
SHOW WARNINGS;


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
SHOW WARNINGS;

-- Insert into size_Pattern
SELECT 'size_Pattern' AS "Insert Into";
INSERT INTO size_Pattern
( size_Pattern_pSize
, size_Pattern_pattern)
VALUES
((SELECT pSize_id
   FROM pSize
   WHERE pSize_size = 'M')
, (SELECT pattern_id
   FROM pattern
   WHERE pattern_number = '6698MCC')
);
SHOW WARNINGS;



-- Conditionally drop objects.
SELECT 'owner_Pattern' AS "Drop Table";
DROP TABLE IF EXISTS owner_Pattern;

-- Creates owner_Pattern table.
SELECT 'owner_Pattern' AS "Create Table";
CREATE TABLE owner_Pattern
( owner_Pattern_id           INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, owner_Pattern_owner        INT UNSIGNED     NOT NULL
, owner_Pattern_pattern      INT UNSIGNED     NOT NULL
, KEY owner_Pattern_fk1 (owner_Pattern_owner)
, CONSTRAINT owner_Pattern_fk1 FOREIGN KEY (owner_Pattern_owner) REFERENCES owner (owner_id)
, KEY owner_Pattern_fk2 (owner_Pattern_pattern)
, CONSTRAINT owner_Pattern_fk2 FOREIGN KEY (owner_Pattern_pattern) REFERENCES pattern (pattern_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SHOW WARNINGS;

-- Insert into owner_Pattern
SELECT 'owner_Pattern' AS "Insert Into";
INSERT INTO owner_Pattern
( owner_Pattern_owner
, owner_Pattern_pattern)
VALUES
((SELECT owner_id
   FROM owner
   WHERE owner_name = 'LaVona Comsa')
, (SELECT pattern_id
   FROM pattern
   WHERE pattern_number = '6698MCC')
);
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