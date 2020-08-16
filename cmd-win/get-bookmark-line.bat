@echo off
if exist .\dep-bin-win\fzf\fzf.exe set PATH=.\dep-bin-win\fzf;%PATH%
if exist .\dep-bin-win\cat\cat.exe set PATH=.\dep-bin-win\cat;%PATH%
cat "%1" | fzf --multi --no-hscroll --cycle --layout="%2" --preview-window="%3" --preview="%~dp0\\preview-fzf {}"