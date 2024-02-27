comLoader.exe

SORT /M 500000 < comStation.txt > comStationSorted.txt

mysql.exe --login-path=batch --table < com.sql

DEL COM.txt

DEL comStation.txt

REM DEL comStationSorted.txt

PAUSE