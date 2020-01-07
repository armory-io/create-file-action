#!/bin/bash

if [[ ! -z "${FILE_NAME}" ]]; then
  DIR=`dirname $FILE_NAME`
  mkdir -p $DIR
else
  echo "No file parameter set... exiting..."
  exit -1
fi

if [[ -z "${FILE_BASE64}" ]]; then
  echo "Using FILE_DATA to write to $FILE_NAME"
  echo $FILE_DATA > "$FILE_NAME"
else
  echo "Using FILE_BASE64 to write to $FILE_NAME"
  echo $FILE_BASE64 | base64 --decode > $FILE_NAME
fi
