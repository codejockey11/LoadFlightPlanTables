USE aviation;

DROP TABLE IF EXISTS cbTitle;

CREATE TABLE cbTitle
(
	title varchar(128),
	author varchar(128),
	primary key(title)
)
COLLATE ascii_bin;

DROP TABLE IF EXISTS cbIngredients;

CREATE TABLE cbIngredients
(
	title varchar(128),
	name varchar(128),
	INDEX USING BTREE(title)
)
COLLATE ascii_bin;

DROP TABLE IF EXISTS cbSteps;

CREATE TABLE cbSteps
(
	title varchar(128),
	text varchar(4096),
	INDEX USING BTREE(title)
)
COLLATE ascii_bin;

OPTIMIZE TABLE cbTitle;
OPTIMIZE TABLE cbIngrediants;
OPTIMIZE TABLE cbSteps;
