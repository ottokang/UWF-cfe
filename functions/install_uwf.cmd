rem Install UWF

cls
echo %cyan%%LANG_install_uwf_message%%reset_color%
echo:
DISM /Online /Enable-Feature /FeatureName:client-UnifiedWriteFilter /All
echo:

set "message=%LANG_install_uwf_complete%"
set "check_state_required=true"
pause