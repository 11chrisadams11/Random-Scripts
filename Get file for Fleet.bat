@ECHO OFF

SET dateNow=%date:~4,2%-%date:~7,2%-%date:~10,4%
SET month=%date:~4,2%
SET day=%date:~7,2%
SET year=%date:~10,4%
SET logfile="C:\tools\FleetGet.log"

FOR %%I IN (%logfile%) DO SET logsize=%%~zI
IF %logsize% GTR 10000000 del %logfile%

REM X:
REM cd "X:\Public Works Dept\Fleet Division\WEXLink Data"
pushd "\\WEXLink Data"

C:\tools\winscp577\winscp.com /log=%logfile% /command ^
  "open sftp://ftp_site" ^
  "get Lehi2000.%year%%month%%day%" ^
  "exit"

popd

