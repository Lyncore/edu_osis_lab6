#!/bin/bash
if [ -z "$1" ]; then
echo "Укажите имя пользователя."
 exit 1
fi
 
 user_home=$(grep "^$1:" /etc/passwd | -d' :' -f6)
 if [ -n "$user_home" ]; then
  echo "Домашняя директория пользователя $1: $user_home"
 else
  echo "Пользователь $1 не найден."
 fi
