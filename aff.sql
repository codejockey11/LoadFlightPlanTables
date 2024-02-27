USE aviation;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\twrfrequency2Sorted.txt' INTO TABLE twrfrequency
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	facilityId,
	freq,
	type,
	siteLocation
);
 
OPTIMIZE TABLE twrfrequency;

/*
facilityId,freq,type,siteLocation
*/