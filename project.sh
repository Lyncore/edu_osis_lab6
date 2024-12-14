#!/bin/bash
if [-lt 1 "$#"]; then
echo "Использование скрипта: $0 <Имя проекта> [директория]"
read -p "Введите название для проекта: " name_project
read -p "Введите путь к директории (оставьте пустым для текущей): " dir
else
name_project = $1
dir=${2:-.}
fi

project_path="$dir/$name_project"

mkdir -p $project_path/src/scripts $project_path/src/styles $project_path/src/images

touch $project_path/.README.md
touch $project_path/.gitignore

echo "Проект '$name_project' успешно создан в директории: $project_path"
exit 0
