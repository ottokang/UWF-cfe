rem Uninstall UWF

cls
echo %magenta%Uninstall UWF, please wait... (Require a reboot to take effect)%reset_color%
echo:

DISM /Online /Disable-Feature /FeatureName:client-UnifiedWriteFilter
echo:

set message="Uninstall UWF complete"
set require_check_state=true
pause