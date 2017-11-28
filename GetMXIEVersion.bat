@ECHO OFF

FOR /F "usebackq tokens=2,* skip=2" %%L IN (`reg query "Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{243E619C-6ABE-4B8F-B13E-80C836F3C593}" /v DisplayVersion`) DO ECHO Old Version: %%M
