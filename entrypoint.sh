#!/bin/bash

if [[ ! -z "${INPUT_FILE_NAME}" ]]; then
  DIR=`dirname $INPUT_FILE_NAME`
  mkdir -p $DIR
else
  echo "No file parameter set... exiting..."
  exit -1
fi

if [[ -z "${INPUT_FILE_BASE64}" ]]; then
  echo "Using INPUT_FILE_DATA to write to $INPUT_FILE_NAME"
  echo $INPUT_FILE_DATA > "$INPUT_FILE_NAME"
else
  echo "Using INPUT_FILE_BASE64 to write to $INPUT_FILE_NAME"
  echo $INPUT_FILE_BASE64 | base64 --decode > $INPUT_FILE_NAME
fi
# When run as docker, it's not immediately accessible 
chmod 644 $INPUT_FILE_NAME
