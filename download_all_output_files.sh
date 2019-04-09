#!/bin/bash
#
# Downloads all output files associated with a run.

if [ $# -eq 0 ]; then
    echo "Usage: ./download_all_output_files.sh <run-id>"
    exit 1
fi

source set-env.sh

run_id=$1

files=$(./get_run.sh $run_id | \
        python3 -c "import sys, json; [print(f['name']) \
    	            for f in json.load(sys.stdin)['output_files']]")

for file in ${files}; do
  echo Downloading ${file}..
  ./download_output_file.sh $run_id $file
done
