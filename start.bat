@echo off
if exist .\win-dep-bin\lua\lua.exe set PATH=.\win-dep-bin\lua;%PATH%
if exist "%1" lua .\main.lua "%1" else lua .\main.lua
