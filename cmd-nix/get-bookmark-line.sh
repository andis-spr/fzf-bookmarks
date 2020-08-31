#!/usr/bin/env sh

if [ "$4" = "true" ]
then
    var="$( awk '/^#  / {sub("#  ","", $0); print}' $1 | \
            fzf  \
                --multi \
                --no-hscroll \
                --cycle \
                --layout="$2" \
                --preview-window="$3" \
                --preview="$(dirname "$0")/preview-fzf.sh {}" )"
else
    var="$( awk '/^#  / {sub("#  ","", $0); print}' $1 | \
            fzf  \
                --multi \
                --no-hscroll \
                --cycle \
                --layout="$2" )"
fi

printf "$var"
