#!/usr/bin/env bash
# print number of fields in each line

awk '{print NF, $0}' feaw_greatnesses.txt
