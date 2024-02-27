use aviation;

DROP TABLE IF EXISTS uszips;

CREATE TABLE uszips(
id MEDIUMINT NOT NULL AUTO_INCREMENT,
state varchar(4),
city varchar(30),
county varchar(30),
zip varchar(5),
latitude varchar(14),
longitude varchar(14),
timezone varchar(50),
PRIMARY KEY(id)
) COLLATE ascii_bin;

LOAD DATA INFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\uszips_sorted.txt' INTO TABLE uszips
  FIELDS TERMINATED BY '~'
  LINES TERMINATED BY '\r\n';

OPTIMIZE TABLE uszips;
