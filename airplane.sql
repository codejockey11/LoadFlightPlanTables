USE aviation;

DROP TABLE IF EXISTS airplane;

CREATE TABLE airplane
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	pilotId varchar(50),
	registration varchar(7),
	plane varchar(50),
	cruiseSpeed varchar(5),
	color varchar(50),
	equip varchar(25),
	taxiDepart varchar(20),
	climb varchar(20),
	enroute varchar(20),
	descent varchar(20),
	trafficPattern varchar(20),
	taxiArrive varchar(20),
	gph varchar(5),
	emptyWeight varchar(20),
	emptyArm varchar(20),
	fuelGallons varchar(20),
	fuelArm varchar(20),
	station01Weight varchar(10),
	station01Arm varchar(10),
	station02Weight varchar(10),
	station02Arm varchar(10),
	station03Weight varchar(10),
	station03Arm varchar(10),
	station04Weight varchar(10),
	station04Arm varchar(10),
	station05Weight varchar(10),
	station05Arm varchar(10),
	station06Weight varchar(10),
	station06Arm varchar(10),
	station07Weight varchar(10),
	station07Arm varchar(10),
	station08Weight varchar(10),
	station08Arm varchar(10),
	maxGrossWeight varchar(10),
	fuelTypeWeight varchar(10),
	hobbs varchar(10),
	tach varchar(10),
	maxFuel varchar(10),
	maxCargo varchar(10),
	notes varchar(1000),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

/*
pilotId,registration,plane,cruiseSpeed,color,equip,taxiDepart,climb,enroute,descent,trafficPattern,taxiArrive,gph,emptyWeight,emptyArm,fuelGallons,fuelArm,station01Weight,station01Arm,station02Weight,station02Arm,station03Weight,station03Arm,station04Weight,station04Arm,station05Weight,station05Arm,station06Weight,station06Arm,station07Weight,station07Arm,station08Weight,station08Arm,maxGrossWeight,fuelTypeWeight,hobbs,tach,maxFuel,maxCargo,notes
*/
