USE aviation;

SELECT
	pilotId,
	pilotPassword,
	email,
	firstName,
	lastName,
	homeBase,
	homeLatLon,
	showHeliport,
	showFrequency,
	ts,
	accessCount
INTO OUTFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\account.txt'
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
FROM account
ORDER BY pilotId ASC;
