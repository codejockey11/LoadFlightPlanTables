USE aviation;

DROP TABLE IF EXISTS obstacle;

CREATE TABLE obstacle
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	ors varchar(9),
	country varchar(2),
	state varchar(2),
	city varchar(15),
	latitude varchar(50),
	longitude varchar(50),
	type varchar(18),
	agl varchar(5),
	msl varchar(5),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\dofSorted.txt' INTO TABLE obstacle
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	ors,
	country,
	state,
	city,
	latitude,
	longitude,
	type,
	agl,
	msl
);

CREATE INDEX obstacleStateCity ON obstacle (state, city) USING BTREE;
CREATE INDEX obstacleLatLon ON obstacle (latitude DESC, longitude DESC) USING BTREE;

OPTIMIZE TABLE obstacle;

/*
ors,country,state,city,latitude,longitude,type,agl,msl
*/