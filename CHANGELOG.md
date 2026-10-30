# Changelog

## [1.0.4] - 2026.10.30

* Add option to launch UWF-cfe immediately upon installation completion in NSIS installer
* Enhance Windows edition detection (support IoT Enterprise & Education) with option to bypass warnings
* Silence harmless error messages (2>nul) during startup status check

## [1.0.3] - 2026.10.06

* Add real-time overlay consumption and available space monitoring
* Modernize WMI queries by replacing deprecated Get-WmiObject with Get-CimInstance
* Improve Windows Terminal (wt.exe) presence detection and administrator elevation check
* Modernize and refine Simplified Chinese (zh-CN) translations
* Fix uninstaller registry path and clean up duplicate registry deletions in NSIS
* Fix check_state_required variable typo in enable/disable scripts

## [1.0.2] - 2026.06.25

* Support multi-language: en-US, zh-TW, zh-CN
* Automatically elevate privileges and prefer running inside Windows Terminal (wt.exe) when available

## [1.0.1] - 2025.12.13

* Support Windows Education edition detection

## [1.0.0] - 2025.12.12

* Initial release.
