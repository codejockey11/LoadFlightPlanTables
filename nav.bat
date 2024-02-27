navLoader.exe

SORT /M 500000 < navNavaid.txt > navNavaidSorted.txt
SORT /M 500000 < navRemarks.txt > navRemarksSorted.txt

mysql.exe --login-path=batch --table < nav.sql

DEL NAV.txt

DEL navNavaid.txt
DEL navRemarks.txt

REM DEL navNavaidSorted.txt
REM DEL navRemarksSorted.txt

PAUSE