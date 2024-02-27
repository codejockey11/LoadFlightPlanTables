USE aviation;

DROP TABLE IF EXISTS awosStation;

CREATE TABLE awosStation
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	sensorId varchar(4),
	type varchar(10),
	latitude varchar(14),
	longitude varchar(15),
	elevation varchar(7),
	freq1 varchar(7),
	freq2 varchar(7),
	phone1 varchar(14),
	phone2 varchar(14),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\awosStationSorted.txt' INTO TABLE awosStation
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	sensorId,
	type,
	latitude,
	longitude,
	elevation,
	freq1,
	freq2,
	phone1,
	phone2
);  

DROP TABLE IF EXISTS awosRemarks;

CREATE TABLE awosRemarks
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	sensorId varchar(4),
	text varchar(236),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\awosRemarksSorted.txt' INTO TABLE awosRemarks
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	sensorId,
	text
);

CREATE INDEX awosStationSensorId ON awosStation (sensorId) USING BTREE;
CREATE INDEX awosRemarksSensorId ON awosRemarks (sensorId) USING BTREE;

OPTIMIZE TABLE awosStation;
OPTIMIZE TABLE awosRemarks;

/*
sensorId,type,latitude,longitude,elevation,freq1,freq2,phone1,phone2
sensorId,text
*/