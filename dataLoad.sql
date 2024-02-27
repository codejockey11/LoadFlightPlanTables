LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\aviationToday.txt' INTO TABLE parameter
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n';

OPTIMIZE TABLE parameter;
