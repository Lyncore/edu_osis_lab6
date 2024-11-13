#!/bin/bash
if [ $# -eq 1 ]; then
mkdir $PWD/$1
mkdir $PWD/$1/src
mkdir  $PWD/$1/src/scripts
mkdir $PWD/$1/src/styles
mkdir $PWD/$1/src/images
touch $PWD/$1/README.md
touch $PWD/$1/gitignore
echo "Используется для вывода текста и изображений" >> $PWD/$1/README.md
fi
if [ $# -eq 2 ]; then
mkdir $2/$1
mkdir $2/$1/src
mkdir  $2/$1/src/scripts
mkdir $2/$1/src/styles
mkdir $2/$1/src/images
touch $2/$1/README.md
touch $2/$1/.gitignore
echo "Используется для вывода текста и изображений" >> $2/$1/README.md
fi
echo "Проект создан"
exit 0
