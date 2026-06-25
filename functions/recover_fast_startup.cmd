rem Recovery Fast Startup

cls
echo %cyan%%LANG_recover_fast_start_message%%reset_color%
echo:
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled /t REG_DWORD /d 1 /f
echo:

set "message=%LANG_recover_fast_start_complete%"
set "is_check_state=true"
pause