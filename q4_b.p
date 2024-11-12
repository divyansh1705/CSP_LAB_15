set terminal png
set output 'ques4b.png'  
set xlabel "Age"  
set datafile separator ','
set ylabel "Blood Pressure"  
set title "Age vs Blood Pressure"  
plot "heart.csv" using 1:4 with points title "Age vs BP"
