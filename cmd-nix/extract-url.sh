#!/usr/bin/env sh
url="$(echo "$1" | awk -F "  -  " '{print $2}')"
echo "$url"
