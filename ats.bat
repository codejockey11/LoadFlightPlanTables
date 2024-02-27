atsLoader.exe

SORT /M 500000 < airway2.txt > airway2Sorted.txt

mysql.exe --login-path=batch --table < ats.sql

DEL ATS.txt

DEL airway2.txt
REM DEL airway2Sorted.txt

PAUSE