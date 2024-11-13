#!/bin/bash

if [ -z "$1" ]
then
  echo "Введите название проекта."
  exit 0
fi

if [ -d "$1" ] && [ -z "$2" ]
then
  echo "Проект с таким именем уже существует."
  exit 0
fi

if [ -z "$2" ]
then
  mkdir -p "$1"/src/scripts "$1"/src/styles "$1"/src/images
  touch "$1"/README.md "$1"/.gitignore
  echo "Скопировать репозиторий при помощи команды git clone https://github.com/Spets229/edu_osis_lab6.git" >> "$1"/README.md
else 
  mkdir -p "$PWD"/"$2"/"$1"/src/scripts "$PWD"/"$2"/"$1"/src/styles "$PWD"/"$2"/"$1"/src/images 
  touch "$PWD"/"$2"/"$1"/README.md "$PWD"/"$2"/"$1"/.gitignore 
  echo "Скопировать репозиторий при помощи команды git clone https://github.com/Spets229/edu_osis_lab6.git" >> "$PWD"/"$2"/"$1"/README.md
fi

echo "Проект $1 успешно создан."
exit 0
