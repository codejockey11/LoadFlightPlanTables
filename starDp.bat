starDpLoader.exe

SORT /M 500000 < stardpf.txt > stardpSorted.txt

mysql.exe --login-path=batch --table < starDp.sql

DEL STARDP.txt

DEL stardpf.txt

REM DEL stardpSorted.txt

PAUSE