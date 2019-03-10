#!/bin/bash
#
# Select a compute option to use with a run.

if [ $# -lt 2 ]; then
    echo "Usage: ./select_compute_option.sh <run-id> <compute-option-id>"
    exit 1
fi

source set-env.sh

run_id=$1
compute_option_id=$2
patch='[{"op":"replace","path":"/selected_compute_option","value":{"compute_option_id":"'${compute_option_id}'"}}]'
url=${CLOUDRUN_API_URL}/runs/$run_id

curl -v -X PATCH $url -H "${CLOUDRUN_AUTH_HEADER}" \
     -H "Content-Type: application/json" \
     -d $patch
