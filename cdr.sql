USE aviation;

DROP TABLE IF EXISTS cdrRoutes;

CREATE TABLE cdrRoutes
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	origin varchar(5),
	destination varchar(4),
	code varchar(10),
	fixIdent varchar(50),
	waypoints varchar(500),
	artcc varchar(50),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\cdrRoutesSorted.txt' INTO TABLE cdrRoutes
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	origin,
	destination,
	code,
	fixIdent,
	waypoints,
	artcc
);

CREATE INDEX cdrRoutesOrigin ON cdrRoutes (origin) USING BTREE;
CREATE INDEX cdrRoutesDestination ON cdrRoutes (destination) USING BTREE;
CREATE INDEX cdrRoutesOriginDestination ON cdrRoutes (origin,destination) USING BTREE;

OPTIMIZE TABLE cdrRoutes;

/*
origin,destination,code,fixIdent,waypoints,artcc
*/