@echo off
if exist .\win-dep-bin\lua\lua.exe set PATH=.\win-dep-bin\lua;%PATH%
lua .\main.lua
