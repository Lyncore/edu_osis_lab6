if [ "$#" -eq 0 ]; then
    echo "Ошибка: Укажите путь к директории."
    exit 1
fi

for dir in "$@"; do
    if [ -d "$dir" ]; then
        echo "Директория '$dir' уже существует."
    else
        mkdir -p "$dir"
        if [ $? -eq 0 ]; then
            echo "Директория '$dir' успешно создана."
        else
            echo "Ошибка: Не удалось создать директорию '$dir'. Возможно, недостаточно прав."
        fi
    fi
done
