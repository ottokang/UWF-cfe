rem Check if Windows edition is Enterprise, IoT Enterprise, or Education
set "edition_id="
set "product_name="
for /f "tokens=2,*" %%A in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "EditionID" 2^>nul ^| findstr /i "EditionID"') do (set "edition_id=%%B")
for /f "tokens=2,*" %%A in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "ProductName" 2^>nul ^| findstr /i "ProductName"') do (set "product_name=%%B")

if not defined edition_id set "edition_id=Unknown"
if not defined product_name set "product_name=Unknown"

set "can_use_uwf=0"
echo "%edition_id%" | findstr /i "Enterprise Education" >nul && set "can_use_uwf=1"
echo "%product_name%" | findstr /i "Enterprise Education" >nul && set "can_use_uwf=1"
where uwfmgr >nul 2>&1 && set "can_use_uwf=1"

if %can_use_uwf%==0 (
    echo:
    echo %yellow%%LANG_requirement_warn%%reset_color%
    echo:
    echo %LANG_requirement_detected%%cyan%%product_name%%reset_color% ^(%edition_id%^)
    echo:
    choice /c yn /n /m "%LANG_continue_ignore_requirement%"
    if errorlevel 2 (
        echo:
        pause
        exit
    )
)

exit /b 0
