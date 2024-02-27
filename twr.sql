USE aviation;

DROP TABLE IF EXISTS twrTower;

CREATE TABLE twrTower
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	facilityId varchar(4),
	state varchar(4),
	city varchar(40),
	name varchar(50),
	latitude varchar(14),
	longitude varchar(14),
	fssId varchar(4),
	fssName varchar(30),
	type varchar(12),
	hoursOfOp varchar(4),
	hoursOfOpOther varchar(45),
	airportId varchar(4),
	airportName varchar(50),
	radioCall varchar(26),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\twrTowerSorted.txt' INTO TABLE twrTower
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	facilityId,
	state,
	city,
	name,
	latitude,
	longitude,
	fssId,
	fssName,
	type,
	hoursOfOp,
	hoursOfOpOther,
	airportId,
	airportName,
	radioCall
);

DROP TABLE IF EXISTS twrHoursOfOp;

CREATE TABLE twrHoursOfOp
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	facilityId varchar(4),
	hoursOfOp varchar(200),
	pilotToMetroService varchar(200),
	militaryAircraftCommandPost varchar(200),
	militaryOp varchar(200),
	priApproachControl varchar(200),
	secApproachControl varchar(200),
	priDepartureControl varchar(200),
	secDepartureControl varchar(200),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\twrHoursOfOpSorted.txt' INTO TABLE twrHoursOfOp
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	facilityId,
	hoursOfOp,
	pilotToMetroService,
	militaryAircraftCommandPost,
	militaryOp,
	priApproachControl,
	secApproachControl,
	priDepartureControl,
	secDepartureControl
);

DROP TABLE IF EXISTS twrFrequency;

CREATE TABLE twrFrequency
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	facilityId varchar(4),
	freq varchar(60),
	type varchar(128),
	siteLocation varchar(30),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\twrFrequencySorted.txt' INTO TABLE twrFrequency
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	facilityId,
	freq,
	type,
	siteLocation
);

DROP TABLE IF EXISTS twrServices;

CREATE TABLE twrServices
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	facilityId varchar(4),
	masterAirportServices varchar(100),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\twrServicesSorted.txt' INTO TABLE twrServices
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	facilityId,
	masterAirportServices
);

DROP TABLE IF EXISTS twrRadars;

CREATE TABLE twrRadars
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	facilityId varchar(4),
	priApproachCall varchar(9),
	secApproachCall varchar(9),
	priDepartCall varchar(9),
	secDepartCall varchar(9),
	type01 varchar(10),
	hours01 varchar(200),
	type02 varchar(10),
	hours02 varchar(200),
	type03 varchar(10),
	hours03 varchar(200),
	type04 varchar(10),
	hours04 varchar(200),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\twrRadarsSorted.txt' INTO TABLE twrRadars
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	facilityId,
	priApproachCall,
	secApproachCall,
	priDepartCall,
	secDepartCall,
	type01,
	hours01,
	type02,
	hours02,
	type03,
	hours03,
	type04,
	hours04
);

DROP TABLE IF EXISTS twrRemarks;

CREATE TABLE twrRemarks
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	facilityId varchar(4),
	element varchar(5),
	text varchar(800),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\twrRemarksSorted.txt' INTO TABLE twrRemarks
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	facilityId,
	element,
	text
);

DROP TABLE IF EXISTS twrSatellite;

CREATE TABLE twrSatellite
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	facilityId varchar(4),
	freq varchar(44),
	type varchar(60),
	satelliteFacilityId varchar(4),
	fssStationId varchar(4),
	fssStationName varchar(30),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\twrSatelliteSorted.txt' INTO TABLE twrSatellite
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	facilityId,
	freq,
	type,
	satelliteFacilityId,
	fssStationId,
	fssStationName
);

DROP TABLE IF EXISTS twrAirspace;

CREATE TABLE twrAirspace
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	facilityId varchar(4),
	classB varchar(4),
	classC varchar(4),
	classD varchar(4),
	classE varchar(4),
	airspaceHours varchar(300),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\twrAirspaceSorted.txt' INTO TABLE twrAirspace
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	facilityId,
	classB,
	classC,
	classD,
	classE,
	airspaceHours
);

DROP TABLE IF EXISTS twrAtis;

CREATE TABLE twrAtis
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	facilityId varchar(4),
	serialNbr varchar(10),
	hours varchar(200),
	description varchar(100),
	phone varchar(18),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\twrAtisSorted.txt' INTO TABLE twrAtis
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	facilityId,
	serialNbr,
	hours,
	description,
	phone
);

CREATE INDEX twrTowerFacilityId ON twrTower (facilityId) USING BTREE;
CREATE INDEX twrTowerRadioCall ON twrTower (radioCall) USING BTREE;

CREATE INDEX twrAirspaceFacilityId ON twrAirspace (facilityId) USING BTREE;
CREATE INDEX twrAtisFacilityId ON twrAtis (facilityId) USING BTREE;
CREATE INDEX twrHoursOfOpFacilityId ON twrHoursOfOp (facilityId) USING BTREE;
CREATE INDEX twrFrequencyFacilityId ON twrFrequency (facilityId) USING BTREE;
CREATE INDEX twrRadarsFacilityId ON twrRadars (facilityId) USING BTREE;
CREATE INDEX twrRemarksFacilityId ON twrRemarks (facilityId) USING BTREE;
CREATE INDEX twrSatelliteFacilityId ON twrSatellite (satelliteFacilityId) USING BTREE;
CREATE INDEX twrServicesFacilityId ON twrServices (facilityId) USING BTREE;

OPTIMIZE TABLE twrTower;
OPTIMIZE TABLE twrAirspace;
OPTIMIZE TABLE twrAtis;
OPTIMIZE TABLE twrFrequency;
OPTIMIZE TABLE twrHoursOfOp;
OPTIMIZE TABLE twrRadars;
OPTIMIZE TABLE twrRemarks;
OPTIMIZE TABLE twrSatellite;
OPTIMIZE TABLE twrServices;


/*
facilityId,state,city,name,latitude,longitude,fssId,fssName,type,hoursOfOp,hoursOfOpOther,airportId,airportName,radioCall
facilityId,hoursOfOp,pilotToMetroService,militaryAircraftCommandPost,militaryOp,priApproachControl,secApproachControl,priDepartureControl,secDepartureControl
facilityId,freq,type,siteLocation
facilityId,masterAirportServices
facilityId,priApproachCall,secApproachCall,priDepartCall,secDepartCall,type01,hours01,type02,hours02,type03,hours03,type04,hours04
facilityId,element,text
facilityId,freq,type,satelliteFacilityId,fssStationId,fssStationName
facilityId,classB,classC,classD,classE,airspaceHours
facilityId,serialNbr,hours,description,phone
*/