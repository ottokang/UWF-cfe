rem Install UWF

cls
echo %cyan%Install UWF, please wait...%reset_color%
echo:

DISM /Online /Enable-Feature /FeatureName:client-UnifiedWriteFilter /All
echo:

set message="Install UWF complete"
set require_check_state=true
pause