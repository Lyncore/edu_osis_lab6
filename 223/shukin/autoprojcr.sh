#!/bin/bash

path=""

#Проверка введено ли название проекта
if [ -z "$1" ]
then
  echo "Введите название проекта."
  exit 1
fi

#Определение пути
if [ -z "$2" ]
then
  path="$1"
else 
  path="$PWD/$2/$1"
fi

#Проверка существует ли такое название проекта
if [ -d "$path" ]
then
  echo "Проект с таким именем уже существует."
  exit 1
fi

#Создание папок и файлов
mkdir -p $path/src/scripts $path/src/styles $path/src/images
touch $path/README.md $path/.gitignore
echo "Скопировать репозиторий при помощи команды git clone https://github.com/Spets229/edu_osis_lab6.git" >> $path/README.md

echo "Проект $1 успешно создан."
exit 0
