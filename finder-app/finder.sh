#!/bin/sh

if [ $# -lt 2 ]; then
    echo "Error: One of the arguments is missing!"
    exit 1
fi
filesdir=$1
searchstr=$2

number_of_files=0

for entry in "$filesdir"/*; do
    number_of_files=$((number_of_files + 1))
done

number_of_matching_lines=$(grep -R ${searchstr} ${filesdir} | wc -l)
echo "The number of files are ${number_of_files} and the number of matching lines are ${number_of_matching_lines}"
