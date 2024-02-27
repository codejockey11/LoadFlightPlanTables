USE aviation;

DROP TABLE IF EXISTS starDp;

CREATE TABLE starDp
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	type varchar(1),
	shortName varchar(20),
	ident varchar(12),
	transition varchar(100),
	computerCode varchar(50),
	waypoints varchar(1000),
	airports varchar(100),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\starDpSorted.txt' INTO TABLE starDp
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	type,
	shortName,
	ident,
	transition,
	computerCode,
	waypoints,
	airports
);

CREATE INDEX starDpShortname ON starDp (shortname) USING BTREE;
CREATE INDEX starDpIdent ON starDp (ident) USING BTREE;
CREATE INDEX starDpTransition ON starDp (transition) USING BTREE;
CREATE INDEX starDpComputerCode ON starDp (computerCode) USING BTREE;
CREATE INDEX starDpAirports ON starDp (airports) USING BTREE;
CREATE INDEX starDpWaypoints ON starDp (waypoints) USING BTREE;

OPTIMIZE TABLE starDp;

/*
type,shortName,ident,transition,computerCode,waypoints,airports
*/