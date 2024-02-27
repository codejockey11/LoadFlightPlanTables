decompressor.exe "%USERPROFILE%\Downloads" "28DaySubscription*.zip" FIX.txt

fixLoader.exe

SORT /M 500000 < fixLocation.txt > fixLocationSorted.txt
SORT /M 500000 < fixNavaid.txt > fixNavaidSorted.txt
SORT /M 500000 < fixIls.txt > fixIlsSorted.txt
SORT /M 500000 < fixRemarks.txt > fixRemarksSorted.txt
SORT /M 500000 < fixCharting.txt > fixChartingSorted.txt

mysql.exe --login-path=batch --table < fix.sql

DEL FIX.txt

DEL fixLocation.txt
DEL fixNavaid.txt
DEL fixIls.txt
DEL fixRemarks.txt
DEL fixCharting.txt

REM DEL fixLocationSorted.txt
REM DEL fixNavaidSorted.txt
REM DEL fixIlsSorted.txt
REM DEL fixRemarksSorted.txt
REM DEL fixChartingSorted.txt

PAUSE