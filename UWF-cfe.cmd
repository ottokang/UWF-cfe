rem Set echo off, root path, UTF-8 encoding, setlocal, enable delayed expansion
echo off
cd /D "%~dp0"
chcp 65001 > nul
setlocal enabledelayedexpansion

rem Load color, initial variables
call ".\functions\colors.cmd"
set message=null
set require_check_state=true
set is_uwf_installed=false
set is_uwf_enabled=false
set is_wu_enabled=true
set is_fast_startup_enabled=true

rem Set const
set _VERSION_=1.0.0

rem Check if Windows is enterprise edition
call ".\functions\is_enterprise.cmd"

rem MAIN
:MAIN

rem Is require check state
if %require_check_state%==true (
    call ".\functions\check_state.cmd"
)

cls
echo:
echo %cyan%%bold%^< UWF-cfe ^>%reset_color%    v%_VERSION_%
echo:

rem Show message
if %message%==null (
    echo:
) else (
    echo %magenta_strong%  %message:~1,-1%  %reset_color%
)

rem UWF install state
if %is_uwf_installed%==true (
    set uwf_install_obj=[PSCustomObject]@{Name='UWF'.PadRight^(20^);State='%green_strong% Installed %reset_color%'}
) else (
    set uwf_install_obj=[PSCustomObject]@{Name='UWF'.PadRight^(20^);State='%red_strong% Not Install %reset_color%'}
)

rem UWF enabled state
if %is_uwf_enabled%==true (
    set uwf_enable_obj=[PSCustomObject]@{Name='UWF Filter'.PadRight^(20^);State='%green_strong% Enabled %reset_color%'}
) else (
    set uwf_enable_obj=[PSCustomObject]@{Name='UWF Filter'.PadRight^(20^);State='%red_strong% Disabled %reset_color%'}
)

rem Windows Update state
if %is_wu_enabled%==true (
    set wu_state_obj=[PSCustomObject]@{Name='Windows Update'.PadRight^(20^);State='%green_strong% Enabled %reset_color%'}
) else (
    set wu_state_obj=[PSCustomObject]@{Name='Windows Update'.PadRight^(20^);State='%red_strong% Disabled %reset_color%'}
)

rem Fast Startup state
if %is_fast_startup_enabled%==true (
    set fs_state_obj=[PSCustomObject]@{Name='Fast Startup'.PadRight^(20^);State='%green_strong% Enabled %reset_color%'}
) else (
    set fs_state_obj=[PSCustomObject]@{Name='Fast Startup'.PadRight^(20^);State='%red_strong% Disabled %reset_color%'}
)

rem Print state table by PowerShell
set empty_line=[PSCustomObject]@{Name='';State=''}
powershell -Command "$data = @(%uwf_install_obj%, %empty_line%, %uwf_enable_obj%, %empty_line%, %wu_state_obj%, %empty_line%, %fs_state_obj%); $data | Format-Table Name,State -HideTableHeaders -AutoSize"

rem Menu
if %is_uwf_enabled%==false (
    if %is_uwf_installed%==true (
        echo     %red_strong% U %reset_color% Uninstall UWF
    ) else (
        echo     %cyan_strong% I %reset_color% Install UWF
    )
) else (
    echo:
)
echo:

if %is_uwf_installed%==true (
    if %is_uwf_enabled%==true (
        echo     %red_strong% D %reset_color% Disable UWF
    ) else (
        echo     %cyan_strong% E %reset_color% Enable UWF
    )
) else (
    echo:
)
echo:
echo:

if %is_uwf_enabled%==false (
    if %is_fast_startup_enabled%==false (
        echo     %yellow_strong% Z %reset_color% Recover Fast Startup
    ) else (
        echo:
    )
) else (
    echo:
)
echo:

if %is_uwf_installed%==true (
    echo     %white_strong% S %reset_color% Show UWF Settings
) else (
    echo:
)
echo:

echo     %magenta_strong% Q %reset_color% Quit
echo:

