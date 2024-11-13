#!/bin/bash
if ! [ -d $1 ]; then
echo 'No directory'
exit 0
fi
mkdir $1/$2
mkdir $1/$2/src
mkdir  $1/$2/src/scripts
mkdir $1/$2/src/styles
mkdir $1/$2/src/images
touch $1/$2/README.md
touch $1/$2/gitignore
echo "Используется для вывода текста и изображений" >> $1/$2/README.md
echo "Проект $2 создался в дирректории $1"
exit 0
