@ECHO OFF
SET dropboxdir="C:\DATA\Dropbox\SoniClear_Transfer"
SET exportdir="C:\DATA\SoniClear\Meeting*"

tasklist /FI "IMAGENAME eq SoniClear9.exe" 2>NUL | find /I /N "SoniClear9.exe">NUL
if "%ERRORLEVEL%"=="0" (
  ECHO.
  ECHO.
  ECHO Please close SoniClear and try again.
  ECHO.
  ECHO.
  ECHO.
  PAUSE
  GOTO :EOF
)

FOR /d %%D IN (%exportdir%) DO (
  copy "%%~fD\*.mp3" %dropboxdir%
  rd /s /q "%%~fD"
)
