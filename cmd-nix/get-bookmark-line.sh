#!/usr/bin/env sh
var="$(cat $1 | fzf --multi --no-hscroll --cycle --layout="$2" --preview-window="$3" --preview="./cmd-nix/preview-fzf.sh {}")"
echo "$var"
