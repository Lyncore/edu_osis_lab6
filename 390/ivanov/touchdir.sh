#!/bin/bash
if [ -z "$1" ]; then
echo "Укажите директорию"
exit 1
fi

if [ -d "$1" ]; then
echo "Директория $1 уже существует."
else
mkdir - p "$1" 2>/dev/null
if [ $? -eq 0]; then
echo "Директория $1 создана."
else
echo "Не удалось создать директорию $1. Проверьте права."
fi
fi
