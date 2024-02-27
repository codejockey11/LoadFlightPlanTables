USE aviation;

DROP TABLE IF EXISTS pjaLocation;

CREATE TABLE pjaLocation
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	pjaId varchar(6),
	navaid varchar(4),
	azimuth varchar(6),
	distance varchar(8),
	state varchar(2),
	latitude varchar(20),
	longitude varchar(20),
	airportName varchar(50),
	dropZoneName varchar(50),
	altitude varchar(8),
	radius varchar(5),
	descriptive varchar(100),
	fssIdent varchar(4),
	pjaUse varchar(8),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\pjaLocationSorted.txt' INTO TABLE pjaLocation
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	pjaId,
	navaid,
	azimuth,
	distance,
	state,
	latitude,
	longitude,
	airportName,
	dropZoneName,
	altitude,
	radius,
	descriptive,
	fssIdent,
	pjaUse
);
  
DROP TABLE IF EXISTS pjaTimes;

CREATE TABLE pjaTimes
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	pjaId varchar(6),
	times varchar(75),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\pjaTimesSorted.txt' INTO TABLE pjaTimes
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	pjaId,
	times
);

DROP TABLE IF EXISTS pjaUserGroup;

CREATE TABLE pjaUserGroup
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	pjaId varchar(6),
	name varchar(75),
	description varchar(75),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\pjaUserGroupSorted.txt' INTO TABLE pjaUserGroup
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	pjaId,
	name,
	description
);

DROP TABLE IF EXISTS pjaContact;

CREATE TABLE pjaContact
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	pjaId varchar(6),
	contactFacilityId varchar(4),
	commercialFrequency varchar(8),
	militaryFrequency varchar(8),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\pjaContactSorted.txt' INTO TABLE pjaContact
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	pjaId,
	contactFacilityId,
	commercialFrequency,
	militaryFrequency
);

DROP TABLE IF EXISTS pjaRemarks;

CREATE TABLE pjaRemarks
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	pjaId varchar(6),
	text varchar(300),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\pjaRemarksSorted.txt' INTO TABLE pjaRemarks
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	pjaId,
	text
);

CREATE INDEX pjaLocationPjaId ON pjaLocation (pjaId) USING BTREE;
CREATE INDEX pjaLocationLatLon ON pjaLocation (latitude DESC, longitude DESC) USING BTREE;

CREATE INDEX pjaTimesPjaId ON pjaTimes (pjaId) USING BTREE;
CREATE INDEX pjaUserGroupPjaId ON pjaUserGroup (pjaId) USING BTREE;
CREATE INDEX pjaContactPjaId ON pjaContact (pjaId) USING BTREE;
CREATE INDEX pjaRemarksPjaId ON pjaRemarks (pjaId) USING BTREE;

OPTIMIZE TABLE pjaLocation;
OPTIMIZE TABLE pjaTimes;
OPTIMIZE TABLE pjaUserGroup;
OPTIMIZE TABLE pjaContact;
OPTIMIZE TABLE pjaRemarks;

/*
pjaId,navaid,azimuth,distance,state,latitude,longitude,airportName,dropZoneName,altitude,radius,descriptive,fssIdent,pjaUse
pjaId,times
pjaId,name,description
pjaId,contactFacilityId,commercialFrequency,militaryFrequency
pjaId,text
*/