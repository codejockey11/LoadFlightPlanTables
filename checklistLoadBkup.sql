USE aviation;

DROP TABLE IF EXISTS checklist;

CREATE TABLE checklist
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	pilotId varchar(50),
	registration varchar(50),
	image varchar(255),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\checklist.txt' INTO TABLE checklist
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	pilotId,
	registration,
	image
);

OPTIMIZE TABLE checklist;
