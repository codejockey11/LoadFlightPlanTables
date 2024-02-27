USE aviation;

DROP TABLE IF EXISTS fixLocation;

CREATE TABLE fixLocation
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	fixId varchar(5),
	state varchar(30),
	region varchar(4),
	latitude varchar(50),
	longitude varchar(50),
	magVar varchar(10),
	category varchar(4),
	fixUsage varchar(15),
	nasId varchar(5),
	highArtcc varchar(4),
	lowArtcc varchar(4),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\fixLocationSorted.txt' INTO TABLE fixLocation
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	fixId,
	state,
	region,
	latitude,
	longitude,
	magVar,
	category,
	fixUsage,
	nasId,
	highArtcc,
	lowArtcc
);
  
DROP TABLE IF EXISTS fixNavaid;

CREATE TABLE fixNavaid
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	fixId varchar(5),
	facilityId varchar(4),
	relation varchar(23),
	radialDistance varchar(23),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\fixNavaidSorted.txt' INTO TABLE fixNavaid
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	fixId,
	facilityId,
	relation,
	radialDistance
);

DROP TABLE IF EXISTS fixIls;

CREATE TABLE fixIls
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	fixId varchar(5),
	facilityId varchar(4),
	relation varchar(23),
	radialDistance varchar(23),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\fixIlsSorted.txt' INTO TABLE fixIls
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	fixId,
	facilityId,
	relation,
	radialDistance
);

DROP TABLE IF EXISTS fixRemarks;

CREATE TABLE fixRemarks
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	fixId varchar(5),
	text varchar(300),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\fixRemarksSorted.txt' INTO TABLE fixRemarks
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	fixId,
	text
);

DROP TABLE IF EXISTS fixCharting;

CREATE TABLE fixCharting
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	fixId varchar(5),
	chart varchar(30),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\fixChartingSorted.txt' INTO TABLE fixCharting
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	fixId,
	chart
);

CREATE INDEX fixLocationFixId ON fixLocation (fixId) USING BTREE;
CREATE INDEX fixLocationLatLon ON fixLocation (latitude DESC, longitude DESC) USING BTREE;

CREATE INDEX fixNavaidFixId ON fixNavaid (fixId) USING BTREE;

CREATE INDEX fixIlsFixId ON fixIls (fixId) USING BTREE;

CREATE INDEX fixRemarksFixId ON fixRemarks (fixId) USING BTREE;

CREATE INDEX fixChartingFixId ON fixCharting (fixId) USING BTREE;

OPTIMIZE TABLE fixLocation;
OPTIMIZE TABLE fixNavaid;
OPTIMIZE TABLE fixIls;
OPTIMIZE TABLE fixRemarks;
OPTIMIZE TABLE fixCharting;

/*
fixId,state,region,latitude,longitude,magVar,category,fixUsage,nasId,highArtcc,lowArtcc
fixId,facilityId,relation,radialDistance
fixId,text
fixId,chart
*/