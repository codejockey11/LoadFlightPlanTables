USE aviation;

DROP TABLE IF EXISTS flightPlan;

CREATE TABLE flightPlan
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	pilotId varchar (50),
	departure varchar(15),
	arrival varchar(15),
	waypoints varchar(1000),
	planType varchar(4),
	alternate1 varchar(4),
	alternate2 varchar(4),
	alternate3 varchar(4),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

/*
pilotId,departure,arrival,waypoints,planType,alternate1,alternate2,alternate3
*/