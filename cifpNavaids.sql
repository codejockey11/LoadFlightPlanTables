USE aviation;

SELECT DISTINCT c.facilityId,c.point,n.id,n.magVar,n.name INTO OUTFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\cifpNavaids1.txt'
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
FROM cifp c USE INDEX(cifpPoint), navNavaid n USE INDEX(navNavaidFacilityId) WHERE c.point!='' AND LENGTH(c.point)>2 AND LENGTH(c.point)<4 AND c.point=n.facilityId
ORDER BY c.facilityId,c.point;

SELECT DISTINCT c.facilityId,c.navaid,n.id,n.magVar,n.name INTO OUTFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\cifpNavaids2.txt'
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
FROM cifp c USE INDEX(cifpNavaid), navNavaid n USE INDEX(navNavaidFacilityId) WHERE c.navaid!='' AND LENGTH(c.navaid)>2 AND LENGTH(c.navaid)<4 AND c.navaid=n.facilityId
ORDER BY c.facilityId,c.navaid;

SELECT DISTINCT c.facilityId,c.point,n.id,n.magVar,n.name INTO OUTFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\cifpNavaids3.txt'
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
FROM cifp c USE INDEX(cifpPoint), navNavaid n USE INDEX(navNavaidFacilityId), aptAirport aa USE INDEX(aptAirportICAO) WHERE c.point!='' AND LENGTH(c.point)=2 AND c.point=n.facilityId AND c.facilityId=aa.ICAO AND aa.state=n.state
ORDER BY c.facilityId,c.point;

SELECT DISTINCT c.facilityId,c.navaid,n.id,n.magVar,n.name INTO OUTFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\cifpNavaids4.txt'
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
FROM cifp c USE INDEX(cifpNavaid), navNavaid n USE INDEX(navNavaidFacilityId), aptAirport aa USE INDEX(aptAirportICAO) WHERE c.navaid!='' AND LENGTH(c.navaid)=2 AND c.navaid=n.facilityId AND c.facilityId=aa.ICAO AND aa.state=n.state
ORDER BY c.facilityId,c.navaid;

SELECT DISTINCT c.facilityId,c.point,f.id,f.magVar INTO OUTFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\cifpFix.txt'
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
FROM cifp c USE INDEX(cifpPoint), fixLocation f USE INDEX(fixLocationFixId) WHERE c.point!='' AND LENGTH(c.point)=5 AND c.point=f.fixId
ORDER BY c.facilityId,c.point;

SELECT aa.ICAO,f.runway,REPLACE(a.idcode, '-', ''),f.id,aa.magVar INTO OUTFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\cifpIls.txt'
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
FROM ilsFrequency f USE INDEX(ilsFrequencyFacilityId), ilsApproach a, aptAirport aa USE INDEX(aptAirportFacilityId) WHERE f.facilityId=a.facilityId AND f.runway=a.runway AND f.facilityId=aa.facilityId
ORDER BY aa.ICAO,f.runway;

SELECT ICAO,id,magVar INTO OUTFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\cifpAirport.txt'
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
FROM aptAirport USE INDEX(aptAirportICAO)
ORDER BY ICAO;
