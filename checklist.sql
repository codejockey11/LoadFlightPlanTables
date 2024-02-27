USE aviation;

DROP TABLE IF EXISTS checklist;

CREATE TABLE checklist
(
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	pilotId varchar(50),
	registration varchar(50),
	image varchar(255),
	PRIMARY KEY(id)
)
COLLATE ascii_bin;

OPTIMIZE TABLE checklist;

/*
pilotId,registration,image
*/