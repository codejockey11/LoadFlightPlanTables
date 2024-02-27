REM The mysql_config_editor utility enables you to store authentication credentials in an obfuscated login path file named .mylogin.cnf. The file location is the %APPDATA%\MySQL directory on Windows and the current user's home directory on non-Windows systems. The file can be read later by MySQL client programs to obtain authentication credentials for connecting to MySQL Server.

REM mysql_config_editor set --login-path=batch --table --host=localhost --port=26106 --user --password
REM mysql_config_editor print --all

DEL _load.log

CALL :sub >> _load.log 2>&1
EXIT /b

:sub

TIME /T

REM =====================================================================================
REM Set the new effective date
REM =====================================================================================
mysql.exe --login-path=batch --table -e "use aviation;UPDATE parameter SET value1='11/02/2023' WHERE name='effectiveDate';"

REM =====================================================================================
REM Drop and recreate the session table
REM =====================================================================================
mysql.exe --login-path=batch --table < session.sql

REM =====================================================================================
REM Delete any temp items
REM =====================================================================================
DEL "%USERPROFILE%\Documents\website\public_html\temp\*.html"
DEL "%USERPROFILE%\Documents\website\public_html\temp\*.pln"

DEL "%USERPROFILE%\Documents\website\public_html\dTPPCS\cs\*.pdf"
DEL "%USERPROFILE%\Documents\website\public_html\dTPPCS\dTPP\*.pdf"
DEL "%USERPROFILE%\Documents\website\public_html\dTPPCS\compare_pdf\*.pdf"

REM =====================================================================================
REM dump the account table to a text file and reload
REM =====================================================================================
mysql.exe --login-path=batch --table < accountBkup.sql
mysql.exe --login-path=batch --table < accountLoadBkup.sql

REM =====================================================================================
REM dump the airplane table to a text file and reload
REM =====================================================================================
mysql.exe --login-path=batch --table < airplaneBkup.sql
mysql.exe --login-path=batch --table < airplaneLoadBkup.sql

REM =====================================================================================
REM dump the flight plan table to a text file and reload
REM =====================================================================================
mysql.exe --login-path=batch --table < flightPlanBkup.sql
mysql.exe --login-path=batch --table < flightPlanLoadBkup.sql

REM =====================================================================================
REM dump the checklist table to a text file and reload
REM =====================================================================================
mysql.exe --login-path=batch --table < checklistBkup.sql
mysql.exe --login-path=batch --table < checklistLoadBkup.sql

REM =====================================================================================
REM dump the logbook table to a text file and reload
REM =====================================================================================
mysql.exe --login-path=batch --table < logbookBkup.sql
mysql.exe --login-path=batch --table < logbookLoadBkup.sql

REM =====================================================================================
REM dump the parameter table to a text file and reload
REM =====================================================================================
mysql.exe --login-path=batch --table < parameterBkup.sql
mysql.exe --login-path=batch --table < parameterLoadBkup.sql

@ECHO OFF

REM ::::::::: Get the "AM PM" string to check the HOUR interval
FOR /F "tokens=1,2 delims= " %%A IN ('time /t') DO SET AM_PM=%%B

REM ::::::::: Split the TIME digits to three intervals [H] [MM] [SS.SS]
FOR /F "tokens=1-3 delims=:" %%A IN ('echo %time%') DO SET H_NUM=%%A& SET M_NUM=%%B& SET S_NUM=%%C

REM ::::::::: Convert all HOUR intervals [H] to "24 hour" format [HH]
IF %AM_PM%==PM (
 IF %H_NUM%==01 (SET H_NUM=13)
 IF %H_NUM%==02 (SET H_NUM=14)
 IF %H_NUM%==03 (SET H_NUM=15)
 IF %H_NUM%==04 (SET H_NUM=16)
 IF %H_NUM%==05 (SET H_NUM=17)
 IF %H_NUM%==06 (SET H_NUM=18)
 IF %H_NUM%==07 (SET H_NUM=19)
 IF %H_NUM%==08 (SET H_NUM=20)
 IF %H_NUM%==09 (SET H_NUM=21)
 IF %H_NUM%==10 (SET H_NUM=22)
 IF %H_NUM%==11 (SET H_NUM=23)
 ) ELSE (
 IF %H_NUM%==12 (SET H_NUM=00)
 IF %H_NUM%==1 (SET H_NUM=01)
 IF %H_NUM%==2 (SET H_NUM=02)
 IF %H_NUM%==3 (SET H_NUM=03)
 IF %H_NUM%==4 (SET H_NUM=04)
 IF %H_NUM%==5 (SET H_NUM=05)
 IF %H_NUM%==6 (SET H_NUM=06)
 IF %H_NUM%==7 (SET H_NUM=07)
 IF %H_NUM%==8 (SET H_NUM=08)
 IF %H_NUM%==9 (SET H_NUM=09)
)

