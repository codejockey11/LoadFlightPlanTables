USE aviation;

SELECT
	pilotId,
	departure,
	arrival,
	waypoints,
	planType,
	alternate1,
	alternate2,
	alternate3
INTO OUTFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\flightPlan.txt'
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
FROM flightPlan
ORDER BY pilotId,departure,arrival ASC;

/*
pilotId,departure,arrival,waypoints,planType,alternate1,alternate2,alternate3
*/