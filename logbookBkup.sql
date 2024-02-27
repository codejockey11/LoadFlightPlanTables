USE aviation;

SELECT
	pilotId,
	flightDateTime,
	departArrive,
	planeType,
	registration,
	vfrTime,
	ifrTime,
	lessonTime,
	simLocation,
	safetyPilot,
	experienceType,
	conditionsType,
	landings,
	simulationType,
	simulatorType,
	goggleTime,
	gogglesType,
	remarks
INTO OUTFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\logbook.txt'
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
FROM logbook
ORDER BY pilotId,flightDateTime ASC;
