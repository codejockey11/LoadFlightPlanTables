USE aviation;

DROP TABLE IF EXISTS account;

CREATE TABLE account
(
	pilotId varchar(100),
	pilotPassword varchar(255),
	email varchar(100),
	firstName varchar(50),
	lastName varchar(50),
	homeBase varchar(10),
	homeLatLon varchar(50),
	showHeliport varchar(1),
	showFrequency varchar(1),
	ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	accessCount varchar(6),
	PRIMARY KEY(pilotId)
)
COLLATE ascii_bin;
