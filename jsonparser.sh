#! /bin/bash

identify() {
    if [ $1 == '{' ]
    then
        echo "yes";
    elif [ $1 == '}' ]
    then
        echo "maybe";
    fi
}

while read -n1 c; do
    identify $c
done < test1.json