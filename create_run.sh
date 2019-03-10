#!/bin/bash
#
# Creates a new WRF run.

if [ $# -eq 0 ]; then
    echo "Usage: ./create_run.sh <version-number>"
    echo "Example: ./create_run.sh 3.9.1"
    exit 1
fi

source set-env.sh

version=$1
url=${CLOUDRUN_API_URL}/runs

curl -X POST $url -H "${CLOUDRUN_AUTH_HEADER}" \
     -F "user_id=${CLOUDRUN_API_USER_ID}" \
     -F "model=wrf" \
     -F "version=${version}"
