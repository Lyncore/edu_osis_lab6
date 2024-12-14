#!/bin/bash

DIRECTORY="\$1"

if [ -z "$DIRECTORY" ]; then
  echo "Укажите путь к директории."
  exit 1
fi

if [ -d "$DIRECTORY" ]; then
  echo "Директория '$DIRECTORY' уже существует."
else
  mkdir -p "$DIRECTORY" 2>/dev/null
  if [ $? -eq 0 ]; then
    echo "Директория '$DIRECTORY' создана."
  else
    echo "Ошибка: Не удалось создать директорию '$DIRECTORY'. Проверьте права доступа."
  fi
fi
