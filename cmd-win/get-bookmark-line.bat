@echo off
if exist .\dependencies-win\fzf\fzf.exe set PATH=.\dependencies-win\fzf;%PATH%
if exist .\dependencies-win\cat\cat.exe set PATH=.\dependencies-win\cat;%PATH%
if "%4"=="true" (cat "%1" | sed -n "/^\#\s\s/p" | sed "s/\#\s\s//g" | fzf --multi --no-hscroll --cycle --layout="%2" --preview-window="%3" --preview="%~dp0\\preview-fzf {}") else (cat "%1" | sed -n "/^\#\s\s/p" | sed "s/\#\s\s//g" | fzf --multi --no-hscroll --cycle --layout="%2")
