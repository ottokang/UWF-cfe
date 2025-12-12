rem Recovery Fast Startup

cls
echo %cyan%Recovery fast startup...%reset_color%
echo:

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled /t REG_DWORD /d 1 /f

set message="Recovery fast startup complete"
set is_check_state=true
pause