USE aviation;

DROP TABLE IF EXISTS cifpExcluded;

CREATE TABLE cifpExcluded
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	ICAO varchar(4),
	termID varchar(10),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\cifpExcluded.txt' INTO TABLE cifpExcluded
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	ICAO,
	termID
);

CREATE INDEX cifpExcludedICAO ON cifpExcluded (ICAO) USING BTREE;

OPTIMIZE TABLE cifpExcluded;
