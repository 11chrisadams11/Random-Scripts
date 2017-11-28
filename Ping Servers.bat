@ECHO OFF
setlocal EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)

ECHO/
ECHO Pinging:
SET ips=10.1.1.1 10.1.1.2
SET name=Server1 Server2

set i=0
for %%a in (%name%) do set /A i+=1 & set name[!i!]=%%a
set i=0
for %%b in (%ips%) do set /A i+=1 & set ips[!i!]=%%b
set n=%i%

for /L %%i in (1,1,%n%) do (
  ping -n 1 !ips[%%i]! | find "TTL=" >nul
  if errorlevel 1 (
    call :colorEcho 07 "  !name[%%i]! - " 
    call :colorEcho 0c " Fail"
    echo/
  ) else (
rem    echo   !name[%%i]!... OK
    call :colorEcho 07 "  !name[%%i]! - "
    call :colorEcho 0a " OK"
    echo/
  )
)
pause
EXIT

:colorEcho
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i