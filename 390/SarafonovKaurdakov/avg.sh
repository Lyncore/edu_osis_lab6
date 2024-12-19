#!/bin/bash

if [ "$#" -eq 0 ]; then
    echo "Не передано ни одного числа."
    exit 1
fi

SUM=0
COUNT=0

for NUM in "$@"; do
    if [[ "$NUM" =~ ^-?[0-9]+([.][0-9]+)?$ ]]; then
        SUM=$(echo "$SUM + $NUM" | bc)
        COUNT=$((COUNT + 1))
    else
        echo "Игнорируется нечисловой аргумент: $NUM"
    fi
done

if [ "$COUNT"
