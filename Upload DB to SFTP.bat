@ECHO OFF
SET progdir="C:\tools\winscp577\"
SET exportdir="C:\SQL_Data\Sensus_FTP\*.csv"
SET olddir="C:\SQL_Data\Sensus_FTP\old\"
SET logfile=C:\tools\ftpcmd.log

IF EXIST %logfile% (
  GOTO checklogsize
) ELSE (
  GOTO upload
)

:checklogsize
FOR %%I IN (%logfile%) DO SET logsize=%%~zI
IF %logsize% GTR 10000000 del %logfile%

:upload
cd %progdir%

FOR %%F IN (%exportdir%) DO (

  winscp.com /log=%logfile% /command ^
    "open sftp://ftp_site" ^
    "put %%F /incoming/" ^
    "exit"

  IF %ERRORLEVEL% EQU 0 move %%F %olddir%
  ECHO %date% %time% - Moved %%F to %olddir% >> %logfile%
)

:movefile  
SET count=0
FOR %%F IN (%olddir%\*.csv) DO SET /A count+=1

IF %count% GTR 5 (
  FOR %%F IN (%olddir%\*.csv) DO (
    del %%F
    ECHO %date% %time% - Removed %%F from %olddir% >> %logfile%
    GOTO movefile
  )
) ELSE (
  GOTO :eof
)


