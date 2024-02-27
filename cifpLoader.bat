DEL cifpNavaids1.txt
DEL cifpNavaids2.txt
DEL cifpNavaids3.txt
DEL cifpNavaids4.txt
DEL cifpFix.txt
DEL cifpIls.txt
DEL cifpAirport.txt

cifpLoader.exe

SORT /M 500000 < cifp.txt > cifpSorted.txt

mysql.exe --login-path=batch --table < cifp.sql

mysql.exe --login-path=batch --table < cifpNavaids.sql

cifpUpdater.exe

DEL cifpSorted.txt

SORT /M 500000 < cifpOut.txt > cifpSorted.txt

mysql.exe --login-path=batch --table < cifp.sql

DEL FAACIFP18.txt
DEL cifp.txt

DEL cifpOut.txt
REM DEL cifpSorted.txt

REM DEL cifpNavaids1.txt
REM DEL cifpNavaids2.txt
REM DEL cifpNavaids3.txt
REM DEL cifpNavaids4.txt
REM DEL cifpFix.txt
REM DEL cifpIls.txt
REM DEL cifpAirport.txt

PAUSE