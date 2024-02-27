USE aviation;

DROP TABLE IF EXISTS saaLocation;

CREATE TABLE saaLocation
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	designator varchar(32),
	name varchar(128),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\saaLocationSorted.txt' INTO TABLE saaLocation
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	designator,
	name
);

DROP TABLE IF EXISTS saaGeometry;

CREATE TABLE saaGeometry
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	designator varchar(32),
	upperLimituom varchar(10),
	upperLimit varchar(10),
	upperLimitReference varchar(10),
	lowerLimituom varchar(3),
	lowerLimit varchar(10),
	lowerLimitReference varchar(32),
	type  varchar(2),
	sequence  varchar(3),
	count  varchar(3),
	longitude  varchar(11),
	latitude  varchar(10),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\saaGeometrySorted.txt' INTO TABLE saaGeometry
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	designator,
	upperLimituom,
	upperLimit,
	upperLimitReference,
	lowerLimituom,
	lowerLimit,
	lowerLimitReference,
	type,
	sequence,
	count,
	longitude,
	latitude
);

DROP TABLE IF EXISTS saaTimes;

CREATE TABLE saaTimes
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	designator varchar(32),
	startDate varchar(10),
	endDate varchar(10),
	startTime varchar(10),
	endTime varchar(10),
	day varchar(1),
	startEvent varchar(10),
	endEvent varchar(10),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\saaTimesSorted.txt' INTO TABLE saaTimes
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	designator,
	startDate,
	endDate,
	startTime,
	endTime,
	day,
	startEvent,
	endEvent
);

DROP TABLE IF EXISTS saaNote;

CREATE TABLE saaNote
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	designator varchar(32),
	note varchar(8192),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\saaNoteSorted.txt' INTO TABLE saaNote
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	designator,
	note
);

CREATE INDEX saaLocationDesignator ON saaLocation (designator) USING BTREE;
CREATE INDEX saaLocationName ON saaLocation (name) USING BTREE;

CREATE INDEX saaGeometryDesignator ON saaGeometry (designator) USING BTREE;

CREATE INDEX saaTimesDesignator ON saaTimes (designator) USING BTREE;

CREATE INDEX saaNoteDesignator ON saaNote (designator) USING BTREE;

OPTIMIZE TABLE saaLocation;
OPTIMIZE TABLE saaGeometry;
OPTIMIZE TABLE saaTimes;
OPTIMIZE TABLE saaNote;

/*
designator,name
designator,upperLimituom,upperLimit,upperLimitReference,lowerLimituom,lowerLimit,lowerLimitReference,type,sequence,count,longitude,latitude
designator,startDate,endDate,startTime,endTime,day,startEvent,endEvent
designator,note
*/