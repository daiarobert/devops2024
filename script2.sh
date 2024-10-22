#!/bin/bash

arr=("$@")

echo "Array elements: "

# Add space after '[' and before ']'
if [ "${#arr[@]}" -lt 3 ]; then
   echo "Error: need more than 3 items"
else
    sum=0
    count=0
    for element in "${arr[@]}"
    do
        sum=$((sum + element))
        count=$((count + 1))
    done

    echo "Suma este: $sum"
    media=$(($sum / $count))
    echo "Media este: $media"

fi
