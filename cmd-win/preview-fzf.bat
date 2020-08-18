@echo off
if exist .\dep-bin-win\sed\sed.exe set PATH=.\dep-bin-win\sed;%PATH%
printf %* | sed "s/\s\s~\s\s/\n\n/g" | sed "s/\#\s\s//g"
