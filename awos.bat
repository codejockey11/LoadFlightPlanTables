awosLoader.exe

SORT /M 500000 < awosstation.txt > awosStationSorted.txt
SORT /M 500000 < awosremarks.txt > awosRemarksSorted.txt

mysql.exe --login-path=batch --table < awos.sql

DEL AWOS.txt

DEL awosStation.txt
DEL awosRemarks.txt

REM DEL awosStationSorted.txt
REM DEL awosRemarksSorted.txt

PAUSE