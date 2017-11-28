@echo off
setlocal enableextensions

for /F "tokens=2,*" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList" /v ProfileImagePath /s ^| find "REG_EXPAND_SZ" ^| findstr /v /i "\\windows\\ \\system32\\"') do (
    call :removeFiles "%%b"
)

endlocal
pause

:removeFiles
    For %%A in ("%~1") do (
        SET name=%%~nxA
    )
    SET folder="%~1\VIEVU\VIEVU VERIPATROL Client\%name%\Local"
    del %folder%\*.avi /s
    goto :EOF

