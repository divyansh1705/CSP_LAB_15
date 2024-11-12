#!/bin/bash

# Input CSV file
input_file="heart.csv"
# Output data file for Gnuplot
output_data="age_group_heart_disease_count.dat"

# Initialize counts for each age group
age_40_50=0
age_50_60=0
age_60_70=0
age_70_80=0
age_80_90=0
age_90_100=0

# Process each row (ignoring header) and count based on age groups
awk -F',' 'NR > 1 && $14 == 1 {
    age = $1
    if (age >= 40 && age < 50) age_40_50++
    else if (age >= 50 && age < 60) age_50_60++
    else if (age >= 60 && age < 70) age_60_70++
    else if (age >= 70 && age < 80) age_70_80++
    else if (age >= 80 && age < 90) age_80_90++
    else if (age >= 90 && age <= 100) age_90_100++
}
END {
    print "40-50", age_40_50 > "'"$output_data"'"
    print "50-60", age_50_60 > "'"$output_data"'"
    print "60-70", age_60_70 > "'"$output_data"'"
    print "70-80", age_70_80 > "'"$output_data"'"
    print "80-90", age_80_90 > "'"$output_data"'"
    print "90-100", age_90_100 > "'"$output_data"'"
}' $input_file

echo "Data file with heart disease count by age group generated at $output_data."

