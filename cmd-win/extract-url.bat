@echo off
if exist .\dep-bin-win\awk\awk.exe set PATH=.\dep-bin-win\awk;%PATH%
printf %1 | awk -F "  ~  " "{print $2}"
