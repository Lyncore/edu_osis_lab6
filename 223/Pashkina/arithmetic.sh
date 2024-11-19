#!/bin/bash
#@copyright https://github.com/MurlyYufrau

if [ "$#" != 3 ]; then
    echo "Укажите два числа и операцию над ними (доступно: +, -, *, /)."
else
    inputA="$1"
    inputB="$2"
    operation="$3"

    regExp='^[+-]?[0-9]+\.?[0-9]*$'

    if [[ ! $inputA =~ $regExp ]]; then
        echo "Переменная 1 - не число."
    elif [[ ! $inputB =~ $regExp ]]; then
        echo "переменная 2 - не число."
    else
        case "$operation" in
            '+') echo "Результат сложения: $(echo "$inputA + $inputB" | bc)" ;;
            '-') echo "Результат вычитания: $(echo "$inputA - $inputB" | bc)" ;;
            '*') echo "Результат умножения: $(echo "$inputA * $inputB" | bc)" ;;
            '/')
                if [ "$inputB" -eq 0 ]; then
                    echo "Неопределеный результат"
                else
                    echo "Результат деления: $(echo "$inputA / $inputB" | bc)" 
                fi;;
            *) echo "Неподдерживаемая операция" ;;        
        esac
    fi
fi
