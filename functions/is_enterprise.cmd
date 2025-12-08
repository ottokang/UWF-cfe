rem Check if the Windows edition is Enterprise
for /f "tokens=* USEBACKQ" %%F IN (`reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "ProductName" ^| find /c "Enterprise"`) do (set is_enterprise=%%F)

if %is_enterprise%==0 (
    echo %red%Your Windows is not Enterprice version, you can not use UWF%reset_color%
    echo:
    pause
    exit
)