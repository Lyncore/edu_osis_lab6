#!/bin/bash

USER="\$1"

if [ -z "$USER" ]; then
  echo "Укажите имя пользователя."
  exit 1
fi

HOMEDIR=$(grep "^$USER:" /etc/passwd | cut -d: -f6)

if [ -z "$HOMEDIR" ]; then
  echo "Пользователь '$USER' не найден."
else
  echo "Домашняя директория пользователя '$USER': $HOMEDIR"
fi
