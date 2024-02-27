dTPPLoader.exe

SORT /M 500000 < dTPP.txt > dTPPSorted.txt

SORT /M 500000 < compares.txt > comparesSorted.txt

mysql.exe --login-path=batch --table < dTPP.sql

DEL dTPP.xml

DEL dTPP.txt

DEL compares.txt

REM DEL dTPPSorted.txt
REM DEL comparesSorted.txt

PAUSE