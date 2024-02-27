USE aviation;

DROP TABLE IF EXISTS parameter;

CREATE TABLE parameter
(
	name varchar(100),
	value1 varchar(1000),
	value2 varchar(1000),
	value3 varchar(1000),
	value4 varchar(1000),
	PRIMARY KEY(name)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\parameter.dat' INTO TABLE parameter
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	name,
	value1,
	value2,
	value3,
	value4
);
