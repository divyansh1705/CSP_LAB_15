# Define age group values
age40_50 = 50
age50_60 = 65
age60_70 = 32
age70_80 = 6

# Calculate total for percentage-based slicing
total = age40_50 + age50_60 + age60_70 + age70_80

# Set up terminal and output file
set terminal png size 600,600
set output 'age_group_pie_chart.png'
set size square
set xrange [-1.2:1.2]
set yrange [-1.2:1.2]

unset border
unset tics
unset key

# Define colors for each age group
color_age40_50 = "#CC0000"    # dark red
color_age50_60 = "#0033CC"    # dark blue
color_age60_70 = "#009900"    # dark green
color_age70_80 = "#CCCC00"    # dark yellow

# Calculate angles for each slice
angle_1 = 360 * age40_50 / total
angle_2 = 360 * age50_60 / total
angle_3 = 360 * age60_70 / total
angle_4 = 360 * age70_80 / total

# Define pie chart segments
set object 1 circle at 0,0 size 1 fillcolor rgb color_age40_50 fillstyle solid 1.0 arc [0:angle_1]
set object 2 circle at 0,0 size 1 fillcolor rgb color_age50_60 fillstyle solid 1.0 arc [angle_1:(angle_1 + angle_2)]
set object 3 circle at 0,0 size 1 fillcolor rgb color_age60_70 fillstyle solid 1.0 arc [(angle_1 + angle_2):(angle_1 + angle_2 + angle_3)]
set object 4 circle at 0,0 size 1 fillcolor rgb color_age70_80 fillstyle solid 1.0 arc [(angle_1 + angle_2 + angle_3):(angle_1 + angle_2 + angle_3 + angle_4)]

# Add labels for each age group with counts
set label 1 "40-50\n" . age40_50 at -0.8,0.9 tc rgb color_age40_50 font ",10"
set label 2 "50-60\n" . age50_60 at 0.8,0.9 tc rgb color_age50_60 font ",10"
set label 3 "60-70\n" . age60_70 at -1.0,-0.5 tc rgb color_age60_70 font ",10"
set label 4 "70-80\n" . age70_80 at 1.0,-0.5 tc rgb color_age70_80 font ",10"

# Dummy plot to prevent Gnuplot from displaying other data
plot NaN notitle

