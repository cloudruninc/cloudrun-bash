#!/bin/bash
#
# Deletes all output files associated with a forecast
# created with the Clodurun Forecast Wizard.

if [ $# -lt 1 ]; then
    echo "Usage: ./delete_forecast_outputs.sh <run-id>"
    exit 1
fi

source set-env.sh

run_id=$1
url=${CLOUDRUN_API_URL}/forecasts/${run_id}/outputs

curl -X DELETE $url -H "${CLOUDRUN_AUTH_HEADER}"
