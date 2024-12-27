if [ "$#" -ne 1 ]; then
    echo "Ошибка: Укажите имя пользователя."
    exit 1
fi

home_dir=$(getent passwd "$1" | cut -d: -f6)

if [ -z "$home_dir" ]; then
    echo "Ошибка: Пользователь '$1' не найден."
else
    echo "Домашняя директория пользователя '$1': $home_dir"
fi
