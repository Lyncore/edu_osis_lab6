#!/bin/bash

log_error() {
  echo "[Ошибка]: $1" >&2
}

set_project_name() {
  if [ -n "$1" ]; then
    project_name=$1
  else
    read -p "Введите название проекта: " project_name
  fi
  project_name="$(echo "$project_name" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' | tr ' ' '_')"

  if [ -z "$project_name" ]; then
    log_error "Имя проекта не может быть пустым."
    exit 1
  fi
}

set_base_dir() {
  if [ -n "$2" ]; then
    base_dir=$2
  else
    read -p "Введите путь к директории (или оставьте пустым для текущей): " base_dir
    base_dir=${base_dir:-$(pwd)}
  fi

  base_dir="${base_dir%/}"
}

create_project_structure() {
  project_path="$base_dir/$project_name"

  if [ -d "$project_path" ]; then
    log_error "Директория '$project_path' уже существует."
    exit 1
  fi

  mkdir -p "$project_path/src/scripts" "$project_path/src/styles" "$project_path/src/images" || {
    log_error "Не удалось создать директорию '$project_path'."
    exit 1
  }

  echo "# $project_name" > "$project_path/README.md"
  echo "node_modules/" >> "$project_path/.gitignore"
  echo "dist/" >> "$project_path/.gitignore"
  echo ".env" >> "$project_path/.gitignore"

  echo "Проект '$project_name' успешно создан в директории '$project_path'."
}

main() {
  set_project_name "$1"
  set_base_dir "$2"
  create_project_structure
  exit 0
}

main "$@"
