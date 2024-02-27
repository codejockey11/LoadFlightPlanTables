USE aviation;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\airway2Sorted.txt' INTO TABLE airway
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	airway,
	type,
	pointNbr,
	pointName,
	pointType,
	pointId,
	MEA,
	MAX,
	MOCA,
	latitude,
	longitude  
);

DELETE FROM airway WHERE pointName<='99999';

OPTIMIZE TABLE airway;

/*
airway,type,pointNbr,pointName,pointType,pointId,MEA,MAX,MOCA,latitude,longitude
*/