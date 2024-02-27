csLoader.exe

SORT /M 500000 < chartSupplement.txt > chartSupplementSorted.txt

mysql.exe --login-path=batch --table < cs.sql

DEL cs.xml

DEL chartSupplement.txt

REM DEL chartSupplementSorted.txt

PAUSE