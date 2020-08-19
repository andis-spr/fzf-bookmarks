@echo off
if exist .\dependencies-win\sed\sed.exe set PATH=.\dependencies-win\sed;%PATH%
printf %* | sed "s/\s\s~\s\s/\n\n/g" | sed "s/\#\s\s//g"
