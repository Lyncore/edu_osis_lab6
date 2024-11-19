#!/bin/sh


if [[ $1 ]]; then
  if [[ $1 != "root" ]]; then
    getent passwd $1
    ls -l /home/$1
  else
    echo "User is root"
    exit 1
  fi
else
  echo "Enter the username after script"
fi