REM ::::::::: My compiled timestamp ...has a dot [HHMMSS.SS]
SET TIMESTAMP=%H_NUM%%M_NUM%%S_NUM%

REM ::::::::: Remove the dot from my compiled timestamp [HHMMSSSS]
SET TIMESTAMP=%TIMESTAMP:.=%

SET DATESTAMP=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%

@ECHO ON

REM =====================================================================================
REM Rename the backups to have date and time
REM =====================================================================================
REN "%USERPROFILE%\Documents\LoadFlightPlanTables\account.txt" "account_%DATESTAMP%_%TIMESTAMP%.txt"
REN "%USERPROFILE%\Documents\LoadFlightPlanTables\airplane.txt" "airplane_%DATESTAMP%_%TIMESTAMP%.txt"
REN "%USERPROFILE%\Documents\LoadFlightPlanTables\flightPlan.txt" "flightPlan_%DATESTAMP%_%TIMESTAMP%.txt"
REN "%USERPROFILE%\Documents\LoadFlightPlanTables\checklist.txt" "checklist_%DATESTAMP%_%TIMESTAMP%.txt"
REN "%USERPROFILE%\Documents\LoadFlightPlanTables\logbook.txt" "logbook_%DATESTAMP%_%TIMESTAMP%.txt"
REN "%USERPROFILE%\Documents\LoadFlightPlanTables\parameter.txt" "parameter_%DATESTAMP%_%TIMESTAMP%.txt"

REM =====================================================================================
REM Move the backups to the backup directory
REM =====================================================================================
MOVE "%USERPROFILE%\Documents\LoadFlightPlanTables\account*.txt" "%USERPROFILE%\Documents\LoadFlightPlanTables\bkups\"
MOVE "%USERPROFILE%\Documents\LoadFlightPlanTables\airplane*.txt" "%USERPROFILE%\Documents\LoadFlightPlanTables\bkups\"
MOVE "%USERPROFILE%\Documents\LoadFlightPlanTables\flightPlan*.txt" "%USERPROFILE%\Documents\LoadFlightPlanTables\bkups\"
MOVE "%USERPROFILE%\Documents\LoadFlightPlanTables\checklist*.txt" "%USERPROFILE%\Documents\LoadFlightPlanTables\bkups\"
MOVE "%USERPROFILE%\Documents\LoadFlightPlanTables\logbook*.txt" "%USERPROFILE%\Documents\LoadFlightPlanTables\bkups\"
MOVE "%USERPROFILE%\Documents\LoadFlightPlanTables\parameter*.txt" "%USERPROFILE%\Documents\LoadFlightPlanTables\bkups\"

REM =====================================================================================
REM aptLoader.exe
REM =====================================================================================
decompressor.exe "%USERPROFILE%\Downloads" "28DaySubscription*.zip" APT.txt

aptLoader.exe

SORT /M 500000 < aptAirport.txt > aptAirportSorted.txt
SORT /M 500000 < aptRunway.txt > aptRunwaySorted.txt
SORT /M 500000 < aptRemark.txt > aptRemarkSorted.txt
SORT /M 500000 < aptAttended.txt > aptAttendedSorted.txt
SORT /M 500000 < aptArresting.txt > aptArrestingSorted.txt

mysql.exe --login-path=batch --table < apt.sql

DEL APT.txt

DEL aptAirport.txt
DEL aptRunway.txt
DEL aptRemark.txt
DEL aptAttended.txt
DEL aptArresting.txt

DEL aptairportSorted.txt
DEL aptrunwaySorted.txt
DEL aptremarkSorted.txt
DEL aptattendedSorted.txt
DEL aptarrestingSorted.txt

REM =====================================================================================
REM awosLoader.exe
REM =====================================================================================
awosLoader.exe

SORT /M 500000 < awosStation.txt > awosStationSorted.txt
SORT /M 500000 < awosRemarks.txt > awosRemarksSorted.txt

mysql.exe --login-path=batch --table < awos.sql

DEL AWOS.txt

DEL awosStation.txt
DEL awosRemarks.txt

DEL awosStationSorted.txt
DEL awosRemarksSorted.txt

REM =====================================================================================
REM cdrLoader.exe
REM =====================================================================================
cdrLoader.exe

