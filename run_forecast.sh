#!/bin/bash
#
# Runs the forecast with a given forecast-id.
# Forecast must already be created, for example
# by running create_forecast.sh.

if [ $# -lt 2 ]; then
    echo "Usage: ./run_forecast.sh <forecast-id> <output-interval>"
    exit 1
fi

source set-env.sh

forecast_id=$1
output_interval=$2
url=${CLOUDRUN_API_URL}/run-forecast/$forecast_id

curl -X POST $url -H "${CLOUDRUN_AUTH_HEADER}" \
     -F "output_interval=${output_interval}"
