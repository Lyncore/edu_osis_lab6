#!/bin/bash
if [ $# -eq 1 ]; then
dir="$PWD/$1"
mkdir -p $dir/src $dir/src/styles $dir/src/images
echo "Используется для вывода текста и изображений" > $dir/README.md
touch $dir/gitignore
fi
if [ $# -eq 2 ]; then
dir="$2/$1"
mkdir -p $dir/src $dir/src/styles $dir/src/images
echo "Используется для вывода текста и изображений" > $dir/README.md
touch $dir/gitignore
fi
echo "Проект создан"
exit 0
