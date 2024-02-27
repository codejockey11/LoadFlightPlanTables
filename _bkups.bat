DEL _bkups.log

CALL :sub >> _bkups.log 2>&1
EXIT /b

:sub

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
