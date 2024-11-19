#!/bin/bash
#@copyright https://github.com/MurlyYufrau

if [ "$#" != 1 ]; then
    echo "Укажите имя пользователя."
else
    userName="$1"
    homeDir=$(getent passwd "$userName" | cut -d: -f 6)
    
    if [ -z "$homeDir" ]; then
        echo "Пользователь не найден."
    else
        echo "Домашняя директория пользователя: $homeDir"
    fi
fi
