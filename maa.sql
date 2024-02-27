USE aviation;

DROP TABLE IF EXISTS maaBaseData;

CREATE TABLE maaBaseData
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	maaId varchar(6),
	type varchar(25),
	navaidIdentifier varchar(4),
	navaidFacilityTypeCode varchar(2),
	navaidFacilityTypeDescribed varchar(25),
	azimuthFromNavaid varchar(6),
	distance varchar(6),
	navaidName varchar(30),
	stateAbbreviation varchar(2),
	stateName varchar(30),
	associatedCityName varchar(30),
	latitude varchar(14),
	longitude varchar(15),
	associatedAirportId varchar(4),
	associatedAirportName varchar(50),
	associatedAirportSiteNumber varchar(11),
	nearestAirportId varchar(4),
	nearestAirportDistance varchar(6),
	nearestAirportDirection varchar(2),
	areaName varchar(120),
	maximumAltitude varchar(8),
	minimumAltitude varchar(8),
	radius varchar(5),
	showOnVfrChart varchar(3),
	description varchar(450),
	maaUse varchar(8),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\maaBaseDataSorted.txt' INTO TABLE maaBaseData
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	maaId,
	type,
	navaidIdentifier,
	navaidFacilityTypeCode,
	navaidFacilityTypeDescribed,
	azimuthFromNavaid,
	distance,
	navaidName,
	stateAbbreviation,
	stateName,
	associatedCityName,
	latitude,
	longitude,
	associatedAirportId,
	associatedAirportName,
	associatedAirportSiteNumber,
	nearestAirportId,
	nearestAirportDistance,
	nearestAirportDirection,
	areaName,
	maximumAltitude,
	minimumAltitude,
	radius,
	showOnVfrChart,
	description,
	maaUse
);

DROP TABLE IF EXISTS maaPolyCoord;

CREATE TABLE maaPolyCoord
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	maaId varchar(6),
	latitude varchar(14),
	longitude varchar(15),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\maaPolyCoord.txt' INTO TABLE maaPolyCoord
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	maaId,
	latitude,
	longitude
);

DROP TABLE IF EXISTS maaTimes;

CREATE TABLE maaTimes
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	maaId varchar(6),
	timesOfUse varchar(75),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\maaTimesOfUseSorted.txt' INTO TABLE maaTimes
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	maaId,
	timesOfUse
);

DROP TABLE IF EXISTS maaUserGroup;

CREATE TABLE maaUserGroup
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	maaId varchar(6),
	name varchar(75),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\maaUserGroupSorted.txt' INTO TABLE maaUserGroup
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	maaId,
	name
);

DROP TABLE IF EXISTS maaContact;

CREATE TABLE maaContact
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	maaId varchar(6),
	contactFacilityId varchar(4),
	contactFacilityName varchar(48),
	commercialFrequency varchar(7),
	commercialChartFlag varchar(1),
	militaryFrequency varchar(7),
	militaryChartFlag varchar(1),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\maaContactSorted.txt' INTO TABLE maaContact
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	maaId,
	contactFacilityId,
	contactFacilityName,
	commercialFrequency,
	commercialChartFlag,
	militaryFrequency,
	militaryChartFlag
);

DROP TABLE IF EXISTS maaNotams;

CREATE TABLE maaNotams
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	maaId varchar(6),
	notams varchar(4),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\maaNotamsSorted.txt' INTO TABLE maaNotams
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	maaId,
	notams
);

DROP TABLE IF EXISTS maaRemarks;

CREATE TABLE maaRemarks
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	maaId varchar(6),
	text varchar(300),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\maaRemarksSorted.txt' INTO TABLE maaRemarks
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	maaId,
	text
);

CREATE INDEX maaBaseDataMaaId ON maaBaseData (maaId) USING BTREE;
CREATE INDEX maaBaseDataLatLon ON maaBaseData (latitude DESC, longitude DESC) USING BTREE;

CREATE INDEX maaPolyCoordMaaId ON maaPolyCoord (maaId) USING BTREE;
CREATE INDEX maaPolyCoordLatLon ON maaPolyCoord (latitude DESC, longitude DESC) USING BTREE;

CREATE INDEX maaTimesMaaId ON maaTimes (maaId) USING BTREE;
CREATE INDEX maaUserGroupMaaId ON maaUserGroup (maaId) USING BTREE;
CREATE INDEX maaContactMaaId ON maaContact (maaId) USING BTREE;
CREATE INDEX maaNotamsMaaId ON maaNotams (maaId) USING BTREE;
CREATE INDEX maaRemarksMaaId ON maaRemarks (maaId) USING BTREE;

OPTIMIZE TABLE maaBasedata;
OPTIMIZE TABLE maaPolyCoord;
OPTIMIZE TABLE maaTimes;
OPTIMIZE TABLE maaUserGroup;
OPTIMIZE TABLE maaContact;
OPTIMIZE TABLE maaNotams;
OPTIMIZE TABLE maaRemarks;

/*
maaId,type,navaidIdentifier,navaidFacilityTypeCode,navaidFacilityTypeDescribed,azimuthFromNavaid,distance,navaidName,stateAbbreviation,stateName,associatedCityName,latitude,longitude,associatedAirportId,associatedAirportName,associatedAirportSiteNumber,nearestAirportId,nearestAirportDistance,nearestAirportDirection,areaName,maximumAltitude,minimumAltitude,radius,showOnVfrChart,description,maaUse
maaId,latitude,longitude
maaId,timesOfUse
maaId,name
maaId,contactFacilityId,contactFacilityName,commercialFrequency,commercialChartFlag,militaryFrequency,militaryChartFlag
maaId,notams
maaId,text
*/