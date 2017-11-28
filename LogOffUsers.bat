@echo off
REM to be scheduled to run hourly
REM for /f "tokens=1-7 delims=,: " %%a in ('query user ^| find /i "disc"') do logoff %%b

REM to be set as a service to run on startup - will log users off after 2 minutes of being disconnected
:Top
for /f "tokens=1-7 delims=,: " %%a in ('query user ^| find /i "disc"') do if %%d GTR 32 (logoff %%b) else %%e GTR 32 (logoff %%b)
choice /T 120 /C 1 /D 1 /N
goto top