affLoader.exe

SORT /M 500000 < twrFrequency2.txt > twrFrequency2Sorted.txt

mysql.exe --login-path=batch --table < aff.sql

DEL AFF.txt
DEL twrFrequency2.txt
REM DEL twrFrequency2Sorted.txt

PAUSE