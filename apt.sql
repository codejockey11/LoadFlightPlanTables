USE aviation;

DROP TABLE IF EXISTS aptAirport;

CREATE TABLE aptAirport
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	facilityId varchar(4),
	ICAO varchar(7),
	type varchar(13),
	state varchar(4),
	county varchar(21),
	city varchar(40),
	name varchar(50),
	ownerType varchar(4),
	facilityUse varchar(4),
	ownersName varchar(35),
	ownersAddr varchar(72),
	ownersCityStateZip varchar(45),
	ownersPhone varchar(16),
	managersName varchar(35),
	managersAddr varchar(72),
	managersCityStateZip varchar(45),
	managersPhone varchar(16),
	latitude varchar(50),
	longitude varchar(50),
	elevation varchar(7),
	magVar varchar(10),
	sectional varchar(30),
	acreage varchar(5),
	artccId varchar(4),
	artccName varchar(30),
	fss varchar(4),
	fssName varchar(30),
	fssTollFreeNbr varchar(16),
	fssPilotNbr varchar(16),
	notamFacility varchar(4),
	notamServices varchar(4),
	status varchar(4),
	fuelTypes varchar(40),
	airframeRepair varchar(5),
	powerplantRepair varchar(5),
	bottledOxygen varchar(8),
	bulkOxygen varchar(8),
	controlTower varchar(4),
	unicom varchar(7),
	ctaf varchar(7),
	segCircle varchar(4),
	beaconColor varchar(4),
	landingFee varchar(4),
	transientStorage varchar(12),
	otherServices varchar(71),
	windIndicator varchar(4),
	minimumOperationalNetwork varchar(1),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\aptAirportSorted.txt' INTO TABLE aptAirport
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	facilityId,
	ICAO,
	type,
	state,
	county,
	city,
	name,
	ownerType,
	facilityUse,
	ownersName,
	ownersAddr,
	ownersCityStateZip,
	ownersPhone,
	managersName,
	managersAddr,
	managersCityStateZip,
	managersPhone,
	latitude,
	longitude,
	elevation,
	magVar,
	sectional,
	acreage,
	artccId,
	artccName,
	fss,
	fssName,
	fssTollFreeNbr,
	fssPilotNbr,
	notamFacility,
	notamServices,
	status,
	fuelTypes,
	airframeRepair,
	powerplantRepair,
	bottledOxygen,
	bulkOxygen,
	controlTower,
	unicom,
	ctaf,
	segCircle,
	beaconColor,
	landingFee,
	transientStorage,
	otherServices,
	windIndicator,
	minimumOperationalNetwork  
);

DROP TABLE IF EXISTS aptAttended;

CREATE TABLE aptAttended
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	facilityId varchar(4),
	attendance varchar(108),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\aptAttendedSorted.txt' INTO TABLE aptAttended
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	facilityId,
	attendance
);

DROP TABLE IF EXISTS aptRunway;

CREATE TABLE aptRunway
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	facilityId varchar(4),
	runwayId varchar(7),
	length varchar(5),
	width varchar(4),
	surface varchar(12),
	surfaceTreatment varchar(5),
	pavementClass varchar(11),
	edgeLighting varchar(5),
	ilsType varchar(10),
	righthandTraffic varchar(4),
	markingCondition varchar(4),
	latitude varchar(15),
	longitude varchar(15),
	elevation varchar(7),
	thresholdHeight varchar(4),
	glidePathAngle varchar(4),
	displacedThreshold varchar(4),
	touchDownElevation varchar(7),
	glideSlopeIndicator varchar(5),
	visualRange varchar(5),
	visualValue varchar(5),
	als varchar(8),
	reil varchar(4),
	centerline varchar(4),
	touchdown varchar(4),
	relevation varchar(7),
	tora varchar(5),
	toda varchar(5),
	asda varchar(5),
	lda varchar(5),
	lahsoDistance varchar(5),
	lahsoRunway varchar(7),
	lahsoEntity varchar(40),
	singleWeight varchar(6),
	dualWeight varchar(6),
	tandemWeight varchar(6),
	doubleTandemWeight varchar(6),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\aptRunwaySorted.txt' INTO TABLE aptRunway
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	facilityId,
	runwayId,
	length,
	width,
	surface,
	surfaceTreatment,
	pavementClass,
	edgeLighting,
	ilsType,
	righthandTraffic,
	markingCondition,
	latitude,
	longitude,
	elevation,
	thresholdHeight,
	glidePathAngle,
	displacedThreshold,
	touchDownElevation,
	glideSlopeIndicator,
	visualRange,
	visualValue,
	als,
	reil,
	centerline,
	touchdown,
	relevation,
	tora,
	toda,
	asda,
	lda,
	lahsoDistance,
	lahsoRunway,
	lahsoEntity,
	singleWeight,
	dualWeight,
	tandemWeight,
	doubleTandemWeight
);

