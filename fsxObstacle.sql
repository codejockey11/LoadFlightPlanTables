use aviation;

SELECT DISTINCT type 
  INTO OUTFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\fsxObstacleType.txt' 
  FIELDS TERMINATED BY '~'
  LINES TERMINATED BY '\r\n'
  FROM obstacle;

SELECT * 
  INTO OUTFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\fsxObstacle.txt' 
  FIELDS TERMINATED BY '~'
  LINES TERMINATED BY '\r\n'
  FROM obstacle;
