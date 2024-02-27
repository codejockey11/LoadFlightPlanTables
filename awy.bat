mysql.exe --login-path=batch --table < awyNavaids.sql

awyLoader.exe

SORT /M 500000 < airway.txt > airwaySorted.txt

mysql.exe --login-path=batch --table < awy.sql

DEL AWY.txt

DEL airway.txt

REM DEL airwaySorted.txt

PAUSE