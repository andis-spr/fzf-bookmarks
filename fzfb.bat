@echo off
if exist %~dp0\win-dep-bin\lua\lua.exe set PATH=%~dp0\win-dep-bin\lua;%PATH%
if "%1"=="" (title fzf-bookmarks) else (title %1)
if "%1"=="" (lua %~dp0\main.lua %~dp0) else (lua %~dp0\main.lua %~dp0 "%1")
