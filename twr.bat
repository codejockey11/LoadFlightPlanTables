twrLoader.exe

SORT /M 500000 < twrTower.txt > twrTowerSorted.txt
SORT /M 500000 < twrHoursOfOp.txt > twrHoursOfOpSorted.txt
SORT /M 500000 < twrFrequency.txt > twrFrequencySorted.txt
SORT /M 500000 < twrServices.txt > twrServicesSorted.txt
SORT /M 500000 < twrRadars.txt > twrRadarsSorted.txt
SORT /M 500000 < twrRemarks.txt > twrRemarksSorted.txt
SORT /M 500000 < twrSatellite.txt > twrSatelliteSorted.txt
SORT /M 500000 < twrAirspace.txt > twrAirspaceSorted.txt
SORT /M 500000 < twrAtis.txt > twrAtisSorted.txt

mysql.exe --login-path=batch --table < twr.sql

DEL TWR.txt

DEL twrTower.txt
DEL twrHoursOfOp.txt
DEL twrFrequency.txt
DEL twrServices.txt
DEL twrRadars.txt
DEL twrRemarks.txt
DEL twrSatellite.txt
DEL twrAirspace.txt
DEL twrAtis.txt

REM DEL twrTowerSorted.txt
REM DEL twrHoursOfOpSorted.txt
REM DEL twrFrequencySorted.txt
REM DEL twrServicesSorted.txt
REM DEL twrRadarsSorted.txt
REM DEL twrRemarksSorted.txt
REM DEL twrSatelliteSorted.txt
REM DEL twrAirspaceSorted.txt
REM DEL twrAtisSorted.txt

affLoader.exe

SORT /M 500000 < twrFrequency2.txt > twrFrequency2Sorted.txt

mysql.exe --login-path=batch --table < aff.sql

DEL AFF.txt
DEL twrFrequency2.txt
REM DEL twrFrequency2Sorted.txt

PAUSE