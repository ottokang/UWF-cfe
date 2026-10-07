rem Detect system locale
for /f "tokens=3" %%a in ('reg query "HKCU\Control Panel\International" /v LocaleName 2^>nul ^| findstr LocaleName') do set locale=%%a

rem If locale file does not exist, use en-US as default
if not exist ".\locales\%locale%.cmd" (
    set "locale=en-US"
)