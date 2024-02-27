USE aviation;

SELECT
	name,
	value1,
	value2,
	value3,
	value4
INTO OUTFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\parameter.txt'
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
FROM parameter
ORDER BY name ASC;
