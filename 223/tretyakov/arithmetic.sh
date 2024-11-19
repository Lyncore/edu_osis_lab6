if [[ "$1" && "$2" && "$3" ]]; then
  if [[ "$2" == "+" ]]; then
    echo $(($1 + $3))
  elif [[ "$2" == "-" ]]; then
    echo $(($1 - $3))
  elif [[ "$2" == ":" ]]; then
    echo $(($1 / $3))
  elif [[ "$2" == "/" ]]; then
    echo $(($1 / $3))
  elif [[ "$2" == "*" ]]; then
    echo $(($1 * $3))
  else
    echo "Evaluation failed"
  fi
else
  echo "Write expression after script"
fi
