ilsLoader.exe

SORT /M 500000 < ilsApproach.txt > ilsApproachSorted.txt
SORT /M 500000 < ilsFrequency.txt > ilsFrequencySorted.txt
SORT /M 500000 < ilsGlideslope.txt > ilsGlideslopeSorted.txt
SORT /M 500000 < ilsDme.txt > ilsDmeSorted.txt
SORT /M 500000 < ilsMarker.txt > ilsMarkerSorted.txt
SORT /M 500000 < ilsRemarks.txt > ilsRemarksSorted.txt

mysql.exe --login-path=batch --table < ils.sql

DEL ILS.txt

DEL ilsApproach.txt
DEL ilsFrequency.txt
DEL ilsGlideslope.txt
DEL ilsDme.txt
DEL ilsMarker.txt
DEL ilsRemarks.txt

REM DEL ilsApproachSorted.txt
REM DEL ilsFrequencySorted.txt
REM DEL ilsGlideslopeSorted.txt
REM DEL ilsDmeSorted.txt
REM DEL ilsMarkerSorted.txt
REM DEL ilsRemarksSorted.txt

PAUSE