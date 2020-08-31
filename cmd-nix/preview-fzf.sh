#!/usr/bin/env sh

printf "$@" | \
    awk '{with_nl=gsub("  ~  ","\n\n", $0); without_pre=sub("#  ","", with_nl); print $without_pre}'
