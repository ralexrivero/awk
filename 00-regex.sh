#!/usr/bin/env bash
# include regular expresion to aplly action to match expression. Only lines that matches 5 fields
awk 'NF==5{print NF, $0}' feaw_greatnesses.txt

