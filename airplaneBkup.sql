USE aviation;

SELECT 
	pilotId,
	registration,
	plane,
	cruiseSpeed,
	color,
	equip,
	taxiDepart,
	climb,
	enroute,
	descent,
	trafficPattern,
	taxiArrive,
	gph,
	emptyWeight,
	emptyArm,
	fuelGallons,
	fuelArm,
	station01Weight,
	station01Arm,
	station02Weight,
	station02Arm,
	station03Weight,
	station03Arm,
	station04Weight,
	station04Arm,
	station05Weight,
	station05Arm,
	station06Weight,
	station06Arm,
	station07Weight,
	station07Arm,
	station08Weight,
	station08Arm,
	maxGrossWeight,
	fuelTypeWeight,
	hobbs,
	tach,
	maxFuel,
	maxCargo,
	notes
INTO OUTFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\airplane.txt'
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
FROM airplane
ORDER BY pilotId,plane,registration ASC;
