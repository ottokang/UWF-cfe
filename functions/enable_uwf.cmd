rem Enable UWF

cls
echo %cyan%Enable UWF...%reset_color%
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

choice /n /m "Do you want to reboot to enable UWF？ [%green%Y%reset_color%, %red%N%reset_color%]"
if !ERRORLEVEL!==1 (
    echo:
    echo %cyan%Reboot in 3 seconds...%reset_color%
    shutdown /r /t 3
    pause > nul
) else (
    set message="Please reboot to enable UWF"
    set is_check_state=true
)