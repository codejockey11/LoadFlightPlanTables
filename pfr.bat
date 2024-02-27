pfrLoader.exe

SORT /M 500000 < pfrRoutes.txt > pfrRoutesSorted.txt

mysql.exe --login-path=batch --table < pfr.sql

DEL PFR.txt

DEL pfrRoutes.txt
REM DEL pfrRoutesSorted.txt

PAUSE