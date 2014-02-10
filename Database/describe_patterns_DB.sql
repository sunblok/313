TEE texts/Describe_Patterns_DB.txt

Use Patterns;

SELECT 'Show Tables' as 'SELECT';
-- Display tables.
SHOW TABLES;

SELECT 'owner' as 'DESCRIBE';
DESCRIBE owner;
SHOW CREATE TABLE owner;
SELECT * FROM owner; 

SELECT 'owner_Pattern' as 'DESCRIBE';
DESCRIBE owner_Pattern;
SHOW CREATE TABLE owner_Pattern;
SELECT * FROM owner_Pattern;

SELECT 'pSize' as 'DESCRIBE';
DESCRIBE pSize;
SHOW CREATE TABLE pSize;
SELECT * FROM pSize;

SELECT 'pType' as 'DESCRIBE';
DESCRIBE pType;
SHOW CREATE TABLE pType;
SELECT * FROM pType;

SELECT 'pattern' as 'DESCRIBE';
DESCRIBE pattern;
SHOW CREATE TABLE pattern;
SELECT * FROM pattern;

SELECT 'publisher' as 'DESCRIBE';
DESCRIBE publisher;
SHOW CREATE TABLE publisher;
SELECT * FROM publisher;

SELECT 'size_Pattern' as 'DESCRIBE';
DESCRIBE size_Pattern;
SHOW CREATE TABLE size_Pattern;
SELECT * FROM size_Pattern;

SELECT 'type_Pattern' as 'DESCRIBE';
DESCRIBE type_Pattern;
SHOW CREATE TABLE type_Pattern;
SELECT * FROM type_Pattern;

-- Close log file.
NOTEE