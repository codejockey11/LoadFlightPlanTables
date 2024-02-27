USE aviation;

SELECT * 
INTO OUTFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\fsxfix.txt' 
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
FROM fixlocation;
