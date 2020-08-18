#!/usr/bin/env sh
printf "$@" | sed "s/\s\s~\s\s/\n\n/g" | sed "s/\#\s\s//g"