SORT /M 500000 < cdrRoutes.txt > cdrRoutesSorted.txt

mysql.exe --login-path=batch --table < cdr.sql

DEL CDR.txt

DEL cdrRoutes.txt

DEL cdrRoutesSorted.txt

REM =====================================================================================
REM comLoader.exe
REM =====================================================================================
comLoader.exe

SORT /M 500000 < comStation.txt > comStationSorted.txt

mysql.exe --login-path=batch --table < com.sql

DEL COM.txt

DEL comStation.txt

DEL comStationSorted.txt

REM =====================================================================================
REM fixLoader.exe
REM =====================================================================================
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

DEL fixLocationSorted.txt
DEL fixNavaidSorted.txt
DEL fixIlsSorted.txt
DEL fixRemarksSorted.txt
DEL fixChartingSorted.txt

REM =====================================================================================
REM ilsLoader.exe
REM =====================================================================================
ilsLoader.exe

SORT /M 500000 < ilsApproach.txt > ilsApproachSorted.txt
SORT /M 500000 < ilsFrequency.txt > ilsFrequencySorted.txt
SORT /M 500000 < ilsGlideslope.txt > ilsGlideslopeSorted.txt
SORT /M 500000 < ilsDme.txt > ilsDmeSorted.txt
SORT /M 500000 < ilsMarker.txt > ilsMarkerSorted.txt
SORT /M 500000 < ilsRemarks.txt > ilsRemarksSorted.txt

mysql.exe --login-path=batch --table < ils.sql

DEL ILS.txt

DEL ilsApproach.txt
DEL ilsFrequency.txt
DEL ilsGlideslope.txt
DEL ilsDme.txt
DEL ilsMarker.txt
DEL ilsRemarks.txt

DEL ilsApproachSorted.txt
DEL ilsFrequencySorted.txt
DEL ilsGlideslopeSorted.txt
DEL ilsDmeSorted.txt
DEL ilsMarkerSorted.txt
DEL ilsRemarksSorted.txt

REM =====================================================================================
REM navLoader.exe
REM =====================================================================================
navLoader.exe

SORT /M 500000 < navNavaid.txt > navNavaidSorted.txt
SORT /M 500000 < navRemarks.txt > navRemarksSorted.txt

mysql.exe --login-path=batch --table < nav.sql

DEL NAV.txt

DEL navNavaid.txt
DEL navRemarks.txt

DEL navNavaidSorted.txt
DEL navRemarksSorted.txt

REM =====================================================================================
REM awyLoader.exe
REM =====================================================================================
DEL awyFixs.txt
DEL awyNavaids.txt

mysql.exe --login-path=batch --table < awyNavaids.sql

awyLoader.exe

SORT /M 500000 < airway.txt > airwaySorted.txt

mysql.exe --login-path=batch --table < awy.sql

DEL AWY.txt

DEL airway.txt

DEL airwaySorted.txt

REM =====================================================================================
REM atsLoader.exe
REM =====================================================================================
atsLoader.exe

SORT /M 500000 < airway2.txt > airway2Sorted.txt

mysql.exe --login-path=batch --table < ats.sql

DEL ATS.txt

DEL airway2.txt

DEL airway2Sorted.txt

DEL awyFixs.txt
DEL awyNavaids.txt

REM =====================================================================================
REM pjaLoader.exe
REM =====================================================================================
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
DEL pjaUserGroup.txt
DEL pjaContact.txt
DEL pjaRemarks.txt

DEL pjaLocationSorted.txt
DEL pjaTimesSorted.txt
DEL pjaUserGroupSorted.txt
DEL pjaContactSorted.txt
DEL pjaRemarksSorted.txt

REM =====================================================================================
REM pfrLoader.exe
REM =====================================================================================
pfrLoader.exe

SORT /M 500000 < pfrRoutes.txt > pfrRoutesSorted.txt

mysql.exe --login-path=batch --table < pfr.sql

DEL PFR.txt

DEL pfrRoutes.txt

DEL pfrRoutesSorted.txt

REM =====================================================================================
REM starDpLoader.exe
REM =====================================================================================
starDpLoader.exe

SORT /M 500000 < starDpf.txt > starDpSorted.txt

mysql.exe --login-path=batch --table < starDp.sql

DEL STARDP.txt

DEL starDpf.txt

DEL starDpSorted.txt

REM =====================================================================================
REM twrLoader.exe
REM =====================================================================================
twrLoader.exe

