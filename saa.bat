REM also used in qgisBatch

saaToKml.exe

SORT /M 500000 < saaLocation.txt > saaLocationSorted.txt
SORT /M 500000 < saaGeometry.txt > saaGeometrySorted.txt
SORT /M 500000 < saaTimes.txt > saaTimesSorted.txt
SORT /M 500000 /REC 65535 < saaNote.txt > saaNoteSorted.txt

mysql.exe --login-path=batch --table < saa.sql

DEL saaMoa.kml
DEL saaControlled.kml
DEL saaProhibited.kml
DEL saaRestricted.kml
DEL saaAlert.kml
DEL saaWarning.kml
DEL saaNational.kml

DEL temp.xml

DEL saaLocation.txt
DEL saaGeometry.txt
DEL saaTimes.txt
DEL saaNote.txt

REM DEL saaLocationSorted.txt
REM DEL saaGeometrySorted.txt
REM DEL saaTimesSorted.txt
REM DEL saaNoteSorted.txt

PAUSE