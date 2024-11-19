#!/bin/bash
echo "Cant' execute example script"
exit 0
# данный пример демонстрирует возможность создания переиспользуемых конструкций в коде
# задача: написать скрипт, который создаст структуру файлов и папок для нового проекта в выбранной директории. Структура проекта должна содержать следующие элементы:
# .
# ├── project_name
# │   ├── src
# │   │   ├── images
# │   │   ├── scripts
# │   │   └── styles
# │   ├──README.md
# │   └──.gitignore
#
# как не стоит делать:
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

# в данном примере мы дублируем одни и те же команды несколько раз
# как можно оптимизировать решение:

#!/bin/bash
# проверка аргументов
if [ -n "$1" ]; then
  project_name=$1 #берем имя проекта в переменную с осмысленным названием для удобства чтения
else
  # если аргументов нет - справшиваем (check #8)    
  read -p "Введите название проекта: " project_name
  read -p "Введите путь к директории (или оставьте пустым для текущей): " base_dir
fi
# убираем пробелы в начале и конце строки, если они есть, и заменяем пробелы между словами на "_"
project_name="$(echo "$project_name" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' | tr ' ' '_')"
# вывод сообщения, если не удалось получить имя проекта
if [ -z "$project_name" ]; then 
  echo "Не указано имя проекта. Использование скрипта: ./automate.sh ИМЯ_ПРОЕКТА [ПУТЬ_К_ПРОЕКТУ]"
  exit 1
fi
# если путь указан в аргументах - берем его, либо инпут, либо текущую директорию. 
base_dir=${2:-${base_dir:-$(PWD)}}
# убираем слеш в конце, чтоб не мешал
base_dir="${base_dir%/}"
# склеиваем путь
project_path="$base_dir/$project_name" 
# Создаем основную папку проекта и поддиректории
mkdir -p $project_path/src/scripts $project_path/src/styles $project_path/src/images   
# Создаем README.md
echo "# $project_name\n\nИнструкции по использованию проекта." > $project_path/README.md    
# Создаем .gitignore с базовыми правилами
touch $project_path/.gitignore

echo "Проект '$project_name' успешно создан в директории: $project_path"
exit 0
