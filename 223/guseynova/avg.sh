#!/bin/bash

#Проверка передачи аргументов
if["$#" -eq 0 ]; then
exit 1
fi

sum = 0
count = 0

#Цикл для аргументов
for num in "$@"; do
sum = $(("$sum" + "$num" | bc))
count = $((count + 1))
done

#Вычисление среднего значения
avg_result = $(echo "scale=2; $sum / $count" | bc)

echo "Результат: $avg_result"
