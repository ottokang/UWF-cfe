rem Disable UWF

cls
echo %magenta%Disable UWF...%reset_color%
echo:
uwfmgr filter disable
echo:

choice /n /m "Do you want to reboot to disable UWF？ [%green%Y%reset_color%, %red%N%reset_color%]"
if !ERRORLEVEL!==1 (
    echo:
    echo %cyan%Reboot in 3 seconds...%reset_color%
    shutdown /r /t 3
    pause > nul
) else (
    set message="Please reboot to disable UWF"
    set is_check_state=true
)