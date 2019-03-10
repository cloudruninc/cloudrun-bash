#!/bin/bash
#
# Downloads all output files associated with a run.

if [ $# -eq 0 ]; then
    echo "Usage: ./download_all_output_files.sh <run-id>"
    exit 1
fi

source set-env.sh

run_id=$1
url=${CLOUDRUN_API_URL}/runs/$run_id

files=$(curl -s ${url} -H "${CLOUDRUN_AUTH_HEADER}" | \
        python3 -c "import sys, json; [print(f['name']) \
    	            for f in json.load(sys.stdin)['output_files']]")

for file in ${files}; do
  echo Downloading ${file}..
  url=${CLOUDRUN_API_URL}/runs/${run_id}/output/$file
  curl $url -H "${CLOUDRUN_AUTH_HEADER}" --output $file
done
