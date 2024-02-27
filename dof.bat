dofLoader.exe

SORT /M 500000 < obstacle.txt > dofSorted.txt

mysql.exe --login-path=batch --table < dof.sql

DEL DOF.txt

DEL obstacle.txt

REM DEL dofSorted.txt

PAUSE