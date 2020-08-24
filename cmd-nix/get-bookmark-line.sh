#!/usr/bin/env sh

if [ "$4" = "true" ]
then
    var="$( cat $1 | \
            sed -n "/^\#\s\s/p" | \
            sed "s/\#\s\s//g" | fzf  \
                --multi \
                --no-hscroll \
                --cycle \
                --layout="$2" \
                --preview-window="$3" \
                --preview="$(dirname "$0")/preview-fzf.sh {}" )"
else
    var="$( cat $1 | \
            sed -n "/^\#\s\s/p" | \
            sed "s/\#\s\s//g" | fzf  \
                --multi \
                --no-hscroll \
                --cycle \
                --layout="$2" )"
fi

printf "$var"
