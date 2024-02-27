maaLoader.exe

SORT /M 500000 < maaBaseData.txt > maaBaseDataSorted.txt
SORT /M 500000 < maaTimesOfUse.txt > maaTimesOfUseSorted.txt
SORT /M 500000 < maaUserGroup.txt > maaUserGroupSorted.txt 
SORT /M 500000 < maaContact.txt > maaContactSorted.txt
SORT /M 500000 < maaNotams.txt > maaNotamsSorted.txt
SORT /M 500000 < maaRemarks.txt > maaRemarksSorted.txt

mysql.exe --login-path=batch --table < maa.sql

mysql.exe --login-path=batch --table < maaupdate.sql

DEL MAA.txt

DEL maaBaseData.txt
DEL maaPolyCoord.txt
DEL maaTimesOfUse.txt
DEL maaUserGroup.txt
DEL maaContact.txt
DEL maaNotams.txt
DEL maaRemarks.txt

REM DEL maaBaseDataSorted.txt
REM DEL maaTimesOfUseSorted.txt
REM DEL maaUserGroupSorted.txt 
REM DEL maaContactSorted.txt
REM DEL maaNotamsSorted.txt
REM DEL maaRemarksSorted.txt

PAUSE