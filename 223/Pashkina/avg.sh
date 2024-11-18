#!/bin/bash
#@copyright https://github.com/MurlyYufrau

if [ "$#" -lt 2 ]; then
    echo "Укажите как минимум два числа"
else
    sum=0
    suitableValueCount=0
    index=0
    regExp='^[+-]?[0-9]+\.?[0-9]*$'

    for input in "$@"; do
        if [[ ! $input =~ $regExp ]]; then
            echo "Переменная $index - не число."
        else
            suitableValueCount=$((suitableValueCount + 1))
            sum=$((sum + $input))
        fi
        index=$((index + 1))
    done
    if [ $suitableValueCount -lt 1 ]; then
        echo "Не достаточно подходящих чисел для расчёта"
    else
        avg=$(echo "scale=2; $sum / $suitableValueCount" | bc)
      echo "Среднее значение $suitableValueCount элементов: $avg"  
    fi
fi
    
