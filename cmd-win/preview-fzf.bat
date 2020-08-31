@echo off
if exist .\dependencies-win\awk\awk.exe set PATH=.\dependencies-win\awk;%PATH%
printf %* | awk "{with_nl=gsub(\""\\s\\s~\\s\\s\"",\""\n\n\"", $0); without_pre=sub(\""#\\s\\s\"",\""\"", with_nl); print $without_pre}"
