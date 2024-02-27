USE aviation;

DROP TABLE IF EXISTS pfrRoutes;

CREATE TABLE pfrRoutes
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	depart varchar(5),
	arrive varchar(5),
	type varchar(4),
	dp varchar(50),
	waypoints varchar(500),
	star varchar(50),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\pfrRoutesSorted.txt' INTO TABLE pfrRoutes
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	depart,
	arrive,
	type,
	dp,
	waypoints,
	star
);

CREATE INDEX pfrRoutesDepart ON pfrRoutes (depart) USING BTREE;
CREATE INDEX pfrRoutesArrive ON pfrRoutes (arrive) USING BTREE;
CREATE INDEX pfrRoutesDepartArrive ON pfrRoutes (depart, arrive) USING BTREE;
CREATE INDEX pfrRoutesDp ON pfrRoutes (dp) USING BTREE;
CREATE INDEX pfrRoutesStar ON pfrRoutes (star) USING BTREE;

OPTIMIZE TABLE pfrRoutes;

/*
depart,arrive,type,dp,waypoints,star
*/