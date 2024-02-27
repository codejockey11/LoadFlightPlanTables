USE aviation;

DROP TABLE IF EXISTS chartSupplement;

CREATE TABLE chartSupplement
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	facilityId varchar(150),
	city varchar(150),
	state varchar(150),
	navaidName varchar(150),
	pdf varchar(50),
	zipName varchar(50),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\chartSupplementSorted.txt' INTO TABLE chartSupplement
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	facilityId,
	city,
	state,
	navaidName,
	pdf,
	zipName
);

CREATE INDEX chartSupplementFacilityId ON chartSupplement (facilityId) USING BTREE;
CREATE INDEX chartSupplementNavaidName ON chartSupplement (navaidName) USING BTREE;
CREATE INDEX chartSupplementPdf ON chartSupplement (pdf) USING BTREE;

OPTIMIZE TABLE chartSupplement;

/*
facilityId,city,state,navaidName,pdf,zipName
*/