SORT /M 500000 < stockSymbols.txt > stockSymbolsSorted.txt

mysql.exe --login-path=batch --table < stockSymbols.sql

REM DEL stockSymbolsSorted.txt

PAUSE