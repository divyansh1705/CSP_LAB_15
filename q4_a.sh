#!/bin/bash

input_file="heart.csv"
output_data="gender_heart_disease.dat"

awk -F',' 'NR > 1 { if ($2 == 1 && $14 == 1) male++ } 
                 { if ($2 == 0 && $14 == 1) female++ } 
                 END { print "Male", male; print "Female", female }' $input_file > $output_data

echo "Data prepared for Gnuplot in $output_data."