SORT /M 500000 < twrTower.txt > twrTowerSorted.txt
SORT /M 500000 < twrHoursOfOp.txt > twrHoursOfOpSorted.txt
SORT /M 500000 < twrFrequency.txt > twrFrequencySorted.txt
SORT /M 500000 < twrServices.txt > twrServicesSorted.txt
SORT /M 500000 < twrRadars.txt > twrRadarsSorted.txt
SORT /M 500000 < twrRemarks.txt > twrRemarksSorted.txt
SORT /M 500000 < twrSatellite.txt > twrSatelliteSorted.txt
SORT /M 500000 < twrAirspace.txt > twrAirspaceSorted.txt
SORT /M 500000 < twrAtis.txt > twrAtisSorted.txt

mysql.exe --login-path=batch --table < twr.sql

DEL TWR.txt

DEL twrTower.txt
DEL twrHoursOfOp.txt
DEL twrFrequency.txt
DEL twrServices.txt
DEL twrRadars.txt
DEL twrRemarks.txt
DEL twrSatellite.txt
DEL twrAirspace.txt
DEL twrAtis.txt

DEL twrTowerSorted.txt
DEL twrHoursOfOpSorted.txt
DEL twrFrequencySorted.txt
DEL twrServicesSorted.txt
DEL twrRadarsSorted.txt
DEL twrRemarksSorted.txt
DEL twrSatelliteSorted.txt
DEL twrAirspaceSorted.txt
DEL twrAtisSorted.txt

REM =====================================================================================
REM affLoader.exe
REM ARTCC tower locations and frequencies
REM =====================================================================================
affLoader.exe

SORT /M 500000 < twrFrequency2.txt > twrFrequency2Sorted.txt

mysql.exe --login-path=batch --table < aff.sql

DEL AFF.txt

DEL twrFrequency2.txt
DEL twrFrequency2Sorted.txt

REM =====================================================================================
REM cifpLoader.exe
REM input is cifp_*.zip
REM =====================================================================================
cifpLoader.exe

SORT /M 500000 < cifp.txt > cifpSorted.txt

mysql.exe --login-path=batch --table < cifp.sql

mysql.exe --login-path=batch --table < cifpNavaids.sql

cifpUpdater.exe

DEL cifpSorted.txt

SORT /M 500000 < cifpOut.txt > cifpSorted.txt

mysql.exe --login-path=batch --table < cifp.sql

DEL FAACIFP18.txt
DEL cifp.txt

DEL cifpOut.txt
DEL cifpSorted.txt

DEL cifpNavaids1.txt
DEL cifpNavaids2.txt
DEL cifpNavaids3.txt
DEL cifpNavaids4.txt
DEL cifpFix.txt
DEL cifpIls.txt
DEL cifpAirport.txt

REM =====================================================================================
REM csLoader.exe
REM input is DCS_*.zip
REM =====================================================================================
csLoader.exe

SORT /M 500000 < chartSupplement.txt > chartSupplementSorted.txt

mysql.exe --login-path=batch --table < cs.sql

DEL cs.xml

DEL chartSupplement.txt
DEL chartSupplementSorted.txt

REM =====================================================================================
REM dTPPLoader.exe
REM input is DDTPPE_*.zip
REM =====================================================================================
dTPPLoader.exe

SORT /M 500000 < dTPP.txt > dTPPSorted.txt

SORT /M 500000 < compares.txt > comparesSorted.txt

mysql.exe --login-path=batch --table < dTPP.sql

DEL dTPP.xml

DEL dTPP.txt

DEL compares.txt

DEL dTPPSorted.txt
DEL comparesSorted.txt

REM =====================================================================================
REM dofLoader.exe
REM input is DOF_*.zip
REM =====================================================================================
dofLoader.exe

SORT /M 500000 < obstacle.txt > dofSorted.txt

mysql.exe --login-path=batch --table < dof.sql

DEL DOF.txt

DEL obstacle.txt
DEL dofSorted.txt

REM =====================================================================================
REM maaLoader.exe
REM =====================================================================================
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

DEL maaBaseDataSorted.txt
DEL maaTimesOfUseSorted.txt
DEL maaUserGroupSorted.txt 
DEL maaContactSorted.txt
DEL maaNotamsSorted.txt
DEL maaRemarksSorted.txt

DEL maaupdate.sql

REM =====================================================================================
REM CFR Title 14 & 49
REM =====================================================================================
CFR.exe ECFR-title14.xml 14 "%USERPROFILE%\Documents\website\public_html\cfr"
CFR.exe ECFR-title49.xml 49 "%USERPROFILE%\Documents\website\public_html\cfr"

TIME /T

)