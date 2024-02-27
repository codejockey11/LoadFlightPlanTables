USE aviation;

DROP TABLE IF EXISTS dTPP;

CREATE TABLE dTPP
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	facilityId varchar(10),
	alnum varchar(10),
	chartCode varchar(10),
	title varchar(150),
	pdf varchar(50),
	zipName varchar(50),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\dTPPSorted.txt' INTO TABLE dTPP
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	facilityId,
	alnum,
	chartCode,
	title,
	pdf,
	zipName
);

DROP TABLE IF EXISTS compares;

CREATE TABLE compares
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	facilityId varchar(10),
	alnum varchar(10),
	chartCode varchar(10),
	title varchar(150),
	pdf varchar(50),
	zipName varchar(50),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\comparesSorted.txt' INTO TABLE compares
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	facilityId,
	alnum,
	chartCode,
	title,
	pdf,
	zipName
);

CREATE INDEX dTPPFacilityId ON dTPP (facilityId) USING BTREE;
CREATE INDEX dTPPPdf ON dTPP (pdf) USING BTREE;

CREATE INDEX comparesFacilityId ON compares (facilityId) USING BTREE;
CREATE INDEX comparesPdf ON compares (pdf) USING BTREE;

OPTIMIZE TABLE dTPP;
OPTIMIZE TABLE compares;

/*
facilityId,alnum,chartCode,title,pdf,zipName
facilityId,alnum,chartCode,title,pdf,zipName
*/
