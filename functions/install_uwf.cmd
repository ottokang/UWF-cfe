rem Install UWF

cls
echo %cyan%Install UWF, please wait...%reset_color%
echo:

DISM /Online /Enable-Feature /FeatureName:client-UnifiedWriteFilter /All
echo:

set message="Install UWF complete"
set check_state_required=true
pause