#!/bin/bash

#syntax to print text in colors \e[<code>m. Codes from 30 to 37.
#0 resets formatting back to default (so later text isn’t colored)

echo -e "\e[32m Success ! \e[0m"
echo -e "\e[33m Warning ! \e[0m"
echo -e "\e[31m Red ! \e[0m"
echo "no colors"