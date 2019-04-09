#!/bin/bash
#
# Downloads an output file associated with a run.

if [ $# -lt 2 ]; then
    echo "Usage: ./download_output_file.sh <run-id> <filename>"
    exit 1
fi

source set-env.sh

run_id=$1
file=$2
url=${CLOUDRUN_API_URL}/runs/${run_id}/output/$file

curl $url -H "${CLOUDRUN_AUTH_HEADER}" --output $file
