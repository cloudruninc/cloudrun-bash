#!/bin/bash
#
# Uploads an input file to the run.

if [ $# -lt 2 ]; then
    echo "Usage: ./upload_input_file.sh <run-id> <filename>"
    exit 1
fi

source set-env.sh

run_id=$1
filename=$2
url=${CLOUDRUN_API_URL}/runs/${run_id}/input

curl -X POST $url -H "${CLOUDRUN_AUTH_HEADER}" \
     -H "Origin: https://cloudrun.co" \
     -F "file=@${filename}"
