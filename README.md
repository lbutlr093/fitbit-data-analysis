# fitbit-data-analysis
Project to analyze data collected from my fitbit devices over the last few years. The data includes weight, heart rate, workouts, and general daily activity

## visualizations are located in the data_visualization folder

## Steps
1. Downloaded data from the "data export" section of fitbit.com (I only use the categories "activities" and "body")
2. Run the start.sh script to clean, prepare, and create visualizations

## Future work
1. Once fitbit enables exporting of exercise data, download it and create graphs based on it.


## Life cycle of project

| Step             | Current phase                           | Future state                                              |
| :----------------|:----------------------------------------|:----------------------------------------------------------|
| Data Acquisition | manually downloaded from fitbit         | Curl/PHP or another method to automate obtaining data     |
| Preparation      | Python script to split by section       |                                                           |
| Cleaning	   | data_cleanse.R to clean                 |                                                           |
| Visualization    | data_visuals.R		             | visuals to prepare listed below                           |
| Conclusions      |                                         |                                                           |


## TODO
-Getting daily average temp
-Change the 'with open' section of python code: see stack overflow link

-Include some way to get the data from fitbit
-Write script to run (all) python and R scripts

-R script fixes
	-If there are no files in the directory, or minimal files, the all_fitbit_xyz.csv file will be overwritten with only the current data - all previous data will be erased. Create a shell script ASAP to avoid!
	-Do something about the 5 warning messages that appear: 
		In `[<-.factor`(`*tmp*`, ri, value = c(0L, 70L, 251L, 201L, 195L,  :	invalid factor level, NA generated


Analysis/Graphical representation:
	-Skittles post for inspiration
	+graph by day of the week
	+steps by DOW
	-exercise time by DOW
	-exercise calories/hour by DOW
	-frequently skipped exercise day of the week
-graph general trends
	-trend of steps and general weather patterns (avg temp per week)
