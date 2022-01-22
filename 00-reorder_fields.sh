#!/usr/bin/env bash
# reorder the fields order in names.txt. Displays reverse order. $2 second field, $1 first field

awk '{print $2, $1}' names.txt

