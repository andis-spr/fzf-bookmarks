#!/usr/bin/env sh
echo "$@" | sed "s/\s\s-\s\s/\n\n/g" | sed "s/\s\s\#\s\s//g"
