#!/usr/bin/env sh

printf "$@" | \
    awk '{gsub("  ~  ","\n\n", $0); print}' | \
    awk '{sub("#  ","", $0); print}'
