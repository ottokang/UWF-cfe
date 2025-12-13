rem Check if the Windows edition is Enterprise?IoT Enterprise or Education
for /f "tokens=* USEBACKQ" %%F IN (`reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "ProductName" ^| find /c "Enterprise"`) do (set is_enterprise=%%F)
for /f "tokens=* USEBACKQ" %%F IN (`reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "ProductName" ^| find /c "Education"`) do (set is_education=%%F)

set /a can_use_uwf=%is_enterprise% + %is_education%
if %can_use_uwf%==0 (
    echo %red%Your Windows is not Enterprise?IoT Enterprise or Education version, you can not use UWF%reset_color%
    echo:
    pause
    exit
)