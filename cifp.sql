USE aviation;

DROP TABLE IF EXISTS cifp;

CREATE TABLE cifp
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	facilityId varchar(4),
	subsectionCode varchar(1),
	siapId varchar(8),
	transition varchar(5),
	sequence varchar(3),
	point varchar(15),
	region varchar(2),
	turn varchar(1),
	legType varchar(2),
	navaid varchar(10),
	theta varchar(6),
	rho varchar(6),
	magCourse varchar(6),
	hold varchar(6),
	altitude varchar(5),
	pointId varchar(15),
	pointMagVar varchar(6),
	navaidId varchar(15),
	navaidMagVar varchar(7),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\cifpSorted.txt' INTO TABLE cifp
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	facilityId,
	subsectionCode,
	siapId,
	transition,
	sequence,
	point,
	region,
	turn,
	legType,
	navaid,
	theta,
	rho,
	magCourse,
	hold,
	altitude,
	pointId,
	pointMagVar,
	navaidId,
	navaidMagVar
);

CREATE INDEX cifpFacilityId ON cifp (facilityId) USING BTREE;
CREATE INDEX cifpPoint ON cifp (point) USING BTREE;
CREATE INDEX cifpNavaid ON cifp (navaid) USING BTREE;

OPTIMIZE TABLE cifp;

/*
facilityId,subsectionCode,siapId,transition,sequence,point,region,turn,legType,navaid,theta,rho,magCourse,hold,altitude,pointId,pointMagVar,navaidId,navaidMagVar
*/