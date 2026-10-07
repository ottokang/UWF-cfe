rem Check if UWF is installed
set "uwf_install_state=null"
for /f "tokens=* USEBACKQ" %%F IN (`where /F uwfmgr 2^>nul ^| find /C "uwfmgr"`) do (set "uwf_install_state=%%F")

if "%uwf_install_state%"=="1" (
    set "is_uwf_installed=true"
) else (
    set "is_uwf_installed=false"
)

rem Check if UWF is enabled & get overlay consumption
set "overlay_consumption=0"
set "overlay_available=0"
if "%is_uwf_installed%"=="true" (
    for /F "usebackq tokens=1,2,3 delims=," %%i in (`powershell -NoProfile -Command "try { $f=(Get-CimInstance -Namespace 'root\standardcimv2\embedded' -ClassName UWF_Filter -ErrorAction Stop).CurrentEnabled; if ($f) { $o=Get-CimInstance -Namespace 'root\standardcimv2\embedded' -ClassName UWF_Overlay -ErrorAction Stop; Write-Output ('true,' + [int]$o.OverlayConsumption + ',' + [int]$o.AvailableSpace) } else { Write-Output 'false,0,0' } } catch { Write-Output 'false,0,0' }" 2^>nul` ) do (
        set "is_uwf_enabled=%%i"
        set "overlay_consumption=%%j"
        set "overlay_available=%%k"
    )
)

rem Check if Windows Update is enabled via registry
set "wu_state=null"
for /f "tokens=* USEBACKQ" %%F IN (`reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate 2^>nul ^| find /c "0x1"`) do (set "wu_state=%%F")

if "%wu_state%"=="0" (
    set "is_wu_enabled=true"
) else (
    set "is_wu_enabled=false"
)

rem Check if Fast Startup is enabled
set "fast_startup_state=null"
for /f "tokens=* USEBACKQ" %%F IN (`reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled 2^>nul ^| find /c "0x1"`) do (set "fast_startup_state=%%F")

if "%fast_startup_state%"=="1" (
    set "is_fast_startup_enabled=true"
) else (
    set "is_fast_startup_enabled=false"
)