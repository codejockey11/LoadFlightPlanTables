USE aviation;

SELECT
	pilotId,
	registration,
	image
INTO OUTFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\checklist.txt'
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
FROM checklist
ORDER BY pilotId,image ASC;
