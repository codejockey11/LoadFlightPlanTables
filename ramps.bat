rampsLoader.exe

SORT /M 500000 < ramps.txt > rampsSorted.txt

mysql.exe --login-path=batch --table < ramps.sql

DEL ramps.txt

REM DEL rampsSorted.txt

PAUSE