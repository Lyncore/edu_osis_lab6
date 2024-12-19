#!/bin/bash


if [ "$#" -ne 3 ]; then

    echo "Использование: $0 число1 число2 операция"

    exit 1

fi


NUM1=$1

NUM2=$2

OPERATION=$3


case $OPERATION in

    +)

        echo "$((NUM1 + NUM2))"

        ;;

    -)

        echo "$((NUM1 - NUM2))"

        ;;

    \*)

        echo "$((NUM1 * NUM2))"

        ;;

    /)

        if [ "$NUM2" -eq 0 ]; then

            echo "Ошибка: Деление на ноль."

        else

            echo "$((NUM1 / NUM2))"

        fi

        ;;

    *)

        echo "Неизвестная операция."

        ;;

esac
