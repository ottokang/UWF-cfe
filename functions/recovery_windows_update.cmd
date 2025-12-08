rem Recovery Windows Update

cls
echo %cyan%Recovery Windows Update...%reset_color%
echo:

rem del HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate
rem del HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore
rem value HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Configuration Manager\RegistryReorganizationLimitDays
rem value HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance\MaintenanceDisabled

rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled /t REG_DWORD /d 1 /f

set message="Recovery Windows Update complete"
set is_check_state=true
pause