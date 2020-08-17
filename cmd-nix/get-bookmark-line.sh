#!/usr/bin/env sh
if [ "$4" = "true" ]; then
    var="$(cat $1 | sed -n "/^\#\s\s/p" | fzf --multi --no-hscroll --cycle --layout="$2" --preview-window="$3" --preview="./cmd-nix/preview-fzf.sh {}")"
else
    var="$(cat $1 | sed -n "/^\#\s\s/p" | fzf --multi --no-hscroll --cycle --layout="$2")"
fi
echo "$var"
