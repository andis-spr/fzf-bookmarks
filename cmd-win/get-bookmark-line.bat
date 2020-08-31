@echo off
if exist .\dependencies-win\fzf\fzf.exe set PATH=.\dependencies-win\fzf;%PATH%
if exist .\dependencies-win\awk\awk.exe set PATH=.\dependencies-win\awk;%PATH%
if "%4"=="true" (awk "/^#\s\s/ {sub(\""#\\s\\s\"",\""\"", $0); print}" "%1" | fzf --multi --no-hscroll --cycle --layout="%2" --preview-window="%3" --preview="%~dp0\\preview-fzf {}") else (awk "/^#\s\s/ {sub(\""#\\s\\s\"",\""\"", $0); print}" "%1" | fzf --multi --no-hscroll --cycle --layout="%2")
