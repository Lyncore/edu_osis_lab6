sum=0
count=0

for arg in "$@"; do
    if [[ "$arg" =~ ^-?[0-9]+$ ]]; then
        sum=$((sum + arg))
        count=$((count + 1))
    fi
done

if [ "$count" -eq 0 ]; then
    echo "Нет допустимых числовых аргументов."
else
    avg=$(echo "scale=2; $sum / $count" | bc)
    echo "Среднее значение: $avg"
fi
