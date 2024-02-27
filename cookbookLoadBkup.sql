USE aviation;

DROP TABLE IF EXISTS cbTitle;

CREATE TABLE cbTitle
(
	title VARCHAR(128),
	author VARCHAR(128),
	PRIMARY KEY(title)
)
COLLATE ascii_bin;

DROP TABLE IF EXISTS cbIngredients;

CREATE TABLE cbIngredients
(
	title VARCHAR(128),
	name VARCHAR(128),
	INDEX USING BTREE(title)
)
COLLATE ascii_bin;

DROP TABLE IF EXISTS cbSteps;

CREATE TABLE cbSteps
(
	title VARCHAR(128),
	text VARCHAR(4096),
	INDEX USING BTREE(title)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\cbTitle.txt' INTO TABLE cbTitle
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n';

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\cbIngredients.txt' INTO TABLE cbIngredients
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n';

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\cbSteps.txt' INTO TABLE cbSteps
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n';
	
UPDATE cbSteps SET text = REPLACE(text, '*', '\r\n');

OPTIMIZE TABLE cbTitle;
OPTIMIZE TABLE cbIngrediants;
OPTIMIZE TABLE cbSteps;
