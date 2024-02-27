cdrLoader.exe

SORT /M 500000 < cdrRoutes.txt > cdrRoutesSorted.txt

mysql.exe --login-path=batch --table < cdr.sql

DEL CDR.txt

DEL cdrRoutes.txt

REM DEL cdrroutesSorted.txt

PAUSE