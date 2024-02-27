USE aviation;

DROP TABLE IF EXISTS ramps;

CREATE TABLE ramps
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	Name varchar(128),
	X varchar(128),
	Y varchar(128),
	OBJECTID varchar(128),
	FacType varchar(128),
	Access varchar(128),
	PrimAgency varchar(128),
	PartAgency varchar(128),
	Status varchar(128),
	Hours varchar(128),
	Fees varchar(128),
	FeeAmt varchar(128),
	FeeCollect varchar(128),
	RampSurf varchar(128),
	RampCond varchar(128),
	SingleLane varchar(128),
	DoubleLane varchar(128),
	TotalLane varchar(128),
	DockType varchar(128),
	ParkSurf varchar(128),
	ParkCond varchar(128),
	Trailer varchar(128),
	HandiTrail varchar(128),
	Vehicle varchar(128),
	Handicap varchar(128),
	Restroom varchar(128),
	HandiRestr varchar(128),
	HandiAcces varchar(128),
	Picnic varchar(128),
	Lighting varchar(128),
	Grill varchar(128),
	Street varchar(128),
	City varchar(128),
	County varchar(128),
	Zip varchar(128),
	Latitude varchar(128),
	Longitude varchar(128),
	WaterType varchar(128),
	WaterName varchar(128),
	created_user varchar(128),
	created_date varchar(128),
	last_edited_user varchar(128),
	last_edited_date varchar(128),
	GlobalID varchar(128),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\rampsSorted.txt' INTO TABLE ramps
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
(
	Name,
	X,
	Y,
	OBJECTID,
	FacType,
	Access,
	PrimAgency,
	PartAgency,
	Status,
	Hours,
	Fees,
	FeeAmt,
	FeeCollect,
	RampSurf,
	RampCond,
	SingleLane,
	DoubleLane,
	TotalLane,
	DockType,
	ParkSurf,
	ParkCond,
	Trailer,
	HandiTrail,
	Vehicle,
	Handicap,
	Restroom,
	HandiRestr,
	HandiAcces,
	Picnic,
	Lighting,
	Grill,
	Street,
	City,
	County,
	Zip,
	Latitude,
	Longitude,
	WaterType,
	WaterName,
	created_user,
	created_date,
	last_edited_user,
	last_edited_date,
	GlobalID
);

OPTIMIZE TABLE ramps;

/*
Name,X,Y,OBJECTID,FacType,Access,PrimAgency,PartAgency,Status,Hours,Fees,FeeAmt,FeeCollect,RampSurf,RampCond,SingleLane,DoubleLane,TotalLane,DockType,ParkSurf,ParkCond,Trailer,HandiTrail,Vehicle,Handicap,Restroom,HandiRestr,HandiAcces,Picnic,Lighting,Grill,Street,City,County,Zip,Latitude,Longitude,WaterType,WaterName,created_user,created_date,last_edited_user,last_edited_date,GlobalID
*/