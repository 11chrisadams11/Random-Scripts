@ECHO OFF

CLS
ECHO.
SET /P cname=Enter computer name: 
ECHO.


ECHO ___________________________
ECHO.
ECHO 1) Printer 1
ECHO 2) Printer 2
ECHO 3) Printer 3
ECHO 4) Printer 4
ECHO 5) Printer 5
ECHO 6) Printer 6
ECHO 7) Printer 7
ECHO.
SET /P pname=Select printer: 
ECHO.

ECHO ___________________________
ECHO.
SET /P ar=(A)dd or (R)emove printer: 
ECHO.


IF %pname%==1 SET pname="Printer 1"
IF %pname%==2 SET pname="Printer 2"
IF %pname%==3 SET pname="Printer 3"
IF %pname%==4 SET pname="Printer 4"
IF %pname%==5 SET pname="Printer 5"
IF %pname%==6 SET pname="Printer 6"
IF %pname%==7 SET pname="Printer 7"

IF %ar%==a SET ar=ga
IF %ar%==A SET ar=ga
IF %ar%==r SET ar=gd
IF %ar%==R SET ar=gd

ECHO.
IF %ar%==ga ECHO Adding %pname% to %cname%
IF %ar%==gd ECHO Removing %pname% from %cname%
ECHO.
ECHO.

SET pname=%pname:"=%
START /WAIT RUNDLL32 PRINTUI.DLL,PrintUIEntry /%ar% /c\\%cname% /n"\\elixir\%pname%"

PAUSE