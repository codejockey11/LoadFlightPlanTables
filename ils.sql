USE aviation;

DROP TABLE IF EXISTS ilsApproach;

CREATE TABLE ilsApproach
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	facilityId varchar(4),
	runway varchar(4),
	type varchar(10),
	idCode varchar(6),
	morse varchar(30),
	category varchar(9),
	approachBearing varchar(6),
	magVar varchar(7),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\ilsApproachSorted.txt' INTO TABLE ilsApproach
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	facilityId,
	runway,
	type,
	idCode,
	morse,
	category,
	approachBearing,
	magVar
);

DROP TABLE IF EXISTS ilsFrequency;

CREATE TABLE ilsFrequency
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	facilityId varchar(4),
	runway varchar(4),
	latitude varchar(14),
	longitude varchar(14),
	altitudeMsl varchar(7),
	frequency varchar(7),
	backcourse varchar(15),
	courseWidth varchar(5),
	courseWidthThreshold varchar(7),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\ilsFrequencySorted.txt' INTO TABLE ilsFrequency
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	facilityId,
	runway,
	latitude,
	longitude,
	altitudeMsl,
	frequency,
	backcourse,
	courseWidth,
	courseWidthThreshold
);	

DROP TABLE IF EXISTS ilsGlideslope;

CREATE TABLE ilsGlideslope
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	facilityId varchar(4),
	runway varchar(4),
	latitude varchar(14),
	longitude varchar(14),
	altitudeMsl varchar(7),
	type varchar(15),
	angle varchar(5),
	freq varchar(7),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\ilsGlideslopeSorted.txt' INTO TABLE ilsGlideslope
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	facilityId,
	runway,
	latitude,
	longitude,
	altitudeMsl,
	type,
	angle,
	freq
);	

DROP TABLE IF EXISTS ilsDme;

CREATE TABLE ilsDme
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	facilityId varchar(4),
	runway varchar(4),
	status varchar(22),
	distance varchar(7),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\ilsDmeSorted.txt' INTO TABLE ilsDme
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	facilityId,
	runway,
	status,
	distance
);

DROP TABLE IF EXISTS ilsMarker;

CREATE TABLE ilsMarker
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	facilityId varchar(4),
	runway varchar(4),
	type varchar(2),
	status varchar(22),
	distance varchar(7),
	facilityType varchar(15),
	locationIdent varchar(2),
	morse varchar(20),
	name varchar(30),
	freq varchar(4),
	relation varchar(25),
	ndbStatus varchar(22),
	service varchar(30),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\ilsMarkerSorted.txt' INTO TABLE ilsMarker
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	facilityId,
	runway,
	type,
	status,
	distance,
	facilityType,
	locationIdent,
	morse,
	name,
	freq,
	relation,
	ndbStatus,
	service
);

DROP TABLE IF EXISTS ilsRemarks;

CREATE TABLE ilsRemarks
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	facilityId varchar(4),
	runway varchar(4),
	text varchar(350),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\ilsRemarksSorted.txt' INTO TABLE ilsRemarks
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	facilityId,
	runway,
	text
);

CREATE INDEX ilsApproachFacilityId ON ilsApproach (facilityId) USING BTREE;
CREATE INDEX ilsDmeFacilityId ON ilsDme (facilityId) USING BTREE;
CREATE INDEX ilsFrequencyFacilityId ON ilsFrequency (facilityId) USING BTREE;
CREATE INDEX ilsGlideslopeFacilityId ON ilsGlideslope (facilityId) USING BTREE;
CREATE INDEX ilsMarkerFacilityId ON ilsMarker (facilityId) USING BTREE;
CREATE INDEX ilsRemarksFacilityId ON ilsRemarks (facilityId) USING BTREE;

OPTIMIZE TABLE ilsApproach;
OPTIMIZE TABLE ilsDme;
OPTIMIZE TABLE ilsFrequency;
OPTIMIZE TABLE ilsGlideslope;
OPTIMIZE TABLE ilsMarker;
OPTIMIZE TABLE ilsRemarks;

/*
ilsApproach facilityId,runway,type,idCode,morse,category,approachBearing,magVar
ilsFrequency facilityId,runway,latitude,longitude,altitudeMsl,frequency,backcourse,courseWidth,courseWidthThreshold
ilsGlideslope facilityId,runway,latitude,longitude,altitudeMsl,type,angle,freq
ilsDme facilityId,runway,status,distance
ilsMarker facilityId,runway,type,status,distance,facilityType,locationIdent,morse,name,freq,relation,ndbStatus,service
ilsRemarks facilityId,runway,text
*/
