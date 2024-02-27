USE aviation;

DROP TABLE IF EXISTS aircraft;

CREATE TABLE aircraft
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	holder varchar(76),
	model varchar(65),
	TCDS varchar(33),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\aircraft.txt' INTO TABLE aircraft
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	holder,
	model,
	TCDS
);

OPTIMIZE TABLE aircraft;

/*
holder,model,TCDS
*/