DROP TABLE IF EXISTS aptArresting;

CREATE TABLE aptArresting
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	facilityId varchar(4),
	arrestingEnd varchar(4),
	arrestingType varchar(9),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\aptArrestingSorted.txt' INTO TABLE aptArresting
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	facilityId,
	arrestingEnd,
	arrestingType  
);

DROP TABLE IF EXISTS aptRemarks;

CREATE TABLE aptRemarks
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	facilityId varchar(4),
	element varchar(15),
	text varchar(1500),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\aptRemarkSorted.txt' INTO TABLE aptRemarks
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	facilityId,
	element,
	text  
);

CREATE INDEX aptAirportFacilityId ON aptAirport (facilityId) USING BTREE;
CREATE INDEX aptAirportICAO ON aptAirport (ICAO) USING BTREE;
CREATE INDEX aptAirportLatLon ON aptAirport (latitude DESC, longitude DESC) USING BTREE;
CREATE INDEX aptAirportName ON aptAirport (name) USING BTREE;
CREATE INDEX aptAirportStateCity ON aptAirport (state,city) USING BTREE;
CREATE INDEX aptAirportState ON aptAirport (state) USING BTREE;
CREATE INDEX aptAirportCity ON aptAirport (city) USING BTREE;

CREATE INDEX aptAttendedFacilityId ON aptAttended (facilityId) USING BTREE;
CREATE INDEX aptRunwayFacilityId ON aptRunway (facilityId) USING BTREE;
CREATE INDEX aptArrestingFacilityId ON aptArresting (facilityId) USING BTREE;
CREATE INDEX aptRemarksFacilityId ON aptRemarks (facilityId) USING BTREE;

OPTIMIZE TABLE aptAirport;
OPTIMIZE TABLE aptAttended;
OPTIMIZE TABLE aptRunway;
OPTIMIZE TABLE aptArresting;
OPTIMIZE TABLE aptRemarks;

/*
aptAirport		facilityId,ICAO,type,state,county,city,name,ownerType,facilityUse,ownersName,ownersAddr,ownersCityStateZip,ownersPhone,managersName,managersAddr,managersCityStateZip,managersPhone,latitude,longitude,elevation,magVar,sectional,acreage,artccId,artccName,fss,fssName,fssTollFreeNbr,fssPilotNbr,notamFacility,notamServices,status,fuelTypes,airframeRepair,powerplantRepair,bottledOxygen,bulkOxygen,controlTower,unicom,ctaf,segCircle,beaconColor,landingFee,transientStorage,otherServices,windIndicator,minimumOperationalNetwork
aptAttended		facilityId,attendance
aptRunway		facilityId,runwayId,length,width,surface,surfaceTreatment,pavementClass,edgeLighting,ilsType,righthandTraffic,markingCondition,latitude,longitude,elevation,thresholdHeight,glidePathAngle,displacedThreshold,touchDownElevation,glideSlopeIndicator,visualRange,visualValue,als,reil,centerline,touchdown,relevation,tora,toda,asda,lda,lahsoDistance,lahsoRunway,lahsoEntity,singleWeight,dualWeight,tandemWeight,doubleTandemWeight
aptArresting	facilityId,arrestingEnd,arrestingType 
aptRemarks		facilityId,element,text 
*/