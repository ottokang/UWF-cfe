rem Uninstall UWF

cls
echo %magenta%%LANG_uninstall_uwf_message%%reset_color%
echo:
DISM /Online /Disable-Feature /FeatureName:client-UnifiedWriteFilter
echo:

set "message=%LANG_uninstall_uwf_complete%"
set "check_state_required=true"
pause