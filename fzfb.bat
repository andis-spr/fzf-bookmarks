@echo off
if exist .\win-dep-bin\lua\lua.exe set PATH=.\win-dep-bin\lua;%PATH%
if "%1"=="" (lua .\main.lua) else (lua .\main.lua "%1")
