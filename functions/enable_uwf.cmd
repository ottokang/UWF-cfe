rem Enable UWF

rem Disable fast startup
cls
echo %cyan%%LANG_disable_fast_start_message%%reset_color%
echo:
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled /t REG_DWORD /d 0 /f
echo:

rem Start UWF enable
echo %cyan%%LANG_enable_uwf_message%%reset_color%
echo:

rem Set UWF overlay type to DISK
uwfmgr overlay set-type DISK

rem Set UWF overlay size to 8192 MB
uwfmgr overlay set-size 8192

rem Set UWF overlay warning threshold to 6144 MB
uwfmgr overlay set-warningthreshold 6144

rem Set UWF overlay critical threshold to 8192 MB
uwfmgr overlay set-criticalthreshold 8192

rem Enable UWF overlay
uwfmgr filter enable

rem Set UWF volume C: to be protected
uwfmgr volume protect c:
echo:

choice /n /m "%LANG_enable_uwf_reboot%"
if !ERRORLEVEL!==1 (
    echo:
    echo %cyan%%LANG_reboot%%reset_color%
    shutdown /r /t 3
    pause > nul
) else (
    set "message=%LANG_enable_uwf_need_reboot%"
    set "is_check_state=true"
)