#!/bin/bash

INPUT_FILES="parser/*.in"
printf "Testing parser \n"

for input_file in $INPUT_FILES; do
    output_file=${INPUT_FILES/.in/.out}
    parser/parserize < $input_file | cmp -s $output_file -
    if [ "$?" -eq 0 ]; then
        printf "$input_file \t\t  Success \n"
    else
        printf "$input_file \t\t Error \n"
        exit 1
    fi
done

exit 0
