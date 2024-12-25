#!/bin/bash

#Проверка передачи параметра
if["$#" -ne 1]; then
echo "Позльзователь: $0"
exit 1
fi

user = "$1"

#Поиск пользователя и вывод домашней директории
home_dir = $(getent passwd "$user" | cut -d: -f6)

#Проверка нахождения директории
if [-z "$home_dir"]; then
echo "Пользователь '$user' не найден"
else
echo "Домашняя директория пользователя '$user': $home_dir"
fi
