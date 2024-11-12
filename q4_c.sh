#!/bin/bash
input_file="heart.csv"
output_file="no_heart_disease.csv"
awk -F, '$14 == 0 {print $1 "," $5}' $input_file > $output_file