choice /c iuedzs0q /n /m "Please choose command:"
if %ERRORLEVEL%==1 goto INSTALL_UWF
if %ERRORLEVEL%==2 goto UNINSTALL_UWF
if %ERRORLEVEL%==3 goto ENABLE_UWF
if %ERRORLEVEL%==4 goto DISABLE_UWF
if %ERRORLEVEL%==5 goto RECOVER_FAST_STARTUP
if %ERRORLEVEL%==6 goto SHOW_SETTING
if %ERRORLEVEL%==7 goto REFRESH
if %ERRORLEVEL%==8 goto END

rem Install UWF
:INSTALL_UWF
if %is_uwf_installed%==true (
    set message=null
    set require_check_state=false
    goto MAIN
)
echo:

choice /n /m "Do you want continue %cyan_strong% Install UWF %reset_color%? [%green%Y%reset_color%, %red%N%reset_color%]"
if %ERRORLEVEL%==1 (
    call ".\functions\install_uwf.cmd"
) else (
    call ".\functions\no_action.cmd"
)
goto MAIN

rem Uninstall UWF
:UNINSTALL_UWF
if %is_uwf_installed%==false (
    set message=null
    set require_check_state=false
    goto MAIN
)
echo:

choice /n /m "Do you want continue %red_strong% Uninstall UWF %reset_color%? [%green%Y%reset_color%, %red%N%reset_color%]"
if %ERRORLEVEL%==1 (
    call ".\functions\uninstall_uwf.cmd"
) else (
    call ".\functions\no_action.cmd"
)
goto MAIN

rem Enable UWF
:ENABLE_UWF
if %is_uwf_installed%==false goto PASS_ENABLE_UWF
if %is_uwf_enabled%==true goto PASS_ENABLE_UWF
goto CONTINUE_ENABLE_UWF

:PASS_ENABLE_UWF
set message=null
set require_check_state=false
goto MAIN

:CONTINUE_ENABLE_UWF
echo:
choice /n /m "Do you want continue %cyan_strong% Enable UWF %reset_color%? [%green%Y%reset_color%, %red%N%reset_color%]"
if %ERRORLEVEL%==1 (
    call ".\functions\enable_uwf.cmd"
) else (
    call ".\functions\no_action.cmd"
)
goto MAIN

rem Disable UWF
:DISABLE_UWF
if %is_uwf_installed%==false goto PASS_DISABLE_UWF
if %is_uwf_enabled%==false goto PASS_DISABLE_UWF
goto CONTINUE_DISABLE_UWF

:PASS_DISABLE_UWF
set message=null
set require_check_state=false
goto MAIN

:CONTINUE_DISABLE_UWF
echo:
choice /n /m "Do you want continue %red_strong% Disbale UWF %reset_color%? [%green%Y%reset_color%, %red%N%reset_color%]"
if %ERRORLEVEL%==1 (
    call ".\functions\disable_uwf.cmd"
) else (
    call ".\functions\no_action.cmd"
)
goto MAIN

rem Recover Fast Startup
:RECOVER_FAST_STARTUP
if %is_uwf_enabled%==true goto PASS_RECOVER_FAST_STARTUP
if %is_fast_startup_enabled%==true goto PASS_RECOVER_FAST_STARTUP
goto CONTINUE_RECOVER_FAST_STARTUP

:PASS_RECOVER_FAST_STARTUP
set message=null
set require_check_state=false
goto MAIN

:CONTINUE_RECOVER_FAST_STARTUP
echo:
choice /n /m "Do you want continue %yellow_strong% Recover Fast Startup %reset_color%? [%green%Y%reset_color%, %red%N%reset_color%]"
if %ERRORLEVEL%==1 (
    call ".\functions\recover_fast_startup.cmd"
) else (
    call ".\functions\no_action.cmd"
)
goto MAIN

rem Show UWF Settings
:SHOW_SETTING
cls
set message=null
call ".\functions\show_uwf_settings.cmd"
goto MAIN

rem Refresh
:REFRESH
set message=null
set require_check_state=true
goto MAIN

rem END
:END
echo:
choice /n /m "Do you want continue %magenta_strong% Quit UWF %reset_color%? [%green%Y%reset_color%, %red%N%reset_color%]"
if %ERRORLEVEL%==1 (
    exit /B 0
) else (
    call ".\functions\no_action.cmd"
    goto MAIN
)