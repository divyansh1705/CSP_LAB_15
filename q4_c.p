set terminal png
set output 'ques4c.png'
set xlabel "Age"
set ylabel "Cholesterol"
set title "Age vs Cholesterol (No Heart Disease)"
set datafile separator "," 

plot "no_heart_disease.csv" using 1:2 with linespoints title "Age vs Cholesterol"
