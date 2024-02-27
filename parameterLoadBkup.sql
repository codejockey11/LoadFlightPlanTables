USE aviation;

DROP TABLE IF EXISTS parameter;

CREATE TABLE parameter
(
	name varchar(256),
	value1 varchar(256),
	value2 varchar(256),
	value3 varchar(256),
	value4 varchar(256),
	PRIMARY KEY(name)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\parameter.txt' INTO TABLE parameter
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	name,
	value1,
	value2,
	value3,
	value4
);

OPTIMIZE TABLE parameter;
