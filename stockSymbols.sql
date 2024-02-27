USE aviation;

DROP TABLE IF EXISTS stockSymbols;

CREATE TABLE stockSymbols
(
	symbol varchar(8),
	name varchar(160),
	date varchar(10),
	isEnabled varchar(1),
	type varchar(6),
	iexId varchar(32),
	PRIMARY KEY(symbol)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\stockSymbolsSorted.txt' INTO TABLE stockSymbols
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n';

CREATE INDEX stockSymbolName ON stockSymbols (name) USING BTREE;

OPTIMIZE TABLE stockSymbols;
