#!/bin/bash
#@copyright https://github.com/MurlyYufrau

creategitignore() {
    filename="$1/.gitignore"
    touch "$filename"
}

createreadmy() {
    filename="$1/README.md"
    text="Обзор: программа автоматически создает файловую структуру проекта с указаным названием и директорией.\nАргументы: 1 - имя проекта, 2 - директория (опционально, по умолчанию - текущая деректория расположения файла с программой)"

    echo -e "${text}" > "$filename"
}

createprojectstructure() {
    rootpath="$2/$1"

    declare -a dirarrayrepository=( "src" "src/images" "src/scripts" "src/styles")

    for dir in "${dirarrayrepository[@]}"; do
        fullpath="$rootpath/$dir"

        mkdir -p "$fullpath"
        if [ "$?" != 0 ]; then
            return 1
        fi
    done
    
    creategitignore "$rootpath"
    createreadmy "$rootpath"

    return 0
}

if [[ "$#" < 1 || "$#" > 2 ]]; then
    echo "Укажите имя проекта и директорию (опционально)."
else
    projectname="$1"
    dirpath="$2"

    if [ -z "$dirpath" ]; then
        dirpath=$(dirname "$0")
    fi

    echo "Проект '$projectname' будет создан по пути: '$dirpath'."

    createprojectstructure "$projectname" "$dirpath"

    if [ $? == 0 ]; then
        echo "Структура проекта успешно создана."
    else
        echo "Во время создании структуры проекта произошла ошибка (Код $?)."
    fi
fi
