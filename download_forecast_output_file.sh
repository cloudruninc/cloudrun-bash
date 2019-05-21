#!/bin/bash
#
# Downloads an output file associated with a forecast
# made by Cloudrun Forecast Wizard.

if [ $# -lt 2 ]; then
    echo "Usage: ./download_forecast_output_file.sh <forecast-id> <filename>"
    exit 1
fi

source set-env.sh

run_id=$1
file=$2
url=${CLOUDRUN_API_URL}/forecasts/${run_id}/outputs/$file

curl $url -H "${CLOUDRUN_AUTH_HEADER}" --output $file
