#!/bin/bash
#
# Gets the forecast metadata in JSON format.

if [ $# -eq 0 ]; then
    echo "Usage: ./get_forecast.sh <run-id>"
    exit 1
fi

source set-env.sh

run_id=$1
url=${CLOUDRUN_API_URL}/forecasts/$run_id

curl $url -H "${CLOUDRUN_AUTH_HEADER}"
