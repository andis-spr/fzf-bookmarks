#!/usr/bin/env sh
url="$(printf "$1" | awk -F "  ~  " '{print $2}')"
printf "$url"
