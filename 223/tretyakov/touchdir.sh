#!/bin/sh
if [[ $1 ]]; then
  if [ -d "$1" ]; then
    mkdir $1
  else 
    echo "$1 does not exist"
    exit 1
  fi
else
  echo "Enter the directory name after script"
fi
