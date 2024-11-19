#!/bin/bash
#@copyright https://github.com/MurlyYufrau

if [ "$#" != 1 ]; then
    echo "Укажите путь к директории"
else
    dir=$@
    if [ -d "$dir" ]; then
        echo "Директория по указаному пути уже существует"
    else
        mkdir -p "$dir"
        if [ "$?" = 0 ]; then
            echo "Директория по указонаму пути успешно создана."
        else
            "Во время создании директории произошла ошибка. Не достаточно прав на выполнение операции"
        fi
    fi
fi
    
