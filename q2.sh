#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <input_csv_file>"
    exit 1
fi

input_file="$1"
output_tex="heart_data_table.tex"

column_count=$(head -n 1 "$input_file" | awk -F, '{print NF}')

echo "\\documentclass{article}" > $output_tex
echo "\\usepackage{graphicx}" >> $output_tex
echo "\\begin{document}" >> $output_tex
echo "\\section*{Heart Disease Data Table}" >> $output_tex

echo "\\begin{tabular}{" >> $output_tex
for ((i=1; i<=column_count; i++)); do
    echo -n "|c" >> $output_tex
done
echo "|}" >> $output_tex
echo "\\hline" >> $output_tex

header=$(head -n 1 "$input_file" | tr ',' '&')
echo "$header \\\\" >> $output_tex
echo "\\hline" >> $output_tex

tail -n +2 "$input_file" | while IFS=, read -r line; do
    echo "$line" | tr ',' '&' | sed 's/$/ \\\\/' >> $output_tex
    echo "\\hline" >> $output_tex
done

echo "\\end{tabular}" >> $output_tex
echo "\\end{document}" >> $output_tex

echo "LaTeX file generated: $output_tex"
