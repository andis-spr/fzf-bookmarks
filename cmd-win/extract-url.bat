@echo off
if exist .\dependencies-win\awk\awk.exe set PATH=.\dependencies-win\awk;%PATH%
echo %1 | awk -F "  ~  " "{print $2}"
