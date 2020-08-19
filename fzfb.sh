#!/usr/bin/env sh
chmod +x ./cmd-nix/*.sh
if [ $# -eq 0 ]
    then
        lua main.lua
    else 
        lua main.lua $1
fi

