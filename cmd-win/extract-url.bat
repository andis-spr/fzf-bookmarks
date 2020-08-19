@echo off
if exist .\dependencies-win\awk\awk.exe set PATH=.\dependencies-win\awk;%PATH%
printf %1 | awk -F "  ~  " "{print $2}"
