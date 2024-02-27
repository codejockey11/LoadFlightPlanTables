USE aviation;

DROP TABLE IF EXISTS logbook;

CREATE TABLE logbook
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	pilotId varchar(50),
	flightDateTime varchar(20),
	departArrive varchar(10),
	planeType varchar(10),
	registration varchar(10),
	vfrTime varchar(10),
	ifrTime varchar(10),
	lessonTime varchar(10),
	simLocation varchar(50),
	safetyPilot varchar(50),
	experienceType varchar(1),
	conditionsType varchar(1),
	landings varchar(10),
	simulationType varchar(1),
	simulatorType varchar(100),
	goggleTime varchar(10),
	gogglesType varchar(1),
	remarks varchar(1000),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\logbook.txt' INTO TABLE logbook
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	pilotId,
	flightDateTime,
	departArrive,
	planeType,
	registration,
	vfrTime,
	ifrTime,
	lessonTime,
	simLocation,
	safetyPilot,
	experienceType,
	conditionsType,
	landings,
	simulationType,
	simulatorType,
	goggleTime,
	gogglesType,
	remarks
);

OPTIMIZE TABLE logbook;
