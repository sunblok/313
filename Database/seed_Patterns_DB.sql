TEE texts/seed_Patterns.txt

Use Patterns;
-- Insert into owner
SELECT 'owner' AS "Insert Into";
INSERT INTO owner
( owner_name
, owner_email
, owner_date_created
, owner_user_name
, owner_password)
VALUES
('LaVona Comsa','daMom@gmail.com',UTC_DATE(),'mom','62d8aadc3115f596fa3e6a974f0d2a24de6d5473a7c3d26b7aa01c8b6bee57ae')
,
('Jeane Leake','notDaMom@gmail.com',UTC_DATE(),'notmom','ec5d7962c047c5f1443aa3e4fa935b62fd941a76d0fe0f60e6aeb122b55f0f21')
,
('Root','Root@gmail.com',UTC_DATE(),'test','5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8');
SHOW WARNINGS;



-- Insert into publisher
SELECT 'publisher' AS "Insert Into";
INSERT INTO publisher
( publisher_name
, publisher_date_created)
VALUES
('Mccalls', UTC_DATE())
,('Butterick', UTC_DATE())
,('Vouge', UTC_DATE())
,('Kwik Sew', UTC_DATE())
,('Wallies', UTC_DATE())
,('Burda', UTC_DATE())
,('Simplicity', UTC_DATE())
,('NewLook', UTC_DATE())
,('Neue Mode', UTC_DATE())
;
SHOW WARNINGS;


-- Insert into pType
SELECT 'pType' AS "Insert Into";
INSERT INTO pType
( pType_name
, pType_date_created)
VALUES
('Dress', UTC_DATE())
,('Pants', UTC_DATE())
,('Top', UTC_DATE())
,('Skirt', UTC_DATE())
,('Jacket', UTC_DATE())
,('Costume', UTC_DATE())
,('Children', UTC_DATE())
,('Baby', UTC_DATE())
,('Bridal', UTC_DATE())
,('Evening', UTC_DATE())
,('Prom', UTC_DATE())
,('Cape', UTC_DATE())
,('Shorts', UTC_DATE())
,('Activewear', UTC_DATE())
,('Suit', UTC_DATE())
,('Vest', UTC_DATE())
,('Tunic', UTC_DATE())
,('Poncho', UTC_DATE())
,('Apron', UTC_DATE())
,('Uniform', UTC_DATE())
,('Sleapwear', UTC_DATE())
,('Crafts', UTC_DATE())
,('Halloween', UTC_DATE())
,('Historical', UTC_DATE())
,('Religious', UTC_DATE())
,('Accessory', UTC_DATE())
;
SHOW WARNINGS;


-- Insert into pSize
SELECT 'pSize' AS "Insert Into";

INSERT INTO pSize
( pSize_size
, pSize_date_created)
VALUES
('XS', UTC_DATE())
,('S', UTC_DATE())
,('M', UTC_DATE())
,('L', UTC_DATE())
,('XL', UTC_DATE())
;
SHOW WARNINGS;

-- Insert into pattern
SELECT 'pattern' AS "Insert Into";
INSERT INTO pattern
( pattern_name
, pattern_number
, pattern_picture
, pattern_publisher
, pattern_date_created)
VALUES
('Misses/Miss Petite Dress'
, '6698MCC'
, 'Database/Pictures/mcc6698.jpg'
, (SELECT publisher_id
   FROM publisher
   WHERE publisher_name = 'Mccalls')
,UTC_DATE()
)
,
('Dress and Tunic'
, '6936BUR'
, 'Database/Pictures/bur6936.jpg'
, (SELECT publisher_id
   FROM publisher
   WHERE publisher_name = 'Burda')
,UTC_DATE()
)
,
('Jacket'
, '6901BUR'
, 'Database/Pictures/bur6901.jpg'
, (SELECT publisher_id
   FROM publisher
   WHERE publisher_name = 'Burda')
,UTC_DATE()
);
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
)
,
((SELECT pType_id
   FROM pType
   WHERE pType_name = 'Pants')
, (SELECT pattern_id
   FROM pattern
   WHERE pattern_number = '6936BUR')
)
,
((SELECT pType_id
   FROM pType
   WHERE pType_name = 'Tunic')
, (SELECT pattern_id
   FROM pattern
   WHERE pattern_number = '6936BUR')
)
,
((SELECT pType_id
   FROM pType
   WHERE pType_name = 'Jacket')
, (SELECT pattern_id
   FROM pattern
   WHERE pattern_number = '6901BUR')
);
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
)
,
((SELECT pSize_id
   FROM pSize
   WHERE pSize_size = 'M')
, (SELECT pattern_id
   FROM pattern
   WHERE pattern_number = '6936BUR')
)
,
((SELECT pSize_id
   FROM pSize
   WHERE pSize_size = 'M')
, (SELECT pattern_id
   FROM pattern
   WHERE pattern_number = '6901BUR')
);
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
)
,
((SELECT owner_id
   FROM owner
   WHERE owner_name = 'LaVona Comsa')
, (SELECT pattern_id
   FROM pattern
   WHERE pattern_number = '6936BUR')
)
,
((SELECT owner_id
   FROM owner
   WHERE owner_name = 'LaVona Comsa')
, (SELECT pattern_id
   FROM pattern
   WHERE pattern_number = '6901BUR')
);
SHOW WARNINGS;

SELECT 'Commit' as 'Commit';
-- Commit inserts.
COMMIT;

-- Close log file.
NOTEE

