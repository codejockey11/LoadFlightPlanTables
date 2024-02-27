USE aviation;

SELECT * INTO OUTFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\cbTitle.txt'
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
FROM cbTitle ORDER BY title;

SELECT * INTO OUTFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\cbIngredients.txt'
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
FROM cbIngredients ORDER BY title;

SELECT title, REPLACE(text, '\r\n', '*') INTO OUTFILE 'C:\\Users\\junk_\\Documents\\LoadFlightPlanTables\\cbSteps.txt'
	FIELDS TERMINATED BY '~'
	LINES TERMINATED BY '\r\n'
FROM cbSteps ORDER BY title;
