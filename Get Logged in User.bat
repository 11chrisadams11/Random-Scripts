@ECHO OFF

:start

CLS
ECHO.
SET /P cname=Enter computer name: 
ECHO.

wmic.exe /node:%cname% computersystem get username

pause

GOTO start