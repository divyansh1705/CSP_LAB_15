

set terminal png size 800,600
set output 'gender_heart_disease_histogram.png'

set title "Gender vs Number of People with Heart Disease"
set style data histograms
set style fill solid 0.6 border -1
set boxwidth 0.5

set ylabel "Number of People"
set xlabel "Gender"

plot "gender_heart_disease.dat" using 2:xtic(1) title "Heart Disease Count" lc rgb "blue"

unset output

