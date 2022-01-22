#!/usr/bin/env bash
# match and print message with output

awk '/Great/{print "GREAT:", NF, $0} /you/{print "YOU:", NF, $0}' feaw_greatnesses.txt

