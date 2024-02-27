decompressor.exe "%USERPROFILE%\Downloads" "28DaySubscription*.zip" APT.txt

aptLoader.exe

SORT /M 500000 < aptAirport.txt > aptAirportSorted.txt
SORT /M 500000 < aptRunway.txt > aptRunwaySorted.txt
SORT /M 500000 < aptRemark.txt > aptRemarkSorted.txt
SORT /M 500000 < aptAttended.txt > aptAttendedSorted.txt
SORT /M 500000 < aptArresting.txt > aptArrestingSorted.txt

mysql.exe --login-path=batch --table < apt.sql

DEL APT.txt

DEL aptAirport.txt
DEL aptRunway.txt
DEL aptRemark.txt
DEL aptAttended.txt
DEL aptArresting.txt

REM DEL aptAirportSorted.txt
REM DEL aptRunwaySorted.txt
REM DEL aptRemarksSorted.txt
REM DEL aptAttendedSorted.txt
REM DEL aptArrestingSorted.txt

PAUSE