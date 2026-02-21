#!/bin/bash
NUMBER=999
if [ $1 -gt $NUMBER ]; then
    echo "$1 is greater than $NUMBER"
elif [ $1 -lt $NUMBER ]; then
    echo "$1 is smaller than $NUMBER"
else
    echo "Ented number $1 is same as comparision number $NUMBER"

fi