@ECHO OFF

SET dateNow=%date:~4,2%-%date:~7,2%-%date:~10,4%
X:
cd "C:\Users\%username%\Desktop\"
dir /b > "C:\Users\%username%\Desktop\Folder List %dateNow%.txt"