#!/bin/bash

#
if["$#" -ne 3]; then
exit 1
fi

num 1 = "$1"
num2 = "$2"
operation = "$3"

#
case "$operation" in
+)
result = $((num1 + num2)) ;;
-)
result = $((num1 - num2)) ;;
*)
result = $((num1 * num2 )) ;;
/)
if["num2" -eq 0]; then
echo "Ошибка. Деление на ноль."
exit 1
fi
result = $((num1 / num2)) ;;
*)
echo "Неизвестная операция." ;;
esac

echo "Результат: $result"
