rem Check is UWF installed
set uwf_install_state=null
for /f "tokens=* USEBACKQ" %%F IN (`where /F  uwfmgr ^| find /C "uwfmgr"`) do (set uwf_install_state=%%F)

if "%uwf_install_state%"=="1" (
    set is_uwf_installed=true
) else (
    set is_uwf_installed=false
)

rem Check UWF is enabled
if "%is_uwf_installed%"=="true" (
    for /F "usebackq delims=" %%i in (`powershell -NoProfile -Command "(Get-WmiObject -Namespace 'root\standardcimv2\embedded' -Class UWF_Filter).CurrentEnabled.toString().toLower()"`) do (
        set is_uwf_enabled=%%i
    )
)

rem Check Windows Update is enabled by registry
set wu_state=null
for /f "tokens=* USEBACKQ" %%F IN (`reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate ^| find /c "0x1"`) do (set wu_state=%%F)

if "%wu_state%"=="0" (
    set is_wu_enabled=true
) else (
    set is_wu_enabled=false
)

rem Check Fast Startup is enabled
set fast_startup_state=null
for /f "tokens=* USEBACKQ" %%F IN (`reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled ^| find /c "0x1"`) do (set fast_startup_state=%%F)

if "%fast_startup_state%"=="1" (
    set is_fast_startup_enabled=true
) else (
    set is_fast_startup_enabled=false
)