rem Disable UWF

cls
echo %magenta%%LANG_disable_uwf_message%%reset_color%
echo:
uwfmgr filter disable
echo:

choice /n /m "%LANG_disable_uwf_reboot%"
if !ERRORLEVEL!==1 (
    echo:
    echo %cyan%%LANG_reboot%%reset_color%
    shutdown /r /t 3
    pause > nul
) else (
    set "message=%LANG_disable_uwf_need_reboot%"
    set "is_check_state=true"
)