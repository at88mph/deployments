#!/bin/bash

set -e

SELF=skaha-carta

TS=$(date)
echo "$TS $SELF START"

if [ "$#" -ne 3 ]; then
    echo "Usage: skaha-carta <root> <folder> <session url>"
    exit 2
fi

ROOT=$1
FOLDER=$2
URL_PREFIX=$3
echo "root: $ROOT"
echo "folder: $FOLDER"
echo "url_prefix: $URL_PREFIX"
echo "command: carta --no_browser --top_level_folder=$ROOT --port=6901 --idle_timeout=100000 --http_url_prefix=${URL_PREFIX} --debug_no_auth --verbosity=5 $FOLDER"
carta --no_browser --top_level_folder=$ROOT --port=6901 --idle_timeout=100000 --http_url_prefix=${URL_PREFIX} --debug_no_auth --verbosity=5 $FOLDER
# A bit over a day timeout. Disable token authentication.
