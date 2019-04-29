#!/bin/bash
#
# Stops an active run.

if [ $# -lt 1 ]; then
    echo "Usage: ./stop_run.sh <run-id>"
    exit 1
fi

source set-env.sh

run_id=$1
url=${CLOUDRUN_API_URL}/runs/${run_id}/stop

curl -X POST $url -H "${CLOUDRUN_AUTH_HEADER}"
