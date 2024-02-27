USE aviation;

DROP TABLE IF EXISTS airway;

CREATE TABLE airway
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	airway varchar(15),
	type varchar(2),
	pointNbr varchar(10),
	pointName varchar(10),
	pointType varchar(20),
	pointId varchar(15),
	magCourse varchar(3),
	magCourseOpposite varchar(3),
	MEA varchar(10),
	MAX varchar(10),
	MOCA varchar(10),
	latitude varchar(15),
	longitude varchar(15),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\airwaySorted.txt' INTO TABLE airway
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	airway,
	type,
	pointNbr,
	pointName,
	pointType,
	pointId,
	magCourse,
	magCourseOpposite,
	MEA,
	MAX,
	MOCA,
	latitude,
	longitude  
);

DELETE FROM airway WHERE pointName<='99999';

/*
airway,type,pointNbr,pointName,pointType,pointId,MEA,MAX,MOCA,latitude,longitude
*/