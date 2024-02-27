usZips.exe

SORT /M 500000 < uszips_out.txt > uszips_sorted.txt

mysql.exe --login-path=batch --table < usZips.sql

DEL uszips_out.txt
DEL uszips_sorted.txt

PAUSE