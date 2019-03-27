#!/bin/bash

# touch markdown file

if [ -f ./$1.md ]; then
    echo "./$1.md already exist!"
else
    echo "touch the $1.md"
    echo $1 >> ./$1.md
fi
