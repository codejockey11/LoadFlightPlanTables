USE aviation;

DROP TABLE IF EXISTS comStation;

CREATE TABLE comStation
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	facilityId varchar(4),
	type varchar(4),
	navaid varchar(4),
	radioCall varchar(26),
	fssIdent varchar(30),
	freq varchar(9),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\comStationSorted.txt' INTO TABLE comStation
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	facilityId,
	type,
	navaid,
	radioCall,
	fssIdent,
	freq
);

CREATE INDEX comStationFacilityId ON comStation (facilityId) USING BTREE;
CREATE INDEX comStationNavaid ON comStation (navaid) USING BTREE;
CREATE INDEX comStationRadioCall ON comStation (radioCall) USING BTREE;

OPTIMIZE TABLE comStation;

/*
facilityId,type,navaid,radioCall,fssIdent,freq
*/