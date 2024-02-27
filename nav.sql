USE aviation;

DROP TABLE IF EXISTS navNavaid;

CREATE TABLE navNavaid
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	facilityId varchar(4),
	morse varchar(30),
	type varchar(20),
	freq varchar(8),
	tacan varchar(4),
	magVar varchar(10),
	magVarYear varchar(4),
	radioCall varchar(30),
	fssId varchar(4),
	fssName varchar(30),
	name varchar(30),
	city varchar(40),
	state varchar(4),
	class varchar(11),
	artccHighId varchar(4),
	artccHighName varchar(30),
	artccLowId varchar(4),
	artccLowName varchar(30),
	latitude varchar(50),
	longitude varchar(50),
	status varchar(30),
	hiwas varchar(4),
	elevation varchar(7),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\navNavaidSorted.txt' INTO TABLE navNavaid
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	facilityId,
	morse,
	type,
	freq,
	tacan,
	magVar,
	magVarYear,
	radioCall,
	fssId,
	fssName,
	name,
	city,
	state,
	class,
	artccHighId,
	artccHighName,
	artccLowId,
	artccLowName,
	latitude,
	longitude,
	status,
	hiwas,
	elevation
);
  
DROP TABLE IF EXISTS navRemarks;

CREATE TABLE navRemarks
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	facilityId varchar(4),
	name varchar(30),
	text varchar(600),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\navRemarksSorted.txt' INTO TABLE navRemarks
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	facilityId,
	name,
	text
);

CREATE INDEX navNavaidFacilityId ON navNavaid (facilityId) USING BTREE;
CREATE INDEX navNavaidFreq ON navNavaid (freq) USING BTREE;
CREATE INDEX navNavaidName ON navNavaid (name) USING BTREE;
CREATE INDEX navNavaidLatLon ON navNavaid (latitude DESC, longitude DESC) USING BTREE;

CREATE INDEX navRemarksFacilityId ON navRemarks (facilityId) USING BTREE;

OPTIMIZE TABLE navNavaid;
OPTIMIZE TABLE navRemarks;

/*
facilityId,morse,type,freq,tacan,magVar,magVarYear,radioCall,fssId,fssName,name,city,state,class,artccHighId,artccHighName,artccLowId,artccLowName,latitude,longitude,status,hiwas,elevation
facilityId,name,text
*/