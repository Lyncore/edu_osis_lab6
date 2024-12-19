#!/bin/bash
if [ -z "$1" ]; then
    echo "Укажите имя пользователя."
    exit 1
fi
home_dir=$(getent passwd "$1" | cut -d: -f6)
if [ -z "$home_dir" ]; then
    echo "Пользователь не найден."
else
    echo "Домашняя директория: $home_dir"
fi
