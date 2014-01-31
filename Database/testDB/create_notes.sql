TEE create_notes.txt

Use note_DB;
-- This enables dropping tables with foreign key dependencies.
-- It is specific to the InnoDB Engine.
SET FOREIGN_KEY_CHECKS = 0; 

-- Conditionally drop objects.
SELECT 'users' AS "Drop Table";
DROP TABLE IF EXISTS users;
-- ------------------------------------------------------------------
-- Create users table.
-- ------------------------------------------------------------------
SELECT 'users' AS "Create Table";
CREATE TABLE users
( user_id                     INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, user_name                   VARCHAR(200)     NOT NULL
, user_pass                   VARCHAR(200)     NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SHOW WARNINGS;
-- Insert into user
SELECT 'users' AS "Insert Into";
INSERT INTO users
( user_name
, user_pass)
VALUES
('RedD','Pass');
SHOW WARNINGS;

-- Conditionally drop objects.
SELECT 'conference' AS "Drop Table";
DROP TABLE IF EXISTS conference;
-- ------------------------------------------------------------------
-- Create users table.
-- ------------------------------------------------------------------
SELECT 'conference' AS "Create Table";
CREATE TABLE conference
( conference_id         INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, conference_year       INT UNSIGNED NOT NULL
, conference_month      ENUM('April','October') DEFAULT 'October'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SHOW WARNINGS;
-- Insert into user
SELECT 'conference' AS "Insert Into";
INSERT INTO conference
( conference_year
, conference_month)
VALUES
(2013,'October');
SHOW WARNINGS;

-- Conditionally drop objects.
SELECT 'speaker' AS "Drop Table";
DROP TABLE IF EXISTS speaker;
-- ------------------------------------------------------------------
-- Create speaker table.
-- ------------------------------------------------------------------
SELECT 'speaker' AS "Create Table";
CREATE TABLE speaker
( speaker_id            INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, speaker_name          CHAR(200)     NOT NULL
, speaker_title         CHAR(200)     NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SHOW WARNINGS;
-- Insert into user
SELECT 'speaker' AS "Insert Into";
INSERT INTO speaker
( speaker_name
, speaker_title)
VALUES
('Thomas S. Monson','President');
SHOW WARNINGS;

-- Conditionally drop objects.
SELECT 'talk' AS "Drop Table";
DROP TABLE IF EXISTS talk;
-- ------------------------------------------------------------------
-- Create users table.
-- ------------------------------------------------------------------
SELECT 'talk' AS "Create Table";
CREATE TABLE talk
( talk_id                     INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, talk_speaker                INT UNSIGNED NOT NULL
, talk_conference             INT UNSIGNED NOT NULL
, KEY talk_speaker_fk1 (talk_speaker)
, CONSTRAINT talk_speaker_fk1 FOREIGN KEY (talk_speaker) REFERENCES speaker (speaker_id)
, KEY talk_conference_fk2 (talk_conference)
, CONSTRAINT talk_conference_fk2 FOREIGN KEY (talk_conference) REFERENCES conference (conference_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SHOW WARNINGS;
-- Insert into talk
SELECT 'talk' AS "Insert Into";
INSERT INTO talk
( talk_speaker
, talk_conference)
VALUES
((SELECT speaker_id
   FROM  speaker
   WHERE speaker_name = 'Thomas S. Monson')
,(SELECT conference_id
   FROM  conference
   WHERE conference_year = 2013
   AND   conference_month = 'October'));
SHOW WARNINGS;




-- Conditionally drop objects.
SELECT 'notes' AS "Drop Table";
DROP TABLE IF EXISTS notes;
-- ------------------------------------------------------------------
-- Create Notes table.
-- ------------------------------------------------------------------
SELECT 'notes' AS "Create Table";
CREATE TABLE notes
( notes_user_id               INT UNSIGNED         PRIMARY KEY AUTO_INCREMENT
, notes_content               VARCHAR(2000)       NOT NULL
, notes_user                  INT UNSIGNED         NOT NULL
, notes_talk                  INT UNSIGNED         NOT NULL
, creation_date               DATE                 NOT NULL
, KEY notes_user_fk1 (notes_user)
, CONSTRAINT notes_user_fk1 FOREIGN KEY (notes_user) REFERENCES users (user_id)
, KEY system_user_fk2 (notes_talk)
, CONSTRAINT system_user_fk2 FOREIGN KEY (notes_talk) REFERENCES talks (talk_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SHOW WARNINGS;

-- Insert into notes
SELECT 'notes' AS "Insert Into";
INSERT INTO notes
( notes_content
, notes_user
, notes_talk
, creation_date)
VALUES
('These are notes'
,(SELECT user_id
   FROM  users
   WHERE user_name = 'RedD')
,(SELECT talk_id
   FROM  talk
   WHERE talk_speaker = 
   (SELECT speaker_id
    FROM speaker
    WHERE speaker_name = 'Thomas S. Monson'))
 ,UTC_DATE());
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
