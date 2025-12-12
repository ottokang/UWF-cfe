rem Show UWF Settings
cls
echo %cyan%UWF Overlay Settings%reset_color%
echo:
uwfmgr overlay get-config
pause

cls
echo %cyan%UWF Filter Settings%reset_color%
echo:
uwfmgr filter get-config
echo:
pause

cls
echo %cyan%UWF Volume Settings%reset_color%
echo:
uwfmgr volume get-config all
pause