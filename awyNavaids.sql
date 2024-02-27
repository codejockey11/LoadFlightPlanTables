USE aviation;

SELECT id,facilityId,type INTO OUTFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\awyNavaids.txt'
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
FROM navNavaid
WHERE type!='VOT' AND type!='FAN MARKER';

SELECT id,fixId INTO OUTFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\awyFixs.txt'
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
FROM fixLocation;
