pjaLoader.exe

SORT /M 500000 < pjaLocation.txt > pjaLocationSorted.txt
SORT /M 500000 < pjaTimes.txt > pjaTimesSorted.txt
SORT /M 500000 < pjaUsergroup.txt > pjaUserGroupSorted.txt
SORT /M 500000 < pjaContact.txt > pjaContactSorted.txt
SORT /M 500000 < pjaRemarks.txt > pjaRemarksSorted.txt

mysql.exe --login-path=batch --table < pja.sql

DEL PJA.txt

DEL pjaLocation.txt
DEL pjaTimes.txt
DEL pjaUsergroup.txt
DEL pjaContact.txt
DEL pjaRemarks.txt

REM DEL pjaLocationSorted.txt
REM DEL pjaTimesSorted.txt
REM DEL pjaUsergroupSorted.txt
REM DEL pjaContactSorted.txt
REM DEL pjaRemarksSorted.txt

PAUSE