#!/bin/bash
#
# Starts a run. Compute option must have been set 
# via select_compute_option.sh.

if [ $# -lt 2 ]; then
    echo "Usage: ./start_run.sh <run-id>"
    exit 1
fi

source set-env.sh

run_id=$1
url=${CLOUDRUN_API_URL}/runs/${run_id}/start

curl -X POST $url -H "${CLOUDRUN_AUTH_HEADER}"
