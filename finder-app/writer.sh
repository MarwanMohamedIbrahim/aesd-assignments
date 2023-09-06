#!/bin/sh

if [ $# -lt 2 ]; then
    echo "Error: Arguments above were not specified!
    [First argument must include full path to a file (including filename) and 
    second argument is the text string which will be written within this file]"
    exit 1
fi

writefile=$1
writestr=$2
Dir=$(dirname "$writefile")

if [ -f "$Dir" ]; then
    echo ${writestr} >"$writefile"
fi

if [ ! -d "$Dir" ]; then
    mkdir -p "$Dir" && echo ${writestr} >"$writefile"
else
    echo ${writestr} >"$writefile"
fi
if [ $? -eq 0 ]; then
    echo "$writefile is created containig $writestr"
else
    echo Error!
    exit 1
fi
